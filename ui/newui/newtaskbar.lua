-- LuaDC version 0.9.19
-- 02/05/2005 18.41.25
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
BUILDCOLOR =
    { 244, 213, 0, 225, }	--{ 244, 213, 0, 255, }
RESEARCHCOLOR =
    { 124, 200, 196, 225, }	--{ 124, 200, 196, 255, }
LAUNCHCOLOR =
    { 83, 202, 0, 225, }	--{ 83, 202, 0, 255, }
TASKBAR_MISCCOLOR =
    { 200, 200, 200, 225, }	--{ 200, 200, 200, 255, }		--0,244,255,255 for blue
TASKBAR_ABILITIESCOLOR =
    { 200, 200, 200, 127, }	--{ 200, 200, 200, 160, }		--90, 155, 211, 160 for blue
NewTaskbar =
{
    size =
        { 0, 498, 800, 102, },
    onHide = "UI_HideScreen('selector'); UI_HideScreen('MusicMenu')",
    stylesheet = "HW2StyleSheet",
    pixelUVCoords = 1,
    callUpdateWhenInactive = 1,
    minimizedPos =
        { 0, 565, },
    fstringShipCount = "$2764",
    healthBarGoodColor =
        { 0, 255, 0, 225, }, 	--{ 0, 255, 0, 255, },
    healthBarPoorColor =
        { 255, 255, 0, 225, }, 	--{ 255, 255, 0, 255, },
    healthBarFatalColor =
        { 255, 0, 0, 225, }, 	--{ 255, 0, 0, 255, },
    healthBarBackgroundColor =
        { 128, 128, 128, 225, }, 	--{ 128, 128, 128, 255, },
    healthBarEnemyColor =
        { 255, 0, 0, 225, }, 	--{ 255, 0, 0, 255, },
    healthBarEnemyBackgroundColor =
        { 128, 0, 0, 225, }, 	--{ 128, 0, 0, 255, },
    healthBarAlliedBackgroundColor =
        { 255, 255, 0, 225, }, 	--{ 255, 255, 0, 255, },
    healthBarAlliedBackgroundColor =
        { 128, 0, 0, 225, }, 	--{ 128, 0, 0, 255, },
    soundOnShow = "SFX_TaksbarMenuONOFF",
    soundOnHide = "SFX_TaksbarMenuONOFF",
    Regions =
        {
            { 0, 15, 221, 87, },
            { 216, 0, 367, 102, },
            { 581, 15, 219, 87, },
        },
;
{
    type = "Frame",
    name = "blackBg",
    position =
        { 0, 16, },
    size =
        { 800, 86, },
    backgroundColor =
        { 0, 0, 0, 0, },
    giveParentMouseInput = 1,
},
{
    type = "Frame",
    position =
        { 0, 0, },
    size =
        { 800, 102, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\bbackground1600_new.tga",
        textureUV =
            { 0, 0, 800*2, 102*2, }, },
    giveParentMouseInput = 1,
},

{
		type = "Button",
		position = {218,1},
		size = {12, 12},
		name = "btnClear",
		onMouseClicked = "ClearAllControlGroups()",
		helpTip = "CLEAR CONTROL GROUPS",
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick",
		DefaultGraphic =
		{
			position = {0, 0},
			size = {12,12},
		        texture = "DATA:UI\\NewUI\\Taskbar\\ClearGroups.tga",
			textureUV = {0,0,32,32},
			color = OUTLINECOLOR,
		},
		OverGraphic =
	        {
	        texture = "DATA:UI\\NewUI\\Taskbar\\ClearGroupsO.tga",
	        textureUV = { 0, 0, 32, 32, }, },
	        PressedGraphic =
	        {
	        texture = "DATA:UI\\NewUI\\Taskbar\\ClearGroups.tga",
	        textureUV = { 0, 0, 32, 32, }, },
	},

	{
		type = "Button",
		position = {573,1},
		size = {12, 12},
		name = "btnClear",
		onMouseClicked = "ClearSelectedFromControlGroups()",
		helpTip = "CLEAR SELECTION FROM GROUPS",
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick",
		DefaultGraphic =
		{
			position = {0, 0},
			size = {12,12},
		        texture = "DATA:UI\\NewUI\\Taskbar\\ClearGroups1.tga",
			textureUV = {0,0,32,32},
			color = OUTLINECOLOR,
		},
		OverGraphic =
	        {
	        texture = "DATA:UI\\NewUI\\Taskbar\\ClearGroups1O.tga",
	        textureUV = { 0, 0, 32, 32, }, },
	        PressedGraphic =
	        {
	        texture = "DATA:UI\\NewUI\\Taskbar\\ClearGroups1.tga",
	        textureUV = { 0, 0, 32, 32, }, },
	},

{
    type = "TextButton",
    position =
        { 220, 3, },
    buttonStyle = "Taskbar_ControlGroups1ButtonStyle",
    Text =
    {
        text = "1", },
    name = "btnControlGroup1",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 1)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 0, 0, 33*2, 11*2, },
        color =
            { 255, 0, 0, 0, }, }, 	--{ 0, 160, 255, 0, },
},
{
    type = "TextButton",
    position =
        { 247, 3, },
    buttonStyle = "Taskbar_ControlGroups1ButtonStyle",
    Text =
    {
        text = "2", },
    name = "btnControlGroup2",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 2)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 0, 0, 33*2, 11*2, },
        color =
            { 255, 153, 0, 0, }, },
},
{
    type = "TextButton",
    position =
        { 274, 3, },
    buttonStyle = "Taskbar_ControlGroups1ButtonStyle",
    Text =
    {
        text = "3", },
    name = "btnControlGroup3",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 3)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 0, 0, 33*2, 11*2, },
        color =
            { 255, 255, 0, 0, }, },
},
{
    type = "TextButton",
    position =
        { 301, 3, },
    buttonStyle = "Taskbar_ControlGroups1ButtonStyle",
    Text =
    {
        text = "4", },
    name = "btnControlGroup4",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 4)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 0, 0, 33*2, 11*2, },
        color =
            { 102, 255, 0, 0, }, },
},
{
    type = "TextButton",
    position =
        { 328, 3, },
    buttonStyle = "Taskbar_ControlGroups1ButtonStyle",
    Text =
    {
        text = "5", },
    name = "btnControlGroup5",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 5)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 0, 0, 33*2, 11*2, },
        color =
            { 0, 255, 0, 0, }, },
},
{
    type = "TextButton",
    position =
        { 442, 3, },
    buttonStyle = "Taskbar_ControlGroups2ButtonStyle",
    Text =
    {
        text = "6", },
    name = "btnControlGroup6",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 6)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 33*2, 0, 0, 11*2, },
        color =
            { 0, 255, 153, 0, }, },
},
{
    type = "TextButton",
    position =
        { 469, 3, },
    buttonStyle = "Taskbar_ControlGroups2ButtonStyle",
    Text =
    {
        text = "7", },
    name = "btnControlGroup7",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 7)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 33*2, 0, 0, 11*2, },
        color =
            { 0, 255, 255, 0, }, },
},
{
    type = "TextButton",
    position =
        { 496, 3, },
    buttonStyle = "Taskbar_ControlGroups2ButtonStyle",
    Text =
    {
        text = "8", },
    name = "btnControlGroup8",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 8)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 33*2, 0, 0, 11*2, },
        color =
            { 0, 153, 255, 0, }, },
},
{
    type = "TextButton",
    position =
        { 523, 3, },
    buttonStyle = "Taskbar_ControlGroups2ButtonStyle",
    Text =
    {
        text = "9", },
    name = "btnControlGroup9",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 9)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 33*2, 0, 0, 11*2, },
        color =
            { 0, 0, 255, 0, }, },
},
{
    type = "TextButton",
    position =
        { 550, 3, },
    buttonStyle = "Taskbar_ControlGroups2ButtonStyle",
    Text =
    {
        text = "10", },
    name = "btnControlGroup10",
    onMouseClicked = "MainUI_UserEventData( eSelectGroup, 10)",
    onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "$2761",
    helpTipTextLabel = "commandsHelpTip",
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\controlgroups1600_new.tga",
        textureUV =
            { 33*2, 0, 0, 11*2, },
        color =
            { 102, 0, 255, 0, }, },
},
{
    type = "Button",
    position =
        { 356, 3, },
    size =
        { 91, 11, },
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\hide1_new.tga",
        textureUV =
            { 0, 0, 182, 22, }, },
    OverGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\hide1_OVER_new.tga",
        textureUV =
            { 0, 0, 182, 22, }, },
    name = "btnHide1",
    onMouseClicked = "UI_HideScreen('NewBuildMenu'); UI_HideScreen('NewResearchMenu'); UI_HideScreen('NewLaunchMenu'); UI_HideScreen('MusicMenu')",
    helpTip = "$2738",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 55,     --backspace
},
{
    type = "Button",
    position =
        { 356, 3, },
    size =
        { 91, 11, },
    visible = 0,
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\hide2_new.tga",
        textureUV =
            { 0, 0, 182, 22, }, },
    OverGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\hide2_OVER_new.tga",
        textureUV =
            { 0, 0, 182, 22, }, },
    name = "btnHide2",
    helpTip = "$2739",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 55,      --backspace
},
{
    type = "TextButton",
    toggleButton = 1,
    position =
        { 5, 19, },
    size =
        { 68, 13, },
    buttonStyle = "Taskbar_PanelButtonStyle",
    backgroundColor = TASKBAR_MISCCOLOR,
    overColor = TASKBAR_MISCCOLOR,
    pressedColor = TASKBAR_MISCCOLOR,
    textColor = TASKBAR_MISCCOLOR,
    Text =
    {
        textStyle = "Taskbar_PanelButtonTextStyle",
        text = "$2705", },
    name = "btnFleet",
    onMouseClicked = "UI_ToggleScreen( 'FleetMenu', 0)",
    helpTip = "$2740",
    helpTipTextLabel = "commandsHelpTip",
    clickedTextColor =
        { 0, 0, 0, 255, },
    ClickedGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\panelbutton.tga",
        textureUV =
            { 0, 0, 64, 13, }, },
},
{
    type = "TextButton",
    position =
        { 83, 19, },
    size =
        { 67, 13, },
    buttonStyle = "Taskbar_PanelButtonStyle",
    toggleButton = 1,
    Text =
    {
        textStyle = "Taskbar_PanelButtonTextStyle",
        text = "$2714", },
    name = "btnStrike",
    onMousePressed = "UI_ToggleScreen( 'StrikeGroupsMenu', 0)",
    helpTip = "$2741",
    helpTipTextLabel = "commandsHelpTip",
    soundOnClicked = "",
    soundOnPressed = "SFX_ButtonClick",
    backgroundColor = TASKBAR_MISCCOLOR,
    overColor = TASKBAR_MISCCOLOR,
    pressedColor = TASKBAR_MISCCOLOR,
    textColor = TASKBAR_MISCCOLOR,
    clickedTextColor =
        { 0, 0, 0, 255, },
    ClickedGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\panelbutton.tga",
        textureUV =
            { 0, 0, 64, 13, }, },
},
{
    type = "TextButton",
    position =
        { 152, 19, },
    size =
        { 67, 13, },
    buttonStyle = "Taskbar_PanelButtonStyle",
    toggleButton = 1,
    Text =
    {
        textStyle = "Taskbar_PanelButtonTextStyle",
        text = "$2715", },
    name = "btnTactics",
    onMousePressed = "UI_ToggleScreen( 'TacticsMenu', 0)",
    helpTip = "$2742",
    helpTipTextLabel = "commandsHelpTip",
    soundOnClicked = "",
    soundOnPressed = "SFX_ButtonClick",
    backgroundColor = TASKBAR_MISCCOLOR,
    overColor = TASKBAR_MISCCOLOR,
    pressedColor = TASKBAR_MISCCOLOR,
    textColor = TASKBAR_MISCCOLOR,
    clickedTextColor =
        { 0, 0, 0, 255, },
    ClickedGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\panelbutton.tga",
        textureUV =
            { 0, 0, 64, 13, }, },
},

---chat
{
    type = "TextButton",
    position =
        { 229, 19, },
    size =
        { 25, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2716", },
    name = "btnChat",
    onMouseClicked = "UI_ToggleScreen( 'ChatScreen', 0)",
    helpTip = "$2747",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 131,
},

---events
{
    type = "TextButton",
    position =
        { 255, 19, },
    size =
        { 34, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2707", },
    name = "btnEvents",
    onMouseClicked = "UI_ToggleScreen( 'EventsScreen', 0)",
    helpTip = "$2743",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 140,
},
{
    type = "TextButton",
    visible = 0,
    position =
        { 255, 19, },
    size =
        { 34, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle_Wide",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2707", },
    name = "btnEvents_wide",
    onMouseClicked = "UI_ToggleScreen( 'EventsScreen', 0)",
    helpTip = "$2743",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 140,
},

---objectives
{
    type = "TextButton",
    position =
        { 290, 19, },
    size =
        { 39, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "OBJECTIVE", },
    name = "btnObjectives",
    onMouseClicked = "UI_ToggleScreen( 'ObjectivesList', 0)",
    helpTip = "$2744",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 137,
},

-- Mission Hub
{
    type = "TextButton",
    position = { 330, 19 },  -- We'll adjust this based on where we place it
    size = { 49, 13 },
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text = {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "MISSIONS",
    },
    name = "btnMissionHub",
    onMouseClicked = "UI_ToggleScreen('MissionHubScreen', 0)",
    helpTip = "Open Mission Hub",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 143,  -- We'll need to assign an appropriate hotkey ID
},

---sensors
{
    type = "TextButton",
    position =
        { 380, 19, },
    size =
        { 50, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2703", },
    name = "btnSensors",
    onMouseClicked = "MainUI_UserEvent( eSensorsManager)",
    helpTip = "$2745",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 54,
},

---diplomacy
{
    type = "TextButton",
    position =
        { 431, 19, },
    size =
        { 62, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2713", },
    name = "btnDiplomacy",
    onMouseClicked = "UI_ToggleScreen( 'DiplomacyScreen', 0)",
    helpTip = "$2746",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 141,
},

---speech
{
    type = "TextButton",
    position =
        { 494, 19, },
    size =
        { 45, 13, },
    visible = 0,
    buttonStyle = "Taskbar_MenuButtonStyle",
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "INFO", },
    name = "btnRecall",
    onMouseClicked = "UI_ToggleScreen( 'SpeechRecall', 0)",
    helpTip = "TOGGLE GAME INFO/HELP (F1)", 	--$2763
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 142,
},

---menu
{
    type = "TextButton",
    position =
        { 540, 19, },
    size =
        { 35, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle",
    toggleButton = 0,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2702", },
    name = "btnMenu",
    onMouseClicked = "MainUI_UserEvent( eMenu )",
    helpTip = "$2774",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 4,
},
{
    type = "TextButton",
    visible = 0,
    position =
        { 540, 19, },
    size =
        { 35, 13, },
    buttonStyle = "Taskbar_MenuButtonStyle_Wide",
    toggleButton = 0,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "$2702", },
    name = "btnMenu_wide",
    onMouseClicked = "MainUI_UserEvent( eMenu )",
    helpTip = "$2774",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 4,
},
{
    type = "TextButton",
    toggleButton = 1,
    position =
        { 585, 19, },
    size =
        { 68, 13, },
    buttonStyle = "Taskbar_PanelButtonStyle",
    backgroundColor = BUILDCOLOR,
    overColor = BUILDCOLOR,
    pressedColor = BUILDCOLOR,
    textColor = BUILDCOLOR,
    Text =
    {
        textStyle = "Taskbar_PanelButtonTextStyle",
        text = "BUILD", },
    name = "btnBuild",
    onMouseClicked = "MainUI_UserEventData( eBuildManager, 1)",
    helpTip = "BUILD MANAGER (B)",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 50,
},
{
    type = "TextButton",
    toggleButton = 1,
    position =
        { 655, 19, },
    size =
        { 69, 13, },
    buttonStyle = "Taskbar_PanelButtonStyle",
    backgroundColor = RESEARCHCOLOR,
    overColor = RESEARCHCOLOR,
    pressedColor = RESEARCHCOLOR,
    textColor = RESEARCHCOLOR,
    Text =
    {
        textStyle = "Taskbar_PanelButtonTextStyle",
        text = "$2701", },
    name = "btnResearch",
    onMouseClicked = "MainUI_UserEvent( eResearchManager)",
    helpTip = "RESEARCH MANAGER (R)",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 49,
},
{
    type = "TextButton",
    toggleButton = 1,
    position =
        { 726, 19, },
    size =
        { 69, 13, },
    buttonStyle = "Taskbar_PanelButtonStyle",
    backgroundColor = LAUNCHCOLOR,
    overColor = LAUNCHCOLOR,
    pressedColor = LAUNCHCOLOR,
    textColor = LAUNCHCOLOR,
    Text =
    {
        textStyle = "Taskbar_PanelButtonTextStyle",
        text = "$2706", },
    name = "btnLaunch",
    onMouseClicked = "MainUI_UserEventData( eLaunchManager, 1)",
    helpTip = "LAUNCH MANAGER (L)",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 52,
},
{
    type = "TextLabel",
    name = "commandsHelpTip",
    position =
        { 4, 1, },
    size =
        { 214, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 255, 255, 255, 255, },
        hAlign = "Left", },
},

---------COMMAND BUTTONS-------------------------------------------------------------------------------------------

{
    type = "Frame",
    position =
        { 3, 39, },
    name = "commandButtons",
    autosize = 1,
;
{
    type = "Frame",
    name = "commandButtonsFrame",
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 168,
    autoarrangeSpace = 0,
;
---Move-----------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnMove",
    onMouseClicked = "MainUI_UserEvent( eMove)",
    helpTip = "$2717",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 10,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 1*2, 31*2, 31*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 1*2, 31*2, 31*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Attack-----------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnAttack",
    onMouseClicked = "MainUI_UserEventData( eControlModifier, 0)",
    helpTip = "$2718",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 115,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 1*2, 63*2, 31*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 1*2, 63*2, 31*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---MoveAttack----------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnAttackMove",
    onMouseClicked = "MainUI_UserEvent( eMoveAttack )",
    helpTip = "$2724",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 25,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 97*2, 159*2, 127*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 97*2, 159*2, 127*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Guard-----------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnGuard",
    onMouseClicked = "MainUI_UserEvent( eGuard)",
    helpTip = "$2719",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 14,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 65*2, 1*2, 95*2, 31*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 65*2, 1*2, 95*2, 31*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Dock----------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnDock",
    onMouseClicked = "MainUI_UserEvent( eDock)",
    helpTip = "$2720",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 15,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 1*2, 127*2, 31*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 1*2, 127*2, 31*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Stop----------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnCancelOrders",
    onMouseClicked = "MainUI_UserEvent( eCancelOrders)",
    helpTip = "$2722",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 17,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 97*2, 63*2, 127*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 97*2, 63*2, 127*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Waipoynt-------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnWaypoint",
    onMouseClicked = "MainUI_UserEvent( eTempWaypoint)",
    helpTip = "$2727",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 56,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 33*2, 127*2, 63*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 33*2, 127*2, 63*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Harvest----------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnResource",
    onMouseClicked = "MainUI_UserEventData( eHarvest, 0); MainUI_UserEventData( eHarvest, 1);",
    helpTip = "$2723",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 12,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 33*2, 31*2, 63*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 33*2, 31*2, 63*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Hyperspace----------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnHyperspace",
    onMouseClicked = "MainUI_UserEvent( eHyperspace)",
    helpTip = "$2725",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 11,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 33*2, 63*2, 63*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 33*2, 63*2, 63*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Parade----------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnParade",
    onMouseClicked = "MainUI_UserEvent( eParade)",
    helpTip = "PARADE (SHIFT+P)",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 16,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UIParade.tga",
        textureUV =
              { -7, -8, 45, 45, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UIParade.tga",
        textureUV =
            { -7, -8, 45, 45, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Ping------------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnPing",
    onMouseClicked = "MainUI_UserEvent( eSensorPing)",
    helpTip = "PING (2000 RU) (X)",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 147,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 65*2, 159*2, 95*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 65*2, 159*2, 95*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Defence Field-----------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnDefenseField",
    onMouseClicked = "MainUI_UserEvent( eDefenseField)",
    helpTip = "DEFENSE FIELD/SPECIAL ABILITY (T)", 	--$2765
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 143,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 65*2, 31*2, 95*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 65*2, 31*2, 95*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Cloak--------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnCloak",
    onMouseClicked = "MainUI_UserEvent( eCloak)",
    helpTip = "$2766",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 144,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 65*2, 63*2, 95*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 33*2, 65*2, 63*2, 95*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Repair----------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnRepair",
    onMouseClicked = "MainUI_UserEvent( eRepair)",
    helpTip = "$2726",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 20,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 65*2, 33*2, 95*2, 63*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 65*2, 33*2, 95*2, 63*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Drop Mine----------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnMines",
    onMouseClicked = "MainUI_UserEvent( eDropMinesInstant)",
    helpTip = "$2772",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 24,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 65*2, 97*2, 95*2, 127*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 65*2, 97*2, 95*2, 127*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Rally Point--------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnRally",
    onMouseClicked = "MainUI_UserEvent( eRallyPoint)",
    helpTip = "$2721",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 138,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 1*2, 159*2, 31*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 1*2, 159*2, 31*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Object Point------------------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnRallyObject",
    onMouseClicked = "MainUI_UserEventData( eRallyObject, 0 )",
    helpTip = "$2767",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 22,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 97*2, 31*2, 127*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 1*2, 97*2, 31*2, 127*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Recycle-----------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnRetire",
    onMouseClicked = "MainUI_UserEvent( eRetire)",
    helpTip = "$2728",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 23,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 33*2, 159*2, 63*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 129*2, 33*2, 159*2, 63*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---EMP---------------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnEMP",
    onMouseClicked = "MainUI_UserEventData2( eSpecialAttack, 0, 2)",
    helpTip = "EMP/SPECIAL ATTACK (Z)", 	--$2768
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 146,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 65*2, 127*2, 95*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 65*2, 127*2, 95*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Callisto-----------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnCallisto",
    onMouseClicked = "MainUI_UserEventData2( eSpecialAttack, 0, 6)",
    helpTip = "CALLISTO MISSILE (Z)",
    helpTipTextLabel = "commandsHelpTip",
    -- hotKeyID = 147,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UICallisto.tga",
        textureUV =
              { -5, -8, 42, 42, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UICallisto.tga",
        textureUV =
            { -5, -8, 42, 42, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Perforate----------------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnPerforate",
    onMouseClicked = "MainUI_UserEventData2( eSpecialAttack, 0, 7)",
    helpTip = "PERFORATION POD (Z)",
    helpTipTextLabel = "commandsHelpTip",
    -- hotKeyID = 147,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UIPerforate.tga",
        textureUV =
              { -14, -9, 47, 47, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UIPerforate.tga",
        textureUV =
            { -14, -9, 47, 47, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Heavy Ion Cannon----------------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnHeavyIonCannon",
    onMouseClicked = "MainUI_UserEventData2( eSpecialAttack, 0, 8)",
    helpTip = "HEAVY ION CANNON (Z)",
    helpTipTextLabel = "commandsHelpTip",
    -- hotKeyID = 147,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UIHeavyIonCannon.tga",
        textureUV =
              { -5, -5, 51, 51, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UIHeavyIonCannon.tga",
        textureUV =
            { -5, -5, 51, 51, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Nuclear----------------------------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnNuclear",
    onMouseClicked = "MainUI_UserEventData2( eSpecialAttack, 0, 9)",
    helpTip = "NUCLEAR BOMB (Z)",
    helpTipTextLabel = "commandsHelpTip",
    -- hotKeyID = 147,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UINuclear.tga",
        textureUV =
              { -5, -5, 51, 51, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\UINuclear.tga",
        textureUV =
            { -5, -5, 51, 51, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
---Scuttle-----------------------------------------------------------------------------
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnScuttle",
    onMouseClicked = [[UI_SetElementVisible("NewTaskbar", "scuttleButtons", 1); UI_SetElementVisible("NewTaskbar", "commandButtons", 0);]],
    --onMouseClicked = "MainUI_UserEventData( eScuttle, 0 )",
    helpTip = "$2773",
    helpTipTextLabel = "commandsHelpTip",
    hotKeyID = 5,
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 97*2, 127*2, 127*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 97*2, 97*2, 127*2, 127*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
},
},
---Scuttle buttons confirm-------------------------------
{
    type = "Frame",
    position =
        { 0, 58, },
    name = "scuttleButtons",
    visible = 0,
    autosize = 1,
;
{
    type = "Frame",
    position =
        { 150, 1, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeSpace = 0,
;
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnScuttleConfirm",
    onMouseClicked = [[MainUI_UserEvent( eScuttle); UI_SetElementVisible("NewTaskbar", "scuttleButtons", 0); UI_SetElementVisible("NewTaskbar", "commandButtons", 1);]],
    helpTip = "CONFIRM SCUTTLE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 225*2, 97*2, 255*2, 127*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 225*2, 97*2, 255*2, 127*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
{
    type = "Button",
    buttonStyle = "Taskbar_CommandButtonStyleSmall",
    name = "btnScuttleCancel",
    onMouseClicked = [[UI_SetElementVisible("NewTaskbar", "scuttleButtons", 0); UI_SetElementVisible("NewTaskbar", "commandButtons", 1);]],
    helpTip = "$2613",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    size =
        { 20, 20, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 161*2, 1*2, 191*2, 31*2, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\command_icons1600_new.tga",
        textureUV =
            { 161*2, 1*2, 191*2, 31*2, },
        color =
            { 90, 155, 211, 160, },
        blackAndWhite = 1, },
    giveParentMouseInput = 1, },
},
},
},
---------END OF COMMAND BUTTONS-------------------------------------------------------------------------------------------

{
    type = "Frame",
    position =
        { 179, 38, },
    size =
        { 590, 64, },
    autoarrange = 1,
    autoarrangeWidth = 590,
    autoarrangeSpace = 1,
;
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip13",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip11",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip09",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip07",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip05",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip03",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip01",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip14",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip12",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip10",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip08",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip06",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip04",
},
{
    type = "Button",
    buttonStyle = "Taskbar_ShipButtonStyle",
    name = "btnShip02", },
},
{
    type = "Button",
    position =
        { 768, 40, },
    size =
        { 13, 28, },
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\shipnext_new.tga",
        textureUV =
            { 0, 0, 13, 28, }, },
    OverGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\shipnext_OVER.tga",
        textureUV =
            { 0, 0, 13, 28, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\shipnext_new.tga",
        textureUV =
            { 0, 0, 13, 28, },
        color =
            { 255, 255, 255, 128, }, },
    name = "btnShipNext",
    helpTip = "$2731",
    helpTipTextLabel = "commandsHelpTip",
    soundOnClicked = "SFX_ButtonClick",
},
{
    type = "Button",
    position =
        { 768, 71, },
    size =
        { 13, 28, },
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\shipprev_new.tga",
        textureUV =
            { 0, 0, 13, 28, }, },
    OverGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\shipprev_OVER.tga",
        textureUV =
            { 0, 0, 13, 28, }, },
    DisabledGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\shipprev_new.tga",
        textureUV =
            { 0, 0, 13, 28, },
        color =
            { 255, 255, 255, 128, }, },
    name = "btnShipPrev",
    helpTip = "$2730",
    helpTipTextLabel = "commandsHelpTip",
    soundOnClicked = "SFX_ButtonClick",
},
{
    type = "Frame",
    position =
        { 176, 37, },
    size =
        { 620, 68, },
    name = "unitStats",
;
{
    type = "Frame",
    position =
        { 0, 2, },
    size =
        { 608, 61, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\unitstats_border.mres",
        textureUV =
            { 0, 0, 608, 61, }, },
},
{
    type = "Button",
    position =
        { 211, 0, },
    size =
        { 200, 64, },
    name = "unitIcon",
    backgroundGraphicHAlign = "Center",
    backgroundGraphicVAlign = "Center",
},
{
    type = "Frame",
    position =
        { 215, 3, },
    size =
        { 391, 59, },
;
{
    type = "Button",
    position =
        { 20, 7, },
    size =
        { 140, 35, },
    name = "unitIcon1",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "SELECTED UNIT",
    helpTipTextLabel = "commandsHelpTip",
},
{
    type = "ProgressBar",
    backgroundColor =
        { 0, 128, 0, 255, },
    progressColor =
        { 0, 255, 0, 255, },
    borderColor =
        { 0, 0, 0, 255, },
    outerBorderWidth = 1,
    position =
        { 50, 50, },
    size =
        { 100, 2, },
    name = "unitProgress",
},


{
		type = "Frame",
		position = {136, 15},
		size = { 32, 32},
		name = "bm_kinetic",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_blackmarketset_1600kinetic.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Mammoth Cannon Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {136, 15},
		size = { 32, 32},
		name = "bm_boomer",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_blackmarketset_1600boomer.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Ack-Ack Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {136, 15},
		size = { 32, 32},
		name = "bm_mortar",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_blackmarketset_1600mortar.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Fusion Mortar Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {136, 15},
		size = { 32, 32},
		name = "bm_howitzer",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_blackmarketset_1600howitzer.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Aimbot Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {4, 4},
		size = { 32, 32},
		name = "ark_set_gun",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_arkset_1600gun.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Kinetic Cannon Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {4, 4},
		size = { 32, 32},
		name = "ark_set_blaster",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_arkset_1600blaster.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Widow Maker Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {4, 4},
		size = { 32, 32},
		name = "ark_set_torpedo",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_arkset_1600torpedo.tga",
			textureUV =
              { 0, 0, 128, 128, },
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Heavy Artillery Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {126, 15},
		size = { 32, 32},
		name = "TLS",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_torpedolaunchersetall_1600.mres",
			color = OUTLINECOLOR,
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Torpedo Launcher Set",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {156, 15},
		size = { 32, 32},
		name = "RTS",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\Icons_Subsystem_rapidsetall_1600.mres",
			color = OUTLINECOLOR,
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Rapid Sweeper Set",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {8, 14},
		size = { 40, 40},
		name = "POH2",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\poh2_1600.mres",
			color = OUTLINECOLOR,
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Mothership Battle Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {159, 4},
		size = { 40, 40},
		name = "bm_clustermissile",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_battery_1600cluster.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Cluster Missile Battery",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {159, 4},
		size = { 40, 40},
		name = "bm_scudmissile",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_battery_1600scud.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "SCUD Missile Battery",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {159, 4},
		size = { 40, 40},
		name = "bm_discomissile",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_battery_1600disco.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Disco Missile Battery",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {159, 4},
		size = { 40, 40},
		name = "bm_kickassmissile",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_battery_1600kickass.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Kick-ass Missile Battery",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {160, 0},
		size = { 40, 40},
		name = "vgr_mothership_armour",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_ms_armour.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Armour Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {0, 0},
		size = { 40, 40},
		name = "forcefield_l",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_forcefield.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Force Field (Port)",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {0, 14},
		size = { 40, 40},
		name = "forcefield_r",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_forcefield.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Force Field (Starboard)",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {0, 28},
		size = { 40, 40},
		name = "needle_at",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\kad_atfield.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Iron Curtain",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {122, 4},
		size = { 40, 40},
		name = "la",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600l.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Light Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {122, 4},
		size = { 40, 40},
		name = "sa",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Standard Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {122, 4},
		size = { 40, 40},
		name = "ha",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600h.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Heavy Asset",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
---------------------------------------------------------------
{
		type = "Frame",
		position = {126, 15},
		size = { 32, 32},
		name = "TLSD",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_torpedolaunchersetalldisabled_1600.mres",
			color = OUTLINECOLOR,
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Empty Special Slot Set",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {156, 15},
		size = { 32, 32},
		name = "RTSD",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\icons_subsystem_torpedolaunchersetalldisabled_1600.mres",
			color = OUTLINECOLOR,
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Empty Special Slot Set",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {8, 14},
		size = { 40, 40},
		name = "POH2D",
		BackgroundGraphic = {
			texture = "data:ship\\icons\\subs\\poh2_disable_1600.mres",
			color = OUTLINECOLOR,
		},
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 40, 40, },
    helpTip = "Empty Special Slot Set (Battle Asset)",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

---Shipyard

{
		type = "Frame",
		position = {11, 2},
		size = { 22, 22},
		name = "LRS",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_researchstationfs.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 22, 22, },
    helpTip = "Research Station Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {159, 8},
		size = { 35, 35},
		name = "LPS",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_powerfs.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 35, 35, },
    helpTip = "Power Station Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {10, 22},
		size = { 22, 22},
		name = "LWS",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_weaponstationfs.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 22, 22, },
    helpTip = "Weapon Station Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {10, 43},
		size = { 22, 22},
		name = "LCS",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_crewstationfs.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 22, 22, },
    helpTip = "Crew Station Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {159, 28},
		size = { 32, 32},
		name = "LMS",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mothership.tga",
        textureUV =
              { 0, 0, 384, 384, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Mothership Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---

{
		type = "Frame",
		position = {11, 2},
		size = { 22, 22},
		name = "LRSD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_researchstationfsD.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 22, 22, },
    helpTip = "Research Station Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {159, 8},
		size = { 35, 35},
		name = "LPSD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_powerfsD.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 35, 35, },
    helpTip = "Power Station Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {10, 22},
		size = { 22, 22},
		name = "LWSD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_weaponstationfsD.tga",
        textureUV =
              { 0, 0, 126, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 22, 22, },
    helpTip = "Weapon Station Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {10, 43},
		size = { 22, 22},
		name = "LCSD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_crewstationfsD.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 22, 22, },
    helpTip = "Crew Station Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {159, 28},
		size = { 32, 32},
		name = "LMSD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mothershipD.tga",
        textureUV =
              { 0, 0, 384, 384, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Mothership Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

---Balkaan Cannon

{
		type = "Frame",
		position = {93, 33},
		size = { 20, 20},
		name = "BC",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hic_1600.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30, },
    helpTip = "Heavy Ion Cannon Enable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {93, 33},
		size = { 20, 20},
		name = "BC1",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hic_1600d.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30, },
    helpTip = "Heavy Ion Cannon Disable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {93, 33},
		size = { 20, 20},
		name = "BCD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\base.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30, },
    helpTip = "Empty Special Slot",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---EMP Plasma Cannon

{
		type = "Frame",
		position = {129, 1},
		size = { 20, 20},
		name = "GCB",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_empbattery_1600.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 20, 20, },
    helpTip = "Heavy EMP Plasma Cannon Enable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {129, 1},
		size = { 20, 20},
		name = "GCB1",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_empbattery_1600d.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 20, 20},
    helpTip = "Heavy EMP Plasma Cannon Disable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {129, 1},
		size = { 20, 20},
		name = "GCBD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\base.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 20, 20},
    helpTip = "Empty Special Slot",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---Autogun

{
		type = "Frame",
		position = {65, 33},
		size = { 20, 20},
		name = "BS",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\hgn_suppressor.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Long Range Autogun (SET)",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {65, 33},
		size = { 20, 20},
		name = "BS1",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\hgn_suppressorD.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Long Range Autogun (SET) Disable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {65, 33},
		size = { 20, 20},
		name = "BSD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\base.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Empty Special Slot",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---Pulser

{
		type = "Frame",
		position = {79, 33},
		size = { 20, 20},
		name = "P",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\hgn_pulser.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Fast Pulsar Cannon Enable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {79, 33},
		size = { 20, 20},
		name = "P1",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\hgn_pulserd.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Fast Pulsar Cannon Disable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {79, 33},
		size = { 20, 20},
		name = "PD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\base.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Empty Special Slot",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---Shield

{
		type = "Frame",
		position = {107, 33},
		size = { 20, 20},
		name = "S",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\shieldtb_1600.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Mass Shield Emitter",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {107, 33},
		size = { 20, 20},
		name = "S1",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\shieldtb_1600d.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Mass Shield Emitter Disable",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {107, 33},
		size = { 20, 20},
		name = "SD",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\subs\\base.tga",
        textureUV =
              { 0, 0, 120, 120, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 30, 30},
    helpTip = "Empty Special Slot",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---shuttle

{
		type = "Frame",
		position = {9, 5},
		size = { 32, 32},
		name = "LJ1",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {9, 44},
		size = { 32, 32},
		name = "LJ2",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {160, 5},
		size = { 32, 32},
		name = "LJ3",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {160, 44},
		size = { 32, 32},
		name = "LJ4",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---

{
		type = "Frame",
		position = {9, 5},
		size = { 32, 32},
		name = "LJ1D",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {9, 44},
		size = { 32, 32},
		name = "LJ2D",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {160, 5},
		size = { 32, 32},
		name = "LJ3D",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {160, 44},
		size = { 32, 32},
		name = "LJ4D",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---Rad Generals

{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_1",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Die Trying",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_1.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_2",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "So Pro",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_2.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_3",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Unchained",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_3.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},


{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_4",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "One Percent",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_4.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},


{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_5",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Black Hand",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_5.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},


{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_6",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Shagwell",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_6.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},


{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_7",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Redneck",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_7.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},


{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},
		name = "rad_general_8",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Umad",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_general_8.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "PRESIDENT",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
---crew station

{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank1",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Ensign",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\ensign.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank2",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Lieut", 		--"Lieutenant",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\lieutenant.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank3",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Commander",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\commander.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank4",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Captain",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\captain.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank5",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Commodore",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\commodore.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank6",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Admiral",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\admiral.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "rank7",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    --wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "F.Admiral", 		--"Fleet Admiral",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\fleetadmiral.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "MILITARY RANK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---SCUD Launcher

{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_1",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_1.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "SCUD STORM",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_2",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_2.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "CLUSTER MISSILE",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_3",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_3.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "HIGH EXPLOSIVES",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_4",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_4.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "DISCO BOMB",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_5",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_5.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "KICK-ASS MONSTER",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_6",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_6.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "ORGASMIC SPAM",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
{
		type = "Frame",
		position = {7, 5},
		size = { 51, 38},		--{ 41, 38},
		name = "scud_7",
;
{
    type = "TextLabel",
    position =
        { 0, 0, },
    size =
        { 51, 8, },  		--{ 41, 8, },
    --wrapping = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Warhead",
        hAlign = "Center",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "Button",
    position =
        { 0, 10, },
    size =
        { 41, 41, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\rad_scud_7.tga",
        textureUV =
              { 0, 0, 128, 128, },
    },
    helpTip = "DECAPITATION STRIKE",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---Kadeshi Perks
{
		type = "Frame",
		position = {7, 5},
		size = { 100, 14},
		name = "kad_PrimaryPerk",
;
{
    type = "TextLabel",
    position =
        { 0, 1, },
    size =
        { 100, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 238, 188, 255, 255, },
        hAlign = "Left",
        vAlign = "Top", },
        name = "kad_primaryperktext", },
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 100, 14, },
    helpTip = "PRIMARY PERK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
---
{
		type = "Frame",
		position = {80, 5},
		size = { 100, 14},
		name = "kad_SecondaryPerk",
;
{
    type = "TextLabel",
    position =
        { 0, 1, },
    size =
        { 100, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 188, 255, 238, 255, },
        hAlign = "Right",
        vAlign = "Top", },
        name = "kad_secondaryperktext", },
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 100, 14, },
    helpTip = "SECONDARY PERK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---Mercenary Upgrades
{
		type = "Frame",
		position = {7, 5},
		size = { 100, 28},
		name = "merc_upgrade_defense",
;
{
    type = "TextLabel",
    position =
        { 0, 1, },
    size =
        { 100, 26, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 127, 255, 255, },
        hAlign = "Left",
        vAlign = "Top", },
        name = "merc_upgrade_defensetext", },
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 100, 14, },
    helpTip = "DEFENSE",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},
---
{
		type = "Frame",
		position = {80, 5},
		size = { 100, 28},
		name = "merc_upgrade_attack",
;
{
    type = "TextLabel",
    position =
        { 0, 1, },
    size =
        { 100, 26, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 255, 0, 0, 255, },
        hAlign = "Right",
        vAlign = "Top", },
        name = "merc_upgrade_attacktext", },
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 100, 14, },
    helpTip = "ATTACK",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---ark

{
		type = "Frame",
		position = {1, 34},
		size = { 32, 32},
		name = "LMSa",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mothership.tga",
        textureUV =
              { 0, 0, 484, 484, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Mothership Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {1, 34},
		size = { 32, 32},
		name = "LMSDa",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mothershipD.tga",
        textureUV =
              { 0, 0, 484, 484, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "Mothership Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
},
},

{
		type = "Frame",
		position = {164, 5},
		size = { 32, 32},
		name = "LJ1a",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {164, 18},
		size = { 32, 32},
		name = "LJ2a",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {164, 31},
		size = { 32, 32},
		name = "LJ3a",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {164, 44},
		size = { 32, 32},
		name = "LJ4a",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfs.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docked",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---

{
		type = "Frame",
		position = {164, 5},
		size = { 32, 32},
		name = "LJ1Da",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {164, 18},
		size = { 32, 32},
		name = "LJ2Da",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {164, 31},
		size = { 32, 32},
		name = "LJ3Da",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

{
		type = "Frame",
		position = {164, 44},
		size = { 32, 32},
		name = "LJ4Da",
		BackgroundGraphic =
    {
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaughtfsD.tga",
        textureUV =
              { 0, 0, 138, 138, },
    },
;
{
    type = "Button",
    position =
        { 0, 0, },
    size =
        { 32, 32, },
    helpTip = "MOAB Docking Bay",
    helpTipTextLabel = "commandsHelpTip",
    helpTipScreen = "NewTaskbar",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
},
},

---

{
    type = "Frame",
    name = "subsystems",
    position =
        { 193, 5, },
    size =
        { 210, 48, },
    autoarrange = 1,
    autoarrangeWidth = 210,
;
{
    type = "Button",
    name = "subsystem1",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem2",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem3",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem4",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem5",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem6",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem7",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem8",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem9",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem10",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem11",
    buttonStyle = "Taskbar_SubsystemButtonStyle",
},
{
    type = "Button",
    name = "subsystem12",
    buttonStyle = "Taskbar_SubsystemButtonStyle", },
},
{
    type = "Button",
    name = "subsystem_production",
    visible = 0,
    size =
        { 32, 24, },
    DefaultGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 0, 0, 32*2, 24*2, }, },
    OverGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 0, 24*2, 32*2, 48*2, }, },
    PressedGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 0, 48*2, 32*2, 72*2, }, },
    DisabledGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 0, 0, 32*2, 24*2, },
        color =
            { 255, 255, 255, 200, }, },
    helpTip = "$2811",
    soundOnClicked = "SFX_ButtonClick",
},
{
    type = "Button",
    name = "subsystem_sensor",
    visible = 0,
    size =
        { 32, 24, },
    DefaultGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 32*2, 0, 64*2, 24*2, }, },
    OverGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 32*2, 24*2, 64*2, 48*2, }, },
    PressedGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 32*2, 48*2, 64*2, 72*2, }, },
    DisabledGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 32*2, 0, 64*2, 24*2, },
        color =
            { 255, 255, 255, 200, }, },
    helpTip = "Empty Special Slot",
    soundOnClicked = "SFX_ButtonClick",
},
{
    type = "Button",
    name = "subsystem_generic",
    visible = 0,
    size =
        { 32, 24, },
    DefaultGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 64*2, 0, 96*2, 24*2, }, },
    OverGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 64*2, 24*2, 96*2, 48*2, }, },
    PressedGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 64*2, 48*2, 96*2, 72*2, }, },
    DisabledGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 64*2, 0, 96*2, 24*2, },
        color =
            { 255, 255, 255, 200, }, },
    helpTip = "$2812",
    soundOnClicked = "SFX_ButtonClick",
},
{
    type = "Button",
    name = "subsystem_innate",
    visible = 0,
    size =
        { 32, 24, },
    DefaultGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 96*2, 0, 128*2, 24*2, }, },
    OverGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 96*2, 24*2, 128*2, 48*2, }, },
    PressedGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 96*2, 48*2, 128*2, 72*2, }, },
    DisabledGraphic =
    {
        size =
            { 32, 24, },
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_button1600_new.tga",
        textureUV =
            { 96*2, 0, 128*2, 24*2, },
        color =
            { 255, 255, 255, 200, }, },
    helpTip = "$2814",
    soundOnClicked = "SFX_ButtonClick",
},
{
    type = "Frame",
    name = "subsystemselected",
    position =
        { 0, 7, },
    size =
        { 252, 45, },
;
{
    type = "Frame",
    name = "subsystemselected1",
    position =
        { 93, 0, },
    size =
        { 159, 45, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\subsystem_pointer.tga",
        textureUV =
            { 0, 0, 159, 45, }, },
;
{
    type = "Frame",
    position =
        { 104, 9, },
    size =
        { 64, 32, },
    name = "subsystemIcon",
},
{
    type = "Button",
    position =
        { 104, 9, },
    size =
        { 64, 32, },
    name = "subsystemIcon1",
    onMouseClicked = "MainUI_UserEvent( eFocus)",
    helpTip = "SELECTED SUBSYSTEM",
    helpTipTextLabel = "commandsHelpTip",
},
{
    type = "ProgressBar",
    backgroundColor =
        { 0, 128, 0, 255, },
    progressColor =
        { 0, 255, 0, 255, },
    position =
        { 111, 6, },
    size =
        { 40, 2, },
    name = "subsystemProgress", },
},
},
},

{
    type = "Frame",
    position =
        { 3, 4, },
    size =
        { 220, 9, },
    autosize = 1,
    helpTip = "UNIT NAME",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "TextLabel",
    position =
        { 5, 0, },
    size =
        { 0, 0, }, 		--{ 45, 9, },
    wrapping = 0, 	--1
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "UNIT",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "TextLabel",
    position =
        { 5, 0, }, 		--{ 34, 0, },
    size =
        { 155, 9, }, 			--{ 125, 9, },
    wrapping = 0, 		--1
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 198, 0, 255, }, 		--"FEColorHeading3",
        hAlign = "Left",
        vAlign = "Top", },
    name = "unitname", },
},
{
    type = "Frame",
    position =
        { 3, 13, },
    size =
        { 220, 9, },
    autosize = 1,
    helpTip = "UNIT ROLE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "TextLabel",
    position =
        { 5, 0, },
    size =
        { 0, 0, }, 	--{ 45, 9, },
    wrapping = 0, 	--1
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "ROLE",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, }, },
},
{
    type = "TextLabel",
    position =
        { 5, 0, }, 		--{ 34, 0, },
    size =
        { 155, 9, }, 		--{ 125, 9, },
    wrapping = 0,			--1
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 128, 255, 255, }, 		--"FEColorHeading3",
        hAlign = "Left",
        vAlign = "Top", },
    name = "unitrole", },
},

--drive mode
	{
		type = "Button",
		buttonStyle = "Taskbar_CommandButtonStyleSmall",
		position = {145,4},		--was {228,0} in new1.lua
		size = {12, 12},
		name = "btnDrive",
		onMouseClicked = "UI_SetElementVisible('drive','driveenabled',1)",		--onMouseClicked = "UI_SetScreenVisible( 'New4', 1)",
		helpTip = "PILOT MODE (U)",
		helpTipTextLabel = "commandsHelpTip",
		helpTipScreen = "NewTaskbar",
		soundOnClicked = "SFX_ButtonClick",
		;
				{
				  type = "Frame",
				  size = { 12, 12, },
				  position = {0,0},
				  giveParentMouseInput = 1,
				  BackgroundGraphic =
			    {
			        texture = "DATA:UI\\NewUI\\Taskbar\\drive.tga",
			        textureUV = { 0, 0, 32, 32, },
			    },
				},
	},

{
    type = "Frame",
    position =
        { 140+13, 4, },		--{ 3, 22, },
    size =
        { 80-13, 9, },		--{ 220, 9, },
    autosize = 1,
    helpTip = "UNIT RACE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 0, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\fleet_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR, },
},
{
    type = "TextLabel",
    position =
        { 29-13, 0, }, 		--{ 34, 0, },
    size =
        { 125-13, 9, },
    wrapping = 0, 	--1
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Top", },
    name = "unitrace", },
},

{
    type = "Frame",
    position =
        { 3, 22, }, 			--{ 136, 4, },
    size =
        { 220, 9, }, 		--{ 80, 9, },
    name = "experienceframe",
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 220,
    helpTip = "UNIT EXPERIENCE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "TextLabel",
    position =
        { 5, 0, },
    size =
        { 80, 9, }, 	--{ 45, 9, },
    wrapping = 0,
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        text = "Experience", 		--"EXP",
        hAlign = "Left",
        vAlign = "Top",
        color =
            { 255, 255, 255, 255, },
    },
    name = "experience_title",
},
{
    type = "TextLabel",
    position =
        { 50, 0, }, 		--{ 29, 0, },
    size =
        { 40, 9, },
    wrapping = 1,
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Top", },
    name = "experience",
},
{
			type = "Frame",
			position = {92, 1},		--{49, 1},
			size = {9,7},
			name = "medal1",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {97, 1},		--{54, 1},
			size = {9,7},
			name = "medal2",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {102, 1},		--{59, 1},
			size = {9,7},
			name = "medal3",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {107, 1},		--{64, 1},
			size = {9,7},
			name = "medal4",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {112, 1},		--{69, 1},
			size = {9,7},
			name = "medal5",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
{
			type = "Frame",
			position = {92, 1},		--{49, 1},
			size = {9,7},
			name = "medal6",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal2_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {97, 1},		--{54, 1},
			size = {9,7},
			name = "medal7",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal2_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {102, 1},		--{59, 1},
			size = {9,7},
			name = "medal8",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal2_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {107, 1},		--{64, 1},
			size = {9,7},
			name = "medal9",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal2_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},
		{
			type = "Frame",
			position = {112, 1},		--{69, 1},
			size = {9,7},
			name = "medal10",
			BackgroundGraphic = {
				texture = "data:ui\\newui\\ingameicons\\medal2_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR,
			},
			visible	= 0,
		},

	},
{
    type = "Frame",
    position =
        { 140+13, 13, }, 		--{ 136, 13, },
    size =
        { 45-13, 9, },
    name = "efficencyframe",
    autosize = 1,
    helpTip = "UNIT EFFICIENCY (MAINTENANCE STATUS)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 0, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\maintenance_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR, },
},
{
    type = "TextLabel",
    position =
        { 29-13, 0, },
    size =
        { 45-13, 9, },
    wrapping = 1,
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Top", },
    name = "efficency", },
},
{
    type = "Frame",
    position =
        { 140+13, 22, }, 		--{ 136, 22, },
    size =
        { 45-13, 9, },
    name = "energyframe",
    autosize = 1,
    helpTip = "UNIT ENERGY CONSUMPTION",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 0, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\lightning_yellow_1600.tga",
				textureUV = {0,0,26,26},
				color = OUTLINECOLOR, },
},
{
    type = "TextLabel",
    position =
        { 29-13, 0, },
    size =
        { 45-13, 9, },
    wrapping = 1,
    autosize = 1,
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Top", },
    name = "energy", },
},



---RU-----------------------------------------------------------------------

{
    type = "Frame",
    name = "ruframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    name = "rurateframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU HARVEST/MINING RATE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 4, 3, },
    size =
        { 11, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "rurate",
},
{
    type = "Frame",
    position =
        { 36+4, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/rumining_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 49+3, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "ruratemining", },
},

{
    type = "Frame",
    name = "ruloadframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX RU LOAD CAPACITY",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/ruload_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "ruload", },
},

{
    type = "Frame",
    name = "rudropoffframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU DROP-OFF RATE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/rudropoff_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "rudropoff", },
},
},

---FUSION------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "fusionframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU FUSION",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/fusion_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusion", },
},
},

---JUGGERNAUGHT------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "juggernaughtframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX DETONATION POWER (500 METERS)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/detonation_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 255, 127, 0, 170, }, 		--{ 255, 255, 255, 170, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "juggernaughtpower", },
},
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX DETONATION RANGE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/range_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
              { 255, 255, 0, 170, }, 	--{ 255, 255, 255, 170, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "juggernaughtrange", },
},
---
{
    type = "Frame",
    name = "juggernaughtsolarcharge",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "SOLAR CHARGE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/hic_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "juggernaughtsolarchargetext", },
},
---
{
    type = "Frame",
    name = "juggernaughtefp",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "Explosively Formed Projectile",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/coordinatedweapons_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "juggernaughtefptext", },
},
---
},

---MS------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "MSframe",
    position =
        { 71, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "SHIELD POWER/TIME/REGENERATION RATE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/shield_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 128, 255, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "shield", },
},
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "HEAVY ION CANNON DAMAGE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/hic_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "heavyioncannon", },
},
},

---RS------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "RSframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RESEARCH SCORE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/tech_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 128, 128, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "rs", },
},
},

---PS------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "PSframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "ENERGY PRODUCTION/STORED/MAX",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/ability_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 60, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color = "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "ps", },
},
},

---CS------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "CSframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 82, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "CREW OPERATING/AVAILABLE/MAX",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/crew_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 18, 1, },
    size =
        { 64, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 118, 185, 235, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "cscrew", },
},
{
    type = "Frame",
    size =
        { 82, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "OFFICERS OPERATING/AVAILABLE/MAX",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/officer_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 18, 1, },
    size =
        { 64, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "csofficer", },
},
{
    type = "Frame",
    size =
        { 34, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "CREW CELL",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 4, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/crewcell_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 18, 1, },
    size =
        { 16, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "cscrewcell", },
},
},

---PLANETS------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "Planetframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
--
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "POPULATION GROWTH/DEATH/TOTAL",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/civ_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 18, 1, },
    size =
        { 48, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 125, 125, 125, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "planetcivilian", },
},
--
{
    type = "Frame",
    size =
        { 76, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "ENERGY PRODUCTION/STORED/MAX",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/ability_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 58, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color = "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "planetenergy", },
},
--
{
    type = "Frame",
    size =
        { 56, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "ORBITAL BOMBARDMENT (UNDER ATTACK)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/hic_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 18, 1, },
    size =
        { 38, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 125, 125, 125, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "planetdamage", },
},
},

---ORBITAL STATION------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "OSframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 87, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "CIVILIAN OPERATING/MAX",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/civ_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 18, 1, },
    size =
        { 64, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 125, 125, 125, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "oscivilian", },
},
},

---SCAVER------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "Sframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RUs AVAILABLE/MAX CAPACITY",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 4, 3, },
    size =
        { 11, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 78, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "lblResourceUnits", },
},
{
    type = "Frame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU FUSION/TOT",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/fusion_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "Sfusion", },
},
},

---CONTAINER------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "containerframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "TRADE CONTAINER RU",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/fusion2_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "container", },
},
},

---MEGALITH------------------------------------------------------------------------------------------------------
--engineering bay
{
    type = "Frame",
    name = "EngineeringBayFrame",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    name = "EngineeringBayLevelFrame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "ENGINEERING BAY LEVEL",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/level_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 188, 5, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "EngineeringBayLevel", },
},
{
    type = "Frame",
    name = "EngineeringBayRadiusFrame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "REPAIR RADIUS (m)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/shield_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 188, 5, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "EngineeringBayRadius", },
},

{
    type = "Frame",
    name = "EngineeringBayRateFrame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "REPAIR RATE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/repair_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 188, 5, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "EngineeringBayRate", },
},
},

--reinforcement pad
{
    type = "Frame",
    name = "ReinforcementPadFrame",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    name = "NextSupplyFrame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "NEXT SUPPLY",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/cumulative_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 73, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 234, 97, 114, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "NextSupply", },
},
{
    type = "Frame",
    name = "SupplyCountdownFrame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "SUPPLY COUNTDOWN",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/build_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 73, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 234, 97, 114, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "SupplyCountdown", },
},
},

--research booster

{
    type = "Frame",
    name = "ResearchBoosterFrame",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "TECHNOLOGICAL SINGULARITY",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/tech_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 128, 128, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "researchbooster", },
},
},

--derelict battleship
{
    type = "Frame",
    name = "DerelictBattleshipFrame",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    name = "AimingFrame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "AIMING SYSTEM",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/aim_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 73, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 255, 166, 0, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "Aiming", },
},
{
    type = "Frame",
    name = "FirepowerFrame",
    size =
        { 99, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MUNITION SYSTEM",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/coordinatedweapons_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 73, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 255, 166, 0, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "Firepower", },
},
},

--mining base
{
    type = "Frame",
    name = "MBru",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MINING BASE AVAILABLE RUS",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 4, 3, },
    size =
        { 11, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 20, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "availableru", },
},

{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "OPERATING COLLECTORS",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 3, 3, },
    size =
        { 12, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/collectorinside_1600.tga",
        textureUV =
            {0,-1,30,30}, },
},
{
    type = "TextLabel",
    position =
        { 20, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "collectorinside", },
},

{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "LOADING CONTAINERS",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 4, 3, },
    size =
        { 10, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/containerinside_1600.tga",
        textureUV =
            {0,-1,24,24}, },
},
{
    type = "TextLabel",
    position =
        { 20, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "containerinside", },
},
},

---MINE CONTAINER-------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "minecontainerruframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    name = "minecontainerrurateframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU MINING RATE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 4, 3, },
    size =
        { 11, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui\\newui\\ingameicons\\ru_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "minecontainerrurate", },
},
{
    type = "Frame",
    name = "minecontainerruloadframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX RU LOAD CAPACITY",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/ruload_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "minecontainerruload", },
},

{
    type = "Frame",
    name = "minecontainerrudropoffframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU DROP-OFF RATE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/rudropoff_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "minecontainerrudropoff", },
},
},

---TRADE CONTAINER-------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "containerruframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;

{
    type = "Frame",
    name = "minecontainerruloadframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "RU TRADE LOAD VALUE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/ruload_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "containerruload", },
},
},

---PATCHER------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "patcherframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "PATCHER",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/patcher_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 120, 120, 120, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "patcher", },
},
},

---FUEL------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "fuelframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "FUEL AVAILABLE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/fuel_taskbar.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 188, 5, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "fuel", },
},
},

---Tester: camera vector------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "test_cameraframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "Camera Vector (x)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\x.tga",
        textureUV =
            { 0, 0, 32, 32, }, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "vector_x", },
},

{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "Camera Vector (y)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\y.tga",
        textureUV =
            { 0, 0, 32, 32, }, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "vector_y", },
},

{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "Camera Vector (z)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\z.tga",
        textureUV =
            { 0, 0, 32, 32, }, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "vector_z", },
},

},

---AIR COMBAT------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "aircombatframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "AIRCRAFT IN HANGAR/TOTAL",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 2, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/aircraft_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 120, 120, 120, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "aircraft", },
},

{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "Hangar Capacity",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/docking_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 188, 5, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "aircraftdocking", },
},

{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "PRODUCTION SPEED/ASSEMBLY LINES",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/build_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "aircraftproduction", },
},

},

---DRONE------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "droneframe",
    position =
        { 71, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "DRONE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 2, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/drone_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 120, 120, 120, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "drone", },
},
},

---POWER GENERATORS------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "PowerGeneratorFrame",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "DOCKED POWER GENERATORS",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/powergeneratordocked_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 120, 120, 120, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "DockedPowerGenerators", },
},
},

---CREW CELL------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "crewcellframe",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
{
    type = "Frame",
    name = "pilotcrewcellframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX PILOTS LOAD",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/crew_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 118, 185, 235, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "pilotcrewcell", },
},
{
    type = "Frame",
    name = "officercrewframe",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX OFFICERS LOAD",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/officer_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "officercrewcell", },
},
},

---ABILITIES FRAME------------------------------------------------------------------------------------------------------

{
    type = "Frame",
    name = "abilities",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
---
{
    type = "Frame",
    name = "torpedo",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "TORPEDO MISSILE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/torpedo_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
        name = "torpedotext", },
},
---
{
    type = "Frame",
    name = "callisto",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "CALLISTO",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/callisto_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "callistotext", },
},
},
{
    type = "Frame",
    name = "abilities1",
    position =
        { 5, 30, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;
---
{
    type = "Frame",
    name = "entrenchment",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "ENTRENCHMENT",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/shield_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 128, 255, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "entrenchmenttext", },
},
---
{
    type = "Frame",
    name = "mechanic",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MECHANIC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/patcher_1600.tga",
        textureUV =
            {0,0,26,26}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 120, 120, 120, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "mechanictext", },
},
---
{
    type = "Frame",
    name = "fusionm",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "FUSION MISSILE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/torpedo_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusiontext", },
},
---
{
    type = "Frame",
    name = "monster",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "HEAVY MINE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/mine_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "monstertext", },
},
---
{
    type = "Frame",
    name = "freacker",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "PERFORATION BOMB",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/capture_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "bombtext", },
},
---
{
    type = "Frame",
    name = "fusionm1",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "DEATH MAIDEN MISSILE",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/torpedo_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusiontext1", },
},
---
{
    type = "Frame",
    name = "fusionblaster",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "HEAVY KINETIC BURST CANNON",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/coordinatedweapons_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusionblastertext", },
},
---
{
    type = "Frame",
    name = "fusiontitan",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "WORLD SHAKER",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/hic_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusiontitantext", },
},
---
{
    type = "Frame",
    name = "fusionprogenitor",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "AVATAR OF SAJUUK",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/progen_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusionprogenitortext", },
},
---
{
    type = "Frame",
    name = "fusionchapel",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "HEAVY ION CANNON DAMAGE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/hic_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusionchapeltext", },
},
---
{
    type = "Frame",
    name = "fusionspear",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "SPEARS OF KADESH",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/torpedo_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusionspeartext", },
},
---
{
    type = "Frame",
    name = "darkrealm",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "DARK REALM RADIUS (m)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/shield_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             { 0, 128, 255, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "darkrealmtext", },
},
---
{
    type = "Frame",
    name = "fusionenforcer",
    size =
        { 66, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "WEAPON OF MASS DESTRUCTION",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "data:ui/newui/research/icons/torpedo_1600.tga",
        textureUV =
            {0,0,18,18}, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
             "FEColorHeading3",
        hAlign = "Left",
        vAlign = "Center", },
    name = "fusionenforcertext", },
},

},

---CSASSICS------------------------------------------------------------------------------

{
    type = "Frame",
    position =
        { 5, 45, },
    autosize = 1,
    autoarrange = 1,
    autoarrangeWidth = 300,
;

{
    type = "Frame",
    name = "maxspeedframe",
    size =
        { 87, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "SPEED INSTANT/RATED (m/s)",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.mres",
        textureUV =
            { 0, 0, 9*2,  9*2, }, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 198, 0, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "unitactualspeed", },
{
    type = "Frame",
    position =
        { 36+13, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.mres",
        textureUV =
            { 0, 0, 9*2,  9*2, }, },
},
{
    type = "TextLabel",
    position =
        { 49+12, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 198, 0, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "unitmaxspeed", },
},
-----------------
{
    type = "Frame",
    name = "shieldsframe",
    size =
        { 64, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "MAX HEALTH",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.mres",
        textureUV =
            { 22*2, 0, 31*2, 9*2, }, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 0, 128, 255, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "unitshields", },
},
--------------
{
    type = "Frame",
    name = "attackdamageframe",
    size =
        { 48, 15, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_box.mres",
        textureUV =
            { 0, 0, 67, 15, }, },
    helpTip = "ATTACK DAMAGE/SEC",
    helpTipTextLabel = "commandsHelpTip",
;
{
    type = "Frame",
    position =
        { 5, 3, },
    size =
        { 9, 9, },
    BackgroundGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\stats_icons.mres",
        textureUV =
            { 11*2, 0, 20*2, 9*2, }, },
},
{
    type = "TextLabel",
    position =
        { 17, 1, },
    size =
        { 49, 13, },
    Text =
    {
        textStyle = "Taskbar_MenuButtonTextStyle",
        color =
            { 222, 37, 19, 255, },
        hAlign = "Left",
        vAlign = "Center", },
    name = "unitattackdamage", },
},
},
},
{
    type = "Button",
    position =
        { 784, 40, },
    size =
        { 13, 59, },
    DefaultGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\taskbar_icon_back_new.tga",
        textureUV =
            { 0, 0, 13, 59, }, },
    OverGraphic =
    {
        texture = "DATA:UI\\NewUI\\Taskbar\\Taskbar_Icon_Back_OVER.tga",
        textureUV =
            { 0, 0, 13, 59, }, },
    name = "btnShipBack",
    helpTip = "$2732",
    helpTipTextLabel = "commandsHelpTip",
    enabled = 0,
    soundOnClicked = "SFX_ButtonClick", },
}
