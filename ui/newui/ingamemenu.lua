-- TODO: Localize me

-- UI Layout for the F10 menu
--
-- If you need to add or remove buttons from the F10 menu, do so at the bottom of this file by adding
--  button definitions to the specific game type frames.

FRM_SPACER = {
	type = "Frame",
	size = {240,13},
}
BTN_SAVEGAME = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	name = "m_btnSave",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5564", -- "SAVE GAME",
	},
	
	helpTip = "$5550", -- "SAVE THE PROGRESS OF YOUR GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_SaveGameScreen()",
}
BTN_LOADGAME = {
	type = "TextButton",
	name = "m_btnLoad",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5565", -- "LOAD GAME",
	},
	
	helpTip = "$5551", -- "LOAD A SAVED GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_LoadGameScreen()",
}
BTN_SAVEGAME_CAMPAIGN = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	name = "m_btnSaveCampaign",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5566", -- "SAVE CAMPAIGN",
	},
	
	helpTip = "$5552", -- "SAVE THE PROGRESS OF YOUR CAMPAIGN",
	helpTipTextLabel = "m_lblHelpText",
	onMouseClicked = "FE_SaveGameScreen_Campaign()",
}
BTN_LOADGAME_CAMPAIGN = {
	type = "TextButton",
	name = "m_btnLoadCampaign",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5567", -- "LOAD CAMPAIGN",
	},
	
	helpTip = "$5553", -- "LOAD A SAVED CAMPAIGN GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_LoadGameScreen_Campaign()",
}
BTN_LOADGAME_RECORDED = {
	type = "TextButton",
	name = "m_btnLoadRecorded",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5568", -- "LOAD RECORDED GAME",
	},
	
	helpTip = "$5554", -- "LOAD A SAVED RECORDED GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_LoadGameScreen_Recorded()",
}
--BTN_GALLERY = {
--	type = "TextButton",
--	buttonStyle = "FEButtonStyle1",
--	width = 240,
--	Text = {
--		textStyle = "FEButtonTextStyle",
--		text = "GALLERY", -- "GALLERY",
--	},
--	
--	helpTip = "GALLERY", -- "GALLERY",
--	helpTipTextLabel = "m_lblHelpText",
--	
--	--onMouseClicked = [[UI_ShowScreen("GalleryHiigaran", eTransition)]],
--	onMouseClicked = "UI_SetScreenEnabled(\"InGameGalleryHiigaran\", 1); UI_ShowScreen(\"InGameGalleryHiigaran\", ePopup);",
--}
BTN_OPTIONS = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5569", -- "OPTIONS",
	},
	
	helpTip = "$5555", -- "CHANGE GAME OPTIONS",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "UI_SetScreenEnabled(\"InGameOptions\", 1); UI_ShowScreen(\"InGameOptions\", ePopup);",
}
BTN_EXITTOWINDOWS = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5570", -- "EXIT TO OS",
	},
	
	helpTip = "$5556", -- "END GAME AND EXIT TO OS",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "MainUI_UserEvent( eExit )",
}
BTN_EXITTOMAINMENU = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5571", -- "EXIT TO MAIN MENU",
	},
	
	helpTip = "$5557", -- "RETURN TO MAIN MENU",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_ExitToMainMenu();",
}
BTN_ENDCURRENTGAME = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5579", -- "END CURRENT GAME",
	},
	
	helpTip = "$5559", -- "END CURRENT GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_ExitToMainMenu();",
}
BTN_SKIRMISH_STATS = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5579", -- "END CURRENT GAME",
	},
	
	helpTip = "$5559", -- "END CURRENT GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_Retire(\"MainUI_UserEvent(eMenu)\")", 
}
BTN_RETIRE = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5572", -- "RETIRE",
	},
	
	helpTip = "$5558", -- "RETIRE YOUR FLEET",
	helpTipTextLabel = "m_lblHelpText",
	
	-- InGameMenu will be deactivated on confirmation accept
	onMouseClicked = "FE_Retire(\"MainUI_UserEvent(eMenu)\")", 
}
BTN_RETURNTOGAME = {
	type = "TextButton",
	buttonStyle = "FEButtonStyle2",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5573", -- "RETURN TO GAME",
	},
	
	helpTip = "$5559", -- "CLOSE THIS MENU AND RETURN TO GAME",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "MainUI_UserEvent(eMenu);",
}
BTN_NEXTTUTORIAL = {
	type = "TextButton",
	name = "m_btnNextTutorial",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5574", -- "NEXT TUTORIAL",
	},
	
	helpTip = "$5560", -- "PLAY THE NEXT TUTORIAL MISSION",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_NextTutorial()",
} 
BTN_RESTARTTUTORIAL = {
	type = "TextButton",
	name = "m_btnRestartTutorial",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5575", -- "RESTART TUTORIAL",
	},
	
	helpTip = "$5561", -- "RESTART THE CURRENT TUTORIAL MISSION",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_RestartGame(1)",
} 
BTN_RESTARTMISSION = {
	type = "TextButton",
	name = "m_btnRestartMission",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5576", -- "RESTART",
	},
	
	helpTip = "$5562", -- "RESTART THE CURRENT MISSION",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_RestartGame(1)", -- show are you sure message
}

BTN_RESTARTMISSION2 = {-- this button is for the mission failed menu
	type = "TextButton",
	name = "m_btnRestartMission2",
	buttonStyle = "FEButtonStyle2",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5576",
	},
	
	helpTip = "$5562",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_RestartGame(0)", -- do not show are you sure message
}

BTN_RESTART = {
	type = "TextButton",
	name = "m_btnRestart",
	buttonStyle = "FEButtonStyle1",
	width = 240,
	Text = {
		textStyle = "FEButtonTextStyle",
		text = "$5576", -- "RESTART",
	},
	
	helpTip = "$5563", -- "RESTART THE CURRENT LEVEL",
	helpTipTextLabel = "m_lblHelpText",
	
	onMouseClicked = "FE_RestartGame(1)",
}


InGameMenu = {
	size = { 0, 0, 800, 600},		-- make screen full size so other menus don't get input
	stylesheet = "HW2StyleSheet",

	RootElementSettings = {
		backgroundColor = "FEColorBackground2",
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords	
	
	--
	soundOnShow = "SFX_GameMenuONOFF",
	soundOnHide = "SFX_GameMenuONOFF",
	
	;
	
	{
		type = "Frame",
		position = { 274, 179},
		backgroundColor = "FEColorDialog",
		autosize = 1,
		;
		
		-- gradient header frame w/border
		{
			type = "Frame",
			outerBorderWidth = 2,
			position = {4, 4},
			size = {244, 28},
			borderColor = "FEColorPopupOutline",
			style = "FEPopupBackgroundStyle",
		},
		
		-- Panel Title
		{
			type = "TextLabel",
			position = {0,2},
			size = {200, 18},
			
			Text = {
				textStyle = "FEHeading3",
				text = "$5577", -- "GAME MENU",
				offset = {8,0},
				vAlign = "Top",
			},
		},
		
		-- Panel Subtitle
		{
			position = {0, 17},
			type = "TextLabel",
			name = "m_lblSubTitle",			
			size = {200, 10},
			Text = {
				textStyle = "FEHeading4",
				text = "$5578", -- "SELECT//",
				offset = {8,0},
			},
		},
		
		{
			type = "Frame",
			name = "frmButtonGroup",
			position = {0, 30},
			autosize = 1,
			autoarrange = 1,
			autoarrangeSpace = 4,
			;
			-- FRAMES ARE PUT HERE DEPENDING ON GAME TYPE
			
			--{
			--	type = "Frame",
			--	outerBorderWidth = 2,
			--	borderColor = "FEColorPopupOutline",
			--	autosize  = 1,
			--	autoarrange = 1,
			--	autoarrangeSpace = 2,
			--	;
				
			--	{
			--		type = "TextButton",
			--		buttonStyle = "FEButtonStyle1",
			--		name = "m_btnSave",
			--		width = 240,
			--		Text = {
			--			textStyle = "FEButtonTextStyle",
			--			text = "SAVE GAME",
			--		},
			--		
			--		helpTip = "SAVE THE PROGRESS OF YOUR GAME",
			--		helpTipTextLabel = "m_lblHelpText",
			--	},
		},
	},
	

---------------------------------------------------------------------------------------------
-- PLAYER VS CPU MENU BUTTONS
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_PlayerVsCpu",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		BTN_SAVEGAME ,
		BTN_LOADGAME,
		BTN_OPTIONS,
		--BTN_GALLERY,
		BTN_EXITTOWINDOWS,
		BTN_EXITTOMAINMENU,
		BTN_SKIRMISH_STATS,
		BTN_RESTART,
		FRM_SPACER,
		BTN_RETURNTOGAME,
	},
	
---------------------------------------------------------------------------------------------
-- PLAYER VS CPU MENU BUTTONS (FAILED)
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_PlayerVsCpuFailed",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		BTN_SAVEGAME ,		--only for testing the mod, watch out!!!
		BTN_LOADGAME,
		BTN_OPTIONS,
		--BTN_GALLERY,
		BTN_SKIRMISH_STATS,
		BTN_EXITTOWINDOWS,
		BTN_RESTART,
		FRM_SPACER,
		BTN_RETURNTOGAME,
	},
	
---------------------------------------------------------------------------------------------
-- CAMPAIGN MENU BUTTONS
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_Campaign",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		BTN_RESTARTMISSION,
		BTN_SAVEGAME_CAMPAIGN ,
		BTN_LOADGAME_CAMPAIGN,
		BTN_OPTIONS,
		BTN_EXITTOMAINMENU,
		BTN_EXITTOWINDOWS,
		--BTN_RETIRE, -- retire button is pointless for campaign game, you can just use exit
		
		FRM_SPACER,
		
		BTN_RETURNTOGAME,
	},
	
---------------------------------------------------------------------------------------------
-- CAMPAIGN MISSION FAILED BUTTONS (SHOWN AT END OF CAMPAIGN MISSION IF THE MISSION IS LOST)
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_CampaignFailed",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
				
		--BTN_SAVEGAME_CAMPAIGN ,
		BTN_LOADGAME_CAMPAIGN,
		--BTN_OPTIONS,
		BTN_EXITTOMAINMENU,
		BTN_EXITTOWINDOWS,
		
		FRM_SPACER,
		
		BTN_RESTARTMISSION2,
	},
	
---------------------------------------------------------------------------------------------
-- MULTIPLAYER MENU BUTTONS
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_Multiplayer",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		BTN_OPTIONS,
		--BTN_GALLERY,
		--BTN_EXITTOMAINMENU,
		BTN_RETIRE,
		BTN_EXITTOWINDOWS,
		
		FRM_SPACER,
		
		BTN_RETURNTOGAME,
	},
	
---------------------------------------------------------------------------------------------
-- MULTIPLAYER MENU BUTTONS (FAILED) used when a player dies and chooses to keep watching
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_MultiplayerFailed",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		BTN_OPTIONS,
		--BTN_GALLERY,
		BTN_ENDCURRENTGAME,
		BTN_EXITTOWINDOWS,
		
		FRM_SPACER,
		
		BTN_RETURNTOGAME,
	},
	
---------------------------------------------------------------------------------------------
-- TUTORIAL MENU BUTTONS
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_Tutorial",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		BTN_NEXTTUTORIAL,
		BTN_RESTARTTUTORIAL,
		BTN_OPTIONS,
		BTN_EXITTOMAINMENU,
		BTN_EXITTOWINDOWS,
		
		FRM_SPACER,
		
		BTN_RETURNTOGAME,
	},
	
---------------------------------------------------------------------------------------------
-- RECORDED GAME MENU BUTTONS
---------------------------------------------------------------------------------------------
	{
		type = "Frame",
		outerBorderWidth = 2,
		name = "frmButtons_RecordedGame",
		borderColor = "FEColorPopupOutline",
		autosize  = 1,
		autoarrange = 1,
		autoarrangeSpace = 2,
		visible = 0,
		;
		
		--BTN_LOADGAME_RECORDED,
		BTN_OPTIONS,
		--BTN_GALLERY,
		BTN_EXITTOWINDOWS,
		BTN_EXITTOMAINMENU,
		
		FRM_SPACER,
		
		BTN_RETURNTOGAME,
	},
	
	
}
