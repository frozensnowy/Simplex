function FusionAddRU(playerIndex, bountyrus)
	local plusbounty = floor(bountyrus)
	Player_SetRU(playerIndex, Player_GetRU(playerIndex) + plusbounty)
	fusionList[playerIndex+1] = fusionList[playerIndex+1] + plusbounty
	--print(""..plusbounty.." RUs added to playerIndex: "..playerIndex..", game time: "..Universe_GameTime())
end

function fusion() 

---azzera RUMaxCapacityList x tutti i giocatori  
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
  	playerIndexList = playerIndex + 1         
    if Player_IsAlive(playerIndex) == 1 then
    
    	if sharerus == "yes" then
	    	RUMaxCapacityList[playerIndexList] = RUMaxCapacityBackupList[playerIndexList]
	    	--LastRUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList]
	    end
    	
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then      
        
        if Player_GetRace(playerIndex) == Race_Hiigaran then
          RUMaxCapacityList[playerIndexList] = 5000
        elseif Player_GetRace(playerIndex) == Race_Vaygr then
          if Player_HasResearch(playerIndex, "resource4" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 105000
	        elseif Player_HasResearch(playerIndex, "resource3" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 65000
				  elseif Player_HasResearch(playerIndex, "resource2" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 35000
				  elseif Player_HasResearch(playerIndex, "resource1" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 15000
				  else	
				    RUMaxCapacityList[playerIndexList] = 5000    
				  end
				elseif Player_GetRace(playerIndex) == Race_Kadeshi then
          if Player_HasResearch(playerIndex, "resource4" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 105000
	        elseif Player_HasResearch(playerIndex, "resource3" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 65000
				  elseif Player_HasResearch(playerIndex, "resource2" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 35000
				  elseif Player_HasResearch(playerIndex, "resource1" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 15000
				  else	
				    RUMaxCapacityList[playerIndexList] = 5000    
				  end
				elseif Player_GetRace(playerIndex) == Race_Raider then
          if Player_HasResearch(playerIndex, "resource4" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 105000
	        elseif Player_HasResearch(playerIndex, "resource3" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 65000
				  elseif Player_HasResearch(playerIndex, "resource2" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 35000
				  elseif Player_HasResearch(playerIndex, "resource1" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 15000
				  else	
				    RUMaxCapacityList[playerIndexList] = 5000    
				  end
				elseif Player_GetRace(playerIndex) == Race_Keeper then
          if Player_HasResearch(playerIndex, "resource4" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 105000
	        elseif Player_HasResearch(playerIndex, "resource3" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 65000
				  elseif Player_HasResearch(playerIndex, "resource2" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 35000
				  elseif Player_HasResearch(playerIndex, "resource1" ) == 1 then
				    RUMaxCapacityList[playerIndexList] = 15000
				  else	
				    RUMaxCapacityList[playerIndexList] = 5000    
				  end
			  end
			  
      end
    end
    playerIndex = playerIndex + 1
  end    

--Mothership  
  for i = 0,nms-1,1 do
    if SobGroup_Empty("splitmotherships"..i) == 0 then  
      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then 
        playerIndexList = SobGroup_OwnedBy("splitmotherships"..i) + 1	
			  if SobGroup_GetHardPointHealth("splitmotherships"..i, "supply") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end	
        if SobGroup_GetHardPointHealth("splitmotherships"..i, "supply1") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end		
      end     
    end
  end 

--Shipyard  
  for i = 0,nsy-1,1 do
    if SobGroup_Empty("splitshipyards"..i) == 0 then  
      if SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard, hgn_shipyard_elohim, hgn_shipyard_g") == 1 then 
        playerIndexList = SobGroup_OwnedBy("splitshipyards"..i) + 1	
			  if SobGroup_GetHardPointHealth("splitshipyards"..i, "supply") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end		
        if SobGroup_GetHardPointHealth("splitshipyards"..i, "supply1") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end	
			elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_battleshipyard") == 1 then 
        playerIndexList = SobGroup_OwnedBy("splitshipyards"..i) + 1	
			  if SobGroup_GetHardPointHealth("splitshipyards"..i, "supply") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end		
        if SobGroup_GetHardPointHealth("splitshipyards"..i, "supply1") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end	
        if SobGroup_GetHardPointHealth("splitshipyards"..i, "supply2") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end	
        if SobGroup_GetHardPointHealth("splitshipyards"..i, "supply3") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end	 				
      end     
    end
  end   
  
  for i = 0,nc-1,1 do
    if SobGroup_Empty("splitcarriers"..i) == 0 then
    
--BattleCarrier    
    	if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_carrier, hgn_battlecarrier") == 1 then   
			  playerIndexList = SobGroup_OwnedBy("splitcarriers"..i) + 1	
			  if SobGroup_GetHardPointHealth("splitcarriers"..i, "supply") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end		
			end	  

---scaver    
      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_scaver") == 1 then        
		    playerIndexList = SobGroup_OwnedBy("splitcarriers"..i) + 1	
		    
		--supply        
        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply1") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end				
        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply2") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end				
        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply3") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end				
        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply4") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end				
        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply5") > 0 then
          RUMaxCapacityList[playerIndexList] = RUMaxCapacityList[playerIndexList] + 3000
        end	
      end
    end
  end   
  
  for i = 0,nc-1,1 do
    if SobGroup_Empty("splitcarriers"..i) == 0 then   
      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_scaver,vgr_scaver") == 1 then   		 
        playerIndexList = SobGroup_OwnedBy("splitcarriers"..i) + 1   	    	  
		    
		    ff=0
		    if SobGroup_IsDocked("splitcarriers"..i) == 0 and SobGroup_GetHardPointHealth("splitcarriers"..i, "hgn_orders_fusion") == 0 then
		    	if battlearena[1] < 200 then
		--fusion		         		      		    
				    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then
					    if Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres3") == 1 then
					      ff=120					      
					      FX_StartEvent_Smart("splitcarriers"..i, "Fusion4")      
					    elseif Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres2") == 1 then
					      ff=90					      
					      FX_StartEvent_Smart("splitcarriers"..i, "Fusion3")
					    elseif Player_HasResearch(SobGroup_OwnedBy("splitcarriers"..i), "Scaverautogenres1") == 1 then
					      ff=60					      
					      FX_StartEvent_Smart("splitcarriers"..i, "Fusion2")
					    elseif SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then
					      ff=30				        
				        FX_StartEvent_Smart("splitcarriers"..i, "Fusion1")
				      end	
				      
				      --Vaygr Manpower Division
				      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_scaver") == 1 then
				      	for counter = 1, 5, 1 do
				      		if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply"..counter) > 0 then
				      			ff = ff + 10
				      		end
				      	end
				      end
				      
				      fusionList[playerIndexList] = fusionList[playerIndexList] + ff	      
				    end 		
					end
				else				  
				end
									
		--pings
	      if SobGroup_OwnedBy("splitcarriers"..i) == Universe_CurrentPlayer() then	 			        
	        local gname = i+1
	        local g = Ping_AddSobGroup("Unsung Hero "..gname, "resource", "splitcarriers"..i)
					Ping_LabelVisible(g, 1)		
					Ping_AddDescription(g, 0, "RUs "..Player_GetRU(SobGroup_OwnedBy("splitcarriers"..i)).."/"..RUMaxCapacityList[playerIndexList])
					Ping_AddDescription(g, 1, "Fusion "..ff.."/"..fusionList[playerIndexList].." ("..fusionList[playerIndexList].." RUs/year)")		
				end  
				  
			end			            	      	    
	  end             
  end	

---mobile refinery 
  if battlearena[1] < 200 then
	  for i = 0,nmr-1,1 do
	    if SobGroup_Empty("splitmobilerefineries"..i) == 0 then
		    playerIndexList = SobGroup_OwnedBy("splitmobilerefineries"..i) + 1
		    if Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres3") == 1 then
		      fusionList[playerIndexList] = fusionList[playerIndexList] + 40   
		      FX_StartEvent_Smart("splitmobilerefineries"..i, "Fusion4")      
		    elseif Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres2") == 1 then
		      fusionList[playerIndexList] = fusionList[playerIndexList] + 30 
		      FX_StartEvent_Smart("splitmobilerefineries"..i, "Fusion3")
		    elseif Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres1") == 1 then
		      fusionList[playerIndexList] = fusionList[playerIndexList] + 20
		      FX_StartEvent_Smart("splitmobilerefineries"..i, "Fusion2")
		    elseif Player_HasResearch(SobGroup_OwnedBy("splitmobilerefineries"..i), "autogenres") == 1 then
		      fusionList[playerIndexList] = fusionList[playerIndexList] + 10
		      FX_StartEvent_Smart("splitmobilerefineries"..i, "Fusion1")
		    end  
		    
		--pings
	      --if SobGroup_OwnedBy("splitmobilerefineries"..i) == Universe_CurrentPlayer() then	      
					--Ping_LabelVisible(Ping_AddSobGroup("Fusion "..fusionList[playerIndexList].." ("..fusionList[playerIndexList].." RUs/year)", "minecontainer", "splitmobilerefineries"..i), 1)
				--end    	                	      	    
		  end             
	  end
	end  
	
---kpr power generator
  local playervar = 0
  while playervar < Universe_PlayerCount() do
	  playervar = playervar + 1
	  local playeridx = playervar-1
	  if Player_GetRace(playeridx) == Race_Keeper then
	  	if SobGroup_Empty("kpr_ressourcecollector_old"..playeridx) == 0 then
				if LastpowerListStored[playervar] >= LastpowerListMax[playervar] then
					local conversion = 50*0.5*(resource+1)/(0.7*11/fusionfactor)
		    	if Player_HasResearch(playeridx, "ExterminatorRuBonus") == 1 then
		    		conversion = conversion*1.15
		    	end
		    	local energysurplus = LastpowerList[playervar]
		    	local ru = floor(conversion*energysurplus)
		    	if ru > 0 then
--		    		local ruresult = Player_GetRU(playeridx) + ru
--		    		if ruresult <= RUMaxCapacityList[playervar] then
--		    			Player_SetRU(playeridx, Player_GetRU(playeridx) + ru)		--real time RUs
--		    		else
--		    			Player_SetRU(playeridx, RUMaxCapacityList[playervar])
--		    		end
			    	--fusionList[playervar] = fusionList[playervar] + ru		--only produces extra RUs at the end of a year, since we have collectors now!
			    	--Progenitor is too OP! No longer give it fusion RUs, just let itself do the conversion job using the Power Generator
			    end
				end
			end
		end
	end

---UI 
  if ((year==0 and gametime<35) or year>0) then
    UI_SetTextLabelText("UnitCapInfoPopup", "lblFusion", ""..fusionList[Universe_CurrentPlayer()+1]);
  end   

---share RU Max Capacity with allies
	local NewRUMaxCapacityToSetList = { 5000, 5000, 5000, 5000, 5000, 5000 }
	if sharerus == "yes" then
		---get and store everyone's data first
	  local playerIndex = 0
	  while playerIndex < Universe_PlayerCount() do
	  	playerIndexList = playerIndex + 1 
	  	if Player_IsAlive(playerIndex) == 1 then
	  		RUMaxCapacityBackupList[playerIndexList] = RUMaxCapacityList[playerIndexList]
	  		NewRUMaxCapacityToSetList[playerIndexList] = RUMaxCapacityBackupList[playerIndexList]
	  	end
	  	playerIndex = playerIndex + 1
	  end
	  ---preparation and calculation
	  local playerIndex = 0
	  while playerIndex < Universe_PlayerCount() do
	  	playerIndexList = playerIndex + 1 
	    if Player_IsAlive(playerIndex) == 1 then
				for i = 0, Universe_PlayerCount() - 1 do
					if AreAllied(playerIndex, i) == 1 and AreAllied(i, playerIndex) == 1 and i ~= playerIndex then		--who are my allies
		        if Player_IsAlive(i) == 1 then 		--if allies are dead, don't add it to the common RU capacity
		        	NewRUMaxCapacityToSetList[playerIndexList] = NewRUMaxCapacityToSetList[playerIndexList] + RUMaxCapacityBackupList[i+1]
		        end
		      end
		    end
	    end
	    playerIndex = playerIndex + 1
	  end
		---set RU Max Capacity
		local playerIndex = 0
	  while playerIndex < Universe_PlayerCount() do
	  	playerIndexList = playerIndex + 1 
			RUMaxCapacityList[playerIndexList] = NewRUMaxCapacityToSetList[playerIndexList]
			playerIndex = playerIndex + 1
		end
	end

end