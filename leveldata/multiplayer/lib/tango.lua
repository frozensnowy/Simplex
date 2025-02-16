function tangomine()  
  local playerIndex = 0                       
  local playerCount = Universe_PlayerCount()        
  while playerIndex < playerCount do       
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then           
        if Player_GetRace(playerIndex) == Race_Hiigaran then            
          if SobGroup_Empty("hgn_mothership"..playerIndex) == 0 then            
	          if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine") > 0 then  
	          
---distrugge mines in caso di agganciamento/sganciamento CS<->MS o hyperspazio		            		              	            
	            if SobGroup_IsDoingAbility("hgn_mothership"..playerIndex, abilityList[9]) == 1 or SobGroup_IsDoingAbility("hgn_mothership"..playerIndex, abilityList[5]) == 1 or SobGroup_IsDoingAbility("hgn_mothership"..playerIndex, abilityList[24]) == 1 then 
	              SobGroup_SetHealth("hgn_tangomine"..playerIndex, 0) 
	            end  				          
	          	               	               
		          if SobGroup_FillProximitySobGroup("temp1", "minetargetenemies"..playerIndex, "hgn_mothership"..playerIndex, 6000) == 1 then  	             
		            for i = 0,(ntm[playerIndex + 1]-1),1 do			          
			           	if SobGroup_Empty("splittangos"..playerIndex .. tostring(i)) == 0	then 		           			           	 
				--è passive		           	           
			              if SobGroup_GetTactics("splittangos"..playerIndex .. tostring(i)) == 2 then			                
			                SobGroup_ParadeSobGroup("splittangos"..playerIndex .. tostring(i), "hgn_mothership"..playerIndex, 0)  			               		   
			                             
			  --è lontana da Mothership              
			              elseif SobGroup_FillProximitySobGroup("temp", "hgn_mothership"..playerIndex, "splittangos"..playerIndex .. tostring(i), 6750) == 0 then		                
			                SobGroup_ParadeSobGroup("splittangos"..playerIndex .. tostring(i), "hgn_mothership"..playerIndex, 0)   
			                SobGroup_Clear("temp")		
			                                
			  --sta attaccando              
			              elseif SobGroup_IsDoingAbility("splittangos"..playerIndex .. tostring(i), abilityList[2]) == 1 then		  
			              
			                if SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..playerIndex, "splittangos"..playerIndex .. tostring(i), 425) == 1 then         
						            SobGroup_SetHealth("splittangos"..playerIndex .. tostring(i), 0)
						          elseif SobGroup_FillProximitySobGroup("temp", "massshieldenemies"..playerIndex, "splittangos"..playerIndex .. tostring(i), 1250) == 1 then         
						            SobGroup_Kamikaze("splittangos"..playerIndex .. tostring(i), "temp") 
						          elseif SobGroup_FillProximitySobGroup("temp", "commandfortressenemies"..playerIndex, "splittangos"..playerIndex .. tostring(i), 1250) == 1 then         
						            SobGroup_Kamikaze("splittangos"..playerIndex .. tostring(i), "temp")                              						                            
						          elseif SobGroup_FillProximitySobGroup("temp", "minetargetenemies"..playerIndex, "splittangos"..playerIndex .. tostring(i), 425) == 1 then         
						            SobGroup_Kamikaze("splittangos"..playerIndex .. tostring(i), "temp")         
						          elseif SobGroup_GetSpeed("splittangos"..playerIndex .. tostring(i)) <= 0.25 then
		                    SobGroup_SetHealth("splittangos"..playerIndex .. tostring(i), 0)      
						          end
						          SobGroup_Clear("temp")					                			    
									    								       
				--parade					                  
			              elseif SobGroup_IsDoingAbility("splittangos"..playerIndex .. tostring(i), abilityList[12]) == 1 then		   
			                           
			  --stop              
			              elseif SobGroup_IsDoingAbility("splittangos"..playerIndex .. tostring(i), abilityList[4]) == 1 then  
			                SobGroup_ParadeSobGroup("splittangos"..playerIndex .. tostring(i), "hgn_mothership"..playerIndex, 0)  			              
        
        --ordina attacco override retaliation range		
                    else 
                      SobGroup_Attack(playerIndex, "splittangos"..playerIndex .. tostring(i), "temp1")			                          
				            end 
				            	
			            end
			          end                              
		          else  		                   
		            SobGroup_ParadeSobGroup("hgn_tangomine"..playerIndex, "hgn_mothership"..playerIndex, 0)  	            
		          end  		               
		        end
		      else
		        SobGroup_SetHealth("hgn_tangomine"..playerIndex, 0)
		      end                
        end                         
      end
    end
    playerIndex = playerIndex + 1
  end     
end  