

--**********************************************************
--THERE SEEMS TO BE A LIMIT OF 33 OPTIONS (??)
--**********************************************************

--also watch out for option lists that are 11 items long


GameSetupOptions = 
{ 
---STARTING RESOURCE OPTION-------------
  {
   name = "resstart",
   locName = "Starting Resources        ---",
   tooltip = "CHOOSE THE AMOUNT OF STARTING RUs, FEW RESOURCES CAUSE A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 1,
   choices =
   {
    "Map Default", "0", 
    "Low (1000)", "1000",
    "Normal (3000)", "3000",
    "High (5000)", "5000",    
    "Maximum (7000)", "7000",
    "Test (Dev./11000)",  "11000",                           
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
---HONOUR SENSITIVITY-------------
  {
   name = "honoursensitivity",
   locName = "Honour Gaining Speed",
   tooltip = "ADJUST HOW FAST PLAYERS CAN GAIN HONOUR POINTS, SLOW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "Fast", "3",   
    "Maximum", "4",   
    "Test (Dev./Extreme)", "5",                        
   },
  },    
---RESEARCH SENSITIVITY-------------
  {
   name = "researchsensitivity",
   locName = "Research Point Gaining",
   tooltip = "ADJUST HOW FAST PLAYERS CAN GAIN RESEARCH POINTS, SLOW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "Fast", "3",   
    "Maximum", "4",
    "Test (Dev./Extreme)", "5",                          
   },
  },     
    
    
---CHALLENGE MODE--------------------------
  { 
   name = "challengemode", 
   locName = "Occupy Homeworld", 
   tooltip = "GIVE LIFE TO UNCLAIMED COMMAND POSTS? (Default: Off)", 
   default = 0, 
   visible = 1, 
   choices = 
   { "Off", "0", 
     "On", "1",
   },
 },        
    
    
    --CUSTOM OPTIONS:
    {
        name = "JumpGateOwnership",
        locName = "Jump Gate Ownership",
        tooltip = "CHOSE PREREQUISITES TO USE JUMP GATES AROUND TERRITORIES (Default: Always neutral)",
        default = 0,
        visible = 1,
        choices =
        {
            "Always neutral",  ALWAYS_NEUTRAL,
            "Capturable",  CAPTURABLE,
            "Must own territory",  MUST_OWN_TERRITORY,
        },
    },
    
    {
        name = "JumpCost",
        locName = "Hyperspace Jump Cost",
        tooltip = "THE COST PER SQUADRON PER JUMP THROUGH A JUMP GATE (Default: Free)",
        default = 0,
        visible = 1,
        choices =
        {
            "Free",  0,
            "Low (50 RU)",  50,
            "Medium (100 RU)",  100,
            "High (200 RU)",  200,
        },
    },
    
    {
        name = "PayoutMultiplier",
        locName = "RU Payouts",
        tooltip = "HOW MUCH MONEY THE TERRITORIES WILL GENERATE (Default: Medium)",
        default = 2,
        visible = 1,
        choices =
        {
            "Very low",  0.25,
            "Low",  0.5,
            "Medium",  1,
            "High",  2,
            "Very high",  4,
            
            --"Insanely high",  10, --remove this one
        },
    },
    
    
---WIN CONDITION-------------------
  {
   name = "wincondition",
   locName = "Primary Objective",
   tooltip = "CHOOSE THE WIN CONDITION (Default: Conquer Territories)",
   default = 0,
   visible = 1,
   choices =
   {
    "Conquer Territories", "CaptureAllPost",   
    "Destroy All",	"DestroyAll",   
    "Store 100000 RUs",	"Store100000RUs",
    --"Test (Dev./Sandbox)",	"Sandbox",
   },
 }, 
    
    {
        name = "FogOfWarSetting",
        locName = "Fog of War",
        tooltip = "TURN FOG OF WAR ON OR OFF (Default: Territories visible)",
        default = 0,
        visible = 1,
        choices =
        {
            --"Command posts hidden",  "hidden",
            "Territories visible",  "posts_visible",
            "All ships visible",  "all_visible",
        },
    },
    
    {
        name = "ShieldSetting",
        locName = "Territory FX",
        tooltip = "SELECT THE SHIELD FX THAT WILL DISPLAY AROUND TERRITORIES (Default: None)",
        default = 0,
        visible = 1,
        choices =
        {
            --"Map default",  "default",
            --"Random",  "random",
            "None",  "none",
            "Blue shields",  "blue",
            "Green shields",  "green",
            "Gold shields",  "gold",
        },
    },
    
    {
        name = "DynamicMusicSetting",
        locName = "Dynamic Music",
        tooltip = "PLAYS BATTLE MUSIC ONLY WHEN BATTLES ARE HAPPENING (Default: OFF)",
        default = 1,
        visible = 0,
        choices =
        {
            "On",  ON,
            "Off",  OFF,
        },
    },

---BUILD SPEED-------------
  {
   name = "buildspeed",
   locName = "Construction Speed",
   tooltip = "ADJUST THE UNIT CONSTRUCTION SPEED, SLOW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "Fast", "3",  
    "Maximum", "4",                             
   },
  },     

    {
        name = "BuildSpeedSetting",
        locName = "AI Build Speed",
        tooltip = "ADJUST THE BUILD SPEED OF AI (Default: Normal)",
        default = 2,
        visible = 1,
        choices =
        {
            "Brain-Damaged",  "4",
            "Retard",  	  "3",
            "Normal",    "0",
            "Hacker",  	  "1",
            "Insane",  "2",
        },
    },
    
    {
        name = "MaxHealthMultiplier",
        locName = "Max Health Multiplier",
        tooltip = "INCREASE THE MAX HEALTH OF ALL SHIPS FOR LONGER GAMES (Default: 1x)",
        default = 0,
        visible = 0,
        choices =
        {
            "1x (Normal)",  "1",
            "2x",  "2",
            "3x",  "3",
            "4x",  "4",
            "5x",  "5",
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
---RECRUITING SPEED-------------
  {
   name = "recruiting",
   locName = "Recruiting Speed",
   tooltip = "ADJUST HOW FAST CREW/OFFICERS ARE RECRUITED, SLOW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Slow", "1",
    "Normal", "2",
    "Fast", "3",     
    "Maximum", "4",                       
   },
  },   
---EXPERIENCE SENSITIVITY-------------
  {
   name = "experiencesensitivity",
   locName = "Unit XP Gaining Speed",
   tooltip = "ADJUST HOW FAST UNITS CAN GAIN EXPERIENCE, LOW SPEED CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 1,
   choices =
   {
    "Forever", "1",
    "Slow", "2",
    "Normal", "3",   
    "Fast", "4",   
    "Maximum", "5",                    
   },
  },     
---ENERGY SENSITIVITY-------------
  {
   name = "energysensitivity",
   locName = "Energy Dependency",
   tooltip = "ADJUST HOW MUCH PLAYERS WILL BE AFFECTED BY ENERGY, LOW DEPENDENCY CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 1,
   visible = 1,
   choices =
   {
    "Low", "1",
    "Normal", "2",
    "High", "3",   
    "Maximum", "4",   
    "Test (Dev./Extreme)", "5",                       
   },
  },                   
  ---RANK REMUNERATION-------------
  {
   name = "rankremuneration",
   locName = "Rank Remuneration",
   tooltip = "CHOOSE THE RANK REMUNERATION PER YEAR, FEW REMUNERATION CAUSES A TACTICAL MATCH (Default: Normal)",
   default = 2,
   visible = 1,
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
   tooltip = "ADVANCED AI PROGRAMMING, ALLOWS CPU PLAYERS TO BEHAVE LIKE HARDCORE HUMAN EXPERTS! (Default: Tryhard)",
   default = 2,
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
   tooltip = "CHOOSE THE DIPLOMACY FEE PER YEAR BASED ON ALLIED PLAYERS' SCORE, ALLIED PLAYERS WITH MINOR SCORE PAY RUs (Default: None)", 
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

    {
        name = "GrantAllResearch",
        locName = "No Research (TEST ONLY)",
        tooltip = "GRANT ALL RESEARCH AT THE START OF THE GAME, THIS COULD CAUSE ALL KINDS OF UNPREDICTABLE GLITCHES (Default: No)",
        default = 0,
        visible = 0,
        choices =
        {
            "No",  "no",
            "Yes",  "yes",
        },
    },

	--HIDDEN OPTIONS:
	
---INTRO--------------------------
  { 
   name = "intro", 
   locName = "Skip Intro (TEST ONLY)", 
   tooltip = "SKIP INTRO (Default: no)", 
   default = 0, 
   visible = 0, 
   choices = 
   {
    "Yes",  "1",
    "No",  "2",     
   },
 },  
 
    {
        name = "StartingFleet", --NOT SHOWN
        locName = "Starting Fleet",
        tooltip = "",
        default = 0,
        visible = 0,
        choices =
        {
            "None",  "none",
        },
    },
    
    { 
        name = "startlocation", 
        locName = "$3225", --Start location (HARDCODED AT FIXED)
        tooltip = "$3237", 
        default = 1, 
        visible = 0, 
        choices = 
            { "$3226", "random", "$3227", "fixed", }, }, 
    

    
    
    
    
    --DIVIDER
--    {
--        name = "divider",
--        locName = "--------------------------------------------------------",
--        tooltip = "",
--        default = 0,
--        visible = 1,
--        choices =
--        {
--            "",  "",
--        },
--    },
    
    
    
}

