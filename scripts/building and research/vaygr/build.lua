--Type => SubSystem
--ThingToBuild => name of subsystem to build
--RequiredResearch => global research dependencies
--RequiredShipSubSystems => subsystems dependencies for local to the ship
--RequiredFleetSubSystems => Fleet wide subsystem dependencies
--DisplayPriority => Order in UI lists
--DisplayedName => Localized name for UI
--Description => Description for UI

Ship = 0
SubSystem = 1

build = 
{
	
---Tactical Reinforcements------------------
--fighters
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_fighter_1", 
        RequiredResearch = "FighterReinforcements1", 
        RequiredShipSubSystems = "FighterProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1001, 
        DisplayedName = "<c=00ff41>Fighter Task Force (x1)</c>", 
        Description = "<b>Description:</b> Call in Basic Fighter Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 1000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Call-in Level 1 \nFighter Facility \nHyperspace Module (on board) \n<c=ffd800>10 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_fighter_2", 
        RequiredResearch = "FighterReinforcements2", 
        RequiredShipSubSystems = "FighterProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1002, 
        DisplayedName = "<c=00ff41>Fighter Task Force (x2)</c>", 
        Description = "<b>Description:</b> Call in Basic Fighter Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 2000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Call-in Level 2 \nFighter Facility \nHyperspace Module (on board) \n<c=ffd800>20 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_fighter_3", 
        RequiredResearch = "FighterReinforcements3", 
        RequiredShipSubSystems = "FighterProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1003, 
        DisplayedName = "<c=00ff41>Fighter Task Force (x3)</c>", 
        Description = "<b>Description:</b> Call in Basic Fighter Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 3000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Call-in Level 3 \nFighter Facility \nHyperspace Module (on board) \n<c=ffd800>30 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_fighter_1e", 
        RequiredResearch = "FighterReinforcementsE", 
        RequiredShipSubSystems = "FighterProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1011, 
        DisplayedName = "<c=00f4ff>Fighter Special Force (x1)</c>", 
        Description = "<b>Description:</b> Call in Advanced Fighter Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 2000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nFighter Call-in PRO \nFighter Facility \nHyperspace Module (on board) \n<c=ffd800>20 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_fighter_2e", 
        RequiredResearch = "FighterReinforcementsE", 
        RequiredShipSubSystems = "FighterProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1012, 
        DisplayedName = "<c=00f4ff>Fighter Special Force (x2)</c>", 
        Description = "<b>Description:</b> Call in Advanced Fighter Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 4000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nFighter Call-in PRO \nFighter Facility \nHyperspace Module (on board) \n<c=ffd800>40 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_fighter_3e", 
        RequiredResearch = "FighterReinforcementsE", 
        RequiredShipSubSystems = "FighterProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1013, 
        DisplayedName = "<c=00f4ff>Fighter Special Force (x3)</c>", 
        Description = "<b>Description:</b> Call in Advanced Fighter Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nFighter Call-in PRO \nFighter Facility \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
--corvettes
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_corvette_1", 
        RequiredResearch = "CorvetteReinforcements1", 
        RequiredShipSubSystems = "CorvetteProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1001, 
        DisplayedName = "<c=00ff41>Corvette Task Force (x1)</c>", 
        Description = "<b>Description:</b> Call in Basic Corvette Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 2000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Call-in Level 1 \nCorvette Facility \nHyperspace Module (on board) \n<c=ffd800>20 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_corvette_2", 
        RequiredResearch = "CorvetteReinforcements2", 
        RequiredShipSubSystems = "CorvetteProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1002, 
        DisplayedName = "<c=00ff41>Corvette Task Force (x2)</c>", 
        Description = "<b>Description:</b> Call in Basic Corvette Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 4000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Call-in Level 2 \nCorvette Facility \nHyperspace Module (on board) \n<c=ffd800>40 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_corvette_3", 
        RequiredResearch = "CorvetteReinforcements3", 
        RequiredShipSubSystems = "CorvetteProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1003, 
        DisplayedName = "<c=00ff41>Corvette Task Force (x3)</c>", 
        Description = "<b>Description:</b> Call in Basic Corvette Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Call-in Level 3 \nCorvette Facility \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_corvette_1e", 
        RequiredResearch = "CorvetteReinforcementsE", 
        RequiredShipSubSystems = "CorvetteProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1011, 
        DisplayedName = "<c=00f4ff>Corvette Special Force (x1)</c>", 
        Description = "<b>Description:</b> Call in Advanced Corvette Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 4000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nCorvette Call-in PRO \nCorvette Facility \nHyperspace Module (on board) \n<c=ffd800>40 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_corvette_2e", 
        RequiredResearch = "CorvetteReinforcementsE", 
        RequiredShipSubSystems = "CorvetteProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1012, 
        DisplayedName = "<c=00f4ff>Corvette Special Force (x2)</c>", 
        Description = "<b>Description:</b> Call in Advanced Corvette Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 8000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nCorvette Call-in PRO \nCorvette Facility \nHyperspace Module (on board) \n<c=ffd800>80 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_corvette_3e", 
        RequiredResearch = "CorvetteReinforcementsE", 
        RequiredShipSubSystems = "CorvetteProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1013, 
        DisplayedName = "<c=00f4ff>Corvette Special Force (x3)</c>", 
        Description = "<b>Description:</b> Call in Advanced Corvette Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 12000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nCorvette Call-in PRO \nCorvette Facility \nHyperspace Module (on board) \n<c=ffd800>120 Honour Points</c>", },
--frigates
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_frigate_1", 
        RequiredResearch = "FrigateReinforcements1", 
        RequiredShipSubSystems = "FrigateProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1001, 
        DisplayedName = "<c=00ff41>Frigate Battle Group (x1)</c>", 
        Description = "<b>Description:</b> Call in Basic Frigate Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 3000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Call-in Level 1 \nFrigate Facility \nHyperspace Module (on board) \n<c=ffd800>30 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_frigate_2", 
        RequiredResearch = "FrigateReinforcements2", 
        RequiredShipSubSystems = "FrigateProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1002, 
        DisplayedName = "<c=00ff41>Frigate Battle Group (x2)</c>", 
        Description = "<b>Description:</b> Call in Basic Frigate Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Call-in Level 2 \nFrigate Facility \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_frigate_3", 
        RequiredResearch = "FrigateReinforcements3", 
        RequiredShipSubSystems = "FrigateProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1003, 
        DisplayedName = "<c=00ff41>Frigate Battle Group (x3)</c>", 
        Description = "<b>Description:</b> Call in Basic Frigate Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 9000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Call-in Level 3 \nFrigate Facility \nHyperspace Module (on board) \n<c=ffd800>90 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_frigate_1e", 
        RequiredResearch = "FrigateReinforcementsE", 
        RequiredShipSubSystems = "FrigateProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1011, 
        DisplayedName = "<c=00f4ff>Frigate Army Group (x1)</c>", 
        Description = "<b>Description:</b> Call in Advanced Frigate Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nFrigate Call-in PRO \nFrigate Facility \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_frigate_2e", 
        RequiredResearch = "FrigateReinforcementsE", 
        RequiredShipSubSystems = "FrigateProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1012, 
        DisplayedName = "<c=00f4ff>Frigate Army Group (x2)</c>", 
        Description = "<b>Description:</b> Call in Advanced Frigate Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 12000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nFrigate Call-in PRO \nFrigate Facility \nHyperspace Module (on board) \n<c=ffd800>120 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_frigate_3e", 
        RequiredResearch = "FrigateReinforcementsE", 
        RequiredShipSubSystems = "FrigateProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1013, 
        DisplayedName = "<c=00f4ff>Frigate Army Group (x3)</c>", 
        Description = "<b>Description:</b> Call in Advanced Frigate Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 18000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nFrigate Call-in PRO \nFrigate Facility \nHyperspace Module (on board) \n<c=ffd800>180 Honour Points</c>", },
--capital
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_capital_1", 
        RequiredResearch = "CapitalReinforcements1", 
        RequiredShipSubSystems = "CapShipProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1001, 
        DisplayedName = "<c=00ff41>Capital Battle Group (x1)</c>", 
        Description = "<b>Description:</b> Call in Basic Capital Ship Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 5000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCapital Call-in Level 1 \nCapital Facility \nHyperspace Module (on board) \n<c=ffd800>50 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_capital_2", 
        RequiredResearch = "CapitalReinforcements2", 
        RequiredShipSubSystems = "CapShipProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1002, 
        DisplayedName = "<c=00ff41>Capital Battle Group (x2)</c>", 
        Description = "<b>Description:</b> Call in Basic Capital Ship Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 10000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCapital Call-in Level 2 \nCapital Facility \nHyperspace Module (on board) \n<c=ffd800>100 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_capital_3", 
        RequiredResearch = "CapitalReinforcements3", 
        RequiredShipSubSystems = "CapShipProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1003, 
        DisplayedName = "<c=00ff41>Capital Battle Group (x3)</c>", 
        Description = "<b>Description:</b> Call in Basic Capital Ship Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 15000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCapital Call-in Level 3 \nCapital Facility \nHyperspace Module (on board) \n<c=ffd800>150 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_capital_1e", 
        RequiredResearch = "CapitalReinforcementsE", 
        RequiredShipSubSystems = "CapShipProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1011, 
        DisplayedName = "<c=00f4ff>Capital Army Group (x1)</c>", 
        Description = "<b>Description:</b> Call in Advanced Capital Ship Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 10000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nCapital Call-in PRO \nCapital Facility \nHyperspace Module (on board) \n<c=ffd800>100 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_capital_2e", 
        RequiredResearch = "CapitalReinforcementsE", 
        RequiredShipSubSystems = "CapShipProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1012, 
        DisplayedName = "<c=00f4ff>Capital Army Group (x2)</c>", 
        Description = "<b>Description:</b> Call in Advanced Capital Ship Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 20000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nCapital Call-in PRO \nCapital Facility \nHyperspace Module (on board) \n<c=ffd800>200 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_capital_3e", 
        RequiredResearch = "CapitalReinforcementsE", 
        RequiredShipSubSystems = "CapShipProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1013, 
        DisplayedName = "<c=00f4ff>Capital Army Group (x3)</c>", 
        Description = "<b>Description:</b> Call in Advanced Capital Ship Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 30000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nCapital Call-in PRO \nCapital Facility \nHyperspace Module (on board) \n<c=ffd800>300 Honour Points</c>", },
--platforms
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_platform_1", 
        RequiredResearch = "PlatformReinforcements1", 
        RequiredShipSubSystems = "PlatformProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1001, 
        DisplayedName = "<c=00ff41>Platform Defense Line (x1)</c>", 
        Description = "<b>Description:</b> Call in Basic Platform Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 3000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nPlatform Call-in Level 1 \nPlatform Control Module \nHyperspace Module (on board) \n<c=ffd800>30 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_platform_2", 
        RequiredResearch = "PlatformReinforcements2", 
        RequiredShipSubSystems = "PlatformProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1002, 
        DisplayedName = "<c=00ff41>Platform Defense Line (x2)</c>", 
        Description = "<b>Description:</b> Call in Basic Platform Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nPlatform Call-in Level 2 \nPlatform Control Module \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_platform_3", 
        RequiredResearch = "PlatformReinforcements3", 
        RequiredShipSubSystems = "PlatformProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1003, 
        DisplayedName = "<c=00ff41>Platform Defense Line (x3)</c>", 
        Description = "<b>Description:</b> Call in Basic Platform Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 9000 RUs \nBuild time: 100 s \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nPlatform Call-in Level 3 \nPlatform Control Module \nHyperspace Module (on board) \n<c=ffd800>90 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_platform_1e", 
        RequiredResearch = "PlatformReinforcementsE", 
        RequiredShipSubSystems = "PlatformProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1011, 
        DisplayedName = "<c=00f4ff>Platform Fortification Line (x1)</c>", 
        Description = "<b>Description:</b> Call in Advanced Platform Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nPlatform Call-in PRO \nPlatform Control Module \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_platform_2e", 
        RequiredResearch = "PlatformReinforcementsE", 
        RequiredShipSubSystems = "PlatformProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1012, 
        DisplayedName = "<c=00f4ff>Platform Fortification Line (x2)</c>", 
        Description = "<b>Description:</b> Call in Advanced Platform Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 12000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nPlatform Call-in PRO \nPlatform Control Module \nHyperspace Module (on board) \n<c=ffd800>120 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_platform_3e", 
        RequiredResearch = "PlatformReinforcementsE", 
        RequiredShipSubSystems = "PlatformProduction & (Hyperspace | LaserCannon4)",
        DisplayPriority = 1013, 
        DisplayedName = "<c=00f4ff>Platform Fortification Line (x3)</c>", 
        Description = "<b>Description:</b> Call in Advanced Platform Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 18000 RUs \nBuild time: 100 s \nStrong vs: All Ships \n\n<b>Prerequisites:</b> \nPlatform Call-in PRO \nPlatform Control Module \nHyperspace Module (on board) \n<c=ffd800>180 Honour Points</c>", },
--utilities
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_utility_1", 
        RequiredResearch = "UtilityReinforcements1", 
        RequiredShipSubSystems = "Hyperspace | LaserCannon4",
        DisplayPriority = 1001, 
        DisplayedName = "<c=00ff41>Utility Supply Line (x1)</c>", 
        Description = "<b>Description:</b> Call in Basic Utility Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 2000 RUs \nBuild time: 100 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nUtility Call-in Level 1 \nHyperspace Module (on board) \n<c=ffd800>20 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_utility_2", 
        RequiredResearch = "UtilityReinforcements2", 
        RequiredShipSubSystems = "Hyperspace | LaserCannon4",
        DisplayPriority = 1002, 
        DisplayedName = "<c=00ff41>Utility Supply Line (x2)</c>", 
        Description = "<b>Description:</b> Call in Basic Utility Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 4000 RUs \nBuild time: 100 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nUtility Call-in Level 2 \nHyperspace Module (on board) \n<c=ffd800>40 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_utility_3", 
        RequiredResearch = "UtilityReinforcements3", 
        RequiredShipSubSystems = "Hyperspace | LaserCannon4",
        DisplayPriority = 1003, 
        DisplayedName = "<c=00ff41>Utility Supply Line (x3)</c>", 
        Description = "<b>Description:</b> Call in Basic Utility Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 6000 RUs \nBuild time: 100 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nUtility Call-in Level 3 \nHyperspace Module (on board) \n<c=ffd800>60 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_utility_1e", 
        RequiredResearch = "UtilityReinforcementsE", 
        RequiredShipSubSystems = "Hyperspace | LaserCannon4",
        DisplayPriority = 1011, 
        DisplayedName = "<c=00f4ff>Utility Supply Chain (x1)</c>", 
        Description = "<b>Description:</b> Call in Advanced Utility Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 4000 RUs \nBuild time: 100 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nUtility Call-in PRO \nHyperspace Module (on board) \n<c=ffd800>40 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_utility_2e", 
        RequiredResearch = "UtilityReinforcementsE", 
        RequiredShipSubSystems = "Hyperspace | LaserCannon4",
        DisplayPriority = 1012, 
        DisplayedName = "<c=00f4ff>Utility Supply Chain (x2)</c>", 
        Description = "<b>Description:</b> Call in Advanced Utility Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 8000 RUs \nBuild time: 100 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nUtility Call-in PRO \nHyperspace Module (on board) \n<c=ffd800>80 Honour Points</c>", },
    { 
        Type = SubSystem, 
        ThingToBuild = "tactical_utility_3e", 
        RequiredResearch = "UtilityReinforcementsE", 
        RequiredShipSubSystems = "Hyperspace | LaserCannon4",
        DisplayPriority = 1013, 
        DisplayedName = "<c=00f4ff>Utility Supply Chain (x3)</c>", 
        Description = "<b>Description:</b> Call in Advanced Utility Support using Honour Points\n\n<b>Type:</b> Reinforcements \nCost: 12000 RUs \nBuild time: 100 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nUtility Call-in PRO \nHyperspace Module (on board) \n<c=ffd800>120 Honour Points</c>", },

--special subystems
    { 
        Type = SubSystem, 
        ThingToBuild = "engine_boost_container", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 20, 
        DisplayedName = "Engine Boost", 
        Description = "<b>Description:</b> Engine final Boost, improves engine power (+300%), to work properly needs additional energy (-3)\n\n<b>Type:</b> Order", },	 
    { 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_ms", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 26, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },	
    { 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_ms1", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 28, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_sy", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 27, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            		
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_sy1", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 28, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            		
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_sy2", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 29, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            		
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_sy3", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 30, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            		
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_sy4", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 31, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            		
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_power_sy5", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "", 
        DisplayPriority = 32, 
        DisplayedName = "Power Generator", 
        Description = "<b>Description:</b> On-board Power Generator, provides basic energy production (+3) \n\n<b>Type:</b> Special (takes 1 special slot) \nProduction: 3 \nSupply: None \nCost: 1000 RUs \nBuild time: 25 s \nMaintenance cost: 100 RUs/year \nWeight: 0.5 t \n\n<b>Prerequisites:</b> \nNone", },			            		


---SUPPLY-----------
  {
        Type = SubSystem,
        ThingToBuild = "SupplyAlt1",
        RequiredResearch = "",
        RequiredShipSubSystems = "Fusion",
        RequiredFleetSubSystems = "",
        DisplayPriority = 24,
        DisplayedName = "Manpower Division",
         Description = "<b>Description:</b> Hire cheap labor power to earn extra RUs by the means of raw product processing \n\n<b>Type:</b> Special (takes 1 special slot) \nFusion: + extra 10 RUs \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 40 RUs/year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nFusion Control Module (on board)",}, 
    {
        Type = SubSystem,
        ThingToBuild = "SupplyAlt2",
        RequiredResearch = "",
        RequiredShipSubSystems = "Fusion",
        RequiredFleetSubSystems = "",
        DisplayPriority = 25,
        DisplayedName = "Manpower Division",
        Description = "<b>Description:</b> Hire cheap labor power to earn extra RUs by the means of raw product processing \n\n<b>Type:</b> Special (takes 1 special slot) \nFusion: + extra 10 RUs \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 40 RUs/year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nFusion Control Module (on board)",}, 
    {
        Type = SubSystem,
        ThingToBuild = "SupplyAlt3",
        RequiredResearch = "",
        RequiredShipSubSystems = "Fusion",
        RequiredFleetSubSystems = "",
        DisplayPriority = 26,
        DisplayedName = "Manpower Division",
        Description = "<b>Description:</b> Hire cheap labor power to earn extra RUs by the means of raw product processing \n\n<b>Type:</b> Special (takes 1 special slot) \nFusion: + extra 10 RUs \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 40 RUs/year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nFusion Control Module (on board)",}, 
    {
        Type = SubSystem,
        ThingToBuild = "SupplyAlt4",
        RequiredResearch = "",
        RequiredShipSubSystems = "Fusion",
        RequiredFleetSubSystems = "",
        DisplayPriority = 27,
        DisplayedName = "Manpower Division",
        Description = "<b>Description:</b> Hire cheap labor power to earn extra RUs by the means of raw product processing \n\n<b>Type:</b> Special (takes 1 special slot) \nFusion: + extra 10 RUs \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 40 RUs/year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nFusion Control Module (on board)",}, 
    {
        Type = SubSystem,
        ThingToBuild = "SupplyAlt5",
        RequiredResearch = "",
        RequiredShipSubSystems = "Fusion",
        RequiredFleetSubSystems = "",
        DisplayPriority = 28,
        DisplayedName = "Manpower Division",
        Description = "<b>Description:</b> Hire cheap labor power to earn extra RUs by the means of raw product processing \n\n<b>Type:</b> Special (takes 1 special slot) \nFusion: + extra 10 RUs \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 40 RUs/year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nFusion Control Module (on board)",}, 
    {
        Type = SubSystem,
        ThingToBuild = "Harvest",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 22,
        DisplayedName = "Harvest Control Module",
        Description = "<b>Description:</b> Improves harvesting operations within a limited radius around the carrier ship, unlocks harvest abilities and upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 15% Harvest, own collectors within radius \n+ 15% Load, own collectors within radius \n+ 15% Drop Off, own collectors within radius \nRadius: 3000 m \nCost: 700 RUs \nBuild time: 35 s \nMaintenance cost: 50 RUs/year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",},  
    {
        Type = SubSystem,
        ThingToBuild = "Fusion",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 23,
        DisplayedName = "Fusion Control Module",
        Description = "<b>Description:</b> Fusion controller. Enables RU generation from fusion allowing the Prospector to autonomously generate RUs (RUs generated this way are provided to the fleet at the end of each game year). Unlocks fusion abilities and upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \nFusion: 30 RUs every 10 s \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 50 RUs/year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",},
		{
        Type = SubSystem,
        ThingToBuild = "Hgn_S_Module_Defensefieldshield",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 41,
        DisplayedName = "Anti-Radiation Field",
        Description = "<b>Description:</b> Enables Anti-Radiation Field, protects carrier ship and nearby allied ships from the damaging effects of high-energy particles in nebulae, unlocks anti-radiation upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n-90% Nebula sensivity, own ships within radius \n-90% Dust Cloud sensivity, own ships within radius \nRadius: 1850 m \nCost: 2600 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs/year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},  

	-------------------------------------------------------------------------------
	   { 
        Type = SubSystem, 
        ThingToBuild = "vgr_cr_m", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 1, 
        DisplayedName = "Mortar Missile Battery", 
        Description = "<b>Description:</b> Mortar Missile Battery, Long-Range Anti-Capital Ships weapon, composed of: \n5 Anti-Capital Ships Mortar Missile \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 x 5 \nRate: 22 s \nRange: 12500 m \nCost: 2500 RUs \nBuild time: 300 s \nMaintenance cost: 50 RUs / year \nWeight: 10 t \n\n<b>Prerequisites:</b> \nResearch Division" },
    { 
        Type = SubSystem, 
        ThingToBuild = "vgr_cr_l", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 2, 
        DisplayedName = "Frontal Ion System", 
        Description = "<b>Description:</b> Frontal Ion System, Long-Range Anti-Capital Ships weapon, composed of: \n1 Anti-Capital Ships Ion Cannon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 14000 \nRate: 14 s \nRange: 9000 m \nCost: 2500 RUs \nBuild time: 300 s \nMaintenance cost: 50 RUs / year \nWeight: 10 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 
    { 
        Type = SubSystem, 
        ThingToBuild = "vgr_cr_p", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 3, 
        DisplayedName = "Laser Pulser Turret", 
        Description = "<b>Description:</b> Laser Pulser Turret, Long-Range Anti-Frigate/Capital Ships weapon, composed of: \n1 Anti-Capital Ships Laser Pulser \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 3000 x 2 \nRate: 9 s \nRange: 9000 m \nCost: 2500 RUs \nBuild time: 300 s \nMaintenance cost: 50 RUs / year \nWeight: 10 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ms_plasma", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "FireControlTower", 
				RequiredFleetSubSystems =	"Research & IsAdmiral",
        DisplayPriority = 174, 
        DisplayedName = "Nuke Cannon", 
        Description = "<b>Description:</b> Nuke Cannon, Long-Range Anti-Capital Ship weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 35000 \nRate: 24 s \nRange: 50000 m \nCost: 10000 RUs \nBuild time: 100 s \n\n<b>Prerequisites:</b> \nResearch Division \nFire Control Tower (on board) \nAdmiral Rank (350 Honor points)" },		
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiser_plasma", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "FireControlTower", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 176, 
        DisplayedName = "Portable Nuke Cannon", 
        Description = "<b>Description:</b> Portable Nuke Cannon, Single-Shot Long-Range Nuclear weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 35000 \nRate: 24 s \nRange: 20000 m \nCost: 10000 RUs \nBuild time: 100 s \n\n<b>Prerequisites:</b> \nResearch Division \nFire Control Tower (on board)" },		
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 179, 
        DisplayedName = "Kinetic Cannon", 
        Description = "<b>Description:</b> Anti-Capital kinetic weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1100 \nRate: 1.8 s \nRange: 6300 m \nCost: 1200 RUs \nBuild time: 35 s \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 181, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 182, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmall", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 184, 
        DisplayedName = "Cluster Missile Battery", 
        Description = "<b>Description:</b> Advanced Siege weapon, capable to launch massive volley attack \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 5000 \nRate: 30 s \nRange: 26300 m \nCost: 9000 RUs \nBuild time: 105 s \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmall1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 186, 
        DisplayedName = "Cluster Missile Battery", 
        Description = "<b>Description:</b> Advanced Siege weapon, capable to launch massive volley attack \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 5000 \nRate: 30 s \nRange: 26300 m \nCost: 9000 RUs \nBuild time: 105 s \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret_tank1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 187, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret_tank2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 187, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret_tank3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 187, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret_tank4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 187, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret_tank5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 187, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_railgun_turret_tank6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 187, 
        DisplayedName = "Rapid Laser Cannon", 
        Description = "<b>Description:</b> Super-Fast energy weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 100 \nRate: 0.2 s \nRange: 6400 m \nCost: 1600 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_mlrs5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_mlrs6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_mlrs_tank1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_mlrs_tank2",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_mlrs_tank3",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_mlrs_tank4",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_mlrs_tank5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_mlrs_tank6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		271,
		DisplayedName =			"MLRS",
		Description = "<b>Description:</b> Heavy Missile Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 2200 x 8 \nRate 0.2 s \nRange 6300 m \nCost: 1800 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ft2_turret_tank1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 281, 
        DisplayedName = "Main Battle Cannon", 
        Description = "<b>Description:</b> Long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1200 x 2 \nRate: 2 s \nRange: 12600 m \nCost: 2000 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ft2_turret_tank2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 281, 
        DisplayedName = "Main Battle Cannon", 
        Description = "<b>Description:</b> Long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1200 x 2 \nRate: 2 s \nRange: 12600 m \nCost: 2000 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ft2_turret_tank3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 281, 
        DisplayedName = "Main Battle Cannon", 
        Description = "<b>Description:</b> Long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1200 x 2 \nRate: 2 s \nRange: 12600 m \nCost: 2000 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ft2_turret_tank4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 281, 
        DisplayedName = "Main Battle Cannon", 
        Description = "<b>Description:</b> Long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1200 x 2 \nRate: 2 s \nRange: 12600 m \nCost: 2000 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ft2_turret_tank5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 281, 
        DisplayedName = "Main Battle Cannon", 
        Description = "<b>Description:</b> Long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1200 x 2 \nRate: 2 s \nRange: 12600 m \nCost: 2000 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ft2_turret_tank6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 281, 
        DisplayedName = "Main Battle Cannon", 
        Description = "<b>Description:</b> Long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 1200 x 2 \nRate: 2 s \nRange: 12600 m \nCost: 2000 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_destroyer_ion5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_destroyer_ion6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ion_tank1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ion_tank2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ion_tank3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ion_tank4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ion_tank5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_ion_tank6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 311, 
        DisplayedName = "Heavy Ion Cannon", 
        Description = "<b>Description:</b> Anti-capital ion beam weapon \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 15000 x 2 \nRate: 15 s \nRange: 8300 m \nCost: 2500 RUs \nBuild time: 75 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },

	  { 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_c1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"",
        DisplayPriority = 14, 
        DisplayedName = "Concussion Missile Battery (Top Left)", 
        Description = "<b>Description:</b> Concussion Missile Battery, Anti-Fighter/Corvette weapon, composed of: \n3 Anti-Fighter/Corvette Concussion Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 3 \nRate: 12 s \nRange: 4500 m \nCost: 2000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone" },
	  { 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_c2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"",
        DisplayPriority = 15, 
        DisplayedName = "Concussion Missile Battery (Top Right)", 
        Description = "<b>Description:</b> Concussion Missile Battery, Anti-Fighter/Corvette weapon, composed of: \n3 Anti-Fighter/Corvette Concussion Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 3 \nRate: 12 s \nRange: 4500 m \nCost: 2000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone" },
	  { 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_c3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"",
        DisplayPriority = 16, 
        DisplayedName = "Concussion Missile Battery (Bottom Left)", 
        Description = "<b>Description:</b> Concussion Missile Battery, Anti-Fighter/Corvette weapon, composed of: \n3 Anti-Fighter/Corvette Concussion Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 3 \nRate: 12 s \nRange: 4500 m \nCost: 2000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone" },
	  { 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_c4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"",
        DisplayPriority = 17, 
        DisplayedName = "Concussion Missile Battery (Bottom Right)", 
        Description = "<b>Description:</b> Concussion Missile Battery, Anti-Fighter/Corvette weapon, composed of: \n3 Anti-Fighter/Corvette Concussion Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 3 \nRate: 12 s \nRange: 4500 m \nCost: 2000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_m1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 25, 
        DisplayedName = "Mortar Missile Battery (Top Left)", 
        Description = "<b>Description:</b> Mortar Missile Battery, Long-Range Anti-Capital Ships weapon, composed of: \n3 Anti-Capital Ships Mortar Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 x 3 \nRate: 11 s \nRange: 12500 m \nCost: 6000 RUs \nBuild time: 130 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_m2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 26, 
        DisplayedName = "Mortar Missile Battery (Top Right)", 
        Description = "<b>Description:</b> Mortar Missile Battery, Long-Range Anti-Capital Ships weapon, composed of: \n3 Anti-Capital Ships Mortar Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 x 3 \nRate: 11 s \nRange: 12500 m \nCost: 6000 RUs \nBuild time: 130 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_m3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 27, 
        DisplayedName = "Mortar Missile Battery (Bottom Left)", 
        Description = "<b>Description:</b> Mortar Missile Battery, Long-Range Anti-Capital Ships weapon, composed of: \n3 Anti-Capital Ships Mortar Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 x 3 \nRate: 11 s \nRange: 12500 m \nCost: 6000 RUs \nBuild time: 130 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_m4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 28, 
        DisplayedName = "Mortar Missile Battery (Bottom Right)", 
        Description = "<b>Description:</b> Mortar Missile Battery, Long-Range Anti-Capital Ships weapon, composed of: \n3 Anti-Capital Ships Mortar Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 x 3 \nRate: 11 s \nRange: 12500 m \nCost: 6000 RUs \nBuild time: 130 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
	  { 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_c", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"",
        DisplayPriority = 4, 
        DisplayedName = "Concussion Missile Battery", 
        Description = "<b>Description:</b> Concussion Missile Battery, Anti-Fighter/Corvette weapon, composed of: \n3 Anti-Fighter/Corvette Concussion Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 3 \nRate: 12 s \nRange: 4500 m \nCost: 1000 RUs \nBuild time: 10 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_m", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 5, 
        DisplayedName = "Mortar Missile Battery", 
        Description = "<b>Description:</b> Mortar Missile Battery, Long-Range Anti-Capital Ships weapon, composed of: \n3 Anti-Capital Ships Mortar Missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 x 3 \nRate: 11 s \nRange: 12500 m \nCost: 1000 RUs \nBuild time: 10 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_d", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 6, 
        DisplayedName = "Drone Battery", 
        Description = "<b>Description:</b> Drone Battery, produces Mine Drones \n\n<b>Type:</b> Weapon (takes 1 special slots) \nCost: 1000 RUs \nBuild time: 10 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_HeavyFusionMissileLauncherMBC", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"",
        DisplayPriority = 7, 
        DisplayedName = "Standard Controller", 
        Description = "<b>Description:</b> Arms the Heavy Missile Battery with standard missiles \n\n<b>Type:</b> Weapon (takes 1 special slots) \nCost: 1500 RUs \nBuild time: 15 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone" },
		
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_f", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 8, 
        DisplayedName = "Propulsion Controller", 
        Description = "<b>Description:</b> Arms the Heavy Missile Battery with the Propulsion Controller, improves missiles' speed together with range \n\n<b>Type:</b> Weapon (takes 1 special slots) \nPropulsion: x2 \nCost: 4000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_f1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 9, 
        DisplayedName = "Fire-Rate Controller", 
        Description = "<b>Description:</b> Arms the Heavy Missile Battery with the Fire-Rate Controller, improves missiles' loading time providing faster fire rate \n\n<b>Type:</b> Weapon (takes 1 special slots) \nRate: x2 \nCost: 4000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_mbc_f2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 10, 
        DisplayedName = "Hull Controller", 
        Description = "<b>Description:</b> Arms the Heavy Missile Battery with the Hull Controller, improves missiles' hull to allow more shield penetration and anti-missile resistance \n\n<b>Type:</b> Weapon (takes 1 special slots) \nShield Penetration: x2 \nAnti-Missile Resistence: x2 \nCost: 4000 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" },

	---Orders------------------ 
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_clear", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        DisplayPriority = 0, 
        DisplayedName = "Clear Orders", 
        Description = "<b>Description:</b> Clear all permanent orders!\n\n<b>Type:</b> Order", },
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_parade", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        DisplayPriority = 10, 
        DisplayedName = "Instant Parade", 
        Description = "<b>Description:</b> All units within a limited radius around the ship (7000 m) immediately parade to this ship!\n\n<b>Type:</b> Order", },
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_fusion", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "Fusion",
        DisplayPriority = 20, 
        DisplayedName = "Disable Fusion", 
        Description = "<b>Description:</b> Disable RUs fusion on Prospector!\n\n<b>Type:</b> Order (permanent)", },
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_guard", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        DisplayPriority = 30, 
        DisplayedName = "Guard", 
        Description = "<b>Description:</b> All units within a limited radius around the ship (7000 m) immediately guard this ship!\n\n<b>Type:</b> Order", },  
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_dock", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        DisplayPriority = 31, 
        DisplayedName = "Auto-Dock", 
        Description = "<b>Description:</b> All fighters and corvettes within a limited radius around the ship (15000 m) immediately dock to this ship if damaged!\n\n<b>Type:</b> Order (permanent)", },
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_deploy", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "heavycruiserPC | CanDeploy",
        DisplayPriority = 32, 
        DisplayedName = "Deploy Nuke Cannon", 
        Description = "<b>Description:</b> Deploy the Nuke Cannon! The ship will hold its current position and direction in order to fire its long range Nuke Cannon at frontal enemies\n\n<b>Type:</b> Order", },  		
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_mechanic", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        DisplayPriority = 33, 
        DisplayedName = "Mechanic Support", 
        Description = "<b>Description:</b> Automatically repair idle ships by docking them to the carrier ship within a limited radius (10000 m) if their health is less than 75% \n\n<b>Type:</b> Order", },
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_trade", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        DisplayPriority = 19, 
        DisplayedName = "Disable Trading", 
        Description = "<b>Description:</b> Disable Trading on Trade Convoy!\n\n<b>Type:</b> Order (permanent)", },      				
    { 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_reload", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",
        RequiredFleetSubSystems =	"100000ru",
        DisplayPriority = 40, 
        DisplayedName = "Energize", 
        Description = "<b>Description:</b> Energize the solar charge by consuming a lot of RUs, allowing it to fire at an insane rate for a short period of time! \n\n<b>Type:</b> Order \n\n<b>Prerequisites:</b> \n100000 RUs (Stored)", },  		
			  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "100000ru",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  
		{ 
        Type = SubSystem, 
        ThingToBuild = "hgn_orders_destroyallguns", 
        RequiredResearch = "CapitalRetire", 
        RequiredShipSubSystems = "",
        DisplayPriority = 140, 
        DisplayedName = "Rearm", 
        Description = "<b>Description:</b> Rearm this ship!\n\n<b>Type:</b> Order \n\n<b>Prerequisites:</b> \nRecycle Ability", },   	
			  
			  
	-- PRODUCTION MODULE SUBSYSTEMS

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Production_Fighter",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7100",
		Description = "<b>Description:</b> Enables Fighter class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 450 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 3 t \n\n<b>Prerequisites:</b> \nNone", 
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_BC_Production_Fighter",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7100",
		Description = "<b>Description:</b> Enables Fighter class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 450 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 3 t \n\n<b>Prerequisites:</b> \nNone", 
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Production_Fighter",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7100",
		Description = "<b>Description:</b> Enables Fighter class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 450 RUs \nBuild time: 45 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nNone", 
	},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Production_Corvette",
		RequiredResearch =		"CorvetteTech",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7102",
		Description = "<b>Description:</b> Enables Corvette class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 900 RUs \nBuild time: 60 s \nMaintenance cost: 20 RUs / year \nWeight: 3 t \n\n<b>Prerequisites:</b> \nResearch Division \nCorvette Technology", 
	},
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_BC_Production_Corvette",
		RequiredResearch =		"CorvetteTech",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7102",
		Description = "<b>Description:</b> Enables Corvette class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 900 RUs \nBuild time: 60 s \nMaintenance cost: 20 RUs / year \nWeight: 3 t \n\n<b>Prerequisites:</b> \nResearch Division \nCorvette Technology", 
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Production_Corvette",
		RequiredResearch =		"CorvetteTech",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7102",
		Description = "<b>Description:</b> Enables Corvette class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 900 RUs \nBuild time: 60 s \nMaintenance cost: 20 RUs / year \nWeight: 3 t \n\n<b>Prerequisites:</b> \nResearch Division \nCorvette Technology", 
	},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Production_Frigate",
		RequiredResearch =		"FrigateTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7104",
		Description = "<b>Description:</b> Enables Frigate class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 1300 RUs \nBuild time: 65 s \nMaintenance cost: 20 RUs / year \nWeight: 3 t \n\n<b>Prerequisites:</b> \nResearch Division \nFrigate Technology", 
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Production_Frigate",
		RequiredResearch =		"FrigateTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7104",
		Description = "<b>Description:</b> Enables Frigate class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 1300 RUs \nBuild time: 65 s \nMaintenance cost: 40 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division \nFrigate Technology", 
	},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Module_PlatformControl",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		11,
		DisplayedName =			"$7108",
		Description = "<b>Description:</b> Coordinates weapon platform operations, required for building weapon platforms and missiles \n\n<b>Type:</b> Module (takes 1 module slot) \nCost: 625 RUs \nBuild time: 70 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",      
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Module_PlatformControl",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		11,
		DisplayedName =			"$7108",
		Description = "<b>Description:</b> Coordinates weapon platform operations, required for building weapon platforms and missiles \n\n<b>Type:</b> Module (takes 1 module slot) \nCost: 625 RUs \nBuild time: 70 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",      
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Production_CapShip",
		RequiredResearch =		"CapitalTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7106",
		Description = "<b>Description:</b> Enables Capital class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 2800 RUs \nBuild time: 90 s \nMaintenance cost: 90 RUs / year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nResearch Division \nCapital Technology",  
	},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_SY_Production_CapShip",
		RequiredResearch =		"CapitalTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"Adv. Capital Class Facility",
		Description = "<b>Description:</b> Enables advanced Capital class production \n\n<b>Type:</b> Production Facility (take 1 production slot) \nCost: 2800 RUs \nBuild time: 90 s \nMaintenance cost: 90 RUs / year \nWeight: 7 t \n\n<b>Prerequisites:</b> \nResearch Division \nCapital Technology",  
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Module_Research",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"Research Division",
		Description = "<b>Description:</b> Science division, unlocks research and new ships \n\n<b>Type:</b> Module (takes 1 module slot) \nCost: 2500 RUs \nBuild time: 150 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone", 
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Module_Research",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		10,
		DisplayedName =			"Research Division",
		Description = "<b>Description:</b> Science division, unlocks research and new ships \n\n<b>Type:</b> Module (takes 1 module slot) \nCost: 2500 RUs \nBuild time: 150 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone", 
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Module_CloakGenerator",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		30,
		DisplayedName =			"$7118",
		Description = "<b>Description:</b> Sensor disruption, cloaks nearby ships from enemy sensors when activated, small energy cost when initiated and minimum amount of energy (10% of total) required to activate, unlock cloak upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \nRadius: 2000 m \nCost: 750 RUs \nBuild time: 160 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division", 
	},		
	
	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Module_HyperspaceInhibitor",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		28,
		DisplayedName =			"$7116",
		Description = "<b>Description:</b> Hyperspace inhibitor, prevents enemyships from entering or exiting hyperspace within a limited Radius around the carrier ship \n\n<b>Type:</b> Module (takes 1 module slot) \nRadius: 12000 m \nCost: 2200 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",      
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Module_HyperspaceInhibitor",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		28,
		DisplayedName =			"$7116",
		Description = "<b>Description:</b> Hyperspace inhibitor, prevents enemyships from entering or exiting hyperspace within a limited Radius around the carrier ship \n\n<b>Type:</b> Module (takes 1 module slot) \nRadius: 12000 m \nCost: 2200 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",      
	},

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Module_FireControl",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		22,
		DisplayedName =			"$7120",
		Description = "<b>Description:</b> Improves the combat effectiveness, unlocks fire abilities and weapon damage upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 20% Weapon Damage, carrying ship \n+ 15% Weapon Damage, own ships within radius \n+ 20% Weapon Aim, carrying ship \n+ 15% Weapon Aim, own ships within radius \nRadius: 4500 m \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},      


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Module_FireControl",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		22,
		DisplayedName =			"$7120",
		Description = "<b>Description:</b> Improves the combat effectiveness, unlocks fire abilities and weapon damage upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 20% Weapon Damage, carrying ship \n+ 15% Weapon Damage, own ships within radius \n+ 20% Weapon Aim, carrying ship \n+ 15% Weapon Aim, own ships within radius \nRadius: 4500 m \nCost: 1500 RUs \nBuild time: 75 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},      

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Module_Hyperspace",
		RequiredResearch =		"HyperspaceGateTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		23,
		DisplayedName =			"$7114",
		Description = "<b>Description:</b> Hyperspace drives and wake generators, allows nearby Frigates and Capital ships to hyperspace, unlocks hyperspace upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \nRadius: 3500 m \nCost: 1600 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division \nHyperspace Gate Technology",},      

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Module_Hyperspace",
		RequiredResearch =		"HyperspaceGateTech",
		RequiredShipSubSystems =	"",
		DisplayPriority =		23,
		DisplayedName =			"$7114",
		Description = "<b>Description:</b> Hyperspace drives and wake generators, allows nearby Frigates and Capital ships to hyperspace, unlocks hyperspace upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \nRadius: 3500 m \nCost: 1600 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division \nHyperspace Gate Technology",},      

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Sensors_AdvancedArray",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7122",
		Description = "<b>Description:</b> Improves basic sensors, unlocks sensor upgrades \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 250 RUs \nBuild time: 35 s \nMaintenance cost: 5 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nNone",},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Sensors_AdvancedArray",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		0,
		DisplayedName =			"$7122",
		Description = "<b>Description:</b> Improves basic sensors, unlocks sensor upgrades \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 250 RUs \nBuild time: 35 s \nMaintenance cost: 5 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nNone",},


	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_C_Sensors_DetectHyperspace",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Hyperspace",
		DisplayPriority =		1,
		DisplayedName =			"Deep Space Sensor",
		Description = "<b>Description:</b> Detects all hyperspace signatures within a radius around the carrier ship, also unlocks deep space detecting researches \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 250 RUs \nBuild time: 35 s \nMaintenance cost: 5 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nHyperspace Module",},       

	{ 
		Type = 					SubSystem, 
		ThingToBuild = 			"Vgr_MS_Sensors_DetectHyperspace",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Hyperspace",
		DisplayPriority =		1,
		DisplayedName =			"Deep Space Sensor",
		Description = "<b>Description:</b> Detects all hyperspace signatures within a radius around the carrier ship, also unlocks deep space detecting researches \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 250 RUs \nBuild time: 35 s \nMaintenance cost: 5 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nHyperspace Module",},       
	
	{
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_build",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 25,
        DisplayedName = "Manufacturing Controller",
        Description = "<b>Description:</b> improves carrier ship build speed, unlocks build upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 40% Manufacturing, carrying ship \nCost: 2000 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},       
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_build",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 25,
        DisplayedName = "Manufacturing Controller",
        Description = "<b>Description:</b> improves carrier ship build speed, unlocks build upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 40% Manufacturing, carrying ship \nCost: 2000 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},       
     
	
	{ 
        Type = SubSystem, 
        ThingToBuild = "Vgr_C_Sensors_DetectCloaked", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "CloakGenerator", 
        DisplayPriority = 2, 
        DisplayedName = "$7024", 
        Description = "<b>Description:</b> Improves sensors against cloaked ships, unlocks cloak upgrades \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 250 RUs \nBuild time: 35 s \nMaintenance cost: 5 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nCloak Generator",},
        
        {
        Type = SubSystem, 
        ThingToBuild = "Vgr_MS_Sensors_DetectCloaked", 
        RequiredResearch = "", 
        RequiredFleetSubSystems = "CloakGenerator", 
        DisplayPriority = 2, 
        DisplayedName = "$7024", 
        Description = "<b>Description:</b> Improves sensors against cloaked ships, unlocks cloak upgrades \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 250 RUs \nBuild time: 35 s \nMaintenance cost: 5 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nCloak Generator",},

--	{ 
--		Type = 					SubSystem, 
--		ThingToBuild = 			"Vgr_C_Module_BuildSpeed",
--		RequiredResearch =		"InstaFrigateTech",
--		RequiredShipSubSystems =	"",
--		DisplayPriority =		23,
--		DisplayedName =			"$7128",
--		Description =			"$7129" 
--	},

--	{ 
--		Type = 					SubSystem, 
--		ThingToBuild = 			"Vgr_MS_Module_BuildSpeed",
--		RequiredResearch =		"InstaFrigateTech",
--		RequiredShipSubSystems =	"",
--		DisplayPriority =		31,
--		DisplayedName =			"$7128",
--		Description =			"$7129" 
--	},

	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_gun5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		53,
		DisplayedName =			"Flechette Cannon",
		Description = "<b>Description:</b> Fast anti-Corvette/Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 450 x 2 \nRate 0.5 s \nRange 4725 m \nCost: 500 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},	
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_gun6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		53,
		DisplayedName =			"Flechette Cannon",
		Description = "<b>Description:</b> Fast anti-Corvette/Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 450 x 2 \nRate 0.5 s \nRange 4725 m \nCost: 500 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},	
	
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_tank1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		63,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_tank2",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		63,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_tank3",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		63,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_tank4",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		63,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_tank5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		63,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_tank6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		63,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nNone" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_fasttrackingturret5",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_fasttrackingturret6",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"pir_fasttrackingturret_tank1",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"pir_fasttrackingturret_tank2",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"pir_fasttrackingturret_tank3",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"pir_fasttrackingturret_tank4",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"pir_fasttrackingturret_tank5",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"pir_fasttrackingturret_tank6",
		RequiredResearch =		"fasttracking",
		RequiredFleetSubSystems =	"",
		DisplayPriority =		70,
		DisplayedName =			"Fast Tracking Turret",
		Description = "<b>Description:</b> Anti-Missile System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 28 x 2 \nRate 0.35 s \nRange 12750 m \nCost: 900 RUs \nBuild time: 35 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nGuardian Chassis \nAdv. Fast Tracking System" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_ciws5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_ciws6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_ciws_tank1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_ciws_tank2",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_ciws_tank3",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_ciws_tank4",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_ciws_tank5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_ciws_tank6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"CIWS",
		Description = "<b>Description:</b> Rapid Fire Kinetic Turret \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 50 x 3 \nRate 0.03 s \nRange 4500 m \nCost: 1100 RUs \nBuild time: 40 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	
  { 
		Type = 				SubSystem, 
		ThingToBuild = 			"Vgr_HeavyCannonTurrets",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		64,
		DisplayedName =			"Heavy Cannon Turrets",
		Description = "<b>Description:</b> Heavy Cannon Turrets System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 11000 x 4 \nRate 10 s \nRange 6500 m \nCost: 1900 RUs \nBuild time: 85 s \nMaintenance cost: 60 RUs / year \nWeight: 9 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},

	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_port_s",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		65,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_port_s1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		66,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},

	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_port",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		65,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_stbd",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		66,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_port1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		67,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_lithiumion_stbd1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		68,
		DisplayedName =			"Laser Cannon Turret",
		Description = "<b>Description:</b> Laser Cannon Turret System \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 550 x 2 \nRate 2.5 s \nRange 4000 m \nCost: 600 RUs \nBuild time: 30 s \nMaintenance cost: 10 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_dualflechette_port",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		69,
		DisplayedName =			"Kinetic Cannon Turret",
		Description = "<b>Description:</b> Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 2 \nRate 4.5 s \nRange 6000 m \nCost: 700 RUs \nBuild time: 35 s \nMaintenance cost: 15 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_dualflechette_stbd",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		70,
		DisplayedName =			"Kinetic Cannon Turret",
		Description = "<b>Description:</b> Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 2 \nRate 4.5 s \nRange 6000 m \nCost: 700 RUs \nBuild time: 35 s \nMaintenance cost: 15 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_dualflechette_port1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		71,
		DisplayedName =			"Kinetic Cannon Turret",
		Description = "<b>Description:</b> Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 2 \nRate 4.5 s \nRange 6000 m \nCost: 700 RUs \nBuild time: 35 s \nMaintenance cost: 15 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_dualflechette_stbd1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		72,
		DisplayedName =			"Kinetic Cannon Turret",
		Description = "<b>Description:</b> Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 2 \nRate 4.5 s \nRange 6000 m \nCost: 700 RUs \nBuild time: 35 s \nMaintenance cost: 15 RUs / year \nWeight: 2 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_stbd",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},	
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_stbd1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		74,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},	
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_stbd2",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		75,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},		
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_stbdF",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		RequiredShipSubSystems =	"FireControlTower",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon (SET)",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon, composed of: \n4 Anti-Frigate Double Kinetic Cannon Turrets \n2 Anti-Fighter Long-Range Suppressor Fire Turrets \n\n<b>Type:</b> Weapon (takes 6 special slots) \nDamage 625 x 16 \nRate 4.5 s \nRange 6000 m \nCost: 4000 RUs \nBuild time: 120 s \nMaintenance cost: 80 RUs / year \nWeight: 1 t \n\n<b>Prerequisites:</b> \nResearch Division \nFire Control Tower (on board)" 
	},	
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_quadflechette5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_destroyer_quadflechette6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_tank1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_tank2",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_tank3",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_tank4",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_tank5",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_qje_quadflechette_tank6",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		DisplayPriority =		73,
		DisplayedName =			"Double Kinetic Cannon Turret",
		Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon \n\n<b>Type:</b> Weapon (takes 1 special slot) \nDamage 625 x 4 \nRate 4.5 s \nRange 6000 m \nCost: 1200 RUs \nBuild time: 45 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" 
	},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbdF1",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbdF2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbdF3",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	
  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ft2_turret",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  
  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ft2_turret1",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},   				

	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_heavyfusionmissilelauncherbcsmallMS1",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"Research",
		RequiredShipSubSystems =	"HoleScrumbler",
		DisplayPriority =		91,
		DisplayedName =			"EMP Missile Battery (SET)",
		Description = "<b>Description:</b> EMP Missile Launcher, composed of: \n5 EMP Missile Tubes \n\n<b>Type:</b> Weapon (takes 6 special slots) \nDamage 900 x 30 \nRate 15 s \nRange 7300 m \nCost: 7000 RUs \nBuild time: 70 s \n\n<b>Prerequisites:</b> \nResearch Division \nPower Disruptor (on board)" 
	},	
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmallMS2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmallMS3",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmallMS4",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmallMS5",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_heavyfusionmissilelauncherbcsmallMS6",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},

	{ 
		Type = 				SubSystem, 
		ThingToBuild = 			"vgr_pl",
		RequiredResearch =		"",
		RequiredFleetSubSystems =	"FireControlTower & 3000ru",
		DisplayPriority =		12,
		DisplayedName =			"Perforation Pod Controller",
		Description = "<b>Description:</b> Automated Perforation Pod Controller, allows Perforation Pods to be launched from the hangar for a short time, useful for both offensive and defensive operations \n\n<b>Type:</b> Weapon (doesn't take special slots) \nCost: 3000 RUs \nBuild time: none \n\n<b>Prerequisites:</b> \nFire Control Tower \n3000 RUs (Stored)" 
	},			  		  

---Sajuuk can build mothership now
    { 
        Type = Ship, 
        ThingToBuild = "Vgr_Mothership", 
        RequiredResearch = "HyperspaceGateTech", 
        RequiredFleetSubSystems = "",                 
        DisplayPriority = 10, 
        DisplayedName = "Flagship", 
        Description = "<b>Description:</b> Vaygr Mothership, Capital Class Production Ship (you can build only one Flagship), equipped with: \n4 Production slots \n4 Module slots \n2 Resource Drop-Off points \n12 Hull Defense Guns \nCan build: Fighters, Corvettes, Frigates, Capital Ships, Platforms, Utilities, Subsystems \nCan dock and hold: Fighters, Corvettes, Frigates, Utilities\n\n<b>Type:</b> Capital Ship \nCost: 8000 RUs \nBuild time: None \nMaintenance cost: 200 RUs/year \nStrong vs: none \n\n<b>Prerequisites:</b> \nThe Mother of All Ships \nHyperspace Gate Technology" }, 
	 { 
			  Type = Ship, 			  
			  ThingToBuild = "vgr_mothership_makaan",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
---command fortress

  { 
        Type = Ship, 
        ThingToBuild = "Vgr_CommandFortress",         
        RequiredResearch = "CommandFortressTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 350, 
        DisplayedName = "Command Fortress", 
        Description = "<b>Description:</b> Capital Class Support Ship, helpful to control specific map zones, it carries advanced communication systems, equipped with: \n15 Special slots \n8 Heavy Laser Cannon Turret \nIntegrated Hyperspace System \n\n<b>Type:</b> Capital Ship \nCost: 11000 RUs \nBuild time: 700 s \nMaintenance cost: 250 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nCommand Fortress Chassis Technology \nAdmiral Rank (350 Honor points) \n6 officers \n50 crew members" }, 
    { 
        Type = Ship, 
        ThingToBuild = "Vgr_CommandFortress1",         
        RequiredResearch = "CommandFortressTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 350, 
        DisplayedName = "Command Fortress", 
        Description = "<b>Description:</b> Capital Class Support Ship, helpful to control specific map zones, it carries advanced communication systems, equipped with: \n15 Special slots \n8 Heavy Laser Cannon Turret \nIntegrated Hyperspace System \n\n<b>Type:</b> Capital Ship \nCost: 11000 RUs \nBuild time: 700 s \nMaintenance cost: 250 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nCommand Fortress Chassis Technology \nAdmiral Rank (350 Honor points) \n6 officers \n50 crew members" },          
    { 
        Type = Ship, 
        ThingToBuild = "vgr_battleship",         
        RequiredResearch = "TitanTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 351, 
        DisplayedName = "Titan", 
        Description = "<b>Description:</b> Basic version of the Titan Class Ultra Capital Ship, equipped with: \n2 Module slots \n1 Heavy Beam Cannon \n2 Heavy Laser Pulsers \n2 Concussion Cannons \n2 Cluster Missile Batteries \n4 Mortar Missile Batteries \n4 Rapid Autoguns \n\n<b>Type:</b> Capital Ship \nCost: 12000 RUs \nBuild time: 700 s \nMaintenance cost: 250 RUs / year \nStrong vs: Everything \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTitan Chassis Technology \nAdmiral Rank (350 Honor points) \n3 officers \n35 crew members" }, 
    { 
        Type = Ship, 
        ThingToBuild = "vgr_battleship1",         
        RequiredResearch = "TitanTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 351, 
        DisplayedName = "Titan", 
        Description = "<b>Description:</b> Basic version of the Titan Class Ultra Capital Ship, equipped with: \n2 Module slots \n1 Heavy Beam Cannon \n2 Heavy Laser Pulsers \n2 Concussion Cannons \n2 Cluster Missile Batteries \n4 Mortar Missile Batteries \n4 Rapid Autoguns \n\n<b>Type:</b> Capital Ship \nCost: 12000 RUs \nBuild time: 700 s \nMaintenance cost: 250 RUs / year \nStrong vs: Everything \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTitan Chassis Technology \nAdmiral Rank (350 Honor points) \n3 officers \n35 crew members" }, 
    { 
        Type = Ship, 
        ThingToBuild = "vgr_missledreadnaught",         
        RequiredResearch = "TitanTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 352, 
        DisplayedName = "Titan X", 
        Description = "<b>Description:</b> Large verion of the Titan Class Ultra Capital Ship, equipped with: \n2 Module slots \n6 Heavy Beam Cannons \n2 Nuclear Missile Batteries \n6 Mortar Missile Batteries \n30 Rapid Autoguns \n\n<b>Type:</b> Capital Ship \nCost: 35000 RUs \nBuild time: 800 s \nMaintenance cost: 350 RUs / year \nStrong vs: Everything \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTitan Chassis Technology \nAdmiral Rank (350 Honor points) \n3 officers \n40 crew members" }, 
    { 
        Type = Ship, 
        ThingToBuild = "vgr_missledreadnaught1",         
        RequiredResearch = "TitanTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 352, 
        DisplayedName = "Titan X", 
        Description = "<b>Description:</b> Large verion of the Titan Class Ultra Capital Ship, equipped with: \n2 Module slots \n6 Heavy Beam Cannons \n2 Nuclear Missile Batteries \n6 Mortar Missile Batteries \n30 Rapid Autoguns \n\n<b>Type:</b> Capital Ship \nCost: 35000 RUs \nBuild time: 800 s \nMaintenance cost: 350 RUs / year \nStrong vs: Everything \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTitan Chassis Technology \nAdmiral Rank (350 Honor points) \n3 officers \n40 crew members" }, 
    { 
        Type = Ship, 
        ThingToBuild = "vgr_titan_icon", 
        RequiredResearch = "unbuildable", 
        RequiredShipSubSystems = "", 
        DisplayPriority = 354, 
        DisplayedName = "", 
        Description = "" },
  { 
        Type = Ship, 
        ThingToBuild = "vgr_superbattleship",         
        RequiredResearch = "TitanTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 354, 
        DisplayedName = "Titan V", 
        Description = "<b>Description:</b> Ultimate Titan Class Ultra Capital Ship, designed to obliterate a whole armada on its own, equipped with: \n2 Module slots \n9 Heavy Beam Cannons \n24 Sniper Cannons \n8 Cluster Missile Batteries \n16 Mortar Missile Batteries \n36 Rapid Autoguns \n\n<b>Type:</b> Capital Ship \nCost: 60000 RUs \nBuild time: 900 s \nMaintenance cost: 400 RUs / year \nStrong vs: Everything \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTitan Chassis Technology \nAdmiral Rank (350 Honor points) \n6 officers \n50 crew members" }, 
    { 
        Type = Ship, 
        ThingToBuild = "vgr_superbattleship1",         
        RequiredResearch = "TitanTech", 
        RequiredShipSubSystems = "Hyperspace", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 354, 
        DisplayedName = "Titan V", 
        Description = "<b>Description:</b> Ultimate Titan Class Ultra Capital Ship, designed to obliterate a whole armada on its own, equipped with: \n2 Module slots \n9 Heavy Beam Cannons \n24 Sniper Cannons \n8 Cluster Missile Batteries \n16 Mortar Missile Batteries \n36 Rapid Autoguns \n\n<b>Type:</b> Capital Ship \nCost: 60000 RUs \nBuild time: 900 s \nMaintenance cost: 400 RUs / year \nStrong vs: Everything \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTitan Chassis Technology \nAdmiral Rank (350 Honor points) \n6 officers \n50 crew members" }, 
  { 
				Type = SubSystem, 
				ThingToBuild = "hgn_commandfortress_defencefacility",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 20,
				DisplayedName = "Defense Facility",
        Description = "<b>Description:</b> Defense and support systems improver, includes advanced defense technologies: enable the Perimeter Defense Field, disrupts enemy abilities and improves armour of friendly units within a limited radius around the Fortress, enables the Anti-Radiation Field, prevents enemy ships from entering or exiting hyperspace, the integrated Repair System improves the auto repair rate of the Fortress and own nearby ships, also unlocks dock and auto-repair upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \nCost: 5000 RUs \nBuild time: 250 s \nMaintenance cost: 150 RUs / year \nWeight: 12 t \n\n<b>Prerequisites:</b> \nNone",},	   
  { 
				Type = SubSystem, 
				ThingToBuild = "hgn_commandfortress_comunicationfacility",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 0,
				DisplayedName = "Communications Facility",
        Description = "<b>Description:</b> Communications improver, basically includes any available sensors technology: improves basic sensors, improves sensors against cloaked ships, detects all hyperspace signatures, scrumbles enemy sensors, enables Sensor Ping ability, unlocks sensor upgrades, also extends Hyperspace abilities to the nearby ships \n\n<b>Type:</b> Sensor (takes 1 special slot, you can build only one sensor per ship) \nCost: 1500 RUs \nBuild time: 90 s \nMaintenance cost: 100 RUs / year \nWeight: 9 t \n\n<b>Prerequisites:</b> \nNone",},	          
  { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_qje_quadflechette_stbd_cf",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "CFRepairSystem",      	    
			  DisplayPriority = 36,
			  DisplayedName = "Double Kinetic Cannon (SET)", 
        Description = "<b>Description:</b> Double Kinetic Cannon Turret System, Advanced Anti-Frigate weapon set, composed of: \n8 Anti-Frigate Double Kinetic Cannon Turrets \n\n<b>Type:</b> Weapon (takes 8 special slots) \nDamage: 625 x 32 \nRate: 4.5 s \nRange: 6000 m \nCost: 6000 RUs \nBuild time: 300 s \nMaintenance cost: 120 RUs / year \nWeight: 16 t \n\n<b>Prerequisites:</b> \nResearch Division\nDefense Facility (on board)" }, 	   
  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd3",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd4",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd5",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd6",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd7",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd8",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd9",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd10",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd11",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd12",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd13",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 	      
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd14",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_qje_quadflechette_stbd15",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_ion1",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "CFRepairSystem",      	    
			  DisplayPriority = 37,
			  DisplayedName = "Laser Pulsar Cannon (SET)", 
        Description = "<b>Description:</b> Heavy Laser Pulsar Cannon Turret System, Anti-Frigate/Capital Ships weapon set, composed of: \n6 Anti-Frigate/Capital Ships Cannon Turrets \n\n<b>Type:</b> Weapon (takes 6 special slots) \nDamage: 6000 x 12 \nRate: 12 s \nRange: 6500 m \nCost: 7000 RUs \nBuild time: 350 s \nMaintenance cost: 90 RUs / year \nWeight: 14 t \n\n<b>Prerequisites:</b> \nResearch Division\nDefense Facility (on board)" }, 	   
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ion2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},		 
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ion3",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ion4",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ion5",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},		
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_ion6",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},			   		  		 		  		 		  		  	  	      		  		  		  		  		  		  		  		  		  		
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_magnetron1",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "FireControlTower",      	    
			  DisplayPriority = 81,
			  DisplayedName = "Magnetron", 
        Description = "<b>Description:</b> Experimental Anti-Frigate weapon, designed to paralyze and suck enemy frigates \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 700 x 2 \nRate: 6 s \nRange: 6500 m \nCost: 2000 RUs \nBuild time: 50 s \n\n<b>Prerequisites:</b> \nResearch Division\nFire Control Tower (on board)" }, 
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_magnetron2",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "FireControlTower",      	    
			  DisplayPriority = 82,
			  DisplayedName = "Magnetron", 
        Description = "<b>Description:</b> Experimental Anti-Frigate weapon, designed to paralyze and suck enemy frigates \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 700 x 2 \nRate: 6 s \nRange: 6500 m \nCost: 2000 RUs \nBuild time: 50 s \n\n<b>Prerequisites:</b> \nResearch Division\nFire Control Tower (on board)" }, 

	
	{ 
			  Type = SubSystem, 
			  ThingToBuild = "missile_box",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "CFRepairSystem",      	    
			  DisplayPriority = 38,
			  DisplayedName = "Perforation Pod Launcher (SET)", 
        Description = "<b>Description:</b> Perforation Pod Launcher System, Anti-Capital Ships weapon set, composed of: \n6 Anti-Capital Ships Pod Launcher \n\n<b>Type:</b> Weapon (takes 6 special slots) \nDamage: 6000 x 6 \nRate: 7 s \nRange: 6500 m \nCost: 8000 RUs \nBuild time: 400 s \nMaintenance cost: 120 RUs / year \nWeight: 14 t \n\n<b>Prerequisites:</b> \nResearch Division\nDefense Facility (on board)" }, 	   
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "missile_box1",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},		 
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "missile_box2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "missile_box3",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "missile_box4",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},		
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "missile_box5",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_light",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 170,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 30 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_light1",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 171,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 30 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_destroyer_dt3_turret5",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_destroyer_dt3_turret6",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_tank1",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_tank2",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_tank3",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_tank4",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_tank5",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret_tank6",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 371,
			  DisplayedName = "Concussion Cannon", 
        Description = "<b>Description:</b> Concussion Cannon Turret System, Anti-Subsystem/Capital weapon, composed of: \n4 Micro-Bomb Cannons \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 500 x 4 \nRate: 9 s \nRange: 6200 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		  	
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_destroyer_heavycruiserkineticturret5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_destroyer_heavycruiserkineticturret6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret_tank1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret_tank2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret_tank3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret_tank4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret_tank5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },
		{ 
        Type = SubSystem, 
        ThingToBuild = "vgr_heavycruiserkineticturret_tank6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
				RequiredFleetSubSystems =	"Research",
        DisplayPriority = 401, 
        DisplayedName = "Sniper Cannon", 
        Description = "<b>Description:</b> Ultra long-range artillery \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 8000 x 2 \nRate: 5 s \nRange: 35000 m \nCost: 3500 RUs \nBuild time: 145 s \nMaintenance cost: 20 RUs / year \nWeight: 4 t \n\n<b>Prerequisites:</b> \nResearch Division" },

	 { 
			  Type = SubSystem, 
			  ThingToBuild = "vgr_dt3_turret",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "CFRepairSystem",      	    
			  DisplayPriority = 39,
			  DisplayedName = "Concussion Cannon (SET)", 
        Description = "<b>Description:</b> Heavy Concussion Cannon Turret System, Anti-Subsystem/Capital weapon set, composed of: \n3 Concussion Cannon Turrets \n\n<b>Type:</b> Weapon (takes 3 special slots) \nDamage: 5000 x 12 \nRate: 9 s \nRange: 6500 m \nCost: 9000 RUs \nBuild time: 375 s \nMaintenance cost: 150 RUs / year \nWeight: 14 t \n\n<b>Prerequisites:</b> \nResearch Division\nDefense Facility (on board)" }, 	   		  
   { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_dt3_turret1",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},	
	 { 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_dt3_turret2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},				      
	 { 
			  Type = SubSystem, 
			  ThingToBuild = "missile_boxbc",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 65,
			  DisplayedName = "Perforation Pod Launcher", 
        Description = "<b>Description:</b> Perforation Pod Launcher System, Anti-Capital Ships weapon, composed of: \n1 Anti-Capital Ships Pod Launcher \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 \nRate: 7 s \nRange: 6500 m \nCost: 1400 RUs \nBuild time: 90 s \nMaintenance cost: 20 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	  
   { 
			  Type = SubSystem, 
			  ThingToBuild = "missile_box1bc",	
			  RequiredResearch = "", 
        RequiredFleetSubSystems = "Research", 
        RequiredShipSubSystems = "",      	    
			  DisplayPriority = 66,
			  DisplayedName = "Perforation Pod Launcher", 
        Description = "<b>Description:</b> Perforation Pod Launcher System, Anti-Capital Ships weapon, composed of: \n1 Anti-Capital Ships Pod Launcher \n\n<b>Type:</b> Weapon (takes 1 special slots) \nDamage: 6000 \nRate: 7 s \nRange: 6500 m \nCost: 1400 RUs \nBuild time: 90 s \nMaintenance cost: 20 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division" }, 	   		  		   		  		 		  		 		  		  	  	      		  		  		  		  		  		  		  		  		  		  		  	            		  		   		  		 		  		 		  		  	  	      		  		  		  		  		  		  		  		  		  		  		  	      
	
	{
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_Mine",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 16,
        DisplayedName = "Harvest Control Module",
        Description = "<b>Description:</b> Improves harvesting operations within a limited Radius around the carrier ship, unlocks harvesting upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 15% Harvest, own collectors within radius \n+ 15% Load, own collectors within radius \n+ 15% Drop Off, own collectors within radius \nRadius: 3000 m \nCost: 800 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",},     
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_Mine",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 16,
        DisplayedName = "Harvest Control Module",
        Description = "<b>Description:</b> Improves harvesting operations within a limited Radius around the carrier ship, unlocks harvesting upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 15% Harvest, own collectors within radius \n+ 15% Load, own collectors within radius \n+ 15% Drop Off, own collectors within radius \nRadius: 3000 m \nCost: 800 RUs \nBuild time: 60 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",},       
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_drive",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 18,
        DisplayedName = "Drive System",
        Description = "<b>Description:</b> Improves speed and acceleration of carrier ship and friendly units within a limited radius around the carrier ship, unlocks drive upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 50% Drive, ship \n+ 10% Drive, own ships within radius\n+ 40% Speed, ship \n+ 10% Speed, own ships within radius \nRadius: 5250 m \nCost: 1600 RUs \nBuild time: 35 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",},
     
     {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_drive",
        RequiredResearch = "",
        RequiredFleetSubSystems = "",
        DisplayPriority = 18,
        DisplayedName = "Drive System",
        Description = "<b>Description:</b> Improves speed and acceleration of carrier ship and friendly units within a limited radius around the carrier ship, unlocks drive upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 50% Drive, ship \n+ 10% Drive, own ships within radius\n+ 40% Speed, ship \n+ 10% Speed, own ships within radius \nRadius: 5250 m \nCost: 1600 RUs \nBuild time: 35 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nNone",},
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_Defensefield",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 20,
        DisplayedName = "Defense Control Tower",
        Description = "<b>Description:</b> Improves armour of carrier ship and friendly units within a limited radius around the carrier ship, unlocks defense abilities and health upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 25% Health, carrying ship \n+ 10% Health, own ships within radius \nRadius: 3900 m \nCost: 1400 RUs \nBuild time: 70 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},
     
     {
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_Defensefield",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 20,
        DisplayedName = "Defense Control Tower",
        Description = "<b>Description:</b> Improves armour of carrier ship and friendly units within a limited radius around the carrier ship, unlocks defense abilities and health upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 25% Health, carrying ship \n+ 10% Health, own ships within radius \nRadius: 3900 m \nCost: 1400 RUs \nBuild time: 70 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_Repair",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 24,
        DisplayedName = "Repair System",
        Description = "<b>Description:</b> Improves auto repair rate of carrier ship and friendly units within a limited radius around the carrier ship, unlocks dock and auto-repair upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 460% Repair, own ships within radius \n+ 150% Docking, carrying ship \nRadius: 6000 m \nCost: 1800 RUs \nBuild time: 80 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},   
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_Repair",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 24,
        DisplayedName = "Repair System",
        Description = "<b>Description:</b> Improves auto repair rate of carrier ship and friendly units within a limited radius around the carrier ship, unlocks dock and auto-repair upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n+ 460% Repair, own ships within radius \n+ 150% Docking, carrying ship \nRadius: 6000 m \nCost: 1800 RUs \nBuild time: 80 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},   
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_Defensefieldshield",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 62,
        DisplayedName = "Anti-Radiation Field",
        Description = "<b>Description:</b> Enables Anti-Radiation Field, protects Flagship and nearby ships from hull eating nebulae, unlocks anti-radiation upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n-90% Nebula sensivity, own ships within radius \n-90% Dust Cloud sensivity, own ships within radius \nRadius: 1850 m \nCost: 2600 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs/year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},  		
    {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_Defensefieldshield",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 62,
        DisplayedName = "Anti-Radiation Field",
        Description = "<b>Description:</b> Enables Anti-Radiation Field, protects carrier and nearby ships from hull eating nebulae, unlocks anti-radiation upgrades \n\n<b>Type:</b> Module (takes 1 module slot) \n-90% Nebula sensivity, own ships within radius \n-90% Dust Cloud sensivity, own ships within radius \nRadius: 1850 m \nCost: 2600 RUs \nBuild time: 40 s \nMaintenance cost: 50 RUs/year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},  
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Module_holescrumbler",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 63,
        DisplayedName = "Power Disruptor",
        Description = "<b>Description:</b> Disrupts enemy abilities within a limited radius around the carrier ship \n\n<b>Type:</b> Module (takes 1 module slot) \n- 30% Speed, enemy ships within radius \n- 25% Drive, enemy ships within radius \n- 20% Weapon Damage, enemy ships within radius \n- 30% Weapon Aim, enemy ships within radius \nRadius: 4850 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",},      
        
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_C_Module_holescrumbler",
        RequiredResearch = "",
        RequiredFleetSubSystems = "Research",
        DisplayPriority = 67,
        DisplayedName = "Power Disruptor",
        Description = "<b>Description:</b> Disrupts enemy abilities within a limited radius around the carrier ship \n\n<b>Type:</b> Module (takes 1 module slot) \n- 30% Speed, enemy ships within radius \n- 25% Drive, enemy ships within radius \n- 20% Weapon Damage, enemy ships within radius \n- 30% Weapon Aim, enemy ships within radius \nRadius: 4850 m \nCost: 3000 RUs \nBuild time: 100 s \nMaintenance cost: 50 RUs / year \nWeight: 5 t \n\n<b>Prerequisites:</b> \nResearch Division",}, 
        {
        Type = SubSystem,
        ThingToBuild = "Vgr_MS_Armor",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 167,
        DisplayedName = "Armor Asset",
        Description = "<b>Description:</b> Heavy Armor Asset, improves Flagship's attack and defense systems \n\n<b>Type:</b> Special (doesn't take special slots)  \n+ 10% Speed \n+ 5% Drive \n+ 40% Health \n+ 20% Weapon Damage \n+ 20% Weapon Aim \n+ 40% Auto-repair \nCost: 8000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: 25 t \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board)",},           
        {
        Type = SubSystem,
        ThingToBuild = "vgr_mothership_shield",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule & vgrmsarmor",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 171,
        DisplayedName = "Force Field (Port)",
        Description = "<b>Description:</b> Massive Energy Shield (left side), protects the Flagship from heavy gunfire \n\n<b>Type:</b> Special (doesn't take special slots) \nCost: 10000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: None \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board) \nArmor Asset (on board)",},           
        {
        Type = SubSystem,
        ThingToBuild = "vgr_mothership_shield1",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule & vgrmsarmor",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 172,
        DisplayedName = "Force Field (Starboard)",
        Description = "<b>Description:</b> Massive Energy Shield (right side), protects the Flagship from heavy gunfire \n\n<b>Type:</b> Special (doesn't take special slots) \nCost: 10000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: None \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board) \nArmor Asset (on board)",},           
        {
        Type = SubSystem,
        ThingToBuild = "vgr_carrier_shield",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule & Vgr_power_ms",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 171,
        DisplayedName = "Force Field (Port)",
        Description = "<b>Description:</b> Massive Energy Shield (left side), protects the Carrier from heavy gunfire \n\n<b>Type:</b> Special (doesn't take special slots) \nCost: 10000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: None \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board) \nPower Generator (on board)",},           
        {
        Type = SubSystem,
        ThingToBuild = "vgr_carrier_shield1",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule & Vgr_power_ms",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 172,
        DisplayedName = "Force Field (Starboard)",
        Description = "<b>Description:</b> Massive Energy Shield (right side), protects the Carrier from heavy gunfire \n\n<b>Type:</b> Special (doesn't take special slots) \nCost: 10000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: None \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board) \nPower Generator (on board)",},           
        {
        Type = SubSystem,
        ThingToBuild = "vgr_shipyard_shield",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule & CapShipProduction",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 171,
        DisplayedName = "Force Field (Port)",
        Description = "<b>Description:</b> Massive Energy Shield (left side), protects the Carrier from heavy gunfire \n\n<b>Type:</b> Special (doesn't take special slots) \nCost: 10000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: None \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board) \nAdv. Capital Class Facility (on board)",},           
        {
        Type = SubSystem,
        ThingToBuild = "vgr_shipyard_shield1",
        RequiredResearch = "",
				RequiredShipSubSystems =	"DefenseFieldModule & CapShipProduction",
        RequiredFleetSubSystems = "Research",				
        DisplayPriority = 172,
        DisplayedName = "Force Field (Starboard)",
        Description = "<b>Description:</b> Massive Energy Shield (right side), protects the Carrier from heavy gunfire \n\n<b>Type:</b> Special (doesn't take special slots) \nCost: 10000 RUs \nBuild time: 250 s \nMaintenance cost: None / year \nWeight: None \n\n<b>Prerequisites:</b> \nResearch Division \nDefense Control Tower (on board) \nAdv. Capital Class Facility (on board)",},           


	-------------------------------------------------------------------------------
	-- SHIPS


	-- Fighters ---------------

	{
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Scout",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		20,
		DisplayedName =			"$7130",
		Description = "<b>Description:</b> Reconnaissance Fighter Squadron, equipped with: \nLight Flechette Gun \nElectro Magnetic Pulse Emitter (when upgraded) \n\n<b>Type:</b> Fighter \nCost: 350 RUs \nBuild time: 20 s \nMaintenance cost: 5 RUs / year \nStrong vs: none \n\n<b>Prerequisites:</b> \n3 crew members"  
	},
	{
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Scout1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		20,
		DisplayedName =			"$7130",
		Description = "<b>Description:</b> Reconnaissance Fighter Squadron, equipped with: \nLight Flechette Gun \nElectro Magnetic Pulse Emitter (when upgraded) \n\n<b>Type:</b> Fighter \nCost: 350 RUs \nBuild time: 20 s \nMaintenance cost: 5 RUs / year \nStrong vs: none \n\n<b>Prerequisites:</b> \n3 crew members"  
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Interceptor",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		21,
		DisplayedName =			"$7132",
		Description = "<b>Description:</b> Basic Fighter Squadron, equipped with: \nFlechette Gun \n\n<b>Type:</b> Fighter \nCost: 500 RUs \nBuild time: 35 s \nMaintenance cost: 7 RUs / year \nStrong vs: Fighters \n\n<b>Prerequisites:</b> \nFighter Facility \n7 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Interceptor1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		21,
		DisplayedName =			"$7132",
		Description = "<b>Description:</b> Basic Fighter Squadron, equipped with: \nFlechette Gun \n\n<b>Type:</b> Fighter \nCost: 500 RUs \nBuild time: 35 s \nMaintenance cost: 7 RUs / year \nStrong vs: Fighters \n\n<b>Prerequisites:</b> \nFighter Facility \n7 crew members" 
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Bomber",
		RequiredResearch =		"PlasmaBombs",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		24,
		DisplayedName =			"$7134",
		Description = "<b>Description:</b> Anti-Capital Ship Fighter Squadron, equipped with: \n2 Anti-Capital Ship Plasma Bomb Launcher \n2 Anti-SubSystem Plasma Bombs Launcher (when upgraded) \n\n<b>Type:</b> Fighter \nCost: 550 RUs \nBuild time: 40 s \nMaintenance cost: 8 RUs / year \nStrong vs: Frigates, Capital Ships, Subsystems (when upgraded) \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nFusion Bomb Technology \n6 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Bomber1",
		RequiredResearch =		"PlasmaBombs",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		24,
		DisplayedName =			"$7134",
		Description = "<b>Description:</b> Anti-Capital Ship Fighter Squadron, equipped with: \n2 Anti-Capital Ship Plasma Bomb Launcher \n2 Anti-SubSystem Plasma Bombs Launcher (when upgraded) \n\n<b>Type:</b> Fighter \nCost: 550 RUs \nBuild time: 40 s \nMaintenance cost: 8 RUs / year \nStrong vs: Frigates, Capital Ships, Subsystems (when upgraded) \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nFusion Bomb Technology \n6 crew members"  
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LanceFighter",
		RequiredResearch =		"LanceBeams",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		26,
		DisplayedName =			"$7136",
		Description = "<b>Description:</b> Anti-Corvette Fighter Squadron, equipped with: \nLight Plasma Lance \n\n<b>Type:</b> Fighter \nCost: 550 RUs \nBuild time: 35 s \nMaintenance cost: 7 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nLance Beam Technology \n5 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LanceFighter1",
		RequiredResearch =		"LanceBeams",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		26,
		DisplayedName =			"$7136",
		Description = "<b>Description:</b> Anti-Corvette Fighter Squadron, equipped with: \nLight Plasma Lance \n\n<b>Type:</b> Fighter \nCost: 550 RUs \nBuild time: 35 s \nMaintenance cost: 7 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nLance Beam Technology \n5 crew members" 
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Defender",
		RequiredResearch =		"DefenderTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		28,
		DisplayedName =			"Defender",
		Description = "<b>Description:</b> Advanced Fighter Squadron, equipped with: \n3 Flechette Guns \n\n<b>Type:</b> Fighter \nCost: 650 RUs \nBuild time: 50 s \nMaintenance cost: 9 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nDefender Technology \n5 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Defender1",
		RequiredResearch =		"DefenderTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		28,
		DisplayedName =			"Defender",
		Description = "<b>Description:</b> Advanced Fighter Squadron, equipped with: \n3 Flechette Guns \n\n<b>Type:</b> Fighter \nCost: 650 RUs \nBuild time: 50 s \nMaintenance cost: 9 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nDefender Technology \n5 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_HeavyFighter",
		RequiredResearch =		"HeavyFighterTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		30,
		DisplayedName =			"Heavy Fighter",
		Description = "<b>Description:</b> Heavy Fighter Squadron, equipped with: \nLight Plasma Lance \nConcussion Missile Launcher \n\n<b>Type:</b> Fighter \nCost: 750 RUs \nBuild time: 55 s \nMaintenance cost: 12 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nMissile Fighter Technology \n5 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_HeavyFighter1",
		RequiredResearch =		"HeavyFighterTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		30,
		DisplayedName =			"Heavy Fighter",
		Description = "<b>Description:</b> Heavy Fighter Squadron, equipped with: \nLight Plasma Lance \nConcussion Missile Launcher \n\n<b>Type:</b> Fighter \nCost: 750 RUs \nBuild time: 55 s \nMaintenance cost: 12 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nMissile Fighter Technology \n5 crew members" 
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MissileBomber",
		RequiredResearch =		"MissileBomberTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		31,
		DisplayedName =			"Missile Bomber",
		Description = "<b>Description:</b> Advanced Anti-Capital Ship Fighter Squadron, equipped with: \n2 Anti-Capital Ship Plasma Bomb Launcher \n2 Anti-SubSystem Plasma Bombs Launcher (when upgraded) \n2 Fusion Missile Launcher \n\n<b>Type:</b> Fighter \nCost: 850 RUs \nBuild time: 60 s \nMaintenance cost: 13 RUs / year \nStrong vs: Frigates, Capital Ships, Subsystems (when upgraded)  \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nMissile Bomber Technology \n6 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MissileBomber1",
		RequiredResearch =		"MissileBomberTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		31,
		DisplayedName =			"Missile Bomber",
		Description = "<b>Description:</b> Advanced Anti-Capital Ship Fighter Squadron, equipped with: \n2 Anti-Capital Ship Plasma Bomb Launcher \n2 Anti-SubSystem Plasma Bombs Launcher (when upgraded) \n2 Fusion Missile Launcher \n\n<b>Type:</b> Fighter \nCost: 850 RUs \nBuild time: 60 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships, Subsystems (when upgraded)  \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nMissile Bomber Technology \n6 crew members" 
	},
		
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_EliteFighter",
		RequiredResearch =		"MultiroleTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		32,
		DisplayedName =			"Strike Fighter",
		Description = "<b>Description:</b> Strike Fighter Squadron, equipped with: \nFast Flechette Cannon \n2 Flechette Guns \n2 Anti-Capital Ship Plasma Bomb Launcher \n2 Anti-SubSystem Plasma Bombs Launcher (when upgraded) \n\n<b>Type:</b> Fighter \nCost: 950 RUs \nBuild time: 65 s \nMaintenance cost: 13 RUs / year \nStrong vs: Multi-Role \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nMulti-Role Technology \n5 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_EliteFighter1",
		RequiredResearch =		"MultiroleTech",
		RequiredShipSubSystems =	"FighterProduction",
		DisplayPriority =		32,
		DisplayedName =			"Strike Fighter",
		Description = "<b>Description:</b> Strike Fighter Squadron, equipped with: \nFast Flechette Cannon \n2 Flechette Guns \n2 Anti-Capital Ship Plasma Bomb Launcher \n2 Anti-SubSystem Plasma Bombs Launcher (when upgraded) \n\n<b>Type:</b> Fighter \nCost: 950 RUs \nBuild time: 65 s \nMaintenance cost: 13 RUs / year \nStrong vs: Multi-Role \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nMulti-Role Technology \n5 crew members" 
	},

	{ 
        Type = Ship, 
        ThingToBuild = "Vgr_Bioship", 
        RequiredResearch = "BioTech", 
        RequiredShipSubSystems = "FighterProduction", 
        RequiredFleetSubSystems = "IsAdmiral", 
        DisplayPriority = 35, 
        DisplayedName = "Swimmer", 
        Description = "<b>Description:</b> Advanced Sci-Fi Bioship (27 units max)\n\n<b>Type:</b> Fighter \nCost: 2200 RUs \nBuild time: 70 s \nMaintenance cost: none \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFighter Facility \nResearch Division \nAdmiral Rank (350 Honor points)"
	 }, 

	-- Corvettes --------------

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MissileCorvette",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		100,
		DisplayedName =			"$7138",
		Description = "<b>Description:</b> Basic Corvette Squadron, equipped with: \nConcussion Missile Launcher \n\n<b>Type:</b> Corvette \nCost: 625 RUs \nBuild time: 45 s \nMaintenance cost: 11 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Facility \n8 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MissileCorvette1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		100,
		DisplayedName =			"$7138",
		Description = "<b>Description:</b> Basic Corvette Squadron, equipped with: \nConcussion Missile Launcher \n\n<b>Type:</b> Corvette \nCost: 625 RUs \nBuild time: 45 s \nMaintenance cost: 11 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Facility \n8 crew members"  
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LaserCorvette",
		RequiredResearch =		"CorvetteLaser",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		105,
		DisplayedName =			"$7140",
		Description = "<b>Description:</b> Anti-Frigate Corvette Squadron, equipped with: \nLaser Cannon \n\n<b>Type:</b> Corvette \nCost: 650 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nLaser Systems Technology \n8 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LaserCorvette1",
		RequiredResearch =		"CorvetteLaser",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		105,
		DisplayedName =			"$7140",
		Description = "<b>Description:</b> Anti-Frigate Corvette Squadron, equipped with: \nLaser Cannon \n\n<b>Type:</b> Corvette \nCost: 650 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nLaser Systems Technology \n8 crew members"   
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_PlasmaCorvette",
		RequiredResearch =		"CorvettePlasma",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		106,
		DisplayedName =			"Plasma Corvette",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Corvette Squadron, equipped with: \nPlasma Cannon \n\n<b>Type:</b> Corvette \nCost: 650 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nPlasma Systems Technology \n8 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_PlasmaCorvette1",
		RequiredResearch =		"CorvettePlasma",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		106,
		DisplayedName =			"Plasma Corvette",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Corvette Squadron, equipped with: \nPlasma Cannon \n\n<b>Type:</b> Corvette \nCost: 650 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nPlasma Systems Technology \n8 crew members"   
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MinelayerCorvette",
		RequiredResearch =		"CorvetteGraviticAttraction",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		115,
		DisplayedName =			"$7142",
		Description = "<b>Description:</b> Utility Corvette, can deploy mines as a special action (default N), equipped with: \nKinetic Cannon \nMine Sweeper \nMine Deploying System \n\n<b>Type:</b> Corvette \nCost: 800 RUs \nBuild time: 45 s \nMaintenance cost: 6 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nMinelaying Technology \n3 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MinelayerCorvette1",
		RequiredResearch =		"CorvetteGraviticAttraction",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		115,
		DisplayedName =			"$7142",
		Description = "<b>Description:</b> Utility Corvette, can deploy mines as a special action (default N), equipped with: \nKinetic Cannon \nMine Sweeper \nMine Deploying System \n\n<b>Type:</b> Corvette \nCost: 800 RUs \nBuild time: 45 s \nMaintenance cost: 6 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nMinelaying Technology \n3 crew members"   
	},

	{ 
		Type =					Ship, 
		ThingToBuild =			"Vgr_CommandCorvette",
		RequiredResearch =		"CorvetteCommand",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		110,
		DisplayedName =			"$7144",
		Description = "<b>Description:</b> Utility Corvette, improves all nearby ship weapon damage (+15%) and accuracy (+15%), equipped with: \nImproved Sensors \nWeapon Command System \n\n<b>Type:</b> Corvette \nCost: 400 RUs \nBuild time: 30 s \nMaintenance cost: 8 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nCommand System Technology \n2 crew members"   
	},
	{ 
		Type =					Ship, 
		ThingToBuild =			"Vgr_CommandCorvette1",
		RequiredResearch =		"CorvetteCommand",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		110,
		DisplayedName =			"$7144",
		Description = "<b>Description:</b> Utility Corvette, improves all nearby ship weapon damage (+15%) and accuracy (+15%), equipped with: \nImproved Sensors \nWeapon Command System \n\n<b>Type:</b> Corvette \nCost: 400 RUs \nBuild time: 30 s \nMaintenance cost: 8 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nCommand System Technology \n2 crew members"   
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_mortarcorvette",
		RequiredResearch =		"mortartech",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		118,
		DisplayedName =			"Sperm Corvette",
		Description = "<b>Description:</b> Advanced Corvette Squadron, equipped with: \n8 Sperm Launchers \n\n<b>Type:</b> Corvette \nCost: 1200 RUs \nBuild time: 70 s \nMaintenance cost: 14 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nSperm Technology \n9 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_mortarcorvette1",
		RequiredResearch =		"mortartech",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		118,
		DisplayedName =			"Sperm Corvette",
		Description = "<b>Description:</b> Advanced Corvette Squadron, equipped with: \n8 Sperm Launchers \n\n<b>Type:</b> Corvette \nCost: 1200 RUs \nBuild time: 70 s \nMaintenance cost: 14 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nSperm Technology \n9 crew members"   
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MultiLanceCorvette",
		RequiredResearch =		"CorvetteMultiLance",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		119,
		DisplayedName =			"MultiLance Corvette",
		Description = "<b>Description:</b> Advanced Corvette Squadron, equipped with: \n2 Laser Turrets \n\n<b>Type:</b> Corvette \nCost: 900 RUs \nBuild time: 60 s \nMaintenance cost: 13 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nMultiLance Technology \n9 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MultiLanceCorvette1",
		RequiredResearch =		"CorvetteMultiLance",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		119,
		DisplayedName =			"MultiLance Corvette",
		Description = "<b>Description:</b> Advanced Corvette Squadron, equipped with: \n2 Laser Turrets \n\n<b>Type:</b> Corvette \nCost: 900 RUs \nBuild time: 60 s \nMaintenance cost: 13 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nMultiLance Technology \n9 crew members"   
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Standvette",
		RequiredResearch =		"stormtech",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		117,
		DisplayedName =			"Assault Corvette",
		Description = "<b>Description:</b> Anti-Corvette/Frigate Squadron, equipped with: \nFlechette Turret \n\n<b>Type:</b> Corvette \nCost: 800 RUs \nBuild time: 50 s \nMaintenance cost: 14 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nCorvette Facility \nAssault Corvette Technology \n8 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Standvette1",
		RequiredResearch =		"stormtech",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		117,
		DisplayedName =			"Assault Corvette",
		Description = "<b>Description:</b> Anti-Corvette/Frigate Squadron, equipped with: \nFlechette Turret \n\n<b>Type:</b> Corvette \nCost: 800 RUs \nBuild time: 50 s \nMaintenance cost: 14 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nCorvette Facility \nAssault Corvette Technology \n8 crew members"   
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Striker",
		RequiredResearch =		"Striker",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		120,
		DisplayedName =			"Escort Corvette",
		Description = "<b>Description:</b> Advanced Corvette Squadron, equipped with: \n3 Fast Flechette Cannons \n2 Concussion Missile Launchers \n\n<b>Type:</b> Corvette \nCost: 1200 RUs \nBuild time: 70 s \nMaintenance cost: 14 RUs / year \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nEscort Corvette Technology \n9 crew members"   
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Striker1",
		RequiredResearch =		"Striker",
		RequiredShipSubSystems =	"CorvetteProduction",
		DisplayPriority =		120,
		DisplayedName =			"Escort Corvette",
		Description = "<b>Description:</b> Advanced Corvette Squadron, equipped with: \n3 Fast Flechette Cannons \n2 Concussion Missile Launchers \n\n<b>Type:</b> Corvette \nCost: 1200 RUs \nBuild time: 70 s \nMaintenance cost: 14 RUs / year \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nCorvette Facility \nResearch Division \nEscort Corvette Technology \n9 crew members"   
	},

	-- Frigates ---------------

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_AssaultFrigate",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		200,
		DisplayedName =			"$7146",
		Description = "<b>Description:</b> Anti-Fighter Frigate, equipped with: \n3 Flechette Turret \nConcussion Missile Launcher \n\n<b>Type:</b> Frigate \nCost: 750 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nFrigate Facility \n6 crew members"    
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_AssaultFrigate1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		200,
		DisplayedName =			"$7146",
		Description = "<b>Description:</b> Anti-Fighter Frigate, equipped with: \n3 Flechette Turret \nConcussion Missile Launcher \n\n<b>Type:</b> Frigate \nCost: 750 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nFrigate Facility \n6 crew members"    
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_AdvAssaultFrigate",
		RequiredResearch =		"MultiCannonTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		201,
		DisplayedName =			"Advanced Assault Frigate",
		Description = "<b>Description:</b> Advanced Anti-Fighter Frigate, equipped with: \n5 Flechette Turret \nConcussion Missile Launcher \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuild time: 50 s \nMaintenance cost: 14 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nFrigate Facility \nMulti Cannons Technology \n7 crew members"    
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_AdvAssaultFrigate1",
		RequiredResearch =		"MultiCannonTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		201,
		DisplayedName =			"Advanced Assault Frigate",
		Description = "<b>Description:</b> Advanced Anti-Fighter Frigate, equipped with: \n5 Flechette Turret \nConcussion Missile Launcher \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuild time: 50 s \nMaintenance cost: 14 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nFrigate Facility \nMulti Cannons Technology \n7 crew members"    
	},
	
--	{ 
--		Type = 					Ship, 
--		ThingToBuild = 			"Vgr_TransportFrigate",
--		RequiredResearch =		"FrigateTransport",
--		RequiredShipSubSystems =	"FrigateProduction",
--		DisplayPriority =		210,
--		DisplayedName =			"Transport Frigate (Unit Transport) (400 RUs)",
--		Description =			"" 
--	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_HeavyMissileFrigate",
		RequiredResearch =		"HeavyMissileFrigate",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		220,
		DisplayedName =			"$7148",
		Description = "<b>Description:</b> Basic Frigate, equipped with: \nFusion Missile Launcher \nHeavy Concussion Missile Launcher \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nHeavy Missile Frigate Technology \n6 crew members"     
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_HeavyMissileFrigate1",
		RequiredResearch =		"HeavyMissileFrigate",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		220,
		DisplayedName =			"$7148",
		Description = "<b>Description:</b> Basic Frigate, equipped with: \nFusion Missile Launcher \nHeavy Concussion Missile Launcher \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuild time: 45 s \nMaintenance cost: 12 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nHeavy Missile Frigate Technology \n6 crew members"     
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_InfiltratorFrigate",
		RequiredResearch =		"FrigateInfiltrationTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		230,
		DisplayedName =			"$7150",
		Description = "<b>Description:</b> Frigate capable of initiating boarding actions and capturing enemy ships or Mining Bases, equipped with: \nFlechette Turret \nPerforation Pods Launcher (when upgraded) \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuil time: 50 s \nMaintenance cost: 15 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nInfiltration Pod Technology \n7 crew members"        
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_InfiltratorFrigate1",
		RequiredResearch =		"FrigateInfiltrationTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		230,
		DisplayedName =			"$7150",
		Description = "<b>Description:</b> Frigate capable of initiating boarding actions and capturing enemy ships or Mining Bases, equipped with: \nFlechette Turret \nPerforation Pods Launcher (when upgraded) \n\n<b>Type:</b> Frigate \nCost: 800 RUs \nBuil time: 50 s \nMaintenance cost: 15 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nInfiltration Pod Technology \n7 crew members"        
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_SupportFrigateArmed",
		RequiredResearch =		"SupportFrigateArmedTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		231,
		DisplayedName =			"Support Frigate",
		Description = "<b>Description:</b> Frigate capable of repair friendly frigates and disrupt nearby enemy ships, equipped with: \n6 Electro Magnetic Pulse Emitter \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuil time: 55 s \nMaintenance cost: 15 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Facility \nSupport Frigate Technology \n7 crew members"               
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_SupportFrigateArmed1",
		RequiredResearch =		"SupportFrigateArmedTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		231,
		DisplayedName =			"Support Frigate",
		Description = "<b>Description:</b> Frigate capable of repair friendly frigates and disrupt nearby enemy ships, equipped with: \n6 Electro Magnetic Pulse Emitter \n\n<b>Type:</b> Frigate \nCost: 850 RUs \nBuil time: 55 s \nMaintenance cost: 15 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Facility \nSupport Frigate Technology \n7 crew members"               
	},
  
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_SupportFrigate",
		RequiredResearch =		"SupportFrigateTech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		232,
		DisplayedName =			"Plasma Frigate",
		Description = "<b>Description:</b> Plasma Frigate, equipped with: \n6 Plasma Cannons \n\n<b>Type:</b> Frigate \nCost: 900 RUs \nBuil time: 55 s \nMaintenance cost: 17 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nPlasma Frigate Technology \n8 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_SupportFrigate1",
		RequiredResearch =		"supportfrigatetech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		232,
		DisplayedName =			"Plasma Frigate",
		Description = "<b>Description:</b> Plasma Frigate, equipped with: \n6 Plasma Cannons \n\n<b>Type:</b> Frigate \nCost: 900 RUs \nBuil time: 55 s \nMaintenance cost: 17 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nPlasma Frigate Technology \n8 crew members"       
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_SupportFrigate_laser",
		RequiredResearch =		"SupportFrigate_LaserTech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		233,
		DisplayedName =			"Concussion Frigate",
		Description = "<b>Description:</b> Concussion Frigate, equipped with: \n6 Concussion Cannons \n\n<b>Type:</b> Frigate \nCost: 900 RUs \nBuil time: 55 s \nMaintenance cost: 17 RUs / year \nStrong vs: Subsystems, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nConcussion Frigate Technology \n8 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_SupportFrigate_laser1",
		RequiredResearch =		"SupportFrigate_LaserTech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		233,
		DisplayedName =			"Concussion Frigate",
		Description = "<b>Description:</b> Concussion Frigate, equipped with: \n6 Concussion Cannons \n\n<b>Type:</b> Frigate \nCost: 900 RUs \nBuil time: 55 s \nMaintenance cost: 17 RUs / year \nStrong vs: Subsystems, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nConcussion Frigate Technology \n8 crew members"       
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ArtilleryFrigate",
		RequiredResearch =		"ArtilleryGunTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		234,
		DisplayedName =			"Artillery Frigate",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Frigate, equipped with: \n2 Laser Pulsers \n\n<b>Type:</b> Frigate \nCost: 900 RUs \nBuil time: 55 s \nMaintenance cost: 17 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nArtillery Frigate Technology \n8 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ArtilleryFrigate1",
		RequiredResearch =		"ArtilleryGunTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		234,
		DisplayedName =			"Artillery Frigate",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Frigate, equipped with: \n2 Laser Pulsers \n\n<b>Type:</b> Frigate \nCost: 900 RUs \nBuil time: 55 s \nMaintenance cost: 17 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nArtillery Frigate Technology \n8 crew members"       
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_EmpFrigate",
		RequiredResearch =		"deathtech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		235,
		DisplayedName =			"Warfare Frigate",
		Description = "<b>Description:</b> Advanced Support Frigate, equipped with: \n2 Light Plasma Lance \nFusion Missile Launcher (when upgraded) \n2 Electro Magnetic Pulse Emitter \n\n<b>Type:</b> Frigate \nCost: 1100 RUs \nBuil time: 60 s \nMaintenance cost: 18 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nFrigate Facility \nWarfare Frigate Technology \n8 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_EmpFrigate1",
		RequiredResearch =		"deathtech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		235,
		DisplayedName =			"Warfare Frigate",
		Description = "<b>Description:</b> Advanced Support Frigate, equipped with: \n2 Light Plasma Lance \nFusion Missile Launcher (when upgraded) \n2 Electro Magnetic Pulse Emitter \n\n<b>Type:</b> Frigate \nCost: 1100 RUs \nBuil time: 60 s \nMaintenance cost: 18 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nFrigate Facility \nWarfare Frigate Technology \n8 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LongRangeArtilleryFrigate",
		RequiredResearch =		"LongRangeArtilleryGunTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		236,
		DisplayedName =			"Heavy Cannon Frigate",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Frigate, equipped with: \n2 Kinetic Cannons \nHeavy Concussion Missile Launcher \nAnti-Capital Ship Mortar Missile Launcher (when upgraded) \n\n<b>Type:</b> Frigate \nCost: 1300 RUs \nBuil time: 70 s \nMaintenance cost: 20 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nHeavy Cannon Frigate Technology \n9 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LongRangeArtilleryFrigate1",
		RequiredResearch =		"LongRangeArtilleryGunTech",
		RequiredShipSubSystems =	"FrigateProduction",
		DisplayPriority =		236,
		DisplayedName =			"Heavy Cannon Frigate",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Frigate, equipped with: \n2 Kinetic Cannons \nHeavy Concussion Missile Launcher \nAnti-Capital Ship Mortar Missile Launcher (when upgraded) \n\n<b>Type:</b> Frigate \nCost: 1300 RUs \nBuil time: 70 s \nMaintenance cost: 20 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nFrigate Facility \nResearch Division \nHeavy Cannon Frigate Technology \n9 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_commandfrigate",
		RequiredResearch =		"CommandFrigateTech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		237,
		DisplayedName =			"Escort Frigate",
		Description = "<b>Description:</b> Escort Frigate, a decently armoured multipurpose frigate featured with excellent coverage and fire rate, ideal for covering mission, equipped with: \n2 Plasma Cannons \n3 Lance Turrets \n\n<b>Type:</b> Frigate \nCost: 1400 RUs \nBuil time: 70 s \nMaintenance cost: 19 RUs / year \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Facility \nEscort Frigate Technology \n8 crew members"       
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_commandfrigate1",
		RequiredResearch =		"CommandFrigateTech",
		RequiredShipSubSystems = "FrigateProduction",		
		DisplayPriority =		237,
		DisplayedName =			"Escort Frigate",
		Description = "<b>Description:</b> Escort Frigate, a decently armoured multipurpose frigate featured with excellent coverage and fire rate, ideal for covering mission, equipped with: \n2 Plasma Cannons \n3 Lance Turrets \n\n<b>Type:</b> Frigate \nCost: 1400 RUs \nBuil time: 70 s \nMaintenance cost: 19 RUs / year \nStrong vs: Fighters, Corvettes, Frigates \n\n<b>Prerequisites:</b> \nFrigate Facility \nEscort Frigate Technology \n8 crew members"       
	},

--	{ 
--		Type = 					Ship, 
--		ThingToBuild = 			"Vgr_LRCTS",
--		RequiredResearch =		"",
--		RequiredShipSubSystems = "FrigateProduction",
--		DisplayPriority =		10002,
--		DisplayedName =			"LRCTS Frigate",
--		Description =			"<b>Description:</b> LRCTS Frigate \n\n<b>Strong vs:</b> Firgates, Capital Ships \n<b>Weak vs:</b> Fighters, Corvettes, Bombers, Big Capital Ships\n\n<b>Required:</b> \nFrigate Facility." 
--	},

	-- Capital Ships ----------

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Destroyer",
		RequiredResearch =		"DestroyerGuns",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		309,
		DisplayedName =			"$7152",
		Description = "<b>Description:</b> Anti-Frigate Capital Ship, equipped with: \n2 Flechette Cannons (customizable) \n4 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \nAnti-Capital Ship Heavy Mine (when upgraded) \n4 Hull Defense Guns \n\n<b>Type:</b> Capital Ship \nCost: 2000 RUs \nBuil time: 165 s \nMaintenance cost: 55 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nDestroyer Chassis Technology \n1 officer \n15 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Destroyer1",
		RequiredResearch =		"DestroyerGuns",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		309,
		DisplayedName =			"$7152",
		Description = "<b>Description:</b> Anti-Frigate Capital Ship, equipped with: \n2 Flechette Cannons (customizable) \n4 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \nAnti-Capital Ship Heavy Mine (when upgraded) \n4 Hull Defense Guns \n\n<b>Type:</b> Capital Ship \nCost: 2000 RUs \nBuil time: 165 s \nMaintenance cost: 55 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nDestroyer Chassis Technology \n1 officer \n15 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_pulsedestroyer",
		RequiredResearch =		"PulseDestroyerGuns",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		310,
		DisplayedName =			"Flotilla Leader",
		Description = "<b>Description:</b> Anti-Frigate Capital Ship, equipped with: \n1 Double Kinetic Cannon Turret \n2 Kinetic Cannon Turrets \n4 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \nAnti-Capital Ship Heavy Mine (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 2500 RUs \nBuil time: 175 s \nMaintenance cost: 75 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nFlotilla Leader Chassis Technology \n1 officer \n15 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_PulseDestroyer1",
		RequiredResearch =		"PulseDestroyerGuns",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		310,
		DisplayedName =			"Flotilla Leader",
		Description = "<b>Description:</b> Anti-Frigate Capital Ship, equipped with: \n1 Double Kinetic Cannon Turret \n2 Kinetic Cannon Turrets \n4 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \nAnti-Capital Ship Heavy Mine (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 2500 RUs \nBuil time: 175 s \nMaintenance cost: 75 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nFlotilla Leader Chassis Technology \n1 officer \n15 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_AM",
		RequiredResearch =		"AMGuns",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		311,
		DisplayedName =			"Guardian",
		Description = "<b>Description:</b> Advanced Anti-Missile Capital Ship, fires at any incoming missile/bomb or mine, it can also deploy heavy mine fields, equipped with: \n4 Fast Tracking Turrets \nMine Layer \nIntegrated Fedense Field \n\n<b>Type:</b> Capital Ship \nCost: 2500 RUs \nBuil time: 165 s \nMaintenance cost: 55 RUs / year \nStrong vs: Missile, Bomb, Mine \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nGuardian Chassis Technology \n12 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_AM1",
		RequiredResearch =		"AMGuns",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		311,
		DisplayedName =			"Guardian",
		Description = "<b>Description:</b> Advanced Anti-Missile Capital Ship, fires at any incoming missile/bomb or mine, it can also deploy heavy mine fields, equipped with: \n4 Fast Tracking Turrets \nMine Layer \nIntegrated Fedense Field \n\n<b>Type:</b> Capital Ship \nCost: 2500 RUs \nBuil time: 165 s \nMaintenance cost: 55 RUs / year \nStrong vs: Missile, Bomb, Mine \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nGuardian Chassis Technology \n12 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Cruiser",
		RequiredResearch =		"CruiserTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		312,
		DisplayedName =			"Valkyrie",
		Description = "<b>Description:</b> Cruiser-Class Multi-Role Combat Vessel, equipped with: \n1 Chain Gun \n2 Kinetic Cannon Turrets \n12 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \n1 Advanced Anti-Capital Ship Heavy Sperm Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nValkyrie Chassis Technology \n2 officer \n20 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Cruiser1",
		RequiredResearch =		"CruiserTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		312,
		DisplayedName =			"Valkyrie",
		Description = "<b>Description:</b> Cruiser-Class Multi-Role Combat Vessel, equipped with: \n1 Chain Gun \n2 Kinetic Cannon Turrets \n12 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \n1 Advanced Anti-Capital Ship Heavy Sperm Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships (when upgraded) \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nValkyrie Chassis Technology \n2 officer \n20 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_artilleryship",
		RequiredResearch =		"ArtilleryTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		313,
		DisplayedName =			"Artillery Cruiser",
		Description = "<b>Description:</b> Advanced Long-Range Anti-Frigate/Capital Ship, equipped with: \n5 Anti-Capital Ship Mortar Missile Launcher \n1 Special slot \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nArtillery Cruiser Chassis Technology \n2 officer \n20 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_artilleryship1",
		RequiredResearch =		"ArtilleryTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		313,
		DisplayedName =			"Artillery Cruiser",
		Description = "<b>Description:</b> Advanced Long-Range Anti-Frigate/Capital Ship, equipped with: \n5 Anti-Capital Ship Mortar Missile Launcher \n1 Special slot \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nArtillery Cruiser Chassis Technology \n2 officer \n20 crew members"  
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LightCruiser",
		RequiredResearch =		"IonCruiserTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		314,
		DisplayedName =			"Armoured Cruiser - Type A",
		Description = "<b>Description:</b> Advanced Anti-Frigate/Capital Ship, equipped with: \n2 Heavy Ion Cannon Turrets \n8 Flechette Turret \n8 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nArmoured Cruiser Chassis Technology \n2 officer \n20 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LightCruiser1",
		RequiredResearch =		"IonCruiserTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		314,
		DisplayedName =			"Armoured Cruiser - Type A",
		Description = "<b>Description:</b> Advanced Anti-Frigate/Capital Ship, equipped with: \n2 Heavy Ion Cannon Turrets \n8 Flechette Turret \n8 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nArmoured Cruiser Chassis Technology \n2 officer \n20 crew members"  
	},
    { 
        Type = Ship, 
        ThingToBuild = "vgr_lightcruiser_icon", 
        RequiredResearch = "unbuildable", 
        RequiredShipSubSystems = "", 
        DisplayPriority = 314, 
        DisplayedName = "", 
        Description = "" },
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LightCruiser_Gun",
		RequiredResearch =		"IonCruiserTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		315,
		DisplayedName =			"Armoured Cruiser - Type B",
		Description = "<b>Description:</b> Advanced Anti-Frigate/Capital Ship, equipped with: \n2 Heavy Blasters \n8 Flechette Turret \n8 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nArmoured Cruiser Chassis Technology \n2 officer \n20 crew members"  
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_LightCruiser_Gun1",
		RequiredResearch =		"IonCruiserTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		315,
		DisplayedName =			"Armoured Cruiser - Type B",
		Description = "<b>Description:</b> Advanced Anti-Frigate/Capital Ship, equipped with: \n2 Heavy Blasters \n8 Flechette Turret \n8 Anti-Capital Ship Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 210 s \nMaintenance cost: 100 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nArmoured Cruiser Chassis Technology \n2 officer \n20 crew members"  
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Carrier",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		300,
		DisplayedName =			"$7154",
		Description = "<b>Description:</b> Capital Class Production Ship, equipped with: \n1 Production slot \n2 Module slots \n1 Special slot \n2 Resource Drop-Off points \n4 Hull Defense Guns \n\n<b>Type:</b> Capital Ship \nCost: 1700 RUs \nBuil time: 50 s \nMaintenance cost: 100 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nCapital Ship Facility \n2 officers \n30 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Carrier1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		300,
		DisplayedName =			"$7154",
		Description = "<b>Description:</b> Capital Class Production Ship, equipped with: \n1 Production slot \n2 Module slots \n1 Special slot \n2 Resource Drop-Off points \n4 Hull Defense Guns \n\n<b>Type:</b> Capital Ship \nCost: 1700 RUs \nBuil time: 50 s \nMaintenance cost: 100 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nCapital Ship Facility \n2 officers \n30 crew members" 
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_BattleCarrier",
		RequiredResearch =		"BattlecarrierTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		319,
		DisplayedName =			"Escort Carrier",
		Description = "<b>Description:</b> Capital Class Production Ship, equipped with: \n1 Production slot \n2 Module slots \n7 Special slot \n4 Hull Defense Guns \n2 Fast Tracking Turrets \n4 Anti-Frigate/Capital Ships Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 85 s \nMaintenance cost: 100 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \n\nAdvanced Capital Facility \nEscort Carrier Chassis Technology (Commander Rank) \n2 officers \n30 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_BattleCarrier1",
		RequiredResearch =		"BattlecarrierTech",
		RequiredShipSubSystems =	"CapShipProduction",
		DisplayPriority =		319,
		DisplayedName =			"Escort Carrier",
		Description = "<b>Description:</b> Capital Class Production Ship, equipped with: \n1 Production slot \n2 Module slots \n7 Special slot \n4 Hull Defense Guns \n2 Fast Tracking Turrets \n4 Anti-Frigate/Capital Ships Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 85 s \nMaintenance cost: 100 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \n\nAdvanced Capital Facility \nEscort Carrier Chassis Technology (Commander Rank) \n2 officers \n30 crew members" 
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Sinner",
		RequiredResearch =		"SinnerTech",
		RequiredShipSubSystems = "Hyperspace", 
		DisplayPriority =		320,
		DisplayedName =			"Tank",
		Description = "<b>Description:</b> Capital Class Breakage Ship, very resistant, can transport a lot of fighter and corvettes in battle, equipped with: \n1 Module slot \n6 Modular weapon slots \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 200 s \nMaintenance cost: 100 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTank Chassis Technology (Commander Rank) \n2 officers \n20 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Sinner1",
		RequiredResearch =		"SinnerTech",
		RequiredShipSubSystems = "Hyperspace", 
		DisplayPriority =		320,
		DisplayedName =			"Tank",
		Description = "<b>Description:</b> Capital Class Breakage Ship, very resistant, can transport a lot of fighter and corvettes in battle, equipped with: \n1 Module slot \n6 Modular weapon slots \n\n<b>Type:</b> Capital Ship \nCost: 3000 RUs \nBuil time: 200 s \nMaintenance cost: 100 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nTank Chassis Technology (Commander Rank) \n2 officers \n20 crew members" 
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ShipYard",
		RequiredResearch =		"ShipyardTech",
		RequiredShipSubSystems =	"Hyperspace | LaserCannon4",
		DisplayPriority =		323,
		DisplayedName =			"$7156",
		Description = "<b>Description:</b> Capital Class Production Ship, this ship is so massive it can only Hyperspace into battle, equipped with: \n4 Production slots \n6 Module slots \n1 Special slot \n2 Resource Drop-Off points \n12 Hull Defense Guns \n\n<b>Type:</b> Capital Ship \nCost: 4000 RUs \nBuil time: 95 s \nMaintenance cost: 150 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nShipyard Chassis Technology (Commander Rank) \n3 officers \n40 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ShipYard1",
		RequiredResearch =		"ShipyardTech",
		RequiredShipSubSystems =	"Hyperspace | LaserCannon4",
		DisplayPriority =		323,
		DisplayedName =			"$7156",
		Description = "<b>Description:</b> Capital Class Production Ship, this ship is so massive it can only Hyperspace into battle, equipped with: \n4 Production slots \n6 Module slots \n1 Special slot \n2 Resource Drop-Off points \n12 Hull Defense Guns \n\n<b>Type:</b> Capital Ship \nCost: 4000 RUs \nBuil time: 95 s \nMaintenance cost: 150 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nHyperspace Module (on board) \nShipyard Chassis Technology (Commander Rank) \n3 officers \n40 crew members" 
	},		

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_hammerhead",
		RequiredResearch =		"KeeperIonWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCaptain", 
		DisplayPriority =		325,
		DisplayedName =			"Hammerhead",
		Description = "<b>Description:</b> Advanced Combat Vessel, explosion damages nearby ships, equipped with: \n2 Microwave Cannons \n8 Kinetic Drivers \nPhase Shift Armour (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 4000 RUs \nBuil time: 240 s \nMaintenance cost: 85 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nHammerhead Chassis Technology \nCaptain Rank (150 Honor points) \n1 officers \n10 crew members"
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_hammerhead1",
		RequiredResearch =		"KeeperIonWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCaptain", 
		DisplayPriority =		325,
		DisplayedName =			"Hammerhead",
		Description = "<b>Description:</b> Advanced Combat Vessel, explosion damages nearby ships, equipped with: \n2 Microwave Cannons \n8 Kinetic Drivers \nPhase Shift Armour (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 4000 RUs \nBuil time: 240 s \nMaintenance cost: 85 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nResearch Division \nHammerhead Chassis Technology \nCaptain Rank (150 Honor points) \n1 officers \n10 crew members"
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_BattleCruiser",
		RequiredResearch =		"BattlecruiserIonWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCaptain", 
		DisplayPriority =		330,
		DisplayedName =			"$7158",
		Description = "<b>Description:</b> Capital Ships Killer, equipped with: \n2 Module slots \n4 Special slots \nHeavy Laser Pulser \n5 Hull Defense Guns \n4 Pulsar Laser Guns \n8 Anti-Frigate/Capital Ships Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 4000 RUs \nBuil time: 280 s \nMaintenance cost: 125 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nBattlecruiser Chassis Technology \nCaptain Rank (150 Honor points) \n3 officers \n30 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_BattleCruiser1",
		RequiredResearch =		"BattlecruiserIonWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCaptain",
		DisplayPriority =		330,
		DisplayedName =			"$7158",
		Description = "<b>Description:</b> Capital Ships Killer, equipped with: \n2 Module slots \n4 Special slots \nHeavy Laser Pulser \n5 Hull Defense Guns \n4 Pulsar Laser Guns \n8 Anti-Frigate/Capital Ships Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 4000 RUs \nBuil time: 280 s \nMaintenance cost: 125 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nBattlecruiser Chassis Technology \nCaptain Rank (150 Honor points) \n3 officers \n30 crew members"
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_battlecruiser_hero",
		RequiredResearch =		"BattlecruiserNukeWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isFleetAdmiral", 
		DisplayPriority =		331,
		DisplayedName =			"Battlecruiser (Strategic)",
		Description = "<b>Description:</b> Nuclear Capital Ship Killer, equipped with: \n2 Module slots \n2 Quick-Load Nuke Cannons (can be upgraded with MIRV) \n5 Hull Defense Guns \n4 Pulsar Laser Guns \n13 Doom Missile Launchers \n\n<b>Type:</b> Capital Ship \nCost: 11500 RUs \nBuil time: 620 s \nMaintenance cost: 525 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nBattlecruiser Chassis Technology \nBattlecruiser Fusion \nBattlecruiser Strategic Rounds \nFleet Admiral Rank (480 Honor points) \n3 officers \n30 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_battlecruiser_hero1",
		RequiredResearch =		"BattlecruiserNukeWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isFleetAdmiral",
		DisplayPriority =		331,
		DisplayedName =			"Battlecruiser (Strategic)",
		Description = "<b>Description:</b> Nuclear Capital Ship Killer, equipped with: \n2 Module slots \n2 Quick-Load Nuke Cannons (can be upgraded with MIRV) \n5 Hull Defense Guns \n4 Pulsar Laser Guns \n13 Doom Missile Launchers \n\n<b>Type:</b> Capital Ship \nCost: 11500 RUs \nBuil time: 620 s \nMaintenance cost: 525 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nBattlecruiser Chassis Technology \nBattlecruiser Fusion \nBattlecruiser Strategic Rounds \nFleet Admiral Rank (480 Honor points) \n3 officers \n30 crew members"
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MissileBattleCruiser",
		RequiredResearch =		"MissileBattlecruiserIonWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "", 
		DisplayPriority =		332,
		DisplayedName =			"Missile Battlecruiser",
		Description = "<b>Description:</b> Capital Ships Killer, equipped with: \n2 Module slots \n2 Special slots \n2 Heavy Laser Pulser \n5 Hull Defense Guns \n2 Pulsar Laser Guns \n15 Anti-Frigate/Capital Ships Fusion Missile Launcher (if enabled) \n\n<b>Type:</b> Capital Ship \nCost: 5000 RUs \nBuil time: 320 s \nMaintenance cost: 125 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nMissile Battlecruiser Chassis Technology (Captain Rank) \n3 officers \n30 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MissileBattleCruiser1",
		RequiredResearch =		"MissileBattlecruiserIonWeapons",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "", 
		DisplayPriority =		332,
		DisplayedName =			"Missile Battlecruiser",
		Description = "<b>Description:</b> Capital Ships Killer, equipped with: \n2 Module slots \n2 Special slots \n2 Heavy Laser Pulser \n5 Hull Defense Guns \n2 Pulsar Laser Guns \n15 Anti-Frigate/Capital Ships Fusion Missile Launcher (if enabled) \n\n<b>Type:</b> Capital Ship \nCost: 5000 RUs \nBuil time: 320 s \nMaintenance cost: 125 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nMissile Battlecruiser Chassis Technology (Captain Rank) \n3 officers \n30 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_MinelayerDrone",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"vgr_mbc_d",
		RequiredFleetSubSystems = "", 
		DisplayPriority =		5,
		DisplayedName =			"Mine Drone",
		Description = "<b>Description:</b> Utility Drone, can deploy mines (9 units max), equipped with: \nMine Sweeper \nMine Deploying System \n\n<b>Type:</b> Utility \nCost: 800 RUs \nBuild time: 40 s \nMaintenance cost: None \nStrong vs: Frigate/Capital Ships \n\n<b>Prerequisites:</b> \nDrone Battery \nResearch Division"
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_heavycruiser",
		RequiredResearch =		"PeacemakerTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCaptain", 
		DisplayPriority =		334,
		DisplayedName =			"Peacemaker",
		Description = "<b>Description:</b> Multi-Purpose Support Vessel, equipped with: \n1 Module slot \n6 Special slots \nCan build: Probes, Subsystems \nCan dock and hold: Fighters, Corvettes, Frigates, Capital Ships \n\n<b>Type:</b> Capital Ship \nCost: 5000 RUs \nBuil time: 300 s \nMaintenance cost: 135 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nPeacemaker Chassis Technology \nCaptain Rank (150 Honor points) \n3 officers \n30 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_heavycruiser1",
		RequiredResearch =		"PeacemakerTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCaptain", 
		DisplayPriority =		334,
		DisplayedName =			"Peacemaker",
		Description = "<b>Description:</b> Multi-Purpose Support Vessel, equipped with: \n1 Module slot \n6 Special slots \nCan build: Probes, Subsystems \nCan dock and hold: Fighters, Corvettes, Frigates, Capital Ships \n\n<b>Type:</b> Capital Ship \nCost: 5000 RUs \nBuil time: 300 s \nMaintenance cost: 135 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nPeacemaker Chassis Technology \nCaptain Rank (150 Honor points) \n3 officers \n30 crew members"
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_alkhalid",
		RequiredResearch =		"BattleshipTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCommodore",
		DisplayPriority =		335,
		DisplayedName =			"Orca",
		Description = "<b>Description:</b> Death Vessel, equipped with: \n11 Special slots \nAnti Capital Ships Heavy Mine (when upgraded) \n8 Anti-Frigate/Capital Ships Fusion Missile Launcher (when upgraded) \n8 Anti-Corvette/Frigate Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 6000 RUs \nBuil time: 360 s \nMaintenance cost: 150 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nOrca Chassis Technology \nCommodore Rank (240 Honor points) \n3 officers \n35 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_alkhalid1",
		RequiredResearch =		"BattleshipTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCommodore",
		DisplayPriority =		335,
		DisplayedName =			"Orca",
		Description = "<b>Description:</b> Death Vessel, equipped with: \n11 Special slots \nAnti Capital Ships Heavy Mine (when upgraded) \n8 Anti-Frigate/Capital Ships Fusion Missile Launcher (when upgraded) \n8 Anti-Corvette/Frigate Fusion Missile Launcher (when upgraded) \n\n<b>Type:</b> Capital Ship \nCost: 6000 RUs \nBuil time: 360 s \nMaintenance cost: 150 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nOrca Chassis Technology \nCommodore Rank (240 Honor points) \n3 officers \n35 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_dreadnaught",
		RequiredResearch =		"DreadnaughtTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCommodore",
		DisplayPriority =		340,
		DisplayedName =			"Dreadnaught",
		Description = "<b>Description:</b> Advanced Death Vessel, equipped with: \n12 Anti Capital Ships heavy ion cannons \n3 Double Kinetic Cannon Turrets \n\n<b>Type:</b> Capital Ship \nCost: 8000 RUs \nBuil time: 460 s \nMaintenance cost: 175 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nDreadnaught Chassis Technology \nCommodore Rank (240 Honor points) \n3 officers \n35 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_dreadnaught1",
		RequiredResearch =		"DreadnaughtTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCommodore",
		DisplayPriority =		340,
		DisplayedName =			"Dreadnaught",
		Description = "<b>Description:</b> Advanced Death Vessel, equipped with: \n12 Anti Capital Ships heavy ion cannons \n3 Double Kinetic Cannon Turrets \n\n<b>Type:</b> Capital Ship \nCost: 8000 RUs \nBuil time: 460 s \nMaintenance cost: 175 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nDreadnaught Chassis Technology \nCommodore Rank (240 Honor points) \n3 officers \n35 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_dreadnaughtB",
		RequiredResearch =		"DreadnaughtTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCommodore",
		DisplayPriority =		339,
		DisplayedName =			"Overlord",
		Description = "<b>Description:</b> Prototype of Dreadnaught, equipped with: \n12 Anti Capital Ships heavy ion cannons \n4 Free Ion Cannons \n2 Double Kinetic Cannon Turrets \n2 Cluster Missile Lacunchers \n\n<b>Type:</b> Capital Ship \nCost: 8000 RUs \nBuil time: 460 s \nMaintenance cost: 175 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nDreadnaught Chassis Technology \nCommodore Rank (240 Honor points) \n3 officers \n35 crew members"
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_dreadnaughtB1",
		RequiredResearch =		"DreadnaughtTech",
		RequiredShipSubSystems =	"CapshipProduction",
		RequiredFleetSubSystems = "isCommodore",
		DisplayPriority =		339,
		DisplayedName =			"Overlord",
		Description = "<b>Description:</b> Prototype of Dreadnaught, equipped with: \n12 Anti Capital Ships heavy ion cannons \n4 Free Ion Cannons \n2 Double Kinetic Cannon Turrets \n2 Cluster Missile Lacunchers \n\n<b>Type:</b> Capital Ship \nCost: 8000 RUs \nBuil time: 460 s \nMaintenance cost: 175 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nAdvanced Capital Facility \nResearch Division \nDreadnaught Chassis Technology \nCommodore Rank (240 Honor points) \n3 officers \n35 crew members"
	},
--	{ 
--		Type = 					Ship, 
--		ThingToBuild = 			"vgr_tmatship",
--		RequiredResearch =		"PlanetKillerTech",
--		RequiredShipSubSystems =	"CapshipProduction & Hyperspace",
--		RequiredFleetSubSystems = "IsAdmiral",
--		DisplayPriority =		345,
--		DisplayedName =			"Planet Killer",
--		Description = "<b>Description:</b> Sci-Fi Death Machine, equipped with: \n1 Super Attractive Beam \n\n<b>Type:</b> Capital Ship \nCost: 11000 RUs \nBuil time: 700 s \nMaintenance cost: 240 RUs / year \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nCapital Facility \nHyperspace Module \nResearch Division \nDreadnaught Chassis Technology \nAdmiral Rank (350 Honor points)"
--	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ArtilleryBattlecruiser",
		RequiredResearch =		"SajuukTech | SajuukTechAI",
		RequiredShipSubSystems =	"Hyperspace",
     		RequiredFleetSubSystems = "isFleetAdmiral", 
		DisplayPriority =		355,
		DisplayedName =			"The Mother Of All Ships",
		Description =			"<b>Description:</b> The Mother of All Ships, equipped with: \n1 Solar Charge \n10 Small Missile Launchers \n\n<b>Type:</b> Capital Ship \nCost: 100000 RUs \nBuil time: 600 s \nMaintenance cost: 500 RUs / year \n<b>Srong vs:</b> Capital Ships \n<b>Weak vs:</b> Hax! \n\n<b>Prerequisites:</b> \nHyperspace Module \nResearch Division \nProject Colossus \nFleet Admiral Rank"
	},

	-- Platforms --------------

	{ 
		Type =					Ship, 
		ThingToBuild =			"Vgr_WeaponPlatform_gun",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		400,
		DisplayedName =			"$7160",
		Description = "<b>Description:</b> Anti-Fighter/Corvette Weapon Platform, equipped with: \n2 Long Range Flechette Turrets \nAnti-Missile System (when upgraded) \n\n<b>Type:</b> Platform \nCost: 400 RUs \nBuil time: 30 s \nMaintenance cost: 2 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nPlatform Control Module \n1 crew member"   
	},
	{ 
		Type =					Ship, 
		ThingToBuild =			"Vgr_WeaponPlatform_gun1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		400,
		DisplayedName =			"$7160",
		Description = "<b>Description:</b> Anti-Fighter/Corvette Weapon Platform, equipped with: \n2 Long Range Flechette Turrets \nAnti-Missile System (when upgraded) \n\n<b>Type:</b> Platform \nCost: 400 RUs \nBuil time: 30 s \nMaintenance cost: 2 RUs / year \nStrong vs: Fighters, Corvettes \n\n<b>Prerequisites:</b> \nPlatform Control Module \n1 crew member"   
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_WeaponPlatform_lance",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		405,
		DisplayedName =			"Lance Platform",
		Description = "<b>Description:</b> Anti-Corvette/Frigate Weapon Platform, equipped with: \n2 Long Range Lance Turrets \n\n<b>Type:</b> Platform \nCost: 400 RUs \nBuil time: 30 s \nMaintenance cost: 2 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nPlatform Control Module \n1 crew member"    
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_WeaponPlatform_lance1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		405,
		DisplayedName =			"Lance Platform",
		Description = "<b>Description:</b> Anti-Corvette/Frigate Weapon Platform, equipped with: \n2 Long Range Lance Turrets \n\n<b>Type:</b> Platform \nCost: 400 RUs \nBuil time: 30 s \nMaintenance cost: 2 RUs / year \nStrong vs: Corvettes, Frigates \n\n<b>Prerequisites:</b> \nPlatform Control Module \n1 crew member"    
	},	

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_WeaponPlatform_missile",
		RequiredResearch =		"PlatformHeavyMissiles",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		410,
		DisplayedName =			"$7162",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Weapon Platform, equipped with: \nLong Range Fusion Missile Launcher \n\n<b>Type:</b> Platform \nCost: 400 RUs \nBuil time: 30 s \nMaintenance cost: 4 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nPlatform Control Module \nResearch Division \nPlatform Missile Technology \n2 crew members"    
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_WeaponPlatform_missile1",
		RequiredResearch =		"PlatformHeavyMissiles",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		410,
		DisplayedName =			"$7162",
		Description = "<b>Description:</b> Anti-Frigate/Capital Ships Weapon Platform, equipped with: \nLong Range Fusion Missile Launcher \n\n<b>Type:</b> Platform \nCost: 400 RUs \nBuil time: 30 s \nMaintenance cost: 4 RUs / year \nStrong vs: Frigates, Capital Ships \n\n<b>Prerequisites:</b> \nPlatform Control Module \nResearch Division \nPlatform Missile Technology \n2 crew members"    
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_mobile_inhibitor",
		RequiredResearch =		"PlatformIED",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		430,
		DisplayedName =			"M.A.D. Platform",
		Description = "<b>Description:</b> Mutually Assured Destruction Device, can be equipped with Hyperspace Inhibitor after upgrades \n\n<b>Type:</b> Platform \nCost: 2000 RUs \nBuil time: 100 s \nMaintenance cost: 10 RUs / year \nStrong vs: none \n\n<b>Prerequisites:</b> \nPlatform Control Module \nM.A.D. Technology \n4 crew members"    
	},
		{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_mobile_inhibitor1",
		RequiredResearch =		"PlatformIED",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		430,
		DisplayedName =			"M.A.D. Platform",
		Description = "<b>Description:</b> Mutually Assured Destruction Device, can be equipped with Hyperspace Inhibitor after upgrades \n\n<b>Type:</b> Platform \nCost: 2000 RUs \nBuil time: 100 s \nMaintenance cost: 10 RUs / year \nStrong vs: none \n\n<b>Prerequisites:</b> \nPlatform Control Module \nM.A.D. Technology \n4 crew members"    
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_cloakplatform",
		RequiredResearch =		"CloakPlatform",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		431,
		DisplayedName =			"Cloak Generator",
		Description = "<b>Description:</b> Generates Cloak Field to hide own ships with a radius (2000m) \n\n<b>Type:</b> Platform \nCost: 2500 RUs \nBuil time: 150 s \nMaintenance cost: 10 RUs / year \nStrong vs: none \n\n<b>Prerequisites:</b> \nPlatform Control Module \nCloak Generator Technology \n4 crew members"    
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_cloakplatform1",
		RequiredResearch =		"CloakPlatform",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		431,
		DisplayedName =			"Cloak Generator",
		Description = "<b>Description:</b> Generates Cloak Field to hide own ships with a radius (2000m) \n\n<b>Type:</b> Platform \nCost: 2500 RUs \nBuil time: 150 s \nMaintenance cost: 10 RUs / year \nStrong vs: none \n\n<b>Prerequisites:</b> \nPlatform Control Module \nCloak Generator Technology \n4 crew members"    
	},
	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Cruse",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FireControlTower",
		RequiredFleetSubSystems = "", 
		DisplayPriority =		530,
		DisplayedName =			"Medium-Range Cruiser Missile (Tube 1)",
		Description = "<b>Description:</b> Missile Tube, Anti-Capital Ship medium-range auto-aiming missile launcher, the Cruiser Missile automatically engages enemy Capital Ships within a medium radius, the missile do more damage if the target is close to the launching ship, if there are no enemies in the area the Cruiser will self destroy (max 3 units per tube) \n\n<b>Type:</b> Missile \nRange: 45 Km \nCost: 2000 RUs \nBuil time: none \nMaintenance cost: none \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nFire Control Tower (on board)" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Cruse1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"FireControlTower",
		RequiredFleetSubSystems = "", 
		DisplayPriority =		530,
		DisplayedName =			"Short-Range Cruiser Missile (Tube 1)",
		Description = "<b>Description:</b> Missile Tube, Anti-Capital Ship short-range auto-aiming missile launcher, very fast and cheap, the Cruiser Missile automatically engages enemy Capital Ships within a short radius, the missile do more damage if the target is close to the launching ship, if there are no enemies in the area the Cruiser will self destroy \n\n<b>Type:</b> Missile \nRange: 15 Km \nCost: 1000 RUs \nBuil time: none \nMaintenance cost: none \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nFire Control Tower (on board)" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Boa",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"DefenseFieldModule",
		RequiredFleetSubSystems = "", 
		DisplayPriority =		531,
		DisplayedName =			"Roller Mine (Tube 1)",
		Description = "<b>Description:</b> Mine Tube, Anti-Capital Ship short-range auto-aiming mine launcher, the Roller Mine automatically engages enemy Capital Ships within a short radius, the mine do more damage if the target is close to the launching ship, if there are no enemies in the area the mine will self destroy (max 9 units per tube) \n\n<b>Type:</b> Missile \nRange: 7.5 Km \nCost: 2000 RUs \nBuild time: none \nMaintenance cost: none \nStrong vs: Capital Ships \n\n<b>Prerequisites:</b> \nDefense Control Tower (on board)"
	},
	{ 
			Type = Ship, 
			ThingToBuild = "vgr_minermissile",
			RequiredResearch = "",         
			RequiredShipSubSystems = "",  
			RequiredFleetSubSystems = "",                               
			DisplayPriority = 200,
			DisplayedName = "Miner Missile (Tube 1)",
			Description = "<b>Description:</b> Missile Tube, Asteroid Smasher, short-range auto-aiming missile launcher, the Miner Missile automatically engages cleavable asteroids or debrises within a short radius, if there are no asteroids in the area the Miner missile will self destroy \n\n<b>Type:</b> Missile \nRange: 20 Km \nCost: 500 RUs \nBuild time: none \nMaintenance cost: none \nStrong vs: none \n\n<b>Prerequisites:</b> \nnone",},		
	{  
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_HyperSpace_Platform",
		RequiredResearch =		"HyperspaceGateTech",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		520,
		DisplayedName =			"$7174",
		Description = "<b>Description:</b> Basic Hyperspace Generator unique to the Vaygr, when linked with a second Hyperspace Gate it allows friendly ships to jump between the two locations \n\n<b>Type:</b> Utility \nCost: 750 RUs \nBuil time: 30 s \nMaintenance cost: 5 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nPlatform Control Module \nResearch Division \nHyperspace Gate Generator Technology \n2 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_HyperSpace_Platform1",
		RequiredResearch =		"HyperspaceGateTech",
		RequiredShipSubSystems =	"PlatformProduction",
		DisplayPriority =		520,
		DisplayedName =			"$7174",
		Description = "<b>Description:</b> Basic Hyperspace Generator unique to the Vaygr, when linked with a second Hyperspace Gate it allows friendly ships to jump between the two locations \n\n<b>Type:</b> Utility \nCost: 750 RUs \nBuil time: 30 s \nMaintenance cost: 5 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \nPlatform Control Module \nResearch Division \nHyperspace Gate Generator Technology \n2 crew members" 
	},

	-- Utility ----------------

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ResourceCollector",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		500,
		DisplayedName =			"$7164",
		Description = "<b>Description:</b> Basic Utility Ship, can harvest Resources and extract RUs from Mining Bases, when upgraded can repair damaged ships \n\n<b>Type:</b> Utility \nCost: 750 RUs \nBuil time: 40 s \nMaintenance cost: 4 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \n2 crew members"     
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ResourceCollector1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		500,
		DisplayedName =			"$7164",
		Description = "<b>Description:</b> Basic Utility Ship, can harvest Resources and extract RUs from Mining Bases, when upgraded can repair damaged ships \n\n<b>Type:</b> Utility \nCost: 750 RUs \nBuil time: 40 s \nMaintenance cost: 4 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \n2 crew members"     
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ResourceController",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		510,
		DisplayedName =			"$7166",
		Description = "<b>Description:</b> Mobile Resource Drop-Off point, can dock 2 Resource Collectors at once, equipped with: \n4 Hull Defense Guns \n2 Resource Drop-Off points \n\n<b>Type:</b> Utility \nCost: 1000 RUs \nBuil time: 50 s \nMaintenance cost: 8 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \n4 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ResourceController1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		510,
		DisplayedName =			"$7166",
		Description = "<b>Description:</b> Mobile Resource Drop-Off point, can dock 2 Resource Collectors at once, equipped with: \n4 Hull Defense Guns \n2 Resource Drop-Off points \n\n<b>Type:</b> Utility \nCost: 1000 RUs \nBuil time: 50 s \nMaintenance cost: 8 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \n4 crew members" 
	},	
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_ResourceControllerdouble",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		511,
		DisplayedName =			"Advanced Mobile Refinery",
		Description = "<b>Description:</b> Advanced mobile Resource Drop-Off point, can dock 4 Resource Collectors at once, equipped with: \n4 Hull Defense Guns \n2 Flechette Cannons  \n4 Resource Drop-Off points \n\n<b>Type:</b> Utility \nCost: 1500 RUs \nBuil time: 75 s \nMaintenance cost: 12 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \n8 crew members" 
	},
	{ 
		Type = 					Ship, 
		ThingToBuild = 			"vgr_resourcecontrollerdouble1",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		511,
		DisplayedName =			"Advanced Mobile Refinery",
		Description = "<b>Description:</b> Advanced mobile Resource Drop-Off point, can dock 4 Resource Collectors at once, equipped with: \n4 Hull Defense Guns \n2 Flechette Cannons  \n4 Resource Drop-Off points \n\n<b>Type:</b> Utility \nCost: 1500 RUs \nBuil time: 75 s \nMaintenance cost: 12 RUs / year \nStrong vs: None \n\n<b>Prerequisites:</b> \n8 crew members" 
	},

	{ 
        Type = Ship, 
        ThingToBuild = "Vgr_Scaver", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
        RequiredFleetSubSystems = "Research", 
        DisplayPriority = 512, 
        DisplayedName = "Prospector", 
        Description = "<b>Description:</b> Advanced resource operations supporter, the Prospector can dock 4 Resource Collectors at once and generate RUs by fusion together with cheap labor! Equipped with: \n3 Module slots \n7 Special slot \n4 Resource Drop-Off points \n2 Autogun Turrets \n6 Hull Defense Guns\nCan build: Utilities, Subsystems, Weapon Tubes\nCan dock and hold: Resource Collectors\n\n<b>Type:</b> Utility Ship \nCost: 2000 RUs \nBuild time: 80 s \nMaintenance cost: 100 RUs/year \nStrong vs: none \n\n<b>Prerequisites:</b> \nResearch Division \n1 officer \n15 crew members" }, 
	{ 
        Type = Ship, 
        ThingToBuild = "Vgr_Scaver1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "", 
        RequiredFleetSubSystems = "Research", 
        DisplayPriority = 512, 
        DisplayedName = "Prospector", 
        Description = "<b>Description:</b> Advanced resource operations supporter, the Prospector can dock 4 Resource Collectors at once and generate RUs by fusion together with cheap labor! Equipped with: \n3 Module slots \n7 Special slot \n4 Resource Drop-Off points \n2 Autogun Turrets \n6 Hull Defense Guns\nCan build: Utilities, Subsystems, Weapon Tubes\nCan dock and hold: Resource Collectors\n\n<b>Type:</b> Utility Ship \nCost: 2000 RUs \nBuild time: 80 s \nMaintenance cost: 100 RUs/year \nStrong vs: none \n\n<b>Prerequisites:</b> \nResearch Division \n1 officer \n15 crew members" }, 

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Probe",
		RequiredResearch =		"",
		RequiredShipSubSystems =	"",
		DisplayPriority =		540,
		DisplayedName =			"$7168",
		Description = "<b>Description:</b> Long Range Sensor Device, one-shot movement \n\n<b>Type:</b> Utility \nCost: 150 RUs \nBuil time: 5 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nNone"
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Probe_Prox",
		RequiredResearch =		"SensDisProbe",
		RequiredShipSubSystems =	"",
		DisplayPriority =		550,
		DisplayedName =			"$7170",
		Description = "<b>Description:</b> Sensor Device capable of detecting cloaked ships, one-shot movement \n\n<b>Type:</b> Utility \nCost: 250 RUs \nBuil time: 15 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nResearch Division \nProximity Sensor Technology" 
	},

	{ 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Probe_ECM",
		RequiredResearch =		"ProbeSensorDisruption",
		RequiredShipSubSystems =	"",
		DisplayPriority =		560,
		DisplayedName =			"$7172",
		Description = "<b>Description:</b> Remote Device that scrumbles enemy sensors, one-shot movement \n\n<b>Type:</b> Utility \nCost: 500 RUs \nBuil time: 30 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nResearch Division \nSensor Distortion Probe Technology"    
	},	
	
  { 
		Type = 					Ship, 
		ThingToBuild = 			"Vgr_Probe_Smallhsbeacon",
		RequiredResearch =		"Rattle",
		RequiredShipSubSystems =	"",
		DisplayPriority =		570,
		DisplayedName =			"Rattle",
		Description = "<b>Description:</b> Remote Device that can ping the mission area briefly revealing enemy units, detects all hyperspace signatures within a limited radius, one-shot movement \n\n<b>Type:</b> Utility \nCost: 1000 RUs \nBuil time: 60 s \nStrong vs: None \n\n<b>Prerequisites:</b> \nResearch Division \nRattle Technology"    
	},		
	
	{ 
				Type = Ship, 
				ThingToBuild = "vgr_minecontainer",
				RequiredResearch = "",
				RequiredFleetSubSystems = "hasminingbase",	
				DisplayPriority = 520,
				DisplayedName = "Mine Container",
				Description = "<b>Description:</b> RUs Mine Container, a very capable RUs transporter, transfers RUs from Mining Bases to the fleet\nOn Passive tactic: no auto-launch\n\n<b>Type:</b> Utility \nCost: 1250 RU \nBuild time: 65 s \nMaintenance cost: none \nStrong vs: none \n\n<b>Prerequisites:</b> \nMining Base" },	
	{ 
				Type = Ship, 
				ThingToBuild = "vgr_container",
				RequiredResearch = "",
				RequiredFleetSubSystems = "hasallied",	
				DisplayPriority = 521,
				DisplayedName = "Trade Emissary",
				Description = "<b>Description:</b> RUs Trade Container, allows big Production Capital Ships to trade RUs with allied players; more RUs you have in store, more percentage (in RUs) you will gain from your trade network at any docking point; to work properly, allied players must be at a minimum distance; ideal for keep high production levels\n\n<b>Type:</b> Utility \nCost: 1250 RU \nBuild time: 65 s \nMaintenance cost: none \nStrong vs: none \n\n<b>Prerequisites:</b> \nAt least one allied player \n4 crew members" },	          			 					
	{ 
				Type = Ship, 
				ThingToBuild = "vgr_container1",
				RequiredResearch = "",
				RequiredFleetSubSystems = "hasallied",	
				DisplayPriority = 521,
				DisplayedName = "Trade Emissary",
				Description = "<b>Description:</b> RUs Trade Container, allows big Production Capital Ships to trade RUs with allied players; more RUs you have in store, more percentage (in RUs) you will gain from your trade network at any docking point; to work properly, allied players must be at a minimum distance; ideal for keep high production levels\n\n<b>Type:</b> Utility \nCost: 1250 RU \nBuild time: 65 s \nMaintenance cost: none \nStrong vs: none \n\n<b>Prerequisites:</b> \nAt least one allied player \n4 crew members" },	          			 								
		{ 
        Type = Ship, 
        ThingToBuild = "vgr_patcher", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "RepairSystem | CFRepairSystem", 
        DisplayPriority = 800, 
        DisplayedName = "Mechanic", 
        Description = "<b>Description:</b> Armored repairing support Utility Ship, can autonomously repair damaged ships within a limited radius (6000 m) around the Repair System (18 units max)\nOn Passive tactic: no auto-launch/repair, auto-dock\nOn Defensive tactic: auto-launch/repair, auto-dock\nOn Aggressive tactic: auto-launch/repair, no auto-dock\n\n<b>Type:</b> Utility \nCost: 800 RUs \nBuild time: 30 s \nMaintenance cost: none/year \nStrong vs: none \n\n<b>Prerequisites:</b> \nRepair System (on board)" },   		

	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "vgr_advcapshipproduction",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "isLieutenant",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "isCommander",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  
  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "isCaptain",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  			  		        
  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "isCommodore",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "isAdmiral",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  
  { 
			  Type = SubSystem, 			  
			  ThingToBuild = "isFleetAdmiral",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "hasallied",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},  
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "hasallied_hgn",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "hasallied_vgr",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "hasallied_kad",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "hasallied_rad",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "hasallied_kpr",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "fake_research",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_firepower",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_accuracy",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_health",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_repair",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_sensor",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_radiation",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "solesurvivor_speed",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "military0",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 
		{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "military",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},   	  
		{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "military1",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},   	  
		{ 
			  Type = SubSystem, 			  
			  ThingToBuild = "military2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},   
    { 
			  Type = SubSystem, 			  
			  ThingToBuild = "unitcapsrank1",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 
    { 
			  Type = SubSystem, 			  
			  ThingToBuild = "unitcapsrank2",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
    { 
			  Type = SubSystem, 			  
			  ThingToBuild = "unitcapsrank3",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
    { 
			  Type = SubSystem, 			  
			  ThingToBuild = "unitcapsrank4",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,}, 				
		{ 
			  Type = SubSystem,
			  ThingToBuild = "unitbehavior",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "unitbehavior_downgrade",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "hyperspace",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "resource",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "buildspeed",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "resistence",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "ai_antirape",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "ai_unitcap",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
		{ 
			  Type = SubSystem,
			  ThingToBuild = "sp_invincible",
			  RequiredResearch = "unbuildable",
			  DisplayPriority = 0,},
	--{ 
			  --Type = SubSystem, 			  
			  --ThingToBuild = "csalternate",		
			  --RequiredResearch = "unbuildable",     
			  --DisplayPriority = 0,},	 		  		  			  			

---single player-------------------------------------
    --{ 
    --    Type = Ship, 
    --    ThingToBuild = "Vgr_PlanetKillerMissile", 
    --    RequiredResearch = "", 
    --    RequiredShipSubSystems = "", 
    --    DisplayPriority = 612, 
    --    DisplayedName = "Honking big planet killing missile", 
    --    Description = "", }, 

---planets-------------------------------------

{ 
        Type = SubSystem, 
        ThingToBuild = "planet_tech1", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "",               
        DisplayPriority = 1, 
        DisplayedName = "Basic Land Technologies", 
        Description = "<b>Description:</b> Improves the land drainage and the land exploitation, enhances population's RUs production \n\n<b>Type:</b> Planet Technology \n+ 10% Population RUs Production \nCost: 10000 RUs \nBuild time: 100 s \n\n<b>Prerequisites:</b> \nNone",},    
{ 
        Type = SubSystem, 
        ThingToBuild = "planet_tech2", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "planet_tech1",               
        DisplayPriority = 2, 
        DisplayedName = "Advanced Land Technologies", 
        Description = "<b>Description:</b> Improves chemical applications and biological sciences, enhances population's RUs production \n\n<b>Type:</b> Planet Technology \n+ 20% Population RUs Production \nCost: 20000 RUs \nBuild time: 200 s \n\n<b>Prerequisites:</b> \nBasic Land Technologies",},   
{ 
        Type = SubSystem, 
        ThingToBuild = "planet_tech3", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "planet_tech2",               
        DisplayPriority = 3, 
        DisplayedName = "Basic Industrial Technologies", 
        Description = "<b>Description:</b> Improves industrial applications based on manufacturing and raw materials, enhances population's RUs production \n\n<b>Type:</b> Planet Technology \n+ 30% Population RUs Production \nCost: 30000 RUs \nBuild time: 300 s \n\n<b>Prerequisites:</b> \nBasic Land Technologies\nAdvanced Land Technologies",},  
{ 
        Type = SubSystem, 
        ThingToBuild = "planet_tech4", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "planet_tech3",               
        DisplayPriority = 4, 
        DisplayedName = "Advanced Industrial Technologies", 
        Description = "<b>Description:</b> Improves industrial applications based on automation and massive production, enhances population's RUs production \n\n<b>Type:</b> Planet Technology \n+ 40% Population RUs Production \nCost: 40000 RUs \nBuild time: 400 s \n\n<b>Prerequisites:</b> \nBasic Land Technologies\nAdvanced Land Technologies\nBasic Industrial Technologies",},    
{ 
        Type = SubSystem, 
        ThingToBuild = "planet_tech5", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "planet_tech4",               
        DisplayPriority = 5, 
        DisplayedName = "Energy Evolution", 
        Description = "<b>Description:</b> Improves industrial energy production based on advanced nuclear engineering, enhances population's RUs production, enhances energy production \n\n<b>Type:</b> Planet Technology \n+ 50% Population RUs Production \nCost: 50000 RUs \nBuild time: 500 s \n\n<b>Prerequisites:</b> \nBasic Land Technologies\nAdvanced Land Technologies\nBasic Industrial Technologies\nAdvanced Industrial Technologies",},   
{ 
        Type = SubSystem, 
        ThingToBuild = "planet_tech6", 
        RequiredResearch = "", 
        RequiredShipSubSystems = "planet_tech5",               
        DisplayPriority = 6, 
        DisplayedName = "Nano-Technology", 
        Description = "<b>Description:</b> Improves industrial applications and energy production based on advanced nano-technology engineering, enhances population's RUs production, enhances energy production \n\n<b>Type:</b> Planet Technology \n+ 60% Population RUs Production \nCost: 60000 RUs \nBuild time: 600 s \n\n<b>Prerequisites:</b> \nBasic Land Technologies\nAdvanced Land Technologies\nBasic Industrial Technologies\nAdvanced Industrial Technologies\nEnergy Evolution",},   				
                                				
---crate ships (need to be in the build list or they won't have AI)-------------------------------------
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_UNH_CAStandard",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_VAY_CABattle",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_FRN_CAHeavy",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_FRN_FFAssault",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_FRN_FFCloak",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_FRN_FFIon",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_FRN_FFMine",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_FRN_FFSupport",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_UNH_FFAssault",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_UNH_FFIon",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_VAY_FFAssault",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "HWAT_VAY_FFIonArray",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "Unit_C_Bomber",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "Unit_C_Gunship",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "Unit_C_Interceptor",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "Unit_G_Bomber",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},
	{ 
			  Type = Ship, 			  
			  ThingToBuild = "Unit_G_Interceptor",		
			  RequiredResearch = "unbuildable",     
			  DisplayPriority = 0,},




}