-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 284
EULA = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1, 
    RootElementSettings = 
    { 
        backgroundColor = "FEColorBackground2", }, 
    --onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);", 
    --onHide = "MainUI_PopEnabledCommandState()", 
    jRight = ((DIALOGWIDTH + -6) + -122), 
    jCenter = ((DIALOGWIDTH + -6) / 2 + -60), 
    jLeft = 2, 
; 
{ 
    type = "Frame", 
    name = "m_frmDialogRoot", 
    size = 
        { DIALOGWIDTH, 100, }, 
    backgroundColor = "FEColorDialog", 
    autosize = 1, 
    marginHeight = 1, 
    position = 
        { (400 - DIALOGWIDTH / 2), 169, }, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    style = "FEPopupBackgroundStyle", 
    position = 
        { 2, 2, }, 
    size = 
        { (DIALOGWIDTH + -4), 96, }, 
    giveParentMouseInput = 1, 
}, 
{ 
    type = "Frame", 
    position = 
        { 2, 2, }, 
    size = 
        { (DIALOGWIDTH + -4), 31, }, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    outerBorderWidth = 2, 
    position = 
        { 2, 2, }, 
    borderColor = "FEColorPopupOutline", 
    size = 
        { (DIALOGWIDTH + -8), 38, }, 
    giveParentMouseInput = 1, }, 
}, 
{ 
    type = "Frame", 
    position = 
        { 1, 0, }, 
    autosize = 1, 
    autoarrange = 1, 
    autoarrangeWidth = (DIALOGWIDTH + -2), 
    autoarrangeSpace = 2, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    size = 
        { (DIALOGWIDTH + -5), 29, }, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "TextLabel", 
    name = "m_lblTitle", 
    position = 
        { 4, 0, }, 
    size = 
        { (DIALOGWIDTH + -10), 13, }, 
    Text = 
    { 
        textStyle = "FEHeading3", 
        text = "EULA", }, 
    giveParentMouseInput = 1, 
}, 
{ 
    type = "TextLabel", 
    name = "m_lblSubTitle", 
    position = 
        { 4, 15, }, 
    size = 
        { (DIALOGWIDTH + -10), 10, }, 
    Text = 
    { 
        textStyle = "FEHeading4", 
        text = "End User License Agreement", }, 
    giveParentMouseInput = 1, }, 
}, 
{ 
    type = "Frame", 
    name = "m_frmBorderRoot", 
    outerBorderWidth = 1, 
    position = 
        { 3, 30, }, 
    autosize = 1, 
    borderColor = "FEColorPopupOutline", 
    autoarrange = 1, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
    autosize = 1, 
    autoarrange = 1, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "TextLabel", 
    width = (DIALOGWIDTH + -6), 
    autosize = 1, 
    wrapping = 1, 
    marginHeight = 4, 
    marginWidth = 4, 
    Text = 
    { 
    		text = "This game is a free software distributed under the Creative Commons Attribution-NonCommercial (CC BY-NC) License, meaning you can do whatever you want with it as long as you don't say you made it or make money with it.",
        textStyle = "FEHelpTipTextStyle", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, }, 
}, 
{ 
    type = "Frame", 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
    autosize = 1, 
    autoarrange = 1, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "TextLabel", 
    width = (DIALOGWIDTH + -6), 
    autosize = 1, 
    wrapping = 1, 
    marginHeight = 4, 
    marginWidth = 4, 
    Text = 
    { 
    		text = "<c=CF1400>Simplex comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.</c>",
        textStyle = "FEHelpTipTextStyle", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, }, 
}, 
{ 
    type = "Frame", 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
    autosize = 1, 
    autoarrange = 1, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "TextLabel", 
    width = (DIALOGWIDTH + -6), 
    autosize = 1, 
    wrapping = 1, 
    marginHeight = 4, 
    marginWidth = 4, 
    Text = 
    { 
    		text = "By continuing using this game, you acknowledge that you are well aware of all the risks associated with messing around with it.",
        textStyle = "FEHelpTipTextStyle", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, }, 
}, 
{ 
    type = "Frame", 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
    autosize = 1, 
    autoarrange = 1, 
    giveParentMouseInput = 1, 
; 
{ 
    type = "TextLabel", 
    width = (DIALOGWIDTH + -6), 
    autosize = 1, 
    wrapping = 1, 
    marginHeight = 4, 
    marginWidth = 4, 
    Text = 
    { 
    		text = "You hereby agree that any photosensitive epilepsy, dislocated jaw, involuntary tremor, asphyxiation, brain damage or PTSD resulted from software and hardware malfunctions including but not limited to blue screen of death, burning video card, boiling water cooler, molten PSU and rapid unscheduled self-disassembly of your PC is totally not a coincidence and completely your own responsibility.",
        textStyle = "FEHelpTipTextStyle", 
        vAlign = "Top", }, 
    giveParentMouseInput = 1, }, 
}, 
{ 
    type = "Frame", 
    name = "m_frmButtons", 
    size = 
        { (DIALOGWIDTH + -6), 19, }, 
    borderWidth = 1, 
    borderColor = "FEColorPopupOutline", 
    giveParentMouseInput = 1, 
; 
{ 
    visible = 1, 
    type = "TextButton", 
    position = 
        { 3, 3, }, 
    buttonStyle = "FEButtonStyle2", 
    name = "m_btnAccept", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Accept", }, 
    onMouseClicked = [[UI_HideScreen('EULA');]],		
    giveParentMouseInput = 1, 
}, 
{ 
    type = "TextButton", 
    position = 
        { ((DIALOGWIDTH + -6) + -123), 3, }, 
    name = "m_btnGo", 
    buttonStyle = "FEButtonStyle1", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Decline", }, 
    onMouseClicked = [[
    UI_PlaySound('SFX_BSD_'..random(1,3));
    UI_SetElementVisible("EULA", "BSD_"..random(1,7), 1);
    ]],
    giveParentMouseInput = 1, }, 
}, 
}, 
}, 
}, 

	{
		type = "Frame",
		name = "BSD_1",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_1.tga",
			textureUV = {0,0,1920,1080},
			color = OUTLINECOLOR,
		},
	},
	{
		type = "Frame",
		name = "BSD_2",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_2.tga",
			textureUV = {0,0,1920,1080},
			color = OUTLINECOLOR,
		},
	},
	{
		type = "Frame",
		name = "BSD_3",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_3.tga",
			textureUV = {0,0,960,540},
			color = OUTLINECOLOR,
		},
	},
	{
		type = "Frame",
		name = "BSD_4",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_4.tga",
			textureUV = {0,0,1920,1080},
			color = OUTLINECOLOR,
		},
	},
	{
		type = "Frame",
		name = "BSD_5",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_5.tga",
			textureUV = {0,0,1920,1080},
			color = OUTLINECOLOR,
		},
	},
	{
		type = "Frame",
		name = "BSD_6",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_6.tga",
			textureUV = {0,0,1600,900},
			color = OUTLINECOLOR,
		},
	},
	{
		type = "Frame",
		name = "BSD_7",
		visible = 0,
		position = {0, 0},
		size = {800,600},
		BackgroundGraphic = {
			texture = "data:ui\\newui\\background\\BSD_7.tga",
			textureUV = {0,0,1280,804},
			color = OUTLINECOLOR,
		},
	},
	
}