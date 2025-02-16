function vipermissile()
	--print("vipermissile -- Start")
    
	UI_SetElementVisible("New1", "tube1", 0)
  UI_SetElementVisible("New1", "tube2", 0)
  UI_SetElementVisible("New1", "tube3", 0)
	
	---per costruzione nuclear tube se player ha + di 3000 ry costruisce modulo requisito in supporter   
	for p = 0,Universe_PlayerCount()-1,1 do  
	  if Player_IsAlive(p) == 1 then
      if Player_HasShipWithBuildQueue(p) == 1 then              
				if SobGroup_Count("vgr_mothership"..p) > 0 and
					 SobGroup_Count("supporter"..p) > 0 then   
					if Player_GetRU(p) >= 3100 then	    
						if SobGroup_GetHardPointHealth("supporter"..p, "3000ru") == 0 then   
							SobGroup_CreateSubSystem("supporter"..p, "3000ru")            
						end 
					else   	    
						SobGroup_SetHardPointHealth("supporter"..p, "3000ru", 0)  	        
					end
				end  			
				
			end
		end		  
	end  		          
  
---tutti i missili 
  if nnb > 0 then    
    local ExpIndex = 0
  	while (SobGroup_Empty("NuclearBombExpBag"..ExpIndex) == 0) and (ExpIndex ~= 2) do
	    ExpIndex = ExpIndex + 1    
	  end     
	  for i = 0,nnb-1,1 do
	    if SobGroup_Empty("splitnuclearbombs"..i) == 0 then	   
	      SobGroup_SetInvulnerability("splitnuclearbombs"..i, 0)
	      if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then   
		      if SobGroup_PlayerIsInSensorRange("splitnuclearbombs"..i, Universe_CurrentPlayer()) == 1 then	
	          Ping_LabelVisible(Ping_AddSobGroup("", "juggernaught", "splitnuclearbombs"..i), 1)                                    
	        end      
					
			--buttons interface	
					if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then
						if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_nucleartube1,hgn_nucleartube2,hgn_nucleartube3,hgn_nuclearbomb") == 1 and SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then
							UI_SetElementVisible("New1", "tube1", 1)	 
							UI_FlashButton("New1", "tube1", 1)     
						end	 
						if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_torpedotube1,hgn_torpedotube2,hgn_torpedotube3,hgn_viper,hgn_viper_short,hgn_viper_short1,hgn_viper_ws,hgn_viper_ws1,hgn_minermissile,hgn_minermissile1,vgr_cruse,vgr_cruse1,vgr_minermissile,kad_minermissile,kad_jihadi,kpr_lightgranule") == 1 and SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then
							UI_SetElementVisible("New1", "tube2", 1)	
							UI_FlashButton("New1", "tube2", 1)      
						end	   
						if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_tangomine,hgn_tangomine_ws,hgn_tangomine_ws1,vgr_boa") == 1 and SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then
							UI_SetElementVisible("New1", "tube3", 1)
							UI_FlashButton("New1", "tube3", 1)	      
						end	   
					end
	    
	    --all
					if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_viper,hgn_viper_ws,hgn_viper_ws1,kad_jihadi") == 1 then  
					  missileattack("splitnuclearbombs"..i,0.003,55000)
					elseif SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_viper_short, hgn_viper_short1, hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3, vgr_cruse1") == 1 then  
					  missileattack("splitnuclearbombs"..i,0.008,25000)
					elseif SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_tangomine,hgn_tangomine_ws,hgn_tangomine_ws1,vgr_boa") == 1 then               
					  missileattack("splitnuclearbombs"..i,0.014,17500)					
					elseif SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_torpedotube1, hgn_torpedotube2, hgn_torpedotube3, vgr_cruse, kpr_lightgranule") == 1 then      
					  missileattack("splitnuclearbombs"..i,0.0014,100000)	 					           	
					  
			--miner missile
					elseif SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_minermissile, hgn_minermissile1,vgr_minermissile,kad_minermissile") == 1 then           
	          SobGroup_TakeDamage("splitnuclearbombs"..i, 0.008) 
	          if SobGroup_IsDoingAbility("splitnuclearbombs"..i, AB_Attack) == 0 then
		          SobGroup_Clear("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i))
		          distance = 1000
		          while SobGroup_Count("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i)) == 0 and distance < 20000 do
					      if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i), "AsteroidSmasher", "splitnuclearbombs"..i, distance) == 1 then						      	
					        SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "temp"..SobGroup_OwnedBy("splitnuclearbombs"..i))
					        break
					      end
					      distance = distance + 1000
					    end					    	
					    if distance >= 20000 then
					      SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "AsteroidSmasher")					    	    
					    end	 		    			      
					  end 		   			
	        
	    --heavy nuclear    
	        elseif SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_nuclearbomb") == 1 then              
	          SobGroup_TakeDamage("splitnuclearbombs"..i, 0.0009)
	          if SobGroup_IsDoingAbility("splitnuclearbombs"..i, AB_Attack) == 0 then
		          SobGroup_Clear("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i))
		          distance = 1000
		          while SobGroup_Count("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i)) == 0 and distance < 150000 do
					      if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i), "bigcapitalenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, distance) == 1 then		
                  if SobGroup_IsDoingAbility("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i), abilityList[28]) == 0 then								
										SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "temp"..SobGroup_OwnedBy("splitnuclearbombs"..i))
										break	
									else
                    SobGroup_Clear("temp"..SobGroup_OwnedBy("splitnuclearbombs"..i)) 									
									end	
					      end      
					      distance = distance + 1000
					    end	
					    if distance >= 150000 then
					      SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "bigcapitalenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i))					    	    
					    end		   					    				    			      
					  end 		
					           
	        end
	        
	        if SobGroup_IsDoingAbility("splitnuclearbombs"..i, AB_Attack) == 1 then			
	          if SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, 750) == 1 then         
	            SobGroup_TakeDamage("splitnuclearbombs"..i, 0.5)
	          elseif SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, 1500) == 1 then         
	            SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "temp")					
	          elseif SobGroup_FillProximitySobGroup("temp", "commandfortressenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, 1000) == 1 then         
	             SobGroup_TakeDamage("splitnuclearbombs"..i, 0.5)                        
	          elseif SobGroup_FillProximitySobGroup("temp", "commandfortressenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, 2000) == 1 then          
	            	SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "temp")								
	          elseif SobGroup_FillProximitySobGroup("temp", "minetargetenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, 750) == 1 then	            
	              SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "temp")         
	          elseif SobGroup_FillProximitySobGroup("temp", "bigcapitalenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i), "splitnuclearbombs"..i, 1500) == 1 then	                
	              SobGroup_Kamikaze_Smart("splitnuclearbombs"..i, "temp")  	            
	          end     	          
	          SobGroup_Clear("temp")         
	          
	        else               
            if SobGroup_Empty("bigcapitalenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i)) == 0 then	              
            elseif SobGroup_Empty("smallcapitalenemies"..SobGroup_OwnedBy("splitnuclearbombs"..i)) == 0 then 	              
            elseif SobGroup_Empty("AsteroidSmasher") == 0 then               						
            else
              SobGroup_TakeDamage("splitnuclearbombs"..i, 1)   
            end	                           	              	
	      	end      
	      	
	      	if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3, hgn_nuclearbomb") == 1 then	
		      	if SobGroup_HealthPercentage("splitnuclearbombs"..i) <= 0 and SobGroup_Empty("splitnuclearbombs"..i) == 0 then             
				      SobGroup_SobGroupAdd("NuclearBombExpBag"..ExpIndex, "splitnuclearbombs"..i)      
				      SobGroup_Clear("splitnuclearbombs"..i)                   
				    end   
				    if SobGroup_Empty("NuclearBombExpBag"..ExpIndex) == 0 then
					    Rule_AddInterval("NBexplosiondamageexp"..ExpIndex, 0.24)       
					  end	
					end 
				end	     
	    end
	  end
	end
	--print("vipermissile -- End")
end  

function missileattack(ship,autodamage,maxdistance)
	SobGroup_TakeDamage(ship, autodamage)
  if SobGroup_IsDoingAbility(ship, AB_Attack) == 0 then
    SobGroup_Clear("temp"..SobGroup_OwnedBy(ship))    
    distance = 1000
    while SobGroup_Count("temp"..SobGroup_OwnedBy(ship)) == 0 and distance < maxdistance do
      if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "minetargetenemies"..SobGroup_OwnedBy(ship), ship, distance) == 1 then		
        if SobGroup_IsDoingAbility("temp"..SobGroup_OwnedBy(ship), abilityList[28]) == 0 then								
					SobGroup_Kamikaze_Smart(ship, "temp"..SobGroup_OwnedBy(ship))
					break
				else
          SobGroup_Clear("temp"..SobGroup_OwnedBy(ship))				
				end					        
      end      
      distance = distance + 1000
    end			
    if distance >= maxdistance then
      SobGroup_Kamikaze_Smart(ship, "minetargetenemies"..SobGroup_OwnedBy(ship))					    	    
    end	    			      
  end  
end					  

function NBexplosiondamageexp0()  
  SetInvulnerabilityDockedShips()  
  if SobGroup_Count("NuclearBombExpBag0") == 1 then         
	  playerIndex = SobGroup_OwnedBy("NuclearBombExpBag0")	  
	  Type = 1
	  if SobGroup_AreAnyOfTheseTypes("NuclearBombExpBag0", "hgn_nuclearbomb") == 0 or SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("NuclearBombExpBag0"), "NuclearBombExpBag0", 750) == 1 then	  
	    Type = 0.425
	  end	  
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "NBDetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "NBDetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "NBDetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "NBDetonationRange2" ) == 1 then
	    DetonationRange = 1.8         
	  elseif Player_HasResearch(playerIndex, "NBDetonationRange1" ) == 1 then
	    DetonationRange = 1.4  
	  elseif Player_HasResearch(playerIndex, "NBDetonationRange" ) == 1 then
	    DetonationRange = 1.2
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 192000 * DetonationPower * Type, 750 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 96000 * DetonationPower * Type, 1500 * DetonationRange * Type)              
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 48000 * DetonationPower * Type, 2250 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 24000 * DetonationPower * Type, 3000 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 12000 * DetonationPower * Type, 3750 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 6000 * DetonationPower * Type, 4500 * DetonationRange * Type) 
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 3000 * DetonationPower * Type, 5250 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 1500 * DetonationPower * Type, 6000 * DetonationRange * Type)		
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 750 * DetonationPower * Type, 6750 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 375 * DetonationPower * Type, 7500 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 175 * DetonationPower * Type, 8250 * DetonationRange * Type)	 	       	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "NuclearBombExpBag0", SobGroup_Count("NuclearBombExpBag0"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
      Type = 1
		  if SobGroup_AreAnyOfTheseTypes("temp"..i, "hgn_nuclearbomb") == 0 or SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("temp"..i), "temp"..i, 750) == 1 then	  
		    Type = 0.425
		  end	  
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "NBDetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "NBDetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "NBDetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "NBDetonationRange2" ) == 1 then
		    DetonationRange = 1.8         
		  elseif Player_HasResearch(playerIndex, "NBDetonationRange1" ) == 1 then
		    DetonationRange = 1.4  
		  elseif Player_HasResearch(playerIndex, "NBDetonationRange" ) == 1 then
		    DetonationRange = 1.2
		  end                                
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 192000 * DetonationPower * Type, 750 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 96000 * DetonationPower * Type, 1500 * DetonationRange * Type)              
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 48000 * DetonationPower * Type, 2250 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 24000 * DetonationPower * Type, 3000 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 12000 * DetonationPower * Type, 3750 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 6000 * DetonationPower * Type, 4500 * DetonationRange * Type) 
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 3000 * DetonationPower * Type, 5250 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 1500 * DetonationPower * Type, 6000 * DetonationRange * Type)		
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 750 * DetonationPower * Type, 6750 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 375 * DetonationPower * Type, 7500 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag0", playerDamaged, 175 * DetonationPower * Type, 8250 * DetonationRange * Type)	 		       	 	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("NuclearBombExpBag0")      
  Rule_Remove("NBexplosiondamageexp0")  
end 

function NBexplosiondamageexp1()    
  SetInvulnerabilityDockedShips()
  if SobGroup_Count("NuclearBombExpBag1") == 1 then   
    Type = 1
	  if SobGroup_AreAnyOfTheseTypes("NuclearBombExpBag1", "hgn_nuclearbomb") == 0 or SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("NuclearBombExpBag1"), "NuclearBombExpBag1", 750) == 1 then	  
	    Type = 0.425
	  end	        
	  playerIndex = SobGroup_OwnedBy("NuclearBombExpBag1")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "NBDetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "NBDetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "NBDetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "NBDetonationRange2" ) == 1 then
	    DetonationRange = 1.8         
	  elseif Player_HasResearch(playerIndex, "NBDetonationRange1" ) == 1 then
	    DetonationRange = 1.4  
	  elseif Player_HasResearch(playerIndex, "NBDetonationRange" ) == 1 then
	    DetonationRange = 1.2
	  end  
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 192000 * DetonationPower * Type, 750 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 96000 * DetonationPower * Type, 1500 * DetonationRange * Type)              
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 48000 * DetonationPower * Type, 2250 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 24000 * DetonationPower * Type, 3000 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 12000 * DetonationPower * Type, 3750 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 6000 * DetonationPower * Type, 4500 * DetonationRange * Type) 
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 3000 * DetonationPower * Type, 5250 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 1500 * DetonationPower * Type, 6000 * DetonationRange * Type)		
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 750 * DetonationPower * Type, 6750 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 375 * DetonationPower * Type, 7500 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 175 * DetonationPower * Type, 8250 * DetonationRange * Type)	 	       	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "NuclearBombExpBag1", SobGroup_Count("NuclearBombExpBag1"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
      Type = 1
		  if SobGroup_AreAnyOfTheseTypes("temp"..i, "hgn_nuclearbomb") == 0 or SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("temp"..i), "temp"..i, 750) == 1 then	  
		    Type = 0.425
		  end	 
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "NBDetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "NBDetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "NBDetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "NBDetonationRange2" ) == 1 then
		    DetonationRange = 1.8         
		  elseif Player_HasResearch(playerIndex, "NBDetonationRange1" ) == 1 then
		    DetonationRange = 1.4  
		  elseif Player_HasResearch(playerIndex, "NBDetonationRange" ) == 1 then
		    DetonationRange = 1.2
		  end                                       
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 192000 * DetonationPower * Type, 750 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 96000 * DetonationPower * Type, 1500 * DetonationRange * Type)              
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 48000 * DetonationPower * Type, 2250 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 24000 * DetonationPower * Type, 3000 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 12000 * DetonationPower * Type, 3750 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 6000 * DetonationPower * Type, 4500 * DetonationRange * Type) 
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 3000 * DetonationPower * Type, 5250 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 1500 * DetonationPower * Type, 6000 * DetonationRange * Type)		
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 750 * DetonationPower * Type, 6750 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 375 * DetonationPower * Type, 7500 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag1", playerDamaged, 175 * DetonationPower * Type, 8250 * DetonationRange * Type)	 		       	 	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("NuclearBombExpBag1")      
  Rule_Remove("NBexplosiondamageexp1")  
end 

function NBexplosiondamageexp2()    
  SetInvulnerabilityDockedShips()
  if SobGroup_Count("NuclearBombExpBag2") == 1 then  
    Type = 1
	  if SobGroup_AreAnyOfTheseTypes("NuclearBombExpBag2", "hgn_nuclearbomb") == 0 or SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("NuclearBombExpBag2"), "NuclearBombExpBag2", 750) == 1 then	  
	    Type = 0.425
	  end	         
	  playerIndex = SobGroup_OwnedBy("NuclearBombExpBag2")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "NBDetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "NBDetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "NBDetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "NBDetonationRange2" ) == 1 then
	    DetonationRange = 1.8         
	  elseif Player_HasResearch(playerIndex, "NBDetonationRange1" ) == 1 then
	    DetonationRange = 1.4  
	  elseif Player_HasResearch(playerIndex, "NBDetonationRange" ) == 1 then
	    DetonationRange = 1.2
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 192000 * DetonationPower * Type, 750 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 96000 * DetonationPower * Type, 1500 * DetonationRange * Type)              
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 48000 * DetonationPower * Type, 2250 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 24000 * DetonationPower * Type, 3000 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 12000 * DetonationPower * Type, 3750 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 6000 * DetonationPower * Type, 4500 * DetonationRange * Type) 
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 3000 * DetonationPower * Type, 5250 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 1500 * DetonationPower * Type, 6000 * DetonationRange * Type)		
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 750 * DetonationPower * Type, 6750 * DetonationRange * Type)	
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 375 * DetonationPower * Type, 7500 * DetonationRange * Type)
	    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 175 * DetonationPower * Type, 8250 * DetonationRange * Type)	 	       	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "NuclearBombExpBag2", SobGroup_Count("NuclearBombExpBag2"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
      Type = 1
		  if SobGroup_AreAnyOfTheseTypes("temp"..i, "hgn_nuclearbomb") == 0 or SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..SobGroup_OwnedBy("temp"..i), "temp"..i, 750) == 1 then	  
		    Type = 0.425
		  end	 
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "NBDetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "NBDetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "NBDetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "NBDetonationRange2" ) == 1 then
		    DetonationRange = 1.8         
		  elseif Player_HasResearch(playerIndex, "NBDetonationRange1" ) == 1 then
		    DetonationRange = 1.4  
		  elseif Player_HasResearch(playerIndex, "NBDetonationRange" ) == 1 then
		    DetonationRange = 1.2
		  end                                
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 192000 * DetonationPower * Type, 750 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 96000 * DetonationPower * Type, 1500 * DetonationRange * Type)              
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 48000 * DetonationPower * Type, 2250 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 24000 * DetonationPower * Type, 3000 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 12000 * DetonationPower * Type, 3750 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 6000 * DetonationPower * Type, 4500 * DetonationRange * Type) 
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 3000 * DetonationPower * Type, 5250 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 1500 * DetonationPower * Type, 6000 * DetonationRange * Type)		
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 750 * DetonationPower * Type, 6750 * DetonationRange * Type)	
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 375 * DetonationPower * Type, 7500 * DetonationRange * Type)
		    SobGroup_DoDamageProximitySobGroup("NuclearBombExpBag2", playerDamaged, 175 * DetonationPower * Type, 8250 * DetonationRange * Type)	 		       	 	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("NuclearBombExpBag2")      
  Rule_Remove("NBexplosiondamageexp2")  
end 

--Function for Explosive Trap from PTV
cruisemissiles = {num = 0, combos = {} }

function findExploTrapMissiles(playerIndex)
	Update_AllShips()
	cleanCruiseMissileTable()
	SobGroup_Create("Vaygr_Cruise_SOB")
	local i = 0
	local shiptype = ""
	SobGroup_Create("Explo_SOB")
	Player_FillShipsByType("Explo_SOB", playerIndex, "rad_explotrap")
	local nummissiles = SobGroup_Count("Explo_SOB")
	SobGroup_SplitGroupReference("SingleExplo_SOB", "Explo_SOB", "AllShips", nummissiles )
	for counter = 0, nummissiles -1, 1 do
		if SobGroup_Empty("SingleExplo_SOB"..counter) == 0 then
			if (SobGroup_GroupInGroup("SingleExplo_SOB"..counter, "Vaygr_Cruise_SOB") ~= 1) then
				--print("found cruise missile to add to group")
				local currentcombo = {}
				SobGroup_SobGroupAdd("Vaygr_Cruise_SOB", "SingleExplo_SOB"..counter)
				-- fill all ships affected by sleep the first time - actually, this is really just a temp value to keep a SOB there and reserved
				SobGroup_Create("IsACruiseMissile".. cruisemissiles.num)
				SobGroup_SobGroupAdd("IsACruiseMissile".. cruisemissiles.num, "SingleExplo_SOB"..counter)
				currentcombo[0]  = 0 -- is marked for deletion
				currentcombo[1]  = 0.5 -- speed multiplier while targeting
				currentcombo[2]  = 2500 -- Rad1
				currentcombo[3]  = 100 -- dmg2 (real number)
				currentcombo[4]  = 2500 -- Rad2
				currentcombo[5]  = 0.3 -- dmg1 (procentual)
				currentcombo[6]  = "IsACruiseMissile".. cruisemissiles.num -- ships ships that are cruise missile
				currentcombo[7] = playerIndex -- player index of missile
				currentcombo[8] = 0 -- have we detonated (for FX)?
				currentcombo[9] = 2000 -- prox range
				cruisemissiles.combos[cruisemissiles.num] = currentcombo
				cruisemissiles.num = cruisemissiles.num + 1
			end
		end
	end
end

function destroyCruiseMissiles(playerIndex)
	Update_AllShips()
	for x = 0, cruisemissiles.num -1, 1 do
		if (cruisemissiles.combos[x][0] == 0) then
			if (SobGroup_Count(cruisemissiles.combos[x][6]) > 0) then
				--print("processing missile: " .. x)
				local istargeting = SobGroup_IsDoingAbility(cruisemissiles.combos[x][6], AB_Attack)
				--print ("Is Targeting: " .. istargeting)
				if (istargeting == 1) then
					SobGroup_SetMaxSpeedMultiplier(cruisemissiles.combos[x][6], cruisemissiles.combos[x][1])
					local counter = 0;
					while (counter < Universe_PlayerCount()) do
						if (AreAllied(counter, cruisemissiles.combos[x][7]) ~= 1) then
							SobGroup_Create("PossibleExplosion_SOB")
							Player_FillProximitySobGroup("PossibleExplosion_SOB", counter, cruisemissiles.combos[x][6], cruisemissiles.combos[x][9])
							if (SobGroup_Count("PossibleExplosion_SOB") > 0) then
								if (cruisemissiles.combos[x][8] == 0) then
									-- --print("detonating cruise missile")
									FX_StartEvent(cruisemissiles.combos[x][6], "Weapon_AutoGun" )
									--EFP
									if Player_HasResearch(playerIndex, "IEDEFP") == 1 then
										RemoveSubsystemOnShip(cruisemissiles.combos[x][6], "block1")
									end
									SobGroup_SetHealth(cruisemissiles.combos[x][6], 0)
									cruisemissiles.combos[x][8] = 1
								end
							end
						end
						if (cruisemissiles.combos[x][8] == 1) then
							local counter_2 = 0;
							while (counter_2 < Universe_PlayerCount()) do
								local damagetweak = 1
								if (Player_HasResearch(playerIndex, "MassDestruction") == 1 ) then 
									damagetweak = 1.25
								end
								--print("damaging player: " .. counter_2)
								-- pointbased damage to ships farther away
								SobGroup_DoDamageProximitySobGroup(cruisemissiles.combos[x][6], counter_2, cruisemissiles.combos[x][3] * damagetweak, cruisemissiles.combos[x][4])
								SobGroup_Clear("PossibleExplosion_SOB")
								-- nearby ships are given 50% damage
								Player_FillProximitySobGroup("PossibleExplosion_SOB", counter_2, cruisemissiles.combos[x][6], cruisemissiles.combos[x][2])
								SobGroup_TakeDamage("PossibleExplosion_SOB", cruisemissiles.combos[x][5] * damagetweak)
								SobGroup_Clear("PossibleExplosion_SOB")
								counter_2 = counter_2 + 1
							end
							-- makes sure we don't do dmg for this thing again
							cruisemissiles.combos[x][8] = 2
						end
						counter = counter + 1
					end
				else
					SobGroup_SetMaxSpeedMultiplier(cruisemissiles.combos[x][6], 1)
				end			
			else
			cruisemissiles.combos[x][0] = 1
			SobGroup_Clear(cruisemissiles.combos[x][6])
			end
		end
	end
end

-- cleans Cruise Missile Table 
function cleanCruiseMissileTable()
	local num = cruisemissiles.num
	if num > 0 then
		for x = cruisemissiles.num - 1, 0, -1 do
			if (cruisemissiles.combos[x][0] == 1) then
				-- -- print("Clearing Drone table entry: " .. x)
				for y = x, cruisemissiles.num - 2, 1 do
					cruisemissiles.combos[y] = cruisemissiles.combos[y + 1]
				end
				cruisemissiles.combos[cruisemissiles.num - 1] = nil
				num = num - 1
			end
		end
		cruisemissiles.num = num
	end
end