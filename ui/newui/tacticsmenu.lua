-- LuaDC version 0.9.19
-- 5/23/2004 7:32:08 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
TacticsMenu = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    claimMousePress = 1, 
    RootElementSettings = 
    { 
        onMouseClicked = "UI_ToggleScreen( 'TacticsMenu', 0)", }, 
    pixelUVCoords = 1, 
    onShow = "\n	UI_SetButtonPressed('NewTaskbar', 'btnTactics', 1);\n	UI_SetButtonTextHotkey('TacticsMenu', 'btnPassive', '$3132', 34); \n	UI_SetButtonTextHotkey('TacticsMenu', 'btnDefensive', '$3131', 35); \n	UI_SetButtonTextHotkey('TacticsMenu', 'btnAggressive', '$3130', 36); \n	", 
    onHide = "UI_SetButtonPressed('NewTaskbar', 'btnTactics', 0)", 
; 
{ 
    type = "Frame", 
    name = "rootFrame", 
    position = 
        { 0, 0, }, 
    size = 
        { 800, 600, }, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    name = "menu", 
    position = 
        { 1, 448-86-30, }, 
    size = 
        { 217, 65+86+30, }, 
    backgroundColor = "IGColorBackground1", 
; 
{ 
    type = "TextLabel", 
    position = 
        { -2, 0, }, 
    size = 
        { 221, 18, }, 
    borderColor = 
        { 170, 227, 255, 255, }, 
    borderWidth = 2, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "TACTICS//", }, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnPassive", 
    toggleButton = 0, 
    position = 
        { 2, 21, }, 
    size = 
        { 213, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, }, 
    onMouseReleased = "UI_ToggleScreen( 'TacticsMenu', 0)", 
    hotKeyID = 34, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 32, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "no auto-engage, keep position - Frigates, Capital Ships", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 42, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-dock if damaged - Fighters, Corvettes, Collectors", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 52, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "no auto-launch for support units - Patchers, Drones, etc.", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 52+10, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-escape from explosions - small ships", }, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnDefensive", 
    toggleButton = 0, 
    position = 
        { 2, 64+10, }, 
    size = 
        { 213, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, }, 
    onMouseReleased = "UI_ToggleScreen( 'TacticsMenu', 0)", 
    hotKeyID = 35, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 75+10, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-engage enemy attackers - all ships", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 85+10, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "no auto-dock if damaged - all ships", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 95+10, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-launch support units - Patchers, Drones, etc.", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 95+20, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-escape from explosions - small ships", }, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "RightClickMenu_ButtonStyle", 
    name = "btnAggressive", 
    toggleButton = 0, 
    position = 
        { 2, 107+20, }, 
    size = 
        { 213, 12, }, 
    Text = 
    { 
        font = "ButtonFont", 
        hAlign = "Left", 
        offset = 
            { 4, 0, }, }, 
    onMouseReleased = "UI_ToggleScreen( 'TacticsMenu', 0)", 
    hotKeyID = 36, 
},  
{ 
    type = "TextLabel", 
    position = 
        { -2, 118+20, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-engage enemies in range - all ships", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 128+20, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "no auto-dock if damaged - all ships", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 138+20, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "auto-launch support units - Patchers, Drones, etc.", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { -2, 138+30, }, 
    size = 
        { 221, 12, },     
    Text = 
    { 
        textStyle = "ResearchInfoTextStyle", 
        hAlign = "Left", 
        offset = 
            { 8, 0, }, 
        color = 
            { 255, 255, 255, 255, }, 
        text = "no auto-escape from explosions - small ships", }, 
}, 
}, 
{ 
    type = "Frame", 
    name = "menu", 
    position = 
        { 151, 515, }, 
    size = 
        { 69, 17, }, 
    onMouseClicked = "UI_ToggleScreen( 'TacticsMenu', 0)", }, 
}, 
}
