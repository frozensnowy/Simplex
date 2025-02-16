-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
dofilepath("Data:UI\\NewUI\\RandomLoadingText.lua")
CurrentRandomTip_ID = random(RandomLoadingTextNum)

GameSetup_HelpTip = {

	size = {0, 0, 100, 200},
	
	RootElementSettings = {
		autosize = 1,
	},
	
	--onShow = "UI_HideScreen('BuildQueueMenu'); UI_HideScreen('UnitCapInfoPopup'); UI_HideScreen('selector'); UI_HideScreen('YearMenu'); UI_HideScreen('EnergyMenu')",
	
	stylesheet = "HW2StyleSheet",
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	clickThrough = 1,
	
	;	

---new chat (in skirmish, not multiplayer)
{ 
    type = "Frame", 
    --backgroundColor = "FEColorBackground1", 
    position = 
        { 12, 70, }, 
    size = 
        { 234, 249, }, 
    --name = "frmRootChatBoxNew", 
; 
--chat space
{ 
    type = "Frame", 
    outerBorderWidth = 2, 
    --borderColor = "FEColorOutline", 
    position = 
        { 4, 32, }, 
    size = 
        { 226, 213, }, 
; 
--random help tips
{
	type = "TextLabel",
	position = 
	{
		0,
		0+3,
	},
	size = 
	{
		225-18,
		196-3,
	},
	wrapping = 1, 
	Text = 
	{
		textStyle = "FEListBoxItemTextStyle",		--FEButtonTextStyle
		text = RandomLoadingText[CurrentRandomTip_ID],
		color = 
		{
			255,
			255,
			255,
			255,
		},
		font = "ChatFont", 
		vAlign = "Top",
		hAlign = "Left",
	},
},
--chat text
{ 
	type = "TextLabel",
	position = { -4, 196 }, 
	size = { 181, 19, },
	wrapping = 0, 
	Text = 
	{
		textStyle = "FEButtonTextStyle",		--FEListBoxItemTextStyle
		text = ""..CurrentRandomTip_ID.."/"..RandomLoadingTextNum,
		color = 
		{
			255,
			255,
			255,
			255,
		},
		font = "ChatFont", 
		vAlign = "Center",
		hAlign = "Center",
	},
},

}, 
	
},
}
	