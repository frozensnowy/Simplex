
function AddEnergyToPlayer(playerIndex, en)		--can reduce energy by inputing a negative number 
	local playerIndexList = playerIndex + 1
	powerList[playerIndexList] = powerList[playerIndexList] + en
	if en > 0 then
		powerListManager[playerIndex+1].production = powerListManager[playerIndex+1].production + en
	elseif en < 0 then
		powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc + en
	end
end


-- Table to store the energy drain amounts for each player
energyDrain = {}

-- Function to set the energy drain for a player
function SetEnergyDrain(playerIndex, amount)
    energyDrain[playerIndex + 1] = amount  -- Adjusting for 1-based indexing
end

-- Function to apply the energy drain periodically
function ApplyEnergyDrain()
    local playerIndex
    for playerIndex = 1, getn(energyDrain) do  -- Using getn to get the number of elements in the table
        local amount = energyDrain[playerIndex]
        if amount and amount ~= 0 then
            AddEnergyToPlayer(playerIndex - 1, -amount)  -- Adjusting for 0-based indexing
        end
    end
end

-- Function to get the current energy of a player
function GetCurrentEnergy(playerIndex)
    local playerIndexList = playerIndex + 1
    return powerList[playerIndexList]
end

-- Function to set the current energy of a player
function SetCurrentEnergy(playerIndex, energy)
    local playerIndexList = playerIndex + 1
    powerList[playerIndexList] = energy
    
    -- Adjust other related energy values if necessary
    powerListManager[playerIndex+1].production = energy
    powerListManager[playerIndex+1].misc = 0  -- Reset misc energy, adjust as necessary
end

-- Function to get the maximum energy of a player
function GetMaxEnergy(playerIndex)
    local playerIndexList = playerIndex + 1
    return powerListMax[playerIndexList]
end

-- Function to set the maximum energy of a player
function SetMaxEnergy(playerIndex, maxEnergy)
    local playerIndexList = playerIndex + 1
    powerListMax[playerIndexList] = maxEnergy
end

-- Function to lock the maximum energy to a percentage of the full value
function LockMaxEnergyPercentage(playerIndex, percentage)
    local playerIndexList = playerIndex + 1
    local fullMaxEnergy = powerListMax[playerIndexList] -- Assuming fullMaxEnergy is the maximum energy possible
    local newMaxEnergy = fullMaxEnergy * (percentage / 100)
    powerListMax[playerIndexList] = newMaxEnergy
end


-- Schedule ApplyEnergyDrain to run periodically
function StartEnergyDrain()
    Rule_AddInterval("ApplyEnergyDrain", 5)  -- Adjust the interval (5 seconds here) as needed
end


function energyConsume(ship,consume,cc)   
 	
  --if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 1 then    
    --return 0 
  --end
  
  --if Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Hiigaran then
  --else
    --return 0
  --end  
  
  local iRace = Player_GetRace(SobGroup_OwnedBy(ship)) + 1 
  local stopship = 0
  local stopsub = 0
  local consumodellasingolanave = powerList[SobGroup_OwnedBy(ship) + 1]
  dofilepath([[data:scripts/race.lua]])
  dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/build.lua]])  
  
  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_power, rad_powerstation, kpr_ressourcecollector_old") == 0 then
    if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 0 then
	    --build
		  if SobGroup_CanDoAbility(ship, abilityList[8]) == 1 then
		  --if SobGroup_IsDoingAbility(ship, abilityList[8]) == 1 then --non funziona, ma ci vorrebbe
		    
				if SobGroup_AreAnyOfTheseTypes(ship, "hgn_container, vgr_container") == 0 then
					for z, iCount in build do
						if SobGroup_IsBuilding(ship, iCount.ThingToBuild) == 1 then
						
							if iCount.Type == Ship and stopship==0 then
								powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
								powerListManager[SobGroup_OwnedBy(ship) + 1].build = powerListManager[SobGroup_OwnedBy(ship) + 1].build - (4*consume)
								if SobGroup_Count("hgn_power"..SobGroup_OwnedBy(ship)) > 0 then
									FX_StartEvent_Smart("hgn_power"..SobGroup_OwnedBy(ship), "Energy")	 
								end  
								stopship = stopship+1       
							elseif iCount.Type == SubSystem and stopsub==0 then
								powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
								powerListManager[SobGroup_OwnedBy(ship) + 1].build = powerListManager[SobGroup_OwnedBy(ship) + 1].build - (4*consume)
								if SobGroup_Count("hgn_power"..SobGroup_OwnedBy(ship)) > 0 then
									FX_StartEvent_Smart("hgn_power"..SobGroup_OwnedBy(ship), "Energy")	 
								end       
								stopsub = stopsub+1   
							else  
							end
							
							if (stopship+stopsub) >= cc then	        
								break	        
							end  
							
						end
					end	  
        end					
			  
			end  	
		end	
	
	---abilities energy consume	
	--sensor	
		if SobGroup_IsDoingAbility(ship, abilityList[20]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (1*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].sensor = powerListManager[SobGroup_OwnedBy(ship) + 1].sensor - (1*consume)
		end
	--repair	
		if SobGroup_IsDoingAbility(ship, abilityList[13]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (2*consume)
		end	
	--move	
		if SobGroup_IsDoingAbility(ship, abilityList[1]) == 1 and SobGroup_GetActualSpeed(ship) > 0.35 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - (2*consume)
		elseif SobGroup_GetActualSpeed(ship) > 0.35 and SobGroup_IsDocked(ship) == 0 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)  
		  powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - (2*consume)
		end
	--attack	
		if SobGroup_IsDoingAbility(ship, abilityList[2]) == 1 then		
		  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_sentinel, hgn_ionsentinel") == 1 then
		    powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (6*consume)
		    powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (6*consume)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_artillerysentinel") == 1 then  
		    if SobGroup_GetHardPointHealth(ship, "k1") > 0 then
		      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		      powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (2*consume)
		    end
		    if SobGroup_GetHardPointHealth(ship, "k2") > 0 then
		      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		      powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (2*consume)
		    end
		    if SobGroup_GetHardPointHealth(ship, "k3") > 0 then
		      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		      powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (2*consume)
		    end
		    if SobGroup_GetHardPointHealth(ship, "k4") > 0 then
		      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		      powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (2*consume)
		    end			    
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_combatbase") == 1 then  
		    powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (6*consume)
		    powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (6*consume)
		    if SobGroup_GetHardPointHealth(ship, "up") > 0 then
		      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		      powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (2*consume)
		    end
		    if SobGroup_GetHardPointHealth(ship, "down") > 0 then
		      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		      powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (2*consume)
		    end		    	    
		  else
		    powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*consume) 
		    powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (3*consume)
		  end		  
		end	
	--special attack
	  if SobGroup_IsDoingAbility(ship, abilityList[15]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].attack = powerListManager[SobGroup_OwnedBy(ship) + 1].attack - (4*consume)
		end	
	--hyperspace	
		if SobGroup_IsDoingAbility(ship, abilityList[5]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace = powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace - (4*consume)
		end
	--form hyper gate
	  if SobGroup_IsDoingAbility(ship, abilityList[23]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace = powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace - (4*consume)
		end
	--hyper via gate
	  if SobGroup_IsDoingAbility(ship, abilityList[24]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace = powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace - (4*consume)
		end		
	--ping	
		if SobGroup_IsDoingAbility(ship, abilityList[16]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (7*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].sensor = powerListManager[SobGroup_OwnedBy(ship) + 1].sensor - (7*consume)
		end
	--use hyper inhibitor	
		if SobGroup_IsDoingAbility(ship, abilityList[27]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (8*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace = powerListManager[SobGroup_OwnedBy(ship) + 1].hyperspace - (8*consume)
		end	
	--def field	
		if SobGroup_IsDoingAbility(ship, abilityList[25]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (10*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - (10*consume)
		end	
	--cloak	
		if SobGroup_IsDoingAbility(ship, abilityList[28]) == 1 then
		  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (10*consume)
		  powerListManager[SobGroup_OwnedBy(ship) + 1].cloak = powerListManager[SobGroup_OwnedBy(ship) + 1].cloak - (10*consume)
		end
		
	--targeting	
		--if SobGroup_IsDoingAbility(ship, abilityList[14]) == 1 then
		  --powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (1*consume)
		--end	
	--accept dock	
		--if SobGroup_IsDoingAbility(ship, abilityList[11]) == 1 then
		  --powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
		--end	
	--lights
	  --if SobGroup_IsDoingAbility(ship, abilityList[21]) == 1 then
		  --powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (1*consume)
		--end		
	--steering	
		--if SobGroup_IsDoingAbility(ship, abilityList[19]) == 1 then
		  --powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
		--end	
	--radiation def field	
		--if SobGroup_IsDoingAbility(ship, abilityList[26]) == 1 then
		  --powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
		--end		
	
	---Sun Damage
	  if SobGroup_Empty("star_sol") == 0 and Universe_GameTime() > 10 then
	    
	    --pianeti
		  if SobGroup_Empty("planet_mercury") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_mercury") <= 42000 then
			elseif SobGroup_Empty("planet_venus") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_venus") <= 57000 then
			elseif SobGroup_Empty("planet_earth") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_earth") <= 57000 then
			elseif SobGroup_Empty("planet_moon") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_moon") <= 42000 then
			elseif SobGroup_Empty("planet_mars") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_mars") <= 57000 then
			elseif SobGroup_Empty("planet_jupiter") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_jupiter") <= 112000 then
			elseif SobGroup_Empty("planet_europa") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_europa") <= 42000 then
			elseif SobGroup_Empty("planet_io") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_io") <= 42000 then
			elseif SobGroup_Empty("planet_callisto") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_callisto") <= 42000 then
			elseif SobGroup_Empty("planet_ganymeade") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_ganymeade") <= 42000 then
			elseif SobGroup_Empty("planet_saturn") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_saturn") <= 112000 then
			elseif SobGroup_Empty("planet_uranus") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_uranus") <= 72000 then
			elseif SobGroup_Empty("planet_neptune") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_neptune") <= 72000 then
			elseif SobGroup_Empty("planet_pluto") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_pluto") <= 42000 then  			
		  elseif SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "hgn_battlestation"..SobGroup_OwnedBy(ship), ship, 14000) == 1 then		  
	    else
					if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 300000 then 
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (4*consume)    
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (4*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 350000 then	
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (3*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (3*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 400000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (2*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (2*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 450000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (1*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (1*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 500000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (0*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (0*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 550000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (0*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (0*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 600000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + (0*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space + (0*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 650000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (1*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space - (1*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (2*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space - (2*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 750000 then 
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space - (3*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 800000 then 
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (4*consume)
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space - (4*consume)
					elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 850000 then 
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume) 
            powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space - (5*consume)						
					else
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (6*consume)  
						powerListManager[SobGroup_OwnedBy(ship) + 1].space = powerListManager[SobGroup_OwnedBy(ship) + 1].space - (6*consume)
					end
			end  
		end   	  
	  
	---Fusion
	  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_scaver,vgr_scaver") == 1 then  	    
			if SobGroup_IsDocked(ship) == 0 and SobGroup_GetHardPointHealth(ship, "hgn_orders_fusion") == 0 then
			  if SobGroup_GetHardPointHealth(ship, "Fusion") > 0 then
			    if Player_HasResearch(SobGroup_OwnedBy(ship), "Scaverautogenres3") == 1 then					       
			      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (9*consume)   
			      powerListManager[SobGroup_OwnedBy(ship) + 1].fusion = powerListManager[SobGroup_OwnedBy(ship) + 1].fusion - (9*consume)
			    elseif Player_HasResearch(SobGroup_OwnedBy(ship), "Scaverautogenres2") == 1 then
			      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (7*consume)
			      powerListManager[SobGroup_OwnedBy(ship) + 1].fusion = powerListManager[SobGroup_OwnedBy(ship) + 1].fusion - (7*consume)
			    elseif Player_HasResearch(SobGroup_OwnedBy(ship), "Scaverautogenres1") == 1 then
			      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume) 
			      powerListManager[SobGroup_OwnedBy(ship) + 1].fusion = powerListManager[SobGroup_OwnedBy(ship) + 1].fusion - (5*consume)
			    elseif SobGroup_GetHardPointHealth(ship, "Fusion") > 0 then
		        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*consume) 
		        powerListManager[SobGroup_OwnedBy(ship) + 1].fusion = powerListManager[SobGroup_OwnedBy(ship) + 1].fusion - (3*consume)
		      end		      
		    end  		 	    
	  	end	
		end
		
	---research
	  if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 0 then
		  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_researchstation") == 1 then
		  
		    dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
				for z, iCount in research do
			    if Player_HasQueuedResearch(SobGroup_OwnedBy(ship), iCount.Name) == 1 then
			      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (1*consume) 
			      powerListManager[SobGroup_OwnedBy(ship) + 1].research = powerListManager[SobGroup_OwnedBy(ship) + 1].research - (1*consume)
			      break	   
			    end
			  end	
			  
			  if SobGroup_GetHardPointHealth((ship), "powerup_ru") > 0 then
			    powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
			    powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume)
			  end
        if SobGroup_GetHardPointHealth((ship), "powerup_defense") > 0 then
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
          powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume)
        end
        if SobGroup_GetHardPointHealth((ship), "powerup_speed") > 0 then
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
          powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume)
        end
        if SobGroup_GetHardPointHealth((ship), "powerup_attack") > 0 then
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
          powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume)
        end
        if SobGroup_GetHardPointHealth((ship), "powerup_build") > 0 then
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)
          powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume)
        end
        if SobGroup_GetHardPointHealth((ship), "powerup_repair") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)    
          powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume) 
		    end		
		    
      elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Vaygr or Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Kadeshi or Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Raider or Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Keeper then		
        dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
				for z, iCount in research do
				  if iCount.Name == "isai" then
						break
					end
					if Player_HasQueuedResearch(SobGroup_OwnedBy(ship), iCount.Name) == 1 then
						powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (1*consume) 
						powerListManager[SobGroup_OwnedBy(ship) + 1].research = powerListManager[SobGroup_OwnedBy(ship) + 1].research - (1*consume)
						break	   
					end
				end      				
      end
		end		
		
	---hyperspace station	
	  if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 0 then
		  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_hyperspacestation") == 1 then		  		    
        if SobGroup_GetHardPointHealth((ship), "powerup_sensor") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (5*consume)     
          powerListManager[SobGroup_OwnedBy(ship) + 1].misc = powerListManager[SobGroup_OwnedBy(ship) + 1].misc - (5*consume)
		    end				    			  
			end    
		end		
		
	---Shipyard
	  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_shipyard, hgn_shipyard_elohim") == 1 then		
	    if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3   
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	
		elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_battleshipyard") == 1 then		
	    if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end		
			if SobGroup_GetHardPointHealth((ship), "pg1") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	
			if SobGroup_GetHardPointHealth((ship), "pg2") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	
			if SobGroup_GetHardPointHealth((ship), "pg3") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	
		elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_shipyard_g") == 1 then	
		  if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	
	    if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 0 then
		    ---shields
		    if SobGroup_GetHardPointHealth((ship), "hgn_orders_solarshield") > 0 then		 
		      if Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield3" ) == 1 then
	        	hassolarshield = 4
	        elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield2" ) == 1 then	
	        	hassolarshield = 3
	        elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield1" ) == 1 then	
	        	hassolarshield = 2
	        else
	          hassolarshield = 1	
	        end
	        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*hassolarshield*consume)     
	        powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - (3*hassolarshield*consume)
		    end
		    if SobGroup_GetHardPointHealth((ship), "hgn_orders_remotespaceshield") > 0 then		 
		      if Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield3" ) == 1 then
	        	hasremotespaceshield = 4
	        elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield2" ) == 1 then	
	        	hasremotespaceshield = 3
	        elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield1" ) == 1 then	
	        	hasremotespaceshield = 2
	        else
	          hasremotespaceshield = 1	
	        end
	        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*hasremotespaceshield*consume)     
	        powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - (3*hasremotespaceshield*consume)
		    end		    
		    ---boost  		    
	      if SobGroup_GetHardPointHealth((ship), "boost1") > 0 then		 
	        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*consume)     
	        powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - (3*consume)
		    end	
		    if SobGroup_GetHardPointHealth((ship), "boost2") > 0 then		 
	        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (6*consume)     
	        powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - (6*consume)
		    end
		    if SobGroup_GetHardPointHealth((ship), "boost3") > 0 then		 
	        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (9*consume)     
	        powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - (9*consume)
		    end		
		  end	    			  
		end  
    if SobGroup_AreAnyOfTheseTypes(ship, "vgr_shipyard") == 1 then
    	for i=1,6,1 do
		    if SobGroup_GetHardPointHealth((ship), "pg"..i) > 0 then
	        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3
	        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
		    end
		  end
    end					
		
	---Mothership
	  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_mothership") == 1 then		
	    if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3   
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3  
	    end	   
	    if SobGroup_GetHardPointHealth((ship), "pg1") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	         			  
		end    
		if SobGroup_AreAnyOfTheseTypes(ship, "vgr_mothership") == 1 then		
	    if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
        powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
	    end	  		            			  
			if SobGroup_GetHardPointHealth((ship), "shield_l") > 0 then
	      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*consume)
	      powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - (3*consume)
		  end
			if SobGroup_GetHardPointHealth((ship), "shield_r") > 0 then
	      powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - (3*consume)
	      powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - (3*consume)
		  end
		end    
	  if SobGroup_AreAnyOfTheseTypes(ship, "kad_needleship") == 1 then		
	    if SobGroup_GetHardPointHealth((ship), "AT1") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - 13 + floor(10*SobGroup_GetHardPointHealth((ship), "AT1"))
        powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - 13 + floor(10*SobGroup_GetHardPointHealth((ship), "AT1"))
	    elseif SobGroup_GetHardPointHealth((ship), "AT") > 0 then		 
        powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - 13 + floor(10*SobGroup_GetHardPointHealth((ship), "AT"))
        powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield = powerListManager[SobGroup_OwnedBy(ship) + 1].defensefield - 13 + floor(10*SobGroup_GetHardPointHealth((ship), "AT"))
	    end
	  end
		
	---Kaeshi Potential Energy Perk
		if SobGroup_AreAnyOfTheseTypes(ship, "kad_destroyer, kad_destroyer_real, kad_needleship, kad_custodian") == 1 then
			if SobGroup_GetHardPointHealth(ship, "kad_perks_potential") > 0 then
				local multiplier = 45	--15
				powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + floor(multiplier*(1-SobGroup_GetHardPointHealth(ship, "kad_perks_potential")))
				powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + floor(multiplier*(1-SobGroup_GetHardPointHealth(ship, "kad_perks_potential")))
			end
		end
		
	---Battle Carrier
		--if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 0 then
		  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_battlecarrier") == 1 then		
		    if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
          powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
		    end	            			  
			end   
      if SobGroup_AreAnyOfTheseTypes(ship, "vgr_carrier") == 1 then		
		    if SobGroup_GetHardPointHealth((ship), "pg") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
          powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
		    end	            			  
			end   			
      if SobGroup_AreAnyOfTheseTypes(ship, "vgr_battlecarrier") == 1 then		
		    if SobGroup_GetHardPointHealth((ship), "pg1") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
          powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
		    end	            		
		    if SobGroup_GetHardPointHealth((ship), "pg2") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + 3     
          powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + 3
		    end	  
			end
		--end 
  
  ---Trade
		if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 0 then
		  if SobGroup_AreAnyOfTheseTypes(ship, "hgn_container, vgr_container") == 1 then		
		    if SobGroup_GetHardPointHealth((ship), "engine_boost_container") > 0 then		 
          powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - 3     
          powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - 3
		    end	            			  
			end        		
		end 				
		
    cons[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - consumodellasingolanave
    SobGroup_SetHardPointHealth(ship, "en", 0.5+cons[SobGroup_OwnedBy(ship) + 1]/1000)	  
	  return cons[SobGroup_OwnedBy(ship) + 1]				
	  
---Power Station	
	elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_power") == 1 then	
	  energyproduction = 4	      
    if Player_HasResearch(SobGroup_OwnedBy(ship), "energyproduction3" ) == 1 then
      energyproduction = 7            
    elseif Player_HasResearch(SobGroup_OwnedBy(ship), "energyproduction2" ) == 1 then
      energyproduction = 6            
    elseif Player_HasResearch(SobGroup_OwnedBy(ship), "energyproduction1" ) == 1 then
      energyproduction = 5      
    end	  	
    if SobGroup_GetHardPointHealth((ship), "powerup_power") > 0 then
			energyproduction = energyproduction*2
		end		
	  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + energyproduction	  
	  powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + energyproduction
		for i = 1,10,1 do	
			if SobGroup_GetHardPointHealth(ship, "p"..i) > 0 then
			  if SobGroup_IsDocked(ship) == 0 then
			  	powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + energyproduction     	
			  	powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + energyproduction
			 	  powerListMax[SobGroup_OwnedBy(ship) + 1] = powerListMax[SobGroup_OwnedBy(ship) + 1] + 100  
			 	  --FX_StartEvent_Smart("hgn_power"..SobGroup_OwnedBy(ship), "Energy")
			 	else
			 	  powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] + floor(energyproduction/1.9)     
			 	  powerListManager[SobGroup_OwnedBy(ship) + 1].production = powerListManager[SobGroup_OwnedBy(ship) + 1].production + floor(energyproduction/1.9)	
			 	  powerListMax[SobGroup_OwnedBy(ship) + 1] = powerListMax[SobGroup_OwnedBy(ship) + 1] + 50 
			 	  --FX_StartEvent_Smart("hgn_power"..SobGroup_OwnedBy(ship), "EnergyLow")
			 	end  
			 	
			end 
		end			
		cons[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - consumodellasingolanave		
		SobGroup_SetHardPointHealth(ship, "en", 0.5+cons[SobGroup_OwnedBy(ship) + 1]/1000)	  
		return cons[SobGroup_OwnedBy(ship) + 1]				 		
---Raider Power Plant	
	elseif SobGroup_AreAnyOfTheseTypes(ship, "rad_powerstation") == 1 then
		local radpower = 4
		for i = 1,10,1 do
			if Player_HasResearch(SobGroup_OwnedBy(ship), "energyproduction"..i ) == 1 then
				radpower = radpower + 4
			end
		end
    if Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Raider then
    	if Rad_GeneralList.General[SobGroup_OwnedBy(ship)+1] == 5 and Rad_GeneralList.Rank[SobGroup_OwnedBy(ship)+1] > 0 then
    		local powerboost = (1/6)*Rad_GeneralList.Rank[SobGroup_OwnedBy(ship)+1]
    		radpower = floor(radpower*(1+powerboost))
    	end
    end
		SobGroup_SetHardPointHealth(ship, "en", 0.5+radpower/1000)
		return radpower
---Keeper Power Generator	
	elseif SobGroup_AreAnyOfTheseTypes(ship, "kpr_ressourcecollector_old") == 1 then
		local kprpower = 1
		for i = 1,10,1 do
			if Player_HasResearch(SobGroup_OwnedBy(ship), "energyproduction"..i ) == 1 then
				kprpower = kprpower + 1
			end
		end
		SobGroup_SetHardPointHealth(ship, "en", 0.5+kprpower/1000)
		return kprpower
	end
	
	
	
end   