-- GUI layout for the collapsable queues in the build and research managers

-- _outlineColor => color of the queue outlines
-- _progressColor => color of the queue items progress bars
-- _droph => height of the drop down frame
function GetCollapsableQueue( _outlineColor, _progressColor, _droph )

local localCollapsableQueue = {
	type = "Frame",
	name = "collapsableQueue",
	visible = 0,
	;
	
	-- line
	{
		type = "Line",
		p1 = {189,0},
		p2 = {189, 20+_droph},
		above = 1,
		lineWidth = 2,
		color = _outlineColor,
	},
	
	-- Top frame
	{
		type = "Frame",
		name = "frameNonCollapsable",
		size = {209, 19},
		--backgroundColor = {100,0,0,200},
		;
		
		-- border frame
		{
			type = "Frame",
			position = {-1, 0},
			size = {210, 19},
			borderColor = _outlineColor,
			borderWidth = 1,
		},
			
		-- frame to hold the header
		{
			type = "Frame",
			name = "frameBuildQueueHeader",		
			position = {0, 3},
			size = {192, 15},
		},
		
		-- title label (displayed when queue is empty)
		{
			type = "TextLabel",
			name = "lblNoTasksPending",
			visible = 0,
			position = {0, 3},
			size = {192, 15},
			Text = {
				font = "ChatFont",
				color = {172,172,172,255},
				hAlign = "Left",
				offset = {4,0},	
			},
		},
	},
	
	-- Expandable frame
	{
		type = "Frame",
		name = "frameCollapsable",
		position = {0, 19},
		size = {209, _droph},
		--backgroundColor = {0,100,0,200},
		;
		-- border frame
		{
			type = "Frame",
			position = {-1, 0},
			size = {210, _droph},
			borderColor = _outlineColor,
			borderWidth = 1,
		},
		
		-- Build queue list box
		{
			type = "ListBox",	
			name = "listQueue",
			
			scrollBarSpace = 0,
			position = {0, 1},
			size = {206,_droph-2},
		},
	},
	
	-- Expand / Collapse build queue buttons
	{
		type = "Button",
		name = "btnExpandQueue",
		
		position = {193, 3},
		size = { 13, 13},
		flashSpeed = 300,
		DefaultGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.mres",
			textureUV = { 0, 0, 13, 13},
			color = _outlineColor,
		},
		OverGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 255, 255, 255, 255},
		},
		DisabledGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 48, 108, 136, 255},
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5209", -- EXPAND QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "Button",
		name = "btnCollapseQueue",
		visible = 0,
		position = {193, 3},
		size = { 13, 13},
		flashSpeed = 300,
		DefaultGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.mres",
			textureUV = { 0, 0, 13, 13},
			color = _outlineColor,
		},
		OverGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 255, 255, 255, 255},
		},
		DisabledGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 48, 108, 136, 255},
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5210", -- COLLAPSE QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "Button",
		name = "btnExpandEmptyQueue",
		visible = 0,
		position = {193, 3},
		size = { 13, 13},
		flashSpeed = 300,
		DefaultGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.mres",
			textureUV = { 0, 0, 13, 13},
			color = _outlineColor,
		},
		OverGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 255, 255, 255, 255},
		},
		DisabledGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\expand.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 48, 108, 136, 255},
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5209", -- EXPAND QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	{
		type = "Button",
		name = "btnCollapseEmptyQueue",
		visible = 0,
		position = {193, 3},
		size = { 13, 13},
		flashSpeed = 300,
		DefaultGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.mres",
			textureUV = { 0, 0, 13, 13},
			color = _outlineColor,
		},
		OverGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 255, 255, 255, 255},
		},
		DisabledGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\collapse.mres",
			textureUV = { 0, 0, 13, 13},
			color = { 48, 108, 136, 255},
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5210", -- COLLAPSE QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	
	-- Pause build queue button
	{
		type = "Button",
		name = "btnPauseQueue",
		
		toggleButton = 1,
		position = {174, 3},
		size = { 13, 13},
		flashSpeed = 300,
		DefaultGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\pause_large_new.tga",
			textureUV = { 0, 0, 26, 26},
			color = { 0, 175, 255, 255},
		},
		OverGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\pause_large_new.tga",
			textureUV = { 0, 0, 26, 26},
			color = { 255, 255, 255, 255},
		},
		DisabledGraphic = {
			size = { 13, 13},
			texture = "DATA:UI\\NewUI\\InGameIcons\\pause_large_new.tga",
			textureUV = { 0, 0, 26, 26},
			color = { 48, 108, 136, 255},
		},
		
		soundOnClicked = "SFX_ButtonClick",
		
		helpTip = "$5205", -- PAUSE QUEUE
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
	},
	
	-- Label to display # of items in queue
	{
		type = "TextLabel",
		visible = 0,
		name = "lblItemCount",
		position = {138, 3},
		size = {20, 13},
		--backgroundColor = {200,0,0,255},
		dropShadow = 1,
		giveParentMouseInput = 1,
		Text = {
			font = "ChatFont",
			color = {255,255,255,255},
			hAlign = "Right",
			vAlign = "Center",
			offset = {-2, 0},
		},
	},
	
	{		        
		type = "Button",
		position = {0, 0},
		size = {160, 13},
		onMousePressed = "UI_ToggleScreen( 'BuildQueueMenu', 1)",
		helpTip = "PRODUCTION QUEUES (Q)",
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",			
        },	
	
	-- Build queue list box item to clone
	{
		type = "ListBoxItem",
		name = "queueListBoxItem",
		size = {192, 15},
		visible = 0,
		enabled = 0,
		selectable = 0,
		borderWidth = 0,
		--borderColor = {0,0,0,0},
		--overBorderColor = {255,255,255,255},
		--pressedBorderColor = {255,255,255,255},
		;
		
		
		{ -- Do not change the child/parent structure of this without changing code
			type = "ProgressBar",
			progressColor = _progressColor, 
			position = {2,0},
			size = {155,13},
			name = "progressYella",
			backgroundColor = {127,127,127,35},	--{0,0,0,35}
			giveParentMouseInput = 1,			
			;			
			-- Ships name label (This -MUST- remain a child of the progress bar)
			-- Used in subsystem and ship queue
			{
				type = "TextLabel",			
				name = "lblName",
				position = {0,0},
				size = {157,13},
				giveParentMouseInput = 1,
				--dropShadow = 1,
				visible = 0, -- this gets custom rendered by QueueListBoxItem
				Text = {
					font = "ChatFont",
					color = {255,255,255,255},
					hAlign = "Left",
					vAlign = "Middle",
					offset = {2,0},
				},
			},
			
			-- Used for research queue (has a background icon)
			{
				type = "Frame",
				name = "frmResearchIcon",
				position = {2,2},
				size = {9,9},
				visible = 0,
			},
			
			{
				type = "TextLabel",
				name = "lblResearchName",
				position = {13,0},
				size = {144,13},
				giveParentMouseInput = 1,
				visible = 0, 			-- this gets custom rendered by QueueListBoxItem
				Text = {
					font = "ChatFont",
					color = {255,255,255,255},
					hAlign = "Left",
					vAlign = "Middle",
					offset = {2,0},
				},
			},
		},
		
		{
			type = "Button",
			name = "btnCancelBuildQueueItem",
			flashSpeed = 300,
			position = {159, 0},
			size = { 13, 13},
			DefaultGraphic = {
				size = { 13, 13},
				texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_large_new.tga",
				textureUV = { 0, 0, 26, 26},
				color = { 0, 175, 255, 255},
			},
			OverGraphic = {
				size = { 13, 13},
				texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_large_new.tga",
				textureUV = { 0, 0, 26, 26},
				color = { 255, 255, 255, 255},
			},
			DisabledGraphic = {
				size = { 13, 13},
				texture = "DATA:UI\\NewUI\\InGameIcons\\cancel_large_new.tga",
				textureUV = { 0, 0, 26, 26},
				color = { 48, 108, 136, 255},
			},
			
			soundOnClicked = "SFX_ButtonClick",
			
			helpTip = "$5206", -- CANCEL QUEUE ITEM
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
		},
		
		{
			type = "Button",
			name = "btnMoveBuildQueueItemToTop",
			flashSpeed = 300,
			position = {174, 0},
			size = { 13, 13},
			DefaultGraphic = {
				size = { 13, 13},
				texture = "DATA:UI\\NewUI\\InGameIcons\\move_to_top.mres",
				textureUV = { 0, 0, 13, 13},
				color = { 0, 175, 255, 255},
			},
			OverGraphic = {
				size = { 13, 13},
				texture = "DATA:UI\\NewUI\\InGameIcons\\move_to_top.mres",
				textureUV = { 0, 0, 13, 13},
				color = { 255, 255, 255, 255},
			},
			DisabledGraphic = {
				size = { 13, 13},
				texture = "DATA:UI\\NewUI\\InGameIcons\\move_to_top.mres",
				textureUV = { 0, 0, 13, 13},
				color = { 48, 108, 136, 255},
			},
			
			soundOnClicked = "SFX_ButtonClick",
			
			helpTip = "$5207", -- MOVE QUEUE ITEM TO TOP
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
		},
	},
}

return localCollapsableQueue;

end