dofilepath("data:scripts\\SCAR\\SCAR_Util.lua")
obj_prim_newobj_id = 0

function OnInit()
	Rule_Add("Rule_Init")
end

function Rule_Init()
	LoadPersistentData_Mission()
	SobGroup_ExitHyperSpace("MS_StartGroup", "MS_StartVolume")
	if (sectorsCleared[currentMission] == 0) then
		Event_Start( "IntelEvent_Intro" )
		SobGroup_CreateSubSystem("MS_StartGroup", "Hgn_MS_Module_Research")
		Rule_AddInterval( "Rule_PlayerWins", 2 )
	else
		Event_Start( "IntelEvent_AlreadyDone" )
		Rule_Add( "Rule_EnableExits" )
	end
	Rule_Remove( "Rule_Init" )
end

function Rule_PlayerWins()
	if (Player_HasResearch(0, "SensDisProbe") == 1) then
		Objective_SetState( obj_prim_newobj_id, OS_Complete )
		Event_Start( "IntelEvent_Finale" )
		Rule_Remove( "Rule_PlayerWins" )
		Rule_Add( "Rule_EnableExits" )
	end
end

Events = {}
Events.IntelEvent_Intro =
{
	{
		{
			[[Sound_EnableAllSpeech(0)]],
			[[]]
		},
		{
			[[Sound_EnterIntelEvent()]],
			[[]]
		},
		{
			[[Universe_EnableSkip(1)]],
			[[]]
		},
		HW2_LocationCardEvent("Postmortem Tutorial - Mission 11", 5),
	},
	{
		HW2_Letterbox(1),
		HW2_Wait(2),
	},
	{
		{
			[[obj_prim_newobj_id = Objective_Add("Research an Item", OT_Primary)]],
			[[]]
		},
		{
			[[Objective_AddDescription(obj_prim_newobj_id, "Research the Repair ability to win the mission.")]],
			[[]]
		},
		HW2_SubTitleEvent(Actor_FleetIntel, "Research the proximity sensors probe technology to win the mission.", 4),
	},
	{
		HW2_Wait(2),
	},
	{
		HW2_Letterbox(0),
		HW2_Wait(2),
		{
			[[Universe_EnableSkip(0)]],
			[[]]
		},
		{
			[[Sound_ExitIntelEvent()]],
			[[]]
		},
		{
			[[Sound_EnableAllSpeech(1)]],
			[[]]
		},
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
