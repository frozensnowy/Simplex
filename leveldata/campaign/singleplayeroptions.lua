-- The Simplex Project
-- 2011/7/9 22:01:38
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
GUID = 
    { 121, 93, 124, 21, 226, 37, 142, 64, 153, 28, 93, 26, 236, 117, 171, 149, }
GameRulesName = "Single Player"
Description = "No description"
Directories = 
{ 
    Levels = "data:LevelData\\Campaign", 
    AI = "data:AI\\", }
GameSetupOptions = 
    { 
    { 
        name = "resources", 
        locName = "$3240", 
        tooltip = "$3232", 
        default = 2, 
        visible = 1, 
        choices = 
            { "$3241", "1.0", "$3242", "3.3", "$3243", "7.0", }, }, 
    { 
        name = "unitcaps", 
        locName = "$3214", 
        tooltip = "$3234", 
        default = 0, 
        visible = 1, 
        choices = 
            { "$3215", "SinglePlayer", }, }, 
    { 
        name = "resstart", 
        locName = "$3205", 
        tooltip = "$3232", 
        default = 0, 
        visible = 1, 
        choices = 
            { "$3206", "750", "$3207", "2000", "$3208", "0", }, }, 
    { 
        name = "lockteams", 
        locName = "$3220", 
        tooltip = "$3235", 
        default = 0, 
        visible = 1, 
        choices = 
            { "$3221", "yes", "$3222", "no", }, }, 
    { 
        name = "startlocation", 
        locName = "$3225", 
        tooltip = "$3237", 
        default = 0, 
        visible = 1, 
        choices = 
            { "$3226", "random", "$3227", "fixed", }, }, 


---STARTING HONOUR-------------
  {
   name = "honourstart",
   locName = "Starting Honour Points",
   tooltip = "CHOOSE THE AMOUNT OF STARTING HONOUR POINTS, LESS STARTING HONOUR CAUSES A TACTICAL MATCH (Default: 10)",
   default = 0,
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
---UNIT CAP--------------------------
  { 
   name = "unitcapsrank", 
   locName = "Pilots Capacity", 
   tooltip = "CHOOSE THE MAX CAPACITY OF YOUR PILOTS, SETS HOW MANY PILOTS YOU CAN RECRUIT AT MOST, HIGH CAPACITY CAUSES LAG WITH LOW-END PC (Default: 690)", 
   default = 3, 
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
   tooltip = "CHOOSE THE MAX CAPACITY OF YOUR OFFICERS, SETS HOW MANY OFFICERS YOU CAN RECRUIT AT MOST, HIGH CAPACITY CAUSES LAG WITH LOW-END PC (Default: 25)", 
   default = 3, 
   visible = 1, 
   choices = 
   { "15", "1", 
     "25", "2",
     "35", "3",
     "45", "4",
   },
 },
---HONOUR SENSITIVITY-------------
  {
   name = "honoursensitivity",
   locName = "Honour Sensitivity",
   tooltip = "CHOOSE THE HONOUR POINTS SENSITIVITY, FEW SENSITIVITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 3,
   visible = 1,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",   
    "Test (Dev./Extreme)", "5",                       
   },
  },    
    ---RESEARCH SENSITIVITY-------------
  {
   name = "researchsensitivity",
   locName = "Research Sensitivity",
   tooltip = "CHOOSE THE RESEARCH POINTS SENSITIVITY, FEW SENSITIVITY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 0,
   visible = 1,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",
    "Test (Dev./Extreme)", "5",                          
   },
  },     
---BUILD SPEED-------------
  {
   name = "buildspeed",
   locName = "Construction Speed",
   tooltip = "CHOOSE THE UNIT CONSTRUCTION SPEED, FEW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 1,
   choices =
   {
    "Few", "1",
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
   default = 1,
   visible = 1,
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
   default = 0,
   visible = 1,
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
   default = 0,
   visible = 1,
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
   tooltip = "CHOOSE THE BATTLE DURATION (UNIT RESISTANCE/FIREPOWER), UNIT RESISTENCE/FIRE POWER (Default: Normal)",
   default = 3,
   visible = 1,
   choices =
   {
    "Few", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",                         
   },
  },  
---AI--------------------------
  {
   name = "aiaids",
   locName = "AI Aids",
   tooltip = "CHOOSE THE AIDS OF ARTIFICIAL INTELLIGENT, FEW AIDS CAUSE A TACTICAL MATCH (Default: None)",
   default = 4,
   visible = 1,
   choices =
   {
    "None", "1",
    "Few", "2",
    "Normal", "3",
    "High", "4", 
    "Maximum", "5",  
    --"Test (Dev./Disable)", "6",                        
   },
  },
---MILITARY--------------------------
  {
   name = "military",
   locName = "AI Strategy",
   tooltip = "STEAMROLLER: AI ATTACKS RARELY BY MANY SHIPS; GUERRILLA: AI ATTACKS OFTEN BY FEW SHIPS (Default: Manoeuvre)",
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
---GLARE INTENSITY--------------------------
  { 
   name = "glareintensity", 
   locName = "Halation", 
   tooltip = "TO GET PROPER VISUALIZATION, YOU NEED TO SET ANTI-ALIASING TO MAXIMUM IN YOUR VIDEO CARD SETTINGS (Default: Disable)", 
   default = 1, 
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
---ACCOLADES--------------------------
  { 
   name = "incentive", 
   locName = "Incentive System", 
   tooltip = "PLAYERS RECEIVE BOUNTY RUs BY GETTING KILLS AND ACCOLADES (Default: Disable)", 
   default = 1, 
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

 
 }
 