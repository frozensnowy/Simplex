New1 = {    	
	size = {231, 484, 341, 13},
	stylesheet = "HW2StyleSheet",		
	onShow = "UI_HideScreen( 'New2')",
	--onHide = "UI_ShowScreen( 'New1', 1)",			
	pixelUVCoords = 1, 
	;		
	
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {0,0},
		size = {12, 12},
		name = "btnPrevFocus",
		onMouseClicked = "MainUI_UserEvent(ePreviousFocus)",		
		helpTip = "PREVIOUS FOCUS (PAG DOWN)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\PrevFocus.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},		
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {14,0},
		size = {12, 12},
		name = "btnMilitary",
		onMouseClicked = "MainUI_UserEvent(eFocusHome)", 		
		helpTip = "FOCUS CAPITAL SHIPS (HOME)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		--soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\Home.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {28,0},
		size = {12, 12},
		name = "btnNextFocus",
		onMouseClicked = "MainUI_UserEvent(eNextFocus)", 		
		helpTip = "NEXT FOCUS (PAG UP)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\NextFocus.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},		
	
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {115,0},
		size = {12, 12},
		name = "btnFleetSelector",
		onMouseClicked = "UI_ToggleScreen( 'selector', 0)", 		
		helpTip = "CLASS SELECTOR/HAXOR (')",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\FleetSelector.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
  {
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {129,0},
		size = {12, 12},
		name = "btnPlanet",
		onMouseClicked = "UI_ToggleScreen( 'planetbar', 0)", 		
		helpTip = "PLANET BAR",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\planetbar.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},		 	
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {143,0},
		size = {12, 12},
		name = "btnTacticPause",
		onMouseClicked = "MainUI_UserEvent( ePause)", 		
		helpTip = "TACTIC PAUSE (PAUSE)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\TacticPause.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},			
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {157,0},
		size = {12, 12},
		name = "btnDisableSlowMotion",
		onMouseClicked = "UI_SetScreenVisible( 'disablemotion', 1)", 		
		helpTip = "SLOW MOTION OFF",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\slowmotion.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},		
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {157,0},
		size = {12, 12},
		name = "btnEnableSlowMotion",
		onMouseClicked = "UI_SetScreenVisible( 'enablemotion', 1)", 		
		helpTip = "SLOW MOTION",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\slowmotion.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},		
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {171,0},
		size = {12, 12},
		name = "btnScreenshot",
		onMouseClicked = "MainUI_UserEvent( eTacticalOverlay)", 		
		helpTip = "CYCLE TACTICAL OVERLAYS (TAB)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\Screenshot.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {185,0},
		size = {12, 12},
		name = "btnHUD",
		--onMouseClicked = "MainUI_UserEvent( eHUD)", 
		onMouseClicked = "UI_SetScreenVisible( 'NewTaskbar', 0); UI_SetScreenVisible( 'ResourceMenu', 0); UI_SetScreenVisible( 'UnitCapInfoPopup', 0); UI_SetScreenVisible( 'UnitCapInfoPopup1', 0); UI_SetScreenVisible( 'BuildQueueMenu', 0); UI_SetScreenVisible( 'NewBuildMenu', 0); UI_SetScreenVisible( 'NewResearchMenu', 0); UI_SetScreenVisible( 'NewLaunchMenu', 0); UI_SetScreenVisible( 'EventsScreen', 0); UI_SetScreenVisible( 'selector', 0); UI_SetScreenVisible( 'New2', 1); UI_SetScreenVisible( 'New1', 0); UI_SetScreenVisible( 'YearMenu', 0); UI_SetScreenVisible( 'EnergyMenu', 0); UI_SetScreenVisible( 'MusicMenu', 0)",				
		helpTip = "DISABLE HUD (BACKSPACE)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\HUD.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {199,0},
		size = {12, 12},
		name = "btnMusicPlayer",
		onMouseClicked = "UI_ToggleScreen( 'MusicMenu', 1)",
		helpTip = "MUSIC PLAYER (\\)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\mp.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {213,0},
		size = {12, 12},
		name = "btnCinematic",
		onMouseClicked = "UI_SetScreenVisible( 'New3', 1)",	
		helpTip = "ENABLE CINEMATIC (ON SELECTION)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\Cinematic.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
	
---tubes		
	{
		type = "Button",
		position = {243,0},
		size = {12, 12},
		name = "tube1",
		onMouseClicked = "UI_SetScreenVisible( 'tube1', 1)",	
		helpTip = "CICLE FOCUS ON BOMB",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		DefaultGraphic = 
		{ 
			position = {0, 0},
			size = {12,12},
		        texture = "DATA:UI\\NewUI\\Taskbar\\tube.tga", 
			textureUV = {0,0,32,32},
			color = OUTLINECOLOR,
		}, 	
		OverGraphic = 
	        { 
	        texture = "DATA:UI\\NewUI\\Taskbar\\tubeC.tga", 
	        textureUV = { 0, 0, 32, 32, }, }, 
	        PressedGraphic = 
	        { 	        
	        texture = "DATA:UI\\NewUI\\Taskbar\\tubeC.tga", 
	        textureUV = { 0, 0, 32, 32, }, }, 			
	},	
	{
		type = "Button",
		position = {257,0},
		size = {12, 12},
		name = "tube2",
		onMouseClicked = "UI_SetScreenVisible( 'tube2', 1)",	
		helpTip = "CICLE FOCUS ON MISSILE",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		DefaultGraphic = 
		{ 
			position = {0, 0},
			size = {12,12},
		        texture = "DATA:UI\\NewUI\\Taskbar\\tube.tga", 
			textureUV = {0,0,32,32},
			color = OUTLINECOLOR,
		}, 	
		OverGraphic = 
	        { 
	        texture = "DATA:UI\\NewUI\\Taskbar\\tubeC.tga", 
	        textureUV = { 0, 0, 32, 32, }, }, 
	        PressedGraphic = 
	        { 	        
	        texture = "DATA:UI\\NewUI\\Taskbar\\tubeC.tga", 
	        textureUV = { 0, 0, 32, 32, }, }, 			
	},	
	{
		type = "Button",
		position = {271,0},
		size = {12, 12},
		name = "tube3",
		onMouseClicked = "UI_SetScreenVisible( 'tube3', 1)",	
		helpTip = "CICLE FOCUS ON MINE",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		DefaultGraphic = 
		{ 
			position = {0, 0},
			size = {12,12},
		        texture = "DATA:UI\\NewUI\\Taskbar\\tube.tga", 
			textureUV = {0,0,32,32},
			color = OUTLINECOLOR,
		}, 	
		OverGraphic = 
	        { 
	        texture = "DATA:UI\\NewUI\\Taskbar\\tubeC.tga", 
	        textureUV = { 0, 0, 32, 32, }, }, 
	        PressedGraphic = 
	        { 	        
	        texture = "DATA:UI\\NewUI\\Taskbar\\tubeC.tga", 
	        textureUV = { 0, 0, 32, 32, }, }, 			
	},	
	
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {301,0},
		size = {12, 12},
		name = "btnSelectVisible",
		onMouseClicked = "MainUI_UserEvent(eSelectAllVisible)", 		
		helpTip = "SELECT VISIBLE UNITS (CAPS LOCK)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\AllVisible.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},	
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {315,0},
		size = {12, 12},
		name = "btnIdleCollector",
		onMouseClicked = "SelectNextIdleHarvester()", 		
		helpTip = "SELECT IDLE COLLECTORS (.)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\IdleCollector.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},	
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {329,0},
		size = {12, 12},
		name = "btnHome",
		onMouseClicked = "MainUI_UserEvent(eMilitary)", 		
		helpTip = "SELECT MILITARY UNITS (A)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\Military.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
	
--temperature	
	{ 
    type = "Frame", 
    name = "sundamageframe",
    helpTip = "HULL TEMPERATURE (KELVIN)", 	--"TEMPERATURE HULL/SPACE (SELECTED SHIP)", 
    helpTipTextLabel = "commandsHelpTip", 
    helpTipScreen = "NewTaskbar",
    position = 
        { 48, 1, }, 
    size = {64, 9},    
    autoarrangeWidth = 30, 
;
{ 
    type = "TextLabel", 
    position = 
        { 2, 1, }, 
    size = 
        { 62, 9, }, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        color = "FEColorHeading3",             
        hAlign = "Center",	--"Left", 
        vAlign = "Center", }, 
    name = "sundamagetext", }, 
}, 
{ 
    type = "Frame", 
    name = "sundamageframered",
    helpTip = "HULL TEMPERATURE (KELVIN)", 	--TEMPERATURE HULL/SPACE (SELECTED SHIP)", 
    helpTipTextLabel = "commandsHelpTip", 
    helpTipScreen = "NewTaskbar",
    position = 
        { 48, 1, }, 
    size = {64, 9},     
    autoarrangeWidth = 30, 
; 
{ 
    type = "TextLabel", 
    position = 
        { 2, 1, }, 
    size = 
        { 62, 9, }, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        color = 
             { 222, 37, 19, 255, },          
        hAlign = "Center",	--"Left", 
        vAlign = "Center", }, 
    name = "sundamagetextred", }, 
}, 	
{ 
    type = "Frame", 
    name = "sundamageframeblu",
    helpTip = "HULL TEMPERATURE (KELVIN)",		--TEMPERATURE HULL/SPACE (SELECTED SHIP)", 
    helpTipTextLabel = "commandsHelpTip", 
    helpTipScreen = "NewTaskbar",
    position = 
        { 48, 1, }, 
    size = {64, 9},       
    autoarrangeWidth = 30, 
; 
{ 
    type = "TextLabel", 
    position = 
        { 2, 1, }, 
    size = 
        { 62, 9, }, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        color = 
             { 0, 118, 185, 235, },          
        hAlign = "Center",	--"Left", 
        vAlign = "Center", }, 
    name = "sundamagetextblu", }, 
}, 	
	
}

New2 = {    	
	size = {780, 580, 18, 18},
	stylesheet = "HW2StyleSheet",	
	onShow = "UI_HideScreen( 'New1')",
	--onHide = "UI_ShowScreen( 'New1', 1)",			
	pixelUVCoords = 1, 
	;		
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {0,0},
		size = {12, 12},
		name = "btnHUD1",		
		onMouseClicked = "UI_SetScreenVisible( 'NewTaskbar', 1); UI_SetScreenVisible( 'ResourceMenu', 1); UI_SetScreenVisible( 'New1', 1); UI_SetScreenVisible( 'New2', 0)",				
		helpTip = "ENABLE HUD (BACKSPACE)",
		helpTipTextLabel = "commandsHelpTip",	
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick", 
		; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {0,0},	   
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:UI\\NewUI\\Taskbar\\HUD1.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },										
				},
	},
}

New3 =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}
intro =  {    	
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,
	clickThrough = 1,
	;
	{
			type = "Frame",
			position = {272, 44},
			size = {256,256},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\intro.mres",				
			},						
		},		 				
	}

New4 =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}
intro =  {    	
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,
	clickThrough = 1,
	;
	{
			type = "Frame",
			position = {272, 44},
			size = {256,256},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\intro.mres",				
			},						
		},		 				
	}

tube1 =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
tube2 =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
tube3 =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}		

KeepPosition =  {   
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	

Free =  {   
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
	
enablemotion =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
disablemotion =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}		

planetbar =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}			
	