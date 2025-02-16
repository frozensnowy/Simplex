-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 315
DIALOGHEIGHT = 200
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
crisis =
{
    size =
        { (800-DIALOGWIDTH)/2, (600-DIALOGHEIGHT)/2-16, DIALOGWIDTH, DIALOGHEIGHT, },
    stylesheet = "HW2StyleSheet",
    pixelUVCoords = 1,
;
{
    type = "Frame",
    name = "m_frmDialogRoot",
    size =
        { DIALOGWIDTH, DIALOGHEIGHT, },
    backgroundColor = "FEColorDialog",
    autosize = 1,
    marginHeight = 1,
;
{
    type = "Frame",
    position =
        { 4, 4, },
    size =
        { (DIALOGWIDTH + -8), 123, }, 	--DIALOGHEIGHT-50
    style = "FEPopupBackgroundStyle",
},
{
    type = "Frame",
    position =
        { 2, 2, },
    size =
        { (DIALOGWIDTH + -4), 125, },
;
{
    type = "Frame",
    size =
        { (DIALOGWIDTH + -4), 127, },
    borderWidth = 2,
    borderColor = "FEColorPopupOutline", },
},
{
    type = "Frame",
    position =
        { 1, 0, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = (DIALOGWIDTH + -2),
    autoarrangeSpace = 2,
;
{
    type = "Frame",
    size =
        { (DIALOGWIDTH + -5), 122, },
;
		{
			type = "Frame",
			name = "automated_dreadnought",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\automated_dreadnought.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "enigmatic_fortress",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\enigmatic_fortress.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "gray_goo_ships",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\gray_goo_ships.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "space_debris",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\space_debris.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "asteroid_approaching_planet",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\asteroid_approaching_planet.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "fallen_empire_awakes",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\fallen_empire_awakes.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "mining_station",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\mining_station.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "bring_sajuuk_to_bear",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\bring_sajuuk_to_bear.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},


{
    type = "TextLabel",
    name = "lblTitle",
    position =
        { 4, 0, },
    size =
        { (DIALOGWIDTH + -10), 15, },
    Text =
    {
        textStyle = "FEHeading3",
        vAlign = "Middle",
        text = "ENDGAME CRISIS", },
},
{
    type = "TextLabel",
    name = "lblSubTitle",
    position =
        { 4, 11, },
    size =
        { (DIALOGWIDTH + -10), 13, },
    Text =
    {
        textStyle = "FEHeading4", }, },
},
{
    type = "Frame",
    outerBorderWidth = 1,
    autosize = 1,
    borderColor = "FEColorPopupOutline",
    autoarrange = 1,
;
{
    type = "Frame",
    borderWidth = 1,
    borderColor = "FEColorPopupOutline",
    autosize = 1,
    --autoarrange = 1,
;
{
    type = "TextLabel",
    autosize = 1,
    wrapping = 1,
    name = "lblDescription1",
    position =
        { 4, 2, },
    size =
        { (DIALOGWIDTH + -10), 48, },
    Text =
    {
    textStyle = "FEHeading4", }, },
},

{
    type = "Frame",
    name = "m_frmButtons",
    size =
        { (DIALOGWIDTH + -6), 17, },
    borderWidth = 1,
    borderColor = "FEColorPopupOutline",
;
--
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk1", 	--btnOk
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Full combat alert!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk2",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "RED ALERT!!!", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk3",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "We need some careful investigation.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk4",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "What could possibly go wrong?", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk5",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Better watch from distance.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk6",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Worrying.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk7",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Time to run!", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk8",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Call the Avengers.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk9",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "The end time has begun.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk10",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Unnerving.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk11",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Someone is responsible for this.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk12",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Do not go gentle into that good night.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk13",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "The time of prophecy is at hand.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk14",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Bring Sajuuk to bear!!!", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk15",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "No way...", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk16",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "So?", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk17",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "This is crazy!", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk18",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Something's wrong.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk19",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Is this some kind of final boss?", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk20",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Not again...", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk21",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "Hell no!!!", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk22",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "We knew it.", },
    onMouseClicked = "UI_HideScreen('crisis')", },
{
    type = "TextButton",
    position =
        { 2, 2, },
    width = ((DIALOGWIDTH + -6) + -4),
    name = "btnOk23",
    buttonStyle = "FEButtonStyle2",
    Text =
    {
        textStyle = "FEButtonTextStyle",
        text = "That escalated quickly.", },
    onMouseClicked = "UI_HideScreen('crisis')", },


},
},
},
},
}
