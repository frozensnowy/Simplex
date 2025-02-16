dofilepath("data:ui/newui/GalleryVaygrContent.lua")

local listBox = {}
listBox.type = "ListBox"
listBox.position = {4,2}
listBox.size = {481,300}
listBox.name = "listTutorials"
listBox.scrollBarSpace = 0
listBox.hugBottom = 0

local listPic = {}
listPic.type = "Frame"
listPic.borderWidth = 1
listPic.borderColor = "FEColorOutline"
listPic.size = {248,200}
listPic.name = "frmMap"

function toggPic(k)
	local tCount = ""
	for j, iCount in CreditsList do
		local visiBool = 0
		if (j == k) then
			visiBool = 1
		end
		tCount = tCount..[[UI_SetElementVisible("GalleryVaygr", "image]]..j..[[", ]]..visiBool..[[);]]
	end
	return tCount
end

for k, iCount in CreditsList do
	local visiBool = 0
	if (k == 1) then
		visiBool = 1
	end

	listBox[k] =
	{
		type = "ListBoxItem",
		helpTip = iCount.creditsToolTip,
		helpTipTextLabel = "txtLblHELPTEXT",
		autosize = 1,
		name = "itemTutorialToClone"..k,

		-- is the button initially in its "pressed" state?
		pressed = visiBool,
		pressedColor = {255,255,255,50},
		pressedBorderColor = "FEColorHeading3",
		
		borderWidth = 1,

		-- switch images on and off
		onMouseClicked = toggPic(k),

		soundOnClicked = "SFX_MissionSelectClick",
		;
		
		{
			type = "Button",
			position = {5,5},
			autosize = 1,
			
			;
			--DEFINITION FOR: (txtLbl) TutName
			{
				type = "TextLabel",						
				position = {4, 0},
				size = {443,13},
				name = "txtLblTutName"..k,
				backgroundColor = {112,157,180,255},
				Text =
				{
					-- name of contributer
					text = iCount.creditsName,
					textStyle = "FEButtonTextStyle",
					color = {0,0,0,255},
					hAlign = "Left",
					offset = {4, 0},
				},
				;
			},

			--DEFINITION FOR: (txtLbl) TutDesc
			{
				type = "TextLabel",
				position = {4,15},
				size = {452,35},
				autosize = 1,
				wrapping = 1,	
				minSize = {0, 39},
				name = "txtLblTutDesc"..k,
				marginWidth = 4,
				marginHeight = 2,						
				Text =
				{
					-- details relating to contributer
					text = iCount.creditsText,		
					textStyle = "FEButtonTextStyle",
					color = {255,255,255,255},
					hAlign = "Left",
					vAlign = "Top",
				},
				;
			},
		},
	}

	listPic[k] =
	{
		type = "Frame",
		BackgroundGraphic =
		{
			type = "Graphic",
			-- file name and path of the image
			texture = iCount.creditsImage,
			-- 1200x1600
			textureUV = {0,0,484,388},
		},
		position = {3,3},
		size = {242,194},
		-- the image's unique name
		name = "image"..k,
		-- is the image initially visible?
		visible = visiBool,
		;
	}
end

-- most of the "name" and "type" stuff is left over from "MissionSelect.lua" and no longer serves any function
GalleryVaygr =
{
	size = {0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",

	pixelUVCoords = 1,

	-- %s is the name of the campaign and the name of the mission file
	thumbnailPath = "Data:UI\\MapThumbnails\\Campaign\\%s\\%s.tga",

	strIncomplete = "$3496",
	strComplete = "$3495",
	-- Help text to display for a completed tutorial
	completeMsg = "$3471",
	-- Help text to display for an incomplete tutorial
	incompleteMsg = "$3472",

	-- Blue
	completeColor = {238,188,5,255},
	-- Yella
	incompleteColor = {112,157,180,255},
	;

	{
		type = "Frame",
		position = {0,0},
		size = {800,600},
		name = "frmTheRoot",
		;
		
		--DEFINITION FOR: (txtLbl) TITLE (TUTORIAL)
		{
			type = "TextLabel",
			position = {16,-2},
			size = {700,36},
			name = "txtLblTITLETUT",
			Text =
			{
				-- TUTORIAL
				text = "GALLERY",
				textStyle = "FEHeading1",
			},
			;
		},

		--DEFINITION FOR: (txtLbl) SUBTITLE (TUTORIAL)
--		{
--			type = "TextLabel",
--			position = {17,34},
--			size = {700,21},
--			-- SPECIAL SUBTITLE FOR THE TUTORIAL
--			name = "txtLblSUBTITLETUT",
--			Text =
--			{
--				-- LEARN TO PLAY
--				text = "Vaygr",
--				textStyle = "FEHeading2",
--			},
--			;
--		},
	
		--DEFINITION FOR: (frmRoot) TutorialBox
		{
			type = "Frame",		
			position = {28,112},
			size = {742,338},
			name = "frmRootTutorialBox",	
			backgroundColor = "FEColorBackground1",
			;
	
			-- Line on the left side of the list boxes scroll bar
			{
				type = "Line",
				p1 = {719, 30},
				p2 = {719, 334},
				lineWidth = 2,
				above = 1,
				color = "FEColorOutline",
			},
			
			--DEFINITION FOR: (txtLbl) Tutorial
			{
				type = "TextLabel",
				position = {5,2},
				size = {500,15},
				name = "txtLblCampaignName",
				Text =
				{
					text = "VAYGR",
					textStyle = "FEHeading3",
					vAlign = "Middle",
				},
				;
			},
	
			--DEFINITION FOR: (txtLbl) ChooseTut
			{
				type = "TextLabel",
				position = {5,18},
				size = {300,10},
				name = "txtLblChooseTut",
				Text =
				{
					-- CHOOSE TUTORIAL//
					text = "SELECT//",
					textStyle = "FEHeading4",
				},
				;
			},

			-- This frame contains the map, the tutorial list frame, the spacer frame, and the bottom help text frame
			{
				type = "Frame",
				outerBorderWidth = 1,
				borderColor = "FEColorOutline",
				position = {3, 31},
				autosize = 1,
--				backgroundColor = "FEColorBackground1",
				;
			
				-- This is the list box that will hold all of the tutorial items
				--DEFINITION FOR: (frm) tut frame
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					position = {248,0},
					size = {488,304},
					;

--=============================================================================
-- List Box Items
					listBox,
					
--=============================================================================

				},

				-- map (screenshot) frame
				--DEFINITION FOR: (frm) Map

--=============================================================================
-- List Box Pics
				listPic,

--=============================================================================

				-- bottom-of-map spacer frame
				--DEFINITION FOR: (frm) MapSub
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					position = {0,200},
					size = {248,104},
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
					p1 = {2, 19},
					p2 = {770, 19},
					
				},
				
				-- BUTTONS
				
				--DEFINITION FOR: (txtBtn) BACK
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					position = {4,23},						
					name = "txtBtnBACK",
					helpTip = "$3468",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text =
					{
						-- BACK
						text = "$2610",
						textStyle = "FEButtonTextStyle",
					},
					onMouseClicked = [[UI_ShowScreen("NewMainMenu", eTransition)]],
					;
				},
				--DEFINITION FOR: (txtBtn) HIIGARAN
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					position = {126,23},						
					name = "txtBtnVaygr",
					helpTip = "HIIGARAN GALLERY",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text =
					{						
						text = "HIIGARAN",
						textStyle = "FEButtonTextStyle",
					},
					onMouseClicked = [[UI_ShowScreen("GalleryHiigaran", eTransition)]],
					;
				},
			},
		},
	}
}