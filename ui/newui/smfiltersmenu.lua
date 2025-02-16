-- The Simplex Project
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
SMFiltersMenu = 
{ 
    size = 
        { 2, 171, 111, 101, }, 
    stylesheet = "HW2StyleSheet", 
    RootElementSettings = 
    { 
        backgroundColor = "IGColorBackground1", 
        autosize = 1, }, 
    pixelUVCoords = 1, 
; 
{ 
    type = "Frame", 
    name = "title", 
    position = 
        { 0, 0, }, 
    size = 
        { 111, 13, }, 
; 
{ 
    type = "TextLabel", 
    position = 
        { 0, 0, }, 
    size = 
        { 111, 13, }, 
    marginWidth = 8, 
    Text = 
    { 
        textStyle = "IGHeading2", 
        text = "$2830", }, }, 
}, 
{ 
    type = "Frame", 
    name = "filterList", 
    position = 
        { 0, 13, }, 
    autosize = 1, 
    autoarrange = 1, 
    marginWidth = 4, 
    marginHeight = 4, 
    borderWidth = 2, 
    borderColor = "IGColorOutline", 
}, 
{ 
    type = "Button", 
    name = "filterItem", 
    size = 
        { 111, 13, }, 
    visible = 0, 
    borderWidth = 1, 
    borderColor = 
        { 0, 0, 0, 0, }, 
    overBorderColor = 
        { 0, 175, 255, 255, }, 
    pressedBorderColor = 
        { 255, 255, 255, 255, }, 
; 
{ 
    type = "Frame", 
    name = "colorBlock", 
    position = 
        { 3, 3, }, 
    size = 
        { 7, 7, }, 
    backgroundColor = 
        { 255, 0, 0, 255, }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 13, 0, }, 
    autosize = 1, 
    name = "filterLabel", 
    Text = 
    { 
        textStyle = "IGHeading2", 
        hAlign = "Left", 
        vAlign = "Center", 
        color = 
            { 170, 227, 255, 255, }, }, 
    giveParentMouseInput = 1, }, 
}, 
}
