function researching()
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        playerIndexList = playerIndex + 1
      	--new function originally designed for single player mission, it just works perfectly for all cases
				local researchNUM = 0
				local researchRU = 0
				local iRace = Player_GetRace(playerIndex) + 1
				dofilepath([[data:scripts/race.lua]])
				if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
					dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
					for z, iCount in research do
						if iCount.Cost > 1 and iCount.Time > 1 then		--don't count dummy items
							if Player_HasResearch(playerIndex, iCount.Name) == 1 then
							  researchNUM = researchNUM + 1
							  researchRU = researchRU + iCount.Cost
							end
						end
					end
				end
				researchList[playerIndexList] = floor(researchRU / (100 * researchsensitivity))
        if Player_GetRace(playerIndex) == Race_Hiigaran then           
          if researchList[playerIndexList] >= 125 then
            if Player_HasResearch(playerIndex, "instanttech" ) == 0 then 
              Player_GrantResearchOption(playerIndex , "instanttech")
            end  
            if researchList[playerIndexList] >= 450 then
              if Player_HasResearch(playerIndex, "instanttech1" ) == 0 then
                Player_GrantResearchOption(playerIndex , "instanttech1")
              end  
            end
          end
        end
        if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<35) or year>0) then    
          if Player_GetRace(playerIndex) == Race_Hiigaran then
	          if Player_HasResearch(playerIndex, "instanttech1" ) == 1 then
	            UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList]);
	            UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList]); 
	          elseif Player_HasResearch(playerIndex, "instanttech" ) == 1 then  
	            UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList].."/450");
	            UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList].."/450");     
	          else 
	            UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList].."/125");
	            UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList].."/125"); 
	          end 
	        elseif Player_GetRace(playerIndex) == Race_Vaygr then
	          UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList]);
	          UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList]);
	        elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	          UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList]);
	          UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList]);
	        elseif Player_GetRace(playerIndex) == Race_Raider then
	          UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList]);
	          UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList]);
	        elseif Player_GetRace(playerIndex) == Race_Keeper then
	          UI_SetTextLabelText("ResourceMenu", "lbltotalscore", ""..researchList[playerIndexList]);
	          UI_SetTextLabelText("UnitCapInfoPopup", "lbltotalscore", ""..researchList[playerIndexList]);
	        end                    
        end  
        
---costruisce/cancella il modulo br (base research) per attivare/disattivare la ricerca in caso di dockaggio della RS        
        if GameRulesName == "Simplex Sole Survivor" then
	      	if SobGroup_Empty("supporter"..playerIndex) == 0 then
	      		if Player_GetRace(playerIndex) == Race_Hiigaran then
		        	CreateSubsystemOnShip("supporter"..playerIndex, "br")
		        	CreateSubsystemOnShip("supporter"..playerIndex, "fake_research")
		        	CreateSubsystemOnShip("supporter"..playerIndex, "fake_advresearch1")
		        elseif Player_GetRace(playerIndex) == Race_Kadeshi or Player_GetRace(playerIndex) == Race_Vaygr then
		        	CreateSubsystemOnShip("supporter"..playerIndex, "fake_research")
		        end
		      end
	      else
	        if (SobGroup_IsDocked("hgn_researchstation"..playerIndex) == 1 and year < 1) or SobGroup_Count("hgn_researchstation"..playerIndex) == 0 then
	          SobGroup_SetHardPointHealth("supporter"..playerIndex, "br", 0)          
	        elseif SobGroup_IsDocked("hgn_researchstation"..playerIndex) == 0 and SobGroup_Count("hgn_researchstation"..playerIndex) > 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "supporter") >= 1 then
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "br") == 0 then               
		          SobGroup_CreateSubSystem("supporter"..playerIndex, "br")   	             
		        end
	        end
	      end
                
      end
    end
    playerIndex = playerIndex + 1
  end      
end

function MP_RestrictCampaignItems()
	if GetGameRubric() ~= GR_CAMPAIGN then
	  local i = 0
	  local numplayers = Universe_PlayerCount()
	  while  i<numplayers do
	      MP_RestrictCampaignItemsForPlayer(i)
	      i = (i + 1)
	  end 
	end
end

function MP_RestrictCampaignItemsForPlayer(playerid)
  local playerRace = Player_GetRace(playerid)
  if  playerRace==Race_Hiigaran then
    Player_RestrictBuildOption(playerid, "Hgn_MS_Production_CorvetteMover")
    Player_RestrictBuildOption(playerid, "Kpr_Mover")
    --Player_RestrictBuildOption(playerid, "Hgn_Shipyard_SPG")
    
  elseif  playerRace==Race_Vaygr then
    --Player_RestrictBuildOption(playerid, "Vgr_PlanetKillerMissile")
    
  end 

end