WIDTH = 300--304
HEIGHT = 133--164

ConnectionType = {
	size = {0,0,800,600},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1, 
	
	RootElementSettings = {
		
	},

	-- the message that will be displayed in a player joins and their name is already in use.
	nameInUseFormatID = 3549,
	
	ErrorMessages = 
	{
		[ LM_AuthCD ] 			= "$3542",--"Authenticating",
		[ LM_UnableToConnect ] 	= "$3543",--"Unable to connect to server",
		[ LM_InvalidNickname ] 	= "$3544",--"You need to set a proper chat name",
		[ LM_Connecting ] 		= "$3545",--"Connecting to Server",
		[ LM_AuthCDFailed ] 		= "$3546",--"Authentication failed",
		[ LM_Disconnected ] 		= "$3547",--"Disconnected from server", 				
		[ LM_InvalidCDKey ] 		= "$3548",--"Your Key is invalid",
	}, 
	
	previousScreen = "NewMainMenu",
	;
	
	-- ERSB Warning label
	{
		type = "TextLabel",
		position = {4, 580},
		size = {800,20},
		Text = {
			font = "ChatFont",
			color = {255,255,255,255},
			text = "$1220",
			hAlign = "Left",
			vAlign = "Middle",
		},
	},
	
{ -- root frame
	type = "Frame",
	position = {400 - (WIDTH / 2), 300 - (HEIGHT/2)},
	size = {WIDTH, HEIGHT},
	backgroundColor = "FEColorBackground1",
	;
		
	-- Title
	{
		type = "TextLabel",
		position = {10,2},
		size = {280, 13},
		Text = {
			textStyle = "FEHeading3",
			text = "$3530",
		},
	},
	
	-- Subtitle
	{
		type = "TextLabel",
		position = {10,17},
		size = {280, 10},
		Text = {
			textStyle = "FEHeading4",
			text = "$3531",
		},
	},
	
	
	-- Contents frame
	{
		type = "Frame",
		outerBorderWidth = 2,
		position = {4, 32},
		size = {WIDTH - 8, HEIGHT - 36},
		borderColor = "FEColorOutline",
		;
		
		{
			type = "Frame",
			autosize = 1,
			autoarrange = 1,
			autoarrangeSpace = 2,
			;
			-- Buttons:
			
			-- LAN (Local Area Network)
			{
				type = "TextButton",
				name = "m_itemLAN",
				width = WIDTH-12,
				buttonStyle = "FEButtonStyle1",
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$3532",
				Text = {
					text = "$3533",
					textStyle = "FEButtonTextStyle",
				},
			},
			
			-- INTERNET (Direct TCP/IP)
			{
				type = "TextButton",
				name = "m_itemTCP",
				width = WIDTH-12,
				buttonStyle = "FEButtonStyle1",
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$3534",
				Text = {
					text = "$3535",
					textStyle = "FEButtonTextStyle",
				},
				onMouseClicked = "UI_ShowScreen('DirectConnection', eTransition)",
			},
			
			-- NNP
			{
				type = "TextButton",
				name = "m_itemNNP",
				width = WIDTH-12,
				buttonStyle = "FEButtonStyle1",
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$3536",
				enabled = 0,
				Text = {
					text = "$3537",
					textStyle = "FEButtonTextStyle",
				}, 
				onMouseClicked = "UI_ShowScreen('PatchScreen', eTransition)",
			},
			
			--Warning
			{
				type = "TextLabel",
				position = {0, 122},
				size = {280,10},
				Text = {
					textStyle = "IGHeading2",
					color = {255,255,255,255},
					text = "<c=CC2F2F>Online Mode may contain bugs and desyncs!</c>", 	--Display a warning
					hAlign = "Center",
					vAlign = "Middle",
				},
			},
			
			
		},
		
		----------------------------------------------------------------		
		{
			type = "Line",
			p1 = { 0, HEIGHT - 72 },
			p2 = { WIDTH-6,  HEIGHT - 72 },
			lineWidth = 2,
			color = "FEColorOutline",
			above = 1,
		},
		
		-- Help text
		{
			type = "TextLabel",
			position = {4,HEIGHT-70}, -- 145
			size = {WIDTH-6,13},
			name = "m_lblHelpText",			
			Text = {				
				textStyle = "FEHelpTipTextStyle",
			},
			;
		},
		
		
		----------------------------------------------------------------
		{
			type = "Line",
			p1 = { 0, HEIGHT - 53 }, -- 125
			p2 = { WIDTH - 6, HEIGHT - 53 },
			lineWidth = 2,
			color = "FEColorOutline",
			above = 1,
		},			
		
		-- Back button
		{
			type = "TextButton",
			position = {2, HEIGHT - 51},
			width = WIDTH-12,
			buttonStyle = "FEButtonStyle1",
			name = "m_btnCancel",
			helpTipTextLabel = "m_lblHelpText", 
			helpTip = "$3043", -- RETURN TO THE MAIN MENU
			Text = {
				textStyle = "FEButtonTextStyle",
				text = "$3539",
			},
			
			onMouseClicked = "UI_PreviousScreen(eTransition);",
		},
	},
},-- end root frame

} 