-- import library files, this includes all the helper functions
dofilepath("data:scripts\\SCAR\\SCAR_Util.lua")
dofilepath("data:leveldata/campaign/singleplayer_oninit.lua")
-- event variables can be created outside of everything, giving them global scope
obj_prim_newobj_id = 0
exitsEnabled = 0


--------------------------------------------------------------------------------
-- game rules
--

function OnInit()
	SinglePlayer_OnInit()
	-- Add the Rule_Init
	Rule_Add( "Rule_Init" )

	-- OnInit isn't a rule so there is no need to remove it
end

function Rule_Init()
	-- if the player just started this campaign spawn a mothershipt, else load persistent data
	LoadPersistentData_Mission()

	-- Disable static exits since we're defining our own
	DisableStaticExits()

	-- Register our mission-specific exits
	RegisterMissionExit(
		{9999, 4432, 12312},  -- East position
		5000,
		"mission_02",
		"Proceed to sector B1 for advanced training"
	)

	RegisterMissionExit(
		{55555, 22222, 15000},  -- South position
		5000,
		"mission_05",
		"Head to sector A2 for resource operations"
	)

	-- if the sector has not been cleared already, trigger the objectives and cutscenes, else skip them
	if (sectorsCleared[currentMission] == 0) then
		-- Do one of those fancy Intel-tell-the-player-whats-going-on
		Event_Start( "IntelEvent_Intro" )

		-- Setup the Win and Lose conditions
		Rule_AddInterval( "Rule_PlayerWins", 2 )
	else
		-- Sector has already been cleared, time to move on
		Event_Start( "IntelEvent_AlreadyDone" )

		-- Make the exit points available to the player
		Rule_Add( "Rule_EnableExits" )
	end

	-- We only want this rule to play once - so remove it now
	Rule_Remove( "Rule_Init" )
end

function Rule_PlayerWins()
	-- Check to see if the player has a squadron of Scouts
	if ( Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping( 0, "hgn_scout" ) > 0 ) then
		-- Update the Objective
		Objective_SetState( obj_prim_newobj_id, OS_Complete )

		-- Play final event
		Event_Start( "IntelEvent_Finale" )

		-- Remove the rule
		Rule_Remove( "Rule_PlayerWins" )

		-- Make the exit points available to the player
		Rule_Add( "Rule_EnableExits" )
	end
end


--------------------------------------------------------------------------------
-- events tables
--

-- Most important line
Events = {}

Events.IntelEvent_Intro = 
{ 
	{ 
		{"Sound_EnableAllSpeech( 1 )",""}, 
		{"Sound_EnterIntelEvent()",""}, 
		{"Universe_EnableSkip(1)",""}, 
		HW2_LocationCardEvent( "Postmortem Tutorial - Mission 1", 5 ), 
	}, 
	{ 
		HW2_Wait( 2 ), 
		HW2_Letterbox( 1 ), 
		HW2_Wait( 2 ), 
	}, 
	{ 
		HW2_SubTitleEvent( Actor_FleetCommand, "Welcome to the Postmortem campaign. This is Mission 1.", 5 ), 
	}, 
	{
		HW2_Wait( 1 ), 
	}, 
	{
		{"obj_prim_newobj_id = Objective_Add( 'Build a Scout', OT_Primary )",""}, 
		{"Objective_AddDescription( obj_prim_newobj_id, 'Build one Scout squadron to win the mission.')",""}, 
		HW2_SubTitleEvent( Actor_FleetIntel, "Build one Scout squadron to win the mission.", 4 ),
	},
	{
		HW2_Wait( 1 ), 
	},
	{
		HW2_Letterbox( 0 ), 
		HW2_Wait( 2 ), 
		{"Universe_EnableSkip(0)",""},
		{"Sound_ExitIntelEvent()",""},
	},
}
Events.IntelEvent_Finale = 
{
	{ 
		{"Sound_EnterIntelEvent()",""}, 
		{"Universe_EnableSkip(1)",""}, 
	}, 
	{ 
		HW2_Wait( 2 ), 
		HW2_Letterbox( 1 ), 
		HW2_Wait( 2 ), 
	}, 
	{ 
		HW2_SubTitleEvent( Actor_FleetCommand, "Mission successful. You may now exit via one of the portals.", 5 ), 
	},
	{
		HW2_Wait( 1 ), 
	},
	{
		HW2_Letterbox( 0 ), 
		HW2_Wait( 2 ), 
		{"Universe_EnableSkip(0)",""},
		{"Sound_ExitIntelEvent()",""},
	},
}
Events.IntelEvent_AlreadyDone = 
{
	{ 
		{"Sound_EnterIntelEvent()",""}, 
		{"Universe_EnableSkip(1)",""}, 
	}, 
	{ 
		HW2_Wait( 2 ), 
		HW2_Letterbox( 1 ), 
		HW2_Wait( 2 ), 
	},
	{ 
		HW2_SubTitleEvent( Actor_FleetCommand, "This sector is clear. You may continue on to the next sector.", 5 ), 
	},
	{
		HW2_Wait( 1 ), 
	},
	{
		HW2_Letterbox( 0 ), 
		HW2_Wait( 2 ), 
		{"Universe_EnableSkip(0)",""},
		{"Sound_ExitIntelEvent()",""},
	},
}
