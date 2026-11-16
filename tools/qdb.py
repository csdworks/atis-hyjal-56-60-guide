"""Minimal reader for QuestieDB's baked TOC metadata (base64 CBOR rows)."""
import base64, re, struct, sys, json, zlib, pickle, os

# Point QUESTIEDB_TOC at your QuestieDB_Forever.toc if WoW is installed elsewhere.
TOC = os.environ.get("QUESTIEDB_TOC") or r"C:\Program Files (x86)\World of Warcraft\_forever_\Interface\AddOns\QuestieDB\QuestieDB_Forever.toc"
CACHE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "qdb_cache.pkl")


def cbor(b, i=0):
    ib = b[i]; mt, ai = ib >> 5, ib & 31; i += 1
    if ai < 24: val = ai
    elif ai == 24: val = b[i]; i += 1
    elif ai == 25: val = struct.unpack(">H", b[i:i+2])[0]; i += 2
    elif ai == 26:
        if mt == 7: return struct.unpack(">f", b[i:i+4])[0], i + 4
        val = struct.unpack(">I", b[i:i+4])[0]; i += 4
    elif ai == 27:
        if mt == 7: return struct.unpack(">d", b[i:i+8])[0], i + 8
        val = struct.unpack(">Q", b[i:i+8])[0]; i += 8
    else: raise ValueError(f"unsupported ai {ai}")
    if mt == 0: return val, i
    if mt == 1: return -1 - val, i
    if mt in (2, 3):
        s = b[i:i+val]; return (s.decode("utf-8", "replace") if mt == 3 else s), i + val
    if mt == 4:
        out = []
        for _ in range(val):
            v, i = cbor(b, i); out.append(v)
        return out, i
    if mt == 5:
        out = {}
        for _ in range(val):
            k, i = cbor(b, i); v, i = cbor(b, i); out[k] = v
        return out, i
    if mt == 7:
        if ai == 25:  # half float
            h = val; s = (h >> 15) & 1; e = (h >> 10) & 31; f = h & 1023
            v = (f / 1024) * 2 ** -14 if e == 0 else (float("inf") if e == 31 else (1 + f / 1024) * 2 ** (e - 15))
            return (-v if s else v), i
        return {20: False, 21: True, 22: None}.get(val), i
    if mt == 6:
        return cbor(b, i)
    raise ValueError(mt)


def dec(s):
    return cbor(base64.b64decode(s + "=" * (-len(s) % 4)))[0]


def load():
    if os.path.exists(CACHE):
        return pickle.load(open(CACHE, "rb"))
    kv = {}
    for line in open(TOC, encoding="utf-8", errors="replace"):
        if line.startswith("## X-"):
            k, _, v = line[5:].rstrip("\n").partition(": ")
            kv[k] = v
    pickle.dump(kv, open(CACHE, "wb"))
    return kv


KV = load()


def stored(key):
    v = KV.get(key)
    if v and v.startswith("~"):
        n = int(v.strip("~"))
        v = "".join(KV[f"{key}-{j}"] for j in range(1, n + 1))
    return v


def ids(prefix):
    raw = base64.b64decode(stored(f"{prefix}-IDS"))
    return cbor(zlib.decompress(raw))[0] if raw[:1] == b"x" else cbor(raw)[0]


def fld(row, idx):
    if isinstance(row, list):
        return row[idx - 1] if len(row) >= idx else None
    return row.get(idx) if row else None


def entity(prefix, eid, fields):
    s = stored(f"{prefix}-{eid}-S")
    if s is None:
        return None
    row = dec(s)
    out = {}
    for name, idx, typ in fields:
        if typ == "table":
            t = stored(f"{prefix}-{eid}-{idx}")
            out[name] = dec(t) if t else None
        else:
            out[name] = fld(row, idx)
    return out


QF = [("name", 1, "s"), ("startedBy", 2, "table"), ("finishedBy", 3, "table"), ("reqLvl", 4, "n"),
      ("lvl", 5, "n"), ("races", 6, "n"), ("classes", 7, "n"), ("objText", 8, "table"),
      ("triggerEnd", 9, "table"), ("objectives", 10, "table"), ("srcItem", 11, "n"),
      ("preGroup", 12, "table"), ("preSingle", 13, "table"), ("children", 14, "table"),
      ("exclusiveTo", 16, "table"), ("zone", 17, "n"), ("next", 22, "n"), ("special", 24, "n"),
      ("breadcrumbFor", 27, "n"), ("extraObj", 29, "table")]
NF = [("name", 1, "s"), ("minLevel", 4, "n"), ("maxLevel", 5, "n"), ("spawns", 7, "table"),
      ("zone", 9, "n"), ("starts", 10, "table"), ("ends", 11, "table"), ("friendly", 13, "s"), ("sub", 14, "s")]
OF = [("name", 1, "s"), ("spawns", 4, "table"), ("zone", 5, "n")]
IF = [("name", 1, "s")]

quest = lambda i: entity("Quest", i, QF)
npc = lambda i: entity("Npc", i, NF)
obj = lambda i: entity("Object", i, OF)
item = lambda i: entity("Item", i, IF)
