function pop()   
  
  for i = 1,6,1 do   
    orbitalstationList[i] = 0    
  end  

  for i = 0,ncf-1,1 do
    if SobGroup_Empty("splitcommandfortresses"..i) == 0 then
      if SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_battlestation") == 1 then        
		    local playerIndexList = SobGroup_OwnedBy("splitcommandfortresses"..i) + 1		  
		 
		--max cap civilian
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
		    
		    if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")*100000 < MaxCivCap and
		       SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")<0.99968 then
		      SobGroup_SetHardPointHealth("splitcommandfortresses"..i, "pop", (SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop") + 0.00016))
		    end  
		    orbitalstationPop = floor(SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")*100000)
		    if orbitalstationPop > MaxCivCap then
		      orbitalstationPop = MaxCivCap
		    end
		    
		    orbitalstationList[playerIndexList] = orbitalstationList[playerIndexList]+orbitalstationPop
		    
    --pings
	      if SobGroup_OwnedBy("splitcommandfortresses"..i) == Universe_CurrentPlayer() then		            
			    local p = Ping_AddSobGroup("Orbit One "..i, "populationping", "splitcommandfortresses"..i)
					Ping_LabelVisible(p, 1)							
					Ping_AddDescription(p, 0, "Population: "..orbitalstationPop.."/"..MaxCivCap.." ("..orbitalstationPop.." RUs/year)")			           
			  end		
			  		  
      elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "rad_blackmarket") == 1 then        
		    local playerIndexList = SobGroup_OwnedBy("splitcommandfortresses"..i) + 1		  
		 
		--max cap civilian
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
		    
		    if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")*100000 < MaxCivCap and
		       SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")<0.99968 then
		      SobGroup_SetHardPointHealth("splitcommandfortresses"..i, "pop", (SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop") + 0.00016))
		    end  
		    orbitalstationPop = floor(SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pop")*100000)
		    if orbitalstationPop > MaxCivCap then
		      orbitalstationPop = MaxCivCap
		    end
		    
		    orbitalstationList[playerIndexList] = orbitalstationList[playerIndexList]+orbitalstationPop
		    
    --pings
	      if SobGroup_OwnedBy("splitcommandfortresses"..i) == Universe_CurrentPlayer() then		            
			    local p = Ping_AddSobGroup("Easy Money "..i, "populationping", "splitcommandfortresses"..i)
					Ping_LabelVisible(p, 1)							
					Ping_AddDescription(p, 0, "Population: "..orbitalstationPop.."/"..MaxCivCap.." ("..orbitalstationPop.." RUs/year)")			           
			  end		

		  end
		end
	end
	
	if ((year==0 and gametime<35) or year>0) then
    UI_SetTextLabelText("UnitCapInfoPopup", "lblplanet", ""..planetList[Universe_CurrentPlayer()+1]+orbitalstationList[Universe_CurrentPlayer()+1]);
  end   
	
end		    
			