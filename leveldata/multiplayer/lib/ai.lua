function LOD()    
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
				--if Player_HasResearch(playerIndex, "isai" ) == 1 then  
	        if Player_HasResearch(playerIndex, "iseasy" ) == 1 then  
	          CPULODvalueList[playerIndexList] = 0	     
	          print("CPULODvalueList is set to 0 for player index: ".. playerIndex)      
	        elseif Player_HasResearch(playerIndex, "isstandard" ) == 1 then  
	          CPULODvalueList[playerIndexList] = 1  	          
	          print("CPULODvalueList is set to 1 for player index: ".. playerIndex) 
	        elseif Player_HasResearch(playerIndex, "ishard" ) == 1 then  
	          CPULODvalueList[playerIndexList] = 2	        
	          print("CPULODvalueList is set to 2 for player index: ".. playerIndex) 	  
	        elseif Player_HasResearch(playerIndex, "isexpert" ) == 1 then  
	          CPULODvalueList[playerIndexList] = 3 
	          print("CPULODvalueList is set to 3 for player index: ".. playerIndex) 	          
	        else
	        	local rm = random_pseudo(0,3)
	        	if CPU_Exist_Smart(playerIndex) == 1 then
		        	CPULODvalueList[playerIndexList] =  rm
		          print("CPULODvalueList is set to " .. rm .. " (by random) for player index: ".. playerIndex) 	
	          end 
	        end  
	      --else	        					                    
        --end   
      end  
    end  
    playerIndex = playerIndex + 1
  end
  if GameRulesName == "Simplex Sole Survivor" then
  	Rule_RandomInterval("AI_SoleSurvivor", 4, 0.5)
  end
  Rule_Remove("LOD")
end

function AI_SetPersonality()	--Kadeshi AI Personalities (can also be used for other races)
	for i = 1, 6, 1 do
  	kad_cpu_personality[i] = random_pseudo(1,4)
  	kad_cpu_subpersonality[i] = random_pseudo(1,2)
  end
  print("Kadeshi AI personality list: "..kad_cpu_personality[1]..", "..kad_cpu_personality[2]..", "..kad_cpu_personality[3]..", "..kad_cpu_personality[4]..", "..kad_cpu_personality[5]..", "..kad_cpu_personality[6])
	print("Kadeshi AI sub personality list: "..kad_cpu_subpersonality[1]..", "..kad_cpu_subpersonality[2]..", "..kad_cpu_subpersonality[3]..", "..kad_cpu_subpersonality[4]..", "..kad_cpu_subpersonality[5]..", "..kad_cpu_subpersonality[6])
	Rule_Remove("AI_SetPersonality")
end

function ai()
	--print("AI - Start")
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1 
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
        if Player_HasResearch(playerIndex, "isai" ) == 1 then
        	--print("AI - Start, \t for player index: "..playerIndex)
          
--AI verso pianeta
          --if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") > 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_moon") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_earth") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_mars") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_jupiter") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_europa") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_io") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_callisto") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_ganymeade") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_pluto") == 0 and
             --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "planet_neptune") == 0 and
             --SobGroup_Count("planetnoowner") > 0 then
	          --SobGroup_Clear("temp")          
	          --distance = 1000			                     
	          --while SobGroup_Count("temp") == 0 and distance < 100000 do                      	              						     
			        --if SobGroup_FillProximitySobGroup ("temp", "planetnoowner", "hgn_mothership"..playerIndex, distance) == 1 then   			               
				        --SobGroup_MoveToSobGroup("hgn_mothership"..playerIndex, "temp")			            
				        --break
				      --end  				      				           
			        --distance = distance + 1000				           		              
	          --end  		
	        --end                   		          
          
--setta tattica aggressiva x AI          
          --Player_SetDefaultShipTactic(playerIndex, AggressiveTactics)   
          
--attiva anti-radiation
          --SobGroup_AbilityActivate("supporter"..playerIndex, AB_DefenseFieldShield, 1)                           
             
--ru injection          
          if ((Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector") > (3 - CPULODvalueList[playerIndexList])) or 
             (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector") > (3 - CPULODvalueList[playerIndexList])) or 
             (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_ressourcecollector") > (3 - CPULODvalueList[playerIndexList])) or 
             (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_resourcecollector") > (3 - CPULODvalueList[playerIndexList]))) then
	          if Player_GetRU(playerIndex) < (500+(CPULODvalueList[playerIndexList]*100)) then   
	            if year > 50/gamespeedprogression then 
		          	Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (1200+(CPULODvalueList[playerIndexList]*100)+(aiaids*100))) 
		          elseif year > 40/gamespeedprogression then	
		            Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (1000+(CPULODvalueList[playerIndexList]*100)+(aiaids*100)))
		          elseif year > 30/gamespeedprogression then 
		            Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (800+(CPULODvalueList[playerIndexList]*100)+(aiaids*100)))    
		          elseif year > 20/gamespeedprogression then 
		            Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (600+(CPULODvalueList[playerIndexList]*100)+(aiaids*100)))  
		          else   
		            Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (400+(CPULODvalueList[playerIndexList]*100)+(aiaids*100)))
		          end       
		        end  
		      end  
          --print("AI is running for player index: "..playerIndex)
          
--military
					--intelligent auto
					if military == 6 then
						local wealth = 1
						if Player_GetRU(playerIndex) > RUMaxCapacityList[playerIndexList]*0.8 then
							wealth = 1
						elseif Player_GetRU(playerIndex) > RUMaxCapacityList[playerIndexList]*0.6 then
							wealth = 0.8
						elseif Player_GetRU(playerIndex) > RUMaxCapacityList[playerIndexList]*0.4 then
							wealth = 0.6
						elseif Player_GetRU(playerIndex) > RUMaxCapacityList[playerIndexList]*0.2 then
							wealth = 0.4
						else
							wealth = 0.2
						end
						local guerrilla = 1
						if fighter[playerIndexList] + corvette[playerIndexList] > armedcapital[playerIndexList] * 5 then
							guerrilla = 1
						elseif fighter[playerIndexList] + corvette[playerIndexList] > armedcapital[playerIndexList] * 4 then
							guerrilla = 0.8
						elseif fighter[playerIndexList] + corvette[playerIndexList] > armedcapital[playerIndexList] * 3 then
							guerrilla = 0.6
						elseif fighter[playerIndexList] + corvette[playerIndexList] > armedcapital[playerIndexList] * 2 then
							guerrilla = 0.4
						elseif fighter[playerIndexList] + corvette[playerIndexList] > armedcapital[playerIndexList] * 1 then
							guerrilla = 0.2
						else
							guerrilla = 0.1
						end
						local blitz = 1
						if frigate[playerIndexList] > pilotpopdisplayList[playerIndexList] * 0.8 then
							blitz = 1
						elseif frigate[playerIndexList] > pilotpopdisplayList[playerIndexList] * 0.6 then
							blitz = 0.8
						elseif frigate[playerIndexList] > pilotpopdisplayList[playerIndexList] * 0.4 then
							blitz = 0.6
						elseif frigate[playerIndexList] > pilotpopdisplayList[playerIndexList] * 0.2 then
							blitz = 0.4
						elseif frigate[playerIndexList] > pilotpopdisplayList[playerIndexList] * 0.1 then
							blitz = 0.2
						else
							blitz = 0
						end
						local new_strategy = floor( (guerrilla+0.2*CPULODvalueList[playerIndexList])/wealth + blitz*CPULODvalueList[playerIndexList] )
						if new_strategy > 5 then
							new_strategy = 5
						elseif new_strategy < 1 then
							new_strategy = 1
						end
						if military_list[playerIndexList] ~= new_strategy then
							military_list[playerIndexList] = new_strategy
							local strategy_name = {"Steamroller", "Attrition", "Manoeuvre", "Blitz", "Guerrilla"}
							print(""..strategy_name[military_list[playerIndexList]].." strategy set for player index: "..playerIndex..", game year: "..year)	--..", gamespeedprogression: "..gamespeedprogression..", Universe_GameTime(): "..Universe_GameTime()
						end
					end
					--switch subsystems for ai function part
					if SobGroup_Empty("supporter"..playerIndex) == 0 then
						if military_list[playerIndexList] == 5 then
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") == 0 then
								SobGroup_CreateSubSystem("supporter"..playerIndex, "military2")
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military1", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military0", 0)
							end
						elseif military_list[playerIndexList] == 4 then
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") == 0 then
								SobGroup_CreateSubSystem("supporter"..playerIndex, "military1")
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military2", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military0", 0)
							end
						elseif military_list[playerIndexList] == 3 then
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military2", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military1", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military0", 0)
							end
						elseif military_list[playerIndexList] == 2 then
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") == 0 then
								SobGroup_CreateSubSystem("supporter"..playerIndex, "military")
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military2", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military1", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military0", 0)
							end
						elseif military_list[playerIndexList] == 1 then
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") == 0 then
								SobGroup_CreateSubSystem("supporter"..playerIndex, "military0")
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military2", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military1", 0)
							end
							if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") > 0 then
								SobGroup_SetHardPointHealth("supporter"..playerIndex, "military", 0)
							end
						end
					end
          
--Hiigaran                       
          if Player_GetRace(playerIndex) == Race_Hiigaran then 

--crate hunt
						AI_CrateHunter(playerIndex, {"hgn_scout", "hgn_interceptor", "hgn_interceptorl", "hgn_probe"}, 10000+15000*CPULODvalueList[playerIndexList], 1+2*CPULODvalueList[playerIndexList])

--init
            if year < 10 and startwith ~= 6 and startwith ~= 7 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 1 then
              if SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Production 3") > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultfrigate") <= (2 + CPULODvalueList[playerIndexList]) then 
                SobGroup_CreateShip_Smart("hgn_mothership"..playerIndex, "hgn_assaultfrigate")
              elseif SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Production 2") > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvette") <= (2 + CPULODvalueList[playerIndexList]) then 
                SobGroup_CreateShip_Smart("hgn_mothership"..playerIndex, "hgn_assaultcorvette")
              elseif SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Production 1") > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptor") <= (2 + CPULODvalueList[playerIndexList]) then 
                SobGroup_CreateShip_Smart("hgn_mothership"..playerIndex, "hgn_interceptor")
              end      
            end

--scout
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_probe") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scout") < Player_CountEnemies(playerIndex) + CPULODvalueList[playerIndexList] then
              local rand=random_pseudo(0,100)
              if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 1 then
              	if rand > 30 then
                	SobGroup_CreateShip_Smart("hgn_mothership"..playerIndex, "hgn_scout")
                else
                	SobGroup_CreateShip_Smart("hgn_mothership"..playerIndex, "hgn_probe")
                end
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard") >= 1 then
                if rand > 30 then
                	SobGroup_CreateShip_Smart("hgn_shipyard"..playerIndex, "hgn_scout")
                else
                	SobGroup_CreateShip_Smart("hgn_shipyard"..playerIndex, "hgn_probe")
                end
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier") >= 1 then
              	if rand > 30 then
                	SobGroup_CreateShip_Smart("hgn_carrier"..playerIndex, "hgn_scout")
                else
                	SobGroup_CreateShip_Smart("hgn_carrier"..playerIndex, "hgn_probe")
                end
              end
            end

--late game anti debris
            if year > 10 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector") <= CPULODvalueList[playerIndexList] then
            	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 1 then
                SobGroup_CreateShip_Smart("hgn_mothership"..playerIndex, "hgn_resourcecollector")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard") >= 1 then
                SobGroup_CreateShip_Smart("hgn_shipyard"..playerIndex, "hgn_resourcecollector")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier") >= 1 then
                SobGroup_CreateShip_Smart("hgn_carrier"..playerIndex, "hgn_resourcecollector")
              end
            end
          
--costruzione forzata 
	--SY
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard") == 0 and year/gamespeedprogression >= 10 then
              if costruzioneforzata("hgn_shipyard", 1, playerIndex, "isai", 2500, 40, 3, 80, 1, "hgn_mothership", "Weight") == 1 then
              elseif costruzioneforzata("hgn_battleshipyard", 1, playerIndex, "isai", 5000, 60, 6, 80, 1, "hgn_mothership", "Weight") == 1 then
              end
	--S
	          elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scaver") == 0 and year/gamespeedprogression >= 8 then
              if costruzioneforzata("hgn_scaver", 2, playerIndex, "isai", 600, 0, 0, 0, 1, "hgn_mothership", "Weight") == 1 then
              end  
	--RC      
	          elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector") < 4 then
              if costruzioneforzata("hgn_resourcecollector", 1, playerIndex, "isai", 100, 0, 0, 0, 4, "hgn_mothership", "Weight") == 1 then
              end   							
	--RS
            elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") == 0 and year/gamespeedprogression >= 4 then
              if costruzioneforzata("hgn_researchstation", 2, playerIndex, "isai", 700, 0, 0, 0, 1, "hgn_mothership", "Weight") == 1 then
              end    
  --PS
            elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") == 0 and year/gamespeedprogression >= 7 then
              if costruzioneforzata("hgn_power", 2, playerIndex, "isai", 900, 0, 0, 0, 1, "hgn_mothership", "Weight") == 1 then
              end                       
	--CS              
            elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") == 0 and year/gamespeedprogression >= 6 and SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") > 0 then
              if costruzioneforzata("hgn_crewstation", 2, playerIndex, "isai", 800, 0, 0, 0, 1, "hgn_mothership", "Weight") == 1 then
              end      
              
            end

	--TC                      
            if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_transportcell") == 0 then
              SobGroup_CreateShip_Smart("hgn_crewstation"..playerIndex, "hgn_transportcell")
            end
            
	--WS        
						if SobGroup_Count("hgn_combatbase"..playerIndex) >= 1 and year/gamespeedprogression >= 10 then
						  if (SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "hgn_combatbase"..playerIndex, 5500) == 1) and						     
								 (SobGroup_IsDoingAbility("hgn_combatbase"..playerIndex, abilityList[2]) == 1) then
						    if costruzioneforzata("hgn_tangomine_ws", 3, playerIndex, "canbuildminems", 2500, 0, 0, 0, 6, "hgn_combatbase", "Weight") == 1 then
	              end 
						  elseif SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "hgn_combatbase"..playerIndex, 20000) == 1 then
						    if costruzioneforzata("hgn_viper_ws", 3, playerIndex, "canbuildmissilems", 2500, 0, 0, 0, 6, "hgn_combatbase", "Weight") == 1 then
							  end	               
              end  
            end
  --MS
            if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 and year/gamespeedprogression >= 10 then
						  if (SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "hgn_mothership"..playerIndex, 5500) == 1) and						     
								 (SobGroup_IsDoingAbility("hgn_mothership"..playerIndex, abilityList[2]) == 1) then
						    if costruzioneforzata("hgn_tangomine", 3, playerIndex, "canbuildminems", 2000, 0, 0, 0, 6, "hgn_mothership", "Weight") == 1 then
	              end 
						  elseif SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "hgn_mothership"..playerIndex, 20000) == 1 then
						    if costruzioneforzata("hgn_viper", 3, playerIndex, "canbuildmissilems", 2000, 0, 0, 0, 6, "hgn_mothership", "Weight") == 1 then
							  end	               
              end              
            end                 
            
--heavy ion cannon attack
						AI_AutoEngageEnemyCapital("hgn_mothership"..playerIndex, "Weapon 2", 30000)
--command fortress self defense
						AI_AutoEngageEnemyCapital("hgn_commandfortress"..playerIndex, "Generic 1", 10000)
--ark self defense
						AI_AutoEngageEnemyCapital("hgn_ark"..playerIndex, "experience", 15000)
--battleshipyard self defense
						AI_AutoEngageEnemyCapital("hgn_battleshipyard"..playerIndex, "experience", 20000)
--battlecarrier self defense
						AI_AutoEngageEnemyCapital("hgn_battlecarrier"..playerIndex, "experience", 10000)
            
	--Fleet            
            if costruzioneforzata    ("hgn_ark",               4, playerIndex, "instanttech1",            5500, 50, 6, 240, -1, "hgn_mothership", "Weight") == 1 then 
            elseif costruzioneforzata("hgn_commandfortress",   4, playerIndex, "instanttech1",            5500, 50, 6, 350, -1, "hgn_mothership", "Weight") == 1 then 
            elseif costruzioneforzata("hgn_battleship",        3, playerIndex, "BattleshipTech",          4500, 45, 5, 240, 2, "hgn_shipyard", "Production 4") == 1 then      
            elseif costruzioneforzata("hgn_vortex",            3, playerIndex, "VortexTech",              3000, 35, 4, 240, 2, "hgn_shipyard", "Production 4") == 1 then            
            elseif costruzioneforzata("hgn_battlecruiser",     3, playerIndex, "BattlecruiserIonWeapons", 1750, 25, 3, 150, 3, "hgn_shipyard", "Production 4") == 1 then
            elseif costruzioneforzata("hgn_battlecruiserNUKE", 3, playerIndex, "BattlecruiserNukeWeapons",1750, 25, 3, 480, 3, "hgn_shipyard", "Production 4") == 1 then
            elseif costruzioneforzata("hgn_cruiserb", 	       2, playerIndex, "CruiserTech",             2750, 23, 2, 0,   4, "hgn_mothership", "Production 4") == 1 then  
            elseif costruzioneforzata("hgn_cruisera", 	       2, playerIndex, "CruiserTech",             1050, 23, 2, 0,   4, "hgn_mothership", "Production 4") == 1 then  
            elseif costruzioneforzata("hgn_advdestroyer", 	   2, playerIndex, "AdvDestroyerTech",        950,  21, 1, 0,   4, "hgn_mothership", "Production 4") == 1 then  
            elseif costruzioneforzata("hgn_artillerydestroyer",2, playerIndex, "ArtilleryDestroyerTech",  950,  21, 1, 0,   4, "hgn_mothership", "Production 4") == 1 then                
            elseif costruzioneforzata("hgn_iondestroyer", 	   2, playerIndex, "IonDestroyerTech",        850,  18, 1, 0,   4, "hgn_mothership", "Production 4") == 1 then      
            elseif costruzioneforzata("hgn_missiledestroyer",  2, playerIndex, "MissileDestroyerTech",    850,  18, 1, 0,   4, "hgn_mothership", "Production 4") == 1 then           
            elseif costruzioneforzata("hgn_destroyer", 		     2, playerIndex, "DestroyerTech",           750,  15, 1, 0,   5, "hgn_mothership", "Production 4") == 1 then
            elseif costruzioneforzata("hgn_juggernaught",	     2, playerIndex, "JuggernaughtTech",        1500, 10, 1, 0,   3, "hgn_mothership", "Production 4") == 1 then              
            elseif costruzioneforzata("hgn_nuclearbomb",       3, playerIndex, "instanttech1",            6000, 0,  0, 0,   0, "hgn_commandfortress", "Generic 1") == 1 then  
            elseif costruzioneforzata("hgn_sentinel",          1, playerIndex, "Sentinel",                2800, 10, 1, 0,   3, "hgn_mothership", "Weight") == 1 then    
            elseif costruzioneforzata("hgn_ionsentinel",       1, playerIndex, "Sentinel",                2800, 10, 1, 0,   3, "hgn_mothership", "Weight") == 1 then
            elseif costruzioneforzata("hgn_cthionl",           1, playerIndex, "corvettesquadron5",       1750,  9,  0, 0,   6, "hgn_mothership", "Production 2") == 1 then
            elseif costruzioneforzata("hgn_cthl",              1, playerIndex, "corvettesquadron5",       750,  9,  0, 0,   6, "hgn_mothership", "Production 2") == 1 then 
            elseif costruzioneforzata("hgn_gunshipcoevettel",  1, playerIndex, "corvettesquadron5",       750,  9,  0, 0,   6, "hgn_mothership", "Production 2") == 1 then
            elseif costruzioneforzata("hgn_multiguncorvettel", 1, playerIndex, "corvettesquadron5",       650,  9,  0, 0,   6, "hgn_mothership", "Production 2") == 1 then              
            elseif costruzioneforzata("hgn_hftl",              1, playerIndex, "fightersquadron7",        650,  7,  0, 0,   6, "hgn_mothership", "Production 1") == 1 then
            elseif costruzioneforzata("hgn_attackbomberheavyl",1, playerIndex, "fightersquadron7",        650,  7,  0, 0,   6, "hgn_mothership", "Production 1") == 1 then                             
            elseif costruzioneforzata("hgn_rts",               1, playerIndex, "RTS",                     1400, 5,  0, 0,   3, "hgn_mothership", "Weight") == 1 then        
            elseif costruzioneforzata("hgn_missileturret",     1, playerIndex, "PlatformMissileWeapons",  850,  4,  0, 0,   6, "hgn_mothership", "Weight") == 1 then           
            elseif costruzioneforzata("hgn_ionturret",         1, playerIndex, "PlatformIonWeapons1",     650,  3,  0, 0,   6, "hgn_mothership", "Weight") == 1 then   
            elseif costruzioneforzata("hgn_pulsarturret",      1, playerIndex, "PlatformIonWeapons",      550,  2,  0, 0,   6, "hgn_mothership", "Weight") == 1 then   
            elseif costruzioneforzata("hgn_gunturret",         1, playerIndex, "canbuildgunplatforms",    450,  1,  0, 0,   6, "hgn_mothership", "Weight") == 1 then   
            --elseif costruzioneforzata("hgn_tangomine",         2, playerIndex, "canbuildminems",          700,  0,  0, 0,   6, "hgn_mothership", "Weight") == 1 then   
            end     

--Parade						
--Platforms
						if Player_CanResearch(playerIndex, "PlatformRefuelingUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "PlatformRefuelingUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "PlatformRefuelingUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "PlatformRefuelingUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "PlatformRefuelingUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	            Player_Research_Smart( playerIndex , "PlatformRefuelingUpgrade1" )
	          elseif Player_CanResearch(playerIndex, "PlatformRefueling" ) == 1 and Player_GetRU(playerIndex) > 600 then              
              Player_Research_Smart( playerIndex , "PlatformRefueling" ) 
	          end
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") > 0 then             
	            if SobGroup_FillProximitySobGroup ("temp", "hgn_sentinel"..playerIndex, "hgn_mothership"..playerIndex, 7000) == 1 then 
	              SobGroup_ParadeSobGroup("temp", "hgn_mothership"..playerIndex, 0)
	            end   
	            if SobGroup_FillProximitySobGroup ("temp", "hgn_ionsentinel"..playerIndex, "hgn_mothership"..playerIndex, 7000) == 1 then 
	              SobGroup_ParadeSobGroup("temp", "hgn_mothership"..playerIndex, 0)
	            end   
	            if SobGroup_FillProximitySobGroup ("temp", "hgn_artillerysentinel"..playerIndex, "hgn_mothership"..playerIndex, 7000) == 1 then 
	              SobGroup_ParadeSobGroup("temp", "hgn_mothership"..playerIndex, 0)
	            end     
	            if SobGroup_FillProximitySobGroup ("temp", "hgn_rts"..playerIndex, "hgn_mothership"..playerIndex, 7000) == 1 then 
	              SobGroup_ParadeSobGroup("temp", "hgn_mothership"..playerIndex, 0)
	            end            
		        --end  		        
--Research Station                    
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") > 0 then               
              SobGroup_ParadeSobGroup("hgn_researchstation"..playerIndex, "hgn_mothership"..playerIndex, 0)  
            end            
--Power Station                    
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") > 0 then               
              SobGroup_ParadeSobGroup("hgn_power"..playerIndex, "hgn_mothership"..playerIndex, 0)  
            end           
--Crew Station                    
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then               
              SobGroup_ParadeSobGroup("hgn_crewstation"..playerIndex, "hgn_mothership"..playerIndex, 0)  
            end          
--Weapon Station
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase") > 0 then               
              SobGroup_ParadeSobGroup("hgn_combatbase"..playerIndex, "hgn_mothership"..playerIndex, 0)  
            end
	elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard") > 0 then
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") > 0 then 
			SobGroup_ParadeSobGroup("hgn_researchstation"..playerIndex, "hgn_shipyard"..playerIndex, 0) 
		end
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") > 0 then
 			SobGroup_ParadeSobGroup("hgn_power"..playerIndex, "hgn_shipyard"..playerIndex, 0) 
 		end
 		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then   
			SobGroup_ParadeSobGroup("hgn_crewstation"..playerIndex, "hgn_shipyard"..playerIndex, 0) 
		end
	elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecarrier") > 0 then
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") > 0 then 
			SobGroup_ParadeSobGroup("hgn_researchstation"..playerIndex, "hgn_battlecarrier"..playerIndex, 0) 
		end
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") > 0 then
 			SobGroup_ParadeSobGroup("hgn_power"..playerIndex, "hgn_battlecarrier"..playerIndex, 0) 
 		end
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then 
			SobGroup_ParadeSobGroup("hgn_crewstation"..playerIndex, "hgn_battlecarrier"..playerIndex, 0) 
		end
	elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier") > 0 then
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") > 0 then 
			SobGroup_ParadeSobGroup("hgn_researchstation"..playerIndex, "hgn_carrier"..playerIndex, 0) 
		end
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") > 0 then
 			SobGroup_ParadeSobGroup("hgn_power"..playerIndex, "hgn_carrier"..playerIndex, 0) 
 		end
 		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then   
			SobGroup_ParadeSobGroup("hgn_crewstation"..playerIndex, "hgn_carrier"..playerIndex, 0) 
		end
	elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ark") > 0 then
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") > 0 then 
			SobGroup_ParadeSobGroup("hgn_researchstation"..playerIndex, "hgn_ark"..playerIndex, 0) 
		end
		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") > 0 then
 			SobGroup_ParadeSobGroup("hgn_power"..playerIndex, "hgn_ark"..playerIndex, 0) 
 		end
 		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then   
			SobGroup_ParadeSobGroup("hgn_crewstation"..playerIndex, "hgn_ark"..playerIndex, 0) 
		end
	elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress") > 0 then
 		if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then   
			SobGroup_ParadeSobGroup("hgn_crewstation"..playerIndex, "hgn_commandfortress"..playerIndex, 0) 
		end
	end 
	
--Mothership Core
						if SobGroup_Count("hgn_hscore"..playerIndex) > 0 then 
						
							if SobGroup_AreAllInHyperspace("hgn_hscore"..playerIndex) == 1 then
							  local PlayerTotal = Universe_PlayerCount()
								local P_idx = 0
								local limiter = random_pseudo(PlayerTotal,PlayerTotal*2)
								for i=0,limiter,1 do
									if SobGroup_AreAllInHyperspace("hgn_hscore"..playerIndex) == 1 then
										P_idx = random_pseudo(0,PlayerTotal-1)
										if AreAllied(P_idx, playerIndex) == 1 or P_idx == playerIndex then
											local ran=random_pseudo(0,60)
											if ran < 30 and SobGroup_Empty("utilities"..P_idx) == 0 then
												SobGroup_ExitHyperSpaceSobGroup("hgn_hscore"..playerIndex, "utilities"..P_idx, random_pseudo(200,1000))
												print("Hyperspace Core owned by player index: "..playerIndex.." is exiting hyperspace around utilities owned by player index: "..P_idx..", game year: "..year)
											elseif ran <= 60 and SobGroup_Empty("productioncapital"..P_idx) == 0 then
												SobGroup_ExitHyperSpaceSobGroup("hgn_hscore"..playerIndex, "productioncapital"..P_idx, random_pseudo(1000,2000))
												print("Hyperspace Core owned by player index: "..playerIndex.." is exiting hyperspace around productioncapital owned by player index: "..P_idx..", game year: "..year)
											elseif SobGroup_Empty("fcdocker"..P_idx) == 0 then
												SobGroup_ExitHyperSpaceSobGroup("hgn_hscore"..playerIndex, "fcdocker"..P_idx, random_pseudo(1000,2000))
												print("Hyperspace Core owned by player index: "..playerIndex.." is exiting hyperspace around fcdocker owned by player index: "..P_idx..", game year: "..year)
											elseif i == limiter then
												Volume_AddSphere("CoreHyperspaceVolume"..playerIndex, {random_pseudo(-20000,20000), random_pseudo(-20000,20000), random_pseudo(-20000,20000),}, random_pseudo(3000,10000))
												SobGroup_ExitHyperSpace("hgn_hscore"..playerIndex, "CoreHyperspaceVolume"..playerIndex)
												Volume_Delete("CoreHyperspaceVolume"..playerIndex)
												print("Hyperspace Core owned by player index: "..playerIndex.." is exiting hyperspace at random location, game year: "..year)
											end
										end
									end
								end
							end
						
							if SobGroup_HealthPercentage("hgn_hscore"..playerIndex) >= 0.5 + random_pseudo(0,50)/100 then
								local capitalnum = SobGroup_Count("productioncapital"..playerIndex)
								if capitalnum > 0 then
									SobGroup_ParadeSobGroup("hgn_hscore"..playerIndex, "productioncapital"..playerIndex, 0) 
								end
							else
								if SobGroup_AreAllInRealSpace("hgn_hscore"..playerIndex) == 1 and SobGroup_UnderAttack("hgn_hscore"..playerIndex) == 1 and Player_GetRU(playerIndex) > 200 then
									SobGroup_EnterHyperSpaceOffMap("hgn_hscore"..playerIndex)
									print("Hyperspace Core owned by player index: "..playerIndex.." is entering hyperspace to survive damage, game year: "..year)
								end
							end

						end

		--Crew Station rank aid
					if SobGroup_Count("hgn_crewstation"..playerIndex) > 0 and SobGroup_IsDoingAbility("hgn_crewstation"..playerIndex, AB_Builder) == 0 and random_pseudo(0,100) <= CPULODvalueList[playerIndexList] * aiaids and year > 11 - CPULODvalueList[playerIndexList] then

			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 and SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isAdmiral") > 0 then
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

			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 and SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommodore") > 0 then
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

			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 and SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCaptain") > 0 then
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
			      
			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 and SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommander") > 0 then
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

			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") > 0 and SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isLieutenant") > 0 then
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

			      if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") > 0 and SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isEnsign") > 0 then
			      	if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isLieutenant") == 0 then
			        	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "hgn_isLieutenantCore")     
			        end
				      if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "Generic 1") == 0 and SobGroup_IsBuilding("hgn_crewstation"..playerIndex, "Hgn_PilotModule") == 0 then
				      	SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule")
				      end
			      end  
			       
			    end

--ricerca tech forzata
            if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 then  
	            if Player_CanResearch(playerIndex, "DestroyerTech" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	              Player_Research_Smart( playerIndex , "DestroyerTech" )
	            end          
	            if Player_CanResearch(playerIndex, "ImprovedDestroyerArmour" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	              Player_GrantResearchOption_Smart( playerIndex , "ImprovedDestroyerArmour" )
	            end   
	            if SobGroup_Count("hgn_tanker"..playerIndex) > 0 and Player_CanResearch(playerIndex, "ImprovedTankerArmour" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_GrantResearchOption_Smart( playerIndex , "ImprovedTankerArmour" )
	            end
            end    
            if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then
              if Player_CanResearch(playerIndex, "BattlecruiserIonWeapons" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	              Player_Research_Smart( playerIndex , "BattlecruiserIonWeapons" )
	            end    
	            if Player_CanResearch(playerIndex, "VortexTech" ) == 1 and Player_GetRU(playerIndex) > 2250 then
	              Player_Research_Smart( playerIndex , "VortexTech" )
	            end   
	            if Player_CanResearch(playerIndex, "BattleshipTech" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	              Player_Research_Smart( playerIndex , "BattleshipTech" )
	            end           
              if Player_CanResearch(playerIndex, "FrigateAfterburnerAI" ) == 1 and Player_GetRU(playerIndex) > 2900 then
              	Player_Research_Smart( playerIndex , "FrigateAfterburnerAI" )
              end
            end          
            
--Final crazy
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then
              if Player_CanResearch(playerIndex, "CapitalAfterburnerAI" ) == 1 and Player_GetRU(playerIndex) > 5000 then
              	Player_Research_Smart( playerIndex , "CapitalAfterburnerAI" )
              end
              if Player_CanResearch(playerIndex, "BlackholeTech") == 1 and ( Player_GetRU(playerIndex) > 15000 or year > (50 - (CPULODvalueList[playerIndexList]*2)) ) then
              	Player_Research_Smart( playerIndex , "BlackholeTech")
              end
            end
                         
---Fleet            
            if Player_CanResearch(playerIndex, "CapitalRetire" ) == 1 and Player_GetRU(playerIndex) > 500 then
              Player_Research_Smart( playerIndex , "CapitalRetire" )
            end 
            if Player_CanResearch(playerIndex, "HyperspaceCostUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 1000 then
              Player_Research_Smart( playerIndex , "HyperspaceCostUpgrade2" )
            elseif Player_CanResearch(playerIndex, "HyperspaceCostUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 500 then
              Player_Research_Smart( playerIndex , "HyperspaceCostUpgrade1" )
            end 
            if Player_CanResearch(playerIndex, "crewcellcargo3" ) == 1 and Player_GetRU(playerIndex) > 600 then
              Player_Research_Smart( playerIndex , "crewcellcargo3" )
            elseif Player_CanResearch(playerIndex, "crewcellcargo2" ) == 1 and Player_GetRU(playerIndex) > 400 then
              Player_Research_Smart( playerIndex , "crewcellcargo2" )
            elseif Player_CanResearch(playerIndex, "crewcellcargo1" ) == 1 and Player_GetRU(playerIndex) > 200 then
              Player_Research_Smart( playerIndex , "crewcellcargo1" )
            end 
						if Player_CanResearch(playerIndex, "maintenance3" ) == 1 and Player_GetRU(playerIndex) > 4000 then
              Player_Research_Smart( playerIndex , "maintenance3" )
            elseif Player_CanResearch(playerIndex, "maintenance2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
              Player_Research_Smart( playerIndex , "maintenance2" )
            elseif Player_CanResearch(playerIndex, "maintenance1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
              Player_Research_Smart( playerIndex , "maintenance1" )
            end 		
						--EVO
            if SobGroup_Empty("star_sol") == 0 then
              if Player_CanResearch(playerIndex, "CapitalSpeedUpgrade3" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "CapitalSpeedUpgrade3" )
							elseif Player_CanResearch(playerIndex, "CapitalSpeedUpgrade2" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "CapitalSpeedUpgrade2" )
							elseif Player_CanResearch(playerIndex, "CapitalSpeedUpgrade1" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "CapitalSpeedUpgrade1" )
							end							
							if Player_CanResearch(playerIndex, "HyperspaceCostUpgrade3" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "HyperspaceCostUpgrade3" )
							elseif Player_CanResearch(playerIndex, "HyperspaceCostUpgrade2" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "HyperspaceCostUpgrade2" )
							elseif Player_CanResearch(playerIndex, "HyperspaceCostUpgrade1" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "HyperspaceCostUpgrade1" )
							end								
            end						 
--capital            
	          if Player_CanResearch(playerIndex, "CapitalHealthUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 4500 then
	            Player_Research_Smart( playerIndex , "CapitalHealthUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "CapitalHealthUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "CapitalHealthUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "CapitalHealthUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "CapitalHealthUpgrade1" )
	          end 					
	--frigate	             
	          if Player_CanResearch(playerIndex, "FrigateHealthUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 2250 then
	            Player_Research_Smart( playerIndex , "FrigateHealthUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "FrigateHealthUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	            Player_Research_Smart( playerIndex , "FrigateHealthUpgrade1" )
	          end  				
---Mothership                                                  
            if Player_CanResearch(playerIndex, "ImprovedTorpedoMothership" ) == 1 then
              Player_Research_Smart( playerIndex , "ImprovedTorpedoMothership" )
            end             
            if Player_CanResearch(playerIndex, "hic1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
              Player_Research_Smart( playerIndex , "hic1" )              
            end 
            if Player_CanResearch(playerIndex, "hic2" ) == 1 and Player_GetRU(playerIndex) > 3000 then
              Player_Research_Smart( playerIndex , "hic2" )              
            end   						
---Collector               
            if Player_CanResearch(playerIndex, "ResourceCollectorRURATEUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 400 then
              Player_Research_Smart( playerIndex , "ResourceCollectorRURATEUpgrade1" )              
            end
            if Player_CanResearch(playerIndex, "ResourceCollectorRUCAPUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 500 then              
              Player_Research_Smart( playerIndex , "ResourceCollectorRUCAPUpgrade1" )              
            end       
            if Player_CanResearch(playerIndex, "ResourceCollectorRUDROPOFFUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 600 then              
              Player_Research_Smart( playerIndex , "ResourceCollectorRUDROPOFFUpgrade1" )              
            end         
	          if Player_CanResearch(playerIndex, "UtilitySpeedUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	            Player_Research_Smart( playerIndex , "UtilitySpeedUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "UtilitySpeedUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	            Player_Research_Smart( playerIndex , "UtilitySpeedUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "UtilitySpeedUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 600 then              
              Player_Research_Smart( playerIndex , "UtilitySpeedUpgrade1" ) 
	          end
            if Player_CanResearch(playerIndex, "resourcecollectorextraction1" ) == 1 and Player_GetRU(playerIndex) > 800 then              
              Player_Research_Smart( playerIndex , "resourcecollectorextraction1" )              
            end
            if Player_CanResearch(playerIndex, "ProbeRefuelingUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "ProbeRefuelingUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "ProbeRefuelingUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	            Player_Research_Smart( playerIndex , "ProbeRefuelingUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "ProbeRefuelingUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	            Player_Research_Smart( playerIndex , "ProbeRefuelingUpgrade1" )
	          elseif Player_CanResearch(playerIndex, "ProbeRefueling" ) == 1 and Player_GetRU(playerIndex) > 500 then
              Player_Research_Smart( playerIndex , "ProbeRefueling" ) 
	          end

--Weapon
	          if Player_CanResearch(playerIndex, "WeaponSpeedUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 4000 then
	            Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "WeaponSpeedUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "WeaponSpeedUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade1" )
	          end
	          if Player_CanResearch(playerIndex, "WeaponImpactUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 5000 then
	            Player_Research_Smart( playerIndex , "WeaponImpactUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "WeaponImpactUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 4000 then
	            Player_Research_Smart( playerIndex , "WeaponImpactUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "WeaponImpactUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "WeaponImpactUpgrade1" )
	          end

---Nuclear Bomb
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nuclearbomb") > 0 then
              if year > (60/gamespeedprogression - (CPULODvalueList[playerIndexList]*2)) then               
		          	if Player_CanResearch(playerIndex, "NBDetonationPower" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationPower" )
		            end   
		            if Player_CanResearch(playerIndex, "NBDetonationPower1" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationPower1" )
		            end   
		            if Player_CanResearch(playerIndex, "NBDetonationPower2" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationPower2" )
		            end              
		            if Player_CanResearch(playerIndex, "NBDetonationRange" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationRange" )
		            end   
		            if Player_CanResearch(playerIndex, "NBDetonationRange1" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationRange1" )
		            end   
		            if Player_CanResearch(playerIndex, "NBDetonationRange2" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationRange2" )
		            end            
		          elseif year > (40/gamespeedprogression - (CPULODvalueList[playerIndexList]*2)) then	
		            if Player_CanResearch(playerIndex, "NBDetonationPower" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationPower" )
		            end   
		            if Player_CanResearch(playerIndex, "NBDetonationPower1" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationPower1" )
		            end   		                    
		            if Player_CanResearch(playerIndex, "NBDetonationRange" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationRange" )
		            end   
		            if Player_CanResearch(playerIndex, "NBDetonationRange1" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationRange1" )
		            end   		                   
		          elseif year > (20/gamespeedprogression - (CPULODvalueList[playerIndexList]*2)) then 
		            if Player_CanResearch(playerIndex, "NBDetonationPower" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationPower" )
		            end  		                                
		            if Player_CanResearch(playerIndex, "NBDetonationRange" ) == 1 then
		              Player_Research_Smart( playerIndex , "NBDetonationRange" )
		            end   		    		          
		          end       
            end   
						
---elimina unit?superflue
            if year > (22/gamespeedprogression - (CPULODvalueList[playerIndexList]*2)) then
						  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sentinel") >= 2 and
						     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionsentinel") >= 2 then
								SobGroup_TakeDamage("hgn_gunturret"..playerIndex, 1)
								SobGroup_TakeDamage("hgn_pulsarturret"..playerIndex, 1)
								SobGroup_TakeDamage("hgn_ionturret"..playerIndex, 1)
								SobGroup_TakeDamage("hgn_missileturret"..playerIndex, 1)								
							end	 
							if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier") > 0 or
						     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecarrier") > 0 then
								SobGroup_TakeDamage("hgn_lightcarrier"..playerIndex, 1)													
							end	 						
						end            						
            
--Docking MS -> SY
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") > 0 and
              --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard_g") > 0 and 
              --SobGroup_GetDistanceToSobGroup("hgn_mothership"..playerIndex, "hgn_shipyard"..playerIndex) < 12500 and
              year >= (22/gamespeedprogression-(CPULODvalueList[playerIndexList]*3)) and
              Player_GetRU(playerIndex) > (3500-(CPULODvalueList[playerIndexList]*300)) and
              SobGroup_GetHardPointHealth("hgn_researchstation"..playerIndex, "Generic 3") > 0 and
              SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 1") > 0 and
              SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2") > 0 and
              SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 3") > 0 and
              SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 7") > 0 and
              SobGroup_UnderAttack("hgn_mothership"..playerIndex) == 0 and
              SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "poh2") == 0 then
              
              SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "poh2")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "HGN_SCC_6xAC_Turret_cf1")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "HGN_SCC_6xAC_Turret_cf2")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "HGN_SCC_6xAC_Turret_cf3")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "HGN_SCC_6xAC_Turret_cf4")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_ms_nuclear")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_ms_armor_bottom")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_ms_armor_top")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_ms_armor_bridge")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_ms_armor_engine")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_ms_armor_plates")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_cf_ionbeamturret2")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_cf_ionbeamturret3")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_cf_ionbeamturret4")
			        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_cf_ionbeamturret5")
			        Ping_LabelVisible(Ping_AddSobGroup("Adv. Pride of Hiigara (Battle Asset)", "name", "hgn_mothership"..playerIndex), 1)              
            end                                
                             
--Vaygr------------------------------------------------------------------------------------------------------       
     
          elseif Player_GetRace(playerIndex) == Race_Vaygr then
          	
--crate hunt
						AI_CrateHunter(playerIndex, {"vgr_scout", "vgr_interceptor", "vgr_probe"}, 10000+15000*CPULODvalueList[playerIndexList], 1+2*CPULODvalueList[playerIndexList])
						
--need more RUs for Vaygr
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector") >=5 then
			        local CurrentRU = Player_GetRU(playerIndex)
							if CurrentRU == 0 then
								local ResourceAids = (aiaids-1)*200*CPULODvalueList[playerIndexList]
								if ResourceAids > 0 then
									Player_SetRU(playerIndex, CurrentRU + ResourceAids)
								end
							end
			      end
			      
			      
--init          
            if year < 10 and startwith ~=6 and startwith ~=7 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") == 1 then
              if SobGroup_GetHardPointHealth("vgr_mothership"..playerIndex, "Production 3") > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_assaultfrigate") <= (2 + CPULODvalueList[playerIndexList]) then 
                SobGroup_CreateShip_Smart("vgr_mothership"..playerIndex, "vgr_assaultfrigate")  
              elseif SobGroup_GetHardPointHealth("vgr_mothership"..playerIndex, "Production 2") > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilecorvette") <= (2 + CPULODvalueList[playerIndexList]) then 
                SobGroup_CreateShip_Smart("vgr_mothership"..playerIndex, "vgr_missilecorvette")            
              elseif SobGroup_GetHardPointHealth("vgr_mothership"..playerIndex, "Production 1") > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_interceptor") <= (2 + CPULODvalueList[playerIndexList]) then 
                SobGroup_CreateShip_Smart("vgr_mothership"..playerIndex, "vgr_interceptor")      
              end      
            end

--scout
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scout") < Player_CountEnemies(playerIndex) + CPULODvalueList[playerIndexList] then
              local rand=random_pseudo(0,100)
              if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") == 1 then
              	if rand > 30 then
                	SobGroup_CreateShip_Smart("vgr_mothership"..playerIndex, "vgr_scout")
                else
                	SobGroup_CreateShip_Smart("vgr_mothership"..playerIndex, "vgr_probe")
                end
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard") >= 1 then
                if rand > 30 then
                	SobGroup_CreateShip_Smart("vgr_shipyard"..playerIndex, "vgr_scout")
                else
                	SobGroup_CreateShip_Smart("vgr_shipyard"..playerIndex, "vgr_probe")
                end
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier") >= 1 then
              	if rand > 30 then
                	SobGroup_CreateShip_Smart("vgr_carrier"..playerIndex, "vgr_scout")
                else
                	SobGroup_CreateShip_Smart("vgr_carrier"..playerIndex, "vgr_probe")
                end
              end
            end
            
--late game anti debris
            if year > 10 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector") <= CPULODvalueList[playerIndexList] then
            	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") == 1 then
                SobGroup_CreateShip_Smart("vgr_mothership"..playerIndex, "vgr_resourcecollector")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard") >= 1 then
                SobGroup_CreateShip_Smart("vgr_shipyard"..playerIndex, "vgr_resourcecollector")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier") >= 1 then
                SobGroup_CreateShip_Smart("vgr_carrier"..playerIndex, "vgr_resourcecollector")
              end
            end
--costruzione forzata    
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard") == 0 and year/gamespeedprogression >= 5 then
              if costruzioneforzata("vgr_shipyard", 1, playerIndex, "isai", 2000, 40, 3, 80, 1, "vgr_mothership", "Weight") == 1 then
              end
							
						elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector") < 4 then
              if costruzioneforzata("vgr_resourcecollector", 1, playerIndex, "isai", 100, 0, 0, 0, 4, "vgr_mothership", "Weight") == 1 then
              end   							
            end 

            if costruzioneforzata    ("vgr_superbattleship", 		     		   4, playerIndex, "TitanTech",      					 9500,  50, 6, 350, 1, "vgr_mothership", "Weight") == 1 then
            elseif costruzioneforzata    ("vgr_commandfortress", 		       4, playerIndex, "CommandFortressTech",      5250,  50, 6, 350, 1, "vgr_mothership", "Weight") == 1 then
            elseif costruzioneforzata    ("vgr_missledreadnaught", 		       4, playerIndex, "TitanTech",      			 9500,  40, 3, 350, 1, "vgr_mothership", "Weight") == 1 then
            elseif costruzioneforzata("vgr_battleship", 		             4, playerIndex, "TitanTech",           	 7500,  35, 3, 350, 3, "vgr_mothership", "Weight") == 1 then
            --
            elseif costruzioneforzata("vgr_alkhalid", 		             3, playerIndex, "BattleshipTech",           1950,  35, 3, 240, 3, "vgr_shipyard", "Production 4") == 1 then   
            elseif costruzioneforzata("vgr_dreadnaught",	             3, playerIndex, "DreadnaughtTech",          3500,  35, 3, 240, 3, "vgr_shipyard", "Production 4") == 1 then  
            elseif costruzioneforzata("vgr_battlecruiser", 		         3, playerIndex, "BattlecruiserIonWeapons",  1750,  25, 3, 150, 3, "vgr_shipyard", "Production 4") == 1 then
						elseif costruzioneforzata("vgr_battlecruiser_hero", 		   3, playerIndex, "BattlecruiserNukeWeapons", 4750,  25, 3, 480, 3, "vgr_shipyard", "Production 4") == 1 then
						elseif costruzioneforzata("vgr_missilebattlecruiser", 		 3, playerIndex, "MissileBattlecruiserIonWeapons",  2500,  25, 3, 150, 2, "vgr_shipyard", "Production 4") == 1 then							
						elseif costruzioneforzata("vgr_heavycruiser", 		 		  	 3, playerIndex, "PeacemakerTech", 					 2500,  30, 3, 150, 2, "vgr_shipyard", "Production 4") == 1 then
						elseif costruzioneforzata("Vgr_Sinner", 		 		  	 			 3, playerIndex, "SinnerTech", 					 		 2500,  30, 3, 80, 2, "vgr_shipyard", "Production 4") == 1 then
						elseif costruzioneforzata("vgr_artilleryship", 		         2, playerIndex, "ArtilleryTech", 					 1250,  20, 2, 0,   3, "vgr_shipyard", "Production 4") == 1 then   						
            elseif costruzioneforzata("vgr_cruiser", 		         			 2, playerIndex, "CruiserTech", 						 1250,  20, 2, 0,   3, "vgr_shipyard", "Production 4") == 1 then    
            elseif costruzioneforzata("vgr_lightcruiser_gun", 		     2, playerIndex, "IonCruiserTech", 					 1250,  20, 2, 0,   3, "vgr_shipyard", "Production 4") == 1 then
            elseif costruzioneforzata("vgr_am", 		                   2, playerIndex, "AMGuns",                   700,   12, 0, 0,   1, "vgr_shipyard", "Production 4") == 1 then 
            elseif costruzioneforzata("vgr_pulsedestroyer", 		       2, playerIndex, "PulseDestroyerGuns",       850,   15, 1, 0,   4, "vgr_shipyard", "Production 4") == 1 then       						
            elseif costruzioneforzata("vgr_destroyer", 		             2, playerIndex, "DestroyerGuns",            750,   15, 1, 0,   4, "vgr_shipyard", "Production 4") == 1 then  
            elseif costruzioneforzata("vgr_longrangeartilleryfrigate", 2, playerIndex, "LongRangeArtilleryGunTech",600,   9 , 0, 0,   6, "vgr_shipyard", "Production 3") == 1 then              						
            elseif costruzioneforzata("vgr_artilleryfrigate",          2, playerIndex, "ArtilleryGunTech",         500,   8 , 0, 0,   6, "vgr_shipyard", "Production 3") == 1 then              
            elseif costruzioneforzata("vgr_striker",                   1, playerIndex, "Striker",                  600,   9,  0, 0,   6, "vgr_shipyard", "Production 2") == 1 then          
            elseif costruzioneforzata("vgr_defender",                  1, playerIndex, "DefenderTech",             575,   5,  0, 0,   6, "vgr_shipyard", "Production 1") == 1 then  
            elseif costruzioneforzata("Vgr_EliteFighter",              1, playerIndex, "MultiroleTech",            575,   5,  0, 0,   6, "vgr_shipyard", "Production 1") == 1 then
						--
						elseif costruzioneforzata("vgr_artilleryship", 		         2, playerIndex, "ArtilleryTech", 					 1250,  20, 2, 0,   3, "vgr_mothership", "Production 4") == 1 then   						
            elseif costruzioneforzata("vgr_cruiser", 		         			 2, playerIndex, "CruiserTech", 						 1250,  20, 2, 0,   3, "vgr_mothership", "Production 4") == 1 then    
            elseif costruzioneforzata("vgr_lightcruiser", 		      	 2, playerIndex, "IonCruiserTech", 					 1250,  20, 2, 0,   3, "vgr_mothership", "Production 4") == 1 then
            elseif costruzioneforzata("vgr_am", 		                   2, playerIndex, "AMGuns",                   700,   12, 0, 0,   1, "vgr_mothership", "Production 4") == 1 then 
            elseif costruzioneforzata("vgr_pulsedestroyer", 		       2, playerIndex, "PulseDestroyerGuns",       850,   15, 1, 0,   4, "vgr_mothership", "Production 4") == 1 then       						
            elseif costruzioneforzata("vgr_destroyer", 		             2, playerIndex, "DestroyerGuns",            750,   15, 1, 0,   4, "vgr_mothership", "Production 4") == 1 then  
            elseif costruzioneforzata("vgr_longrangeartilleryfrigate", 2, playerIndex, "LongRangeArtilleryGunTech",600,   9 , 0, 0,   6, "vgr_mothership", "Production 3") == 1 then              						
            elseif costruzioneforzata("vgr_artilleryfrigate",          2, playerIndex, "ArtilleryGunTech",         500,   8 , 0, 0,   6, "vgr_mothership", "Production 3") == 1 then              
            elseif costruzioneforzata("vgr_striker",                   1, playerIndex, "Striker",                  600,   9,  0, 0,   6, "vgr_mothership", "Production 2") == 1 then          
            elseif costruzioneforzata("vgr_defender",                  1, playerIndex, "DefenderTech",             575,   5,  0, 0,   6, "vgr_mothership", "Production 1") == 1 then   						
            elseif costruzioneforzata("Vgr_EliteFighter",              1, playerIndex, "MultiroleTech",            575,   5,  0, 0,   6, "vgr_mothership", "Production 1") == 1 then					
            --
						elseif costruzioneforzata("vgr_striker",                   1, playerIndex, "Striker",                  600,   9,  0, 0,   6, "vgr_carrier", "Production 1") == 1 then          
            elseif costruzioneforzata("vgr_defender",                  1, playerIndex, "DefenderTech",             575,   5,  0, 0,   6, "vgr_carrier", "Production 1") == 1 then  
						elseif costruzioneforzata("Vgr_EliteFighter",              1, playerIndex, "MultiroleTech",            575,   5,  0, 0,   6, "vgr_carrier", "Production 1") == 1 then
						--
						elseif costruzioneforzata("vgr_weaponplatform_missile",    2, playerIndex, "PlatformHeavyMissiles",    550,   2,  0, 0,   4, "vgr_mothership", "Weight") == 1 then               
            elseif costruzioneforzata("vgr_weaponplatform_lance",        2, playerIndex, "canbuildgunplatforms",     450,   1,  0, 0,   4, "vgr_mothership", "Weight") == 1 then   
            end
            
--pod controller/mine/missile
							
						if SobGroup_Count("vgr_mothership"..playerIndex) >= 1 and year >= 10/gamespeedprogression then
							if (SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "vgr_mothership"..playerIndex, 5500) == 1) and						     
							 (SobGroup_IsDoingAbility("vgr_mothership"..playerIndex, abilityList[2]) == 1) then
								if costruzioneforzata("vgr_boa", 3, playerIndex, "canbuildminems", 3000, 0, 0, 0, 6, "vgr_mothership", "Weight") == 1 then
								end
								if SobGroup_Count("temp") >= 3 and
									Player_GetRU(playerIndex) > 4000 and                 
									SobGroup_GetHardPointHealth("vgr_mothership"..playerIndex, "pl") == 0 then
									SobGroup_CreateSubSystem("vgr_mothership"..playerIndex, "vgr_pl")
								end								
							elseif SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "vgr_mothership"..playerIndex, 20000) == 1 then
								if costruzioneforzata("vgr_cruse", 2, playerIndex, "canbuildmissilems", 3000, 0, 0, 0, 6, "vgr_mothership", "Weight") == 1 then
								end	               
							end 		
						end
						if SobGroup_Count("vgr_battlecarrier"..playerIndex) >= 1 and year >= 10/gamespeedprogression then
							if (SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "vgr_battlecarrier"..playerIndex, 5500) == 1) and						     
							 (SobGroup_IsDoingAbility("vgr_battlecarrier"..playerIndex, abilityList[2]) == 1) then
								if SobGroup_Count("temp") >= 3 and
									Player_GetRU(playerIndex) > 4000 and                 
									SobGroup_GetHardPointHealth("vgr_battlecarrier"..playerIndex, "pl") == 0 then
									SobGroup_CreateSubSystem("vgr_battlecarrier"..playerIndex, "vgr_pl")
								end
							end 		
						end    

--nuke cannon attack
						AI_AutoEngageEnemyCapital("vgr_mothership"..playerIndex, "c", 50000)
	          
--shipyard nuke cannon attack
						AI_AutoEngageEnemyCapital("vgr_shipyard"..playerIndex, "c", 50000)
	          
--command fortress self defense
						AI_AutoEngageEnemyCapital("vgr_commandfortress"..playerIndex, "Generic 1", 10000)
            
--hyperspace gate AI
						if SobGroup_Count("vgr_hyperspace_platform"..playerIndex) >= 1 then
							--print("---Hyperspace Gate AI calculating--- Player "..playerIndex..", year: "..Debug_year())
							local numHSP = SobGroup_SplitGroupReference("hyperspacePlatform_SOB", "vgr_hyperspace_platform"..playerIndex, "platforms", SobGroup_Count("vgr_hyperspace_platform"..playerIndex))
							local z = 0
							local connectome = {}	--table to avoid conflicting connection, will this solve the 00000030 crash? Nope
							
							local HSgate = {"vgr_hyperspace_platform", "hgn_hyperspacestation", "meg_balcoragate"}	--for links with allied gates
	        		Update_AllShips()
							SobGroup_Create("HSgate_Total")
							SobGroup_Create("Temp_HSGate")
							for idx, iCount in HSgate do
								SobGroup_FillShipsByType("Temp_HSGate", "AllShips", iCount)
								SobGroup_SobGroupAdd("HSgate_Total", "Temp_HSGate")
							end
							local numAllHSP = SobGroup_SplitGroupReference("SingleFormGate_SOB", "HSgate_Total", "AllShips", SobGroup_Count("HSgate_Total"))
							SobGroup_Clear("HSgate_Total")
							
							for z_iter = 0, random_pseudo(numHSP,2*numHSP), 1 do		--z = 0, numHSP - 1, 1
								z = random_pseudo(0,numHSP - 1)
								if SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 then
								--move to enemy or allies
									if (SobGroup_Count("vgr_hyperspace_platform"..playerIndex) < SobGroup_Count("vgr_hyperspace_platform"..playerIndex)+random_pseudo(0,2) or (SobGroup_Count("vgr_hyperspace_platform"..playerIndex) <= random_pseudo(1,10) and SobGroup_Count("vgr_hyperspace_platform"..playerIndex) > random_pseudo(1,10))) and
									--SobGroup_FillProximitySobGroup ("temp", "vgr_hyperspace_platform"..playerIndex, "productioncapital"..playerIndex, 7000) == 1 and
									SobGroup_CanDoAbility("hyperspacePlatform_SOB"..z, AB_Move) == 1 and 
									SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 then
									  local PlayerTotal = Universe_PlayerCount()
									  local Pvar = playerIndex
									  while playerIndex == Pvar do
										  Pvar = random_pseudo(0,PlayerTotal-1)
										--move to enemy
		  								if playerIndex ~= Pvar and AreAllied(Pvar, playerIndex) == 0 and Player_IsAlive(Pvar) == 1 then
		  									local ran_target = random_pseudo(0,500)
						          --move to own scout
						            if ran_target > 240 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scout") > 0 then
						            	local num_scout = SobGroup_SplitGroupReference("SingleScoutAfar_SOB", "vgr_scout"..playerIndex, "fighters"..playerIndex, SobGroup_Count("vgr_scout"..playerIndex))
						            	local idx_scout = 0
						            	local limiter = 0
						            	while limiter < random_pseudo(num_scout,2*num_scout) and SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 do
						            		limiter = limiter + 1
						            		idx_scout = random_pseudo(0,num_scout-1)
						            		if SobGroup_IsDoingAbility("SingleScoutAfar_SOB"..idx_scout, AB_Move) == 0 and 
						            		SobGroup_SobGroupCompare("SingleScoutAfar_SOB"..idx_scout, "AI_CrateHunterSOB"..playerIndex) == 0 and 
						            		SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "SingleScoutAfar_SOB"..idx_scout) > 25000 then
						            			local scout_position = SobGroup_GetPosition("SingleScoutAfar_SOB"..idx_scout)
						            			Volume_AddSphere("vol_move_scout"..playerIndex..z..idx_scout, scout_position, random_pseudo(8000,12000))
						            			SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "vol_move_scout"..playerIndex..z..idx_scout)
						            			Volume_Delete("vol_move_scout"..playerIndex..z..idx_scout)
						            			--SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "SingleScoutAfar_SOB"..idx_scout)
							            		--print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards own SingleScoutAfar_SOB"..idx_scout..", game year: "..year)
							            	end
							            end
						          --move to own probe
						            elseif ran_target > 120 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe") > 0 then
						            	local num_probe = SobGroup_SplitGroupReference("SingleProbeAfar_SOB", "vgr_probe"..playerIndex, "othersnoparade"..playerIndex, SobGroup_Count("vgr_probe"..playerIndex))
						            	local idx_probe = 0
						            	local limiter = 0
						            	while limiter < random_pseudo(num_probe,2*num_probe) and SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 do
						            		limiter = limiter + 1
						            		idx_probe = random_pseudo(0,num_probe-1)
						            		if SobGroup_IsDoingAbility("SingleProbeAfar_SOB"..idx_probe, AB_Move) == 0 and 
						            		SobGroup_SobGroupCompare("SingleProbeAfar_SOB"..idx_probe, "AI_CrateHunterSOB"..playerIndex) == 0 and 
						            		SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "SingleProbeAfar_SOB"..idx_probe) > 25000 then
						            			local probe_position = SobGroup_GetPosition("SingleProbeAfar_SOB"..idx_probe)
						            			Volume_AddSphere("vol_move_probe"..playerIndex..z..idx_probe, probe_position, random_pseudo(8000,12000))
						            			SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "vol_move_probe"..playerIndex..z..idx_probe)
						            			Volume_Delete("vol_move_probe"..playerIndex..z..idx_probe)
						            			--SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "SingleProbeAfar_SOB"..idx_probe)
							            		--print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards own SingleProbeAfar_SOB"..idx_probe..", game year: "..year)
							            	end
							            end
							        --move directly to enemy ships
		  									elseif ran_target <= 30 and SobGroup_Empty("productioncapital"..Pvar) == 0 then
						              if SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "productioncapital"..Pvar) > 25000 then
						              	local capital_position = SobGroup_GetPosition("productioncapital"..Pvar)
						              	Volume_AddSphere("vol_move_production"..playerIndex..z..Pvar, capital_position, random_pseudo(20000,25000))
						              	SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "vol_move_production"..playerIndex..z..Pvar)
						              	Volume_Delete("vol_move_production"..playerIndex..z..Pvar)
							              --print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards hostile productioncapital of player index: "..Pvar..", game year: "..year)
							            end
							          elseif ran_target <= 60 and SobGroup_Empty("utilities"..Pvar) == 0 then
						              if SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "utilities"..Pvar) > 25000 then
						              	local capital_position = SobGroup_GetPosition("utilities"..Pvar)
						              	Volume_AddSphere("vol_move_utility"..playerIndex..z..Pvar, capital_position, random_pseudo(8000,12000))
						              	SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "vol_move_utility"..playerIndex..z..Pvar)
						              	Volume_Delete("vol_move_utility"..playerIndex..z..Pvar)
							              --print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards hostile utilities of player index: "..Pvar..", game year: "..year)
							            end
							          elseif ran_target <= 90 and SobGroup_Empty("trader"..Pvar) == 0 then
						              if SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "trader"..Pvar) > 25000 then
						              	local capital_position = SobGroup_GetPosition("trader"..Pvar)
						              	Volume_AddSphere("vol_move_trader"..playerIndex..z..Pvar, capital_position, random_pseudo(8000,12000))
						              	SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "vol_move_trader"..playerIndex..z..Pvar)
						              	Volume_Delete("vol_move_trader"..playerIndex..z..Pvar)
							              --print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards hostile trader of player index: "..Pvar..", game year: "..year)
							            end
						            elseif ran_target <= 120 and SobGroup_Empty("fcdocker"..Pvar) == 0 then
					                if SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "fcdocker"..Pvar) > 25000 then
					               	  local capital_position = SobGroup_GetPosition("fcdocker"..Pvar)
					               	  Volume_AddSphere("vol_move_fcdocker"..playerIndex..z..Pvar, capital_position, random_pseudo(20000,25000))
					               	  SobGroup_Move(playerIndex, "hyperspacePlatform_SOB"..z, "vol_move_fcdocker"..playerIndex..z..Pvar)
					               	  Volume_Delete("vol_move_fcdocker"..playerIndex..z..Pvar)
						                --print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards hostile fcdocker of player index: "..Pvar..", game year: "..year)
						              end
							          end
							      --move to allies
						          elseif playerIndex ~= Pvar and AreAllied(Pvar, playerIndex) == 1 and SobGroup_Empty("productioncapital"..Pvar) == 0 then
					              if SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "productioncapital"..Pvar) > 25000 then
					              	SobGroup_MoveToSobGroup("hyperspacePlatform_SOB"..z, "productioncapital"..Pvar)
						              --print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving towards friendly player index: "..Pvar..", game year: "..year)
						            end
						          end
						        end
					      --move at base
					        elseif SobGroup_CanDoAbility("hyperspacePlatform_SOB"..z, AB_Move) == 1 and SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 then
					        	if SobGroup_Empty("productioncapital"..playerIndex) == 0 then
					        		SobGroup_MoveToSobGroup("hyperspacePlatform_SOB"..z, "productioncapital"..playerIndex)
					        		--print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is moving at base, game year: "..year)
			              end
			          --form hyperspace link
				          elseif SobGroup_CanDoAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 and SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_Move) == 0 then
					        	local y = random_pseudo(0,numHSP-1)
					        	
										--link with own hyperspace platform
										if SobGroup_Count("vgr_hyperspace_platform"..playerIndex) >= random_pseudo(2,10) and
					        	SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..y, AB_Move) == 0 and
					        	(SobGroup_IsGateDeployed("hyperspacePlatform_SOB"..z, "hyperspacePlatform_SOB"..y) == 0 or SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_FormHyperspaceGate) == 0) and
					        	SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "hyperspacePlatform_SOB"..y) > 13000 then
					        		local lastcount = getn(connectome)
					        		connectome = Table_InsertUnique(connectome, {z,y})
					        		if lastcount + 2 == getn(connectome) then
					        			SobGroup_FormHyperspaceGate("hyperspacePlatform_SOB"..z, "hyperspacePlatform_SOB"..y)
					        			--print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is forming hyperspace gate with own hyperspacePlatform_SOB"..y..", game year: "..year)
					        		end
					        	
					        	--link with allies and balcora gate
					        	elseif (y == z or SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "hyperspacePlatform_SOB"..y) <= 13000) then
											if numAllHSP > 0 then
												local limited = 0
												local breaker = -1
												while breaker ~= z and limited < 2*CPULODvalueList[playerIndexList]+1 do
													local counter = random_pseudo(0,numAllHSP-1)
													if SobGroup_OwnedBy("SingleFormGate_SOB" .. counter) ~= playerIndex and
													AreAllied(playerIndex, SobGroup_OwnedBy("SingleFormGate_SOB" .. counter)) == 1 and
													SobGroup_IsDoingAbility("SingleFormGate_SOB" .. counter, AB_Move) == 0 and
													SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "SingleFormGate_SOB" .. counter) > 13000 and
													(SobGroup_IsGateDeployed("hyperspacePlatform_SOB"..z, "SingleFormGate_SOB" .. counter) == 0 or (SobGroup_IsDoingAbility("SingleFormGate_SOB" .. counter, AB_FormHyperspaceGate) == 0 and Player_HasResearch(SobGroup_OwnedBy("SingleFormGate_SOB" .. counter), "isai" ) == 1) ) then
														SobGroup_FormHyperspaceGate("hyperspacePlatform_SOB"..z, "SingleFormGate_SOB" .. counter)
														breaker = z
														--print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is forming hyperspace gate with "..HSgate[i].." owned by player index: "..SobGroup_OwnedBy("SingleFormGate_SOB" .. counter)..", game year: "..year)
													elseif SobGroup_OwnedBy("SingleFormGate_SOB" .. counter) == playerIndex and
													SobGroup_AreAnyOfTheseTypes("SingleFormGate_SOB" .. counter, "meg_balcoragate") == 1 and
													(SobGroup_IsGateDeployed("hyperspacePlatform_SOB"..z, "SingleFormGate_SOB" .. counter) == 0 or (SobGroup_IsDoingAbility("SingleFormGate_SOB" .. counter, AB_FormHyperspaceGate) == 0 and Player_HasResearch(SobGroup_OwnedBy("SingleFormGate_SOB" .. counter), "isai" ) == 1) ) then
														SobGroup_FormHyperspaceGate("hyperspacePlatform_SOB"..z, "SingleFormGate_SOB" .. counter)
														breaker = z
														--print("hyperspacePlatform_SOB"..z.." owned by player index: "..playerIndex.." is forming hyperspace gate with own "..HSgate[i]..", game year: "..year)
													end
													limited = limited + 1
												end
											end
										end

			            end 
			          --forced stop around enemy base (REDEFINED IN sobgroupfunctions.lua)
			          --else
									--local PlayerTotal = Universe_PlayerCount()
									--local Pvar = 0
			          	--while Pvar < PlayerTotal do
	  								--if playerIndex ~= Pvar and AreAllied(Pvar, playerIndex) == 0 then
	  									--if SobGroup_Empty("productioncapital"..Pvar) == 0 then
					              --if SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "productioncapital"..Pvar) < 25000 then
					              	--SobGroup_Stop(playerIndex, "hyperspacePlatform_SOB"..z)
					              --end
					            --end
					          --end
					          --Pvar = Pvar + 1
					        --end
			          end
			       --hyperspace via gates
		          	if SobGroup_IsDoingAbility("hyperspacePlatform_SOB"..z, AB_FormHyperspaceGate) == 1 then
		          		local rnd_distance = random_pseudo(7000,12500)
		          		if nfi[playerIndex + 1] > 0 then
		          			for i = 0,(nfi[playerIndex + 1]-1),1 do
		          				if SobGroup_Empty("splitfighters"..playerIndex .. tostring(i)) == 0 and SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "splitfighters"..playerIndex .. tostring(i)) < rnd_distance then    
		          					if (SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Move) == 0 or SobGroup_HealthPercentage("splitfighters"..playerIndex .. tostring(i)) < 0.35) and
						          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Attack) == 0 and
						          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Guard) == 0 and
						          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Dock) == 0 and
						          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Parade) == 0 then
						              SobGroup_UseHyperspaceGate_Smart("splitfighters"..playerIndex .. tostring(i), "hyperspacePlatform_SOB"..z)
						              --print("hyperspacePlatform_SOB"..z.." is activated by splitfighters"..playerIndex .. tostring(i).." from distance: "..rnd_distance.." for player index: "..playerIndex..", game year: "..year)
						            end
						          end
				            end
			            end
		          		if nco[playerIndex + 1] > 0 then
		          			for i = 0,(nco[playerIndex + 1]-1),1 do
		          				if SobGroup_Empty("splitcorvettes"..playerIndex .. tostring(i)) == 0 and SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "splitcorvettes"..playerIndex .. tostring(i)) < rnd_distance then    
		          					if (SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Move) == 0 or SobGroup_HealthPercentage("splitcorvettes"..playerIndex .. tostring(i)) < 0.35) and
						          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Attack) == 0 and
						          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Guard) == 0 and
						          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Dock) == 0 and
						          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Parade) == 0 then
						              SobGroup_UseHyperspaceGate_Smart("splitcorvettes"..playerIndex .. tostring(i), "hyperspacePlatform_SOB"..z)
						              --print("hyperspacePlatform_SOB"..z.." is activated by splitcorvettes"..playerIndex .. tostring(i).." from distance: "..rnd_distance.." for player index: "..playerIndex..", game year: "..year)
						            end
						          end
				            end
			            end
		          		if nf > 0 then
		          			for i = 0,nf-1,1 do
		          				if Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "isai" ) == 1 and 
		          				(AreAllied(playerIndex, SobGroup_OwnedBy("splitfrigates"..i)) == 1 or playerIndex == SobGroup_OwnedBy("splitfrigates"..i))and 
		          				SobGroup_Empty("splitfrigates"..i) == 0 and 
		          				SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "splitfrigates"..i) < rnd_distance then    
		          					if (SobGroup_IsDoingAbility("splitfrigates"..i, AB_Move) == 0 or SobGroup_HealthPercentage("splitfrigates"..i) < 0.35) and
						          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Attack) == 0 and
						          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Guard) == 0 and
						          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Dock) == 0 and
						          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Capture) == 0 and
						          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Parade) == 0 then
						              SobGroup_UseHyperspaceGate_Smart("splitfrigates"..i, "hyperspacePlatform_SOB"..z)
						              --print("hyperspacePlatform_SOB"..z.." is activated by splitfrigates"..i.." from distance: "..rnd_distance.." for player index: "..playerIndex..", game year: "..year)
						            end
						          end
				            end
			            end
		          		if nd > 0 then
		          			for i = 0,nd-1,1 do
		          				if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "isai" ) == 1 and 
		          				AreAllied(playerIndex, SobGroup_OwnedBy("splitdestroyers"..i)) == 1 and 
		          				Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == 1 and
		          				SobGroup_Empty("splitdestroyers"..i) == 0 and 
		          				SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "splitdestroyers"..i) < rnd_distance then    
		          					if (SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Move) == 0 or SobGroup_HealthPercentage("splitdestroyers"..i) < 0.35) and
						          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Attack) == 0 and
						          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Guard) == 0 and
						          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Dock) == 0 and
						          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Parade) == 0 then
						              SobGroup_UseHyperspaceGate_Smart("splitdestroyers"..i, "hyperspacePlatform_SOB"..z)
						            end
						          end
				            end
			            end
		          		if np > 0 and 10 > random_pseudo(1,200) then
		          			for i = 0,np-1,1 do
		          				if Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "isai" ) == 1 and 
		          				AreAllied(playerIndex, SobGroup_OwnedBy("splitplatforms"..i)) == 1 and 
		          				Player_GetRace(SobGroup_OwnedBy("splitplatforms"..i)) == 1 and
		          				SobGroup_Empty("splitplatforms"..i) == 0 and 
		          				SobGroup_GetDistanceToSobGroup("hyperspacePlatform_SOB"..z, "splitplatforms"..i) < rnd_distance then    
		          					if (SobGroup_IsDoingAbility("splitplatforms"..i, AB_Move) == 0 or SobGroup_HealthPercentage("splitplatforms"..i) < 0.35) and
						          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Attack) == 0 and
						          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Guard) == 0 and
						          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Dock) == 0 and
						          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Parade) == 0 then
						              SobGroup_UseHyperspaceGate_Smart("splitplatforms"..i, "hyperspacePlatform_SOB"..z)
						            end
						          end
				            end
			            end
		          	end
	          	end
	          --print("---Hyperspace Gate AI end---")
	          end
            
--ricerca tech forzata
            if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 and year >= 20-(CPULODvalueList[playerIndexList])^2 then
	            if Player_CanResearch(playerIndex, "CapitalSmokeScreen" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	              Player_Research_Smart( playerIndex , "CapitalSmokeScreen" )
	            end
	            if Player_CanResearch(playerIndex, "CapitalSmokeScreen1" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	              Player_Research_Smart( playerIndex , "CapitalSmokeScreen1" )
	            end
	            if kad_cpu_personality[playerIndexList] == 1 then
		            if Player_CanResearch(playerIndex, "DestroyerGuns" ) == 1 and Player_GetRU(playerIndex) > 1000 then
		              Player_Research_Smart( playerIndex , "DestroyerGuns" )
		              print("Researching DestroyerGuns for player index: "..playerIndex..", game year: "..year)
		            end
		          elseif kad_cpu_personality[playerIndexList] == 2 then
		            if Player_CanResearch(playerIndex, "CruiserTech" ) == 1 and Player_GetRU(playerIndex) > 1000 then
		              Player_Research_Smart( playerIndex , "CruiserTech" )
		              print("Researching CruiserTech for player index: "..playerIndex..", game year: "..year)
		            end
		          elseif kad_cpu_personality[playerIndexList] == 3 then
		            if Player_CanResearch(playerIndex, "ArtilleryTech" ) == 1 and Player_GetRU(playerIndex) > 1000 then
		              Player_Research_Smart( playerIndex , "ArtilleryTech" )
		              print("Researching ArtilleryTech for player index: "..playerIndex..", game year: "..year)
		            end
		          elseif kad_cpu_personality[playerIndexList] == 4 then
		            if Player_CanResearch(playerIndex, "IonCruiserTech" ) == 1 and Player_GetRU(playerIndex) > 1000 then
		              Player_Research_Smart( playerIndex , "IonCruiserTech" )
		              print("Researching IonCruiserTech for player index: "..playerIndex..", game year: "..year)
		            end
		          end
		        elseif year >= 20-(CPULODvalueList[playerIndexList])^2 then
		        	if Player_CanResearch(playerIndex, "PulseDestroyerGuns" ) == 1 and Player_GetRU(playerIndex) > 1000 then
		            Player_Research_Smart( playerIndex , "PulseDestroyerGuns" )
		          end
            end
            if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then
              if Player_CanResearch(playerIndex, "BattlecruiserIonWeapons" ) == 1 and Player_GetRU(playerIndex) > 1500 and year >= 26-(CPULODvalueList[playerIndexList])^2 then
	              Player_Research_Smart( playerIndex , "BattlecruiserIonWeapons" )
	            end
	            if kad_cpu_subpersonality[playerIndexList] == 1 then
	              if Player_CanResearch(playerIndex, "BattleshipTech" ) == 1 and Player_GetRU(playerIndex) > 2250 and year >= 26-2*CPULODvalueList[playerIndexList] then
		              Player_Research_Smart( playerIndex , "BattleshipTech" )
		            end
		          else
	              if Player_CanResearch(playerIndex, "PeacemakerTech" ) == 1 and Player_GetRU(playerIndex) > 2250 and year >= 26-2*CPULODvalueList[playerIndexList] then
		              Player_Research_Smart( playerIndex , "PeacemakerTech" )
		            end
		          end
              if Player_CanResearch(playerIndex, "FrigateAfterburnerAI" ) == 1 and Player_GetRU(playerIndex) > 2900 then
              	Player_Research_Smart( playerIndex , "FrigateAfterburnerAI" )
              end
            elseif year >= 26-(CPULODvalueList[playerIndexList])^2 then
              if Player_CanResearch(playerIndex, "MissileBattlecruiserIonWeapons" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	              Player_Research_Smart( playerIndex , "MissileBattlecruiserIonWeapons" )
	            end
	          end  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then  
	            if Player_CanResearch(playerIndex, "DreadnaughtTech" ) == 1 and Player_GetRU(playerIndex) > 2500 then
	              Player_Research_Smart( playerIndex , "DreadnaughtTech" )
	            end          
              if Player_CanResearch(playerIndex, "CapitalAfterburnerAI" ) == 1 and Player_GetRU(playerIndex) > 5000 then
              	Player_Research_Smart( playerIndex , "CapitalAfterburnerAI" )
              end
	            if Player_CanResearch(playerIndex, "JDAMdesignator" ) == 1 and Player_GetRU(playerIndex) > 8000 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandcorvette") > 1 then              
	              Player_Research_Smart( playerIndex , "JDAMdesignator" )              
	            end  
            end                                        
          
--Platforms
						if Player_CanResearch(playerIndex, "PlatformRefuelingUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "PlatformRefuelingUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "PlatformRefuelingUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "PlatformRefuelingUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "PlatformRefuelingUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	            Player_Research_Smart( playerIndex , "PlatformRefuelingUpgrade1" )
	          elseif Player_CanResearch(playerIndex, "PlatformRefueling" ) == 1 and Player_GetRU(playerIndex) > 600 then              
              Player_Research_Smart( playerIndex , "PlatformRefueling" ) 
	          end
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") > 0 then                   
   ---Parade		            
	            if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_gun"..playerIndex, "vgr_mothership"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_mothership"..playerIndex, 0)
		          end 
	            if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_lance"..playerIndex, "vgr_mothership"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_mothership"..playerIndex, 0)
		          end
              if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_missile"..playerIndex, "vgr_mothership"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_mothership"..playerIndex, 0)
		          end 							
		        elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard") > 0 then                               
	            if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_gun"..playerIndex, "vgr_shipyard"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_shipyard"..playerIndex, 0)
		          end 
	            if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_lance"..playerIndex, "vgr_shipyard"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_shipyard"..playerIndex, 0)
		          end
              if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_missile"..playerIndex, "vgr_shipyard"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_shipyard"..playerIndex, 0)
		          end 							
		        elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier") > 0 then                               
	            if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_gun"..playerIndex, "vgr_carrier"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_carrier"..playerIndex, 0)
		          end 
	            if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_lance"..playerIndex, "vgr_carrier"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_carrier"..playerIndex, 0)
		          end
              if SobGroup_FillProximitySobGroup ("temp", "vgr_weaponplatform_missile"..playerIndex, "vgr_carrier"..playerIndex, 4500) == 1 then 
		            SobGroup_ParadeSobGroup("temp", "vgr_carrier"..playerIndex, 0)
		          end 							
           	end
  ---Fleet            
            if Player_CanResearch(playerIndex, "CapitalRetire" ) == 1 and Player_GetRU(playerIndex) > 500 then
              Player_Research_Smart( playerIndex , "CapitalRetire" )
            end 
            if Player_CanResearch(playerIndex, "HyperspaceCostUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 1000 then
              Player_Research_Smart( playerIndex , "HyperspaceCostUpgrade2" )
            elseif Player_CanResearch(playerIndex, "HyperspaceCostUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 500 then
              Player_Research_Smart( playerIndex , "HyperspaceCostUpgrade1" )
            end 	
            if Player_CanResearch(playerIndex, "maintenance3" ) == 1 and Player_GetRU(playerIndex) > 4000 then
              Player_Research_Smart( playerIndex , "maintenance3" )
            elseif Player_CanResearch(playerIndex, "maintenance2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
              Player_Research_Smart( playerIndex , "maintenance2" )
            elseif Player_CanResearch(playerIndex, "maintenance1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
              Player_Research_Smart( playerIndex , "maintenance1" )
            end 
            --EVO
            if SobGroup_Empty("star_sol") == 0 then
              if Player_CanResearch(playerIndex, "CapitalSpeedUpgrade3" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "CapitalSpeedUpgrade3" )
							elseif Player_CanResearch(playerIndex, "CapitalSpeedUpgrade2" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "CapitalSpeedUpgrade2" )
							elseif Player_CanResearch(playerIndex, "CapitalSpeedUpgrade1" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "CapitalSpeedUpgrade1" )
							end							
							if Player_CanResearch(playerIndex, "HyperspaceCostUpgrade3" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "HyperspaceCostUpgrade3" )
							elseif Player_CanResearch(playerIndex, "HyperspaceCostUpgrade2" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "HyperspaceCostUpgrade2" )
							elseif Player_CanResearch(playerIndex, "HyperspaceCostUpgrade1" ) == 1 then
							  Player_GrantResearchOption_Smart(playerIndex, "HyperspaceCostUpgrade1" )
							end								
            end											
	--capital            
	          if Player_CanResearch(playerIndex, "CapitalHealthUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 4500 then
	            Player_Research_Smart( playerIndex , "CapitalHealthUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "CapitalHealthUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "CapitalHealthUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "CapitalHealthUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "CapitalHealthUpgrade1" )
	          end         
	--frigate	             
	          if Player_CanResearch(playerIndex, "FrigateHealthUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 2250 then
	            Player_Research_Smart( playerIndex , "FrigateHealthUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "FrigateHealthUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	            Player_Research_Smart( playerIndex , "FrigateHealthUpgrade1" )
	          end  

--Weapon
	          if Player_CanResearch(playerIndex, "WeaponSpeedUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 4000 then
	            Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "WeaponSpeedUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "WeaponSpeedUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade1" )
	          end
	          if Player_CanResearch(playerIndex, "WeaponImpactUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 5000 then
	            Player_Research_Smart( playerIndex , "WeaponImpactUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "WeaponImpactUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 4000 then
	            Player_Research_Smart( playerIndex , "WeaponImpactUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "WeaponImpactUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 3000 then
	            Player_Research_Smart( playerIndex , "WeaponImpactUpgrade1" )
	          end

	--collector	             
            if Player_CanResearch(playerIndex, "ResourceCollectorRURATEUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 400 then
              Player_Research_Smart( playerIndex , "ResourceCollectorRURATEUpgrade1" )              
            end
            if Player_CanResearch(playerIndex, "ResourceCollectorRUCAPUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 500 then              
              Player_Research_Smart( playerIndex , "ResourceCollectorRUCAPUpgrade1" )              
            end       
            if Player_CanResearch(playerIndex, "ResourceCollectorRUDROPOFFUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 600 then              
              Player_Research_Smart( playerIndex , "ResourceCollectorRUDROPOFFUpgrade1" )              
            end 
	          if Player_CanResearch(playerIndex, "UtilitySpeedUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	            Player_Research_Smart( playerIndex , "UtilitySpeedUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "UtilitySpeedUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	            Player_Research_Smart( playerIndex , "UtilitySpeedUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "UtilitySpeedUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 600 then              
              Player_Research_Smart( playerIndex , "UtilitySpeedUpgrade1" ) 
	          end
            if Player_CanResearch(playerIndex, "resourcecollectorextraction1" ) == 1 and Player_GetRU(playerIndex) > 800 then              
              Player_Research_Smart( playerIndex , "resourcecollectorextraction1" )              
            end
            if Player_CanResearch(playerIndex, "ProbeRefuelingUpgrade3" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	            Player_Research_Smart( playerIndex , "ProbeRefuelingUpgrade3" )
	          elseif Player_CanResearch(playerIndex, "ProbeRefuelingUpgrade2" ) == 1 and Player_GetRU(playerIndex) > 1500 then
	            Player_Research_Smart( playerIndex , "ProbeRefuelingUpgrade2" )
	          elseif Player_CanResearch(playerIndex, "ProbeRefuelingUpgrade1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
	            Player_Research_Smart( playerIndex , "ProbeRefuelingUpgrade1" )
	          elseif Player_CanResearch(playerIndex, "ProbeRefueling" ) == 1 and Player_GetRU(playerIndex) > 500 then
              Player_Research_Smart( playerIndex , "ProbeRefueling" ) 
	          end
                   
          
	  				--hyperspace via my gates
	  				if Player_IsAlive( Universe_CurrentPlayer() ) == 1 and AreAllied(Universe_CurrentPlayer(), playerIndex) == 1 and GetGameRubric() ~= GR_MULTIPLAYER then
	  					local me = Universe_CurrentPlayer()
	  					if SobGroup_Count("vgr_hyperspace_platform"..me) >= 1 or SobGroup_Count("meg_balcoragate"..me) >= 1 or SobGroup_Count("hgn_hyperspacestation"..me) >= 1 then
	  						local HSgate = {"vgr_hyperspace_platform", "hgn_hyperspacestation", "meg_balcoragate"}
		        		Update_AllShips()
	        			local i = 0
								repeat
									i = i +1
									SobGroup_Create("myHSgate_Total")
									SobGroup_FillShipsByType("myHSgate_Total", "AllShips", HSgate[i])
									local numMyHSP = SobGroup_SplitGroupReference("LinkMyGate_SOB", "myHSgate_Total", "AllShips", SobGroup_Count("myHSgate_Total"))
									if numMyHSP > 0 then
										local counter = 0
										while counter < numMyHSP do
											if SobGroup_IsDoingAbility("LinkMyGate_SOB"..counter, AB_FormHyperspaceGate) == 1 then
						        		local rnd_distance = random_pseudo(7000,12500)
						        		if nfi[playerIndex + 1] > 0 then
						        			for i = 0,(nfi[playerIndex + 1]-1),1 do
						        				if SobGroup_Empty("splitfighters"..playerIndex .. tostring(i)) == 0 and SobGroup_GetDistanceToSobGroup("LinkMyGate_SOB"..counter, "splitfighters"..playerIndex .. tostring(i)) < rnd_distance then    
						        					if (SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Move) == 0 or SobGroup_HealthPercentage("splitfighters"..playerIndex .. tostring(i)) < 0.35) and
									          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Attack) == 0 and
									          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Guard) == 0 and
									          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Dock) == 0 and
									          	SobGroup_IsDoingAbility("splitfighters"..playerIndex .. tostring(i), AB_Parade) == 0 then
									              SobGroup_UseHyperspaceGate_Smart("splitfighters"..playerIndex .. tostring(i), "LinkMyGate_SOB"..counter)
									            end
									          end
							            end
						            end
						        		if nco[playerIndex + 1] > 0 then
						        			for i = 0,(nco[playerIndex + 1]-1),1 do
						        				if SobGroup_Empty("splitcorvettes"..playerIndex .. tostring(i)) == 0 and SobGroup_GetDistanceToSobGroup("LinkMyGate_SOB"..counter, "splitcorvettes"..playerIndex .. tostring(i)) < rnd_distance then    
						        					if (SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Move) == 0 or SobGroup_HealthPercentage("splitcorvettes"..playerIndex .. tostring(i)) < 0.35) and
									          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Attack) == 0 and
									          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Guard) == 0 and
									          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Dock) == 0 and
									          	SobGroup_IsDoingAbility("splitcorvettes"..playerIndex .. tostring(i), AB_Parade) == 0 then
									              SobGroup_UseHyperspaceGate_Smart("splitcorvettes"..playerIndex .. tostring(i), "LinkMyGate_SOB"..counter)
									            end
									          end
							            end
						            end
						        		if nf > 0 then
						        			for i = 0,nf-1,1 do
						        				if Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "isai" ) == 1 and
						        				AreAllied(me, SobGroup_OwnedBy("splitfrigates"..i)) == 1 and
						        				SobGroup_Empty("splitfrigates"..i) == 0 and 
						        				SobGroup_GetDistanceToSobGroup("LinkMyGate_SOB"..counter, "splitfrigates"..i) < rnd_distance then    
						        					if (SobGroup_IsDoingAbility("splitfrigates"..i, AB_Move) == 0 or SobGroup_HealthPercentage("splitfrigates"..i) < 0.35) and
									          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Attack) == 0 and
									          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Guard) == 0 and
									          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Dock) == 0 and
									          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Capture) == 0 and
									          	SobGroup_IsDoingAbility("splitfrigates"..i, AB_Parade) == 0 then
									              SobGroup_UseHyperspaceGate_Smart("splitfrigates"..i, "LinkMyGate_SOB"..counter)
									            end
									          end
							            end
						            end
						            if nd > 0 then
						        			for i = 0,nd-1,1 do
						        				if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "isai" ) == 1 and
						        				AreAllied(me, SobGroup_OwnedBy("splitdestroyers"..i)) == 1 and
						        				Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == 1 and
						        				SobGroup_Empty("splitdestroyers"..i) == 0 and 
						        				SobGroup_GetDistanceToSobGroup("LinkMyGate_SOB"..counter, "splitdestroyers"..i) < rnd_distance then    
						        					if (SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Move) == 0 or SobGroup_HealthPercentage("splitdestroyers"..i) < 0.35) and
									          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Attack) == 0 and
									          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Guard) == 0 and
									          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Dock) == 0 and
									          	SobGroup_IsDoingAbility("splitdestroyers"..i, AB_Parade) == 0 then
									              SobGroup_UseHyperspaceGate_Smart("splitdestroyers"..i, "LinkMyGate_SOB"..counter)
									            end
									          end
							            end
						            end
						            if np > 0 and 10 > random_pseudo(1,200) then
						        			for i = 0,np-1,1 do
						        				if Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "isai" ) == 1 and
						        				AreAllied(me, SobGroup_OwnedBy("splitplatforms"..i)) == 1 and
						        				Player_GetRace(SobGroup_OwnedBy("splitplatforms"..i)) == 1 and
						        				SobGroup_Empty("splitplatforms"..i) == 0 and 
						        				SobGroup_GetDistanceToSobGroup("LinkMyGate_SOB"..counter, "splitplatforms"..i) < rnd_distance then    
						        					if (SobGroup_IsDoingAbility("splitplatforms"..i, AB_Move) == 0 or SobGroup_HealthPercentage("splitplatforms"..i) < 0.35) and
									          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Attack) == 0 and
									          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Guard) == 0 and
									          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Dock) == 0 and
									          	SobGroup_IsDoingAbility("splitplatforms"..i, AB_Parade) == 0 then
									              SobGroup_UseHyperspaceGate_Smart("splitplatforms"..i, "LinkMyGate_SOB"..counter)
									            end
									          end
							            end
						            end
						          end
											counter = counter + 1
										end
									end
								until (not HSgate[i + 1])
							end
						end

--research madness
						if aiaids > 1 then
							local iRace = Player_GetRace(playerIndex) + 1
							dofilepath([[data:scripts/race.lua]])
							dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
							local totalcost = 0
							for z, iCount in research do
								if (aiaids^2)*(CPULODvalueList[playerIndexList]+1) >= random_pseudo(1,1000) then
									if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 then
										Player_CancelResearch(playerIndex, iCount.Name)
										Player_GrantResearchOption(playerIndex, iCount.Name)
										totalcost = totalcost + iCount.Cost
										researchburned[playerIndexList] = researchburned[playerIndexList] + iCount.Cost
										--print("Research granted for player index: "..playerIndex..", game year: "..year..", item granted: "..iCount.Name)
									end
								end
							end
						end
						
--Kadeshi------------------------------------------------------------------------------------------------------       
     
          elseif Player_GetRace(playerIndex) == Race_Kadeshi then
          	
--crate hunt
						AI_CrateHunter(playerIndex, {"kad_sensorpod", "kad_prayerpod", "kad_swarmer_new"}, 10000+15000*CPULODvalueList[playerIndexList], 1+2*CPULODvalueList[playerIndexList])

--scout
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_sensorpod") < Player_CountEnemies(playerIndex) + CPULODvalueList[playerIndexList] then
              if Player_HasResearch(playerIndex, "Garden1" ) == 1 then
	              if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_custodian") >= 1 then
	              	SobGroup_CreateShip_Smart("kad_custodian"..playerIndex, "kad_sensorpod")
	              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship") >= 1 then
	              	SobGroup_CreateShip_Smart("kad_needleship"..playerIndex, "kad_sensorpod")
	              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_podship") >= 1 then
	              	SobGroup_CreateShip_Smart("kad_podship"..playerIndex, "kad_sensorpod")
	              end
	            end
            end

          	--print("Kadeshi AI is running")
          	
          	--Return to conventional AI when compulsory AI fails to work		--setAIFunctions_KAD is nil value in some cases!
          	--if year > 20 - CPULODvalueList[playerIndexList] and setAIFunctions_KAD[playerIndexList] ~= 0 then
          	--  if Player_HasResearch(playerIndex, "Garden1" ) == 0 and Player_HasResearch(playerIndex, "Sajuuk1" ) == 0 and Player_HasResearch(playerIndex, "Kadesh1" ) == 0 then
          	--		setAIFunctions_KAD[playerIndexList] = 0
          	--		print("Switching from compulsory AI to conventional AI for player index: "..playerIndex..", game year: "..year)
          	--  end
          	--end
          	
          	--Belief personality per CPU player (compulsory AI)
						if kad_cpu_personality[playerIndexList] == 1 then		-- Garden
	            if Player_CanResearch(playerIndex, "Garden1" ) == 1 then
	              Player_Research_Smart( playerIndex , "Garden1" )
	              print("Garden1 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Garden2" ) == 1 and Player_HasResearch(playerIndex, "Garden1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Garden2" )
	              print("Garden2 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Garden3" ) == 1 and Player_HasResearch(playerIndex, "Garden2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Garden3" )
	              print("Garden3 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_HasResearch(playerIndex, "Garden3" ) == 1 and Player_GetRU(playerIndex) > 2000 then
			          if kad_cpu_subpersonality[playerIndexList] == 1 then		--sub belief
			            if Player_CanResearch(playerIndex, "Sajuuk1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Sajuuk1" )
			              print("Sajuuk1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          else
			            if Player_CanResearch(playerIndex, "Kadesh1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Kadesh1" )
			              print("Kadesh1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          end
		          end
						elseif kad_cpu_personality[playerIndexList] == 2 then		-- Sajuuk
	            if Player_CanResearch(playerIndex, "Sajuuk1" ) == 1 then
	              Player_Research_Smart( playerIndex , "Sajuuk1" )
	              print("Sajuuk1 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Sajuuk2" ) == 1 and Player_HasResearch(playerIndex, "Sajuuk1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Sajuuk2" )
	              print("Sajuuk2 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Sajuuk3" ) == 1 and Player_HasResearch(playerIndex, "Sajuuk2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Sajuuk3" )
	              print("Sajuuk3 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_HasResearch(playerIndex, "Sajuuk3" ) == 1 and Player_GetRU(playerIndex) > 2000 then
			          if kad_cpu_subpersonality[playerIndexList] == 1 then		--sub belief
			            if Player_CanResearch(playerIndex, "Kadesh1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Kadesh1" )
			              print("Kadesh1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          else
			            if Player_CanResearch(playerIndex, "Garden1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Garden1" )
			              print("Garden1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          end
		          end
						elseif kad_cpu_personality[playerIndexList] == 3 then		-- Kadesh
	            if Player_CanResearch(playerIndex, "Kadesh1" ) == 1 then
	              Player_Research_Smart( playerIndex , "Kadesh1" )
	              print("Kadesh1 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Kadesh2" ) == 1 and Player_HasResearch(playerIndex, "Kadesh1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Kadesh2" )
	              print("Kadesh2 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Kadesh3" ) == 1 and Player_HasResearch(playerIndex, "Kadesh2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Kadesh3" )
	              print("Kadesh3 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_HasResearch(playerIndex, "Kadesh3" ) == 1 and Player_GetRU(playerIndex) > 2000 then
			          if kad_cpu_subpersonality[playerIndexList] == 1 then		--sub belief
			            if Player_CanResearch(playerIndex, "Garden1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Garden1" )
			              print("Garden1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          else
			            if Player_CanResearch(playerIndex, "Sajuuk1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Sajuuk1" )
			              print("Sajuuk1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          end
		          end
						elseif kad_cpu_personality[playerIndexList] == 4 then		-- HYBRID
	            if Player_CanResearch(playerIndex, "Kadesh1" ) == 1 then
	              Player_Research_Smart( playerIndex , "Kadesh1" )
	              print("Kadesh1 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_CanResearch(playerIndex, "Kadesh2" ) == 1 and Player_HasResearch(playerIndex, "Kadesh1" ) == 1 and Player_GetRU(playerIndex) > 2000 then
	              Player_Research_Smart( playerIndex , "Kadesh2" )
	              print("Kadesh2 is chosen by player index: "..playerIndex..", game year: "..year)
	            end
	            if Player_HasResearch(playerIndex, "Kadesh2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
			          if kad_cpu_subpersonality[playerIndexList] == 1 then		--sub belief
			            if Player_CanResearch(playerIndex, "Garden1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Garden1" )
			              print("Garden1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			            if Player_CanResearch(playerIndex, "Garden2" ) == 1 and Player_HasResearch(playerIndex, "Garden1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Garden2" )
			              print("Garden2 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          else
			            if Player_CanResearch(playerIndex, "Sajuuk1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Sajuuk1" )
			              print("Sajuuk1 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			            if Player_CanResearch(playerIndex, "Sajuuk2" ) == 1 and Player_HasResearch(playerIndex, "Sajuuk1" ) == 1 then
			              Player_Research_Smart( playerIndex , "Sajuuk2" )
			              print("Sajuuk2 is chosen by player index: "..playerIndex..", game year: "..year)
			            end
			          end
		          end
						end

---Fleet            
						if Player_CanResearch(playerIndex, "maintenance3" ) == 1 and Player_GetRU(playerIndex) > 4000 then
              Player_Research_Smart( playerIndex , "maintenance3" )
            elseif Player_CanResearch(playerIndex, "maintenance2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
              Player_Research_Smart( playerIndex , "maintenance2" )
            elseif Player_CanResearch(playerIndex, "maintenance1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
              Player_Research_Smart( playerIndex , "maintenance1" )
            end

--late game anti debris
            if year > 10 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_ressourcecollector") <= CPULODvalueList[playerIndexList] then
            	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship") == 1 then
                SobGroup_CreateShip_Smart("kad_needleship"..playerIndex, "kad_ressourcecollector")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_custodian") >= 1 then
                SobGroup_CreateShip_Smart("kad_custodian"..playerIndex, "kad_ressourcecollector")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_podship") >= 1 then
                SobGroup_CreateShip_Smart("kad_podship"..playerIndex, "kad_ressourcecollector")
              end
            end

--needleship self defense
						AI_AutoEngageEnemyCapital("kad_needleship"..playerIndex, "Ion Cannon Real", 40000)



--Raider------------------------------------------------------------------------------------------------------       
     
          elseif Player_GetRace(playerIndex) == Race_Raider then
          	
--crate hunt
						AI_CrateHunter(playerIndex, {"rad_interceptor", "rad_merc_fighter", "rad_merc_interceptor", "rad_scoutcorvette", "rad_merc_scout"}, 10000+15000*CPULODvalueList[playerIndexList], 1+2*CPULODvalueList[playerIndexList])

--scout
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scoutcorvette") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_scout") < Player_CountEnemies(playerIndex) + CPULODvalueList[playerIndexList] then
              local rand=random_pseudo(0,100)
              if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_mothership") == 1 then
              	if rand > 30 then
                	SobGroup_CreateShip_Smart("rad_mothership"..playerIndex, "rad_scoutcorvette")
                else
                	SobGroup_CreateShip_Smart("rad_mothership"..playerIndex, "rad_merc_scout")
                end
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket") >= 1 then
                if rand > 30 then
                	SobGroup_CreateShip_Smart("rad_blackmarket"..playerIndex, "rad_scoutcorvette")
                else
                	SobGroup_CreateShip_Smart("rad_blackmarket"..playerIndex, "rad_merc_scout")
                end
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_hsbouey") >= 1 then
              	SobGroup_CreateShip_Smart("rad_hsbouey"..playerIndex, "rad_merc_scout")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier") >= 1 then
              	SobGroup_CreateShip_Smart("rad_carrier"..playerIndex, "rad_scoutcorvette")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier_black") >= 1 then
              	SobGroup_CreateShip_Smart("rad_carrier_black"..playerIndex, "rad_scoutcorvette")
              end
            end
            
--costruzione forzata    
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket") == 0 and year >= 20/gamespeedprogression then
              if costruzioneforzata("rad_blackmarket", 1, playerIndex, "GhostTech", 20000/aiaids, 60, 6, 0, 1, "rad_hsbouey", "experience") == 1 then
              end
						end
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_hsbouey") < 1 + CPULODvalueList[playerIndexList] then
              if costruzioneforzata("rad_hsbouey", 1, playerIndex, "isai", 900/aiaids, 0, 0, 0, 1 + CPULODvalueList[playerIndexList], "rad_carrier", "experience") == 1 then
              elseif costruzioneforzata("rad_hsbouey", 1, playerIndex, "isai", 900/aiaids, 0, 0, 0, 1 + CPULODvalueList[playerIndexList], "rad_carrier_black", "experience") == 1 then
              elseif costruzioneforzata("rad_hsbouey", 1, playerIndex, "isai", 900/aiaids, 0, 0, 0, 1 + CPULODvalueList[playerIndexList], "rad_resourcecontroller", "experience") == 1 then
              elseif costruzioneforzata("rad_gunfrigate_morgan", 1, playerIndex, "GhostTech", 2800/aiaids, 8, 0, 0, 1+2*CPULODvalueList[playerIndexList], "rad_carrier_black", "experience") == 1 then
              elseif costruzioneforzata("rad_gunfrigate_morgan", 1, playerIndex, "GhostTech", 2800/aiaids, 8, 0, 0, 1+3*CPULODvalueList[playerIndexList], "rad_blackmarket", "experience") == 1 then
              elseif costruzioneforzata("rad_vanaarjet", 1, playerIndex, "AssBusterTech", 13000/aiaids, 35, 3, 0, CPULODvalueList[playerIndexList], "rad_blackmarket", "cb2") == 1 then
              elseif costruzioneforzata("rad_qwaarjetii", 1, playerIndex, "isAdmiral", 12000/aiaids, 35, 3, 0, CPULODvalueList[playerIndexList], "rad_blackmarket", "cb2") == 1 then
              end
            end 

---Fleet            
						if Player_CanResearch(playerIndex, "maintenance3" ) == 1 and Player_GetRU(playerIndex) > 4000 then
              Player_GrantResearchOption_Smart( playerIndex , "maintenance3" )
            elseif Player_CanResearch(playerIndex, "maintenance2" ) == 1 and Player_GetRU(playerIndex) > 2000 then
              Player_GrantResearchOption_Smart( playerIndex , "maintenance2" )
            elseif Player_CanResearch(playerIndex, "maintenance1" ) == 1 and Player_GetRU(playerIndex) > 1000 then
              Player_GrantResearchOption_Smart( playerIndex , "maintenance1" )
            end

						if Player_HasResearch(playerIndex, "Cap_Unlock2" ) == 1 then
	            if Player_CanResearch(playerIndex, "resource2" ) == 1 and Player_GetRU(playerIndex) >= 15000 then
	              Player_GrantResearchOption_Smart( playerIndex , "resource2" )
	            elseif Player_CanResearch(playerIndex, "resource1" ) == 1 and Player_GetRU(playerIndex) >= 5000 then
	              Player_GrantResearchOption_Smart( playerIndex , "resource1" )
	            end
	          end

--Arms Dealer
						if SobGroup_Count("rad_armsdealer"..playerIndex) >= 1 then
							for w=1,4,1 do
								if Player_CanResearch(playerIndex, "WeaponSpeedUpgrade"..w ) == 1 and Player_GetRU(playerIndex) > 2000*w then
	              	Player_Research_Smart( playerIndex , "WeaponSpeedUpgrade"..w )
	              end
	            end
            end

--Power Station
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_powerstation") > 0 and SobGroup_Empty("productioncapital"..playerIndex) == 0 then               
              SobGroup_ParadeSobGroup("rad_powerstation"..playerIndex, "productioncapital"..playerIndex, 0)  
            end

--revive
						if SobGroup_Count("rad_resourcecontroller"..playerIndex) >= 1 and SobGroup_Count("productioncapital"..playerIndex) == 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_hsbouey") < (1 + CPULODvalueList[playerIndexList]) then 
              local numships = SobGroup_SplitGroupReference("SingleReviveRadAI_SOB", "rad_resourcecontroller"..playerIndex, "rad_resourcecontroller"..playerIndex, SobGroup_Count("rad_resourcecontroller"..playerIndex))
              SobGroup_CreateShip_Smart("SingleReviveRadAI_SOB"..random_pseudo(0,numships-1), "rad_hsbouey")
            end

--lord self defense
						AI_AutoEngageEnemyCapital("rad_carrier"..playerIndex, "ModularHardPoint1", 10000)
	          
--big daddy self defense
						AI_AutoEngageEnemyCapital("rad_carrier_black"..playerIndex, "ModularHardPoint1", 10000)
	          
--black market self defense
						AI_AutoEngageEnemyCapital("rad_blackmarket"..playerIndex, "cb6", 40000)
						
						if SobGroup_Count("rad_blackmarket"..playerIndex) >= 1 then
	            --black market research
	            if Player_CanResearch(playerIndex, "TerminalSensitiveProjectileEnforcer" ) == 1 and Player_GetRU(playerIndex) > 10000 then
	              Player_Research_Smart( playerIndex , "TerminalSensitiveProjectileEnforcer" )
	            end
							--black market GAMBLING!!!
							local numships = SobGroup_SplitGroupReference("SingleBlackmarketGamblingAI_SOB", "rad_blackmarket"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_blackmarket"..playerIndex))
							for counter = 0, numships - 1, 1 do
								if SobGroup_GetHardPointHealth("SingleBlackmarketGamblingAI_SOB"..counter, "cb3") > 0 and SobGroup_HealthPercentage("SingleBlackmarketGamblingAI_SOB"..counter) > 0 then
									CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_thedude")
									local bucketlist={"RU","EN","POP","EXP","HONOR"}
									if LastpowerListStored[playerIndexList] >= LastpowerListMax[playerIndexList]-1000+200*CPULODvalueList[playerIndexList] or LastpowerListStored[playerIndexList] == 0 then
										Table_DeleteElement(bucketlist, "EN")
									end
									local current_pop = floor(SobGroup_GetHardPointHealth("SingleBlackmarketGamblingAI_SOB"..counter, "pop")*100000)
									local roomforpop = 2000
									for p=1,6,1 do
										if SobGroup_GetHardPointHealth("SingleBlackmarketGamblingAI_SOB"..counter, "cb"..p) > 0 then
											roomforpop = roomforpop + 2000
										end
									end
									if current_pop >= roomforpop - 2000 or current_pop == 0 then
										Table_DeleteElement(bucketlist, "POP")
									end
									local current_xp = floor(SobGroup_GetHardPointHealth("SingleBlackmarketGamblingAI_SOB"..counter, "experience")*10000)
									if current_xp >= 100+3*CPULODvalueList[playerIndexList] or current_xp == 0 then
										Table_DeleteElement(bucketlist, "EXP")
									end
									if honorList[playerIndexList] >= 30 + 150*CPULODvalueList[playerIndexList] or honorList[playerIndexList] == 0 then
										Table_DeleteElement(bucketlist, "HONOR")
									end
									local thingtodo = Table_RandomElement(bucketlist)
									if thingtodo == "RU" then
										if Player_GetRU(playerIndex) > 10 then
											if Player_GetRU(playerIndex) < 1000 then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_rutotal")
											elseif Player_GetRU(playerIndex) < RUMaxCapacityList[playerIndexList]-25000 and Player_GetRU(playerIndex) > 5000 then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_ru5000")
											end
										end
									elseif thingtodo == "EN" and SobGroup_Count("rad_powerstation"..playerIndex) >= 1 then
										if LastpowerListStored[playerIndexList] > 1 then
											if LastpowerListStored[playerIndexList] < 100 then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_entotal")
											elseif LastpowerListStored[playerIndexList] < LastpowerListMax[playerIndexList]-1000+200*CPULODvalueList[playerIndexList] then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_en100")
											end
										end
									elseif thingtodo == "POP" then
										if current_pop >= 1 then
											if current_pop < 1000 then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_poptotal")
											else
												if current_pop < roomforpop - 2000 then
													CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_pop1000")
												end
											end
										end
									elseif thingtodo == "EXP" then
										if current_xp >= 1 then
											if current_xp < 100 then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_xptotal")
											elseif current_xp < 100+3*CPULODvalueList[playerIndexList] then
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_xp100")
											end
										end
									elseif thingtodo == "HONOR" then
										if honorList[playerIndexList] >= 1 then
											if honorList[playerIndexList] < 30 + 150*CPULODvalueList[playerIndexList] then			--just found the way to win a life biatch!
												CreateSubsystemOnShip("SingleBlackmarketGamblingAI_SOB"..counter,"rad_bm_orders_honortotal")
											end
										end
									end
								end
							end
	          end

--Overseer self destruction + special orders
						if SobGroup_Count("rad_resourcecontroller"..playerIndex) >= 1 then
							local numships = SobGroup_SplitGroupReference("SingleOverseerDetonationAI_SOB", "rad_resourcecontroller"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_resourcecontroller"..playerIndex))
							for counter = 0, numships - 1, 1 do
								if SobGroup_FillProximitySobGroupExceptSelf("temp", "Player_Ships"..playerIndex, "SingleOverseerDetonationAI_SOB"..counter, 4000) == 0 and SobGroup_HealthPercentage("SingleOverseerDetonationAI_SOB"..counter)<0.5 then
									RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_fight")
									RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_cloak")
									RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_run")
									CreateSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_detonate")
								else
									if SobGroup_FillProximitySobGroup ("temp", "rad_resourcecollector"..playerIndex, "SingleOverseerDetonationAI_SOB"..counter, 5000) == 0 then
										RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_detonate")
										RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_cloak")
										RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_run")
										CreateSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_fight")
									else
										if SobGroup_IsDoingAbility("SingleOverseerDetonationAI_SOB"..counter, AB_Move) == 0 then
											RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_fight")
											RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_detonate")
											RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_run")
											CreateSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_cloak")
										else
											if SobGroup_IsDoingAbility("SingleOverseerDetonationAI_SOB"..counter, AB_Builder) == 0 then
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_fight")
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_detonate")
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_cloak")
												CreateSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_run")
											else
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_fight")
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_detonate")
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_cloak")
												RemoveSubsystemOnShip("SingleOverseerDetonationAI_SOB"..counter,"rad_rc_orders_run")
											end
										end
									end
								end
							end
						end

--Die away you fucking shit box!
						if SobGroup_Count("rad_explotrap"..playerIndex) >= 1 then
							local numships = SobGroup_SplitGroupReference("SingleAttackExploTrap_SOB", "rad_explotrap"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_explotrap"..playerIndex))
							for counter = 0, numships - 1, 1 do
								if SobGroup_FillProximitySobGroup ("temp", "productioncapital"..playerIndex, "SingleAttackExploTrap_SOB"..counter, 5000) == 1 or 
								SobGroup_FillProximitySobGroup ("temp", "utilities"..playerIndex, "SingleAttackExploTrap_SOB"..counter, 5000) == 1 or 
								SobGroup_FillProximitySobGroup ("temp", "rad_hsbouey"..playerIndex, "SingleAttackExploTrap_SOB"..counter, 5000) == 1 then
									local distance = 10000+10000*CPULODvalueList[playerIndexList]
									if SobGroup_FillProximitySobGroup ("temp", "bigcapitalenemies"..playerIndex, "SingleAttackExploTrap_SOB"..counter, distance) == 1 then 
			              if SobGroup_PlayerIsInSensorRange("temp", playerIndex) == 1 then
			              	SobGroup_Attack(playerIndex, "SingleAttackExploTrap_SOB"..counter, "temp")
				            end
				          elseif SobGroup_FillProximitySobGroup ("temp", "smallcapitalenemies"..playerIndex, "SingleAttackExploTrap_SOB"..counter, distance) == 1 then 
			              if SobGroup_PlayerIsInSensorRange("temp", playerIndex) == 1 then
			              	SobGroup_Attack(playerIndex, "SingleAttackExploTrap_SOB"..counter, "temp")
				            end
				          elseif SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "SingleAttackExploTrap_SOB"..counter, 1.5*distance) == 1 then 
			              if SobGroup_PlayerIsInSensorRange("temp", playerIndex) == 1 then
			              	SobGroup_Attack(playerIndex, "SingleAttackExploTrap_SOB"..counter, "temp")
				            end
									end
		          	end
		          end
	          end

--choose the best warhead for SCUD launcher
						if SobGroup_Count("rad_scud"..playerIndex) >= 1 then
							local numships = SobGroup_SplitGroupReference("SingleArmSCUD_SOB", "rad_scud"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("rad_scud"..playerIndex))
							local counter = random_pseudo(0,numships-1)
							local warhead = floor(SobGroup_GetHardPointHealth("SingleArmSCUD_SOB"..counter, "warhead")*10)
							if warhead >= 1 and warhead <= 7 then
								if SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 7500) == 1 then
									if Player_CanResearch(playerIndex, "hasCivilModule6") == 1 and SobGroup_HealthPercentage("SingleArmSCUD_SOB"..counter) > 0.8 then
										warhead = 7
									elseif Player_HasResearch(playerIndex, "Cap_Unlock3" ) == 1 and SobGroup_FillProximitySobGroup ("temp", "frigateenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 7500) == 1 then
										warhead = 4
									elseif Player_HasResearch(playerIndex, "Cap_Unlock2" ) == 1 and SobGroup_FillProximitySobGroup ("temp", "frigateenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 7500) == 0 then
										warhead = 3
									elseif Player_HasResearch(playerIndex, "Cap_Unlock1" ) == 1 then
										warhead = 2
									end
								elseif SobGroup_FillProximitySobGroup ("temp", "frigateenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 7500) == 1 then
									if SobGroup_FillProximitySobGroup ("temp", "fighterenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 7500) == 1 or 
									SobGroup_FillProximitySobGroup ("temp", "corvetteenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 7500) == 1 then
										if Player_HasResearch(playerIndex, "Cap_Unlock1" ) == 1 then
											warhead = 2
										elseif Player_CanResearch(playerIndex, "hasCivilModule6") == 1 then
											warhead = 7
										end
									else
										if Player_CanResearch(playerIndex, "hasCivilModule6") == 1 then
											warhead = 7
										elseif Player_HasResearch(playerIndex, "Cap_Unlock1" ) == 1 then
											warhead = 2
										end
									end
								elseif SobGroup_FillProximitySobGroup ("temp", "frigateenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 9500) == 1 then
									if SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 9500) == 1 then
										if Player_HasResearch(playerIndex, "Cap_Unlock2" ) == 1 then
											warhead = 3
										elseif Player_HasResearch(playerIndex, "Cap_Unlock3" ) == 1 then
											warhead = 4
										end
									else
										if Player_HasResearch(playerIndex, "Cap_Unlock3" ) == 1 then
											warhead = 4
										elseif Player_HasResearch(playerIndex, "Cap_Unlock2" ) == 1 then
											warhead = 3
										end
									end
								elseif SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 10500) == 1 then
									if floor(sqrt(SobGroup_GetActualSpeed("SingleArmSCUD_SOB"..counter))) < 80 then
										if Player_CanResearch(playerIndex, "hasCivilModule2" ) == 1 then
											warhead = 6
										end
									elseif SobGroup_IsDoingAbility("SingleArmSCUD_SOB"..counter, AB_Attack) == 1 then
										warhead = 2	--1
									end
								elseif SobGroup_FillProximitySobGroup ("temp", "minetargetenemies"..playerIndex, "SingleArmSCUD_SOB"..counter, 50000) == 1 then
									if Player_HasResearch(playerIndex, "GhostTech" ) == 1 then
										warhead = 5
									end
								end
								--switch to new warhead
								if SobGroup_GetHardPointHealth("SingleArmSCUD_SOB"..counter, "scud_"..warhead) == 0 then   
									if SobGroup_CanDoAbility("SingleArmSCUD_SOB"..counter, AB_Builder) == 1 then
										SobGroup_CreateSubSystem("SingleArmSCUD_SOB"..counter, "rad_scud_"..warhead)
									end
								end
							end
						end

--research madness
						if aiaids > 1 then
							local iRace = Player_GetRace(playerIndex) + 1
							dofilepath([[data:scripts/race.lua]])
							dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
							local totalcost = 0
							for z, iCount in research do
								if (aiaids^2)*(CPULODvalueList[playerIndexList]+1)+floor(year) >= random_pseudo(1,1000) then
									if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 then
										Player_CancelResearch(playerIndex, iCount.Name)
										Player_GrantResearchOption(playerIndex, iCount.Name)
										totalcost = totalcost + iCount.Cost
										researchburned[playerIndexList] = researchburned[playerIndexList] + iCount.Cost
										--print("Research granted for player index: "..playerIndex..", game year: "..year..", item granted: "..iCount.Name)
									end
								end
							end
						end

--Keeper------------------------------------------------------------------------------------------------------       
     
          elseif Player_GetRace(playerIndex) == Race_Keeper then
          	
--crate hunt
						AI_CrateHunter(playerIndex, {"kpr_mover", "kpr_meddler", "kpr_probe_old", "Kpr_AttackDroid", "kpr_interceptor_old"}, 10000+15000*CPULODvalueList[playerIndexList], 1+2*CPULODvalueList[playerIndexList])

--scout
            if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_probe_old") < Player_CountEnemies(playerIndex) + CPULODvalueList[playerIndexList] then
              if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_carrier") >= 1 then
              	SobGroup_CreateShip_Smart("kpr_carrier"..playerIndex, "kpr_probe_old")
              elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_shipyard_old") >= 1 then
              	SobGroup_CreateShip_Smart("kpr_shipyard_old"..playerIndex, "kpr_probe_old")
              end
            end

--choose combat style
						local grantswitch = 0
						if year > 10 - CPULODvalueList[playerIndexList] and Player_HasResearch(playerIndex, "AwakenTheAutonoms") == 0 and Player_HasQueuedResearch(playerIndex, "AwakenTheAutonoms") == 0 then
							grantswitch = 1
						elseif year > 12 - CPULODvalueList[playerIndexList] and 
						Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_resourcecollector") < 1 + CPULODvalueList[playerIndexList] and 
						Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dronestruct") < 1 then
							grantswitch = 1
						elseif year > 13 - CPULODvalueList[playerIndexList] then
							grantswitch = 1
						end
						if kad_cpu_subpersonality[playerIndexList] == 1 then
	            if Player_CanResearch(playerIndex, "ExterminationChoice" ) == 1 and Player_HasQueuedResearch(playerIndex, "ExterminationChoice") == 0 then
	            	if grantswitch == 0 then
	            		if Player_HasResearch(playerIndex, "AwakenTheAutonoms") == 0 then
	            			if Player_CanResearch(playerIndex, "AwakenTheAutonoms" ) == 1 and Player_HasQueuedResearch(playerIndex, "AwakenTheAutonoms") == 0 then
	              			Player_Research_Smart( playerIndex , "AwakenTheAutonoms" )
	              		end
	              	else
	              		--Player_Research_Smart( playerIndex , "ExterminationChoice" )
	              		--print("Extermination RT is chosen by player index: "..playerIndex..", game year: "..year)
	              	end
	              else
	              	Player_GrantResearchOption_Smart( playerIndex , "ExterminationChoice" )
	              	print("Extermination RT is grranted for player index: "..playerIndex..", game year: "..year)
	              end
	            end
	          else
	            if Player_CanResearch(playerIndex, "PacifierChoice" ) == 1 and Player_HasQueuedResearch(playerIndex, "PacifierChoice") == 0 then
	            	if grantswitch == 0 then
	            		if Player_HasResearch(playerIndex, "AwakenTheAutonoms") == 0 then
	            			if Player_CanResearch(playerIndex, "AwakenTheAutonoms" ) == 1 and Player_HasQueuedResearch(playerIndex, "AwakenTheAutonoms") == 0 then
	              			Player_Research_Smart( playerIndex , "AwakenTheAutonoms" )
	              		end
	              	else
	              		--Player_Research_Smart( playerIndex , "PacifierChoice" )
	              		--print("Pacifier RT is chosen by player index: "..playerIndex..", game year: "..year)
	              	end
	              else
	              	Player_GrantResearchOption_Smart( playerIndex , "PacifierChoice" )
	              	print("Pacifier RT is granted for player index: "..playerIndex..", game year: "..year)
	              end
	            end
	          end
	          --print("kpr AI is running for player index: "..playerIndex)
	          
	          if Player_GetRU(playerIndex) > 1000 then
	          	if Player_CanResearch(playerIndex, "QuantumShifting" ) == 1 then
	              Player_Research_Smart( playerIndex , "QuantumShifting" )
	              --print("Quantum Shift is researched by player index: "..playerIndex..", game year: "..year)
	            end
	          end

--spam aid
						if SobGroup_Count("kpr_ressourcecollector_old"..playerIndex) < 9 then
              if costruzioneforzata("kpr_ressourcecollector_old", 1, playerIndex, "isai", 1000/aiaids, 0, 0, 0, 9, "kpr_shipyard_old", "experience") == 1 then
              elseif costruzioneforzata("kpr_ressourcecollector_old", 1, playerIndex, "isai", 1000/aiaids, 0, 0, 0, 9, "kpr_carrier", "experience") == 1 then
              elseif costruzioneforzata("kpr_sentinel", 1, playerIndex, "isai", 1250/aiaids, 4, 0, 0, 1 + CPULODvalueList[playerIndexList], "kpr_shipyard_old", "experience") == 1 then
              elseif costruzioneforzata("kpr_sentinel", 1, playerIndex, "isai", 1250/aiaids, 4, 0, 0, 1 + CPULODvalueList[playerIndexList], "kpr_carrier", "experience") == 1 then
              elseif costruzioneforzata("kpr_marauder", 1, playerIndex, "isai", 1250/aiaids, 2, 0, 0, 1 + CPULODvalueList[playerIndexList], "kpr_shipyard_old", "experience") == 1 then
              elseif costruzioneforzata("kpr_marauder", 1, playerIndex, "isai", 1250/aiaids, 2, 0, 0, 1 + CPULODvalueList[playerIndexList], "kpr_carrier", "experience") == 1 then
              end
            end

	          --refinery
	          if SobGroup_Count("kpr_resourcecollector"..playerIndex) >= 1 and SobGroup_Count("kpr_dronestruct"..playerIndex) < 1 then
	          	if SobGroup_Count("kpr_carrier"..playerIndex) >= 1 then
              	SobGroup_CreateShip_Smart("kpr_carrier"..playerIndex, "kpr_dronestruct")
              elseif SobGroup_Count("kpr_shipyard_old"..playerIndex) >= 1 then
              	SobGroup_CreateShip_Smart("kpr_shipyard_old"..playerIndex, "kpr_dronestruct")
              end
            end

--sleeper self defense
						AI_AutoEngageEnemyCapital("kpr_carrier"..playerIndex, "experience", 10000)
	          
--convert between RUs and energy
						if (LastpowerListStored[playerIndexList] <= 10*CPULODvalueList[playerIndexList] and Player_GetRU(playerIndex) > 1000) or (LastpowerListStored[playerIndexList] <= LastpowerListMax[playerIndexList] - 100 and Player_GetRU(playerIndex) >= RUMaxCapacityList[playerIndexList] - 100) then
							if SobGroup_Count("kpr_ressourcecollector_old"..playerIndex) >= 1 then
								local numships = SobGroup_SplitGroupReference("SingleAIConvertKprGenerator_SOB", "kpr_ressourcecollector_old"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_ressourcecollector_old"..playerIndex))
								local counter = random_pseudo(0,numships-1)
								if SobGroup_IsDocked("SingleAIConvertKprGenerator_SOB"..counter)==0 then
									CreateSubsystemOnShip("SingleAIConvertKprGenerator_SOB"..counter, "kpr_orders_ru1000")
									if Player_GetRU(playerIndex) - 1000/aiaids < 0 then
										Player_SetRU(playerIndex, 0)
									else
										Player_SetRU(playerIndex, Player_GetRU(playerIndex) - 1000/aiaids)
									end
								end
							end
						end
						if Player_GetRU(playerIndex) <= 1000*CPULODvalueList[playerIndexList] then
							if LastpowerListStored[playerIndexList] > 100 and LastpowerListStored[playerIndexList] ~= LastpowerListMax[playerIndexList] then
								if SobGroup_Count("kpr_ressourcecollector_old"..playerIndex) >= 1 then
									local numships = SobGroup_SplitGroupReference("SingleAIConvertKprGeneratorAlt_SOB", "kpr_ressourcecollector_old"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_ressourcecollector_old"..playerIndex))
									local counter = random_pseudo(0,numships-1)
									if SobGroup_IsDocked("SingleAIConvertKprGeneratorAlt_SOB"..counter)==0 then
										CreateSubsystemOnShip("SingleAIConvertKprGeneratorAlt_SOB"..counter, "kpr_orders_en100")
									end
								end
							end
						end

--actions for power generators
						if SobGroup_Empty("kpr_ressourcecollector_old"..playerIndex) == 0 then
							local instantparade = 0
							if Player_HasResearch(playerIndex, "QuantumShifting") == 1 then
								instantparade = 1
							end
							--parade if idle
							local idle_generators = 0
							local numships = SobGroup_SplitGroupReference("SingleAIParadeKprGenerator_SOB", "kpr_ressourcecollector_old"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_ressourcecollector_old"..playerIndex))
							for counter = 0, numships - 1, 1 do
								if SobGroup_IsDocked("SingleAIParadeKprGenerator_SOB"..counter) == 0 and 
								SobGroup_IsDoingAbility("SingleAIParadeKprGenerator_SOB"..counter, AB_Dock) == 0 and
								SobGroup_IsDoingAbility("SingleAIParadeKprGenerator_SOB"..counter, AB_Move) == 0 and
								SobGroup_IsDoingAbility("SingleAIParadeKprGenerator_SOB"..counter, AB_Parade) == 0 and
								SobGroup_AreAllInRealSpace("SingleAIParadeKprGenerator_SOB"..counter) == 1 and
								SobGroup_HealthPercentage("SingleAIParadeKprGenerator_SOB"..counter) > 0 then
									CPU_AddSobGroup(playerIndex, "SingleAIParadeKprGenerator_SOB"..counter)
									if SobGroup_Empty("productioncapital"..playerIndex) == 0 then
										SobGroup_ParadeSobGroup("SingleAIParadeKprGenerator_SOB"..counter, "productioncapital"..playerIndex, instantparade)
									end
								end
								if SobGroup_IsDoingAbility("SingleAIParadeKprGenerator_SOB"..counter, AB_Move) == 0 and 
								SobGroup_IsDocked("SingleAIParadeKprGenerator_SOB"..counter) == 0 and 
								SobGroup_IsDoingAbility("SingleAIParadeKprGenerator_SOB"..counter, AB_Dock) == 0 and 
								SobGroup_AreAllInRealSpace("SingleAIParadeKprGenerator_SOB"..counter) == 1 and 
								SobGroup_HealthPercentage("SingleAIParadeKprGenerator_SOB"..counter) > 0 then
									idle_generators = idle_generators + 1
								end
							end
							--overcharge with power generators
							if idle_generators > 0 then
								SobGroup_Create("KprShipsToOvercharge"..playerIndex)
								SobGroup_Clear("KprShipsToOvercharge"..playerIndex)
								SobGroup_SobGroupAdd("KprShipsToOvercharge"..playerIndex, "kpr_reaver"..playerIndex)
								SobGroup_SobGroupAdd("KprShipsToOvercharge"..playerIndex, "kpr_dreadnaught"..playerIndex)
								if SobGroup_Empty("KprShipsToOvercharge"..playerIndex) == 0 then
									--print("kpr AI overcharge is running for player index: "..playerIndex)
									local numships = SobGroup_SplitGroupReference("SingleKprAISpawnGenerator_SOB", "KprShipsToOvercharge"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("KprShipsToOvercharge"..playerIndex), 0)
									local counter = random_pseudo(0,numships-1)
									SobGroup_Create("KprAIGeneratorsDocked")
									SobGroup_Clear("KprAIGeneratorsDocked")
									SobGroup_GetSobGroupDockedWithGroup("SingleKprAISpawnGenerator_SOB"..counter, "KprAIGeneratorsDocked")
									if SobGroup_Count("KprAIGeneratorsDocked") < 2 then
										--Volume_AddSphere("AIgeneratorVOL_"..playerIndex, SobGroup_GetPosition("SingleKprAISpawnGenerator_SOB"..counter), 800)
										--SobGroup_Create("AIGeneratorSpawnSOB_"..playerIndex)
										--SobGroup_Clear("AIGeneratorSpawnSOB_"..playerIndex)
										--SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_ressourcecollector_old", "AIGeneratorSpawnSOB_"..playerIndex, "AIGeneratorSpawnSOB_"..playerIndex, "AIgeneratorVOL_"..playerIndex)
										local numGenerators = SobGroup_SplitGroupReference("SingleAIDockKprGenerator_SOB", "kpr_ressourcecollector_old"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kpr_ressourcecollector_old"..playerIndex), 0)
										local z = 0
										local num_docked = SobGroup_Count("KprAIGeneratorsDocked")
										while z < numGenerators and num_docked < 2 do
											if SobGroup_Empty("SingleAIDockKprGenerator_SOB"..z) == 0 then
												if SobGroup_IsDoingAbility("SingleAIDockKprGenerator_SOB"..z, AB_Move) == 0 and 
												SobGroup_IsDocked("SingleAIDockKprGenerator_SOB"..z) == 0 and 
												SobGroup_IsDoingAbility("SingleAIDockKprGenerator_SOB"..z, AB_Dock) == 0 and 
												SobGroup_AreAllInRealSpace("SingleAIDockKprGenerator_SOB"..z) == 1 and 
												SobGroup_HealthPercentage("SingleAIDockKprGenerator_SOB"..z) > 0 then
													CPU_RemoveSobGroup(playerIndex, "SingleAIDockKprGenerator_SOB"..z)
													SobGroup_ParadeSobGroup("SingleAIDockKprGenerator_SOB"..z, "SingleKprAISpawnGenerator_SOB"..counter, instantparade)
													SobGroup_DockSobGroupAndStayDocked("SingleAIDockKprGenerator_SOB"..z, "SingleKprAISpawnGenerator_SOB"..counter)
													num_docked = num_docked + 1
												end
											end
											z=z+1
										end
										--Volume_Delete("AIgeneratorVOL_"..playerIndex)
									end
								end
							end
						end
						
--research madness
						if aiaids > 1 then
							local iRace = Player_GetRace(playerIndex) + 1
							dofilepath([[data:scripts/race.lua]])
							dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
							local totalcost = 0
							for z, iCount in research do
								if (aiaids^2)*(CPULODvalueList[playerIndexList]+1)+floor(year) >= random_pseudo(1,1000) then
									if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 then
										Player_CancelResearch(playerIndex, iCount.Name)
										Player_GrantResearchOption(playerIndex, iCount.Name)
										totalcost = totalcost + iCount.Cost
										researchburned[playerIndexList] = researchburned[playerIndexList] + iCount.Cost
										--print("Research granted for player index: "..playerIndex..", game year: "..year..", item granted: "..iCount.Name)
									end
								end
							end
						end

--end of race------------------------------------------------------------------------------------------------------ 
					end
					
					--susbsytem debug (because AI player often loses will to build susbsystems in the later game)
					local debug_subsystem = 0
					if aiaids >= 2 and aiaids <= 5 and debug_subsystem == 1 then
						if year > 20/gamespeedprogression-aiaids then
							if Rule_Exists("AI_SubsystemDebug") == 0 then
								Rule_AddInterval("AI_SubsystemDebug", 1.3457)		--if there's something wrong with this module, it will only crash alone without affecting the main AI function
							end
						else
							Rule_Remove("AI_SubsystemDebug")
						end
					end
					
					--auto dock and repair
					local playervar = playerIndex + 1
					if nfi[playervar] > 0 then
						for i = 0,(nfi[playervar]-1),1 do  	 
							if SobGroup_Empty("splitfighters"..playerIndex .. tostring(i)) == 0 and SobGroup_IsDocked("splitfighters"..playerIndex .. tostring(i)) == 0 then
								if SobGroup_HealthPercentage("splitfighters"..playerIndex .. tostring(i)) <= 0.53 then
									if SobGroup_UnderAttack("splitfighters"..playerIndex..tostring(i)) == 0 then
										if SobGroup_FillProximitySobGroup("temp", "fcdocker"..playerIndex, "splitfighters"..playerIndex..tostring(i), military_list[playervar]*3000) == 1 then
											SobGroup_SetTactics_Smart("splitfighters"..playerIndex..tostring(i), PassiveTactics)
										end
									elseif SobGroup_GetTactics("splitfighters"..playerIndex..tostring(i)) == 1 then
										if SobGroup_FillProximitySobGroup("temp", "enemies"..playerIndex, "splitfighters"..playerIndex..tostring(i), 3000) == 1 then
											SobGroup_SetTactics_Smart("splitfighters"..playerIndex..tostring(i), AggressiveTactics)
										end
									end
								elseif SobGroup_GetTactics("splitfighters"..playerIndex..tostring(i)) == 2 then
									SobGroup_SetTactics_Smart("splitfighters"..playerIndex..tostring(i), DefensiveTactics)
								end
							end
						end
					end
					if nco[playervar] > 0 then
						for i = 0,(nco[playervar]-1),1 do  	 
							if SobGroup_Empty("splitcorvettes"..playerIndex .. tostring(i)) == 0 and SobGroup_IsDocked("splitcorvettes"..playerIndex .. tostring(i)) == 0 then
								if SobGroup_HealthPercentage("splitcorvettes"..playerIndex .. tostring(i)) <= 0.52 then
									if SobGroup_UnderAttack("splitcorvettes"..playerIndex..tostring(i)) == 0 then
										if SobGroup_FillProximitySobGroup("temp", "fcdocker"..playerIndex, "splitcorvettes"..playerIndex..tostring(i), military_list[playervar]*3000) == 1 then
											SobGroup_SetTactics_Smart("splitcorvettes"..playerIndex..tostring(i), PassiveTactics)
										end
									elseif SobGroup_GetTactics("splitcorvettes"..playerIndex..tostring(i)) == 1 then
										if SobGroup_FillProximitySobGroup("temp", "enemies"..playerIndex, "splitcorvettes"..playerIndex..tostring(i), 3000) == 1 then
											SobGroup_SetTactics_Smart("splitcorvettes"..playerIndex..tostring(i), AggressiveTactics)
										end
									end
								elseif SobGroup_GetTactics("splitcorvettes"..playerIndex..tostring(i)) == 2 then
									SobGroup_SetTactics_Smart("splitcorvettes"..playerIndex..tostring(i), DefensiveTactics)
								end
							end
						end
					end
					
					--last resort after losing production ships
					if officerpopList[playerIndexList] == 0 and 
					SobGroup_Empty("productioncapital"..playerIndex) == 1 and 
					GameRulesName ~= "Simplex Territories" and 
					GetGameRubric() ~= GR_CAMPAIGN then
	      		AI_CrateHunter(playerIndex, {"Player_Ships"}, 10000+15000*CPULODvalueList[playerIndexList], 3+3*CPULODvalueList[playerIndexList])
	      		SobGroup_Create("Temp_SuicideSquad")
	      		SobGroup_FillSubstract("Temp_SuicideSquad", "Player_Ships"..playerIndex, "AI_CrateHunterSOB"..playerIndex)
	      		SobGroup_SobGroupSubstract("Temp_SuicideSquad", "SOB_PlayerWaves"..playerIndex)
	      		SobGroup_SobGroupSubstract("Temp_SuicideSquad", "haxor_all_shipswithoutai")
	      		local numships = SobGroup_SplitGroupReference("SingleSuicideAttacker_SOB", "Temp_SuicideSquad", "Player_Ships"..playerIndex, SobGroup_Count("Temp_SuicideSquad"))
						for counter = 0, numships - 1, 1 do
							local target_found = 1
							if SobGroup_IsDoingAbility("SingleSuicideAttacker_SOB"..counter, AB_Attack) == 1 then
								if mod(gametime, numships) <= counter then
									SobGroup_Stop(playerIndex, "SingleSuicideAttacker_SOB"..counter)
								end
							end
							if SobGroup_IsDoingAbility("SingleSuicideAttacker_SOB"..counter, AB_Attack) == 0 and 
							SobGroup_CanDoAbility("SingleSuicideAttacker_SOB"..counter, AB_Attack) == 1 then
								target_found = AI_SobgroupAttackAllEnemiesWithPriority("SingleSuicideAttacker_SOB"..counter)
							end
							if target_found == 0 then
								if SobGroup_Empty("SOB_PlayerWaves"..playerIndex) == 1 then	--don't add cpu to survival wave owner in order to prevent crash.
									CPU_AddSobGroup(playerIndex, "SingleSuicideAttacker_SOB"..counter)
								end
							end
						end
						SobGroup_Clear("Temp_SuicideSquad")
					end
        	--print("AI - End, \t for player index: "..playerIndex)
        end
      end
    end  
    playerIndex = playerIndex + 1
  end    
  
---aggiorna tempodicostruzione x costruzioneforzata  
  for i = 2,4,1 do
    if tempodicostruzioneList[i] >= i then
      tempodicostruzioneList[i] = 1
    else  
      tempodicostruzioneList[i] = tempodicostruzioneList[i] + 1
    end
  end
  --print("AI - End")
end

---costruzione forzata--------------------

function costruzioneforzata(shiptype, tempodicostruzione, giocatore, research, money, pilot, officer, rank, max, builder, module)
  local ship_built = 0
  if ((tempodicostruzioneList[tempodicostruzione] == 1) and
  (Player_HasResearch(giocatore, research) == 1) and
  (Player_GetRU(giocatore) > money) and
  (NeededPilots[giocatore+1] > (pilot*1.5)) and
  (NeededOfficers[giocatore+1] > (officer*1.25)) and
  (honorList[giocatore+1] >= rank) and
  (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(giocatore, shiptype) < (max + CPULODvalueList[giocatore+1]))) then
	  if SobGroup_Empty(builder .. tostring(giocatore)) == 0 then
	  	if SobGroup_Count(builder .. tostring(giocatore)) > 1 then		--pick a builder
	  		local numships = SobGroup_SplitGroupReference("SingleAIAutoBuilding_SOB", builder .. tostring(giocatore), "Player_Ships"..giocatore, SobGroup_Count(builder .. tostring(giocatore)), 0)
				local counter = random_pseudo(0,numships-1)
				local priority_picked = 0
				for serial = 0, numships -1, 1 do		--if there's any ship that isn't building, it's our most favourable builder
					if SobGroup_GetHardPointHealth("SingleAIAutoBuilding_SOB"..serial, module) > 0 then
			    	if SobGroup_CanDoAbility("SingleAIAutoBuilding_SOB"..serial, AB_Builder) == 1 and SobGroup_HealthPercentage("SingleAIAutoBuilding_SOB"..serial) > 0 then
							if SobGroup_IsDocked("SingleAIAutoBuilding_SOB"..serial)==0 and SobGroup_IsDoingAbility("SingleAIAutoBuilding_SOB"..serial, AB_Dock) == 0 and SobGroup_AreAllInRealSpace("SingleAIAutoBuilding_SOB"..serial)==1 then
					      if SobGroup_IsDoingAbility("SingleAIAutoBuilding_SOB"..serial, AB_Builder) == 0 then
					      	counter = serial
					      	priority_picked = 1
					      end
					    end
					  end
					end
				end
				if priority_picked == 1 then
					SobGroup_CreateShip("SingleAIAutoBuilding_SOB"..counter, shiptype)
				  ship_built = 1
				else
					for serial = 0, numships -1, 1 do		--just find one single builder
						if SobGroup_GetHardPointHealth("SingleAIAutoBuilding_SOB"..serial, module) > 0 then
				    	if SobGroup_CanDoAbility("SingleAIAutoBuilding_SOB"..serial, AB_Builder) == 1 and SobGroup_HealthPercentage("SingleAIAutoBuilding_SOB"..serial) > 0 then
								if SobGroup_IsDocked("SingleAIAutoBuilding_SOB"..serial)==0 and SobGroup_IsDoingAbility("SingleAIAutoBuilding_SOB"..serial, AB_Dock) == 0 and SobGroup_AreAllInRealSpace("SingleAIAutoBuilding_SOB"..serial)==1 then
						      if ship_built == 0 then
						      	SobGroup_CreateShip("SingleAIAutoBuilding_SOB"..serial, shiptype)
				  					ship_built = 1
						      end
						    end
						  end
						end
					end
				end
		  else		--only one builder
		   	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(giocatore, builder) > 0 and SobGroup_GetHardPointHealth(builder .. tostring(giocatore), module) > 0 then
		    	if SobGroup_CanDoAbility(builder .. tostring(giocatore), AB_Builder) == 1 and SobGroup_HealthPercentage(builder .. tostring(giocatore)) > 0 then
						if SobGroup_IsDocked(builder .. tostring(giocatore))==0 and SobGroup_IsDoingAbility(builder .. tostring(giocatore), AB_Dock) == 0 and SobGroup_AreAllInRealSpace(builder .. tostring(giocatore))==1 then
				      SobGroup_CreateShip(builder .. tostring(giocatore), shiptype)
				      ship_built = 1
				    end
				  end
				end
		  end
		end
  end
  return ship_built
end

---forced construction in Complex 9.1 (modified)--------------------

function C9_costruzioneforzata(shiptype, tempodicostruzione, giocatore, research, money, pilot, officer, rank, maxn, builder, module, gameprogression)
  local ship_built = 0
  --research criteria
  local hasresearch = 0
  if type(research) == "string" then
  	if Player_HasResearch(giocatore, research) == 1 then
  		hasresearch = 1
  	end
  elseif type(research) == "table" then
  	hasresearch = 1
  	for z, iCount in research do
  		if Player_HasResearch(giocatore, iCount) == 0 then
  			hasresearch = 0
  		end
  	end
  end
  --crew criteria
  local needed_pilots = pilot
  local needed_officers = officer
  if type(pilot) == "string" or type(pilot) == "officer" then		--automatically determine the required crew
  	local autopilot = 0
  	local autoofficer = 0
  	local shiptable = Player_GetShipTableByRace(giocatore)
  	if shiptable ~= nil then
	  	for z, iCount in shiptable do
	  		if iCount.name == shiptype then
	  			if iCount.pilot ~= nil then
	  				autopilot = iCount.pilot
	  			end
	  			if iCount.officer ~= nil then
	  				autoofficer = iCount.officer
	  			end
	  			break
	  		end
	  	end
	  end
	  if type(pilot) == "string" then
	  	needed_pilots = autopilot
	  end
	  if type(officer) == "string" then
	  	needed_officers = autoofficer
	  end
  end
  if ((tempodicostruzioneList2[tempodicostruzione] == 1) and
  (hasresearch == 1) and
  (Player_GetRU(giocatore) > money) and
  (NeededPilots[giocatore+1] > (needed_pilots*1.75)) and
  (NeededOfficers[giocatore+1] > (needed_officers*1.5)) and
  (honorList[giocatore+1] >= rank) and
  (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(giocatore, shiptype) < (maxn + (CPULODvalueList[giocatore+1]/1.5))) and
  (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(giocatore, builder) > 0) and
	year > gameprogression/gamespeedprogression) then
    if SobGroup_Empty(builder .. tostring(giocatore)) == 0 then
    	local numships = SobGroup_SplitGroupReference("SingleAIForcedBuilding_SOB", builder .. tostring(giocatore), "Player_Ships"..giocatore, SobGroup_Count(builder .. tostring(giocatore)), 0)
			local counter = random_pseudo(0,numships-1)
			if SobGroup_Empty("SingleAIForcedBuilding_SOB"..counter) == 0 then
				if SobGroup_CanDoAbility("SingleAIForcedBuilding_SOB"..counter, AB_Builder) == 1 and SobGroup_HealthPercentage("SingleAIForcedBuilding_SOB"..counter) > 0 and SobGroup_IsDoingAbility("SingleAIForcedBuilding_SOB"..counter, AB_Builder) == 0 then
					if SobGroup_IsDocked("SingleAIForcedBuilding_SOB"..counter)==0 and SobGroup_IsDoingAbility("SingleAIForcedBuilding_SOB"..counter, AB_Dock) == 0 and SobGroup_AreAllInRealSpace("SingleAIForcedBuilding_SOB"..counter)==1 then
					  --subsystem criteria
					  local hassubs = 0
					  if type(module) == "string" then
					  	if SobGroup_GetHardPointHealth("SingleAIForcedBuilding_SOB"..counter, module) > 0 then
					  		hassubs = 1
					  	end
					  elseif type(module) == "table" then
					  	hassubs = 1
					  	for z, iCount in module do
					  		if SobGroup_GetHardPointHealth("SingleAIForcedBuilding_SOB"..counter, iCount) == 0 then
					  			hassubs = 0
					  		end
					  	end
					  end
					  if hassubs == 1 then
				      SobGroup_CreateShip("SingleAIForcedBuilding_SOB"..counter, shiptype)
							--local sup = gameprogression/gamespeedprogression
				      --Subtitle_Message("AI: Built "..shiptype .. " " .. sup, 7)			
				      ship_built = 1
				    end
				  end
				end
	    end
    end
  end
  return ship_built
end

---forced research--------------------

function researchforzata(type, giocatore, research, money, rank, gameprogression)
  if ((Player_HasResearch(giocatore, research) == 1 and Player_HasResearch(giocatore, type) == 0 and Player_CanResearch(giocatore, type) == 1 and Player_HasQueuedResearch(giocatore, type) == 0) and
  (Player_GetRU(giocatore) > money) and
  (honorList[giocatore+1] >= rank) and    
	year > gameprogression/gamespeedprogression+(7-CPULODvalueList[giocatore+1]*2)) then
    Player_GrantResearchOption(giocatore, type)
		--local sup = gameprogression/gamespeedprogression
    --Subtitle_Message("AI: Researched "..type .. " " .. sup, 7)			
		return 1    
  else
  	return 0
  end  
end

function AI_IMadeThisOnlyToKickYourAss()
	--print("AI_IMadeThisOnlyToKickYourAss - Start")
	if year >= 1 then		--not for the fainthearted!
	  local playerIndex = 0
	  local playerIndexList = 0
	  while playerIndex < Universe_PlayerCount() do
	    playerIndexList = playerIndex + 1
	    if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
	        if Player_HasResearch(playerIndex, "isai" ) == 1 then
	          --level of difficulty
	          local CPU_LOD=CPULODvalueList[playerIndexList]		--from 0 to 3 for easy to expert
	          
	          --Anti-Rape System
	          local OwnHonour = honorList[playerIndexList]
	          if OwnHonour >= 100 then
		          local playerVar = 0
		          local TargetHonour = OwnHonour
		          while playerVar < Universe_PlayerCount() do
		          	if Player_IsAlive(playerVar) == 1 and AreAllied(playerVar, playerIndex) == 0 and playerVar ~= playerIndex then
		          		if honorList[playerVar+1] > TargetHonour then
		          			TargetHonour = honorList[playerVar+1]
			          	end
		          	end
		          	playerVar = playerVar + 1
		          end
		          --anti-rape fleet multiplier
		          local HonourRatio = 1
		          if TargetHonour - OwnHonour >= 100-CPU_LOD*30 then
          			HonourRatio = TargetHonour/OwnHonour
          		end
		          if SobGroup_Empty("supporter"..playerIndex) == 0 then
			          if HonourRatio > 1 then
			          	CreateSubsystemOnShip("supporter"..playerIndex, "ai_antirape")
			          	SobGroup_SetHardPointHealth_Smart("supporter"..playerIndex, "ai_antirape", (1.5-CPU_LOD/2)/HonourRatio)
			          else
			          	RemoveSubsystemOnShip("supporter"..playerIndex, "ai_antirape")
			          end
			        end
			        --anti-rape research burn
			        if random_pseudo(1,100) < (1+CPU_LOD)*HonourRatio^2 then
				        local iRace = Player_GetRace(playerIndex) + 1
				        dofilepath([[data:scripts/race.lua]])
								dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
								local totalcost = 0
								for z, iCount in research do
									if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 then
										Player_CancelResearch(playerIndex, iCount.Name)
										Player_GrantResearchOption(playerIndex, iCount.Name)
										totalcost = totalcost + iCount.Cost
										researchburned[playerIndexList] = researchburned[playerIndexList] + iCount.Cost
										--print("Research granted for player index: "..playerIndex..", game year: "..year..", item granted: "..iCount.Name)
									end
								end
							end
		        end
	          
	          --Blatant Cheating
						if hwsaving <= CPU_LOD*3 then	 		--expert is best at cheating
							--ru injection
							if Player_GetRU(playerIndex) < 500+(CPULODvalueList[playerIndexList]*100) then   
								Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (500+(CPULODvalueList[playerIndexList]*500)))
							end
							--Air Combat
							if SobGroup_Empty("meg_carrier_huge"..playerIndex) == 0 then
								local research_list={
								{"AirCombatBuildUpgrade", 4}, 
								{"AirCombatAssemblyLineUpgrade", 3}, 
								{"AirCombatCapacityUpgrade", 6}, 
								{"Aircombat_FighterTech", 3}, 
								{"Aircombat_StrikecraftTech", 5}, 
								{"Aircombat_BomberTech", 3}, 
								{"Aircombat_SpecialTech", 4}
								}
								local id=random_pseudo(1,7)
								local level=random_pseudo(1,research_list[id][2])
								local item=research_list[id][1]..level
								if Player_CanResearch(playerIndex, item) == 1 then
									Player_GrantResearchOption_Smart(playerIndex, item)
								end
							end
							--Hiigaran                       
							if Player_GetRace(playerIndex) == Race_Hiigaran then      
								--Fleet
								if SobGroup_Count("hgn_shipyard"..playerIndex) == 0 then		--noob stage
									if C9_costruzioneforzata("Hgn_ArtilleryDestroyer",3, playerIndex, "ArtilleryDestroyerTech", 1500, 21, 1, 0, 3+2*CPU_LOD, "hgn_mothership", "Production 4", 11-CPU_LOD*2) == 1 then
									elseif C9_costruzioneforzata("hgn_cruiserb", 	           3, playerIndex, "CruiserTech",            2000, 23, 2, 0, 3, "hgn_mothership", "Production 4", 11-CPU_LOD*2) == 1 then
									elseif C9_costruzioneforzata("hgn_advdestroyer",      3, playerIndex, "AdvDestroyerTech",       1500, 21, 1, 0, 3, "hgn_mothership", "Production 4", 11-CPU_LOD*2) == 1 then
									elseif C9_costruzioneforzata("Hgn_IonCannonFrigate",  2, playerIndex, "IonFrigateTech",    		  500,  8,  0, 0, 5+2*CPU_LOD, "hgn_mothership", "Production 2", 7-CPU_LOD) == 1 then 
									elseif C9_costruzioneforzata("Hgn_DefenseFieldFrigate", 2, playerIndex, "DefenseFieldFrigateShield", 500,  7,  0, 0, 1+2*CPU_LOD, "hgn_mothership", "Production 1", 7-CPU_LOD) == 1 then
									end
								else			--expert stage
									if C9_costruzioneforzata("hgn_battlecruiserNUKE", 3, playerIndex, "BattlecruiserNukeWeapons",2000, 25, 3, 480, 3+CPU_LOD,  "hgn_shipyard", "Production 4", 13-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("hgn_battleship", 				2, playerIndex, "BattleshipTech",					2000, 45, 5, 240, 2+CPU_LOD,  "hgn_shipyard", "Production 4", 13-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("hgn_vortex", 						1, playerIndex, "VortexTech",							2000, 35, 4, 240, 2+CPU_LOD,  "hgn_shipyard", "Production 4", 13-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("hgn_battlecruiser",         3, playerIndex, "BattlecruiserIonWeapons",2500, 25, 3, 150, 2+CPU_LOD,"hgn_shipyard", "Production 4", 13-CPU_LOD) == 1 then  
									elseif C9_costruzioneforzata("Hgn_ArtilleryDestroyer",3, playerIndex, "ArtilleryDestroyerTech", 1500, 21, 1, 0, 3+CPU_LOD,  "hgn_shipyard", "Production 4", 7-CPU_LOD) == 1 then
									end
								end
								if C9_costruzioneforzata("hgn_artillerysentinel",     1, playerIndex, "Sentinel",               4000, 10, 1, 0, 2+CPU_LOD, "hgn_mothership", "experience", 10-CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("hgn_rts",               1, playerIndex, "RTS",                    2000, 5,  0, 0, 1+CPU_LOD, "hgn_mothership", "experience", 8-CPU_LOD) == 1 then
								end
								if C9_costruzioneforzata("hgn_nuclearbomb",           3, playerIndex, "NBDetonationPower1",           6000, 0,  0, 0, CPU_LOD,  "hgn_commandfortress", "Generic 1", 20-CPU_LOD*3) == 1 then 
								end
								if C9_costruzioneforzata("hgn_patcher",           3, playerIndex, "isai",         						  300, 0,  0, 0, 6*CPU_LOD,  "hgn_tanker", "ftam1", 6-CPU_LOD*2) == 1 then 
								end
								---ricerca tech forzata
								if researchforzata("RTS",                    			playerIndex, "isai", 2000, 0,   6) == 1 then
								elseif researchforzata("Sentinel",                playerIndex, "isai", 4000, 0,   11) == 1 then
								--
								elseif researchforzata("DestroyerTech",           playerIndex, "isai", 1000, 0,   13-CPU_LOD*2) == 1 then   
								elseif researchforzata("AdvDestroyerTech",        playerIndex, "isai", 1500, 0,   16-CPU_LOD*2) == 1 then
								elseif researchforzata("ArtilleryDestroyerTech",  playerIndex, "isai", 1500, 0,   16-CPU_LOD*2) == 1 then
								elseif researchforzata("CruiserTech",             playerIndex, "isai", 2500, 0,   19-CPU_LOD*3) == 1 then 
								elseif researchforzata("BattlecruiserIonWeapons", playerIndex, "isai", 3000, 150, 22-CPU_LOD*4) == 1 then
								elseif researchforzata("VortexTech",              playerIndex, "isai", 3500, 150, 25-CPU_LOD*4) == 1 then
								elseif researchforzata("BattleshipTech",          playerIndex, "isai", 4000, 240, 28-CPU_LOD*5) == 1 then
								end				
								---ricerca forzata
								if researchforzata    ("crewcellcargo1",            playerIndex, "isai", 200,  0, 1) == 1 then
								elseif researchforzata("crewcellcargo2",            playerIndex, "isai", 400,  0, 1) == 1 then
								elseif researchforzata("crewcellcargo3",            playerIndex, "isai", 600,  0, 1) == 1 then
								elseif researchforzata("ImprovedTorpedoMothership", playerIndex, "isai", 1000, 0, 1) == 1 then
								elseif researchforzata("hic1",                      playerIndex, "isai", 2000, 0, 10) == 1 then
								elseif researchforzata("hic2",                      playerIndex, "isai", 3000, 0, 15) == 1 then
								--						
								elseif researchforzata("NBDetonationPower",         playerIndex, "isai", 4000, 0, 20-CPU_LOD*2) == 1 then
								elseif researchforzata("NBDetonationRange",         playerIndex, "isai", 4000, 0, 20-CPU_LOD*2) == 1 then
								elseif researchforzata("NBDetonationPower1",        playerIndex, "isai", 5000, 0, 30-CPU_LOD*3) == 1 then
								elseif researchforzata("NBDetonationRange1",        playerIndex, "isai", 5000, 0, 30-CPU_LOD*3) == 1 then
								elseif researchforzata("NBDetonationPower2",        playerIndex, "isai", 6000, 0, 40-CPU_LOD*5) == 1 then
								elseif researchforzata("NBDetonationRange2",        playerIndex, "isai", 6000, 0, 40-CPU_LOD*5) == 1 then
								end
								
		--Vaygr------------------------------------------------------------------------------------------------------       
				 
							elseif Player_GetRace(playerIndex) == Race_Vaygr then
								--Fleet
	              if SobGroup_Count("vgr_shipyard"..playerIndex) == 0 then		--noob stage
		              if C9_costruzioneforzata("Vgr_LightCruiser", 		        3, playerIndex, "IonCruiserTech", 			2000, 20, 2, 0,   2, "vgr_mothership", "Production 4", 11-CPU_LOD) == 1 then
		              elseif C9_costruzioneforzata("Vgr_LightCruiser_Gun", 		3, playerIndex, "IonCruiserTech", 			2000, 20, 2, 0,   2+CPU_LOD, "vgr_mothership", "Production 4", 11-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("Vgr_artilleryship", 		  3, playerIndex, "ArtilleryTech",    		1500, 20, 2, 0,   3+CPU_LOD, "vgr_mothership", "Production 4", 10-CPU_LOD) == 1 then       						
									elseif C9_costruzioneforzata("vgr_destroyer", 		        3, playerIndex, "DestroyerGuns",         1000, 15, 1, 0,   3, "vgr_mothership", "Production 4", 9-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_hammerhead",  			  3, playerIndex, "KeeperIonWeapons",       3000, 10 , 1, 150, 2+CPU_LOD, "vgr_mothership", "Production 4", 7-CPU_LOD) == 1 then						
									elseif C9_costruzioneforzata("Vgr_Bioship",              3, playerIndex, "BioTech",               1250, 0,  0, 350,   27, "vgr_mothership", "Production 1", 7-CPU_LOD) == 1 then   
		              elseif C9_costruzioneforzata("Vgr_MissileBomber",         3, playerIndex, "MissileBomberTech",         400, 6,  0, 0,   5+2*CPU_LOD, "vgr_mothership", "Production 1", 5-CPU_LOD) == 1 then							
									end
								else	--expert stage
									if C9_costruzioneforzata("vgr_battlecruiser_hero",   3, playerIndex, "BattlecruiserNukeWeapons",  3500,  30, 3, 480, 3+CPU_LOD, "vgr_shipyard", "Production 4", 12-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_superbattleship", 	    		3, playerIndex, "TitanTech",        9500, 50, 6, 350, 2, "vgr_shipyard", "Production 4", 20-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_missledreadnaught", 	      3, playerIndex, "TitanTech",				9500, 40, 3, 350, 2, "vgr_shipyard", "Production 4", 17-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_battleship", 	    	        3, playerIndex, "TitanTech",        7500, 35, 3, 350, 2, "vgr_shipyard", "Production 4", 14-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_alkhalid", 	    	         3, playerIndex, "BattleshipTech",        3000, 35, 3, 240, 2, "vgr_shipyard", "Production 4", 13-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_missilebattlecruiser", 3, playerIndex, "MissileBattlecruiserIonWeapons",  2500,  25, 3, 150, 2, "vgr_shipyard", "Production 4", 12-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("vgr_heavycruiser", 		     3, playerIndex, "PeacemakerTech", 				2000, 30, 3, 150,   2, "vgr_shipyard", "Production 4", 11-CPU_LOD) == 1 then   													
									elseif C9_costruzioneforzata("Vgr_artilleryship", 		   2, playerIndex, "ArtilleryTech",    			1500, 20, 2, 0,   3+CPU_LOD, "vgr_shipyard", "Production 4", 10-CPU_LOD) == 1 then       						
									elseif C9_costruzioneforzata("vgr_hammerhead", 		       3, playerIndex, "KeeperIonWeapons",      2500, 10, 1, 150,   3+CPU_LOD, "vgr_shipyard", "Production 4", 9-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("Vgr_LightCruiser_Gun", 		 2, playerIndex, "IonCruiserTech", 				2000, 20, 2, 0,   2+CPU_LOD, "vgr_shipyard", "Production 4", 11-CPU_LOD) == 1 then
									elseif C9_costruzioneforzata("Vgr_ArtilleryFrigate",     2, playerIndex, "ArtilleryGunTech",      600, 8 , 0, 0,   2+2*CPU_LOD, "vgr_shipyard", "Production 3", 7-CPU_LOD) == 1 then						
									elseif C9_costruzioneforzata("Vgr_CommandCorvette",      1, playerIndex, "CorvetteCommand",       250, 2,  0, 0,   2+2*CPU_LOD, "vgr_shipyard", "Production 2", 7-CPU_LOD) == 1 then   
		              elseif C9_costruzioneforzata("Vgr_AM",         					 2, playerIndex, "AMGuns",         				1500, 12,  0, 0,   3+CPU_LOD, "vgr_mothership", "Production 4", 5-CPU_LOD) == 1 then								
									end		--
								end
								if C9_costruzioneforzata("vgr_weaponplatform_missile",   2, playerIndex, "PlatformHeavyMissiles", 1000, 2, 0, 0, 3, "vgr_mothership", "experience", 4) == 1 then
								elseif C9_costruzioneforzata("vgr_weaponplatform_gun",   2, playerIndex, "isai",                  1000, 1, 0, 0, 3, "vgr_mothership", "experience", 3) == 1 then
	              elseif C9_costruzioneforzata("vgr_weaponplatform_lance", 2, playerIndex, "isai",                  1000, 1, 0, 0, 3, "vgr_mothership", "experience", 2) == 1 then
								end
								--ricerca tech forzata
								if researchforzata("PlatformHeavyMissiles",       playerIndex, "isai", 1000, 0,   9-2*CPU_LOD) == 1 then
								--
								elseif researchforzata("DestroyerGuns",           playerIndex, "isai", 1000, 0,   13-2*CPU_LOD) == 1 then
								elseif researchforzata("PulseDestroyerGuns",      playerIndex, "isai", 1500, 0,   16-3*CPU_LOD) == 1 then
								elseif researchforzata("CruiserTech",             playerIndex, "isai", 2000, 30,  19-4*CPU_LOD) == 1 then
								elseif researchforzata("ArtilleryTech",           playerIndex, "isai", 2000, 30,  19-4*CPU_LOD) == 1 then
								elseif researchforzata("IonCruiserTech",          playerIndex, "isai", 2000, 30,  19-4*CPU_LOD) == 1 then
								elseif researchforzata("BattlecruiserNukeWeapons", playerIndex, "isai", 2500, 480, 22-4*CPU_LOD) == 1 then
								elseif researchforzata("BattlecruiserIonWeapons", playerIndex, "isai", 2500, 150, 22-4*CPU_LOD) == 1 then
								elseif researchforzata("BattleshipTech",          playerIndex, "isai", 3000, 240, 25-4*CPU_LOD) == 1 then
								elseif researchforzata("DreadnaughtTech",         playerIndex, "isai", 3500, 240, 28-4*CPU_LOD) == 1 then
								elseif researchforzata("TitanTech",     playerIndex, "isai", 9000, 350, 32-5*CPU_LOD) == 1 then
								elseif researchforzata("CommandFortressTech",     playerIndex, "isai", 4000, 350, 31-5*CPU_LOD) == 1 then
								elseif researchforzata("AMGuns",          			 	playerIndex, "isai", 2000, 30,  19-4*CPU_LOD) == 1 then
								--upgrades
								elseif researchforzata("ImprovedShotgunLightCruiser",           playerIndex, "isai", 2000, 0,   16-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoBattleship",           playerIndex, "isai", 2000, 0,   22-3*CPU_LOD) == 1 then
								elseif researchforzata("FreackerBattleship",           playerIndex, "isai", 3000, 0,   23-3*CPU_LOD) == 1 then
								elseif researchforzata("JDAMdesignator",         					  playerIndex, "isai", 2000, 0,   16-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedNukeCannonBattlecruiser",   playerIndex, "isai", 4000, 0,  	25-3*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoDestroyer",           playerIndex, "isai", 2000, 0,   15-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoPulseDestroyer",           playerIndex, "isai", 2000, 0,   16-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoCruiser",           playerIndex, "isai", 2000, 0,   16-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoCruiser1",           playerIndex, "isai", 2000, 0,   17-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoLightCruiser",           playerIndex, "isai", 2000, 0,   17-2*CPU_LOD) == 1 then
								elseif researchforzata("ImprovedTorpedoBattlecruiser",           playerIndex, "isai", 2000, 0,   17-2*CPU_LOD) == 1 then
								end	
							
							
		--Kadeshi------------------------------------------------------------------------------------------------------       
				 
							elseif Player_GetRace(playerIndex) == Race_Kadeshi then
								
								if AI_CloneSpammingBasedOnShipList(playerIndex, 3, "armedcapital", "kad_needleship", 6000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "frigate", "kad_needleship", 1800) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "corvette", "kad_needleship", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "fighter", "kad_needleship", 600) == 1 then
								elseif C9_costruzioneforzata("kad_destroyer",  	 			3, playerIndex, {"Sajuuk1", "SupCapTech"},                8000, 30, 3, 0, 2+CPU_LOD, "kad_needleship", "Production 1", 16-2*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kad_destroyer_real",  	3, playerIndex, "HyperspaceTech",                  				5000, 20, 2, 0, 1+2*CPU_LOD, "kad_needleship", "Production 1", 14-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kad_custodian",  	 			2, playerIndex, {"HyperspaceTech", "Garden1"},            6000, 20, 2, 0, 2+CPU_LOD, "kad_needleship", "Production 1", 14-2*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kad_needleship",  	 		2, playerIndex, "SupCapTech",                  						8000, 50, 6, 0, 1, 	"kad_needleship", "Production 1", 17-2*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kad_nebuladrone",  	 		1, playerIndex, "Garden2",            							500, 	2, 0, 0, 2+2*CPU_LOD, 	"kad_needleship", 	"experience", 7-2*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kad_snail",  	 					1, playerIndex, "isai",                  						1200, 4, 0, 0, 3+3*CPU_LOD, 	"kad_needleship", 	"experience", 7-2*CPU_LOD) == 1 then
								end
								if AI_CloneSpammingBasedOnShipList(playerIndex, 3, "corvette", "kad_podship", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "fighter", "kad_podship", 600) == 1 then
								elseif C9_costruzioneforzata("kad_missilepod",  	 				1, playerIndex, "Garden1",                  						400, 10, 0, 0, 3+3*CPU_LOD, 	"kad_podship", 	"experience", 7-2*CPU_LOD) == 1 then
								end
								if AI_CloneSpammingBasedOnShipList(playerIndex, 3, "corvette", "kad_destroyer", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "fighter", "kad_destroyer", 600) == 1 then
								end
								if C9_costruzioneforzata("kad_snail",  	 		3, playerIndex, "isai",                  						1200, 4, 0, 0, 3+4*CPU_LOD, 	"kad_custodian", 		"experience", 7-2*CPU_LOD) == 1 then
								end
								
		--Turanic Raiders------------------------------------------------------------------------------------------------------       
				 
							elseif Player_GetRace(playerIndex) == Race_Raider then
								if AI_CloneSpammingBasedOnShipList(playerIndex, 3, "armedcapital", "rad_carrier", 2000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "frigate", "rad_carrier", 800) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "corvette", "rad_carrier", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "fighter", "rad_carrier", 600) == 1 then
								elseif C9_costruzioneforzata("rad_scaffoldB",  	 					3, playerIndex, "GhostTech",                  				4000, 30, 2, 0, 1, 	"rad_carrier", "experience", 15-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_scudscaffolda",  	 			2, playerIndex, "isCommodore",                  			4000, 30, 3, 0, 1+2*CPU_LOD, 	"rad_carrier", "experience", 17-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_CruiserscaffoldA",  	 	3, playerIndex, "Cap_Unlock3",                  			4000, 30, 3, 0, 1+CPU_LOD, 		"rad_carrier", "experience", 16-3*CPU_LOD) == 1 then
								end
								if AI_CloneSpammingBasedOnShipList(playerIndex, 2, "armedcapital", "rad_carrier_black", 2000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "frigate", "rad_carrier_black", 800) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "corvette", "rad_carrier_black", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "fighter", "rad_carrier_black", 600) == 1 then
								elseif C9_costruzioneforzata("rad_cruiser_queenscaffolda",  	 	2, playerIndex, "GhostTech",                  	5000, 35, 3, 0, 1+CPU_LOD, 		"rad_carrier_black", "experience", 16-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_scudscaffolda",  	 			3, playerIndex, "isCommodore",                  			4000, 30, 3, 0, 1+2*CPU_LOD, 	"rad_carrier_black", "experience", 17-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_gunfrigate_morgan",  	 	2, playerIndex, "GhostTech",                  				1000, 8, 0, 0, 2+3*CPU_LOD, 	"rad_carrier_black", "experience", 15-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_scaffoldB",  	 					3, playerIndex, "GhostTech",                  				4000, 30, 2, 0, 1, 	"rad_carrier_black", "experience", 15-3*CPU_LOD) == 1 then
								end
								if C9_costruzioneforzata("rad_blackmarket",  	 					3, playerIndex, "GhostTech",                  					4000, 60, 6, 0, 0, 	"rad_mothership", "experience", 15-3*CPU_LOD) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "armedcapital", "rad_mothership", 2000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "frigate", "rad_mothership", 800) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "corvette", "rad_mothership", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "fighter", "rad_mothership", 600) == 1 then
								elseif C9_costruzioneforzata("rad_merc_battlecruiser",  	2, playerIndex, "isCommodore",                  			5000, 35, 3, 0, 1+CPU_LOD/2, 	"rad_mothership", "experience", 16-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_scudscaffolda",  	 			3, playerIndex, "isCommodore",                  			4000, 30, 3, 0, 1+CPU_LOD, 		"rad_mothership", "experience", 17-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_scaffoldB",  	 					2, playerIndex, "GhostTech",                  				4000, 30, 2, 0, 1, 	"rad_mothership", "experience", 15-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_scaffoldA",  	 					3, playerIndex, "Cap_Unlock2",                  			3000, 30, 2, 0, 0, 	"rad_mothership", "experience", 15-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_gunfrigate",  	 				2, playerIndex, "Cap_Unlock1",                  			500, 8, 0, 0, 1+CPU_LOD, 	"rad_mothership", "experience", 12-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_guncorvette",  	 				3, playerIndex, "isai",                  							200, 3, 0, 0, 1+CPU_LOD, 	"rad_mothership", "experience", 10-3*CPU_LOD) == 1 then
								end
								if AI_CloneSpammingBasedOnShipList(playerIndex, 3, "armedcapital", "rad_blackmarket", 2000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "frigate", "rad_blackmarket", 800) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "corvette", "rad_blackmarket", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "fighter", "rad_blackmarket", 600) == 1 then
								elseif C9_costruzioneforzata("rad_vanaarjet",  	 						3, playerIndex, {"AssBusterTech", "isAdmiral"},       6000, 35, 3, 0, 2+CPU_LOD, 	"rad_blackmarket", "cb2", 17-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_qwaarjetii",  	 					2, playerIndex, "isAdmiral",                  				5000, 35, 3, 0, 2+CPU_LOD, 	"rad_blackmarket", "cb2", 15-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_helios",  	 							3, playerIndex, "isCommodore",                  			4000, 30, 3, 0, 1+CPU_LOD, 	"rad_blackmarket", "experience", 16-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("rad_refurbisheddestroyer",  	2, playerIndex, "isCaptain",                  				3000, 30, 2, 0, 1+CPU_LOD, 	"rad_blackmarket", "experience", 14-3*CPU_LOD) == 1 then
								end
								if C9_costruzioneforzata("rad_blackmarket",  	 					3, playerIndex, "GhostTech",                  						4000, 60, 6, 0, 0, 	"rad_hsbouey", "experience", 15-3*CPU_LOD) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "armedcapital", "rad_hsbouey", 2000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "frigate", "rad_hsbouey", 800) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "corvette", "rad_hsbouey", 700) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "fighter", "rad_hsbouey", 600) == 1 then
								end
								local bouey_spawn_list = {"rad_carrier", "rad_carrier_black", "rad_mothership", "rad_blackmarket", "rad_resourcecontroller"}
								if C9_costruzioneforzata("rad_hsbouey",  	 					1, playerIndex, "isai",                  				500, 2, 0, 0, 2+CPU_LOD, 	Table_RandomElement(bouey_spawn_list), "experience", 11-3*CPU_LOD) == 1 then
								end
								
		--Progenitor------------------------------------------------------------------------------------------------------       
				 
							elseif Player_GetRace(playerIndex) == Race_Keeper then
								if C9_costruzioneforzata("kpr_carrier",  	 					3, playerIndex, "SleeperTech",                  				4000, 30, 2, 150, 1, 	"kpr_shipyard_old", "experience", 13-3*CPU_LOD) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "armedcapital", "kpr_shipyard_old", 6000) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 1, "frigate", "kpr_shipyard_old", 1600) == 1 then
								elseif C9_costruzioneforzata("kpr_sajuuk",  	 					3, playerIndex, "SajuukTech",                  				20000, 60, 6, 480, 1+CPU_LOD, 		"kpr_shipyard_old", "experience", 17-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kpr_dreadnaught",  	 			2, playerIndex, "DreadnaughtTech",                  	7000, 35, 3, 350, 1+CPU_LOD, 		"kpr_shipyard_old", "experience", 16-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kpr_destroyer",  	 				1, playerIndex, "KeeperTech",                  				4000, 15, 1, 80, 1+CPU_LOD, 			"kpr_shipyard_old", "experience", 15-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kpr_deciever",  	 				3, playerIndex, "DeceiverTech",                  			1500, 8, 0, 0, 1+CPU_LOD, 			"kpr_shipyard_old", "experience", 11-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kpr_guardian",  	 				2, playerIndex, "BruteTech",                  				2000, 8, 0, 0, 2+3*CPU_LOD, 		"kpr_shipyard_old", "experience", 13-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kpr_hunter",  	 					1, playerIndex, "HunterTech",                  				2000, 8, 0, 0, 2+2*CPU_LOD, 		"kpr_shipyard_old", "experience", 	12-3*CPU_LOD) == 1 then
								elseif C9_costruzioneforzata("kpr_seeker",  	 					3, playerIndex, "SeekerTech",                  				1500, 8, 0, 0, 2+CPU_LOD, 			"kpr_shipyard_old", "experience", 11-3*CPU_LOD) == 1 then
								end
								if C9_costruzioneforzata("kpr_shipyard_old",  	 					3, playerIndex, "QuantumShifting",                  				4000, 40, 3, 80, 0, 	"kpr_carrier", "experience", 13-3*CPU_LOD) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 2, "frigate", "kpr_carrier", 1600) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 1, "corvette", "kpr_carrier", 900) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "fighter", "kpr_carrier", 800) == 1 then
								end
								if AI_CloneSpammingBasedOnShipList(playerIndex, 2, "fighter", "kpr_destroyer", 800) == 1 then
								end
								if AI_CloneSpammingBasedOnShipList(playerIndex, 1, "corvette", "kpr_hive", 900) == 1 then
								elseif AI_CloneSpammingBasedOnShipList(playerIndex, 3, "fighter", "kpr_hive", 800) == 1 then
								end
								--research frigates
								if researchforzata("DeceiverTech",       			playerIndex, "AwakenTheAutonoms", 2000, 0,   8-2*CPU_LOD) == 1 then
								elseif researchforzata("BruteTech",           playerIndex, "AwakenTheAutonoms", 2500, 0,   11-3*CPU_LOD) == 1 then
								elseif researchforzata("SeekerTech",      		playerIndex, "AwakenTheAutonoms", 1000, 0,   7-2*CPU_LOD) == 1 then
								elseif researchforzata("HunterTech",          playerIndex, "AwakenTheAutonoms", 3000, 0, 	 10-3*CPU_LOD) == 1 then
								end
								--research fighters
								if researchforzata("ShifterTech",         playerIndex, "isai", 1500, 0,   10-3*CPU_LOD) == 1 then
								elseif researchforzata("AgitatorTech",       			playerIndex, "isai", 1000, 0,   7-2*CPU_LOD) == 1 then
								end
								--research corvettes
								if researchforzata("ShifterComboTech",        				 playerIndex, "isai", 2000, 0,   11-3*CPU_LOD) == 1 then
								elseif researchforzata("AgitatorShifterComboTech",         playerIndex, "isai", 1500, 0,   10-3*CPU_LOD) == 1 then
								elseif researchforzata("AgitatorComboTech",       						 playerIndex, "isai", 1000, 0,   8-2*CPU_LOD) == 1 then
								end
								--research capital ships
								if researchforzata("SleeperTech",       	 			playerIndex, "AwakenTheSentients", 2500, 150,   14-3*CPU_LOD) == 1 then
								elseif researchforzata("DreadnaughtTech",       playerIndex, "AwakenTheSentients", 4000, 350,   16-3*CPU_LOD) == 1 then
								elseif researchforzata("SajuukTech",       	 		playerIndex, "AwakenTheSentients", 5500, 480,   17-3*CPU_LOD) == 1 then
								elseif researchforzata("HiveTech",        			playerIndex, "AwakenTheSentients", 2000, 30,   	12-3*CPU_LOD) == 1 then
								elseif researchforzata("KeeperTech",         	 	playerIndex, "AwakenTheSentients", 3000, 80,   	13-3*CPU_LOD) == 1 then
								elseif researchforzata("ReaverTech",        		playerIndex, "AwakenTheSentients", 3500, 240,   15-3*CPU_LOD) == 1 then
								end
								
							end			--end of races
						else	
						  --textList[CPULODvalueList[playerIndexList]+1] = 0	
						end 
					end	
	      end  
	    end  
	    playerIndex = playerIndex + 1
	  end
	end
  local next_interval = 71.5192
  if aiaids == 2 then
  	next_interval = 71.5192
  elseif aiaids == 3 then
  	next_interval = 51.5192
  elseif aiaids == 4 then
  	next_interval = 36.5192
  elseif aiaids == 5 then
  	next_interval = 21.5192
  end
  Rule_RandomInterval("AI_IMadeThisOnlyToKickYourAss", next_interval, 0.5)
  
  ---aggiorna tempodicostruzione x costruzioneforzata  
  for i = 2,4,1 do
    if tempodicostruzioneList2[i] >= i then
      tempodicostruzioneList2[i] = 1
    else  
      tempodicostruzioneList2[i] = tempodicostruzioneList2[i] + 1
    end
  end
  --print("AI_IMadeThisOnlyToKickYourAss - End")
end

---Clone ships that are being built based on ship list-----------------------------
function AI_CloneSpammingBasedOnShipList(playerIndex, tempodicostruzione, buildtype, builder, RU)
	local shipbuilt = 0
	if tempodicostruzioneList3[tempodicostruzione] == 1 then
		local CPU_RU = Player_GetRU(playerIndex)
		local builder = tostring(builder)..playerIndex
		if SobGroup_Empty(builder) == 0 and CPU_RU > RU then
			local shiptable = Player_GetShipTableByRace(playerIndex)
			if shiptable ~= nil then
				--print("Kick-ass AI function is running for "..builder)
				local numships = SobGroup_SplitGroupReference("SingleAIShipSpamming_SOB", builder, "Player_Ships"..playerIndex, SobGroup_Count(builder), 0)
				for counter = 0, numships - 1, 1 do
					if SobGroup_Empty("SingleAIShipSpamming_SOB"..counter) == 0 then
						if SobGroup_CanDoAbility("SingleAIShipSpamming_SOB"..counter, AB_Builder) == 1 and SobGroup_HealthPercentage("SingleAIShipSpamming_SOB"..counter) > 0 then
							if SobGroup_IsDocked("SingleAIShipSpamming_SOB"..counter)==0 and SobGroup_IsDoingAbility("SingleAIShipSpamming_SOB"..counter, AB_Dock) == 0 and SobGroup_AreAllInRealSpace("SingleAIShipSpamming_SOB"..counter)==1 then
								local buildtable = {{},{},{}}		--ship name, required pilots, required officers
								local tableindex = 1
								for z, iCount in shiptable do
									if iCount.class == buildtype then
										if SobGroup_IsBuilding("SingleAIShipSpamming_SOB"..counter, iCount.name) == 1 then
											buildtable[1][tableindex] = iCount.name		--store the build list
											if iCount.pilot ~= nil then
												buildtable[2][tableindex] = iCount.pilot
											else
												buildtable[2][tableindex] = 0
											end
											if iCount.officer ~= nil then
												buildtable[3][tableindex] = iCount.officer
											else
												buildtable[3][tableindex] = 0
											end
											tableindex = tableindex +1
										end
									end
								end
								if getn(buildtable[1]) > 0 then		--pick some thing to build from the build table
									if getn(buildtable[1]) == 1 then		--only one type to build
										local shiptobuild = buildtable[1][1]
										if NeededPilots[playerIndex+1] >= buildtable[2][1]*2 and NeededOfficers[playerIndex+1] >= buildtable[3][1]*2 then
											SobGroup_CreateShip("SingleAIShipSpamming_SOB"..counter, shiptobuild)
											shipbuilt = 1
											--print("<AI Hax> Cloning one "..shiptobuild.." on "..builder.." for player Index: "..playerIndex..", game year: "..year)
										end
									else			--build a random type from the table
										local randomindex = random_pseudo(1,getn(buildtable[1]))
										local shiptobuild = buildtable[1][randomindex]
										if NeededPilots[playerIndex+1] >= buildtable[2][randomindex]*2 and NeededOfficers[playerIndex+1] >= buildtable[3][randomindex]*2 then
											SobGroup_CreateShip("SingleAIShipSpamming_SOB"..counter, shiptobuild)
											shipbuilt = 1
											--print("<AI Hax> Cloning one "..shiptobuild.." (by random) on "..builder.." for player Index: "..playerIndex..", game year: "..year)
										end
									end
								end
							end
						end
					end
				end
			end
			if shipbuilt == 1 then
				Player_SetRU(playerIndex, CPU_RU-RU/(CPULODvalueList[playerIndex+1]+1))
			end
		end
	end
	return shipbuilt
end

---Juggernaut-----------------------------

function aijuggernaught()  
  if nj == 0 then
    return
  end
  if njCounter == 0 then   
    for i = 1,6,1 do                       
      alternatejug[njCounter] = 0
    end
  end       	          
	if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "isai" ) == 1 and SobGroup_Empty("splitjuggernaughts"..njCounter) == 0 then	         	
----MOVE/KAMIKAZE		
	  if alternatejug[SobGroup_OwnedBy("splitjuggernaughts"..njCounter) + 1] == 0 then			                 							    						      				      
	    distance = 1000
	    while SobGroup_Count("targetjuggernaughts"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter)) == 0 and distance < 90000 do
	      if SobGroup_FillProximitySobGroup ("targetjuggernaughts"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "bigcapitalenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, distance) == 1 then  
	        if distance <= 2000 then							          
	          SobGroup_Kamikaze("splitjuggernaughts"..njCounter, "targetjuggernaughts"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter))
	        else   	          
	          SobGroup_MoveToSobGroup("splitjuggernaughts"..njCounter, "targetjuggernaughts"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter))
	          SobGroup_Attack(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, "targetjuggernaughts"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter))
	        end  
	        break
	      end      
	      distance = distance + 1000
	    end  
	    SobGroup_Clear("targetjuggernaughts"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter))
	    alternatejug[SobGroup_OwnedBy("splitjuggernaughts"..njCounter) + 1] = 1
	  else
	    alternatejug[SobGroup_OwnedBy("splitjuggernaughts"..njCounter) + 1] = 0  		
	  end   
----PRIORITA'
    if SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1525) == 1 then         
      SobGroup_Kamikaze("splitjuggernaughts"..njCounter, "temp")      
    end   	  
----EXPLODE					      			            			    
	  explode = 0					      
	  exploderange = 1					      
	  if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationPower2" ) == 1 then
	    exploderange = 1.75
	  elseif Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationPower1" ) == 1 then
	    exploderange = 1.5
	  elseif Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationPower" ) == 1 then
	    exploderange = 1.25
	  end	             				          
--fighter									      
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "fighterenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 2750 * exploderange) 
	  SobGroup_FillProximitySobGroup ("proximityalliesjuggernaughts", "fighterallies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 2750 * exploderange)		  			      					      
	  if SobGroup_Count("proximityenemiesjuggernaughts") > 32 then
	    explode = explode + 3
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") > 27 then 
	    explode = explode + 2 
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") >= 22 then 
	    explode = explode + 1   
	  end	
	  if SobGroup_Count("proximityalliesjuggernaughts") > 32 then
	    explode = explode - 3
	  elseif SobGroup_Count("proximityalliesjuggernaughts") > 27 then 
	    explode = explode - 2 
	  elseif SobGroup_Count("proximityalliesjuggernaughts") >= 22 then 
	    explode = explode - 1   
	  end	
--corvette                      
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "corvetteenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 2250 * exploderange) 
	  SobGroup_FillProximitySobGroup ("proximityalliesjuggernaughts", "corvetteallies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 2250 * exploderange)		                       
	  if SobGroup_Count("proximityenemiesjuggernaughts") > 20 then
	    explode = explode + 3
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") > 17 then 
	    explode = explode + 2 
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") >= 14 then 
	    explode = explode + 1   
	  end	   
	  if SobGroup_Count("proximityalliesjuggernaughts") > 20 then
	    explode = explode - 3
	  elseif SobGroup_Count("proximityalliesjuggernaughts") > 17 then 
	    explode = explode - 2 
	  elseif SobGroup_Count("proximityalliesjuggernaughts") >= 14 then 
	    explode = explode - 1   
	  end	         
--frigate/Utility             
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "frigateenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1750 * exploderange) 
	  SobGroup_FillProximitySobGroup ("proximityalliesjuggernaughts", "frigateallies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1750 * exploderange)	                              
	  if SobGroup_Count("proximityenemiesjuggernaughts") > 6 then
	    explode = explode + 3
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") > 5 then 
	    explode = explode + 2 
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") >= 3 then 
	    explode = explode + 1   
	  end		
	  if SobGroup_Count("proximityalliesjuggernaughts") > 6 then
	    explode = explode - 3
	  elseif SobGroup_Count("proximityalliesjuggernaughts") > 5 then 
	    explode = explode - 2 
	  elseif SobGroup_Count("proximityalliesjuggernaughts") >= 3 then 
	    explode = explode - 1   
	  end		
	  if SobGroup_AreAnyOfTheseTypes("proximityenemiesjuggernaughts", "hgn_hscore") then
	    explode = explode + 3
	  end
	  if SobGroup_AreAnyOfTheseTypes("proximityalliesjuggernaughts", "hgn_hscore") then
	    explode = explode - 3
	  end            
--Small Capital                  
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "smallcapitalenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1400 * exploderange) 
	  SobGroup_FillProximitySobGroup ("proximityalliesjuggernaughts", "smallcapitalallies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1400 * exploderange)		                   
	  if SobGroup_Count("proximityenemiesjuggernaughts") > 2 then
	    explode = explode + 3
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") > 1 then 
	    explode = explode + 2 
	  elseif SobGroup_Count("proximityenemiesjuggernaughts") > 0 then 
	    explode = explode + 1   
	  end	
	  if SobGroup_Count("proximityalliesjuggernaughts") > 3 then
	    explode = explode - 3
	  elseif SobGroup_Count("proximityalliesjuggernaughts") > 2 then 
	    explode = explode - 2 
	  elseif SobGroup_Count("proximityalliesjuggernaughts") > 1 then 
	    explode = explode - 1   
	  end	
--Big Capital					                     
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "bigcapitalenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1150 * exploderange) 
	  SobGroup_FillProximitySobGroup ("proximityalliesjuggernaughts", "bigcapitalallies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1150 * exploderange)		                   
	  if SobGroup_Count("proximityenemiesjuggernaughts") >= 1 then
	    explode = explode + 3					      
	  end	
	  if SobGroup_Count("proximityalliesjuggernaughts") >= 1 then
	    explode = explode - 1					      
	  end	
--Vicino a Command Fortress
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "commandfortressenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 2350) 	
	  if SobGroup_Count("proximityenemiesjuggernaughts") >= 1 then
	    explode = explode + 4                         			      
	  end		  
--Vicino a Big Capital
	  SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "bigcapitalenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 1000) 	
	  if SobGroup_Count("proximityenemiesjuggernaughts") >= 1 then
	    explode = explode + 3                         			      
	  end	
--Vicino a scudo
  	SobGroup_FillProximitySobGroup ("proximityenemiesjuggernaughts", "massshieldenemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 2000) 	
	  if SobGroup_Count("proximityenemiesjuggernaughts") >= 1 then
	    explode = explode + 4                         			      
	  end	  
--Explode						      							      			      
	  if explode >= 3 then
	    SobGroup_TakeDamage("splitjuggernaughts"..njCounter, 1)
--RESEARCH						        
      juggernaughtList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1] = juggernaughtList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1] + 1 			        
      if (juggernaughtList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1] >= (4 - CPULODvalueList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1])) and (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "hgn_juggernaught") > 0) then
        if Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationPower" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "DetonationPower" ) 
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationRange" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "DetonationRange" ) 
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "JuggernaughtMAXHEALTHUpgrade1" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "JuggernaughtMAXHEALTHUpgrade1" ) 
        end 
      end   
      if (juggernaughtList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1] >= (5 - CPULODvalueList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1])) and (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "hgn_juggernaught") > 0) and (Player_GetRU(SobGroup_OwnedBy("splitjuggernaughts"..njCounter)) >= 2500) then
        if Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationPower1" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "DetonationPower1" )
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationRange1" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "DetonationRange1" ) 
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "JuggernaughtMAXHEALTHUpgrade2" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "JuggernaughtMAXHEALTHUpgrade2" ) 
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "JuggernaughtMAXSPEEDUpgrade1" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "JuggernaughtMAXSPEEDUpgrade1" )   
        end  
      end  
      if (juggernaughtList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1] >= (7 - CPULODvalueList[SobGroup_OwnedBy("splitjuggernaughts"..njCounter)+1])) and (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "hgn_juggernaught") > 1) and (Player_GetRU(SobGroup_OwnedBy("splitjuggernaughts"..njCounter)) >= 5000) then
        if Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationPower2" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "DetonationPower2" )
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "DetonationRange2" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "DetonationRange2" ) 
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "JuggernaughtMAXHEALTHUpgrade3" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "JuggernaughtMAXHEALTHUpgrade3" ) 
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "JuggernaughtMAXSPEEDUpgrade2" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "JuggernaughtMAXSPEEDUpgrade2" )  
        elseif Player_CanResearch(SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "JuggernaughtDRIVEUpgrade1" ) == 1 then
          Player_Research_Smart( SobGroup_OwnedBy("splitjuggernaughts"..njCounter) , "JuggernaughtDRIVEUpgrade1" )        
        end  
      end    	    
		end 
	end
	
	if SobGroup_Empty("splitjuggernaughts"..njCounter) == 0 then			
---se jug vicino a target colpo di reni per attacco speed x 4, lo fa anche x i giocatori non AI   
	  if SobGroup_FillProximitySobGroup ("temp", "enemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter,1050) == 1 then
	    if SobGroup_IsDoingAbility("splitjuggernaughts"..njCounter, abilityList[2]) == 1 then 	
			  if SobGroup_AreAnyFromTheseAttackFamilies("temp", "Mothership, BigCapitalShip, SmallCapitalShip") == 1 then
			    spd = SobGroup_HealthPercentage("splitjuggernaughts"..njCounter)	
			    if spd > 0 then		                 
			      SobGroup_SetMaxSpeedMultiplier("splitjuggernaughts"..njCounter, (4.45*spd))	
			      FX_StartEvent("splitjuggernaughts"..njCounter, "urlo")	  
			    end    			     					      
			  end	 
			end 
		else
		  SobGroup_SetMaxSpeedMultiplier("splitjuggernaughts"..njCounter, 1) 	  
		end		
---se vicinissimo esplode		
		if SobGroup_FillProximitySobGroup ("temp", "enemies"..SobGroup_OwnedBy("splitjuggernaughts"..njCounter), "splitjuggernaughts"..njCounter, 185) == 1 then	    
		  if SobGroup_AreAnyFromTheseAttackFamilies("temp", "Mothership, BigCapitalShip, SmallCapitalShip") == 1 then			                 
		    SobGroup_TakeDamage("splitjuggernaughts"..njCounter, 1)			     					      
		  end	 			 		
		end			
	end		
	
	njCounter = njCounter + 1
  if njCounter >= nj then
    njCounter = 0
  end   
  Rule_Remove("aijuggernaught")
	Rule_AddInterval("aijuggernaught", (5.6789/nj))
end

function AI_SpawnDummyHSGateAroundTargetAndAddToGroup(target, radius, SOBtoAdd)		--the more concentrate the target group is, the better the hyperspace warfare will turn out to be
	local gate_spawned = 0
	if SobGroup_Empty(target) == 0 then
		local pos = {0, 0, 0}
		pos = SobGroup_GetPosition(target)
		local coord = {0, 0, 0}
		local theta = random_pseudo(-90,90)
		local beta = random_pseudo(0,360)
		coord[1] = pos[1] + radius*cos(theta)*cos(beta)
		coord[2] = pos[2] + radius*sin(theta)
		coord[3] = pos[3] + radius*cos(theta)*sin(beta)
		local unique_serial = random_pseudo(0,50000)
		Volume_AddSphere("VOL_AISpawnDummyHSGate"..target..unique_serial, coord, 5000)
		SobGroup_Create("SOB_Temp_DummyHSGates")
		SobGroup_Clear("SOB_Temp_DummyHSGates")
		SobGroup_SpawnNewShipInSobGroup(-1, "meg_dummy_hyperspace_platform", "DummyHSGate", "SOB_Temp_DummyHSGates", "VOL_AISpawnDummyHSGate"..target..unique_serial)
		SobGroup_SobGroupAdd("SOB_AllDummyHSGates", "SOB_Temp_DummyHSGates")		--SOB of all dummy gates spawned
		--SobGroup_MakeUntargeted("SOB_Temp_DummyHSGates")
		--SobGroup_MakeUntargeted("SOB_AllDummyHSGates")
		--SobGroup_SetSwitchOwnerFlag("SOB_AllDummyHSGates", 0)
		SobGroup_SobGroupAdd(SOBtoAdd, "SOB_Temp_DummyHSGates")									--add to a cunstomized SOB for additional operations
		--SobGroup_SetSwitchOwnerFlag(SOBtoAdd, 0)
		--SobGroup_MakeUntargeted(SOBtoAdd)
		--SobGroup_SetInvulnerability("SOB_Temp_DummyHSGates", 1)
		gate_spawned = 1
		--print("Spawning meg_dummy_hyperspace_platform at "..target..", added to: "..SOBtoAdd..", total: "..SobGroup_Count("SOB_AllDummyHSGates")..", year: "..Debug_year())
		Volume_Delete("VOL_AISpawnDummyHSGate"..target..unique_serial)
	end
	return gate_spawned
end

AI_AugmentedSkills_Runtimes = 6+2	--the first 6 are for 6 individual players, the rest are for other system functions
function AI_AugmentedSkills()		--Made mainly for hyperspace warfare!
	if 1==1 then
		--return
	end
	local debugger_printer = function(str)
		--print(str)
	end
  Temp_GlobalVariable.AI_AugmentedSkills_Save = Temp_GlobalVariable.AI_AugmentedSkills_Save + 1
	if Temp_GlobalVariable.AI_AugmentedSkills_Save > AI_AugmentedSkills_Runtimes then		--one runtime for one small chunk of the codes
		Temp_GlobalVariable.AI_AugmentedSkills_Save = 1
	end
	debugger_printer("---AI_AugmentedSkills() start--- Cycle: "..Temp_GlobalVariable.AI_AugmentedSkills_Save..", year: "..Debug_year())
  Update_AllShips()
  --Kill useless gates
  if Temp_GlobalVariable.AI_AugmentedSkills_Save == 7 and SobGroup_Count("SOB_AllDummyHSGates") >= 2 then
  	local numHSP = SobGroup_SplitGroupReference("SingleDummyHSGateToKill_SOB", "SOB_AllDummyHSGates", "AllShips", SobGroup_Count("SOB_AllDummyHSGates"), 0)
		for counter = 0, numHSP-1, 1 do
			local gatetokill = "SingleDummyHSGateToKill_SOB"..counter
			if SobGroup_HealthPercentage(gatetokill) > 0 then
				if SobGroup_IsGroupNearybyExcludingSelf(gatetokill, "AllShips", 8000) == 0 then
					debugger_printer("Killing useless gates, gate count: "..SobGroup_Count("SOB_AllDummyHSGates")..", year: "..Debug_year())
					SobGroup_SetHealth(gatetokill, 0)
				end
				--newly added: slowly kill gates to facilitate dynamic relink
				local health = SobGroup_HealthPercentage(gatetokill)
				local dmg = 0.5
				if aiaids == 2 then
					dmg = 0.4
				elseif aiaids == 3 then
					dmg = 0.3
				elseif aiaids == 4 then
					dmg = 0.2
				elseif aiaids == 5 then
					dmg = 0.1
				end
				SobGroup_SetHealth_Smart(gatetokill, SobGroup_HealthPercentage(gatetokill) - dmg)
			end
		end
	end
  --Kill dummy gates switched to AI owners
  debugger_printer("--Kill dummy gates switched to AI owners")
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
    if Temp_GlobalVariable.AI_AugmentedSkills_Save == playerIndexList and Player_IsAlive(playerIndex) == 1 then
    	SobGroup_Create("DummyHSGatesOwnedByPlayer_SOB")
    	SobGroup_Clear("DummyHSGatesOwnedByPlayer_SOB")
			Player_FillShipsByType("DummyHSGatesOwnedByPlayer_SOB", playerIndex, "meg_dummy_hyperspace_platform")
			if SobGroup_Empty("DummyHSGatesOwnedByPlayer_SOB") == 0 then
				local numGates = SobGroup_SplitGroupReference("DummyHSGatesOwnedByPlayer_SOB_Single", "DummyHSGatesOwnedByPlayer_SOB", "Player_Ships"..playerIndex, SobGroup_Count("DummyHSGatesOwnedByPlayer_SOB"), 0)
				for counter = 0, numGates -1, 1 do
					local gatetokill = "DummyHSGatesOwnedByPlayer_SOB_Single"..counter
					if SobGroup_Empty(gatetokill) == 0 then
						local health = SobGroup_HealthPercentage(gatetokill)
						if health > 0 then
							local dmg = 0.3
							if aiaids == 2 then
								dmg = 0.45
							elseif aiaids == 3 then
								dmg = 0.37
							elseif aiaids == 4 then
								dmg = 0.33
							elseif aiaids == 5 then
								dmg = 0.27
							end
							if health - dmg < 0 then
								debugger_printer("Killing "..gatetokill.." owned by player"..SobGroup_OwnedBy(gatetokill)..", year: "..Debug_year())
							end
							SobGroup_SetHealth_Smart(gatetokill, health - dmg)
						end
					end
				end
			end
    end
    playerIndex = playerIndex + 1
  end
  --Spawn dummy hyperspace gates
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
    if Temp_GlobalVariable.AI_AugmentedSkills_Save == playerIndexList and Player_IsAlive(playerIndex) == 1 then
      if SobGroup_Count("SOB_DummyHSGatesAroundPlayer"..playerIndex) < 5-hyperspace*3 then		--hyperspace accessibility limits the max number of gates to be spawned
      	local SpawnLocationList = {"productioncapital"..playerIndex, "smallcapitals"..playerIndex, "utilities"..playerIndex}
      	local close_factor = 1
      	if SobGroup_AllEmpty(SpawnLocationList) == 1 then
      		SpawnLocationList = {"frigates"..playerIndex, "othersnoparade"..playerIndex}
      		close_factor = 0.3
      	end
      	if SobGroup_AllEmpty(SpawnLocationList) == 1 then
      		SpawnLocationList = {"corvettes"..playerIndex, "fighters"..playerIndex}
      		close_factor = 0.15
      	end
      	local spawncount = 0
      	for z, iCount in SpawnLocationList do
      		if SobGroup_Count(iCount) >= 1 then	--3*z
      			local num_spammer = SobGroup_SplitGroupReference("SingleDummyHSGateSpammer_SOB", iCount, "Player_Ships"..playerIndex, SobGroup_Count(iCount), 0)
      			local spammer_serial = random_pseudo(0,num_spammer-1)
      			spawncount = spawncount + AI_SpawnDummyHSGateAroundTargetAndAddToGroup("SingleDummyHSGateSpammer_SOB"..spammer_serial, 6000*close_factor, "SOB_DummyHSGatesAroundPlayer"..playerIndex)
      		else
      			spawncount = spawncount + AI_SpawnDummyHSGateAroundTargetAndAddToGroup(iCount, 6000*close_factor, "SOB_DummyHSGatesAroundPlayer"..playerIndex)
      		end
      	end
      	if spawncount == 0 then		--failed to spawn at multiple locations, use the entire fleet as the spawn location instead
      		close_factor = 0.5
        	SobGroup_Create("jumptarget"..playerIndex)
	        SobGroup_SobGroupAdd("jumptarget"..playerIndex, "Player_Ships"..playerIndex)
	        SobGroup_SobGroupSubstract("jumptarget"..playerIndex, "supporter"..playerIndex)
	        SobGroup_SobGroupSubstract("jumptarget"..playerIndex, "shipwreck"..playerIndex)
	        SobGroup_SobGroupSubstract("jumptarget"..playerIndex, "SOB_AllDummyHSGates")
	        if SobGroup_Count("jumptarget"..playerIndex) >= 1 then
      			AI_SpawnDummyHSGateAroundTargetAndAddToGroup("jumptarget"..playerIndex, 6000*close_factor, "SOB_DummyHSGatesAroundPlayer"..playerIndex)
      		end
      		SobGroup_Clear("jumptarget"..playerIndex)	--clear the big group to avoid lag
      	end
      end
    end
    playerIndex = playerIndex + 1
  end
  --Form hyperspace network
  if Temp_GlobalVariable.AI_AugmentedSkills_Save == 8 and SobGroup_Count("SOB_AllDummyHSGates") >= 2 then
  	local numHSP = SobGroup_SplitGroupReference("SingleDummyHSGate_SOB", "SOB_AllDummyHSGates", "AllShips", SobGroup_Count("SOB_AllDummyHSGates"), 0)
  	local connectome = {}	--table to avoid conflicting connection, will this solve the 00000010 crash? Nope. The crash is most likely linked with make untargeted command.
		local z = 0		--gate A
		for z_iter = 0, random_pseudo(numHSP,2*numHSP), 1 do
			z = random_pseudo(0,numHSP - 1)
			local gateA = "SingleDummyHSGate_SOB"..z
			local y = random_pseudo(0,numHSP-1)		--gate B
			local gateB = "SingleDummyHSGate_SOB"..y
			if SobGroup_Empty(gateA) == 0 and 
			SobGroup_Empty(gateB) == 0 and 
			SobGroup_HealthPercentage(gateA) > 0.15 and 
			SobGroup_HealthPercentage(gateB) > 0.15 and 
			SobGroup_IsGateDeployed(gateA, gateB) == 0 and 	--don't repeat connection, but allows flexibility for other old links to break
			SobGroup_IsDoingAbility(gateA, AB_FormHyperspaceGate) == 0 and --newly added: will this cure 00000030 crash?
			SobGroup_IsDoingAbility(gateB, AB_FormHyperspaceGate) == 0 and --newly added: will this cure 00000030 crash?
			SobGroup_GetDistanceToSobGroup(gateA, gateB) > 13000 then
				local lastcount = getn(connectome)
				connectome = Table_InsertUnique(connectome, {z,y})
				if lastcount + 2 == getn(connectome) then
					--debugger_printer("Link begins.")
					debugger_printer("Forming link between "..z.." (p:"..SobGroup_OwnedBy(gateA).." d:"..SobGroup_IsDoingAbility(gateA, AB_FormHyperspaceGate)..") and "..y.." (p:"..SobGroup_OwnedBy(gateB).." d:"..SobGroup_IsDoingAbility(gateB, AB_FormHyperspaceGate).."), year: "..Debug_year())
					SobGroup_FormHyperspaceGate(gateA, gateB)
					--debugger_printer("Link formed.")
				end
			end
		end
	end
	--AI using dummy hyperspace gates
	debugger_printer("--AI using dummy hyperspace gates")
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
    if Temp_GlobalVariable.AI_AugmentedSkills_Save == playerIndexList and Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
        if Player_HasResearch(playerIndex, "isai" ) == 1 then
          --level of difficulty
          local CPU_LOD=CPULODvalueList[playerIndexList]		--from 0 to 3 for easy to expert
          if SobGroup_Count("SOB_AllDummyHSGates") >= 2 then
          	--prepare ships to jump
          	SobGroup_Create("AIShipsToJumpViaDummyGates_SOB")
						SobGroup_Clear("AIShipsToJumpViaDummyGates_SOB")
						local jump_list={}
          	if Player_GetRace(playerIndex) == Race_Hiigaran then
          		jump_list={"armedcapital", "frigate"}
          		if military_list[playerIndexList] == 5 then
          			jump_list={"armedcapital", "frigate", "platform"}
          		elseif military_list[playerIndexList] == 1 then
          			jump_list={"productioncapital", "armedcapital"}
          		end
          	elseif Player_GetRace(playerIndex) == Race_Vaygr then
          		jump_list={"armedcapital", "frigate"}
          		if military_list[playerIndexList] == 5 then
          			jump_list={"armedcapital", "frigate", "platform"}
          		elseif military_list[playerIndexList] == 1 then
          			jump_list={"smallcapitals", "armedcapital"}
          		end
          	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
          		jump_list={"armedcapital", "frigate"}
          		if military_list[playerIndexList] == 5 then
          			jump_list={"armedcapital", "frigate", "platform"}
          		elseif military_list[playerIndexList] == 1 then
          			jump_list={"productioncapital", "armedcapital"}
          		end
						elseif Player_GetRace(playerIndex) == Race_Raider then
							jump_list={"armedcapital", "frigate"}
							if military_list[playerIndexList] == 5 then
          			jump_list={"armedcapital", "frigate", "platform"}
          		elseif military_list[playerIndexList] == 1 then
          			jump_list={"trader", "armedcapital"}
          		end
						elseif Player_GetRace(playerIndex) == Race_Keeper then
							jump_list={"armedcapital", "frigate", "corvette", "fighter"}
							if military_list[playerIndexList] == 5 then
          			jump_list={"armedcapital", "frigate", "corvette", "fighter", "platform"}
          		elseif military_list[playerIndexList] == 1 then
          			jump_list={"productioncapital", "armedcapital"}
          		end
						end
						if getn(jump_list) > 0 then
							local shiptable = Player_GetShipTableByRace(playerIndex)
					  	if shiptable ~= nil then
						  	for z, iCount in shiptable do
						  		for j=1, getn(jump_list), 1 do
						  			if iCount.class == jump_list[j] then
						  				if SobGroup_Empty(iCount.name..playerIndex) == 0 then		--ship name in ship_list must have the same upper/lower cases with the sobgroup name, strlower() isn't really a solution here
						  					SobGroup_SobGroupAdd("AIShipsToJumpViaDummyGates_SOB", iCount.name..playerIndex)
						  				end
						  			end
						  		end
						  	end
						  end
						  --perform hyperspace jump
						  debugger_printer("--perform hyperspace jump, player:"..playerIndex)
						  local JumpingFleetSize = (15-CPU_LOD*military_list[playerIndexList])/(0.1*min(officerrecruitList[playerIndexList], 45))
						  if JumpingFleetSize < 1 then
						  	JumpingFleetSize = 1
						  end
						  if SobGroup_Count("AIShipsToJumpViaDummyGates_SOB") >= JumpingFleetSize then		--1 for testing
		          	local numHSP = SobGroup_SplitGroupReference("AIUseSingleDummyHSGate_SOB", "SOB_AllDummyHSGates", "AllShips", SobGroup_Count("SOB_AllDummyHSGates"), 0)
								for counter = 0, numHSP-1, 1 do
									local entrance = "AIUseSingleDummyHSGate_SOB"..counter
									if SobGroup_Empty(entrance) == 0 and
									SobGroup_HealthPercentage(entrance) > 0.15 and
									SobGroup_IsDoingAbility(entrance, AB_FormHyperspaceGate) == 1 then
			          		local jump_distance = (CPU_LOD+1)*(10000-hyperspace*3000)
			          		SobGroup_Create("ShipsNearThisDummyGates_SOB")
			          		if SobGroup_FillProximitySobGroup("ShipsNearThisDummyGates_SOB", "AIShipsToJumpViaDummyGates_SOB", entrance, jump_distance) == 1 then
				          		local numJump = SobGroup_SplitGroupReference("AISingleShipToJumpViaDummyHSGate_SOB", "ShipsNearThisDummyGates_SOB", entrance, SobGroup_Count("ShipsNearThisDummyGates_SOB"), 0)
			          			for h = 0,numJump-1,1 do
			          				local jumper = "AISingleShipToJumpViaDummyHSGate_SOB"..h
			          				if SobGroup_Empty(jumper) == 0 then
			          					if SobGroup_HealthPercentage(jumper) > 0.15 and
			          					SobGroup_CanDoAbility(jumper, AB_Hyperspace) == 1 and
			          					SobGroup_CanDoAbility(jumper, AB_HyperspaceViaGate) == 1 and
			          					SobGroup_CanDoAbility(jumper, AB_Move) == 1 and
			          					SobGroup_AreAllInRealSpace(jumper) == 1 and
			          					SobGroup_CountCompare(jumper, "haxor_all_shipswithoutai") == 0 then
								          	if (SobGroup_IsDoingAbility(jumper, AB_Attack) == 0 or SobGroup_IsGroupNearybyExcludingSelf(jumper, "enemies"..playerIndex, 20000-1000*military_list[playerIndexList]) == 0) and		--or SobGroup_IsAnyShipBeingCaptured(jumper) == 1	--SobGroup_UnderAttack(jumper) == 0
								          	SobGroup_IsDoingAbility(jumper, AB_Guard) == 0 and
								          	SobGroup_IsDoingAbility(jumper, AB_Dock) == 0 and
								          	SobGroup_IsDocked(jumper) == 0 and
								          	SobGroup_IsDoingAbility(jumper, AB_Capture) == 0 and
								          	SobGroup_IsDoingAbility(jumper, AB_Hyperspace) == 0 and
								          	SobGroup_IsDoingAbility(jumper, AB_HyperspaceViaGate) == 0 and
								          	SobGroup_IsDoingAbility(jumper, AB_AcceptDocking) == 0 and
								          	SobGroup_IsDoingAbility(jumper, AB_Parade) == 0 then
								          		debugger_printer(">>> perform hyperspace jump block begins")
								          		
								          		if SobGroup_OwnedBy(entrance) ~= playerIndex then
								          			local lastcount = getn(L4_cache.DummyHSGateFlags)
								          			L4_cache.DummyHSGateFlags = Table_InsertUnique(L4_cache.DummyHSGateFlags, {counter}) 
								          			if lastcount < getn(L4_cache.DummyHSGateFlags) then
										          		debugger_printer("Set Switch Owner Flag to 0 for "..entrance)
										          		SobGroup_SetSwitchOwnerFlag(entrance, 0)
										          	end
									          		debugger_printer("Switching "..entrance.." owned by player "..SobGroup_OwnedBy(entrance).." to player "..playerIndex)	--00000010 crash occurs after here (no longer true if all make untargeted commands below are removed)
									          		SobGroup_SwitchOwner(entrance, playerIndex)
									          	else
									          		debugger_printer("Player "..playerIndex.." already owns "..entrance)
									          	end
								          		
								          		--debugger_printer("Making "..entrance.." untargeted, group size: "..SobGroup_Count(entrance))	--00000010 crash happens here here if the 2nd make untargeted step is removed
								          		--SobGroup_MakeUntargeted(entrance)	--added back to see if it causes crash (nope! still crashed at this point)
								          		
								          		--debugger_printer("Making SOB_AllDummyHSGates untargeted, group size: "..SobGroup_Count("SOB_AllDummyHSGates"))	--00000010 crash occurs right here!!!!
								          		--SobGroup_MakeUntargeted("SOB_AllDummyHSGates")	--direct cause of the unpredictable 00000010 crash? No, removed it and the crash happened one step earlier. WHY?!?!
								          		
								          		debugger_printer(jumper.." is trying to jump through "..entrance..", player index "..playerIndex..", year: "..Debug_year())	--00000010 crash occurs before here
								              SobGroup_UseHyperspaceGate(jumper, entrance)
								              
								              debugger_printer("... perform hyperspace jump block complete")
								              
								            end
								          end
							          end
					            end
					          end
				          end
				        end
							end
						end
          end
				end
      end
    end
    playerIndex = playerIndex + 1
  end
  local next_interval = 81.4949
  if aiaids == 2 then
  	next_interval = 81.4949
  elseif aiaids == 3 then
  	next_interval = 61.4949
  elseif aiaids == 4 then
  	next_interval = 46.4949
  elseif aiaids == 5 then
  	next_interval = 31.4949
  end
  next_interval = next_interval/AI_AugmentedSkills_Runtimes
  Rule_RandomInterval("AI_AugmentedSkills", next_interval, 0.5)
  debugger_printer("---AI_AugmentedSkills() end---")
end

function AI_SubsystemDebug()
	Rule_Remove("AI_SubsystemDebug")
	local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
  	if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 and CPU_Exist_Smart(playerIndex) == 1 then
				--print("AI_SubsystemDebug - Start, \t for player index: "..playerIndex)
      	local LOD = CPULODvalueList[playerIndexList]
      	if Player_GetRace(playerIndex) == Race_Hiigaran then
      		if Player_GetRU(playerIndex) >= RUMaxCapacityList[playerIndexList]*(1-0.1*LOD) and RUMaxCapacityList[playerIndexList] >= 14000 then		--and year > 25/gamespeedprogression 
      			if AI_BuildRandomSubsystemsForShips("hgn_artillerysentinel"..playerIndex, {"k1"}, {"hgn_DDI_kineticturret1","hgn_pulsers1","HGN_SCC_6xAC_Turret_s1","HGN_SCC_6xAC_Turret_s1lr","hgn_torpedo_sentinel1","hgn_ion_sentinel1","hgn_nuclear_sentinel1","hgn_nuclear_sentinel1lr","hgn_artillery_2x_sentinel_1"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("hgn_artillerysentinel"..playerIndex, {"k2"}, {"hgn_DDI_kineticturret2","hgn_pulsers2","HGN_SCC_6xAC_Turret_s2","HGN_SCC_6xAC_Turret_s2lr","hgn_torpedo_sentinel2","hgn_ion_sentinel2","hgn_nuclear_sentinel2","hgn_nuclear_sentinel2lr","hgn_artillery_2x_sentinel_2"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("hgn_artillerysentinel"..playerIndex, {"k3"}, {"hgn_DDI_kineticturret3","hgn_pulsers3","HGN_SCC_6xAC_Turret_s3","HGN_SCC_6xAC_Turret_s3lr","hgn_torpedo_sentinel3","hgn_ion_sentinel3","hgn_nuclear_sentinel3","hgn_nuclear_sentinel3lr","hgn_artillery_2x_sentinel_3"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("hgn_artillerysentinel"..playerIndex, {"k4"},{"hgn_DDI_kineticturret4","hgn_pulsers4","HGN_SCC_6xAC_Turret_s4","HGN_SCC_6xAC_Turret_s4lr","hgn_torpedo_sentinel4","hgn_ion_sentinel4","hgn_nuclear_sentinel4","hgn_nuclear_sentinel4lr","hgn_artillery_2x_sentinel_4"}) > LOD then
						end
						if AI_BuildSortedSubsystemsForShips("hgn_vortex"..playerIndex, {"Torpedo 1","Torpedo 2","Torpedo 3","Torpedo 4","Miner 1","Miner 2"}, {"hgn_v_torpedolauncher","hgn_v_torpedolauncher1","hgn_v_torpedolauncher2","hgn_v_torpedolauncher3","hgn_miner","hgn_miner1"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("hgn_vortex"..playerIndex, {"Generic 1"},{"Hgn_C_Module_Hyperspace","Hgn_C_Module_FireControl","Hgn_C_Module_drive","Hgn_C_Module_Defensefield","Hgn_C_Module_Defensefieldshield"}) > LOD then
						end
      		end
      	elseif Player_GetRace(playerIndex) == Race_Vaygr then
					if Player_GetRU(playerIndex) >= RUMaxCapacityList[playerIndexList]*(1-0.1*LOD) and RUMaxCapacityList[playerIndexList] >= 35000 then
						if AI_BuildRandomSubsystemsForShips("vgr_alkhalid"..playerIndex, {"PortAft"}, {"vgr_ft2_turret_tank1","vgr_qje_quadflechette_tank1","vgr_dt3_turret_tank1","vgr_railgun_turret_tank1","vgr_qje_lithiumion_tank1","vgr_ion_tank1","pir_fasttrackingturret_tank1","vgr_heavycruiserkineticturret_tank1","vgr_mlrs_tank1","vgr_ciws_tank1"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_alkhalid"..playerIndex, {"StbdAft"}, {"vgr_ft2_turret_tank2","vgr_qje_quadflechette_tank2","vgr_dt3_turret_tank2","vgr_railgun_turret_tank2","vgr_qje_lithiumion_tank2","vgr_ion_tank2","pir_fasttrackingturret_tank2","vgr_heavycruiserkineticturret_tank2","vgr_mlrs_tank2","vgr_ciws_tank2"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_alkhalid"..playerIndex, {"VtlMidA"}, {"vgr_ft2_turret_tank6","vgr_qje_quadflechette_tank6","vgr_dt3_turret_tank6","vgr_railgun_turret_tank6","vgr_qje_lithiumion_tank6","vgr_ion_tank6","pir_fasttrackingturret_tank6","vgr_heavycruiserkineticturret_tank6","vgr_mlrs_tank6","vgr_ciws_tank6"}) > LOD then
						elseif AI_BuildSortedSubsystemsForShips("vgr_alkhalid"..playerIndex, {"PortBowA","PortBowB","StbdBowA","StbdBowB","PortMidDsl","PortMidVtl","StbdMidDsl","StbdMidVtl"}, {"vgr_qje_lithiumion_port","vgr_qje_lithiumion_stbd","vgr_qje_lithiumion_stbd1","vgr_qje_lithiumion_port1","vgr_qje_dualflechette_port","vgr_qje_dualflechette_stbd","vgr_qje_dualflechette_stbd1","vgr_qje_dualflechette_port1"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_alkhalid"..playerIndex, {"Generic 1"}, {"Vgr_C_Module_Hyperspace", "Vgr_C_Module_CloakGenerator", "Vgr_C_Module_HyperspaceInhibitor", "Vgr_C_Module_FireControl", "Vgr_C_Module_drive", "Vgr_C_Module_Defensefield", "Vgr_C_Module_Defensefieldshield"}) > LOD then
						end
						if AI_BuildRandomSubsystemsForShips("vgr_heavycruiser"..playerIndex, {"Generic"}, {"Vgr_C_Module_FireControl", "Vgr_C_Module_CloakGenerator", "Vgr_C_Module_repair"}) > LOD then
						elseif AI_BuildSortedSubsystemsForShips("vgr_heavycruiser"..playerIndex, {"Weapon Turret 1","Weapon Turret 2","Weapon Turret 3","Weapon PDW 4","Weapon PDW 5"}, {"vgr_heavycruiserkineticturret", "vgr_railgun_turret", "vgr_railgun_turret1","vgr_heavyfusionmissilelauncherbcsmall","vgr_heavyfusionmissilelauncherbcsmall1"}) > LOD then
						end
						if AI_BuildRandomSubsystemsForShips("vgr_artilleryship"..playerIndex, {"ModularHardPoint"}, {"Vgr_cr_m", "Vgr_cr_p", "Vgr_cr_l"}) > LOD then
						elseif AI_BuildSortedSubsystemsForShips("vgr_artilleryship"..playerIndex, {"Weapon1","Weapon2"}, {"vgr_qje_lithiumion_port", "vgr_qje_lithiumion_stbd"}) > LOD then
						end
						if AI_BuildRandomSubsystemsForShips("vgr_battlecruiser_hero"..playerIndex, {"Generic 1"}, {"Vgr_C_Module_Hyperspace", "Vgr_C_Module_CloakGenerator", "Vgr_C_Module_HyperspaceInhibitor", "Vgr_C_Module_FireControl", "Vgr_C_Module_drive", "Vgr_C_Module_Defensefield", "Vgr_C_Module_Defensefieldshield"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_battlecruiser"..playerIndex, {"Generic 1"}, {"Vgr_C_Module_Hyperspace", "Vgr_C_Module_CloakGenerator", "Vgr_C_Module_HyperspaceInhibitor", "Vgr_C_Module_FireControl", "Vgr_C_Module_drive", "Vgr_C_Module_Defensefield", "Vgr_C_Module_Defensefieldshield"}) > LOD then
						elseif AI_BuildSortedSubsystemsForShips("vgr_battlecruiser"..playerIndex, {"Front Heavy Cannons","Weapon 1","Weapon 2","freaker"}, {"Vgr_HeavyCannonTurrets", "missile_boxbc", "missile_box1bc", "Vgr_dt3_turret_light"}) > LOD then
						end
						if AI_BuildRandomSubsystemsForShips("vgr_dreadnaught"..playerIndex, {"w"}, {"vgr_ft2_turret_tank3","vgr_qje_quadflechette_tank3","vgr_dt3_turret_tank3","vgr_railgun_turret_tank3","vgr_qje_lithiumion_tank3","vgr_ion_tank3","pir_fasttrackingturret_tank3","vgr_heavycruiserkineticturret_tank3","vgr_mlrs_tank3","vgr_ciws_tank3"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_dreadnaught"..playerIndex, {"w1"}, {"vgr_ft2_turret_tank4","vgr_qje_quadflechette_tank4","vgr_dt3_turret_tank4","vgr_railgun_turret_tank4","vgr_qje_lithiumion_tank4","vgr_ion_tank4","pir_fasttrackingturret_tank4","vgr_heavycruiserkineticturret_tank4","vgr_mlrs_tank4","vgr_ciws_tank4"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_dreadnaught"..playerIndex, {"k"}, {"vgr_ft2_turret_tank6","vgr_qje_quadflechette_tank6","vgr_dt3_turret_tank6","vgr_railgun_turret_tank6","vgr_qje_lithiumion_tank6","vgr_ion_tank6","pir_fasttrackingturret_tank6","vgr_heavycruiserkineticturret_tank6","vgr_mlrs_tank6","vgr_ciws_tank6"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_dreadnaughtB"..playerIndex, {"w"}, {"vgr_ft2_turret_tank3","vgr_qje_quadflechette_tank3","vgr_dt3_turret_tank3","vgr_railgun_turret_tank3","vgr_qje_lithiumion_tank3","vgr_ion_tank3","pir_fasttrackingturret_tank3","vgr_heavycruiserkineticturret_tank3","vgr_mlrs_tank3","vgr_ciws_tank3"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_dreadnaughtB"..playerIndex, {"w1"}, {"vgr_ft2_turret_tank4","vgr_qje_quadflechette_tank4","vgr_dt3_turret_tank4","vgr_railgun_turret_tank4","vgr_qje_lithiumion_tank4","vgr_ion_tank4","pir_fasttrackingturret_tank4","vgr_heavycruiserkineticturret_tank4","vgr_mlrs_tank4","vgr_ciws_tank4"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_dreadnaughtB"..playerIndex, {"Generic 1"}, {"Vgr_C_Module_Hyperspace", "Vgr_C_Module_CloakGenerator", "Vgr_C_Module_HyperspaceInhibitor", "Vgr_C_Module_FireControl", "Vgr_C_Module_drive", "Vgr_C_Module_Defensefield", "Vgr_C_Module_Defensefieldshield"}) > LOD then
						elseif AI_BuildSortedSubsystemsForShips("vgr_dreadnaughtB"..playerIndex, {"Heavy Fusion Missile Launcher 1","Heavy Fusion Missile Launcher 2"}, {"Vgr_HeavyFusionMissileLauncherBCSmall","vgr_heavyfusionmissilelauncherbcsmall1"}) > LOD then
						end
						if AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_1z"}, {"vgr_ft2_turret_tank1","vgr_qje_quadflechette_tank1","vgr_dt3_turret_tank1","vgr_railgun_turret_tank1","vgr_qje_lithiumion_tank1","vgr_ion_tank1","pir_fasttrackingturret_tank1","vgr_heavycruiserkineticturret_tank1","vgr_mlrs_tank1","vgr_ciws_tank1"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_2z"}, {"vgr_ft2_turret_tank2","vgr_qje_quadflechette_tank2","vgr_dt3_turret_tank2","vgr_railgun_turret_tank2","vgr_qje_lithiumion_tank2","vgr_ion_tank2","pir_fasttrackingturret_tank2","vgr_heavycruiserkineticturret_tank2","vgr_mlrs_tank2","vgr_ciws_tank2"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_3z"}, {"vgr_ft2_turret_tank3","vgr_qje_quadflechette_tank3","vgr_dt3_turret_tank3","vgr_railgun_turret_tank3","vgr_qje_lithiumion_tank3","vgr_ion_tank3","pir_fasttrackingturret_tank3","vgr_heavycruiserkineticturret_tank3","vgr_mlrs_tank3","vgr_ciws_tank3"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_4z"}, {"vgr_ft2_turret_tank4","vgr_qje_quadflechette_tank4","vgr_dt3_turret_tank4","vgr_railgun_turret_tank4","vgr_qje_lithiumion_tank4","vgr_ion_tank4","pir_fasttrackingturret_tank4","vgr_heavycruiserkineticturret_tank4","vgr_mlrs_tank4","vgr_ciws_tank4"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_5z"}, {"vgr_ft2_turret_tank5","vgr_qje_quadflechette_tank5","vgr_dt3_turret_tank5","vgr_railgun_turret_tank5","vgr_qje_lithiumion_tank5","vgr_ion_tank5","pir_fasttrackingturret_tank5","vgr_heavycruiserkineticturret_tank5","vgr_mlrs_tank5","vgr_ciws_tank5"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_6z"}, {"vgr_ft2_turret_tank6","vgr_qje_quadflechette_tank6","vgr_dt3_turret_tank6","vgr_railgun_turret_tank6","vgr_qje_lithiumion_tank6","vgr_ion_tank6","pir_fasttrackingturret_tank6","vgr_heavycruiserkineticturret_tank6","vgr_mlrs_tank6","vgr_ciws_tank6"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_m1"}, {"vgr_Mbc_M1","vgr_Mbc_C1"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_m2"}, {"vgr_Mbc_M2","vgr_Mbc_C2"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_m3"}, {"vgr_Mbc_M3","vgr_Mbc_C3"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Weapon_m4"}, {"vgr_Mbc_M4","vgr_Mbc_C4"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_sinner"..playerIndex, {"Generic"}, {"Vgr_C_Module_CloakGenerator", "Vgr_C_Module_FireControl", "Vgr_C_Module_HyperspaceInhibitor", "Vgr_C_Module_Hyperspace", "Vgr_C_Module_drive", "Vgr_C_Module_Defensefield", "Vgr_C_Module_Defensefieldshield"}) > LOD then
						end
						if AI_BuildRandomSubsystemsForShips("vgr_missilebattlecruiser"..playerIndex, {"top"}, {"vgr_Mbc_M", "vgr_Mbc_C", "vgr_Mbc_D"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_missilebattlecruiser"..playerIndex, {"top1"}, {"vgr_Mbc_F", "vgr_Mbc_F1", "vgr_Mbc_F2", "Vgr_HeavyFusionMissileLauncherMBC"}) > LOD then
						elseif AI_BuildRandomSubsystemsForShips("vgr_missilebattlecruiser"..playerIndex, {"Generic 1"}, {"Vgr_C_Module_Hyperspace", "Vgr_C_Module_CloakGenerator", "Vgr_C_Module_HyperspaceInhibitor", "Vgr_C_Module_FireControl", "Vgr_C_Module_drive", "Vgr_C_Module_Defensefield", "Vgr_C_Module_Defensefieldshield"}) > LOD then
						end
					end
				elseif Player_GetRace(playerIndex) == Race_Raider then
				elseif Player_GetRace(playerIndex) == Race_Kadeshi then
				elseif Player_GetRace(playerIndex) == Race_Keeper then
				end
				--print("AI_SubsystemDebug - End, \t for player index: "..playerIndex)
			end
		end
		playerIndex = playerIndex + 1
	end
	Rule_Remove("AI_SubsystemDebug")
end

function AI_TerritoryBehaviour()
	Update_AllShips()
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 and CPU_Exist_Smart(playerIndex) == 1 and SobGroup_Empty("AllAccessibleTerritoryGates"..playerIndex) == 0 then
				--cheat
				if gChallengeMode == 1 then
					if playerIndex > 3 then
						AccoladesAddRU(playerIndex, (CPULODvalueList[playerIndexList]+1)*3000)
					end
				end
				--gates
				local numships = SobGroup_SplitGroupReference("SingleTerritoryAI_SOB", "Player_Ships"..playerIndex, "AllShips", SobGroup_Count("Player_Ships"..playerIndex), 0)
				for counter = 0, numships - 1, 1 do	
					local AI_ship = "SingleTerritoryAI_SOB"..counter
					if SobGroup_HealthPercentage(AI_ship) > 0 then
						--restore AI
						if SobGroup_CountCompare(AI_ship, "haxor_all_shipswithoutai") == 0 and 
						SobGroup_CanDoAbility(AI_ship, AB_HyperspaceViaGate) == 1 and 
						SobGroup_IsDoingAbility(AI_ship, AB_Repair) == 0 and 
						SobGroup_IsDoingAbility(AI_ship, AB_Capture) == 0 and 
						SobGroup_IsDoingAbility(AI_ship, AB_HyperspaceViaGate) == 0 then
							if SobGroup_CanDoAbility(AI_ship, AB_Capture) == 0 then
								CPU_AddSobGroup(playerIndex, AI_ship)
							else
								if random_pseudo(0,military_list[playerIndexList]) >= 0 then
									CPU_AddSobGroup(playerIndex, AI_ship)
								end
							end
							local stop_override = 0
							if SobGroup_IsDoingAbility(AI_ship, AB_Attack) == 1 and 
							SobGroup_IsDoingAbility(AI_ship, AB_Capture) == 0 and 
							SobGroup_IsDoingAbility(AI_ship, AB_Dock) == 0 and 
							SobGroup_CanDoAbility(AI_ship, AB_Repair) == 0 and 
							SobGroup_CanDoAbility(AI_ship, AB_Move) == 1 then
								stop_override = 1
							end
							if SobGroup_IsDoingAbility(AI_ship, AB_Capture) == 1 and SobGroup_IsGroupNearybyExcludingSelf(AI_ship, "enemies"..playerIndex, 10000-1000*military_list[playerIndexList]) == 0 then
								stop_override = 1
							end
							if stop_override == 1 then
								if SobGroup_IsGroupNearybyExcludingSelf(AI_ship, "AllAccessibleTerritoryGates"..playerIndex, 2000+300*military_list[playerIndexList]) == 1 then
									SobGroup_Stop(playerIndex, AI_ship)
								end
							end
						end
						--use gates
						local jump_override = 0
						if SobGroup_AreAllInRealSpace(AI_ship) == 1 and 
						SobGroup_CanDoAbility(AI_ship, AB_HyperspaceViaGate) == 1 and 
						SobGroup_CanDoAbility(AI_ship, AB_Move) == 1 and 
						SobGroup_CanDoAbility(AI_ship, AB_FormHyperspaceGate) == 0 and 
						SobGroup_IsDoingAbility(AI_ship, AB_HyperspaceViaGate) == 0 and 
						SobGroup_IsDoingAbility(AI_ship, AB_Capture) == 0 and 
						(SobGroup_IsDoingAbility(AI_ship, AB_None) == 1 or 
						SobGroup_IsDoingAbility(AI_ship, AB_Stop) == 1 or 
						SobGroup_IsDoingAbility(AI_ship, AB_Move) == 1 or
						playerIndex == 5 and SobGroup_IsDoingAbility(AI_ship, AB_Parade) == 1 and SobGroup_CanDoAbility(AI_ship, AB_Attack) == 1) then
							jump_override = 1
						end
						if SobGroup_CanDoAbility(AI_ship, AB_Capture) == 1 and 
						SobGroup_IsDoingAbility(AI_ship, AB_Capture) == 0 and 
						SobGroup_IsGroupNearybyExcludingSelf(AI_ship, "enemies"..playerIndex, 10000-1000*military_list[playerIndexList]) == 0 then
							jump_override = 1
						end
						if jump_override == 1 then
							if military_list[playerIndexList] > random_pseudo(1,5) then 	--method A: use the nearest gate
								for d=500,10000,500 do
									if SobGroup_FillProximitySobGroupExceptSelf("Temp_ClosestGate", "AllAccessibleTerritoryGates"..playerIndex, AI_ship, d) == 1 then
										break
									end
								end
								if SobGroup_Count("Temp_ClosestGate") > 0 then
									SobGroup_UseHyperspaceGate(AI_ship, "Temp_ClosestGate")
									CPU_RemoveSobGroup(playerIndex, AI_ship)
								end
							else		--method B: use a farther gate
								local choose_threshold = random_pseudo(1500,3000+500*military_list[playerIndexList])
								if SobGroup_FillProximitySobGroupExceptSelf("Temp_AllNearbyGates", "AllAccessibleTerritoryGates"..playerIndex, AI_ship, random_pseudo(choose_threshold+500,10000)) == 1 then
									if SobGroup_FillProximitySobGroupExceptSelf("Temp_VeryNearbyGates", "AllAccessibleTerritoryGates"..playerIndex, AI_ship, random_pseudo(500,choose_threshold)) == 1 then
										SobGroup_SobGroupSubstract("Temp_AllNearbyGates", "Temp_VeryNearbyGates")
										if SobGroup_Count("Temp_AllNearbyGates") > 0 then
											SobGroup_UseHyperspaceGate(AI_ship, "Temp_AllNearbyGates")
											CPU_RemoveSobGroup(playerIndex, AI_ship)
										end
									end
								end
							end
						end
					end
				end
      end  
    end  
    playerIndex = playerIndex + 1
  end
  local next_interval = 71.2727
  if military == 2 then
  	next_interval = 71.2727
  elseif military == 3 then
  	next_interval = 51.2727
  elseif military == 4 then
  	next_interval = 36.2727
  elseif military >= 5 then
  	next_interval = 21.2727
  end
  Rule_RandomInterval("AI_TerritoryBehaviour", next_interval, 0.5)
end

function AI_Survival()	--initiated from interface.lua
	--print("AI_Survival - Start")
	if Universe_GameTime() > 62 then
		if survival_initialized == 0 then	--initialize survival parameters
			local last_player = 0
			for i=0,Universe_PlayerCount()-1 do
				if Player_IsAlive(i) == 1 then
					last_player = i
				end
			end
			if last_player < survival_waveowner then
				survival_data.WaveOwner = last_player
			else
				survival_data.WaveOwner = survival_waveowner
			end
			survival_data.CurrentLOD = 0
			survival_data.WaveCounter = 1	--starts from 1 for both in-game display and Hw2.log
			survival_data.WaveTimer = 0
			survival_data.NextWaveSize = 25	--base size of each wave
			survival_data.UnitCap = 150
			survival_data.ShipType = 0	--to cycle through different ship types
			if survival_waveunitcap ~= -1 then
				survival_data.UnitCap = survival_waveunitcap
			end
			survival_data.WaveFrequency = 1
			if survival_wavefrequency ~= -1 then
				survival_data.WaveFrequency = survival_wavefrequency
			end
			survival_initialized = 1
			print("Survival mode initialized! Wave owner: "..survival_data.WaveOwner..", Wave size: "..survival_wavesize..", Wave frequency: "..survival_wavefrequency..", Wave LOD: "..survival_wavelod..", Wave unit cap: "..survival_waveunitcap..", Wave count: "..survival_wavecount)
			Subtitle_Add(Actor_FleetIntel, "Survival mode initialized! Wave owner: "..GetPlayerNameWithColour(survival_data.WaveOwner).."\nDon't die like a noob!", 10)
			Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
		elseif Player_IsAlive(survival_data.WaveOwner) == 1 then	--begin survival waves
			Update_AllShips()
			local playerIndex = survival_data.WaveOwner
			local playerIndexList = playerIndex+1
			local total_wave_units = SobGroup_Count("SOB_PlayerWaves"..playerIndex)	--this count is ship-based, not squadron based
			local non_wave_units = SobGroup_Count("AllShips")-total_wave_units
			--dynamic unit cap
			if survival_waveunitcap == -1 then
				local regularizer1 = sigmoid(max(0, pilotpopList[playerIndexList]-pilotmaxList[playerIndexList]), 1, pilotmaxList[playerIndexList], 1) --for damp=930: y=1 when x=0, y=1.9 when x=2813
				local regularizer2 = sigmoid(max(0, officerpopList[playerIndexList]-officermaxList[playerIndexList]), 1, officermaxList[playerIndexList], 1) --for damp=45: y=1 when x=0, y=1.9 when x=135
				survival_data.UnitCap = min(floor(300/regularizer1/regularizer2), max(50, non_wave_units*2))
			end
			--dynamic wave frequency
			if survival_wavefrequency == -1 then
				survival_data.WaveFrequency = min(3, max(0.5, non_wave_units/(1+total_wave_units)))
			end
			--wave timer (incremental)
			if survival_data.WaveCounter > 1 then --start timer mechanism only after the first wave (so the first wave can be immediately spawned for testing)
				survival_data.WaveTimer = survival_data.WaveTimer + 1
			end
			if survival_data.WaveTimer * survival_data.WaveFrequency > 50 then --reset the timer only after this interval
				if pilotpopList[playerIndexList] < 930 and --hard limit to prevent 00000000 crash (not helping)
				officerpopList[playerIndexList] < 45 and --hard limit to prevent 00000000 crash (not helping)
				total_wave_units < survival_data.UnitCap then	--prevent spawn if wave unit cap is reached
					survival_data.WaveTimer = 0	--reset the timer to cue the next wave
				else
					--print("Survival wave "..survival_data.WaveCounter.." postponed, game year: "..year)
				end
			end
			--spawn wave
			if survival_data.WaveTimer == 0 then	--simply use timer as trigger
				if AI_WaveSpawn(playerIndex) == 1 then	--successful spawn
					survival_data.WaveCounter = survival_data.WaveCounter + 1
				else	--failed to spawn
					print("Survival wave "..survival_data.WaveCounter.." failed to spawn, UnitCap = "..survival_data.UnitCap..", NextWaveSize = "..survival_data.NextWaveSize..", CurrentLOD = "..survival_data.CurrentLOD..", year: "..year)
				end
			end
			--update targets and let waves attack other players
			if mod(gametime+playerIndex,25) == 0 then
				AI_WaveAttack(playerIndex)
			end
			--termination after all waves are spawned
			if survival_wavecount ~= -1 and survival_data.WaveCounter > survival_wavecount then
				print("Survival mode finished! All "..survival_wavecount.." waves have been spawned, game year: "..year)
				Subtitle_Add(Actor_FleetIntel, "Survival mode finished! All "..survival_wavecount.." waves have been spawned. GG~~~"..Time_PrintYear(), 7)
				Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
				if CPU_Exist_Smart(playerIndex) == 1 then
					CPU_AddSobGroup(playerIndex, "SOB_PlayerWaves"..playerIndex)	--return AI to all the waves after the rule is removed
				end
				Rule_Remove("AI_Survival")
			end
		else
			print("Survival mode terminated! Wave owner is rekt. "..(survival_data.WaveCounter-1).." waves have been spawned, game year: "..year)
			Subtitle_Add(Actor_FleetIntel, "Survival mode terminated! Wave owner is rekt. "..(survival_data.WaveCounter-1).." waves have been spawned. GG~~~"..Time_PrintYear(), 7)
			Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
			Rule_Remove("AI_Survival")
		end
	end
	--print("AI_Survival - End")
end

function AI_WaveSpawn(playerIndex)	--spawn a wave belonging to the player and let it attack other players
	--print("AI_WaveSpawn - Start")
	local spawn_success = 0
	local playerIndexList = playerIndex+1
	local n_players = Universe_PlayerCount()
	local total_wave_units = SobGroup_Count("SOB_PlayerWaves"..playerIndex)	--this count is ship-based, not squadron based
	local non_wave_units = SobGroup_Count("AllShips")-total_wave_units
	--spawn new waves and give orders
	local shiptable = Player_GetShipTableByRace(playerIndex)
	survival_data.target_list = {"productioncapital", "smallcapitals", "juggernaughts", "utilities", "platforms", "frigates", "corvettes", "fighters", "shipwreck", "othersnoparade", "Player_Ships"}
	local exclude_name_patterns = {"station", "hgn_power", "hgn_combatbase", "fortress", "mothership", "shipyard", "carrier", "scaver", "vgr_am", "hgn_rts", "hgn_tanker", "sensor", "prayer", "hgn_artillerysentinel", "kpr_dronestruct", "scaffold", "vgr_cloakplatform", "hgn_defensefieldturret"}
	local exclude_classes = {"utility"}
	local min_pilot, max_pilot = 0, 3
	local min_officer, max_officer = 0, -4	--bias can be negative, in order to make hard waves not spawn too early
	--dynamic LOD
	local LOD_multiplier = survival_wavelod
	if survival_wavelod == -1 then
		LOD_multiplier = min(1.4, max(0.8, non_wave_units/(1+total_wave_units)))
		if nf^2*LOD_multiplier < n_players then
			exclude_classes = Table_CombineWithTable(exclude_classes, {"frigate"})
		end
		if np^2*LOD_multiplier < n_players then
			exclude_classes = Table_CombineWithTable(exclude_classes, {"platform"})
		end
		if (nd+nbc)^2*LOD_multiplier < n_players then
			exclude_classes = Table_CombineWithTable(exclude_classes, {"armedcapital"})
		end
	end
	survival_data.CurrentLOD = survival_data.CurrentLOD + 1*LOD_multiplier	--normal LOD mode does not care about player progress, all types of ships will spawn when the time has come
	local LOD = survival_data.CurrentLOD
	--determine wave content
	if Player_GetRace(playerIndex) == Race_Hiigaran then
	  max_pilot = max(5, 1+LOD*LOD_multiplier)
		max_officer = min(5, -5+sqrt(LOD*LOD_multiplier))
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
	  max_pilot = max(6, 1+LOD*LOD_multiplier)
		max_officer = min(5, -5+sqrt(LOD*LOD_multiplier))
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	  max_pilot = max(6, 1+LOD*LOD_multiplier)
		max_officer = min(5, -5+sqrt(LOD*LOD_multiplier))
	elseif Player_GetRace(playerIndex) == Race_Raider then
	  max_pilot = max(6, 1+LOD*LOD_multiplier)
		max_officer = min(5, -5+sqrt(LOD*LOD_multiplier))
	elseif Player_GetRace(playerIndex) == Race_Keeper then
	  max_pilot = max(1, -3+LOD*LOD_multiplier)
		max_officer = min(5, -5+sqrt(LOD*LOD_multiplier))
	end
	max_pilot = floor(max_pilot)
	max_officer = ceil(max(0, max_officer))
	min_pilot = floor(min(25, max(0, sqrt(5+max_pilot))))
	min_officer = ceil(min(5, max(0, max_officer - 2)))
	if max_pilot >= 40 then
		min_pilot = 0
	end
	if max_officer >= 5 then
		min_officer = 0
	end
	local candidate_table = {}
	local shipfound = 0
	for y=1,2 do	--2 passes to build the candidate ship list, the second pass has looser criterion to ensure there is something added to the list
		for z, candicate in shiptable do
			if String_ContainsPatternInTable(candicate.name, exclude_name_patterns) == 0 and
			String_ContainsPatternInTable(candicate.class, exclude_classes) == 0 and 
			candicate.officer+candicate.pilot ~= 0 and 
			candicate.pilot >= min_pilot and candicate.pilot <= max_pilot and
			candicate.officer >= min_officer and candicate.officer <= max_officer then
				candidate_table = Table_CombineWithTable(candidate_table, {candicate.name})
				shipfound = 1
			end
		end
		local param_info =  "min_pilot="..min_pilot..", max_pilot="..max_pilot..", min_officer="..min_officer..", max_officer="..max_officer
		if shipfound == 1 then
			print("Survival wave "..survival_data.WaveCounter.." candidate ships: "..getn(candidate_table))
			break
		elseif y == 1 then	--no ships fulfill the above criteria, need to loosen the criteria
			print("No candidate ship is found for survival wave "..survival_data.WaveCounter.." ("..param_info.."), loosening the criteria.")
			min_pilot = 0
			min_officer = 0
		end
	end
	--if getn(candidate_table) > 1 then
		--local chosen_idx = random_pseudo(1,getn(candidate_table))
		--candidate_table = Table_Subrange(candidate_table, chosen_idx, chosen_idx)	--00000000 crash debug (not helpful)
	--end
	--dynamic wave size
	local CurrentWaveSize = survival_data.NextWaveSize*survival_wavesize
	if survival_wavesize == -1 then
		survival_data.NextWaveSize = min(50, max(10, non_wave_units/(1+total_wave_units)*10))
		CurrentWaveSize = survival_data.NextWaveSize
	end
	--spawning function
	survival_data.spawned_list = {}
	local spawned_count = 0
	local target = ""
	survival_data.ShipType = floor(survival_data.ShipType*LOD_multiplier) + 1
	if getn(candidate_table) > 0 then
		if survival_data.ShipType > getn(candidate_table) then
			survival_data.ShipType = random_pseudo(1,getn(candidate_table))
		end
		local shipname = candidate_table[survival_data.ShipType]
		for idx, target_type in survival_data.target_list do
			target = target_type..playerIndex
			if SobGroup_Empty(target) == 0 then
				if ((SobGroup_AreAllInRealSpace(target) == 1 and SobGroup_IsDocked(target) == 0) or idx == getn(survival_data.target_list)) and SobGroup_InWorldBound(target, 1) == 1 then
					for n=1, CurrentWaveSize, 1 do
						if SobGroup_Count("SOB_PlayerWaves"..playerIndex) >= survival_data.UnitCap then
							if Rule_Exists("AI_WaveSpawnSubroutine") == 1 then
								Rule_Remove("AI_WaveSpawnSubroutine")
							end
							break
						end
						if (survival_wavecount ~= -1 and LOD^(2*LOD_multiplier) > survival_wavecount) or (survival_wavecount == -1 and (LOD*LOD_multiplier)^(2*LOD_multiplier) > non_wave_units) then
							shipname = Table_RandomElement(candidate_table)	--allows mixed ships within a wave
						end
						if Rule_Exists("AI_WaveSpawnSubroutine") == 0 then	--allow only one subroutine at a time
							survival_data.subroutine_count = 0
							Rule_AddInterval("AI_WaveSpawnSubroutine", 0.1)	--use a subroutine to spawn individual squadrons as a sequence instead of in one big bunch at the same time
						end
						spawn_success = 1
						spawned_count = spawned_count + 1
						survival_data.spawned_list = Table_InsertUnique(survival_data.spawned_list, {shipname})
					end
					break	--spawn all units of a wave around one single target
				end
			end
		end
	end
	--survival_data.spawned_list = {"vgr_lancefighter"}	--00000000 debug testing (solved by removing AI)
	--get spawned unit name for display
	local spawned_list = survival_data.spawned_list
	if spawn_success == 1 then
		print("spawned_list count: "..getn(spawned_list)..", target: "..target..", spawned_list: "..Vector_tostring(spawned_list)) --"spawned_list[survival_data.ShipType]: "..spawned_list[survival_data.ShipType]
		local ship_name = "Mixed Units"
		local ship_name_real = ship_name
		if getn(spawned_list) == 1 then
			ship_name_real = spawned_list[1]
			--using the ship name from build list works, but the localization strings (e.g., "$7064") can't be displayed properly, need an ungly translator
			local translator = {
				{"$7056", "Destroyer"},	{"$7058", "Shipyard"},	{"$7054", "Carrier"},	{"$7064", "Ion Beam Platform"}, {"$7062", "Gun Platform"}, 
				{"$7050", "Ion Cannon Frigate"}, {"$7044", "Defense Field Frigate"}, {"$7052", "Marine Frigate"}, {"$7048", "Flak Frigate"}, 
				{"$7042", "Minelayer"}, {"$7040", "Pulsar Gunship"}, {"$7038", "Gunship"},	
				{"$7162", "Heavy Missile Platform"}, {"$7160", "Gun Platform"}, {"$7158", "Battlecruiser"}, {"$7156", "Shipyard"}, {"$7164", "Carrier"}, {"$7152", "Destroyer"}, 
				{"$7150", "Infiltrator Frigate"}, {"$7148", "Heavy Missile Frigate"},	{"$7146", "Assault Frigate"}, 
				{"$7144", "Command Corvette"}, {"$7142", "Minelayer"},{"$7140", "Laser Corvette"},	{"$7138", "Missile Corvette"},	
				{"$7136", "Lance Fighter"}, {"$7134", "Bomber"}, {"$7132", "Assault Craft"},	{"$7130", "Scout"},	
			}
			local iRace = Player_GetRace(playerIndex) + 1
	    dofilepath([[data:scripts/race.lua]])
	    if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
	    	local filepath = [[data:scripts/building and research/]] .. races[iRace][1] .. [[/build.lua]]
				dofilepath(filepath)
				for z, iCount in build do
					if strlower(iCount.ThingToBuild) == strlower(spawned_list[1]) then
					  ship_name = iCount.DisplayedName
					  if ship_name == nil then
					  	ship_name = spawned_list[1]	--ships like rad_cruiser_queen don't have name because of scaffold
					  end
					  local initial_char = strsub(ship_name, 1, 1)
					  if initial_char == "$" then
					  	for d, dict in translator do
					  		if ship_name == dict[1] then
					  			ship_name = dict[2]
					  			break
					  		end
					  	end
					  end
					  break
					end
				end
			end
		end
		local wave_info = ""
		if survival_wavecount ~= -1 then
			wave_info = "\/"..survival_wavecount
		end
		Subtitle_Message("<c=FFD800>Wave "..survival_data.WaveCounter..wave_info..": "..ship_name.." (Lv."..floor(min(100, LOD)).."). Size: "..spawned_count.."</c>", 7)
		print("Survival wave "..survival_data.WaveCounter..wave_info.." spawned, type: "..ship_name_real..", size: "..spawned_count..", year: "..year)
	end
	--print("AI_WaveSpawn - End")
	return spawn_success
end

function AI_WaveSpawnSubroutine()	--00000000 crash debug: to split a wave into individual squadrons and spawn in rapid interval
	--print("AI_WaveSpawnSubroutine - Start")
	local playerIndex = survival_data.WaveOwner
	local CurrentWaveSize = survival_data.NextWaveSize
	local LOD = survival_data.CurrentLOD
	--spawning function
	local spawned_list = survival_data.spawned_list
	local spawned_count = 0
	if getn(spawned_list) > 0 then
		for idx, target_type in survival_data.target_list do
			local target = target_type..playerIndex
			if SobGroup_Empty(target) == 0 then
				if ((SobGroup_AreAllInRealSpace(target) == 1 and SobGroup_IsDocked(target) == 0) or idx == getn(survival_data.target_list)) and SobGroup_InWorldBound(target, 1) == 1 then
					local radius = 4000
					local pos = SobGroup_GetPosition(target)
					local coord = {0, 0, 0}
					SobGroup_Create("SOB_Temp_WaveBatch")
					SobGroup_Clear("SOB_Temp_WaveBatch")
					for n=1, CurrentWaveSize, 1 do
						if SobGroup_Count("SOB_PlayerWaves"..playerIndex) >= survival_data.UnitCap then
							break
						end
						SobGroup_Create("SOB_Temp_Waves")
						SobGroup_Clear("SOB_Temp_Waves")
						local shipname = Table_RandomElement(spawned_list)
						if 1==2 then	--SobGroup_SobGroupCompare(target, "productioncapital"..playerIndex) == 1	--debug mode
							SobGroup_CreateShip_Smart(target, shipname)
							spawn_success = 1
							survival_data.subroutine_count = survival_data.subroutine_count + 1
						else	--normal spawn
							local theta = random_pseudo(-90,90)
							local beta = random_pseudo(0,360)
							coord[1] = pos[1] + radius*cos(theta)*cos(beta)
							coord[2] = pos[2] + radius*sin(theta)
							coord[3] = pos[3] + radius*cos(theta)*sin(beta)
							local unique_serial = random_pseudo(0,50000)
							Volume_AddSphere("VOL_AISpawnWaves"..target..unique_serial, coord, 5000)
							SobGroup_SpawnNewShipInSobGroup(-1, shipname, "Wave", "SOB_Temp_Waves", "VOL_AISpawnWaves"..target..unique_serial)
							SobGroup_SetSwitchOwnerFlag("SOB_Temp_Waves", 0)
							SobGroup_SwitchOwner("SOB_Temp_Waves", playerIndex)
							Volume_Delete("VOL_AISpawnWaves"..target..unique_serial)
							if SobGroup_CanDoAbility("SOB_Temp_Waves", AB_Move) == 1 and --SobGroup_CanDoAbility("SOB_Temp_Waves", AB_Builder) == 0
							SobGroup_CanDoAbility("SOB_Temp_Waves", AB_Attack) == 1 then
								if SobGroup_GetHardPointHealth("SOB_Temp_Waves", "experience") > 0 then
									SobGroup_SetHardPointHealth("SOB_Temp_Waves", "experience", max(0.001, 0.0010*LOD))
								end
			          local megalitenoowner17 = Ping_AddSobGroup("Target Practice", "megalitenoowner17", "SOB_Temp_Waves")
			          Ping_LabelVisible(megalitenoowner17, 1)
					      Ping_AddDescription(megalitenoowner17, 0, "Wave "..survival_data.WaveCounter-1)
								SobGroup_SetTactics_Smart("SOB_Temp_Waves", AggressiveTactics)
								AI_SobgroupAttackAllEnemiesWithPriority("SOB_Temp_Waves")
								SobGroup_SobGroupAdd("SOB_Temp_WaveBatch", "SOB_Temp_Waves")
								SobGroup_SobGroupAdd("SOB_PlayerWaves"..playerIndex, "SOB_Temp_Waves")
								spawn_success = 1
								survival_data.subroutine_count = survival_data.subroutine_count + 1
							else
								SobGroup_SetHealth("SOB_Temp_Waves", 0)
							end
						end
						if spawn_success == 1 then
							break	--spawn only one squadron at a time
						end
					end
					--group the spawned ships
					--if SobGroup_Count("SOB_Temp_WaveBatch") > 1 then
						--SobGroup_FormStrikeGroup("SOB_Temp_WaveBatch", Table_RandomElement({"Fighter Screen", "Capital Phalanx", "Frigate Line"}))
					--end
					break	--spawn all units of a wave around one single target
				end
			end
		end
	end
	
	if survival_data.subroutine_count >= CurrentWaveSize then
		Rule_Remove("AI_WaveSpawnSubroutine")
	end
	--print("AI_WaveSpawnSubroutine - End")
end

function AI_SobgroupAttackAllEnemiesWithPriority(ship)
	local target_found = 0
	if SobGroup_Empty(ship) == 0 then
		local playerIndex = SobGroup_OwnedBy(ship)
		local i_player = playerIndex
		if playerIndex < 0 then
			i_player = 0
		end
		SobGroup_Create("SOB_Temp_ValidTargets")
		local target_list = {"productioncapital", "smallcapitals", "juggernaughts", "utilities", "platforms", "frigates", "corvettes", "fighters", "shipwreck", "othersnoparade"}
		for idx, target_type in target_list do
			for p=0,Universe_PlayerCount()-1 do
				if playerIndex < 0 or AreAllied(i_player, p) == 0 then
					SobGroup_SobGroupAdd("SOB_Temp_ValidTargets", target_type..p)
				end
			end
			if SobGroup_Empty("SOB_Temp_ValidTargets") == 0 then
				if playerIndex >= 0 and CPU_Exist_Smart(i_player) == 1 then
					CPU_RemoveSobGroup(i_player, ship)
				end
				if SobGroup_AreAllInHyperspace("SOB_Temp_ValidTargets") == 0 and SobGroup_AreAllInHyperspace(ship) == 0 then
					SobGroup_Attack(i_player, ship, "SOB_Temp_ValidTargets")
					target_found = 1
				end
				break
			end
		end
		if SobGroup_Empty("SOB_Temp_ValidTargets") == 1 then
			if playerIndex < 0 then
				for p=0,Universe_PlayerCount()-1 do
					SobGroup_SobGroupAdd("SOB_Temp_ValidTargets", "Player_Ships"..p)
				end
			else
				SobGroup_SobGroupAdd("SOB_Temp_ValidTargets", "enemies"..playerIndex)
			end
			SobGroup_SobGroupSubstract("SOB_Temp_ValidTargets", "SOB_AllDummyHSGates")
			SobGroup_SobGroupSubstract("SOB_Temp_ValidTargets", "all_supporters")
			if SobGroup_Empty("SOB_Temp_ValidTargets") == 0 then
				if playerIndex >= 0 and CPU_Exist_Smart(i_player) == 1 then
					CPU_RemoveSobGroup(i_player, ship)
				end
				if SobGroup_AreAllInHyperspace("SOB_Temp_ValidTargets") == 0 and SobGroup_AreAllInHyperspace(ship) == 0 then
					SobGroup_Attack(i_player, ship, "SOB_Temp_ValidTargets")
					target_found = 1
				end
			end
		end
		SobGroup_Clear("SOB_Temp_ValidTargets")
	end
	return target_found
end

function AI_WaveAttack(playerIndex)
	--print("AI_WaveAttack - Start")
	SobGroup_Create("SOB_Temp_Attacker")
	SobGroup_FillSubstract("SOB_Temp_Attacker", "SOB_PlayerWaves"..playerIndex, "haxor_all_shipswithoutai")
	if SobGroup_Empty("SOB_Temp_Attacker") == 0 and CPU_Exist_Smart(playerIndex) == 1 then
		local numships = SobGroup_SplitGroupReference("SingleWaveAttacker_SOB", "SOB_Temp_Attacker", "Player_Ships"..playerIndex, SobGroup_Count("SOB_Temp_Attacker"))
		for counter = 0, numships - 1, 1 do
			local target_found = 1
			if SobGroup_IsDoingAbility("SingleWaveAttacker_SOB"..counter, AB_Attack) == 1 then
				if mod(gametime, numships) <= counter then
					SobGroup_Stop(playerIndex, "SingleWaveAttacker_SOB"..counter)
				end
			end
			if SobGroup_IsDoingAbility("SingleWaveAttacker_SOB"..counter, AB_Attack) == 0 and 
			SobGroup_CanDoAbility("SingleWaveAttacker_SOB"..counter, AB_Attack) == 1 then
				target_found = AI_SobgroupAttackAllEnemiesWithPriority("SingleWaveAttacker_SOB"..counter)
			end
			if target_found == 0 then
				--CPU_AddSobGroup(playerIndex, "SingleWaveAttacker_SOB"..counter)	--to prevent crash
			end
		end
	end
	SobGroup_Clear("SOB_Temp_Attacker")
	--print("AI_WaveAttack - End")
end

function AI_SoleSurvivor()
	Update_AllShips()
	--determine the closest crate to go to
	local seeker_count = 0
	local seeker_table = {{0,0},{1,0},{2,0},{3,0},{4,0},{5,0}}		--survivor id, seeking status
	for i=0,Universe_PlayerCount()-1 do
		if Player_IsAlive(i) == 1 then
			local survivor = "SoleSurvivor"..i
			if SobGroup_Empty(survivor) == 0 then		--and CPU_Exist_Smart(i) == 1
				if SobGroup_IsDoingAbility(survivor, AB_Attack) == 0 and 
				--SobGroup_IsGroupNearybyExcludingSelf(survivor, "enemies"..i, 5000+CPULODvalueList[i+1]*1000) == 0 and 
				SobGroup_AreAllInRealSpace(survivor) == 1 and 
				SobGroup_IsDocked(survivor) == 0 and 
				SobGroup_IsDoingAbility(survivor, AB_Dock) == 0 and 
				SobGroup_IsDoingAbility(survivor, AB_Capture) == 0 and 
				SobGroup_IsDoingAbility(survivor, AB_Guard) == 0 and 
				SobGroup_SobGroupCompare(survivor, "haxor_all_shipswithoutai") == 0 and 
				SobGroup_HealthPercentage(survivor) > 0 then
					seeker_count = seeker_count + 1
					seeker_table[i+1][2] = 1		--will seek crates
				end
			end
		end
	end
	--in case the crates get too numerous, the algorithm structure is designed in this way to save computing power
	local default_dist = 9999999
	local distance_list = {{0,0,default_dist},{1,0,default_dist},{2,0,default_dist},{3,0,default_dist},{4,0,default_dist},{5,0,default_dist}}		--survivor id, target id, distance
	if seeker_count > 0 then
		if SobGroup_Empty("meg_crate") == 0 then
			if CrateCount >= 0 then
		  	for i = 0, CrateCount-1, 1 do
					if SobGroup_AreAnyOfTheseTypes("splitcrate"..i, "meg_crate") == 1 and SobGroup_HealthPercentage("splitcrate"..i) > 0 then
						local dist = 0
						for iPlayerIndex = 0, Universe_PlayerCount() - 1 do
							if Player_IsAlive(iPlayerIndex) == 1 then
								local survivor = "SoleSurvivor"..iPlayerIndex
								if SobGroup_Empty(survivor) == 0 then		--and CPU_Exist_Smart(iPlayerIndex) == 1 
									local dist = SobGroup_GetDistanceToSobGroup(survivor, "splitcrate"..i)
									if dist < distance_list[iPlayerIndex+1][3] then
										distance_list[iPlayerIndex+1][3] = dist
										distance_list[iPlayerIndex+1][2] = i		--megalite index
									end
								end
							end
						end
					end
				end
			end
		end
	end
	--main function
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    SobGroup_Create("Player_NonSurvivorShips"..playerIndex)
    if Player_IsAlive(playerIndex) == 1 then
    	SobGroup_SobGroupAdd("Player_NonSurvivorShips"..playerIndex, "Player_Ships"..playerIndex)
    	SobGroup_SobGroupSubstract("Player_NonSurvivorShips"..playerIndex, "supporter"..playerIndex)
    	SobGroup_SobGroupSubstract("Player_NonSurvivorShips"..playerIndex, "SoleSurvivor"..playerIndex)
    	if SobGroup_Empty("SoleSurvivor"..playerIndex) == 0 then
    		local survivor = "SoleSurvivor"..playerIndex
    		--local health = SobGroup_HealthPercentage(survivor)
      	--encounter alert for human players
				if SobGroup_IsGroupNearybyExcludingSelf(survivor, "SoleSurvivor"..Universe_CurrentPlayer(), 5000+CPULODvalueList[playerIndexList]*1000) == 1 then
					if AreAllied(Universe_CurrentPlayer(), playerIndex)	== 0 then
						if Universe_GameTime() - EncounterAnotherSurvivor[Universe_CurrentPlayer()+1][playerIndexList] > 100 then		--to prevent message spam
	  					UI_PlaySound("SFX_fleet_under_attack")
	  					Subtitle_AddAccordingToRace(Universe_CurrentPlayer(),"<c=cef6f5>Encountering </c>"..GetPlayerNameWithColour(playerIndex).."<c=cef6f5>'s Sole Survivor!</c>",3.72)
	  					EncounterAnotherSurvivor[Universe_CurrentPlayer()+1][playerIndexList] = Universe_GameTime()
	  				end
	  			else		--meeting allied survivor
	  				if Universe_GameTime() - EncounterAnotherSurvivor[Universe_CurrentPlayer()+1][playerIndexList] > 100 then		--to prevent message spam
	  					local SFXlist = {"SFX_cute_reptilian_greetings_01", "SFX_cute_reptilian_greetings_02", "SFX_cute_reptilian_greetings_03", "SFX_cute_reptilian_greetings_04", "SFX_cute_reptilian_greetings_05", }
	  					UI_PlaySound(Table_RandomElement(SFXlist))
	  					Subtitle_AddAccordingToRace(Universe_CurrentPlayer(),"<c=cef6f5>Greeting </c>"..GetPlayerNameWithColour(playerIndex).."<c=cef6f5>'s Sole Survivor!</c>",3.72)
	  					EncounterAnotherSurvivor[Universe_CurrentPlayer()+1][playerIndexList] = Universe_GameTime()
	  				end
	  			end
				end
				if playerIndex == Universe_CurrentPlayer() then
				  --ping own survivor
				  Ping_LabelVisible(Ping_AddSobGroup("Sole Survivor", "juggernaught", "SoleSurvivor"..playerIndex), 1)	--sensor ping
				  local name_ping = Ping_AddSobGroup("Sole Survivor", "name1", "SoleSurvivor"..playerIndex)
					Ping_LabelVisible(name_ping, 1)
					if SobGroup_GetTactics(survivor) == 0 then	--aggressive tactic enables auto survey
						if SoleSurvivorAutoSurvey[playerIndexList] == 0 then
							if SobGroup_SobGroupCompare("DriveMode_SOB"..playerIndex, survivor) == 0 or UI_IsNamedElementVisible("drive","takingcontrol") == 0 then		--drive mode takes priority
								SoleSurvivorAutoSurvey[playerIndexList] = 1
								Subtitle_AddAccordingToRace(playerIndex,"(Aggressive Tactic) Auto Survey mode enabled! The Sole Survivor will automatically seek the nearest crate.",3.72)
								UI_PlaySound("SFX_ascension_perk_unlocked_01")
							end
						end
					else
						if SoleSurvivorAutoSurvey[playerIndexList] ~= 0 then
							if SobGroup_SobGroupCompare("DriveMode_SOB"..playerIndex, survivor) == 0 or UI_IsNamedElementVisible("drive","takingcontrol") == 0 then		--drive mode takes priority
								SoleSurvivorAutoSurvey[playerIndexList] = 0
								Subtitle_AddAccordingToRace(playerIndex,"(Non-aggressive Tactic) Auto Survey mode disabled! The Sole Survivor will not automatically seek crates.",3.72)
								UI_PlaySound("SFX_notification_research_01")
							end
						end
					end
				end
      	if CPU_Exist_Smart(playerIndex) == 1 or SoleSurvivorAutoSurvey[playerIndexList] == 1 then
      		--move to the closest crate
      		if seeker_count > 0 then
      			if seeker_table[playerIndexList][2] > 0 and distance_list[playerIndexList][3] < default_dist then
      				SobGroup_MoveToSobGroup(survivor, "splitcrate"..distance_list[playerIndexList][2])
      			end
      		end
      	end
      	if CPU_Exist_Smart(playerIndex) == 1 then
      		--watch out for enemies
      		if SobGroup_IsGroupNearybyExcludingSelf(survivor, "enemies"..playerIndex, 5000+CPULODvalueList[playerIndexList]*1000) == 1 then
      			if SobGroup_GetTactics(survivor) ~= 0 then
      				SobGroup_SetTactics_Smart(survivor, AggressiveTactics)
      				if SoleSurvivor_EvaluatePlayerStrength(playerIndex) > SoleSurvivor_GetAverageEnemyStrength(playerIndex)*(1+0.2*CPULODvalueList[playerIndexList]) then
      					if SobGroup_FillProximitySobGroupExceptSelf("NearbyEmemies_SOB", "enemies"..playerIndex, survivor, 5000+CPULODvalueList[playerIndexList]*1000) == 1 then
      						SobGroup_Attack(playerIndex, survivor, "NearbyEmemies_SOB")
      					end
      				elseif SoleSurvivor_EvaluatePlayerStrength(playerIndex) < SoleSurvivor_GetAverageEnemyStrength(playerIndex)*(0.8+0.1*CPULODvalueList[playerIndexList]) then
      					SobGroup_Stop(playerIndex, survivor)
      				end
      			end
      		else		--no enemies nearby
      			if SobGroup_GetTactics(survivor) == 0 then
      				SobGroup_SetTactics_Smart(survivor, DefensiveTactics)
      			end
      			if SobGroup_IsDoingAbility(survivor, AB_Attack) == 1 and SobGroup_GetEquivalentSpeed(survivor) < 10 then
      				SobGroup_Stop(playerIndex, survivor)
      			end
      		end
      		--order additional ships to guard the survivor
      		if SobGroup_Empty("Player_NonSurvivorShips"..playerIndex) == 0 and mod(gametime+playerIndex,3) == 0 then		--cpu saving
      			local numShips = SobGroup_SplitGroupReference("Survivor_Protector_SOB_Single", "Player_NonSurvivorShips"..playerIndex, "SoleSurvivor"..playerIndex, SobGroup_Count("Player_NonSurvivorShips"..playerIndex), 0)
      			for counter = 0, numShips -1, 1 do
	      			local protector = "Survivor_Protector_SOB_Single"..counter
	      			if SobGroup_AreAllInRealSpace(protector) == 1 and 
							SobGroup_IsDocked(protector) == 0 and 
							SobGroup_IsDoingAbility(protector, AB_Dock) == 0 and
							SobGroup_SobGroupCompare(protector, "haxor_all_shipswithoutai") == 0 and 
							SobGroup_HealthPercentage(protector) > 0 then
		      			if SobGroup_CanDoAbility(protector, AB_Move) == 1 and 
		      			SobGroup_CanDoAbility(protector, AB_Guard) == 1 and 
		      			SobGroup_IsDoingAbility(protector, AB_Guard) == 0 and
		      			SobGroup_IsDoingAbility(protector, AB_Attack) == 0 and
								SobGroup_IsDoingAbility(protector, AB_Capture) == 0 then 
		      				SobGroup_GuardSobGroup(protector, "SoleSurvivor"..playerIndex)
		      			end
		      			if SobGroup_CanDoAbility(protector, AB_Repair) == 1 and 
		      			(SobGroup_IsDoingAbility(protector, AB_Stop) == 1 or SobGroup_IsDoingAbility(protector, AB_None) == 1) and
		      			SobGroup_Empty("AllToHelp"..playerIndex) == 0 then
		      				SobGroup_RepairSobGroup(protector, "AllToHelp"..playerIndex)
		      			end
		      		end
	      		end
      		end
      	end
      	--clear the sole survivor group if it cannot move (probes etc.)
      	if SobGroup_CanDoAbility(survivor, AB_Move) == 0 and 
      	SobGroup_AreAllInRealSpace(survivor) == 1 and 
				SobGroup_IsDocked(survivor) == 0 then
					SobGroup_Clear("SoleSurvivor"..playerIndex)
					print("Clearing player"..playerIndex.."'s ship sole survivor group due to immobility, type: "..SoleSurvivorType[playerIndexList])
				end
      else		--sole survivor group is empty
      	--select a substitute survivor (with multiple layers of criteria)
      	if SobGroup_Empty("Player_NonSurvivorShips"..playerIndex) == 0 then
      		local numsurvivors = SobGroup_SplitGroupReference("Survivor_Substitue_SOB_Single", "Player_NonSurvivorShips"..playerIndex, "AllShips", SobGroup_Count("Player_NonSurvivorShips"..playerIndex), 0)
      		local substitute_found = 0
      		--strict criteria
      		for counter = 0, numsurvivors -1, 1 do
      			local substitute_survivor = "Survivor_Substitue_SOB_Single"..counter
      			if SobGroup_CanDoAbility(substitute_survivor, AB_Move) == 1 and 
      			SobGroup_CanDoAbility(substitute_survivor, AB_Attack) == 1 then
      				if substitute_found == 0 then
      					SobGroup_Clear("SoleSurvivor"..playerIndex)
	      				SobGroup_SobGroupAdd("SoleSurvivor"..playerIndex, substitute_survivor)
	      				SoleSurvivor_StoreSurvivorShipType(playerIndex)
	      				print("Adding player"..playerIndex.."'s ship to (substitute) sole survivor group, count: "..SobGroup_Count("SoleSurvivor"..playerIndex)..", type: "..SoleSurvivorType[playerIndexList])
	      				substitute_found = 1
	      			end
      			end
      		end
      		--loose criteria
      		if substitute_found == 0 then
      			for counter = 0, numsurvivors -1, 1 do
	      			local substitute_survivor = "Survivor_Substitue_SOB_Single"..counter
	      			if SobGroup_CanDoAbility(substitute_survivor, AB_Move) == 1 then
	      				if substitute_found == 0 then
		      				SobGroup_Clear("SoleSurvivor"..playerIndex)
		      				SobGroup_SobGroupAdd("SoleSurvivor"..playerIndex, substitute_survivor)
		      				SoleSurvivor_StoreSurvivorShipType(playerIndex)
	      					print("Adding player"..playerIndex.."'s ship to (substitute) sole survivor group, count: "..SobGroup_Count("SoleSurvivor"..playerIndex)..", type: "..SoleSurvivorType[playerIndexList])
		      				substitute_found = 1
		      			end
	      			end
	      		end
      		end
      		if substitute_found == 1 then
      			if CPU_Exist_Smart(playerIndex) == 1 then
      				for counter = 0, numsurvivors -1, 1 do
		      			local substitute_survivor = "Survivor_Substitue_SOB_Single"..counter
		      			if SobGroup_IsDoingAbility(substitute_survivor, AB_Guard) == 1 then
		      				SobGroup_Stop(playerIndex, substitute_survivor)		--stop previous task to begin new journey
		      			end
		      		end
		      	end
      		else		--no proper substitute found, sole survivor group will be empty
      			for y=0,Universe_PlayerCount()-1 do
							if Player_IsAlive(y) == 1 then
								if CPU_Exist_Smart(y) == 1 and AreAllied(y, playerIndex) == 0 then
									local enemy_survivor = "SoleSurvivor"..y
									if SobGroup_Empty(enemy_survivor) == 0 then
										if SobGroup_IsDoingAbility(enemy_survivor, AB_Attack) == 0 and 
										SobGroup_AreAllInRealSpace(enemy_survivor) == 1 and 
										SobGroup_CanDoAbility(enemy_survivor, AB_Attack) == 1 and 
										SobGroup_IsDocked(enemy_survivor) == 0 and 
										SobGroup_IsDoingAbility(enemy_survivor, AB_Dock) == 0 and 
										SobGroup_IsDoingAbility(enemy_survivor, AB_Capture) == 0 and 
										SobGroup_SobGroupCompare(enemy_survivor, "haxor_all_shipswithoutai") == 0 and 
										SobGroup_HealthPercentage(enemy_survivor) > 0 then
											SobGroup_Attack(y, enemy_survivor, "Player_NonSurvivorShips"..playerIndex)		--make the enemy attack the remaining useless ships (doesn't work?! never mind, just leave them with their own agenda...)
										end
									end
								end
							end
						end
      		end
      	end
      end
    end  
    playerIndex = playerIndex + 1
  end
  Rule_RandomInterval("AI_SoleSurvivor", 4, 0.5)
end

function SoleSurvivor_EvaluatePlayerStrength(playerIndex)
	local strength = 0
	for z, iCount in SoleSurvivorStats do
		strength = strength + iCount[playerIndex+2]
	end
	return strength
end

function SoleSurvivor_GetAverageEnemyStrength(playerIndex)
	local enemy = 0
	local total_strength = 0
	for i=0,Universe_PlayerCount()-1 do
		if Player_IsAlive(i) == 1 and AreAllied(playerIndex, i) == 0 then
			enemy = enemy + 1
			total_strength = total_strength + SoleSurvivor_EvaluatePlayerStrength(i)
		end
	end
	local average_strength = total_strength
	if enemy > 0 then
		average_strength = total_strength/enemy
	end
	return average_strength
end

function AI_CrateHunter(playerIndex, ShipNameList, hunt_radius, max_hunters)
	SobGroup_Create("AI_CrateHunterSOB"..playerIndex)
	if crates == 0 or GameRulesName == "Simplex Sole Survivor" then	--disabled for sole survivor mode (all AI ships should just guard the sole survivor)
		return
	end
	--restore AI for idle hunters
	if SobGroup_Empty("AI_CrateHunterSOB"..playerIndex) == 0 then
		local numships = SobGroup_SplitGroupReference("SingleRestoreAI_SOB", "AI_CrateHunterSOB"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("AI_CrateHunterSOB"..playerIndex), 0)
		for counter = 0, numships - 1, 1 do
			local ship = "SingleRestoreAI_SOB"..counter
			if SobGroup_SobGroupCompare(ship, "haxor_all_shipswithoutai") == 0 then
				if sqrt(SobGroup_GetEquivalentSpeed(ship)) < 30 or 
				SobGroup_IsDoingAbility(ship, AB_Move) == 0 or 
				SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or 
				SobGroup_IsDoingAbility(ship, AB_Guard) == 1 or 
				SobGroup_IsDocked(ship) == 1 or 
				SobGroup_AreAllInRealSpace(ship) == 0 then
					CPU_AddSobGroup(playerIndex, ship)
					SobGroup_SobGroupSubstract("AI_CrateHunterSOB"..playerIndex, ship)
				end
			end
		end
	end
	--add new hunters and remove their AI
	if SobGroup_Count("AI_CrateHunterSOB"..playerIndex) < max_hunters then
		if SobGroup_Empty("meg_crate") == 0 then
			--gather all capable hunters
			SobGroup_Create("CapableHuntersSOB")
			SobGroup_Clear("CapableHuntersSOB")
			for idx, ShipName in ShipNameList do
				SobGroup_SobGroupAdd("CapableHuntersSOB", ShipName..playerIndex)	--turn ship name into SOB
			end
			--pick hunters and start hunting
			local num_newhunter = 0
			local numships = SobGroup_SplitGroupReference("SingleCapableHunter_SOB", "CapableHuntersSOB", "Player_Ships"..playerIndex, SobGroup_Count("CapableHuntersSOB"), 0)
			for counter = 0, numships - 1, 1 do
				local ship = "SingleCapableHunter_SOB"..counter
				SobGroup_Create("NearbyCrate")
				SobGroup_Clear("NearbyCrate")
				if SobGroup_FillProximitySobGroup("NearbyCrate", "meg_crate", ship, hunt_radius) == 1 then --simple area scan with no distance sorting (to save computing power)
					if SobGroup_CountCompare(ship, "haxor_all_shipswithoutai") == 0 and 
					SobGroup_CountCompare(ship, "AI_CrateHunterSOB"..playerIndex) == 0 and 
					SobGroup_SobGroupCompare("SOB_PlayerWaves"..playerIndex, ship) == 0 and 
					SobGroup_IsDocked(ship) == 0 and 
					SobGroup_IsDoingAbility(ship, AB_Dock) == 0 and 
					SobGroup_IsDoingAbility(ship, AB_Guard) == 0 and 
					SobGroup_CanDoAbility(ship, AB_Move) == 1 and 
					SobGroup_AreAllInRealSpace(ship) == 1 then
						SobGroup_SobGroupAdd("AI_CrateHunterSOB"..playerIndex, ship)
						CPU_RemoveSobGroup(playerIndex, ship)
						SobGroup_MoveToSobGroup(ship, "NearbyCrate")
						num_newhunter = num_newhunter + 1
					end
				end
				if SobGroup_Count("AI_CrateHunterSOB"..playerIndex) >= max_hunters or num_newhunter > 4 then	--don't send out too many units at a time
					break
				end
			end
		end
	end
end

function AI_GhostIdling(playerIndex)	--called from RaceCheckSlow()
	--print("AI_GhostIdling is running for player "..playerIndex)
	Update_AllShips()
	SobGroup_Create("CheckGhostTargets_SOB")
	SobGroup_SobGroupAdd("CheckGhostTargets_SOB", "AllShips")
	SobGroup_SobGroupSubstract("CheckGhostTargets_SOB", "SOB_AllDummyHSGates")
	SobGroup_SobGroupSubstract("CheckGhostTargets_SOB", "all_supporters")
	SobGroup_SobGroupSubstract("CheckGhostTargets_SOB", "meg_ghostship"..playerIndex)
	--handle idle ghosts
	local numships = SobGroup_SplitGroupReference("SingleIdleGhost_SOB", "SOB_PlayerGhosts"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("SOB_PlayerGhosts"..playerIndex))
	for counter = 0, numships - 1, 1 do
		local ship = "SingleIdleGhost_SOB"..counter
		if SobGroup_Empty(ship) == 0 then
			local hp = SobGroup_HealthPercentage(ship)
			if hp > 0 then
				if SobGroup_Empty("CheckGhostTargets_SOB") == 0 then
					if SobGroup_IsGroupNearybyExcludingSelf(ship, "CheckGhostTargets_SOB", 3000) == 1 then
						if SobGroup_IsDoingAbility(ship, AB_Attack) == 0 then
							SobGroup_Kamikaze(ship, "CheckGhostTargets_SOB")	--SobGroup_Attack(0, ship, "CheckGhostTargets_SOB")
							SobGroup_SetHealth_Smart(ship, hp-random_pseudo(1,10)/100)
						end
					else
						if mod(gametime, 2) == 0 then
							SobGroup_Kamikaze(ship, "CheckGhostTargets_SOB")
						else
							if SobGroup_GetEquivalentSpeed(ship) < 10 then
								SobGroup_MoveToSobGroup(ship, "CheckGhostTargets_SOB")
								SobGroup_SetHealth_Smart(ship, hp-random_pseudo(1,10)/100)
							end
						end
					end
				else	--no valid target, just gradually kill the ghosts
					SobGroup_SetHealth_Smart(ship, hp-random_pseudo(1,10)/100)
				end
				if SobGroup_InWorldBound(ship, 1) == 0 then
					SobGroup_SetHealth_Smart(ship, hp-random_pseudo(1,10)/100)
				end
			end
		end
	end
	SobGroup_Clear("CheckGhostTargets_SOB")
end

function AI_GhostAttack(playerIndex)	--spawns ghost ships to attack player (called from megalith.lua)
	--print("AI_GhostAttack - Start")
	local playerIndexList = playerIndex+1
	--spawn new ghosts and give orders
	local shiptable = Player_GetShipTableByRace(playerIndex)
	local target_list = {"productioncapital", "smallcapitals", "juggernaughts", "utilities", "platforms", "frigates", "corvettes", "fighters", "shipwreck", "othersnoparade"}
	local max_difficulty = min(5, 1+sqrt(armedcapital[playerIndexList]))	--don't spawn capital ships unless the player has them
	local max_count = pilotpopdisplayList[playerIndexList]
	local exclude_name_patterns = {"station", "fortress", "mothership", "shipyard", "carrier", "scaver", "vgr_am", "hgn_rts", "hgn_tanker", "hgn_artillerysentinel", "kpr_dronestruct", "scaffold"}
	local exclude_classes = {"utility"}
	if SobGroup_Empty("frigates"..playerIndex) == 1 then
		exclude_classes = Table_CombineWithTable(exclude_classes, {"frigate"})
	end
	if SobGroup_Empty("platforms"..playerIndex) == 1 then
		exclude_classes = Table_CombineWithTable(exclude_classes, {"platform"})
	end
	for idx, target_type in target_list do
		local target = target_type..playerIndex
		if SobGroup_Empty(target) == 0 and SobGroup_Count("SOB_PlayerGhosts"..playerIndex) < max_count then
			if SobGroup_AreAllInRealSpace(target) == 1 and 
			SobGroup_IsDocked(target) == 0 then
				local radius = 16000
				local pos = SobGroup_GetPosition(target)
				local coord = {0, 0, 0}
				local theta = random_pseudo(-90,90)
				local beta = random_pseudo(0,360)
				coord[1] = pos[1] + radius*cos(theta)*cos(beta)
				coord[2] = pos[2] + radius*sin(theta)
				coord[3] = pos[3] + radius*cos(theta)*sin(beta)
				local unique_serial = random_pseudo(0,50000)
				Volume_AddSphere("VOL_AISpawnGhosts"..target..unique_serial, coord, 5000)
				SobGroup_Create("SOB_Temp_Ghosts")
				SobGroup_Clear("SOB_Temp_Ghosts")
				local capital_target = 0
				local shipname = ""
				for i=1,5,1 do
					local candicate = Table_RandomElement(shiptable)
					if String_ContainsPatternInTable(candicate.name, exclude_name_patterns) == 0 and
					String_ContainsPatternInTable(candicate.class, exclude_classes) == 0 and 
					candicate.officer+candicate.pilot ~= 0 and 
					candicate.officer < max_difficulty then
						shipname = candicate.name
						if candicate.officer > 0 then
							capital_target = 1
						end
						break
					end
				end
				if shipname ~= "" then
					SobGroup_SpawnNewShipInSobGroup(-1, shipname, "Ghost", "SOB_Temp_Ghosts", "VOL_AISpawnGhosts"..target..unique_serial)
					if SobGroup_CanDoAbility("SOB_Temp_Ghosts", AB_Move) == 1 and --SobGroup_CanDoAbility("SOB_Temp_Ghosts", AB_Builder) == 0
					SobGroup_CanDoAbility("SOB_Temp_Ghosts", AB_Attack) == 1 then
						if SobGroup_GetHardPointHealth("SOB_Temp_Ghosts", "experience") > 0.0001 then
							SobGroup_SetHardPointHealth("SOB_Temp_Ghosts", "experience", 0.0001)
						end
						--SobGroup_SetTeamColours("SOB_Temp_Ghosts", { random_pseudo(0,1000)/1000, random_pseudo(0,1000)/1000, random_pseudo(0,1000)/1000, }, { random_pseudo(0,1000)/1000, random_pseudo(0,1000)/1000, random_pseudo(0,1000)/1000, } , "DATA:Badges/Hiigaran.tga")	--doesn't seem to work
						--SobGroup_MakeSelectable("SOB_Temp_Ghosts", 0)
	          local megalitenoowner17 = Ping_AddSobGroup("Zombie Vessel", "megalitenoowner17", "SOB_Temp_Ghosts")
	          Ping_LabelVisible(megalitenoowner17, 1)
			      Ping_AddDescription(megalitenoowner17, 0, "Unidentified Threat")
						SobGroup_SobGroupAdd("ghosts", "SOB_Temp_Ghosts")	--for display in interface
						if capital_target == 1 then
							SobGroup_AddToPlayerGroups("SOB_Temp_Ghosts", {"SOB_CrisisCapitalTargets"})
						else
							SobGroup_AddToPlayerGroups("SOB_Temp_Ghosts", {"SOB_CrisisTargets"})
						end
						SobGroup_SetTactics_Smart("SOB_Temp_Ghosts", AggressiveTactics)
						SobGroup_AbilityActivate("SOB_Temp_Ghosts", AB_Lights, 0)	--turn off the lights to look like ghost ships
						SobGroup_Kamikaze("SOB_Temp_Ghosts", target)
						SobGroup_SobGroupAdd("SOB_PlayerGhosts"..playerIndex, "SOB_Temp_Ghosts")
					else
						SobGroup_SetHealth("SOB_Temp_Ghosts", 0)
					end
				end
				Volume_Delete("VOL_AISpawnGhosts"..target..unique_serial)
			end
		end
	end
	--print("AI_GhostAttack - End")
end

function AI_MeteorShower()
	if SobGroup_Empty("SOB_MeteorShower") == 0 then
		SobGroup_Create("CheckMeteorTargets_SOB")
		local playerIndex = 0
	  local playerIndexList = 0
	  while playerIndex < Universe_PlayerCount() do
	    playerIndexList = playerIndex + 1
	    if Player_IsAlive(playerIndex) == 1 then
	      if SobGroup_AreAnyOfTheseTypes("Player_Ships"..playerIndex, "meg_researchstation") == 0 then	--player with this ship won't be hit by meteor shower
					SobGroup_SobGroupAdd("CheckMeteorTargets_SOB", "Player_Ships"..playerIndex)
	      end
	    end  
	    playerIndex = playerIndex + 1
	  end
		SobGroup_SobGroupSubstract("CheckMeteorTargets_SOB", "SOB_AllDummyHSGates")
		SobGroup_SobGroupSubstract("CheckMeteorTargets_SOB", "all_supporters")
		if SobGroup_Empty("CheckMeteorTargets_SOB") == 0 then
			--pick random targets to shoot
			Update_AllShips()
			local numships = SobGroup_SplitGroupReference("SingleMeteorShower_SOB", "SOB_MeteorShower", "SOB_MeteorShower", SobGroup_Count("SOB_MeteorShower"))
			local numtargets = SobGroup_SplitGroupReference("SingleTarget_SOB", "CheckMeteorTargets_SOB", "AllShips", SobGroup_Count("CheckMeteorTargets_SOB"))
			for counter = 0, numships - 1, 1 do
				local ship = "SingleMeteorShower_SOB"..counter
				local target = "SingleTarget_SOB"..random_pseudo(0,numtargets-1)
				SobGroup_SetTactics_Smart(ship, AggressiveTactics)
				SobGroup_Attack(0, ship, target)
				if SobGroup_InWorldBound(ship, 1) == 1 then
					SobGroup_SetHealth(ship, 0)	--destroy the shower spawner if it's inside the map
				end
			end
		end
	  SobGroup_Clear("CheckMeteorTargets_SOB")
	else
		Rule_Remove("AI_MeteorShower")
	end
end

function AI_SobGroup_SpawnNewShipInSobGroup(playerIndex, shipname, squadron, group, volume, AI_enabled)	--spawn ship without AI to prevent 00000000 crash (same solution to survival wave spawn crash)
	SobGroup_SpawnNewShipInSobGroup(playerIndex, shipname, squadron, group, volume)
	if playerIndex >= 0 then
		local keep_cpu = 0
		if AI_enabled ~= nil then
			keep_cpu = AI_enabled
		end
		if CPU_Exist_Smart(playerIndex) == 1 and keep_cpu == 0 then
			CPU_RemoveSobGroup(playerIndex, group)
			SobGroup_SobGroupAdd("SOB_SpawnWithoutCPU"..playerIndex, group)
		end
	end
end

function AI_RestoreAIAfterSpawn(playerIndex)	--called from RaceCheckSlow()
	local playerIndexList = playerIndex + 1
	if SobGroup_Empty("SOB_SpawnWithoutCPU"..playerIndex) == 0 then
		local restore_limit = 1	--1+CPULODvalueList[playerIndexList]	--don't restore AI for more than this many ships at a time
		local restored = 0
		local numships = SobGroup_SplitGroupReference("SingleRestoreAI_SOB", "SOB_SpawnWithoutCPU"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("SOB_SpawnWithoutCPU"..playerIndex))
		for counter = 0, numships - 1, 1 do
			local ship = "SingleRestoreAI_SOB"..counter
			if SobGroup_HealthPercentage(ship) > 0 and 
			SobGroup_IsDoingAbility(ship, AB_Attack) == 0 and 
			SobGroup_IsDocked(ship) == 0 and 
			SobGroup_AreAllInRealSpace(ship) == 1 and 
			SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and 
			SobGroup_IsDoingAbility(ship, AB_HyperspaceViaGate) == 0 and 
			SobGroup_CountCompare(ship, "haxor_all_shipswithoutai") == 0 then
				local owner = SobGroup_OwnedBy(ship)
				if CPU_Exist_Smart(owner) == 1 then
					CPU_AddSobGroup(owner, ship)
					restored=restored+1
				end
				SobGroup_SobGroupSubstract("SOB_SpawnWithoutCPU"..playerIndex, ship)
				if restored>=restore_limit then
					return
				end
			end
		end
	end
end