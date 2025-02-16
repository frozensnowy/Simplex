function SobGroup_EvacuateShipsAroundExplodingShip(exploding_ship, escape_radius)		--can be called from anywhere
	--print("SobGroup_EvacuateShipsAroundExplodingShip - Start, for "..exploding_ship)
	SobGroup_Create("SOB_AIRemovedDuringEscape")
	if SobGroup_HealthPercentage(exploding_ship) <= 0 then
		local time_stamp = Universe_GameTime()
		local random_stamp = random_pseudo(0,10000)
		local escape_radius_multiplier = 1.2  --let the escaping ships run further than the blast radius so they won't slow down near the boundary of the blast zone
		SobGroup_Create("ShipsToEscapeExplosion_SOB")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "all_fighters")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "all_corvettes")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "frigates")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "destroyers")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "platforms")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "resourcecollectors")
		SobGroup_SobGroupAdd("ShipsToEscapeExplosion_SOB", "mobilerefineries")
		if SobGroup_FillProximitySobGroupExceptSelf("AllShipsToEscape_SOB", "ShipsToEscapeExplosion_SOB", exploding_ship, escape_radius) == 1 then
			if SobGroup_CanDoAbility("AllShipsToEscape_SOB", AB_Move) == 1 then
				local explosion_pos = SobGroup_GetPosition(exploding_ship)
				local numships = SobGroup_SplitGroupReference("SingleShipToEscape_SOB", "AllShipsToEscape_SOB", exploding_ship, SobGroup_Count("AllShipsToEscape_SOB"), 0)
				for counter = 0, numships - 1, 1 do
					local coward = "SingleShipToEscape_SOB"..counter
					local playerIndex = SobGroup_OwnedBy(coward)
					if SobGroup_CanDoAbility(coward, AB_Move) == 1 and 
					SobGroup_GetTactics(coward) ~= 0 and 
					SobGroup_AreAnyOfTheseTypes(coward, "vgr_hyperspace_platform") == 0 and 
					SobGroup_HealthPercentage(coward) > 0 and 
					SobGroup_IsDocked(coward) == 0 and 
					SobGroup_AreAllInRealSpace(coward) == 1 and 
					SobGroup_IsDoingAbility(coward, AB_Dock) == 0 and 
					SobGroup_IsDoingAbility(coward, AB_Capture) == 0 and 
					--SobGroup_IsDoingAbility(coward, AB_Move) == 0 and 	--ships that are already moving won't perform the escape maneuver
					SobGroup_IsDoingAbility(coward, AB_Repair) == 0 then
						local current_distance = SobGroup_GetDistanceToSobGroup(coward, exploding_ship)
						local escape_distance_ratio = escape_radius*escape_radius_multiplier/(current_distance+0.1)
						if escape_distance_ratio > 1 then
							local coward_pos = SobGroup_GetPosition(coward)
							local target_pos = coward_pos
							local relative_pos = coward_pos
							for t=1,3,1 do
								relative_pos[t] = coward_pos[t]-explosion_pos[t]
								target_pos[t] = explosion_pos[t]+relative_pos[t]*escape_distance_ratio
							end
							local volume_name = "VOL_EscapeTarget"..counter.."_"..random_stamp.."_"..time_stamp
							if CPU_Exist_Smart(playerIndex) == 1 then		--remove AI to allow forced escape
								CPU_RemoveSobGroup(playerIndex, coward)
								SobGroup_SobGroupAdd("SOB_AIRemovedDuringEscape", coward)
							end
							Volume_AddSphere(volume_name, target_pos, 100)
							SobGroup_Move(playerIndex, coward, volume_name)
							Volume_Delete(volume_name)
						end
					end
				end
			end
		end
	end
	--print("SobGroup_EvacuateShipsAroundExplodingShip - End, for "..exploding_ship)
end

function AI_RestoreAIAfterEscape()		--called from RaceCheckSlow()
	SobGroup_Create("SOB_AIRemovedDuringEscape")
	if SobGroup_Empty("SOB_AIRemovedDuringEscape") == 0 then
		Update_AllShips()
		local numships = SobGroup_SplitGroupReference("SingleAIToRestore_SOB", "SOB_AIRemovedDuringEscape", "AllShips", SobGroup_Count("SOB_AIRemovedDuringEscape"), 0)
		for counter = 0, numships - 1, 1 do
			local coward = "SingleAIToRestore_SOB"..counter
			local playerIndex = SobGroup_OwnedBy(coward)
			if (sqrt(SobGroup_GetEquivalentSpeed(coward)) < 30 or SobGroup_IsDoingAbility(coward, AB_Move) == 0) and	--restore AI after the ship has stopped moving (escape maneuver finished)
			CPU_Exist_Smart(playerIndex) == 1 and
			SobGroup_SobGroupCompare(coward, "haxor_all_shipswithoutai") == 0 then
				CPU_AddSobGroup(playerIndex, coward)
				SobGroup_SobGroupSubstract("SOB_AIRemovedDuringEscape", coward)
			elseif CPU_Exist_Smart(playerIndex) == 0 then
				SobGroup_SobGroupSubstract("SOB_AIRemovedDuringEscape", coward)
			end
		end
	end
end

function SetInvulnerabilityDockedShips()
  --collectors
	if nrc > 0 then 
  	for i = 0,nrc - 1,1 do		 
  	  if SobGroup_Empty("splitresourcecollectors"..i) == 0 then
			  if SobGroup_IsDocked("splitresourcecollectors"..i) == 1 then	
					SobGroup_SetInvulnerability("splitresourcecollectors"..i, 1)
				end	
			end			
		end
	end	
  --jug
	if nj > 0 then 
  	for i = 0,nj - 1,1 do		 
  	  if SobGroup_Empty("splitjuggernaughts"..i) == 0 then
			  if SobGroup_IsDocked("splitjuggernaughts"..i) == 1 then	
					SobGroup_SetInvulnerability("splitjuggernaughts"..i, 1)
				end	
			end			
		end
	end	
	--platforms
	if np > 0 then 
  	for i = 0,np - 1,1 do		 
  	  if SobGroup_Empty("splitplatforms"..i) == 0 then
			  if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_artillerysentinel") == 1 then 
					if SobGroup_IsDocked("splitplatforms"..i) == 1 then	
						SobGroup_SetInvulnerability("splitplatforms"..i, 1)
					end	
				end
			end			
		end
	end	
	--ms
	if nms > 0 then 
  	for i = 0,nms - 1,1 do		 
  	  if SobGroup_Empty("splitmotherships"..i) == 0 then
			  if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then 
					if SobGroup_IsDocked("splitmotherships"..i) == 1 then	
						SobGroup_SetInvulnerability("splitmotherships"..i, 1)
					end	
				end
			end			
		end
	end	
	--rs
	if nrs > 0 then 
  	for i = 0,nrs - 1,1 do		 
  	  if SobGroup_Empty("splitresearchstations"..i) == 0 then
			  if SobGroup_IsDocked("splitresearchstations"..i) == 1 then	
					SobGroup_SetInvulnerability("splitresearchstations"..i, 1)
				end	
			end			
		end
	end
	--cs
	if ncs > 0 then 
  	for i = 0,ncs - 1,1 do		 
  	  if SobGroup_Empty("splitcrewstations"..i) == 0 then
			  if SobGroup_IsDocked("splitcrewstations"..i) == 1 then	
					SobGroup_SetInvulnerability("splitcrewstations"..i, 1)
				end	
			end			
		end
	end
	--ps
	if nps > 0 then 
  	for i = 0,nps - 1,1 do		 
  	  if SobGroup_Empty("splitpowerstations"..i) == 0 then
			  if SobGroup_IsDocked("splitpowerstations"..i) == 1 then	
					SobGroup_SetInvulnerability("splitpowerstations"..i, 1)
				end	
			end			
		end
	end
	--ws
	if nws > 0 then 
  	for i = 0,nws - 1,1 do		 
  	  if SobGroup_Empty("splitweaponstations"..i) == 0 then
			  if SobGroup_IsDocked("splitweaponstations"..i) == 1 then	
					SobGroup_SetInvulnerability("splitweaponstations"..i, 1)
				end	
			end			
		end
	end
	Rule_Remove("SetInvulnerabilityDockedShips")	
end	

--Mothership

function MSexplosiondamage()
  if nms > 0 then
	  local ExpIndex = 0   
	  while (SobGroup_Empty("MothershipExpBag"..ExpIndex) == 0) and (ExpIndex ~= 2) do
	    ExpIndex = ExpIndex + 1    
	  end  
	  for i = 0,nms-1,1 do                         
	    if SobGroup_HealthPercentage("splitmotherships"..i) <= 0 and SobGroup_Empty("splitmotherships"..i) == 0 then
				SobGroup_EvacuateShipsAroundExplodingShip("splitmotherships"..i, 5000)		--Evacuate nearby ships to avoid explosion damage
	      SobGroup_SobGroupAdd("MothershipExpBag"..ExpIndex, "splitmotherships"..i)      
	      SobGroup_Clear("splitmotherships"..i)                   
	    end     
	  end    
	  if SobGroup_Empty("MothershipExpBag"..ExpIndex) == 0 then	    
	    Rule_AddInterval("MSexplosiondamageexp"..ExpIndex, 13.46)       
	  end    
	end  
end 
function MSexplosiondamageexp0() 
  SetInvulnerabilityDockedShips()                 
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 64000, 500)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 32000, 1000)              
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 16000, 1500)	
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 8000, 2000)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 4000, 2500)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 2000, 3000) 
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 1000, 3500)	
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 400, 4000)		
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag0", playerDamaged, 200, 4500)	      		    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("MothershipExpBag0")      
  Rule_Remove("MSexplosiondamageexp0")  
end 
function MSexplosiondamageexp1()   
  SetInvulnerabilityDockedShips()                
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 64000, 500)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 32000, 1000)              
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 16000, 1500)	
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 8000, 2000)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 4000, 2500)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 2000, 3000) 
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 1000, 3500)	
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 400, 4000)		
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag1", playerDamaged, 200, 4500)	      		    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("MothershipExpBag1")      
  Rule_Remove("MSexplosiondamageexp1")  
end 
function MSexplosiondamageexp2()    
  SetInvulnerabilityDockedShips()               
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 64000, 500)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 32000, 1000)              
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 16000, 1500)	
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 8000, 2000)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 4000, 2500)
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 2000, 3000) 
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 1000, 3500)	
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 400, 4000)		
    SobGroup_DoDamageProximitySobGroup("MothershipExpBag2", playerDamaged, 200, 4500)	      		    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("MothershipExpBag2")      
  Rule_Remove("MSexplosiondamageexp2")  
end 

--Shipyard

function SYexplosiondamage()
  if nsy > 0 then
	  local ExpIndex = 0   
	  while (SobGroup_Empty("ShipyardExpBag"..ExpIndex) == 0) and (ExpIndex ~= 2) do
	    ExpIndex = ExpIndex + 1    
	  end  
	  for i = 0,nsy-1,1 do                                  
	    if SobGroup_HealthPercentage("splitshipyards"..i) <= 0 and SobGroup_Empty("splitshipyards"..i) == 0 then             
	      SobGroup_EvacuateShipsAroundExplodingShip("splitshipyards"..i, 5000)		--Evacuate nearby ships to avoid explosion damage
	      SobGroup_SobGroupAdd("ShipyardExpBag"..ExpIndex, "splitshipyards"..i)      
	      SobGroup_Clear("splitshipyards"..i)                   
	    end     
	  end    
	  if SobGroup_Empty("ShipyardExpBag"..ExpIndex) == 0 then
	    Rule_AddInterval("SYexplosiondamageexp"..ExpIndex, 15.43)       
	  end    
	end  
end 
function SYexplosiondamageexp0()   
  SetInvulnerabilityDockedShips()                
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 32000, 500)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 16000, 950)              
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 8000, 1400)	
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 4000, 1850)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 2000, 2300)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 1000, 2750) 
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 500, 3200)	
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 250, 3650)		
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag0", playerDamaged, 125, 4100)	      	    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("ShipyardExpBag0")      
  Rule_Remove("SYexplosiondamageexp0")  
end 
function SYexplosiondamageexp1() 
  SetInvulnerabilityDockedShips()                  
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 32000, 500)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 16000, 950)              
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 8000, 1400)	
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 4000, 1850)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 2000, 2300)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 1000, 2750) 
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 500, 3200)	
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 250, 3650)		
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag1", playerDamaged, 125, 4100)	      	    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("ShipyardExpBag1")      
  Rule_Remove("SYexplosiondamageexp1")  
end 
function SYexplosiondamageexp2()   
  SetInvulnerabilityDockedShips()                
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 32000, 500)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 16000, 950)              
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 8000, 1400)	
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 4000, 1850)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 2000, 2300)
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 1000, 2750) 
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 500, 3200)	
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 250, 3650)		
    SobGroup_DoDamageProximitySobGroup("ShipyardExpBag2", playerDamaged, 125, 4100)	      	    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("ShipyardExpBag2")      
  Rule_Remove("SYexplosiondamageexp2")  
end 

--Command Fortress

function CFexplosiondamage()
  if ncf > 0 then
	  local ExpIndex = 0   
	  while (SobGroup_Empty("CommandFortressExpBag"..ExpIndex) == 0) and (ExpIndex ~= 2) do
	    ExpIndex = ExpIndex + 1    
	  end  
	  for i = 0,ncf-1,1 do                           
	    if SobGroup_HealthPercentage("splitcommandfortresses"..i) <= 0 and SobGroup_Empty("splitcommandfortresses"..i) == 0 then             
	      SobGroup_EvacuateShipsAroundExplodingShip("splitcommandfortresses"..i, 7000)		--Evacuate nearby ships to avoid explosion damage
	      SobGroup_SobGroupAdd("CommandFortressExpBag"..ExpIndex, "splitcommandfortresses"..i)      
	      SobGroup_Clear("splitcommandfortresses"..i)                   
	    end     
	  end    
	  if SobGroup_Empty("CommandFortressExpBag"..ExpIndex) == 0 then
	    if SobGroup_AreAnyOfTheseTypes("CommandFortressExpBag"..ExpIndex, "hgn_battlestation") == 1 then
	      Rule_AddInterval("CFexplosiondamageexp"..ExpIndex, 33.31)
	    else
	    	Rule_AddInterval("CFexplosiondamageexp"..ExpIndex, 23.31)       
	    end	
	  end    
	end  
end 
function CFexplosiondamageexp0()  
  SetInvulnerabilityDockedShips()  
  damagemultiplier = 1
  if SobGroup_AreAnyOfTheseTypes("CommandFortressExpBag0", "hgn_battlestation") == 1 then
    damagemultiplier = 1.5
  else  	   
  end	               
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 64000, 500*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 32000, 1000*damagemultiplier)              
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 16000, 1500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 8000, 2000*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 4000, 2500*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 2000, 3000*damagemultiplier) 
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 1000, 3500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 500, 4000*damagemultiplier)		
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 250, 4500*damagemultiplier)	 
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag0", playerDamaged, 125, 5000*damagemultiplier)	     		    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("CommandFortressExpBag0")      
  Rule_Remove("CFexplosiondamageexp0")  
end 
function CFexplosiondamageexp1()       
  SetInvulnerabilityDockedShips()  
  damagemultiplier = 1
  if SobGroup_AreAnyOfTheseTypes("CommandFortressExpBag1", "hgn_battlestation") == 1 then
    damagemultiplier = 1.5
  else  	   
  end	                  
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 64000, 500*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 32000, 1000*damagemultiplier)              
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 16000, 1500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 8000, 2000*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 4000, 2500*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 2000, 3000*damagemultiplier) 
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 1000, 3500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 500, 4000*damagemultiplier)		
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 250, 4500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag1", playerDamaged, 125, 5000*damagemultiplier)	         		    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("CommandFortressExpBag1")      
  Rule_Remove("CFexplosiondamageexp1")  
end 
function CFexplosiondamageexp2()     
  SetInvulnerabilityDockedShips()   
  damagemultiplier = 1
  if SobGroup_AreAnyOfTheseTypes("CommandFortressExpBag2", "hgn_battlestation") == 1 then
    damagemultiplier = 1.5
  else  	   
  end	                   
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 64000, 500*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 32000, 1000*damagemultiplier)              
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 16000, 1500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 8000, 2000*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 4000, 2500*damagemultiplier)
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 2000, 3000*damagemultiplier) 
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 1000, 3500*damagemultiplier)	
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 500, 4000*damagemultiplier)		
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 250, 4500*damagemultiplier)	 
    SobGroup_DoDamageProximitySobGroup("CommandFortressExpBag2", playerDamaged, 125, 5000*damagemultiplier)	        		    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("CommandFortressExpBag2")      
  Rule_Remove("CFexplosiondamageexp2")  
end 

--Juggernaught

function JUpdateDetonation()
	local playerIndex = 0
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if (Player_IsAlive(playerIndex) == 1) then
      if (Player_HasShipWithBuildQueue(playerIndex) == 1) then
        if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_juggernaught") > 0 then
          if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
				    DetonationPower[playerIndexList] = 2.1      
				  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
				    DetonationPower[playerIndexList] = 1.5   
				  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
				    DetonationPower[playerIndexList] = 1.25 
				  end     
				  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
				    DetonationRange[playerIndexList] = 1.5         
				  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
				    DetonationRange[playerIndexList] = 1.3  
				  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
				    DetonationRange[playerIndexList] = 1.15 
				  end                    
        end           
      end
    end     
    playerIndex = playerIndex + 1
  end      
end
function Jexplosiondamage()
  if nj > 0 then
	  local ExpIndex = 0   
	  while (SobGroup_Empty("JuggernaughtExpBag"..ExpIndex) == 0) and (ExpIndex ~= 8) do
	    ExpIndex = ExpIndex + 1    
	  end  
	  for i = 0,nj-1,1 do                                             
	    if SobGroup_HealthPercentage("splitjuggernaughts"..i) <= 0 and SobGroup_Empty("splitjuggernaughts"..i) == 0 then             
	      SobGroup_EvacuateShipsAroundExplodingShip("splitjuggernaughts"..i, 7000)		--Evacuate nearby ships to avoid explosion damage
	      SobGroup_SobGroupAdd("JuggernaughtExpBag"..ExpIndex, "splitjuggernaughts"..i)      
	      SobGroup_Clear("splitjuggernaughts"..i)                   
	    end     
	  end    
	  if SobGroup_Empty("JuggernaughtExpBag"..ExpIndex) == 0 then
	    Rule_AddInterval("Jexplosiondamageexp"..ExpIndex, 4.55)       
	  end    
	end  
end 
function Jexplosiondamageexp0()  
  SetInvulnerabilityDockedShips()  
  if SobGroup_Count("JuggernaughtExpBag0") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag0")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag0", SobGroup_Count("JuggernaughtExpBag0"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                      
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag0", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag0")      
  Rule_Remove("Jexplosiondamageexp0")  
end 
function Jexplosiondamageexp1()    
  SetInvulnerabilityDockedShips()
  if SobGroup_Count("JuggernaughtExpBag1") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag1")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag1", SobGroup_Count("JuggernaughtExpBag1"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                  
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag1", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag1")      
  Rule_Remove("Jexplosiondamageexp1")  
end 
function Jexplosiondamageexp2()   
  SetInvulnerabilityDockedShips() 
  if SobGroup_Count("JuggernaughtExpBag2") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag2")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag2", SobGroup_Count("JuggernaughtExpBag2"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                        
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag2", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag2")      
  Rule_Remove("Jexplosiondamageexp2")  
end 
function Jexplosiondamageexp3()    
  SetInvulnerabilityDockedShips()
  if SobGroup_Count("JuggernaughtExpBag3") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag3")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag3", SobGroup_Count("JuggernaughtExpBag3"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                          
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag3", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag3")      
  Rule_Remove("Jexplosiondamageexp3")  
end 
function Jexplosiondamageexp4()    
  SetInvulnerabilityDockedShips()
  if SobGroup_Count("JuggernaughtExpBag4") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag4")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag4", SobGroup_Count("JuggernaughtExpBag4"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                   
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag4", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag4")      
  Rule_Remove("Jexplosiondamageexp4")  
end 
function Jexplosiondamageexp5()   
  SetInvulnerabilityDockedShips() 
  if SobGroup_Count("JuggernaughtExpBag5") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag5")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag5", SobGroup_Count("JuggernaughtExpBag5"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                              
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag5", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag5")      
  Rule_Remove("Jexplosiondamageexp5")  
end 
function Jexplosiondamageexp6() 
  SetInvulnerabilityDockedShips()   
  if SobGroup_Count("JuggernaughtExpBag6") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag6")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag6", SobGroup_Count("JuggernaughtExpBag6"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                     
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag6", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag6")      
  Rule_Remove("Jexplosiondamageexp6")  
end 
function Jexplosiondamageexp7()  
  SetInvulnerabilityDockedShips()  
  if SobGroup_Count("JuggernaughtExpBag7") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag7")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag7", SobGroup_Count("JuggernaughtExpBag7"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                             
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag7", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag7")      
  Rule_Remove("Jexplosiondamageexp7")  
end 
function Jexplosiondamageexp8()  
  SetInvulnerabilityDockedShips()  
  if SobGroup_Count("JuggernaughtExpBag8") == 1 then         
	  playerIndex = SobGroup_OwnedBy("JuggernaughtExpBag8")
	  DetonationPower = 1
	  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
	    DetonationPower = 2.1         
	  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
	    DetonationPower = 1.5  
	  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
	    DetonationPower = 1.25
	  end   
	  DetonationRange = 1
	  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
	    DetonationRange = 1.5         
	  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
	    DetonationRange = 1.3  
	  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
	    DetonationRange = 1.15
	  end 
	  for playerDamaged = 0,5,1 do      
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
	    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
	  end				
	else
	  local SobNum = SobGroup_SplitGroupFromGroup("temp", "JuggernaughtExpBag8", SobGroup_Count("JuggernaughtExpBag8"), "splitter") 
    for i = 0,(SobNum - 1),1 do
      playerIndex = SobGroup_OwnedBy("temp"..i)
		  DetonationPower = 1
		  if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
		    DetonationPower = 2.1         
		  elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
		    DetonationPower = 1.5  
		  elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
		    DetonationPower = 1.25
		  end   
		  DetonationRange = 1
		  if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
		    DetonationRange = 1.5         
		  elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
		    DetonationRange = 1.3  
		  elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
		    DetonationRange = 1.15
		  end                                        
		  for playerDamaged = 0,5,1 do      
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 128000 * DetonationPower, 500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 64000 * DetonationPower, 1000 * DetonationRange)              
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 32000 * DetonationPower, 1500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 16000 * DetonationPower, 2000 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 8000 * DetonationPower, 2500 * DetonationRange)
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 4000 * DetonationPower, 3000 * DetonationRange) 
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 2000 * DetonationPower, 3500 * DetonationRange)	
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 1000 * DetonationPower, 4000 * DetonationRange)		
		    SobGroup_DoDamageProximitySobGroup("JuggernaughtExpBag8", playerDamaged, 500 * DetonationPower, 4500 * DetonationRange)	      	    		        	    		    	    		    	      	    
		  end				
		end	
	end	    
  SobGroup_Clear("JuggernaughtExpBag8")      
  Rule_Remove("Jexplosiondamageexp8")  
end

--Keeper

function KPRexplosiondamageexp()
	local KeeperIndex = ExpBag.KeeperIndex
  SetInvulnerabilityDockedShips()  
  if (SobGroup_IsDoingAbility("KeeperExpBag"..KeeperIndex, abilityList[25]) == 1) then
  	kpr_parameter = 1400	--1000
  else
  	kpr_parameter = 700	--500
	end        
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 100*kpr_parameter, 1*kpr_parameter)
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 50*kpr_parameter, 1.5*kpr_parameter)              
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 25*kpr_parameter, 2*kpr_parameter)	
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 12*kpr_parameter, 2.5*kpr_parameter)
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 6*kpr_parameter, 3*kpr_parameter)
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 2*kpr_parameter, 3.5*kpr_parameter) 
    SobGroup_DoDamageProximitySobGroup("KeeperExpBag"..KeeperIndex, playerDamaged, 1*kpr_parameter, 4*kpr_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("KeeperExpBag"..KeeperIndex)      
  Rule_Remove("KPRexplosiondamageexp")  
end 

--Overseer Detonation

function Overseerexplosiondamageexp()   
	local OverseerIndex = ExpBag.OverseerIndex
  SetInvulnerabilityDockedShips()  
  overseer_parameter = 500       
  for playerDamaged = 0,5,1 do
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 100*overseer_parameter, 1*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 50*overseer_parameter, 1.5*overseer_parameter)              
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 25*overseer_parameter, 2*overseer_parameter)	
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 12*overseer_parameter, 2.5*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 6*overseer_parameter, 3*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 2*overseer_parameter, 3.5*overseer_parameter) 
    SobGroup_DoDamageProximitySobGroup("OverseerExpBag"..OverseerIndex, playerDamaged, 1*overseer_parameter, 4*overseer_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("OverseerExpBag"..OverseerIndex)      
  Rule_Remove("Overseerexplosiondamageexp")  
end

--Cargo Plane Detonation

function CargoPlaneexplosiondamageexp()   
	local CargoPlaneIndex = ExpBag.CargoPlaneIndex
  SetInvulnerabilityDockedShips()
  overseer_parameter = 500
  for playerDamaged = 0,5,1 do
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 100*overseer_parameter, 1*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 50*overseer_parameter, 1.5*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 25*overseer_parameter, 1.6*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 12*overseer_parameter, 1.7*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 6*overseer_parameter, 1.8*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 2*overseer_parameter, 1.9*overseer_parameter)
    SobGroup_DoDamageProximitySobGroup("CargoPlaneExpBag"..CargoPlaneIndex, playerDamaged, 1*overseer_parameter, 2*overseer_parameter)
  end
  SobGroup_Clear("CargoPlaneExpBag"..CargoPlaneIndex)
end


--IED

function IEDexplosiondamageexp()   
	local IEDIndex = ExpBag.IEDIndex
  SetInvulnerabilityDockedShips()  
  ied_parameter = 500       
  for playerDamaged = 0,5,1 do
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 100*ied_parameter, 1*ied_parameter)
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 50*ied_parameter, 1.5*ied_parameter)              
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 25*ied_parameter, 2*ied_parameter)	
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 12*ied_parameter, 2.5*ied_parameter)
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 6*ied_parameter, 3*ied_parameter)
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 2*ied_parameter, 3.5*ied_parameter) 
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 1*ied_parameter, 4*ied_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("IEDExpBag"..IEDIndex)      
  Rule_Remove("IEDexplosiondamageexp")  
end 

function IEDexplosiondamageexpFriendly()   
	local IEDIndex = ExpBag.IEDIndex
	--print("IEDexplosiondamageexpFriendly is running")
  SetInvulnerabilityDockedShips()  
  ied_parameter = 500       
  for playerDamaged = 0,5,1 do	--Universe_PlayerCount()-1
  	if playerDamaged == SobGroup_OwnedBy("IEDExpBag"..IEDIndex) then	-- or AreAllied(SobGroup_OwnedBy("IEDExpBag"..IEDIndex), playerDamaged) == 1
  		ied_parameter = random_pseudo(0,100)
  	else
  		ied_parameter = 500
  	end
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 100*ied_parameter, 1*ied_parameter)
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 50*ied_parameter, 1.5*ied_parameter)              
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 25*ied_parameter, 2*ied_parameter)	
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 12*ied_parameter, 2.5*ied_parameter)
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 6*ied_parameter, 3*ied_parameter)
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 2*ied_parameter, 3.5*ied_parameter) 
    SobGroup_DoDamageProximitySobGroup("IEDExpBag"..IEDIndex, playerDamaged, 1*ied_parameter, 4*ied_parameter)			    		          	    		    	      	    
  end	  
  SobGroup_Clear("IEDExpBag"..IEDIndex)      
  Rule_Remove("IEDexplosiondamageexpFriendly")  
end 

--Raider Power Plant

function PowerPlantexplosiondamageexp()   
	local PowerPlantIndex = ExpBag.PowerPlantIndex
  SetInvulnerabilityDockedShips()  
  powerplant_parameter = 1000
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 100*powerplant_parameter, 1*powerplant_parameter)
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 50*powerplant_parameter, 1.5*powerplant_parameter)              
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 25*powerplant_parameter, 2*powerplant_parameter)	
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 12*powerplant_parameter, 2.5*powerplant_parameter)
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 6*powerplant_parameter, 3*powerplant_parameter)
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 2*powerplant_parameter, 3.5*powerplant_parameter) 
    SobGroup_DoDamageProximitySobGroup("PowerPlantExpBag"..PowerPlantIndex, playerDamaged, 1*powerplant_parameter, 4*powerplant_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("PowerPlantExpBag"..PowerPlantIndex)      
  Rule_Remove("PowerPlantexplosiondamageexp")  
end 

--Needleship

function Needleshipexplosiondamageexp()   
	local NeedleshipIndex = ExpBag.NeedleshipIndex
  SetInvulnerabilityDockedShips()  
  needleship_parameter = 1200       
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 100*needleship_parameter, 1*needleship_parameter)
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 50*needleship_parameter, 1.5*needleship_parameter)              
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 25*needleship_parameter, 2*needleship_parameter)	
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 12*needleship_parameter, 2.5*needleship_parameter)
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 6*needleship_parameter, 3*needleship_parameter)
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 2*needleship_parameter, 3.5*needleship_parameter) 
    SobGroup_DoDamageProximitySobGroup("NeedleshipExpBag"..NeedleshipIndex, playerDamaged, 1*needleship_parameter, 4*needleship_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("NeedleshipExpBag"..NeedleshipIndex)      
  Rule_Remove("Needleshipexplosiondamageexp")  
end 

--Avatar

function Avatarexplosiondamageexp()   
	local AvatarIndex = ExpBag.AvatarIndex
  SetInvulnerabilityDockedShips()  
  avatar_parameter = 1200       
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 100*avatar_parameter, 1*avatar_parameter)
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 50*avatar_parameter, 1.5*avatar_parameter)              
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 25*avatar_parameter, 2*avatar_parameter)	
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 12*avatar_parameter, 2.5*avatar_parameter)
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 6*avatar_parameter, 3*avatar_parameter)
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 2*avatar_parameter, 3.5*avatar_parameter) 
    SobGroup_DoDamageProximitySobGroup("AvatarExpBag"..AvatarIndex, playerDamaged, 1*avatar_parameter, 4*avatar_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("AvatarExpBag"..AvatarIndex)      
  Rule_Remove("Avatarexplosiondamageexp")  
end 

--Templar

function Templarexplosiondamageexp()
	local TemplarIndex = ExpBag.TemplarIndex
  SetInvulnerabilityDockedShips()  
  Templar_parameter = 1200       
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 100*Templar_parameter, 1*Templar_parameter)
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 50*Templar_parameter, 1.5*Templar_parameter)              
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 25*Templar_parameter, 2*Templar_parameter)	
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 12*Templar_parameter, 2.5*Templar_parameter)
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 6*Templar_parameter, 3*Templar_parameter)
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 2*Templar_parameter, 3.5*Templar_parameter) 
    SobGroup_DoDamageProximitySobGroup("TemplarExpBag"..TemplarIndex, playerDamaged, 1*Templar_parameter, 4*Templar_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("TemplarExpBag"..TemplarIndex)      
  Rule_Remove("Templarexplosiondamageexp")  
end 

--Sajuuk

function Sajuukexplosiondamageexp()   
	local SajuukIndex = ExpBag.SajuukIndex
  SetInvulnerabilityDockedShips()  
  sajuuk_parameter = 3600
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 100*sajuuk_parameter, 1*sajuuk_parameter)
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 50*sajuuk_parameter, 1.5*sajuuk_parameter)              
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 25*sajuuk_parameter, 2*sajuuk_parameter)	
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 12*sajuuk_parameter, 2.5*sajuuk_parameter)
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 6*sajuuk_parameter, 3*sajuuk_parameter)
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 2*sajuuk_parameter, 3.5*sajuuk_parameter) 
    SobGroup_DoDamageProximitySobGroup("SajuukExpBag"..SajuukIndex, playerDamaged, 1*sajuuk_parameter, 4*sajuuk_parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("SajuukExpBag"..SajuukIndex)      
  Rule_Remove("Sajuukexplosiondamageexp")  
end 

---Power Station
ps_failsafe_factor = 1
function PSexplosiondamage()
  if nps > 0 then
	  local ExpIndex = 0   
	  while (SobGroup_Empty("PowerStationExpBag"..ExpIndex) == 0) and (ExpIndex ~= 2) do
	    ExpIndex = ExpIndex + 1    
	  end  
	  for i = 0,nps-1,1 do                                             
	    if SobGroup_HealthPercentage("splitpowerstations"..i) <= 0 and SobGroup_Empty("splitpowerstations"..i) == 0 then             
	      SobGroup_EvacuateShipsAroundExplodingShip("splitpowerstations"..i, 7000)		--Evacuate nearby ships to avoid explosion damage
	      SobGroup_SobGroupAdd("PowerStationExpBag"..ExpIndex, "splitpowerstations"..i)      
	      if SobGroup_GetHardPointHealth("splitpowerstations"..i, "FailSafe") > 0 then
	      	ps_failsafe_factor = 4
	      else
	      	ps_failsafe_factor = 1
	      end
	      SobGroup_Clear("splitpowerstations"..i)                   
	    end     
	  end    
	  if SobGroup_Empty("PowerStationExpBag"..ExpIndex) == 0 then
	    Rule_AddInterval("PSexplosiondamageexp"..ExpIndex, 7.37)       
	  end    
	end  
end
function PSexplosiondamageexp0()   
  SetInvulnerabilityDockedShips()
  if powerListStored[SobGroup_OwnedBy("PowerStationExpBag0")+1] == nil or ps_failsafe_factor == nil then
  	Rule_Remove("PSexplosiondamageexp0")
  	return
  end
  parameter = powerListStored[SobGroup_OwnedBy("PowerStationExpBag0")+1] / ps_failsafe_factor
  if parameter < 100 then
    parameter = 100
  end                
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 100*parameter, 1*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 50*parameter, 1.5*parameter)              
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 25*parameter, 2*parameter)	
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 12*parameter, 2.5*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 6*parameter, 3*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 2*parameter, 3.5*parameter) 
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag0", playerDamaged, 1*parameter, 4*parameter)			    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("PowerStationExpBag0")      
  Rule_Remove("PSexplosiondamageexp0")  
end 
function PSexplosiondamageexp1()  
  SetInvulnerabilityDockedShips()
  if powerListStored[SobGroup_OwnedBy("PowerStationExpBag1")+1] == nil or ps_failsafe_factor == nil then
  	Rule_Remove("PSexplosiondamageexp1")
  	return
  end
  parameter = powerListStored[SobGroup_OwnedBy("PowerStationExpBag1")+1] / ps_failsafe_factor
  if parameter < 100 then
    parameter = 100
  end                              
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 100*parameter, 1*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 50*parameter, 1.5*parameter)              
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 25*parameter, 2*parameter)	
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 12*parameter, 2.5*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 6*parameter, 3*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 2*parameter, 3.5*parameter) 
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag1", playerDamaged, 1*parameter, 4*parameter)			    		        	    		    	    		    	      	    	    		        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("PowerStationExpBag1")      
  Rule_Remove("PSexplosiondamageexp1")  
end 
function PSexplosiondamageexp2()  
  SetInvulnerabilityDockedShips()
  if powerListStored[SobGroup_OwnedBy("PowerStationExpBag2")+1] == nil or ps_failsafe_factor == nil then
  	Rule_Remove("PSexplosiondamageexp2")
  	return
  end
  parameter = powerListStored[SobGroup_OwnedBy("PowerStationExpBag2")+1] / ps_failsafe_factor
  if parameter < 100 then
    parameter = 100
  end                          
  for playerDamaged = 0,5,1 do      
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 100*parameter, 1*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 50*parameter, 1.5*parameter)              
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 25*parameter, 2*parameter)	
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 12*parameter, 2.5*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 6*parameter, 3*parameter)
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 2*parameter, 3.5*parameter) 
    SobGroup_DoDamageProximitySobGroup("PowerStationExpBag2", playerDamaged, 1*parameter, 4*parameter)			    		        	    		    	    		    	      	    	        	    		    	    		    	      	    
  end	  
  SobGroup_Clear("PowerStationExpBag2")      
  Rule_Remove("PSexplosiondamageexp2")  
end 

function JuggernaughtRadiationUpdate()
	local function_interval = 2.2333
	if SobGroup_Empty("all_radiationwreck") == 0 then
		Update_AllShips()
		local attack_target = "AllShips"
		if SobGroup_Empty("all_supporters") == 0 then
			attack_target = "all_supporters"
		elseif SobGroup_Count("all_shipwreck") > 1 then
			attack_target = "all_shipwreck"
		end
		local numships = SobGroup_SplitGroupReference("SingleRadiationWreck_SOB", "all_radiationwreck", "AllShips", SobGroup_Count("all_radiationwreck"), 0)
		for counter = 0, numships - 1, 1 do
			local ship = "SingleRadiationWreck_SOB"..counter
			local last_radioactivity = SobGroup_GetHardPointHealth(ship, "radiation_timer")
			local decay_timer = 100
			local total_damage = 1.5
			local damage_radius = 4500
			local min_damage = 1
			if SobGroup_AreAnyOfTheseTypes(ship, "hgn_juggernaughtHULK") == 1 then
				decay_timer = 250
				local radiation_power = SobGroup_GetBinaryHardPointHealth(ship, "power0") + 2*SobGroup_GetBinaryHardPointHealth(ship, "power1")
				local radiation_range = SobGroup_GetBinaryHardPointHealth(ship, "range0") + 2*SobGroup_GetBinaryHardPointHealth(ship, "range1")
				local base_damage = 1.5
				local damage_table = {base_damage, base_damage*1.25, base_damage*1.5, base_damage*2.1}
				local damage_table = {4500, 5175, 5850, 6750}
				total_damage = damage_table[radiation_power+1] * last_radioactivity
				min_damage = min_damage * last_radioactivity
			end
			SobGroup_SetHardPointHealth_Smart(ship, "radiation_timer", last_radioactivity-function_interval/decay_timer)
			--if SobGroup_GetHardPointHealth(ship, "radiation_timer") > 0 then
				--if SobGroup_IsDoingAbility(ship, AB_Attack)~=1 then
					--SobGroup_Attack(0, ship, attack_target)		--attack doesn't seem to work, use programmed damage instead
					--print("radiation wreck is attacking "..attack_target)
				--end
			--else
				--SobGroup_AbilityActivate(ship, AB_Attack, 0)
			--end
			DamageAllPlayerShipsInRadius(ship, total_damage/function_interval, min_damage, damage_radius, 10)
		end
	else
		Rule_Remove("JuggernaughtRadiationUpdate")
	end
end

function DamageAllPlayerShipsInRadius(ship, damage_max, damage_min, radius, steps)
	if damage_max > 0 and damage_min > 0 then
		SetInvulnerabilityDockedShips()
		local iteration = 5
		if steps ~= nil then
			iteration = steps
		end
		local damage_step = (damage_max-damage_min)/iteration
		if damage_max < damage_min then
			damage_max = damage_min
		end
		local radius_step = radius/iteration
		for i=1,iteration,1 do
			local current_damage = damage_max-abs(damage_step*(i-1))
			if current_damage < damage_min then
				current_damage = damage_min
			end
		  for playerDamaged = 0,5,1 do
		    SobGroup_DoDamageProximitySobGroup(ship, playerDamaged, current_damage, radius_step*i)
			end
		end
	end
end