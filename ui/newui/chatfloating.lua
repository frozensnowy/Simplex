-- The Simplex Project
-- 2011/7/9 22:03:00
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
ChatFloating = 
{ 
    size = 
        { 225, 16, 351, 97, }, 
    stylesheet = "HW2StyleSheet", 
    RootElementSettings = 
    { 
        autosize = 1, }, 
    pixelUVCoords = 1, 
    clickThrough = 1, 
; 
{ 
    type = "Frame", 
    position = 
        { 0, 0, }, 
    size = 
        { 351, 97, }, 
    name = "listChat", 
    autoarrange = 1, 
    autosize = 1, 
}, 
{ 
    type = "Frame", 
    name = "listItem", 
    autosize = 1, 
    visible = 0, 
; 
{ 
    type = "TextLabel", 
    name = "text", 
    position = 
        { 4, 0, }, 
    size = 
        { 351, 12, }, 
    wrapping = 1, 
    autosize = 1, 
    Text = 
    { 
        font = "ChatFont", 
        color = 
            { 255, 255, 255, 255, }, 
        hAlign = "Left", }, 
    dropShadow = 1, }, 
}, 
}
