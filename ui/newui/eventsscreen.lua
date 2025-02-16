-- LuaDC version 0.9.19
-- 5/23/2004 7:31:59 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
SCREENWIDTH = 200
SCREENHEIGHT = 100
BOTTOMYPOS = 497
EventsScreen = 
{ 
    size = 
        { 2, (BOTTOMYPOS + -2), SCREENWIDTH, 2, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1, 
    soundOnShow = "SFX_RecallMenuONOFF", 
    soundOnHide = "SFX_RecallMenuONOFF", 
    RootElementSettings = 
    { 
        autosize = 1, }, 
    Regions = 
        { 
            { 0, 0, 22, -1, }, 
        }, 
    bottomYPos = BOTTOMYPOS, 
; 
{ 
    type = "Frame", 
    position = 
        { 0, 0, }, 
    maxSize = 
        { SCREENWIDTH, SCREENHEIGHT, }, 
    size = 
        { SCREENWIDTH, 2, }, 
    name = "listEvents", 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = SCREENWIDTH, 
}, 
{ 
    type = "Frame", 
    name = "listItem", 
    autosize = 1, 
    visible = 0, 
; 
{ 
    type = "Button", 
    position = 
        { 4, 1, }, 
    size = 
        { 13, 14, }, 
    name = "icon", 
    BackgroundGraphic = 
    { 
        size = 
            { 13, 13, }, 
        texture = "DATA:UI\\NewUI\\Taskbar\\eventicon_new.tga", 
        textureUV = 
            { 0, 0, 20, 20, }, 
        color = 
            { 200, 200, 0, 255, }, }, 
    OverGraphic = 
    { 
        size = 
            { 13, 13, }, 
        texture = "DATA:UI\\NewUI\\Taskbar\\eventicon_new.tga", 
        textureUV = 
            { 0, 0, 20, 20, }, 
        color = 
            { 255, 255, 0, 255, }, }, 
    helpTip = "$5456", 
    helpTipScreen = "NewTaskbar", 
    helpTipTextLabel = "commandsHelpTip", 
}, 
{ 
    type = "TextLabel", 
    name = "text", 
    position = 
        { 22, 2, }, 
    size = 
        { (SCREENWIDTH + -28), 13, }, 
    wrapping = 1, 
    autosize = 1, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        hAlign = "Left", }, }, 
}, 
{ 
    type = "Frame", 
    name = "listObjectiveItem", 
    autosize = 1, 
    visible = 0, 
; 
{ 
    type = "Button", 
    position = 
        { 4, 1, }, 
    size = 
        { 13, 14, }, 
    name = "icon", 
    BackgroundGraphic = 
    { 
        size = 
            { 13, 13, }, 
        texture = "DATA:UI\\NewUI\\Taskbar\\eventicon_new.tga", 
        textureUV = 
            { 0, 0, 20, 20, }, 
        color = 
            { 0, 100, 200, 255, }, }, 
    OverGraphic = 
    { 
        size = 
            { 13, 13, }, 
        texture = "DATA:UI\\NewUI\\Taskbar\\eventicon_new.tga", 
        textureUV = 
            { 0, 0, 20, 20, }, 
        color = 
            { 0, 175, 255, 255, }, }, 
    helpTip = "$5457", 
    helpTipScreen = "NewTaskbar", 
    helpTipTextLabel = "commandsHelpTip", 
}, 
{ 
    type = "TextLabel", 
    name = "text", 
    position = 
        { 22, 2, }, 
    size = 
        { (SCREENWIDTH + -28), 13, }, 
    wrapping = 1, 
    autosize = 1, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        hAlign = "Left", }, }, 
}, 
}
