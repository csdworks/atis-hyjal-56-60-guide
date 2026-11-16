[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-support-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=black)](https://buymeacoffee.com/atigames)

# Ati's Hyjal 56-60 Guide

An Alliance leveling route through WoW Forever's **Mount Hyjal**. It comes in two versions with the same route:

| Version | Addon folder | Needs |
|---|---|---|
| **RestedXP Compatible** | `RestedXP/AtisHyjalGuide_RXP` | RestedXP Guides (`RXPGuides`) |
| **Zygor Compatible** | `Zygor/AtisHyjalGuide_Zygor` | Zygor Guides Viewer (Forever) |

> **Status: first draft (v0.1.0), not yet tested in game.** Quest IDs, NPCs and coordinates come from the QuestieDB Forever database. The route order has been checked against each quest's prerequisites.

## Install

1. Download this repo (**Code → Download ZIP**) and unzip it.
2. Copy the addon folder you want, or both, into:
   ```
   World of Warcraft\_forever_\Interface\AddOns\
   ```
3. Restart the game.
   - **RestedXP:** open the guide list and pick **Ati's Hyjal 56-60 Guide - RestedXP Compatible**.
   - **Zygor:** open the guide menu and go to **Leveling Guides → Ati's Hyjal 56-60 Guide**.

## Route

| Part | Area | Main quest givers |
|---|---|---|
| 56–57 Tainted Foothills | South of the zone | Ketharas, Fraxinus & Hyacinth, the Curious Crow, Felflick |
| 57–58 Moonglade & Wild Gods | Nighthaven, then the Cradle of Tranquility | Dendrite Starblaze, Orokai, Jereman, Kala'th, Marrosis |
| 58–59 Elderwild & Barkskin Burrow | West of the zone | Sefira Everbright, Barkskin furbolgs, Fenwick Togglespring |
| 59–60 Shrine, Dae'gun & Summit | Centre, north, then the summit | Phoebe & Omnuron, Johun Dillas, Elaena, Tiala Whitemane |

The route covers 116 quests and about 423,000 quest XP, plus XP from kills. It ends with one turn-in in Stormwind (*A Shaw Deal*). If you're short of 60 at the end, finish with mobs in Dae'gun or the Blackthorne camp.

### Left out on purpose

- **Kaylaena's Everlook chain** (*Premiere Parts* → … → *Drum Up Trouble*). It needs a trip to Everlook and a timed delivery back.
- **Sebelia's mail run** to Everlook.
- **The veteran's out-of-zone quests** (*Lifted by Legacy*, *Wake Memories*, *Praise*, *Ends Meet*, *Soldier's Solace*).
- **Windswept Wards**, **Belle's Ring** (the Elwynn delivery), **Unsealing Blackthorne Pact**, **Now We're Cooking**, **Return to Jereman** and **Burrow Bonding**.

## For contributors

The **RestedXP file is the source of truth**. The Zygor file is generated from it, so don't edit the Zygor file by hand.

```sh
# check quest IDs and prerequisite order
python tools/validate.py RestedXP/AtisHyjalGuide_RXP/AtisHyjalGuide_RXP.lua

# regenerate the Zygor version
python tools/rxp_to_zygor.py RestedXP/AtisHyjalGuide_RXP/AtisHyjalGuide_RXP.lua Zygor/AtisHyjalGuide_Zygor/AtisHyjalGuide_Zygor.lua
```

Both scripts read your local QuestieDB install. Set `QUESTIEDB_TOC` if WoW isn't in the default location.

RXP's Forever map table has no "Mount Hyjal" entry yet. The RXP addon registers it as uiMapID 2482 so `.goto Mount Hyjal,x,y` works.

---

Fan-made. Not affiliated with Blizzard Entertainment, RestedXP or Zygor Guides.
