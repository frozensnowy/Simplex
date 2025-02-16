-- The Simplex Project
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
Gall = 
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
{ 
    type = "TextLabel", 
    position = 
        { 4, 1, }, 
    size = 
        { 208, 14, }, 
    name = "lblTitle", 
    Text = 
    { 
        textStyle = "IGHeading1", 
        text = "GALLERY", }, 
}, 
{ 
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
{ 
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
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
        text = "Recall", },         
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 1 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],  
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
        { 0, 13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    text = "Military Rank", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 1 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "MilitaryRank", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\degree_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "Military Rank", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 			
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "Represents your game career; the higher your rank the more pilots (crew) and officers you can recruit, also you've an higher remuneration per year; to advance in your career you need Honour points. 7 ranks are available: Ensign, Lieutenant, Commander, Captain, Commodore, Admiral, Fleet Admiral.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 26, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Honour", },     
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 1 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Honour", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\honor_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "Honour", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 							
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "Represents your game progression, you need Honour to advance in your military career; to increase your Honour, build units and subsystems, research technologies/abilities, upgrade your ships, harvest RUs and most importantly, fight and kill enemies units.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 39, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Crew/Officers", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 1 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "CrewOfficer", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\crew_icon.mres",
				textureUV = {0,0,13,13},
				color = OUTLINECOLOR,
			},			
		},
{
			type = "Frame",
			position = {20, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\officer_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "Crew and Officers", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 								
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "You have a limited number of pilots and officers; each ship requires a certain amount of pilots and each capital ship requires a certain amount of officers too, for example an Interceptor squadron requires 5 crew members, the Destroyer requires 15 crew members and 1 officer; to increase your crew and your officers you must advance in your military career.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 52, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Game Year", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 1 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "GameYear", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\year_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "Game Year", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 									
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "Represents the game time and progression; at the end of every year the game events will be processed; for example, at the end of the current year you will pay RUs to maintain your fleet (Maintenance Cost), if you researched the Fusion ability you will gain RUs, also if you join an alliance you will pay/gain diplomacy fees and so on.", 
        textStyle = "IGHeading2", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1, 
    wrapping = 1,  
    autosize = 1, 
    autoarrange = 1,     
}, 
},

---Energy
{ 
    type = "TextButton", 
    position = 
        { 0, 52+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Energy", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 1 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Energy", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\lightning_yellow.mres",
				textureUV = {0,0,13,13},
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
        text = "Energy", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 									
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "Represents the power production of your fleet, the more energy you have in store the more fast and flexible is your fleet production, also navigation and attack systems are improved. To increase your energy production build the Power Station and the Toroidal Magnets on it, each magnet also provides additional energy storage. Abilities to be activated/mantained require energy, expecially: sensors, navigation/move, build (each open queue), research, hyperspace, shields, cloak, gravity well generator, fusion, and the attacking systems.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 65+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Research Score", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 1 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
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
				texture = "data:ui\\newui\\research\\icons\\tech.mres",
				textureUV = {0,0,13,13},
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
    width = (250),         
    Text = 
    { 
        text = "Represents your technology status; if you are playing as Hiigaran you need a certain amount of Research Score to unlock the various level/division of research, by this way you can discover new ships and weapons; to increase this parameter you must research abilities, technologies and upgrade your ships.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 78+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Maintenance", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 1 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
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
				texture = "data:ui\\newui\\ingameicons\\maintenance_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "Maintenance Cost", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 									
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "This is needed to keep your ships in operating condition; every ship and subsystem require a certain amount of RUs each year; the total Maintenance Cost is scaled at the end of the game year. If you don't have the requested RUs your ships will loose efficency. On the contrary, if you have the requested RUs your ships will improve their efficency.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 91+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "RUs", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 1 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "RUs", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline", 
    --autosize = 1, 
    --autoarrange = 1,  
    --autoarrangeSpace = 3,     
;
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "RUs", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 								
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "Represent your primary resource; you need it to build and upgrade your fleet; you can increase your RUs by harvesting, by the RU Fusion ability, by capturing the Mining Bases, by salvaging destroyed frigates, capital ships, debrises and you can also build a Trade Network with your allies.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 104+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Fusion", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 1 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Fusion", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {18,18},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion.mres",
				textureUV = {0,0,13,13},
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
        text = "Fusion Ability", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 									
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "If you have a certain number of Scavengers/Mobile Refineries try to research the RU Fusion ability, Scavengers/Mobile Refineries will generate RUs independently, you will gain RUs every game year. To work properly Fusion requires a lot of energy.", 
        textStyle = "IGHeading2", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1, 
    wrapping = 1,  
    autosize = 1, 
    autoarrange = 1,     
}, 
},

---MiningBase
{ 
    type = "TextButton", 
    position = 
        { 0, 117+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Mining Base", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 1 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "MiningBase", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {18,18},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion1.mres",
				textureUV = {0,0,13,13},
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
        text = "Mining Base", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 										
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "If a Mining Base is present in your map try to capture it with a Marine/Infiltrator frigate, dock some Resource Collectors into the Mining Base and build at least one Mine Container. Resource Collectors will generate RUs, the Mine Container will transfer RUs from the Mining Base to your production capital ships and you will gain RUs at any docking/drop-off point.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 130+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Debris/Megalith", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 1 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Debris", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {15,15},			
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_icon.mres",
				textureUV = {0,0,13,13},
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
        text = "Debris/Megalith", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 								
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "If Debrises or Megalithes are present in your map try to capture them with a Marine/Infiltrator frigate, if you destroy captured Debrises you gain RUs by salvaging.", 
        textStyle = "IGHeading2", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1, 
    wrapping = 1,  
    autosize = 1, 
    autoarrange = 1,     
}, 
},

---Network
{ 
    type = "TextButton", 
    position = 
        { 0, 143+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Trade Network", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 1 ); 
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Network", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {18,18},						
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion2.mres",
				textureUV = {0,0,13,13},
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
        text = "Trade Network", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 									
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "If you have a considerable number of RUs in store try to build a Trade Network, Trade Convoy will transfer RUs automatically trading between you and your allied players; also, if your ally has more game score then you, you have to pay a diplomacy fee (RUs) per year; on the contrary you will gain RUs.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 156+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Remote Monitor", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 ); 
    UI_SetElementVisible( "", "Monitor", 1 );
    UI_SetElementVisible( "", "Planets", 0 );]],    
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Monitor", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {18,18},				
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\computerlink.mres",
				textureUV = {0,0,13,13},
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
        text = "Remote Monitor Ability", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 								
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "By the Remote Monitor ability (unlocked by building an Advanced Sensors Array) you can monitor the fleet data of the players who have a lower level of Remote Monitor; your data will also be protected from these players; keep in mind that other players can monitor your data too.", 
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
{ 
    type = "TextButton", 
    position = 
        { 0, 169+13, }, 
    size = 
        { 70, 13, }, 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    {         
    	text = "Planets", },      
    onMouseClicked = [[UI_SetElementVisible( "", "listSpeech", 0 );
    UI_SetElementVisible( "", "MilitaryRank", 0 );
    UI_SetElementVisible( "", "Honour", 0 );
    UI_SetElementVisible( "", "CrewOfficer", 0 );
    UI_SetElementVisible( "", "GameYear", 0 );
    UI_SetElementVisible( "", "Energy", 0 );
    UI_SetElementVisible( "", "Research", 0 );
    UI_SetElementVisible( "", "Maintenance", 0 );
    UI_SetElementVisible( "", "RUs", 0 );    
    UI_SetElementVisible( "", "Fusion", 0 );
    UI_SetElementVisible( "", "MiningBase", 0 );
    UI_SetElementVisible( "", "Debris", 0 );
    UI_SetElementVisible( "", "Network", 0 );    
    UI_SetElementVisible( "", "Monitor", 0 );
    UI_SetElementVisible( "", "Planets", 1 );]],      
},  
{ 
    type = "Frame", 
    position = 
        { 70, 0, },     
    size = 
        { 275, (174 + 39), },    
    name = "Planets", 
    visible = 0, 
    borderWidth = 1, 
    borderColor = "IGColorOutline",        
; 
{
			type = "Frame",
			position = {3, 4},
			size = {18,18},				
			BackgroundGraphic = {
				texture = "data:ui\\newui\\research\\icons\\fusion3.mres",
				textureUV = {0,0,13,13},
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
        text = "Planet Management", 
        textStyle = "IGHeading2", 
        vAlign = "Center", }, 
    giveParentMouseInput = 1, 
    dropShadow = 1,            
}, 									
{ 
    type = "TextLabel", 
    position = 
        { 3, 20, },     
    width = (250),         
    Text = 
    { 
        text = "If a Planet/Satellite is present in your map you can colonize it by moving at least one production Capital ship near it (inside its radious), the Planet/Satellite will generate RUs (the amount depend by its population) and it will provide extra upgrades to nearest ships (inside its radious), keep in mind that, to work properly (Status: Colonized and Operating), the Planet/Satellite' radious/visual range need the presence of at least one production Capital ship and it need to be clear from any enemy threat.", 
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
    position = 
        { 0, 1, }, 
    size = 
        { 16, 8, }, 
    name = "icon", 
}, 
{ 
    type = "TextLabel", 
    name = "text", 
    position = 
        { 18, 0, }, 
    size = 
        { 294, 13, }, 
    wrapping = 1, 
    autosize = 1, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        hAlign = "Left", }, }, 
}, 
}
