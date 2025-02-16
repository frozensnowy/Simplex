PopMenu = {
	size = {586, 0, 214, 14},
	stylesheet = "HW2StyleSheet",
	
	clickThrough = 1,
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	-- Lua functions
	onUpdate = [[ 																
		UI_SetTextLabelText("PopMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ));		
	]],
	;
	
	-- Resource Units Frame
	{
		type = "Frame",
		position = {0,0},
		size = {214, 13},
		backgroundColor = "IGColorBackground1",
		;
		
		-- RU Icon
		{
			type = "Frame",
			position = {214-13, 0},
			size = {13,13},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\ru_icon.mres",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},
		},
		
		-- Resource Units Static Label
		{
			type = "TextLabel",
			position = {0, 0},
			size = {128,  13},
			name = "lblResourceUnitsStaticText",					
			Text = {
				text = "$2800", -- RESOURCE UNITS
				textStyle = "IGHeading2",
				offset = {4,0},
			},
		},
		
		-- Resource Units Dynamic Label
		{
			type = "TextLabel",
			position = {138-13, 0},
			size = {74,  13},
			name = "lblResourceUnits",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Right",
				offset = {-2, 0},
				color = "FEColorHeading3",
			},
		},
	},
	
	
}
	