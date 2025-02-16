drive = {		
	size = {0, 0, 800, 600},	
	stylesheet = "HW2StyleSheet", 
  soundOnShow = "SFX_TaksbarMenuONOFF", 
  soundOnHide = "SFX_TaksbarMenuONOFF", 
	pixelUVCoords = 1, 
	clickThrough = 1,
	;		

	{
		type = "Frame",
		position = {0,0,},
		name = "driveenabled",
		size = {0,0,},
		visible = 0,
	},
	{
		type = "Frame",
		position = {0,0,},
		name = "takingcontrol",
		size = {0,0,},
		visible = 0,
	},

}

FlightPanel = {		
	size = {0, 0, 800, 600},	
	stylesheet = "HW2StyleSheet", 
	pixelUVCoords = 1, 
	clickThrough = 1,
	;		
---
	{
		type = "Frame", 
		position = { 200, 50, }, 
		size = { 400, 400, }, 
		name = "flightpanel",
		BackgroundGraphic = 
		{
			texture = "DATA:UI\\NewUI\\dockmenuimage\\TurnMenuFrame.tga",
			textureUV = {0,0,600,600,},
		},
	},
---
	{
		type = "Frame", 
		position = { 200, 50, }, 
		size = { 400, 400, }, 
		name = "flightpanel_red",
		BackgroundGraphic = 
		{
			texture = "DATA:UI\\NewUI\\dockmenuimage\\TurnMenuFrame_red.tga",
			textureUV = {0,0,600,600,},
		},
	},
---
	{
		type = "Frame", 
		position = { 400-50, 250-50, }, 
		size = { 100, 100, }, 
		name = "flightvector",
		BackgroundGraphic = 
		{
			texture = "DATA:UI\\NewUI\\dockmenuimage\\crosshair_wing.tga",
			textureUV = {0,0,200,200,},
		},
	},
---
	{
		type = "Frame", 
		position = { 400-25, 250-25, }, 
		size = { 50, 50, }, 
		name = "flighttarget",
		BackgroundGraphic = 
		{
			texture = "DATA:UI\\NewUI\\dockmenuimage\\crosshair_green.tga",
			textureUV = {0,0,200,200,},
		},
	},
---
	{
		type = "Frame", 
		position = { 400+10, 250-15, }, 
		size = { 50, 50, }, 
		name = "targetinfo",
		;
		{ 
		    type = "TextLabel", 
		    position = 
		        { 0, 0, }, 
		    size = 
		        { 40, 13, }, 
		    Text = 
		    { 
		        textStyle = "ListBoxItemFont", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Left", 
		        vAlign = "Top", }, 
		    name = "target_text", 
		}, 
	},
---
	{ 
    type = "Frame", 
    name = "elevation_marker",
    position = 
        { 200, 240+3, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 400, 
	; 
		{ 
		    type = "Frame",      
		    size = 
		        { 400, 13, }, 
		    BackgroundGraphic = 
		    { 
		        texture = "DATA:UI\\NewUI\\dockmenuimage\\elevation_line.tga", 
		        textureUV = 
		            { 0, 0, 600, 20, }, }, 
		    helpTip = "ANGLE OF ATTACK INDICATOR", 
		    helpTipTextLabel = "commandsHelpTip", 
		; 
		}, 
	},
---
	{ 
	    type = "Frame", 
	    name = "elevation_number", 
	    position = 
	        { 600+3, 240+3, }, 
	    size = 
	        { 40, 14, }, 
	    BackgroundGraphic = 
	    { 
	        texture = "DATA:UI\\NewUI\\dockmenuimage\\instruments.tga", 
	        textureUV = 
	            { 0, 0, 79, 38, }, }, 
	    helpTip = "Angle of Attack (degrees)", 
	    helpTipTextLabel = "commandsHelpTip", 
	; 
		{ 
		    type = "TextLabel", 
		    position = 
		        { 2, 1, }, 
		    size = 
		        { 23, 13, }, 
		    Text = 
		    { 
		        textStyle = "Taskbar_MenuButtonTextStyle", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Left", 
		        vAlign = "Center", },
		        text = "AoA:",
		},
		{ 
		    type = "TextLabel", 
		    position = 
		        { 18+3, 1, }, 
		    size = 
		        { 19, 13, }, 
		    Text = 
		    { 
		        textStyle = "ListBoxItemFont", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Right", 
		        vAlign = "Center", }, 
		    name = "elevation_text", 
		}, 
	}, 
---
	{ 
	    type = "Frame", 
	    name = "speed_number", 
	    position = 
	        { 200-3-40, 240+3, }, 
	    size = 
	        { 40, 14, }, 
	    BackgroundGraphic = 
	    { 
	        texture = "DATA:UI\\NewUI\\dockmenuimage\\instruments.tga", 
	        textureUV = 
	            { 0, 0, 79, 38, }, }, 
	    helpTip = "Actual Speed (m/s)", 
	    helpTipTextLabel = "commandsHelpTip", 
	; 
		{ 
		    type = "TextLabel", 
		    position = 
		        { 2, 1, }, 
		    size = 
		        { 28, 13, }, 
		    Text = 
		    { 
		        textStyle = "Taskbar_MenuButtonTextStyle", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Left", 
		        vAlign = "Center", },
		        name = "speed_text", 
		},
		{ 
		    type = "TextLabel", 
		    position = 
		        { 18+2, 1, }, 
		    size = 
		        { 19, 13, }, 
		    Text = 
		    { 
		        textStyle = "ListBoxItemFont", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Right", 
		        vAlign = "Center", }, 
		    text = "m/s ",
		}, 
	}, 
---
	{ 
	    type = "Frame", 
	    name = "heading_number", 
	    position = 
	        { 400-33, 40, }, 
	    size = 
	        { 66, 14, }, 
	    BackgroundGraphic = 
	    { 
	        texture = "DATA:UI\\NewUI\\dockmenuimage\\instruments.tga", 
	        textureUV = 
	            { 0, 0, 79, 38, }, }, 
	    helpTip = "Heading (degrees)", 
	    helpTipTextLabel = "commandsHelpTip", 
	; 
		{ 
		    type = "TextLabel", 
		    position = 
		        { 3, 1, }, 
		    size = 
		        { 43, 13, }, 
		    Text = 
		    { 
		        textStyle = "Taskbar_MenuButtonTextStyle", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Left", 
		        vAlign = "Center", },
		        text = "Heading:",
		},
		{ 
		    type = "TextLabel", 
		    position = 
		        { 31+4, 1, }, 
		    size = 
		        { 29, 13, }, 
		    Text = 
		    { 
		        textStyle = "ListBoxItemFont", 
		        color = 
		             { 0, 255, 0, 200, }, 
		        hAlign = "Right", 
		        vAlign = "Center", }, 
		    name = "heading_text", 
		}, 
	}, 
}