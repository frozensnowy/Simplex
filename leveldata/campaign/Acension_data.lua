displayName = "SIMPLEX - IN SERVICE OF HIIGARA - First Invasion Era"
Mission = {}
Mission[1] =
{
    postload = function ()
    		playAnimaticNis("data:animatics/A00.lua", "nis/NIS01A")
	end,
    directory = "M01_Tanis",
    level = "M01_Tanis.level",
    postlevel = function (bWin)
    		playAnimatic("data:animatics/A01.lua", 1, 0)
    		postLevelComplete()
	end,
    displayName = "M01 - Construction Site: Tanis Base",
    description = "The Hiigaran Navy has been on the brink of collapse as sectors are being overrun. In a desperate attempt to save their Homeworld, the HGN Expeditionary Fleet project was deployed and a new mothership was constructed.\n\nOversee prelaunch trials and the deployment of what may be the last hope for Hiigara.", }
Mission[2] =
{   
    directory = "M02_Turanic",
    level = "M02_Turanic.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M02 - Emergency Jump: Unknown Enemy",
    description = "After the destruction of Tanis base, and the emergency hyperspace jump to Hiigara, the Mothership limped its way deep inside of a nebula. Without power, crew and supplies, the Mothership is in no position to fight. The lack of construction capabilities means that the fleet has no way to fend off whatever is lurking in the nebula.", }
Mission[3] =
{
    postload = function ()
    		playAnimatic("data:animatics/A02.lua", 0, 0)
	end,
    directory = "M03_Staging",
    level = "M03_Staging.level",
    postlevel =
		function ()
    		postLevelComplete()
	end,
    displayName = "M03 - Fleet Staging Area Sarum VII: Small Victories",
    description = "Sobani Intelligence reports that the Shipyard Naabal located in the Sarum star system has been effectively supporting defensive operations against Vagyr elements for the past several (Hiigaran) days, but is severely weakened by the effort. A large enemy force has broken through the Sarum Defence Cordon and is moving to finish off the damaged Mobile Shipyard.\n\nSee to it that this does not occur.", }
Mission[4] =
{
    postload = function ()
    		playAnimatic("data:animatics/A03.lua", 0, 0)
	end,
    directory = "M04_OuterGeh",
    level = "M04_OuterGeh.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M04 - Vagyr 12th Armada HQ, Gehenna System: Serpent's Head",
    description = "Using the capability of the Ancients' Hyperspace Core, Karan S'jet translates the Expeditionary Fleet to within striking distance of key enemy command and military support facilities located in this sector. This bold move, if successful, will significantly reduce the 12th Armada's operational capabilities, and pave the way for the second phase of the Gehenna operation, where an Ancient artifact is to be recovered.\n\nWorry not of Karan's ramblings - an officer of the Hiigaran Navy does not believe in obscure 'prophecies'. Cut off this serpent's head, but protect the Fleet's integrity.", }
Mission[5] =
{
    postload =
		function ()
    		playAnimatic("data:animatics/A04.lua", 0, 0)
	end,
    directory = "M05_Gehenna",
    level = "M05_Gehenna.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M05 - Rings of Gehenna III: Elusive Concept",
    description = "With the destruction of the 12th Armada's strategic and operational command capabilities, the Expeditionary Fleet has safely moved into proximity of the supermassive gas giant Gehenna III. The Bentusi have supplied information regarding a 'Key' to locate and unlock a long-dormant Ancient weapons system, and it is to be located within the gas giant's dense equatorial belt. ESM reports a significant Vagyr presence within it. That makes our job much easier.\n\nSecure the Key by whatever means possible. I recommend banging on the gates then slipping in the Elusive Concept and a Marine force under cloak.", }
Mission[6] =
{
    postload = function ()
    		playAnimaticNis("data:animatics/A05.lua", "nis/NIS06A")
	end,
    directory = "M06_Karos",
    level = "M06_Karos.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M06 - Karos Graveyard: Unforseen Consequence",
    description = "That foolish witch Karan thought she could just activate some ten thousand year old artifact and have it magically obey her will. The entire Expeditionary Fleet is now in utter disarray and we find ourselves in a wholly different half of the galaxy. Science Division suggests that the Key is indeed an autopilot and we are presently located near the wreckage of an Ancient starship.\n\nThe Mothership is still out of control. Protect her and be wary. We are detecting strange sensor readings in the area. On the bright side we now have the ability to expand our fleet and technology.", }
Mission[7] =
{
    postload = function ()
    		playAnimatic("data:animatics/A06.lua", 0, 0)
	end,
    directory = "M07_Veil_Of_Fire",
    level = "M07_Veil_Of_Fire.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M07 - Ancient Wreck: Veil of Fire",
    description = "A long-forgotten Ancient Dreadnaught. Finally, some good news. Short-lived though - quantum waveform instability pulled us out of hyperspace. Science reports we are at last able to give a bigger blow to our enemy with our very own destroyers. Unfortunately though… Our abrupt exit from hyperspace has not gone unnoticed. We have a large Vagyr attack fleet closing in from multiple vectors. Looks like the wrecks here are guarded by a little family feud…\n\nEnough of this!\n\n'India One Actual to Fleet - All hands, battle stations. Situation Foxtrot, execute procedure one-twenty. All ships, get your boats and READY FOR BATTLE!'", }
Mission[8] =
{
    postload = function ()
    		playAnimatic("data:animatics/A07.lua", 0, 0)
	end,
    directory = "M08_Hangar",
    level = "M08_Hangar.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M08 - Ancient Wreck: Unauthorised Entry",
    description = "'If I could go through hell with only 50% casualties I can take on anything'\n\nDid I say that? Well you are right, this war IS taking its toll on me... and the surviving crews as well. But we have gone this far and Sajuuk willing we WILL see this through the end.\n\nThis recovery mission should be rather straightforward and a good opportunity to reorganise the Fleet once again. Expect more resistance from Ancient drones.\n\nWe will be going head-on with the Vagyr Military Fleet soon; prepare the Fleet Cruiser Division.", }
Mission[9] =
{
    postload = function ()
    		playAnimaticNis("data:animatics/A08.lua", "nis/NIS09A")
	end,
    directory = "M09_Outer_Hangar",
    level = "M09_Outer_Hangar.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M09 - VMF Assembly Point #329: Defensive Offense",
    description = "Melarn contacted us with information pertaining to Vagyr deployments and we are going to strike a Vagyr battlefleet off the record books in the most militarily stupid manner. We are going to jump in right smack in the middle of a Vagyr assembly point with our new toy the Dreadnaught - and wait for the enemy to attack us.\n\nLet them smash themselves against our combined ranks and exhaust themselves, then we sally forth. This way we can strike a single decisive blow.\n\nIt is imperative that no young whippersnapper decides to be smarter than me and attempts independent action. Or the Expeditionary Fleet will be no more.", }
Mission[10] =
{
    postload =
		function ()
    		playAnimatic("data:animatics/A09.lua", 0, 0)
	end,
    directory = "M10_Bentusi",
    level = "M10_Bentusi.level",
    		postlevel = function ()
    		postLevelComplete()
	end,
    displayName = "M10 - En route to Thaddis Sabbah System",
    description = "Incredible. We did it! The part about charging the Mothership and mobile shipyards right through enemy formations made my hair stand on end but that bold series of moves prevented the Vagyr from successfully enveloping us. No small thanks to that captured Vagyr shipyard and its thousands of HVMs, and of course the professionalism of our crews.\nBut this is no time for joy.\n\nMelarn has been captured by the savages and although we have the location of the Vagyr High Lord we are not leaving our people behind. Our battered ships have been hastily patched up and the Fleet is now following the Ferin Sha's quantum tracking beacon.", }
Mission[11] =
{
    postload =
		function ()
    		playAnimatic("data:animatics/A10.lua", 0, 0)
	end,
    directory = "M11_Final_Core",
    level = "M11_Final_Core.level",
    postlevel =
		function ()
    		postLevelComplete()
	end,
    displayName = "M11 - Bentusi Wreckage",
    description = "This... I never expected. The last of an elder race sacrificed themselves such that we may live. They never did hesitate, and they seemed to have forseen their own extinction. This incident causes me to view in new light those eleven thousand of the enemy we had spared aboard the Navaskiya City. But warm up to them - never.\n\nI hate them. Murdering bastards and heartless witches; I will personally make them pay for the devastation they have wrought on the Republic.", }
Mission[12] =
{
    postload = function ()
    		playAnimaticNis("data:animatics/A11.lua", "nis/NIS12")
	end,
    directory = "M12_Rescue",
    level = "M12_Rescue.level",
    postlevel =
		function ()
    		postLevelComplete()
	end,
    displayName = "M12 - Thaddis Sabbah System: Gate Crashers",
    description = "With the core secured, it's about time we went on the offensive. Captain Soban is held at the command station Thaddis Shabbah. Truth be told… I'm not sure how this will go. The enemy is growing in numbers as we speak. Even so, we must push on. If not for ourselves, let us do it for our families and loved ones.\n\nLet's show them what we Hiigarans are made of…", }
Mission[13] =
{
    postload = function ()
    		playAnimaticNis("data:animatics/A12.lua", "nis/NIS13")
	end,
    directory = "M13_Balcora_Gate",
    level = "M13_Balcora_Gate.level",
    postlevel =
		function ()
    		postLevelComplete()
	end,
    displayName = "M13 - Balcora: Entry to the galactic core",
    description = "We pushed our drives to the limits but may very well be too late. The empire has begun their attempts to disable the gate. We cannot allow them to succeed, as this is our last and only hope in saving our home, and possibly the galaxy.\n\n'Fleet, enter formations and engagement protocol gamma five. Prepare to engage…'", }
Mission[14] =
{
    postload =
	function ()
    	playAnimaticNis("data:animatics/A13.lua", "nis/NIS14A")
	end,
    directory = "M14_Sajuuk",
    level = "M14_Sajuuk.level",
    postlevel =
		function (bWin)
    		playAnimatic("data:animatics/A14.lua", 1, 0)
    		postLevelComplete()
	end,
    displayName = "M14 - The Sajuuk Khar",
    description = "We made it! Honestly, I didn't expect we would. That gate took a beating! Thankfully though, it appears we have arrived in once piece; but it most certainly is not over yet. A massive fleet is attempting to block our path. We've come so far, and endured all this death, all this bloodshed and all this destruction… So many lives lost and we had no time to mourn. We can do this, we can succeed.\n\nFor all this pain that was caused, I will personally see to it that a battleship gets shoved down that flagship's throat!", }
Mission[15] =
{
    directory = "M15_Homeworld",
    level = "M15_Homeworld.level",
    postlevel = function (bWin)
    		playAnimatic("data:animatics/A15.lua", 1, 0)
    		postLevelComplete()
	end,
    displayName = "M15 - The Homeworld System: The Final Stand",
    description = "Against all odds, we managed to secure Sajuuk and fulfill the prophesy. With fleet command gone, we took a heavy hit. However, now is not the time to mourn what we lost. Let us stand united, and protect our home.\n\nWith the end in sight, it is time to save the Homeworld and finish this bitter war!", }








