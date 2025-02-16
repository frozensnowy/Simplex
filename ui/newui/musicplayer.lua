MusicMenu = 
{
	size = {214,418,374,34,},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	;	
	{
		type = "Frame",
		position = {2,0,},
		size = {370,34,},
		backgroundColor = {0,0,0,55,},
		;
		{ 
			type = "Button", 
			position = { 2, 4, }, 
			size = {30,26,},
			helpTip = "PREVIOUS",
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			onMouseClicked = "UI_SetElementVisible('MusicMenu','PreviousMusic',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {138,3,183,42,},
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {388,3,433,42,},
			},
		}, 
		{ 
			type = "Button", 
			position = { 34, 4, }, 
			size = {30,26,},
			helpTip = "PLAY",
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			name = "PlayButton",
			visible = 0,
			onMouseClicked = "UI_SetElementVisible('MusicMenu','StopButton',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {49,3,94,42,},
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {299,3,344,42,},
			},
		}, 
		{ 
			type = "Button", 
			position = { 34, 4, }, 
			size = {30,26,},
			helpTip = "STOP",
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			name = "StopButton",
			onMouseClicked = "UI_SetElementVisible('MusicMenu','PlayButton',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {183,3,228,42,},
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {433,3,478,42,},
			},
		}, 
		{ 
			type = "Button", 
			position = { 66, 4, }, 
			size = {30,26,},
			helpTip = "NEXT (F9)",
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			onMouseClicked = "UI_SetElementVisible('MusicMenu','NextMusic',1)",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {94,3,139,42,},
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {344,3,389,42,},
			},
		}, 
		{
			type = "TextLabel",
			position = {100,2,},
			size = {0,0,},	--{10,16,},
			name = "MusicIndex",
			Text = 
			{
        			vAlign = "Middle", 
        			hAlign = "Center",
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {111,2,},
			size = {0,0,},	--{5,16,},
			Text = 
			{
				text = "",	--"-"
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {117-17,2,},	--{117,2,},
			size = {154+17,16,},		--{154,16,},
			name = "MusicName",
			helpTip = "CURRENT MUSIC",
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			Text = 
			{
        			vAlign = "Middle", 
        			hAlign = "Left", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "Frame",
			position = {100,20,},
			size = {195,10,},
			;
			{
				type = "Frame",
				position = {1,1,},
				size = {195,8,},
    				BackgroundGraphic = 
    				{ 
        				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        				textureUV = { 237, 73, 475, 81, },
				}, 
			},
			{
				type = "Frame",
				position = {1,1,},
				size = {0,0,},
				name = "MusicProgress",
    				BackgroundGraphic = 
    				{ 
        				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        				textureUV = { 237, 84, 475, 92, }, 
				}, 
			},
			{
				type = "Frame",
				position = {0,0,},
				size = {4,10,},
				name = "MusicProFrame",
    				BackgroundGraphic = 
    				{ 
        				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        				textureUV = { 238, 96, 244, 111, }, 
				}, 
			},
		},
		{ 
			type = "Button", 
			position = { 352, 18, }, 
			size = {18,14,},
			helpTip = "MUSIC LIST",
			helpTipTextLabel = "commandsHelpTip",
			helpTipScreen = "NewTaskbar",
			name = "MusicListButton",
			onMouseClicked = "UI_SetElementVisible( 'MusicMenu', 'ShowMusicListFrame', 1 - UI_IsNamedElementVisible('MusicMenu','ShowMusicListFrame'))",
			DefaultGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {201,43,228,63,},
			},
			PressedGraphic = 
			{
				texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
				textureUV = {451,43,478,65,},
			},
		}, 
		{
			type = "Frame",
			position = {274, 0,},
			size = {98,18,},
			;
			{ 
				type = "RadioButton", 
				position = { 2, 2, }, 
				size = {22,14,},
				helpTip = "ASCENDING ORDER",
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
				name = "RepeatTrack",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType1',1); UI_SetElementVisible('MusicMenu','MusicPlayType2',0); UI_SetElementVisible('MusicMenu','MusicPlayType3',0); UI_SetElementVisible('MusicMenu','MusicPlayType4',0)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {5,43,38,63,},
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {255,43,288,65,},
				},
			}, 
			{ 
				type = "RadioButton", 
				position = { 26, 2, }, 
				size = {22,14,},
				helpTip = "SINGLE REPEAT",
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
				name = "RepeatSingle",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType2',1); UI_SetElementVisible('MusicMenu','MusicPlayType1',0); UI_SetElementVisible('MusicMenu','MusicPlayType3',0); UI_SetElementVisible('MusicMenu','MusicPlayType4',0)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {39,43,72,63,},
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {289,43,322,65,},
				},
			}, 
			{ 
				type = "RadioButton", 
				position = { 50, 2, }, 
				size = {22,14,},
				helpTip = "FULL RANDOM",
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
				name = "RandomPlay",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType3',1); UI_SetElementVisible('MusicMenu','MusicPlayType2',0); UI_SetElementVisible('MusicMenu','MusicPlayType1',0); UI_SetElementVisible('MusicMenu','MusicPlayType4',0)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {72,43,105,63,},
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {322,43,355,65,},
				},
			}, 
			{ 
				type = "RadioButton", 
				position = { 74, 2, }, 
				size = {22,14,},
				helpTip = "PROGRESSIVE RANDOM",
				helpTipTextLabel = "commandsHelpTip",
				helpTipScreen = "NewTaskbar",
				name = "RandomPlayDynamic",
				onMouseClicked = "UI_SetElementVisible('MusicMenu','MusicPlayType4',1); UI_SetElementVisible('MusicMenu','MusicPlayType2',0); UI_SetElementVisible('MusicMenu','MusicPlayType3',0); UI_SetElementVisible('MusicMenu','MusicPlayType1',0)",
				DefaultGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {72,43,105,63,},
				},
				PressedGraphic = 
				{
					texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
					textureUV = {322,43,355,65,},
				},
			}, 
		},
		{
			type = "TextLabel",
			position = {298, 18,},
			size = {10,14,},
			name = "pMinute",
			Text = 
			{
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {308, 18,},
			size = {4,14,},
			Text = 
			{
				text = ":",
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {312, 18,},
			size = {10,14,},
			name = "pSecond",
			Text = 
			{
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {322, 18,},
			size = {6,14,},
			Text = 
			{
				text = "/",
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {328, 18,},
			size = {10,14,},
			name = "tMinute",
			Text = 
			{
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {338, 18,},
			size = {4,14,},
			Text = 
			{
				text = ":",
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
		{
			type = "TextLabel",
			position = {342, 18,},
			size = {10,14,},
			name = "tSecond",
			Text = 
			{
				font = "ATISmallFont",
        			vAlign = "Middle", 
        			hAlign = "Center", 
				color = {255,255,255,255,},
			},
		},
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "ShowMusicListFrame",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "MusicPlayType1",
		size = {0,0,},
		visible = 0,		--1
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "MusicPlayType2",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "MusicPlayType3",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "MusicPlayType4",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "NextMusic",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PreviousMusic",
		size = {0,0,},
		visible = 0,
	},
}