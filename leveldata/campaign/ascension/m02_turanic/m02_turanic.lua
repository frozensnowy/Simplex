-- Required scripts
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:leveldata/campaign/singleplayer_oninit.lua")
dofilepath("data:leveldata/campaign/ascension/m02_turanic/datfiles.lua")

-- Initialize Events table first
Events = {}

-- Initialize table functions for Lua 4.1
if not table then
    table = {}
end

function table.getn(t)
    local max = 0
    local k = 1
    while t[k] ~= nil do
        max = k
        k = k + 1
    end
    return max
end

function table.insert(t, v)
    local n = table.getn(t)
    t[n + 1] = v
end

-- Function called when level starts or loads
function OnStartOrLoad_m02()
    -- Initialize level-specific state
    Rule_Add("Rule_PlayAmbientMusic")
    Camera_Interpolate("here", "Camera_Start", 0)
end

-- Function called when level starts
function OnInit()
    print("oninit issued")
    Rule_Add("Rule_Init")
    -- Position camera at start
    Camera_Interpolate("here", "Camera_Start", 0)
    -- Disable speech but don't touch UI yet
    Sound_SetMuteActor("All_")
    Sound_EnableAllSpeech(0)
    
    --SinglePlayer_OnInit()
    
    -- Keep accolades hidden for the player (player 0 + 1 for array index)
    PlayerUI_HideAccoladeDisplay[1] = 1
end

-- Wave spawn configuration (moved to global scope for save persistence)
g_wave_count = 0
g_max_waves = 10  -- Total number of waves before switching to harder waves
g_wave_interval = 45 
g_current_units_per_squad = 1  -- Start with 1 unit per squad
g_scout_under_attack = 0
g_played_analysis = 0
g_heavy_interceptor_unlocked = 0
g_waves_active = 1


-- Attack positions table
g_attack_positions = {
    "vol_RaiderSpawn_1",  -- Corner positions (for scout attack)
    "vol_RaiderSpawn_2",
    "vol_RaiderSpawn_3",
    "vol_RaiderSpawn_4",
    "vol_RaiderSpawn_5",  -- Side positions (for mothership attack)
    "vol_RaiderSpawn_6",
    "vol_RaiderSpawn_7",
    "vol_RaiderSpawn_8"
}

-- Early and late unit tables
g_early_units = {
    "rad_interceptor",
    "rad_fencer",
    "rad_scoutcorvette"
}

g_late_units = {
    "rad_interceptor",
    "rad_fencer",
    "rad_scoutcorvette",
    "rad_empcorvette",
    "rad_missilecorvette",
    "rad_bomber"
}

-- Campaign and Objective Variables
SP_Campaign_Level_ID = 2

-- Event Variables
g_eventisdone = 1
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_pointer_default = 0
g_save_id = 0

-- Scout point ping variables
ping_scout_1 = "$60450"
ping_scout_2 = "$60451"
ping_scout_3 = "$60452"
ping_scout_4 = "$60453"
ping_scout_1_id = 0
ping_scout_2_id = 0
ping_scout_3_id = 0
ping_scout_4_id = 0

-- Scout point pointer variables
pointer_scout_1 = 0
pointer_scout_2 = 0
pointer_scout_3 = 0
pointer_scout_4 = 0

-- Scout point status tracking
g_scout_point_1_reached = 0
g_scout_point_2_reached = 0
g_scout_point_3_reached = 0
g_scout_point_4_reached = 0

-- Objectives
obj_prim_scout_id = 0
obj_prim_defend_ms_id = 1

-- Add variables for Heavy Interceptor objective
obj_sec_build_hft_id = 0
g_hft_objective_complete = 0

g_current_scout_point = 0  -- Track which scout point was just reached

-- Initialize variables for carrier support system
g_carrier_spawned = 0
g_carrier_reinforcing = 0
g_next_reinforcement_time = 0
g_reinforcement_interval = 30 -- Time between reinforcement checks in seconds
g_max_squadron_count = 4 -- Maximum number of each squadron type

-- Squad counts for tracking
g_multiguns_active = 0
g_hft_active = 0 
g_railgun_active = 0

-- Add Heavy Interceptor unlock event
Events.speechevent_heavyinterceptorunlock = {
    {
        { "Sound_EnterIntelEvent()", "" },
        { "Sound_SetMuteActor('Fleet')", "" },
        HW2_SubTitleEvent(Actor_FleetIntel, "$60555", 8),  -- We have reverse engineered the missile launch systems...
    },
    {
        { "Rule_AddInterval('Rule_UnrestrictHeavyInterceptor', 1)", "" },  -- Add delay before unrestricting
        { "obj_sec_build_hft_id = Objective_Add('$60560', OT_Secondary)", "" },
        { "Objective_AddDescription(obj_sec_build_hft_id, '$60561')", "" },
        { "Rule_Add('Rule_CheckHeavyInterceptorBuilt')", "" },
        { "Sound_ExitIntelEvent()", "" },
        { "Sound_SetMuteActor('')", "" },
    },
}

-- Opening sequence
Events.intelevent_initialization = {

    {
        { "Sound_EnableAllSpeech(1)", "" },
        { "Sound_SetMuteActor('Fleet')", "" },
        { "Camera_Interpolate('here', 'Camera_Start', 0)", "" },
        HW2_Wait(5),
    },
    { HW2_LocationCardEvent("$60000", 6) },  -- NEBULA REGION
    {
        { "Sound_EnterIntelEvent()", "" },
        HW2_SubTitleEvent(Actor_FleetCommand, "$60100", 5),  -- Hyperspace jump failure. We have misjumped.
    },
    { HW2_Wait(1) },
    { 
        HW2_Letterbox(1),
        { "Universe_EnableSkip(1)", "" },
        HW2_Pause(1),
        HW2_Wait(2),
    },
    {
        -- Move camera to Camera_ScoutView with smooth transition
        { "Sensors_Toggle(1)", "" },
        { "Camera_Interpolate('here', 'Camera_ScoutView', 5)", "" },
        HW2_Wait(2),
    },
    {
        HW2_SubTitleEvent(Actor_FleetIntel, "$60101", 8),  -- The Hyperspace Core and critical systems survived the emergency jump, but we have exited far off-course in an uncharted nebula.
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetIntel, "$60102", 8),  -- Long-range scanners are offline and the surrounding nebula and background radiation are crippling mobility. 
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetIntel, "$60103", 7),  -- Fleet operations will remain at minimum capacity until we randevous with the crew transports at Hiigara.
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetCommand, "$60104", 7),  -- Hyperspace unavailable. The jump has drained all available power from the core. Recharge is in progress.
    },
    { HW2_Wait(1) },
    {
        HW2_Wait(1),
        HW2_SubTitleEvent(Actor_FleetIntel, "$60105", 8),  -- We are detecting anomalous readings from the surrounding nebula. Regaining situational awareness is our main priority.
    },
    { HW2_Wait(2) },
    {
        { "Camera_Interpolate('here', 'Camera_TopDown', 3)", "" },
        HW2_SubTitleEvent(Actor_FleetIntel, "$60106", 8),  -- Deploy scout squadrons to these coordinates to establish a sensor perimeter around the mothership.
        { "obj_prim_scout_id = Objective_Add('$60480', OT_Primary)", "" },
        { "Objective_AddDescription(obj_prim_scout_id, '$60481')", "" },
        { "Objective_AddDescription(obj_prim_scout_id, '$60482')", "" },
        -- Create both event pointers and pings
        { "pointer_scout_1 = EventPointer_AddVolume('vol_ScoutSphere_1', HW2_rgb(230,230,230), 1000)", "" },
        { "pointer_scout_2 = EventPointer_AddVolume('vol_ScoutSphere_2', HW2_rgb(230,230,230), 1000)", "" },
        { "pointer_scout_3 = EventPointer_AddVolume('vol_ScoutSphere_3', HW2_rgb(230,230,230), 1000)", "" },
        { "pointer_scout_4 = EventPointer_AddVolume('vol_ScoutSphere_4', HW2_rgb(230,230,230), 1000)", "" },
        -- Create pings with anomaly type using point method
        { "ping_scout_1_id = HW2_PingCreateWithLabelPoint(ping_scout_1, 'vol_ScoutSphere_1')", "" },
        { "ping_scout_2_id = HW2_PingCreateWithLabelPoint(ping_scout_2, 'vol_ScoutSphere_2')", "" },
        { "ping_scout_3_id = HW2_PingCreateWithLabelPoint(ping_scout_3, 'vol_ScoutSphere_3')", "" },
        { "ping_scout_4_id = HW2_PingCreateWithLabelPoint(ping_scout_4, 'vol_ScoutSphere_4')", "" },
        -- Add descriptions to pings
        { "Ping_AddDescription(ping_scout_1_id, 0, '$60460')", "" },
        { "Ping_AddDescription(ping_scout_2_id, 0, '$60461')", "" },
        { "Ping_AddDescription(ping_scout_3_id, 0, '$60462')", "" },
        { "Ping_AddDescription(ping_scout_4_id, 0, '$60463')", "" },
    },
    { HW2_Wait(2) },
    {                                                                                                      
        HW2_SubTitleEvent(Actor_FleetIntel, "$60107", 8),  -- Caution: The fleet is operating on emergency reserves and we have no reliable data on potential hostiles. All units remain on high alert.
        { "EventPointer_Remove(pointer_scout_1)", "" },
        { "EventPointer_Remove(pointer_scout_2)", "" },
        { "EventPointer_Remove(pointer_scout_3)", "" },
        { "EventPointer_Remove(pointer_scout_4)", "" },
    },
    {
        { "Sensors_Toggle(0)", "" },
        { "Camera_Interpolate('here', 'Camera_Start', 2)", "" },

        HW2_Letterbox(0),
        HW2_Pause(0),
        { "Universe_EnableSkip(0)", "" },
        { "Sound_ExitIntelEvent()", "" },
        { "Sound_SetMuteActor('')", "" },
        HW2_Wait(2),
        -- Temporarily set PlayerMotherships Health to 50% to jump to the cutscene
        -- { "SobGroup_SetHealth(Players_Mothership, 0.5)", "" },
    },
}

-- Individual events for each scout position
Events.speechevent_scout1_reached = {
    { HW2_SubTitleEvent(Actor_FleetIntel, "$60471", 3) }, 
    { { "Sound_ExitIntelEvent()", "" }, HW2_Wait(1) },
    { { "EventPlaying = 0", "" } },
}

Events.speechevent_scout2_reached = {
    { HW2_SubTitleEvent(Actor_FleetIntel, "$60472", 3) },
    { { "Sound_ExitIntelEvent()", "" }, HW2_Wait(1) },
    { { "EventPlaying = 0", "" } },
}

Events.speechevent_scout3_reached = {
    { HW2_SubTitleEvent(Actor_FleetIntel, "$60473", 3) },
    { { "Sound_ExitIntelEvent()", "" }, HW2_Wait(1) },
    { { "EventPlaying = 0", "" } },
}

Events.speechevent_scout4_reached = {
    { HW2_SubTitleEvent(Actor_FleetIntel, "$60474", 3) },
    { { "Sound_ExitIntelEvent()", "" }, HW2_Wait(1) },
    { { "EventPlaying = 0", "" } },
}

-- Add these events to your Events table
Events.intelevent_turanicraidersspotted = {
    {
        { "Sound_EnterIntelEvent()", "" },
        { "Sound_SetMuteActor('Fleet')", "" },
        -- Keep letterbox for initial attack reveal - it's a major story moment
        HW2_Letterbox(1),
        HW2_Pause(1),
        { "Universe_EnableSkip(1)", "" },
    },
    { HW2_Wait(2) },
    {
        HW2_SubTitleEvent(Actor_AllShips, "$60200", 5),  -- Picking up multiple contacts...
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_AllShips, "$60201", 3),  -- They're powering weapons!
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetIntel, "$60202", 5),  -- All Squadrons, return...
        -- Start wave system here
        { "Init_WaveSystem()", "" },
        { "Rule_Remove('Rule_PlayAmbientMusic')", "" },
        { "Rule_Add('Rule_PlayRaiderAttackMusic')", "" },
        -- Order all scouts back
        { "SobGroup_GuardSobGroup('ScoutGroup', Players_Mothership)", "" },
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetIntel, "$60203", 5),  -- Multiple strikecraft detected...
        
        { "obj_prim_defend_ms_id = Objective_Add('$60483', OT_Primary)", "" },
        { "Objective_AddDescription(obj_prim_defend_ms_id, '$60484')", "" },
    },
    {
        HW2_Letterbox(0),  -- End letterbox for initial attack
        HW2_Pause(0),
        { "Universe_EnableSkip(0)", "" },
        { "Sound_ExitIntelEvent()", "" },
        { "Sound_SetMuteActor('')", "" },
        { "Rule_Add('Rule_PlayRaiderTaunt')", "" },
        { "Rule_Add('Rule_KeepPowerStationAlive')", "" },
    },
}

-- Raider taunt event (plays after 5 seconds) - no letterbox, just dialogue
Events.speechevent_raiderstaunt = {
    {
        { "Sound_EnterIntelEvent()", "" },
        { "Sound_SetMuteActor('Fleet')", "" },
        HW2_SubTitleEvent(12, "$60230", 5),  -- Well well well...
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(12, "$60231", 5),  -- Look at their mothership!
    },
    {
        { "Sound_ExitIntelEvent()", "" },
        { "Sound_SetMuteActor('')", "" },
        { "Rule_Add('Rule_PlayRaiderAnalysis')", "" },
    },
}

-- Analysis event (plays during second wave) - no letterbox, just dialogue
Events.speechevent_raideranalysis = {
    {
        { "Sound_EnterIntelEvent()", "" },
        { "Sound_SetMuteActor('Fleet')", "" },
        HW2_SubTitleEvent(Actor_FleetIntel, "$60250", 8),  -- Analysis of enemy craft complete...
    },
    { HW2_Wait(3) },
    {
        HW2_SubTitleEvent(Actor_FleetCommand, "$60251", 5),  -- They're using the nebula for cover...
    },
    {
        { "Sound_ExitIntelEvent()", "" },
        { "Sound_SetMuteActor('')", "" },
    },
}

-- Add this event to your Events table
Events.intelevent_capitalclassincoming = {
    {
        { "Universe_EnableSkip(1)", "" },
        { "Camera_FocusSave()", "" },
        { "Sound_EnterIntelEvent()", "" },
        HW2_Letterbox(1),
    },
    {
    },
    {
        -- Priority alert line with dramatic pause
        HW2_SubTitleEvent(Actor_FleetIntel, "$60300", 3), -- Priority alert!
    },
    { HW2_Wait(2) },
    {
        -- Longer dramatic pause before capital class reveal
        { "Sensors_Toggle(1)", "" },
        { "Camera_FocusSobGroupWithBuffer('Battlegroup_Selum', 2, 1000, 2)", "" },
        HW2_SubTitleEvent(Actor_FleetIntel, "$60301", 3), -- Capital class signature detected.
    },
    { HW2_Wait(2) },
    {
        -- Quick recognition
        HW2_SubTitleEvent(Actor_FleetCommand, "$60302", 3), -- It's one of ours!
    },
    { HW2_Wait(1) },
    {
        -- Interpolate the camera out of sensor mode towards the carrier itself
        { "Camera_Interpolate('here', 'Battlegroup_Selum', 4)", "" },
        { "Sensors_Toggle(0)", "" },
        -- First contact is slower, more formal
        HW2_SubTitleEvent(Actor_AllShips, "$60303", 8),
        { "SobGroup_SwitchOwner('Battlegroup_Selum', 1)", "" },
        { "Player_SetPlayerName(2, 'Battlegroup Selum')", "" },
    },    
    { HW2_Wait(1) },
    {
        HW2_Letterbox(0),
        { "Camera_FocusRestore()", "" },
        { "Universe_EnableSkip(0)", "" },
        { "Sound_ExitIntelEvent()", "" },
    },
    {   
        -- Fleet Command questions their presence
        HW2_SubTitleEvent(Actor_FleetCommand, "$60304", 4),
    },
    { HW2_Wait(1) },
    {
        -- Battlegroup explains delay
        HW2_SubTitleEvent(Actor_AllShips, "$60305", 5),
    },
    
    { HW2_Wait(1) },
    {
        { "g_carrier_reinforcing = 1", "" },
    },
    {
        -- Battlegroup explains searching
        HW2_SubTitleEvent(Actor_AllShips, "$60306", 5),
    },
    { HW2_Wait(1) },
}

function Rule_PlayAmbientMusic()
    print("trying to play ambient music!")
    Sound_MusicPlayType("data:sound/music/ambient/piratevoyage", MUS_Ambient)
    Rule_Remove("Rule_PlayAmbientMusic")
end

function Rule_PlayRaiderAttackMusic()
    print("trying to play raider attack music!")
    Sound_MusicPlayType("data:sound/music/battle/TuranicAttack", MUS_Battle)
    Rule_Remove("Rule_PlayRaiderAttackMusic")
end

function Rule_Init()
    -- Basic setup
    Sound_SpeechSubtitlePath("speech:missions/m_02tur/")
    
    -- Load persistent data and create Mothership sobgroup
    SobGroup_LoadPersistantData("Hgn_Mothership")
    Players_Mothership = "Players_Mothership"
    SobGroup_Create(Players_Mothership)
    SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
    
    -- Additional SobGroups we might need
    SobGroup_Create("tempSobGroup_SP")
    SobGroup_Create("ScoutGroup")
    
    -- Create raider groups
    for i = 1,4 do
        SobGroup_Create("Raiders_"..i)
        SobGroup_Create("RaiderGroup_"..i.."_int")
        SobGroup_Create("RaiderGroup_"..i.."_fnc")
        SobGroup_Create("RaiderGroup_"..i.."_scv")
    end
    
    -- Create wave groups (for up to 6 waves)
    for i = 0,5 do
        SobGroup_Create("RaiderWave_"..i)
        SobGroup_Create("RaiderWave_"..i.."_int")
        SobGroup_Create("RaiderWave_"..i.."_fnc")
        SobGroup_Create("RaiderWave_"..i.."_scv")
    end

    -- Add health monitoring rules
    Rule_Add("Rule_CheckMothershipHealth")
    Rule_Add("Rule_CheckSquadronLosses")
    Init_CarrierGroups()

    -- Set all player ships to defensive tactics
    -- First create a sobgroup for player interceptors, bombers and railgunfighters (heavy interceptors)
    SobGroup_Create("Player_Fighters")
    SobGroup_FillShipsByType("Player_Fighters", "Player_Ships0", "Hgn_Interceptor")
    SobGroup_FillShipsByType("Player_Fighters", "Player_Ships0", "hgn_railgunfighter")
    SobGroup_FillShipsByType("Player_Fighters", "Player_Ships0", "hgn_attackbomber")
    SobGroup_SetTactics('Player_Fighters', DefensiveTactics)

    
    -- Spawn carrier
    SobGroup_SpawnNewShipInSobGroup(2, "Hgn_BattleCarrier", "Selum_Carrier", "Selum_Carrier", "vol_SelumArrival")


    -- Put them in Hyperspace
    SobGroup_EnterHyperSpaceOffMap("Selum_Carrier")

    -- Play ambient music
    Rule_Add("Rule_PlayAmbientMusic")
    
    -- Set up players
    Player_SetPlayerNameAdvanced(0, "Hiigaran Navy")
    Player_SetPlayerNameAdvanced(1, "Battlegroup Selum")
    Player_SetPlayerNameAdvanced(2, "Unknown Attackers")
    
    -- CPU setup
    CPU_Enable(1, 0)
    CPU_Enable(2, 0)
    
    -- Alliance setup
    SetAlliance(0, 1)
    SetAlliance(1, 0)
    
    -- Start mission sequence
    Event_Start("intelevent_initialization")
    Rule_Add("Rule_InitialEventComplete")
    Rule_Add("Rule_CheckScoutPoints")
    
    Rule_Remove("Rule_Init")

    HW2_ReactiveInfo()

    -- Create sobgroup for our state tracking probe
    SobGroup_Create("Analysis_Tracker")
end 

function Rule_PlaySaveGameLocationCard()
    Subtitle_Message("$3651", 3)  -- "Game Saved..."
    Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function Rule_InitialEventComplete()
    if Event_IsDone("intelevent_initialization") == 1 then
        Camera_SetLetterboxStateNoUI(0, 0)
        Rule_Remove("Rule_InitialEventComplete")
    end
end

-- Add new rule to start waves when all scouts are in position
function Rule_StartWavesWhenScoutsReady()
    print("Checking if ready to start waves...")
    if g_scout_point_1_reached == 1 and g_scout_point_2_reached == 1 and 
       g_scout_point_3_reached == 1 and g_scout_point_4_reached == 1 then
        print("All scouts confirmed in position - starting wave system")
        Init_WaveSystem()
        Rule_Add("Rule_CheckScoutDamage")
        Objective_SetState(obj_prim_scout_id, OS_Complete)
        -- Remove both rules to prevent them from running in the background
        Rule_Remove("Rule_StartWavesWhenScoutsReady")
        Rule_Remove("Rule_CheckScoutPoints")
    end
    -- Remove the rule to prevent it from running infinitely if the scouts are not in position
    Rule_Remove("Rule_StartWavesWhenScoutsReady")
end

function Rule_CheckScoutPoints()
    -- Fill scout group with all scouts
    Player_FillShipsByType("ScoutGroup", 0, "Hgn_Scout")
    
    -- Check each scout point
    if g_scout_point_1_reached == 0 and SobGroup_IsInVolume("ScoutGroup", "vol_ScoutSphere_1") == 1 then
        print("Scout reached position 1")
        g_scout_point_1_reached = 1
        Ping_Remove(ping_scout_1_id)
        -- Create group for this scout
        SobGroup_Create("Scout_1")
        Player_FillSobGroupInVolume("Scout_1", 0, "vol_ScoutSphere_1")
        Event_Start("speechevent_scout1_reached")
        Rule_Add("Rule_StartWavesWhenScoutsReady")
    end
    
    if g_scout_point_2_reached == 0 and SobGroup_IsInVolume("ScoutGroup", "vol_ScoutSphere_2") == 1 then
        print("Scout reached position 2")
        g_scout_point_2_reached = 1
        Ping_Remove(ping_scout_2_id)
        SobGroup_Create("Scout_2")
        Player_FillSobGroupInVolume("Scout_2", 0, "vol_ScoutSphere_2")
        Event_Start("speechevent_scout2_reached")
        Rule_Add("Rule_StartWavesWhenScoutsReady")
    end

    if g_scout_point_3_reached == 0 and SobGroup_IsInVolume("ScoutGroup", "vol_ScoutSphere_3") == 1 then
        print("Scout reached position 3")
        g_scout_point_3_reached = 1
        Ping_Remove(ping_scout_3_id)
        SobGroup_Create("Scout_3")
        Player_FillSobGroupInVolume("Scout_3", 0, "vol_ScoutSphere_3")
        Event_Start("speechevent_scout3_reached")
        Rule_Add("Rule_StartWavesWhenScoutsReady")
    end

    if g_scout_point_4_reached == 0 and SobGroup_IsInVolume("ScoutGroup", "vol_ScoutSphere_4") == 1 then
        print("Scout reached position 4")
        g_scout_point_4_reached = 1
        Ping_Remove(ping_scout_4_id)
        SobGroup_Create("Scout_4")
        Player_FillSobGroupInVolume("Scout_4", 0, "vol_ScoutSphere_4")
        Event_Start("speechevent_scout4_reached")
        Rule_Add("Rule_StartWavesWhenScoutsReady")
    end
end

function Rule_CheckScoutDamage()
    print("Checking for scout damage...")
    if SobGroup_UnderAttack("ScoutGroup") == 1 and g_scout_under_attack == 0 then
        print("Scout group under attack detected!")
        g_scout_under_attack = 1
        
        -- Find which scout is under attack
        local attackedSobGroup = "AttackedScout"
        SobGroup_Create(attackedSobGroup)
        for i = 1,4 do
            local scoutName = "Scout_"..i
            if SobGroup_UnderAttack(scoutName) == 1 then
                print("Scout " .. i .. " is under attack")
                -- Move camera to the attacked scout using proper camera function
                Camera_FocusSobGroupWithBuffer(scoutName, 1000, 1000, 2)
                break
            end
        end
        
        -- Start the event
        Event_Start("intelevent_turanicraidersspotted")
        SobGroup_Create("PlayersPowerStation")
        SobGroup_FillShipsByType("PlayersPowerStation", "Player_Ships0", "hgn_power")
        Rule_Add("Rule_CheckPowerStation")
        Rule_Remove("Rule_CheckScoutDamage")
    end
end


function Init_WaveSystem()
    print("Initializing wave system...")
    -- Create necessary SobGroups
    for i = 1, 8 do
        SobGroup_Create("RaiderWave_" .. i)
        print("Created RaiderWave_" .. i)
    end
    
    -- Initialize wave count if not already done
    g_wave_count = 0
    
    -- Initialize pilot warning system
    g_pilot_warning_played = 0
    Rule_Add("Rule_CheckPilotCount")
    
    print("Spawning first wave...")
    -- Spawn first wave immediately
    Rule_SpawnWave()
    -- Then set up interval for subsequent waves
    print("Setting up wave interval: " .. tostring(g_wave_interval))
    Rule_AddInterval("Rule_SpawnWave", g_wave_interval)
end

-- Modify Rule_SpawnWave to focus on scouts first
function Rule_SpawnWave()
    -- Increment wave count first
    g_wave_count = g_wave_count + 1
    print("Spawning wave " .. tostring(g_wave_count))
    
    if g_wave_count > g_max_waves then
        -- Increase difficulty after max waves
        g_current_units_per_squad = g_current_units_per_squad + 1
        g_wave_count = 1
        print("Resetting wave count and increasing difficulty. Units per squad: " .. tostring(g_current_units_per_squad))
    end

    -- Determine unit pool based on wave count
    local unit_pool = g_wave_count >= 5 and g_late_units or g_early_units
    print("Using unit pool: " .. (g_wave_count >= 5 and "late" or "early"))

    -- For first wave, use all positions to create overwhelming effect
    local start_pos = 1
    local end_pos = 8
    
    -- After first wave, only use outer positions (5-8) and randomize them
    if g_wave_count > 1 then
        start_pos = 5
        end_pos = 8
        
        -- Randomize the outer positions by rotating them
        local rotation = random(0, 3)  -- 0 to 3 positions of rotation
        if rotation > 0 then
            -- Store original positions in a temporary array
            local temp = {}
            for i = 5, 8 do
                temp[i-4] = g_attack_positions[i]  -- Store using 1-based indexing
            end
            
            -- Rotate positions
            for i = 5, 8 do
                local rotated = i - 5 + rotation  -- Calculate base rotation
                -- Handle wrap-around manually
                while rotated >= 4 do 
                    rotated = rotated - 4
                end
                g_attack_positions[i] = temp[rotated + 1]
            end
            
            print("Rotated attack positions by " .. rotation .. " steps")
        end
    end

    -- Spawn units at positions
    for i = start_pos, end_pos do
        local position = g_attack_positions[i]
        local wave_group = "RaiderWave_" .. i
        
        print("Spawning at position " .. position .. " for group " .. wave_group)
        
        -- Clear previous wave group
        SobGroup_Clear(wave_group)
        
        -- Spawn units for this position
        for j = 1, g_current_units_per_squad do
            -- Random unit selection
            local unit_type = unit_pool[random(1, getn(unit_pool))]
            print("Spawning unit " .. unit_type .. " in group " .. wave_group)
            SobGroup_SpawnNewShipInSobGroup(2, unit_type, wave_group, wave_group, position)
        end

        -- All initial waves target scouts until damage is detected
        if g_scout_under_attack == 0 then
            -- Target nearest scout
            local target_scout = "Scout_" .. random(1, 4)
            print("Ordering " .. wave_group .. " to attack " .. target_scout)
            SobGroup_Attack(2, wave_group, target_scout)
        else
            -- Create temporary SobGroups for each type
            SobGroup_Create("temp_heavies")
            SobGroup_Create("temp_interceptors")
            
            -- Check and fill groups using proper comma-separated format
            if SobGroup_AreAnyOfTheseTypes(wave_group, "rad_empcorvette,rad_missilecorvette,rad_bomber,rad_fencer") == 1 then
                -- Fill heavy hitters group
                SobGroup_FillShipsByType("temp_heavies", wave_group, "rad_empcorvette")
                SobGroup_FillShipsByType("temp_heavies", wave_group, "rad_missilecorvette")
                SobGroup_FillShipsByType("temp_heavies", wave_group, "rad_bomber")
                SobGroup_FillShipsByType("temp_heavies", wave_group, "rad_fencer")
            end
            
            if SobGroup_AreAnyOfTheseTypes(wave_group, "rad_interceptor,rad_scoutcorvette") == 1 then
                -- Fill interceptors group
                SobGroup_FillShipsByType("temp_interceptors", wave_group, "rad_interceptor")
                SobGroup_FillShipsByType("temp_interceptors", wave_group, "rad_scoutcorvette")
            end
            
            -- Order heavy hitters to focus exclusively on mothership
            if SobGroup_Empty("temp_heavies") == 0 then
                print("Ordering heavy hitters to attack mothership")
                SobGroup_Attack(2, "temp_heavies", Players_Mothership)
            end
            
            -- Order interceptors to attack player's combat ships
            if SobGroup_Empty("temp_interceptors") == 0 then
                print("Ordering interceptors to attack player forces")
                SobGroup_AttackPlayer("temp_interceptors", 0)  -- Attack player 0 (the human player)
            end
            
            -- Clean up temporary groups
            SobGroup_Clear("temp_heavies")
            SobGroup_Clear("temp_interceptors")
        end
    end

    print("Wave complete. Wave count now: " .. tostring(g_wave_count))
    
    -- Add rule to check for idle raiders if not already added
    if Rule_Exists("Rule_CheckIdleRaiders") == 0 then
        Rule_Add("Rule_CheckIdleRaiders")
    end

    -- Check if this is wave 6 to unlock heavy interceptors
    if g_wave_count == 6 and g_heavy_interceptor_unlocked == 0 then
        print("Wave 6 reached - unlocking heavy interceptors")
        Event_Start("speechevent_heavyinterceptorunlock")
        g_heavy_interceptor_unlocked = 1
    end

    -- Check if this is wave 4 and analysis hasn't played yet
    if g_wave_count == 4 and g_played_analysis == 0 then
        print("Wave 4 reached - triggering raider analysis")
        
        -- Play the event and mark analysis as played
        Event_Start("speechevent_raideranalysis")
        Player_SetPlayerNameAdvanced(2, "Turanic Raider Scoundrels")
        g_played_analysis = 1
        
        print("Analysis event triggered successfully")
    end

    -- Possibility to add more banter from the raiders if other wave counters are sent.
    
    -- If carrier is active, stop spawning waves
    if g_carrier_spawned == 1 and g_carrier_reinforcing == 1 then
        g_waves_active = 0
        Rule_Remove("Rule_SpawnWave")
    end
end

function Rule_CheckPowerStation()
    -- Create sobgroup for attackers if it doesn't exist yet
    SobGroup_Create("Attackers_Of_PowerStation")
    
    -- Get current attackers of powerstation
    SobGroup_Clear("Attackers_Of_PowerStation") -- Clear previous attackers first
    SobGroup_GetAttackers("PlayersPowerStation", "Attackers_Of_PowerStation")
    if SobGroup_Empty("Attackers_Of_PowerStation") == 0 then
        print("Power station under attack -- Marking as untargeted")
        SobGroup_MakeUntargeted("Attackers_Of_PowerStation")
        print("Ordering attackers to attack mothership instead")
        SobGroup_Attack(2, "Attackers_Of_PowerStation", Players_Mothership)
        SobGroup_Clear("Attackers_Of_PowerStation")
    end
end

-- New function to check for idle raiders and redirect them
function Rule_CheckIdleRaiders()
    -- Check each raider wave group
    for i = 1, 8 do
        local wave_group = "RaiderWave_" .. i
        -- If the group exists and is not empty
        if SobGroup_Empty(wave_group) == 0 then
            -- Check if they're idle (not attacking or moving)
            if SobGroup_IsDoingAbility(wave_group, AB_Attack) == 0 and 
               SobGroup_IsDoingAbility(wave_group, AB_Move) == 0 then
                print("Raider group " .. wave_group .. " is idle, redirecting to attack mothership")
                -- Fix: Add player ID parameter for SobGroup_Attack
                SobGroup_Attack(2, wave_group, Players_Mothership)
            end
        end
    end
end

-- Make scouts return to mothership
function Rule_ScoutsReturnHome()
    -- Fill scout group with all scouts
    SobGroup_FillShipsByType("ScoutGroup", 0, "Hgn_Scout")
    -- Disable hyperspace for scouts
    SobGroup_AbilityActivate("ScoutGroup", AB_Hyperspace, 0)
    -- Form them into a wall formation
    SobGroup_FormStrikeGroup("ScoutGroup", "wall")
    -- Move back to mothership
    SobGroup_MoveToSobGroup("ScoutGroup", Players_Mothership)
    
    Rule_Remove("Rule_ScoutsReturnHome")
end

-- Function to modify wave difficulty
function Increase_Wave_Difficulty()
    g_current_units_per_squad = g_current_units_per_squad + 1
end

-- Rule to trigger raider taunt after delay
function Rule_PlayRaiderTaunt()
    if Universe_GameTime() - g_now_time >= 5 then
        Event_Start("speechevent_raiderstaunt")
        Rule_Remove("Rule_PlayRaiderTaunt")
    end
end

-- Rule to trigger analysis during second wave (now handled in Rule_SpawnWave)
function Rule_PlayRaiderAnalysis()
    -- Remove this rule since we handle it in Rule_SpawnWave now
    Rule_Remove("Rule_PlayRaiderAnalysis")
end

function Rule_TriggerRaiderEncounter()
    -- Start timer for event
    g_now_time = Universe_GameTime()  -- Reset time for the event
    Rule_Add("Rule_WaitForRaiders")
    
    Rule_Remove("Rule_TriggerRaiderEncounter")
end

function Rule_WaitForRaiders()
    if Universe_GameTime() - g_now_time >= 15 then
        -- Start the encounter event
        Event_Start("intelevent_turanicraidersspotted")
        Rule_Remove("Rule_WaitForRaiders")
    end
end

-- Create carrier sobgroups early
function Init_CarrierGroups()
    -- Main carrier group
    SobGroup_Create("Battlegroup_Selum")
    SobGroup_Create("Selum_Carrier")
    SobGroup_Create("Selum_Escorts")
    
    -- Squadron groups
    SobGroup_Create("Selum_Multiguns")
    SobGroup_Create("Selum_HFTs") 
    SobGroup_Create("Selum_Railguns")
end

-- Check mothership health and trigger carrier arrival
function Rule_CheckMothershipHealth()

    if SobGroup_HealthPercentage(Players_Mothership) <= 0.5 and g_carrier_spawned == 0 then

        SobGroup_SpawnNewShipInSobGroup(2, "Hgn_AssaultFrigate", "Selum_Escorts", "Selum_Escorts", "vol_SelumArrival")
        SobGroup_SpawnNewShipInSobGroup(2, "Hgn_AssaultFrigate", "Selum_Escorts", "Selum_Escorts", "vol_SelumArrival")
        
        -- Make the carrier exit hyperspace
        SobGroup_ExitHyperSpace("Selum_Carrier", "vol_SelumArrival")
        

        
        -- Make carrier face the mothership by moving a tiny bit towards it
        SobGroup_MoveToSobGroup("Selum_Carrier", Players_Mothership)
        
        -- Create subsystems immediately
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_C_Production_Fighter")
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_SC_Production_Corvette")
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_SC_Production_Frigate")
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_SC_Production_Destroyer")
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_C_Module_Defensefield")
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_C_Module_FireControl")
        SobGroup_CreateSubSystem("Selum_Carrier", "Hgn_SC_Sensors_DetectHyperspace")

        SobGroup_GuardSobGroup("Selum_Escorts", Players_Mothership)

        
        -- Combine into battle group
        SobGroup_SobGroupAdd("Battlegroup_Selum", "Selum_Carrier")
        SobGroup_SobGroupAdd("Battlegroup_Selum", "Selum_Escorts")
        
        -- Start as enemy for dramatic reveal
        SobGroup_SetSwitchOwnerFlag("Battlegroup_Selum", 0)
        FOW_RevealGroup("Battlegroup_Selum", 1)
        
        -- Stop any movement after orientation (so they don't actually move to the mothership)
        Rule_AddInterval("Rule_StopSelumAfterOrienting", 5)
        
        -- Trigger reveal event
        Rule_Add("Rule_TriggerSelumReveal")
        g_carrier_spawned = 1
    end
end

-- Add new function to stop movement after orientation
function Rule_StopSelumAfterOrienting()
    SobGroup_Stop(1, "Selum_Carrier")
    Rule_Remove("Rule_StopSelumAfterOrienting")
end

function Rule_KeepPowerStationAlive()
    -- First check if the PowerStation exists and is not empty
    if SobGroup_Empty("PlayersPowerStation") == 0 then
        print("PlayersPowerStation exists and is not empty, keeping alive")
        -- Keep the Power Station above 30% health
        if SobGroup_HealthPercentage("PlayersPowerStation") <= 0.30 then
            SobGroup_SetHealth("PlayersPowerStation", 0.35)
        end
    end
end

-- Handle carrier reinforcement logic
function Rule_CarrierReinforcements()
    -- Debug
    print("DEBUG: g_carrier_spawned = " .. tostring(g_carrier_spawned))
    print("DEBUG: g_carrier_reinforcing = " .. tostring(g_carrier_reinforcing))



    if g_carrier_spawned == 1 and g_carrier_reinforcing == 1 then
        print("DEBUG: Entering CarrierReinforcements Function!")
        SobGroup_Create("Selum_Carrier") -- If it doesn't exist yet.
        SobGroup_FillShipsByType("Selum_Carrier", "Battlegroup_Selum", "Hgn_BattleCarrier")

        SobGroup_Create("temp_Selum_Multiguns")
        SobGroup_Create("temp_Selum_HFTs")
        SobGroup_Create("temp_Selum_Railguns")

        -- Check and spawn any missing squadrons immediately after the cutscene
        while g_multiguns_active < g_max_squadron_count do
            print("Spawning Hgn_MultiGunCorvette")
            SpawnSquadron("Hgn_MultiGunCorvette", "Selum_Multiguns")
            g_multiguns_active = g_multiguns_active + 1
        end
        while g_hft_active < g_max_squadron_count do
            print("Spawning Hgn_HFT")
            SpawnSquadron("Hgn_HFT", "Selum_HFTs")
            g_hft_active = g_hft_active + 1
        end
            
        while g_railgun_active < g_max_squadron_count do
            print("Spawning Hgn_RailgunFighter")
            SpawnSquadron("Hgn_RailgunFighter", "Selum_Railguns")
            g_railgun_active = g_railgun_active + 1
        end
    end





end

-- Helper function to spawn and setup a squadron
function SpawnSquadron(shipType, groupName)
    print("Spawning squadron " .. shipType .. " into group " .. groupName)
    -- Create a temporary group for the new squadron
    local tempGroup = "temp_"..groupName
    SobGroup_Create(tempGroup)
    
    -- Spawn the ship into the temp group
    SobGroup_SpawnNewShipInSobGroup(1, shipType, tempGroup, tempGroup, "vol_SelumArrival")
    
    -- If spawn successful, dock it then launch it
    if SobGroup_Empty(tempGroup) == 0 then
        print("Spawned squadron successfully")
        -- Add to the main group first
        SobGroup_SobGroupAdd(groupName, tempGroup)
        
        -- Dock instantly with carrier
        SobGroup_DockSobGroupInstant(tempGroup, "Selum_Carrier")
        
        -- Launch from carrier
        SobGroup_Launch(tempGroup, "Selum_Carrier")
        
        -- Guard the mothership
        SobGroup_GuardSobGroup(groupName, Players_Mothership)
    end
    
    -- Clean up temp group
    SobGroup_Clear(tempGroup)
end


-- Handle the reveal cinematic
function Rule_TriggerSelumReveal()
    -- Start cinematic sequence
    Sensors_Toggle(1) 
    
    -- Move camera to good viewing angle
    Camera_FocusSobGroupWithBuffer("Battlegroup_Selum", 2, 1000, 2)
    
    -- Play dialogue sequences
    Event_Start("intelevent_capitalclassincoming")
    
    -- After dialogue, switch carrier to friendly
    SobGroup_SwitchOwner("Battlegroup_Selum", 2)
    Player_SetPlayerName(2, "Battlegroup Selum")
    
    g_next_reinforcement_time = Universe_GameTime() + g_reinforcement_interval

    Rule_Add("Rule_CarrierReinforcements")
    
    Rule_Remove("Rule_TriggerSelumReveal")
end

-- Add cleanup for destroyed squadrons
function Rule_CheckSquadronLosses()
    g_multiguns_active = SobGroup_Count("Selum_Multiguns")
    g_hft_active = SobGroup_Count("Selum_HFTs")
    g_railgun_active = SobGroup_Count("Selum_Railguns")
end

-- Add new function to unrestrict with delay
function Rule_UnrestrictHeavyInterceptor()
    Player_UnrestrictResearchOption(0, "IntruderTech")
    Player_GrantResearchOption_Smart(0, "IntruderTech")
    Player_UnrestrictBuildOption(0, "hgn_railgunfighter")
    Rule_Remove("Rule_UnrestrictHeavyInterceptor")
end

-- Modify check function to require 2 more squadrons
function Rule_CheckHeavyInterceptorBuilt()
    if g_hft_objective_complete == 0 then
        -- Check if player has built any Heavy Interceptors (need 3 total, we start with 1)
        if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(0, "hgn_railgunfighter") >= 3 then
            print("Heavy Interceptor objective complete - 3 squadrons reached")
            Objective_SetState(obj_sec_build_hft_id, OS_Complete)
            g_hft_objective_complete = 1
            Rule_Remove("Rule_CheckHeavyInterceptorBuilt")
        end
    end
end

-- Add new event for low pilot warning
Events.speechevent_lowpilotwarning = {
    {
        { "Sound_EnterIntelEvent()", "" },
        { "Sound_SetMuteActor('Fleet')", "" },
        HW2_SubTitleEvent(Actor_FleetCommand, "$60570", 5),  -- All available pilots have been deployed... Unable to maintain combat effectiveness.
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetCommand, "$60571", 6),  -- Mayday. This is the Pride of Hiigara broadcasting on all open frequencies. We are under attack and unable to fight back! I repeat, mayday, mayday!
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(Actor_FleetIntel, "$60572", 5),  -- The signal is being degraded by nebula interference. Transmission range compromised.
    },
    -- Now the raiders respond mockingly again
    { HW2_Wait(12) },
    {
        HW2_SubTitleEvent(12, "$60573", 5),  -- Aww, poor Hiigara. Guess you're gonna find out what it's like to lose your homeworld after all!
    },
    { HW2_Wait(12) },
    {
        HW2_SubTitleEvent(12, "$60574", 5),  -- I call dibs on the bald chick in the core! Bet she's got some fine Hiigaran ass!
    },
    { HW2_Wait(1) },
    {
        HW2_SubTitleEvent(12, "$60575", 5),  -- Hah, as if I'd let you anywhere near that booty!
    },
    {
        { "Sound_ExitIntelEvent()", "" },
        { "Sound_SetMuteActor('')", "" },
    },
}

-- Add rule to check pilot count
function Rule_CheckPilotCount()
    local playerIndex = Universe_CurrentPlayer()
    local playerIndexList = playerIndex + 1
    
    if NeededPilots[playerIndexList] < 5 and g_pilot_warning_played ~= 1 then
        Event_Start("speechevent_lowpilotwarning")
        g_pilot_warning_played = 1  -- Only play once
        Rule_Remove("Rule_CheckPilotCount")
    end
end