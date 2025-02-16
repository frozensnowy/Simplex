function heavyioncannoninit()  
  local playerIndex = 0                           
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then         
---Inizializza le unità, blocca le.1      
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon2") 	   
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon3") 	   
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon4") 	   
	      end            
    	end   
		end 
		playerIndex = playerIndex + 1  
	end	
  Rule_Remove("heavyioncannoninit") 
  Rule_AddInterval("HeavyIonCannon", 10) --ok      
end  

function HeavyIonCannon()
  local playerIndex = 0                       
  local playerCount = Universe_PlayerCount()           
  while playerIndex < playerCount do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        if Player_GetRace(playerIndex) == Race_Hiigaran then       
          if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") > 0 then     
            local playerIndexList = playerIndex + 1
	          if SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2") > 0 then          
	            
	            if (Player_HasResearch(playerIndex, "hic3") == 1) and (bloccoioncannon[playerIndexList] == 3) then
	              SobGroup_SetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2", 0) 
	              Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon3") 	  
	              bloccoioncannon[playerIndexList] = 4  
	              Rule_AddInterval("HeavyIonCannon1", 1)     
	                             	              
	            elseif (Player_HasResearch(playerIndex, "hic2") == 1) and (bloccoioncannon[playerIndexList] == 2) then	              
	              SobGroup_SetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2", 0)
	              Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon2") 	     
	              bloccoioncannon[playerIndexList] = 3 
	              Rule_AddInterval("HeavyIonCannon1", 1)    
	                              	              
	            elseif (Player_HasResearch(playerIndex, "hic1") == 1) and (bloccoioncannon[playerIndexList] == 1) then
	              SobGroup_SetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2", 0)
	              Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon1") 	   
	              bloccoioncannon[playerIndexList] = 2    	               
	              Rule_AddInterval("HeavyIonCannon1", 1)       
	                          	              
	            end
	            
	          elseif SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2") <= 0 then 

---caso in cui viene distrutto o riciclato	          
	            if bloccoioncannon[playerIndexList] == 1 then
	            elseif bloccoioncannon[playerIndexList] == 2 then
	              Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon2") 
	              Player_UnrestrictBuildOption(playerIndex, "Hgn_MothershipCannon1") 
	              bloccoioncannon[playerIndexList] = 1
	            elseif bloccoioncannon[playerIndexList] == 3 then
	              Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon3") 
	              Player_UnrestrictBuildOption(playerIndex, "Hgn_MothershipCannon2") 
	              bloccoioncannon[playerIndexList] = 2
	            elseif bloccoioncannon[playerIndexList] == 4 then
	              Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon4") 
	              Player_UnrestrictBuildOption(playerIndex, "Hgn_MothershipCannon3") 
	              bloccoioncannon[playerIndexList] = 3
	            end	            
	                       
	          end      
	        end          
        end                         
      end
    end
    playerIndex = playerIndex + 1
  end      
end

function HeavyIonCannon1()
  local playerIndex = 0                       
  local playerCount = Universe_PlayerCount()         
  while playerIndex < playerCount do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        if Player_GetRace(playerIndex) == Race_Hiigaran then       
          if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") > 0 then   
            local playerIndexList = playerIndex + 1  
	          if (Player_HasResearch(playerIndex, "hic3") == 1) and (bloccoioncannon[playerIndexList] == 4) then  
	            Player_UnrestrictBuildOption(playerIndex, "Hgn_MothershipCannon4")
					    SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "Hgn_MothershipCannon4")   
					  elseif (Player_HasResearch(playerIndex, "hic2") == 1) and (bloccoioncannon[playerIndexList] == 3) then  
					    Player_UnrestrictBuildOption(playerIndex, "Hgn_MothershipCannon3")
					    SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "Hgn_MothershipCannon3") 
					  elseif (Player_HasResearch(playerIndex, "hic1") == 1) and (bloccoioncannon[playerIndexList] == 2) then  
					    Player_UnrestrictBuildOption(playerIndex, "Hgn_MothershipCannon2")
					    SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "Hgn_MothershipCannon2")   
					  end
	        end          
        end                         
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("HeavyIonCannon1")  
end
