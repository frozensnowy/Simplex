OUTLINECOLOR = {54, 138, 170, 65}	--{ 200, 200, 200, 225, }
SHIPQUEUECOLOR = {246, 212, 0, 170}	--{246, 212, 0, 255}
SUBQUEUECOLOR = {224, 150, 0, 170}	--{224, 150, 0, 255}

DISABLEDICONCOLOR = { 125, 125, 125, 65, }	--{ 200, 200, 200, 100, }

ITEMDEFAULTCOLOR = { 200, 200, 200, 65, }	--{ 125, 125, 125, 225, }
ITEMOVERCOLOR = {175, 175, 175, 50,}
ITEMPRESSEDCOLOR = {225, 225, 225, 255,}

UNITCAPSREACHEDCOLOR1 = {180,0,0,65} --{180,0,0,255}-- outline color
UNITCAPSREACHEDCOLOR2 = {255,0,0,30} -- background color

dofilepath("data:ui/newui/build/collapsablequeue.lua")

NewBuildMenu = {
	size = {586, 15, 212, 497},
	resolution = {800, 600},
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		backgroundColor = "IGColorBackground1",
	},
	
	--
	soundOnShow = "SFX_BuildMenuONOFF",
	soundOnHide = "SFX_BuildMenuONOFF",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	onShow = "UI_SubtitleNarrow()",
	onHide = "UI_HideScreen(\"BuildInfo\"); UI_SubtitleWide()",
	
	
	-- Custom to build menu	
	textureFolder = "DATA:\\UI\\NewUI\\Build",
	drawToShipLineWidth = 1,
	drawToShipLineStubLength = 10,	
	--drawToShipLineColor = {238,188,5,255},
	drawToShipLineColor = {54, 138, 170, 225},	--OUTLINECOLOR,
	drawToShipLineElement = "btnPrev", -- element to draw the toship line from (draws from the left edge)
	
	neverAvailBorderColor = {0,0,0,65},	--{0,0,0,255}, -- disabled color for facility buttons that are never available
	notYetAvailBorderColor = DISABLEDICONCOLOR, -- disabled color for facility buttons that are not yet available
	unitCapsReachedColor = UNITCAPSREACHEDCOLOR2,
	unitCapsReachedTextColor = {180,0,0,255},	--UNITCAPSREACHEDCOLOR1
	
	fstringRU = "$2640",  -- The localizer id for a string that says RU (appears to the left of the ship price on the items)
	fstringQueue = "$2641", -- The localizer id for the format string for the build queue item
	fstringSubsytemsReplace = "$2565", -- REPLACE : %d
	
	queuesFramePos = 494, -- y position of the bottom of the collapsable queues frame
	
	shipNameDisabledColor = {175,175,175,255},
	
	shipQueueTitle = "$2566",--Ship Queue (Empty)
	subsystemQueueTitle = "$2567",--Subsystem Queue (Empty)
		
	subsysColor = SUBQUEUECOLOR,
	
	menuColor = "FEColorGameElement",	--OUTLINECOLOR
	
	fstringHardpoints = "$2568",		-- format string for harpoint slots at top of menu
	fstringUnitCaps = "$2569",  -- format string for unit caps headers (%06x is for the color [ red when maxed out ])
	;
	
	-- Title
	{
		type = "TextLabel",		
		position = {0, 2},
		size = {210, 19},
		backgroundColor = OUTLINECOLOR,
		name = "lblTitle",		
		Text = {
			textStyle = "IGHeading1",
			text = "BUILD MENU",  -- BUILD MENU
			offset = {4,0},
			color = "FEColorItemTitle",	--{0,0,0,255},
		},
		;
		
		-- More Info button
		--{
			--type = "TextButton",
			--position = {138, 3},
			--size = { 49, 13, }, 
			--buttonStyle = "Taskbar_MenuButtonStyle",
			--Text = 
			--{ 
        --textStyle = "Taskbar_MenuButtonTextStyle", 
        --text = "MORE INFO",
      --}, 
			--onMouseClicked = "UI_ToggleScreen( 'gallery', 0)", 			
			--helpTip = "MORE BUILD INFO", 
			--helpTipTextLabel = "commandsHelpTip",
			--helpTipScreen = "NewTaskbar",			
		--},
		
		-- Close button
		{
			type = "Button",
			position = {193, 2},
			buttonStyle = "IGCloseButton",
			onMouseClicked = "UI_HideScreen('NewBuildMenu')",
			
			helpTip = "$5208", -- CLOSE WINDOW
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			hotKeyID = 51,
		},
	},
	
	-- Ship graphic
	{	
		type = "Frame",
		position = {3, 35},
		--size = {193, 57},
		size = {200, 64},
		name = "frameShipGraphic",
		--backgroundColor = {255,255,255,100},
		backgroundGraphicHAlign = "Center",
		backgroundGraphicVAlign = "Center",
		
		helpTip = "$5201", -- CLICK ICON TO FOCUS
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "ProgressBar",
		backgroundColor = { 0, 128, 0, 255},
		progressColor = { 0, 255, 0, 255},
		borderColor = { 0, 0, 0, 255},
		outerBorderWidth = 1,
		position = { 57, 88},
		size = { 100, 2},
		name = "buildShipHealth",
	},
	
	--
	{
		type = "Line",
		p1 = {208, 19},
		p2 = {208, 185},
		above = 1,
		lineWidth = 2,
		color = OUTLINECOLOR,
	},
	
	
	-- Prev button
	{
		type = "Button",
		name = "btnPrev",
		buttonStyle = "IGPrevButton",
		toggleButton = 0,
		position = {2,23},
		OverGraphic = {
			texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.tga",
			textureUV = { 0, 62, 26, 206},
			color = {255, 255, 255, 127},	--OUTLINECOLOR,
		},
		
		helpTip = "$5203", -- PREVIOUS BUILD SHIP
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	
	-- Choose ship combo box
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "IGDropDownListBoxStyle",
		position = {17, 23},
		width = 174,
		visible = 1,
		name  = "comboBuildShip",
		
		ListBox = {
			type = "ListBox",
			name = "comboBuildShipListBox",
			size = { 174, 130},
			backgroundColor = "IGColorBackground1",
			
		},
		
		helpTip = "$5200", -- SELECT BUILD SHIP
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	
	-- Next button
	{
		type = "Button",
		name = "btnNext",
		toggleButton = 0,
		buttonStyle = "IGNextButton",
		position = {193,23},
		OverGraphic = {
			texture = "DATA:UI\\NewUI\\InGameIcons\\info_buttons.tga",
			textureUV = { 26, 62, 0, 206},
			color = {255, 255, 255, 127},	--OUTLINECOLOR,
		},
		
		helpTip = "$5202", -- NEXT BUILD SHIP
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	
	
	 -- Combo box item to clone
	{
		type = "TextListBoxItem",
		buttonStyle = "IGListBoxItemButtonStyle",
		
		name = "buildShipDropDownListBoxItem",		
		visible = 0,
		enabled = 0,		
		width = 160,
		
		Text = {
			textStyle = "IGListBoxItemTextStyle",
		},
	},
	
	-- Subsystem text labels
	{
		type = "Frame",
		position = {4, 97},
		size = {202, 36},
		;
		-- hardpoint names
		{
			type = "TextLabel",
			position = {0, 0},
			size = {150, 12},
			dropShadow = 1,
			Text = {
				text = "$2815", -- "Production Slots",
				textStyle = "IGHeading2",
				vAlign = "Top",
			},
		},
		{
			type = "TextLabel",
			position = {0, 12},
			size = {150, 12},
			dropShadow = 1,
			Text = {
				text = "$2816", -- "Module Slots",
				textStyle = "IGHeading2",
				vAlign = "Top",
			},
		},
		{
			type = "TextLabel",
			position = {0, 24},
			size = {175, 12},
			dropShadow = 1,
			Text = {
				text = "Special Slots (Sensors, Weapons)", 
				textStyle = "IGHeading2",
				vAlign = "Top",
			},
		},
		
		-- hardpoint status
		{
			type = "TextLabel",
			name = "lblProductionCount",
			position = {150, 0},
			size = {52, 12},
			dropShadow = 1,
			Text = {
				textStyle = "IGHeading2",
				vAlign = "Top",
				hAlign = "Right",
				offset = {-2, 0},
			},
		},
		{
			type = "TextLabel",
			name = "lblModuleCount",
			position = {150, 12},
			size = {52, 12},
			dropShadow = 1,
			Text = {
				textStyle = "IGHeading2",
				vAlign = "Top",
				hAlign = "Right",
				offset = {-2, 0},
			},
		},
		{
			type = "TextLabel",
			name = "lblSensorsCount",
			position = {150, 24},
			size = {52, 12},
			dropShadow = 1,
			Text = {
				textStyle = "IGHeading2",
				vAlign = "Top",
				hAlign = "Right",
				offset = {-2, 0},
			},
		},
	},
	
	
		
	-- Build Buttons
	-- NOTICE: The names of these buttons must match the family names (the strcmp is case insensitive)
	{
		type = "Frame",
		name = "frameButtonGroup",
		position = {2, 147},
		size = {212, 41},
		autoarrange = 1,
		autoarrangeWidth = 212,
		autoarrangeSpace = -1,
		
		helpTip = "$5211", -- SELECT FACILITY
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		;
		
		-- Normal facility buttons
		
		{
		type = "RadioButton",
		--toggleButton = 1,
		--position = {2,132},
		buttonStyle = "IGButtonShipCommand",	--"IGButtonShowAll"
		name = "Orders",
		Text = {
			text = "SHIP COMMAND",
		},		
		helpTipTextLabel = "lblCurrentFacility",
		helpTip = "SHIP COMMAND (orders/manage ship)",
				
		--DefaultGraphic = {
		  --size = { 73, 13},
			--texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres",
			--textureUV = {0,15,206,30},
			--color = OUTLINECOLOR,
		--},
		--OverGraphic = {
			--texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres",
			--textureUV = {0,15,206,30},
			--color = OUTLINECOLOR,
		--},
		PressedGraphic = {
			texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres",
			textureUV = {0,15,206,30},
			color = OUTLINECOLOR,
		},
		--DisabledGraphic = {
			--texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres",
			--textureUV = {0,15,206,30},
			--color = OUTLINECOLOR,
		--},
		--BackgroundGraphic = {
			--texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres",
			--textureUV = {0,15,206,30},
			--color = OUTLINECOLOR,
		--},
	},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonUtility",
			name = "Utility",
			helpTip = "$2623",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 94,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonCorvette",
			name = "Corvette",
			helpTip = "$2624",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 91,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonCapital",
			name = "Capital",
			helpTip = "$2625",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 93,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemModules",
			name = "SubSystemModule",
			helpTip = "MODULE SUBSYSTEM (ALT+D)",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 95,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors",
			helpTip = "SPECIAL SUBSYSTEM (ALT+Q)",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 97,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonFighter",
			name = "Fighter",
			helpTip = "$2627",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 90,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonFrigate",
			name = "Frigate",			
			helpTip = "$2628",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 92,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonPlatform",
			name = "Platform",
			helpTip = "$2629",
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = 96,
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "Weapon",
			helpTip = "SPECIAL WEAPON",
			helpTipTextLabel = "lblCurrentFacility",
			--hotKeyID = 96,
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensorsup",
			helpTip = "SPECIAL SUBSYSTEM (WEAPON TOP)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpointup.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensorsdown",
			helpTip = "SPECIAL SUBSYSTEM (WEAPON BOTTOM)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpointdown.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensorsleft",
			helpTip = "SPECIAL SUBSYSTEM (WEAPON LEFT)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpointleft.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensorsright",
			helpTip = "SPECIAL SUBSYSTEM (WEAPON RIGHT)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpointright.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors5z",
			helpTip = "MODULAR WEAPON (FRONT TOP)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpointup.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors6z",
			helpTip = "MODULAR WEAPON (FRONT BOTTOM)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpointdown.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors1z",
			helpTip = "MODULAR WEAPON (TOP LEFT)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint_tl.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors2z",
			helpTip = "MODULAR WEAPON (TOP RIGHT)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint_tr.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors3z",
			helpTip = "MODULAR WEAPON (BOTTOM LEFT)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint_bl.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors4z",
			helpTip = "MODULAR WEAPON (BOTTOM RIGHT)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint_br.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors100",
			helpTip = "SPECIAL SUBSYSTEM (ADV. ASSET, EXP. 100)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 				
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors200",
			helpTip = "SPECIAL SUBSYSTEM (ADV. ASSET, EXP. 200)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 7, 6, }, 
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors300",
			helpTip = "SPECIAL SUBSYSTEM (ADV. ASSET, EXP. 300)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {10,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
		},		
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors400",
			helpTip = "SPECIAL SUBSYSTEM (ADV. ASSET, EXP. 400)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {10,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {11,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensors500",
			helpTip = "SPECIAL SUBSYSTEM (ADV. ASSET, EXP. 500)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {10,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {11,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
				{ 
				  type = "Frame", 
				  size = { 7, 6, },  
				  position = {12,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\medal_icon.mres",
						textureUV = {0,0,13*2,13*2},
						color = OUTLINECOLOR,
					},								
				},
		},
		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemModuleCivil",
			helpTip = "CIVILIAN BARRACKS (recruit civilians)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\civilian.tga",
			        textureUV = { 1, -0, 65, 65, },
			    },										
				},
		},		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemModulePilot",
			helpTip = "CREW BARRACKS (recruit pilots)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\pilot.tga",
			        textureUV = { 1, -0, 65, 65, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemModuleOfficer",
			helpTip = "OFFICER BARRACKS (recruit officers)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\officer.tga",
			        textureUV = { 1, -0, 65, 65, },
			    },										
				},
		},	
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemModuleRank",
			helpTip = "COMMAND RANK (gain military ranks)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\rank.tga",
			        textureUV = { 0, 0, 60, 60, },
			    },										
				},
		},	
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemModuleResearch",
			helpTip = "RESEARCH DIVISIONS (unlock technologies/upgrades)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 12, 12, }, 
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "data:ui\\newui\\research\\icons\\tech.mres",
			        textureUV = { 0, 0, 17*2, 17*2, },
			    },										
				},
		},
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensorsPowerUp",
			helpTip = "POWER UP",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\powerup.tga",
			        textureUV = { 0, 0, 65, 65, },
			    },										
				},
		},		
		{
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SubSystemSensorsTeroidal",
			helpTip = "TEROIDAL MAGNET (increase power)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 7, 7, }, 
				  position = {9,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
            { 
              texture = "data:ui\\newui\\ingameicons\\lightning_yellow.mres", 
              textureUV = 
                  { 0, 0, 13*2, 13*2, }, 
              color = OUTLINECOLOR, }, 				
				},
		},
    {
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "planet_tech",
			helpTip = "PLANET TECHNOLOGIES (Improve planet)",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 18, 18, }, 
				  position = {3,3},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
            { 
              texture = "DATA:\\Ship\\Icons\\subs\\planet_tech.tga",
			        textureUV = { 0, 0, 105, 105, },     
            },							
				},
		},			
		
    {
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "PrimaryPerk",
			helpTip = "PRIMARY PERK",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},	
    {
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "SecondaryPerk",
			helpTip = "SECONDARY PERK",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},	
    {
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "ChooseYourGeneral",
			helpTip = "VOTE FOR YOUR PRESIDENT",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {8,9},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\rank.tga",
			        textureUV = { 0, -0, 60, 60, },
			    },										
				},
		},
    {
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "ExperienceAbility",
			helpTip = "SPECIAL ABILITIES",
			helpTipTextLabel = "lblCurrentFacility",			
			; 
				{ 
				  type = "Frame", 
				  size = { 13, 13, }, 
				  position = {10,10},	    
				  giveParentMouseInput = 1, 
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\redpoint.tga",
			        textureUV = { 0, -0, 90, 90, },
			    },										
				},
		},	
    {
			type = "RadioButton",
			buttonStyle = "IGButtonSubsystemSensors",
			name = "Merc_Upgrades",
			helpTip = "UPGRADES",
			helpTipTextLabel = "lblCurrentFacility",
			;
				{
				  type = "Frame",
				  size = { 13, 13, },
				  position = {8,9},
				  giveParentMouseInput = 1,
				  BackgroundGraphic =
			    {
			        texture = "DATA:\\Ship\\Icons\\ships\\powerup.tga",
			        textureUV = { 0, 0, 65, 65, },
			    },
				},
		},
		
		
	},
	
	
	-- Show all button
	{
		type = "TextButton",
		toggleButton = 1,
		position = {1,132},
		buttonStyle = "IGButtonShowAll",
		name = "btnShowAll",
		Text = {
			text = "$5212", -- "SHOW ALL FACILITIES",
		},
		
		helpTipTextLabel = "lblCurrentFacility",
		helpTip = "$2630", -- SHOW ALL FACILITIES
		
		hotKeyID = 98,
		
		PressedGraphic = {
			texture = "data:ui\\newui\\facility\\facilities_icons_showall.mres",
			textureUV = {0,15,206,30},
			color = OUTLINECOLOR,
		},
	},
	
	----------------------------------------------------- Facility Sub Heading
	{
		type = "TextLabel",
		position = {0,185},
		size = {210,13},
		backgroundColor = OUTLINECOLOR,
		name = "lblCurrentFacility",
		Text = {
			textStyle = "IGHeading2",
			color = "FEColorItemTitle",	--{0,0,0,255}, -- black
			offset = {6,0},
			vAlign = "Middle",
		},
	},
	
	---------------------------------------- Unit caps label
	{
		type = "TextLabel",
		position = {171,185},
		--size = {60,13},
		size = {0,0},
		name = "lblFacilityUnitCaps",		
		Text = {
			textStyle = "IGHeading2",
			color = "FEColorItemTitle",	--{0,0,0,255}, -- black
			offset = {0,0},
			vAlign = "Middle",
			hAlign = "Right",
			text = "12/12",			
		},
	},
	{
		type = "TextLabel",
		position = {150,185},
		size = {60,13},
		name = "lblFacilityUnitCaps1",		
		Text = {
			textStyle = "IGHeading2",
			color = "FEColorItemTitle",	--{0,0,0,255}, -- black
			offset = {-4,0},
			vAlign = "Middle",
			hAlign = "Right",						
		},
	},
	
	---------------------------------- Build List Box
	{
		type = "ListBox",
		position = {-3, 200}, --177
		size = {211, 300},
		name = "listBuild",
		scrollBarSpace = 2,
		marginWidth = 2,
		marginHeight = 0,
		outerBorderWidth = 2,
		borderColor = OUTLINECOLOR,
		
		contentsOuterBorderWidth = 2,
		contentsBorderColor = OUTLINECOLOR,
		
		ScrollBar = {
			stepSize = 3,
			pageSize = 100,
			marginHeight = 2,
		},
		;
	},
	
	
	-- SHOW ALL - SHIP ITEM
	{
		type = "Button",
		size = {185,15},
		name = "showAllItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		
		flashColor = {255,255,255,65},
		
		soundOnClicked 		= "SFX_BuildItemClick",
		;
		
		-- more info button
		{
			type = "Button",
			name = "buildInfo",
			position = {3, 2},
			size = {13, 13},
			DefaultGraphic = {
				texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				textureUV = {0,0,13,13},
				color = ITEMDEFAULTCOLOR,
			},
			OverGraphic = {
				texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				textureUV = {0,0,13,13},
				color = {255, 255, 255, 127},	--OUTLINECOLOR,
			},
			--PressedGraphic = {
			--	texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
			--	textureUV = {0,0,13,13},
			--	color = ITEMPRESSEDCOLOR,
			--},
			
			helpTip = "$5213", -- SHOW BUILD INFO
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
		},
			
		-- ship name / price button
		{
			type = "Button",
			position = {18,2},
			size = {164,13},
			
			overColor = ITEMOVERCOLOR,
			pressedColor = ITEMOVERCOLOR,
			flashColor = ITEMOVERCOLOR,
			
			DefaultGraphic = {
				texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				textureUV = {16,0,180,13},
				--color = ITEMDEFAULTCOLOR,
				color = "FEColorItemBackground",	--{0,0,0,255},
			},
			OverGraphic = {
				texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				textureUV = {16,0,180,13},
				color = OUTLINECOLOR,
			},
			PressedGraphic = {
				texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
				textureUV = {16,0,180,13},
				color = ITEMPRESSEDCOLOR,
			},
			--overBorderColor = {255,255,255,255},
			--pressedBorderColor = {255,255,255,255},
			--pressedColor = {0,175,255,127},
			--flashColor = {0,175,255,127},
			--borderWidth = 1,
			
			
			helpTip = "$5204", -- CLICK ITEM TO BUILD
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			;
			
			-- Ship name label
			{
				type = "TextLabel",
				name = "lblShipName",
				position = {0, 0},
				size = {145,13},			
				giveParentMouseInput = 1,
				Text = {				
					font = "ChatFont",	--textStyle = "IGListBoxItemTextStyle",
					color = {255,255,255,255},
					offset = {5,0},
					hAlign = "Left",
					vAlign = "Middle",
				},
			},
			-- Ship name label (UNIT CAPS REACHED)
			{
				type = "TextLabel",
				name = "lblShipNameUnitsReached",
				visible = 0,
				position = {0, 0},
				size = {125,13},			
				giveParentMouseInput = 1,
				Text = {				
					font = "ChatFont",	--textStyle = "IGListBoxItemTextStyle",
					color = {180,0,0,255},	--UNITCAPSREACHEDCOLOR1
					offset = {5,0},
					hAlign = "Left",
					vAlign = "Middle",
				},
			},
			
			-- Ship price label
			{
				type = "TextLabel",
				name = "lblShipPrice",
				position = {126, 0},
				size = {37,13},
				giveParentMouseInput = 1,
				Text = {
					font = "ListBoxItemFont",
					hAlign = "Right",
					vAlign = "Middle",
					color = "FEColorItemTitle",	--"FEColorHeading3"
					offset = {-4, 0},
				},
			},
		},
	},
	
	
	--  SHOW ALL - FAMILY ITEM
	{
		type = "ListBoxItem",
		size = {188,13},
		name = "showAllFamilyItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		autosize = 1,
		;
		
		{
			type = "Frame",
			position = {3,2},
			autosize = 1,
			autoarrange = 1,
			;
			-- header w / title
			{
				type = "TextLabel",
				name = "lblTitle",
				size = {185, 13},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,0,185,13},
					color = ITEMDEFAULTCOLOR,
				},
				
				Text = {			
					font = "ListBoxItemFont",
					vAlign = "Middle",
					hAlign = "Left",
					offset = {4,0},
					color = "FEColorItemTitle",	--{0,0,0,255},
				}
				;
				
				{
					type = "TextLabel", -- used to display unit caps
					name = "lblShowAllFamilyUnitCaps",
					position = {145, 0},
					--size = {60, 13},
					size = {0, 0},
					visible = 0,
					Text = {
						font = "ListBoxItemFont",
						vAlign = "Middle",
						hAlign = "Right",
						offset = {0, 0},
						color = "FEColorItemTitle",	--{0,0,0,255},
					},
				},
			},
			
			-- Item tray (holds small show all items)
			{
				type = "Frame",
				name = "frmSmallShipItems",
				autosize = 1,
				autoarrange = 1,
				size = {185, 13},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,14,185,25},
					color = ITEMDEFAULTCOLOR,
				},
			},
			-- footer
			{
				type = "Frame",
				size = {185, 5},
				BackgroundGraphic = {
					size = {185, 4},
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,28,185,32},
					color = ITEMDEFAULTCOLOR,
				},
			},
		},
	},
	
	-- BUILD ITEM - BIG ICON
	{
		type = "ListBoxItem",
		size = {188,31}, 
		name = "m_buildItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		
		--flashColor = ITEMOVERCOLOR,
		flashColor = {255,255,255,65},
		
		soundOnClicked 		= "SFX_BuildItemClick",
		;
		
		-- Info label
		{
			type = "Button",
			name = "buildInfo",
			position = {3,1},
			size = {13,30},
			
			--borderWidth = 1,
			--borderColor = {80,175,255,255},
			--overBorderColor = OUTLINECOLOR,
			--disabledBorderColor = {80,175,255,255},
			
			DefaultGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres",
				textureUV = {0,0,13,30},
				color = ITEMDEFAULTCOLOR,
			},
			OverGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres",
				textureUV = {0,0,13,30},
				color = {255, 255, 255, 127},	--OUTLINECOLOR,
			},
			--PressedGraphic = {
			--	texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres",
			--	textureUV = {0,0,170,30},
			--	color = {185,136,0,255},
			--},
			DisabledGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres",
				textureUV = {0,0,13,30},
				color = DISABLEDICONCOLOR, -- color for already built item
			},
			
			helpTip = "$5213", -- SHOW BUILD INFO
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
		},
		
		-- Button (for mouse over effect etc)
		{
			type = "Button",
			name = "m_btnItemButton",
			position = {18, 1},
			size = {170, 30},
			
			-- temp, pending textures
			--borderWidth = 1,
			--borderColor = {80,175,255,255},
			--overBorderColor = OUTLINECOLOR,
			--disabledBorderColor = {0,0,0,255}, -- color for already built item
			--pressedBorderColor = {185,136,0,255},
			
			backgroundColor = {0,0,0,35},
			overColor = ITEMOVERCOLOR,
			pressedColor = ITEMOVERCOLOR,
			flashColor = ITEMOVERCOLOR,
			
			DefaultGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\item_borders.mres",
				textureUV = {0,0,170,30},
				color = ITEMDEFAULTCOLOR,
			},
			BackgroundGraphic2 = { --Used for when unit caps are reached for this item
				texture = "data:ui\\newui\\InGameIcons\\item_borders.mres",
				textureUV = {0,0,170,30},
				color = UNITCAPSREACHEDCOLOR1,
			},
			OverGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\item_borders.mres",
				textureUV = {0,0,170,30},
				color = OUTLINECOLOR,
			},
			PressedGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\item_borders.mres",
				textureUV = {0,0,170,30},
				color = ITEMPRESSEDCOLOR,
			},
			DisabledGraphic = { -- same as disabled icons
				texture = "data:ui\\newui\\InGameIcons\\item_borders.mres",
				textureUV = {0,0,170,30},
				color = "FEColorItemBackground",	--{0,0,0,255},
			},
			
			helpTip = "$5204", -- CLICK ITEM TO BUILD
			disabledHelpTip = "$5214", -- ITEM CURRENTLY UNAVAILABLE
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			;
			
			-- Ship icon
			{
				type = "Frame",
				name = "frameIcon",
				position = {0, -1},
				size = {80, 32},
				giveParentMouseInput = 1,
				backgroundGraphicVAlign = "Center",
			},
				
			-- Ship name label
			{
				type = "TextLabel",
				name = "lblShipName",
				position = {13, 2},
				size = {154,12},
				Text = {
					color = {56, 162,250,255},
					font = "ChatFont",	--ListBoxItemFont
					hAlign = "Right",
					vAlign = "Center",
					offset = {-1,0},
				},
				giveParentMouseInput = 1,
				dropShadow = 1,
			},
			
			-- Ship price label
			{
				type = "TextLabel",
				name = "lblShipPrice",
				position = {13, 14},
				size = {154,12},
				Text = {
					color = "FEColorHeading3",
					font = "ListBoxItemFont",
					hAlign = "Right",
					vAlign = "Center",
					offset = {-2,0},
				},
				giveParentMouseInput = 1,
				dropShadow = 1,
			},
			-- Subsystem Replace label
			{
				type = "TextLabel",
				name = "lblShipPriceReplace",
				position = {13, 14},
				size = {154,12},
				visible = 0,
				Text = {
					color = "FEColorHeading3",	--{255,255,255,255},
					font = "ListBoxItemFont",
					hAlign = "Right",
					vAlign = "Center",
					offset = {-2,0},
				},
				giveParentMouseInput = 1,
				dropShadow = 1,
			},
			-- Not avail label
			{
				type = "TextLabel",
				name = "lblNotAvailable",
				visible = 0,
				position = {13, 14},
				size = {154,12},
				Text = {
					color = {100,100,100,255},
					font = "ListBoxItemFont",
					hAlign = "Right",
					vAlign = "Center",
					offset = {-2,0},
				},
				giveParentMouseInput = 1,
				dropShadow = 1,
			},
			-- lblAlreadyBuilt
			{
				type = "TextLabel",
				name = "lblAlreadyBuilt",
				visible = 0,
				position = {13, 14},
				size = {154,12},
				Text = {
					text = "$2637", -- "BUILT",
					textStyle = "IGButtonTextStyle",
					color = "FEColorHeading3",	--{255,255,255,255},
					font = "ListBoxItemFont",
					hAlign = "Right",
				},
				giveParentMouseInput = 1,
				dropShadow = 1,
			},
		},
	},
	
	-- EMPTY ITEM
	{
		type = "ListBoxItem",
		size = {188,31}, 
		name = "m_emptyBuildItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		;
		
		-- Info label
		{
			type = "Button",
			position = {3,1},
			size = {13,30},
			DefaultGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\info_buttons.mres",
				textureUV = {0,0,13,30},
				color = "FEColorItemBackground",	--{0,0,0,255},
			},
		},
		
		-- Button 
		{
			type = "Button",
			position = {18, 1},
			size = {170, 30},
			
			-- temp, pending textures
			DefaultGraphic = {
				texture = "data:ui\\newui\\InGameIcons\\item_borders.mres",
				textureUV = {0,0,170,30},
				color = "FEColorItemBackground",	--{0,0,0,255},
			},
			
			;
		}
	},
	
	-- EMPTY SHOW ALL ITEM
	{
		type = "ListBoxItem",
		size = {188,13},
		name = "m_emptyShowAllItemToClone",
		visible = 0,
		enabled = 0,
		selectable = 0,
		autosize = 1,
		;
		
		{
			type = "Frame",
			position = {3,2},
			autosize = 1,
			;
			-- header w / title
			{
				type = "Frame",
				position = {0,0},
				size = {185, 13},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,0,185,13},
					color = "FEColorItemBackground",	--{0,0,0,255},
				},
			},
			
			-- Item tray (holds small show all items)
			{
				type = "Frame",
				position = {0,13},
				size = {185, 17},
				BackgroundGraphic = {
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,14,185,25},
					color = "FEColorItemBackground",	--{0,0,0,255},
				},
				;
				
				-- more info frame
				{
					type = "Frame",
					position = {3, 4},
					size = {13, 13},
					BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
						textureUV = {0,0,13,13},
						color = "FEColorItemBackground",	--{0,0,0,255},
					},
				},
				
				--ship name / price frame
				{
					type = "Frame",
					position = {18,4},
					size = {164,13},
					
					BackgroundGraphic = {
						texture = "data:ui\\newui\\ingameicons\\research_borders.mres",
						textureUV = {16,0,180,13},
						color = "FEColorItemBackground",	--{0,0,0,255},
					},
				},
			},
			-- footer
			{
				type = "Frame",
				position = {0, 30},
				size = {185, 5},
				BackgroundGraphic = {
					size = {185, 4},
					texture = "data:ui\\newui\\ingameicons\\show_all_borders.mres",
					textureUV = {0,28,185,32},
					color = "FEColorItemBackground",	--{0,0,0,255},
				},
			},
		},
	},
	
	
		
	-- Collapsable build queue to clone
	GetCollapsableQueue( OUTLINECOLOR, SHIPQUEUECOLOR,65 ),
	
	-- Frame to hold expandable build queues.
	{
		type = "Frame",
		position = {0,393},
		name = "frameQueues",
		autosize = 1,
		autoarrange = 1,
		autoarrangeSpace = 0,
		autoarrangeWidth = 393,
		customData = 4, --Amount of spacing to put between queue frame and bottom of build list
		outerBorderWidth = 1, 
		borderColor = OUTLINECOLOR,		
	},
}
