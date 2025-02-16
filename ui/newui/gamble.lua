-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 284
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
gamble = 
{ 
    size = 
        { 258, 250, DIALOGWIDTH, 125, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1,    
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { DIALOGWIDTH, 125, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { (DIALOGWIDTH + -8), 105, }, 	--95
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
        { (DIALOGWIDTH + -5), 54, }, 
; 
{
			type = "Frame",
			name = "gamble_lose",
			position = {4, 22},
			size = {70,70},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\gamble_lose.tga",
				textureUV = {0,0,128,128},
				color = OUTLINECOLOR,
			},						
		},		
{
			type = "Frame",
			name = "gamble_lose1",
			position = {4, 22},
			size = {70,70},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\gamble_lose1.tga",
				textureUV = {0,0,128,128},
				color = OUTLINECOLOR,
			},						
		},	
{
			type = "Frame",
			name = "gamble_win",
			position = {4, 22},
			size = {70,70},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\gamble_win.tga",
				textureUV = {0,0,128,128},
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
        text = "LUXURY CASINO", }, 
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
    name = "btnLose1", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "This is impossible!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose2", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Bastard!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose3", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "FFFFFFUUUUUU!!!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose4", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Dude, WTF is going on!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose5", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "We need to invest more in gambling!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose6", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Someone nuke this casino!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose7", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "How the hell?!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose8", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "We will win it back, eventually.", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnLose9", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "You are all dead!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Yaaayyy!!!!", },
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin2", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "To the Dude!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin3", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Nobody can beat us in casino.", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin4", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Winner takes all!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin5", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Gambling is our national sport.", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin6", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Suck it, bitches!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnWin7", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "My precious!!!", }, 
    onMouseClicked = "UI_HideScreen('gamble')", }, 


}, 
}, 
}, 
}, 
}
