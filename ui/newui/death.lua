-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 284
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
death = 
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
        text = "PRIMARY OBJECTIVE", }, 
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
    name = "m_frmButtons", --m_frmButtons
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
        text = "Failure is always an option.", }, 	--$3614
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "In defeat we learn.", },
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "We have miscalculated the situation.", },
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "This war has just begun.", },
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf5",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "OK... But why?", },
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf6",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Impossible is nothing.", },
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnSelf7",
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "This is embarrassing.", },
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is unfortunate.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "We should find a stronger ally next time.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "So sorry we couldn't help.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "Our condolences.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is unfortunate for him.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "Someone could have saved him.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "He will always be remembered.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is unfair for him.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is unfortunate for her.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "Someone could have saved her.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "She will always be remembered.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is unfair for her.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "Most exhilarating!", }, 
    onMouseClicked = "UI_HideScreen('death')", },
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
        text = "Everything is within our plan.", }, 
    onMouseClicked = "UI_HideScreen('death')", },
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
        text = "They have learned their lesson.", }, 
    onMouseClicked = "UI_HideScreen('death')", },
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
        text = "This is anticipated.", }, 
    onMouseClicked = "UI_HideScreen('death')", },
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemy5", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "There is no doubt about that.", }, 
    onMouseClicked = "UI_HideScreen('death')", },
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemy6", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "The best possible outcome.", }, 
    onMouseClicked = "UI_HideScreen('death')", },
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
        text = "He has picked the wrong side.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "He should have shown some respect.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is the lesson for him.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "He was predicted to fail.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyMale5", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That is his fate.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyMale6", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "His existence is a waste of RUs.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "She has picked the wrong side.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "She should have shown some respect.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "That is the lesson for her.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
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
        text = "She was predicted to fail.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyFemale5", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "That is her fate.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    autoarrange = 1, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnEnemyFemale6", 
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Her existence is a waste of RUs.", }, 
    onMouseClicked = "UI_HideScreen('death')", }, 

},
}, 
}, 
}, 
}
