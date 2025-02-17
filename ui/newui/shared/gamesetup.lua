-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
GameSetup = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    RootElementSettings = {}, 
    pixelUVCoords = 1, 
    titleSkirmish = "$3310", 
    titleMultiplayer = "$3311", 
    subtitleSkirmish = "$3312", 
    showLobbyPlayersText = "$3320", 
    hideLobbyPlayersText = "$3315", 
    openString = "$3316", 
    closedString = "$3317", 
    labelGameChat = "$3296", 
    labelLobbyChat = "$3297", 
    posSkirmish = 
        { 12, 70, }, 
    posMultiplayer = 
        { 12, 70, }, 
    levelString = "$3318", 
    defaultThumbnail = "Data:LevelData\\Multiplayer\\DefaultMapThumbnail.tga", 
    subtitleMultiplayerJoinID = 3313, 
    subtitleMultiplayerHostID = 3314, 
    sayFormatID = 3364, 
    whisperFormatID = 3365, 
    whisperEchoFormatID = 3369, 
    playerJoinedFormatID = 3525, 
    playerLeftFormatID = 3526, 
    fStringCPU = "$3294", 
		--onShow = [[UI_SetElementVisible( "GameSetup", "frmRootChatBoxNew", 0 );]],
		onShow =
					[[
						UI_HideScreen('GameSetup_HelpTip');
					]],
    ErrorMessages = 
    { 
        LM_Disconnected = "$3319", }, 
; 
{ 
    type = "Frame", 
    position = 
        { 0, 0, }, 
    size = 
        { 800, 600, }, 
    name = "frmTheRoot", 
; 
{ 
    type = "TextListBoxItem", 
    buttonStyle = "FEListBoxItemButtonStyle", 
    name = "listBoxItemToClone", 
    resizeToListBox = 1, 
    visible = 0, 
    Text = 
    { 
        textStyle = "FEListBoxItemTextStyle", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 16, -2, }, 
    size = 
        { 600, 36, }, 
    name = "txtLblTITLE", 
    Text = 
    { 
        text = "$3300", 
        textStyle = "FEHeading1", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 17, 34, }, 
    size = 
        { 600, 21, }, 
    name = "txtLblSUBTITLE", 
    Text = 
    { 
        text = "$3301", 
        textStyle = "FEHeading2", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 638, 40, }, 
    size = 
        { 144, 13, }, 
    name = "txtLblIPADDRESS", 
    Text = 
    { 
        text = "$3360", 
        textStyle = "FEHeading4", 
        hAlign = "Right", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3321", 
}, 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 128, 32, }, 
        texture = "Data:UI\\NewUI\\Network\\gamespy.mres", 
        textureUV = 
            { 0, 0, 128, 32, }, }, 
    position = 
        { 656, 9, }, 
    size = 
        { 128, 32, }, 
    name = "frmgr1gamespytga", 
}, 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 128, 35, }, 
        texture = "Data:UI\\NewUI\\Network\\relic.mres", 
        textureUV = 
            { 0, 0, 128, 35, }, }, 
    position = 
        { 656, 5, }, 
    size = 
        { 128, 35, }, 
    name = "frmgr1relictgaLAN", 
}, 
---players
{ 
    type = "Frame", 
    name = "frmSkirmish", 
    autosize = 1, 
; 
{ 
    type = "Frame", 
    backgroundColor = "FEColorBackground1", 
    position = 
        { 0, 259, }, 
    size = 
        { 483, 197, }, 
    name = "frmRootPlayersBox", 
; 
{ 
    type = "TextLabel", 
    position = 
        { 5, 2, }, 
    autosize = 1, 
    name = "txtLblGAMEPLAYERS", 
    Text = 
    { 
        text = "$3305", 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 19, }, 
    autosize = 1, 
    name = "txtLblPLAYEROPTIONS", 
    Text = 
    { 
        text = "$3309", 
        textStyle = "FEHeading4", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 133, 19, }, 
    size = 
        { 70, 9, }, 
    name = "txtLblCOLOURS", 
    Text = 
    { 
        text = "$3340", 
        textStyle = "FEHeading4", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 206, 19, }, 
    size = 
        { 86, 9, }, 
    name = "txtLblRACE", 
    Text = 
    { 
        text = "$3341", 
        textStyle = "FEHeading4", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 297, 19, }, 
    size = 
        { 56, 9, }, 
    name = "txtLblTEAM", 
    Text = 
    { 
        text = "$3342", 
        textStyle = "FEHeading4", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 356, 19, }, 
    size = 
        { 60, 9, }, 
    name = "txtLblPOSITION", 
    Text = 
    { 
        text = "$3343", 
        textStyle = "FEHeading4", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 420, 19, }, 
    size = 
        { 42, 9, }, 
    name = "txtLblPING", 
    Text = 
    { 
        text = "$3344", 
        textStyle = "FEHeading4", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 464, 19, }, 
    size = 
        { 22, 9, }, 
    name = "txtLblOK", 
    Text = 
    { 
        text = "$3345", 
        textStyle = "FEHeading4", }, 
}, 
{ 
    type = "Frame", 
    borderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 2, 32, }, 
    size = 
        { 479, 162, }, 
    name = "frmPlayerSlots", 
    autoarrange = 1, 
    autoarrangeWidth = 480, 
}, 
{ 
    type = "Frame", 
    borderWidth = 1, 
    borderColor = "FEColorOutline", 
    position = 
        { 3, 32, }, 
    size = 
        { 479, 27, }, 
    name = "frmplr1frm", 
    visible = 0, 
; 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    position = 
        { 292, 7, }, 
    size = 
        { 60, 13, }, 
    name = "ddLstChooseTeam", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3322", 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 416, 6, }, 
    size = 
        { 41, 15, }, 
    name = "txtLblpingpl1", 
    Text = 
    { 
        text = "$3344", 
        textStyle = "FEListBoxItemTextStyle", 
        offset = 
            { 1, 0, }, }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3323", 
}, 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    position = 
        { 200, 7, }, 
    size = 
        { 90, 13, }, 
    name = "ddLstChooseRace", 
    enabled = 1, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3324", 
}, 
{ 
    type = "Button", 
    buttonStyle = "FEReadyButtonStyle", 
    position = 
        { 461, 7, }, 
    name = "btnPCheck", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3325", 
}, 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    position = 
        { 354, 7, }, 
    enabled = 1, 
    size = 
        { 60, 13, }, 
    name = "ddLstChoosePos", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3326", 
}, 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 184, 19, }, 
    name = "frmPlayerInfoLocal", 
; 
{ 
    type = "Button", 
    name = "btnEmblem", 
    size = 
        { 184, 19, }, 
    borderWidth = 1, 
    borderColor = 
        { 215, 215, 215, 255, }, 
    overBorderColor = 
        { 255, 255, 255, 255, }, 
    disabledBorderColor = 
        { 175, 175, 175, 255, }, 
    giveParentMouseInput = 1, 
    disabledHelpTip = " ", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3368", 
; 
{ 
    type = "TextLabel", 
    position = 
        { 6, 1, }, 
    size = 
        { 177, 17, }, 
    name = "txtLblSelectedPlayerName", 
    giveParentMouseInput = 1, 
    dropShadow = 1, 
    Text = 
    { 
        color = 
            { 255, 255, 255, 255, }, 
        textStyle = "FEButtonTextStyle", 
        hAlign = "Left", 
        dropShadow = 1, }, 
; 
{ 
    type = "Frame", 
    position = 
        { 115, 0, }, 
    size = 
        { 60, 17, }, 
    name = "frmEmblem", 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 60, 17, }, 
        texture = "Data:UI\\NewUI\\Network\\stripes.mres", 
        textureUV = 
            { 0, 0, 60, 17, }, }, 
    size = 
        { 60, 17, }, 
    name = "frmStripe", 
    giveParentMouseInput = 1, 
}, 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 17, 17, }, 
        texture = "DATA:Badges/Hiigaran.tga", 
        textureUV = 
            { 0, 0, 64, 64, }, }, 
    backgroundColor = 
        { 25, 25, 25, 0, }, 
    size = 
        { 17, 17, }, 
    name = "frmBadge", 
    giveParentMouseInput = 1, }, 
}, 
}, 
}, 
}, 
{ 
    type = "Frame", 
    position = 
        { 4, 4, }, 
    size = 
        { 184, 19, }, 
    name = "frmPlayerInfoOther", 
; 
{ 
    type = "Button", 
    name = "btnEmblem", 
    position = 
        { 120, 1, }, 
    size = 
        { 60, 17, }, 
    outerBorderWidth = 1, 
    disabledBorderColor = 
        { 175, 175, 175, 255, }, 
    overBorderColor = 
        { 255, 255, 255, 255, }, 
    borderColor = 
        { 215, 215, 215, 255, }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3448", 
    disabledHelpTip = " ", 
; 
{ 
    type = "Frame", 
    position = 
        { 0, 0, }, 
    size = 
        { 60, 17, }, 
    name = "frmEmblem", 
    giveParentMouseInput = 1, 
; 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 60, 17, }, 
        texture = "Data:UI\\NewUI\\Network\\stripes.mres", 
        textureUV = 
            { 0, 0, 60, 17, }, }, 
    size = 
        { 60, 17, }, 
    name = "frmStripe", 
    giveParentMouseInput = 1, 
}, 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        size = 
            { 17, 17, }, 
        texture = "DATA:Badges/Hiigaran.tga", 
        textureUV = 
            { 0, 0, 64, 64, }, }, 
    backgroundColor = 
        { 25, 25, 25, 0, }, 
    size = 
        { 17, 17, }, 
    name = "frmBadge", 
    giveParentMouseInput = 1, }, 
}, 
}, 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    giveParentMouseInput = 1, 
    position = 
        { 2, 2, }, 
    size = 
        { 111, 13, }, 
    name = "ddLstDifficulty", 
    visible = 0, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3327", 
    disabledHelpTip = " ", 
}, 
{ 
    visible = 0, 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    giveParentMouseInput = 1, 
    position = 
        { 2, 2, }, 
    size = 
        { 111, 13, }, 
    name = "ddLstSlotControl", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3328", 
    disabledHelpTip = " ", }, 
}, 
}, 
}, 

---map
{ 
    type = "Frame", 
    backgroundColor = "FEColorBackground1", 
    position = 
        { 242, 0, }, 
    size = 
        { 241, 249, }, 
    name = "frmRootMapBox", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3329", 
; 
{ 
    type = "TextLabel", 
    position = 
        { 5, 2, }, 
    autosize = 1, 
    name = "txtLblMAP", 
    Text = 
    { 
        text = "$3302", 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 19, }, 
    autosize = 1, 
    name = "txtLblSELECTYOURMAP", 
    Text = 
    { 
        text = "$3306", 
        textStyle = "FEHeading4", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "Frame", 
    borderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 2, 30, }, 
    size = 
        { 237, 217, }, 
    name = "frmMapFrame", 
; 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    position = 
        { 4, 5, }, 		
    width = 229, 
    name = "ddLstChooseMap", 
}, 
{ 
    type = "Frame", 
    BackgroundGraphic = 
    { 
        type = "Graphic", 
        texture = "Data:LevelData\\Multiplayer\\DefaultMapThumbnail.tga", 
        textureUV = 
            { 0, 0, 360*1.35, 266*1.35, }, }, 
    position = 
        { 4, 19, }, 
    size = 
        { 229, 194, },		--{ 180, 131, },
    name = "frmMapThumbnail", 
}, 
{ 
    type = "TextListBoxItem", 
    buttonStyle = "FEListBoxItemButtonStyle", 
    visible = 0, 
    enabled = 0, 
    resizeToListBox = 1, 
    Text = 
    { 
        textStyle = "FEListBoxItemTextStyle", }, 
    position = 
        { 4, 4, }, 
    width = 229, 
    name = "ddLstChooseMapTemplate", }, 
}, 
}, 

---options
{ 
    type = "Frame", 
    backgroundColor = "FEColorBackground1", 
    position = 
        { 491, 0, }, 
    size = 
        { 284, 456, }, 
    name = "frmRootOptionsBox", 
; 
{ 
    type = "TextLabel", 
    position = 
        { 5, 2, }, 
    autosize = 1, 
    name = "txtLblOPTIONS", 
    Text = 
    { 
        text = "$3303", 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 19, }, 
    autosize = 1, 
    name = "txtLblGAMESETUP", 
    Text = 
    { 
        text = "$3307", 
        textStyle = "FEHeading4", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "Frame", 
    borderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 2, 30, }, 
    size = 
        { 280, 424, }, 
    name = "frmOptFrame", 
    autoarrange = 1, 
    autoarrangeWidth = 280, 
    autoarrangeSpace = -1, 
}, 
{ 
    type = "Line", 
    p1 = 
        { 2, 48, }, 
    p2 = 
        { 280, 48, }, 
    color = "FEColorOutline", 
    lineWidth = 2, 
    above = 0, 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 160, 5, }, 
    name = "txtBtnMOREOPTIONS", 		
    Text = 
    { 
        text = "$5057", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$5058", }, 
}, 
}, 
--intestazione
{ 
    type = "Frame", 
    name = "frmGameTypeToClone", 
    size = 
        { 279, 20, }, 
    visible = 0, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3245", 
; 
{ 
    type = "Button", 
    name = "btnGameInfo", 
    position = 
        { 140, 3, }, 
    buttonStyle = "FEInfoButtonStyle", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3246", 
}, 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    position = 
        { 158, 4, }, 
    width = 120, 
    name = "ddLstOptionChoices", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3245", 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 3, }, 
    size = 
        { 150, 13, }, 
    Text = 
    { 
        textStyle = "FEHeading4", 
        text = "$3244", }, 
    giveParentMouseInput = 1, }, 
}, 
--corpo
{ 
    type = "Frame", 
    position = 
        { 1, 1, }, 
    size = 
        { 279, 17, }, 
    visible = 0, 
    name = "frmOptionToClone", 
    helpTipTextLabel = "txtLblHELPTEXT", 
; 
{ 
    type = "DropDownListBox", 
    dropDownListBoxStyle = "FEDropDownListBoxStyle", 
    position = 
        { 158, 4, }, 
    width = 120, 
    name = "ddLstOptionChoices", 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 2, }, 
    size = 
        { 150, 13, }, 
    name = "txtLblOptionName", 
    Text = 
    { 
        textStyle = "FEHeading4", }, }, 
}, 
---new chat (in skirmish, not multiplayer)
{ 
    type = "Frame", 
    backgroundColor = "FEColorBackground1", 
    position = 
        { 12, 70, }, 
    size = 
        { 234, 249, }, 
    name = "frmRootChatBoxNew", 
; 
{ 
    type = "Frame", 
    size = 
        { 215, 249, }, 
; 
{ 
    type = "Line", 
    lineWidth = 2, 
    color = "FEColorOutline", 
    above = 0, 
    p1 = 
        { 215, 32, }, 
    p2 = 
        { 215, 228 }, }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 2, }, 
    autosize = 1, 
    Text = 
    { 
        text = "HELP",		--$3295 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 19, }, 
    autosize = 1,     
    Text = 
    { 
		    text = "RANDOM TIPS//",
        textStyle = "FEHeading4", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
--chat space
{ 
    type = "Frame", 
    outerBorderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 4, 32, }, 
    size = 
        { 226, 213, }, 
;
{ 
    type = "ListBox", 
    position = 
        { 0, 0, }, 
    size = 
        { 225, 196, }, 
    hugBottom = 1, 
    maxItems = 200, 
}, 
{ 
    type = "ListBoxItem", 
    visible = 0, 
    enabled = 0, 
    autosize = 1,     
; 
{ 
    type = "TextLabel",     
    Text = 
    { 
        textStyle = "FEListBoxItemTextStyle", 
        color = 
            { 255, 255, 255, 255, }, 
        font = "ChatFont", 
        offset = 
            { 0, 0, }, }, 
    width = 210, 
    wrapping = 1, 
    autosize = 1, 
    marginWidth = 2, }, 
}, 
--button send
{ 
    type = "Frame", 
		outerBorderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 177, 198, }, 
    size = 
        { 50, 21, },     
; 
{ 
    type = "TextButton", 
		enabled = 1,	--0
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 1, 1, }, 
    width = 47, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "SHOW ANOTHER RANDOM HELP TIP", 	--GAME CHAT DISABLED IN SINGLE PLAYER
		borderWidth = 2, 
    borderColor = "FEColorOutline",
    Text = 
    { 
        text = "NEXT", 		--$3349
        textStyle = "FEButtonTextStyle", }, 
    onMouseClicked =
					[[
						UI_ShowScreen("GameSetup_HelpTip", ePopup);
						UI_ReloadScreen("GameSetup_HelpTip");
					]],
}, 
}, 
--chat text
{ 
    type = "Frame",     
    borderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { -4, 196 }, 
    size = 
        { 181, 19, },    
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "CURRENT HELP TIP ID/TOTAL NUMBER OF HELP TIPS", }, 	--GAME CHAT DISABLED IN SINGLE PLAYER
},
}, 
---chat		(real chat for multiplaer)
{ 
    type = "Frame",      
    backgroundColor = "FEColorBackground1", 
    position = 
        { 12, 70, }, 
    size = 
        { 234, 249, }, 
    name = "frmRootChatBox", 
;
{ 
    type = "Frame", 
    size = 
        { 215, 249, }, 
; 
{ 
    type = "Line", 
    lineWidth = 2, 
    color = "FEColorOutline", 
    above = 0, 
    p1 = 
        { 215, 32, }, 
    p2 = 
        { 215, 228 }, }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 2, }, 
    autosize = 1, 
    Text = 
    { 
        text = "$3295",		--CHAT
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 5, 19, }, 
    autosize = 1,     
    Text = 
    { 
		    text = "GAME CHAT//",
        textStyle = "FEHeading4", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
										{ 
												type = "ListBoxItem", 
												buttonStyle = "FEListBoxItemButtonStyle", 
												name = "lstBoxLobbyPlayersTemplate", 
												width = 230, 
												visible = 0, 
												enabled = 0, 
												backgroundColor = 
														{ 0, 0, 0, 0, }, 
										; 
										{ 
												type = "TextLabel", 
												name = "lblName", 
												size = 
														{ 88, 13, }, 
												position = 
														{ 13, 0, }, 
												visible = 1, 
												Text = 
												{ 
														textStyle = "FEListBoxItemTextStyle", 
														offset = 
																{ 4, 0, }, }, 
										}, 
										{ 
												type = "Button", 
												name = "btnListAll", 
												visible = 1, 
												size = 
														{ 13, 13, }, 
												position = 
														{ 0, 0, }, 
												borderColor = 
														{ 0, 175, 255, 255, }, 
												borderWidth = 0, 
												DefaultGraphic = 
												{ 
														texture = "data:ui/newui/network/chat_icons.tga", 
														textureUV_TL = 
																{ 19, 41, }, 
														textureUV_WH = 
																{ 13, 13, }, }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3480", 
										}, 
										{ 
												type = "Button", 
												name = "btnListIgnore", 
												visible = 0, 
												size = 
														{ 13, 13, }, 
												position = 
														{ 0, 0, }, 
												borderColor = 
														{ 0, 175, 255, 255, }, 
												borderWidth = 0, 
												DefaultGraphic = 
												{ 
														texture = "data:ui/newui/network/chat_icons.tga", 
														textureUV_TL = 
																{ 34, 41, }, 
														textureUV_WH = 
																{ 13, 13, }, }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3481", 
										}, 
										{ 
												type = "Button", 
												name = "btnListWhisper", 
												visible = 0, 
												size = 
														{ 13, 13, }, 
												position = 
														{ 0, 0, }, 
												borderColor = 
														{ 0, 175, 255, 255, }, 
												borderWidth = 0, 
												DefaultGraphic = 
												{ 
														texture = "data:ui/newui/network/chat_icons.tga", 
														textureUV_TL = 
																{ 3, 42, }, 
														textureUV_WH = 
																{ 13, 13, }, }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3482", }, 
}, 
										{ 
												type = "Frame", 
												autoarrange = 1, 
												autoarrangeSpace = 1, 
												position = 
														{ 800, 600, }, 
												autoarrangeWidth = 234, 
												autosize = 1, 
										; 
										{ 
												type = "RadioButton", 
												buttonStyle = "FETabButtonStyle", 
												name = "txtBtnLOBBYCHAT", 
												Text = 
												{ 
														text = "$3304", 
														textStyle = "FEButtonTextStyle", }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3299", 
										}, 
										{ 
												type = "RadioButton", 
												buttonStyle = "FETabButtonStyle", 
												name = "txtBtnGAMECHAT", 
												Text = 
												{ 
														text = "$3350", 
														textStyle = "FEButtonTextStyle", }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3298", }, 
										}, 
{ 
    type = "TextLabel", 
    position = 
        { 800, 600, }, 
    autosize = 1, 
    Text = 
    { 
        text = "$3295", 
        textStyle = "FEHeading3", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    position = 
        { 800, 600, }, 
    autosize = 1, 
    name = "txtLblLOBBYCHAT", 
    Text = 
    { 
        textStyle = "FEHeading4", 
        vAlign = "Top", 
        hAlign = "Left", }, 
}, 
										{ 
												type = "TextLabel", 
												position = 
														{ 128, 19, }, 
												size = 
														{ 138, 9, }, 
												name = "txtLblTYPESUPPRESSOPTION", 
												Text = 
												{ 
														text = "$3483", 
														textStyle = "FEHeading4", 
														hAlign = "Right", }, 
										}, 
										{ 
												type = "Button", 
												buttonStyle = "FEReadyButtonStyle", 
												name = "btnSuppress", 
												position = 
														{ 267, 16, }, 
												visible = 1, 
												pressed = 1, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3484", 
										}, 
--corpo
{ 
    type = "Frame", 
    outerBorderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 4, 32, }, 
    size = 
        { 226, 213, }, 
; 
										{ 
												type = "ListBox", 
												position = 
														{ 0, 0, }, 
												size = 
														{ 278, (161 + -19), }, 
												name = "lstBoxLobbyPlayers", 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3330", 
												marginWidth = 2, 
										}, 
										{ 
												type = "TextButton", 
												position = 
														{ 0, (161 + -19), }, 
												size = 
														{ 278, 13, }, 
												name = "txtBtnCollapsePlayers", 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3331", 
												Text = 
												{ 
														text = showLobbyPlayersText, 
														textStyle = "FEButtonTextStyle", }, 
												backgroundColor = "FEColorOutline", 
												overTextColor = 
														{ 255, 255, 255, 255, }, 
												pressedTextColor = 
														{ 215, 215, 215, 255, }, 
												textColor = 
														{ 0, 0, 0, 255, }, 
												BackgroundGraphic = 
												{ 
														position = 
																{ 6, 0, }, 
														size = 
																{ 13, 13, }, 
														texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\vert_default.mres", 
														textureUV = 
																{ 0, 0, 13, 13, }, }, 
												BackgroundGraphic2 = 
												{ 
														position = 
																{ 6, 0, }, 
														size = 
																{ 13, 13, }, 
														texture = "DATA:UI\\NewUI\\Styles\\ArrowButtons\\vert_default.mres", 
														textureUV = 
																{ 0, 13, 13, 0, }, }, 
										}, 
--chatting
{ 
    type = "ListBox", 
    position = 
        { 0, 0, }, 
    size = 
        { 225, 196, }, 
    name = "lstBoxChat", 
    hugBottom = 1, 
    maxItems = 200, 
}, 
{ 
    type = "ListBoxItem", 
    visible = 0, 
    enabled = 0, 
    autosize = 1, 
    name = "lstBoxChatTemplate", 
; 
{ 
    type = "TextLabel", 
    name = "m_lblText", 
    Text = 
    { 
        textStyle = "FEListBoxItemTextStyle", 
        color = 
            { 255, 255, 255, 255, }, 
        font = "ChatFont", 
        offset = 
            { 0, 0, }, }, 
    width = 210, 
    wrapping = 1, 
    autosize = 1, 
    marginWidth = 2, }, 
}, 
{ 
    type = "Frame", 
    outerBorderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { 177, 198, }, 
    size = 
        { 50, 21, },    
    name = "frmchatframebtns", 
; 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 1, 1, }, 
    width = 47, 
    name = "txtBtnSEND", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3332", 
		borderWidth = 2, 
    borderColor = "FEColorOutline",
    onMouseClicked =
					[[
						UI_SetElementVisible( "", "frmRootChatBoxNew", 0 ); 
					]],
    Text = 
    { 
        text = "$3349", 
        textStyle = "FEButtonTextStyle", }, 
}, 
										{ 
												type = "Button", 
												name = "btnToAll", 
												visible = 1, 
												size = 
														{ 64, 13, }, 
												position = 
														{ 3, 1, }, 
												borderColor = 
														{ 0, 175, 255, 255, }, 
												borderWidth = 2, 
												DefaultGraphic = 
												{ 
														texture = "data:ui/newui/network/chat_icons.tga", 
														textureUV_TL = 
																{ 0, 26, }, 
														textureUV_WH = 
																{ 64, 13, }, }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3333", 
												onMouseClicked = [[UI_SetElementVisible( "", "btnToAll", 0 ); UI_SetElementVisible( "", "btnWhisper", 1 );]], 
										}, 
										{ 
												type = "Button", 
												name = "btnWhisper", 
												visible = 0, 
												size = 
														{ 64, 13, }, 
												position = 
														{ 3, 1, }, 
												borderColor = 
														{ 0, 175, 255, 255, }, 
												borderWidth = 2, 
												DefaultGraphic = 
												{ 
														texture = "data:ui/newui/network/chat_icons.tga", 
														textureUV_TL = 
																{ 0, 0, }, 
														textureUV_WH = 
																{ 64, 13, }, }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3334", 
												onMouseClicked = [[UI_SetElementVisible( "", "btnWhisper", 0 ); UI_SetElementVisible( "", "btnWhisperToList", 1 );]], 
										}, 
										{ 
												type = "Button", 
												name = "btnWhisperToList", 
												visible = 0, 
												size = 
														{ 64, 13, }, 
												position = 
														{ 3, 1, }, 
												borderColor = 
														{ 0, 175, 255, 255, }, 
												borderWidth = 2, 
												DefaultGraphic = 
												{ 
														texture = "data:ui/newui/network/chat_icons.tga", 
														textureUV_TL = 
																{ 0, 13, }, 
														textureUV_WH = 
																{ 64, 13, }, }, 
												helpTipTextLabel = "txtLblHELPTEXT", 
												helpTip = "$3449", 
												onMouseClicked = [[UI_SetElementVisible( "", "btnWhisperToList", 0 ); UI_SetElementVisible( "", "btnToAll", 1 );]], }, 
}, 
										{ 
												type = "TextLabel", 
												visible = 0, 
												position = 
														{ 1, 183, }, 
												size = 
														{ 8, 13, }, 
												Text = 
												{ 
														font = "ChatFont", 
														color = 
																{ 255, 255, 255, 255, }, 
														hAlign = "Left", 
														text = "$2848", }, 
												giveParentMouseInput = 1, 
										}, 
{ 
    type = "DestinationTextInput", 
    textInputStyle = "FEChatTextInputStyle", 
    borderWidth = 2, 
    borderColor = "FEColorOutline", 
    position = 
        { -4, 196 }, 
    size = 
        { 181, 19, }, 
    name = "txtInputChat", 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3335", 
    maxTextLength = 100, 
    marginWidth = 5, 
    Text = 
    { 
        font = "ChatFont", }, 
    onAccept = "UI_GiveFocus('txtInputChat', 'GameSetup')", }, 
},
}, 

---bottom frame

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
    name = "txtLblHELPTEXT", 
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
    name = "txtBtnBACK", 
    Text = 
    { 
        text = "$3362", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3336", 
    onMouseClicked =
					[[
						UI_HideScreen("GameSetup_HelpTip");
					]],
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle2", 
    position = 
        { 648, 23, }, 
    name = "txtBtnSTARTGAME", 
    Text = 
    { 
        text = "$3363", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3337", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 126, 23, }, 
    name = "txtBtnLOADGAME", 
    Text = 
    { 
        text = "$3338", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3339", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 248, 23, }, 
    visible = 0, 
    name = "txtBtnLOADRECORDEDGAME", 
    Text = 
    { 
        text = "$3366", 
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3367", 
}, 
{ 
    type = "TextButton", 
    buttonStyle = "FEButtonStyle1", 
    position = 
        { 526, 23, }, 
    visible = 0, 
    name = "txtBtnOPTIONPRESETS", 
    Text = 
    { 
        text = "$3459", 		--$5131
        textStyle = "FEButtonTextStyle", }, 
    helpTipTextLabel = "txtLblHELPTEXT", 
    helpTip = "$3469", }, 
}, 
}, 
}, 
}
