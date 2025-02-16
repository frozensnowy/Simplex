-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 284
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
battlearenamsg = 
{ 
    size = 
        { 258, 250, DIALOGWIDTH, 100, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { DIALOGWIDTH, 100, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { (DIALOGWIDTH + -8), 80, }, 	--70
    style = "FEPopupBackgroundStyle", 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { (DIALOGWIDTH + -4), 32, }, 
; 
{ 
    type = "Frame", 
    size = 
        { (DIALOGWIDTH + -4), 34, }, 
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
        { (DIALOGWIDTH + -5), 29, }, 
; 
{
			type = "Frame",
			position = {4, 3},
			size = {12,12},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\fleet_icon.mres",
				textureUV = {0,0,13*2,13*2},
				color = OUTLINECOLOR,
			},						
		},		
{ 
    type = "TextLabel", 
    name = "lblTitle", 
    position = 
        { 17, 0, }, 
    size = 
        { (DIALOGWIDTH + -10), 15, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        vAlign = "Middle", 
        text = "BATTLE ARENA", }, 
}, 
{ 
    type = "TextLabel", 
    name = "lblSubTitle", 
    position = 
        { 4, 15, }, 
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
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnOk", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "$3614", }, 
    onMouseClicked = "UI_HideScreen('battlearenamsg')", }, 
}, 
}, 
}, 
}, 
}
