GameRulesName="Simplex Survival"
Description = "Waves of enemies will attack and only the strongest player will survive. Good for serious target practice or kaboom watching." 
Directories =
{
  Levels = "data:LevelData\\Multiplayer\\complexlevels\\",  
}
---GAME SETUP----------------------------------------------------------------------------------------------
GameSetupOptions =
{
---Enemy Player-------------
  {
   name = "survival_waveowner",
   locName = "Wave Owner Location        ---",
   tooltip = "CHOOSE WHICH PLAYER POSITION IS THE OWNER OF THE SPAWNED WAVES (Default: Player at the last position)",
   default = 5,
   visible = 1,
   choices =
   {
    "1", "0",
    "2", "1",
    "3", "2",
    "4", "3",
    "5", "4",
    "6", "5",
   },
  },
---Wave Size Multiplier----------------
  {
   name = "survival_wavesize",
   locName = "Wave Size",
   tooltip = "ADJUST THE SIZE OF WAVES TO BE SPAWNED, HIGHER VALUE MEANS MORE ENEMIES (Default: 1.0x)",
   default = 2,
   visible = 1,
   choices =
   {
    "0.5x", "0.5",
    "0.75x", "0.75",
    "1.0x", "1.0",
    "1.5x", "1.5",
    "2.0x", "2.0",
    "2.5x", "2.5",
    "3.0x", "3.0",
    "Dynamic", "-1",
   },
  }, 
---Wave Frequency----------------
  {
   name = "survival_wavefrequency",
   locName = "Wave Frequency",
   tooltip = "ADJUST THE FREQUENCY OF WAVES TO BE SPAWNED, HIGHER VALUE MEANS FASTER INTERVAL (Default: 1.0x)",
   default = 2,
   visible = 1,
   choices =
   {
    "0.5x", "0.5",
    "0.75x", "0.75",
    "1.0x", "1.0",
    "1.5x", "1.5",
    "2.0x", "2.0",
    "2.5x", "2.5",
    "3.0x", "3.0",
    "Dynamic", "-1",
   },
  }, 
---Wave LOD----------------
  {
   name = "survival_wavelod",
   locName = "Wave LOD",
   tooltip = "ADJUST THE LEVEL OF DIFFICULTY OF WAVES, HIGHER VALUE MEANS FASTER ESCALATION (Default: 1.0x)",
   default = 2,
   visible = 1,
   choices =
   {
    "0.8x", "0.8",
    "0.9x", "0.9",
    "1.0x", "1.0",
    "1.1x", "1.1",
    "1.2x", "1.2",
    "1.3x", "1.3",
    "1.4x", "1.4",
    "Dynamic", "-1",
   },
  }, 
---Wave Unit Cap----------------
  {
   name = "survival_waveunitcap",
   locName = "Wave Unit Cap",
   tooltip = "ADJUST THE MAX UNITS ALLOWED FROM ALL WAVES AT ANY MOMENT, HIGH VALUE COULD MELT YOUR PC (Default: 150)",
   default = 2,
   visible = 1,
   choices =
   {
    "50", "50",
    "100", "100",
    "150", "150",
    "200", "200",
    "250", "250",
    "300", "300",
    "Dynamic", "-1",
   },
  }, 
---Wave Count----------------
  {
   name = "survival_wavecount",
   locName = "Wave Count",
   tooltip = "ADJUST THE TOTAL NUMBER OF WAVES TO BE SPAWNED, HIGHER VALUE IS FOR LONGER GAME (Default: 80)",
   default = 5,
   visible = 1,
   choices =
   {
    "30", "30",
    "40", "40",
    "50", "50",
    "60", "60",
    "70", "70",
    "80", "80",
    "100", "100",
    "150", "150",
    "200", "200",
    "<c=be0000>Infinite</c>", "-1",
   },
  }, 
---RESOURCE MULITPLIER----------------
  {
   name = "resources",
   locName = "Resource Multiplier",
   tooltip = "ADJUST THE AMOUNT OF RESOURCES PER ASTEROID, FEW RESOURCES CAUSE A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Low", "0.75",
    "Normal", "1.6",
    "High", "3.3",  
    "Maximum", "7",  
   },
  },
---STARTING FLEET--------------------
  {
   name = "startwith",
   locName = "Starting Ships",
   tooltip = "CHOOSE FLEET ON START, THIS WILL DETERMINE PLAY STYLE AS WELL (Default: Survival Pro)",
   default = 9,
   visible = 1,
   choices =
   {
    "Reconnaissance",  "0",
    "Colonization",  "1",
    "Supply Line",  "8",
    "Task Force",  "2",
    "Standard",  "3", 
    "Armada",  "6",   
    "Defcon",  "10", 
    "Outpost",  "4",
    "Expedition",  "9",
    "Survival Pro",  "5",
   },
  },    
---STARTING HONOUR-------------
  {
   name = "honourstart",
   locName = "Starting Honour Points",
   tooltip = "CHOOSE THE AMOUNT OF STARTING HONOUR POINTS, LESS STARTING HONOUR CAUSES A TACTICAL MATCH (Default: 10)",
   default = 1,
   visible = 1,
   choices =
   {
    "0 (Ensign)", "1",    
    "10 (Ensign)", "2",     
    "20 (Ensign)", "3",   
    "30 (Lieutenant)", "4", 
    "80 (Commander)", "5",    
    "150 (Captain)", "6",    
    "240 (Commodore)", "7", 
    "350 (Admiral)", "8",
    "480 (Fleet Admiral)", "9",                    
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
    "Few", "1",
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
   default = 3,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",                          
   },
  },
---HYPERSPACE USE-------------
  {
   name = "hyperspace",
   locName = "Hyperspace Accessibility",
   tooltip = "CHOOSE THE ACCESSIBILITY OF HYPERSPACE OPERATIONS, FEW ACCESSIBILITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 3,
   visible = 0,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3", 
    "Maximum", "4",                                                       
   },
  },
---BATTLE DURATION-------------
  {
   name = "unithealth",
   locName = "Battle Duration",
   tooltip = "ADJUST THE BATTLE DURATION (UNIT RESISTANCE/FIREPOWER), IT ALSO AFFECTS THE LIFESPAN OF HULKS (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Short", "1",
    "Normal", "2",
    "Long", "3",   
    "Maximum", "4",                         
   },
  },  
---UNIT BEHAVIOR-------------
  {
   name = "unitbehavior",
   locName = "Unit Behaviour",
   tooltip = "ADJUST UNIT SPEED AND MANEUVERABILITY (Default: Realistic)",
   default = 3,
   visible = 1,
   choices =
   {
    "Snail", "-2",
    "Turtle", "-1",
    "Llama", "0",
    "Realistic", "1",
    "Crazy", "2",
   },
  },    
---AI--------------------------
  {
   name = "aiaids",
   locName = "AI Augmented Skills",
   tooltip = "ADVANCED AI PROGRAMMING, ALLOWS CPU PLAYERS TO BEHAVE LIKE HARDCORE HUMAN EXPERTS! (Default: Godlike)",
   default = 4,
   visible = 1,
   choices =
   {
    "Off", "1",
    "Wannabe", "2",
    "Tryhard", "3",
    "Badass", "4",
    "Godlike", "5",
    --"Test (Dev./Disable)", "6",
   },
  },
---MILITARY--------------------------
  {
   name = "military",
   locName = "AI Strategy",
   tooltip = "STEAMROLLER: AI ATTACKS RARELY BY MANY SHIPS; GUERRILLA: AI ATTACKS OFTEN BY FEW SHIPS (Default: Auto)",
   default = 5,
   visible = 1,
   choices =
   {
    "Steamroller", "1",
    "Attrition", "2",
    "Manoeuvre", "3",
    "Blitz", "4",
    "Guerrilla", "5",
    "Intelligent (Auto)", "6",
    --"Test (Dev./No AI)", "7",
   },
  },                                                                           
---CPU NAME--------------------------
  {
   name = "cpuname",
   locName = "CPU Name",
   tooltip = "DECIDE HOW CPU PLAYERS ARE TAGGED (Default: CPU)",
   default = 0,
   visible = 1,
   choices =
   {
    "CPU", "1",
    "Racial", "2",
    "Personal", "3",
   },
  },
---START LOCATION OPTION--------------
  {
   name = "startlocation",
   locName = "Start Location",
   tooltip = "CHOOSE THE TYPE OF START LOCATION (Default: Fixed)",
   default = 1,
   visible = 1,
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
   tooltip = "PREVENT PLAYERS FROM CHANGING TEAMS? (Default: No)",
   default = 1,
   visible = 1,
   choices =
   {
    "$3221", "yes",
    "$3222", "no",
   },
  },
---DIPLOMACY FEE--------------------------
  { 
   name = "diplomacy", 
   locName = "Diplomacy Fee", 
   tooltip = "ADJUST THE DIPLOMACY FEE PER YEAR BASED ON ALLIED PLAYERS' SCORE, ALLIED PLAYERS WITH MINOR SCORE PAY RUs (Default: None)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "None",  "1",
    "Low",  "2",     
    "Normal",  "3",
    "High",  "4", 
    "Maximum",  "5",    
   },
  },      
---SHARE RUs-----------------
  {
   name = "sharerus",
   locName = "Share RUs",
   tooltip = "SHARE A COMMON RU POOL WITH ALLIES (Default: No)",
   default = 1,
   visible = 1,
   choices =
   {
    "Yes", "yes",
    "No", "no",
   },
  },
---WIN CONDITION-------------------
  {
   name = "wincondition",
   locName = "Primary Objective",
   tooltip = "CHOOSE THE WIN CONDITION (Default: Destroy Production)",
   default = 1,
   visible = 1,
   choices =
   {
    "Destroy Mothership",	"DestroyMothership",
    "Destroy Production", "DestroyProduction",   
    "Destroy All",	"DestroyAll",
   },
 },
---SECONDARY OBJECTIVES--------------------------
  { 
   name = "secondaryobjectives", 
   locName = "Secondary Objectives", 
   tooltip = "ENABLE/DISABLE SECONDARY OBJECTIVES (Default: Disable)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "Disable",  "1",
    "Resource Race",  "2",     
    "Rank Race",  "3",
    "Domain Race",  "4",
    "All (3 Races)",  "5",
   },
 },
---UNIT CAP--------------------------
  { 
   name = "unitcapsrank", 
   locName = "Pilots Capacity", 
   tooltip = "SET HOW MANY PILOTS PLAYERS CAN RECRUIT AT MOST, HIGHER CAPACITY REQUIRES BETTER GAMING PC (Default: 690)", 
   default = 1, 
   visible = 1, 
   choices = 
   { "570", "1", 
     "690", "2",
     "810", "3",
     "930", "4",
   },
 },        
  { 
   name = "unitcapsofficer", 
   locName = "Officers Capacity", 
   tooltip = "SET HOW MANY OFFICERS PLAYERS CAN RECRUIT AT MOST, HIGHER CAPACITY REQUIRES BETTER GAMING PC (Default: 25)", 
   default = 1, 
   visible = 1, 
   choices = 
   { "15", "1", 
     "25", "2",
     "35", "3",
     "45", "4",
   },
 },  
---HEALTH TWEAK--------------------------
  { 
   name = "tweakfighterhealth", 
   locName = "Strengthen Fighters", 
   tooltip = "APPLY A MULTIPLIER TO THE HEALTH OF ALL FIGHTERS? (Default: Disable)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "Disable",  "0",
    "2X",  "1", 
    "4X",  "2",             
    "8X",  "3", 
   },
  }, 
  { 
   name = "tweakcorvettehealth", 
   locName = "Strengthen Corvettes", 
   tooltip = "APPLY A MULTIPLIER TO THE HEALTH OF ALL CORVETTES? (Default: Disable)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "Disable",  "0",
    "2X",  "1", 
    "4X",  "2",             
    "8X",  "3", 
   },
  }, 
---ACCOLADES--------------------------
  { 
   name = "incentive", 
   locName = "Incentive System", 
   tooltip = "PLAYERS RECEIVE BOUNTY RUs BY GETTING KILLS AND ACCOLADES (Default: Disable)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "Disable",  "0",
    "Minimum",  "1",
    "Standard",  "2",
    "Extra",  "3", 
    "Extreme",  "4",  
   },
  },
---CRATES--------------------------
  { 
   name = "crates", 
   locName = "Crates", 
   tooltip = "SET THE NUMBER OF CRATES IN THE MAP (Default: None)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "None",  "0",
    "Few",  "1",
    "Normal",  "2",
    "Many",  "3", 
    "Maximum",  "4",  
    "Uber",  "5",  
   },
  },
---ENDGAME CRISIS--------------------------
  { 
   name = "endgamecrisis_timer", 
   locName = "Endgame Crisis", 
   tooltip = "SET WHEN ENDGAME CRISIS OCCURS (Default: Normal)", 
   default = 5, 
   visible = 1, 
   choices = 
   {
    "Disable",  "0",
    "Absolutely Insane",  "1",
    "Extremely Early",  "2",
    "Very Early",  "3",
    "Early",  "4",
    "Normal",  "5",
    "Late",  "6",
    "Very Late",  "7",
    "Extremely Late",  "8",  
   },
  },
---GLARE INTENSITY--------------------------
  { 
   name = "glareintensity", 
   locName = "Bloom FX", 
   tooltip = "A WEAK BLOOM EFFECT WILL MAKE THE HIGHLIGHT PARTS OF SHIPS GLOW BEAUTIFULLY (Default: Disable)", 
   default = 0, 
   visible = 1, 
   choices = 
   {
    "Disable",  "1",
    "Weak",  "2", 
    "Medium",  "3",
    "Strong", "4", 
    --"Maximum", "5", 
    --"Test (Dev./Extreme)", "6",
   },
  },  
---INTRO--------------------------
  { 
   name = "intro", 
   locName = "Skip Intro", 
   tooltip = "SKIP INTRO (Default: No)", 
   default = 1, 
   visible = 1, 
   choices = 
   {
    "Yes",  "1",
    "No",  "2",     
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
dofilepath("data:leveldata/multiplayer/lib/sobgroupfunctionsADV.lua")
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
dofilepath("data:leveldata/multiplayer/lib/music_data.lua")
dofilepath("data:leveldata/multiplayer/lib/music_player.lua")
dofilepath("data:leveldata/multiplayer/lib/ship_list.lua")
dofilepath("data:leveldata/multiplayer/lib/drive.lua")
dofilepath("data:leveldata/multiplayer/lib/tactical.lua")
----------------
survival_data = {}
survival_initialized = 0
seedobj = {42}
last_seed = 42
ExpBag = {}
mp_play = {1,1,1,1,1,1}
music_index = {0,0,0,0,0,0}
mp_loop = {4,4,4,4,4,4}
m_n = {1,1,1,1,1,1}
m_p = {0,0,0,0,0,0}
ms_time = {0,0,0,0,0,0}
mp_time = {0,0,0,0,0,0}
mt_page = {1,1,1,1,1,1}
m_page = {1,1,1,1,1,1}
L1_cache = {}
L2_cache = {}
L3_cache = {}
L4_cache = {}
DriveModeBuffer = {0,0,0,0,0,0}
DriveModeLastPos = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
DriveModeLastSecondPos = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
DriveModeLastTargetPos = {{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}}
DriveModeTactic = {0,0,0,0,0,0}
Supporter_ID = {0,0,0,0,0,0}
AirCombat_UnitsSpawned = {fighter = {0,0,0,0,0,0}, striker = {0,0,0,0,0,0}, bomber = {0,0,0,0,0,0}, special = {0,0,0,0,0,0}, hero_fighter = {0,0,0,0,0,0}, hero_striker = {0,0,0,0,0,0}}
Global_SecondsElapsed = {0,0,0,0,0,0}
Global_LastDate = {"","","","","",""}
MusicPlayer_DynamicKillDelta = {0,0,0,0,0,0}
MusicPlayer_DynamicKillLast = {0,0,0,0,0,0}
Temp_GlobalVariable = {}
Haxor_CurrentSelectedPlayer = {-1,-1,-1,-1,-1,-1}
PlayerUI_HideAccoladeDisplay = {0,0,0,0,0,0}
PlayerUI_ShowAccoladeStats = {0,0,0,0,0,0}
MapInnerBounds = {680000,350000,680000}
CrateCount = 0
CrateCount_TotalAttempt = 0
DefaultMegalithOwnerList = {0,0,0,0,0,0}
Rad_GeneralList = {General={0,0,0,0,0,0}, Rank={0,0,0,0,0,0}}
military_list = {3,3,3,3,3,3}
-- wacky tables for zomg functions of the keepers. 
-- please, please don't make me code more of these! They're a goddamed pain!
dronecombos = {num = 0, combos = {} }
movergroups = {num = 0, combos = {} }
cruisemissiles = {num = 0, combos = {} }
droneships = {num = 0, combos = {} }
specialabilities = {num = 0, combos = {} }
AccoladesStatsList = {{"explosivespree",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"demolitionexpert",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"hurtlocker",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"artillerystrike",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"snipingspree",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"marksman",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"sharpshooter",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"firstblood",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"repair",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"killingspree",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"rampage",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"relentless",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"unstoppable",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"slayer",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"nojoy",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"finalblow",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"assist",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"revenge",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"doublekill",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"triplekill",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"quatrakill",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"ultrakill",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"teamkill",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"flagcapture",{0,0,0,0,0,0},{0,0,0,0,0,0}}, {"aftermath",{0,0,0,0,0,0},{0,0,0,0,0,0}}}
AccoladesCountList = {{"explosivespree",{0,0,0,0,0,0}}, {"demolitionexpert",{0,0,0,0,0,0}}, {"hurtlocker",{0,0,0,0,0,0}}, {"artillerystrike",{0,0,0,0,0,0}}, {"snipingspree",{0,0,0,0,0,0}}, {"marksman",{0,0,0,0,0,0}}, {"sharpshooter",{0,0,0,0,0,0}}, {"firstblood",{0,0,0,0,0,0}}, {"repair",{0,0,0,0,0,0}}, {"killingspree",{0,0,0,0,0,0}}, {"rampage",{0,0,0,0,0,0}}, {"relentless",{0,0,0,0,0,0}}, {"unstoppable",{0,0,0,0,0,0}}, {"slayer",{0,0,0,0,0,0}}, {"nojoy",{0,0,0,0,0,0}}, {"finalblow",{0,0,0,0,0,0}}, {"assist",{0,0,0,0,0,0}}, {"revenge",{0,0,0,0,0,0}}, {"doublekill",{0,0,0,0,0,0}}, {"triplekill",{0,0,0,0,0,0}}, {"quatrakill",{0,0,0,0,0,0}}, {"ultrakill",{0,0,0,0,0,0}}, {"teamkill",{0,0,0,0,0,0}}, {"flagcapture",{0,0,0,0,0,0}}, {"aftermath",{0,0,0,0,0,0}}}
AccoladesFunctionTiming = {0,0,0,0,0,0}
AccoladesFunctionSaving = 0
FirstBloodDrawn = 0
RevengeTarget = {-1,-1,-1,-1,-1,-1}
RevengeValue = {0,0,0,0,0,0}
KillingSpreeLevel = {0,0,0,0,0,0}
KillingSpreeTotalKills = {0,0,0,0,0,0}
ExplosiveSpreeLevel = {0,0,0,0,0,0}
ExplosiveSpreeTotalKills = {0,0,0,0,0,0}
SnipingSpreeLevel = {0,0,0,0,0,0}
SnipingSpreeTotalKills = {0,0,0,0,0,0}
LastTotalKills = {0,0,0,0,0,0}
LastTotalKillsInRUs = {0,0,0,0,0,0}
LastTotalSquadKillsInRUs = {0,0,0,0,0,0}
LastTotalLosses = {0,0,0,0,0,0}
LastTotalLossesInRUs = {0,0,0,0,0,0}
LastTotalSquadLossesInRUs = {0,0,0,0,0,0}
LastEnemyShipsCaptured = {0,0,0,0,0,0}
LastEnemyShipsCapturedInRUs = {0,0,0,0,0,0}
LastAliveOrNot = {0,0,0,0,0,0}
BountyRUSummary = { 0, 0, 0, 0, 0, 0 }
FighterEXP = {playerIndex = 0, serial = {{},{},{},{},{},{}}, quantity = {0,0,0,0,0,0} }
CorvetteEXP = {playerIndex = 0, serial = {{},{},{},{},{},{}}, quantity = {0,0,0,0,0,0} }
powerListManager = {
									 {build=0, sensor=0, move=0, attack=0, hyperspace=0, defensefield=0, cloak=0, space=0, fusion=0, research=0, misc=0, production=0, },
									 {build=0, sensor=0, move=0, attack=0, hyperspace=0, defensefield=0, cloak=0, space=0, fusion=0, research=0, misc=0, production=0, },
									 {build=0, sensor=0, move=0, attack=0, hyperspace=0, defensefield=0, cloak=0, space=0, fusion=0, research=0, misc=0, production=0, },
									 {build=0, sensor=0, move=0, attack=0, hyperspace=0, defensefield=0, cloak=0, space=0, fusion=0, research=0, misc=0, production=0, },
									 {build=0, sensor=0, move=0, attack=0, hyperspace=0, defensefield=0, cloak=0, space=0, fusion=0, research=0, misc=0, production=0, },
									 {build=0, sensor=0, move=0, attack=0, hyperspace=0, defensefield=0, cloak=0, space=0, fusion=0, research=0, misc=0, production=0, },
									 }
cinecontatore = { 0, 0, 0, 5, 3, 0, 2, 1 }
researchburned = { 0, 0, 0, 0, 0, 0 }
levelweareplaying = 0
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
battlearena = { 0, 2000, 0, 0, 200}
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
kad_cpu_personality = { 0, 0, 0, 0, 0, 0 }
kad_cpu_subpersonality = { 0, 0, 0, 0, 0, 0 }
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
RUMaxCapacityBackupList = { 5000, 5000, 5000, 5000, 5000, 5000 }
LastRUMaxCapacityList = { 0, 0, 0, 0, 0, 0 }
tempodicostruzioneList = { 1, 1, 1, 1, 1, 1 }
tempodicostruzioneList2 = { 1, 1, 1, 1, 1, 1 }
tempodicostruzioneList3 = { 1, 1, 1, 1, 1, 1 }
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
                       {name="Planet Mercury",      planet="planet_mercury",   population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Venus",        planet="planet_venus",     population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Earth",        planet="planet_earth",     population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Satellite Moon",      planet="planet_moon",      population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Mars",         planet="planet_mars",      population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Jupiter",      planet="planet_jupiter",   population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Satellite Europa",    planet="planet_europa",    population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Satellite Io",        planet="planet_io",        population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Satellite Callisto",  planet="planet_callisto",  population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Satellite Ganymeade", planet="planet_ganymeade", population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Saturn",       planet="planet_saturn",    population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Uranus",       planet="planet_uranus",    population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Neptune",      planet="planet_neptune",   population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},
                       {name="Planet Pluto",        planet="planet_pluto",     population=0, grow=0, dead=0, dmg="None", en=0, car1=" ", car2=" ", car3=" ", car4=" ", occupationtimer=10},											 
											 }
computerspyList = { 0, 0, 0, 0, 0, 0 }
computerspyblockList = { 0, 0, 0, 0, 0, 0 }
deepspacetelemetrytime = { 66.6, 66.6, 66.6, 66.6, 66.6, 66.6 }
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
LastRUList = { 0, 0, 0, 0, 0, 0 }
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
nghost = 0
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
canbuildmv = { 0, 0, 0, 0, 0, 0 }
canbuildkp = { 0, 0, 0, 0, 0, 0 }
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
lastselectedplayer = { 0, 0, 0, 0, 0, 0 }
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
Events.focusfixextextextext =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 10000, 100000, 0)","",},},}

Events.focusalt =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 700, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focusalt', 1900, 0, 5)","",},},}  

Events.deathfocus1 =
    {{{ "Camera_FocusVolumeWithBuffer ('deathcam', 1200, 100000, 0)","",},},
    {{ "Camera_FocusVolumeWithBuffer ('deathcam1', 3500, 0, 14)","",},},}  		
Events.deathfocus2 =
    {{{ "Camera_FocusVolumeWithBuffer ('deathcam', 1200, 100000, 0)","",},},
    {{ "Camera_FocusVolumeWithBuffer ('deathcam2', 3500, 0, 14)","",},},}  		
Events.deathfocus3 =
    {{{ "Camera_FocusVolumeWithBuffer ('deathcam', 1200, 100000, 0)","",},},
    {{ "Camera_FocusVolumeWithBuffer ('deathcam3', 3500, 0, 14)","",},},}  
Events.deathfocus4 =
    {{{ "Camera_FocusVolumeWithBuffer ('deathcam3', 1200, 100000, 0)","",},},
    {{ "Camera_FocusVolumeWithBuffer ('deathcam', 3500, 0, 14)","",},},}  		
Events.deathfocus5 =
    {{{ "Camera_FocusVolumeWithBuffer ('deathcam2', 1200, 100000, 0)","",},},
    {{ "Camera_FocusVolumeWithBuffer ('deathcam', 3500, 0, 14)","",},},}  		
Events.deathfocus6 =
    {{{ "Camera_FocusVolumeWithBuffer ('deathcam1', 1200, 100000, 0)","",},},
    {{ "Camera_FocusVolumeWithBuffer ('deathcam', 3500, 0, 14)","",},},} 
Events.deathfocus7 =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 11000, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 7000, 0, 14)","",},},}    
Events.deathfocus8 =
    {{{ "Camera_FocusSobGroupWithBuffer ('focus', 7000, 100000, 0)","",},},
    {{ "Camera_FocusSobGroupWithBuffer ('focus', 11000, 0, 14)","",},},} 		 	 

Events.stopcinematic =   
    {{HW2_Letterbox(0),},
    {{ "Universe_AllowPlayerOrders(1)", "", },    
    { "Camera_AllowControl(1)", "", },},} 
    
Events.stopcinematicrestore =   
    {{HW2_Letterbox(0),},
    {{ "Universe_AllowPlayerOrders(1)", "", },
    { "Camera_FocusRestore()", "", },    
    { "Camera_AllowControl(1)", "", },},}
    
Events.pilotspeedup =
    {{ HW2_LocationCardEvent(" ", 0),},}

Events.pilotslowdown =
    {{ HW2_LocationCardEvent(" ", 0),},}

Events.loc = 
    {{ HW2_LocationCardEvent("THE UNIVERSE WILL ALWAYS BE FULL OF SURPRISE... FIND IT BEFORE IT FINDS YOU", 15),},}    