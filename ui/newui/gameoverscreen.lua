-- LuaDC version 0.9.19
-- 5/23/2004 7:32:00 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
LABEL_POS = 
    { 0, 447, }
LABEL_SIZE = 
    { 800, 19, }
GameOverScreen = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1, 
    onShow = "UI_HideScreen('SubtitleScreen'); UI_ShowScreen( 'ComplexLogo', ePopup)", 
    RootElementSettings = 
    { 
        backgroundColor = "FEColorBackground2", }, 
; 

{ 
    type = "TextLabel", 
    name = "m_lblVictory", 
    position = LABEL_POS, 
    size = LABEL_SIZE, 
    visible = 0, 
    Text = 
    { 
        text = "$3615", 
        textStyle = "IGHeading1", 
        color = 
            { 255, 255, 255, 255, }, 
        vAlign = "Top", 
        hAlign = "Center", }, 
}, 
{ 
    type = "TextLabel", 
    name = "m_lblDefeat", 
    position = LABEL_POS, 
    size = LABEL_SIZE, 
    visible = 0, 
    Text = 
    { 
        text = "BATTLE CONTROL TERMINATED", 	--$3616
        textStyle = "IGHeading1", 
        color = 
            { 255, 255, 255, 255, }, 
        vAlign = "Top", 
        hAlign = "Center", }, 
}, 
{ 
    type = "TextLabel", 
    name = "m_lblExit", 
    position = LABEL_POS, 
    size = LABEL_SIZE, 
    visible = 0, 
    Text = 
    { 
        text = "$3617", 
        textStyle = "IGHeading1", 
        color = 
            { 255, 255, 255, 255, }, 
        vAlign = "Top", 
        hAlign = "Center", }, }, 
}
