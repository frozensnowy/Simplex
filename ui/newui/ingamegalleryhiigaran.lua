dofilepath("data:ui/newui/GalleryHiigaranContent.lua")
dofilepath("data:ui/newui/controlstab.lua")

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
		tCount = tCount..[[UI_SetElementVisible("InGameGalleryHiigaran", "image]]..j..[[", ]]..visiBool..[[);]]
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
			texture = iCount.creditsImage,			
			textureUV = {0,0,968,776},
		},
		position = {3,3},
		size = {242,194},		
		name = "image"..k,		
		visible = visiBool,
		;
	}
end

InGameGalleryHiigaran =
{
	size = { 225, 119, 351, 266, }, 
	stylesheet = "HW2StyleSheet",

	RootElementSettings = 
    { 
    backgroundColor = "IGColorBackground1", }, 
    soundOnShow = "SFX_ObjectiveMenuONOFF", 
    soundOnHide = "SFX_ObjectiveMenuONOFF", 
    pixelUVCoords = 1,  
	onShow = "MainUI_PushEnabledCommandState(); MainUI_DisableAllCommands(1); MainUI_DisableCommand(eExit, 0); UI_HideScreen('SpeechRecall'); UI_HideScreen('ObjectivesList');",
	onHide = "MainUI_DisableCommand(eExit, 1); MainUI_PopEnabledCommandState()",	
	;

	{
		type = "Frame",
		position = {0,0},
		size = {351,266},
		name = "frmTheRoot",
		;
		
		{ 
    type = "TextLabel", 
    position = 
        { 4, 1, }, 
    size = 
        { 208, 14, }, 
    name = "lblTitle", 
    Text = 
    { 
        textStyle = "IGHeading1", 
        text = "GALLERY", }, 
	}, 
	{ 
    type = "TextLabel", 
    position = 
        { 4, 16, }, 
    size = 
        { 208, 13, }, 
    name = "lblSubtitle", 
    Text = 
    { 
        textStyle = "IGHeading2", 
        text = "Hiigaran", }, 
	}, 
	
		--DEFINITION FOR: (frmRoot) TutorialBox
		{
			type = "Frame",		
			position = {4,22},
			size = {240,300},
			name = "frmRootTutorialBox",				
			;
	
			-- Line on the left side of the list boxes scroll bar
			--{
				--type = "Line",
				--p1 = {325, 30},
				--p2 = {325, (174 + 39),},
				--lineWidth = 2,
				--above = 1,
				--color = "FEColorOutline",
			--},
			
			--DEFINITION FOR: (txtLbl) Tutorial
			--{
				--type = "TextLabel",
				--position = {5,2},
				--size = {0,0},
				--name = "txtLblCampaignName",
				--Text =
				--{
					--text = "HIIGARAN",
					--textStyle = "FEHeading3",
					--vAlign = "Middle",
				--},
				--;
			--},	
			

			-- This frame contains the map, the tutorial list frame, the spacer frame, and the bottom help text frame
			{
				type = "Frame",
				outerBorderWidth = 1,
				borderColor = "FEColorOutline",
				position = {50, 31},
				autosize = 1,
--				backgroundColor = "FEColorBackground1",
				;
			
				-- This is the list box that will hold all of the tutorial items
				--DEFINITION FOR: (frm) tut frame
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					position = {148,0},
					size = {70,50},
					;

--=============================================================================
-- List Box Items
					listBox,
					
--=============================================================================

				},				

--=============================================================================
-- List Box Pics
				listPic,

--=============================================================================
				
				--DEFINITION FOR: (frm) MapSub
				{
					type = "Frame",
					borderWidth = 1,
					borderColor = "FEColorOutline",
					position = {160,200},
					size = {100,50},
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
				--DEFINITION FOR: (txtBtn) VAYGR
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					position = {126,23},						
					name = "txtBtnVaygr",
					helpTip = "VAYGR",
					helpTipTextLabel = "txtLblHELPTEXT",
					Text =
					{						
						text = "VAYGR",
						textStyle = "FEButtonTextStyle",
					},
					onMouseClicked = [[UI_ShowScreen("GalleryVaygr", eTransition)]],
					;
				},
			},
		},
	}
}