
FleetMenu = {
	size = { 0, 0, 800, 600},
	stylesheet = "HW2StyleSheet",
	
	claimMousePress = 1,

	RootElementSettings = {
		onMouseClicked = "UI_ToggleScreen( 'FleetMenu', 0)",
	},
	
	-- Flags
	pixelUVCoords = 1, -- Enter pixel coords for texture coords
	
	onShow = "UI_SetButtonPressed('NewTaskbar', 'btnFleet', 1); UI_SetButtonTextHotkey('FleetMenu', 'btnForm1', 'Player Info (I)', 149); UI_SetButtonTextHotkey('FleetMenu', 'btnForm2', 'Production Queues (Q)', 139); ", 
  onHide = "UI_SetButtonPressed('NewTaskbar', 'btnFleet', 0)", 
	;

	-- root frame for moving screen so it moves with task bar when hidden
	{
		type = "Frame",
		name = "rootFrame",
		position = { 0, 0},
		size = { 800, 600},
		giveParentMouseInput = 1,
		;
			
		-- the root frame for the menu... add children to this
		{
			type = "Frame",
			name = "menu",
			position = { 1, 448-56},
			size = { 217, 65+56},
			backgroundColor = "IGColorBackground1",
			;
			
			-- title
			{
				type = "TextLabel",
				position = {-2, 0},
				size = { 221, 18},
				borderColor = { 170, 227, 255, 255},
				borderWidth = 2,
				Text = {
					textStyle = "IGHeading2",
					hAlign = "Left",
					offset = { 8, 0},
					color = { 255, 255, 255, 255},
					text = "FLEET INFO//", -- FLEET INFO//
				},
			},
			
			-- menu items
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm1",
				toggleButton = 0,
				position = { 2, 21},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "Player Info (I)",
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'UnitCapInfoPopup', ePopup)",
				hotKeyID = 149,
			},
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm2",
				toggleButton = 0,
				position = { 2, 35},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "Production Queues (Q)",
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'BuildQueueMenu', ePopup)",
				hotKeyID = 139,
			},
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm4",
				toggleButton = 0,
				position = { 2, 49},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "Class Selector (')",
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'selector', ePopup)",
				--hotKeyID = 149,
			},	
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm3",
				toggleButton = 0,
				position = { 2, 63},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "Remote Monitor (E)",
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'UnitCapInfoPopup1', ePopup)",				
		  },	
		  {
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm6",
				toggleButton = 0,
				position = { 2, 77},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "RUs Year Summary",
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'YearMenu', ePopup)",				
		  },	
      {
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm7",
				toggleButton = 0,
				position = { 2, 91},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "Energy Monitor",
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_ShowScreen( 'EnergyMenu', ePopup)",				
		  },		  		  			
			{
				type = "TextButton",
				buttonStyle = "RightClickMenu_ButtonStyle",
				name = "btnForm5",
				toggleButton = 0,
				position = { 2, 105},
				size = { 213, 12},
				Text = {
					font = "ButtonFont",
					hAlign = "Left",
					offset = { 4, 0},
					text = "$5455",--None
				},
				onMouseReleased = "UI_HideScreen( 'FleetMenu'); UI_HideScreen( 'BuildQueueMenu'); UI_HideScreen( 'UnitCapInfoPopup'); UI_HideScreen( 'UnitCapInfoPopup1'); UI_HideScreen( 'selector'); UI_HideScreen('YearMenu'); UI_HideScreen('EnergyMenu');",
			},	
			
		},

		-- empty frame over button on task bar so menu doesn't disappear right away
		{
			type = "Frame",
			name = "menu",
			--backgroundColor = {200,0,0,200},
			position = { 2, 514},
			size = { 76, 19},
			onMouseClicked = "UI_ToggleScreen( 'FleetMenu', 0)",
		},
	},
}
