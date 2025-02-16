function Time_PrintYear()
	local year_string = " (Year "..year..")" 
	return year_string
end

function DefaultParam(default, param)
	if param then
		return param
	else
		return default
	end
end

function Time_CPUSaver(save_interval, speedup, bias)	--returns 1 every save_interval; equivalent to something like this in R: plot(mod<-function(x){floor(x)%%10}, 0, 100)
	local fast_clock = floor(Universe_GameTime()*speedup)
	if bias then
		fast_clock = fast_clock + bias
	end
	local modulus = mod(fast_clock, save_interval)
	if modulus == 0 then
		return 1
	else
		return 0
	end
end

function Rule_RandomInterval(rule, timer, variant)
	local randomation = random_pseudo(-100000, 100000)
	local variation = variant*randomation/100000
	local newinterval = timer + variation
	Rule_Remove(rule)
	Rule_AddInterval(rule, newinterval)
	return newinterval
end

function Debug_TraceRuntime(function_string)
	local enable = 1
	if enable == 1 then
		print(""..function_string..", game time: "..Universe_GameTime())
	end
end

function Debug_year()
	return ""..year.."/"..gametime
end

function Debug_InstantPauseAndResume()  	--IT DOES NOTHING
  local num_human = 0
  local playerIndex = 0                                              
  while playerIndex < Universe_PlayerCount() do    
    if CPU_Exist_Smart(playerIndex) == 0 then
			num_human = num_human + 1
		end
    playerIndex = playerIndex + 1	
  end
  if num_human <= 1 then		--not a multiplayer game
  	Event_Start("Pause")
  	Event_Start("UnPause")
  end
  Rule_Remove("Debug_InstantPauseAndResume")
end

function Display_SystemTimeInInfoScreen()
	UI_SetTextLabelText("SpeechRecall", "lblsystemtime", ""..date("%Y-%m-%d %A %H:%M:%S").." ")
	Rule_RandomInterval("Display_SystemTimeInInfoScreen", 0.3, 0.01)
end

function UpdateSystemTimeInSeconds()		--Try to count game time in real seconds
	local currentdate = date("%Y-%m-%d %H:%M:%S")
	if currentdate ~= Global_LastDate[Universe_CurrentPlayer()+1] then
		Global_SecondsElapsed[Universe_CurrentPlayer()+1] = Global_SecondsElapsed[Universe_CurrentPlayer()+1] + 1
	end
	Global_LastDate[Universe_CurrentPlayer()+1] = currentdate
end

function time()  

---FX settings
	setGlareIntensity(glareintensity)
	
---Display System Time in Info Screen
	if Universe_GameTime() < 3 then
		Rule_AddInterval("Display_SystemTimeInInfoScreen", 1.8001)
	end
	
---avoidance settings
	if ignoreavoidance == 1 then
		Universe_SetAvoidance(0)
	end

  UI_SetTextLabelText("ResourceMenu", "lblyear", "Year "..year.."/"..gametime);   
  
  gametime = gametime - 1
  if gametime == 0 then
    gametime = 99
    year = year + 1
    
---Save game    
    if numPlayerhuman == 1 then
	    cyclesave = cyclesave + 1
	    if cyclesave == autosave then
	      Rule_AddInterval("salvataggio", 10)     
	    end          
	  end  
	  
---message	
		local playerself = Universe_CurrentPlayer()
		if date_parse("month") == 1 and date_parse("day") == 1 then
	  	if (Player_IsAlive(playerself) == 1) then
	  		if Player_GetRace(playerself) == Race_Hiigaran then
			  --if prioritamessaggio[Universe_CurrentPlayer() + 1] < 20 then
			    Sound_SpeechPlay("Data:sound/sfx/etg/year")
			    Subtitle_Add(Actor_FleetCommand,"Happy New Year! Remuneration available", 2.055)  --"Game Year, report available"
			  --end   
		  	elseif Player_GetRace(playerself) == Race_Vaygr then
			    Sound_SpeechPlay("Data:sound/sfx/etg/year")
			    Subtitle_Add(Actor_Makaan,"Happy New Year! Remuneration available", 2.055)  --"Game Year, report available"
		  	elseif Player_GetRace(playerself) == Race_Kadeshi then
			    Sound_SpeechPlay("Data:sound/sfx/etg/year")
			    Subtitle_Add(11,"Happy New Year! Remuneration available", 2.055)  --"Game Year, report available"
		  	elseif Player_GetRace(playerself) == Race_Raider then
			    Sound_SpeechPlay("Data:sound/sfx/etg/year")
			    Subtitle_Add(12,"Happy New Year! Alcohol available", 2.055)  --"Game Year, report available"
			  elseif Player_GetRace(playerself) == Race_Keeper then
			    Sound_SpeechPlay("Data:sound/sfx/etg/year")
			    Subtitle_Add(Actor_Keeper,"Happy New Year! Remuneration available", 2.055)
		 	 	end
		 	else
		    Sound_SpeechPlay("Data:sound/sfx/etg/year")
		    Subtitle_Add(Actor_Keeper,"Happy New Year! In the Heaven!", 2.055)  --"Game Year, report available"
	  	end
	  end
	   
    local playerIndex = 0
    local playerIndexList = 0
    while playerIndex < Universe_PlayerCount() do
      playerIndexList = playerIndex + 1
      if (Player_IsAlive(playerIndex) == 1) then
        if (Player_HasShipWithBuildQueue(playerIndex) == 1) then

---military rank remuneration		
					local PlayerLastRU = Player_GetRU(playerIndex)
          remuneration = 0	    
			    if gradoList[playerIndexList] == "ENSIGN       " then
			      Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (200 * rankremuneration))	
			      remuneration = floor(200 * rankremuneration)
			    elseif gradoList[playerIndexList] == "LIEUTENANT   " then
		        Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (600 * rankremuneration))	
		        remuneration = floor(600 * rankremuneration)
		      elseif gradoList[playerIndexList] == "COMMANDER    " then
		        Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (1000 * rankremuneration))	
		        remuneration = floor(1000 * rankremuneration)
		      elseif gradoList[playerIndexList] == "CAPTAIN      " then
		        Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (1400 * rankremuneration))	
		        remuneration = floor(1400 * rankremuneration)
		      elseif gradoList[playerIndexList] == "COMMODORE    " then
		        Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (1800 * rankremuneration))	
		        remuneration = floor(1800 * rankremuneration)
		      elseif gradoList[playerIndexList] == "ADMIRAL      " then
		        Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (2200 * rankremuneration))	
            remuneration = floor(2200 * rankremuneration)
		      elseif gradoList[playerIndexList] == "FLEET ADMIRAL" then
		        Player_SetRU(playerIndex, Player_GetRU(playerIndex) + (2600 * rankremuneration))	
		        remuneration = floor(2600 * rankremuneration)
		      end
		      local PlayerVariationInRU = Player_GetRU(playerIndex) - PlayerLastRU
		      --Rad General
			    if Player_GetRace(playerIndex) == Race_Raider then
			    	if Rad_GeneralList.General[playerIndexList] == 4 and Rad_GeneralList.Rank[playerIndexList] > 0 then
			    		Player_SetRU(playerIndex, Player_GetRU(playerIndex) + PlayerVariationInRU)
			    		remuneration = remuneration * 2
			    	end
			    end
		      
---diplomacy fee
          if diplomacy >= 1 then	      
            diplomacyListSummary[playerIndexList] = 0       		      
            for z = 0,(Universe_PlayerCount()-1),1 do
        	    if Player_IsAlive(z) == 1 and AreAllied(playerIndex, z) == 1 and z ~= playerIndex then  	        	         	    	   	    	  
        	    	diplomacyListSummary[playerIndexList] = diplomacyListSummary[playerIndexList] + ((scoreList[playerIndexList] - scoreList[z+1])*diplomacy)	       	    		        	        
        	    end 	    
            end     
            Player_SetRU(playerIndex, Player_GetRU(playerIndex) + diplomacyListSummary[playerIndexList])
            if Player_GetRU(playerIndex) < 0 then
              Player_SetRU(playerIndex, 0)            
            end                       	  
          end  
          
---Planets     
          Player_SetRU(playerIndex, Player_GetRU(playerIndex) + planetList[playerIndexList] + orbitalstationList[playerIndexList])	
          
---Debris
          popdebris = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk1")*1300) +
                (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk2")*1300) +
                (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk3")*1300) +
                (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk4")*1300) +
                (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk5")*1300)                 
          Player_SetRU(playerIndex, Player_GetRU(playerIndex) + popdebris)                       
		      
		      if playerIndex == Universe_CurrentPlayer() then       
          
            ruharvested = (Stats_GatheredRUs(playerIndex) + Stats_GatheredRUSalvage(playerIndex)) - Lastruharvested[playerIndexList]
            Lastruharvested[playerIndexList] = (Stats_GatheredRUs(playerIndex) + Stats_GatheredRUSalvage(playerIndex))
            
            ruspent = Stats_SpentRUs(playerIndex) - Lastruspent[playerIndexList]
            Lastruspent[playerIndexList] = Stats_SpentRUs(playerIndex)            
                 
	          UI_SetTextLabelText("YearMenu", "ruharvested", ""..ruharvested); 	   
	          UI_SetTextLabelText("YearMenu", "ruspent", "-"..ruspent);        
	          UI_SetTextLabelText("YearMenu", "fusion1", ""..megalithList[playerIndexList]); 
	          UI_SetTextLabelText("YearMenu", "fusion", ""..fusionList[playerIndexList]);	 
	          UI_SetTextLabelText("YearMenu", "lblmaintenance", "-"..maintenanceList[playerIndexList]);	          
	          UI_SetTextLabelText("YearMenu", "remuneration", ""..remuneration);  	          
	          UI_SetTextLabelText("YearMenu", "fusion2", ""..tradeListSummary[playerIndexList]); 	   
	          UI_SetTextLabelText("YearMenu", "bounty", ""..BountyRUSummary[playerIndexList]);
	          UI_SetTextLabelText("YearMenu", "diplomacy", ""..diplomacyListSummary[playerIndexList]);    
	          UI_SetTextLabelText("YearMenu", "fusion3", ""..planetList[playerIndexList]+orbitalstationList[playerIndexList]);  	          
	          UI_SetTextLabelText("UnitCapInfoPopup", "diplomacy", ""..diplomacyListSummary[playerIndexList]);    
	          UI_SetTextLabelText("UnitCapInfoPopup", "bounty", ""..BountyRUSummary[playerIndexList]);    
	          yearsummary = floor (megalithList[playerIndexList] + planetList[playerIndexList] + orbitalstationList[playerIndexList] + fusionList[playerIndexList] + tradeListSummary[playerIndexList] + BountyRUSummary[playerIndexList] + diplomacyListSummary[playerIndexList] - maintenanceList[playerIndexList] + remuneration + ruharvested - ruspent)
		        UI_SetTextLabelText("YearMenu", "yearsummary", ""..yearsummary);  	 
          end         
          
---Somma x calcolare onore
          Stats_ExtraGatheredRUs[playerIndexList] = fusionList[playerIndexList] + megalithList[playerIndexList] + planetList[playerIndexList] + orbitalstationList[playerIndexList] + tradeListSummary[playerIndexList] + BountyRUSummary[playerIndexList] + diplomacyListSummary[playerIndexList]
---fusion			    			
			    Player_SetRU(playerIndex, Player_GetRU(playerIndex) + fusionList[playerIndexList])   			    
			    fusionList[playerIndexList] = 0			           
---Megalith
          megalithList[playerIndexList] = 0		         
---Trade
          tradeListSummary[playerIndexList] = 0           	    		    	                   
---Bounty
          BountyRUSummary[playerIndexList] = 0
			  end
			end
			playerIndex = playerIndex + 1
		end	
---Maintenance
   	Rule_AddInterval("efficency", 1)                  
  
  	collectgarbage()	--does this help reduce lag?
  end  
end

function salvataggio()  
  if lastrList[Universe_CurrentPlayer() + 1] == -1 then   --evita che il salvataggio arrivi durante la cinematica 
    FE_SaveGameScreen()
    cyclesave = 0	
    Rule_Remove("salvataggio")         
  end	          	      
end

function accoladesinit()
	SetAccoladesVisible(0)
	if Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1] == -1 then
		Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1] = Universe_CurrentPlayer()
	end
	Rule_AddInterval("accolades", 0.21)
	Rule_Remove("accoladesinit")
end

function accolades()		--Let me introduce to you the PURE AWESOMENESS of Simplex!!!
	--print("accolades -- Start")
	--New UI buttons can finally turn off display or tally stats! Whoahhh~~~ One just feels different after 17 hours of sleep!!!
	if UI_IsNamedElementVisible("ResourceMenu", "iconyear1") == 1 or UI_IsNamedElementVisible("ResourceMenu", "iconyear2") == 1 then
		UI_SetElementVisible("ResourceMenu", "iconyear1", 0)
		UI_SetElementVisible("ResourceMenu", "iconyear2", 0)
		UI_SetElementVisible("ResourceMenu", "iconyear1alt", 1)
		UI_SetElementVisible("ResourceMenu", "iconyear2alt", 1)
		if UI_IsScreenActive("year1alt") == 1 then
			UI_SetButtonPressed("ResourceMenu", "iconyear1alt", 1)
		end
		if UI_IsScreenActive("year2alt") == 1 then
			UI_SetButtonPressed("ResourceMenu", "iconyear2alt", 1)
		end
		UI_SetElementPosition("ResourceMenu", "yearbutton_default", 14, 0)
		UI_SetElementSize("ResourceMenu", "yearbutton_default", 72, 13)
	end
	local SwitchingAccoladeStats = 0		--0 for do nothing, 1 for turning on, 2 for turning off
	local SwitchingAccoladeHiding = 0		--0 for do nothing, 1 for turning on, 2 for turning off
	if PlayerUI_ShowAccoladeStats[Universe_CurrentPlayer()+1] == 0 and UI_IsScreenActive("year1alt") == 1 then
		SwitchingAccoladeStats = 1
		local sum_accolades = 0
		local sum_RUs = 0
		for z, iCount in AccoladesStatsList do
			sum_accolades = sum_accolades + AccoladesStatsList[z][2][Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1]+1]
			sum_RUs = sum_RUs + AccoladesStatsList[z][3][Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1]+1]
		end
		sum_RUs = floor(sum_RUs)
		local plural_accolade = " accolades "
		if sum_accolades <= 1 then
			plural_accolade = " accolade "
		end
		local plural_RUs = " RUs "
		if sum_RUs <= 1 then
			plural_RUs = " RU "
		end
		if Player_IsAlive(Universe_CurrentPlayer()) == 1 then
			Subtitle_AddAccordingToRace(Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1],"<c=C2E08B>Viewing Accolade Stats: </c>"..GetPlayerNameWithColour(Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1]).."<c=C2E08B> has received "..sum_accolades..plural_accolade.."and "..sum_RUs..plural_RUs.."in total </c>",2.711)
		else
			Subtitle_AddAccordingToRace(Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1],""..GetPlayerNameWithColour(Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1]).."<c=C2E08B> has received "..sum_accolades..plural_accolade.."and "..sum_RUs..plural_RUs.."</c>",2.711)
		end
	elseif PlayerUI_ShowAccoladeStats[Universe_CurrentPlayer()+1] == 1 and UI_IsScreenActive("year1alt") == 0 then
		SwitchingAccoladeStats = 2
		if Player_IsAlive(Universe_CurrentPlayer()) == 1 then
			Subtitle_AddAccordingToRace(Universe_CurrentPlayer(),"<c=C2E08B>Accolade display switched back to normal mode </c>",2.711)
		end
		ClearAccoladesDisplay()		--clear the screen on exit
	end
	if PlayerUI_HideAccoladeDisplay[Universe_CurrentPlayer()+1] == 0 and UI_IsScreenActive("year2alt") == 1 then
		SwitchingAccoladeHiding = 1
		if Player_IsAlive(Universe_CurrentPlayer()) == 1 then
			Subtitle_AddAccordingToRace(Universe_CurrentPlayer(),"<c=C2E08B>Hiding all real-time accolade icons </c>",2.711)
		end
		if UI_ScreenIsActive("year1alt") == 0 then		--don't clear the screen when viewing Accolade Stats
			ClearAccoladesDisplay()		--kill the display immediately upon activating the "hiding" button
		end
	elseif PlayerUI_HideAccoladeDisplay[Universe_CurrentPlayer()+1] == 1 and UI_IsScreenActive("year2alt") == 1 then
		SwitchingAccoladeHiding = 2
		if Player_IsAlive(Universe_CurrentPlayer()) == 1 then
			Subtitle_AddAccordingToRace(Universe_CurrentPlayer(),"<c=C2E08B>Real-time accolade display resumed </c>",2.711)
		end
	end
	for i = 0, Universe_PlayerCount()-1, 1 do
		if i == Universe_CurrentPlayer() then
			if UI_IsScreenActive("year1alt") == 1 then
				PlayerUI_ShowAccoladeStats[i+1] = 1
			else
				PlayerUI_ShowAccoladeStats[i+1] = 0
			end
			--When an event is playing (i.e. movie mode, SP campaign intel), all screens are shut down by force, resulting in unwanted auto switching
			--So, use a global variable as a 2-state swtich instead, and always hide the screen (which only serves as an intermediate actuator) automatically after the state is switched (the new global variable is stored)
			if UI_IsScreenActive("year2alt") == 1 and PlayerUI_HideAccoladeDisplay[i+1] == 0 then
				PlayerUI_HideAccoladeDisplay[i+1] = 1
				UI_HideScreen("year2alt")
			elseif UI_IsScreenActive("year2alt") == 1 and PlayerUI_HideAccoladeDisplay[i+1] == 1 then
				PlayerUI_HideAccoladeDisplay[i+1] = 0
				UI_HideScreen("year2alt")
			end
			if PlayerUI_HideAccoladeDisplay[i+1] == 1 then
				UI_SetButtonPressed("ResourceMenu", "iconyear2alt", 1)
			elseif PlayerUI_HideAccoladeDisplay[i+1] == 0 then
				UI_SetButtonPressed("ResourceMenu", "iconyear2alt", 0)
			end
		end
	end
	
	--Compare Statistics
	local DeltaTotalKills = {0,0,0,0,0,0}
	local DeltaTotalKillsInRUs = {0,0,0,0,0,0}
	local DeltaTotalSquadKillsInRUs = {0,0,0,0,0,0}
	local DeltaTotalLosses = {0,0,0,0,0,0}
	local DeltaTotalLossesInRUs = {0,0,0,0,0,0}
	local DeltaTotalSquadLossesInRUs = {0,0,0,0,0,0}
	local DeltaEnemyShipsCaptured = {0,0,0,0,0,0}
	local DeltaEnemyShipsCapturedInRUs = {0,0,0,0,0,0}
	for i = 0, Universe_PlayerCount()-1, 1 do
		DeltaTotalKills[i+1] = Stats_TotalKills(i) - LastTotalKills[i+1]
		DeltaTotalKillsInRUs[i+1] = Stats_TotalKillsInRUs(i) - LastTotalKillsInRUs[i+1]
		DeltaTotalSquadKillsInRUs[i+1] = Stats_TotalSquadKillsInRUs(i) - LastTotalSquadKillsInRUs[i+1]
		DeltaTotalLosses[i+1] = Stats_TotalLosses(i) - LastTotalLosses[i+1]
		DeltaTotalLossesInRUs[i+1] = Stats_TotalLossesInRUs(i) - LastTotalLossesInRUs[i+1]
		DeltaTotalSquadLossesInRUs[i+1] = Stats_TotalSquadLossesInRUs(i) - LastTotalSquadLossesInRUs[i+1]
		DeltaEnemyShipsCaptured[i+1] = Stats_EnemyShipsCaptured(i) - LastEnemyShipsCaptured[i+1]
		DeltaEnemyShipsCapturedInRUs[i+1] = Stats_EnemyShipsCapturedInRUs(i) - LastEnemyShipsCapturedInRUs[i+1]
	end
	
	--Clear Accolades Display after 3 seconds
	if AccoladesFunctionTiming[Universe_CurrentPlayer()+1] > 3 then
		AccoladesFunctionTiming[Universe_CurrentPlayer()+1] = 0
		if UI_ScreenIsActive("year1alt") == 0 then		--don't clear the screen when viewing Accolade Stats
			ClearAccoladesDisplay()
		end
	end
	
	--Main Function
	local CheapestTarget = 64	--blood swarmer
	local SpecialTargetMinValue = 1000
	local playerIndex = 0
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
    	--Bounty
    	if DeltaTotalKills[playerIndexList] > 0 and DeltaTotalKillsInRUs[playerIndexList] >= CheapestTarget then
    		AccoladesAddRU(playerIndex, DeltaTotalKillsInRUs[playerIndexList]*0.15*incentive)
				--First Blood
    		if FirstBloodDrawn == 0 then
    			FirstBloodDrawn = 1
					AccoladesExecute(playerIndex, "firstblood", 500*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> draws the First Blood</c>")
				end
			elseif DeltaTotalLosses[playerIndexList] == 1 and FindSpecialWeaponsDetonated(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 1 then	--kill with special weapon
				local value_max = 0
				for z = 0, Universe_PlayerCount()-1, 1 do
					local value_temp = 0
					if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
						if DeltaTotalSquadLossesInRUs[z+1] >= SpecialTargetMinValue and DeltaTotalLosses[z+1] == 1 then
							value_temp = DeltaTotalLossesInRUs[z+1]
							if value_temp > value_max then
								value_max = value_temp
							end
						end
					end
				end
				if value_max > SpecialTargetMinValue then
					AccoladesAddRU(playerIndex, value_max*0.15*incentive)
					--First Blood with special weapon
	    		if FirstBloodDrawn == 0 then
	    			FirstBloodDrawn = 1
						AccoladesExecute(playerIndex, "firstblood", 500*0.5*incentive)
						AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> draws the First Blood</c>")
					end
				end
    	end
    	
    	--Multiple Kills
    	if DeltaTotalKillsInRUs[playerIndexList] >= CheapestTarget then
    		if DeltaTotalKills[playerIndexList] >= 2 then
					AccoladesExecute(playerIndex, "doublekill", 300*0.5*incentive)
    		end
    		if DeltaTotalKills[playerIndexList] >= 3 then
					AccoladesExecute(playerIndex, "triplekill", 500*0.5*incentive)
    		end
    		if DeltaTotalKills[playerIndexList] >= 4 then
					AccoladesExecute(playerIndex, "quatrakill", 1000*0.5*incentive)
    		end
    		if DeltaTotalKills[playerIndexList] >= 5 then
					AccoladesExecute(playerIndex, "ultrakill", 2000*0.5*incentive)
    		end
    		if DeltaTotalKills[playerIndexList] >= 6 then
					AccoladesExecute(playerIndex, "teamkill", 3000*0.5*incentive)
    		end
    	end
    	
    	--Spree
			if DeltaTotalSquadLossesInRUs[playerIndexList] < CheapestTarget or DeltaTotalLosses[playerIndexList] == 0 or (DeltaTotalLosses[playerIndexList] == 1 and FindSpecialWeaponsDetonated(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 1) then
				--Killing Spree
				if DeltaTotalSquadKillsInRUs[playerIndexList] >= CheapestTarget then		--normal count kill
					KillingSpreeTotalKills[playerIndexList] = KillingSpreeTotalKills[playerIndexList] + DeltaTotalKills[playerIndexList]
				elseif DeltaTotalLosses[playerIndexList] == 1 and FindSpecialWeaponsDetonated(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 1 then	--count kill with special weapon
					local value_max = 0
					for z = 0, Universe_PlayerCount()-1, 1 do
						local value_temp = 0
						if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
							if DeltaTotalSquadLossesInRUs[z+1] >= SpecialTargetMinValue and DeltaTotalLosses[z+1] == 1 then
								value_temp = DeltaTotalLossesInRUs[z+1]
								if value_temp > value_max then
									value_max = value_temp
								end
							end
						end
					end
					if value_max > SpecialTargetMinValue then
						KillingSpreeTotalKills[playerIndexList] = KillingSpreeTotalKills[playerIndexList] + 1
					end
				end
				if KillingSpreeTotalKills[playerIndexList] >= 5 and KillingSpreeLevel[playerIndexList] < 1 then
					KillingSpreeLevel[playerIndexList] = 1
					AccoladesExecute(playerIndex, "killingspree", 300*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is on a Killing Spree</c>")
				end
				if KillingSpreeTotalKills[playerIndexList] >= 10 and KillingSpreeLevel[playerIndexList] < 2 then
					KillingSpreeLevel[playerIndexList] = 2
					AccoladesExecute(playerIndex, "rampage", 500*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is on a Rampage</c>")
				end
				if KillingSpreeTotalKills[playerIndexList] >= 15 and KillingSpreeLevel[playerIndexList] < 3 then
					KillingSpreeLevel[playerIndexList] = 3
					AccoladesExecute(playerIndex, "relentless", 1000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is Relentless</c>")
				end
				if KillingSpreeTotalKills[playerIndexList] >= 20 and KillingSpreeLevel[playerIndexList] < 4 then
					KillingSpreeLevel[playerIndexList] = 4
					AccoladesExecute(playerIndex, "unstoppable", 2000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is Unstoppable</c>")
				end
				if KillingSpreeTotalKills[playerIndexList] >= 25 and KillingSpreeLevel[playerIndexList] < 5 then
					KillingSpreeLevel[playerIndexList] = 5
					AccoladesExecute(playerIndex, "slayer", 3000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is the Slayer</c>")
				end
				--Exlosive Spree
				if DeltaTotalSquadKillsInRUs[playerIndexList]/DeltaTotalKills[playerIndexList] >= 2000 then		--normal count explosive kill
					ExplosiveSpreeTotalKills[playerIndexList] = ExplosiveSpreeTotalKills[playerIndexList] + DeltaTotalKills[playerIndexList]
				elseif DeltaTotalLosses[playerIndexList] == 1 and FindSpecialWeaponsDetonated(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 1 then	--count kill with special weapon
					local value_max = 0
					for z = 0, Universe_PlayerCount()-1, 1 do
						local value_temp = 0
						if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
							if DeltaTotalSquadLossesInRUs[z+1] >= SpecialTargetMinValue and DeltaTotalLosses[z+1] == 1 then
								value_temp = DeltaTotalLossesInRUs[z+1]
								if value_temp > value_max then
									value_max = value_temp
								end
							end
						end
					end
					if value_max > 2000 then
						ExplosiveSpreeTotalKills[playerIndexList] = ExplosiveSpreeTotalKills[playerIndexList] + 1
					end
				end
				if ExplosiveSpreeTotalKills[playerIndexList] >= 5 and ExplosiveSpreeLevel[playerIndexList] < 1 then
					ExplosiveSpreeLevel[playerIndexList] = 1
					AccoladesExecute(playerIndex, "explosivespree", 10000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is on an Explosive Spree</c>")
				end
				if ExplosiveSpreeTotalKills[playerIndexList] >= 10 and ExplosiveSpreeLevel[playerIndexList] < 2 then
					ExplosiveSpreeLevel[playerIndexList] = 2
					AccoladesExecute(playerIndex, "demolitionexpert", 20000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is a Demolitions Expert</c>")
				end
				if ExplosiveSpreeTotalKills[playerIndexList] >= 15 and ExplosiveSpreeLevel[playerIndexList] < 3 then
					ExplosiveSpreeLevel[playerIndexList] = 3
					AccoladesExecute(playerIndex, "hurtlocker", 50000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> calls in the Hurt Locker</c>")
				end
				--Sniping Spree
				if DeltaTotalKillsInRUs[playerIndexList] < 750 and DeltaTotalKillsInRUs[playerIndexList] >= CheapestTarget and DeltaTotalKills[playerIndexList] == 1 then
					SnipingSpreeTotalKills[playerIndexList] = SnipingSpreeTotalKills[playerIndexList] + DeltaTotalKills[playerIndexList]
				end
				if SnipingSpreeTotalKills[playerIndexList] >= 5 and SnipingSpreeLevel[playerIndexList] < 1 then
					SnipingSpreeLevel[playerIndexList] = 1
					AccoladesExecute(playerIndex, "snipingspree", 300*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is on a Sniping Spree</c>")
				end
				if SnipingSpreeTotalKills[playerIndexList] >= 10 and SnipingSpreeLevel[playerIndexList] < 2 then
					SnipingSpreeLevel[playerIndexList] = 2
					AccoladesExecute(playerIndex, "marksman", 500*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is a Marksman</c>")
				end
				if SnipingSpreeTotalKills[playerIndexList] >= 15 and SnipingSpreeLevel[playerIndexList] < 3 then
					SnipingSpreeLevel[playerIndexList] = 3
					AccoladesExecute(playerIndex, "sharpshooter", 1000*0.5*incentive)
					AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> is a Sharpshooter</c>")
				end
				--Artillery Shot
	    	if DeltaTotalKillsInRUs[playerIndexList] >= 5000 and DeltaTotalKills[playerIndexList] == 1 then		--normal artillery shot
					AccoladesExecute(playerIndex, "artillerystrike", DeltaTotalKillsInRUs[playerIndexList]*0.2*incentive)
				elseif DeltaTotalLosses[playerIndexList] == 1 and FindSpecialWeaponsDetonated(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 1 then	--kill with special weapon
					local value_max = 0
					for z = 0, Universe_PlayerCount()-1, 1 do
						local value_temp = 0
						if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
							if DeltaTotalSquadLossesInRUs[z+1] >= SpecialTargetMinValue and DeltaTotalLosses[z+1] == 1 then
								value_temp = DeltaTotalLossesInRUs[z+1]
								if value_temp > value_max then
									value_max = value_temp
								end
							end
						end
					end
					if value_max > 5000 then
						AccoladesExecute(playerIndex, "artillerystrike", value_max*0.2*incentive)
					end
	    	end
	    --Streak
			elseif DeltaTotalSquadLossesInRUs[playerIndexList] >= SpecialTargetMinValue and FindExceptionsLostInRUs(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 0 and DeltaTotalLosses[playerIndexList] == 1 then			--check if killed by a special weapon, copied from "normal no joy"
				if KillingSpreeLevel[playerIndexList] + ExplosiveSpreeLevel[playerIndexList] + SnipingSpreeLevel[playerIndexList] > 0 then
					local streakshutdown = 0
					for z = 0, Universe_PlayerCount()-1, 1 do		--No Joy
						if Player_IsAlive(z) == 1 and z~= playerIndex then
							if DeltaTotalLosses[z+1] == 1 and FindSpecialWeaponsDetonated(z, DeltaTotalSquadLossesInRUs[z+1]) == 1 then		--indeed killed by special weapon
								streakshutdown = streakshutdown + 1
								AccoladesExecute(z, "nojoy", 300*(KillingSpreeLevel[playerIndexList]+ExplosiveSpreeLevel[playerIndexList]+SnipingSpreeLevel[playerIndexList])*0.5*incentive)
								AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5>'s streak shut down by </c>"..GetPlayerNameWithColour(z))
							elseif DeltaTotalSquadKillsInRUs[z+1] >= DeltaTotalSquadLossesInRUs[playerIndexList] and DeltaTotalKills[z+1] >= DeltaTotalLosses[playerIndexList] then		--not really killed by special weapon
								streakshutdown = streakshutdown + 1
								AccoladesExecute(z, "nojoy", 300*(KillingSpreeLevel[playerIndexList]+ExplosiveSpreeLevel[playerIndexList]+SnipingSpreeLevel[playerIndexList])*0.5*incentive)
								AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5>'s streak shut down by </c>"..GetPlayerNameWithColour(z))
							end
						end
					end
					if streakshutdown == 0 then		--Suicide
						AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> screwed up, concluding a streak.</c>")
					end
				end
				--Spree Reset
				KillingSpreeTotalKills[playerIndexList] = 0
				KillingSpreeLevel[playerIndexList] = 0
				ExplosiveSpreeTotalKills[playerIndexList] = 0
				ExplosiveSpreeLevel[playerIndexList] = 0
				SnipingSpreeTotalKills[playerIndexList] = 0
				SnipingSpreeLevel[playerIndexList] = 0
			elseif FindExceptionsLostInRUs(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 0 then		--normal no joy
				if KillingSpreeLevel[playerIndexList] + ExplosiveSpreeLevel[playerIndexList] + SnipingSpreeLevel[playerIndexList] > 0 then
					local streakshutdown = 0
					for z = 0, Universe_PlayerCount()-1, 1 do		--No Joy
						if Player_IsAlive(z) == 1 and z~= playerIndex then
							if DeltaTotalSquadKillsInRUs[z+1] >= DeltaTotalSquadLossesInRUs[playerIndexList]-10 and DeltaTotalKills[z+1] >= DeltaTotalLosses[playerIndexList] then
								streakshutdown = streakshutdown + 1
								AccoladesExecute(z, "nojoy", 300*(KillingSpreeLevel[playerIndexList]+ExplosiveSpreeLevel[playerIndexList]+SnipingSpreeLevel[playerIndexList])*0.5*incentive)
								AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5>'s streak shut down by </c>"..GetPlayerNameWithColour(z))
							end
						end
					end
					if streakshutdown == 0 then		--Suicide
						AccoladesSubtitle(""..GetPlayerNameWithColour(playerIndex).."<c=cef6f5> screwed up, concluding a streak.</c>")
					end
				end
				--Spree Reset
				KillingSpreeTotalKills[playerIndexList] = 0
				KillingSpreeLevel[playerIndexList] = 0
				ExplosiveSpreeTotalKills[playerIndexList] = 0
				ExplosiveSpreeLevel[playerIndexList] = 0
				SnipingSpreeTotalKills[playerIndexList] = 0
				SnipingSpreeLevel[playerIndexList] = 0
			end
			
			--Assist
			if Player_CanResearch(playerIndex, "hasallies" ) == 1 then
				if LastTotalKillsInRUs[playerIndexList] >= CheapestTarget and DeltaTotalKills[playerIndexList] > 0 then
					local assistconform = 0
					for z = 0, Universe_PlayerCount()-1, 1 do
						if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 1 then
							if LastTotalKillsInRUs[z+1] >= CheapestTarget and DeltaTotalKills[z+1] > 0 then
								assistconform = assistconform + 1
							end
						end
					end
					if assistconform > 0 then
						AccoladesExecute(playerIndex, "assist", 250*0.5*incentive)
					end
				end
			end
			
			--complete Revenge
			if RevengeTarget[playerIndexList] ~= -1 then
				if DeltaTotalKillsInRUs[playerIndexList] >= CheapestTarget and DeltaTotalKills[playerIndexList] > 0 then		--normal revenge
					for z = 0, Universe_PlayerCount()-1, 1 do
						if RevengeTarget[playerIndexList] == z then
							if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
								if DeltaTotalLossesInRUs[z+1] <= DeltaTotalKillsInRUs[playerIndexList] + 10 and DeltaTotalLosses[z+1] <= DeltaTotalKills[playerIndexList] then
									AccoladesExecute(playerIndex, "revenge", RevengeValue[playerIndexList]*0.2*incentive)
									RevengeTarget[playerIndexList] = -1
									RevengeValue[playerIndexList] = 0
								end
							end
						end
					end
				elseif DeltaTotalLosses[playerIndexList] == 1 and FindSpecialWeaponsDetonated(playerIndex, DeltaTotalSquadLossesInRUs[playerIndexList]) == 1 then	--kill with a special weapon, copied from "normal revenge"
					for z = 0, Universe_PlayerCount()-1, 1 do
						if RevengeTarget[playerIndexList] == z then
							if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
								if DeltaTotalSquadLossesInRUs[z+1] >= SpecialTargetMinValue and DeltaTotalLosses[z+1] == 1 then
									AccoladesExecute(playerIndex, "revenge", RevengeValue[playerIndexList]*0.2*incentive)
									RevengeTarget[playerIndexList] = -1
									RevengeValue[playerIndexList] = 0
								end
							end
						end
					end
				end
			end
			--remember Revenge target
			if DeltaTotalSquadLossesInRUs[playerIndexList] >= SpecialTargetMinValue and DeltaTotalLosses[playerIndexList] == 1 then			--check if killed by a special weapon, copied from "normal remember revenge target"
				for z = 0, Universe_PlayerCount()-1, 1 do
					if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
						if DeltaTotalLosses[z+1] == 1 and FindSpecialWeaponsDetonated(z, DeltaTotalSquadLossesInRUs[z+1]) == 1 then		--indeed killed by special weapon
							RevengeTarget[playerIndexList] = z
							RevengeValue[playerIndexList] = DeltaTotalLossesInRUs[playerIndexList]
						elseif DeltaTotalKillsInRUs[z+1] >= DeltaTotalLossesInRUs[playerIndexList] and DeltaTotalKills[z+1] >= DeltaTotalLosses[playerIndexList] then		--not really killed by special weapon
							RevengeTarget[playerIndexList] = z
							RevengeValue[playerIndexList] = DeltaTotalLossesInRUs[playerIndexList]
						end
					end
				end
			elseif DeltaTotalLossesInRUs[playerIndexList] >= CheapestTarget and DeltaTotalLosses[playerIndexList] > 0 then		--normal remember revenge target
				for z = 0, Universe_PlayerCount()-1, 1 do
					if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
						if DeltaTotalKillsInRUs[z+1] >= DeltaTotalLossesInRUs[playerIndexList]-10 and DeltaTotalKills[z+1] >= DeltaTotalLosses[playerIndexList] then
							RevengeTarget[playerIndexList] = z
							RevengeValue[playerIndexList] = DeltaTotalLossesInRUs[playerIndexList]
						end
					end
				end
			end
			
			--Ship Capture
			if DeltaEnemyShipsCaptured[playerIndexList] > 0 then
				local captureru = DeltaEnemyShipsCapturedInRUs[playerIndexList]*0.25*incentive
				if captureru < 1000 then
					captureru = 1000
				end
				AccoladesExecute(playerIndex, "flagcapture", captureru)
			end
			
			--Mutually Assured Destruction
			if DeltaTotalKillsInRUs[playerIndexList] >= CheapestTarget and DeltaTotalKills[playerIndexList] > 0 and DeltaTotalLossesInRUs[playerIndexList] >= CheapestTarget and DeltaTotalLosses[playerIndexList] > 0 then
				AccoladesExecute(playerIndex, "aftermath", (DeltaTotalKillsInRUs[playerIndexList]+DeltaTotalLossesInRUs[playerIndexList])*0.2*incentive)
			end
			
		end
		playerIndex = playerIndex + 1
	end

	--Ship Repair
	if AccoladesFunctionSaving == 0 then
		SobGroup_Create("RepairingForAccoladeSOB")
		SobGroup_Clear("RepairingForAccoladeSOB")
		Update_AllShips()
		if SobGroup_Count("AllShips") > 0 then
			if SobGroup_IsDoingAbility("AllShips", AB_Repair) == 1 then
				SobGroup_GetSobGroupRepairingGroup("AllShips", "RepairingForAccoladeSOB")
			end
		end
		local playerIndex = 0
	  while playerIndex < Universe_PlayerCount() do
	  	if Player_IsAlive(playerIndex) == 1 then
				local repairer = 0
	  		if SobGroup_Empty("RepairingForAccoladeSOB") == 0 then
					repairer = repairer + SobGroup_CountByPlayer("RepairingForAccoladeSOB", playerIndex)
				end
				if Player_GetRace(playerIndex) == Race_Vaygr and Player_HasResearch(playerIndex, "RepairBeam" ) == 1 then
					repairer = repairer + Temp_GlobalVariable.RepairBeamKiddies[playerIndex+1]
				end
				if repairer > 0 then
					AccoladesExecute(playerIndex, "repair", repairer*10*incentive)
				end
			end
			playerIndex = playerIndex + 1
		end
	end

	--Final Blow
	local playerIndex = 0
	local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1
		if LastAliveOrNot[playerIndexList] == 1 and Player_IsAlive(playerIndex) == 0 then
			if RevengeTarget[playerIndexList] ~= -1 then
				local z = RevengeTarget[playerIndexList]
				if Player_IsAlive(z) == 1 and z~= playerIndex and AreAllied(z, playerIndex) == 0 then
					local ru = Stats_TotalKillsInRUs(playerIndex)*0.05*incentive
					if ru < 1000 then
						ru = 1000
					elseif ru > 105000 then
						ru = 105000
					end
					AccoladesExecute(z, "finalblow", ru)
				end
			end
		end
		playerIndex = playerIndex + 1
	end

	--Store Statistics
	for i = 0, Universe_PlayerCount()-1, 1 do
		LastTotalKills[i+1] = Stats_TotalKills(i)
		LastTotalKillsInRUs[i+1] = Stats_TotalKillsInRUs(i)
		LastTotalSquadKillsInRUs[i+1] = Stats_TotalSquadKillsInRUs(i)
		LastTotalLosses[i+1] = Stats_TotalLosses(i)
		LastTotalLossesInRUs[i+1] = Stats_TotalLossesInRUs(i)
		LastTotalSquadLossesInRUs[i+1] = Stats_TotalSquadLossesInRUs(i)
		LastEnemyShipsCaptured[i+1] = Stats_EnemyShipsCaptured(i)
		LastEnemyShipsCapturedInRUs[i+1] = Stats_EnemyShipsCapturedInRUs(i)
		LastAliveOrNot[i+1] = Player_IsAlive(i)
	end
	
	--timing for the duration of accolades diplayed
	local duration = Rule_RandomInterval("accolades", 0.26, 0.05)
	
	if UI_IsScreenActive("Accolades") == 1 then
		AccoladesFunctionTiming[Universe_CurrentPlayer()+1] = AccoladesFunctionTiming[Universe_CurrentPlayer()+1] + duration
	end
	--free running timer
	if AccoladesFunctionSaving > 3 + duration then
		AccoladesFunctionSaving = 0
	else
		AccoladesFunctionSaving = AccoladesFunctionSaving + duration
	end
	
	--New Function: Display Accolade Stats in Game!
	if UI_ScreenIsActive("year1alt") == 1 then
		ClearAccoladesDisplay()
		Accolade_ShowPlayerStatsInGame(Haxor_CurrentSelectedPlayer[Universe_CurrentPlayer()+1])
	end
	
	--print("accolades -- End")
end

function ClearAccoladesDisplay()
	SetAccoladesVisible(0)
	UI_SetElementVisible("Accolades", "mescaccolades", 0)
	UI_SetElementVisible("Accolades", "sprees", 0)
	UI_SetElementVisible("Accolades", "multikills", 0)
	UI_SetScreenVisible("Accolades", 0)
	Rule_Remove("ClearAccoladesDisplay")
end

function SetAccoladesVisible(bool)
	for z, iCount in AccoladesCountList do
		UI_SetElementVisible("Accolades", AccoladesCountList[z][1], bool)
		AccoladesCountList[z][2][Universe_CurrentPlayer()+1] = 0
	end
end

function AccoladesExecute(playerIndex, type, bounty)
	local playerIndexList = playerIndex + 1
	local serial = 1
	for z, iCount in AccoladesCountList do
		if AccoladesCountList[z][1] == type then		--What kind of accolade is this? Locate it in the list
			serial = z
		end
	end
	if bounty ~= nil then
		AccoladesAddRU(playerIndex, bounty)
		--Accolade Stats, it would be nice if it can be recalled from the Hax Console
		AccoladesStatsList[serial][2][playerIndexList] = AccoladesStatsList[serial][2][playerIndexList] + 1		--total number of this accolade
		AccoladesStatsList[serial][3][playerIndexList] = AccoladesStatsList[serial][3][playerIndexList] + bounty		--total RUs earned from this accolade
		if playerIndex == Universe_CurrentPlayer() then		--display accolades only for the current player
			if PlayerUI_HideAccoladeDisplay[playerIndexList] == 0 or UI_ScreenIsActive("year1alt") == 1 then		--when viewing one's own Accolade Stats, one can always hear the sound
				UI_PlaySound("SFX_accolade")
			end
			if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 and PlayerUI_HideAccoladeDisplay[playerIndexList] == 0 then		--display accolade icons only when the player wants to see them
				UI_SetScreenEnabled("Accolades", 1)
				UI_SetScreenVisible("Accolades", 1)
				UI_SetElementVisible("Accolades", "mescaccolades", 1)
				UI_SetElementVisible("Accolades", "sprees", 1)
				UI_SetElementVisible("Accolades", "multikills", 1)
				UI_SetElementVisible("Accolades", type, 1)
				UI_SetTextLabelText("Accolades", ""..type.."bounty", "+"..floor(bounty))
				--count accolades overlapped
				UI_SetTextLabelText("Accolades", ""..type.."count", "")
				AccoladesCountList[serial][2][playerIndexList] = AccoladesCountList[serial][2][playerIndexList] + 1
				if AccoladesCountList[serial][2][playerIndexList] > 1 then
					UI_SetTextLabelText("Accolades", ""..type.."count", "x"..AccoladesCountList[serial][2][playerIndexList].." ")
				else
					UI_SetTextLabelText("Accolades", ""..type.."count", "")
				end
				--reset timer for things have changed
				AccoladesFunctionTiming[Universe_CurrentPlayer()+1] = 0
			end
		end
	end
end

function Accolade_ShowPlayerStatsInGame(playerIndex)
	local playerIndexList = playerIndex + 1
	UI_SetScreenEnabled("Accolades", 1)
	UI_SetScreenVisible("Accolades", 1)
	UI_SetElementVisible("Accolades", "mescaccolades", 1)
	UI_SetElementVisible("Accolades", "sprees", 1)
	UI_SetElementVisible("Accolades", "multikills", 1)
	for z, iCount in AccoladesStatsList do
		UI_SetElementVisible("Accolades", AccoladesStatsList[z][1], 1)
		UI_SetTextLabelText("Accolades", ""..AccoladesStatsList[z][1].."count", "x"..AccoladesStatsList[z][2][playerIndexList].." ")
		UI_SetTextLabelText("Accolades", ""..AccoladesStatsList[z][1].."bounty", "+"..floor(AccoladesStatsList[z][3][playerIndexList]))
	end
end

function Accolade_PrintPlayerStats(playerIndex)
	if incentive > 0 then
		local playerIndexList = playerIndex + 1
		local player_name = "player index: "..playerIndex
		if CPULODList[playerIndexList] ~= " " then
			player_name = CPULODList[playerIndexList]
		end
		print("===== Accolade Stats for "..player_name..", game year: "..year.." =====")
		local sum_accolades = 0
		local sum_RUs = 0
		local AccoladeNamesToPrint = {
		{"doublekill","Double Kill"}, {"triplekill","Triple Kill"}, {"quatrakill","Quatra Kill"}, {"ultrakill","Ultra Kill"}, {"teamkill","Team Kill"}, 
		{"killingspree","Killing Spree"}, {"rampage","Rampage"}, {"relentless","Relentless"}, {"unstoppable","Unstoppable"}, {"slayer","Slayer"}, 
		{"explosivespree","Explosive Spree"}, {"demolitionexpert","Demolition Expert"}, {"hurtlocker","Hurt Locker"}, 
		{"snipingspree","Sniping Spree"}, {"marksman","Marksman"}, {"sharpshooter","Sharpshooter"}, 
		{"nojoy","No Joy"}, {"artillerystrike","Artillery Shot"}, {"repair","Ship Repair"}, {"revenge","Revenge"}, {"assist","Assist"}, {"aftermath","MAD"}, {"flagcapture","Ship Capture"}, {"firstblood","First Blood"}, {"finalblow","Final Blow"}}
		for z, iCount in AccoladeNamesToPrint do		--printing according to the sorting of this list
			if AccoladeNamesToPrint[z][1] == "killingspree" then
				print("-------")
			elseif AccoladeNamesToPrint[z][1] == "explosivespree" then
				print("-------")
			elseif AccoladeNamesToPrint[z][1] == "snipingspree" then
				print("-------")
			elseif AccoladeNamesToPrint[z][1] == "nojoy" then
				print("-------")
			end
			for y, iCount in AccoladesStatsList do		--now retrieve the stats from the database
				if AccoladeNamesToPrint[z][1] == AccoladesStatsList[y][1] then
					local StringLengthAdjustments = "\t"
					if strlen(AccoladeNamesToPrint[z][2]) >= strlen("Explosive Spree") then
						StringLengthAdjustments = "\t"
					elseif strlen(AccoladeNamesToPrint[z][2]) >= strlen("Rampage") then
						StringLengthAdjustments = "\t\t"
					else
						StringLengthAdjustments = "\t\t\t"
					end
					print(""..AccoladeNamesToPrint[z][2]..StringLengthAdjustments.." - total number: "..AccoladesStatsList[y][2][playerIndexList]..", \t total RUs: "..floor(AccoladesStatsList[y][3][playerIndexList]))
					sum_accolades = sum_accolades + AccoladesStatsList[y][2][playerIndexList]
					sum_RUs = sum_RUs + floor(AccoladesStatsList[y][3][playerIndexList])
				end
			end
		end
		local RaceToPrint = "a new race seriously?!"
		if Player_GetRace(playerIndex) == Race_Hiigaran then
			RaceToPrint = "Hiigaran"
		elseif Player_GetRace(playerIndex) == Race_Vaygr then
			RaceToPrint = "Vaygr"
		elseif Player_GetRace(playerIndex) == Race_Kadeshi then
			RaceToPrint = "Kadeshi"
		elseif Player_GetRace(playerIndex) == Race_Raider then
			RaceToPrint = "Turanic Raiders"
		elseif Player_GetRace(playerIndex) == Race_Keeper then
			RaceToPrint = "Progenitor"
		end
		local wtf = "Human"
		if Player_HasResearch(playerIndex, "isai" ) == 1 then
			if CPULODvalueList[playerIndexList] == 0 then
				wtf = "CPU (Easy)"
			elseif CPULODvalueList[playerIndexList] == 1 then
				wtf = "CPU (Standard)"
			elseif CPULODvalueList[playerIndexList] == 2 then
				wtf = "CPU (Hard)"
			elseif CPULODvalueList[playerIndexList] == 3 then
				wtf = "CPU (Expert)"
			end
		end
		print("-------")
		print("Summary \t\t - total number: "..sum_accolades..", \t total RUs: "..sum_RUs)
		print("This is a "..wtf.." player playing "..RaceToPrint)
		print("========== (End of Accolade Stats) ==========")
	end
end

function AccoladesSubtitle(text)
	if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
		local display_time = 3
		if PlayerUI_HideAccoladeDisplay[Universe_CurrentPlayer()+1] == 1 then
			display_time = 0
		else	--no subtitle when accolade is hidden
			Subtitle_Message(""..text.."", display_time)		--<c=cef6f5></c>
		end
	end
end

function AccoladesAddRU(playerIndex, bountyrus)
	local plusbounty = floor(bountyrus)
	Player_SetRU(playerIndex, Player_GetRU(playerIndex) + plusbounty)
	BountyRUSummary[playerIndex+1] = BountyRUSummary[playerIndex+1] + plusbounty
	--print(""..plusbounty.." RUs added to playerIndex: "..playerIndex..", game time: "..Universe_GameTime())
end

function FindExceptionsLostInRUs(playerIndex, LostInRUs)
	local exception = 0
	if Player_GetRace(playerIndex) == Race_Raider then
		if LostInRUs == 9999 or 	-- exceptions for raider scaffold
		LostInRUs == 7499 or 
		LostInRUs == 2499 or 
		LostInRUs == 3999 or 
		LostInRUs == 7999 or 
		LostInRUs == 499 or		-- exceptions for missiles
		LostInRUs == 2999	or
		LostInRUs == 999 or
		LostInRUs == 1999 then
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Hiigaran then
		if LostInRUs == 19999 or 		-- exceptions for missiles
		LostInRUs == 2999 or 
		LostInRUs == 499 or 
		LostInRUs == 999 then
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
		if LostInRUs == 1999 or 		-- exceptions for missiles
		LostInRUs == 499 or 
		LostInRUs == 999 then
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Keeper then
		if LostInRUs == 5999 then 		-- exceptions for missiles
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		if LostInRUs == 499 or 		-- exceptions for missiles
		LostInRUs == 2999 then
			exception = 1
		end
	end
	return exception
end

function FindSpecialWeaponsDetonated(playerIndex, LostInRUs)
	local exception = 0
	if Player_GetRace(playerIndex) == Race_Raider then
		if LostInRUs == 499 or		-- exceptions for missiles
		LostInRUs == 2999	or
		LostInRUs == 999 or
		LostInRUs == 1999 then
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Hiigaran then
		if LostInRUs == 19999 or 		-- exceptions for missiles
		LostInRUs == 2999 or 
		LostInRUs == 499 or 
		LostInRUs == 999 then
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
		if LostInRUs == 1999 or 		-- exceptions for missiles
		LostInRUs == 499 or 
		LostInRUs == 999 then
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Keeper then
		if LostInRUs == 5999 then 		-- exceptions for missiles
			exception = 1
		end
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		if LostInRUs == 499 or 		-- exceptions for missiles
		LostInRUs == 2999 then
			exception = 1
		end
	end
	return exception
end

function EasterEgg()
	if Rule_Exists("ec_welcome") == 1 then	--wait until intro is done
		return
	end
	local all_pictures = {
		"nvidia","ryzen","codes","nyan_cat","purchase","supercruise","you_win","desserts_of_kharak",
		"sunrise","horizon","new_century","new_millennium","time_capsule"
		}
	local christmas_pictures = {"christmas1","christmas2","christmas3","christmas4","christmas5","christmas6","christmas7"}
	all_pictures = Table_CombineWithTable(all_pictures, christmas_pictures)
	--print(Vector_tostring(all_pictures))	--for debugging
	local all_buttons = {"btnOk","btnNewYear","btnChristmas"}
	for z, button in all_buttons do
		UI_ShowRandomElement("easteregg", button, 0)
	end
	local parsed_year, parsed_month, parsed_day, parsed_hour, parsed_minute, parsed_second = date_parse("year"), date_parse("month"), date_parse("day"), date_parse("hour"), date_parse("minute"), date_parse("second")
	--print("hour: "..parsed_hour)
	--print("minute: "..parsed_minute)
	--print("second: "..parsed_second)
	--parsed_year, parsed_month, parsed_day = 2019, 12, 31	--for testing
	if parsed_month == 1 and parsed_day == 1 then
		local EggData = {}
		EggData[1]={}
		EggData[1].title = "HAPPY NEW YEAR"
		EggData[1].summary = "The New Journey Awaits"
		EggData[1].picture = "sunrise"
		EggData[1].details = "Welcome to "..parsed_year.."! Here, you have more space to explore, more secrets to unlock, more challenges to conquer, and more (imaginary) friends to make! This ancient game is greeting you, how awesome is that! Don't you want to say something?"
		EggData[1].sound = "SFX_LeaderDeath"
		if parsed_year == 9999 then
			EggData[1].title = "Year "..parsed_year
			EggData[1].summary = "TIME IN A CAPSULE"
			EggData[1].picture = "time_capsule"
			EggData[1].details = "It may or may not be the end of time for this system, but human ingenuity has certainly endured far longer period. Civilizations rise and fall, and you should be building Dyson Sphere by now. The future awaits among the stars, Happy (Earth) New Year!"
			EggData[1].sound = "SFX_LeaderDeath"
		elseif mod(parsed_year,1000) == 0 then
			EggData[1].title = "Year "..parsed_year
			EggData[1].summary = "A New Millennium"
			EggData[1].picture = "new_millennium"
			EggData[1].details = "Wow! I never thought this mod could live this far into the future! You must be a digital god or something! Is climate change still a thing? How many species still exist? Anyway... Best wishes to humankind, or my digital overlord, whatever you are! :)"
			EggData[1].sound = "SFX_LeaderDeath"
		elseif mod(parsed_year,100) == 1 then
			local century = floor(parsed_year/100)+1
			local last_two_digit = mod(century, 100)
			local last_one_digit = mod(century, 10)
			local suffix = "th"
			if last_two_digit < 10 or last_two_digit >20 then
				if last_one_digit == 1 then
					suffix = "st"
				elseif last_one_digit == 2 then
					suffix = "nd"
				elseif last_one_digit == 3 then
					suffix = "rd"
				end
			end
			EggData[1].title = "Year "..parsed_year
			EggData[1].summary = "A New Century"
			EggData[1].picture = "new_century"
			EggData[1].details = "Technically, the first year of the "..century..suffix.." century is "..parsed_year..", so yeah... The thing is, you are not supposed to see this message unless you are a digital archaeologist or time traveller! But anyway... Happy New Year! :)"
			EggData[1].sound = "SFX_LeaderDeath"
		elseif mod(parsed_year,10) == 0 then
			EggData[1].title = "Year "..parsed_year
			EggData[1].summary = "The Legend Continues"
			EggData[1].picture = "horizon"
			EggData[1].details = "Welcome to the future my friend! It is truly remarkable that you are still playing this old game from 2003! You must have already become an RTS god or some kind! Complex Simple wishes to keep bringing you the fun like it always did! Happy New Year! :)"
			EggData[1].sound = "SFX_LeaderDeath"
		end
		local idx = 1
		local EasterEgg = EggData[idx]
		UI_PlaySound(EasterEgg.sound)
		UI_SetScreenEnabled("easteregg", 1)
		UI_SetScreenVisible("easteregg", 1)
		UI_SetTextLabelText("easteregg", "lblTitle", ""..EasterEgg.title)
		UI_SetTextLabelText("easteregg", "lblSubTitle", ""..EasterEgg.summary)
		UI_ShowSingleElementInList("easteregg", EasterEgg.picture, all_pictures)
		UI_SetTextLabelText("easteregg", "lblDescription1", ""..EasterEgg.details)
		UI_ShowRandomElement("easteregg", "btnNewYear")
	elseif parsed_month == 4 and parsed_day == 1 then
		local EggData = {}
		EggData[1]={}
		EggData[1].title = "Did you know?"
		EggData[1].summary = "<c=77b62e>NVIDIA RTX ON</c>"
		EggData[1].picture = "nvidia"
		EggData[1].details = "This mod implements <c=77b62e>NVIDIA RTX</c> Technology and has real-time ray tracing enabled by default. If you don't notice any difference, it's either because you don't own an NVIDIA graphics card or you don't own the most expensive one."
		EggData[1].sound = "SFX_Uplift"
		EggData[2]={}
		EggData[2].title = "PRO TIP"
		EggData[2].summary = "AMD YES"
		EggData[2].picture = "ryzen"
		EggData[2].details = "If you own any AMD processor, you will have access to the tactical pause feature. To engage tactical pause, you do not need to press any key. The game itself should determine the best moments to pause to help you focus on more important things."
		EggData[2].sound = "SFX_Uplift"
		EggData[3]={}
		EggData[3].title = "Oops..."
		EggData[3].summary = "Technical Difficulty"
		EggData[3].picture = "codes"
		EggData[3].details = "It seems your system is running on outdated hardware. Many essential functions will be severely limited. Advanced AI algorithms such as player smart assist will be disabled. You will have to manually control your fleet."
		EggData[3].sound = "SFX_PowerfulFaction"
		EggData[4]={}
		EggData[4].title = "ENDGAME CRISIS"..Time_PrintYear()
		EggData[4].summary = "Nyan Cat"
		EggData[4].picture = "nyan_cat"
		EggData[4].details = "Homeworld 2 has detected massive anomaly in your system memory. The address is associated with your web browsing history. Energy reading is off the scale. The final form is likely interdimensional feline... Be prepared for unforeseen consequences."
		EggData[4].sound = "SFX_fleet_under_attack"
		EggData[5]={}
		EggData[5].title = "PURCHASE NOW"
		EggData[5].summary = "Trial Version Expired"
		EggData[5].picture = "purchase"
		EggData[5].details = "Your free evaluation period of Complex Simple has ended. The mod will automatically uninstall itself after you finish this game. If you wish to continue playing, please purchase it on the official website (subscription fee is only $49.95 per month)."
		EggData[5].sound = "SFX_fleet_under_attack"
		EggData[6]={}
		EggData[6].title = "Achievement Unlocked"
		EggData[6].summary = "Supercruise"
		EggData[6].picture = "supercruise"
		EggData[6].details = "Bravo! You just broke the slowest speed record in this game. As a result, you have been authorized to use the <c=FFD800>Supercruise</c> ability. You can now select any moving ship and hold down CTRL+SHIFT+S to activate supercruise."
		EggData[6].sound = "SFX_Uplift"
		EggData[7]={}
		EggData[7].title = "Congratulations!"
		EggData[7].summary = "Player of the Month"
		EggData[7].picture = "you_win"
		EggData[7].details = "Congratulations! You have just been picked by Complex Simple as the Player of the Month! Please take a screenshot as proof and come to the official website to claim your prize. There are numerous rewards waiting for you including downloadable RAM!"
		EggData[7].sound = "SFX_cash1"
		EggData[8]={}
		EggData[8].title = "Game News"
		EggData[8].summary = "New DLC Available"
		EggData[8].picture = "desserts_of_kharak"
		EggData[8].details = "<c=FFD800>Homeworld: Desserts of Kharak</c> is now available for download! Reply \"Sweet\" on the official page of Complex Simple to get 50% off! Remaining coupons: "..(26-parsed_hour)..". First come first serve. Hurry up if you want your cake!"
		EggData[8].sound = "SFX_Notification_002"
		local idx = random(1,Table_CountElements(EggData))
		local EasterEgg = EggData[idx]
		UI_PlaySound(EasterEgg.sound)
		UI_SetScreenEnabled("easteregg", 1)
		UI_SetScreenVisible("easteregg", 1)
		UI_SetTextLabelText("easteregg", "lblTitle", ""..EasterEgg.title)
		UI_SetTextLabelText("easteregg", "lblSubTitle", ""..EasterEgg.summary)
		UI_ShowSingleElementInList("easteregg", EasterEgg.picture, all_pictures)
		UI_SetTextLabelText("easteregg", "lblDescription1", ""..EasterEgg.details)
		if EasterEgg.summary == "Nyan Cat" then
			if SobGroup_Empty("splitter") == 0 then
				FX_StartEvent("splitter", "nyan_cat")
			end
		end
		UI_ShowRandomElement("easteregg", "btnOk")
	elseif parsed_month == 12 and (parsed_day == 24 or parsed_day == 25) then
		local EggData = {}
		EggData[1]={}
		EggData[1].title = "XMAS"
		EggData[1].summary = "Merry Christmas!"
		EggData[1].picture = christmas_pictures[random(1,getn(christmas_pictures))]
		EggData[1].details = "Why are you still fighting the computer alone on Christmas? Don't you have any real butt friend? If not, Complex Simple sincerely wishes you will find your other half and get laid! Make love, not war. Santa is watching you!"
		EggData[1].sound = "SFX_cash1"
		if GetGameRubric() == GR_MULTIPLAYER then
			EggData[1].details = "Merry Christmas to you and your butt friend! But why do you intend to avoid actual social interaction by indulging yourselves in a video game? On Christmas, you are supposed to make love, not war. Just get laid already! Santa is watching!"
		end
		local idx = 1
		local EasterEgg = EggData[idx]
		UI_PlaySound(EasterEgg.sound)
		UI_SetScreenEnabled("easteregg", 1)
		UI_SetScreenVisible("easteregg", 1)
		UI_SetTextLabelText("easteregg", "lblTitle", ""..EasterEgg.title)
		UI_SetTextLabelText("easteregg", "lblSubTitle", ""..EasterEgg.summary)
		UI_ShowSingleElementInList("easteregg", EasterEgg.picture, all_pictures)
		UI_SetTextLabelText("easteregg", "lblDescription1", ""..EasterEgg.details)
		UI_ShowRandomElement("easteregg", "btnChristmas")
	elseif parsed_month == 12 and parsed_day == 31 then
		if Rule_Exists("EasterEgg_NewYearSubroutine") == 0 then
			Rule_AddInterval("EasterEgg_NewYearSubroutine", 0.345)
			print("EasterEgg_NewYearSubroutine() added, waiting for the midnight.")
		end
	end
  Rule_Remove("EasterEgg")
end

function EasterEgg_NewYearSubroutine()	--wait for Janurary 1st 00:00 and start firework
	local parsed_month, parsed_day, parsed_hour = date_parse("month"), date_parse("day"), date_parse("hour")
	--parsed_month, parsed_day, parsed_hour = 1, 1, 0	--for testing
	if parsed_month == 1 and parsed_day == 1 and parsed_hour == 0 then	--start firework immediately after midnight (but only within the first hour)
		if SobGroup_Empty("splitter") == 0 then
			FX_StartEvent("splitter", "firework")
			print("Happy New Year! Fireworks started (just for you)!")
			if Rule_Exists("EasterEgg") == 0 then
				Rule_AddInterval("EasterEgg", 0.345)	--call the parent function again for UI display
			end
			if Rule_Exists("EasterEgg_FireworkSubroutine") == 0 then
				Rule_AddInterval("EasterEgg_FireworkSubroutine", 33)	--to switch firework pallete
			end
		end
	elseif parsed_month == 12 and parsed_day == 31 then	--do nothing (wait until midnight)
		return
	end
	Rule_Remove("EasterEgg_NewYearSubroutine")
end

function EasterEgg_FireworkSubroutine()
	local parsed_month, parsed_day, parsed_hour = date_parse("month"), date_parse("day"), date_parse("hour")
	--parsed_month, parsed_day, parsed_hour = 1, 1, 0	--for testing
	if parsed_month == 1 and parsed_day == 1 and parsed_hour == 0 then
		if SobGroup_Empty("splitter") == 0 then
			FX_StartEvent("splitter", "firework")
		end
	else
		Rule_Remove("EasterEgg_NewYearSubroutine")
	end
end