-- The Simplex Project
-- 2011/7/9 22:03:01
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
SubtitleInputScreen = 
{ 
    size = 
        { 350, 480-20, 100, 13, }, 
    stylesheet = "HW2StyleSheet", 
    RootElementSettings = 
    { 
        backgroundColor = "FEColorBackground2", }, 
; 
{ 
    type = "TextButton", 
    position = 
        { 0, 0, }, 
    size = 
        { 100, 13, }, 
    buttonStyle = "FEButtonStyle2", 
    toggleButton = 0, 
    Text = 
    { 
        text = "$3614",
        textStyle = "Taskbar_PanelButtonTextStyle", 
        color = 
            { 255, 215, 0, 255, }, }, 
    name = "btnSubtitleOk", 
    onMouseClicked = "MainUI_UserEvent( eSubtitleOk )", }, 
}
