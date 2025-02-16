-- LuaDC version 0.9.19
-- 5/23/2004 7:32:16 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
DIALOGWIDTH = 315
DIALOGHEIGHT = 200
MOREINFOWIDTH = (DIALOGWIDTH + -7)
MOREINFOHEIGHT = 100
easteregg = 
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
        { (DIALOGWIDTH + -8), 123, }, --DIALOGHEIGHT-50
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
--April Fool
		{
			type = "Frame",
			name = "nvidia",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\nvidia.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "ryzen",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\ryzen.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "codes",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\codes.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "nyan_cat",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\nyan_cat.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "purchase",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\purchase.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "supercruise",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\supercruise.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "you_win",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\you_win.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},
		},
		{
			type = "Frame",
			name = "desserts_of_kharak",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\desserts_of_kharak.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},

--New Year
		{
			type = "Frame",
			name = "sunrise",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\sunrise.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "horizon",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\horizon.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "new_century",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\new_century.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "new_millennium",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\new_millennium.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "time_capsule",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\time_capsule.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},

--Christmas
		{
			type = "Frame",
			name = "christmas1",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas1.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "christmas2",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas2.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "christmas3",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas3.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "christmas4",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas4.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "christmas5",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas5.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "christmas6",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas6.tga",
				textureUV = {0,0,450,150},
				color = OUTLINECOLOR,
			},						
		},
		{
			type = "Frame",
			name = "christmas7",
			position = {4, 22},
			size = {300,100},
			BackgroundGraphic = {
				texture = "data:ui\\newui\\\event_pictures\\christmas7.tga",
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
--April Fool
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
        text = "$3614", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 
--New Year
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnNewYear1", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Happy New Year!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnNewYear2", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Jump to the future.", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 
--New Year
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnChristmas1", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Merry Christmas!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnChristmas2", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Just give me the present already!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnChristmas3", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "Ho ho ho!", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 
{ 
    type = "TextButton", 
    position = 
        { 2, 2, }, 
    width = ((DIALOGWIDTH + -6) + -4), 
    name = "btnChristmas4", 	--btnOk
    buttonStyle = "FEButtonStyle2", 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        text = "But how can I get laid?", }, 	--$3614
    onMouseClicked = "UI_HideScreen('easteregg')", }, 

    
}, 
}, 
}, 
}, 
}
