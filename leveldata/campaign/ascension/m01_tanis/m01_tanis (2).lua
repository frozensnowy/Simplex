-- Required scripts
dofilepath("data:scripts/SCAR/SCAR_Util.lua")

-- Campaign and Objective Variables
SP_Campaign_Level_ID = 1

-- Primary Objectives
obj_prim_beginharvesting = "Begin Harvesting. Collect 700 RU's."
obj_prim_beginharvesting_id = 0
obj_prim_buildfightersubsystem = "Build a Fighter Facility"
obj_prim_buildfightersubsystem_id = 0
obj_prim_buildtwointerceptors = "Build two Interceptor Squadrons."
obj_prim_buildtwointerceptors_id = 0
obj_prim_researchplasmabomb = "Research Plasma Bomb technology"
obj_prim_researchplasmabomb_id = 0
obj_prim_buildtwobombers = "Build a Squadron of Bombers."
obj_prim_buildtwobombers_id = 0
obj_prim_defeatvaygratchimera = "Defeat Vaygr forces at Chimera."
obj_prim_defeatvaygratchimera_id = 0
obj_prim_movetochimera = "Use the Interceptors to destroy the target drones."
obj_prim_movetochimera_id = 0
obj_prim_eliminatevaygratxanhus = "Eliminate Vaygr Frigate at Station Xanhus using Strike groups"
obj_prim_eliminatevaygratxanhus_id = 0
obj_prim_destroyvaygrgates = "Eliminate the Vaygr Hyperspace Gates and the Vaygr Fighters."
obj_prim_destroyvaygrgates_id = 0
obj_prim_protectmothership = "Protect the Mothership"
obj_prim_protectmothership_id = 0
obj_prim_enterhyperspace = "Enter Hyperspace."
obj_prim_enterhyperspace_id = 0

-- Secondary Objectives
obj_sec_buildcollector = "Build a Resource Collector and order it to start collecting resources."
obj_sec_buildcollector_id = 0

-- Pings
ping_resource_operation = "Resource Operation."
ping_resource_operation_id = 0
ping_targetdrones = "Target Drones"
ping_targetdrones_id = 0
ping_vaygrbombers = "Vaygr Bombers"
ping_vaygrbombers_id = 0
ping_vaygrattackeratxanhus = "Vaygr Frigate Strike Force"
ping_vaygrattackeratxanhus_id = 0
ping_vaygrhyperspacegate_waveone = "Vaygr Hyperspace Gate"
ping_vaygrhyperspacegate_waveone_id = { 0, 0, 0, 0 }

-- Game Variables
g_eventisdone = 1
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_pointer_default = 0
g_waitID = 0
g_MSAttackersGate = 0
g_WaveOne_AttacksIssued = 0
g_WaveOne_HyperspaceIssued = 0
g_WaveOne_GatesDestroyed = 0
g_WaveTwo_HyperspaceIssued = 0
g_WaveTwo_AttacksIssued = 0
g_WaveTwo_OutpostHyperspaceIssued = 0
g_WaveTwo_OutpostAttacksIssued = 0
g_playerBegunPlasma_id = 0
g_gatesdeployed_id = 0
g_playerBegunAttackBombers_id = 0
g_gatedeployed = 0
g_mothershiplaunched = 0
g_gatejustopened = ""
g_dronecount = 0
g_probesdeployed = 0
g_save_id = 0
buildinginterceptors = 0
g_chimeradisabled = 0
g_healthofchimera = SobGroup_HealthPercentage("Station_Chimera")
g_vaygrexithyperspace = 0
g_ipressed = 0
g_cpressed = 0
g_dpressed = 0
g_epressed = 0
g_apressed = 0
g_ppressed = 0
g_opressed = 0
g_lpressed = 0

-- Drones
g_drone = { 0, 0, 0, 0, 0, 0, 0, 0, 0 }
g_dronemoved = { 2, 2, 2, 2, 2, 2, 2, 2, 2 }
g_currentdronebeingswitched = 1

-- Attackers
WaveOne_GateAttackers = { 0, 0, 0 }
g_createattackers = 1

-- Event Table
Events = {}

-- SobGroup Creation
SobGroup_Create("Vgr_MothershipAttackers")


-- New Introduction Event
Events.intelevent_initialization =
{
    {
        { "Universe_EnableSkip(1)", "", }, HW2_LocationCardEvent("$40520", 4), -- TANIS BASE - GREAT WASTELANDS
    },
    {
        { "Sound_SetMuteActor('Fleet')", "", },
        { "Sound_EnableAllSpeech(1)", "", },
        { "Sound_EnterIntelEvent()", "", }, HW2_Wait(1),
    },
    { HW2_Wait(2), },
    {
        { "Camera_Interpolate('here', 'camera_focusonMothership', 3)", "", }, HW2_SubTitleEvent(Actor_FleetCommand, "$990001", 5), -- All standby tests have been completed. Diagnostic systems Report all systems go. Commencing Mothership launch sequence.
    },
    { HW2_Wait(4), },
    { HW2_SubTitleEvent(Actor_Tanis, "$990002", 8), }, -- Tanis Base Alpha to Fleet Command. Confirming all systems green. You are clear to proceed with initial diagnostics.
    { HW2_Wait(4), },
    { HW2_SubTitleEvent(Actor_Tanis, "$990003", 10), }, -- Tanis Base Beta here. Synchronizing telemetry data. Ready to proceed.
    { HW2_Wait(4), },
    { HW2_SubTitleEvent(Actor_FleetCommand, "$990004", 10), }, -- Initiate synchronization protocols and prepare for mission brief.
    { HW2_Wait(4), },
    { HW2_SubTitleEvent(Actor_FleetCommand, "$990005", 10), }, -- Synchronization protocols initiated. Establishing uplink to all fleet units.
    { HW2_Wait(4), },
    { HW2_SubTitleEvent(Actor_FleetCommand, "$990006", 10), }, -- Uplink Established. All systems nominal. We are ready to proceed with mission objectives.
    { HW2_Wait(4), },
    {
        { "Sound_ExitIntelEvent()", "", },
        { "HW2_Letterbox(0)", "", }, HW2_Wait(2),
        { "Sound_SetMuteActor('')", "", },
        { "Universe_EnableSkip(0)", "", },
    },
}

-- Begin Harvesting Event
Events.intelevent_beginharvesting =
{
    {
        { "Sound_SetMuteActor('Fleet')", "", },
        { "Sound_EnableAllSpeech(1)", "", },
        { "Sound_EnterIntelEvent()", "", }, HW2_Wait(1),
    },
    { HW2_Wait(1), },
    {
        { "Camera_Interpolate('here', 'camera_focusonMothership', 3)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40530", 5), -- This is Fleet Intelligence.
    },
    { HW2_Wait(2), },
    { HW2_SubTitleEvent(Actor_FleetIntel, "$40531", 8), }, -- Our task is to analyze sensor data and generate mission objectives.
    { HW2_Wait(3), },
    { HW2_SubTitleEvent(Actor_FleetIntel, "$40532", 10), }, -- Before launching the Mothership we must conduct a series of trials to ensure all critical systems are operational.
    { HW2_Wait(2), },
    { HW2_SubTitleEvent(Actor_FleetIntel, "$40533", 10), }, -- Throughout these trials the Mothership will be running with a minimal crew, and will remain docked with Tanis.
    { HW2_Wait(3), },
    { HW2_SubTitleEvent(Actor_FleetIntel, "$40534", 10), }, -- Once these trials are complete, we will launch the Mothership and test the Hyperspace Core.
    { HW2_Wait(3), },
    {
        { "Sensors_EnableCameraZoom(0)", "", },
        { "Sensors_Toggle(1)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40535", 5), -- The first trial will test the Resourcing System.
        { "Camera_Interpolate('here', 'camera_FocusOnResources', 2)", "", },
    },
    { HW2_Wait(2), },
    {
        { "Player_FillShipsByType('tempSobGroup_SP', 0, 'Hgn_ResourceCollector')", "", },
        { "g_pointer_default1 = HW2_CreateEventPointerSobGroup('tempSobGroup_SP')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40536", 10), -- A Resource Collector is standing by.
    },
    { HW2_Wait(1), },
    {
        { "EventPointer_Remove(g_pointer_default1)", "", },
        { "g_pointer_default1 = HW2_CreateEventPointerVolume('vol_Resources')", "", },
        { "obj_prim_beginharvesting_id = Objective_Add(obj_prim_beginharvesting, OT_Primary)", "", },
        { "Objective_AddDescription(obj_prim_beginharvesting_id, '$40950')", "", }, -- To collect Resources, select your Resource Collectors and then RIGHT-CLICK on Resource Containers.
        { "ping_resource_operation_id = HW2_PingCreateWithLabelPoint(ping_resource_operation, 'vol_Resources')", "", },
        { "Ping_AddDescription(ping_resource_operation_id, 0, '$40900')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40537", 10), -- Begin retrieval of resource containers at this location.
    },
    {
        { "EventPointer_Remove(g_pointer_default1)", "", },
        { "Camera_Interpolate('here', 'camera_focusOnCollector', 2)", "", },
        { "Sensors_Toggle(0)", "", }, HW2_Wait(2),
    },
    {
        { "Sound_ExitIntelEvent()", "", },
        { "Sound_SetMuteActor('')", "", }, HW2_Letterbox(0), HW2_Wait(2),
        { "Sensors_EnableCameraZoom(1)", "", },
        { "Universe_EnableSkip(0)", "", },
    },
}



Events.intelevent_subsystemconstruction =
    {
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", }, HW2_SubTitleEvent(Actor_FleetCommand, "$40540", 8), },
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40541", 5), },
        {
            { "Universe_EnableSkip(1)", "", }, HW2_Letterbox(1), HW2_Wait(2), },
        {
            { "Sensors_EnableCameraZoom( 0 )", "", },
            { "Sensors_Toggle( 0 )", "", },
            { "Camera_Interpolate( 'here', 'camera_focusOnProdFacilities', 2)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40542", 8), },
        { HW2_Wait(1), },
        {
            { "obj_prim_buildfightersubsystem_id = Objective_Add( obj_prim_buildfightersubsystem, OT_Primary )", "", },
            { "Objective_AddDescription( obj_prim_buildfightersubsystem_id, '$40960')", "", },
            { "UI_FlashButton('NewTaskbar', 'btnBuild', -1)", "", },
            { "Rule_Add( 'Rule_monitorBuildBtn' )", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40543", 5), },
        { HW2_Letterbox(0), HW2_Wait(2),
            { "Sensors_EnableCameraZoom( 1 )", "", },
            { "Sound_SetMuteActor('')", "", },
            { "Sound_ExitIntelEvent()", "", },
            { "Universe_EnableSkip(0)", "", },
        },
    }
Events.intelevent_constructinterceptors =
    {
        {
            { "Universe_EnableSkip(1)", "", },
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", }, HW2_Letterbox(1), HW2_Wait(2), },
        { HW2_Wait(5), },
        {
            { "Sensors_EnableCameraZoom( 0 )", "", },
            { "Sensors_Toggle( 0 )", "", },
            { "g_pointer_default = HW2_CreateEventPointerSubSystem( 'FighterProduction', 'Mothership' )", "", },
            { "Camera_Interpolate( 'here', 'camera_focusOnFighterSub', 2)", "", }, HW2_SubTitleEvent(Actor_FleetCommand, "$40550", 5), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40551", 5), },
        { HW2_Wait(1), },
        {
            { "EventPointer_Remove(g_pointer_default)", "", },
            { "UI_FlashButton('NewTaskbar', 'btnBuild', -1)", "", },
            { "Rule_Add( 'Rule_monitorBuildBtn' )", "", },
            { "obj_prim_buildtwointerceptors_id = Objective_Add( obj_prim_buildtwointerceptors, OT_Primary )", "", },
            { "Objective_AddDescription( obj_prim_buildtwointerceptors_id, '$40965')", "", },
            { "Objective_AddDescription( obj_prim_buildtwointerceptors_id, '$40966')", "", },
            --{ "Player_UnrestrictBuildOption( g_playerID, 'Hgn_Interceptor' )", "", },
            HW2_SubTitleEvent(Actor_FleetIntel, "$40552", 5), },
        { HW2_Letterbox(0), HW2_Wait(2),
            { "Sound_SetMuteActor('')", "", },
            { "Sound_ExitIntelEvent()", "", },
            { "Sensors_EnableCameraZoom( 1 )", "", },
            { "Universe_EnableSkip(0)", "", },
        },
    }
Events.intelevent_movetochimera =
    {
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", }, HW2_Wait(4), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40570", 8), },
        {
            { "Universe_EnableSkip(1)", "", }, HW2_Letterbox(1), HW2_Wait(2), },
        {
            { "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
        {
            { "Camera_Interpolate( 'here', 'camera_focusOnChimera', 2)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40571", 10), },
        { HW2_Wait(1.5), },
        {
            { "g_pointer_default = HW2_CreateEventPointerVolume( 'vol_TargetDronesLocation' )", "", },
            { "obj_prim_movetochimera_id = Objective_Add( obj_prim_movetochimera, OT_Primary )", "", },
            { "Objective_AddDescription( obj_prim_movetochimera_id, '$40985')", "", },
            { "Objective_AddDescription( obj_prim_movetochimera_id, '$40986')", "", },
            { "Objective_AddDescription( obj_prim_movetochimera_id, '$40987')", "", },
            { "Rule_AddInterval( 'SwitchOwnerDrones', 0.5 )", "", },
            { "ping_targetdrones_id = HW2_PingCreateWithLabelPoint( ping_targetdrones, 'vol_TargetDronesLocation' )", "", },
            { "Ping_AddDescription(ping_targetdrones_id, 0, '$40905')", "", },
            { "Ping_AddDescription(ping_targetdrones_id, 1, '$40906')", "", },
            { "Ping_AddDescription(ping_targetdrones_id, 2, '$40907')", "", },
            { "Camera_Interpolate( 'here', 'camera_focusOnDrones', 2)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40572", 8), },
        { HW2_Wait(1), },
        {
            { "EventPointer_Remove(g_pointer_default)", "", },
            { "Player_FillShipsByType('tempSobGroup_SP',0,'Hgn_Interceptor')", "", },
            { "Camera_FocusSobGroupWithBuffer('tempSobGroup_SP',1000,10,2 )", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40573", 8),
            { "SobGroup_FillShipsByType( 'tempSobGroup_SP', 'Player_Ships0', 'Hgn_Interceptor' )", "", },
            { "g_pointer_default = HW2_CreateEventPointerSobGroup( 'tempSobGroup_SP'  )", "", },
        },
        { HW2_Wait(1), },
        {
            { "EventPointer_Remove(g_pointer_default)", "", },
            { "Sensors_Toggle( 0 )", "", }, HW2_Wait(1), },
        { HW2_Letterbox(0), HW2_Wait(2),
            { "Sound_SetMuteActor('')", "", },
            { "Sound_ExitIntelEvent()", "", },
            { "Universe_EnableSkip(0)", "", },
        },
    }
Events.speechevent_attackcomplete =
    {
        {
            { "Sound_EnterIntelEvent()", "", }, HW2_SubTitleEvent(Actor_AllShips, "$40710", 5), },
        {
            { "Sound_SetMuteActor('')", "", },
            { "Sound_ExitIntelEvent()", "", },
        },
    }
Events.intelevent_perimiterbreached =
    {
        {
            { "Universe_EnableSkip(1)", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
            { "Sound_EnterIntelEvent()", "", },
        },
        {
            { "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
        {
            { "Camera_Interpolate( 'here', 'camera_focusOnVaygrBombers', 3)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40580", 8), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40581", 5), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40582", 5), },
        {
            { "EventPointer_Remove(g_pointer_default)", "", },
            { "g_pointer_default1 = HW2_CreateEventPointerSobGroup('Vgr_Bombers')", "", },
            { "ping_vaygrbombers_id = Ping_AddSobGroup( ping_vaygrbombers, 'anomaly', 'Vgr_Bombers' )", "", },
            { "Ping_AddDescription(ping_vaygrbombers_id, 0, '$40910')", "", },
            { "obj_prim_defeatvaygratchimera_id = Objective_Add( obj_prim_defeatvaygratchimera, OT_Primary )", "", },
            { "Objective_AddDescription( obj_prim_defeatvaygratchimera_id, '$40910')", "", },
            { "Objective_AddDescription( obj_prim_defeatvaygratchimera_id, '$40981')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40583", 10), },
        {
            { "EventPointer_Remove(g_pointer_default1)", "", }, HW2_Wait(0.4), },
        {
            { "Sensors_Toggle( 0 )", "", }, HW2_Letterbox(0), HW2_Wait(2),
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
            { "Universe_EnableSkip(0)", "", },
        },
    }
Events.autofocus_premothershiplaunches =
    {
        {
            { "g_eventisdone = 0", "", },
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", }, HW2_Wait(3), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40651", 5), },
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(Actor_AllShips, "$40652", 10), },
        { HW2_SubTitleEvent(Actor_AllShips, "$40653", 5), },
        { HW2_SubTitleEvent(Actor_AllShips, "$40654", 5), },
        { HW2_SubTitleEvent(Actor_AllShips, "$40655", 5), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40656", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
            { "g_eventisdone = 1", "", },
        },
    }
Events.autofocus_mothershiplaunches =
    {
        {
            { "g_eventisdone = 0", "", }, HW2_Wait(2), },
        {
            { "Universe_EnableSkip(1)", "", },
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
            { "Universe_AllowPlayerOrders( 0 )", "", },
            { "Camera_AllowControl(0)", "", },
            { "SobGroup_DeSelectAll()", "", },
            { "Camera_Interpolate( 'here', 'camera_focusChimeraPostAttack', 2)", "", }, HW2_Letterbox(1), HW2_Wait(2), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40650", 8), },
        {
            { "Camera_Interpolate( 'here', 'camera_focusOnMSAttackers', 2)", "", }, HW2_Wait(2), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40666", 8), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40667", 8), },
        {
            { "Camera_Interpolate( 'here', 'camera_MSLaunchCamera1', 4)", "", }, HW2_Wait(2), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40657", 5), },
        { HW2_Wait(2), },
        { HW2_SubTitleEvent(Actor_Tanis, "$40658", 5),
            { "Camera_Interpolate( 'here', 'camera_MSLaunchCamera2', 0)", "", },
        },
        { HW2_Wait(2), },
        { HW2_SubTitleEvent(Actor_Tanis, "$40659", 5),
            { "FX_PlayEffect( 'ion_cannon_steam_spray', 'vol_steam_2', 4.0 )", "", },
            { "SobGroup_Launch( 'Mothership', 'Tanis' )", "", },
        },
        { HW2_Wait(6), },
        { HW2_SubTitleEvent(Actor_Tanis, "$40660", 5),
        		{ "SobGroup_Stop( 0, 'Mothership')", "", },
        },
        { HW2_Wait(6),
            { "Camera_Interpolate( 'here', 'camera_MSLaunchCamera3', 20)", "", },
        },
        { HW2_SubTitleEvent(Actor_Tanis, "$40661", 5), },
        { HW2_Wait(2), },
        { HW2_SubTitleEvent(Actor_Tanis, "$40662", 5), },
        { HW2_Wait(3), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40663", 5), },
        { HW2_Wait(3), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40664", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
            { "Universe_AllowPlayerOrders( 1 )", "", },
            { "Camera_AllowControl( 1 )", "", },
            { "Universe_EnableSkip(0)", "", },
            { "g_eventisdone = 1", "", },
        },
    }
Events.intelevent_chimeraissafe =
    {
        {
            { "Universe_EnableSkip(1)", "", },
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
        },
        { HW2_Wait(2), },
        {
            { "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
        {
            { "Camera_Interpolate( 'here', 'camera_focusOnIncomingEnemy', 2)", "", },
            { "g_pointer_default = HW2_CreateEventPointerSobGroup('WaveOne_Gate_1b')", "", },
            { "g_pointer_default1 = HW2_CreateEventPointerSobGroup('WaveOne_Gate_2b')", "", },
            { "g_pointer_default2 = HW2_CreateEventPointerSobGroup('WaveOne_Gate_3b')", "", },
            { "g_pointer_default3 = HW2_CreateEventPointerSobGroup('MothershipAttackers')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40590", 8), },
        {
            { "Timer_Start( 0, 120 )", "", },
            { "Timer_Pause( 0 )", "", },
            { "Subtitle_TimeCounter( 0, 40521 )", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40691", 8), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40612", 8), },
        {
            { "Camera_FocusSobGroupWithBuffer( 'MothershipAttackers', 3000, 10, 2 )", "", },
            { "UI_FlashButton('NewTaskbar', 'btnBuild', 10)", "", },
            { "obj_prim_buildtwobombers_id = Objective_Add( obj_prim_buildtwobombers, OT_Secondary )", "", },
            { "Objective_AddDescription( obj_prim_buildtwobombers_id, '$40975')", "", },
            { "obj_prim_protectmothership_id = Objective_Add( obj_prim_protectmothership, OT_Primary )", "", },
            { "Objective_AddDescription( obj_prim_protectmothership_id, '$40998')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40613", 8), },
        {
            { "EventPointer_Remove(g_pointer_default)", "", },
            { "EventPointer_Remove(g_pointer_default1)", "", },
            { "EventPointer_Remove(g_pointer_default2)", "", },
            { "EventPointer_Remove(g_pointer_default3)", "", },
            { "Sensors_Toggle( 0 )", "", }, HW2_Wait(0.5), },
        { HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(2),
            { "Timer_Resume(0)", "", },
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
            { "Universe_EnableSkip(0)", "", },
        },
    }
Events.intelevent_moreincoming =
    {
        { HW2_Wait(5), },
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
            { "Camera_Interpolate( 'here', 'camera_focusOnGate', 2)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40600", 5), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40601", 5), },
        { HW2_Pause(1),
            { "Universe_EnableSkip(1)", "", }, HW2_Letterbox(1), HW2_Wait(2), },
        {
            { "Sensors_Toggle( 1 )", "", }, HW2_Wait(1), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40602", 8), },
        {
            { "ping_vaygrhyperspacegate_waveone_id[1] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_1b' )", "", },
            { "ping_vaygrhyperspacegate_waveone_id[2] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_2b' )", "", },
            { "ping_vaygrhyperspacegate_waveone_id[3] = HW2_PingCreateWithLabel( ping_vaygrhyperspacegate_waveone, 'WaveOne_Gate_3b' )", "", },
            { "obj_prim_destroyvaygrgates_id = Objective_Add( obj_prim_destroyvaygrgates, OT_Primary )", "", },
            { "Objective_AddDescription( obj_prim_destroyvaygrgates_id , '$40995')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40603", 10), },
        { HW2_Wait(1), },
        {
            { "Sensors_Toggle( 0 )", "", }, HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(2),
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
            { "Universe_EnableSkip(0)", "", },
        },
    }
Events.speechevent_buildattackbombers =
    {
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
            { "obj_prim_buildtwobombers_id = Objective_Add( obj_prim_buildtwobombers, OT_Secondary )", "", },
            { "Objective_AddDescription( obj_prim_buildtwobombers_id, '$40975')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40610", 7), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40611", 7), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40612", 7), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
        },
    }
Events.speechevent_firstgatedestroyed =
    {
        { HW2_Wait(2),
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
        },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40560", 5), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40561", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
        },
    }
Events.speechevent_attackbombersdestroyed =
    {
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40620", 5), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40621", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
        },
    }
Events.speechevent_chimerareporting =
    {
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", }, HW2_SubTitleEvent(Actor_Chimera, "$40640", 5), },
        { HW2_SubTitleEvent(Actor_Chimera, "$40641", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
        },
    }
Events.speechevent_newbuildoptionsavailable =
    {
        { HW2_Wait(10),
            { "Sound_SetMuteActor('Fleet')", "", },
        },
        {
            { "Sound_EnterIntelEvent()", "", }, HW2_SubTitleEvent(Actor_FleetCommand, "$40720", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
        },
    }
Events.speechevent_ic =
    {
        {
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
        },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40710", 5), },
        {
            { "Sound_ExitIntelEvent()", "", },
            { "Sound_SetMuteActor('')", "", },
        },
    }
Events.intelevent_mothershipjumps =
    {
        {
            { "Camera_AllowControl(0)", "", },
            { "Universe_AllowPlayerOrders( 0 )", "", },
            { "Universe_EnableSkip(1)", "", },
            { "Sound_EnterIntelEvent()", "", },
            { "Sound_SetMuteActor('Fleet')", "", },
            { "SobGroup_SetAutoLaunch('Mothership', ShipHoldStayDockedAlways)", "", },
            { "SobGroup_SetTactics('Player_Ships0', PassiveTactics)", "", },
            { "Sensors_EnableCameraZoom( 0 )", "", },
            { "Sensors_Toggle( 0 )", "", },
            { "SobGroup_DeSelectAll()", "", }, HW2_Wait(1), HW2_Letterbox(1), },
        { HW2_SubTitleEvent(Actor_FleetIntel, "$40630", 8), },
        { HW2_Wait(1), },
        {
            { "Camera_Interpolate( 'here', 'camera_mothershipHyperspace', 3)", "", }, HW2_SubTitleEvent(Actor_FleetIntel, "$40631", 7),
            { "SP_SobGroup_DockOrParadeSobGroupAtEnd( 'Player_Ships0', 'Mothership')", "", },
        },
        { HW2_Wait(10), },
        { HW2_Wait(12),
            { "g_vaygrexithyperspace = 1", "", },
            { "Player_InstantlyGatherAllResources( 0 )", "", },
        },
        {
            { "Camera_Interpolate( 'here', 'camera_focusOnVaygrAttacking', 3)", "", }, HW2_SubTitleEvent(Actor_FleetCommand, "$40632", 7), },
        { HW2_Wait(8), },
        {
            { "Camera_Interpolate( 'here', 'camera_focusOnVaygrAttacking2', 0)", "", }, HW2_Wait(5), },
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40633", 7), },
        { HW2_Wait(1), },
        { HW2_SubTitleEvent(Actor_FleetCommand, "$40634", 7),
            { "Camera_Interpolate( 'here', 'camera_MSActuallyEntersHS', 0)", "", },
            { "SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", "", }, HW2_Wait(6), },
        {
            { "FX_StartEvent( 'Tanis', 'Pyro' )", "", }, HW2_Wait(3), },
        {
            { "SobGroup_TakeDamage( 'Tanis_Structure_2',1)", "", }, HW2_Wait(1), },
        {
            { "Universe_Fade( 1, 2 )", "", }, HW2_Wait(3), },
        { HW2_LocationCardEvent("$40523", 4), },
        { HW2_Wait(2), },
        {
            { "Camera_AllowControl(1)", "", },
            { "setMissionComplete( 1 )", "", },
        },
    }
Events.vaygrexithyperspace =
    {
        {
            { "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_6', 'vol_Vgr_HyperspaceExit_6' )", "", }, HW2_Wait(1.5), },
        {
            { "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_2', 'vol_Vgr_HyperspaceExit_2' )", "", }, HW2_Wait(0.1), },
        {
            { "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_5', 'vol_Vgr_HyperspaceExit_5' )", "", }, HW2_Wait(0.5), },
        {
            { "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_1', 'vol_Vgr_HyperspaceExit_1' )", "", }, HW2_Wait(0.8), },
        {
            { "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_3', 'vol_Vgr_HyperspaceExit_3' )", "", }, HW2_Wait(1), },
        {
            { "SobGroup_ExitHyperSpace('Vgr_HyperspaceIn_4', 'vol_Vgr_HyperspaceExit_4' )", "", },
        },
    }
Events.speechevent_playerloses =
    {
        {
            { "Sound_EnableAllSpeech(0)", "", },
            { "Universe_AllowPlayerOrders( 0 )", "", }, HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2), },
        { HW2_LocationCardEvent("$40522", 4), },
        {
            { "Universe_AllowPlayerOrders( 1 )", "", },
            { "Sound_EnableAllSpeech(1)", "", },
            { "setMissionComplete( 0 )", "", },
        },
    }

function Rule_PlaySaveGameLocationCard()
    Subtitle_Message("$3651", 3)
    Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function OnInit()
    print("oninit issued")
    Rule_Add("Rule_Init")
    Rule_Add("Animate_MothershipDoorOpen")
    Sound_SetMuteActor("All_")
    Sound_EnableAllSpeech(0)
    SinglePlayer_OnInit()		--COMPLEX SIMPLE ONINIT
end
dofilepath("data:leveldata/campaign/singleplayer_oninit.lua")				--COMPLEX SIMPLE ONINIT

function testit()
    Event_Start("autofocus_mothershiplaunches")
end

function test1()
    Event_Start("intelevent_mothershipjumps")
    Rule_Add("Rule_VaygrEnterHyperspace")
end

function DisableMothership()
    for i = 1, 12 do
        SobGroup_ChangePower("Mothership", "Weapon_HullDefense" .. i, 0)
    end

    -- SobGroup_CreateSubSystem("Mothership", "Hgn_MS_Module_Research")
    SobGroup_SetSpeed("Mothership", 0.5)

    for i = 1, 3 do
        Player_GrantResearchOption(0, "SensorsDowngrade" .. i)
    end

    SobGroup_AbilityActivate("Mothership", AB_Dock, 0)
    SobGroup_AbilityActivate("Mothership", AB_Move, 0)
end

function Animate_MothershipDoorOpen()
    if  Universe_GameTime()>=1 then
        SobGroup_SetMadState("Mothership", "NIS00")
        Rule_Remove("Animate_MothershipDoorOpen")
    end

end

function Animate_MothershipDoorClose()
    if  Universe_GameTime()>=67 then
        SobGroup_SetMadState("Mothership", "NIS01")
        Rule_Remove("Animate_MothershipDoorClose")
    end

end

function skippingNIS()
    SobGroup_SetMadState("Mothership", "Normal")
    UI_UnBindKeyEvent(ESCKEY)
    Rule_Remove("Animate_MothershipDoorClose")
    Rule_Remove("Animate_MothershipDoorOpen")
end

function Rule_monitorBuildBtn()
    if  UI_IsScreenActive("NewBuildMenu")==1 then
        UI_StopFlashButton("NewTaskbar", "btnBuild")
        Rule_Remove("Rule_monitorBuildBtn")
    end

end


function Rule_Init()

    Universe_EnableCmd(0, MUI_ScuttleCommand)
    SobGroup_AbilityActivate("Player_Ships0", AB_Scuttle, 0)
    SobGroup_AbilityActivate("Player_Ships0", AB_Retire, 0)
    SobGroup_Create("shipsInVolume")
    SobGroup_Create("fightersInVolume")
    SobGroup_Create("tempSobGroup_SP")
    UI_BindKeyEvent(ESCKEY, "skippingNIS")
    SobGroup_DockSobGroupInstant("Mothership", "Tanis")
    SobGroup_AllowPassiveActionsAlways("Mothership", 1)
    Rule_Add("Animate_MothershipDoorOpen")
    Rule_Add("Animate_MothershipDoorClose")
    Sound_SpeechSubtitlePath("speech:missions/m_01/")
    Player_SetPlayerNameAdvanced(0, "Hiigaran Navy")
    Player_SetPlayerNameAdvanced(1, "")
    Player_SetPlayerNameAdvanced(2, "Tanis Defence Force")
    Player_SetPlayerNameAdvanced(3, "Vaygr Assault Force")
    SetAlliance(0, 1)
    SetAlliance(1, 0)
    Player_SetDefaultShipTactic(1, AggressiveTactics)
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    CPU_Enable(3, 0)
    DisableMothership()
    FE_TaskbarIgnoreProfilePhase(1)
    g_NISState = NISGetPlayingHandle("nis/NIS01A")
    NISDisableInterface(1)
    Rule_Add("Rule_NIS01AComplete")
    Rule_Remove("Rule_Init")
    Rule_Add("Rule_PlayerWins")
    Rule_Add("Rule_PlayerLose")
end

function PostNISInit()
    Player_GrantResearchOption(3, "HyperspaceRecoveryTimeUpgradeSPGAME")
    Player_GrantResearchOption(3, "HyperspaceTransitionTimeUpgradeSPGAME")
    HW2_SetResearchLevel(1)
end

function Rule_NIS01AComplete()
    if NISComplete(g_NISState) == 1 then
        SobGroup_SetMadState("Mothership", "Normal")
        g_NISState = 0
        UI_UnBindKeyEvent(ESCKEY)
        Sound_MusicPlayType("data:sound/music/ambient/AMB_01", MUS_Ambient)
        Event_Start("intelevent_initialization")
        PostNISInit()
        Rule_Add("Rule_IntroductionEventComplete")
        Rule_Remove("Rule_NIS01AComplete")
    end
end

function Rule_IntroductionEventComplete()
    if Event_IsDone("intelevent_initialization") == 1 then
        Event_Start("intelevent_beginharvesting")
        Rule_Add("Rule_OpeningIntelEventComplete")
        Rule_Remove("Rule_IntroductionEventComplete")
    end
end

function Rule_OpeningIntelEventComplete()
    if Event_IsDone("intelevent_beginharvesting") == 1 then
        UI_ClearEventScreen()
        Camera_SetLetterboxStateNoUI(0, 0)
        Rule_Add("Rule_BuildSubsystems")
        Rule_Remove("Rule_OpeningIntelEventComplete")
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_SaveTheGameMissionStart", 1)

        -- simplex restrict
        local restrictedBuildOptions = {
            "Hgn_MS_Production_CorvetteMover",
            "Kpr_Mover",
            "FighterProduction",
            "CorvetteProduction",
            "FrigateProduction",
            "CapShipProduction",
            "RepairSystem",
            "PlatformProduction",
            "FireControlTower",
            "Research",
            "AdvancedResearch",
            "AdvancedResearch1"
        }

        -- Manually iterate over the table elements
        local i = 1
        while restrictedBuildOptions[i] do
            Player_RestrictBuildOption(0, restrictedBuildOptions[i])
            i = i + 1
        end
    end
end





function Rule_SaveTheGameMissionStart()
    Rule_Remove("Rule_SaveTheGameMissionStart")
    g_save_id = (g_save_id + 1)
    Campaign_QuickSaveNb(g_save_id, "$6400")
end

function Rule_BeginHarvesting()
    if  Player_GetRU(g_playerID)>=700 then
        Objective_SetState(obj_prim_beginharvesting_id, OS_Complete)
        Rule_Remove("Rule_BeginHarvesting")
    end

end

function Rule_BuildSubsystems()
    if  Player_GetRU(g_playerID)>=700 then
        Ping_Remove(ping_resource_operation_id)
        Objective_SetState(obj_prim_beginharvesting_id, OS_Complete)
        Player_UnrestrictBuildOption(0, "FighterProduction")
        Event_Start("intelevent_subsystemconstruction")
        Rule_Add("Rule_HasBuiltFighterSubsystem")
        Rule_Remove("Rule_BuildSubsystems")
        Rule_Add("Rule_SaveAfterBuildFacility")
    end

end

function Rule_SaveAfterBuildFacility()
    if  Event_IsDone("intelevent_subsystemconstruction")==1 then
        --Player_UnrestrictBuildOption(g_playerID, "Hgn_MS_Production_Fighter")
        UI_AddToEventScreen("STATUS_BuildAvaliable_1")
        Rule_Remove("Rule_SaveAfterBuildFacility")
    end

end

function Rule_HasBuiltFighterSubsystem()
    if  Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_playerID, "hgn_interceptor")>=1 or SobGroup_GetHardPointHealth("Mothership", "Production 1") > 0 or Player_HasQueuedBuild(g_playerID, "Hgn_Interceptor")==1 then		--Stats_ShipsCreated(g_playerID)>=1 then
        if SobGroup_GetHardPointHealth("Mothership", "Production 1") > 0 then
        	SobGroup_SetInvulnerabilityOfHardPoint("Mothership", "HardpointProduction1", 1)
        end
        Objective_SetState(obj_prim_buildfightersubsystem_id, OS_Complete)
        Rule_Remove("Rule_HasBuiltFighterSubsystem")
        Event_Start("intelevent_constructinterceptors")
        Rule_Add("Rule_HasBuiltInterceptors")
        Rule_Add("Rule_PlayerHasBegunBuildingInterceptors")
        Rule_Add("Rule_SaveAfterBuildFighters")
    end

end

function Rule_SaveAfterBuildFighters()
    if  Event_IsDone("intelevent_constructinterceptors")==1 then
        Rule_Remove("Rule_SaveAfterBuildFighters")
    end

end

function Rule_PlayerHasBegunBuildingInterceptors()
    if  Player_HasQueuedBuild(g_playerID, "Hgn_Interceptor")==1 or Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_playerID, "hgn_interceptor")>=1 then
        Rule_AddInterval("Rule_DeployDrones", 20)
        Rule_Remove("Rule_PlayerHasBegunBuildingInterceptors")
    end

end

function Rule_DeployDrones()
    SobGroup_Create("AllTargetDrones")
    DeployDrones()
    Rule_AddInterval("MoveDrones", 4)
    Rule_Remove("Rule_DeployDrones")
end

function DeployDrones()
    for i = 1,9,1 do
        g_drone[i] = SobGroup_CreateShip("Station_Chimera", "Hgn_TargetDrone")
        g_probesdeployed = 1
        SobGroup_SobGroupAdd("AllTargetDrones", g_drone[i])
    end
end

function SwitchOwnerDrones()
    if  g_currentdronebeingswitched>=9 then
        Rule_Remove("SwitchOwnerDrones")
    end

    SobGroup_SwitchOwner(g_drone[g_currentdronebeingswitched], 2)
    g_currentdronebeingswitched = (g_currentdronebeingswitched + 1)
end

function MoveDrones()
    droneslaunched = 0
    for i = 1,9,1 do
        if  g_dronemoved[i]~=0 and SobGroup_IsDockedSobGroup(g_drone[i], "Station_Chimera")==0 then
            SobGroup_Move(2, g_drone[i], "vol_TargetDrone_"..i)
            g_dronemoved[i] = 1
            droneslaunched = (droneslaunched + 1)
        end

    end
    if  droneslaunched==9 then
        Rule_Remove("MoveDrones")
    end

end

function Rule_HasBuiltInterceptors()
    if  droneslaunched==9 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_playerID, "hgn_interceptor")>=1 then		--Stats_ShipsCreated(g_playerID)>=5 then
        Objective_SetState(obj_prim_buildtwointerceptors_id, OS_Complete)
        Event_Start("intelevent_movetochimera")
        Rule_Remove("Rule_HasBuiltInterceptors")
        Rule_Add("Rule_MoveToChimeraCompleted")
    end

end

function Rule_MoveToChimeraCompleted()
    if  Event_IsDone("intelevent_movetochimera")==1 then
        Rule_Add("Rule_PlayerIsAtChimera")
        Rule_Remove("Rule_MoveToChimeraCompleted")
    end

end

function Rule_ChimeraReporting()
    Player_FillShipsByType("tempSobGroup_SP", 2, "Hgn_TargetDrone")
    if  g_probesdeployed==1 and SobGroup_Count("tempSobGroup_SP")==3 then
        Event_Start("speechevent_chimerareporting")
        Rule_Remove("Rule_ChimeraReporting")
    end

end

function Rule_PlayerIsAtChimera()
    Player_FillShipsByType("tempSobGroup_SP", 2, "Hgn_TargetDrone")
    if  g_probesdeployed==1 and SobGroup_Empty("tempSobGroup_SP")==1 and Event_IsDone("speechevent_chimerareporting")==1 then
        Objective_SetState(obj_prim_movetochimera_id, OS_Complete)
        Ping_Remove(ping_targetdrones_id)
        Rule_AddInterval("Rule_PlayNIS01B", 2)
        Rule_Remove("Rule_PlayerIsAtChimera")
    end

end

function Rule_PlayNIS01B()
    if  Event_IsDone("speechevent_attackcomplete")==1 and Event_IsDone("speechevent_chimerareporting")==1 then
        SobGroup_FillShipsByType("tempSobGroup_SP", "Player_Ships0", "Hgn_Interceptor")
        SobGroup_MoveToSobGroup("tempSobGroup_SP", "Station_Chimera")
        NISLoad("nis/NIS01B")
        Sensors_EnableCameraZoom(0)
        Sensors_Toggle(0)
        Sensors_EnableToggle(0)
        g_NISState = NISPlay("nis/NIS01B")
        Rule_Add("Rule_NIS01B_completed")
        Rule_Remove("Rule_PlayNIS01B")
        Sensors_EnableCameraZoom(1)
    end

end

function SpawnMoreVaygrBombers()
    SobGroup_FillShipsByType("tempSobGroup_SP", "Player_Ships0", "Hgn_Interceptor")
    numberOfInterceptors = SobGroup_Count("tempSobGroup_SP")
    print("interceptors at chimera: "..numberOfInterceptors)
    for i=1,5,1 do 	--was "while do"? dead loop!
        numberOfNewAttackBombers = numberOfInterceptors / 5
        floor(numberOfNewAttackBombers)
        numberOfNewAttackBombers = (numberOfNewAttackBombers + -2)
        for i = 1,numberOfNewAttackBombers,1 do
            SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "Vgr_Bombers", "Vgr_Bombers", "vol_SpawnMoreBomberSquads")
        end
    end

end

function Rule_NIS01B_completed()
    if  NISComplete(g_NISState)==1 then
        Sensors_EnableToggle(1)
        SobGroup_Spawn("Vgr_Bombers", "vol_SpawnMoreBomberSquads_1")
        Sound_MusicPlayType("data:sound/music/battle/battle_01", MUS_Battle)
        SpawnMoreVaygrBombers()
        Event_Start("intelevent_perimiterbreached")
        SobGroup_Attack(3, "Vgr_Bombers", "Station_Chimera")
        SobGroup_Create("ChimerasInterceptors")
        SobGroup_SpawnNewShipInSobGroup(0, "Hgn_Interceptor", "ChimeraInterceptors", "ChimerasInterceptors", "vol_ChimeraInterceptors")
        SobGroup_MoveToSobGroup("ChimerasInterceptors", "Vgr_Bombers")
        Rule_AddInterval("Rule_StopNewInterceptors", 1)
        Rule_Remove("Rule_NIS01B_completed")
        Rule_Add("Rule_KeepChimeraAlive")
        Rule_Add("Rule_DisableChimera")
        Rule_Add("Rule_DamageChimera")
        Rule_Add("Rule_ChimeraAttackersEliminated")
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_SaveTheGameVaygrAttack", 1)
    end

end

function Rule_SaveTheGameVaygrAttack()
    Rule_Remove("Rule_SaveTheGameVaygrAttack")
    g_save_id = (g_save_id + 1)
    Campaign_QuickSaveNb(g_save_id, "$6401")
end

function Rule_StopNewInterceptors()
    SobGroup_Stop(0, "ChimerasInterceptors")
    Rule_Remove("Rule_StopNewInterceptors")
end

function Rule_KeepChimeraAlive()
    if  SobGroup_HealthPercentage("Station_Chimera")<=0.15 then
        SobGroup_SetHealth("Station_Chimera", 0.1)
        g_chimeradisabled = 1
    end

end

function Rule_DamageChimera()
    if  SobGroup_HealthPercentage("Station_Chimera")<g_healthofchimera then
        if  SobGroup_HealthPercentage("Station_Chimera")>=0.15 then
            SobGroup_TakeDamage("Station_Chimera", 0.05)
            SobGroup_FillBattleScar("Station_Chimera", "Plasma_Bomb/Plasma_Bomb")
            g_healthofchimera = SobGroup_HealthPercentage("Station_Chimera")
        end

    end

end

function Rule_DisableChimera()
    if  SobGroup_HealthPercentage("Station_Chimera")<=0.5 then
        SobGroup_AbilityActivate("Station_Chimera", AB_Sensors, 0)
        SobGroup_AbilityActivate("Station_Chimera", AB_Steering, 0)
        Rule_Remove("Rule_DisableChimera")
    end

end

function Rule_ChimeraAttackersEliminated()
    if  SobGroup_Empty("Vgr_Bombers")==1 then
        Objective_SetState(obj_prim_defeatvaygratchimera_id, OS_Complete)
        SobGroup_AbilityActivate("Station_Chimera", AB_Sensors, 0)
        SobGroup_AbilityActivate("Station_Chimera", AB_Steering, 0)
        Rule_Add("Rule_CreateMothershipAttackers")
        Rule_Add("Rule_LaunchTheMothership")
        Rule_Remove("Rule_DamageChimera")
        Rule_Remove("Rule_KeepChimeraAlive")
        Rule_Remove("Rule_ChimeraAttackersEliminated")
    end

end

function Rule_CreateMothershipAttackers()
    SobGroup_Create("MothershipAttackers")
    SobGroup_Create("MothershipAttackers_Bombers_1")
    SobGroup_Create("MothershipAttackers_Bombers_2")
    for i=0,6,1 do
    	SobGroup_SpawnNewShipInSobGroup(3, "Vgr_HeavyMissileFrigate", "MothershipAttackers"..i, "MothershipAttackers", "vol_SpawnMothershipAttackers")
    end
    for i = 1,5,1 do
        SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "MothershipAttackers_B1"..i, "MothershipAttackers_Bombers_1", "vol_SpawnMothershipAttackers")
    end
    for i = 1,5,1 do
        SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "MothershipAttackers_B2"..i, "MothershipAttackers_Bombers_2", "vol_SpawnMothershipAttackers")
    end
    SobGroup_Attack(3, "MothershipAttackers", "Mothership")
    SobGroup_Attack(3, "MothershipAttackers_Bombers_1", "Tanis_Structure_1")
    SobGroup_Attack(3, "MothershipAttackers_Bombers_2", "Tanis_Structure_2")
    SobGroup_SetInvulnerability_Smart("Mothership", 1)
    FOW_RevealGroup("MothershipAttackers", 1)
    Rule_Remove("Rule_CreateMothershipAttackers")
end

function Rule_LaunchTheMothership()
    SobGroup_FillShipsByType("tempSobGroup_SP", "Player_Ships0", "Hgn_Interceptor")
    SobGroup_ParadeSobGroup("tempSobGroup_SP", "Mothership", 0)
    Event_Start("autofocus_mothershiplaunches")
    Rule_Add("Rule_MothershipHasLaunched")
    Rule_Remove("Rule_LaunchTheMothership")
end

function Rule_MothershipHasLaunched()
    if  Event_IsDone("autofocus_mothershiplaunches")==1 then
        --Player_UnrestrictBuildOption(g_playerID, "Hgn_AttackBomber")
        Event_Start("intelevent_chimeraissafe")
        Rule_Add("Rule_DeployGates")
        Rule_Add("Rule_HasBuiltAttackBombers")
        Rule_Remove("Rule_MothershipHasLaunched")
        Rule_Add("Rule_KeepTanisAlive1")
        Rule_Add("Rule_KeepTanisAlive2")
    end

end

function Rule_ChimeraIsSafeCompleted()
    if  Event_IsDone("intelevent_chimeraissafe")==1 then
        Rule_Remove("Rule_ChimeraIsSafeCompleted")
        Rule_Add("Rule_PlaySaveGameLocationCard")
        Rule_AddInterval("Rule_SaveTheGameProtectMothership", 1)
    end

end

function Rule_SaveTheGameProtectMothership()
    Rule_Remove("Rule_SaveTheGameProtectMothership")
    g_save_id = (g_save_id + 1)
    Campaign_QuickSaveNb(g_save_id, "$6402")
end

function Rule_BuildAttackBombers()
    if  Player_HasResearch(g_playerID, "lbombertech")==1 then		--PlasmaBombs
        Player_SetRU(0, (Player_GetRU(0) + 700))
        Objective_SetState(obj_prim_researchplasmabomb_id, OS_Complete)
        --Player_UnrestrictBuildOption(g_playerID, "Hgn_AttackBomber")
        Event_Start("speechevent_buildattackbombers")
        Rule_Add("Rule_HasBuiltAttackBombers")
        Rule_Remove("Rule_BuildAttackBombers")
    end
		SobGroup_SetInvulnerability_Smart("Mothership", 0)
end

function Rule_HasBuiltAttackBombers()
    if  Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(g_playerID, "hgn_attackbomber") >= 1 then		--Stats_ShipsCreated(g_playerID)>=5 then
        Objective_SetState(obj_prim_buildtwobombers_id, OS_Complete)
        Rule_Remove("Rule_HasBuiltAttackBombers")
        Rule_AddInterval("Rule_StartCheckingNoBombers", 5)
    end

end

function Rule_StartCheckingNoBombers()
    Rule_Add("Rule_PlayerHasNoBombers")
    Rule_Remove("Rule_StartCheckingNoBombers")
end

function Rule_KeepTanisAlive1()
    if  SobGroup_HealthPercentage("Tanis_Structure_1")<=0.15 then
        SobGroup_SetHealth("Tanis_Structure_1", 0.2)
    end

end

function Rule_KeepTanisAlive2()
    if  SobGroup_HealthPercentage("Tanis_Structure_2")<=0.15 then
        SobGroup_SetHealth("Tanis_Structure_2", 0.2)
    end

end

function Rule_DeployGates()
    for i = 1,3,1 do
        SobGroup_Move(3, "WaveOne_Gate_"..i.."b", "vol_WaveOne_Gate_"..i.."_B")
        Rule_Add("Rule_WaveOne_Gate"..i.."_InPosition")
    end
    Rule_Add("Rule_BeginHyperspaceAtGate")
    Rule_Add("Rule_AttackAtGate")
    Rule_Add("Rule_GateDestroyed")
    for i = 1,3,1 do
        SobGroup_Create("waveone_tempgroup"..i)
    end
    Rule_Add("Rule_AllGatesDestroyed")
    Rule_Add("Rule_FirstGatesDestroyed")
    Rule_Remove("Rule_DeployGates")
end

function Rule_WaveOne_Gate1_InPosition()
    if  SobGroup_FillSobGroupInVolume("shipsInVolume", "WaveOne_Gate_1b", "vol_WaveOne_Gate_1_B")==1 then
        g_gatedeployed = (g_gatedeployed + 1)
        SobGroup_FormHyperspaceGate("WaveOne_Gate_1a", "WaveOne_Gate_1b")
        Rule_Remove("Rule_WaveOne_Gate1_InPosition")
    end

end

function Rule_WaveOne_Gate2_InPosition()
    if  SobGroup_FillSobGroupInVolume("shipsInVolume", "WaveOne_Gate_2b", "vol_WaveOne_Gate_2_B")==1 then
        g_gatedeployed = (g_gatedeployed + 1)
        SobGroup_FormHyperspaceGate("WaveOne_Gate_2a", "WaveOne_Gate_2b")
        Rule_Remove("Rule_WaveOne_Gate2_InPosition")
    end

end

function Rule_WaveOne_Gate3_InPosition()
    if  SobGroup_FillSobGroupInVolume("shipsInVolume", "WaveOne_Gate_3b", "vol_WaveOne_Gate_3_B")==1 then
        g_gatedeployed = (g_gatedeployed + 1)
        SobGroup_FormHyperspaceGate("WaveOne_Gate_3a", "WaveOne_Gate_3b")
        Rule_Remove("Rule_WaveOne_Gate3_InPosition")
    end

end

function Rule_BeginHyperspaceAtGate()
    for i = 1,getn(WaveOne_GateAttackers),1 do
        if  WaveOne_GateAttackers[i]==0 and SobGroup_IsGateDeployed("WaveOne_Gate_"..i.."a", "WaveOne_Gate_"..i.."b")==1 then
            if  g_createattackers==1 then
                CreateMoreAttackers()
                g_createattackers = 0
            end

            SobGroup_UseHyperspaceGate("WaveOne_Attackers_"..i, "WaveOne_Gate_"..i.."a")
            WaveOne_GateAttackers[i] = 1
            g_WaveOne_HyperspaceIssued = (g_WaveOne_HyperspaceIssued + 1)
            if  g_WaveOne_HyperspaceIssued>=1 then
                g_gatejustopened = "WaveOne_Gate_"..i.."b"
                Subtitle_TimeCounterEnd()
                Event_Start("intelevent_moreincoming")
            end

        end

    end
    if  g_WaveOne_HyperspaceIssued==getn(WaveOne_GateAttackers) then
        Rule_Remove("Rule_BeginHyperspaceAtGate")
    end

end

function Rule_AttackAtGate()
    for i = 1,getn(WaveOne_GateAttackers),1 do
        if  WaveOne_GateAttackers[i]==1 and SobGroup_FillSobGroupInVolume("tempSobGroup_SP", "WaveOne_Attackers_"..i, "vol_WaveOne_Gate_"..i.."_B")==1 then
            if  i==1 then
                SobGroup_Attack(3, "WaveOne_Attackers_"..i, "Tanis_Structure_1")
            elseif  i==2 then
                SobGroup_Attack(3, "WaveOne_Attackers_"..i, "Tanis_Structure_1")
            elseif  i==3 then
                SobGroup_Attack(3, "WaveOne_Attackers_"..i, "Tanis_Structure_2")
            end

            WaveOne_GateAttackers[i] = 2
            g_WaveOne_AttacksIssued = (g_WaveOne_AttacksIssued + 1)
            print("attack "..i.." issued")
        end

    end
    if  g_WaveOne_AttacksIssued==getn(WaveOne_GateAttackers) then
        Rule_Remove("Rule_AttackAtGate")
    end

end

function Rule_GateDestroyed()
    for i = 1,getn(WaveOne_GateAttackers),1 do
        if  SobGroup_Empty("WaveOne_Gate_"..i.."b")==1 and WaveOne_GateAttackers[i]~=3 then
            WaveOne_GateAttackers[i] = 3
            g_WaveOne_GatesDestroyed = (g_WaveOne_GatesDestroyed + 1)
            print("gate "..i.." destroyed")
            if  g_WaveOne_GatesDestroyed==3 then
                Rule_Remove("Rule_PlayerHasNoBombers")
                Rule_Remove("Rule_GateDestroyed")
            end

        end

    end
end

function Rule_AllGatesDestroyed()
    if  g_WaveOne_GatesDestroyed==3 and SobGroup_Empty("Vgr_AllGateAttacks")==1 then
        Objective_SetState(obj_prim_destroyvaygrgates_id, OS_Complete)
        SobGroup_FillSobGroupInVolume("tempSobGroup_SP", "Player_Ships3", "vol_GateStartPoint")
        SobGroup_TakeDamage("tempSobGroup_SP", 1)
        Rule_Remove("Rule_AllGatesDestroyed")
        Rule_Remove("Rule_PlayerHasNoBombers")
    end

end

function Rule_FirstGatesDestroyed()
    if  g_WaveOne_GatesDestroyed==1 then
        Event_Start("speechevent_firstgatedestroyed")
        Rule_Remove("Rule_FirstGatesDestroyed")
    end

end

function CreateMoreAttackers()
    SobGroup_FillShipsByType("tempSobGroup_SP", "Player_Ships0", "Hgn_Interceptor")
    numberOfInterceptors = SobGroup_Count("tempSobGroup_SP")
    SobGroup_FillShipsByType("tempSobGroup_SP", "Player_Ships0", "Hgn_AttackBomber")
    numberOfBombers = SobGroup_Count("tempSobGroup_SP")
    print("interceptors: "..numberOfInterceptors)
    print("bombers: "..numberOfBombers)
    if  numberOfInterceptors>=5 then
        numberOfNewAttackBombers = numberOfInterceptors / 2
        --numberOfNewAttackBombers = numberOfNewAttackBombers / 2
        numberOfNewAttackBombers = floor(numberOfNewAttackBombers)
        if  numberOfNewAttackBombers<=40 and numberOfNewAttackBombers > 1 then		--was "while do"? dead loop!
            print("creating new bombers at gate 1: "..numberOfNewAttackBombers)
            for i = 1,numberOfNewAttackBombers,1 do
                SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "WaveOne_Attackers_A"..i, "WaveOne_Attackers_1", "vol_WaveOne_Gate_1_A")
            end
            print("creating new bombers at gate 3: "..numberOfNewAttackBombers)
            for i = 1,numberOfNewAttackBombers,1 do
                SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Bomber", "WaveOne_Attackers_B"..i, "WaveOne_Attackers_3", "vol_WaveOne_Gate_3_A")
            end
        end

        SobGroup_SetTactics("WaveOne_Attackers_1", AggressiveTactics)
        SobGroup_SetTactics("WaveOne_Attackers_3", AggressiveTactics)
        SobGroup_SobGroupAdd("Vgr_MothershipAttackers", "WaveOne_Attackers_1")
        SobGroup_SobGroupAdd("Vgr_MothershipAttackers", "WaveOne_Attackers_3")
    end

    if  numberOfBombers>=5 then
        healthOfGates = numberOfBombers / 5
        healthOfGates = healthOfGates / 2
        --for i = 1,3,1 do
        --    SobGroup_SetHealth("WaveOne_Gate_"..i.."a", healthOfGates)
        --end
        numberOfNewInterceptors = numberOfBombers / 2
        --numberOfNewInterceptors = numberOfNewInterceptors / 2
        numberOfNewInterceptors = floor(numberOfNewInterceptors)
        if  numberOfNewInterceptors<=40 and numberOfNewInterceptors > 1 then		--was "while do"? dead loop!
            print("creating new interceptors at gate 2: "..numberOfNewInterceptors)
            for i = 1,numberOfNewInterceptors,1 do
                SobGroup_SpawnNewShipInSobGroup(3, "Vgr_Interceptor", "WaveOne_Attackers_2", "WaveOne_Attackers_2", "vol_WaveOne_Gate_2_A")
            end
        end

        SobGroup_SetTactics("WaveOne_Attackers_2", AggressiveTactics)
        SobGroup_SobGroupAdd("Vgr_MothershipAttackers", "WaveOne_Attackers_2")
    end

end

function Rule_NewVaygrAttackingPlayer()
    for i = 1,3,1 do
        Player_FillSobGroupInVolume("shipsInVolume", 3, "vol_WaveOne_Gate_"..i.."_B")
        SobGroup_FillSubstract("fightersInVolume", "shipsInVolume", "WaveOne_Gate_"..i.."b")
        if  SobGroup_Empty("fightersInVolume")==0 then
            SobGroup_SobGroupAdd("Vgr_AllGateAttacks", "fightersInVolume")
        end

    end
end

function Rule_PlayerHasNoBombers()
    if  Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "Hgn_AttackBomber")==0 then
        Player_SetRU(0, (Player_GetRU(0) + 700))
        Event_Start("speechevent_attackbombersdestroyed")
        Rule_Remove("Rule_PlayerHasNoBombers")
    end

end

function Rule_VaygrEliminated()
    if  SobGroup_Empty("Vgr_MothershipAttackers")==1 then
        Objective_SetState(obj_prim_protectmothership_id, OS_Complete)
        Rule_Remove("Rule_VaygrEliminated")
    end

end

function Rule_PlayerWins()
    if  Objective_GetState(obj_prim_beginharvesting_id)==OS_Complete then
        if  Objective_GetState(obj_prim_buildfightersubsystem_id)==OS_Complete then
            if  Objective_GetState(obj_prim_buildtwointerceptors_id)==OS_Complete then
                if  Objective_GetState(obj_prim_destroyvaygrgates_id)==OS_Complete then
                    if  g_eventisdone==1 then
                        SobGroup_SetInvulnerabilityOfHardPoint("Mothership", "HardpointProduction1", 0)
                        SobGroup_AbilityActivate("Mothership", AB_Move, 1)
                        Universe_EnableCmd(1, MUI_ScuttleCommand)
                        Event_Start("intelevent_mothershipjumps")
                        Rule_Add("Rule_VaygrEnterHyperspace")
                        Rule_Remove("Rule_PlayerWins")
                    end

                end

            end

        end

    end

end

function MothershipHasLaunchedFromTanis()
    if  SobGroup_IsDockedSobGroup("Mothership", "Tanis")==0 then
        return true
    end

end

function Rule_VaygrEnterHyperspace()
    if  g_vaygrexithyperspace==1 then
        Event_Start("vaygrexithyperspace")
        Rule_Remove("Rule_VaygrEnterHyperspace")
    end

end

function Rule_PlayerLose()
    if  SobGroup_Empty("Mothership")==1 then
        Event_Start("speechevent_playerloses")
        Rule_Remove("Rule_PlayerLose")
    end

end
