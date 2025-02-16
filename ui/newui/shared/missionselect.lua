-- initialize campaign, then override with "MissionGrid_record.lua" if it exists
dofilepath("data:leveldata\\campaign\\ascension.data")
dofilepath("player:Campaign\\ASCENSION\\MissionGrid_record.lua")


screenName = "MissionSelect"
screenTitle = "CAMPAIGN"
screenSubtitle = "$3491"
boxSubtitle = "$3492"
boxTitle = campaignTable[campaignLabel].titlecaps
numMissions = campaignTable[campaignLabel].nummissions
missionRecord = campaignTable[campaignLabel].record
useThumbnails = campaignTable[campaignLabel].useThumbnails
useBackground = campaignTable[campaignLabel].useBackground
backgroundImg = campaignTable[campaignLabel].background
backgroundUV = campaignTable[campaignLabel].backgroundUV

-- only list missions that have been played (not necessarily completed)
missionTable = {}
for k = 1, numMissions do
	missionTable[k] = {}
	missionTable[k].title = campaignTable[campaignLabel].missions[k].displayName
	missionTable[k].description = campaignTable[campaignLabel].missions[k].description
	missionTable[k].thumbnail = campaignTable[campaignLabel].missions[k].thumb
	missionTable[k].thumbuv = campaignTable[campaignLabel].missions[k].thumbUV
end

paneX = 480
paneY = 480
posX = (800 - paneX)/2
posY = (600 - paneY)/2
gridX = ceil(sqrt(numMissions))
gridY = ceil(numMissions/gridX)
sizeX = paneX/gridX
sizeY = sizeX		--sizeY = paneY/gridY

listBox =
{
	type = "Frame",		
	name = "frmRootTutorialBox",
	position = {posX,posY},
	size = {paneX,paneY},
	outerBorderWidth = 2,
	borderColor = "FEColorOutline",
	backgroundColor = "FEColorBackground1",
}

if (useBackground == 1) then
	listBox.BackgroundGraphic =
	{
		type = "Graphic",
		-- file name and path of the image
		texture = backgroundImg,
		-- 1200x1600
		textureUV = backgroundUV,
	}
end

listPic =
{
	type = "Frame",
	name = "frmMap",
	position = {posX,posY},
	size = {paneX,paneY},
}

countX = 0
countY = 0
for k, kCount in missionTable do
	local ktext = k
	if (ktext < 10) then
		ktext = "0" .. ktext
	end
	local toggleImage = ""
	-- I want to concatenate this with Localization ID number $3495, but don't know how
	local toggleTitle = kCount.title
	local toggleTip = "$3471"
	local toggleLoad = {255, 215, 0, 255}
	local toggleBack = {}
	local toggleSelected = 0
	local toggleEnabled = 0
	-- the last-played mission is selected by default
	if (k == currentMission) then
		toggleSelected = 1
		toggleLoad = ""
		toggleEnabled = 1
	end
	-- enabled neighboring sector buttons
--	for i, iCount in addMissions do
--		if (k == currentMission + iCount) then
--			toggleEnabled = 1
--		end
--	end
	-- change the appearance based on whether the sector has been cleared
	if (sectorsCleared[k] == 1) then
		toggleBack = {255, 215, 0, 255}
		toggleTip = "$3471"
		-- I want to concatenate this with Localization ID number $3495, but don't know how.
		toggleTitle = kCount.title
	else
		toggleBack = {112, 157, 180, 255}
		toggleTip = "$3472"
		-- I want to concatenate this with Localization ID number $3496, but don't know how.
		toggleTitle = kCount.title
	end

	-- should use something besides buttons since clicking on them doesn't actually do anything
	listBox[k] =
	{
		type = "Button",
		name = "missionbutton_" .. ktext,
		size = {sizeX - 4,sizeY - 4,},
		position = {countX * sizeX + 2,countY * sizeY + 2,},
		helpTip = toggleTip,
		helpTipTextLabel = "txtLblHELPTEXT",
		-- is the button initially in its "pressed" state?
		pressed = toggleSelected,
		pressedColor = {255,255,255,50},
		pressedBorderColor = "FEColorHeading3",
		outerBorderWidth = 1,
		soundOnClicked = "SFX_MissionSelectClick",
		enabled = toggleEnabled,
		-- switch images on and off
		onMouseClicked =
		[[
			buttonClicks = {"I told you not to click the button.","Stop it!","Ouch!!"};
			print(buttonClicks[random(1,3)]);
		]],
		;
	}

	listPic[k] =
	{
		type = "Frame",
--		size = {sizeX,sizeX * 194/242,},
		size = {sizeX - 4,sizeY - 4,},
		position = {countX * sizeX + 2,countY * sizeY + 2,},
		-- the image's unique name
		name = "missionthumb_" .. ktext,
		;
		--DEFINITION FOR: (txtLbl) TutName
		{
			type = "TextLabel",						
			position = {2,2},
			size = {sizeX - 4,13},
			autosize = 1,
			wrapping = 1,	
			name = "txtLblTutName" .. k,
			backgroundColor = toggleBack,
			marginWidth = 4,
			marginHeight = 2,
			Text =
			{
				-- name of contributer
				text = toggleTitle,
				textStyle = "FEButtonTextStyle",
				color = {0,0,0,255},
				hAlign = "Left",
				offset = {4,0},
			},
			;
		},
		--DEFINITION FOR: (txtLbl) TutDesc
		{
			type = "TextLabel",
			position = {2,27},
			size = {sizeX - 4,sizeY - 27},
			autosize = 1,
			wrapping = 1,	
--			minSize = {0,39},
			name = "txtLblTutDesc" .. k,
			marginWidth = 4,
			marginHeight = 2,
			Text =
			{
				-- details relating to contributer
				text = kCount.description,		
				textStyle = "FEButtonTextStyle",
				color = {255,255,255,255},
				hAlign = "Left",
				vAlign = "Top",
			},
			;
		},
	}

	if (useThumbnails == 1) then
		listPic[k].BackgroundGraphic =
		{
			type = "Graphic",
			-- file name and path of the image
			texture = kCount.thumbnail,
			-- 1200x1600
			textureUV = kCount.thumbuv,
		}
	end

	countX = countX + 1
	if (countX == gridX) then
		countX = 0
		countY = countY + 1
	end
end

-- Pretty-Printed using HW2 Pretty-Printer 1.27 by Mikail.
MissionSelect = 
{
	size = {0,0,800,600,},
	stylesheet = "HW2StyleSheet",
	pixelUVCoords = 1,
	thumbnailPath = "Data:UI\\MapThumbnails\\Campaign\\%s\\%s.tga",
	-- %s is the name of the campaign and the name of the mission file																																																																																								
	strIncomplete = "$3496",
	strComplete = "$3495",
	completeMsg = "$3471",
	-- Help text to display for a completed tutorial
	incompleteMsg = "$3472",
	-- Help text to display for an incomplete tutorial
	completeColor = {238,188,5,255,},
	-- Blue
	incompleteColor = {112,157,180,255,},
	;
	-- Yella
	{
		type = "Frame",
		position = {0,0,},
		size = {800,600,},
		name = "frmTheRoot",
		;
		--DEFINITION FOR: (txtLbl) TITLE (CAMPAIGN)
		{
			type = "TextLabel",
			position = {16,-2,},
			size = {700,36,},
			name = "txtLblTITLE",
			Text = 
			{
				text = boxTitle,
				-- SINGLE PLAYER GAME			
				textStyle = "FEHeading1",
			},
			;
		},
		--DEFINITION FOR: (txtLbl) TITLE (TUTORIAL)
		{
			type = "TextLabel",
			position = {16,-2,},
			size = {700,36,},
			name = "txtLblTITLETUT",
			Text = 
			{
				text = "$3450",
				-- TUTORIAL
				textStyle = "FEHeading1",
			},
			;
		},
		--DEFINITION FOR: (txtLbl) SUBTITLE (CAMPAIGN)
		{
			type = "TextLabel",
			position = {17,34,},
			size = {700,21,},
			name = "txtLblSUBTITLE",
			Text = 
			{
				text = boxSubtitle,
				-- MISSION SELECT
				textStyle = "FEHeading2",
			},
			;
		},
		--DEFINITION FOR: (txtLbl) SUBTITLE (TUTORIAL)
		{
			type = "TextLabel",
			position = {17,34,},
			size = {700,21,},
			name = "txtLblSUBTITLETUT",
			-- SPECIAL SUBTITLE FOR THE TUTORIAL
			Text = 
			{
				text = "$3462",
				-- LEARN TO PLAY
				textStyle = "FEHeading2",
			},
			;
		},
--=============================================================================
-- List Box Items

		listBox,
		listPic,
					
--=============================================================================
		--DEFINITION FOR: (frmRoot) TutorialBox
		{
			type = "Frame",
			position = {28,112,},
			size = {742,338,},
			name = "frmRootTutorialBox",
			backgroundColor = "FEColorBackground1",
			visible = 0,
			;
			-- Line on the left side of the list boxes scroll bar
			{
				type = "Line",
				p1 = {719,30,},
				p2 = {719,334,},
				lineWidth = 2,
				above = 1,
				color = "FEColorOutline",
			},
			--DEFINITION FOR: (txtLbl) Tutorial
			{
				type = "TextLabel",
				position = {5,2,},
				size = {500,15,},
				name = "txtLblCampaignName",
				Text = 
				{
					textStyle = "FEHeading3",
					vAlign = "Middle",
				},
				;
			},
			--DEFINITION FOR: (txtLbl) ChooseTut
			{
				type = "TextLabel",
				position = {5,18,},
				size = {300,10,},
				name = "txtLblChooseTut",
				Text = 
				{
					text = "$3451",
					-- CHOOSE TUTORIAL//
					textStyle = "FEHeading4",
				},
				;
			},
			--DEFINITION FOR: (txtLbl) ChooseMission
			{
				type = "TextLabel",
				position = {5,18,},
				size = {300,10,},
				name = "txtLblChooseMission",
				Text = 
				{
					text = "$3492",
					-- CHOOSE MISSION//
					textStyle = "FEHeading4",
				},
				;
			},
			-- This frame contains the map, the tutorial list frame, the spacer frame, and the bottom help text frame
			{
				type = "Frame",
				outerBorderWidth = 1,
				borderColor = "FEColorOutline",
				position = {3,31,},
				autosize = 1,
				--backgroundColor = "FEColorBackground1",
				;
		------------------------------------------------------------------------------------
		-- START
		------------------------------------------------------------------------------------
				-- This is the list box item to clone that will contain all the information regarding the a tutorial		
				{
					type = "ListBoxItem",
					helpTipTextLabel = "txtLblHELPTEXT",
					autosize = 1,
					name = "itemTutorialToClone",
					visible = 0,
					pressedColor = {255,255,255,50,},
					pressedBorderColor = "FEColorHeading3",
					borderWidth = 1,
					allowDoubleClicks = 1,
					soundOnClicked = "SFX_MissionSelectClick",
					;
					{
						type = "Button",
						position = {5,5,},
						autosize = 1,
						;
						--DEFINITION FOR: (txtLbl) TutName
						{
							type = "TextLabel",
							position = {4,0,},
							size = {443,13,},
							name = "txtLblTutName",
							Text = 
							{
								textStyle = "FEButtonTextStyle",
								color = {0,0,0,255,},
								hAlign = "Left",
								offset = {4,0,},
							},
							;
						},
						--DEFINITION FOR: (txtLbl) TutDesc
						{
							type = "TextLabel",
							position = {4,15,},
							size = {452,35,},
							autosize = 1,
							wrapping = 1,
							minSize = {0,39,},
							name = "txtLblTutDesc",
							marginWidth = 4,
							marginHeight = 2,
							Text = 
							{
								textStyle = "FEButtonTextStyle",
								color = {255,255,255,255,},
								hAlign = "Left",
								vAlign = "Top",
							},
							;
						},
					},
				},
				-- This is the list box that will hold all of the tutorial items
				--DEFINITION FOR: (frm) tut frame
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					position = {248,0,},
					size = {488,304,},
					;
					{
						type = "ListBox",
						position = {4,2,},
						size = {481,300,},
						name = "listTutorials",
						scrollBarSpace = 0,
						hugBottom = 1,
						;
					},
				},
		------------------------------------------------------------------------------------
		-- END
		------------------------------------------------------------------------------------
				--DEFINITION FOR: (frm) Map
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					size = {248,200,},
					name = "frmMap",
					;
					--DEFINITION FOR: (frmgr) 1m_mapb.tga
					{
						type = "Frame",
						BackgroundGraphic = 
						{
							type = "Graphic",
							texture = "Data:UI\\MapThumbnails\\Campaign\\Default.tga",
							textureUV = {0,0,484,388,},
							-- 1200x1600,
						},
						position = {3,3,},
						size = {242,194,},
						name = "frmgr1mmapbtga",
						;
					},
				},
				--DEFINITION FOR: (frm) MapSub
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					position = {0,200,},
					size = {248,104,},
					name = "frmMapSub",
					;
				},
			},
		},
		------------------------------------------------------------------------------------
		-- BOTTOM NAVIGATION FRAME
		------------------------------------------------------------------------------------
		{
			type = "Frame",
			backgroundColor = "FEColorBackground1",
			position = {12,544,},
			size = {776,44,},
			name = "frmRootbottombigfrm",
			;
			-- OUTLINE FRAME
			{
				type = "Frame",
				borderWidth = 2,
				borderColor = "FEColorOutline",
				position = {2,2,},
				size = {772,40,},
				name = "frmbottomframe",
				;
				-- HELP TEXT
				{
					type = "TextLabel",
					position = {4,4,},
					size = {764,13,},
					name = "txtLblHELPTEXT",
					Text = 
					{
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
					p1 = {2,19,},
					p2 = {770,19,},
				},
				-- BUTTONS
				--DEFINITION FOR: (txtBtn) BACK
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					position = {4,23,},
					name = "txtBtnBACK",
					helpTip = "$3468",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text = 
					{
						text = "$2610",
						-- BACK
						textStyle = "FEButtonTextStyle",
					},
					onMouseClicked = "UI_ShowScreen(\"NewMainMenu\", eTransition)",
					;
				},
				-- DEFINITION FOR: (txtBtn) Load saved campaign
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					position = {248,23,},
					name = "btnLoadSavedMission",
					helpTip = "$3494",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text = 
					{
						text = "$3493",
						textStyle = "FEButtonTextStyle",
					},
					;
				},
				--DEFINITION FOR: (txtBtn) Start mission
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle2",
					position = {648,23,},
					name = "btnStartMission",
					helpTip = "$3470",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text = 
					{
						text = "$3461",
						textStyle = "FEButtonTextStyle",
					},
					onMouseClicked =
					[[

					]],
					;
				},
				--DEFINITION FOR: (txtBtn) RESET
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					position = {126,23,},
					name = "txtBtnRESET",
					helpTip = "$3469",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text = 
					{
						text = "RESET (DOESN'T WORK)",
						textStyle = "FEButtonTextStyle",
					},
					enabled = 0,
					;
				},
			},
		},
	},
}
