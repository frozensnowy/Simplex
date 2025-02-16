-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 714
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
general = 
{ 
    size = 
        { 43, 100, DIALOGWIDTH, 325, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { DIALOGWIDTH, 325, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { (DIALOGWIDTH + -8), 299, }, 	--95
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { (DIALOGWIDTH + -4), 57, }, 
; 
{ 
    type = "Frame", 
    size = 
        { (DIALOGWIDTH + -4), 59, }, 
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
        { (DIALOGWIDTH + -5), 254, }, 
; 
{
			type = "Frame",
			name = "generals",
			position = {4, 22},
			size = {700,247},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\generals.tga",
				textureUV = {0,0,1024,361},
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
        text = "VOTE FOR YOUR PRESIDENT", }, 
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
    name = "lblDescription1",  
    position = 
        { 4, 2, },    
    size = 
        { (DIALOGWIDTH + -10), 12, }, 
    Text = 
    { 
    textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblDescription2",     
    position = 
        { 4, 12, },    
    size = 
        { (DIALOGWIDTH + -10), 12, }, 
    Text = 
    { 
    textStyle = "FEHeading4", }, }, 
{ 
    type = "TextLabel", 
    name = "lblDescription3",     
    position = 
        { 4, 22, },    
    size = 
        { (DIALOGWIDTH + -10), 12, }, 
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
        text = "OMG seriously?", }, 	--$3614
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk2", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Go sodomize yourselves.", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk3", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Is this some kind of conspiracy?", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk4", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Illuminati is real! I knew it!", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk5", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Not my president!", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk6", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "They are the righteous embodiment of democracy.", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk7", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Awesome! Let's build a wall around Homeworld.", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk8", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "These are some of the finest fellas in the galaxy.", }, 
    onMouseClicked = "UI_HideScreen('general')", }, 


}, 
}, 
}, 
}, 
}
