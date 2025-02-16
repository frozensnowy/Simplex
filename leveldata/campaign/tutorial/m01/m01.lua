dofilepath("data:scripts/scar/restrict.lua")
dofilepath("data:scripts/scar/scar_util.lua")
dofilepath("data:scripts/shipdata.lua")
g_save_id = 0
	

--=========================== OBJECTIVES ====================================

objectives = {}
objectives.objDestroyEnemyForces = 
{ 
	title = "Neutralize all enemy forces.", 
	id = 0, 
	desc = "Search and destroy all enemy production units.", 
	level = "primary", 
}
objectives.objClearAndSecure = 
{ 
   	title = "Clear and secure the resource area.", 
	id = 0, 
	desc = "The Vaygr raiders have established a logistic center in this resource area.\n\Dislodge all enemy units by force and clear the area.\n\nWhen it is secured, 15th Fleet will hyperspace a support station into the theater of operations.", 
	level = "primary", 
}

--=========================== INITIALISATION =================================

function OnInit()
	Rule_Add("Rule_Init_1")
	SinglePlayer_OnInit()
	MPRestrict()
	Sound_SetMuteActor("Fleet")
	iNumberPlayers = Universe_PlayerCount() - 1
	SobGroup_Create("sgTemp")
	SobGroup_Create("sgTemp1")
	SobGroup_Create("sgTemp2")
	SobGroup_Create("sgDockedShips")
	--for i = 0, iNumberPlayers do
		--BuildSubsystems("Player_Ships"..i)
	--	Powertothestation("Player_Powerstation"..i)
	--end
	GrantResearchToAll()
	Player_Setup()
	AI_Setup()
	Event_Start("evTacticalBriefing")
	Rule_Add("Rule_ClearAndSecure")
	InitAutomaticFunctions()
	UI_BindKeyEvent(F1KEY, "AutomaticFunctions")
	Rule_AddInterval("Rule_WatchDefeat", 2)	
end
dofilepath("data:leveldata/campaign/singleplayer_oninit.lua")

--================== SET PLAYER AND GROUP DETAILS =======================

function GrantResearchToAll()
	for p = 0, iNumberPlayers do
		Player_GrantAllResearch(p)
	end
end

function BuildSubsystems(sgShips)
	SobGroup_Create("sgVCarriers")
	local tSubsystem = { "FighterProduction", "CorvetteProduction", "FrigateProduction", "CapShipProduction", "Hyperspace", "FireControlTower", "PlatformProduction", "HyperspaceInhibitor", "Research", "AdvancedResearch", "AdvancedArray", "CloakGenerator", "CloakSensor", "HyperspaceSensor", }
	SobGroup_FillShipsByType("sgVCarriers", sgShips, "vgr_carrier")
	SobGroup_FillShipsByType("sgTemp", sgShips, "vgr_strikecarrier")
	SobGroup_SobGroupAdd("sgVCarriers", "sgTemp")
	local iNumberVCarriers = SobGroup_SplitGroupReference("sgVCarrier", "sgVCarriers", sgShips, SobGroup_Count("sgVCarriers"))
	if iNumberVCarriers >0 then
		for i = 1, iNumberVCarriers do
			SobGroup_CreateSubSystem("sgVCarrier"..i, tSubsystem[random(3)])
		end
	end
	for i = 1, 14 do
		assert(SobGroup_CreateSubSystem(sgShips, tSubsystem[i]))
	end
end

function Powertothestation(sgShips)
    SobGroup_Create("PowerPower")
    SobGroup_FillShipsByType("PowerPower", sgShips, "hgn_powerstation")
		for i = 1, iNumberVPower do
		SobGroup_CreateSubSystem("PowerPower"..i, "Hgn_power_m1", "Hgn_power_m2", "Hgn_power_m3", "Hgn_power_m4", "Hgn_power_m5", "Hgn_power_m6", "Hgn_power_m7", "Hgn_power_m8", "Hgn_power_m9", "Hgn_power_m0")
	end
	for i = 1, 14 do
		assert(SobGroup_CreateSubSystem(sgShips, tSubsystem[i]))
	end
end

	--SobGroup_Create("PowerPower")
	--local tSubsystemz = { "FighterProduction", "CorvetteProduction", "FrigateProduction", "CapShipProduction", "Hyperspace", "FireControlTower", "PlatformProduction", "HyperspaceInhibitor", "Research", "AdvancedResearch", "AdvancedArray", "CloakGenerator", "CloakSensor", "HyperspaceSensor", }
	--SobGroup_FillShipsByType("PowerPower", sgShips, "hgn_powerstation")
	--local iNumberVPower = SobGroup_SplitGroupReference("PowerP", "PowerPower", sgShips, SobGroup_Count("PowerPower"))
	--if iNumberVPower >0 then
	--	for i = 1, iNumberVPower do
	--		SobGroup_CreateSubSystem("PowerP", )
	--	end
	--end
	--for i = 1, 14 do
	--	assert(SobGroup_CreateSubSystem(sgShips, tSubsystem[i]))
	--end



function Player_Setup()
	SobGroup_AbilityActivate("Player_Ships0", AB_Builder, 0)
	SobGroup_SetTeamColours("sg225lcd", { 138/255, 136/255, 114/255, }, { 71/255, 76/255, 71/255, }, "DATA:Badges/(hiigaran navy)225lcdlt.tga")
	iReinforcementIndex = 0
	OrderReinforcement()
end

function OrderReinforcement()
	local iTime = 120 + random(90)
	iReinforcementIndex = iReinforcementIndex +1
	Rule_AddInterval("SpawnReinforcement", iTime)
end

function SpawnReinforcement()
	Event_Start("evReinforcement"..iReinforcementIndex)
	if iReinforcementIndex < 5 then
		OrderReinforcement()
	end
	Rule_Remove("SpawnReinforcement")
end	

function AI_Setup()
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SetAlliance(3, 2)
	SetAlliance(2, 3)
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	Player_SetPlayerName(1, "Armada de Makaan 465AR")
	Player_SetPlayerName(2, "Armada de Makaan 465AR")
	Player_SetPlayerName(3, "Armada de Makaan 465AR")
 	Player_SetRU(1, 0)
	Player_SetRU(2, 0)
	Player_SetRU(3, 50000)
	local iOption = random(1, 3)
	print("Choosing strategy #"..iOption)
	if iOption == 1 then
		CPU_Strategy1()
	elseif iOption == 2 then
		local iSurpriseRecoveryTime = 300 + random(300)
		Rule_AddInterval("CPU_Strategy2", iSurpriseRecoveryTime)
	elseif iOption == 3 then
		CPU_Strategy3()
	end
end

--===================== CPU Strategies ========================

function CPU_Strategy1() --Standard 'hard' behavior
	SobGroup_SwitchOwner("Player_Ships3", 2)
	Player_Kill(3)	   
end

function CPU_Strategy2() --Vaygr early counterstrike with a small but hopefully nasty taskgroup
	CPU_DoString(3, "cp_initThreatModifier = 0.1")
	CPU_DoString(3, "cp_attackPercent= 100")
	Rule_AddInterval("Rule_WatchStrategy2", 30)
	Rule_Remove("CPU_Strategy2")
end

function Rule_WatchStrategy2()
	if SobGroup_Count("Player_Ships3") == 1 then
		SobGroup_SwitchOwner("Player_Ships3", 2)
		Player_Kill(3)
		Rule_Remove("Rule_WatchStrategy2")
	end
end

function CPU_Strategy3() --Vaygr focus on defending, then retaking the patch
	SobGroup_SwitchOwner("Player_Ships3", 2)
	Player_Kill(3)
	iHoldPatch = CPU_AddDefendTarget(1, "volPatch1", 10000)
	CPU_SetDefendTargetCapturePriority(1, iHoldPatch)
	CPU_SetDefendTargetRadius(1, iHoldPatch, 15000)
	Rule_AddInterval("Rule_WatchStrategy3", 15)
end

--called when Player controls the patch
function Rule_WatchStrategy3()
	if Event_IsDone("evAreaClearedAndSecure") == 1 then
		iHoldPatch2 = CPU_AddDefendTarget(2, "volPatch1", 10000)
		iHoldPatch2 = CPU_AddDefendTarget(1, "volPatch1", 10000)
		CPU_SetDefendTargetCapturePriority(1, iHoldPatch2)
		Rule_Remove("Rule_WatchStrategy3")
	end
end


 --=========================== TASK: CLEAR AND SECURE =============================

function Rule_ClearAndSecure()
	if Event_IsDone("ev_TacticalBriefing") == 1 then
		SobGroup_Create("sgShipsInZone")
		addObjective("objClearAndSecure")
		Rule_AddInterval("Rule_WatchClearAndSecure", 5)
		Rule_Remove("Rule_ClearAndSecure")
	end
end
	
function Rule_WatchClearAndSecure()
	for i = 1, 3 do
		SobGroup_Clear("sgTemp")
		SobGroup_FillSobGroupInVolume("sgTemp", "Player_Ships"..i, "volPatch1")
		SobGroup_SobGroupAdd("sgShipsInZone", "sgTemp")
	end
	local li_testflag = 0
	if SobGroup_Empty("sgShipsInZone") == 1 then
		li_testflag = 1
	elseif SobGroup_AreAnyFromTheseAttackFamilies("sgShipsInZone", "Fighter, Corvette, Frigate, SmallCapitalShip, BigCapitalShip, Mothership, Capturer") == 0 then
		li_testflag = 1
	end
	SobGroup_Clear("sgShipsInZone")
	if li_testflag == 1 then
		Event_Start("evAreaClearedAndSecure")
		addObjective("objDestroyEnemyForces")
		completeObjective("objClearAndSecure")
		Ping_Remove(pngRallyZone)
		Rule_AddInterval("Rule_WatchDestroyEnemyForces", 5)
		Rule_Remove("Rule_WatchClearAndSecure")
	end
end

--=========================== TASK: DESTROY ENEMY FORCES ============================

function Rule_WatchDestroyEnemyForces()
	if Player_HasShipWithBuildQueue(1) == 0 and Player_HasShipWithBuildQueue(2) == 0 and Player_HasShipWithBuildQueue(3) == 0 then
		completeObjective("objDestroyEnemyForces")
		Event_Start("evVictory")
		Rule_Remove("Rule_WatchDestroyEnemyForces")
	end
end

--=========================== DEFEAT RULE =================

function Rule_WatchDefeat()
	if HW2_PlayerHasMilitary(0) == 0 then
		Event_Start("evDefeat")
		Rule_Remove("Rule_WatchDefeat")
	end
end

--======================== FUNCTION: OBJECTIVES ==============================
-- Mikail's modified version of the function found in the tutorial missions.
-- Further modified by SunTzu to enable standard game ending routine.

function addObjective(sObj)
	if objectives[sObj].level == "secondary" then 
		objectives[sObj].id = Objective_Add(objectives[sObj].title, OT_Secondary)
	else
		objectives[sObj].id = Objective_Add(objectives[sObj].title, OT_Primary)
	end
	if (objectives[sObj].desc) then
		Objective_AddDescription(objectives[sObj].id, objectives[sObj].desc)
	end
end

function completeObjective(obj)
	Objective_SetState(objectives[obj].id, OS_Complete)
end

function failedObjective(obj)
	Objective_SetState(objectives[obj].id, OS_Failed)
end

function ignoreObjective(obj)
	Objective_SetState(objectives[obj].id, OS_Off)
end


--==================== SPLIT GROUP FUNCTION ===================

-- function by Apollyon470; modified to start at 1
function SobGroup_SplitGroupReference(SobGroupOut, SobGroupToSplit, ReferenceSobGroup, NumberToSplit)
	local index = 0
	local distance = 0
	local bool = 0
	local SobNum = 1
	SobGroup_Clear ("sgTemp")
	SobGroup_Clear ("sgTemp1")
	SobGroup_SobGroupAdd ("sgTemp", SobGroupToSplit)
	if ( SobGroup_Empty (SobGroupToSplit) == 1 ) then
		return 0
	end
	if ( NumberToSplit > SobGroup_Count(SobGroupToSplit) ) then
		NumberToSplit = SobGroup_Count(SobGroupToSplit)
	end
	while (index < NumberToSplit ) do
		bool = 0
		interval = 625.0	
		while (bool == 0) do
			distance = distance + interval
			if (interval > 3000000) then		
				bool =1
				return SobNum
			end
			SobGroup_FillProximitySobGroup ("sgTemp1", "sgTemp", ReferenceSobGroup, distance)			 
			if (SobGroup_Empty("sgTemp1")==1)then
			else
				if (SobGroup_Count("sgTemp1") > 1) then
					if (interval <= .2) then
						SobGroup_Create(SobGroupOut .. tostring(SobNum))
						SobGroup_Clear (SobGroupOut .. tostring(SobNum))
						SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "sgTemp1")
						SobGroup_Create("sgTemp2")
						SobGroup_FillSubstract("sgTemp2", "sgTemp", SobGroupOut .. tostring(SobNum))
						SobGroup_Clear ("sgTemp")
						SobGroup_SobGroupAdd ("sgTemp", "sgTemp2")
						bool = 1
					else
						distance = distance - interval
						interval = interval / 5
					end
				else
					SobGroup_Create(SobGroupOut .. tostring(SobNum))
					SobGroup_Clear (SobGroupOut .. tostring(SobNum))
					SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "sgTemp1")
					SobGroup_Create("sgTemp2")
					SobGroup_FillSubstract("sgTemp2", "sgTemp", SobGroupOut .. tostring(SobNum))
					SobGroup_Clear ("sgTemp")
					SobGroup_SobGroupAdd ("sgTemp", "sgTemp2")
					bool = 1
				end
			end				
		end
		index = index + SobGroup_Count(SobGroupOut .. tostring(SobNum))
		SobNum = SobNum + 1
	end
	SobNum = SobNum - 1
	return SobNum
end

--================== EVENTS ================

Events = {}
Events.evTacticalBriefing = 
{ 
	{ 
	   	{ "Camera_UseCameraPoint('camInit')", "", },
	   	{ "Universe_EnableSkip(1)", "", }, 
	}, 
	{ 
	   	HW2_Letterbox(1),
	}, 
	{
		HW2_Wait(2),
		{ "Sound_EnableAllSpeech(1)","" },
		{ "Sound_EnterIntelEvent()","" },
		{ "Universe_EnableSkip(1)", "" },
		{ "Universe_AllowPlayerOrders(0)", "" },
		{ "Camera_AllowControl(0)", "" },
		{ "Sensors_EnableCameraZoom(0)", "" },
	},
	{
		HW2_Wait(0.5), 
		HW2_Pause(1),
	}, 
	{
		HW2_LocationCardEvent("HIIGARA", 1.5),
	}, 
	{
		HW2_Wait(0.5), 
	}, 
	{
		HW2_LocationCardEvent("DURING THE VAYGR SIEGE", 3),
	}, 
	{
		HW2_Wait(0.5), 
	}, 
	{ 
		{ "Sensors_Toggle(1)", "", },
	},
	{
		HW2_Wait(0.5), 
	}, 
	{
		{ "Camera_Interpolate('here', 'camPoint1', 3)", "", },
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "The Vaygr are using this area as a base for their raids against our planetary shuttles.", 6), 
	},
	{
		HW2_Wait(0.5), 
	}, 
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "They must be dislodged by force.", 2.5), 
	},
	{
		HW2_Wait(0.5), 
	}, 
	{
		{ "Camera_Interpolate('here', 'camPoint2', 4)", "", },
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "You will launch a shock offensive against their positions and neutralize all their production units.", 5), 
	},
	{
		{ "pngRallyZone = Ping_AddPoint('Vaygr Logistics Centre', 'objective3d', 'volPatch1')", "", },
		{ "pngPatch2 = Ping_AddPoint('Target 2', 'objective3d', 'volPatch5')", "", },
	},
	{
		HW2_Wait(0.5), 
	}, 
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "This resource patch is one of their advanced logistic centres.", 3), 
	},
	{
 		{ "Camera_Interpolate('here', 'camPoint3', 2)", "", },
	},
	{
		HW2_Wait(0.5), 
	}, 
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "It is your primary objective.", 2), 
	},
	{
		HW2_Wait(2), 
	}, 
	{
 		{ "Camera_Interpolate('here', 'camPoint4', 1.5)", "", },
	},
	{
		{ "pngBC1 = Ping_AddSobGroup('HGN Iron Duke BV', 'shipnameSM', 'sgBC1')", "",},
		{ "Ping_AddDescription(pngBC1, 0, '225th LCD')", "" },
		{ "Ping_LabelVisible(pngBC1, 1)", "", },
	},
	{
		{ "pngBC2 = Ping_AddSobGroup('HGN Uhura BV', 'shipnameSM', 'sgBC2')", "",},
		{ "Ping_AddDescription(pngBC2, 0, '225th LCD')", "" },
		{ "Ping_LabelVisible(pngBC2, 1)", "", },
	},
	{
		{ "SobGroup_SelectSobGroup('sg225lcd')", "", },
	},
 	{
		HW2_SubTitleEvent(Actor_FleetIntel, "A detachment of 225th Line Combat Division has been placed under your command to spearhead the attack.", 4), 
	},
	{
		HW2_Wait(1.5), 
	}, 
	{
		{ "Camera_Interpolate('here', 'camPoint5', 9)", "", },
	}, 
	{
		{ "SobGroup_DeSelectAll()", "", },
	},
	{
		{ "SobGroup_SelectSobGroup('sg15thFleet')", "", },
	},
	{
		{ "pngCarrier = Ping_AddSobGroup('HGN Victorious CVF', 'shipnameSM', 'sgCarrier')", "",},
		{ "Ping_AddDescription(pngCarrier, 0, '15th Fleet Detachment')", "" },
		{ "Ping_LabelVisible(pngCarrier, 1)", "", },
	},
	{
 		HW2_SubTitleEvent(Actor_FleetIntel, "Light elements of 15th Fleet will provide cover and support.", 2.5),
	},
	{
		HW2_Wait(2), 
	}, 
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Reinforcements from 15th Fleet will rally your assault group as they arrive in the Hiigaran system.", 3.5), 
	},
	{
		{ "SobGroup_DeSelectAll()", "", },
	},
	{
		HW2_Wait(0.5), 
	}, 
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Move on to the attack! Good luck!", 3), 
	},
	{
		HW2_Wait(1), 
	}, 
	{
		HW2_Letterbox(0),
	},
	{
		HW2_Wait(2),
		HW2_Pause(0),
		{ "Sound_ExitIntelEvent()","" },
		{ "Sound_SetMuteActor(' ')", ""},
		{ "Sensors_Toggle(0)", "", },
		{ "Universe_AllowPlayerOrders(1)", "" },
		{ "Camera_AllowControl(1)", "" },
		{ "Sensors_EnableCameraZoom(1)", "" },
		{ "Universe_EnableSkip(0)", "", },
 	},
}

Events.evReinforcement1 =
{
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Khopesh cruisers hyperspacing in.", 3),
	},
	{
		{ "SobGroup_ExitHyperSpaceSobGroup('sgKhopesh', 'Player_Ships0', 600)", "", },
	},
}
Events.evReinforcement2 =
{
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Lavi strikegroup joining the battle.", 3),
	},
	{
		{ "SobGroup_ExitHyperSpaceSobGroup('sgLavi', 'Player_Ships0', 600)", "", },
	},
}
Events.evReinforcement3 =
{
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Patrol tanker reporting for duty.", 3),
	},
	{
		{ "SobGroup_ExitHyperSpaceSobGroup('sgPatcom', 'Player_Ships0', 600)", "", },
	},
}
Events.evReinforcement4 =
{
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "LiirHra Resourcers reinforcing the task group.", 3),
	},
	{
		{ "SobGroup_ExitHyperSpaceSobGroup('sgLiirHra', 'Player_Ships0', 600)", "", },
	},
}
Events.evAreaClearedAndSecure =
{
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Primary objective fulfilled.", 3),
	},
	{
		{ "SobGroup_ExitHyperSpaceSobGroup('sgShipyard', 'Player_Ships0', 600)", "", },
	},
	{
		HW2_Wait(0.5),
	},
	{
		{ "Camera_FocusSobGroup('sgShipyard', 250, 15000, 3)", "", },
		HW2_SubTitleEvent(Actor_FleetIntel, "Fleet Support Station cleared to hyperspace in.", 3),
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel, "Start bridgehead and staging operations. Then finish the job.", 3),
	},
	{
		HW2_Wait(0.5),
	},
	{
		{ "Player_SetRU(0, 16000)", "", },
	},
	{
		HW2_Wait(0.5),
	},
	{
		{ "SobGroup_AbilityActivate('Player_Ships0', AB_Builder, 1)", "", },
	},
}
Events.evVictory =
{
	{	
		HW2_Letterbox(1),
		HW2_Wait(2),
		{ "Sound_EnableAllSpeech(1)",""},
		{ "Sound_EnterIntelEvent()","" },
		{ "Universe_EnableSkip(0)", "" },
		{ "Universe_AllowPlayerOrders(0)", "" },
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel,"The enemy forces have been destroyed.", 3),
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_LocationCardEvent("MISSION COMPLETE", 4),
	},
	{
		{ "Universe_AllowPlayerOrders(1)", "" },
		{ "setMissionComplete(1)", "" },
	},
}
Events.evDefeat =
{
	{	
		HW2_Letterbox(1),
		HW2_Wait(2),
		{ "Sound_EnableAllSpeech(1)",""},
		{ "Sound_EnterIntelEvent()","" },
		{ "Universe_EnableSkip(0)", "" },
		{ "Universe_AllowPlayerOrders(0)", "" },
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel,"You were unable to fulfil your objectives.", 3),
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_SubTitleEvent(Actor_FleetIntel,"This setback will have consequences upon the people of Hiigara.", 3),
	},
	{
		HW2_Wait(1),
	},
	{
		HW2_LocationCardEvent("MISSION FAILED", 4),
	},
	{
		{ "Universe_AllowPlayerOrders(1)", "" },
		{ "setMissionComplete(0)", "" },
	},
}

--========= AUTOMATIC FUNCTIONS ==========
function InitAutomaticFunctions()
	SobGroup_Create("sgCollectors")
	SobGroup_Create("sgNewCollectors")
	SobGroup_Create("sgDockedShips")
	for p = 0, iNumberPlayers do
		SobGroup_Create("sgPlayer"..p.."Carriers")
		SobGroup_Create("sgPlayer"..p.."Ships")
	end
	if Player_GetRace(0) == 1 or Player_GetRace(0) == 6 then
		sCollector = "hgn_resourcecollector"
	else
		sCollector = "vgr_resourcecollector"
	end
	iAuto = 0
end

function AutomaticFunctions()
	if iAuto == 0 then
		Rule_AddInterval("Rule_AutoHarvest", 5)
		Subtitle_Message("Auto-Harvest ON - Auto-Dock OFF", 2)
		iAuto = 1
	elseif iAuto == 1 then
		Rule_AddInterval("Rule_AutoDock", 2)
		Subtitle_Message("Auto-Harvest ON - Auto-Dock ON", 2)
		iAuto = 2
		tNbCarriers = {}
		tNbShips = {0,0,0,0,0,0}
		iRound = 0
	elseif iAuto == 2 then
		Rule_Remove("Rule_AutoHarvest")
		Subtitle_Message("Auto-Harvest OFF - Auto-Dock ON", 2)
		iAuto = 3
	elseif iAuto == 3 then
		Rule_Remove("Rule_AutoDock")
		Subtitle_Message("Auto-Harvest OFF - Auto-Dock OFF", 2)
		iAuto = 0
	end
end

function Rule_AutoHarvest()
	Player_FillShipsByType("sgTemp", 0, sCollector)
	SobGroup_FillSubstract("sgNewCollectors", "sgTemp", "sgCollectors")
	SobGroup_Resource(0, "sgNewCollectors")
	SobGroup_SobGroupAdd("sgCollectors", "sgNewCollectors")
end

function Rule_AutoDock()
--update lists, done every 24 seconds for each player
	if iRound < iNumberPlayers then
		if Player_IsAlive(iRound) == 1 then
			SobGroup_Clear("sgPlayer"..iRound.."Carriers")
			SobGroup_Clear("sgPlayer"..iRound.."Ships")
			for i, iCount in tCarriers do
				Player_FillShipsByType("sgTemp", iRound, iCount.name)
				if SobGroup_Empty("sgTemp") == 0 then
					SobGroup_SobGroupAdd("sgPlayer"..iRound.."Carriers", "sgTemp")
				end
			end
			tNbCarriers[iRound] = SobGroup_SplitGroupReference("sgPlayer"..iRound.."Carrier", "sgPlayer"..iRound.."Carriers", "Player_Ships"..iRound, SobGroup_Count("sgPlayer"..iRound.."Carriers"))
			for i, iCount in tSC do
				Player_FillShipsByType("sgTemp", iRound, iCount.name)
				if SobGroup_Empty("sgTemp") == 0 then
					SobGroup_SobGroupAdd("sgPlayer"..iRound.."Ships", "sgTemp")
				end
			end
			tNbShips[iRound] = SobGroup_SplitGroupReference("sgPlayer"..iRound.."Ship", "sgPlayer"..iRound.."Ships", "Player_Ships"..iRound, SobGroup_Count("sgPlayer"..iRound.."Ships"))
		end
	end
	iRound = iRound + 1
	if iRound == 12 then
		iRound = 0
	end
--auto dock procedure
	tScore = {}
	tRevScore = {}
	for p = 0, iNumberPlayers do
		for i = 1, tNbShips[p] do
			if SobGroup_HealthPercentage("sgPlayer"..p.."Ship"..i) < 0.5 then
				tSquadron = SobGroup_GetPosition("sgPlayer"..p.."Ship"..i)
				for j = 1, tNbCarriers[p] do
					tCarrier = SobGroup_GetPosition("sgPlayer"..p.."Carrier"..j)
					iDistance = floor(sqrt((tSquadron[1]-tCarrier[1])*(tSquadron[1]-tCarrier[1]) + (tSquadron[2]-tCarrier[2])*(tSquadron[2]-tCarrier[2]) + (tSquadron[3]-tCarrier[3])*(tSquadron[3]-tCarrier[3])))
					SobGroup_GetSobGroupDockedWithGroup("sgPlayer"..p.."Carrier"..j, "sgDockedShips")
					if SobGroup_HealthPercentage("sgPlayer"..p.."Carrier"..j) < 0.15 then
							SobGroup_Launch("sgDockedShips", "sgPlayer"..p.."Carrier"..j)
							tScore[j] = 1000
					else
						tScore[j] = iDistance/500 + SobGroup_Count("sgDockedShips")/4/SobGroup_HealthPercentage("sgDockedShips")*3
					end
				end
				for k, kCount in tScore do
					tRevScore[kCount] = k
				end
				sort(tScore)
				if tScore[1] < 40 then
					SobGroup_DockSobGroup("sgPlayer"..p.."Ship"..i, "sgPlayer"..p.."Carrier"..tRevScore[tScore[1]])
				end
			end
		end
	end
end
