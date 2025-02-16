-- LuaDC version 0.9.19
-- 5/23/2004 7:32:01 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
dofilepath("Data:UI\\NewUI\\RandomLoadingText.lua")
dofilepath("Data:UI\\NewUI\\About_Simplex.lua")
delta_height = 100
progress_colourA = random(100,180)
progress_colourR = random(0,255)
progress_colourG = 0
progress_colourB = 0
if progress_colourR < 128 or progress_colourR > 200 then
	random_addition = random(1,2)
	if random_addition == 1 then
		progress_colourR = random(0,255)
		progress_colourG = random(0,255)
		progress_colourB = random(0,255)
		if progress_colourR + progress_colourG + progress_colourB < 200 then
			progress_colourR = 240
			progress_colourG = 170
			progress_colourB = 0
		end
	else
		progress_colourG = random(0,255)
		progress_colourB = random(0,255)
		if progress_colourR + progress_colourG + progress_colourB < 160 then
			random_addition = random(1,3)
			if random_addition == 1 then
				progress_colourR = progress_colourR + 127
			elseif random_addition == 2 then
				progress_colourG = progress_colourG + 127
			elseif random_addition == 3 then
				progress_colourB = progress_colourB + 127
			end
		end
	end
end

LoadScreenPicNum=50
LoadScreenPicID = random(LoadScreenPicNum)
LoadScreenPic={}
LoadScreenPic[1]="DATA:UI/NewUI/Background/menu_background_16000_stellaris27.tga"
LoadScreenPic[2]="DATA:UI/NewUI/Background/menu_background_16000_stellaris1.tga"
LoadScreenPic[3]="DATA:UI/NewUI/Background/menu_background_16000_stellaris2.tga"
LoadScreenPic[4]="DATA:UI/NewUI/Background/menu_background_16000_stellaris3.tga"
LoadScreenPic[5]="DATA:UI/NewUI/Background/menu_background_16000_stellaris4.tga"
LoadScreenPic[6]="DATA:UI/NewUI/Background/menu_background_16000_stellaris5.tga"
LoadScreenPic[7]="DATA:UI/NewUI/Background/menu_background_16000_stellaris6.tga"
LoadScreenPic[8]="DATA:UI/NewUI/Background/menu_background_16000_stellaris7.tga"
LoadScreenPic[9]="DATA:UI/NewUI/Background/menu_background_16000_stellaris8.tga"
LoadScreenPic[10]="DATA:UI/NewUI/Background/menu_background_16000_stellaris9.tga"
LoadScreenPic[11]="DATA:UI/NewUI/Background/menu_background_16000_stellaris10.tga"
LoadScreenPic[12]="DATA:UI/NewUI/Background/menu_background_16000_stellaris11.tga"
LoadScreenPic[13]="DATA:UI/NewUI/Background/menu_background_16000_stellaris12.tga"
LoadScreenPic[14]="DATA:UI/NewUI/Background/menu_background_16000_stellaris13.tga"
LoadScreenPic[15]="DATA:UI/NewUI/Background/menu_background_16000_stellaris14.tga"
LoadScreenPic[16]="DATA:UI/NewUI/Background/menu_background_16000_stellaris15.tga"
LoadScreenPic[17]="DATA:UI/NewUI/Background/menu_background_16000_stellaris16.tga"
LoadScreenPic[18]="DATA:UI/NewUI/Background/menu_background_16000_stellaris17.tga"
LoadScreenPic[19]="DATA:UI/NewUI/Background/menu_background_16000_stellaris18.tga"
LoadScreenPic[20]="DATA:UI/NewUI/Background/menu_background_16000_stellaris19.tga"
LoadScreenPic[21]="DATA:UI/NewUI/Background/menu_background_16000_stellaris20.tga"
LoadScreenPic[22]="DATA:UI/NewUI/Background/menu_background_16000_stellaris21.tga"
LoadScreenPic[23]="DATA:UI/NewUI/Background/menu_background_16000_stellaris22.tga"
LoadScreenPic[24]="DATA:UI/NewUI/Background/menu_background_16000_stellaris23.tga"
LoadScreenPic[25]="DATA:UI/NewUI/Background/menu_background_16000_stellaris24.tga"
LoadScreenPic[26]="DATA:UI/NewUI/Background/menu_background_16000_stellaris25.tga"
LoadScreenPic[27]="DATA:UI/NewUI/Background/menu_background_16000_stellaris26.tga"
LoadScreenPic[28]="DATA:UI/NewUI/Background/menu_background_16000.tga"
LoadScreenPic[29]="DATA:UI/NewUI/Background/menu_background_16000_stellaris28.tga"
LoadScreenPic[30]="DATA:UI/NewUI/Background/menu_background_16000_stellaris29.tga"
LoadScreenPic[31]="DATA:UI/NewUI/Background/menu_background_16000_stellaris30.tga"
LoadScreenPic[32]="DATA:UI/NewUI/Background/menu_background_16000_stellaris31.tga"
LoadScreenPic[33]="DATA:UI/NewUI/Background/menu_background_16000_stellaris32.tga"
LoadScreenPic[34]="DATA:UI/NewUI/Background/menu_background_16000_stellaris33.tga"
LoadScreenPic[35]="DATA:UI/NewUI/Background/menu_background_16000_stellaris34.tga"
LoadScreenPic[36]="DATA:UI/NewUI/Background/menu_background_16000_stellaris35.tga"
LoadScreenPic[37]="DATA:UI/NewUI/Background/menu_background_16000_stellaris36.tga"
LoadScreenPic[38]="DATA:UI/NewUI/Background/menu_background_16000_stellaris37.tga"
LoadScreenPic[39]="DATA:UI/NewUI/Background/menu_background_16000_stellaris38.tga"
LoadScreenPic[40]="DATA:UI/NewUI/Background/menu_background_16000_stellaris39.tga"
LoadScreenPic[41]="DATA:UI/NewUI/Background/menu_background_16000_stellaris40.tga"
LoadScreenPic[42]="DATA:UI/NewUI/Background/menu_background_16000_stellaris41.tga"
LoadScreenPic[43]="DATA:UI/NewUI/Background/menu_background_16000_stellaris42.tga"
LoadScreenPic[44]="DATA:UI/NewUI/Background/menu_background_16000_stellaris43.tga"
LoadScreenPic[45]="DATA:UI/NewUI/Background/menu_background_16000_stellaris44.tga"
LoadScreenPic[46]="DATA:UI/NewUI/Background/menu_background_16000_stellaris45.tga"
LoadScreenPic[47]="DATA:UI/NewUI/Background/menu_background_16000_stellaris46.tga"
LoadScreenPic[48]="DATA:UI/NewUI/Background/menu_background_16000_stellaris47.tga"
LoadScreenPic[49]="DATA:UI/NewUI/Background/menu_background_16000_stellaris48.tga"
LoadScreenPic[50]="DATA:UI/NewUI/Background/menu_background_16000_stellaris49.tga"

LoadingScreen = 
{ 
    size = 
        { 0, 0, 800, 600, }, 
    stylesheet = "HW2StyleSheet", 
    pixelUVCoords = 1, 
    RootElementSettings = 
    { 
        backgroundColor = 
            { 0, 0, 0, 255, }, }, 
; 
{ 
    type = "Frame", 
    position = 
        { 0, 100-delta_height, }, 	--{ 0, 100, }, 
    size = 
        { 800, 600, }, 	--{ 800, 400, }, 
    name = "bgImage", 
    BackgroundGraphic = 
    { 
        size = 
            { 800, 600, }, 	--{ 800, 400, }, 
        texture = LoadScreenPic[LoadScreenPicID], 	--dds has too much artifect
        textureUV = 
            { 0, 0, 1600, 1200, }, },  	--{ 0, 112, 1600, 910, }, }, 
; 
{ 
    type = "Frame", 
    position = 
        { 14, 378+delta_height, }, 
    size = 
        { 772, 16, }, 
    outerBorderWidth = 2, 
    borderColor = 
        { 107, 149, 172, 255, }, 
    backgroundColor = 
        { 0, 0, 0, 50, }, 
}, 
{ 
    type = "ProgressBar", 
    progressColor = 
        { progress_colourR, progress_colourG, progress_colourB, progress_colourA, }, 	--{ random(0,255), random(0,255), random(0,255), 200, },	--{ 240, 170, 0, 255, },
    position = 
        { 16, 380+delta_height, }, 
    size = 
        { 768, 12, }, 
    name = "loadingProgress", }, 
	--simplex version number
--	{
--		type = "TextLabel",
--		position = 
--	{
--		0,
--		476,	--580
--	},
--		size = 
--		{
--			200,
--			20,
--		},
--		wrapping = 1, 
--		Text = 
--		{
--			textStyle = "FEButtonTextStyle",
--			text = "Release: "..Simplex_Version,
--			color = 
--			{
--				255,
--				255,
--				255,
--				180,
--			},
--			vAlign = "Bottom",
--			hAlign = "Center",
--		},
--	},
}, 
-- text label for printing current module
{
	type = "TextLabel",
	name = "moduleLabel",
	position = 
	{
		0,
		476,	--580
	},
	size = 
	{
		800,
		20,
	},
	Text = 
	{
		textStyle = "FEButtonTextStyle",
		color = 
		{
			255,
			255,
			255,
			255,
		},
		vAlign = "Middle",
		hAlign = "Center",
	},
},
--random help tips
{
	type = "TextLabel",
	position = 
	{
		0+4,
		510,	--500
	},
	size = 
	{
		800-8,
		200,
	},
	wrapping = 1, 
	Text = 
	{
		textStyle = "FEButtonTextStyle",
		text = RandomLoadingText[random(RandomLoadingTextNum)],
		color = 
		{
			255,
			255,
			255,
			255,
		},
		vAlign = "Top",
		hAlign = "Center",
	},
},
{ 
    type = "TextLabel", 
    name = "moduleLabel", 
    position = 
        { 0, 550, }, 
    size = 
        { 0, 0, }, 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        color = 
            { 255, 255, 255, 255, }, 
        vAlign = "Middle", 
        hAlign = "Center", }, 
}, 
{ 
    type = "TextLabel", 
    name = "titleLabel1", 
    visible = 0, 
    size = 
        { 800, 50, }, 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        color = 
            { 255, 255, 255, 255, }, 
        vAlign = "Middle", 
        hAlign = "Left", }, 
}, 
{ 
    type = "TextLabel", 
    name = "titleLabel2", 
    position = 
        { 0, 50, }, 
    size = 
        { 800, 50, }, 
    visible = 0, 
    Text = 
    { 
        textStyle = "FEButtonTextStyle", 
        color = 
            { 255, 255, 255, 255, }, 
        vAlign = "Middle", 
        hAlign = "Left", }, }, 
}
