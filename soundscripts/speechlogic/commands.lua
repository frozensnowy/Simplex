-- LuaDC version 0.9.19
-- 14/06/2004 22.07.38
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
DEF_on = 0
DEF_off = 1
DEF_out = 2
DEF_low = 3
Resource = 2
Fighter = 3
Corvette = 4
Support = 5
MISC = 6
Capital = 7
Frigate = 8
SubSystem = 9
Platform = 10
Megalith = 11
Flagship = 12
NumAllPilots = 5
NumCapPilots = 4
NumFighterPilots = 3
NumInfiltratorPilots = 2
NumMarinePilots = 2
NumSupportPilots = 3
NameAllPilot = "All_"
NameCapPilot = "Cap_"
NameFighterPilot = "Fighter_"
NameInfiltratorPilot = "Infiltrator_"
NameMarinePilot = "Marine_"
NameSupportPilot = "Support_"
NameFleetCommand = "Fleet"
NameMakaan = "Makaan"
NameEmperor = "Emperor"
Frequency_Command = 0.5
Frequency_Status = 2
Frequency_Chatter = 5
Hiigaran = 1
Vaygr = 2
Raider = 4
MP_AllianceRequested = 0
MP_AllianceFormed = 1
MP_AllianceBroken = 2
MP_RUsTransferred = 3
MP_ShipsTransferred = 4
HYP_Entering = 0
HYP_EnteringGate = 1
HYP_Exiting = 2
HYP_Interrupted = 3
HYP_GateFormed = 4
HYP_EnteredInhibitorVolume = 5
HYP_NotEnoughCash = 6
AggressiveTactics = 0
DefensiveTactics = 1
PassiveTactics = 2
CloseRange = 0
MediumRange = 1
LongRange = 2
ACT_Selected = 1
ACT_Created = 2
ACT_Reinforced = 3
sscMap = {}
sscMap.Battlecruiser = {}
sscMap.Carrier = {}
sscMap.Shipyard = {}
sscMap.MotherShip = {}
sscMap.crewstation = {}
sscMap.Researchstation = {}
sscMap.Power = {}
sscMap.BattleCarrier = {}
sscMap.Shipyard_g = {}
sscMap.Carrier.C_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromCarrier_1"
sscMap.Carrier.C_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromCarrier_1"
sscMap.Carrier.C_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromCarrier_1"
--sscMap.Carrier.C_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromCarrier_1"
sscMap.Carrier.C_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromCarrier_1"
--sscMap.Carrier.C_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromCarrier_1"
sscMap.Carrier.C_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromCarrier_1"
sscMap.Carrier.C_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromCarrier_1"
sscMap.Carrier.C_SENSORS_ADVANCEDARRAY = "STATUS_SensorsArrayConstructedFromCarrier_1"
sscMap.Carrier.C_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromCarrier_1"
sscMap.Shipyard.MS_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromShipyard_1"
sscMap.Shipyard.MS_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromShipyard_1"
sscMap.Shipyard.MS_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromShipyard_1"
--sscMap.Shipyard.MS_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromShipyard_1"
sscMap.Shipyard.SY_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromShipyard_1"
sscMap.Shipyard.SY_PRODUCTION_CAPSHIP = "STATUS_CapitalShipFacilityConstructedFromShipyard_1"
--sscMap.Shipyard.MS_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromShipyard_1"
sscMap.Shipyard.MS_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromShipyard_1"
sscMap.Shipyard.MS_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromShipyard_1"
sscMap.Shipyard.MS_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromShipyard_1"
--sscMap.Shipyard.CANBUILDPOH2 = "STATUS_FrigateConstructed_1"

sscMap.Shipyard_g.MS_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromShipyard_1"
sscMap.Shipyard_g.MS_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromShipyard_1"
sscMap.Shipyard_g.MS_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromShipyard_1"
--sscMap.Shipyard_g.MS_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromShipyard_1"
sscMap.Shipyard_g.SY_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromShipyard_1"
sscMap.Shipyard_g.SY_PRODUCTION_CAPSHIP = "STATUS_CapitalShipFacilityConstructedFromShipyard_1"
--sscMap.Shipyard_g.MS_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromShipyard_1"
sscMap.Shipyard_g.MS_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromShipyard_1"
sscMap.Shipyard_g.MS_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromShipyard_1"
sscMap.Shipyard_g.MS_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromShipyard_1"
--sscMap.Shipyard_g.CANBUILDPOH2 = "STATUS_FrigateConstructed_1"

sscMap.Battlecruiser.C_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromBattlecruiser_1"
sscMap.Battlecruiser.C_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromBattlecruiser_1"
sscMap.Battlecruiser.C_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromBattlecruiser_1"
--sscMap.Battlecruiser.C_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromBattlecruiser_1"
sscMap.MotherShip.MS_PRODUCTION_FIGHTER = "STATUS_FighterFacilityConstructedFromMothership_1"
sscMap.MotherShip.MS_PRODUCTION_CORVETTE = "STATUS_CorvetteFacilityConstructedFromMothership_1"
sscMap.MotherShip.MS_PRODUCTION_FRIGATE = "STATUS_FrigateFacilityConstructedFromMothership_1"
sscMap.MotherShip.MS_PRODUCTION_FRIGATEADVANCED = "STATUS_AdvancedFrigateFacilityConstructedFromMothership_1"
sscMap.MotherShip.MS_MODULE_PLATFORMCONTROL = "STATUS_PlatformFacilityConstructedFromMothership_1"
--sscMap.MotherShip.MS_MODULE_RESEARCH = "STATUS_ResearchModuleConstructedFromMothership_1"
sscMap.MotherShip.MS_MODULE_CLOAKGENERATOR = "STATUS_CloakGeneratorConstructedFromMothership_1"
sscMap.MotherShip.MS_MODULE_FIRECONTROL = "STATUS_FireControlTowerConstructedFromMothership_1"
sscMap.MotherShip.MS_SENSORS_ADVANCEDARRAY = "STATUS_SensorsArrayConstructedFromMothership_1"
sscMap.MotherShip.MS_MODULE_HYPERSPACE = "STATUS_HyperspaceCoreConstructedFromMothership_1"
--sscMap.MotherShip.MS_MODULE_RESEARCHADVANCED = "STATUS_AdvResearchModuleConstructedFromMothership_1"
sscMap.MotherShip.MS_PRODUCTION_CAPSHIP = "STATUS_CapitalShipFacilityConstructedFromMothership_1"
sscMap.MotherShip.MS_PRODUCTION_CAPSHIPADVANCED = "STATUS_AdvancedCapitalShipFacilityConstructedFromMothership_1"
--sscMap.MotherShip.SIRENA = "STATUS_Sirena"
sscMap.crewstation.PILOTMODULE = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.PILOTMODULE1 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.PILOTMODULE2 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.PILOTMODULE3 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.PILOTMODULE4 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.PILOTMODULE5 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.OFFICERMODULE = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.OFFICERMODULE1 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.OFFICERMODULE2 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.OFFICERMODULE3 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.OFFICERMODULE4 = "STATUS_UnitcapIncreased_1"
sscMap.crewstation.ISLIEUTENANTCORE = "STATUS_Rank_1"
sscMap.crewstation.ISCOMMANDERCORE = "STATUS_Rank_1"
sscMap.crewstation.ISCAPTAINCORE = "STATUS_Rank_1"
sscMap.crewstation.ISCOMMODORECORE = "STATUS_Rank_1"
sscMap.crewstation.ISADMIRALCORE = "STATUS_Rank_1"
sscMap.crewstation.ISFLEETADMIRALCORE = "STATUS_Rank_1"
sscMap.Researchstation.MS_MODULE_RESEARCH = "STATUS_ResearchModuleConstructed_1"
sscMap.Researchstation.MS_MODULE_RESEARCHADVANCED = "STATUS_ResearchModuleConstructed_1"
sscMap.Researchstation.MS_MODULE_RESEARCHADVANCED1 = "STATUS_ResearchModuleConstructed_1"
sscMap.Power.POWER_M0 = "STATUS_Power_1"
sscMap.Power.POWER_M1 = "STATUS_Power_1"
sscMap.Power.POWER_M2 = "STATUS_Power_1"
sscMap.Power.POWER_M3 = "STATUS_Power_1"
sscMap.Power.POWER_M4 = "STATUS_Power_1"
sscMap.Power.POWER_M5 = "STATUS_Power_1"
sscMap.Power.POWER_M6 = "STATUS_Power_1"
sscMap.Power.POWER_M7 = "STATUS_Power_1"
sscMap.Power.POWER_M8 = "STATUS_Power_1"
sscMap.Power.POWER_M9 = "STATUS_Power_1"
sscMap.MotherShip.POWER_MS = "STATUS_Power_1"
sscMap.MotherShip.POWER_MS1 = "STATUS_Power_1"
sscMap.Shipyard.POWER_MS = "STATUS_Power_1"
sscMap.Shipyard_g.POWER_MS = "STATUS_Power_1"
sscMap.BattleCarrier.POWER_MS = "STATUS_Power_1"

stdCMap = {}
stdCMap.Hgn_Scout = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_Interceptor = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_AttackBomber = "STATUS_FighterConstructed_1" --OK
stdCMap.hgn_lbomber = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_Defender = "STATUS_FighterConstructed_1" --OK
stdCMap.hgn_railgunfighter = "STATUS_FighterConstructed_1" --OK
stdCMap.hgn_hft = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_AttackBomberHeavy = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_AssaultCorvette = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_Interceptorl = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_AttackBomberl = "STATUS_FighterConstructed_1" --OK
stdCMap.hgn_lbomberl = "STATUS_FighterConstructed_1" --OK
stdCMap.hgn_railgunfighterl = "STATUS_FighterConstructed_1" --OK
stdCMap.hgn_hftl = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_AttackBomberHeavyl = "STATUS_FighterConstructed_1" --OK
stdCMap.Hgn_PulsarCorvette = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_MinelayerCorvette = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_MultiGunCorvette = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_cth = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_cthion = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_AssaultCorvettel = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_PulsarCorvettel = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_MultiGunCorvettel = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_cthl = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_cthionl = "STATUS_CorvetteConstructed_1" --OK
stdCMap.Hgn_AssaultFrigate = "STATUS_FrigateConstructed_1" --OK
stdCMap.Hgn_TorpedoFrigate = "STATUS_FrigateConstructed_1" --OK
stdCMap.Hgn_MarineFrigate = "STATUS_FrigateConstructed_1" --OK
stdCMap.Hgn_DefenseFieldFrigate = "STATUS_FrigateConstructed_1" --OK
stdCMap.Hgn_IonCannonFrigate = "STATUS_FrigateConstructed_1" --OK
stdCMap.hgn_lrms = "STATUS_FrigateConstructed_1" --OK
stdCMap.Hgn_Tulwar = "STATUS_FrigateConstructed_1" --OK
stdCMap.Hgn_Destroyer = "STATUS_DestroyerConstructed_1" --OK
stdCMap.Hgn_SweeperDestroyer = "STATUS_DestroyerConstructed_1" --OK
stdCMap.Hgn_IonDestroyer = "STATUS_DestroyerConstructed_1" --OK
stdCMap.Hgn_MissileDestroyer = "STATUS_DestroyerConstructed_1" --OK
stdCMap.Hgn_AdvDestroyer = "STATUS_DestroyerConstructed_1" --OK
stdCMap.Hgn_ArtilleryDestroyer = "STATUS_DestroyerConstructed_1" --OK
stdCMap.hgn_cruisera = "STATUS_CapitalConstructed_1" --OK
stdCMap.hgn_cruiserb = "STATUS_CapitalConstructed_1" --OK
stdCMap.hgn_Juggernaught = "STATUS_CapitalConstructed_1" --OK
stdCMap.Hgn_Carrier = "STATUS_CarrierConstructed_1" --OK
stdCMap.Hgn_BattleCarrier = "STATUS_CarrierConstructed_1" --OK
stdCMap.Hgn_LightCarrier = "STATUS_CarrierConstructed_1" --OK
stdCMap.Hgn_ResearchStation = "STATUS_CapitalConstructed_1" --OK
stdCMap.Hgn_Power = "STATUS_CapitalConstructed_1" --OK
stdCMap.Hgn_CrewStation = "STATUS_CapitalConstructed_1" --OK
stdCMap.Hgn_Scaver = "STATUS_UtilityConstructed_1" --OK
stdCMap.hgn_battlecruiser = "STATUS_CapitalConstructed_1" --OK
stdCMap.hgn_vortex = "STATUS_CapitalConstructed_1" --OK
stdCMap.hgn_tanker = "STATUS_CapitalConstructed_1" --OK
stdCMap.Hgn_Shipyard = "STATUS_ShipyardConstructed_1" --OK
stdCMap.Hgn_BattleShipyard = "STATUS_ShipyardConstructed_1"
stdCMap.Hgn_CommandFortress = "STATUS_SuperCapitalConstructed_1"  --OK
stdCMap.Hgn_Ark = "STATUS_SuperCapitalConstructed_1" --OK
stdCMap.Hgn_HyperspaceStation = "STATUS_CapitalConstructed_1"  --OK
stdCMap.Hgn_GunTurret = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_PulsarTurret = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_IonTurret = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_MissileTurret = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_RTS = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_Sentinel = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_IonSentinel = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_ArtillerySentinel = "STATUS_PlatformConstructed_1" --OK
stdCMap.Hgn_ResourceCollector = "STATUS_ResourceCollectorConstructed_1" --OK
--stdCMap.Hgn_ResourceCollector = "STATUS_UtilityConstructed_1" --OK
stdCMap.Hgn_ResourceController = "STATUS_ResourceControllerConstructed_1" --OK
--stdCMap.Hgn_ResourceController = "STATUS_UtilityConstructed_1" --OK
stdCMap.Hgn_Probe = "STATUS_ProbeConstructed_1" --OK
stdCMap.Hgn_ECMProbe = "STATUS_ProbeConstructed_1" --OK
stdCMap.Hgn_ProximitySensor = "STATUS_ProximitySensorConstructed_1" --OK
stdCMap.hgn_transportcell = "STATUS_UtilityConstructed_1" --OK
stdCMap.hgn_container = "STATUS_UtilityConstructed_1" --OK
stdCMap.hgn_minecontainer = "STATUS_UtilityConstructed_1" --OK
stdCMap.Hgn_Patcher = "STATUS_UtilityConstructed_1" --OK
stdCMap.hgn_hscore = "STATUS_UtilityConstructed_1" --OK
stdCMap.hgn_battleship = "STATUS_CapitalConstructed_1" --OK
stdCMap.Hgn_CombatBase = "STATUS_CapitalConstructed_1"
stdCMap.Hgn_BattleStation = "STATUS_SuperCapitalConstructed_1"

--stdCMap.hgn_nucleartube1 = "STATUS_Missilenuke_1"
--stdCMap.hgn_nucleartube2 = "STATUS_Missilenuke_1"
--stdCMap.hgn_nucleartube3 = "STATUS_Missilenuke_1"
--stdCMap.hgn_torpedotube1 = "STATUS_Missile_1"
--stdCMap.hgn_torpedotube2 = "STATUS_Missile_1"
--stdCMap.hgn_torpedotube3 = "STATUS_Missile_1"

stdCMap.hgn_viper = "STATUS_Missile_1" --OK
stdCMap.hgn_viper_short = "STATUS_Missile_1" --OK
stdCMap.hgn_viper_short1 = "STATUS_Missile_1" --OK
stdCMap.hgn_viper_ws = "STATUS_Missile_1" --OK
stdCMap.hgn_viper_ws1 = "STATUS_Missile_1" --OK
stdCMap.hgn_minermissile = "STATUS_Missile_1" --OK
stdCMap.hgn_minermissile1 = "STATUS_Missile_1" --OK



--stdCMap.Vgr_Scout = "STATUS_VScoutConstructed_1"
--stdCMap.Vgr_Interceptor = "STATUS_VInterceptorConstructed_1"
--stdCMap.Vgr_Crusader = "STATUS_VCrusaderConstructed_1"
--stdCMap.Vgr_LanceFighter = "STATUS_VLanceFighterConstructed_1"
--stdCMap.Vgr_Bomber = "STATUS_VBomberConstructed_1"
--stdCMap.Vgr_LaserCorvette = "STATUS_VLaserCorvetteConstructed_1"
--stdCMap.Vgr_MissileCorvette = "STATUS_VMissileCorvetteConstructed_1"
--stdCMap.Vgr_MinelayerCorvette = "STATUS_VMinelayerCorvetteConstructed_1"
--stdCMap.Vgr_CommandCorvette = "STATUS_VCommandCorvetteConstructed_1"
--stdCMap.Vgr_AssaultFrigate = "STATUS_VAssaultFrigateConstructed_1"
--stdCMap.Vgr_InfiltratorFrigate = "STATUS_VInfiltratorFrigateConstructed_1"
--stdCMap.Vgr_HeavyMissileFrigate = "STATUS_VHvyMissilFrigateConstructed_1"
--stdCMap.Vgr_TransportFrigate = "STATUS_VTransportFrigateConstructed_1"
--stdCMap.Vgr_ShipYard = "STATUS_VShipyardConstructed_1"
--stdCMap.Vgr_Carrier = "STATUS_VCarrierConstructed_1"
--stdCMap.Vgr_Battlecruiser = "STATUS_VBattleCruiserConstructed_1"
--stdCMap.Vgr_Destroyer = "STATUS_VDestroyerConstructed_1"
--stdCMap.Vgr_ResourceCollector = "STATUS_VResourceCollectorConstructed_1"
--stdCMap.Vgr_ResourceController = "STATUS_VResourceControllerConstructed_1"
--stdCMap.Vgr_Probe = "STATUS_VProbeConstructed_1"
--stdCMap.Vgr_Probe_ECM = "STATUS_VEmpProbeConstructed_1"
--stdCMap.Vgr_Probe_Prox = "STATUS_VProxProbeConstructed_1"
--stdCMap.Vgr_HyperSpace_Platform = "STATUS_VHyperspacePlatformConstructed_1"
BUILD_Std = 1
BUILD_Subsystem = 2
function raceHelper()
    if  currentRace==Vaygr then
        return NameMakaan
		elseif currentRace == Raider then
				return NameEmperor
    else
        return NameFleetCommand
    end

end

function getType(shipnm)
    if  shipnm=="Hgn_MotherShip" or shipnm=="Vgr_MotherShip" then
        return Flagship
    end

    shipnmU = strupper(shipnm)
    if  strfind(shipnmU, "PLATFORM") or strfind(shipnmU, "TURRET") then
        return Platform
    end

    if  strfind(shipnmU, "DEBRIS") then
        return MISC
    end

    if  strfind(shipnmU, "KPR_") then
        return MISC
    end

    if  strfind(shipnmU, "1") then
        return MISC
    end

    if  strfind(shipnmU, "Crew") then
        return Crew
    end

    familyName = ""..getFamily(shipnm)
    if  familyName=="CAPITAL" or familyName=="SUPERCAP" or familyName=="SMALLCAPITALSHIP" or familyName=="BIGCAPITALSHIP" then
        return Capital
    end

    if  familyName=="FRIGATE" or familyName=="CAPTURER" then
        return Frigate
    end

    if  familyName=="UTILITY" or familyName=="RESOURCE" or familyName=="RESOURCELARGE" then
        return Resource
    end

    if  familyName=="CORVETTE" then
        return Corvette
    end

    if  familyName=="FIGHTER" then
        return Fighter
    end

    if  familyName=="MEGALITH" then
        return Megalith
    end

    if  familyName=="FLAGSHIP" or familyName=="MOTHERSHIP" then
        return Flagship
    end

    if  familyName=="SUBSYSTEM" or familyName=="SUBSYSTEMMODULE" or strfind(shipnmU, "MODULE") then
        return SubSystem
    end

    if  strfind(shipnmU, "ORDERS") then
        return Orders
    end

    if  strfind(shipnmU, "POWERUP") then
        return Pwerup
    end

		if  strfind(shipnmU, "PLANET") then
        return Planet
    end

		if  strfind(shipnmU, "ENGINE_BOOST_") then
        return engine_boost_
    end

    if  familyName=="PLATFORM" then
        return Platform
    end

    return 0
end

function CommandMoveToSobGiven(shipname, targetname)
    if  strfind(strupper(targetname), "NEBULA") then
        playSpeechActor("COMMAND_OrderedToEnterNebula", NameAllPilot, NumAllPilots, Frequency_Command)
        return
    end

    CommandMoveGiven(shipname, targetname)
end

function isCapital(shipnm)
    if  getType(shipnm)==Capital then
        return 1
    end

    return 0
end

function CommandWayPointMoveGiven(shipname, targetname)
    shiptype = getType(shipname)
    genericShipName = strsub(shipname, 5)
    if  shipname=="Hgn_ProximitySensor" then
        playSpeechActor("Command_Probe_Selected", NameAllPilot, 1, Frequency_Command)
        return
    end

    if  shiptype==Flagship and genericShipName~="Dreadnaught" then
        playSpeechActor("COMMAND_Waypoint_1", raceHelper(), 0, Frequency_Command)
        return
    end

    if  strsub(shipname, 0, 4)=="Kpr_" then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    playSpeechActor("COMMAND_WAYPOINT", NameAllPilot, NumAllPilots, Frequency_Command)
end

function CommandCancelOrder(shipname, prevOrders)
    local MoveOrder = 0
    local AttackOrder = 1
    if  strsub(shipname, 0, 4)=="Kpr_" then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    shiptype = getType(shipname)
    genericShipName = strsub(shipname, 5)
    if  prevOrders==AttackOrder then
        if  shiptype==Flagship and genericShipName~="Dreadnaught" then
            playSpeechActor("COMMAND_Attack_Cancelled_1", raceHelper(), 0, Frequency_Command)
            return
        end

        if  shiptype==Capital then
            playSpeechActor("COMMAND_CAP_ATTACK_CANCELLED", NameCapPilot, NumCapPilots, Frequency_Command)
        else
            playSpeechActor("COMMAND_ATTACK_CANCELLED", NameFighterPilot, NumFighterPilots, Frequency_Command)
        end

    elseif  shiptype==Flagship and genericShipName~="Dreadnaught" then
        playSpeechActor("COMMAND_MoveCancelled_1", raceHelper(), 0, Frequency_Command)
        return
        playSpeechActor("COMMAND_MoveCancelled", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandDefenseFieldChanged(shipname, defenseType)
    if  defenseType==DEF_on then
        playSpeechActor("COMMAND_DEFENSEFIELDON", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  defenseType==DEF_off then
        playSpeechActor("COMMAND_DEFENSEFIELDOFF", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  defenseType==DEF_out then
        playSpeechActor("STATUS_DEFENCEFIELDOUTOFPOWER", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  defenseType==DEF_low then
    end

end

function CommandResourceGiven(shipname, targetname)
    if  targetname=="StaticContainer" then
        playSpeechActor("COMMAND_ResourceSalvage", NameSupportPilot, NumSupportPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_ResourceCollectorHarvest", NameSupportPilot, NumSupportPilots, Frequency_Command)
    end

end

function CommandMultiplay(shipname, event)
    if  event==MP_AllianceRequested then
        playSpeechActor("COMMAND_AllianceRequested_1", raceHelper(), 0, Frequency_Command)
    elseif  event==MP_AllianceFormed then
        playSpeechActor("COMMAND_AllianceFormed_1", raceHelper(), 0, Frequency_Command)
    elseif  event==MP_AllianceBroken then
        playSpeechActor("COMMAND_AllianceBroken_1", raceHelper(), 0, Frequency_Command)
    elseif  event==MP_RUsTransferred then
        playSpeechActor("COMMAND_RUs_Transferred", raceHelper(), 0, Frequency_Command)
    elseif  event==MP_ShipsTransferred then
        playSpeechActor("COMMAND_Ships_Transferred", raceHelper(), 0, Frequency_Command)
    end

end

function CommandCaptureGiven(shipname, targetname)
    if  shipname=="Hgn_MarineFrigate" then
        playSpeechActor("COMMAND_MarineFrigate_Capture", NameMarinePilot, NumMarinePilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_INFILTRATORFRIGATE_CAPTURE", NameInfiltratorPilot, NumInfiltratorPilots, Frequency_Command)
    end

end

function CommandAttackGiven(shipname, targetname, attackType)
    print("******** COMMAND ATTACK: shipname, targetname, attackType = "..shipname..","..targetname..","..attackType)
    if  attackType==3 then
        if  shipname=="Hgn_Dreadnaught" then
            playSpeechActor("COMMAND_Dreadnaught_BigGun", NameCapPilot, NumCapPilots, Frequency_Command)
            return
        elseif  shipname=="Hgn_Scout" then
            playSpeechActor("COMMAND_ScoutEmp", NameSupportPilot, NumSupportPilots, Frequency_Command)
            return
        end

    end

    if  strsub(shipname, 0, 4)=="Kpr_" then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    local targetShipType = getType(targetname)
    local shipType = getType(shipname)
    genericShipName = strsub(shipname, 5)
    print("******2- COMMAND ATTACK: shipType, targetShipType, genericShipName = "..shipType..","..targetShipType..","..genericShipName)
    if  attackType==0 or attackType==3 then
        if  shipType==Flagship and genericShipName~="Dreadnaught" then
            playSpeechActor("COMMAND_Attack", raceHelper(), 0, Frequency_Command)
            return
        end

        if  targetShipType==Capital then
            playSpeechActor("COMMAND_Attack_CapShip", NameCapPilot, NumCapPilots, Frequency_Command)
        elseif  targetShipType==SubSystem and targetname~="VGR_HYPERSPACEINHIBITOR" then
            playSpeechActor("COMMAND_BOMBERSUBSYSTEMATTACK", NameFighterPilot, NumFighterPilots, Frequency_Command)
        elseif  shipType==Capital then
            playSpeechActor("COMMAND_CAPSHIP_TO_ATTACK", NameCapPilot, NumCapPilots, Frequency_Command)
        elseif  shipname=="STRIKE" then
            playSpeechActor("COMMAND_StrikeGroup_Attack", NameAllPilot, NumAllPilots, Frequency_Command)
        else
            playSpeechActor("COMMAND_Attack", NameFighterPilot, NumFighterPilots, Frequency_Command)
        end

    elseif  attackType==1 then
        if  shipType==Flagship and genericShipName~="Dreadnaught" then
            playSpeechActor("COMMAND_ForceAttackFriendly_1", raceHelper(), 0, Frequency_Command)
            return
        end

        playSpeechActor("COMMAND_ForceAttackFriendly", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  attackType==2 then
        if  shipType==Flagship and genericShipName~="Dreadnaught" then
            playSpeechActor("COMMAND_ForceAttack_1", raceHelper(), 0, Frequency_Command)
            return
        end

        playSpeechActor("COMMAND_ForceAttack", NameCapPilot, NumCapPilots, Frequency_Command)
    end

end

function CommandHyperspaceGiven(shipname, code)
    print("** CommandHyperspaceGiven: shipname = "..shipname.." code = "..code)
    genericShipName = strsub(shipname, 5)
    if  code==HYP_Interrupted then
        if  genericShipName=="MotherShip" then
            playSpeechActor("STATUS_HyperspaceInterupted_1", raceHelper(), 0, Frequency_Command)
        else
            playSpeechActor("STATUS_OutofHS", NameCapPilot, NumCapPilots, Frequency_Command)
        end

        return
    end

    if  code==HYP_EnteredInhibitorVolume then
        playSpeechActor("STATUS_HyperSpaceInhib_Detected", NameSupportPilot, NumSupportPilots, Frequency_Command)
        return
    end

    if  code==HYP_NotEnoughCash then
        playSpeechActor("STATUS_HYPERSPACEINSUFFICENT_1", raceHelper(), 0, Frequency_Command)
        return
    end

    if  code==HYP_EnteringGate then
        playSpeechActor("STATUS_HyperspaceGateJump_1", raceHelper(), 0, Frequency_Command)
        return
    end

    shipType = getType(shipname)
    if  shipType==Flagship then
        playSpeechActor("COMMAND_HS", raceHelper(), 0, Frequency_Command)
        return
    end

    if  shipType==Capital then
        playSpeechActor("COMMAND_CAPHS", NameCapPilot, NumCapPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_HS", NameCapPilot, NumCapPilots, Frequency_Command)
    end

end

function CommandCombatMan(shipname, targetname)
    shipType = getType(shipname)
    genericShipName = strsub(shipname, 5)
    if  shipType==Flagship and genericShipName~="Dreadnaught" then
        playSpeechActor("COMMAND_CombatMan_1", raceHelper(), 0, Frequency_Command)
        return
    end

    if  shipType==Capital then
        playSpeechActor("COMMAND_CAP_COMBATMAN", NameCapPilot, NumCapPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_COMBATMAN", NameFighterPilot, NumFighterPilots, Frequency_Command)
    end

end

function CommandMoveAttackGiven(shipname, targetname)
    shiptype = getType(shipname)
    genericShipName = strsub(shipname, 5)
    if  shiptype==Flagship and genericShipName~="Dreadnaught" then
        playSpeechActor("COMMAND_MoveAttack_1", raceHelper(), 0, Frequency_Command)
        return
    end

    if  shiptype==Capital then
        playSpeechActor("COMMAND_CAP_MOVEATTACK", NameCapPilot, NumCapPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_MOVEATTACK", NameFighterPilot, NumFighterPilots, Frequency_Command)
    end

end

function CommandLaunchGiven(shipname, targetname)
    if  shipname=="Hgn_Probe" then
        return
    end

    shipFamily = getFamily(shipname)
    if  shipFamily=="FIGHTER" or shipFamily=="CORVETTE" then
        playSpeechActor("COMMAND_StrikeCraftLaunch", NameSupportPilot, NumSupportPilots, Frequency_Command)
    elseif  shipFamily=="CAPITAL" or shipFamily=="SUPERCAP" then
        playSpeechActorLinked("STATUS_CARRIERORMSHIPCAPITALSHIPLAUNCHED", NameSupportPilot, NumSupportPilots, Frequency_Command, CE_STS_CAPWELCOME)
    end

end

function CommandGuardGiven(shipname, targetname)
    shiptype = getType(shipname)
    genericShipName = strsub(shipname, 5)
    if  shiptype==Flagship and genericShipName~="Dreadnaught" then
        playSpeechActor("COMMAND_Guard_1", raceHelper(), 0, Frequency_Command)
        return
    end

    if  strsub(shipname, 0, 4)=="Kpr_" then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    if  shiptype==Capital then
        playSpeechActor("COMMAND_CAP_GUARD", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  shiptype==Fighter then
        playSpeechActor("COMMAND_Guard", NameFighterPilot, NumFighterPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_Guard", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandMoveGiven(shipnm, targetnm)
    shiptype = getType(shipnm)
    genericShipName = strsub(shipnm, 5)
    if  shiptype==Flagship and genericShipName~="Dreadnaught" then
        playSpeechActor("COMMAND_MOVE_1", raceHelper(), 0, Frequency_Command)
        return
    end

    if  shipname=="Hgn_ProximitySensor" then
        playSpeechActor("Command_Probe_Selected", NameAllPilot, NumAllPilots, Frequency_Command)
        return
    end

    genericShipName = strsub(shipnm, 5)
    if  strfind(strupper(shipnm), "PROBE") then
        playSpeechActor("COMMAND_ProbeLaunched", raceHelper(), 0, Frequency_Command)
        return
    end

    if  strsub(shipnm, 0, 4)=="Kpr_" then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    if  genericShipName=="GunTurret" or genericShipName=="GunPlatform" or genericShipName=="IonTurret" or genericShipName=="WeaponPlatform_gun" or genericShipName=="WeaponPlatform_missile" then
        playSpeechActor("COMMAND_Turret_Fold", NameSupportPilot, NumSupportPilots, Frequency_Command)
    elseif  shipnm=="STRIKE" then
        playSpeechActor("COMMAND_StrikeGroup_Move", NameAllPilot, NumAllPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_Move", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandStrikeGroupFormed(shipnm, code)
    if  shipnm then
        if  strfind(shipnm, "Kpr_") then
            playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
            return
        end

    end

    if  code==1 then
        playSpeechActor("COMMAND_STRIKEGROUP_FORM_RESPONSE", NameAllPilot, NumAllPilots, Frequency_Command)
    elseif  code==2 then
        playSpeechActor("COMMAND_STRIKEGROUP_FORMATIONSET", NameAllPilot, NumAllPilots, Frequency_Command)
    elseif  code==3 then
        playSpeechActor("COMMAND_STRIKEGROUP_DISBAND", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandDockGiven(shipname, targetname)
    shipType = getType(shipname)
    genericShipName = strsub(targetname, 5)
    if  strsub(shipname, 0, 4)=="Kpr_" then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    if  shipType==Fighter or shipType==Corvette then
        playSpeechActor("COMMAND_StrikeCraftDock", NameFighterPilot, NumFighterPilots, Frequency_Command)
        return
    end

    if  genericShipName=="Carrier" then
        playSpeechActorLinked("COMMAND_AnyShipGenericDockCarrier_1", NameAllPilot, NumAllPilots, Frequency_Command, CE_CHT_DOCK)
    elseif  genericShipName=="MotherShip" then
        playSpeechActorLinked("COMMAND_AnyShipGenericDockMothership_1", NameAllPilot, NumAllPilots, Frequency_Command, CE_CHT_DOCK)
    elseif  genericShipName=="Shipyard" then
        playSpeechActorLinked("COMMAND_AnyShipGenericDockShipyard_1", NameAllPilot, NumAllPilots, Frequency_Command, CE_CHT_DOCK)
		elseif  genericShipName=="Shipyard_g" then
        playSpeechActorLinked("COMMAND_AnyShipGenericDockShipyard_1", NameAllPilot, NumAllPilots, Frequency_Command, CE_CHT_DOCK)
    elseif  genericShipName=="SupportFrigate" then
        playSpeechActorLinked("COMMAND_AnyShipGenericDockSupportFrigate_1", NameAllPilot, NumAllPilots, Frequency_Command, CE_CHT_DOCK)
    elseif  genericShipName=="Battlecruiser" then
        playSpeechActorLinked("COMMAND_AnyShipGenericDockBattlecruiser_1", NameAllPilot, NumAllPilots, Frequency_Command, CE_CHT_DOCK)
    elseif  genericShipName=="ResourceController" then
        playSpeechActor("COMMAND_AnyShipGenericDockResourceController_1", NameAllPilot, NumAllPilots, Frequency_Command)
    else
        playSpeechActorLinked("COMMAND_StrikeCraftDock", NameFighterPilot, NumFighterPilots, Frequency_Command, CE_CHT_DOCK)
    end

end

function CommandParadeGiven(shipname, targetname)
    if  shipname=="STRIKE" then
        playSpeech("STATUS_StrikeCraftNowFollowing")
        return
    end

    familyName = getFamily(shipname)
    if  familyName=="FIGHTER" or familyName=="CORVETTE" then
        playSpeechFreq("STATUS_StrikeCraftNowFollowing", 15)
    end

end

function CommandRetireGiven(shipname, targetname)
    local shipType = getType(shipname)
    if  shipType==Capital then
        playSpeechActor("COMMAND_CapitalShipRetire", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  shipType==Frigate then
        playSpeechActor("COMMAND_FrigateRetire", NameCapPilot, NumCapPilots, Frequency_Command)
    elseif  shipType==Fighter then
        playSpeechActor("COMMAND_FighterRetire", NameFighterPilot, NumFighterPilots, Frequency_Command)
    elseif  shipType==Support then
        playSpeechActor("COMMAND_SupportShipRetire", NameSupportPilot, NumSupportPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_FighterRetire", NameFighterPilot, NumFighterPilots, Frequency_Command)
    end

end

function CommandTacticsChanged(shipname, newSetting)
	if strfind(shipname, "meg_drone") then
		return
	end
    if  newSetting==AggressiveTactics then
        playSpeechActor("COMMAND_SetTacticsAggressive", NameAllPilot, NumAllPilots, Frequency_Command)
    elseif  newSetting==DefensiveTactics then
        playSpeechActor("COMMAND_SetTacticsDefensive", NameAllPilot, NumAllPilots, Frequency_Command)
    elseif  newSetting==PassiveTactics then
        playSpeechActor("COMMAND_SetTacticsPassive", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandEngagementRangeChanged(shipname, newSetting)
    if  newSetting==CloseRange then
        playSpeechActor("COMMAND_SetRangeShort", NameAllPilot, NumAllPilots, Frequency_Command)
    elseif  newSetting==MediumRange then
        playSpeechActor("COMMAND_SetRangeMedium", NameAllPilot, NumAllPilots, Frequency_Command)
    elseif  newSetting==LongRange then
        playSpeechActor("COMMAND_SetRangeLong", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandEngagementRangeForceChanged(shipname, force)
    if  force==1 then
        playSpeechActor("COMMAND_SetRangeForce", NameAllPilot, NumAllPilots, Frequency_Command)
    end

end

function CommandHotKeyGroupSelected(shipname, groupNumber, keyAction)
    if  strfind(shipname, "Kpr_") then
        return
    end

    if  keyAction==ACT_Created then
        if  groupNumber==10 then
            playSpeechActor("COMMAND_GROUP_Assigned_10", raceHelper(), 0, Frequency_Command)
        else
            playSpeechActor("COMMAND_GROUP_Assigned_0"..groupNumber, raceHelper(), 0, Frequency_Command)
        end

        return
    end

    if  keyAction==ACT_Reinforced then
        if  groupNumber==10 then
            playSpeechActor("STATUS_HotkeyGroup_Added_20_2", raceHelper(), 0, Frequency_Command)
        else
            playSpeechActor("STATUS_HotkeyGroup_Added_0"..groupNumber.."_2", raceHelper(), 0, Frequency_Command)
        end

        return
    end

    if  groupNumber==10 then
        playSpeechActor("COMMAND_SelectGroup10", NameCapPilot, NumCapPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_SelectGroup0"..groupNumber, NameCapPilot, NumCapPilots, Frequency_Command)
    end

end

function CommandShipsSelected(shipname)
    if  strfind(strupper(shipname), "PROBE") or shipname=="Hgn_ProximitySensor" then
        playSpeechActor("Command_Probe_Selected", NameAllPilot, 1, Frequency_Command)
        return
    end

    if  strfind(shipname, "Kpr_") then
        playSpeechActor("Command_MoverSelected", NameAllPilot, 1, Frequency_Command)
        return
    end

    shiptype = getType(shipname)
    if  shiptype==Flagship and shipname~="Hgn_Dreadnaught" and shipname~="Vgr_Dreadnaught" then
        playSpeechActor("COMMAND_SELECTED_1", raceHelper(), 0, Frequency_Command)
        return
    end

    familyName = getFamily(shipname)
    if  familyName=="FRIGATE" or familyName=="CAPITAL" or familyName=="SUPERCAP" then
        playSpeechActor("COMMAND_CAPITALSELECTED", NameCapPilot, NumCapPilots, Frequency_Command)
    else
        playSpeechActor("COMMAND_Selected", NameFighterPilot, NumFighterPilots, Frequency_Command)
    end

end

function CommandConstructionComplete(buildingShip, builtItem, buildType)
    print("*****---- CommandConstructionComplete : buildingShip="..buildingShip..", builtItem="..builtItem..", buildType="..buildType)
    if  not buildingShip or not builtItem then
        return
    end

    genericbuildingShipName = strsub(buildingShip, 5)
    genericbuiltItemName = strsub(builtItem, 5)
    if  getType(builtItem) == Orders then
    elseif  getType(builtItem) == Powerup then
		elseif  getType(builtItem) == Planet then
		elseif  getType(builtItem) == engine_boost_ then
    elseif  buildType==BUILD_Subsystem then
        if  sscMap[""..genericbuildingShipName] and sscMap[""..genericbuildingShipName][""..genericbuiltItemName] then
            if  strfind(strupper(builtItem), "INHIBITOR") then
                if  genericbuildingShipName=="Carrier" then
                    playSpeechActorLinked("STATUS_HyperspaceInhibConstructedFromCarrier_1", NameCapPilot, NumCapPilots, Frequency_Command, CE_STS_INHIBITORONLINE)
                elseif  genericbuildingShipName=="Shipyard" then
                    playSpeechActorLinked("STATUS_HyperspaceInhibConstructedFromShipyard_1", NameSupportPilot, NumSupportPilots, Frequency_Command, CE_STS_INHIBITORONLINE)
								elseif  genericbuildingShipName=="Shipyard_g" then
                    playSpeechActorLinked("STATUS_HyperspaceInhibConstructedFromShipyard_1", NameSupportPilot, NumSupportPilots, Frequency_Command, CE_STS_INHIBITORONLINE)
                elseif  genericbuildingShipName=="Battlecruiser" then
                    playSpeechActorLinked("STATUS_HyperspaceInhibConstructedFromBattle_1", NameCapPilot, NumCapPilots, Frequency_Command, CE_STS_INHIBITORONLINE)
                else
                    playSpeechActor("STATUS_HYPERSPACEINHIB_ON", NameSupportPilot, NumSupportPilots, Frequency_Command)
                end

            end

            if strfind(strupper(builtItem), "POWER_MS") then
              playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], raceHelper(), 0, Frequency_Command)
            else
	            if  genericbuildingShipName=="Shipyard" then
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], NameSupportPilot, NumSupportPilots, Frequency_Command)
							elseif  genericbuildingShipName=="Shipyard_g" then
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], NameSupportPilot, NumSupportPilots, Frequency_Command)
	            elseif  genericbuildingShipName=="MotherShip" then
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], raceHelper(), 0, Frequency_Command)
	            elseif  genericbuildingShipName=="crewstation" then
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], raceHelper(), 0, Frequency_Command)
	            elseif  genericbuildingShipName=="Researchstation" then
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], raceHelper(), 0, Frequency_Command)
	            elseif  genericbuildingShipName=="Power" then
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], raceHelper(), 0, Frequency_Command)
	            else
	                playSpeechActor(sscMap[""..genericbuildingShipName][""..genericbuiltItemName], NameCapPilot, NumCapPilots, Frequency_Command)
	            end
	          end

        else
            playSpeechActor("COMMAND_SubsystemConstructed", NameCapPilot, NumCapPilots, Frequency_Command)
        end

    elseif  buildType==BUILD_Std then
        if  stdCMap[""..builtItem] then
            playSpeechActor(stdCMap[""..builtItem], raceHelper(), 0, Frequency_Command)
        end

    end

end

function CommandConstructionStarted(buildingShip, builtItem)
    builtItemFamily = getFamily(builtItem)
    if  builtItemFamily=="FRIGATE" or builtItemFamily=="CAPITAL" or builtItemFamily=="SUPERCAP" then
        playSpeechActor("COMMAND_CarrierOrMShipBuildCapitalShip", NameSupportPilot, NumSupportPilots, Frequency_Command)
        return
    end

    genericbuildingShipName = strsub(buildingShip, 5)
    if  genericbuildingShipName=="MotherShip" then
        playSpeechActor("STATUS_ConstructionBegun_1", raceHelper(), 0, Frequency_Command)
    end

end

function CommandPaused(temp)
    playSpeechActor("COMMAND_Build_Paused", raceHelper(), 0, Frequency_Command)
end
