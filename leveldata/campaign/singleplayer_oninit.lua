RRPI_PlayerName         = 0
RRPI_PlayerProgress     = 1
RRPI_PlayerColour       = 2
RRPN_Parameters         = 3

function SinglePlayer_OnInit()
	if Universe_GameTime() < 1 then
		Player_Oninit()	--music player initialize
		--Rule_Remove("Play_Music")
		--Rule_Remove("Play_Music")
		--mp_play = 0
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
	  --Universe_AllowPlayerOrders(0)
	  --UI_SetScreenEnabled("ResourceMenu", 0)
	  --UI_SetScreenEnabled("NewTaskbar", 0)
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
	  --Rule_AddInterval("ec_welcome", 8) --ok
	  --fadedown()
	  --Rule_AddInterval("interfacegivecontrol", 10) --ok
	  --Rule_AddInterval("interfaceintro", 0.25) --ok, optimized
	  --Rule_AddInterval("locard", 14) --ok, optimized
	  Rule_AddInterval("interfacebuttons", 1) --ok, optimized
	  Rule_AddInterval("interfacebuttonsFast", 1.1)
	  Rule_AddInterval("selected", 0.7) --ok
	---GAME SETTINGS

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
	  crates = 0		--no crates for single player
	  sharerus = "no"
	  resstart = GetGameSettingAsNumber("resstart")
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
			      honourstartList[i] = 0	--10
			    end
			  elseif honourstart == 3 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--20
			    end
			  elseif honourstart == 4 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--30
			    end
			    if rankrace == 1 then
			      rankrace = 3
			    end
			  elseif honourstart == 5 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--80
			    end
			    if rankrace == 1 then
			      rankrace = 5
			    end
			  elseif honourstart == 6 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--150
			    end
			    if rankrace == 1 then
			      rankrace = 7
			    end
			  elseif honourstart == 7 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--240
			    end
			    if rankrace == 1 then
			      rankrace = 9
			    end
			  elseif honourstart == 8 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--350
			    end
			    if rankrace == 1 then
			      rankrace = 11
			    end
			  elseif honourstart == 9 then
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--480
			    end
			    rankrace = 0
			  else
			    for i = 1,6,1 do
			      honourstartList[i] = 0	--10
			    end
			  end
			  if SP_Campaign_Level_ID ~= nil then
					local SP_Campaign_HonourLevelList = {0,30,50,80,110,150,190,240,290,350,410,480,480,480,480}
					local starting_honor = 0
					for z, iCount in SP_Campaign_HonourLevelList do
						if SP_Campaign_Level_ID == z then
							starting_honor = iCount
						end
					end
					for i = 2,6,1 do
			      honourstartList[i] = starting_honor		--set starting honor points for AI
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
			    aiaidshonour = 0.9
			  elseif aiaids == 3 then
			    Rule_AddInterval("ai", 125.1257)
			    aiaidshonour = 0.95
			  elseif aiaids == 4 then
			    Rule_AddInterval("ai", 90.1257)
			    aiaidshonour = 1
			  elseif aiaids == 5 then
			    Rule_AddInterval("ai", 50.1257)
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
			  if unitbehavior == 1 then
			    unitbehavior = 0
			  elseif unitbehavior == 2 then
			    unitbehavior = 1
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
			  	--different incentive levels for different missions
			  	if SP_Campaign_Level_ID ~= nil then
			  		incentive = floor((SP_Campaign_Level_ID+1)/4)
			  		if incentive > 4 then
			  			incentive = 4
			  		elseif incentive < 1 then
			  			incentive = 1
			  		end
			  		print("Current incentive multiplier: "..incentive)
			  	end
			  	Rule_AddInterval("accoladesinit", 1.974)		--was 67
			  	Rule_AddInterval("SP_ShowAccoladesAtBeginning", 67)
			  end

			--Lock teams, it seems that this doesn't work
			  --lockTeams = GetGameSettingAsString("lockteams");
			  --if (lockTeams == "No") then
				--  Rule_AddInterval("FreeWillTheorem", 3000)
			 	--end

	    --starting collectors
			  if startwith == 0 then
			    --SetStartFleetSuffix("end")
			  elseif startwith == 1 then
			    --SetStartFleetSuffix("mothership")
			  elseif startwith == 2 then
			    --SetStartFleetSuffix("small")
			  elseif startwith == 3 then
			    --SetStartFleetSuffix("")
			  --elseif startwith == 4 then
			    --SetStartFleetSuffix("large")
			  elseif startwith == 4 then
			    --SetStartFleetSuffix("extra")
	        --Rule_AddInterval("buildonstartextra", 35) --ok
			  elseif startwith == 5 then
			    --SetStartFleetSuffix("fleet")
			    --Rule_AddInterval("buildonstartfleet", 35) --ok
			  elseif startwith == 6 then
			    --SetStartFleetSuffix("empire")
			    --Rule_AddInterval("buildonstartempire", 35) --ok
			  elseif startwith == 7 then
			    --SetStartFleetSuffix("test")
			    --Rule_AddInterval("buildonstarttest", 35) --ok
			  elseif startwith == 8 then
			    --SetStartFleetSuffix("evo")
			    --Rule_AddInterval("buildonstartevo", 35) --ok
			  elseif startwith == 9 then
			    --SetStartFleetSuffix("exp")
			  elseif startwith == 10 then
			    --SetStartFleetSuffix("keeper")
			  elseif startwith == 11 then
			    --SetStartFleetSuffix("tactical")
			  end
			--start resource
			  if resstart == 7000 then
			   --Rule_AddInterval("buildonresstart7000", 15) --ok
			  elseif resstart == 11000 then
			    --Rule_AddInterval("buildonresstart11000", 15) --ok
			  end
			--start based on map
	      --Rule_AddInterval("buildonstartmap", 35) --ok

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
		  Rule_AddInterval("population", 7.654321) --ok
			Rule_AddInterval("populationinit", 3.1)
	--OBJECTIVE
		--Rule_AddInterval("objectives", 24.24)
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
	  Rule_AddInterval("transportcell", 7.55) --ok
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
	  Rule_AddInterval("keeppositiononpassive", 0.455) --ok
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
		OnStartOneTimeJob_SP()
		Temp_GlobalVariable.PlayerGender = {-1,-1,-1,-1,-1,-1}

	--------------------------------------------------
	------- SIMPLEX CAMPAIGN SPECIAL FUNCTIONS -------
	--------------------------------------------------

	---Preserve Honour Points on start
		Rule_AddInterval("SP_PreserveHonourPoints", 0.288)		--just after the sobgroup create function and before the interface function

		--More Advanced SP Functions
		if SP_Campaign_Level_ID ~= nil then

			SP_RestrictPlayerBadassOptions()

			if SP_Campaign_Level_ID > 1 then
				---Grant Experience on start
				Rule_AddInterval("SP_GrantExperienceOnStart", 7.787)		--after the sobgroups() function
			end

			---AI Research Hack!!!
			Rule_AddInterval("SP_AIResearchHack", 5.125)
			Rule_AddInterval("SP_AIResourceHack", 16.282)

			--Debug
			--Rule_AddInterval("SP_DebugFunction", 7.756821)

		end

	end
end

function SP_ShowAccoladesAtBeginning()
	local playerIndexList = Universe_CurrentPlayer() + 1
	if UI_IsScreenActive("year2alt") == 0 and PlayerUI_HideAccoladeDisplay[playerIndexList] == 1 then
		PlayerUI_HideAccoladeDisplay[playerIndexList] = 0
	end
	Rule_Remove("SP_ShowAccoladesAtBeginning")
end

function SP_DebugFunction()
	local playerIndex = 0
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
			if Player_HasShipWithBuildQueue(playerIndex) == 1 then
        playerIndexList = playerIndex + 1
				if Player_GetRace(playerIndex) == Race_Hiigaran then

				end
			end
		end
		playerIndex = playerIndex + 1
	end
	Rule_Remove("SP_DebugFunction")
end

function SP_RestrictPlayerBadassOptions()
	local playerIndex = Universe_CurrentPlayer()
	if Player_GetRace(playerIndex) ~= Race_Hiigaran then
		return 0
	end
  if SP_Campaign_Level_ID < 15 then
	  Player_RestrictBuildOption(playerIndex, "hgn_battlestation")
	  Player_RestrictBuildOption(playerIndex, "hgn_hscore")
		Player_RestrictResearchOption(playerIndex, "HyperspaceCoreSummon")
		Player_RestrictResearchOption(playerIndex, "BlackholeTech")
	end
	Player_RestrictResearchOption(playerIndex, "computerhack")
	Player_RestrictResearchOption(playerIndex, "computerhack1")
	Player_RestrictResearchOption(playerIndex, "computerhack2")
	Player_RestrictResearchOption(playerIndex, "computerhack3")
	if SP_Campaign_Level_ID <= 11 then
		Player_RestrictResearchOption(playerIndex, "RadiationDefenseField")
		Player_RestrictResearchOption(playerIndex, "MSRadiationDefenseField")
		Player_RestrictResearchOption(playerIndex, "CFRadiationDefenseField")
		Player_RestrictResearchOption(playerIndex, "SRadiationDefenseField")
		Player_RestrictResearchOption(playerIndex, "RadiationDefenseFieldTurret")
	end

end

function SP_AIResourceHack()
	local ResourceAids = SP_Campaign_Level_ID * 1000
	local playerIndex = 0
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 and playerIndex ~= Universe_CurrentPlayer() then		--this is a living AI player
      if Player_HasShipWithBuildQueue(playerIndex) == 1 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector") >=5 then
        playerIndexList = playerIndex + 1
        local CurrentRU = Player_GetRU(playerIndex)
				if CurrentRU == 0 then
					Player_SetRU(playerIndex, CurrentRU + ResourceAids)
				end
      end
    end
    playerIndex = playerIndex + 1
  end
  Rule_RandomInterval("SP_AIResourceHack", 69, 16)
end

function SP_AIResearchHack()
	local playerIndex = 0
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 and playerIndex ~= Universe_CurrentPlayer() then		--this is a living AI player
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
        playerIndexList = playerIndex + 1

        -- Add Turanic Raiders (race ID 4) research hacking
        if Player_GetRace(playerIndex) == 4 then -- Turanic Raiders
          -- Epic Research Hax
          local AITechGranted = 0
          local AITechGrantedValue = 0
          local AITechValueList = {500,800,1000,1300,1600,1900,2400,3000,4000,5000,6000,7000,8000,10000,99999}
          local AITechTimeList = {20,25,30,35,40,45,50,60,70,80,90,100,150,260,500}
          local AITechHackLevel = SP_Campaign_Level_ID
          if AITechHackLevel > 15 then
            AITechHackLevel = 15
          end
          local iRace = Player_GetRace(playerIndex) + 1
          dofilepath([[data:scripts/race.lua]])
          if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
            dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
            for z, iCount in research do
              if iCount.Cost >= 100 and iCount.Time >= 10 and iCount.Cost <= AITechValueList[AITechHackLevel] and iCount.Time <= AITechTimeList[AITechHackLevel] then		--grant research items based on their value and time
                local SkipExceptions = 0
                if String_ContainsNameBeginningAt(iCount.Name, "computer") == 1 then
                  SkipExceptions = 1
                end
                if SkipExceptions == 0 then
                  AITechGranted = AITechGranted + Player_GrantResearchOption_Smart(playerIndex, iCount.Name)
                  AITechGrantedValue = AITechGrantedValue + iCount.Cost
                else
                  print("AI EPIC research hax skipping exception: "..iCount.Name)
                end
              end
            end
          end
          local plural = "s"
          if AITechGranted < 2 then
            plural = ""
          end
          print("AI EPIC research hax! "..AITechGranted.." item"..plural.." with "..AITechGrantedValue.." RU value granted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..AITechHackLevel)

          --fighters + corvettes health boost for specific levels
          local boost_hp_level = 0
          if SP_Campaign_Level_ID == 9 then
            boost_hp_level = 3
          end
          if boost_hp_level > 0 then
            if Player_GrantResearchOption_Smart(playerIndex, "MAXHEALTH_FIGHTER_"..boost_hp_level)	== 1 then
              print("Fighter health boosted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..boost_hp_level)
            end
            if Player_GrantResearchOption_Smart(playerIndex, "MAXHEALTH_CORVETTE_"..boost_hp_level) == 1 then
              print("Corvette health boosted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..boost_hp_level)
            end
          end
        elseif Player_GetRace(playerIndex) == Race_Vaygr then

					--Frigate Spam
	        if Player_HasResearch(playerIndex, "FrigateAssault") == 1 then
	        	local frigate_tech = {"MultiCannonTech", "HeavyMissileFrigate", "FrigateInfiltrationTech", "SupportFrigateArmedTech", "SupportFrigateTech", "SupportFrigate_LaserTech", "ArtilleryGunTech", "LongRangeArtilleryGunTech", "DeathTech", "CommandFrigateTech"}
	        	local num_tech = 0
	        	for z, iCount in frigate_tech do
	        		if random_pseudo(1,100) < 80 then
	        			num_tech = num_tech + Player_GrantResearchOption_Smart(playerIndex , iCount)
	        		end
	        	end
	        	local plural = "s"
	        	if num_tech < 2 then
	        		plural = ""
	        	end
	        	print("AI research hax: "..num_tech.." frigate"..plural.." granted for player index "..playerIndex..", game time: "..Universe_GameTime())
	        end

	        --Epic Research Hax
	        local AITechGranted = 0
	        local AITechGrantedValue = 0
	        local AITechValueList = {500,800,1000,1300,1600,1900,2400,3000,4000,5000,6000,7000,8000,10000,50000}
	        local AITechTimeList = {20,25,30,35,40,45,50,60,70,80,90,100,150,260,500}
	        local AITechHackLevel = SP_Campaign_Level_ID
	        if AITechHackLevel > 15 then
	        	AITechHackLevel = 15
	        end
	        local iRace = Player_GetRace(playerIndex) + 1
	        dofilepath([[data:scripts/race.lua]])
	        if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
						dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
						for z, iCount in research do
							if iCount.Cost >= 100 and iCount.Time >= 10 and iCount.Cost <= AITechValueList[AITechHackLevel] and iCount.Time <= AITechTimeList[AITechHackLevel] then		--grant research items based on their value and time
							  local SkipExceptions = 0
							  if String_ContainsNameBeginningAt(iCount.Name, "computer") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "nebula") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "MAXHEALTH_") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "solarshield") == 1 or  String_ContainsNameBeginningAt(iCount.Name, "remotespaceshield") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "DroneTech") == 1 then
							  	SkipExceptions = 1
							  end
							  if SkipExceptions == 0 then
								  AITechGranted = AITechGranted + Player_GrantResearchOption_Smart(playerIndex, iCount.Name)
								  AITechGrantedValue = AITechGrantedValue + iCount.Cost
								else
									print("AI EPIC research hax skipping exception: "..iCount.Name)
								end
							end
						end
					end
        	local plural = "s"
        	if AITechGranted < 2 then
        		plural = ""
        	end
	        print("AI EPIC research hax! "..AITechGranted.." item"..plural.." with "..AITechGrantedValue.." RU value granted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..AITechHackLevel)

	      	--fighters + corvettes health boost for specific levels
	      	local boost_hp_level = 0
	      	if SP_Campaign_Level_ID == 9 then
	      		boost_hp_level = 3
	      	end
	      	if boost_hp_level > 0 then
				    if Player_GrantResearchOption_Smart(playerIndex, "MAXHEALTH_FIGHTER_"..boost_hp_level)	== 1 then
				    	print("Fighter health boosted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..boost_hp_level)
				    end
				    if Player_GrantResearchOption_Smart(playerIndex, "MAXHEALTH_CORVETTE_"..boost_hp_level) == 1 then
				    	print("Corvette health boosted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..boost_hp_level)
				    end
				  end

	      elseif Player_GetRace(playerIndex) == Race_Hiigaran then

	        --Epic Research Hax
	        local AITechGranted = 0
	        local AITechGrantedValue = 0
	        local AITechValueList = {500,800,1000,1300,1600,1900,2400,3000,4000,5000,6000,7000,8000,10000,99999}
	        local AITechTimeList = {20,25,30,35,40,45,50,60,70,80,90,100,150,260,500}
	        local AITechHackLevel = SP_Campaign_Level_ID
	        if AITechHackLevel > 15 then
	        	AITechHackLevel = 15
	        end
	        local iRace = Player_GetRace(playerIndex) + 1
	        dofilepath([[data:scripts/race.lua]])
	        if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
						dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
						for z, iCount in research do
							if iCount.Cost >= 100 and iCount.Time >= 10 and iCount.Cost <= AITechValueList[AITechHackLevel] and iCount.Time <= AITechTimeList[AITechHackLevel] then		--grant research items based on their value and time
							  local SkipExceptions = 0
							  if String_ContainsNameBeginningAt(iCount.Name, "computer") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "nebula") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "MAXHEALTH_") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "HyperspaceCoreSummon") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "solarshield") == 1 or  String_ContainsNameBeginningAt(iCount.Name, "remotespaceshield") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "DroneTech") == 1 then
							  	SkipExceptions = 1
							  end
							  if SkipExceptions == 0 then
								  AITechGranted = AITechGranted + Player_GrantResearchOption_Smart(playerIndex, iCount.Name)
								  AITechGrantedValue = AITechGrantedValue + iCount.Cost
								else
									print("AI EPIC research hax skipping exception: "..iCount.Name)
								end
							end
						end
					end
        	local plural = "s"
        	if AITechGranted < 2 then
        		plural = ""
        	end
	        print("AI EPIC research hax! "..AITechGranted.." item"..plural.." with "..AITechGrantedValue.." RU value granted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..AITechHackLevel)

	      	--fighters + corvettes health boost for specific levels
	      	local boost_hp_level = 0
	      	if SP_Campaign_Level_ID == 15 then
	      		boost_hp_level = 3
	      	end
	      	if boost_hp_level > 0 then
				    if Player_GrantResearchOption_Smart(playerIndex, "MAXHEALTH_FIGHTER_"..boost_hp_level)	== 1 then
				    	print("Fighter health boosted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..boost_hp_level)
				    end
				    if Player_GrantResearchOption_Smart(playerIndex, "MAXHEALTH_CORVETTE_"..boost_hp_level) == 1 then
				    	print("Corvette health boosted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..boost_hp_level)
				    end
				  end

	      elseif Player_GetRace(playerIndex) == Race_Keeper then
	        --Epic Research Hax
	        local AITechGranted = 0
	        local AITechGrantedValue = 0
	        local AITechValueList = {500,800,1000,1300,1600,1900,2400,3000,4000,5000,6000,7000,8000,10000,99999}
	        local AITechTimeList = {20,25,30,35,40,45,50,60,70,80,90,100,150,260,500}
	        local AITechHackLevel = SP_Campaign_Level_ID
	        if AITechHackLevel > 15 then
	        	AITechHackLevel = 15
	        end
	        local iRace = Player_GetRace(playerIndex) + 1
	        dofilepath([[data:scripts/race.lua]])
	        if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
						dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
						for z, iCount in research do
							if iCount.Cost >= 100 and iCount.Time >= 10 and iCount.Cost <= AITechValueList[AITechHackLevel] and iCount.Time <= AITechTimeList[AITechHackLevel] then		--grant research items based on their value and time
							  local SkipExceptions = 0
							  if String_ContainsNameBeginningAt(iCount.Name, "computer") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "nebula") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "MAXHEALTH_") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "solarshield") == 1 or  String_ContainsNameBeginningAt(iCount.Name, "remotespaceshield") == 1 then
							  	SkipExceptions = 1
							  elseif String_ContainsNameBeginningAt(iCount.Name, "DroneTech") == 1 then
							  	SkipExceptions = 1
							  end
							  if SkipExceptions == 0 then
								  AITechGranted = AITechGranted + Player_GrantResearchOption_Smart(playerIndex, iCount.Name)
								  AITechGrantedValue = AITechGrantedValue + iCount.Cost
								else
									print("AI EPIC research hax skipping exception: "..iCount.Name)
								end
							end
						end
					end
        	local plural = "s"
        	if AITechGranted < 2 then
        		plural = ""
        	end
	        print("AI EPIC research hax! "..AITechGranted.." item"..plural.." with "..AITechGrantedValue.." RU value granted for player index "..playerIndex.." ("..races[iRace][1].."), level: "..AITechHackLevel)

        end
      end
    end

    playerIndex = playerIndex + 1
  end
  Rule_Remove("SP_AIResearchHack")
end

function SP_PreserveHonourPoints()
	local playerIndex = Universe_CurrentPlayer()
	local playerIndexList = playerIndex + 1
	if SP_Campaign_Level_ID == nil then
		Rule_Remove("SP_PreserveHonourPoints")
	elseif SP_Campaign_Level_ID == 1 then
		Rule_Remove("SP_PreserveHonourPoints")
	else		--this function is for level 2 and above only
		local FleetHasBeenSpawned = 0
		for z, iCount in ship_list.hgn do
			if iCount.class == "capital" then
				if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, iCount.name) >= 1 then
					FleetHasBeenSpawned = 1
					break
				end
			end
		end
		if FleetHasBeenSpawned == 1 then		--is this a good condition to check if the fleet has been spawned?
			if honorList[playerIndexList] == 0 then
				if SP_Campaign_Level_ID > 1 then
					--print("Function SP_PreserveHonourPoints() is running")
					local GotSupporter = 1		--the supporter should have been spawned at 0.2 game time by sobgroupscreate() function
					if SobGroup_Empty("supporter"..playerIndex) == 1 then
						GotSupporter = 0
						print("Function SP_PreserveHonourPoints() can not find your supporter! Where the hell is it?!")
					elseif SobGroup_HealthPercentage("supporter"..playerIndex) == 0 then
						GotSupporter = 0
						print("Function SP_PreserveHonourPoints() finds your supporter have 0 health! WTF is happening?!")
					end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation")>=1 and GotSupporter==1 then
						--print("Function SP_PreserveHonourPoints() is running in crew station mode")
						SobGroup_Create("SP_MyCrewStation")		--the sobgroups() function hasn't started yet, use this temporary sobgroup instead
						SobGroup_FillShipsByType("SP_MyCrewStation", "Player_Ships"..playerIndex, "hgn_crewstation")
						local SP_CrewStation_HonourType_List = {"isLieutenant", "isCommander", "isCaptain", "isCommodore", "isAdmiral", "isFleetAdmiral"}
						local SP_CrewStation_HonourPoint_List = {30, 80, 150, 240, 350, 480}
						local SP_Campaign_HonourLevelList = {0,30,50,80,110,150,190,240,290,350,410,480,480,480,480}		--if the honour on the crew station is beneath this minimum level, use this ensurance instead
						local ensurance = ""
						for z, iCount in SP_CrewStation_HonourType_List do
							if SobGroup_GetHardPointHealth("SP_MyCrewStation", iCount) > 0 or Player_CanResearch(playerIndex, "SP_"..iCount ) == 1 then		--only checking the hardpoint health doesn't work, don't know why, probably because the station is not launched yet
								honourstartList[playerIndexList] = SP_CrewStation_HonourPoint_List[z]
								honorList[playerIndexList] = honourstartList[playerIndexList]
								if SobGroup_GetHardPointHealth("supporter"..playerIndex, iCount) == 0 then
            			SobGroup_CreateSubSystem("supporter"..playerIndex, iCount)
            		end
            		if SobGroup_GetHardPointHealth("supporter"..playerIndex, "SP_isHonorInherited") == 0 then
            			SobGroup_CreateSubSystem("supporter"..playerIndex, "SP_isHonorInherited")
            		end
							end
						end
        		if honourstartList[playerIndexList] < SP_Campaign_HonourLevelList[SP_Campaign_Level_ID] then
          		honourstartList[playerIndexList] = SP_Campaign_HonourLevelList[SP_Campaign_Level_ID]
          		honorList[playerIndexList] = honourstartList[playerIndexList]
          		ensurance = " (using ensurance)"
          	end
						print("Honour points inherited via crew station mode: "..honorList[playerIndexList]..ensurance..", game time: "..Universe_GameTime())
						if honourstartList[playerIndexList] == 0 then
							print("EPIC FAIL!!!!! Can't inherit honour points from crew station!")
						end
					end
					if honourstartList[playerIndexList] == 0 then			--if your crew station is lost in the last mission, you still have some basic honour points, the precise amount of which is based on your current campaign level
						--print("Function SP_PreserveHonourPoints() is running in default mode")
						local SP_Campaign_HonourLevelList = {0,30,50,80,110,150,190,240,290,350,410,480,480,480,480}
						for z, iCount in SP_Campaign_HonourLevelList do
							if SP_Campaign_Level_ID == z then
								honourstartList[playerIndexList] = iCount
								honorList[playerIndexList] = honourstartList[playerIndexList]
							end
						end
						print("Honour points inherited via default mode: "..honorList[playerIndexList]..", game time: "..Universe_GameTime())
					end
					--grant honour points for AI players
					local SP_Campaign_HonourLevelList = {0,30,80,150,240,350,480,500,600,700,800,900,1000,1100,1200}
					for y=1,6,1 do
						if Universe_CurrentPlayer() ~= y-1 then
							honourstartList[y] = SP_Campaign_HonourLevelList[SP_Campaign_Level_ID]
							honorList[y] = honourstartList[playerIndexList]
						end
					end
					print("Honour points granted for all AI players: "..SP_Campaign_HonourLevelList[SP_Campaign_Level_ID]..", game time: "..Universe_GameTime())
				end
			end
			Rule_Remove("SP_PreserveHonourPoints")		--the fleet has spawned, the honour points are inherited and the rule can be remove
			--print("Function SP_PreserveHonourPoints() removed, game time: "..Universe_GameTime())

		end
	end
	--add some crew capacity by the way
	if pilotrecruitList[playerIndexList] < pilotmaxList[playerIndexList] then
		pilotrecruitList[playerIndexList] = pilotrecruitList[playerIndexList] + 1
	end
	if officerrecruitList[playerIndexList] < officermaxList[playerIndexList] then
		officerrecruitList[playerIndexList] = officerrecruitList[playerIndexList] + 1
	end
end

function SP_GrantExperienceOnStart()
	local playerIndex = Universe_CurrentPlayer()
	local playerIndexList = playerIndex + 1
	local FleetHasBeenSpawned = 0
	for z, iCount in {"hgn_mothership","kpr_sajuuk"} do
		local ship = iCount..playerIndex
		if SobGroup_Empty(ship) == 0 then
			if SobGroup_GetHardPointHealth(ship, "experience") >= 0.00001 then
				FleetHasBeenSpawned = 1
				break
			end
		end
	end
	local second_condition = 0
	local exp_initiated = 0
	local FiCoExist = 0
	for i=1,6,1 do
		if nfi[i] + nco[i] > 0 then
			FiCoExist = 1
		end
	end
	if FiCoExist == 0 then
		second_condition = 1
	else
		for i=1,6,1 do
			for z, iCount in FighterEXP.serial[i] do
				if iCount ~= nil then
					exp_initiated = 1
				end
			end
			for z, iCount in CorvetteEXP.serial[i] do
				if iCount ~= nil then
					exp_initiated = 1
				end
			end
		end
		if exp_initiated == 1 then
			second_condition = 1
		end
	end

	if FleetHasBeenSpawned == 1 and second_condition == 1 then
		Update_AllShips()		--Also add experience for AI players
		local shippromoted = 0
		local fighterpromoted = 0
		local corvettepromoted = 0
		local SP_ExpLevelList = {50,50,100,150,200,250,300,350,400,450,500,550,600,650,700}
		if SobGroup_Empty("AllShips") == 0 then
			SobGroup_Create("HaxorShipsWithSubsystemXP_SOB")
			SobGroup_Clear("HaxorShipsWithSubsystemXP_SOB")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "motherships")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "researchstations")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "powerstations")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "crewstations")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "weaponstations")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "destroyers")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "carriers")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "battlecruisers")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "shipyards")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "commandfortresses")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "hyperspacestations")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "juggernaughts")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "frigates")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "platforms")
			SobGroup_SobGroupAdd("HaxorShipsWithSubsystemXP_SOB", "mobilerefineries")		--Overseer needs this
			local xplevel = 0.01000/100*SP_ExpLevelList[SP_Campaign_Level_ID]		--starting from level 2
			local xplevel_variation = 0.01000/100*random_pseudo(-20,20)
			--ships with subsystem-type experience
			local numships = SobGroup_SplitGroupReference("SingleHaxorToPromote_SOB", "AllShips", "AllShips", SobGroup_Count("AllShips"))
			for i = 0, numships - 1, 1 do
				if SobGroup_HealthPercentage("SingleHaxorToPromote_SOB"..i) > 0 then
					local currentxp = SobGroup_GetHardPointHealth("SingleHaxorToPromote_SOB"..i, "experience")
					local addxp = xplevel + 0.01000/100*random_pseudo(-20,20)
					if addxp <= 0 then
						addxp = 0.00001
					elseif addxp >= 1 then
						addxp = 0.00001*999
					end
					--function sobgroups() may haven't started, the experience is lost anyway, just grant the desired experience straightaway
					SobGroup_SetHardPointHealth_Smart("SingleHaxorToPromote_SOB"..i, "experience", addxp)
					shippromoted = shippromoted + 1
				end
			end
			local playervar = 0
		  while playervar < Universe_PlayerCount() do
			  playervar = playervar + 1
			  local playeridx = playervar-1
			  --fighters
		  	if nfi[playervar] > 0 then
					for i = 0,(nfi[playervar]-1),1 do
						if SobGroup_Empty("splitfighters"..playeridx .. tostring(i)) == 0 then
							local addxp = xplevel + 0.01000/100*random_pseudo(-20,20)
							if addxp <= 0 then
								addxp = 0.00001
							elseif addxp >= 1 then
								addxp = 0.00001*999
							end
							if FighterEXP.serial[playervar][i+1] ~= nil then
								if FighterEXP.serial[playervar][i+1] < 1 - addxp then
									FighterEXP.serial[playervar][i+1] = FighterEXP.serial[playervar][i+1] + addxp
									fighterpromoted = fighterpromoted + 1
							  end
							else		--experience function hasn't started yet, need to create experience data
								FighterEXP.serial[playervar][i+1] = addxp
								fighterpromoted = fighterpromoted + 1
							end
						end
					end
				end
				--corvettes
				if nco[playervar] > 0 then
					for i = 0,(nco[playervar]-1),1 do
						if SobGroup_Empty("splitcorvettes"..playeridx .. tostring(i)) == 0 then
							local addxp = xplevel + 0.01000/100*random_pseudo(-20,20)
							if addxp <= 0 then
								addxp = 0.00001
							elseif addxp >= 1 then
								addxp = 0.00001*999
							end
							if CorvetteEXP.serial[playervar][i+1] ~= nil then
								if CorvetteEXP.serial[playervar][i+1] < 1 - addxp then
									CorvetteEXP.serial[playervar][i+1] = CorvetteEXP.serial[playervar][i+1] + addxp
									corvettepromoted = corvettepromoted + 1
							  end
							else		--experience function hasn't started yet, need to create experience data
								CorvetteEXP.serial[playervar][i+1] = addxp
								corvettepromoted = corvettepromoted + 1
							end
						end
					end
				end
			end
		end
		Rule_Remove("SP_GrantExperienceOnStart")
		print("Initial experience for level "..SP_Campaign_Level_ID.." is "..SP_ExpLevelList[SP_Campaign_Level_ID]..", added to primary ships: "..shippromoted..", fighters: "..fighterpromoted..", corvettes: "..corvettepromoted..", game time: "..Universe_GameTime())
		experience()	--to update the UI (ping display) immediately
	end
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
PlayerUI_HideAccoladeDisplay = {1,1,1,1,1,1}
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
cscollateraldamage = {0,0,0,0,0,0}
pscollateraldamage = {0,0,0,0,0,0}
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
pilotrecruitList = { 930, 930, 930, 930, 930, 930 }
officerrecruitList = { 45, 45, 45, 45, 45, 45 }
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
CPULODList = {"Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6"}
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
--Don't add anything conflicting with the solo mission events

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
