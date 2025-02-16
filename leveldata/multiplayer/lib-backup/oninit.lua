RRPI_PlayerName         = 0
RRPI_PlayerProgress     = 1
RRPI_PlayerColour       = 2
RRPN_Parameters         = 3

function OnInit()
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
  if (winCondition == "DestroyMothership") then  
    if GetGameSettingAsNumber("startwith") > 2 and GetGameSettingAsNumber("startwith") ~= 4 and GetGameSettingAsNumber("startwith") ~= 8 and GetGameSettingAsNumber("startwith") ~= 9 and GetGameSettingAsNumber("startwith") ~= 11 then			-- because of new starting fleet
	    Rule_AddInterval("MainRule", 16.9) --ok    	
	    Rule_AddInterval("CheckMothershipDeadRule", 17.1) --ok   
    else
	    Rule_AddInterval("MainRule", 16.9) --ok    
	    Rule_AddInterval("CheckProductionDeadRule", 17.1) --ok 
    end
  elseif (winCondition == "DestroyProduction") then
    Rule_AddInterval("MainRule", 16.9) --ok    
    Rule_AddInterval("CheckProductionDeadRule", 17.1) --ok   
	elseif (winCondition == "DestroyAll") then        
	  Rule_AddInterval("MainRule", 16.9) --ok    	
    Rule_AddInterval("CheckDeadRule", 17.1) --ok  
  elseif (winCondition == "Store100000RUs") then  
    ATI_LoadTemplates("data:LevelData\\Multiplayer\\ResourceRace\\ATI.lua")      
	  Rule_AddInterval("MainRule", 16.9) --ok    	
    Rule_AddInterval("CheckStore100000RUsDeadRule", 17.1) --ok    
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
  cpuname = GetGameSettingAsNumber("cpuname")
  diplomacy = GetGameSettingAsNumber("diplomacy")
  unitcapsrank = GetGameSettingAsNumber("unitcapsrank")
  unitcapsofficer = GetGameSettingAsNumber("unitcapsofficer")
  tweakfighterhealth = GetGameSettingAsNumber("tweakfighterhealth")
  tweakcorvettehealth = GetGameSettingAsNumber("tweakcorvettehealth")
  unitbehavior = GetGameSettingAsNumber("unitbehavior")
  interface = GetGameSettingAsNumber("interface")
  glareintensity = GetGameSettingAsNumber("glareintensity")
  ignoreavoidance = GetGameSettingAsNumber("ignoreavoidance")
  incentive = GetGameSettingAsNumber("incentive")
  crates = GetGameSettingAsNumber("crates")
  endgamecrisis_timer = GetGameSettingAsNumber("endgamecrisis_timer")
  sharerus = GetGameSettingAsString("sharerus")
  resstart = GetGameSettingAsNumber("resstart")
  --if GetGameSettingAsNumber("startwith") == 5 or GetGameSettingAsNumber("startwith") < 3 or GetGameSettingAsNumber("startwith") == 8 then			-- because of new starting fleet
		--intro = 1
	--else
		intro = GetGameSettingAsNumber("intro")
	--end
	
  --survival mode
  survival_waveowner = GetGameSettingAsNumber("survival_waveowner")
  survival_wavesize = GetGameSettingAsNumber("survival_wavesize")
  survival_wavefrequency = GetGameSettingAsNumber("survival_wavefrequency")
  survival_wavelod = GetGameSettingAsNumber("survival_wavelod")
  survival_waveunitcap = GetGameSettingAsNumber("survival_waveunitcap")
  survival_wavecount = GetGameSettingAsNumber("survival_wavecount")
  
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
		    rurace = 1
		    rankrace = 1
		    domainrace = 1   
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
		  elseif unitcapsrank == 5 then    
		    unitcapsrank = 5
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
		  elseif unitcapsofficer == 5 then    
		    unitcapsofficer = 5
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
		    aiaidshonour = 0.9
		  elseif aiaids == 3 then  
		    Rule_AddInterval("ai", 125.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 51.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 61.2919)
		    aiaidshonour = 0.95	    
		  elseif aiaids == 4 then 
		    Rule_AddInterval("ai", 90.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 36.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 46.2919)
		    aiaidshonour = 1
		  elseif aiaids == 5 then 
		    Rule_AddInterval("ai", 50.1257)
		    Rule_AddInterval("AI_IMadeThisOnlyToKickYourAss", 21.1388)
		    Rule_AddInterval("AI_AugmentedSkills", 31.2919)
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
		--CPU name
			if cpuname == 1 then
		    cpuname = 1
		  elseif cpuname == 2 then
		  	cpuname = 2
			elseif cpuname == 3 then
				cpuname = 3
			else
				cpuname = 1
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
		    interface = 0.7	--1 
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
		  
		  --ignoreavoidance
		  if ignoreavoidance == 1 then
		    ignoreavoidance = 1
		  else
		  	ignoreavoidance = 0
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
		  
		  --crates
		  if crates == 1 then
		  	crates = 1
		  elseif crates == 2 then
		    crates = 2
		  elseif crates == 3 then
		    crates = 3
		  elseif crates == 4 then
		    crates = 4
		  elseif crates == 5 then
		    crates = 5
		  else
		  	crates = 0
		  end
		  
		  --endgame crisis
		  if endgamecrisis_timer == 0 then
		  	endgamecrisis_timer = 0
		  elseif endgamecrisis_timer == 1 then
		  	endgamecrisis_timer = 0.1
		  elseif endgamecrisis_timer == 2 then
		  	endgamecrisis_timer = 0.6
		  elseif endgamecrisis_timer == 3 then
		    endgamecrisis_timer = 0.833
		  elseif endgamecrisis_timer == 4 then
		    endgamecrisis_timer = 0.933
		  elseif endgamecrisis_timer == 5 then
		    endgamecrisis_timer = 1
		  elseif endgamecrisis_timer == 6 then
		    endgamecrisis_timer = 1.067
		  elseif endgamecrisis_timer == 7 then
		    endgamecrisis_timer = 1.133
		  elseif endgamecrisis_timer == 8 then
		    endgamecrisis_timer = 1.333
		  else
		  	endgamecrisis_timer = 1
		  end
		  
		--Lock teams, it seems that this doesn't work
		  --lockTeams = GetGameSettingAsString("lockteams");
		  --if (lockTeams == "No") then  
			--  Rule_AddInterval("FreeWillTheorem", 3000)
		 	--end
		  		  				  			
    --starting collectors
		  if startwith == 0 then
		    SetStartFleetSuffix("end") 
		  elseif startwith == 1 then
		    SetStartFleetSuffix("mothership") 		    
		  elseif startwith == 2 then            
		    SetStartFleetSuffix("small") 		    
		  elseif startwith == 3 then       
		    SetStartFleetSuffix("")  		    
		  --elseif startwith == 4 then           
		    --SetStartFleetSuffix("large") 		     
		  elseif startwith == 4 then        
		    SetStartFleetSuffix("extra") 		
        Rule_AddInterval("buildonstartextra", 35) --ok				
		  elseif startwith == 5 then        
		    SetStartFleetSuffix("fleet")	
		    Rule_AddInterval("buildonstartfleet", 35) --ok 	  
		  elseif startwith == 6 then        
		    SetStartFleetSuffix("empire")	
		    Rule_AddInterval("buildonstartempire", 35) --ok 	
		  elseif startwith == 7 then        
		    SetStartFleetSuffix("test")	
		    Rule_AddInterval("buildonstarttest", 35) --ok 			 
		  elseif startwith == 8 then        
		    SetStartFleetSuffix("evo")	
		    --Rule_AddInterval("buildonstartevo", 35) --ok		             	    		    
		  elseif startwith == 9 then        
		    SetStartFleetSuffix("exp")
		  elseif startwith == 10 then
		    SetStartFleetSuffix("keeper")
		  elseif startwith == 11 then
		    SetStartFleetSuffix("tactical")
		  elseif startwith == 12 then
		    SetStartFleetSuffix("s_fighter")
		  elseif startwith == 13 then
		    SetStartFleetSuffix("s_corvette")
		  elseif startwith == 14 then
		    SetStartFleetSuffix("s_frigate")
		  elseif startwith == 15 then
		    SetStartFleetSuffix("s_destroyer")
		  elseif startwith == 16 then
		    SetStartFleetSuffix("s_battlecruiser")
		  elseif startwith == 17 then
		    SetStartFleetSuffix("s_platform")
		  elseif startwith == 18 then
		    SetStartFleetSuffix("s_random")
		  end
		--remove unwanted initial ambient sound
			--if intro == 1 then		--skip intro
				--Rule_AddInterval("Debug_InstantPauseAndResume", 0.01)	--NOT HELPING, FORGET ABOUT IT
			--end
		--start resource
		  if resstart == 7000 then
		    Rule_AddInterval("buildonresstart7000", 15) --ok 	
		  elseif resstart == 11000 then
		    Rule_AddInterval("buildonresstart11000", 15) --ok  		    
		  end  
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
     
---TEST---------------------------------------------   
	

---One time job
	OnStartOneTimeJob()
	Temp_GlobalVariable.PlayerGender = {-1,-1,-1,-1,-1,-1}

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

function test()
  --SobGroup_CreateShip("hgn_commandfortress2", "hgn_nuclearbomb")
  --Player_SetPlayerName(2, "Vaygr Armada")
  --Universe_SlowDown(0.96,12) 
  --Subtitle_Message("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||", 3) 
  --CPU_Enable(1,0)
  --research[2].Time = 1
  --Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
  --Sensors_FlashWorldPlane(1) 
  --FX_StartEvent("megalitenoowner", "Gate_Trigger")
  --FX_StartEvent("megalitenoowner", "Trench")
  --FX_PlayEffectBetweenPoints("pro_tech_beam_combo", "hgn_mothership0", "hgn_shipyard0", 10) -- non va
  --SobGroup_DockSobGroupInstant("hgn_marinefrigate0", "planet1") 
  --SobGroup_DockSobGroupAndStayDocked("hgn_marinefrigate0", "planet1")
  --if SobGroup_HealthPercentage("hgn_resourcecollector0") > 0.2 then
    --SobGroup_TakeDamage("hgn_resourcecollector0", 0.1) 
  --end 
  --if SobGroup_HealthPercentage("hgn_assaultcorvette0") > 0.2 then
    --SobGroup_TakeDamage("hgn_assaultcorvette0", 0.1) 
  --end  
  --if SobGroup_HealthPercentage("hgn_interceptor0") > 0.2 then
    --SobGroup_TakeDamage("hgn_interceptor0", 0.1) 
  --end   
  SobGroup_TakeDamage("Player_Ships0", 0.02) 
  --UI_SetScreenEnabled("rurace", 1)		
	--UI_SetScreenVisible("rurace", 1)	
  --UI_SetTextLabelText("rurace", "lblDescription1", ResearchData[1].ResearchShipExponent);
  --UI_SetTextLabelText("rurace", "lblDescription2", nbc);  
  --if SobGroup_FillProximitySobGroup ("temp", "Player_Ships2", "hgn_mothership0", 12000) == 1 then 
    --SobGroup_SetHealth("temp", 0)
    --SobGroup_SetHealth("hgn_mothership0", 0.1)    
  --end  
  --if SobGroup_FillProximitySobGroup ("temp1", "Player_Ships2", "hgn_mothership1", 12000) == 1 then 
    --SobGroup_SetHealth("Player_Ships0", 0.9)
  --end
  --SobGroup_Clear("temp")
  --SobGroup_Clear("temp1")
  --Player_GrantResearchOption( 1 , "ImprovedTorpedoCruiser" )
  --Player_GrantResearchOption( 1 , "ImprovedTorpedoCruiser1" )  
  --SobGroup_DockSobGroupInstant("hgn_mothership0", "hgn_shipyard0") 
  --Player_Research( 1 , "ImprovedTorpedoDestroyer" )
  --SobGroup_CreateSubSystem("vgr_battlecruiser1", "Vgr_dt3_turret_light")
  --FX_StartEvent("hgn_resourcecontroller0", "Fusion4")
  --SobGroup_Create("hgn_scaver0") 
  --SobGroup_FillShipsByType("hgn_scaver0", "Player_Ships0", "hgn_scaver")  
  --SobGroup_SetHealth("hgn_scaver0", 0.5)
  --SobGroup_SwitchOwner( "hgn_scaver0", 1)

  --SobGroup_AvoidanceIgnore("hgn_resourcecollector0", "hgn_mothership0")     
  --SobGroup_ForceStayDockedIfDocking("hgn_researchstation0")
  --if SobGroup_IsDockedSobGroup("hgn_researchstation0", "hgn_mothership0") == 1 then
    --SobGroup_MakeSelectable("hgn_researchstation0", 0)
    --SobGroup_AbilityActivate("hgn_researchstation0", AB_Builder, 1) 
    --SobGroup_AbilityActivate("hgn_researchstation0", AB_Hyperspace, 1)     
  --else
    --SobGroup_MakeSelectable("hgn_researchstation0", 1)  
  --end   
  --Rule_Remove("test")
end  
function test1()  
  SobGroup_SetHealth("Player_Ships0", 1)    
  --Rule_Remove("test")
end  