function trade()    
  local playerIndex = 0   
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then 
        if SobGroup_Count("trader"..playerIndex) > 0 then			
					if (SobGroup_Count("traderallies"..playerIndex) - SobGroup_Count("trader"..playerIndex)) > 0 then
						local numcontainer = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_container") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_container") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_container") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_container")
						if numcontainer > 0 then 	        
							TradePower = 1	      
							if Player_HasResearch(playerIndex, "TradePower2" ) == 1 then
								TradePower = TradePower * 1.75            
							elseif Player_HasResearch(playerIndex, "TradePower1" ) == 1 then
								TradePower = TradePower * 1.5            
							elseif Player_HasResearch(playerIndex, "TradePower" ) == 1 then
								TradePower = TradePower * 1.25       
							end 		               
							tradeList[playerIndexList] = floor((Player_GetRU(playerIndex) / 6 * sqrt(numcontainer*0.5)) * TradePower + (RUaggiuntiva[playerIndexList]*numcontainer*TradePower))                 
	          
--diminuisce il fattore esponenziale, più aumenta più è difficile da incrementare
						tradeamountfactor = (1-(tradeList[playerIndexList]/(20000/sqrt(numcontainer*0.5))))   
						if tradeamountfactor < 0.5 then
							tradeamountfactor = 0.5
						end
						tradeList[playerIndexList] = floor(tradeList[playerIndexList]*tradeamountfactor)     
							
							for i = 0,(ntrc - 1),1 do 
								SobGroup_ForceStayDockedIfDocking("splitcontainers"..i)
								if SobGroup_Empty("splitcontainers"..i) == 0 then  
								
---pings container
									if (SobGroup_OwnedBy("splitcontainers"..i) == Universe_CurrentPlayer()) and (SobGroup_IsDocked("splitcontainers"..i) == 0) then 	                
										Ping_LabelVisible(Ping_AddSobGroup(tradeList[SobGroup_OwnedBy("splitcontainers"..i)+1] .. " RUs", "minecontainer", "splitcontainers"..i), 1)  									
									end 
									
									if SobGroup_OwnedBy("splitcontainers"..i) == playerIndex then 
---se dockato in prod cap viene lanciato se non passivo                
										if SobGroup_IsDockedSobGroup("splitcontainers"..i, "traderallies"..playerIndex) == 1 then    
										
											if SobGroup_FillProximitySobGroup ("temp", "trader"..playerIndex, "splitcontainers"..i, 500) == 1 then
												if SobGroup_GetHardPointHealth("splitcontainers"..i, "ru") < 0.5 then
													Player_SetRU(playerIndex, Player_GetRU(playerIndex) + tradeList[playerIndexList]) 
													RUaggiuntiva[playerIndexList] = 0				              
													tradeListSummary[playerIndexList] = tradeListSummary[playerIndexList] + tradeList[playerIndexList] 
													SobGroup_SetHardPointHealth("splitcontainers"..i, "ru", 1)					              
												else
													--kpr_dronestruct needs this exception
													local numships = SobGroup_SplitGroupReference("SingleLaunchFromAlliedTrader_SOB", "traderallies"..playerIndex, "allies"..playerIndex, SobGroup_Count("traderallies"..playerIndex))
													for counter = 0, numships - 1, 1 do
														if SobGroup_IsDockedSobGroup("splitcontainers"..i, "SingleLaunchFromAlliedTrader_SOB"..counter) == 1 then															
															if SobGroup_HealthPercentage("splitcontainers"..i) >= 1 then
																SobGroup_Launch_Smart("splitcontainers"..i, "SingleLaunchFromAlliedTrader_SOB"..counter)
																break
															end
														end
													end
													for z = 0,(npca[playerIndexList]-1),1 do	
														if SobGroup_IsDockedSobGroup("splitcontainers"..i, "splitproductioncapitalallies"..playerIndex .. tostring(z)) == 1 then
															if SobGroup_GetHardPointHealth("splitcontainers"..i, "hgn_orders_trade") == 0 then
																if SobGroup_HealthPercentage("splitcontainers"..i) >= 1 then
																	SobGroup_Launch_Smart("splitcontainers"..i, "splitproductioncapitalallies"..playerIndex .. tostring(z))
																	break
																end	
															end  
														end
													end
												end 		   	                    
											else
												if SobGroup_GetHardPointHealth("splitcontainers"..i, "ru") > 0.5 then
													Player_SetRU(playerIndex, Player_GetRU(playerIndex) + tradeList[playerIndexList]) 	
													RUaggiuntiva[playerIndexList] = 0			              
													tradeListSummary[playerIndexList] = tradeListSummary[playerIndexList] + tradeList[playerIndexList] 
													SobGroup_SetHardPointHealth("splitcontainers"..i, "ru", 0) 					              
												else
													--kpr_dronestruct needs this exception
													local numships = SobGroup_SplitGroupReference("SingleLaunchFromAlliedTraderAlt_SOB", "traderallies"..playerIndex, "allies"..playerIndex, SobGroup_Count("traderallies"..playerIndex))
													for counter = 0, numships - 1, 1 do
														if SobGroup_IsDockedSobGroup("splitcontainers"..i, "SingleLaunchFromAlliedTraderAlt_SOB"..counter) == 1 then															
															if SobGroup_HealthPercentage("splitcontainers"..i) >= 1 then
																SobGroup_Launch_Smart("splitcontainers"..i, "SingleLaunchFromAlliedTraderAlt_SOB"..counter)
																break
															end
														end
													end
													for z = 0,(npca[playerIndexList]-1),1 do	
														if SobGroup_IsDockedSobGroup("splitcontainers"..i, "splitproductioncapitalallies"..playerIndex .. tostring(z)) == 1 then															
															if SobGroup_HealthPercentage("splitcontainers"..i) >= 1 then
																SobGroup_Launch_Smart("splitcontainers"..i, "splitproductioncapitalallies"..playerIndex .. tostring(z))
																break
															end
														end  
													end
												end 		                   
											end 																			
---se libero                
										else                 
---casistica	             
											if SobGroup_IsDoingAbility("splitcontainers"..i, abilityList[9]) == 1 then											
											  if SobGroup_GetHardPointHealth("splitcontainers"..i, "hgn_orders_trade") > 0 then		
													if SobGroup_FillProximitySobGroup ("temp", "trader"..playerIndex, "splitcontainers"..i, 1000) == 0 then
														local randomdock = 0
														local numships = SobGroup_SplitGroupReference("SingleDockToOwnTrader_SOB", "trader"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("trader"..playerIndex))
														if numships > 1 then
															local counter = random_pseudo(0,numships-1)
															if SobGroup_IsDoingAbility("splitcontainers"..i, AB_Dock) == 0 then
																SobGroup_DockSobGroup_Smart("splitcontainers"..i, "SingleDockToOwnTrader_SOB"..counter)
																randomdock = 1
															end
														end
														if randomdock == 0 then
															SobGroup_DockSobGroup_Smart("splitcontainers"..i, "trader"..playerIndex)
														end
													end	
                        else				
                          RUaggiuntiva[playerIndexList] = RUaggiuntiva[playerIndexList] + 18												
											  end													    											
											elseif SobGroup_IsDoingAbility("splitcontainers"..i, abilityList[4]) == 1 then
											elseif SobGroup_IsDoingAbility("splitcontainers"..i, abilityList[6]) == 1 then 
											elseif SobGroup_IsDoingAbility("splitcontainers"..i, abilityList[1]) == 1 then
											elseif SobGroup_IsDoingAbility("splitcontainers"..i, abilityList[12]) == 1 then                         									
											else            	  
												
												if SobGroup_FillProximitySobGroup ("temp", "traderallies"..playerIndex, "splitcontainers"..i, 1000) == 1 then	            	  
													local randomdock = 0
													local numships = SobGroup_SplitGroupReference("SingleDockAlliedTrader_SOB", "traderallies"..playerIndex, "allies"..playerIndex, SobGroup_Count("traderallies"..playerIndex))
													if numships > 1 then
														local counter = random_pseudo(0,numships-1)
														local z = SobGroup_OwnedBy("SingleDockAlliedTrader_SOB"..counter)
														if AreAllied(playerIndex, z) == 1 and z ~= SobGroup_OwnedBy("temp") then
															if SobGroup_IsDoingAbility("splitcontainers"..i, AB_Dock) == 0 then
																SobGroup_DockSobGroup_Smart("splitcontainers"..i, "SingleDockAlliedTrader_SOB"..counter)
																randomdock = 1
															end
														end
													end
													if randomdock == 0 then
														for z = 0,(Universe_PlayerCount()-1),1 do
															if Player_IsAlive(z) == 1 then
																if AreAllied(playerIndex, z) == 1 and z ~= SobGroup_OwnedBy("temp") then
																	SobGroup_DockSobGroup_Smart("splitcontainers"..i, "trader"..z)
																end
															end
														end
													end
													if casualizzatore[2] == 1 then   
														break
													end
												end                       	  
												
											end 						                
										end           
									end   
										
								end                        
							end 				      	        
						end 
					end	
	      else		--In some cases, it seems that this function doesn't kill all the containers because the they are docked to allied ships. As a result, the owner still has ships with build queue and remains alive even if all the other ships are destroyed, which means the owner won't die until the allied ships are destroyed
	        SobGroup_TakeDamage("hgn_container"..playerIndex, 1)
					SobGroup_TakeDamage("vgr_container"..playerIndex, 1)
	        SobGroup_TakeDamage("kad_container"..playerIndex, 1)
					SobGroup_TakeDamage("rad_container"..playerIndex, 1)
	      end       
	      if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<35) or year>0) then
          UI_SetTextLabelText("UnitCapInfoPopup", "lbltrade", ""..tradeList[playerIndexList]);    	                     
        end   	    
      end   
    end
    playerIndex = playerIndex + 1 
	end 		
end        

