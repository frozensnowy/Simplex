-- LuaDC version 0.9.19
-- 14/06/2004 21.55.44
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
buildFamily = 
    { 
    { 
        name = "Fighter_Hgn", }, 
	{ 
        name = "Drone_Hgn", },
    { 
        name = "Corvette_Hgn", }, 
    { 
        name = "Mover_Hgn", }, 
    { 
        name = "Frigate_Hgn", }, 
    { 
        name = "SuperCap_Hgn", }, 
    { 
        name = "Shipyard_Hgn", }, 
    { 
        name = "Battlecruiser_Hgn", }, 
    { 
        name = "Flagship_Hgn", }, 
    { 
        name = "Utility_Hgn", }, 
    { 
        name = "Probe_Hgn", }, 
    { 
        name = "Platform_Hgn", }, 
    { 
        name = "TangoMinem", },
    { 
        name = "TangoMinec", },
    { 
        name = "TangoMines", },
    { 
        name = "SubSystem_Hgn", }, 
    { 
        name = "smallweaponsub_Hgn", }, 
    { 
        name = "SubSystemLarge_Hgn", }, 
    { 
        name = "Fighter_Vgr", }, 
    { 
        name = "Corvette_Vgr", }, 
    { 
        name = "Frigate_Vgr", }, 
    { 
        name = "SuperCap_Vgr", }, 
    { 
        name = "Shipyard_Vgr", }, 
    { 
        name = "Battlecruiser_Vgr", }, 
    { 
        name = "Flagship_Vgr", }, 
    { 
        name = "Utility_Vgr", }, 
    { 
        name = "Probe_Vgr", }, 
    { 
        name = "Platform_Vgr", }, 
    { 
        name = "SubSystem_Vgr", }, 
    { 
        name = "SubSystemLarge_Vgr", }, 
    { 
        name = "NotBuildable", }, 
    { 
        name = "Core_Hgn", },    
    { 
        name = "TransportCell", },  
    { 
        name = "MineContainer", },  
    { 
        name = "TradeContainer", },         
    { 
        name = "Patcher", },       
    { 
        name = "Ghost_Hgn", }, 
    { 
        name = "CommandFortress_Hgn", },
    { 
        name = "CommandFortress_Vgr", },            
    { 
        name = "Spy", },  
    { 
        name = "MassiveTurret", },     
    { 
        name = "Drone", },     
    { 
        name = "Nuclear", },  
    { 
        name = "NuclearTube", },       
    { 
        name = "TangoMinem_ws", },              
    { 
        name = "RTS", },  
    { 
        name = "SuperCapSmall_Hgn", },     
    { 
        name = "Orders_Hgn", },    
    { 
        name = "OrdersEvac_Hgn", },   
    { 
        name = "MinerMissile", },    
    { 
        name = "BattleStation_Hgn", },  
    { 
        name = "planet_tech", },   
    { 
        name = "kad_perks", },		
    { 
        name = "Mothership_Rad", },	

--newly introduced
    { 
        name = "Fighter_Kpr", }, 
    { 
        name = "Corvette_Kpr", }, 
    { 
        name = "Mover_Kpr", }, 
    { 
        name = "SuperCap_Kpr", }, 
    { 
        name = "UltraCap_Kpr", }, 
    { 
        name = "Shipyard_Kpr", }, 
    { 
        name = "Utility_Kpr", },
    { 
        name = "Shipyard_Kpr", },
    { 
        name = "Frigate_Kpr", },
    { 
        name = "Probe_Kpr", },
    { 
        name = "SubSystem_Kpr", }, 
    { 
        name = "Fighter_Kad", }, 
    { 
        name = "Corvette_Kad", }, 
    { 
        name = "Frigate_Kad", }, 
    { 
        name = "SuperCap_Kad", }, 	
    { 
        name = "Subsystem_Kad", }, 	
    { 
        name = "Utility_Kad", },
    { 
        name = "Fighter_Rad", }, 
    { 
        name = "Ghostship_Rad", }, 
    { 
        name = "Corvette_Rad", }, 
    { 
        name = "SuperCap_Rad", }, 	
    { 
        name = "SuperCap_Rad_NB", }, 		
    { 
        name = "SuperCap_Rad_Market", }, 	
    { 
        name = "Frigate_Rad", }, 
    { 
        name = "SubSystem_Rad", },
    { 
        name = "Utility_Rad", },
    { 
        name = "Merc_Rad", },	
    { 
        name = "No_Build", },	
        		
    }
displayFamily = 
    { 
    { 
        name = "vuoto", 	--dummy research items fall into this class (not displayed) because it has the smallest numParam
        stringParam = "vuoto", 
        numParam = 0, },       
    { 
        name = "Orders", 
        stringParam = "Ship Command", 
        numParam = 1, }, 
    { 
        name = "Fighter", 
        stringParam = "Fighter Class", 
        numParam = 2, },      
    { 
        name = "Corvette", 
        stringParam = "$2101", 
        numParam = 3, }, 
    { 
        name = "Frigate", 
        stringParam = "$2102", 
        numParam = 4, }, 
    { 
        name = "Capital", 
        stringParam = "$2103", 
        numParam = 5, },          
    { 
        name = "Flagship", 
        stringParam = "$2104", 
        numParam = 6, }, 
    { 
        name = "Platform", 
        stringParam = "$2105", 
        numParam = 7, }, 
    { 
        name = "Utility", 
        stringParam = "$2106", 
        numParam = 8, }, 
    { 
        name = "SubSystemModule", 
        stringParam = "$2107", 
        numParam = 9, }, 
    { 
        name = "SubSystemSensors", 
        stringParam = "Special Subsystems", 
        numParam = 10, }, 
    { 
        name = "Munition", 
        stringParam = "$2109", 
        numParam = 11, }, 
    { 
        name = "Megalith", 
        stringParam = "$2110", 
        numParam = 12, }, 
    { 
        name = "SubSystemModuleRank", 
        stringParam = "Special Rank", 
        numParam = 13, },  
    { 
        name = "SubSystemModuleCivil", 
        stringParam = "Module Civilian", 
        numParam = 14, },          
    { 
        name = "SubSystemModulePilot", 
        stringParam = "Module Pilot", 
        numParam = 15, },            
    { 
        name = "SubSystemModuleOfficer", 
        stringParam = "Module Officer", 
        numParam = 16, },     
    { 
        name = "SubSystemModuleResearch", 
        stringParam = "Module Research", 
        numParam = 17, },   
    { 
        name = "SubSystemSensorsTeroidal", 
        stringParam = "Teroidal Magnets", 
        numParam = 18, },   
    { 
        name = "SubSystemSensorsPowerUp", 
        stringParam = "Power Ups", 
        numParam = 19, },          
    { 
        name = "Weapon", 
        stringParam = "Special Weapons", 
        numParam = 20, },     
    { 
        name = "SubSystemSensorsup", 
        stringParam = "Special Subsystems (Weapon Top)", 
        numParam = 21, },         
    { 
        name = "SubSystemSensorsdown", 
        stringParam = "Special Subsystems (Weapon Bottom)", 
        numParam = 22, },         
    { 
        name = "SubSystemSensorsleft", 
        stringParam = "Special Subsystems (Weapon Left)", 
        numParam = 23, },         
    { 
        name = "SubSystemSensorsright", 
        stringParam = "Special Subsystems (Weapon Right)", 
        numParam = 24, }, 
    { 
        name = "SubSystemSensors100", 
        stringParam = "Special Subsystems (Adv. Asset, Exp. Based)", 
        numParam = 25, },  
    { 
        name = "SubSystemSensors200", 
        stringParam = "Special Subsystems (Adv. Asset, Exp. Based)", 
        numParam = 26, },  
    { 
        name = "SubSystemSensors300", 
        stringParam = "Special Subsystems (Adv. Asset, Exp. Based)", 
        numParam = 27, },         
    { 
        name = "SubSystemSensors400", 
        stringParam = "Special Subsystems (Adv. Asset, Exp. Based)", 
        numParam = 28, },  
    { 
        name = "SubSystemSensors500", 
        stringParam = "Special Subsystems (Adv. Asset, Exp. Based)", 
        numParam = 29, }, 
    { 
        name = "planet_tech", 
        stringParam = "Planet Technologies", 
        numParam = 30, },    
    { 
        name = "PrimaryPerk", 
        stringParam = "Primary Perk", 
        numParam = 31, }, 
    { 
        name = "SecondaryPerk", 
        stringParam = "Secondary Perk", 
        numParam = 32, }, 	
    { 
        name = "ChooseYourGeneral", 
        stringParam = "Choose Your General", 
        numParam = 33, }, 	
    { 
        name = "ExperienceAbility", 
        stringParam = "Special Abilities", 
        numParam = 34, },
    { 
        name = "Merc_Upgrades", 
        stringParam = "Upgrades", 
        numParam = 35, },
    { 
        name = "SubSystemSensors5z", 
        stringParam = "Modular Weapon (Front Top)", 
        numParam = 36, },         
    { 
        name = "SubSystemSensors6z", 
        stringParam = "Modular Weapon (Front Bottom)", 
        numParam = 37, },         
    { 
        name = "SubSystemSensors1z", 
        stringParam = "Modular Weapon (Top Left)", 
        numParam = 38, },         
    { 
        name = "SubSystemSensors2z", 
        stringParam = "Modular Weapon (Top Right)", 
        numParam = 39, },         
    { 
        name = "SubSystemSensors3z", 
        stringParam = "Modular Weapon (Bottom Left)", 
        numParam = 40, },         
    { 
        name = "SubSystemSensors4z", 
        stringParam = "Modular Weapon (Bottom Right)", 
        numParam = 41, }, 
    { 
        name = "Invisible", 
        stringParam = "", 
        numParam = 42, },
                                    
--    { 
--        name = "Research", 
--        stringParam = "?", 
--        numParam = 13, },
    }
attackFamily = 
    { 
    { 
        name = "Fighter", 
        numParam = 1, }, 
    { 
        name = "Corvette", 
        numParam = 1, }, 
    { 
        name = "Frigate", 
        numParam = 1, }, 
    { 
        name = "Utility", 
        numParam = 1, }, 
    { 
        name = "Munition", 
        numParam = 1, }, 
    { 
        name = "SmallCapitalShip", 
        numParam = 1, }, 
    { 
        name = "BigCapitalShip", 
        numParam = 1, }, 
    { 
        name = "Mothership", 
        numParam = 1, }, 
    { 
        name = "Emplacement", 
        numParam = 1, }, 
    { 
        name = "UnAttackable", 
        numParam = 0, }, 
    { 
        name = "SubSystem", 
        numParam = 1, },     
    { 
        name = "Resource", 
        numParam = 1, }, 
    { 
        name = "ResourceLarge", 
        numParam = 1, }, 
    { 
        name = "Capturer", 
        numParam = 1, }, 
    { 
        name = "Chimera", 
        numParam = 1, }, 
    {
		    name = "Missile",
		    numParam = 1,  },   
		{ 
        name = "AsteroidSmasher", 
        numParam = 1,  },     
    { 
        name = "Location", 
        numParam = 1, }, 
        
--Warlords 0.6
	{name = "Shield",
    numParam = 1,},
  {name = "Bomber",
    numParam = 1,},
  {name = "Cruiser",
    numParam = 1,},
  {name = "Destroyer",
    numParam = 1,},
	{name = "Hero_Small",
    numParam = 1,},
  {name = "Hero_Large",
    numParam = 1,},
	{name = "ShieldNoAttack",
    numParam = 1,},
	{name = "HULLCM",
    numParam = 1,},
	{name = "Heavy_Frigate",
    numParam = 1,},
  {name = "SuperCapital",
    numParam = 1,},
  {name = "Heavy_Corvette",
    numParam = 1,},
	{name = "large_missile",
    numParam = 1,},
  {name = "small_missile",
    numParam = 1,},
	{name = "Heavy_Utility",
    numParam = 1,},
	{name = "Planet",
    numParam = 1,},
        
    }
dockFamily = 
    { 
    { 
        name = "Mover", }, 
    { 
        name = "Fighter", }, 
    { 
        name = "Corvette", }, 
    { 
        name = "Frigate", }, 
    { 
        name = "Utility", }, 
    { 
        name = "Controller", }, 
    { 
        name = "Platform", }, 
    { 
        name = "SuperCap", }, 
    { 
        name = "SuperCapRS", }, 
    { 
        name = "SuperCapPS", },        
    { 
        name = "SuperCapCS", },   
    { 
        name = "SuperCapWS", },       
    { 
        name = "SuperCapS", },             
    { 
        name = "BattleCruiser", }, 
    { 
        name = "Transport", }, 
    { 
        name = "Shipyard", }, 
    { 
        name = "Flagship", }, 
    { 
        name = "Resource", }, 
    { 
        name = "Inhibitor", }, 
    { 
        name = "LargeSalvage", }, 
    { 
        name = "UltraCap", }, 
    { 
        name = "TransportCell", },        
    { 
        name = "Container", }, 
    { 
        name = "TradeContainer", },                    
    { 
        name = "CantDock", }, 
    { 
        name = "Viper", },   
    { 
        name = "Jug", },    
    { 
        name = "Sentinel", },         
    { 
        name = "Nuclear", },     
    { 
        name = "colonyship", },  
    { 
        name = "rts", },  
    { 
        name = "massshield", }, 
    { 
        name = "massshield1", }, 
    { 
        name = "massshield2", }, 
    { 
        name = "massshield3", },  
    { 
        name = "DimensionAttack1", }, 
    { 
        name = "DimensionAttack2", },  
    { 
        name = "NuclearTube1", },
    { 
        name = "NuclearTube2", },
    { 
        name = "NuclearTube3", },  
    { 
        name = "minermissile", },   
    { 
        name = "minermissile1", },  
    { 
        name = "Viper_ws", }, 
    { 
        name = "Viper_ws1", },       
    { 
        name = "cruse", },    	
    { 
        name = "Booster", },
        
--newly introduced
		{ 
        name = "Frigate_Sideways", },
    { 
        name = "DefenseDrone", }, 
    { 
        name = "Shifter", }, 
    { 
        name = "Agitator", }, 
    { 
        name = "PowerGen", }, 	
    { 
        name = "HereticSmall", },
    { 
        name = "Acolyte", },
    { 
        name = "EliteFighter", },  	
    { 
        name = "IceKeeper", },  			
        		
    }
avoidanceFamily = 
    { 
    { 
        name = "None", 
        numParam = 0, }, 
    { 
        name = "DontAvoid", 
        numParam = 1, }, 
    { 
        name = "Strikecraft", 
        numParam = 2, }, 
    { 
        name = "Utility", 
        numParam = 3, }, 
    { 
        name = "Frigate", 
        numParam = 4, }, 
    { 
        name = "Scaver", 
        numParam = 5, },     
    { 
        name = "SmallRock", 
        numParam = 6, }, 
    { 
        name = "Capital", 
        numParam = 7, }, 
    { 
        name = "SuperCap", 
        numParam = 8, }, 
    { 
        name = "BattleCruiser", 
        numParam = 9, }, 
    { 
        name = "MotherShip", 
        numParam = 10, }, 
    { 
        name = "BigRock", 
        numParam = 11, }, 
    { 
        name = "SuperPriority", 
        numParam = 12, }, 
    }
collisionFamily = 
    { 
    { 
        name = "Small", 
        numParam = 0, }, 
    { 
        name = "Big", 
        numParam = 1, }, 
    { 
        name = "Unmoveable", 
        numParam = 2, }, 
    }
autoFormationFamily = 
    { 
    { 
        name = "Fighter", 
        numParam = 0, }, 
    { 
        name = "Corvette", 
        numParam = 1, }, 
    { 
        name = "Frigate", 
        numParam = 2, }, 
    { 
        name = "CapShip", 
        numParam = 3, }, 
    { 
        name = "SuperCap", 
        numParam = 4, }, 
    }
armourFamily = 
    { 
    { 
        name = "Unarmoured", }, 
    { 
        name = "LightArmour", }, 
    { 
        name = "MediumArmour", }, 
    { 
        name = "HeavyArmour", }, 
    { 
        name = "SubSystemArmour", }, 
    { 
        name = "TurretArmour", }, 
    { 
        name = "ResArmour", }, 
    { 
        name = "MoverArmour", }, 
    { 
        name = "PlanetKillerArmour", }, 
    { 
        name = "MineArmour", }, 
    { 
        name = "ChunkArmour", }, 

--newly introduced
    { 
        name = "CruiseMissileArmour", }, 
    { 
        name = "SuperHeavyArmor", },
        
--Warlords 0.6
	{name = "Deflector_Shield",},
  {name = "Hull_Cap_1D",},
  {name = "Hull_Cap_2D",},
  {name = "Hull_Cap_3D",},
  {name = "Hull_Cap_4D",},
  {name = "Hull_Cap_5D",},
  {name = "Hull_Cap_6D",},
  {name = "Hull_Cap_7D",},
  {name = "Hull_Cap_8D",},
  {name = "Hull_Cap_9D",},
  {name = "Hull_Cap_10D",},
  {name = "Hull_Cap_11D",},
  {name = "Hull_Cap_12D",},
  {name = "Hull_Cap_13D",},
  {name = "Hull_Cap_14D",},
  {name = "Hull_Cap_15D",},
  {name = "Hull_Cap_16D",},
  {name = "Hull_SF_1D",},
  {name = "Hull_SF_2D",},
  {name = "Hull_SF_3D",},
  {name = "Hull_SF_4D",},
  {name = "Hull_SF_5D",},
  {name = "Hull_SF_6D",},
  {name = "Shield_SF_1D",},
  {name = "Shield_SF_2D",},
  {name = "Shield_SF_3D",},
  {name = "Shield_SF_4D",},
  {name = "Shield_Cap_1D",},
  {name = "Shield_Cap_2D",},
  {name = "Shield_Cap_3D",},
  {name = "Shield_Cap_4D",},
  {name = "Shield_Cap_5D",},
  {name = "Shield_Cap_6D",},
  {name = "Shield_Cap_7D",},
  {name = "Shield_Cap_8D",},
  {name = "Shield_Cap_9D",},
  {name = "Shield_Cap_10D",},
  {name = "Shield_Cap_11D",},
  {name = "Shield_Cap_12D",},

    }
unitcapsFamily = 
    { 
    { 
        name = "Complex", 
        numParam = 1, 
        stringParam = "Complex", },
    { 
        name = "Stop", 
        numParam = 0, 
        stringParam = "", },
    { 
        name = "Fighter", 
        numParam = 5, 
        stringParam = "", }, 
    { 
        name = "Corvette", 
        numParam = 10, 
        stringParam = "", }, 
    { 
        name = "Frigate", 
        numParam = 20, 
        stringParam = "", },
    { 
        name = "Destroyer", 
        numParam = 25, 
        stringParam = "Destroyer", },
    { 
        name = "Destroyer1", 
        numParam = 26, 
        stringParam = "Destroyer", },   
    { 
        name = "Capital", 
        numParam = 30, 
        stringParam = "", }, 
    { 
        name = "Platform", 
        numParam = 40, 
        stringParam = "", }, 
    { 
        name = "Utility", 
        numParam = 50, 
        stringParam = "", }, 
    { 
        name = "Mothership", 
        numParam = 60, 
        stringParam = "", }, 
    { 
        name = "Shipyard", 
        numParam = 65, 
        stringParam = "", }, 
    { 
        name = "DreadNaught", 
        numParam = 70, 
        stringParam = "$2120", }, 
    { 
        name = "SPMovers", 
        numParam = 80, 
        stringParam = "$2121", }, 
    { 
        name = "SinglePlayerMisc", 
        numParam = 90, 
        stringParam = "This should not be displayed", }, 
    { 
        name = "CommStation", 
        numParam = 100, 
        stringParam = "This should not be displayed", }, 
        
--newly introduced
    { 
        name = "Fighter", 
        numParam = 1, 
        stringParam = "$2113", }, 
    { 
        name = "StrikeCraftCap", 
        numParam = 2, 
        stringParam = "", }, 
    { 
        name = "SwarmCap", 
        numParam = 3, 
        stringParam = "", }, 
    { 
        name = "SupportPodCap", 
        numParam = 4, 
        stringParam = "", }, 
    { 
        name = "HiigSpecialCap", 
        numParam = 5, 
        stringParam = "", }, 
    { 
        name = "HgnDrones", 
        numParam = 56, 
        stringParam = "", }, 
    { 
        name = "DronesBuildable", 
        numParam = 57, 
        stringParam = "", }, 
    { 
        name = "PodShip", 
        numParam = 25, 
        stringParam = "", },
    { 
        name = "Mercs", 
        numParam = 39, 
        stringParam = "", },
    { 
        name = "SuperFighter", 
        numParam = 5, 
        stringParam = "", },
    { 
        name = "Commander", 
        numParam = 6, 
        stringParam = "", },
        
    }
unitcapsShipType = 
    { 
    { 
        name = "Ghost", 
        numParam = 2, 
        stringParam = "Ghost", },   
    { 
        name = "Scout", 
        numParam = 3, 
        stringParam = "Scout", },     
    { 
        name = "Gunship", 
        numParam = 4, 
        stringParam = "Gunship", }, 
    { 
        name = "PulsarGunship", 
        numParam = 12, 
        stringParam = "Pulsar Gunship", },
    { 
        name = "MinelayerCorvette", 
        numParam = 13, 
        stringParam = "$2135", }, 
    { 
        name = "Multigun", 
        numParam = 14, 
        stringParam = "Multigun", },
    { 
        name = "Mechgun", 
        numParam = 15, 
        stringParam = "Mechgun", },
        
        
    { 
        name = "Mover", 
        numParam = 16, 
        stringParam = "$2121", }, 
    { 
        name = "TorpedoFrigate", 
        numParam = 21, 
        stringParam = "$2122", }, 
    { 
        name = "FlakFrigate", 
        numParam = 22, 
        stringParam = "Flak Frigate", }, 
    { 
        name = "IonFrigate", 
        numParam = 23, 
        stringParam = "Ion Cannon Frigate", }, 
    { 
        name = "CaptureFrigate", 
        numParam = 24, 
        stringParam = "$2123", }, 
    { 
        name = "DefenseFieldFrigate", 
        numParam = 25, 
        stringParam = "$2124", }, 
    { 
        name = "SniperFrigate", 
        numParam = 26, 
        stringParam = "Sniper Frigate", }, 
        
        
        
    { 
        name = "Destroyer", 
        numParam = 31, 
        stringParam = "$2125", }, 
    { 
        name = "IonDestroyer", 
        numParam = 32, 
        stringParam = "Ion Destroyer", }, 
    { 
        name = "Carrier", 
        numParam = 33, 
        stringParam = "$2126", }, 
    { 
        name = "Battlecruiser", 
        numParam = 34, 
        stringParam = "$2127", }, 
    { 
        name = "Shipyard", 
        numParam = 35, 
        stringParam = "$2128", }, 
    {
        name = "StrikeCarrier",
        numParam = 37,
        stringParam = "Combat Support Vessels", },       
        
        
    
    { 
        name = "ResourceCollector", 
        numParam = 51, 
        stringParam = "$2130", }, 
    { 
        name = "ResourceController", 
        numParam = 52, 
        stringParam = "$2131", }, 
    { 
        name = "Core", 
        numParam = 53, 
        stringParam = "Core", },  
    { 
        name = "Probe", 
        numParam = 54, 
        stringParam = "$2132", }, 
    { 
        name = "ECMProbe", 
        numParam = 55, 
        stringParam = "$2133", }, 
    { 
        name = "ProximitySensor", 
        numParam = 56, 
        stringParam = "$2134", },
        
        
        
        
    { 
        name = "HyperspacePlatform", 
        numParam = 41, 
        stringParam = "$2129", }, 
    { 
        name = "GunTurret", 
        numParam = 42, 
        stringParam = "Gun Platform", }, 
    {
        name = "IonTurret", 
        numParam = 43, 
        stringParam = "Ion Beam Platform", }, 
    { 
        name = "ViperMissile", 
        numParam = 44, 
        stringParam = "Viper Missile", },  
    { 
        name = "CruseMissile", 
        numParam = 45, 
        stringParam = "Cruse Missile", },      
    
    { 
        name = "researchstation", 
        numParam = 46, 
        stringParam = "Research Station", }, 
    { 
        name = "crewstation", 
        numParam = 47, 
        stringParam = "Crew Station", }, 
    { 
        name = "TangoMine", 
        numParam = 48, 
        stringParam = "Tango Mine", },      
    { 
        name = "Drone", 
        numParam = 49, 
        stringParam = "Drone", }, 
    { 
        name = "Patcher", 
        numParam = 50, 
        stringParam = "Drone", }, 
    { 
        name = "MassiveTurret", 
        numParam = 51, 
        stringParam = "Massive Turret", },       
    { 
        name = "TradeContainer", 
        numParam = 52, 
        stringParam = "Trade Container", },        
    { 
        name = "NuclearTube1", 
        numParam = 53, 
        stringParam = "Nuclear Tube 1", },    
    { 
        name = "NuclearTube2", 
        numParam = 54, 
        stringParam = "Nuclear Tube 2", },    
    { 
        name = "NuclearTube3", 
        numParam = 55, 
        stringParam = "Nuclear Tube 3", },     
    { 
        name = "NuclearBomb", 
        numParam = 56, 
        stringParam = "Nuclear Bomb", },   
    { 
        name = "Boa", 
        numParam = 57, 
        stringParam = "Heavy Mine", },  
    { 
        name = "powerstation", 
        numParam = 58, 
        stringParam = "Power Station", },     
    { 
        name = "weaponstation", 
        numParam = 59, 
        stringParam = "Weapon Station", },      
    { 
        name = "ViperMissile_ws", 
        numParam = 60, 
        stringParam = "Viper Missile", },  
    { 
        name = "ViperMissile_ws1", 
        numParam = 61, 
        stringParam = "Viper Missile", },   
    { 
        name = "PowerGenerator", 
        numParam = 62, 
        stringParam = "Power Generator", }, 

--newly introduced
	{ 
        name = "SpecialCapLarge", 
        numParam = 6, 
        stringParam = "", },       
    { 
        name = "Cruiser", 
        numParam = 32, 
        stringParam = "", }, 
    { 
        name = "Enforcer", 
        numParam = 33, 
        stringParam = "", },  
    { 
        name = "SuperCapital", 
        numParam = 35, 
        stringParam = "", },                     
    { 
        name = "Lord", 
        numParam = 38, 
        stringParam = "", }, 
    { 
        name = "MercCruiser", 
        numParam = 39, 
        stringParam = "", },           
     
    }
