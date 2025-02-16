function repairing()
	--print("repairing - Start")
  RepairBeam_StopAction()
  RepairBeam_KillDummy()
  RepairBeam_SpawnDummy()
  repairingExecute(nsy, nrpsy, "splitshipyards", 6750)  
  repairingExecute(nms, nrpms, "splitmotherships", 6750)  
  repairingExecute(ncf, nrpcf, "splitcommandfortresses", 8750)   
  repairingExecute(nbc, nrps, "splitbattlecruisers", 6750)
  RepairBeam_PreventIdling()
	--print("repairing - End")
end
function droning()
	--print("droning - Start")
  droningExecute(ncf, ndcf, "splitcommandfortresses", 8750)
	--print("droning - End")
end

function repairingExecute(number, numberIndex, Group, distance) 
  if number > 0 then                 
	  for i = 0,number-1,1 do   
	    if SobGroup_AreAnyOfTheseTypes(Group..i, "hgn_mothership, hgn_shipyard, hgn_shipyard_elohim, hgn_battleshipyard, hgn_shipyard_g, hgn_commandfortress, hgn_tanker, hgn_spacecarrier, vgr_shipyard, vgr_mothership_makaan, vgr_mothership, vgr_heavycruiser, vgr_commandfortress") == 1 then
	    	if SobGroup_Empty(Group..i) == 0 then	      
					local playerIndex = SobGroup_OwnedBy(Group..i)
					local patcher_type = "hgn_patcher"
					if Player_GetRace(playerIndex) == Race_Vaygr then
						patcher_type = "vgr_patcher"
					end
					--distance multiplier
					local improved_distance = distance
					for u=1,3,1 do
						if Player_HasResearch(SobGroup_OwnedBy(Group..i), "UtilitySpeedUpgrade"..u)==1 then
							improved_distance = distance * sqrt(1.4*u)
						end
					end

---se shuttle raccoglie juggy dockati e regola velocit?
          if SobGroup_AreAnyOfTheseTypes(Group..i, "hgn_tanker") == 1 then    
	          SobGroup_GetSobGroupDockedWithGroup(Group..i, "temp")     
			      SobGroup_FillShipsByType("temp1", "temp", "hgn_juggernaught") 
			      if SobGroup_Count("temp1") == 4 then	
			        SobGroup_SetHardPointHealth(Group..i, "speed", 0.6) 
			      elseif SobGroup_Count("temp1") == 3 then	
			        SobGroup_SetHardPointHealth(Group..i, "speed", 0.51) 
			      elseif SobGroup_Count("temp1") == 2 then	
			        SobGroup_SetHardPointHealth(Group..i, "speed", 0.42)
			      elseif SobGroup_Count("temp1") == 1 then
			        SobGroup_SetHardPointHealth(Group..i, "speed", 0.33)	
			      else
			        SobGroup_SetHardPointHealth(Group..i, "speed", 0)
			      end    
			      
			      --if SobGroup_FillProximitySobGroup ("temp", "hgn_juggernaught"..SobGroup_OwnedBy(Group..i), Group..i, 1000) == 1 then  
			        --if SobGroup_IsDoingAbility("temp", abilityList[9]) == 1 then
			          --SobGroup_SetHardPointHealth(Group..i, "speed", 1)
			        --end
			      --end 
			      SobGroup_Clear("temp")
	          SobGroup_Clear("temp1")    			         
          end
	                             
---raccoglie in sobroup i patchers dockati nella nave 
		      SobGroup_Create("repairingpatcher" .. tostring(Group..i))   
		      SobGroup_Create("lastrepairingpatcher" .. tostring(Group..i))                                                      
		      SobGroup_GetSobGroupDockedWithGroup(Group..i, "temp")
		      SobGroup_FillShipsByType("temp1", "temp", patcher_type) 
		      SobGroup_SobGroupAdd("repairingpatcher" .. tostring(Group..i), "temp1")   
		      numberIndex[i+1] = SobGroup_UpdateClass("repairingpatcher" .. tostring(Group..i), "lastrepairingpatcher" .. tostring(Group..i), numberIndex[i+1], 0, 0)                       
     	           
---raccoglie in "repairing"..i le unit? riparabili intorno alla shipyard e se danneggiate lancia i patchers 
		      if SobGroup_Count("repairingpatcher" .. tostring(Group..i)) > 0 then   
		      
	---caso in cui MS ha patchers e docka o hyperspazia, instant docking x patchers		        
		        if SobGroup_IsDocked(Group..i) == 1 or SobGroup_IsDoingAbility(Group..i, abilityList[5]) == 1 or SobGroup_IsDoingAbility(Group..i, abilityList[24]) == 1 then
	            SobGroup_DockSobGroupInstant("repairingpatcher" .. tostring(Group..i), Group..i) 		--opening the launch menu after hyperspace jump can cause crash, don't know why. error locations: 69746671, 3f800000, 3f324e2b, ffffffff, 
	          else
	            
	            SobGroup_Create("repairing"..i)                                        
		        	if SobGroup_FillProximitySobGroup ("repairing"..i, "repairingallies"..SobGroup_OwnedBy(Group..i), Group..i, improved_distance) == 1 then    
		        	
	---caso in cui MS o RS o CS sono dockate, le sottrae al gruppo da riparare	
		            clearrepairing(nms, "splitmotherships", "repairing"..i)	
		            clearrepairing(nrs, "splitresearchstations", "repairing"..i)
		            clearrepairing(ncs, "splitcrewstations", "repairing"..i)
		            clearrepairing(nps, "splitpowerstations", "repairing"..i)
		            clearrepairing(nws, "splitweaponstations", "repairing"..i)
		            clearrepairing(nj, "splitjuggernaughts", "repairing"..i)   
		            
		            if numberIndex[i+1] > 0 then         
		              for z = 0,(numberIndex[i+1]-1),1 do             
			              if SobGroup_Empty("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) == 0 then  
			                --Ping_LabelVisible(Ping_AddSobGroup("", "juggernaught", "splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)), 1)
			              
			---gestisce health del sottosistema lancio x capire se il patcher ? appena stato lanciato			
			                 if SobGroup_IsDocked("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) == 1 then
			                   SobGroup_SetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio", 0)
			                 else  
			                   if SobGroup_GetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio") < 0.6 then 
			                     SobGroup_SetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio", (SobGroup_GetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio") + 0.1))
			                   end
			                 end
			                 
		  ---passivo		              
			                if SobGroup_GetTactics("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) == 2 then 
			                
			                  if SobGroup_HealthPercentage("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) < 0.55 then  
				                  SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)	 
				                  
				                elseif SobGroup_GetDistanceToSobGroup("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i) > 9000 then
				                  SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i)  
				                  
				                elseif SobGroup_HealthPercentage("repairing"..i) >= 1 and SobGroup_UnderAttack("repairing"..i) == 0 then             
							            SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)  	               	                			                		            
							          					          		  
							          elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[13]) == 1 then
							          
							          elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), AB_Attack) == 1 then
							          
							          elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[4]) == 1 and SobGroup_GetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio") > 0.2 then
				                  SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)   			          
							           							                             
				       			    else		
				       			      if SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then	       			    
				       			        SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i) 
				       			      end    
				       			    end  
				       			                  
			---difensivo		                
			                elseif SobGroup_GetTactics("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) == 1 then	
			                  
			                  if SobGroup_HealthPercentage("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) < 0.35 then  
				                  SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)	 
				                  
				                elseif SobGroup_GetDistanceToSobGroup("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i) > 1000 then	--this is the distance to the shuttle, patchers will dock when within this range
				                  SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i)
				                  
				                elseif SobGroup_HealthPercentage("repairing"..i) >= 1 and SobGroup_UnderAttack("repairing"..i) == 0 then             
							            SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)                      	            
							          
							          elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[13]) == 1 then		
							            
							            --funziona, se si vuole decider di dare tutto il controllo ai patcher
							            --SobGroup_Clear("temp")			                      
		                      --instantdistance = distance/100
		                      --lastpriorita = -100000
		                      --while instantdistance <= distance do
											      --if SobGroup_FillProximitySobGroup ("temp", "repairing"..i, "splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), instantdistance) == 1 then				        
											        --bonus = 0
											        --if SobGroup_HealthPercentage("temp") >= 0.99 then 
											          --bonus = 1500
											        --elseif SobGroup_HealthPercentage("temp") <= 0.1 then   
											          --bonus = -1500
											        --end
											        --priorita = -(instantdistance + (SobGroup_HealthPercentage("temp")*distance*1.2) + bonus)
										          --if priorita > lastpriorita then
										           	--lastpriorita = priorita												           	
        												--SobGroup_Clear("temp1") 
										           	--SobGroup_SobGroupAdd("temp1", "temp") 
										          --end													        			        
											      --end      
											      --instantdistance = instantdistance + (distance/100)
											    --end  													    
											    --SobGroup_RepairSobGroup("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "temp1")	
							          
							          elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), AB_Attack) == 1 then
							          
							          elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[4]) == 1 and SobGroup_GetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio") > 0.2 then
				                  SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)   							                    
				                  
				                elseif (SobGroup_HealthPercentage("repairing"..i) < 1) and (SobGroup_HealthPercentage("repairing"..i) > 0) or SobGroup_UnderAttack("repairing"..i) == 1 then 		                                 		                
				                  if SobGroup_IsDockedSobGroup("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i) == 1 then			                    
				                    if SobGroup_GetTactics(Group..i) ~= 2 and SobGroup_HealthPercentage("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) >= 0.9 then                                    
								              SobGroup_Launch_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)
								            end   
				                  else
				                    if SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then	
				                      SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i) 									                         
				                    end  
				                  end		
				                  			                                
				       			    else
				       			      if SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then   	
												    SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i) 	                     
				       			      end  
				       			    end    
				       			        
			---aggressivo		                
			                elseif SobGroup_GetTactics("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) == 0 then 		    
			                 	                
				                if SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[13]) == 1 then	
				                
				                elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), AB_Attack) == 1 then
				                
				                elseif SobGroup_GetDistanceToSobGroup("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i) > 150 then		--basically patchers will always stay outside
				                  SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i)
				                		                
				                elseif SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[4]) == 1 and SobGroup_GetHardPointHealth("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "lancio") > 0.2 then
				                  SobGroup_DockSobGroupAndStayDocked_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i) 
				                    		
				                elseif (SobGroup_HealthPercentage("repairing"..i) < 1) and (SobGroup_HealthPercentage("repairing"..i) > 0) or SobGroup_UnderAttack("repairing"..i) == 1 then  			                
				                  if SobGroup_IsDockedSobGroup("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i) == 1 then
				                    if SobGroup_GetTactics(Group..i) ~= 2 and SobGroup_HealthPercentage("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z)) >= 0.8 then                                    
								              SobGroup_Launch_Smart("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), Group..i)
								            end   
				                  else
				                    if SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then
				                    	SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i) 
				                    end	
				                  end		
				                  			                                               
				       			    else
				       			      if SobGroup_IsDoingAbility("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then
				       			        SobGroup_RepairSobGroup_ADV("splitrepairingpatcher" .. tostring(Group..i) .. tostring(z), "repairing"..i) 
				       			      end  
				       			    end       
				       			  end                               
			              end 
			            end  	                                     
			          end
			          
			        else
			          SobGroup_DockSobGroupAndStayDocked_Smart("repairingpatcher" .. tostring(Group..i), Group..i)                                                             
			        end  
			        SobGroup_Clear("repairing"..i)    	            
	          end                                     
		      end		                  
              
---caso in cui viene distrutta la nave, prima i pecher verificano se c'? un altro riparatore capital, altrimenti si autodistruggono                       
		    elseif (SobGroup_Empty(Group..i) == 1) or (SobGroup_OwnedBy("repairingpatcher" .. tostring(Group..i)) ~= SobGroup_OwnedBy(Group..i)) then
		      if SobGroup_Empty("repairingpatcher" .. tostring(Group..i)) == 0 then
			      if SobGroup_Empty("repairer"..SobGroup_OwnedBy("repairingpatcher" .. tostring(Group..i))) == 0 then
			        SobGroup_DockSobGroupAndStayDocked_Smart("repairingpatcher" .. tostring(Group..i), "repairer"..SobGroup_OwnedBy("repairingpatcher" .. tostring(Group..i)))
			        SobGroup_Clear("repairingpatcher" .. tostring(Group..i))
			      else
			        SobGroup_TakeDamage(patcher_type..SobGroup_OwnedBy("repairingpatcher" .. tostring(Group..i)), 1)                       
			      end    
			    end            
		    end    
		  end  
	    SobGroup_Clear("temp")
	    SobGroup_Clear("temp1")   
	  end     
  end          
end

function SobGroup_RepairSobGroup_ADV(repairer, repair_target)
	local playerIndex = SobGroup_OwnedBy(repairer)
	if SobGroup_AreAllInRealSpace(repairer) == 1 then
		if Player_GetRace(playerIndex) == Race_Vaygr and Player_HasResearch(playerIndex, "RepairBeam" ) == 1 then		--repair beam mode
			if CPU_Exist_Smart(playerIndex) == 1 then
				CPU_RemoveSobGroup(playerIndex, repairer)
			end
			SobGroup_Create("TEMP_RepairTarget")
			SobGroup_Clear("TEMP_RepairTarget")
			if SobGroup_Empty(repair_target) == 0 then		--subtract ships with full health
				local numShips = SobGroup_SplitGroupReference("SingleSplitRepairTarget_SOB", repair_target, "Player_Ships"..playerIndex, SobGroup_Count(repair_target), 0)
				for z = 0, numShips - 1, 1 do
					if SobGroup_HealthPercentage("SingleSplitRepairTarget_SOB"..z) < 1 and SobGroup_HealthPercentage("SingleSplitRepairTarget_SOB"..z) > 0 then
						if SobGroup_AreAllInRealSpace("SingleSplitRepairTarget_SOB"..z) == 1 and 
						SobGroup_IsDoingAbility("SingleSplitRepairTarget_SOB"..z, AB_Hyperspace) == 0 then
							SobGroup_SobGroupAdd("TEMP_RepairTarget", "SingleSplitRepairTarget_SOB"..z)
						end
					end
				end
			end
			--pick single random target to repair
			if SobGroup_Count("TEMP_RepairTarget") >= 1 then
				local numTargets = SobGroup_SplitGroupReference("SingleFindRepairTarget_SOB", "TEMP_RepairTarget", "Player_Ships"..playerIndex, SobGroup_Count("TEMP_RepairTarget"), 0)
				local picked_target = "SingleFindRepairTarget_SOB"..random_pseudo(0,numTargets-1)
				SobGroup_Attack(playerIndex, repairer, picked_target)
				SobGroup_SobGroupAdd("RepairBeamMonitorTarget"..playerIndex, picked_target)
			else
				SobGroup_Attack(playerIndex, repairer, "TEMP_RepairTarget")
				SobGroup_SobGroupAdd("RepairBeamMonitorTarget"..playerIndex, "TEMP_RepairTarget")
			end
		else	--default repair mode
			if SobGroup_AreAllInRealSpace(repair_target) == 1 and 
			SobGroup_IsDoingAbility(repair_target, AB_Hyperspace) == 0 then
				SobGroup_RepairSobGroup(repairer, repair_target)
			end
		end
	end
end

function SobGroup_RepairSobGroup_Search(repairer, repair_target, search_start, search_step, search_range)
	local stop_action = 0
	local breaker = 0
	local playerIndex = SobGroup_OwnedBy(repairer)
	SobGroup_Create("SOB_NextRepairTarget")
	if SobGroup_Count(repairer) > 1 then
		stop_action = 1
	elseif SobGroup_Count(repairer) > 0 then
		while search_start < search_range and breaker == 0 do
			if SobGroup_FillProximitySobGroupExceptSelf("SOB_NextRepairTarget", repair_target, repairer, search_start) == 1 then
				if SobGroup_HealthPercentage("SOB_NextRepairTarget") < 1 and SobGroup_HealthPercentage("SOB_NextRepairTarget") > 0 then
					SobGroup_RepairSobGroup_ADV(repairer, "SOB_NextRepairTarget")
					breaker = 1
				elseif search_start + search_step >= search_range then
					stop_action = 1
				end
			elseif search_start + search_step >= search_range then
				stop_action = 1
			end
			search_start = search_start + search_step
		end
	end
	if stop_action == 1 then
		if SobGroup_Empty("repairer"..playerIndex) == 0 then
			SobGroup_DockSobGroupAndStayDocked_Smart(repairer, "repairer"..playerIndex)
		else
			SobGroup_Stop(playerIndex, repairer)
		end
	end
	return breaker
end

function RepairBeam_PreventIdling()
	local playerIndex = 0
	local playerCount = Universe_PlayerCount()
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			if Player_GetRace(playerIndex) == Race_Vaygr and Player_HasResearch(playerIndex, "RepairBeam" ) == 1 then
				if SobGroup_Empty("vgr_patcher"..playerIndex) == 0 then
					local numships = SobGroup_SplitGroupReference("SinglePreventIdleMechanic_SOB", "vgr_patcher"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_patcher"..playerIndex), 0)
					for counter = 0, numships - 1, 1 do
						if SobGroup_HealthPercentage("SinglePreventIdleMechanic_SOB"..counter) > 0 and SobGroup_IsDoingAbility("SinglePreventIdleMechanic_SOB"..counter, AB_Stop) == 1 then
							SobGroup_RepairSobGroup_Search("SinglePreventIdleMechanic_SOB"..counter, "repairingallies"..playerIndex, 2000, 3000, 15000)
						end
					end
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

function RepairBeam_StopAction()
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			SobGroup_Create("RepairBeamMonitorTarget"..playerIndex)
			if Player_GetRace(playerIndex) == Race_Vaygr and Player_HasResearch(playerIndex, "RepairBeam" ) == 1 then
				if SobGroup_Empty("vgr_patcher"..playerIndex) == 0 then
					if SobGroup_IsDoingAbility("vgr_patcher"..playerIndex, AB_Attack) == 1 then
						--stop attacking enemies
						if SobGroup_UnderAttack("enemies"..playerIndex) == 1 then
							SobGroup_Create("SOB_GetAttacker")
							SobGroup_Clear("SOB_GetAttacker")
							SobGroup_GetAttackers("enemies"..playerIndex, "SOB_GetAttacker")
							SobGroup_Create("SOB_CompareAttackerWithRepairer")
							SobGroup_Clear("SOB_CompareAttackerWithRepairer")
							SobGroup_FillCompare("SOB_CompareAttackerWithRepairer", "SOB_GetAttacker", "vgr_patcher"..playerIndex)
							if SobGroup_Empty("SOB_CompareAttackerWithRepairer") == 0 then
								SobGroup_RepairSobGroup_Search("SOB_CompareAttackerWithRepairer", "repairingallies"..playerIndex, 2000, 3000, 15000)
							end
						end
						--print("There're "..SobGroup_Count("RepairBeamMonitorTarget"..playerIndex).." repair beam targets for playerIndex: "..playerIndex)
						if SobGroup_Empty("RepairBeamMonitorTarget"..playerIndex) == 0 then
							local numships = SobGroup_SplitGroupReference("SingleMonitorRepairBeamTarget_SOB", "RepairBeamMonitorTarget"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("RepairBeamMonitorTarget"..playerIndex), 0)
							local ID_to_remove = {}
							local ID_counter = 0
							for counter = 0, numships - 1, 1 do
								if SobGroup_HealthPercentage("SingleMonitorRepairBeamTarget_SOB"..counter) >= 1 or SobGroup_HealthPercentage("SingleMonitorRepairBeamTarget_SOB"..counter) <= 0 then
									if SobGroup_FillProximitySobGroupExceptSelf("SOB_BeamRepairerGroup", "vgr_patcher"..playerIndex, "SingleMonitorRepairBeamTarget_SOB"..counter, 2000) == 1 then
										local numPatchers = SobGroup_SplitGroupReference("SingleProximityBeamRepair_SOB", "SOB_BeamRepairerGroup", "Player_Ships"..playerIndex, SobGroup_Count("SOB_BeamRepairerGroup"), 0)
										for x = 0, numPatchers - 1, 1 do
											if SobGroup_IsDoingAbility("SingleProximityBeamRepair_SOB"..x, AB_Attack) == 1 then		--pick next repair target or simply stop
												SobGroup_RepairSobGroup_Search("SingleProximityBeamRepair_SOB"..x, "repairingallies"..playerIndex, 2000, 3000, 15000)
											end
										end
									end
									ID_counter = ID_counter + 1
									ID_to_remove[ID_counter] = "SingleMonitorRepairBeamTarget_SOB"..counter
								end
							end
							if ID_counter > 0 then
								--print("Removing "..ID_counter.." repair beam targets from "..numships.." previous targets for playerIndex: "..playerIndex)
								for z, iCount in ID_to_remove do
									SobGroup_SobGroupSubstract("RepairBeamMonitorTarget"..playerIndex, iCount)
								end
							end
						end
					end
				else		--when there are no repairers, delete all targets
					SobGroup_Clear("RepairBeamMonitorTarget"..playerIndex)
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

function RepairBeam_KillDummy()
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			if Player_GetRace(playerIndex) == Race_Vaygr and Player_HasResearch(playerIndex, "RepairBeamUpgrade3" ) == 1 then		--"RepairBeam"
				if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dummy_repairbeam") > 0 then
					SobGroup_Create("vgr_dummy_repairbeam"..playerIndex)
					Player_FillShipsByType("vgr_dummy_repairbeam"..playerIndex, playerIndex, "vgr_dummy_repairbeam")
					--SobGroup_Despawn("vgr_dummy_repairbeam"..playerIndex)
					SobGroup_SetHealth("vgr_dummy_repairbeam"..playerIndex, 0)
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

function RepairBeam_SpawnDummy()
	local playerIndex = 0
	local playerCount = Universe_PlayerCount()
	Temp_GlobalVariable.RepairBeamKiddies = {0,0,0,0,0,0}		--for accolade system
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			if Player_GetRace(playerIndex) == Race_Vaygr and Player_HasResearch(playerIndex, "RepairBeam" ) == 1 then
				if SobGroup_Empty("vgr_patcher"..playerIndex) == 0 then
					local numships = SobGroup_SplitGroupReference("SingleMechanicDummySpawn_SOB", "vgr_patcher"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_patcher"..playerIndex))
					for counter = 0, numships - 1, 1 do
						local is_repairing = 0
						if SobGroup_HealthPercentage("SingleMechanicDummySpawn_SOB"..counter) > 0 and SobGroup_IsDoingAbility("SingleMechanicDummySpawn_SOB"..counter, AB_Attack) == 1 then
							if SobGroup_FillProximitySobGroupExceptSelf("SOB_BeamRepairTarget", "repairingallies"..playerIndex, "SingleMechanicDummySpawn_SOB"..counter, 2000) == 1 then
								if SobGroup_HealthPercentage("SOB_BeamRepairTarget") < 1 and SobGroup_HealthPercentage("SOB_BeamRepairTarget") > 0 then
									if Player_HasResearch(playerIndex, "RepairBeamUpgrade3") == 1 then		--spawn dummy object for area repair only
										SobGroup_Create("SOB_RepairBeamDummyTarget")
										SobGroup_Clear("SOB_RepairBeamDummyTarget")
										Volume_AddSphere("VOL_SOB_RepairBeamDummyTarget"..playerIndex..counter, SobGroup_GetPosition("SingleMechanicDummySpawn_SOB"..counter), 6000)
										SobGroup_SpawnNewShipInSobGroup(playerIndex, "vgr_dummy_repairbeam", "RepairBeam", "SOB_RepairBeamDummyTarget", "VOL_SOB_RepairBeamDummyTarget"..playerIndex..counter)
										SobGroup_ParadeSobGroup("SOB_RepairBeamDummyTarget", "SingleMechanicDummySpawn_SOB"..counter, 2)
										SobGroup_GuardSobGroup("SOB_RepairBeamDummyTarget", "SingleMechanicDummySpawn_SOB"..counter)
										SobGroup_MakeSelectable("SOB_RepairBeamDummyTarget", 0)
										--if Player_HasResearch(playerIndex, "RepairBeamUpgrade3") == 1 then
										--	SobGroup_SetHardPointHealth("SOB_RepairBeamDummyTarget", "repair_radius_500", 0)
										--else
										--	SobGroup_SetHardPointHealth("SOB_RepairBeamDummyTarget", "repair_radius_750", 0)
										--end
										Volume_Delete("VOL_SOB_RepairBeamDummyTarget"..playerIndex..counter)
									end
									is_repairing = 1
								end
							end
						end
						if is_repairing == 1 then
							SobGroup_SetHardPointHealth("SingleMechanicDummySpawn_SOB"..counter, "doing_repair", 0)
							Temp_GlobalVariable.RepairBeamKiddies[playerIndex+1] = Temp_GlobalVariable.RepairBeamKiddies[playerIndex+1] + 1
						else
							SobGroup_SetHardPointHealth("SingleMechanicDummySpawn_SOB"..counter, "doing_repair", 1)
						end
					end
				end
			end
		end
		playerIndex = playerIndex + 1
	end
end

function droningExecute(number, numberIndex, Group, distance)
  if number > 0 then
	  for i = 0,number-1,1 do   
	    if SobGroup_Empty(Group..i) == 0 then      

				--distance multiplier
				local improved_distance = distance
				for u=1,3,1 do
					if Player_HasResearch(SobGroup_OwnedBy(Group..i), "UtilitySpeedUpgrade"..u)==1 then
						improved_distance = distance * sqrt(1.4*u)
					end
				end

---raccoglie in "droning"..i le unit? attaccabili intorno alla nave e se danneggiate lancia i droni         
	      SobGroup_Create("drone" .. tostring(Group..i)) 	 
	      SobGroup_Create("lastdrone" .. tostring(Group..i)) 	                                                       
	      SobGroup_GetSobGroupDockedWithGroup(Group..i, "temp")
	      SobGroup_FillShipsByType("temp1", "temp", "hgn_drone") 	      
	      SobGroup_SobGroupAdd("drone" .. tostring(Group..i), "temp1")         	      
	      numberIndex[i+1] = SobGroup_UpdateClass("drone" .. tostring(Group..i), "lastdrone" .. tostring(Group..i), numberIndex[i+1], 0, 0)               
      
	      if SobGroup_Count("drone" .. tostring(Group..i)) > 0 then    
	      
---caso in cui c'? hyperspazio					               
          if SobGroup_IsDoingAbility(Group..i, abilityList[5]) == 1 or SobGroup_IsDoingAbility(Group..i, abilityList[24]) == 1 then
            SobGroup_DockSobGroupInstant("drone" .. tostring(Group..i), Group..i)
          end
	                                                                
	        SobGroup_Create("droning"..i)                                        
	        if SobGroup_FillProximitySobGroup ("droning"..i, "enemies"..SobGroup_OwnedBy(Group..i), Group..i, improved_distance) == 1 then                                                        
	          if SobGroup_HealthPercentage("droning"..i) > 0 then 	            
	            if numberIndex[i+1] > 0 then         
	              for z = 0,(numberIndex[i+1]-1),1 do             
		              if SobGroup_Empty("splitdrone" .. tostring(Group..i) .. tostring(z)) == 0 then 		
		              
		  ---gestisce health del sottosistema lancio x capire se il patcher ? appena stato lanciato			
		                 if SobGroup_IsDocked("splitdrone" .. tostring(Group..i) .. tostring(z)) == 1 then
		                   SobGroup_SetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio", 0)
		                 else  
		                   if SobGroup_GetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio") < 0.6 then 
		                     SobGroup_SetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio", (SobGroup_GetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio") + 0.1))
		                   end
		                 end            
		              
		  ---passivo		              
		                if SobGroup_GetTactics("splitdrone" .. tostring(Group..i) .. tostring(z)) == 2 then 
		                  if SobGroup_HealthPercentage("splitdrone" .. tostring(Group..i) .. tostring(z)) < 0.55 then  
			                  SobGroup_DockSobGroupAndStayDocked_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i)	  					           
						          elseif SobGroup_IsDoingAbility("splitdrone" .. tostring(Group..i) .. tostring(z), abilityList[4]) == 1 and SobGroup_GetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio") > 0.2 then     
						            SobGroup_DockSobGroupAndStayDocked_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i)                             
			       			    else		
			       			      if SobGroup_IsDoingAbility("splitdrone" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then	       			    
			       			        SobGroup_Attack(SobGroup_OwnedBy("splitdrone" .. tostring(Group..i) .. tostring(z)), "splitdrone" .. tostring(Group..i) .. tostring(z), "droning"..i)        
			       			      end  
			       			    end                
			---difensivo		                
		                elseif SobGroup_GetTactics("splitdrone" .. tostring(Group..i) .. tostring(z)) == 1 then	  
		                  if SobGroup_HealthPercentage("splitdrone" .. tostring(Group..i) .. tostring(z)) < 0.35 then  
			                  SobGroup_DockSobGroupAndStayDocked_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i)	                          
			                elseif SobGroup_IsDoingAbility("splitdrone" .. tostring(Group..i) .. tostring(z), abilityList[4]) == 1 and SobGroup_GetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio") > 0.2 then    
			                  SobGroup_DockSobGroupAndStayDocked_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i) 
			                elseif SobGroup_IsDockedSobGroup("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i) == 1 then
		                    if SobGroup_GetTactics(Group..i) ~= 2 and SobGroup_HealthPercentage("splitdrone" .. tostring(Group..i) .. tostring(z)) >= 0.9 then                                    
						              SobGroup_Launch_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i)
						            end                  		                                
			       			    else
			       			      if SobGroup_IsDoingAbility("splitdrone" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then	
			       			      	SobGroup_Attack(SobGroup_OwnedBy("splitdrone" .. tostring(Group..i) .. tostring(z)), "splitdrone" .. tostring(Group..i) .. tostring(z), "droning"..i)  
			       			      end
			       			    end        
			---aggressivo		                
		                elseif SobGroup_GetTactics("splitdrone" .. tostring(Group..i) .. tostring(z)) == 0 then 		     	                
			                if SobGroup_IsDoingAbility("splitdrone" .. tostring(Group..i) .. tostring(z), abilityList[4]) == 1 and SobGroup_GetHardPointHealth("splitdrone" .. tostring(Group..i) .. tostring(z), "lancio") > 0.2 then		
			                  SobGroup_DockSobGroupAndStayDocked_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i) 
			                elseif SobGroup_IsDockedSobGroup("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i) == 1 then
		                    if SobGroup_GetTactics(Group..i) ~= 2 and SobGroup_HealthPercentage("splitdrone" .. tostring(Group..i) .. tostring(z)) >= 0.8 then                                    
						              SobGroup_Launch_Smart("splitdrone" .. tostring(Group..i) .. tostring(z), Group..i)
						            end              			                                               
			       			    else
			       			      if SobGroup_IsDoingAbility("splitdrone" .. tostring(Group..i) .. tostring(z), abilityList[9]) == 0 then	
			       			        SobGroup_Attack(SobGroup_OwnedBy("splitdrone" .. tostring(Group..i) .. tostring(z)), "splitdrone" .. tostring(Group..i) .. tostring(z), "droning"..i)  
			       			      end  
			       			    end       
			       			  end 			       			                                
		              end 
		            end  	                                     
		          end
		        end  		          
	        else
	          SobGroup_DockSobGroupAndStayDocked_Smart("drone" .. tostring(Group..i), Group..i)                                                             
	        end  
	        SobGroup_Clear("droning"..i)                                     
	      end			     	       
	              
---caso in cui viene distrutta la nave, prima i pecher verificano se c'? un altro riparatore capital, altrimenti si autodistruggono                     
	    elseif (SobGroup_Empty(Group..i) == 1) or (SobGroup_OwnedBy("drone" .. tostring(Group..i)) ~= SobGroup_OwnedBy(Group..i)) then       
	      if SobGroup_Empty("drone" .. tostring(Group..i)) == 0 then
	        if SobGroup_Empty("hgn_commandfortress"..SobGroup_OwnedBy("drone" .. tostring(Group..i))) == 0 then	        
	          SobGroup_DockSobGroupAndStayDocked_Smart("drone" .. tostring(Group..i), "hgn_commandfortress"..SobGroup_OwnedBy("drone" .. tostring(Group..i)))
			      SobGroup_Clear("drone" .. tostring(Group..i))        
	        else
		        SobGroup_TakeDamage("hgn_drone"..SobGroup_OwnedBy("drone" .. tostring(Group..i)), 1)                       
		      end     
		    end                      
	    end   
	    SobGroup_Clear("temp")
	    SobGroup_Clear("temp1") 	    
	  end       
  end                              
end

function repairingdock()    		--not used in OnInit()
  local playerIndex = 0                       
  local playerCount = Universe_PlayerCount()     
  while playerIndex < playerCount do
    if (Player_IsAlive(playerIndex) == 1) then
      if (Player_HasShipWithBuildQueue(playerIndex) == 1) then   
        if Player_HasResearch(playerIndex, "isai" ) == 0 then   
      
	        if Player_HasResearch(playerIndex, "CapitalDockingUpgrade1" ) == 1 and Player_HasResearch(playerIndex, "CapitalDockingUpgrade2" ) == 0 then                 
		        SobGroup_Create("repairingdock"..playerIndex)                              
		        SobGroup_GetSobGroupDockedWithGroup("Player_Ships"..playerIndex, "repairingdock"..playerIndex) 
		        if SobGroup_Empty("repairingdock"..playerIndex) == 0 then       
			        SobGroup_SetHealth("repairingdock"..playerIndex, (SobGroup_HealthPercentage("repairingdock"..playerIndex) + 0.1))   
			        SobGroup_Clear("repairingdock"..playerIndex)
			      end  
			    elseif Player_HasResearch(playerIndex, "CapitalDockingUpgrade2" ) == 1 and Player_HasResearch(playerIndex, "CapitalDockingUpgrade3" ) == 0  then       
			      if SobGroup_Empty("repairingdock"..playerIndex) == 0 then       
			        SobGroup_SetHealth("repairingdock"..playerIndex, (SobGroup_HealthPercentage("repairingdock"..playerIndex) + 0.2))   
			        SobGroup_Clear("repairingdock"..playerIndex)
			      end  
			    elseif Player_HasResearch(playerIndex, "CapitalDockingUpgrade3" ) == 1 then       
			      if SobGroup_Empty("repairingdock"..playerIndex) == 0 then       
			        SobGroup_SetHealth("repairingdock"..playerIndex, (SobGroup_HealthPercentage("repairingdock"..playerIndex) + 0.3))   
			        SobGroup_Clear("repairingdock"..playerIndex)
			      end             
			    end    			      
			    
		    end
      end
    end     
    playerIndex = playerIndex + 1
  end      
end

function clearrepairing(number, Group, Group1)
  if number > 0 then
	  for z = 0,number-1,1 do
	    if SobGroup_Empty(Group..z) == 0 then       
	      if SobGroup_IsDocked(Group..z) == 1 then 
	        SobGroup_FillSubstract("temp2", Group1, Group..z)   
	        SobGroup_Clear(Group1)
	        SobGroup_SobGroupAdd(Group1, "temp2")		
	        SobGroup_Clear("temp2")		                  
	      end	      
	    end
	  end  
	end  
end  



