dofilepath("data:scripts\\SCAR\\SCAR_Util.lua")
obj_prim_newobj_id = 0
ping_newobj_id = 0

function OnInit()
	Rule_Add("Rule_Init")
end

function Rule_Init()
	LoadPersistentData_Mission()
	if (sectorsCleared[currentMission] == 0) then
		Event_Start( "IntelEvent_Intro" )
		SobGroup_CreateShip("MS_StartGroup", "Hgn_Scout")
		Rule_AddInterval( "Rule_PlayerWins", 2 )
	else
		Event_Start( "IntelEvent_AlreadyDone" )
		Rule_Add( "Rule_EnableExits" )
	end
	Rule_Remove( "Rule_Init" )
end

function Rule_PlayerWins()
	if (Player_IsShipInVolume(0, "GoToVolume") == 1) then
		Ping_Remove(ping_newobj_id)
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
			[[Sound_EnableAllSpeech( 1 )]],
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
		HW2_LocationCardEvent( "Postmortem Tutorial - Mission 8", 5 ), 
	}, 
	{ 
		HW2_Letterbox( 1 ), 
		HW2_Wait( 2 ), 
	}, 
	{
		{
			[[obj_prim_newobj_id = Objective_Add( "Move a Ship", OT_Primary )]],
			[[]]
		}, 
		{
			[[Objective_AddDescription( obj_prim_newobj_id, "Send a ship to the marked destination.")]],
			[[]]
		}, 
		HW2_SubTitleEvent( Actor_FleetIntel, "Send a ship to the marked destination.", 4 ),
		{
			[[ping_newobj_id = HW2_PingCreateWithLabelPoint ( "Target Destination", "GoToVolume" )]],
			[[]],
		}, 
	},
	{
		HW2_Wait( 1 ), 
	},
	{
		HW2_Letterbox( 0 ), 
		HW2_Wait( 2 ), 
		{
			[[Universe_EnableSkip(0)]],
			[[]]
		},
		{
			[[Sound_ExitIntelEvent()]],
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
