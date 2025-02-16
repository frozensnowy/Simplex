-- These need to be the same as in finalbuild.lua (build menu)
SHIPQUEUECOLOR = {246, 212, 0, 127}	--{246, 212, 0, 255}
SUBQUEUECOLOR = {224, 150, 0 , 127}	--{224, 150, 0 , 255}
RESEARCHQUEUECOLOR = {64, 129, 249, 127}	--{64, 129, 249, 255}

-- These need to be the same as in research.lua (research menu)

MENUWIDTH = 250

SHIPTEXTCOLOR = { 170, 227, 255, 127}	--{ 170, 227, 255, 255}

ITEMTEXTCOLOR = {255,255,255,127}	--{255,255,255,255}

MAXHEIGHT = 325

PROGRESSBGCOLOR = { 70, 74, 85, 127}	--{ 70, 74, 85, 190}

BuildQueueMenu = {
	size = {2, 67, MENUWIDTH, 500},
	stylesheet = "HW2StyleSheet",

	RootElementSettings = {
		--backgroundColor = "IGColorBackground1",
		autosize = 1,
	},

	soundOnShow = "SFX_GlobalQueueONOFF",
	soundOnHide = "SFX_GlobalQueueONOFF",
	
	onShow = "UI_HideScreen('UnitCapInfoPopup'); UI_HideScreen('UnitCapInfoPopup1'); UI_HideScreen('selector'); UI_HideScreen('YearMenu'); UI_HideScreen('EnergyMenu')",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	-- custom values
	fstringBuild = "$2641",
	
	Regions = {
		{0,0,65, -1}, -- -1 means region will size to screen height
	},
	;
	
	-- root frame to insert build queue items
	{
		type = "Frame",
		name = "buildQueueFrame",
		position = { 0, -31},
		size = { MENUWIDTH, 10},
		autosize = 0,
		autoarrange = 1,
		--maxSize = {MENUWIDTH, MAXHEIGHT},
	},

	-- build queue item to clone
	{
		type = "Button",
		name = "buildQueueItem",
		position = { 0, 0},
		size = { MENUWIDTH, 28},
		visible = 0,
		
		;
		
		-- ship name
		{
			type = "TextLabel",
			position = { 2, 0},
			size = { MENUWIDTH-4, 11},
			name = "shipName",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = SHIPTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
			
		-- open build mgr button
		{
			type = "Button",
			name = "btnOpenBuildMgr",
			position = {0, 9},
			size = {64,19},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5450",--OPEN BUILD MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;			
			
			-- subsystem progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = SUBQUEUECOLOR,
				position = { 2, 1},
				size = { 40, 8},
				name = "subsystemBuildProgress",
				giveParentMouseInput = 1,
			},
	
			-- subsystem pause and cancel buttons
			{
				type = "Button",
				name = "subsystemPauseButton",
				position = { 44, 1},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			{
				type = "Button",
				name = "subsystemCancelButton",
				position = { 54, 1},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			
			-- ship progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = SHIPQUEUECOLOR,
				position = { 2, 10},
				size = { 40, 8},
				name = "buildProgress",
				giveParentMouseInput = 1,
			},
	
			-- pause and cancel buttons
			{
				type = "Button",
				name = "pauseButton",
				position = { 44, 10},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			{
				type = "Button",
				name = "cancelButton",
				position = { 54, 10},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
				
				soundOnClicked = "SFX_ButtonClick",
			},
			
		},		
		
		{
			type = "TextLabel",
			position = { 65, 9},
			size = { MENUWIDTH-66, 11},
			name = "subsystemBuildText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
		
		{
			type = "TextLabel",
			position = { 65, 18},
			size = { MENUWIDTH-66, 11},
			name = "buildText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
	},
	
	-- battle cruiser item to clone (can only build subsystems)
	{
		type = "Button",
		name = "subsystemQueueItem",
		position = { 0, 0},
		size = { MENUWIDTH, 24},
		visible = 0,
		;
		
		-- title
		{
			type = "TextLabel",
			position = { 2, 0},
			size = { MENUWIDTH-4, 12},
			name = "shipName",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = SHIPTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
			
		-- open research mgr button
		{
			type = "Button",
			name = "btnOpenBuildMgr",
			position = {0, 12},
			size = {64,12},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5451",--OPEN RESEARCH MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;
	
			-- progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = SUBQUEUECOLOR,
				position = { 2, 2},
				size = { 40, 8},
				name = "subsystemBuildProgress",
				giveParentMouseInput = 1,
			},
	
			-- pause and cancel buttons
			{
				type = "Button",
				name = "subsystemPauseButton",
				position = { 44, 2},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
			},
			{
				type = "Button",
				name = "subsystemCancelButton",
				position = { 54, 2},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
			},
		},

		{
			type = "TextLabel",
			position = { 65, 12},
			size = { MENUWIDTH-66, 13},
			name = "subsystemBuildText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
	},
	
	-- research queue item to clone
	{
		type = "Button",
		name = "researchQueueItem",
		position = { 0, 0},
		size = { MENUWIDTH, 20},
		visible = 0,
		;
		
		-- title
		{
			type = "TextLabel",
			position = { 2, 0},
			size = { MENUWIDTH-4, 11},
			name = "shipName",
			Text = {
				text = "Research",
				font = "ChatFont",
				hAlign = "Left",
				color = SHIPTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
			
		-- open research mgr button
		{
			type = "Button",
			name = "btnOpenResearchMgr",
			position = {0, 9},
			size = {64,10},
			borderWidth = 1,
			borderColor = { 0, 0, 0, 0},
			overBorderColor = { 0, 175, 255, 255},
			pressedBorderColor = { 255, 255, 255, 255},
			
			helpTip = "$5451",--OPEN RESEARCH MANAGER
			helpTipScreen = "NewTaskbar",
			helpTipTextLabel = "commandsHelpTip",
			;
			
			
	
			-- progress
			{
				type = "ProgressBar",
				backgroundColor = PROGRESSBGCOLOR,
				progressColor = RESEARCHQUEUECOLOR,
				position = { 2, 1},
				size = { 40, 8},
				name = "researchProgress",
				giveParentMouseInput = 1,
			},
	
			-- pause and cancel buttons
			{
				type = "Button",
				name = "pauseButton",
				position = { 44, 1},
				size = { 8, 8},
				flashSpeed = 300,
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\pause_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
			},
			{
				type = "Button",
				name = "cancelButton",
				position = { 54, 1},
				size = { 8, 8},
				DefaultGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 0, 175, 255, 255},
				},
				OverGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 255, 255, 255, 255},
				},
				DisabledGraphic = {
					size = { 8, 8},
					texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_mini_large_new.tga",
					textureUV = { 0, 0, 16, 16},
					color = { 48, 108, 136, 255},
				},
			},
		},

		{
			type = "TextLabel",
			position = { 65, 8},
			size = { MENUWIDTH-66, 11},
			name = "researchText",
			Text = {
				font = "ChatFont",
				hAlign = "Left",
				color = ITEMTEXTCOLOR,
			},
			giveParentMouseInput = 1,
			dropShadow = 1,
		},
	},
}
