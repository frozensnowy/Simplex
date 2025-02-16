function OnInit()
    --print(" ")
    print("-------------------------------------------------------------------------------------")
    print("STARTING TERRITORIES MOD")
    print(" ")
    
	SobGroup_Create("TerritoryTempSobGroup1")
	SobGroup_Create("TerritoryTempSobGroup2")
	SobGroup_Create("TerritoryTempSobGroup3")
	SobGroup_Create("TempShips") --used by SobGroup_SobGroupRemove()
	SobGroup_Create("CommandPostsToDestroy") --used when swapping command posts
	
	SobGroup_Create("ShipsInsideTerritoryVolume")
	SobGroup_Create("ShipsInsideStopVolumes")
	SobGroup_Create("ShipsToDestroy")
	
	SetStartFleetSuffix("none")
    GetGameSettings()
    RunLevelConfig()
    
    Rule_Add("Rule_Init")
	Rule_AddInterval("Rule_FormatGameTime", 1)
	Rule_AddInterval("MainRuleTerritoriesOnly", 0.5)
	Rule_AddInterval("Rule_UpdateATI", 1)
	Rule_AddInterval("Rule_WatchForCaptures", 10)		--30
	Rule_AddInterval("Rule_GiveCommandPostRUs", 3) --must be 3 sec
	Rule_AddInterval("Rule_ResetPlayerPayouts", 200)
	Rule_AddInterval("Rule_WatchForHighResources", 30)



	Player_Oninit()	--music player initialize
	--MP_RestrictCampaignItems()		--newly introduced due to single player mission
  Volume_AddSphere("s0", { 0,      0,     0,    }, 10)
	Volume_AddSphere("s1", {-1000000,  0,     0,    }, 10)
	Volume_AddSphere("s2", { 1000000,  0,     0,    }, 10)
	Volume_AddSphere("s3", { 0,     -1000000, 0,    }, 10)
	Volume_AddSphere("s4", { 0,      1000000, 0,    }, 10)
	Volume_AddSphere("s5", { 0,      0,    -1000000,}, 10)
	Volume_AddSphere("s6", { 0,      0,     1000000,}, 10)
  Volume_AddSphere("s7", {-1000000,  0,    -1000000,}, 10)
  Volume_AddSphere("s8", {-1000000,  0,     1000000,}, 10)  
  Volume_AddSphere("s9", { 1000000,  0,    -1000000,}, 10)
  Volume_AddSphere("s10",{ 1000000,  0,     1000000,}, 10)  
  Volume_AddSphere("s11",{ 0,     -1000000,-1000000,}, 10)
  Volume_AddSphere("s12",{ 0,     -1000000, 1000000,}, 10)  
  Volume_AddSphere("s13",{ 0,      1000000,-1000000,}, 10)
  Volume_AddSphere("s14",{ 0,      1000000, 1000000,}, 10)  
  Volume_AddSphere("s15", {-1000000,-1000000, 0,    }, 10)
  Volume_AddSphere("s16", { 1000000, 1000000, 0,    }, 10)
  Volume_AddSphere("s17", {-1000000, 1000000, 0,    }, 10)
  Volume_AddSphere("s18", { 1000000,-1000000, 0,    }, 10)  
  Volume_AddSphere("s19", {-1000000,-1000000,-1000000,}, 10)
  Volume_AddSphere("s20", {-1000000,-1000000, 1000000,}, 10)
  Volume_AddSphere("s21", { 1000000, 1000000,-1000000,}, 10)
  Volume_AddSphere("s22", { 1000000, 1000000, 1000000,}, 10)
  Volume_AddSphere("s23", {-1000000, 1000000,-1000000,}, 10)
  Volume_AddSphere("s24", {-1000000, 1000000, 1000000,}, 10)
  Volume_AddSphere("s25", { 1000000,-1000000,-1000000,}, 10)
  Volume_AddSphere("s26", { 1000000,-1000000, 1000000,}, 10)  
  Universe_AllowPlayerOrders(0)
  UI_SetScreenEnabled("ResourceMenu", 0)     
  UI_SetScreenEnabled("NewTaskbar", 0)  
---GAME TIME
  Rule_AddInterval("time", 1.81) --ok, optimized
---SOBGROUPS
  Rule_AddInterval("sobgroupscreate", 0.2) --ok, optimized
  Rule_AddInterval("sobgroups", 7.777/Sobgroup_Runtimes) --ok  
  Volume_AddSphere("up0", {100, 100000, 100,}, 1000)
  Volume_AddSphere("up1", {100, -100000, 100,}, 1000)
  Volume_AddSphere("up2", {100, 100000, -100,}, 1000)
  Volume_AddSphere("up3", {100, -100000, -100,}, 1000)
  Volume_AddSphere("up4", {-100, 100000, 100,}, 1000)
  Volume_AddSphere("up5", {-100, -100000, 100,}, 1000)
  Volume_AddSphere("centre", {100, 21000, 100,}, 1000)  
---PLAYERCOUNT
  Rule_AddInterval("pcount", 45.123) --ok   
---INTRO/INTERFACE
  ec_intro_count = 0
  Rule_AddInterval("ec_welcome", 8) --ok  
  fadedown()  
  --Rule_AddInterval("interfacegivecontrol", 10) --ok   
  Rule_AddInterval("interfaceintro", 0.25) --ok, optimized
  Rule_AddInterval("locard", 14) --ok, optimized
  Rule_AddInterval("interfacebuttons", 1) --ok, optimized   
  Rule_AddInterval("interfacebuttonsFast", 1.1)
  Rule_AddInterval("selected", 0.7) --ok      

---GAME SETTINGS  
   
  winCondition = GetGameSettingAsString("wincondition");
  if (winCondition == "CaptureAllPost") then
    Rule_AddInterval("MainRule", 16.9) --ok    
    Rule_AddInterval("Territory_CheckProductionDeadRule", 17.1) --ok   
	elseif (winCondition == "DestroyAll") then        
	  Rule_AddInterval("MainRule", 16.9) --ok    	
    Rule_AddInterval("CheckDeadRule", 17.1) --ok  
  elseif (winCondition == "Store100000RUs") then  
    ATI_LoadTemplates("data:LevelData\\Multiplayer\\ResourceRace\\ATI.lua")      
	  Rule_AddInterval("MainRule", 16.9) --ok    	
    Rule_AddInterval("Territory_CheckStore100000RUsDeadRule", 17.1) --ok    
  elseif (winCondition == "5battlepoints") then
    Rule_AddInterval("MainRule", 16.9) --ok    
    Rule_AddInterval("Check5battlepointsDeadRule", 17.1) --ok     
  elseif (winCondition == "10battlepoints") then
    Rule_AddInterval("MainRule", 16.9) --ok    
    Rule_AddInterval("Check10battlepointsDeadRule", 17.1) --ok   
  elseif (winCondition == "15battlepoints") then
    Rule_AddInterval("MainRule", 16.9) --ok    
    Rule_AddInterval("Check15battlepointsDeadRule", 17.1) --ok    
  elseif (winCondition == "Sandbox") then     
    
  elseif (winCondition == "Scenario") then
	  --abbiamo scenario 
	else
	  Rule_AddInterval("MainRule", 16.9) --ok    
    Rule_AddInterval("CheckProductionDeadRule", 17.1) --ok      	
  end

  honourstart = GetGameSettingAsNumber("honourstart")  
  autosave = GetGameSettingAsNumber("autosave") 
  rankremuneration = GetGameSettingAsNumber("rankremuneration")
  unithealth = GetGameSettingAsNumber("unithealth")
  buildspeed = GetGameSettingAsNumber("buildspeed")
  resource = GetGameSettingAsNumber("resource")  
  recruiting = GetGameSettingAsNumber("recruiting")     
  secondaryobjectives = GetGameSettingAsNumber("secondaryobjectives")   
  honoursensitivity = GetGameSettingAsNumber("honoursensitivity")    
  researchsensitivity = GetGameSettingAsNumber("researchsensitivity")    
  experiencesensitivity = GetGameSettingAsNumber("experiencesensitivity") 
  energysensitivity = GetGameSettingAsNumber("energysensitivity")  
  hyperspace = GetGameSettingAsNumber("hyperspace") 
  startwith = GetGameSettingAsNumber("startwith") 
  aiaids = GetGameSettingAsNumber("aiaids")
  military = GetGameSettingAsNumber("military")
  cpuname = 1
  diplomacy = GetGameSettingAsNumber("diplomacy")
  unitcapsrank = GetGameSettingAsNumber("unitcapsrank")
  unitcapsofficer = GetGameSettingAsNumber("unitcapsofficer")
  tweakfighterhealth = GetGameSettingAsNumber("tweakfighterhealth")
  tweakcorvettehealth = GetGameSettingAsNumber("tweakcorvettehealth")
  unitbehavior = GetGameSettingAsNumber("unitbehavior")
  interface = GetGameSettingAsNumber("interface")
  glareintensity = GetGameSettingAsNumber("glareintensity")
  ignoreavoidance = 0
  incentive = GetGameSettingAsNumber("incentive")
  crates = 0		--no crates for territories
  sharerus = "no"
  resstart = GetGameSettingAsNumber("resstart")
  gBuildSpeedSetting = GetGameSettingAsNumber("BuildSpeedSetting")
  --if GetGameSettingAsNumber("startwith") == 5 or GetGameSettingAsNumber("startwith") < 3 or GetGameSettingAsNumber("startwith") == 8 then			-- because of new starting fleet
		--intro = 1
	--else
		intro = GetGameSettingAsNumber("intro")
	--end
  
	--Mac compatibility
	  --secondaryobjectives
		  if secondaryobjectives == 1 then
		    secondaryobjectives = -1    
		  elseif secondaryobjectives == 2 then 
		    rurace = 1 
		  elseif secondaryobjectives == 3 then    
		    rankrace = 1
		  elseif secondaryobjectives == 4 then  
		    domainrace = 1
		  elseif secondaryobjectives == 5 then
		    rurace = 1
		    rankrace = 1
		    domainrace = 1  
		  else
		    secondaryobjectives = -1  
		  end  
		--diplomacy fee
		  if diplomacy == 1 then
		    diplomacy = 0    
		  elseif diplomacy == 2 then 
		    diplomacy = 1 
		  elseif diplomacy == 3 then    
		    diplomacy = 2
		  elseif diplomacy == 4 then  
		    diplomacy = 3
		  elseif diplomacy == 5 then  
		    diplomacy = 4  
		  else 
		    diplomacy = 2		  
		  end  
		--unitcapsrank 
		  if unitcapsrank == 1 then
		    unitcapsrank = 1    
		  elseif unitcapsrank == 2 then 
		    unitcapsrank = 2 
		  elseif unitcapsrank == 3 then    
		    unitcapsrank = 3		
		  elseif unitcapsrank == 4 then    
		    unitcapsrank = 4		      
		  else 
		    unitcapsrank = 2		  
		  end        
		--unitcapsofficer 
		  if unitcapsofficer == 1 then
		    unitcapsofficer = 1    
		  elseif unitcapsofficer == 2 then 
		    unitcapsofficer = 2 
		  elseif unitcapsofficer == 3 then    
		    unitcapsofficer = 3		
		  elseif unitcapsofficer == 4 then    
		    unitcapsofficer = 4		      
		  else 
		    unitcapsofficer = 2		  
		  end        
		--fighter health tweak 
		  if tweakfighterhealth == 0 then
		    tweakfighterhealth = 0    
		  elseif tweakfighterhealth == 1 then 
		    tweakfighterhealth = 1
		  elseif tweakfighterhealth == 2 then    
		    tweakfighterhealth = 2
		  elseif tweakfighterhealth == 3 then    
		    tweakfighterhealth = 3
		  else 
		    tweakfighterhealth = 0
		  end
		--corvette health tweak 
		  if tweakcorvettehealth == 0 then
		    tweakcorvettehealth = 0    
		  elseif tweakcorvettehealth == 1 then 
		    tweakcorvettehealth = 1
		  elseif tweakcorvettehealth == 2 then    
		    tweakcorvettehealth = 2
		  elseif tweakcorvettehealth == 3 then    
		    tweakcorvettehealth = 3
		  else 
		    tweakcorvettehealth = 0
		  end
		--honour
		  if honourstart == 1 then
		    for i = 1,6,1 do
		      honourstartList[i] = 0
		    end  		  
		  elseif honourstart == 2 then
		    for i = 1,6,1 do
		      honourstartList[i] = 10
		    end  		  	  
		  elseif honourstart == 3 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 20
		    end  		  
		  elseif honourstart == 4 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 30
		    end  		    
		    if rankrace == 1 then
		      rankrace = 3
		    end
		  elseif honourstart == 5 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 80
		    end  		   
		    if rankrace == 1 then
		      rankrace = 5
		    end
		  elseif honourstart == 6 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 150
		    end  		   
		    if rankrace == 1 then
		      rankrace = 7
		    end
		  elseif honourstart == 7 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 240
		    end  		   
		    if rankrace == 1 then
		      rankrace = 9
		    end
		  elseif honourstart == 8 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 350
		    end  		  
		    if rankrace == 1 then
		      rankrace = 11
		    end
		  elseif honourstart == 9 then  
		    for i = 1,6,1 do
		      honourstartList[i] = 480
		    end  		   
		    rankrace = 0		                      
		  else
		    for i = 1,6,1 do
		      honourstartList[i] = 10
		    end  		   
		  end		  
		--honoursensivity
		  if honoursensitivity == 1 then
		    honoursensitivity = 0.85		    
		  elseif honoursensitivity == 2 then  
		    honoursensitivity = 1.1
		  elseif honoursensitivity == 3 then 		    
		    honoursensitivity = 1.4 
		  elseif honoursensitivity == 4 then 		    
		    honoursensitivity = 2 		   
		  elseif honoursensitivity == 5 then  --test 		    
		    honoursensitivity = 3       
		  else
		    honoursensitivity = 1.1 
		  end		  
		--researchsensitivity
		  if researchsensitivity == 1 then
		    researchsensitivity = 1.55
		  elseif researchsensitivity == 2 then  
		    researchsensitivity = 1.2
		  elseif researchsensitivity == 3 then 
		    researchsensitivity = 0.85
		  elseif researchsensitivity == 4 then 
		    researchsensitivity = 0.45 
		  elseif researchsensitivity == 5 then  --test
		    researchsensitivity = 0.2   
		  else
		    researchsensitivity = 1.2 
		  end				
		--buildspeed
		  if buildspeed == 1 then
		    buildspeed = 0 		    
		  elseif buildspeed == 2 then  
		    buildspeed = 0.25		    
		  elseif buildspeed == 3 then 
		    buildspeed = 0.5 
		  elseif buildspeed == 4 then 
		    buildspeed = 1 		      		    
		  else
		    buildspeed = 0.25 		    
		  end				  
		--aiaids
		  if aiaids == 1 then  
		    Rule_AddInterval("ai", 215.1257)  	
		    aiaidshonour = 0.825	    
		  elseif aiaids == 2 then
		    Rule_AddInterval("ai", 165.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 71.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 81.2919)
		    Rule_AddInterval("AI_TerritoryBehaviour", 71.5952)
		    aiaidshonour = 0.9
		  elseif aiaids == 3 then  
		    Rule_AddInterval("ai", 125.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 51.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 61.2919)
		    Rule_AddInterval("AI_TerritoryBehaviour", 51.5952)
		    aiaidshonour = 0.95	    
		  elseif aiaids == 4 then 
		    Rule_AddInterval("ai", 90.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 36.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 46.2919)
		    Rule_AddInterval("AI_TerritoryBehaviour", 36.5952)
		    aiaidshonour = 1
		  elseif aiaids == 5 then 
		    Rule_AddInterval("ai", 50.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 21.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 31.2919)
		    Rule_AddInterval("AI_TerritoryBehaviour", 21.5952)
		    aiaidshonour = 1.05
		  elseif aiaids == 6 then  --test
		    --Rule_AddInterval("ai", 50.1257) 
		    --aiaidshonour = 1.05  
		  else
		    Rule_AddInterval("ai", 125.1257)  
		    aiaidshonour = 0.925
		  end
		--military AI
		  if military == 1 then  
		    military = 1
		  elseif military == 2 then
		    military = 2
		  elseif military == 3 then  
		    military = 3  	
		  elseif military == 4 then  
		    military = 4   	  
		  elseif military == 5 then  
		    military = 5 
		  elseif military == 6 then  --intelligent auto
		    military = 6
		  elseif military == 7 then  --test
		    military = 7
		    --CPU_Enable(1,0)
		    --CPU_Enable(2,0)
		    --CPU_Enable(3,0)
		    --CPU_Enable(4,0)
		    --CPU_Enable(5,0)       	     	         	     	    
		  else
		    military = 3
		  end		      	    
		--resource
		  if resource == 1 then
		    resource = 0
		    miningfactor = 0.75
		    fusionfactor = 12.27
		  elseif resource == 2 then
		    resource = 0.25  
		    miningfactor = 0.95
		    fusionfactor = 10.14
		  elseif resource == 3 then  
		    resource = 0.5
		    miningfactor = 1.15
		    fusionfactor = 8.72
		  elseif resource == 4 then  
		    resource = 1 
		    miningfactor = 2.3
		    fusionfactor = 6 
		  else
		    resource = 0.25 
		    miningfactor = 0.95
		    fusionfactor = 10.14
		  end  		  
		--recruiting, deve sempre essere un numero pari perch?in transportcell.lua divide x 2
		  if recruiting == 1 then
		    recruiting = 0
		  elseif recruiting == 2 then 
		    recruiting = 2 
		  elseif recruiting == 3 then 
		    recruiting = 4 
		  elseif recruiting == 4 then 
		    recruiting = 8   
		  else
		    recruiting = 2 
		  end		 
		--experiencesensitivity
		  if experiencesensitivity == 1 then
		    experiencesensitivity = 1
		  elseif experiencesensitivity == 2 then  
		    experiencesensitivity = 1.25
		  elseif experiencesensitivity == 3 then 
		    experiencesensitivity = 1.5
		  elseif experiencesensitivity == 4 then 
		    experiencesensitivity = 1.75 
		  elseif experiencesensitivity == 5 then  --test
		    experiencesensitivity = 3.5   
		  else
		    experiencesensitivity = 1.25 
		  end		   
		--energysensitivity
		  if energysensitivity == 1 then
		    energysensitivity = 0.9
		  elseif energysensitivity == 2 then  
		    energysensitivity = 1
		  elseif energysensitivity == 3 then 
		    energysensitivity = 1.1
		  elseif energysensitivity == 4 then 
		    energysensitivity = 1.2 
		  elseif energysensitivity == 5 then  --test
		    energysensitivity = 2.4   
		  else
		    energysensitivity = 1 
		  end		     
		--hyperspace
		  if hyperspace == 1 then
		    hyperspace = 1
		  elseif hyperspace == 2 then  
		    hyperspace = 0.7
		  elseif hyperspace == 3 then  
		    hyperspace = 0.4
		  elseif hyperspace == 4 then  
		    hyperspace = 0  
		  else
		    hyperspace = 0.7 
		  end		  
		--rankremuneration
		  if rankremuneration == 1 then
		    rankremuneration = 0
		  elseif rankremuneration == 2 then 
		    rankremuneration = 1 
		  elseif rankremuneration == 3 then 
		    rankremuneration = 2 
		  elseif rankremuneration == 4 then  
		    rankremuneration = 3
		  elseif rankremuneration == 5 then  
		    rankremuneration = 4  
		  else
		    rankremuneration = 2 
		  end		  
		--unithealth
		  if unithealth == 1 then
		    unithealth = 0
		  elseif unithealth == 2 then  
		    unithealth = 0.3
		  elseif unithealth == 3 then  
		    unithealth = 0.6 
		  elseif unithealth == 4 then  
		    unithealth = 1     
		  else
		    unithealth = 0.3 
		  end 	
		--unitbehavior
		  if unitbehavior == 1 then		--realistic
		    unitbehavior = 0
		  elseif unitbehavior == 2 then  	--fast
		    unitbehavior = 1
		  elseif unitbehavior == 0 then		--slow
		  	unitbehavior = -1
		  elseif unitbehavior == -1 then		--slower
		  	unitbehavior = -2
		  elseif unitbehavior == -2 then		--slowest
		  	unitbehavior = -3
		  else
		    unitbehavior = 0
		  end
		--interface
		  if interface == 1 then
		    interface = 1.3
		  elseif interface == 2 then  
		    interface = 1
		  elseif interface == 3 then  
		    interface = 0.7		  
		  elseif interface == 4 then  --test  
		    interface = 1.5		    		      		  
		  else
		    interface = 0.7		--1 
		  end 		
		--glareintensity
		  if glareintensity == 2 then
		    glareintensity = 0.4
		  elseif glareintensity == 3 then
		  	glareintensity = 0.6
		  elseif glareintensity == 4 then
		  	glareintensity = 0.8
		  else
		  	glareintensity = 0
		  end 		

		  --accolades
		  if incentive == 1 then
		    incentive = 1
		  elseif incentive == 2 then
		    incentive = 2
		  elseif incentive == 3 then
		    incentive = 3
		  elseif incentive == 4 then
		    incentive = 4
		  else
		  	incentive = 0
		  end
		  if incentive > 0 then
		  	Rule_AddInterval("accoladesinit", 1.974)		--was 67
		  end

		--Lock teams, it seems that this doesn't work
		  --lockTeams = GetGameSettingAsString("lockteams");
		  --if (lockTeams == "No") then  
			--  Rule_AddInterval("FreeWillTheorem", 3000)
		 	--end
		  		  				  			

		--start based on map
      Rule_AddInterval("buildonstartmap", 35) --ok			
		  
  Rule_AddInterval("matchinit", 60.3775) --ok  

---POP 
  Rule_AddInterval("pop", 25.1166) --ok        
---MUSIC
  --Rule_AddInterval("MusicInit", 42) --ok      
---MEGALITH    
  Rule_AddInterval("megalithinitialize", 7.7148)
---FUSION  
  Rule_AddInterval("fusion", fusionfactor) --ok 
---POPULATION
  --Rule_AddInterval("populationinit", 3.1) --ok
  --Rule_AddInterval("population", 7.654321) lanciata da interface     
---EXPLOSION DAMAGE
  Rule_AddInterval("MSexplosiondamage", 0.5317)
  Rule_AddInterval("SYexplosiondamage", 0.5627)
  Rule_AddInterval("CFexplosiondamage", 0.6873)  
  Rule_AddInterval("PSexplosiondamage", 0.6212)  
  Rule_AddInterval("Jexplosiondamage", 0.4467)      
---RESEARCH
  Rule_AddInterval("researching", 16.948) --ok 
---MAINTENANCE
  Rule_AddInterval("maintenance", 39.4722125) --ok
---SCORE
  Rule_AddInterval("score", 54.4342) --ok 
---VIPER MISSILE
  Rule_AddInterval("vipermissile", 0.66) --ok    
---COMPUTER SPY    
  Rule_AddInterval("computerspy", 11.1) --ok
---DEEP SPACE TELEMETRY
  Rule_AddInterval("deepspacetelemetry", 12.2)
---AI
	Rule_AddInterval("AI_SetPersonality", 9.1474)
  Rule_AddInterval("LOD", 60.33) --ok    
  Rule_AddInterval("aijuggernaught", 5.6789)     
---TRADE
  Rule_AddInterval("trade", 14.60945) --ok  
---TRANSPORT CELL
  --Rule_AddInterval("transportcell", 7.55) --ok   
---GENERIC
  Rule_AddInterval("randomfake", 7.575) --ok    
  Rule_AddInterval("weaponsets", 9.51) --ok    
---REPAIRING
  Rule_AddInterval("repairing", 6.4571)    
  Rule_AddInterval("droning", 6.1313)
  --Rule_AddInterval("repairingdock", 6.1357)
  Rule_AddInterval("autorepair", 24.3519)    
---WEIGHT
  Rule_AddInterval("weight", 54.3938)     
---EXPERIENCE
  Rule_AddInterval("experience", 33.2572)   
---EVENTI
  Rule_AddInterval("eventi", 8.88) --ok  
---KEEP POSITION
  --Rule_AddInterval("keeppositiononpassive", 0.455) --ok 
---GUJKING SHIPYARD
  Rule_AddInterval("enginegujking", 3.1) --ok 
---Examine races for speed boost function
  Rule_AddInterval("RaceCheck", 1.0001)	--eureka!
---Examine races for some functions which don't require quick response
  Rule_AddInterval("RaceCheckSlow", 23.4273)	--take it easy!
---All functions for Keeper
	Rule_AddInterval("keeper_1Sek", 1.0475)
	Rule_AddInterval("keeper3Sek", 3.2613)
---OBJECTIVE
  --Rule_AddInterval("objective", 11.11) lanciata da interface   
---RU Update  
  --Rule_AddInterval("RUUpdate", 1.9) --ok 
  --Rule_AddInterval("RUUpdate1", 0.5) --ok    
---Battle Arena
  if battlearena[1] >= 1 then
    --CPU_Enable(1,0)       
    --Rule_AddInterval("battlearenagm", 2.5) --ok  --lanciata da megalith             
  end  
  
  --Rule_AddInterval("Animate_MothershipDoorOpen", 20)
  --Rule_AddInterval("Animate_MothershipDoorClose", 40)
  --Rule_AddInterval("test", 20)
  --Rule_AddInterval("test1", 500)
  
---One time job
	OnStartOneTimeJob()
	Temp_GlobalVariable.PlayerGender = {-1,-1,-1,-1,-1,-1}

---NEW FUNCTIONS DESIGNED FOR THIS GAME TYPE!!!---------------------------------------------   
	Rule_AddInterval("SpawnCaptureFrigateForNewGameType", 125)
	Rule_AddInterval("AIAutoCaptureForNewGameType", 25)
	Rule_AddInterval("MaximizeRecruitForNewGameType", 35)
	Rule_AddInterval("TerritoryAI_SpawnUtilities", 83)

	Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 75)
	
end

territory_hwsaving = 1

function TerritoryAI_SpawnGeneralShips()  
	if territory_hwsaving >= 5 then
		territory_hwsaving = 1
	end
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;	
	while playerIndex < playerCount do
		if gChallengeMode == 0 and playerIndex == 5 then
			break
		end
		if Player_IsAlive(playerIndex) == 1 and Player_NumberOfAwakeShips(playerIndex) > 0 and pilotpopList[playerIndex + 1] < pilotrecruitList[playerIndex + 1] and officerpopList[playerIndex + 1] < officerrecruitList[playerIndex + 1] then
			if CPU_Exist_Smart(playerIndex) == 1 then
				--Hgn Command Post 1
				if SobGroup_Count("hgn_command_post1"..playerIndex) > 0 and territory_hwsaving == 1 then
					local numships = SobGroup_SplitGroupReference("SingleProductionHgnPost1_SOB", "hgn_command_post1"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("hgn_command_post1"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 80 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(Hgnboostships))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionHgnPost1_SOB"..counter, Hgnboostships[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Hgn Command Post 2
				if SobGroup_Count("hgn_command_post2"..playerIndex) > 0 and territory_hwsaving == 2 then
					local numships = SobGroup_SplitGroupReference("SingleProductionHgnPost2_SOB", "hgn_command_post2"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("hgn_command_post2"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 70 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(HgnboostshipsAlt))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionHgnPost2_SOB"..counter, HgnboostshipsAlt[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Hgn Command Post 3
				if SobGroup_Count("hgn_command_post3"..playerIndex) > 0 and territory_hwsaving == 3 then
					local numships = SobGroup_SplitGroupReference("SingleProductionHgnPost3_SOB", "hgn_command_post3"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("hgn_command_post3"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 50 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(HgnAllfrigates))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionHgnPost3_SOB"..counter, HgnAllfrigates[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Hgn Command Post 4
				if SobGroup_Count("hgn_command_post4"..playerIndex) > 0 and territory_hwsaving == 4 then
					local numships = SobGroup_SplitGroupReference("SingleProductionHgnPost4_SOB", "hgn_command_post4"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("hgn_command_post4"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 10 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(HgnAllDestroyers))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionHgnPost4_SOB"..counter, HgnAllDestroyers[shiptype])		--spawn specific type of ship
						end
					end
				end
				
				--Vgr Command Post 1
				if SobGroup_Count("vgr_command_post1"..playerIndex) > 0 and territory_hwsaving == 1 then
					local numships = SobGroup_SplitGroupReference("SingleProductionVgrPost1_SOB", "vgr_command_post1"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_command_post1"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 80 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(vaygrboostships))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionVgrPost1_SOB"..counter, vaygrboostships[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Vgr Command Post 2
				if SobGroup_Count("vgr_command_post2"..playerIndex) > 0 and territory_hwsaving == 2 then
					local numships = SobGroup_SplitGroupReference("SingleProductionVgrPost2_SOB", "vgr_command_post2"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_command_post2"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 70 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(vaygrboostshipsAlt))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionVgrPost2_SOB"..counter, vaygrboostshipsAlt[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Vgr Command Post 3
				if SobGroup_Count("vgr_command_post3"..playerIndex) > 0 and territory_hwsaving == 3 then
					local numships = SobGroup_SplitGroupReference("SingleProductionVgrPost3_SOB", "vgr_command_post3"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_command_post3"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 50 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(VgrAllfrigates))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionVgrPost3_SOB"..counter, VgrAllfrigates[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Vgr Command Post 4
				if SobGroup_Count("vgr_command_post4"..playerIndex) > 0 and territory_hwsaving == 4 then
					local numships = SobGroup_SplitGroupReference("SingleProductionVgrPost4_SOB", "vgr_command_post4"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_command_post4"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 10 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(VgrAllDestroyers))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionVgrPost4_SOB"..counter, VgrAllDestroyers[shiptype])		--spawn specific type of ship
						end
					end
				end
				
				--Kad Command Post 1
				if SobGroup_Count("kad_command_post1"..playerIndex) > 0 and territory_hwsaving == 1 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKadPost1_SOB", "kad_command_post1"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kad_command_post1"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 80 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(Kadboostships))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKadPost1_SOB"..counter, Kadboostships[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Kad Command Post 2
				if SobGroup_Count("kad_command_post2"..playerIndex) > 0 and territory_hwsaving == 2 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKadPost2_SOB", "kad_command_post2"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kad_command_post2"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 70 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(KadboostshipsAlt))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKadPost2_SOB"..counter, KadboostshipsAlt[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Kad Command Post 3
				if SobGroup_Count("kad_command_post3"..playerIndex) > 0 and territory_hwsaving == 3 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKadPost3_SOB", "kad_command_post3"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kad_command_post3"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 50 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(KadAllfrigates))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKadPost3_SOB"..counter, KadAllfrigates[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Kad Command Post 4
				if SobGroup_Count("kad_command_post4"..playerIndex) > 0 and territory_hwsaving == 4 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKadPost4_SOB", "kad_command_post4"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kad_command_post4"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 10 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(KadAllDestroyers))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKadPost4_SOB"..counter, KadAllDestroyers[shiptype])		--spawn specific type of ship
						end
					end
				end
				
				--Rad Command Post 1
				if SobGroup_Count("rad_command_post1"..playerIndex) > 0 and territory_hwsaving == 1 then
					local numships = SobGroup_SplitGroupReference("SingleProductionRadPost1_SOB", "rad_command_post1"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_command_post1"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 80 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(Radboostships))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionRadPost1_SOB"..counter, Radboostships[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Rad Command Post 2
				if SobGroup_Count("rad_command_post2"..playerIndex) > 0 and territory_hwsaving == 2 then
					local numships = SobGroup_SplitGroupReference("SingleProductionRadPost2_SOB", "rad_command_post2"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_command_post2"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 70 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(RadboostshipsAlt))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionRadPost2_SOB"..counter, RadboostshipsAlt[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Rad Command Post 3
				if SobGroup_Count("rad_command_post3"..playerIndex) > 0 and territory_hwsaving == 3 then
					local numships = SobGroup_SplitGroupReference("SingleProductionRadPost3_SOB", "rad_command_post3"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_command_post3"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 50 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(RadAllfrigates))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionRadPost3_SOB"..counter, RadAllfrigates[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Rad Command Post 4
				if SobGroup_Count("rad_command_post4"..playerIndex) > 0 and territory_hwsaving == 4 then
					local numships = SobGroup_SplitGroupReference("SingleProductionRadPost4_SOB", "rad_command_post4"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_command_post4"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 10 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(RadAllDestroyers))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionRadPost4_SOB"..counter, RadAllDestroyers[shiptype])		--spawn specific type of ship
						end
					end
				end
				
				--Kpr Command Post 1
				if SobGroup_Count("kpr_command_post1"..playerIndex) > 0 and territory_hwsaving == 1 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKprPost1_SOB", "kpr_command_post1"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_command_post1"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 80 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(Kprboostships))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKprPost1_SOB"..counter, Kprboostships[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Kpr Command Post 2
				if SobGroup_Count("kpr_command_post2"..playerIndex) > 0 and territory_hwsaving == 2 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKprPost2_SOB", "kpr_command_post2"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_command_post2"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 70 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(KprboostshipsAlt))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKprPost2_SOB"..counter, KprboostshipsAlt[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Kpr Command Post 3
				if SobGroup_Count("kpr_command_post3"..playerIndex) > 0 and territory_hwsaving == 3 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKprPost3_SOB", "kpr_command_post3"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_command_post3"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 50 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(KprAllfrigates))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKprPost3_SOB"..counter, KprAllfrigates[shiptype])		--spawn specific type of ship
						end
					end
				end
				--Kpr Command Post 4
				if SobGroup_Count("kpr_command_post4"..playerIndex) > 0 and territory_hwsaving == 4 then
					local numships = SobGroup_SplitGroupReference("SingleProductionKprPost4_SOB", "kpr_command_post4"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_command_post4"..playerIndex))
					for counter = 0, numships - 1, 1 do		--check every command post
						if 10 > random_pseudo(0,100) then		--possibility to spawn a ship
							local shiptype = random_pseudo(1, Table_CountElements(KprAllDestroyers))		--ship type to spawn
							SobGroup_CreateShip("SingleProductionKprPost4_SOB"..counter, KprAllDestroyers[shiptype])		--spawn specific type of ship
						end
					end
				end
				
			end
		end
		playerIndex = playerIndex + 1
	end
	territory_hwsaving = territory_hwsaving + 1

	Rule_Remove("TerritoryAI_SpawnGeneralShips")
	if gBuildSpeedSetting == 0 then
		Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 50)
	elseif gBuildSpeedSetting == 3 then
		Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 75)
	elseif gBuildSpeedSetting == 4 then
		Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 100)
	elseif gBuildSpeedSetting == 1 then
		Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 25)
	elseif gBuildSpeedSetting == 2 then
		Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 12.5)
	else
		Rule_AddInterval("TerritoryAI_SpawnGeneralShips", 50)
	end

end

function TerritoryAI_SpawnUtilities()  
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;	
	while playerIndex < playerCount do
		if gChallengeMode == 0 and playerIndex == 5 then
			break
		end
		if Player_IsAlive(playerIndex) == 1 and Player_NumberOfAwakeShips(playerIndex) > 0 then
			if CPU_Exist_Smart(playerIndex) == 1 then
				if Player_GetRace(playerIndex) == 1 then
					local k = 1
					--Research Station
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") == 0 then
						for i = 1, 4, 1 do
							k = random_pseudo(1,4)
							if SobGroup_Count("hgn_command_post"..k..playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") == 0 then
								SobGroup_CreateShip("hgn_command_post"..k..playerIndex, "hgn_researchstation")
							end
						end
					end
					if SobGroup_Count("hgn_researchstation"..playerIndex) > 0 then		--create subsystems for research station
						if SobGroup_GetHardPointHealth("hgn_researchstation"..playerIndex, "Generic 1") == 0 and SobGroup_IsBuilding("hgn_researchstation"..playerIndex, "Hgn_MS_Module_Research") == 0 then
				     	SobGroup_CreateSubSystem("hgn_researchstation"..playerIndex, "Hgn_MS_Module_Research")
				    end
				    if SobGroup_GetHardPointHealth("hgn_researchstation"..playerIndex, "Generic 2") == 0 and SobGroup_IsBuilding("hgn_researchstation"..playerIndex, "Hgn_MS_Module_ResearchAdvanced") == 0 and researchList[playerIndex+1] > 125 then
				     	SobGroup_CreateSubSystem("hgn_researchstation"..playerIndex, "Hgn_MS_Module_ResearchAdvanced")
				    end
				    if SobGroup_GetHardPointHealth("hgn_researchstation"..playerIndex, "Generic 3") == 0 and SobGroup_IsBuilding("hgn_researchstation"..playerIndex, "Hgn_MS_Module_ResearchAdvanced1") == 0 and researchList[playerIndex+1] > 450 then
				     	SobGroup_CreateSubSystem("hgn_researchstation"..playerIndex, "Hgn_MS_Module_ResearchAdvanced1")
				    end
					end
					--Power Station
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") == 0 then
						for i = 1, 4, 1 do
							k = random_pseudo(1,4)
							if SobGroup_Count("hgn_command_post"..k..playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") == 0 then
								SobGroup_CreateShip("hgn_command_post"..k..playerIndex, "hgn_power")
							end
						end
					end
					if SobGroup_Count("hgn_power"..playerIndex) > 0 then		--create subsystems for power station
						for i = 1, 10 ,1 do
							if SobGroup_GetHardPointHealth("hgn_power"..playerIndex, "p"..i) == 0 then
								if i == 10 then
									i = 0
								end
								if SobGroup_IsBuilding("hgn_power"..playerIndex, "hgn_power_m"..i) == 0 then
				      		SobGroup_CreateSubSystem("hgn_power"..playerIndex, "hgn_power_m"..i)
				      	end
				      end
				    end
					end
					--Crew Station
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") == 0 then
						for i = 1, 4, 1 do
							k = random_pseudo(1,4)
							if SobGroup_Count("hgn_command_post"..k..playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") == 0 then
								SobGroup_CreateShip("hgn_command_post"..k..playerIndex, "hgn_crewstation")
							end
						end
					end
					if SobGroup_Count("hgn_crewstation"..playerIndex) > 0 then		--create subsystems for crew station
						if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isEnsign") == 0 then
			      	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "isEnsignCore")
			      end	
	
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") > 0 then
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isLieutenant") == 0 then
			        	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isLieutenantCore")     
			        end
				      if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 1") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule") == 0 then
				      	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule")
				      end
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") > 0 then
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommander") == 0 then
			       		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isCommanderCore")  	
			       	end
			        if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 2") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule1") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule1")
			      	end
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 7") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_OfficerModule") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")
			      	end
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 then
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCaptain") == 0 then
			        	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isCaptainCore") 	    
			        end
			       	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 3") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule2") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule2")
			      	end
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 8") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_OfficerModule1") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule1")
			      	end
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 then
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommodore") == 0 then
			        	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isCommodoreCore") 	  
			        end
							if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 4") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule3") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule3")
			      	end
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 9") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_OfficerModule2") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule2")
			      	end
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then
			        if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isAdmiral") == 0 then
			        	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isAdmiralCore")  	  
			        end
			        if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 5") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule4") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule4")
			      	end
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 10") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_OfficerModule3") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule3")
			      	end
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then
			        if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isFleetAdmiral") == 0 then
			        	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isFleetAdmiralCore") 	     
			        end
			        if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 6") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule5") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule5")
			      	end
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 11") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_OfficerModule4") == 0 then
			      		SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule4")
			      	end
			      end
			    end
			    
			  elseif Player_GetRace(playerIndex) == 2 then
			  	for i = 1, 4, 1 do
				  	if Player_CanResearch(playerIndex , "resource"..i) == 1 then
				  		Player_Research(playerIndex , "resource"..i)
				  	end
				  end
			  	for i = 1, 10, 1 do
				  	if Player_CanResearch(playerIndex , "energyproduction"..i) == 1 then
				  		Player_Research(playerIndex , "energyproduction"..i)
				  	end
				  end
			  	for i = 1, 6, 1 do
				  	if Player_CanResearch(playerIndex , "Crew"..i) == 1 then
				  		Player_Research(playerIndex , "Crew"..i)
				  	end
				  end
			  	for i = 1, 5, 1 do
				  	if Player_CanResearch(playerIndex , "Officer"..i) == 1 then
				  		Player_Research(playerIndex , "Officer"..i)
				  	end
				  end
				  
			  elseif Player_GetRace(playerIndex) == 3 then
			  	for i = 1, 4, 1 do
				  	if Player_CanResearch(playerIndex , "resource"..i) == 1 then
				  		Player_Research(playerIndex , "resource"..i)
				  	end
				  end
			  	for i = 1, 10, 1 do
				  	if Player_CanResearch(playerIndex , "energyproduction"..i) == 1 then
				  		Player_Research(playerIndex , "energyproduction"..i)
				  	end
				  end
			  	for i = 1, 6, 1 do
				  	if Player_CanResearch(playerIndex , "Crew"..i) == 1 then
				  		Player_Research(playerIndex , "Crew"..i)
				  	end
				  end
			  	for i = 1, 5, 1 do
				  	if Player_CanResearch(playerIndex , "Officer"..i) == 1 then
				  		Player_Research(playerIndex , "Officer"..i)
				  	end
				  end
				  
			  elseif Player_GetRace(playerIndex) == 4 then
					--Raider Power Plant
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_powerstation") == 0 then
						for i = 1, 4, 1 do
							k = random_pseudo(1,4)
							if SobGroup_Count("rad_command_post"..k..playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_powerstation") == 0 then
								SobGroup_CreateShip("rad_command_post"..k..playerIndex, "rad_powerstation")
							end
						end
					end
			  	for i = 1, 4, 1 do
				  	if Player_CanResearch(playerIndex , "resource"..i) == 1 then
				  		Player_Research(playerIndex , "resource"..i)
				  	end
				  end
			  	for i = 1, 10, 1 do
				  	if Player_CanResearch(playerIndex , "energyproduction"..i) == 1 then
				  		Player_Research(playerIndex , "energyproduction"..i)
				  	end
				  end
			  	if Player_CanResearch(playerIndex , "isLieutenant") == 1 then
			  		Player_Research(playerIndex , "isLieutenant")
			  	end
			  	if Player_CanResearch(playerIndex , "isCommander") == 1 then
			  		Player_Research(playerIndex , "isCommander")
			  	end
			  	if Player_CanResearch(playerIndex , "isCaptain") == 1 then
			  		Player_Research(playerIndex , "isCaptain")
			  	end
			  	if Player_CanResearch(playerIndex , "isCommodore") == 1 then
			  		Player_Research(playerIndex , "isCommodore")
			  	end
			  	if Player_CanResearch(playerIndex , "isAdmiral") == 1 then
			  		Player_Research(playerIndex , "isAdmiral")
			  	end
			  	if Player_CanResearch(playerIndex , "isFleetAdmiral") == 1 then
			  		Player_Research(playerIndex , "isFleetAdmiral")
			  	end
			  	for i = 1, 6, 1 do
				  	if Player_CanResearch(playerIndex , "Crew"..i) == 1 then
				  		Player_Research(playerIndex , "Crew"..i)
				  	end
				  end
			  	for i = 1, 5, 1 do
				  	if Player_CanResearch(playerIndex , "Officer"..i) == 1 then
				  		Player_Research(playerIndex , "Officer"..i)
				  	end
				  end

				elseif Player_GetRace(playerIndex) == 6 then
			  	for i = 1, 4, 1 do
				  	if Player_CanResearch(playerIndex , "resource"..i) == 1 then
				  		Player_Research(playerIndex , "resource"..i)
				  	end
				  end
			  	for i = 1, 10, 1 do
				  	if Player_CanResearch(playerIndex , "energyproduction"..i) == 1 then
				  		Player_Research(playerIndex , "energyproduction"..i)
				  	end
				  end
			  	for i = 1, 6, 1 do
				  	if Player_CanResearch(playerIndex , "Crew"..i) == 1 then
				  		Player_Research(playerIndex , "Crew"..i)
				  	end
				  end
			  	for i = 1, 5, 1 do
				  	if Player_CanResearch(playerIndex , "Officer"..i) == 1 then
				  		Player_Research(playerIndex , "Officer"..i)
				  	end
				  end

			  end		--of race

			end
		end
		playerIndex = playerIndex + 1
	end
end

function MaximizeRecruitForNewGameType()  
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;		
	while (playerIndex < playerCount) do
		if Player_GetRace(playerIndex) == 1 then
			if (Player_IsAlive(playerIndex) == 1) and Player_NumberOfAwakeShips(playerIndex) > 0 then
				pilotrecruitList[playerIndex + 1] = pilotrecruitList[playerIndex + 1] + random_pseudo(8,30)		--auto recruit officers
				if pilotrecruitList[playerIndex + 1] > pilotmaxList[playerIndex + 1] then
					pilotrecruitList[playerIndex + 1] = pilotmaxList[playerIndex + 1]
				end
				officerrecruitList[playerIndex + 1] = officerrecruitList[playerIndex + 1] + random_pseudo(1,4)		--auto recruit pilots
				if officerrecruitList[playerIndex + 1] > officermaxList[playerIndex + 1] then
					officerrecruitList[playerIndex + 1] = officermaxList[playerIndex + 1]
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

function SpawnCaptureFrigateForNewGameType()  
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;	
	while (playerIndex < playerCount) do
		if gChallengeMode == 0 and playerIndex == 5 then
			break
		end
		if (Player_IsAlive(playerIndex) == 1) and Player_NumberOfAwakeShips(playerIndex) > 0 and pilotpopList[playerIndex + 1] < pilotrecruitList[playerIndex + 1] then
			for i = 1, 4, 1 do
				local numCaptureFrigate = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_marinefrigate") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_infiltratorfrigate") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_podship") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gunfrigate") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_deciever")
				local numCaptureFrigateLimit = 6 + atan(year/2)
				if SobGroup_Count("hgn_command_post"..i..playerIndex) > 0 and numCaptureFrigate < numCaptureFrigateLimit then
					SobGroup_CreateShip("hgn_command_post"..i..playerIndex, "hgn_marinefrigate")
				end
				if SobGroup_Count("vgr_command_post"..i..playerIndex) > 0 and numCaptureFrigate < numCaptureFrigateLimit then
					SobGroup_CreateShip("vgr_command_post"..i..playerIndex, "vgr_infiltratorfrigate")
				end
				if SobGroup_Count("kad_command_post"..i..playerIndex) > 0 and numCaptureFrigate < numCaptureFrigateLimit then
					SobGroup_CreateShip("kad_command_post"..i..playerIndex, "kad_podship")
				end
				if SobGroup_Count("rad_command_post"..i..playerIndex) > 0 and numCaptureFrigate < numCaptureFrigateLimit then
					SobGroup_CreateShip("rad_command_post"..i..playerIndex, "rad_gunfrigate")
				end
				if SobGroup_Count("kpr_command_post"..i..playerIndex) > 0 and numCaptureFrigate < numCaptureFrigateLimit then
					SobGroup_CreateShip("kpr_command_post"..i..playerIndex, "kpr_deciever")
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

CaptureFrigates = {"vgr_infiltratorfrigate", "hgn_marinefrigate", "kad_podship", "rad_gunfrigate", "kpr_deciever"}

function AIAutoCaptureForNewGameType()
	Update_AllShips()
	SobGroup_Create("all_command_post")
	SobGroup_Clear("all_command_post")
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			SobGroup_SobGroupAdd("all_command_post", "hgn_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "hgn_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "hgn_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "hgn_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "vgr_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "vgr_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "vgr_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "vgr_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kad_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kad_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kad_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kad_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "rad_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "rad_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "rad_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "rad_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kpr_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kpr_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kpr_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("all_command_post", "kpr_command_post4"..playerIndex)
		end
		playerIndex = playerIndex + 1
	end
	
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;	
	local playerIndexList = 0
	while (playerIndex < playerCount) do
		playerIndexList = playerIndex + 1
		if (Player_IsAlive(playerIndex) == 1) and Player_NumberOfAwakeShips(playerIndex) > 0 and CPU_Exist_Smart(playerIndex) == 1 then
			
			SobGroup_Create("own_command_post"..playerIndex)
			SobGroup_Clear("own_command_post"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "hgn_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "hgn_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "hgn_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "hgn_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "vgr_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "vgr_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "vgr_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "vgr_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kad_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kad_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kad_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kad_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "rad_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "rad_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "rad_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "rad_command_post4"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kpr_command_post1"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kpr_command_post2"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kpr_command_post3"..playerIndex)
			SobGroup_SobGroupAdd("own_command_post"..playerIndex, "kpr_command_post4"..playerIndex)
			
			SobGroup_Create("enemy_command_post"..playerIndex)
			SobGroup_Clear("enemy_command_post"..playerIndex)
			SobGroup_FillSubstract("enemy_command_post"..playerIndex, "all_command_post", "own_command_post"..playerIndex)
			for p=0,playerCount-1,1 do
				if AreAllied(playerIndex, p) == 0 then
					SobGroup_SobGroupAddPlayerShipsByType("enemy_command_post"..playerIndex, p, "cpu_resource_generator")
				end
			end

			local i = 0
			repeat
				i = i +1
				SobGroup_Create("CatptureFrigate_Total")
				Player_FillShipsByType("CatptureFrigate_Total", playerIndex, CaptureFrigates[i])
				local numships = SobGroup_SplitGroupReference("SingleCaptureFrigate_SOB", "CatptureFrigate_Total", "frigates"..playerIndex, SobGroup_Count("CatptureFrigate_Total"))
				for counter = 0, numships - 1, 1 do
					if SobGroup_IsDoingAbility("SingleCaptureFrigate_SOB" .. counter, AB_Move) == 0 and
					SobGroup_IsDoingAbility("SingleCaptureFrigate_SOB" .. counter, AB_Attack) == 0 and
					SobGroup_IsDoingAbility("SingleCaptureFrigate_SOB" .. counter, AB_Capture) == 0 and
					--SobGroup_IsDoingAbility("SingleCaptureFrigate_SOB" .. counter, AB_HyperspaceViaGate) == 0 and
					SobGroup_IsDoingAbility("SingleCaptureFrigate_SOB" .. counter, AB_Dock) == 0 then
						local distance = 1000
						local difference = random_pseudo(300,500)
						local limiter = 0
						while distance <= 5000+1500*military_list[playerIndexList] and limiter < 1 do
							if SobGroup_FillProximitySobGroup ("temp", "enemy_command_post"..playerIndex, "SingleCaptureFrigate_SOB" .. counter, distance) == 1 then
								SobGroup_CaptureSobGroup("SingleCaptureFrigate_SOB".. counter, "temp")
								CPU_RemoveSobGroup(playerIndex, "SingleCaptureFrigate_SOB".. counter)
								limiter = limiter + 1
								--print(CaptureFrigates[i]..counter.." is going to capture command post for player index: "..playerIndex.." from distance: "..distance..", game year: "..year)
							else
								distance = distance + difference
							end
						end
					end
				end
			until (not CaptureFrigates[i + 1])
		end
		playerIndex = playerIndex + 1
	end
end

function Animate_MothershipDoorOpen()  
  SobGroup_AllowPassiveActionsAlways("hgn_mothership0", 1)
  SobGroup_SetMadState("hgn_mothership0", "NIS00")
  Sound_SpeechSubtitlePath("speech:missions/m_01/")
  Rule_Remove("Animate_MothershipDoorOpen")  
end

function Animate_MothershipDoorClose() 
  SobGroup_SetMadState("hgn_mothership0", "NIS01")
  Rule_Remove("Animate_MothershipDoorClose")  
end  


function GetGameSettings()
	--GET GAME SETTINGS FROM MAIN MENU
	gWorldBounds = Universe_GetWorldBounds()
	gGameRubric = GetGameRubric() --GR_SKIRMISH or GR_MULTIPLAYER
	
	gUnitCapSetting = GetGameSettingAsString("unitcaps")
	gStartingResources = GetGameSettingAsNumber("resstart")
	
	--gWinCondition = GetGameSettingAsNumber("WinCondition")
	gFogOfWarSetting = GetGameSettingAsString("FogOfWarSetting")
	gShieldSetting = GetGameSettingAsString("ShieldSetting")
	gDynamicMusicSetting = GetGameSettingAsNumber("DynamicMusicSetting")
	gMaxHealthMultiplier = GetGameSettingAsNumber("MaxHealthMultiplier")
	--gShipSpeedSetting = GetGameSettingAsNumber("ShipSpeedSetting")
	gGrantAllResearch = GetGameSettingAsString("GrantAllResearch")
	gJumpGateOwnership = GetGameSettingAsNumber("JumpGateOwnership")
	gChallengeMode = GetGameSettingAsNumber("challengemode")
	gJumpCost = GetGameSettingAsNumber("JumpCost")
	gPayoutMultiplier = GetGameSettingAsNumber("PayoutMultiplier")
	gResourceCap = GetGameSettingAsNumber("ResourceCap")
end


function RunLevelConfig()
	--echo("RunLevelConfig IS RUNNING")
	local fileWithLevelName = "level_" .. round(gWorldBounds[1]) .. "_" .. round(gWorldBounds[2]) .. "_" .. round(gWorldBounds[3]) .. ".lua"
	--echo("fileWithLevelName: " .. fileWithLevelName)
	dofilepath("Data:leveldata/multiplayer/territories/" .. fileWithLevelName)
	if LevelName ~= "" then
		echo("LevelName: " .. LevelName)
		dofilepath("Data:leveldata/multiplayer/territories/" .. LevelName .. "_config.lua")
		--dofilepath("Data:leveldata/multiplayer/territories/" .. LevelName .. "_randomizer.lua")
		SetupTerritoryTables()
		BoardStats.numTerritories = getn(Territories)
	end
end



function Rule_RunDynamicCode() --TEMP
	dofilepath("Data:leveldata/multiplayer/territories/dynamic_code.lua")
end

function Rule_HideSensors() --TEMP, FOR SCREENSHOTS
	SobGroup_AbilityActivate("Player_Ships0", AB_Sensors, 0)
end

function Rule_PrintGameTime()
	echo(" ")
end



function Rule_Init()
	
	Rule_Remove("Rule_Init") --remove it first in case it errors out
	
	
	--TEMPORARY STUFF
	--Rule_AddInterval("Rule_RunDynamicCode", 15)
	--Rule_AddInterval("Rule_HideSensors", 1)
	--Rule_AddInterval("Rule_PrintGameTime", 1)
	
	
	--make sure the game is set up correctly
	local badSettings = 0
	
	--check that players 4 and 5 are cpu players
	if Player_IsAlive(4) == 0 or Player_IsAlive(5) == 0 then
		badSettings = 1
		echo("BAD SETTINGS BECAUSE: Player_IsAlive(4) == 0 or Player_IsAlive(5) == 0")
	end
	
	if badSettings == 0 then
		if gGameRubric == GR_SKIRMISH then --can only do this check if it's player vs cpu
			if CPU_Exist_Smart(4) == 0 or CPU_Exist_Smart(5) == 0 then
				badSettings = 1
				echo("BAD SETTINGS BECAUSE: CPU_Exist_Smart(4) == 0 or CPU_Exist_Smart(5) == 0")
			end
		end
	end
	
	--check that it isn't just one player and all players aren't teammates
	if badSettings == 0 then
		local numPlayers = 0
		local numEnemies = 0
		local i = 0
		local j = 0
		for i = 0,3 do
			if Player_IsAlive(i) == 1 then
				numPlayers = numPlayers + 1
				for j = 0,3 do
					if j ~= i and Player_IsAlive(j) == 1 then
						if AreAllied(i, j) == 0 then
							numEnemies = numEnemies + 1
							break
						end
					end
				end
			end
		end
		
		if numPlayers <= 1 then
			badSettings = 1
			echo("BAD SETTINGS BECAUSE: numPlayers <= 1")
		elseif numEnemies == 0 and gChallengeMode == 0 then
			badSettings = 1
			echo("BAD SETTINGS BECAUSE: numEnemies == 0")
		end
	end
	
	--end game if it isn't set up correctly
	if badSettings == 1 then
		UI_ShowScreen("BadSettings", ePopup)
		Rule_Remove("Rule_Init")
		return
	end
	
	
	SetupCommandPosts()
	SetupJumpGates()
	
	if gGameRubric == GR_SKIRMISH then
		SetupCpuInformation()
		SetupCpuPlayers()
	else
		--clear unneeded tables
		gShips = nil
		gCommandPostShips = nil
	end
	
	SetupPlayers()
	
	
	if AuditMap > 0 then
		PerformAudit()
	end
	
	if AddLocatorShip == 1 then
		AddLocatorShipFunction()
	end
	
	
	gShipTypes_count = getn(gShipTypes)
	
	Rule_AddInterval("Rule_HandleStrayShips", 4/gPlayerCount)
	
	
	--if gDynamicMusicSetting == ON then
		--Rule_AddInterval("Rule_DynamicMusic", gMusicRuleInterval)
	--end
	
	--set up player visibility
	if gFogOfWarSetting == "all_visible" then
		Rule_ShowEveryone() --run it once as a function
		Rule_AddInterval("Rule_ShowEveryone", 6.7)
	end
	
	if gGrantAllResearch == "yes" then	
		Rule_AddInterval("GrantAllResearchForTerritoryGame", 9.7)
	end
	
	Rule_UpdateATI() --run it first as a function
	Rule_UpdateATI() --twice to get rid of question marks
	
	
	
	
	
	
end

function Territory_ActivateShieldFX()
	for i = 1,BoardStats.numTerritories do
		if Universe_GameTime() < 1 then
			TerritoryStats[i] = GetTerritoryStatsEntry(i)
		end
		if TerritoryStats[i][PARENTID] == PARENT then
			--shields
			if gShieldSetting == "blue" then
				gShieldSetting = "blue"
				FX_PlayEffect("defensefield_sphere_spray_static", "TerritoryVolume" .. i, TerritoryStats[i][SIZE])		--defensefield_sphere_spray_static_noloop
			elseif gShieldSetting == "green" then
				gShieldSetting = "green"
				FX_PlayEffect("defensefield_sphere_spray_green", "TerritoryVolume" .. i, TerritoryStats[i][SIZE])		--defensefield_sphere_spray_green_noloop
			elseif gShieldSetting == "gold" then
				gShieldSetting = "gold"
				FX_PlayEffect("defensefield_sphere_spray_vaygr", "TerritoryVolume" .. i, TerritoryStats[i][SIZE])		--defensefield_sphere_spray_vaygr_noloop
			end
		end
	end
end

function SetupCommandPosts()
	--echo("SetupCommandPosts() IS RUNNING")
	local i = 0
	local shipName = ""
	local postCount = 0
	local totalPayout = 0
	
	for i = 1,BoardStats.numTerritories do
		--echo("--------------------CHECKING TERRITORY " .. i)
		TerritoryStats[i] = GetTerritoryStatsEntry(i)
		
		if Territories[i][PARENTID] == PARENT then
			tinsert(gParentTerritoryIDs, i)
			
		else
			tinsert(gChildTerritoryIDs, i)
		end
		
		if Territories[i][BUILDTYPE] == EMPTY then
			TerritoryStats[i][PAYOUT_RATE] = 0
		else
			tinsert(gCapturableTerritoryIDs, i)
			
			SobGroup_Create("CommandPost" .. i)
			SobGroup_SetSwitchOwnerFlag("CommandPost" .. i, 0)
			if Territories[i][BUILDTYPE] == RESOURCE_ONLY then
				shipName = "cpu_resource_generator"
				tinsert(gResourceGeneratorIDs, i)
			else
				if Player_GetRace(ENEMY_CPU) == 2 then
					shipName = "vgr_command_post" .. Territories[i][BUILDTYPE]
				elseif Player_GetRace(ENEMY_CPU) == 1 then
					shipName = "hgn_command_post" .. Territories[i][BUILDTYPE]
				elseif Player_GetRace(ENEMY_CPU) == 3 then
					shipName = "kad_command_post" .. Territories[i][BUILDTYPE]
				elseif Player_GetRace(ENEMY_CPU) == 4 then
					shipName = "rad_command_post" .. Territories[i][BUILDTYPE]
				elseif Player_GetRace(ENEMY_CPU) == 6 then
					shipName = "kpr_command_post" .. Territories[i][BUILDTYPE]
				end
				postCount = postCount + 1
			end
			SobGroup_SpawnNewShipInSobGroup(ENEMY_CPU, shipName, "CommandPost" .. i, "CommandPost" .. i, "TerritoryVolume" .. i)
			SobGroup_AbilityActivate("CommandPost" .. i, AB_Scuttle, 0)
			SobGroup_SetInvulnerability("CommandPost" .. i, 1)
			SobGroup_SetTactics("CommandPost" .. i, PassiveTactics)
			--if gFogOfWarSetting == "posts_visible" or gFogOfWarSetting == "all_visible" then
				FOW_RevealGroup("CommandPost" .. i, 1)
			--end
			
			--echo("gPayoutMultiplier: " .. gPayoutMultiplier)
			--echo("Territory payout: " .. Territories[i][PAYOUT])
			
			TerritoryStats[i][PAYOUT_RATE] = Territories[i][PAYOUT] * gPayoutMultiplier --rate of RU payout (per minute)
			TerritoryStats[i][PINGID] = AddCommandPostPing(i)
		end
		
		totalPayout = totalPayout + TerritoryStats[i][PAYOUT_RATE]
		
		--jump gates
		SobGroup_Create("Territory" .. i .. "JumpGates")
		SobGroup_SetSwitchOwnerFlag("Territory" .. i .. "JumpGates", 0)
	end
	
	
	--setup board stats values
	BoardStats.numParents = getn(gParentTerritoryIDs)
	BoardStats.numChildren = getn(gChildTerritoryIDs)
	BoardStats.numCapturable = getn(gCapturableTerritoryIDs)
	BoardStats.numCommandPost = postCount
	BoardStats.numRuGenerator = getn(gResourceGeneratorIDs)
	
	BoardStats.totalMapPayout = totalPayout
	
	
	Territories = nil --no longer needed, use TerritoryStats from now on
	gTerritoryStatsIsSetUp = 1
	
	gCommandPostShipNames[Race_Hiigaran] = "hgn_command_post"
	gCommandPostShipNames[Race_Vaygr] = "vgr_command_post"
	gCommandPostShipNames[3] = "kad_command_post"
	gCommandPostShipNames[4] = "rad_command_post"
	gCommandPostShipNames[6] = "kpr_command_post"
	
	--Rule_AddInterval("Territory_ActivateShieldFX", 5)
end

function GetTerritoryStatsEntry(iTerritoryID)
	--RETURNS A NEW ENTRY FOR THE TerritoryStats[] TABLE
	local tReturnVal = 
	{
		[PARENTID] = Territories[iTerritoryID][PARENTID],
		[LOCATION] = Territories[iTerritoryID][LOCATION],
		[BUILDTYPE] = Territories[iTerritoryID][BUILDTYPE],
		[SIZE] = GetTerritorySize(iTerritoryID),
		[OWNER] = ENEMY_CPU,
		[RACE] = Race_Hiigaran,
		[PAYOUT_RATE] = 0,
		[PINGID] = 0,
		
		--the rest of these entries only get filled in a skirmish game (for CPU AI):
		[NEIGHBOURS] = {}, --list of neighbours for this territory (parent territories only)
		[ASSOCIATES] = {}, --list of all nearby territories within X number of jumps
		[PATHS] = {}, --list of paths from this territory to nearby ones
		[CHILDSTATS] = {}, --info about all the stuff inside this territory
		[PLAYERSTATS] = {}, --info about player ships in the territory (updated during the match)
	}
	return tReturnVal
end


function GetTerritoryChildStatsEntry()
	--RETURNS A NEW ENTRY FOR THE TerritoryStats[][CHILDSTATS] ENTRY
	--(only used if the territory is set as a parent)
	--(only used if it's a skirmish match, not multiplayer)
	local tReturnVal = 
	{--one entry per territory
		[neighbourCount] = 0,
		[numChildren] = 0,
		[numCommandPosts] = 0, --child count only
		[numRUGenerators] = 0, --child count only
		[commandPostIDs] = {},
		[ruGeneratorIDs] = {},
		[totalPayoutFromAllPosts] = 0,
		[totalPostCount] = 0, --total number of posts/generators (parent + children)
		[unclaimedCount] = 0, --number of unclaimed posts/generators in this territory (updated in real-time)
		
		
		--not handled yet:
		--numJumpGates
		--totalShipCountWhenEmpty = 0, --count of all command posts, RU generators, jump gates
		--strategicSignificance = 0, --split this into 3 (RUs, build, bottleneck factor)
		--jump gate locations (??) (for mining? just make volumes to mine at the start)
		--jump gate sobgroups in this territory (table storing the names) ??
		
	}
	return tReturnVal
end


function GetTerritoryPlayerStatsEntry()
	--RETURNS A NEW ENTRY FOR THE TerritoryStats[][PLAYERSTATS] TABLES
	--(only used if the territory is a parent)
	--(only used if it's a skirmish match, not multiplayer)
	local tReturnVal = 
	{--one entry for each alive player for each parent territory
		
		--this table is also created for the human player (only for postsOwned)
		
		mySquads = {}, --list of squadron IDs from the allSquads table that are in this territory (does not count ships that are in transit or capture frigates) (AI only)
		
		postsOwned = 0, --count of command posts and RU generators the player owns in this territory
		threatLevel = 0 --how much threat is this territory under?
		
		--commandPostsOwned = 0,
		--ruGeneratorsOwned = 0,
		--numFighterSquads = 0,
		--numCorvetteSquads = 0,
		--numFrigateSquads = 0,
		--numCapitalSquads = 0,
		
		--also:
		--calculate a "percentage" of this territory that the player owns (for territories with 2+ children)
		--neighbour counts (enemy/friendly) and threat level calculation
		--closest enemy/friendly territories, number of jumps
		--info about nearby reinforcements and/or retreat paths
		--also a "need" for each kind of ship, relative to other kinds
		
		
	}
	return tReturnVal
end


function AddCommandPostPing(iTerritoryID)
	local pingToUse = "command_post_ping"
	if TerritoryStats[iTerritoryID][BUILDTYPE] == RESOURCE_ONLY then pingToUse = "resource_generator_ping" end
	local payoutText = 3 * TerritoryStats[iTerritoryID][PAYOUT_RATE] .. " RU/year"
	if gPayoutDisabled == 1 then payoutText = "DISABLED" end
	local pingID = Ping_AddSobGroup("Payout: " .. payoutText, pingToUse, "CommandPost" .. iTerritoryID)
	Ping_AddDescription(pingID, 0, PingDescriptions[TerritoryStats[iTerritoryID][BUILDTYPE]])
	Ping_LabelVisible(pingID, 1)
	return pingID
end


function SetupJumpGates()
	local idx = 0
	local connection = 0
	local str1 = ""
	local str2 = ""
	local shipname = ""
	for idx,connection in TerritoryConnections do
		if idx ~= "n" then
			str1 = connection[1] .. "_" .. connection[2]
			str2 = connection[2] .. "_" .. connection[1]
			SobGroup_Create("JumpGate" .. str1)
			SobGroup_Create("JumpGate" .. str2)
			
			shipname = "cpu_jump_gate_" .. gJumpCost
			if gJumpGateOwnership == MUST_OWN_TERRITORY then
				shipname = shipname .. "_uncapturable"
			end
			
			SobGroup_SpawnNewShipInSobGroup(ALLIED_CPU, shipname, "JumpGate" .. str1, "JumpGate" .. str1, "JumpPoint" .. str1)
			SobGroup_SpawnNewShipInSobGroup(ALLIED_CPU, shipname, "JumpGate" .. str2, "JumpGate" .. str2, "JumpPoint" .. str2)
			
			SobGroup_SobGroupAdd("AllJumpGates", "JumpGate" .. str1)
			SobGroup_SobGroupAdd("AllJumpGates", "JumpGate" .. str2)
			
			SobGroup_SobGroupAdd("Territory" .. connection[1] .. "JumpGates", "JumpGate" .. str1)
			SobGroup_SobGroupAdd("Territory" .. connection[2] .. "JumpGates", "JumpGate" .. str2)
			
			if gJumpGateOwnership == MUST_OWN_TERRITORY or gJumpGateOwnership == CAPTURABLE then
				SobGroup_SetSwitchOwnerFlag("JumpGate" .. str1, 0)
				SobGroup_SetSwitchOwnerFlag("JumpGate" .. str2, 0)
			end
			SobGroup_FormHyperspaceGate("JumpGate" .. str1, "JumpGate" .. str2)
		end
	end
	
	if gJumpGateOwnership == MUST_OWN_TERRITORY or gJumpGateOwnership == CAPTURABLE then
		--anti bug, just keep one Jump Gate for CPU 4, very important!
		--Update_AllShips()
		--SobGroup_Create("SubstractedJumpGates")
		--SobGroup_Clear("SubstractedJumpGates")
		--local numJumpGates = SobGroup_SplitGroupReference("ReturnSingleJumpGate_SOB", "AllJumpGates", "AllShips", SobGroup_Count("AllJumpGates"))
		--SobGroup_FillSubstract("SubstractedJumpGates", "AllJumpGates", "ReturnSingleJumpGate_SOB"..random_pseudo(0,numJumpGates-1))
		SobGroup_SetSwitchOwnerFlag("AllJumpGates", 0)
		SobGroup_SwitchOwner("AllJumpGates", ENEMY_CPU)
		
		--neutral territories need neutral jump gates
		for idx = 1,BoardStats.numTerritories do
			if TerritoryStats[idx][BUILDTYPE] == EMPTY then
				SobGroup_SwitchOwner("Territory" .. idx .. "JumpGates", ALLIED_CPU)
			end
		end
	end
	
	FOW_RevealGroup("AllJumpGates", 1)
	SobGroup_AbilityActivate("AllJumpGates", AB_Move, 0)
	SobGroup_AbilityActivate("AllJumpGates", AB_Scuttle, 0)
	SobGroup_AbilityActivate("AllJumpGates", AB_Sensors, 0)
	SobGroup_SetInvulnerability("AllJumpGates", 1)
	SobGroup_AbilityActivate("AllJumpGates", AB_FormHyperspaceGate, 0)
	--echo("JUMP GATES: " .. SobGroup_Count("AllJumpGates"))
end


function SetupPlayers()
	--first set up CPU players 4 and 5
	if gChallengeMode == 1 then
		CPU_Enable(4, 1)
		CPU_Enable(5, 1)
		Player_SetPlayerNameAdvanced(5, "Government")
	else
		CPU_Enable(4, 0)
		CPU_Enable(5, 0)
		Player_SetPlayerNameAdvanced(5, "Unclaimed")
	end
	Player_SetPlayerNameAdvanced(4, "")
	
	SobGroup_Despawn("StartShips")
	Rule_AddInterval("Rule_DestroyStartShips", 0.5)
	
	gPlayerRaces[ENEMY_CPU] = Race_Hiigaran --needed for swapping command posts
	
	--set up regular players 0-3
	local playerID = 0
	local i = 0
	local j = 0
	local playerRace = 0
	SetAlliance(ENEMY_CPU, ALLIED_CPU)
	SetAlliance(ALLIED_CPU, ENEMY_CPU)
  for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 then
			gPlayerCount = gPlayerCount + 1
			playerRace = Player_GetRace(playerID)
			gPlayerRaces[playerID] = playerRace
			gPlayerPayouts[playerID] = 0
			PlayerCommandPostCounts[playerID] = 0
			
			--set up alliances
			SetAlliance(playerID, ALLIED_CPU)
			SetAlliance(ALLIED_CPU, playerID)
			if AreAllied(playerID, ENEMY_CPU) == 1 then
				BreakAlliance(playerID, ENEMY_CPU)
				BreakAlliance(ENEMY_CPU, playerID)
			end
			
			--switch owner of command posts and jump gates in start territories
			SobGroup_SwitchOwner("CommandPost" .. PlayerStartTerritories[playerID], playerID)
			CommandPost_SwitchOwner(PlayerStartTerritories[playerID], playerID)
			
			if gJumpGateOwnership == MUST_OWN_TERRITORY then
				SobGroup_SwitchOwner("Territory" .. PlayerStartTerritories[playerID] .. "JumpGates", playerID)
			end
			
    		
			--max health multiplier
			for i = 2,5 do
				if i == gMaxHealthMultiplier then
					Player_GrantResearchOption(playerID, "MAXHEALTH_" .. i)
				else
					Player_RestrictResearchOptionCUSTOM(playerID, "MAXHEALTH_" .. i)
				end
			end
			

    		
    		
			
		end
	end
	
		
	gRestrictedResearches = nil --no longer needed
end

--grant all researches?
function GrantAllResearchForTerritoryGame()
	--if gGrantAllResearch == "yes" then	
		local playerCount = Universe_PlayerCount();
		local playerIndex = 0;	
		while (playerIndex < playerCount) do
			--if CPU_Exist_Smart(playerIndex) == 1 then
				if Player_HasResearch(playerIndex, "isai") == 0 then
					Player_RestrictResearchOption(playerIndex, "isai")
				end
				if Player_HasResearch(playerIndex, "iseasy") == 0 then
					Player_RestrictResearchOption(playerIndex, "iseasy")
				end
				if Player_HasResearch(playerIndex, "isstandard") == 0 then
					Player_RestrictResearchOption(playerIndex, "isstandard")
				end
				if Player_HasResearch(playerIndex, "ishard") == 0 then
					Player_RestrictResearchOption(playerIndex, "ishard")
				end
				if Player_HasResearch(playerIndex, "isexpert") == 0 then
					Player_RestrictResearchOption(playerIndex, "isexpert")
				end
			--end
			
			Player_GrantAllResearch(playerIndex)
			
			if Player_HasResearch(playerIndex, "isai") == 0 then
				Player_UnrestrictResearchOption(playerIndex, "isai")
			end
			if Player_HasResearch(playerIndex, "iseasy") == 0 then
				Player_UnrestrictResearchOption(playerIndex, "iseasy")
			end
			if Player_HasResearch(playerIndex, "isstandard") == 0 then
				Player_UnrestrictResearchOption(playerIndex, "isstandard")
			end
			if Player_HasResearch(playerIndex, "ishard") == 0 then
				Player_UnrestrictResearchOption(playerIndex, "ishard")
			end
			if Player_HasResearch(playerIndex, "isexpert") == 0 then
				Player_UnrestrictResearchOption(playerIndex, "isexpert")
			end
			
			playerIndex = playerIndex + 1
		end
	--end
	Rule_Remove("GrantAllResearchForTerritoryGame")
end

function Player_RestrictResearchOptionCUSTOM(iPlayerID, sResearchName)
	--THIS IS SO RESEARCHES DON'T GET RESTRICTED TWICE, CAUSING AN ERROR
	if IsRestricted(iPlayerID, sResearchName) == 0 then
		Player_RestrictResearchOption(iPlayerID, sResearchName)
		tinsert(gRestrictedResearches, { id=iPlayerID, research=sResearchName })
	end
end


function IsRestricted(iPlayerID, sResearchName)
	--THIS IS USED IN CONJUNCTION WITH Player_RestrictResearchOptionCUSTOM() TO AVOID ERRORS
	local returnVal = 0
	local idx = 0
	local entry = {}
	for idx, entry in gRestrictedResearches do
		if idx ~= "n" then
			if entry.id == iPlayerID and entry.research == sResearchName then
				returnVal = 1
				break
			end
		end
	end
	return returnVal
end


function Rule_DestroyStartShips()
	SobGroup_TakeDamage("StartShips", 1)
	Rule_Remove("Rule_DestroyStartShips")
end


function Rule_StartFadeout()
	Universe_Fade(1, 6)
	Rule_Remove("Rule_StartFadeout")
end


function Rule_EndGame()
	setGameOver()
end


function PlayerHasLost(iPlayerID)
	--RETURNS 0 OR 1 IF THE PLAYER HAS LOST ACCORDING TO THE WIN CONDITION
	local hasLost = 0
	
	if gWinCondition == CAPTURE_COMMAND_POSTS then
		if PlayerCommandPostCounts[iPlayerID] == 0 then hasLost = 1 end
	elseif gWinCondition == DESTROY_ALL_SHIPS then
		if PlayerCommandPostCounts[iPlayerID] == 0 then
			if SobGroup_Empty("Player_Ships" .. iPlayerID) == 1 then
				--see if any ships are in hyperspace
				--echo("PLAYER " .. iPlayerID .. " APPEARS TO BE DEAD")
				hasLost = 1
				local i = 0
				for i = 1,gShipTypes_count do
					if gShipTypes[i].canBeOwnedBy == gPlayerRaces[iPlayerID] or gShipTypes[i].canBeOwnedBy == 3 then
						--print("   CHECKING " .. gShipTypes[i].shipName)
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(iPlayerID, gShipTypes[i].shipName) > 0 then
							hasLost = 0
							--print("   FOUND SHIPS!")
							break
						end
					end
				end
				--print(" ")
			end
		end
	end
	
	return hasLost
end


function Rule_FormatGameTime()
	gGameTime = gGameTime + 1
end


function Rule_UpdateATI()
	--echo("Rule_UpdateATI IS RUNNING")
	local myRect = {}
	
	ATI_Clear()
	ATI_CreateParameters(1)
    
  --game time
  local timeToDisplay = ""
  if gGameTime < 3600 then
  	timeToDisplay = FormatTime(gGameTime)
  else
  	timeToDisplay = FormatLongTime(gGameTime)
  end
	--myRect = {0.008, 0.976, 0, 0}
	--ATI_AddString(0, "GAME TIME:")
	--ATI_Display2D("atiLabelBold", myRect, 0)
	--myRect = {0.085, 0.975, 0, 0}
	--ATI_AddString(0, timeToDisplay)
	--ATI_Display2D("atiValueBold", myRect, 0)
	
	--if UI_IsNamedElementVisible("New1", "sundamagetextred") == 0 then
		UI_SetElementVisible("New1", "sundamagetextred", 1)
	--else
		UI_SetTextLabelText("New1", "sundamagetextred", timeToDisplay)
	--end
	
	--resources left
	if gResourceCap ~= 0 then
		if gPayoutDisabled == 0 then
			myRect = {0.008, 0.957, 0, 0}
			ATI_AddString(0, "Resources Remaining:")
			ATI_Display2D("atiLabel", myRect, 0)
			ATI_AddString(0, gResourceCap-gRUsGivenOut)
			ATI_Display2D("atiValue", { myRect[1]+0.107, myRect[2], myRect[3], myRect[4] }, 0)
		end
	end
	
	--messages at bottom left
	local messageCount = getn(gMessages)
	if messageCount > 0 then
		myRect = {0.01, 0.170, 0, 0}
		local i = 0
		for i = messageCount,1,-1 do
			if gGameTime >= gMessages[i].time + 6 then
				tremove(gMessages, i) --delete message after a few seconds
			else
				myRect[2] = myRect[2] + 0.020
				ATI_AddString(0, ">")
				ATI_Display2D("atiMessagePointer", {myRect[1], myRect[2]-0.003, myRect[3], myRect[4]}, 0)
				
				if gMessages[i].messageType == TEXT_ONLY then
					ATI_AddString(0, gMessages[i].text)
					ATI_Display2D("atiLabelBold", {myRect[1]+0.010, myRect[2], myRect[3], myRect[4]}, 0)
				elseif gMessages[i].messageType == SOMEONE_DIED then
					ATI_AddString(0, "REST IN PEACE")
					ATI_Display2D("atiLabelBold", {myRect[1]+0.010, myRect[2], myRect[3], myRect[4]}, 0)
					ATI_AddWString(0, Player_GetPlayerName(gMessages[i].playerID))
					ATI_Display2D("atiLabelBold", {myRect[1]+0.105, myRect[2], myRect[3], myRect[4]}, 0)
				end
			end
		end
	end
	
end


function Rule_ShowEveryone()
	--REVEAL ALL SHIPS
	local playerID = 0
	for playerID = 0,5 do		--0,3
		if Player_IsAlive(playerID) == 1 then
			FOW_RevealGroup("Player_Ships" .. playerID, 1)
		end
	end
end


function Rule_HandleStrayShips()
	--STOP OR DESTROY SHIPS THAT LEAVE THE TERRITORIES
	local counter = 0
	repeat
		gPlayerToCheck = gPlayerToCheck + 1
		if gPlayerToCheck == 4 then gPlayerToCheck = 0 end
		counter = counter + 1
	until Player_IsAlive(gPlayerToCheck) == 1 or counter == 6
	
	if counter == 6 then return end
	--PrintMessage(gGameTime .. ": CHECKING STRAY SHIPS FOR PLAYER " .. gPlayerToCheck)
	
	SobGroup_Clear("ShipsInsideTerritoryVolume")
	SobGroup_Clear("ShipsInsideStopVolumes")
	SobGroup_Clear("ShipsToDestroy")
	SobGroup_Clear("TerritoryTempSobGroup1")
	SobGroup_Clear("TerritoryTempSobGroup2")
	SobGroup_Clear("TerritoryTempSobGroup3")
	
	local i = 0
	local territoryID = 0
	for i = 1,getn(gParentTerritoryIDs) do
		territoryID = gParentTerritoryIDs[i]
		--echo("CHECKING TERRITORY " .. territoryID .. " FOR PLAYER " .. gPlayerToCheck)
		Player_FillSobGroupInVolume("TerritoryTempSobGroup1", gPlayerToCheck, "TerritoryStopVolume" .. territoryID)
		if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
			SobGroup_SobGroupAdd("ShipsInsideStopVolumes", "TerritoryTempSobGroup1")
			if AddLocatorShip == 1 then
				SobGroup_SobGroupRemove("TerritoryTempSobGroup1", "LocatorShip")
			end
			Player_FillSobGroupInVolume("ShipsInsideTerritoryVolume", gPlayerToCheck, "TerritoryVolume" .. territoryID)
			SobGroup_FillSubstract("TerritoryTempSobGroup2", "TerritoryTempSobGroup1", "ShipsInsideTerritoryVolume")
			--TerritoryTempSobGroup2 now contains ships that are just outside the territory volume
			
			if SobGroup_Empty("TerritoryTempSobGroup2") == 0 then		--and CPU_Exist_Smart(SobGroup_OwnedBy("TerritoryTempSobGroup2")) == 0 
				--move ships back toward middle of territory
				if TerritoryStats[territoryID][BUILDTYPE] == EMPTY then
					SobGroup_Move(gPlayerToCheck, "TerritoryTempSobGroup2", "TerritoryVolume" .. territoryID)
				else
					SobGroup_MoveToSobGroup("TerritoryTempSobGroup2", "CommandPost" .. territoryID)
				end
				SobGroup_Clear("TerritoryTempSobGroup2")
			end
			
			SobGroup_Clear("ShipsInsideTerritoryVolume")
			SobGroup_Clear("TerritoryTempSobGroup1")
		end
	end
	
	--destroy ships that are too far outside territories
	SobGroup_FillSubstract("TerritoryTempSobGroup3", "Player_Ships" .. gPlayerToCheck, "supporter" .. gPlayerToCheck)
	SobGroup_FillSubstract("ShipsToDestroy", "TerritoryTempSobGroup3", "ShipsInsideStopVolumes")
	SobGroup_Clear("TerritoryTempSobGroup3")
	if SobGroup_Empty("ShipsToDestroy") == 0 then
		if AddLocatorShip == 1 then
			SobGroup_SobGroupRemove("ShipsToDestroy", "LocatorShip")
		end
		if CPU_Exist_Smart(SobGroup_OwnedBy("ShipsToDestroy")) == 0 then
			SobGroup_TakeDamage("ShipsToDestroy", 1)
		end
	end
	SobGroup_Clear("ShipsInsideStopVolumes")
end


function Rule_WatchForHighResources()
	--IF PLAYERS GET MORE THAN 2 MILLION RUs, THIS SETS THEM BACK TO 2 MILLION SO THEY DON'T GET GARBAGE NUMBERS
	local playerID = 0
    for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 then
			if Player_GetRU(playerID) > 2000000 then
				Player_SetRU(playerID, 2000000)
			end
		end
	end
end


function IsLocationInsideThisTerritory(tLocation, iTerritoryID)
	--RETURNS 0 OR 1 IF THE COORDS ARE IN THE SPECIFIED TERRITORY
	if iTerritoryID > BoardStats.numTerritories then
		echo("WARNING: IsLocationInsideThisTerritory() IS BEING CALLED FOR A TERRITORY THAT DOESN'T EXIST (ID: " .. iTerritoryID .. ")")
		return 0
	end
	
	if TerritoryStats[iTerritoryID][PARENTID] ~= PARENT then
		echo("WARNING: IsLocationInsideThisTerritory() IS BEING CALLED FOR A NON-PARENT TERRITORY (ID: " .. iTerritoryID .. ")")
	end
	
	local returnVal = 0
	if GetDistanceBetweenTwoPoints(tLocation, TerritoryStats[iTerritoryID][LOCATION]) <= (TerritoryStats[iTerritoryID][SIZE] + gTerritoryBufferSize) then
		returnVal = 1
	end
	
	return returnVal
end


function WhatTerritoryIsThisLocationIn(tLocation)
	--RETURNS THE ID OF THE PARENT TERRITORY THAT THE COORDS ARE IN (or 0 if none)
	--print(" ")
	--PrintMessage(" @@@@@@@@@ WhatTerritoryIsThisLocationIn() was called")
	local i = 0
	local territoryID = 0
	local returnVal = 0
	for i = 1,getn(gParentTerritoryIDs) do
		territoryID = gParentTerritoryIDs[i]
		if GetDistanceBetweenTwoPoints(tLocation, TerritoryStats[territoryID][LOCATION]) <= (TerritoryStats[territoryID][SIZE] + gTerritoryBufferSize) then
			returnVal = territoryID
			break
		end
	end
	return returnVal
	--print(" ")
end


function GetParentID(iTerritoryID)
	--RETURNS THE PARENT ID OF THE TERRITORY (MAY BE ITSELF)
	if gTerritoryStatsIsSetUp == 0 then
		if Territories[iTerritoryID][PARENTID] == PARENT then
			return iTerritoryID
		else
			return Territories[iTerritoryID][PARENTID]
		end
	else
		if TerritoryStats[iTerritoryID][PARENTID] == PARENT then
			return iTerritoryID
		else
			return TerritoryStats[iTerritoryID][PARENTID]
		end
	end
end


















--*********** COMMAND POST STUFF ***********
gPlayerPayouts = {}
gCommandPostsToWatch = {} --stores command post ID's that are being captured


function Rule_GiveCommandPostRUs()
	--GIVE RUs TO PLAYERS (runs every 3 seconds)
	local playerID = 0
	local amount = 0
	for playerID,amount in gPlayerPayouts do
		if Player_IsAlive(playerID) == 1 and amount > 0 then
			--PrintMessage("GIVING " .. amount .. " RU TO PLAYER " .. playerID)
			FusionAddRU(playerID, amount)		--Player_SetRU(playerID, Player_GetRU(playerID)+amount)
			if gResourceCap ~= 0 then
				gRUsGivenOut = gRUsGivenOut + amount
			end
		end
	end
	
	--payout cap reached?
	if gResourceCap ~= 0 then
		if gRUsGivenOut >= gResourceCap then
			PrintMessage("RESOURCE PAYOUTS HAVE BEEN DISABLED")
			gPayoutDisabled = 1
			gRUsGivenOut = gResourceCap
			--change all payout pings
			local i = 0
			local terrID = 0
			for i = 1,getn(gCapturableTerritoryIDs) do
				terrID = gCapturableTerritoryIDs[i]
				Ping_Remove(TerritoryStats[terrID][PINGID])
				TerritoryStats[terrID][PINGID] = AddCommandPostPing(terrID)
			end
			Rule_Remove("Rule_GiveCommandPostRUs")
			Rule_Remove("Rule_ResetPlayerPayouts")
		end
	end
end


function Rule_WatchForCaptures()
	--LOOK FOR COMMAND POSTS THAT ARE BEING CAPTURED
	--PrintMessage("Rule_WatchForCaptures IS RUNNING")
	SobGroup_Clear("TerritoryTempSobGroup1")
	local i = 0
	local terrID = 0
	for i = 1,getn(gCapturableTerritoryIDs) do
		terrID = gCapturableTerritoryIDs[i]
		SobGroup_GetSobGroupCapturingGroup("CommandPost" .. terrID, "TerritoryTempSobGroup1")
		if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
			if CommandPostIsBeingWatched(terrID) == 0 then
				tinsert(gCommandPostsToWatch, terrID)
				--PrintMessage("ADDING COMMAND POST " .. terrID .. " TO WATCH LIST")
			end
			SobGroup_Clear("TerritoryTempSobGroup1")
		end
	end
	
	--see if any captures have halted
	local idx = 0
	local commandpost = 0
	for idx = getn(gCommandPostsToWatch),1,-1 do
		commandpost = gCommandPostsToWatch[idx]
		if SobGroup_OwnedBy("CommandPost" .. commandpost) == TerritoryStats[commandpost][OWNER] then
			SobGroup_GetSobGroupCapturingGroup("CommandPost" .. commandpost, "TerritoryTempSobGroup1")
			if SobGroup_Empty("TerritoryTempSobGroup1") == 1 then
				tremove(gCommandPostsToWatch, idx)
				--PrintMessage("REMOVING COMMAND POST " .. commandpost .. " FROM WATCH LIST BECAUSE IT ISN'T BEING CAPTURED ANYMORE")
			end
			SobGroup_Clear("TerritoryTempSobGroup1")
		end
	end
	
	--add close watch rule if any command posts are being captured
	if getn(gCommandPostsToWatch) > 0 then
		if Rule_Exists("Rule_WatchCloselyForCaptures") == 0 then
			--PrintMessage("ADDING CLOSE WATCH RULE")
			Rule_AddInterval("Rule_WatchCloselyForCaptures", 2.7)
		end
	end
	
	--PrintMessage(" ")
end


function Rule_WatchCloselyForCaptures()
	--CHECK THE COMMAND POSTS THAT ARE BEING CAPTURED TO SEE IF ANY HAVE SWITCHED OWNERS YET
	--PrintMessage("Rule_WatchCloselyForCaptures IS RUNNING")
	SobGroup_Clear("TerritoryTempSobGroup1")
	local idx = 0
	local commandpost = 0
	local currentOwner = 0
	for idx = getn(gCommandPostsToWatch),1,-1 do
		commandpost = gCommandPostsToWatch[idx]
		--PrintMessage("CHECKING COMMAND POST " .. commandpost)
		currentOwner = SobGroup_OwnedBy("CommandPost" .. commandpost)
		if currentOwner ~= TerritoryStats[commandpost][OWNER] and currentOwner ~= 5 then
			--a command post has been captured by a player
			CommandPost_SwitchOwner(commandpost, currentOwner)
			--print("starting switching Command Post from Player Index: "..commandpost.." to Player Index: "..currentOwner..", game year: "..year)
			tremove(gCommandPostsToWatch, idx)
		end
	end
	
	if getn(gCommandPostsToWatch) == 0 then
		Rule_Remove("Rule_WatchCloselyForCaptures")
		--PrintMessage("REMOVING CLOSE WATCH RULE")
	end
	
	--PrintMessage(" ")
end


function CommandPost_SwitchOwner(iTerritoryID, iNewOwner)
	--PrintMessage("COMMAND POST " .. iTerritoryID .. " WAS JUST HANDED OVER TO PLAYER " .. iNewOwner)
	local prevOwner = TerritoryStats[iTerritoryID][OWNER]
	
	--adjust payouts
	local amount = TerritoryStats[iTerritoryID][PAYOUT_RATE] / 20 --divide by 20 because RUs are given out every 3 seconds
	if prevOwner ~= ENEMY_CPU then
		--subtract this amount from the previous owner's payout
		gPlayerPayouts[prevOwner] = round(gPlayerPayouts[prevOwner] - amount)
		if gPlayerPayouts[prevOwner] < 0 then gPlayerPayouts[prevOwner] = 0 end
	end
	--add the amount to the new owner's payout
	if gPlayerPayouts[iNewOwner] ~= nil then
		gPlayerPayouts[iNewOwner] = round(gPlayerPayouts[iNewOwner] + amount)
	end
	
	if TerritoryStats[iTerritoryID][BUILDTYPE] ~= RESOURCE_ONLY then
		--swap out the command post if the new owner is a different race
		local race_prevOwner = 1
		if SobGroup_AreAnyOfTheseTypes("CommandPost" .. iTerritoryID, "vgr_command_post1, vgr_command_post2, vgr_command_post3, vgr_command_post4") == 1 then
			race_prevOwner = 2
		elseif SobGroup_AreAnyOfTheseTypes("CommandPost" .. iTerritoryID, "kad_command_post1, kad_command_post2, kad_command_post3, kad_command_post4") == 1 then
			race_prevOwner = 3
		elseif SobGroup_AreAnyOfTheseTypes("CommandPost" .. iTerritoryID, "rad_command_post1, rad_command_post2, rad_command_post3, rad_command_post4") == 1 then
			race_prevOwner = 4
		elseif SobGroup_AreAnyOfTheseTypes("CommandPost" .. iTerritoryID, "kpr_command_post1, kpr_command_post2, kpr_command_post3, kpr_command_post4") == 1 then
			race_prevOwner = 6
		end
		if Player_GetRace(iNewOwner) ~= race_prevOwner then		--Player_GetRace(prevOwner)
			Ping_Remove(TerritoryStats[iTerritoryID][PINGID])
			SobGroup_SobGroupAdd("CommandPostsToDestroy", "CommandPost" .. iTerritoryID)
			SobGroup_Despawn("CommandPost" .. iTerritoryID)
			SobGroup_Clear("CommandPost" .. iTerritoryID)
			print("switch Command Post type "..TerritoryStats[iTerritoryID][BUILDTYPE].." from Player Index: "..prevOwner.." to Player Index: "..iNewOwner..", game year: "..year)
			SobGroup_SpawnNewShipInSobGroup(iNewOwner, gCommandPostShipNames[gPlayerRaces[iNewOwner]] .. TerritoryStats[iTerritoryID][BUILDTYPE], "sqd", "CommandPost" .. iTerritoryID, "TerritoryVolume" .. iTerritoryID)
			SobGroup_AbilityActivate("CommandPost" .. iTerritoryID, AB_Scuttle, 0)
			SobGroup_SetInvulnerability("CommandPost" .. iTerritoryID, 1)
			SobGroup_SetTactics("CommandPost" .. iTerritoryID, PassiveTactics)
			FOW_RevealGroup("CommandPost" .. iTerritoryID, 1)
			if gGameRubric == GR_SKIRMISH and TerritoryStats[iTerritoryID][PARENTID] == PARENT then
				SobGroup_SobGroupAdd("Territory" .. iTerritoryID .. "PostsAndGates", "CommandPost" .. iTerritoryID)
			end
			
			if Rule_Exists("Rule_DestroyOldCommandPosts") == 0 then
				Rule_AddInterval("Rule_DestroyOldCommandPosts", 0.5)
			end
			TerritoryStats[iTerritoryID][PINGID] = AddCommandPostPing(iTerritoryID)
		end
		
		--update command post count for these players
		if prevOwner < 4 then
			PlayerCommandPostCounts[prevOwner] = PlayerCommandPostCounts[prevOwner] - 1
		end
		PlayerCommandPostCounts[iNewOwner] = PlayerCommandPostCounts[iNewOwner] + 1
	end
	
	--also hand over the jump gates associated with this command post (if that option is enabled)
	if gJumpGateOwnership == MUST_OWN_TERRITORY then
		SobGroup_SwitchOwner("Territory" .. iTerritoryID .. "JumpGates", iNewOwner)
	end
	
	--handle CPU players
	if gGameRubric == GR_SKIRMISH then
		local parentID = GetParentID(iTerritoryID)
		
		if prevOwner < 4 then
			if CPU_Exist_Smart(prevOwner) == 1 then
				CpuPlayerLostTerritory(prevOwner, iTerritoryID)
			end
			TerritoryStats[parentID][PLAYERSTATS][prevOwner].postsOwned = TerritoryStats[parentID][PLAYERSTATS][prevOwner].postsOwned - 1
		end
		
		if CPU_Exist_Smart(iNewOwner) == 1 then
			CpuPlayerGainedTerritory(iNewOwner, iTerritoryID)
		end
		
		--If capture speed is too fast, problem may occur here? I don't know, just guess -_-!!
		TerritoryStats[parentID][PLAYERSTATS][iNewOwner].postsOwned = TerritoryStats[parentID][PLAYERSTATS][iNewOwner].postsOwned + 1
		--echo("TerritoryStats[parentID][PLAYERSTATS][iNewOwner].postsOwned = "..TerritoryStats[parentID][PLAYERSTATS][iNewOwner].postsOwned)
		
		--decrement unclaimed count
		if prevOwner == ENEMY_CPU then
			TerritoryStats[parentID][CHILDSTATS][unclaimedCount] = TerritoryStats[parentID][CHILDSTATS][unclaimedCount] - 1
		end
	end
	
	TerritoryStats[iTerritoryID][OWNER] = iNewOwner
	TerritoryStats[iTerritoryID][RACE] = gPlayerRaces[iNewOwner]
end


function Rule_DestroyOldCommandPosts()
	--DESTROY DESPAWNED COMMAND POSTS
	--PrintMessage("DESTROYING " .. SobGroup_Count("CommandPostsToDestroy") .. " SHIPS")
	SobGroup_SetInvulnerability("CommandPostsToDestroy", 0)
	SobGroup_TakeDamage("CommandPostsToDestroy", 1)
	SobGroup_Clear("CommandPostsToDestroy")
	Rule_Remove("Rule_DestroyOldCommandPosts")
end


function CommandPostIsBeingWatched(iTerritoryID)
	--RETURNS 0 OR 1 IF THE ID ALREADY EXISTS IN gCommandPostsToWatch
	local exists = 0
	local idx = 0
	for idx = 1,getn(gCommandPostsToWatch) do
		if gCommandPostsToWatch[idx] == iTerritoryID then
			exists = 1
			break
		end
	end
	return exists
end


function Rule_ResetPlayerPayouts()
	--RESET THE VALUES OF PLAYER PAYOUTS (in case the running tally becomes inaccurate)
	--echo("Rule_ResetPlayerPayouts IS RUNNING")
	local playerID = 0
    for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 then
			--PrintMessage("PLAYER " .. playerID .. " OLD PAYOUT: " .. gPlayerPayouts[playerID])
			gPlayerPayouts[playerID] = 0
		end
	end
	
	local i = 0
	local terrID = 0
	for i = 1,getn(gCapturableTerritoryIDs) do
		terrID = gCapturableTerritoryIDs[i]
		if TerritoryStats[terrID][OWNER] ~= ENEMY_CPU then
			gPlayerPayouts[TerritoryStats[terrID][OWNER]] = gPlayerPayouts[TerritoryStats[terrID][OWNER]] + (TerritoryStats[terrID][PAYOUT_RATE] / 20)
		end
	end
	
    for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 then
			gPlayerPayouts[playerID] = round(gPlayerPayouts[playerID])
			--PrintMessage("PLAYER " .. playerID .. " NEW PAYOUT: " .. gPlayerPayouts[playerID])
		end
	end
end












--*********** COMMON FUNCTIONS ***********
function echo(sText)
	--print(format("%.1f", Universe_GameTime()) .. " --> " .. sText)
	print(FormatTime(gGameTime) .. " (" .. format("%.1f", Universe_GameTime()) .. ") --> " .. sText)
end


function FormatTime(numSeconds)
	--GIVE IT THE NUMBER OF SECONDS AND IT RETURNS A FORMATTED TIME STRING: "MM:SS"
	local numMinutes = floor(numSeconds/60)
	numSeconds = numSeconds - (numMinutes*60)
	return format(numMinutes .. ":%02d", numSeconds)
end


function FormatLongTime(numSeconds)
	--GIVE IT THE NUMBER OF SECONDS AND IT RETURNS A FORMATTED TIME STRING: "HH:MM:SS"
	local numHours = floor(numSeconds/3600)
	numSeconds = numSeconds - (numHours*3600)
	local numMinutes = floor(numSeconds/60)
	numSeconds = numSeconds - (numMinutes*60)
	return format(numHours .. ":%02d:%02d", numMinutes, numSeconds)
end

function SobGroup_SobGroupRemove(sSobGroup, sSobGroupToRemove)
	--THIS SUBTRACTS THE SECOND GROUP FROM THE FIRST
	SobGroup_Clear("TempShips")
	SobGroup_FillSubstract("TempShips", sSobGroup, sSobGroupToRemove)
	SobGroup_Clear(sSobGroup)
	SobGroup_SobGroupAdd(sSobGroup, "TempShips")
	SobGroup_Clear("TempShips")
end












--*********** MESSAGE SYSTEM ***********
gMessages = {} --table to store messages that get displayed on screen

--message types:
TEXT_ONLY = nil
SOMEONE_DIED = 1


function PrintMessage(sMessage, iMessageType, iPlayerID)
	local tMessageToAdd = 
	{
		text = sMessage,
		time = gGameTime,
		messageType = iMessageType, --this will be nil if only the message was sent
		playerID = iPlayerID,
	}
	tinsert(gMessages, tMessageToAdd)
	if sMessage ~= "" then echo(sMessage) end
	
	Rule_UpdateATI()
end











--*********** DYNAMIC MUSIC ***********
gDynamicMusicSetting = 0
AMBIENT = 0
BATTLE = 1
gCurrentMusic = AMBIENT
gMusicRuleInterval = 3.1

gSongsToPlay = { 1,2,3,4,2,1,1,3,5,2,1,3,2,1,5,3,2,4,1,3,3 } --pseudo-random sequence of songs to play
gSongID = 0

tAmbientSongs =
{
	"ambient/amb_01",
	"ambient/amb_03",
	"ambient/amb_05",
	"ambient/amb_07",
	"ambient/amb_08",
}

tBattleSongs =
{
	"battle/battle_01",
	"battle/battle_04",
	"battle/battle_06",
	"battle/battle_sajuuk",
	"battle/battle_01",
}


function PlayRandomSong(iBattleOrAmbient)
	gSongID = gSongID + 1
	if gSongID == 22 then gSongID = 1 end
	local songToPlay = ""
	if iBattleOrAmbient == AMBIENT then
		songToPlay = tAmbientSongs[gSongsToPlay[gSongID]]
	elseif iBattleOrAmbient == BATTLE then
		songToPlay = tBattleSongs[gSongsToPlay[gSongID]]
	end
	--echo("PLAYING SONG: " .. songToPlay)
	Sound_MusicPlay("Data:sound/music/" .. songToPlay)
	gCurrentMusic = iBattleOrAmbient
end


function Rule_DynamicMusic()
	--SEE IF IT'S TIME TO CHANGE THE MUSIC
	--echo("Rule_DynamicMusic IS RUNNING (CURRENT MUSIC: " .. gCurrentMusic .. ") (0=AMB,1=BAT)")
	local playerID = 0
	if gCurrentMusic == AMBIENT then
		--switch to battle music if anyone is fighting
		--also add SobGroup_IsDoingAbility("Player_Ships" .. playerID, AB_Capture) ?
		for playerID = 0,3 do
			if Player_IsAlive(playerID) == 1 then
				if SobGroup_UnderAttack("Player_Ships" .. playerID) == 1 then
					--echo("CHANGING MUSIC TO BATTLE")
					PlayRandomSong(BATTLE)
					break
				end
			end
		end
	elseif gCurrentMusic == BATTLE then
		--switch to ambient music if nobody is fighting
		local anyoneFighting = 0
		for playerID = 0,3 do
			if Player_IsAlive(playerID) == 1 then
				if SobGroup_UnderAttack("Player_Ships" .. playerID) == 1 then
					anyoneFighting = 1
					break
				end
			end
		end
		if anyoneFighting == 0 then
			--echo("CHANGING MUSIC TO AMBIENT")
			PlayRandomSong(AMBIENT)
		end
	end
end


function DisableDynamicMusic()
	--TURN OFF DYNAMIC MUSIC AND PLAY AN AMBIENT SONG
	Rule_Remove("Rule_DynamicMusic")
	if gCurrentMusic == BATTLE then
		PlayRandomSong(AMBIENT)
	end
end







--*********** LOCATOR SHIP ***********
--ADD SCOUTS TO THE MAP THAT PRINT OUT MAP LOCATIONS WHEN YOU PRESS F9

AddLocatorShip = 0

function AddLocatorShipFunction()
	--locate the human
	local i = 0
	local humanPlayerID = 0
	for i = 0,3 do
		if Player_IsAlive(i) == 1 and CPU_Exist_Smart(i) == 0 then
			humanPlayerID = i
			break
		end
	end
	
	local tCoord = TerritoryStats[PlayerStartTerritories[humanPlayerID]][LOCATION]
	SobGroup_Create("LocatorShip")
	Volume_AddSphere("LocatorSpawnVolume", { tCoord[1], tCoord[2]+800, tCoord[3] }, 100)
	SobGroup_SpawnNewShipInSobGroup(humanPlayerID, "Hgn_Scout", "locator", "LocatorShip", "LocatorSpawnVolume")
	Volume_Delete("LocatorSpawnVolume")
	
	--SobGroup_SetMaxSpeedMultiplier("LocatorShip", 5)
	SobGroup_AbilityActivate("LocatorShip", AB_Dock, 0)
	SobGroup_AbilityActivate("LocatorShip", AB_Repair, 0)
	SobGroup_AbilityActivate("LocatorShip", AB_Retire, 0)
	SobGroup_AbilityActivate("LocatorShip", AB_Salvage, 0)
	SobGroup_AbilityActivate("LocatorShip", AB_Scuttle, 0)
	SobGroup_SetInvulnerability("LocatorShip", 1)
	
	local pingID = Ping_AddSobGroup("Locator Ship ", "anomaly", "LocatorShip")
	Ping_LabelVisible(pingID, 1)
	
	UI_BindKeyEvent(F9KEY, "PrintLocatorPosition")
	PrintMessage("LOCATOR SHIP ADDED. PRESS F9 TO PRINT COORDINATES.")
end


function PrintLocatorPosition()
	local tPosition = SobGroup_GetPosition("LocatorShip")
	PrintMessage("POSITION: " .. round(tPosition[1]) .. ", " .. round(tPosition[2]) .. ", " .. round(tPosition[3]))
end















--*********** STUFF TO AUDIT THE MAP DESIGN ***********

function PerformAudit()
	--AUDIT THE MAP DESIGN AND LOOK FOR PROBLEMS, PRINT MAP INFO TO LOG FILE
	
	
	--STILL TO DO:
	--print out the number of command posts, how many of each type of command post there are
	--look for orphaned territories due to missing connections
	--watch for double connections (entries in connections table that are accidentally in there twice)
	
	
	
	--print("******************** STARTING MAP AUDIT ********************")
	
	
	print(" ")
	print("TOTAL NUMBER OF TERRITORIES: " .. BoardStats.numTerritories)
	
	print(" ")
	print("NUMBER OF PARENT TERRITORIES: " .. BoardStats.numParents)
	print("NUMBER OF CHILD TERRITORIES: " .. BoardStats.numChildren)
	print("NUMBER OF CAPTURABLE TERRITORIES: " .. BoardStats.numCapturable)
	print("NUMBER OF COMMAND POSTS: " .. BoardStats.numCommandPost)
	print("NUMBER OF RESOURCE GENERATORS: " .. BoardStats.numRuGenerator)
	print(" ")
	
	--total payout
	print("TOTAL MAP PAYOUT (multiplier = " .. gPayoutMultiplier .. "): " .. BoardStats.totalMapPayout .. " RU per minute")
	print(" ")
	
	--contents of ID tables
	print("Parent Territory IDs: 		" .. PrintTableAsString(gParentTerritoryIDs))
	print("Child Territory IDs: 		" .. PrintTableAsString(gChildTerritoryIDs))
	print("Capturable Territory IDs:	" .. PrintTableAsString(gCapturableTerritoryIDs))
	print("Resource Generator IDs: 	" .. PrintTableAsString(gResourceGeneratorIDs))
	print(" ")
	
	
	local territoryID = 0
	local parentID = 0
	
	local thisDistance = 0
	local closestDistance = 99999999
	local closestText = ""
	local territoryID2 = 0
	
	
	for territoryID = 1,BoardStats.numTerritories do
		
		
		parentID = TerritoryStats[territoryID][PARENTID]
		if parentID == PARENT then
			--look for the parent territories that are closest together
			for territoryID2 = 1,BoardStats.numTerritories do
				if territoryID ~= territoryID2 then
					if TerritoryStats[territoryID2][PARENTID] == PARENT then
						thisDistance = GetDistanceBetweenTwoPoints(TerritoryStats[territoryID][LOCATION], TerritoryStats[territoryID2][LOCATION])
						thisDistance = round(thisDistance - TerritoryStats[territoryID][SIZE] - TerritoryStats[territoryID2][SIZE])
						if thisDistance < closestDistance then
							closestText = territoryID .. " AND " .. territoryID2
							closestDistance = thisDistance
						end
					end
				end
			end
		else
			--look for child territories that are not in the parent territory
			if GetDistanceBetweenTwoPoints(TerritoryStats[territoryID][LOCATION], TerritoryStats[parentID][LOCATION]) > TerritoryStats[parentID][SIZE] then
				print("WARNING: CHILD TERRITORY " .. territoryID .. " IS NOT INSIDE TERRITORY " .. parentID)
			end
		end
		
		
		
	end
	
	
	--closest parent territories
	print(" ")
	if closestText == "" then
		print("THE CLOSEST TERRITORIES COULD NOT BE DETERMINED")
	else
		print("THE CLOSEST TERRITORIES ARE " .. closestText .. " (DISTANCE BETWEEN OUTER EDGES: " .. closestDistance .. ")")
		if closestDistance < 7000 then
			print("NOTE: THE MINIMUM DISTANCE SHOULD BE 7000")
		end
	end
	
	
	
	
	--warn if start territories are not build-capable
	local playerID = 0
	local buildType = 0
	for playerID = 0,3 do
		buildType = TerritoryStats[PlayerStartTerritories[playerID]][BUILDTYPE]
		if buildType ~= FIGHTER and buildType ~= CORVETTE and buildType ~= FRIGATE and buildType ~= CAPITAL then
			print("WARNING: THE START LOCATION FOR PLAYER " .. playerID .. " IS NOT BUILD-CAPABLE")
		end
	end
	
	
	--show more detailed info
	if AuditMap == 2 then
		
		--detailed territory stats
		print(" ")
		print(" ")
		print("   ------------  DETAILED TERRITORY STATS  ------------")
		print(" ")
		for territoryID = 1,BoardStats.numTerritories do
			WriteTerritoryStats(territoryID)
		end
		
		
		--paths
		print(" ")
		print(" ")
		print("   ------------  PATHS  ------------")
		print(" ")
		for territoryID = 1,BoardStats.numTerritories do
			if TerritoryStats[territoryID][PARENTID] == PARENT then
				WritePaths(territoryID) --this function is in the military file
			end
		end
		
		
	end
	
	
	print(" ")
	print("|__________________ ENDING MAP AUDIT __________________|")
	print(" ")
	print(" ")
	
end


function WriteTerritoryStats(iTerritoryID)
	local str = ""
	local i = 0
	print(" ")
	print(iTerritoryID .. ". STATS FOR TERRITORY " .. iTerritoryID .. ": ")
	
	if iTerritoryID > BoardStats.numTerritories then
		print("  **THIS TERRITORY ID DOES NOT EXIST ON THIS LEVEL")
		print(" ")
		return
	end
	
	print("     PARENTID: " .. TerritoryStats[iTerritoryID][PARENTID])
	
	str = "     LOCATION: { " .. PrintTableAsString(TerritoryStats[iTerritoryID][LOCATION]) .. " }"
	print(str)
	
	print("     BUILDTYPE: " .. TerritoryStats[iTerritoryID][BUILDTYPE])
	print("     SIZE: " .. TerritoryStats[iTerritoryID][SIZE])
	print("     OWNER: " .. TerritoryStats[iTerritoryID][OWNER])
	print("     RACE: " .. TerritoryStats[iTerritoryID][RACE])
	print("     PAYOUT_RATE: " .. TerritoryStats[iTerritoryID][PAYOUT_RATE])
	
	if TerritoryStats[iTerritoryID][PARENTID] == PARENT then
		print("     ---------- CHILD STATS:")
		local childStats = TerritoryStats[iTerritoryID][CHILDSTATS]
		print("        neighbourCount: " .. childStats[neighbourCount])
		print("        numChildren: " .. childStats[numChildren])
		print("        numCommandPosts: " .. childStats[numCommandPosts])
		print("        numRUGenerators: " .. childStats[numRUGenerators])
		print("        totalPostCount: " .. childStats[totalPostCount])
		print("        unclaimedCount: " .. childStats[unclaimedCount])
		print("        totalPayoutFromAllPosts: " .. childStats[totalPayoutFromAllPosts])
		
		str = "        commandPostIDs: { " .. PrintTableAsString(childStats[commandPostIDs]) .. " }"
		print(str)
		
		str = "        ruGeneratorIDs: { " .. PrintTableAsString(childStats[ruGeneratorIDs]) .. " }"
		print(str)
	end
	
	print(" ")
end


function PrintTableAsString(tTable)
	local idx = 0
	local str = ""
	local count = getn(tTable)
	if count == 0 then
		str = "empty"
	else
		for idx = 1,count do
			str = str .. tTable[idx]
			if idx < count then
				str = str .. ", "
			end
		end
	end
	return str
end

function MainRuleTerritoriesOnly()
	--CHECK FOR DEAD PLAYERS, END GAME IF OVER
	local playerID = 0
	local alivePlayerCount = 0
	local tAlivePlayers = {}
    
  --kill any dead players
  for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 then
			if PlayerHasLost(playerID) == 1 then
				
				if gGameRubric == GR_SKIRMISH and CPU_Exist_Smart(playerID) == 0 and winCondition == "CaptureAllPost" then		--and gWinCondition == CAPTURE_COMMAND_POSTS
					PrintMessage("ALL YOUR BASE ARE BELONG TO US!")
				end
				
				PrintMessage("", SOMEONE_DIED, playerID)
				gPlayerCount = gPlayerCount - 1
				
				--change timing of stray ships rule
				if gPlayerCount > 0 then
					--Rule_Remove("Rule_HandleStrayShips")
					--Rule_AddInterval("Rule_HandleStrayShips", 4/gPlayerCount)
				end
				
				--swap owner of resource generators this player owns
				if winCondition == "CaptureAllPost" then		--gWinCondition == CAPTURE_COMMAND_POSTS
					local idx = 0
					for idx = 1,getn(gResourceGeneratorIDs) do
						if SobGroup_OwnedBy("CommandPost" .. gResourceGeneratorIDs[idx]) == playerID then
							SobGroup_SwitchOwner("CommandPost" .. gResourceGeneratorIDs[idx], ENEMY_CPU)
						end
					end
				end
				
				--switch ownership of jump gates he owns
				if gJumpGateOwnership ~= ALWAYS_NEUTRAL then
					SobGroup_Clear("TerritoryTempSobGroup1")
					SobGroup_FillCompare("TerritoryTempSobGroup1", "Player_Ships" .. playerID, "AllJumpGates")
					if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
						SobGroup_SwitchOwner("TerritoryTempSobGroup1", ENEMY_CPU)
						SobGroup_Clear("TerritoryTempSobGroup1")
					end
				end
				
				Player_Kill(playerID)
			else
				alivePlayerCount = alivePlayerCount + 1
				tAlivePlayers[alivePlayerCount] = playerID
			end
		end
  end
    
	--if one player is left alive, the game is over
	if gChallengeMode == 0 then
		if alivePlayerCount <= 1 then
			gGameOver = 1
			echo("GAME OVER: ONE PLAYER WON (OR NOBODY DID)")
		end
	else
		if Player_IsAlive(5) == 1 then
			if alivePlayerCount == 0 then
				gGameOver = 1
				echo("GAME OVER: GOVERNMENT WON")
			end
		elseif alivePlayerCount <= 1 then
			gGameOver = 1
			echo("GAME OVER: ONE PLAYER WON (AND GOVERNMENT HAS BEEN DEFEATED)")
		end
	end
	
	--if all remaining players are on the same team, the game is over
	if gGameOver == 0 then
		local allOnSameTeam = 1
		local i = 0
		local j = 0
		for i = 1,alivePlayerCount do
			for j = 1,alivePlayerCount do
				if i ~= j then
					if AreAllied(tAlivePlayers[i], tAlivePlayers[j]) == 0 then
						allOnSameTeam = 0
						break
					end
				end
			end
			if allOnSameTeam == 0 then break end
		end

		if allOnSameTeam == 1 then
			if gChallengeMode == 0 then
				gGameOver = 1
				echo("GAME OVER: TEAM VICTORY")
			elseif Player_IsAlive(5) == 0 then
				gGameOver = 1
				echo("GAME OVER: OCCUPY HOMEWORLD")
			end
		end
	end
	
	-- if the game is over, end the game
    if gGameOver == 1 then
        PrintMessage("GAME OVER!")
        --DisableDynamicMusic()
        if winCondition ~= "DestroyAll" then
	        Rule_AddInterval("Rule_StartFadeout", 2)
	        Rule_AddInterval("Rule_EndGame", 6)
	        Rule_Remove("MainRuleTerritoriesOnly")
	      end
    end
end



function Territory_CheckProductionDeadRule()
  local playerCount = Universe_PlayerCount();
  local playerIndex = 0; 
  local playerIndexList = 0
  local productiondead = random_pseudo(1,10);
  while (playerIndex < playerCount) do
    playerIndexList = playerIndex + 1
    if (Player_IsAlive(playerIndex) == 1) then
    	local num_post = SobGroup_Count("hgn_command_post1"..playerIndex) +
    	SobGroup_Count("hgn_command_post2"..playerIndex) +
    	SobGroup_Count("hgn_command_post3"..playerIndex) +
    	SobGroup_Count("hgn_command_post4"..playerIndex) +
    	SobGroup_Count("vgr_command_post1"..playerIndex) +
    	SobGroup_Count("vgr_command_post2"..playerIndex) +
    	SobGroup_Count("vgr_command_post3"..playerIndex) +
    	SobGroup_Count("vgr_command_post4"..playerIndex) +
    	SobGroup_Count("kad_command_post1"..playerIndex) +
    	SobGroup_Count("kad_command_post2"..playerIndex) +
    	SobGroup_Count("kad_command_post3"..playerIndex) +
    	SobGroup_Count("kad_command_post4"..playerIndex) +
    	SobGroup_Count("rad_command_post1"..playerIndex) +
    	SobGroup_Count("rad_command_post2"..playerIndex) +
    	SobGroup_Count("rad_command_post3"..playerIndex) +
    	SobGroup_Count("rad_command_post4"..playerIndex) +
    	SobGroup_Count("kpr_command_post1"..playerIndex) +
    	SobGroup_Count("kpr_command_post2"..playerIndex) +
    	SobGroup_Count("kpr_command_post3"..playerIndex) +
    	SobGroup_Count("kpr_command_post4"..playerIndex)
    	if num_post == 0 and playerIndex ~= 4 then 
	     SobGroup_TakeDamage("supporter"..playerIndex, 1)
	    end
	    if num_post == 0 and playerIndex ~= 4 then
	    	Main_PlayerObituary(playerIndex)
	      UI_SetScreenEnabled("death", 1)		
				UI_SetScreenVisible("death", 1)	
				UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Conquer Territories"..Time_PrintYear());
	      if productiondead == 1 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." has lost all territories");	
		    elseif productiondead == 2 then
		      UI_SetTextLabelText("death", "lblDescription1", "No home available for "..GetPlayerNameWithColour(playerIndex).." anymore");	
		    elseif productiondead == 3 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." certainly needs some lands");	
			  elseif productiondead == 4 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." hasn't figured out how to invest");	
			  elseif productiondead == 5 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." was exploited by the landlord");	
			  elseif productiondead == 6 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." hasn't paid off the loan");	
			  elseif productiondead == 7 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).."'s immovable property just moved");	
			  elseif productiondead == 8 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." can't afford room charge anymore");	
			  elseif productiondead == 9 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." is in the middle of nowhere");
			  elseif productiondead == 10 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).."'s house is on sale");
		    end
		    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
				--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
				Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
				Player_Kill(playerIndex)		 	
	    end
	  end  
	  playerIndex = playerIndex+1
  end 
end

function Territory_CheckStore100000RUsDeadRule()
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;		
	while (playerIndex < playerCount) do
		if (Player_IsAlive(playerIndex) == 1) then
		  if (Player_NumberOfAwakeShips(playerIndex)>1) then		--Player_HasShipWithBuildQueue(playerIndex)==1
				if Player_GetRU(playerIndex) >= 100000 then				
				  Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100") 
				  --Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")				
					for i = 0,5,1 do
					  if Player_IsAlive(i) == 1 then
						  if i ~= playerIndex then
						    Player_Kill(i)	
						  end  
						end  
					end 						 	
				end	
			else
				Player_Kill(playerIndex)				
			end	
		end	
		playerIndex = playerIndex+1
	end	
	
---ati display	 
  ATI_Clear()  
  if UI_ScreenIsActive("NewTaskbar") == 1 and UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 1 then
	  playerIndex = 0
	  local ATIRect = {0.4355, 0.333, 0.5, 0.02}
	  while (playerIndex < playerCount) do        
	    ATI_CreateParameters(RRPN_Parameters)
	    local playerName = Player_GetPlayerName(playerIndex)
	    --ATI_AddWString(RRPI_PlayerName, playerName)
			local progress = Player_GetRU(playerIndex) / 100000
	    ATI_AddFloat(RRPI_PlayerProgress, progress)
	    local playerColour = {1.0, 1.0, 1.0, 1.0}
	    ATI_AddColour(RRPI_PlayerColour, playerColour)
	    --ATI_Display2D("playerProgress", ATIRect, 0)
	    ATIRect[2] = ATIRect[2] - 0.025
			playerIndex = playerIndex+1
	  end	
	end  
end

RRPI_PlayerName         = 0
RRPI_PlayerProgress     = 1
RRPI_PlayerColour       = 2
RRPN_Parameters         = 3

--this is used to look for ships in hyperspace if a player appears to be dead
gShipTypes = 
{
	{ shipName="Hgn_Scout", 					canBeOwnedBy=1 },
	{ shipName="Hgn_Interceptor", 				canBeOwnedBy=1 },
	{ shipName="Hgn_AttackBomber", 				canBeOwnedBy=1 },
	{ shipName="Hgn_AssaultCorvette", 			canBeOwnedBy=1 },
	{ shipName="Hgn_PulsarCorvette", 			canBeOwnedBy=1 },
	{ shipName="Hgn_MinelayerCorvette", 		canBeOwnedBy=1 },
	{ shipName="Hgn_TorpedoFrigate", 			canBeOwnedBy=3 },
	{ shipName="Hgn_AssaultFrigate", 			canBeOwnedBy=3 },
	{ shipName="Hgn_IonCannonFrigate", 			canBeOwnedBy=3 },
	{ shipName="Hgn_MarineFrigate", 			canBeOwnedBy=3 },
	{ shipName="Hgn_DefenseFieldFrigate", 		canBeOwnedBy=3 },
	{ shipName="Hgn_GunTurret", 				canBeOwnedBy=1 },
	{ shipName="Hgn_IonTurret", 				canBeOwnedBy=1 },
	{ shipName="Hgn_ResourceCollector", 		canBeOwnedBy=1 },
	{ shipName="Hgn_Destroyer", 				canBeOwnedBy=3 },
	{ shipName="Hgn_Carrier", 					canBeOwnedBy=3 },
	{ shipName="Hgn_Battlecruiser", 			canBeOwnedBy=3 },

	{ shipName="Vgr_Scout", 					canBeOwnedBy=2 },
	{ shipName="Vgr_Interceptor", 				canBeOwnedBy=2 },
	{ shipName="Vgr_Bomber", 					canBeOwnedBy=2 },
	{ shipName="Vgr_LanceFighter", 				canBeOwnedBy=2 },
	{ shipName="Vgr_MissileCorvette", 			canBeOwnedBy=2 },
	{ shipName="Vgr_LaserCorvette", 			canBeOwnedBy=2 },
	{ shipName="Vgr_MinelayerCorvette", 		canBeOwnedBy=2 },
	{ shipName="Vgr_CommandCorvette", 			canBeOwnedBy=2 },
	{ shipName="Vgr_AssaultFrigate", 			canBeOwnedBy=3 },
	{ shipName="Vgr_HeavyMissileFrigate", 		canBeOwnedBy=3 },
	{ shipName="Vgr_InfiltratorFrigate", 		canBeOwnedBy=3 },
	{ shipName="Vgr_WeaponPlatform_Gun", 		canBeOwnedBy=2 },
	{ shipName="Vgr_WeaponPlatform_Missile", 	canBeOwnedBy=2 },
	{ shipName="Vgr_ResourceCollector", 		canBeOwnedBy=2 },
	{ shipName="Vgr_Destroyer", 				canBeOwnedBy=3 },
	{ shipName="Vgr_Carrier", 					canBeOwnedBy=3 },
	{ shipName="Vgr_BattleCruiser", 			canBeOwnedBy=3 },
}

