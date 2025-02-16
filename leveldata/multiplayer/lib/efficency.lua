function efficency() 
	local playerIndex = 0
	local playerIndexList = 0
	while playerIndex < Universe_PlayerCount() do
	  playerIndexList = playerIndex + 1	
	  if (Player_IsAlive(playerIndex) == 1) then
	    if (Player_HasShipWithBuildQueue(playerIndex) == 1) then
	      hapagatoList[playerIndexList] = Player_GetRU(playerIndex) - maintenanceList[playerIndexList]
	      
	---Calcola ru se il giocatore ha i soldi      
	      if hapagatoList[playerIndexList] >= 0 then
					Player_SetRU(playerIndex, hapagatoList[playerIndexList])	 
					if playerIndex == Universe_CurrentPlayer() then
					  UI_SetTextLabelText("YearMenu", "lblmaintenance1", "(Paid)");   
					end 
				else
				  if playerIndex == Universe_CurrentPlayer() then
					  UI_SetTextLabelText("YearMenu", "lblmaintenance1", "(Unpaid)");   
					end 	
				end	 				
			end	
		end	
		playerIndex = playerIndex + 1
	end	
	
---calcola efficenza su ogni singola nave			 	
	efficencyExecute("splitmotherships", nms)
	efficencyExecute("splitresearchstations", nrs)
	efficencyExecute("splitpowerstations", nps)
	efficencyExecute("splitcrewstations", ncs)
	efficencyExecute("splitweaponstations", nws)
	efficencyExecute("splitdestroyers", nd)
	efficencyExecute("splitcarriers", nc)
	efficencyExecute("splitbattlecruisers", nbc)
	efficencyExecute("splitshipyards", nsy)
	efficencyExecute("splitcommandfortresses", ncf)
	efficencyExecute("splithyperspacestations", nhs)
	efficencyExecute("splitjuggernaughts", nj)
	Rule_Remove("efficency")   
end		

function efficencyExecute(Group, Counter)  
  if Counter > 0 then
	  for i = 0,Counter-1,1 do                                             
	    if SobGroup_Count(Group .. tostring(i)) == 1 then
	      
  ---se paga	              
	      if hapagatoList[SobGroup_OwnedBy(Group .. tostring(i))+1] >= 0 then 	      
	        local effvalue = SobGroup_GetHardPointHealth(Group .. tostring(i), "efficency") + 0.0155	        
	        if effvalue >= 0 and effvalue <= 1 then 
	          SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", effvalue)
	        else
	          SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", 1)
	        end  	        
  
  ---se non paga	        
			  else	
			    local effvalue = SobGroup_GetHardPointHealth(Group .. tostring(i), "efficency") - 0.03
			    if effvalue >= 0 and effvalue <= 1 then 
	          SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", effvalue)
	        else
	          SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", 0)
	        end  	              		    
			  end 
			  
	---se ha danno			  
	      if SobGroup_HealthPercentage(Group .. tostring(i)) <= 0.5 then
	      	local effvalue = SobGroup_GetHardPointHealth(Group .. tostring(i), "efficency") - 0.03
			    if effvalue >= 0 and effvalue <= 1 then 
	          SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", effvalue)
	        else
	          SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", 0)
	        end  			       	
	      end 
	      
	      if SobGroup_GetHardPointHealth(Group .. tostring(i), "efficency") >= 1 then
	        SobGroup_SetHardPointHealth(Group .. tostring(i), "efficency", 1) 
	      end 
		   		         
	    end
	  end   
	end  
end   