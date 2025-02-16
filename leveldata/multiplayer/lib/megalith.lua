function megalithinitialize() 

--trova il primo giocatore vivo
  local primogiocatorevivo = 0
  for i = 0,5,1 do	
		if SobGroup_Empty("Player_Ships"..i) == 0 then
		  primogiocatorevivo = i
		  --print("(megalithinitialize) primogiocatorevivo = "..primogiocatorevivo)
			break
		end
	end
	DefaultMegalithOwnerList[Universe_CurrentPlayer()+1] = primogiocatorevivo				--defined in deathmatch.lua
 
  if Player_FillProximitySobGroup("temp", -1, "Player_Ships"..primogiocatorevivo, 10000000) == 1 then        

---battle arena 
    --if battlearena[1] >= 1 then     
	    SobGroup_Create("banoowner")
	    SobGroup_FillShipsByType("banoowner", "temp", "ba")   
      if SobGroup_Count("banoowner") > 0 then			
				local SobNum = SobGroup_SplitGroupReference("ba", "banoowner", "Player_Ships"..primogiocatorevivo, SobGroup_Count("banoowner")) 
				for i = 0,(SobNum - 1),1 do	
					if SobGroup_Empty("ba"..i) == 0 then	
						SobGroup_SwitchOwner( "ba"..i, i)	    
					end    
				end 
				Rule_AddInterval("battlearenagm", 2.5)
			end	
		--end	 		
    
---mining base  
    SobGroup_FillShipsByType("temp1", "temp", "meg_gehenna_1ctm")  
    SobGroup_SobGroupAdd("megalithnoowner", "temp1")  
		SobGroup_FillShipsByType("temp1", "temp", "meg_gehenna_3ctm")  
    SobGroup_SobGroupAdd("megalithnoowner", "temp1")  
		
    local SobNum = SobGroup_SplitGroupReference("SingleMiningBaseSOB", "megalithnoowner", "Player_Ships"..primogiocatorevivo, SobGroup_Count("megalithnoowner")) 
		for i = 0,(SobNum - 1),1 do
		  if SobGroup_Empty("SingleMiningBaseSOB"..i) == 0 then
				SobGroup_SetHardPointHealth_Smart("SingleMiningBaseSOB"..i, "ru", 0.01)
				SobGroup_AbilityActivate("SingleMiningBaseSOB"..i, AB_Lights, 0)
			end    
		end 
		MaxCount[1] = (SobNum - 1)

---cores    	  		
    SobGroup_Clear("temp1")		
    SobGroup_Clear("temp2")	
    SobGroup_FillShipsByType("temp1", "temp", "core_navigation")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_harvest")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_attack")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_defense")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_build")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_repair")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_cloak")     
    SobGroup_SobGroupAdd("temp2", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "core_hyperspace")     
    SobGroup_SobGroupAdd("temp2", "temp1")                
    local SobNum = SobGroup_SplitGroupReference("cores", "temp2", "Player_Ships"..primogiocatorevivo, SobGroup_Count("temp2")) 
		for i = 0,(SobNum - 1),1 do	
		  if SobGroup_Empty("cores"..i) == 0 then		    
				Ping_LabelVisible(Ping_AddSobGroup("", "juggernaught", "cores"..i), 1)
			end    
		end		
		
---debris	  		
    SobGroup_Clear("temp1")		
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk1")     
    SobGroup_SobGroupAdd("debrisnoowner", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk2")     
    SobGroup_SobGroupAdd("debrisnoowner", "temp1")   
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk3")     
    SobGroup_SobGroupAdd("debrisnoowner", "temp1")   
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk4")     
    SobGroup_SobGroupAdd("debrisnoowner", "temp1")   
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk5")     
    SobGroup_SobGroupAdd("debrisnoowner", "temp1")                        
    local SobNum = SobGroup_SplitGroupReference("debris", "debrisnoowner", "Player_Ships"..primogiocatorevivo, SobGroup_Count("debrisnoowner")) 
		for i = 0,(SobNum - 1),1 do	
		  if SobGroup_Empty("debris"..i) == 0 then
			  SobGroup_SetSwitchOwnerFlag("debris"..i, 0)
			  local availableru = "50000"
		    if SobGroup_AreAnyOfTheseTypes("debris"..i, "meg_veildebris_chunk1") == 1 then
		      availableru = "50000" 
		    elseif SobGroup_AreAnyOfTheseTypes("debris"..i, "meg_veildebris_chunk2") == 1 then  
		      availableru = "55000"  
		    elseif SobGroup_AreAnyOfTheseTypes("debris"..i, "meg_veildebris_chunk3") == 1 then  
		      availableru = "60000"  
		    elseif SobGroup_AreAnyOfTheseTypes("debris"..i, "meg_veildebris_chunk4") == 1 then  
		      availableru = "65000"  
		    elseif SobGroup_AreAnyOfTheseTypes("debris"..i, "meg_veildebris_chunk5") == 1 then  
		      availableru = "70000"  
		    end  	      
				Ping_LabelVisible(Ping_AddSobGroup(availableru .. " RUs", "megalithnoowner", "debris"..i), 1)
			end    
		end
		MaxCount[2] = (SobNum - 1)
		
--Asteroids
    SobGroup_Clear("temp1")
    SobGroup_Create("AsteroidSmasher")    
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_3_grey_nosalvage")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_3_grey_nosalvage_big")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_4_grey_nosalvage")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_4_grey_nosalvage_big")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_5_grey_nosalvage")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_5_grey_nosalvage_big")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_3_ice_nosalvage")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_3_ice_nosalvage_big")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_4_ice_nosalvage")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_4_ice_nosalvage_big")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_5_ice_nosalvage")     
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")  
    SobGroup_FillShipsByType("temp1", "temp", "asteroid_5_ice_nosalvage_big")
    for i=1,15 do
	    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")
	    SobGroup_FillShipsByType("temp1", "temp", "meg_asteroid"..i)
    end
    SobGroup_SobGroupAdd("AsteroidSmasher", "temp1")    
    local SobNum = SobGroup_SplitGroupReference("asteroidbelt", "AsteroidSmasher", "Player_Ships"..primogiocatorevivo, SobGroup_Count("AsteroidSmasher")) 
		for i = 0,(SobNum - 1),1 do	
		  if SobGroup_Empty("asteroidbelt"..i) == 0 then
			  SobGroup_SetSwitchOwnerFlag("asteroidbelt"..i, 0)
			  local availableru = "8000"
		    if SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_3_grey_nosalvage") == 1 then
		      availableru = "8000" 
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_4_grey_nosalvage") == 1 then  
		      availableru = "9000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_5_grey_nosalvage") == 1 then  
		      availableru = "10000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_3_ice_nosalvage") == 1 then  
		      availableru = "12000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_4_ice_nosalvage") == 1 then  
		      availableru = "13000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_5_ice_nosalvage") == 1 then  
		      availableru = "14000"    
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_3_grey_nosalvage_big") == 1 then
		      availableru = "16000" 
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_4_grey_nosalvage_big") == 1 then  
		      availableru = "18000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_5_grey_nosalvage_big") == 1 then  
		      availableru = "20000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_3_ice_nosalvage_big") == 1 then  
		      availableru = "24000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_4_ice_nosalvage_big") == 1 then  
		      availableru = "26000"  
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "asteroid_5_ice_nosalvage_big") == 1 then  
		      availableru = "28000"
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "meg_asteroid1, meg_asteroid2, meg_asteroid3") == 1 then
		    	availableru = "4000"
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "meg_asteroid4, meg_asteroid5, meg_asteroid6") == 1 then
		    	availableru = "8000"
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "meg_asteroid7, meg_asteroid8, meg_asteroid9") == 1 then
		    	availableru = "16000"
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "meg_asteroid10, meg_asteroid11, meg_asteroid12") == 1 then
		    	availableru = "32000"
		    elseif SobGroup_AreAnyOfTheseTypes("asteroidbelt"..i, "meg_asteroid13, meg_asteroid14, meg_asteroid15") == 1 then
		    	availableru = "64000"
		    end  	      
				Ping_LabelVisible(Ping_AddSobGroup(availableru .. " RUs", "megalithnoowner", "asteroidbelt"..i), 1)
			end    
		end   
		SobGroup_SobGroupAdd("AsteroidSmasher", "debrisnoowner")
		--SobGroup_SobGroupAdd("AsteroidSmasher", "megalithnoowner")		
		MaxCount[3] = (SobNum - 1)			
		
---megalith   
    SobGroup_Clear("temp1")    
    SobGroup_FillShipsByType("temp1", "temp", "test_tester")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_balcoragate")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")   
    SobGroup_FillShipsByType("temp1", "temp", "meg_tanis")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1") 
    SobGroup_FillShipsByType("temp1", "temp", "meg_foundry")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")      
    SobGroup_FillShipsByType("temp1", "temp", "meg_bentus")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_chimera_nobuild")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_bigred")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_dreadnaughtberth")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")   
    SobGroup_FillShipsByType("temp1", "temp", "anc_hyperspace_bridge")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_engineeringbay")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_reinforcementpad")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_carrier_huge")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_mandator_star_dreadnought")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_titan_cruiser")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_hvdreadnaught")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_executor_ssd")  
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    --SobGroup_FillShipsByType("temp1", "temp", "meg_asteroid")
    --SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    --SobGroup_FillShipsByType("temp1", "temp", "meg_asteroid_nosubs")
    --SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_asteroidmp")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_progenitorpowermodule")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk_lighthouse")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_veildebris_chunk_lighthouse_nobuild")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_sajhulknose_ui")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_headshotasteroid")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_ghostship")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_venator_destroyer")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_allegiance_destroyer")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_implacable_cruiser")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_vengence_ssd")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_eclipse_ssd")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_class_iii_platform")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_researchstation")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_bentusiexchange")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_tmatmegaship")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    SobGroup_FillShipsByType("temp1", "temp", "meg_bear")
    SobGroup_SobGroupAdd("megalitenoowner", "temp1")
    --SobGroup_SetSwitchOwnerFlag("megalitenoowner", 0)		--DEBUG: captured reinforcement pads have broken UI (no longer needed because crates use a different counting system now)
    local SobNum = SobGroup_SplitGroupReference("megalite", "megalitenoowner", "Player_Ships"..primogiocatorevivo, SobGroup_Count("megalitenoowner")) 
	  for i = 0,(SobNum - 1),1 do	
	    if SobGroup_Empty("megalite"..i) == 0 then			  
	      SobGroup_AbilityActivate("megalite"..i, AB_Scuttle, 0)
				SobGroup_SetSwitchOwnerFlag("megalite"..i, 0)
		    if SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_balcoragate") == 1 then
		      local megalitenoowner = Ping_AddSobGroup("Hyperspace Improver", "megalitenoowner", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner, 0, "-50% Hyperspace Cost")
		      Ping_AddDescription(megalitenoowner, 1, "-50% Hyperspace Recovery Time")
		      Ping_AddDescription(megalitenoowner, 2, "-50% Hyperspace Transaction Time")
		      Ping_AddDescription(megalitenoowner, 3, "-50% Hyperspace Exit Damage")				          
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_tanis") == 1 then				  
		      local megalitenoowner1 = Ping_AddSobGroup("Defense/Support Improver", "megalitenoowner1", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner1, 0, "+10% Health")
		      Ping_AddDescription(megalitenoowner1, 1, "+100% Health Regegeration Rate")
		      Ping_AddDescription(megalitenoowner1, 2, "+100% Docked Ships Repair Speed")	         	  
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_foundry") == 1 then  		      
		      local availableru = 200000
		      local megalitenoowner2 = Ping_AddSobGroup(availableru .. " RUs", "megalitenoowner2", "megalite"..i)		      	  		        
		      Ping_LabelVisible(megalitenoowner2, 1) 		      
		      Ping_AddDescription(megalitenoowner2, 0, "+50% Collector Harvest")
		      Ping_AddDescription(megalitenoowner2, 1, "+50% Collector Load Capacity")
		      Ping_AddDescription(megalitenoowner2, 2, "+50% Collector Drop-Off")	  
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_dreadnaughtberth") == 1 then
		      SobGroup_AbilityActivate("megalite"..i, AB_Lights, 0)
		      local megalitenoowner3 = Ping_AddSobGroup("Attack Improver", "megalitenoowner3", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner3, 0, "+40% Weapon Damage")
		      Ping_AddDescription(megalitenoowner3, 1, "+40% Weapon Accuracy")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "anc_hyperspace_bridge") == 1 then
		      local megalitenoowner4 = Ping_AddSobGroup("Shield Improver", "megalitenoowner4", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner4, 0, "+10% Shield Regeneration Rate")
		      Ping_AddDescription(megalitenoowner4, 1, "+10% Shield Duaration")
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "lasthealth", SobGroup_HealthPercentage("megalite"..i))
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_engineeringbay") == 1 then
		      local megalitenoowner5 = Ping_AddSobGroup("Level 0", "megalitenoowner5", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner5, 0, "Heal Radius: 3000m")
		      Ping_AddDescription(megalitenoowner5, 1, "Heal Rate: 0.1%")
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "tcn1", 0)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "tcn2", 0)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "tcn3", 0)
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_reinforcementpad") == 1 then
		      local megalitenoowner6 = Ping_AddSobGroup("Supply Zone", "megalitenoowner6", "megalite"..i)
		      Ping_AddDescription(megalitenoowner6, 0, "Next Supply: Unknown")
		      Ping_AddDescription(megalitenoowner6, 1, "Supply Countdown: 100")
		      local newtype = 0.1*random_pseudo(1,10)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "type", newtype)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "type_override", newtype)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "time", 1)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "number", 0)
		      SobGroup_AbilityActivate("megalite"..i, AB_Attack, 0)
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_mandator_star_dreadnought, meg_titan_cruiser, meg_hvdreadnaught, meg_executor_ssd") == 1 then
		      local megalitenoowner7 = Ping_AddSobGroup("Artillery Bombardment", "megalitenoowner7", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner7, 0, "Aiming System: 30%")
		      Ping_AddDescription(megalitenoowner7, 1, "Munition System: 30%")
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "aim", 0)
		      SobGroup_SetHardPointHealth_Smart("megalite"..i, "firepower", 0)
		      SobGroup_AbilityActivate("megalite"..i, AB_Attack, 0)
		      SobGroup_AbilityActivate("megalite"..i, AB_Lights, 0)
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_progenitorpowermodule") == 1 then 	
          local megalitenoowner8 = Ping_AddSobGroup("Anti-Radiation Improver", "megalitenoowner8", "megalite"..i)
          Ping_LabelVisible(megalitenoowner8, 1)					
		      Ping_AddDescription(megalitenoowner8, 0, "-50% Nebula Damage")
		      Ping_AddDescription(megalitenoowner8, 1, "-50% Dust Cloud Damage")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_veildebris_chunk_lighthouse, meg_veildebris_chunk_lighthouse_nobuild") == 1 then
          local megalitenoowner9 = Ping_AddSobGroup("Sensor Improver", "megalitenoowner9", "megalite"..i)
          Ping_LabelVisible(megalitenoowner9, 1)					
		      Ping_AddDescription(megalitenoowner9, 0, "+50% Primary Sensor Range")
		      Ping_AddDescription(megalitenoowner9, 1, "+50% Secondary Sensor Range")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_sajhulknose_ui") == 1 then
          local megalitenoowner10 = Ping_AddSobGroup("Propulsion Improver", "megalitenoowner10", "megalite"..i)
          Ping_LabelVisible(megalitenoowner10, 1)
		      Ping_AddDescription(megalitenoowner10, 0, "+20% Speed")
		      Ping_AddDescription(megalitenoowner10, 1, "+20% Drive")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bigred") == 1 then
          local megalitenoowner12 = Ping_AddSobGroup("Cloak Megalith", "megalitenoowner12", "megalite"..i)
          Ping_LabelVisible(megalitenoowner12, 1)
		      Ping_AddDescription(megalitenoowner12, 0, "+50% Cloak Strength")
		      Ping_AddDescription(megalitenoowner12, 1, "+50% Cloak Time")
					Ping_AddDescription(megalitenoowner12, 2, "+20% Cloak Detection")
		      Ping_AddDescription(megalitenoowner12, 3, "+20% Sensor Distortion")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_headshotasteroid") == 1 then
		    	SobGroup_AbilityActivate("megalite"..i, AB_Lights, 0)
          local megalitenoowner13 = Ping_AddSobGroup("Impact Megalith", "megalitenoowner13", "megalite"..i)
          Ping_LabelVisible(megalitenoowner13, 1)
		      Ping_AddDescription(megalitenoowner13, 0, "Mothership Smasher")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_carrier_huge") == 1 then
		      local megalitenoowner14 = Ping_AddSobGroup("Air Combat Command", "megalitenoowner14", "megalite"..i)
		      Ping_AddDescription(megalitenoowner14, 0, "Air Superiority Fighter: 0")
		      Ping_AddDescription(megalitenoowner14, 1, "Multirole Combat Jet: 0")
		      Ping_AddDescription(megalitenoowner14, 2, "Bomber: 0")
		      Ping_AddDescription(megalitenoowner14, 3, "Support Aircraft: 0")
		      SobGroup_AbilityActivate("megalite"..i, AB_Attack, 0)
		      SobGroup_AbilityActivate("megalite"..i, AB_Lights, 0)
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_chimera_nobuild") == 1 then
		    	local megalitenoowner15 = Ping_AddSobGroup("Sensor Megalith", "megalitenoowner15", "megalite"..i)
          Ping_LabelVisible(megalitenoowner15, 1)
		    	Ping_AddDescription(megalitenoowner15, 0, "+50% Cloak Detection")
		      Ping_AddDescription(megalitenoowner15, 1, "+20% Visual Range")
					Ping_AddDescription(megalitenoowner15, 2, "+20% Primary Sensor Range")
		      Ping_AddDescription(megalitenoowner15, 3, "+20% Secondary Sensor Range")
		      SobGroup_AbilityActivate("megalite"..i, AB_Lights, 0)
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bentus") == 1 then
		    	local megalitenoowner16 = Ping_AddSobGroup("Research Improver", "megalitenoowner16", "megalite"..i)
          Ping_LabelVisible(megalitenoowner16, 1)
		      Ping_AddDescription(megalitenoowner16, 0, "+25% Research Speed")
		      Ping_AddDescription(megalitenoowner16, 1, "Total Divisions: N/A")
		      Ping_AddDescription(megalitenoowner16, 2, "Total Efficiency: N/A")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_ghostship") == 1 then
          local megalitenoowner17 = Ping_AddSobGroup("Unknown Megalith", "megalitenoowner17", "megalite"..i)
          Ping_LabelVisible(megalitenoowner17, 1)
		      Ping_AddDescription(megalitenoowner17, 0, "Unforeseen Consequences")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_venator_destroyer, meg_allegiance_destroyer, meg_implacable_cruiser, meg_vengence_ssd, meg_eclipse_ssd, meg_class_iii_platform") == 1 then
          local megalitenoowner17 = Ping_AddSobGroup("Unidentified Aggressor", "megalitenoowner17", "megalite"..i)
          Ping_LabelVisible(megalitenoowner17, 1)
		      Ping_AddDescription(megalitenoowner17, 0, "Overwhelming Firepower")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_researchstation") == 1 then
          local megalitenoowner15 = Ping_AddSobGroup("Astronomical Observatory", "megalitenoowner15", "megalite"..i)
          Ping_LabelVisible(megalitenoowner15, 1)
		      Ping_AddDescription(megalitenoowner15, 0, "Meteorological Studies")
		      Ping_AddDescription(megalitenoowner15, 1, "Disaster Prevention")
					Ping_AddDescription(megalitenoowner15, 2, "-100% Meteor Strikes")
		      Ping_AddDescription(megalitenoowner15, 3, "+25% Research Speed")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bentusiexchange") == 1 then
		    	SobGroup_AbilityActivate("megalite"..i, AB_Attack, 0)
		    	local megalitenoowner16 = Ping_AddSobGroup("(OPEN)", "megalitenoowner16", "megalite"..i)
          Ping_LabelVisible(megalitenoowner16, 1)
		      Ping_AddDescription(megalitenoowner16, 0, "Your No.1 Trustworthy Merchant")
		      Ping_AddDescription(megalitenoowner16, 1, "Buy New Technologies Here")
		      Ping_AddDescription(megalitenoowner16, 2, "Cutting Out the Middleman")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_tmatmegaship") == 1 then
          local megalitenoowner17 = Ping_AddSobGroup("Lithophilic Superorganism", "megalitenoowner17", "megalite"..i)
          Ping_LabelVisible(megalitenoowner17, 1)
		      Ping_AddDescription(megalitenoowner17, 0, "It's Alive!")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bear") == 1 then
          local megalitenoowner17 = Ping_AddSobGroup("The True North", "megalitenoowner17", "megalite"..i)
          Ping_LabelVisible(megalitenoowner17, 1)
		      Ping_AddDescription(megalitenoowner17, 0, "Deadly Firepower")
		    end
			end    
		end   			   
		MaxCount[4] = (SobNum - 1)  				       				     		      		
		
---planet
	  SobGroup_Clear("temp1")	 
	  SobGroup_Create("planet_mercury")
	  SobGroup_Create("planet_venus")	  
	  SobGroup_Create("planet_moon")
	  SobGroup_Create("planet_earth")
	  SobGroup_Create("planet_mars")
	  SobGroup_Create("planet_jupiter")
	  SobGroup_Create("planet_europa")
	  SobGroup_Create("planet_io")
	  SobGroup_Create("planet_callisto")
	  SobGroup_Create("planet_ganymeade")	  
	  SobGroup_Create("planet_saturn")
	  SobGroup_Create("planet_pluto")
	  SobGroup_Create("planet_uranus")
	  SobGroup_Create("planet_neptune")	 	  	  
	  SobGroup_Create("planetnoowner")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_mercury")     
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")   
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_venus")     
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")    		
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_moon")     
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")   
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_earth")     
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_earth_aerosol")
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_kharak")
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_kharak_burned")
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_hiigara")
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_angelmoon")
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_mars") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_jupiter") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_europa") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_io") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_callisto") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_ganymeade") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_saturn") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_pluto") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_uranus") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "hgn_planet_neptune") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1") 
	  SobGroup_FillShipsByType("temp1", "temp", "star_sol") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "star_sol_C9") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  SobGroup_FillShipsByType("temp1", "temp", "star_pulsar") 
	  SobGroup_SobGroupAdd("planetnoowner", "temp1")
	  local wehaveaplanet = 0
	  local SobNum = SobGroup_SplitGroupReference("planet", "planetnoowner", "Player_Ships"..primogiocatorevivo, SobGroup_Count("planetnoowner"))
	  for i = 0,(SobNum - 1),1 do	
	    if SobGroup_Empty("planet"..i) == 0 then
	      SobGroup_AbilityActivate("planet"..i, AB_Scuttle, 0)
				SobGroup_SetSwitchOwnerFlag("planet"..i, 0)
		    if SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_mercury") == 1 then			      		      
		      wehaveaplanet = wehaveaplanet + 1			      
		      SobGroup_SobGroupAdd("planet_mercury", "planet"..i)   
		      SobGroup_SetSwitchOwnerFlag("planet_mercury", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_venus") == 1 then			      		      
		      wehaveaplanet = wehaveaplanet + 1			      
		      SobGroup_SobGroupAdd("planet_venus", "planet"..i)   
		      SobGroup_SetSwitchOwnerFlag("planet_venus", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_moon, hgn_planet_angelmoon") == 1 then			      		      
		      wehaveaplanet = wehaveaplanet + 1			      
		      SobGroup_SobGroupAdd("planet_moon", "planet"..i)   
		      SobGroup_SetSwitchOwnerFlag("planet_moon", 0)     
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_earth, hgn_planet_earth_aerosol, hgn_planet_kharak, hgn_planet_kharak_burned, hgn_planet_hiigara") == 1 then  	          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_earth", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_earth", 0)    
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_mars") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_mars", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_mars", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_jupiter") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_jupiter", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_jupiter", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_europa") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_europa", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_europa", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_io") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_io", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_io", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_callisto") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_callisto", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_callisto", 0) 
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_ganymeade") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_ganymeade", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_ganymeade", 0) 		
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_saturn") == 1 then      		          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_saturn", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_saturn", 0)   
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_pluto") == 1 then  	          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_pluto", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_pluto", 0)  
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_uranus") == 1 then  	          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_uranus", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_uranus", 0)       
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_neptune") == 1 then  	          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("planet_neptune", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("planet_neptune", 0)     
		    elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "star_sol, star_sol_C9, star_pulsar") == 1 then  	          
		      wehaveaplanet = wehaveaplanet + 1 		      
		      SobGroup_SobGroupAdd("star_sol", "planet"..i) 
		      SobGroup_SetSwitchOwnerFlag("star_sol", 0)  
		      Rule_AddInterval("solFX", 20)  --da inserire poi in planet management
		      SobGroup_Create("SOB_SolarFlares")
				  SobGroup_FillShipsByType("temp1", "temp", "star_sol_lighter") 
				  SobGroup_SobGroupAdd("SOB_SolarFlares", "temp1")
				  SobGroup_FillShipsByType("temp1", "temp", "star_sol_lighter1") 
				  SobGroup_SobGroupAdd("SOB_SolarFlares", "temp1")
				  if SobGroup_Empty("SOB_SolarFlares") == 0 then
				  	SobGroup_Attack(primogiocatorevivo, "SOB_SolarFlares", "star_sol")		--let the solar flare move!
				  	--SobGroup_Kamikaze("SOB_SolarFlares", "planet"..i)
				  	--SobGroup_AvoidanceIgnore("SOB_SolarFlares", "star_sol")
				  	--SobGroup_AvoidanceIgnore("star_sol", "SOB_SolarFlares")
				  	SobGroup_SetInvulnerability("SOB_SolarFlares", 1)
				  	SobGroup_SetInvulnerability("star_sol", 1)
				  end
				  if SobGroup_AreAnyOfTheseTypes("planet"..i, "star_pulsar") == 1 then		--relativistic jets
				  	local pos = SobGroup_GetPosition("planet"..i)
				  	SobGroup_Create("SOB_PulsarJets")
						SobGroup_Clear("SOB_PulsarJets")
						Volume_AddSphere("VOL_PulsarJets", pos, 1000)
						SobGroup_SpawnNewShipInSobGroup(-1, "star_pulsar_jet", "pulsar_jet_north", "SOB_PulsarJets", "VOL_PulsarJets")
						SobGroup_SpawnNewShipInSobGroup(-1, "star_pulsar_jet1", "pulsar_jet_south", "SOB_PulsarJets", "VOL_PulsarJets")
						SobGroup_SetInvulnerability("SOB_PulsarJets", 1)
						SobGroup_ParadeSobGroup("SOB_PulsarJets", "planet"..i, 2)
						SobGroup_Attack(primogiocatorevivo, "SOB_PulsarJets", "planet"..i)
						Volume_Delete("VOL_PulsarJets")
				  end
		    end
			end    
		end 
		if wehaveaplanet >= 1 then
		  Rule_AddInterval("planetmanagement", 15)		  
		end  	 
    
		--determina quale planet bar attivare
    if wehaveaplanet > 10 then
      levelweareplaying = 0
    elseif SobGroup_Empty("planet_earth") == 0 then	
		  levelweareplaying = 1
    elseif SobGroup_Empty("planet_jupiter") == 0 then
		  levelweareplaying = 2
    elseif SobGroup_Empty("planet_saturn") == 0 then
		  levelweareplaying = 3
		elseif SobGroup_Empty("planet_neptune") == 0 then
		  levelweareplaying = 4
    end		
		
		MaxCount[5] = (SobNum - 1)  	
		
  end  
  
  SobGroup_Create("anc_hyperspace_bridge")
  SobGroup_Create("anc_hyperspace_bridge_all")
  SobGroup_FillShipsByType("anc_hyperspace_bridge", "temp", "anc_hyperspace_bridge")
  SobGroup_FillShipsByType("anc_hyperspace_bridge_all", "temp", "anc_hyperspace_bridge")
  SobGroup_SetSwitchOwnerFlag("anc_hyperspace_bridge", 0)
  SobGroup_SetSwitchOwnerFlag("anc_hyperspace_bridge_all", 0)
  if SobGroup_Empty("anc_hyperspace_bridge") == 0 then
  	--health_anc_hyperspace_bridge = {}
  	--local numships = SobGroup_SplitGroupReference("SingleFXAncestorBridge_SOB", "anc_hyperspace_bridge", "megalitenoowner", SobGroup_Count("anc_hyperspace_bridge"))
		--for counter = 0, numships - 1, 1 do
	  --	health_anc_hyperspace_bridge.counter = SobGroup_HealthPercentage("SingleFXAncestorBridge_SOB"..counter)
	  --end
  	Rule_AddInterval("AncestorHyperspaceBridgeFX", 0.5)
  end
  
  SobGroup_Create("sob_AllBlackholes")
  SobGroup_Clear("sob_AllBlackholes")
  SobGroup_Create("zzz_blackhole")
  SobGroup_FillShipsByType("zzz_blackhole", "temp", "zzz_blackhole")
  --SobGroup_FillShipsByType("sob_AllBlackholes", "temp", "zzz_blackhole")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_blackhole")
  SobGroup_Create("zzz_blackhole_red")
  SobGroup_FillShipsByType("zzz_blackhole_red", "temp", "zzz_blackhole_red")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_blackhole_red")
  SobGroup_Create("zzz_blackhole_green")
  SobGroup_FillShipsByType("zzz_blackhole_green", "temp", "zzz_blackhole_green")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_blackhole_green")
  SobGroup_Create("zzz_blackhole_blue_huge")
  SobGroup_FillShipsByType("zzz_blackhole_blue_huge", "temp", "zzz_blackhole_blue_huge")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_blackhole_blue_huge")
  SobGroup_Create("zzz_singularity")
  SobGroup_FillShipsByType("zzz_singularity", "temp", "zzz_singularity")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_singularity")
  SobGroup_Create("zzz_whitehole")
  SobGroup_FillShipsByType("zzz_whitehole", "temp", "zzz_whitehole")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_whitehole")
  SobGroup_Create("zzz_singularity_small")
  SobGroup_FillShipsByType("zzz_singularity_small", "temp", "zzz_singularity_small")
  SobGroup_SobGroupAdd("sob_AllBlackholes", "zzz_singularity_small")
  if SobGroup_Empty("sob_AllBlackholes") == 0 then
  	Rule_AddInterval("blackholeRule", 0.521)
  end
  
  SobGroup_Create("SOB_MapSpecialFX")
  SobGroup_FillShipsByType("temp1", "temp", "spc_sol")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  SobGroup_FillShipsByType("temp1", "temp", "spc_marsground")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  SobGroup_FillShipsByType("temp1", "temp", "spc_moonground")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  SobGroup_FillShipsByType("temp1", "temp", "spc_angelmoonground")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  SobGroup_FillShipsByType("temp1", "temp", "spc_hiigaraground")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  SobGroup_FillShipsByType("temp1", "temp", "spc_hiigarasmall")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  SobGroup_FillShipsByType("temp1", "temp", "spc_angelmoonsmall")
  SobGroup_SobGroupAdd("SOB_MapSpecialFX", "temp1")
  
  --add all capturable megaliths to a fixed group for the AI capture function
  SobGroup_SobGroupAdd("all_capturablemegaliths", "megalithnoowner")	--mining bases
  SobGroup_SobGroupAdd("all_capturablemegaliths", "megalitenoowner")	--various megaliths
  SobGroup_SetSwitchOwnerFlag("all_capturablemegaliths", 0)
  
	--crate initialization
  SobGroup_FillShipsByType("meg_crate", "temp", "meg_crate")
  if SobGroup_Empty("meg_crate") == 0 then
  	CrateCount = SobGroup_SplitGroupReference("splitcrate", "meg_crate", "Player_Ships"..primogiocatorevivo, SobGroup_Count("meg_crate"))
  	for i = 0, CrateCount-1, 1 do
			if SobGroup_Empty("splitcrate"..i) == 0 then
				if SobGroup_HealthPercentage("splitcrate"..i) > 0 then
		      SobGroup_AbilityActivate("splitcrate"..i, AB_Scuttle, 0)
					SobGroup_SetSwitchOwnerFlag("splitcrate"..i, 0)
					if SobGroup_AreAnyOfTheseTypes("splitcrate"..i, "meg_crate") == 1 then
						local megalitenoowner11 = Ping_AddSobGroup("Unclaimed Package", "megalitenoowner11", "splitcrate"..i)
	          Ping_LabelVisible(megalitenoowner11, 1)
			      Ping_AddDescription(megalitenoowner11, 0, "Contents Unknown")
			      Ping_AddDescription(megalitenoowner11, 1, "First Come To Unbox")
						Crate_SetMeshFX("splitcrate"..i)
					end
				end
			end
		end
	end
  if crates > 0 or CrateCount > 0 then
  	Rule_AddInterval("crates_check", 1.1667)
  	print("Crate system initialized!")
  end
	--figure out the rough map size (maximum inner bounds)
	local bound_x,bound_y,bound_z = 10000,10000,10000		--10000 is the smallest size
	for t=0,30,1 do		--x axis
		local breaker = 0
		local current_distance = bound_x*1.15102^t
		Volume_AddSphere("VOL_MapSizeTesterLocation_x"..t, {current_distance, random_pseudo(-100,100), random_pseudo(-100,100)}, 6000)
		SobGroup_Create("MapSizeTesterTempSOB")
		SobGroup_SpawnNewShipInSobGroup(-1, "meg_dummy_mapsizetester", "TestingMapSize", "MapSizeTesterTempSOB", "VOL_MapSizeTesterLocation_x"..t)
		Volume_Delete("VOL_MapSizeTesterLocation_x"..t)
		if SobGroup_InWorldBound("MapSizeTesterTempSOB", 1) == 0 then		--boundary check
			MapInnerBounds[1]=floor(current_distance)
			breaker=1
		end
		--SobGroup_Despawn("MapSizeTesterTempSOB")
		SobGroup_SetHealth("MapSizeTesterTempSOB", 0)
		SobGroup_Clear("MapSizeTesterTempSOB")
		if breaker == 1 then
			break
		end
	end
	for t=0,25,1 do		--y axis
		local breaker = 0
		local current_distance = bound_y*1.15282^t
		Volume_AddSphere("VOL_MapSizeTesterLocation_y"..t, {random_pseudo(-100,100), current_distance, random_pseudo(-100,100)}, 6000)
		SobGroup_Create("MapSizeTesterTempSOB")
		SobGroup_SpawnNewShipInSobGroup(-1, "meg_dummy_mapsizetester", "TestingMapSize", "MapSizeTesterTempSOB", "VOL_MapSizeTesterLocation_y"..t)
		Volume_Delete("VOL_MapSizeTesterLocation_y"..t)
		if SobGroup_InWorldBound("MapSizeTesterTempSOB", 1) == 0 then		--boundary check
			MapInnerBounds[2]=floor(current_distance)
			breaker=1
		end
		--SobGroup_Despawn("MapSizeTesterTempSOB")
		SobGroup_SetHealth("MapSizeTesterTempSOB", 0)
		SobGroup_Clear("MapSizeTesterTempSOB")
		if breaker == 1 then
			break
		end
	end
	for t=0,30,1 do		--z axis
		local breaker = 0
		local current_distance = bound_z*1.15102^t
		Volume_AddSphere("VOL_MapSizeTesterLocation_z"..t, {random_pseudo(-100,100), random_pseudo(-100,100), current_distance}, 6000)
		SobGroup_Create("MapSizeTesterTempSOB")
		SobGroup_SpawnNewShipInSobGroup(-1, "meg_dummy_mapsizetester", "TestingMapSize", "MapSizeTesterTempSOB", "VOL_MapSizeTesterLocation_z"..t)
		Volume_Delete("VOL_MapSizeTesterLocation_z"..t)
		if SobGroup_InWorldBound("MapSizeTesterTempSOB", 1) == 0 then		--boundary check
			MapInnerBounds[3]=floor(current_distance)
			breaker=1
		end
		--SobGroup_Despawn("MapSizeTesterTempSOB")
		SobGroup_SetHealth("MapSizeTesterTempSOB", 0)
		SobGroup_Clear("MapSizeTesterTempSOB")
		if breaker == 1 then
			break
		end
	end
	print("Estimated map inner bounds (max): ".."x="..MapInnerBounds[1]..", y="..MapInnerBounds[2]..", z="..MapInnerBounds[3])
  
  Rule_Remove("megalithinitialize")
  Rule_AddInterval("megalith", 4.025)
  Rule_AddInterval("MegalithWreckCheck", 16.555)
  if GetGameRubric() ~= GR_CAMPAIGN and String_ContainsPatternInTable(GameRulesName, {"Simplex Territories", "Simplex Screensaver"}) == 0 and endgamecrisis_timer > 0 then
  	Rule_AddInterval("EndgameCrisis", 44.391)
  	--Rule_AddInterval("SalvageCleaning", 11.247)	--this is useless because the collectors belonging to player -1 won't autodock after resourcing
  end
end

BlackholeUpdateCycle = 0
BlackholeCount = 0
BlackholeUpdateCycles = 10
BlackholeDamageRadii = {
{ 35000,      50},
{ 25000,     100},
{ 20000,     200},
{ 16000,     400},
{ 12000,    8000},
{ 10000,   16000},
{  8000,   32000},
}

function blackholeRule()
	-- Only process Blackholes, if any Blackholes exist
  BlackholeCount = SobGroup_Count("sob_AllBlackholes")
	if(BlackholeCount > 0) then
		-- Only update Blackholes every 'BlackholeUpdateCycles' game cycles
		if(BlackholeUpdateCycle == BlackholeUpdateCycles) then
			BlackholeUpdateCycle = 0
			-- loop through all Blackholes
			for k = 1, BlackholeCount do
				updateBlackhole(k)
			end
		else
			BlackholeUpdateCycle = BlackholeUpdateCycle + 1
		end
	end
	--Rule_RandomInterval("blackholeRule", 0.8, 0.3)
end

function updateBlackhole(k)
	if SobGroup_IsDoingAbility("sob_Blackhole"..k, AB_Attack) == 0 then
		-- Scan for enemies:
		-- 1. Clear old SobGroup
		-- 2. Get all ships of all Players
		-- 3. Get all ships within the maximum damage radius --> enemies
		Update_AllShips()
		SobGroup_Create("ValidBlackholeTargets")
		SobGroup_SobGroupAdd("ValidBlackholeTargets", "AllShips")
		SobGroup_SobGroupSubstract("ValidBlackholeTargets", "all_supporters")
		SobGroup_SobGroupAdd("ValidBlackholeTargets", "all_shipwreck")
		SobGroup_Create("sob_BlackholeEnemies")
		SobGroup_Clear("sob_BlackholeEnemies")
		local radius = BlackholeDamageRadii[1][1]
		if SobGroup_AreAnyOfTheseTypes("sob_Blackhole"..k, "zzz_singularity_small") == 1 then
			radius = BlackholeDamageRadii[1][1]/3
		elseif SobGroup_AreAnyOfTheseTypes("sob_Blackhole"..k, "zzz_blackhole_green, zzz_blackhole_red") == 1 then
			radius = BlackholeDamageRadii[3][1]
		elseif SobGroup_AreAnyOfTheseTypes("sob_Blackhole"..k, "zzz_blackhole_blue_huge") == 1 then
			radius = 100000
		end
		SobGroup_FillProximitySobGroup("sob_BlackholeEnemies", "ValidBlackholeTargets", "sob_Blackhole"..k, radius)
		
		-- Check:
		-- 1. Are there any enemies within range?
		if SobGroup_Empty("sob_BlackholeEnemies") == 0 then
			SobGroup_Create("SOB_BlackholeTarget"..k)
			if SobGroup_Empty("SOB_BlackholeTarget"..k) == 1 then
				local spread = {0,0,0}
	      for i=1,3,1 do
					spread[i] = 0.01*random_pseudo(-radius, radius)
				end
				local location = Vector_Operation(SobGroup_GetPosition("sob_Blackhole"..k), spread, "+")
				Volume_AddSphere("VOL_BlackholeTarget"..k, location, 100)
				SobGroup_SpawnNewShipInSobGroup(-1, "zzz_blackholetarget", "BlackholeTarget", "SOB_BlackholeTarget"..k, "VOL_BlackholeTarget"..k)
				Volume_Delete("VOL_BlackholeTarget"..k)
				SobGroup_SetInvulnerability("sob_Blackhole"..k, 1)
				SobGroup_SetInvulnerability("SOB_BlackholeTarget"..k, 1)
				SobGroup_SetHealth("SOB_BlackholeTarget"..k, 1)
				print("Spawning blackhole target at "..Vector_tostring(location).." for sob_Blackhole"..k)
			elseif SobGroup_Count("SOB_BlackholeTarget"..k) == 1 then
				SobGroup_Attack(0, "sob_Blackhole"..k, "SOB_BlackholeTarget"..k)
			elseif SobGroup_Count("SOB_BlackholeTarget"..k) > 1 then
				SobGroup_SetHealth("SOB_BlackholeTarget"..k, 0)
			end
		end
	else
		if BlackholeCount > 1 then	--randomly stop attacking to avoid ships being trapped between blackholes and causing 0000000c crash
			if mod(gametime, BlackholeCount+1) == k then
				SobGroup_Stop(0, "sob_Blackhole"..k)
			end
		end
	end
end

function AncestorHyperspaceBridgeFX()
	--SobGroup_FillShipsByType("anc_hyperspace_bridge", "anc_hyperspace_bridge_all", "anc_hyperspace_bridge")
	--SobGroup_SetSwitchOwnerFlag("anc_hyperspace_bridge", 0)
	--print("AncestorHyperspaceBridgeFX running, anc_hyperspace_bridge: "..SobGroup_Count("anc_hyperspace_bridge")..", anc_hyperspace_bridge_all: "..SobGroup_Count("anc_hyperspace_bridge_all"))
	if MaxCount[4] >= 0 and SobGroup_Empty("anc_hyperspace_bridge") == 0 then
		--local numships = SobGroup_SplitGroupReference("SingleFXAncestorBridge_SOB", "anc_hyperspace_bridge", "megalitenoowner", SobGroup_Count("anc_hyperspace_bridge"))
		for i = 0,MaxCount[4],1 do		--for counter = 0, numships - 1, 1 do
			--print("AncestorHyperspaceBridgeFX running for SingleFXAncestorBridge_SOB"..counter)
	  	if SobGroup_Empty("megalite"..i) == 0 then
		  	if SobGroup_AreAnyOfTheseTypes("megalite"..i, "anc_hyperspace_bridge") == 1 then
			  	if SobGroup_HealthPercentage("megalite"..i) < SobGroup_GetHardPointHealth("megalite"..i, "lasthealth") then		--health_anc_hyperspace_bridge.counter then
			  		FX_StartEvent("megalite"..i, "shield2")
			  	else
			  		FX_StopEvent("megalite"..i, "shield2")
			  	end
			  	--health_anc_hyperspace_bridge.counter = SobGroup_HealthPercentage("SingleFXAncestorBridge_SOB"..counter)
			  	SobGroup_SetHardPointHealth_Smart("megalite"..i, "lasthealth", SobGroup_HealthPercentage("megalite"..i))
			  end
		  end
	  end	 
	end
	Rule_RandomInterval("AncestorHyperspaceBridgeFX", 0.55, 0.1)
end

Crate_Ship_MultiplierList = {"random_accuracy", "random_armour", "random_capture", "random_cloak", "random_distortion", "random_drive", "random_dustcloud", "random_firepower", "random_nebula", "random_primarysensor", "random_regen", "random_secondarysensor", "random_speed", "random_visualrange", "random_health"}
function Crate_ShipInitializeRandomState(ship)
	if SobGroup_HealthPercentage(ship) > 0 then
		local initial_hp = random_pseudo(-10000,10000)/100000
		if initial_hp < 0.00001 then
			initial_hp = 0.00001
		end
		for i = 1, Table_CountElements(Crate_Ship_MultiplierList), 1 do
			if SobGroup_GetHardPointHealth(ship, Crate_Ship_MultiplierList[i]) > 0 then
				SobGroup_SetHardPointHealth_Smart(ship, Crate_Ship_MultiplierList[i], initial_hp)
			end
		end
	end
end

function Crate_ShipSetRandomState(ship)
	if SobGroup_HealthPercentage(ship) > 0 then
		local random_hp = random_pseudo(1,100000)/100000
		local item = random_pseudo(1, Table_CountElements(Crate_Ship_MultiplierList))
		if SobGroup_GetHardPointHealth(ship, Crate_Ship_MultiplierList[item]) > 0 then
			SobGroup_SetHardPointHealth_Smart(ship, Crate_Ship_MultiplierList[item], random_hp)
		end
	end
end

Crate_ShipList_Capital = {"HWAT_VAY_CABattle", "HWAT_UNH_CAStandard", "HWAT_FRN_CAHeavy", "vgr_worldcannon"}
Crate_ShipList_Frigate = {"HWAT_FRN_FFAssault", "HWAT_FRN_FFCloak", "HWAT_FRN_FFIon", "HWAT_FRN_FFMine", "HWAT_FRN_FFSupport", "HWAT_UNH_FFAssault", "HWAT_UNH_FFIon", "HWAT_VAY_FFAssault", "HWAT_VAY_FFIonArray"}
Crate_ShipList_Fighter = {"Unit_G_Interceptor", "Unit_G_Bomber", "Unit_C_Interceptor", "Unit_C_Bomber", "Unit_C_Gunship", "hgn_pulsarfighter", "hgn_shadowbomber"}
function crates_check()
	--print("crates_check -- Start")
	SobGroup_Create("SOB_MegDummyRepulsor")
	--kill dummy objects spawned by crates
	if SobGroup_Empty("SOB_MegDummyRepulsor") == 0 then
		local common_hp = SobGroup_HealthPercentage("SOB_MegDummyRepulsor")
		local reduced_hp = common_hp - 0.02
		SobGroup_SetHealth_Smart("SOB_MegDummyRepulsor", reduced_hp)
	end
	--crate behaviours
	if SobGroup_Empty("meg_crate") == 0 then
		if CrateCount > 0 then
			Update_AllShips()
			local claim_distance = 1000
			local claimer = 0
			for iPlayerIndex = 0, Universe_PlayerCount() - 1 do
        if (Player_IsAlive(iPlayerIndex) == 1) then
          claimer = iPlayerIndex					--default claimer
        end
    	end
	  	for i = 0, CrateCount-1, 1 do
	  		if SobGroup_Empty("splitcrate"..i) == 0 then
					if SobGroup_AreAnyOfTheseTypes("splitcrate"..i, "meg_crate") == 1 and SobGroup_HealthPercentage("splitcrate"..i) > 0 then
						--decide the claimer
						SobGroup_Create("ProximityOfCrateSOB")
						SobGroup_Clear("ProximityOfCrateSOB")
						SobGroup_FillProximitySobGroup("ProximityOfCrateSOB", "AllShips", "splitcrate"..i, claim_distance)
						--CLAIMER FOUND, CRATE RECOVERED!
						if SobGroup_Count("ProximityOfCrateSOB") > 0 then
							SobGroup_Create("claimer_SOB")
							SobGroup_Clear("claimer_SOB")
							--print("Crate unboxed! Proximity groups: "..SobGroup_Count("ProximityOfCrateSOB")..", game time: "..Universe_GameTime())
							if SobGroup_Count("ProximityOfCrateSOB") == 1 then		--when only one ship is inbound, it's the only claimer
								claimer = SobGroup_OwnedBy("ProximityOfCrateSOB")
								SobGroup_SobGroupAdd("claimer_SOB", "ProximityOfCrateSOB")
							else	--when multiple ships are competing for the crate, the closest wins
								local numships = SobGroup_SplitGroupReference("SingleCheckCrateProximity_SOB", "ProximityOfCrateSOB", "AllShips", SobGroup_Count("ProximityOfCrateSOB"), 0)
								local lastDist = claim_distance
								for z = 0, numships - 1, 1 do
									if SobGroup_Empty("SingleCheckCrateProximity_SOB"..z) == 0 then
										if SobGroup_GetDistanceToSobGroup("splitcrate"..i, "SingleCheckCrateProximity_SOB"..z) < lastDist then
											lastDist = SobGroup_GetDistanceToSobGroup("splitcrate"..i, "SingleCheckCrateProximity_SOB"..z)
											claimer = SobGroup_OwnedBy("SingleCheckCrateProximity_SOB"..z)
											SobGroup_Clear("claimer_SOB")
											SobGroup_SobGroupAdd("claimer_SOB", "SingleCheckCrateProximity_SOB"..z)
										end
									end
								end
							end
							--now we are talking about the awesome stuff...
							local outcome_list = {"ship", "drone", "ru", "en", "xp", "tech", "hp", "death"}
							if GameRulesName == "Simplex Sole Survivor" then
								outcome_list = {"ship", "drone", "ru", "en", "xp", "tech_ss", "hp", "up_health", "up_damage", "up_aim", "up_speed", "up_repair", "up_sensor", "up_nebula"}
							end
							local awesome_stuff = Table_RandomElement(outcome_list)
							--print("Crate unboxed by player index: "..claimer..", content: "..awesome_stuff..", game year: "..year)
							if awesome_stuff == "ship" then	--SPAWN SHIPS
								local spawn_completed = 0
								--SPAWN A BUILDER (when the player has lost all production ships and desperately needs one)
								if GameRulesName ~= "Simplex Sole Survivor" then
									local BuilderSpawnList = {
				        	{race = Race_Hiigaran, spawn = {"hgn_hscore","hgn_battlecarrier"}, lost = "hgn_mothership, hgn_shipyard, hgn_battleshipyard, hgn_carrier, hgn_battlecarrier, hgn_commandfortress, hgn_battlestation, hgn_hscore, hgn_ark"},
				        	{race = Race_Vaygr, spawn = {"vgr_battlecarrier","vgr_carrier"}, lost = "vgr_mothership, vgr_shipyard, vgr_carrier, vgr_battlecarrier, vgr_commandfortress, vgr_artillerybattlecruiser"},
				        	{race = Race_Kadeshi, spawn = {"kad_needleship"}, lost = "kad_needleship"},
				        	{race = Race_Raider, spawn = {"rad_carrier","rad_carrier_black","rad_hsbouey"}, lost = "rad_mothership, rad_carrier, rad_carrier_black, rad_blackmarket, rad_hsbouey"},
				        	{race = Race_Keeper, spawn = {"kpr_carrier"}, lost = "kpr_shipyard_old, kpr_carrier"}
				        	}
				        	if SobGroup_AreAnyOfTheseTypes("Player_Ships"..claimer, GetSublistByPlayerRace(BuilderSpawnList, claimer).lost) == 0 then
										local spawn_type = Table_RandomElement(GetSublistByPlayerRace(BuilderSpawnList, claimer).spawn)
										SobGroup_Create("SingleShipSpawnedByCrateSOB")
										SobGroup_Clear("SingleShipSpawnedByCrateSOB")
										Volume_AddSphere("VOL_CrateSpawningShipsTarget", SobGroup_GetPosition("splitcrate"..i), 6000)
										Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION NOW! DON'T COLLIDE WITH THE NEWLY SPAWNED SHIPS!
										AI_SobGroup_SpawnNewShipInSobGroup(claimer, spawn_type, "ShipSpawned", "SingleShipSpawnedByCrateSOB", "VOL_CrateSpawningShipsTarget")
										spawn_completed = 1
										Volume_Delete("VOL_CrateSpawningShipsTarget")
										--UI part
										if claimer == Universe_CurrentPlayer() then
											UI_PlaySound("SFX_RadioChatter")
											Subtitle_AddAccordingToRace(claimer,"Crate found! A productional ship has been recovered!",3.72)
										end
									end
								end
								--SPAWN EXOTIC SHIPS
								if spawn_completed == 0 then
									local ship_table = Crate_ShipList_Capital
									local iteration = 0	--always spawn a single vessel in sole survivor mode
									local breaker = 0
									if GameRulesName == "Simplex Sole Survivor" then		--for sole survivor mode, the exotic ships from crates must not break game balance
										ship_table = Table_RandomElement({Crate_ShipList_Fighter, Crate_ShipList_Frigate})
										if ship_table == Crate_ShipList_Capital then
											if SobGroup_Empty("battlecruisers") == 1 then
												breaker = 1
											else		--the strong must not be stronger
												if SobGroup_Empty("smallcapitals"..claimer) == 0 then
													breaker = 1
												end
											end
										elseif ship_table == Crate_ShipList_Frigate then
											if SobGroup_Empty("frigates") == 1 and SobGroup_Empty("destroyers") == 1 and SobGroup_Empty("battlecruisers") == 1 and SobGroup_Empty("platforms") == 1 then
												breaker = 1
											else		--the strong must not be stronger
												if SobGroup_Empty("smallcapitals"..claimer) == 0 and SobGroup_Empty("battlecruisers") == 1 then
													breaker = 1
												elseif SobGroup_Empty("frigates"..claimer) == 0 and SobGroup_Empty("destroyers") == 1 and SobGroup_Empty("battlecruisers") == 1 then
													breaker = 1
												end
											end
										end
									else		--for normal game mode
										if year < 11 and SobGroup_Empty("battlecruisers") == 1 then	--do not spawn super capital ships too early
											ship_table = Table_RandomElement({Crate_ShipList_Fighter, Crate_ShipList_Frigate})
										else
											ship_table = Table_RandomElement({Crate_ShipList_Fighter, Crate_ShipList_Frigate, Crate_ShipList_Capital})
										end
										--determine spawn counts
										if ship_table == Crate_ShipList_Frigate then
											local time_factor = min(floor(sqrt(year)), 4) + 1
											iteration = random_pseudo(0, time_factor)
										elseif ship_table == Crate_ShipList_Fighter then
											local time_factor = min(floor(sqrt(year)), 3) + 1
											iteration = random_pseudo(0, time_factor)
										end
									end
									--count spawned special capital ships
									local bounty_capitalships = 0
									local bounty_frigates = 0
									local p = 0
		  						while p < Universe_PlayerCount() do
		  							if Player_IsAlive(p) == 1 then
											bounty_capitalships = bounty_capitalships + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_UNH_CAStandard") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_VAY_CABattle") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_FRN_CAHeavy") +
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "vgr_worldcannon")
											bounty_frigates = bounty_frigates + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_FRN_FFAssault") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_FRN_FFCloak") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_FRN_FFIon") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_FRN_FFMine") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_FRN_FFSupport") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_UNH_FFIon") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_UNH_FFAssault") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_VAY_FFAssault") + 
											Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(p, "HWAT_VAY_FFIonArray")
										end
										p=p+1
									end
									if breaker == 1 or 
									(3 > NeededPilots[claimer+1] and ship_table == Crate_ShipList_Fighter) or 
									((35 > NeededPilots[claimer+1] or 3 > NeededOfficers[claimer+1]) and ship_table == Crate_ShipList_Capital) or 
									(8 > NeededPilots[claimer+1] and ship_table == Crate_ShipList_Frigate) or 
									(bounty_capitalships >= Universe_PlayerCount() and ship_table == Crate_ShipList_Capital) or 
									(bounty_frigates >= 2*Universe_PlayerCount() and ship_table == Crate_ShipList_Frigate) then			--unit caps reached, just RUs
										Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
										Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
									else		--unit caps not reached, allowing receiving new ships
										SobGroup_Create("SingleShipSpawnedByCrateSOB")
										SobGroup_Clear("SingleShipSpawnedByCrateSOB")
										Volume_AddSphere("VOL_CrateSpawningShipsTarget", SobGroup_GetPosition("splitcrate"..i), 6000)
										Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION NOW! DON'T COLLIDE WITH THE NEWLY SPAWNED SHIPS!
										--all functions of adding new ships should be beneath this line
										for h=0,iteration,1 do
											local shiptype = random_pseudo(1, Table_CountElements(ship_table))
											SobGroup_Clear("SingleShipSpawnedByCrateSOB")
											--print("Spawning exotic ship from crate: "..ship_table[shiptype])
											AI_SobGroup_SpawnNewShipInSobGroup(claimer, ship_table[shiptype], "ShipSpawned", "SingleShipSpawnedByCrateSOB", "VOL_CrateSpawningShipsTarget")
											Crate_ShipInitializeRandomState("SingleShipSpawnedByCrateSOB")
											if ship_table == Crate_ShipList_Fighter then
											else	--fighters don't have random states (too many subsystems)
												for q=0,random_pseudo(1,14),1 do
													Crate_ShipSetRandomState("SingleShipSpawnedByCrateSOB")
												end
											end
											if GameRulesName == "Simplex Sole Survivor" then		--guard the discoverer for sole survivor mode
											 	SobGroup_GuardSobGroup("SingleShipSpawnedByCrateSOB", "claimer_SOB")
											end
										end
										Volume_Delete("VOL_CrateSpawningShipsTarget")
										--UI part
										if claimer == Universe_CurrentPlayer() then
											local description = "Ship"
											if ship_table == Crate_ShipList_Frigate then
												UI_PlaySound("SFX_Alien_Scan_02")
												if 8 > pilotrecruitList[claimer+1] - pilotpopList[claimer+1] then
													SobGroup_SetHealth("SingleShipSpawnedByCrateSOB", 0)	--overpopulated kill
												end
											elseif ship_table == Crate_ShipList_Capital then
												UI_PlaySound("SFX_Alien_Scan_04")
												if 35 > pilotrecruitList[claimer+1] - pilotpopList[claimer+1] or 3 > officerrecruitList[claimer+1] - officerpopList[claimer+1] then
													SobGroup_SetHealth("SingleShipSpawnedByCrateSOB", 0)	--overpopulated kill
												end
											elseif ship_table == Crate_ShipList_Fighter then
												description = "Squadron"
												UI_PlaySound("SFX_space_cloud_death_01")
												if 3 > pilotrecruitList[claimer+1] - pilotpopList[claimer+1] then
													SobGroup_SetHealth("SingleShipSpawnedByCrateSOB", 0)	--overpopulated kill
												end
											end
											local number = iteration+1
											if number > 1 then
												description = description.."s"
											end
											Subtitle_AddAccordingToRace(claimer,"Crate found! "..description.." recovered: "..number,3.72)
										end
									end
								end
							elseif awesome_stuff == "drone" then
								drone_list = {"meg_drone_small", "meg_drone_scout"}
								if Player_HasResearch(claimer, "DroneTechBattleDrone2") == 1 then
									drone_list = {"meg_drone_small", "meg_drone_medium", "meg_drone_large", "meg_drone_scout"}
								elseif Player_HasResearch(claimer, "DroneTechBattleDrone1") == 1 then
									drone_list = {"meg_drone_small", "meg_drone_medium", "meg_drone_scout"}
								end
								local spawn_type = Table_RandomElement(drone_list)
								SobGroup_Create("SingleShipSpawnedByCrateSOB")
								SobGroup_Clear("SingleShipSpawnedByCrateSOB")
								Volume_AddSphere("VOL_CrateSpawningShipsTarget", SobGroup_GetPosition("splitcrate"..i), 6000)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION NOW! DON'T COLLIDE WITH THE NEWLY SPAWNED SHIPS!
								AI_SobGroup_SpawnNewShipInSobGroup(claimer, spawn_type, "ShipSpawned", "SingleShipSpawnedByCrateSOB", "VOL_CrateSpawningShipsTarget")
								Volume_Delete("VOL_CrateSpawningShipsTarget")
								SobGroup_GuardSobGroup("SingleShipSpawnedByCrateSOB", "claimer_SOB")
--								SobGroup_MoveToSobGroup("SingleShipSpawnedByCrateSOB", "claimer_SOB")
--								SobGroup_SetTactics_Smart("SingleShipSpawnedByCrateSOB", AggressiveTactics)
								--UI part
								if claimer == Universe_CurrentPlayer() then
									UI_PlaySound("SFX_event_ship_bridge")
									Subtitle_AddAccordingToRace(claimer,"Crate found! A drone has been recovered!",3.72)
								end
							elseif awesome_stuff == "ru" then		--RUs
								Crate_PlayerReceiveRUs(claimer, random_pseudo(5000,100000))
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "en" then		--Energy
								local powermax = LastpowerListMax[claimer+1]
								if powerListStored[claimer + 1] >= powermax then		--energy full, just RUs
									Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
								else
									local energy_bonus = random_pseudo(100,2000)
									local energy_added = energy_bonus
									if powerListStored[claimer + 1] + energy_bonus > powermax then
										energy_added = powermax - powerListStored[claimer + 1]
										powerListStored[claimer + 1] = powermax
									else
										powerListStored[claimer + 1] = powerListStored[claimer + 1] + energy_bonus
									end
									powerListManager[claimer + 1].production = powerListManager[claimer + 1].production + energy_added
									--UI part
									if claimer == Universe_CurrentPlayer() then
										UI_PlaySound("SFX_Turret_Place")
										Subtitle_AddAccordingToRace(claimer,"Crate found! Energy recovered: "..energy_added,3.72)
									end
								end
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "xp" then		--Experience
								local promote_distance = 4000
								local shipsNUM = Crate_OutputPlayerShipsNearCrateToNewSOB(claimer, "splitcrate"..i, promote_distance, "crate_promotenearby_SOB")
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
								SobGroup_Create("AllHaxorToPromote_SOB")
								SobGroup_Clear("AllHaxorToPromote_SOB")
								SobGroup_FillCompare("AllHaxorToPromote_SOB", "crate_promotenearby_SOB", "HaxorShipsWithSubsystemXP_SOB")
								local addxp = 0.00010 * random_pseudo(10,200)
								local shippromoted = 0
								if SobGroup_Empty("AllHaxorToPromote_SOB") == 0 then
									local numships = SobGroup_SplitGroupReference("SingleHaxorToPromote_SOB", "AllHaxorToPromote_SOB", "Player_Ships"..claimer, SobGroup_Count("AllHaxorToPromote_SOB"), 0)
									for u = 0, numships - 1, 1 do
										if SobGroup_HealthPercentage("SingleHaxorToPromote_SOB"..u) > 0 then
											local currentxp = SobGroup_GetHardPointHealth("SingleHaxorToPromote_SOB"..u, "experience")
											if currentxp < 1 - addxp then
												SobGroup_SetHardPointHealth_Smart("SingleHaxorToPromote_SOB"..u, "experience", currentxp + addxp)
												shippromoted = shippromoted + 1
											end
										end
									end
								end
								local playeridx = claimer
							  local playervar = playeridx + 1
						  	if nfi[playervar] > 0 then
									for u = 0,(nfi[playervar]-1),1 do
										if SobGroup_Empty("splitfighters"..playeridx .. tostring(u)) == 0 then
											if SobGroup_GetDistanceToSobGroup("splitfighters"..playeridx .. tostring(u), "splitcrate"..i) <= promote_distance then
												if FighterEXP.serial[playervar][u+1] ~= nil then
													if FighterEXP.serial[playervar][u+1] < 1 - addxp then
														FighterEXP.serial[playervar][u+1] = FighterEXP.serial[playervar][u+1] + addxp
														shippromoted = shippromoted + 1
												  end
												end
											end
										end
									end
								end
								if nco[playervar] > 0 then
									for u = 0,(nco[playervar]-1),1 do
										if SobGroup_Empty("splitcorvettes"..playeridx .. tostring(u)) == 0 then
											if SobGroup_GetDistanceToSobGroup("splitcorvettes"..playeridx .. tostring(u), "splitcrate"..i) <= promote_distance then
												if CorvetteEXP.serial[playervar][u+1] ~= nil then
													if CorvetteEXP.serial[playervar][u+1] < 1 - addxp then
														CorvetteEXP.serial[playervar][u+1] = CorvetteEXP.serial[playervar][u+1] + addxp
														shippromoted = shippromoted + 1
												  end
												end
											end
										end
									end
								end
								if shippromoted > 0 then
									if claimer == Universe_CurrentPlayer() then
										UI_PlaySound("SFX_SHEEPBAA")
										local plural = "units"
										if shippromoted == 1 then
											plural = "unit"
										end
										Subtitle_AddAccordingToRace(claimer,"Crate found! "..shippromoted.." nearby "..plural.." promoted: "..floor(addxp*10000).." experience",3.72)
									end
								else		--no ships to add experience, just give RUs
									Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
								end
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "tech" then		--Technology
								local researchNUM = 0
								local iRace = Player_GetRace(claimer) + 1
								if Player_IsAlive(claimer) == 1 then
									dofilepath([[data:scripts/race.lua]])
									if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
										dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
										for z, iCount in research do
											if Player_HasQueuedResearch(claimer, iCount.Name) == 1 then
											  researchNUM = researchNUM + 1
											end
										end
									end
								end
								local totalcost = 0
								if researchNUM > 0 then
								  for z, iCount in research do
										if Player_HasQueuedResearch(claimer, iCount.Name) == 1 then	  
											Player_CancelResearch(claimer, iCount.Name)
											Player_GrantResearchOption(claimer, iCount.Name)
											totalcost = totalcost + iCount.Cost
											researchburned[claimer+1] = researchburned[claimer+1] + iCount.Cost
											print("Technology extracted from crates by player index: "..claimer..", game year: "..year..", item granted: "..iCount.Name)
										end
									end
									if claimer == Universe_CurrentPlayer() then
										UI_PlaySound("SFX_ScifiDataScanning")
										local plural = "research items"
										if researchNUM == 1 then
											plural = "research item"
										end
										Subtitle_AddAccordingToRace(claimer,"Crate found! Technology extracted: "..researchNUM.." "..plural..", total value: "..totalcost.." RUs",3.72)
									end
								else	--no ongoing research, just give RUs
									Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
								end
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "tech_ss" then		--Technology for sole survivor mode
								local researchNUM = 0
								local totalcost = 0
								local iRace = Player_GetRace(claimer) + 1
								local TechValueList = {500,800,1000,1300,1600,1900,2400,3000,4000,5000,6000,7000,8000,10000,99999,1000000}
		       		 	local TechTimeList = {20,25,30,35,40,45,50,60,70,80,90,100,150,260,500,10000}
		       		 	local TechHackValueLevel = Table_RandomElement(TechValueList)
		       		 	local TechHackTimeLevel = Table_RandomElement(TechTimeList)
								if Player_IsAlive(claimer) == 1 then
									dofilepath([[data:scripts/race.lua]])
									if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
										dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
										for z, iCount in research do
											if iCount.Cost >= 100 and iCount.Time >= 10 and iCount.Cost <= TechHackValueLevel and iCount.Time <= TechHackTimeLevel then		--grant research items based on their value and time
											  local SkipExceptions = 0
											  if String_ContainsNameBeginningAt(iCount.Name, "nebula") == 1 and CPU_Exist_Smart(claimer) == 1 then
											  	SkipExceptions = 1
											  elseif String_ContainsNameBeginningAt(iCount.Name, "MAXHEALTH_") == 1 then
											  	SkipExceptions = 1
											  elseif String_ContainsNameBeginningAt(iCount.Name, "HyperspaceCoreSummon") == 1 then
											  	SkipExceptions = 1
											  end
											  if SobGroup_Empty("star_sol") == 1 then
											  	if String_ContainsNameBeginningAt(iCount.Name, "solarshield") == 1 then
												  	SkipExceptions = 1
												  elseif String_ContainsNameBeginningAt(iCount.Name, "remotespaceshield") == 1 then
												  	SkipExceptions = 1
												  end
											  end
											  if SkipExceptions == 0 then
											  	if honorList[claimer+1] > random_pseudo(0,1000) or iCount.UpgradeType == 0 then		--more honour points grant more research items; always upgrade modifier items (to prevent non-linear upgrades)
												  	if Player_GrantResearchOption_SoleSurvivor(claimer, iCount.Name) == 1 then
													  	researchNUM = researchNUM + 1
													  	totalcost = totalcost + iCount.Cost
													  	researchburned[claimer+1] = researchburned[claimer+1] + iCount.Cost
													  	print("Technology extracted from crates by player index: "..claimer..", game year: "..year..", item granted: "..iCount.Name)
													  end
												  end
												end
											end
										end
									end
								end
								if researchNUM > 0 then
									if claimer == Universe_CurrentPlayer() then
										UI_PlaySound("SFX_ScifiDataScanning")
										local plural = "research items"
										if researchNUM == 1 then
											plural = "research item"
										end
										Subtitle_AddAccordingToRace(claimer,"Crate found! Technology extracted: "..researchNUM.." "..plural..", total value: "..totalcost.." RUs",3.72)
									end
								else	--no ongoing research, just give RUs
									Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
								end
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "hp" then		--Health
								local ship_healed = 0
								local heal_mode = "Nearby"
								if random_pseudo(1,10) == 1 then		--a small chance to heal all ships
									heal_mode = "All"
									if SobGroup_Empty("Player_Ships"..claimer) == 0 then
										local numships = SobGroup_SplitGroupReference("SingleShipToHealByCrate_SOB", "Player_Ships"..claimer, "AllShips", SobGroup_Count("Player_Ships"..claimer), 0)
										for u = 0, numships - 1, 1 do
											if SobGroup_HealthPercentage("SingleShipToHealByCrate_SOB"..u) > 0 and SobGroup_HealthPercentage("SingleShipToHealByCrate_SOB"..u) < 1 then
												SobGroup_SetHealth("SingleShipToHealByCrate_SOB"..u, 1)
												ship_healed = ship_healed + 1
											end
										end
									end
								else		--only heal nearby ships
									local heal_distance = 4000
									local shipsNUM = Crate_OutputPlayerShipsNearCrateToNewSOB(claimer, "splitcrate"..i, heal_distance, "crate_healnearby_SOB")
									if SobGroup_Empty("crate_healnearby_SOB") == 0 then
										local numships = SobGroup_SplitGroupReference("SingleShipToHealByCrate_SOB", "crate_healnearby_SOB", "Player_Ships"..claimer, SobGroup_Count("crate_healnearby_SOB"), 0)
										for u = 0, numships - 1, 1 do
											if SobGroup_HealthPercentage("SingleShipToHealByCrate_SOB"..u) > 0 and SobGroup_HealthPercentage("SingleShipToHealByCrate_SOB"..u) < 1 then
												SobGroup_SetHealth("SingleShipToHealByCrate_SOB"..u, 1)
												ship_healed = ship_healed + 1
											end
										end
									end
								end
								if ship_healed > 0 then
									if claimer == Universe_CurrentPlayer() then
										if heal_mode == "Nearby" then
											UI_PlaySound("SFX_HeavenGate")
										else
											UI_PlaySound("SFX_Hallelujah")
										end
										local plural = "ships"
										if ship_healed == 1 then
											plural = "ship"
										end
										Subtitle_AddAccordingToRace(claimer,"Crate found! "..heal_mode.." "..plural.." healed: "..ship_healed,3.72)
									end
								else		--no ships to add experience, just give RUs
									Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
								end
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_health" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_health", 0.01, 1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_speed" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_speed", 0.01, 0.1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_repair" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_repair", 0.01, 1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_damage" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_firepower", 0.01, 1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_aim" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_accuracy", 0.01, 1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_nebula" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_radiation", 0.1, 1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "up_sensor" then
								Crate_UpgradeSoleSurvivorStatus(claimer, "solesurvivor_sensor", 0.01, 1)
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							elseif awesome_stuff == "death" then		--1000 WAYS TO DIE! HEHEHEHEHEHE!!!
								local blast_distance = 4000
								local shipsNUM = Crate_OutputPlayerShipsNearCrateToNewSOB(claimer, "splitcrate"..i, blast_distance, "crate_blastnearby_SOB")
								if shipsNUM > 0 then
									SobGroup_Create("Temp_MegDummyRepulsor")
									SobGroup_Clear("Temp_MegDummyRepulsor")
									Volume_AddSphere("VOL_MegDummyRepulsor"..i, SobGroup_GetPosition("splitcrate"..i), 0)
									Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
									SobGroup_SpawnNewShipInSobGroup(-1, "meg_dummy_repulsor", "meg_Repulsor", "Temp_MegDummyRepulsor", "VOL_MegDummyRepulsor"..i)
									SobGroup_SobGroupAdd("SOB_MegDummyRepulsor", "Temp_MegDummyRepulsor")
									SobGroup_Attack(0, "Temp_MegDummyRepulsor", "crate_blastnearby_SOB")
									Volume_Delete("VOL_MegDummyRepulsor"..i)
									if claimer == Universe_CurrentPlayer() then
										UI_PlaySound("SFX_Static")
										Subtitle_AddAccordingToRace(claimer,"Crate found! Self-destruction sequence initiated! ",3.72)
									end
								else
									Crate_PlayerReceiveRUs(claimer, random_pseudo(1000,20000))
									Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
								end
							else		--RUs for default
								Crate_PlayerReceiveRUs(claimer, random_pseudo(5000,100000))
								Crate_Unbox("splitcrate"..i, "Unbox")	--UNBOXING EXPLOSION
							end
						end
					end
				end
			end
		end
	end
	if GameRulesName == "Simplex Sole Survivor" then
		SoleSurvivor_SetSupporterStats()
	end
	Rule_RandomInterval("crates_check", 1.1667, 0)
	--print("crates_check -- End")
end

function SoleSurvivor_SetSupporterStats()
	--set stats for players (only one supporter for an alliance)
	local playerIndex = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
    	local allied_ID = Supporter_GetAlliedID(playerIndex)
    	if SobGroup_Empty("supporter"..allied_ID) == 0 then
    		for z, iCount in SoleSurvivorStats do
    			local hp = iCount[allied_ID+2]
    			if hp > 0 then
						SobGroup_SetHardPointHealth_Smart("supporter"..allied_ID, iCount[1], hp)
						if allied_ID ~= playerIndex then
							if SobGroup_Empty("supporter"..playerIndex) == 0 then
								if SobGroup_GetHardPointHealth("supporter"..playerIndex, iCount[1]) ~= 0 then
									SobGroup_SetHardPointHealth_Smart("supporter"..playerIndex, iCount[1], 0)
								end
							end
						end
					end
					--print(""..iCount[1].." value for player index "..playerIndex.." is: "..hp..", actual subsystem health is: "..SobGroup_GetHardPointHealth("supporter"..playerIndex, iCount[1]))
				end
    	end
    end  
    playerIndex = playerIndex + 1
  end
end

function Crate_UpgradeSoleSurvivorStatus(playerIndex, subsystem, upgrade_min, upgrade_max)
	local upgrade_success = 0
	local max_multiplier = 10000
	if subsystem == "solesurvivor_speed" then
		max_multiplier = 10
	end
	local upgrade_ratio = random_pseudo(upgrade_min*1000, upgrade_max*1000)/1000
	if upgrade_ratio > max_multiplier*0.9999 then
		upgrade_ratio = max_multiplier*0.9999
	end
	local upgrade_value = upgrade_ratio/max_multiplier
	for z, iCount in SoleSurvivorStats do
		if subsystem == iCount[1] then
			local lasthealth = iCount[playerIndex+2]
			local newhealth = lasthealth + upgrade_value
			if newhealth > 1 then
				newhealth = 1					
			end
			SoleSurvivorStats[z][playerIndex+2] = newhealth
			if newhealth > lasthealth then
				upgrade_success = 1
			end
			--add stats to all allies
			for iPlayerIndex = playerIndex, Universe_PlayerCount() - 1 do
				if Player_IsAlive(iPlayerIndex) == 1 and iPlayerIndex ~= playerIndex then
					if AreAllied(playerIndex, iPlayerIndex) == 1 and AreAllied(iPlayerIndex, playerIndex) == 1 then
						local allied_lasthealth = iCount[iPlayerIndex+2]
						local allied_newhealth = allied_lasthealth + upgrade_value
						if allied_newhealth > 1 then
							allied_newhealth = 1					
						end
						SoleSurvivorStats[z][iPlayerIndex+2] = allied_newhealth
					end
				end
			end
			break
		end
	end
	if upgrade_success == 1 then
		if playerIndex == Universe_CurrentPlayer() then
			if subsystem == "solesurvivor_firepower" then
				UI_PlaySound("SFX_choose_ascension_perk_01")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit firepower upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			elseif subsystem == "solesurvivor_accuracy" then
				UI_PlaySound("SFX_event_administrative_work_02")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit weapon accuracy upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			elseif subsystem == "solesurvivor_health" then
				UI_PlaySound("SFX_building_construction_complete_01")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit armour upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			elseif subsystem == "solesurvivor_repair" then
				UI_PlaySound("SFX_notification_repair_fleet_01")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit self-repair speed upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			elseif subsystem == "solesurvivor_sensor" then
				UI_PlaySound("SFX_space_cloud_death_01")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit sensor range upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			elseif subsystem == "solesurvivor_radiation" then
				UI_PlaySound("SFX_hive_minions_moving_out_04")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit radiation resistance upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			elseif subsystem == "solesurvivor_speed" then
				UI_PlaySound("SFX_ship_engine_01")
				Subtitle_AddAccordingToRace(playerIndex,"Crate found! Unit speed upgraded by "..(floor(upgrade_ratio*100)).."%",3.72)
			end
		end
	else
		Crate_PlayerReceiveRUs(playerIndex, random_pseudo(1000,20000))
	end
	return upgrade_success
end

function Crate_Unbox(ship, fx)
	FX_StartEvent(ship, fx)
	SobGroup_SetHealth(ship, 0)
end

function Crate_SetMeshFX(ship)
	local parsed_month, parsed_day = date_parse("month"), date_parse("day")
	--parsed_month, parsed_day = 10, 31 --for testing
	for z, fx in {"Default","Crate_HW1","Crate_HW2","Pumpkin","PumpkinFace"} do
		FX_StopEvent(ship, fx)
	end
	if parsed_month == 10 and parsed_day == 31 then	--Halloween
		FX_StartEvent(ship, "PumpkinFace")
	elseif parsed_month == 10 or parsed_month == 11 then	--Thanksgiving months (Canada and US)
		FX_StartEvent(ship, "Pumpkin")
	else
		local fx={"Default","Crate_HW1","Crate_HW2"}
		FX_StartEvent(ship, fx[random(1,getn(fx))])
	end
end

function Crate_OutputPlayerShipsNearCrateToNewSOB(playerIndex, crate, distance, outputSOB)
	Update_AllShips()
	SobGroup_Create("Temp_AllShipsNearOneCrate_SOB")
	SobGroup_Clear("Temp_AllShipsNearOneCrate_SOB")
	SobGroup_FillProximitySobGroup ("Temp_AllShipsNearOneCrate_SOB", "AllShips", crate, distance)
	SobGroup_Create(outputSOB)
	SobGroup_Clear(outputSOB)
	SobGroup_FillCompare(outputSOB, "Player_Ships"..playerIndex, "Temp_AllShipsNearOneCrate_SOB")
	if SobGroup_Empty(outputSOB) == 1 then
		return 0
	else
		return SobGroup_Count(outputSOB)
	end
end

function Crate_PlayerReceiveRUs(playerIndex, RUs)
	local RU_added = 0
	if Player_GetRU(playerIndex) < RUMaxCapacityList[playerIndex+1] then
		RU_added = 1
	end
	--add RUs anyway
	AccoladesAddRU(playerIndex, RUs)
	if playerIndex == Universe_CurrentPlayer() then
		if Player_GetRace(playerIndex) == Race_Raider then
			UI_PlaySound("SFX_YouGotTheMoney")	--"You got the money, you are god!"
		else
			UI_PlaySound("SFX_cash1")
		end
		Subtitle_AddAccordingToRace(playerIndex,"Crate found! Resources recovered: "..RUs.." RUs",3.72)
	end
	return RU_added
end

function solFX()
  if SobGroup_Empty("star_sol") == 0 then
  	FX_StopEvent("star_sol", "flare")
  	FX_StartEvent("star_sol", "flare")
  end	 
end

function Megalith_AddMegalite(owner, shiptype, position, SOB_to_add)	--spawns a new megalith in game (for endgame crisis etc.); the orientation is always fixed though and that could be an aesthetic problem
	local success = 0
	local i = MaxCount[4] + 1	--use the table count of the existing megaliths to get a new index 
	SobGroup_Create("megalite"..i)
	if SobGroup_Empty("megalite"..i) == 1 then
		local unique_serial = random_pseudo(0,50000)
		Volume_AddSphere("VOL_MegalithSpawnLocation"..unique_serial, position, 10000)
		SobGroup_SpawnNewShipInSobGroup(owner, shiptype, "NewMegalith", "megalite"..i, "VOL_MegalithSpawnLocation"..unique_serial)
		print("Added new megalite "..shiptype.." at position "..Vector_tostring(position)..", game year: "..year)
		Volume_Delete("VOL_MegalithSpawnLocation"..unique_serial)
    SobGroup_AbilityActivate("megalite"..i, AB_Scuttle, 0)
		SobGroup_SetSwitchOwnerFlag("megalite"..i, 0)
		SobGroup_SobGroupAdd("megalitenoowner", "megalite"..i)
		SobGroup_SobGroupAdd("all_capturablemegaliths", "megalite"..i)
		SobGroup_SobGroupAdd(SOB_to_add, "megalite"..i)
		MaxCount[4] = MaxCount[4] + 1	--expand the existing table count by 1
		success = 1
	end
	return success
end

function EndgameCrisis()
	local alive_players = Universe_CountPlayersAlive()
	local available_crises = {"meg_tmatmegaship","meg_bentusiexchange","meg_researchstation","meg_ghostship","meg_venator_destroyer","meg_allegiance_destroyer","meg_implacable_cruiser","meg_vengence_ssd","meg_eclipse_ssd","meg_class_iii_platform","meg_bear"}
	--generate crisis data
	local CrisisData = {}		--stores all data for crisis mode, use ship names as keys
	for z, crisis in available_crises do
		CrisisData[crisis] = {}
		--default data
		CrisisData[crisis].faction = ""
		CrisisData[crisis].details = "<c=cef6f5></c>"
		CrisisData[crisis].sound = "SFX_fleet_under_attack"
		CrisisData[crisis].summary = "Unexpected Event"
		CrisisData[crisis].picture = "automated_dreadnought"
		CrisisData[crisis].spawn_count = 1
		--generate spawn count data for each type of crisis
		if Table_ElementIsIn(crisis, {"meg_venator_destroyer"}) == 1 then
			CrisisData[crisis].spawn_count = max(8,alive_players*2)
		elseif Table_ElementIsIn(crisis, {"meg_tmatmegaship"}) == 1 then
			CrisisData[crisis].spawn_count = max(6,alive_players*2)
		elseif Table_ElementIsIn(crisis, {"meg_bentusiexchange","meg_allegiance_destroyer", "meg_implacable_cruiser", "meg_class_iii_platform"}) == 1 then
			CrisisData[crisis].spawn_count = max(2,alive_players)
		end
		--generate UI data for each type of crisis
		if crisis == "meg_ghostship" then
			CrisisData[crisis].details = "<c=cef6f5>A Ghost Ship has been discovered. Its configuration doesn't resemble any known design in the galaxy. It seems to have been inactive for millions of years, but hull scan indicates abnormal energy fluctuations under its skin...</c>"
			CrisisData[crisis].sound = "SFX_SpaceCow"
			CrisisData[crisis].summary = "Ghost Ship"
			CrisisData[crisis].picture = "space_debris"
		elseif Table_ElementIsIn(crisis, {"meg_venator_destroyer", "meg_allegiance_destroyer", "meg_implacable_cruiser", "meg_vengence_ssd", "meg_eclipse_ssd", "meg_class_iii_platform"}) == 1 then
			local species_names = {"Rexor","Cylenth","Biotronic","Biometatron","Zeleth","Ascended","Biomorph","Altron","Viirian","Vooran","Voxxar","Ventrilion","Mechanoid","Deceptor","Bionic","Dominor","Vendroid","Metadroid","Metabionic","Mechamorph","Supravex","Neo-Organic","Aenoic","Cerban","Transitron","Vektorian","Enimatronic","Neomachina","Transitorian","Mimicron","Vortron","Cyberion","Shazarak","Mechazur","Zero-Zero-One","Prime","Zenak","Omni","DAAR","Tronzaru","Techarus","Jonus","Iribot","Silicron","Dekron","Synthoid","Cydran","Kelbrid","Model-16","NEX","Mictor","Alari","Mireesh","Triech","Vrinn","Cevanti","Mishar","Fareen","Yldar","Korinth","Sildor","Nagyari","Kobarian","Hesukar","Giroid","Akkano","Kroll","Orassian","Aramathi","Immutharan","Hiffnar","Zaanami","Estwani","Vailon","Raltek","Birnathi","Othari","Evandari","Bothrian","Dorbolan","Fevarian","Kenjodan","Glyrran","Pallyrian","Quvarian","Qell'Nudar","Valdari","Igarian","Adnoran","T'Jell","Tarassi","Sinrath","Kaan-Visam","Tebazoid","Kazam","Qu'Vab","Bhenn'Thell","Tendra-Zuhn","Hahn-Mur","Menjeti","Hissma","Tycan","Canthari","Otaga","Zracon","Thembolon","Jhoolian","Djunn","Hulfir","Ul-Tur","Tyrathian","Kithri","Jibru","Hazar","Kar-Du","Uriy","Gorf","Zik-Mok","Neborite","Syldaean","Mesh'Ben","Bothrazoid","Makaru","Sojagg","Vat'na-Ka","Ishni","Themlar","Tezhnid","Pithok","Cithin","Thimoid","Rutharian","Jhabbanid","Saathid","Ik-Nur-Val","Haddam","Xeltek","Zithorian","Hantak","Rontor","Tal'Akkur","Myrran","Athallid","Entheri","Chimm","Shabtak","Yibrak","Qiramulan","Ethir","Avtyrran","Pirak","Izki","Pakari","Wi-Ziraki","Maggar","Krithakkan","Rethellian","Kammarian","Anathurian","Zuifvan","Reshethi","Dethakkan","Ikarzuri","Vhemm","Tendrakkian","Baanthurian","Cormathani","Kirillian","Beldross","Jurinn","Ziiran","Athanebian","Diri","Hydari","Cirrulan","Yaanari","Ubaric","Kedeshi","Tebadoran","Bessadon","Lyrite","Sathori","Suramo","Knatza","Bryll","Raxar","Shantari","Saiiban","Ikaanan","Avarrian","Khessam","Cynn","Yeon","Tezekian","Khemplar","Vissari","Rackuddon","Tiyal","Keerim","Fiiral","Cynur","Imari","Izirian","Figyar","Sibulan","Miidari","Spyran","Bruggan","Inari","Penthulan","Rixi","Baviir","Ospranian","Erissu","Skanuri","Hiran","Aztani","Karabnar","Ymorz","Bilnoc","Larongo","Uthonian","Elaaminid","Heejam","Hann'Felir","Cyggan","Gorothi","Connisthian","Nuurian","Genoggian","Dabulan","Uthabulan","Gurite","Hythean","Tebbran","Kundan","Sejethari","Bakturian","Seban","Jakly","Bavi","Endurga","Xabir","Jubaran","Norani","Urzo","AI","Tumbator","Onotach","Yapathi","Rek'Thalar","Zum","Ugarlak","Glost-Werheni","Meko'Nass","Oklarr","Drull'Perfen","Photecian","Wessari","Lahtrepian","Ekwynian","Ragerian","Pouz-Jok","Jusstkan","Klaggian","Uqo'Praknar","Oned'Qarak","Ruphaari","Qwe'Pulci","Groknaploran","K'Taknor","Gagassi","Hadadeshi","Obevni","Finu","Obbha","Ganlarev","Buhavilaa","Ogi-Nollox","Celimy","Pogovon","Qasvalyvia","Avabbian","Lolehndra","Reyubb","Varelviv","Zeppadroggan","Buvhondon","Valmennax","Huvidu-Zaan","Provalguvor","Qlorvinserian","Wulhubb","Caphevad","Vool","Frubralav","Fjasivlin","Pobelin","Laachax","Udkavongo","Screk","Xanyr","Zaacplot","Vurxac","Opalglec","Valurt","Natfankan","Husko","Zaxxoid","Dabbax","Zemmerpuk","Trakpocian","Ytrellan","Savix'Qast","Qopinjaxi","Najklax","Sakyt","Backatta","Xaplo","Uindar","Eruxo","Spuxulac","Multyx","Cilxtac","Ztrakpor","Tchaaskeran","Yax'Kalock","Vun-Okon","Rax'Thalak","Thek'Qlak","Bos'Pachtux","Mect-Pux","Othethi","Ox'Braxi","Zaydran","Nharr","Zukakkan","Sek-Lokkar","Netraxi","Dima'Xanian","Vag-Oross","Kalaxenan","Fex'Klanga","Tuxkan","Gox","Rak'Thalak'Nak","Bokasheran","Adeex","Rothak","Steccashi","Xu'Lokako","Gargaxton","Lox'Ungrak-Va","Uva-Xavani","Qvefoz","Jas'Gavaz","Yv'Zorak","Sintomoroi","Qix'Lufran","Mith-Fell","Till'Lynesi","Jess'Inax","Boki","Ess'Jaggon","Juvan","Iztran","Helvan","Ozkox","Fafossan","Gulk-Furki","Haahn","Twax'Ihdar","Uv-Xantt","Kraxroz","Yssravannar","Haspalv","Pelx-Cradonian","Jaazijan","Qravadox","Djomar","Mathin","Malwegoll","Alvothari","Hathgum","Uri","Havoll","Ymacera","Jogollwa","Usanace","Havarigga","Slerpanor","Fellnoll","Sirgogg","Obadin","Yalon","Dyss","Gwesibor","Andigonj","Grollferp","Sondrithan","Hjannarthi","Domanna","Wacegi","Norillga","Lagin'Chuuz","Moij-Huxgan","Lozavata","Queptilium","Lilarobius","Vetirisius","Belmacosa","Panaxala","Ganvius","Caloctora","Vivisandia","Sidimatus","Mandasura","Mirovandia","Pelisimus","Lavis","Raxycodium","Khell'Zen","Sutharian","Velutarian","Zelvan","Quenti","Rihi'Nar","Prossnakan","Mitron","Cevelli","Panuri","Yl'Khahan","Giranshu","Bebaki","Alvanian","Butterfly","Orion","Three Body","Zeitgeist","DX3906","Interstellar","Intergalactic","Cosmic","Vacuum Energy","End Time","Prophecy","Kerbal","New Horizon","Thug Life","World Peace","Keyboard","Elitist","Hairless","Feathered","Scaly","Insight","Origin","Sigma","Epsilon","Alpha","Zeta","Gamma","Beta","Delta","Omega","Psychic","Cyber"}
			local empire_names = {"Empire","Imperium","Hegemony","Autocracy","Combine","Hierarchy","Republic","Commonwealth","Union","State","Authority","Alliance","Confederation","Confederacy","League","Consortium","Conglomerate","Cartel","Directorate","Mandate","Coalition","Commonality","Nation","Sovereignty","Administration","Council","Polity","Assembly","Cooperative","Concordat","Accord","Order","Foundation","Covenant","Theocracy","Conclave","Alignment","Technocracy","Consensus","Kingdom","Principality","Compact","Syndicate","Hive","Consciousness","Entity","Unity","Collective","Prime","Multitude","Organism","Destroyers","Reavers","Exterminators","Annihilators","Eradicators","Purifiers","Bloodborn","Executioners","Desolators","Punishers","Crusaders","Star Hunters","Silencers","Death Lords","Decimators","Obliterators","Slayers","Reapers","Company","Stellar Industries","Corporation","Partnership","StarCorp","Synergetics","Systems","Manufacturing","Star Conglomerate","Denomination","Consortia","Fleet","Armada","Expedition","Guild","Builders","Witches","Drones","Raiders","Marauders","Runners","Looters","Warriors","Fighters","Defenders","Protectors","Guardians","Watchers","Listeners","Progenitors","Saints","Harvesters","Reclaimers","Reconquerors","Restorers","Enforcers","Regulators","Mediators","Network","Grid","Junction","Kernel","Hub","Matrix","Nexus","Core","Linkage","Confluence","Interface","Runtime","Directive","Awareness","Sentience","Nucleus","Animus","Erasers","Extinguishers","Expungers","Eliminators","Extirpators","Collectors","Assimilators","Accumulators","Replicators","Ascendency","Society","Academy","Institute","Association","Community","Sisterhood","Brotherhood","Organization","Clique","Joint Venture","Traders","Insiders","Think Tank","Custodians","Curators","Legislators"}
			local faction = ""..Table_RandomElement(species_names).." "..Table_RandomElement(empire_names)
			local introduction = "<c=cef6f5>An unidentified vessel has just appeared on the battlefield, claiming to be the </c>"
			if CrisisData[crisis].spawn_count > 1 then
				introduction = "<c=cef6f5>A group of unidentified vessels have just appeared on the battlefield, referring to themselves as the </c>"
			end
			CrisisData[crisis].faction = faction
			CrisisData[crisis].details = ""..introduction.."<c=FF0000>"..faction.."</c>".."<c=cef6f5>. No information is known about this entity. The intention is likely hostile...</c>"
			CrisisData[crisis].sound = "SFX_fleet_under_attack"
			CrisisData[crisis].summary = "Alien "..Table_RandomElement({"Fleet","Antagonist","Adversary","Aggressor","Invasion","Incursion","Activity","Presence"})
			CrisisData[crisis].picture = "automated_dreadnought"
			if crisis == "meg_class_iii_platform" then
				CrisisData[crisis].summary = "Enigmatic Fortress"
				CrisisData[crisis].picture = "enigmatic_fortress"
			elseif CrisisData[crisis].spawn_count > 1 then
				CrisisData[crisis].picture = "gray_goo_ships"
			end
		elseif crisis == "meg_researchstation" then
			CrisisData[crisis].details = "<c=cef6f5>A stream of what appears to be asteroid fragments are heading our way at orbital velocity. It is unclear whether this is a natural phenomenon or calculated attack. Impact is imminent...</c>"
			CrisisData[crisis].sound = "SFX_AirRaidSiren"
			CrisisData[crisis].summary = "Meteor Shower"
			CrisisData[crisis].picture = "asteroid_approaching_planet"
		elseif crisis == "meg_bentusiexchange" then
			CrisisData[crisis].details = "<c=cef6f5>Massive anomaly detected! A Bentusi fleet has arrived and they are not responding to any hails. Their weapon system is charging up and we are being locked on...</c>"
			CrisisData[crisis].sound = "SFX_RedAlert"
			CrisisData[crisis].summary = Table_RandomElement({"Trade War","Bentusi Attack"})
			CrisisData[crisis].picture = "fallen_empire_awakes"
		elseif crisis == "meg_tmatmegaship" then
			CrisisData[crisis].details = "<c=cef6f5>Several asteroid-shaped megaships have wandered into sight. There appear to be countless microorganisms living inside, feeding on the radioactivity. Some level of intelligence is evident, but we are unable to communicate with them...</c>"	--length limit is 291
			CrisisData[crisis].sound = "SFX_SpaceWhale"
			CrisisData[crisis].summary = Table_RandomElement({"Intelligent Lithoautotrophs","Lithophilic Superorganism","Rockbound Chemoautotrophs"})
			CrisisData[crisis].picture = "mining_station"
		elseif crisis == "meg_bear" then
			CrisisData[crisis].faction = Table_RandomElement({"A.K.A. Liberty Prime","The True North","He Whose Hand Shapes What Is","Gastronomical Wonder","Charismatic Megafauna","Tunnel Bear","The Prophecy Is True"})
			CrisisData[crisis].details = "<c=cef6f5>A super ultra capital ship has exited from hyperspace! Hull scan indicates some kind of furry bioship design, but there are no signs of weapons or propulsion system. A massive energy field is building up from its inside...</c>"	--length limit is 291
			CrisisData[crisis].sound = "SFX_BringSajuukToBear"
			CrisisData[crisis].summary = Table_RandomElement({"Bring Sajuuk to Bear","Ursa Major"})
			CrisisData[crisis].picture = "bring_sajuuk_to_bear"
		end
	end
	local crisis_count = 1	--Universe_CountPlayersAlive()
	local crisis_time = floor(Vector_mean(MapInnerBounds)^(0.35*endgamecrisis_timer))	--larger maps will have longer wait time for the crisis to start (600000 m = 105 years, 60000 m = 47 years); 0 for testing
	if L4_cache.EndgameCrisisYear ~= crisis_time then
		L4_cache.EndgameCrisisYear = crisis_time
		print("Endgame Crisis will occur at year "..L4_cache.EndgameCrisisYear)
	end
	--start crisis
	if year >= L4_cache.EndgameCrisisYear then		--would be better if the crisis start year can be set in skirmish settings, but the number of options already hit the game engine limit, so any new option will cause the game to crash
		if getn(L4_cache.EndgameCrisis) < crisis_count then	--every time a new megalith is spawned, its name is added to this list
			--choose crisis
			local crisis = Table_RandomElement(available_crises)	--same with the ship name to be spawned
			local info = CrisisData[crisis]
			local interrupt = 0
			if Table_ElementIsIn(crisis, {"meg_ghostship","meg_researchstation"}) == 1 and SobGroup_AreAnyOfTheseTypes("all_capturablemegaliths", crisis) == 1 then
				interrupt = 1
			end
			if Table_ContainElement(L4_cache.EndgameCrisis, crisis) == 0 and interrupt == 0 then
				local success = 0
				print("Beginning Endgame Crisis: "..crisis..", year: "..year)
				for n=1, CrisisData[crisis].spawn_count, 1 do
					local position = {0,0,0}
					for i=1,3,1 do
						position[i] = 0.5*random_pseudo(-MapInnerBounds[i], MapInnerBounds[i])	--random coordinates within map boundaries
					end
					SobGroup_Create("Temp_CrisisSpawnSOB")
					SobGroup_Clear("Temp_CrisisSpawnSOB")
					if Megalith_AddMegalite(-1, crisis, position, "Temp_CrisisSpawnSOB") == 1 then
						SobGroup_SobGroupAdd("SOB_EndgameCrisis", "Temp_CrisisSpawnSOB")
						local lastcount = getn(L4_cache.EndgameCrisis)
						L4_cache.EndgameCrisis = Table_InsertUnique(L4_cache.EndgameCrisis, {crisis})
						if lastcount < getn(L4_cache.EndgameCrisis) then
							success = 1
						end
						if SobGroup_AreAnyOfTheseTypes("Temp_CrisisSpawnSOB", "meg_venator_destroyer, meg_allegiance_destroyer, meg_implacable_cruiser, meg_vengence_ssd, meg_eclipse_ssd, meg_class_iii_platform") == 1 then
		          local megalitenoowner17 = Ping_AddSobGroup(CrisisData[crisis].faction, "megalitenoowner17", "Temp_CrisisSpawnSOB")
		          Ping_LabelVisible(megalitenoowner17, 1)
				      Ping_AddDescription(megalitenoowner17, 0, "Overwhelming Firepower")
				      SobGroup_AddToPlayerGroups("Temp_CrisisSpawnSOB", {"SOB_CrisisCapitalTargets"})
				    elseif SobGroup_AreAnyOfTheseTypes("Temp_CrisisSpawnSOB", "meg_bentusiexchange") == 1 then
							SobGroup_AbilityActivate("Temp_CrisisSpawnSOB", AB_Attack, 1)
				    	local megalitenoowner16 = Ping_AddSobGroup("(CLOSED)", "megalitenoowner16", "Temp_CrisisSpawnSOB")
		          Ping_LabelVisible(megalitenoowner16, 1)
				      Ping_AddDescription(megalitenoowner16, 0, "Roses Are Red")
				      Ping_AddDescription(megalitenoowner16, 1, "Violets Are Blue")
				      Ping_AddDescription(megalitenoowner16, 2, "Bankruptcy Is Most Unfortunate")
				      SobGroup_AddToPlayerGroups("Temp_CrisisSpawnSOB", {"SOB_CrisisCapitalTargets"})
				    elseif SobGroup_AreAnyOfTheseTypes("Temp_CrisisSpawnSOB", "meg_tmatmegaship") == 1 then
				    	local megalitenoowner17 = Ping_AddSobGroup(CrisisData[crisis].summary, "megalitenoowner17", "Temp_CrisisSpawnSOB")
		          Ping_LabelVisible(megalitenoowner17, 1)
				      Ping_AddDescription(megalitenoowner17, 0, "It's Alive!")
				      SobGroup_AddToPlayerGroups("Temp_CrisisSpawnSOB", {"SOB_CrisisCapitalTargets"})
				    elseif SobGroup_AreAnyOfTheseTypes("Temp_CrisisSpawnSOB", "meg_bear") == 1 then
				    	local megalitenoowner17 = Ping_AddSobGroup(CrisisData[crisis].faction, "megalitenoowner17", "Temp_CrisisSpawnSOB")
		          Ping_LabelVisible(megalitenoowner17, 1)
				      Ping_AddDescription(megalitenoowner17, 0, "Deadly Firepower")
				      SobGroup_AddToPlayerGroups("Temp_CrisisSpawnSOB", {"SOB_CrisisCapitalTargets"})
				    end
					end
				end
				if success == 1 then	--crisis spawned, alert the player in UI
					UI_PlaySound(CrisisData[crisis].sound)
					Subtitle_AddAccordingToRace(Universe_CurrentPlayer(), "<c=cef6f5>Endgame Crisis:</c>"..Time_PrintYear().." "..CrisisData[crisis].details, 5)	--3.72
					UI_SetScreenEnabled("crisis", 1)
					UI_SetScreenVisible("crisis", 1)
					UI_SetTextLabelText("crisis", "lblTitle", "ENDGAME CRISIS"..Time_PrintYear())
					UI_SetTextLabelText("crisis", "lblSubTitle", ""..CrisisData[crisis].summary)
					local all_pictures = {"automated_dreadnought","enigmatic_fortress","gray_goo_ships","space_debris","asteroid_approaching_planet","fallen_empire_awakes","mining_station","bring_sajuuk_to_bear"}
					UI_ShowSingleElementInList("crisis", CrisisData[crisis].picture, all_pictures)
					UI_SetTextLabelText("crisis", "lblDescription1", ""..CrisisData[crisis].details)
					UI_ShowRandomElement("crisis", "btnOk")
				end
			end
		end
	end
end

function SalvageCleaning()	--spawn neutral collectors to clean up the garbage for performance maintenance; not useful: they can harvest, but they can't autodock to unload
	if year >= 0 then
		SobGroup_Create("SalvageCleaningCollector_SOB")
		SobGroup_Create("SalvageCleaningDocker_SOB")
		local collector_types = {"rad_resourcecollector"}
		local docker_types = {"rad_resourcecontroller"}
		local SOB_to_add = "ghosts"	--for interface display
		if SobGroup_Count("SalvageCleaningCollector_SOB") < 16 then	--spawn collector
			local shiptype = Table_RandomElement(collector_types)
			local position = {0,0,0}
			for i=1,3,1 do
				position[i] = 0.5*random_pseudo(-MapInnerBounds[i], MapInnerBounds[i])	--random coordinates within map boundaries
			end
			Volume_AddSphere("VOL_CollectorSpawnLocation", position, 10000)
			SobGroup_Create("Temp_SpawningSOB")
			SobGroup_Clear("Temp_SpawningSOB")
			SobGroup_SpawnNewShipInSobGroup(-1, shiptype, "NewCollector", "Temp_SpawningSOB", "VOL_CollectorSpawnLocation")
			print("Added new salvage cleaning collector "..shiptype.." at position "..Vector_tostring(position)..", game year: "..year)
			Volume_Delete("VOL_CollectorSpawnLocation")
			SobGroup_SobGroupAdd(SOB_to_add, "Temp_SpawningSOB")
	    local megalitenoowner13 = Ping_AddSobGroup("Garbage Cleaner", "megalitenoowner13", "Temp_SpawningSOB")
	    Ping_LabelVisible(megalitenoowner13, 1)
	    Ping_AddDescription(megalitenoowner13, 0, "Lucrative Space Business")
			--SobGroup_AvoidanceIgnoreAllShipsInUniverse("Temp_SpawningSOB")
			SobGroup_SetInvulnerability("Temp_SpawningSOB", 1)
			SobGroup_SobGroupAdd("SalvageCleaningCollector_SOB", "Temp_SpawningSOB")
			SobGroup_Resource(0, "Temp_SpawningSOB")
		end
		if SobGroup_Count("SalvageCleaningCollector_SOB") < 3 then	--spawn docker
			local shiptype = Table_RandomElement(docker_types)
			local position = {0,0,0}
			for i=1,3,1 do
				position[i] = 0.5*random_pseudo(-MapInnerBounds[i], MapInnerBounds[i])	--random coordinates within map boundaries
			end
			Volume_AddSphere("VOL_DockerSpawnLocation", position, 10000)
			SobGroup_Create("Temp_SpawningSOB")
			SobGroup_Clear("Temp_SpawningSOB")
			SobGroup_SpawnNewShipInSobGroup(-1, shiptype, "NewDocker", "Temp_SpawningSOB", "VOL_DockerSpawnLocation")
			print("Added new salvage cleaning docker "..shiptype.." at position "..Vector_tostring(position)..", game year: "..year)
			Volume_Delete("VOL_DockerSpawnLocation")
			SobGroup_SobGroupAdd(SOB_to_add, "Temp_SpawningSOB")
	    local megalitenoowner13 = Ping_AddSobGroup("Garbage Cleaner", "megalitenoowner13", "Temp_SpawningSOB")
	    Ping_LabelVisible(megalitenoowner13, 1)
	    Ping_AddDescription(megalitenoowner13, 0, "Lucrative Space Business")
			--SobGroup_AvoidanceIgnoreAllShipsInUniverse("Temp_SpawningSOB")
			SobGroup_SetInvulnerability("Temp_SpawningSOB", 1)
			SobGroup_AbilityActivate("Temp_SpawningSOB", AB_Attack, 0)
			SobGroup_SetCaptureState("Temp_SpawningSOB", 0)
			SobGroup_SobGroupAdd("SalvageCleaningDocker_SOB", "Temp_SpawningSOB")
			if SobGroup_GetHardPointHealth("Temp_SpawningSOB", "experience") > 0.0001 then
				SobGroup_SetHardPointHealth("Temp_SpawningSOB", "experience", 0.0001)
			end
		end
		--begin garbage cleaning operation
		if SobGroup_Empty("SalvageCleaningCollector_SOB") == 0 and SobGroup_Empty("SalvageCleaningDocker_SOB") == 0 then
			SobGroup_GuardSobGroup("SalvageCleaningDocker_SOB", "SalvageCleaningCollector_SOB")
			local numships = SobGroup_SplitGroupReference("SingleNeutralCollector_SOB", "SalvageCleaningCollector_SOB", "SalvageCleaningDocker_SOB", SobGroup_Count("SalvageCleaningCollector_SOB"))
			for i = 0, numships - 1, 1 do
				local ship = "SingleNeutralCollector_SOB"..i
				if SobGroup_IsDoingAbility(ship, AB_Harvest) == 0 and SobGroup_IsDoingAbility(ship, AB_Salvage) == 0 then
					SobGroup_Resource(0, ship)
				end
			end
		end
	end
end

function megalith()
	--print("megalith -- Start")
	Update_AllShips()
	
---spawn and despawn crates according to the skirmish setting
	if crates > 0 then
		--spawning frequency: how many crates do you spawn in one cycle (lifespan)?
		local crate_frequency = 10
		local upper_limit = 3
		local odds = 10
		if crates == 1 then
	  	crate_frequency = 4
	  	upper_limit = 3
	  elseif crates == 2 then
	    crate_frequency = 6
	    upper_limit = 8
	  elseif crates == 3 then
	    crate_frequency = 8
	    upper_limit = 13
	  elseif crates == 4 then
	    crate_frequency = 10
	    upper_limit = 18
	  elseif crates == 5 then		--uber for solesurvivor mode
	    crate_frequency = 10
	    upper_limit = 200
	    odds = 100
	  end
	  local success_rate = 1
	  if CrateCount_TotalAttempt >= 100 then
	  	success_rate = CrateCount/CrateCount_TotalAttempt		--use this as a feedback to regulate the spawning rate
	  end
	  if success_rate <= 0 then
	  	success_rate = 0.1
	  elseif success_rate > 1 then
	  	success_rate = 1
	  end
	  local success_compensation = 1/success_rate
		--spawn section
		--print("Crate SobGroup count: "..SobGroup_Count("meg_crate")..", CrateCount = "..CrateCount..", CrateCount_TotalAttempt = "..CrateCount_TotalAttempt)
		for c=0,crates,1 do		--spawn frequency depends on its success rate
			if SobGroup_Count("meg_crate") < upper_limit and random_pseudo(0,odds)*crate_frequency*success_compensation >= random_pseudo(0,1000) then
				local bound_x = MapInnerBounds[1]
				local bound_y = MapInnerBounds[2]
				local bound_z = MapInnerBounds[3]
				Volume_AddSphere("VOL_CrateSpawnLocation"..c, {random_pseudo(-bound_x,bound_x), random_pseudo(-bound_y,bound_y), random_pseudo(-bound_z,bound_z)}, 6000)		--What's the largest map? Probably (6P) Solar System 2 with inner bounds: {680000, 350000, 680000}
				SobGroup_Create("SpawningCrateTempSOB")
				--print("Spawning new crate! Game time: "..Universe_GameTime())
				SobGroup_SpawnNewShipInSobGroup(-1, "meg_crate", "CrateSpawning", "SpawningCrateTempSOB", "VOL_CrateSpawnLocation"..c)
				CrateCount_TotalAttempt = CrateCount_TotalAttempt + 1
				Volume_Delete("VOL_CrateSpawnLocation"..c)
				SobGroup_Create("VicinityOfTheSpawningCrateSOB")
				SobGroup_Clear("VicinityOfTheSpawningCrateSOB")
				if SobGroup_HealthPercentage("SpawningCrateTempSOB") > 0 and 	--collision check
				SobGroup_InWorldBound("SpawningCrateTempSOB", 1) == 1 and		--boundary check
				SobGroup_FillProximitySobGroup("VicinityOfTheSpawningCrateSOB", "AllShips", "SpawningCrateTempSOB", 4000) == 0 and		--don't spawn a crate near any players' ship
				SobGroup_FillProximitySobGroup("VicinityOfTheSpawningCrateSOB", "meg_crate", "SpawningCrateTempSOB", 4000) == 0 then		--don't spawn a crate near any other crate
					SobGroup_SobGroupAdd("meg_crate", "SpawningCrateTempSOB")			--expand the dedicated sobgroup for crates
					--SobGroup_SobGroupAdd("megalitenoowner", "SpawningCrateTempSOB")		--expand the megalitenoowner group with all existing crates
					--CrateCount = CrateCount + 1
					Crate_SetMeshFX("SpawningCrateTempSOB")
				else
					--SobGroup_Despawn("SpawningCrateTempSOB")
					SobGroup_SetHealth("SpawningCrateTempSOB", 0)
				end
				SobGroup_Clear("SpawningCrateTempSOB")
			end
		end
		--despawn section
		--this MUST be put AFTER the spawn section because it updates the CrateCount, which will be called right after this function in the more frequent "crates_check" function!!!
		if SobGroup_Empty("meg_crate") == 0 then
    	CrateCount = SobGroup_SplitGroupReference("splitcrate", "meg_crate", "AllShips", SobGroup_Count("meg_crate"))
	  	for i = 0, CrateCount-1, 1 do
				if SobGroup_Empty("splitcrate"..i) == 0 then
					if SobGroup_HealthPercentage("splitcrate"..i) > 0 then
			      SobGroup_AbilityActivate("splitcrate"..i, AB_Scuttle, 0)
						SobGroup_SetSwitchOwnerFlag("splitcrate"..i, 0)
						if SobGroup_AreAnyOfTheseTypes("splitcrate"..i, "meg_crate") == 1 then
							local megalitenoowner11 = Ping_AddSobGroup("Unclaimed Package", "megalitenoowner11", "splitcrate"..i)
		          Ping_LabelVisible(megalitenoowner11, 1)
				      Ping_AddDescription(megalitenoowner11, 0, "Contents Unknown")
				      Ping_AddDescription(megalitenoowner11, 1, "First Come To Unbox")
							local lasthealth = SobGroup_GetHardPointHealth("splitcrate"..i, "lasthealth")
							if lasthealth > 0.1 then
								SobGroup_SetHardPointHealth_Smart("splitcrate"..i, "lasthealth", lasthealth-random_pseudo(0,100*crate_frequency)/100000)		--when crate_frequency is 10, average lifespan: 724.5, enough to move your frigates' ass?
							else
								--SobGroup_Despawn("splitcrate"..i)		--Bug fixed! This does not destroy the SobGroup! 
								SobGroup_SetHealth("splitcrate"..i, 0)
								--print("Destroying old crate! Game time: "..Universe_GameTime())
							end
						end
					end
				end
			end
		end
	end

---pings megalite noowner
  if MaxCount[4] >= 0 then
		for i = 0,MaxCount[4],1 do	
		  if SobGroup_Empty("megalite"..i) == 0 then			
		    if SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_balcoragate") == 1 then
		      local megalitenoowner = Ping_AddSobGroup("Hyperspace Improver", "megalitenoowner", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner, 0, "-50% Hyperspace Cost")
		      Ping_AddDescription(megalitenoowner, 1, "-50% Hyperspace Recovery Time")
		      Ping_AddDescription(megalitenoowner, 2, "-50% Hyperspace Transaction Time")
		      Ping_AddDescription(megalitenoowner, 3, "-50% Hyperspace Exit Damage")				          
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_tanis") == 1 then				  
		      local megalitenoowner1 = Ping_AddSobGroup("Defense/Support Improver", "megalitenoowner1", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner1, 0, "+10% Health")
		      Ping_AddDescription(megalitenoowner1, 1, "+100% Health Regegeration Rate")
		      Ping_AddDescription(megalitenoowner1, 2, "+100% Docked Ships Repair Speed")	         	  
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_foundry") == 1 then  		      
		      local megalitenoowner2 = Ping_AddSobGroup("200000 RUs", "megalitenoowner2", "megalite"..i)		      	  		        
		      Ping_LabelVisible(megalitenoowner2, 1) 		      
		      Ping_AddDescription(megalitenoowner2, 0, "+50% Collector Harvest")
		      Ping_AddDescription(megalitenoowner2, 1, "+50% Collector Load Capacity")
		      Ping_AddDescription(megalitenoowner2, 2, "+50% Collector Drop-Off")	  
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_dreadnaughtberth") == 1 then
		      local megalitenoowner3 = Ping_AddSobGroup("Attack Improver", "megalitenoowner3", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner3, 0, "+40% Weapon Damage")
		      Ping_AddDescription(megalitenoowner3, 1, "+40% Weapon Accuracy")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "anc_hyperspace_bridge") == 1 then
		      local megalitenoowner4 = Ping_AddSobGroup("Shield Improver", "megalitenoowner4", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner4, 0, "+10% Shield Regeneration Rate")
		      Ping_AddDescription(megalitenoowner4, 1, "+10% Shield Duaration")
			  elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_engineeringbay") == 1 then
			  	local megalitenoowner5 = Ping_AddSobGroup("Level 0", "megalitenoowner5", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner5, 0, "Heal Radius: 3000m")
		      Ping_AddDescription(megalitenoowner5, 1, "Heal Rate: 0.1%")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_reinforcementpad") == 1 then
		      local megalitenoowner6 = Ping_AddSobGroup("Supply Zone", "megalitenoowner6", "megalite"..i)
		      Ping_AddDescription(megalitenoowner6, 0, "Next Supply: Unknown")
		      Ping_AddDescription(megalitenoowner6, 1, "Supply Countdown: 100")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_mandator_star_dreadnought, meg_titan_cruiser, meg_hvdreadnaught, meg_executor_ssd") == 1 then
		      local megalitenoowner7 = Ping_AddSobGroup("Artillery Bombardment", "megalitenoowner7", "megalite"..i)		       
		      Ping_AddDescription(megalitenoowner7, 0, "Aiming System: 30%")
		      Ping_AddDescription(megalitenoowner7, 1, "Munition System: 30%")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_progenitorpowermodule") == 1 then 	
          local megalitenoowner8 = Ping_AddSobGroup("Anti-Radiation Improver", "megalitenoowner8", "megalite"..i)
          Ping_LabelVisible(megalitenoowner8, 1)					
		      Ping_AddDescription(megalitenoowner8, 0, "-50% Nebula Damage")
		      Ping_AddDescription(megalitenoowner8, 1, "-50% Dust Cloud Damage")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_veildebris_chunk_lighthouse, meg_veildebris_chunk_lighthouse_nobuild") == 1 then 	
          local megalitenoowner9 = Ping_AddSobGroup("Sensor Improver", "megalitenoowner9", "megalite"..i)
          Ping_LabelVisible(megalitenoowner9, 1)					
		      Ping_AddDescription(megalitenoowner9, 0, "+50% Primary Sensor Range")
		      Ping_AddDescription(megalitenoowner9, 1, "+50% Secondary Sensor Range")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_sajhulknose_ui") == 1 then
          local megalitenoowner10 = Ping_AddSobGroup("Propulsion Improver", "megalitenoowner10", "megalite"..i)
          Ping_LabelVisible(megalitenoowner10, 1)
		      Ping_AddDescription(megalitenoowner10, 0, "+20% Speed")
		      Ping_AddDescription(megalitenoowner10, 1, "+20% Drive")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bigred") == 1 then
          local megalitenoowner12 = Ping_AddSobGroup("Cloak Megalith", "megalitenoowner12", "megalite"..i)
          Ping_LabelVisible(megalitenoowner12, 1)
		      Ping_AddDescription(megalitenoowner12, 0, "+50% Cloak Strength")
		      Ping_AddDescription(megalitenoowner12, 1, "+50% Cloak Time")
					Ping_AddDescription(megalitenoowner12, 2, "+20% Cloak Detection")
		      Ping_AddDescription(megalitenoowner12, 3, "+20% Sensor Distortion")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_headshotasteroid") == 1 then
          local megalitenoowner13 = Ping_AddSobGroup("Impact Megalith", "megalitenoowner13", "megalite"..i)
          Ping_LabelVisible(megalitenoowner13, 1)
		      Ping_AddDescription(megalitenoowner13, 0, "Mothership Smasher")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_carrier_huge") == 1 then
		      local megalitenoowner14 = Ping_AddSobGroup("Air Combat Command", "megalitenoowner14", "megalite"..i)
		      Ping_AddDescription(megalitenoowner14, 0, "Air Superiority Fighters: "..AirCombat_CountPlayerShipsInTable(SobGroup_OwnedBy("megalite"..i), "aircombat_fighterjets"))
		      Ping_AddDescription(megalitenoowner14, 1, "Multirole Combat Jets: "..AirCombat_CountPlayerShipsInTable(SobGroup_OwnedBy("megalite"..i), "aircombat_strikecraft"))
		      Ping_AddDescription(megalitenoowner14, 2, "Bombers: "..AirCombat_CountPlayerShipsInTable(SobGroup_OwnedBy("megalite"..i), "aircombat_bombers"))
		      Ping_AddDescription(megalitenoowner14, 3, "Support Aircraft: "..AirCombat_CountPlayerShipsInTable(SobGroup_OwnedBy("megalite"..i), "aircombat_specialplanes"))
		      SobGroup_AbilityActivate("megalite"..i, AB_Attack, 0)
		      SobGroup_AbilityActivate("megalite"..i, AB_Lights, 0)
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_chimera_nobuild") == 1 then
		    	local megalitenoowner15 = Ping_AddSobGroup("Sensor Megalith", "megalitenoowner15", "megalite"..i)
          Ping_LabelVisible(megalitenoowner15, 1)
		    	Ping_AddDescription(megalitenoowner15, 0, "+50% Cloak Detection")
		      Ping_AddDescription(megalitenoowner15, 1, "+20% Visual Range")
					Ping_AddDescription(megalitenoowner15, 2, "+20% Primary Sensor Range")
		      Ping_AddDescription(megalitenoowner15, 3, "+20% Secondary Sensor Range")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bentus") == 1 then
		    	local megalitenoowner16 = Ping_AddSobGroup("Research Improver", "megalitenoowner16", "megalite"..i)
          Ping_LabelVisible(megalitenoowner16, 1)
		      Ping_AddDescription(megalitenoowner16, 0, "+25% Research Speed")
		      Ping_AddDescription(megalitenoowner16, 1, "Total Divisions: N/A")
		      Ping_AddDescription(megalitenoowner16, 2, "Total Efficiency: N/A")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_ghostship") == 1 then
          local megalitenoowner17 = Ping_AddSobGroup("Unknown Megalith", "megalitenoowner17", "megalite"..i)
          Ping_LabelVisible(megalitenoowner17, 1)
		      Ping_AddDescription(megalitenoowner17, 0, "Unforeseen Consequences")
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_venator_destroyer, meg_allegiance_destroyer, meg_implacable_cruiser, meg_vengence_ssd, meg_eclipse_ssd, meg_class_iii_platform, meg_bear") == 1 then
		      if SobGroup_SobGroupCompare("megalite"..i, "SOB_EndgameCrisis") == 1 then	--spawned from crisis, begin attacking players
						local hp = SobGroup_HealthPercentage("megalite"..i)
						if hp > 0 and SobGroup_OwnedBy("megalite"..i) < 0 then
							if SobGroup_AreAllInRealSpace("megalite"..i) == 1 then
			      		SobGroup_Create("Temp_CheckTargets_SOB")
								SobGroup_SobGroupAdd("Temp_CheckTargets_SOB", "AllShips")
								SobGroup_SobGroupSubstract("Temp_CheckTargets_SOB", "SOB_AllDummyHSGates")
								SobGroup_SobGroupSubstract("Temp_CheckTargets_SOB", "all_supporters")
								if SobGroup_Empty("Temp_CheckTargets_SOB") == 0 then	-- and SobGroup_IsDoingAbility("megalite"..i, AB_Attack) == 0
									SobGroup_SetTactics_Smart("megalite"..i, AggressiveTactics)
									SobGroup_Kamikaze("megalite"..i, "Temp_CheckTargets_SOB")
									--print("Alien Vessel ".."megalite"..i.." is attacking, year: "..year)
									--SobGroup_Attack(0, "megalite"..i, "Temp_CheckTargets_SOB")
								end
								SobGroup_Clear("Temp_CheckTargets_SOB")
								if SobGroup_InWorldBound("megalite"..i, 1) == 0 then
									--SobGroup_SetHealth("megalite"..i, 0)
									SobGroup_EnterHyperSpaceOffMap("megalite"..i)	--why not jump back in the map and kick more ass!
									print("Alien Vessel ".."megalite"..i.." is entering hyperspace in order to return to the map, year: "..year)
								end
							elseif SobGroup_AreAllInHyperspace("megalite"..i) == 1 then
								local position = {0,0,0}
								for i=1,3,1 do
									position[i] = 0.5*random_pseudo(-MapInnerBounds[i], MapInnerBounds[i])	--random coordinates within map boundaries
								end
								Volume_AddSphere("VOL_HyperspaceReturning"..i, position, 10000)
								SobGroup_ExitHyperSpace("megalite"..i, "VOL_HyperspaceReturning"..i)
								print("Alien Vessel ".."megalite"..i.." is exiting hyperspace at "..Vector_tostring(position)..", year: "..year)
								Volume_Delete("VOL_HyperspaceReturning"..i)
							end
						end
		     	else	--not spawned from crisis, just leave it alone
		     		--local megalitenoowner17 = Ping_AddSobGroup("Unidentified Aggressor", "megalitenoowner17", "megalite"..i)
          	--Ping_LabelVisible(megalitenoowner17, 1)
		      	--Ping_AddDescription(megalitenoowner17, 0, "Overwhelming Firepower")
		      end
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_researchstation") == 1 then
          local megalitenoowner15 = Ping_AddSobGroup("Astronomical Observatory", "megalitenoowner15", "megalite"..i)
          Ping_LabelVisible(megalitenoowner15, 1)
		      Ping_AddDescription(megalitenoowner15, 0, "Meteorological Studies")
		      Ping_AddDescription(megalitenoowner15, 1, "Disaster Prevention")
					Ping_AddDescription(megalitenoowner15, 2, "-100% Meteor Strikes")
		      Ping_AddDescription(megalitenoowner15, 3, "+25% Research Speed")
		      --spawn meteor shower
		      if SobGroup_Count("SOB_MeteorShower") < Universe_CountPlayersAlive()+unitcapsofficer+unitcapsrank then
		      	if SobGroup_Empty("splitter") == 0 then	--use the direction of the splitter as the meteor shower direction
		      		local t = SobGroup_GetPosition("splitter")
		      		--print("Position of splitter is "..Vector_tostring(t)..", modulus="..Vector_modulus(t))
		      		--print("Vector_zeroes(t)="..Vector_tostring(Vector_zeroes(getn(t))))
		      		--print("Vector_distance(t, {0,0,0})="..Vector_distance(t, {0,0,0}))
		      		if Vector_modulus(t) > 0 then
			      		local unit_vector = Vector_unit(t)
			      		local max_range = 800000
			      		local scale = min(max_range, Vector_modulus(MapInnerBounds)*1.5)	--should spawn outside the map
			      		local target_vector = Vector_Operation(unit_vector, scale, "*")
			      		local spread = {0,0,0}
					      for i=1,3,1 do
									spread[i] = 0.1*random_pseudo(-MapInnerBounds[i], MapInnerBounds[i])	--spread scales with map size
								end
								--print("spread="..Vector_tostring(spread))
								target_vector = Vector_Operation(target_vector, spread, "+")
								Volume_AddSphere("VOL_MeteorShower"..i, target_vector, 10000)
								SobGroup_SpawnNewShipInSobGroup(-1, "meg_dummy_meteorshower", "MeteorShower", "SOB_MeteorShower", "VOL_MeteorShower"..i)								
								print("Meteor Shower for ".."megalite"..i.." is spawned at "..Vector_tostring(target_vector)..", year: "..year)
								Volume_Delete("VOL_MeteorShower"..i)
							end
						end
					end
				elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bentusiexchange") == 1 then
					if SobGroup_SobGroupCompare("megalite"..i, "SOB_EndgameCrisis") == 1 then	--spawned from crisis, begin attacking players
						local hp = SobGroup_HealthPercentage("megalite"..i)
						if hp > 0 and SobGroup_OwnedBy("megalite"..i) < 0 then
							SobGroup_Create("Temp_CheckTargets_SOB")
							SobGroup_SobGroupAdd("Temp_CheckTargets_SOB", "AllShips")
							SobGroup_SobGroupSubstract("Temp_CheckTargets_SOB", "SOB_AllDummyHSGates")
							SobGroup_SobGroupSubstract("Temp_CheckTargets_SOB", "all_supporters")
							if SobGroup_Empty("Temp_CheckTargets_SOB") == 0 then	-- and SobGroup_IsDoingAbility("megalite"..i, AB_Attack) == 0
								SobGroup_SetTactics_Smart("megalite"..i, AggressiveTactics)
								SobGroup_Kamikaze("megalite"..i, "Temp_CheckTargets_SOB")
							end
							SobGroup_Clear("Temp_CheckTargets_SOB")
						end
				  else	--not spawned from crisis, stay in peace mode
				  	SobGroup_AbilityActivate("megalite"..i, AB_Attack, 0)
				  	local megalitenoowner16 = Ping_AddSobGroup("(OPEN)", "megalitenoowner16", "megalite"..i)
	          Ping_LabelVisible(megalitenoowner16, 1)
			      Ping_AddDescription(megalitenoowner16, 0, "Your No.1 Trustworthy Merchant")
			      Ping_AddDescription(megalitenoowner16, 1, "Buy New Technologies Here")
			      Ping_AddDescription(megalitenoowner16, 2, "Cutting Out the Middleman")
				  end
		    elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_tmatmegaship") == 1 then
		    	if SobGroup_SobGroupCompare("megalite"..i, "SOB_EndgameCrisis") == 1 then	--spawned from crisis, begin attacking players
						local hp = SobGroup_HealthPercentage("megalite"..i)
						if hp > 0 and SobGroup_OwnedBy("megalite"..i) < 0 then
							SobGroup_Create("Temp_CheckTargets_SOB")
							SobGroup_SobGroupAdd("Temp_CheckTargets_SOB", "AllShips")
							SobGroup_SobGroupSubstract("Temp_CheckTargets_SOB", "SOB_AllDummyHSGates")
							SobGroup_SobGroupSubstract("Temp_CheckTargets_SOB", "all_supporters")
							if SobGroup_Empty("Temp_CheckTargets_SOB") == 0 then	-- and SobGroup_IsDoingAbility("megalite"..i, AB_Attack) == 0
								SobGroup_SetTactics_Smart("megalite"..i, AggressiveTactics)
								--SobGroup_Kamikaze("megalite"..i, "Temp_CheckTargets_SOB")
								SobGroup_Attack(0, "megalite"..i, "Temp_CheckTargets_SOB")
							end
							SobGroup_Clear("Temp_CheckTargets_SOB")
						end
				  else	--not spawned from crisis, stay in peace mode
	          local megalitenoowner17 = Ping_AddSobGroup("Lithophilic Superorganism", "megalitenoowner17", "megalite"..i)
	          Ping_LabelVisible(megalitenoowner17, 1)
			      Ping_AddDescription(megalitenoowner17, 0, "It's Alive!")
			    end
			    FX_StartEvent_Smart("megalite"..i, "Breathe")
		      
					
			  end
			end    
		end
	end

---meteor shower
	if SobGroup_Empty("SOB_MeteorShower") == 0 then
		if Rule_Exists("AI_MeteorShower") == 0 then
			Rule_AddInterval("AI_MeteorShower", 7.097)
		end
	end

---pings megalith noowner
  if SobGroup_Empty("megalithnoowner") == 0 then	      
		for i = 0,(megalithnoownercount - 1),1 do	
		  if SobGroup_Empty("megalithnoowner"..i) == 0 then			
			  if SobGroup_PlayerIsInSensorRange("megalithnoowner"..i, Universe_CurrentPlayer()) == 1 then	
			    local availableru = SobGroup_GetHardPointHealth("megalithnoowner"..i, "ru") * 100000 			    
			    Ping_LabelVisible(Ping_AddSobGroup(floor(availableru) .. " RUs", "megalithnoowner", "megalithnoowner"..i), 1)   
			  else		 
			    local availableru = "??"   			   
			    Ping_LabelVisible(Ping_AddSobGroup(availableru .. " RUs", "megalithnoowner", "megalithnoowner"..i), 1)   
			  end  
			end    
		end
	end	

  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do    
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
---se c'? mining base                            
        if SobGroup_Count("meg_gehenna_1ctm"..playerIndex) > 0 or SobGroup_Count("meg_gehenna_3ctm"..playerIndex) > 0 then                            
---calcolo ricerche        
          if (Player_HasResearch(playerIndex, "resourcecollectorextraction1" ) == 1) and (Player_HasResearch(playerIndex, "resourcecollectorextraction2" ) == 0) then
			      resourcecollectorextractionList[playerIndexList] = 0.00019 * 1.25            
			    elseif (Player_HasResearch(playerIndex, "resourcecollectorextraction2" ) == 1) and (Player_HasResearch(playerIndex, "resourcecollectorextraction3" ) == 0) then
			      resourcecollectorextractionList[playerIndexList] = 0.00019 * 1.5            
			    elseif Player_HasResearch(playerIndex, "resourcecollectorextraction3" ) == 1 then			    
			      resourcecollectorextractionList[playerIndexList] = 0.00019 * 1.8 			          	          
			    end   
			    
			    if (Player_HasResearch(playerIndex, "minecontainerrurate1" ) == 1) and (Player_HasResearch(playerIndex, "minecontainerrurate2" ) == 0) then
			      minecontainerrurateList[playerIndexList] = 0.0025 * 1.25  
			      minecontainerrurateDisplayList[playerIndexList] = 6.25  --5*1.25(6.25)           
			    elseif (Player_HasResearch(playerIndex, "minecontainerrurate2" ) == 1) and (Player_HasResearch(playerIndex, "minecontainerrurate3" ) == 0) then
			      minecontainerrurateList[playerIndexList] = 0.0025 * 1.5  
			      minecontainerrurateDisplayList[playerIndexList] = 7.5  --5*1.5(7.5)           
			    elseif Player_HasResearch(playerIndex, "minecontainerrurate3" ) == 1 then			    
			      minecontainerrurateList[playerIndexList] = 0.0025 * 1.8  	
			      minecontainerrurateDisplayList[playerIndexList] = 9  --5*1.8(9)    		            
			    end   
			    
			    if (Player_HasResearch(playerIndex, "minecontainerload1" ) == 1) and (Player_HasResearch(playerIndex, "minecontainerload2" ) == 0) then
			      minecontainerloadList[playerIndexList] = 0.634 * 1.11  
			      minecontainerloadDisplayList[playerIndexList] = 6000  --4000*1.2            
			    elseif (Player_HasResearch(playerIndex, "minecontainerload2" ) == 1) and (Player_HasResearch(playerIndex, "minecontainerload3" ) == 0) then
			      minecontainerloadList[playerIndexList] = 0.634 * 1.21  
			      minecontainerloadDisplayList[playerIndexList] = 8000  --4000*2         
			    elseif Player_HasResearch(playerIndex, "minecontainerload3" ) == 1 then			    
			      minecontainerloadList[playerIndexList] = 0.634 * 1.315  		
			      minecontainerloadDisplayList[playerIndexList] = 10000  --4000*2.5	     	          
			    end  
			    
			    if (Player_HasResearch(playerIndex, "minecontainerdropoff1" ) == 1) and (Player_HasResearch(playerIndex, "minecontainerdropoff2" ) == 0) then
			      minecontainerdropoffList[playerIndexList] = 0.0025 * 1.25      
			      minecontainerdropoffDisplayList[playerIndexList] = 6.25  --5*1.25(6.25)      
			    elseif (Player_HasResearch(playerIndex, "minecontainerdropoff2" ) == 1) and (Player_HasResearch(playerIndex, "minecontainerdropoff3" ) == 0) then
			      minecontainerdropoffList[playerIndexList] = 0.0025 * 1.5      
			      minecontainerdropoffDisplayList[playerIndexList] = 7.5  --5*1.5(7.5)             
			    elseif Player_HasResearch(playerIndex, "minecontainerdropoff3" ) == 1 then			    
			      minecontainerdropoffList[playerIndexList] = 0.0025 * 1.8  		
			      minecontainerdropoffDisplayList[playerIndexList] = 9  --5*1.8(9)      	        	          
			    end  
    	 	      	              
---calcolo estrazione RU da miniera                                        
          for i = 0,(nmb - 1),1 do               
  
            if SobGroup_Empty("splitminingbases"..i) == 0 then	
		          SobGroup_Create("hgn_resourcecollector_insidemegalith"..i) 
		          SobGroup_Create("hgn_minecontainer_insidemegalith"..i)
	---raccoglie i collettori dockati                    
	            if SobGroup_OwnedBy("splitminingbases"..i) == playerIndex then    
			          SobGroup_SetAutoLaunch("splitminingbases"..i, ShipHoldStayDockedUpToLimit)
			          SobGroup_GetSobGroupDockedWithGroup("splitminingbases"..i, "gehennacollectors")      
			          if Player_GetRace(playerIndex) == Race_Hiigaran then
			            SobGroup_FillShipsByType("hgn_resourcecollector_insidemegalith"..i, "gehennacollectors", "hgn_resourcecollector") 	
			            SobGroup_FillShipsByType("hgn_minecontainer_insidemegalith"..i, "gehennacollectors", "hgn_minecontainer")
			          elseif Player_GetRace(playerIndex) == Race_Vaygr then
			            SobGroup_FillShipsByType("hgn_resourcecollector_insidemegalith"..i, "gehennacollectors", "vgr_resourcecollector") 	
			            SobGroup_FillShipsByType("hgn_minecontainer_insidemegalith"..i, "gehennacollectors", "vgr_minecontainer")
			          elseif Player_GetRace(playerIndex) == Race_Kadeshi then
			            SobGroup_FillShipsByType("hgn_resourcecollector_insidemegalith"..i, "gehennacollectors", "kad_ressourcecollector") 	
			            SobGroup_FillShipsByType("hgn_minecontainer_insidemegalith"..i, "gehennacollectors", "kad_minecontainer")
			          elseif Player_GetRace(playerIndex) == Race_Raider then
			            SobGroup_FillShipsByType("hgn_resourcecollector_insidemegalith"..i, "gehennacollectors", "rad_resourcecollector") 	
			            SobGroup_FillShipsByType("hgn_minecontainer_insidemegalith"..i, "gehennacollectors", "rad_minecontainer")
			          elseif Player_GetRace(playerIndex) == Race_Keeper then
			            SobGroup_FillShipsByType("hgn_resourcecollector_insidemegalith"..i, "gehennacollectors", "kpr_resourcecollector") 	
			            SobGroup_FillShipsByType("hgn_minecontainer_insidemegalith"..i, "gehennacollectors", "kpr_minecontainer")
			          end  
			          if battlearena[1] < 200 then	
				          local ruvalue = SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") + ((resourcecollectorextractionList[playerIndexList] * SobGroup_Count("hgn_resourcecollector_insidemegalith"..i)) / 2.9)
				          if ruvalue <= 1 then
				            if ruvalue <= 0.00100 then                      
				              SobGroup_SetHardPointHealth_Smart("splitminingbases"..i, "ru", 0.00100) 
				            else
				              SobGroup_SetHardPointHealth_Smart("splitminingbases"..i, "ru", ruvalue) 
				            end       
				          else
				            SobGroup_SetHardPointHealth_Smart("splitminingbases"..i, "ru", 1)  
				          end  
				        end  
			          SobGroup_Clear("gehennacollectors")
	---fx		      
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) == 0 then
	                FX_StopEvent("splitminingbases"..i, "Sound")
	                bloccomegalith[i+1] = 0
	              end
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) > 0 then
	                FX_StartEvent("splitminingbases"..i, "Mining1")                
	                if bloccomegalith[i+1] == 0 then
	                  FX_StartEvent("splitminingbases"..i, "Sound")
	                  bloccomegalith[i+1] = 1
	                end                
	              end
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) > 5 then
	                FX_StartEvent("splitminingbases"..i, "Mining2")
	              end
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) > 10 then
	                FX_StartEvent("splitminingbases"..i, "Mining3")
	              end
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) > 15 then
	                FX_StartEvent("splitminingbases"..i, "Mining4")
	              end  
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) > 20 then
	                FX_StartEvent("splitminingbases"..i, "Mining5")
	              end    
	              if SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) > 25 then
	                FX_StartEvent("splitminingbases"..i, "Mining6")
	              end                                   
	            end
---pings megalith owner                            
		          if SobGroup_OwnedBy("splitminingbases"..i) == Universe_CurrentPlayer() then			          	  
						    local availableru = SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") * 100000							    
						    local megalithowner = Ping_AddSobGroup("" .. floor(availableru) .. " RUs", "megalithowner", "splitminingbases"..i)
                Ping_LabelVisible(megalithowner, 1)		
                if SobGroup_Empty("hgn_resourcecollector_insidemegalith"..i) == 0 then
							    Ping_AddDescription(megalithowner, 0, "" .. SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) .. " Resource Collectors (inside)")
			          else
							    Ping_AddDescription(megalithowner, 0, "no Resource Collectors (inside)")
							  end
							  if SobGroup_Empty("hgn_minecontainer_insidemegalith"..i) == 0 then
			            Ping_AddDescription(megalithowner, 1, "" .. SobGroup_Count("hgn_minecontainer_insidemegalith"..i) .. " Mine Containers (inside)")
			           else
			            Ping_AddDescription(megalithowner, 1, "no Mine Containers (inside)")
			        	end						    
						  elseif AreAllied(Universe_CurrentPlayer(), SobGroup_OwnedBy("splitminingbases"..i)) == 1 then
						    local availableru = SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") * 100000							    
						    local megalithowner = Ping_AddSobGroup("" .. floor(availableru) .. " RUs", "megalithowner", "splitminingbases"..i) 	   
                Ping_LabelVisible(megalithowner, 1)
                if SobGroup_Empty("hgn_resourcecollector_insidemegalith"..i) == 0 then
							    Ping_AddDescription(megalithowner, 0, "" .. SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) .. " Resource Collectors (inside)")
			          else
							    Ping_AddDescription(megalithowner, 0, "no Resource Collectors (inside)")
							  end
							  if SobGroup_Empty("hgn_minecontainer_insidemegalith"..i) == 0 then
			            Ping_AddDescription(megalithowner, 1, "" .. SobGroup_Count("hgn_minecontainer_insidemegalith"..i) .. " Mine Containers (inside)")
			           else
			            Ping_AddDescription(megalithowner, 1, "no Mine Containers (inside)")
			        	end
						  elseif SobGroup_PlayerIsInSensorRange("splitminingbases"..i, Universe_CurrentPlayer()) == 1 then
						    local availableru = SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") * 100000							    
						    local megalithowner = Ping_AddSobGroup("" .. floor(availableru) .. " RUs", "megalithowner", "splitminingbases"..i) 	   
                Ping_LabelVisible(megalithowner, 1)		
                if SobGroup_Empty("hgn_resourcecollector_insidemegalith"..i) == 0 then
							    Ping_AddDescription(megalithowner, 0, "" .. SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) .. " Resource Collectors (inside)")
			          else
							    Ping_AddDescription(megalithowner, 0, "no Resource Collectors (inside)")
							  end
							  if SobGroup_Empty("hgn_minecontainer_insidemegalith"..i) == 0 then
			            Ping_AddDescription(megalithowner, 1, "" .. SobGroup_Count("hgn_minecontainer_insidemegalith"..i) .. " Mine Containers (inside)")
			           else
			            Ping_AddDescription(megalithowner, 1, "no Mine Containers (inside)")
			        	end
						  else
						    local availableru = "??"					    
						    Ping_LabelVisible(Ping_AddSobGroup(availableru .. " RUs", "megalithowner", "splitminingbases"..i), 1)       		    
						  end		          
			      end  
	        end  
---Mine containers	 
          if nmc > 0 then         	          
	          for z = 0,(nmc-1),1 do 	
	            SobGroup_ForceStayDockedIfDocking("splitminecontainers"..z)
	            maggiore = 0
	            if SobGroup_Empty("splitminecontainers"..z) == 0 then 
	            
---pings container
                if (SobGroup_OwnedBy("splitminecontainers"..z) == Universe_CurrentPlayer()) and (SobGroup_IsDocked("splitminecontainers"..z) == 0) then  
	                local availableru = ((SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") - 0.5) * 1000) * 30   --il 30 ? il valore di ogni "1" del range del carico in proporzione	  								  	                
	                if availableru <= 0 then
	                  availableru = 0
	                end
								  Ping_LabelVisible(Ping_AddSobGroup(floor(availableru) .. " RUs", "minecontainer", "splitminecontainers"..z), 1)  									
								end  	  	            
	                     		         
			          if SobGroup_OwnedBy("splitminecontainers"..z) == playerIndex then  	           
---se dockato in mining bases		                               
			            if SobGroup_IsDockedSobGroup("splitminecontainers"..z, "meg_gehenna_1ctm"..playerIndex) == 1 or SobGroup_IsDockedSobGroup("splitminecontainers"..z, "meg_gehenna_3ctm"..playerIndex) == 1 then
			              for i = 0,(nmb - 1),1 do 
			                if SobGroup_OwnedBy("splitminingbases"..i) == playerIndex then
				                if SobGroup_IsDockedSobGroup("splitminecontainers"..z, "splitminingbases"..i) == 1 then
				                  if battlearena[1] < 200 then	
							              if (SobGroup_GetHardPointHealth("splitminingbases"..i, "ru")-0.00100) >= (minecontainerrurateList[playerIndexList] / 10) then
							                SobGroup_SetHardPointHealth_Smart("splitminecontainers"..z, "ru", (SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") + minecontainerrurateList[playerIndexList]))  
							                local availableru = (SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") - (minecontainerrurateList[playerIndexList] / 10 * 3))
							                if availableru > 0 then
							                  SobGroup_SetHardPointHealth_Smart("splitminingbases"..i, "ru", availableru)     
							                else
							                  SobGroup_SetHardPointHealth_Smart("splitminingbases"..i, "ru", 0)      
							                end  
							              end 
							            end  
						              if SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") >= minecontainerloadList[playerIndexList] then
						                SobGroup_Launch_Smart("splitminecontainers"..z, "splitminingbases"..i)
						              end 
						            end	
						          end  	              
			            	end  		             
---se dockato in production capital ships		               
			            elseif SobGroup_IsDockedSobGroup("splitminecontainers"..z, "productioncapitalallies"..playerIndex) == 1 then   			                    
			              if SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") <= 0.5 then
			                SobGroup_SetHardPointHealth_Smart("splitminecontainers"..z, "ru", 0.5)			                			                  
		                  for i = 0,(npca[playerIndexList]-1),1 do	
		                    if SobGroup_IsDockedSobGroup("splitminecontainers"..z, "splitproductioncapitalallies"..playerIndex .. tostring(i)) == 1 then
		                      if SobGroup_GetTactics("splitminecontainers"..z) ~= 2 then
		                        SobGroup_Launch_Smart("splitminecontainers"..z, "splitproductioncapitalallies"..playerIndex .. tostring(i))	
		                      end  
		                      break
		                    end  
		                  end                            
			              else 					              
			                local availableru = (SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") - minecontainerdropoffList[playerIndexList])
			                if availableru > 0 then
			                	if availableru <= 1 then
			                  	SobGroup_SetHardPointHealth_Smart("splitminecontainers"..z, "ru", availableru)     
			                  end
			                else
			                  SobGroup_SetHardPointHealth_Smart("splitminecontainers"..z, "ru", 0)      
			                end  			                  
			                ruinjection = (75 * (minecontainerdropoffList[playerIndexList] / 0.0025)) * miningfactor	                     
			                Player_SetRU(playerIndex, Player_GetRU(playerIndex) + ruinjection)  
			                megalithList[playerIndexList] = floor(megalithList[playerIndexList] + ruinjection)
			              end 	              
---se libero		              
			            else   
			            	if SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[9]) == 1 then
			            	elseif SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[4]) == 1 then
			            	elseif SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[6]) == 1 then 
			            	elseif SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[1]) == 1 then
			            	elseif SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[12]) == 1 then
			            	else
			          --cerca la Minig Base col carico maggiore       	           
				              if SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") <= 0.5 then
				                SobGroup_SetHardPointHealth_Smart("splitminecontainers"..z, "ru", 0.5)			 
				                local maggiore = 0
				                local first = 0
				                for i = 0,(nmb - 1),1 do 
				                  if SobGroup_OwnedBy("splitminingbases"..i) == playerIndex then
				                    if first == 0 then
				                      maggiore = i
				                      first = 1 
				                    end  
					                  if SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") >= SobGroup_GetHardPointHealth("splitminingbases"..maggiore, "ru") then
					                    maggiore = i
					                  end		
					                end  		                    
					            	end           
				                SobGroup_DockSobGroupAndStayDocked_Smart("splitminecontainers"..z, "splitminingbases"..maggiore) 	                
				              else
				        --cerca la Production Capital pi? vicina 
				                SobGroup_Clear("temp")
				                SobGroup_Clear("temp1")
				                SobGroup_Clear("temp2")
												SobGroup_Clear("temp3")
				                local distance = 500
				                SobGroup_SobGroupAdd("temp2", "productioncapitalallies"..playerIndex)
												SobGroup_SobGroupSubstractShipByType("temp2", "hgn_lightcarrier")
												SobGroup_SobGroupSubstractShipByType("temp2", "kpr_shipyard_old")
						            while SobGroup_Count("temp3") == 0 and distance < 50000 do			              						     
									        if SobGroup_FillProximitySobGroup ("temp3", "temp2", "splitminecontainers"..z, distance) == 1 then       
										        SobGroup_DockSobGroupAndStayDocked_Smart("splitminecontainers"..z, "temp3")
										        break
										      end      
									        distance = distance + 500				           		              
				                end  		                 			                
				              end 	
				            end
				        --calcola fx    
				            if SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") >= 0.6 then						            		              		                  
		                  FX_StartEvent( "splitminecontainers"..z, "ResourcingFull" )                  
		                elseif SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") >= 0.67 then		                		                  			
		                  FX_StartEvent( "splitminecontainers"..z, "ResourcingFull" )
		                elseif SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") >= 0.74 then		                  
		                  FX_StartEvent( "splitminecontainers"..z, "ResourcingFull1" )
		                elseif SobGroup_GetHardPointHealth("splitminecontainers"..z, "ru") >= 0.81 then		                  
		                  FX_StartEvent( "splitminecontainers"..z, "ResourcingFull1" )		                		                  		                  
		                end   			              	              	                       	            
			            end
			          end 
			        end             
	          end	
	        end  
          
---AI          
          
          if Player_HasResearch(playerIndex, "isai" ) == 1 then
          	
          	local CreateMinersAndCollectors = function(playerIndex, miner, collector)
---costruzione mine container
	            local hgn_resourcecollector_insidemegalith_total = 0
	            for i = 0,(nmb - 1),1 do  
	              if SobGroup_OwnedBy("splitminingbases"..i) == playerIndex then    
	                hgn_resourcecollector_insidemegalith_total = hgn_resourcecollector_insidemegalith_total + SobGroup_Count("hgn_resourcecollector_insidemegalith"..i)       
	                if ((Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, miner ) < (hgn_resourcecollector_insidemegalith_total/2.5) and 
	                SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") * 10000 > 1500) or 
	                (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, miner ) == 0)) and 
	                (Player_GetRU(playerIndex) < 6000) then
	                  if SobGroup_Empty("productioncapital"..playerIndex) == 0 then 
			                SobGroup_CreateShip_InstantSpawnDock("productioncapital"..playerIndex, miner)
			                break
			              end  
				          end     
---collettore dentro la mining base            
			            if (collectorinsidetime >= 50) and 
			            (((SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) <= (8 + (CPULODvalueList[playerIndex+1]*2))) and 
			            (SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") * 10000 < 1500) and 
			            (SobGroup_Count(collector..playerIndex) >= 11)) or 
			            (SobGroup_Count("hgn_resourcecollector_insidemegalith"..i) == 0)) and 
			            Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, collector) < 25 then	--prevent creating infinite collectors
			              local distance = 500
			              SobGroup_Clear("temp") 
	  								while SobGroup_Count("temp") == 0 and distance < 100000 do			              						     
							        if SobGroup_FillProximitySobGroup ("temp", collector..playerIndex, "splitminingbases"..i, distance) == 1 then       
								        SobGroup_DockSobGroupAndStayDocked_Smart("temp", "splitminingbases"..i)
								        if SobGroup_Empty("productioncapital"..playerIndex) == 0 then
								          SobGroup_CreateShip_InstantSpawnDock("productioncapital"..playerIndex, collector)
								        end  
								        break
								      end      
							        distance = distance + 500				           		              
		                end  		 						                                           
					        end
				        end
				      end
          	end
---hiigaran 
          	if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then
          		CreateMinersAndCollectors(playerIndex, "hgn_minecontainer", "hgn_resourcecollector")
---Vaygr	                        
	        	elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
	        		CreateMinersAndCollectors(playerIndex, "vgr_minecontainer", "vgr_resourcecollector")
---Kadeshi	                        
	        	elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
	        		CreateMinersAndCollectors(playerIndex, "kad_minecontainer", "kad_ressourcecollector")
---Raider
	        	elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
	        		CreateMinersAndCollectors(playerIndex, "rad_minecontainer", "rad_resourcecollector")
	          end                 
		      end          
                    
---se non c'? mining base                    
                  
        else
          if nmc > 0 then
	          for z = 0,(nmc-1),1 do
	            if SobGroup_Empty("splitminecontainers"..z) == 0 then              
		            if SobGroup_OwnedBy("splitminecontainers"..z) == playerIndex then
		              if SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[9]) == 1 then
			            --elseif SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[4]) == 1 then
			            --elseif SobGroup_IsDoingAbility("splitminecontainers"..z, abilityList[6]) == 1 then 
			            else       
		                SobGroup_DockSobGroupAndStayDocked_Smart("splitminecontainers"..z, "productioncapital"..playerIndex)
		              end  
		            end  
		          end  
	          end
	        end              
        end

--Engineering Bay
				if SobGroup_Count("meg_engineeringbay"..playerIndex) > 0 then   
		      local numships = SobGroup_SplitGroupReference("SingleHealEngineeringBay_SOB", "meg_engineeringbay"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("meg_engineeringbay"..playerIndex))
					for counter = 0, numships - 1, 1 do
						--ping
						local radius = 3000
						local regenrate = 0.001
			      if Player_HasResearch(playerIndex, "engineeringbay3" ) == 1 then
			      	radius = 21000
			      	regenrate = 0.004
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn3", 1)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn2", 1)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn1", 1)
			      	local megalitenoowner5 = Ping_AddSobGroup("Level 3", "megalitenoowner5", "SingleHealEngineeringBay_SOB"..counter)		       
			      	Ping_AddDescription(megalitenoowner5, 0, "Heal Radius: 21000m")
			      	Ping_AddDescription(megalitenoowner5, 1, "Heal Rate: 0.4%")
			      elseif Player_HasResearch(playerIndex, "engineeringbay2" ) == 1 then
			      	radius = 14000
			      	regenrate = 0.003
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn3", 0)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn2", 1)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn1", 1)
			      	local megalitenoowner5 = Ping_AddSobGroup("Level 2", "megalitenoowner5", "SingleHealEngineeringBay_SOB"..counter)		       
			      	Ping_AddDescription(megalitenoowner5, 0, "Heal Radius: 14000m")
			      	Ping_AddDescription(megalitenoowner5, 1, "Heal Rate: 0.3%")
			      elseif Player_HasResearch(playerIndex, "engineeringbay1" ) == 1 then
			      	radius = 7000
			      	regenrate = 0.002
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn3", 0)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn2", 0)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn1", 1)
			      	local megalitenoowner5 = Ping_AddSobGroup("Level 1", "megalitenoowner5", "SingleHealEngineeringBay_SOB"..counter)		       
			      	Ping_AddDescription(megalitenoowner5, 0, "Heal Radius: 7000m")
			      	Ping_AddDescription(megalitenoowner5, 1, "Heal Rate: 0.2%")
			      else
			      	radius = 3000
			      	regenrate = 0.001
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn3", 0)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn2", 0)
			      	SobGroup_SetHardPointHealth_Smart("SingleHealEngineeringBay_SOB"..counter, "tcn1", 0)
			      	local megalitenoowner5 = Ping_AddSobGroup("Level 0", "megalitenoowner5", "SingleHealEngineeringBay_SOB"..counter)		       
			      	Ping_AddDescription(megalitenoowner5, 0, "Heal Radius: 3000m")
			      	Ping_AddDescription(megalitenoowner5, 1, "Heal Rate: 0.1%")
			      end
						--heal
						SobGroup_Create("ShipsToRepairNearBay"..playerIndex)
						SobGroup_Clear("ShipsToRepairNearBay"..playerIndex)
						SobGroup_FillProximitySobGroup("ShipsToRepairNearBay"..playerIndex, "AllToHelp"..playerIndex, "SingleHealEngineeringBay_SOB".. counter, radius)
						if SobGroup_Count("ShipsToRepairNearBay"..playerIndex) > 0 then
							local numrepaired = SobGroup_SplitGroupReference("SingleShipToHeal_SOB", "ShipsToRepairNearBay"..playerIndex, "AllToHelp"..playerIndex, SobGroup_Count("ShipsToRepairNearBay"..playerIndex))
							for k = 0, numrepaired - 1, 1 do
								if SobGroup_HealthPercentage("SingleShipToHeal_SOB"..k) > 0 and SobGroup_HealthPercentage("SingleShipToHeal_SOB"..k) < 1 then
									if SobGroup_HealthPercentage("SingleShipToHeal_SOB"..k) + regenrate <= 1 then
										SobGroup_SetHealth("SingleShipToHeal_SOB"..k, SobGroup_HealthPercentage("SingleShipToHeal_SOB"..k) + regenrate)
									else
										SobGroup_SetHealth("SingleShipToHeal_SOB"..k, 1)
									end
								end
							end
						end
					end
		    end

--Air Combat
				local AC_capacity = 20
				for h=1,6,1 do
					if Player_HasResearch(playerIndex, "AirCombatCapacityUpgrade"..h ) == 1 then
						AC_capacity=AC_capacity+10
					end
				end
				local AC_num = SobGroup_Count("meg_carrier_huge"..playerIndex)
				local jet_num = SobGroup_Count("aircombat_jets"..playerIndex)
				if AC_num > 0 then
		      SobGroup_AbilityActivate("meg_carrier_huge"..playerIndex, AB_Attack, 1)
		      SobGroup_AbilityActivate("meg_carrier_huge"..playerIndex, AB_Lights, 1)
		      --Aircraft
		      local numships = SobGroup_SplitGroupReference("SingleCommandAircraft_SOB", "aircombat_jets"..playerIndex, "Player_Ships"..playerIndex, jet_num)
					for counter = 0, numships - 1, 1 do
		      	if SobGroup_IsDoingAbility("SingleCommandAircraft_SOB"..counter, AB_Dock) == 0 and 
		      	SobGroup_IsDoingAbility("SingleCommandAircraft_SOB"..counter, AB_Move) == 0 and 
		      	SobGroup_IsDoingAbility("SingleCommandAircraft_SOB"..counter, AB_Attack) == 0 and 
		      	SobGroup_IsDoingAbility("SingleCommandAircraft_SOB"..counter, AB_Hyperspace) == 0 and 
		      	SobGroup_IsDoingAbility("SingleCommandAircraft_SOB"..counter, AB_HyperspaceViaGate) == 0 and 
		      	SobGroup_IsDocked("SingleCommandAircraft_SOB"..counter) == 0 and 
		      	SobGroup_AreAllInRealSpace("SingleCommandAircraft_SOB"..counter)==1 and 
		      	SobGroup_GetActualSpeed("SingleCommandAircraft_SOB"..counter) <= 1 then
		      		SobGroup_DockSobGroup_random_pseudo("SingleCommandAircraft_SOB"..counter, "meg_carrier_huge"..playerIndex, 1)		--stay docked
		      	end
		      end
		      --Establish build list
					local fighterjets = {"meg_mig25"}
					if Player_HasResearch(playerIndex, "Aircombat_FighterTech1") == 1 then
						fighterjets = Table_CombineWithTable(fighterjets, {"meg_su27","meg_f14","meg_f15"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_FighterTech2") == 1 then
						fighterjets = Table_CombineWithTable(fighterjets, {"meg_f22","meg_f23","meg_t50"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_FighterTech3") == 1 then
						fighterjets = Table_CombineWithTable(fighterjets, {"meg_x45"})
					end
					local strikecraft = {"meg_a10","meg_su25"}
					if Player_HasResearch(playerIndex, "Aircombat_StrikecraftTech1") == 1 then
						strikecraft = Table_CombineWithTable(strikecraft, {"meg_f16","meg_f18","meg_mig29","meg_su34","meg_su35"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_StrikecraftTech2") == 1 then
						strikecraft = Table_CombineWithTable(strikecraft, {"meg_f35","meg_migmfi","meg_su47"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_StrikecraftTech3") == 1 then
						strikecraft = Table_CombineWithTable(strikecraft, {"meg_av8"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_StrikecraftTech4") == 1 then
						strikecraft = Table_CombineWithTable(strikecraft, {"meg_f117"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_StrikecraftTech5") == 1 then
						strikecraft = Table_CombineWithTable(strikecraft, {"meg_x47"})
					end
					local bombers = {}
					if Player_HasResearch(playerIndex, "Aircombat_BomberTech1") == 1 then
						bombers = Table_CombineWithTable(bombers, {"meg_b52"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_BomberTech2") == 1 then
						bombers = Table_CombineWithTable(bombers, {"meg_b1","meg_tu160"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_BomberTech3") == 1 then
						bombers = Table_CombineWithTable(bombers, {"meg_b2"})
					end
					local specialplanes = {}
					if Player_HasResearch(playerIndex, "Aircombat_SpecialTech1") == 1 then
						specialplanes = Table_CombineWithTable(specialplanes, {"meg_sr71"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_SpecialTech2") == 1 then
						specialplanes = Table_CombineWithTable(specialplanes, {"meg_e767"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_SpecialTech3") == 1 then
						specialplanes = Table_CombineWithTable(specialplanes, {"meg_kc10"})
					end
					if Player_HasResearch(playerIndex, "Aircombat_SpecialTech4") == 1 then
						specialplanes = Table_CombineWithTable(specialplanes, {"meg_c5"})
					end
					local emtpylist_bomber = 0
					local emtpylist_special = 0
					if getn(bombers) == 0 then
						emtpylist_bomber = 1
					end
					if getn(specialplanes) == 0 then
						emtpylist_special = 1
					end
		      --Aircraft Carrier
		      local numships = SobGroup_SplitGroupReference("SingleSpawnAircraftCarrier_SOB", "meg_carrier_huge"..playerIndex, "Player_Ships"..playerIndex, AC_num)
					for counter = 0, numships - 1, 1 do
						--spawn jets
						if jet_num < AC_capacity*AC_num then
							if pilotrecruitList[playerIndex+1] - pilotpopList[playerIndex+1] >= 1 then
								Volume_AddSphere("VOL_AirCombatJetSpawnTarget", SobGroup_GetPosition("SingleSpawnAircraftCarrier_SOB"..counter), 6000)
								SobGroup_Create("JetsToSpawn"..playerIndex)
								SobGroup_Create("SpanwedJetsToCombine"..playerIndex)
								local buildspeed = 40
								for b=1,4,1 do
									if Player_HasResearch(playerIndex, "AirCombatBuildUpgrade"..b ) == 1 then
										buildspeed=buildspeed+b*10
									end
								end
								local assemblyline = 1
								for b=1,3,1 do
									if Player_HasResearch(playerIndex, "AirCombatAssemblyLineUpgrade"..b ) == 1 then
										assemblyline=assemblyline+1
									end
								end
								for y=1,assemblyline,1 do
									if buildspeed>=random_pseudo(1,150) then
										--hero units
										local CombatRatio = AirCombat_UnitsSpawned.fighter[playerIndexList]/(AirCombat_UnitsSpawned.hero_fighter[playerIndexList]+1)
										if CombatRatio > 50 and SobGroup_Empty("aircombat_herofighter"..playerIndex) == 1 and Player_HasResearch(playerIndex, "Aircombat_FighterTech1") == 1 then
											fighterjets = Table_CombineWithTable(fighterjets, {"meg_su27_elite"})
										end
										local CombatRatio = AirCombat_UnitsSpawned.striker[playerIndexList]/(AirCombat_UnitsSpawned.hero_striker[playerIndexList]+1)
										if CombatRatio > 50 and SobGroup_Empty("aircombat_herostriker"..playerIndex) == 1 and Player_HasResearch(playerIndex, "Aircombat_StrikecraftTech1") == 1 then
											strikecraft = Table_CombineWithTable(strikecraft, {"meg_f18_elite"})
										end
										--decide what to spawn
										local build_order = random_pseudo(1,100)
										local listname = fighterjets
										if build_order <= 30 + emtpylist_bomber*10 + emtpylist_special*10 then
											listname = strikecraft
										elseif build_order <= 50-emtpylist_bomber*10 then
											listname = bombers
										elseif build_order <= 60-emtpylist_special*10 then
											listname = specialplanes
										end
										if getn(listname) > 0 then
											local aircraft=Table_RandomElement(listname)
											SobGroup_Clear("JetsToSpawn"..playerIndex)
											AI_SobGroup_SpawnNewShipInSobGroup(playerIndex, aircraft, "Airplane", "JetsToSpawn"..playerIndex, "VOL_AirCombatJetSpawnTarget")
											SobGroup_SobGroupAdd(aircraft..playerIndex, "JetsToSpawn"..playerIndex)
											SobGroup_SobGroupAdd("SpanwedJetsToCombine"..playerIndex, "JetsToSpawn"..playerIndex)
											--count jets spawned
											if listname == fighterjets then
												SobGroup_SobGroupAdd("aircombat_fighterjets"..playerIndex, "JetsToSpawn"..playerIndex)
												AirCombat_UnitsSpawned.fighter[playerIndexList] = AirCombat_UnitsSpawned.fighter[playerIndexList] + 1
												if SobGroup_AreAnyOfTheseTypes("JetsToSpawn"..playerIndex, "meg_su27_elite") == 1 then
													SobGroup_SobGroupAdd("aircombat_herofighter"..playerIndex, "JetsToSpawn"..playerIndex)
													AirCombat_UnitsSpawned.hero_fighter[playerIndexList] = AirCombat_UnitsSpawned.hero_fighter[playerIndexList] + 1
												end
											elseif listname == strikecraft then
												SobGroup_SobGroupAdd("aircombat_strikecraft"..playerIndex, "JetsToSpawn"..playerIndex)
												AirCombat_UnitsSpawned.striker[playerIndexList] = AirCombat_UnitsSpawned.striker[playerIndexList] + 1
												if SobGroup_AreAnyOfTheseTypes("JetsToSpawn"..playerIndex, "meg_f18_elite") == 1 then
													SobGroup_SobGroupAdd("aircombat_herostriker"..playerIndex, "JetsToSpawn"..playerIndex)
													AirCombat_UnitsSpawned.hero_striker[playerIndexList] = AirCombat_UnitsSpawned.hero_striker[playerIndexList] + 1
												end
											elseif listname == bombers then
												SobGroup_SobGroupAdd("aircombat_bombers"..playerIndex, "JetsToSpawn"..playerIndex)
												AirCombat_UnitsSpawned.bomber[playerIndexList] = AirCombat_UnitsSpawned.bomber[playerIndexList] + 1
											elseif listname == specialplanes then
												SobGroup_SobGroupAdd("aircombat_specialplanes"..playerIndex, "JetsToSpawn"..playerIndex)
												AirCombat_UnitsSpawned.special[playerIndexList] = AirCombat_UnitsSpawned.special[playerIndexList] + 1
											end
											--hero unit notification
											if playerIndex == Universe_CurrentPlayer() then
												if SobGroup_AreAnyOfTheseTypes("JetsToSpawn"..playerIndex, "meg_su27_elite") == 1 then
													Subtitle_AddAccordingToRace(playerIndex,"Air combat hero units have arrived! Air supriority fighters: Swifts",3.72)
													UI_PlaySound("SFX_ReinforcementsHaveArrived_soviet")
												elseif SobGroup_AreAnyOfTheseTypes("JetsToSpawn"..playerIndex, "meg_f18_elite") == 1 then
													Subtitle_AddAccordingToRace(playerIndex,"Air combat hero units have arrived! Multirole fighters: Blue Angels",3.72)
													UI_PlaySound("SFX_ReinforcementsHaveArrived_US")
												end
											end
										end
									end
								end
								Volume_Delete("VOL_AirCombatJetSpawnTarget")
								SobGroup_SobGroupAdd("aircombat_jets"..playerIndex, "SpanwedJetsToCombine"..playerIndex)
								SobGroup_DockSobGroupInstant("SpanwedJetsToCombine"..playerIndex, "SingleSpawnAircraftCarrier_SOB"..counter)
								SobGroup_Clear("SpanwedJetsToCombine"..playerIndex)
							end
						end
						SobGroup_Create("AirStrike_SOB")
						SobGroup_Clear("AirStrike_SOB")
						SobGroup_GetSobGroupDockedWithGroup("SingleSpawnAircraftCarrier_SOB"..counter, "AirStrike_SOB")
						--launch jets
						if SobGroup_IsDoingAbility("SingleSpawnAircraftCarrier_SOB"..counter, AB_Attack) == 1 and 
						SobGroup_GetTactics("SingleSpawnAircraftCarrier_SOB"..counter) ~= 2 then --don't launch under passive tactics
							SobGroup_Launch_Smart("AirStrike_SOB", "SingleSpawnAircraftCarrier_SOB"..counter)
							SobGroup_GuardSobGroup("AirStrike_SOB", "SingleSpawnAircraftCarrier_SOB"..counter)
						end
						--ping
						local megalitenoowner14 = Ping_AddSobGroup("Air Combat Command", "megalitenoowner14", "SingleSpawnAircraftCarrier_SOB"..counter)
			      Ping_AddDescription(megalitenoowner14, 0, "Air Superiority Fighters: "..AirCombat_CountPlayerShipsInTable(playerIndex, "aircombat_fighterjets"))
			      Ping_AddDescription(megalitenoowner14, 1, "Multirole Combat Jets: "..AirCombat_CountPlayerShipsInTable(playerIndex, "aircombat_strikecraft"))
			      Ping_AddDescription(megalitenoowner14, 2, "Bombers: "..AirCombat_CountPlayerShipsInTable(playerIndex, "aircombat_bombers"))
			      Ping_AddDescription(megalitenoowner14, 3, "Support Aircraft: "..AirCombat_CountPlayerShipsInTable(playerIndex, "aircombat_specialplanes"))
					end
		    end

--Reinforcement Pad
				if SobGroup_Count("meg_reinforcementpad"..playerIndex) > 0 then  
		      SobGroup_AbilityActivate("meg_reinforcementpad"..playerIndex, AB_Attack, 1)
		      SobGroup_AbilityActivate("meg_reinforcementpad"..playerIndex, AB_Lights, 1)
		      local numships = SobGroup_SplitGroupReference("SingleSpawnReinforcementPad_SOB", "meg_reinforcementpad"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("meg_reinforcementpad"..playerIndex))
					for counter = 0, numships - 1, 1 do
						local countdown = SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "time")
						local supplytype = 10*SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "type")		--0 to 10
						local quantity = SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "number")
						local override = 0
		      	--timer countdown
		      	if countdown > 1 then
		      		countdown = 1
		      	end
		      	if quantity >= 0.1 then
		      		countdown = 0
		      	end
		      	if countdown - 0.01 >= 0 then
		      		SobGroup_SetHardPointHealth_Smart("SingleSpawnReinforcementPad_SOB"..counter, "time", countdown - 0.01)
		      	else
		      		SobGroup_SetHardPointHealth_Smart("SingleSpawnReinforcementPad_SOB"..counter, "time", 0)
		      	end
		      	if Player_HasResearch(playerIndex, "supplydrop4" ) == 0 then
		      		countdown = SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "time")
		      	end
						--intelligent mode for reinforcement
						if Player_GetRU(playerIndex) >= RUMaxCapacityList[playerIndexList] then
							if 4 <= pilotrecruitList[playerIndexList] - pilotpopList[playerIndexList] then
								supplytype = random_pseudo(3,10) 	--switch to fighter or corvette
							end
							override = 1
						end
						if 4 > pilotrecruitList[playerIndexList] - pilotpopList[playerIndexList] then
							supplytype = random_pseudo(1,2)	--switch to RUs
							if Player_GetRU(playerIndex) >= RUMaxCapacityList[playerIndexList] then
								supplytype = 0 	--switch to energy
							end
							override = 1
						end
						SobGroup_SetHardPointHealth_Smart("SingleSpawnReinforcementPad_SOB"..counter, "type_override", 0.1*supplytype)
						--reinforcements have arrived!
						if countdown == 0 then
			      	--print("timer: "..SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "time"))
			      	--print("number: "..SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "number"))
							local subtitle = ""
							if supplytype >= 7 then	--corvette
								subtitle = "Corvettes"
								if Player_GetRace(playerIndex) == Race_Hiigaran then
								  local shiptype = random_pseudo(1, Table_CountElements(HgnboostshipsAlt))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, HgnboostshipsAlt[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Vaygr then
								  local shiptype = random_pseudo(1, Table_CountElements(vaygrboostshipsAlt))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, vaygrboostshipsAlt[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
								  local shiptype = random_pseudo(1, Table_CountElements(KadboostshipsAlt))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, KadboostshipsAlt[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Raider then
								  local shiptype = random_pseudo(1, Table_CountElements(RadboostshipsAlt))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, RadboostshipsAlt[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Keeper then
								  local shiptype = random_pseudo(1, Table_CountElements(KprboostshipsAlt))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, KprboostshipsAlt[shiptype])
								end
							elseif supplytype >=3 then  --fighter
								subtitle = "Fighters"
								if Player_GetRace(playerIndex) == Race_Hiigaran then
								  local shiptype = random_pseudo(1, Table_CountElements(Hgnboostships))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, Hgnboostships[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Vaygr then
								  local shiptype = random_pseudo(1, Table_CountElements(vaygrboostships))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, vaygrboostships[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
								  local shiptype = random_pseudo(1, Table_CountElements(Kadboostships))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, Kadboostships[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Raider then
								  local shiptype = random_pseudo(1, Table_CountElements(Radboostships))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, Radboostships[shiptype])
								elseif Player_GetRace(playerIndex) == Race_Keeper then
								  local shiptype = random_pseudo(1, Table_CountElements(Kprboostships))
									SobGroup_CreateShip_InstantSpawnDock("SingleSpawnReinforcementPad_SOB"..counter, Kprboostships[shiptype])
								end
							elseif supplytype >= 1 then	--RUs
								subtitle = "1000 RUs"
								AccoladesAddRU(playerIndex, 1000)
							else																	--energy
								subtitle = "50 Energy"
								local powermax = LastpowerListMax[playerIndexList]
								if powerListStored[playerIndexList] + 50 > powermax then
									powerListStored[playerIndexList] = powermax
								else
									powerListStored[playerIndexList] = powerListStored[playerIndexList] + 50
								end
							end
							--localization
							if playerIndex == Universe_CurrentPlayer() and Camera_GetDistanceToSobGroup("SingleSpawnReinforcementPad_SOB"..counter) < 12000 then
			     			Subtitle_AddAccordingToRace(playerIndex,"Reinforcements have arrived: "..subtitle,3.72)
			     			UI_PlaySound("SFX_NewReinforcementsAvailable")
			     		end
							--reset timer and type
							local newtimer = 1
							if Player_HasResearch(playerIndex, "supplydrop3" ) == 1 then
								newtimer = 0.55
							elseif Player_HasResearch(playerIndex, "supplydrop2" ) == 1 then
								newtimer = 0.70
							elseif Player_HasResearch(playerIndex, "supplydrop1" ) == 1 then
								newtimer = 0.85
							end
							SobGroup_SetHardPointHealth_Smart("SingleSpawnReinforcementPad_SOB"..counter, "time", newtimer)
							SobGroup_SetHardPointHealth_Smart("SingleSpawnReinforcementPad_SOB"..counter, "type", 0.1*random_pseudo(1,10))
							--extra fun
							if Player_HasResearch(playerIndex, "supplydrop4" ) == 1 then
								quantity = quantity + 0.1
							else
								quantity = 0
							end
							if quantity >= 0.2 then
								quantity = 0
							end
							SobGroup_SetHardPointHealth_Smart("SingleSpawnReinforcementPad_SOB"..counter, "number", quantity)
							--print("new timer: "..SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "time"))
			      	--print("new number: "..SobGroup_GetHardPointHealth("SingleSpawnReinforcementPad_SOB"..counter, "number"))
						end
						--ping
						local megalitenoowner6 = Ping_AddSobGroup("Supply Zone", "megalitenoowner6", "SingleSpawnReinforcementPad_SOB"..counter)
						if supplytype >= 7 then	--corvette
							Ping_AddDescription(megalitenoowner6, 0, "Next Supply: Corvettes")
						elseif supplytype >= 3 then  --fighter
							Ping_AddDescription(megalitenoowner6, 0, "Next Supply: Fighters")
						elseif supplytype >= 1 and supplytype >= 4 then	--RUs
							Ping_AddDescription(megalitenoowner6, 0, "Next Supply: 1000 RUs")
						else																		--energy
							Ping_AddDescription(megalitenoowner6, 0, "Next Supply: 50 Energy")
						end
						Ping_AddDescription(megalitenoowner6, 1, "Supply Countdown: "..floor(countdown*100))
		      	
					end
		    end

--Derelict Battleship
				if SobGroup_Count("derelictbattleships"..playerIndex) > 0 then  
				  SobGroup_AbilityActivate("derelictbattleships"..playerIndex, AB_Attack, 1)
				  SobGroup_AbilityActivate("derelictbattleships"..playerIndex, AB_Lights, 1)
		      local numships = SobGroup_SplitGroupReference("SinglePingDerelictBattleship_SOB", "derelictbattleships"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("derelictbattleships"..playerIndex))
					for counter = 0, numships - 1, 1 do
				    local aim = "30%"
				    local firepower = "30%"
			      if Player_HasResearch(playerIndex, "derelictbattleshipaim3" ) == 1 then
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "aim", 1)
				      aim = "100%"
			      elseif Player_HasResearch(playerIndex, "derelictbattleshipaim2" ) == 1 then
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "aim", 0.64)
				      aim = "75%"
			      elseif Player_HasResearch(playerIndex, "derelictbattleshipaim1" ) == 1 then
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "aim", 0.29)
				      aim = "50%"
			      else
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "aim", 0)
			      end
			      if Player_HasResearch(playerIndex, "derelictbattleshipdamage3" ) == 1 then
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "firepower", 1)
				      firepower = "100%"
			      elseif Player_HasResearch(playerIndex, "derelictbattleshipdamage2" ) == 1 then
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "firepower", 0.64)
				      firepower = "75%"
			      elseif Player_HasResearch(playerIndex, "derelictbattleshipdamage1" ) == 1 then
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "firepower", 0.29)
				      firepower = "50%"
			      else
				      SobGroup_SetHardPointHealth_Smart("SinglePingDerelictBattleship_SOB"..counter, "firepower", 0)
			      end
			      local megalitenoowner7 = Ping_AddSobGroup("Artillery Bombardment", "megalitenoowner7", "SinglePingDerelictBattleship_SOB"..counter)		       
				    Ping_AddDescription(megalitenoowner7, 0, "Aiming System: "..aim)
				    Ping_AddDescription(megalitenoowner7, 1, "Munition System: "..firepower)
				  end
				end

--Research Booster
				local research_dummy_spawn_radius = 5000
				--dummy objects for research boosting
				if SobGroup_Empty("meg_dummy_researchbooster"..playerIndex) == 0 then
					if SobGroup_Empty("meg_bentus"..playerIndex) == 1 then
						SobGroup_SetHealth("meg_dummy_researchbooster"..playerIndex, 0) --no speed booster present, kill all spawned dummy objects
						print("Killing all research boosters for player index: "..playerIndex..", game year: "..year)
					else
						local numships = SobGroup_SplitGroupReference("SingleResearchDummyBooster_SOB", "meg_dummy_researchbooster"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("meg_dummy_researchbooster"..playerIndex))
						for counter = 0, numships - 1, 1 do
							local ship="SingleResearchDummyBooster_SOB"..counter
							if SobGroup_IsDoingAbility(ship, AB_Guard) == 0 or SobGroup_IsGroupNearybyExcludingSelf(ship, "meg_bentus"..playerIndex, research_dummy_spawn_radius) == 0 then
								SobGroup_SetHealth(ship, 0)
								print("Killing research booster for player index: "..playerIndex..", game year: "..year)
							end
						end
					end
				end
				--spawn new dummy research boosters
				local researchboost_text = "+25% Research Speed"
				local researchboost_limit = 1
				if Player_HasResearch(playerIndex, "researchspeedboost3" ) == 1 then
	      	researchboost_text = "+100% Research Speed"
	      	researchboost_limit = 4
        elseif Player_HasResearch(playerIndex, "researchspeedboost2" ) == 1 then
	      	researchboost_text = "+75% Research Speed"
	      	researchboost_limit = 3
        elseif Player_HasResearch(playerIndex, "researchspeedboost1" ) == 1 then
	      	researchboost_text = "+50% Research Speed"
	      	researchboost_limit = 2
	      end
				if SobGroup_Count("meg_bentus"..playerIndex) > 0 then
		      local numships = SobGroup_SplitGroupReference("SingleSpawnResearchBooster_SOB", "meg_bentus"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("meg_bentus"..playerIndex))
					for counter = 0, numships - 1, 1 do
						local ship="SingleSpawnResearchBooster_SOB"..counter
						if SobGroup_CountPlayerNearybyShipsByType(ship, research_dummy_spawn_radius, "meg_dummy_researchbooster") < researchboost_limit and
						SobGroup_AreAllInRealSpace(ship) == 1 then
							local VOL = "VOL_ResearchDummySpawn"..playerIndex
							Volume_AddSphere(VOL, SobGroup_GetPosition(ship), research_dummy_spawn_radius)
							SobGroup_Create("SOB_ResearchDummySpawn")
							SobGroup_SpawnNewShipInSobGroup(playerIndex, "meg_dummy_researchbooster", "InstantSpawn", "SOB_ResearchDummySpawn", VOL)
							print("Spawning research booster for player index: "..playerIndex..", game year: "..year)
							--SobGroup_MakeUntargeted("SOB_ResearchDummySpawn")
							SobGroup_GuardSobGroup("SOB_ResearchDummySpawn", ship)
							SobGroup_SobGroupAdd("meg_dummy_researchbooster"..playerIndex, "SOB_ResearchDummySpawn")
							SobGroup_Clear("SOB_ResearchDummySpawn")
							Volume_Delete(VOL)
						end
						--ping each ship individually
						local megalitenoowner16 = Ping_AddSobGroup("Research Improver", "megalitenoowner16", ship)
	          Ping_LabelVisible(megalitenoowner16, 1)
			      Ping_AddDescription(megalitenoowner16, 0, researchboost_text)
			      local dummy_researchbooster_count = SobGroup_Count("meg_dummy_researchbooster"..playerIndex)
			      Ping_AddDescription(megalitenoowner16, 1, "Total Divisions: "..dummy_researchbooster_count)
			      local researchbooster_text = ""..floor(100*1.25^dummy_researchbooster_count)
		      	if strlen(researchbooster_text) > 5 then --like "98.25"
		      		researchbooster_text = strsub(researchbooster_text, 1, 5)
		      	end
		      	if Player_HasResearch(playerIndex, "researchspeedboost4" ) == 1 then
		      		Ping_AddDescription(megalitenoowner16, 2, "Total Efficiency: Boundless")
		      	else
		      		Ping_AddDescription(megalitenoowner16, 2, "Total Efficiency: "..researchbooster_text.."%")
		      	end
					end
				end
				--instantly grant research for high level research boost
				if (SobGroup_Count("meg_bentus"..playerIndex) > 0 and Player_HasResearch(playerIndex, "researchspeedboost4" ) == 1) or SobGroup_Count("meg_bentusiexchange"..playerIndex) > 0 then
					local researchNUM = 0
					local iRace = Player_GetRace(playerIndex) + 1
					dofilepath([[data:scripts/race.lua]])
					if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
						dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
						for z, iCount in research do
							if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 then
							  researchNUM = researchNUM + 1
							end
						end
					end
					if researchNUM > 0 then
					  for z, iCount in research do
							if Player_HasQueuedResearch(playerIndex, iCount.Name) == 1 and Player_GetRU(playerIndex) > iCount.Cost then
								Player_CancelResearch(playerIndex, iCount.Name)
								Player_GrantResearchOption(playerIndex, iCount.Name)
								Player_SetRU(playerIndex, Player_GetRU(playerIndex) - iCount.Cost)
								researchburned[playerIndexList] = researchburned[playerIndexList] + iCount.Cost
								print("Instant research boost for player index: "..playerIndex..", game year: "..year..", item granted: "..iCount.Name)
							end
						end
					end
				end
					
--Ghost Ship
				if SobGroup_Count("meg_ghostship"..playerIndex) > 0 then
		     	AI_GhostAttack(playerIndex)	--defined in ai.lua
				end

---AI cattura Mining Base, fa la procedura per tutti i megalithes
     
        if Player_HasResearch(playerIndex, "isai") == 1 then  --this function is likely associated with the 00000010 crash (DISPROVED!); removing it cannot prevent 00000000 crash (could it be battlescar on the megaliths? NOT LIKELY!) --00000000 crash is actually very likely related to excessive damage sound
        	local capture_range = 25000 + 50*pilotpopList[playerIndexList]*CPULODvalueList[playerIndexList] + 100*sqrt(Player_GetRU(playerIndex))
        	local capture_spawn = 3 + CPULODvalueList[playerIndexList]
        	SobGroup_SobGroupAdd("megalithtocapture"..playerIndex, "all_capturablemegaliths")
        	SobGroup_SobGroupAdd("megalithtocapture"..playerIndex, "all_shipwreck")	--capture hulks as well
        	SobGroup_SobGroupSubstract("megalithtocapture"..playerIndex, "Player_Ships"..playerIndex)	--don't capture own ships
        	SobGroup_SobGroupSubstract("megalithtocapture"..playerIndex, "allies"..playerIndex)	--don't capture allied ships
        	SobGroup_SobGroupAdd("megalithtocapture"..playerIndex, "meg_crate")	--add crates to the capture list	--removing this cannot prevent the 00000010 crash (but somewhat alleviates it -- are crates causing the crash? DISPROVED! Still crashed after crates are turned off.)
        	if SobGroup_Empty("megalithtocapture"..playerIndex) == 0 then
        		SobGroup_Clear("temp")
	        	local CapturerList = {
	        	{race = Race_Hiigaran, tech = "MarineTech", capturer = "hgn_marinefrigate", builders = {"hgn_mothership", "hgn_shipyard", "hgn_battleshipyard", "hgn_shipyard_g", "hgn_carrier", "hgn_battlecarrier", "hgn_battlestation", "hgn_commandfortress", "hgn_ark"}},
	        	{race = Race_Vaygr, tech = "FrigateInfiltrationTech", capturer = "vgr_infiltratorfrigate", builders = {"vgr_mothership", "vgr_shipyard", "vgr_carrier"}},
	        	{race = Race_Kadeshi, tech = "HyperspaceTech", capturer = "kad_podship", builders = {"kad_needleship"}},
	        	{race = Race_Raider, tech = "Cap_Unlock1", capturer = "rad_gunfrigate", builders = {"rad_carrier", "rad_carrier_black", "rad_blackmarket", "rad_mothership"}},
	        	{race = Race_Keeper, tech = "DeceiverTech", capturer = "kpr_deciever", builders = {"kpr_shipyard_old", "kpr_carrier"}}
	        	}
	        	local goCapture = 0
	      		if SobGroup_Empty("productioncapital"..playerIndex) == 0 then
	      			SobGroup_Clear("targetmegalith"..playerIndex)
	      			if SobGroup_FillProximitySobGroup("targetmegalith"..playerIndex, "megalithtocapture"..playerIndex, "productioncapital"..playerIndex, capture_range) == 1 then
	      				goCapture = 1
	            end
	          end
	          if goCapture == 1 then
		        	for z, iCount in CapturerList do
		        		if Player_GetRace(playerIndex) == iCount.race then
		        			SobGroup_Clear("capturer"..playerIndex)
									if SobGroup_FillProximitySobGroup("capturer"..playerIndex, iCount.capturer..playerIndex, "targetmegalith"..playerIndex, capture_range) == 1 then
										local numships = SobGroup_SplitGroupReference("SingleAIMegalithCapturer_SOB", "capturer"..playerIndex, "targetmegalith"..playerIndex, SobGroup_Count("capturer"..playerIndex))
										if numships >= 1 then
											local shipID = 0
											for k=0,CPULODvalueList[playerIndexList],1 do
												if shipID <= numships-1 then
													local single_capturer = "SingleAIMegalithCapturer_SOB"..shipID
													if SobGroup_Count(single_capturer) == 1 then
														if SobGroup_HealthPercentage(single_capturer) > 0.1 and 
														SobGroup_IsDoingAbility(single_capturer, AB_Capture) == 0 and 
														SobGroup_SobGroupCompare("SOB_PlayerWaves"..playerIndex, single_capturer) == 0 and 
														SobGroup_GetHardPointHealth(single_capturer, "experience") * 10000 > 3 and SobGroup_GetHardPointHealth(single_capturer, "experience") < 0.5 then 	--issue the command only after launch
															FindNearestMegalithAndCapture(single_capturer, "targetmegalith"..playerIndex, capture_range)		--this is not the cause for the 00000010 crash (crash still happens after switching megaliths to AI players)
														end
													end
												else
													break
												end
												shipID = shipID + 1
											end
										end
									end
									if Player_GetRU(playerIndex) > 1000 then	--build a capturer from nearby ship (regardless of whether there are existing capturers around the megalith)
										if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, iCount.capturer) < capture_spawn and Player_HasResearch(playerIndex, iCount.tech) == 1 then
											SobGroup_Create("capturer_builders")
											SobGroup_Clear("capturer_builders")
											SobGroup_AddPlayerShipsInList("capturer_builders", playerIndex, iCount.builders)
											SobGroup_Create("nearby_builders")
											SobGroup_Clear("nearby_builders")
											if SobGroup_FillProximitySobGroup("nearby_builders", "capturer_builders", "targetmegalith"..playerIndex, capture_range) == 1 then
												local numbuilders = SobGroup_SplitGroupReference("SingleBuildMegalithCapturer_SOB", "nearby_builders", "targetmegalith"..playerIndex, SobGroup_Count("nearby_builders"))
			                  if numbuilders >= 1 then
				                  local builderID = random_pseudo(0,numbuilders-1)
			                  	if SobGroup_Count("SingleBuildMegalithCapturer_SOB"..builderID) == 1 then
			                  		SobGroup_CreateShip("SingleBuildMegalithCapturer_SOB"..builderID, iCount.capturer)
			                  	end
			                  end
			                end
			              end
		              end
		              break	--race found, break the loop
		            end
	        		end
	        	end
	        end
        	SobGroup_Clear("megalithtocapture"..playerIndex)
	      end          
         
---Aggiorna l'interfaccia        
        if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<35) or year>0) then
          UI_SetTextLabelText("UnitCapInfoPopup", "lblmegalith", ""..megalithList[playerIndexList]);                
        end                
      end
    end     
    playerIndex = playerIndex + 1
  end  
---inside time x AI  
  if collectorinsidetime >= 50 then
    collectorinsidetime = 0
  end       
  collectorinsidetime = collectorinsidetime + 1  
  --print("megalith -- End")
end

function FindNearestMegalithAndCapture(ship, target, maxrange)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	local distance = 10000
	local breaker = 0
	SobGroup_Create("SOB_MegalithToCaputureAI")
	SobGroup_Clear("SOB_MegalithToCaputureAI")
	while distance <= maxrange and breaker == 0 do
		if SobGroup_FillProximitySobGroup("SOB_MegalithToCaputureAI", target, ship, distance) == 1 then
			breaker = 1
		end
		distance = distance*1.1		-- + 1000*(1+CPULODvalueList[playerIndexList]) 
	end
	if SobGroup_Empty("SOB_MegalithToCaputureAI") == 0 then
		if random_pseudo(1,2) == 1 and 
		SobGroup_IsDocked(ship) == 0 and 
		SobGroup_IsDoingAbility(ship, AB_Dock) == 0 and 
		SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and 
		SobGroup_IsDoingAbility(ship, AB_HyperspaceViaGate) == 0 and 
		SobGroup_CanDoAbility(ship, AB_Move) == 1 and 
		SobGroup_CanDoAbility(ship, AB_Capture) == 1 and 
		SobGroup_IsSelectable(ship) == 1 and 
		SobGroup_AreAllInRealSpace(ship) == 1 then
			if SobGroup_Count("SOB_MegalithToCaputureAI") == 1 then
				local capture_target = "SOB_MegalithToCaputureAI"
				if SobGroup_HealthPercentage(capture_target) > 0 and 
				SobGroup_IsDoingAbility(capture_target, AB_Dock) == 0 and 
				SobGroup_IsDocked(capture_target) == 0 and 
				SobGroup_IsDoingAbility(capture_target, AB_Hyperspace) == 0 and 
				SobGroup_IsDoingAbility(capture_target, AB_HyperspaceViaGate) == 0 and 
				(SobGroup_OwnedBy(capture_target) < 0 or AreAllied(playerIndex, SobGroup_OwnedBy(capture_target)) == 0) and 
				playerIndex ~= SobGroup_OwnedBy(capture_target) and 
				SobGroup_IsSelectable(capture_target) == 1 and 
				SobGroup_InWorldBound(capture_target, 1) == 1 and 	--don't capture megaliths out of inner bounds
				SobGroup_AreAllInRealSpace(capture_target) == 1 then
					local capturers = 0
					if SobGroup_IsAnyShipBeingCaptured(capture_target) == 1 then
						capturers = SobGroup_CountCapturers(capture_target)
					end
					local capture_state = ""
					if capturers > 0 then
						capture_state = " (capturers: "..capturers..")"
					end
					--print(""..ship.." owned by player "..playerIndex.." is trying to capture "..capture_target.." owned by player "..SobGroup_OwnedBy(capture_target)..capture_state..", year: "..year)
					SobGroup_CaptureSobGroup(ship, capture_target)
					CPU_RemoveSobGroup(playerIndex, ship)
					return 1
				end
			else
				local numships = SobGroup_SplitGroupReference("SingleAIMegalithToCapture_SOB", "SOB_MegalithToCaputureAI", ship, SobGroup_Count("SOB_MegalithToCaputureAI"))
				if numships >= 1 then
					local targetID = random_pseudo(0,numships-1)
					local capture_target = "SingleAIMegalithToCapture_SOB"..targetID
					if SobGroup_HealthPercentage(capture_target) > 0 and 
					SobGroup_IsDoingAbility(capture_target, AB_Dock) == 0 and 
					SobGroup_IsDocked(capture_target) == 0 and 
					SobGroup_IsDoingAbility(capture_target, AB_Hyperspace) == 0 and 
					SobGroup_IsDoingAbility(capture_target, AB_HyperspaceViaGate) == 0 and 
					(SobGroup_OwnedBy(capture_target) < 0 or AreAllied(playerIndex, SobGroup_OwnedBy(capture_target)) == 0) and 
					playerIndex ~= SobGroup_OwnedBy(capture_target) and 
					SobGroup_IsSelectable(capture_target) == 1 and 
					SobGroup_AreAllInRealSpace(capture_target) == 1 then
						local capturers = 0
						if SobGroup_IsAnyShipBeingCaptured(capture_target) == 1 then
							capturers = SobGroup_CountCapturers(capture_target)
						end
						local capture_state = ""
						if capturers > 0 then
							capture_state = " (capturers: "..capturers..")"
						end
						--print(""..ship.." owned by player "..playerIndex.." is trying to capture "..capture_target.." owned by player "..SobGroup_OwnedBy(capture_target)..capture_state..", year: "..year)
						SobGroup_CaptureSobGroup(ship, capture_target)
						CPU_RemoveSobGroup(playerIndex, ship)
						return 1
					end
				end
			end
		elseif random_pseudo(1,2) == 1 then	--chance-based capture, keeps the AI working in some cases
			if SobGroup_SobGroupCompare("haxor_all_shipswithoutai", ship) == 0 then
				--print("AI resumed for "..ship.." owned by player "..playerIndex.." from chance-based capture, year: "..year)
				CPU_AddSobGroup(playerIndex, ship)
			end
		end
	else
		if SobGroup_SobGroupCompare("haxor_all_shipswithoutai", ship) == 0 then
			--print("AI resumed for "..ship.." owned by player "..playerIndex.." due to no capture target, year: "..year)
			CPU_AddSobGroup(playerIndex, ship)
		end
	end
	return 0
end

---Plant management-----------------------------------------------------------

function planetmanagement() 
  for i = 1,6,1 do   
    planetList[i] = 0
  end
  if SobGroup_Empty("planet_mercury") == 0 then
    planetmanagementExecute("planet_mercury", 42000, 1)
  end
  if SobGroup_Empty("planet_venus") == 0 then
    planetmanagementExecute("planet_venus", 57000, 2)
  end
  if SobGroup_Empty("planet_earth") == 0 then
		planetmanagementExecute("planet_earth", 57000, 3)
	end
  if SobGroup_Empty("planet_moon") == 0 then
    planetmanagementExecute("planet_moon", 42000, 4)
  end  
	if SobGroup_Empty("planet_mars") == 0 then	
	  planetmanagementExecute("planet_mars", 57000, 5)	
	end  
	if SobGroup_Empty("planet_jupiter") == 0 then	
	  planetmanagementExecute("planet_jupiter", 112000, 6)	
	end  
	if SobGroup_Empty("planet_europa") == 0 then	
	  planetmanagementExecute("planet_europa", 42000, 7)	
	end  
	if SobGroup_Empty("planet_io") == 0 then	
	  planetmanagementExecute("planet_io", 42000, 8)	
	end  
	if SobGroup_Empty("planet_callisto") == 0 then	
	  planetmanagementExecute("planet_callisto", 42000, 9)	
	end  
	if SobGroup_Empty("planet_ganymeade") == 0 then	
	  planetmanagementExecute("planet_ganymeade", 42000, 10)	
	end  
	if SobGroup_Empty("planet_saturn") == 0 then	
	  planetmanagementExecute("planet_saturn", 112000, 11)	
	end  
	if SobGroup_Empty("planet_uranus") == 0 then	
	  planetmanagementExecute("planet_uranus", 72000, 12)	
	end
	if SobGroup_Empty("planet_neptune") == 0 then	
	  planetmanagementExecute("planet_neptune", 72000, 13)	
	end  
	if SobGroup_Empty("planet_pluto") == 0 then	
	  planetmanagementExecute("planet_pluto", 42000, 14)	
	end
	Rule_RandomInterval("planetmanagement", 2, 0.1)
end

function planetmanagementExecute(pianeta, raggio, indexList)
	local OwnerIndex = SobGroup_OwnedBy(pianeta)
	local OwnerIndexList = OwnerIndex+1
	local giocatore = {0,-1}
	local playerIndex = 0  
	local colonizers = 0 
	local invaders = 0  
	local guest = 0  	                
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then            
        if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..playerIndex, pianeta, (raggio-1000)) == 1 then
        	local colonizer_present = 0
        	if SobGroup_AreAnyOfTheseTypes("temp", "hgn_mothership, vgr_mothership, vgr_commandfortress, hgn_battlestation, kad_needleship, rad_blackmarket, rad_mothership, kpr_shipyard_old") == 1 then
          	colonizer_present = 1
          end
          if SobGroup_OwnedBy(pianeta) >= 0 then
            if playerIndex == SobGroup_OwnedBy(pianeta) then
	            if colonizer_present == 1 then              
	              giocatore[1] = giocatore[1] + 1
	            end
	            colonizers = colonizers + SobGroup_Count("temp")	            
	          elseif AreAllied(playerIndex, SobGroup_OwnedBy(pianeta)) == 1 then                
            	guest = guest + SobGroup_Count("temp")  
            else
	            if colonizer_present == 1 then
	            	giocatore[1] = giocatore[1] + 1  
	            	giocatore[2] = playerIndex
	            end	 
	            invaders = invaders + SobGroup_Count("temp")              							
	          end  
          else
            if colonizer_present == 1 then
            	giocatore[1] = giocatore[1] + 1  
            	giocatore[2] = playerIndex
            end	
            invaders = invaders + SobGroup_Count("temp")                       
          end    	  
				  
				else          		
				end  				
				--if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<35) or year>0) then
        	--UI_SetTextLabelText("UnitCapInfoPopup", "lblplanet", ""..planetList[playerIndex+1]); 
        --end					      	                       
      end
    end
    playerIndex = playerIndex + 1
  end  

	--energy and bombardment calculation
	local health_delta = 0
	local current_health = SobGroup_HealthPercentage(pianeta)
	if current_health > 1 then
		SobGroup_SetHealth(pianeta, 1)
	else
		health_delta = 1-current_health
		if current_health > 0 then
			SobGroup_SetHealth(pianeta, 1)
		end
	end
	local planet_health = 100000000
	if health_delta == 0 then
		planetPopulationList[indexList].car2 = "None"
		planetPopulationList[indexList].dmg = "<c=20FF00>None</c>"
	elseif health_delta < 6000/planet_health then
		planetPopulationList[indexList].car2 = "Light"
		planetPopulationList[indexList].dmg = "<c=FFF200>Light</c>"
	elseif health_delta < 25000/planet_health then
		planetPopulationList[indexList].car2 = "Medium"
		planetPopulationList[indexList].dmg = "<c=FF6C00>Medium</c>"
	else		--death toll above 15
		planetPopulationList[indexList].car2 = "Heavy"
		planetPopulationList[indexList].dmg = "<c=FF0000>Heavy</c>"
	end
	local death_toll = 0
	if health_delta > 0 then
		death_toll = floor(0.1*random_pseudo(0,sqrt(health_delta*planet_health)))
	end
	local energy_generated = floor(log(1+planetPopulationList[indexList].population)*(5-sqrt(death_toll)))
	if energy_generated < 0 then
		energy_generated = 0
	end
	planetPopulationList[indexList].grow = 0 
	planetPopulationList[indexList].dead = death_toll
	planetPopulationList[indexList].en = energy_generated
	planetPopulationList[indexList].car1 = "0"

	--Colonized and Safe---------------------------------------
  if giocatore[1] == 1 then   	
    --switch del pianeta se solo 1 giocatore e nemico    		
		if (giocatore[2] >= 0) and (SobGroup_OwnedBy(pianeta) ~= giocatore[2]) then
			if planetPopulationList[indexList].occupationtimer == 0 then
				SobGroup_SwitchOwner(pianeta, giocatore[2])        
				if giocatore[2] == Universe_CurrentPlayer() then
					UI_SetScreenEnabled(pianeta, 1)		
					UI_SetScreenVisible(pianeta, 1)		
					UI_SetTextLabelText(pianeta, "lblSubTitle", planetPopulationList[indexList].name .. " colonized by " .. CPULODList[giocatore[2]+1]); 
					UI_SetTextLabelText(pianeta, "lblSubTitle1", "Population: " .. planetPopulationList[indexList].population .. " (" .. planetPopulationList[indexList].population .. " RUs/year)");		
					UI_SetTextLabelText(pianeta, "lblSubTitle2", "Energy: " .. planetPopulationList[indexList].en);		
					UI_SetTextLabelText(pianeta, "lblSubTitle3", "Orbital Bombardment: " .. planetPopulationList[indexList].dmg);		
					UI_SetTextLabelText(pianeta, "lblSubTitle4", "" .. planetPopulationList[indexList].car3);		
					UI_SetTextLabelText(pianeta, "lblSubTitle5", "" .. planetPopulationList[indexList].car4);										
					Subtitle_Add(Actor_FleetIntel,"Planet colonized",7)
					Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
				end	
			else
				planetPopulationList[indexList].occupationtimer = planetPopulationList[indexList].occupationtimer - 1						
			end	
			--ui
			local planetnoowner = Ping_AddSobGroup("Population: " .. planetPopulationList[indexList].population .. " (" .. planetPopulationList[indexList].population .. " RUs/year)", "planetnoowner", pianeta) 	   
			Ping_LabelVisible(planetnoowner, 1)	
			Ping_AddDescription(planetnoowner, 0, "Status: Colonization in progress, remaining " .. planetPopulationList[indexList].occupationtimer)    
			Ping_AddDescription(planetnoowner, 1, "Energy: " .. planetPopulationList[indexList].car1)
			Ping_AddDescription(planetnoowner, 2, "Orbital Bombardment: " .. planetPopulationList[indexList].car2)
			Ping_AddDescription(planetnoowner, 3, "" .. planetPopulationList[indexList].car3)	    
			Ping_AddDescription(planetnoowner, 4, "" .. planetPopulationList[indexList].car4)    
      if giocatore[2] == Universe_CurrentPlayer() then			
				Subtitle_Add(Actor_FleetIntel,"Colonization in progress",1.72)  
			end	
		else      
		  planetPopulationList[indexList].occupationtimer = floor(10+(planetPopulationList[indexList].population/1000))
			--aggiorna pianeta se un giocatore e amico	
      local pop = 10			
			if SobGroup_GetHardPointHealth(pianeta, "planet_tech1") > 0 then	
        pop=pop+1			
			end
			if SobGroup_GetHardPointHealth(pianeta, "planet_tech2") > 0 then		
        pop=pop+2			
			end
			if SobGroup_GetHardPointHealth(pianeta, "planet_tech3") > 0 then	
        pop=pop+3			
			end
			if SobGroup_GetHardPointHealth(pianeta, "planet_tech4") > 0 then
        pop=pop+4			
			end
			if SobGroup_GetHardPointHealth(pianeta, "planet_tech5") > 0 then		
        pop=pop+5			
			end
			if SobGroup_GetHardPointHealth(pianeta, "planet_tech6") > 0 then
			  pop=pop+6
			end
			planetPopulationList[indexList].car1 = ""..LastpowerList[OwnerIndexList] .. "/" .. LastpowerListStored[OwnerIndexList] .. "/" .. LastpowerListMax[OwnerIndexList]
			AddEnergyToPlayer(SobGroup_OwnedBy(pianeta), energy_generated)
			planetPopulationList[indexList].population = planetPopulationList[indexList].population + pop - death_toll
			planetPopulationList[indexList].grow = pop
			if planetPopulationList[indexList].population < 0 then
				planetPopulationList[indexList].population = 0
			end
			planetList[SobGroup_OwnedBy(pianeta)+1] = planetList[SobGroup_OwnedBy(pianeta)+1] + planetPopulationList[indexList].population 
      --ui
			local planetnoowner = Ping_AddSobGroup("Population: " .. planetPopulationList[indexList].population .. " (" .. planetPopulationList[indexList].population .. " RUs/year)", "planetnoowner", pianeta) 	   
			Ping_LabelVisible(planetnoowner, 1)				
			if colonizers == 0 then
				colonizers = 1
			end  	  
      Ping_AddDescription(planetnoowner, 0, "Status: Colonized and Safe" .. " (" .. "Colonizers: " .. (colonizers-1) .. ", Allies: " .. guest .. ", Invaders: " .. invaders .. ")")    
			Ping_AddDescription(planetnoowner, 1, "Energy: " .. planetPopulationList[indexList].car1)
			Ping_AddDescription(planetnoowner, 2, "Orbital Bombardment: " .. planetPopulationList[indexList].car2)
			Ping_AddDescription(planetnoowner, 3, "" .. planetPopulationList[indexList].car3)	    
			Ping_AddDescription(planetnoowner, 4, "" .. planetPopulationList[indexList].car4)	 	
      --planet bar
      UI_SetTextLabelText("planet_list", pianeta .. tostring("label1"), "Safe"); 
			UI_SetTextLabelText("planet_list_beam", pianeta .. tostring("label1"), "Safe");
			UI_SetTextLabelText("planet_list_jf", pianeta .. tostring("label1"), "Safe");
			UI_SetTextLabelText("planet_list_fs", pianeta .. tostring("label1"), "Safe");
			UI_SetTextLabelText("planet_list_sf", pianeta .. tostring("label1"), "Safe");					
    end				      
		
  --Colonized and Not Safe---------------------------		
  elseif ((giocatore[1] > 1 or colonizers > 0) and (SobGroup_OwnedBy(pianeta) >= 0)) then      
    planetPopulationList[indexList].occupationtimer = floor(10+(planetPopulationList[indexList].population/1000))
    
    planetPopulationList[indexList].car1 = ""..LastpowerList[OwnerIndexList] .. "/" .. LastpowerListStored[OwnerIndexList] .. "/" .. LastpowerListMax[OwnerIndexList]
    AddEnergyToPlayer(SobGroup_OwnedBy(pianeta), energy_generated)
    planetPopulationList[indexList].population = planetPopulationList[indexList].population - death_toll
		if planetPopulationList[indexList].population < 0 then
			planetPopulationList[indexList].population = 0
		end
		planetList[SobGroup_OwnedBy(pianeta)+1] = planetList[SobGroup_OwnedBy(pianeta)+1] + planetPopulationList[indexList].population
		--ui
    local planetnoowner = Ping_AddSobGroup("Population: " .. planetPopulationList[indexList].population .. " (0 RUs/year)", "planetnoowner", pianeta) 	   
    Ping_LabelVisible(planetnoowner, 1)		
    if colonizers == 0 then
      colonizers = 1
    end  	
    Ping_AddDescription(planetnoowner, 0, "Status: Colonized and Not Safe" .. " (" .. "Colonizers: " .. (colonizers-1) .. ", Allies: " .. guest .. ", Invaders: " .. invaders .. ")")  	 
    Ping_AddDescription(planetnoowner, 1, "Energy: " .. planetPopulationList[indexList].car1)
    Ping_AddDescription(planetnoowner, 2, "Orbital Bombardment: " .. planetPopulationList[indexList].car2)
    Ping_AddDescription(planetnoowner, 3, "" .. planetPopulationList[indexList].car3)
    Ping_AddDescription(planetnoowner, 4, "" .. planetPopulationList[indexList].car4)	 
		--planet bar
		UI_SetTextLabelText("planet_list", pianeta .. tostring("label1"), "Col."); 
		UI_SetTextLabelText("planet_list_beam", pianeta .. tostring("label1"), "Col.");
		UI_SetTextLabelText("planet_list_jf", pianeta .. tostring("label1"), "Col.");
		UI_SetTextLabelText("planet_list_fs", pianeta .. tostring("label1"), "Col.");
		UI_SetTextLabelText("planet_list_sf", pianeta .. tostring("label1"), "Col.");		

  --Not Colonized------------------------------------  		
  else
	  planetPopulationList[indexList].occupationtimer = floor(10+(planetPopulationList[indexList].population/1000))
		--ui
    local planetnoowner = Ping_AddSobGroup("Population: " .. planetPopulationList[indexList].population .. " (" .. planetPopulationList[indexList].population .. " RUs/year)", "planetnoowner", pianeta) 	   
    Ping_LabelVisible(planetnoowner, 1)		
    Ping_AddDescription(planetnoowner, 0, "Status: Free")  	 
    Ping_AddDescription(planetnoowner, 1, "Energy: " .. planetPopulationList[indexList].car1)
    Ping_AddDescription(planetnoowner, 2, "Orbital Bombardment: " .. planetPopulationList[indexList].car2)
    Ping_AddDescription(planetnoowner, 3, "" .. planetPopulationList[indexList].car3)	
    Ping_AddDescription(planetnoowner, 4, "" .. planetPopulationList[indexList].car4)	    
    --planet bar
		UI_SetTextLabelText("planet_list", pianeta .. tostring("label1"), ""); 
		UI_SetTextLabelText("planet_list_beam", pianeta .. tostring("label1"), "");
		UI_SetTextLabelText("planet_list_jf", pianeta .. tostring("label1"), "");
		UI_SetTextLabelText("planet_list_fs", pianeta .. tostring("label1"), "");
		UI_SetTextLabelText("planet_list_sf", pianeta .. tostring("label1"), "");				
  end  
	
	UI_SetTextLabelText("planet_list", pianeta .. tostring("label"), AddPlayerColourToText(OwnerIndex, planetPopulationList[indexList].population)); 
	UI_SetTextLabelText("planet_list_beam", pianeta .. tostring("label"), AddPlayerColourToText(OwnerIndex, planetPopulationList[indexList].population));
	UI_SetTextLabelText("planet_list_jf", pianeta .. tostring("label"), AddPlayerColourToText(OwnerIndex, planetPopulationList[indexList].population));
	UI_SetTextLabelText("planet_list_fs", pianeta .. tostring("label"), AddPlayerColourToText(OwnerIndex, planetPopulationList[indexList].population));
	UI_SetTextLabelText("planet_list_sf", pianeta .. tostring("label"), AddPlayerColourToText(OwnerIndex, planetPopulationList[indexList].population));	
end

aircombat_fighterjets = {"meg_mig25","meg_su27","meg_f14","meg_f15","meg_f22","meg_f23","meg_t50","meg_x45","meg_su27_elite"}
aircombat_strikecraft = {"meg_av8","meg_a10","meg_su25","meg_f16","meg_f18","meg_mig29","meg_su34","meg_su35","meg_f117","meg_f35","meg_migmfi","meg_su47","meg_x47","meg_f18_elite"}
aircombat_bombers = {"meg_b52","meg_b1","meg_tu160","meg_b2"}
aircombat_specialplanes = {"meg_sr71","meg_e767","meg_kc10","meg_c5"}

function AirCombat_CountPlayerShipsInTable(playerIndex, shiptype)
	local shipcount = 0
	if playerIndex >= 0 then
		--for z, iCount in shiptable do
			--shipcount = shipcount + SobGroup_Count(iCount..playerIndex)
		--end
		shipcount = SobGroup_Count(shiptype..playerIndex)
	end
	return shipcount
end

function MegalithWreckCheck()	--used to switch megalith wrecks to player -1 so the "DestroyAll" game rule won't be violated
	--print("MegalithWreckCheck - Start")
	Update_AllShips()
	local megalith_wrecks = {"meg_bentus_wreck", "meg_dreadnaughtberth_wreck", "meg_tanis_wreck", "meg_balcoragate_wreck", "meg_gehenna_1ctm_wreck", "meg_gehenna_3ctm_wreck", "meg_progenitorpowermodule_wreck", "meg_foundry_wreck","meg_veildebris_chunk_lighthouse_wreck"}
	local hp_threshold = 0.00001
	local playerIndex = -1
  while playerIndex < Universe_PlayerCount() do
    if playerIndex == -1 or Player_IsAlive(playerIndex) == 1 then
    	for z, iCount in megalith_wrecks do
    		SobGroup_Create("MegalithWreck_SOB")
				Player_FillShipsByType("MegalithWreck_SOB", playerIndex, iCount)	--this miraculously works for player -1!
				--print("Function MegalithWreckCheck is running for "..iCount..", player index: "..playerIndex..", group size: "..SobGroup_Count("MegalithWreck_SOB"))
				if SobGroup_Empty("MegalithWreck_SOB") == 0 then
					local numShips = SobGroup_SplitGroupReference("SingleMegalithWreck_SOB", "MegalithWreck_SOB", "AllShips", SobGroup_Count("MegalithWreck_SOB"))
					for counter = 0, numShips -1, 1 do
						local wreck = "SingleMegalithWreck_SOB"..counter
						if playerIndex >= 0 and SobGroup_HealthPercentage(wreck) > 0 or playerIndex == -1 and SobGroup_HealthPercentage(wreck) > hp_threshold then	--to avoid repeated spawning for player -1
							print("Neutralizing megalith wreck "..iCount.." owned by player index: "..playerIndex..", game year: "..year)
							SobGroup_Create("CurrentHulk")
							SobGroup_Clear("CurrentHulk")
							Volume_AddSphere("VOL_HulkSpawnTarget"..counter, SobGroup_GetPosition(wreck), 60000)
							SobGroup_SpawnNewShipInSobGroup(-1, iCount, "CurrentHulk", "CurrentHulk", "VOL_HulkSpawnTarget"..counter)
							SobGroup_SetInvulnerability("CurrentHulk", 1)
							SobGroup_SetHealth("CurrentHulk", hp_threshold)	--to reduce collision damage caused to other nearby ships
      				SobGroup_ParadeSobGroup("CurrentHulk", wreck, 2)
							Volume_Delete("VOL_HulkSpawnTarget"..counter)
							SobGroup_SetHealth(wreck, 0)
						end
					end
				end
    	end
    end
    playerIndex = playerIndex + 1
  end
  Rule_RandomInterval("MegalithWreckCheck", 1.8367, 0)
	--print("MegalithWreckCheck - End")
end

function SpawnShipwreckCheck()		--called from sobgroupfunctionsADV.lua
	Update_AllShips()
	if SobGroup_Empty("all_ships_with_wreck") == 0 then
		local numShips = SobGroup_SplitGroupReference("SingleShipToWreck_SOB", "all_ships_with_wreck", "AllShips", SobGroup_Count("all_ships_with_wreck"))
		for counter = 0, numShips -1, 1 do
			if SobGroup_GetHardPointHealth("SingleShipToWreck_SOB" .. counter, "wrecktime") ~= nil then		--exclude single player ships put in identical sobgroups
				if SobGroup_HealthPercentage("SingleShipToWreck_SOB" .. counter) <= 0 then		--always use <= 0 instead of == 0, because otherwise the hulk would fail to spawn in combat! does this suggest health can actually get below 0 for dead ships?
					if SobGroup_IsDocked("SingleShipToWreck_SOB" .. counter) == 0 then
						local timer = SobGroup_GetHardPointHealth("SingleShipToWreck_SOB" .. counter, "wrecktime")
						if timer > 0 then		--don't do anything to ships that have already spawned a hulk
							local shipname = ""
							local spawntime = 0
							local shipmatched = 0
							for z, iCount in wreck_list.shipname do
								if SobGroup_AreAnyOfTheseTypes("SingleShipToWreck_SOB" .. counter, iCount) == 1 then
									shipname = iCount
									spawntime = wreck_list.spawntime[z]
									shipmatched = 1
									break
								end
							end
							if shipmatched == 1 then
								local damage = 0.999
								local hulk_spawned = 0
								if spawntime > 0 then
									damage = 1/spawntime		--1.0 is the refresh interval of the RaceCheck function
								end
								--spawn hulk
								if timer <= 2*damage or timer < 0.0011 then
									if SobGroup_AreAllInRealSpace("SingleShipToWreck_SOB"..counter) == 1 and SobGroup_InWorldBound("SingleShipToWreck_SOB"..counter, 1) == 1 then
										local playerIndex = SobGroup_OwnedBy("SingleShipToWreck_SOB" .. counter)
			      				local myself = Universe_CurrentPlayer()
										SobGroup_Create("CurrentHulk")
										SobGroup_Clear("CurrentHulk")
										local volID = Universe_GameTime()
										Volume_AddSphere("VOL_HulkSpawnTarget"..counter..volID, SobGroup_GetPosition("SingleShipToWreck_SOB"..counter), 6000)
										SobGroup_SpawnNewShipInSobGroup(-1, shipname..wreck_suffix, "CurrentHulk", "CurrentHulk", "VOL_HulkSpawnTarget"..counter..volID)
										SobGroup_SobGroupAdd("all_shipwreck", "CurrentHulk")
										SobGroup_AbilityActivate("CurrentHulk", AB_Attack, 0)
			      				SobGroup_AbilityActivate("CurrentHulk", AB_Lights, 0)
			      				SobGroup_TakeDamage("CurrentHulk", random_pseudo(5001,9999)/10000-0.5*unithealth)	--hulk with random health would be cool! no?
			      				--SobGroup_SetInvulnerability("CurrentHulk", 1)
			      				SobGroup_ParadeSobGroup("CurrentHulk", "SingleShipToWreck_SOB"..counter, 2)
			      				if GetGameRubric() ~= GR_MULTIPLAYER and Player_IsAlive(myself) == 1 then	--don't use this in multiplayer because it's likely to cause out of sync
				      				if playerIndex == myself or AreAllied(playerIndex, myself) == 1 then
				      					FOW_RevealGroup("CurrentHulk", 1)
				      				end
				      			end
				      			FX_StartEvent("CurrentHulk", "ammo_explosion")	--random ammo explosions
			      				--SobGroup_SetInvulnerability("CurrentHulk", 0)
			      				--SobGroup_FillBattleScar("CurrentHulk", "plasma_bomb/plasma_bomb")		--can cause scar glitches in the later game
										hulk_spawned = 1
										Volume_Delete("VOL_HulkSpawnTarget"..counter..volID)
										SobGroup_SetHardPointHealth_Smart("SingleShipToWreck_SOB" .. counter, "wrecktime", 0) --set timer to 0 to prevent duplicated wreck spawn
										--print("Hulk spawned for "..shipname.." from group ".."SingleShipToWreck_SOB" .. counter..", game time: "..volID)
										
										--Hiigaran MOAB radiation
										if shipname == "hgn_juggernaught" then
											local DetonationPower = 1
											if Player_HasResearch(playerIndex, "DetonationPower2" ) == 1 then
												DetonationPower = DetonationPower * 2.1
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power0", 1)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power1", 1)
											elseif Player_HasResearch(playerIndex, "DetonationPower1" ) == 1 then
												DetonationPower = DetonationPower * 1.5
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power0", 0)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power1", 1)
											elseif Player_HasResearch(playerIndex, "DetonationPower" ) == 1 then
												DetonationPower = DetonationPower * 1.25
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power0", 1)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power1", 0)
											else
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power0", 0)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "power1", 0)
											end
											SobGroup_SetHardPointHealth_Smart("CurrentHulk", "radiation_power", DetonationPower/10)
											if Player_HasResearch(playerIndex, "DetonationRange2" ) == 1 then
												SobGroup_ChangePower("CurrentHulk", "Weapon_r0", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r1", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r2", 0)
												FX_StartEvent("CurrentHulk", "Radiation3")
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range0", 1)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range1", 1)
											elseif Player_HasResearch(playerIndex, "DetonationRange1" ) == 1 then
												SobGroup_ChangePower("CurrentHulk", "Weapon_r0", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r1", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r3", 0)
												FX_StartEvent("CurrentHulk", "Radiation2")
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range0", 0)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range1", 1)
											elseif Player_HasResearch(playerIndex, "DetonationRange" ) == 1 then
												SobGroup_ChangePower("CurrentHulk", "Weapon_r0", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r2", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r3", 0)
												FX_StartEvent("CurrentHulk", "Radiation1")
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range0", 1)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range1", 0)
											else
												SobGroup_ChangePower("CurrentHulk", "Weapon_r1", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r2", 0)
												SobGroup_ChangePower("CurrentHulk", "Weapon_r3", 0)
												FX_StartEvent("CurrentHulk", "Radiation")
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range0", 0)
												SobGroup_SetHardPointHealth_Smart("CurrentHulk", "range1", 0)
											end
											SobGroup_SobGroupAdd("all_radiationwreck", "CurrentHulk")
											if Rule_Exists("JuggernaughtRadiationUpdate") == 0 then
												Rule_AddInterval("JuggernaughtRadiationUpdate", 2.2333)		--in explosiondamage.lua
											end
										end
										
									end
								end
								--hulk spawn timer
								if hulk_spawned == 0 then
									local rekt = timer-damage
									if rekt <= 0 then
										rekt = 0.001		--mechanism to prevent duplicated wreck spawn
									end
									SobGroup_SetInvulnerabilityOfHardPoint("SingleShipToWreck_SOB" .. counter, "wrecktime", 1)
									SobGroup_SetHardPointHealth_Smart("SingleShipToWreck_SOB" .. counter, "wrecktime", rekt)
									--print("Beginning to wreck "..shipname.." from group ".."SingleShipToWreck_SOB" .. counter..", timer set to: "..rekt)
								end
							end
						end
					end
				else		--when the ship is not dead, always set the wreck timer to full
					if SobGroup_GetHardPointHealth("SingleShipToWreck_SOB" .. counter, "wrecktime") ~= 1 then
						SobGroup_SetInvulnerabilityOfHardPoint("SingleShipToWreck_SOB" .. counter, "wrecktime", 1)
						SobGroup_SetHardPointHealth_Smart("SingleShipToWreck_SOB" .. counter, "wrecktime", 1)
						--print("Resetting wreck timer to 1 for: ".."SingleShipToWreck_SOB" .. counter)
					end
				end
			end
		end
	end
end

function RemoveShipwreckCheck()		--called from sobgroupfunctionsADV.lua
	Update_AllShips()
	if SobGroup_Empty("all_shipwreck") == 0 then
		--SobGroup_AvoidanceIgnore("resourcecollectors", "all_shipwreck")	--make all collectors ignore wreck collosion so they can salvage the debris inside (doesn't work)
		--allow interface display for the shipwreck, which will be added to the "debris" group
		SobGroup_SobGroupAdd("debrisnoowner", "all_shipwreck")
		local SobNum = SobGroup_SplitGroupReference("debris", "debrisnoowner", "AllShips", SobGroup_Count("debrisnoowner"))
  	MaxCount[2] = (SobNum - 1)
		local numShips = SobGroup_SplitGroupReference("SingleWreckToProcess_SOB", "all_shipwreck", "AllShips", SobGroup_Count("all_shipwreck"))
		local TooManyWrecks = 0
		if numShips > 50-2*(sqrt(30+SobGroup_Count("AllShips"))-5) then		--need to find the hardware sweet spot
			TooManyWrecks = 1
		end
		for counter = 0, numShips -1, 1 do
			local wreck="SingleWreckToProcess_SOB"..counter
			local playerIndex = SobGroup_OwnedBy(wreck)
			--restore the wreck back to the original ship if captured and repaired by any player (need capture and repair points for the wreck, or cheat!)
			if playerIndex >= 0 then
				if SobGroup_InWorldBoundForKillingOnly(wreck, 1) == 0 then --kill the player-owned wreck if out of map bound
					if SobGroup_HealthPercentage(wreck) > 0 then
						SobGroup_SetHealth(wreck, 0)
					end
				elseif SobGroup_HealthPercentage(wreck) > 0.99 then
					local shipname = ""
					local shipmatched = 0
					for z, iCount in wreck_list.shipname do
						if SobGroup_AreAnyOfTheseTypes(wreck, iCount..wreck_suffix) == 1 then
							shipname = iCount
							shipmatched = 1
							break
						end
					end
					if shipmatched == 1 then
						local can_build = 1
						if Table_ContainElement(BuildLimit_list.shipname, shipname) == 1 then	--the ship has a build limit constraint
							local idx = Table_Which(BuildLimit_list.shipname, shipname)
							if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, shipname) >= BuildLimit_list.limit[idx] or ShipList_GetRaceTag(playerIndex) ~= BuildLimit_list.race[idx] then
								can_build = 0 --don't spawn two motherships or some crap like that to avoid breaking the game
							end
						end
						SobGroup_SetHealth(wreck, 0)
						if can_build == 1 then
							SobGroup_Create("CurrentReborn")
							SobGroup_Clear("CurrentReborn")
							local volID = Universe_GameTime()
							Volume_AddSphere("VOL_RebornSpawnTarget"..counter..volID, SobGroup_GetPosition(wreck), 6000)
							AI_SobGroup_SpawnNewShipInSobGroup(playerIndex, shipname, "CurrentReborn", "CurrentReborn", "VOL_RebornSpawnTarget"..counter..volID)
							print("Recovering "..shipname.." from hulk owned by player index: "..playerIndex..", game year: "..year)
	    				SobGroup_TakeDamage("CurrentReborn", random_pseudo(5001,9999)/10000-0.5*unithealth)	--Reborn with random health would be cool! no?
	    				SobGroup_ParadeSobGroup("CurrentReborn", wreck, 2)
							Volume_Delete("VOL_RebornSpawnTarget"..counter..volID)
							if Camera_IsFocused(wreck) == 1 then
								Camera_AltFocus("CurrentReborn", 0)
							end
							if SobGroup_Selected(wreck) == 1 then
								SobGroup_SelectSobGroup("CurrentReborn")
							end
							if playerIndex == Universe_CurrentPlayer() and Camera_GetDistanceToSobGroup("CurrentReborn") < 24000 then
			     			Subtitle_AddAccordingToRace(playerIndex,"We have successfully restored a vessel from hulk! ",3.72)
			     			UI_PlaySound("SFX_notification_repair_fleet_01")
			     		end
			     	else	--cannot recover, just destroy
			     		if playerIndex == Universe_CurrentPlayer() and Camera_GetDistanceToSobGroup("CurrentReborn") < 24000 then
			     			Subtitle_AddAccordingToRace(playerIndex,"We are unable to recover this vessel from hulk. ",3.72)
			     			UI_PlaySound("SFX_distance_stellarite_attack_plasma_03")
			     		end
						end
					end
				end
			else	--not captured, neutral wreck
			end
			--Ping
			local wrecknoowner = Ping_AddSobGroup("Destroyed Vessel", "megalitenoowner11", wreck)
      Ping_LabelVisible(wrecknoowner, 1)
      Ping_AddDescription(wrecknoowner, 0, "Can Be Restored")
      Ping_AddDescription(wrecknoowner, 1, "Capture and Repair to Restore")
			--start cleaning up the wrecks by damaging them
			if TooManyWrecks == 1 and SobGroup_SobGroupCompare(wreck, "haxor_all_invincibleships") == 0 then
				SobGroup_TakeDamage(wreck, 0.05-0.04*unithealth)
			end
		end
	end
end