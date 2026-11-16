"""Check an RXP guide file: quest IDs exist, no Horde-only quests, prerequisites come first.

Usage: python tools/validate.py RestedXP/AtisHyjalGuide_RXP/AtisHyjalGuide_RXP.lua
"""
import sys, re, os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import qdb
txt = open(sys.argv[1], encoding='utf-8').read()
events = re.findall(r'^\s*\.(accept|turnin|complete)\s+(-?\d+)', txt, re.M)
done, accepted, problems = set(), set(), []
OUTSIDE = {92842}  # optional breadcrumbs picked up outside the route
for kind, q in events:
    optional = q.startswith('-')  # RXP: negative ID = skip if not on the quest
    q = abs(int(q)); d = qdb.quest(q)
    if not d: problems.append(f"{q}: not in DB"); continue
    nm = d['name'].decode()
    if d['races'] == 8589934770: problems.append(f"{q} {nm}: Horde-only")
    if kind == 'accept':
        ps, pg = d['preSingle'] or [], d['preGroup'] or []
        if ps and not (set(ps) & done): problems.append(f"accept {q} {nm}: needs one of {ps} first")
        miss = [p for p in pg if p not in done]
        if miss: problems.append(f"accept {q} {nm}: still needs {miss}")
        accepted.add(q)
    elif kind == 'turnin':
        if q not in accepted and q not in OUTSIDE and not optional: problems.append(f"turnin {q} {nm}: never accepted")
        done.add(q)
    elif kind == 'complete' and q not in accepted and not optional:
        problems.append(f"complete {q} {nm}: not accepted yet")
left = sorted(accepted - done)
print("quests accepted:", len(accepted), "turned in:", len(done))
print("accepted but never turned in:", [(q, qdb.quest(q)['name'].decode()) for q in left])
print("\n".join(problems) or "no ordering problems")
