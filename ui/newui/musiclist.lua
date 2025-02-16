function CreateMusicButton(Index)
	local MusicButtonFrame = 
			{ 
    				type = "Button", 
    				position = { 3, 3+11*(Index-1-4*floor((Index-1)/4)), }, 
    				size = {169,11,},
				name = "MusicButton"..Index,
				visible = 0,
				onMouseClicked = "UI_SetElementVisible('MusicListMenu','PlayMusic"..Index.."',1)",
				borderWidth = 1,
				borderColor = {0,0,0,0,},
				--overBorderColor = {198,198,198,255,},
				pressedBorderColor = {255,255,255,255,},
				;
				{
					type = "TextLabel",
					position = {0, 2,},
					size = {10,11,},
					name = "MusicIndex"..Index,
					giveParentMouseInput = 1,
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
					position = {11, 0,},
					size = {5,11,},
					giveParentMouseInput = 1,
					Text = 
					{
						text = "-",
						font = "ATISmallFont",
        					vAlign = "Middle", 
        					hAlign = "Center", 
						color = {255,255,255,255,},
					},
				},
				{
					type = "TextLabel",
					position = {17, 0,},
					size = {127,14,},
					giveParentMouseInput = 1,
					name = "MusicName"..Index,
					Text = 
					{
						font = "ATISmallFont",
        					vAlign = "Middle", 
        					hAlign = "Left", 
						color = {255,255,255,255,},
					},
				},
				{
					type = "TextLabel",
					position = {144, 0,},
					size = {10,14,},
					giveParentMouseInput = 1,
					name = "mMinute"..Index,
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
					position = {154, 0,},
					size = {5,14,},
					giveParentMouseInput = 1,
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
					position = {159, 0,},
					size = {10,14,},
					giveParentMouseInput = 1,
					name = "mSecond"..Index,
					Text = 
					{
						font = "ATISmallFont",
        					vAlign = "Middle", 
        					hAlign = "Center", 
						color = {255,255,255,255,},
					},
				},
			}
	return MusicButtonFrame
end

MusicListMenu = 
{
	size = {214,368,374,52,},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	callUpdateWhenInactive = 1,
	onShow = [[
			UI_SetButtonPressed("MusicMenu","MusicListButton",1)
		 ]],
	onUpdate = [[
			if (UI_IsNamedElementVisible("MusicMenu","ShowMusicListFrame")==0)or(UI_IsScreenActive("MusicMenu")==0) then
			    UI_SetScreenVisible("MusicListMenu",0)
			else
			    UI_SetScreenVisible("MusicListMenu",1)
			end
		   ]],
	onHide = [[
			UI_SetButtonPressed("MusicMenu","MusicListButton",0)
		 ]],
	;
	{
		type = "Frame",
		position = {2,0,},
		size = {370,50,},
		backgroundColor = {0,0,0,55,},
		;
		{
			type = "Frame",
			position = {0,0,},
			size = {175,50,},
    			BackgroundGraphic = 
    			{ 
        			texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        			textureUV = { 0, 64, 231, 165, }, 
			}, 
			;
			CreateMusicButton(1),
			CreateMusicButton(2),
			CreateMusicButton(3),
			CreateMusicButton(4),
		},
		{ 
    			type = "Button", 
    			position = { 175, 0, }, 
    			size = {20,24,},
					name = "MusicNextPageButton",
					onMouseClicked = "UI_SetElementVisible('MusicListMenu','MusicNextPage',1)",
					enabled = 0,
					DefaultGraphic = 
					{
						texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
						textureUV = {7,44,37,62,},
					},
					DisabledGraphic = 
					{
						texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
						textureUV = {7,44,37,62,},
						color = {130,130,130,130,},
						blackAndWhite = 1,
					},
					PressedGraphic = 
					{
						texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
						textureUV = {257,44,287,62,},
					},
		}, 
		{ 
    			type = "Button", 
    			position = { 175, 25, }, 
    			size = {20,24,},
					name = "MusicPreviousPageButton",
					onMouseClicked = "UI_SetElementVisible('MusicListMenu','MusicPreviousPage',1)",
					enabled = 0,
					DefaultGraphic = 
					{
						texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
						textureUV = {37,44,7,62,},
					},
					DisabledGraphic = 
					{
						texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
						textureUV = {37,44,7,62,},
						color = {130,130,130,130,},
						blackAndWhite = 1,
					},
					PressedGraphic = 
					{
						texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
						textureUV = {287,44,257,62,},
					},
		}, 
		{
			type = "Frame",
			position = {195,0,},
			size = {175,50,},
    			BackgroundGraphic = 
    			{ 
        			texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga", 
        			textureUV = { 0, 64, 231, 165, }, 
			}, 
			;
			CreateMusicButton(5),
			CreateMusicButton(6),
			CreateMusicButton(7),
			CreateMusicButton(8),
		},
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "MusicNextPage",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "MusicPreviousPage",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic1",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic2",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic3",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic4",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic5",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic6",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic7",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "PlayMusic8",
		size = {0,0,},
		visible = 0,
	},
}