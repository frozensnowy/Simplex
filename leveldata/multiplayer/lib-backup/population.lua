function populationinit()  
  local playerIndex = 0                           
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then         
---Inizializza le unit? blocca le.1      
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then
	        for z, iCount in ship_list.hgn do
						Population_RestrictBuildOption(playerIndex, ship_list.hgn, z)
					end
					Player_RestrictBuildOption(playerIndex, "hgn_transportcell1")		--this is an exception
					--well, more expections...
	        Player_RestrictBuildOption(playerIndex, "hgn_interceptorl")
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberl")
	        Player_RestrictBuildOption(playerIndex, "hgn_lbomberl")
	        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighterl")
	        Player_RestrictBuildOption(playerIndex, "hgn_hftl")
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavyl")
	        Player_RestrictBuildOption(playerIndex, "hgn_strategicbomberl")
	        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
	        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")
	        Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvettel")
          Player_RestrictBuildOption(playerIndex, "hgn_bombervettel")
	        Player_RestrictBuildOption(playerIndex, "hgn_cthl")
	        Player_RestrictBuildOption(playerIndex, "hgn_cthionl")
	        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
	        Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevettel")
	        --OMG, MORE...
	        Player_RestrictBuildOption(playerIndex, "hgn_orders_parade_disable")
          Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon2")
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon3")
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon4")
	      elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
	        for z, iCount in ship_list.vgr do
						Population_RestrictBuildOption(playerIndex, ship_list.vgr, z)
					end
	      elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
	        for z, iCount in ship_list.kad do
						Population_RestrictBuildOption(playerIndex, ship_list.kad, z)
					end
	      elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
	        for z, iCount in ship_list.rad do
						Population_RestrictBuildOption(playerIndex, ship_list.rad, z)
					end
				elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then
	        for z, iCount in ship_list.kpr do
						Population_RestrictBuildOption(playerIndex, ship_list.kpr, z)
					end
	      end            
    	end   
		end 
		playerIndex = playerIndex + 1  
	end	
  Rule_Remove("populationinit")
  MP_RestrictCampaignItems()		--newly introduced due to single player mission
  
	--SP Squadron Switching Debug
  if GetGameRubric() == GR_CAMPAIGN then
  	Temp_GlobalVariable.SPHasFighterSquadronTechOnStart = {0,0,0,0,0,0}
  	Temp_GlobalVariable.SPHasCorvetteSquadronTechOnStart = {0,0,0,0,0,0}
  end
  
end  

function population()

---determina quanti piloti/ufficiali vengono aggiunti ad ogni avanzamento di grado, basato sul parametro unitcapsrank
	local pilotmultiplier = 1	--1.5		--I want to have more ships now :)
	local officermultiplier = 1	--2
  local pilottoadd = 150 --* pilotmultiplier
	local officertoadd = 6 --* officermultiplier
  if unitcapsrank == 4 then				
	  pilottoadd = 130 --* pilotmultiplier
	elseif unitcapsrank == 3 then		
		pilottoadd = 110 --* pilotmultiplier
	elseif unitcapsrank == 2 then		
	  pilottoadd = 90	--100 --* pilotmultiplier
	elseif unitcapsrank == 1 then   
	  pilottoadd = 70	--90 --* pilotmultiplier
	elseif unitcapsrank == 5 then
	  pilottoadd = 13000		--infinite (test only!)
	else
		pilottoadd = 100 --* pilotmultiplier
	end			
  if unitcapsofficer == 4 then				
    officertoadd = 7 --* officermultiplier
	elseif unitcapsofficer == 3 then		
    officertoadd = 5 --* officermultiplier
	elseif unitcapsofficer == 2 then		
    officertoadd = 3 --4	--* officermultiplier
	elseif unitcapsofficer == 1 then   
    officertoadd = 1 --3 --* officermultiplier
  elseif unitcapsofficer == 5 then
    officertoadd = 700		--infinite (test only!)
	else
    officertoadd = 4 --* officermultiplier
	end	

  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
        honorList[playerIndexList] = 0          
        pilotmaxList[playerIndexList] = 150         
        officermaxList[playerIndexList] = 10 
          
        honortimefactor = (1-(year/275)) -- con set a 250: 0.9 a 25 anni, 0.8 a 50 anni, 0.6 a 100 anni - >n >honortimefactor
        if honortimefactor < 0.35 then
          honortimefactor = 0.35
        end        
        
	      honoramountfactor = (1-(honorList[playerIndexList]/730))  -- a 365 ?0.5   
	      if honoramountfactor < 0.5 then
	        honoramountfactor = 0.5
	      end 
        
---calcola in numero di debris conquistati e poi distrutti e aggiorna le statistice delle navi perse non calcolando i debris
        DebrisPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk1")*50000) +
                    (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk2")*55000) +
                    (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk3")*60000) +
                    (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk4")*65000) +
                    (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_veildebris_chunk5")*70000) +
                    (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nuclearbomb")*20000) +
                    (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "meg_foundry")*200000)  
        if DebrisPop < LastDebrisPop[playerIndexList] then
          Stats_Extra[playerIndexList] = Stats_Extra[playerIndexList] + (LastDebrisPop[playerIndexList] - DebrisPop)
        end   
        LastDebrisPop[playerIndexList] = DebrisPop          
        
---calcolo onore 	
				local honor_rate = honoursensitivity
				if Player_GetRace(playerIndex) == Race_Keeper then
					honor_rate = honoursensitivity*0.8
				end
	      if Player_HasResearch(playerIndex, "isexpert") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor(Stats_EnemyShipsCaptured(playerIndex)+sqrt(abs(Stats_EnemyShipsCapturedInRUs(playerIndex)))/100) 	--floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor (sqrt(((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 1.0) / 11))
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)	      		      
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honor_rate)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.08 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      elseif Player_HasResearch(playerIndex, "ishard") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor(Stats_EnemyShipsCaptured(playerIndex)+sqrt(abs(Stats_EnemyShipsCapturedInRUs(playerIndex)))/100) 	--floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor (sqrt(((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 1.0) / 11))
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)			         
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honor_rate)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.06 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      elseif Player_HasResearch(playerIndex, "isstandard") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor(Stats_EnemyShipsCaptured(playerIndex)+sqrt(abs(Stats_EnemyShipsCapturedInRUs(playerIndex)))/100) 	--floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor (sqrt(((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 1.0) / 11))
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)			          
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honor_rate)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.04 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      elseif Player_HasResearch(playerIndex, "iseasy") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor(Stats_EnemyShipsCaptured(playerIndex)+sqrt(abs(Stats_EnemyShipsCapturedInRUs(playerIndex)))/100) 	--floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor (sqrt(((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 1.0) / 11))
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)	  		      
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honor_rate)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.02 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      else
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.045) - (Stats_TotalLossesInRUs( playerIndex ) * 0.725) + (Stats_Extra[playerIndexList] * 0.725)) / 1000)        
		      honorcapture = floor(Stats_EnemyShipsCaptured(playerIndex)+sqrt(abs(Stats_EnemyShipsCapturedInRUs(playerIndex)))/100) 	--floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor (sqrt(((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 1.0) / 11))
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.35) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.35)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.15) / 1000)	    	      
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honor_rate)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1 * honortimefactor * honoramountfactor)     
	      end
	            
	--no onore in negativo
	      if honorList[playerIndexList] < 0 then
	        honorList[playerIndexList] = 0
	      end
	        
	--solo all'inizio setta l'onore secondo i settaggi di partenza	        
        if honorinit == 0 then
          if honorList[playerIndexList] > honourstartList[playerIndexList] then
            local gap = (honorList[playerIndexList] - honourstartList[playerIndexList])	            
            honorList[playerIndexList] = floor (honourstartList[playerIndexList])	 
            honourstartList1[playerIndexList] = honourstartList[playerIndexList]         
            honourstartList[playerIndexList] = honourstartList[playerIndexList] - gap	        
          elseif honorList[playerIndexList] < honourstartList[playerIndexList] then
            local gap = (honourstartList[playerIndexList] - honorList[playerIndexList])	            
            honorList[playerIndexList] = floor (honourstartList[playerIndexList])	 
            honourstartList1[playerIndexList] = honourstartList[playerIndexList]         
            honourstartList[playerIndexList] = honourstartList[playerIndexList] + gap	                    	            
          end              
        end	    
        
   --x i primi 3 anni l'onore non scende sotto il livello di partenza
        if year <= 2 then
          if honorList[playerIndexList] < honourstartList1[playerIndexList] then
		        honorList[playerIndexList] = floor (honourstartList1[playerIndexList])
		      end 	      
        end         	                 
               
---Calculate pilots and officers for player's ships, no matter what race they belong to!
				fighter[playerIndexList] = 0
				corvette[playerIndexList] = 0
				frigate[playerIndexList] = 0
				capital[playerIndexList] = 0
				armedcapital[playerIndexList] = 0
				platform[playerIndexList] = 0
				utility[playerIndexList] = 0
				weapon[playerIndexList] = 0
				--dofilepath([[data:leveldata/multiplayer/lib/ship_list.lua]])		--done in deathmatch.lua
				pilotpopList[playerIndexList] = 0
				officerpopList[playerIndexList] = 0
				for z, iCount in ship_list.hgn do
					Population_SumUp(playerIndex, ship_list.hgn, z)
				end
				for z, iCount in ship_list.vgr do
					Population_SumUp(playerIndex, ship_list.vgr, z)
				end
				for z, iCount in ship_list.kad do
					Population_SumUp(playerIndex, ship_list.kad, z)
				end
				for z, iCount in ship_list.rad do
					Population_SumUp(playerIndex, ship_list.rad, z)
				end
				for z, iCount in ship_list.kpr do
					Population_SumUp(playerIndex, ship_list.kpr, z)
				end
				for z, iCount in ship_list.meg do		--miscellaneous ships, i.e. those spawned from crates
					Population_SumUp(playerIndex, ship_list.meg, z)
				end
				--number of ships in fleet
				pilotpopdisplayList[playerIndexList] = fighter[playerIndexList] + corvette[playerIndexList] + frigate[playerIndexList] + capital[playerIndexList] + armedcapital[playerIndexList] + platform[playerIndexList] + utility[playerIndexList] + weapon[playerIndexList]

---calcola il totale piloti ed ufficiali
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      

---calcola piloti ed ufficiali disponibili in base ai moduli montati sulla Crew Station    
	        if ncs > 0 then
					  for i = 0,ncs-1,1 do
					    if SobGroup_Empty("splitcrewstations"..i) == 0 then		
					      if SobGroup_OwnedBy("splitcrewstations"..i) == playerIndex then				    
							    if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 1") > 0 then
					          pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + pilottoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 2") > 0 then
					          pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + pilottoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 3") > 0 then
					          pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + pilottoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 4") > 0 then
					          pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + pilottoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 5") > 0 then
					          pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + pilottoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 6") > 0 then
					          pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = pilotmaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + pilottoadd        
					        end            
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 7") > 0 then
					          officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + officertoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 8") > 0 then
					          officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + officertoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 9") > 0 then
					          officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + officertoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 10") > 0 then
					          officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + officertoadd        
					        end    
					        if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 11") > 0 then
					          officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = officermaxList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + officertoadd        
					        end   
					      end    
							end	
						end	
					end		    
	
---crew savior  
          if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then       
            if nec[playerIndexList] > 0 then
	            for i = 0,(nec[playerIndexList]-1),1 do  	 		  
						    if SobGroup_Empty("splitevacs"..playerIndex .. tostring(i)) == 0	then  
						      SobGroup_ForceStayDockedIfDocking("splitevacs"..playerIndex .. tostring(i))
						      if SobGroup_IsDockedSobGroup("splitevacs"..playerIndex .. tostring(i), "evacuater"..playerIndex) == 1 then  
						        if SobGroup_GetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "pilot") ~= 0 and SobGroup_GetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "officer") ~= 0 and SobGroup_GetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "pilot") ~= 1 and SobGroup_GetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "officer") ~= 1 then						        
							        pilotrecruitList[playerIndexList] = floor(pilotrecruitList[playerIndexList] + (SobGroup_GetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "pilot") * 100))
	                    officerrecruitList[playerIndexList] = floor(officerrecruitList[playerIndexList] + (SobGroup_GetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "officer") * 100)) 
	                    SobGroup_SetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "pilot", 0) 
			          	    SobGroup_SetHardPointHealth("splitevacs"..playerIndex .. tostring(i), "officer", 0)                              
			          	  end  
			          	elseif SobGroup_IsDoingAbility("splitevacs"..playerIndex .. tostring(i), abilityList[9]) == 1 then  
							    else
							      --viene fatto in interface/selected perch?pi?rapido							      
							    end				    
								end		             
							end 
						end	 
					else
					  if nec[playerIndexList] > 0 then
	            for i = 0,(nec[playerIndexList]-1),1 do  	 		  
						    if SobGroup_Empty("splitevacs"..playerIndex .. tostring(i)) == 0	then  
					        SobGroup_TakeDamage("splitevacs"..playerIndex .. tostring(i), 1)	  
					      end
					    end
					  end                      	        
		      end  
		      
---in caso di morte di piloti ed ufficiali li sottrae al reclutamento x AI		  
          if Player_HasResearch(playerIndex, "isai" ) == 1 then
            if LastpilotpopList[playerIndexList] > pilotpopList[playerIndexList] then
			        pilotrecruitList[playerIndexList] = floor(pilotrecruitList[playerIndexList] - ((LastpilotpopList[playerIndexList] - pilotpopList[playerIndexList])/2))		        
			      end
			      if LastofficerpopList[playerIndexList] > officerpopList[playerIndexList] then
			        officerrecruitList[playerIndexList] = floor(officerrecruitList[playerIndexList] - ((LastofficerpopList[playerIndexList] - officerpopList[playerIndexList])/2))		        
			      end
          else    
			      if LastpilotpopList[playerIndexList] > pilotpopList[playerIndexList] then
			        pilotrecruitList[playerIndexList] = floor(pilotrecruitList[playerIndexList] - (LastpilotpopList[playerIndexList] - pilotpopList[playerIndexList]))		        
			      end
			      if LastofficerpopList[playerIndexList] > officerpopList[playerIndexList] then
			        officerrecruitList[playerIndexList] = floor(officerrecruitList[playerIndexList] - (LastofficerpopList[playerIndexList] - officerpopList[playerIndexList]))		        
			      end
		      end		    
					
					Haxor_UnitCapHack(playerIndexList)
					
---se crew reclutata ?< di impigati bilancia
          if pilotrecruitList[playerIndexList] < pilotpopList[playerIndexList] then 				   		      
            pilotrecruitList[playerIndexList] = pilotpopList[playerIndexList]
          end
          if officerrecruitList[playerIndexList] < officerpopList[playerIndexList] then 				   		      
            officerrecruitList[playerIndexList] = officerpopList[playerIndexList]
          end
          
---se crew reclutata ?> di crew max setta crew reclutata ai piloti attuali
          if pilotrecruitList[playerIndexList] > pilotmaxList[playerIndexList] then 				   		      
            pilotrecruitList[playerIndexList] = pilotmaxList[playerIndexList]
          end
          if officerrecruitList[playerIndexList] > officermaxList[playerIndexList] then 				   		      
            officerrecruitList[playerIndexList] = officermaxList[playerIndexList]
          end       

---calcola i piloti disponibili e blocca e sblocca le unit?in base al numero di piloti ed ufficiali
          NeededPilots[playerIndexList] = pilotrecruitList[playerIndexList] - pilotpopList[playerIndexList]
          NeededOfficers[playerIndexList] = officerrecruitList[playerIndexList] - officerpopList[playerIndexList]
          if NeededPilots[playerIndexList] < 0 then
            NeededPilots[playerIndexList] = 0
            if SobGroup_Empty("supporter"..playerIndex) == 0 then
            	CreateSubsystemOnShip("supporter"..playerIndex, "ai_unitcap")		--sometimes Hiigaran AI builds excessive fighters
            end
          else
          	if SobGroup_Empty("supporter"..playerIndex) == 0 then
            	RemoveSubsystemOnShip("supporter"..playerIndex, "ai_unitcap")
            end
          end  
          if NeededOfficers[playerIndexList] < 0 then
            NeededOfficers[playerIndexList] = 0
          end          
 
          if (NeededPilots[playerIndexList] < 1) then
            if (canbuildgunturret[playerIndexList] == 0) then
              Player_RestrictBuildOption(playerIndex, "hgn_gunturret")
              Player_UnrestrictBuildOption(playerIndex, "hgn_gunturret1")
              canbuildgunturret[playerIndexList] = 1
            end  
          elseif (NeededPilots[playerIndexList] >= 1) then 
            if (canbuildgunturret[playerIndexList] == 1) then
              Player_UnrestrictBuildOption(playerIndex, "hgn_gunturret")
              Player_RestrictBuildOption(playerIndex, "hgn_gunturret1")
              canbuildgunturret[playerIndexList] = 0
            end  
          end
          
          if (NeededPilots[playerIndexList] < 2) then
            if (canbuildpulsarturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_pulsarturret")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarturret1")
	            canbuildpulsarturret[playerIndexList] = 1
	          end  
	          if (canbuildcollector[playerIndexList] == 0) then
              Player_RestrictBuildOption(playerIndex, "hgn_resourcecollector")
              Player_UnrestrictBuildOption(playerIndex, "hgn_resourcecollector1")
              canbuildcollector[playerIndexList] = 1
            end  
          elseif (NeededPilots[playerIndexList] >= 2) then
            if (canbuildpulsarturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarturret")
	            Player_RestrictBuildOption(playerIndex, "hgn_pulsarturret1")
	            canbuildpulsarturret[playerIndexList] = 0
	          end 
	          if (canbuildcollector[playerIndexList] == 1) then 
              Player_UnrestrictBuildOption(playerIndex, "hgn_resourcecollector")
              Player_RestrictBuildOption(playerIndex, "hgn_resourcecollector1")
              canbuildcollector[playerIndexList] = 0
            end  
          end
          
          if (NeededPilots[playerIndexList] < 3) then
            if (canbuildscout[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_scout")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_scout1")
	            canbuildscout[playerIndexList] = 1
	          end
	          if (canbuilddefender[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_defender")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_defender1")
	            canbuilddefender[playerIndexList] = 1
	          end
	          if (canbuildminelayercorvette[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_minelayercorvette")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_minelayercorvette1")
	            canbuildminelayercorvette[playerIndexList] = 1
	          end
	          if (canbuildionturret[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_ionturret")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ionturret1")
	            canbuildionturret[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 3) then
            if (canbuildscout[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_scout")
	            Player_RestrictBuildOption(playerIndex, "hgn_scout1")
	            canbuildscout[playerIndexList] = 0
	          end  
	          if (canbuilddefender[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_defender")
	            Player_RestrictBuildOption(playerIndex, "hgn_defender1")
	            canbuilddefender[playerIndexList] = 0
	          end  
	          if (canbuildminelayercorvette[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_minelayercorvette")
	            Player_RestrictBuildOption(playerIndex, "hgn_minelayercorvette1")
	            canbuildminelayercorvette[playerIndexList] = 0
	          end
	          if (canbuildionturret[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ionturret")
	            Player_RestrictBuildOption(playerIndex, "hgn_ionturret1")
	            canbuildionturret[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 4) then
            if (canbuildcontroller[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_resourcecontroller")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_resourcecontroller1")
	            Player_RestrictBuildOption(playerIndex, "hgn_container")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_container1")
	            canbuildcontroller[playerIndexList] = 1
	          end  
	          if (canbuildmissileturret[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_missileturret")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_missileturret1")
	            canbuildmissileturret[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 4) then
            if (canbuildcontroller[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_resourcecontroller")
	            Player_RestrictBuildOption(playerIndex, "hgn_resourcecontroller1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_container")
	            Player_RestrictBuildOption(playerIndex, "hgn_container1")
	            canbuildcontroller[playerIndexList] = 0
	          end  
	          if (canbuildmissileturret[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_missileturret")
	            Player_RestrictBuildOption(playerIndex, "hgn_missileturret1")
	            canbuildmissileturret[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 5) then
          	if (canbuildrts[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_defensefieldturret")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_defensefieldturret1")
	            Player_RestrictBuildOption(playerIndex, "hgn_rts")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_rts1")
	            canbuildrts[playerIndexList] = 1
	          end
		      elseif (NeededPilots[playerIndexList] >= 5) then    
		      	if (canbuildrts[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_defensefieldturret")
	            Player_RestrictBuildOption(playerIndex, "hgn_defensefieldturret1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_rts")
	            Player_RestrictBuildOption(playerIndex, "hgn_rts1")
	            canbuildrts[playerIndexList] = 0
	          end    
	        end  
          
					--SP SQUADRON SWITCHING DEBUG
          local SP_HaltSquadronSwitchingForDebugging = 0
          if GetGameRubric() == GR_CAMPAIGN then
          	if Temp_GlobalVariable.SPHasFighterSquadronTechOnStart[playerIndexList] == 0 then
	          	if Player_HasResearch(playerIndex, "fightersquadron7") == 1 then
	          		Temp_GlobalVariable.SPHasFighterSquadronTechOnStart[playerIndexList] = 1
	          		SP_HaltSquadronSwitchingForDebugging = 1
	          	end
	          else		--in the next function cycle, proceed to normal mode
	          	SP_HaltSquadronSwitchingForDebugging = 0
	          end
          end
          
---fighters
          if Player_HasResearch(playerIndex, "fightersquadron7") == 0 or SP_HaltSquadronSwitchingForDebugging == 1 then             
	          if (NeededPilots[playerIndexList] < 5) then
	            if (canbuildinterceptor[playerIndexList] == 0) then            
		            Player_RestrictBuildOption(playerIndex, "hgn_interceptor")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_interceptor1")
		            canbuildinterceptor[playerIndexList] = 1
		          end
		          if (canbuildbomber[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomber")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomber1")
		            canbuildbomber[playerIndexList] = 1
		          end		          
		          if (canbuildlbomber[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_lbomber")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_lbomber1")
		            canbuildlbomber[playerIndexList] = 1
		          end
		          if (canbuildrailgunfighter[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_railgunfighter1")
		            canbuildrailgunfighter[playerIndexList] = 1
		          end  
		          if (canbuildhft[playerIndexList] == 0) then      
		            Player_RestrictBuildOption(playerIndex, "hgn_hft")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_hft1")
		            canbuildhft[playerIndexList] = 1
		          end  
		          if (canbuildbomberheavy[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberheavy1")
		            Player_RestrictBuildOption(playerIndex, "hgn_strategicbomber")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_strategicbomber1")
		            canbuildbomberheavy[playerIndexList] = 1
		          end		          
	          elseif (NeededPilots[playerIndexList] >= 5) then
	            if (canbuildinterceptor[playerIndexList] == 1) then
		            Player_UnrestrictBuildOption(playerIndex, "hgn_interceptor")
		            Player_RestrictBuildOption(playerIndex, "hgn_interceptor1")
		            canbuildinterceptor[playerIndexList] = 0
		          end
		          if (canbuildbomber[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomber")
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomber1")
		            canbuildbomber[playerIndexList] = 0
		          end		          
		          if (canbuildlbomber[playerIndexList] == 1) then
		            Player_UnrestrictBuildOption(playerIndex, "hgn_lbomber")
		            Player_RestrictBuildOption(playerIndex, "hgn_lbomber1")
		            canbuildlbomber[playerIndexList] = 0
		          end 
		          if (canbuildrailgunfighter[playerIndexList] == 1) then
		            Player_UnrestrictBuildOption(playerIndex, "hgn_railgunfighter")
		            Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter1")
		            canbuildrailgunfighter[playerIndexList] = 0
		          end  
		          if (canbuildhft[playerIndexList] == 1) then      
		            Player_UnrestrictBuildOption(playerIndex, "hgn_hft")
		            Player_RestrictBuildOption(playerIndex, "hgn_hft1")
		            canbuildhft[playerIndexList] = 0
		          end
		          if (canbuildbomberheavy[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberheavy")
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_strategicbomber")
		            Player_RestrictBuildOption(playerIndex, "hgn_strategicbomber1")
		            canbuildbomberheavy[playerIndexList] = 0
		          end		          
	          end
	        else	          
	          if (NeededPilots[playerIndexList] < 7) then	          
	            if (bloccofightersquadron[playerIndexList] == 0) then	   
	              if (NeededPilots[playerIndexList] < 5) then
	                if (canbuildinterceptor[playerIndexList] == 1) then  			          
						        Player_RestrictBuildOption(playerIndex, "hgn_interceptor1") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_attackbomber1") 		   	         	       
						        Player_RestrictBuildOption(playerIndex, "hgn_lbomber1") 
						        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter1") 	         
						        Player_RestrictBuildOption(playerIndex, "hgn_hft1") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy1")
						        Player_RestrictBuildOption(playerIndex, "hgn_strategicbomber1")
						      end  
					      else
					        if (canbuildinterceptor[playerIndexList] == 0) then
						        Player_RestrictBuildOption(playerIndex, "hgn_interceptor") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_attackbomber") 		   	         	       
						        Player_RestrictBuildOption(playerIndex, "hgn_lbomber") 
						        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter") 	         
						        Player_RestrictBuildOption(playerIndex, "hgn_hft") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy")
						        Player_RestrictBuildOption(playerIndex, "hgn_strategicbomber")
						      end  
				        end  	        
				        bloccofightersquadron[playerIndexList] = 1				        
				        canbuildinterceptor[playerIndexList] = 1
								canbuildbomber[playerIndexList] = 1							
								canbuildlbomber[playerIndexList] = 1
								canbuildrailgunfighter[playerIndexList] = 1
								canbuildhft[playerIndexList] = 1
								canbuildbomberheavy[playerIndexList] = 1								
								Player_UnrestrictBuildOption(playerIndex, "hgn_interceptorl1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberl1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_lbomberl1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_railgunfighterl1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_hftl1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberheavyl1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_strategicbomberl1")
				      end 	          
	            if (canbuildinterceptor[playerIndexList] == 0) then            
		            Player_RestrictBuildOption(playerIndex, "hgn_interceptorl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_interceptorl1")
		            canbuildinterceptor[playerIndexList] = 1
		          end
		          if (canbuildbomber[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomberl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberl1")
		            canbuildbomber[playerIndexList] = 1
		          end		          
		          if (canbuildlbomber[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_lbomberl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_lbomberl1")
		            canbuildlbomber[playerIndexList] = 1
		          end
		          if (canbuildrailgunfighter[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_railgunfighterl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_railgunfighterl1")
		            canbuildrailgunfighter[playerIndexList] = 1
		          end  
		          if (canbuildhft[playerIndexList] == 0) then      
		            Player_RestrictBuildOption(playerIndex, "hgn_hftl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_hftl1")
		            canbuildhft[playerIndexList] = 1
		          end  
		          if (canbuildbomberheavy[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavyl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberheavyl1")
		            Player_RestrictBuildOption(playerIndex, "hgn_strategicbomberl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_strategicbomberl1")
		            canbuildbomberheavy[playerIndexList] = 1
		          end		          
	          elseif (NeededPilots[playerIndexList] >= 7) then
              if (bloccofightersquadron[playerIndexList] == 0) then	       
                if (canbuildinterceptor[playerIndexList] == 0) then   
				          Player_RestrictBuildOption(playerIndex, "hgn_interceptor") 	 
					        Player_RestrictBuildOption(playerIndex, "hgn_attackbomber") 		   	         	       
					        Player_RestrictBuildOption(playerIndex, "hgn_lbomber") 
					        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter") 	         
					        Player_RestrictBuildOption(playerIndex, "hgn_hft") 	 
					        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy")
					        Player_RestrictBuildOption(playerIndex, "hgn_strategicbomber")
					      end  
				        bloccofightersquadron[playerIndexList] = 1				        
				        canbuildinterceptor[playerIndexList] = 0
								canbuildbomber[playerIndexList] = 0							
								canbuildlbomber[playerIndexList] = 0
								canbuildrailgunfighter[playerIndexList] = 0
								canbuildhft[playerIndexList] = 0
								canbuildbomberheavy[playerIndexList] = 0								
								Player_UnrestrictBuildOption(playerIndex, "hgn_interceptorl")
								Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberl")
								Player_UnrestrictBuildOption(playerIndex, "hgn_lbomberl")
								Player_UnrestrictBuildOption(playerIndex, "hgn_railgunfighterl")
								Player_UnrestrictBuildOption(playerIndex, "hgn_hftl")
								Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberheavyl")
								Player_UnrestrictBuildOption(playerIndex, "hgn_strategicbomberl")
				      end 	          	          
	            if (canbuildinterceptor[playerIndexList] == 1) then
		            Player_UnrestrictBuildOption(playerIndex, "hgn_interceptorl")
		            Player_RestrictBuildOption(playerIndex, "hgn_interceptorl1")
		            canbuildinterceptor[playerIndexList] = 0
		          end
		          if (canbuildbomber[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberl")
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomberl1")
		            canbuildbomber[playerIndexList] = 0
		          end		          
		          if (canbuildlbomber[playerIndexList] == 1) then
		            Player_UnrestrictBuildOption(playerIndex, "hgn_lbomberl")
		            Player_RestrictBuildOption(playerIndex, "hgn_lbomberl1")
		            canbuildlbomber[playerIndexList] = 0
		          end 
		          if (canbuildrailgunfighter[playerIndexList] == 1) then
		            Player_UnrestrictBuildOption(playerIndex, "hgn_railgunfighterl")
		            Player_RestrictBuildOption(playerIndex, "hgn_railgunfighterl1")
		            canbuildrailgunfighter[playerIndexList] = 0
		          end  
		          if (canbuildhft[playerIndexList] == 1) then      
		            Player_UnrestrictBuildOption(playerIndex, "hgn_hftl")
		            Player_RestrictBuildOption(playerIndex, "hgn_hftl1")
		            canbuildhft[playerIndexList] = 0
		          end
		          if (canbuildbomberheavy[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_attackbomberheavyl")
		            Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavyl1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_strategicbomberl")
		            Player_RestrictBuildOption(playerIndex, "hgn_strategicbomberl1")
		            canbuildbomberheavy[playerIndexList] = 0
		          end		          
	          end  
	        end  
					
					--SP SQUADRON SWITCHING DEBUG
          local SP_HaltSquadronSwitchingForDebugging = 0
          if GetGameRubric() == GR_CAMPAIGN then
          	if Temp_GlobalVariable.SPHasCorvetteSquadronTechOnStart[playerIndexList] == 0 then
	          	if Player_HasResearch(playerIndex, "corvettesquadron5") == 1 then
	          		Temp_GlobalVariable.SPHasCorvetteSquadronTechOnStart[playerIndexList] = 1
	          		SP_HaltSquadronSwitchingForDebugging = 1
	          	end
	          else		--in the next function cycle, proceed to normal mode
	          	SP_HaltSquadronSwitchingForDebugging = 0
	          end
          end

---Corvettes
          if Player_HasResearch(playerIndex, "corvettesquadron5") == 0 or SP_HaltSquadronSwitchingForDebugging == 1 then             
	          if (NeededPilots[playerIndexList] < 6) then	            
		          if (canbuildgunship[playerIndexList] == 0) then    
                Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvette1")							
		            Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvette1")
								Player_RestrictBuildOption(playerIndex, "hgn_bombervette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_bombervette1")
		            Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_torpedocorvette1")
		            canbuildgunship[playerIndexList] = 1
		          end	        
		        elseif (NeededPilots[playerIndexList] >= 6) then  		          
		          if (canbuildgunship[playerIndexList] == 1) then       
                Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvette")
		            Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette1")							
		            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvette")
		            Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_bombervette")
		            Player_RestrictBuildOption(playerIndex, "hgn_bombervette1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_torpedocorvette")
		            Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvette1")
		            canbuildgunship[playerIndexList] = 0
		          end
		        end
		        
		        if (NeededPilots[playerIndexList] < 9) then
	            if (canbuildmultigun[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvette1")
		            Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_gunshipcoevette1")
		            canbuildmultigun[playerIndexList] = 1
		          end
		          if (canbuildcth[playerIndexList] == 0) then    
		            Player_RestrictBuildOption(playerIndex, "hgn_cth")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cth1")
		            Player_RestrictBuildOption(playerIndex, "hgn_cthion")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cthion1")
		            canbuildcth[playerIndexList] = 1
		          end 
		        elseif (NeededPilots[playerIndexList] >= 9) then  
		          if (canbuildmultigun[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvette")
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_gunshipcoevette")
		            Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevette1")
		            canbuildmultigun[playerIndexList] = 0
		          end
		          if (canbuildcth[playerIndexList] == 1) then    
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cth")
		            Player_RestrictBuildOption(playerIndex, "hgn_cth1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cthion")
		            Player_RestrictBuildOption(playerIndex, "hgn_cthion1")
		            canbuildcth[playerIndexList] = 0
		          end
		        end
		        
		      else
		        if (NeededPilots[playerIndexList] < 10) then	          
	            if (bloccocorvettesquadron[playerIndexList] == 0) then	   
	              if (NeededPilots[playerIndexList] < 6) then  	
	                if (canbuildgunship[playerIndexList] == 1) then		          
						        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette1") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette1")
                    Player_RestrictBuildOption(playerIndex, "hgn_bombervette1")										
                    Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvette1")
						      end     	         	       					        
					      else
					        if (canbuildgunship[playerIndexList] == 0) then  
						        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette") 	
										Player_RestrictBuildOption(playerIndex, "hgn_bombervette") 	
										Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvette")
						      end  	        
				        end  	        
				        bloccocorvettesquadron[playerIndexList] = 1				        
				        canbuildgunship[playerIndexList] = 1																										
								Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1")	
                Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel1")								
                Player_UnrestrictBuildOption(playerIndex, "hgn_torpedocorvettel1")
				      end 
				      if (canbuildgunship[playerIndexList] == 0) then      
		            Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel1")
								Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1")
								Player_RestrictBuildOption(playerIndex, "hgn_bombervettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel1")
		            Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_torpedocorvettel1")
		            canbuildgunship[playerIndexList] = 1
		          end		               
				    elseif (NeededPilots[playerIndexList] >= 10) then  	     
				      if (bloccocorvettesquadron[playerIndexList] == 0) then	  
				        if (canbuildgunship[playerIndexList] == 0) then          
				          Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette") 	 
						      Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette") 	
                  Player_RestrictBuildOption(playerIndex, "hgn_bombervette") 									
                  Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvette")
						    end  	        	        
				        bloccocorvettesquadron[playerIndexList] = 1				        
				        canbuildgunship[playerIndexList] = 0										
								Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
								Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")	
                Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel")										
                Player_UnrestrictBuildOption(playerIndex, "hgn_torpedocorvettel")
				      end 	
				      if (canbuildgunship[playerIndexList] == 1) then        
		            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_bombervettel1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_torpedocorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_torpedocorvettel1")
		            canbuildgunship[playerIndexList] = 0
		          end		            	    
				    end 
				    
				    if (NeededPilots[playerIndexList] < 15) then	          
	            if (bloccocorvettesquadron1[playerIndexList] == 0) then	   
	              if (NeededPilots[playerIndexList] < 9) then
	                if (canbuildmultigun[playerIndexList] == 1) then  			          
						        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette1")
						        Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevette1")
						        Player_RestrictBuildOption(playerIndex, "hgn_cth1") 		
						        Player_RestrictBuildOption(playerIndex, "hgn_cthion1") 	
						      end  	   	         	       					        
					      else
					        if (canbuildmultigun[playerIndexList] == 0) then
						        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette")
						        Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevette")
						        Player_RestrictBuildOption(playerIndex, "hgn_cth") 		
						        Player_RestrictBuildOption(playerIndex, "hgn_cthion") 
						      end  		        
				        end  	        
				        bloccocorvettesquadron1[playerIndexList] = 1				        
				        canbuildmultigun[playerIndexList] = 1
								canbuildcth[playerIndexList] = 1																		
								Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_gunshipcoevettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthl1")	
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthionl1")										
				      end 
				      if (canbuildmultigun[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")
		            Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_gunshipcoevettel1")
		            canbuildmultigun[playerIndexList] = 1
		          end
		          if (canbuildcth[playerIndexList] == 0) then    
		            Player_RestrictBuildOption(playerIndex, "hgn_cthl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cthl1")
		            Player_RestrictBuildOption(playerIndex, "hgn_cthionl")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cthionl1")
		            canbuildcth[playerIndexList] = 1
		          end 
				    elseif (NeededPilots[playerIndexList] >= 15) then  	     
				      if (bloccocorvettesquadron1[playerIndexList] == 0) then	
				        if (canbuildmultigun[playerIndexList] == 0) then        
				          Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette")
				          Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevette")
						      Player_RestrictBuildOption(playerIndex, "hgn_cth") 		
						      Player_RestrictBuildOption(playerIndex, "hgn_cthion")   
					      end    	        
				        bloccocorvettesquadron1[playerIndexList] = 1				        
				        canbuildmultigun[playerIndexList] = 0
								canbuildcth[playerIndexList] = 0						
								Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
								Player_UnrestrictBuildOption(playerIndex, "hgn_gunshipcoevettel")
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthl")	
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthionl")					
				      end 	
				      if (canbuildmultigun[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_gunshipcoevettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_gunshipcoevettel1")
		            canbuildmultigun[playerIndexList] = 0
		          end
		          if (canbuildcth[playerIndexList] == 1) then    
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cthl")
		            Player_RestrictBuildOption(playerIndex, "hgn_cthl1")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_cthionl")
		            Player_RestrictBuildOption(playerIndex, "hgn_cthionl1")
		            canbuildcth[playerIndexList] = 0
		          end   
				    end      
		      end    
          
          if (NeededPilots[playerIndexList] < 6) then             
	          if (canbuildflak[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "hgn_assaultfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultfrigate1")
	            canbuildflak[playerIndexList] = 1
	          end
	          if (canbuildtorpedo[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "hgn_torpedofrigate")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_torpedofrigate1")
	            canbuildtorpedo[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 6) then        
	          if (canbuildflak[playerIndexList] == 1) then        
	            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultfrigate")
	            Player_RestrictBuildOption(playerIndex, "hgn_assaultfrigate1")
	            canbuildflak[playerIndexList] = 0
	          end
	          if (canbuildtorpedo[playerIndexList] == 1) then        
	            Player_UnrestrictBuildOption(playerIndex, "hgn_torpedofrigate")
	            Player_RestrictBuildOption(playerIndex, "hgn_torpedofrigate1")
	            canbuildtorpedo[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 7) then
            if (canbuildlrms[playerIndexList] == 0) then     
	            Player_RestrictBuildOption(playerIndex, "hgn_lrms")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_lrms1")
	            canbuildlrms[playerIndexList] = 1
	          end
	          if (canbuildmarine[playerIndexList] == 0) then       
	            Player_RestrictBuildOption(playerIndex, "hgn_marinefrigate")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_marinefrigate1")
	            canbuildmarine[playerIndexList] = 1
	          end
	          if (canbuilddefensefield[playerIndexList] == 0) then       
	            Player_RestrictBuildOption(playerIndex, "hgn_defensefieldfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_defensefieldfrigate1")
	            canbuilddefensefield[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 7) then
            if (canbuildlrms[playerIndexList] == 1) then             
	            Player_UnrestrictBuildOption(playerIndex, "hgn_lrms")
	            Player_RestrictBuildOption(playerIndex, "hgn_lrms1")
	            canbuildlrms[playerIndexList] = 0
	          end
	          if (canbuildmarine[playerIndexList] == 1) then       
	            Player_UnrestrictBuildOption(playerIndex, "hgn_marinefrigate")
	            Player_RestrictBuildOption(playerIndex, "hgn_marinefrigate1")
	            canbuildmarine[playerIndexList] = 0
	          end
	          if (canbuilddefensefield[playerIndexList] == 1) then       
	            Player_UnrestrictBuildOption(playerIndex, "hgn_defensefieldfrigate")
	            Player_RestrictBuildOption(playerIndex, "hgn_defensefieldfrigate1")
	            canbuilddefensefield[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 8) then
            if (canbuildioncannon[playerIndexList] == 0) then    
	            Player_RestrictBuildOption(playerIndex, "hgn_ioncannonfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ioncannonfrigate1")
	            canbuildioncannon[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 8) then
            if (canbuildioncannon[playerIndexList] == 1) then    
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ioncannonfrigate")
	            Player_RestrictBuildOption(playerIndex, "hgn_ioncannonfrigate1")
	            canbuildioncannon[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 9) then            
	          if (canbuildtulwar[playerIndexList] == 0) then    
	            Player_RestrictBuildOption(playerIndex, "hgn_tulwar")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_tulwar1")
	            canbuildtulwar[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 9) then            
	          if (canbuildtulwar[playerIndexList] == 1) then    
	            Player_UnrestrictBuildOption(playerIndex, "hgn_tulwar")
	            Player_RestrictBuildOption(playerIndex, "hgn_tulwar1")
	            canbuildtulwar[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 15) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuildscaver[playerIndexList] == 0) then    
	            Player_RestrictBuildOption(playerIndex, "hgn_scaver")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_scaver1")
	            canbuildscaver[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 15) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuildscaver[playerIndexList] == 1) then    
	            Player_UnrestrictBuildOption(playerIndex, "hgn_scaver")
	            Player_RestrictBuildOption(playerIndex, "hgn_scaver1")
	            canbuildscaver[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 10) or (NeededOfficers[playerIndexList] < 1) then            
	          if (canbuildjuggernaught[playerIndexList] == 0) then     
	            Player_RestrictBuildOption(playerIndex, "hgn_juggernaught")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_juggernaught1")
	            Player_RestrictBuildOption(playerIndex, "hgn_sentinel")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_sentinel1")
	            Player_RestrictBuildOption(playerIndex, "hgn_ionsentinel")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ionsentinel1")
	            Player_RestrictBuildOption(playerIndex, "hgn_artillerysentinel")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_artillerysentinel1")
	            canbuildjuggernaught[playerIndexList] = 1
	          end    
	          if (canbuildlc[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_lightcarrier")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_lightcarrier1")
	            canbuildlc[playerIndexList] = 1
	          end   
	          if (canbuildhs[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_hyperspacestation")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_hyperspacestation1")
	            canbuildhs[playerIndexList] = 1
	          end                     
          elseif (NeededPilots[playerIndexList] >= 10) and (NeededOfficers[playerIndexList] >= 1) then            
	          if (canbuildjuggernaught[playerIndexList] == 1) then    
	            Player_UnrestrictBuildOption(playerIndex, "hgn_juggernaught")
	            Player_RestrictBuildOption(playerIndex, "hgn_juggernaught1")  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_sentinel")
	            Player_RestrictBuildOption(playerIndex, "hgn_sentinel1")  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ionsentinel")
	            Player_RestrictBuildOption(playerIndex, "hgn_ionsentinel1")  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_artillerysentinel")
	            Player_RestrictBuildOption(playerIndex, "hgn_artillerysentinel1")  
	            canbuildjuggernaught[playerIndexList] = 0   
	          end  
	          if (canbuildlc[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_lightcarrier")
	            Player_RestrictBuildOption(playerIndex, "hgn_lightcarrier1")
	            canbuildlc[playerIndexList] = 0
	          end   
	          if (canbuildhs[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_hyperspacestation")
	            Player_RestrictBuildOption(playerIndex, "hgn_hyperspacestation1")
	            canbuildhs[playerIndexList] = 0
	          end                   
          end
          
          if (NeededPilots[playerIndexList] < 15) or (NeededOfficers[playerIndexList] < 1) then            
            if (canbuilddestroyer[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_destroyer")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_destroyer1")
	            Player_RestrictBuildOption(playerIndex, "hgn_sweeperdestroyer")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_sweeperdestroyer1")
	            canbuilddestroyer[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 15) and (NeededOfficers[playerIndexList] >= 1) then            
            if (canbuilddestroyer[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_destroyer")
	            Player_RestrictBuildOption(playerIndex, "hgn_destroyer1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_sweeperdestroyer")
	            Player_RestrictBuildOption(playerIndex, "hgn_sweeperdestroyer1")
	            canbuilddestroyer[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 18) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuildiondestroyer[playerIndexList] == 0) then  
              Player_RestrictBuildOption(playerIndex, "hgn_iondestroyer")
              Player_UnrestrictBuildOption(playerIndex, "hgn_iondestroyer1")
              canbuildiondestroyer[playerIndexList] = 1
            end  
            if (canbuildmissiledestroyer[playerIndexList] == 0) then  
              Player_RestrictBuildOption(playerIndex, "hgn_missiledestroyer")
              Player_UnrestrictBuildOption(playerIndex, "hgn_missiledestroyer1")
              canbuildmissiledestroyer[playerIndexList] = 1
            end  
          elseif (NeededPilots[playerIndexList] >= 18) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuildiondestroyer[playerIndexList] == 1) then  
              Player_UnrestrictBuildOption(playerIndex, "hgn_iondestroyer")
              Player_RestrictBuildOption(playerIndex, "hgn_iondestroyer1")
              canbuildiondestroyer[playerIndexList] = 0
            end  
            if (canbuildmissiledestroyer[playerIndexList] == 1) then  
              Player_UnrestrictBuildOption(playerIndex, "hgn_missiledestroyer")
              Player_RestrictBuildOption(playerIndex, "hgn_missiledestroyer1")
              canbuildmissiledestroyer[playerIndexList] = 0
            end  
          end
          
          if (NeededPilots[playerIndexList] < 21) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuildadvdestroyer[playerIndexList] == 0) then  
              Player_RestrictBuildOption(playerIndex, "hgn_advdestroyer")
              Player_UnrestrictBuildOption(playerIndex, "hgn_advdestroyer1")
              Player_RestrictBuildOption(playerIndex, "hgn_artillerydestroyer")
              Player_UnrestrictBuildOption(playerIndex, "hgn_artillerydestroyer1")
              canbuildadvdestroyer[playerIndexList] = 1
            end  
          elseif (NeededPilots[playerIndexList] >= 21) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuildadvdestroyer[playerIndexList] == 1) then  
              Player_UnrestrictBuildOption(playerIndex, "hgn_advdestroyer")
              Player_RestrictBuildOption(playerIndex, "hgn_advdestroyer1")
              Player_UnrestrictBuildOption(playerIndex, "hgn_artillerydestroyer")
              Player_RestrictBuildOption(playerIndex, "hgn_artillerydestroyer1")
              canbuildadvdestroyer[playerIndexList] = 0
            end  
          end
          
          if (NeededPilots[playerIndexList] < 20) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildtanker[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "hgn_tanker")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_tanker1") 
	            canbuildtanker[playerIndexList] = 1
	          end	              
          elseif (NeededPilots[playerIndexList] >= 20) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildtanker[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "hgn_tanker")
	            Player_RestrictBuildOption(playerIndex, "hgn_tanker1")   
	            canbuildtanker[playerIndexList] = 0
	          end	                    
          end
          
          if (NeededPilots[playerIndexList] < 10) or (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") >= 1) or (NeededOfficers[playerIndexList] < 1) then            
            if (canbuildrs[playerIndexList] == 0) then  
	            --SobGroup_RestrictBuildOption("Player_Ships"..playerIndex, "hgn_researchstation")
	            Player_RestrictBuildOption(playerIndex, "hgn_researchstation")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_researchstation1")	            
	            canbuildrs[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) and (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation") == 0) and (NeededOfficers[playerIndexList] >= 1) then                    
            if (canbuildrs[playerIndexList] == 1) then  
	            --SobGroup_UnRestrictBuildOption("Player_Ships"..playerIndex, "hgn_researchstation")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_researchstation")
	            Player_RestrictBuildOption(playerIndex, "hgn_researchstation1")	            
	            canbuildrs[playerIndexList] = 0
	          end  
          end    
          
          if (NeededPilots[playerIndexList] < 10) or (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") >= 1) or (NeededOfficers[playerIndexList] < 1) then            
            if (canbuildps[playerIndexList] == 0) then  	            
	            Player_RestrictBuildOption(playerIndex, "hgn_power")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_power1")
	            canbuildps[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) and (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power") == 0) and (NeededOfficers[playerIndexList] >= 1) then                    
            if (canbuildps[playerIndexList] == 1) then  	            
	            Player_UnrestrictBuildOption(playerIndex, "hgn_power")
	            Player_RestrictBuildOption(playerIndex, "hgn_power1")
	            canbuildps[playerIndexList] = 0
	          end  
          end    
          
          if (NeededPilots[playerIndexList] < 30) or (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase") >= 1) or (NeededOfficers[playerIndexList] < 3) then            
            if (canbuildws[playerIndexList] == 0) then  	            
	            Player_RestrictBuildOption(playerIndex, "hgn_combatbase")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_combatbase1")
	            canbuildws[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase") == 0) and (NeededOfficers[playerIndexList] >= 3) then                    
            if (canbuildws[playerIndexList] == 1) then  	            
	            Player_UnrestrictBuildOption(playerIndex, "hgn_combatbase")
	            Player_RestrictBuildOption(playerIndex, "hgn_combatbase1")
	            canbuildws[playerIndexList] = 0
	          end  
          end    
          
          if (NeededPilots[playerIndexList] < 23) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildcruisera[playerIndexList] == 0) then  
              Player_RestrictBuildOption(playerIndex, "hgn_cruisera")
              Player_UnrestrictBuildOption(playerIndex, "hgn_cruisera1")
              canbuildcruisera[playerIndexList] = 1
            end  
            if (canbuildcruiserb[playerIndexList] == 0) then  
              Player_RestrictBuildOption(playerIndex, "hgn_cruiserb")
              Player_UnrestrictBuildOption(playerIndex, "hgn_cruiserb1")
              canbuildcruiserb[playerIndexList] = 1
            end  
          elseif (NeededPilots[playerIndexList] >= 23) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildcruisera[playerIndexList] == 1) then  
              Player_UnrestrictBuildOption(playerIndex, "hgn_cruisera")
              Player_RestrictBuildOption(playerIndex, "hgn_cruisera1")
              canbuildcruisera[playerIndexList] = 0
            end  
            if (canbuildcruiserb[playerIndexList] == 1) then  
              Player_UnrestrictBuildOption(playerIndex, "hgn_cruiserb")
              Player_RestrictBuildOption(playerIndex, "hgn_cruiserb1")
              canbuildcruiserb[playerIndexList] = 0
            end  
          end
          
          if (NeededPilots[playerIndexList] < 10) or (NeededOfficers[playerIndexList] < 3)  then
            if (canbuildmv[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_minivortex")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_minivortex1")
	            canbuildmv[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildmv[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_minivortex")
	            Player_RestrictBuildOption(playerIndex, "hgn_minivortex1")
	            canbuildmv[playerIndexList] = 0
	          end  
          end
                          
          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 3)  then
            if (canbuildbc[playerIndexList] == 0) then
              Player_RestrictBuildOption(playerIndex, "hgn_battlecarrier")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battlecarrier1")            
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecruiser")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battlecruiser1")
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecruiserNUKE")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battlecruiserNUKE1")
	            canbuildbc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildbc[playerIndexList] == 1) then
              Player_UnrestrictBuildOption(playerIndex, "hgn_battlecarrier")
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecarrier1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battlecruiser")
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecruiser1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battlecruiserNUKE")
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecruiserNUKE1")
	            canbuildbc[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 35) or (NeededOfficers[playerIndexList] < 4)  then
            if (canbuildv[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_vortex")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_vortex1")
	            canbuildv[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 35) and (NeededOfficers[playerIndexList] >= 4) then
            if (canbuildv[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_vortex")
	            Player_RestrictBuildOption(playerIndex, "hgn_vortex1")
	            canbuildv[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 45) or (NeededOfficers[playerIndexList] < 5)  then
            if (canbuildbs[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_battleship")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battleship1")
	            canbuildbs[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 45) and (NeededOfficers[playerIndexList] >= 5) then
            if (canbuildbs[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battleship")
	            Player_RestrictBuildOption(playerIndex, "hgn_battleship1")
	            canbuildbs[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 2)  then
            if (canbuildc[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_carrier")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_carrier1")
	            canbuildc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildc[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "hgn_carrier")
	            Player_RestrictBuildOption(playerIndex, "hgn_carrier1")
	            canbuildc[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 40) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildsy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_shipyard")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_shipyard1")
							Player_RestrictBuildOption(playerIndex, "hgn_shipyard_g")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_shipyard_g1")
	            canbuildsy[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 40) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildsy[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "hgn_shipyard")
	            Player_RestrictBuildOption(playerIndex, "hgn_shipyard1")
							Player_UnrestrictBuildOption(playerIndex, "hgn_shipyard_g")
	            Player_RestrictBuildOption(playerIndex, "hgn_shipyard_g1")
	            canbuildsy[playerIndexList] = 0
	          end  
          end   
          
          if (NeededPilots[playerIndexList] < 60) or (NeededOfficers[playerIndexList] < 6) then
            if (canbuildcf[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "hgn_commandfortress")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_commandfortress1")
	            Player_RestrictBuildOption(playerIndex, "hgn_ark")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ark1")
							Player_RestrictBuildOption(playerIndex, "hgn_battleshipyard")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battleshipyard1")
	            canbuildcf[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 60) and (NeededOfficers[playerIndexList] >= 6) then
            if (canbuildcf[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "hgn_commandfortress")
	            Player_RestrictBuildOption(playerIndex, "hgn_commandfortress1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_ark")
	            Player_RestrictBuildOption(playerIndex, "hgn_ark1")
							Player_UnrestrictBuildOption(playerIndex, "hgn_battleshipyard")
	            Player_RestrictBuildOption(playerIndex, "hgn_battleshipyard1")
	            canbuildcf[playerIndexList] = 0
	          end  
          end   	         

---VAYGR                          
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then

---in base alle ricerche setta il massimo dei piloti          
          if Player_HasResearch(playerIndex, "Crew6" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew5" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew4" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew3" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew2" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd    
          end
					if Player_HasResearch(playerIndex, "Crew1" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd       
          end          
          if Player_HasResearch(playerIndex, "Officer5" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd            
          end
					if Player_HasResearch(playerIndex, "Officer4" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd         
          end
					if Player_HasResearch(playerIndex, "Officer3" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd           
          end
					if Player_HasResearch(playerIndex, "Officer2" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd      
          end
					if Player_HasResearch(playerIndex, "Officer1" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd          
          end          
          Haxor_UnitCapHack(playerIndexList)
          NeededPilots[playerIndexList] = pilotmaxList[playerIndexList] - pilotpopList[playerIndexList]
          NeededOfficers[playerIndexList] = officermaxList[playerIndexList] - officerpopList[playerIndexList] 
          if NeededPilots[playerIndexList] < 0 then
            NeededPilots[playerIndexList] = 0
          end  
          if NeededOfficers[playerIndexList] < 0 then
            NeededOfficers[playerIndexList] = 0
          end        

---blocca sblocca          
          if (NeededPilots[playerIndexList] < 1) then
            if (canbuildgunturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_gun")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_weaponplatform_gun1")
	            Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_lance")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_weaponplatform_lance1")
	            canbuildgunturret[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 1) then
            if (canbuildgunturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "vgr_weaponplatform_gun")
	            Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_gun1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_weaponplatform_lance")
	            Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_lance1")
	            canbuildgunturret[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 2) then
            if (canbuildpulsarturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_missile")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_weaponplatform_missile1")
	            canbuildpulsarturret[playerIndexList] = 1
	          end
	          if (canbuildionturret[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "vgr_hyperspace_platform")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_hyperspace_platform1") 
	            canbuildionturret[playerIndexList] = 1
	          end 
	          if (canbuildcollector[playerIndexList] == 0) then            
	            Player_RestrictBuildOption(playerIndex, "vgr_resourcecollector")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_resourcecollector1")
	            canbuildcollector[playerIndexList] = 1
	          end
	          if (canbuildmultigun[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "vgr_commandcorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandcorvette1")
	            canbuildmultigun[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 2) then
            if (canbuildpulsarturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "vgr_weaponplatform_missile")
	            Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_missile1")
	            canbuildpulsarturret[playerIndexList] = 0
	          end
	          if (canbuildionturret[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_hyperspace_platform")
	            Player_RestrictBuildOption(playerIndex, "vgr_hyperspace_platform1")
	            canbuildionturret[playerIndexList] = 0
	          end
	          if (canbuildcollector[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_resourcecollector")
	            Player_RestrictBuildOption(playerIndex, "vgr_resourcecollector1")
	            canbuildcollector[playerIndexList] = 0
	          end
	          if (canbuildmultigun[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandcorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_commandcorvette1")
	            canbuildmultigun[playerIndexList] = 0
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 3) then
            if (canbuildscout[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_scout")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_scout1")
	            canbuildscout[playerIndexList] = 1
	          end
	          if (canbuildminelayercorvette[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "vgr_minelayercorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_minelayercorvette1")  
	            canbuildminelayercorvette[playerIndexList] = 1
	          end            
          elseif (NeededPilots[playerIndexList] >= 3) then
            if (canbuildscout[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_scout")
	            Player_RestrictBuildOption(playerIndex, "vgr_scout1")
	            canbuildscout[playerIndexList] = 0
	          end
	          if (canbuildminelayercorvette[playerIndexList] == 1) then    
	            Player_UnrestrictBuildOption(playerIndex, "vgr_minelayercorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_minelayercorvette1") 
	            canbuildminelayercorvette[playerIndexList] = 0 
	          end            
          end
          
          if (NeededPilots[playerIndexList] < 4) then
            if (canbuildcontroller[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_resourcecontroller")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_resourcecontroller1")
	            Player_RestrictBuildOption(playerIndex, "vgr_container")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_container1")
							Player_RestrictBuildOption(playerIndex, "vgr_mobile_inhibitor")
							Player_UnrestrictBuildOption(playerIndex, "vgr_mobile_inhibitor1")
							Player_RestrictBuildOption(playerIndex, "vgr_cloakplatform")
							Player_UnrestrictBuildOption(playerIndex, "vgr_cloakplatform1")
	            canbuildcontroller[playerIndexList] = 1
	          end	          
          elseif (NeededPilots[playerIndexList] >= 4) then
            if (canbuildcontroller[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "vgr_resourcecontroller")
	            Player_RestrictBuildOption(playerIndex, "vgr_resourcecontroller1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_container")
	            Player_RestrictBuildOption(playerIndex, "vgr_container1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_mobile_inhibitor")
							Player_RestrictBuildOption(playerIndex, "vgr_mobile_inhibitor1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_cloakplatform")
							Player_RestrictBuildOption(playerIndex, "vgr_cloakplatform1")
	            canbuildcontroller[playerIndexList] = 0
	          end	           
          end
          
          if (NeededPilots[playerIndexList] < 5) then   
            if (canbuildhft[playerIndexList] == 0) then         
	            Player_RestrictBuildOption(playerIndex, "vgr_defender")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_defender1")
	            Player_RestrictBuildOption(playerIndex, "vgr_elitefighter")
							Player_UnrestrictBuildOption(playerIndex, "vgr_elitefighter1") 
	            canbuildhft[playerIndexList] = 1
	          end
	          if (canbuildrailgunfighter[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "vgr_lancefighter")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lancefighter1") 
	            canbuildrailgunfighter[playerIndexList] = 1 
	          end   
	          if (canbuildlbomber[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "vgr_heavyfighter")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_heavyfighter1") 
	            canbuildlbomber[playerIndexList] = 1 
	          end                     
          elseif (NeededPilots[playerIndexList] >= 5) then    
            if (canbuildhft[playerIndexList] == 1) then           
	            Player_UnrestrictBuildOption(playerIndex, "vgr_defender")
	            Player_RestrictBuildOption(playerIndex, "vgr_defender1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_elitefighter")
							Player_RestrictBuildOption(playerIndex, "vgr_elitefighter1")
	            canbuildhft[playerIndexList] = 0
	          end
	          if (canbuildrailgunfighter[playerIndexList] == 1) then     
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lancefighter")
	            Player_RestrictBuildOption(playerIndex, "vgr_lancefighter1")  
	            canbuildrailgunfighter[playerIndexList] = 0 
	          end 
	          if (canbuildlbomber[playerIndexList] == 1) then     
	            Player_UnrestrictBuildOption(playerIndex, "vgr_heavyfighter")
	            Player_RestrictBuildOption(playerIndex, "vgr_heavyfighter1")  
	            canbuildlbomber[playerIndexList] = 0 
	          end                
          end
          
          if (NeededPilots[playerIndexList] < 6) then
            if (canbuildbomber[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "vgr_bomber")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_bomber1")
							Player_RestrictBuildOption(playerIndex, "vgr_missilebomber")
							Player_UnrestrictBuildOption(playerIndex, "vgr_missilebomber1")
	            canbuildbomber[playerIndexList] = 1
	          end
	          if (canbuildtorpedo[playerIndexList] == 0) then          
	            Player_RestrictBuildOption(playerIndex, "vgr_heavymissilefrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_heavymissilefrigate1")
	            canbuildtorpedo[playerIndexList] = 1
	          end
	          if (canbuildflak[playerIndexList] == 0) then          
	            Player_RestrictBuildOption(playerIndex, "vgr_assaultfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_assaultfrigate1")    
	            canbuildflak[playerIndexList] = 1        
	          end  
          elseif (NeededPilots[playerIndexList] >= 6) then
            if (canbuildbomber[playerIndexList] == 1) then                
	            Player_UnrestrictBuildOption(playerIndex, "vgr_bomber")
	            Player_RestrictBuildOption(playerIndex, "vgr_bomber1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_missilebomber")
							Player_RestrictBuildOption(playerIndex, "vgr_missilebomber1")
	            canbuildbomber[playerIndexList] = 0
	          end
	          if (canbuildtorpedo[playerIndexList] == 1) then          
	            Player_UnrestrictBuildOption(playerIndex, "vgr_heavymissilefrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_heavymissilefrigate1")
	            canbuildtorpedo[playerIndexList] = 0
	          end
	          if (canbuildflak[playerIndexList] == 1) then          
	            Player_UnrestrictBuildOption(playerIndex, "vgr_assaultfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_assaultfrigate1")       
	            canbuildflak[playerIndexList] = 0     
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 7) then
            if (canbuildmarine[playerIndexList] == 0) then 
	            Player_RestrictBuildOption(playerIndex, "vgr_infiltratorfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_infiltratorfrigate1")
							Player_RestrictBuildOption(playerIndex, "vgr_supportfrigatearmed")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_supportfrigatearmed1")
							Player_RestrictBuildOption(playerIndex, "vgr_advassaultfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_advassaultfrigate1")    
	            canbuildmarine[playerIndexList] = 1
	          end
	          if (canbuildinterceptor[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "vgr_interceptor")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_interceptor1")   
	            canbuildinterceptor[playerIndexList] = 1      
	          end     
          elseif (NeededPilots[playerIndexList] >= 7) then
            if (canbuildmarine[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "vgr_infiltratorfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_infiltratorfrigate1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_supportfrigatearmed")
	            Player_RestrictBuildOption(playerIndex, "vgr_supportfrigatearmed1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_advassaultfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_advassaultfrigate1")       
	            canbuildmarine[playerIndexList] = 0 
	          end
	          if (canbuildinterceptor[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_interceptor")
	            Player_RestrictBuildOption(playerIndex, "vgr_interceptor1")     
	            canbuildinterceptor[playerIndexList] = 0   
	          end       
          end
          
          if (NeededPilots[playerIndexList] < 8) then
            if (canbuildpulsargunship[playerIndexList] == 0) then 
	            Player_RestrictBuildOption(playerIndex, "vgr_missilecorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_missilecorvette1")
							Player_RestrictBuildOption(playerIndex, "vgr_resourcecontrollerdouble")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_resourcecontrollerdouble1")
							Player_RestrictBuildOption(playerIndex, "vgr_supportfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_supportfrigate1")
							Player_RestrictBuildOption(playerIndex, "vgr_supportfrigate_laser")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_supportfrigate_laser1")
	            canbuildpulsargunship[playerIndexList] = 1
	          end
	          if (canbuildgunship[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "vgr_lasercorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lasercorvette1")
							Player_RestrictBuildOption(playerIndex, "vgr_plasmacorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_plasmacorvette1")
	            canbuildgunship[playerIndexList] = 1
	          end
	          if (canbuildcth[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "vgr_standvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_standvette1")
	            canbuildcth[playerIndexList] = 1
	          end
	          if (canbuildlrms[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "vgr_artilleryfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_artilleryfrigate1")
	            canbuildlrms[playerIndexList] = 1
	          end
	          if (canbuildtulwar[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "vgr_empfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_empfrigate1")
	            Player_RestrictBuildOption(playerIndex, "vgr_commandfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandfrigate1")
	            canbuildtulwar[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 8) then
            if (canbuildpulsargunship[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "vgr_missilecorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_missilecorvette1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_resourcecontrollerdouble")
	            Player_RestrictBuildOption(playerIndex, "vgr_resourcecontrollerdouble1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_supportfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_supportfrigate1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_supportfrigate_laser")
	            Player_RestrictBuildOption(playerIndex, "vgr_supportfrigate_laser1")
	            canbuildpulsargunship[playerIndexList] = 0   
	          end
	          if (canbuildgunship[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lasercorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_lasercorvette1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_plasmacorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_plasmacorvette1")
	            canbuildgunship[playerIndexList] = 0   
	          end
	          if (canbuildcth[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "vgr_standvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_standvette1")
	            canbuildcth[playerIndexList] = 0   
	          end
	          if (canbuildlrms[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "vgr_artilleryfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_artilleryfrigate1")
	            canbuildlrms[playerIndexList] = 0   
	          end
	          if (canbuildtulwar[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "vgr_empfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_empfrigate1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_commandfrigate1")
	            canbuildtulwar[playerIndexList] = 0   
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 9) then
            if (canbuildbomberheavy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_multilancecorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_multilancecorvette1") 
							Player_RestrictBuildOption(playerIndex, "vgr_mortarcorvette")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_mortarcorvette1") 
	            Player_RestrictBuildOption(playerIndex, "vgr_striker")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_striker1") 	
              Player_RestrictBuildOption(playerIndex, "vgr_longrangeartilleryfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_longrangeartilleryfrigate1") 	         							
	            canbuildbomberheavy[playerIndexList] = 1
	          end             
          elseif (NeededPilots[playerIndexList] >= 9) then
            if (canbuildbomberheavy[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_multilancecorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_multilancecorvette1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_mortarcorvette")
	            Player_RestrictBuildOption(playerIndex, "vgr_mortarcorvette1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_striker")
	            Player_RestrictBuildOption(playerIndex, "vgr_striker1")	  
              Player_UnrestrictBuildOption(playerIndex, "vgr_longrangeartilleryfrigate")
	            Player_RestrictBuildOption(playerIndex, "vgr_longrangeartilleryfrigate1")	           							
	            canbuildbomberheavy[playerIndexList] = 0   
	          end              
          end
          
          if (NeededPilots[playerIndexList] < 12) then
            if (canbuildhs[playerIndexList] == 0) then	            
	            Player_RestrictBuildOption(playerIndex, "vgr_am")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_am1")
	            canbuildhs[playerIndexList] = 1
	          end             
          elseif (NeededPilots[playerIndexList] >= 12) then
            if (canbuildhs[playerIndexList] == 1) then  	            
	            Player_UnrestrictBuildOption(playerIndex, "vgr_am")
	            Player_RestrictBuildOption(playerIndex, "vgr_am1")
	            canbuildhs[playerIndexList] = 0   
	          end              
          end
          
          if (NeededPilots[playerIndexList] < 15) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuilddestroyer[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_destroyer")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_destroyer1")	 
              Player_RestrictBuildOption(playerIndex, "vgr_pulsedestroyer")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_pulsedestroyer1")	         							
	            Player_RestrictBuildOption(playerIndex, "vgr_scaver")
							Player_UnrestrictBuildOption(playerIndex, "vgr_scaver1")	
	            canbuilddestroyer[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 15) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuilddestroyer[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_destroyer")
	            Player_RestrictBuildOption(playerIndex, "vgr_destroyer1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_pulsedestroyer")
	            Player_RestrictBuildOption(playerIndex, "vgr_pulsedestroyer1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_scaver")
							Player_RestrictBuildOption(playerIndex, "vgr_scaver1")
	            canbuilddestroyer[playerIndexList] = 0   
	          end  
          end    
          
          if (NeededPilots[playerIndexList] < 20) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildv[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_cruiser")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_cruiser1")
							Player_RestrictBuildOption(playerIndex, "vgr_lightcruiser")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lightcruiser1")
	            Player_RestrictBuildOption(playerIndex, "vgr_lightcruiser_gun")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lightcruiser_gun1")
	            Player_RestrictBuildOption(playerIndex, "vgr_sinner")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_sinner1")
							Player_RestrictBuildOption(playerIndex, "vgr_artilleryship")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_artilleryship1")
	            canbuildv[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 20) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildv[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_cruiser")
	            Player_RestrictBuildOption(playerIndex, "vgr_cruiser1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_lightcruiser")
	            Player_RestrictBuildOption(playerIndex, "vgr_lightcruiser1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_lightcruiser_gun")
	            Player_RestrictBuildOption(playerIndex, "vgr_lightcruiser_gun1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_sinner")
	            Player_RestrictBuildOption(playerIndex, "vgr_sinner1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_artilleryship")
	            Player_RestrictBuildOption(playerIndex, "vgr_artilleryship1")
	            canbuildv[playerIndexList] = 0   
	          end  
          end    

          if (NeededPilots[playerIndexList] < 10) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuildkp[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "vgr_hammerhead")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_hammerhead1")
	            canbuildkp[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuildkp[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_hammerhead")
	            Player_RestrictBuildOption(playerIndex, "vgr_hammerhead1")
	            canbuildkp[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildbc[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "vgr_battlecruiser")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battlecruiser1")
	            Player_RestrictBuildOption(playerIndex, "vgr_battlecruiser_hero")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battlecruiser_hero1")
	            Player_RestrictBuildOption(playerIndex, "vgr_missilebattlecruiser")
							Player_UnrestrictBuildOption(playerIndex, "vgr_missilebattlecruiser1")
	            Player_RestrictBuildOption(playerIndex, "vgr_heavycruiser")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_heavycruiser1")
	            canbuildbc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildbc[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battlecruiser")
	            Player_RestrictBuildOption(playerIndex, "vgr_battlecruiser1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battlecruiser_hero")
	            Player_RestrictBuildOption(playerIndex, "vgr_battlecruiser_hero1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_missilebattlecruiser")
							Player_RestrictBuildOption(playerIndex, "vgr_missilebattlecruiser1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_heavycruiser")
	            Player_RestrictBuildOption(playerIndex, "vgr_heavycruiser1")
	            canbuildbc[playerIndexList] = 0   
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildc[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_carrier")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_carrier1")
							Player_RestrictBuildOption(playerIndex, "vgr_battlecarrier")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battlecarrier1")
	            canbuildc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildc[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_carrier")
	            Player_RestrictBuildOption(playerIndex, "vgr_carrier1")
							Player_UnrestrictBuildOption(playerIndex, "vgr_battlecarrier")
	            Player_RestrictBuildOption(playerIndex, "vgr_battlecarrier1")
	            canbuildc[playerIndexList] = 0   
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 35) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildbs[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "vgr_alkhalid")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_alkhalid1")
	            canbuildbs[playerIndexList] = 1
	          end  
	          if (canbuilddreadnaught[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "vgr_dreadnaught")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_dreadnaught1")
	            Player_RestrictBuildOption(playerIndex, "vgr_dreadnaughtB")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_dreadnaughtB1")
	            Player_RestrictBuildOption(playerIndex, "vgr_battleship")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battleship1")
	            canbuilddreadnaught[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 35) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildbs[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_alkhalid")
	            Player_RestrictBuildOption(playerIndex, "vgr_alkhalid1")
	            canbuildbs[playerIndexList] = 0   
	          end  
	          if (canbuilddreadnaught[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_dreadnaught")
	            Player_RestrictBuildOption(playerIndex, "vgr_dreadnaught1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_dreadnaughtB")
	            Player_RestrictBuildOption(playerIndex, "vgr_dreadnaughtB1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battleship")
	            Player_RestrictBuildOption(playerIndex, "vgr_battleship1")
	            canbuilddreadnaught[playerIndexList] = 0   
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 40) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildsy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_shipyard")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_shipyard1")
	            Player_RestrictBuildOption(playerIndex, "vgr_missledreadnaught")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_missledreadnaught1")
	            canbuildsy[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 40) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildsy[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "vgr_shipyard")
	            Player_RestrictBuildOption(playerIndex, "vgr_shipyard1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_missledreadnaught")
	            Player_RestrictBuildOption(playerIndex, "vgr_missledreadnaught1")
	            canbuildsy[playerIndexList] = 0   
	          end  
          end    
          
          if (NeededPilots[playerIndexList] < 50) or (NeededOfficers[playerIndexList] < 6) then
            if (canbuildcf[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_commandfortress")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandfortress1")
	            Player_RestrictBuildOption(playerIndex, "vgr_superbattleship")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_superbattleship1")
	            canbuildcf[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 50) and (NeededOfficers[playerIndexList] >= 6) then
            if (canbuildcf[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandfortress")
	            Player_RestrictBuildOption(playerIndex, "vgr_commandfortress1")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_superbattleship")
	            Player_RestrictBuildOption(playerIndex, "vgr_superbattleship1")
	            canbuildcf[playerIndexList] = 0
	          end  
          end 
          
          
---KADESHI                          
        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then

---set max pilot list according to research
          if Player_HasResearch(playerIndex, "Crew6" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew5" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew4" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew3" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew2" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd    
          end
					if Player_HasResearch(playerIndex, "Crew1" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd       
          end          
          if Player_HasResearch(playerIndex, "Officer5" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd            
          end
					if Player_HasResearch(playerIndex, "Officer4" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd         
          end
					if Player_HasResearch(playerIndex, "Officer3" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd           
          end
					if Player_HasResearch(playerIndex, "Officer2" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd      
          end
					if Player_HasResearch(playerIndex, "Officer1" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd          
          end          
          Haxor_UnitCapHack(playerIndexList)
          NeededPilots[playerIndexList] = pilotmaxList[playerIndexList] - pilotpopList[playerIndexList]
          NeededOfficers[playerIndexList] = officermaxList[playerIndexList] - officerpopList[playerIndexList] 
          if NeededPilots[playerIndexList] < 0 then
            NeededPilots[playerIndexList] = 0
          end  
          if NeededOfficers[playerIndexList] < 0 then
            NeededOfficers[playerIndexList] = 0
          end

					if (NeededPilots[playerIndexList] < 2) then
            if (canbuildpulsarturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kad_prayerpod")
	            Player_UnrestrictBuildOption(playerIndex, "kad_prayerpod1")
	            canbuildpulsarturret[playerIndexList] = 1
	          end
	          if (canbuildionturret[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "kad_sensorpod")
	            Player_UnrestrictBuildOption(playerIndex, "kad_sensorpod1") 
	            canbuildionturret[playerIndexList] = 1
	          end 
	          if (canbuildcollector[playerIndexList] == 0) then            
	            Player_RestrictBuildOption(playerIndex, "kad_ressourcecollector")
	            Player_UnrestrictBuildOption(playerIndex, "kad_ressourcecollector1")
	            canbuildcollector[playerIndexList] = 1
	          end
	          if (canbuildmultigun[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "kad_nebuladrone")
	            Player_UnrestrictBuildOption(playerIndex, "kad_nebuladrone1")
	            canbuildmultigun[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 2) then
            if (canbuildpulsarturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "kad_prayerpod")
	            Player_RestrictBuildOption(playerIndex, "kad_prayerpod1")
	            canbuildpulsarturret[playerIndexList] = 0
	          end
	          if (canbuildionturret[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_sensorpod")
	            Player_RestrictBuildOption(playerIndex, "kad_sensorpod1")
	            canbuildionturret[playerIndexList] = 0
	          end
	          if (canbuildcollector[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_ressourcecollector")
	            Player_RestrictBuildOption(playerIndex, "kad_ressourcecollector1")
	            canbuildcollector[playerIndexList] = 0
	          end
	          if (canbuildmultigun[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_nebuladrone")
	            Player_RestrictBuildOption(playerIndex, "kad_nebuladrone1")
	            canbuildmultigun[playerIndexList] = 0
	          end  
          end

          if (NeededPilots[playerIndexList] < 4) then
            if (canbuildcontroller[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kad_container")
	            Player_UnrestrictBuildOption(playerIndex, "kad_container1")
	            Player_RestrictBuildOption(playerIndex, "kad_snail")
	            Player_UnrestrictBuildOption(playerIndex, "kad_snail1")
	            canbuildcontroller[playerIndexList] = 1
	          end	          
          elseif (NeededPilots[playerIndexList] >= 4) then
            if (canbuildcontroller[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "kad_container")
	            Player_RestrictBuildOption(playerIndex, "kad_container1")
	            Player_UnrestrictBuildOption(playerIndex, "kad_snail")
	            Player_RestrictBuildOption(playerIndex, "kad_snail1")
	            canbuildcontroller[playerIndexList] = 0
	          end	           
          end

          if (NeededPilots[playerIndexList] < 6) then
            if (canbuildbomber[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "kad_advancedswarmer_old")
	            Player_UnrestrictBuildOption(playerIndex, "kad_advancedswarmer_old1")
							Player_RestrictBuildOption(playerIndex, "kad_swarmer_ghost")
							Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_ghost1")
	            canbuildbomber[playerIndexList] = 1
	          end
	          if (canbuildtorpedo[playerIndexList] == 0) then          
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_hybrid")
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_hybrid1")
	            canbuildtorpedo[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 6) then
            if (canbuildbomber[playerIndexList] == 1) then                
	            Player_UnrestrictBuildOption(playerIndex, "kad_advancedswarmer_old")
	            Player_RestrictBuildOption(playerIndex, "kad_advancedswarmer_old1")
							Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_ghost")
							Player_RestrictBuildOption(playerIndex, "kad_swarmer_ghost1")
	            canbuildbomber[playerIndexList] = 0
	          end
	          if (canbuildtorpedo[playerIndexList] == 1) then          
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_hybrid")
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_hybrid1")
	            canbuildtorpedo[playerIndexList] = 0
	          end
          end

          if (NeededPilots[playerIndexList] < 7) then
            if (canbuildmarine[playerIndexList] == 0) then 
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_crusader")
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_crusader1")
							Player_RestrictBuildOption(playerIndex, "kad_swarmer_zealot")
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_zealot1")   
	            canbuildmarine[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 7) then
            if (canbuildmarine[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_crusader")
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_crusader1")
							Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_zealot")
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_zealot1")     
	            canbuildmarine[playerIndexList] = 0 
	          end
          end

          if (NeededPilots[playerIndexList] < 8) then
            if (canbuildpulsargunship[playerIndexList] == 0) then 
	            Player_RestrictBuildOption(playerIndex, "kad_frig_ghost")
	            Player_UnrestrictBuildOption(playerIndex, "kad_frig_ghost1")
							Player_RestrictBuildOption(playerIndex, "kad_multibeam")
	            Player_UnrestrictBuildOption(playerIndex, "kad_multibeam1")
							Player_RestrictBuildOption(playerIndex, "kad_multibeam_new")
	            Player_UnrestrictBuildOption(playerIndex, "kad_multibeam_new1")
							Player_RestrictBuildOption(playerIndex, "kad_multigun")
	            Player_UnrestrictBuildOption(playerIndex, "kad_multigun1")
	            canbuildpulsargunship[playerIndexList] = 1
	          end
	          if (canbuildgunship[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "kad_podship")
	            Player_UnrestrictBuildOption(playerIndex, "kad_podship1")
	            canbuildgunship[playerIndexList] = 1
	          end
	          if (canbuildcth[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "kad_advancedswarmer")
	            Player_UnrestrictBuildOption(playerIndex, "kad_advancedswarmer1")
	            canbuildcth[playerIndexList] = 1
	          end
	          if (canbuildlrms[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "kad_gunpod")
	            Player_UnrestrictBuildOption(playerIndex, "kad_gunpod1")
	            canbuildlrms[playerIndexList] = 1
	          end
	          if (canbuildtulwar[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "kad_ionpod")
	            Player_UnrestrictBuildOption(playerIndex, "kad_ionpod1")
	            Player_RestrictBuildOption(playerIndex, "kad_pod_ghost")
	            Player_UnrestrictBuildOption(playerIndex, "kad_pod_ghost1")
	            canbuildtulwar[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 8) then
            if (canbuildpulsargunship[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "kad_frig_ghost")
	            Player_RestrictBuildOption(playerIndex, "kad_frig_ghost1")
							Player_UnrestrictBuildOption(playerIndex, "kad_multibeam")
	            Player_RestrictBuildOption(playerIndex, "kad_multibeam1")
							Player_UnrestrictBuildOption(playerIndex, "kad_multibeam_new")
	            Player_RestrictBuildOption(playerIndex, "kad_multibeam_new1")
							Player_UnrestrictBuildOption(playerIndex, "kad_multigun")
	            Player_RestrictBuildOption(playerIndex, "kad_multigun1")
	            canbuildpulsargunship[playerIndexList] = 0   
	          end
	          if (canbuildgunship[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kad_podship")
	            Player_RestrictBuildOption(playerIndex, "kad_podship1")
	            canbuildgunship[playerIndexList] = 0   
	          end
	          if (canbuildcth[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kad_advancedswarmer")
	            Player_RestrictBuildOption(playerIndex, "kad_advancedswarmer1")
	            canbuildcth[playerIndexList] = 0   
	          end
	          if (canbuildlrms[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kad_gunpod")
	            Player_RestrictBuildOption(playerIndex, "kad_gunpod1")
	            canbuildlrms[playerIndexList] = 0   
	          end
	          if (canbuildtulwar[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kad_ionpod")
	            Player_RestrictBuildOption(playerIndex, "kad_ionpod1")
	            Player_UnrestrictBuildOption(playerIndex, "kad_pod_ghost")
	            Player_RestrictBuildOption(playerIndex, "kad_pod_ghost1")
	            canbuildtulwar[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 9) then
            if (canbuildbomberheavy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kad_heavyswarmer_new")
	            Player_UnrestrictBuildOption(playerIndex, "kad_heavyswarmer_new1") 
							Player_RestrictBuildOption(playerIndex, "kad_pulsarswarmer")
	            Player_UnrestrictBuildOption(playerIndex, "kad_pulsarswarmer1") 
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_new")
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_new1") 	  							
	            canbuildbomberheavy[playerIndexList] = 1
	          end             
          elseif (NeededPilots[playerIndexList] >= 9) then
            if (canbuildbomberheavy[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_heavyswarmer_new")
	            Player_RestrictBuildOption(playerIndex, "kad_heavyswarmer_new1")
							Player_UnrestrictBuildOption(playerIndex, "kad_pulsarswarmer")
	            Player_RestrictBuildOption(playerIndex, "kad_pulsarswarmer1")
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_new")
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_new1")	           							
	            canbuildbomberheavy[playerIndexList] = 0   
	          end              
          end

          if (NeededPilots[playerIndexList] < 10) then
            if (canbuildkp[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "kad_missilepod")
	            Player_UnrestrictBuildOption(playerIndex, "kad_missilepod1")
	            canbuildkp[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) then
            if (canbuildkp[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_missilepod")
	            Player_RestrictBuildOption(playerIndex, "kad_missilepod1")
	            canbuildkp[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 25) then
            if (canbuildhs[playerIndexList] == 0) then	            
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_blood")
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_blood1")
	            canbuildhs[playerIndexList] = 1
	          end             
          elseif (NeededPilots[playerIndexList] >= 25) then
            if (canbuildhs[playerIndexList] == 1) then  	            
	            Player_UnrestrictBuildOption(playerIndex, "kad_swarmer_blood")
	            Player_RestrictBuildOption(playerIndex, "kad_swarmer_blood1")
	            canbuildhs[playerIndexList] = 0   
	          end              
          end

          if (NeededPilots[playerIndexList] < 20) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildv[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kad_destroyer_real")
	            Player_UnrestrictBuildOption(playerIndex, "kad_destroyer_real1")
	            Player_RestrictBuildOption(playerIndex, "kad_custodian")
	            Player_UnrestrictBuildOption(playerIndex, "kad_custodian1")
	            canbuildv[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 20) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildv[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_destroyer_real")
	            Player_RestrictBuildOption(playerIndex, "kad_destroyer_real1")
	            Player_UnrestrictBuildOption(playerIndex, "kad_custodian")
	            Player_RestrictBuildOption(playerIndex, "kad_custodian1")
	            canbuildv[playerIndexList] = 0   
	          end  
          end    

          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildbc[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "kad_destroyer")
	            Player_UnrestrictBuildOption(playerIndex, "kad_destroyer1")
	            canbuildbc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildbc[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_destroyer")
	            Player_RestrictBuildOption(playerIndex, "kad_destroyer1")
	            canbuildbc[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 50) or (NeededOfficers[playerIndexList] < 6) then
            if (canbuildcf[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kad_needleship")
	            Player_UnrestrictBuildOption(playerIndex, "kad_needleship1")
	            canbuildcf[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 50) and (NeededOfficers[playerIndexList] >= 6) then
            if (canbuildcf[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kad_needleship")
	            Player_RestrictBuildOption(playerIndex, "kad_needleship1")
	            canbuildcf[playerIndexList] = 0
	          end  
          end 

---RAIDER                          
        elseif ( Player_GetRace(playerIndex) == Race_Raider ) then

---set max pilot list according to research
          if Player_HasResearch(playerIndex, "Crew6" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew5" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew4" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew3" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew2" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd    
          end
					if Player_HasResearch(playerIndex, "Crew1" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd       
          end          
          if Player_HasResearch(playerIndex, "Officer5" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd            
          end
					if Player_HasResearch(playerIndex, "Officer4" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd         
          end
					if Player_HasResearch(playerIndex, "Officer3" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd           
          end
					if Player_HasResearch(playerIndex, "Officer2" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd      
          end
					if Player_HasResearch(playerIndex, "Officer1" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd          
          end          
          Haxor_UnitCapHack(playerIndexList)
          NeededPilots[playerIndexList] = pilotmaxList[playerIndexList] - pilotpopList[playerIndexList]
          NeededOfficers[playerIndexList] = officermaxList[playerIndexList] - officerpopList[playerIndexList] 
          if NeededPilots[playerIndexList] < 0 then
            NeededPilots[playerIndexList] = 0
          end  
          if NeededOfficers[playerIndexList] < 0 then
            NeededOfficers[playerIndexList] = 0
          end

          if (NeededPilots[playerIndexList] < 1) then
            if (canbuildgunturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_explotrap")
	            Player_UnrestrictBuildOption(playerIndex, "rad_explotrap1")
	            canbuildgunturret[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 1) then
            if (canbuildgunturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "rad_explotrap")
	            Player_RestrictBuildOption(playerIndex, "rad_explotrap1")
	            canbuildgunturret[playerIndexList] = 0
	          end  
          end

          if (NeededPilots[playerIndexList] < 2) then
            if (canbuildpulsarturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_gravwel")
	            Player_UnrestrictBuildOption(playerIndex, "rad_gravwel1")
	            Player_RestrictBuildOption(playerIndex, "rad_guntrap")
	            Player_UnrestrictBuildOption(playerIndex, "rad_guntrap1")
	            canbuildpulsarturret[playerIndexList] = 1
	          end
	          if (canbuildionturret[playerIndexList] == 0) then  
	            Player_RestrictBuildOption(playerIndex, "rad_hsbouey")
	            Player_UnrestrictBuildOption(playerIndex, "rad_hsbouey1") 
	            canbuildionturret[playerIndexList] = 1
	          end 
	          if (canbuildcollector[playerIndexList] == 0) then            
	            Player_RestrictBuildOption(playerIndex, "rad_resourcecollector")
	            Player_UnrestrictBuildOption(playerIndex, "rad_resourcecollector1")
	            canbuildcollector[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 2) then
            if (canbuildpulsarturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "rad_gravwel")
	            Player_RestrictBuildOption(playerIndex, "rad_gravwel1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_guntrap")
	            Player_RestrictBuildOption(playerIndex, "rad_guntrap1")
	            canbuildpulsarturret[playerIndexList] = 0
	          end
	          if (canbuildionturret[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_hsbouey")
	            Player_RestrictBuildOption(playerIndex, "rad_hsbouey1")
	            canbuildionturret[playerIndexList] = 0
	          end
	          if (canbuildcollector[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_resourcecollector")
	            Player_RestrictBuildOption(playerIndex, "rad_resourcecollector1")
	            canbuildcollector[playerIndexList] = 0
	          end
          end

          if (NeededPilots[playerIndexList] < 3) then
            if (canbuildscout[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_guncorvette")
	            Player_UnrestrictBuildOption(playerIndex, "rad_guncorvette1")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_scout")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_scout1")
	            canbuildscout[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 3) then
            if (canbuildscout[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_guncorvette")
	            Player_RestrictBuildOption(playerIndex, "rad_guncorvette1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_scout")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_scout1")
	            canbuildscout[playerIndexList] = 0
	          end        
          end

          if (NeededPilots[playerIndexList] < 4) then
            if (canbuildcontroller[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_container")
	            Player_UnrestrictBuildOption(playerIndex, "rad_container1")
	            canbuildcontroller[playerIndexList] = 1
	          end	          
          elseif (NeededPilots[playerIndexList] >= 4) then
            if (canbuildcontroller[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "rad_container")
	            Player_RestrictBuildOption(playerIndex, "rad_container1")
	            canbuildcontroller[playerIndexList] = 0
	          end	           
          end

          if (NeededPilots[playerIndexList] < 6) then
            if (canbuildbomber[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "rad_bomber")
	            Player_UnrestrictBuildOption(playerIndex, "rad_bomber1")
							Player_RestrictBuildOption(playerIndex, "rad_elitefighter")
							Player_UnrestrictBuildOption(playerIndex, "rad_elitefighter1")
	            Player_RestrictBuildOption(playerIndex, "rad_fencer")
	            Player_UnrestrictBuildOption(playerIndex, "rad_fencer1")
							Player_RestrictBuildOption(playerIndex, "rad_interceptor")
							Player_UnrestrictBuildOption(playerIndex, "rad_interceptor1")
	            canbuildbomber[playerIndexList] = 1
	          end
	          if (canbuildtorpedo[playerIndexList] == 0) then          
	            Player_RestrictBuildOption(playerIndex, "rad_interceptor_black")
	            Player_UnrestrictBuildOption(playerIndex, "rad_interceptor_black1")
	            Player_RestrictBuildOption(playerIndex, "rad_jackal")
	            Player_UnrestrictBuildOption(playerIndex, "rad_jackal1")
	            canbuildtorpedo[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 6) then
            if (canbuildbomber[playerIndexList] == 1) then                
	            Player_UnrestrictBuildOption(playerIndex, "rad_bomber")
	            Player_RestrictBuildOption(playerIndex, "rad_bomber1")
							Player_UnrestrictBuildOption(playerIndex, "rad_elitefighter")
							Player_RestrictBuildOption(playerIndex, "rad_elitefighter1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_fencer")
	            Player_RestrictBuildOption(playerIndex, "rad_fencer1")
							Player_UnrestrictBuildOption(playerIndex, "rad_interceptor")
							Player_RestrictBuildOption(playerIndex, "rad_interceptor1")
	            canbuildbomber[playerIndexList] = 0
	          end
	          if (canbuildtorpedo[playerIndexList] == 1) then          
	            Player_UnrestrictBuildOption(playerIndex, "rad_interceptor_black")
	            Player_RestrictBuildOption(playerIndex, "rad_interceptor_black1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_jackal")
	            Player_RestrictBuildOption(playerIndex, "rad_jackal1")
	            canbuildtorpedo[playerIndexList] = 0
	          end
          end

          if (NeededPilots[playerIndexList] < 7) then
	          if (canbuildinterceptor[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "rad_merc_fighter")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_fighter1")   
	            Player_RestrictBuildOption(playerIndex, "rad_merc_interceptor")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_interceptor1")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_bomber")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_bomber1")
	            canbuildinterceptor[playerIndexList] = 1      
	          end     
          elseif (NeededPilots[playerIndexList] >= 7) then
	          if (canbuildinterceptor[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_fighter")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_fighter1")     
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_interceptor")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_interceptor1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_bomber")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_bomber1")
	            canbuildinterceptor[playerIndexList] = 0   
	          end       
          end

          if (NeededPilots[playerIndexList] < 8) then
            if (canbuildpulsargunship[playerIndexList] == 0) then 
	            Player_RestrictBuildOption(playerIndex, "rad_beamfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "rad_beamfrigate1")
							Player_RestrictBuildOption(playerIndex, "rad_gattlingfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "rad_gattlingfrigate1")
							Player_RestrictBuildOption(playerIndex, "rad_gunfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "rad_gunfrigate1")
							Player_RestrictBuildOption(playerIndex, "rad_gunfrigate_morgan")
	            Player_UnrestrictBuildOption(playerIndex, "rad_gunfrigate_morgan1")
	            canbuildpulsargunship[playerIndexList] = 1
	          end
	          if (canbuildgunship[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "rad_merc_corvette")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_corvette1")
							Player_RestrictBuildOption(playerIndex, "rad_missilecorvette")
	            Player_UnrestrictBuildOption(playerIndex, "rad_missilecorvette1")
	            Player_RestrictBuildOption(playerIndex, "rad_empcorvette")
	            Player_UnrestrictBuildOption(playerIndex, "rad_empcorvette1")
	            canbuildgunship[playerIndexList] = 1
	          end
	          if (canbuildlrms[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "rad_resourcecontroller")
	            Player_UnrestrictBuildOption(playerIndex, "rad_resourcecontroller1")
	            canbuildlrms[playerIndexList] = 1
	          end
	          if (canbuildtulwar[playerIndexList] == 0) then   
	            Player_RestrictBuildOption(playerIndex, "rad_merc_frigate")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_frigate1")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_frigateadv")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_frigateadv1")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_ioncannonfrigate")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_ioncannonfrigate1")
	            Player_RestrictBuildOption(playerIndex, "rad_missilefrigate")
	            Player_UnrestrictBuildOption(playerIndex, "rad_missilefrigate1")
	            canbuildtulwar[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 8) then
            if (canbuildpulsargunship[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "rad_beamfrigate")
	            Player_RestrictBuildOption(playerIndex, "rad_beamfrigate1")
							Player_UnrestrictBuildOption(playerIndex, "rad_gattlingfrigate")
	            Player_RestrictBuildOption(playerIndex, "rad_gattlingfrigate1")
							Player_UnrestrictBuildOption(playerIndex, "rad_gunfrigate")
	            Player_RestrictBuildOption(playerIndex, "rad_gunfrigate1")
							Player_UnrestrictBuildOption(playerIndex, "rad_gunfrigate_morgan")
	            Player_RestrictBuildOption(playerIndex, "rad_gunfrigate_morgan1")
	            canbuildpulsargunship[playerIndexList] = 0   
	          end
	          if (canbuildgunship[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_corvette")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_corvette1")
							Player_UnrestrictBuildOption(playerIndex, "rad_missilecorvette")
	            Player_RestrictBuildOption(playerIndex, "rad_missilecorvette1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_empcorvette")
	            Player_RestrictBuildOption(playerIndex, "rad_empcorvette1")
	            canbuildgunship[playerIndexList] = 0   
	          end
	          if (canbuildlrms[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "rad_resourcecontroller")
	            Player_RestrictBuildOption(playerIndex, "rad_resourcecontroller1")
	            canbuildlrms[playerIndexList] = 0   
	          end
	          if (canbuildtulwar[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_frigate")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_frigate1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_frigateadv")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_frigateadv1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_ioncannonfrigate")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_ioncannonfrigate1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_missilefrigate")
	            Player_RestrictBuildOption(playerIndex, "rad_missilefrigate1")
	            canbuildtulwar[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 9) then
            if (canbuildbomberheavy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_scoutcorvette")
	            Player_UnrestrictBuildOption(playerIndex, "rad_scoutcorvette1")      							
	            canbuildbomberheavy[playerIndexList] = 1
	          end             
          elseif (NeededPilots[playerIndexList] >= 9) then
            if (canbuildbomberheavy[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_scoutcorvette")
	            Player_RestrictBuildOption(playerIndex, "rad_scoutcorvette1")        							
	            canbuildbomberheavy[playerIndexList] = 0   
	          end              
          end

          if (NeededPilots[playerIndexList] < 10) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuildkp[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "rad_destroyerscaffolda")
	            Player_UnrestrictBuildOption(playerIndex, "rad_destroyerscaffolda1")
	            canbuildkp[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuildkp[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_destroyerscaffolda")
	            Player_RestrictBuildOption(playerIndex, "rad_destroyerscaffolda1")
	            canbuildkp[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildc[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_scaffolda")
	            Player_UnrestrictBuildOption(playerIndex, "rad_scaffolda1")
							Player_RestrictBuildOption(playerIndex, "rad_scaffoldB")
	            Player_UnrestrictBuildOption(playerIndex, "rad_scaffoldB1")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_cruiser")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_cruiser1")
	            Player_RestrictBuildOption(playerIndex, "rad_refurbisheddestroyer")
	            Player_UnrestrictBuildOption(playerIndex, "rad_refurbisheddestroyer1")
	            canbuildc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildc[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_scaffolda")
	            Player_RestrictBuildOption(playerIndex, "rad_scaffolda1")
							Player_UnrestrictBuildOption(playerIndex, "rad_scaffoldB")
	            Player_RestrictBuildOption(playerIndex, "rad_scaffoldB1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_cruiser")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_cruiser1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_refurbisheddestroyer")
	            Player_RestrictBuildOption(playerIndex, "rad_refurbisheddestroyer1")
	            canbuildc[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildbc[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "rad_helios")
	            Player_UnrestrictBuildOption(playerIndex, "rad_helios1")
	            Player_RestrictBuildOption(playerIndex, "rad_scudscaffolda")
	            Player_UnrestrictBuildOption(playerIndex, "rad_scudscaffolda1")
	            canbuildbc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildbc[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_helios")
	            Player_RestrictBuildOption(playerIndex, "rad_helios1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_scudscaffolda")
	            Player_RestrictBuildOption(playerIndex, "rad_scudscaffolda1")
	            canbuildbc[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 35) or (NeededOfficers[playerIndexList] < 3) then
	          if (canbuilddreadnaught[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "rad_cruiserscaffolda")
	            Player_UnrestrictBuildOption(playerIndex, "rad_cruiserscaffolda1")
	            Player_RestrictBuildOption(playerIndex, "rad_cruiser_queenscaffolda")
	            Player_UnrestrictBuildOption(playerIndex, "rad_cruiser_queenscaffolda1")
	            Player_RestrictBuildOption(playerIndex, "rad_vanaarjet")
	            Player_UnrestrictBuildOption(playerIndex, "rad_vanaarjet1")
	            Player_RestrictBuildOption(playerIndex, "rad_qwaarjetii")
	            Player_UnrestrictBuildOption(playerIndex, "rad_qwaarjetii1")
	            Player_RestrictBuildOption(playerIndex, "rad_armsdealer")
	            Player_UnrestrictBuildOption(playerIndex, "rad_armsdealer1")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_battlecruiser")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_battlecruiser1")
	            canbuilddreadnaught[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 35) and (NeededOfficers[playerIndexList] >= 3) then
	          if (canbuilddreadnaught[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_cruiserscaffolda")
	            Player_RestrictBuildOption(playerIndex, "rad_cruiserscaffolda1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_cruiser_queenscaffolda")
	            Player_RestrictBuildOption(playerIndex, "rad_cruiser_queenscaffolda1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_vanaarjet")
	            Player_RestrictBuildOption(playerIndex, "rad_vanaarjet1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_qwaarjetii")
	            Player_RestrictBuildOption(playerIndex, "rad_qwaarjetii1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_armsdealer")
	            Player_RestrictBuildOption(playerIndex, "rad_armsdealer1")
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_battlecruiser")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_battlecruiser1")
	            canbuilddreadnaught[playerIndexList] = 0   
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 60) or (NeededOfficers[playerIndexList] < 6) then
            if (canbuildcf[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "rad_blackmarket")
	            Player_UnrestrictBuildOption(playerIndex, "rad_blackmarket1")
	            canbuildcf[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 60) and (NeededOfficers[playerIndexList] >= 6) then
            if (canbuildcf[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "rad_blackmarket")
	            Player_RestrictBuildOption(playerIndex, "rad_blackmarket1")
	            canbuildcf[playerIndexList] = 0
	          end  
          end   	

---KEEPER
        elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then

---set max pilot list according to research
          if Player_HasResearch(playerIndex, "Crew6" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew5" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd           
          end
					if Player_HasResearch(playerIndex, "Crew4" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew3" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd     
          end
					if Player_HasResearch(playerIndex, "Crew2" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd    
          end
					if Player_HasResearch(playerIndex, "Crew1" ) == 1 then
            pilotmaxList[playerIndexList] = pilotmaxList[playerIndexList] + pilottoadd       
          end          
          if Player_HasResearch(playerIndex, "Officer5" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd            
          end
					if Player_HasResearch(playerIndex, "Officer4" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd         
          end
					if Player_HasResearch(playerIndex, "Officer3" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd           
          end
					if Player_HasResearch(playerIndex, "Officer2" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd      
          end
					if Player_HasResearch(playerIndex, "Officer1" ) == 1 then
            officermaxList[playerIndexList] = officermaxList[playerIndexList] + officertoadd          
          end          
          Haxor_UnitCapHack(playerIndexList)
          NeededPilots[playerIndexList] = pilotmaxList[playerIndexList] - pilotpopList[playerIndexList]
          NeededOfficers[playerIndexList] = officermaxList[playerIndexList] - officerpopList[playerIndexList] 
          if NeededPilots[playerIndexList] < 0 then
            NeededPilots[playerIndexList] = 0
          end  
          if NeededOfficers[playerIndexList] < 0 then
            NeededOfficers[playerIndexList] = 0
          end

          if (NeededPilots[playerIndexList] < 1) then
            if (canbuildgunturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "Kpr_AttackDroid")
	            Player_UnrestrictBuildOption(playerIndex, "Kpr_AttackDroid1")
	            Player_RestrictBuildOption(playerIndex, "kpr_interceptor_old")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_interceptor_old1")
	            Player_RestrictBuildOption(playerIndex, "kpr_meddler")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_meddler1")
	            canbuildgunturret[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 1) then
            if (canbuildgunturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "Kpr_AttackDroid")
	            Player_RestrictBuildOption(playerIndex, "Kpr_AttackDroid1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_interceptor_old")
	            Player_RestrictBuildOption(playerIndex, "kpr_interceptor_old1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_meddler")
	            Player_RestrictBuildOption(playerIndex, "kpr_meddler1")
	            canbuildgunturret[playerIndexList] = 0
	          end  
          end

					if (NeededPilots[playerIndexList] < 2) then
            if (canbuildpulsarturret[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "Kpr_Mover")
	            Player_UnrestrictBuildOption(playerIndex, "Kpr_Mover1")
	            Player_RestrictBuildOption(playerIndex, "kpr_attackdroid_combo")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_attackdroid_combo1")
	            Player_RestrictBuildOption(playerIndex, "kpr_interceptor_combo")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_interceptor_combo1")
	            Player_RestrictBuildOption(playerIndex, "kpr_attackdroid_agitator")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_attackdroid_agitator1")
	            Player_RestrictBuildOption(playerIndex, "kpr_marauder")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_marauder1")
	            Player_RestrictBuildOption(playerIndex, "kpr_resourcecollector")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_resourcecollector1")
	            canbuildpulsarturret[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 2) then
            if (canbuildpulsarturret[playerIndexList] == 1) then
	            Player_UnrestrictBuildOption(playerIndex, "Kpr_Mover")
	            Player_RestrictBuildOption(playerIndex, "Kpr_Mover1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_attackdroid_combo")
	            Player_RestrictBuildOption(playerIndex, "kpr_attackdroid_combo1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_interceptor_combo")
	            Player_RestrictBuildOption(playerIndex, "kpr_interceptor_combo1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_attackdroid_agitator")
	            Player_RestrictBuildOption(playerIndex, "kpr_attackdroid_agitator1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_marauder")
	            Player_RestrictBuildOption(playerIndex, "kpr_marauder1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_resourcecollector")
	            Player_RestrictBuildOption(playerIndex, "kpr_resourcecollector1")
	            canbuildpulsarturret[playerIndexList] = 0
	          end
          end

          if (NeededPilots[playerIndexList] < 4) then
            if (canbuildcontroller[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kpr_sentinel")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_sentinel1")
	            canbuildcontroller[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 4) then
            if (canbuildcontroller[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "kpr_sentinel")
	            Player_RestrictBuildOption(playerIndex, "kpr_sentinel1")
	            canbuildcontroller[playerIndexList] = 0
	          end
          end

          if (NeededPilots[playerIndexList] < 8) then
            if (canbuildpulsargunship[playerIndexList] == 0) then 
	            Player_RestrictBuildOption(playerIndex, "kpr_deciever")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_deciever1")
							Player_RestrictBuildOption(playerIndex, "kpr_hunter")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_hunter1")
							Player_RestrictBuildOption(playerIndex, "kpr_seeker")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_seeker1")
	            Player_RestrictBuildOption(playerIndex, "kpr_guardian")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_guardian1")
	            Player_RestrictBuildOption(playerIndex, "kpr_resourcecontroller")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_resourcecontroller1")
	            canbuildpulsargunship[playerIndexList] = 1
	          end
          elseif (NeededPilots[playerIndexList] >= 8) then
            if (canbuildpulsargunship[playerIndexList] == 1) then 
	            Player_UnrestrictBuildOption(playerIndex, "kpr_deciever")
	            Player_RestrictBuildOption(playerIndex, "kpr_deciever1")
							Player_UnrestrictBuildOption(playerIndex, "kpr_hunter")
	            Player_RestrictBuildOption(playerIndex, "kpr_hunter1")
							Player_UnrestrictBuildOption(playerIndex, "kpr_seeker")
	            Player_RestrictBuildOption(playerIndex, "kpr_seeker1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_guardian")
	            Player_RestrictBuildOption(playerIndex, "kpr_guardian1")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_resourcecontroller")
	            Player_RestrictBuildOption(playerIndex, "kpr_resourcecontroller1")
	            canbuildpulsargunship[playerIndexList] = 0   
	          end
          end

          if (NeededPilots[playerIndexList] < 10) then
            if (canbuildkp[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "kpr_dronestruct")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_dronestruct1")
	            canbuildkp[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) then
            if (canbuildkp[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kpr_dronestruct")
	            Player_RestrictBuildOption(playerIndex, "kpr_dronestruct1")
	            canbuildkp[playerIndexList] = 0
	          end  
          end

          if (NeededPilots[playerIndexList] < 15) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuilddestroyer[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kpr_destroyer")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_destroyer1")	 
              Player_RestrictBuildOption(playerIndex, "kpr_hive")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_hive1")
	            canbuilddestroyer[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 15) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuilddestroyer[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kpr_destroyer")
	            Player_RestrictBuildOption(playerIndex, "kpr_destroyer1")
							Player_UnrestrictBuildOption(playerIndex, "kpr_hive")
	            Player_RestrictBuildOption(playerIndex, "kpr_hive1")
	            canbuilddestroyer[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 20) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildv[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kpr_reaver")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_reaver1")

	            canbuildv[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 20) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildv[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kpr_reaver")
	            Player_RestrictBuildOption(playerIndex, "kpr_reaver1")
	            canbuildv[playerIndexList] = 0   
	          end  
          end    

          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 2) then
            if (canbuildc[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kpr_carrier")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_carrier1")
	            canbuildc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildc[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kpr_carrier")
	            Player_RestrictBuildOption(playerIndex, "kpr_carrier1")
	            canbuildc[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 35) or (NeededOfficers[playerIndexList] < 3) then
	          if (canbuilddreadnaught[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "kpr_dreadnaught")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_dreadnaught1")
	            canbuilddreadnaught[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 35) and (NeededOfficers[playerIndexList] >= 3) then
	          if (canbuilddreadnaught[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kpr_dreadnaught")
	            Player_RestrictBuildOption(playerIndex, "kpr_dreadnaught1")
	            canbuilddreadnaught[playerIndexList] = 0   
	          end  
          end

					if (NeededPilots[playerIndexList] < 40) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildsy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kpr_shipyard_old")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_shipyard_old1")
	            canbuildsy[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 40) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildsy[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kpr_shipyard_old")
	            Player_RestrictBuildOption(playerIndex, "kpr_shipyard_old1")
	            canbuildsy[playerIndexList] = 0
	          end  
          end

          if (NeededPilots[playerIndexList] < 60) or (NeededOfficers[playerIndexList] < 6) then
            if (canbuildcf[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "kpr_sajuuk")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_sajuuk1")
	            canbuildcf[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 60) and (NeededOfficers[playerIndexList] >= 6) then
            if (canbuildcf[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "kpr_sajuuk")
	            Player_RestrictBuildOption(playerIndex, "kpr_sajuuk1")
	            canbuildcf[playerIndexList] = 0
	          end  
          end

        end 		--end of race
        
---in base all'onore da accesso o meno alla costruzione dei moduli per l'arruolamento x entrambe le razze 	                
        if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "supporter") >= 1 then
	    --fleet admiral 
	        if honorList[playerIndexList] >= 480 then
	          if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then   
						  if SobGroup_Empty("hgn_crewstation"..playerIndex) == 1 then
	            elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isFleetAdmiral") > 0 then
	              gradoList[playerIndexList] = "FLEET ADMIRAL"
		          	gradoa[playerIndexList] = "FLEET ADMIRAL "
		          else
		            --if prioritamessaggio < 20 then
		            if (((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_HasShipWithBuildQueue(playerIndex) == 1) then 
			            Subtitle_Add(Actor_Talorn,"Next military rank available", 7)  
			          end  
		            --end
			          --honorList1[playerIndexList] = 480
	            end
	          elseif Player_GetRace(playerIndex) == Race_Vaygr then
		          gradoList[playerIndexList] = "FLEET ADMIRAL"
		          gradoa[playerIndexList] = "FLEET ADMIRAL "
		          --honorList1[playerIndexList] = 480	
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		          gradoList[playerIndexList] = "FLEET ADMIRAL"
		          gradoa[playerIndexList] = "FLEET ADMIRAL "
						elseif Player_GetRace(playerIndex) == Race_Raider then
		          if Player_HasResearch(playerIndex, "isFleetAdmiral" ) == 1 then
			          gradoList[playerIndexList] = "FLEET ADMIRAL"
			          gradoa[playerIndexList] = "FLEET ADMIRAL "
		          elseif ((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_CanResearch(playerIndex, "isFleetAdmiral" ) == 1 and Player_HasQueuedResearch(playerIndex, "isFleetAdmiral" ) == 0 then
		          	Subtitle_Add(13,"Next military rank available on black market", 7)
		          end
		        elseif Player_GetRace(playerIndex) == Race_Keeper then
		          gradoList[playerIndexList] = "FLEET ADMIRAL"
		          gradoa[playerIndexList] = "FLEET ADMIRAL "
		        end  
			--a ritroso          
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isLieutenant")            
	          end               
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommander")            
	          end  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCaptain")            
	          end 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommodore")            
	          end 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isAdmiral")            
	          end                          
			--attuale                                  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isFleetAdmiral")    
	            if year >= 1 then   
	              if Player_GetRace(playerIndex) == Race_Hiigaran then	                
	              elseif Player_GetRace(playerIndex) == Race_Vaygr then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3   
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
								elseif Player_GetRace(playerIndex) == Race_Raider then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              elseif Player_GetRace(playerIndex) == Race_Keeper then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              end
	            end     
	          end                        
	    
	    ---admiral          
	        elseif honorList[playerIndexList] >= 350 then
	          if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then   
	            if SobGroup_Empty("hgn_crewstation"..playerIndex) == 1 then
	            elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isAdmiral") > 0 then
	              gradoList[playerIndexList] = "ADMIRAL      "
			          gradoa[playerIndexList] = "ADMIRAL       "	
			          honorList1[playerIndexList] = 480
			        else
			          honorList1[playerIndexList] = 480
			          if (((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_HasShipWithBuildQueue(playerIndex) == 1) then 
			            Subtitle_Add(Actor_Talorn,"Next military rank available", 7)  
			          end    			          
	            end
	          elseif Player_GetRace(playerIndex) == Race_Vaygr then
		          gradoList[playerIndexList] = "ADMIRAL      "
		          gradoa[playerIndexList] = "ADMIRAL       "	
		          honorList1[playerIndexList] = 480
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		          gradoList[playerIndexList] = "ADMIRAL      "
		          gradoa[playerIndexList] = "ADMIRAL       "	
		          honorList1[playerIndexList] = 480
						elseif Player_GetRace(playerIndex) == Race_Raider then
		          honorList1[playerIndexList] = 480
		          if Player_HasResearch(playerIndex, "isAdmiral" ) == 1 then
			          gradoList[playerIndexList] = "ADMIRAL      "
			          gradoa[playerIndexList] = "ADMIRAL       "	
		          elseif ((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_CanResearch(playerIndex, "isAdmiral" ) == 1 and Player_HasQueuedResearch(playerIndex, "isAdmiral" ) == 0 then
		          	Subtitle_Add(13,"Next military rank available on black market", 7)
		          end
		        elseif Player_GetRace(playerIndex) == Race_Keeper then
		          gradoList[playerIndexList] = "ADMIRAL      "
		          gradoa[playerIndexList] = "ADMIRAL       "	
		          honorList1[playerIndexList] = 480
		        end  
			--a ritroso          
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isLieutenant")            
	          end               
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommander")            
	          end  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCaptain")            
	          end 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommodore")            
	          end                      
			--attuale                                       
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isAdmiral")      
	            if year >= 1 then   
	              if Player_GetRace(playerIndex) == Race_Hiigaran then	                
	              elseif Player_GetRace(playerIndex) == Race_Vaygr then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3   
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
								elseif Player_GetRace(playerIndex) == Race_Raider then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              elseif Player_GetRace(playerIndex) == Race_Keeper then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              end   
	            end      
	          end 
			--in avanti             
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral", 0) 
	          end
	          	          
	    ---Commodore       
	        elseif honorList[playerIndexList] >= 240 then
	          if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then   
	            if SobGroup_Empty("hgn_crewstation"..playerIndex) == 1 then
	            elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommodore") > 0 then
	              gradoList[playerIndexList] = "COMMODORE    "
			          gradoa[playerIndexList] = "COMMODORE     "
			          honorList1[playerIndexList] = 350	  
			        else
			          honorList1[playerIndexList] = 350
			          if (((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_HasShipWithBuildQueue(playerIndex) == 1) then 
			            Subtitle_Add(Actor_Talorn,"Next military rank available", 7)  
			          end   
	            end
	          elseif Player_GetRace(playerIndex) == Race_Vaygr then
		          gradoList[playerIndexList] = "COMMODORE    "
		          gradoa[playerIndexList] = "COMMODORE     "	  
		          honorList1[playerIndexList] = 350  
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		          gradoList[playerIndexList] = "COMMODORE    "
		          gradoa[playerIndexList] = "COMMODORE     "	  
		          honorList1[playerIndexList] = 350  
						elseif Player_GetRace(playerIndex) == Race_Raider then 
		          honorList1[playerIndexList] = 350  
		          if Player_HasResearch(playerIndex, "isCommodore" ) == 1 then
			          gradoList[playerIndexList] = "COMMODORE    "
			          gradoa[playerIndexList] = "COMMODORE     "	 
		          elseif ((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_CanResearch(playerIndex, "isCommodore" ) == 1 and Player_HasQueuedResearch(playerIndex, "isCommodore" ) == 0 then
		          	Subtitle_Add(13,"Next military rank available on black market", 7)
		          end
		        elseif Player_GetRace(playerIndex) == Race_Keeper then
		          gradoList[playerIndexList] = "COMMODORE    "
		          gradoa[playerIndexList] = "COMMODORE     "	  
		          honorList1[playerIndexList] = 350  
		        end           
			--a ritroso          
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isLieutenant")            
	          end               
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommander")            
	          end  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCaptain")            
	          end                  
			--attuale                      
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommodore")   
	            if year >= 1 then   
	              if Player_GetRace(playerIndex) == Race_Hiigaran then	                
	              elseif Player_GetRace(playerIndex) == Race_Vaygr then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3   
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
								elseif Player_GetRace(playerIndex) == Race_Raider then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              elseif Player_GetRace(playerIndex) == Race_Keeper then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              end   
	            end  
	          end
	    --in avanti          
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isAdmiral", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral", 0) 
	          end	              
	    
	    ---Captain              
	        elseif honorList[playerIndexList] >= 150 then
	          if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then   
	            if SobGroup_Empty("hgn_crewstation"..playerIndex) == 1 then
	            elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCaptain") > 0 then
	              gradoList[playerIndexList] = "CAPTAIN      "
			          gradoa[playerIndexList] = "CAPTAIN       "	
			          honorList1[playerIndexList] = 240
			        else
			          honorList1[playerIndexList] = 240
			          if (((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_HasShipWithBuildQueue(playerIndex) == 1) then 
			            Subtitle_Add(Actor_Talorn,"Next military rank available", 7)  
			          end  
	            end
	          elseif Player_GetRace(playerIndex) == Race_Vaygr then
		          gradoList[playerIndexList] = "CAPTAIN      "
		          gradoa[playerIndexList] = "CAPTAIN       "	
		          honorList1[playerIndexList] = 240
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		          gradoList[playerIndexList] = "CAPTAIN      "
		          gradoa[playerIndexList] = "CAPTAIN       "	
		          honorList1[playerIndexList] = 240
						elseif Player_GetRace(playerIndex) == Race_Raider then	
		          honorList1[playerIndexList] = 240
		          if Player_HasResearch(playerIndex, "isCaptain" ) == 1 then
			          gradoList[playerIndexList] = "CAPTAIN      "
			          gradoa[playerIndexList] = "CAPTAIN       "
		          elseif ((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_CanResearch(playerIndex, "isCaptain" ) == 1 and Player_HasQueuedResearch(playerIndex, "isCaptain" ) == 0 then
		          	Subtitle_Add(13,"Next military rank available on black market", 7)
		          end
		        elseif Player_GetRace(playerIndex) == Race_Keeper then
		          gradoList[playerIndexList] = "CAPTAIN      "
		          gradoa[playerIndexList] = "CAPTAIN       "	
		          honorList1[playerIndexList] = 240
		        end  
			--a ritroso          
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isLieutenant")            
	          end               
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommander")            
	          end               
			--attuale                                   
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCaptain")    
	            if year >= 1 then   
	              if Player_GetRace(playerIndex) == Race_Hiigaran then	                
	              elseif Player_GetRace(playerIndex) == Race_Vaygr then 
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3   
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
								elseif Player_GetRace(playerIndex) == Race_Raider then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              elseif Player_GetRace(playerIndex) == Race_Keeper then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              end   
	            end      
	          end 
	    --in avanti      
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCommodore", 0) 
	          end	 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isAdmiral", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral", 0) 
	          end	
	          
	     --Commander                               
	        elseif honorList[playerIndexList] >= 80 then
	          if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then   
	            if SobGroup_Empty("hgn_crewstation"..playerIndex) == 1 then
	            elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommander") > 0 then
	              gradoList[playerIndexList] = "COMMANDER    "
			          gradoa[playerIndexList] = "COMMANDER     "	
			          honorList1[playerIndexList] = 150
			        else
			          honorList1[playerIndexList] = 150
			          if (((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_HasShipWithBuildQueue(playerIndex) == 1) then 
			            Subtitle_Add(Actor_Talorn,"Next military rank available", 7)  
			          end  
	            end
	          elseif Player_GetRace(playerIndex) == Race_Vaygr then
		          gradoList[playerIndexList] = "COMMANDER    "
		          gradoa[playerIndexList] = "COMMANDER     "	
		          honorList1[playerIndexList] = 150
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		          gradoList[playerIndexList] = "COMMANDER    "
		          gradoa[playerIndexList] = "COMMANDER     "	
		          honorList1[playerIndexList] = 150
						elseif Player_GetRace(playerIndex) == Race_Raider then
		          honorList1[playerIndexList] = 150
		          if Player_HasResearch(playerIndex, "isCommander" ) == 1 then
			          gradoList[playerIndexList] = "COMMANDER    "
			          gradoa[playerIndexList] = "COMMANDER     "	
		          elseif ((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_CanResearch(playerIndex, "isCommander" ) == 1 and Player_HasQueuedResearch(playerIndex, "isCommander" ) == 0 then
		          	Subtitle_Add(13,"Next military rank available on black market", 7)
		          end
		        elseif Player_GetRace(playerIndex) == Race_Keeper then
		          gradoList[playerIndexList] = "COMMANDER    "
		          gradoa[playerIndexList] = "COMMANDER     "	
		          honorList1[playerIndexList] = 150
		        end  
			--a ritroso          
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isLieutenant")            
	          end   
	    --attuale                  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isCommander")   
	            if year >= 1 then   
	              if Player_GetRace(playerIndex) == Race_Hiigaran then	                
	              elseif Player_GetRace(playerIndex) == Race_Vaygr then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3   
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
								elseif Player_GetRace(playerIndex) == Race_Raider then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              elseif Player_GetRace(playerIndex) == Race_Keeper then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              end   
	            end  
	          end 
			--in avanti             
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCaptain", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCommodore", 0) 
	          end	 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isAdmiral", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral", 0) 
	          end	           	                            	               
	     
	    --Lieutenant          
	        elseif honorList[playerIndexList] >= 30 then	          
	          if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then   
	            if SobGroup_Empty("hgn_crewstation"..playerIndex) == 1 then
	            elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isLieutenant") > 0 then
	              gradoList[playerIndexList] = "LIEUTENANT   "
			          gradoa[playerIndexList] = "LIEUTENANT    "  
			          honorList1[playerIndexList] = 80
			        else
			          honorList1[playerIndexList] = 80	   
			          if (((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_HasShipWithBuildQueue(playerIndex) == 1) then 
			            Subtitle_Add(Actor_Talorn,"Next military rank available", 7)  
			          end  
			          --UI_FlashButton("ResourceMenu", "lblhonorflash", 3)       
	            end
	          elseif Player_GetRace(playerIndex) == Race_Vaygr then
		          gradoList[playerIndexList] = "LIEUTENANT   "
		          gradoa[playerIndexList] = "LIEUTENANT    "  
		          honorList1[playerIndexList] = 80
						elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		          gradoList[playerIndexList] = "LIEUTENANT   "
		          gradoa[playerIndexList] = "LIEUTENANT    "  
		          honorList1[playerIndexList] = 80
						elseif Player_GetRace(playerIndex) == Race_Raider then
		          honorList1[playerIndexList] = 80
		          if Player_HasResearch(playerIndex, "isLieutenant" ) == 1 then
		          	gradoList[playerIndexList] = "LIEUTENANT   "
		         		gradoa[playerIndexList] = "LIEUTENANT    "  
		          elseif ((gametime<78 and gametime>72) or (gametime<28 and gametime>22)) and playerIndex == Universe_CurrentPlayer() and Player_CanResearch(playerIndex, "isLieutenant" ) == 1 and Player_HasQueuedResearch(playerIndex, "isLieutenant" ) == 0 then
		          	Subtitle_Add(13,"Next military rank available on black market", 7)
		          end
		        elseif Player_GetRace(playerIndex) == Race_Keeper then
		          gradoList[playerIndexList] = "LIEUTENANT   "
		          gradoa[playerIndexList] = "LIEUTENANT    "  
		          honorList1[playerIndexList] = 80
		        end  
	    --attuale                	
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "isLieutenant")
	            if year >= 1 then   
		            if Player_GetRace(playerIndex) == Race_Hiigaran then	                
	              elseif Player_GetRace(playerIndex) == Race_Vaygr then 
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3   
								elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
								elseif Player_GetRace(playerIndex) == Race_Raider then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              elseif Player_GetRace(playerIndex) == Race_Keeper then
	                honorbonus[playerIndexList] = honorbonus[playerIndexList] + 3
	              end   
		          end          
	          end   
	    --in avanti                
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCommander", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCaptain", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCommodore", 0) 
	          end	 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isAdmiral", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral", 0) 
	          end	           	        
	    
	    ---Ensign
	        else 
	         	gradoList[playerIndexList] = "ENSIGN       "
	         	gradoa[playerIndexList] = "ENSIGN        "   
	         	honorList1[playerIndexList] = 30 
			--in avanti         	
	         	if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isLieutenant", 0) 
	          end	 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCommander", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCaptain", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isCommodore", 0) 
	          end	 
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isAdmiral", 0) 
	          end	  
	          if SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 then 
	          	SobGroup_SetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral", 0) 
	          end	       
	          
	        end	 
	        
 ---solo per Hig, caso in cui ?di 2 o pi?gradi avanti e ricomincia a costruire moduli rank
	        if Player_GetRace(playerIndex) == Race_Hiigaran and year > 0 then	  
	              
	        	if honorList[playerIndexList] >= 30 then 		         	 
	            if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isLieutenant") > 0 then
	              gradoList[playerIndexList] = "LIEUTENANT   "
			          gradoa[playerIndexList] = "LIEUTENANT     " 				                
	            end  
	          end    
	          
	          if honorList[playerIndexList] >= 80 then 		         	 
	            if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommander") > 0 then
	              gradoList[playerIndexList] = "COMMANDER    "
			          gradoa[playerIndexList] = "COMMANDER     " 				                
	            end  
	          end    
	          
	          if honorList[playerIndexList] >= 150 then 		         	 
	            if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCaptain") > 0 then
	              gradoList[playerIndexList] = "CAPTAIN      "
			          gradoa[playerIndexList] = "CAPTAIN       " 				                
	            end  
	          end    
	          
	          if honorList[playerIndexList] >= 240 then 		         	 
	            if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommodore") > 0 then
	              gradoList[playerIndexList] = "COMMODORE    "
			          gradoa[playerIndexList] = "COMMODORE     " 				                
	            end  
	          end    
	          
	          if honorList[playerIndexList] >= 350 then 		         	 
	            if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isAdmiral") > 0 then
	              gradoList[playerIndexList] = "ADMIRAL      "
			          gradoa[playerIndexList] = "ADMIRAL       " 				                
	            end  
	          end    
	          
	          if honorList[playerIndexList] >= 480 then 		         	 
	            if SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isFleetAdmiral") > 0 then
	              gradoList[playerIndexList] = "FLEET ADMIRAL"
			          gradoa[playerIndexList] = "FLEET ADMIRAL " 				                
	            end  
	          end    
	          
	        end	  

	---Display ranks for Raider when the actual rank is inconsistent with hornor points
	        if Player_GetRace(playerIndex) == Race_Raider and year > 0 then	  
	              
	        	if Player_HasResearch(playerIndex, "isLieutenant") == 0 and
	        	Player_HasResearch(playerIndex, "isCommander") == 0 and
	        	Player_HasResearch(playerIndex, "isCaptain") == 0 and
	        	Player_HasResearch(playerIndex, "isCommodore") == 0 and
	        	Player_HasResearch(playerIndex, "isAdmiral") == 0 and
	        	Player_HasResearch(playerIndex, "isFleetAdmiral") == 0 then 		         	 
		         	gradoList[playerIndexList] = "ENSIGN       "
		         	gradoa[playerIndexList] = "ENSIGN        "   		                
	          end
	              
	        	--if honorList[playerIndexList] >= 30 then 		         	 
	            if Player_HasResearch(playerIndex, "isLieutenant") == 1 then
	              gradoList[playerIndexList] = "LIEUTENANT   "
			          gradoa[playerIndexList] = "LIEUTENANT     " 				                
	            end  
	          --end    
	          
	          --if honorList[playerIndexList] >= 80 then 		         	 
	            if Player_HasResearch(playerIndex, "isCommander") == 1 then
	              gradoList[playerIndexList] = "COMMANDER    "
			          gradoa[playerIndexList] = "COMMANDER     " 				                
	            end  
	          --end    
	          
	          --if honorList[playerIndexList] >= 150 then 		         	 
	            if Player_HasResearch(playerIndex, "isCaptain") == 1 then
	              gradoList[playerIndexList] = "CAPTAIN      "
			          gradoa[playerIndexList] = "CAPTAIN       " 				                
	            end  
	          --end    
	          
	          --if honorList[playerIndexList] >= 240 then 		         	 
	            if Player_HasResearch(playerIndex, "isCommodore") == 1 then
	              gradoList[playerIndexList] = "COMMODORE    "
			          gradoa[playerIndexList] = "COMMODORE     " 				                
	            end  
	          --end    
	          
	          --if honorList[playerIndexList] >= 350 then 		         	 
	            if Player_HasResearch(playerIndex, "isAdmiral") == 1 then
	              gradoList[playerIndexList] = "ADMIRAL      "
			          gradoa[playerIndexList] = "ADMIRAL       " 				                
	            end  
	          --end    
	          
	          --if honorList[playerIndexList] >= 480 then 		         	 
	            if Player_HasResearch(playerIndex, "isFleetAdmiral") == 1 then
	              gradoList[playerIndexList] = "FLEET ADMIRAL"
			          gradoa[playerIndexList] = "FLEET ADMIRAL " 				                
	            end  
	          --end    
	          
	        end   
	        
	      end         	      

 ---setta gli ultimi piloti/ufficiali avuti x morte in battaglia    
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      
	        LastpilotpopList[playerIndexList] = pilotpopList[playerIndexList]  
	        LastofficerpopList[playerIndexList] = officerpopList[playerIndexList]     
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
        	pilotrecruitList[playerIndexList] = pilotmaxList[playerIndexList]  
	      	officerrecruitList[playerIndexList] = officermaxList[playerIndexList]
        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
        	pilotrecruitList[playerIndexList] = pilotmaxList[playerIndexList]  
	      	officerrecruitList[playerIndexList] = officermaxList[playerIndexList]
        elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
        	pilotrecruitList[playerIndexList] = pilotmaxList[playerIndexList]  
	      	officerrecruitList[playerIndexList] = officermaxList[playerIndexList]
	      elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then
        	pilotrecruitList[playerIndexList] = pilotmaxList[playerIndexList]  
	      	officerrecruitList[playerIndexList] = officermaxList[playerIndexList]
	      end	          
        
---Interfaccia---------------------------------------------------        
               
        if playerIndex == Universe_CurrentPlayer() and (year==0 and gametime<45 or year>0)  then   
        
          UI_SetTextLabelText("ResourceMenu", "lblPopUnits", ""..pilotpopList[playerIndexList].."/"..pilotrecruitList[playerIndexList].."/"..pilotmaxList[playerIndexList]);             
          UI_SetTextLabelText("UnitCapInfoPopup", "lblPopUnits", ""..pilotpopList[playerIndexList].."/"..pilotrecruitList[playerIndexList].."/"..pilotmaxList[playerIndexList]);         
  
          UI_SetTextLabelText("ResourceMenu", "lblPopOfficerUnits", ""..officerpopList[playerIndexList].."/"..officerrecruitList[playerIndexList].."/"..officermaxList[playerIndexList]);             
          UI_SetTextLabelText("UnitCapInfoPopup", "lblPopOfficerUnits", ""..officerpopList[playerIndexList].."/"..officerrecruitList[playerIndexList].."/"..officermaxList[playerIndexList]);                       
          
          UI_SetTextLabelText("UnitCapInfoPopup", "fighter", ""..fighter[playerIndexList]);
          UI_SetTextLabelText("UnitCapInfoPopup", "corvette", ""..corvette[playerIndexList]);
          UI_SetTextLabelText("UnitCapInfoPopup", "frigate", ""..frigate[playerIndexList]);
          UI_SetTextLabelText("UnitCapInfoPopup", "capital", ""..(capital[playerIndexList]+armedcapital[playerIndexList]));
          UI_SetTextLabelText("UnitCapInfoPopup", "platform", ""..platform[playerIndexList]);
          UI_SetTextLabelText("UnitCapInfoPopup", "utility", ""..utility[playerIndexList]);
          UI_SetTextLabelText("UnitCapInfoPopup", "fleet", ""..pilotpopdisplayList[playerIndexList]);
          UI_SetTextLabelText("ResourceMenu", "lblgrado", ""..gradoa[playerIndexList]);  
          UI_SetTextLabelText("UnitCapInfoPopup", "lblgrado1", ""..gradoa[playerIndexList]);   
          
          if honorList[playerIndexList] >= 480 then
            UI_SetTextLabelText("ResourceMenu", "lblhonor", ""..honorList[playerIndexList]);                                    
            UI_SetTextLabelText("UnitCapInfoPopup", "lblhonor", ""..honorList[playerIndexList]);           
          else 
            UI_SetTextLabelText("ResourceMenu", "lblhonor", ""..honorList[playerIndexList].."/"..honorList1[playerIndexList]);                                    
            UI_SetTextLabelText("UnitCapInfoPopup", "lblhonor", ""..honorList[playerIndexList].."/"..honorList1[playerIndexList]);      
          end 
                          
          UI_SetTextLabelText("UnitCapInfoPopup", "lblhonorbattle", ""..honorbattle);        
          UI_SetTextLabelText("UnitCapInfoPopup", "lblhonorcapture", ""..honorcapture);      
          UI_SetTextLabelText("UnitCapInfoPopup", "lblhonortribute", ""..honortribute);      
          UI_SetTextLabelText("UnitCapInfoPopup", "lblhonorresearch", ""..honorresearch);    
          UI_SetTextLabelText("UnitCapInfoPopup", "lblhonorbuild", ""..honorbuild);          
          UI_SetTextLabelText("UnitCapInfoPopup", "lblhonorru", ""..honorru);   
---Medals
	--battle
          if (honorbattle >= 30) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal1", 1)                       
          end                                                                                 
          if (honorbattle >= 60) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal2", 1)                       
          end                                                                                 
          if (honorbattle >= 90) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal3", 1)                       
          end                                                                                 
          if (honorbattle >= 120) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal4", 1)                       
          end                                                                                 
          if (honorbattle >= 150) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal5", 1)                       
          end    
  --capture
          if (honorcapture >= 10) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal1", 1)                       
          end                                                                                 
          if (honorcapture >= 20) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal2", 1)                       
          end                                                                                 
          if (honorcapture >= 30) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal3", 1)                       
          end                                                                                 
          if (honorcapture >= 40) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal4", 1)                       
          end                                                                                 
          if (honorcapture >= 50) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal5", 1)                       
          end    
  --tribute
          if (honortribute >= 15) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "tributemedal1", 1)                       
          end                                                                                 
          if (honortribute >= 30) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "tributemedal2", 1)                       
          end                                                                                 
          if (honortribute >= 45) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "tributemedal3", 1)                       
          end                                                                                 
          if (honortribute >= 60) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "tributemedal4", 1)                       
          end                                                                                 
          if (honortribute >= 75) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "tributemedal5", 1)                       
          end                                                                                                            
  --research
          if (honorresearch >= 20) then
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal1", 1)                       
          end                                                                                 
          if (honorresearch >= 40) then
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal2", 1)                       
          end                                                                                 
          if (honorresearch >= 60) then
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal3", 1)                       
          end                                                                                 
          if (honorresearch >= 80) then
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal4", 1)                       
          end                                                                                 
          if (honorresearch >= 100) then
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal5", 1)                       
          end                        
  --build
          if (honorbuild >= 30) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal1", 1)                       
          end                                                                                 
          if (honorbuild >= 60) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal2", 1)                       
          end                                                                                 
          if (honorbuild >= 90) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal3", 1)                       
          end                                                                                 
          if (honorbuild >= 120) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal4", 1)                       
          end                                                                                 
          if (honorbuild >= 150) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal5", 1)                       
          end                                                                                    
  --ru
          if (honorru >= 15) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "rumedal1", 1)                       
          end                                                                                 
          if (honorru >= 30) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "rumedal2", 1)                       
          end                                                                                 
          if (honorru >= 45) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "rumedal3", 1)                       
          end                                                                                 
          if (honorru >= 60) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "rumedal4", 1)                       
          end                                                                                 
          if (honorru >= 75) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "rumedal5", 1)                       
          end    

---rank remuneration          
          if ((lastgradoList[playerIndexList] ~= gradoList[playerIndexList]) and (lastrList[playerIndexList] == -1)) then        
            --prioritamessaggio[playerIndexList] = 20
            --Rule_AddInterval("togliprioritamessaggio", prioritamessaggio[playerIndexList]) 
            UI_SetTextLabelText("UnitCapInfoPopup", "lblscore", ""..scoreList[Universe_CurrentPlayer() + 1]);  --serve x partenza
            
            local ActorIndex = Actor_Talorn
            local message1 = "Now you can build barracks, recruit pilots"
            local message2 = "Now you can build barracks, recruit pilots and officers"
            local message3 = "Now you can build barracks, recruit pilots and officers"
		        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      
			        ActorIndex = Actor_Talorn
		        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
		        	ActorIndex = Actor_Makaan
		        	message1 = "Now you can recruit pilots"
		        	message2 = "Now you can recruit pilots and officers"
		        	message3 = "Now you can recruit pilots and officers"
		        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
		        	ActorIndex = 14
            	message1 = "Now you can unlock Ascension Perks, recruit pilots"
            	message2 = "Now you can unlock Ascension Perks, recruit pilots and officers"
            	message3 = "Now you can unlock Ascension Perks, recruit pilots and officers"
		        elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
		        	ActorIndex = 13
		        	message1 = "Now you can recruit pilots"
		        	message2 = "Now you can recruit pilots and officers"
		        	message3 = "Now you can recruit pilots and officers"
		        elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then
		        	ActorIndex = Actor_Keeper
		        	message1 = "Now you can recruit pilots"
		        	message2 = "Now you can recruit pilots and officers"
		        	message3 = "Now you can upgrade Special Powers, recruit pilots and officers"
			      end
            
            local skipwindow = 0
            if GetGameRubric()==GR_CAMPAIGN and year<1 then
            	skipwindow = 1
            end
            
            if gradoList[playerIndexList] == "ENSIGN       " then	
              remuneration = floor(200 * rankremuneration)
              if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "ENSIGN");									
								UI_SetElementVisible("rank", "ensign", 1) 
								UI_SetElementVisible("rank", "lieutenant", 0) 
								UI_SetElementVisible("rank", "commander", 0) 
								UI_SetElementVisible("rank", "captain", 0) 
								UI_SetElementVisible("rank", "commodore", 0) 
								UI_SetElementVisible("rank", "admiral", 0) 
								UI_SetElementVisible("rank", "fleetadmiral", 0) 												
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "Next military rank: Lieutenant (30 Honor points)"); 	
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Ensign military rank", 7)  								
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
								--Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missile_hit/sp_elements_planet_killer_missile_hit")
							end
													 	
			      
			      elseif gradoList[playerIndexList] == "LIEUTENANT   " then
			        remuneration = floor(600 * rankremuneration)
			        if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "LIEUTENANT");		
								UI_SetElementVisible("rank", "ensign", 0) 
								UI_SetElementVisible("rank", "lieutenant", 1) 
								UI_SetElementVisible("rank", "commander", 0) 
								UI_SetElementVisible("rank", "captain", 0) 
								UI_SetElementVisible("rank", "commodore", 0) 
								UI_SetElementVisible("rank", "admiral", 0) 
								UI_SetElementVisible("rank", "fleetadmiral", 0) 									
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "Next military rank: Commander (80 Honor points)"); 
								UI_SetTextLabelText("rank", "lblDescription3", message1);
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Lieutenant military rank", 7) 
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							end
			      
			      elseif gradoList[playerIndexList] == "COMMANDER    " then
			        remuneration = floor(1000 * rankremuneration)
			        if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "COMMANDER");	
								UI_SetElementVisible("rank", "ensign", 0) 
								UI_SetElementVisible("rank", "lieutenant", 0) 
								UI_SetElementVisible("rank", "commander", 1) 
								UI_SetElementVisible("rank", "captain", 0) 
								UI_SetElementVisible("rank", "commodore", 0) 
								UI_SetElementVisible("rank", "admiral", 0) 
								UI_SetElementVisible("rank", "fleetadmiral", 0) 										
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "Next military rank: Captain (150 Honor points)"); 
								UI_SetTextLabelText("rank", "lblDescription3", message2);
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Commander military rank", 7) 
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							end
			      
			      elseif gradoList[playerIndexList] == "CAPTAIN      " then
			        remuneration = floor(1400 * rankremuneration)
			        if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "CAPTAIN");	
								UI_SetElementVisible("rank", "ensign", 0) 
								UI_SetElementVisible("rank", "lieutenant", 0) 
								UI_SetElementVisible("rank", "commander", 0) 
								UI_SetElementVisible("rank", "captain", 1) 
								UI_SetElementVisible("rank", "commodore", 0) 
								UI_SetElementVisible("rank", "admiral", 0) 
								UI_SetElementVisible("rank", "fleetadmiral", 0) 										
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "Next military rank: Commodore (240 Honor points)"); 							
								UI_SetTextLabelText("rank", "lblDescription3", message2);
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Captain military rank", 7) 
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							end
			      
			      elseif gradoList[playerIndexList] == "COMMODORE    " then
			        remuneration = floor(1800 * rankremuneration)
			        if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "COMMODORE");	
								UI_SetElementVisible("rank", "ensign", 0) 
								UI_SetElementVisible("rank", "lieutenant", 0) 
								UI_SetElementVisible("rank", "commander", 0) 
								UI_SetElementVisible("rank", "captain", 0) 
								UI_SetElementVisible("rank", "commodore", 1) 
								UI_SetElementVisible("rank", "admiral", 0) 
								UI_SetElementVisible("rank", "fleetadmiral", 0) 										
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "Next military rank: Admiral (350 Honor points)"); 							
								UI_SetTextLabelText("rank", "lblDescription3", message2);
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Commodore military rank", 7) 
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							end
			      
			      elseif gradoList[playerIndexList] == "ADMIRAL      " then
			        remuneration = floor(2200 * rankremuneration)
			        if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "ADMIRAL");	
								UI_SetElementVisible("rank", "ensign", 0) 
								UI_SetElementVisible("rank", "lieutenant", 0) 
								UI_SetElementVisible("rank", "commander", 0) 
								UI_SetElementVisible("rank", "captain", 0) 
								UI_SetElementVisible("rank", "commodore", 0) 
								UI_SetElementVisible("rank", "admiral", 1) 
								UI_SetElementVisible("rank", "fleetadmiral", 0) 										
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "Next military rank: Fleet Admiral (480 Honor points)"); 							 
								UI_SetTextLabelText("rank", "lblDescription3", message2);
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Admiral military rank", 7) 
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							end
			      
			      elseif gradoList[playerIndexList] == "FLEET ADMIRAL" then
			        remuneration = floor(2600 * rankremuneration)
			        if skipwindow == 0 then
				        UI_SetScreenEnabled("rank", 1)		
								UI_SetScreenVisible("rank", 1)	
								UI_SetTextLabelText("rank", "lblSubTitle", "FLEET ADMIRAL");		
								UI_SetElementVisible("rank", "ensign", 0) 
								UI_SetElementVisible("rank", "lieutenant", 0) 
								UI_SetElementVisible("rank", "commander", 0) 
								UI_SetElementVisible("rank", "captain", 0) 
								UI_SetElementVisible("rank", "commodore", 0) 
								UI_SetElementVisible("rank", "admiral", 0) 
								UI_SetElementVisible("rank", "fleetadmiral", 1) 									
								UI_SetTextLabelText("rank", "lblDescription1", "Remunuration per year: "..remuneration); 	 
								UI_SetTextLabelText("rank", "lblDescription2", "No further military rank"); 
								UI_SetTextLabelText("rank", "lblDescription3", message3);
								UI_ShowRandomElement("rank", "btnOk")
								Subtitle_Add(ActorIndex,"You gained the Fleet Admiral military rank", 7) 
								Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							end
			      end  
			         
				    lastgradoList[playerIndexList] = gradoList[playerIndexList]   
			    end    			    
                          
        end          
      end 
    end       
    playerIndex = playerIndex + 1
  end
  honorinit = 1      
end  

function Population_SumUp(playerIndex, list, item)
	local playerIndexList = playerIndex + 1
	local quantity = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, list[item].name)
	if quantity > 0 then
		if list[item].pilot > 0 then
			pilotpopList[playerIndexList] = pilotpopList[playerIndexList] + list[item].pilot * quantity
		end
		if list[item].officer > 0 then
			officerpopList[playerIndexList] = officerpopList[playerIndexList] + list[item].officer * quantity
		end
		if list[item].class == "fighter" then
			fighter[playerIndexList] = fighter[playerIndexList] + quantity
		elseif list[item].class == "corvette" then
			corvette[playerIndexList] = corvette[playerIndexList] + quantity
		elseif list[item].class == "frigate" then
			frigate[playerIndexList] = frigate[playerIndexList] + quantity
		elseif list[item].class == "capital" then
			capital[playerIndexList] = capital[playerIndexList] + quantity
		elseif list[item].class == "armedcapital" then
			armedcapital[playerIndexList] = armedcapital[playerIndexList] + quantity
		elseif list[item].class == "platform" then
			platform[playerIndexList] = platform[playerIndexList] + quantity
		elseif list[item].class == "utility" then
			utility[playerIndexList] = utility[playerIndexList] + quantity
		elseif list[item].class == "weapon" then
			weapon[playerIndexList] = weapon[playerIndexList] + quantity
		end
	end
end

function Population_RestrictBuildOption(playerIndex, list, item)
	local shipname = list[item].name
	if list[item].pilot > 0 or list[item].officer > 0 then
		Player_RestrictBuildOption(playerIndex, shipname.."1")
	end
end