planet_mercury = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_mercury.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "MERCURY (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_mercury')", }, 
}, 
}, 
}, 
}, 
}

------------------------------------------------------------------

planet_venus = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_venus.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "VENUS (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_venus')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------------

planet_earth = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_earth.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "EARTH (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_earth')", }, 
}, 
}, 
}, 
}, 
}

-----------------------------------------------------------------------------------------

planet_moon = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_moon.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "MOON (EARTH' SATELLITE)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, },  
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_moon')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------

planet_mars = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_mars.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "MARS (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_mars')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------

planet_jupiter = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_jupiter.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "JUPITER (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, },  
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_jupiter')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------

planet_europa = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_europa.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "EUROPA (JUPITER' SATELLITE)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, },  
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_europa')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------

planet_io = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_io.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "IO (JUPITER' SATELLITE)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_io')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------

planet_callisto = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_callisto.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "CALLISTO (JUPITER' SATELLITE)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_callisto')", }, 
}, 
}, 
}, 
}, 
}

-------------------------------------------------------------------------

planet_ganymeade = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_ganymeade.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "GANYMEDE (JUPITER' SATELLITE)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, },  
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_ganymeade')", }, 
}, 
}, 
}, 
}, 
}

-----------------------------------------------------------------------------------------

planet_saturn = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_saturn.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "SATURN (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_saturn')", }, 
}, 
}, 
}, 
}, 
}

--------------------------------------------------------------------------------

planet_pluto = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_pluto.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "PLUTO (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, },  
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_pluto')", }, 
}, 
}, 
}, 
}, 
}


-----------------------------------------------------------------------------------------

planet_neptune = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_neptune.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "NEPTUNE (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, },  
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_neptune')", }, 
}, 
}, 
}, 
}, 
}

---------------------------------------------------------------------------

planet_uranus = 
{ 
    size = 
        { 258, 250, 284, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { 284, 111, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 81, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 64, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 67, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = 282, 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { 279, 62, }, 
;  
{
			type = "Frame",
			position = {3, 4},
			size = {57,57},
			BackgroundGraphic = {
				texture = "DATA:\\Ship\\Icons\\ships\\planet_uranus.tga",
				textureUV = {0,0,512,512},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 64, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "URANUS (PLANET)", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 64, 15, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle1", 
    position = 
        { 64, 22, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle2", 
    position = 
        { 64, 29, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle3", 
    position = 
        { 64, 36, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle4", 
    position = 
        { 64, 43, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle5", 
    position = 
        { 64, 50, }, 
    size = 
        { 200, 13, }, 
    Text = 
    { 
        vAlign = "Top",
        textStyle = "FEHeading4", }, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 1,     
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
;
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { 278, 18, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = (278 + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('planet_uranus')", }, 
}, 
}, 
}, 
}, 
}

---------------------------------------------------------------------------

planet_list = 
{ 
    size = 
        { 190, 450, 420, 30, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
---list---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 0},	
      size = { 420, 30, }, 	 			
		  --autosize = 1, 
		  autoarrange = 1, 
		  autoarrangeWidth = 420, 
		  autoarrangeSpace = 0, 		
		; 
		
---mercury-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "mercury",     
			  helpTip = "MERCURY (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_mercury', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_mercuryfs.tga",
			        textureUV = { -44, -44, 180, 180, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_mercurylabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					}, 
          {
						type = "TextLabel",
						name = "planet_mercurylabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  					
				},
			}, 	
     
---venus-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "venus",     
			  helpTip = "VENUS (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_venus', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_venusfs.tga",
			        textureUV = { -35, -35, 170, 170, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_venuslabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_venuslabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 
			
---earth-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "earth",     
			  helpTip = "EARTH (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_earth', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_earthfs.tga",
			        textureUV = { -29, -29, 160, 160, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_earthlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_earthlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	

---moon-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "moon",     
			  helpTip = "MOON (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_moon', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_moonfs.tga",
			        textureUV = { -64, -64, 210, 210, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_moonlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_moonlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 

---mars-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "mars",     
			  helpTip = "MARS (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_mars', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_marsfs.tga",
			        textureUV = { -30, -30, 165, 165, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_marslabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_marslabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 		

---jupiter-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "jupiter",     
			  helpTip = "JUPITER (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_jupiter', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_jupiterfs.tga",
			        textureUV = { -15, -15, 140, 140, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_jupiterlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_jupiterlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 		

---io-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "io",     
			  helpTip = "IO (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_io', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_iofs.tga",
			        textureUV = { -64, -64, 210, 210, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_iolabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_iolabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 												

---europa-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "europa",     
			  helpTip = "EUROPA (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_europa', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_europafs.tga",
			        textureUV = { -65, -65, 215, 215, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_europalabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_europalabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 												

---callisto-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "callisto",     
			  helpTip = "CALLISTO (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_callisto', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_callistofs.tga",
			        textureUV = { -64, -64, 210, 210, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_callistolabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_callistolabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 												

---ganymeade-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "ganymeade",     
			  helpTip = "GANYMEADE (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_ganymeade', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_ganymeadefs.tga",
			        textureUV = { -63, -63, 205, 205, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_ganymeadelabel",
						position = {3,20},
						size = {24, 10},			
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_ganymeadelabel1",
						position = {3,2},
						size = {24, 10},			
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			},

---saturn-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "saturn",     
			  helpTip = "SATURN (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_saturn', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_saturnfs.tga",
			        textureUV = { -19, -9, 145, 145, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_saturnlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_saturnlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 				

---uranus-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "uranus",     
			  helpTip = "URANUS (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_uranus', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_uranusfs.tga",
			        textureUV = { -18, -18, 150, 150, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_uranuslabel",
						position = {3,20},
						size = {24, 10},				
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_uranuslabel1",
						position = {3,2},
						size = {24, 10},				
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 															

---neptune-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "neptune",     
			  helpTip = "NEPTUNE (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_neptune', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_neptunefs.tga",
			        textureUV = { -21, -21, 155, 155, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_neptunelabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_neptunelabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 															

---pluto-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "pluto",     
			  helpTip = "PLUTO (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_pluto', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_plutofs.tga",
			        textureUV = { -37, -37, 175, 175, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_plutolabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_plutolabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 																		
			
  }, 
}

planet_list_beam = 
{ 
    size = 
        { 355, 450, 90, 30, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
---list---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 0},	
      size = { 90, 30, }, 	 			
		  --autosize = 1, 
		  autoarrange = 1, 
		  autoarrangeWidth = 90, 
		  autoarrangeSpace = 0, 		
		; 
		
---earth-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "earth",     
			  helpTip = "EARTH (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_earth', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_earthfs.tga",
			        textureUV = { -29, -29, 160, 160, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_earthlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_earthlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	

---moon-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "moon",     
			  helpTip = "MOON (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_moon', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_moonfs.tga",
			        textureUV = { -64, -64, 210, 210, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_moonlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_moonlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 

---mars-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "mars",     
			  helpTip = "MARS (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_mars', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_marsfs.tga",
			        textureUV = { -30, -30, 165, 165, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_marslabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_marslabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 																			
			
  }, 
}

planet_list_fs = 
{ 
    size = 
        { 355, 450, 90, 30, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
---list---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 0},	
      size = { 90, 30, }, 	 			
		  --autosize = 1, 
		  autoarrange = 1, 
		  autoarrangeWidth = 90, 
		  autoarrangeSpace = 0, 		
		;  				

---uranus-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "uranus",     
			  helpTip = "URANUS (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_uranus', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_uranusfs.tga",
			        textureUV = { -18, -18, 150, 150, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_uranuslabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_uranuslabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 															

---neptune-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "neptune",     
			  helpTip = "NEPTUNE (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_neptune', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_neptunefs.tga",
			        textureUV = { -21, -21, 155, 155, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_neptunelabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_neptunelabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 															

---pluto-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "pluto",     
			  helpTip = "PLUTO (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_pluto', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_plutofs.tga",
			        textureUV = { -37, -37, 175, 175, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_plutolabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_plutolabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 																		
			
  }, 
}

planet_list_jf = 
{ 
    size = 
        { 325, 450, 150, 30, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
---list---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 0},	
      size = { 150, 30, }, 	 			
		  --autosize = 1, 
		  autoarrange = 1, 
		  autoarrangeWidth = 150, 
		  autoarrangeSpace = 0, 		
		; 		

---jupiter-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "jupiter",     
			  helpTip = "JUPITER (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_jupiter', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_jupiterfs.tga",
			        textureUV = { -15, -15, 140, 140, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_jupiterlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_jupiterlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 		

---io-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "io",     
			  helpTip = "IO (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_io', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_iofs.tga",
			        textureUV = { -64, -64, 210, 210, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_iolabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_iolabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 												

---europa-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "europa",     
			  helpTip = "EUROPA (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_europa', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_europafs.tga",
			        textureUV = { -65, -65, 215, 215, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_europalabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_europalabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 												

---callisto-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "callisto",     
			  helpTip = "CALLISTO (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_callisto', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_callistofs.tga",
			        textureUV = { -64, -64, 210, 210, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_callistolabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_callistolabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 												

---ganymeade-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "ganymeade",     
			  helpTip = "GANYMEADE (SATELLITE)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_ganymeade', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_ganymeadefs.tga",
			        textureUV = { -63, -63, 205, 205, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_ganymeadelabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					}, 
{
						type = "TextLabel",
						name = "planet_ganymeadelabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  					
				},
			},																		
			
  }, 
}

planet_list_sf = 
{ 
    size = 
        { 355, 450, 90, 30, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
---list---------------------------------------------------------------		
		{ 
		  type = "Frame", 	
		  position = {0, 0},	
      size = { 90, 30, }, 	 			
		  --autosize = 1, 
		  autoarrange = 1, 
		  autoarrangeWidth = 90, 
		  autoarrangeSpace = 0, 		
		; 
		
---mercury-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "mercury",     
			  helpTip = "MERCURY (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_mercury', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_mercuryfs.tga",
			        textureUV = { -44, -44, 180, 180, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_mercurylabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_mercurylabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 	
     
---venus-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "venus",     
			  helpTip = "VENUS (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_venus', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_venusfs.tga",
			        textureUV = { -35, -35, 170, 170, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_venuslabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_venuslabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 			

---saturn-----------------------------------------------------------------------
			{ 
			  type = "Button", 
			  buttonStyle = "Taskbar_CommandButtonStyle", 
			  name = "saturn",     
			  helpTip = "SATURN (PLANET)", 
			  helpTipTextLabel = "commandsHelpTip",    
			  helpTipScreen = "NewTaskbar",  
			  onMouseClicked = "UI_SetScreenVisible( 'planet_list_saturn', 1)",				  
			; 
				{ 
				  type = "Frame", 
				  size = { 30, 30, }, 	    
				  giveParentMouseInput = 1,
				  BackgroundGraphic = 
			    { 
			        texture = "DATA:\\Ship\\Icons\\ships\\planet_saturnfs.tga",
			        textureUV = { -19, -9, 145, 145, },
			    },						 
				;
				  {
						type = "TextLabel",
						name = "planet_saturnlabel",
						position = {3,20},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
					{
						type = "TextLabel",
						name = "planet_saturnlabel1",
						position = {3,2},
						size = {24, 10},					
						Text = {textStyle = "IGHeading2",},		
						giveParentMouseInput = 1,
						dropShadow = 1,
						visible = 1,
					},  
				},
			}, 																		
			
  }, 
}

planet_list_mercury =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_venus =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_earth =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}		
planet_list_moon =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_mars =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_jupiter =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}		
planet_list_io =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_europa =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_callisto =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}		
planet_list_ganymeade =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_saturn =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_uranus =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}		
planet_list_neptune =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	
planet_list_pluto =  {    	
	size = {0, 0, 0, 0},
	stylesheet = "HW2StyleSheet",		
	pixelUVCoords = 1,}	