function UI_SimplexKeyBinding()
	if Rule_Exists("Cinematic") == 0 then
		UI_BindKeyEvent(F1KEY, "KeyBinding_Recall")
	end
	if UI_IsScreenActive("ChatScreen") == 0 and 
	UI_IsScreenActive("InGameMenu") == 0 then
		UI_BindKeyEvent(EKEY, "KeyBinding_RemoteMonitor")
		UI_UnBindKeyEvent(APOSTROPHEKEY)
		UI_BindKeyEvent(APOSTROPHEKEY, "KeyBinding_Selector")
		UI_BindKeyEvent(BACKSLASHKEY, "KeyBinding_MusicPlayer")
		if GetGameRubric() ~= GR_MULTIPLAYER then
			UI_UnBindKeyEvent(UKEY)
			UI_BindKeyEvent(UKEY, "KeyBinding_DriveMode")
		end
		if GetGameRubric() ~= GR_CAMPAIGN then
			UI_BindKeyEvent(OKEY, "KeyBinding_Objective")
		end
	else
		UI_UnBindKeyEvent(EKEY)
		UI_UnBindKeyEvent(APOSTROPHEKEY)
		UI_UnBindKeyEvent(BACKSLASHKEY)
		if GetGameRubric() ~= GR_MULTIPLAYER then
			UI_UnBindKeyEvent(UKEY)
		end
		if GetGameRubric() ~= GR_CAMPAIGN then
			UI_UnBindKeyEvent(OKEY)
		end
	end
end

function UI_SwitchScreenOnAndOff(screen)
  if UI_IsScreenActive(screen) == 0 then
  	UI_SetScreenVisible(screen, 1)
  else
  	UI_SetScreenVisible(screen, 0)
  end
end

function UI_SwitchElementOnAndOff(screen, element)
  if UI_IsNamedElementVisible(screen, element) == 0 then
  	UI_SetElementVisible(element, element, 1)
  else
  	UI_SetElementVisible(element, element, 0)
  end
end

function KeyBinding_RemoteMonitor()
	UI_SwitchScreenOnAndOff("UnitCapInfoPopup1")
  Rule_Remove("RemoteMonitorKeyBinding")
end

function KeyBinding_Recall()
	UI_SwitchScreenOnAndOff("SpeechRecall")
  Rule_Remove("KeyBinding_Recall")
end

function KeyBinding_Objective()
	UI_SwitchScreenOnAndOff("ObjectivesList")
  Rule_Remove("KeyBinding_Objective")
end

function KeyBinding_Selector()
	UI_SwitchScreenOnAndOff("selector")
  Rule_Remove("KeyBinding_Selector")
  Rule_Remove("KeyBinding_Selector")
end

function KeyBinding_MusicPlayer()
	UI_SwitchScreenOnAndOff("MusicMenu")
  Rule_Remove("KeyBinding_MusicPlayer")
end

function KeyBinding_DriveMode()
	--UI_SwitchElementOnAndOff("drive","driveenabled")
	UI_SetElementVisible("drive","driveenabled", 1)
  Rule_Remove("KeyBinding_DriveMode")
end

function ec_welcome() 
	Update_AllShips()
  if intro == 1 then
	  interfacegivecontrol()
		UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblFusion", ""..fusionList[Universe_CurrentPlayer()+1]);    
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblmegalith", ""..megalithList[Universe_CurrentPlayer() + 1]); 
	  UI_SetTextLabelText("UnitCapInfoPopup", "diplomacy", ""..diplomacyListSummary[Universe_CurrentPlayer() + 1]);  
	  UI_SetTextLabelText("UnitCapInfoPopup", "bounty", ""..BountyRUSummary[Universe_CurrentPlayer() + 1]);  
    UI_SetTextLabelText("UnitCapInfoPopup", "lblplanet", ""..planetList[Universe_CurrentPlayer() + 1]); 	
	  UI_SetTextLabelText("UnitCapInfoPopup", "lbltrade", ""..tradeList[Universe_CurrentPlayer() + 1]);   
    UI_SetTextLabelText("ResourceMenu", "lblstatus", "Monitor");    
    UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[Universe_CurrentPlayer() + 1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[Universe_CurrentPlayer() + 1]);  
	  UI_SetTextLabelText("ResourceMenu", "lblMaintenance", ""..maintenanceList[Universe_CurrentPlayer() + 1]);                  
    UI_SetTextLabelText("UnitCapInfoPopup", "lblMaintenance", ""..maintenanceList[Universe_CurrentPlayer() + 1]);		
		ec_intro_count = 15
	end
 
  if ec_intro_count == 0 then         
    UI_SetScreenEnabled("NewBuildMenu", 0)
    UI_SetScreenEnabled("NewResearchMenu", 0)
    UI_SetScreenEnabled("NewLaunchMenu", 0)
    UI_SetElementEnabled("NewTaskbar", "btnBuild", 0)
    UI_SetElementEnabled("NewTaskbar", "btnResearch", 0)
    UI_SetElementEnabled("NewTaskbar", "btnLaunch", 0)
    local playerIndex = 0   
  	while playerIndex < Universe_PlayerCount() do
	  	if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
	      	if SobGroup_Empty("Player_Ships"..playerIndex) == 0 then
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Lights, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Stop, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Move, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Attack, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Scuttle, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Sensors, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Builder, 0)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Dock, 0)
        	end
        	local iRace = Player_GetRace(playerIndex) + 1
					dofilepath([[data:scripts/race.lua]])
					dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/build.lua]])
					if nms <= Universe_PlayerCount() then
						for z, iCount in build do
							Player_RestrictBuildOption(playerIndex, iCount.ThingToBuild)
						end
						if Player_GetRace(playerIndex) == Race_Hiigaran or Player_GetRace(playerIndex) == Race_Vaygr then
							Player_RestrictResearchOption(playerIndex, "CapitalRetire")
							Player_RestrictResearchOption(playerIndex, "SensDisProbe")
						end
					end
	      end
	    end
  		playerIndex = playerIndex + 1
  	end
	  
  elseif ec_intro_count == 1 then
    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_03\\56062") --The time of prophecy is at hand  
    
  elseif ec_intro_count == 2 then
    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_03\\56074") --The end time has begun
    
  elseif ec_intro_count == 3 then
    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_03\\56073") --This is your destiny            
    
  elseif ec_intro_count == 4 then
    interfacegivecontrol()
            
  elseif ec_intro_count == 5 then
	  Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Hyperspace jump successful",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\missions\\m_02\\40024")
	  end  
    
  elseif ec_intro_count == 6 then
    local playerIndex = Universe_CurrentPlayer()
	  if Player_GetRace(playerIndex) == Race_Hiigaran then
    	if SobGroup_Empty("hgn_mothership"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"Mothership status report",5)
		    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56007")
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Hiigaran Navy status report",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Vaygr then
	  	if SobGroup_Empty("vgr_mothership"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"Flagship status report",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Warriors of the Vaygr Reaches status report",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	  	if SobGroup_Empty("kad_needleship"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"Needleship status report",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Protectors of the Holy Place status report",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Raider then
	  	if SobGroup_Empty("rad_mothership"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"Pirate Ship status report",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Drunken bastards status report",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Keeper then
			if SobGroup_Empty("kpr_shipyard_old"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"Wormhole status report",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"The Great Maker status report",5)
		  end
	  end
    
  elseif ec_intro_count == 7 then
  	Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Stand by to initiate main engine sequence",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
		  Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56009")
		end  
	  
  elseif ec_intro_count == 8 then
    local playerIndex = 0   
  	while playerIndex < Universe_PlayerCount() do
	  	if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
	      	if SobGroup_Empty("Player_Ships"..playerIndex) == 0 then
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Stop, 1)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Move, 1)
        	end
	      end
	    end
  		playerIndex = playerIndex + 1
  	end
	  Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Main engines on-line",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56010")
		end  

--navigation      
  elseif ec_intro_count == 9 then
    local playerIndex = 0   
  	while playerIndex < Universe_PlayerCount() do
	  	if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
	      	if SobGroup_Empty("Player_Ships"..playerIndex) == 0 then
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Lights, 1)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Sensors, 1)
        	end
	      end
	    end
  		playerIndex = playerIndex + 1
  	end
	  Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Navigation on-line",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56008")
		end       
  
  elseif ec_intro_count == 10 then
  	Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Engine test complete, all standard drives are operational",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56011")
	  end 

--resource system	  
	elseif ec_intro_count == 11 then
		Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Resourcing Systems fully operational",5)
	  if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\missions\\m_01\\40540")
	  end        
	  UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblFusion", ""..fusionList[Universe_CurrentPlayer()+1]);    
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblmegalith", ""..megalithList[Universe_CurrentPlayer() + 1]); 
	  UI_SetTextLabelText("UnitCapInfoPopup", "diplomacy", ""..diplomacyListSummary[Universe_CurrentPlayer() + 1]);  
	  UI_SetTextLabelText("UnitCapInfoPopup", "bounty", ""..BountyRUSummary[Universe_CurrentPlayer() + 1]);  
    UI_SetTextLabelText("UnitCapInfoPopup", "lblplanet", ""..planetList[Universe_CurrentPlayer() + 1]); 	
	  UI_SetTextLabelText("UnitCapInfoPopup", "lbltrade", ""..tradeList[Universe_CurrentPlayer() + 1]);    	  
	
--fleet command	  
	elseif ec_intro_count == 12 then
	  UI_SetScreenEnabled("NewLaunchMenu", 1)	  
    UI_SetElementEnabled("NewTaskbar", "btnLaunch", 1)
    local playerIndex = 0   
  	while playerIndex < Universe_PlayerCount() do
	  	if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
	      	if SobGroup_Empty("Player_Ships"..playerIndex) == 0 then
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Scuttle, 1)
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Dock, 1)
        	end
	      end
	    end
  		playerIndex = playerIndex + 1
  	end
  	Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Fleet command on-line",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56006")
		end
		UI_SetTextLabelText("ResourceMenu", "lblstatus", "Monitor");
  
--Engineering    
  elseif ec_intro_count == 13 then
    UI_SetScreenEnabled("NewBuildMenu", 1)
    UI_SetScreenEnabled("NewResearchMenu", 1)
    UI_SetElementEnabled("NewTaskbar", "btnBuild", 1)
    UI_SetElementEnabled("NewTaskbar", "btnResearch", 1)
    Subtitle_AddAccordingToRacePrimary(Universe_CurrentPlayer(),"Engineering on-line",5)
    if Player_GetRace(Universe_CurrentPlayer()) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56012")
	  end
	  UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[Universe_CurrentPlayer() + 1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[Universe_CurrentPlayer() + 1]);
	  UI_SetTextLabelText("ResourceMenu", "lblMaintenance", ""..maintenanceList[Universe_CurrentPlayer() + 1]);
    UI_SetTextLabelText("UnitCapInfoPopup", "lblMaintenance", ""..maintenanceList[Universe_CurrentPlayer() + 1]);
    local playerIndex = 0   
  	while playerIndex < Universe_PlayerCount() do
	  	if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
	      	if SobGroup_Empty("Player_Ships"..playerIndex) == 0 then
        		SobGroup_AbilityActivate("Player_Ships"..playerIndex, AB_Builder, 1)
        	end
        	local iRace = Player_GetRace(playerIndex) + 1
					dofilepath([[data:scripts/race.lua]])
					dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/build.lua]])
					if nms <= Universe_PlayerCount() then
						for z, iCount in build do
							Player_UnrestrictBuildOption(playerIndex, iCount.ThingToBuild)
						end
						if Player_GetRace(playerIndex) == Race_Hiigaran or Player_GetRace(playerIndex) == Race_Vaygr then
							Player_UnrestrictResearchOption(playerIndex, "CapitalRetire")
							Player_UnrestrictResearchOption(playerIndex, "SensDisProbe")
						end
					end
	      end
	    end
  		playerIndex = playerIndex + 1
  	end
         
  elseif ec_intro_count == 14 then
  	if SobGroup_Empty("AllShips") == 0 then
      SobGroup_AbilityActivate("AllShips", AB_Attack, 1)
    end
    local playerIndex = Universe_CurrentPlayer()
    Subtitle_AddAccordingToRacePrimary(playerIndex,"Weapon systems fully charged",5)
    if Player_GetRace(playerIndex) == Race_Hiigaran then
	    Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47012")
		end  
             
  elseif ec_intro_count == 15 then
  	local playerIndex = Universe_CurrentPlayer()
    if Player_GetRace(playerIndex) == Race_Hiigaran then
    	if SobGroup_Empty("hgn_mothership"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"The Mothership is standing by",5)
		    Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56013")
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Hiigaran Navy is standing by",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Vaygr then
	  	if SobGroup_Empty("vgr_mothership"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"The Flagship is standing by",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Warriors of the Vaygr Reaches are standing by",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	  	if SobGroup_Empty("kad_needleship"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"The Needleship is standing by",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"Protectors of the Holy Place are standing by",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Raider then
	  	if SobGroup_Empty("rad_mothership"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"The Pirate Ship is standing by",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"The drunken bastards are standing by",5)
		  end
	  elseif Player_GetRace(playerIndex) == Race_Keeper then
			if SobGroup_Empty("kpr_shipyard_old"..playerIndex) == 0 then
		    Subtitle_AddAccordingToRacePrimary(playerIndex,"The Wormhole is standing by",5)
		  else
		  	Subtitle_AddAccordingToRacePrimary(playerIndex,"The Great Maker is standing by",5)
		  end
	  end
    if year <= 1 then   		    
	    Rule_AddInterval("objectives_mp", 24.24) 		    
	  end	  
	  Rule_AddInterval("population", 7.654321) --ok
		Rule_AddInterval("populationinit", 3.1)
		Rule_AddInterval("transportcell", 7.55) --ok	  
  end 
     
  if ec_intro_count == 15 then
    Rule_Remove("ec_welcome")  
  elseif ec_intro_count < 3 then   	    
    ec_intro_count = ec_intro_count + 1
    Rule_Remove("ec_welcome")    	
    Rule_AddInterval("ec_welcome", 6)   
  elseif ec_intro_count == 3 then   	    
    ec_intro_count = ec_intro_count + 1
    Rule_Remove("ec_welcome")  
    Rule_AddInterval("ec_welcome", 3)
  else        
    ec_intro_count = ec_intro_count + 1
    Rule_Remove("ec_welcome") 
    Rule_AddInterval("ec_welcome", 7) 
  end  
  
end

function locard()
  if intro == 1 then
	  Rule_Remove("locard") 
	  return
	end
  Event_Start("loc") 
  Rule_Remove("locard") 
  --Rule_AddInterval("locard1",1)  
end

function fadedown()
  Universe_Fade(1,0)  
  Rule_Remove("fadedown") 
  Rule_AddInterval("fadeup",1) 
end
function fadeup()
  Universe_Fade(0,33)      
  Rule_Remove("fadeup")   
end

function interfaceintro()   

  if intro == 1 then
	  UI_SetScreenEnabled("ComplexLogo", 1)  
    UI_SetScreenVisible("ComplexLogo", 1)  
	  Rule_Remove("interfaceintro")    
		Rule_AddInterval("interfaceintrostop", 6) 
		return
	end
	
	local ran_play = random(0,8)
	if ran_play == 1 then
		Sound_MusicPlay("Data:sound/music/nis/nis02a")
	elseif ran_play == 2 then
		Sound_MusicPlay("Data:sound/music/special/24 - 2EM28_EM13")
	elseif ran_play == 3 then
		Sound_MusicPlay("Data:sound/music/special/nis56-44s")
	elseif ran_play == 4 then
		Sound_MusicPlay("Data:sound/music/special/nis50-44s")
	elseif ran_play == 5 then
		Sound_MusicPlay("Data:sound/music/special/End_Credits")
	elseif ran_play == 6 then
		Sound_MusicPlay("Data:sound/music/special/staging1z-44s")
	elseif ran_play == 7 then
		Sound_MusicPlay("Data:sound/music/special/The Bear and the Mountain - 44s")
	elseif ran_play == 8 then
		Sound_MusicPlay("Data:sound/music/special/Star Trek - 44s")
	else
  	Sound_MusicPlay("Data:sound/music/special/H1 - The Bentusi")
  end
  local playerIndex = 0                           
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
			  if Player_GetRace(playerIndex) == Race_Hiigaran then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard_g") >= 1 then
						SobGroup_FillShipsByType("hgn_shipyard_g"..playerIndex, "Player_Ships"..playerIndex, "hgn_shipyard_g") 
						Camera_FocusSobGroupWithBuffer("hgn_shipyard_g"..Universe_CurrentPlayer(), 10000, 0, 29)   
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") >= 1 then
						SobGroup_FillShipsByType("hgn_mothership"..playerIndex, "Player_Ships"..playerIndex, "hgn_mothership")   
						Camera_FocusSobGroupWithBuffer("hgn_mothership"..Universe_CurrentPlayer(), 6000, 0, 29)    
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard") >= 1 then
						SobGroup_FillShipsByType("hgn_shipyard"..playerIndex, "Player_Ships"..playerIndex, "hgn_shipyard") 
						Camera_FocusSobGroupWithBuffer("hgn_shipyard"..Universe_CurrentPlayer(), 10000, 0, 29)   
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier") >= 1 then
						SobGroup_FillShipsByType("hgn_carrier"..playerIndex, "Player_Ships"..playerIndex, "hgn_carrier") 
						Camera_FocusSobGroupWithBuffer("hgn_carrier"..Universe_CurrentPlayer(), 6000, 0, 29)   
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecarrier") >= 1 then
						SobGroup_FillShipsByType("hgn_battlecarrier"..playerIndex, "Player_Ships"..playerIndex, "hgn_battlecarrier") 
						Camera_FocusSobGroupWithBuffer("hgn_battlecarrier"..Universe_CurrentPlayer(), 6000, 0, 29)   
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlestation") >= 1 then
						SobGroup_FillShipsByType("hgn_battlestation"..playerIndex, "Player_Ships"..playerIndex, "hgn_battlestation") 
						Camera_FocusSobGroupWithBuffer("hgn_battlestation"..Universe_CurrentPlayer(), 10000, 0, 29)  
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ark") >= 1 then
						SobGroup_FillShipsByType("hgn_ark"..playerIndex, "Player_Ships"..playerIndex, "hgn_ark") 
						Camera_FocusSobGroupWithBuffer("hgn_ark"..Universe_CurrentPlayer(), 10000, 0, 29) 
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress") >= 1 then
						SobGroup_FillShipsByType("hgn_commandfortress"..playerIndex, "Player_Ships"..playerIndex, "hgn_commandfortress") 
						Camera_FocusSobGroupWithBuffer("hgn_commandfortress"..Universe_CurrentPlayer(), 10000, 0, 29)
					end  
				elseif Player_GetRace(playerIndex) == Race_Vaygr then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") >= 1 then
	          SobGroup_FillShipsByType("vgr_mothership"..playerIndex, "Player_Ships"..playerIndex, "vgr_mothership")   
						Camera_FocusSobGroupWithBuffer("vgr_mothership"..Universe_CurrentPlayer(), 6000, 0, 29) 
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard") >= 1 then
						SobGroup_FillShipsByType("vgr_shipyard"..playerIndex, "Player_Ships"..playerIndex, "vgr_shipyard") 
						Camera_FocusSobGroupWithBuffer("vgr_shipyard"..Universe_CurrentPlayer(), 10000, 0, 29)   
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier") >= 1 then
						SobGroup_FillShipsByType("vgr_carrier"..playerIndex, "Player_Ships"..playerIndex, "vgr_carrier") 
						Camera_FocusSobGroupWithBuffer("vgr_carrier"..Universe_CurrentPlayer(), 6000, 0, 29)
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artillerybattlecruiser") >= 1 then
						SobGroup_FillShipsByType("vgr_artillerybattlecruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_artillerybattlecruiser") 
						Camera_FocusSobGroupWithBuffer("vgr_artillerybattlecruiser"..Universe_CurrentPlayer(), 10000, 0, 29) 
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfortress") >= 1 then
						SobGroup_FillShipsByType("vgr_commandfortress"..playerIndex, "Player_Ships"..playerIndex, "vgr_commandfortress") 
						Camera_FocusSobGroupWithBuffer("vgr_commandfortress"..Universe_CurrentPlayer(), 10000, 0, 29) 
					end
				elseif Player_GetRace(playerIndex) == Race_Kadeshi then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship") >= 1 then
	          SobGroup_FillShipsByType("kad_needleship"..playerIndex, "Player_Ships"..playerIndex, "kad_needleship")   
						Camera_FocusSobGroupWithBuffer("kad_needleship"..Universe_CurrentPlayer(), 6000, 0, 29) 
					end
				elseif Player_GetRace(playerIndex) == Race_Raider then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_mothership") >= 1 then
						SobGroup_FillShipsByType("rad_mothership"..playerIndex, "Player_Ships"..playerIndex, "rad_mothership") 
						Camera_FocusSobGroupWithBuffer("rad_mothership"..Universe_CurrentPlayer(), 6000, 0, 29)
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier") >= 1 then
	          SobGroup_FillShipsByType("rad_carrier"..playerIndex, "Player_Ships"..playerIndex, "rad_carrier")
						Camera_FocusSobGroupWithBuffer("rad_carrier"..Universe_CurrentPlayer(), 6000, 0, 29)
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier_black") >= 1 then
						SobGroup_FillShipsByType("rad_carrier_black"..playerIndex, "Player_Ships"..playerIndex, "rad_carrier_black") 
						Camera_FocusSobGroupWithBuffer("rad_carrier_black"..Universe_CurrentPlayer(), 6000, 0, 29)
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket") >= 1 then
						SobGroup_FillShipsByType("rad_blackmarket"..playerIndex, "Player_Ships"..playerIndex, "rad_blackmarket") 
						Camera_FocusSobGroupWithBuffer("rad_blackmarket"..Universe_CurrentPlayer(), 10000, 0, 29)
					end
				elseif Player_GetRace(playerIndex) == Race_Keeper then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_shipyard_old") >= 1 then
						SobGroup_FillShipsByType("kpr_shipyard_old"..playerIndex, "Player_Ships"..playerIndex, "kpr_shipyard_old")
						Camera_FocusSobGroupWithBuffer("kpr_shipyard_old"..Universe_CurrentPlayer(), 10000, 0, 29)
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_carrier") >= 1 then
	          SobGroup_FillShipsByType("kpr_carrier"..playerIndex, "Player_Ships"..playerIndex, "kpr_carrier")
						Camera_FocusSobGroupWithBuffer("kpr_carrier"..Universe_CurrentPlayer(), 6000, 0, 29)
					end
				end
			end
		end
		playerIndex = playerIndex + 1  
	end	   
  UI_SetScreenEnabled("ComplexLogo", 1)  
  UI_SetScreenVisible("ComplexLogo", 1)       
  Rule_Remove("interfaceintro")    
  Rule_AddInterval("interfaceintrostop", 20)   
end
function interfaceintrostop()      
  --UI_SetScreenEnabled("ComplexLogo", 0)  
  UI_SetScreenVisible("ComplexLogo", 0)       
  Rule_Remove("interfaceintrostop")     
end

function interfacegivecontrol()           
  Universe_AllowPlayerOrders(1)  
  UI_SetScreenEnabled("ResourceMenu", 1)     
  UI_SetScreenEnabled("NewTaskbar", 1)  
  UI_SetScreenVisible("ResourceMenu", 1)     
  UI_SetScreenVisible("NewTaskbar", 1)   
  UI_SetElementEnabled("NewTaskbar", "btnEMP", 0)
  UI_SetElementVisible("NewTaskbar", "btnObjectives", 1)    
  UI_SetElementVisible("NewTaskbar", "btnChat", 1)    
  UI_SetElementVisible("NewTaskbar", "btnDiplomacy", 1)    
  UI_SetElementVisible("NewTaskbar", "btnRecall", 1) 
  cleaninterface()  
  Rule_Remove("interfacegivecontrol")  
end

function interfacebuttonsFast()
	UpdateSystemTimeInSeconds()		--count game time in real seconds, defined in gametime.lua
	UI_SimplexKeyBinding()
---RU Update
  if ((year==0 and gametime<45) or year>0) then
	  UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
  end

---in screen buttons
  if UI_ScreenIsActive("NewTaskbar") == 1 and UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 1 then
    UI_SetScreenVisible( 'New1', 1)
    --UI_SetElementPosition("New1", "new1_box", 231, 484)
				
    if battlearena[1] >= 1 then 
      UI_SetScreenVisible( 'battlearena', 1) 
    end
  --elseif UI_ScreenIsActive("NewTaskbar") == 1 then
    --UI_SetScreenVisible( 'New1', 1)
    --UI_SetElementPosition("New1", "new1_box", 231, 484 + 67)
  else
    UI_SetScreenVisible( 'New1', 0) 
    UI_SetScreenVisible( 'battlearena', 0) 
  end
	
  --music player
	if UI_IsScreenActive("MusicMenu") == 1 or UI_IsNamedElementVisible("MusicMenu","NextMusic")==1 then   	
	  if Rule_Exists("Watch_MusicMenu") == 0 then
	  	Rule_Remove("Watch_MusicMenu")
	  	Rule_Add("Watch_MusicMenu")
	  end
  elseif UI_IsScreenActive("MusicMenu") == 0 then
		Rule_Remove("Watch_MusicMenu")
  end
  
	Rule_Remove("interfacebuttonsFast")
	Rule_AddInterval("interfacebuttonsFast", 0.1111)
	

---Planets
  if SobGroup_Empty("star_sol") == 0 then	  
    if UI_ScreenIsActive("NewTaskbar") == 1 and UI_ScreenIsActive("planetbar") == 1 and UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 1 then	
      if levelweareplaying == 1 then	  
			  UI_SetScreenVisible("planet_list_beam", 1) 
			elseif levelweareplaying == 2 then	  
			  UI_SetScreenVisible("planet_list_jf", 1) 
			elseif levelweareplaying == 3 then	  
			  UI_SetScreenVisible("planet_list_sf", 1) 
			elseif levelweareplaying == 4 then	  
			  UI_SetScreenVisible("planet_list_fs", 1) 
			else
        UI_SetScreenVisible("planet_list", 1) 			
			end	
			if UI_IsScreenActive("planet_list_mercury") == 1 then      
				UI_SetScreenVisible("planet_list_mercury", 0)     
				if SobGroup_Empty("planet_mercury") == 0 then	
          --Sensors_Switch(1)				
					Camera_FocusSobGroupWithBuffer ("planet_mercury", 42000*2, 1000, 2)    
				end	
			end 
			if UI_IsScreenActive("planet_list_venus") == 1 then      
				UI_SetScreenVisible("planet_list_venus", 0)     
				if SobGroup_Empty("planet_venus") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_venus", 57000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_earth") == 1 then      
				UI_SetScreenVisible("planet_list_earth", 0)     
				if SobGroup_Empty("planet_earth") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_earth", 57000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_moon") == 1 then      
				UI_SetScreenVisible("planet_list_moon", 0)     
				if SobGroup_Empty("planet_moon") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_moon", 42000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_mars") == 1 then      
				UI_SetScreenVisible("planet_list_mars", 0)     
				if SobGroup_Empty("planet_mars") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_mars", 57000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_jupiter") == 1 then      
				UI_SetScreenVisible("planet_list_jupiter", 0)     
				if SobGroup_Empty("planet_jupiter") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_jupiter", 112000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_io") == 1 then      
				UI_SetScreenVisible("planet_list_io", 0)     
				if SobGroup_Empty("planet_io") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_io", 42000*2, 1000, 2)    
				end	
			end  
			if UI_IsScreenActive("planet_list_europa") == 1 then      
				UI_SetScreenVisible("planet_list_europa", 0)     
				if SobGroup_Empty("planet_europa") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_europa", 42000*2, 1000, 2)    
				end	
			end 
			if UI_IsScreenActive("planet_list_callisto") == 1 then      
				UI_SetScreenVisible("planet_list_callisto", 0)     
				if SobGroup_Empty("planet_callisto") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_callisto", 42000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_ganymeade") == 1 then      
				UI_SetScreenVisible("planet_list_ganymeade", 0)     
				if SobGroup_Empty("planet_ganymeade") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_ganymeade", 42000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_saturn") == 1 then      
				UI_SetScreenVisible("planet_list_saturn", 0)     
				if SobGroup_Empty("planet_saturn") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_saturn", 112000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_uranus") == 1 then      
				UI_SetScreenVisible("planet_list_uranus", 0)     
				if SobGroup_Empty("planet_uranus") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_uranus", 72000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_neptune") == 1 then      
				UI_SetScreenVisible("planet_list_neptune", 0)     
				if SobGroup_Empty("planet_neptune") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_neptune", 72000*2, 1000, 2)    
				end	
			end  	
			if UI_IsScreenActive("planet_list_pluto") == 1 then      
				UI_SetScreenVisible("planet_list_pluto", 0)     
				if SobGroup_Empty("planet_pluto") == 0 then		
					Camera_FocusSobGroupWithBuffer ("planet_pluto", 42000*2, 1000, 2)    
				end	
			end
		else   
      UI_SetScreenVisible("planet_list", 0)  
			UI_SetScreenVisible("planet_list_beam", 0) 
			UI_SetScreenVisible("planet_list_jf", 0) 
			UI_SetScreenVisible("planet_list_fs", 0) 
			UI_SetScreenVisible("planet_list_sf", 0) 
			UI_SetScreenVisible("planet_list_mercury", 0)  
			UI_SetScreenVisible("planet_list_venus", 0)  
			UI_SetScreenVisible("planet_list_earth", 0)  
			UI_SetScreenVisible("planet_list_moon", 0)  
			UI_SetScreenVisible("planet_list_mars", 0)  
			UI_SetScreenVisible("planet_list_jupiter", 0)  
			UI_SetScreenVisible("planet_list_io", 0)  
			UI_SetScreenVisible("planet_list_europa", 0)
			UI_SetScreenVisible("planet_list_callisto", 0)  
			UI_SetScreenVisible("planet_list_ganymeade", 0)  
			UI_SetScreenVisible("planet_list_saturn", 0)  
			UI_SetScreenVisible("planet_list_uranus", 0)  
			UI_SetScreenVisible("planet_list_neptune", 0)
			UI_SetScreenVisible("planet_list_pluto", 0)  			
		end	
	end
	
---slow motion
  if UI_IsScreenActive("enablemotion") == 1 then     
    Universe_SlowDown(0.995,1)  
    UI_SetScreenVisible("enablemotion", 0) 
    UI_SetElementVisible("New1", "btnEnableSlowMotion", 0)  
    UI_SetElementVisible("New1", "btnDisableSlowMotion", 1)
  end  
  if UI_IsScreenActive("disablemotion") == 1 then
    Universe_SlowDown(1,1)  
    UI_SetScreenVisible("disablemotion", 0)
    UI_SetElementVisible("New1", "btnDisableSlowMotion", 0)
    UI_SetElementVisible("New1", "btnEnableSlowMotion", 1) 
  end
  
---drive mode
  if UI_IsNamedElementVisible("drive","driveenabled") == 1 and UI_IsNamedElementVisible("drive","takingcontrol") == 0 then
  	DriveMode_InitialCheck(Universe_CurrentPlayer())
  elseif UI_IsNamedElementVisible("drive","takingcontrol") == 1 then
  	DriveMode_AssumingDirectControl(Universe_CurrentPlayer())
  else
  	UI_SetScreenVisible("FlightPanel", 0)		--clear HUD for debug
  end
end

function interfacebuttons() 
	--end current game/game over
	if UI_ScreenIsActive("go") == 1 then	  
    Rule_Add("waitForEnd")
		Event_Start("endGame")
		Rule_Remove("interfacebuttons")
		UI_SetScreenEnabled("go", 0)
	end

---build queue menu   
  if UI_ScreenIsActive("EventsScreen") == 1 and UI_IsNamedElementVisible("EventsScreen", "listEvents") == 1 then
    UI_SetElementSize("BuildQueueMenu", "buildQueueFrame", 250, 364);    
  else       
    if UI_ScreenIsActive("NewTaskbar") == 1 and UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 1 then
	    UI_SetElementSize("BuildQueueMenu", "buildQueueFrame", 250, 450); 
	  elseif UI_ScreenIsActive("NewTaskbar") == 1 and UI_IsNamedElementVisible("NewTaskbar", "btnHide2") == 1 then   	  
	    UI_SetElementSize("BuildQueueMenu", "buildQueueFrame", 250, 534);  
	  else
	    UI_SetElementSize("BuildQueueMenu", "buildQueueFrame", 250, 560);  
	  end            
  end
---powerups
  if nrs > 0 then  	
	  for i = 0,nrs-1,1 do
	    if SobGroup_Empty("splitresearchstations"..i) == 0 then	  
---Power Ups	
        if Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "isai" ) == 0 then 
				  powerup("splitresearchstations"..i, "powerup_ru", "powerup_ru_unlocker", 3000, 144, powerup_ru_counter, nrs, "splitresearchstations", 100)
				  powerup("splitresearchstations"..i, "powerup_speed", "powerup_speed_unlocker", 3500, 144, powerup_speed_counter, nrs, "splitresearchstations", 200)
				  powerup("splitresearchstations"..i, "powerup_defense", "powerup_defense_unlocker", 4000, 144, powerup_defense_counter, nrs, "splitresearchstations", 300)
				  powerup("splitresearchstations"..i, "powerup_attack", "powerup_attack_unlocker", 4000, 144, powerup_attack_counter, nrs, "splitresearchstations", 300)
				  powerup("splitresearchstations"..i, "powerup_build", "powerup_build_unlocker", 4500, 144, powerup_build_counter, nrs, "splitresearchstations", 400)
				  powerup("splitresearchstations"..i, "powerup_repair", "powerup_repair_unlocker", 4500, 144, powerup_repair_counter, nrs, "splitresearchstations", 400)  
				end  		  			
	    end	        
	  end  
	end		 
  if nhs > 0 then  	
	  for i = 0,nhs-1,1 do
	    if SobGroup_Empty("splithyperspacestations"..i) == 0 then	  
---Power Ups	
        if Player_HasResearch(SobGroup_OwnedBy("splithyperspacestations"..i), "isai" ) == 0 then 
				  powerup("splithyperspacestations"..i, "powerup_sensor", "powerup_sensor_unlocker", 2000, 300, powerup_sensor_counter, nhs, "splithyperspacestations", 100)				  
				end  		  			
	    end	        
	  end  
	end		  	
	if nps > 0 then  	
	  for i = 0,nps-1,1 do
	    if SobGroup_Empty("splitpowerstations"..i) == 0 then	  
---Power Ups	
        if Player_HasResearch(SobGroup_OwnedBy("splitpowerstations"..i), "isai" ) == 0 then 
				  powerup("splitpowerstations"..i, "powerup_power", "powerup_power_unlocker", 5000, 144, powerup_power_counter, nps, "splitpowerstations", -100)				  
				end  		  			
	    end	        
	  end  
	end		  	 	

	--cinamatica
  if UI_IsScreenActive("New3") == 1 and Rule_Exists("Cinematic") == 0 then   	
	  UI_SetScreenVisible("New3", 0)	   
    if Rule_Exists("Cinematic") == 0 then		
			Rule_AddInterval("Cinematic", 0.5) 
		end	
  end
	
---cinamatica on missile
--nuclear bomb
  if UI_IsScreenActive("tube1") == 1 then      
    UI_SetScreenVisible("tube1", 0)        
    
    --stabilisce quanti sono
    FocusListMissile[Universe_CurrentPlayer()+1].numfocusbomb = 0
    if nnb > 0 then    	      
	    for i = 0,nnb-1,1 do	 
	      if SobGroup_Empty("splitnuclearbombs"..i) == 0 then     
		      if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then	 
		        if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_nucleartube1,hgn_nucleartube2,hgn_nucleartube3,hgn_nuclearbomb") == 1 then  
		          if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then  
		        	  FocusListMissile[Universe_CurrentPlayer()+1].numfocusbomb = FocusListMissile[Universe_CurrentPlayer()+1].numfocusbomb + 1
		        	end  
		        end	
		      end
		    end  
	    end
	  else
	    FocusListMissile[Universe_CurrentPlayer()+1].numfocusbomb = 0 
	    FocusListMissile[Universe_CurrentPlayer()+1].actualfocusbomb = 0 
	  end      
	  
	  --focus
	  fcount = 0  
	  if FocusListMissile[Universe_CurrentPlayer()+1].actualfocusbomb >= FocusListMissile[Universe_CurrentPlayer()+1].numfocusbomb then
	    FocusListMissile[Universe_CurrentPlayer()+1].actualfocusbomb = 0
	  end 	  
    if nnb > 0 then    	      
	    for i = 0,nnb-1,1 do	 
	      if SobGroup_Empty("splitnuclearbombs"..i) == 0 then     
		      if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then	
		        if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_nucleartube1,hgn_nucleartube2,hgn_nucleartube3,hgn_nuclearbomb") == 1 then  
		          if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then      
				        if fcount == FocusListMissile[Universe_CurrentPlayer()+1].actualfocusbomb then
				          Camera_FocusSobGroupWithBuffer ("splitnuclearbombs"..i, 1000, 100000, 1)
				          FocusListMissile[Universe_CurrentPlayer()+1].actualfocusbomb = FocusListMissile[Universe_CurrentPlayer()+1].actualfocusbomb + 1  
				          break
				        end  	  
				        fcount = fcount+1
				      end  
			      end  
		      end
		    end  
	    end
	  end      
	      
  end  

--missiles 
  if UI_IsScreenActive("tube2") == 1 then      
    UI_SetScreenVisible("tube2", 0)  
     
    --stabilisce quanti sono
    FocusListMissile[Universe_CurrentPlayer()+1].numfocusmissile = 0
    if nnb > 0 then    	      
	    for i = 0,nnb-1,1 do	 
	      if SobGroup_Empty("splitnuclearbombs"..i) == 0 then     
		      if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then	 
		        if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_torpedotube1,hgn_torpedotube2,hgn_torpedotube3,hgn_viper,hgn_viper_short,hgn_viper_short1,hgn_viper_ws,hgn_viper_ws1,hgn_minermissile,hgn_minermissile1,vgr_cruse,vgr_cruse1,vgr_minermissile,kad_minermissile,kad_jihadi,kpr_lightgranule") == 1 then  
		          if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then   
		        	  FocusListMissile[Universe_CurrentPlayer()+1].numfocusmissile = FocusListMissile[Universe_CurrentPlayer()+1].numfocusmissile + 1
		        	end  
		        end	
		      end
		    end  
	    end
	  else
	    FocusListMissile[Universe_CurrentPlayer()+1].numfocusmissile = 0 
	    FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmissile = 0 
	  end      
	  
	  --focus
	  fcount = 0  
	  if FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmissile >= FocusListMissile[Universe_CurrentPlayer()+1].numfocusmissile then
	    FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmissile = 0
	  end 	  
    if nnb > 0 then    	      
	    for i = 0,nnb-1,1 do	 
	      if SobGroup_Empty("splitnuclearbombs"..i) == 0 then     
		      if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then	
		        if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_torpedotube1,hgn_torpedotube2,hgn_torpedotube3,hgn_viper,hgn_viper_short,hgn_viper_short1,hgn_viper_ws,hgn_viper_ws1,hgn_minermissile,hgn_minermissile1,vgr_cruse,vgr_cruse1,vgr_minermissile,kad_minermissile,kad_jihadi,kpr_lightgranule") == 1 then  
		          if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then     
				        if fcount == FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmissile then
				          Camera_FocusSobGroupWithBuffer ("splitnuclearbombs"..i, 1000, 100000, 1)
				          FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmissile = FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmissile + 1  
				          break
				        end  	  
				        fcount = fcount+1
				      end  
			      end  
		      end
		    end  
	    end
	  end      
	      
  end  

--mines    
  if UI_IsScreenActive("tube3") == 1 then      
    UI_SetScreenVisible("tube3", 0) 
      
    --stabilisce quanti sono
    FocusListMissile[Universe_CurrentPlayer()+1].numfocusmine = 0
    if nnb > 0 then    	      
	    for i = 0,nnb-1,1 do	 
	      if SobGroup_Empty("splitnuclearbombs"..i) == 0 then     
		      if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then	 
		        if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_tangomine,hgn_tangomine_ws,hgn_tangomine_ws1,vgr_boa") == 1 then    
		          if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then 
		        	  FocusListMissile[Universe_CurrentPlayer()+1].numfocusmine = FocusListMissile[Universe_CurrentPlayer()+1].numfocusmine + 1
		        	end
		        end	
		      end
		    end  
	    end
	  else
	    FocusListMissile[Universe_CurrentPlayer()+1].numfocusmine = 0 
	    FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmine = 0 
	  end      
	  
	  --focus
	  fcount = 0  
	  if FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmine >= FocusListMissile[Universe_CurrentPlayer()+1].numfocusmine then
	    FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmine = 0
	  end 	  
    if nnb > 0 then    	      
	    for i = 0,nnb-1,1 do	 
	      if SobGroup_Empty("splitnuclearbombs"..i) == 0 then     
		      if SobGroup_OwnedBy("splitnuclearbombs"..i) == Universe_CurrentPlayer() then	
		        if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_tangomine,hgn_tangomine_ws,hgn_tangomine_ws1,vgr_boa") == 1 then   
		          if SobGroup_IsDocked("splitnuclearbombs"..i) == 0 then     
				        if fcount == FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmine then
				          Camera_FocusSobGroupWithBuffer ("splitnuclearbombs"..i, 1000, 100000, 1)
				          FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmine = FocusListMissile[Universe_CurrentPlayer()+1].actualfocusmine + 1  
				          break
				        end  	  
				        fcount = fcount+1
				      end  
			      end  
		      end
		    end  
	    end
	  end      
	      
  end
end 

function cleaninterface()
  UI_SetElementVisible("NewTaskbar", "MSframe", 0) 
  UI_SetElementVisible("NewTaskbar", "CSframe", 0) 
  UI_SetElementVisible("NewTaskbar", "OSframe", 0)
  UI_SetElementVisible("NewTaskbar", "Planetframe", 0)
  UI_SetElementVisible("NewTaskbar", "Sframe", 0) 
  UI_SetElementVisible("NewTaskbar", "crewcellframe", 0) 
  UI_SetElementVisible("NewTaskbar", "abilities", 0) 
  UI_SetElementVisible("NewTaskbar", "abilities1", 0) 
  UI_SetElementVisible("NewTaskbar", "RSframe", 0)  
  UI_SetElementVisible("NewTaskbar", "PSframe", 0)  
  UI_SetElementVisible("NewTaskbar", "containerframe", 0)
  UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 0)
  UI_SetElementVisible("NewTaskbar", "patcherframe", 0)
  UI_SetElementVisible("NewTaskbar", "fuelframe", 0)
  UI_SetElementVisible("NewTaskbar", "droneframe", 0)
  UI_SetElementVisible("NewTaskbar", "PowerGeneratorFrame", 0)
  UI_SetElementVisible("NewTaskbar", "test_cameraframe", 0)
  UI_SetElementVisible("NewTaskbar", "aircombatframe", 0)
  UI_SetElementVisible("NewTaskbar", "fusionframe", 0)
  UI_SetElementVisible("NewTaskbar", "ruframe", 0) 
  UI_SetElementVisible("NewTaskbar", "MBru", 0) 
  UI_SetElementVisible("NewTaskbar", "EngineeringBayFrame", 0) 
  UI_SetElementVisible("NewTaskbar", "ReinforcementPadFrame", 0)
  UI_SetElementVisible("NewTaskbar", "DerelictBattleshipFrame", 0)
  UI_SetElementVisible("NewTaskbar", "ResearchBoosterFrame", 0)
  UI_SetElementVisible("NewTaskbar", "minecontainerruframe", 0)
  UI_SetElementVisible("NewTaskbar", "containerruframe", 0)  
  UI_SetElementVisible("NewTaskbar", "medal1", 0) 
  UI_SetElementVisible("NewTaskbar", "medal2", 0) 
  UI_SetElementVisible("NewTaskbar", "medal3", 0) 
  UI_SetElementVisible("NewTaskbar", "medal4", 0) 
  UI_SetElementVisible("NewTaskbar", "medal5", 0) 
  UI_SetElementVisible("NewTaskbar", "medal6", 0) 
  UI_SetElementVisible("NewTaskbar", "medal7", 0) 
  UI_SetElementVisible("NewTaskbar", "medal8", 0) 
  UI_SetElementVisible("NewTaskbar", "medal9", 0) 
  UI_SetElementVisible("NewTaskbar", "medal10", 0) 
  UI_SetElementVisible("NewTaskbar", "torpedo", 0)
  UI_SetElementVisible("NewTaskbar", "callisto", 0) 
  UI_SetElementVisible("NewTaskbar", "kad_PrimaryPerk", 0) 
  UI_SetElementVisible("NewTaskbar", "kad_SecondaryPerk", 0)  
  UI_SetElementVisible("NewTaskbar", "merc_upgrade_attack", 0)
  UI_SetElementVisible("NewTaskbar", "merc_upgrade_defense", 0)
  UI_SetElementSize("NewTaskbar", "entrenchment", 0, 0);
  UI_SetElementSize("NewTaskbar", "mechanic", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionm", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionm1", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionblaster", 0, 0);
  UI_SetElementSize("NewTaskbar", "juggernaughtsolarcharge", 0, 0);
  UI_SetElementSize("NewTaskbar", "juggernaughtefp", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionprogenitor", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionchapel", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionspear", 0, 0);  
  UI_SetElementSize("NewTaskbar", "darkrealm", 0, 0);
  UI_SetElementSize("NewTaskbar", "fusionenforcer", 0, 0); 
  UI_SetElementSize("NewTaskbar", "monster", 0, 0);  
  UI_SetElementSize("NewTaskbar", "freacker", 0, 0);	
  UI_SetTextLabelText("NewTaskbar", "experience", "None"); 	
  UI_SetTextLabelText("NewTaskbar", "efficency", "Full");
  UI_SetTextLabelText("NewTaskbar", "energy", "None");
  
  UI_SetElementVisible("NewTaskbar", "rank1", 0)
  UI_SetElementVisible("NewTaskbar", "rank2", 0)
  UI_SetElementVisible("NewTaskbar", "rank3", 0)
  UI_SetElementVisible("NewTaskbar", "rank4", 0)
  UI_SetElementVisible("NewTaskbar", "rank5", 0)
  UI_SetElementVisible("NewTaskbar", "rank6", 0)
  UI_SetElementVisible("NewTaskbar", "rank7", 0)
  for h=1,7 do
  	UI_SetElementVisible("NewTaskbar", "scud_"..h, 0)
  end
  for h=1,8 do
  	UI_SetElementVisible("NewTaskbar", "rad_general_"..h, 0)
  end
  UI_SetElementVisible("NewTaskbar", "la", 0)
  UI_SetElementVisible("NewTaskbar", "sa", 0)
  UI_SetElementVisible("NewTaskbar", "ha", 0)
  UI_SetElementVisible("NewTaskbar", "btnDrive", 0)
  UI_SetElementVisible("NewTaskbar", "bm_clustermissile", 0)
  UI_SetElementVisible("NewTaskbar", "bm_scudmissile", 0)
  UI_SetElementVisible("NewTaskbar", "bm_discomissile", 0)
  UI_SetElementVisible("NewTaskbar", "bm_kickassmissile", 0)
  UI_SetElementVisible("NewTaskbar", "bm_kinetic", 0)
  UI_SetElementVisible("NewTaskbar", "bm_boomer", 0)
  UI_SetElementVisible("NewTaskbar", "bm_mortar", 0)
  UI_SetElementVisible("NewTaskbar", "bm_howitzer", 0)
  UI_SetElementVisible("NewTaskbar", "ark_set_gun", 0)
  UI_SetElementVisible("NewTaskbar", "ark_set_blaster", 0)
  UI_SetElementVisible("NewTaskbar", "ark_set_torpedo", 0)
  UI_SetElementVisible("NewTaskbar", "needle_at", 0)
  UI_SetElementVisible("NewTaskbar", "forcefield_l", 0)
  UI_SetElementVisible("NewTaskbar", "forcefield_r", 0)
  UI_SetElementVisible("NewTaskbar", "vgr_mothership_armour", 0)
  UI_SetElementVisible("NewTaskbar", "TLS", 0) 
  UI_SetElementVisible("NewTaskbar", "RTS", 0) 
  UI_SetElementVisible("NewTaskbar", "TLSD", 0) 
  UI_SetElementVisible("NewTaskbar", "RTSD", 0) 
  UI_SetElementVisible("NewTaskbar", "POH2", 0) 
  UI_SetElementVisible("NewTaskbar", "POH2D", 0) 
  UI_SetElementVisible("NewTaskbar", "LRS", 0)
  UI_SetElementVisible("NewTaskbar", "LPS", 0)
  UI_SetElementVisible("NewTaskbar", "LWS", 0)
  UI_SetElementVisible("NewTaskbar", "LCS", 0)
  UI_SetElementVisible("NewTaskbar", "LMS", 0)
  UI_SetElementVisible("NewTaskbar", "LRSD", 0)
  UI_SetElementVisible("NewTaskbar", "LPSD", 0)
  UI_SetElementVisible("NewTaskbar", "LWSD", 0)
  UI_SetElementVisible("NewTaskbar", "LCSD", 0)
  UI_SetElementVisible("NewTaskbar", "LMSD", 0)
  UI_SetElementVisible("NewTaskbar", "LMSa", 0)
  UI_SetElementVisible("NewTaskbar", "LMSDa", 0)
  UI_SetElementVisible("NewTaskbar", "BC", 0)
  UI_SetElementVisible("NewTaskbar", "BC1", 0)
  UI_SetElementVisible("NewTaskbar", "BCD", 0)
  UI_SetElementVisible("NewTaskbar", "GCB", 0)  
  UI_SetElementVisible("NewTaskbar", "GCB1", 0)
  UI_SetElementVisible("NewTaskbar", "GCBD", 0)
  UI_SetElementVisible("NewTaskbar", "P", 0)  
  UI_SetElementVisible("NewTaskbar", "P1", 0)
  UI_SetElementVisible("NewTaskbar", "PD", 0)
  UI_SetElementVisible("NewTaskbar", "BS", 0)  
  UI_SetElementVisible("NewTaskbar", "BS1", 0)
  UI_SetElementVisible("NewTaskbar", "BSD", 0)
  UI_SetElementVisible("NewTaskbar", "S", 0)
  UI_SetElementVisible("NewTaskbar", "S1", 0)
  UI_SetElementVisible("NewTaskbar", "SD", 0)  
  UI_SetElementVisible("NewTaskbar", "LJ1", 0)
  UI_SetElementVisible("NewTaskbar", "LJ2", 0)
  UI_SetElementVisible("NewTaskbar", "LJ3", 0)
  UI_SetElementVisible("NewTaskbar", "LJ4", 0)
  UI_SetElementVisible("NewTaskbar", "LJ1D", 0)
  UI_SetElementVisible("NewTaskbar", "LJ2D", 0)
  UI_SetElementVisible("NewTaskbar", "LJ3D", 0)
  UI_SetElementVisible("NewTaskbar", "LJ4D", 0)
  UI_SetElementVisible("NewTaskbar", "LJ1a", 0)
  UI_SetElementVisible("NewTaskbar", "LJ2a", 0)
  UI_SetElementVisible("NewTaskbar", "LJ3a", 0)
  UI_SetElementVisible("NewTaskbar", "LJ4a", 0)
  UI_SetElementVisible("NewTaskbar", "LJ1Da", 0)
  UI_SetElementVisible("NewTaskbar", "LJ2Da", 0)
  UI_SetElementVisible("NewTaskbar", "LJ3Da", 0)
  UI_SetElementVisible("NewTaskbar", "LJ4Da", 0)
	UI_SetElementSize("NewTaskbar", "subsystems", 0, 0);
  UI_SetElementSize("NewTaskbar", "subsystem6", 32, 24); 
  UI_SetElementSize("NewTaskbar", "subsystem7", 32, 24); 
  UI_SetElementSize("NewTaskbar", "subsystem8", 32, 24); 
  UI_SetElementSize("NewTaskbar", "subsystem9", 32, 24); 
  UI_SetElementSize("NewTaskbar", "subsystem10", 32, 24); 
  UI_SetElementSize("NewTaskbar", "subsystem11", 32, 24); 
  UI_SetElementSize("NewTaskbar", "subsystem12", 32, 24);	  	
  
  if Universe_GameTime() > 5 then
	  if SobGroup_Empty("star_sol") == 0 then
	  else
	  	if GameRulesName ~= "Simplex Territories" then
	    	UI_SetElementVisible("New1", "sundamagetextred", 0)		--used as clock in territories mode
	    end
	    UI_SetElementVisible("New1", "sundamagetextblu", 0)
	    UI_SetElementVisible("New1", "sundamagetext", 0)
	  end
	end
	Rule_Remove("cleaninterface")
end

---MAIN FUNCTION SELECTED INTERFACE---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
Selected_Runtimes = 9

function selected()
	--print("selected - Start")
	if Temp_GlobalVariable.Selected_Save > Selected_Runtimes then		--one runtime for one small chunk of the codes
		Temp_GlobalVariable.Selected_Save = 1
	end
	Temp_GlobalVariable.Selected_NextInterval = 0.7
	
  local playerIndex = Universe_CurrentPlayer()    
  local playerIndexList = playerIndex + 1 
	local interfacecleaned = 0 
	SobGroup_Clear("selected") 
  SobGroup_Clear("temp")
  SobGroup_Clear("temp1")
  SobGroup_Clear("temp2")
	
	Temp_GlobalVariable.SelectedShips[playerIndexList] = 0
  exp1 = 0  
  expFi1 = 0
  expCo1 = 0
  en = 0

	if Temp_GlobalVariable.enablebtnparade[playerIndexList] == Temp_GlobalVariable.Selected_Save then
		Temp_GlobalVariable.enablebtnparade[playerIndexList] = 0
	end
	if Temp_GlobalVariable.enablebtncallisto[playerIndexList] == Temp_GlobalVariable.Selected_Save then
		Temp_GlobalVariable.enablebtncallisto[playerIndexList] = 0
	end
	if Temp_GlobalVariable.enablebtnperforate[playerIndexList] == Temp_GlobalVariable.Selected_Save then
		Temp_GlobalVariable.enablebtnperforate[playerIndexList] = 0
	end
	if Temp_GlobalVariable.enablebtnheavyioncannon[playerIndexList] == Temp_GlobalVariable.Selected_Save then
		Temp_GlobalVariable.enablebtnheavyioncannon[playerIndexList] = 0
	end
	if Temp_GlobalVariable.enablebtnnuclear[playerIndexList] == Temp_GlobalVariable.Selected_Save then
		Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = 0
	end

	if interfacecleanedtot[playerIndexList] == Temp_GlobalVariable.Selected_Save then
	  cleaninterface()    	
	end
	
	if Temp_GlobalVariable.Selected_Save == 1 then
	---share RU with allies
		local RealRUToSetList = { 0, 0, 0, 0, 0, 0 }
	  local NewRUToSetList = { 0, 0, 0, 0, 0, 0 }
	  local RUChangedList = { 0, 0, 0, 0, 0, 0 }
	  local AlliesNumList = { 0, 0, 0, 0, 0, 0 }
		if sharerus == "yes" then
			---get and store everyone's data first
		  local P_idx = 0
		  while P_idx < Universe_PlayerCount() do
		  	P_idxList = P_idx + 1 
		  	if Player_IsAlive(P_idx) == 1 then
					RUChangedList[P_idxList] = Player_GetRU(P_idx) - LastRUList[P_idxList]
					NewRUToSetList[P_idxList] = Player_GetRU(P_idx) + RUChangedList[P_idxList]
		  	end
		  	P_idx = P_idx + 1
		  end
			---preparation and calculation
		  local P_idx = 0
		  while P_idx < Universe_PlayerCount() do
		  	P_idxList = P_idx + 1 
		    if Player_IsAlive(P_idx) == 1 then
					for i = 0, Universe_PlayerCount() - 1 do
						if AreAllied(P_idx, i) == 1 and AreAllied(i, P_idx) == 1 and i ~= P_idx then		--who are my allies
							if Player_IsAlive(i) == 1 then		--if allies are dead, don't consider their RU
			        	NewRUToSetList[P_idxList] = NewRUToSetList[P_idxList] + RUChangedList[i+1]
			        	AlliesNumList[P_idxList] = AlliesNumList[P_idxList] + 1
			        end
			      end
			    end
		    end
		    P_idx = P_idx + 1
		  end
		  ---equalize RUs
		  local P_idx = 0
		  while P_idx < Universe_PlayerCount() do
		  	P_idxList = P_idx + 1 
		    if Player_IsAlive(P_idx) == 1 then
		    	RealRUToSetList[P_idxList] = NewRUToSetList[P_idxList]
					for i = 0, Universe_PlayerCount() - 1 do
						if AreAllied(P_idx, i) == 1 and AreAllied(i, P_idx) == 1 and i ~= P_idx then		--who are my allies
							if Player_IsAlive(i) == 1 then		--if allies are dead, don't consider their RU
			        	RealRUToSetList[P_idxList] = RealRUToSetList[P_idxList] + NewRUToSetList[i+1]
			        end
			      end
			    end
			    RealRUToSetList[P_idxList] = RealRUToSetList[P_idxList]/(AlliesNumList[P_idxList] + 1)
		    end
		    P_idx = P_idx + 1
		  end
		  ---set RU
			local P_idx = 0
		  while P_idx < Universe_PlayerCount() do
		  	P_idxList = P_idx + 1 
		  	if Player_IsAlive(P_idx) == 1 then
		  		if RealRUToSetList[P_idxList] < 0 then
		  			Player_SetRU(P_idx, 0)
		  		else
			  		if RealRUToSetList[P_idxList] >= RUMaxCapacityList[P_idxList] then
			        RealRUToSetList[P_idxList] = RUMaxCapacityList[P_idxList]
			      end
						Player_SetRU(P_idx, RealRUToSetList[P_idxList])
					end
					LastRUList[P_idxList] = RealRUToSetList[P_idxList]
				end
				P_idx = P_idx + 1
			end
		end
	
	---unit count per interface update  
	  local runselected = 0
	  local numeromegaliti = 0
	  if hwsaving == 0 then  
		  UI_SetElementVisible("NewTaskbar", "btnObjectives", 1)    
			UI_SetElementVisible("NewTaskbar", "btnChat", 1)    
			UI_SetElementVisible("NewTaskbar", "btnDiplomacy", 1)    
			UI_SetElementVisible("NewTaskbar", "btnRecall", 1) 	
			local np = 0  
			local isfull = 0
			while np < Universe_PlayerCount() do    
				if Player_IsAlive(np) == 1 then          
	        if isfull == 0 then				
						if Player_FillProximitySobGroup("temp", -1, "Player_Ships"..np, 1000000) == 1 then
							if SobGroup_Empty("temp") == 0 then
								numeromegaliti = SobGroup_Count("temp")
								isfull = 1
							end	
						end 
					end	
	        --SobGroup_SetInvulnerability("Player_Ships"..np, 0)		--WTF IS THIS?!
	        if ((year==0 and gametime<45) or year>0) then
		        RUList[np+1] = Player_GetRU(np)
		        if RUList[np+1] >= RUMaxCapacityList[np+1] then
		          Player_SetRU(np, RUMaxCapacityList[np+1])	
		        end 
		      end  				
				end
				np = np + 1	
			end   
	  end  
	  runselected = runselected + numeromegaliti/1.5
	  local uc = 0  
	  while uc < Universe_PlayerCount() do    
	    if Player_IsAlive(uc) == 1 then      
	      runselected = runselected + pilotpopdisplayList[uc+1]    
	    end
	    uc = uc + 1	
	  end 
	  runselected = (runselected/65)*interface  
	  if runselected > 2.9*interface then  
	    runselected = 2.9*interface
	  elseif runselected < 0.5*interface then 
	    runselected = 0.5*interface  
	  end
	  Temp_GlobalVariable.Selected_NextInterval = runselected
	  
	---Mothership------------------------------------------------------------------------------------------------------------------------------------------------------------ 
	  for i = 0,nms-1,1 do
	    if SobGroup_Empty("splitmotherships"..i) == 0 then
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
				if hwsaving == 0 then 
					energyConsume("splitmotherships"..i,1,2)		      
					if SobGroup_GetHardPointHealth("splitmotherships"..i, "pg") > 0 then
						FX_StartEvent_Smart("splitmotherships"..i, "EnergyLow")
					else              
					end	
					if SobGroup_GetHardPointHealth("splitmotherships"..i, "pg1") > 0 then
						FX_StartEvent_Smart("splitmotherships"..i, "EnergyLow1")
					else              
					end	
				--sundamage	
				elseif hwsaving == 1 and SobGroup_Empty("star_sol") == 0 then
					sundamageinterface = SobGroup_TakeDamageSol("splitmotherships"..i,0.6,Temp_GlobalVariable.Selected_NextInterval)				
				end
				if SobGroup_InWorldBoundForKillingOnly("splitmotherships"..i, 0) == 0 then 
					SobGroup_SetHealth("splitmotherships"..i, 0)
				end			
				
				--reduce the super high speed in normal action
				SetAfterburnerForShip("splitmotherships"..i, 22200, "CapitalAfterburner", "AfterBurn", 1)
				
	      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then  
	--Orders
	        orders("splitmotherships"..i, "clear",0,0)  
	        orders("splitmotherships"..i, "parade",0,0)  
	        orders("splitmotherships"..i, "dock",0,0)
		      orders("splitmotherships"..i, "evacuation",50,5) 
		      orders("splitmotherships"..i, "guard",0,0)      
			    SobGroup_ForceStayDockedIfDocking("splitmotherships"..i)	
	--heavy ion cannon	      
		      if Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "hic3") == 1 then
		        if bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] == 5 then
			        Player_UnrestrictBuildOption(SobGroup_OwnedBy("splitmotherships"..i), "Hgn_MothershipCannon4")	
			        Player_RestrictBuildOption(SobGroup_OwnedBy("splitmotherships"..i), "Hgn_MothershipCannon3")			               
			        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 then
			          SobGroup_SetHardPointHealth("splitmotherships"..i, "Weapon 2", 0)		          
			          bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 6 
			        else
			          bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 7  			          
			        end
			      elseif bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] == 6 then  	
			        SobGroup_CreateSubSystem("splitmotherships"..i, "Hgn_MothershipCannon4")	
			        bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 7        
		        end         
		      elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "hic2") == 1 then
		        if bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] == 3 then
			        Player_UnrestrictBuildOption(SobGroup_OwnedBy("splitmotherships"..i), "Hgn_MothershipCannon3")	
			        Player_RestrictBuildOption(SobGroup_OwnedBy("splitmotherships"..i), "Hgn_MothershipCannon2")			               
			        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 then
			          SobGroup_SetHardPointHealth("splitmotherships"..i, "Weapon 2", 0)		          
			          bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 4 
			        else
			          bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 5  			          
			        end
			      elseif bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] == 4 then  	
			        SobGroup_CreateSubSystem("splitmotherships"..i, "Hgn_MothershipCannon3")	
			        bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 5        
		        end     
		      elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "hic1") == 1 then
		        if bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] == 1 then
			        Player_UnrestrictBuildOption(SobGroup_OwnedBy("splitmotherships"..i), "Hgn_MothershipCannon2")	
			        Player_RestrictBuildOption(SobGroup_OwnedBy("splitmotherships"..i), "Hgn_MothershipCannon1")			               
			        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 then
			          SobGroup_SetHardPointHealth("splitmotherships"..i, "Weapon 2", 0)		          
			          bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 2 
			        else
			          bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 3  			          
			        end
			      elseif bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] == 2 then  	
			        SobGroup_CreateSubSystem("splitmotherships"..i, "Hgn_MothershipCannon2")	
			        bloccoioncannon[SobGroup_OwnedBy("splitmotherships"..i)+1] = 3        
		        end   
		      else		      
		      end
	--anti-radiation
		      --if Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MSRadiationDefenseField") == 1 then 	
		        --if SobGroup_IsDoingAbility("splitmotherships"..i, AB_DefenseField) == 1 then        
			        --SobGroup_AbilityActivate("splitmotherships"..i, AB_DefenseFieldShield, 1)		            
		        --else
		          --SobGroup_AbilityActivate("splitmotherships"..i, AB_DefenseFieldShield, 0)
		        --end
		      --else
		        --SobGroup_AbilityActivate("splitmotherships"..i, AB_DefenseFieldShield, 0)
		      --end	      
	--dockaggio con sy	     
	        if ec_intro_count >= 12 then
						if SobGroup_IsDoingAbility("splitmotherships"..i, AB_Dock) == 1 then        
							SobGroup_AbilityActivate("splitmotherships"..i, AB_Scuttle, 0)		            
						else
							SobGroup_AbilityActivate("splitmotherships"..i, AB_Scuttle, 1)
						end 		
	        end
	--costruzione battle asset
					if SobGroup_IsBuilding("splitmotherships"..i, "canbuildpoh3") == 1 then
				  	FX_StartEvent("splitmotherships"..i, "Upgrading")
				  end
				  if SobGroup_GetHardPointHealth("splitmotherships"..i, "poh2") > 0 and SobGroup_GetHardPointHealth("splitmotherships"..i, "canbuildpoh3") == 0 then
		        SobGroup_CreateSubSystem("splitmotherships"..i, "canbuildpoh3")
		      end
		      if (Player_CanResearch(SobGroup_OwnedBy("splitmotherships"..i), "canbuildpoh2" ) == 1 and SobGroup_IsDocked("splitmotherships"..i) == 1 or SobGroup_GetHardPointHealth("splitmotherships"..i, "canbuildpoh3") > 0) and SobGroup_GetHardPointHealth("splitmotherships"..i, "poh2") == 0 then
		        SobGroup_CreateSubSystem("splitmotherships"..i, "poh2")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "HGN_SCC_6xAC_Turret_cf1")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "HGN_SCC_6xAC_Turret_cf2")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "HGN_SCC_6xAC_Turret_cf3")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "HGN_SCC_6xAC_Turret_cf4")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_nuclear")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_armor_bottom")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_armor_top")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_armor_bridge")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_armor_engine")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_armor_plates")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_ionbeamturret2")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_ionbeamturret3")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_ionbeamturret4")
		        SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_ionbeamturret5")		         
		        Ping_LabelVisible(Ping_AddSobGroup("Adv. Pride of Hiigara (Battle Asset)", "name", "splitmotherships"..i), 1)
		        if SobGroup_OwnedBy("splitmotherships"..i) == playerIndex then
			        Subtitle_Add(Actor_FleetCommand,"Weapon systems fully charged, Mothership battle asset complete",5)
			        Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47012")
			      end
		      end
			    if SobGroup_IsDocked("splitmotherships"..i) == 1 then		
			      if SobGroup_GetHardPointHealth("splitmotherships"..i, "msshield") == 0 then
			      	SobGroup_CreateSubSystem("splitmotherships"..i, "msshield")
			      end	    
	--gestione del danno		        
			      if SobGroup_HealthPercentage("splitmotherships"..i) <= 0.25 then
			        SobGroup_SetInvulnerability("splitmotherships"..i, 1)	
			        mscollateraldamage[SobGroup_OwnedBy("splitmotherships"..i)+1] = 1
			      else
			        SobGroup_SetInvulnerability("splitmotherships"..i, 0) 			        
			        if Universe_GameTime() - lastUniverse_GameTime >= 5 then        
				        danno = (1-SobGroup_GetHardPointHealth("splitmotherships"..i, "msshield"))		        
				        if Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "CapitalHealthUpgrade3") == 1 then
				          danno = danno*0.6	
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "CapitalHealthUpgrade2") == 1 then
				          danno = danno*0.7
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "CapitalHealthUpgrade1") == 1 then
				          danno = danno*0.8
				        else
				          danno = danno*0.9
				        end				        
				        if danno > 0.05 then
				          danno = 0.05 
				        end  		        
				        SobGroup_SetHealth("splitmotherships"..i, SobGroup_HealthPercentage("splitmotherships"..i) - danno)		   
				      end   
			        if SobGroup_GetHardPointHealth("splitmotherships"..i, "msshield") < 0.95 then
			          SobGroup_SetHardPointHealth("splitmotherships"..i, "msshield", 0.95)
			        end	                                
			      end     
	--disabilitazione abilit?se ms dockata	      	      
			      SobGroup_AbilityActivate("splitmotherships"..i, AB_Scuttle, 0) 
			      SobGroup_AbilityActivate("splitmotherships"..i, AB_Move, 0) 
		        SobGroup_AbilityActivate("splitmotherships"..i, AB_Attack, 0)
		        if GetGameRubric() ~= GR_CAMPAIGN or SobGroup_Empty("hgn_shipyard_g"..SobGroup_OwnedBy("splitmotherships"..i)) == 0 then
				      if bloccomsdocking[SobGroup_OwnedBy("splitmotherships"..i)+1] == 0 then	
				        FX_StartEvent("splitmotherships"..i, "Docking")
				        SobGroup_AllowPassiveActionsAlways_Smart("splitmotherships"..i, 1)
				        if SobGroup_OwnedBy("splitmotherships"..i) == playerIndex and year > 1 then  		           
					        Subtitle_Add(Actor_FleetCommand,"The Mothership is docked and standing down",5)
					        Sound_SpeechPlay("data:sound\\speech\\nis\\nis_14b\\56146")
				        end
				        bloccomsdocking[SobGroup_OwnedBy("splitmotherships"..i)+1] = 1
				      end
				    end       
			      lastUniverse_GameTimeMSDock[SobGroup_OwnedBy("splitmotherships"..i)+1] = Universe_GameTime()   
			    else
			    	if GetGameRubric() ~= GR_CAMPAIGN or SobGroup_Empty("hgn_shipyard_g"..SobGroup_OwnedBy("splitmotherships"..i)) == 0 then
				      if bloccomsdocking[SobGroup_OwnedBy("splitmotherships"..i)+1] == 1 then	  	            
				        bloccomsdocking[SobGroup_OwnedBy("splitmotherships"..i)+1] = 0
				        FX_StartEvent("splitmotherships"..i, "Launching")
				        SobGroup_AllowPassiveActionsAlways_Smart("splitmotherships"..i, 0)
				        if SobGroup_OwnedBy("splitmotherships"..i) == playerIndex and year > 1 then	          
					        Subtitle_Add(Actor_FleetCommand,"The Mothership is standing by",5) 
					        Sound_SpeechPlay("data:sound\\speech\\nis\\nis_01a\\56013")  
					      end  
				      end
						end
			      if Universe_GameTime() - lastUniverse_GameTimeMSDock[SobGroup_OwnedBy("splitmotherships"..i)+1] >= 40 then		        
				      if SobGroup_GetHardPointHealth("splitmotherships"..i, "msshield") > 0 then
				      	SobGroup_SetHardPointHealth("splitmotherships"..i, "msshield", 0)   	
				      end		      
				      if ec_intro_count >= 12 then
				        SobGroup_AbilityActivate("splitmotherships"..i, AB_Scuttle, 1) 
				      end  
				      if ec_intro_count >= 8 then  	
				      	if SobGroup_CanDoAbility("splitmotherships"..i, AB_Steering) == 1 then		--coordinate with AI salvage debug fuction in sobgroupfunctions.lua
				        	SobGroup_AbilityActivate("splitmotherships"..i, AB_Move, 1) 
				        end
				      end  
				      if ec_intro_count >= 14 then  	
			          SobGroup_AbilityActivate("splitmotherships"..i, AB_Attack, 1)    
			        end  
			        lastUniverse_GameTimeMSDock[SobGroup_OwnedBy("splitmotherships"..i)+1] = Universe_GameTime()            
			      end             
			    end		        
	---shield sound
			    if SobGroup_IsDoingAbility("splitmotherships"..i, AB_DefenseField) == 1 then
			      FX_StartEvent("splitmotherships"..i, "shield")	
			    end		
	---viper for AI 	
	      	if ((Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "isai" ) == 1) and
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitmotherships"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitmotherships"..i), "splitmotherships"..i, 17500) == 1) and
						 (SobGroup_IsDoingAbility("splitmotherships"..i, abilityList[2]) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitmotherships"..i), "hgn_viper") < CPULODvalueList[SobGroup_OwnedBy("splitmotherships"..i)+1]) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitmotherships"..i, "hgn_viper")
						--SobGroup_CreateShip("splitmotherships"..i, "hgn_viper1")
	      	  Player_SetRU(SobGroup_OwnedBy("splitmotherships"..i), Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) - 750)
	      	end
	      	if ((Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "isai" ) == 1) and
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitmotherships"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitmotherships"..i), "splitmotherships"..i, 12500) == 1) and
						 (SobGroup_IsDoingAbility("splitmotherships"..i, abilityList[2]) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitmotherships"..i), "hgn_tangomine") < 1) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitmotherships"..i, "hgn_tangomine")
						--SobGroup_CreateShip("splitmotherships"..i, "hgn_tangomine1")
	      	  Player_SetRU(SobGroup_OwnedBy("splitmotherships"..i), Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) - 750)
	      	end
			  elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "vgr_mothership, vgr_mothership_makaan") == 1 then
	--Orders        
	        orders("splitmotherships"..i, "parade",0,0)  	      
	        orders("splitmotherships"..i, "dock",0,0)
	        orders("splitmotherships"..i, "clear",0,0)
		      orders("splitmotherships"..i, "guard",0,0)  
	--Shield Glow
					if SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_l") > 0 then
						local health = SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_l")
						if SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_l") > 1 then
							SobGroup_SetHardPointHealth("splitmotherships"..i, "shield_l", 1)
							health = 1
						end
						if health < SobGroup_GetHardPointHealth("splitmotherships"..i, "lasthealth_l") then
							FX_StartEvent("splitmotherships"..i, "phase_l")
						end
						SobGroup_SetHardPointHealth("splitmotherships"..i, "lasthealth_l", health)
					end
					if SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_r") > 0 then
						local health = SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_r")
						if SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_r") > 1 then
							SobGroup_SetHardPointHealth("splitmotherships"..i, "shield_r", 1)
							health = 1
						end
						if health < SobGroup_GetHardPointHealth("splitmotherships"..i, "lasthealth_r") then
							FX_StartEvent("splitmotherships"..i, "phase_r")
						end
						SobGroup_SetHardPointHealth("splitmotherships"..i, "lasthealth_r", health)
					end
	--cruise missile for AI
					if ((Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "isai" ) == 1) and
					   (SobGroup_IsDoingAbility("splitmotherships"..i, abilityList[2]) == 1) and 
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitmotherships"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitmotherships"..i), "splitmotherships"..i, 17500) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitmotherships"..i), "vgr_cruse") < CPULODvalueList[SobGroup_OwnedBy("splitmotherships"..i)+1]) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitmotherships"..i, "vgr_cruse")						
	      	  Player_SetRU(SobGroup_OwnedBy("splitmotherships"..i), Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) - 750)
	      	end
					if ((Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "isai" ) == 1) and
					   (SobGroup_IsDoingAbility("splitmotherships"..i, abilityList[2]) == 1) and 
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitmotherships"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitmotherships"..i), "splitmotherships"..i, 12500) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitmotherships"..i), "vgr_boa") < 1) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitmotherships"..i, "vgr_boa")						
	      	  Player_SetRU(SobGroup_OwnedBy("splitmotherships"..i), Player_GetRU(SobGroup_OwnedBy("splitmotherships"..i)) - 750)
	      	end
				elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "rad_mothership") == 1 then	
	--Orders        	
	      	orders("splitmotherships"..i, "guard",0,0)	
	      	orders("splitmotherships"..i, "parade",0,0)
	      	orders("splitmotherships"..i, "dock",0,0)
	      	orders("splitmotherships"..i, "clear",0,0)
	      	ExcuteExperienceSubsystemsWithFullRange("splitmotherships"..i)
	      	RadExperienceAbilityExecute("splitmotherships"..i)
	      	--Choose Your General help tip
	      	if SobGroup_OwnedBy("splitmotherships"..i) == playerIndex and SobGroup_GetHardPointHealth("splitmotherships"..i, "rad_general_help") > 0 then
	      		SobGroup_SetHardPointHealth("splitmotherships"..i, "rad_general_help", 0)
		        UI_SetScreenEnabled("general", 1)
						UI_SetScreenVisible("general", 1)
						UI_SetTextLabelText("general", "lblSubTitle", "FAMILY TREE OF THE TURANIC RAIDERS");
						UI_SetElementVisible("general", "generals", 1)
						UI_SetTextLabelText("general", "lblDescription1", "Elect one President on the Pirate Ship to enhance certain aspects of the entire fleet");
						UI_SetTextLabelText("general", "lblDescription2", "Only one President can be elected and cannot be changed until the Pirate Ship is rebuilt");
						UI_ShowRandomElement("general", "btnOk")
	      	end
			  end    
	---selection
		    if SobGroup_Selected_Smart("splitmotherships"..i) == 1 then	        		
					cleaninterface()	
	        interfacecleaned=interfacecleaned+1
	        DriveMode_DisplayButtonForShip("splitmotherships"..i)
		      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitmotherships"..i))));
		      ---race for taskbar	    
		      RaceDisplayInInterface(SobGroup_OwnedBy("splitmotherships"..i))
		      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then    
		        if SobGroup_GetHardPointHealth("splitmotherships"..i, "pds") > 0 then
		          --inserimento icona? 
		        end	      	    	
				    shield = 0		
					  heavyioncannon = 0  	  
					  if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then 
					    shield = 5000
					  end  
					  if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 then 
					    heavyioncannon = 2500            
					  end	       
				    if Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MothershipDEFENSEFIELDTIMEUpgrade3" ) == 1 then
				      shield = shield * 1.75            
				    elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MothershipDEFENSEFIELDTIMEUpgrade2" ) == 1 then
				      shield = shield * 1.5            
				    elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MothershipDEFENSEFIELDTIMEUpgrade1" ) == 1 then
				      shield = shield * 1.25       
				    end   	   
				    if Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MothershipSHIELDREGENERATIONRATEUpgrade3" ) == 1 then
				      shield = shield * 1.9            
				    elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MothershipSHIELDREGENERATIONRATEUpgrade2" ) == 1 then
				      shield = shield * 1.6            
				    elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "MothershipSHIELDREGENERATIONRATEUpgrade1" ) == 1 then
				      shield = shield * 1.3       
				    end   	  
				    if Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "hic3" ) == 1 then
				      heavyioncannon = heavyioncannon * 1.6            
				    elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "hic2" ) == 1 then
				      heavyioncannon = heavyioncannon * 1.4            
				    elseif Player_HasResearch(SobGroup_OwnedBy("splitmotherships"..i), "hic1" ) == 1 then
				      heavyioncannon = heavyioncannon * 1.2       
				    end 
				    floor(shield)
				    floor(heavyioncannon)  	  
				    UI_SetElementVisible("NewTaskbar", "MSframe", 1)
				    UI_SetTextLabelText("NewTaskbar", "shield", ""..shield);   
				    UI_SetTextLabelText("NewTaskbar", "heavyioncannon", ""..heavyioncannon);  
				    UI_SetElementVisible("NewTaskbar", "patcherframe", 1)	 
				    if Player_GetRace(SobGroup_OwnedBy("splitmotherships"..i)) == Race_Hiigaran and i < nms and Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitmotherships"..i, "experience") < 0.5 then
					  	UI_SetTextLabelText("NewTaskbar", "patcher", ""..SobGroup_Count("repairingpatcher" .. tostring("splitmotherships"..i)));
					  else
					  	UI_SetTextLabelText("NewTaskbar", "patcher", "0"); 		  
					  end
		        if SobGroup_IsDocked("splitmotherships"..i) == 0 then
				    	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	
				    end		
	---Weapons set		    	    
					  if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 3") > 0 then 
					    UI_SetElementVisible("NewTaskbar", "TLS", 1) 					        
					  else			    				    
					    UI_SetElementVisible("NewTaskbar", "TLSD", 1) 	
					  end  				  
					  if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 7") > 0 then 
					    UI_SetElementVisible("NewTaskbar", "RTS", 1) 					       
					  else			    				    
					    UI_SetElementVisible("NewTaskbar", "RTSD", 1) 	 
					  end  
					  if SobGroup_GetHardPointHealth("splitmotherships"..i, "poh2") > 0 then 
					    UI_SetElementVisible("NewTaskbar", "POH2", 1) 				    			    
					  else			    				    
					    UI_SetElementVisible("NewTaskbar", "POH2D", 1) 	
					  end  				 				  
					  if ((SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 or SobGroup_GetHardPointHealth("splitmotherships"..i, "k3") > 0) and SobGroup_OwnedBy("splitmotherships"..i) == playerIndex) then  
					    Temp_GlobalVariable.enablebtnheavyioncannon[playerIndexList] = Temp_GlobalVariable.Selected_Save					  
					  end
					  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);  
				  elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "vgr_mothership, vgr_mothership_makaan") == 1 then
				  	UI_SetElementVisible("NewTaskbar", "abilities1", 1)
				  	UI_SetElementSize("NewTaskbar", "mechanic", 66, 15)
				  	if SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_l") > 0 then	
			        UI_SetElementVisible("NewTaskbar", "forcefield_l", 1)
			      else
			        UI_SetElementVisible("NewTaskbar", "forcefield_l", 0)
			      end
			      if SobGroup_GetHardPointHealth("splitmotherships"..i, "shield_r") > 0 then	
			        UI_SetElementVisible("NewTaskbar", "forcefield_r", 1)
			      else
			        UI_SetElementVisible("NewTaskbar", "forcefield_r", 0)
			      end
			      if SobGroup_GetHardPointHealth("splitmotherships"..i, "armor") > 0 then	
			        UI_SetElementVisible("NewTaskbar", "vgr_mothership_armour", 1)
			      else
			        UI_SetElementVisible("NewTaskbar", "vgr_mothership_armour", 0)
			      end
				    if Player_GetRace(SobGroup_OwnedBy("splitmotherships"..i)) == Race_Vaygr and i < nms and Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitmotherships"..i, "experience") < 0.5 then
					  	UI_SetTextLabelText("NewTaskbar", "mechanictext", ""..SobGroup_Count("repairingpatcher" .. tostring("splitmotherships"..i)));
					  else
					  	UI_SetTextLabelText("NewTaskbar", "mechanictext", "0"); 		  
					  end
				  	UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);  
	          if SobGroup_GetHardPointHealth("splitmotherships"..i, "c") > 0 and SobGroup_OwnedBy("splitmotherships"..i) == playerIndex then  
							--Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
						end
				  elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "rad_mothership") == 1 then
				  	UI_SetElementSize("NewTaskbar", "subsystems", 32, 24)
				  	for h=1,8 do
					  	if Rad_GeneralList.General[SobGroup_OwnedBy("splitmotherships"..i) + 1] == h then
				        UI_SetElementVisible("NewTaskbar", "rad_general_"..h, 1)
				      else
				      	UI_SetElementVisible("NewTaskbar", "rad_general_"..h, 0)
				      end
				    end
					end								
				  exp1 = SobGroup_GetHardPointHealth("splitmotherships"..i, "experience") * 10000		 			  		  		  		  	        
				  if exp1 > 999 then
				  	exp1 = 999
				  end
				  UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 				  	
				  eff = -(floor((1 - SobGroup_GetHardPointHealth("splitmotherships"..i, "efficency")) * 10))		 		  		  		  	        
				  if eff <= -1 then	
				    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff); 	
				  end			  
					en = SobGroup_GetHardPointHealth("splitmotherships"..i, "en")  
					UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));		
				end 
			end	  
		end		   
	  
	---Research Station------------------------------------------------------------------------------------------------------------------------------------------------------------ 	  	  
	  if nrs > 0 then  	
		  for i = 0,nrs-1,1 do
		    if SobGroup_Empty("splitresearchstations"..i) == 0 then		    
	
	--Orders        
	        orders("splitresearchstations"..i, "evacuation",20,2)       
		      orders("splitresearchstations"..i, "guard",0,0) 	      
	        	     	
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none)  
	        if hwsaving == 1 then       
	          energyConsume("splitresearchstations"..i,1,1)	       
	        --sundamage	
	        elseif hwsaving == 2 and SobGroup_Empty("star_sol") == 0 then
	          sundamageinterface = SobGroup_TakeDamageSol("splitresearchstations"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)				
		      end          
		      
					if SobGroup_InWorldBoundForKillingOnly("splitresearchstations"..i, 0) == 0 then 
						SobGroup_SetHealth("splitresearchstations"..i, 0)
					end
					
					--reduce the super high speed in normal action
		      SetAfterburnerForShip("splitresearchstations"..i, 34220, "CapitalAfterburner", "AfterBurn", 1)
		      
		      SobGroup_ForceStayDockedIfDocking("splitresearchstations"..i)	          			    
			    if SobGroup_IsDocked("splitresearchstations"..i) == 1 then	
			      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "rsshield") == 0 then
			      	SobGroup_CreateSubSystem("splitresearchstations"..i, "rsshield")
			      end	     
	--gestione del danno		       	     
			      if SobGroup_HealthPercentage("splitresearchstations"..i) <= 0.25 then
			        SobGroup_SetInvulnerability("splitresearchstations"..i, 1)	
			        rscollateraldamage[SobGroup_OwnedBy("splitresearchstations"..i)+1] = 1
			      else
			        SobGroup_SetInvulnerability("splitresearchstations"..i, 0)	       
			        if Universe_GameTime() - lastUniverse_GameTime >= 5 then        
				        danno = (1-SobGroup_GetHardPointHealth("splitresearchstations"..i, "rsshield"))		        
				        if Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "CapitalHealthUpgrade3") == 1 then
				          danno = danno*0.6	
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "CapitalHealthUpgrade2") == 1 then
				          danno = danno*0.7
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "CapitalHealthUpgrade1") == 1 then
				          danno = danno*0.8
				        else
				          danno = danno*0.9
				        end				        
				        if danno > 0.06 then
				          danno = 0.06 
				        end  		        
				        SobGroup_SetHealth("splitresearchstations"..i, SobGroup_HealthPercentage("splitresearchstations"..i) - danno)		   
				      end   
			        if SobGroup_GetHardPointHealth("splitresearchstations"..i, "rsshield") < 0.94 then
			          SobGroup_SetHardPointHealth("splitresearchstations"..i, "rsshield", 0.94)
			        end	       
			      end     		      
		        SobGroup_AbilityActivate("splitresearchstations"..i, AB_Scuttle, 0) 
		        SobGroup_AbilityActivate("splitresearchstations"..i, AB_Move, 0) 
	          SobGroup_AbilityActivate("splitresearchstations"..i, AB_Attack, 0) 
	          SobGroup_AbilityActivate("splitresearchstations"..i, AB_Guard, 0) 
			      if bloccorsdocking[SobGroup_OwnedBy("splitresearchstations"..i)+1] == 0 then			        
			        FX_StartEvent("splitresearchstations"..i, "Docking")
			        SobGroup_AllowPassiveActionsAlways_Smart("splitresearchstations"..i, 1)
			        bloccorsdocking[SobGroup_OwnedBy("splitresearchstations"..i)+1] = 1		
			        if SobGroup_OwnedBy("splitresearchstations"..i) == playerIndex and year > 1 then        
	              Sound_SpeechPlay("data:sound\\speech\\missions\\m_02\\40101")
	            end  
			        --cancella ricerche
				      local iRace = Player_GetRace(SobGroup_OwnedBy("splitresearchstations"..i)) + 1
				      dofilepath([[data:scripts/race.lua]])
				      dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
							for z, iCount in research do
						    if Player_HasQueuedResearch(SobGroup_OwnedBy("splitresearchstations"..i), iCount.Name) == 1 and 
						       (iCount.Name ~= "solarshield1" or
						        iCount.Name ~= "solarshield2" or
						        iCount.Name ~= "solarshield3" or
						        iCount.Name ~= "remotespaceshield1" or
						        iCount.Name ~= "remotespaceshield2" or
						        iCount.Name ~= "remotespaceshield2" or					        
						        iCount.Name ~= "ShipyardMAXSHIELDUpgrade1" or
						        iCount.Name ~= "ShipyardMAXSHIELDUpgrade2" or
						        iCount.Name ~= "ShipyardMAXSHIELDUpgrade3" or
						        iCount.Name ~= "ShipyardSHIELDREGENERATIONRATEUpgrade1" or
						        iCount.Name ~= "ShipyardSHIELDREGENERATIONRATEUpgrade2" or
						        iCount.Name ~= "ShipyardSHIELDREGENERATIONRATEUpgrade3" or
						        iCount.Name ~= "ShipyardDEFENSEFIELDTIMEUpgrade1" or
						        iCount.Name ~= "ShipyardDEFENSEFIELDTIMEUpgrade2" or
						        iCount.Name ~= "ShipyardDEFENSEFIELDTIMEUpgrade3") then			
						      Player_CancelResearch(SobGroup_OwnedBy("splitresearchstations"..i), iCount.Name)					     	   
						    end
						  end	                      
			      end 		   
			    elseif bloccorsdocking[SobGroup_OwnedBy("splitresearchstations"..i)+1] == 1 then	  	            
			      bloccorsdocking[SobGroup_OwnedBy("splitresearchstations"..i)+1] = 0
			      FX_StartEvent("splitresearchstations"..i, "Launching")
			      SobGroup_AllowPassiveActionsAlways_Smart("splitresearchstations"..i, 0)
			    else		      		      
		        SobGroup_AbilityActivate("splitresearchstations"..i, AB_Scuttle, 1)    
		        SobGroup_AbilityActivate("splitresearchstations"..i, AB_Move, 1) 
	          SobGroup_AbilityActivate("splitresearchstations"..i, AB_Attack, 1)			   
	          SobGroup_AbilityActivate("splitresearchstations"..i, AB_Guard, 1)		
	          if SobGroup_GetHardPointHealth("splitresearchstations"..i, "rsshield") > 0 then
			      	SobGroup_SetHardPointHealth("splitresearchstations"..i, "rsshield", 0)   	
			      end		           
			    end  		    	    
			    if SobGroup_GetHardPointHealth("splitresearchstations"..i, "powerup_ru") > 0 or
			       SobGroup_GetHardPointHealth("splitresearchstations"..i, "powerup_defense") > 0 or
			       SobGroup_GetHardPointHealth("splitresearchstations"..i, "powerup_speed") > 0 or
			       SobGroup_GetHardPointHealth("splitresearchstations"..i, "powerup_attack") > 0 or
			       SobGroup_GetHardPointHealth("splitresearchstations"..i, "powerup_build") > 0 or
			       SobGroup_GetHardPointHealth("splitresearchstations"..i, "powerup_repair") > 0 then
			      FX_StartEvent("splitresearchstations"..i, "PowerUp")
			    end		
			    if SobGroup_OwnedBy("splitresearchstations"..i) == Universe_CurrentPlayer() then
				    if Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "instanttech1" ) == 1 then   	          	 			      
			        g = Ping_AddSobGroup("Future Next", "research", "splitresearchstations"..i)
							Ping_LabelVisible(g, 1)		
							Ping_AddDescription(g, 0, "Research "..researchList[SobGroup_OwnedBy("splitresearchstations"..i) + 1])				           
		        elseif Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "instanttech" ) == 1 then                			      
			        g = Ping_AddSobGroup("Future Next", "research", "splitresearchstations"..i)
							Ping_LabelVisible(g, 1)		
							Ping_AddDescription(g, 0, "Research "..researchList[SobGroup_OwnedBy("splitresearchstations"..i) + 1].."/450")						                
		        else                		      
			        g = Ping_AddSobGroup("Future Next", "research", "splitresearchstations"..i)
							Ping_LabelVisible(g, 1)		
							Ping_AddDescription(g, 0, "Research "..researchList[SobGroup_OwnedBy("splitresearchstations"..i) + 1].."/125")							         
		        end 	
	        end	    		 		    
	        
					--nuclear armament
					if Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "researchstationnuke") == 1 then
						if SobGroup_CanDoAbility("splitresearchstations"..i, AB_Builder) == 1 and SobGroup_HealthPercentage("splitresearchstations"..i) > 0 then
							if SobGroup_GetHardPointHealth("splitresearchstations"..i, "HeavyMissile") == 0 then
								SobGroup_CreateSubSystem("splitresearchstations"..i, "hgn_researchstationnuke")
							end
						end
					end
	        
			    if SobGroup_Selected_Smart("splitresearchstations"..i) == 1 then
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitresearchstations"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitresearchstations"..i))));
	
				    ---race for taskbar	    
				    RaceDisplayInInterface(SobGroup_OwnedBy("splitresearchstations"..i))
				    
			      en = SobGroup_GetHardPointHealth("splitresearchstations"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));	
				    exp1 = SobGroup_GetHardPointHealth("splitresearchstations"..i, "experience") * 10000			 		  		  		   	   
					  if exp1 > 999 then
					  	exp1 = 999
					  end
				    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 			    
				    eff = -(floor((1 - SobGroup_GetHardPointHealth("splitresearchstations"..i, "efficency")) * 10)) 		 		  		  		  	        
				    if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff); 		       
					  end  				  
				    UI_SetElementVisible("NewTaskbar", "RSframe", 1) 	   
	          if Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "instanttech1" ) == 1 then
	            UI_SetTextLabelText("NewTaskbar", "rs", ""..researchList[SobGroup_OwnedBy("splitresearchstations"..i) + 1]);                    
	          elseif Player_HasResearch(SobGroup_OwnedBy("splitresearchstations"..i), "instanttech" ) == 1 then  
	            UI_SetTextLabelText("NewTaskbar", "rs", ""..researchList[SobGroup_OwnedBy("splitresearchstations"..i) + 1].."/450");                   
	          else 
	            UI_SetTextLabelText("NewTaskbar", "rs", ""..researchList[SobGroup_OwnedBy("splitresearchstations"..i) + 1].."/125");	                
	          end 		    		    	  
				    UI_SetElementSize("NewTaskbar", "subsystems", 160, 24);
				    if SobGroup_IsDocked("splitresearchstations"..i) == 0 then
				    	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	
				    	if Player_HasResearch(playerIndex, "researchstationnuke") == 1 then
				    		Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
				    	end
				    end			        	
	          --break
					end		     
		    end	        
		  end  
		end		
		
	---Weapon Station-----------------------------------------------------------------------------------------------------------------------------	  	  
	  if nws > 0 then  	
		  for i = 0,nws-1,1 do
		    if SobGroup_Empty("splitweaponstations"..i) == 0 then	
				
	--Orders          
	        orders("splitweaponstations"..i, "evacuation",30,3)       
		      orders("splitweaponstations"..i, "guard",0,0) 
		      orders("splitweaponstations"..i, "destroyallguns",0,0)	      
	        	     	
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none)  
	        if hwsaving == 8 then       
	          energyConsume("splitweaponstations"..i,1,1)	          
	        elseif hwsaving == 9 and SobGroup_Empty("star_sol") == 0 then
	          sundamageinterface = SobGroup_TakeDamageSol("splitweaponstations"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)				
		      end     
		      
					if SobGroup_InWorldBoundForKillingOnly("splitweaponstations"..i, 0) == 0 then 
						SobGroup_SetHealth("splitweaponstations"..i, 0)
					end
		      
		      --reduce the super high speed in normal action
		      SetAfterburnerForShip("splitweaponstations"..i, 400, "CapitalAfterburner", "AfterBurn", 1)
		      
		      SobGroup_ForceStayDockedIfDocking("splitweaponstations"..i)	          			    
			    if SobGroup_IsDocked("splitweaponstations"..i) == 1 then	
			      if SobGroup_GetHardPointHealth("splitweaponstations"..i, "wsshield") == 0 then
			      	SobGroup_CreateSubSystem("splitweaponstations"..i, "wsshield")
			      end	     
			--gestione del danno		       	     
			      if SobGroup_HealthPercentage("splitweaponstations"..i) <= 0.25 then
			        SobGroup_SetInvulnerability("splitweaponstations"..i, 1)	
			        wscollateraldamage[SobGroup_OwnedBy("splitweaponstations"..i)+1] = 1
			      else
			        SobGroup_SetInvulnerability("splitweaponstations"..i, 0)	       
			        if Universe_GameTime() - lastUniverse_GameTime >= 5 then        
				        danno = (1-SobGroup_GetHardPointHealth("splitweaponstations"..i, "wsshield"))		        
				        if Player_HasResearch(SobGroup_OwnedBy("splitweaponstations"..i), "CapitalHealthUpgrade3") == 1 then
				          danno = danno*0.6	
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitweaponstations"..i), "CapitalHealthUpgrade2") == 1 then
				          danno = danno*0.7
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitweaponstations"..i), "CapitalHealthUpgrade1") == 1 then
				          danno = danno*0.8
				        else
				          danno = danno*0.9
				        end				        
				        if danno > 0.06 then
				          danno = 0.06 
				        end  		        
				        SobGroup_SetHealth("splitweaponstations"..i, SobGroup_HealthPercentage("splitweaponstations"..i) - danno)		   
				      end   
			        if SobGroup_GetHardPointHealth("splitweaponstations"..i, "wsshield") < 0.94 then
			          SobGroup_SetHardPointHealth("splitweaponstations"..i, "wsshield", 0.94)
			        end	       
			      end		      
		        SobGroup_AbilityActivate("splitweaponstations"..i, AB_Scuttle, 0) 
		        SobGroup_AbilityActivate("splitweaponstations"..i, AB_Move, 0) 
	          SobGroup_AbilityActivate("splitweaponstations"..i, AB_Attack, 0) 
	          SobGroup_AbilityActivate("splitweaponstations"..i, AB_Guard, 0) 
			      if bloccowsdocking[SobGroup_OwnedBy("splitweaponstations"..i)+1] == 0 then			        
			        FX_StartEvent("splitweaponstations"..i, "Docking")
			        SobGroup_AllowPassiveActionsAlways_Smart("splitweaponstations"..i, 1)
			        bloccowsdocking[SobGroup_OwnedBy("splitweaponstations"..i)+1] = 1		
			        if SobGroup_OwnedBy("splitweaponstations"..i) == playerIndex and year > 1 then        
	              --Sound_SpeechPlay("data:sound\\speech\\missions\\m_02\\40101")
	            end  		                            
			      end 		   
			    elseif bloccowsdocking[SobGroup_OwnedBy("splitweaponstations"..i)+1] == 1 then	  	            
			      bloccowsdocking[SobGroup_OwnedBy("splitweaponstations"..i)+1] = 0
			      FX_StartEvent("splitweaponstations"..i, "Launching")
			      SobGroup_AllowPassiveActionsAlways_Smart("splitweaponstations"..i, 0)
			    else      
		        SobGroup_AbilityActivate("splitweaponstations"..i, AB_Scuttle, 1)    
		        SobGroup_AbilityActivate("splitweaponstations"..i, AB_Move, 1) 
	          SobGroup_AbilityActivate("splitweaponstations"..i, AB_Attack, 1)			   
	          SobGroup_AbilityActivate("splitweaponstations"..i, AB_Guard, 1)		
	          if SobGroup_GetHardPointHealth("splitweaponstations"..i, "wsshield") > 0 then
			      	SobGroup_SetHardPointHealth("splitweaponstations"..i, "wsshield", 0)   	
			      end		           
			    end		        
			    if SobGroup_OwnedBy("splitweaponstations"..i) == Universe_CurrentPlayer() then	 			      
		        g = Ping_AddSobGroup("Force Back", "name", "splitweaponstations"..i)
						Ping_LabelVisible(g, 1)					
					end      				 		    
			    if SobGroup_Selected_Smart("splitweaponstations"..i) == 1 then
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitweaponstations"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitweaponstations"..i))));
				    ---race for taskbar	    
				    RaceDisplayInInterface(SobGroup_OwnedBy("splitweaponstations"..i))
	
			      en = SobGroup_GetHardPointHealth("splitweaponstations"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));		
				    exp1 = SobGroup_GetHardPointHealth("splitweaponstations"..i, "experience") * 10000			 		  		  		   	   
					  if exp1 > 999 then
					  	exp1 = 999
					  end
				    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 			    
				    eff = -(floor((1 - SobGroup_GetHardPointHealth("splitweaponstations"..i, "efficency")) * 10)) 		 		  		  		  	        
				    if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff); 		       
					  end     
				    UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);		--96, 24
				    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);
				    if SobGroup_IsDocked("splitweaponstations"..i) == 0 then
				    	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	
				    end			        	
	          --break
					end		
	      	if ((Player_HasResearch(SobGroup_OwnedBy("splitweaponstations"..i), "isai" ) == 1) and
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitweaponstations"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitweaponstations"..i), "splitweaponstations"..i, 12500) == 1) and
						 (SobGroup_IsDoingAbility("splitweaponstations"..i, abilityList[2]) == 1) and
						 (SobGroup_UnderAttack("splitweaponstations"..i) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitweaponstations"..i), "hgn_viper_short") < 2) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitweaponstations"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitweaponstations"..i, "hgn_viper_short")
						SobGroup_CreateShip("splitweaponstations"..i, "hgn_viper_short1")
	      	  Player_SetRU(SobGroup_OwnedBy("splitweaponstations"..i), Player_GetRU(SobGroup_OwnedBy("splitweaponstations"..i)) - 1500)
	      	end
	      	if ((Player_HasResearch(SobGroup_OwnedBy("splitweaponstations"..i), "isai" ) == 1) and
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitweaponstations"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitweaponstations"..i), "splitweaponstations"..i, 12500) == 1) and
						 (SobGroup_IsDoingAbility("splitweaponstations"..i, abilityList[2]) == 1) and
						 (SobGroup_UnderAttack("splitweaponstations"..i) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitweaponstations"..i), "hgn_tangomine_ws") < 2) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitweaponstations"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitweaponstations"..i, "hgn_tangomine_ws")
						SobGroup_CreateShip("splitweaponstations"..i, "hgn_tangomine_ws1")
	      	  Player_SetRU(SobGroup_OwnedBy("splitweaponstations"..i), Player_GetRU(SobGroup_OwnedBy("splitweaponstations"..i)) - 1500)
	      	end
	      	if ((Player_HasResearch(SobGroup_OwnedBy("splitweaponstations"..i), "isai" ) == 1) and
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitweaponstations"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitweaponstations"..i), "splitweaponstations"..i, 17500) == 1) and
						 (SobGroup_IsDoingAbility("splitweaponstations"..i, abilityList[2]) == 1) and
						 (SobGroup_UnderAttack("splitweaponstations"..i) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitweaponstations"..i), "hgn_viper_ws") < 2) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splitweaponstations"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splitweaponstations"..i, "hgn_viper_ws")
						SobGroup_CreateShip("splitweaponstations"..i, "hgn_viper_ws1")
	      	  Player_SetRU(SobGroup_OwnedBy("splitweaponstations"..i), Player_GetRU(SobGroup_OwnedBy("splitweaponstations"..i)) - 1500)
	      	end
		    end	        
		  end  
		end			
		
	---Power Station----------------------------------------------------------------------------------------------------------------------------------	  	  
	  if nps > 0 then       	
		  for i = 0,nps-1,1 do
		    if SobGroup_Empty("splitpowerstations"..i) == 0 then
	
	--Orders          
	        orders("splitpowerstations"..i, "evacuation",20,2)         
		      orders("splitpowerstations"..i, "guard",0,0) 	      
	        
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none)
	        if hwsaving == 2 then 
	          energyConsume("splitpowerstations"..i,1,1)           
	        elseif hwsaving == 3 and SobGroup_Empty("star_sol") == 0 then
	          sundamageinterface = SobGroup_TakeDamageSol("splitpowerstations"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)				
		      end	  	
		      
					if SobGroup_InWorldBoundForKillingOnly("splitpowerstations"..i, 0) == 0 then 
						SobGroup_SetHealth("splitpowerstations"..i, 0)
					end
					
					--reduce the super high speed in normal action
		      SetAfterburnerForShip("splitpowerstations"..i, 78400, "CapitalAfterburner", "AfterBurn", 1)
		      
		      SobGroup_ForceStayDockedIfDocking("splitpowerstations"..i)	          			    
			    if SobGroup_IsDocked("splitpowerstations"..i) == 1 then	
			      if SobGroup_GetHardPointHealth("splitpowerstations"..i, "psshield") == 0 then
			      	SobGroup_CreateSubSystem("splitpowerstations"..i, "psshield")
			      end	     
			--gestione del danno		       	     
			      if SobGroup_HealthPercentage("splitpowerstations"..i) <= 0.25 then
			        SobGroup_SetInvulnerability("splitpowerstations"..i, 1)	
			        pscollateraldamage[SobGroup_OwnedBy("splitpowerstations"..i)+1] = 1
			      else
			        SobGroup_SetInvulnerability("splitpowerstations"..i, 0)	       
			        if Universe_GameTime() - lastUniverse_GameTime >= 5 then        
				        danno = (1-SobGroup_GetHardPointHealth("splitpowerstations"..i, "psshield"))		        
				        if Player_HasResearch(SobGroup_OwnedBy("splitpowerstations"..i), "CapitalHealthUpgrade3") == 1 then
				          danno = danno*0.6	
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitpowerstations"..i), "CapitalHealthUpgrade2") == 1 then
				          danno = danno*0.7
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitpowerstations"..i), "CapitalHealthUpgrade1") == 1 then
				          danno = danno*0.8
				        else
				          danno = danno*0.9
				        end				        
				        if danno > 0.06 then
				          danno = 0.06 
				        end  		        
				        SobGroup_SetHealth("splitpowerstations"..i, SobGroup_HealthPercentage("splitpowerstations"..i) - danno)		   
				      end   
			        if SobGroup_GetHardPointHealth("splitpowerstations"..i, "psshield") < 0.94 then
			          SobGroup_SetHardPointHealth("splitpowerstations"..i, "psshield", 0.94)
			        end	       
			      end     		      
		        SobGroup_AbilityActivate("splitpowerstations"..i, AB_Scuttle, 0) 
		        SobGroup_AbilityActivate("splitpowerstations"..i, AB_Move, 0) 
	          SobGroup_AbilityActivate("splitpowerstations"..i, AB_Attack, 0) 
	          SobGroup_AbilityActivate("splitpowerstations"..i, AB_Guard, 0) 
			      if bloccopsdocking[SobGroup_OwnedBy("splitpowerstations"..i)+1] == 0 then			        
			        FX_StartEvent("splitpowerstations"..i, "Docking")
			        SobGroup_AllowPassiveActionsAlways_Smart("splitpowerstations"..i, 1)
			        bloccopsdocking[SobGroup_OwnedBy("splitpowerstations"..i)+1] = 1		
			        if SobGroup_OwnedBy("splitpowerstations"..i) == playerIndex and year > 1 then        
	              Sound_SpeechPlay("data:sound\\speech\\nis\\nis_14b\\56145")
	            end          
			      end             
			    elseif bloccopsdocking[SobGroup_OwnedBy("splitpowerstations"..i)+1] == 1 then	  	            
			      bloccopsdocking[SobGroup_OwnedBy("splitpowerstations"..i)+1] = 0
			      FX_StartEvent("splitpowerstations"..i, "Launching")
			      SobGroup_AllowPassiveActionsAlways_Smart("splitpowerstations"..i, 0)
			    else	      
		        SobGroup_AbilityActivate("splitpowerstations"..i, AB_Scuttle, 1)    
		        SobGroup_AbilityActivate("splitpowerstations"..i, AB_Move, 1) 
	          SobGroup_AbilityActivate("splitpowerstations"..i, AB_Attack, 1)			   
	          SobGroup_AbilityActivate("splitpowerstations"..i, AB_Guard, 1)		
	          if SobGroup_GetHardPointHealth("splitpowerstations"..i, "psshield") > 0 then
			      	SobGroup_SetHardPointHealth("splitpowerstations"..i, "psshield", 0)   	
			      end		           
			    end 
	        if SobGroup_GetHardPointHealth("splitpowerstations"..i, "powerup_power") > 0 then
			      FX_StartEvent("splitpowerstations"..i, "PowerUp")
			    end
					if SobGroup_GetHardPointHealth("splitpowerstations"..i, "FailSafe") > 0 and SobGroup_HealthPercentage("splitpowerstations"..i) < 0.15 then
						FX_StartEvent_Smart("splitpowerstations"..i, "PwrLoc")
					end
	
					--AI using overcharge
					if Player_HasResearch(SobGroup_OwnedBy("splitpowerstations"..i), "isai") == 1 then
						if LastpowerList[SobGroup_OwnedBy("splitpowerstations"..i) + 1] < -30+10*CPULODvalueList[SobGroup_OwnedBy("splitpowerstations"..i)+1] and LastpowerListMax[SobGroup_OwnedBy("splitpowerstations"..i) + 1] >= 2000-100*CPULODvalueList[SobGroup_OwnedBy("splitpowerstations"..i)+1] then
							if SobGroup_CanDoAbility("splitpowerstations"..i, AB_Builder) == 1 and SobGroup_HealthPercentage("splitpowerstations"..i) > 0 then
								if SobGroup_GetHardPointHealth("splitpowerstations"..i, "powerup_power") == 0 then
									SobGroup_CreateSubSystem("splitpowerstations"..i, "powerup_power")
								end
							end
						end
					end
	
					--plasma armament
					if Player_HasResearch(SobGroup_OwnedBy("splitpowerstations"..i), "powerstationplasma") == 1 then
						if SobGroup_CanDoAbility("splitpowerstations"..i, AB_Builder) == 1 and SobGroup_HealthPercentage("splitpowerstations"..i) > 0 then
							if SobGroup_GetHardPointHealth("splitpowerstations"..i, "w3") == 0 then
								SobGroup_CreateSubSystem("splitpowerstations"..i, "alos_heavyturret_pulsarx4")
							end
						end
					end
					
			    if SobGroup_Selected_Smart("splitpowerstations"..i) == 1 then		           				
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitpowerstations"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitpowerstations"..i))));
			      ---race for taskbar	    
			      RaceDisplayInInterface(SobGroup_OwnedBy("splitpowerstations"..i))
	
			      en = SobGroup_GetHardPointHealth("splitpowerstations"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));	
				    exp1 = SobGroup_GetHardPointHealth("splitpowerstations"..i, "experience") * 10000			 		  		  		   	   
					  if exp1 > 999 then
					  	exp1 = 999
					  end
				    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 			    
				    eff = -(floor((1 - SobGroup_GetHardPointHealth("splitpowerstations"..i, "efficency")) * 10)) 		 		  		  		  	        
				    if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff); 		       
					  end				    
				    UI_SetElementVisible("NewTaskbar", "PSframe", 1)					
	          UI_SetTextLabelText("NewTaskbar", "ps", ""..LastpowerList[SobGroup_OwnedBy("splitpowerstations"..i) + 1].."/"..LastpowerListStored[SobGroup_OwnedBy("splitpowerstations"..i) + 1].."/"..LastpowerListMax[SobGroup_OwnedBy("splitpowerstations"..i) + 1]);  					
						UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
				    if SobGroup_IsDocked("splitpowerstations"..i) == 0 then
				    	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	
				    end			        	
	          --break
					end		     
		    end	        
		  end  
		end			
			     	
	---Crew Station-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	  if ncs > 0 then
		  for i = 0,ncs-1,1 do
		    if SobGroup_Empty("splitcrewstations"..i) == 0 then	    
	
	--Orders        
	        orders("splitcrewstations"..i, "clear",0,0)         
		      orders("splitcrewstations"..i, "guard",0,0) 
		      orders("splitcrewstations"..i, "recruitement",0,0)	      
	           	    	    
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none)
	        if hwsaving == 3 then 
	          energyConsume("splitcrewstations"..i,1,2)	          	
	        elseif hwsaving == 4 and SobGroup_Empty("star_sol") == 0 then
	          sundamageinterface = SobGroup_TakeDamageSol("splitcrewstations"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)				
		      end      
		      
					if SobGroup_InWorldBoundForKillingOnly("splitcrewstations"..i, 0) == 0 then 
						SobGroup_SetHealth("splitcrewstations"..i, 0)
					end
					
					--reduce the super high speed in normal action
		      SetAfterburnerForShip("splitcrewstations"..i, 33300, "CapitalAfterburner", "AfterBurn", 1)
		      
			    SobGroup_ForceStayDockedIfDocking("splitcrewstations"..i)		    
			    if SobGroup_IsDoingAbility("splitcrewstations"..i, abilityList[5]) == 1 or
			       SobGroup_IsDoingAbility("splitcrewstations"..i, abilityList[6]) == 1 or
			       SobGroup_IsDoingAbility("splitcrewstations"..i, abilityList[7]) == 1 or
			       SobGroup_IsDoingAbility("splitcrewstations"..i, abilityList[9]) == 1 or		       
			       SobGroup_IsDoingAbility("splitcrewstations"..i, abilityList[24]) == 1 or
			       SobGroup_IsDocked("splitcrewstations"..i) == 1 then 
			      SobGroup_DockSobGroupInstant("hgn_transportcell"..SobGroup_OwnedBy("splitcrewstations"..i), "splitcrewstations"..i) 
			    end 
	--blocco e sblocco moduli ru per costruzione rank
	
	        if Player_GetRU(SobGroup_OwnedBy("splitcrewstations"..i)) >= 2100 then	    
				    if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitcrewstations"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "2000ru") == 0 then   
				      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "2000ru")            
				    end 
				  elseif SobGroup_IsBuilding("splitcrewstations"..i, "hgn_isLieutenantCore") == 0 then   
				    SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "2000ru", 0)  	        
				  end	
				  
				  if Player_GetRU(SobGroup_OwnedBy("splitcrewstations"..i)) >= 4100 then	    
				    if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitcrewstations"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "4000ru") == 0 then   
				      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "4000ru")            
				    end 
				  elseif SobGroup_IsBuilding("splitcrewstations"..i, "hgn_isCommanderCore") == 0 then   	    
				    SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "4000ru", 0)  	        
				  end		    
				  
				  if Player_GetRU(SobGroup_OwnedBy("splitcrewstations"..i)) >= 6100 then	    
				    if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitcrewstations"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "6000ru") == 0 then   
				      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "6000ru")            
				    end 
				  elseif SobGroup_IsBuilding("splitcrewstations"..i, "hgn_isCaptainCore") == 0 then   	    
				    SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "6000ru", 0)  	        
				  end		    
				  
				  if Player_GetRU(SobGroup_OwnedBy("splitcrewstations"..i)) >= 8100 then	    
				    if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitcrewstations"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "8000ru") == 0 then   
				      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "8000ru")            
				    end 
				  elseif SobGroup_IsBuilding("splitcrewstations"..i, "hgn_isCommodoreCore") == 0 then   	    
				    SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "8000ru", 0)  	        
				  end		    
				  
				  if Player_GetRU(SobGroup_OwnedBy("splitcrewstations"..i)) >= 10100 then	    
				    if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitcrewstations"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "10000ru") == 0 then   
				      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "10000ru")            
				    end 
				  elseif SobGroup_IsBuilding("splitcrewstations"..i, "hgn_isAdmiralCore") == 0 then   	    
				    SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "10000ru", 0)  	        
				  end		    
				  
				  if Player_GetRU(SobGroup_OwnedBy("splitcrewstations"..i)) >= 12100 then	    
				    if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitcrewstations"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "12000ru") == 0 then   
				      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "12000ru")            
				    end 
				  elseif SobGroup_IsBuilding("splitcrewstations"..i, "hgn_isFleetAdmiralCore") == 0 then   	    
				    SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "12000ru", 0)  	        
				  end		    
				  	    
	--Declsamento grado e distruzione CS
					if GetGameRubric() ~= GR_CAMPAIGN then
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isLieutenant") == 0 then
			        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isLieutenant", 0)  
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCommander") == 0 then
			        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isCommander", 0)    
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCaptain") == 0 then
			        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isCaptain", 0)     
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCommodore") == 0 then
			        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isCommodore", 0)     
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isAdmiral") == 0 then
			        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isAdmiral", 0)    
			      end  
			      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isFleetAdmiral") == 0 then
			        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isFleetAdmiral", 0)     
			      end
			    elseif SP_Campaign_Level_ID ~= nil then		--in single player mission, wait until honour points have been inherited
			    	if SP_Campaign_Level_ID >= 2 and honorList[SobGroup_OwnedBy("splitcrewstations"..i)+1] ~= 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "SP_isHonorInherited") > 0 then
				      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isLieutenant") == 0 then
				        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isLieutenant", 0)  
				      end
				      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCommander") == 0 then
				        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isCommander", 0)    
				      end
				      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCaptain") == 0 then
				        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isCaptain", 0)     
				      end
				      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCommodore") == 0 then
				        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isCommodore", 0)     
				      end
				      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isAdmiral") == 0 then
				        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isAdmiral", 0)    
				      end
				      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isFleetAdmiral") == 0 then
				        SobGroup_SetHardPointHealth("splitcrewstations"..i, "isFleetAdmiral", 0)     
				      end
			    	end
			    end
		      
	--costruisce moduli rank, lo fa una volta sola se year < 1, usata nel caso si parta con un grado diverso da ensign	      
		      if year < 1 then		            
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isLieutenant") > 0 then
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "isLieutenant") == 0 then
			          SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_isLieutenantCore")    
			        end 
			      end 		      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCommander") > 0 then
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "isCommander") == 0 then
			          SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_isCommanderCore")  	   
			        end     
			      end 	      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCaptain") > 0 then
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "isCaptain") == 0 then
			          SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_isCaptainCore") 
			        end  	       
			      end 		      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isCommodore") > 0 then
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "isCommodore") == 0 then
			          SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_isCommodoreCore") 	
			        end        
			      end     
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isAdmiral") > 0 then
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "isAdmiral") == 0 then
			          SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_isAdmiralCore")  	 
			        end           
			      end		      
			      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitcrewstations"..i), "isFleetAdmiral") > 0 then
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "isFleetAdmiral") == 0 then
			          SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_isFleetAdmiralCore") 	
			        end        
			      end  
		      end
		       
			    if SobGroup_IsDocked("splitcrewstations"..i) == 1 then		      
			      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "csshield") == 0 then
			      	SobGroup_CreateSubSystem("splitcrewstations"..i, "csshield")
			      end	   
			--gestione del danno		         	    
			      if SobGroup_HealthPercentage("splitcrewstations"..i) <= 0.25 then
			        SobGroup_SetInvulnerability("splitcrewstations"..i, 1)
			        cscollateraldamage[SobGroup_OwnedBy("splitcrewstations"..i)+1] = 1
			      else
			        SobGroup_SetInvulnerability("splitcrewstations"..i, 0)  	
			        if Universe_GameTime() - lastUniverse_GameTime >= 5 then        
				        danno = (1-SobGroup_GetHardPointHealth("splitcrewstations"..i, "csshield"))		        
				        if Player_HasResearch(SobGroup_OwnedBy("splitcrewstations"..i), "CapitalHealthUpgrade3") == 1 then
				          danno = danno*0.6	
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitcrewstations"..i), "CapitalHealthUpgrade2") == 1 then
				          danno = danno*0.7
				        elseif Player_HasResearch(SobGroup_OwnedBy("splitcrewstations"..i), "CapitalHealthUpgrade1") == 1 then
				          danno = danno*0.8
				        else
				          danno = danno*0.9
				        end				        
				        if danno > 0.06 then
				          danno = 0.06 
				        end  		        
				        SobGroup_SetHealth("splitcrewstations"..i, SobGroup_HealthPercentage("splitcrewstations"..i) - danno)		   
				      end   
			        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "csshield") < 0.94 then
			          SobGroup_SetHardPointHealth("splitcrewstations"..i, "csshield", 0.94)
			        end	   
			      end 		      
		        SobGroup_AbilityActivate("splitcrewstations"..i, AB_Scuttle, 0)   
		        SobGroup_AbilityActivate("splitcrewstations"..i, AB_Move, 0) 
	          SobGroup_AbilityActivate("splitcrewstations"..i, AB_Attack, 0)  
	          SobGroup_AbilityActivate("splitcrewstations"..i, AB_Guard, 0)   
			      if bloccocsdocking[SobGroup_OwnedBy("splitcrewstations"..i)+1] == 0 then	
			        FX_StartEvent("splitcrewstations"..i, "Docking")
			        SobGroup_AllowPassiveActionsAlways_Smart("splitcrewstations"..i, 1)
			        bloccocsdocking[SobGroup_OwnedBy("splitcrewstations"..i)+1] = 1		
			        if SobGroup_OwnedBy("splitcrewstations"..i) == playerIndex and year > 1 then        
	              Sound_SpeechPlay("data:sound\\speech\\missions\\m_02\\40100")
	            end  
			      end   	      		      	                
			    elseif bloccocsdocking[SobGroup_OwnedBy("splitcrewstations"..i)+1] == 1 then	  	            
			      bloccocsdocking[SobGroup_OwnedBy("splitcrewstations"..i)+1] = 0
			      FX_StartEvent("splitcrewstations"..i, "Launching")
			      SobGroup_AllowPassiveActionsAlways_Smart("splitcrewstations"..i, 0)
			    else        
		        SobGroup_AbilityActivate("splitcrewstations"..i, AB_Scuttle, 1)   
		        SobGroup_AbilityActivate("splitcrewstations"..i, AB_Move, 1) 
	          SobGroup_AbilityActivate("splitcrewstations"..i, AB_Attack, 1)  
	          SobGroup_AbilityActivate("splitcrewstations"..i, AB_Guard, 1)   
	          if SobGroup_GetHardPointHealth("splitcrewstations"..i, "csshield") > 0 then
			      	SobGroup_SetHardPointHealth("splitcrewstations"..i, "csshield", 0)   	
			      end	          
			    end  		
			    if SobGroup_OwnedBy("splitcrewstations"..i) == Universe_CurrentPlayer() then	 			      
		        g = Ping_AddSobGroup("Babel East", "crew", "splitcrewstations"..i)
						Ping_LabelVisible(g, 1)		
						Ping_AddDescription(g, 0, "Crew "..pilotpopList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..pilotrecruitList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1])
						Ping_AddDescription(g, 1, "Officers "..officerpopList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..officerrecruitList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1])		
					end      			    
					
					--nuclear armament
					if Player_HasResearch(SobGroup_OwnedBy("splitcrewstations"..i), "crewstationnuke") == 1 then
						if SobGroup_CanDoAbility("splitcrewstations"..i, AB_Builder) == 1 and SobGroup_HealthPercentage("splitcrewstations"..i) > 0 then
							for u=1, 2, 1 do
								if SobGroup_GetHardPointHealth("splitcrewstations"..i, "nuke"..u) == 0 then
									SobGroup_CreateSubSystem("splitcrewstations"..i, "hgn_v_nuclear_crew"..u)
								end
							end
						end
					end
					
			    if SobGroup_Selected_Smart("splitcrewstations"..i) == 1 then
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitcrewstations"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitcrewstations"..i))));
			      ---race for taskbar	    
			      RaceDisplayInInterface(SobGroup_OwnedBy("splitcrewstations"..i))
		    
			      en = SobGroup_GetHardPointHealth("splitcrewstations"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));	
			      if gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "ENSIGN       " then
			        UI_SetElementVisible("NewTaskbar", "rank1", 1)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 0)
			        UI_SetElementVisible("NewTaskbar", "rank3", 0)
			        UI_SetElementVisible("NewTaskbar", "rank4", 0)
			        UI_SetElementVisible("NewTaskbar", "rank5", 0)
			        UI_SetElementVisible("NewTaskbar", "rank6", 0)
			        UI_SetElementVisible("NewTaskbar", "rank7", 0)      
			      elseif gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "LIEUTENANT   " then 
			        UI_SetElementVisible("NewTaskbar", "rank1", 0)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 1)
			        UI_SetElementVisible("NewTaskbar", "rank3", 0)
			        UI_SetElementVisible("NewTaskbar", "rank4", 0)
			        UI_SetElementVisible("NewTaskbar", "rank5", 0)
			        UI_SetElementVisible("NewTaskbar", "rank6", 0)
			        UI_SetElementVisible("NewTaskbar", "rank7", 0)  
			      elseif gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "COMMANDER    " then 
			        UI_SetElementVisible("NewTaskbar", "rank1", 0)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 0)
			        UI_SetElementVisible("NewTaskbar", "rank3", 1)
			        UI_SetElementVisible("NewTaskbar", "rank4", 0)
			        UI_SetElementVisible("NewTaskbar", "rank5", 0)
			        UI_SetElementVisible("NewTaskbar", "rank6", 0)
			        UI_SetElementVisible("NewTaskbar", "rank7", 0)  
			      elseif gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "CAPTAIN      " then 
			        UI_SetElementVisible("NewTaskbar", "rank1", 0)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 0)
			        UI_SetElementVisible("NewTaskbar", "rank3", 0)
			        UI_SetElementVisible("NewTaskbar", "rank4", 1)
			        UI_SetElementVisible("NewTaskbar", "rank5", 0)
			        UI_SetElementVisible("NewTaskbar", "rank6", 0)
			        UI_SetElementVisible("NewTaskbar", "rank7", 0)  
			      elseif gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "COMMODORE    " then 
			        UI_SetElementVisible("NewTaskbar", "rank1", 0)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 0)
			        UI_SetElementVisible("NewTaskbar", "rank3", 0)
			        UI_SetElementVisible("NewTaskbar", "rank4", 0)
			        UI_SetElementVisible("NewTaskbar", "rank5", 1)
			        UI_SetElementVisible("NewTaskbar", "rank6", 0)
			        UI_SetElementVisible("NewTaskbar", "rank7", 0)  
			      elseif gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "ADMIRAL      " then 
			        UI_SetElementVisible("NewTaskbar", "rank1", 0)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 0)
			        UI_SetElementVisible("NewTaskbar", "rank3", 0)
			        UI_SetElementVisible("NewTaskbar", "rank4", 0)
			        UI_SetElementVisible("NewTaskbar", "rank5", 0)
			        UI_SetElementVisible("NewTaskbar", "rank6", 1)
			        UI_SetElementVisible("NewTaskbar", "rank7", 0)  
			      elseif gradoList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] == "FLEET ADMIRAL" then 
			        UI_SetElementVisible("NewTaskbar", "rank1", 0)		
			        UI_SetElementVisible("NewTaskbar", "rank2", 0)
			        UI_SetElementVisible("NewTaskbar", "rank3", 0)
			        UI_SetElementVisible("NewTaskbar", "rank4", 0)
			        UI_SetElementVisible("NewTaskbar", "rank5", 0)
			        UI_SetElementVisible("NewTaskbar", "rank6", 0)
			        UI_SetElementVisible("NewTaskbar", "rank7", 1)  
			      end
			      		  
					  UI_SetElementVisible("NewTaskbar", "CSframe", 1)  
					  UI_SetTextLabelText("NewTaskbar", "cscrew", ""..pilotpopList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..pilotrecruitList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1]);    		  	
				  	UI_SetTextLabelText("NewTaskbar", "csofficer", ""..officerpopList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..officerrecruitList[SobGroup_OwnedBy("splitcrewstations"..i) + 1].."/"..officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1]);		    
				    UI_SetTextLabelText("NewTaskbar", "cscrewcell", ""..Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcrewstations"..i), "hgn_transportcell"));	    			    
				    exp1 = SobGroup_GetHardPointHealth("splitcrewstations"..i, "experience") * 10000			      
					  if exp1 > 999 then
					  	exp1 = 999
					  end
					  UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1));  				  
					  eff = -(floor((1 - SobGroup_GetHardPointHealth("splitcrewstations"..i, "efficency")) * 10)) 		      
					  if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);    		    		  
					  end	  
					  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48); 
					  if SobGroup_IsDocked("splitcrewstations"..i) == 0 then 
					  	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save		
					  	if Player_HasResearch(playerIndex, "crewstationnuke") == 1 then
					  		Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
					  	end
					  end			   	      	
		        --break
					end  			
				end	
			end	
		end		    
		
	---Crew/Evacuation Cell
	  
	  for pi = 0,5,1 do
		  if (hwsaving == 6 and ntc[pi+1] >= 15) or ntc[pi+1] > 0 then			--ntc[pi+1] < 15
				if ntc[pi+1] > 0 then         
					for i = 0,(ntc[pi+1]-1),1 do  
						if SobGroup_Empty("splitothers"..pi .. tostring(i)) == 0 then 		  
	
							if SobGroup_InWorldBoundForKillingOnly("splitothers"..pi .. tostring(i), 0) == 0 then 
								SobGroup_SetHealth("splitothers"..pi .. tostring(i), 0)
							end
	
		--Sun Damage
							if SobGroup_Empty("star_sol") == 0 and hwsaving == 6 then        
								sundamageinterface = SobGroup_TakeDamageSol("splitothers"..pi .. tostring(i),0.8,Temp_GlobalVariable.Selected_NextInterval)          	
							end		    
						
							if SobGroup_Selected_Smart("splitothers"..pi .. tostring(i)) == 1 then
							  cleaninterface()	
								interfacecleaned=interfacecleaned+1
								--DriveMode_DisplayButtonForShip("splitothers"..i)
								UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitothers"..pi .. tostring(i)))));		
								---race for taskbar	    
								RaceDisplayInInterface(SobGroup_OwnedBy("splitothers"..pi .. tostring(i)))
	
								UI_SetElementVisible("NewTaskbar", "crewcellframe", 1)	
								if Player_HasResearch(pi, "isai" ) == 1 then
									UI_SetTextLabelText("NewTaskbar", "pilotcrewcell", ""..floor(pilotrecruiterList[pi+1]/2));    			    	       	      
									UI_SetTextLabelText("NewTaskbar", "officercrewcell", ""..floor(officerrecruiterList[pi+1]/2)); 
								else  		       	      
									UI_SetTextLabelText("NewTaskbar", "pilotcrewcell", ""..pilotrecruiterList[pi+1]);    			    	       	      
									UI_SetTextLabelText("NewTaskbar", "officercrewcell", ""..officerrecruiterList[pi+1]);      	    	      	
								end
								--break    
							end  
						end			
					end		                   				
				end	
			end		
		  if nec[pi+1] > 0 then         
			  for i = 0,(nec[pi+1]-1),1 do  	 	
			    if SobGroup_Empty("splitevacs"..pi .. tostring(i)) == 0 then		    
			     
			      SobGroup_ForceStayDockedIfDocking("splitevacs"..pi .. tostring(i))
			      if SobGroup_IsDockedSobGroup("splitevacs"..pi .. tostring(i), "hgn_crewstation"..pi) == 1 then  
			        --viene fatto in population perch?sequenziale alla gestione piloti/ufficiali	        
	        	elseif SobGroup_IsDoingAbility("splitevacs"..pi .. tostring(i), abilityList[9]) == 1 then  
	        	else
				      SobGroup_Clear("temp")	          
		          distance = 2000                         
		          while SobGroup_Count("temp") == 0 and distance < 50000 do				                        						     
				        if SobGroup_FillProximitySobGroup ("temp", "hgn_crewstation"..SobGroup_OwnedBy("splitevacs"..pi .. tostring(i)), "splitevacs"..pi .. tostring(i), distance) == 1 then  							        
				          if SobGroup_CanDoAbility("temp", AB_AcceptDocking) == 1 then							          
						        SobGroup_DockSobGroupAndStayDocked("splitevacs"..pi .. tostring(i), "temp")
						        --break
						      else
						        SobGroup_Clear("temp")   
						      end  
					      end    	    
				        distance = distance + 2000				           		              
		          end	
		        end  		  	  
						if SobGroup_Selected_Smart("splitevacs"..pi .. tostring(i)) == 1 then		
						  cleaninterface()	
							interfacecleaned=interfacecleaned+1
							--DriveMode_DisplayButtonForShip("splitevacs"..i)
						  UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitevacs"..pi .. tostring(i)))));
						  ---race for taskbar	    
						  RaceDisplayInInterface(SobGroup_OwnedBy("splitevacs"..pi .. tostring(i)))
	
						  UI_SetElementVisible("NewTaskbar", "crewcellframe", 1)	  
						  pilot = SobGroup_GetHardPointHealth("splitevacs"..pi .. tostring(i), "pilot") * 100			   		       	      
					    UI_SetTextLabelText("NewTaskbar", "pilotcrewcell", ""..floor(pilot));    
					    officer = SobGroup_GetHardPointHealth("splitevacs"..pi .. tostring(i), "officer") * 100			    	       	      
					    UI_SetTextLabelText("NewTaskbar", "officercrewcell", ""..floor(officer));      	    	      	
		          --break   
						end			
					end	
				end		                   				
		  end	  	 	
		end
	end
	
	if Temp_GlobalVariable.Selected_Save == 2 then
	---Refinery		  
	  
		if (hwsaving == 7 and nmr >= 10) or nmr > 0 then			--nmr < 10
			if nmr > 0 then 
				for i = 0,nmr - 1,1 do	
					if SobGroup_Empty("splitmobilerefineries"..i) == 0 then
	
						if SobGroup_InWorldBoundForKillingOnly("splitmobilerefineries"..i, 0) == 0 then 
							SobGroup_SetHealth("splitmobilerefineries"..i, 0)
						end
	
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 7 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitmobilerefineries"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)          	
						end		  
					
						if SobGroup_AreAnyOfTheseTypes("splitmobilerefineries"..i, "rad_resourcecontroller") == 1 then				  
							--Orders 
							orders("splitmobilerefineries"..i, "overseer_clear",0,0)
							--Detonate 
							if SobGroup_HealthPercentage("splitmobilerefineries"..i) <= 0 and SobGroup_GetHardPointHealth("splitmobilerefineries"..i, "rad_rc_orders_detonate") > 0 then
								for z=0, nmr-1, 1 do
									if SobGroup_HealthPercentage("splitmobilerefineries"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitmobilerefineries"..z, "rad_resourcecontroller") == 1 then   
										if SobGroup_GetHardPointHealth("splitmobilerefineries"..z, "rad_rc_orders_detonate") > 0 then
											if z==i then
												SobGroup_EvacuateShipsAroundExplodingShip("splitmobilerefineries"..i, 5000)		--Evacuate nearby ships to avoid explosion damage
											end
											SobGroup_Create("OverseerExpBag"..z)          
								      SobGroup_SobGroupAdd("OverseerExpBag"..z, "splitmobilerefineries"..z)      
								      SobGroup_Clear("splitmobilerefineries"..z)    
									  	ExpBag.OverseerIndex = z
									    Rule_AddInterval("Overseerexplosiondamageexp", 8-Temp_GlobalVariable.Selected_NextInterval-0.1)
									  end
							    end
								end
							end
			      end
	
						if SobGroup_Selected_Smart("splitmobilerefineries"..i) == 1 then	 	
						  cleaninterface()
							interfacecleaned=interfacecleaned+1
							DriveMode_DisplayButtonForShip("splitmobilerefineries"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitmobilerefineries"..i))));
							--fusion display
							if Player_GetRace(SobGroup_OwnedBy("splitmobilerefineries"..i)) <= 2 then
				        UI_SetElementVisible("NewTaskbar", "Sframe", 1) 
				        UI_SetTextLabelText("NewTaskbar", "lblResourceUnits", ""..Player_GetRU(SobGroup_OwnedBy("splitmobilerefineries"..i)).."/"..RUMaxCapacityList[SobGroup_OwnedBy("splitmobilerefineries"..i)+1]);	      		       	      
				        ff=0
						    if SobGroup_IsDocked("splitmobilerefineries"..i) == 0 then
							    if Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres3") == 1 then ff=40
							    elseif Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres2") == 1 then ff=30
							    elseif Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres1") == 1 then ff=20
							    elseif Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres") == 1 then ff=10
						      end
							  end
					      UI_SetTextLabelText("NewTaskbar", "Sfusion", ""..ff.."/"..fusionList[SobGroup_OwnedBy("splitmobilerefineries"..i) + 1]);
					    end
							if SobGroup_AreAnyOfTheseTypes("splitmobilerefineries"..i, "rad_resourcecontroller") == 1 then
								exp1 = SobGroup_GetHardPointHealth("splitmobilerefineries"..i, "experience") * 10000		  	   	        
							  if exp1 > 999 then
							  	exp1 = 999
							  end
								UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 
							end
							---race for taskbar	    
							RaceDisplayInInterface(SobGroup_OwnedBy("splitmobilerefineries"..i))
	
							Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	            	       	 	    	
							--break  
						end   
					end	  
				end	       
			end	  
		end	
	  
	---Resource Collector	 	
	  if (hwsaving == 9 and nrc >= 35) or nrc > 0 then		--nrc < 35
			if nrc > 0 then 
				for i = 0,nrc - 1,1 do		 
					if SobGroup_Empty("splitresourcecollectors"..i) == 0 then    
	
						if SobGroup_InWorldBoundForKillingOnly("splitresourcecollectors"..i, 0) == 0 then 
							SobGroup_SetHealth("splitresourcecollectors"..i, 0)
						end
	
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 9 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitresourcecollectors"..i,0.3,Temp_GlobalVariable.Selected_NextInterval)          	
						end  	  
		--AI salvage bug fix, very important!!! 
						--if (SobGroup_IsDoingAbility("splitresourcecollectors"..i, AB_Salvage) == 1) and CPU_Exist_Smart(SobGroup_OwnedBy("splitresourcecollectors"..i)) == 1 then
							--local rand=random_pseudo(0,360)
							--if rand>355 and SobGroup_GetEquivalentSpeed("splitresourcecollectors"..i)<30000 then
								--SobGroup_Stop(SobGroup_OwnedBy("splitresourcecollectors"..i), "splitresourcecollectors"..i)
								--print("Compulsory AI salvage debug activated for player: "..SobGroup_OwnedBy("splitresourcecollectors"..i))
							--end
						--end
	
						if SobGroup_IsDocked("splitresourcecollectors"..i) == 1 then	      
							SobGroup_AbilityActivate("splitresourcecollectors"..i, AB_Scuttle, 0)
							--if SobGroup_HealthPercentage("splitresourcecollectors"..i) <= 0.5 then
								SobGroup_SetInvulnerability("splitresourcecollectors"..i, 1)	
							--else
								--SobGroup_SetInvulnerability("splitresourcecollectors"..i, 0)	  
							--end					
						else	      
							SobGroup_AbilityActivate("splitresourcecollectors"..i, AB_Scuttle, 1)
							SobGroup_SetInvulnerability("splitresourcecollectors"..i, 0)
						end            	  
						
						--Gardener Speed Boost
						if SobGroup_AreAnyOfTheseTypes("splitresourcecollectors"..i, "kad_ressourcecollector") == 1 and Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "GardenerAfterburner") == 1 then
							if SobGroup_GetEquivalentSpeed("splitresourcecollectors"..i) >= 250000 then
								SobGroup_SetMaxSpeedMultiplier("splitresourcecollectors"..i, 2)
								FX_StartEvent_Smart("splitresourcecollectors"..i, "AfterBurn" )
							else
								SobGroup_SetMaxSpeedMultiplier("splitresourcecollectors"..i, 1)
							end
						end
						
						if SobGroup_Selected_Smart("splitresourcecollectors"..i) == 1 then	
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            DriveMode_DisplayButtonForShip("splitresourcecollectors"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitresourcecollectors"..i))));
							---race for taskbar	    
							RaceDisplayInInterface(SobGroup_OwnedBy("splitresourcecollectors"..i))
	
							if SobGroup_AreAnyOfTheseTypes("splitresourcecollectors"..i, "hgn_resourcecollector") == 1 then			 				  				  			  
								rurate = 4
								ruload = 300
								rudropoff = 20	 
								ruratemining = 4				    
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRURATEUpgrade3" ) == 1 then			      
									--rurate = rurate * 1.8    
									rurate = 7        
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRURATEUpgrade2" ) == 1 then
									rurate = rurate * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRURATEUpgrade1" ) == 1 then			    
									rurate = rurate * 1.25     	          
								end   	      
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUCAPUpgrade3" ) == 1 then
									ruload = ruload * 1.8            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUCAPUpgrade2" ) == 1 then
									ruload = ruload * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUCAPUpgrade1" ) == 1 then
									ruload = ruload * 1.25       
								end  	      
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUDROPOFFUpgrade3" ) == 1 then
									rudropoff = rudropoff * 1.8           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUDROPOFFUpgrade2" ) == 1 then
									rudropoff = rudropoff * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUDROPOFFUpgrade1" ) == 1 then
									rudropoff = rudropoff * 1.25       
								end 	   
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction3" ) == 1 then
									--ruratemining = ruratemining * 1.8   
									ruratemining = 7         
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction2" ) == 1 then
									ruratemining = ruratemining * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction1" ) == 1 then			    
								ruratemining = ruratemining * 1.25     	          
								end   	      
							elseif SobGroup_AreAnyOfTheseTypes("splitresourcecollectors"..i, "vgr_resourcecollector") == 1 then
								rurate = 5
								ruload = 250
								rudropoff = 20	 
								ruratemining = 4	
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRURATEUpgrade3" ) == 1 then			      
									rurate = rurate * 1.8 				       
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRURATEUpgrade2" ) == 1 then
									rurate = rurate * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRURATEUpgrade1" ) == 1 then
									rurate = rurate * 1.25	       
								end   	 
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUCAPUpgrade3" ) == 1 then
									ruload = ruload * 1.8      
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUCAPUpgrade2" ) == 1 then
									ruload = ruload * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUCAPUpgrade1" ) == 1 then
									ruload = ruload * 1.25       
								end  	
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUDROPOFFUpgrade3" ) == 1 then
									rudropoff = rudropoff * 1.8        
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUDROPOFFUpgrade2" ) == 1 then
									rudropoff = rudropoff * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "ResourceCollectorRUDROPOFFUpgrade1" ) == 1 then
									rudropoff = rudropoff * 1.25       
								end  
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction3" ) == 1 then
									ruratemining = ruratemining * 1.8				      
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction2" ) == 1 then
									ruratemining = ruratemining * 1.5           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction1" ) == 1 then
									ruratemining = ruratemining * 1.25            			    
								end   	         
							elseif SobGroup_AreAnyOfTheseTypes("splitresourcecollectors"..i, "kad_ressourcecollector") == 1 then
								rurate = 16
								ruload = 200
								rudropoff = 40
								ruratemining = 4
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "GardenerHarvestBoost" ) == 1 then			      
									rurate = rurate * 1.5
								end   	 
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction3" ) == 1 then
									ruratemining = ruratemining * 1.8				      
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction2" ) == 1 then
									ruratemining = ruratemining * 1.5           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction1" ) == 1 then
									ruratemining = ruratemining * 1.25            			    
								end
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff3" ) == 1 then
									rudropoff = rudropoff * 1.8           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff2" ) == 1 then
									rudropoff = rudropoff * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff1" ) == 1 then
									rudropoff = rudropoff * 1.25       
								end
							elseif SobGroup_AreAnyOfTheseTypes("splitresourcecollectors"..i, "rad_resourcecollector") == 1 then
								rurate = 20
								ruload = 1000
								rudropoff = 40
								ruratemining = 4
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "SlaveHarvestBoost" ) == 1 then			      
									rurate = rurate * 1.5
								end   	 
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction3" ) == 1 then
									ruratemining = ruratemining * 1.8				      
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction2" ) == 1 then
									ruratemining = ruratemining * 1.5           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction1" ) == 1 then
									ruratemining = ruratemining * 1.25            			    
								end
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff3" ) == 1 then
									rudropoff = rudropoff * 1.8           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff2" ) == 1 then
									rudropoff = rudropoff * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff1" ) == 1 then
									rudropoff = rudropoff * 1.25       
								end
							elseif SobGroup_AreAnyOfTheseTypes("splitresourcecollectors"..i, "kpr_resourcecollector") == 1 then
								rurate = 10
								ruload = 1000
								rudropoff = 40
								ruratemining = 4 
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction3" ) == 1 then
									ruratemining = ruratemining * 1.8				      
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction2" ) == 1 then
									ruratemining = ruratemining * 1.5           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "resourcecollectorextraction1" ) == 1 then
									ruratemining = ruratemining * 1.25            			    
								end
								if Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff3" ) == 1 then
									rudropoff = rudropoff * 1.8           
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff2" ) == 1 then
									rudropoff = rudropoff * 1.5            
								elseif Player_HasResearch(SobGroup_OwnedBy("splitresourcecollectors"..i), "minecontainerdropoff1" ) == 1 then
									rudropoff = rudropoff * 1.25       
								end
							end  			  
							UI_SetElementVisible("NewTaskbar", "ruframe", 1)     	      
							UI_SetTextLabelText("NewTaskbar", "rurate", ""..floor(rurate));   
							UI_SetTextLabelText("NewTaskbar", "ruratemining", ""..floor(ruratemining));  
							UI_SetTextLabelText("NewTaskbar", "ruload", ""..floor(ruload));   
							UI_SetTextLabelText("NewTaskbar", "rudropoff", ""..floor(rudropoff));   
							Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save			    		        	
							--break    
						end 			
					end  
				end	            				
			end	
		end	
	  
	---Trade Container    
		if ntrc > 0 then 
			for i = 0,ntrc - 1,1 do	
				if SobGroup_Empty("splitcontainers"..i) == 0 then	
				
	--Orders        
					orders("splitcontainers"..i, "clear",0,0)   					
					orders("splitcontainers"..i, "trade",0,0)	 
	        orders("splitcontainers"..i, "evacuation",4,0)  			
					
					if hwsaving == 0 then       
						energyConsume("splitcontainers"..i,1,1)	       
					--sundamage	
					elseif hwsaving == 1 and SobGroup_Empty("star_sol") == 0 then
						sundamageinterface = SobGroup_TakeDamageSol("splitcontainers"..i,0.6,Temp_GlobalVariable.Selected_NextInterval)				
					end	
					
					if SobGroup_InWorldBoundForKillingOnly("splitcontainers"..i, 0) == 0 then 
						SobGroup_SetHealth("splitcontainers"..i, 0)
					end
					
					--no idle for AI
					if Player_HasResearch(SobGroup_OwnedBy("splitcontainers"..i), "isai" ) == 1 then
						if SobGroup_IsDoingAbility("splitcontainers"..i, AB_Parade) == 1 and sqrt(SobGroup_GetEquivalentSpeed("splitcontainers"..i)) < 10 then
							if SobGroup_Empty("traderallies"..SobGroup_OwnedBy("splitcontainers"..i)) == 0 and SobGroup_Empty("trader"..SobGroup_OwnedBy("splitcontainers"..i)) == 0 then
								if SobGroup_Count("traderallies"..SobGroup_OwnedBy("splitcontainers"..i)) > SobGroup_Count("trader"..SobGroup_OwnedBy("splitcontainers"..i)) then
									SobGroup_DockSobGroup("splitcontainers"..i, "traderallies"..SobGroup_OwnedBy("splitcontainers"..i))
								end
							end
						end
					end
	
	--boost
					if SobGroup_GetHardPointHealth("splitcontainers"..i, "engine_boost_container") > 0 then	
	          if SobGroup_IsDocked("splitcontainers"..i) == 0 then 	
	           	if SobGroup_GetEquivalentSpeed("splitcontainers"..i) >= 16000 then				 
								FX_StartEvent_Smart("splitcontainers"..i, "b3")
							end
	          end
	        end
	--boost for AI		
					if Player_HasResearch(SobGroup_OwnedBy("splitcontainers"..i), "isai" ) == 1 then
	          if SobGroup_IsDocked("splitcontainers"..i) == 0 then 	
	           	if SobGroup_GetEquivalentSpeed("splitcontainers"..i) >= 16000 then
								FX_StartEvent_Smart("splitcontainers"..i, "b3")
								SobGroup_SetMaxSpeedMultiplier("splitcontainers"..i, 1.7)
							end
	          end		
					end							
												
					if SobGroup_Selected_Smart("splitcontainers"..i) == 1 then
						cleaninterface()	
						interfacecleaned=interfacecleaned+1
						DriveMode_DisplayButtonForShip("splitcontainers"..i)
						UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitcontainers"..i))));
						---race for taskbar	    
						RaceDisplayInInterface(SobGroup_OwnedBy("splitcontainers"..i))
	
						en = SobGroup_GetHardPointHealth("splitcontainers"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));	
						UI_SetElementVisible("NewTaskbar", "containerruframe", 1)  				       	      
						UI_SetTextLabelText("NewTaskbar", "containerruload", ""..tradeList[SobGroup_OwnedBy("splitcontainers"..i) + 1]);  			          	 	    	
						Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save			
						--break    
					end     
				end	
			end	       
		end  	
	    
	---Mine Container  
	  if (hwsaving == 2 and nmc >= 15) or nmc > 0 then			--nmc < 15
			if nmc > 0 then 
				for i = 0,nmc - 1,1 do	
					if SobGroup_Empty("splitminecontainers"..i) == 0 then			
	
						if SobGroup_InWorldBoundForKillingOnly("splitminecontainers"..i, 0) == 0 then 
							SobGroup_SetHealth("splitminecontainers"..i, 0)
						end
	
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 2 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitminecontainers"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)          	
						end		  
											
						if SobGroup_Selected_Smart("splitminecontainers"..i) == 1 then	
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            DriveMode_DisplayButtonForShip("splitminecontainers"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitminecontainers"..i))));
							---race for taskbar	 
							RaceDisplayInInterface(SobGroup_OwnedBy("splitminecontainers"..i))
	
							UI_SetElementVisible("NewTaskbar", "minecontainerruframe", 1)  				       	      
							UI_SetTextLabelText("NewTaskbar", "minecontainerrurate", ""..minecontainerrurateDisplayList[SobGroup_OwnedBy("splitminecontainers"..i) + 1]);  				     
							UI_SetTextLabelText("NewTaskbar", "minecontainerruload", ""..minecontainerloadDisplayList[SobGroup_OwnedBy("splitminecontainers"..i) + 1]);   
							UI_SetTextLabelText("NewTaskbar", "minecontainerrudropoff", ""..minecontainerdropoffDisplayList[SobGroup_OwnedBy("splitminecontainers"..i) + 1]);  			       	 	    	
							Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save			
							--break	     
						end     
					end	
				end	       
			end	 
	  end	
	  
	---Mining Base  
		--no owner
		--if hwsaving == 5 then
			if SobGroup_Empty("megalithnoowner") == 0 then	  
				if megalithnoownercount == 0 then  
					megalithnoownercount = SobGroup_SplitGroupFromGroup("megalithnoowner", "megalithnoowner", SobGroup_Count("megalithnoowner"), "splitter") 	    
				end
				for i = 0,(megalithnoownercount - 1),1 do		
					if SobGroup_Empty("megalithnoowner"..i) == 0 then	  	 		  
						if SobGroup_Selected_Smart("megalithnoowner"..i) == 1 then
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+2
	            DriveMode_DisplayButtonForShip("megalithnoowner"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("megalithnoowner"..i))));
							---race for taskbar			      
							UI_SetTextLabelText("NewTaskbar", "unitrace", "None");		      			  
							UI_SetElementVisible("NewTaskbar", "MBru", 1)		
							if SobGroup_PlayerIsInSensorRange("megalithnoowner"..i, playerIndex) == 1 then		
								availableru = SobGroup_GetHardPointHealth("megalithnoowner"..i, "ru") * 100000   				  		    	  
								UI_SetTextLabelText("NewTaskbar", "availableru", ""..floor(availableru));  
								UI_SetTextLabelText("NewTaskbar", "collectorinside", "0" ); 
								UI_SetTextLabelText("NewTaskbar", "containerinside", "0" ); 	 
							else			      
								UI_SetTextLabelText("NewTaskbar", "availableru", "??");  
								UI_SetTextLabelText("NewTaskbar", "collectorinside", "??"); 
								UI_SetTextLabelText("NewTaskbar", "containerinside", "??"); 	 
							end		    
							--break
						end
					end  
				end  
			end		
			--owner	
			if nmb > 0 then
				for i = 0,nmb-1,1 do  
					if SobGroup_Empty("splitminingbases"..i) == 0 then	 
	          SobGroup_AbilityActivate("splitminingbases"..i, AB_Lights, 1)			--SobGroup_AbilityActivate("temp"..i, AB_Lights, 1)				
						if SobGroup_Selected_Smart("splitminingbases"..i) == 1 then	
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+2
	            DriveMode_DisplayButtonForShip("splitminingbases"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitminingbases"..i))));
							---race for taskbar	    
							UI_SetTextLabelText("NewTaskbar", "unitrace", "None");
							UI_SetElementVisible("NewTaskbar", "MBru", 1) 
							if SobGroup_PlayerIsInSensorRange("splitminingbases"..i, playerIndex) == 1 or AreAllied(playerIndex, SobGroup_OwnedBy("splitminingbases"..i)) == 1 then    		
								availableru = SobGroup_GetHardPointHealth("splitminingbases"..i, "ru") * 100000      			      	  
								UI_SetTextLabelText("NewTaskbar", "availableru", ""..floor(availableru));  
								UI_SetTextLabelText("NewTaskbar", "collectorinside", ""..SobGroup_Count("hgn_resourcecollector_insidemegalith"..i)); 
								UI_SetTextLabelText("NewTaskbar", "containerinside", ""..SobGroup_Count("hgn_minecontainer_insidemegalith"..i));  	   
							else
								UI_SetTextLabelText("NewTaskbar", "availableru", "??");  
								UI_SetTextLabelText("NewTaskbar", "collectorinside", "??"); 
								UI_SetTextLabelText("NewTaskbar", "containerinside", "??");  	      
							end  
							--break     
						end   
					end  
				end    	    	    
			end		
			--debris
			if MaxCount[2] >= 0 and Universe_GameTime() > 20 then
				for i = 0,MaxCount[2],1 do  
					if SobGroup_Empty("debris"..i) == 0 then	 	
						if SobGroup_Selected_Smart("debris"..i) == 1 then			      
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+2
	            DriveMode_DisplayButtonForShip("debris"..i)
							UI_SetTextLabelText("NewTaskbar", "unitrace", "None");
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("debris"..i))));
							--break     
						end   
					end  
				end    		      	    
			end		
			--asteroidbelt
			if MaxCount[3] >= 0 and Universe_GameTime() > 20 then
				for i = 0,MaxCount[3],1 do  
					if SobGroup_Empty("asteroidbelt"..i) == 0 then	 	
						if SobGroup_Selected_Smart("asteroidbelt"..i) == 1 then			      
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+2
	            DriveMode_DisplayButtonForShip("asteroidbelt"..i)
							UI_SetTextLabelText("NewTaskbar", "unitrace", "None");
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("asteroidbelt"..i))));
							--break     
						end   
					end  
				end    		      	    
			end		
			--megalite
			if MaxCount[4] >= 0 and Universe_GameTime() > 20 then
				for i = 0,MaxCount[4],1 do  
					if SobGroup_Empty("megalite"..i) == 0 then
						if SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_headshotasteroid, meg_carrier_huge") == 1 then
							if SobGroup_InWorldBoundForKillingOnly("megalite"..i, 0) == 0 then 
								SobGroup_SetHealth("megalite"..i, 0)
							end
						end
						if SobGroup_Selected_Smart("megalite"..i) == 1 then			      
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+2
	            DriveMode_DisplayButtonForShip("megalite"..i)
							UI_SetTextLabelText("NewTaskbar", "unitrace", "None");
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("megalite"..i))));
							--break     
							if SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_engineeringbay") == 1 then
								UI_SetElementVisible("NewTaskbar", "EngineeringBayFrame", 1)
								if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "engineeringbay3" ) == 1 then
					      	UI_SetTextLabelText("NewTaskbar", "EngineeringBayLevel", "lvl.3")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRadius", "21000")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRate", "0.4%")
					      elseif Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "engineeringbay2" ) == 1 then
					      	UI_SetTextLabelText("NewTaskbar", "EngineeringBayLevel", "lvl.2")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRadius", "14000")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRate", "0.3%")
					      elseif Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "engineeringbay1" ) == 1 then
					      	UI_SetTextLabelText("NewTaskbar", "EngineeringBayLevel", "lvl.1")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRadius", "7000")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRate", "0.2%")
					      else
					      	UI_SetTextLabelText("NewTaskbar", "EngineeringBayLevel", "lvl.0")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRadius", "3000")
									UI_SetTextLabelText("NewTaskbar", "EngineeringBayRate", "0.1%")
					      end
							elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_reinforcementpad") == 1 then
								UI_SetElementVisible("NewTaskbar", "ReinforcementPadFrame", 1)
								local supplytype = 10*SobGroup_GetHardPointHealth("megalite"..i, "type_override")
								local type = "Unknown"
								if supplytype >= 7 then	--corvette
									type = "Corvettes"
								elseif supplytype >= 3 then  --fighter
									type = "Fighters"
								elseif supplytype >= 1 then	--RUs
									type = "1000 RUs"
								else																		--energy
									type = "50 Energy"
								end
								local countdown = floor(100*SobGroup_GetHardPointHealth("megalite"..i, "time"))
					      UI_SetTextLabelText("NewTaskbar", "NextSupply", type)
								UI_SetTextLabelText("NewTaskbar", "SupplyCountdown", countdown)
							elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_carrier_huge") == 1 then
								UI_SetElementVisible("NewTaskbar", "aircombatframe", 1)
							  if Universe_GameTime() > 51 then
							  	local totaljets = 0
							  	local productionspeed = 0
							  	local assemblylines = 1
							  	local hangarcapacity = 20
							  	if SobGroup_OwnedBy("megalite"..i) >= 0 then
							  		totaljets = SobGroup_Count("aircombat_jets"..SobGroup_OwnedBy("megalite"..i))
							  		for b=1,4,1 do
											if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "AirCombatBuildUpgrade"..b ) == 1 then
												productionspeed=b
											end
										end
								  	for b=1,4,1 do
											if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "AirCombatAssemblyLineUpgrade"..b ) == 1 then
												assemblylines=assemblylines+1
											end
										end
										for b=1,6,1 do
											if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "AirCombatCapacityUpgrade"..b ) == 1 then
												hangarcapacity=hangarcapacity+10
											end
										end
							  	end
							  	UI_SetTextLabelText("NewTaskbar", "aircraft", ""..SobGroup_CountDockedShips("megalite"..i).."/"..totaljets)
							  	UI_SetTextLabelText("NewTaskbar", "aircraftproduction", "Lv."..productionspeed.."/x"..assemblylines)
							  	UI_SetTextLabelText("NewTaskbar", "aircraftdocking", ""..hangarcapacity)
							  end
							elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_bentus") == 1 then 
			          if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "researchspeedboost4" ) == 1 then
									UI_SetElementVisible("NewTaskbar", "ResearchBoosterFrame", 1)
			            UI_SetTextLabelText("NewTaskbar", "researchbooster", "Singularity");
			          end
							elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "meg_mandator_star_dreadnought, meg_titan_cruiser, meg_hvdreadnaught, meg_executor_ssd") == 1 then
								UI_SetElementVisible("NewTaskbar", "DerelictBattleshipFrame", 1)
						    local aim = "30%"
						    local firepower = "30%"
					      if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "derelictbattleshipaim3" ) == 1 then
						      aim = "100%"
					      elseif Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "derelictbattleshipaim2" ) == 1 then
						      aim = "75%"
					      elseif Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "derelictbattleshipaim1" ) == 1 then
						      aim = "50%"
					      end
					      if Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "derelictbattleshipdamage3" ) == 1 then
						      firepower = "100%"
					      elseif Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "derelictbattleshipdamage2" ) == 1 then
						      firepower = "75%"
					      elseif Player_HasResearch(SobGroup_OwnedBy("megalite"..i), "derelictbattleshipdamage1" ) == 1 then
						      firepower = "50%"
					      end
					      UI_SetTextLabelText("NewTaskbar", "Aiming", aim)
								UI_SetTextLabelText("NewTaskbar", "Firepower", firepower)
							elseif SobGroup_AreAnyOfTheseTypes("megalite"..i, "test_tester") == 1 then
								UI_SetElementVisible("NewTaskbar", "test_cameraframe", 1)
								local camera_vector = {0, 0, 0}
							  if Camera_IsFocused("megalite"..i) == 1 then
							  	local camera_position = Camera_GetPosition(Universe_CurrentPlayer())
							  	local tester_posistion = SobGroup_GetPosition("megalite"..i)
							  	camera_vector = Vector_Operation(tester_posistion, camera_position, "-")
							  end
						  	UI_SetTextLabelText("NewTaskbar", "vector_x", floor(camera_vector[1]))
						  	UI_SetTextLabelText("NewTaskbar", "vector_y", floor(camera_vector[2]))
						  	UI_SetTextLabelText("NewTaskbar", "vector_z", floor(camera_vector[3]))
							end
						end   
					end  
				end    		      	    
			end		
			--planet
			if MaxCount[5] >= 0 and Universe_GameTime() > 20 then
				for i = 0,MaxCount[5],1 do  
					if SobGroup_Empty("planet"..i) == 0 then	 	
						if SobGroup_Selected_Smart("planet"..i) == 1 then			      
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+2
	            DriveMode_DisplayButtonForShip("planet"..i)
							UI_SetTextLabelText("NewTaskbar", "unitrace", "None");
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("planet"..i))));
							for p, iCount in planetPopulationList do
								if SobGroup_AreAnyOfTheseTypes("planet"..i, "hgn_"..iCount.planet) == 1 then
									UI_SetTextLabelText("NewTaskbar", "energy", ""..iCount.en)
									UI_SetElementVisible("NewTaskbar", "Planetframe", 1)
									local deathtoll = iCount.dead
									if deathtoll > iCount.population then
										deathtoll = iCount.population
									end
						 			UI_SetTextLabelText("NewTaskbar", "planetcivilian", ""..iCount.grow.."/"..deathtoll.."/"..iCount.population)
						 			local ownerlist = SobGroup_OwnedBy("planet"..i)+1
						 			if ownerlist > 0 then
						 				UI_SetTextLabelText("NewTaskbar", "planetenergy", ""..LastpowerList[ownerlist] .. "/" .. LastpowerListStored[ownerlist] .. "/" .. LastpowerListMax[ownerlist])
						 			else
						 				UI_SetTextLabelText("NewTaskbar", "planetenergy", "0/0/0")
						 			end
						 			UI_SetTextLabelText("NewTaskbar", "planetdamage", ""..iCount.dmg)
								end
							end
							--break     
						end   
					end  
				end    		      	    
			end
		--end	
		
	---Juggernaut	 
	  if (hwsaving == 2 and nj >= 12) or nj > 0 then		--nj < 12
			if nj > 0 then  	                                                  
				for i = 0,nj-1,1 do    
					if SobGroup_Empty("splitjuggernaughts"..i) == 0 then	
	
						--Install Auxiliary Boosters
						local booster_slots = 3
						SobGroup_Create("JuggernaughtBoostersDocked")
						SobGroup_Clear("JuggernaughtBoostersDocked")
						SobGroup_GetSobGroupDockedWithGroup("splitjuggernaughts"..i, "JuggernaughtBoostersDocked")
						if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "JuggernaughtAuxiliaryBooster") == 1 and 
						SobGroup_IsDocked("splitjuggernaughts"..i) == 0 and
						SobGroup_IsDoingAbility("splitjuggernaughts"..i, AB_Dock) == 0 and
						SobGroup_AreAllInRealSpace("splitjuggernaughts"..i) == 1 and 
						hwsaving == 2 then		--docking needs some time, so don't hurry, otherwise you'll throw too many boosters at a time 
							if SobGroup_Count("JuggernaughtBoostersDocked") < booster_slots then
								Volume_AddSphere("JuggernaughtBoosterVOL_"..i, SobGroup_GetPosition("splitjuggernaughts"..i), 800)
								SobGroup_Create("JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i))
								SobGroup_Clear("JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i))
								if SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "jbooster") >= 0.5 then	--do nothing, just count the time lapsed during launching
									local damaged_hp = SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "jbooster") - 0.1*Temp_GlobalVariable.Selected_NextInterval
									if damaged_hp <= 0.2 then
										damaged_hp = 0.25
									elseif damaged_hp > 1 then
										damaged_hp = 1
									end
									SobGroup_SetHardPointHealth("splitjuggernaughts"..i, "jbooster", damaged_hp)
								elseif SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "jbooster") >= 0.2 then	--all boosters are installed at once in the first place
									for h=1,3,1 do
										SobGroup_SpawnNewShipInSobGroup(SobGroup_OwnedBy("splitjuggernaughts"..i), "hgn_juggernaught_booster", "JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i), "JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i), "JuggernaughtBoosterVOL_"..i)
									end
									SobGroup_DockSobGroupAndStayDocked("JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i), "splitjuggernaughts"..i)
									SobGroup_SetHardPointHealth("splitjuggernaughts"..i, "jbooster", 0.01)
								elseif SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "jbooster") < 0.2 then								--boosters are replaced on an individual basis if destroyed
									SobGroup_Create("NearbyJuggernaughts")
					    		SobGroup_FillProximitySobGroup ("NearbyJuggernaughts", "hgn_juggernaught"..SobGroup_OwnedBy("splitjuggernaughts"..i), "splitjuggernaughts"..i, 1500)
					    		local num_jugs = SobGroup_Count("NearbyJuggernaughts")
					    		SobGroup_Create("NearbyBoosters")
					    		SobGroup_FillProximitySobGroup ("NearbyBoosters", "hgn_juggernaught_booster"..SobGroup_OwnedBy("splitjuggernaughts"..i), "splitjuggernaughts"..i, 1500)
									local num_boosters = SobGroup_Count("NearbyBoosters")
									if num_boosters < num_jugs * booster_slots then
										SobGroup_SpawnNewShipInSobGroup(SobGroup_OwnedBy("splitjuggernaughts"..i), "hgn_juggernaught_booster", "JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i), "JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i), "JuggernaughtBoosterVOL_"..i)
										SobGroup_DockSobGroupAndStayDocked("JuggernaughtBoosterSpawnSOB_"..SobGroup_OwnedBy("splitjuggernaughts"..i), "splitjuggernaughts"..i)
									end
								end
								Volume_Delete("JuggernaughtBoosterVOL_"..i)
							end
						elseif SobGroup_Count("JuggernaughtBoostersDocked") > 0 and SobGroup_IsDoingAbility("splitjuggernaughts"..i, AB_Dock) == 1 then
							SobGroup_SetHealth("JuggernaughtBoostersDocked", 0)
						elseif SobGroup_IsDocked("splitjuggernaughts"..i) == 1 then
							SobGroup_SetHardPointHealth("splitjuggernaughts"..i, "jbooster", 1)
						end
	
						--2nd and 3rd stage thrusters
						if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "CapitalAfterburner") == 1 or Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "CapitalAfterburnerAI") == 1 then
							if SobGroup_GetEquivalentSpeed("splitjuggernaughts"..i) >= 2500 then
								SobGroup_SetMaxSpeedMultiplier("splitjuggernaughts"..i, 2)
								local CanSeeFX = 0
								if FX_StartEvent_Smart("splitjuggernaughts"..i, "AfterBurn" ) == 1 then
									CanSeeFX = 1
								end
								if SobGroup_GetEquivalentSpeed("splitjuggernaughts"..i) >= 10000 then			--3rd stage thruster
									if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "JuggernaughtAuxiliaryBooster") == 1 then
										SobGroup_Create("JuggernaughtBoostersDocked")
										SobGroup_Clear("JuggernaughtBoostersDocked")
										SobGroup_GetSobGroupDockedWithGroup("splitjuggernaughts"..i, "JuggernaughtBoostersDocked")
										local num_boosters = SobGroup_Count("JuggernaughtBoostersDocked")
										if num_boosters > 0 then
											SobGroup_SetMaxSpeedMultiplier("splitjuggernaughts"..i, 2+2/3*num_boosters)
											if CanSeeFX == 1 then
												FX_StartEvent("JuggernaughtBoostersDocked", "AfterBurn" )
											end
										end
									end
								end
							else
								SobGroup_SetMaxSpeedMultiplier("splitjuggernaughts"..i, 1)
							end
						end
	
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 2 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitjuggernaughts"..i,0.7,Temp_GlobalVariable.Selected_NextInterval)          	
						end		    
	
						if SobGroup_InWorldBoundForKillingOnly("splitjuggernaughts"..i, 0) == 0 then 
							SobGroup_SetHealth("splitjuggernaughts"..i, 0)
						end
	
						SobGroup_ForceStayDockedIfDocking("splitjuggernaughts"..i)      
						if SobGroup_IsDocked("splitjuggernaughts"..i) == 1 then
							if SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "jspeed") > 0.5 then
								FX_StartEvent("splitjuggernaughts"..i, "Docking")
							end		  		              
							if SobGroup_HealthPercentage("splitjuggernaughts"..i) <= 0.25 then
								SobGroup_SetInvulnerability("splitjuggernaughts"..i, 1)	
							else
								SobGroup_SetInvulnerability("splitjuggernaughts"..i, 0)	  
							end             	 
							SobGroup_MakeSelectable("splitjuggernaughts"..i, 0)
							SobGroup_SetHardPointHealth("splitjuggernaughts"..i, "jspeed", 0) 
						else
							if SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "jspeed") < 0.5 then
								FX_StartEvent("splitjuggernaughts"..i, "Launching")
							end		      
							SobGroup_MakeSelectable("splitjuggernaughts"..i, 1)  
							SobGroup_SetHardPointHealth("splitjuggernaughts"..i, "jspeed", 1)
						end
						if SobGroup_Selected_Smart("splitjuggernaughts"..i) == 1 then	   
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            DriveMode_DisplayButtonForShip("splitjuggernaughts"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitjuggernaughts"..i))));
							---race for taskbar	    
							RaceDisplayInInterface(SobGroup_OwnedBy("splitjuggernaughts"..i))
	
							DetonationPower = 128000	      
							if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "DetonationPower2" ) == 1 then
								DetonationPower = DetonationPower * 2.1            
							elseif Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "DetonationPower1" ) == 1 then
								DetonationPower = DetonationPower * 1.5            
							elseif Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "DetonationPower" ) == 1 then
								DetonationPower = DetonationPower * 1.25       
							end 	
							DetonationRange = 4500	      
							if Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "DetonationRange2" ) == 1 then
								DetonationRange = DetonationRange * 1.5           
							elseif Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "DetonationRange1" ) == 1 then
								DetonationRange = DetonationRange * 1.3            
							elseif Player_HasResearch(SobGroup_OwnedBy("splitjuggernaughts"..i), "DetonationRange" ) == 1 then
								DetonationRange = DetonationRange * 1.15       
							end 	
							UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)	
							floor(DetonationPower)       	      
							UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", ""..DetonationPower);   	    
							floor(DetonationRange)       	      
							UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", ""..DetonationRange); 
							exp1 = SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "experience") * 10000		  	   	        
						  if exp1 > 999 then
						  	exp1 = 999
						  end
							UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 
							eff = -(floor((1 - SobGroup_GetHardPointHealth("splitjuggernaughts"..i, "efficency")) * 10)) 		 		  		  		  	        
							if eff <= -1 then	
								UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);	   	
							end				  	  	
							UI_SetElementSize("NewTaskbar", "subsystems", 32, 24); 
							Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save 		      
							--break      	
						end  	  
					end  		  		  
				end	 
			end  
		end	
		
	---Nuclear Bomb	
	  if (hwsaving == 6 and nnb >= 12) or nnb > 0 then		--nnb < 12
			if nnb > 0 then  	                                                  
				for i = 0,nnb-1,1 do  
					if SobGroup_Empty("splitnuclearbombs"..i) == 0 then	  
					
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 6 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitnuclearbombs"..i,0.5,Temp_GlobalVariable.Selected_NextInterval)          	
						end		 					
						
						if SobGroup_InWorldBoundForKillingOnly("splitnuclearbombs"..i, 0) == 0 then 
							SobGroup_SetHealth("splitnuclearbombs"..i, 0)
						end
						    
						SobGroup_ForceStayDockedIfDocking("splitnuclearbombs"..i)	                                        
						if SobGroup_Selected_Smart("splitnuclearbombs"..i) == 1 then	  
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            DriveMode_DisplayButtonForShip("splitnuclearbombs"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitnuclearbombs"..i))));  
							---race for taskbar	    
							RaceDisplayInInterface(SobGroup_OwnedBy("splitnuclearbombs"..i))
	
							DetonationPower = 192000	      
							if Player_HasResearch(SobGroup_OwnedBy("splitnuclearbombs"..i), "NBDetonationPower2" ) == 1 then
								DetonationPower = DetonationPower * 2.1            
							elseif Player_HasResearch(SobGroup_OwnedBy("splitnuclearbombs"..i), "NBDetonationPower1" ) == 1 then
								DetonationPower = DetonationPower * 1.5            
							elseif Player_HasResearch(SobGroup_OwnedBy("splitnuclearbombs"..i), "NBDetonationPower" ) == 1 then
								DetonationPower = DetonationPower * 1.25       
							end 	
							DetonationRange = 8250	      
							if Player_HasResearch(SobGroup_OwnedBy("splitnuclearbombs"..i), "NBDetonationRange2" ) == 1 then
								DetonationRange = DetonationRange * 1.5           
							elseif Player_HasResearch(SobGroup_OwnedBy("splitnuclearbombs"..i), "NBDetonationRange1" ) == 1 then
								DetonationRange = DetonationRange * 1.3            
							elseif Player_HasResearch(SobGroup_OwnedBy("splitnuclearbombs"..i), "NBDetonationRange" ) == 1 then
								DetonationRange = DetonationRange * 1.15       
							end 	
							if SobGroup_AreAnyOfTheseTypes("splitnuclearbombs"..i, "hgn_nuclearbomb, hgn_nucleartube1, hgn_nucleartube2, hgn_nucleartube3") == 1 then
								UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)	
								floor(DetonationPower)       	      
								UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", ""..DetonationPower);   	    
								floor(DetonationRange)       	      
								UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", ""..DetonationRange); 		 
							end   
							--break 	
						end    	  			  
					end  	  
				end	 
			end
	  end
	end
  
  if Temp_GlobalVariable.Selected_Save == 3 then
	---Destroyer
	  if (hwsaving == 0 and nd >= 20) or nd > 0 then		--nd < 20
			if nd > 0 then					
				for i = 0,nd-1,1 do     
					if SobGroup_Empty("splitdestroyers"..i) == 0 then	     
					
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 0 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitdestroyers"..i,0.7,Temp_GlobalVariable.Selected_NextInterval)          	
						end			  
	
						if SobGroup_InWorldBoundForKillingOnly("splitdestroyers"..i, 0) == 0 then 
							SobGroup_SetHealth("splitdestroyers"..i, 0)
						end
	
			      if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_destroyer") == 1 then
		--Orders
				      orders("splitdestroyers"..i, "destroyallguns",0,0)
			      elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kad_destroyer_real") == 1 then	
		--Orders         
				      orders("splitdestroyers"..i, "guard",0,0)
				      orders("splitdestroyers"..i, "needle",0,0)
		--Kadeshi Perks
				      KadPerkExecute("splitdestroyers"..i)
				    elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kad_custodian") == 1 then
				    	--auto dock
		        	if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "isai" ) == 1 then
		        		CreateSubsystemOnShip("splitdestroyers"..i, "hgn_orders_dock")
		        	end
		--Orders
							orders("splitdestroyers"..i, "parade",0,0)
				      orders("splitdestroyers"..i, "guard",0,0)
				      orders("splitdestroyers"..i, "dock",0,0)
	        		orders("splitdestroyers"..i, "clear",0,0)
	        		orders("splitdestroyers"..i, "needle",0,0)
		--Kadeshi Perks
				      KadPerkExecute("splitdestroyers"..i)
		--special weapons
							if ((Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "isai" ) == 1) and					   
			      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitdestroyers"..i), "AsteroidSmasher", "splitdestroyers"..i, 10000) == 1) and
			      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitdestroyers"..i), "kad_minermissile") < 3) and
			      	   (Player_GetRU(SobGroup_OwnedBy("splitdestroyers"..i)) > 4000)) then 
			      	  SobGroup_CreateShip("splitdestroyers"..i, "kad_minermissile")						
			      	  Player_SetRU(SobGroup_OwnedBy("splitdestroyers"..i), Player_GetRU(SobGroup_OwnedBy("splitdestroyers"..i)) - 500)
			      	end
			      	if ((Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "isai" ) == 1) and
			      		 (Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "Kadesh3" ) == 1) and
			      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitdestroyers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitdestroyers"..i), "splitdestroyers"..i, 17500) == 1) and
								 (SobGroup_IsDoingAbility("splitdestroyers"..i, abilityList[2]) == 1) and
			      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitdestroyers"..i), "kad_jihadi") < CPULODvalueList[SobGroup_OwnedBy("splitdestroyers"..i)+1]) and
			      	   (Player_GetRU(SobGroup_OwnedBy("splitdestroyers"..i)) > 5000)) then 
			      	  SobGroup_CreateShip("splitdestroyers"..i, "kad_jihadi")
			      	  Player_SetRU(SobGroup_OwnedBy("splitdestroyers"..i), Player_GetRU(SobGroup_OwnedBy("splitdestroyers"..i)) - 1500)
			      	end
		--dark realm
							if SobGroup_HealthPercentage("splitdestroyers"..i) > 0 then
								if SobGroup_IsDoingAbility("splitdestroyers"..i, AB_DefenseField) == 1 then
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianDarkRealm3" ) == 1 then
										CreateSubsystemOnShip("splitdestroyers"..i, "kad_darkrealm_3")
									elseif Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianDarkRealm2" ) == 1 then
										CreateSubsystemOnShip("splitdestroyers"..i, "kad_darkrealm_2")
									elseif Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianDarkRealm1" ) == 1 then
										CreateSubsystemOnShip("splitdestroyers"..i, "kad_darkrealm_1")
									end
								else
									RemoveSubsystemOnShip("splitdestroyers"..i, "kad_darkrealm_1")
									RemoveSubsystemOnShip("splitdestroyers"..i, "kad_darkrealm_2")
									RemoveSubsystemOnShip("splitdestroyers"..i, "kad_darkrealm_3")
								end
							end
		        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "rad_destroyer, rad_merc_cruiser, rad_helios, rad_refurbisheddestroyer") == 1 then
				      orders("splitdestroyers"..i, "guard",0,0)
		        	ExcuteExperienceSubsystemsWithFullRange("splitdestroyers"..i)
		        	RadExperienceAbilityExecute("splitdestroyers"..i)
		        	--Mercenary Upgrades
		        	if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "rad_merc_cruiser") == 1 then
		        		Rad_DetermineMercUpgrades("splitdestroyers"..i)
		        	end
		        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "hgn_destroyer, hgn_sweeperdestroyer, hgn_missiledestroyer, hgn_iondestroyer, hgn_advdestroyer, hgn_artillerydestroyer") == 1 then
		        	orders("splitdestroyers"..i, "cust_clear",0,0)
		        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_artilleryship") == 1 then
		        	orders("splitdestroyers"..i, "destroyallguns",0,0)
		        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kpr_destroyer, kpr_hive") == 1 then
				      orders("splitdestroyers"..i, "guard",0,0)
				      orders("splitdestroyers"..i, "dock",0,0)
	          	orders("splitdestroyers"..i, "clear",0,0)
	          	KprSpecialAbilityExecute("splitdestroyers"..i)
		        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kpr_destroyerm10") == 1 then		--SP level 10, you are so dead! HEHEHEHE....
	          	KprSpecialAbilityExecute("splitdestroyers"..i)
				    end
	
		--Energy Consume
		        if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_hammerhead, hgn_cruisera, hgn_cruiserb, kad_destroyer_real, kad_custodian, rad_helios, kpr_destroyer, kpr_destroyerm10, kpr_hive") == 1 then	
		          if hwsaving == 0 then 	     
	              energyConsume("splitdestroyers"..i,1,1)	       
	              if SobGroup_GetEquivalentSpeed("splitdestroyers"..i) >= 33856 and (Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalAfterburner") == 1 or Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalAfterburnerAI") == 1) then
									powerList[SobGroup_OwnedBy("splitdestroyers"..i) + 1] = powerList[SobGroup_OwnedBy("splitdestroyers"..i) + 1] - 1
				  				powerListManager[SobGroup_OwnedBy("splitdestroyers"..i) + 1].move = powerListManager[SobGroup_OwnedBy("splitdestroyers"..i) + 1].move - 1
				  				SobGroup_SetHardPointHealth("splitdestroyers"..i, "en", 0.5+((SobGroup_GetHardPointHealth("splitdestroyers"..i, "en")-0.5)*1000-1)/1000)
		       			end
	            end  			      
				    end
						
						--reduce the super high speed in normal action
						SetAfterburnerForShip("splitdestroyers"..i, 33856, "CapitalAfterburner", "AfterBurn", 0)
	
						if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_hammerhead") == 1 then
						--disable phase armour ability for low energy
							if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedKeeperShield") == 1 then
								if LastpowerListStored[SobGroup_OwnedBy("splitdestroyers"..i) + 1] < 1 then
									if SobGroup_IsDoingAbility("splitdestroyers"..i, abilityList[25]) == 0 and SobGroup_CanDoAbility("splitdestroyers"..i, abilityList[25]) == 1 then
										SobGroup_AbilityActivate("splitdestroyers"..i, abilityList[25], 0)
									end
								else
									if SobGroup_CanDoAbility("splitdestroyers"..i, abilityList[25]) == 0 then
										SobGroup_AbilityActivate("splitdestroyers"..i, abilityList[25], 1)
									end
								end
							end
						--activate keeper's phase armour
							if (SobGroup_IsDoingAbility("splitdestroyers"..i, abilityList[25]) == 1) and SobGroup_HealthPercentage("splitdestroyers"..i) > 0 then
								--SobGroup_SetInvulnerability("splitdestroyers"..i, 1)
								SobGroup_SetHealth("splitdestroyers"..i, 1)
								SobGroup_SetInvulnerabilityOfHardPoint("splitdestroyers"..i, "Engine", 1)
							else
								--SobGroup_SetInvulnerability("splitdestroyers"..i, 0)
								SobGroup_SetInvulnerabilityOfHardPoint("splitdestroyers"..i, "Engine", 0)
							end
						--keeper explosion damage funcion
							for z=0, nd-1, 1 do
								if SobGroup_HealthPercentage("splitdestroyers"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitdestroyers"..z, "vgr_hammerhead") == 1 then   
									if z==i then
										SobGroup_EvacuateShipsAroundExplodingShip("splitdestroyers"..i, 5000)		--Evacuate nearby ships to avoid explosion damage
									end
									--print("keeper explosion initiating")
									SobGroup_Create("KeeperExpBag"..z)          
						      SobGroup_SobGroupAdd("KeeperExpBag"..z, "splitdestroyers"..z)      
						      SobGroup_Clear("splitdestroyers"..z)    
							  	ExpBag.KeeperIndex = z
							    Rule_AddInterval("KPRexplosiondamageexp", 0.1)		--2.37
							    --print("keeper explosion activated")              
						    end
							end
						end
						
						--templar explosion damage funcion
						if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "Sajuuk2") == 1 and Player_CanResearch(SobGroup_OwnedBy("splitdestroyers"..i), "hasdemopod") == 1 and SobGroup_CanDoAbility("splitdestroyers"..i, AB_Cloak) == 1 then
							if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kad_destroyer_real") == 1 and SobGroup_HealthPercentage("splitdestroyers"..i) <= 0 then
								for z=0, nd-1, 1 do
									if SobGroup_HealthPercentage("splitdestroyers"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitdestroyers"..z, "kad_destroyer_real") == 1 then   
										if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..z), "Sajuuk2") == 1 and Player_CanResearch(SobGroup_OwnedBy("splitdestroyers"..z), "hasdemopod") == 1 and SobGroup_CanDoAbility("splitdestroyers"..z, AB_Cloak) == 1 then
											if z==i then
												SobGroup_EvacuateShipsAroundExplodingShip("splitdestroyers"..i, 8000)		--Evacuate nearby ships to avoid explosion damage
											end
											SobGroup_Create("TemplarExpBag"..z)          
								      SobGroup_SobGroupAdd("TemplarExpBag"..z, "splitdestroyers"..z)      
								      SobGroup_Clear("splitdestroyers"..z)    
									  	ExpBag.TemplarIndex = z
									    Rule_AddInterval("Templarexplosiondamageexp", 14-Temp_GlobalVariable.Selected_NextInterval-0.1)
									  end
							    end
								end
							end
						end
	
						if SobGroup_Selected_Smart("splitdestroyers"..i) == 1 then	
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            DriveMode_DisplayButtonForShip("splitdestroyers"..i)
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitdestroyers"..i))));
							---race for taskbar	    
							RaceDisplayInInterface(SobGroup_OwnedBy("splitdestroyers"..i))
	
							exp1 = SobGroup_GetHardPointHealth("splitdestroyers"..i, "experience") * 10000			 		  		  		   	   	        
						  if exp1 > 999 then
						  	exp1 = 999
						  end
							UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 
							eff = -(floor((1 - SobGroup_GetHardPointHealth("splitdestroyers"..i, "efficency")) * 10)) 		 		  		  		  	        
							if eff <= -1 then	
								UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);	   		       
							end		
							if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_hammerhead, hgn_cruisera, hgn_cruiserb, kad_destroyer_real, kad_custodian, rad_helios, kpr_hive, kpr_destroyer, kpr_destroyerm10") == 1 then
								en = SobGroup_GetHardPointHealth("splitdestroyers"..i, "en")		 			  		  		  		  	        
						    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));
						  end
	            UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);						--32, 24
							if Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == Race_Hiigaran then
				    		UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				   		  UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
								if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "hgn_cruisera") == 1 then
								  UI_SetElementSize("NewTaskbar", "subsystems", 210, 24);
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoCruiseraIcon") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities", 1) 
										UI_SetElementVisible("NewTaskbar", "torpedo", 1)
										UI_SetTextLabelText("NewTaskbar", "torpedotext", "Torpedo");
									end  				
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "hgn_cruiserb") == 1 then				    
									UI_SetElementSize("NewTaskbar", "subsystems", 210, 24);
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoCruiserbIcon") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "monster", 66, 15);	
										UI_SetTextLabelText("NewTaskbar", "monstertext", "Mine");
									end		    	
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "hgn_minivortex") == 1 then
										UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
				   				 	UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);  				    
				    				UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				   				 	UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);  
								else				    			  
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoDestroyerIcon") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities", 1)
										UI_SetElementVisible("NewTaskbar", "torpedo", 1)
										UI_SetTextLabelText("NewTaskbar", "torpedotext", "Torpedo");
									end  				
								end  
								if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedCallistoMissileDestroyer") == 1 and SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "hgn_missiledestroyer") == 1 then
									Temp_GlobalVariable.enablebtncallisto[playerIndexList] = Temp_GlobalVariable.Selected_Save
								end  	    
							elseif Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == Race_Vaygr then
								if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_destroyer") == 1 then
								  UI_SetElementSize("NewTaskbar", "subsystems", 96, 24); 
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoDestroyer") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");			        
									end
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "MineDestroyer") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "monster", 66, 15);
										UI_SetTextLabelText("NewTaskbar", "monstertext", "Mine");
									end
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_hammerhead") == 1 then
								  UI_SetElementSize("NewTaskbar", "subsystems", 0, 0); 
								  --keeper explosion damage display
									if (SobGroup_IsDoingAbility("splitdestroyers"..i, abilityList[25]) == 1) then
										parameter = 1000	      
									else
										parameter = 500
									end
									DetonationPower = 100 * parameter
									DetonationRange = 1 * parameter
									UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)    	      
									UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", ""..DetonationPower); 
									UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", ""..DetonationRange); 
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_am") == 1 then
								  --UI_SetElementSize("NewTaskbar", "subsystems", 210, 48); 
								  --UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
				   				UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);  				    
				    		  UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				   				UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
				   			elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_pulsedestroyer") == 1 then
				   				UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
				   				UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);  				    
				    		  UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				   				UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoPulseDestroyer") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");			        
									end
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "MinePulseDestroyer") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "monster", 66, 15);
										UI_SetTextLabelText("NewTaskbar", "monstertext", "Mine");
									end	
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_cruiser") == 1 then
								  UI_SetElementSize("NewTaskbar", "subsystems", 128, 24);
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoCruiser") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");			        
									end
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoCruiser1") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionm1", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusiontext1", "Maiden");
									end
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_lightcruiser") == 1 then
								  UI_SetElementSize("NewTaskbar", "subsystems", 64, 24);
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoLightCruiser") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");			        
									end
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_lightcruiser_gun") == 1 then
								  UI_SetElementSize("NewTaskbar", "subsystems", 64, 24);
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedTorpedoLightCruiser") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");			        
									end
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "ImprovedShotgunLightCruiser") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionblaster", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusionblastertext", "Shotgun");
									end
								elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "vgr_artilleryship") == 1 then
									UI_SetElementSize("NewTaskbar", "subsystems", 128, 24); 		--64, 24
								end					    
							elseif Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == Race_Kadeshi then
				        if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kad_destroyer_real") == 1 then
									UI_DisplaySubsystems(2)
									--display perks
									PerksDeisplayInTaskBar("splitdestroyers"..i)
				        	--if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "TF_Templar") == 1 then
									--	UI_SetElementVisible("NewTaskbar", "abilities1", 1)
									--	UI_SetElementSize("NewTaskbar", "fusionprogenitor", 66, 15);					      
									--	UI_SetTextLabelText("NewTaskbar", "fusionprogenitortext", "Nanite");
									--end
				        	if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "SpearsOfKadesh") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionspear", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusionspeartext", "Spear");
									end
				        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kad_custodian") == 1 then
									UI_DisplaySubsystems(1)
									--display perks
									PerksDeisplayInTaskBar("splitdestroyers"..i)
				        	if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianHeavyMissile") == 1 then
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "fusionspear", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "fusionspeartext", "Missile");
									end
									if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianDarkRealm1") == 1 then
										local darkrealm = 1700
										if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianDarkRealm2") == 1 then
											darkrealm = 2550
										end
										if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CustodianDarkRealm3") == 1 then
											darkrealm = 3400
										end
										UI_SetElementVisible("NewTaskbar", "abilities1", 1)
										UI_SetElementSize("NewTaskbar", "darkrealm", 66, 15);					      
										UI_SetTextLabelText("NewTaskbar", "darkrealmtext", darkrealm);
									end
						    end
							elseif Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == Race_Raider then
					      if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "rad_merc_cruiser") == 1 then    
					        UI_DisplaySubsystems(1)
					        --Mercenary Upgrades
				        	Rad_DisplayMercUpgradesInTaskBar("splitdestroyers"..i)
				        elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "rad_destroyer") == 1 then    
					        UI_DisplaySubsystems(5)
					      elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "rad_refurbisheddestroyer") == 1 then    
					        UI_DisplaySubsystems(11)
					      elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "rad_helios") == 1 then    
					        UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
					        UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0); 
					        UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
				   				UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);  				    
				    		  UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				   				UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
					      else
									UI_SetElementSize("NewTaskbar", "subsystems", 128, 24);
								end
							elseif Player_GetRace(SobGroup_OwnedBy("splitdestroyers"..i)) == Race_Keeper then
					      if SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kpr_destroyer") == 1 then
					        UI_SetElementSize("NewTaskbar", "subsystems", 32, 24);
								  --keeper sacrifice damage display
									if (Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "KeeperSacrifice") == 1) then
										UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)    	      
										UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", "30%"); 
										UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", "6000");
									end
					      elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kpr_hive") == 1 then    
					        UI_DisplaySubsystems(0)	--1 removed engine because it caused crash
					      elseif SobGroup_AreAnyOfTheseTypes("splitdestroyers"..i, "kpr_destroyerm10") == 1 then    
					        UI_SetElementSize("NewTaskbar", "subsystems", 0, 0); 
					      end
							end								 
							Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	 	      	
							--break
						end  
					end  
				end		
			end	
		end
	end
	
	if Temp_GlobalVariable.Selected_Save == 4 then
	---Battlecruiser   
	  if nbc > 0 then
		  for i = 0,nbc-1,1 do      
		    if SobGroup_Empty("splitbattlecruisers"..i) == 0 then	  	    
	
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
	        if hwsaving == 4 then        
	          energyConsume("splitbattlecruisers"..i,1,1)          	 
	        elseif hwsaving == 5 and SobGroup_Empty("star_sol") == 0 then
	          sundamageinterface = SobGroup_TakeDamageSol("splitbattlecruisers"..i,0.7,Temp_GlobalVariable.Selected_NextInterval)				
		      end         
	
					if SobGroup_InWorldBoundForKillingOnly("splitbattlecruisers"..i, 0) == 0 then 
						SobGroup_SetHealth("splitbattlecruisers"..i, 0)
					end
	
					--reduce the super high speed in normal action
					SetAfterburnerForShip("splitbattlecruisers"..i, 28224, "CapitalAfterburner", "AfterBurn", 1)
	
		      if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_tanker") == 1 then
					
	--Orders
	          orders("splitbattlecruisers"..i, "clear",0,0)   
		        orders("splitbattlecruisers"..i, "evacuation",20,2)	            
			      orders("splitbattlecruisers"..i, "guard",0,0)       
		        
		      	SobGroup_GetSobGroupDockedWithGroup("splitbattlecruisers"..i, "temp")	      	
			    	SobGroup_FillShipsByType("temp1", "temp", "hgn_juggernaught")
			    	SobGroup_SobGroupAdd("temp2", "temp1")  
			    	SobGroup_FillShipsByType("temp1", "temp", "hgn_sentinel")
			    	SobGroup_SobGroupAdd("temp2", "temp1") 
			    	SobGroup_FillShipsByType("temp1", "temp", "hgn_ionsentinel")
			    	SobGroup_SobGroupAdd("temp2", "temp1") 	
			    	SobGroup_FillShipsByType("temp1", "temp", "hgn_artillerysentinel")
			    	SobGroup_SobGroupAdd("temp2", "temp1") 		    		    	
			    	if SobGroup_Count("temp2") > 0 then
				  	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "disablehyperspace") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "disablehyperspace")
				      end	
				    else
				      SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "disablehyperspace", 0)  
				  	end		   
				  	
				  	--shield
				  	if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "shield") == 0 then
				  		SobGroup_AbilityActivate("splitbattlecruisers"..i, AB_DefenseField, 0)
				  	else
				  		SobGroup_AbilityActivate("splitbattlecruisers"..i, AB_DefenseField, 1)
				  	end
		---calcola exp points per bc e vortex e sblocca moduli		    
			    elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battlecruiser, hgn_battlecruiserNUKE") == 1 then
			      --Orders        	 
	        	orders("splitbattlecruisers"..i, "clear",0,0)   
		        orders("splitbattlecruisers"..i, "evacuation",30,3)	            
			      orders("splitbattlecruisers"..i, "guard",0,0) 
			      orders("splitbattlecruisers"..i, "destroyallguns",0,0)		      
		      	if (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 500 then	   
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "500exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "500exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes", 0)
					      end	
				      end
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "400exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "400exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end    
						  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end         	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 400 then	
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "400exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "400exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes", 0)				      	
					      end	
				      end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end    
						  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end                 	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 300 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon Rail Beam Back", 0)				      	
					      end	
				      end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 200 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon Rail Beam Back", 0)
					      end	
				      end
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 100 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3", 0)				      		
					      end			      
				      end	      
		      	else
		      	end		      	
						SobGroup_Clear("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i))	
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
						   (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "hgn_viper_short") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_viper_short")
							SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_viper_short1")
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 1500)
		      	end	      	
		      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battleship") == 1 then
		        --Orders        	 
	        	orders("splitbattlecruisers"..i, "clear",0,0)   
		        orders("splitbattlecruisers"..i, "evacuation",45,5)	            
			      orders("splitbattlecruisers"..i, "guard",0,0) 
			      orders("splitbattlecruisers"..i, "destroyallguns",0,0)		     
		      	if (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 500 then	   
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "500exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "500exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes", 0)
					      end	
				      end
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "400exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "400exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end    
						  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end         	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 400 then	
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "400exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "400exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
				      	  SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes", 0)				      	
					      end	
				      end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end    
						  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end                 	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 300 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 3", 0)				      	
					      end	
				      end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 200 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "RailBeam 3", 0)
					      end	
				      end
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 100 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3", 0)				      		
					      end			      
				      end	      
		      	else
		      	end	
						SobGroup_Clear("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i))	
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
							 (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "hgn_viper_short") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_viper_short")
							SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_viper_short1")
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 1500)
		      	end	  	
		      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_vortex") == 1 then
		        --Orders        		 
	        	orders("splitbattlecruisers"..i, "clear",0,0)   
		        orders("splitbattlecruisers"..i, "evacuation",35,4)	            
			      orders("splitbattlecruisers"..i, "guard",0,0) 
			      orders("splitbattlecruisers"..i, "destroyallguns",0,0)		      
		      	if (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 500 then	   
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "500exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "500exp")			      	
				      end
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "400exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "400exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end    
						  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end         	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 400 then	
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "400exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "400exp")			      	
				      end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end    
						  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end                 	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 300 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "300exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "300exp")			      	
				      end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
						  end
	            if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 200 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "200exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "200exp")			      	
				      end
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
						    SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")			      	
						  end       	  
		      	elseif (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000) > 100 then
		      	  if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "100exp") == 0 then
				      	SobGroup_CreateSubSystem("splitbattlecruisers"..i, "100exp")
				      	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1 then
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2", 0)
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3", 0)	
					      	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 4", 0)
					      end					      			      
				      end	      
		      	else
		      	end	
		---calcola combat asset x Vortex
		        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 2") == 0 then          
			        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 1") > 0 then			          
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon1")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon2")    
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon3")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon4")   
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon5")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon6")
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon7")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon8")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon9")    
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon10")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vcannon11")  		          
			          SobGroup_RestrictBuildOption("splitbattlecruisers"..i, "hgn_vhcannonx3")
			          SobGroup_RestrictBuildOption("splitbattlecruisers"..i, "hgn_vhcannonx6")		
			          --Ping_LabelVisible(Ping_AddSobGroup("Light Asset", "name", "splitbattlecruisers"..i), 1)          
			        elseif SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 1b") > 0 then		          
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx31")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx32")    
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx33")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx34")   
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx35")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx36")
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx37")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx38")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx39")    
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx310")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx311") 		          
			          SobGroup_RestrictBuildOption("splitbattlecruisers"..i, "hgn_vcannon")
			          SobGroup_RestrictBuildOption("splitbattlecruisers"..i, "hgn_vhcannonx6")		
			          --Ping_LabelVisible(Ping_AddSobGroup("Standard Asset", "name", "splitbattlecruisers"..i), 1)      
			        elseif SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 1c") > 0 then 
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx61")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx62")    
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx63")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx64")   
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx65")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx66")
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx67")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx68")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx69")    
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx610")  
			          SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_vhcannonx611")   	
			          SobGroup_RestrictBuildOption("splitbattlecruisers"..i, "hgn_vcannon")
			          SobGroup_RestrictBuildOption("splitbattlecruisers"..i, "hgn_vhcannonx3")	
			          --Ping_LabelVisible(Ping_AddSobGroup("Heavy Asset", "name", "splitbattlecruisers"..i), 1)	                       
			        end  	                            
			      end	
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser, vgr_battlecruiser_hero") == 1 then
						if ((CPU_Exist_Smart(SobGroup_OwnedBy("splitbattlecruisers"..i)) == 1) and
						   (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "vgr_cruse1") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "vgr_cruse1")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end	    
	--Orders  					
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser_hero") == 1 then
			      	orders("splitbattlecruisers"..i, "clear",0,0)
			      	orders("splitbattlecruisers"..i, "deploy",0,0)
			      end
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_missilebattlecruiser") == 1 then
					  --missiles x ai
						SobGroup_Clear("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i))
						if ((CPU_Exist_Smart(SobGroup_OwnedBy("splitbattlecruisers"..i)) == 1) and
						   (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "vgr_cruse1") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "vgr_cruse1")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end	    
						--orders  					
			      orders("splitbattlecruisers"..i, "guard",0,0)          
	          orders("splitbattlecruisers"..i, "dock",0,0)	
	          orders("splitbattlecruisers"..i, "clear",0,0) 
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_alkhalid") == 1 then
	--Orders                   
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      orders("splitbattlecruisers"..i, "destroyallguns",0,0)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_dreadnaught, vgr_dreadnaughtB") == 1 then
	--Orders                   
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      orders("splitbattlecruisers"..i, "destroyallguns",0,0)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_heavycruiser") == 1 then
	--Orders                   
			      orders("splitbattlecruisers"..i, "clear",0,0)
			      orders("splitbattlecruisers"..i, "guard",0,0) 
			      orders("splitbattlecruisers"..i, "deploy",0,0)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_sinner") == 1 then
	        --auto dock
	        	if CPU_Exist_Smart(SobGroup_OwnedBy("splitbattlecruisers"..i)) == 1 then
	        		CreateSubsystemOnShip("splitbattlecruisers"..i, "hgn_orders_dock")
	        	end
	--Orders                   
			      orders("splitbattlecruisers"..i, "clear",0,0)
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      orders("splitbattlecruisers"..i, "dock",0,0)
			      orders("splitbattlecruisers"..i, "destroyallguns",0,0)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "Vgr_ArtilleryBattlecruiser") == 1 then
	--Orders                   
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      SobGroup_OneTimeCreationEffectExecute("splitbattlecruisers"..i, "vocal", "launch")
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kad_destroyer") == 1 then
	--Orders                   
						orders("splitbattlecruisers"..i, "parade",0,0)
			      orders("splitbattlecruisers"..i, "guard",0,0)
						orders("splitbattlecruisers"..i, "dock",0,0)
	        	orders("splitbattlecruisers"..i, "clear",0,0)
	        	orders("splitbattlecruisers"..i, "needle",0,0)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_cruiser, rad_cruiser_queen, rad_vanaarjet, rad_qwaarjetii, rad_merc_battlecruiser") == 1 then
			      orders("splitbattlecruisers"..i, "guard",0,0)
	        	ExcuteExperienceSubsystemsWithFullRange("splitbattlecruisers"..i)
	        	RadExperienceAbilityExecute("splitbattlecruisers"..i)
	        	--Mercenary Upgrades
	        	if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_merc_battlecruiser") == 1 then
	        		Rad_DetermineMercUpgrades("splitbattlecruisers"..i)
	        	end
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_scud") == 1 then
						ChangeWarheadForSCUD("splitbattlecruisers"..i)
	        	ExcuteExperienceSubsystemsWithFullRange("splitbattlecruisers"..i)
	        	RadExperienceAbilityExecute("splitbattlecruisers"..i)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_armsdealer") == 1 then
			      orders("splitbattlecruisers"..i, "parade",0,0)
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      orders("splitbattlecruisers"..i, "dock",0,0)
	        	orders("splitbattlecruisers"..i, "clear",0,0)
	        	ExcuteExperienceSubsystemsWithFullRange("splitbattlecruisers"..i)
	        	RadExperienceAbilityExecute("splitbattlecruisers"..i)
	        	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
						   (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "vgr_cruse1") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "vgr_cruse1")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
							 (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "hgn_viper_short") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_viper_short")
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
							 (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and
							 (SobGroup_UnderAttack("splitbattlecruisers"..i) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "hgn_tangomine_ws") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_tangomine_ws")
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 17500) == 1) and
							 (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and
							 (SobGroup_UnderAttack("splitbattlecruisers"..i) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "hgn_viper_ws") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_viper_ws")
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end
						if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
						   (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 17500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "vgr_cruse") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "vgr_cruse")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end
						if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and
						   (SobGroup_IsDoingAbility("splitbattlecruisers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitbattlecruisers"..i), "splitbattlecruisers"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "vgr_boa") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "vgr_boa")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 750)
		      	end
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "isai" ) == 1) and					   
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitbattlecruisers"..i), "AsteroidSmasher", "splitbattlecruisers"..i, 10000) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "hgn_minermissile") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitbattlecruisers"..i), "vgr_minermissile") < 3) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) > 4000)) then 
		      	  SobGroup_CreateShip("splitbattlecruisers"..i, "hgn_minermissile")
							SobGroup_CreateShip("splitbattlecruisers"..i, "vgr_minermissile")
		      	  Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 1500)
		      	end
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kpr_dreadnaught, kpr_reaver") == 1 then
	--Orders                   
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      orders("splitbattlecruisers"..i, "unplug",0,0)
			      KprSpecialAbilityExecute("splitbattlecruisers"..i)
	        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kpr_sajuuk") == 1 then
	--Orders                   
			      orders("splitbattlecruisers"..i, "guard",0,0)
			      KprSpecialAbilityExecute("splitbattlecruisers"..i)
			      if GetGameRubric() ~= GR_CAMPAIGN then
			      	SobGroup_OneTimeCreationEffectExecute("splitbattlecruisers"..i, "vocal", "launch")
			      end
			    end	
			    
		--Kadeshi Perks
	        if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kad_destroyer") == 1 then    
	        	KadPerkExecute("splitbattlecruisers"..i)
			    end
			    
		--sajuuk explosion damage funcion
			    if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_artillerybattlecruiser, kpr_sajuuk") == 1 then
				   if SobGroup_HealthPercentage("splitbattlecruisers"..i) <= 0 then
				   SobGroup_EvacuateShipsAroundExplodingShip("splitbattlecruisers"..i, 14000)		--Evacuate nearby ships to avoid explosion damage
					 local SajuukIndex = i
					 ExpBag.SajuukIndex = SajuukIndex
					 SobGroup_Create("SajuukExpBag"..SajuukIndex)          
				     SobGroup_SobGroupAdd("SajuukExpBag"..SajuukIndex, "splitbattlecruisers"..i)      
				     SobGroup_Clear("splitbattlecruisers"..i)
					 Rule_AddInterval("Sajuukexplosiondamageexp", 12-Temp_GlobalVariable.Selected_NextInterval-0.1)
				   end
				 end
				
		--sajuuk reload solar charge
			    if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_artillerybattlecruiser") == 1  then
				    if Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) >= 100100 then
				      if SobGroup_Empty("supporter"..SobGroup_OwnedBy("splitbattlecruisers"..i)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitbattlecruisers"..i), "100000ru") == 0 then   
				         if Player_GetRace(SobGroup_OwnedBy("splitbattlecruisers"..i)) == Race_Vaygr then
				      	    SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy("splitbattlecruisers"..i), "100000ru")
				         end
				      end 
				    elseif SobGroup_IsBuilding("splitbattlecruisers"..i, "hgn_orders_reload") == 0 then
				  	   if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("splitbattlecruisers"..i), "100000ru") > 0 then
				    	  SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy("splitbattlecruisers"..i), "100000ru", 0)
				    	end
				    end
					 	if SobGroup_HealthPercentage("splitbattlecruisers"..i) > 0 then
							local timer = SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "hgn_orders_reload")
							if timer > 1 then
								timer = 1
							end
							if timer > 0 then
								local newhp = timer
								if SobGroup_IsDoingAbility("splitbattlecruisers"..i, AB_Attack) == 1 then
									newhp = timer-0.02*Temp_GlobalVariable.Selected_NextInterval
								end
								if newhp < 0 then 
									newhp = 0
								end
					    	SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "hgn_orders_reload", newhp)
					    	SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_BigGun", 0)
					    	SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_BigGunReload", 1)
						  else
					   		SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_BigGun", 1)
					    	SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_BigGunReload", 0)
					    	--ai
					    	if CPU_Exist_Smart(SobGroup_OwnedBy("splitbattlecruisers"..i)) == 1 then
					    		if SobGroup_IsDoingAbility("splitbattlecruisers"..i, AB_Attack) == 1 and Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "resource4") == 1 then
					    			if Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) < 500 then
					    				if SobGroup_CanDoAbility("splitbattlecruisers"..i, AB_Builder) == 1 then
												if SobGroup_UnderAttack("splitbattlecruisers"..i) == 1 then
													SobGroup_Create("TheMotherOfAllShipsEnemySob"..SobGroup_OwnedBy("splitbattlecruisers"..i))
													SobGroup_Clear("TheMotherOfAllShipsEnemySob"..SobGroup_OwnedBy("splitbattlecruisers"..i))
													SobGroup_GetAttackers("splitbattlecruisers"..i, "TheMotherOfAllShipsEnemySob"..SobGroup_OwnedBy("splitbattlecruisers"..i))
													if SobGroup_AreAnyOfTheseTypes("TheMotherOfAllShipsEnemySob"..SobGroup_OwnedBy("splitbattlecruisers"..i), "Vgr_ArtilleryBattlecruiser, kpr_sajuuk")==1 and
													random_pseudo(1,1000)<40 then
														SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_orders_reload")
													end
												elseif random_pseudo(1,1000)<4 then
					    						SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_orders_reload")
					    					end
					    				end
					    			end
					    		elseif SobGroup_IsDoingAbility("splitbattlecruisers"..i, AB_Attack) == 1 and Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) >= 95000 then
					    			if random_pseudo(1,1000)<40 then
					    				SobGroup_CreateSubSystem("splitbattlecruisers"..i, "hgn_orders_reload")
					    				Player_SetRU(SobGroup_OwnedBy("splitbattlecruisers"..i), Player_GetRU(SobGroup_OwnedBy("splitbattlecruisers"..i)) - 45000)
					    			end
					    		end
					    	end
					   	end
				    end
				 	end
					
		--sajuuk phase armour
					if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kpr_sajuuk") == 1 then
						local currenthealth = SobGroup_HealthPercentage("splitbattlecruisers"..i)
						local lasthealth = SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "lasthealth")
						if lasthealth > 1 then
							lasthealth = 1
						end
						if currenthealth > 1 then
							currenthealth = 1
						end
						if currenthealth > 0 then
							if SobGroup_IsDoingAbility("splitbattlecruisers"..i, AB_DefenseField) == 1 then
								SobGroup_SetHealth("splitbattlecruisers"..i, lasthealth)
								SobGroup_SetInvulnerabilityOfHardPoint("splitbattlecruisers"..i, "Engine", 1)
								if currenthealth > lasthealth then
									SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "lasthealth", currenthealth)
								end
							else
								SobGroup_SetInvulnerabilityOfHardPoint("splitbattlecruisers"..i, "Engine", 0)
								SobGroup_SetHardPointHealth("splitbattlecruisers"..i, "lasthealth", currenthealth)
							end
	
						end
					end
					
		--avatar explosion damage funcion
					if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kad_destroyer") == 1 and SobGroup_HealthPercentage("splitbattlecruisers"..i) <= 0 then
						for z=0, nbc-1, 1 do
							if SobGroup_HealthPercentage("splitbattlecruisers"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..z, "kad_destroyer") == 1 then   
								if z==i then
									SobGroup_EvacuateShipsAroundExplodingShip("splitbattlecruisers"..i, 8000)		--Evacuate nearby ships to avoid explosion damage
								end
								SobGroup_Create("AvatarExpBag"..z)          
					      SobGroup_SobGroupAdd("AvatarExpBag"..z, "splitbattlecruisers"..z)      
					      SobGroup_Clear("splitbattlecruisers"..z)    
						  	ExpBag.AvatarIndex = z
						    Rule_AddInterval("Avatarexplosiondamageexp", 14-Temp_GlobalVariable.Selected_NextInterval-0.1)
					    end
						end
					end
					
			--Switch phase cannon power for dreadnaughtB
					if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_dreadnaughtB") == 1 then
						if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Shield") <= 0 then
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton1", 0)
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton2", 0)
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton3", 0)
						elseif SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Shield") <= 0.15 then
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton"..random_pseudo(1,2), 1)
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton"..random_pseudo(1,3), 0)
						else
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton1", 1)
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton2", 1)
							SobGroup_ChangePower("splitbattlecruisers"..i, "Weapon_triton3", 1)
						end
					end
			                                          
			    if SobGroup_Selected_Smart("splitbattlecruisers"..i) == 1 then	
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitbattlecruisers"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitbattlecruisers"..i))));
			      ---race for taskbar	    
			      RaceDisplayInInterface(SobGroup_OwnedBy("splitbattlecruisers"..i))
	
			      exp1 = SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") * 10000			 		  		  		   	   	        
					  if exp1 > 999 then
					  	exp1 = 999
					  end
				    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1));			    
				    eff = -(floor((1 - SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "efficency")) * 10)) 		 		  		  		  	        
					  if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);	   		         		  
					  end			
	          en = SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));							
					  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);  
					  Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
					  if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser") == 1 then		    			    	  
				    	UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
				    	UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);  	
				    	UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				    	UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);  		
				    	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "ImprovedTorpedoBattlecruiser") == 1 then
				    	  UI_SetElementVisible("NewTaskbar", "abilities1", 1)
				    	  UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);				      
					      UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");
					    end
					  elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser_hero") == 1 then		   			    	  
				    	UI_SetElementSize("NewTaskbar", "subsystems", 96, 24); 
				    	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "ImprovedNukeCannonBattlecruiser") == 1 then
				    	  UI_SetElementVisible("NewTaskbar", "abilities", 1)
					      UI_SetElementVisible("NewTaskbar", "torpedo", 1)
						    UI_SetTextLabelText("NewTaskbar", "torpedotext", "MIRV");
						    if SobGroup_OwnedBy("splitbattlecruisers"..i) == playerIndex then
									Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
	              end
					    end
					  elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_heavycruiser") == 1 then
				      UI_SetElementVisible("NewTaskbar", "abilities1", 1)
				      UI_SetElementSize("NewTaskbar", "mechanic", 66, 15)
				      if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "mechanictext", ""..SobGroup_Count("repairingpatcher" .. tostring("splitbattlecruisers"..i))); 	
						  end
				    	UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
				    	UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);  	
				    	UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
				    	UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);
					  elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_sinner") == 1 then
				    	--UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);
				    	if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "ImprovedSinnerArmour1") == 1 then
				    		local threshold = 0.99
				    		if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "ImprovedSinnerArmour2") == 1 then
				    			threshold = 0.97
				    		end
				    		if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "ImprovedSinnerArmour3") == 1 then
				    			threshold = 0.95
				    		end
				    		if SobGroup_HealthPercentage("splitbattlecruisers"..i) >= threshold then
					    	  UI_SetElementVisible("NewTaskbar", "abilities1", 1)
					    	  UI_SetElementSize("NewTaskbar", "entrenchment", 66, 15);
						      UI_SetTextLabelText("NewTaskbar", "entrenchmenttext", "Block");
						    end
					    end
					  elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_alkhalid") == 1 then  
					    if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "ImprovedTorpedoBattleship") == 1 then
					      UI_SetElementVisible("NewTaskbar", "abilities1", 1)
					      UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);				      
					      UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");
					    end	    
					    if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "MineBattleship") == 1 then
					      UI_SetElementVisible("NewTaskbar", "abilities1", 1)
					      UI_SetElementSize("NewTaskbar", "monster", 66, 15);	
					      UI_SetTextLabelText("NewTaskbar", "monstertext", "Mine");
					    end	
					    if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "FreackerBattleship") == 1 then
					      UI_SetElementVisible("NewTaskbar", "abilities1", 1)
					      UI_SetElementSize("NewTaskbar", "freacker", 66, 15);	
					      UI_SetTextLabelText("NewTaskbar", "bombtext", "Per. Bomb");
								if SobGroup_OwnedBy("splitbattlecruisers"..i) == playerIndex then
									--Temp_GlobalVariable.enablebtnperforate[playerIndexList] = Temp_GlobalVariable.Selected_Save																					 
								end
					    end	    	    				
				    elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battleship") == 1 then
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes Rear") > 0 then
					      Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save					      
					    end			       	
				    elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_tanker") == 1 then
				      UI_SetElementVisible("NewTaskbar", "patcherframe", 1)	 
				      if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "patcher", ""..SobGroup_Count("repairingpatcher" .. tostring("splitbattlecruisers"..i))); 	
						  end	
						  if (SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "w1") > 0 or SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "w2") > 0) and (SobGroup_OwnedBy("splitbattlecruisers"..i) == playerIndex) then  
					      Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save					  
					    end		 
				    	UI_SetElementSize("NewTaskbar", "subsystems", 210, 48); 			
				    	if SobGroup_Count("temp2") == 1 then  
				    	  UI_SetElementVisible("NewTaskbar", "LJ1", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2D", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3D", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4D", 1) 
				    	elseif SobGroup_Count("temp2") == 2 then
				    	  UI_SetElementVisible("NewTaskbar", "LJ1", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3D", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4D", 1) 
				    	elseif SobGroup_Count("temp2") == 3 then
				    	  UI_SetElementVisible("NewTaskbar", "LJ1", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4D", 1) 
				    	elseif SobGroup_Count("temp2") == 4 then
				    	  UI_SetElementVisible("NewTaskbar", "LJ1", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4", 1) 
				    	else
				    	  UI_SetElementVisible("NewTaskbar", "LJ1D", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2D", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3D", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4D", 1) 
				    	end			
				    elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_vortex") == 1 then		
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 1") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "la", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "la", 0) 	
				      end  
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 1b") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "sa", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "sa", 0) 	
				      end    	
				      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Kinetic 1c") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "ha", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "ha", 0) 	
				      end
				      if SobGroup_OwnedBy("splitbattlecruisers"..i) == playerIndex then
				      	Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
				      end
						elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_artillerybattlecruiser") == 1 then
							UI_SetElementSize("NewTaskbar", "subsystems", 32, 24); 
							UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)    	      
							UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", ""..360000); 
							UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", ""..3600);     
							if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "hgn_orders_reload") > 0 then
								UI_SetElementSize("NewTaskbar", "juggernaughtsolarcharge", 66, 15);					      
								UI_SetTextLabelText("NewTaskbar", "juggernaughtsolarchargetext", "Energized");
							end
						elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kpr_sajuuk") == 1 then
							UI_SetElementSize("NewTaskbar", "subsystems", 32, 24); 
							UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)    	      
							UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", ""..360000); 
							UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", ""..3600);   
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_dreadnaught") == 1 then    
			        --UI_SetElementSize("NewTaskbar", "subsystems", 210, 24); 	         	--0, 0	   
				      UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);  	
				      UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
							UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_dreadnaughtB") == 1 then    
			        --UI_SetElementSize("NewTaskbar", "subsystems", 210, 24); 	         	--0, 0	   
				      --UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);  	
				      UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
							UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_missilebattlecruiser") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 160, 24);
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kad_destroyer") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 210, 48); 
			        UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
			        --display perks
				      PerksDeisplayInTaskBar("splitbattlecruisers"..i)
							if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "TF_Battlecruiser") == 1 then
								UI_SetElementVisible("NewTaskbar", "abilities1", 1)
								UI_SetElementSize("NewTaskbar", "fusionprogenitor", 66, 15);					      
								UI_SetTextLabelText("NewTaskbar", "fusionprogenitortext", "Sajuuk");
							end
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_cruiser") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 128, 24); 
			        if Player_HasResearch(SobGroup_OwnedBy("splitbattlecruisers"..i), "TerminalSensitiveProjectileEnforcer") == 1 then
								UI_SetElementVisible("NewTaskbar", "abilities1", 1)
								UI_SetElementSize("NewTaskbar", "fusionenforcer", 66, 15);					      
								UI_SetTextLabelText("NewTaskbar", "fusionenforcertext", "WMD");
							end
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_cruiser_queen, rad_qwaarjetii") == 1 then
			        UI_SetElementSize("NewTaskbar", "subsystems", 32, 24); 
		        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_merc_battlecruiser") == 1 then
		          UI_DisplaySubsystems(1)
		          --Mercenary Upgrades
		        	Rad_DisplayMercUpgradesInTaskBar("splitbattlecruisers"..i)
		        elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_scud") == 1 then    
			        UI_DisplaySubsystems(1)
			        --Display Warheads
			        local warhead = 0
			        for y=1,7,1 do
			        	if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "scud_"..y) > 0 then
			        		warhead = y
			        	end
			        end
			        if warhead ~= 0 then
				        for y=1,7,1 do
				        	if y == warhead then
					      		UI_SetElementVisible("NewTaskbar", "scud_"..y, 1)
					      	else
					        	UI_SetElementVisible("NewTaskbar", "scud_"..y, 0)
					        end
					      end
					    end
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_vanaarjet") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 64, 24); 
						elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "rad_armsdealer") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 210, 48); 
			        UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);  	
				      UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
							UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
					  elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kpr_dreadnaught") == 1 then    
			        UI_DisplaySubsystems(2)
			        UI_SetElementVisible("NewTaskbar", "PowerGeneratorFrame", 1)
			        local docked_gen = SobGroup_CountDockedShips("splitbattlecruisers"..i)
			        if docked_gen > 2 then
			        	docked_gen = 2
			        end
						  UI_SetTextLabelText("NewTaskbar", "DockedPowerGenerators", ""..docked_gen)
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "kpr_reaver") == 1 then    
			        UI_DisplaySubsystems(0)	--1 removed engine because it caused crash
			        UI_SetElementVisible("NewTaskbar", "PowerGeneratorFrame", 1)
			        local docked_gen = SobGroup_CountDockedShips("splitbattlecruisers"..i)
			        if docked_gen > 2 then
			        	docked_gen = 2
			        end
						  UI_SetTextLabelText("NewTaskbar", "DockedPowerGenerators", ""..docked_gen)
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "HWAT_UNH_CAStandard, HWAT_VAY_CABattle, HWAT_FRN_CAHeavy") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 0, 0); 
			      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_dreadnaught") == 1 then    
			        UI_SetElementSize("NewTaskbar", "subsystems", 0, 0); 
				    end				     	    	
		        --break         
		      end  
		      SobGroup_Clear("temp")
				  SobGroup_Clear("temp1")		
				  SobGroup_Clear("temp2")	
		    end 	    	          
		  end       	    
		end
	end
	
	if Temp_GlobalVariable.Selected_Save == 5 then
	---Shipyard	
	  if nsy > 0 then		
			for i = 0,nsy-1,1 do       
			  if SobGroup_Empty("splitshipyards"..i) == 0 then			  		
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none)
	        if hwsaving == 5 then         
	          energyConsume("splitshipyards"..i,1,2)	
	          if SobGroup_GetHardPointHealth("splitshipyards"..i, "pg") > 0 then
	            FX_StartEvent_Smart("splitshipyards"..i, "EnergyLow")
	          else              
	          end	            
	        elseif hwsaving == 6 and SobGroup_Empty("star_sol") == 0 then
	          sundamageinterface = SobGroup_TakeDamageSol("splitshipyards"..i,0.6,Temp_GlobalVariable.Selected_NextInterval)				
		      end    
					if SobGroup_InWorldBoundForKillingOnly("splitshipyards"..i, 0) == 0 then 
		        SobGroup_SetHealth("splitshipyards"..i, 0)
		      end	
			    if SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard_g") == 1 then		  
			      
			      SetAfterburnerForShip("splitshipyards"..i, 22200, "CapitalAfterburner", "AfterBurn", 1)
			      
			      --Orders
			      orders("splitshipyards"..i, "clear",0,0)   
	        	orders("splitshipyards"..i, "parade",0,0)
	        	orders("splitshipyards"..i, "dock",0,0)	
	        	orders("splitshipyards"..i, "evacuation",40,3)        	           
			      orders("splitshipyards"..i, "guard",0,0) 		      
			      orders("splitshipyards"..i, "gujkingdisable",0,0)
			      orders("splitshipyards"..i, "gujkingenable",0,0)		      
	        	
	--weapons set
	          if SobGroup_GetHardPointHealth("splitshipyards"..i, "bs2") == 0 then          
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "bs1") > 0 then			      			          
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs2")  
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs3")  
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs4")   			
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs5")  
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs6")   	
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs7")   	
			          SobGroup_CreateSubSystem("splitshipyards"..i, "bs8")   			                          
			        end  	                            
			      end	            	
	        		    
			      SobGroup_GetSobGroupDockedWithGroup("splitshipyards"..i, "temp")		      
				    if SobGroup_AreAnyOfTheseTypes("temp", "hgn_mothership") == 1 then
		--collateral damage			    
				      if mscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] > 0 then
				        SobGroup_TakeDamage("splitshipyards"..i, 0.00190*Temp_GlobalVariable.Selected_NextInterval)
				        mscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] = 0
				      end			    
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "msdocker")
				      end				      
				      SobGroup_AbilityActivate("splitshipyards"..i, AB_Parade, 0)			      
				      if SobGroup_IsBuilding("splitshipyards"..i, "canbuildpoh2") == 1 then
					      FX_StartEvent("hgn_mothership"..SobGroup_OwnedBy("splitshipyards"..i), "Upgrading")
					    end
				    else
				      SobGroup_SetHardPointHealth("splitshipyards"..i, "msdocker", 0)			      
				      SobGroup_AbilityActivate("splitshipyards"..i, AB_Parade, 1)			      		      
				    end   
				    if SobGroup_AreAnyOfTheseTypes("temp", "hgn_researchstation") == 1 and SobGroup_Count("hgn_researchstation"..SobGroup_OwnedBy("splitshipyards"..i)) > 0 then
		--collateral damage			    
				      if rscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] > 0 then
				        SobGroup_TakeDamage("splitshipyards"..i, 0.00140*Temp_GlobalVariable.Selected_NextInterval)
				        rscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] = 0
				      end			    
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "rsdocker")
				      end				      
				    else
				      SobGroup_SetHardPointHealth("splitshipyards"..i, "rsdocker", 0)   				      
				    end		
				    if SobGroup_AreAnyOfTheseTypes("temp", "hgn_power") == 1 and SobGroup_Count("hgn_power"..SobGroup_OwnedBy("splitshipyards"..i)) > 0 then
		--collateral damage			    
				      if pscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] > 0 then
				        SobGroup_TakeDamage("splitshipyards"..i, 0.00140*Temp_GlobalVariable.Selected_NextInterval)
				        pscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] = 0
				      end			    
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "psdocker")
				      end				      
				    else
				      SobGroup_SetHardPointHealth("splitshipyards"..i, "psdocker", 0)   				      
				    end
				    if SobGroup_AreAnyOfTheseTypes("temp", "hgn_combatbase") == 1 and SobGroup_Count("hgn_combatbase"..SobGroup_OwnedBy("splitshipyards"..i)) > 0 then
		--collateral damage			    
				      if wscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] > 0 then
				        SobGroup_TakeDamage("splitshipyards"..i, 0.00140*Temp_GlobalVariable.Selected_NextInterval)
				        wscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] = 0
				      end			    
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "wsdocker")
				      end				      
				    else
				      SobGroup_SetHardPointHealth("splitshipyards"..i, "wsdocker", 0)   				      
				    end												    
				    if SobGroup_AreAnyOfTheseTypes("temp", "hgn_crewstation") == 1 and SobGroup_Count("hgn_crewstation"..SobGroup_OwnedBy("splitshipyards"..i)) > 0 then
		--collateral damage			    
				      if cscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] > 0 then
				        SobGroup_TakeDamage("splitshipyards"..i, 0.00140*Temp_GlobalVariable.Selected_NextInterval)
				        cscollateraldamage[SobGroup_OwnedBy("splitshipyards"..i)+1] = 0
				      end			    
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "csdocker")
				      end				      
				    else
				      SobGroup_SetHardPointHealth("splitshipyards"..i, "csdocker", 0)   				      
				    end    			    
				    SobGroup_Clear("temp")			    
				    if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitshipyards"..i), "hgn_mothership") == 0 then 
				      SobGroup_SetHardPointHealth("splitshipyards"..i, "canbuildpoh2", 0)
				    elseif ((Player_CanResearch(SobGroup_OwnedBy("splitshipyards"..i), "canbuildpoh2" ) == 1 or SobGroup_GetHardPointHealth("hgn_mothership"..SobGroup_OwnedBy("splitshipyards"..i), "poh2") > 0) and SobGroup_GetHardPointHealth("splitshipyards"..i, "canbuildpoh2") == 0) then
				      SobGroup_CreateSubSystem("splitshipyards"..i, "canbuildpoh2")			      
				    end		
	---ping gyking formation	
	          local gname = i+1  
	          if SobGroup_OwnedBy("splitshipyards"..i) == Universe_CurrentPlayer() then	 
		          g = Ping_AddSobGroup("Strategic Shipyard "..gname, "name1", "splitshipyards"..i)	   
						  Ping_LabelVisible(g, 1)					  		    			    
					    if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
							   SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
							   SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
							   SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
							   SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then						  	
						    Ping_AddDescription(g, 0, "Strategic Formation") 			
							else					  
						    Ping_AddDescription(g, 0, " ") 					    										  
						  end				
						end  
	---special attack e ping			    		    	    
				    if SobGroup_GetHardPointHealth("splitshipyards"..i, "bc") > 0 then
				      if SobGroup_OwnedBy("splitshipyards"..i) == Universe_CurrentPlayer() then
					      g = Ping_AddSobGroup("Strategic Shipyard (Heavy Ion Cannon) "..gname, "name1", "splitshipyards"..i)	   
						    Ping_LabelVisible(g, 1)	
						  end  		    
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then
						    SobGroup_AbilityActivate("splitshipyards"..i, AB_SpecialAttack, 1)	
						    SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 1)
						    if SobGroup_OwnedBy("splitshipyards"..i) == Universe_CurrentPlayer() then
						      Ping_AddDescription(g, 0, "Strategic Formation")	
						    end  		 		    			    	    						  
						  else
							  SobGroup_AbilityActivate("splitshipyards"..i, AB_SpecialAttack, 0) 
							  SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 0)
							  if SobGroup_OwnedBy("splitshipyards"..i) == Universe_CurrentPlayer() then		
							    Ping_AddDescription(g, 0, " ")
							  end  
							end  								  
					  end	
	---emp plasma cannon			    		    	    
				    if SobGroup_GetHardPointHealth("splitshipyards"..i, "gcb") > 0 then			          
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then					    
						    SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 1)					    		 		    			    	    						  
						  else						  
							  SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 0)							  
							end  								  
					  end	
	---pulser 1			    		    	    
				    if SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser") > 0 then			          
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then					    
						    SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 1)					    		 		    			    	    						  
						  else						  
							  SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 0)							  
							end  								  
					  end					
	---pulser 2			    		    	    
				    --if SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser1") > 0 then			          
				      --if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
						     --SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
						     --SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
						     --SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
						     --SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then					    
						    --SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 1)					    		 		    			    	    						  
						  --else						  
							  --SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 0)							  
							--end  								  
					  --end				
	---pulser 3			    		    	    
				    if SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser2") > 0 then			          
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then					    
						    SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 1)					    		 		    			    	    						  
						  else						  
							  SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 0)							  
							end  								  
					  end			
	---autogun set			    		    	    
				    if SobGroup_GetHardPointHealth("splitshipyards"..i, "bs1") > 0 then			          
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
						     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then					    
						    SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 1)					    		 		    			    	    						  
						  else						  
							  SobGroup_AbilityActivate("splitshipyards"..i, AB_Targeting, 0)							  
							end  								  
					  end
		--costruisca produzione cap alternate se sy ha prod capital, serve per ricerca/costruzione di bc e vortex (req. adv. cap ship facility)
					  if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then 
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "hgn_advcapshipproduction")
				      end	
			      else
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "advcapshipproduction", 0)   	
				      end	
			      end   			
			--caso in cui si lancia una o pi?navi
			      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
					     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
					     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
					     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
					     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then				       		    
						else
						  if SobGroup_GetHardPointHealth("splitshipyards"..i, "boost3") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "boost3", 0)   	
				      elseif SobGroup_GetHardPointHealth("splitshipyards"..i, "boost2") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "boost2", 0)   	
				      elseif SobGroup_GetHardPointHealth("splitshipyards"..i, "boost1") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "boost1", 0)   
				      elseif SobGroup_GetHardPointHealth("splitshipyards"..i, "hgn_orders_solarshield") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "hgn_orders_solarshield", 0)  
				      elseif SobGroup_GetHardPointHealth("splitshipyards"..i, "hgn_orders_remotespaceshield") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "hgn_orders_remotespaceshield", 0)   		 			
				      end	   		  				    										
				    end					    	    
			    elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard") == 1 then		  		      
			      --Orders		      
	        	orders("splitshipyards"..i, "parade",0,0)
	        	orders("splitshipyards"..i, "dock",0,0)	
	        	orders("splitshipyards"..i, "evacuation",40,3)        	           
			      orders("splitshipyards"..i, "guard",0,0)
			      orders("splitshipyards"..i, "clear",0,0)
	---ping
	          local gname = i+1  
	          if SobGroup_OwnedBy("splitshipyards"..i) == Universe_CurrentPlayer() then	 
		          g = Ping_AddSobGroup("Basic Shipyard "..gname, "name1", "splitshipyards"..i)	   
						  Ping_LabelVisible(g, 1)					  		    			    
					    Ping_AddDescription(g, 0, " ") 				  			
						end  
	--costruisca produzione cap alternate se sy ha prod capital, serve per ricerca/costruzione di bc e vortex (req. adv. cap ship facility)
					  if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then 
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "hgn_advcapshipproduction")
				      end	
			      else
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "advcapshipproduction", 0)   	
				      end	
			      end
			    elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard_elohim") == 1 then
			      --Orders
	        	orders("splitshipyards"..i, "parade",0,0)
	        	orders("splitshipyards"..i, "dock",0,0)	
			      orders("splitshipyards"..i, "guard",0,0)
			      orders("splitshipyards"..i, "clear",0,0)
	---ping
		        g = Ping_AddSobGroup("Captain Elohim", "name1", "splitshipyards"..i)	   
						Ping_LabelVisible(g, 1)					  		    			    
					  Ping_AddDescription(g, 0, " ")
	--costruisca produzione cap alternate se sy ha prod capital, serve per ricerca/costruzione di bc e vortex (req. adv. cap ship facility)
					  if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then 
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "hgn_advcapshipproduction")
				      end	
			      else
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "advcapshipproduction", 0)   	
				      end	
			      end
	        elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_battleshipyard") == 1 then		  		      
			      --Orders		      
	        	orders("splitshipyards"..i, "parade",0,0)
	        	orders("splitshipyards"..i, "dock",0,0)	
	        	orders("splitshipyards"..i, "evacuation",40,3)        	           
			      orders("splitshipyards"..i, "guard",0,0)
			      orders("splitshipyards"..i, "clear",0,0)
	
	--costruisca produzione cap alternate se sy ha prod capital, serve per ricerca/costruzione di bc e vortex (req. adv. cap ship facility)
					  if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then 
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "hgn_advcapshipproduction")
				      end	
			      else
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "advcapshipproduction", 0)   	
				      end	
			      end  
	--viper for AI              	      
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitshipyards"..i), "isai" ) == 1) and
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitshipyards"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitshipyards"..i), "splitshipyards"..i, 12500) == 1) and
							 (SobGroup_IsDoingAbility("splitshipyards"..i, abilityList[2]) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitshipyards"..i), "hgn_viper_short") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitshipyards"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitshipyards"..i, "hgn_viper_short")
							SobGroup_CreateShip("splitshipyards"..i, "hgn_viper_short1")
		      	  Player_SetRU(SobGroup_OwnedBy("splitshipyards"..i), Player_GetRU(SobGroup_OwnedBy("splitshipyards"..i)) - 1500)
		      	end   		       
			    --vgr_shipyard	
			    elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "vgr_shipyard") == 1 then
						--Orders		      
	        	orders("splitshipyards"..i, "parade",0,0)  
	        	orders("splitshipyards"..i, "clear",0,0)					
	          orders("splitshipyards"..i, "dock",0,0)      	           
			      orders("splitshipyards"..i, "guard",0,0)
	--Shield Glow
						if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_l") > 0 then
							local health = SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_l")
							if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_l") > 1 then
								SobGroup_SetHardPointHealth("splitshipyards"..i, "shield_l", 1)
								health = 1
							end
							if health < SobGroup_GetHardPointHealth("splitshipyards"..i, "lasthealth_l") then
								FX_StartEvent("splitshipyards"..i, "phase_l")
							end
							SobGroup_SetHardPointHealth("splitshipyards"..i, "lasthealth_l", health)
						end
						if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_r") > 0 then
							local health = SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_r")
							if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_r") > 1 then
								SobGroup_SetHardPointHealth("splitshipyards"..i, "shield_r", 1)
								health = 1
							end
							if health < SobGroup_GetHardPointHealth("splitshipyards"..i, "lasthealth_r") then
								FX_StartEvent("splitshipyards"..i, "phase_r")
							end
							SobGroup_SetHardPointHealth("splitshipyards"..i, "lasthealth_r", health)
						end
	--costruisca produzione cap alternate se sy ha prod capital, serve per ricerca/costruzione di bc e vortex (req. adv. cap ship facility)
					  if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then 
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") == 0 then
				      	SobGroup_CreateSubSystem("splitshipyards"..i, "vgr_advcapshipproduction")
				      end	
			      else
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "advcapshipproduction") > 0 then
				      	SobGroup_SetHardPointHealth("splitshipyards"..i, "advcapshipproduction", 0)   	
				      end	
			      end
			    elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "kpr_shipyard_old") == 1 then
						--Orders		      
	        	orders("splitshipyards"..i, "parade",0,0)
			      orders("splitshipyards"..i, "guard",0,0)
			      KprSpecialAbilityExecute("splitshipyards"..i)
			    end
			    
			    if SobGroup_Selected_Smart("splitshipyards"..i) == 1 then	  		      
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitshipyards"..i)
			      ---race for taskbar		      
			      RaceDisplayInInterface(SobGroup_OwnedBy("splitshipyards"..i))
			      
	          UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitshipyards"..i))));           
				    exp1 = SobGroup_GetHardPointHealth("splitshipyards"..i, "experience") * 10000			 		  		  		   	   	        
					  if exp1 > 999 then
					  	exp1 = 999
					  end
					  UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1));					  	
					  eff = -(floor((1 - SobGroup_GetHardPointHealth("splitshipyards"..i, "efficency")) * 10)) 		 		  		  		  	        
					  if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);	   	  
					  end			
	          en = SobGroup_GetHardPointHealth("splitshipyards"..i, "en")	     
						UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));						
					  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);  
					  if SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard_g") == 1 then
					    UI_SetElementVisible("NewTaskbar", "patcherframe", 1)	 
					    if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitshipyards"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "patcher", ""..SobGroup_Count("repairingpatcher" .. tostring("splitshipyards"..i)));
						  end
					    if SobGroup_GetHardPointHealth("splitshipyards"..i, "evacuation") == 0 and SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") == 0 then	          
			          Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
			        end	        
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 then 
					    	UI_SetElementVisible("NewTaskbar", "LMS", 1) 					    		     			    
					  	else     				    	
					    	UI_SetElementVisible("NewTaskbar", "LMSD", 1) 	
					  	end  			      
			        if SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then 
					    	UI_SetElementVisible("NewTaskbar", "LRS", 1) 					    				     			    
					  	else     				    	
					    	UI_SetElementVisible("NewTaskbar", "LRSD", 1) 			
					  	end 
					  	if SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 then 
					    	UI_SetElementVisible("NewTaskbar", "LPS", 1) 					    				     			    
					  	else     				    	
					    	UI_SetElementVisible("NewTaskbar", "LPSD", 1) 			
					  	end  
					  	if SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 then 
					    	UI_SetElementVisible("NewTaskbar", "LWS", 1) 					    				     			    
					  	else     				    	
					    	UI_SetElementVisible("NewTaskbar", "LWSD", 1) 			
					  	end  	 		 	
					  	if SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 then 
					    	UI_SetElementVisible("NewTaskbar", "LCS", 1)				    				     			    
					  	else     				    	
					    	UI_SetElementVisible("NewTaskbar", "LCSD", 1)	
					  	end   						
							if SobGroup_GetHardPointHealth("splitshipyards"..i, "bc") > 0 then
					      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then
							    UI_SetElementVisible("NewTaskbar", "BC", 1) 						    
							    if SobGroup_OwnedBy("splitshipyards"..i) == playerIndex then
							      Temp_GlobalVariable.enablebtnheavyioncannon[playerIndexList] = Temp_GlobalVariable.Selected_Save
							    end						    
								else
								  UI_SetElementVisible("NewTaskbar", "BC1", 1) 		  				    										
						    end		
						  else
						    UI_SetElementVisible("NewTaskbar", "BCD", 1)  				  
						  end 					  
						  if SobGroup_GetHardPointHealth("splitshipyards"..i, "gcb") > 0 then
					      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then
							    UI_SetElementVisible("NewTaskbar", "GCB", 1) 										    			    
								else
								  UI_SetElementVisible("NewTaskbar", "GCB1", 1) 		  				    										
						    end		
						  else
						    UI_SetElementVisible("NewTaskbar", "GCBD", 1)  				  
						  end 	
						  if SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser") > 0 or SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser2") > 0 then		
						  -- old if SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser") > 0 or SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser1") > 0 or SobGroup_GetHardPointHealth("splitshipyards"..i, "pulser2") > 0 then
					      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then
							    UI_SetElementVisible("NewTaskbar", "P", 1) 										    			    
								else
								  UI_SetElementVisible("NewTaskbar", "P1", 1) 		  				    										
						    end		
						  else
						    UI_SetElementVisible("NewTaskbar", "PD", 1)  				  
						  end 	
						  if SobGroup_GetHardPointHealth("splitshipyards"..i, "bs1") > 0 then					  
					      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then
							    UI_SetElementVisible("NewTaskbar", "BS", 1) 										    			    
								else
								  UI_SetElementVisible("NewTaskbar", "BS1", 1) 		  				    										
						    end		
						  else
						    UI_SetElementVisible("NewTaskbar", "BSD", 1)  				  
						  end 								  					  
						  if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield") > 0 then
					      if SobGroup_GetHardPointHealth("splitshipyards"..i, "msdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "csdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "psdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "wsdocker") > 0 and
							     SobGroup_GetHardPointHealth("splitshipyards"..i, "rsdocker") > 0 then
							    UI_SetElementVisible("NewTaskbar", "S", 1)   		    
								else
								  UI_SetElementVisible("NewTaskbar", "S1", 1) 		  				    										
						    end		
						  else
						    UI_SetElementVisible("NewTaskbar", "SD", 1)  				  
						  end 
	          elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard, hgn_battleshipyard, hgn_shipyard_elohim") == 1 then
					    UI_SetElementVisible("NewTaskbar", "patcherframe", 1)	 
					    if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitshipyards"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "patcher", ""..SobGroup_Count("repairingpatcher" .. tostring("splitshipyards"..i)));
						  end
					    Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save		          					  
					  elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "vgr_shipyard") == 1 then
					    UI_SetElementVisible("NewTaskbar", "abilities1", 1)
					    UI_SetElementSize("NewTaskbar", "mechanic", 66, 15)
					    if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_l") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "forcefield_l", 1)
				      else
				        UI_SetElementVisible("NewTaskbar", "forcefield_l", 0)
				      end
				      if SobGroup_GetHardPointHealth("splitshipyards"..i, "shield_r") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "forcefield_r", 1)
				      else
				        UI_SetElementVisible("NewTaskbar", "forcefield_r", 0)
				      end
					    if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitshipyards"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "mechanictext", ""..SobGroup_Count("repairingpatcher" .. tostring("splitshipyards"..i)));
						  end
					  	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
			  			if Player_HasResearch(SobGroup_OwnedBy("splitshipyards"..i), "ImprovedTorpedoShipyard") == 1 then
								UI_SetElementVisible("NewTaskbar", "abilities1", 1)
								UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);					      
								UI_SetTextLabelText("NewTaskbar", "fusiontext", "Fusion");			        
							end
		          if SobGroup_GetHardPointHealth("splitshipyards"..i, "c") > 0 and SobGroup_OwnedBy("splitshipyards"..i) == playerIndex then  
								--Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
							end
						elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "kpr_shipyard_old") == 1 then
			  			UI_SetElementSize("NewTaskbar", "subsystems", 32, 24);
					  else
					  	Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save 	
					  end	  	
		        --break  	         
		      end  
				end  
			end	
		end	
		
	---Command Fortress	
	  if ncf > 0 then		
			for i = 0,ncf-1,1 do   
			  if SobGroup_Empty("splitcommandfortresses"..i) == 0 then 
			  		  
					if SobGroup_InWorldBoundForKillingOnly("splitcommandfortresses"..i, 0) == 0 then 
						SobGroup_SetHealth("splitcommandfortresses"..i, 0)
					end		  		  
			  		  
				  if SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_ark") == 1 then
	--Orders
	          orders("splitcommandfortresses"..i, "clear",0,0)   
	        	orders("splitcommandfortresses"..i, "parade",0,0)	
	        	orders("splitcommandfortresses"..i, "dock",0,0)
	        	orders("splitcommandfortresses"..i, "evacuation",60,6)
	        	orders("splitcommandfortresses"..i, "guard",0,0) 		      
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
		        if hwsaving == 6 then        
		          energyConsume("splitcommandfortresses"..i,1,0)           
		        elseif hwsaving == 7 and SobGroup_Empty("star_sol") == 0 then
							sundamageinterface = SobGroup_TakeDamageSol("splitcommandfortresses"..i,0.4,Temp_GlobalVariable.Selected_NextInterval)				
						end        	
							        	
				  	SobGroup_GetSobGroupDockedWithGroup("splitcommandfortresses"..i, "temp")
				  	SobGroup_FillShipsByType("temp1", "temp", "hgn_juggernaught")  
				  	SobGroup_FillShipsByType("temp2", "temp", "hgn_mothership") 
				  	if SobGroup_Count("temp1") > 0 or SobGroup_Count("temp2") > 0 then
				  	  if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "disablehyperspace") == 0 then
				      	SobGroup_CreateSubSystem("splitcommandfortresses"..i, "disablehyperspace")
				      end	
				    else
				      SobGroup_SetHardPointHealth("splitcommandfortresses"..i, "disablehyperspace", 0)  
				  	end
				  elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_commandfortress") == 1 then	
	--Orders
	        	orders("splitcommandfortresses"..i, "clear",0,0)   
	        	orders("splitcommandfortresses"..i, "dock",0,0)
	        	orders("splitcommandfortresses"..i, "parade",0,0)
	        	orders("splitcommandfortresses"..i, "evacuation",60,6)	
	        	orders("splitcommandfortresses"..i, "guard",0,0)
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
		        if hwsaving == 6 then        
		          energyConsume("splitcommandfortresses"..i,1,2)           
		        elseif hwsaving == 7 and SobGroup_Empty("star_sol") == 0 then
							sundamageinterface = SobGroup_TakeDamageSol("splitcommandfortresses"..i,0.4,Temp_GlobalVariable.Selected_NextInterval)				
						end   				      
	--anti-radiation
			      if Player_HasResearch(SobGroup_OwnedBy("splitcommandfortresses"..i), "CFRadiationDefenseField") == 1 then 	
			        if SobGroup_IsDoingAbility("splitcommandfortresses"..i, AB_DefenseField) == 1 then	       
			          SobGroup_AbilityActivate("splitcommandfortresses"..i, AB_DefenseFieldShield, 1)
			        else
			          SobGroup_AbilityActivate("splitcommandfortresses"..i, AB_DefenseFieldShield, 0)
			        end
			      else
			        SobGroup_AbilityActivate("splitcommandfortresses"..i, AB_DefenseFieldShield, 0)
			      end		 
			    elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_battlestation") == 1 then	
	--Orders        	
	        	orders("splitcommandfortresses"..i, "evacuation",0,0)	
	        	orders("splitcommandfortresses"..i, "guard",0,0) 		
	        	orders("splitcommandfortresses"..i, "clear",0,0)   
	        	orders("splitcommandfortresses"..i, "dock",0,0)      
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
		        if hwsaving == 6 then        
		          energyConsume("splitcommandfortresses"..i,1,1)           
		        elseif hwsaving == 7 and SobGroup_Empty("star_sol") == 0 then
							sundamageinterface = SobGroup_TakeDamageSol("splitcommandfortresses"..i,0.4,Temp_GlobalVariable.Selected_NextInterval)				
						end   
		        SobGroup_AbilityActivate("splitcommandfortresses"..i, AB_Lights, 1)		  
					elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "rad_blackmarket") == 1 then	
	--Orders        	
	        	orders("splitcommandfortresses"..i, "guard",0,0)	
	        	orders("splitcommandfortresses"..i, "parade",0,0)
	        	orders("splitcommandfortresses"..i, "dock",0,0)
	        	orders("splitcommandfortresses"..i, "clear",0,0)
	        	ExcuteExperienceSubsystemsWithFullRange("splitcommandfortresses"..i)
	        	RadExperienceAbilityExecute("splitcommandfortresses"..i)
						if hwsaving == 6 then        
		          energyConsume("splitcommandfortresses"..i,1,1)           
		        elseif hwsaving == 7 and SobGroup_Empty("star_sol") == 0 then
							sundamageinterface = SobGroup_TakeDamageSol("splitcommandfortresses"..i,0.4,Temp_GlobalVariable.Selected_NextInterval)				
						end
				  elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "vgr_commandfortress") == 1 then					
					--Orders		      
	        	orders("splitcommandfortresses"..i, "parade",0,0)        	           
			      orders("splitcommandfortresses"..i, "guard",0,0) 
			      orders("splitcommandfortresses"..i, "clear",0,0)		
			      orders("splitcommandfortresses"..i, "dock",0,0)	
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
		        if hwsaving == 6 then        
		          energyConsume("splitcommandfortresses"..i,1,2)           
		        elseif hwsaving == 7 and SobGroup_Empty("star_sol") == 0 then
							sundamageinterface = SobGroup_TakeDamageSol("splitcommandfortresses"..i,0.4,Temp_GlobalVariable.Selected_NextInterval)				
						end					
	--cruise missile for AI
						if ((CPU_Exist_Smart(SobGroup_OwnedBy("splitcommandfortresses"..i)) == 1) and
						   (SobGroup_IsDoingAbility("splitcommandfortresses"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitcommandfortresses"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitcommandfortresses"..i), "splitcommandfortresses"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcommandfortresses"..i), "vgr_cruse1") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitcommandfortresses"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitcommandfortresses"..i, "vgr_cruse1")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitcommandfortresses"..i), Player_GetRU(SobGroup_OwnedBy("splitcommandfortresses"..i)) - 750)
		      	end
					end				
				  if SobGroup_Selected_Smart("splitcommandfortresses"..i) == 1 then	
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitcommandfortresses"..i)
				    UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitcommandfortresses"..i))));
				    ---race for taskbar	    
				    RaceDisplayInInterface(SobGroup_OwnedBy("splitcommandfortresses"..i))
	              
				    exp1 = SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "experience") * 10000			 		  		  		   	   	        
					  if exp1 > 999 then
					  	exp1 = 999
					  end
					  UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1));					  	  
					  eff = -(floor((1 - SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "efficency")) * 10)) 
					  if eff <= -1 then		 		  		  		  	        
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);	   	  
					  end				
	          en = SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));							
					  if SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_commandfortress") == 1 then 			 
						  UI_SetElementVisible("NewTaskbar", "patcherframe", 1)	 
						  if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "patcher", ""..SobGroup_Count("repairingpatcher" .. tostring("splitcommandfortresses"..i)));
						  end
						  UI_SetElementVisible("NewTaskbar", "droneframe", 1)	 
						  if Universe_GameTime() > 51 then
						  	UI_SetTextLabelText("NewTaskbar", "drone", ""..SobGroup_Count("drone" .. tostring("splitcommandfortresses"..i)));
						  end
						  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);			   
						  --UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
						  --UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);    
						  if (SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 37") > 0 or SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 38") > 0 or SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 39") > 0) and SobGroup_OwnedBy("splitcommandfortresses"..i) == playerIndex then  
					      Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save					  
					    end	
					  elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "vgr_commandfortress") == 1 then
						  UI_SetElementVisible("NewTaskbar", "abilities1", 1)
						  UI_SetElementSize("NewTaskbar", "mechanic", 66, 15)
						  if Universe_GameTime() > 51 and SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "experience") < 0.5 then
						  	UI_SetTextLabelText("NewTaskbar", "mechanictext", ""..SobGroup_Count("repairingpatcher" .. tostring("splitcommandfortresses"..i)));
						  end
						  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
						  UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
					  elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_battlestation") == 1 then 			 
						  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);		--210, 24
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
						  MaxCivCap = 2000    
					    if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb1") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb2") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb3") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb4") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb5") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end	
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb6") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end
			        orbitalstationPop = floor(SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")*100000)
					    if orbitalstationPop > MaxCivCap then
					      orbitalstationPop = MaxCivCap
					    end						
						  UI_SetElementVisible("NewTaskbar", "OSframe", 1)						  
						  UI_SetTextLabelText("NewTaskbar", "oscivilian", ""..orbitalstationPop.."/"..MaxCivCap);					  			  
					  elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "rad_blackmarket") == 1 then 			 
						  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
						  UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);
						  UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);
						  UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0);
						  UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0);
					  	UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);
					  	if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "bm_clustermissile", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "bm_clustermissile", 0) 	
				      end
				      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1a") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "bm_scudmissile", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "bm_scudmissile", 0) 	
				      end
				      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1b") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "bm_discomissile", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "bm_discomissile", 0) 	
				      end
				      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "p1c") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "bm_kickassmissile", 1) 	
				      else
				        UI_SetElementVisible("NewTaskbar", "bm_kickassmissile", 0) 	
				      end
				      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1") > 0 then
						    UI_SetElementVisible("NewTaskbar", "bm_kinetic", 1)
						  elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1a") > 0 then
						    UI_SetElementVisible("NewTaskbar", "bm_boomer", 1)
						  elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1b") > 0 then
						    UI_SetElementVisible("NewTaskbar", "bm_mortar", 1)
						  elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "t1c") > 0 then
						    UI_SetElementVisible("NewTaskbar", "bm_howitzer", 1)
						  else
						    --UI_SetElementVisible("NewTaskbar", "TLSD", 1)
						  end
						  MaxCivCap = 2000    
					    if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb1") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb2") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb3") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb4") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end				
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb5") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end	
			        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "cb6") > 0 then
			          MaxCivCap = MaxCivCap + 2000
			        end
			        orbitalstationPop = floor(SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")*100000)
					    if orbitalstationPop > MaxCivCap then
					      orbitalstationPop = MaxCivCap
					    end						
						  UI_SetElementVisible("NewTaskbar", "OSframe", 1)						  
						  UI_SetTextLabelText("NewTaskbar", "oscivilian", ""..orbitalstationPop.."/"..MaxCivCap);
						elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_ark") == 1 then   
					    if Player_HasResearch(SobGroup_OwnedBy("splitcommandfortresses"..i), "ImprovedTorpedoArk") == 1 or Player_HasResearch(SobGroup_OwnedBy("splitcommandfortresses"..i), "nuclear3") == 1 then
					      if SobGroup_OwnedBy("splitcommandfortresses"..i) == playerIndex then
									Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
	              end
					      UI_SetElementVisible("NewTaskbar", "abilities", 1)				      
					      UI_SetElementVisible("NewTaskbar", "torpedo", 1)
						    UI_SetTextLabelText("NewTaskbar", "torpedotext", "MIRV");			    	
					    end
					  	UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);			--160, 24
					  	--UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0);
					  	--UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);
					  	if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w1") > 0 then
						    UI_SetElementVisible("NewTaskbar", "ark_set_gun", 1)
						  elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w1a") > 0 then
						    UI_SetElementVisible("NewTaskbar", "ark_set_blaster", 1)
						  elseif SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "w1b") > 0 then
						    UI_SetElementVisible("NewTaskbar", "ark_set_torpedo", 1)
						  else
						    --UI_SetElementVisible("NewTaskbar", "TLSD", 1)
						  end
					  	if SobGroup_Count("temp2") >= 1 then  
				    	  UI_SetElementVisible("NewTaskbar", "LMSa", 1)
				    	else
				    	  UI_SetElementVisible("NewTaskbar", "LMSDa", 1)
				    	end  	
					  	if SobGroup_Count("temp1") == 1 then  
				    	  UI_SetElementVisible("NewTaskbar", "LJ1a", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2Da", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3Da", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4Da", 1) 
				    	elseif SobGroup_Count("temp1") == 2 then
				    	  UI_SetElementVisible("NewTaskbar", "LJ1a", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2a", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3Da", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4Da", 1) 
				    	elseif SobGroup_Count("temp1") == 3 then
				    	  UI_SetElementVisible("NewTaskbar", "LJ1a", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2a", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3a", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4Da", 1) 
				    	elseif SobGroup_Count("temp1") == 4 then
				    	  UI_SetElementVisible("NewTaskbar", "LJ1a", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2a", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3a", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4a", 1) 
				    	else
				    	  UI_SetElementVisible("NewTaskbar", "LJ1Da", 1) 
				    	  UI_SetElementVisible("NewTaskbar", "LJ2Da", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ3Da", 1)
				    	  UI_SetElementVisible("NewTaskbar", "LJ4Da", 1) 
				    	end					    	 		    	        		    		  		    			  	
						else 				  	  
					    UI_SetElementSize("NewTaskbar", "subsystems", 192, 24);				  
					  end 					  	  	
		        --break
		      end  
				end  
			end		
		end	
		
	---Carrier / Light Carrier   
	  if nc > 0 then         
		  for i = 0,nc-1,1 do  
		    if SobGroup_Empty("splitcarriers"..i) == 0 then
		    
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none)  
	        if hwsaving == 7 then       
	          energyConsume("splitcarriers"..i,1,2)          
						if SobGroup_GetHardPointHealth("splitcarriers"..i, "pg") > 0 then
							FX_StartEvent_Smart("splitcarriers"..i, "EnergyLow")
						elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "pg1") > 0 then
							FX_StartEvent_Smart("splitcarriers"..i, "EnergyLow1")
						elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "pg2") > 0 then
							FX_StartEvent_Smart("splitcarriers"..i, "EnergyLow2")
						end	
					elseif hwsaving == 8 and SobGroup_Empty("star_sol") == 0 then
						sundamageinterface = SobGroup_TakeDamageSol("splitcarriers"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)				
					end               
		      if SobGroup_InWorldBoundForKillingOnly("splitcarriers"..i, 0) == 0 then 
		        SobGroup_SetHealth("splitcarriers"..i, 0)
		      end
		      
					--reduce the super high speed in normal action
					SetAfterburnerForShip("splitcarriers"..i, 33124, "CapitalAfterburner", "AfterBurn", 1)
		      
		      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_scaver") == 1 then				  
						SobGroup_Clear("temp"..SobGroup_OwnedBy("splitcarriers"..i))	
						if ((Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "isai" ) == 1) and					   
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitcarriers"..i), "AsteroidSmasher", "splitcarriers"..i, 10000) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcarriers"..i), "hgn_minermissile") < 3) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) > 4000)) then 
		      	  SobGroup_CreateShip("splitcarriers"..i, "hgn_minermissile")
							SobGroup_CreateShip("splitcarriers"..i, "hgn_minermissile1")
		      	  Player_SetRU(SobGroup_OwnedBy("splitcarriers"..i), Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) - 1500)
		      	end					
						--Orders 
						orders("splitcarriers"..i, "clear",0,0)        	        	
	        	orders("splitcarriers"..i, "evacuation",15,1)
	        	orders("splitcarriers"..i, "guard",0,0) 		      
			      orders("splitcarriers"..i, "fusion",0,0)   	
		      	SobGroup_ForceStayDockedIfDocking("splitcarriers"..i)
		      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_scaver") == 1 then	          		
	          --miner missiles					
						SobGroup_Clear("temp"..SobGroup_OwnedBy("splitcarriers"..i))	
						if ((Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "isai" ) == 1) and					   
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitcarriers"..i), "AsteroidSmasher", "splitcarriers"..i, 10000) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcarriers"..i), "vgr_minermissile") < 3) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) > 4000)) then 
		      	  SobGroup_CreateShip("splitcarriers"..i, "vgr_minermissile")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitcarriers"..i), Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) - 1500)
		      	end					
						--orders 
						orders("splitcarriers"..i, "clear",0,0)        	        	        	
	        	orders("splitcarriers"..i, "guard",0,0) 		      
			      orders("splitcarriers"..i, "fusion",0,0) 
		      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_carrier") == 1 then	
		        --Orders
		        orders("splitcarriers"..i, "clear",0,0)   
	        	orders("splitcarriers"..i, "parade",0,0)	
	        	orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "evacuation",30,2)
	        	orders("splitcarriers"..i, "guard",0,0)      	
		      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_lightcarrier") == 1 then
		        --Orders
		        orders("splitcarriers"..i, "clear",0,0)   
	        	orders("splitcarriers"..i, "parade",0,0)
	        	orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "evacuation",10,1)	
	        	orders("splitcarriers"..i, "guard",0,0)        	
		      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_battlecarrier") == 1 then
		        --Orders
		        orders("splitcarriers"..i, "clear",0,0)   
	        	orders("splitcarriers"..i, "parade",0,0)	
	        	orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "evacuation",30,3)
	        	orders("splitcarriers"..i, "guard",0,0)        
	--viper for AI              	      
		      	if ((Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "isai" ) == 1) and
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitcarriers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitcarriers"..i), "splitcarriers"..i, 12500) == 1) and
							 (SobGroup_IsDoingAbility("splitcarriers"..i, abilityList[2]) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcarriers"..i), "hgn_viper_short") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitcarriers"..i, "hgn_viper_short")
							SobGroup_CreateShip("splitcarriers"..i, "hgn_viper_short1")
		      	  Player_SetRU(SobGroup_OwnedBy("splitcarriers"..i), Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) - 1500)
		      	end
					elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_carrier") == 1 then	
					  SobGroup_Clear("temp"..SobGroup_OwnedBy("splitcarriers"..i))	
						if ((Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "isai" ) == 1) and					   
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitcarriers"..i), "AsteroidSmasher", "splitcarriers"..i, 10000) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcarriers"..i), "hgn_minermissile") < 2) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) > 4000)) then 
		      	  SobGroup_CreateShip("splitcarriers"..i, "vgr_minermissile")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitcarriers"..i), Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) - 1500)
		      	end					
		        --Orders	        
	        	orders("splitcarriers"..i, "parade",0,0)	        	
	        	orders("splitcarriers"..i, "guard",0,0)
	        	orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "clear",0,0)
	--Shield Glow
						if SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_l") > 0 then
							local health = SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_l")
							if SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_l") > 1 then
								SobGroup_SetHardPointHealth("splitcarriers"..i, "shield_l", 1)
								health = 1
							end
							if health < SobGroup_GetHardPointHealth("splitcarriers"..i, "lasthealth_l") then
								FX_StartEvent("splitcarriers"..i, "phase_l")
							end
							SobGroup_SetHardPointHealth("splitcarriers"..i, "lasthealth_l", health)
						end
						if SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_r") > 0 then
							local health = SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_r")
							if SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_r") > 1 then
								SobGroup_SetHardPointHealth("splitcarriers"..i, "shield_r", 1)
								health = 1
							end
							if health < SobGroup_GetHardPointHealth("splitcarriers"..i, "lasthealth_r") then
								FX_StartEvent("splitcarriers"..i, "phase_r")
							end
							SobGroup_SetHardPointHealth("splitcarriers"..i, "lasthealth_r", health)
						end
	        elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_battlecarrier") == 1 then	
		        --Orders	        
	        	orders("splitcarriers"..i, "parade",0,0)	        	
	        	orders("splitcarriers"..i, "guard",0,0) 	
	        	orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "clear",0,0)
	--cruise missile for AI
						if ((CPU_Exist_Smart(SobGroup_OwnedBy("splitcarriers"..i)) == 1) and
						   (SobGroup_IsDoingAbility("splitcarriers"..i, abilityList[2]) == 1) and 
		      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splitcarriers"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splitcarriers"..i), "splitcarriers"..i, 12500) == 1) and
		      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splitcarriers"..i), "vgr_cruse1") < 1) and
		      	   (Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) > 5000)) then 
		      	  SobGroup_CreateShip("splitcarriers"..i, "vgr_cruse1")						
		      	  Player_SetRU(SobGroup_OwnedBy("splitcarriers"..i), Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) - 750)
		      	end
	        elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "kad_needleship") == 1 then	
		        --Orders	        
	        	orders("splitcarriers"..i, "parade",0,0)	        	
	        	orders("splitcarriers"..i, "guard",0,0) 		
	        	orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "clear",0,0)
					  --Kadeshi Perks
						KadPerkExecute("splitcarriers"..i)
	     		  --Needleship Explosion Damage
						if SobGroup_HealthPercentage("splitcarriers"..i) <= 0 then
							for z=0, nc-1, 1 do
								if SobGroup_HealthPercentage("splitcarriers"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitcarriers"..z, "kad_needleship") == 1 then
									if z==i then
										SobGroup_EvacuateShipsAroundExplodingShip("splitcarriers"..i, 8000)		--Evacuate nearby ships to avoid explosion damage
									end
									SobGroup_Create("NeedleshipExpBag"..z)          
						      SobGroup_SobGroupAdd("NeedleshipExpBag"..z, "splitcarriers"..z)      
						      SobGroup_Clear("splitcarriers"..z)    
							  	ExpBag.NeedleshipIndex = z
							    Rule_AddInterval("Needleshipexplosiondamageexp", 14-Temp_GlobalVariable.Selected_NextInterval-0.1)
						    end
							end
						end
						--Needleship AT Field
						if SobGroup_GetHardPointHealth("splitcarriers"..i, "AT1") > 0 then		        
					    FX_StartEvent_Smart("splitcarriers"..i, "shieldc")
					  elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "AT") > 0 then		        
					    FX_StartEvent_Smart("splitcarriers"..i, "shieldb")
					  end
					  --Needleship AI assist
					  if CPU_Exist_Smart(SobGroup_OwnedBy("splitcarriers"..i)) == 1 and Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)) > 2000 and honorList[SobGroup_OwnedBy("splitcarriers"..i)+1] > 150 then
					  	if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Chapel") == 0 then
						  	if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Kadesh3" ) == 1 and SobGroup_IsBuilding("splitcarriers"..i, "kad_needle_ion") == 0 then
						  	  SobGroup_CreateSubSystem("splitcarriers"..i, "kad_needle_ion")
						  	end
						  elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Sajuuk") == 0 then
						  	if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Sajuuk3" ) == 1 and SobGroup_IsBuilding("splitcarriers"..i, "kad_needle_figurehead") == 0 then
						  	  SobGroup_CreateSubSystem("splitcarriers"..i, "kad_needle_figurehead")
						  	end
						  end
					  end
	        	--Frontal Ion Cannon
	        	if SobGroup_HealthPercentage("splitcarriers"..i) > 0 then
	        		if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Chapel") + SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Sajuuk") > 0 then
	        			local alreadybuilt = 0
	        			local currentlevel = 0
	        			if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Kadesh3" ) == 1 then
	        				RemoveSubsystemOnShip("splitcarriers"..i, "Ion Cannon Sajuuk")
	        			end
	        			if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Sajuuk3" ) == 1 then
	        				RemoveSubsystemOnShip("splitcarriers"..i, "Ion Cannon Chapel")
	        			end
	        			for x=1,3,1 do
	        				if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Kadesh_hic"..x) + Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Sajuuk_hic"..x) > 0 then
	        					if x > currentlevel then
	        						currentlevel = x
	        					end
	        				end
	        			end
	        			for x=0,3,1 do
	        				if x ~= currentlevel then
	        					SobGroup_SetHardPointHealth("splitcarriers"..i, "IonLevel"..x, 1)
	        				elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "IonLevel"..x) == 0 then
	        					alreadybuilt = 1
	        				end
	        			end
	        			if alreadybuilt == 0 then
	        				--Chapel
	        				if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Chapel") > 0 then
	        					local justbuilt = 0
		        				if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Real") == 0 then
			      					SobGroup_CreateSubSystem("splitcarriers"..i, "kad_needle_ion"..currentlevel)
			      					SobGroup_SetHardPointHealth("splitcarriers"..i, "IonLevel"..currentlevel, 0)
			      					alreadybuilt = 1
			      					justbuilt = 1
			      				end
			      				if justbuilt == 0 then
		      						RemoveSubsystemOnShip("splitcarriers"..i, "Ion Cannon Real")		--remove the old ion cannon
		      					end
		      				end
		      				--Sajuuk's Maw
	        				if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Sajuuk") > 0 then
	        					local justbuilt = 0
		        				if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Real") == 0 then
			      					SobGroup_CreateSubSystem("splitcarriers"..i, "kad_needle_figurehead"..currentlevel)
			      					SobGroup_SetHardPointHealth("splitcarriers"..i, "IonLevel"..currentlevel, 0)
			      					alreadybuilt = 1
			      					justbuilt = 1
			      				end
			      				if justbuilt == 0 then
		      						RemoveSubsystemOnShip("splitcarriers"..i, "Ion Cannon Real")		--remove the old ion cannon
		      					end
		      				end
	        			end
	        			if alreadybuilt == 1 and SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Real") == 0 then		--recycled or destroyed
	        				RemoveSubsystemOnShip("splitcarriers"..i, "Ion Cannon Chapel")
	        				RemoveSubsystemOnShip("splitcarriers"..i, "Ion Cannon Sajuuk")
	        				for x=0,3,1 do
	        					SobGroup_SetHardPointHealth("splitcarriers"..i, "IonLevel"..x, 1)
	        				end
	        			end
		        	end
	        	end
	        elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "rad_carrier, rad_carrier_black") == 1 then
			      orders("splitcarriers"..i, "guard",0,0)
			      orders("splitcarriers"..i, "parade",0,0)
			      orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "clear",0,0)
	        	ExcuteExperienceSubsystemsWithFullRange("splitcarriers"..i)
	        	RadExperienceAbilityExecute("splitcarriers"..i)
	        elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "kpr_carrier") == 1 then
			      orders("splitcarriers"..i, "guard",0,0)
			      orders("splitcarriers"..i, "parade",0,0)
			      orders("splitcarriers"..i, "dock",0,0)
	        	orders("splitcarriers"..i, "clear",0,0)
	        	KprSpecialAbilityExecute("splitcarriers"..i)
		      end
		      
			    if SobGroup_Selected_Smart("splitcarriers"..i) == 1 then	   
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splitcarriers"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitcarriers"..i))));
			      ---race for taskbar	    
			      RaceDisplayInInterface(SobGroup_OwnedBy("splitcarriers"..i))
	   
				    exp1 = SobGroup_GetHardPointHealth("splitcarriers"..i, "experience") * 10000			 		  		  		   	   	        
					  if exp1 > 999 then
					  	exp1 = 999
					  end
				    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 			    
				    eff = -(floor((1 - SobGroup_GetHardPointHealth("splitcarriers"..i, "efficency")) * 10)) 		
				    if eff <= -1 then	 		  		  		  	        
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff);	   	  		  
					  end				  
						en = SobGroup_GetHardPointHealth("splitcarriers"..i, "en")		 			  		  		  		  	        
					  UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));
					  UI_SetElementSize("NewTaskbar", "subsystems", 210, 48); 	
			      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_lightcarrier") == 1 then 
			        UI_SetElementSize("NewTaskbar", "subsystem7", 0, 0);  
					    UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0); 
			        UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
					    UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);    
			        Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	            	    
			      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_carrier") == 1 then 		
			        UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 		    				     
					    Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	
					  elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_battlecarrier") == 1 then 	
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);			    				     
					    Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	               	 
			      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_scaver") == 1 then 	 	        
			        UI_SetElementVisible("NewTaskbar", "Sframe", 1) 
			        UI_SetTextLabelText("NewTaskbar", "lblResourceUnits", ""..Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)).."/"..RUMaxCapacityList[SobGroup_OwnedBy("splitcarriers"..i)+1]);	      		       	      
			        ff=0
					    if SobGroup_IsDocked("splitcarriers"..i) == 0 and
					       SobGroup_GetHardPointHealth("splitcarriers"..i, "hgn_orders_fusion") == 0 and
					       SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then				       
						    if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres3") == 1 then ff=120					           
						    elseif Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres2") == 1 then ff=90			      
						    elseif Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres1") == 1 then ff=60									      
						    elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then ff=30				  			        
					      end				      	      
						  end		        
				      UI_SetTextLabelText("NewTaskbar", "Sfusion", ""..ff.."/"..fusionList[SobGroup_OwnedBy("splitcarriers"..i) + 1]); 	  			                      	         
					    --UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
					    UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0);    
					    Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save  
					  elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_scaver") == 1 then 	 	        
			        UI_SetElementVisible("NewTaskbar", "Sframe", 1) 
			        UI_SetTextLabelText("NewTaskbar", "lblResourceUnits", ""..Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)).."/"..RUMaxCapacityList[SobGroup_OwnedBy("splitcarriers"..i)+1]);	      		       	      
			        ff=0
					    if SobGroup_IsDocked("splitcarriers"..i) == 0 and
					       SobGroup_GetHardPointHealth("splitcarriers"..i, "hgn_orders_fusion") == 0 and
					       SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then				       
						    if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres3") == 1 then ff=120					           
						    elseif Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres2") == 1 then ff=90			      
						    elseif Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres1") == 1 then ff=60									      
						    elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then ff=30				  			        
					      end		
					      --Vaygr Manpower Division		 
					      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then
					      	for counter = 1, 5, 1 do
					      		if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply"..counter) > 0 then
					      			ff = ff + 10
					      		end
					      	end
					      end     	      
						  end		        
				      UI_SetTextLabelText("NewTaskbar", "Sfusion", ""..ff.."/"..fusionList[SobGroup_OwnedBy("splitcarriers"..i) + 1]);
					  elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_carrier") == 1 then   
					    --UI_SetElementSize("NewTaskbar", "subsystem7", 0, 0);  
				      --UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);  	
				      --UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
							UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
					    if SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_l") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "forcefield_l", 1)
				      else
				        UI_SetElementVisible("NewTaskbar", "forcefield_l", 0)
				      end
				      if SobGroup_GetHardPointHealth("splitcarriers"..i, "shield_r") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "forcefield_r", 1)
				      else
				        UI_SetElementVisible("NewTaskbar", "forcefield_r", 0)
				      end
				      Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
	          elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_battlecarrier") == 1 then 			    
				      --UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);  	
				      --UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
							--UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    --UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    --UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
				      Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save				
	          elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "kad_needleship") == 1 then 			    
				      --UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0);  	
				      --UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0);  
							--UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
					    --UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
					    --UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
					    if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "NeedleshipHeavyMissile") == 1 then
								UI_SetElementVisible("NewTaskbar", "abilities1", 1)
								UI_SetElementSize("NewTaskbar", "fusionm", 66, 15);
								UI_SetTextLabelText("NewTaskbar", "fusiontext", "Missile");
							end
							if SobGroup_GetHardPointHealth("splitcarriers"..i, "AT1") > 0 then	
				        UI_SetElementVisible("NewTaskbar", "needle_at", 1)
				      else
				        UI_SetElementVisible("NewTaskbar", "needle_at", 0)
				      end
						  if SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Sajuuk") > 0 then
						  	local ion_damage = 65000
						  	local ion_upgrades = {95000,125000,165000}
						  	for x, iCount in ion_upgrades do
						  		if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Sajuuk_hic"..x) == 1 then
						  			ion_damage = iCount
						  		end
						  	end
								UI_SetElementVisible("NewTaskbar", "abilities1", 1)
								UI_SetElementSize("NewTaskbar", "fusionchapel", 66, 15);					      
								UI_SetTextLabelText("NewTaskbar", "fusionchapeltext", ion_damage);
							elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "Ion Cannon Chapel") > 0 then
						  	local ion_damage = 3500
						  	local ion_upgrades = {4500,5500,6500}
						  	for x, iCount in ion_upgrades do
						  		if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Kadesh_hic"..x) == 1 then
						  			ion_damage = iCount
						  		end
						  	end
								UI_SetElementVisible("NewTaskbar", "abilities1", 1)
								UI_SetElementSize("NewTaskbar", "fusionchapel", 66, 15);					      
								UI_SetTextLabelText("NewTaskbar", "fusionchapeltext", ion_damage);
							end
			        --display perks
				      PerksDeisplayInTaskBar("splitcarriers"..i)
				      Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save						
	          elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "rad_carrier") == 1 then 			    
				      UI_DisplaySubsystems(3)
				      Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
	          elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "rad_carrier_black") == 1 then 			    
							UI_DisplaySubsystems(9)
				      Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
				    elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "kpr_carrier") == 1 then 			    
							UI_DisplaySubsystems(1)
				      Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
					  end 			  
			  	 	
		        --break
		      end  
				end  	       
			end	
	  end
	end
  
  if Temp_GlobalVariable.Selected_Save == 6 then
	---Hyperspace Station	  	
	  if nhs > 0 then  	
		  for i = 0,nhs-1,1 do
		    if SobGroup_Empty("splithyperspacestations"..i) == 0 then 
				
		      --Orders
		      orders("splithyperspacestations"..i, "clear",0,0)                  
	        orders("splithyperspacestations"..i, "evacuation",10,1)
	        orders("splithyperspacestations"..i, "dock",0,0)
	        orders("splithyperspacestations"..i, "guard",0,0) 	      
		      orders("splithyperspacestations"..i, "hyperspaceinhibitor",0,0)
			      
	--energy consume (sobgroup, multiplier, capacit?costruzione: 1 ship or subs, 2 both, 0 none) 
	        if hwsaving == 8 then        
	          energyConsume("splithyperspacestations"..i,1,2)	           
	        elseif hwsaving == 9 and SobGroup_Empty("star_sol") == 0 then
						sundamageinterface = SobGroup_TakeDamageSol("splithyperspacestations"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)				
					end      
			    if SobGroup_Selected_Smart("splithyperspacestations"..i) == 1 then
					  cleaninterface()	
	          interfacecleaned=interfacecleaned+1
	          DriveMode_DisplayButtonForShip("splithyperspacestations"..i)
			      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splithyperspacestations"..i))));
			      ---race for taskbar	    
			      RaceDisplayInInterface(SobGroup_OwnedBy("splithyperspacestations"..i))
	
			      en = SobGroup_GetHardPointHealth("splithyperspacestations"..i, "en")		 			  		  		  		  	        
				    UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));	
			      UI_SetElementSize("NewTaskbar", "subsystems", 210, 24);
				    exp1 = SobGroup_GetHardPointHealth("splithyperspacestations"..i, "experience") * 10000			 		  		  		   	   
					  if exp1 > 999 then
					  	exp1 = 999
					  end
				    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 			    	
				    eff = -(floor((1 - SobGroup_GetHardPointHealth("splithyperspacestations"..i, "efficency")) * 10)) 		 		  		  		  	        
				    if eff <= -1 then	
					    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff); 		       
					  end			    		    
		        --break  
			    end    
	      	if ((Player_HasResearch(SobGroup_OwnedBy("splithyperspacestations"..i), "isai" ) == 1) and
	      	   (SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy("splithyperspacestations"..i), "smallcapitalenemies"..SobGroup_OwnedBy("splithyperspacestations"..i), "splithyperspacestations"..i, 12500) == 1) and
						 (SobGroup_IsDoingAbility("splithyperspacestations"..i, abilityList[2]) == 1) and
	      	   (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("splithyperspacestations"..i), "hgn_viper_short") < 2) and
	      	   (Player_GetRU(SobGroup_OwnedBy("splithyperspacestations"..i)) > 5000)) then 
	      	  SobGroup_CreateShip("splithyperspacestations"..i, "hgn_viper_short")
						SobGroup_CreateShip("splithyperspacestations"..i, "hgn_viper_short1")
	      	  Player_SetRU(SobGroup_OwnedBy("splithyperspacestations"..i), Player_GetRU(SobGroup_OwnedBy("splithyperspacestations"..i)) - 1500)
	      	end
			  end  
		  end  
		end		
		
	---Platform
	  if np > 0 then         
		  for i = 0,np-1,1 do 	    
		    if SobGroup_Empty("splitplatforms"..i) == 0 then 		 
		    
	--Sun Damage
	        if SobGroup_Empty("star_sol") == 0 and hwsaving == 7 then        
	          sundamageinterface = SobGroup_TakeDamageSol("splitplatforms"..i,0.8,Temp_GlobalVariable.Selected_NextInterval)          	
	        end		    
	
					if SobGroup_InWorldBoundForKillingOnly("splitplatforms"..i, 0) == 0 then 
						SobGroup_SetHealth("splitplatforms"..i, 0)
					end
	
				  SobGroup_ForceStayDockedIfDocking("splitplatforms"..i)	  			 
				   
		      if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_massiveturret") == 0 then
		        if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_artillerysentinel") == 1 then	
		          --Orders                     
				      orders("splitplatforms"..i, "evacuation",20,1) 			      
				      orders("splitplatforms"..i, "destroyallguns",0,0)
				    end  	
		        if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_sentinel, hgn_ionsentinel, hgn_artillerysentinel, hgn_defensefieldturret, vgr_cloakplatform, rad_hsbouey, rad_powerstation") == 1 then	
		          if hwsaving == 9 then
	              energyConsume("splitplatforms"..i,1,1)
	            end
				    end
		        if SobGroup_IsDocked("splitplatforms"..i) == 1 then
				      --SobGroup_MakeSelectable("splitplatforms"..i, 0)			      
				      SobGroup_AllowPassiveActionsAlways_Smart("splitplatforms"..i, 1)
				      if SobGroup_HealthPercentage("splitplatforms"..i) <= 0.25 then
				        SobGroup_SetInvulnerability("splitplatforms"..i, 1)	
				      else
				        SobGroup_SetInvulnerability("splitplatforms"..i, 0)	  
				      end 		      
				    else
				    	SobGroup_AllowPassiveActionsAlways_Smart("splitplatforms"..i, 0)
				      --SobGroup_MakeSelectable("splitplatforms"..i, 1)			      
				    end			    
				
						if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "vgr_mobile_inhibitor") == 1 then
							if Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "IEDPlatformInhibitor" ) == 1 then
								--Install Gravity Well Generator
								if SobGroup_IsDocked("splitplatforms"..i) == 1 and SobGroup_GetHardPointHealth("splitplatforms"..i, "timer") < 1 then
									SobGroup_SetHardPointHealth("splitplatforms"..i, "timer", 1)		--reset timer after docking
								end
								if SobGroup_GetHardPointHealth("splitplatforms"..i, "timer") < 0.3 then
									SobGroup_Create("VgrMobileInhibitorComponentDocked")
									SobGroup_Clear("VgrMobileInhibitorComponentDocked")
									SobGroup_GetSobGroupDockedWithGroup("splitplatforms"..i, "VgrMobileInhibitorComponentDocked")
									if SobGroup_IsDocked("splitplatforms"..i) == 0 and
									SobGroup_AreAllInRealSpace("splitplatforms"..i) == 1 then
										if SobGroup_Empty("VgrMobileInhibitorComponentDocked") == 1 then		--no inhibitor installed
											if SobGroup_GetHardPointHealth("splitplatforms"..i, "Inhibitor") > 0.3 and 
											SobGroup_HealthPercentage("splitplatforms"..i) > 0 and 
											SobGroup_IsDoingAbility("splitplatforms"..i, AB_Dock) == 0 then
												Volume_AddSphere("VgrMobileInhibitorVOL_"..i, SobGroup_GetPosition("splitplatforms"..i), 800)
												SobGroup_Create("VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i))
												SobGroup_Clear("VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i))
												SobGroup_SpawnNewShipInSobGroup(SobGroup_OwnedBy("splitplatforms"..i), "vgr_mobile_inhibitor_well", "VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i), "VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i), "VgrMobileInhibitorVOL_"..i)
												SobGroup_DockSobGroupInstant("VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i), "splitplatforms"..i)
												if SobGroup_IsDocked("VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i)) == 0 then
													SobGroup_DockSobGroupAndStayDocked("VgrMobileInhibitorSpawnSOB_"..SobGroup_OwnedBy("splitplatforms"..i), "splitplatforms"..i)
												end
												SobGroup_SetHardPointHealth("splitplatforms"..i, "Inhibitor", 0.001)
												Volume_Delete("VgrMobileInhibitorVOL_"..i)
											end
										else		--inhibitor installed, reset memory subsystem status
											if SobGroup_GetHardPointHealth("splitplatforms"..i, "Inhibitor") <= 0.3 then
												SobGroup_SetHardPointHealth("splitplatforms"..i, "Inhibitor", 1)
											end
											if SobGroup_HealthPercentage("splitplatforms"..i) == 0 or SobGroup_IsDoingAbility("splitplatforms"..i, AB_Dock) == 1 then
												SobGroup_SetHealth("VgrMobileInhibitorComponentDocked", 0)
											end
										end
									end
								else		--timer during launching
									SobGroup_HardPointTakeDamage("splitplatforms"..i, "timer", 0.1)
								end
							end
						end
						if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "vgr_mobile_inhibitor, rad_explotrap") == 1 then
							if SobGroup_HealthPercentage("splitplatforms"..i) <= 0 then
								if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "rad_explotrap") == 1 then		--EFP
									if Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "IEDEFP") == 1 then
										RemoveSubsystemOnShip("splitplatforms"..i, "block1")
									end
								end
								for z=0, np-1, 1 do
									if SobGroup_HealthPercentage("splitplatforms"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitplatforms"..z, "vgr_mobile_inhibitor, rad_explotrap") == 1 then   
										SobGroup_Create("IEDExpBag"..z)          
							      SobGroup_SobGroupAdd("IEDExpBag"..z, "splitplatforms"..z)      
							      SobGroup_Clear("splitplatforms"..z)    
								  	ExpBag.IEDIndex = z
								  	--if Player_HasResearch(SobGroup_OwnedBy("IEDExpBag"..IEDIndex), "IEDFriendlyProtection") == 1 then
								   		--Rule_AddInterval("IEDexplosiondamageexpFriendly", 0.1)
								   	--else
								   		Rule_AddInterval("IEDexplosiondamageexp", 0.1)
								   	--end
							    end
								end
							else
							end
						end
						
						if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "rad_powerstation") == 1 and SobGroup_HealthPercentage("splitplatforms"..i) <= 0 then
							for z=0, np-1, 1 do
								if SobGroup_HealthPercentage("splitplatforms"..z) <= 0 and SobGroup_AreAnyOfTheseTypes("splitplatforms"..z, "rad_powerstation") == 1 then   
									if z==i then
										SobGroup_EvacuateShipsAroundExplodingShip("splitplatforms"..i, 7000)		--Evacuate nearby ships to avoid explosion damage
									end
									SobGroup_Create("PowerPlantExpBag"..z)          
						      SobGroup_SobGroupAdd("PowerPlantExpBag"..z, "splitplatforms"..z)      
						      SobGroup_Clear("splitplatforms"..z)    
							  	ExpBag.PowerPlantIndex = z
							    Rule_AddInterval("PowerPlantexplosiondamageexp", 8-Temp_GlobalVariable.Selected_NextInterval-0.1)
						    end
							end
						end
						
						--Meddler Switching Sniping Weapons
						if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "kpr_meddler") == 1 then
							if SobGroup_HealthPercentage("splitplatforms"..i) > 0 then
								if SobGroup_GetHardPointHealth("splitplatforms"..i, "weapon_set") > 0.5 then
									for y = 1,3 do
										SobGroup_ChangePower("splitplatforms"..i, "Weapon_Gun"..y, 0)
									end
									local rifle = random_pseudo(1,3)
									SobGroup_ChangePower("splitplatforms"..i, "Weapon_Gun"..rifle, 1)
									SobGroup_SetHardPointHealth("splitplatforms"..i, "weapon_set", 0.4)
								end
							end
						end
				    
				    if SobGroup_Selected_Smart("splitplatforms"..i) == 1 then		
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            DriveMode_DisplayButtonForShip("splitplatforms"..i)
				      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitplatforms"..i))));
				      ---race for taskbar	    
				      RaceDisplayInInterface(SobGroup_OwnedBy("splitplatforms"..i))
	
							if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_missileturret") == 1 and Player_HasResearch(playerIndex, "MissileTurretCallisto" ) == 1 then 	   
								Temp_GlobalVariable.enablebtncallisto[playerIndexList] = Temp_GlobalVariable.Selected_Save
							end
				      if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_artillerysentinel, hgn_sentinel, hgn_ionsentinel, hgn_defensefieldturret, vgr_cloakplatform, rad_hsbouey") == 1 then	
					      en = SobGroup_GetHardPointHealth("splitplatforms"..i, "en")		 			  		  		  		  	        
					      UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));		
				     	end
				     	if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_artillerysentinel, hgn_sentinel, hgn_ionsentinel, hgn_rts") == 1 then
				      	UI_SetElementSize("NewTaskbar", "subsystems", 128, 24); 
				      end
				      --experience
				      if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_defenderdrone, hgn_gunturret, hgn_ionturret, hgn_missileturret, hgn_pulsarturret, hgn_artillerysentinel, hgn_sentinel, hgn_ionsentinel, hgn_rts, hgn_defensefieldturret, vgr_cloakplatform, vgr_weaponplatform_gun, vgr_weaponplatform_lance, vgr_weaponplatform_missile, kad_snail, rad_guntrap, rad_hsbouey, kpr_sentinel, kpr_marauder, kpr_meddler, kpr_dronestruct") == 1 then
						    exp1 = SobGroup_GetHardPointHealth("splitplatforms"..i, "experience") * 10000			 		  		  		   	   
							  if exp1 > 999 then
							  	exp1 = 999
							  end
						    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 
				      end
				      --fuel
				      if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "hgn_defenderdrone, hgn_gunturret, hgn_ionturret, hgn_missileturret, hgn_pulsarturret, hgn_artillerysentinel, hgn_sentinel, hgn_ionsentinel, hgn_rts, hgn_defensefieldturret, vgr_cloakplatform, vgr_weaponplatform_gun, vgr_weaponplatform_lance, vgr_weaponplatform_missile") == 1 then
					      local fuel = SobGroup_GetHardPointHealth("splitplatforms"..i, "fuel")
				      	UI_SetElementVisible("NewTaskbar", "fuelframe", 1)
				      	local fuel_text = ""..(floor(fuel*10000)/100)
				      	if strlen(fuel_text) > 5 then --like "98.25"
				      		fuel_text = strsub(fuel_text, 1, 5)
				      	end
				      	UI_SetTextLabelText("NewTaskbar", "fuel", String_AddRainbowColourBasedOnNumber(fuel*10000, fuel_text.."%", 0, 10000*18/14)); 
				      end
				      
				      if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "vgr_mobile_inhibitor, rad_explotrap") == 1 then
								parameter = 300
								DetonationPower = 100 * parameter
								DetonationRange = 1 * parameter
								UI_SetElementVisible("NewTaskbar", "juggernaughtframe", 1)
								UI_SetTextLabelText("NewTaskbar", "juggernaughtpower", ""..DetonationPower); 
								UI_SetTextLabelText("NewTaskbar", "juggernaughtrange", ""..DetonationRange);
								if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "rad_explotrap") == 1 then		--EFP
									if Player_HasResearch(SobGroup_OwnedBy("splitplatforms"..i), "IEDEFP") == 1 then
										UI_SetElementSize("NewTaskbar", "juggernaughtefp", 66, 15);
										UI_SetTextLabelText("NewTaskbar", "juggernaughtefptext", "EFP");
									end
								end
				      end
				      
				      if SobGroup_AreAnyOfTheseTypes("splitplatforms"..i, "rad_powerstation") == 1 then
					      en = SobGroup_GetHardPointHealth("splitplatforms"..i, "en")
					      UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));
						    exp1 = SobGroup_GetHardPointHealth("splitplatforms"..i, "experience") * 10000			 		  		  		   	   
							  if exp1 > 999 then
							  	exp1 = 999
							  end
						    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 			    
						    eff = -(floor((1 - SobGroup_GetHardPointHealth("splitplatforms"..i, "efficency")) * 10)) 		 		  		  		  	        
						    if eff <= -1 then	
							    UI_SetTextLabelText("NewTaskbar", "efficency", ""..eff); 		       
							  end				    
						    UI_SetElementVisible("NewTaskbar", "PSframe", 1)					
			          UI_SetTextLabelText("NewTaskbar", "ps", ""..LastpowerList[SobGroup_OwnedBy("splitplatforms"..i) + 1].."/"..LastpowerListStored[SobGroup_OwnedBy("splitplatforms"..i) + 1].."/"..LastpowerListMax[SobGroup_OwnedBy("splitplatforms"..i) + 1]);  					
				      end
				      
						  Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save			        
						end					           
	        else	  --for hgn massive turret   
			      if SobGroup_CanDoAbility("splitplatforms"..i, AB_Move) == 1 then
			        SobGroup_AbilityActivate("splitplatforms"..i, AB_Attack, 0)
			      else
			        SobGroup_AbilityActivate("splitplatforms"..i, AB_Attack, 1)
			      end
			      if SobGroup_Selected_Smart("splitplatforms"..i) == 1 then		
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1
	            --DriveMode_DisplayButtonForShip("splitplatforms"..i)
				      UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitplatforms"..i))));
				      ---race for taskbar	    
				      RaceDisplayInInterface(SobGroup_OwnedBy("splitplatforms"..i))
							exp1 = SobGroup_GetHardPointHealth("splitplatforms"..i, "experience") * 10000			 		  		  		   	   
						  if exp1 > 999 then
						  	exp1 = 999
						  end
					    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1)); 
						end					     
			    end			  			
				end			
			end		                   				
	  end
	end
	
	if Temp_GlobalVariable.Selected_Save == 7 then
	---Fighter	
	  local playervar = 0
	  while playervar < Universe_PlayerCount() do
		  playervar = playervar + 1
		  local playeridx = playervar-1
		  if (hwsaving == 1 and nfi[playervar] >= 10) or nfi[playervar] > 0 then		--nfi[playerIndexList] < 10
				if nfi[playervar] > 0 then         
					for i = 0,(nfi[playervar]-1),1 do  	 
						if SobGroup_Empty("splitfighters"..playeridx .. tostring(i)) == 0 then		 
						
			--Sun Damage
							if SobGroup_Empty("star_sol") == 0 and hwsaving == 1 then        
								sundamageinterface = SobGroup_TakeDamageSol("splitfighters"..playeridx .. tostring(i),0.9,Temp_GlobalVariable.Selected_NextInterval)          	
							end		    	  
							
							if SobGroup_InWorldBoundForKillingOnly("splitfighters"..playeridx .. tostring(i), 0) == 0 then 
								SobGroup_SetHealth("splitfighters"..playeridx .. tostring(i), 0)
							end
							     
					    --experience benefit
							if FighterEXP.serial[playervar][i+1] == nil then
								expFi1 = 0
							else
								expFi1 = FighterEXP.serial[playervar][i+1] * 10000
							end
						  if expFi1 > 999 then
						  	expFi1 = 999
						  end
					    --SobGroup_SetInvulnerability("splitfighters"..playeridx .. tostring(i), 0)
					    SobGroup_ResetAvoidanceIgnore("splitfighters"..playeridx .. tostring(i))
					    if random_pseudo(0,2000) < expFi1*(1.5 + 0.5*unithealth) then
					    	--SobGroup_SetInvulnerability("splitfighters"..playeridx .. tostring(i), 1)
					      if SobGroup_Empty("enemies"..playeridx) == 0 then
					    		SobGroup_AvoidanceIgnore("splitfighters"..playeridx .. tostring(i), "enemies"..playeridx)
					    	end
					    end
							
							--Kpr health debug
							if Player_GetRace(SobGroup_OwnedBy("splitfighters"..playeridx .. tostring(i))) == Race_Keeper then
								if SobGroup_HealthPercentage("splitfighters"..playeridx .. tostring(i)) > 1 then
									--SobGroup_SetHealth("splitfighters"..playeridx .. tostring(i), 1)
								end
							end
							
							if SobGroup_AreAnyOfTheseTypes("splitfighters"..playeridx .. tostring(i), "meg_c5") == 1 then
								--Detonate 
								if SobGroup_HealthPercentage("splitfighters"..playeridx .. tostring(i)) <= 0 then
									for z=0, (nfi[playervar]-1), 1 do
										if SobGroup_HealthPercentage("splitfighters"..playeridx .. tostring(z)) <= 0 and SobGroup_AreAnyOfTheseTypes("splitfighters"..playeridx .. tostring(z), "meg_c5") == 1 then
											FX_StartEvent("splitfighters"..playeridx .. tostring(z), "FireM1Cluster")
											SobGroup_Create("CargoPlaneExpBag"..z)
								      SobGroup_SobGroupAdd("CargoPlaneExpBag"..z, "splitfighters"..playeridx .. tostring(z))
								      SobGroup_Clear("splitfighters"..playeridx .. tostring(z))
									  	ExpBag.CargoPlaneIndex = z
									    CargoPlaneexplosiondamageexp()
								    end
									end
								end
				      end
							
							if SobGroup_Selected_Smart("splitfighters"..playeridx .. tostring(i)) == 1 then		
							  cleaninterface()	
		            interfacecleaned=interfacecleaned+1
		            DriveMode_DisplayButtonForShip("splitfighters"..playeridx .. tostring(i))
								UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitfighters"..playeridx .. tostring(i)))));
								---race for taskbar	    
								RaceDisplayInInterface(SobGroup_OwnedBy("splitfighters"..playeridx .. tostring(i)))
								
						    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(expFi1));
							---medals
								if expFi1 >= 500 then
							    UI_SetElementVisible("NewTaskbar", "medal5", 1) 
							  end  
							  if expFi1 >= 400 then
							    UI_SetElementVisible("NewTaskbar", "medal4", 1) 
							  end  
							  if expFi1 >= 300 then
							    UI_SetElementVisible("NewTaskbar", "medal3", 1) 
							  end  
							  if expFi1 >= 200 then
							    UI_SetElementVisible("NewTaskbar", "medal2", 1) 
							  end  
							  if expFi1 >= 100 then
							    UI_SetElementVisible("NewTaskbar", "medal1", 1) 
							  end
								if expFi1 >= 999 then
							    UI_SetElementVisible("NewTaskbar", "medal10", 1) 
							  end  
							  if expFi1 >= 900 then
							    UI_SetElementVisible("NewTaskbar", "medal9", 1)
							  end  
							  if expFi1 >= 800 then
							    UI_SetElementVisible("NewTaskbar", "medal8", 1)
							  end  
							  if expFi1 >= 700 then
							    UI_SetElementVisible("NewTaskbar", "medal7", 1)
							  end  
							  if expFi1 >= 600 then
							    UI_SetElementVisible("NewTaskbar", "medal6", 1) 
							  end
	 
								if Player_HasResearch(playeridx, "isai") == 0 then
									if ((((SobGroup_Empty("hgn_hft"..playeridx) == 1) and (SobGroup_Empty("hgn_hftl"..playeridx) == 1)) or Player_HasResearch(playeridx, "ImprovedCallistoAvenger") == 0)) and ((((SobGroup_Empty("hgn_lbomber"..playeridx) == 1) and (SobGroup_Empty("hgn_lbomberl"..playeridx) == 1)) or Player_HasResearch(playeridx, "lbomberEMPAbility") == 0)) then
										Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save 
										--break
									else
										if (SobGroup_AreAnyOfTheseTypes("splitfighters"..playeridx .. tostring(i), "hgn_hft, hgn_hftl") == 1 and Player_HasResearch(playeridx, "ImprovedCallistoAvenger" ) == 1) or (SobGroup_AreAnyOfTheseTypes("splitfighters"..playeridx .. tostring(i), "hgn_lbomber, hgn_lbomberl") == 1 and Player_HasResearch(playeridx, "lbomberEMPAbility" ) == 1) then 	   
											Temp_GlobalVariable.enablebtncallisto[playerIndexList] = Temp_GlobalVariable.Selected_Save	
											Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
											--break
										else
											Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save  
										end  
									end  	
								end
							end  					    
						end		      
					end		                   				
				end
		  end  
		end
	  
	---Core
	  --if hwsaving == 9 then
			for z = 0,(Universe_PlayerCount()-1),1 do	        
				if Player_IsAlive(z) == 1 then    
					if Player_GetRace(z) == Race_Hiigaran then
						if SobGroup_Empty("hgn_hscore"..z) == 0 then
						
			--Sun Damage
							if SobGroup_Empty("star_sol") == 0 and hwsaving == 9 then        
								sundamageinterface = SobGroup_TakeDamageSol("hgn_hscore"..z,0.6,Temp_GlobalVariable.Selected_NextInterval)          	
							end		   
							
							if SobGroup_InWorldBoundForKillingOnly("hgn_hscore"..z, 0) == 0 then 
								SobGroup_SetHealth("hgn_hscore"..z, 0)
							end
		
							SobGroup_ForceStayDockedIfDocking("hgn_hscore"..z)
							if SobGroup_IsDocked("hgn_hscore"..z) == 1 then
								SobGroup_AllowPassiveActionsAlways_Smart("hgn_hscore"..z, 1)
							else
								SobGroup_AllowPassiveActionsAlways_Smart("hgn_hscore"..z, 0)
							end
												
							if SobGroup_Selected_Smart("hgn_hscore"..z) == 1 then		
							  cleaninterface()	
	              interfacecleaned=interfacecleaned+1	
	              DriveMode_DisplayButtonForShip("hgn_hscore"..z)
								UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("hgn_hscore"..z))));					   
								RaceDisplayInInterface(SobGroup_OwnedBy("hgn_hscore"..z))
								Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save	    															
							end	  	        
							
						end	  	
					end
				end
			end	 
	  --end
	end
  
  if Temp_GlobalVariable.Selected_Save == 8 then
	---Corvette
	  local playervar = 0
	  while playervar < Universe_PlayerCount() do
		  playervar = playervar + 1
		  local playeridx = playervar-1
		  if (hwsaving == 3 and nco[playervar] >= 10) or nco[playervar] > 0 then			--nco[playerIndexList] < 10
				if nco[playervar] > 0 then         
					for i = 0,(nco[playervar]-1),1 do  
						if SobGroup_Empty("splitcorvettes"..playeridx .. tostring(i)) == 0 then	
						
			--Sun Damage
							if SobGroup_Empty("star_sol") == 0 and hwsaving == 3 then        
								sundamageinterface = SobGroup_TakeDamageSol("splitcorvettes"..playeridx .. tostring(i),0.9,Temp_GlobalVariable.Selected_NextInterval)          	
							end		    
		
							if SobGroup_InWorldBoundForKillingOnly("splitcorvettes"..playeridx .. tostring(i), 0) == 0 then 
								SobGroup_SetHealth("splitcorvettes"..playeridx .. tostring(i), 0)
							end
	
					    --experience benefit
							if CorvetteEXP.serial[playervar][i+1] == nil then
								expCo1 = 0
							else
								expCo1 = CorvetteEXP.serial[playervar][i+1] * 10000
							end
						  if expCo1 > 999 then
						  	expCo1 = 999
						  end
					    --SobGroup_SetInvulnerability("splitcorvettes"..playeridx .. tostring(i), 0)
					    SobGroup_ResetAvoidanceIgnore("splitcorvettes"..playeridx .. tostring(i))
					    if random_pseudo(0,2000) < expCo1*(1.5 + 0.5*unithealth) then
					    	--SobGroup_SetInvulnerability("splitcorvettes"..playeridx .. tostring(i), 1)
					      if SobGroup_Empty("enemies"..playeridx) == 0 then
					    		SobGroup_AvoidanceIgnore("splitcorvettes"..playeridx .. tostring(i), "enemies"..playeridx)
					    	end
					    end
					    
					    if SobGroup_AreAnyOfTheseTypes("splitcorvettes"..playeridx .. tostring(i), "kpr_mover") == 1 then		--mover towing, doesn't seem to be working though
					    	if SobGroup_IsDoingAbility("splitcorvettes"..playeridx .. tostring(i), AB_Capture ) == 1 then
					    		SobGroup_ChangePower("splitcorvettes"..playeridx .. tostring(i), "Weapon_Tow", 1)
					    	else
					    		SobGroup_ChangePower("splitcorvettes"..playeridx .. tostring(i), "Weapon_Tow", 0)
					    	end
					    end
					    
					    --Kpr health debug
							if Player_GetRace(SobGroup_OwnedBy("splitcorvettes"..playeridx .. tostring(i))) == Race_Keeper then
								if SobGroup_HealthPercentage("splitcorvettes"..playeridx .. tostring(i)) > 1 then
									--SobGroup_SetHealth("splitcorvettes"..playeridx .. tostring(i), 1)
								end
							end
	
							if SobGroup_Selected_Smart("splitcorvettes"..playeridx .. tostring(i)) == 1 then	
							  cleaninterface()	
		            interfacecleaned=interfacecleaned+1	
		            DriveMode_DisplayButtonForShip("splitcorvettes"..playeridx .. tostring(i))
								UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitcorvettes"..playeridx .. tostring(i)))));
								---race for taskbar	    
								RaceDisplayInInterface(SobGroup_OwnedBy("splitcorvettes"..playeridx .. tostring(i)))
	
						    UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(expCo1));
							---medals
								if expCo1 >= 500 then
							    UI_SetElementVisible("NewTaskbar", "medal5", 1) 
							  end  
							  if expCo1 >= 400 then
							    UI_SetElementVisible("NewTaskbar", "medal4", 1) 
							  end  
							  if expCo1 >= 300 then
							    UI_SetElementVisible("NewTaskbar", "medal3", 1) 
							  end  
							  if expCo1 >= 200 then
							    UI_SetElementVisible("NewTaskbar", "medal2", 1) 
							  end  
							  if expCo1 >= 100 then
							    UI_SetElementVisible("NewTaskbar", "medal1", 1) 
							  end
								if expCo1 >= 999 then
							    UI_SetElementVisible("NewTaskbar", "medal10", 1) 
							  end  
							  if expCo1 >= 900 then
							    UI_SetElementVisible("NewTaskbar", "medal9", 1)
							  end  
							  if expCo1 >= 800 then
							    UI_SetElementVisible("NewTaskbar", "medal8", 1)
							  end  
							  if expCo1 >= 700 then
							    UI_SetElementVisible("NewTaskbar", "medal7", 1)
							  end  
							  if expCo1 >= 600 then
							    UI_SetElementVisible("NewTaskbar", "medal6", 1) 
							  end
	
								if Player_HasResearch(playeridx, "isai") == 0 then
									Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save				    	
								--break
								end
							end		
						end		
					end		                   				
				end	
		  end  
		end
	
	--sonde  
	  local playervar = 0
	  while playervar < Universe_PlayerCount() do
		  playervar = playervar + 1
		  local playeridx = playervar-1
		  if (hwsaving == 4 and nonp[playervar] >= 10) or nonp[playervar] > 0 then		-- < 10
				if nonp[playervar] > 0 then         
					for i = 0,(nonp[playervar]-1),1 do  
						if SobGroup_Empty("splitothersnoparade"..playeridx .. tostring(i)) == 0 then	 	
						
		--Sun Damage
							if SobGroup_Empty("star_sol") == 0 and hwsaving == 4 then        
								sundamageinterface = SobGroup_TakeDamageSol("splitothersnoparade"..playeridx .. tostring(i),0.6,Temp_GlobalVariable.Selected_NextInterval)          	
							end		    
		
							if SobGroup_InWorldBoundForKillingOnly("splitothersnoparade"..playeridx .. tostring(i), 0) == 0 then 
								SobGroup_SetHealth("splitothersnoparade"..playeridx .. tostring(i), 0)
							end
		
							if SobGroup_AreAnyOfTheseTypes("splitothersnoparade"..playeridx .. tostring(i), "kpr_ressourcecollector_old") == 1 then
			          if hwsaving == 4 then
		              energyConsume("splitothersnoparade"..playeridx .. tostring(i),1,1)
		            end
					    end
					    
		--Orders
					    if SobGroup_AreAnyOfTheseTypes("splitothersnoparade"..playeridx .. tostring(i), "kpr_ressourcecollector_old") == 1 then
								orders("splitothersnoparade"..playeridx .. tostring(i), "kpr_orders_en100",0,0)
					      orders("splitothersnoparade"..playeridx .. tostring(i), "kpr_orders_ru1000",0,0)
					      if SobGroup_IsDocked("splitothersnoparade"..playeridx .. tostring(i)) == 1 then
					      	SobGroup_AllowPassiveActionsAlways_Smart("splitothersnoparade"..playeridx .. tostring(i), 1)
					      	if Player_HasResearch(SobGroup_OwnedBy("splitothersnoparade"..playeridx .. tostring(i)), "GeneratorDockProtection") == 1 then
					      		SobGroup_SetHealth_UpgradeOnly("splitothersnoparade"..playeridx .. tostring(i), 1)		--protect the generators when docked
					      	end
					      else
					      	SobGroup_AllowPassiveActionsAlways_Smart("splitothersnoparade"..playeridx .. tostring(i), 0)
					      end
					    elseif SobGroup_AreAnyOfTheseTypes("splitothersnoparade"..playeridx .. tostring(i), "hgn_juggernaught_booster") == 1 then
					    	--self destruction when idle
					    	if SobGroup_IsDoingAbility("splitothersnoparade"..playeridx .. tostring(i),  AB_Dock) == 0 and SobGroup_IsDocked("splitothersnoparade"..playeridx .. tostring(i)) == 0 then
					    		SobGroup_SetHealth("splitothersnoparade"..playeridx .. tostring(i), 0)
					    	end
					    	--self destruction when failed to dock
					    	SobGroup_Create("NearbyJuggernaughts")
					    	if SobGroup_FillProximitySobGroup ("NearbyJuggernaughts", "hgn_juggernaught"..playeridx, "splitothersnoparade"..playeridx .. tostring(i), 1500) == 0 then
					    		SobGroup_SetHealth("splitothersnoparade"..playeridx .. tostring(i), 0)
					    	end
					    	--small afterburner fx when independent
					    	if SobGroup_IsDocked("splitothersnoparade"..playeridx .. tostring(i)) == 0 and SobGroup_GetEquivalentSpeed("splitothersnoparade"..playeridx .. tostring(i)) >= 1000 then
					    		FX_StartEvent_Smart("splitothersnoparade"..playeridx .. tostring(i), "AfterBurnSmall")
					    	end
					    	if SobGroup_IsDocked("splitothersnoparade"..playeridx .. tostring(i)) == 1 then
					    		SobGroup_MakeSelectable("splitothersnoparade"..playeridx .. tostring(i), 0)
					    	else
					    		SobGroup_MakeSelectable("splitothersnoparade"..playeridx .. tostring(i), 1)
					    	end
					    elseif SobGroup_AreAnyOfTheseTypes("splitothersnoparade"..playeridx .. tostring(i), "vgr_mobile_inhibitor_well") == 1 then
					    	--self destruction when idle
					    	if SobGroup_IsDoingAbility("splitothersnoparade"..playeridx .. tostring(i),  AB_Dock) == 0 and SobGroup_IsDocked("splitothersnoparade"..playeridx .. tostring(i)) == 0 then
					    		SobGroup_SetHealth("splitothersnoparade"..playeridx .. tostring(i), 0)
					    	end
					    	if SobGroup_IsDocked("splitothersnoparade"..playeridx .. tostring(i)) == 1 then
					    		SobGroup_MakeSelectable("splitothersnoparade"..playeridx .. tostring(i), 0)
					    	else
					    		SobGroup_MakeSelectable("splitothersnoparade"..playeridx .. tostring(i), 1)
					    	end
					    end
		
							if SobGroup_Selected_Smart("splitothersnoparade"..playeridx .. tostring(i)) == 1 then	
							  cleaninterface()	
			          interfacecleaned=interfacecleaned+1	
			          DriveMode_DisplayButtonForShip("splitothersnoparade"..playeridx .. tostring(i))
								UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitothersnoparade"..playeridx .. tostring(i)))));
								---race for taskbar	    
								RaceDisplayInInterface(SobGroup_OwnedBy("splitothersnoparade"..playeridx .. tostring(i)))
		   					
		   					if SobGroup_AreAnyOfTheseTypes("splitothersnoparade"..playeridx .. tostring(i), "kpr_ressourcecollector_old") == 1 then
						      en = SobGroup_GetHardPointHealth("splitothersnoparade"..playeridx .. tostring(i), "en")
						      UI_SetTextLabelText("NewTaskbar", "energy", ""..floor((en-0.5)*1000));
							    UI_SetElementVisible("NewTaskbar", "PSframe", 1)					
				          UI_SetTextLabelText("NewTaskbar", "ps", ""..LastpowerList[SobGroup_OwnedBy("splitothersnoparade"..playeridx .. tostring(i)) + 1].."/"..LastpowerListStored[SobGroup_OwnedBy("splitothersnoparade"..playeridx .. tostring(i)) + 1].."/"..LastpowerListMax[SobGroup_OwnedBy("splitothersnoparade"..playeridx .. tostring(i)) + 1]);  					
					      elseif SobGroup_AreAnyOfTheseTypes("splitothersnoparade"..playeridx .. tostring(i), "hgn_probe, hgn_ecmprobe, hgn_proximitysensor, vgr_probe, vgr_probe_ecm, vgr_probe_prox, vgr_probe_smallhsbeacon") == 1 then
					      	local fuel = SobGroup_GetHardPointHealth("splitothersnoparade"..playeridx .. tostring(i), "fuel")
					      	UI_SetElementVisible("NewTaskbar", "fuelframe", 1)
					      	local fuel_text = ""..(floor(fuel*10000)/100)
					      	if strlen(fuel_text) > 5 then --like "98.25"
					      		fuel_text = strsub(fuel_text, 1, 5)
					      	end
					      	UI_SetTextLabelText("NewTaskbar", "fuel", String_AddRainbowColourBasedOnNumber(fuel*10000, fuel_text.."%", 0, 10000*18/14)); 
					      end
								--break
							end		
						end		
					end		                   				
				end
		  end
		end
	end
  
  if Temp_GlobalVariable.Selected_Save == 9 then
	---Frigate	
	  if (hwsaving == 8 and nf >= 10) or nf > 0 then			--nf < 10
			if nf > 0 then				
				for i = 0,nf-1,1 do         
					if SobGroup_Empty("splitfrigates"..i) == 0 then       
					
		--Sun Damage
						if SobGroup_Empty("star_sol") == 0 and hwsaving == 8 then        
							sundamageinterface = SobGroup_TakeDamageSol("splitfrigates"..i,0.9,Temp_GlobalVariable.Selected_NextInterval)          	
						end			  
	
						if SobGroup_InWorldBoundForKillingOnly("splitfrigates"..i, 0) == 0 then 
							SobGroup_SetHealth("splitfrigates"..i, 0)
						end
	
		        if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "kad_podship") == 1 then
		--Orders                   
							orders("splitfrigates"..i, "parade",0,0)
				      orders("splitfrigates"..i, "guard",0,0)
				      orders("splitfrigates"..i, "dock",0,0)
	        		orders("splitfrigates"..i, "clear",0,0)
	        		orders("splitfrigates"..i, "needle",0,0)
				    end	
	
						--reduce the super high speed in normal action
						SetAfterburnerForShip("splitfrigates"..i, 48400, "FrigateAfterburner", "AfterBurn", 0)
	
						if SobGroup_Selected_Smart("splitfrigates"..i) == 1 then
						  cleaninterface()	
	            interfacecleaned=interfacecleaned+1	
	            DriveMode_DisplayButtonForShip("splitfrigates"..i)
	            
						  exp1 = SobGroup_GetHardPointHealth("splitfrigates"..i, "experience") * 10000		 			  		  		  		  	        
						  if exp1 > 999 then
						  	exp1 = 999
						  end
						  UI_SetTextLabelText("NewTaskbar", "experience", ""..floor(exp1));
						  
							UI_SetTextLabelText("NewTaskbar", "unitactualspeed", ""..floor(sqrt(SobGroup_GetActualSpeed("splitfrigates"..i))));
							---race for taskbar	    
							RaceDisplayInInterface(SobGroup_OwnedBy("splitfrigates"..i))
	
							if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "Hgn_lrms") == 1 then 
								if Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "ImprovedTorpedolrm") == 1 then
									if SobGroup_OwnedBy("splitfrigates"..i) == playerIndex then
									  --Temp_GlobalVariable.enablebtnnuclear[playerIndexList] = Temp_GlobalVariable.Selected_Save
									end
									UI_SetElementVisible("NewTaskbar", "abilities", 1)				      
									UI_SetElementVisible("NewTaskbar", "torpedo", 1)
									UI_SetTextLabelText("NewTaskbar", "torpedotext", "Nuclear");			    	
								end   
							end   
		          if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "kad_podship") == 1 then 			    
								UI_SetElementSize("NewTaskbar", "subsystems", 32, 24);
							else
								UI_SetElementSize("NewTaskbar", "subsystems", 0, 0);
							end
							if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "hgn_marinefrigate_soban") == 0 then
								Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
							end
							if Player_GetRace(playerIndex) == Race_Hiigaran then
								if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "Hgn_lrms") == 1 then 
									 Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save  
								end  
								if SobGroup_Empty("hgn_torpedofrigate"..playerIndex) == 1 or Player_HasResearch(playerIndex, "ImprovedCallistoTorpedo") == 0 then
									Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save 
									--break
								else
									if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "hgn_torpedofrigate") == 1 and Player_HasResearch(playerIndex, "ImprovedCallistoTorpedo" ) == 1 then 	   
										Temp_GlobalVariable.enablebtncallisto[playerIndexList] = Temp_GlobalVariable.Selected_Save	
										Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save
										--break				      
									else
										Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save  
									end  
								end  									
							elseif Player_GetRace(playerIndex) == Race_Vaygr then
								if SobGroup_Empty("vgr_infiltratorfrigate"..playerIndex) == 1 or Player_HasResearch(playerIndex, "PerforateAbility" ) == 0 then
									Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save 
									--break
								else
									if SobGroup_AreAnyOfTheseTypes("splitfrigates"..i, "vgr_infiltratorfrigate") == 1 and Player_HasResearch(playerIndex, "PerforateAbility" ) == 1 then
										Temp_GlobalVariable.enablebtnperforate[playerIndexList] = Temp_GlobalVariable.Selected_Save
										Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save  
										--break
									else
										Temp_GlobalVariable.enablebtnparade[playerIndexList] = Temp_GlobalVariable.Selected_Save  
									end  
								end  
							end   	
						end		     
					end  			  	
				end		  
			end	
		end
	end

	
---medals
	if exp1 >= 500 then
    UI_SetElementVisible("NewTaskbar", "medal5", 1) 
  end  
  if exp1 >= 400 then
    UI_SetElementVisible("NewTaskbar", "medal4", 1) 
  end  
  if exp1 >= 300 then
    UI_SetElementVisible("NewTaskbar", "medal3", 1) 
  end  
  if exp1 >= 200 then
    UI_SetElementVisible("NewTaskbar", "medal2", 1) 
  end  
  if exp1 >= 100 then
    UI_SetElementVisible("NewTaskbar", "medal1", 1) 
  end
	if exp1 >= 999 then
    UI_SetElementVisible("NewTaskbar", "medal10", 1) 
  end  
  if exp1 >= 900 then
    UI_SetElementVisible("NewTaskbar", "medal9", 1)
  end  
  if exp1 >= 800 then
    UI_SetElementVisible("NewTaskbar", "medal8", 1)
  end  
  if exp1 >= 700 then
    UI_SetElementVisible("NewTaskbar", "medal7", 1)
  end  
  if exp1 >= 600 then
    UI_SetElementVisible("NewTaskbar", "medal6", 1) 
  end		
  	
--timing	
  if Universe_GameTime() - lastUniverse_GameTime >= 5 then	          
    lastUniverse_GameTime = Universe_GameTime()      
  end
		
		if Temp_GlobalVariable.Selected_Save == 1 then
	---energy		
	  hwsaving = hwsaving + 1
	  if hwsaving >= 10 then	  
	    
	    for z = 0,(Universe_PlayerCount()-1),1 do	        
		    if Player_IsAlive(z) == 1 then
	    
			  	if Player_GetRace(z) == Race_Hiigaran then
			    
				    if powerList[z+1] < -99 then
				      powerList[z+1] = -99
				    end   
				    if powerList[z+1] > 99 then
				      powerList[z+1] = 99
				    end     
				  
				    --aumenta il totale di energia 
				    powerListStored[z+1] = powerListStored[z+1] + powerList[z+1]
						if powerListStored[z+1] < 0 then
						  powerListStored[z+1] = 0	  
						end 
						if powerListStored[z+1] >= powerListMax[z+1] then
						  powerListStored[z+1] = powerListMax[z+1]
						end   					
						
						if z == Universe_CurrentPlayer() and ((year==0 and gametime<55) or year>0) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..powerList[z+1]); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..powerListMax[z+1]);
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..powerList[z+1].."/"..powerListStored[z+1].."/"..powerListMax[z+1]);  
					    
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end  
					  
					  --setta l'effetto dell'energia su sottosistema/flotta
					  multiplier = powerListStored[z+1]/2000
					  
					  --serve per settaggio custom
					  multiplier = multiplier*energysensitivity
					  
					  if multiplier < 0 then
					    multiplier = 0
					  end
					  if multiplier > 1 then
					    multiplier = 1
					  end	  
				    if Player_HasResearch(SobGroup_OwnedBy("supporter"..z), "isai" ) == 0 then
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", multiplier)
				      --in questo modo la ps costruisce sempre alla stessa velocit?
				      if SobGroup_Count("hgn_power"..z) > 0 then
				        SobGroup_SetHardPointHealth("hgn_power"..z, "energycontro", multiplier)
				      end  
				    else
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", 0.5)
				    end  
						
					--overcharge				  
					  if SobGroup_Count("hgn_power"..z) > 0 then	
					    if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then	
						    g = Ping_AddSobGroup("Brazer Core ", "energy", "hgn_power"..z)
								Ping_LabelVisible(g, 1)		
								Ping_AddDescription(g, 0, "Energy " .. powerList[z+1] .. "/" .. powerListStored[z+1] .. "/" .. powerListMax[z+1])
							end	
							if multiplier >= 0.5 then
							  multiplierbuild = floor((multiplier-0.5)*150)
							  if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 2, "Build Speed +" .. multiplierbuild .. "%") 
								end	
								multiplierspeed = floor((multiplier-0.5)*50)
								if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 3, "Navigation/Attack +" .. multiplierspeed .. "%")  
								end									
							elseif multiplier < 0.5 then
							  multiplierbuild = floor((0.5-multiplier)*150)
							  if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then
							  	Ping_AddDescription(g, 2, "Build Speed -" .. multiplierbuild .. "%")		
							  end	
							  multiplierspeed = floor((0.5-multiplier)*50)
							  if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 3, "Navigation/Attack -" .. multiplierspeed .. "%")	
								end								
							end			
					          
					    if powerList[z+1] < 0 then --and powerListStored[z+1] <= powerListMax[z+1]/21 then   						  
					      damage = floor(-0.001*powerList[z+1]*1000) 
					      if SobGroup_IsDocked("hgn_power"..z) == 0 then
						    	SobGroup_TakeDamage("hgn_power"..z, -0.0005*powerList[z+1]*Temp_GlobalVariable.Selected_NextInterval)
						    else
						      SobGroup_TakeDamage("hgn_power"..z, -0.00025*powerList[z+1]*Temp_GlobalVariable.Selected_NextInterval)
						    end				    
						    if damage >= 1 then
						      if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then						   
										Ping_AddDescription(g, 1, "OVERCHARGE " .. damage .. "%") 	
									end					   
								end								
								--malfunzionamento sistemi in overcharge
								if powerListStored[z+1] <= 10 then
								  if nsy > 0 then		
										for i = 0,nsy-1,1 do       
											if SobGroup_Empty("splitshipyards"..i) == 0 then	
											  if SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard_g") == 1 then
													if SobGroup_GetHardPointHealth("splitshipyards"..i, "boost1") > 0 then		 
														SobGroup_SetHardPointHealth("splitshipyards"..i, "boost1", 0)	        
													end	
													if SobGroup_GetHardPointHealth("splitshipyards"..i, "boost2") > 0 then		 
														SobGroup_SetHardPointHealth("splitshipyards"..i, "boost2", 0)	        
													end	
													if SobGroup_GetHardPointHealth("splitshipyards"..i, "boost3") > 0 then		 
														SobGroup_SetHardPointHealth("splitshipyards"..i, "boost3", 0)	        
													end	
													if SobGroup_GetHardPointHealth("splitshipyards"..i, "hgn_orders_solarshield") > 0 then		 
														SobGroup_SetHardPointHealth("splitshipyards"..i, "hgn_orders_solarshield", 0)	        
													end	
													if SobGroup_GetHardPointHealth("splitshipyards"..i, "hgn_orders_remotespaceshield") > 0 then		 
														SobGroup_SetHardPointHealth("splitshipyards"..i, "hgn_orders_remotespaceshield", 0)	        
													end		
	                      end 												
											end
										end
	                end								
									if ntrc > 0 then 
										for i = 0,ntrc - 1,1 do	
											if SobGroup_Empty("splitcontainers"..i) == 0 then	
											  if SobGroup_GetHardPointHealth("splitcontainers"..i, "engine_boost_container") > 0 then		 
													SobGroup_SetHardPointHealth("splitcontainers"..i, "engine_boost_container", 0)	        
												end	
											end
										end
	                end									
	              end						            
							else  
							  if SobGroup_OwnedBy("hgn_power"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 1, "OVERCHARGE None") 	
								end				
							end  
	            
						--powerup
							if SobGroup_GetHardPointHealth(("hgn_power"..z), "powerup_power") > 0 then
								if Player_HasResearch(SobGroup_OwnedBy("hgn_power"..z), "isai" ) == 0 then
									SobGroup_TakeDamage("hgn_power"..z, 0.03*Temp_GlobalVariable.Selected_NextInterval)
								end
							end		
			  	    
						end				
							    
						--x ui
						multiplierbuild = floor((multiplier-0.5)*140)
						multiplierspeed = floor((multiplier-0.5)*40)
						--interface
						if z == playerIndex and ((year==0 and gametime<55) or year>0 or intro==1) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..floor(powerList[z+1])); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..floor(powerListMax[z+1]));
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));
	            UI_SetTextLabelText("EnergyMenu", "lblbuild", ""..floor(powerListManager[z+1].build)); 
							UI_SetTextLabelText("EnergyMenu", "lblsensor", ""..floor(powerListManager[z+1].sensor)); 
							UI_SetTextLabelText("EnergyMenu", "lblmove", ""..floor(powerListManager[z+1].move)); 
							UI_SetTextLabelText("EnergyMenu", "lblattack", ""..floor(powerListManager[z+1].attack)); 
							UI_SetTextLabelText("EnergyMenu", "lblhyperspace", ""..floor(powerListManager[z+1].hyperspace)); 
							UI_SetTextLabelText("EnergyMenu", "lbldefensefield", ""..floor(powerListManager[z+1].defensefield));  	
							UI_SetTextLabelText("EnergyMenu", "lblcloak", ""..floor(powerListManager[z+1].cloak)); 
							UI_SetTextLabelText("EnergyMenu", "lblspace", ""..floor(powerListManager[z+1].space)); 
							UI_SetTextLabelText("EnergyMenu", "lblfusion", ""..floor(powerListManager[z+1].fusion)); 
							UI_SetTextLabelText("EnergyMenu", "lblresearch", ""..floor(powerListManager[z+1].research)); 
							UI_SetTextLabelText("EnergyMenu", "lblmisc", ""..floor(powerListManager[z+1].misc)); 
	            UI_SetTextLabelText("EnergyMenu", "lblproduction", ""..floor(powerListManager[z+1].production)); 	
							UI_SetTextLabelText("EnergyMenu", "lblenergysummary", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));						
					    if multiplier >= 0.5 then						  		
	              UI_SetTextLabelText("EnergyMenu", "lblbuildrate", "+"..multiplierbuild .. "%");															 
								UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", "+"..multiplierspeed .. "%");															
							elseif multiplier < 0.5 then						  
							  UI_SetTextLabelText("EnergyMenu", "lblbuildrate", ""..multiplierbuild .. "%");								  
							  UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", ""..multiplierspeed .. "%");										
							end								
							--bar
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end
	
					--Vaygr	    
				  elseif Player_GetRace(z) == Race_Vaygr then
					    
						if Player_HasResearch(z, "energyproduction10" ) == 1 then
							powerList[z+1] = powerList[z+1]+(4*10) 
							powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*10))
							powerListMax[z+1] = powerListMax[z+1]+(100*10)           
						elseif Player_HasResearch(z, "energyproduction9" ) == 1 then
							powerList[z+1] = powerList[z+1]+(4*9) 
							powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*9))
							powerListMax[z+1] = powerListMax[z+1]+(100*9)         
						elseif Player_HasResearch(z, "energyproduction8" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*8) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*8))
							powerListMax[z+1] = powerListMax[z+1]+(100*8)     
						elseif Player_HasResearch(z, "energyproduction7" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*7) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*7))
							powerListMax[z+1] = powerListMax[z+1]+(100*7)     
						elseif Player_HasResearch(z, "energyproduction6" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*6) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*6))
							powerListMax[z+1] = powerListMax[z+1]+(100*6)     
						elseif Player_HasResearch(z, "energyproduction5" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*5) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*5))
							powerListMax[z+1] = powerListMax[z+1]+(100*5)     
						elseif Player_HasResearch(z, "energyproduction4" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*4) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*4))
							powerListMax[z+1] = powerListMax[z+1]+(100*4)     
						elseif Player_HasResearch(z, "energyproduction3" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*3) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*3))
							powerListMax[z+1] = powerListMax[z+1]+(100*3)     
						elseif Player_HasResearch(z, "energyproduction2" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*2) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*2))
							powerListMax[z+1] = powerListMax[z+1]+(100*2)     
						elseif Player_HasResearch(z, "energyproduction1" ) == 1 then	
						  powerList[z+1] = powerList[z+1]+(4*1) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*1))
							powerListMax[z+1] = powerListMax[z+1]+(100*1)   
	          else
	            powerList[z+1] = powerList[z+1]+(4*0) 
	            powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*0))
							powerListMax[z+1] = powerListMax[z+1]+(100*0)  					
						end
					
					  if powerList[z+1] < -99 then
				      powerList[z+1] = -99
				    end   
				    if powerList[z+1] > 99 then
				      powerList[z+1] = 99
				    end     
				  
				    --aumenta il totale di energia 
				    powerListStored[z+1] = powerListStored[z+1] + powerList[z+1]
						if powerListStored[z+1] < 0 then
						  powerListStored[z+1] = 0	  
						end 
						if powerListStored[z+1] >= powerListMax[z+1] then
						  powerListStored[z+1] = powerListMax[z+1]
						end   					
						
						if z == Universe_CurrentPlayer() and ((year==0 and gametime<55) or year>0) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..powerList[z+1]); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..powerListMax[z+1]);
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..powerList[z+1].."/"..powerListStored[z+1].."/"..powerListMax[z+1]);  
					    
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end  
					  
					  --setta l'effetto dell'energia su sottosistema/flotta
					  multiplier = powerListStored[z+1]/2000
					  
					  --serve per settaggio custom
					  multiplier = multiplier*energysensitivity
					  
					  if multiplier < 0 then
					    multiplier = 0
					  end
					  if multiplier > 1 then
					    multiplier = 1
					  end	  
				    if Player_HasResearch(SobGroup_OwnedBy("supporter"..z), "isai" ) == 0 then
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", multiplier)			      
				    else
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", 0.5)
				    end    
	
						--x ui
						multiplierbuild = floor((multiplier-0.5)*140)
						multiplierspeed = floor((multiplier-0.5)*40)
	          --interface					
						if z == playerIndex and ((year==0 and gametime<55) or year>0 or intro==1) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..floor(powerList[z+1])); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..floor(powerListMax[z+1]));
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));
	            UI_SetTextLabelText("EnergyMenu", "lblbuild", ""..floor(powerListManager[z+1].build)); 
							UI_SetTextLabelText("EnergyMenu", "lblsensor", ""..floor(powerListManager[z+1].sensor)); 
							UI_SetTextLabelText("EnergyMenu", "lblmove", ""..floor(powerListManager[z+1].move)); 
							UI_SetTextLabelText("EnergyMenu", "lblattack", ""..floor(powerListManager[z+1].attack)); 
							UI_SetTextLabelText("EnergyMenu", "lblhyperspace", ""..floor(powerListManager[z+1].hyperspace)); 
							UI_SetTextLabelText("EnergyMenu", "lbldefensefield", ""..floor(powerListManager[z+1].defensefield));  	
							UI_SetTextLabelText("EnergyMenu", "lblcloak", ""..floor(powerListManager[z+1].cloak)); 
							UI_SetTextLabelText("EnergyMenu", "lblspace", ""..floor(powerListManager[z+1].space)); 
							UI_SetTextLabelText("EnergyMenu", "lblfusion", ""..floor(powerListManager[z+1].fusion)); 
							UI_SetTextLabelText("EnergyMenu", "lblresearch", ""..floor(powerListManager[z+1].research)); 
							UI_SetTextLabelText("EnergyMenu", "lblmisc", ""..floor(powerListManager[z+1].misc)); 
	            UI_SetTextLabelText("EnergyMenu", "lblproduction", ""..floor(powerListManager[z+1].production)); 	
							UI_SetTextLabelText("EnergyMenu", "lblenergysummary", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));						
					    if multiplier >= 0.5 then						  		
	              UI_SetTextLabelText("EnergyMenu", "lblbuildrate", "+"..multiplierbuild .. "%");															 
								UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", "+"..multiplierspeed .. "%");															
							elseif multiplier < 0.5 then						  
							  UI_SetTextLabelText("EnergyMenu", "lblbuildrate", ""..multiplierbuild .. "%");								  
							  UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", ""..multiplierspeed .. "%");										
							end			
							--bar
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end
	
	--Kadeshi
				  elseif Player_GetRace(z) == Race_Kadeshi then
					    
						if Player_HasResearch(z, "energyproduction10" ) == 1 then
							powerList[z+1] = powerList[z+1]+(4*10) 
							powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*10))
							powerListMax[z+1] = powerListMax[z+1]+(100*10)           
						elseif Player_HasResearch(z, "energyproduction9" ) == 1 then
							powerList[z+1] = powerList[z+1]+(4*9) 
							powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*9))
							powerListMax[z+1] = powerListMax[z+1]+(100*9)         
						elseif Player_HasResearch(z, "energyproduction8" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*8) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*8))
							powerListMax[z+1] = powerListMax[z+1]+(100*8)     
						elseif Player_HasResearch(z, "energyproduction7" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*7) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*7))
							powerListMax[z+1] = powerListMax[z+1]+(100*7)     
						elseif Player_HasResearch(z, "energyproduction6" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*6) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*6))
							powerListMax[z+1] = powerListMax[z+1]+(100*6)     
						elseif Player_HasResearch(z, "energyproduction5" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*5) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*5))
							powerListMax[z+1] = powerListMax[z+1]+(100*5)     
						elseif Player_HasResearch(z, "energyproduction4" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*4) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*4))
							powerListMax[z+1] = powerListMax[z+1]+(100*4)     
						elseif Player_HasResearch(z, "energyproduction3" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*3) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*3))
							powerListMax[z+1] = powerListMax[z+1]+(100*3)     
						elseif Player_HasResearch(z, "energyproduction2" ) == 1 then
						  powerList[z+1] = powerList[z+1]+(4*2) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*2))
							powerListMax[z+1] = powerListMax[z+1]+(100*2)     
						elseif Player_HasResearch(z, "energyproduction1" ) == 1 then	
						  powerList[z+1] = powerList[z+1]+(4*1) 
						  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*1))
							powerListMax[z+1] = powerListMax[z+1]+(100*1)   
	          else
	            powerList[z+1] = powerList[z+1]+(4*0) 
	            powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*0))
							powerListMax[z+1] = powerListMax[z+1]+(100*0)  					
						end
					
					  if powerList[z+1] < -99 then
				      powerList[z+1] = -99
				    end   
				    if powerList[z+1] > 99 then
				      powerList[z+1] = 99
				    end     
				  
				    --aumenta il totale di energia 
				    powerListStored[z+1] = powerListStored[z+1] + powerList[z+1]
						if powerListStored[z+1] < 0 then
						  powerListStored[z+1] = 0	  
						end 
						if powerListStored[z+1] >= powerListMax[z+1] then
						  powerListStored[z+1] = powerListMax[z+1]
						end   					
						
						if z == Universe_CurrentPlayer() and ((year==0 and gametime<55) or year>0) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..powerList[z+1]); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..powerListMax[z+1]);
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..powerList[z+1].."/"..powerListStored[z+1].."/"..powerListMax[z+1]);  
					    
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end  
					  
					  --setta l'effetto dell'energia su sottosistema/flotta
					  multiplier = powerListStored[z+1]/2000
					  
					  --serve per settaggio custom
					  multiplier = multiplier*energysensitivity
					  
					  if multiplier < 0 then
					    multiplier = 0
					  end
					  if multiplier > 1 then
					    multiplier = 1
					  end	  
				    if Player_HasResearch(SobGroup_OwnedBy("supporter"..z), "isai" ) == 0 then
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", multiplier)			      
				    else
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", 0.5)
				    end
				    
						--x ui
						multiplierbuild = floor((multiplier-0.5)*140)
						multiplierspeed = floor((multiplier-0.5)*40)
	          --interface					
						if z == playerIndex and ((year==0 and gametime<55) or year>0 or intro==1) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..floor(powerList[z+1])); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..floor(powerListMax[z+1]));
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));
	            UI_SetTextLabelText("EnergyMenu", "lblbuild", ""..floor(powerListManager[z+1].build)); 
							UI_SetTextLabelText("EnergyMenu", "lblsensor", ""..floor(powerListManager[z+1].sensor)); 
							UI_SetTextLabelText("EnergyMenu", "lblmove", ""..floor(powerListManager[z+1].move)); 
							UI_SetTextLabelText("EnergyMenu", "lblattack", ""..floor(powerListManager[z+1].attack)); 
							UI_SetTextLabelText("EnergyMenu", "lblhyperspace", ""..floor(powerListManager[z+1].hyperspace)); 
							UI_SetTextLabelText("EnergyMenu", "lbldefensefield", ""..floor(powerListManager[z+1].defensefield));  	
							UI_SetTextLabelText("EnergyMenu", "lblcloak", ""..floor(powerListManager[z+1].cloak)); 
							UI_SetTextLabelText("EnergyMenu", "lblspace", ""..floor(powerListManager[z+1].space)); 
							UI_SetTextLabelText("EnergyMenu", "lblfusion", ""..floor(powerListManager[z+1].fusion)); 
							UI_SetTextLabelText("EnergyMenu", "lblresearch", ""..floor(powerListManager[z+1].research)); 
							UI_SetTextLabelText("EnergyMenu", "lblmisc", ""..floor(powerListManager[z+1].misc)); 
	            UI_SetTextLabelText("EnergyMenu", "lblproduction", ""..floor(powerListManager[z+1].production)); 	
							UI_SetTextLabelText("EnergyMenu", "lblenergysummary", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));						
					    if multiplier >= 0.5 then						  		
	              UI_SetTextLabelText("EnergyMenu", "lblbuildrate", "+"..multiplierbuild .. "%");															 
								UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", "+"..multiplierspeed .. "%");															
							elseif multiplier < 0.5 then						  
							  UI_SetTextLabelText("EnergyMenu", "lblbuildrate", ""..multiplierbuild .. "%");								  
							  UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", ""..multiplierspeed .. "%");										
							end			
							--bar
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end
	
	--Raider
				  elseif Player_GetRace(z) == Race_Raider then
					    
					  --No power without power plant
					  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(z, "rad_powerstation") > 0 then
							if Player_HasResearch(z, "energyproduction10" ) == 1 then
								powerList[z+1] = powerList[z+1]+(4*10) 
								powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*10))
								powerListMax[z+1] = powerListMax[z+1]+(100*10)           
							elseif Player_HasResearch(z, "energyproduction9" ) == 1 then
								powerList[z+1] = powerList[z+1]+(4*9) 
								powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*9))
								powerListMax[z+1] = powerListMax[z+1]+(100*9)         
							elseif Player_HasResearch(z, "energyproduction8" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*8) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*8))
								powerListMax[z+1] = powerListMax[z+1]+(100*8)     
							elseif Player_HasResearch(z, "energyproduction7" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*7) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*7))
								powerListMax[z+1] = powerListMax[z+1]+(100*7)     
							elseif Player_HasResearch(z, "energyproduction6" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*6) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*6))
								powerListMax[z+1] = powerListMax[z+1]+(100*6)     
							elseif Player_HasResearch(z, "energyproduction5" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*5) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*5))
								powerListMax[z+1] = powerListMax[z+1]+(100*5)     
							elseif Player_HasResearch(z, "energyproduction4" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*4) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*4))
								powerListMax[z+1] = powerListMax[z+1]+(100*4)     
							elseif Player_HasResearch(z, "energyproduction3" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*3) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*3))
								powerListMax[z+1] = powerListMax[z+1]+(100*3)     
							elseif Player_HasResearch(z, "energyproduction2" ) == 1 then
							  powerList[z+1] = powerList[z+1]+(4*2) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*2))
								powerListMax[z+1] = powerListMax[z+1]+(100*2)     
							elseif Player_HasResearch(z, "energyproduction1" ) == 1 then	
							  powerList[z+1] = powerList[z+1]+(4*1) 
							  powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*1))
								powerListMax[z+1] = powerListMax[z+1]+(100*1)   
		          else
		            powerList[z+1] = powerList[z+1]+(4*0) 
		            powerListManager[z+1].production = floor(powerListManager[z+1].production+(4*0))
								powerListMax[z+1] = powerListMax[z+1]+(100*0)  					
							end
							--General Black Hand
				    	if Rad_GeneralList.General[z+1] == 5 and Rad_GeneralList.Rank[z+1] > 0 then
				    		local powerboost = (1/6)*Rad_GeneralList.Rank[z+1]
		            powerList[z+1] = floor(powerList[z+1]*(1+powerboost))
		            powerListManager[z+1].production = floor(powerListManager[z+1].production*(1+powerboost))
				    	end
						else
							if GameRulesName ~= "Simplex Sole Survivor" then
								powerList[z+1] = powerList[z+1]-(4*1) 
								powerListManager[z+1].production = floor(powerListManager[z+1].production-(4*1))
								powerListMax[z+1] = powerListMax[z+1]-(100*10)
							end
						end
					
					  if powerList[z+1] < -99 then
				      powerList[z+1] = -99
				    end   
				    if powerList[z+1] > 99 then
				      powerList[z+1] = 99
				    end     
				  
				    --aumenta il totale di energia 
				    powerListStored[z+1] = powerListStored[z+1] + powerList[z+1]
						if powerListStored[z+1] < 0 then
						  powerListStored[z+1] = 0	  
						end 
						if powerListStored[z+1] >= powerListMax[z+1] then
						  powerListStored[z+1] = powerListMax[z+1]
						end   					
						
						if z == Universe_CurrentPlayer() and ((year==0 and gametime<55) or year>0) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..powerList[z+1]); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..powerListMax[z+1]);
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..powerList[z+1].."/"..powerListStored[z+1].."/"..powerListMax[z+1]);  
					    
					    for i = 1,21,1 do
					    	if powerListMax[z+1] ~= 0 then
						      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
						        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)
						      else
						        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0)
						      end
						    else
						    	UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0)
						    end
					    end			    
					  end  
					  
					  --setta l'effetto dell'energia su sottosistema/flotta
					  multiplier = powerListStored[z+1]/2000
					  
					  --serve per settaggio custom
					  multiplier = multiplier*energysensitivity
					  
					  if multiplier < 0 then
					    multiplier = 0
					  end
					  if multiplier > 1 then
					    multiplier = 1
					  end	  
				    if Player_HasResearch(SobGroup_OwnedBy("supporter"..z), "isai" ) == 0 then
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", multiplier)			      
				    else
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", 0.5)
				    end
	
					--ping				  
					  if SobGroup_Count("rad_powerstation"..z) > 0 then	
					    if SobGroup_OwnedBy("rad_powerstation"..z) == Universe_CurrentPlayer() then	
						    g = Ping_AddSobGroup("Made In China ", "energy", "rad_powerstation"..z)
								Ping_LabelVisible(g, 1)		
								Ping_AddDescription(g, 0, "Energy " .. powerList[z+1] .. "/" .. powerListStored[z+1] .. "/" .. powerListMax[z+1])
							end	
							if multiplier >= 0.5 then
							  multiplierbuild = floor((multiplier-0.5)*150)
							  if SobGroup_OwnedBy("rad_powerstation"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 2, "Build Speed +" .. multiplierbuild .. "%") 
								end	
								multiplierspeed = floor((multiplier-0.5)*50)
								if SobGroup_OwnedBy("rad_powerstation"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 3, "Navigation/Attack +" .. multiplierspeed .. "%")  
								end									
							elseif multiplier < 0.5 then
							  multiplierbuild = floor((0.5-multiplier)*150)
							  if SobGroup_OwnedBy("rad_powerstation"..z) == Universe_CurrentPlayer() then
							  	Ping_AddDescription(g, 2, "Build Speed -" .. multiplierbuild .. "%")		
							  end	
							  multiplierspeed = floor((0.5-multiplier)*50)
							  if SobGroup_OwnedBy("rad_powerstation"..z) == Universe_CurrentPlayer() then
									Ping_AddDescription(g, 3, "Navigation/Attack -" .. multiplierspeed .. "%")	
								end								
							end
						end
	
						--x ui
						multiplierbuild = floor((multiplier-0.5)*140)
						multiplierspeed = floor((multiplier-0.5)*40)
	          --interface					
						if z == playerIndex and ((year==0 and gametime<55) or year>0 or intro==1) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..floor(powerList[z+1])); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..floor(powerListMax[z+1]));
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));
	            UI_SetTextLabelText("EnergyMenu", "lblbuild", ""..floor(powerListManager[z+1].build)); 
							UI_SetTextLabelText("EnergyMenu", "lblsensor", ""..floor(powerListManager[z+1].sensor)); 
							UI_SetTextLabelText("EnergyMenu", "lblmove", ""..floor(powerListManager[z+1].move)); 
							UI_SetTextLabelText("EnergyMenu", "lblattack", ""..floor(powerListManager[z+1].attack)); 
							UI_SetTextLabelText("EnergyMenu", "lblhyperspace", ""..floor(powerListManager[z+1].hyperspace)); 
							UI_SetTextLabelText("EnergyMenu", "lbldefensefield", ""..floor(powerListManager[z+1].defensefield));  	
							UI_SetTextLabelText("EnergyMenu", "lblcloak", ""..floor(powerListManager[z+1].cloak)); 
							UI_SetTextLabelText("EnergyMenu", "lblspace", ""..floor(powerListManager[z+1].space)); 
							UI_SetTextLabelText("EnergyMenu", "lblfusion", ""..floor(powerListManager[z+1].fusion)); 
							UI_SetTextLabelText("EnergyMenu", "lblresearch", ""..floor(powerListManager[z+1].research)); 
							UI_SetTextLabelText("EnergyMenu", "lblmisc", ""..floor(powerListManager[z+1].misc)); 
	            UI_SetTextLabelText("EnergyMenu", "lblproduction", ""..floor(powerListManager[z+1].production)); 	
							UI_SetTextLabelText("EnergyMenu", "lblenergysummary", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));						
					    if multiplier >= 0.5 then						  		
	              UI_SetTextLabelText("EnergyMenu", "lblbuildrate", "+"..multiplierbuild .. "%");															 
								UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", "+"..multiplierspeed .. "%");															
							elseif multiplier < 0.5 then						  
							  UI_SetTextLabelText("EnergyMenu", "lblbuildrate", ""..multiplierbuild .. "%");								  
							  UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", ""..multiplierspeed .. "%");										
							end
							--bar
					    for i = 1,21,1 do
					    	if powerListMax[z+1] ~= 0 then
						      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
						        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)
						      else
						        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0)
						      end
						    else
						    	UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0)
						    end
					    end			    
					  end
	
	--Keeper
					elseif Player_GetRace(z) == Race_Keeper then
						
						local num_generator = SobGroup_Count("kpr_ressourcecollector_old"..z)
						if num_generator > 9 then
							num_generator = 9
						end
						local energylevel = 0
						if num_generator > 0 then
							for i = 1,10,1 do
								if Player_HasResearch(z, "energyproduction"..i ) == 1 then
									energylevel = energylevel + 1
								end
							end
							powerList[z+1] = powerList[z+1]+(num_generator*(energylevel+1))
							powerListManager[z+1].production = floor(powerListManager[z+1].production+(num_generator*(energylevel+1)))
							powerListMax[z+1] = powerListMax[z+1]+(100*energylevel)
						end
	
				    if powerList[z+1] < -99 then
				      powerList[z+1] = -99
				    end   
				    if powerList[z+1] > 99 then
				      powerList[z+1] = 99
				    end     
				  
				    --aumenta il totale di energia 
				    powerListStored[z+1] = powerListStored[z+1] + powerList[z+1]
						if powerListStored[z+1] < 0 then
						  powerListStored[z+1] = 0
						end
						if powerListStored[z+1] >= powerListMax[z+1] then
						  powerListStored[z+1] = powerListMax[z+1]
						end
						
						if z == Universe_CurrentPlayer() and ((year==0 and gametime<55) or year>0) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..powerList[z+1]); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..powerListMax[z+1]);
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..powerList[z+1].."/"..powerListStored[z+1].."/"..powerListMax[z+1]);  
					    
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end
					    end			    
					  end  
					  
					  --setta l'effetto dell'energia su sottosistema/flotta
					  multiplier = powerListStored[z+1]/2000
					  
					  --serve per settaggio custom
					  multiplier = multiplier*energysensitivity
					  
					  if multiplier < 0 then
					    multiplier = 0
					  end
					  if multiplier > 1 then
					    multiplier = 1
					  end	  
				    if Player_HasResearch(SobGroup_OwnedBy("supporter"..z), "isai" ) == 0 then
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", multiplier)
				    else
				      SobGroup_SetHardPointHealth("supporter"..z, "energy", 0.5)
				    end
	
					--ping				  
					  if SobGroup_Count("kpr_ressourcecollector_old"..z) > 0 then	
					    if SobGroup_OwnedBy("kpr_ressourcecollector_old"..z) == Universe_CurrentPlayer() then
					    	local numships = SobGroup_SplitGroupReference("SinglePingKprGenerator_SOB", "kpr_ressourcecollector_old"..z, "utilities"..z, SobGroup_Count("kpr_ressourcecollector_old"..z))
								for counter = 0, numships - 1, 1 do
							    g = Ping_AddSobGroup("Input "..(counter+1), "energy", "SinglePingKprGenerator_SOB"..counter)
									Ping_LabelVisible(g, 1)		
									Ping_AddDescription(g, 0, "Energy " .. powerList[z+1] .. "/" .. powerListStored[z+1] .. "/" .. powerListMax[z+1])
									--convert energy into RUs when enery pool if full
									if powerListStored[z+1] >= powerListMax[z+1] then
										local conversion = 50*0.5*(resource+1)/(0.7*11/fusionfactor)
							    	if Player_HasResearch(z, "ExterminatorRuBonus") == 1 then
							    		conversion = conversion*1.15
							    	end
							    	local energysurplus = powerList[z+1]
							    	local ru = floor(conversion*energysurplus/numships)
							    	--Player_SetRU(z, Player_GetRU(z) + ru)
							    	--fusionList[z+1] = fusionList[z+1] + ru		--moved to fusion.lua because here it only works for the current player
							    	if ru > 0 then
							    		Ping_AddDescription(g, 1, "RUs: +"..ru)
							    	else
							    		Ping_AddDescription(g, 1, "RUs: None")
							    	end
							    else
						    		Ping_AddDescription(g, 1, "RUs: None")
						    	end
									if multiplier >= 0.5 then
									  multiplierbuild = floor((multiplier-0.5)*150)
									  if SobGroup_OwnedBy("kpr_ressourcecollector_old"..z) == Universe_CurrentPlayer() then
											Ping_AddDescription(g, 2, "Build Speed +" .. multiplierbuild .. "%") 
										end	
										multiplierspeed = floor((multiplier-0.5)*50)
										if SobGroup_OwnedBy("kpr_ressourcecollector_old"..z) == Universe_CurrentPlayer() then
											Ping_AddDescription(g, 3, "Navigation/Attack +" .. multiplierspeed .. "%")  
										end									
									elseif multiplier < 0.5 then
									  multiplierbuild = floor((0.5-multiplier)*150)
									  if SobGroup_OwnedBy("kpr_ressourcecollector_old"..z) == Universe_CurrentPlayer() then
									  	Ping_AddDescription(g, 2, "Build Speed -" .. multiplierbuild .. "%")		
									  end	
									  multiplierspeed = floor((0.5-multiplier)*50)
									  if SobGroup_OwnedBy("kpr_ressourcecollector_old"..z) == Universe_CurrentPlayer() then
											Ping_AddDescription(g, 3, "Navigation/Attack -" .. multiplierspeed .. "%")	
										end								
									end
								end
							end	
						end
	
						--x ui
						multiplierbuild = floor((multiplier-0.5)*140)
						multiplierspeed = floor((multiplier-0.5)*40)
	          --interface					
						if z == playerIndex and ((year==0 and gametime<55) or year>0 or intro==1) then   					  
					    UI_SetTextLabelText("ResourceMenu", "powerList", ""..floor(powerList[z+1])); 
					    UI_SetTextLabelText("ResourceMenu", "powerListMax", ""..floor(powerListMax[z+1]));
					    UI_SetTextLabelText("UnitCapInfoPopup", "energy", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));
	            UI_SetTextLabelText("EnergyMenu", "lblbuild", ""..floor(powerListManager[z+1].build)); 
							UI_SetTextLabelText("EnergyMenu", "lblsensor", ""..floor(powerListManager[z+1].sensor)); 
							UI_SetTextLabelText("EnergyMenu", "lblmove", ""..floor(powerListManager[z+1].move)); 
							UI_SetTextLabelText("EnergyMenu", "lblattack", ""..floor(powerListManager[z+1].attack)); 
							UI_SetTextLabelText("EnergyMenu", "lblhyperspace", ""..floor(powerListManager[z+1].hyperspace)); 
							UI_SetTextLabelText("EnergyMenu", "lbldefensefield", ""..floor(powerListManager[z+1].defensefield));  	
							UI_SetTextLabelText("EnergyMenu", "lblcloak", ""..floor(powerListManager[z+1].cloak)); 
							UI_SetTextLabelText("EnergyMenu", "lblspace", ""..floor(powerListManager[z+1].space)); 
							UI_SetTextLabelText("EnergyMenu", "lblfusion", ""..floor(powerListManager[z+1].fusion)); 
							UI_SetTextLabelText("EnergyMenu", "lblresearch", ""..floor(powerListManager[z+1].research)); 
							UI_SetTextLabelText("EnergyMenu", "lblmisc", ""..floor(powerListManager[z+1].misc)); 
	            UI_SetTextLabelText("EnergyMenu", "lblproduction", ""..floor(powerListManager[z+1].production)); 	
							UI_SetTextLabelText("EnergyMenu", "lblenergysummary", ""..floor(powerList[z+1]).."/"..floor(powerListStored[z+1]).."/"..floor(powerListMax[z+1]));						
					    if multiplier >= 0.5 then						  		
	              UI_SetTextLabelText("EnergyMenu", "lblbuildrate", "+"..multiplierbuild .. "%");															 
								UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", "+"..multiplierspeed .. "%");															
							elseif multiplier < 0.5 then						  
							  UI_SetTextLabelText("EnergyMenu", "lblbuildrate", ""..multiplierbuild .. "%");								  
							  UI_SetTextLabelText("EnergyMenu", "lblnavigationattack", ""..multiplierspeed .. "%");										
							end
							--bar
					    for i = 1,21,1 do
					      if powerListStored[z+1] >= (powerListMax[z+1]/21)*i then
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 1)   
					      else
					        UI_SetElementVisible("ResourceMenu", "FrameEnergyLevel_"..i, 0) 
					      end  
					    end			    
					  end
	
				  end  	--end getrace
					
					--serve per display taskbar power station e computerspy
					LastpowerList[z+1] = powerList[z+1]			
					LastpowerListStored[z+1] = powerListStored[z+1]
					LastpowerListMax[z+1] = powerListMax[z+1]					
					--default
					powerList[z+1] = 4 
					powerListMax[z+1] = 1000				
	        --UI energy manager	        		    				
	        powerListManager[z+1].build = 0	        
	        powerListManager[z+1].sensor = 0        
	        powerListManager[z+1].move = 0
	        powerListManager[z+1].attack = 0 
	        powerListManager[z+1].hyperspace = 0	
	        powerListManager[z+1].defensefield = 0
	        powerListManager[z+1].cloak = 0
	        powerListManager[z+1].space = 0
	        powerListManager[z+1].fusion = 0
	        powerListManager[z+1].research = 0         
	        powerListManager[z+1].misc = 0 	
	        powerListManager[z+1].production = 4		
				end  --end if alive
			end  --end for    
			
			hwsaving = 0  
	  end   

	end

	if Temp_GlobalVariable.enablebtnparade[playerIndexList] > 0 then
		enablebtnparade = 1
	else
		enablebtnparade = 0
	end
	if Temp_GlobalVariable.enablebtncallisto[playerIndexList] > 0 then
	  enablebtncallisto = 1
	else
		enablebtncallisto = 0
	end
	if Temp_GlobalVariable.enablebtnperforate[playerIndexList] > 0 then
		enablebtnperforate = 1
	else
		enablebtnperforate = 0
	end
	if Temp_GlobalVariable.enablebtnheavyioncannon[playerIndexList] > 0 then
	  enablebtnheavyioncannon = 1
	else
		enablebtnheavyioncannon = 0
	end
	if Temp_GlobalVariable.enablebtnnuclear[playerIndexList] > 0 then
	  enablebtnnuclear = 1
	else
		enablebtnnuclear = 0
	end

  if enablebtnparade == 1 then
    UI_SetElementEnabled("NewTaskbar", "btnParade", 1)
  else
    UI_SetElementEnabled("NewTaskbar", "btnParade", 0)
  end
  
  if enablebtncallisto == 1 then
    UI_SetElementEnabled("NewTaskbar", "btnCallisto", 1)
  else
    UI_SetElementEnabled("NewTaskbar", "btnCallisto", 0)
  end  
  
  if enablebtnperforate == 1 then
    UI_SetElementEnabled("NewTaskbar", "btnPerforate", 1)
  else
    UI_SetElementEnabled("NewTaskbar", "btnPerforate", 0)
  end
  
  if enablebtnheavyioncannon == 1 then
    UI_SetElementEnabled("NewTaskbar", "btnHeavyIonCannon", 1)
  else
    UI_SetElementEnabled("NewTaskbar", "btnHeavyIonCannon", 0)
  end
  
  if enablebtnnuclear == 1 then
    UI_SetElementEnabled("NewTaskbar", "btnNuclear", 1)
  else
    UI_SetElementEnabled("NewTaskbar", "btnNuclear", 0)
  end
	
	--serve per pulire selezione sottosistemi se non c'?nulla di selezionato
	if interfacecleaned > 0 then
		interfacecleanedtot[playerIndexList] = Temp_GlobalVariable.Selected_Save
	end
	
	if SobGroup_Empty("star_sol") == 0 then
		if interfacecleaned > 1 then 
			UI_SetTextLabelText("New1", "sundamagetextred", "---K");
			UI_SetTextLabelText("New1", "sundamagetextblu", "---K");
			UI_SetTextLabelText("New1", "sundamagetext", "---K");	
		end	
	end
	
---Fleet Selector-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	
	local selectorList = { 30, 60, 90, 120, 150, 180, 210, 240, 270 } 	  
	SobGroup_Clear("selector"..playerIndex)    

---solo se selector ?attivo	
	if (UI_IsScreenActive("selector") == 1) or (gametime == 98 and year == 0) then	
---se il giocatore ha il bottone refresh attivato allora clear la selezione attuale		
		local bloccorefresh = 0
		if UI_IsScreenActive("refresh") == 1 then
		  bloccorefresh = 1
		end	  		    	  

		--only one player can be selected at one time
		local controledplayer = 0
		local PlayerSelected = playerIndex
		local PlayerTemp = 0
		local lastSelect = lastselectedplayer[playerIndexList] + 1
		local vocalize = 0
		for i=1,6,1 do
			if UI_IsNamedElementVisible("selector", "selectplayer"..i) == 1 then
				controledplayer = controledplayer + 1
				PlayerTemp = i-1
				if i ~= lastSelect then
					UI_SetButtonPressed("selector", "controlplayer"..lastSelect, 0)
					UI_SetButtonPressed("selector", "controlplayer"..i, 1)
					lastselectedplayer[playerIndexList] = PlayerTemp
					vocalize = 1
				end
			end
		end
		if controledplayer == 0 then
			if Player_IsAlive(playerIndex) == 1 then
				if UI_IsNamedElementVisible("selector", "controlplayer"..playerIndexList) == 1 then
					UI_SetButtonPressed("selector", "controlplayer"..playerIndexList, 1)
					lastselectedplayer[playerIndexList] = playerIndex
				end
			end
		elseif controledplayer == 1 then
			PlayerSelected = PlayerTemp
			if vocalize == 1 then
				UI_PlaySound("SFX_"..PlayerSelected+1)
				if Player_IsAlive(playerIndex) == 1 then
					if PlayerSelected == playerIndex then
			    	Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>Selecting from own fleet</c>",3.72)
			    else
			    	Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>Selecting from </c>"..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s fleet</c>",2.711)
			    end
			  else
			  	Subtitle_Add(Actor_Keeper,"<c=fad610>Selecting from </c>"..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s fleet</c>", 2.711)
			  end
			end
		else
			print("Multiple players under selection: "..controledplayer..", selector set to default mode")
			for i=1,6,1 do
				if UI_IsNamedElementVisible("selector", "selectplayer"..i) == 1 then
					UI_SetButtonPressed("selector", "controlplayer"..i, 0)
				end
			end
		end
		if controledplayer == 1 and Player_IsAlive(playerIndex) == 0 then		--after saving and loading, press a button by default
			if lastselectedplayer[playerIndexList] ~= playerIndex and UI_IsNamedElementVisible("selector", "selectplayer"..(lastselectedplayer[playerIndexList] + 1)) == 1 then
				UI_SetButtonPressed("selector", "controlplayer"..(lastselectedplayer[playerIndexList] + 1), 1)
			end
		end
		Haxor_CurrentSelectedPlayer[playerIndexList] = PlayerSelected		--this can be called in other functions, such as Accolade Stats
		--disable buttons for dead players
		for i=1,Universe_PlayerCount(),1 do
			if Player_IsAlive(i-1) == 0 then
				UI_SetButtonPressed("selector", "controlplayer"..i, 0)
				UI_SetElementSize("selector", "controlplayer"..i, 0, 0)
				UI_SetElementVisible("selector", "controlplayer"..i, 0)
				UI_SetElementEnabled("selector", "controlplayer"..i, 0)
				UI_SetElementVisible("selector", "selectplayer"..i, 0)
				UI_SetElementEnabled("selector", "selectplayer"..i, 0)
			end
		end
		--disable buttons for non-existing players
		if Universe_PlayerCount() < 6 then
			for i=Universe_PlayerCount()+1,6,1 do
				UI_SetButtonPressed("selector", "controlplayer"..i, 0)
				UI_SetElementSize("selector", "controlplayer"..i, 0, 0)
				UI_SetElementVisible("selector", "controlplayer"..i, 0)
				UI_SetElementEnabled("selector", "controlplayer"..i, 0)
				UI_SetElementVisible("selector", "selectplayer"..i, 0)
				UI_SetElementEnabled("selector", "selectplayer"..i, 0)
			end
		end
		--give icons labels
		for i=1,Universe_PlayerCount(),1 do
			if UI_IsNamedElementVisible("selector", "controlplayer"..i) == 1 then
				if i-1 == playerIndex then
					UI_SetTextLabelText("selector", "controlplayer"..i.."label", "<c=00ff40>Self</c>")	--00ff00
				elseif AreAllied(playerIndex, i-1) == 1 then
					UI_SetTextLabelText("selector", "controlplayer"..i.."label", "<c=ffff00>Allied</c>")	--00aad4
				else
					UI_SetTextLabelText("selector", "controlplayer"..i.."label", "<c=ff0000>Enemy</c>")
				end
			end
		end
		
---aggiorna il x.. a destra in basso dell'icona	   	  
	  UpdateIcon("selector", "fighter" .. tostring("label"), fighter[PlayerSelected+1])	    
	  UpdateIcon("selector", "corvette" .. tostring("label"), corvette[PlayerSelected+1]) 
	  UpdateIcon("selector", "frigate" .. tostring("label"), frigate[PlayerSelected+1])  
	  UpdateIcon("selector", "platform" .. tostring("label"), platform[PlayerSelected+1])	  
	  UpdateIcon("selector", "capital" .. tostring("label"), capital[PlayerSelected+1])
	  UpdateIcon("selector", "armedcapital" .. tostring("label"), armedcapital[PlayerSelected+1])
	  UpdateIcon("selector", "utility" .. tostring("label"), utility[PlayerSelected+1])	  
	  UpdateIcon("selector", "weapon" .. tostring("label"), weapon[PlayerSelected+1])  
	  UpdateIcon("selector", "fleet" .. tostring("label"), pilotpopdisplayList[PlayerSelected+1])	  	
	  
---select
    if pilotpopdisplayList[PlayerSelected+1] > 0 and Player_IsAlive(PlayerSelected) == 1 then				  
		  
			
			--add ships to selection when refresh screen is activated
			if UI_IsScreenActive("refresh") == 1 then
				if UI_IsScreenActive("fighter") == 1 then
					if nfi[PlayerSelected+1] > 0 then
						for i = 0,(nfi[PlayerSelected+1]-1),1 do
							if CheckIfShipIsSelectable("splitfighters"..PlayerSelected .. tostring(i)) == 1 then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "splitfighters"..PlayerSelected .. tostring(i))
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("corvette") == 1 then
			    if nco[PlayerSelected+1] > 0 then
						for i = 0,(nco[PlayerSelected+1]-1),1 do
							if CheckIfShipIsSelectable("splitcorvettes"..PlayerSelected .. tostring(i)) == 1 then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "splitcorvettes"..PlayerSelected .. tostring(i))
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("frigate") == 1 then
			    if nf > 0 then
						for i = 0,nf-1,1 do
							if CheckIfShipIsSelectable("splitfrigates"..i) == 1 and SobGroup_OwnedBy("splitfrigates"..i) == PlayerSelected then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "splitfrigates"..i)
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("platform") == 1 then
			    if np > 0 then
						for i = 0,np-1,1 do
							if CheckIfShipIsSelectable("splitplatforms"..i) == 1 and SobGroup_OwnedBy("splitplatforms"..i) == PlayerSelected then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "splitplatforms"..i)
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("capital") == 1 then
			    if SobGroup_Empty("productioncapital"..PlayerSelected) == 0 then	
			    	local numships = SobGroup_SplitGroupReference("SingleSelectProductionCapital_SOB", "productioncapital"..PlayerSelected, "Player_Ships"..PlayerSelected, SobGroup_Count("productioncapital"..PlayerSelected))
						for i = 0, numships - 1, 1 do
							if CheckIfShipIsSelectable("SingleSelectProductionCapital_SOB"..i) == 1 then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "SingleSelectProductionCapital_SOB"..i)			    
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("armedcapital") == 1 then
			  	if SobGroup_Empty("smallcapitals"..PlayerSelected) == 0 then
			    	local numships = SobGroup_SplitGroupReference("SingleSelectArmedCapital_SOB", "smallcapitals"..PlayerSelected, "Player_Ships"..PlayerSelected, SobGroup_Count("smallcapitals"..PlayerSelected))
						for i = 0, numships - 1, 1 do
							if CheckIfShipIsSelectable("SingleSelectArmedCapital_SOB"..i) == 1 then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "SingleSelectArmedCapital_SOB"..i)			    
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("utility") == 1 then
			  	SobGroup_Create("SOB_PlayerUtilitiesToSelectFrom")
			  	SobGroup_Clear("SOB_PlayerUtilitiesToSelectFrom")
			  	SobGroup_SobGroupAdd("SOB_PlayerUtilitiesToSelectFrom", "utilities"..PlayerSelected)
			  	SobGroup_SobGroupAdd("SOB_PlayerUtilitiesToSelectFrom", "othersnoparade"..PlayerSelected)
			  	if SobGroup_Empty("SOB_PlayerUtilitiesToSelectFrom") == 0 then
			    	local numships = SobGroup_SplitGroupReference("SingleSelectUtility_SOB", "SOB_PlayerUtilitiesToSelectFrom", "Player_Ships"..PlayerSelected, SobGroup_Count("SOB_PlayerUtilitiesToSelectFrom"))
						for i = 0, numships - 1, 1 do
							if CheckIfShipIsSelectable("SingleSelectUtility_SOB"..i) == 1 then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "SingleSelectUtility_SOB"..i)			    
			    		end
			    	end
			    end
			  end
			  if UI_IsScreenActive("weapon") == 1 then
			    if nnb > 0 then
	    			for i = 0,nnb-1,1 do
							if CheckIfShipIsSelectable("splitnuclearbombs"..i) == 1 and SobGroup_OwnedBy("splitnuclearbombs"..i) == PlayerSelected then
			    			SobGroup_SobGroupAdd("selector"..playerIndex, "splitnuclearbombs"..i)
			    		end
			    	end
			    end
			  end

			end
			
		else			  
		  
		end	
			
    if bloccorefresh == 1 then
      SobGroup_SelectSobGroup("selector"..playerIndex)
      UI_PlaySound("SFX_allships")
	    UI_SetScreenVisible("refresh", 0) 	    
	  end  						  		
		
  --serve per starting fleet extra e fleet
    if (gametime == 98 and year == 0)	then
      --UI_SetScreenVisible("selector", 0)
    end	

---HAXOR!!!!!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		if GetGameRubric() == GR_MULTIPLAYER then
			if UI_IsScreenActive("haxor") == 1 then
				UI_SetScreenEnabled("haxor", 0)
			else
				UI_SetScreenEnabled("haxor", 1)
			end
		end
		if UI_IsScreenActive("haxor") == 1 and GetGameRubric() ~= GR_MULTIPLAYER then
			--kill select
			if UI_IsNamedElementVisible("haxor", "killselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_killselect"..playerIndex)
				if shipsNUM > 0 then
					SobGroup_SetHealth("haxor_killselect"..playerIndex, 0)
					--if Camera_GetDistanceToSobGroup("haxor_killselect"..playerIndex) < 12000 then
						if SobGroup_SobGroupCompare("haxor_killselect"..playerIndex, "productioncapitals") == 1 then
							UI_PlaySound("SFX_wtf")
						else
							UI_PlaySound("SFX_allahuakbar")
						end
					--end
					local targetidentity = "NICE HAX! Enemy "
					SobGroup_Create("CompareHaxorShips"..playerIndex)
					SobGroup_Clear("CompareHaxorShips"..playerIndex)
					SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_killselect"..playerIndex, "Player_Ships"..playerIndex)
					if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
						targetidentity = "O_____O! Own "
					else
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_killselect"..playerIndex, "allies"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "Dafaq! Friendly "
						end
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships blowed up: "..shipsNUM.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships blowed up: "..shipsNUM.."</c>",2.711)
				  end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "killselected", 0)
			end
			--heal select
			if UI_IsNamedElementVisible("haxor", "healselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_healselect"..playerIndex)
				if shipsNUM > 0 then
					SobGroup_SetHealth("haxor_healselect"..playerIndex, 1)
					--if Camera_GetDistanceToSobGroup("haxor_healselect"..playerIndex) < 12000 then
						UI_PlaySound("SFX_meow")
					--end
					local targetidentity = "What was that for? Enemy "
					SobGroup_Create("CompareHaxorShips"..playerIndex)
					SobGroup_Clear("CompareHaxorShips"..playerIndex)
					SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_healselect"..playerIndex, "Player_Ships"..playerIndex)
					if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
						targetidentity = "LONG LIVE HAX! Own "
					else
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_healselect"..playerIndex, "allies"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "Oh the humanity! Friendly "
						end
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships healed: "..shipsNUM.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships healed: "..shipsNUM.."</c>",2.711)
				  end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "healselected", 0)
			end
			--invincible select
			if UI_IsNamedElementVisible("haxor", "invincibleselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_invincibleselect"..playerIndex)
				if shipsNUM > 0 then
					SobGroup_SetInvulnerability("haxor_invincibleselect"..playerIndex, 1)
					SobGroup_SobGroupAdd("haxor_invincible"..playerIndex, "haxor_invincibleselect"..playerIndex)
					SobGroup_SetSwitchOwnerFlag("haxor_invincible"..playerIndex, 0)
					--if Camera_GetDistanceToSobGroup("haxor_invincibleselect"..playerIndex) < 12000 then
						UI_PlaySound("SFX_invincible")
					--end
					local targetidentity = "o__o!! Enemy "
					SobGroup_Create("CompareHaxorShips"..playerIndex)
					SobGroup_Clear("CompareHaxorShips"..playerIndex)
					SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_invincibleselect"..playerIndex, "Player_Ships"..playerIndex)
					if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
						targetidentity = "d(-_-)b Own "
					else
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_invincibleselect"..playerIndex, "allies"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "@__@! Friendly "
						end
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships set to invincible: "..shipsNUM.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships set to invincible: "..shipsNUM.."</c>",2.711)
				  end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "invincibleselected", 0)
			end
			--vincible select
			if UI_IsNamedElementVisible("haxor", "vincibleselected") == 1 then
				local shipsNUM = SobGroup_Count("haxor_invincible"..playerIndex)
				if shipsNUM > 0 then
					SobGroup_SetInvulnerability("haxor_invincible"..playerIndex, 0)
					--if Camera_GetDistanceToSobGroup("haxor_invincible"..playerIndex) < 12000 then
						UI_PlaySound("SFX_pig")
					--end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>Invincibility of ships undone: "..shipsNUM.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,"<c=fad610>Invincibility of ships undone: "..shipsNUM.."</c>",2.711)
				  end
				  SobGroup_Clear("haxor_invincible"..playerIndex)
				end
				UI_SetElementVisible("haxor", "vincibleselected", 0)
			end
			UI_SetTextLabelText("haxor", "vincibleselectlabel", "x"..SobGroup_Count("haxor_invincible"..playerIndex))
			--exiting hyperspace select
			if UI_IsNamedElementVisible("haxor", "hyperspaceoutselected") == 1 then
				local shipsNUM = SobGroup_Count("haxor_inhyperspace"..playerIndex) + SobGroup_Count("haxor_inhyperspace_debug"..playerIndex)
				if shipsNUM > 0 then		-- and SobGroup_AreAllInHyperspace("haxor_inhyperspace"..playerIndex) == 1
					--get camera location
					local attempt = 1
					local dummycount = 0
					local camera_dist = {0, 0, 0, 0}--镜头与镜头定位物的距离
					local camera_pos = {0, 0, 0}--镜头坐标
					local translation = {0, 0, 0}
					local dislocation = {
					{0, 0, 0},
					{100000, 0, 0},
					{0, 100000, 0},
					{0, 0, 100000},
					{-100000, 0, 0},
					{0, -100000, 0},
					{0, 0, -100000},
					{100000, 100000, 0},
					{0, 100000, 100000},
					{100000, 0, 100000},
					{-100000, -100000, 0},
					{0, -100000, -100000},
					{-100000, 0, -100000},
					{100000, -100000, 0},
					{0, 100000, -100000},
					{100000, 0, -100000},
					{-100000, 100000, 0},
					{0, -100000, 100000},
					{-100000, 0, 100000},
					{100000, 100000, 100000},
					{-100000, -100000, -100000},
					{-100000, 100000, 100000},
					{100000, -100000, 100000},
					{100000, 100000, -100000},
					{-100000, -100000, 100000},
					{100000, -100000, -100000},
					{-100000, 100000, -100000},
					}
					for i = 1, 4 do
						SobGroup_Create("sg_haxor_Sat"..i..playerIndex)
					end
					while attempt <= 27 and dummycount ~= 4 do		--attempt to place the dummy objects for several times if failed
						for i = 1, 3 do
							translation[i] = dislocation[attempt][i]
						end
						Volume_AddSphere("vol_haxor_Sat1"..playerIndex, {0+translation[1], 0+translation[2], 0+translation[3]}, 30)
						Volume_AddSphere("vol_haxor_Sat2"..playerIndex, {1000000+translation[1], 0+translation[2], 0+translation[3]}, 30)
						Volume_AddSphere("vol_haxor_Sat3"..playerIndex, {0+translation[1], 1000000+translation[2], 0+translation[3]}, 30)
						Volume_AddSphere("vol_haxor_Sat4"..playerIndex, {0+translation[1], 0+translation[2], 1000000+translation[3]}, 30)
						dummycount = 0
						Update_AllShips()
						for i = 1, 4 do
							if SobGroup_Empty("sg_haxor_Sat"..i..playerIndex) == 0 then
								SobGroup_SetHealth("sg_haxor_Sat"..i..playerIndex, 0)
								SobGroup_Clear("sg_haxor_Sat"..i..playerIndex)
							end
						end
						for i = 1, 4 do
							SobGroup_AvoidanceIgnore("sg_haxor_Sat"..i..playerIndex, "AllShips")
							SobGroup_SpawnNewShipInSobGroup(-1, "fly_location", "satellite", "sg_haxor_Sat"..i..playerIndex, "vol_haxor_Sat"..i..playerIndex)
							Volume_Delete("vol_haxor_Sat"..i..playerIndex)
							--check if the dummy object is successfully placed there
							if SobGroup_Empty("sg_haxor_Sat"..i..playerIndex) == 0 then
								if SobGroup_HealthPercentage("sg_haxor_Sat"..i..playerIndex) > 0 then
									dummycount = dummycount + 1
								end
							end
						end
						attempt = attempt + 1
					end
					local vocalcase = "current camera"
					if dummycount == 4 then		--camera location acquired
						for i = 1,4 do
							camera_dist[i] = Camera_GetDistanceToSobGroup("sg_haxor_Sat"..i..playerIndex)
						end
						for i = 1,3 do
							camera_pos[i] = 500000-(camera_dist[i+1]^2 - camera_dist[1]^2)/2000000 + translation[i]		--somehow this equation works
						end
						Volume_AddSphere("Haxor_ExitHyperspaceVolume"..playerIndex, {camera_pos[1], camera_pos[2], camera_pos[3]}, random_pseudo(3000,10000))
						print("Camera location acquired for hyperspace hax, attempt: "..(attempt-1)..", location: x="..camera_pos[1]..", y="..camera_pos[2]..", z="..camera_pos[3])
						for i = 1, 4 do
							if SobGroup_Empty("sg_haxor_Sat"..i..playerIndex) == 0 then
								SobGroup_SetHealth("sg_haxor_Sat"..i..playerIndex, 0)
								SobGroup_Clear("sg_haxor_Sat"..i..playerIndex)
							end
						end
					else		--cannot acquire camera location, exit at random location instead
						local missionsphere = Universe_GetWorldBounds()
						Volume_AddSphere("Haxor_ExitHyperspaceVolume"..playerIndex, {random_pseudo(-missionsphere[1],missionsphere[1]), random_pseudo(-missionsphere[2],missionsphere[2]), random_pseudo(-missionsphere[3],missionsphere[3])}, random_pseudo(3000,10000))
						vocalcase = "random"
						for i = 1, 4 do
							if SobGroup_Empty("sg_haxor_Sat"..i..playerIndex) == 0 then
								SobGroup_SetHealth("sg_haxor_Sat"..i..playerIndex, 0)
								SobGroup_Clear("sg_haxor_Sat"..i..playerIndex)
							end
						end
					end
					local exitingNUM = 0
					--exit hyperspace as a fleet
					if SobGroup_AreAllInHyperspace("haxor_inhyperspace"..playerIndex) == 1 then
						SobGroup_ExitHyperSpace("haxor_inhyperspace"..playerIndex, "Haxor_ExitHyperspaceVolume"..playerIndex)
						exitingNUM = SobGroup_Count("haxor_inhyperspace"..playerIndex)
						SobGroup_SobGroupSubstract("haxor_inhyperspace_debug"..playerIndex, "haxor_inhyperspace"..playerIndex)		--debug
					else	--let individual ship exit hyperspace
						Update_AllShips()
						local numships = SobGroup_SplitGroupReference("SingleHaxorHyperspaceOnCamera_SOB", "haxor_inhyperspace"..playerIndex, "AllShips", SobGroup_Count("haxor_inhyperspace"..playerIndex))
						for i = 0, numships - 1, 1 do
							if SobGroup_AreAllInHyperspace("SingleHaxorHyperspaceOnCamera_SOB"..i) == 1 then
								SobGroup_ExitHyperSpace("SingleHaxorHyperspaceOnCamera_SOB"..i, "Haxor_ExitHyperspaceVolume"..playerIndex)
								exitingNUM = exitingNUM + 1
								SobGroup_SobGroupSubstract("haxor_inhyperspace_debug"..playerIndex, "SingleHaxorHyperspaceOnCamera_SOB"..i)		--debug
							end
						end
					end
					--debug
					if SobGroup_Empty("haxor_inhyperspace_debug"..playerIndex) == 0 then
						Update_AllShips()
						local numships = SobGroup_SplitGroupReference("SingleHaxorHyperspaceOnCamera_Debug_SOB", "haxor_inhyperspace_debug"..playerIndex, "AllShips", SobGroup_Count("haxor_inhyperspace_debug"..playerIndex))
						for i = 0, numships - 1, 1 do
							if SobGroup_AreAllInHyperspace("SingleHaxorHyperspaceOnCamera_Debug_SOB"..i) == 1 then
								SobGroup_ExitHyperSpace("SingleHaxorHyperspaceOnCamera_Debug_SOB"..i, "Haxor_ExitHyperspaceVolume"..playerIndex)
								exitingNUM = exitingNUM + 1
								SobGroup_SobGroupSubstract("haxor_inhyperspace_debug"..playerIndex, "SingleHaxorHyperspaceOnCamera_Debug_SOB"..i)
							end
						end
					end
					Volume_Delete("Haxor_ExitHyperspaceVolume"..playerIndex)
					if exitingNUM > 0 then
						UI_PlaySound("SFX_coordinateset")
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>Teleport HAX! Ships exiting hyperspace at "..vocalcase.." location: "..exitingNUM.."</c>",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>Teleport HAX! Ships exiting hyperspace at "..vocalcase.." location: "..exitingNUM.."</c>",2.711)
					  end
					end
				end
				UI_SetElementVisible("haxor", "hyperspaceoutselected", 0)
			end
			if SobGroup_Empty("haxor_inhyperspace"..playerIndex) == 0 then
				Update_AllShips()
				local numships = SobGroup_SplitGroupReference("SingleHaxorExitHyperspace_SOB", "haxor_inhyperspace"..playerIndex, "AllShips", SobGroup_Count("haxor_inhyperspace"..playerIndex))
				for i = 0, numships - 1, 1 do
					if SobGroup_AreAllInRealSpace("SingleHaxorExitHyperspace_SOB"..i) == 1 and SobGroup_IsSelectable("SingleHaxorExitHyperspace_SOB"..i) == 1 and SobGroup_IsDoingAbility("SingleHaxorExitHyperspace_SOB"..i, AB_Hyperspace) == 0 then
						SobGroup_Create("HaxorHyperspaceTemp_SOB")
						SobGroup_Clear("HaxorHyperspaceTemp_SOB")
						SobGroup_SobGroupAdd("HaxorHyperspaceTemp_SOB", "haxor_inhyperspace"..playerIndex)
						SobGroup_FillSubstract("haxor_inhyperspace"..playerIndex, "HaxorHyperspaceTemp_SOB", "SingleHaxorExitHyperspace_SOB"..i)
						SobGroup_Clear("HaxorHyperspaceTemp_SOB")
						SobGroup_SobGroupAdd("HaxorHyperspaceTemp_SOB", "haxor_hyperspaceIntermediate"..playerIndex)
						SobGroup_FillSubstract("haxor_hyperspaceIntermediate"..playerIndex, "HaxorHyperspaceTemp_SOB", "SingleHaxorExitHyperspace_SOB"..i)
					end
				end
			end
			if SobGroup_Empty("haxor_hyperspaceIntermediate"..playerIndex) == 0 then
				Update_AllShips()
				local numships = SobGroup_SplitGroupReference("SingleHaxorAddInHyperspace_SOB", "haxor_hyperspaceIntermediate"..playerIndex, "AllShips", SobGroup_Count("haxor_hyperspaceIntermediate"..playerIndex))
				for i = 0, numships - 1, 1 do
					if SobGroup_AreAllInRealSpace("SingleHaxorAddInHyperspace_SOB"..i) == 0 then
						SobGroup_SobGroupAdd("haxor_inhyperspace"..playerIndex, "SingleHaxorAddInHyperspace_SOB"..i)
					else		--directly enter hyperspace for ships without hyperspace ability, or those with hyperspace ability but just launched
						if SobGroup_IsDoingAbility("SingleHaxorAddInHyperspace_SOB"..i, AB_Hyperspace) == 0 then
					  	SobGroup_Despawn("SingleHaxorAddInHyperspace_SOB"..i)		--some ships can get despawned while launching, then disappear forever, need to debug
					  	SobGroup_SobGroupAdd("haxor_inhyperspace"..playerIndex, "SingleHaxorAddInHyperspace_SOB"..i)
					  	SobGroup_SobGroupAdd("haxor_inhyperspace_debug"..playerIndex, "SingleHaxorAddInHyperspace_SOB"..i)		--debug
					  end
					end
				end
			end
			UI_SetTextLabelText("haxor", "hyperspaceoutselectlabel", "x"..SobGroup_Count("haxor_inhyperspace"..playerIndex))
			--entering hyperspace select
			if UI_IsNamedElementVisible("haxor", "hyperspaceinselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_hyperspaceinselect"..playerIndex)
				local hyperNUM = 0
				if shipsNUM > 0 then
					local numships = SobGroup_SplitGroupReference("SingleHaxorToHyperspace_SOB", "haxor_hyperspaceinselect"..playerIndex, "AllShips", SobGroup_Count("haxor_hyperspaceinselect"..playerIndex))
					for i = 0, numships - 1, 1 do
						if SobGroup_AreAllInRealSpace("SingleHaxorToHyperspace_SOB"..i) == 1 and SobGroup_IsDoingAbility("SingleHaxorToHyperspace_SOB"..i, AB_Hyperspace) == 0 and SobGroup_HealthPercentage("SingleHaxorToHyperspace_SOB"..i) > 0 then
					  	--if SobGroup_IsDocked("SingleHaxorToHyperspace_SOB"..i) == 0 then
					  		SobGroup_Stop(SobGroup_OwnedBy("SingleHaxorToHyperspace_SOB"..i), "SingleHaxorToHyperspace_SOB"..i)
						  	SobGroup_EnterHyperSpaceOffMap("SingleHaxorToHyperspace_SOB"..i)
								SobGroup_SobGroupAdd("haxor_hyperspaceIntermediate"..playerIndex, "SingleHaxorToHyperspace_SOB"..i)
								hyperNUM = hyperNUM + 1
							--end
					  end
					end
					if hyperNUM > 0 then
						UI_PlaySound("SFX_standbyforhyperspace")
						local targetidentity = "(X__X) Enemy "
						SobGroup_Create("CompareHaxorShips"..playerIndex)
						SobGroup_Clear("CompareHaxorShips"..playerIndex)
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_hyperspaceinselect"..playerIndex, "Player_Ships"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "(n__n) Own "
						else
							SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_hyperspaceinselect"..playerIndex, "allies"..playerIndex)
							if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
								targetidentity = "(T__T) Friendly "
							end
						end
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships entering hyperspace: "..hyperNUM.."</c>",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships entering hyperspace: "..hyperNUM.."</c>",2.711)
					  end
					end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "hyperspaceinselected", 0)
			end
			--promote select
			UI_SetTextLabelText("haxor", "promoteselectlabel", "+100")
			if UI_IsNamedElementVisible("haxor", "promoteselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_promoteselect"..playerIndex)
				if shipsNUM > 0 then
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
					SobGroup_FillCompare("AllHaxorToPromote_SOB", "haxor_promoteselect"..playerIndex, "HaxorShipsWithSubsystemXP_SOB")
					local addxp = 0.01000
					local shippromoted = 0
					if SobGroup_Empty("AllHaxorToPromote_SOB") == 0 then
						local numships = SobGroup_SplitGroupReference("SingleHaxorToPromote_SOB", "AllHaxorToPromote_SOB", "AllShips", SobGroup_Count("AllHaxorToPromote_SOB"))
						for i = 0, numships - 1, 1 do
							if SobGroup_HealthPercentage("SingleHaxorToPromote_SOB"..i) > 0 then
								local currentxp = SobGroup_GetHardPointHealth("SingleHaxorToPromote_SOB"..i, "experience")
								if currentxp < 1 - addxp then
									SobGroup_SetHardPointHealth_Smart("SingleHaxorToPromote_SOB"..i, "experience", currentxp + addxp)
									shippromoted = shippromoted + 1
								end
							end
						end
					end
					local playervar = 0
				  while playervar < Universe_PlayerCount() do
					  playervar = playervar + 1
					  local playeridx = playervar-1
				  	if nfi[playervar] > 0 then
							for i = 0,(nfi[playervar]-1),1 do
								if SobGroup_Empty("splitfighters"..playeridx .. tostring(i)) == 0 then
									if SobGroup_Selected("splitfighters"..playeridx .. tostring(i)) == 1 then
										if FighterEXP.serial[playervar][i+1] ~= nil then
											if FighterEXP.serial[playervar][i+1] < 1 - addxp then
												FighterEXP.serial[playervar][i+1] = FighterEXP.serial[playervar][i+1] + addxp
												shippromoted = shippromoted + 1
										  end
										end
									end
								end
							end
						end
						if nco[playervar] > 0 then
							for i = 0,(nco[playervar]-1),1 do
								if SobGroup_Empty("splitcorvettes"..playeridx .. tostring(i)) == 0 then
									if SobGroup_Selected("splitcorvettes"..playeridx .. tostring(i)) == 1 then
										if CorvetteEXP.serial[playervar][i+1] ~= nil then
											if CorvetteEXP.serial[playervar][i+1] < 1 - addxp then
												CorvetteEXP.serial[playervar][i+1] = CorvetteEXP.serial[playervar][i+1] + addxp
												shippromoted = shippromoted + 1
										  end
										end
									end
								end
							end
						end
					end
					if shippromoted > 0 then
						UI_PlaySound("SFX_SHEEPBAA")
						local targetidentity = "Hehehehehehe... Enemy "
						SobGroup_Create("CompareHaxorShips"..playerIndex)
						SobGroup_Clear("CompareHaxorShips"..playerIndex)
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_promoteselect"..playerIndex, "Player_Ships"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "XP HAX! Own "
						else
							SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_promoteselect"..playerIndex, "allies"..playerIndex)
							if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
								targetidentity = "Yoshi! Friendly "
							end
						end
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships promoted with "..(addxp*10000).." experience: "..shippromoted.."</c>",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships promoted with "..(addxp*10000).." experience: "..shippromoted.."</c>",2.711)
					  end
					end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "promoteselected", 0)
			end
			--kamikaze select
			if UI_IsNamedElementVisible("haxor", "kamikazeselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_kamikazeselect"..playerIndex)
				local kamikazeNUM = 0
				if shipsNUM > 0 then
					SobGroup_Create("Haxor_KamikazeTarget")
					SobGroup_Create("Haxor_KamikazeTargetAttacker")
					local numships = SobGroup_SplitGroupReference("SingleHaxorToKamikaze_SOB", "haxor_kamikazeselect"..playerIndex, "AllShips", SobGroup_Count("haxor_kamikazeselect"..playerIndex))
					local numtargets = SobGroup_SplitGroupReference("SingleHaxorKamikazeTarget_SOB", "enemies"..playerIndex, "AllShips", SobGroup_Count("enemies"..playerIndex))
					for i = 0, numships - 1, 1 do
						local kamikaze_ship = "SingleHaxorToKamikaze_SOB"..i
						if SobGroup_CanDoAbility(kamikaze_ship, AB_Move) == 1 and SobGroup_HealthPercentage(kamikaze_ship) > 0 then
							SobGroup_Clear("Haxor_KamikazeTarget")
							if SobGroup_IsDoingAbility(kamikaze_ship, AB_Attack) == 1 then
								for y = 0, numtargets - 1, 1 do
									local enemyship = "SingleHaxorKamikazeTarget_SOB"..y
									SobGroup_Clear("Haxor_KamikazeTargetAttacker")
									SobGroup_GetAttackers(enemyship, "Haxor_KamikazeTargetAttacker")
									if SobGroup_SobGroupCompare(kamikaze_ship, "Haxor_KamikazeTargetAttacker") == 1 then
										SobGroup_Kamikaze(kamikaze_ship, enemyship)
										kamikazeNUM = kamikazeNUM + 1
									end
								end
							else
								SobGroup_GetAttackers(kamikaze_ship, "Haxor_KamikazeTarget")
								if SobGroup_Empty("Haxor_KamikazeTarget") == 0 then
									SobGroup_Kamikaze(kamikaze_ship, "Haxor_KamikazeTarget")
									kamikazeNUM = kamikazeNUM + 1
								end
							end
						end
					end
					if kamikazeNUM > 0 then
						UI_PlaySound("SFX_DYN_QKC_ATTACK_04")
						local targetidentity = "Orz Enemy "
						SobGroup_Create("CompareHaxorShips"..playerIndex)
						SobGroup_Clear("CompareHaxorShips"..playerIndex)
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_kamikazeselect"..playerIndex, "Player_Ships"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "(.Y.) Own "
						else
							SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_kamikazeselect"..playerIndex, "allies"..playerIndex)
							if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
								targetidentity = ">_<! Friendly "
							end
						end
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships launching kamikaze attack: "..kamikazeNUM.."</c>",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships launching kamikaze attack: "..kamikazeNUM.."</c>",2.711)
					  end
					end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "kamikazeselected", 0)
			end
			--burn research
			local researchNUM = 0
			local iRace = Player_GetRace(PlayerSelected) + 1
			local canburn = 0
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					dofilepath([[data:scripts/race.lua]])
					if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
						dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
						for z, iCount in research do
							if Player_HasQueuedResearch(PlayerSelected, iCount.Name) == 1 then
							  researchNUM = researchNUM + 1
							end
						end
						canburn = 1
					end
				end
			end
			UI_SetTextLabelText("haxor", "researchselectlabel", "x"..researchNUM)
			if UI_IsNamedElementVisible("haxor", "researchselected") == 1 then
				local researchNUM = 0
				local totalcost = 0
				if canburn == 1 then
				  for z, iCount in research do
						if Player_HasQueuedResearch(PlayerSelected, iCount.Name) == 1 then	  
							Player_CancelResearch(PlayerSelected, iCount.Name)
							Player_GrantResearchOption(PlayerSelected, iCount.Name)
							totalcost = totalcost + iCount.Cost
							researchburned[PlayerSelected+1] = researchburned[PlayerSelected+1] + iCount.Cost
							researchNUM = researchNUM + 1
							print("Research hax for player index: "..PlayerSelected..", game year: "..year..", item granted: "..iCount.Name)
						end
					end
				end
				if researchNUM > 0 then
					UI_PlaySound("SFX_researchmade")
					local targetidentity = "Nice job! Enemy "
					if PlayerSelected == playerIndex then
						targetidentity = "Smart HAX! Own "
					elseif AreAllied(playerIndex, PlayerSelected) == 1 then
						targetidentity = "Great thanks! Friendly "
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."research items granted: "..researchNUM..", RUs saved: "..totalcost.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,""..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s research items granted: "..researchNUM..", RUs saved: "..totalcost.."</c>",2.711)
				  end
				else
					UI_PlaySound("SFX_DecidingWhatToResearch")
				end
				UI_SetElementVisible("haxor", "researchselected", 0)
			end
			--build booster
			local buildbooster = "1x"
			local canboost = 0
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					if SobGroup_Empty("supporter"..PlayerSelected) == 0 then
						canboost = 1
						if Temp_GlobalVariable.HaxBuild[PlayerSelected+1] == 1 then
							buildbooster = "<c=fad610>boost</c>"
						end
					end
				end
			end
			UI_SetTextLabelText("haxor", "buildselectlabel", buildbooster)
			if UI_IsNamedElementVisible("haxor", "buildselected") == 1 then
				local buildbooster = "back to normal"
				local switchNUM = 0
				if canboost == 1 then
					if Temp_GlobalVariable.HaxBuild[PlayerSelected+1] == 0 then
						SobGroup_SetHardPointHealth("supporter"..PlayerSelected, "hax_build1", 0)
						Temp_GlobalVariable.HaxBuild[PlayerSelected+1] = 1
						buildbooster = "to sweatshop mode"
						switchNUM = 1
					else
						SobGroup_SetHardPointHealth("supporter"..PlayerSelected, "hax_build1", 1)
						Temp_GlobalVariable.HaxBuild[PlayerSelected+1] = 0
						switchNUM = 2
					end
				end
				if switchNUM > 0 then
					if switchNUM == 1 then
						UI_PlaySound("SFX_engineeringtransfer")
					elseif switchNUM == 2 then
						UI_PlaySound("SFX_ShipBuildingAsNormal")
					end
					local targetidentity = "*__*! Enemy "
					if PlayerSelected == playerIndex then
						targetidentity = "G__G! Own "
					elseif AreAllied(playerIndex, PlayerSelected) == 1 then
						targetidentity = "=__=! Friendly "
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."build speed set "..buildbooster.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,""..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s build speed set "..buildbooster.."</c>",2.711)
				  end
				end
				UI_SetElementVisible("haxor", "buildselected", 0)
			end
			--resource hax
			local ruhax = ""
			local canhaxru = 0
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					if SobGroup_Empty("supporter"..PlayerSelected) == 0 then
						ruhax = Player_GetRU(PlayerSelected)
						canhaxru = 1
						if Temp_GlobalVariable.HaxRU[PlayerSelected+1] == 1 then
							ruhax = "<c=fad610>"..RUMaxCapacityList[PlayerSelected+1].."</c>"
						end
					end
				end
			end
			UI_SetTextLabelText("haxor", "resourceselectlabel", ruhax)
			if UI_IsNamedElementVisible("haxor", "resourceselected") == 1 then
				local buildbooster = "set back to normal"
				local switchNUM = 0
				if canhaxru == 1 then
					if Temp_GlobalVariable.HaxRU[PlayerSelected+1] == 0 then
						Temp_GlobalVariable.HaxRU[PlayerSelected+1] = 1
						buildbooster = "filled to max capacity: "..RUMaxCapacityList[PlayerSelected+1]
						switchNUM = 1
					else
						Temp_GlobalVariable.HaxRU[PlayerSelected+1] = 0
						switchNUM = 2
					end
				end
				if switchNUM > 0 then
					if switchNUM == 1 then
						UI_PlaySound("SFX_ResourcesAreNowAvailable")
					elseif switchNUM == 2 then
						UI_PlaySound("SFX_ResourcingSystemsHasBeenReleased")
					end
					local targetidentity = "$__$! Enemy "
					if PlayerSelected == playerIndex then
						targetidentity = "RU HAX! Own "
					elseif AreAllied(playerIndex, PlayerSelected) == 1 then
						targetidentity = "XD Friendly "
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."RUs "..buildbooster.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,""..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s RUs "..buildbooster.."</c>",2.711)
				  end
				end
				UI_SetElementVisible("haxor", "resourceselected", 0)
			end
			--energy hax
			local enhax = ""
			local canhaxen = 0
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					if SobGroup_Empty("supporter"..PlayerSelected) == 0 then
						enhax = powerListStored[PlayerSelected+1]
						canhaxen = 1
						if Temp_GlobalVariable.HaxEnergy[PlayerSelected+1] == 1 then
							enhax = "<c=fad610>"..LastpowerListMax[PlayerSelected+1].."</c>"
						end
					end
				end
			end
			UI_SetTextLabelText("haxor", "powerselectlabel", enhax)
			if UI_IsNamedElementVisible("haxor", "powerselected") == 1 then
				local buildbooster = "set back to normal"
				local switchNUM = 0
				if canhaxen == 1 then
					if Temp_GlobalVariable.HaxEnergy[PlayerSelected+1] == 0 then
						Temp_GlobalVariable.HaxEnergy[PlayerSelected+1] = 1
						buildbooster = "charged to max capacity: "..LastpowerListMax[PlayerSelected+1]
						switchNUM = 1
					else
						Temp_GlobalVariable.HaxEnergy[PlayerSelected+1] = 0
						switchNUM = 2
					end
				end
				if switchNUM > 0 then
					if switchNUM == 1 then
						UI_PlaySound("SFX_PowerSystemsFullyCharged")
					elseif switchNUM == 2 then
						UI_PlaySound("SFX_PowerGeneratorDisabled")
					end
					local targetidentity = "(@..@) Enemy "
					if PlayerSelected == playerIndex then
						targetidentity = "Energy HAX! Own "
					elseif AreAllied(playerIndex, PlayerSelected) == 1 then
						targetidentity = "(T..T) Friendly "
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."energy "..buildbooster.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,""..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s energy "..buildbooster.."</c>",2.711)
				  end
				end
				UI_SetElementVisible("haxor", "powerselected", 0)
			end
			--unit cap hax
			local unitcaphax = ""
			local canhaxunitcap = 0
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					if SobGroup_Empty("supporter"..PlayerSelected) == 0 then
						unitcaphax = "1x"
						canhaxunitcap = 1
						if Temp_GlobalVariable.HaxUnitCap[PlayerSelected+1] == 1 then
							unitcaphax = "<c=fad610>".."Inf.".."</c>"
						end
					end
				end
			end
			UI_SetTextLabelText("haxor", "unitcapselectlabel", unitcaphax)
			if UI_IsNamedElementVisible("haxor", "unitcapselected") == 1 then
				local unitcap = "set back to normal"
				local switchNUM = 0
				if canhaxunitcap == 1 then
					if Temp_GlobalVariable.HaxUnitCap[PlayerSelected+1] == 0 then
						Temp_GlobalVariable.HaxUnitCap[PlayerSelected+1] = 1
						unitcap = "is now unlimited!"
						switchNUM = 1
					else
						Temp_GlobalVariable.HaxUnitCap[PlayerSelected+1] = 0
						switchNUM = 2
					end
				end
				if switchNUM > 0 then
					if switchNUM == 1 then
						UI_PlaySound("SFX_IncreaseLogistics")
					elseif switchNUM == 2 then
						UI_PlaySound("SFX_CancelHax")
					end
					local targetidentity = "(*o*) Enemy "
					if PlayerSelected == playerIndex then
						targetidentity = "Unit cap HAX! Own "
					elseif AreAllied(playerIndex, PlayerSelected) == 1 then
						targetidentity = "(?_?) Friendly "
					end
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."unit cap "..unitcap.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,""..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>'s unit cap "..unitcap.."</c>",2.711)
				  end
				end
				UI_SetElementVisible("haxor", "unitcapselected", 0)
			end
			--transfer selected
			local transferhax = ""
			local cantransfer = 0
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					transferhax = PlayerSelected+1
					cantransfer = 1
				end
			end
			UI_SetTextLabelText("haxor", "transferselectlabel", "P"..transferhax)
			if UI_IsNamedElementVisible("haxor", "transferselected") == 1 then
				--normal ships
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_transferselect"..playerIndex)
				local transferNUM = 0
				--megalith
				SobGroup_Create("all_megalithnoowner")
				SobGroup_Clear("all_megalithnoowner")
				SobGroup_SobGroupAdd("all_megalithnoowner", "megalithnoowner")
				SobGroup_SobGroupAdd("all_megalithnoowner", "megalitenoowner")
				SobGroup_SobGroupAdd("all_megalithnoowner", "debrisnoowner")
				SobGroup_SobGroupAdd("all_megalithnoowner", "AsteroidSmasher")
				SobGroup_SobGroupAdd("all_megalithnoowner", "planetnoowner")
				SobGroup_Create("Haxor_MegalithToClaim")
				SobGroup_Clear("Haxor_MegalithToClaim")
				local nummegaliths = SobGroup_SplitGroupReference("SingleMegalithSelected_SOB", "all_megalithnoowner", "all_megalithnoowner", SobGroup_Count("all_megalithnoowner"))
				local megalithNUM = 0
				if nummegaliths > 0 then
					for i = 0, nummegaliths - 1, 1 do
						if SobGroup_Selected("SingleMegalithSelected_SOB"..i) == 1 then
					    SobGroup_SobGroupAdd("Haxor_MegalithToClaim", "SingleMegalithSelected_SOB"..i)
					    megalithNUM = megalithNUM + 1
					  end
					end
				end
				if cantransfer == 1 then
					if shipsNUM > 0 then
						local targetidentity = "Mind control! Enemy "
						SobGroup_Create("CompareHaxorShips"..playerIndex)
						SobGroup_Clear("CompareHaxorShips"..playerIndex)
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_transferselect"..playerIndex, "Player_Ships"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "@______@ Own "
						else
							SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_transferselect"..playerIndex, "allies"..playerIndex)
							if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
								targetidentity = "T______T Friendly "
							end
						end
						local numships = SobGroup_SplitGroupReference("SingleHaxorToTransfer_SOB", "haxor_transferselect"..playerIndex, "AllShips", SobGroup_Count("haxor_transferselect"..playerIndex))
						for i = 0, numships - 1, 1 do
							if SobGroup_OwnedBy("SingleHaxorToTransfer_SOB"..i) ~= PlayerSelected then
						  	SobGroup_SwitchOwner("SingleHaxorToTransfer_SOB"..i, PlayerSelected)
								transferNUM = transferNUM + 1
						  end
						end
						if transferNUM > 0 then
							UI_PlaySound("SFX_CrewTransferComplete")
							if Player_IsAlive(playerIndex) == 1 then
						    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships transfered to </c>"..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>: "..transferNUM.."</c>",2.711)
						  else
						  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships transfered to </c>"..GetPlayerNameWithColour(PlayerSelected).."<c=fad610>: "..transferNUM.."</c>",2.711)
						  end
						end
					elseif megalithNUM > 0 then
						SobGroup_SwitchOwner("Haxor_MegalithToClaim", PlayerSelected)
						UI_PlaySound("SFX_CrewTransferComplete")
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>Unclaimed Megalith transfered to </c>"..GetPlayerNameWithColour(PlayerSelected).."",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>Unclaimed Megalith transfered to </c>"..GetPlayerNameWithColour(PlayerSelected).."",2.711)
					  end
					else
						UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
					end
				end
				UI_SetElementVisible("haxor", "transferselected", 0)
			end
			--remove ai from select
			local aihax = ""
			if PlayerSelected < Universe_PlayerCount() then
				if Player_IsAlive(PlayerSelected) == 1 then
					if CPU_Exist_Smart(PlayerSelected) == 1 then
						aihax = "CPU"
					else
						aihax = "Human"
					end
				end
			end
			UI_SetTextLabelText("haxor", "manualselectlabel", aihax)
			if UI_IsNamedElementVisible("haxor", "manualselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_manualselect"..playerIndex)
				if shipsNUM > 0 then
					local numships = SobGroup_SplitGroupReference("SingleAIRemoveSelected_SOB", "haxor_manualselect"..playerIndex, "AllShips", SobGroup_Count("haxor_manualselect"..playerIndex))
					local AInum = 0
					if numships > 0 then
						for i = 0, numships - 1, 1 do
							local AIplayer = SobGroup_OwnedBy("SingleAIRemoveSelected_SOB"..i)
							if CPU_Exist_Smart(AIplayer) == 1 then
								CPU_RemoveSobGroup(AIplayer, "SingleAIRemoveSelected_SOB"..i)
								SobGroup_SobGroupAdd("haxor_ai"..playerIndex, "haxor_manualselect"..playerIndex)
								SobGroup_SobGroupAdd("haxor_all_shipswithoutai", "haxor_ai"..playerIndex)
								AInum = AInum + 1
							end
						end
					end
					if AInum > 0 then
						SobGroup_SetSwitchOwnerFlag("haxor_ai"..playerIndex, 0)
						SobGroup_SetSwitchOwnerFlag("haxor_all_shipswithoutai", 0)
						UI_PlaySound("SFX_TheGoodJobIsOpen")
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>AI of ships removed: "..AInum.."</c>",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>AI of ships removed: "..AInum.."</c>",2.711)
					  end
					end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "manualselected", 0)
			end
			--restore ai
			if UI_IsNamedElementVisible("haxor", "aiselected") == 1 then
				local shipsNUM = SobGroup_Count("haxor_ai"..playerIndex)
				if shipsNUM > 0 then
					Update_AllShips()
					local numships = SobGroup_SplitGroupReference("SingleAIRestoreSelected_SOB", "haxor_ai"..playerIndex, "AllShips", SobGroup_Count("haxor_ai"..playerIndex))
					local AInum = 0
					if numships > 0 then
						for i = 0, numships - 1, 1 do
							local AIplayer = SobGroup_OwnedBy("SingleAIRestoreSelected_SOB"..i)
							if CPU_Exist_Smart(AIplayer) == 1 then
								CPU_AddSobGroup(AIplayer, "SingleAIRestoreSelected_SOB"..i)
								AInum = AInum + 1
							end
						end
					end
					UI_PlaySound("SFX_IdleShipsWillDefault")
					if Player_IsAlive(playerIndex) == 1 then
				    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>AI of ships restored: "..AInum.."</c>",2.711)
				  else
				  	Subtitle_Add(Actor_Keeper,"<c=fad610>AI of ships restored: "..AInum.."</c>",2.711)
				  end
				  SobGroup_SobGroupSubstract("haxor_all_shipswithoutai", "haxor_ai"..playerIndex)
				  SobGroup_Clear("haxor_ai"..playerIndex)
				end
				UI_SetElementVisible("haxor", "aiselected", 0)
			end
			UI_SetTextLabelText("haxor", "aiselectlabel", "x"..SobGroup_Count("haxor_ai"..playerIndex))
			

		end

		--print("CLASS SELECTOR RUNNING, GAME TIME: "..gametime)
	else
		--UI_SetScreenVisible("selector", 0)		  		
 	end
---End of Fleet Selector-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	

 	if Temp_GlobalVariable.Selected_Save == 9 then
	 	Rule_Remove("selected")
		Rule_AddInterval("selected", Temp_GlobalVariable.Selected_NextInterval/Selected_Runtimes)
		
		--synchronized race check function in sobgroupfunctionsADV.lua
		--Rule_AddInterval("RaceCheckSynWithInterface", runselected)
		RaceCheckSynWithInterface()			--The above interval can vary, if that becomes annoying, use this one instead
		Haxor_BackgroundRunningHack()
		Orders_ExecuteClosestDocking()
	end
	Temp_GlobalVariable.Selected_Save = Temp_GlobalVariable.Selected_Save + 1
	--print("selected - End")
end	

function UpdateIcon(Screen, UnitInterface, UnitList)
  UI_SetTextLabelText(Screen, UnitInterface, "x"..UnitList); 	 
end

function Haxor_BackgroundRunningHack()
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while playerIndex < playerCount do
		local playerIndexList = playerIndex+1
		if Player_IsAlive(playerIndex) == 1 then
			if SobGroup_Empty("supporter"..playerIndex) == 0 then
				if Temp_GlobalVariable.HaxBuild[playerIndexList] == 0 then
					SobGroup_SetHardPointHealth("supporter"..playerIndex, "hax_build1", 1)
				else
					SobGroup_SetHardPointHealth("supporter"..playerIndex, "hax_build1", 0)
				end
			end
			if Player_GetRU(playerIndex) < RUMaxCapacityList[playerIndex+1] and Temp_GlobalVariable.HaxRU[playerIndexList] == 1 then
				Player_SetRU(playerIndex, RUMaxCapacityList[playerIndex+1])
			end
			if powerListStored[playerIndex+1] < LastpowerListMax[playerIndex+1] and Temp_GlobalVariable.HaxEnergy[playerIndexList] == 1 then
				powerListStored[playerIndex+1] = LastpowerListMax[playerIndex+1]
			end
		end
		playerIndex = playerIndex + 1
	end
	Rule_Remove("Haxor_BackgroundRunningHack")
end

function Haxor_UnitCapHack(playerIndexList)
	if Temp_GlobalVariable.HaxUnitCap[playerIndexList] == 1 then
		pilotmaxList[playerIndexList] = 99999
		pilotrecruitList[playerIndexList] = 99999
		officermaxList[playerIndexList] = 99999
		officerrecruitList[playerIndexList] = 99999
	end
end

function CheckIfShipIsSelectable(ship)
	local canselect = 0
	if SobGroup_Empty(ship) == 0 then
		if SobGroup_IsDocked(ship) == 0 and 
		SobGroup_AreAllInRealSpace(ship) == 1 and 
		SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and 
		SobGroup_IsSelectable(ship) == 1 then
			canselect = 1
		end
	end
	return canselect
end

function PrepareSelectedShipsForHaxor(ship)
	--pick out all selected ships
	Update_AllShips()
	SobGroup_Create(ship)
	SobGroup_Clear(ship)
	local numships = SobGroup_SplitGroupReference("SingleHaxorToSelect_SOB", "AllShips", "AllShips", SobGroup_Count("AllShips"))
	for i = 0, numships - 1, 1 do
		if SobGroup_Selected("SingleHaxorToSelect_SOB"..i) == 1 then
	    SobGroup_SobGroupAdd(ship, "SingleHaxorToSelect_SOB"..i)
	  end
	end
	if SobGroup_Empty(ship) == 1 then
		return 0
	else
		return SobGroup_Count(ship)
	end
end

function powerup(unit, powerup, powerup_unlocker, cost, time, counter, n, ship, energy)      
  if SobGroup_GetHardPointHealth(unit, powerup) > 0 then    
    counter[SobGroup_OwnedBy(unit)+1] = counter[SobGroup_OwnedBy(unit)+1] + 1
    if counter[SobGroup_OwnedBy(unit)+1] == 1 then
      powerListStored[SobGroup_OwnedBy(unit)+1] = powerListStored[SobGroup_OwnedBy(unit)+1] - energy
    elseif counter[SobGroup_OwnedBy(unit)+1] >= time then
      counter[SobGroup_OwnedBy(unit)+1] = 0			                
      for z = 0,n-1,1 do
        if SobGroup_Empty(ship..z) == 0 then
          if SobGroup_OwnedBy(ship..z) == SobGroup_OwnedBy(unit) then		            
            SobGroup_SetHardPointHealth(ship..z, powerup, 0)                
          end  
        end  
      end            	        		        
    end  
  else      
    if Player_GetRU(SobGroup_OwnedBy(unit)) >= cost and powerListStored[SobGroup_OwnedBy(unit)+1] > energy then	    
      if SobGroup_GetHardPointHealth(unit, powerup_unlocker) == 0 then   
	      SobGroup_CreateSubSystem(unit, powerup_unlocker)            
	    end 
	  elseif SobGroup_IsBuilding(unit, powerup) == 0 then    	    
	    SobGroup_SetHardPointHealth(unit, powerup_unlocker, 0)  	        
	  end		      
  end	     
end

--Sun Damage--------------------------------------------------------------------------------------------------

function SobGroup_TakeDamageSol(ship,damagemultiplier,runselectedmultiplier)
  local sundamage = 0
	local isinorbit = " "
	local sundamagebalancer = 1
	local remotespacebalancer = 1		
  local hassolarshield = 1
  local hasremotespaceshield = 1

--pianeti
  if SobGroup_IsDocked(ship) == 1 and Universe_GameTime() > 10 then
  elseif SobGroup_Empty("planet_mercury") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_mercury") <= 42000 then
  	isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_venus") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_venus") <= 57000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_earth") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_earth") <= 57000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_moon") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_moon") <= 42000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_mars") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_mars") <= 57000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_jupiter") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_jupiter") <= 112000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_europa") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_europa") <= 42000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_io") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_io") <= 42000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_callisto") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_callisto") <= 42000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_ganymeade") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_ganymeade") <= 42000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_saturn") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_saturn") <= 112000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_uranus") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_uranus") <= 72000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_neptune") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_neptune") <= 72000 then
    isinorbit = "-SAFE"
  elseif SobGroup_Empty("planet_pluto") == 0 and SobGroup_GetDistanceToSobGroup(ship, "planet_pluto") <= 42000 then
    isinorbit = "-SAFE"
  
--open space  
	--Hiigaran
  elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Hiigaran then 
	  isinorbit = " "
    sundamagebalancer = 1.2
		remotespacebalancer = 1.2			
    hassolarshield = 1
    hasremotespaceshield = 1      
    if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "orbitalstationallies"..SobGroup_OwnedBy(ship), ship, 14000) == 1 then		      		
		  isinorbit = "-SAFE"
      hassolarshield = 0.04
      hasremotespaceshield = 0.04   			
    else
      distance = 500
	    while distance < 7000 do
	      if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "hgn_shipyard_g"..SobGroup_OwnedBy(ship), ship, distance) == 1 then				        
	        if SobGroup_GetHardPointHealth("temp"..SobGroup_OwnedBy(ship), "hgn_orders_solarshield") > 0 then
	          if Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield3" ) == 1 then
	          	hassolarshield = 0.6
	          elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield2" ) == 1 then	
	          	hassolarshield = 0.7
	          elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield1" ) == 1 then	
	          	hassolarshield = 0.8
	          else
	            hassolarshield = 0.9	
	          end
	        end 
	        if SobGroup_GetHardPointHealth("temp"..SobGroup_OwnedBy(ship), "hgn_orders_remotespaceshield") > 0 then
	          if Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield3" ) == 1 then
	          	hasremotespaceshield = 0.6
	          elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield2" ) == 1 then	
	          	hasremotespaceshield = 0.7
	          elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield1" ) == 1 then	
	          	hasremotespaceshield = 0.8
	          else
	            hasremotespaceshield = 0.9	
	          end
	        end        				              				        
	      end           
	      distance = distance + 500
	    end	         				              				        
    end    		    						    		
    
		if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 250000 then 
	    sundamage = 0.055
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 300000 then 
	    sundamage = 0.045	  	  
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 350000 then	
	    sundamage = 0.036	    
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 400000 then
	    sundamage = 0.028	   
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 450000 then
	  	sundamage = 0.021	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 500000 then
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 550000 then
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 600000 then
	  	sundamage = 0.006	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 650000 then
	  	sundamage = 0.003	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 750000 then 
	  	-----    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1000000 then 
	  	-----
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1050000 then 
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1100000 then 
	  	sundamage = 0.003	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1150000 then 
	  	sundamage = 0.006	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1200000 then 
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)     
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1250000 then 
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1300000 then 
	  	sundamage = 0.021	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1350000 then 
	  	sundamage = 0.028	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer) 
		elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1400000 then 
	  	sundamage = 0.036	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)	
	  else	    
	  end  
		
	--Vaygr
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Vaygr then
    isinorbit = " "	
	  sundamagebalancer = 1.05
		remotespacebalancer = 1.05		
    hassolarshield = 1
    hasremotespaceshield = 1
    if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "orbitalstationallies"..SobGroup_OwnedBy(ship), ship, 14000) == 1 then
		  isinorbit = "-SAFE"
      hassolarshield = 0.04
      hasremotespaceshield = 0.04
    else
			if Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield3" ) == 1 then
				hassolarshield = 0.6
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield2" ) == 1 then	
				hassolarshield = 0.7
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield1" ) == 1 then	
				hassolarshield = 0.8
			else
				hassolarshield = 0.9	
			end
		
			if Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield3" ) == 1 then
				hasremotespaceshield = 0.6
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield2" ) == 1 then	
				hasremotespaceshield = 0.7
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield1" ) == 1 then	
				hasremotespaceshield = 0.8
			else
				hasremotespaceshield = 0.9	
			end	        					
		end    		
    
		if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 250000 then 
	    sundamage = 0.055
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 300000 then 
	    sundamage = 0.045	  	  
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 350000 then	
	    sundamage = 0.036	    
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 400000 then
	    sundamage = 0.028	   
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 450000 then
	  	sundamage = 0.021	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 500000 then
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 550000 then
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 600000 then
	  	sundamage = 0.006	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 650000 then
	  	sundamage = 0.003	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 750000 then 
	  	-----    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1000000 then 
	  	-----
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1050000 then 
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1100000 then 
	  	sundamage = 0.003	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1150000 then 
	  	sundamage = 0.006	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1200000 then 
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)     
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1250000 then 
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1300000 then 
	  	sundamage = 0.021	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1350000 then 
	  	sundamage = 0.028	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer) 
		elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1400000 then 
	  	sundamage = 0.036	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)	
	  else	    
	  end 
	  
	--Kadeshi
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Kadeshi then
    isinorbit = " "	
	  sundamagebalancer = 1.05
		remotespacebalancer = 1.05		
    hassolarshield = 1
    hasremotespaceshield = 1    
    if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "orbitalstationallies"..SobGroup_OwnedBy(ship), ship, 14000) == 1 then
		  isinorbit = "-SAFE"
      hassolarshield = 0.04
      hasremotespaceshield = 0.04
    else
			if Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield3" ) == 1 then
				hassolarshield = 0.6
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield2" ) == 1 then	
				hassolarshield = 0.7
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield1" ) == 1 then	
				hassolarshield = 0.8
			else
				hassolarshield = 0.9	
			end
		
			if Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield3" ) == 1 then
				hasremotespaceshield = 0.6
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield2" ) == 1 then	
				hasremotespaceshield = 0.7
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield1" ) == 1 then	
				hasremotespaceshield = 0.8
			else
				hasremotespaceshield = 0.9	
			end
		end
    
		if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 250000 then 
	    sundamage = 0.055
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 300000 then 
	    sundamage = 0.045	  	  
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 350000 then	
	    sundamage = 0.036	    
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 400000 then
	    sundamage = 0.028	   
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 450000 then
	  	sundamage = 0.021	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 500000 then
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 550000 then
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 600000 then
	  	sundamage = 0.006	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 650000 then
	  	sundamage = 0.003	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 750000 then 
	  	-----    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1000000 then 
	  	-----
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1050000 then 
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1100000 then 
	  	sundamage = 0.003	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1150000 then 
	  	sundamage = 0.006	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1200000 then 
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)     
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1250000 then 
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1300000 then 
	  	sundamage = 0.021	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1350000 then 
	  	sundamage = 0.028	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer) 
		elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1400000 then 
	  	sundamage = 0.036	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)	
	  else	    
	  end

	--Raider
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Raider then
    isinorbit = " "	
	  sundamagebalancer = 1.05
		remotespacebalancer = 1.05		
    hassolarshield = 1
    hasremotespaceshield = 1    
    if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "orbitalstationallies"..SobGroup_OwnedBy(ship), ship, 14000) == 1 then
		  isinorbit = "-SAFE"
      hassolarshield = 0.04
      hasremotespaceshield = 0.04
    else
			if Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield3" ) == 1 then
				hassolarshield = 0.6
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield2" ) == 1 then	
				hassolarshield = 0.7
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield1" ) == 1 then	
				hassolarshield = 0.8
			else
				hassolarshield = 0.9	
			end
		
			if Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield3" ) == 1 then
				hasremotespaceshield = 0.6
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield2" ) == 1 then	
				hasremotespaceshield = 0.7
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield1" ) == 1 then	
				hasremotespaceshield = 0.8
			else
				hasremotespaceshield = 0.9	
			end
		end
    
		if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 250000 then 
	    sundamage = 0.055
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 300000 then 
	    sundamage = 0.045	  	  
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 350000 then	
	    sundamage = 0.036	    
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 400000 then
	    sundamage = 0.028	   
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 450000 then
	  	sundamage = 0.021	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 500000 then
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 550000 then
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 600000 then
	  	sundamage = 0.006	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 650000 then
	  	sundamage = 0.003	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 750000 then 
	  	-----    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1000000 then 
	  	-----
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1050000 then 
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1100000 then 
	  	sundamage = 0.003	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1150000 then 
	  	sundamage = 0.006	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1200000 then 
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)     
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1250000 then 
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1300000 then 
	  	sundamage = 0.021	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1350000 then 
	  	sundamage = 0.028	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer) 
		elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1400000 then 
	  	sundamage = 0.036	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)	
	  else	    
	  end

	--Keeper
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Keeper then
    isinorbit = " "	
	  sundamagebalancer = 1.05
		remotespacebalancer = 1.05		
    hassolarshield = 1
    hasremotespaceshield = 1    
    if SobGroup_FillProximitySobGroup ("temp"..SobGroup_OwnedBy(ship), "orbitalstationallies"..SobGroup_OwnedBy(ship), ship, 14000) == 1 then
		  isinorbit = "-SAFE"
      hassolarshield = 0.04
      hasremotespaceshield = 0.04
    else
			if Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield3" ) == 1 then
				hassolarshield = 0.1
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield2" ) == 1 then	
				hassolarshield = 0.3
			elseif Player_HasResearch(SobGroup_OwnedBy(ship), "solarshield1" ) == 1 then	
				hassolarshield = 0.5
			else
				hassolarshield = 0.7
			end
		end
	
		if Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield3" ) == 1 then
			hasremotespaceshield = 0.1
		elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield2" ) == 1 then	
			hasremotespaceshield = 0.3
		elseif Player_HasResearch(SobGroup_OwnedBy(ship), "remotespaceshield1" ) == 1 then	
			hasremotespaceshield = 0.5
		else
			hasremotespaceshield = 0.7
		end	        					    		
    
		if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 250000 then 
	    sundamage = 0.055
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 300000 then 
	    sundamage = 0.045	  	  
			SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 350000 then	
	    sundamage = 0.036	    
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 400000 then
	    sundamage = 0.028	   
	    SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer) 
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 450000 then
	  	sundamage = 0.021	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 500000 then
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 550000 then
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)  
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 600000 then
	  	sundamage = 0.006	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 650000 then
	  	sundamage = 0.003	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hassolarshield*runselectedmultiplier*sundamagebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 750000 then 
	  	-----    
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1000000 then 
	  	-----
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1050000 then 
	  	sundamage = 0.001	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)   
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1100000 then 
	  	sundamage = 0.003	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1150000 then 
	  	sundamage = 0.006	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)      
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1200000 then 
	  	sundamage = 0.01	  
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)     
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1250000 then 
	  	sundamage = 0.015	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1300000 then 
	  	sundamage = 0.021	
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)       
	  elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1350000 then 
	  	sundamage = 0.028	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer) 
		elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1400000 then 
	  	sundamage = 0.036	 
	  	SobGroup_TakeDamage(ship, sundamage*damagemultiplier*hasremotespaceshield*runselectedmultiplier*remotespacebalancer)	
	  else	    
	  end
	  
	end 	--of race
	
	--if SobGroup_OwnedBy(ship) == Universe_CurrentPlayer() then 
	  if SobGroup_Selected(ship) == 1 then
	  	local Kelvin_heat = 10^(5-SobGroup_GetDistanceToSobGroup(ship, "star_sol")/300000)		--(1-SobGroup_GetDistanceToSobGroup(ship, "star_sol")/1000000)*1000
	    if SobGroup_GetDistanceToSobGroup(ship, "star_sol") <= 700000 then
	      UI_SetElementVisible("New1", "sundamagetextred", 1)
		    UI_SetElementVisible("New1", "sundamagetextblu", 0)
		    UI_SetElementVisible("New1", "sundamagetext", 0)
	      UI_SetTextLabelText("New1", "sundamagetextred", floor(Kelvin_heat*damagemultiplier*hassolarshield).."K"..isinorbit);		
	    elseif SobGroup_GetDistanceToSobGroup(ship, "star_sol") >= 1050000 then
	      UI_SetElementVisible("New1", "sundamagetextred", 0)
		    UI_SetElementVisible("New1", "sundamagetextblu", 1)
		    UI_SetElementVisible("New1", "sundamagetext", 0)
	      UI_SetTextLabelText("New1", "sundamagetextblu", floor(Kelvin_heat*damagemultiplier*hasremotespaceshield).."K"..isinorbit);	
	    else
	      UI_SetElementVisible("New1", "sundamagetextred", 0)
		    UI_SetElementVisible("New1", "sundamagetextblu", 0)
		    UI_SetElementVisible("New1", "sundamagetext", 1)
	      UI_SetTextLabelText("New1", "sundamagetext", floor(Kelvin_heat*damagemultiplier).."K"..isinorbit);			
	    end 			
  	end	
  --end  
	return sundamage 
end    

---Orders------------------------------------------------------------------------------------------------------------------------

function orders(ship, ordine, numpilotstosave, numofficerstosave)	  
  if Player_HasResearch(SobGroup_OwnedBy(ship), "isai" ) == 1 then    
    --return 0 
  end
  
--clear
  if ordine == "clear" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_clear") > 0 then	 
      SobGroup_SetHardPointHealth(ship, "hgn_orders_clear", 0) 
      if SobGroup_AreAnyOfTheseTypes(ship, "hgn_shipyard_g") == 1 then
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_solarshield") > 0 then   
	      	SobGroup_SetHardPointHealth(ship, "hgn_orders_solarshield", 0)	
	      end  
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_remotespaceshield") > 0 then   
	      	SobGroup_SetHardPointHealth(ship, "hgn_orders_remotespaceshield", 0)	
	      end 		      
	      if SobGroup_GetHardPointHealth(ship, "boost1") > 0 then		 
          SobGroup_SetHardPointHealth(ship, "boost1", 0)	        
		    end	
		    if SobGroup_GetHardPointHealth(ship, "boost2") > 0 then		 
          SobGroup_SetHardPointHealth(ship, "boost2", 0)	        
		    end	
		    if SobGroup_GetHardPointHealth(ship, "boost3") > 0 then		 
          SobGroup_SetHardPointHealth(ship, "boost3", 0)	        
		    end		      
	    --end   
			elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_crewstation") == 1 then
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_recruit") > 0 then   
	      	SobGroup_SetHardPointHealth(ship, "hgn_orders_recruit", 0)	
	      end	    
	    elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_scaver,vgr_scaver") == 1 then
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_fusion") > 0 then   
	      	SobGroup_SetHardPointHealth(ship, "hgn_orders_fusion", 0)	
	      end	
	    elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_hyperspacestation") == 1 then  
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_hyperspaceinhibitor") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "hgn_orders_hyperspaceinhibitor", 0)	 
	    	end	
			elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_container, vgr_container, kad_container, rad_container") == 1 then  
	      if SobGroup_GetHardPointHealth(ship, "engine_boost_container") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "engine_boost_container", 0)	 
	    	end	
        if SobGroup_GetHardPointHealth(ship, "hgn_orders_trade") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "hgn_orders_trade", 0)	 
	    	end					
	    elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_heavycruiser") == 1 then  
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_deploy") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "hgn_orders_deploy", 0)	 
	    		--SobGroup_SetMaxSpeedMultiplier(ship, 1) 
	    		SobGroup_AbilityActivate(ship, AB_Move, 1)
	    	end
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_mechanic") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "hgn_orders_mechanic", 0)	 
	    	end
	    elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_battlecruiser_hero") == 1 then  
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_deploy") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "hgn_orders_deploy", 0)	 
	    		--SobGroup_SetMaxSpeedMultiplier(ship, 1) 
	    		SobGroup_AbilityActivate(ship, AB_Move, 1)
	    	end
	    end
			--clear dock order
			if SobGroup_AreAnyOfTheseTypes(ship, "hgn_researchstation,hgn_crewstation,hgn_power,hgn_scaver,vgr_scaver,hgn_artillerysentinel,hgn_tanker,hgn_container,vgr_container,kad_container,rad_container,hgn_combatbase") == 0 then  
	      if SobGroup_GetHardPointHealth(ship, "hgn_orders_dock") > 0 then  
	    		SobGroup_SetHardPointHealth(ship, "hgn_orders_dock", 0)
	    		SobGroup_SobGroupSubstract("temp_acceptingfcdock"..SobGroup_OwnedBy(ship), ship)
	    	end        		
	    end
    end         

--clear customizations
  elseif ordine == "cust_clear" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_desorders_clear") > 0 then	 
      SobGroup_SetHardPointHealth(ship, "hgn_desorders_clear", 0) 
      if SobGroup_AreAnyOfTheseTypes(ship, "hgn_destroyer, hgn_sweeperdestroyer, hgn_missiledestroyer, hgn_iondestroyer, hgn_advdestroyer, hgn_artillerydestroyer") == 1 then
	      RemoveSubsystemOnShip(ship, "hgn_desorders_lohealth")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hihealth")
				RemoveSubsystemOnShip(ship, "hgn_desorders_lospeed")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hispeed")
				RemoveSubsystemOnShip(ship, "hgn_desorders_lofire")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hifire")
				RemoveSubsystemOnShip(ship, "hgn_desorders_loaccuracy")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hiaccuracy")
	      RemoveSubsystemOnShip(ship, "hgn_desorders_lorepair")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hirepair")
				RemoveSubsystemOnShip(ship, "hgn_desorders_losensor")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hisensor")
				RemoveSubsystemOnShip(ship, "hgn_desorders_losecurity")
				RemoveSubsystemOnShip(ship, "hgn_desorders_hisecurity")
	    end
	  end

--clear Overseer special functions
  elseif ordine == "overseer_clear" then    
    if SobGroup_GetHardPointHealth(ship, "rad_rc_orders_clear") > 0 then	 
      SobGroup_SetHardPointHealth(ship, "rad_rc_orders_clear", 0) 
      if SobGroup_AreAnyOfTheseTypes(ship, "rad_resourcecontroller") == 1 then
	      RemoveSubsystemOnShip(ship, "rad_rc_orders_cloak")
	      RemoveSubsystemOnShip(ship, "rad_rc_orders_run")
	      RemoveSubsystemOnShip(ship, "rad_rc_orders_fight")
	      RemoveSubsystemOnShip(ship, "rad_rc_orders_detonate")
			end
		end

--Parade
  elseif ordine == "parade" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_parade") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then   
        SobGroup_Stop(SobGroup_OwnedBy(ship), ship)  
	      SobGroup_ParadeSobGroup("temp", ship, 0) 					                  
	    end 
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_parade", 0)	 
    end   

--fusion
  elseif ordine == "fusion" then           

--recruit
  elseif ordine == "recruitement" then  

--trade
  elseif ordine == "trade" then	
        
--guard
  elseif ordine == "guard" then
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_guard") > 0 then
      if SobGroup_FillProximitySobGroupExceptSelf("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then
	      SobGroup_GuardSobGroup("temp", ship)
	    end
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_guard", 0)
    end
--deploy
  elseif ordine == "deploy" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_deploy") > 0 then	             
      --SobGroup_SetMaxSpeedMultiplier(ship, 0.02)
      SobGroup_AbilityActivate(ship, AB_Move, 0)
      SobGroup_AbilityActivate(ship, AB_Steering, 1)
    end
--resurrect needleship
  elseif ordine == "needle" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_needle") > 0 then
    	SobGroup_CreateShip(ship, "kad_needleship")
    	SobGroup_SetHardPointHealth(ship, "hgn_orders_needle", 0)
      SobGroup_SetHealth(ship, 0)
    end
    
--tactics
  elseif ordine == "passive" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_passive") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_SetTactics("temp", PassiveTactics)				                  
	    end 
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_passive", 0)	 
    end  
    
  elseif ordine == "defensive" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_defensive") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_SetTactics("temp", DefensiveTactics)				                  
	    end 
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_defensive", 0)	 
    end  
    
  elseif ordine == "aggressive" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_aggressive") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_SetTactics("temp", AggressiveTactics)				                  
	    end 
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_aggressive", 0)	 
    end 
   
  elseif ordine == "strikegroup_fs" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_strikegroup_fs") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_FormStrikeGroup("temp", "Fighter Screen")				                  
	    end 
	    --SobGroup_SetHardPointHealth(ship, "hgn_orders_strikegroup_fs", 0)	 
    end  
  elseif ordine == "strikegroup_cp" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_strikegroup_cp") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_FormStrikeGroup("temp", "Capital Phalanx")				                  
	    end 
	    --SobGroup_SetHardPointHealth(ship, "hgn_orders_strikegroup_cp", 0)	 
    end  
  elseif ordine == "strikegroup_fl" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_strikegroup_fl") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_FormStrikeGroup("temp", "Frigate Line")				                  
	    end 
	    --SobGroup_SetHardPointHealth(ship, "hgn_orders_strikegroup_fl", 0)	 
    end      
  
  elseif ordine == "dock" then    
    --if SobGroup_GetHardPointHealth(ship, "hgn_orders_dock") > 0 then	             
      --if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      --SobGroup_DockSobGroup( "temp", ship)				                  
	    --end 
	    --SobGroup_SetHardPointHealth(ship, "hgn_orders_dock", 0)	 
    --end
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_dock") > 0 then
    	SobGroup_SobGroupAdd("temp_acceptingfcdock"..SobGroup_OwnedBy(ship), ship)
    end
  
  --tofix  
  elseif ordine == "dock_permanent" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_dock_permanent") > 0 then	             
      if SobGroup_FillProximitySobGroup ("temp", "parader"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_DockSobGroupAndStayDocked( "temp", ship)				                  
	    end 
	    --SobGroup_SetHardPointHealth(ship, "hgn_orders_dock_permanent", 0)	 
    end      
  
  --tofix
  elseif ordine == "hyperspaceinhibitor" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_hyperspaceinhibitor") > 0 then	            
	    if SobGroup_GetHardPointHealth(ship, "hi") > 0 then
	      SobGroup_SetHardPointHealth(ship, "hi", 0)
	    end  
	  else	    
	    if SobGroup_GetHardPointHealth(ship, "hi") == 0 then
	      SobGroup_CreateSubSystem(ship, "hi")
	    end  
    end   
  
  --destroyallguns  
  elseif ordine == "destroyallguns" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_destroyallguns") > 0 then	
      if SobGroup_AreAnyOfTheseTypes(ship, "hgn_artillerysentinel") == 1 then      
		    SobGroup_SetHardPointHealth(ship, "k1", 0)
				SobGroup_SetHardPointHealth(ship, "k2", 0)
				SobGroup_SetHardPointHealth(ship, "k3", 0)
				SobGroup_SetHardPointHealth(ship, "k4", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_battlecruiser, hgn_battlecruiserNUKE") == 1 then		  
		  	SobGroup_SetHardPointHealth(ship, "Weapon IonBeam 1", 0)
				SobGroup_SetHardPointHealth(ship, "Weapon IonBeam 2", 0)
				SobGroup_SetHardPointHealth(ship, "RailBeam 1", 0)
				SobGroup_SetHardPointHealth(ship, "RailBeam 2", 0)
				SobGroup_SetHardPointHealth(ship, "Weapon Rail Beam Back", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 1", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 2", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 3", 0)		
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_battleship") == 1 then
		    SobGroup_SetHardPointHealth(ship, "Weapon IonBeam 1", 0)
				SobGroup_SetHardPointHealth(ship, "Weapon IonBeam 2", 0)
				SobGroup_SetHardPointHealth(ship, "RailBeam 1", 0)
				SobGroup_SetHardPointHealth(ship, "RailBeam 2", 0)
				SobGroup_SetHardPointHealth(ship, "RailBeam 3", 0)	
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 1", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 2", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 3", 0)			
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_vortex") == 1 then
		    SobGroup_SetHardPointHealth(ship, "Rapid Turret 1", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 2", 0)
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 3", 0)		
				SobGroup_SetHardPointHealth(ship, "Rapid Turret 4", 0)		
      elseif SobGroup_AreAnyOfTheseTypes(ship, "hgn_combatbase") == 1 then	    	 
		    SobGroup_SetHardPointHealth(ship, "up", 0)		    
		    SobGroup_SetHardPointHealth(ship, "down", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_destroyer") == 1 then
		    SobGroup_SetHardPointHealth(ship, "TurretTop", 0)
		    SobGroup_SetHardPointHealth(ship, "TurretBottom", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_sinner") == 1 then	    	 
		    SobGroup_SetHardPointHealth(ship, "Weapon_1z", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_2z", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_3z", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_4z", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_5z", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_6z", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_m1", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_m2", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_m3", 0)
		    SobGroup_SetHardPointHealth(ship, "Weapon_m4", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_alkhalid") == 1 then	    	 
		    SobGroup_SetHardPointHealth(ship, "StbdAft", 0)
		    SobGroup_SetHardPointHealth(ship, "PortAft", 0)
		    SobGroup_SetHardPointHealth(ship, "VtlMidA", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_dreadnaught") == 1 then	    	 
		    SobGroup_SetHardPointHealth(ship, "w", 0)
		    SobGroup_SetHardPointHealth(ship, "w1", 0)
		    SobGroup_SetHardPointHealth(ship, "k", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_dreadnaughtB") == 1 then	    	 
		    SobGroup_SetHardPointHealth(ship, "w", 0)
		    SobGroup_SetHardPointHealth(ship, "w1", 0)
		  elseif SobGroup_AreAnyOfTheseTypes(ship, "vgr_artilleryship") == 1 then	    	 
		    SobGroup_SetHardPointHealth(ship, "ModularHardPoint", 0)
		  end  
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_destroyallguns", 0)	
    end     
  
  --solar shield
  elseif ordine == "solarshield" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_solarshield") > 0 then	 
    end 
  --remote space shield
  elseif ordine == "remotespaceshield" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_remotespaceshield") > 0 then   	 
    end    
    
  --gujking
  elseif ordine == "gujkingdisable" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_gujkingdisable") > 0 then 	 
      if SobGroup_IsDockedSobGroup("hgn_mothership"..SobGroup_OwnedBy(ship), ship) == 1 then
        SobGroup_Launch("hgn_mothership"..SobGroup_OwnedBy(ship), ship)
      end  
      if SobGroup_IsDockedSobGroup("hgn_power"..SobGroup_OwnedBy(ship), ship) == 1 then
        SobGroup_Launch("hgn_power"..SobGroup_OwnedBy(ship), ship)
      end 
      if SobGroup_IsDockedSobGroup("hgn_researchstation"..SobGroup_OwnedBy(ship), ship) == 1 then
        SobGroup_Launch("hgn_researchstation"..SobGroup_OwnedBy(ship), ship)
      end 
      if SobGroup_IsDockedSobGroup("hgn_crewstation"..SobGroup_OwnedBy(ship), ship) == 1 then
        SobGroup_Launch("hgn_crewstation"..SobGroup_OwnedBy(ship), ship)
      end 
      if SobGroup_IsDockedSobGroup("hgn_combatbase"..SobGroup_OwnedBy(ship), ship) == 1 then
        SobGroup_Launch("hgn_combatbase"..SobGroup_OwnedBy(ship), ship)
      end   
      SobGroup_SetHardPointHealth(ship, "hgn_orders_gujkingdisable", 0)	  
      FX_StartEvent(ship, "gujkingenable")   	  
    end                          
  elseif ordine == "gujkingenable" then    
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_gujkingenable") > 0 then
      if SobGroup_FillProximitySobGroup ("temp", "hgn_mothership"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_DockSobGroup( "temp", ship)				                  
	    end 
	    if SobGroup_FillProximitySobGroup ("temp", "hgn_power"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_DockSobGroup( "temp", ship)				                  
	    end 
	    if SobGroup_FillProximitySobGroup ("temp", "hgn_researchstation"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_DockSobGroup( "temp", ship)				                  
	    end 
	    if SobGroup_FillProximitySobGroup ("temp", "hgn_crewstation"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_DockSobGroup( "temp", ship)				                  
	    end 
	    if SobGroup_FillProximitySobGroup ("temp", "hgn_combatbase"..SobGroup_OwnedBy(ship), ship, 7000) == 1 then           
	      SobGroup_DockSobGroup( "temp", ship)				                  
	    end 
	    SobGroup_SetHardPointHealth(ship, "hgn_orders_gujkingenable", 0)	    
	    FX_StartEvent(ship, "gujkingenable")   	 
    end   
      
--evacuation    
  elseif ordine == "evacuation" then    
    SobGroup_Clear("temp")
    SobGroup_Clear("temp1")                                        
    SobGroup_GetSobGroupDockedWithGroup(ship, "temp")
    SobGroup_FillShipsByType("temp1", "temp", "evac") 
    if SobGroup_Empty("temp1") == 0 then
      if SobGroup_GetHardPointHealth(ship, "hgn_orders_evacuation") == 0 then
      	SobGroup_CreateSubSystem(ship, "hgn_orders_evacuation")
      end	      
      SobGroup_SetHardPointHealth("temp1", "pilot", numpilotstosave/100) 
	    SobGroup_SetHardPointHealth("temp1", "officer", numofficerstosave/100) 	
	    SobGroup_Launch("temp1", ship)
    end
    if SobGroup_GetHardPointHealth(ship, "hgn_orders_evacuation") > 0 then    	
    	--disable
    	SobGroup_AbilityActivate(ship, AB_Lights, 0) 
      SobGroup_AbilityActivate(ship, AB_Stop, 0) 
      SobGroup_AbilityActivate(ship, AB_Move, 0) 
      SobGroup_AbilityActivate(ship, AB_Attack, 0)
      SobGroup_AbilityActivate(ship, AB_Scuttle, 0) 
      SobGroup_AbilityActivate(ship, AB_Sensors, 0)  	
      SobGroup_AbilityActivate(ship, AB_Builder, 0)
      SobGroup_AbilityActivate(ship, AB_Dock, 0)  
      SobGroup_AbilityActivate(ship, AB_Hyperspace, 0)     
      SobGroup_AbilityActivate(ship, AB_Retire, 0)
      SobGroup_AbilityActivate(ship, AB_Parade, 0)       
      SobGroup_AbilityActivate(ship, AB_DefenseField, 0)       
      SobGroup_AbilityActivate(ship, AB_HyperspaceInhibitor, 0)       
      SobGroup_AbilityActivate(ship, AB_Cloak, 0)   
      SobGroup_AbilityActivate(ship, AB_Guard, 0)     
      SobGroup_TakeDamage(ship, 0.05)      	
      SobGroup_Launch("temp", ship)  
    end
    
--convert 100 energy into RUs
  elseif ordine == "kpr_orders_en100" then
    if SobGroup_GetHardPointHealth(ship, "kpr_orders_en100") > 0 then
    	local conversion = 5000
    	if CPU_Exist_Smart(SobGroup_OwnedBy(ship)) == 0 then
    		conversion = 2500		--nerf the human player
    	end
    	if Player_HasResearch(SobGroup_OwnedBy(ship), "ExterminatorRuBonus") == 1 then
    		conversion = conversion*1.15
    	end
      powerListStored[SobGroup_OwnedBy(ship) + 1] = powerListStored[SobGroup_OwnedBy(ship) + 1] - 100
			powerListManager[SobGroup_OwnedBy(ship)+1].misc = powerListManager[SobGroup_OwnedBy(ship)+1].misc - 100
			Player_SetRU(SobGroup_OwnedBy(ship), Player_GetRU(SobGroup_OwnedBy(ship)) + conversion)
			fusionList[SobGroup_OwnedBy(ship)+1] = fusionList[SobGroup_OwnedBy(ship)+1] + conversion
	    SobGroup_SetHardPointHealth(ship, "kpr_orders_en100", 0)
    else
			if LastpowerListStored[SobGroup_OwnedBy(ship) + 1] < 100 then
				SobGroup_RestrictBuildOption(ship, "kpr_orders_en100")
			else
				SobGroup_UnRestrictBuildOption(ship, "kpr_orders_en100")
			end
    end
    
--convert 1000 RUs into energy
  elseif ordine == "kpr_orders_ru1000" then
    if SobGroup_GetHardPointHealth(ship, "kpr_orders_ru1000") > 0 then
    	local conversion = 20
    	if Player_HasResearch(SobGroup_OwnedBy(ship), "ExterminatorRuBonus") == 1 then
    		conversion = conversion*1.15
    	end
      powerListStored[SobGroup_OwnedBy(ship) + 1] = powerListStored[SobGroup_OwnedBy(ship) + 1] + floor(conversion)
			powerListManager[SobGroup_OwnedBy(ship)+1].production = powerListManager[SobGroup_OwnedBy(ship)+1].production + floor(conversion)
	    SobGroup_SetHardPointHealth(ship, "kpr_orders_ru1000", 0)
    else
			if Player_GetRU(SobGroup_OwnedBy(ship)) < 1000 then
				SobGroup_RestrictBuildOption(ship, "kpr_orders_ru1000")
			else
				SobGroup_UnRestrictBuildOption(ship, "kpr_orders_ru1000")
			end
    end

  elseif ordine == "unplug" then
  	local generatordocked = 0
		SobGroup_Create("KprGeneratorsToLaunch")
		SobGroup_Clear("KprGeneratorsToLaunch")
		SobGroup_GetSobGroupDockedWithGroup(ship, "KprGeneratorsToLaunch")
		if SobGroup_Empty("KprGeneratorsToLaunch") == 0 then
			generatordocked = 1
		end
  	if SobGroup_GetHardPointHealth(ship, "hgn_orders_unplug") > 0 then
  		if generatordocked == 1 then
  			SobGroup_Launch("KprGeneratorsToLaunch", ship)
  			SobGroup_SetHardPointHealth(ship, "hgn_orders_unplug", 0)
  		end
  	else
  		if generatordocked == 0 then
  			SobGroup_RestrictBuildOption(ship, "hgn_orders_unplug")
  		else
  			SobGroup_UnRestrictBuildOption(ship, "hgn_orders_unplug")
  		end
  	end

  end 	--of order types
   
end

function Orders_ExecuteClosestDocking()
	for playerIndex = 0,(Universe_PlayerCount()-1),1 do
		local playerIndexList = playerIndex + 1
		if Player_IsAlive(playerIndex) == 1 then
			if SobGroup_Empty("temp_acceptingfcdock"..playerIndex) == 0 then
				if SobGroup_Empty("fighterallies"..playerIndex) == 0 or SobGroup_Empty("corvetteallies"..playerIndex) == 0 then
					SobGroup_Create("AlliedFiCoForAutodock"..playerIndex)
					SobGroup_Clear("AlliedFiCoForAutodock"..playerIndex)
					SobGroup_SobGroupAdd("AlliedFiCoForAutodock"..playerIndex, "fighterallies"..playerIndex)
					SobGroup_SobGroupAdd("AlliedFiCoForAutodock"..playerIndex, "corvetteallies"..playerIndex)
					local numships = SobGroup_SplitGroupReference("SingleAutodockAlliedFiCo_SOB", "AlliedFiCoForAutodock"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("AlliedFiCoForAutodock"..playerIndex))
					for z = 0, numships - 1, 1 do
						if SobGroup_Empty("SingleAutodockAlliedFiCo_SOB"..z) == 0 then
							if SobGroup_HealthPercentage("SingleAutodockAlliedFiCo_SOB"..z) <= 0.53 then
						    if SobGroup_IsDoingAbility("SingleAutodockAlliedFiCo_SOB"..z, AB_Dock) == 0 and 
				        SobGroup_IsDocked("SingleAutodockAlliedFiCo_SOB"..z) == 0 and 
				        SobGroup_AreAllInRealSpace("SingleAutodockAlliedFiCo_SOB"..z)==1 then
				        	SobGroup_Clear("temp")
				        	local d=15000
				        	if SobGroup_FillProximitySobGroup("temp", "temp_acceptingfcdock"..playerIndex, "SingleAutodockAlliedFiCo_SOB"..z, d) == 1 then
					        	SobGroup_Create("temp_orderdocktartet")
					        	SobGroup_SobGroupAdd("temp_orderdocktartet", "temp")
					        	local can_dock = 0
					        	local dist=d
					        	local numdocks = SobGroup_SplitGroupReference("SingleOrderAutoDock_SOB", "temp", "Player_Ships"..playerIndex, SobGroup_Count("temp"))
										for counter = 0, numdocks - 1, 1 do
											if SobGroup_GetDistanceToSobGroup("SingleAutodockAlliedFiCo_SOB"..z, "SingleOrderAutoDock_SOB"..counter) < dist then
						          	if SobGroup_IsDoingAbility("SingleOrderAutoDock_SOB"..counter, AB_Dock) == 0 and 
						          	SobGroup_HealthPercentage("SingleOrderAutoDock_SOB"..counter) > 0 and 
								      	SobGroup_IsDoingAbility("SingleOrderAutoDock_SOB"..counter, AB_Hyperspace) == 0 and 
								      	SobGroup_IsDoingAbility("SingleOrderAutoDock_SOB"..counter, AB_HyperspaceViaGate) == 0 and 
								      	SobGroup_IsDocked("SingleOrderAutoDock_SOB"..counter) == 0 and 
								      	SobGroup_AreAllInRealSpace("SingleOrderAutoDock_SOB"..counter)==1 then 
								      		SobGroup_Clear("temp_orderdocktartet")
								      		SobGroup_SobGroupAdd("temp_orderdocktartet", "SingleOrderAutoDock_SOB"..counter)
								      		dist=SobGroup_GetDistanceToSobGroup("SingleAutodockAlliedFiCo_SOB"..z, "SingleOrderAutoDock_SOB"..counter)
								      		can_dock = 1
						            end
						          end
								    end
								    if can_dock == 1 then
								    	SobGroup_DockSobGroup("SingleAutodockAlliedFiCo_SOB"..z, "temp_orderdocktartet")
								    end
								  end
			        	end
			        end
		        end				    
				  end
				end
				SobGroup_Clear("temp_acceptingfcdock"..playerIndex)
			end
		end
	end
end

function SobGroup_GetSobGroupDockedWithGroupSize(player, type, group)
  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(player, type) > 0 then
    SobGroup_ForceStayDockedIfDocking(group)						
		for z = 0,(SobGroup_Count("productioncapital"..player)-1),1 do
		  if SobGroup_Empty("splitproductioncapital"..player .. tostring(z)) == 0 then 
	      if SobGroup_IsDoingAbility(group, AB_Retire) == 1 then	 	        	        
	        SobGroup_CreateShip("splitproductioncapital"..player .. tostring(z), type .. tostring("l"))						        
	      end
	    end  
    end						
	end	
end	  		

function enginegujking()  
	for i = 0,(Universe_PlayerCount()-1),1 do		      
		if Player_IsAlive(i) == 1 then
			if Player_HasShipWithBuildQueue(i) == 1 then  
        if SobGroup_Empty("hgn_shipyard_g"..i) == 0 then 				
				  --engine boost
	        boostspeed = floor(SobGroup_GetEquivalentSpeed("hgn_shipyard_g"..i))			
	        if boostspeed >= 45000 then
	          if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3") > 0 then
		          SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 0) 		                    
		          FX_StartEvent("hgn_shipyard_g"..i, "b3")		 
		        elseif SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2") > 0 then
				      SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 0)				      
				      FX_StartEvent("hgn_shipyard_g"..i, "b2")	 
				    elseif SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1") > 0 then
				      SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 0)				      
				      FX_StartEvent("hgn_shipyard_g"..i, "b1")	           
		        end  	          
	        	if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker") == 0 then
			      	SobGroup_CreateSubSystem("hgn_shipyard_g"..i, "engine_boost_3_g_unlocker")
			      end	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2_unlocker") == 0 then
			      	SobGroup_CreateSubSystem("hgn_shipyard_g"..i, "engine_boost_2_g_unlocker")
			      end
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1_unlocker") == 0 then
			      	SobGroup_CreateSubSystem("hgn_shipyard_g"..i, "engine_boost_1_g_unlocker")
			      end	
			    elseif boostspeed >= 11000 then
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2") > 0 then
				      SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 0)				      
				      FX_StartEvent("hgn_shipyard_g"..i, "b2")
				    elseif SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1") > 0 then
				      SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 0)				      
				      FX_StartEvent("hgn_shipyard_g"..i, "b1")	   				          
			      end
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2_unlocker") == 0 then
			      	SobGroup_CreateSubSystem("hgn_shipyard_g"..i, "engine_boost_2_g_unlocker")
			      end
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1_unlocker") == 0 then
			      	SobGroup_CreateSubSystem("hgn_shipyard_g"..i, "engine_boost_1_g_unlocker")
			      end	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost3", 0)   	
			      end
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker", 0)   	
			      end	  			       				    	 	
			    elseif boostspeed >= 3000 then	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1") > 0 then
		          SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 0)
		          FX_StartEvent("hgn_shipyard_g"..i, "b1")
	          end
	        	if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1_unlocker") == 0 then
			      	SobGroup_CreateSubSystem("hgn_shipyard_g"..i, "engine_boost_1_g_unlocker")
			      end	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost3", 0)   	
			      end	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost2", 0)   	
			      end
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker", 0)   	
			      end	  
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2_unlocker") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost2_unlocker", 0)   	
			      end  			    	
			    else
			      SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_Move, 1)
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost3_unlocker", 0)   	
			      end	  
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2_unlocker") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost2_unlocker", 0)   	
			      end  	
			    	if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1_unlocker") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost1_unlocker", 0)   	
			      end  	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost3") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost3", 0)   	
			      end	
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost2") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost2", 0)   	
			      end	   
			      if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "boost1") > 0 then
			      	SobGroup_SetHardPointHealth("hgn_shipyard_g"..i, "boost1", 0)   	
			      end	   
			    end
					---mass shield	         		    
				  if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "shield") > 0 then
				  	if SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "msdocker") > 0 and
					     SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "csdocker") > 0 and
					     SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "psdocker") > 0 and
					     SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "wsdocker") > 0 and
					     SobGroup_GetHardPointHealth("hgn_shipyard_g"..i, "rsdocker") > 0 and
					     SobGroup_IsDoingAbility("hgn_mothership"..SobGroup_OwnedBy("hgn_shipyard_g"..i), AB_DefenseField) == 0 then	
					    SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_DefenseField, 1)			  
					    if (SobGroup_IsDoingAbility("hgn_shipyard_g"..i, abilityList[25]) == 1 and
					       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_massshield") > 0 or Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_massshield1") > 0 or Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_massshield2") > 0 or Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_massshield3") > 0 or
					        bloccoshield[SobGroup_OwnedBy("hgn_shipyard_g"..i)+1] == 1)) then					    
					      --Ping_LabelVisible(Ping_AddSobGroup(SobGroup_HealthPercentage("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) .. " Heavy Mass Shield' HPs", "massshield", "hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)), 1)
					      if bloccoshield[SobGroup_OwnedBy("hgn_shipyard_g"..i)+1] == 1 then			
					        if Player_HasResearch(SobGroup_OwnedBy("hgn_shipyard_g"..i), "ShipyardMAXSHIELDUpgrade3") == 1 then		        
					        	SobGroup_CreateShip("hgn_shipyard_g"..i, "hgn_massshield3")
					        elseif Player_HasResearch(SobGroup_OwnedBy("hgn_shipyard_g"..i), "ShipyardMAXSHIELDUpgrade2") == 1 then
					          SobGroup_CreateShip("hgn_shipyard_g"..i, "hgn_massshield2")
					        elseif Player_HasResearch(SobGroup_OwnedBy("hgn_shipyard_g"..i), "ShipyardMAXSHIELDUpgrade1") == 1 then
					          SobGroup_CreateShip("hgn_shipyard_g"..i, "hgn_massshield1")
					        else
					          SobGroup_CreateShip("hgn_shipyard_g"..i, "hgn_massshield")  
					        end	
					        bloccoshield[SobGroup_OwnedBy("hgn_shipyard_g"..i)+1] = 0
					      end    
					      if Player_HasResearch(SobGroup_OwnedBy("hgn_shipyard_g"..i), "ShipyardMAXSHIELDUpgrade3") == 1 then		        
				        	FX_StartEvent("hgn_shipyard_g"..i, "shield3")
				        elseif Player_HasResearch(SobGroup_OwnedBy("hgn_shipyard_g"..i), "ShipyardMAXSHIELDUpgrade2") == 1 then
				          FX_StartEvent("hgn_shipyard_g"..i, "shield2")
				        elseif Player_HasResearch(SobGroup_OwnedBy("hgn_shipyard_g"..i), "ShipyardMAXSHIELDUpgrade1") == 1 then
				          FX_StartEvent("hgn_shipyard_g"..i, "shield1")
				        else
				          FX_StartEvent("hgn_shipyard_g"..i, "shieldb")  
				        end				      
					      if SobGroup_Empty("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 0 then					        
					        if SobGroup_IsDocked("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 1 then
					          SobGroup_AllowPassiveActionsAlways_Smart("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 1) 
					          SobGroup_AbilityActivate("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), AB_Scuttle, 0) 
					          if SobGroup_HealthPercentage("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) <= 0.35 then
					            SobGroup_SetInvulnerability("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 1)
							        SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_DefenseField, 0)		
							      end  	
							    else
							    	SobGroup_AllowPassiveActionsAlways_Smart("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 0)
							      SobGroup_SetInvulnerability("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 0)
							      SobGroup_DockSobGroupInstant("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_shipyard_g"..i)							          
							    end     		          
					      end  
					    else
					      if bloccoshield[SobGroup_OwnedBy("hgn_shipyard_g"..i)+1] == 0 then
					        SobGroup_Launch("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_shipyard_g"..i)					        
					        bloccoshield[SobGroup_OwnedBy("hgn_shipyard_g"..i)+1] = 1
					        SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_DefenseField, 0)
					      else
					        if SobGroup_Empty("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 0 then
					          if SobGroup_IsDocked("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 1 then
					            SobGroup_AbilityActivate("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), AB_Scuttle, 0) 
							        SobGroup_Launch("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_shipyard_g"..i)			
							      else
							        SobGroup_SetHealth("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 0)
							      end       			        					        
					        end    
					      end 					          
					    end 
					  else
					    SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_DefenseField, 0)
				      if SobGroup_Empty("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 0 then
			          if SobGroup_IsDocked("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 1 then
			            SobGroup_AbilityActivate("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), AB_Scuttle, 0) 
					        SobGroup_Launch("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_shipyard_g"..i)			
					      else
					        SobGroup_SetHealth("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 0)
					      end       
			        end    
			      end 
				  else
				    SobGroup_AbilityActivate("hgn_shipyard_g"..i, AB_DefenseField, 0)
				    if SobGroup_Empty("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 0 then
				      if SobGroup_IsDocked("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i)) == 1 then
				        SobGroup_AbilityActivate("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), AB_Scuttle, 0) 
				        SobGroup_Launch("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), "hgn_shipyard_g"..i)			
				      else
				        SobGroup_SetHealth("hgn_massshield"..SobGroup_OwnedBy("hgn_shipyard_g"..i), 0)
				      end           
		        end   
				  end		
				end
			end	
		end
	end  
end	  

function SobGroup_OneTimeCreationEffectExecute(ship, subsystem, event)
	if SobGroup_GetHardPointHealth(ship, subsystem) > 0.2 then
		SobGroup_SetHardPointHealth(ship, subsystem, 0)
		FX_StartEvent(ship, event)
	end
end

function SobGroup_InWorldBoundForKillingOnly(ship, bound_type)
	if bound_type == 0 then
		bound_type = 1		--use inner bounds instead of outer bounds
	end
	local safefromharm = 1
	if GetGameRubric() == GR_CAMPAIGN then		--debug for single player mission
		safefromharm = 1
	else
		if SobGroup_InWorldBound(ship, bound_type) == 0 and SobGroup_IsDoingAbility(ship, AB_Harvest) == 0 and SobGroup_IsDoingAbility(ship, AB_Salvage) == 0 then		--allow salvagers to go out of map
			SobGroup_Create("Temp_ShipsBothOutAndInvincibleSOB")
			SobGroup_Clear("Temp_ShipsBothOutAndInvincibleSOB")
			SobGroup_Clear("haxor_all_invincibleships")
			if GetGameRubric() == GR_MULTIPLAYER then
			  local playerIndex = 0                           
			  while playerIndex < Universe_PlayerCount() do
			    if Player_IsAlive(playerIndex) == 1 then
			      if Player_HasShipWithBuildQueue(playerIndex) == 1 or Player_NumberOfAwakeShips(playerIndex) >= 0 then
			      	SobGroup_SobGroupAdd("haxor_all_invincibleships", "haxor_invincible"..playerIndex)
			      end
			    end
			    playerIndex = playerIndex + 1
			  end
				SobGroup_FillCompare("Temp_ShipsBothOutAndInvincibleSOB", ship, "haxor_all_invincibleships")
			else
				local playerIndex = Universe_CurrentPlayer()
				SobGroup_FillCompare("Temp_ShipsBothOutAndInvincibleSOB", ship, "haxor_invincible"..playerIndex)
			end
			if SobGroup_Empty("Temp_ShipsBothOutAndInvincibleSOB") == 1 then
				safefromharm = 0
			end
		end
	end
	return safefromharm
end

function UI_DisplaySubsystems(num)
	if num == 0 then
		UI_SetElementSize("NewTaskbar", "subsystems", 0, 0); 
	elseif num < 6 then
		UI_SetElementSize("NewTaskbar", "subsystems", num*32, 24); 
	elseif num == 6 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 24);
	elseif num == 7 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
		UI_SetElementSize("NewTaskbar", "subsystem8", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
	elseif num == 8 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
		UI_SetElementSize("NewTaskbar", "subsystem9", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
	elseif num == 9 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
		UI_SetElementSize("NewTaskbar", "subsystem10", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
	elseif num == 10 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
		UI_SetElementSize("NewTaskbar", "subsystem11", 0, 0); 
		UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
	elseif num == 11 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
		UI_SetElementSize("NewTaskbar", "subsystem12", 0, 0); 
	elseif num == 12 then 
		UI_SetElementSize("NewTaskbar", "subsystems", 210, 48);
	end
end

function RaceDisplayInInterface(player)
	if Player_GetRace(player) == Race_Hiigaran then
	   UI_SetTextLabelText("NewTaskbar", "unitrace", "Hiigaran");	        	    
	elseif Player_GetRace(player) == Race_Vaygr then
	   UI_SetTextLabelText("NewTaskbar", "unitrace", "Vaygr");
	elseif Player_GetRace(player) == Race_Kadeshi then
	   UI_SetTextLabelText("NewTaskbar", "unitrace", "Kadeshi");
	elseif Player_GetRace(player) == Race_Raider then
	   UI_SetTextLabelText("NewTaskbar", "unitrace", "Raider");
	elseif Player_GetRace(player) == Race_Keeper then
	   UI_SetTextLabelText("NewTaskbar", "unitrace", "Progenitor");
	end
end

function GetPlayerNameWithColour(playerIndex)
	local current_name = Player_GetPlayerName(playerIndex)	--not Player_GetName(<iPlayerIndex>)
	if playerIndex == Universe_CurrentPlayer() then
		return "<c=00FF40>"..current_name.."</c>"		--ooff40
	elseif playerIndex < 0 then
		return ""
	else
		if AreAllied(Universe_CurrentPlayer(), playerIndex) == 1 then
			return "<c=FFFF00>"..current_name.."</c>"		--ffff00
		else
			return "<c=FF0000>"..current_name.."</c>"
		end
	end
end

function AddPlayerColourToText(playerIndex, string)
	if playerIndex == Universe_CurrentPlayer() then
		return "<c=00FF40>"..string.."</c>"		--ooff40
	elseif playerIndex < 0 then
		return string
	else
		if AreAllied(Universe_CurrentPlayer(), playerIndex) == 1 then
			return "<c=FFFF00>"..string.."</c>"		--ffff00
		else
			return "<c=FF0000>"..string.."</c>"
		end
	end
end

function String_AddRainbowColourBasedOnNumber(number, string, min, max)
	--local prefix = {"<c=FB0000>", "<c=FB5200>", "<c=FBC200>", "<c=FBF400>", "<c=97FB00>", "<c=1AFB00>", "<c=00FB71>", "<c=00FBAF>", "<c=00FBFB>", "<c=008AFB>", "<c=001AFB>", "<c=A300FB>"}		--red to blue
	local prefix = {"<c=f80c12>", "<c=ee1100>", "<c=ff3311>", "<c=ff4422>", "<c=ff6644>", "<c=ff9933>", "<c=feae2d>", "<c=ccbb33>", "<c=d0c310>", "<c=aacc22>", "<c=69d025>", "<c=22ccaa>", "<c=12bdb9>", "<c=11aabb>", "<c=4444dd>", "<c=3311bb>", "<c=3b0cbd>", "<c=442299>"}		--red to purple
	local num_colours = getn(prefix)
	local step = (max-min)/num_colours
	local chosen_colour = floor(number/step)
	if chosen_colour > num_colours then
		chosen_colour = num_colours
	elseif chosen_colour < 1 then
		chosen_colour = 1
	end
	return ""..prefix[chosen_colour]..string.."</c>"
end

function UI_ShowRandomElement(screen, element, enable)
	local num = 1
	if screen == "rank" then
		num = 7
	elseif screen == "gamble" then
		if element == "btnWin" then
			num = 7
		elseif element == "btnLose" then
			num = 9
		end
	elseif screen == "general" then
		num = 8
	end
	for x=1,num do
		UI_SetElementVisible(screen, element..x, 0)
	end
	local show_id = random_pseudo(1,num)
	if enable == nil then
		UI_SetElementVisible(screen, element..show_id, 1)
		return show_id
	elseif enable == 1 then
		UI_SetElementVisible(screen, element..show_id, 1)
		return show_id
	elseif enable == 0 then
		return 0
	end
end

function UI_ShowRandomButtonWithDialogue(playerIndex, screen)
	local playerIndexList = playerIndex + 1
	local prefix = "btn"
	local ButtonTable = {{"Self", 1}, {"Allied", 1}, {"AlliedMale", 1}, {"AlliedFemale", 1}, {"Enemy", 1}, {"EnemyMale", 1}, {"EnemyFemale", 1}}
	if screen == "rurace" then
		ButtonTable = {{"Self", 4}, {"Allied", 4}, {"AlliedMale", 4}, {"AlliedFemale", 4}, {"Enemy", 4}, {"EnemyMale", 4}, {"EnemyFemale", 4}}
	elseif screen == "death" then
		ButtonTable = {{"Self", 7}, {"Allied", 4}, {"AlliedMale", 4}, {"AlliedFemale", 4}, {"Enemy", 6}, {"EnemyMale", 6}, {"EnemyFemale", 6}}
	end
	for z, iCount in ButtonTable do
		for x=1,iCount[2] do
			UI_SetElementVisible(screen, prefix..iCount[1]..x, 0)
		end
	end
	local button_type = 1	--self by default
	if playerIndex ~= Universe_CurrentPlayer() then		--other players
		if AreAllied(Universe_CurrentPlayer(), playerIndex) == 1 then		--allied
			if cpuname == 3 then 	--personal names with gender
				if Temp_GlobalVariable.PlayerGender[playerIndexList] == 0 then
					button_type = 3		--allied male
				elseif Temp_GlobalVariable.PlayerGender[playerIndexList] == 1 then
					button_type = 4		--allied female
				else
					button_type = 2		--allied (debug)
				end
			else		--cpu name without gender
				button_type = 2		--allied
			end
		else			--enemy
			if cpuname == 3 then 	--personal names with gender
				if Temp_GlobalVariable.PlayerGender[playerIndexList] == 0 then
					button_type = 6		--enemy male
				elseif Temp_GlobalVariable.PlayerGender[playerIndexList] == 1 then
					button_type = 7		--enemy female
				else
					button_type = 5		--enemy (debug)
				end
			else		--cpu name without gender
				button_type = 5		--enemy
			end
		end
	end
	UI_SetElementVisible(screen, prefix..ButtonTable[button_type][1]..random_pseudo(1,ButtonTable[button_type][2]), 1)
end