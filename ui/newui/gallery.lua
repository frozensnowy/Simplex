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
		tCount = tCount..[[UI_SetElementVisible("gallery", "image]]..j..[[", ]]..visiBool..[[);]]
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

gallery = 
{ 
    size = 
        { 225, 119, 351, 266, }, 
    stylesheet = "HW2StyleSheet", 
    RootElementSettings = 
    { 
        backgroundColor = "IGColorBackground1", }, 
    soundOnShow = "SFX_ObjectiveMenuONOFF", 
    soundOnHide = "SFX_ObjectiveMenuONOFF", 
    pixelUVCoords = 1, 
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

---corpo------------------------------------------

{ 
    type = "Frame", 
    position = 
        { 3, 31, }, 
    autosize = 1, 
    borderColor = "IGColorOutline", 
    outerBorderWidth = 1, 
; 
{ 
    type = "ListBox", 
    listBoxStyle = "FEBorderListBoxStyle", 
    position = 
        { 0, 0, }, 
    size = 
        { 345, (174 + 39), }, 
    name = "listSpeech", 
    hugBottom = 1, 
}, 
{ 
    type = "Line", 
    p1 = 
        { 325, 0, }, 
    p2 = 
        { 325, (174 + 39), }, 
    lineWidth = 2, 
    color = "IGColorOutline", 
}, 

---bottone in fondo-----------------------------------

{ 
    type = "Frame", 
    position = 
        { 0, (193 + 20), }, 
    size = 
        { 345, 19, }, 
    borderWidth = 1, 
    borderColor = "IGColorOutline", 
; 
{ 
    type = "TextButton", 
    position = 
        { 3, 3, }, 
    width = (345 + -6), 
    buttonStyle = "DiplomacyScreen_ButtonStyle", 
    Text = 
    { 
        text = "$2642", }, 
    onMousePressed = "UI_ToggleScreen( 'gallery', 0)", }, 
}, 
}, 

---altro list box

{ 
    type = "ListBoxItem", 
    name = "listItem", 
    autosize = 1, 
    visible = 0, 
    marginHeight = 2, 
; 
{ 
    type = "Frame", 
    position = 
        { 0, 1, }, 
    size = 
        { 16, 8, }, 
    name = "icon", 
}, 
{ 
    type = "TextLabel", 
    name = "text", 
    position = 
        { 18, 0, }, 
    size = 
        { 294, 13, }, 
    wrapping = 1, 
    autosize = 1, 
    Text = 
    { 
        textStyle = "Taskbar_MenuButtonTextStyle", 
        hAlign = "Left", }, }, 
}, 
}
