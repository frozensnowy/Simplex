battlearena = {        	
	size = {303, 436, 200, 44},
	stylesheet = "HW2StyleSheet",	
	clickThrough = 1,	
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	;	
-- Timeto Frame
	{
		type = "Frame",
		position = {0,0},
		size = {200, 44},		
		backgroundColor = "IGColorBackground1",
		helpTip = "BATTLE ARENA DISPLAY",
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		--autosize = 1,
		--marginHeight = 1,
		--autoarrange = 1,
		;				
		
		{		        
			type = "TextLabel",
			position = {0, 24},
			size = {200,  14},
			name = "timeto",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Center",				
				color = "FEColorHeading1",
			},			
		},	
		{		        
			type = "TextLabel",
			position = {0, 32},
			size = {200,  14},
			name = "timeto1",			
			Text = {
				textStyle = "IGHeading2",
				hAlign = "Center",				
				color = "FEColorHeading1",
			},			
		},			
		
		{		        
			type = "TextLabel",
			position = {4, 2},
			size = {75,  14},
			name = "p1",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},	
		{		        
			type = "TextLabel",
			position = {4, 14},
			size = {75,  14},
			name = "p1punteggio",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Left",				
				color = "FEColorHeading3",
			},			
		},	
		{		        
			type = "TextLabel",
			position = {4, 26},
			size = {30,  14},
			name = "p1punteggio1",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Left",				
				color = 
            { 222, 37, 19, 255, }, 
			},			
		},	
		{		        
			type = "TextLabel",
			position = {121, 2},
			size = {75,  14},
			name = "p2",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Right",				
				color = "FEColorHeading3",
			},			
		},			
		{		        
			type = "TextLabel",
			position = {121, 14},
			size = {75,  14},
			name = "p2punteggio",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Right",				
				color = "FEColorHeading3",
			},			
		},	
		{		        
			type = "TextLabel",
			position = {166, 26},
			size = {30,  14},
			name = "p2punteggio1",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Right",				
				color = 
            { 222, 37, 19, 255, }, 
			},			
		},			
		{		        
			type = "TextLabel",
			position = {2, 16},
			size = {180,  14},
			name = "win",			
			Text = {
				textStyle = "IGHeading1",
				hAlign = "Center",				
				color = { 0, 128, 255, 255, },
			},			
		},				
	},
	
}	