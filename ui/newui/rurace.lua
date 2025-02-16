-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 284
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
rurace = 
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
        text = "SECONDARY OBJECTIVE", }, 
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
    autosize = 1, 
    wrapping = 1, 
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
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf1", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "This is a great day.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Excellent! Proceed to the next phase.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Just as we planned.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Victory will soon be ours.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAllied1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That is a good news to hear.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAllied2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Congratulations!", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAllied3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Our warriors salute you.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAllied4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Together, we can achieve the greater good.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedMale1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That is good for him.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedMale2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "He did a great job.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedMale3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Congratulations to him!", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedMale4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "His hard work has paid off.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedFemale1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That is good for her.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedFemale2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "She did a great job.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedFemale3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Congratulations to her!", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnAlliedFemale4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Her hard work has paid off.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemy1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Someone will have to catch up.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemy2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That is some disturbing news.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemy3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That must be stopped.", },
    onMouseClicked = "UI_HideScreen('rurace')", },
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemy4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That sounds like pure luck.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyMale1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "He does not deserve it.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyMale2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Someone has to stop him.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyMale3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "He cannot continue like that.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyMale4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "He is just lucky this time.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
--
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyFemale1",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "She does not deserve it.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyFemale2",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Someone has to stop her.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyFemale3",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "She cannot continue like that.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyFemale4",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "She is just lucky this time.", },
    onMouseClicked = "UI_HideScreen('rurace')", }, 

}, 
}, 
}, 
}, 
}
