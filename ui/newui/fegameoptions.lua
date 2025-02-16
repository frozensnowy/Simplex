-- load key bindings frame
dofilepath("data:ui/newui/controlstab.lua")

FEGameOptions = {
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,

	RootElementSettings = {
		backgroundColor = {0,0,0,0}, --"FEColorBackground1",
	},

	previousScreen = "NewMainMenu",

	CustomFX = {
		{
			name = "fxShadows",
			title = "$2550",--SHADOWS
			helpText = "$2551",--TOGGLE SHIP SHADOWS
			enabled = 1,
			Choices = {
				{
					text = "$5100",
				},
				{
					text = "$5101",
				},
			},
		},

		{
			name = "fxDamageFX",
			title = "$2552",--DAMAGE FX
			helpText = "$2553",--TOGGLE DAMAGE EFFECT FOR SHIPS
			enabled = 1,
			Choices = {
				{
					text = "$5102",
				},
				{
					text = "$5103",
				},
			},
		},

		{
			name = "fxHyperspaceQuality",
			title = "$2554",--HYPERSPACE QUALITY
			helpText = "$2555",--SET THE QUALITY OF THE HYPERSPACE EFFECTS
			enabled = 1,
			Choices = {
				{
					text = "$5102",
				},
				{
					text = "$5103",
				},
			},
		},

		{
			name = "fxLightLOD",
			title = "$2556",--LIGHT LOD
			helpText = "$2557",--SELECT THE LIGHTING LEVEL OF DETAIL
			enabled = 1,
			Choices = {
				{
					text = "$5590",
				},
				{
					text = "$5591",
				},
				{
					text = "$5592",
				},
				{
					text = "$5593",
				},
			},
		},

		{
			name = "fxGoblins",
			title = "$2558",--DETAIL GEOMETRY
			helpText = "$2559",--ENABLE OR DISABLE DISPLAY OF DETAIL GEOMETRY
			enabled = 1,
			Choices = {
				{
					text = "$5100",
				},
				{
					text = "$5101",
				},
			},
		},

		{
			name = "fxAutoLOD",
			title = "$2560",--GEOMETRY SCALING
			helpText = "$2561",--TURN ON OR OFF DYNAMIC REDUCTION OF GEOMETRY
			enabled = 1,
			Choices = {
				{
					text = "$5100",
				},
				{
					text = "$5101",
				},
			},
		},
	},

	;

	-- SCREEN TITLE
	{
		type = "TextLabel",
		position = {16,-2},
		size = {700,36},
		Text = {
			text = "$5106", -- GAME OPTIONS
			textStyle = "FEHeading1",
		},
		;
	},

	-- SCREEN SUBTITLE
	{
		type = "TextLabel",
		position = {17,34},
		size = {700,21},
		Text = {
			text = "$5107", -- HOST GAME / JOIN GAME
			textStyle = "FEHeading2",
		},
		;
	},

	-- MAIN FRAME
	{
		type = "Frame",
		size = {620, 300},
		position = {90, 150},
		backgroundColor = "FEColorBackground1",
		;

		-- Panel Title
		{
			type = "TextLabel",
			position = {10,2},
			size = {220, 13},
			Text = {
				textStyle = "FEHeading3",
				text = "$5108",
			},
		},

		-- Panel Subtitle
		{
			type = "TextLabel",
			name = "m_lblSubTitle",
			position = {10,17},
			size = {220, 10},
			Text = {
				textStyle = "FEHeading4",
				text = "$5173",
			},
		},

		-- Tab buttons
		{
			type = "Frame",
			position = {242,15},
			autoarrange = 1,
			autoarrangeWidth = 470,
			autoarrangeSpace = 2,
			size = {460, 17},
			;

			{
				type = "RadioButton",
				name = "m_btnControls",
				buttonStyle = "FETabButtonStyle",
				Text = {
					text = "$5109",
					textStyle = "FEButtonTextStyle",
				},

				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5239", -- "CHANGE KEYBOARD AND CONTROL SETTINGS",
			},

                        {
				type = "RadioButton",
				name = "m_btnGameplay",
				buttonStyle = "FETabButtonStyle",
				Text = {
					text = "$5113",
					textStyle = "FEButtonTextStyle",
				},

				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5240", -- "CHANGE GAMEPLAY AND CAMERA SETTINGS",

				enabled = 1,
			},

			{
				type = "RadioButton",
				name = "m_btnVideo",
				buttonStyle = "FETabButtonStyle",
				Text = {
					text = "$5111",
					textStyle = "FEButtonTextStyle",
				},

				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5241", -- "CHANGE VIDEO SETTINGS",

				enabled = 1,
			},

			{
				type = "RadioButton",
				name = "m_btnAudio",
				buttonStyle = "FETabButtonStyle",
				Text = {
					text = "$5110",
					textStyle = "FEButtonTextStyle",
				},

				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5242", -- "CHANGE AUDIO SETTINGS",

				enabled = 1,
			},

		},

		-- Contents frame
		{
			type = "Frame",
			outerBorderWidth = 2,
			position = {4, 32},
			size = {612, 264},
			borderColor = "FEColorOutline",
			;


			-- TAB FRAMES
			{
				type = "Frame",
				position = {0,0},
				backgroundColor = {0,0,0,0},
				size = {612, 264},
				;

				-- GAMEPLAY TAB FRAME
				{
					type = "Frame",
					name = "m_tabGameplay",
					size = {612, 264},
					visible = 0,
					;

					{
						type = "Frame",
						position = {4,17},
						size = {608, 244},
						autoarrange = 1,
						autoarrangeSpace = 2,
						autoarrangeWidth = 612,
						;

						-- OPTION FRAMES

						-- ORDER FEEDBACK SLIDER
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5114",
								},
							},

							{
								type = "TextLabel",
								name = "lblOrderFeedback",
								position = {228+42, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5243", -- "AMOUNT OF TIME ORDER FEEBACK REMAINS ON SCREEN",
							},

							{
								type = "ScrollBar",
								name = "m_sbarOrderFeedback",
								sliderTextLabel = "lblOrderFeedback",
								position = {270+42, 2},
								width = 330-42,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5244", -- "ADJUST THE ORDER FEEDBACK DELAY",
							},
						},

						-- SPACER
						{
							type = "Frame",
							size = {608, 13},
						},

						-- MOUSE SENSITIVITY
						{
							type = "Frame",
							size = {608, 17},
							visible = 0, -- TODO
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5115",
								},
							},

							{
								type = "TextLabel",
								name = "lblSensitivity",
								position = {228, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5245", -- "DETERMINES THE SENSITIVITY OF THE MOUSE POSITION",
							},

							{
								type = "ScrollBar",
								enabled = 0,
								name = "m_sbarMouseSensitivity",
								sliderTextLabel = "lblSensitivity",
								position = {270, 2},
								width = 330,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5246", -- "ADJUST THE SENSITIVITY OF THE MOUSE POSITION",
							},
						},

						-- SPACER
						{
							type = "Frame",
							size = {608, 13},
						},

						-- ENABLE MOUSE PAN CHECKBOX
						{
							type = "Frame",
							size = {608, 18},
							;

							{
								type = "TextLabel",
								size = {206,15},
								position = {20,0},
								Text = {
									textStyle = "FEHeading4",
									text = "$5116",
								},
							},

							{
								type = "Button",
								name = "m_chkScreenPan",
								buttonStyle = "FECheckBoxButtonStyle",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5247", -- "TOGGLE EDGE OF SCREEN PANNING",
							},
						},

						-- ENABLE NLIPS CHECKBOX
						{
							type = "Frame",
							size = {608, 18},
							--visible = 0,
							;

							{
								type = "TextLabel",
								size = {250,15},
								position = {20,0},
								Text = {
									textStyle = "FEHeading4",
									text = "$5146",
								},
							},

							{
								type = "Button",
								name = "m_chkNLIPS",
								enabled = 1,
								buttonStyle = "FECheckBoxButtonStyle",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5248", -- "TOGGLE NLIPS",
							},
						},
						-- MILITARY SELECTION PROIRITY
						{
							type = "Frame",
							size = {608, 18},
							;

							{
								type = "TextLabel",
								size = {206,15},
								position = {20,0},
								Text = {
									textStyle = "FEHeading4",
									text = "$5148",--MILITARY SELECTION PRIORITY
								},
							},

							{
								type = "Button",
								name = "m_chkMilitarySel",
								enabled = 1,
								buttonStyle = "FECheckBoxButtonStyle",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5093", --
							},
						},
						-- TOGGLE RIGHT CLICK MENU
						{
							type = "Frame",
							size = {608, 18},
							;

							{
								type = "TextLabel",
								size = {206,15},
								position = {20,0},
								Text = {
									textStyle = "FEHeading4",
									text = "$5092", -- ENABLE RIGHT CLICK MENU
								},
							},

							{
								type = "Button",
								name = "m_chkRightClickMenu",
								enabled = 1,
								buttonStyle = "FECheckBoxButtonStyle",
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5091", -- ENABLE / DISABLE THE SHIFT RIGHT CLICK MENU
							},
						},
					},
				},

				-- AUDIO TAB FRAME
				{
					type = "Frame",
					name = "m_tabAudio",
					size = {608, 264},
					visible = 0,
					;

					{
						type = "Frame",
						position = {4,17},
						size = {608, 244},
						autoarrange = 1,
						autoarrangeSpace = 2,
						autoarrangeWidth = 490,
						;

						-- OPTION FRAMES

						-- SFX VOLUME SLIDER
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5117",
								},
							},

							{
								type = "TextLabel",
								name = "lblSFXVolume",
								position = {228+42, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5249", -- "SOUND EFFECTS VOLUME",
							},

							{
								type = "ScrollBar",
								name = "m_sbarSFXVolume",
								sliderTextLabel = "lblSFXVolume",
								position = {270+42, 2},
								width = 330-42,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5250", -- "ADJUST THE VOLUME OF THE SOUND EFFECTS",
							},
						},

						-- SPEECH VOLUME SLIDER
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5118",
								},
							},

							{
								type = "TextLabel",
								name = "lblSpeechVolume",
								position = {228+42, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5251", -- "FLEET COMMAND SPEECH VOLUME",
							},

							{
								type = "ScrollBar",
								name = "m_sbarSpeechVolume",
								sliderTextLabel = "lblSpeechVolume",
								position = {270+42, 2},
								width = 330-42,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5252", -- "ADJUST THE VOLUME OF THE FLEET COMMAND SPEECH",
							},
						},

						-- MUSIC VOLUME SLIDER
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5119",
								},
							},

							{
								type = "TextLabel",
								name = "lblMusicVolume",
								position = {228+42, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5253", -- "BACKGROUND MUSIC VOLUME",
							},

							{
								type = "ScrollBar",
								name = "m_sbarMusicVolume",
								sliderTextLabel = "lblMusicVolume",
								position = {270+42, 2},
								width = 330-42,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5254", -- "ADJUST THE VOLUME OF THE BACKGROUND MUSIC",
							},
						},

						-- UI VOLUME SLIDER
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5589",
								},
							},

							{
								type = "TextLabel",
								name = "lblUIVolume",
								position = {228+42, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5255", -- "UI SOUND VOLUME",
							},

							{
								type = "ScrollBar",
								name = "m_sbarUIVolume",
								sliderTextLabel = "lblUIVolume",
								position = {270+42, 2},
								width = 330-42,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5256", -- "ADJUST THE VOLUME OF THE UI SOUND",
							},
						},

						-- SPACER
						{
							type = "Frame",
							size = {608, 13},
						},

						-- NUM SFX CHANNELS
						{
							type = "Frame",
							size = {608, 17},
							visible = 0, -- TODO
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5120",
								},
							},

							{
								type = "TextLabel",
								name = "lblSFXChannels",
								position = {228, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5257", -- "NUMBER OF SOUND EFFECTS CHANNELS",
							},

							{
								type = "ScrollBar",
								name = "m_sbarSfxChannels",
								enabled = 0,
								sliderTextLabel = "lblSFXChannels",
								position = {270, 2},
								width = 330,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5258", -- "ADJUST THE NUMBER OF CHANNELS TO USE FOR SOUND EFFECTS",
							},
						},

						-- SPACER
						{
							type = "Frame",
							size = {608, 13},
						},

						-- BATTLE CHATTER FREQUENCY
						{
							type = "Frame",
							size = {608, 17},
							visible = 1,
							;

							{
								type = "TextLabel",
								size = {206,13},
								Text = {
									textStyle = "FEHeading4",
									text = "$5121", -- BATTLE CHATTER FREQ.
								},
							},

							{
								type = "DropDownListBox",
								name = "m_comboBattleChatter",
								position = {270, 0},
								enabled = 1,
								size = {330, 13},
								dropDownListBoxStyle = "FEDropDownListBoxStyle",
								selected = 1,
								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5090", --

								ListBox = {
									type = "ListBox",
									width = 330,
									listBoxStyle = "FEListBoxStyle",
									backgroundColor = {0,0,0,255},
									;

									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5094",
											textStyle = "FEListBoxItemTextStyle",
										},

										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5259", -- "LOWEST",

										customData = 25, -- 25/100
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5095",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5260", -- "STANDARD",

										customData = 70, -- 70/100
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5096",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5261", -- "HIGHEST",

										customData = 100, --100/100
									},
								},
							},
						},

						-- FLEET SPEECH PITCH
						{
							type = "Frame",
							size = {608, 17},
							visible = 0, -- TODO
							;

							{
								type = "TextLabel",
								size = {206,13},
								Text = {
									textStyle = "FEHeading4",
									text = "$5123",
								},
							},

							{
								type = "Frame",
								position = {270, 0},
								size = {330, 13},
								;

								-- Radio Buttons
								{
									type = "RadioButton",
									name = "m_radioVoice1",
									buttonStyle = "FERadioButtonStyle",
									position = {0,0},
									enabled = 1,

									helpTip = "$5262", -- "SELECT VOICE FOR YOU FLEET VOICE OVER EFFECTS",
									helpTipTextLabl = "m_lblHelpText",
								},
								{
									type = "RadioButton",
									name = "m_radioVoice2",
									buttonStyle = "FERadioButtonStyle",
									position = {110,0},
									enabled = 1,

									helpTip = "$5262", -- "SELECT VOICE FOR YOU FLEET VOICE OVER EFFECTS",
									helpTipTextLabl = "m_lblHelpText",
								},
								{
									type = "RadioButton",
									name = "m_radioVoice3",
									buttonStyle = "FERadioButtonStyle",
									position = {220,0},
									enabled = 1,

									helpTip = "$5262", -- "SELECT VOICE FOR YOU FLEET VOICE OVER EFFECTS",
									helpTipTextLabl = "m_lblHelpText",
								},

								-- Text labels
								{
									type = "TextLabel",
									position = {20,0},
									size = {90, 13},
									Text = {
										text = "$5124",
										textStyle = "FEHeading4",
									}
								},
								{
									type = "TextLabel",
									position = {130,0},
									size = {90, 13},
									Text = {
										text = "$5125",
										textStyle = "FEHeading4",
									}
								},
								{
									type = "TextLabel",
									position = {240,0},
									size = {90, 13},
									Text = {
										text = "$5126",
										textStyle = "FEHeading4",
									}
								},
							},
						},

						-- SPACER
						{
							type = "Frame",
							size = {608, 13},
						},

						-- ENABLE BATTLE CHATTER
						{
							type = "Frame",
							size = {608, 17},
							visible = 0, -- TODO
							;

							{
								type = "Frame",
								position = {270, 0},
								size = {330, 13},
								;
								{
									type = "Button",
									buttonStyle = "FECheckBoxButtonStyle",
									name = "m_chkBattleChatter",
									enabled = 0,

									helpTip = "$5263", -- "TOGGLE BATTLE SPEECH EVENTS",
									helpTipTextLabel = "m_lblHelpText",
								},
								{
									type = "TextLabel",
									size = {200, 13},
									position = {20, 0},
									Text = {
										text = "$5127",
										textStyle = "FEHeading4",
									},
								},
							},
						},

						-- ENABLE SELECTION SPEECH
						{
							type = "Frame",
							size = {608, 17},
							visible = 0, -- TODO
							;

							{
								type = "Frame",
								position = {270, 0},
								size = {330, 13},
								;
								{
									type = "Button",
									enabled = 0,
									buttonStyle = "FECheckBoxButtonStyle",
									name = "m_chkSelectionSpeech",

									helpTip = "$5264", -- "TOGGLE SELECTION SPEECH EVENTS",
									helpTipTextLabel = "m_lblHelpText",
								},
								{
									type = "TextLabel",
									size = {200, 13},
									position = {20, 0},
									Text = {
										text = "$5128",
										textStyle = "FEHeading4",
									},
								},
							},
						},
					},
				},

				{ -- FX OPTION FRAME TO CLONE
					type = "Frame",
					visible = 0,
					--size = {138*2, 30},
					autosize = 1,
					minSize = {0,35},
					name = "m_fxFrameToClone",
					helpTipTextLabel = "m_lblHelpText",
					;

					{
						type = "TextLabel",
						name = "m_lblFXTitle",
						position = {16,0},
						size = {155,13},
						backgroundColor = {0,175,255,75},
						Text = {
							textStyle = "FEHeading4",
							hAlign = "Center",
							vAlign = "Middle",
							text = "$5140",
						},
					},

					{
						type = "DropDownListBox",
						position = {16, 15},
						width = 155,
						name = "m_comboFX",
						dropDownListBoxStyle = "FEDropDownListBoxStyle",
					},
				},

				{
					type = "TextListBoxItem",
					visible = 0,
					name = "m_itemToClone",
					buttonStyle = "FEListBoxItemButtonStyle",
					Text = {
						textStyle = "FEListBoxItemTextStyle",
					},
				},

				-- VIDEO TAB FRAME
				{
					type = "Frame",
					name = "m_tabVideo",
					size = {608, 244},
					visible = 0,
					;

					{
						type = "Frame",
						position = {4,17},
						size = {608, 264},
						autoarrange = 1,
						autoarrangeSpace = 2,
						autoarrangeWidth = 490,
						;

						-- RESOLUTION
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "TextLabel",
								size = {206,13},
								Text = {
									textStyle = "FEHeading4",
									text = "$5129",
								},
							},

							{
								type = "DropDownListBox",
								name = "m_comboVideoResolution",
								enabled = 1,
								position = {270, 0},
								size = {330, 13},
								dropDownListBoxStyle = "FEDropDownListBoxStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5189", -- "SPECIFY SCREEN RESOLUTION",

								ListBox = {
									type = "ListBox",
									width = 330,
									listBoxStyle = "FEListBoxStyle",
									backgroundColor = {0,0,0,255},
									;

									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "800 x 600",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "1024 x 768",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "1280 x 960",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "1600 x 1200",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,
									},
								},

							},
						},

						-- SPACER
--						{
--							type = "Frame",
--							size = {608, 13},
--						},

						-- GAMMA SLIDER
						{
							type = "Frame",
--							size = {608, 17},
							size = {608, 0},
							visible = 0,
							;

							{
								type = "TextLabel",
								size = {206,17},
								Text = {
									textStyle = "FEHeading4",
									text = "$5130",
								},
							},

							{
								type = "TextLabel",
								name = "lblGamma",
								enabled = 0,
								position = {228, 2},
								style = "FESliderLabelStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5265", -- "SCREEN GAMMA",
							},

							{
								type = "ScrollBar",
								name = "m_sbarGamma",
								enabled = 0,
								sliderTextLabel = "lblGamma",
								position = {270, 2},
								width = 330,
								scrollBarStyle = "FESliderStyle",

								helpTipTextLabel = "m_lblHelpText",
								helpTip = "$5266", -- "ADJUST THE SCREEN GAMMA",
							},
						},

						-- SPACER
--						{
--							type = "Frame",
--							size = {608, 13},
--						},

						-- VIDEO PRESETS
						{
							type = "Frame",
--							size = {608, 17},
							size = {608, 0},
							visible = 0,
							;

							{
								type = "TextLabel",
								size = {206,13},
								Text = {
									textStyle = "FEHeading4",
									text = "$5131",
								},
							},
							{
								type = "DropDownListBox",
								name = "m_comboVideoPresets",
								enabled = 0,
								position = {270, 0},
								size = {330, 13},
								dropDownListBoxStyle = "FEDropDownListBoxStyle",
								selected = 1,

								ListBox = {
									type = "ListBox",
									width = 330,
									listBoxStyle = "FEListBoxStyle",
									backgroundColor = {0,0,0,255},
									;

									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5102",
											textStyle = "FEListBoxItemTextStyle",
										},

										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5267", -- "LOAD MINIMUM VIDEO OPTIONS (FOR LOW END SYSTEMS)",
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5122",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5268", -- "LOAD DEFAULT VIDEO OPTIONS (RECOMMENDED)",
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5103",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5269", -- "LOAD MAX VIDEO OPTIONS (FOR HIGH END SYSTEMS)",
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5132",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5270", -- "SPECIFY CUSTOM VIDEO OPTIONS (FOR ADVANCED USERS)",
									},
								},
							},
						},

						-- TEXTURE QUALITY
						{
							type = "Frame",
--							size = {608, 17},
							size = {608, 0},
							visible = 0,
							;

							{
								type = "TextLabel",
								size = {206,13},
								Text = {
									textStyle = "FEHeading4",
									text = "$5134",
									offset = {20, 0},
								},
							},

							{
								type = "DropDownListBox",
								name = "m_comboTextureQuality",
								position = {300, 0},
								enabled = 0,
								size = {300, 13},
								dropDownListBoxStyle = "FEDropDownListBoxStyle",
								selected = 1,

								ListBox = {
									type = "ListBox",
									width = 300,
									listBoxStyle = "FEListBoxStyle",
									backgroundColor = {0,0,0,255},
									;

									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5102",
											textStyle = "FEListBoxItemTextStyle",
										},

										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5271", -- "LOWEST TEXTURE QUALITY (FOR LOW END SYSTEMS)",
									},
									{
										type = "TextListBoxItem",
										buttonStyle = "FEListBoxItemButtonStyle",
										Text = {
											text = "$5103",
											textStyle = "FEListBoxItemTextStyle",
										},
										resizeToListBox = 1,

										helpTipTextLabel = "m_lblHelpText",
										helpTip = "$5272", -- "HIGHEST TEXTURE QUALITY (RECOMMENDED)",
									},
								},
							},
						},

						-- SPACER
--						{
--							type = "Frame",
--							size = {608, 13},
--						},

						-- ENABLE VSYNC CHECKBOX
						{
							type = "Frame",
							size = {608, 17},
							;

							{
								type = "Frame",
								position = {270, 0},
								size = {330, 13},
								;
								{
									type = "Button",
									buttonStyle = "FECheckBoxButtonStyle",
									name = "m_chkVsync",
									enabled = 1,

									helpTip = "$5273", -- "TOGGLE VERTICAL SYNCRONIZATION",
									helpTipTextLabel = "m_lblHelpText",
								},
								{
									type = "TextLabel",
									size = {200, 13},
									position = {20, 0},
									Text = {
										text = "$5138",
										textStyle = "FEHeading4",
									},
								},
							},
						},

						-- SPACER
						{
							type = "Frame",
							size = {608, 13},
						},

						{
							type = "Frame",
							autosize = 1,
							;

							{
								type = "TextLabel",
								size = {206,13},
								Text = {
									textStyle = "FEHeading4",
									text = "$5089", -- SPECIAL EFFECTS
								},
							},


							{
								type = "Frame",
								name = "m_frameFXOptionContainer",
								position = {254,0},
								--size = {300, 70},
								autoarrange = 1,
								autoarrangeSpace = 2,
								autoarrangeWidth = 370,
								autosize = 1,
								;

								-- OPTION FRAMES

								-- FILLED BY CODE...
							}
						},
					}
				},

				-- CONTROLS TAB FRAME
				{
					type = "Frame",
					name = "m_tabControls",
					size = {612, 266},
					;

					{
						type = "Frame",
						position = {0,0},
						size = {612, 266},
						;

						-- load the controls tab from data:ui/newui/controlstab.lua
						GetControlsTab(612, 264, "FEColorOutline"),
					}
				},

				-- SPECIAL FX TAB FRAME
				{
					type = "Frame",
					name = "m_tabFX",
					size = {608, 244},
					visible = 0,
					;

				},
			},
		},
	},




	------------------------------------------------------------------------------------
	-- BOTTOM NAVIGATION FRAME
	------------------------------------------------------------------------------------
	{
		type = "Frame",
		backgroundColor = "FEColorBackground1",
		position = {12,544},
		size = {776,44},
		name = "frmRootbottombigfrm",
		;
		-- OUTLINE FRAME
		{
			type = "Frame",
			borderWidth = 2,
			borderColor = "FEColorOutline",
			position = {2,2},
			size = {772,40},
			name = "frmbottomframe",
			;

			-- HELP TEXT
			{
				type = "TextLabel",
				position = {4,4},
				size = {764,13},
				name = "m_lblHelpText",
				Text = {
					textStyle = "FEHelpTipTextStyle",
				},
				;
			},

			-- LINE
			{
				type = "Line",
				above = 0,
				lineWidth = 2,
				color = "FEColorOutline",
				p1 = {2, 19},
				p2 = {770, 19},

			},

			-- BUTTONS

			-- CANCEL BUTTON
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {4,23},
				name = "m_btnBack",
				Text = {
					text = "$2613", -- CANCEL
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5274", -- "DISCARD CHANGES AND RETURN TO MAIN MENU",

				onMouseClicked = "UI_PreviousScreen(eTransition)",
			},

			-- RESTORE DEFAULTS BUTTON
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle1",
				position = {126,23},
				name = "m_btnRestoreDefaultOptions",
				Text = {
					text = "$5142", -- RESTORE DEFAULTS
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5275", -- "RESTORE DEFAULT OPTIONS",
			},

			-- APPLY BUTTON
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyle2",
				position = {648,23},
				name = "m_btnAccept",
				Text = {
					text = "$5143", -- APPLY
					textStyle = "FEButtonTextStyle",
				},
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5276", -- "APPLY CHANGES AND RETURN TO MAIN MENU",
				;
			},
		},
	},
}

