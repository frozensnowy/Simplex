GameRulesName = "Battle Arena"
Description = "A turn based 1 vs 1 battle, AI is not supported" 
Directories =
{
  Levels = "data:LevelData\\Multiplayer\\battlearena\\",  
}
---GAME SETUP----------------------------------------------------------------------------------------------
GameSetupOptions =
{
---RESOURCE MULITPLIER----------------
  {
   name = "resources",
   locName = "Resource Multiplier       ---",
   tooltip = "ADJUST THE AMOUNT OF RESOURCES PER ASTEROID, FEW RESOURCES CAUSE A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "Few", "0.75",
    "Normal", "1.6",
    "High", "3.3",  
    "Maximum", "7",  
   },
  },        
---STARTING RESOURCE OPTION-------------
  {
   name = "resstart",
   locName = "Starting Resources        ---",
   tooltip = "CHOOSE THE AMOUNT OF STARTING RUS, FEW RESOURCES CAUSE A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "Map Default", "0",
    "Low (1000)", "1000",
    "Normal (3000)", "3000",
    "High (5000)", "5000",   
    "Maximum (7000)", "7000",                    
   },
  },     
---STARTING FLEET--------------------
  {
   name = "startwith",
   locName = "Starting Ships",
   tooltip = "CHOOSE THE NUMBER OF STARTING SHIPS, FEW SHIPS CAUSE A TACTICAL MATCH (Default: Mothership, 5 Collectors)",
   default = 2,
   visible = 0,
   choices =
   {
    "Mothership",  "1",
    "Mothership, 3 Collectors",  "2",
    "Mothership, 6 Collectors",  "3", 
    "Support",  "4",      
    "Fleet",  "5",
    "Empire",  "6",           
    "Test (Dev./All)",  "7",
   },
  },    
---STARTING HONOUR-------------
  {
   name = "honourstart",
   locName = "Starting Honour Points",
   tooltip = "CHOOSE THE AMOUNT OF STARTING HONOUR POINTS, LESS STARTING HONOUR CAUSES A TACTICAL MATCH (Default: 10)",
   default = 1,
   visible = 0,
   choices =
   {
    "0 (Ensign)", "1",    
    "10 (Ensign)", "2",     
    "20 (Ensign)", "3",   
    --"30 (Lieutenant)", "4", 
    --"75 (Commander)", "5",    
    --"125 (Captain)", "6",    
    --"185 (Commodore)", "7", 
    --"265 (Admiral)", "8",
    --"365 (Fleet Admiral)", "9",                      
   },
  },  
---HONOUR SENSITIVITY-------------
  {
   name = "honoursensitivity",
   locName = "Honour Sensitivity",
   tooltip = "CHOOSE THE HONOUR POINTS SENSITIVITY, FEW SENSITIVITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",
    "Maximum", "4",                             
   },
  },    
---RESEARCH SENSITIVITY-------------
  {
   name = "researchsensitivity",
   locName = "Research Sensitivity",
   tooltip = "CHOOSE THE RESEARCH POINTS SENSITIVITY, FEW SENSITIVITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",
    "Maximum", "4",                             
   },
  },    
---RESEARCH SPEED-------------
  {
   name = "researchspeed",
   locName = "Research Speed",
   tooltip = "CHOOSE THE RESEARCH SPEED, FEW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 0,
   visible = 0,
   choices =
   {    
    "Normal", "1",
    "High", "2",                             
   },
  },          
---BUILD SPEED-------------
  {
   name = "buildspeed",
   locName = "Construction Speed",
   tooltip = "CHOOSE THE UNIT CONSTRUCTION SPEED, FEW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 3,
   visible = 0,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",                         
   },
  },     
---RESOURCE SPEED-------------
  {
   name = "resource",
   locName = "RU Operations Speed",
   tooltip = "CHOOSE THE RESOURCE OPERATIONS SPEED (HARVEST/FUSION/MINING), FEW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 3,
   visible = 0,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "High", "3",    
    "Maximum", "4",                        
   },
  },   
---RECRUITING SPEED-------------
  {
   name = "recruiting",
   locName = "Recruiting Speed",
   tooltip = "CHOOSE THE RECRUITING OPERATIONS SPEED (CREW/OFFICERS), FEW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "High", "3",     
    "Maximum", "4",                       
   },
  },   
---EXPERIENCE SENSITIVITY-------------
  {
   name = "experiencesensitivity",
   locName = "Experience Sensitivity",
   tooltip = "CHOOSE THE UNIT EXPERIENCE SENSITIVITY, FEW SENSITIVITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",                          
   },
  },
---ENERGY SENSITIVITY-------------
  {
   name = "energysensitivity",
   locName = "Energy Sensitivity",
   tooltip = "CHOOSE ENERGY SENSITIVITY, FEW SENSITIVITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",   
    "Test (Dev./Extreme)", "5",                       
   },
  },                                                 
---HYPERSPACE USE-------------
  {
   name = "hyperspace",
   locName = "Hyperspace Accessibility",
   tooltip = "CHOOSE THE ACCESSIBILITY OF HYPERSPACE OPERATIONS, FEW ACCESSIBILITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3", 
    "Maximum", "4",                                                       
   },
  },                                                                             
---RANK REMUNERATION-------------
  {
   name = "rankremuneration",
   locName = "Rank Remuneration",
   tooltip = "CHOOSE THE RANK REMUNERATION PER YEAR, FEW REMUNERATION CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 4,
   visible = 0,
   choices =
   {
    "None", "1",
    "Few", "2",
    "Normal", "3",
    "High", "4",                            
    "Maximum", "5",                        
   },
  },                  
---BATTLE DURATION-------------
  {
   name = "unithealth",
   locName = "Battle Duration",
   tooltip = "CHOOSE THE BATTLE DURATION (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3", 
    "Maximum", "4",                           
   },
  }, 
---UNIT BEHAVIOR-------------
  {
   name = "unitbehavior",
   locName = "Unit Behavior",
   tooltip = "CHOOSE THE UNIT SPEED AND DRIVE MANOUVRES (Default: Realistic)",
   default = 0,
   visible = 0,
   choices =
   {
    "Realistic", "1",
    "Fast", "2",                               
   },
  },        
---AI--------------------------
  {
   name = "aiaids",
   locName = "AI Aids",
   tooltip = "CHOOSE THE FREQUENCY OF ARTIFICIAL INTELLIGENT AIDS, FEW AIDS CAUSE A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 0,
   choices =
   {
    --"None", "1",
    "Few", "2",
    "Normal", "3",
    "High", "4", 
    --"Madness", "5",                            
   },
  },
---MILITARY--------------------------
  {
   name = "military",
   locName = "AI Aggressiveness",
   tooltip = "FEW: AI ATTACKS RARELY BY MANY SHIPS; HIGH: AI ATTACKS OFTEN BY FEW SHIPS, FEW SETTING CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 0,
   choices =
   {
    "None", "1",
    "Few", "2",
    "Normal", "3",
    "High", "4", 
    "Maximum", "5",                          
   },
  },                                                                                 
---START LOCATION OPTION--------------
  {
   name = "startlocation",
   locName = "$3225",
   tooltip = "CHOOSE THE TYPE OF START LOCATION (Default: Fixed)",
   default = 1,
   visible = 0,
   choices =
   {
    "$3226", "random",
    "$3227", "fixed",
   },
  },      
---LOCK TEAM OPTION-----------------
  {
   name = "lockteams",
   locName = "$3220",
   tooltip = "PREVENT PLAYERS FROM CHANGING TEAMS (Default: No)",
   default = 0,
   visible = 0,
   choices =
   {
    "$3221", "yes",
    "$3222", "no",
   },
  },
---WIN CONDITION-------------------
  {
   name = "wincondition",
   locName = "Primary Objective",
   tooltip = "CHOOSE THE WIN CONDITION (Default: 10 Battle Points)",
   default = 2,
   visible = 1,
   choices =
   {
   --"Destroy Mothership",	"DestroyMothership",
   "Destroy Production", "DestroyProduction",   
   --"Destroy All",	"DestroyAll",   
   --"Store 100000 RUs",	"Store100000RUs",
   "5 Battle Points", "5battlepoints",
   "10 Battle Points", "10battlepoints",
   "15 Battle Points", "15battlepoints",
  },
 }, 
---SECONDARY OBJECTIVES--------------------------
  { 
   name = "secondaryobjectives", 
   locName = "Secondary Objectives", 
   tooltip = "ENABLE/DISABLE SECONDARY OBJECTIVES (Default: Disable)", 
   default = 0, 
   visible = 0, 
   choices = 
   {
    "Disable",  "1",
    "Resource Race",  "2",     
    "Rank Race",  "3",
    "Domain Race",  "4",
    "All",  "5",
   },
 },       
---DIPLOMACY FEE--------------------------
  { 
   name = "diplomacy", 
   locName = "Diplomacy Fee", 
   tooltip = "CHOOSE THE DIPLOMACY FEE PER YEAR BASED ON ALLIED PLAYER'S SCORE, PLAYERS WITH MINOR SCORE PAY RUs (Default: None)", 
   default = 0, 
   visible = 0, 
   choices = 
   {
    "None",  "1",
    "Few",  "2",     
    "Normal",  "3",
    "High",  "4",   
    "Maximum",  "5", 
   },
 },               
---COMPLEX HELP----------------------
  {
   name = "complexhelp",
   locName = "Complex Help",
   tooltip = "ENABLE/DISABLE THE COMPLEX HELP INTERFACE (Default: Enable)",
   default = 1,
   visible = 0,
   choices =
   {
    "Enable",  "enable",            
    "Disable",  "disable", 
   },
  }, 
---UNIT CAP--------------------------
  { 
   name = "unitcapsrank", 
   locName = "Unit Capacity", 
   tooltip = "CHOOSE THE MAX CAPACITY OF YOUR FLEET, SETS HOW MANY PILOTS/OFFICERS YOU CAN RECRUIT IN ANY RANK, HIGH CAPACITY CAUSES LAG WITH LOW-END PC (Default: Normal)", 
   default = 1, 
   visible = 1, 
   choices = 
   { "Few", "1", 
     "Normal", "2",
     "High", "3",
     "Maximum", "4",
   },
 },        
---AUTO SAVE--------------------------
  { 
   name = "autosave", 
   locName = "Auto Save", 
   tooltip = "CHOSE THE AUTO SAVE MENU TIMING (ONLY SINGLE PLAYER) (Default: Disable)", 
   default = 0, 
   visible = 0, 
   choices = 
   {
    "Disable",  "0",
    "5 Years",  "5", 
    "10 Years",  "10",             
    "15 Years",  "15", 
   },
 },  
---INTERFACE--------------------------
  { 
   name = "interface", 
   locName = "System Clock", 
   tooltip = "CHOSE THE RATE AT WHICH THE SYSTEM UPDATES THE GAME PARAMETERS (Default: Low-End Systems)", 
   default = 2, 
   visible = 0, 
   choices = 
   {
    "Low-End Systems",  "1",
    "Normal",  "2", 
    "High-End Systems",  "3",
   },
 },                    
}
---DATA-------------------------------------------------------------------------
dofilepath("data:scripts/SCAR/SCAR_Util.lua")
dofilepath("data:leveldata/multiplayer/lib/oninit.lua")
dofilepath("data:leveldata/multiplayer/lib/gametime.lua")
dofilepath("data:leveldata/multiplayer/lib/main.lua")
dofilepath("data:leveldata/multiplayer/lib/cinematic.lua")
dofilepath("data:leveldata/multiplayer/lib/computerspy.lua")
dofilepath("data:leveldata/multiplayer/lib/megalith.lua")
dofilepath("data:leveldata/multiplayer/lib/fusion.lua")
dofilepath("data:leveldata/multiplayer/lib/population.lua")
dofilepath("data:leveldata/multiplayer/lib/maintenance.lua")
dofilepath("data:leveldata/multiplayer/lib/ai.lua")
dofilepath("data:leveldata/multiplayer/lib/research.lua")
dofilepath("data:leveldata/multiplayer/lib/energy.lua")
dofilepath("data:leveldata/multiplayer/lib/explosiondamage.lua")
dofilepath("data:leveldata/multiplayer/lib/sobgroupfunctions.lua")
dofilepath("data:leveldata/multiplayer/lib/viper.lua")
dofilepath("data:leveldata/multiplayer/lib/tango.lua")
dofilepath("data:leveldata/multiplayer/lib/heavyioncannon.lua")
dofilepath("data:leveldata/multiplayer/lib/interface.lua")
dofilepath("data:leveldata/multiplayer/lib/trade.lua")
dofilepath("data:leveldata/multiplayer/lib/transportcell.lua")
dofilepath("data:leveldata/multiplayer/lib/generic.lua")
dofilepath("data:leveldata/multiplayer/lib/repairing.lua")
dofilepath("data:leveldata/multiplayer/lib/weight.lua")
dofilepath("data:leveldata/multiplayer/lib/experience.lua")
dofilepath("data:leveldata/multiplayer/lib/keepposition.lua")
dofilepath("data:leveldata/multiplayer/lib/efficency.lua")
dofilepath("data:leveldata/multiplayer/lib/pop.lua")
----------------
sundamageinterface = 0
cons = {0,0,0,0,0,0}
lastUniverse_GameTime = 0
lastUniverse_GameTimeMSDock = { 0, 0, 0, 0, 0, 0 }
mscollateraldamage = {0,0,0,0,0,0}
rscollateraldamage = {0,0,0,0,0,0}
wscollateraldamage = {0,0,0,0,0,0}
pscollateraldamage = {0,0,0,0,0,0}
cscollateraldamage = {0,0,0,0,0,0}
bloccofightersquadron = { 0, 0, 0, 0, 0, 0 }
bloccocorvettesquadron = { 0, 0, 0, 0, 0, 0 }
bloccocorvettesquadron1 = { 0, 0, 0, 0, 0, 0 }
battlearena = { 1, 2000, 0, 0, 200, 0}
bloccoshield = { 1, 1, 1, 1, 1, 1 }
bloccomsdocking = { 0, 0, 0, 0, 0, 0 }
bloccorsdocking = { 0, 0, 0, 0, 0, 0 }
bloccowsdocking = { 0, 0, 0, 0, 0, 0 }
bloccopsdocking = { 0, 0, 0, 0, 0, 0 }
bloccocsdocking = { 0, 0, 0, 0, 0, 0 }
powerup_ru_counter = { 0, 0, 0, 0, 0, 0 }
powerup_power_counter = { 0, 0, 0, 0, 0, 0 }
powerup_speed_counter = { 0, 0, 0, 0, 0, 0 }
powerup_defense_counter = { 0, 0, 0, 0, 0, 0 }
powerup_attack_counter = { 0, 0, 0, 0, 0, 0 }
powerup_build_counter = { 0, 0, 0, 0, 0, 0 }
powerup_repair_counter = { 0, 0, 0, 0, 0, 0 }
powerup_sensor_counter = { 0, 0, 0, 0, 0, 0 }
exp1 = 0
enablebtnparade = 0
enablebtnmsparade = 0
enablebtncallisto = 0    
enablebtnperforate = 0 
enablebtnheavyioncannon = 0 
enablebtnnuclear = 0 
honourstartList = { 0, 0, 0, 0, 0, 0 }
honourstartList1 = { 0, 0, 0, 0, 0, 0 }
honorinit = 0
RUMaxCapacityList = { 5000, 5000, 5000, 5000, 5000, 5000 }
tempodicostruzioneList = { 1, 1, 1, 1, 1, 1 }
unitname = { "Hygor ", "Apollo ", "Valkyr ", "Neptune ", "Frozen Space ", "Deep Sighter ", "Vega ", "Worst Enemy ", "Stars Rippler ", "Cluster ", "Leviathan ", "Martyrs of Kharak ", "Veil of Shadows ", "Blind Seer ", "Harvester of Souls "}
unitnumber = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
objectiveinit = 1
rurace = 0
rankrace = 0
domainrace = 0
aiaidshonour = 1
honorbonus = { 0, 0, 0, 0, 0, 0 }
LastDebrisPop = { 0, 0, 0, 0, 0, 0 }
Stats_Extra = { 0, 0, 0, 0, 0, 0 }
bloccoioncannon = { 1, 1, 1, 1, 1, 1 } 
bloccopermanentshieldms = { 1, 1, 1, 1, 1, 1 } 
bloccopermanentshieldcf = { 1, 1, 1, 1, 1, 1 } 
hapagatoList = { 0, 0, 0, 0, 0, 0 }
megalithnoownercount = 0
prioritamessaggio = { 0, 0, 0, 0, 0, 0 }
casualizzatore = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
bloccomegalith = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
cyclesave = 0
abilityList = { AB_Move, AB_Attack, AB_Guard, AB_Stop, AB_Hyperspace, AB_Retire, AB_Scuttle, AB_Builder, AB_Dock, AB_Salvage, AB_AcceptDocking, AB_Parade, AB_Repair, AB_Targeting, AB_SpecialAttack, AB_SensorPing, AB_Mine, AB_None, AB_Steering, AB_Sensors, AB_Lights, AB_UseSpecialWeaponsInNormalAttack, AB_FormHyperspaceGate, AB_HyperspaceViaGate, AB_DefenseField, AB_DefenseFieldShield, AB_HyperspaceInhibitor, AB_Cloak }
fusionList = { 0, 0, 0, 0, 0, 0 }
megalithList = { 0, 0, 0, 0, 0, 0 }
planetList = { 0, 0, 0, 0, 0, 0 }
orbitalstationList = { 0, 0, 0, 0, 0, 0 }
orbitalstationListOut = { 0, 0, 0, 0, 0, 0 }
MaxCivCap = { 0, 0, 0, 0, 0, 0 }
planetPopulationList = {
                       {name="Planet Mercury",      planet="planet_mercury",   population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Venus",        planet="planet_venus",     population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Earth",        planet="planet_earth",     population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Satellite Moon",      planet="planet_moon",      population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Mars",         planet="planet_mars",      population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Jupiter",      planet="planet_jupiter",   population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Satellite Europa",    planet="planet_europa",    population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Satellite Io",        planet="planet_io",        population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Satellite Callisto",  planet="planet_callisto",  population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Satellite Ganymeade", planet="planet_ganymeade", population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Saturn",       planet="planet_saturn",    population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Uranus",       planet="planet_uranus",    population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Neptune",      planet="planet_neptune",   population=0, car1=" ", car2=" ", car3=" ", car4=" "},
                       {name="Planet Pluto",        planet="planet_pluto",     population=0, car1=" ", car2=" ", car3=" ", car4=" "},											 
											 }                    
computerspyList = { 0, 0, 0, 0, 0, 0 }
computerspyblockList = { 0, 0, 0, 0, 0, 0 }
tradeList = { 0, 0, 0, 0, 0, 0 }
tradeListSummary = { 0, 0, 0, 0, 0, 0 }
RUaggiuntiva = { 0, 0, 0, 0, 0, 0 }
diplomacyListSummary = { 0, 0, 0, 0, 0, 0 }
gradoa = {"", "", "", "", "", ""}
gradoList = {"", "", "", "", "", ""}
lastgradoList = {"", "", "", "", "", ""}
honorList = { 0, 0, 0, 0, 0, 0 }
honorList1 = { 0, 0, 0, 0, 0, 0 }
pilotmaxList = { 0, 0, 0, 0, 0, 0 }
officermaxList = { 0, 0, 0, 0, 0, 0 }
pilotpopList = { 0, 0, 0, 0, 0, 0 }
LastpilotpopList = { 0, 0, 0, 0, 0, 0 }
officerpopList = { 0, 0, 0, 0, 0, 0 }
LastofficerpopList = { 0, 0, 0, 0, 0, 0 }
pilotrecruitList = { 150, 150, 150, 150, 150, 150 }
officerrecruitList = { 10, 10, 10, 10, 10, 10 }
pilotrecruiterList = { 2, 2, 2, 2, 2, 2 }
officerrecruiterList = { 1, 1, 1, 1, 1, 1 }
pilotpopdisplayList = { 0, 0, 0, 0, 0, 0 }
fighter = { 0, 0, 0, 0, 0, 0 } 
corvette = { 0, 0, 0, 0, 0, 0 } 
frigate = { 0, 0, 0, 0, 0, 0 } 
platform = { 0, 0, 0, 0, 0, 0 } 
capital = { 0, 0, 0, 0, 0, 0 } 
armedcapital = { 0, 0, 0, 0, 0, 0 } 
utility = { 0, 0, 0, 0, 0, 0 } 
weapon = { 0, 0, 0, 0, 0, 0 } 
NeededPilots = { 0, 0, 0, 0, 0, 0 }
NeededOfficers = { 0, 0, 0, 0, 0, 0 }
RUList = { 0, 0, 0, 0, 0, 0 }
researchList = { 0, 0, 0, 0, 0, 0 }
maintenanceList = { 0, 0, 0, 0, 0, 0 }
scoreList = { 0, 0, 0, 0, 0, 0 }
Stats_ExtraGatheredRUs = { 0, 0, 0, 0, 0, 0 }
juggernaughtList = { 0, 0, 0, 0, 0, 0 }
spytime = { 55.5, 55.5, 55.5, 55.5, 55.5, 55.5 }
eventitime = { 6.88, 6.88, 6.88, 6.88, 6.88, 6.88 }
CPUList = {"CPU1", "CPU2", "CPU3", "CPU4", "CPU5"}
CPULODList = {" ", " ", " ", " ", " ", " "}
PlayerBlockNameList = { 0, 0, 0, 0, 0, 0 }
CPULODvalueList = { 0, 0, 0, 0, 0, 0 }
FocusListMissile = {
                   { numfocusbomb=0, actualfocusbomb=0, numfocusmissile=0, actualfocusmissile=0, numfocusmine=0, actualfocusmine=0, },
                   { numfocusbomb=0, actualfocusbomb=0, numfocusmissile=0, actualfocusmissile=0, numfocusmine=0, actualfocusmine=0, },
                   { numfocusbomb=0, actualfocusbomb=0, numfocusmissile=0, actualfocusmissile=0, numfocusmine=0, actualfocusmine=0, },
                   { numfocusbomb=0, actualfocusbomb=0, numfocusmissile=0, actualfocusmissile=0, numfocusmine=0, actualfocusmine=0, },
                   { numfocusbomb=0, actualfocusbomb=0, numfocusmissile=0, actualfocusmissile=0, numfocusmine=0, actualfocusmine=0, },
                   { numfocusbomb=0, actualfocusbomb=0, numfocusmissile=0, actualfocusmissile=0, numfocusmine=0, actualfocusmine=0, },                   
                   }
MaxCount = { 0, 0, 0, 0, 0, 0 }                   
playerList = {"Player1", "Player2", "Player3", "Player4", "Player5", "Player6"}
shipList = {"hgn_scout",
            "hgn_interceptor",
            "hgn_attackbomber", 
            "hgn_lbomber",
            "hgn_defender", 
            "hgn_railgunfighter",
            "hgn_hft",
            "hgn_attackbomberheavy", --8
            --"vgr_scout",
            --"vgr_interceptor",
            --"vgr_lancefighter", 
            --"vgr_bomber",
            --"vgr_defender",
            
            "hgn_assaultcorvette",
            "hgn_pulsarcorvette",
						"hgn_bombervette",
            "hgn_minelayercorvette",
            "hgn_multiguncorvette",
            "hgn_cth",  
            "hgn_cthion",  --15
            --"vgr_missilecorvette",
            --"vgr_lasercorvette",
            --"vgr_minelayercorvette",
            --"vgr_commandcorvette",
            --"vgr_standvette",
            --"vgr_multilancecorvette",
            
            "hgn_assaultfrigate",
            "hgn_torpedofrigate",
            "hgn_lrms",
            "hgn_marinefrigate",
            "hgn_defensefieldfrigate",            
            "hgn_ioncannonfrigate",
            "hgn_tulwar",  --22
            --"vgr_heavymissilefrigate",
            --"vgr_assaultfrigate",
            --"vgr_infiltratorfrigate",
            --"vgr_artilleryfrigate",
            --"vgr_empfrigate",
            
            "hgn_defenderdrone",
            "hgn_gunturret",
            "hgn_pulsarturret",
            "hgn_ionturret",
            "hgn_missileturret",
            "hgn_defensefieldturret",
            "hgn_rts",
            "hgn_sentinel",
            "hgn_ionsentinel",
            "hgn_artillerysentinel",
            --"hgn_viper",
            --"hgn_tangomine",
            "hgn_massiveturret", --33 
            --"hgn_nuclearbomb",  
            --"vgr_weaponplatform_gun",
            --"vgr_weaponplatform_missile",
            --"vgr_hyperspace_platform",
            --"vgr_cruse",
            
            "hgn_mothership",
            "hgn_lightcarrier",
            "hgn_researchstation",
            "hgn_crewstation",
            "hgn_power",
            "hgn_combatbase",
            "hgn_carrier",                 
            "hgn_hyperspacestation", 
            "hgn_shipyard",
            "hgn_battlecarrier",            
            "hgn_commandfortress",  
            "hgn_battlestation",  --45
            
            "hgn_destroyer",
            "hgn_sweeperdestroyer",
            "hgn_missiledestroyer",
            "hgn_iondestroyer",
            "hgn_advdestroyer",
            "hgn_artillerydestroyer",
            "hgn_juggernaught",     
            "hgn_cruisera",   
            "hgn_cruiserb",      
            "hgn_tanker",        
            "hgn_battlecruiser",  
            "hgn_vortex",  
            "hgn_battleship",
            "hgn_ark",  --59            
            --"vgr_mothership",
            --"vgr_carrier",
            --"vgr_shipyard",
            --"vgr_battlecruiser",
            --"vgr_alkhalid",
            --"vgr_destroyer",
            
            "hgn_resourcecollector",
            "hgn_resourcecontroller",
            "hgn_scaver",
            "hgn_container",
            "hgn_minecontainer",
            "hgn_probe",
            "hgn_proximitysensor",
            "hgn_ecmprobe",  
            "hgn_hscore",             
            "hgn_patcher",       
            "hgn_drone",  
            "hgn_transportcell",
            "meg_gehenna_1ctm",  --72          
            --"vgr_resourcecollector",
            --"vgr_resourcecontroller",
            --"vgr_probe",
            --"vgr_probe_prox",
            --"vgr_probe_ecm",            
            
            --"hgn_viper",
            --"hgn_tangomine",            
            "hgn_nuclearbomb",  --73           
            }
audio_block_unitcapreached = { 0, 0, 0, 0, 0, 0 }
Lastruharvested = { 0, 0, 0, 0, 0, 0 }
Lastruspent = { 0, 0, 0, 0, 0, 0 }
gametime = 99
year = 0
musiclenght = 0
numPlayer = 0
numPlayerhuman = 0
--numPlayerai = 0  
help = 0
flashhelp = 0
placetemp = 0
scan = 0
tempocinematic = 3
lastrList = { -1, -1, -1, -1, -1, -1 }
lastec_random_numberList = { -1, -1, -1, -1, -1, -1 }
nms = 0
nsy = 0
nj = 0
njCounter = 0
nnb = 0
nc = 0
nbc = 0
nd = 0
nmc = 0
ntrc = 0
nmb = 0
nrs = 0
nws = 0
nps = 0
ncs = 0
ncf = 0
nf = 0
nmr = 0
nrc = 0
nhs = 0
npsa = { 0, 0, 0, 0, 0, 0 }
nfi = { 0, 0, 0, 0, 0, 0 }
nco = { 0, 0, 0, 0, 0, 0 }
np = 0
nvm = { 0, 0, 0, 0, 0, 0 }
ntm = { 0, 0, 0, 0, 0, 0 }
ntc = { 0, 0, 0, 0, 0, 0 }
nonp = { 0, 0, 0, 0, 0, 0 }
npc = { 0, 0, 0, 0, 0, 0 }
npca = { 0, 0, 0, 0, 0, 0 }
nec = { 0, 0, 0, 0, 0, 0 }
nrpsy = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
nrpcf = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
nrpms = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
nrps = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
ndcf = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
alternatejug = { 0, 0, 0, 0, 0, 0 }
capturePlayerIndex = 0
collectorinsidetime = 0
--firstdestroyerList = { 0, 0, 0, 0, 0, 0 }
--firstiondestroyerList = { 0, 0, 0, 0, 0, 0 }
--firstcarrierList = { 0, 0, 0, 0, 0, 0 }
--firstresearchstationList = { 0, 0, 0, 0, 0, 0 }
--firstshipyardList = { 0, 0, 0, 0, 0, 0 }
--firstbattlecruiserList = { 0, 0, 0, 0, 0, 0 }

canbuilddreadnaught = { 0, 0, 0, 0, 0, 0 }
canbuildgunturret = { 0, 0, 0, 0, 0, 0 }
canbuildpulsarturret = { 0, 0, 0, 0, 0, 0 }
canbuildcollector = { 0, 0, 0, 0, 0, 0 }
canbuildscout = { 0, 0, 0, 0, 0, 0 }
canbuildminelayercorvette = { 0, 0, 0, 0, 0, 0 }
canbuildionturret = { 0, 0, 0, 0, 0, 0 }
canbuildmissileturret = { 0, 0, 0, 0, 0, 0 }
canbuildrts = { 0, 0, 0, 0, 0, 0 }
canbuildcontroller = { 0, 0, 0, 0, 0, 0 }
canbuildscaver = { 0, 0, 0, 0, 0, 0 }
canbuildinterceptor = { 0, 0, 0, 0, 0, 0 }
canbuildbomber = { 0, 0, 0, 0, 0, 0 }
canbuilddefender = { 0, 0, 0, 0, 0, 0 }
canbuildlbomber = { 0, 0, 0, 0, 0, 0 }
canbuildrailgunfighter = { 0, 0, 0, 0, 0, 0 }
canbuildhft = { 0, 0, 0, 0, 0, 0 }
canbuildbomberheavy = { 0, 0, 0, 0, 0, 0 }
canbuildgunship = { 0, 0, 0, 0, 0, 0 }
canbuildpulsargunship = { 0, 0, 0, 0, 0, 0 }
canbuildflak = { 0, 0, 0, 0, 0, 0 }
canbuildtorpedo = { 0, 0, 0, 0, 0, 0 }
canbuildlrms = { 0, 0, 0, 0, 0, 0 }
canbuildmarine = { 0, 0, 0, 0, 0, 0 }
canbuilddefensefield = { 0, 0, 0, 0, 0, 0 }
canbuildioncannon = { 0, 0, 0, 0, 0, 0 }
canbuildcth = { 0, 0, 0, 0, 0, 0 }
canbuildtulwar = { 0, 0, 0, 0, 0, 0 }
canbuildmultigun = { 0, 0, 0, 0, 0, 0 }
canbuilddestroyer = { 0, 0, 0, 0, 0, 0 }
canbuildiondestroyer = { 0, 0, 0, 0, 0, 0 }
canbuildmissiledestroyer = { 0, 0, 0, 0, 0, 0 }
canbuildadvdestroyer = { 0, 0, 0, 0, 0, 0 }
canbuildcruisera = { 0, 0, 0, 0, 0, 0 }
canbuildcruiserb = { 0, 0, 0, 0, 0, 0 }
canbuildtanker = { 0, 0, 0, 0, 0, 0 }
canbuildjuggernaught = { 0, 0, 0, 0, 0, 0 }
canbuildrs = { 0, 0, 0, 0, 0, 0 }
canbuildbc = { 0, 0, 0, 0, 0, 0 }
canbuildv = { 0, 0, 0, 0, 0, 0 }
canbuildbs = { 0, 0, 0, 0, 0, 0 }
canbuildlc = { 0, 0, 0, 0, 0, 0 }
canbuildc = { 0, 0, 0, 0, 0, 0 }
canbuildsy = { 0, 0, 0, 0, 0, 0 }
canbuildcf = { 0, 0, 0, 0, 0, 0 }
canbuildhs = { 0, 0, 0, 0, 0, 0 }
canbuildtransportcell = { 0, 0, 0, 0, 0, 0 }
resourcecollectorextractionList = { 0.00019, 0.00019, 0.00019, 0.00019, 0.00019, 0.00019 }
minecontainerrurateList = { 0.0025, 0.0025, 0.0025, 0.0025, 0.0025, 0.0025 }
minecontainerloadList = { 0.634, 0.634, 0.634, 0.634, 0.634, 0.634 }
minecontainerdropoffList = { 0.0025, 0.0025, 0.0025, 0.0025, 0.0025, 0.0025 }
minecontainerrurateDisplayList = { 5, 5, 5, 5, 5, 5 }
minecontainerloadDisplayList = { 4000, 4000, 4000, 4000, 4000, 4000 }
minecontainerdropoffDisplayList = { 5, 5, 5, 5, 5, 5 }
availableruList = { 0, 0, 0, 0, 0, 0 }
powerList = { 4, 4, 4, 4, 4, 4 }
powerListMax = { 1000, 1000, 1000, 1000, 1000, 1000 }
powerListStored = { 1000, 1000, 1000, 1000, 1000, 1000 }
LastpowerList = { 4, 4, 4, 4, 4, 4 }
LastpowerListStored = { 1000, 1000, 1000, 1000, 1000, 1000 }
LastpowerListMax = { 1000, 1000, 1000, 1000, 1000, 1000 }
hwsaving = 0
canbuildps = { 0, 0, 0, 0, 0, 0 }
canbuildws = { 0, 0, 0, 0, 0, 0 }
bloccoparade = { 0, 0, 0, 0, 0, 0 }
interfacecleanedtot = { 0, 0, 0, 0, 0, 0 }
gamespeedprogression = 0
---EVENTS---------------------------------------------------------------------------------------------
Events = {}
Events.endGame  =
    {{{"wID = Wait_Start(5)","Wait_End(wID)"},},}

Events.Pause  =
    {{ HW2_Pause(1),},}    
Events.UnPause  =
    {{ HW2_Pause(0),},}                
    
Events.startcinematic =
    {{HW2_Letterbox(1),},
    {{ "Camera_AllowControl(0)", "", },    
    { "Universe_EnableSkip(0)", "", },
    { "Universe_AllowPlayerOrders(0)", "", },
    { "SobGroup_DeSelectAll()", "", }, 
    --{ "Camera_FocusSave()", "", },    
    { "Sensors_Toggle(0)", "", },},}    
    
Events.focusspeedfix =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 725, 100000, 0)","",},},}    
Events.focusspeedout =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 575, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 1175, 0, 13)","",},},}  
Events.focusspeedmaxfix =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 100000, 0)","",},},}    
Events.focusspeedmaxout =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 725, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 1325, 0, 11)","",},},}   
            
Events.focusout =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 300, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 0, 18)","",},},}   
Events.focusoutslow =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 300, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 0, 24)","",},},}   
Events.focusoutfast =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 300, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 0, 12)","",},},}              
Events.focusfix =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 575, 100000, 0)","",},},}    
Events.focusfixfar =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 1175, 100000, 0)","",},},}      
Events.focusfixfarfar =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 1775, 100000, 0)","",},},}          
Events.focusin =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 275, 0, 18)","",},},} 
Events.focusinslow =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 275, 0, 24)","",},},}  
Events.focusinfast =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 275, 0, 12)","",},},}   
      
Events.focusbigcapitalout =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 625, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 1225, 0, 20)","",},},}  
Events.focusbigcapitaloutslow =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 625, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 1225, 0, 26)","",},},} 
Events.focusbigcapitaloutfast =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 625, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 1225, 0, 14)","",},},}               
Events.focusbigcapitalfix =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 875, 100000, 0)","",},},}      
Events.focusbigcapitalfixfar =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 1475, 100000, 0)","",},},}    
Events.focusbigcapitalfixfarfar =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 2075, 100000, 0)","",},},}              
Events.focusbigcapitalin =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 1225, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 625, 0, 20)","",},},}     
Events.focusbigcapitalinslow =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 1225, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 625, 0, 26)","",},},}      
Events.focusbigcapitalinfast =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 1225, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 625, 0, 14)","",},},}      
    
Events.focusfixext =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 3950, 100000, 0)","",},},}  
Events.focusfixextext =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 5925, 100000, 0)","",},},}   
Events.focusfixextextext =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 7900, 100000, 0)","",},},}                                                      

Events.stopcinematic =   
    {{HW2_Letterbox(0),},
    {{ "Universe_AllowPlayerOrders(1)", "", },    
    { "Camera_AllowControl(1)", "", },},} 
    
Events.stopcinematicrestore =   
    {{HW2_Letterbox(0),},
    {{ "Universe_AllowPlayerOrders(1)", "", },
    { "Camera_FocusRestore()", "", },    
    { "Camera_AllowControl(1)", "", },},}
    
Events.loc = 
    {{ HW2_LocationCardEvent("THE UNIVERSE WILL ALWAYS BE FULL OF DEATH... THE UNIVERSE HAS NO ALTERNATIVE", 15),},}    