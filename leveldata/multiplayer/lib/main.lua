function MainRule()  
  local playerCount = Universe_PlayerCount();
  local numAlive = 0;
  local numEnemies = 0;
  local gameOver = 1;
  local playerIndex = 0;	   
  while (playerIndex < playerCount) do      
    if (Player_IsAlive(playerIndex)==1) then    
      local otherPlayerIndex = 0;
      while (otherPlayerIndex < playerCount) do      
        if (AreAllied(playerIndex, otherPlayerIndex) == 0) then        
          if (Player_IsAlive(otherPlayerIndex)==1) then
            gameOver = 0
          else
            numEnemies = numEnemies + 1
          end  
        end
        otherPlayerIndex = otherPlayerIndex+1;
      end
      numAlive = numAlive + 1;
    end
    playerIndex = playerIndex+1
  end  
  if (numEnemies == 0 and numAlive>0) then
    gameOver = 0;
  end 
  if (gameOver==1) then
  	print("GAME OVER! Players left: "..numAlive..", year: "..year)
  	if Player_IsAlive(Universe_CurrentPlayer()) == 1 then
  		UI_PlaySound("SFX_VictoryIsOurs")
  	else
  		UI_PlaySound("SFX_ThisIsCalledAllTheBasics")
  	end
  	if GetGameRubric() == GR_MULTIPLAYER then	--in multiplayer mode, game should instantly finish (default game end) to prevent out of sync error
			Rule_Add("waitForEnd")
		  Event_Start("endGame")
  	else	--non-multiplayer, allows final cinematic mode
		  Update_AllShips()
	  	local death_mode = 0
	  	local focus_ship = "AllShips"
	  	--let these sobgroups continue to be updated after the current player is dead
	  	SobGroup_Clear("enemies"..Universe_CurrentPlayer())
			SobGroup_Clear("allies"..Universe_CurrentPlayer())
	  	for z = 0,(Universe_PlayerCount()-1),1 do	        
			  if Player_IsAlive(z) == 1 then     
			    if AreAllied(Universe_CurrentPlayer(), z) == 0 then		     	            
			      SobGroup_SobGroupAdd("enemies"..Universe_CurrentPlayer(), "Player_Ships"..z)
			      SobGroup_SobGroupSubstract("enemies"..Universe_CurrentPlayer(), "supporter"..z)
			    else
			    	SobGroup_SobGroupAdd("allies"..Universe_CurrentPlayer(), "Player_Ships"..z)
			    end
			  end
			end
	  	if SobGroup_Empty("allies"..Universe_CurrentPlayer()) == 0 then	--allied win
		  	local numShips = SobGroup_SplitGroupReference("SingleDeathCamtarget_SOB", "allies"..Universe_CurrentPlayer(), "AllShips", SobGroup_Count("allies"..Universe_CurrentPlayer()))
	   		if numShips == 0 then
	   			death_mode = 1
	   		else
	   			focus_ship = "SingleDeathCamtarget_SOB"..random(0,numShips-1)
	   		end
		  elseif SobGroup_Empty("enemies"..Universe_CurrentPlayer()) == 0 then	--enemy win
				local numShips = SobGroup_SplitGroupReference("SingleDeathCamtarget_SOB", "enemies"..Universe_CurrentPlayer(), "AllShips", SobGroup_Count("enemies"..Universe_CurrentPlayer()))
	   		if numShips == 0 then
	   			death_mode = 1
	   		else
	   			focus_ship = "SingleDeathCamtarget_SOB"..random(0,numShips-1)
	   		end
	   	else	--all dead?
	   		death_mode = 1
	    end
	    if death_mode == 0 then		--game end with free look
				cinecontatore[1] = 0
			  UI_UnBindKeyEvent(ESCKEY) 
			  UI_UnBindKeyEvent(F1KEY)
			  UI_UnBindKeyEvent(F2KEY)
			  UI_UnBindKeyEvent(F3KEY)  
				UI_UnBindKeyEvent(F4KEY)  
				UI_UnBindKeyEvent(F5KEY)			
			  Rule_Remove("Cinematic")
		    --create camera
				Volume_Delete("deathcam")
				Volume_Delete("deathcam1")
				Volume_Delete("deathcam2")
				Volume_Delete("deathcam3")
				local sob_position = SobGroup_GetPosition(focus_ship)
				Volume_AddSphere("deathcam",{sob_position[1],sob_position[2],sob_position[3],},1000)
				Volume_AddSphere("deathcam1",{sob_position[1]+2000,sob_position[2],sob_position[3],},1000)
				Volume_AddSphere("deathcam2",{sob_position[1],sob_position[2]+2000,sob_position[3],},1000)
				Volume_AddSphere("deathcam3",{sob_position[1],sob_position[2],sob_position[3]+2000,},1000)
		  	Rule_Add("DeathCinematic")
		  	Rule_AddInterval("YesNoDialogVictory", 1)
		  else		--default game end
				Rule_Add("waitForEnd")
			  Event_Start("endGame")
		  end
	  end
	  local playerCount = Universe_PlayerCount();
	  local playerIndex = 0;
	  while (playerIndex < playerCount) do
	    if (Player_IsAlive(playerIndex) == 1) then
	    	Accolade_PrintPlayerStats(playerIndex)
	    end
	    playerIndex = playerIndex+1
	  end
	  Rule_Remove("MainRule")
	end
end
function waitForEnd()
  if(Event_IsDone("endGame")==1) then
    setGameOver()
    Rule_Remove("waitForEnd")
  end
end

function CheckMothershipDeadRule()
  local playerCount = Universe_PlayerCount();
  local playerIndex = 0;
  local playerIndexList = 0
  local mothershipdead = random(1,4);
  while (playerIndex < playerCount) do
    playerIndexList = playerIndex + 1		
    if (Player_IsAlive(playerIndex) == 1) then
	    if Player_GetRace(playerIndex) == Race_Hiigaran then  
		    if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 0 then
		    	Main_PlayerObituary(playerIndex)
		      UI_SetScreenEnabled("death", 1)		
					UI_SetScreenVisible("death", 1)	
					UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy Mothership"..Time_PrintYear());	
		      if mothershipdead == 1 then
			      UI_SetTextLabelText("death", "lblDescription1", "Never leave the mothership at home, "..GetPlayerNameWithColour(playerIndex).." says");	
			    elseif mothershipdead == 2 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).."'s mothership became Garbage of Hiigara");	
			    elseif mothershipdead == 3 then
			      UI_SetTextLabelText("death", "lblDescription1", "Karan S'jet got fired by "..GetPlayerNameWithColour(playerIndex).."");	
			    elseif mothershipdead == 4 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." found out mothership can explode too");	
			    end		
			    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
					--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
					Player_Kill(playerIndex)
					Accolade_PrintPlayerStats(playerIndex)
		    end
		  elseif Player_GetRace(playerIndex) == Race_Vaygr then
		    if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") == 0 then
		    	Main_PlayerObituary(playerIndex)
		      UI_SetScreenEnabled("death", 1)		
					UI_SetScreenVisible("death", 1)	
					UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy Mothership"..Time_PrintYear());	
		      if mothershipdead == 1 then
			      UI_SetTextLabelText("death", "lblDescription1", "Where's my flagship? -- the last word from "..GetPlayerNameWithColour(playerIndex).."");	
			    elseif mothershipdead == 2 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).."'s flagship became a splendid firework");	
			    elseif mothershipdead == 3 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." just forgot to make a movie of it");	
			    elseif mothershipdead == 4 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." was taken home on that flagship");	
			    end
			    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
					--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
					Player_Kill(playerIndex)
					Accolade_PrintPlayerStats(playerIndex)
		    end
		  elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		    if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship") == 0 then
		    	Main_PlayerObituary(playerIndex)
		      UI_SetScreenEnabled("death", 1)		
					UI_SetScreenVisible("death", 1)	
					UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy Needleship"..Time_PrintYear());	
		      if mothershipdead == 1 then
			      UI_SetTextLabelText("death", "lblDescription1", "May the Garden be with "..GetPlayerNameWithColour(playerIndex).."'s needleship");	
			    elseif mothershipdead == 2 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).."'s needleship is now part of the nebula");	
			    elseif mothershipdead == 3 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." forgot to pray this morning");	
			    elseif mothershipdead == 4 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." needs a new religion, desperately");	
			    end
			    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
					--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
					Player_Kill(playerIndex)
					Accolade_PrintPlayerStats(playerIndex)
		    end
		  elseif Player_GetRace(playerIndex) == Race_Raider then
		    if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_mothership") == 0 then
		    	Main_PlayerObituary(playerIndex)
		      UI_SetScreenEnabled("death", 1)		
					UI_SetScreenVisible("death", 1)	
					UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy Pirate Ship"..Time_PrintYear());
		      if mothershipdead == 1 then
			      UI_SetTextLabelText("death", "lblDescription1", "No more ships available on black market for "..GetPlayerNameWithColour(playerIndex).."");	
			    elseif mothershipdead == 2 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." failed to be an adequate pirate");	
			    elseif mothershipdead == 3 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).."'s ass got kicked by the galaxy police");	
			    elseif mothershipdead == 4 then
			      UI_SetTextLabelText("death", "lblDescription1", "It's too late for "..GetPlayerNameWithColour(playerIndex).." to bury all the treasures");	
			    end
			    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
					--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
					Player_Kill(playerIndex)
					Accolade_PrintPlayerStats(playerIndex)
		    end
		  elseif Player_GetRace(playerIndex) == Race_Keeper then
		    if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_shipyard_old") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_carrier") == 0 then		
		      Main_PlayerObituary(playerIndex)
		      UI_SetScreenEnabled("death", 1)		
					UI_SetScreenVisible("death", 1)	
					UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy Mother Ship"..Time_PrintYear());
		      if mothershipdead == 1 then
			      UI_SetTextLabelText("death", "lblDescription1", "The only heritage left by "..GetPlayerNameWithColour(playerIndex).." is a joke");	
			    elseif mothershipdead == 2 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." has gone back into the history book");	
			    elseif mothershipdead == 3 then
			      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." couldn't play god afterall");	
			    elseif mothershipdead == 4 then
			      UI_SetTextLabelText("death", "lblDescription1", "When the calendar of "..GetPlayerNameWithColour(playerIndex).." ended is now clear");	
			    end
			    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
					--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
					Player_Kill(playerIndex)
					Accolade_PrintPlayerStats(playerIndex)
		    end
		  end  
		end  
	  playerIndex = playerIndex+1
  end 
end

function Main_PlayerObituary(playerIndex)	--shows player death message in subtitle
	Subtitle_Message("\n\n\n"..GetPlayerNameWithColour(playerIndex).." is rekt"..Time_PrintYear().."\n\n\n", 15)
end

function CheckProductionDeadRule()
  local playerCount = Universe_PlayerCount();
  local playerIndex = 0; 
  local playerIndexList = 0
  local productiondead = random(1,10);
  while (playerIndex < playerCount) do
  	playerIndexList = playerIndex + 1
    if (Player_IsAlive(playerIndex) == 1) then
    	local killplayer = 0
	    SobGroup_Create("PlayerShipsExceptSupporter"..playerIndex)
	    SobGroup_Clear("PlayerShipsExceptSupporter"..playerIndex)
	    SobGroup_FillSubstract("PlayerShipsExceptSupporter"..playerIndex, "Player_Ships"..playerIndex, "supporter"..playerIndex)
	    SobGroup_SobGroupSubstract("PlayerShipsExceptSupporter"..playerIndex, "all_capturablemegaliths")	--exclude captured megaliths with build ability
	    if SobGroup_CanDoAbility("PlayerShipsExceptSupporter"..playerIndex, AB_Builder) == 0 and SobGroup_Count("productioncapital"..playerIndex) == 0 then 		--SobGroup_Count("productioncapital"..playerIndex) == 0
	      SobGroup_TakeDamage("supporter"..playerIndex, 1)
	      killplayer = 1
	    end
	    if Player_HasShipWithBuildQueue(playerIndex)==0 or killplayer == 1 then		--absolutely no ship in the fleet can have build queue, not even megaliths, otherwise the player won't die! 
	      Main_PlayerObituary(playerIndex)
	      UI_SetScreenEnabled("death", 1)
				UI_SetScreenVisible("death", 1)
				UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy Production"..Time_PrintYear());					      
	      if productiondead == 1 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." won't produce any more waste");	
		    elseif productiondead == 2 then
		      UI_SetTextLabelText("death", "lblDescription1", "It seems that "..GetPlayerNameWithColour(playerIndex).."'s trainer didn't work");	
		    elseif productiondead == 3 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." forgot to take out a space insurance");	
			  elseif productiondead == 4 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." won't choose this race again");	
			  elseif productiondead == 5 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." just proved shit happens");	
			  elseif productiondead == 6 then
			    UI_SetTextLabelText("death", "lblDescription1", "The last thing "..GetPlayerNameWithColour(playerIndex).." built was a coffin");	
			  elseif productiondead == 7 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." files for bankruptcy protection");	
			  elseif productiondead == 8 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." just can't explain anything");	
			  elseif productiondead == 9 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." has shown the spirit of noob");
			  elseif productiondead == 10 then
			    UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." does have some skill in running away");
		    end
		    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
				--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
				Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
				Player_Kill(playerIndex)
				Accolade_PrintPlayerStats(playerIndex)
	    end
	  end  
	  playerIndex = playerIndex+1
  end 
end

function CheckDeadRule()
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;	
	local playerIndexList = 0
	local alldead = random(1,9);
	while (playerIndex < playerCount) do
		playerIndexList = playerIndex + 1
		if (Player_IsAlive(playerIndex) == 1) then
			local special_death = 1
			if GetGameRubric() ~= GR_MULTIPLAYER then
				if GameRulesName == "Simplex Sole Survivor" then
					--if SobGroup_Empty("haxor_inhyperspace"..Universe_CurrentPlayer()) == 0 or SobGroup_Empty("haxor_inhyperspace_debug"..Universe_CurrentPlayer()) == 0 then
					--	special_death = 0		--ships hacked into hyperspace won't be counted as awake ships!
					--end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, SoleSurvivorType[playerIndexList]) > 0 then
						special_death = 0
					end
				end
			end
			if Player_NumberOfAwakeShips(playerIndex)<=1 and special_death == 1 then
				Main_PlayerObituary(playerIndex)
			  UI_SetScreenEnabled("death", 1)		
				UI_SetScreenVisible("death", 1)	
				UI_SetTextLabelText("death", "lblSubTitle", "Someone Made It: Destroy All"..Time_PrintYear());
	      if alldead == 1 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." is dead, really dead...");	
		    elseif alldead == 2 then
		      UI_SetTextLabelText("death", "lblDescription1", "Not even a probe of "..GetPlayerNameWithColour(playerIndex).." survived");	
		    elseif alldead == 3 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." hasn't found a trainer yet");	
		    elseif alldead == 4 then
		      UI_SetTextLabelText("death", "lblDescription1", "The claw of death has firmly grasped "..GetPlayerNameWithColour(playerIndex).."");	
		    elseif alldead == 5 then
		      UI_SetTextLabelText("death", "lblDescription1", "This message goes FHOOOM over "..GetPlayerNameWithColour(playerIndex).."'s head");	
		    elseif alldead == 6 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." went to visit the Progenitor");	
		    elseif alldead == 7 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." has found the path to heaven");	
		    elseif alldead == 8 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." has finally succumbed to entropy");	
		    elseif alldead == 9 then
		      UI_SetTextLabelText("death", "lblDescription1", ""..GetPlayerNameWithColour(playerIndex).." loved this game to death");	
		    end
		    UI_ShowRandomButtonWithDialogue(playerIndex, "death")
				--Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
				Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
				Player_Kill(playerIndex)
				Accolade_PrintPlayerStats(playerIndex)
			end			
		end	
		playerIndex = playerIndex+1
	end	
end

function CheckStore100000RUsDeadRule()
	local playerCount = Universe_PlayerCount();
	local playerIndex = 0;		
	while (playerIndex < playerCount) do
		if (Player_IsAlive(playerIndex) == 1) then
	    SobGroup_Create("PlayerShipsExceptSupporter"..playerIndex)
	    SobGroup_Clear("PlayerShipsExceptSupporter"..playerIndex)
	    SobGroup_FillSubstract("PlayerShipsExceptSupporter"..playerIndex, "Player_Ships"..playerIndex, "supporter"..playerIndex)
	    SobGroup_SobGroupSubstract("PlayerShipsExceptSupporter"..playerIndex, "all_capturablemegaliths")	--exclude captured megaliths with build ability
	    if SobGroup_CanDoAbility("PlayerShipsExceptSupporter"..playerIndex, AB_Builder) == 0 and SobGroup_Count("productioncapital"..playerIndex) == 0 then			--SobGroup_Count("productioncapital"..playerIndex) == 0
	      SobGroup_TakeDamage("supporter"..playerIndex, 1)
	    end     	
		  if (Player_HasShipWithBuildQueue(playerIndex)==1) then
				if Player_GetRU(playerIndex) >= 100000 then				
				  Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100") 
				  --Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")				
					for i = 0,5,1 do
					  if Player_IsAlive(i) == 1 then
						  if i ~= playerIndex then
						    Player_Kill(i)
						    Accolade_PrintPlayerStats(i)
						  end  
						end  
					end 						 	
				end	
			else
				Player_Kill(playerIndex)
				Accolade_PrintPlayerStats(playerIndex)
			end	
		end	
		playerIndex = playerIndex+1
	end	
	
---ati display	 
  ATI_Clear()  
  if UI_ScreenIsActive("NewTaskbar") == 1 and UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 1 then
	  playerIndex = 0
	  local ATIRect = {0.4355, 0.333, 0.5, 0.02}
	  while (playerIndex < playerCount) do        
	    ATI_CreateParameters(RRPN_Parameters)
	    local playerName = Player_GetName(playerIndex)
	    ATI_AddWString(RRPI_PlayerName, playerName)
			local progress = Player_GetRU(playerIndex) / 100000
	    ATI_AddFloat(RRPI_PlayerProgress, progress)
	    local playerColour = {1.0, 1.0, 1.0, 1.0}
	    ATI_AddColour(RRPI_PlayerColour, playerColour)
	    ATI_Display2D("playerProgress", ATIRect, 0)
	    ATIRect[2] = ATIRect[2] - 0.025
			playerIndex = playerIndex+1
	  end	
	end  
end

function Check5battlepointsDeadRule()
  if (Player_IsAlive(0) == 1) then	
		if Player_NumberOfAwakeShips(0)<=1 or battlearena[4] >= 5 then		
			UI_SetScreenEnabled("death", 1)		
			UI_SetScreenVisible("death", 1)	
			UI_SetTextLabelText("death", "lblSubTitle", "Battle Arena, 5 Battle Points"..Time_PrintYear());							
			UI_SetTextLabelText("death", "lblDescription1", "It's a fiasco for " .. GetPlayerNameWithColour(0));
	    UI_ShowRandomButtonWithDialogue(0, "death")
			Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
			Player_Kill(0)
			Accolade_PrintPlayerStats(0)
		end	
	end		
	if (Player_IsAlive(1) == 1) then	
		if Player_NumberOfAwakeShips(1)<=1 or battlearena[3] >= 5 then		
			UI_SetScreenEnabled("death", 1)		
			UI_SetScreenVisible("death", 1)	
			UI_SetTextLabelText("death", "lblSubTitle", "Battle Arena, 5 Battle Points"..Time_PrintYear());							
			UI_SetTextLabelText("death", "lblDescription1", "It's a fiasco for " .. GetPlayerNameWithColour(1));
	    UI_ShowRandomButtonWithDialogue(1, "death")
			Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
			Player_Kill(1)
			Accolade_PrintPlayerStats(1)
		end	
	end				
end
function Check10battlepointsDeadRule()
  if (Player_IsAlive(0) == 1) then	
		if Player_NumberOfAwakeShips(0)<=1 or battlearena[4] >= 10 then		
			UI_SetScreenEnabled("death", 1)		
			UI_SetScreenVisible("death", 1)	
			UI_SetTextLabelText("death", "lblSubTitle", "Battle Arena, 10 Battle Points"..Time_PrintYear());							
			UI_SetTextLabelText("death", "lblDescription1", "It's a total humiliation for " .. GetPlayerNameWithColour(0));
	    UI_ShowRandomButtonWithDialogue(0, "death")
			Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
			Player_Kill(0)
			Accolade_PrintPlayerStats(0)
		end	
	end		
	if (Player_IsAlive(1) == 1) then	
		if Player_NumberOfAwakeShips(1)<=1 or battlearena[3] >= 10 then		
			UI_SetScreenEnabled("death", 1)		
			UI_SetScreenVisible("death", 1)	
			UI_SetTextLabelText("death", "lblSubTitle", "Battle Arena, 10 Battle Points"..Time_PrintYear());							
			UI_SetTextLabelText("death", "lblDescription1", "It's a total humiliation for " .. GetPlayerNameWithColour(1));
	    UI_ShowRandomButtonWithDialogue(1, "death")
			Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
			Player_Kill(1)
			Accolade_PrintPlayerStats(1)
		end	
	end				
end
function Check15battlepointsDeadRule()
  if (Player_IsAlive(0) == 1) then	
		if Player_NumberOfAwakeShips(0)<=1 or battlearena[4] >= 15 then		
			UI_SetScreenEnabled("death", 1)		
			UI_SetScreenVisible("death", 1)	
			UI_SetTextLabelText("death", "lblSubTitle", "Battle Arena, 15 Battle Points"..Time_PrintYear());							
			UI_SetTextLabelText("death", "lblDescription1", "" .. GetPlayerNameWithColour(0).." got rekt");
	    UI_ShowRandomButtonWithDialogue(0, "death")
			Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
			Player_Kill(0)
			Accolade_PrintPlayerStats(0)
		end	
	end		
	if (Player_IsAlive(1) == 1) then	
		if Player_NumberOfAwakeShips(1)<=1 or battlearena[3] >= 15 then		
			UI_SetScreenEnabled("death", 1)		
			UI_SetScreenVisible("death", 1)	
			UI_SetTextLabelText("death", "lblSubTitle", "Battle Arena, 15 Battle Points"..Time_PrintYear());							
			UI_SetTextLabelText("death", "lblDescription1", "" .. GetPlayerNameWithColour(1).." got rekt");
	    UI_ShowRandomButtonWithDialogue(1, "death")
			Sound_SpeechPlay("data:sound\\speech\\missions\\m_15\\47100")
			Player_Kill(1)
			Accolade_PrintPlayerStats(1)
		end	
	end				
end

function DeathCinematic()  	
  if Rule_Exists("Cinematic") == 1 then
	  CinematicControllerStop() 
	end
	UI_SetScreenEnabled("death", 0)		
	UI_SetScreenVisible("death", 0)	
	--UI_SetElementEnabled("NewTaskbar", "btnBuild", 0)
	--UI_SetElementEnabled("NewTaskbar", "btnResearch", 0)
	--UI_SetElementEnabled("NewTaskbar", "btnLaunch", 0)
	--UI_SetElementEnabled("NewTaskbar", "btnFleet", 0)
	local r = random(1,26)
	Camera_FocusVolumeKeepingEyePosition ("s"..r)	
  if cinecontatore[1] == 0 then
	  Event_Start("startcinematic")
		Rule_AddInterval("dc",2)     	
	end	
	if cinecontatore[1] == 1 then
		local gamename = "COMPLEX SIMPLE"
		if GameRulesName~= nil then
			gamename = strupper(GameRulesName)
		end
		local caption = "\n\n\n\n\n"..gamename.."\n\n\n\n\nan idea by\n\n\n\n\nsomeone\n\n\n\n\n"
	  Subtitle_Message(caption, 30)
	end		
	r = random(1,6)
	if cinecontatore[1] > 8 then 
		SobGroup_Create("Temp_DeathCamNeutralObjects")
		SobGroup_SobGroupAdd("Temp_DeathCamNeutralObjects", "megalitenoowner")
		SobGroup_SobGroupAdd("Temp_DeathCamNeutralObjects", "SOB_EndgameCrisis")
		SobGroup_SobGroupSubstract("Temp_DeathCamNeutralObjects", "meg_crate")	--don't focus on crates in cinematic mode
	  local nm = SobGroup_SplitGroupFromGroup("temp", "Temp_DeathCamNeutralObjects", SobGroup_Count("Temp_DeathCamNeutralObjects"), "splitter")
		if nm > 0 then
			r = random(0,nm-1)					
			SobGroup_Clear("focus") 
			SobGroup_SobGroupAdd("focus", "temp"..r)	
			r = random(1,8)
		end		  
	end	
	if r == 1 then	 
		Event_Start("deathfocus1") 		
	elseif r == 2 then
		Event_Start("deathfocus2")    
	elseif r == 3 then
		Event_Start("deathfocus3")		
	elseif r == 4 then
		Event_Start("deathfocus4")    
	elseif r == 5 then
		Event_Start("deathfocus5")	
	elseif r == 6 then
		Event_Start("deathfocus6")   
	elseif r == 7 then	 
		Event_Start("deathfocus7") 		
	elseif r == 8 then
		Event_Start("deathfocus8")   		
	end
  Update_AllShips()
	local death_mode = 0
	local focus_ship = "AllShips"
	if SobGroup_Empty("allies"..Universe_CurrentPlayer()) == 0 then	--allied win
  	local numShips = SobGroup_SplitGroupReference("SingleDeathCamtarget_SOB", "allies"..Universe_CurrentPlayer(), "AllShips", SobGroup_Count("allies"..Universe_CurrentPlayer()))
 		if numShips == 0 then
 			death_mode = 1
 		else
 			focus_ship = "SingleDeathCamtarget_SOB"..random(0,numShips-1)
 		end
  elseif SobGroup_Empty("enemies"..Universe_CurrentPlayer()) == 0 then	--enemy win
		local numShips = SobGroup_SplitGroupReference("SingleDeathCamtarget_SOB", "enemies"..Universe_CurrentPlayer(), "AllShips", SobGroup_Count("enemies"..Universe_CurrentPlayer()))
 		if numShips == 0 then
 			death_mode = 1
 		else
 			focus_ship = "SingleDeathCamtarget_SOB"..random(0,numShips-1)
 		end
 	else	--all dead?
 		death_mode = 1
  end
	if cinecontatore[1] > 23 or death_mode == 1 then
	  kill()
	  cinecontatore[1] = 0
		return nil
	else
		--renew focused ship
		Volume_Delete("deathcam")
		Volume_Delete("deathcam1")
		Volume_Delete("deathcam2")
		Volume_Delete("deathcam3")
		local sob_position = SobGroup_GetPosition(focus_ship)
		Volume_AddSphere("deathcam",{sob_position[1],sob_position[2],sob_position[3],},1000)
		Volume_AddSphere("deathcam1",{sob_position[1]+2000,sob_position[2],sob_position[3],},1000)
		Volume_AddSphere("deathcam2",{sob_position[1],sob_position[2]+2000,sob_position[3],},1000)
		Volume_AddSphere("deathcam3",{sob_position[1],sob_position[2],sob_position[3]+2000,},1000)
	end
	cinecontatore[1] = cinecontatore[1] + 1
  Rule_Remove("DeathCinematic") 	
	Rule_AddInterval("DeathCinematic", 8) 
  fadedown_death()	
end

function kill()     
  UI_UnBindKeyEvent(ESCKEY) 
	Event_Start("stopcinematicrestore")  					
	Rule_Remove("DeathCinematic") 
	Rule_Remove("fadeup_death")
	Universe_Fade(0,1.75)
	cinecontatore[1] = 0
	Rule_Remove("kill")
end

function fadedown_death()
  Universe_Fade(0,1.75)  
  Rule_Remove("fadedown_death") 
  Rule_AddInterval("fadeup_death",6.25) 
end
function fadeup_death()
  Universe_Fade(1,1.75)      
  Rule_Remove("fadeup_death")   
end

function dc()
  if UI_ScreenIsActive("YesNoDialog") == 1 or UI_ScreenIsActive("YesNoDialogVictory") == 1 then
	  Universe_AllowPlayerOrders(1)     
  else    
	  UI_BindKeyEvent(ESCKEY, "kill")  
	  Universe_AllowPlayerOrders(0)	
		Rule_Remove("dc")   	    
	end
end

function YesNoDialogVictory()
  UI_SetScreenEnabled("YesNoDialogVictory", 1)		
	UI_SetScreenVisible("YesNoDialogVictory", 1)
	local title = "Victory"
	local message = "You win! Continue watching?"
	if Player_IsAlive(Universe_CurrentPlayer()) == 0 then
		title = "Match Ended"
		message = "All primary objectives completed. Continue watching?"
	end
  UI_SetTextLabelText("YesNoDialogVictory", "m_lblTitle", ""..title..Time_PrintYear());			
	UI_SetTextLabelText("YesNoDialogVictory", "m_lblMessage", ""..message);	
	Rule_Remove("YesNoDialogVictory") 
end
