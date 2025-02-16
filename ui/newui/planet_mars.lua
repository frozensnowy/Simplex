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
        { 284, 100, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 276, 70, }, 
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { 280, 54, }, 
; 
{ 
    type = "Frame", 
    size = 
        { 280, 56, }, 
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
        { 279, 51, }, 
; 
{
			type = "Frame",
			position = {3, 4},
			size = {45,45},
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
        { 53, 3, }, 
    size = 
        { 200, 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        text = "MARS", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 53, 15, }, 
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
        { 53, 22, }, 
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
        { 53, 29, }, 
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
        { 53, 36, }, 
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
        { 53, 43, }, 
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
        { 278, 17, }, 
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
