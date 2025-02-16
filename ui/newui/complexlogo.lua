ComplexLogo = 
{ 
    size = 
        { 330, 137, 146, 206, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,   
    clickThrough = 1,  
    RootElementSettings = 
    { 
        backgroundColor = { 0, 0, 0, 0, },		--"FEColorBackground1", 
     }, 
; 


--logo
		{
			type = "Frame",
			position = {13, 5},
			size = {120,120},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\Complex8LogoNoRelease512x512_new.tga",			--Complex8LogoNoRelease512x512.tga	
				color = OUTLINECOLOR,
			},						
		},		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 2, 125, }, 
    size = 
        { 142, 13, }, 
    name = "line1", 
    --wrapping = 1, 
    --autosize = 1, 
    Text = 
    { 
        textStyle = "IGHeading2_Original", 	--"IGHeading2"
        vAlign = "Center", 
        hAlign = "Center",	
        text = "SIMPLE", 
        }, 
		}, 		
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 2, 135, }, 
    size = 
        { 142, 13, }, 
    name = "line2", 
    --wrapping = 1, 
    --autosize = 1, 
    Text = 
    { 
        textStyle = "IGHeading2_Original", 	--"IGHeading2"
        vAlign = "Center", 
        hAlign = "Center",	
        text = "COMPLEX",
        },
		}, 	
		
--label
    { 
    type = "TextLabel",     
    position = 
        { 2, 155, }, 
    size = 
        { 142, 13, }, 
    name = "line3", 
    --wrapping = 1, 
    --autosize = 1, 
    Text = 
    { 
        textStyle = "IGHeading2_Original", 	--"IGHeading2"
        vAlign = "Center", 
        hAlign = "Center",	
        text = "an idea by someone", 
        }, 
		},
		
}
