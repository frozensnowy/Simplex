function populationinit()  
  local playerIndex = 0                           
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then         
---Inizializza le unit? blocca le.1      
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then            
          Player_RestrictBuildOption(playerIndex, "hgn_orders_parade_disable")          
          Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon2") 	   
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon3") 	   
	        Player_RestrictBuildOption(playerIndex, "Hgn_MothershipCannon4") 	 	        
	        Player_RestrictBuildOption(playerIndex, "hgn_gunturret1") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_defensefieldturret1") 	        
	        Player_RestrictBuildOption(playerIndex, "hgn_pulsarturret1") 	       
	        Player_RestrictBuildOption(playerIndex, "hgn_resourcecollector1") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_container1") 						
	        Player_RestrictBuildOption(playerIndex, "hgn_transportcell1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_scout1") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_minelayercorvette1") 	       
	        Player_RestrictBuildOption(playerIndex, "hgn_ionturret1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_missileturret1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_rts1")
	        Player_RestrictBuildOption(playerIndex, "hgn_sentinel1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_ionsentinel1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_artillerysentinel1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_resourcecontroller1") 	         
	        Player_RestrictBuildOption(playerIndex, "hgn_interceptor1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomber1") 		        
	        Player_RestrictBuildOption(playerIndex, "hgn_defender1") 	       
	        Player_RestrictBuildOption(playerIndex, "hgn_lbomber1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter1") 	         
	        Player_RestrictBuildOption(playerIndex, "hgn_hft1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy1") 	        
	        Player_RestrictBuildOption(playerIndex, "hgn_interceptorl") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberl") 		   	         	       
	        Player_RestrictBuildOption(playerIndex, "hgn_lbomberl") 
	        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighterl") 	         
	        Player_RestrictBuildOption(playerIndex, "hgn_hftl") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavyl")
	        Player_RestrictBuildOption(playerIndex, "hgn_interceptorl1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberl1") 		   	         	       
	        Player_RestrictBuildOption(playerIndex, "hgn_lbomberl1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighterl1") 	         
	        Player_RestrictBuildOption(playerIndex, "hgn_hftl1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavyl1") 		        
	        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette1") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette1") 	       
	        Player_RestrictBuildOption(playerIndex, "hgn_assaultfrigate1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_torpedofrigate1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_lrms1") 	       
	        Player_RestrictBuildOption(playerIndex, "hgn_marinefrigate1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_defensefieldfrigate1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_ioncannonfrigate1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_cth1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_cthion1")    
	        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel") 	
					Player_RestrictBuildOption(playerIndex, "hgn_bombervette1") 
          Player_RestrictBuildOption(playerIndex, "hgn_bombervettel")
          Player_RestrictBuildOption(playerIndex, "hgn_bombervettel1")  					
	        Player_RestrictBuildOption(playerIndex, "hgn_cthl") 
	        Player_RestrictBuildOption(playerIndex, "hgn_cthionl") 
	        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel")	        
	        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel1") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1") 	
	        Player_RestrictBuildOption(playerIndex, "hgn_cthl1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_cthionl1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")    	        
	        Player_RestrictBuildOption(playerIndex, "hgn_tulwar1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_destroyer1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_sweeperdestroyer1") 	        
	        Player_RestrictBuildOption(playerIndex, "hgn_missiledestroyer1")  
	        Player_RestrictBuildOption(playerIndex, "hgn_iondestroyer1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_advdestroyer1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_artillerydestroyer1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_cruisera1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_cruiserb1") 		
	        Player_RestrictBuildOption(playerIndex, "hgn_minivortex1")        
	        Player_RestrictBuildOption(playerIndex, "hgn_tanker1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_juggernaught1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_researchstation1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_power1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_combatbase1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_battlecruiser1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_vortex1") 
	        Player_RestrictBuildOption(playerIndex, "hgn_battleship1")	 
	        Player_RestrictBuildOption(playerIndex, "hgn_carrier1")
	        Player_RestrictBuildOption(playerIndex, "hgn_battlecarrier1")
	        Player_RestrictBuildOption(playerIndex, "hgn_scaver1")
	        Player_RestrictBuildOption(playerIndex, "hgn_lightcarrier1") 	 
	        Player_RestrictBuildOption(playerIndex, "hgn_shipyard1") 
					Player_RestrictBuildOption(playerIndex, "hgn_battleshipyard1") 
          Player_RestrictBuildOption(playerIndex, "hgn_shipyard_g1") 					
	        Player_RestrictBuildOption(playerIndex, "hgn_commandfortress1")
	        Player_RestrictBuildOption(playerIndex, "hgn_ark1")
	        Player_RestrictBuildOption(playerIndex, "hgn_hyperspacestation1")   	        
	      elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
	        Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_gun1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_lance1")
	        Player_RestrictBuildOption(playerIndex, "vgr_weaponplatform_missile1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_mobile_inhibitor1")
	        Player_RestrictBuildOption(playerIndex, "vgr_cloakplatform1")
	        Player_RestrictBuildOption(playerIndex, "vgr_hyperspace_platform1") 	       
	        Player_RestrictBuildOption(playerIndex, "vgr_resourcecollector1") 	 
	        Player_RestrictBuildOption(playerIndex, "vgr_commandcorvette1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_scout1") 	       
	        Player_RestrictBuildOption(playerIndex, "vgr_container1") 
	        Player_RestrictBuildOption(playerIndex, "vgr_minelayercorvette1") 
	        Player_RestrictBuildOption(playerIndex, "vgr_resourcecontroller1") 	         	
          Player_RestrictBuildOption(playerIndex, "vgr_resourcecontrollerdouble1") 	         					
	        Player_RestrictBuildOption(playerIndex, "vgr_defender1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_lancefighter1")
	        Player_RestrictBuildOption(playerIndex, "vgr_heavyfighter1")
	        Player_RestrictBuildOption(playerIndex, "vgr_elitefighter1")
	        Player_RestrictBuildOption(playerIndex, "vgr_missilebomber1")    
	        Player_RestrictBuildOption(playerIndex, "vgr_bomber1") 
	        Player_RestrictBuildOption(playerIndex, "vgr_heavymissilefrigate1") 	         
	        Player_RestrictBuildOption(playerIndex, "vgr_assaultfrigate1") 	 
					Player_RestrictBuildOption(playerIndex, "vgr_advassaultfrigate1") 	 
	        Player_RestrictBuildOption(playerIndex, "vgr_infiltratorfrigate1") 	
          Player_RestrictBuildOption(playerIndex, "vgr_supportfrigate1") 	 
          Player_RestrictBuildOption(playerIndex, "vgr_supportfrigate_laser1") 	  
          Player_RestrictBuildOption(playerIndex, "vgr_supportfrigatearmed1") 	   					
	        Player_RestrictBuildOption(playerIndex, "vgr_interceptor1") 	     
	        Player_RestrictBuildOption(playerIndex, "vgr_missilecorvette1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_lasercorvette1") 	
          Player_RestrictBuildOption(playerIndex, "vgr_plasmacorvette1") 					
	        Player_RestrictBuildOption(playerIndex, "vgr_standvette1") 	 
	        Player_RestrictBuildOption(playerIndex, "vgr_artilleryfrigate1") 	
					Player_RestrictBuildOption(playerIndex, "vgr_longrangeartilleryfrigate1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_empfrigate1") 	        
	        Player_RestrictBuildOption(playerIndex, "vgr_commandfrigate1")
	        Player_RestrictBuildOption(playerIndex, "vgr_multilancecorvette1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_striker1") 	
					Player_RestrictBuildOption(playerIndex, "vgr_mortarcorvette1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_destroyer1")
					Player_RestrictBuildOption(playerIndex, "vgr_pulsedestroyer1")
	        Player_RestrictBuildOption(playerIndex, "vgr_am1")  	
	        Player_RestrictBuildOption(playerIndex, "vgr_cruiser1") 	
					Player_RestrictBuildOption(playerIndex, "vgr_lightcruiser1") 	
          Player_RestrictBuildOption(playerIndex, "vgr_artilleryship1") 	
          Player_RestrictBuildOption(playerIndex, "kpr_destroyer1") 					
	        Player_RestrictBuildOption(playerIndex, "vgr_battlecruiser1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_missilebattlecruiser1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_heavycruiser1")
	        Player_RestrictBuildOption(playerIndex, "vgr_alkhalid1")
	        Player_RestrictBuildOption(playerIndex, "vgr_dreadnaught1") 	  
	        Player_RestrictBuildOption(playerIndex, "vgr_dreadnaughtB1")
	        Player_RestrictBuildOption(playerIndex, "vgr_carrier1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_scaver1")
					Player_RestrictBuildOption(playerIndex, "vgr_battlecarrier1") 	
	        Player_RestrictBuildOption(playerIndex, "vgr_shipyard1") 
	        Player_RestrictBuildOption(playerIndex, "vgr_commandfortress1")		
	      elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
	        Player_RestrictBuildOption(playerIndex, "kad_container1") 	
	        Player_RestrictBuildOption(playerIndex, "kad_advancedswarmer_old1") 	
	        Player_RestrictBuildOption(playerIndex, "kad_advancedswarmer1")
	        Player_RestrictBuildOption(playerIndex, "kad_destroyer_real1")
	        Player_RestrictBuildOption(playerIndex, "kad_destroyer1") 	       
	        Player_RestrictBuildOption(playerIndex, "kad_frig_ghost1") 	 
	        Player_RestrictBuildOption(playerIndex, "kad_gunpod1") 	
	        Player_RestrictBuildOption(playerIndex, "kad_heavyswarmer_new1") 	       
	        Player_RestrictBuildOption(playerIndex, "kad_ionpod1") 
	        Player_RestrictBuildOption(playerIndex, "kad_missilepod1") 
	        Player_RestrictBuildOption(playerIndex, "kad_multibeam_new1") 	         	
          Player_RestrictBuildOption(playerIndex, "kad_multibeam1") 	         					
	        Player_RestrictBuildOption(playerIndex, "kad_multigun1") 	
	        Player_RestrictBuildOption(playerIndex, "kad_nebuladrone1")
	        Player_RestrictBuildOption(playerIndex, "kad_needleship1")
	        Player_RestrictBuildOption(playerIndex, "kad_pod_ghost1")
	        Player_RestrictBuildOption(playerIndex, "kad_podship1")    
	        Player_RestrictBuildOption(playerIndex, "kad_prayerpod1") 
	        Player_RestrictBuildOption(playerIndex, "kad_pulsarswarmer1") 	         
	        Player_RestrictBuildOption(playerIndex, "kad_ressourcecollector1") 	 
					Player_RestrictBuildOption(playerIndex, "kad_sensorpod1") 	 
	        Player_RestrictBuildOption(playerIndex, "kad_snail1") 	
          Player_RestrictBuildOption(playerIndex, "kad_swarmer_blood1") 	 
          Player_RestrictBuildOption(playerIndex, "kad_swarmer_crusader1") 	  
          Player_RestrictBuildOption(playerIndex, "kad_swarmer_ghost1") 	   					
	        Player_RestrictBuildOption(playerIndex, "kad_swarmer_hybrid1") 	     
	        Player_RestrictBuildOption(playerIndex, "kad_swarmer_new1") 	
	        Player_RestrictBuildOption(playerIndex, "kad_swarmer_zealot1") 	
	      elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
	        Player_RestrictBuildOption(playerIndex, "rad_beamfrigate1") 	
	        Player_RestrictBuildOption(playerIndex, "rad_bomber1") 	
	        Player_RestrictBuildOption(playerIndex, "rad_cruiser_queenscaffolda1")
	        Player_RestrictBuildOption(playerIndex, "rad_cruiserscaffolda1")
	        Player_RestrictBuildOption(playerIndex, "rad_destroyerscaffolda1") 	       
	        Player_RestrictBuildOption(playerIndex, "rad_scudscaffolda1")
	        Player_RestrictBuildOption(playerIndex, "rad_elitefighter1") 	 
	        Player_RestrictBuildOption(playerIndex, "rad_empcorvette1") 	
	        Player_RestrictBuildOption(playerIndex, "rad_jackal1")
	        Player_RestrictBuildOption(playerIndex, "rad_explotrap1") 	       
	        Player_RestrictBuildOption(playerIndex, "rad_fencer1") 
	        Player_RestrictBuildOption(playerIndex, "rad_gattlingfrigate1") 
	        Player_RestrictBuildOption(playerIndex, "rad_gravwel1") 	         	
          Player_RestrictBuildOption(playerIndex, "rad_guncorvette1") 	         					
	        Player_RestrictBuildOption(playerIndex, "rad_gunfrigate_morgan1") 	
	        Player_RestrictBuildOption(playerIndex, "rad_gunfrigate1")
	        Player_RestrictBuildOption(playerIndex, "rad_guntrap1")
	        Player_RestrictBuildOption(playerIndex, "rad_hsbouey1")
	        Player_RestrictBuildOption(playerIndex, "rad_interceptor_black1")    
	        Player_RestrictBuildOption(playerIndex, "rad_interceptor1") 
	        Player_RestrictBuildOption(playerIndex, "rad_merc_corvette1") 	         
	        Player_RestrictBuildOption(playerIndex, "rad_merc_cruiser1") 	 
	        Player_RestrictBuildOption(playerIndex, "rad_refurbisheddestroyer1")
	        Player_RestrictBuildOption(playerIndex, "rad_merc_scout1")
					Player_RestrictBuildOption(playerIndex, "rad_merc_fighter1") 	 
					Player_RestrictBuildOption(playerIndex, "rad_merc_interceptor1")
	        Player_RestrictBuildOption(playerIndex, "rad_merc_frigate1")
	        Player_RestrictBuildOption(playerIndex, "rad_merc_frigateadv1")
	        Player_RestrictBuildOption(playerIndex, "rad_merc_ioncannonfrigate1")
          Player_RestrictBuildOption(playerIndex, "rad_missilecorvette1") 	 
          Player_RestrictBuildOption(playerIndex, "rad_missilefrigate1") 	  
          Player_RestrictBuildOption(playerIndex, "rad_resourcecollector1") 	   					
	        Player_RestrictBuildOption(playerIndex, "rad_resourcecontroller1") 	     
	        Player_RestrictBuildOption(playerIndex, "rad_scaffolda1") 	
	        Player_RestrictBuildOption(playerIndex, "rad_scaffoldB1")
	        Player_RestrictBuildOption(playerIndex, "rad_scoutcorvette1")
	        Player_RestrictBuildOption(playerIndex, "rad_container1")
	        Player_RestrictBuildOption(playerIndex, "rad_blackmarket1")
	        Player_RestrictBuildOption(playerIndex, "rad_helios1")
	        Player_RestrictBuildOption(playerIndex, "rad_merc_battlecruiser1")
	        Player_RestrictBuildOption(playerIndex, "rad_vanaarjet1")
	        Player_RestrictBuildOption(playerIndex, "rad_qwaarjetii1")
	        Player_RestrictBuildOption(playerIndex, "rad_armsdealer1")
	      end            
    	end   
		end 
		playerIndex = playerIndex + 1  
	end	
  Rule_Remove("populationinit")    
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
	else
    officertoadd = 4 --* officermultiplier
	end	

  local playerIndex = 0                                              
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        playerIndexList = playerIndex + 1
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
	      if Player_HasResearch(playerIndex, "isexpert") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor ((((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 0.51)) / 1000)
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)	      		      
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honoursensitivity)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.08 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      elseif Player_HasResearch(playerIndex, "ishard") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor ((((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 0.51)) / 1000)
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)			         
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honoursensitivity)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.06 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      elseif Player_HasResearch(playerIndex, "isstandard") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor ((((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 0.51)) / 1000)
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)			          
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honoursensitivity)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.04 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      elseif Player_HasResearch(playerIndex, "iseasy") == 1 then
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.06) - (Stats_TotalLossesInRUs( playerIndex ) * 0.5) + (Stats_Extra[playerIndexList] * 0.55)) / 1000)        
		      honorcapture = floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor ((((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 0.51)) / 1000)
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.36) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.36)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.17) / 1000)	  		      
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honoursensitivity)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
	        honorList[playerIndexList] = floor (honorList[playerIndexList] * 1.02 * aiaidshonour * honortimefactor * honoramountfactor)
	        
	      else
	        honorbattle = floor (((Stats_TotalKillsInRUs( playerIndex ) * 1.045) - (Stats_TotalLossesInRUs( playerIndex ) * 0.725) + (Stats_Extra[playerIndexList] * 0.725)) / 1000)        
		      honorcapture = floor (((Stats_EnemyShipsCaptured( playerIndex ) * 3500) - (Stats_OwnShipsCaptured( playerIndex ) * 3500)) / 1000)
		      honortribute = floor (((Stats_TributeDonated( playerIndex ) * 0.5) - (Stats_TributeReceived( playerIndex ) * 0.25)) / 1000)
		      honorresearch = floor ((((Stats_ResearchRUValue( playerIndex ) + researchburned[playerIndexList]) * 0.5)) / 1000)
		      honorbuild = floor (((Stats_TotalShipsBuiltInRUs( playerIndex ) * 0.35) + (Stats_SubsystemsBuiltInRUs( playerIndex ) * 0.35)) / 1000)
		      honorru = floor (((Stats_GatheredRUs( playerIndex ) + Stats_ExtraGatheredRUs[playerIndexList]) * 0.15) / 1000)	    	      
		      honorList[playerIndexList] = (((honorcapture + honorbattle + honortribute + honorru + honorresearch + honorbuild) * honoursensitivity)) + honorbonus[playerIndexList] + honourstartList[playerIndexList]    
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
               
---calcola il totale piloti ed ufficiali               
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then         
          FighterPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scout" ) * 3) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptor" ) * 5) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomber" ) * 5) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defender" ) * 3) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lbomber" ) * 5) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_railgunfighter" ) * 5) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hft" ) * 5) +   
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberheavy" ) * 5) +                          
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptorl" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberl" ) * 7) +                       
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lbomberl" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_railgunfighterl" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hftl" ) * 7) +   
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberheavyl" ) * 7)                                  
          fighter[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scout" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptor" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomber" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defender" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lbomber" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_railgunfighter" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hft" ) +	
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberheavy" ) +												                     
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptorl" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberl" ) +											                     
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lbomberl" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_railgunfighterl" ) +
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hftl" ) +	
											                     Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberheavyl" ) 												                     		                      
          CorvettePop =	(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvette" ) * 6) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarcorvette" ) * 6) +
												(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_bombervette" ) * 6) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minelayercorvette" ) * 3) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_multiguncorvette" ) * 9) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cth" ) * 9) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthion" ) * 9) +                        
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvettel" ) * 10) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarcorvettel" ) * 10) +   
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_bombervettel" ) * 10) + 												
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_multiguncorvettel" ) * 15) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthl" ) * 15) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthionl" ) * 15)                                            
          corvette[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvette" ) +
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarcorvette" ) +
															 Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_bombervette" ) +
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minelayercorvette" ) +
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_multiguncorvette" ) +
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cth" ) +	
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthion" )	+
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvettel" ) +
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarcorvettel" ) + 
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_bombervettel" ) +  															 
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_multiguncorvettel" ) +
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthl" ) +	
                               Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthionl" )	                        
				  FrigatePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultfrigate" ) * 6) +
				               (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedofrigate" ) * 6) +
				               (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lrms" ) * 7) +
				               (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_marinefrigate" ) * 7) +
				               (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defensefieldfrigate" ) * 7) +
				               (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ioncannonfrigate" ) * 8) +
				               (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tulwar" ) * 9) 
				  frigate[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedofrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lrms" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_marinefrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defensefieldfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ioncannonfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tulwar" )                         
          CapitalPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership" ) * 50) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_destroyer" ) * 15) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sweeperdestroyer" ) * 15) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missiledestroyer" ) * 18) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_iondestroyer" ) * 18) +                       
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_advdestroyer" ) * 21) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerydestroyer" ) * 21) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruisera" ) * 23) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruiserb" ) * 23) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_juggernaught" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier" ) * 30) +        
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecarrier" ) * 30) +                       
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lightcarrier" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard" ) * 40) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleshipyard" ) * 60) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard_g" ) * 40) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress" ) * 60) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ark" ) * 60) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hyperspacestation" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecruiser" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_vortex" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minivortex" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleship" ) * 45) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tanker" ) * 20) 
          officerpopList[playerIndexList] = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership" ) * 5) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_destroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sweeperdestroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missiledestroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_iondestroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_advdestroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerydestroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sentinel" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionsentinel" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerysentinel" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_juggernaught" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruisera" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruiserb" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecarrier" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lightcarrier" ) * 1) +
                                            (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scaver" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard" ) * 3) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleshipyard" ) * 6) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard_g" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress" ) * 6) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ark" ) * 6) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hyperspacestation" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecruiser" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_vortex" ) * 4) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minivortex" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleship" ) * 5) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tanker" ) * 2)                                      
          capital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership" ) +                             
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecarrier" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lightcarrier" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hyperspacestation" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleshipyard" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard_g" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlestation" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ark" )  
          armedcapital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_destroyer" ) + 
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sweeperdestroyer" ) +   
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missiledestroyer" ) +                               
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_iondestroyer" ) + 
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_advdestroyer" ) + 
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerydestroyer" ) + 
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruisera" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruiserb" ) + 
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minivortex" ) + 
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_juggernaught" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecruiser" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_vortex" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minivortex" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleship" ) +
                              Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tanker" ) 
          PlatformPop = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_gunturret" ) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarturret" ) * 2) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionturret" ) * 3) +     
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missileturret" ) * 4) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sentinel" ) * 20) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionsentinel" ) * 20) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerysentinel" ) * 20) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_rts" ) * 5) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defensefieldturret" ) * 5)                              
                        --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper" ) +
                        --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine" ) 
          platform[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_gunturret" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarturret" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionturret" ) +		
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missileturret" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_rts" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defensefieldturret" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sentinel" ) +   			 
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionsentinel" ) +   			
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerysentinel" ) +   			                       
				                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nuclearbomb" )
				                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine" ) 
          UtilityPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector" ) * 2) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecontroller" ) * 4) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_container" ) * 4) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scaver" ) * 15)  
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_probe" ) +
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_proximitysensor" ) +
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ecmprobe" ) +                       
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hscore" ) 
          utility[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecontroller" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scaver" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_container" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_patcher" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_transportcell" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_probe" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_proximitysensor" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ecmprobe" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hscore" )      
				  weapon[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nuclearbomb" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper_short" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper_short1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper_ws" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper_ws1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine_ws" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine_ws1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minermissile" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minermissile1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nucleartube1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nucleartube2" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nucleartube3" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedotube1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedotube2" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedotube3" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine" )
          pilotpopList[playerIndexList] = FighterPop + CorvettePop + FrigatePop + CapitalPop + PlatformPop + UtilityPop 
          pilotpopdisplayList[playerIndexList] = fighter[playerIndexList] + corvette[playerIndexList] + frigate[playerIndexList] + capital[playerIndexList] + armedcapital[playerIndexList] + platform[playerIndexList] + utility[playerIndexList]
          
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
          
---fighters
          if Player_HasResearch(playerIndex, "fightersquadron7") == 0 then             
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
						      end  
					      else
					        if (canbuildinterceptor[playerIndexList] == 0) then
						        Player_RestrictBuildOption(playerIndex, "hgn_interceptor") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_attackbomber") 		   	         	       
						        Player_RestrictBuildOption(playerIndex, "hgn_lbomber") 
						        Player_RestrictBuildOption(playerIndex, "hgn_railgunfighter") 	         
						        Player_RestrictBuildOption(playerIndex, "hgn_hft") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_attackbomberheavy") 
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
		            canbuildbomberheavy[playerIndexList] = 0
		          end		          
	          end  
	        end  
	        
---Corvettes
          if Player_HasResearch(playerIndex, "corvettesquadron5") == 0 then             
	          if (NeededPilots[playerIndexList] < 6) then	            
		          if (canbuildgunship[playerIndexList] == 0) then    
                Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvette1")							
		            Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvette1")
								Player_RestrictBuildOption(playerIndex, "hgn_bombervette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_bombervette1")
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
		            canbuildgunship[playerIndexList] = 0
		          end
		        end
		        
		        if (NeededPilots[playerIndexList] < 9) then
	            if (canbuildmultigun[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvette1")
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
						      end     	         	       					        
					      else
					        if (canbuildgunship[playerIndexList] == 0) then  
						        Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette") 	
										Player_RestrictBuildOption(playerIndex, "hgn_bombervette") 	
						      end  	        
				        end  	        
				        bloccocorvettesquadron[playerIndexList] = 1				        
				        canbuildgunship[playerIndexList] = 1																										
								Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1")	
                Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel1")								
				      end 
				      if (canbuildgunship[playerIndexList] == 0) then      
		            Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel1")
								Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1")
								Player_RestrictBuildOption(playerIndex, "hgn_bombervettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel1")
		            canbuildgunship[playerIndexList] = 1
		          end		               
				    elseif (NeededPilots[playerIndexList] >= 10) then  	     
				      if (bloccocorvettesquadron[playerIndexList] == 0) then	  
				        if (canbuildgunship[playerIndexList] == 0) then          
				          Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvette") 	 
						      Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvette") 	
                  Player_RestrictBuildOption(playerIndex, "hgn_bombervette") 									
						    end  	        	        
				        bloccocorvettesquadron[playerIndexList] = 1				        
				        canbuildgunship[playerIndexList] = 0										
								Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
								Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")	
                Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel")										
				      end 	
				      if (canbuildgunship[playerIndexList] == 1) then        
		            Player_UnrestrictBuildOption(playerIndex, "hgn_assaultcorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_assaultcorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_pulsarcorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_pulsarcorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_bombervettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_bombervettel1")
		            canbuildgunship[playerIndexList] = 0
		          end		            	    
				    end 
				    
				    if (NeededPilots[playerIndexList] < 15) then	          
	            if (bloccocorvettesquadron1[playerIndexList] == 0) then	   
	              if (NeededPilots[playerIndexList] < 9) then
	                if (canbuildmultigun[playerIndexList] == 1) then  			          
						        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette1") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_cth1") 		
						        Player_RestrictBuildOption(playerIndex, "hgn_cthion1") 	
						      end  	   	         	       					        
					      else
					        if (canbuildmultigun[playerIndexList] == 0) then
						        Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvette") 	 
						        Player_RestrictBuildOption(playerIndex, "hgn_cth") 		
						        Player_RestrictBuildOption(playerIndex, "hgn_cthion") 
						      end  		        
				        end  	        
				        bloccocorvettesquadron1[playerIndexList] = 1				        
				        canbuildmultigun[playerIndexList] = 1
								canbuildcth[playerIndexList] = 1																		
								Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthl1")	
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthionl1")										
				      end 
				      if (canbuildmultigun[playerIndexList] == 0) then  
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")
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
						      Player_RestrictBuildOption(playerIndex, "hgn_cth") 		
						      Player_RestrictBuildOption(playerIndex, "hgn_cthion")   
					      end    	        
				        bloccocorvettesquadron1[playerIndexList] = 1				        
				        canbuildmultigun[playerIndexList] = 0
								canbuildcth[playerIndexList] = 0						
								Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthl")	
								Player_UnrestrictBuildOption(playerIndex, "hgn_cthionl")					
				      end 	
				      if (canbuildmultigun[playerIndexList] == 1) then  
		            Player_UnrestrictBuildOption(playerIndex, "hgn_multiguncorvettel")
		            Player_RestrictBuildOption(playerIndex, "hgn_multiguncorvettel1")
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
	            canbuildbc[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 30) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildbc[playerIndexList] == 1) then
              Player_UnrestrictBuildOption(playerIndex, "hgn_battlecarrier")
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecarrier1")
	            Player_UnrestrictBuildOption(playerIndex, "hgn_battlecruiser")
	            Player_RestrictBuildOption(playerIndex, "hgn_battlecruiser1")
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
          FighterPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scout" ) * 3) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_interceptor" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_bomber" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_defender" ) * 5) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lancefighter" ) * 5) + 
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavyfighter" ) * 5) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilebomber" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_elitefighter" ) * 5)
          fighter[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scout" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_interceptor" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_bomber" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_defender" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lancefighter" ) + 
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavyfighter" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilebomber" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_elitefighter" )
          CorvettePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilecorvette" ) * 8) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lasercorvette" ) * 8) +
												(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_plasmacorvette" ) * 8) + 
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_striker" ) * 9) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_multilancecorvette" ) * 9) +
												(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mortarcorvette" ) * 9) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_minelayercorvette" ) * 3) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandcorvette" ) * 2) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_standvette" ) * 8)
          corvette[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilecorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lasercorvette" ) +
															 Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_plasmacorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_multilancecorvette" ) +
															 Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mortarcorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_striker" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_minelayercorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandcorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_standvette" )   
          FrigatePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavymissilefrigate" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_assaultfrigate" ) * 6) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_advassaultfrigate" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_infiltratorfrigate" ) * 7) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigatearmed" ) * 7) + 
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigate" ) * 8) + 
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigate_laser" ) * 8) + 
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryfrigate" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_longrangeartilleryfrigate" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfrigate" ) * 8) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_empfrigate" ) * 8)
          frigate[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavymissilefrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_assaultfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_advassaultfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_infiltratorfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigate_laser" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigatearmed" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_longrangeartilleryfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_empfrigate" )
          CapitalPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership" ) * 50) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_destroyer" ) * 15) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_pulsedestroyer" ) * 15) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_am" ) * 12) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruiser" ) * 20) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lightcruiser" ) * 20) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryship" ) * 20) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier" ) * 30) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecarrier" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard" ) * 40) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfortress" ) * 50) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecruiser" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilebattlecruiser" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavycruiser" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaught" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaughtB" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_destroyer" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_alkhalid" ) * 35)
          officerpopList[playerIndexList] = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership" ) * 5) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_destroyer" ) * 1) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_pulsedestroyer" ) * 1) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruiser" ) * 2) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lightcruiser" ) * 2) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryship" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier" ) * 2) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecarrier" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfortress" ) * 6) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecruiser" ) * 3) +  
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilebattlecruiser" ) * 3) +   
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavycruiser" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaught" ) * 3) +   
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaughtB" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_destroyer" ) * 1) +  
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_alkhalid" ) * 3) +
                                            (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scaver" ) * 1)
          capital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecarrier" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfortress" )
				  armedcapital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_destroyer" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_pulsedestroyer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_am" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruiser" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lightcruiser" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryship" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecruiser" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilebattlecruiser" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavycruiser" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaught" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaughtB" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_destroyer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_alkhalid" )
          PlatformPop = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_gun" ) +  
          							Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_lance" ) +  
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_missile" ) * 2) +                        
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mobile_inhibitor" ) * 4) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cloakplatform" ) * 4) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hyperspace_platform" ) * 2) 
                        --(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruse" ) * 4)                
          platform[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_gun" ) +  
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_lance" ) +  
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_missile" ) +				                       
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mobile_inhibitor" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cloakplatform" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hyperspace_platform" )
				                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruse" )
				                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_boa" )             
          UtilityPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector" ) * 2) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecontroller" ) * 4) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecontrollerdouble" ) * 8) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_container" ) * 4) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scaver" ) * 15)
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe" ) +
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe_prox" ) +
                       --Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe_ecm" ) 
          utility[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecontroller" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecontrollerdouble" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_container" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scaver" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe_prox" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe_smallhsbeacon" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_probe_ecm" )
				  weapon[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_Cruse" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_Cruse1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_Boa" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_minermissile" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_JDAM" )
          pilotpopList[playerIndexList] = FighterPop + CorvettePop + FrigatePop + CapitalPop + PlatformPop + UtilityPop
          pilotpopdisplayList[playerIndexList] = fighter[playerIndexList] + corvette[playerIndexList] + frigate[playerIndexList] + capital[playerIndexList] + armedcapital[playerIndexList] + platform[playerIndexList] + utility[playerIndexList]
          
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
							Player_UnrestrictBuildOption(playerIndex, "vgr_artilleryship")
	            Player_RestrictBuildOption(playerIndex, "vgr_artilleryship1")
	            canbuildv[playerIndexList] = 0   
	          end  
          end    

          if (NeededPilots[playerIndexList] < 10) or (NeededOfficers[playerIndexList] < 1) then
            if (canbuildkp[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "kpr_destroyer")
	            Player_UnrestrictBuildOption(playerIndex, "kpr_destroyer1")
	            canbuildkp[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 10) and (NeededOfficers[playerIndexList] >= 1) then
            if (canbuildkp[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kpr_destroyer")
	            Player_RestrictBuildOption(playerIndex, "kpr_destroyer1")
	            canbuildkp[playerIndexList] = 0   
	          end  
          end

          if (NeededPilots[playerIndexList] < 30) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildbc[playerIndexList] == 0) then        
	            Player_RestrictBuildOption(playerIndex, "vgr_battlecruiser")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_battlecruiser1")
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
	            canbuilddreadnaught[playerIndexList] = 0   
	          end  
          end
          
          if (NeededPilots[playerIndexList] < 40) or (NeededOfficers[playerIndexList] < 3) then
            if (canbuildsy[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_shipyard")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_shipyard1")
	            canbuildsy[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 40) and (NeededOfficers[playerIndexList] >= 3) then
            if (canbuildsy[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "vgr_shipyard")
	            Player_RestrictBuildOption(playerIndex, "vgr_shipyard1")
	            canbuildsy[playerIndexList] = 0   
	          end  
          end    
          
          if (NeededPilots[playerIndexList] < 50) or (NeededOfficers[playerIndexList] < 6) then
            if (canbuildcf[playerIndexList] == 0) then
	            Player_RestrictBuildOption(playerIndex, "vgr_commandfortress")
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandfortress1")
	            canbuildcf[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 50) and (NeededOfficers[playerIndexList] >= 6) then
            if (canbuildcf[playerIndexList] == 1) then   
	            Player_UnrestrictBuildOption(playerIndex, "vgr_commandfortress")
	            Player_RestrictBuildOption(playerIndex, "vgr_commandfortress1")
	            canbuildcf[playerIndexList] = 0
	          end  
          end 
          
          
---KADESHI                          
        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
        
          FighterPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_advancedswarmer" ) * 8) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_advancedswarmer_old" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_heavyswarmer_new" ) * 9) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_pulsarswarmer" ) * 9) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_blood" ) * 25) + 
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_crusader" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_ghost" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_hybrid" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_new" ) * 9) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_zealot" ) * 7)
          fighter[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_advancedswarmer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_advancedswarmer_old" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_heavyswarmer_new" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_pulsarswarmer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_blood" ) + 
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_crusader" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_ghost" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_hybrid" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_new" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_zealot" )
          CorvettePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_gunpod" ) * 8) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_ionpod" ) * 8) +
												(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_missilepod" ) * 10) + 
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_pod_ghost" ) * 8) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_prayerpod" ) * 2) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_sensorpod" ) * 2)
          corvette[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_gunpod" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_ionpod" ) +
															 Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_missilepod" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_pod_ghost" ) +
															 Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_prayerpod" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_sensorpod" )
          FrigatePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_frig_ghost" ) * 8) + 
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multibeam" ) * 8) + 
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multibeam_new" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multigun" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_podship" ) * 8)
          frigate[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_frig_ghost" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multibeam" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multibeam_new" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multigun" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_podship" )
          CapitalPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship" ) * 50) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer_real" ) * 20)
          officerpopList[playerIndexList] = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship" ) * 6) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer_real" ) * 2)     
          capital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship" )
          armedcapital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer_real" )
          PlatformPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_nebuladrone" ) * 2) +                        
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_snail" ) * 4)     
          platform[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_nebuladrone" ) +  
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_snail" )          
          UtilityPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_ressourcecollector" ) * 2) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_container" ) * 4)
          utility[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_ressourcecollector" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_container" )         
          pilotpopList[playerIndexList] = FighterPop + CorvettePop + FrigatePop + CapitalPop + PlatformPop + UtilityPop
          pilotpopdisplayList[playerIndexList] = fighter[playerIndexList] + corvette[playerIndexList] + frigate[playerIndexList] + capital[playerIndexList] + armedcapital[playerIndexList] + platform[playerIndexList] + utility[playerIndexList]
        
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

	            canbuildv[playerIndexList] = 1
	          end  
          elseif (NeededPilots[playerIndexList] >= 20) and (NeededOfficers[playerIndexList] >= 2) then
            if (canbuildv[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "kad_destroyer_real")
	            Player_RestrictBuildOption(playerIndex, "kad_destroyer_real1")
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

          FighterPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_scout" ) * 3) +
          						 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_fighter" ) * 7) +
          						 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_interceptor" ) * 7) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_bomber" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_elitefighter" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_fencer" ) * 6) + 
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_interceptor" ) * 6) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_interceptor_black" ) * 6)
          fighter[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_scout" ) +
          										Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_fighter" ) +
          										Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_interceptor" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_bomber" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_elitefighter" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_fencer" ) + 
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_interceptor" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_interceptor_black" )
          CorvettePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_corvette" ) * 8) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scoutcorvette" ) * 9) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_guncorvette" ) * 3) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_empcorvette" ) * 8) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_jackal" ) * 8) +
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_missilecorvette" ) * 8)
          corvette[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_corvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scoutcorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_guncorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_empcorvette" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_jackal" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_missilecorvette" )   
          FrigatePop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_beamfrigate" ) * 8) + 
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gattlingfrigate" ) * 8) + 
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gunfrigate" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gunfrigate_morgan" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_frigate" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_frigateadv" ) * 8) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_ioncannonfrigate" ) * 8) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_missilefrigate" ) * 8)
          frigate[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_beamfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gattlingfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gunfrigate" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gunfrigate_morgan" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_frigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_frigateadv" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_ioncannonfrigate" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_missilefrigate" )
          CapitalPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier" ) * 30) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier_black" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scaffolda" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scaffoldB" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket" ) * 60) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_cruiser" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_refurbisheddestroyer" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_helios" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_battlecruiser" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser_queen" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiserscaffolda" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser_queenscaffolda" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_vanaarjet" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_qwaarjetii" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_armsdealer" ) * 35) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scud" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scudscaffolda" ) * 30) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_destroyer" ) * 10) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_destroyerscaffolda" ) * 10)
          officerpopList[playerIndexList] = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier" ) * 2) +
																						(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier_black" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scaffolda" ) * 2) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scaffoldB" ) * 2) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket" ) * 6) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_cruiser" ) * 2) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_refurbisheddestroyer" ) * 2) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_helios" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_battlecruiser" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser" ) * 3) +   
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser_queen" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiserscaffolda" ) * 3) +   
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser_queenscaffolda" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_vanaarjet" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_qwaarjetii" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_armsdealer" ) * 3) + 
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scud" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scudscaffolda" ) * 3) +
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_destroyer" ) * 1) +  
											                      (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_destroyerscaffolda" ) * 1)         
          capital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier_black" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scaffolda" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scaffoldB" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket" )
				  armedcapital[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_cruiser" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_refurbisheddestroyer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_helios" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_merc_battlecruiser" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser_queen" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiserscaffolda" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_cruiser_queenscaffolda" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_vanaarjet" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_qwaarjetii" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_armsdealer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scud" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_scudscaffolda" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_destroyer" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_destroyerscaffolda" )
          PlatformPop = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_explotrap" ) +  
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gravwel" ) * 2) + 
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_hsbouey" ) * 2) + 
                        (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_guntrap" ) * 2)               
          platform[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_explotrap" ) +  
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gravwel" ) +				                       
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_hsbouey" ) +
				                       Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_guntrap" ) 
          UtilityPop = (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_resourcecollector" ) * 2) +
											 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_resourcecontroller" ) * 8) +
                       (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_container" ) * 4)
          utility[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_resourcecollector" ) +
															Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_resourcecontroller" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_container" )
				  weapon[playerIndexList] = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_Cruse" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_Cruse1" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_Boa" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_minermissile" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minermissile" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tangomine" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper_ws" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_viper_short" ) +
				                      Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nucleartube1" )
          pilotpopList[playerIndexList] = FighterPop + CorvettePop + FrigatePop + CapitalPop + PlatformPop + UtilityPop
          pilotpopdisplayList[playerIndexList] = fighter[playerIndexList] + corvette[playerIndexList] + frigate[playerIndexList] + capital[playerIndexList] + armedcapital[playerIndexList] + platform[playerIndexList] + utility[playerIndexList]
          
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
	            canbuildinterceptor[playerIndexList] = 1      
	          end     
          elseif (NeededPilots[playerIndexList] >= 7) then
	          if (canbuildinterceptor[playerIndexList] == 1) then  
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_fighter")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_fighter1")     
	            Player_UnrestrictBuildOption(playerIndex, "rad_merc_interceptor")
	            Player_RestrictBuildOption(playerIndex, "rad_merc_interceptor1")
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
                  
        end 
        
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
	      end	          
        
---Interfaccia---------------------------------------------------        
               
        if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<45) or year>0) then   
        
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
          if (honorbattle >= 15) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal1", 1)                       
          end                                                                                 
          if (honorbattle >= 30) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal2", 1)                       
          end                                                                                 
          if (honorbattle >= 45) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal3", 1)                       
          end                                                                                 
          if (honorbattle >= 60) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal4", 1)                       
          end                                                                                 
          if (honorbattle >= 75) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "battlemedal5", 1)                       
          end    
  --capture
          if (honorcapture >= 15) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal1", 1)                       
          end                                                                                 
          if (honorcapture >= 30) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal2", 1)                       
          end                                                                                 
          if (honorcapture >= 45) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal3", 1)                       
          end                                                                                 
          if (honorcapture >= 60) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "capturemedal4", 1)                       
          end                                                                                 
          if (honorcapture >= 75) then                                                                                     
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
          if (honorresearch >= 15) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal1", 1)                       
          end                                                                                 
          if (honorresearch >= 30) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal2", 1)                       
          end                                                                                 
          if (honorresearch >= 45) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal3", 1)                       
          end                                                                                 
          if (honorresearch >= 60) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal4", 1)                       
          end                                                                                 
          if (honorresearch >= 75) then                                                                                     
            UI_SetElementVisible("UnitCapInfoPopup", "researchmedal5", 1)                       
          end                        
  --build
          if (honorbuild >= 15) then                                  
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal1", 1)                       
          end                                                                                 
          if (honorbuild >= 30) then                       
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal2", 1)                       
          end                                                                                 
          if (honorbuild >= 45) then                              
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal3", 1)                       
          end                                                                                 
          if (honorbuild >= 60) then                         
            UI_SetElementVisible("UnitCapInfoPopup", "buildmedal4", 1)                       
          end                                                                                 
          if (honorbuild >= 75) then                                                                                     
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
		        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      
			        ActorIndex = Actor_Talorn   
		        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
		        	ActorIndex = Actor_Makaan
		        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
		        	ActorIndex = 14
		        elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
		        	ActorIndex = 13
			      end
            
            if gradoList[playerIndexList] == "ENSIGN       " then	
              remuneration = floor(200 * rankremuneration)			        
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
							Subtitle_Add(ActorIndex,"You gain the Ensign military rank", 7)  								
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
							--Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missile_hit/sp_elements_planet_killer_missile_hit")
													 	
			      
			      elseif gradoList[playerIndexList] == "LIEUTENANT   " then
			        remuneration = floor(600 * rankremuneration)			        
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
							UI_SetTextLabelText("rank", "lblDescription3", "Now you can build barracks, recruit pilots");
							Subtitle_Add(ActorIndex,"You gain the Lieutenant military rank", 7) 
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion") 	
			      
			      elseif gradoList[playerIndexList] == "COMMANDER    " then
			        remuneration = floor(1000 * rankremuneration)			        
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
							UI_SetTextLabelText("rank", "lblDescription3", "Now you can build barracks, recruit pilots and officers");
							Subtitle_Add(ActorIndex,"You gain the Commander military rank", 7) 
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
			      
			      elseif gradoList[playerIndexList] == "CAPTAIN      " then
			        remuneration = floor(1400 * rankremuneration)			        
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
							UI_SetTextLabelText("rank", "lblDescription3", "Now you can build barracks, recruit pilots and officers");
							Subtitle_Add(ActorIndex,"You gain the Captain military rank", 7) 
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
			      
			      elseif gradoList[playerIndexList] == "COMMODORE    " then
			        remuneration = floor(1800 * rankremuneration)			        
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
							UI_SetTextLabelText("rank", "lblDescription3", "Now you can build barracks, recruit pilots and officers");
							Subtitle_Add(ActorIndex,"You gain the Commodore military rank", 7) 
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
			      
			      elseif gradoList[playerIndexList] == "ADMIRAL      " then
			        remuneration = floor(2200 * rankremuneration)			        
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
							UI_SetTextLabelText("rank", "lblDescription3", "Now you can build barracks, recruit pilots and officers");
							Subtitle_Add(ActorIndex,"You gain the Admiral military rank", 7) 
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
			      
			      elseif gradoList[playerIndexList] == "FLEET ADMIRAL" then
			        remuneration = floor(2600 * rankremuneration)			        
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
							UI_SetTextLabelText("rank", "lblDescription3", "Now you can build barracks, recruit pilots and officers");
							Subtitle_Add(ActorIndex,"You gain the Fleet Admiral military rank", 7) 
							Sound_SpeechPlay("Data:sound/sfx/etg/sp_elements/sp_elements_distanceexplosion/sp_elements_distanceexplosion")
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