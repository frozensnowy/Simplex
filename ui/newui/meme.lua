-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 315
DIALOGHEIGHT = 200
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
meme = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1, 
    RootElementSettings = 
    { 
        backgroundColor = "FEColorBackground2", }, 
    jRight = ((DIALOGWIDTH + -6) + -122), 
    jCenter = ((DIALOGWIDTH + -6) / 2 + -60), 
    jLeft = 2, 
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { DIALOGWIDTH, DIALOGHEIGHT, }, 
    position = 
        { (400 - DIALOGWIDTH / 2), 169, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { (DIALOGWIDTH + -8), 123, }, 	--DIALOGHEIGHT-50
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { (DIALOGWIDTH + -4), 125, }, 
; 
{ 
    type = "Frame", 
    size = 
        { (DIALOGWIDTH + -4), 127, }, 
    borderWidth = 2, 
    borderColor = "FEColorPopupOutline", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = (DIALOGWIDTH + -2), 
    autoarrangeSpace = 2, 
; 
{ 
    type = "Frame", 
    size = 
        { (DIALOGWIDTH + -5), 122, }, 
; 
		{
			type = "Frame",
			name = "bring_sajuuk_to_bear",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\bring_sajuuk_to_bear.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		
		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 4, 0, }, 
    size = 
        { (DIALOGWIDTH + -10), 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Middle", 
        text = "MEME", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 4, 11, }, 
    size = 
        { (DIALOGWIDTH + -10), 13, }, 
    Text = 
    { 
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
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
    autosize = 1, 
    --autoarrange = 1, 
; 
{ 
    type = "TextLabel", 
    autosize = 1, 
    wrapping = 1, 
    name = "lblDescription1",  
    position = 
        { 4, 2, },    
    size = 
        { (DIALOGWIDTH + -10), 48, }, 
    Text = 
    { 
    textStyle = "FEHeading4", }, },                       
}, 

{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { (DIALOGWIDTH + -6), 17, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
; 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk1", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Bring Sajuuk to bear!!!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('meme')", }, 

    
}, 
}, 
}, 
}, 
}
