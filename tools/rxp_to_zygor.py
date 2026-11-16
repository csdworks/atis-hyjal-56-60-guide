"""Generate the Zygor version of Ati's Hyjal guide from the RestedXP version.

The RXP file is the source of truth. This script reads it, looks up NPC, item and
object IDs in QuestieDB (via qdb.py), and writes a Zygor Guides Viewer guide.

Usage:
    python tools/rxp_to_zygor.py RestedXP/AtisHyjalGuide_RXP/AtisHyjalGuide_RXP.lua \
        Zygor/AtisHyjalGuide_Zygor/AtisHyjalGuide_Zygor.lua
"""
import os, re, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import qdb

ZONES = {616: "Mount Hyjal", 493: "Moonglade", 361: "Felwood", 618: "Winterspring", 28: "Western Plaguelands"}
TITLE_ROOT = "Leveling Guides\\\\Ati's Hyjal 56-60 Guide\\\\"
# Breadcrumbs the player may or may not be carrying when they arrive.
BREADCRUMBS = {91952, 92842}
# Optional turn-ins that shouldn't block the step if not ready yet.
READY_ONLY = set()
# Creature objectives you interact with rather than kill (Escaped Sheep, Fraxinus' poultice).
CLICKNPC = {265962, 248366}

_cache = {}
def get(kind, i):
    if (kind, i) not in _cache:
        _cache[(kind, i)] = getattr(qdb, kind)(i)
    return _cache[(kind, i)]

def s(x):
    return x.decode("utf-8", "replace") if isinstance(x, bytes) else x

def grp(g, i):
    if g is None: return []
    if isinstance(g, dict): return g.get(i) or []
    return g[i - 1] if len(g) >= i and g[i - 1] else []

def first_spawn(e):
    sp = (e or {}).get("spawns") or {}
    if not isinstance(sp, dict): return None
    for z in (616, 493, 361, 618, 28):
        if sp.get(z): return z, sp[z][0][0], sp[z][0][1]
    return None

def clean(text):
    text = re.sub(r"\|c(?:RXP_[A-Z]+_|[Ff]{2}[0-9a-fA-F]{6})", "", text)
    text = text.replace("|r", "")
    return re.sub(r"\s+", " ", text).strip()

def gotostr(loc):
    if not loc: return ""
    z, x, y = loc
    return f" |goto {ZONES.get(z, z) if isinstance(z, int) else z} {x:.2f},{y:.2f}"

def quest_name(q):
    return s(get("quest", q)["name"])

def objectives(q):
    """Flattened objective list in quest-log order: creatures/objects first, then items."""
    ob = get("quest", q)["objectives"] or []
    out = []
    for o in grp(ob, 1): out.append(("kill", "npc", o[0]))
    for o in grp(ob, 2): out.append(("click", "obj", o[0]))
    for o in grp(ob, 3): out.append(("collect", "item", o[0]))
    return out

def giver(q, ending):
    """Return (verb, name, id, loc) for whoever starts/ends quest q."""
    d = get("quest", q)
    g = d["finishedBy"] if ending else d["startedBy"]
    for n in grp(g, 1):
        e = get("npc", n)
        if e: return "talk", s(e["name"]), n, first_spawn(e)
    for o in grp(g, 2):
        e = get("obj", o)
        if e: return "click", s(e["name"]), o, first_spawn(e)
    return None

def parse_guides(text):
    guides = []
    for block in re.findall(r"RXPGuides\.RegisterGuide\(GROUP, \[\[(.*?)\]\]\)", text, re.S):
        header, *steps = re.split(r"^step\s*$", block, flags=re.M)
        name = re.search(r"^#name (.+)$", header, re.M).group(1).strip()
        nxt = re.search(r"^#next (.+)$", header, re.M)
        guides.append({"name": name, "next": nxt.group(1).strip() if nxt else None,
                       "steps": [[l.strip() for l in st.strip().splitlines() if l.strip()] for st in steps]})
    return guides

def zygor_title(rxp_name):
    m = re.match(r"(\d+)-(\d+) (.+)", rxp_name)
    return f"{TITLE_ROOT}{m.group(3)} ({m.group(1)}-{m.group(2)})"

def convert_step(lines, pending_tips):
    tags = {l for l in lines if l.startswith("#")}
    if "#sticky" in tags:
        pending_tips.extend(clean(l[2:]) for l in lines if l.startswith(">>"))
        return None
    cw = next((t for t in tags if t.startswith("#completewith ")), None)
    if cw:
        # Non-blocking side pickup: becomes an optional goal on each following step
        opt = []
        for l in lines:
            m = re.match(r"\.accept (\d+)", l)
            if m:
                q = int(m.group(1)); g = giver(q, False)
                opt.append(f"accept {quest_name(q)}##{q}{gotostr(g[3]) if g and g[3] else ''} |opt")
        opt += [f"|tip {clean(l[2:])}" for l in lines if l.startswith(">>")]
        return ("OPTIONAL", cw.split(None, 1)[1].strip(), opt)
    loc = None
    only = None
    tips = [clean(l[2:]) for l in lines if l.startswith(">>")]
    # "Talk to X" adds nothing next to Zygor's own talk line
    tips = [t for t in tips if not re.fullmatch(r"Talk to [^.,]+?( and [^.,]+)?", t)]
    goals = []          # list of (talk_key or None, line)
    talks = {}          # (verb,name,id) -> list of lines
    order = []

    for l in lines:
        m = re.match(r"\.goto ([^,]+),([\d.]+),([\d.]+)", l)
        if m: loc = (m.group(1), float(m.group(2)), float(m.group(3)))
        m = re.match(r"\.isOnQuest (\d+)", l)
        if m: only = f"haveq({m.group(1)})"
        m = re.match(r"\.reputation (\d+),(\w+),<0,1", l)
        if m:
            cond = f"rep({m.group(1)})>={m.group(2).capitalize()}"
            only = f"{only} and {cond}" if only else cond

    def need(q):
        nonlocal only
        cond = f"haveq({q})"
        only = f"{only} and {cond}" if only else cond

    def add(key, line):
        if key not in talks:
            talks[key] = []; order.append(key)
        talks[key].append(line)

    for l in lines:
        m = re.match(r"\.(accept|turnin) (-?\d+)", l)
        if m:
            kind, q = m.group(1), int(m.group(2))
            if q < 0:  # RXP skip-if-missing
                q = -q; need(q)
            if kind == "accept" and "#optional" in tags and q in BREADCRUMBS:
                return None  # optional out-of-zone breadcrumb pickup: skip in Zygor
            g = giver(q, kind == "turnin")
            line = f"{kind} {quest_name(q)}##{q}"
            gl = g[3] if g and g[3] else None
            line += gotostr(gl) if gl else (gotostr_rxp(loc) if loc else "")
            if kind == "turnin" and q in BREADCRUMBS:
                line += f" |only if haveq({q}) or completedq({q})"
            if kind == "turnin" and q in READY_ONLY:
                line += f" |only if readyq({q})"
            add((g[0], g[1], g[2]) if g else None, line)
            continue
        m = re.match(r"\.complete (-?\d+),(\d+)", l)
        if m:
            q, i = int(m.group(1)), int(m.group(2))
            if q < 0:  # RXP skip-if-missing
                q = -q; need(q)
            objs = objectives(q)
            where = gotostr_rxp(loc) if loc else ""
            if i <= len(objs):
                verb, kind, oid = objs[i - 1]
                e = get(kind, oid)
                nm = s(e["name"]) if e else f"objective {i}"
                if verb == "kill" and oid in CLICKNPC:
                    line = f"clicknpc {nm}##{oid} |q {q}/{i}{where}"
                elif verb == "click":
                    line = f"click {nm}##{oid} |q {q}/{i}{where}"
                else:
                    line = f"{verb} {nm}##{oid} |q {q}/{i}{where}"
            else:
                txt = s((get("quest", q)["objText"] or [b""])[0]) or f"Complete {quest_name(q)}"
                line = f"{txt} |q {q}/{i}{where}"
            add(None, line)
            continue
        m = re.match(r"\.use (\d+)", l)
        if m:
            it = get("item", int(m.group(1)))
            add(None, f"use {s(it['name']) if it else 'Item'}##{m.group(1)}")
            continue
        m = re.match(r"\.fp (.+?) >>", l)
        if m:
            add(None, f"fpath {m.group(1)}{gotostr_rxp(loc) if loc else ''}")
            continue
        m = re.match(r"\.fly (\S+)", l)
        if m:
            add(None, f"fly {m.group(1)}")
            continue
        if l.startswith(".home"):
            add(None, f"Set your Hearthstone here (optional) |confirm{gotostr_rxp(loc) if loc else ''}")
            continue
        m = re.match(r"\.zone (.+?) >>", l)
        if m:
            add(None, f"Travel to {m.group(1)} |complete zone(\"{m.group(1)}\")")
            continue
        m = re.match(r"\.xp (\d+)", l)
        if m:
            add(None, f"ding {m.group(1)}")
            continue

    if not order:
        return None
    out = ["step"]
    first_goal = True
    for key in order:
        if key and key[0] == "talk":
            out.append(f"talk {key[1]}##{key[2]}")
        elif key and key[0] == "click":
            out.append(f"click {key[1]}")
        for line in talks[key]:
            out.append(line)
            if first_goal:
                for t in pending_tips + tips:
                    out.append(f"|tip {t}")
                pending_tips.clear()
                first_goal = False
    if only:
        out.append(f"|only if {only}")
    return "\n".join(out)

def gotostr_rxp(loc):
    z, x, y = loc
    return f" |goto {z} {x:.2f},{y:.2f}"

def main(src, dst):
    guides = parse_guides(open(src, encoding="utf-8").read())
    parts = ['-- Ati\'s Hyjal 56-60 Guide - Zygor Compatible',
             '-- GENERATED by tools/rxp_to_zygor.py from the RestedXP version. Edit that file, then regenerate.',
             '',
             'local ZygorGuidesViewer = ZygorGuidesViewer',
             'if not ZygorGuidesViewer then return end',
             'if UnitFactionGroup("player") ~= "Alliance" then return end',
             '']
    for g in guides:
        pending, steps, optional = [], [], None
        for raw in g["steps"]:
            label = next((l.split(None, 1)[1].strip() for l in raw if l.startswith("#label ")), None)
            if optional and label == optional[1]:
                optional = None
            st = convert_step(raw, pending)
            if isinstance(st, tuple):
                optional = st
                continue
            if not st:
                continue
            if optional:
                body_lines = st.split("\n")
                tail = [body_lines.pop()] if body_lines[-1].startswith("|only if") else []
                st = "\n".join(body_lines + optional[2] + tail)
                # show the explanatory tip only on the first step it's attached to
                optional = (optional[0], optional[1], [x for x in optional[2] if not x.startswith("|tip")])
            steps.append(st)
        header = [f'author="Ati"', f'description="Ati\'s Alliance route through Mount Hyjal: {g["name"].split(" ", 1)[1]}."']
        if g["next"]:
            header.append(f'next="{zygor_title(g["next"])}"')
        body = "\n".join(steps)
        parts.append(f'ZygorGuidesViewer:RegisterGuide("{zygor_title(g["name"])}",{{\n' + ",\n".join(header) + f",\n}},[[\n{body}\n]])\n")
    text = "\n".join(parts)
    assert "]]" not in "".join(re.findall(r"\[\[(.*?)\]\]\)", text, re.S)), "nested ]] in guide body"
    os.makedirs(os.path.dirname(os.path.abspath(dst)), exist_ok=True)
    open(dst, "w", encoding="utf-8", newline="\n").write(text)
    print(f"wrote {dst}: {len(guides)} guides, {text.count(chr(10) + 'step')} steps")

if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
