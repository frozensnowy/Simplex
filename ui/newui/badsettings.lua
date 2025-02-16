DIALOGWIDTH = 254

BadSettings = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	RootElementSettings = {
		backgroundColor = "FEColorBackground2",
		--onMousePressed = "UI_GiveFocus('m_frmDialogRoot', 'YesNoDialog')",
	},
	
	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1);",
	onHide = "MainUI_PopEnabledCommandState()",
	
	
	-- justification positions for the yes and no buttons
	jRight = DIALOGWIDTH - 6 - 122,
	jCenter = ((DIALOGWIDTH - 6) / 2) - 60,
	jLeft = 2,
	;
		
	{
		type = "Frame",
		name = "m_frmDialogRoot",
		size = {DIALOGWIDTH, 100},
		backgroundColor = "FEColorDialog",
		autosize = 1,
		marginHeight = 1,
		position = {400 - (DIALOGWIDTH/2), 249},
		giveParentMouseInput = 1,
		;
		
		-- background gradient frame
		{
			type = "Frame",
			style = "FEPopupBackgroundStyle",
			position = {2,2},
			size = {DIALOGWIDTH-4, 96},
			giveParentMouseInput = 1,
		},
		-- header lines
		{
			type = "Frame",
			position = {2, 2},
			size = {DIALOGWIDTH-4, 31},
			giveParentMouseInput = 1,
			--visible = 0,
			;
			{
				type = "Frame",
				outerBorderWidth = 2,
				position = {2,2},
				borderColor = "FEColorPopupOutline",
				size = {DIALOGWIDTH-8, 38}, -- clip the bottom line off
				giveParentMouseInput = 1,
			},	
		},
		
		{
			type = "Frame",
			position = {1,0},
			autosize = 1,
			autoarrange = 1,
			autoarrangeWidth = DIALOGWIDTH-2,	
			autoarrangeSpace = 2,
			giveParentMouseInput = 1,
			;
		
			-- Title / Subtitle frame
			{
				type = "Frame",
				size = {DIALOGWIDTH-5, 29},
				giveParentMouseInput = 1,
				;
				
				-- Title
				{
					type = "TextLabel",
					name = "m_lblTitle",
					position = {4,0},
					size = {DIALOGWIDTH-10, 13},
					Text = {
						textStyle = "FEHeading3",
						text = "ERROR", --ARE YOU SURE?
					},
					giveParentMouseInput = 1,
				},
				
				-- Subtitle
				{
					type = "TextLabel",
					name = "m_lblSubTitle",
					position = {4,15},
					size = {DIALOGWIDTH-10, 10},
					Text = {
						textStyle = "FEHeading4",
						text = "INCORRECT GAME SETTINGS",	--MESSAGE//		
					},
					giveParentMouseInput = 1,
				},
			},
			
			
			
			-- Contents frame (border)
			{
				type = "Frame",
				name = "m_frmBorderRoot",
				outerBorderWidth = 1,
				position = {3,30},
				autosize = 1,
				borderColor = "FEColorPopupOutline",
				autoarrange = 1,
				giveParentMouseInput = 1,
				;
				
				-- Message frame
				{
					type = "Frame",
					name = "m_frmMessageLabel",
					borderWidth = 1,
					borderColor  = "FEColorPopupOutline",
					autosize = 1,
					autoarrange = 1,
					giveParentMouseInput = 1,
					;
					
					-- Message Label
					{
						type = "TextLabel",
						name = "m_lblMessage",
						width = DIALOGWIDTH - 6,
						autosize = 1,
						wrapping = 1,
						marginHeight = 4,
						marginWidth = 4,
						minSize = {0,50},
						name = "m_lblErrorMessage",
						Text = {
							textStyle = "FEHelpTipTextStyle",
							vAlign = "Top",
							text = "Players 5 and 6 must be CPU players and there must be an enemy.",
						},
						giveParentMouseInput = 1,
						;
					},
					
					-- 
					--{
					--	type = "Frame",
					--	name = "m_frmDontShowAgain",
					--	size = {DIALOGWIDTH - 6, 19},
					--	;
					--	-- Do not show again check box
					--	{
					--		type = "Button",
					--		name = "m_chkDontShowAgain",
					--		buttonStyle = "FECheckBoxButtonStyle",
					--		position = {3,3},
					--	},
					--	{
					--		type = "TextLabel",
					--		position = {20,4},
					--		size = {DIALOGWIDTH - 30, 13},
					--		Text = {
					--			textStyle = "FEHeading4",
					--			text = "$3612",--DO NOT SHOW THIS MESSAGE AGAIN
					--			vAlign = "Middle",
					--		},
					--	},
					--},
				},
				
				-- Button tray frame
				{
					type = "Frame",
					name = "m_frmButtons",
					size = {DIALOGWIDTH - 6, 19},					
					borderWidth = 1,
					borderColor = "FEColorPopupOutline",
					giveParentMouseInput = 1,
					;
					
					-- Yes button
					{
						visible = 1,
						type = "TextButton",
						position = {3, 3},  
						width = DIALOGWIDTH - 12,
						buttonStyle = "FEButtonStyle2",
						name = "m_btnAccept",
						Text = {
							textStyle = "FEButtonTextStyle",
							text = "EXIT TO MAIN MENU",--YES
						},
						--onMouseClicked = [[UI_DialogAccept();]],
						onMouseClicked = "FE_ExitToMainMenu();",
						giveParentMouseInput = 1,
					},
				
					-- No button
					{
						type = "TextButton",
						position = {DIALOGWIDTH - 6 - 123, 3}, 
						name = "m_btnCancel",
						buttonStyle = "FEButtonStyle1",
						Text = {
							textStyle = "FEButtonTextStyle",
							text = "$5171",--NO
						},				
						onMouseClicked = [[UI_DialogCancel();]],
						giveParentMouseInput = 1,
						visible = 0,
					},
				},
			},
		
		},
	},
}

	