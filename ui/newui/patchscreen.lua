-- The Simplex Project
-- 9/26/2019 4:49:15 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
PatchScreen = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    backgroundColor = 
        { 0, 0, 0, 0, }, 
    extraInfoFormatID = 5186, 
    extraInfoUnknownFormatID = 5187, 
    pixelUVCoords = 1, 
; 
{ 
    type = "TextLabel", 
    position = 
        { 16, -2, }, 
    size = 
        { 750, 36, }, 
    name = "txtLblTITLE", 
    Text = 
    { 
        text = "Neural Net Ponies", 
        textStyle = "FEHeading1", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 17, 34, }, 
    size = 
        { 750, 21, }, 
    name = "txtLblSUBTITLE", 
    Text = 
    { 
        text = "Play against Neural Net Ponies", 
        textStyle = "FEHeading2", }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 168, 184, }, 
    size = 
        { 463, ((231 + -15) + -23), }, 
    name = "frmCenter", 
    backgroundColor = "FEColorBackground1", 
; 
{ 
    type = "TextLabel", 
    position = 
        { 8, 1, }, 
    size = 
        { 450, 16, }, 
    Text = 
    { 
        text = "NEURAL NET PONIES //", 
        textStyle = "FEHeading3", 
        hAlign = "Left", 
        vAlign = "Middle", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 8, 17, }, 
    size = 
        { 450, 13, }, 
    name = "lblProgress", 
    Text = 
    { 
        text = "Please select an instance and click continue when ready", 
        textStyle = "FEHeading4", 
        hAlign = "Left", 
        vAlign = "Middle", }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 4, 33, }, 
    size = 
        { 455, ((194 + -15) + -23), }, 
}, 
{ 
    type = "Line", 
    p1 = 
        { 440, 31, }, 
    p2 = 
        { 440, 172, }, 
    above = 1, 
    color = "FEColorOutline", 
    lineWidth = 2, 
}, 
{ 
    type = "Line", 
    p1 = 
        { 4, (139 + 33), }, 
    p2 = 
        { 459, (139 + 33), }, 
    above = 1, 
    color = "FEColorOutline", 
    lineWidth = 2, 
}, 
{ 
    type = "ProgressBar", 
    progressColor = 
        { 255, 216, 0, 255, }, 
    position = 
        { 6, 174, }, 
    size = 
        { 451, 13, }, 
    name = "progressDownload", 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "Progress will show here...", 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 8, 176, }, 
    autosize = 1, 
    Text = 
    { 
        text = "Please select an instance...", 
        textStyle = "FEHeading4", }, 
    name = "lblProgress2", 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "PLEASE SELECT AN INSTANCE FROM THE LIST TO INITIATE MULTIPLAYER", 
}, 
{ 
    type = "ListBox", 
    visible = 1, 
    backgroundColor = 
        { 25, 25, 25, 89, }, 
    position = 
        { 6, 33, }, 
    size = 
        { 451, 137, }, 
    name = "lstBoxMirrors", 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "THIS BOX LISTS ALL THE AVAILABLE NNP INSTANCES. CLICK ONE TO SELECT IT.", 
}, 
{ 
    type = "ListBox", 
    visible = 0, 
    backgroundColor = 
        { 25, 25, 25, 89, }, 
    position = 
        { 6, 33, }, 
    size = 
        { 451, 137, }, 
    name = "lstBoxDummy", 
}, 
{ 
    type = "TextListBoxItem", 
    buttonStyle = "FEListBoxItemButtonStyle", 
    visible = 0, 
    enabled = 0, 
    Text = 
    { 
        font = "ListBoxItemFont", 
        color = 
            { 255, 255, 255, 255, }, 
        offset = 
            { 4, 0, }, }, 
    backgroundColor = 
        { 0, 0, 0, 0, }, 
    size = 
        { 432, 13, }, 
    name = "lstBoxMirrorsTemplate", }, 
}, 
{ 
    type = "Frame", 
    backgroundColor = "FEColorBackground1", 
    position = 
        { 12, 544, }, 
    size = 
        { 776, 44, }, 
    name = "frmRootbottombigfrm", 
; 
{ 
    type = "Frame", 
    borderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 2, 2, }, 
    size = 
        { 772, 40, }, 
    name = "frmbottomframe", 
; 
{ 
    type = "TextLabel", 
    position = 
        { 4, 4, }, 
    size = 
        { 764, 13, }, 
    name = "lblHelpTip", 
    Text = 
    { 
        textStyle = "FEHelpTipTextStyle", }, 
}, 
{ 
    type = "Line", 
    above = 0, 
    lineWidth = 2, 
    color = "FEColorOutline", 
    p1 = 
        { 2, 19, }, 
    p2 = 
        { 770, 19, }, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 4, 23, }, 
    name = "txtBtnCANCEL", 
    Text = 
    { 
        text = "CANCEL", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "CLICK THIS TO GO BACK TO THE MAIN MENU", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 4, 23, }, 
    name = "txtBtnBACK", 
    Text = 
    { 
        text = "CANCEL", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "CLICK THIS TO GO BACK TO THE MAIN MENU", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 648, 23, }, 
    name = "txtBtnAPPLY", 
    Text = 
    { 
        text = "CONTINUE", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "SEND OUT THE REQUEST AND GO TO THE GAME SELECTION SCREEN", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 648, 23, }, 
    name = "txtBtnDOWNLOAD", 
    Text = 
    { 
        text = "CONTINUE", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "SEND OUT THE REQUEST AND GO TO THE GAME SELECTION SCREEN", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 150, 23, }, 
    name = "txtBtnEXTRAINFO", 
    Text = 
    { 
        text = "MORE INFORMATION", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "lblHelpTip", 
    helpTip = "SHOW INFORMATION ON THE SELECTED INSTANCE AND ITS AVAILIBILITY", }, 
}, 
}, 
}
