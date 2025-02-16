function computerspy()
---Pulizia
  for i = 0,5,1 do
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatusp"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnitsStaticText"..i, ""); 
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "isai"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "diplomacy"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "bounty"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatusp"..i, ""); 
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblFusion"..i, "");
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblTrade"..i, "");            
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblMegalith"..i, "");  
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblplanet"..i, "");  
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblResourceUnits"..i, "");            
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblGrado"..i, "");   
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblHonor"..i, "");         
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnits"..i, "");      
    UI_SetTextLabelText("UnitCapInfoPopup1", "fleet"..i, ""); 
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopOfficerUnits"..i, "");              
    UI_SetTextLabelText("UnitCapInfoPopup1", "lbltotalscore"..i, ""); 
    UI_SetTextLabelText("UnitCapInfoPopup1", "energy"..i, "");           
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblMaintenance"..i, "");    
    UI_SetTextLabelText("UnitCapInfoPopup1", "lblscore"..i, "");            				         
  end    
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndexList + 1
    if Player_IsAlive( Universe_CurrentPlayer() ) == 0 then	--after death, observation mode is activated
    	if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<70) or year>0) then
		    if UI_IsScreenActive("UnitCapInfoPopup1") == 1 then
				  UI_PlaySound("SFX_baa")		--XD
				  Subtitle_Add(Actor_Keeper,"God is watching!", 2.711)   	 					
				end
				spytime[Universe_CurrentPlayer() + 1] = 11.1
				computerspyList[Universe_CurrentPlayer() + 1] = 4
			  computerspyblockList[Universe_CurrentPlayer() + 1] = 0      
			  local placetemp = 0; 
			  local ammortizzatore = 0;  
			  while placetemp < Universe_PlayerCount() do      
			    if Player_IsAlive(placetemp) == 1 then
			      if Player_HasShipWithBuildQueue(placetemp) == 1 then
			        placetempList = placetemp + 1  
			        placetempmenoammortizzatore = placetemp - ammortizzatore 
	---Computer Spy Level
	            UI_SetTextLabelText("UnitCapInfoPopup1", "ComputerSpy", "God Mode"); 				                                                
	---Name          
	            UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnitsStaticText"..placetempmenoammortizzatore, "" .. GetPlayerNameWithColour(placetemp));   
	            if Player_HasResearch(placetemp, "iseasy" ) == 1 then  
			          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Easy)");    
			        elseif Player_HasResearch(placetemp, "isstandard" ) == 1 then  
			          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Standard)"); 
			        elseif Player_HasResearch(placetemp, "ishard" ) == 1 then  
			          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Hard)"); 
			        elseif Player_HasResearch(placetemp, "isexpert" ) == 1 then  		          
			          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Expert)"); 
			        else
			          
						--reassurance! VERY IMPORTANT!
			          if CPU_Exist_Smart(placetemp) == 1 and GetGameRubric() ~= GR_CAMPAIGN then
									UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Sleeping)"); 
			          	--print("OMG! player index: " .. placetemp .. " is sleeping!") 
			          elseif CPU_Exist_Smart(placetemp) == 0 then
			          	UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(Human)"); 
			          else
			          	UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "");   
			          end
			          
			        end  
			        
			        --CPU names overlay
			        if CPU_Exist_Smart(placetemp) == 1 and cpuname ~= 1 then
			        	UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnitsStaticText"..placetempmenoammortizzatore, "" .. GetPlayerNameWithColour(placetemp)); 
			        end
	                   
			        if ( Player_GetRace(placetemp) == Race_Hiigaran ) then   				              
			          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Hiigaran");                 
			        elseif ( Player_GetRace(placetemp) == Race_Vaygr ) then
			          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Vaygr");    
			        elseif ( Player_GetRace(placetemp) == Race_Kadeshi ) then
			          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Kadeshi");  
			        elseif ( Player_GetRace(placetemp) == Race_Raider ) then
			          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Raider");   
			        elseif ( Player_GetRace(placetemp) == Race_Keeper ) then
			          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Progenitor");
			        end     
	---diplomazia   			
			   			--if AreAllied(Universe_CurrentPlayer(), placetemp) == 1 then
			        --  UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "Chosen");
			        --else
			        --	UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "Mundane");
			        --end 
	---ResourceMenu  
	            if computerspyblockList[Universe_CurrentPlayer() + 1] == 0  then
			          UI_SetElementVisible("ResourceMenu", "lock", 1)
			          UI_SetElementVisible("ResourceMenu", "locks", 0)  
			          UI_SetElementVisible("ResourceMenu", "lock1", 1)
			          UI_SetElementVisible("ResourceMenu", "lock1s", 0)  
			          UI_SetTextLabelText("ResourceMenu", "lock", "God Mode");  	--Intelligence
			          UI_SetTextLabelText("ResourceMenu", "lock1", "God Mode");  	--Intelligence
			          UI_SetElementVisible("UnitCapInfoPopup", "lblstatus", 1)
			          UI_SetElementVisible("UnitCapInfoPopup", "lblstatuss", 0)  
			          UI_SetTextLabelText("UnitCapInfoPopup", "lblstatus", "Hidden");  
				      end       					      
	---Scanning              
		          UI_SetElementVisible("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, 1)
		          UI_SetElementVisible("UnitCapInfoPopup1", "lblstatusp"..placetempmenoammortizzatore, 0)  
		          if scan == 0 then
		            UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, "Scanning.  ");
		          elseif scan == 1 then
		            UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, "Scanning.. ");
		          elseif scan == 2 then
		            UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, "Scanning...");
		          end                                                       
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblFusion"..placetempmenoammortizzatore, ""..fusionList[placetempList]);
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblTrade"..placetempmenoammortizzatore, ""..tradeList[placetempList]);            
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblMegalith"..placetempmenoammortizzatore, ""..megalithList[placetempList]); 	
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblplanet"..placetempmenoammortizzatore, ""..planetList[placetempList]+orbitalstationList[placetempList]); 						          				           
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblResourceUnits"..placetempmenoammortizzatore, ""..RUList[placetempList].."/"..RUMaxCapacityList[placetempList]);            
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblGrado"..placetempmenoammortizzatore, ""..gradoList[placetempList]);   
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblHonor"..placetempmenoammortizzatore, ""..honorList[placetempList]);         
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnits"..placetempmenoammortizzatore, ""..pilotpopList[placetempList].."/"..pilotrecruitList[placetempList].."/"..pilotmaxList[placetempList]);  				          
		          UI_SetTextLabelText("UnitCapInfoPopup1", "fleet"..placetempmenoammortizzatore, ""..pilotpopdisplayList[placetempList]); 
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopOfficerUnits"..placetempmenoammortizzatore, ""..officerpopList[placetempList].."/"..officerrecruitList[placetempList].."/"..officermaxList[placetempList]);  				               
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lbltotalscore"..placetempmenoammortizzatore, ""..researchList[placetempList]);     
		          UI_SetTextLabelText("UnitCapInfoPopup1", "energy"..placetempmenoammortizzatore, ""..LastpowerList[placetempList].."/"..LastpowerListStored[placetempList].."/"..LastpowerListMax[placetempList]);       
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblMaintenance"..placetempmenoammortizzatore, ""..maintenanceList[placetempList]);  
		          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomacy"..placetempmenoammortizzatore, ""..diplomacyListSummary[placetempList]);    
		          UI_SetTextLabelText("UnitCapInfoPopup1", "bounty"..placetempmenoammortizzatore, ""..BountyRUSummary[placetempList]);
		          UI_SetTextLabelText("UnitCapInfoPopup1", "lblscore"..placetempmenoammortizzatore, ""..scoreList[placetempList]);                                    
			      end
			    else
			      ammortizzatore = ammortizzatore + 1				        
			    end
			    placetemp = placetemp + 1
			  end
			end
			
    else	--for player alive
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
			  --playerIndexList = playerIndex + 1        
			  computerspyList[playerIndexList] = 0 			         
			  if Player_HasResearch(playerIndex, "computerlink" ) == 1 then
			    spytime[playerIndexList] = 88.8
			    computerspyList[playerIndexList] = computerspyList[playerIndexList] + 1                      
			    if Player_HasResearch(playerIndex, "computerlink1" ) == 1 then
			      spytime[playerIndexList] = 44.4
			      computerspyList[playerIndexList] = computerspyList[playerIndexList] + 1
			      if Player_HasResearch(playerIndex, "computerlink2" ) == 1 then
			        spytime[playerIndexList] = 22.2
			        computerspyList[playerIndexList] = computerspyList[playerIndexList] + 1
			        if Player_HasResearch(playerIndex, "computerlink3" ) == 1 then
			          spytime[playerIndexList] = 11.1
			          computerspyList[playerIndexList] = computerspyList[playerIndexList] + 1			          
			        end
			      end
			    end          
			  end  			  
			  if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<70) or year>0) then  
			    if UI_IsScreenActive("UnitCapInfoPopup1") == 1 and Player_HasResearch(playerIndex, "computerlink" ) == 1 then
			    	if Player_GetRace(playerIndex) == Race_Hiigaran then
						  UI_PlaySound("SFX_sonar1")		--STATUS_computer
						  Subtitle_Add(Actor_FleetCommand,"Remote Monitor intelligence updating", 2.711)   	 				
						elseif Player_GetRace(playerIndex) == Race_Vaygr then
						  UI_PlaySound("SFX_sonar1")		--STATUS_computer
						  Subtitle_Add(Actor_Makaan,"Remote Monitor intelligence updating", 2.711)   	 	
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
						  UI_PlaySound("SFX_sonar1")		--STATUS_computer
						  Subtitle_Add(11,"Remote Monitor intelligence updating", 2.711)
						elseif Player_GetRace(playerIndex) == Race_Raider then
						  UI_PlaySound("SFX_sonar1")		--STATUS_computer
						  Subtitle_Add(12,"Remote Monitor intelligence updating", 2.711)
						elseif Player_GetRace(playerIndex) == Race_Keeper then
						  UI_PlaySound("SFX_sonar1")		--STATUS_computer
						  Subtitle_Add(Actor_Keeper,"Remote Monitor intelligence updating", 2.711)
						end	
					end  
				  computerspyblockList[playerIndexList] = 0      
				  local placetemp = 0; 
				  local ammortizzatore = 0;  
				  while placetemp < Universe_PlayerCount() do      
				    if Player_IsAlive(placetemp) == 1 then
				      if Player_HasShipWithBuildQueue(placetemp) == 1 then
				        placetempList = placetemp + 1  
				        placetempmenoammortizzatore = placetemp - ammortizzatore 
---Computer Spy Level
                UI_SetTextLabelText("UnitCapInfoPopup1", "ComputerSpy", "LEVEL "..computerspyList[playerIndexList]); 				                                                
---Name     
		            UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnitsStaticText"..placetempmenoammortizzatore, "" .. GetPlayerNameWithColour(placetemp));   
		            if Player_HasResearch(placetemp, "iseasy" ) == 1 then  
				          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Easy)");    
				        elseif Player_HasResearch(placetemp, "isstandard" ) == 1 then  
				          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Standard)"); 
				        elseif Player_HasResearch(placetemp, "ishard" ) == 1 then  
				          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Hard)"); 
				        elseif Player_HasResearch(placetemp, "isexpert" ) == 1 then  		          
				          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Expert)"); 
				        else
				          
							--reassurance! VERY IMPORTANT!
				          if CPU_Exist_Smart(placetemp) == 1 and GetGameRubric() ~= GR_CAMPAIGN then
										UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(CPU Sleeping)"); 
				          	--print("OMG! player index: " .. placetemp .. " is sleeping!") 
				          elseif CPU_Exist_Smart(placetemp) == 0 then
			          		UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "(Human)"); 
				          else
				          	UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "");   
				          end
				          
				        end  
				        
				        --CPU names overlay
				        if CPU_Exist_Smart(placetemp) == 1 and cpuname ~= 1 then
				        	UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnitsStaticText"..placetempmenoammortizzatore, "" .. GetPlayerNameWithColour(placetemp)); 
				        end
                       
				        if ( Player_GetRace(placetemp) == Race_Hiigaran ) then   				              
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Hiigaran");                 
				        elseif ( Player_GetRace(placetemp) == Race_Vaygr ) then
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Vaygr");    
				        elseif ( Player_GetRace(placetemp) == Race_Kadeshi ) then
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Kadeshi");  
				        elseif ( Player_GetRace(placetemp) == Race_Raider ) then
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Raider");   
				        elseif ( Player_GetRace(placetemp) == Race_Keeper ) then
			          	UI_SetTextLabelText("UnitCapInfoPopup1", "lblname"..placetempmenoammortizzatore, "Progenitor");
				        end     
---diplomazia   			
				   			--if AreAllied(playerIndex, placetemp) == 1 then
				        --  UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "Allied");
				        --else
				        --  UI_SetTextLabelText("UnitCapInfoPopup1", "diplomazia"..placetempmenoammortizzatore, "Enemy");
				        --end 
---ResourceMenu  
                if computerspyblockList[playerIndexList] == 0  then
					        if computerspyList[playerIndexList] < computerspyList[placetempList] and 
					           AreAllied(playerIndex, placetemp) == 0 then         
					          UI_SetElementVisible("ResourceMenu", "locks", 1)
					          UI_SetElementVisible("ResourceMenu", "lock", 0)  
					          UI_SetElementVisible("ResourceMenu", "lock1s", 1)
					          UI_SetElementVisible("ResourceMenu", "lock1", 0) 					                    
					          UI_SetTextLabelText("ResourceMenu", "locks", "LOCKED");	
					          UI_SetTextLabelText("ResourceMenu", "lock1s", "LOCKED");	
					          UI_SetElementVisible("UnitCapInfoPopup", "lblstatuss", 1)
					          UI_SetElementVisible("UnitCapInfoPopup", "lblstatus", 0)            
					          UI_SetTextLabelText("UnitCapInfoPopup", "lblstatuss", "Locked");								          
					          computerspyblockList[playerIndexList] = 1                   
					        else
					          UI_SetElementVisible("ResourceMenu", "lock", 1)
					          UI_SetElementVisible("ResourceMenu", "locks", 0)  
					          UI_SetElementVisible("ResourceMenu", "lock1", 1)
					          UI_SetElementVisible("ResourceMenu", "lock1s", 0)  
					          UI_SetTextLabelText("ResourceMenu", "lock", "Intelligence");  	--Hidden
					          UI_SetTextLabelText("ResourceMenu", "lock1", "Intelligence");  	--Hidden
					          UI_SetElementVisible("UnitCapInfoPopup", "lblstatus", 1)
					          UI_SetElementVisible("UnitCapInfoPopup", "lblstatuss", 0)  
					          UI_SetTextLabelText("UnitCapInfoPopup", "lblstatus", "Hidden");  
					        end	   
					      end       					      
---Scanning              
				        if playerIndex == placetemp or
				           ((computerspyList[playerIndexList] > computerspyList[placetempList] or AreAllied(playerIndex, placetemp) == 1) and
				           ((Player_CanResearch(playerIndex, "hasadvancedarray" ) == 1 or GameRulesName == "Simplex Sole Survivor") and Player_HasResearch(playerIndex, "computerlink" ) == 1)) then 
				          UI_SetElementVisible("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, 1)
				          UI_SetElementVisible("UnitCapInfoPopup1", "lblstatusp"..placetempmenoammortizzatore, 0)  
				          if scan == 0 then
				            UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, "Scanning.  ");
				          elseif scan == 1 then
				            UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, "Scanning.. ");
				          elseif scan == 2 then
				            UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, "Scanning...");
				          end                                                       
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblFusion"..placetempmenoammortizzatore, ""..fusionList[placetempList]);
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblTrade"..placetempmenoammortizzatore, ""..tradeList[placetempList]);            
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblMegalith"..placetempmenoammortizzatore, ""..megalithList[placetempList]); 	
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblplanet"..placetempmenoammortizzatore, ""..planetList[placetempList]+orbitalstationList[placetempList]); 						          				           
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblResourceUnits"..placetempmenoammortizzatore, ""..RUList[placetempList].."/"..RUMaxCapacityList[placetempList]);            
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblGrado"..placetempmenoammortizzatore, ""..gradoList[placetempList]);   
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblHonor"..placetempmenoammortizzatore, ""..honorList[placetempList]);         
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnits"..placetempmenoammortizzatore, ""..pilotpopList[placetempList].."/"..pilotrecruitList[placetempList].."/"..pilotmaxList[placetempList]);  				          
				          UI_SetTextLabelText("UnitCapInfoPopup1", "fleet"..placetempmenoammortizzatore, ""..pilotpopdisplayList[placetempList]); 
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopOfficerUnits"..placetempmenoammortizzatore, ""..officerpopList[placetempList].."/"..officerrecruitList[placetempList].."/"..officermaxList[placetempList]);  				               
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lbltotalscore"..placetempmenoammortizzatore, ""..researchList[placetempList]);     
				          UI_SetTextLabelText("UnitCapInfoPopup1", "energy"..placetempmenoammortizzatore, ""..LastpowerList[placetempList].."/"..LastpowerListStored[placetempList].."/"..LastpowerListMax[placetempList]);       
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblMaintenance"..placetempmenoammortizzatore, ""..maintenanceList[placetempList]);  
				          UI_SetTextLabelText("UnitCapInfoPopup1", "diplomacy"..placetempmenoammortizzatore, ""..diplomacyListSummary[placetempList]);    
				          UI_SetTextLabelText("UnitCapInfoPopup1", "bounty"..placetempmenoammortizzatore, ""..BountyRUSummary[placetempList]);
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblscore"..placetempmenoammortizzatore, ""..scoreList[placetempList]);                                    
				        else
				          UI_SetElementVisible("UnitCapInfoPopup1", "lblstatus"..placetempmenoammortizzatore, 0)
				          UI_SetElementVisible("UnitCapInfoPopup1", "lblstatusp"..placetempmenoammortizzatore, 1)
				          UI_SetTextLabelText("UnitCapInfoPopup1", "lblstatusp"..placetempmenoammortizzatore, "Hidden     ");
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblFusion"..placetempmenoammortizzatore, "");
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblTrade"..placetempmenoammortizzatore, "");            
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblMegalith"..placetempmenoammortizzatore, "");  
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblplanet"..placetempmenoammortizzatore, "");  
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblResourceUnits"..placetempmenoammortizzatore, "");            
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblGrado"..placetempmenoammortizzatore, "");   
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblHonor"..placetempmenoammortizzatore, "");         
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopUnits"..placetempmenoammortizzatore, "");  						      
						  UI_SetTextLabelText("UnitCapInfoPopup1", "fleet"..placetempmenoammortizzatore, ""); 
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblPopOfficerUnits"..placetempmenoammortizzatore, "");  						        
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lbltotalscore"..placetempmenoammortizzatore, "");  
						  UI_SetTextLabelText("UnitCapInfoPopup1", "energy"..placetempmenoammortizzatore, "");                 
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblMaintenance"..placetempmenoammortizzatore, "");    
						  UI_SetTextLabelText("UnitCapInfoPopup1", "diplomacy"..placetempmenoammortizzatore, "");    
						  UI_SetTextLabelText("UnitCapInfoPopup1", "bounty"..placetempmenoammortizzatore, "");
						  UI_SetTextLabelText("UnitCapInfoPopup1", "lblscore"..placetempmenoammortizzatore, "");                
				        end      
				      end
				    else
				      ammortizzatore = ammortizzatore + 1				        
				    end
				    placetemp = placetemp + 1
				  end 
				  Rule_Remove("computerspy")
				  Rule_AddInterval("computerspy", spytime[playerIndexList])				  				  
				end              
      end 
    end     
    playerIndex = playerIndex + 1
  end 
  scan = scan + 1
  if scan > 2 then
    scan = 0
  end           
end    
        
function deepspacetelemetry()
	if GetGameRubric() == GR_MULTIPLAYER then	--this stuff needs to be disabled in multiplayer to prevent out of sync error
		Rule_Remove("deepspacetelemetry")
		return
	end
	
	Update_AllShips()
  local playerIndex = Universe_CurrentPlayer()
  local playerIndexList = playerIndex + 1
  if Player_IsAlive(playerIndex) == 1 then
    if Player_HasShipWithBuildQueue(playerIndex) == 1 then  	         
		  if Player_HasResearch(playerIndex, "computerhack" ) == 1 then
		    deepspacetelemetrytime[playerIndexList] = 88.8
		    if Player_HasResearch(playerIndex, "computerhack1" ) == 1 then
		      deepspacetelemetrytime[playerIndexList] = 44.4
		      if Player_HasResearch(playerIndex, "computerhack2" ) == 1 then
		        deepspacetelemetrytime[playerIndexList] = 22.2
		        if Player_HasResearch(playerIndex, "computerhack3" ) == 1 then
		          deepspacetelemetrytime[playerIndexList] = 11.1
		        end
		      end
		    end
		    
				local enemyIndex = 0
				while enemyIndex < Universe_PlayerCount() do
					if Player_IsAlive(enemyIndex) == 1 and playerIndex ~= enemyIndex and AreAllied(enemyIndex, playerIndex) == 0 then
						local numships = SobGroup_SplitGroupReference("SingleShipToReveal_SOB", "Player_Ships"..enemyIndex, "AllShips", SobGroup_Count("Player_Ships"..enemyIndex))
						for counter = 0, numships - 1, 1 do
							if random(0,100) > deepspacetelemetrytime[playerIndexList] then
								local ShipIsInSensorRange = 0
								local alliesIndex = 0
								while alliesIndex < Universe_PlayerCount() do
									if Player_IsAlive(alliesIndex) == 1 and playerIndex ~= alliesIndex and AreAllied(alliesIndex, playerIndex) == 1 then
										if SobGroup_PlayerIsInSensorRange("SingleShipToReveal_SOB"..counter, alliesIndex) == 1 then
											ShipIsInSensorRange = 1
										end
									end
									alliesIndex = alliesIndex + 1
								end
								if ShipIsInSensorRange == 0 then
									if Player_CanResearch(playerIndex, "hashyperspacesensor" ) == 1 or GameRulesName == "Simplex Sole Survivor" then		--to reveal enemy ships you must have Hyperspace Sensor
										if random(0,561.1-deepspacetelemetrytime[playerIndexList]) >= 275 then		--randomly reveal
											if SobGroup_IsDoingAbility("SingleShipToReveal_SOB"..counter, AB_Cloak) == 0 and SobGroup_IsCloaked("SingleShipToReveal_SOB"..counter) == 0 then		--can't reveal cloacked ships
												FOW_RevealGroup("SingleShipToReveal_SOB"..counter, 1)
												SobGroup_SobGroupAdd("computerhack"..playerIndex, "SingleShipToReveal_SOB"..counter)
											else		--hide cloaked ship
												FOW_RevealGroup("SingleShipToReveal_SOB"..counter, 0)
												SobGroup_SobGroupSubstract("computerhack"..playerIndex, "SingleShipToReveal_SOB"..counter)
											end
										else
											FOW_RevealGroup("SingleShipToReveal_SOB"..counter, 0)
											SobGroup_SobGroupSubstract("computerhack"..playerIndex, "SingleShipToReveal_SOB"..counter)
										end
									else		--hide all ships if Hyperspace Sensor is missing
										FOW_RevealGroup("SingleShipToReveal_SOB"..counter, 0)
										SobGroup_SobGroupSubstract("computerhack"..playerIndex, "SingleShipToReveal_SOB"..counter)
									end
								end
							end
						end
					end
					enemyIndex = enemyIndex + 1
				end
		  else	--no computer hack, does this solve the lag problem? Nope, the lag seems to be caused by the enemy container?
				if GetGameRubric() ~= GR_CAMPAIGN then
					local enemyIndex = 0
					while enemyIndex < Universe_PlayerCount() do
						if Player_IsAlive(enemyIndex) == 1 and playerIndex ~= enemyIndex and AreAllied(enemyIndex, playerIndex) == 0 then
							local numships = SobGroup_SplitGroupReference("SingleShipToRevealDebug_SOB", "Player_Ships"..enemyIndex, "AllShips", SobGroup_Count("Player_Ships"..enemyIndex))
							for counter = 0, numships - 1, 1 do
								local ShipIsInSensorRange = 0
								local alliesIndex = 0
								while alliesIndex < Universe_PlayerCount() do
									if Player_IsAlive(alliesIndex) == 1 and playerIndex ~= alliesIndex and AreAllied(alliesIndex, playerIndex) == 1 then
										if SobGroup_PlayerIsInSensorRange("SingleShipToRevealDebug_SOB"..counter, alliesIndex) == 1 then
											ShipIsInSensorRange = 1
										end
									end
									alliesIndex = alliesIndex + 1
								end
								if ShipIsInSensorRange == 0 and SobGroup_IsDoingAbility("SingleShipToRevealDebug_SOB"..counter, AB_Cloak) == 0 and SobGroup_IsCloaked("SingleShipToRevealDebug_SOB"..counter) == 0 then
									FOW_RevealGroup("SingleShipToRevealDebug_SOB"..counter, 1)
									FOW_RevealGroup("SingleShipToRevealDebug_SOB"..counter, 0)
								end
							end
						end
						enemyIndex = enemyIndex + 1
					end
					--Debug_TraceRuntime("Computer Hack is working in debug mode")
				end
		  end
			
		  Rule_Remove("deepspacetelemetry")
		  Rule_AddInterval("deepspacetelemetry", deepspacetelemetrytime[playerIndexList])    
    end 
  else
  	Rule_Remove("deepspacetelemetry")
  end
end
        
        
        
          