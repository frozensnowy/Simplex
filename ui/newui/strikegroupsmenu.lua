-- The Simplex Project
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
StrikeGroupsMenu = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    claimMousePress = 1, 
    RootElementSettings = 
    { 
    onMouseClicked = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", }, 
    pixelUVCoords = 1, 
    onShow = "UI_SetButtonPressed('NewTaskbar', 'btnStrike', 1); \n	UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnForm1', '$2735', 28); \n	UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnForm2', '$2736', 29); \n	UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnForm3', '$2737', 30); \n	UI_SetButtonTextHotkey('StrikeGroupsMenu', 'btnLeave', '$3135', 31); \n	", 
    onHide = "UI_SetButtonPressed('NewTaskbar', 'btnStrike', 0)", 
; 
{ 
    type = "Frame", 
    name = "rootFrame", 
    position = 
        { 0, 0, }, 
    size = 
        { 800, 600, }, 
    giveParentMouseInput = 1, 
; 
{
			type = "Frame",
			name = "sgs1",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs1.tga",		
				textureUV = {-88,-88,600,600},		
				color = OUTLINECOLOR,
			},		
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "CAPITAL PHALANX", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: heavy assault formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: multi ship class/type", }, 
		}, 																
},	
},
{
			type = "Frame",
			name = "sgs2",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs2.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},	
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "FRIGATE LINE", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: assault formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: multi ship class/type", }, 
		}, 																				
		},
		},		
{
			type = "Frame",
			name = "sgs3",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs3.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "FIGHTER SCREEN", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: light assault formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: multi ship class/type", }, 
		}, 																					
		},	
		},				
{
			type = "Frame",
			name = "sgs4",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs4.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},		
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "POWER LINES", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: defensive formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: multi ship class/type", }, 
		}, 																			
		},	
		},				
{
			type = "Frame",
			name = "sgs5",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs5.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},	
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "DESTROYER/CRUISER SHIELD", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: defensive formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: multi ship class/type", }, 
		}, 																				
		},		
		},			
{
			type = "Frame",
			name = "sgs6",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs6.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},	
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "TORTOISE", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: light assault formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: single ship class/type", }, 
		}, 																				
		},	
		},				
{
			type = "Frame",
			name = "sgs7",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs7.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "CLAW", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: light assault formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: single ship class/type", }, 
		}, 																					
		},	
		},				
{
			type = "Frame",
			name = "sgs8",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs8.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},	
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "ARROW", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: light assault formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: single ship class/type", }, 
		}, 																				
		},	
		},				
{
			type = "Frame",
			name = "sgs9",
			position = {1, 134},
			size = {217,217},
			visible = 0,
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\sgs9.tga",	
				textureUV = {-88,-88,600,600},			
				color = OUTLINECOLOR,
			},	
;
{ 
    type = "Frame", 
    outerBorderWidth = 1,   
    position = {3, 3},  
    size = {211,211},
    borderColor = "FEColorPopupOutline",     
; 
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 5, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "WALL", }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 14, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Type: heavy defensive formation", }, 
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 5, 23, }, 
    size = 
        { 150, 9, }, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        vAlign = "Center", 
        hAlign = "Left",	
        text = "Target: single ship class/type", }, 
		}, 																				
		},		
		},																				
{ 
    type = "Frame", 
    name = "menu", 
    position = 
        { 1, 351, }, 
    size = 
        { 217, 162, }, 
    backgroundColor = "IGColorBackground1", 
; 
{ 
    type = "TextLabel", 
    position = 
        { -2, 0, }, 
    size = 
        { 221, 18, }, 
    borderColor = 
        { 170, 227, 255, 255, }, 
    borderWidth = 2, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "$2734", }, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm1", 
    toggleButton = 0, 
    position = 
        { 2, 21, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "$2735", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)",    
    hotKeyID = 28, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs1", 
    toggleButton = 0, 
    position = 
        { 183, 21, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]], 
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm2", 
    toggleButton = 0, 
    position = 
        { 2, 35, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "$2736", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)",     
    hotKeyID = 29, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs2", 
    toggleButton = 0, 
    position = 
        { 183, 35, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm3", 
    toggleButton = 0, 
    position = 
        { 2, 49, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "$2737", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", 
    hotKeyID = 30, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs3", 
    toggleButton = 0, 
    position = 
        { 183, 49, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm4", 
    toggleButton = 0, 
    position = 
        { 2, 63, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Power Lines", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0); formStrikeGroup(7)",        
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs4", 
    toggleButton = 0, 
    position = 
        { 183, 63, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm5", 
    toggleButton = 0, 
    position = 
        { 2, 77, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Destroyer/Cruiser Shield", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0); formStrikeGroup(8)",        
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs5", 
    toggleButton = 0, 
    position = 
        { 183, 77, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm6", 
    toggleButton = 0, 
    position = 
        { 2, 91, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Tortoise", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0); formStrikeGroup(4)",        
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs6", 
    toggleButton = 0, 
    position = 
        { 183, 91, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm7", 
    toggleButton = 0, 
    position = 
        { 2, 105, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Claw", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0); formStrikeGroup(5)",        
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs7", 
    toggleButton = 0, 
    position = 
        { 183, 105, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm8", 
    toggleButton = 0, 
    position = 
        { 2, 119, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Arrow", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0); formStrikeGroup(6)",        
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs8", 
    toggleButton = 0, 
    position = 
        { 183, 119, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 1);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnForm9", 
    toggleButton = 0, 
    position = 
        { 2, 133, }, 
    size = 
        { 180, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Wall", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0); formStrikeGroup(3)",        
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "sgs9", 
    toggleButton = 0, 
    position = 
        { 183, 133, }, 
    size = 
        { 32, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "Info", },     
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 1)]],
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnLeave", 
    toggleButton = 0, 
    position = 
        { 2, 147, }, 
    size = 
        { 213, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, 
        text = "$3165", }, 
    onMouseReleased = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)",  
    onMouseClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],   
    onMouseDoubleClicked = [[UI_SetElementVisible("StrikeGroupsMenu", "sgs1", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs2", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs3", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs4", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs5", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs6", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs7", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs8", 0);UI_SetElementVisible("StrikeGroupsMenu", "sgs9", 0)]],       
    hotKeyID = 31, }, 
}, 
{ 
    type = "Frame", 
    name = "menu", 
    position = 
        { 80, 514, }, 
    size = 
        { 72, 19, }, 
    onMouseClicked = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)", }, 
}, 
}

