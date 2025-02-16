function Debug_Initialize()
	next_ship_idx = 1
	Rule_AddInterval("Debug_3Sek", 3)
	print("<DEBUG>\t Debug function initialized!, time: "..Universe_GameTime())
end

function Debug_3Sek()
	local playerIndex = Universe_CurrentPlayer()
	if Player_IsAlive(playerIndex) == 1 then
		local ship = "vgr_superbattleship"..playerIndex		--"vgr_superbattleship"..playerIndex
		if SobGroup_Empty(ship) == 0 then
			if SobGroup_Selected(ship) == 1 then
				if SobGroup_CanDoAbility(ship, AB_HyperspaceInhibitor) == 1 then
					print(ship.." can do AB_HyperspaceInhibitor")
				else
					print(ship.." cannot do AB_HyperspaceInhibitor")
				end
				if SobGroup_IsDoingAbility(ship, AB_HyperspaceInhibitor) == 1 then
					print(ship.." is doing AB_HyperspaceInhibitor")
				else
					print(ship.." is not doing AB_HyperspaceInhibitor")
				end
			end
		end
	end
end

function random_pseudo(min, max)	--hope this can work for multiplayer without the "out of sync" problem
	if min and max then
		if min==max then
			return min
		end
	end
	if GetGameRubric() == GR_MULTIPLAYER then
		local n = random_seeded(seedobj, min, max)
		last_seed = n
		if Rule_Exists("System_UpdateRandomSeed") == 0 then
			Rule_AddInterval("System_UpdateRandomSeed", 3.55)
		end
		return n
	else
		return random(min, max)
	end
end

function System_UpdateRandomSeed() --the seed will become unpredictable with time (butterfly effect)
	if Universe_GameTime() > 100 then	--stop updating the seed after a while
		return
	end
	local bias_term = 0
  for i=1,6 do
  	bias_term = bias_term+RUList[i]+LastRUList[i]+researchList[i]+scoreList[i]+LastpilotpopList[i]+LastofficerpopList[i]+honorList[i]+
  	fighter[i]+corvette[i]+frigate[i]+platform[i]+capital[i]+armedcapital[i]+utility[i]+weapon[i]
  end
  local playerIndex = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
  		bias_term = bias_term + Stats_GatheredRUs(playerIndex) + Stats_SpentRUs(playerIndex) + Stats_TotalLosses(playerIndex) + Stats_TotalLossesInRUs(playerIndex) + 
  		Stats_TotalShipsBuilt(playerIndex) + Stats_TotalShipsBuiltInRUs(playerIndex) + Stats_TotalKills(playerIndex) + Stats_TotalKillsInRUs(playerIndex) + 
  		Stats_ResearchTotal(playerIndex) + Stats_ResearchCount(playerIndex) + Stats_ResearchRUValue(playerIndex) + Stats_SubsystemsBuilt(playerIndex) + 
  		Stats_SubsystemsBuiltInRUs(playerIndex)
  	end
  	playerIndex = playerIndex + 1
  end
	local new_seed = ceil(last_seed + Universe_GameTime() + bias_term)
	if new_seed == 0 then
		new_seed = ceil(Universe_GameTime()+1)
	end
	print("new seed: "..new_seed)
	seedobj = { new_seed }
end

-- rough adaptation of Park-Miller generator: https://stackoverflow.com/questions/18689186/lua-4-0-random-number-generator
function random_seeded( seedobj, fVal1, fVal2 )
  local B = 2^31
  local seed = seedobj[1]
  local k = mod( floor( seed / 127773 ), B )
  seed = mod( 16807 * ( seed - mod( k * 127773, B ) ), B )
  seed = seed - mod( 2836 * k, B )
  if seed < 0 then seed = mod( seed + B - 1, B ) end
  seedobj[1] = seed
  local temp_rand = seed / ( B - 1 )
  if fVal2 then
    return floor( fVal1 + 0.5 + temp_rand * ( fVal2 - fVal1 ) )
  elseif fVal1 then
    return floor( temp_rand * fVal1 ) + 1
  else
    return temp_rand
  end
end

function sigmoid(x, scale, damp, bias)	--https://ml-cheatsheet.readthedocs.io/en/latest/activation_functions.html#sigmoid
	return scale*2/(1+exp(-x/damp))-scale+bias	--y=0 when x=0
end

function date_parse(entry)	--for easter eggs; https://www.lua.org/pil/22.1.html
	local s = strlower(entry)
	if s == "year" then
		return floor(date("%Y"))	--2019
	elseif s == "month" then
		return floor(date("%m"))	--7
	elseif s == "day" then
		return floor(date("%d"))	--21
	elseif s == "hour" then
		return floor(date("%H"))	--0 to 23
	elseif s == "min" or s == "minute" then
		return floor(date("%M"))
	elseif s == "sec" or s == "second" then
		return floor(date("%S"))
	end
end

function OnStartOrLoad()
	print(""..tostring(date()))	--PRINT TIME
	--debug tool (for crashes like 00000010 etc.)
	--Debug_Initialize()
	
	cleaninterface()
	ClearAccoladesDisplay();	--clean accolade screen after loading
	if GetGameRubric() == GR_CAMPAIGN then		--codes from mission lua files
		if SP_Campaign_Level_ID == 2 then
			OnStartOrLoad_m02()
		elseif SP_Campaign_Level_ID == 8 then
			OnStartOrLoad_m08()
		elseif SP_Campaign_Level_ID == 13 then
			OnStartOrLoad_m13()			
		end
	else		--for skirmish and multiplayer
		if GameRulesName == "Simplex Territories" then		--territories mode only
			--echo("OnStartOrLoad IS RUNNING")
			ATI_LoadTemplates("data:LevelData/Multiplayer/territories/territories_ATI.lua")
			--play connection fx
			local idx = 0
			local connection = 0
			local colour = ""
			local fx_name = "beam_blue"
			for idx,connection in TerritoryConnections do
				if idx ~= "n" then
					if connection[3] == nil then
						--colour = BLUE
						local fxList = {"beam_blue","ion_beam_taii_combo_loop","ion_beam_green_loop"}
						fx_name = "ion_beam_taii_combo_loop"	--Table_RandomElement(fxList)
					else
						colour = connection[3]
						fx_name = "beam_"..colour
					end
					FX_PlayEffectBetweenPoints(fx_name, "JumpPoint" .. connection[1] .. "_" .. connection[2], "JumpPoint" .. connection[2] .. "_" .. connection[1], 6)	--6
				end
			end
			--custom level fx
			--PlayMiscellaneousEffects()
			Territory_ActivateShieldFX()
		end
	end
	local timer = 13
	if Universe_GameTime() > timer then
		timer = 1
	end
	Rule_AddInterval("OnStartOrLoad_StartPermanentFX", timer)
	Rule_AddInterval("EasterEgg", 25.143)
end

function OnStartOrLoad_StartPermanentFX()
	local start_aurora = 0
	if MaxCount[5] >= 0 then
		for i = 0,MaxCount[5],1 do  
			if SobGroup_Empty("planet"..i) == 0 then
			  if SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_saturn, hgn_planet_neptune, hgn_planet_jupiter, hgn_planet_uranus") == 1 then
			  	FX_StopEvent("planet"..i, "disk")
			  	FX_StartEvent("planet"..i, "disk")
			  end
			  if SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_hiigara, hgn_planet_kharak_burned, hgn_planet_kharak, hgn_planet_earth, hgn_planet_earth_aerosol, hgn_planet_mars, hgn_planet_saturn, hgn_planet_neptune, hgn_planet_jupiter, hgn_planet_uranus, hgn_planet_venus") == 1 then
			  	FX_StopEvent("planet"..i, "atmosphere")
			  	FX_StartEvent("planet"..i, "atmosphere")
			  end
			  if SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_hiigara, hgn_planet_kharak, hgn_planet_earth, hgn_planet_earth_aerosol, hgn_planet_jupiter, hgn_planet_saturn, hgn_planet_uranus, hgn_planet_neptune") == 1 then
			  	FX_StopEvent("planet"..i, "aurora")
			  	start_aurora = 1
			  end
			  if SobGroup_AreAnyOfTheseTypes("planet"..i, "star_sol") == 1 then
			  	--FX_StopEvent("planet"..i, "atmosphere")
			  	--FX_StartEvent("planet"..i, "atmosphere")
			  end
			  if SobGroup_AreAnyOfTheseTypes("planet"..i, "star_pulsar") == 1 then
			  	FX_StopEvent("planet"..i, "wind")
			  	FX_StartEvent("planet"..i, "wind")
			  	FX_StopEvent("planet"..i, "disk")
			  	FX_StartEvent("planet"..i, "disk")
			  	FX_StopEvent("planet"..i, "atmosphere")
			  	FX_StartEvent("planet"..i, "atmosphere")
			  end
			end  
		end
	end
	Rule_Remove("OnStartOrLoad_StartPermanentFX")
	if Rule_Exists("Aurora_UpdateFX") == 1 then
		Rule_Remove("Aurora_UpdateFX")
		Rule_Remove("Aurora_UpdateFX")
	end
	if start_aurora == 1 then
		Aurora_UpdateFX()
	end
	if SobGroup_Empty("sob_AllBlackholes") == 0 then
		FX_StopEvent("sob_AllBlackholes", "disk")
		FX_StartEvent("sob_AllBlackholes", "disk")
	end
	if SobGroup_Empty("SOB_MapSpecialFX") == 0 then
		FX_StopEvent("SOB_MapSpecialFX", "disk")
		FX_StartEvent("SOB_MapSpecialFX", "disk")
	end
	if SobGroup_Empty("meg_crate") == 0 then
		Crate_SetMeshFX("meg_crate")
	end
end

function Aurora_UpdateFX()
	--Debug_TraceRuntime("Aurora_UpdateFX is running")
	Temp_GlobalVariable.Aurora_Save = Temp_GlobalVariable.Aurora_Save + 1
	if Temp_GlobalVariable.Aurora_Save > 4 then
		Temp_GlobalVariable.Aurora_Save = 1
	end
	if MaxCount[5] >= 0 then
		for i = 0,MaxCount[5],1 do  
			if SobGroup_Empty("planet"..i) == 0 then
			  if SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_earth, hgn_planet_kharak, hgn_planet_hiigara, hgn_planet_earth_aerosol") == 1 then
			  	if Temp_GlobalVariable.Aurora_Save == 1 then
				  	FX_StopEvent("planet"..i, "aurora")
				  	FX_StartEvent("planet"..i, "aurora")
				  end
			  elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_jupiter") == 1 then
			  	if random_pseudo(1,2) == 1 then
				  	FX_StopEvent("planet"..i, "aurora")
				  	FX_StartEvent("planet"..i, "aurora")
				  end
				elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_saturn") == 1 then
			  	if Temp_GlobalVariable.Aurora_Save == 1 or Temp_GlobalVariable.Aurora_Save == 3 then
				  	FX_StopEvent("planet"..i, "aurora")
				  	FX_StartEvent("planet"..i, "aurora")
				  end
				elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_uranus") == 1 then
			  	if random_pseudo(1,2) == 1 then
				  	FX_StopEvent("planet"..i, "aurora")
				  	FX_StartEvent("planet"..i, "aurora")
				  end
				elseif SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_planet_neptune") == 1 then
			  	if Temp_GlobalVariable.Aurora_Save == 2 or Temp_GlobalVariable.Aurora_Save == 4 then
				  	FX_StopEvent("planet"..i, "aurora")
				  	FX_StartEvent("planet"..i, "aurora")
				  end
			  end
			end  
		end
	end
	Rule_RandomInterval("Aurora_UpdateFX", 5.0, 1.5)
end

function Player_GetPlayerName(playerIndex)
	local playerIndexList = playerIndex + 1
	local player_name = "Player "..playerIndexList
	if Player_HasResearch(playerIndex, "isai" ) == 1 then
		player_name = "CPU "..playerIndexList
	end
	if CPULODList[playerIndexList] ~= " " then
		player_name = CPULODList[playerIndexList]
	end
	return player_name
end

---Prevents Destroied/Doched Ships

function ReloadLaunchMenu()
 if Stats_TotalLosses(Universe_CurrentPlayer()) > LastStats_TotalLosses[Universe_CurrentPlayer()+1] then
   UI_ReloadScreen("NewLaunchMenu")
   LastStats_TotalLosses[Universe_CurrentPlayer()+1] = Stats_TotalLosses(Universe_CurrentPlayer())
 end
end  

---Music-----------------------------------------------------------

function musicslidesecurekey()  
  UI_BindKeyEvent(F9KEY, "musicslide")   
  Rule_Remove("musicslidesecurekey")
end

---Random Fake----------------------------------------------

function randomfake()  
  for i = 1,60,1 do  	
    casualizzatore[i] = casualizzatore[i] + 1
    if casualizzatore[i] == i then
      casualizzatore[i] = 0
    end
  end		  
end    

---Score---------------------------------------------------

function score()
  local playerIndex = 0             
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        playerIndexList = playerIndex + 1
        scoreList[playerIndexList] = floor((fusionList[playerIndexList] / 12) +
                                           --(tradeList[playerIndexList] / 9) +
                                           (megalithList[playerIndexList] / 9) +
                                           (planetList[playerIndexList] / 9) +
                                           (honorList[playerIndexList] * 2) +                                             
                                           (pilotmaxList[playerIndexList] / 10) +
                                           (officermaxList[playerIndexList] * 2) +
                                           (pilotpopdisplayList[playerIndexList] * 25) +
                                           (RUList[playerIndexList] / 145) -
                                           (maintenanceList[playerIndexList] / 13) +
                                           (researchList[playerIndexList] / 8))   
        if scoreList[playerIndexList] < 0 then
          scoreList[playerIndexList] = 0
        end                                      
        if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<45) or year>0) then
          UI_SetTextLabelText("UnitCapInfoPopup", "lblscore", ""..scoreList[playerIndexList]);
          --UI_SetTextLabelText("DiplomacyScreen", "lblscore", ""..scoreList[playerIndexList]);
        end                      
      end
    end
    playerIndex = playerIndex + 1
  end      
end

---Player Count-------------------------------------------

function pcount()  
  numPlayerhuman = 0
  numPlayerai = 0                                                          
  local playerIndex = 0                                              
  while playerIndex < Universe_PlayerCount() do    
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then       
				if Player_HasResearch(playerIndex, "isai" ) == 0 then
				  numPlayerhuman = numPlayerhuman + 1
				else	  
				  numPlayerai = numPlayerai + 1
				end   
				  --numPlayer = numPlayerhuman + numPlayerai	
      end	
    end
    playerIndex = playerIndex + 1	
  end                      
end    

---Weapons----------------------------------------------

function weaponsets()  
--Mothership  
  for i = 0,nms-1,1 do  
    if SobGroup_Empty("splitmotherships"..i) == 0 then
      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 4") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 3") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_torpedolauncher2")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_torpedolauncher3")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_torpedolauncher4")   			                          
	        end  	                            
	      end	    
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 8") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 7") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_rapid2")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_rapid3")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_rapid4")   			                          
	        end  	                            
	      end	   
      elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "vgr_mothership,vgr_mothership_makaan") == 1 then
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_qje_quadflechette_stbdF1")    
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_qje_quadflechette_stbdF2")     
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_qje_quadflechette_stbdF3")   
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_ft2_turret")
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_ft2_turret1") 						
	        end  	                            
	      end
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon Missile 2") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon Missile 1") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS2")    
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS3")     
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS4")   
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS5")
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS6") 						
	        end  	                            
	      end
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") <= 0 then
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl1", 0)
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl2", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl3", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl4", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl5", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl6", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl7", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl8", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl9", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl10", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl11", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl12", 0)		
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl13", 0)			 
		    elseif SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") > 0 and SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") <= 1 then
		      SobGroup_SetHardPointHealth("splitmotherships"..i, "pl", (SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") - 0.04))
		      if SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") < 0.12 then
		        SobGroup_SetHardPointHealth("splitmotherships"..i, "pl", 0)
		      end
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl1", 1)
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl2", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl3", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl4", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl5", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl6", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl7", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl8", 1)		
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl9", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl10", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl11", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl12", 1)		
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl13", 1)		
		    end		     
	    end   	        
    end 	
  end
--Carrier  
  for i = 0,nc-1,1 do  
    if SobGroup_Empty("splitcarriers"..i) == 0 then
    	if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_battlecarrier") == 1 then
      	if SobGroup_GetHardPointHealth("splitcarriers"..i, "pl") <= 0 then
      		for x=1,15,1 do
      			SobGroup_ChangePower("splitcarriers"..i, "Weapon_pl"..x, 0)
      		end
		    elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "pl") > 0 and SobGroup_GetHardPointHealth("splitcarriers"..i, "pl") <= 1 then
		      SobGroup_SetHardPointHealth("splitcarriers"..i, "pl", (SobGroup_GetHardPointHealth("splitcarriers"..i, "pl") - 0.04))
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "pl") < 0.12 then
		        SobGroup_SetHardPointHealth("splitcarriers"..i, "pl", 0)
		      end
		      for x=1,15,1 do
      			SobGroup_ChangePower("splitcarriers"..i, "Weapon_pl"..x, 1)
      		end
		    end
		  end
		end
	end
--Command Fortress	  
  if ncf > 0 then      
	  for i = 0,ncf-1,1 do  
	    if SobGroup_Empty("splitcommandfortresses"..i) == 0 then
	      if SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_commandfortress") == 1 then
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 2") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 1") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher4")    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher6")   
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher7")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher8")                    
		        end  	                            
		      end		        
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 18") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 17") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret4")    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret6")   			                  
		        end  	                            
		      end			
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 32") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 31") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner2")      
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner4")       
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner5")                    
		        end  	                            
		      end				        	        
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 24") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 23") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid3")  	
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid4")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid5")  	
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid6")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid7")
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid8")  			                       
		        end  	                            
		      end			      
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 41") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 40") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf2")  	
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf4")  			          	                       
		        end  	                            
		      end			 		      
		      		 		      
---mass shield		      
		      --if SobGroup_IsDoingAbility("splitcommandfortresses"..i, abilityList[25]) == 1 then   
		        --for z = 1,14,1 do
		          --SobGroup_Create("shielder"..i .. tostring(z))   		          		          
		          --if SobGroup_Empty("shielder"..i .. tostring(z)) == 1 then		 		            
		            --if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..SobGroup_OwnedBy("splitcommandfortresses"..i), "splitcommandfortresses"..i, 3000) == 1 then 
			            --SobGroup_FillShipsByType("shielder"..i .. tostring(z), "temp", "shielder" .. tostring(z)) 
			          --end  			          
			          --if SobGroup_Empty("shielder"..i .. tostring(z)) == 1 then 			          		                 
		              --SobGroup_CreateShip("splitcommandfortresses"..i, "shielder" .. tostring(z))
		              --break  	
		            --end   		              
		          --end  
		        --end    		        
		      --else		          		        
		        --for z = 1,14,1 do
		          --SobGroup_Create("shielder"..i .. tostring(z))   
		          --SobGroup_SetHealth("shielder"..i .. tostring(z), 0)
		        --end  
		      --end
		    
		    elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_ark") == 1 then
	        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w2") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w1") > 0 then			          
		        	for idx = 1, 6 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_a"..idx)        
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w1a") > 0 then			          
		        	for idx = 1, 6 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_a_mortar"..idx)        
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w1b") > 0 then			          
		        	for idx = 1, 6 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_a_torpedo"..idx)        
		          end
		        end
		      end
		    elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "vgr_commandfortress") == 1 then
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 2") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 1") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd4")    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd6")   
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd7")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd8")
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd9")  
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd10")  
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd11")    
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd12")  
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd13")   
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd14") 	
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd15")  	                              
		        end  	                            
		      end	
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 18") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 17") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion4")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion6")                            
		        end  	                            
		      end	
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 27") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 26") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box4")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box5")                            
		        end  	                            
		      end				      
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 33") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 32") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_dt3_turret1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_dt3_turret2")  		                             
		        end  	                            
		      end			              	        	        
		    elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "rad_blackmarket") == 1 then
		    	if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t2") + SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t3") + SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t4") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1") > 0 then			          
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarketkinetic"..idx)        
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1a") > 0 then			          
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarketboomer"..idx)        
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1b") > 0 then			          
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarketmortar"..idx)        
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1c") > 0 then			          
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarkethowitzer"..idx)        
		          end
		        end
		      end
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p2") + SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p3") + SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p4") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1") > 0 then
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarket_clustermissile"..idx)
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1a") > 0 then
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarket_scud"..idx)
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1b") > 0 then
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarket_disco"..idx)
		          end
		        elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1c") > 0 then
		        	for idx = 1, 3 do
		          	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "rad_blackmarket_kickass"..idx)
		          end
		        end
		      end
		    end  		                
	    end 
	  end  	
	end 	
	
--Vortex
  --if nbc > 0 then
	  --for i = 0,nbc-1,1 do                                             
	    --if SobGroup_Empty("splitbattlecruisers"..i) == 0 then      
	      --if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_vortex") == 1 then    	         
		      
		    --end
		  --end
		--end
	--end	     

  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        playerIndexList = playerIndex + 1
        if Player_GetRace(playerIndex) == Race_Hiigaran then 
---Mothership
          --if SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2") > 0 then      
            --SobGroup_AbilityActivate("hgn_mothership"..playerIndex, abilityList[15], 1)
          --else 
            --SobGroup_AbilityActivate("hgn_mothership"..playerIndex, abilityList[15], 0)  
          --end        
          if Player_HasResearch(playerIndex, "ImprovedTorpedoMothership" ) == 1 then
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense1", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense2", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense3", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense4", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense5", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense6", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense7", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense8", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense9", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense10", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense11", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense12", 0)	          
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp1", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp2", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp3", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp4", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp5", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp6", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp7", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp8", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp9", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp10", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp11", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp12", 1)	 	        
	        else
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense1", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense2", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense3", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense4", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense5", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense6", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense7", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense8", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense9", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense10", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense11", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense12", 1)		          
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp1", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp2", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp3", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp4", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp5", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp6", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp7", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp8", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp9", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp10", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp11", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp12", 0)	 	 
	        end 	        
          
---Missile Frigate         
          if Player_HasResearch(playerIndex, "ImprovedTorpedo" ) == 1 then
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo", 1)	 
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo1", 0)	     
	        else
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo", 0)	 
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo1", 1)	         
	        end 

---Cruiser A	        
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoCruiseraIcon" ) == 1 then
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T1", 1)	   
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T2", 1)
	        else
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T1", 0)	   
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T2", 0)         
	        end
---Cruiser B
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoCruiserbIcon" ) == 1 then
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T1", 1)	   
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T2", 1)
	        else
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T1", 0)	   
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T2", 0)         
	        end
        
        elseif Player_GetRace(playerIndex) == Race_Vaygr then 
---Mechanic                
	        if Player_HasResearch(playerIndex, "RepairBeamUpgrade3" ) == 1 then
	          SobGroup_ChangePower("vgr_patcher"..playerIndex, "Weapon_P2", 1)
	        else
	        	SobGroup_ChangePower("vgr_patcher"..playerIndex, "Weapon_P2", 0)
	        end
---Battleship                
	        if Player_HasResearch(playerIndex, "MineBattleship" ) == 1 then
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_DslAftA", 1)	   
	        else
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_DslAftA", 0)	         
	        end
	        if Player_HasResearch(playerIndex, "FreackerBattleship" ) == 1 then
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_freacker", 1)	   
	        else
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_freacker", 0)	         
	        end
---Destroyer	        
	        if Player_HasResearch(playerIndex, "MineDestroyer" ) == 1 then
	          SobGroup_ChangePower("vgr_destroyer"..playerIndex, "Weapon_Monster", 1)	   
	        else
	          SobGroup_ChangePower("vgr_destroyer"..playerIndex, "Weapon_Monster", 0)	         
	        end
---PulseDestroyer	        
	        if Player_HasResearch(playerIndex, "MinePulseDestroyer" ) == 1 then
	          SobGroup_ChangePower("vgr_pulsedestroyer"..playerIndex, "Weapon_Front", 1)	   
	        else
	          SobGroup_ChangePower("vgr_pulsedestroyer"..playerIndex, "Weapon_Front", 0)	         
	        end					
---Cruiser
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoCruiser1" ) == 1 then
	          SobGroup_ChangePower("vgr_cruiser"..playerIndex, "Weapon_hf", 1)	   
	        else
	          SobGroup_ChangePower("vgr_cruiser"..playerIndex, "Weapon_hf", 0)	         
	        end
---Armoured Cruiser	        
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoLightCruiser" ) == 1 then
	          SobGroup_ChangePower("vgr_lightcruiser"..playerIndex, "Weapon_Missile", 1)
	          SobGroup_ChangePower("vgr_lightcruiser_gun"..playerIndex, "Weapon_Missile", 1)
	        else
	          SobGroup_ChangePower("vgr_lightcruiser"..playerIndex, "Weapon_Missile", 0)
	          SobGroup_ChangePower("vgr_lightcruiser_gun"..playerIndex, "Weapon_Missile", 0)
	        end
	      elseif Player_GetRace(playerIndex) == Race_Kadeshi then
---Needleship
	        if Player_HasResearch(playerIndex, "NeedleshipHeavyMissile" ) == 1 then
	          SobGroup_ChangePower("kad_needleship"..playerIndex, "Weapon_Missile", 1)
	        else
	          SobGroup_ChangePower("kad_needleship"..playerIndex, "Weapon_Missile", 0)
	        end
---Templar                somehow doesn't work			well, it should be hardpoint name not animation name!
	        --if Player_HasResearch(playerIndex, "SpearsOfKadesh" ) == 1 then
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Missile", 0)	
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Missile1", 1)	 
	        --else
	        --	SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Missile", 1)	
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Missile1", 0)
	        --end
	        --if Player_HasResearch(playerIndex, "TF_Templar" ) == 1 then
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam1", 0)	   
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam2", 0)	
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam3", 1)	   
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam4", 1)	
	        --else
	        --	SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam1", 1)	   
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam2", 1)	
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam3", 0)	   
	        --  SobGroup_ChangePower("kad_destroyer_real"..playerIndex, "Weapon_Beam4", 0)
	        --end
	      elseif Player_GetRace(playerIndex) == Race_Raider then
	      elseif Player_GetRace(playerIndex) == Race_Keeper then
	      end 	                       
      end
    end
    playerIndex = playerIndex + 1
  end      	       
end  

---Disable Ship----------------------------------------------

function disableship(sobgroup)
  for i = 1,17,1 do
    SobGroup_AbilityActivate(sobgroup, abilityList[i], 0)	   
  end
end

---Eventi----------------------------------------------------------------

function eventi()  
  local playerIndex = Universe_CurrentPlayer() 
  playerIndexList = playerIndex + 1    
  if Player_GetRace(playerIndex) == Race_Hiigaran then                                              
---alarm  
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") >= 1 then
	    if (SobGroup_HealthPercentage("hgn_mothership"..playerIndex) <= 0.15 and SobGroup_Empty("hgn_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("hgn_mothership"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 3: Mothership's health is less than 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("hgn_mothership"..playerIndex) <= 0.3 and SobGroup_Empty("hgn_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("hgn_mothership"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 2: Mothership's health is less than 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("hgn_mothership"..playerIndex) <= 0.5 and SobGroup_Empty("hgn_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("hgn_mothership"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Mothership's health is less than 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "hgn_mothership"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching the Mothership",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "nucleartubeenemies"..playerIndex, "hgn_mothership"..playerIndex, 16000) == 1) then
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3") == 1 then
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy Nuclear Bomb is approaching the Mothership",1.72)
		      eventitime[playerIndexList] = 8.88
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "lightgranuleenemies"..playerIndex, "hgn_mothership"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy Light Granule is approaching the Mothership",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "jihadiswarmerenemies"..playerIndex, "hgn_mothership"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy Jihadi Swarmers are approaching the Mothership",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "hgn_mothership"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy MOAB is approaching the Mothership",1.72)    
	      eventitime[playerIndexList] = 8.88
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end 
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
---alarm	
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") >= 1 then
	    if (SobGroup_HealthPercentage("vgr_mothership"..playerIndex) <= 0.15 and SobGroup_Empty("vgr_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("vgr_mothership"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(Actor_Makaan,"Alarm Level 3: Flagship's health is less than 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("vgr_mothership"..playerIndex) <= 0.3 and SobGroup_Empty("vgr_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("vgr_mothership"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(Actor_Makaan,"Alarm Level 2: Flagship's health is less than 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("vgr_mothership"..playerIndex) <= 0.5 and SobGroup_Empty("vgr_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("vgr_mothership"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Flagship's health is less than 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "vgr_mothership"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching the Flagship",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "nucleartubeenemies"..playerIndex, "vgr_mothership"..playerIndex, 16000) == 1) then
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3") == 1 then
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy Nuclear Bomb is approaching the Flagship",1.72)
		      eventitime[playerIndexList] = 8.88
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "lightgranuleenemies"..playerIndex, "vgr_mothership"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy Light Granule is approaching the Flagship",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "jihadiswarmerenemies"..playerIndex, "vgr_mothership"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy Jihadi Swarmers are approaching the Flagship",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "vgr_mothership"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy MOAB is approaching the Flagship",1.72)    
	      eventitime[playerIndexList] = 8.88      
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end 
	elseif Player_GetRace(playerIndex) == Race_Raider then
---alarm	
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_mothership") >= 1 then
	    if (SobGroup_HealthPercentage("rad_mothership"..playerIndex) <= 0.15 and SobGroup_Empty("rad_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("rad_mothership"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(13,"Alarm Level 3: Pirate Ship's health is less than 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("rad_mothership"..playerIndex) <= 0.3 and SobGroup_Empty("rad_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("rad_mothership"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(13,"Alarm Level 2: Pirate Ship's health is less than 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("rad_mothership"..playerIndex) <= 0.5 and SobGroup_Empty("rad_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("rad_mothership"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(13,"Alarm Level 1: Pirate Ship's health is less than 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "rad_mothership"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(13,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching the Pirate Ship",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "nucleartubeenemies"..playerIndex, "rad_mothership"..playerIndex, 16000) == 1) then
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3") == 1 then
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(13,"Alarm Level 1: Enemy Nuclear Bomb is approaching the Pirate Ship",1.72)
		      eventitime[playerIndexList] = 8.88
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "lightgranuleenemies"..playerIndex, "rad_mothership"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(13,"Alarm Level 1: Enemy Light Granule is approaching the Pirate Ship",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "jihadiswarmerenemies"..playerIndex, "rad_mothership"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(13,"Alarm Level 1: Enemy Jihadi Swarmers are approaching the Pirate Ship",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "rad_mothership"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(13,"Alarm Level 1: Enemy MOAB is approaching the Pirate Ship",1.72)    
	      eventitime[playerIndexList] = 8.88      
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
---alarm	
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship") == 1 then
	    if (SobGroup_HealthPercentage("kad_needleship"..playerIndex) <= 0.15 and SobGroup_Empty("kad_needleship"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("kad_needleship"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(14,"Alarm Level 3: Needleship's health is less than 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("kad_needleship"..playerIndex) <= 0.3 and SobGroup_Empty("kad_needleship"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("kad_needleship"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(14,"Alarm Level 2: Needleship's health is less than 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("kad_needleship"..playerIndex) <= 0.5 and SobGroup_Empty("kad_needleship"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("kad_needleship"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(14,"Alarm Level 1: Needleship's health is less than 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "kad_needleship"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(14,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching the Needleship",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "nucleartubeenemies"..playerIndex, "kad_needleship"..playerIndex, 16000) == 1) then
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3") == 1 then
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(14,"Alarm Level 1: Enemy Nuclear Bomb is approaching the Needleship",1.72)
		      eventitime[playerIndexList] = 8.88
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "lightgranuleenemies"..playerIndex, "kad_needleship"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(14,"Alarm Level 1: Enemy Light Granule is approaching the Needleship",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "jihadiswarmerenemies"..playerIndex, "kad_needleship"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(14,"Alarm Level 1: Enemy Jihadi Swarmers are approaching the Needleship",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "kad_needleship"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(14,"Alarm Level 1: Enemy MOAB is approaching the Needleship",1.72)    
	      eventitime[playerIndexList] = 8.88      
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end
	elseif Player_GetRace(playerIndex) == Race_Keeper then
---alarm	
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_shipyard_old") == 1 then
	    if (SobGroup_HealthPercentage("kpr_shipyard_old"..playerIndex) <= 0.15 and SobGroup_Empty("kpr_shipyard_old"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("kpr_shipyard_old"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(Actor_Keeper,"Alarm Level 3: Wormhole's health is less than 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("kpr_shipyard_old"..playerIndex) <= 0.3 and SobGroup_Empty("kpr_shipyard_old"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("kpr_shipyard_old"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(Actor_Keeper,"Alarm Level 2: Wormhole's health is less than 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("kpr_shipyard_old"..playerIndex) <= 0.5 and SobGroup_Empty("kpr_shipyard_old"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("kpr_shipyard_old"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Keeper,"Alarm Level 1: Wormhole's health is less than 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "kpr_shipyard_old"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_Keeper,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching the Wormhole",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "nucleartubeenemies"..playerIndex, "kpr_shipyard_old"..playerIndex, 16000) == 1) then
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3") == 1 then
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_Keeper,"Alarm Level 1: Enemy Nuclear Bomb is approaching the Wormhole",1.72)
		      eventitime[playerIndexList] = 8.88
		    end
	    elseif (SobGroup_FillProximitySobGroup("temp", "lightgranuleenemies"..playerIndex, "kpr_shipyard_old"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Keeper,"Alarm Level 1: Enemy Light Granule is approaching the Wormhole",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "jihadiswarmerenemies"..playerIndex, "kpr_shipyard_old"..playerIndex, 16000) == 1) then
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Keeper,"Alarm Level 1: Enemy Jihadi Swarmers are approaching the Wormhole",1.72)    
	      eventitime[playerIndexList] = 8.88
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "kpr_shipyard_old"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Keeper,"Alarm Level 1: Enemy MOAB is approaching the Wormhole",1.72)    
	      eventitime[playerIndexList] = 8.88      
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end
	end  
---population    
  if (NeededPilots[playerIndexList] < 1) then
    if audio_block_unitcapreached[playerIndexList] == 0 then
      Sound_SpeechPlay("Data:sound/speech/allships/fleet/status_unitcapreached_1")  
      audio_block_unitcapreached[playerIndexList] = 1
    end 
  else
    audio_block_unitcapreached[playerIndexList] = 0               
  end	 
---Timing
  Rule_Remove("eventi")
	Rule_AddInterval("eventi", eventitime[playerIndexList])				       	 
end 

---Objectives-------------------------------------------
function objectives_mp()    
  if secondaryobjectives ~= -1 or objectiveinit == 1 then
	  local playerIndex = 0                         
	  while playerIndex < Universe_PlayerCount() do
	    if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
	        playerIndexList = playerIndex + 1		 				  
			  
			---objective init
				  if objectiveinit == 1 then
					  if (winCondition == "DestroyMothership") then
					    Survive_id = Objective_Add("Destroy Mothership", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Search and destroy the enemy Mothership, your Mothership must survive")
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: search and destroy enemy Motherships, your Mothership must survive",10)    
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					  elseif (winCondition == "DestroyProduction") then
					    Survive_id = Objective_Add("Destroy Production", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Search and destroy enemy production Capital Ships, to survive you must have at least one active production Capital Ship in your fleet")
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: search and destroy enemy production Capital Ships, to survive you must have at least one active production Capital Ship in your fleet",10)
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					  elseif (winCondition == "DestroyAll") then 
					    Survive_id = Objective_Add("Destroy All", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Search and destroy enemy forces, to survive you must have at least one active ship in your fleet")  
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: search and destroy enemy forces, to survive you must have at least one active ship in your fleet",10) 
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")  
					  elseif (winCondition == "Store100000RUs") then 
					    Survive_id = Objective_Add("Store 100000 RUs", OT_Primary)
					  	Objective_AddDescription(Survive_id, "The first Player to accumulate 100000 RUs wins")  
					  	Subtitle_Add(Actor_FleetIntel,"The first Player to accumulate 100000 RUs wins",10) 
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")        	      	
					  elseif (winCondition == "CaptureAllPost") then
					    Survive_id = Objective_Add("Conquer Territories", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Capture all enemy Command Posts, to survive you must have at least one Command Post in your fleet")
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: capture all enemy Command Posts, to survive you must have at least one Command Post in your fleet",10)
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					  end   
					  objectiveinit = objectiveinit + 1  					  
					  break 	  
				  elseif objectiveinit == 2 then
				
				---resource race 	
				    if rurace == 1 then			  	
			  	  	Reach10000RUs_id = Objective_Add("Accumulate 10000 RUs", OT_Secondary)
				  		Objective_AddDescription(Reach10000RUs_id, "The first Player to accumulate 10000 RUs will gain 5000 RUs and 5 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to accumulate 10000 RUs will gain 5000 RUs and 5 Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rurace = rurace + 1
				  		break
				  	elseif rurace == 2 then
				  	  if Player_GetRU(playerIndex) >= 10000 and RUMaxCapacityList[playerIndexList] >= 10000 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 5000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 5
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Accumulate 10000 RUs"..Time_PrintYear());										
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Accumulate 10000 RUs completed by " .. GetPlayerNameWithColour(playerIndex)); 					 								
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Accumulate 10000 RUs completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(Reach10000RUs_id, OS_Complete)					  
								else
								  Objective_SetState(Reach10000RUs_id, OS_Failed)
								end  
								rurace = rurace + 1  
								break	
							end	
						elseif rurace == 3 then			  	
			  	  	Reach20000RUs_id = Objective_Add("Accumulate 20000 RUs", OT_Secondary)
				  		Objective_AddDescription(Reach20000RUs_id, "The first Player to accumulate 20000 RUs will gain 10000 RUs and 10 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to accumulate 20000 RUs will gain 10000 RUs and 10 Honor points",7)
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")				  				  	
				  		rurace = rurace + 1	
				  		break
						elseif rurace == 4 then
						  if Player_GetRU(playerIndex) >= 20000 and RUMaxCapacityList[playerIndexList] >= 20000 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 10000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 10
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Accumulate 20000 RUs"..Time_PrintYear());							
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Accumulate 20000 RUs completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Accumulate 20000 RUs completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(Reach20000RUs_id, OS_Complete)					  
								else
								  Objective_SetState(Reach20000RUs_id, OS_Failed)
								end  
								rurace = rurace + 1  
								break	
							end	 	  
				  	elseif rurace == 5 then			  	
			  	  	Reach40000RUs_id = Objective_Add("Accumulate 40000 RUs", OT_Secondary)
				  		Objective_AddDescription(Reach40000RUs_id, "The first Player to accumulate 40000 RUs will gain 20000 RUs and 20 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to accumulate 40000 RUs will gain 20000 RUs and 20 Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rurace = rurace + 1	
				  		break
						elseif rurace == 6 then
						  if Player_GetRU(playerIndex) >= 40000 and RUMaxCapacityList[playerIndexList] >= 40000 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 20000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 20
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Accumulate 40000 RUs"..Time_PrintYear());							
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Accumulate 40000 RUs completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Accumulate 40000 RUs completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(Reach40000RUs_id, OS_Complete)					  
								else
								  Objective_SetState(Reach40000RUs_id, OS_Failed)
								end  
								rurace = rurace + 1  
								break	
							end	 	  
				  	end		
				  	
				---rank race 	
				    if rankrace == 1 then			  	
			  	  	ReachLieutenantRank_id = Objective_Add("Gain the Lieutenant Rank", OT_Secondary)
				  		Objective_AddDescription(ReachLieutenantRank_id, "The first Player to gain the Lieutenant rank will gain 2000 RUs and 2 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Lieutenant rank will gain 2000 RUs and 2 Honor points",7)
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")				  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 2 then
				  	  if PlayerRankExamination(playerIndex, "isLieutenant") == 1 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 2000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 2
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Lieutenant Rank"..Time_PrintYear());						
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Lieutenant Rank completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Lieutenant Rank completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachLieutenantRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachLieutenantRank_id, OS_Failed)
								end  													
								rankrace = rankrace + 1  
								break	
							end
						elseif rankrace == 3 then			  	
			  	  	ReachCommanderRank_id = Objective_Add("Gain the Commander Rank", OT_Secondary)
				  		Objective_AddDescription(ReachCommanderRank_id, "The first Player to gain the Commander rank will gain 4000 RUs and 4 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Commander rank will gain 4000 RUs and 4 Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 4 then
				  	  if PlayerRankExamination(playerIndex, "isCommander") == 1 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 4000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 4
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Commander Rank"..Time_PrintYear());			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Commander Rank completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Commander Rank completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachCommanderRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachCommanderRank_id, OS_Failed)
								end  							
								rankrace = rankrace + 1  
								break	
							end			
						elseif rankrace == 5 then			  	
			  	  	ReachCaptainRank_id = Objective_Add("Gain the Captain Rank", OT_Secondary)
				  		Objective_AddDescription(ReachCaptainRank_id, "The first Player to gain the Captain rank will gain 6000 RUs and 6 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Captain rank will gain 6000 RUs and 6 Honor points",7)		
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")		  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 6 then
				  	  if PlayerRankExamination(playerIndex, "isCaptain") == 1 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 6000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 6
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Captain Rank"..Time_PrintYear());			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Captain Rank completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Captain Rank completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachCaptainRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachCaptainRank_id, OS_Failed)
								end  											
								rankrace = rankrace + 1  
								break	
							end			
						elseif rankrace == 7 then			  	
			  	  	ReachCommodoreRank_id = Objective_Add("Gain the Commodore Rank", OT_Secondary)
				  		Objective_AddDescription(ReachCommodoreRank_id, "The first Player to gain the Commodore rank will gain 8000 RUs and 8 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Commodore rank will gain 8000 RUs and 8 Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 8 then
				  	  if PlayerRankExamination(playerIndex, "isCommodore") == 1 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 8000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 8
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Commodore Rank"..Time_PrintYear());			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Commodore Rank completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Commodore Rank completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachCommodoreRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachCommodoreRank_id, OS_Failed)
								end  											
								rankrace = rankrace + 1  
								break	
							end	
						elseif rankrace == 9 then			  	
			  	  	ReachAdmiralRank_id = Objective_Add("Gain the Admiral Rank", OT_Secondary)
				  		Objective_AddDescription(ReachAdmiralRank_id, "The first Player to gain the Admiral rank will gain 10000 RUs and 10 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Admiral rank will gain 10000 RUs and 10 Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 10 then
				  	  if PlayerRankExamination(playerIndex, "isAdmiral") == 1 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 10000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 10
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Admiral Rank"..Time_PrintYear());			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Admiral Rank completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Admiral Rank completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachAdmiralRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachAdmiralRank_id, OS_Failed)
								end  												
								rankrace = rankrace + 1  
								break	
							end					  	
						elseif rankrace == 11 then			  	
			  	  	ReachFleetAdmiralRank_id = Objective_Add("Gain the Fleet Admiral Rank", OT_Secondary)
				  		Objective_AddDescription(ReachFleetAdmiralRank_id, "The first Player to gain the Fleet Admiral rank will gain 12000 RUs and 12 Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Fleet Admiral rank will gain 12000 RUs and 12 Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 12 then
				  	  if PlayerRankExamination(playerIndex, "isFleetAdmiral") == 1 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 12000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 12
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Fleet Admiral Rank"..Time_PrintYear());			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Fleet Admiral Rank completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Fleet Admiral Rank completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachFleetAdmiralRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachFleetAdmiralRank_id, OS_Failed)
								end  						
								rankrace = rankrace + 1  
								break	
							end	
						end					  							  							  				  								  							  	
				  	
				---megalith race 	
				    if domainrace == 1 then		
				      if SobGroup_Count("megalithnoowner") > 0 then	  	
				  	  	CaptureMegalith_id = Objective_Add("Capture Mining Base", OT_Secondary)
					  		Objective_AddDescription(CaptureMegalith_id, "The first Player to capture a Mining Base will gain 5000 RUs and 5 Honor points")
					  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to capture a Mining Base will gain 5000 RUs and 5 Honor points",7)	
					  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
					  		domainrace = domainrace + 1
					  		break
					  	end	
				  	elseif domainrace == 2 then
				  	  if SobGroup_Count("meg_gehenna_1ctm"..playerIndex) > 0 or SobGroup_Count("meg_gehenna_3ctm"..playerIndex) > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 5000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 5
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Capture Mining Base"..Time_PrintYear());			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Capture Mining Base completed by " .. GetPlayerNameWithColour(playerIndex));
									UI_ShowRandomButtonWithDialogue(playerIndex, "rurace")
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Capture Mining Base completed by " .. GetPlayerNameWithColour(playerIndex),7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(CaptureMegalith_id, OS_Complete)					  
								else
								  Objective_SetState(CaptureMegalith_id, OS_Failed)
								end  													
								domainrace = domainrace + 1 
								break	
							end							
				  	end	 	
				  	
				  end				
				end
			end
			playerIndex = playerIndex + 1
		end			 
	else
	  Rule_Remove("objective")  
	end  			
end 

function PlayerRankExamination(playerIndex, rank)
	local hasrank = 0
	if Player_GetRace(playerIndex) == Race_Raider then
		if Player_HasResearch(playerIndex, rank) == 1 then
			hasrank = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Hiigaran then
		if SobGroup_Empty("hgn_crewstation"..playerIndex) == 0 then
			if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, rank) > 0 then
				hasrank = 1
			end
		end
	else
		if SobGroup_GetHardPointHealth("supporter"..playerIndex, rank) > 0 then
			hasrank = 1
		end
	end
	return hasrank
end

---On start one time job-------------------------------------------

function DefineTempGlobalVariables()
	Temp_GlobalVariable.RepairBeamKiddies = {0,0,0,0,0,0}
	Temp_GlobalVariable.RaceCheck_Save = 0
	Temp_GlobalVariable.Selected_Save = 0
	Temp_GlobalVariable.Selected_NextInterval = 0.7
	Temp_GlobalVariable.Aurora_Save = 0
	Temp_GlobalVariable.AI_AugmentedSkills_Save = 0
	Temp_GlobalVariable.DroneSave = 0
	Temp_GlobalVariable.enablebtnparade = {0,0,0,0,0,0}
	Temp_GlobalVariable.enablebtncallisto = {0,0,0,0,0,0}
	Temp_GlobalVariable.enablebtnperforate = {0,0,0,0,0,0}
	Temp_GlobalVariable.enablebtnheavyioncannon = {0,0,0,0,0,0}
	Temp_GlobalVariable.enablebtnnuclear = {0,0,0,0,0,0}
	Temp_GlobalVariable.AI_BuildSubsystemsLastSOB = {"","","","","",""}
	Temp_GlobalVariable.AI_BuildSubsystemsLastNum = {-1,-1,-1,-1,-1,-1}
	Temp_GlobalVariable.SelectedShips = {0,0,0,0,0,0}
	Temp_GlobalVariable.HaxBuild = {0,0,0,0,0,0}
	Temp_GlobalVariable.HaxRU = {0,0,0,0,0,0}
	Temp_GlobalVariable.HaxEnergy = {0,0,0,0,0,0}
	Temp_GlobalVariable.HaxUnitCap = {0,0,0,0,0,0}
	L4_cache.DummyHSGateFlags = {}	--00000010 crash debug
	L4_cache.EndgameCrisis = {}	--a list to store the names of secondary megaliths spawned during the game
	L4_cache.EndgameCrisisYear = 0
end

function OnStartOneTimeJob()
	DefineTempGlobalVariables()
	local playerIndex = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
			--health tweak for fighters and corvettes		
			for i = 1,3 do
				if i == tweakfighterhealth then 
				  if Player_CanResearch(playerIndex, "MAXHEALTH_FIGHTER_"..i) == 1 then
						Player_GrantResearchOption(playerIndex, "MAXHEALTH_FIGHTER_"..i)
					end
				else
					if Player_CanResearch(playerIndex, "MAXHEALTH_FIGHTER_"..i) == 1 then
				  	Player_RestrictResearchOption(playerIndex, "MAXHEALTH_FIGHTER_"..i)
				  end
				end
				if i == tweakcorvettehealth then 
				  if Player_CanResearch(playerIndex, "MAXHEALTH_CORVETTE_"..i) == 1 then
						Player_GrantResearchOption(playerIndex, "MAXHEALTH_CORVETTE_"..i)
					end
				else
					if Player_CanResearch(playerIndex, "MAXHEALTH_CORVETTE_"..i) == 1 then
				  	Player_RestrictResearchOption(playerIndex, "MAXHEALTH_CORVETTE_"..i)
				  end
				end
			end
			--disbale computer hack in multiplaer to prevent out of sync error
			if GetGameRubric() == GR_MULTIPLAYER then
				Player_RestrictResearchOption(playerIndex, "computerhack")
				for i=1,3 do
					Player_RestrictResearchOption(playerIndex, "computerhack"..i)
				end
			end
    end
 	playerIndex = playerIndex + 1
  end
end

function OnStartOneTimeJob_SP()
	DefineTempGlobalVariables()
	local playerIndex = Universe_CurrentPlayer()
  if Player_IsAlive(playerIndex) == 1 then
		--health tweak for fighters and corvettes		
		for i = 1,3 do
			if i == tweakfighterhealth then 
			  if Player_CanResearch(playerIndex, "MAXHEALTH_FIGHTER_"..i) == 1 then
					Player_GrantResearchOption(playerIndex, "MAXHEALTH_FIGHTER_"..i)
				end
			else
				if Player_CanResearch(playerIndex, "MAXHEALTH_FIGHTER_"..i) == 1 then
			  	Player_RestrictResearchOption(playerIndex, "MAXHEALTH_FIGHTER_"..i)
			  end
			end
			if i == tweakcorvettehealth then 
			  if Player_CanResearch(playerIndex, "MAXHEALTH_CORVETTE_"..i) == 1 then
					Player_GrantResearchOption(playerIndex, "MAXHEALTH_CORVETTE_"..i)
				end
			else
				if Player_CanResearch(playerIndex, "MAXHEALTH_CORVETTE_"..i) == 1 then
			  	Player_RestrictResearchOption(playerIndex, "MAXHEALTH_CORVETTE_"..i)
			  end
			end
		end
  end
end

function Supporter_GetAlliedID(playerIndex)
	local hasallies = 0
	for iPlayerIndex = 0, Universe_PlayerCount() - 1 do
		if hasallies == 0 then
			if Player_IsAlive(iPlayerIndex) == 1 and iPlayerIndex ~= playerIndex then
				if SobGroup_Empty("supporter"..iPlayerIndex) == 0 then
				  if AreAllied(playerIndex, iPlayerIndex) == 1 and AreAllied(iPlayerIndex, playerIndex) == 1 then
				  	Supporter_ID[playerIndex+1] = iPlayerIndex
				  	hasallies = 1
				  end
				end
			end
		end
	end
	if hasallies == 0 then
		Supporter_ID[playerIndex+1] = playerIndex
	end
	return Supporter_ID[playerIndex+1]
end

---Match Init-------------------------------------------

function matchinit()   

---stabilisce la velocit?del match (11-52->0.5-2.36)
  if year < 3 then
		gamespeedprogression =
		(	
		(resstart/1000) +
		startwith +
		honourstart +	
		buildspeed +
		resource +	
		honoursensitivity +
		researchsensitivity + 
		recruiting +
		(rankremuneration-1) +	
		experiencesensitivity +
		energysensitivity 
		)
		/
		22
	end	 	
  
  local playerIndex = 0
  local playerIndexList = 0
  local cpu = 1   
  local player = 1    
  local stopsupport = 0
  local rest_allies = {-1,-1,-1,-1,-1,-1}
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
				
				--research restrict
				if SobGroup_Empty("star_sol") == 1 then
					for u=1,3,1 do
						Player_RestrictResearchOption_Smart(playerIndex, "solarshield"..u)
						Player_RestrictResearchOption_Smart(playerIndex, "remotespaceshield"..u)
					end
				end
				
				--gamespeed		
				if gamespeedprogression < 1 then 
				  if Player_CanResearch(playerIndex, "gamespeed1" ) == 1 then
						Player_GrantResearchOption(playerIndex, "gamespeed1")
					end
				elseif gamespeedprogression < 1.5 then
				  if Player_CanResearch(playerIndex, "gamespeed2" ) == 1 then
						Player_GrantResearchOption(playerIndex, "gamespeed2")
					end	
				else
				  if Player_CanResearch(playerIndex, "gamespeed3" ) == 1 then
						Player_GrantResearchOption(playerIndex, "gamespeed3")
					end	
				end
				if SobGroup_Empty("supporter"..playerIndex) == 0 then
				
					if playerIndex < Universe_PlayerCount() - 1 then
						for iPlayerIndex = playerIndex, Universe_PlayerCount() - 1 do
					    if Player_IsAlive(iPlayerIndex) == 1 and iPlayerIndex ~= playerIndex then
					      if AreAllied(playerIndex, iPlayerIndex) == 1 or AreAllied(iPlayerIndex, playerIndex) == 1 then
					      	rest_allies[iPlayerIndex+1] = iPlayerIndex		--don't add more subsystem to this player
					      end
					    end
					  end
				  end
					
					if Table_ContainElement(rest_allies, playerIndex) == 0 then		--don't let multipliers overlap for allies
				  --if stopsupport == 0 then		--for the first player
				  	local speed_up = 0
				  	local speed_down = 0
				  	if unitbehavior >=0 and unitbehavior<=1 then
				  		speed_up = unitbehavior
				  	elseif unitbehavior == -1 then			--slow
				  		speed_down = 0.4
				  	elseif unitbehavior == -2 then			--slower
				  		speed_down = 0.7
				  	elseif unitbehavior == -3 then			--slowest
				  		speed_down = 1
				  	end
				  	--print("Configuring Unit Behaviour for player Index: "..playerIndex..", speed_up = "..speed_up..", speed_down = "..speed_down)
				  	if unithealth >= 0 then
					  	CreateSubsystemOnShip("supporter"..playerIndex, "resistence")
							SobGroup_SetHardPointHealth("supporter"..playerIndex, "resistence", unithealth)
						end
						if buildspeed >= 0 then
							CreateSubsystemOnShip("supporter"..playerIndex, "buildspeed")
							SobGroup_SetHardPointHealth("supporter"..playerIndex, "buildspeed", buildspeed)
						end
						if resource >= 0 then
							CreateSubsystemOnShip("supporter"..playerIndex, "resource")
							SobGroup_SetHardPointHealth("supporter"..playerIndex, "resource", resource)
						end
						if hyperspace >= 0 then
							CreateSubsystemOnShip("supporter"..playerIndex, "hyperspace")
							SobGroup_SetHardPointHealth("supporter"..playerIndex, "hyperspace", hyperspace)
						end
						if speed_up > 0 then
							CreateSubsystemOnShip("supporter"..playerIndex, "unitbehavior")
							SobGroup_SetHardPointHealth("supporter"..playerIndex, "unitbehavior", speed_up)
						end
						if speed_down > 0 then
							CreateSubsystemOnShip("supporter"..playerIndex, "unitbehavior_downgrade")
							SobGroup_SetHardPointHealth("supporter"..playerIndex, "unitbehavior_downgrade", speed_down)
						end
						--stopsupport = 1
					--else			--for the rest players
            --SobGroup_SetHardPointHealth_Smart("supporter"..playerIndex, "resistence", 0)
						--SobGroup_SetHardPointHealth_Smart("supporter"..playerIndex, "buildspeed", 0.145)
						--SobGroup_SetHardPointHealth_Smart("supporter"..playerIndex, "resource", 0.155)
						--SobGroup_SetHardPointHealth_Smart("supporter"..playerIndex, "hyperspace", 0.94)
						--RemoveSubsystemOnShip("supporter"..playerIndex, "unitbehavior")
						--RemoveSubsystemOnShip("supporter"..playerIndex, "unitbehavior_downgrade")
					--end
					end
					
					if GetGameRubric() ~= GR_CAMPAIGN then
						if GameRulesName ~= nil then
							if GameRulesName == "Simplex Territories" then		--exception for player naming
								if PlayerBlockNameList[playerIndexList] == 0 then
									if playerIndex < 4 then
										if CPU_Exist_Smart(playerIndex) == 1 then
											Player_SetPlayerNameAdvanced(playerIndex, "CPU " .. cpu)
											cpu = cpu + 1
										else
											Player_SetPlayerNameAdvanced(playerIndex, "Player " .. player)
											player = player + 1
											--if playerIndex == Universe_CurrentPlayer() then
											--	Player_SetPlayerNameAdvanced(playerIndex, PlayerSetup.chatname)
											--end
										end
									end
									PlayerBlockNameList[playerIndexList] = 1		--do nothing for territories mode
								end
							end
						end
						if PlayerBlockNameList[playerIndexList] == 0 then        
							if CPU_Exist_Smart(playerIndex) == 1 then 		--Player_HasResearch(playerIndex, "isai" ) == 1
								if cpuname == 2 then		--Name after race
									local personname = {"Smith", "Johnson", "Williams", "Jones", "Brown", "Andrews", "Ruiz", "Harper", "Fox", "Sims", "Austin", "Peters", "Kelley", "Franklin", "Lawson"}
									if Player_GetRace(playerIndex) == Race_Hiigaran then
										--reference: http://homeworld.wikia.com/wiki/Kiith
										personname = {"Karan S'jet", "Majiir Paktu-sa", "Captain Soban", "Teigor Somtaaw", "Kuura Somtaaw", "Ifriit Nabaal-sa", "Gar Nabaal", "Elohim Nabaal", "Huur S'jet-sa", "Fliir S'jet-sa", "Kriil S'jet", "Kona Hraal", "Siima Manaan-sa", "Liir Kaale-sa", "Liam Gaalsien"}
									elseif Player_GetRace(playerIndex) == Race_Vaygr then
										personname = {"Makaan", "Thaddis Sabbah", "Makaan Elite Guard", "Vaygr Navy", "Vaygr Armada", "Vaygr Task Force", "Vaygr Survey", "Planet Killer", "Vaygr Mining", "Logistic Troop", "Vaygr Artillery", "Strategic Troop", "Vaygr Reserves", "Vaygr Patrol", "Vaygr Commissariat"}
									elseif Player_GetRace(playerIndex) == Race_Kadeshi then
										--reference: http://en.wikipedia.org/wiki/List_of_types_of_spiritual_teachers
										personname = {"Sanctimonial", "Psychic", "Kadeshi Pilgrim", "Khar-Toba", "Palmer", "Prophet", "Cleric", "Scribe", "Pastor", "Minister", "Reverend", "Deacon", "Pope", "Chaplain", "Prior", "Hieromonk"}
									elseif Player_GetRace(playerIndex) == Race_Raider then
										personname = {"The Ransomers", "Dust Devil", "Godfather", "Hijacker", "al-Qaeda", "Hacker", "Anarchist", "Terrorist", "Kidnapper", "Trafficker", "Smuggler", "Most Wanted", "Base Raper", "Spectre", "Headsman", "Militia"}
									elseif Player_GetRace(playerIndex) == Race_Keeper then
										personname = {"Gatekeeper", "Peacekeeper", "Stockkeeper", "Storekeeper", "Timekeeper", "Watchkeeper", "Underkeeper", "Nursekeeper", "Lockkeeper", "Gamekeeper", "Zookeeper", "Bookkeeper", "Goalkeeper", "Keeper of Abassid", "Keeper of Sajuuk"}
									end
									local namecount = Table_CountElements(personname)
									local nameindexlist = random_pseudo(1,namecount)
									CPULODList[playerIndexList] = personname[nameindexlist]
									print("Name set for player index "..playerIndex..": "..CPULODList[playerIndexList])
								elseif cpuname == 3 then		--Name after person
									Temp_GlobalVariable.PlayerGender[playerIndexList] = 0
									local firstname = firstname_male		--{"James", "John", "Robert", "Michael", "William", "David", "Richard", "Charles", "Joseph", "Thomas", "Christopher", "Daniel", "Paul", "Mark", "Donald", "George", "Kenneth", "Steven", "Edward", "Brian", "Ronald", "Anthony", "Kevin", "Jason", "Matthew", "Gary", "Timothy", "Jose", "Larry", "Jeffrey", "Frank", "Scott", "Eric", "Stephen", "Andrew", "Raymond", "Gregory", "Joshua", "Jerry", "Dennis", "Walter", "Patrick", "Peter", "Harold", "Douglas", "Henry", "Carl", "Arthur", "Ryan", "Roger", "Joe", "Juan", "Jack", "Albert", "Jonathan", "Justin", "Terry", "Gerald", "Keith", "Samuel", "Willie", "Ralph", "Lawrence", "Nicholas", "Roy", "Benjamin", "Bruce", "Brandon", "Adam", "Harry", "Fred", "Wayne", "Billy", "Steve", "Louis", "Jeremy", "Aaron", "Randy", "Howard", "Eugene", "Carlos", "Russell", "Bobby", "Victor", "Martin", "Ernest", "Phillip", "Todd", "Jesse", "Craig", "Alan", "Shawn", "Clarence", "Sean", "Philip", "Chris", "Johnny", "Earl", "Jimmy", "Antonio", "Danny", "Bryan", "Tony", "Luis", "Mike", "Stanley", "Leonard", "Nathan", "Dale", "Manuel", "Rodney", "Curtis", "Norman", "Allen", "Marvin", "Vincent", "Glenn", "Jeffery", "Travis", "Jeff", "Chad", "Jacob", "Lee", "Melvin", "Alfred", "Kyle", "Francis", "Bradley", "Jesus", "Herbert", "Frederick", "Ray", "Joel", "Edwin", "Don", "Eddie", "Ricky", "Troy", "Randall", "Barry", "Alexander", "Bernard", "Mario", "Leroy", "Francisco", "Marcus", "Micheal", "Theodore", "Clifford", "Miguel", "Oscar", "Jay", "Jim", "Tom", "Calvin", "Alex", "Jon", "Ronnie", "Bill", "Lloyd", "Tommy", "Leon", "Derek", "Warren", "Darrell", "Jerome", "Floyd", "Leo", "Alvin", "Tim", "Wesley", "Gordon", "Dean", "Greg", "Jorge", "Dustin", "Pedro", "Derrick", "Dan", "Lewis", "Zachary", "Corey", "Herman", "Maurice", "Vernon", "Roberto", "Clyde", "Glen", "Hector", "Shane", "Ricardo", "Sam", "Rick", "Lester", "Brent", "Ramon", "Charlie", "Tyler", "Gilbert", "Gene"}
									local firstnamecount = 1219
									if random_pseudo(0,2) ~= 1 then 	--female first name
										Temp_GlobalVariable.PlayerGender[playerIndexList] = 1
										firstname = firstname_female		--{"Mary", "Patricia", "Linda", "Barbara", "Elizabeth", "Jennifer", "Maria", "Susan", "Margaret", "Dorothy", "Lisa", "Nancy", "Karen", "Betty", "Helen", "Sandra", "Donna", "Carol", "Ruth", "Sharon", "Michelle", "Laura", "Sarah", "Kimberly", "Deborah", "Jessica", "Shirley", "Cynthia", "Angela", "Melissa", "Brenda", "Amy", "Anna", "Rebecca", "Virginia", "Kathleen", "Pamela", "Martha", "Debra", "Amanda", "Stephanie", "Carolyn", "Christine", "Marie", "Janet", "Catherine", "Frances", "Ann", "Joyce", "Diane", "Alice", "Julie", "Heather", "Teresa", "Doris", "Gloria", "Evelyn", "Jean", "Cheryl", "Mildred", "Katherine", "Joan", "Ashley", "Judith", "Rose", "Janice", "Kelly", "Nicole", "Judy", "Christina", "Kathy", "Theresa", "Beverly", "Denise", "Tammy", "Irene", "Jane", "Lori", "Rachel", "Marilyn", "Andrea", "Kathryn", "Louise", "Sara", "Anne", "Jacqueline", "Wanda", "Bonnie", "Julia", "Ruby", "Lois", "Tina", "Phyllis", "Norma", "Paula", "Diana", "Annie", "Lillian", "Emily", "Robin", "Peggy", "Crystal", "Gladys", "Rita", "Dawn", "Connie", "Florence", "Tracy", "Edna", "Tiffany", "Carmen", "Rosa", "Cindy", "Grace", "Wendy", "Victoria", "Edith", "Kim", "Sherry", "Sylvia", "Josephine", "Thelma", "Shannon", "Sheila", "Ethel", "Ellen", "Elaine", "Marjorie", "Carrie", "Charlotte", "Monica", "Esther", "Pauline", "Emma", "Juanita", "Anita", "Rhonda", "Hazel", "Amber", "Eva", "Debbie", "April", "Leslie", "Clara", "Lucille", "Jamie", "Joanne", "Eleanor", "Valerie", "Danielle", "Megan", "Alicia", "Suzanne", "Michele", "Gail", "Bertha", "Darlene", "Veronica", "Jill", "Erin", "Geraldine", "Lauren", "Cathy", "Joann", "Lorraine", "Lynn", "Sally", "Regina", "Erica", "Beatrice", "Dolores", "Bernice", "Audrey", "Yvonne", "Annette", "June", "Samantha", "Marion", "Dana", "Stacy", "Ana", "Renee", "Ida", "Vivian", "Roberta", "Holly", "Brittany", "Melanie", "Loretta", "Yolanda", "Jeanette", "Laurie", "Katie", "Kristen", "Vanessa", "Alma", "Sue", "Elsie", "Beth", "Jeanne"}
										firstnamecount = 3319
									end
									--local firstnamecount = Table_CountElements(firstname)
									local firstnameindexlist = random_pseudo(1,firstnamecount)
									--200 most popular names, reference: http://names.mongabay.com/most_common_surnames.htm
									local personname = surname_total		--{"Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell", "Murphy", "Bailey", "Rivera", "Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres", "Peterson", "Gray", "Ramirez", "James", "Watson", "Brooks", "Kelly", "Sanders", "Price", "Bennett", "Wood", "Barnes", "Ross", "Henderson", "Coleman", "Jenkins", "Perry", "Powell", "Long", "Patterson", "Hughes", "Flores", "Washington", "Butler", "Simmons", "Foster", "Gonzales", "Bryant", "Alexander", "Russell", "Griffin", "Diaz", "Hayes", "Myers", "Ford", "Hamilton", "Graham", "Sullivan", "Wallace", "Woods", "Cole", "West", "Jordan", "Owens", "Reynolds", "Fisher", "Ellis", "Harrison", "Gibson", "Mcdonald", "Cruz", "Marshall", "Ortiz", "Gomez", "Murray", "Freeman", "Wells", "Webb", "Simpson", "Stevens", "Tucker", "Porter", "Hunter", "Hicks", "Crawford", "Henry", "Boyd", "Mason", "Morales", "Kennedy", "Warren", "Dixon", "Ramos", "Reyes", "Burns", "Gordon", "Shaw", "Holmes", "Rice", "Robertson", "Hunt", "Black", "Daniels", "Palmer", "Mills", "Nichols", "Grant", "Knight", "Ferguson", "Rose", "Stone", "Hawkins", "Dunn", "Perkins", "Hudson", "Spencer", "Gardner", "Stephens", "Payne", "Pierce", "Berry", "Matthews", "Arnold", "Wagner", "Willis", "Ray", "Watkins", "Olson", "Carroll", "Duncan", "Snyder", "Hart", "Cunningham", "Bradley", "Lane", "Andrews", "Ruiz", "Harper", "Fox", "Riley", "Armstrong", "Carpenter", "Weaver", "Greene", "Lawrence", "Elliott", "Chavez", "Sims", "Austin", "Peters", "Kelley", "Franklin", "Lawson"}
									local namecount = 2276		--Table_CountElements(personname)
									local nameindexlist = random_pseudo(1,namecount)
									CPULODList[playerIndexList] = ""..firstname[firstnameindexlist].." "..personname[nameindexlist]
									print("Name set for player index "..playerIndex..": "..CPULODList[playerIndexList])
								else		--default CPU name
									CPULODList[playerIndexList] = "CPU " .. cpu
								end
								Player_SetPlayerName(playerIndex, CPULODList[playerIndexList])
								cpu = cpu + 1
							else
								CPULODList[playerIndexList] = "Player " .. player       --Player_GetName(playerIndex)	doesn't work! It can be only used for ATI functions
								player = player + 1
								--if playerIndex == Universe_CurrentPlayer() then
								--	Player_SetPlayerNameAdvanced(playerIndex, PlayerSetup.chatname)
								--end
							end
							PlayerBlockNameList[playerIndexList] = 1
						end
					end
	
  ---unit cap
	        if unitcapsrank == 4 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank4") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank4")
						end  
					elseif unitcapsrank == 3 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank3") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank3")
						end 
					elseif unitcapsrank == 2 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank2") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank2")
						end   
					elseif unitcapsrank == 1 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank1") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank1")
						end  					              
					end  
	
	---anti rad x AI
					--if Player_HasResearch(playerIndex, "isai" ) == 1 then
					  --if Player_CanResearch(playerIndex, "nebula" ) == 1 then
							--Player_GrantResearchOption(playerIndex, "nebula")
						--end	
						--if SobGroup_GetHardPointHealth("supporter"..playerIndex, "nebula") == 0 then
							--SobGroup_CreateSubSystem("supporter"..playerIndex, "nebula")
						--end 
					--end	       
					
	---Cores
					--if SobGroup_Empty("star_sol") == 1 or Player_HasResearch(playerIndex, "isai" ) == 1 then        
						--Player_GrantResearchOption(playerIndex, "core_navigation_sub")
						--Player_GrantResearchOption(playerIndex, "core_harvest_sub")
						--Player_GrantResearchOption(playerIndex, "core_defense_sub")
						--Player_GrantResearchOption(playerIndex, "core_attack_sub")
						--Player_GrantResearchOption(playerIndex, "core_hyperspace_sub")
						--Player_GrantResearchOption(playerIndex, "core_build_sub")
						--Player_GrantResearchOption(playerIndex, "core_repair_sub")
						--Player_GrantResearchOption(playerIndex, "core_cloak_sub")         
					--end	      

	---AI	                    
					if military == 5 then
						military_list[playerIndexList] = 5
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military2")
						end  
					elseif military == 4 then
						military_list[playerIndexList] = 4
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military1")
						end 
					elseif military == 2 then
						military_list[playerIndexList] = 2
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military")
						end   
					elseif military == 1 then
						military_list[playerIndexList] = 1
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military0")
						end  
					--test, destroy AI     
					elseif military == 7 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military0")                       
						end 
						if playerIndex ~= 0 then
							SobGroup_TakeDamage("Player_Ships"..playerIndex, 1)  
						end                                  
					end  
        end					
      end
    end
    playerIndex = playerIndex + 1
  end      	  
end

function Player_SetPlayerNameAdvanced(playerIndex, name)
	Player_SetPlayerName(playerIndex, name)
	if name ~= " " or name ~= "" then
		CPULODList[playerIndex+1] = name
	end
end

---BUIL ON START---------------------------------------------------------------------------------------------------

function buildonstartextra()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then                    
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then                      
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")                  
          end      				
        else          
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartextra")      
end   

function buildonstartfleet()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then   
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_mothership"..playerIndex, "hgn_power_ms")  
            SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")   						
          end 			         
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule")  		                
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")		                       
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")   
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")  						
          end     					
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          Player_GrantResearchOption(playerIndex , "Crew1")          			
          Player_GrantResearchOption(playerIndex , "Officer1")    
          if SobGroup_Count("vgr_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("vgr_mothership"..playerIndex, "vgr_power_ms")             		                  
          end 	 					
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartfleet")      
end   

function buildonstartempire()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then                   
					if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_mothership"..playerIndex, "hgn_power_ms") 
            SobGroup_CreateSubSystem_OnStart("hgn_mothership"..playerIndex, "hgn_power_ms1") 
            SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")          
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")
						--SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_hyperspacestation")  						
          end 
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule")  
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule1")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule2")
		        --SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule3")
            --SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule4")	
            --SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule5")				        
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule1")	
		        --SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule2")		
		        --SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule3")	  
		        --SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule4")	        
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")              
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")   
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")  						
          end      					
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")      
          Player_GrantResearchOption(playerIndex , "Crew1")					
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          --Player_GrantResearchOption(playerIndex , "Crew4")     
          --Player_GrantResearchOption(playerIndex , "Crew5")     
          --Player_GrantResearchOption(playerIndex , "Crew6")          			
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					--Player_GrantResearchOption(playerIndex , "Officer3")	
          --Player_GrantResearchOption(playerIndex , "Officer4")
          --Player_GrantResearchOption(playerIndex , "Officer5")							
          if SobGroup_Count("vgr_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("vgr_mothership"..playerIndex, "vgr_power_ms")             		                  
          end 
          if SobGroup_Count("vgr_shipyard"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("vgr_shipyard"..playerIndex, "vgr_power_sy")             		                  
          end			 					
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartempire")  	  
end  

function buildonstartmap()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then
				
				  --solar system
				  if SobGroup_Empty("star_sol") == 0 then 
						if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then   
              if SobGroup_Count("hgn_battlestation"..playerIndex) == 0 then	 --serve x start test					
								SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_battlestation")   
              end								
						end  
					end	
					
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartmap")    
end   

function buildonstarttest()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then 
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")           
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")          
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_hyperspacestation")              
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_ionturret")      
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_missileturret")      
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_rts")                
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_defensefieldturret")           
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_probe")    
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_proximitysensor")    
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_ecmprobe")          				
          end  				   
          if SobGroup_Count("hgn_commandfortress"..playerIndex) >= 1 then        					
						SobGroup_CreateShip("hgn_commandfortress"..playerIndex, "hgn_drone")    
					end	
					if SobGroup_Count("hgn_tanker"..playerIndex) >= 1 then   
						SobGroup_CreateShip("hgn_tanker"..playerIndex, "hgn_patcher")
					end	
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then 
            SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule")  
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule1")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule2")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule3")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule4")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_PilotModule5")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule1")	
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule2")		
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule3")	  
		        SobGroup_CreateSubSystem_OnStart("hgn_crewstation"..playerIndex, "Hgn_OfficerModule4")	        
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")                          
          end 
          if SobGroup_Count("hgn_scaver"..playerIndex) >= 1 then 
          	SobGroup_CreateShip("hgn_scaver"..playerIndex, "Hgn_massiveturret") 
          end             					
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")          
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")          
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then      
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
        elseif ( Player_GetRace(playerIndex) == Race_Raider ) then      
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
				elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then      
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
        end
      end
    end
    playerIndex = playerIndex + 1
  end      
  Rule_Remove("buildonstarttest")  	  
end  

function buildonresstart7000()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then   
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_mothership"..playerIndex, "supplyms")	            			
          end 
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          Player_GrantResearchOption(playerIndex , "resource1")                
        --elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
        --  Player_GrantResearchOption(playerIndex , "resource1")
        --elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
        --  Player_GrantResearchOption(playerIndex , "resource1")
        end
      end
    end
    playerIndex = playerIndex + 1
  end
  --if ((year==0 and gametime<45) or year>0) then  
  Rule_Remove("buildonresstart7000")   	  
  --end  
end 

function buildonresstart11000()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then   
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_mothership"..playerIndex, "supplyms")		            
          end 
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem_OnStart("hgn_mothership"..playerIndex, "supplyms1")		            
          end 
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          Player_GrantResearchOption(playerIndex , "resource1")       
        --elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
        --  Player_GrantResearchOption(playerIndex , "resource1")
        --elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
        --  Player_GrantResearchOption(playerIndex , "resource1")  
        end
      end
    end
    playerIndex = playerIndex + 1
  end
  --if ((year==0 and gametime<45) or year>0) then  
  Rule_Remove("buildonresstart11000")   	  
  --end  
end                   

---Messaggi---------------------------------------------------

function togliprioritamessaggio()  
  prioritamessaggio[Universe_CurrentPlayer() + 1] = 0
  Rule_Remove("togliprioritamessaggio")
end

---Auto Repair e Docking------------------------------------------------

function autorepair()
	--if 1==1 then
		--return 0
	--end
	--print("autorepair - Start")

---fighter
  for z = 1,6,1 do
	  for i = 0,nfi[z]-1,1 do  	 		  
	    if SobGroup_Empty("splitfighters"..(z-1) .. tostring(i)) == 0	then         
		    if SobGroup_GetTactics("splitfighters"..(z-1) .. tostring(i)) == 2 then  	
		      if SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i)) <= 0.53 then	      
		        if SobGroup_IsDoingAbility("splitfighters"..(z-1) .. tostring(i), abilityList[9]) == 0 and 
		        SobGroup_IsDocked("splitfighters"..(z-1) .. tostring(i)) == 0 and 
		        SobGroup_AreAllInRealSpace("splitfighters"..(z-1) .. tostring(i))==1 then
		        	SobGroup_Clear("temp")
		        	local d=15000
		        	if SobGroup_FillProximitySobGroupExceptSelf("temp", "fcdocker"..SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "splitfighters"..(z-1) .. tostring(i), d) == 1 then
			        	SobGroup_Create("temp_passivedocktartet")
			        	SobGroup_SobGroupAdd("temp_passivedocktartet", "temp")
			        	local dist=d
			        	local numships = SobGroup_SplitGroupReference("SinglePassiveAutoDock_SOB", "temp", "Player_Ships"..SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), SobGroup_Count("temp"))
								for counter = 0, numships - 1, 1 do
									if SobGroup_GetDistanceToSobGroup("splitfighters"..(z-1) .. tostring(i), "SinglePassiveAutoDock_SOB"..counter) < dist then
				          	if SobGroup_IsDoingAbility("SinglePassiveAutoDock_SOB"..counter, AB_Dock) == 0 and 
				          	SobGroup_HealthPercentage("SinglePassiveAutoDock_SOB"..counter) > 0 and 
						      	SobGroup_IsDoingAbility("SinglePassiveAutoDock_SOB"..counter, AB_Hyperspace) == 0 and 
						      	SobGroup_IsDoingAbility("SinglePassiveAutoDock_SOB"..counter, AB_HyperspaceViaGate) == 0 and 
						      	SobGroup_IsDocked("SinglePassiveAutoDock_SOB"..counter) == 0 and 
						      	SobGroup_AreAllInRealSpace("SinglePassiveAutoDock_SOB"..counter)==1 then 
						      		SobGroup_Clear("temp_passivedocktartet")
						      		SobGroup_SobGroupAdd("temp_passivedocktartet", "SinglePassiveAutoDock_SOB"..counter)
						      		dist=SobGroup_GetDistanceToSobGroup("splitfighters"..(z-1) .. tostring(i), "SinglePassiveAutoDock_SOB"..counter)
				            end
				          end
						    end
						    SobGroup_DockSobGroup_Smart("splitfighters"..(z-1) .. tostring(i), "temp_passivedocktartet")
						  end
		        end	
		  	  end 							  			 
				end	
	---docking repair				
				if SobGroup_IsDocked("splitfighters"..(z-1) .. tostring(i)) == 1 then
				  if Player_HasResearch(SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "CapitalDockingUpgrade3") == 1 then
				    local health = SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i))+0.5
				    if health < 1 then
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "CapitalDockingUpgrade2") == 1 then  
				    local health = SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i))+0.3
				    if health < 1 then
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "CapitalDockingUpgrade1") == 1 then 
				    local health = SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i))+0.15
				    if health < 1 then
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), 1)
				    end   
				  else
				  end
				end  
						
			end		 
		end	            
	end 

---corvette
  for z = 1,6,1 do
	  for i = 0,nco[z]-1,1 do  	 		  
	    if SobGroup_Empty("splitcorvettes"..(z-1) .. tostring(i)) == 0	then          
		    if SobGroup_GetTactics("splitcorvettes"..(z-1) .. tostring(i)) == 2 then  	
		      if SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i)) <= 0.52 then	 
		        if SobGroup_IsDoingAbility("splitcorvettes"..(z-1) .. tostring(i), abilityList[9]) == 0 and 
		        SobGroup_IsDocked("splitcorvettes"..(z-1) .. tostring(i)) == 0 and 
		        SobGroup_AreAllInRealSpace("splitcorvettes"..(z-1) .. tostring(i))==1 then
		        	SobGroup_Clear("temp")
		        	local d=15000
		        	if SobGroup_FillProximitySobGroupExceptSelf("temp", "fcdocker"..SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "splitcorvettes"..(z-1) .. tostring(i), d) == 1 then
			        	SobGroup_Create("temp_passivedocktartet")
			        	SobGroup_SobGroupAdd("temp_passivedocktartet", "temp")
			        	local dist=d
			        	local numships = SobGroup_SplitGroupReference("SinglePassiveAutoDockCorvette_SOB", "temp", "Player_Ships"..SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), SobGroup_Count("temp"))
								for counter = 0, numships - 1, 1 do
									if SobGroup_GetDistanceToSobGroup("splitcorvettes"..(z-1) .. tostring(i), "SinglePassiveAutoDockCorvette_SOB"..counter) < dist then
				          	if SobGroup_IsDoingAbility("SinglePassiveAutoDockCorvette_SOB"..counter, AB_Dock) == 0 and 
				          	SobGroup_HealthPercentage("SinglePassiveAutoDockCorvette_SOB"..counter) > 0 and 
						      	SobGroup_IsDoingAbility("SinglePassiveAutoDockCorvette_SOB"..counter, AB_Hyperspace) == 0 and 
						      	SobGroup_IsDoingAbility("SinglePassiveAutoDockCorvette_SOB"..counter, AB_HyperspaceViaGate) == 0 and 
						      	SobGroup_IsDocked("SinglePassiveAutoDockCorvette_SOB"..counter) == 0 and 
						      	SobGroup_AreAllInRealSpace("SinglePassiveAutoDockCorvette_SOB"..counter)==1 then 
						      		SobGroup_Clear("temp_passivedocktartet")
						      		SobGroup_SobGroupAdd("temp_passivedocktartet", "SinglePassiveAutoDockCorvette_SOB"..counter)
						      		dist=SobGroup_GetDistanceToSobGroup("splitcorvettes"..(z-1) .. tostring(i), "SinglePassiveAutoDockCorvette_SOB"..counter)
				            end
				          end
						    end
						    SobGroup_DockSobGroup_Smart("splitcorvettes"..(z-1) .. tostring(i), "temp_passivedocktartet")
						  end
		        end  
	        end   		                 			    	  	     			 
				end		
	---docking repair				
				if SobGroup_IsDocked("splitcorvettes"..(z-1) .. tostring(i)) == 1 then
				  if Player_HasResearch(SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "CapitalDockingUpgrade3") == 1 then
				    local health = SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i))+0.5
				    if health < 1 then
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "CapitalDockingUpgrade2") == 1 then  
				    local health = SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i))+0.3
				    if health < 1 then
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "CapitalDockingUpgrade1") == 1 then 
				    local health = SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i))+0.15
				    if health < 1 then
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), 1)
				    end   
				  else
				  end
				end  
							
			end		             
		end 
	end	
	
---frigates
  for i = 0,nf-1,1 do  	 		  
    if SobGroup_Empty("splitfrigates"..i) == 0	then           
	---docking repair				
			if SobGroup_IsDocked("splitfrigates"..i) == 1 then
			  if Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "CapitalDockingUpgrade3") == 1 then
			    local health = SobGroup_HealthPercentage("splitfrigates"..i)+0.3
			    if health < 1 then
			      SobGroup_SetHealth("splitfrigates"..i, health)
			    else  
			      SobGroup_SetHealth("splitfrigates"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "CapitalDockingUpgrade2") == 1 then  
			    local health = SobGroup_HealthPercentage("splitfrigates"..i)+0.2
			    if health < 1 then
			      SobGroup_SetHealth("splitfrigates"..i, health)
			    else  
			      SobGroup_SetHealth("splitfrigates"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "CapitalDockingUpgrade1") == 1 then 
			    local health = SobGroup_HealthPercentage("splitfrigates"..i)+0.1
			    if health < 1 then
			      SobGroup_SetHealth("splitfrigates"..i, health)
			    else  
			      SobGroup_SetHealth("splitfrigates"..i, 1)
			    end   
			  else
			  end
			end      
		end		             
	end  	
	
---destroyers
  for i = 0,nd-1,1 do  	 		  
    if SobGroup_Empty("splitdestroyers"..i) == 0	then           
	---docking repair				
			if SobGroup_IsDocked("splitdestroyers"..i) == 1 then
			  if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalDockingUpgrade3") == 1 then
			    local health = SobGroup_HealthPercentage("splitdestroyers"..i)+0.15
			    if health < 1 then
			      SobGroup_SetHealth("splitdestroyers"..i, health)
			    else  
			      SobGroup_SetHealth("splitdestroyers"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalDockingUpgrade2") == 1 then  
			    local health = SobGroup_HealthPercentage("splitdestroyers"..i)+0.1
			    if health < 1 then
			      SobGroup_SetHealth("splitdestroyers"..i, health)
			    else  
			      SobGroup_SetHealth("splitdestroyers"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalDockingUpgrade1") == 1 then 
			    local health = SobGroup_HealthPercentage("splitdestroyers"..i)+0.05
			    if health < 1 then
			      SobGroup_SetHealth("splitdestroyers"..i, health)
			    else  
			      SobGroup_SetHealth("splitdestroyers"..i, 1)
			    end   
			  else
			  end
			end      
		end		             
	end  		

---battlecruisers
  if nbc > 0 then
	  for i = 0,nbc-1,1 do
	    if SobGroup_Empty("splitbattlecruisers"..i) == 0 then
		---docking repair
	    	if SobGroup_IsDocked("splitbattlecruisers"..i) == 1 then
				  if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "CapitalDockingUpgrade3") == 1 then
				    local health = SobGroup_HealthPercentage("splitbattlecruisers"..i)+0.15
				    if health < 1 then
				      SobGroup_SetHealth("splitbattlecruisers"..i, health)
				    else  
				      SobGroup_SetHealth("splitbattlecruisers"..i, 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "CapitalDockingUpgrade2") == 1 then  
				    local health = SobGroup_HealthPercentage("splitbattlecruisers"..i)+0.1
				    if health < 1 then
				      SobGroup_SetHealth("splitbattlecruisers"..i, health)
				    else  
				      SobGroup_SetHealth("splitbattlecruisers"..i, 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "CapitalDockingUpgrade1") == 1 then 
				    local health = SobGroup_HealthPercentage("splitbattlecruisers"..i)+0.05
				    if health < 1 then
				      SobGroup_SetHealth("splitbattlecruisers"..i, health)
				    else  
				      SobGroup_SetHealth("splitbattlecruisers"..i, 1)
				    end   
				  else
				  end
	    	end
	    end
	  end
	end

---platforms
  if np > 0 then
	  for i = 0,np-1,1 do
	    if SobGroup_Empty("splitplatforms"..i) == 0 then
		---docking repair
	    	if SobGroup_IsDocked("splitplatforms"..i) == 1 then
				  if Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "CapitalDockingUpgrade3") == 1 then
				    local health = SobGroup_HealthPercentage("splitplatforms"..i)+0.3
				    if health < 1 then
				      SobGroup_SetHealth("splitplatforms"..i, health)
				    else  
				      SobGroup_SetHealth("splitplatforms"..i, 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "CapitalDockingUpgrade2") == 1 then  
				    local health = SobGroup_HealthPercentage("splitplatforms"..i)+0.2
				    if health < 1 then
				      SobGroup_SetHealth("splitplatforms"..i, health)
				    else  
				      SobGroup_SetHealth("splitplatforms"..i, 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "CapitalDockingUpgrade1") == 1 then 
				    local health = SobGroup_HealthPercentage("splitplatforms"..i)+0.1
				    if health < 1 then
				      SobGroup_SetHealth("splitplatforms"..i, health)
				    else  
				      SobGroup_SetHealth("splitplatforms"..i, 1)
				    end   
				  else
				  end
	    	end
	    end
	  end
	end

---collectors
  for i = 0,nrc-1,1 do  	 		  
    if SobGroup_Empty("splitresourcecollectors"..i) == 0	then           
	    if SobGroup_GetTactics("splitresourcecollectors"..i) == 2 then  	
	      if SobGroup_HealthPercentage("splitresourcecollectors"..i) <= 0.51 then	 
	        if SobGroup_IsDoingAbility("splitresourcecollectors"..i, abilityList[9]) == 0 then    	        
	          SobGroup_Clear("temp")
	          if SobGroup_FillProximitySobGroup("temp", "cdocker"..SobGroup_OwnedBy("splitresourcecollectors"..i), "splitresourcecollectors"..i, 10000) == 1 then			
	            SobGroup_DockSobGroup_Smart("splitresourcecollectors"..i, "temp")           
			      end					       
	        end  
        end   		             						  			 
			end	
		end		             
	end  
	 
	--print("autorepair - End")
end

---Disable------------------------------------------------------------

function SobGroup_Enable(Group, value)
  for i = 1,28,1 do
    SobGroup_AbilityActivate(Group, abilityList[i], value)
  end
end

---RU Update

function RUUpdate()  
---setta RU Max x tutti i giocatori  
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then      
        playerIndexList = playerIndex + 1 
        
        if ((year==0 and gametime<45) or year>0) then
	        RUList[playerIndexList] = Player_GetRU(playerIndex)
	        if RUList[playerIndexList] >= RUMaxCapacityList[playerIndexList] then
	          Player_SetRU(playerIndex, RUMaxCapacityList[playerIndexList])	
	        end 
	      end             
        	                       
      end
    end
    playerIndex = playerIndex + 1
  end    
end  

function RUUpdate1()  
  if ((year==0 and gametime<45) or year>0) then
	  UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
  end
end  

---Battle Arena-----------------------------------------------------------

function battlearenagm()
 
---crea presenza del giocatore, usato da pi?fasi 
  local presenza0 = 0
  local presenza1 = 0  
  if battlearena[1] >=  200 then
	  for i = 0,npsa[1]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships0" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships0" .. tostring(i), "ba, splitter, supporter, hgn_resourcecollector, vgr_resourcecollector") == 0 then
				  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships0" .. tostring(i), "ba0", 17000) == 1 then
				    presenza0 = presenza0 + 1
				  end				  
				end 
		  end  
		end 		
		for i = 0,npsa[2]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships1" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships1" .. tostring(i), "ba, splitter, supporter, hgn_resourcecollector, vgr_resourcecollector") == 0 then
				  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships1" .. tostring(i), "ba1", 17000) == 1 then
				    presenza1 = presenza1 + 1
				  end				  
				end 
		  end  
		end  	 
	end    	    
   
---ricomincia daccapo  
  if battlearena[1] >= 321 then    
    battlearena[1] = 1

---tempo per lasciare l'arena  
  elseif battlearena[1] >= 261 then   
    --FX_StartEvent("ba", "ba")    
    SobGroup_SetHardPointHealth("supporter0", "ba", 1)
    SobGroup_SetHardPointHealth("supporter1", "ba", 1) 
    Subtitle_Add(Actor_FleetIntel,"Leave the Battle Arena",1.5)
    UI_SetTextLabelText("battlearena", "timeto", ""..(321-battlearena[1]).." seconds to leave the battle arena");
    UI_SetTextLabelText("battlearena", "timeto1", ""); 	
    UI_SetTextLabelText("battlearena", "p1punteggio1", ""..presenza0);
    UI_SetTextLabelText("battlearena", "p2punteggio1", ""..presenza1);	 	    		
    battlearena[1] = battlearena[1] + 1     
    Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
    SobGroup_Clear("temp")
    if presenza0 == 0 and presenza1 == 0 and battlearena[1] < 318 then
      battlearena[1] = 318
    end

---battaglia  
  elseif battlearena[1] >= 260 then    
    --FX_StartEvent("ba", "ba")     
    SobGroup_SetHardPointHealth("supporter0", "ba", 0)
    SobGroup_SetHardPointHealth("supporter1", "ba", 0)    
    UI_SetTextLabelText("battlearena", "timeto", "Battle started, prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");   
    UI_SetTextLabelText("battlearena", "timeto1", "RU, Build: OFF - Time: "..battlearena[5]); 
    UI_SetTextLabelText("battlearena", "p1punteggio1", ""..presenza0);
    UI_SetTextLabelText("battlearena", "p2punteggio1", ""..presenza1);	 	    		
    if presenza0 >= 1 and presenza1 == 0 then    
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
      UI_SetScreenEnabled("battlearenamsg", 1)		
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle won by Player 1");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: -"..(battlearena[2]/1000).." Honor");				
			UI_SetTextLabelText("battlearena", "p1punteggio", ""..battlearena[3]);           					
      Player_SetRU(0, Player_GetRU(0) + battlearena[2])
      honorbonus[1] = honorbonus[1] + (battlearena[2]/500)
      honorbonus[2] = honorbonus[2] - (battlearena[2]/1000)      
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1
      battlearena[3] = battlearena[3] + 1   
      battlearena[6] = 1 
    elseif presenza0 == 0 and presenza1 >= 1 then
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")		
      UI_SetScreenEnabled("battlearenamsg", 1)
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle won by Player 2");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: -"..(battlearena[2]/1000).." Honor");		
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");			
      UI_SetTextLabelText("battlearena", "p2punteggio", ""..battlearena[4]);      
      Player_SetRU(1, Player_GetRU(1) + battlearena[2]) 
      honorbonus[2] = honorbonus[2] + (battlearena[2]/500)
      honorbonus[1] = honorbonus[1] - (battlearena[2]/1000)        
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1
      battlearena[4] = battlearena[4] + 1  
      battlearena[6] = 2        
    elseif presenza0 == 0 and presenza1 == 0 then 
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")	
      UI_SetScreenEnabled("battlearenamsg", 1)
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle not assigned, prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: -"..(battlearena[2]/1000).." Honor");
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: -"..(battlearena[2]/1000).." Honor");			
      honorbonus[2] = honorbonus[2] - (battlearena[2]/1000)
      honorbonus[1] = honorbonus[1] - (battlearena[2]/1000)        
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1       
      battlearena[6] = 0    
    elseif battlearena[5] <= 0 then      
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
      UI_SetScreenEnabled("battlearenamsg", 1)
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle not assigned, prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: -"..(battlearena[2]/1000).." Honor");
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: -"..(battlearena[2]/1000).." Honor");		
      honorbonus[2] = honorbonus[2] - (battlearena[2]/1000)
      honorbonus[1] = honorbonus[1] - (battlearena[2]/1000)       
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1     
      battlearena[6] = 0 	                  
    else                  
    end 
    battlearena[5] = battlearena[5] - 1

---tempo per raggiungere l'arena      
  elseif battlearena[1] >= 200 then  
    --FX_StartEvent("ba", "ba") 
    Subtitle_Add(Actor_FleetIntel,"Reach the Battle Arena",1.5)  	            	           	                      
    UI_SetTextLabelText("battlearena", "timeto", ""..(260-battlearena[1]).." seconds to reach the battle arena"); 
    UI_SetTextLabelText("battlearena", "timeto1", "");   
    UI_SetTextLabelText("battlearena", "p1punteggio1", ""..presenza0);
    UI_SetTextLabelText("battlearena", "p2punteggio1", ""..presenza1);	 	    		
    battlearena[1] = battlearena[1] + 1     
    Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena") 
    if presenza0 == 1 and presenza1 == 1 then
      battlearena[1] = 260
    end       
		if battlearena[1] >= 260 then	
		  battlearena[5] = 200				  
		end 	 

---fase di costruzione/produzione    
  else    
    if battlearena[1] == 1 then       
      UI_SetTextLabelText("battlearena", "p1", "Player 1");
      UI_SetTextLabelText("battlearena", "p1punteggio", ""..battlearena[3]);
      UI_SetTextLabelText("battlearena", "p2", "Player 2");
      UI_SetTextLabelText("battlearena", "p2punteggio", ""..battlearena[4]);      
    end        
    UI_SetTextLabelText("battlearena", "timeto", ""..(200-battlearena[1]).." seconds to the next battle");  
    UI_SetTextLabelText("battlearena", "timeto1", "Prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor"); 
    UI_SetTextLabelText("battlearena", "p1punteggio1", "");
    UI_SetTextLabelText("battlearena", "p2punteggio1", "");	 	    		 
    battlearena[1] = battlearena[1] + 1    
	--se c'?gente dentro l'arena distrugge     
    for i = 0,npsa[1]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships0" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships0" .. tostring(i), "ba, splitter, supporter") == 0 then	
					if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships0" .. tostring(i), "hgn_resourcecollector, vgr_resourcecollector") == 0 or battlearena[6] ~= 1 then			  
					  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships0" .. tostring(i), "ba0", 17000) == 1 then				    
					    SobGroup_TakeDamage("splitPlayer_Ships0" .. tostring(i), 0.1) 
					  end	
				  end				  
				end 
		  end  
		end 		
		for i = 0,npsa[2]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships1" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships1" .. tostring(i), "ba, splitter, supporter") == 0 then	
					if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships1" .. tostring(i), "hgn_resourcecollector, vgr_resourcecollector") == 0 or battlearena[6] ~= 2 then			  
					  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships1" .. tostring(i), "ba1", 17000) == 1 then				    
					    SobGroup_TakeDamage("splitPlayer_Ships1" .. tostring(i), 0.1) 
					  end	
				  end				  
				end 
		  end  
		end  	       
  end  
end  

--2276
surname_total = {"Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson", "Clark", "Rodriguez", "Lewis", "Lee", "Walker", "Hall", "Allen", "Young", "Hernandez", "King", "Wright", "Lopez", "Hill", "Scott", "Green", "Adams", "Baker", "Gonzalez", "Nelson", "Carter", "Mitchell", "Perez", "Roberts", "Turner", "Phillips", "Campbell", "Parker", "Evans", "Edwards", "Collins", "Stewart", "Sanchez", "Morris", "Rogers", "Reed", "Cook", "Morgan", "Bell", "Murphy", "Bailey", "Rivera", "Cooper", "Richardson", "Cox", "Howard", "Ward", "Torres", "Peterson", "Gray", "Ramirez", "James", "Watson", "Brooks", "Kelly", "Sanders", "Price", "Bennett", "Wood", "Barnes", "Ross", "Henderson", "Coleman", "Jenkins", "Perry", "Powell", "Long", "Patterson", "Hughes", "Flores", "Washington", "Butler", "Simmons", "Foster", "Gonzales", "Bryant", "Alexander", "Russell", "Griffin", "Diaz", "Hayes", "Myers", "Ford", "Hamilton", "Graham", "Sullivan", "Wallace", "Woods", "Cole", "West", "Jordan", "Owens", "Reynolds", "Fisher", "Ellis", "Harrison", "Gibson", "Mcdonald", "Cruz", "Marshall", "Ortiz", "Gomez", "Murray", "Freeman", "Wells", "Webb", "Simpson", "Stevens", "Tucker", "Porter", "Hunter", "Hicks", "Crawford", "Henry", "Boyd", "Mason", "Morales", "Kennedy", "Warren", "Dixon", "Ramos", "Reyes", "Burns", "Gordon", "Shaw", "Holmes", "Rice", "Robertson", "Hunt", "Black", "Daniels", "Palmer", "Mills", "Nichols", "Grant", "Knight", "Ferguson", "Rose", "Stone", "Hawkins", "Dunn", "Perkins", "Hudson", "Spencer", "Gardner", "Stephens", "Payne", "Pierce", "Berry", "Matthews", "Arnold", "Wagner", "Willis", "Ray", "Watkins", "Olson", "Carroll", "Duncan", "Snyder", "Hart", "Cunningham", "Bradley", "Lane", "Andrews", "Ruiz", "Harper", "Fox", "Riley", "Armstrong", "Carpenter", "Weaver", "Greene", "Lawrence", "Elliott", "Chavez", "Sims", "Austin", "Peters", "Kelley", "Franklin", "Lawson", "Fields", "Gutierrez", "Ryan", "Schmidt", "Carr", "Vasquez", "Castillo", "Wheeler", "Chapman", "Oliver", "Montgomery", "Richards", "Williamson", "Johnston", "Banks", "Meyer", "Bishop", "Mccoy", "Howell", "Alvarez", "Morrison", "Hansen", "Fernandez", "Garza", "Harvey", "Little", "Burton", "Stanley", "Nguyen", "George", "Jacobs", "Reid", "Kim", "Fuller", "Lynch", "Dean", "Gilbert", "Garrett", "Romero", "Welch", "Larson", "Frazier", "Burke", "Hanson", "Day", "Mendoza", "Moreno", "Bowman", "Medina", "Fowler", "Brewer", "Hoffman", "Carlson", "Silva", "Pearson", "Holland", "Douglas", "Fleming", "Jensen", "Vargas", "Byrd", "Davidson", "Hopkins", "May", "Terry", "Herrera", "Wade", "Soto", "Walters", "Curtis", "Neal", "Caldwell", "Lowe", "Jennings", "Barnett", "Graves", "Jimenez", "Horton", "Shelton", "Barrett", "Obrien", "Castro", "Sutton", "Gregory", "Mckinney", "Lucas", "Miles", "Craig", "Rodriquez", "Chambers", "Holt", "Lambert", "Fletcher", "Watts", "Bates", "Hale", "Rhodes", "Pena", "Beck", "Newman", "Haynes", "Mcdaniel", "Mendez", "Bush", "Vaughn", "Parks", "Dawson", "Santiago", "Norris", "Hardy", "Love", "Steele", "Curry", "Powers", "Schultz", "Barker", "Guzman", "Page", "Munoz", "Ball", "Keller", "Chandler", "Weber", "Leonard", "Walsh", "Lyons", "Ramsey", "Wolfe", "Schneider", "Mullins", "Benson", "Sharp", "Bowen", "Daniel", "Barber", "Cummings", "Hines", "Baldwin", "Griffith", "Valdez", "Hubbard", "Salazar", "Reeves", "Warner", "Stevenson", "Burgess", "Santos", "Tate", "Cross", "Garner", "Mann", "Mack", "Moss", "Thornton", "Dennis", "Mcgee", "Farmer", "Delgado", "Aguilar", "Vega", "Glover", "Manning", "Cohen", "Harmon", "Rodgers", "Robbins", "Newton", "Todd", "Blair", "Higgins", "Ingram", "Reese", "Cannon", "Strickland", "Townsend", "Potter", "Goodwin", "Walton", "Rowe", "Hampton", "Ortega", "Patton", "Swanson", "Joseph", "Francis", "Goodman", "Maldonado", "Yates", "Becker", "Erickson", "Hodges", "Rios", "Conner", "Adkins", "Webster", "Norman", "Malone", "Hammond", "Flowers", "Cobb", "Moody", "Quinn", "Blake", "Maxwell", "Pope", "Floyd", "Osborne", "Paul", "Mccarthy", "Guerrero", "Lindsey", "Estrada", "Sandoval", "Gibbs", "Tyler", "Gross", "Fitzgerald", "Stokes", "Doyle", "Sherman", "Saunders", "Wise", "Colon", "Gill", "Alvarado", "Greer", "Padilla", "Simon", "Waters", "Nunez", "Ballard", "Schwartz", "Mcbride", "Houston", "Christensen", "Klein", "Pratt", "Briggs", "Parsons", "Mclaughlin", "Zimmerman", "French", "Buchanan", "Moran", "Copeland", "Roy", "Pittman", "Brady", "Mccormick", "Holloway", "Brock", "Poole", "Frank", "Logan", "Owen", "Bass", "Marsh", "Drake", "Wong", "Jefferson", "Park", "Morton", "Abbott", "Sparks", "Patrick", "Norton", "Huff", "Clayton", "Massey", "Lloyd", "Figueroa", "Carson", "Bowers", "Roberson", "Barton", "Tran", "Lamb", "Harrington", "Casey", "Boone", "Cortez", "Clarke", "Mathis", "Singleton", "Wilkins", "Cain", "Bryan", "Underwood", "Hogan", "Mckenzie", "Collier", "Luna", "Phelps", "Mcguire", "Allison", "Bridges", "Wilkerson", "Nash", "Summers", "Atkins", "Wilcox", "Pitts", "Conley", "Marquez", "Burnett", "Richard", "Cochran", "Chase", "Davenport", "Hood", "Gates", "Clay", "Ayala", "Sawyer", "Roman", "Vazquez", "Dickerson", "Hodge", "Acosta", "Flynn", "Espinoza", "Nicholson", "Monroe", "Wolf", "Morrow", "Kirk", "Randall", "Anthony", "Whitaker", "Oconnor", "Skinner", "Ware", "Molina", "Kirby", "Huffman", "Bradford", "Charles", "Gilmore", "Dominguez", "Oneal", "Bruce", "Lang", "Combs", "Kramer", "Heath", "Hancock", "Gallagher", "Gaines", "Shaffer", "Short", "Wiggins", "Mathews", "Mcclain", "Fischer", "Wall", "Small", "Melton", "Hensley", "Bond", "Dyer", "Cameron", "Grimes", "Contreras", "Christian", "Wyatt", "Baxter", "Snow", "Mosley", "Shepherd", "Larsen", "Hoover", "Beasley", "Glenn", "Petersen", "Whitehead", "Meyers", "Keith", "Garrison", "Vincent", "Shields", "Horn", "Savage", "Olsen", "Schroeder", "Hartman", "Woodard", "Mueller", "Kemp", "Deleon", "Booth", "Patel", "Calhoun", "Wiley", "Eaton", "Cline", "Navarro", "Harrell", "Lester", "Humphrey", "Parrish", "Duran", "Hutchinson", "Hess", "Dorsey", "Bullock", "Robles", "Beard", "Dalton", "Avila", "Vance", "Rich", "Blackwell", "York", "Johns", "Blankenship", "Trevino", "Salinas", "Campos", "Pruitt", "Moses", "Callahan", "Golden", "Montoya", "Hardin", "Guerra", "Mcdowell", "Carey", "Stafford", "Gallegos", "Henson", "Wilkinson", "Booker", "Merritt", "Miranda", "Atkinson", "Orr", "Decker", "Hobbs", "Preston", "Tanner", "Knox", "Pacheco", "Stephenson", "Glass", "Rojas", "Serrano", "Marks", "Hickman", "English", "Sweeney", "Strong", "Prince", "Mcclure", "Conway", "Walter", "Roth", "Maynard", "Farrell", "Lowery", "Hurst", "Nixon", "Weiss", "Trujillo", "Ellison", "Sloan", "Juarez", "Winters", "Mclean", "Randolph", "Leon", "Boyer", "Villarreal", "Mccall", "Gentry", "Carrillo", "Kent", "Ayers", "Lara", "Shannon", "Sexton", "Pace", "Hull", "Leblanc", "Browning", "Velasquez", "Leach", "Chang", "House", "Sellers", "Herring", "Noble", "Foley", "Bartlett", "Mercado", "Landry", "Durham", "Walls", "Barr", "Mckee", "Bauer", "Rivers", "Everett", "Bradshaw", "Pugh", "Velez", "Rush", "Estes", "Dodson", "Morse", "Sheppard", "Weeks", "Camacho", "Bean", "Barron", "Livingston", "Middleton", "Spears", "Branch", "Blevins", "Chen", "Kerr", "Mcconnell", "Hatfield", "Harding", "Ashley", "Solis", "Herman", "Frost", "Giles", "Blackburn", "William", "Pennington", "Woodward", "Finley", "Mcintosh", "Koch", "Best", "Solomon", "Mccullough", "Dudley", "Nolan", "Blanchard", "Rivas", "Brennan", "Mejia", "Kane", "Benton", "Joyce", "Buckley", "Haley", "Valentine", "Maddox", "Russo", "Mcknight", "Buck", "Moon", "Mcmillan", "Crosby", "Berg", "Dotson", "Mays", "Roach", "Church", "Chan", "Richmond", "Meadows", "Faulkner", "Oneill", "Knapp", "Kline", "Barry", "Ochoa", "Jacobson", "Gay", "Avery", "Hendricks", "Horne", "Shepard", "Hebert", "Cherry", "Cardenas", "Mcintyre", "Whitney", "Waller", "Holman", "Donaldson", "Cantu", "Terrell", "Morin", "Gillespie", "Fuentes", "Tillman", "Sanford", "Bentley", "Peck", "Key", "Salas", "Rollins", "Gamble", "Dickson", "Battle", "Santana", "Cabrera", "Cervantes", "Howe", "Hinton", "Hurley", "Spence", "Mora", "Yang", "Mcneil", "Suarez", "Case", "Petty", "Gould", "Mcfarland", "Sampson", "Carver", "Bray", "Rosario", "Macdonald", "Stout", "Hester", "Melendez", "Dillon", "Farley", "Hopper", "Galloway", "Potts", "Bernard", "Joyner", "Stein", "Aguirre", "Osborn", "Mercer", "Bender", "Franco", "Rowland", "Sykes", "Benjamin", "Travis", "Pickett", "Crane", "Sears", "Mayo", "Dunlap", "Hayden", "Wilder", "Mckay", "Coffey", "Mccarty", "Ewing", "Cooley", "Vaughan", "Bonner", "Cotton", "Holder", "Stark", "Ferrell", "Cantrell", "Fulton", "Lynn", "Lott", "Calderon", "Rosa", "Pollard", "Hooper", "Burch", "Mullen", "Fry", "Riddle", "Levy", "David", "Duke", "Odonnell", "Guy", "Michael", "Britt", "Frederick", "Daugherty", "Berger", "Dillard", "Alston", "Jarvis", "Frye", "Riggs", "Chaney", "Odom", "Duffy", "Fitzpatrick", "Valenzuela", "Merrill", "Mayer", "Alford", "Mcpherson", "Acevedo", "Donovan", "Barrera", "Albert", "Cote", "Reilly", "Compton", "Raymond", "Mooney", "Mcgowan", "Craft", "Cleveland", "Clemons", "Wynn", "Nielsen", "Baird", "Stanton", "Snider", "Rosales", "Bright", "Witt", "Stuart", "Hays", "Holden", "Rutledge", "Kinney", "Clements", "Castaneda", "Slater", "Hahn", "Emerson", "Conrad", "Burks", "Delaney", "Pate", "Lancaster", "Sweet", "Justice", "Tyson", "Sharpe", "Whitfield", "Talley", "Macias", "Irwin", "Burris", "Ratliff", "Mccray", "Madden", "Kaufman", "Beach", "Goff", "Cash", "Bolton", "Mcfadden", "Levine", "Good", "Byers", "Kirkland", "Kidd", "Workman", "Carney", "Dale", "Mcleod", "Holcomb", "England", "Finch", "Head", "Burt", "Hendrix", "Sosa", "Haney", "Franks", "Sargent", "Nieves", "Downs", "Rasmussen", "Bird", "Hewitt", "Lindsay", "Le", "Foreman", "Valencia", "Oneil", "Delacruz", "Vinson", "Dejesus", "Hyde", "Forbes", "Gilliam", "Guthrie", "Wooten", "Huber", "Barlow", "Boyle", "Mcmahon", "Buckner", "Rocha", "Puckett", "Langley", "Knowles", "Cooke", "Velazquez", "Whitley", "Noel", "Vang", "Aracelis", "Apryl", "Annett", "Alishia", "Veola", "Usha", "Toshiko", "Theola", "Tashia", "Talitha", "Shery", "Rudy", "Renetta", "Reiko", "Rasheeda", "Omega", "Obdulia", "Mika", "Melaine", "Meggan", "Martin", "Marlen", "Marget", "Marceline", "Mana", "Magdalen", "Librada", "Lezlie", "Lexie", "Latashia", "Lasandra", "Kelle", "Isidra", "Isa", "Inocencia", "Gwyn", "Francoise", "Erminia", "Erinn", "Dimple", "Devora", "Criselda", "Armanda", "Arie", "Ariane", "Angelo", "Angelena", "Allen", "Aliza", "Adriene", "Adaline", "Xochitl", "Twanna", "Tran", "Tomiko", "Tamisha", "Taisha", "Susy", "Siu", "Rutha", "Roxy", "Rhona", "Raymond", "Otha", "Noriko", "Natashia", "Merrie", "Melvin", "Marinda", "Mariko", "Margert", "Loris", "Lizzette", "Leisha", "Kaila", "Ka", "Joannie", "Jerrica", "Jene", "Jannet", "Janee", "Jacinda", "Herta", "Elenore", "Doretta", "Delaine", "Daniell", "Claudie", "China", "Britta", "Apolonia", "Amberly", "Alease", "Yuri", "Yuk", "Wen", "Waneta", "Ute", "Tomi", "Sharri", "Sandie", "Roselle", "Reynalda", "Raguel", "Phylicia", "Patria", "Olimpia", "Odelia", "Mitzie", "Mitchell", "Miss", "Minda", "Mignon", "Mica", "Mendy", "Marivel", "Maile", "Lynetta", "Lavette", "Lauryn", "Latrisha", "Lakiesha", "Kiersten", "Kary", "Josphine", "Jolyn", "Jetta", "Janise", "Jacquie", "Ivelisse", "Glynis", "Gianna", "Gaynelle", "Emerald", "Demetrius", "Danyell", "Danille", "Dacia", "Coralee", "Cher", "Ceola", "Brett", "Bell", "Arianne", "Aleshia", "Yung", "Williemae", "Troy", "Trinh", "Thora", "Tai", "Svetlana", "Sherika", "Shemeka", "Shaunda", "Roseline", "Ricki", "Melda", "Mallie", "Lavonna", "Latina", "Larry", "Laquanda", "Lala", "Lachelle", "Klara", "Kandis", "Johna", "Jeanmarie", "Jaye", "Hang", "Grayce", "Gertude", "Emerita", "Ebonie", "Clorinda", "Ching", "Chery", "Carola", "Breann", "Blossom", "Bernardine", "Becki", "Arletha", "Argelia", "Ara", "Alita", "Yulanda", "Yon", "Yessenia", "Tobi", "Tasia", "Sylvie", "Shirl", "Shirely", "Sheridan", "Shella", "Shantelle", "Sacha", "Royce", "Rebecka", "Reagan", "Providencia", "Paulene", "Misha", "Miki", "Marline", "Marica", "Lorita", "Latoyia", "Lasonya", "Kerstin", "Kenda", "Keitha", "Kathrin", "Jaymie", "Jack", "Gricelda", "Ginette", "Eryn", "Elina", "Elfrieda", "Danyel", "Cheree", "Chanelle", "Barrie", "Avery", "Aurore", "Annamaria", "Alleen", "Ailene", "Aide", "Yasmine", "Vashti", "Valentine", "Treasa", "Tory", "Tiffaney", "Sheryll", "Sharie", "Shanae", "Sau", "Raisa", "Pa", "Neda", "Mitsuko", "Mirella", "Milda", "Maryanna", "Maragret", "Mabelle", "Luetta", "Lorina", "Letisha", "Latarsha", "Lanelle", "Lajuana", "Krissy", "Karly", "Karena", "Jon", "Jessika", "Jerica", "Jeanelle", "January", "Jalisa", "Jacelyn", "Izola", "Ivey", "Gregory", "Euna", "Etha", "Drew", "Domitila", "Dominica", "Daina", "Creola", "Carli", "Camie", "Bunny", "Brittny", "Ashanti", "Anisha", "Aleen", "Adah", "Yasuko", "Winter", "Viki", "Valrie", "Tona", "Tinisha", "Thi", "Terisa", "Tatum", "Taneka", "Simonne", "Shalanda", "Serita", "Ressie", "Refugia", "Paz", "Olene", "Na", "Merrill", "Margherita", "Mandie", "Man", "Maire", "Lyndia", "Luci", "Lorriane", "Loreta", "Leonia", "Lavona", "Lashawnda", "Lakia", "Kyoko", "Krystina", "Krysten", "Kenia", "Kelsi", "Jude", "Jeanice", "Isobel", "Georgiann", "Genny", "Felicidad", "Eilene", "Deon", "Deloise", "Deedee", "Dannie", "Conception", "Clora", "Cherilyn", "Chang", "Calandra", "Berry", "Armandina", "Anisa", "Ula", "Timothy", "Tiera", "Theressa", "Stephania", "Sima", "Shyla", "Shonta", "Shera", "Shaquita", "Shala", "Sammy", "Rossana", "Nohemi", "Nery", "Moriah", "Melita", "Melida", "Melani", "Marylynn", "Marisha", "Mariette", "Malorie", "Madelene", "Ludivina", "Loria", "Lorette", "Loralee", "Lianne", "Leon", "Lavenia", "Laurinda", "Lashon", "Kit", "Kimi", "Keila", "Katelynn", "Kai", "Jone", "Joane", "Ji", "Jayna", "Janella", "Ja", "Hue", "Hertha", "Francene", "Elinore", "Despina", "Delsie", "Deedra", "Clemencia", "Carry", "Carolin", "Carlos", "Bulah", "Brittanie", "Bok", "Blondell", "Bibi", "Beaulah", "Beata", "Annita", "Agripina", "Virgen", "Valene", "Un", "Twanda", "Tommye", "Toi", "Tarra", "Tari", "Tammera", "Shakia", "Sadye", "Ruthanne", "Rochel", "Rivka", "Pura", "Nenita", "Natisha", "Ming", "Merrilee", "Melodee", "Marvis", "Lucilla", "Leena", "Laveta", "Larita", "Lanie", "Keren", "Ileen", "Georgeann", "Genna", "Genesis", "Frida", "Ewa", "Eufemia", "Emely", "Ela", "Edyth", "Deonna", "Deadra", "Darlena", "Chanell", "Chan", "Cathern", "Cassondra", "Cassaundra", "Bernarda", "Berna", "Arlinda", "Anamaria", "Albert", "Wesley", "Vertie", "Valeri", "Torri", "Tatyana", "Stasia", "Sherise", "Sherill", "Season", "Scottie", "Sanda", "Ruthe", "Rosy", "Roberto", "Robbi", "Ranee", "Quyen", "Pearly", "Palmira", "Onita", "Nisha", "Niesha", "Nida", "Nevada", "Nam", "Merlyn", "Mayola", "Marylouise", "Maryland", "Marx", "Marth", "Margene", "Madelaine", "Londa", "Leontine", "Leoma", "Leia", "Lawrence", "Lauralee", "Lanora", "Lakita", "Kiyoko", "Keturah", "Katelin", "Kareen", "Jonie", "Johnette", "Jenee", "Jeanett", "Izetta", "Hiedi", "Heike", "Hassie", "Harold", "Giuseppina", "Georgann", "Fidela", "Fernande", "Elwanda", "Ellamae", "Eliz", "Dusti", "Dotty", "Cyndy", "Coralie", "Celesta", "Argentina", "Alverta", "Xenia", "Wava", "Vanetta", "Torrie", "Tashina", "Tandy", "Tambra", "Tama", "Stepanie", "Shila", "Shaunta", "Sharan", "Shaniqua", "Shae", "Setsuko", "Serafina", "Sandee", "Rosamaria", "Priscila", "Olinda", "Nadene", "Muoi", "Michelina", "Mercedez", "Maryrose", "Marin", "Marcene", "Mao", "Magali", "Mafalda", "Logan", "Linn", "Lannie", "Kayce", "Karoline", "Kamilah", "Kamala", "Justa", "Joline", "Jennine", "Jacquetta", "Iraida", "Gerald", "Georgeanna", "Franchesca", "Fairy", "Emeline", "Elane", "Ehtel", "Earlie", "Dulcie", "Dalene", "Cris", "Classie", "Chere", "Charis", "Caroyln", "Carmina", "Carita", "Brian", "Bethanie", "Ayako", "Arica", "An", "Alysa", "Alessandra", "Akilah", "Adrien", "Zetta", "Youlanda", "Yelena", "Yahaira", "Xuan", "Wendolyn", "Victor", "Tijuana", "Terrell", "Terina", "Teresia", "Suzi", "Sunday", "Sherell", "Shavonda", "Shaunte", "Sharda", "Shakita", "Sena", "Ryann", "Rubi", "Riva", "Reginia", "Rea", "Rachal", "Parthenia", "Pamula", "Monnie", "Monet", "Michaele", "Melia", "Marine", "Malka", "Maisha", "Lisandra", "Leo", "Lekisha", "Lean", "Laurence", "Lakendra", "Krystin", "Kortney", "Kizzie", "Kittie", "Kera", "Kendal", "Kemberly", "Kanisha", "Julene", "Jule", "Joshua", "Johanne", "Jeffrey", "Jamee", "Han", "Halley", "Gidget", "Galina", "Fredricka", "Fleta", "Fatimah", "Eusebia", "Elza", "Eleonore", "Dorthey", "Doria", "Donella", "Dinorah", "Delorse", "Claretha", "Christinia", "Charlyn", "Bong", "Belkis", "Azzie", "Andera", "Aiko", "Adena", "Yer", "Yajaira", "Wan", "Vania", "Ulrike", "Toshia", "Tifany", "Stefany", "Shizue", "Shenika", "Shawanna", "Sharolyn", "Sharilyn", "Shaquana", "Shantay", "See", "Rozanne", "Roselee", "Rickie", "Remona", "Reanna", "Raelene", "Quinn", "Phung", "Petronila", "Natacha", "Nancey", "Myrl", "Miyoko", "Miesha", "Merideth", "Marvella", "Marquitta", "Marhta", "Marchelle", "Lizeth", "Libbie", "Lahoma", "Ladawn", "Kina", "Katheleen", "Katharyn", "Karisa", "Kaleigh", "Junie", "Julieann", "Johnsie", "Janean", "Jaimee", "Jackqueline", "Hisako", "Herma", "Helaine", "Gwyneth", "Glenn", "Gita", "Eustolia", "Emelina", "Elin", "Edris", "Donnette", "Donnetta", "Dierdre", "Denae", "Darcel", "Claude", "Clarisa", "Cinderella", "Chia", "Charlesetta", "Charita", "Celsa", "Cassy", "Cassi", "Carlee", "Bruna", "Brittaney", "Brande", "Billi", "Bao", "Antonetta", "Angla", "Angelyn", "Analisa", "Alane", "Wenona", "Wendie", "Veronique", "Vannesa", "Tobie", "Tempie", "Sumiko", "Sulema", "Sparkle", "Somer", "Sheba", "Shayne", "Sharice", "Shanel", "Shalon", "Sage", "Roy", "Rosio", "Roselia", "Renay", "Rema", "Reena", "Porsche", "Ping", "Peg", "Ozie", "Oretha", "Oralee", "Oda", "Nu", "Ngan", "Nakesha", "Milly", "Marybelle", "Marlin", "Maris", "Margrett", "Maragaret", "Manie", "Lurlene", "Lillia", "Lieselotte", "Lavelle", "Lashaunda", "Lakeesha", "Keith", "Kaycee", "Kalyn", "Joya", "Joette", "Jenae", "Janiece", "Illa", "Grisel", "Glayds", "Genevie", "Gala", "Fredda", "Fred", "Elmer", "Eleonor", "Debera", "Deandrea", "Dan", "Corrinne", "Cordia", "Contessa", "Colene", "Cleotilde", "Charlott", "Chantay", "Cecille", "Beatris", "Azalee", "Arlean", "Ardath", "Anjelica", "Anja", "Alfredia", "Aleisha", "Adam", "Zada", "Yuonne", "Xiao", "Willodean", "Whitley", "Vennie", "Vanna", "Tyisha", "Tova", "Torie", "Tonisha", "Tilda", "Tien", "Temple", "Sirena", "Sherril", "Shanti", "Shan", "Senaida", "Samella", "Robbyn", "Renda", "Reita", "Phebe", "Paulita", "Nobuko", "Nguyet", "Neomi", "Moon", "Mikaela", "Melania", "Maximina", "Marg", "Maisie", "Lynna", "Lilli", "Layne", "Lashaun", "Lakenya", "Lael", "Kirstie", "Kathline", "Kasha", "Karlyn", "Karima", "Jovan", "Josefine", "Jennell", "Jacqui", "Jackelyn", "Hyo", "Hien", "Grazyna", "Florrie", "Floria", "Eleonora", "Dwana", "Dorla", "Dong", "Delmy", "Deja", "Dede", "Dann", "Crysta", "Clelia", "Claris", "Clarence", "Chieko", "Cherlyn", "Cherelle", "Charmain", "Chara", "Cammy", "Bee", "Arnette", "Ardelle", "Annika", "Amiee", "Amee", "Allena", "Yvone", "Yuki", "Yoshie", "Yevette", "Yael", "Willetta", "Voncile", "Venetta", "Tula", "Tonette", "Timika", "Temika", "Telma", "Teisha", "Taren", "Ta", "Stacee", "Shin", "Shawnta", "Saturnina", "Ricarda", "Pok", "Pasty", "Onie", "Nubia", "Mora", "Mike", "Marielle", "Mariella", "Marianela", "Mardell", "Many", "Luanna", "Loise", "Lisabeth", "Lindsy", "Lilliana", "Lilliam", "Lelah", "Leigha", "Leanora", "Lang", "Kristeen", "Khalilah", "Keeley", "Kandra", "Junko", "Joaquina", "Jerlene", "Jani", "Jamika", "Jame", "Hsiu", "Hermila", "Golden", "Genevive", "Evia", "Eugena", "Emmaline", "Elfreda", "Elene", "Donette", "Delcie", "Deeanna", "Darcey", "Cuc", "Clarinda", "Cira", "Chae", "Celinda", "Catheryn", "Catherin", "Casimira", "Carmelia", "Camellia", "Breana", "Bobette", "Bernardina", "Bebe", "Basilia", "Arlyne", "Amal", "Alayna", "Zonia", "Zenia", "Yuriko", "Yaeko", "Wynell", "Willow", "Willena", "Vernia", "Tu", "Travis", "Tora", "Terrilyn", "Terica", "Tenesha", "Tawna", "Tajuana", "Taina", "Stephnie", "Sona", "Sol", "Sina", "Shondra", "Shizuko", "Sherlene", "Sherice", "Sharika", "Rossie", "Rosena", "Rory", "Rima", "Ria", "Rheba", "Renna", "Peter", "Natalya", "Nancee", "Melodi", "Meda", "Maxima", "Matha", "Marketta", "Maricruz", "Marcelene", "Malvina", "Luba", "Louetta", "Leida", "Lecia", "Lauran", "Lashawna", "Laine", "Khadijah", "Katerine", "Kasi", "Kallie", "Julietta", "Jesusita", "Jestine", "Jessia", "Jeremy", "Jeffie", "Janyce", "Isadora", "Georgianne", "Fidelia", "Evita", "Eura", "Eulah", "Estefana", "Elsy", "Elizabet", "Eladia", "Dodie", "Dion", "Dia", "Denisse", "Deloras", "Delila", "Daysi", "Dakota", "Curtis", "Crystle", "Concha", "Colby", "Claretta", "Chu", "Christia", "Charlsie", "Charlena", "Carylon", "Bettyann", "Asley", "Ashlea", "Amira", "Ai", "Agueda", "Agnus", "Yuette", "Vinita", "Victorina", "Tynisha", "Treena", "Toccara", "Tish", "Thomasena", "Tegan", "Soila", "Shiloh", "Shenna", "Sharmaine", "Shantae", "Shandi", "September", "Saran", "Sarai", "Sana", "Samuel", "Salley", "Rosette", "Rolande", "Regine", "Otelia", "Oscar", "Olevia", "Nicholle", "Necole", "Naida", "Myrta", "Myesha", "Mitsue", "Minta", "Mertie", "Margy", "Mahalia", "Madalene", "Love", "Loura", "Lorean", "Lewis", "Lesha", "Leonida", "Lenita", "Lavone", "Lashell", "Lashandra", "Lamonica", "Kimbra", "Katherina", "Karry", "Kanesha", "Julio", "Jong", "Jeneva", "Jaquelyn", "Hwa", "Gilma", "Ghislaine", "Gertrudis", "Fransisca", "Fermina", "Ettie", "Etsuko", "Ellis", "Ellan", "Elidia", "Edra", "Dorethea", "Doreatha", "Denyse", "Denny", "Deetta", "Daine", "Cyrstal", "Corrin", "Cayla", "Carlita", "Camila", "Burma", "Bula", "Buena", "Blake", "Barabara", "Avril", "Austin", "Alaine", "Zana", "Wilhemina", "Wanetta", "Virgil", "Vi", "Veronika", "Vernon", "Verline", "Vasiliki", "Tonita", "Tisa", "Teofila", "Tayna", "Taunya", "Tandra", "Takako", "Sunni", "Suanne", "Sixta", "Sharell", "Seema", "Russell", "Rosenda", "Robena", "Raymonde", "Pei", "Pamila", "Ozell", "Neida", "Neely", "Mistie", "Micha", "Merissa", "Maurita", "Maryln", "Maryetta", "Marshall", "Marcell", "Malena", "Makeda", "Maddie", "Lovetta", "Lourie", "Lorrine", "Lorilee", "Lester", "Laurena", "Lashay", "Larraine", "Laree", "Lacresha", "Kristle", "Krishna", "Keva", "Keira", "Karole", "Joie", "Jinny", "Jeannetta", "Jama", "Heidy", "Gilberte", "Gema", "Faviola", "Evelynn", "Enda", "Elli", "Ellena", "Divina", "Dagny", "Collene", "Codi", "Cindie", "Chassidy", "Chasidy", "Catrice", "Catherina", "Cassey", "Caroll", "Carlena", "Candra", "Calista", "Bryanna", "Britteny", "Beula", "Bari", "Audrie", "Audria", "Ardelia", "Annelle", "Angila", "Alona", "Allyn",
}

--1219
firstname_male = {"James", "John", "Robert", "Michael", "William", "David", "Richard", "Charles", "Joseph", "Thomas", "Christopher", "Daniel", "Paul", "Mark", "Donald", "George", "Kenneth", "Steven", "Edward", "Brian", "Ronald", "Anthony", "Kevin", "Jason", "Matthew", "Gary", "Timothy", "Jose", "Larry", "Jeffrey", "Frank", "Scott", "Eric", "Stephen", "Andrew", "Raymond", "Gregory", "Joshua", "Jerry", "Dennis", "Walter", "Patrick", "Peter", "Harold", "Douglas", "Henry", "Carl", "Arthur", "Ryan", "Roger", "Joe", "Juan", "Jack", "Albert", "Jonathan", "Justin", "Terry", "Gerald", "Keith", "Samuel", "Willie", "Ralph", "Lawrence", "Nicholas", "Roy", "Benjamin", "Bruce", "Brandon", "Adam", "Harry", "Fred", "Wayne", "Billy", "Steve", "Louis", "Jeremy", "Aaron", "Randy", "Howard", "Eugene", "Carlos", "Russell", "Bobby", "Victor", "Martin", "Ernest", "Phillip", "Todd", "Jesse", "Craig", "Alan", "Shawn", "Clarence", "Sean", "Philip", "Chris", "Johnny", "Earl", "Jimmy", "Antonio", "Danny", "Bryan", "Tony", "Luis", "Mike", "Stanley", "Leonard", "Nathan", "Dale", "Manuel", "Rodney", "Curtis", "Norman", "Allen", "Marvin", "Vincent", "Glenn", "Jeffery", "Travis", "Jeff", "Chad", "Jacob", "Lee", "Melvin", "Alfred", "Kyle", "Francis", "Bradley", "Jesus", "Herbert", "Frederick", "Ray", "Joel", "Edwin", "Don", "Eddie", "Ricky", "Troy", "Randall", "Barry", "Alexander", "Bernard", "Mario", "Leroy", "Francisco", "Marcus", "Micheal", "Theodore", "Clifford", "Miguel", "Oscar", "Jay", "Jim", "Tom", "Calvin", "Alex", "Jon", "Ronnie", "Bill", "Lloyd", "Tommy", "Leon", "Derek", "Warren", "Darrell", "Jerome", "Floyd", "Leo", "Alvin", "Tim", "Wesley", "Gordon", "Dean", "Greg", "Jorge", "Dustin", "Pedro", "Derrick", "Dan", "Lewis", "Zachary", "Corey", "Herman", "Maurice", "Vernon", "Roberto", "Clyde", "Glen", "Hector", "Shane", "Ricardo", "Sam", "Rick", "Lester", "Brent", "Ramon", "Charlie", "Tyler", "Gilbert", "Gene", "Marc", "Reginald", "Ruben", "Brett", "Angel", "Nathaniel", "Rafael", "Leslie", "Edgar", "Milton", "Raul", "Ben", "Chester", "Cecil", "Duane", "Franklin", "Andre", "Elmer", "Brad", "Gabriel", "Ron", "Mitchell", "Roland", "Arnold", "Harvey", "Jared", "Adrian", "Karl", "Cory", "Claude", "Erik", "Darryl", "Jamie", "Neil", "Jessie", "Christian", "Javier", "Fernando", "Clinton", "Ted", "Mathew", "Tyrone", "Darren", "Lonnie", "Lance", "Cody", "Julio", "Kelly", "Kurt", "Allan", "Nelson", "Guy", "Clayton", "Hugh", "Max", "Dwayne", "Dwight", "Armando", "Felix", "Jimmie", "Everett", "Jordan", "Ian", "Wallace", "Ken", "Bob", "Jaime", "Casey", "Alfredo", "Alberto", "Dave", "Ivan", "Johnnie", "Sidney", "Byron", "Julian", "Isaac", "Morris", "Clifton", "Willard", "Daryl", "Ross", "Virgil", "Andy", "Marshall", "Salvador", "Perry", "Kirk", "Sergio", "Marion", "Tracy", "Seth", "Kent", "Terrance", "Rene", "Eduardo", "Terrence", "Enrique", "Freddie", "Wade", "Austin", "Stuart", "Fredrick", "Arturo", "Alejandro", "Jackie", "Joey", "Nick", "Luther", "Wendell", "Jeremiah", "Evan", "Julius", "Dana", "Donnie", "Otis", "Shannon", "Trevor", "Oliver", "Luke", "Homer", "Gerard", "Doug", "Kenny", "Hubert", "Angelo", "Shaun", "Lyle", "Matt", "Lynn", "Alfonso", "Orlando", "Rex", "Carlton", "Ernesto", "Cameron", "Neal", "Pablo", "Lorenzo", "Omar", "Wilbur", "Blake", "Grant", "Horace", "Roderick", "Kerry", "Abraham", "Willis", "Rickey", "Jean", "Ira", "Andres", "Cesar", "Johnathan", "Malcolm", "Rudolph", "Damon", "Kelvin", "Rudy", "Preston", "Alton", "Archie", "Marco", "Wm", "Pete", "Randolph", "Garry", "Geoffrey", "Jonathon", "Felipe", "Bennie", "Gerardo", "Ed", "Dominic", "Robin", "Loren", "Delbert", "Colin", "Guillermo", "Earnest", "Lucas", "Benny", "Noel", "Spencer", "Rodolfo", "Myron", "Edmund", "Garrett", "Salvatore", "Cedric", "Lowell", "Gregg", "Sherman", "Wilson", "Devin", "Sylvester", "Kim", "Roosevelt", "Israel", "Jermaine", "Forrest", "Wilbert", "Leland", "Simon", "Guadalupe", "Clark", "Irving", "Carroll", "Bryant", "Owen", "Rufus", "Woodrow", "Sammy", "Kristopher", "Mack", "Levi", "Marcos", "Gustavo", "Jake", "Lionel", "Marty", "Taylor", "Ellis", "Dallas", "Gilberto", "Clint", "Nicolas", "Laurence", "Ismael", "Orville", "Drew", "Jody", "Ervin", "Dewey", "Al", "Wilfred", "Josh", "Hugo", "Ignacio", "Caleb", "Tomas", "Sheldon", "Erick", "Frankie", "Stewart", "Doyle", "Darrel", "Rogelio", "Terence", "Santiago", "Alonzo", "Elias", "Bert", "Elbert", "Ramiro", "Conrad", "Pat", "Noah", "Grady", "Phil", "Cornelius", "Lamar", "Rolando", "Clay", "Percy", "Dexter", "Bradford", "Merle", "Darin", "Amos", "Terrell", "Moses", "Irvin", "Saul", "Roman", "Darnell", "Randal", "Tommie", "Timmy", "Darrin", "Winston", "Brendan", "Toby", "Van", "Abel", "Dominick", "Boyd", "Courtney", "Jan", "Emilio", "Elijah", "Cary", "Domingo", "Santos", "Aubrey", "Emmett", "Marlon", "Emanuel", "Jerald", "Edmond", "Emil", "Dewayne", "Will", "Otto", "Teddy", "Reynaldo", "Bret", "Morgan", "Jess", "Trent", "Humberto", "Emmanuel", "Stephan", "Louie", "Vicente", "Lamont", "Stacy", "Garland", "Miles", "Micah", "Efrain", "Billie", "Logan", "Heath", "Rodger", "Harley", "Demetrius", "Ethan", "Eldon", "Rocky", "Pierre", "Junior", "Freddy", "Eli", "Bryce", "Antoine", "Robbie", "Kendall", "Royce", "Sterling", "Mickey", "Chase", "Grover", "Elton", "Cleveland", "Dylan", "Chuck", "Damian", "Reuben", "Stan", "August", "Leonardo", "Jasper", "Russel", "Erwin", "Benito", "Hans", "Monte", "Blaine", "Ernie", "Curt", "Quentin", "Agustin", "Murray", "Jamal", "Devon", "Adolfo", "Harrison", "Tyson", "Burton", "Brady", "Elliott", "Wilfredo", "Bart", "Jarrod", "Vance", "Denis", "Damien", "Joaquin", "Harlan", "Desmond", "Elliot", "Darwin", "Ashley", "Gregorio", "Buddy", "Xavier", "Kermit", "Roscoe", "Esteban", "Anton", "Solomon", "Scotty", "Norbert", "Elvin", "Williams", "Nolan", "Carey", "Rod", "Quinton", "Hal", "Brain", "Rob", "Elwood", "Kendrick", "Darius", "Moises", "Son", "Marlin", "Fidel", "Thaddeus", "Cliff", "Marcel", "Ali", "Jackson", "Raphael", "Bryon", "Armand", "Alvaro", "Jeffry", "Dane", "Joesph", "Thurman", "Ned", "Sammie", "Rusty", "Michel", "Monty", "Rory", "Fabian", "Reggie", "Mason", "Graham", "Kris", "Isaiah", "Vaughn", "Gus", "Avery", "Loyd", "Diego", "Alexis", "Adolph", "Norris", "Millard", "Rocco", "Gonzalo", "Derick", "Rodrigo", "Gerry", "Stacey", "Carmen", "Wiley", "Rigoberto", "Alphonso", "Ty", "Shelby", "Rickie", "Noe", "Vern", "Bobbie", "Reed", "Jefferson", "Elvis", "Bernardo", "Mauricio", "Hiram", "Donovan", "Basil", "Riley", "Ollie", "Nickolas", "Maynard", "Scot", "Vince", "Quincy", "Eddy", "Sebastian", "Federico", "Ulysses", "Heriberto", "Donnell", "Cole", "Denny", "Davis", "Gavin", "Emery", "Ward", "Romeo", "Jayson", "Dion", "Dante", "Clement", "Coy", "Odell", "Maxwell", "Jarvis", "Bruno", "Issac", "Mary", "Dudley", "Brock", "Sanford", "Colby", "Carmelo", "Barney", "Nestor", "Hollis", "Stefan", "Donny", "Art", "Linwood", "Beau", "Weldon", "Galen", "Isidro", "Truman", "Delmar", "Johnathon", "Silas", "Frederic", "Dick", "Kirby", "Irwin", "Cruz", "Merlin", "Merrill", "Charley", "Marcelino", "Lane", "Harris", "Cleo", "Carlo", "Trenton", "Kurtis", "Hunter", "Aurelio", "Winfred", "Vito", "Collin", "Denver", "Carter", "Leonel", "Emory", "Pasquale", "Mohammad", "Mariano", "Danial", "Blair", "Landon", "Dirk", "Branden", "Adan", "Numbers", "Clair", "Buford", "German", "Bernie", "Wilmer", "Joan", "Emerson", "Zachery", "Fletcher", "Jacques", "Errol", "Dalton", "Monroe", "Josue", "Dominique", "Edwardo", "Booker", "Wilford", "Sonny", "Shelton", "Carson", "Theron", "Raymundo", "Daren", "Tristan", "Houston", "Robby", "Lincoln", "Jame", "Genaro", "Gale", "Bennett", "Octavio", "Cornell", "Laverne", "Hung", "Arron", "Antony", "Herschel", "Alva", "Giovanni", "Garth", "Cyrus", "Cyril", "Ronny", "Stevie", "Lon", "Freeman", "Erin", "Duncan", "Kennith", "Carmine", "Augustine", "Young", "Erich", "Chadwick", "Wilburn", "Russ", "Reid", "Myles", "Anderson", "Morton", "Jonas", "Forest", "Mitchel", "Mervin", "Zane", "Rich", "Jamel", "Lazaro", "Alphonse", "Randell", "Major", "Johnie", "Jarrett", "Brooks", "Ariel", "Abdul", "Dusty", "Luciano", "Lindsey", "Tracey", "Seymour", "Scottie", "Eugenio", "Mohammed", "Sandy", "Valentin", "Chance", "Arnulfo", "Lucien", "Ferdinand", "Thad", "Ezra", "Sydney", "Aldo", "Rubin", "Royal", "Mitch", "Earle", "Abe", "Wyatt", "Marquis", "Lanny", "Kareem", "Jamar", "Boris", "Isiah", "Emile", "Elmo", "Aron", "Leopoldo", "Everette", "Josef", "Gail", "Eloy", "Dorian", "Rodrick", "Reinaldo", "Lucio", "Jerrod", "Weston", "Hershel", "Barton", "Parker", "Lemuel", "Lavern", "Burt", "Jules", "Gil", "Eliseo", "Ahmad", "Nigel", "Efren", "Antwan", "Alden", "Margarito", "Coleman", "Refugio", "Dino", "Osvaldo", "Les", "Deandre", "Normand", "Kieth", "Ivory", "Andrea", "Trey", "Norberto", "Napoleon", "Jerold", "Fritz", "Rosendo", "Milford", "Sang", "Deon", "Christoper", "Alfonzo", "Lyman", "Josiah", "Brant", "Wilton", "Rico", "Jamaal", "Dewitt", "Carol", "Brenton", "Yong", "Olin", "Foster", "Faustino", "Claudio", "Judson", "Gino", "Edgardo", "Berry", "Alec", "Tanner", "Jarred", "Donn", "Trinidad", "Tad", "Shirley", "Prince", "Porfirio", "Odis", "Maria", "Lenard", "Chauncey", "Chang", "Tod", "Mel", "Marcelo", "Kory", "Augustus", "Keven", "Hilario", "Bud", "Sal", "Rosario", "Orval", "Mauro", "Dannie", "Zachariah", "Olen", "Anibal", "Milo", "Jed", "Frances", "Thanh", "Dillon", "Amado", "Newton", "Connie", "Lenny", "Tory", "Richie", "Lupe", "Horacio", "Brice", "Mohamed", "Delmer", "Dario", "Reyes", "Dee", "Mac", "Jonah", "Jerrold", "Robt", "Hank", "Sung", "Rupert", "Rolland", "Kenton", "Damion", "Chi", "Antone", "Waldo", "Fredric", "Bradly", "Quinn", "Kip", "Burl", "Walker", "Tyree", "Jefferey", "Ahmed", "Willy", "Stanford", "Oren", "Noble", "Moshe", "Mikel", "Enoch", "Brendon", "Quintin", "Jamison", "Florencio", "Darrick", "Tobias", "Minh", "Hassan", "Giuseppe", "Demarcus", "Cletus", "Tyrell", "Lyndon", "Keenan", "Werner", "Theo", "Geraldo", "Lou", "Columbus", "Chet", "Bertram", "Markus", "Huey", "Hilton", "Dwain", "Donte", "Tyron", "Omer", "Isaias", "Hipolito", "Fermin", "Chung", "Adalberto", "Valentine", "Jamey", "Bo", "Barrett", "Whitney", "Teodoro", "Mckinley", "Maximo", "Garfield", "Sol", "Raleigh", "Lawerence", "Abram", "Rashad", "King", "Emmitt", "Daron", "Chong", "Samual", "Paris", "Otha", "Miquel", "Lacy", "Eusebio", "Dong", "Domenic", "Darron", "Buster", "Antonia", "Wilber", "Renato", "Jc", "Hoyt", "Haywood", "Ezekiel", "Chas", "Florentino", "Elroy", "Clemente", "Arden", "Neville", "Kelley", "Edison", "Deshawn", "Carrol", "Shayne", "Nathanial", "Jordon", "Danilo", "Claud", "Val", "Sherwood", "Raymon", "Rayford", "Cristobal", "Ambrose", "Titus", "Hyman", "Felton", "Ezequiel", "Erasmo", "Stanton", "Lonny", "Len", "Ike", "Milan", "Lino", "Jarod", "Herb", "Andreas", "Walton", "Rhett", "Palmer", "Jude", "Douglass", "Cordell", "Oswaldo", "Ellsworth", "Virgilio", "Toney", "Nathanael", "Del", "Britt", "Benedict", "Mose", "Hong", "Leigh", "Johnson", "Isreal", "Gayle", "Garret", "Fausto", "Asa", "Arlen", "Zack", "Warner", "Modesto", "Francesco", "Manual", "Jae", "Gaylord", "Gaston", "Filiberto", "Deangelo", "Michale", "Granville", "Wes", "Malik", "Zackary", "Tuan", "Nicky", "Eldridge", "Cristopher", "Cortez", "Antione", "Malcom", "Long", "Korey", "Jospeh", "Colton", "Waylon", "Von", "Hosea", "Shad", "Santo", "Rudolf", "Rolf", "Rey", "Renaldo", "Marcellus", "Lucius", "Lesley", "Kristofer", "Boyce", "Benton", "Man", "Kasey", "Jewell", "Hayden", "Harland", "Arnoldo", "Rueben", "Leandro", "Kraig", "Jerrell", "Jeromy", "Hobert", "Cedrick", "Arlie", "Winford", "Wally", "Patricia", "Luigi", "Keneth", "Jacinto", "Graig", "Franklyn", "Edmundo", "Sid", "Porter", "Leif", "Lauren", "Jeramy", "Elisha", "Buck", "Willian", "Vincenzo", "Shon", "Michal", "Lynwood", "Lindsay", "Jewel", "Jere", "Hai", "Elden", "Dorsey", "Darell", "Broderick", "Alonso"}

--3319
firstname_female = {"Trey", "Norberto", "Napoleon", "Jerold", "Fritz", "Rosendo", "Milford", "Sang", "Deon", "Christoper", "Alfonzo", "Lyman", "Josiah", "Brant", "Wilton", "Rico", "Jamaal", "Dewitt", "Carol", "Brenton", "Yong", "Olin", "Foster", "Faustino", "Claudio", "Judson", "Gino", "Edgardo", "Berry", "Alec", "Tanner", "Jarred", "Donn", "Trinidad", "Tad", "Shirley", "Prince", "Porfirio", "Odis", "Maria", "Lenard", "Chauncey", "Chang", "Tod", "Mel", "Marcelo", "Kory", "Augustus", "Keven", "Hilario", "Bud", "Sal", "Rosario", "Orval", "Mauro", "Dannie", "Zachariah", "Olen", "Anibal", "Milo", "Jed", "Frances", "Thanh", "Dillon", "Amado", "Newton", "Connie", "Lenny", "Tory", "Richie", "Lupe", "Horacio", "Brice", "Mohamed", "Delmer", "Dario", "Reyes", "Dee", "Mac", "Jonah", "Jerrold", "Robt", "Hank", "Sung", "Rupert", "Rolland", "Kenton", "Damion", "Chi", "Antone", "Waldo", "Fredric", "Bradly", "Quinn", "Kip", "Burl", "Walker", "Tyree", "Jefferey", "Ahmed", "Willy", "Stanford", "Oren", "Noble", "Moshe", "Mikel", "Enoch", "Brendon", "Quintin", "Jamison", "Florencio", "Darrick", "Tobias", "Minh", "Hassan", "Giuseppe", "Demarcus", "Cletus", "Tyrell", "Lyndon", "Keenan", "Werner", "Theo", "Geraldo", "Lou", "Columbus", "Chet", "Bertram", "Markus", "Huey", "Hilton", "Dwain", "Donte", "Tyron", "Omer", "Isaias", "Hipolito", "Fermin", "Chung", "Adalberto", "Valentine", "Jamey", "Bo", "Barrett", "Whitney", "Teodoro", "Mckinley", "Maximo", "Garfield", "Sol", "Raleigh", "Lawerence", "Abram", "Rashad", "King", "Emmitt", "Daron", "Chong", "Samual", "Paris", "Otha", "Miquel", "Lacy", "Eusebio", "Dong", "Domenic", "Darron", "Buster", "Antonia", "Wilber", "Renato", "Jc", "Hoyt", "Haywood", "Ezekiel", "Chas", "Florentino", "Elroy", "Clemente", "Arden", "Neville", "Kelley", "Edison", "Deshawn", "Carrol", "Shayne", "Nathanial", "Jordon", "Danilo", "Claud", "Val", "Sherwood", "Raymon", "Rayford", "Cristobal", "Ambrose", "Titus", "Hyman", "Felton", "Ezequiel", "Erasmo", "Stanton", "Lonny", "Len", "Ike", "Milan", "Lino", "Jarod", "Herb", "Andreas", "Walton", "Rhett", "Palmer", "Jude", "Douglass", "Cordell", "Oswaldo", "Ellsworth", "Virgilio", "Toney", "Nathanael", "Del", "Britt", "Benedict", "Mose", "Hong", "Leigh", "Johnson", "Isreal", "Gayle", "Garret", "Fausto", "Asa", "Arlen", "Zack", "Warner", "Modesto", "Francesco", "Manual", "Jae", "Gaylord", "Gaston", "Filiberto", "Deangelo", "Michale", "Granville", "Wes", "Malik", "Zackary", "Tuan", "Nicky", "Eldridge", "Cristopher", "Cortez", "Antione", "Malcom", "Long", "Korey", "Jospeh", "Colton", "Waylon", "Von", "Hosea", "Shad", "Santo", "Rudolf", "Rolf", "Rey", "Renaldo", "Marcellus", "Lucius", "Lesley", "Kristofer", "Boyce", "Benton", "Man", "Kasey", "Jewell", "Hayden", "Harland", "Arnoldo", "Rueben", "Leandro", "Kraig", "Jerrell", "Jeromy", "Hobert", "Cedrick", "Arlie", "Winford", "Wally", "Patricia", "Luigi", "Keneth", "Jacinto", "Graig", "Franklyn", "Edmundo", "Sid", "Porter", "Leif", "Lauren", "Jeramy", "Elisha", "Buck", "Willian", "Vincenzo", "Shon", "Michal", "Lynwood", "Lindsay", "Jewel", "Jere", "Hai", "Elden", "Dorsey", "Darell", "Broderick", "Alonso", "Mary", "Patricia", "Linda", "Barbara", "Elizabeth", "Jennifer", "Maria", "Susan", "Margaret", "Dorothy", "Lisa", "Nancy", "Karen", "Betty", "Helen", "Sandra", "Donna", "Carol", "Ruth", "Sharon", "Michelle", "Laura", "Sarah", "Kimberly", "Deborah", "Jessica", "Shirley", "Cynthia", "Angela", "Melissa", "Brenda", "Amy", "Anna", "Rebecca", "Virginia", "Kathleen", "Pamela", "Martha", "Debra", "Amanda", "Stephanie", "Carolyn", "Christine", "Marie", "Janet", "Catherine", "Frances", "Ann", "Joyce", "Diane", "Alice", "Julie", "Heather", "Teresa", "Doris", "Gloria", "Evelyn", "Jean", "Cheryl", "Mildred", "Katherine", "Joan", "Ashley", "Judith", "Rose", "Janice", "Kelly", "Nicole", "Judy", "Christina", "Kathy", "Theresa", "Beverly", "Denise", "Tammy", "Irene", "Jane", "Lori", "Rachel", "Marilyn", "Andrea", "Kathryn", "Louise", "Sara", "Anne", "Jacqueline", "Wanda", "Bonnie", "Julia", "Ruby", "Lois", "Tina", "Phyllis", "Norma", "Paula", "Diana", "Annie", "Lillian", "Emily", "Robin", "Peggy", "Crystal", "Gladys", "Rita", "Dawn", "Connie", "Florence", "Tracy", "Edna", "Tiffany", "Carmen", "Rosa", "Cindy", "Grace", "Wendy", "Victoria", "Edith", "Kim", "Sherry", "Sylvia", "Josephine", "Thelma", "Shannon", "Sheila", "Ethel", "Ellen", "Elaine", "Marjorie", "Carrie", "Charlotte", "Monica", "Esther", "Pauline", "Emma", "Juanita", "Anita", "Rhonda", "Hazel", "Amber", "Eva", "Debbie", "April", "Leslie", "Clara", "Lucille", "Jamie", "Joanne", "Eleanor", "Valerie", "Danielle", "Megan", "Alicia", "Suzanne", "Michele", "Gail", "Bertha", "Darlene", "Veronica", "Jill", "Erin", "Geraldine", "Lauren", "Cathy", "Joann", "Lorraine", "Lynn", "Sally", "Regina", "Erica", "Beatrice", "Dolores", "Bernice", "Audrey", "Yvonne", "Annette", "June", "Samantha", "Marion", "Dana", "Stacy", "Ana", "Renee", "Ida", "Vivian", "Roberta", "Holly", "Brittany", "Melanie", "Loretta", "Yolanda", "Jeanette", "Laurie", "Katie", "Kristen", "Vanessa", "Alma", "Sue", "Elsie", "Beth", "Jeanne", "Vicki", "Carla", "Tara", "Rosemary", "Eileen", "Terri", "Gertrude", "Lucy", "Tonya", "Ella", "Stacey", "Wilma", "Gina", "Kristin", "Jessie", "Natalie", "Agnes", "Vera", "Willie", "Charlene", "Bessie", "Delores", "Melinda", "Pearl", "Arlene", "Maureen", "Colleen", "Allison", "Tamara", "Joy", "Georgia", "Constance", "Lillie", "Claudia", "Jackie", "Marcia", "Tanya", "Nellie", "Minnie", "Marlene", "Heidi", "Glenda", "Lydia", "Viola", "Courtney", "Marian", "Stella", "Caroline", "Dora", "Jo", "Vickie", "Mattie", "Terry", "Maxine", "Irma", "Mabel", "Marsha", "Myrtle", "Lena", "Christy", "Deanna", "Patsy", "Hilda", "Gwendolyn", "Jennie", "Nora", "Margie", "Nina", "Cassandra", "Leah", "Penny", "Kay", "Priscilla", "Naomi", "Carole", "Brandy", "Olga", "Billie", "Dianne", "Tracey", "Leona", "Jenny", "Felicia", "Sonia", "Miriam", "Velma", "Becky", "Bobbie", "Violet", "Kristina", "Toni", "Misty", "Mae", "Shelly", "Daisy", "Ramona", "Sherri", "Erika", "Katrina", "Claire", "Lindsey", "Lindsay", "Geneva", "Guadalupe", "Belinda", "Margarita", "Sheryl", "Cora", "Faye", "Ada", "Natasha", "Sabrina", "Isabel", "Marguerite", "Hattie", "Harriet", "Molly", "Cecilia", "Kristi", "Brandi", "Blanche", "Sandy", "Rosie", "Joanna", "Iris", "Eunice", "Angie", "Inez", "Lynda", "Madeline", "Amelia", "Alberta", "Genevieve", "Monique", "Jodi", "Janie", "Maggie", "Kayla", "Sonya", "Jan", "Lee", "Kristine", "Candace", "Fannie", "Maryann", "Opal", "Alison", "Yvette", "Melody", "Luz", "Susie", "Olivia", "Flora", "Shelley", "Kristy", "Mamie", "Lula", "Lola", "Verna", "Beulah", "Antoinette", "Candice", "Juana", "Jeannette", "Pam", "Kelli", "Hannah", "Whitney", "Bridget", "Karla", "Celia", "Latoya", "Patty", "Shelia", "Gayle", "Della", "Vicky", "Lynne", "Sheri", "Marianne", "Kara", "Jacquelyn", "Erma", "Blanca", "Myra", "Leticia", "Pat", "Krista", "Roxanne", "Angelica", "Johnnie", "Robyn", "Francis", "Adrienne", "Rosalie", "Alexandra", "Brooke", "Bethany", "Sadie", "Bernadette", "Traci", "Jody", "Kendra", "Jasmine", "Nichole", "Rachael", "Chelsea", "Mable", "Ernestine", "Muriel", "Marcella", "Elena", "Krystal", "Angelina", "Nadine", "Kari", "Estelle", "Dianna", "Paulette", "Lora", "Mona", "Doreen", "Rosemarie", "Angel", "Desiree", "Antonia", "Hope", "Ginger", "Janis", "Betsy", "Christie", "Freda", "Mercedes", "Meredith", "Lynette", "Teri", "Cristina", "Eula", "Leigh", "Meghan", "Sophia", "Eloise", "Rochelle", "Gretchen", "Cecelia", "Raquel", "Henrietta", "Alyssa", "Jana", "Kelley", "Gwen", "Kerry", "Jenna", "Tricia", "Laverne", "Olive", "Alexis", "Tasha", "Silvia", "Elvira", "Casey", "Delia", "Sophie", "Kate", "Patti", "Lorena", "Kellie", "Sonja", "Lila", "Lana", "Darla", "May", "Mindy", "Essie", "Mandy", "Lorene", "Elsa", "Josefina", "Jeannie", "Miranda", "Dixie", "Lucia", "Marta", "Faith", "Lela", "Johanna", "Shari", "Camille", "Tami", "Shawna", "Elisa", "Ebony", "Melba", "Ora", "Nettie", "Tabitha", "Ollie", "Jaime", "Winifred", "Kristie", "Marina", "Alisha", "Aimee", "Rena", "Myrna", "Marla", "Tammie", "Latasha", "Bonita", "Patrice", "Ronda", "Sherrie", "Addie", "Francine", "Deloris", "Stacie", "Adriana", "Cheri", "Shelby", "Abigail", "Celeste", "Jewel", "Cara", "Adele", "Rebekah", "Lucinda", "Dorthy", "Chris", "Effie", "Trina", "Reba", "Shawn", "Sallie", "Aurora", "Lenora", "Etta", "Lottie", "Kerri", "Trisha", "Nikki", "Estella", "Francisca", "Josie", "Tracie", "Marissa", "Karin", "Brittney", "Janelle", "Lourdes", "Laurel", "Helene", "Fern", "Elva", "Corinne", "Kelsey", "Ina", "Bettie", "Elisabeth", "Aida", "Caitlin", "Ingrid", "Iva", "Eugenia", "Christa", "Goldie", "Cassie", "Maude", "Jenifer", "Therese", "Frankie", "Dena", "Lorna", "Janette", "Latonya", "Candy", "Morgan", "Consuelo", "Tamika", "Rosetta", "Debora", "Cherie", "Polly", "Dina", "Jewell", "Fay", "Jillian", "Dorothea", "Nell", "Trudy", "Esperanza", "Patrica", "Kimberley", "Shanna", "Helena", "Carolina", "Cleo", "Stefanie", "Rosario", "Ola", "Janine", "Mollie", "Lupe", "Alisa", "Lou", "Maribel", "Susanne", "Bette", "Susana", "Elise", "Cecile", "Isabelle", "Lesley", "Jocelyn", "Paige", "Joni", "Rachelle", "Leola", "Daphne", "Alta", "Ester", "Petra", "Graciela", "Imogene", "Jolene", "Keisha", "Lacey", "Glenna", "Gabriela", "Keri", "Ursula", "Lizzie", "Kirsten", "Shana", "Adeline", "Mayra", "Jayne", "Jaclyn", "Gracie", "Sondra", "Carmela", "Marisa", "Rosalind", "Charity", "Tonia", "Beatriz", "Marisol", "Clarice", "Jeanine", "Sheena", "Angeline", "Frieda", "Lily", "Robbie", "Shauna", "Millie", "Claudette", "Cathleen", "Angelia", "Gabrielle", "Autumn", "Katharine", "Summer", "Jodie", "Staci", "Lea", "Christi", "Jimmie", "Justine", "Elma", "Luella", "Margret", "Dominique", "Socorro", "Rene", "Martina", "Margo", "Mavis", "Callie", "Bobbi", "Maritza", "Lucile", "Leanne", "Jeannine", "Deana", "Aileen", "Lorie", "Ladonna", "Willa", "Manuela", "Gale", "Selma", "Dolly", "Sybil", "Abby", "Lara", "Dale", "Ivy", "Dee", "Winnie", "Marcy", "Luisa", "Jeri", "Magdalena", "Ofelia", "Meagan", "Audra", "Matilda", "Leila", "Cornelia", "Bianca", "Simone", "Bettye", "Randi", "Virgie", "Latisha", "Barbra", "Georgina", "Eliza", "Leann", "Bridgette", "Rhoda", "Haley", "Adela", "Nola", "Bernadine", "Flossie", "Ila", "Greta", "Ruthie", "Nelda", "Minerva", "Lilly", "Terrie", "Letha", "Hilary", "Estela", "Valarie", "Brianna", "Rosalyn", "Earline", "Catalina", "Ava", "Mia", "Clarissa", "Lidia", "Corrine", "Alexandria", "Concepcion", "Tia", "Sharron", "Rae", "Dona", "Ericka", "Jami", "Elnora", "Chandra", "Lenore", "Neva", "Marylou", "Melisa", "Tabatha", "Serena", "Avis", "Allie", "Sofia", "Jeanie", "Odessa", "Nannie", "Harriett", "Loraine", "Penelope", "Milagros", "Emilia", "Benita", "Allyson", "Ashlee", "Tania", "Tommie", "Esmeralda", "Karina", "Eve", "Pearlie", "Zelma", "Malinda", "Noreen", "Tameka", "Saundra", "Hillary", "Amie", "Althea", "Rosalinda", "Jordan", "Lilia", "Alana", "Gay", "Clare", "Alejandra", "Elinor", "Michael", "Lorrie", "Jerri", "Darcy", "Earnestine", "Carmella", "Taylor", "Noemi", "Marcie", "Liza", "Annabelle", "Louisa", "Earlene", "Mallory", "Carlene", "Nita", "Selena", "Tanisha", "Katy", "Julianne", "John", "Lakisha", "Edwina", "Maricela", "Margery", "Kenya", "Dollie", "Roxie", "Roslyn", "Kathrine", "Nanette", "Charmaine", "Lavonne", "Ilene", "Kris", "Tammi", "Suzette", "Corine", "Kaye", "Jerry", "Merle", "Chrystal", "Lina", "Deanne", "Lilian", "Juliana", "Aline", "Luann", "Kasey", "Maryanne", "Evangeline", "Colette", "Melva", "Lawanda", "Yesenia", "Nadia", "Madge", "Kathie", "Eddie", "Ophelia", "Valeria", "Nona", "Mitzi", "Mari", "Georgette", "Claudine", "Fran", "Alissa", "Roseann", "Lakeisha", "Susanna", "Reva", "Deidre", "Chasity", "Sheree", "Carly", "James", "Elvia", "Alyce", "Deirdre", "Gena", "Briana", "Araceli", "Katelyn", "Rosanne", "Wendi", "Tessa", "Berta", "Marva", "Imelda", "Marietta", "Marci", "Leonor", "Arline", "Sasha", "Madelyn", "Janna", "Juliette", "Deena", "Aurelia", "Josefa", "Augusta", "Liliana", "Young", "Christian", "Lessie", "Amalia", "Savannah", "Anastasia", "Vilma", "Natalia", "Rosella", "Lynnette", "Corina", "Alfreda", "Leanna", "Carey", "Amparo", "Coleen", "Tamra", "Aisha", "Wilda", "Karyn", "Cherry", "Queen", "Maura", "Mai", "Evangelina", "Rosanna", "Hallie", "Erna", "Enid", "Mariana", "Lacy", "Juliet", "Jacklyn", "Freida", "Madeleine", "Mara", "Hester", "Cathryn", "Lelia", "Casandra", "Bridgett", "Angelita", "Jannie", "Dionne", "Annmarie", "Katina", "Beryl", "Phoebe", "Millicent", "Katheryn", "Diann", "Carissa", "Maryellen", "Liz", "Lauri", "Helga", "Gilda", "Adrian", "Rhea", "Marquita", "Hollie", "Tisha", "Tamera", "Angelique", "Francesca", "Britney", "Kaitlin", "Lolita", "Florine", "Rowena", "Reyna", "Twila", "Fanny", "Janell", "Ines", "Concetta", "Bertie", "Alba", "Brigitte", "Alyson", "Vonda", "Pansy", "Elba", "Noelle", "Letitia", "Kitty", "Deann", "Brandie", "Louella", "Leta", "Felecia", "Sharlene", "Lesa", "Beverley", "Robert", "Isabella", "Herminia", "Terra", "Celina", "Shanita", "Shani", "Shandra", "Randa", "Pinkie", "Paris", "Nelida", "Marilou", "Lyla", "Laurene", "Laci", "Joi", "Janene", "Dorotha", "Daniele", "Dani", "Carolynn", "Carlyn", "Berenice", "Ayesha", "Anneliese", "Alethea", "Thersa", "Tamiko", "Rufina", "Oliva", "Mozell", "Marylyn", "Madison", "Kristian", "Kathyrn", "Kasandra", "Kandace", "Janae", "Gabriel", "Domenica", "Debbra", "Dannielle", "Chun", "Buffy", "Barbie", "Arcelia", "Aja", "Zenobia", "Sharen", "Sharee", "Patrick", "Page", "My", "Lavinia", "Kum", "Kacie", "Jackeline", "Huong", "Felisa", "Emelia", "Eleanora", "Cythia", "Cristin", "Clyde", "Claribel", "Caron", "Anastacia", "Zulma", "Zandra", "Yoko", "Tenisha", "Susann", "Sherilyn", "Shay", "Shawanda", "Sabine", "Romana", "Mathilda", "Linsey", "Keiko", "Joana", "Isela", "Gretta", "Georgetta", "Eugenie", "Dusty", "Desirae", "Delora", "Corazon", "Antonina", "Anika", "Willene", "Tracee", "Tamatha", "Regan", "Nichelle", "Mickie", "Maegan", "Luana", "Lanita", "Kelsie", "Edelmira", "Bree", "Afton", "Teodora", "Tamie", "Shena", "Meg", "Linh", "Keli", "Kaci", "Danyelle", "Britt", "Arlette", "Albertine", "Adelle", "Tiffiny", "Stormy", "Simona", "Numbers", "Nicolasa", "Nichol", "Nia", "Nakisha", "Mee", "Maira", "Loreen", "Kizzy", "Johnny", "Jay", "Fallon", "Christene", "Bobbye", "Anthony", "Ying", "Vincenza", "Tanja", "Rubie", "Roni", "Queenie", "Margarett", "Kimberli", "Irmgard", "Idell", "Hilma", "Evelina", "Esta", "Emilee", "Dennise", "Dania", "Carl", "Carie", "Antonio", "Wai", "Sang", "Risa", "Rikki", "Particia", "Mui", "Masako", "Mario", "Luvenia", "Loree", "Loni", "Lien", "Kevin", "Gigi", "Florencia", "Dorian", "Denita", "Dallas", "Chi", "Billye", "Alexander", "Tomika", "Sharita", "Rana", "Nikole", "Neoma", "Margarite", "Madalyn", "Lucina", "Laila", "Kali", "Jenette", "Gabriele", "Evelyne", "Elenora", "Clementina", "Alejandrina", "Zulema", "Violette", "Vannessa", "Thresa", "Retta", "Pia", "Patience", "Noella", "Nickie", "Jonell", "Delta", "Chung", "Chaya", "Camelia", "Bethel", "Anya", "Andrew", "Thanh", "Suzann", "Spring", "Shu", "Mila", "Lilla", "Laverna", "Keesha", "Kattie", "Gia", "Georgene", "Eveline", "Estell", "Elizbeth", "Vivienne", "Vallie", "Trudie", "Stephane", "Michel", "Magaly", "Madie", "Kenyetta", "Karren", "Janetta", "Hermine", "Harmony", "Drucilla", "Debbi", "Celestina", "Candie", "Britni", "Beckie", "Amina", "Zita", "Yun", "Yolande", "Vivien", "Vernetta", "Trudi", "Sommer", "Pearle", "Patrina", "Ossie", "Nicolle", "Loyce", "Letty", "Larisa", "Katharina", "Joselyn", "Jonelle", "Jenell", "Iesha", "Heide", "Florinda", "Florentina", "Flo", "Elodia", "Dorine", "Brunilda", "Brigid", "Ashli", "Ardella", "Twana", "Thu", "Tarah", "Sung", "Shea", "Shavon", "Shane", "Serina", "Rayna", "Ramonita", "Nga", "Margurite", "Lucrecia", "Kourtney", "Kati", "Jesus", "Jesenia", "Diamond", "Crista", "Ayana", "Alica", "Alia", "Vinnie", "Suellen", "Romelia", "Rachell", "Piper", "Olympia", "Michiko", "Kathaleen", "Jolie", "Jessi", "Janessa", "Hana", "Ha", "Elease", "Carletta", "Britany", "Shona", "Salome", "Rosamond", "Regena", "Raina", "Ngoc", "Nelia", "Louvenia", "Lesia", "Latrina", "Laticia", "Larhonda", "Jina", "Jacki", "Hollis", "Holley", "Emmy", "Deeann", "Coretta", "Arnetta", "Velvet", "Thalia", "Shanice", "Neta", "Mikki", "Micki", "Lonna", "Leana", "Lashunda", "Kiley", "Joye", "Jacqulyn", "Ignacia", "Hyun", "Hiroko", "Henry", "Henriette", "Elayne", "Delinda", "Darnell", "Dahlia", "Coreen", "Consuela", "Conchita", "Celine", "Babette", "Ayanna", "Anette", "Albertina", "Skye", "Shawnee", "Shaneka", "Quiana", "Pamelia", "Min", "Merri", "Merlene", "Margit", "Kiesha", "Kiera", "Kaylene", "Jodee", "Jenise", "Erlene", "Emmie", "Else", "Daryl", "Dalila", "Daisey", "Cody", "Casie", "Belia", "Babara", "Versie", "Vanesa", "Shelba", "Shawnda", "Sam", "Norman", "Nikia", "Naoma", "Marna", "Margeret", "Madaline", "Lawana", "Kindra", "Jutta", "Jazmine", "Janett", "Hannelore", "Glendora", "Gertrud", "Garnett", "Freeda", "Frederica", "Florance", "Flavia", "Dennis", "Carline", "Beverlee", "Anjanette", "Valda", "Trinity", "Tamala", "Stevie", "Shonna", "Sha", "Sarina", "Oneida", "Micah", "Merilyn", "Marleen", "Lurline", "Lenna", "Katherin", "Jin", "Jeni", "Hae", "Gracia", "Glady", "Farah", "Eric", "Enola", "Ema", "Dominque", "Devona", "Delana", "Cecila", "Caprice", "Alysha", "Ali", "Alethia", "Vena", "Theresia", "Tawny", "Song", "Shakira", "Samara", "Sachiko", "Rachele", "Pamella", "Nicky", "Marni", "Mariel", "Maren", "Malisa", "Ligia", "Lera", "Latoria", "Larae", "Kimber", "Kathern", "Karey", "Jennefer", "Janeth", "Halina", "Fredia", "Delisa", "Debroah", "Ciera", "Chin", "Angelika", "Andree", "Altha", "Yen", "Vivan", "Terresa", "Tanna", "Suk", "Sudie", "Soo", "Signe", "Salena", "Ronni", "Rebbecca", "Myrtie", "Mckenzie", "Malika", "Maida", "Loan", "Leonarda", "Kayleigh", "France", "Ethyl", "Ellyn", "Dayle", "Cammie", "Brittni", "Birgit", "Avelina", "Asuncion", "Arianna", "Akiko", "Venice", "Tyesha", "Tonie", "Tiesha", "Takisha", "Steffanie", "Sindy", "Santana", "Meghann", "Manda", "Macie", "Lady", "Kellye", "Kellee", "Joslyn", "Jason", "Inger", "Indira", "Glinda", "Glennis", "Fernanda", "Faustina", "Eneida", "Elicia", "Dot", "Digna", "Dell", "Arletta", "Andre", "Willia", "Tammara", "Tabetha", "Sherrell", "Sari", "Refugio", "Rebbeca", "Pauletta", "Nieves", "Natosha", "Nakita", "Mammie", "Kenisha", "Kazuko", "Kassie", "Gary", "Earlean", "Daphine", "Corliss", "Clotilde", "Carolyne", "Bernetta", "Augustina", "Audrea", "Annis", "Annabell", "Yan", "Tennille", "Tamica", "Selene", "Sean", "Rosana", "Regenia", "Qiana", "Markita", "Macy", "Leeanne", "Laurine", "Kym", "Jessenia", "Janita", "Georgine", "Genie", "Emiko", "Elvie", "Deandra", "Dagmar", "Corie", "Collen", "Cherish", "Romaine", "Porsha", "Pearlene", "Micheline", "Merna", "Margorie", "Margaretta", "Lore", "Kenneth", "Jenine", "Hermina", "Fredericka", "Elke", "Drusilla", "Dorathy", "Dione", "Desire", "Celena", "Brigida", "Angeles", "Allegra", "Theo", "Tamekia", "Synthia", "Stephen", "Sook", "Slyvia", "Rosann", "Reatha", "Raye", "Marquetta", "Margart", "Ling", "Layla", "Kymberly", "Kiana", "Kayleen", "Katlyn", "Karmen", "Joella", "Irina", "Emelda", "Eleni", "Detra", "Clemmie", "Cheryll", "Chantell", "Cathey", "Arnita", "Arla", "Angle", "Angelic", "Alyse", "Zofia", "Thomasine", "Tennie", "Son", "Sherly", "Sherley", "Sharyl", "Remedios", "Petrina", "Nickole", "Myung", "Myrle", "Mozella", "Louanne", "Lisha", "Latia", "Lane", "Krysta", "Julienne", "Joel", "Jeanene", "Jacqualine", "Isaura", "Gwenda", "Earleen", "Donald", "Cleopatra", "Carlie", "Audie", "Antonietta", "Alise", "Alex", "Verdell", "Val", "Tyler", "Tomoko", "Thao", "Talisha", "Steven", "So", "Shemika", "Shaun", "Scarlet", "Savanna", "Santina", "Rosia", "Raeann", "Odilia", "Nana", "Minna", "Magan", "Lynelle", "Le", "Karma", "Joeann", "Ivana", "Inell", "Ilana", "Hye", "Honey", "Hee", "Gudrun", "Frank", "Dreama", "Crissy", "Chante", "Carmelina", "Arvilla", "Arthur", "Annamae", "Alvera", "Aleida", "Aaron", "Yee", "Yanira", "Vanda", "Tianna", "Tam", "Stefania", "Shira", "Perry", "Nicol", "Nancie", "Monserrate", "Minh", "Melynda", "Melany", "Matthew", "Lovella", "Laure", "Kirby", "Kacy", "Jacquelynn", "Hyon", "Gertha", "Francisco", "Eliana", "Christena", "Christeen", "Charise", "Caterina", "Carley", "Candyce", "Arlena", "Ammie", "Yang", "Willette", "Vanita", "Tuyet", "Tiny", "Syreeta", "Silva", "Scott", "Ronald", "Penney", "Nyla", "Michal", "Maurice", "Maryam", "Marya", "Magen", "Ludie", "Loma", "Livia", "Lanell", "Kimberlie", "Julee", "Donetta", "Diedra", "Denisha", "Deane", "Dawne", "Clarine", "Cherryl", "Bronwyn", "Brandon", "Alla", "Valery", "Tonda", "Sueann", "Soraya", "Shoshana", "Shela", "Sharleen", "Shanelle", "Nerissa", "Micheal", "Meridith", "Mellie", "Maye", "Maple", "Magaret", "Luis", "Lili", "Leonila", "Leonie", "Leeanna", "Lavonia", "Lavera", "Kristel", "Kathey", "Kathe", "Justin", "Julian", "Jimmy", "Jann", "Ilda", "Hildred", "Hildegarde", "Genia", "Fumiko", "Evelin", "Ermelinda", "Elly", "Dung", "Doloris", "Dionna", "Danae", "Berneice", "Annice", "Alix", "Verena", "Verdie", "Tristan", "Shawnna", "Shawana", "Shaunna", "Rozella", "Randee", "Ranae", "Milagro", "Lynell", "Luise", "Louie", "Loida", "Lisbeth", "Karleen", "Junita", "Jona", "Isis", "Hyacinth", "Hedy", "Gwenn", "Ethelene", "Erline", "Edward", "Donya", "Domonique", "Delicia", "Dannette", "Cicely", "Branda", "Blythe", "Bethann", "Ashlyn", "Annalee", "Alline", "Yuko", "Vella", "Trang", "Towanda", "Tesha", "Sherlyn", "Narcisa", "Miguelina", "Meri", "Maybell", "Marlana", "Marguerita", "Madlyn", "Luna", "Lory", "Loriann", "Liberty", "Leonore", "Leighann", "Laurice", "Latesha", "Laronda", "Katrice", "Kasie", "Karl", "Kaley", "Jadwiga", "Glennie", "Gearldine", "Francina", "Epifania", "Dyan", "Dorie", "Diedre", "Denese", "Demetrice", "Delena", "Darby", "Cristie", "Cleora", "Catarina", "Carisa", "Bernie", "Barbera", "Almeta", "Trula", "Tereasa", "Solange", "Sheilah", "Shavonne", "Sanora", "Rochell", "Mathilde", "Margareta", "Maia", "Lynsey", "Lawanna", "Launa", "Kena", "Keena", "Katia", "Jamey", "Glynda", "Gaylene", "Elvina", "Elanor", "Danuta", "Danika", "Cristen", "Cordie", "Coletta", "Clarita", "Carmon", "Brynn", "Azucena", "Aundrea", "Angele", "Yi", "Walter", "Verlie", "Verlene", "Tamesha", "Silvana", "Sebrina", "Samira", "Reda", "Raylene", "Penni", "Pandora", "Norah", "Noma", "Mireille", "Melissia", "Maryalice", "Laraine", "Kimbery", "Karyl", "Karine", "Kam", "Jolanda", "Johana", "Jesusa", "Jaleesa", "Jae", "Jacquelyne", "Irish", "Iluminada", "Hilaria", "Hanh", "Gennie", "Francie", "Floretta", "Exie", "Edda", "Drema", "Delpha", "Bev", "Barbar", "Assunta", "Ardell", "Annalisa", "Alisia", "Yukiko", "Yolando", "Wonda", "Wei", "Waltraud", "Veta", "Tequila", "Temeka", "Tameika", "Shirleen", "Shenita", "Piedad", "Ozella", "Mirtha", "Marilu", "Kimiko", "Juliane", "Jenice", "Jen", "Janay", "Jacquiline", "Hilde", "Fe", "Fae", "Evan", "Eugene", "Elois", "Echo", "Devorah", "Chau", "Brinda", "Betsey", "Arminda", "Shanita", "Shani", "Shandra", "Randa", "Pinkie", "Paris", "Nelida", "Marilou", "Lyla", "Laurene", "Laci", "Joi", "Janene", "Dorotha", "Daniele", "Dani", "Carolynn", "Carlyn", "Berenice", "Ayesha", "Anneliese", "Alethea", "Thersa", "Tamiko", "Rufina", "Oliva", "Mozell", "Marylyn", "Madison", "Kristian", "Kathyrn", "Kasandra", "Kandace", "Janae", "Gabriel", "Domenica", "Debbra", "Dannielle", "Chun", "Buffy", "Barbie", "Arcelia", "Aja", "Zenobia", "Sharen", "Sharee", "Patrick", "Page", "My", "Lavinia", "Kum", "Kacie", "Jackeline", "Huong", "Felisa", "Emelia", "Eleanora", "Cythia", "Cristin", "Clyde", "Claribel", "Caron", "Anastacia", "Zulma", "Zandra", "Yoko", "Tenisha", "Susann", "Sherilyn", "Shay", "Shawanda", "Sabine", "Romana", "Mathilda", "Linsey", "Keiko", "Joana", "Isela", "Gretta", "Georgetta", "Eugenie", "Dusty", "Desirae", "Delora", "Corazon", "Antonina", "Anika", "Willene", "Tracee", "Tamatha", "Regan", "Nichelle", "Mickie", "Maegan", "Luana", "Lanita", "Kelsie", "Edelmira", "Bree", "Afton", "Teodora", "Tamie", "Shena", "Meg", "Linh", "Keli", "Kaci", "Danyelle", "Britt", "Arlette", "Albertine", "Adelle", "Tiffiny", "Stormy", "Simona", "Numbers", "Nicolasa", "Nichol", "Nia", "Nakisha", "Mee", "Maira", "Loreen", "Kizzy", "Johnny", "Jay", "Fallon", "Christene", "Bobbye", "Anthony", "Ying", "Vincenza", "Tanja", "Rubie", "Roni", "Queenie", "Margarett", "Kimberli", "Irmgard", "Idell", "Hilma", "Evelina", "Esta", "Emilee", "Dennise", "Dania", "Carl", "Carie", "Antonio", "Wai", "Sang", "Risa", "Rikki", "Particia", "Mui", "Masako", "Mario", "Luvenia", "Loree", "Loni", "Lien", "Kevin", "Gigi", "Florencia", "Dorian", "Denita", "Dallas", "Chi", "Billye", "Alexander", "Tomika", "Sharita", "Rana", "Nikole", "Neoma", "Margarite", "Madalyn", "Lucina", "Laila", "Kali", "Jenette", "Gabriele", "Evelyne", "Elenora", "Clementina", "Alejandrina", "Zulema", "Violette", "Vannessa", "Thresa", "Retta", "Pia", "Patience", "Noella", "Nickie", "Jonell", "Delta", "Chung", "Chaya", "Camelia", "Bethel", "Anya", "Andrew", "Thanh", "Suzann", "Spring", "Shu", "Mila", "Lilla", "Laverna", "Keesha", "Kattie", "Gia", "Georgene", "Eveline", "Estell", "Elizbeth", "Vivienne", "Vallie", "Trudie", "Stephane", "Michel", "Magaly", "Madie", "Kenyetta", "Karren", "Janetta", "Hermine", "Harmony", "Drucilla", "Debbi", "Celestina", "Candie", "Britni", "Beckie", "Amina", "Zita", "Yun", "Yolande", "Vivien", "Vernetta", "Trudi", "Sommer", "Pearle", "Patrina", "Ossie", "Nicolle", "Loyce", "Letty", "Larisa", "Katharina", "Joselyn", "Jonelle", "Jenell", "Iesha", "Heide", "Florinda", "Florentina", "Flo", "Elodia", "Dorine", "Brunilda", "Brigid", "Ashli", "Ardella", "Twana", "Thu", "Tarah", "Sung", "Shea", "Shavon", "Shane", "Serina", "Rayna", "Ramonita", "Nga", "Margurite", "Lucrecia", "Kourtney", "Kati", "Jesus", "Jesenia", "Diamond", "Crista", "Ayana", "Alica", "Alia", "Vinnie", "Suellen", "Romelia", "Rachell", "Piper", "Olympia", "Michiko", "Kathaleen", "Jolie", "Jessi", "Janessa", "Hana", "Ha", "Elease", "Carletta", "Britany", "Shona", "Salome", "Rosamond", "Regena", "Raina", "Ngoc", "Nelia", "Louvenia", "Lesia", "Latrina", "Laticia", "Larhonda", "Jina", "Jacki", "Hollis", "Holley", "Emmy", "Deeann", "Coretta", "Arnetta", "Velvet", "Thalia", "Shanice", "Neta", "Mikki", "Micki", "Lonna", "Leana", "Lashunda", "Kiley", "Joye", "Jacqulyn", "Ignacia", "Hyun", "Hiroko", "Henry", "Henriette", "Elayne", "Delinda", "Darnell", "Dahlia", "Coreen", "Consuela", "Conchita", "Celine", "Babette", "Ayanna", "Anette", "Albertina", "Skye", "Shawnee", "Shaneka", "Quiana", "Pamelia", "Min", "Merri", "Merlene", "Margit", "Kiesha", "Kiera", "Kaylene", "Jodee", "Jenise", "Erlene", "Emmie", "Else", "Daryl", "Dalila", "Daisey", "Cody", "Casie", "Belia", "Babara", "Versie", "Vanesa", "Shelba", "Shawnda", "Sam", "Norman", "Nikia", "Naoma", "Marna", "Margeret", "Madaline", "Lawana", "Kindra", "Jutta", "Jazmine", "Janett", "Hannelore", "Glendora", "Gertrud", "Garnett", "Freeda", "Frederica", "Florance", "Flavia", "Dennis", "Carline", "Beverlee", "Anjanette", "Valda", "Trinity", "Tamala", "Stevie", "Shonna", "Sha", "Sarina", "Oneida", "Micah", "Merilyn", "Marleen", "Lurline", "Lenna", "Katherin", "Jin", "Jeni", "Hae", "Gracia", "Glady", "Farah", "Eric", "Enola", "Ema", "Dominque", "Devona", "Delana", "Cecila", "Caprice", "Alysha", "Ali", "Alethia", "Vena", "Theresia", "Tawny", "Song", "Shakira", "Samara", "Sachiko", "Rachele", "Pamella", "Nicky", "Marni", "Mariel", "Maren", "Malisa", "Ligia", "Lera", "Latoria", "Larae", "Kimber", "Kathern", "Karey", "Jennefer", "Janeth", "Halina", "Fredia", "Delisa", "Debroah", "Ciera", "Chin", "Angelika", "Andree", "Altha", "Yen", "Vivan", "Terresa", "Tanna", "Suk", "Sudie", "Soo", "Signe", "Salena", "Ronni", "Rebbecca", "Myrtie", "Mckenzie", "Malika", "Maida", "Loan", "Leonarda", "Kayleigh", "France", "Ethyl", "Ellyn", "Dayle", "Cammie", "Brittni", "Birgit", "Avelina", "Asuncion", "Arianna", "Akiko", "Venice", "Tyesha", "Tonie", "Tiesha", "Takisha", "Steffanie", "Sindy", "Santana", "Meghann", "Manda", "Macie", "Lady", "Kellye", "Kellee", "Joslyn", "Jason", "Inger", "Indira", "Glinda", "Glennis", "Fernanda", "Faustina", "Eneida", "Elicia", "Dot", "Digna", "Dell", "Arletta", "Andre", "Willia", "Tammara", "Tabetha", "Sherrell", "Sari", "Refugio", "Rebbeca", "Pauletta", "Nieves", "Natosha", "Nakita", "Mammie", "Kenisha", "Kazuko", "Kassie", "Gary", "Earlean", "Daphine", "Corliss", "Clotilde", "Carolyne", "Bernetta", "Augustina", "Audrea", "Annis", "Annabell", "Yan", "Tennille", "Tamica", "Selene", "Sean", "Rosana", "Regenia", "Qiana", "Markita", "Macy", "Leeanne", "Laurine", "Kym", "Jessenia", "Janita", "Georgine", "Genie", "Emiko", "Elvie", "Deandra", "Dagmar", "Corie", "Collen", "Cherish", "Romaine", "Porsha", "Pearlene", "Micheline", "Merna", "Margorie", "Margaretta", "Lore", "Kenneth", "Jenine", "Hermina", "Fredericka", "Elke", "Drusilla", "Dorathy", "Dione", "Desire", "Celena", "Brigida", "Angeles", "Allegra", "Theo", "Tamekia", "Synthia", "Stephen", "Sook", "Slyvia", "Rosann", "Reatha", "Raye", "Marquetta", "Margart", "Ling", "Layla", "Kymberly", "Kiana", "Kayleen", "Katlyn", "Karmen", "Joella", "Irina", "Emelda", "Eleni", "Detra", "Clemmie", "Cheryll", "Chantell", "Cathey", "Arnita", "Arla", "Angle", "Angelic", "Alyse", "Zofia", "Thomasine", "Tennie", "Son", "Sherly", "Sherley", "Sharyl", "Remedios", "Petrina", "Nickole", "Myung", "Myrle", "Mozella", "Louanne", "Lisha", "Latia", "Lane", "Krysta", "Julienne", "Joel", "Jeanene", "Jacqualine", "Isaura", "Gwenda", "Earleen", "Donald", "Cleopatra", "Carlie", "Audie", "Antonietta", "Alise", "Alex", "Verdell", "Val", "Tyler", "Tomoko", "Thao", "Talisha", "Steven", "So", "Shemika", "Shaun", "Scarlet", "Savanna", "Santina", "Rosia", "Raeann", "Odilia", "Nana", "Minna", "Magan", "Lynelle", "Le", "Karma", "Joeann", "Ivana", "Inell", "Ilana", "Hye", "Honey", "Hee", "Gudrun", "Frank", "Dreama", "Crissy", "Chante", "Carmelina", "Arvilla", "Arthur", "Annamae", "Alvera", "Aleida", "Aaron", "Yee", "Yanira", "Vanda", "Tianna", "Tam", "Stefania", "Shira", "Perry", "Nicol", "Nancie", "Monserrate", "Minh", "Melynda", "Melany", "Matthew", "Lovella", "Laure", "Kirby", "Kacy", "Jacquelynn", "Hyon", "Gertha", "Francisco", "Eliana", "Christena", "Christeen", "Charise", "Caterina", "Carley", "Candyce", "Arlena", "Ammie", "Yang", "Willette", "Vanita", "Tuyet", "Tiny", "Syreeta", "Silva", "Scott", "Ronald", "Penney", "Nyla", "Michal", "Maurice", "Maryam", "Marya", "Magen", "Ludie", "Loma", "Livia", "Lanell", "Kimberlie", "Julee", "Donetta", "Diedra", "Denisha", "Deane", "Dawne", "Clarine", "Cherryl", "Bronwyn", "Brandon", "Alla", "Valery", "Tonda", "Sueann", "Soraya", "Shoshana", "Shela", "Sharleen", "Shanelle", "Nerissa", "Micheal", "Meridith", "Mellie", "Maye", "Maple", "Magaret", "Luis", "Lili", "Leonila", "Leonie", "Leeanna", "Lavonia", "Lavera", "Kristel", "Kathey", "Kathe", "Justin", "Julian", "Jimmy", "Jann", "Ilda", "Hildred", "Hildegarde", "Genia", "Fumiko", "Evelin", "Ermelinda", "Elly", "Dung", "Doloris", "Dionna", "Danae", "Berneice", "Annice", "Alix", "Verena", "Verdie", "Tristan", "Shawnna", "Shawana", "Shaunna", "Rozella", "Randee", "Ranae", "Milagro", "Lynell", "Luise", "Louie", "Loida", "Lisbeth", "Karleen", "Junita", "Jona", "Isis", "Hyacinth", "Hedy", "Gwenn", "Ethelene", "Erline", "Edward", "Donya", "Domonique", "Delicia", "Dannette", "Cicely", "Branda", "Blythe", "Bethann", "Ashlyn", "Annalee", "Alline", "Yuko", "Vella", "Trang", "Towanda", "Tesha", "Sherlyn", "Narcisa", "Miguelina", "Meri", "Maybell", "Marlana", "Marguerita", "Madlyn", "Luna", "Lory", "Loriann", "Liberty", "Leonore", "Leighann", "Laurice", "Latesha", "Laronda", "Katrice", "Kasie", "Karl", "Kaley", "Jadwiga", "Glennie", "Gearldine", "Francina", "Epifania", "Dyan", "Dorie", "Diedre", "Denese", "Demetrice", "Delena", "Darby", "Cristie", "Cleora", "Catarina", "Carisa", "Bernie", "Barbera", "Almeta", "Trula", "Tereasa", "Solange", "Sheilah", "Shavonne", "Sanora", "Rochell", "Mathilde", "Margareta", "Maia", "Lynsey", "Lawanna", "Launa", "Kena", "Keena", "Katia", "Jamey", "Glynda", "Gaylene", "Elvina", "Elanor", "Danuta", "Danika", "Cristen", "Cordie", "Coletta", "Clarita", "Carmon", "Brynn", "Azucena", "Aundrea", "Angele", "Yi", "Walter", "Verlie", "Verlene", "Tamesha", "Silvana", "Sebrina", "Samira", "Reda", "Raylene", "Penni", "Pandora", "Norah", "Noma", "Mireille", "Melissia", "Maryalice", "Laraine", "Kimbery", "Karyl", "Karine", "Kam", "Jolanda", "Johana", "Jesusa", "Jaleesa", "Jae", "Jacquelyne", "Irish", "Iluminada", "Hilaria", "Hanh", "Gennie", "Francie", "Floretta", "Exie", "Edda", "Drema", "Delpha", "Bev", "Barbar", "Assunta", "Ardell", "Annalisa", "Alisia", "Yukiko", "Yolando", "Wonda", "Wei", "Waltraud", "Veta", "Tequila", "Temeka", "Tameika", "Shirleen", "Shenita", "Piedad", "Ozella", "Mirtha", "Marilu", "Kimiko", "Juliane", "Jenice", "Jen", "Janay", "Jacquiline", "Hilde", "Fe", "Fae", "Evan", "Eugene", "Elois", "Echo", "Devorah", "Chau", "Brinda", "Betsey", "Arminda"}
