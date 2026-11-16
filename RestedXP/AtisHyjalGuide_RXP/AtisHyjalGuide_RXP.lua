-- Ati's Hyjal 56-60 Guide - RestedXP Compatible
-- Alliance leveling route through WoW Forever's Mount Hyjal.
-- Quest IDs, NPCs and coordinates come from the QuestieDB Forever database.
-- First draft: not yet tested in game.

if UnitFactionGroup("player") == "Horde" then return end

-- RXP's Forever map table has no entry for Mount Hyjal yet, so register it
-- here so `.goto Mount Hyjal,x,y` and `.zone Mount Hyjal` resolve (uiMapID 2482).
if RXP and RXP.mapId and not RXP.mapId["Mount Hyjal"] then
    RXP.mapId["Mount Hyjal"] = 2482
end

local GROUP = "Ati's Hyjal 56-60 Guide - RestedXP Compatible"

-------------------------------------------------------------------------------
-- 1) 56-57 Tainted Foothills
-------------------------------------------------------------------------------
RXPGuides.RegisterGuide(GROUP, [[
#forever
#version 1
<< Alliance
#name 56-57 Tainted Foothills
#next 57-58 Moonglade & Barkskin Burrow

step
    #optional
    .goto Felwood,51.21,82.11
    >>Optional breadcrumb: talk to |cRXP_FRIENDLY_Greta Mosshoof|r at the Emerald Sanctuary
    .accept 91952 >>Accept The Source of the Corruption
    .target Greta Mosshoof
step
    .zone Mount Hyjal >>Travel to |cFFfa9602Mount Hyjal|r. The Tainted Foothills are the southern part of the zone.
step
    .goto Mount Hyjal,73.34,81.88
    >>Talk to |cRXP_FRIENDLY_Ketharas|r inside his cave
    .turnin 91952 >>Turn in The Source of the Corruption
    .accept 95568 >>Accept Seeds for a New Season
    .accept 95569 >>Accept Hope for Hatchlings
    .target Ketharas
step
    .goto Mount Hyjal,75.3,77.4
    >>Click the |cRXP_PICK_Loose Cog|r on the ground north of the cave
    .accept 94479 >>Accept One Person's Trash
step
    #optional
    .isOnQuest 92842
    .goto Mount Hyjal,79.85,70.69
    >>Talk to |cRXP_FRIENDLY_Quintus Wainworth|r
    .turnin 92842 >>Turn in A Cousin Abroad
    .target Quintus Wainworth
step
    .goto Mount Hyjal,79.85,70.69
    >>Talk to |cRXP_FRIENDLY_Quintus Wainworth|r
    .accept 96833 >>Accept Venom Maws
    .target Quintus Wainworth
step
    >>Loot |cRXP_LOOT_Untainted Seeds|r and rescue |cRXP_LOOT_Hyjal Owl Eggs|r around the Tainted Foothills
    .complete 95568,1
    .complete 95569,1
step
    .goto Mount Hyjal,73.34,81.88
    >>Talk to |cRXP_FRIENDLY_Ketharas|r
    .turnin 94479 >>Turn in One Person's Trash
    .turnin 95568 >>Turn in Seeds for a New Season
    .turnin 95569 >>Turn in Hope for Hatchlings
    .turnin 96833 >>Turn in Venom Maws
    .accept 96796 >>Accept Woods Workshop
    .accept 93747 >>Accept Violence Into Verdure
    .accept 93759 >>Accept The Bounty of Nature
    .target Ketharas
step
    .goto Mount Hyjal,70.2,72.7
    >>Kill untainted |cRXP_ENEMY_Hyjal Stags|r for |cRXP_LOOT_Hyjal Venison Cuts|r and dig up |cRXP_LOOT_Scarlet Dart Tubers|r
    >>Plant the |cRXP_PICK_Enchanted Seeds|r next to the Ruined Ballista, the Ruined Catapult and the Ruined Flying Machine
    .complete 93759,1
    .complete 93759,2
    .complete 93747,1
    .mob Hyjal Stag
step
    .goto Mount Hyjal,73.34,81.88
    >>Talk to |cRXP_FRIENDLY_Ketharas|r
    .turnin 93747 >>Turn in Violence Into Verdure
    .turnin 93759 >>Turn in The Bounty of Nature
    .accept 95611 >>Accept Rites of Respect
    .target Ketharas
step
    >>Bury the remains at Ketharas' shrine
    .complete 95611,1
step
    .goto Mount Hyjal,73.34,81.88
    >>Talk to |cRXP_FRIENDLY_Ketharas|r
    .turnin 95611 >>Turn in Rites of Respect
    .accept 90487 >>Accept Ancient Allies
    .target Ketharas
step
    .goto Mount Hyjal,60.1,61.2
    >>Head north to |cRXP_FRIENDLY_Kaylaena Springwhisper|r at her workshop
    .turnin 96796 >>Turn in Woods Workshop
    .accept 92594 >>Accept Kindling, Kinda
    .target Kaylaena Springwhisper
step
    .goto Mount Hyjal,53.4,84.3
    >>Head west to the ancients' outpost and talk to |cRXP_FRIENDLY_Fraxinus|r
    .turnin 90487 >>Turn in Ancient Allies
    .target Fraxinus
step
    .goto Mount Hyjal,54.0,84.4
    >>Talk to |cRXP_FRIENDLY_Hyacinth|r
    .accept 91754 >>Accept Rub Some Dirt In It
    .accept 91755 >>Accept Leaves to Ligatures
    .target Hyacinth
step
    .goto Mount Hyjal,54.8,84.6
    >>Talk to |cRXP_FRIENDLY_Thylaen|r
    .accept 91923 >>Accept Celastrus the Bitter
    .target Thylaen
step
    .goto Mount Hyjal,54.5,83.8
    >>Talk to |cRXP_FRIENDLY_Bluebell|r to get the flight path
    .fp Tainted Foothills >>Get the Tainted Foothills flight path
    .target Bluebell
step
    .goto Mount Hyjal,63.0,70.8
    >>Destroy |cRXP_ENEMY_Tainted Shrubbery|r and loot |cRXP_LOOT_Verdant Leaves|r from them. Pick up |cRXP_LOOT_Untainted Soil|r as you go.
    .complete 92594,1
    .complete 91755,1
    .complete 91754,1
    .mob Tainted Shrubbery
step
    .goto Mount Hyjal,65.7,71.6
    >>Kill |cRXP_ENEMY_Celastrus the Bitter|r and loot its |cRXP_LOOT_Broken Frond|r
    .complete 91923,1
    .mob Celastrus the Bitter
step
    .goto Mount Hyjal,54.0,84.4
    >>Talk to |cRXP_FRIENDLY_Hyacinth|r and |cRXP_FRIENDLY_Thylaen|r
    .turnin 91754 >>Turn in Rub Some Dirt In It
    .turnin 91755 >>Turn in Leaves to Ligatures
    .accept 91770 >>Accept Bark Bite
    .turnin 91923 >>Turn in Celastrus the Bitter
    .target Hyacinth
    .target Thylaen
step
    .goto Mount Hyjal,53.4,84.3
    >>Apply the poultice to |cRXP_FRIENDLY_Fraxinus|r, then talk to him
    .complete 91770,1
    .turnin 91770 >>Turn in Bark Bite
    .accept 92959 >>Accept The Dying Ancients
    .accept 95766 >>Accept Fine Feathered Friend
    .target Fraxinus
step
    .goto Mount Hyjal,63.3,74.1
    >>Kill the corrupted ancient |cRXP_ENEMY_Sunderbark|r, then plant the seed in his remains. He walks around the foothills east of the outpost.
    .complete 92959,1
    .mob Sunderbark
step
    .goto Mount Hyjal,53.4,84.3
    >>Talk to |cRXP_FRIENDLY_Fraxinus|r
    .turnin 92959 >>Turn in The Dying Ancients
    .target Fraxinus
step
    .goto Mount Hyjal,48.3,85.7
    >>Find the |cRXP_FRIENDLY_Curious Crow|r on the southwest slope
    .turnin 95766 >>Turn in Fine Feathered Friend
    .accept 95317 >>Accept Notation, Notation, Notation
    .accept 95320 >>Accept A Curious Question
    .target Curious Crow
step
    .goto Mount Hyjal,48.6,73.5
    >>Find the imprisoned demon |cRXP_FRIENDLY_Felflick|r
    .turnin 95320 >>Turn in A Curious Question
    .accept 95318 >>Accept Taste of Ash
    .target Felflick
step
    .goto Mount Hyjal,46.8,72.6
    >>Kill |cRXP_ENEMY_Ashen Acolytes|r. Loot their |cRXP_LOOT_Fel Ash Experimentation Notes|r.
    .complete 95318,1
    .complete 95317,1
    .mob Ashen Acolyte
step
    .goto Mount Hyjal,48.6,73.5
    >>Talk to |cRXP_FRIENDLY_Felflick|r
    .turnin 95318 >>Turn in Taste of Ash
    .accept 95319 >>Accept Crystalline Collection
    .target Felflick
step
    >>Gather |cRXP_LOOT_Fel-Slime Crystals|r and a |cRXP_LOOT_Pristine Fel-Slime Crystal|r near Felflick
    .complete 95319,1
    .complete 95319,2
step
    .goto Mount Hyjal,48.6,73.5
    >>Talk to |cRXP_FRIENDLY_Felflick|r
    .turnin 95319 >>Turn in Crystalline Collection
    .accept 95378 >>Accept The Hydra's Head
    .accept 95379 >>Accept A Revenge So Sweet
    .target Felflick
step
    .goto Mount Hyjal,48.3,85.7
    >>Head south to the |cRXP_FRIENDLY_Curious Crow|r
    .turnin 95317 >>Turn in Notation, Notation, Notation
    .accept 95380 >>Accept A Prolific Source
    .accept 96262 >>Accept Prickly Pinecones
    .target Curious Crow
step
    .goto Mount Hyjal,48.4,77.8
    >>Kill |cRXP_ENEMY_Noxious Slimes|r around the slime pools for |cRXP_LOOT_Fel-Slime Ooze|r
    >>Collect |cRXP_LOOT_Prickly Pinecones|r from under the healthy trees
    .complete 95380,1
    .complete 96262,1
    .mob Noxious Slime
step
    .goto Mount Hyjal,45.6,69.9
    >>Kill the three warlocks |cRXP_ENEMY_Tyaeha Darkoath|r, |cRXP_ENEMY_Dazka Shadowsleep|r and |cRXP_ENEMY_Frezzlie Popwhiz|r and loot their bones
    >>Kill |cRXP_ENEMY_Brashann Grimdark|r and search his body for his soulstone
    .complete 95378,1
    .complete 95378,2
    .complete 95378,3
    .complete 95379,1
    .mob Tyaeha Darkoath
    .mob Dazka Shadowsleep
    .mob Frezzlie Popwhiz
    .mob Brashann Grimdark
step
    .goto Mount Hyjal,48.6,73.5
    >>Talk to |cRXP_FRIENDLY_Felflick|r
    .turnin 95378 >>Turn in The Hydra's Head
    .turnin 95379 >>Turn in A Revenge So Sweet
    .accept 96435 >>Accept A Fitting End
    .target Felflick
step
    .goto Mount Hyjal,40.8,80.2
    >>Throw the warlock bones onto the |cRXP_PICK_Bone Pile|r near the slime pools, then click it again
    .turnin 96435 >>Turn in A Fitting End
    .accept 96255 >>Accept Amalgamated Marrow
step
    .goto Mount Hyjal,40.0,78.3
    >>Kill the |cRXP_ENEMY_Awakened Fel Ash Slime|r
    .complete 96255,1
    .mob Awakened Fel Ash Slime
step
    .goto Mount Hyjal,36.7,78.3
    >>Talk to the Wild God |cRXP_FRIENDLY_Velician|r
    .accept 96321 >>Accept The Dying God
    .target Velician
step
    .goto Mount Hyjal,48.6,73.5
    >>Talk to |cRXP_FRIENDLY_Felflick|r
    .turnin 96255 >>Turn in Amalgamated Marrow
    .accept 96322 >>Accept A Revenge Now Bitter
    .target Felflick
step
    .goto Mount Hyjal,48.3,85.7
    >>Talk to the |cRXP_FRIENDLY_Curious Crow|r
    .turnin 96322 >>Turn in A Revenge Now Bitter
    .turnin 95380 >>Turn in A Prolific Source
    .turnin 96262 >>Turn in Prickly Pinecones
    .turnin 96321 >>Turn in The Dying God
    .accept 95316 >>Accept The Experimental Method
    .accept 96131 >>Accept An Oldstone But An Old Friend
    .target Curious Crow
step
    .goto Mount Hyjal,47.0,72.0
    >>Use the pinecones to destroy the |cRXP_PICK_Ashen Reign workstations|r in the cultist camp
    .complete 95316,1
step
    .goto Mount Hyjal,48.3,85.7
    >>Talk to the |cRXP_FRIENDLY_Curious Crow|r
    .turnin 95316 >>Turn in The Experimental Method
    .accept 91881 >>Accept The Western Post
    .target Curious Crow
]])

-------------------------------------------------------------------------------
-- 2) 57-58 Moonglade & Barkskin Burrow
-------------------------------------------------------------------------------
RXPGuides.RegisterGuide(GROUP, [[
#forever
#version 1
<< Alliance
#name 57-58 Moonglade & Barkskin Burrow
#next 58-59 Elderwild & Wild Gods

step
    .goto Mount Hyjal,73.34,81.88
    >>Return to |cRXP_FRIENDLY_Ketharas|r with the Faintly Glowing Branch
    .turnin 96131 >>Turn in An Oldstone But An Old Friend
    .accept 92612 >>Accept Aid from Moonglade
    .target Ketharas
step
    .goto Mount Hyjal,54.5,83.8
    .fly Nighthaven >>Fly to Nighthaven, Moonglade. If you don't have the flight path, travel there through Timbermaw Hold.
step
    .goto Moonglade,56.21,30.64
    >>Talk to |cRXP_FRIENDLY_Dendrite Starblaze|r
    .turnin 92612 >>Turn in Aid from Moonglade
    .accept 96209 >>Accept The Ancient, Orokai
    .target Dendrite Starblaze
step
    .goto Moonglade,41.45,43.63
    >>Talk to the ancient |cRXP_FRIENDLY_Orokai|r
    .turnin 96209 >>Turn in The Ancient, Orokai
    .accept 95006 >>Accept Stolen Power
    .target Orokai
step
    .goto Moonglade,41.45,43.63
    >>Talk to |cRXP_FRIENDLY_Orokai|r again to hear what he learned from the branch
    .complete 95006,1
    .target Orokai
step
    .goto Moonglade,56.21,30.64
    >>Talk to |cRXP_FRIENDLY_Dendrite Starblaze|r
    .turnin 95006 >>Turn in Stolen Power
    .accept 93773 >>Accept The Pact
    .target Dendrite Starblaze
step
    .zone Mount Hyjal >>Fly back to the Tainted Foothills
step
    .goto Mount Hyjal,73.34,81.88
    >>Talk to |cRXP_FRIENDLY_Ketharas|r
    .turnin 93773 >>Turn in The Pact
    .accept 96930 >>Accept The Capricious Corvid
    .accept 92171 >>Accept Taking to New Heights
    .target Ketharas
step
    .goto Mount Hyjal,48.3,85.7
    >>Stop at the |cRXP_FRIENDLY_Curious Crow|r on your way west. Keep Heading Up the Mountain for later.
    .turnin 96930 >>Turn in The Capricious Corvid
    .accept 96931 >>Accept Heading Up the Mountain
    .target Curious Crow
step
    .goto Mount Hyjal,25.3,75.9
    >>Head west and find |cRXP_FRIENDLY_Fenwick Togglespring|r stuck up in a tree east of Barkskin Burrow
    .accept 92702 >>Accept Branch Out
    .target Fenwick Togglespring
step
    >>Find a |cRXP_LOOT_Sturdy Tree Branch|r nearby
    .complete 92702,1
step
    .goto Mount Hyjal,25.3,75.9
    >>Talk to |cRXP_FRIENDLY_Fenwick Togglespring|r
    .turnin 92702 >>Turn in Branch Out
    .accept 92064 >>Accept Tree Free
    .target Fenwick Togglespring
step
    .goto Mount Hyjal,25.3,76.3
    >>Break the |cRXP_ENEMY_Tree Branch|r to free Fenwick
    .complete 92064,1
step
    .goto Mount Hyjal,25.3,75.9
    >>Talk to |cRXP_FRIENDLY_Fenwick Togglespring|r
    .turnin 92064 >>Turn in Tree Free
    .accept 96559 >>Accept Supply Drop
    .target Fenwick Togglespring
step
    .goto Mount Hyjal,25.5,74.6
    >>Find Fenwick's |cRXP_PICK_Personal Survival Pack|r
    .turnin 96559 >>Turn in Supply Drop
    .accept 93383 >>Accept Contents Under Pressure
step
    .goto Mount Hyjal,25.5,74.6
    >>Wait until it's safe, then open the |cRXP_PICK_Personal Survival Pack|r
    .complete 93383,1
    .turnin 93383 >>Turn in Contents Under Pressure
step
    .goto Mount Hyjal,20.6,71.7
    >>Head south toward Barkskin Burrow and talk to |cRXP_FRIENDLY_Brerufa|r
    .accept 93952 >>Accept Balance Through Strength
    .target Brerufa
step
    .goto Mount Hyjal,21.5,64.9
    >>Kill |cRXP_ENEMY_Deadwood Den Guardians|r
    .complete 93952,1
    .mob Deadwood Den Guardian
step
    .goto Mount Hyjal,20.6,71.7
    >>Talk to |cRXP_FRIENDLY_Brerufa|r
    .turnin 93952 >>Turn in Balance Through Strength
    .accept 92111 >>Accept Of Friend and Fur
    .target Brerufa
step
    .goto Mount Hyjal,21.08,80.19
    >>Enter Barkskin Burrow and talk to |cRXP_FRIENDLY_Osi Mistpaw|r
    .turnin 92111 >>Turn in Of Friend and Fur
    .accept 93831 >>Accept Sweetpaw Jam
    .target Osi Mistpaw
step
    >>Gather |cRXP_LOOT_Bear Berries|r around the burrow
    .complete 93831,1
step
    .goto Mount Hyjal,21.08,80.19
    >>Talk to |cRXP_FRIENDLY_Osi Mistpaw|r
    .turnin 93831 >>Turn in Sweetpaw Jam
    .accept 91697 >>Accept Meet the Elders
    .target Osi Mistpaw
step
    .goto Mount Hyjal,21.8,79.0
    >>Talk to |cRXP_FRIENDLY_Elder Mistpaw|r
    >>Elder Pinespeaker's, Fennar Mossmane's and Dala Fairmaw's quests need Neutral with Barkskin Burrow. These furbolg quests leave you about 1,100 rep short, so the guide only shows those quests if you're already Neutral.
    .turnin 91697 >>Turn in Meet the Elders
    .accept 93826 >>Accept Deal Dread to Deadwood
    .target Elder Mistpaw
step
    .goto Mount Hyjal,20.82,79.81
    >>Talk to |cRXP_FRIENDLY_Suma Mossmane|r
    .accept 93825 >>Accept Barkbound Blessings
    .target Suma Mossmane
step
    >>Around Barkskin Burrow, gather |cRXP_LOOT_Moonveil Moss|r
    .complete 93825,1
step
    .goto Mount Hyjal,21.4,64.9
    >>Go to Deadwood Den. Kill |cRXP_ENEMY_Deadwood Totemics|r and |cRXP_ENEMY_Deadwood Fel-Tenders|r.
    .complete 93826,1
    .complete 93826,2
    .mob Deadwood Totemic
    .mob Deadwood Fel-Tender
step
    .goto Mount Hyjal,31.5,58.6
    >>Deeper in the den, talk to the caged |cRXP_FRIENDLY_Barkskin Matriarch|r
    .accept 91698 >>Accept Barkskin Breakout
    .target Barkskin Matriarch
step
    .goto Mount Hyjal,31.4,57.9
    >>Kill a |cRXP_ENEMY_Deadwood Warden|r for the |cRXP_LOOT_Deadwood Key|r
    .complete 91698,1
    .mob Deadwood Warden
step
    .goto Mount Hyjal,31.5,58.6
    >>Return the key to the |cRXP_FRIENDLY_Barkskin Matriarch|r, then escort her out of the den
    .turnin 91698 >>Turn in Barkskin Breakout
    .accept 91696 >>Accept Open Season
    .complete 91696,1
    .target Barkskin Matriarch
step
    .goto Mount Hyjal,20.6,71.7
    >>Talk to |cRXP_FRIENDLY_Brerufa|r
    .turnin 91696 >>Turn in Open Season
    .target Brerufa
step
    .goto Mount Hyjal,21.77,79.37
    >>Back in Barkskin Burrow, turn in to |cRXP_FRIENDLY_Suma Mossmane|r and |cRXP_FRIENDLY_Elder Pinespeaker|r
    .turnin 93825 >>Turn in Barkbound Blessings
    .turnin 93826 >>Turn in Deal Dread to Deadwood
    .target Suma Mossmane
    .target Elder Pinespeaker
step
    .goto Mount Hyjal,21.8,79.0
    .reputation 2747,neutral,<0,1
    >>You're Neutral with Barkskin Burrow, so pick up the quests that needed it. Elder Mistpaw's Barkskin Beginnings completes straight away.
    .accept 94504 >>Accept Barkskin Beginnings
    .turnin 94504 >>Turn in Barkskin Beginnings
    .accept 93833 >>Accept Wicked Wisdom
    .accept 93828 >>Accept Herbs of the Hollow
    .accept 93830 >>Accept Water of Hyjal
    .accept 93834 >>Accept Burrow Beetles
    .target Elder Mistpaw
    .target Elder Pinespeaker
    .target Fennar Mossmane
    .target Dala Fairmaw
step
    .reputation 2747,neutral,<0,1
    >>Collect |cRXP_LOOT_Dried Hanging Herbs|r and |cRXP_LOOT_Burrow Beetle Bits|r around Barkskin Burrow
    .complete 93828,1
    .complete 93834,1
step
    .goto Mount Hyjal,34.8,73.9
    .reputation 2747,neutral,<0,1
    >>Kill |cRXP_ENEMY_Hyjal Owls|r east of the burrow for |cRXP_LOOT_Intact Owl Bodies|r
    .complete 93833,1
    .mob Hyjal Owl
step
    .goto Mount Hyjal,21.4,64.9
    .reputation 2747,neutral,<0,1
    >>Fill Fennar's waterskin at the pond outside Deadwood Den
    .complete 93830,1
step
    .goto Mount Hyjal,21.77,79.37
    .reputation 2747,neutral,<0,1
    >>Back in Barkskin Burrow, talk to |cRXP_FRIENDLY_Elder Pinespeaker|r, |cRXP_FRIENDLY_Fennar Mossmane|r and |cRXP_FRIENDLY_Dala Fairmaw|r
    .turnin 93833 >>Turn in Wicked Wisdom
    .turnin 93828 >>Turn in Herbs of the Hollow
    .turnin 93830 >>Turn in Water of Hyjal
    .turnin 93834 >>Turn in Burrow Beetles
    .target Elder Pinespeaker
    .target Fennar Mossmane
    .target Dala Fairmaw
]])

-------------------------------------------------------------------------------
-- 3) 58-59 Elderwild & Wild Gods
-------------------------------------------------------------------------------
RXPGuides.RegisterGuide(GROUP, [[
#forever
#version 1
<< Alliance
#name 58-59 Elderwild & Wild Gods
#next 59-60 Shrine, Dae'gun & Summit

step
    .goto Mount Hyjal,15.7,54.7
    >>Head north to the Alliance outpost in Elderwild and talk to |cRXP_FRIENDLY_Sefira Everbright|r
    .turnin 91881 >>Turn in The Western Post
    .accept 92449 >>Accept Blight No More
    .accept 92591 >>Accept Final Death
    .target Sefira Everbright
step
    .goto Mount Hyjal,14.5,49.6
    >>Talk to |cRXP_FRIENDLY_Caitir Flinthew|r if you want your hearthstone here
    .home >>Set your Hearthstone to Elderwild
    .target Caitir Flinthew
step
    .goto Mount Hyjal,15.6,50.0
    >>Talk to |cRXP_FRIENDLY_Hnaz Blunderflame|r
    .accept 95027 >>Accept Feathers in Flight
    .target Hnaz Blunderflame
step
    #completewith Sheep
    >>|cRXP_WARN_Keep an eye on|r |cRXP_FRIENDLY_Mirt|r (15.9, 52.7) while you hand in quests around the outpost. If he offers Ewe Wandered Off, take it.
    .accept 96674 >>Accept Ewe Wandered Off
    .target Mirt
step
    .goto Mount Hyjal,20.47,59.26
    >>Talk to the |cRXP_FRIENDLY_Veteran of the Third War|r
    >>|cRXP_WARN_He spawns in random spots around Elderwild. If he isn't here, look around the outpost.|r
    .accept 92100 >>Accept Anywhere But Here
    .target Veteran of the Third War
step
    .goto Mount Hyjal,8.7,46.5
    >>Find the |cRXP_PICK_Embroidered Scabbard|r at the overlook northwest of Elderwild
    .turnin 92100 >>Turn in Anywhere But Here
    .accept 96550 >>Accept Battle Recall
step
    .goto Mount Hyjal,8.8,46.5
    >>Use the scabbard and talk to the |cRXP_FRIENDLY_Veteran of the Third War|r to hear his story
    .turnin 96550 >>Turn in Battle Recall
    .target Veteran of the Third War
step
    .goto Mount Hyjal,22.5,48.6
    >>Click the |cRXP_PICK_Unmarked Grave|r
    .accept 90702 >>Accept Disturbed Grave
step
    .goto Mount Hyjal,18.78,62.01
    >>Talk to |cRXP_FRIENDLY_Eluneth|r
    .accept 90865 >>Accept Eyes of the Watchers
    .target Eluneth
step
    .goto Mount Hyjal,18.0,60.4
    >>Kill |cRXP_ENEMY_Forgotten Soldiers|r and |cRXP_ENEMY_Fleshflay Raveners|r. Raveners drop the |cRXP_LOOT_Ring of the Fallen Soldier|r.
    .complete 92449,1
    .complete 92449,2
    .complete 90702,1
    .mob Forgotten Soldier
    .mob Fleshflay Ravener
step
    .goto Mount Hyjal,24.5,53.8
    >>Kill |cRXP_ENEMY_Eternal Sentries|r for |cRXP_LOOT_Watcher's Eyes|r
    .complete 90865,1
    .mob Eternal Sentry
step
    .goto Mount Hyjal,26.6,55.7
    .use 274411 >>Use the |cRXP_LOOT_Survivor's Torch|r on the Bone Pile, then kill the |cRXP_ENEMY_Scourge Reanimator|r and loot its |cRXP_LOOT_Reanimator's Amulet|r
    .complete 92591,1
    .mob Scourge Reanimator
step
    .goto Mount Hyjal,18.78,62.01
    >>Talk to |cRXP_FRIENDLY_Eluneth|r
    .turnin 90865 >>Turn in Eyes of the Watchers
    .target Eluneth
step
    .goto Mount Hyjal,15.7,54.7
    >>Talk to |cRXP_FRIENDLY_Sefira Everbright|r
    .turnin 92449 >>Turn in Blight No More
    .turnin 92591 >>Turn in Final Death
    .turnin 90702 >>Turn in Disturbed Grave
    .accept 90750 >>Accept More Work?
    .accept 91688 >>Accept To the Summit of Eternity
    .target Sefira Everbright
step
    .goto Mount Hyjal,15.6,52.1
    >>Talk to |cRXP_FRIENDLY_Daythor Brellan|r
    .turnin 90750 >>Turn in More Work?
    .accept 95218 >>Accept More of the Same
    .target Daythor Brellan
step
    .goto Mount Hyjal,15.7,54.7
    >>Talk to |cRXP_FRIENDLY_Sefira Everbright|r
    .turnin 95218 >>Turn in More of the Same
    .accept 94832 >>Accept Belle's Ring
    .target Sefira Everbright
step
    .goto Mount Hyjal,15.6,52.1
    >>Show the ring to |cRXP_FRIENDLY_Daythor Brellan|r
    .turnin 94832 >>Turn in Belle's Ring
    .target Daythor Brellan
step
    #label Sheep
    >>If you picked up Ewe Wandered Off, capture the |cRXP_FRIENDLY_Escaped Sheep|r around the outpost and bring them back to Mirt. If you didn't, this step skips itself.
    .complete -96674,1
step
    >>Talk to |cRXP_FRIENDLY_Mirt|r
    .turnin -96674 >>Turn in Ewe Wandered Off
    .target Mirt
step
    >>Head south into the valley below Elderwild and collect |cRXP_LOOT_Hyjal Owl Feathers|r from owls and their nests
    .complete 95027,1
    .mob Hyjal Owl
step
    .goto Mount Hyjal,15.6,50.0
    >>Back in Elderwild, talk to |cRXP_FRIENDLY_Hnaz Blunderflame|r
    .turnin 95027 >>Turn in Feathers in Flight
    .target Hnaz Blunderflame
step
    .goto Mount Hyjal,41.3,45.3
    >>Head east to the bridge overlooking the Cradle of Tranquility. Touch the |cRXP_PICK_Crow Effigy|r to call the Wild God |cRXP_FRIENDLY_Jereman|r, then talk to him.
    .turnin 96931 >>Turn in Heading Up the Mountain
    .accept 96939 >>Accept The Balance of Life and Death
    .accept 96978 >>Accept Violent Venison
    .accept 96964 >>Accept A Clever Creature
    .target Jereman
step
    .goto Mount Hyjal,28.7,43.0
    >>Talk to the Wild God |cRXP_FRIENDLY_Kala'th|r
    .turnin 96978 >>Turn in Violent Venison
    .accept 93617 >>Accept Prey and Predator
    .target Kala'th
step
    .goto Mount Hyjal,30.0,44.5
    >>Dissuade the |cRXP_ENEMY_Predatory Hyjal Stags|r
    .complete 93617,1
    .mob Predatory Hyjal Stag
step
    .goto Mount Hyjal,28.7,43.0
    >>Talk to |cRXP_FRIENDLY_Kala'th|r
    .turnin 93617 >>Turn in Prey and Predator
    .target Kala'th
step
    .goto Mount Hyjal,27.1,50.0
    >>Talk to the Wild God |cRXP_FRIENDLY_Marrosis|r
    .turnin 96939 >>Turn in The Balance of Life and Death
    .accept 92317 >>Accept Stolen Life
    .accept 96957 >>Accept Bone Sweet Bone
    .target Marrosis
step
    .goto Mount Hyjal,31.3,50.3
    >>Talk to the Wild Demigod |cRXP_FRIENDLY_Shalla'kal|r
    .accept 93615 >>Accept Kits and Cats
    .target Shalla'kal
step
    #sticky
    #label Kittens
    >>Find Shalla'kal's kittens as you quest: |cRXP_FRIENDLY_Whisperfur|r (27.0, 61.9), |cRXP_FRIENDLY_Solstice|r (38.6, 47.3) and |cRXP_FRIENDLY_Brie|r (41.8, 36.2)
    .complete 93615,1
step
    .goto Mount Hyjal,32.9,54.4
    >>Talk to |cRXP_FRIENDLY_Galvinquam Leafsyre|r
    .accept 96979 >>Accept Sacred Refreshment
    .target Galvinquam Leafsyre
step
    >>Fill Galvinquam's drinking gourd at the waterfall just ahead
    .complete 96979,1
step
    .goto Mount Hyjal,32.9,54.4
    >>Talk to |cRXP_FRIENDLY_Galvinquam Leafsyre|r
    .turnin 96979 >>Turn in Sacred Refreshment
    .accept 96991 >>Accept Trail Assist
    .target Galvinquam Leafsyre
step
    .goto Mount Hyjal,24.0,54.8
    >>Collect |cRXP_LOOT_Sun-Bleached Bones|r around Mourning's Rest
    >>In the Scourge ruins just southwest, kill |cRXP_ENEMY_Forgotten Soldiers|r, |cRXP_ENEMY_Fleshflay Raveners|r or |cRXP_ENEMY_Death Wailers|r until one drops a |cRXP_LOOT_Drop of Stolen Life|r
    .complete 96957,1
    .complete 92317,1
    .mob Forgotten Soldier
    .mob Fleshflay Ravener
    .mob Death Wailer
step
    .goto Mount Hyjal,27.1,50.0
    >>Talk to |cRXP_FRIENDLY_Marrosis|r
    .turnin 96957 >>Turn in Bone Sweet Bone
    .target Marrosis
]])

-------------------------------------------------------------------------------
-- 4) 59-60 Shrine of Aviana, Dae'gun & Summit of Eternity
-------------------------------------------------------------------------------
RXPGuides.RegisterGuide(GROUP, [[
#forever
#version 1
<< Alliance
#name 59-60 Shrine, Dae'gun & Summit

step
    .goto Mount Hyjal,42.06,52.06
    >>Head east and talk to |cRXP_FRIENDLY_Lisbael Highfeather|r
    .accept 96145 >>Accept Past Wing and Claw
    .target Lisbael Highfeather
step
    .goto Mount Hyjal,48.5,56.4
    >>Click the |cRXP_PICK_Corrupted Growth|r, then remove the |cRXP_PICK_Corrupted Knots|r from the trees nearby
    .accept 96296 >>Accept Fetid Corruption
    .complete 96296,1
step
    .goto Mount Hyjal,54.5,63.9
    >>Go to the Shrine of Aviana and talk to |cRXP_FRIENDLY_Phoebe Highfeather|r
    .turnin 96145 >>Turn in Past Wing and Claw
    .turnin 96296 >>Turn in Fetid Corruption
    .accept 92147 >>Accept Highfeather Helper
    .accept 96252 >>Accept Tarnished Treasures
    .target Phoebe Highfeather
step
    .goto Mount Hyjal,54.3,64.0
    >>Talk to |cRXP_FRIENDLY_Skylord Omnuron|r
    .turnin 92171 >>Turn in Taking to New Heights
    .accept 92500 >>Accept A Bit of the Sky
    .accept 91883 >>Accept Spear of the Skylord
    .target Skylord Omnuron
step
    .goto Mount Hyjal,51.5,58.2
    >>Kill |cRXP_ENEMY_Wormwing harpies|r for |cRXP_LOOT_Wormwing Pinfeathers|r. Search their nests for |cRXP_LOOT_Tarnished Highfeather Bangles|r and |cRXP_LOOT_The Jewel of the Horizon|r.
    >>Kill |cRXP_ENEMY_Zarrat Wormwing|r and take |cRXP_LOOT_Omnuron's Spear|r
    .complete 92147,1
    .complete 96252,1
    .complete 92500,1
    .complete 91883,1
    .mob Wormwing Harpy
    .mob Wormwing Windwitch
    .mob Wormwing Ambusher
    .mob Zarrat Wormwing
step
    .goto Mount Hyjal,54.5,63.9
    >>Talk to |cRXP_FRIENDLY_Phoebe Highfeather|r and |cRXP_FRIENDLY_Skylord Omnuron|r
    .turnin 92147 >>Turn in Highfeather Helper
    .turnin 96252 >>Turn in Tarnished Treasures
    .turnin 91883 >>Turn in Spear of the Skylord
    .target Phoebe Highfeather
    .target Skylord Omnuron
step
    .goto Mount Hyjal,60.1,61.2
    >>Talk to |cRXP_FRIENDLY_Kaylaena Springwhisper|r
    .turnin 92594 >>Turn in Kindling, Kinda
    .target Kaylaena Springwhisper
step
    .goto Mount Hyjal,60.0,49.4
    >>Head north to the Wild God |cRXP_FRIENDLY_Renalard|r
    .turnin 96964 >>Turn in A Clever Creature
    .accept 92335 >>Accept Ashes of the Legion Ascent
    .accept 96971 >>Accept To Outfox a Demon
    .target Renalard
step
    .goto Mount Hyjal,43.91,37.81
    >>Head west to |cRXP_FRIENDLY_Johun "Punchy" Dillas|r above the Cradle of Tranquility
    .accept 92015 >>Accept Area Denial Skunks
    .target Johun "Punchy" Dillas
step
    >>Make the skunks leave the area around Johun's equipment without killing them
    .complete 92015,1
step
    .goto Mount Hyjal,43.91,37.81
    >>Talk to |cRXP_FRIENDLY_Johun "Punchy" Dillas|r
    .turnin 92015 >>Turn in Area Denial Skunks
    .accept 92014 >>Accept Fox Hole
    .target Johun "Punchy" Dillas
step
    .goto Mount Hyjal,42.6,43.6
    >>Kill |cRXP_ENEMY_Rustleaf Foxes|r for their tails
    .complete 92014,1
    .mob Rustleaf Fox
step
    .goto Mount Hyjal,43.91,37.81
    >>Talk to |cRXP_FRIENDLY_Johun "Punchy" Dillas|r
    .turnin 92014 >>Turn in Fox Hole
    .accept 96992 >>Accept Resupply
    .target Johun "Punchy" Dillas
step
    .goto Mount Hyjal,41.5,42.0
    >>Search the burned buildings in the Cradle of Tranquility for |cRXP_LOOT_Metal Brackets|r and |cRXP_LOOT_Nails|r
    .complete 96992,1
    .complete 96992,2
step
    .goto Mount Hyjal,43.91,37.81
    >>Talk to |cRXP_FRIENDLY_Johun "Punchy" Dillas|r
    .turnin 96992 >>Turn in Resupply
    .accept 92593 >>Accept Avalanche of Corruption
    .target Johun "Punchy" Dillas
step
    #optional
    .goto Mount Hyjal,31.3,50.3
    >>If you've found all three kittens, return to |cRXP_FRIENDLY_Shalla'kal|r. The detour takes a couple of minutes.
    .complete 93615,1
    .turnin 93615 >>Turn in Kits and Cats
    .target Shalla'kal
step
    .goto Mount Hyjal,43.8,32.2
    >>Head north into Dae'gun and talk to |cRXP_FRIENDLY_Elaena Moonwhisper|r and |cRXP_FRIENDLY_Witherbeard|r
    .accept 92960 >>Accept Siphoned Ephemeral Essence
    .accept 95793 >>Accept Stemming the Demon Tide
    .target Elaena Moonwhisper
    .target Witherbeard
step
    .goto Mount Hyjal,49.3,32.6
    >>Talk to |cRXP_FRIENDLY_Yashiro|r
    .accept 96959 >>Accept Blademaster's Bonfires
    .target Yashiro
step
    .goto Mount Hyjal,63.3,25.9
    >>Talk to |cRXP_FRIENDLY_Maerion Thaelemaches|r
    .accept 97009 >>Accept Maerion's Misery
    .target Maerion Thaelemaches
step
    .goto Mount Hyjal,57.2,36.6
    >>Kill |cRXP_ENEMY_Defiling Hounds|r for |cRXP_LOOT_Ephemeral Essences|r and |cRXP_LOOT_Felhound Spikes|r. Kill |cRXP_ENEMY_Felguard Sentinels|r throughout Dae'gun.
    >>Light Yashiro's two bonfires, collect |cRXP_LOOT_Abandoned Supplies|r and grab a pinch of |cRXP_LOOT_Azgalor's Ashes|r from the ruins
    >>Climb to a high vantage point in Dae'gun to scout the Horde tower for Johun
    .complete 92960,1
    .complete 97009,1
    .complete 95793,1
    .complete 96959,1
    .complete 96971,1
    .complete 92335,1
    .complete 92593,1
    .mob Defiling Hound
    .mob Felguard Sentinel
step
    .goto Mount Hyjal,63.3,25.9
    >>Talk to |cRXP_FRIENDLY_Maerion Thaelemaches|r
    .turnin 97009 >>Turn in Maerion's Misery
    .accept 97010 >>Accept Blind Vengeance
    .target Maerion Thaelemaches
step
    >>Climb to the top of the Horde Mage Tower and throw an |cRXP_LOOT_Explosive Runeshard|r to signal Maerion
    .complete 97010,1
step
    .goto Mount Hyjal,63.3,25.9
    >>Talk to |cRXP_FRIENDLY_Maerion Thaelemaches|r
    .turnin 97010 >>Turn in Blind Vengeance
    .target Maerion Thaelemaches
step
    .goto Mount Hyjal,43.8,32.2
    >>Talk to |cRXP_FRIENDLY_Elaena Moonwhisper|r and |cRXP_FRIENDLY_Witherbeard|r
    .turnin 92960 >>Turn in Siphoned Ephemeral Essence
    .turnin 95793 >>Turn in Stemming the Demon Tide
    .accept 96003 >>Accept Drawing Down the Malevolent
    .target Elaena Moonwhisper
    .target Witherbeard
step
    .goto Mount Hyjal,51.0,39.7
    >>Use the |cRXP_LOOT_Eye of Endless Influence|r on |cRXP_ENEMY_Mazzogore|r and |cRXP_ENEMY_Bethra'zel|r (58.9, 32.6) to siphon their power, then land the killing blow
    .complete 96003,1
    .complete 96003,2
    .mob Mazzogore
    .mob Bethra'zel
step
    .goto Mount Hyjal,43.8,32.2
    >>Talk to |cRXP_FRIENDLY_Elaena Moonwhisper|r
    .turnin 96003 >>Turn in Drawing Down the Malevolent
    .accept 96025 >>Accept As the Crow Flies
    .target Elaena Moonwhisper
step
    .goto Mount Hyjal,49.3,32.6
    >>Talk to |cRXP_FRIENDLY_Yashiro|r, then fight through Dae'gun with him
    .turnin 96959 >>Turn in Blademaster's Bonfires
    .accept 96983 >>Accept Yashiro's Windwalk
    .complete 96983,1
    .target Yashiro
step
    .goto Mount Hyjal,49.3,32.6
    >>Talk to |cRXP_FRIENDLY_Yashiro|r
    .turnin 96983 >>Turn in Yashiro's Windwalk
    .target Yashiro
step
    .goto Mount Hyjal,43.91,37.81
    >>Talk to |cRXP_FRIENDLY_Johun "Punchy" Dillas|r
    .turnin 92593 >>Turn in Avalanche of Corruption
    .accept 96494 >>Accept Gathering Storm
    .target Johun "Punchy" Dillas
step
    >>Find the Blackthorne reinforcement point at the entrance to Hyjal Summit
    .complete 96494,1
step
    .goto Mount Hyjal,43.91,37.81
    >>Talk to |cRXP_FRIENDLY_Johun "Punchy" Dillas|r. Hold on to the Blackthorne Information for Stormwind at the end.
    .turnin 96494 >>Turn in Gathering Storm
    .accept 96529 >>Accept A Shaw Deal
    .target Johun "Punchy" Dillas
step
    .goto Mount Hyjal,60.0,49.4
    >>Talk to |cRXP_FRIENDLY_Renalard|r
    .turnin 96971 >>Turn in To Outfox a Demon
    .target Renalard
step
    .goto Mount Hyjal,73.34,81.88
    >>Fly to the Tainted Foothills and take everything to |cRXP_FRIENDLY_Ketharas|r
    .turnin 92317 >>Turn in Stolen Life
    .turnin 92500 >>Turn in A Bit of the Sky
    .turnin 92335 >>Turn in Ashes of the Legion Ascent
    .accept 90647 >>Accept The Staff of the Mountain
    .target Ketharas
step
    .goto Mount Hyjal,68.85,50.6
    >>Travel up to the Summit of Eternity and talk to |cRXP_FRIENDLY_Tiala Whitemane|r
    .turnin 90647 >>Turn in The Staff of the Mountain
    .accept 92169 >>Accept Paying Back the Pact
    .accept 93127 >>Accept Summit Sentries
    .accept 93407 >>Accept A Thorn in the Paw
    .target Tiala Whitemane
step
    .goto Mount Hyjal,68.99,49.99
    >>Talk to |cRXP_FRIENDLY_Thisalee Crow|r
    .turnin 91688 >>Turn in To the Summit of Eternity
    .turnin 96025 >>Turn in As the Crow Flies
    .accept 93584 >>Accept Cult Closure
    .target Thisalee Crow
step
    .goto Mount Hyjal,68.3,46.7
    >>Talk to |cRXP_FRIENDLY_Marn Euhorn|r
    .turnin 96991 >>Turn in Trail Assist
    .accept 92017 >>Accept Cleansing Winds
    .target Marn Euhorn
step
    .goto Mount Hyjal,68.7,46.8
    >>Talk to |cRXP_FRIENDLY_Fayran Elthas|r. Grab the flight path too.
    .accept 93444 >>Accept Bait the Beast
    .target Fayran Elthas
step
    .goto Mount Hyjal,68.9,48.4
    >>Talk to |cRXP_FRIENDLY_Toron Rockhoof|r
    .accept 92533 >>Accept Twisted Tools
    .target Toron Rockhoof
step
    .goto Mount Hyjal,70.7,51.2
    >>Talk to |cRXP_FRIENDLY_Rhylin Stonethorn|r
    .accept 93422 >>Accept Blackthorne Blackout
    .target Rhylin Stonethorn
step
    .goto Mount Hyjal,70.9,51.5
    >>Talk to |cRXP_FRIENDLY_Sebelia|r
    .home >>Set your Hearthstone to the Summit of Eternity
    .target Sebelia
step
    .goto Mount Hyjal,71.0,43.5
    >>Kill |cRXP_ENEMY_Mountain Squallclimbers|r for |cRXP_LOOT_Grand Hippogryph Feathers|r and |cRXP_ENEMY_Wildbreath Chimaeroks|r for |cRXP_LOOT_Oily Chimaera Hair|r
    >>Collect |cRXP_LOOT_Thorn Seeds|r in the forests around the summit
    .complete 92017,1
    .complete 92017,2
    .complete 93407,1
    .mob Mountain Squallclimber
    .mob Wildbreath Chimaerok
step
    .goto Mount Hyjal,74.9,34.0
    >>Go north to the Blackthorne Pact. Use the |cRXP_LOOT_Staff of the Mountain|r on Pact members to strip their wards, then kill them.
    >>Kill |cRXP_ENEMY_Blackthorne Cultists|r and |cRXP_ENEMY_Adepts|r for the |cRXP_LOOT_Wicked Ritualist's Kris|r and |cRXP_LOOT_Recoiling Gnarlybark Staff|r. Kill the |cRXP_ENEMY_Blackthorne Courier|r for her message.
    >>Reactivate the sentinel stones north, west and south of the cultists
    .complete 92169,1
    .complete 93584,1
    .complete 93584,2
    .complete 92533,1
    .complete 92533,2
    .complete 93422,1
    .complete 93422,2
    .complete 93127,1
    .mob Blackthorne Cultist
    .mob Blackthorne Adept
    .mob Blackthorne Courier
step
    .goto Mount Hyjal,69.3,23.6
    >>Kill a |cRXP_ENEMY_Nightsaber Guardian|r for its haunch, then use the haunch on the northern ridge to bait out |cRXP_ENEMY_Ghansurok|r. Kill him and take his heart.
    .complete 93444,1
    .mob Ghansurok
step
    .goto Mount Hyjal,68.85,50.6
    >>Return to the summit camp and turn in to |cRXP_FRIENDLY_Tiala|r, |cRXP_FRIENDLY_Thisalee|r, |cRXP_FRIENDLY_Marn|r, |cRXP_FRIENDLY_Fayran|r, |cRXP_FRIENDLY_Toron|r and |cRXP_FRIENDLY_Rhylin|r
    .turnin 92169 >>Turn in Paying Back the Pact
    .turnin 93127 >>Turn in Summit Sentries
    .turnin 93407 >>Turn in A Thorn in the Paw
    .accept 92833 >>Accept Ve'han's Fall
    .accept 93547 >>Accept A Thorny Solution
    .turnin 93584 >>Turn in Cult Closure
    .accept 96303 >>Accept Memory Mist
    .turnin 92017 >>Turn in Cleansing Winds
    .accept 92016 >>Accept Rootwork
    .accept 96302 >>Accept Arch Absolution
    .accept 96301 >>Accept Power Wash
    .turnin 93444 >>Turn in Bait the Beast
    .turnin 92533 >>Turn in Twisted Tools
    .turnin 93422 >>Turn in Blackthorne Blackout
    .target Tiala Whitemane
    .target Thisalee Crow
    .target Marn Euhorn
step
    >>Around the summit: plant thorn seeds by the inn, the storage tower and the grove at the loyalist druid camp. Release 5 wisps around Nordrassil with the Enchanted Branch. Let Marn's incense smoke ward Archimonde's remains.
    >>Enter the Well of Eternity: examine Nordrassil's deep roots and watch what happens to the Venom-dripping Heart
    .complete 93547,1
    .complete 96303,1
    .complete 96302,1
    .complete 92016,1
    .complete 96301,1
step
    .goto Mount Hyjal,76.7,33.6
    >>Use the |cRXP_LOOT_Staff of the Mountain|r to strip |cRXP_ENEMY_Ve'han Talongrasp|r of his stolen power, then kill him
    .complete 92833,1
    .mob Ve'han Talongrasp
step
    .goto Mount Hyjal,76.9,35.4
    >>Click the |cRXP_PICK_Bookshelf|r and take Ve'han's Research Notes
    .accept 93521 >>Accept Challenger of the Gods
step
    .goto Mount Hyjal,68.85,50.6
    >>Wrap up at the summit camp
    .turnin 92833 >>Turn in Ve'han's Fall
    .turnin 93521 >>Turn in Challenger of the Gods
    .turnin 93547 >>Turn in A Thorny Solution
    .accept 93848 >>Accept Work Well Done
    .turnin 96303 >>Turn in Memory Mist
    .turnin 96302 >>Turn in Arch Absolution
    .turnin 92016 >>Turn in Rootwork
    .turnin 96301 >>Turn in Power Wash
    .target Tiala Whitemane
    .target Thisalee Crow
    .target Marn Euhorn
step
    .goto Mount Hyjal,73.34,81.88
    >>Fly to the Tainted Foothills and talk to |cRXP_FRIENDLY_Ketharas|r one last time
    .turnin 93848 >>Turn in Work Well Done
    .target Ketharas
step
    >>Travel to Stormwind and give the Blackthorne Information to |cRXP_FRIENDLY_Master Mathias Shaw|r at SI:7 in Old Town
    .turnin 96529 >>Turn in A Shaw Deal
    .target Master Mathias Shaw
step
    #optional
    .xp 60 >>If you're not 60 yet, finish off with mobs in Dae'gun or the Blackthorne camp
]])
