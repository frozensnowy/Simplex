-- LuaDC version 0.9.19
-- 5/23/2004 7:32:07 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
SpeechRecall =
{
    size =
        { 225, 119, 351, 266, },
    stylesheet = "HW2StyleSheet",
    RootElementSettings =
    {
        backgroundColor = "IGColorBackground1", },
    soundOnShow = "SFX_ObjectiveMenuONOFF",
    soundOnHide = "SFX_ObjectiveMenuONOFF",
    pixelUVCoords = 1,
;
{ -- MAIN HEADING
    type = "TextLabel",
    position =
        { 4, 1, },
    size =
        { 208, 14, },
    name = "lblTitle",
    Text =
    {
        textStyle = "IGHeading1",
        text = "INFO", },
},
{ -- SUBHEADING
    type = "TextLabel",
    position =
        { 4, 16, },
    size =
        { 208, 13, },
    name = "lblSubtitle",
    Text =
    {
        textStyle = "IGHeading2",
        text = "MESSAGES/GAME PARAMETERS//", },
},

--SYSTEM TIME
{
	type = "TextLabel",
	position = {351-208, 16},
	size = {208,  13},
	name = "lblsystemtime",			
	Text = {
		textStyle = "IGHeading2",
		hAlign = "Right",
		--offset = {-1, 0},
		color = "FEColorHeading3",
	},			
},

{ -- INFO OPTIONS
    type = "Frame",
    position =
        { 3, 31, },
    autosize = 1,
    borderColor = "IGColorOutline",
    outerBorderWidth = 1,
;

---Recall
{
    type = "TextButton",
    position =
        { 0, 0, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
        text = "Recall", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	1 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{
    type = "ListBox",
    listBoxStyle = "FEBorderListBoxStyle",
    position =
        { 70, 0, },
    size =
        { 275, (174 + 39), },
    name = "listSpeech",
    hugBottom = 1,
},
{
    type = "Line",
    p1 =
        { 325, 0, },
    p2 =
        { 325, (174 + 39), },
    lineWidth = 2,
    color = "IGColorOutline",
    name = "listSpeech1",
},
---Military Rank
{
    type = "TextButton",
    position =
        { 0, 12, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    text = "Military Rank", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	1 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "MilitaryRank",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{ -- Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\degree_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{ -- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Military Rank",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{ -- Description
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "The progress of your naval career depending on the Honour Points you have earned. Higher ranks allows for more crew and officers, better research opportunities, as well as more renumeration at the end of every year. To advance to higher ranks, Hiigaran needs to build the unlocked ranks on the <c=0095d9>CREW STATION</c>; Vaygr, Kadeshi, and Progenitor advance automatically; Turanic Raiders need to research the unlocked ranks.\nThere are 7 Military Ranks:\n  - Ensign (0)\n  - Lieutenant (30)\n  - Commander (80)\n  - Captain (150)\n  - Commodore (240)\n  - Admiral (350)\n  - Fleet Admiral (480)",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Honour
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 24, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Honour", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		1 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Honour",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\honor_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Honour",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Honour represents the trust your fleet has in you and is needed to advance your Military Rank.\nTo increase your Honour Points:\n  - Build units and subsystems\n  - Research technologies, abilities and upgrades\n  - Harvest resources and salvage debris\n  - Paying tributes to your allies (multiplayer)\n  - Destroy enemy ships\n  - Capture enemy ships",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Crew/Officers
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 36, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Crew/Officers", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	1 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "CrewOfficer",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{ -- Crew Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\crew_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{ -- Officer Icon
			type = "Frame",
			position = {20, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\officer_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{
    type = "TextLabel",
    position =
        { 37, 4, },
    size = {100,15},
    Text =
    {
        text = "Crew/Officers",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "You have limited pilots and officers to operate your ships. To inscrease them, first you need higher Military Ranks; then build the unlocked Crew and Officer Barracks on the <c=0095d9>CREW STATION</c> (Hiigarans), or research the appropriate items (Vaygr, Kadeshi, Turanic Raiders, and Progenitor). For Hiigarans, <c=0095d9>CREW CELLS</c> built from the <c=0095d9>CREW STATION</c> are crucial in replenishing the lost crew, recruiting new pilots and officers, as well as awakening the entire fleet after each long-range hyperspace jump in the beginning of a new mission (single player campaign). ",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Game Year
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 48, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Game Year", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		1 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "GameYear",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{ -- Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\year_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{ -- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Game Year",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{ -- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Represents the ingame calender. At the end of each game year, several things will happen:\n  - You will pay for the maintenance cost of all your ships and subsystems\n  - If RU Fusion has been active, you will recieve the generated RUs\n  - Members of an alliance will pay the required tribute cost to the member that has the highest Player Score.",
        textStyle = "IGHeading2",
        vAlign = "Top",
	},
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Energy
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 60, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Energy", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		1 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Energy",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{ -- Frame
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\lightning_yellow_1600.TGA",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{ -- Label
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Energy",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{ -- Text
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "To improve certain aspects of your fleet, you need to increase your energy production and storage capability:\nHIIGARAN\n  - Build Power Modules\n  - Build a <c=0095d9>POWER STATION</c>\n  - Build Toroidal Magnets\n  - Research Energy upgrades\nVAYGR\n  - Research Energy upgrades\n  - Build Power Modules\nKADESHI\n  - Research Energy upgrades\n  - Build Potential Energy Perks\nTURANIC RAIDERS\n  - Build a <c=0095d9>POWER PLANT</c>\n  - Research Energy upgrades\n  - Choose General Black Hand\nPROGENITOR\n  - Build 9 <c=0095d9>POWER GENERATORS</c>\n  - Convert RUs into energy\n  - Research Energy upgrades",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Research
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 72, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Research Score", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		1 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Research",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\tech_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Research Score",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "To advance your tech tree: \nHIIGARAN build Research Divisions on the <c=0095d9>RESEARCH STATION</c> after reaching certain Research Scores.\n  - 1st: RESEARCH Division (0)\n  - 2nd: SCIENCE Division (125)\n  - 3rd: ENGINEERING Division (450)\nVAYGR build one Research Division\nKADESHI build a Theological Seminary and choose your belief (Garden, Kadesh, or Sajuuk)\nTURANIC RAIDERS research the Professional Career (4 levels in total)\nPROGENITOR research one of the two Runtimes (Extermination RT and Pacifier RT), on which further development of the tech tree will be depending",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Maintenance
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 84, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Maintenance", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	1 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Maintenance",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\maintenance_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Maintenance",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "All ships require some basic annual maintenance to stay at their optimal performance. At the end of every Game Year, the cost to maintain all ships and subsystems will be totaled and subtracted from the fleet's currently stored RUs. If there are not enough RUs to cover the maintenance cost, ships will start to lose Efficiency, suffering from deterioration in many aspects including attacking and driving.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---RUs
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 96, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "RUs", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			1 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "RUs",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
    --autosize = 1,
    --autoarrange = 1,
    --autoarrangeSpace = 3,
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "RUs",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Resource Units can be obtained by harvesting, salvaging, trading, colonizing, and earning bounty RUs (when INCENTIVE SYSTEM is enabled). To harvest/salvage RUs, build <c=0095d9>RESOURCE COLLECTORS</c>; to estabilish a Trade Network, build <c=0095d9>TRADE CONVOYS</c>. RUs can also come from: \nHIIGARAN RU Fusion; Population\nVAYGR RU Fusion\nKADESHI Bounty Hunter Perks; Twisted Faith\nTURANIC RAIDERS Population; gambling \nPROGENITOR Converting Energy into RUs using the <c=0095d9>POWER GENERATORS</c>",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Fusion
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 108, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "RU Fusion", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		1 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Fusion",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "RU Fusion",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "The mobile workhorses of fleet resourcing operations (<c=0095d9>SCAVENGERS</c>, <c=0095d9>PROSPECTORS</c>, and <c=0095d9>MOBILE REFINERIES</c>) can be upgraded through research or subsystems to generate RUs automacitally from the trace amount of ions, atoms, molecular gas and dust found in the interstellar medium. RUs sythesized by Fusion will be delivered in a lump sum at the end of every Game Year.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Mining Base
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 120, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Mining Base", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	1 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "MiningBase",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion1_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Mining Base",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Many battlefields have <c=0095d9>MINING BASES</c> scattered around, which are controlled by some neutral third-party organizations (such as interstellar mining companies). To make good use of them, a fleet will need to:\n  - Capture the Mining Base\n  - Dock <c=0095d9>RESOURCE COLLECTORS</c> with the Mining Base to begin mining operations\n  - Build <c=0095d9>MINE CONTAINERS</c> to transport RUs mined by the collectors back to a production ship (Progenitor doesn't participate in such gold rush)",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Debris
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 132, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Debris", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		1 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Debris",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Debris",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Civilizations forgotten for aeons once waged war on truly massive scales. The remnants of these battles can sometimes still be found in the form of massive derelict hull fragments, simply referred to by the Shipbreakers as \"Debris\". When the INCENTIVE SYSTEM is turned on, the Deris can provide a lot of RUs upon being captured.\nAlternatively, captured Debris can also be scuttled to produce a large number of smaller fragments, which can be then salvaged by <c=0095d9>RESOURCE COLLECTORS</c>.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
--Megaliths
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 144, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Megaliths", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		1 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Megaliths",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {15,15},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Megaliths",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Scattered among the stars are the remnants of advanced alien civilizations. Some derelicts referred to by the Shipbreakers as \"<c=0095d9>MEGALITHS</c>\" still remain functional to some degree, and can still be used to improve certain aspects of a fleet. Different Megaliths grant different enhancements.\nTo make use of these bonuses, the Megaliths must be captured.",
        textStyle = "IGHeading2",
        vAlign = "Top",
	},
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Network
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 156, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Trade Network", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		1 );
    UI_SetElementVisible( "", "Monitor", 		0 );
    UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Network",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion2_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Trade Network",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Body
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "A fleet with sufficient RUs in store is recommended to build one or more <c=0095d9>TRADE CONVOYS</c>. Trade Convoys will automatically ferry RUs between you and allied players (Proginitor don't build Trade Convoys, but they can accpect allied Trade Convoys in their <c=0095d9>CONSTRUCTS</c>). Note that allied players with lower Player Scores will be charged a diplomacy fee in RUs (if DIPLOMACY FEE is enabled) to use the Trade Network. The Diplomacy Fee is charged at the end of every Game Year and payed to the player with the highest game score.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Monitor
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 168, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Remote Monitor", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		1 );
		UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Monitor",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{ -- Icon
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\computerlink_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{ -- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Remote Monitor",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{ -- Description
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "The security level your fleet has in encrypting sensitive data transmission across the subspace, which is also your fleet's ability to decrypt the data transmission of other fleets. To unlock the Remote Monitor research upgrades (which spies on all kinds of parameters of other fleets), Hiigaran and Vaygr need to build the Advanced Sensor Array subsystem, Kadeshi need to build the Telepathetic Complex subsystem, Turanic Raiders need to research higher Professional Career levels, Progenitor needs to build 3 <c=0095d9>PERCIPIENTS</c>.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Planets
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 180, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Planets", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
		UI_SetElementVisible( "", "Space", 		0 );
    UI_SetElementVisible( "", "Planets", 		1 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Planets",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion3_1600.tga",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Planets",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Description
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "Colonized planets can generate RUs and energy depending on their population growth. Any <c=0095d9>MOTHERSHIP</c>, <c=0095d9>ORBITAL STATION</c>, <c=0095d9>FLAGSHIP</c>, <c=0095d9>COMMAND FORTRESS</c>, <c=0095d9>NEEDLESHIP</c>, <c=0095d9>PIRATE SHIP</c>, <c=0095d9>BLACK MARKET</c> or <c=0095d9>WORMHOLE</c> near a planet will colonize it. \nPopulation will grow only when friendly colonizers are in orbit and there are no enemy colonizers.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---Space
{	-- Button Text
    type = "TextButton",
    position =
        { 0, 192, },
    size =
        { 70, 12, },
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
    	text = "Space", },
    onMouseClicked = [[
	UI_SetElementVisible( "", "listSpeech", 	0 );
    UI_SetElementVisible( "", "MilitaryRank", 	0 );
    UI_SetElementVisible( "", "Honour", 		0 );
    UI_SetElementVisible( "", "CrewOfficer", 	0 );
    UI_SetElementVisible( "", "GameYear", 		0 );
    UI_SetElementVisible( "", "Energy", 		0 );
    UI_SetElementVisible( "", "Research", 		0 );
    UI_SetElementVisible( "", "Maintenance", 	0 );
    UI_SetElementVisible( "", "RUs", 			0 );
    UI_SetElementVisible( "", "Fusion", 		0 );
    UI_SetElementVisible( "", "MiningBase", 	0 );
    UI_SetElementVisible( "", "Debris", 		0 );
    UI_SetElementVisible( "", "Megaliths", 		0 );
    UI_SetElementVisible( "", "Network", 		0 );
    UI_SetElementVisible( "", "Monitor", 		0 );
		UI_SetElementVisible( "", "Space", 		1 );
    UI_SetElementVisible( "", "Planets", 		0 );]],
},
{	-- Box Text
    type = "Frame",
    position =
        { 70, 0, },
    size =
        { 275, (174+40), },
    name = "Space",
    visible = 0,
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{	-- Icon
			type = "Frame",
			position = {3, 4},
			size = {18,18},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\subs\\planet_tech.tga",
				textureUV = { 0, 0, 128, 128, },
				color = OUTLINECOLOR,
			},
		},
{	-- Heading
    type = "TextLabel",
    position =
        { 20, 4, },
    size = {100,15},
    Text =
    {
        text = "Solar Radiation",
        textStyle = "IGHeading2",
        vAlign = "Center", },
    giveParentMouseInput = 1,
    dropShadow = 1,
},
{	-- Description
    type = "TextLabel",
    position =
        { 3, 20, },
    width = (245),
    Text =
    {
        text = "The closer a ship is to a star (like the Sun), the more damage it will suffer from high-energy radiation, which will also consume more energy in resisting the damage. Ships that are within the protective influence of a Hiigaran <c=0095d9>ORBITAL STATION</c> or PLANET will not suffer from these problems.\nHIIGARANs are more advanced in colonizing techniques and are thus able to improve any planet they colonize, however, their ships are more prone to the damaging effects of solar radiation.\nOther races can colonize planets but don't improve them, and their ships are less prone to solar radiation.",
        textStyle = "IGHeading2",
        vAlign = "Top", },
    giveParentMouseInput = 1,
    dropShadow = 1,
    wrapping = 1,
    autosize = 1,
    autoarrange = 1,
},
},
---btn Close
{
    type = "Frame",
    position =
        { 0, (193 + 20), },
    size =
        { 345, 19, },
    borderWidth = 1,
    borderColor = "IGColorOutline",
;
{
    type = "TextButton",
    position =
        { 3, 3, },
    width = (345 + -6),
    buttonStyle = "DiplomacyScreen_ButtonStyle",
    Text =
    {
        text = "$2642", },
    onMousePressed = "UI_ToggleScreen( 'SpeechRecall', 0)", },
},
},

---text per list box
{
    type = "ListBoxItem",
    name = "listItem",
    autosize = 1,
    visible = 0,
    marginHeight = 2,
;
{
    type = "Frame",
    position = { 0, 1, },
    size = { 16, 8, },
    name = "icon",
},
{
    type = "TextLabel",
    name = "text",
    position =
        { 18, 0, },
    size =
        { 235, 13, },
    wrapping = 1,
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        hAlign = "Left", }, },
},
}
