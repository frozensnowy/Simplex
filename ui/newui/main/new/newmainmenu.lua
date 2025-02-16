dofilepath("Data:UI\\NewUI\\About_Simplex.lua")
dofilepath("Data:UI\\NewUI\\RandomLoadingText.lua")

SimplexReleaseVersion = "4.3.2"


VersionColors = {255,255,255,255}
NewMainMenu =
{
    size = { 0, 0, 800, 600, },
    stylesheet = "HW2StyleSheet",
    RootElementSettings = { backgroundColor = { 0, 0, 0, 255, }, },
    pixelUVCoords = 1,
    onShow = [[
             if(iEngine==null or iPosition==null or iAction==null or iSound==null or iNum==null or iEngine==null or iLocked==null)then
                 iPosition = 513+290+240+120
                 UI_SetElementVisible("NewMainMenu","chickFrame",0)
                 iAction = 0
                 iSound = 0
                 iNum = 0
                 iEngine = 0
                 iLocked = 0

                 iShip_1 = 0
                 iShip_2 = 1000
                 iShip_3 = 4000
                 iShip_4 = 500
                 iShip_5 = 1500
                 iShip_6 = 2200
                 iShip_7 = 1400
                 iShip_8 = 3100
                 iShip_9 = 3700
                 iShip_10 = 1800
                 iShip_11 = 2700
                 iShip_12 = 2200
                 iShip_13 = 100
                 iShip_14 = 1000
                 iShip_15 = 900
                 iShip_16 = 2900

                 dofilepath("profiles:FXLibFile.lua")

                 if(iRepaint==nil)then
                     iRepaint = 1000
                 else
                     if(iRepaint<=0)then
                         iRepaint = 5
                     elseif(iRepaint>1000)then
                         iRepaint = 1000
                     end
                 end
             elseif(iEngine==0)then
                 iPosition = 513+290+240+120
                 UI_SetElementVisible("NewMainMenu","chickFrame",0)
                 iAction = 0
                 iSound = 0
                 iNum = 0
                 iEngine = 0
                 iLocked = 0
             else
                 iPosition = 513
                 UI_SetElementVisible("NewMainMenu","chickFrame",0)
                 iNum = 0
                 iEngine = 0
             end
             ]],
    onUpdate = [[
                   UI_SetTextLabelText("NewMainMenu", "lblRepaintText", iRepaint)
                   if(iShip_1<=4000)then
                       UI_SetElementPosition("NewMainMenu","ship01",iShip_1/4,250)
                       iShip_1 = iShip_1 + iRepaint / 1000
                   else
                       iShip_1 = 0
                   end
                   if(iShip_2>=0)then
                       UI_SetElementPosition("NewMainMenu","ship02",iShip_2/4,310)
                       iShip_2 = iShip_2 - iRepaint / 1000
                   else
                       iShip_2 = 4000
                   end
                   if(iShip_3>=0)then
                       UI_SetElementPosition("NewMainMenu","ship03",iShip_3/4,290)
                       iShip_3 = iShip_3 - iRepaint / 1000
                   else
                       iShip_3 = 4000
                   end
                   if(iShip_4<=4000)then
                       UI_SetElementPosition("NewMainMenu","ship04",iShip_4/4,265)
                       iShip_4 = iShip_4 + iRepaint / 1000
                   else
                       iShip_4 = 0
                   end
                   if(iShip_5<=4000)then
                       UI_SetElementPosition("NewMainMenu","ship05",iShip_5/4,225)
                       iShip_5 = iShip_5 + iRepaint / 1000
                   else
                       iShip_5 = 0
                   end
                   if(iShip_6>=0)then
                       UI_SetElementPosition("NewMainMenu","ship06",iShip_6/4,325)
                       iShip_6 = iShip_6 - iRepaint / 1000
                   else
                       iShip_6 = 4000
                   end
                   if(iShip_7>=0)then
                       UI_SetElementPosition("NewMainMenu","ship07",iShip_7/4,210)
                       iShip_7 = iShip_7 - iRepaint / 1000
                   else
                       iShip_7 = 4000
                   end
                   if(iShip_8>=0)then
                       UI_SetElementPosition("NewMainMenu","ship08",iShip_8/4,300)
                       iShip_8 = iShip_8 - iRepaint / 1000
                   else
                       iShip_8 = 4000
                   end
                   if(iShip_9>=0)then
                       UI_SetElementPosition("NewMainMenu","ship09",iShip_9/4,340)
                       iShip_9 = iShip_9 - iRepaint / 1000
                   else
                       iShip_9 = 4000
                   end
                   if(iShip_10>=0)then
                       UI_SetElementPosition("NewMainMenu","ship10",iShip_10/4,238)
                       iShip_10 = iShip_10 - iRepaint / 1000
                   else
                       iShip_10 = 4000
                   end
                   if(iShip_11<=4000)then
                       UI_SetElementPosition("NewMainMenu","ship11",iShip_11/4,255)
                       iShip_11 = iShip_11 + iRepaint / 1000
                   else
                       iShip_11 = 0
                   end
                   if(iShip_12>=0)then
                       UI_SetElementPosition("NewMainMenu","ship12",iShip_12/3,200)
                       iShip_12 = iShip_12 - iRepaint / 1000
                   else
                       iShip_12 = 3000
                   end
                   if(iShip_13>=0)then
                       UI_SetElementPosition("NewMainMenu","ship13",iShip_13/3,223)
                       iShip_13 = iShip_13 - iRepaint / 1000
                   else
                       iShip_13 = 3000
                   end
                   if(iShip_14>=0)then
                       UI_SetElementPosition("NewMainMenu","ship14",iShip_14/3,280)
                       iShip_14 = iShip_14 - iRepaint / 1000
                   else
                       iShip_14 = 3000
                   end
                   if(iShip_15<=4000)then
                       UI_SetElementPosition("NewMainMenu","ship15",iShip_15/4,360)
                       iShip_15 = iShip_15 + iRepaint / 1000
                   else
                       iShip_15 = 0
                   end
                   if(iShip_16<=4000)then
                       UI_SetElementPosition("NewMainMenu","ship16",iShip_16/4,350)
                       iShip_16 = iShip_16 + iRepaint / 1000
                   else
                       iShip_16 = 0
                   end

                   if(iAction==0)then
                       if(iPosition>513)then
                           if(iSound==0)then
                               iSound=1
                               UI_PlaySound("SFX_MainUIFrameShowSound")
                               if UI_IsNamedElementVisible("NewMainMenu", "RpaintFrame") == 0 then
                                   UI_SetElementVisible("NewMainMenu", "btnRepaint", 1)
                               else
                                   UI_SetElementVisible("NewMainMenu", "btnRepaint", 0)
                               end
                           end
                           if(iLocked==0 or iLocked==3)then
                               UI_SetElementEnabled("NewMainMenu","btnTutorial",0)
                               UI_SetElementEnabled("NewMainMenu","btnCampaign",0)
                               UI_SetElementEnabled("NewMainMenu","btnPlayerVsCPU",0)
                               UI_SetElementEnabled("NewMainMenu","btnMultiplayer",0)
                               UI_SetElementEnabled("NewMainMenu","btnProfile",0)
                               UI_SetElementEnabled("NewMainMenu","btnOptions",0)
                               UI_SetElementEnabled("NewMainMenu","btnMovies",0)
                               UI_SetElementEnabled("NewMainMenu","btnExit",0)
                               UI_SetElementEnabled("NewMainMenu","btnFull",0)
                               UI_SetElementEnabled("NewMainMenu","btnCredits",0)
							   UI_SetElementEnabled("NewMainMenu","btnInfo",0)
                               iLocked=1
                           end
                           if(iPosition>643)then
                               iNum=30 * iRepaint / 1000
                           elseif(iPosition>583)then
                               iNum=15 * iRepaint / 1000
                           elseif(iPosition>543)then
                               iNum=10 * iRepaint / 1000
                           elseif(iPosition>523)then
                               iNum=5 * iRepaint / 1000
                           elseif(iPosition>516)then
                               iNum=1 * iRepaint / 1000
                           elseif(iPosition>513)then
                               iNum=0.5 * iRepaint / 1000
                           end
                           iPosition = iPosition - iNum
                           UI_SetElementPosition("NewMainMenu","MainGameFrame",iPosition,164)
                       else
                           if(iLocked==1)then
                               UI_SetElementEnabled("NewMainMenu","btnExit",1)
                               UI_SetElementEnabled("NewMainMenu","btnMovies",1)
                               UI_SetElementEnabled("NewMainMenu","btnOptions",1)
                               UI_SetElementEnabled("NewMainMenu","btnProfile",1)
                               UI_SetElementEnabled("NewMainMenu","btnMultiplayer",1)
                               UI_SetElementEnabled("NewMainMenu","btnPlayerVsCPU",1)
                               UI_SetElementEnabled("NewMainMenu","btnCampaign",1)
                               UI_SetElementEnabled("NewMainMenu","btnTutorial",1)
                               UI_SetElementEnabled("NewMainMenu","btnFull",1)
							   UI_SetElementEnabled("NewMainMenu","btnInfo",0)
                               UI_SetElementEnabled("NewMainMenu","btnCredits",1)
                               iLocked=2
                           end
                       end
                   else
                       if(iPosition<803+240)then
                           if(iSound==0)then
                               iSound=1
                               UI_PlaySound("SFX_MainUIFrameHiddenSound")
                               if(iAction~=11)then
                                   UI_SetElementVisible("NewMainMenu", "btnRepaint", 0)
                                   UI_SetElementVisible("NewMainMenu", "RpaintFrame", 0)
                               end
                           end
                           if(iLocked==2)then
                               UI_SetElementEnabled("NewMainMenu","btnTutorial",0)
                               UI_SetElementEnabled("NewMainMenu","btnCampaign",0)
                               UI_SetElementEnabled("NewMainMenu","btnPlayerVsCPU",0)
                               UI_SetElementEnabled("NewMainMenu","btnMultiplayer",0)
                               UI_SetElementEnabled("NewMainMenu","btnProfile",0)
                               UI_SetElementEnabled("NewMainMenu","btnOptions",0)
                               UI_SetElementEnabled("NewMainMenu","btnMovies",0)
                               UI_SetElementEnabled("NewMainMenu","btnExit",0)
                               UI_SetElementEnabled("NewMainMenu","btnFull",0)
                               UI_SetElementEnabled("NewMainMenu","btnCredits",0)
							   UI_SetElementEnabled("NewMainMenu","btnInfo",0)
                               iLocked=3
                           end
                           if(iPosition>=643)then
                               iNum=30 * iRepaint / 1000
                           elseif(iPosition>=583)then
                               iNum=15 * iRepaint / 1000
                           elseif(iPosition>=543)then
                               iNum=10 * iRepaint / 1000
                           elseif(iPosition>=523)then
                               iNum=5 * iRepaint / 1000
                           elseif(iPosition>=516)then
                               iNum=1 * iRepaint / 1000
                           elseif(iPosition>=513)then
                               iNum=0.5 * iRepaint / 1000
                           end
                           iPosition = iPosition + iNum
                           UI_SetElementPosition("NewMainMenu","MainGameFrame",iPosition,164)
                       else
                           if(iAction==1)then
                               UI_ExitApp()
                           elseif(iAction==2)then
                               UI_ShowScreen("PlayMoviesScreen", eTransition)
                           elseif(iAction==3)then
                               UI_ShowScreen("ShipShowH", eTransition)
                           elseif(iAction==4)then
                               UI_ShowScreen("FEGameOptions", eTransition)
                           elseif(iAction==5)then
                               UI_SetNextScreen("UserProfile", "NewMainMenu")
                               UI_SetPreviousScreen("UserProfile", "NewMainMenu")
                               UI_ShowScreen("UserProfile", eTransition)
                           elseif(iAction==6)then
                               UI_ShowScreen('PatchScreen', eTransition)
                           elseif(iAction==7)then
                               UI_ShowScreen('ConnectionType', eTransition)
                           elseif(iAction==8 or iAction==9 or iAction==10)then
                               UI_HideScreen("NewMainMenu")
                           elseif(iAction==11)then
                               UI_SetElementEnabled("NewMainMenu","btnFull",1)
                           elseif(iAction==12)then
                               UI_ShowScreen('Draft', eTransition)
                           elseif(iAction==13)then
                               UI_ShowScreen('History', eTransition)
                           end
                       end
                   end
               ]],
;
----------------------------------------
{
    type = "Frame",
    name = "BackGroundFrame",
    position =
        { 0, 100, },
    size =
        { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/bg.dds",
        textureUV = { 0, 0, 1600, 800, },
    },
    visible = 1,
},
-----------------------------------------
{
    type = "Frame",
    name = "ship01",
    position = { 0, 0, },
    size = { 50, 12, },
    BackgroundGraphic =
    {
        size = { 50, 12, },
        texture = "DATA:UI/NewUI/Background/ship1_0.dds",
        textureUV = { 0, 0, 150, 36, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship06",
    position = { 0, 0, },
    size = { 28, 8, },
    BackgroundGraphic =
    {
        size = { 28, 8, },
        texture = "DATA:UI/NewUI/Background/ship2_1.dds",
        textureUV = { 0, 0, 175, 50, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship11",
    position = { 0, 0, },
    size = { 50, 12, },
    BackgroundGraphic =
    {
        size = { 50, 12, },
        texture = "DATA:UI/NewUI/Background/ship1_0.dds",
        textureUV = { 0, 0, 150, 36, },
    },
    visible = 1,
},
-----------------------------------------
--------------------------------------------
{
    type = "Frame",
    name = "ship04",
    position = { 0, 0, },
    size = { 28, 8, },
    BackgroundGraphic =
    {
        size = { 28, 8, },
        texture = "DATA:UI/NewUI/Background/ship2_0.dds",
        textureUV = { 0, 0, 175, 50, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship05",
    position = { 0, 0, },
    size = { 28, 8, },
    BackgroundGraphic =
    {
        size = { 28, 8, },
        texture = "DATA:UI/NewUI/Background/ship2_0.dds",
        textureUV = { 0, 0, 175, 50, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship14",
    position = { 0, 0, },
    size = { 10, 2, },
    BackgroundGraphic =
    {
        size = { 10, 2, },
        texture = "DATA:UI/NewUI/Background/ship5_1.dds",
        textureUV = { 0, 0, 250, 50, },
    },
    visible = 1,
},
--------------------------------------------
{ --���2
    type = "Frame",
    name = "light_gate_02",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
------------------------------------------------
{
    type = "Frame",
    name = "ship09",
    position = { 0, 0, },
    size = { 40, 8, },
    BackgroundGraphic =
    {
        size = { 40, 8, },
        texture = "DATA:UI/NewUI/Background/ship4_1.dds",
        textureUV = { 0, 0, 250, 50, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship16",
    position = { 0, 0, },
    size = { 20, 6, },
    BackgroundGraphic =
    {
        size = { 20, 6, },
        texture = "DATA:UI/NewUI/Background/ship6_0.dds",
        textureUV = { 0, 0, 225, 68, },
    },
    visible = 1,
},
-------------------------------------------------
{ --���3
    type = "Frame",
    name = "light_gate_03",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
--------------------------------------------
{
    type = "Frame",
    name = "ship03",
    position = { 0, 0, },
    size = { 50, 12, },
    BackgroundGraphic =
    {
        size = { 50, 12, },
        texture = "DATA:UI/NewUI/Background/ship1_1.dds",
        textureUV = { 0, 0, 150, 36, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship08",
    position = { 0, 0, },
    size = { 27, 9, },
    BackgroundGraphic =
    {
        size = { 27, 9, },
        texture = "DATA:UI/NewUI/Background/ship3_1.dds",
        textureUV = { 0, 0, 225, 75, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship10",
    position = { 0, 0, },
    size = { 40, 8, },
    BackgroundGraphic =
    {
        size = { 40, 8, },
        texture = "DATA:UI/NewUI/Background/ship4_1.dds",
        textureUV = { 0, 0, 250, 50, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship15",
    position = { 0, 0, },
    size = { 20, 6, },
    BackgroundGraphic =
    {
        size = { 20, 6, },
        texture = "DATA:UI/NewUI/Background/ship6_0.dds",
        textureUV = { 0, 0, 225, 68, },
    },
    visible = 1,
},
---------------------------------------------
{ --���4
    type = "Frame",
    name = "light_gate_04",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
--------------------------------------------
{
    type = "Frame",
    name = "ship02",
    position = { 0, 0, },
    size = { 50, 12, },
    BackgroundGraphic =
    {
        size = { 50, 12, },
        texture = "DATA:UI/NewUI/Background/ship1_1.dds",
        textureUV = { 0, 0, 150, 36, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship07",
    position = { 0, 0, },
    size = { 27, 9, },
    BackgroundGraphic =
    {
        size = { 27, 9, },
        texture = "DATA:UI/NewUI/Background/ship3_1.dds",
        textureUV = { 0, 0, 225, 75, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship12",
    position = { 0, 0, },
    size = { 10, 2, },
    BackgroundGraphic =
    {
        size = { 10, 2, },
        texture = "DATA:UI/NewUI/Background/ship5_1.dds",
        textureUV = { 0, 0, 250, 50, },
    },
    visible = 1,
},
{
    type = "Frame",
    name = "ship13",
    position = { 0, 0, },
    size = { 10, 2, },
    BackgroundGraphic =
    {
        size = { 10, 2, },
        texture = "DATA:UI/NewUI/Background/ship5_1.dds",
        textureUV = { 0, 0, 250, 50, },
    },
    visible = 1,
},
-------------------------------------------
{ --���5
    type = "Frame",
    name = "light_gate_05",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
{ --���5
    type = "Frame",
    name = "light_gate_05_2",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
{ --���5
    type = "Frame",
    name = "light_gate_05_3",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
{ --���5
    type = "Frame",
    name = "light_gate_05_4",
    position = { 0, 100, },
    size = { 800, 400, },
    BackgroundGraphic =
    {
        size = { 800, 400, },
        texture = "DATA:UI/NewUI/Background/lights.dds",
        textureUV = { 0, 0, 800, 400, },
    },
    visible = 1,
},
-----------------------------------------
{
    type = "Frame",
    name = "BackGroundFrame2",
    position = { 0, 160, },
    size = { 200, 260, },
    BackgroundGraphic =
    {
        size = { 200, 260, },
        texture = "DATA:UI/NewUI/Background/bg2.dds",
        textureUV = { 0, 120, 400, 640, },
    },
    visible = 1,
},
---------------------------------------
{
    type = "TextButton",
    name = "btnFull",
    position = {0,0},
    size = { 800, 600, },
    onMouseClicked = [[
                     if(iAction==0)then
                         iAction=11
                     else
                         iAction=0
                     end
                     iSound=0;
                     ]],
},
--------------------------------------------------------------
{
    type = "TextButton",
    name = "btnRepaint",
    position = {0,0},
    size = { 24, 12, },
    borderWidth = 1,
    pressedBorderColor = "FEColorScrollButtonOver",
    overBorderColor = { 119, 166, 255, 255, },
    overTextColor = {255,210,0,255},
    pressedTextColor = {255,210,0,255},
    Text =
    {
        text = ">",
        font = "ButtonFont",
        hAlign = "Center",
        vAlign = "Middle",
        color = { 0, 0, 0, 0, },
        offset = { 0, 0, },
    },
    visible = 1,
    soundOnClicked = "SFX_ButtonClick",
    onMouseClicked = [[
                     UI_SetElementVisible("NewMainMenu", "btnRepaint", 0);
                     UI_SetElementVisible("NewMainMenu", "RpaintFrame", 1);
                     ]],
},
{
    type = "Frame",
    name = "RpaintFrame",
    position = { 0, 0},
    size = { 90, 38, },
    visible = 0,
    ;
    {
    type = "Frame",
    outerBorderWidth = 1,
    borderColor = { 119, 166, 255, 255, },
    position = { 1, 1},
    size = { 88, 12, },
    ;
    {
    type = "TextLabel",
    name = "lblRepaintText",
    size = { 40, 12, },
    hAlign = "Center",
    Text =
    {
        text = "",
        font = "ButtonFont",
        hAlign = "Center",
        vAlign = "Middle",
        color = { 255, 255, 255, 255, },
        offset = { 0, 0, },
    }, }, },
    {
        type = "TextButton",
        buttonStyle = "FEButtonStyle1",
        position = { 0, 14},
        size = { 22, 12, },
        text = "<<",
        onMouseClicked = [[
                           iRepaint = iRepaint - 50
                           if(iRepaint<=0)then
                               iRepaint = 5
                           end
                         ]],
    },
    {
        type = "TextButton",
        buttonStyle = "FEButtonStyle1",
        position = { 22, 14},
        size = { 23, 12, },
        text = "<",
        onMouseClicked = [[
                           iRepaint = iRepaint - 5
                           if(iRepaint<=0)then
                               iRepaint = 5
                           end
                         ]],
    },
    {
        type = "TextButton",
        buttonStyle = "FEButtonStyle1",
        position = { 45, 14},
        size = { 23, 12, },
        text = ">",
        onMouseClicked = [[
                           iRepaint = iRepaint + 5
                           if(iRepaint>1000)then
                               iRepaint = 1000
                           end
                         ]],
    },
    {
        type = "TextButton",
        buttonStyle = "FEButtonStyle1",
        position = { 68, 14},
        size = { 22, 12, },
        text = ">>",
        onMouseClicked = [[
                           iRepaint = iRepaint + 50
                           if(iRepaint>1000)then
                               iRepaint = 1000
                           end
                         ]],
    },
    {
        type = "TextButton",
        buttonStyle = "FEButtonStyle1",
        position = { 0, 26},
        size = { 90, 12, },
        text = "$3336",
        onMouseClicked = [[
                           UI_SetElementVisible("NewMainMenu", "btnRepaint", 1);
                           UI_SetElementVisible("NewMainMenu", "RpaintFrame", 0);
                         ]],
    },
},
---------------------------------------------------------------
{
    type = "Frame",
    name = "MainGameFrame",
    autosize = 1,
    --backgroundColor = "FEColorBackground1",
    position = { 513+290+240, 164, },
    autoarrange = 1,
    autoarrangeWidth = 304,
    autoarrangeSpace = 0,
    --maxSize = { 273, 500, },
    maxSize = { 290, 500, },
;
{
    type = "Frame",
    size =
        { 304, 2, },
},
-----------------
{
    type = "TextLabel",
    name = "Simplex",
    size = { 255, 13, },
    Text =
    {
        text = "Simplex - an idea by Frozen Snow",
        font = "ButtonFont",
        hAlign = "Center",
        vAlign = "Middle",
        --color = { 119, 166, 255, 255, },
        color = VersionColors,
        offset = { -2, 0, }, }, },
----------------------
{
    type = "Frame",
    size =
        { 304, 2, },
},
----
{
    type = "TextLabel",
    name = "ModVersion",
    size = { 255, 13, },
    Text =
    {
        text = "Version "..SimplexReleaseVersion,
        font = "ButtonFont",
        hAlign = "Center",
        vAlign = "Middle",
        --color = { 119, 166, 255, 255, },
        color = VersionColors,
        offset = { -2, 0, }, }, },
----
{
    type = "Frame",
    size =
        { 304, 4, },
},
{
    type = "Frame",
    size =
        { 4, 50, },
},
{
    type = "Frame",
    outerBorderWidth = 1,
    --borderColor = "FEColorOutline",
    backgroundColor = "FEColorBackground1",
    borderColor = { 255, 255, 255, 50, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeSpace = 2,
    autoarrangeWidth = 256,
;
----
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "TextButton",
    buttonStyle = "FEButtonStyle1",
    text = "$2603",
    name = "btnCampaign",
    width = 240,
    onMouseClicked = [[iEngine=1;iAction=9;UI_ShowScreen("NewMainMenu", ePopup);iSound=0;]],
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "TextButton",
    buttonStyle = "FEButtonStyle1",
    text = "$2602",
    visible = 1,
	enabled = 1,
    name = "btnTutorial",
    width = 240,
    onMouseClicked = [[iEngine=1;iAction=10;UI_ShowScreen("NewMainMenu", ePopup);iSound=0;]],
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					-- Player VS CPU
					text = "$2604",
					name = "btnPlayerVsCPU",
					width = 240,
					onMouseClicked =
					[[
						UI_ReloadScreen("Background");
						UI_ToggleScreen("GameSetup", 1);
						UI_ShowScreen("GameSetup", ePopup);
						UI_SetElementVisible( "GameSetup", "frmRootChatBoxNew", 1 );
						UI_ShowScreen("GameSetup_HelpTip", ePopup);
						UI_ReloadScreen("GameSetup_HelpTip");

					]],
				},
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "Frame",
    size = { 296, 4, },
},
			{
				type = "ListBoxItem",
				autosize = 1,
				autoarrange = 1,
				autoarrangeSpace = 1,
				;
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					-- Multiplayer (even newer)
					text = "$2614",
					name = "btnMultiplayer",
					width = 240,
					onMouseClicked =
					[[
						UI_ShowScreen("ConnectionType", eTransition);
						UI_SetElementVisible( "GameSetup", "frmRootChatBoxNew", 0 );
					]],
				},
			},
----
{
    type = "Frame",
    size = { 296, 4, },
},
----
--{
 --   type = "TextButton",
 --   buttonStyle = "FEButtonStyle1",
 --   width = 240,
 --   name = "btnVersionUpdate",
--   enabled = 1,
 --   text = "$2605",
--    onMouseClicked = [[iAction=6;iSound=0;]],
--    --"UI_ShowScreen('PatchScreen', eTransition);",
--},
{
    type = "TextButton",
    buttonStyle = "FEButtonStyle1",
    text = "$2616",
    name = "btnProfile",
    width = 240,
    onMouseClicked = [[iAction=5;iSound=0;]],
    --[[	UI_SetNextScreen("UserProfile", "NewMainMenu"); UI_SetPreviousScreen("UserProfile", "NewMainMenu"); UI_ShowScreen("UserProfile", eTransition)]],
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "TextButton",
    buttonStyle = "FEButtonStyle1",
    text = "$2607",
    name = "btnOptions",
    width = 240,
    onMouseClicked = [[iAction=4;iSound=0;]],
    --[[UI_ShowScreen("FEGameOptions", eTransition)]],
},
----
{
    type = "Frame",
    size = { 296, 4, },
},
{
    type = "TextButton",
    buttonStyle = "FEButtonStyle1",
    text = "CUTSCENES",
    name = "btnMovies",
    width = 240,
    onMouseClicked = [[iAction=2;iSound=0;]],
    --[[UI_ShowScreen("PlayMoviesScreen", eTransition)]],
},
{
    type = "Frame",
    size = { 296, 4, },
},
{
				type = "ListBoxItem",
				autosize = 1,
				autoarrange = 1,
				autoarrangeSpace = 1,
				;
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					-- Credits
					-- should actually be set within ui.ucs
					text = "CREDITS",
					name = "btnCredits",
					width = 240,
					onMouseClicked = [[UI_ShowScreen("CreditsScreen", eTransition)]],
				},
			},
{
    type = "Frame",
    size = { 296, 4, },
},
{
				type = "ListBoxItem",
				autosize = 1,
				autoarrange = 1,
				autoarrangeSpace = 1,
				;
				{
					type = "TextButton",
					buttonStyle = "FEButtonStyle1",
					text = "ABOUT & FAQ",
					name = "btnInfo",
					width = 240,
enabled = 0,
					onMouseClicked = [[UI_ShowScreen("Information", eTransition)]],
				},
			},
{
    type = "Frame",
    size = { 296, 4, },
},

{
    type = "Frame",
    size = { 296, 4, },
},
----

-----------------------------------------------------
------------------------------------------------------
--{
--    type = "Frame",
--    size = { 296, 15, },
--},
----
{
    type = "Frame",
    name = "chickFrame",
    size = { 296, 4, },
    visible = 0,
},

----
{
    type = "TextButton",
    buttonStyle = "FEButtonStyle2",
    text = "$2609",
    name = "btnExit",
    width = 240,
    onMouseClicked = [[iAction=1;iSound=0;]], },
    --"UI_ExitApp();", },
},
{
    type = "Frame",
    size =
        { 300, 4, }, },
},
{
    type = "TextListBoxItem",
    buttonStyle = "FEListBoxItemButtonStyle",
    name = "m_levelListBoxItem",
    visible = 0,
    enabled = 0,
    Text =
    {
        textStyle = "FEListBoxItemTextStyle", },
},
--{
--    type = "TextLabel",
--    name = "lblVersion",
--    size = { 400, 13, },
--    position = { (578 + -400), (518 + -56), },
--    Text =
--    {
--        text = "$1221",
--        font = "ButtonFont",
--        hAlign = "Right",
--        vAlign = "Top",
--        color = { 119, 166, 191, 255, },
--        offset = { -2, 0, }, }, },
--{
--    type = "TextLabel",
--    name = "lblVersionaFX",
--    size = { 400, 13, },
--    position = { (578 + -400), (518 + -46), },
--    Text =
--    {
--        text = "FXmod v1.9",
--        font = "ButtonFont",
--        hAlign = "Right",
--        vAlign = "Top",
--        color = { 119, 166, 191, 255, },
--        offset = { -2, 0, }, }, },
	{
		type = "RadioButton",
		position = {20, 100},
		size = {280,70,},
		name = "button1",
		onMouseClicked = [[UI_SetElementVisible("NewMainMenu", "frame1", 1-UI_IsNamedElementVisible("NewMainMenu", "frame1"));]],
--		DefaultGraphic =
--		{
--			texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
--			textureUV = {5,43,38,63,},
--		},
--		PressedGraphic =
--		{
--			texture = "DATA:UI\\NewUI\\musicmenuimage\\MusicPlayerIcons.tga",
--			textureUV = {255,43,288,65,},
--		},
	},

	-- Panel frame
	{
		type = "Frame",
		name = "frame1",
		visible = 0,
		autosize = 1,
		--backgroundColor = "FEColorBackground1",
		--backgroundColor =  {100,100,100,0},		--255
		style = "FEPopupBackgroundStyle",
		position = {0, 420},
		autoarrange = 1,
		autoarrangeWidth = 152,
		autoarrangeSpace = 0,
		maxSize = {135, 500},	--{273, 500},
		;
		-- Spacer
		{
			type = "Frame",
			size = {152, 2},
		},
		-- Panel Title
		{
			type = "TextLabel",
			size = {152, 13},
			Text =
			{
				textStyle = "FEHeading3",
				text = "GENIUS BAR",
				offset = {8, 0},
			},
		},
		-- Spacer
		{
			type = "Frame",
			size = {152, 2},
		},
		-- Panel Subtitle
		{
			type = "TextLabel",
			name = "m_lblSubTitle",
			size = {152, 10},
			Text =
			{
				textStyle = "FEHeading4",
				-- SELECT//
				text = "$2618",		--"$2618",
				offset = {8, 0},
			},
		},
		-- Spacer
		{
			type = "Frame",
			size = {152, 4},
		},
		-- Left edge spacer
		{
			type = "Frame",
			size = {4, 50},
--			backgroundColor = {100,100,100,255},
		},
		-- Button list frame
		{
	    type = "Frame",
	    --outerBorderWidth = 2,
	    borderColor = "FEColorOutline",
	    autosize = 1,
	    autoarrange = 1,
	    autoarrangeSpace = 2,
	    autoarrangeWidth = 128,
			;
			{
					type = "TextButton",
					buttonStyle = "FEButtonStyleMainMenu",	--"FEButtonStyle1_Original",
					-- Hide Main Menu
					visible = 1,
					text = "NSFW",
					name = "btnNSFW",
					width = 120,
					onMouseClicked = [[
					UI_SetElementVisible("NewMainMenu", "mainframe", 1-UI_IsNamedElementVisible("NewMainMenu", "mainframe"));
					]],
			},
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyleMainMenu",	--"FEButtonStyle1_Original",
				-- EULA
				text = "EULA",
				name = "btnEULA",
				width = 120,
				onMouseClicked = [[UI_SetScreenVisible("EULA", 1)]],
			},
			{
				type = "TextButton",
				buttonStyle = "FEButtonStyleMainMenu",	--"FEButtonStyle1_Original",
				-- MEME
				text = "MEME",
				name = "btnMEME",
				width = 120,
				onMouseClicked = [[
    		UI_PlaySound('SFX_BringSajuukToBear');
				UI_SetScreenVisible("meme", 1);
				]],
			},
		},

		-- bottom Spacer
		{
			type = "Frame",
			size = {150,4},
			--backgroundColor = {100,100,100,255},
		},
	},

}
