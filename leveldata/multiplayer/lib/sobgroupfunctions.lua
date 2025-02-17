Sobgroup_Runtimes = 6

function sobgroupscreate()
	Temp_GlobalVariable.SobSave = 1
	UpdateSystemTimeInSeconds()		--count game time in real seconds, defined in gametime.lua
  local playerIndex = 0                           
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 or Player_NumberOfAwakeShips(playerIndex) >= 0 then    --at first, "or" is added for Territories Mod, but now, "0" is required for Single Player Campaign
--Hiigaran           
	      SobGroup_Create("Player_Ships"..playerIndex)
	      SobGroup_Create("lastPlayer_Ships"..playerIndex)
	      SobGroup_Create("SoleSurvivor"..playerIndex)
	      if GameRulesName == "Simplex Sole Survivor" then
	      	if SobGroup_Empty("Player_Ships"..playerIndex) == 0 then
	      		SobGroup_SobGroupAdd("SoleSurvivor"..playerIndex, "Player_Ships"..playerIndex)
	      		SoleSurvivor_StoreSurvivorShipType(playerIndex)
	      		print("Adding player"..playerIndex.."'s ship to sole survivor group, count: "..SobGroup_Count("SoleSurvivor"..playerIndex)..", type: "..SoleSurvivorType[playerIndex+1])
	      	end
	      end
	      SobGroup_Create("evac"..playerIndex) 
	      SobGroup_Create("evacs"..playerIndex) 
	      SobGroup_Create("lastevacs"..playerIndex)                                
	      SobGroup_Create("hgn_scout"..playerIndex)      
	      SobGroup_Create("hgn_interceptor"..playerIndex)                 
	      SobGroup_Create("hgn_attackbomber"..playerIndex)                 
	      SobGroup_Create("hgn_lbomber"..playerIndex)                     
	      SobGroup_Create("hgn_defender"..playerIndex)                         
	      SobGroup_Create("hgn_railgunfighter"..playerIndex)                    
	      SobGroup_Create("hgn_hft"..playerIndex)            
	      SobGroup_Create("hgn_attackbomberheavy"..playerIndex)
	      SobGroup_Create("hgn_strategicbomber"..playerIndex)
	      SobGroup_Create("hgn_interceptorl"..playerIndex)                 
	      SobGroup_Create("hgn_attackbomberl"..playerIndex)                 
	      SobGroup_Create("hgn_lbomberl"..playerIndex)                              
	      SobGroup_Create("hgn_railgunfighterl"..playerIndex)                    
	      SobGroup_Create("hgn_hftl"..playerIndex)            
	      SobGroup_Create("hgn_attackbomberheavyl"..playerIndex)
	      SobGroup_Create("hgn_strategicbomberl"..playerIndex)
	      SobGroup_Create("hgn_assaultcorvette"..playerIndex)                     
	      SobGroup_Create("hgn_pulsarcorvette"..playerIndex)   
        SobGroup_Create("hgn_torpedocorvette"..playerIndex)
        SobGroup_Create("hgn_bombervette"..playerIndex)       				
	      SobGroup_Create("hgn_minelayercorvette"..playerIndex)                   
	      SobGroup_Create("hgn_multiguncorvette"..playerIndex)
	      SobGroup_Create("hgn_gunshipcoevette"..playerIndex)
	      SobGroup_Create("hgn_cth"..playerIndex)     
	      SobGroup_Create("hgn_cthion"..playerIndex)	      
	      SobGroup_Create("hgn_assaultcorvettel"..playerIndex)                     
	      SobGroup_Create("hgn_pulsarcorvettel"..playerIndex)  
        SobGroup_Create("hgn_torpedocorvettel"..playerIndex)
        SobGroup_Create("hgn_bombervettel"..playerIndex)        				
	      SobGroup_Create("hgn_minelayercorvettel"..playerIndex)                   
	      SobGroup_Create("hgn_multiguncorvettel"..playerIndex)
	      SobGroup_Create("hgn_gunshipcoevettel"..playerIndex)
	      SobGroup_Create("hgn_cthl"..playerIndex)     
	      SobGroup_Create("hgn_cthionl"..playerIndex)                       
	      SobGroup_Create("hgn_assaultfrigate"..playerIndex)                        
	      SobGroup_Create("hgn_torpedofrigate"..playerIndex)                     
	      SobGroup_Create("hgn_lrms"..playerIndex)  
	      SobGroup_Create("hgn_defensefieldfrigate"..playerIndex)   
	      SobGroup_Create("hgn_marinefrigate"..playerIndex)
	      SobGroup_Create("hgn_marinefrigate_soban"..playerIndex)
	      SobGroup_Create("hgn_ioncannonfrigate"..playerIndex)     
	      SobGroup_Create("hgn_tulwar"..playerIndex)            
	      SobGroup_Create("hgn_mothership"..playerIndex)   
	      SobGroup_Create("hgn_researchstation"..playerIndex)   
	      SobGroup_Create("hgn_power"..playerIndex)  
	      SobGroup_Create("hgn_combatbase"..playerIndex) 
	      SobGroup_Create("hgn_crewstation"..playerIndex)            
	      SobGroup_Create("hgn_carrier"..playerIndex) 
	      SobGroup_Create("hgn_command_post1"..playerIndex)
	      SobGroup_Create("hgn_command_post2"..playerIndex)
	      SobGroup_Create("hgn_command_post3"..playerIndex)
	      SobGroup_Create("hgn_command_post4"..playerIndex)
	      SobGroup_Create("hgn_battlecarrier"..playerIndex) 
	      SobGroup_Create("hgn_scaver"..playerIndex) 
	      SobGroup_Create("hgn_lightcarrier"..playerIndex)                           
	      SobGroup_Create("hgn_shipyard"..playerIndex)
	      SobGroup_Create("hgn_shipyard_elohim"..playerIndex)
				SobGroup_Create("hgn_battleshipyard"..playerIndex) 
        SobGroup_Create("hgn_shipyard_g"..playerIndex)
        SobGroup_Create("hgn_dreadnaught"..playerIndex)
	      SobGroup_Create("hgn_battlecruiser"..playerIndex)
	      SobGroup_Create("hgn_battlecruiserNUKE"..playerIndex)
	      SobGroup_Create("hgn_vortex"..playerIndex) 
	      SobGroup_Create("hgn_minivortex"..playerIndex)
	      SobGroup_Create("hgn_battleship"..playerIndex) 
	      SobGroup_Create("hgn_tanker"..playerIndex)               
	      SobGroup_Create("hgn_spacecarrier"..playerIndex)
	      SobGroup_Create("hgn_destroyer"..playerIndex)  
	      SobGroup_Create("hgn_sweeperdestroyer"..playerIndex)     
	      SobGroup_Create("hgn_missiledestroyer"..playerIndex)                
	      SobGroup_Create("hgn_iondestroyer"..playerIndex)  
	      SobGroup_Create("hgn_advdestroyer"..playerIndex)  
	      SobGroup_Create("hgn_artillerydestroyer"..playerIndex)
	      SobGroup_Create("hgn_cruisera"..playerIndex)
	      SobGroup_Create("hgn_cruiserb"..playerIndex)  
	      SobGroup_Create("hgn_juggernaught"..playerIndex)     	               
	      SobGroup_Create("hgn_resourcecollector"..playerIndex)                   
	      SobGroup_Create("hgn_resourcecontroller"..playerIndex) 
	      SobGroup_Create("hgn_hscore"..playerIndex)  
	      SobGroup_Create("hgn_patcher"..playerIndex)   
	      SobGroup_Create("hgn_drone"..playerIndex)                  
	      SobGroup_Create("hgn_gunturret"..playerIndex)                   
	      SobGroup_Create("hgn_pulsarturret"..playerIndex)                
	      SobGroup_Create("hgn_ionturret"..playerIndex)  
	      SobGroup_Create("hgn_missileturret"..playerIndex)
	      SobGroup_Create("hgn_rts"..playerIndex)  
	      SobGroup_Create("hgn_defensefieldturret"..playerIndex)  
	      SobGroup_Create("hgn_sentinel"..playerIndex)  
	      SobGroup_Create("hgn_ionsentinel"..playerIndex) 
	      SobGroup_Create("hgn_artillerysentinel"..playerIndex) 
	      SobGroup_Create("hgn_massiveturret"..playerIndex)   	     	                   
	      SobGroup_Create("hgn_viper"..playerIndex)  
	      SobGroup_Create("hgn_minermissile"..playerIndex)
	      SobGroup_Create("hgn_minermissile1"..playerIndex)
				SobGroup_Create("vgr_minermissile"..playerIndex)
				SobGroup_Create("kad_minermissile"..playerIndex)
				SobGroup_Create("kad_jihadi"..playerIndex)
	      SobGroup_Create("hgn_nuclearbomb"..playerIndex)   
	      SobGroup_Create("hgn_nucleartube1"..playerIndex) 
	      SobGroup_Create("hgn_nucleartube2"..playerIndex) 
	      SobGroup_Create("hgn_nucleartube3"..playerIndex)      	                       
	      SobGroup_Create("hgn_tangomine"..playerIndex) 	      
	      SobGroup_Create("minetargetenemies"..playerIndex) 
	      SobGroup_Create("hgn_container"..playerIndex) 	  
	      SobGroup_Create("hgn_minecontainer"..playerIndex) 	       
	      SobGroup_Create("hgn_transportcell"..playerIndex)  
	      SobGroup_Create("hgn_probe"..playerIndex)    
			  SobGroup_Create("hgn_ecmprobe"..playerIndex)     			  
			  SobGroup_Create("hgn_proximitysensor"..playerIndex)   
			  SobGroup_Create("hgn_juggernaught_booster"..playerIndex)
			  SobGroup_Create("hgn_commandfortress"..playerIndex)  
			  SobGroup_Create("hgn_battlestation"..playerIndex) 			   
			  SobGroup_Create("hgn_ark"..playerIndex)  
			  SobGroup_Create("hgn_hyperspacestation"..playerIndex)    
			  SobGroup_Create("hgn_massshield"..playerIndex) 
			  SobGroup_Create("hgn_defenderdrone"..playerIndex) 
--Vaygr	           
	      SobGroup_Create("vgr_scout"..playerIndex)      
	      SobGroup_Create("vgr_interceptor"..playerIndex)                 
	      SobGroup_Create("vgr_lancefighter"..playerIndex)    
	      SobGroup_Create("vgr_heavyfighter"..playerIndex)               
	      SobGroup_Create("vgr_bioship"..playerIndex) 
	      SobGroup_Create("vgr_bomber"..playerIndex)
        SobGroup_Create("vgr_elitefighter"..playerIndex)
        SobGroup_Create("vgr_missilebomber"..playerIndex)
	      SobGroup_Create("vgr_defender"..playerIndex)                         
	      SobGroup_Create("vgr_missilecorvette"..playerIndex)                    
	      SobGroup_Create("vgr_lasercorvette"..playerIndex)   
        SobGroup_Create("vgr_plasmacorvette"..playerIndex)     				
	      SobGroup_Create("vgr_minelayercorvette"..playerIndex)                     
	      SobGroup_Create("vgr_commandcorvette"..playerIndex)               
	      SobGroup_Create("vgr_standvette"..playerIndex)                   
	      SobGroup_Create("vgr_multilancecorvette"..playerIndex)    
				SobGroup_Create("vgr_mortarcorvette"..playerIndex)    
	      SobGroup_Create("vgr_striker"..playerIndex)                     
	      SobGroup_Create("vgr_heavymissilefrigate"..playerIndex)                     
	      SobGroup_Create("vgr_assaultfrigate"..playerIndex)      
        SobGroup_Create("vgr_advassaultfrigate"..playerIndex)     				
	      SobGroup_Create("vgr_infiltratorfrigate"..playerIndex)  
        SobGroup_Create("vgr_supportfrigate"..playerIndex)	
        SobGroup_Create("vgr_supportfrigate_laser"..playerIndex)
        SobGroup_Create("vgr_supportfrigatearmed"..playerIndex)				
	      SobGroup_Create("vgr_artilleryfrigate"..playerIndex)  
				SobGroup_Create("vgr_longrangeartilleryfrigate"..playerIndex)  
	      SobGroup_Create("vgr_empfrigate"..playerIndex)              
	      SobGroup_Create("vgr_commandfrigate"..playerIndex)
	      SobGroup_Create("vgr_mothership"..playerIndex)
	      SobGroup_Create("vgr_mothership_makaan"..playerIndex)
	      SobGroup_Create("vgr_carrier"..playerIndex)     
	      SobGroup_Create("vgr_command_post1"..playerIndex)
	      SobGroup_Create("vgr_command_post2"..playerIndex)
	      SobGroup_Create("vgr_command_post3"..playerIndex)
	      SobGroup_Create("vgr_command_post4"..playerIndex)   
        SobGroup_Create("vgr_battlecarrier"..playerIndex)        				
	      SobGroup_Create("vgr_shipyard"..playerIndex)                    
	      SobGroup_Create("vgr_battlecruiser"..playerIndex)
	      SobGroup_Create("vgr_battlecruiser_hero"..playerIndex)
	      SobGroup_Create("vgr_missilebattlecruiser"..playerIndex)
	      SobGroup_Create("vgr_sinner"..playerIndex)
	      SobGroup_Create("vgr_heavycruiser"..playerIndex)
	      SobGroup_Create("vgr_alkhalid"..playerIndex)
	      SobGroup_Create("vgr_battleship"..playerIndex)
	      SobGroup_Create("vgr_missledreadnaught"..playerIndex)
	      SobGroup_Create("vgr_dreadnaught"..playerIndex)     
	      SobGroup_Create("vgr_dreadnaughtB"..playerIndex)
	      SobGroup_Create("vgr_artillerybattlecruiser"..playerIndex)
	      SobGroup_Create("kpr_sajuuk_nosensors"..playerIndex)
	      SobGroup_Create("vgr_planetkiller"..playerIndex)
	      SobGroup_Create("vgr_commandfortress"..playerIndex)
	      SobGroup_Create("vgr_superbattleship"..playerIndex)
	      SobGroup_Create("vgr_destroyer"..playerIndex)  
	      SobGroup_Create("vgr_hammerhead"..playerIndex)
				SobGroup_Create("vgr_pulsedestroyer"..playerIndex)  
	      SobGroup_Create("vgr_am"..playerIndex)   
	      SobGroup_Create("vgr_cruiser"..playerIndex)    
        SobGroup_Create("vgr_lightcruiser"..playerIndex)
        SobGroup_Create("vgr_lightcruiser_gun"..playerIndex)
        SobGroup_Create("vgr_artilleryship"..playerIndex)          				
	      SobGroup_Create("vgr_resourcecollector"..playerIndex)                   
	      SobGroup_Create("vgr_resourcecontroller"..playerIndex)  
        SobGroup_Create("vgr_resourcecontrollerdouble"..playerIndex)  
        SobGroup_Create("vgr_scaver"..playerIndex)   				
	      SobGroup_Create("vgr_weaponplatform_gun"..playerIndex)                   
	      SobGroup_Create("vgr_weaponplatform_lance"..playerIndex)
	      SobGroup_Create("vgr_weaponplatform_missile"..playerIndex)  	             
	      SobGroup_Create("vgr_hyperspace_platform"..playerIndex)      	      
	      SobGroup_Create("vgr_mobile_inhibitor"..playerIndex)
	      SobGroup_Create("vgr_cloakplatform"..playerIndex)
	      SobGroup_Create("vgr_container"..playerIndex) 	     
	      SobGroup_Create("vgr_minecontainer"..playerIndex)   
	      SobGroup_Create("vgr_minelayerdrone"..playerIndex)
	      SobGroup_Create("vgr_probe"..playerIndex)    
			  SobGroup_Create("vgr_probe_ecm"..playerIndex)
			  SobGroup_Create("vgr_probe_smallhsbeacon"..playerIndex)
			  SobGroup_Create("vgr_probe_prox"..playerIndex)
			  SobGroup_Create("vgr_patcher"..playerIndex)
			  SobGroup_Create("vgr_mobile_inhibitor_well"..playerIndex)
				SobGroup_Create("vgr_nuclearbomb"..playerIndex)
--Kadeshi
	      SobGroup_Create("kad_command_post1"..playerIndex)
	      SobGroup_Create("kad_command_post2"..playerIndex)
	      SobGroup_Create("kad_command_post3"..playerIndex)
	      SobGroup_Create("kad_command_post4"..playerIndex)
				SobGroup_Create("kad_advancedswarmer"..playerIndex)
				SobGroup_Create("kad_advancedswarmer_old"..playerIndex)
				SobGroup_Create("kad_heavyswarmer_new"..playerIndex)
				SobGroup_Create("kad_pulsarswarmer"..playerIndex)
				SobGroup_Create("kad_swarmer_blood"..playerIndex) 
				SobGroup_Create("kad_swarmer_crusader"..playerIndex)
				SobGroup_Create("kad_swarmer_ghost"..playerIndex)
				SobGroup_Create("kad_swarmer_hybrid"..playerIndex)
				SobGroup_Create("kad_swarmer_new"..playerIndex)
				SobGroup_Create("kad_swarmer_zealot"..playerIndex)
				SobGroup_Create("kad_gunpod"..playerIndex)
				SobGroup_Create("kad_ionpod"..playerIndex)
				SobGroup_Create("kad_missilepod"..playerIndex)
				SobGroup_Create("kad_pod_ghost"..playerIndex)
				SobGroup_Create("kad_prayerpod"..playerIndex)
				SobGroup_Create("kad_sensorpod"..playerIndex)
				SobGroup_Create("kad_frig_ghost"..playerIndex)
				SobGroup_Create("kad_multibeam"..playerIndex)
				SobGroup_Create("kad_multibeam_new"..playerIndex)
				SobGroup_Create("kad_multigun"..playerIndex)
				SobGroup_Create("kad_podship"..playerIndex)
				SobGroup_Create("kad_needleship"..playerIndex)
				SobGroup_Create("kad_destroyer"..playerIndex)
				SobGroup_Create("kad_destroyer_real"..playerIndex)
				SobGroup_Create("kad_custodian"..playerIndex)
				SobGroup_Create("kad_nebuladrone"..playerIndex)  
				SobGroup_Create("kad_snail"..playerIndex)  
				SobGroup_Create("kad_ressourcecollector"..playerIndex)
				SobGroup_Create("kad_container"..playerIndex)
				SobGroup_Create("kad_minecontainer"..playerIndex)
				SobGroup_Create("kad_nuclearbomb"..playerIndex)
--Raider
	      SobGroup_Create("rad_command_post1"..playerIndex)
	      SobGroup_Create("rad_command_post2"..playerIndex)
	      SobGroup_Create("rad_command_post3"..playerIndex)
	      SobGroup_Create("rad_command_post4"..playerIndex)
				SobGroup_Create("rad_merc_fighter"..playerIndex)
				SobGroup_Create("rad_merc_interceptor"..playerIndex)
				SobGroup_Create("rad_merc_bomber"..playerIndex)
				SobGroup_Create("rad_merc_scout"..playerIndex)
				SobGroup_Create("rad_bomber"..playerIndex)
				SobGroup_Create("rad_elitefighter"..playerIndex)
				SobGroup_Create("rad_fencer"..playerIndex) 
				SobGroup_Create("rad_interceptor"..playerIndex)
				SobGroup_Create("rad_interceptor_black"..playerIndex)
				SobGroup_Create("rad_merc_corvette"..playerIndex)
				SobGroup_Create("rad_scoutcorvette"..playerIndex)
				SobGroup_Create("rad_guncorvette"..playerIndex)
				SobGroup_Create("rad_empcorvette"..playerIndex)
				SobGroup_Create("rad_missilecorvette"..playerIndex) 
				SobGroup_Create("rad_jackal"..playerIndex)
				SobGroup_Create("rad_beamfrigate"..playerIndex)
				SobGroup_Create("rad_gattlingfrigate"..playerIndex)
				SobGroup_Create("rad_gunfrigate"..playerIndex)
				SobGroup_Create("rad_gunfrigate_morgan"..playerIndex)
				SobGroup_Create("rad_merc_frigate"..playerIndex)
				SobGroup_Create("rad_merc_frigateadv"..playerIndex)
				SobGroup_Create("rad_merc_ioncannonfrigate"..playerIndex)
				SobGroup_Create("rad_missilefrigate"..playerIndex)
				SobGroup_Create("rad_mothership"..playerIndex)
				SobGroup_Create("rad_carrier"..playerIndex)
				SobGroup_Create("rad_carrier_black"..playerIndex)
				SobGroup_Create("rad_scaffolda"..playerIndex)
				SobGroup_Create("rad_scaffoldB"..playerIndex)
				SobGroup_Create("rad_merc_cruiser"..playerIndex)
				SobGroup_Create("rad_refurbisheddestroyer"..playerIndex)
				SobGroup_Create("rad_cruiser"..playerIndex)
				SobGroup_Create("rad_cruiser_queen"..playerIndex)
				SobGroup_Create("rad_cruiserscaffolda"..playerIndex)
				SobGroup_Create("rad_cruiser_queenscaffolda"..playerIndex)
				SobGroup_Create("rad_destroyer"..playerIndex)
				SobGroup_Create("rad_scud"..playerIndex)
				SobGroup_Create("rad_helios"..playerIndex)
				SobGroup_Create("rad_vanaarjet"..playerIndex)
				SobGroup_Create("rad_qwaarjetii"..playerIndex)
				SobGroup_Create("rad_merc_battlecruiser"..playerIndex)
				SobGroup_Create("rad_destroyerscaffolda"..playerIndex)
				SobGroup_Create("rad_scudscaffolda"..playerIndex)
				SobGroup_Create("rad_explotrap"..playerIndex)  
				SobGroup_Create("rad_gravwel"..playerIndex)				                       
				SobGroup_Create("rad_hsbouey"..playerIndex)
				SobGroup_Create("rad_guntrap"..playerIndex) 
				SobGroup_Create("rad_resourcecollector"..playerIndex)
				SobGroup_Create("rad_resourcecontroller"..playerIndex)
				SobGroup_Create("rad_container"..playerIndex)
				SobGroup_Create("rad_minecontainer"..playerIndex)
				SobGroup_Create("rad_powerstation"..playerIndex)
				SobGroup_Create("rad_blackmarket"..playerIndex)
				SobGroup_Create("rad_armsdealer"..playerIndex)
				
				--keeper new function
				for z, iCount in ship_list.kpr do
					local shipname = iCount.name
					SobGroup_Create(shipname..playerIndex)
				end
				SobGroup_Create("KeeperSpawnShips_Global_SOB")
				SobGroup_Create("Keeper_HasShields_SOB")
				SobGroup_Create("Keeper_PhaseBubble_SOB")
				SobGroup_Create("Keeper_PhasedOut")
				
				--ships from crates
				for z, iCount in ship_list.meg do
					local shipname = iCount.name
					SobGroup_Create(shipname..playerIndex)
				end
				
				--SP Mission
				SobGroup_Create("kpr_mover_capture"..playerIndex)
				SobGroup_Create("kpr_destroyerm10"..playerIndex)
				
--Player class			  
			  SobGroup_Create("fighters"..playerIndex)
			  SobGroup_Create("lastfighters"..playerIndex)  			   			  
			  SobGroup_Create("corvettes"..playerIndex) 	
			  SobGroup_Create("lastcorvettes"..playerIndex)		      
			  SobGroup_Create("tangos"..playerIndex)
			  SobGroup_Create("lasttangos"..playerIndex)  			  		  				  				  			  				  
			  SobGroup_Create("frigates"..playerIndex)
			  SobGroup_Create("platforms"..playerIndex)
			  SobGroup_Create("utilities"..playerIndex)   	  	
			  SobGroup_Create("others"..playerIndex) 
			  SobGroup_Create("lastothers"..playerIndex) 		
			  SobGroup_Create("othersnoparade"..playerIndex) 
			  SobGroup_Create("lastothersnoparade"..playerIndex) 			  
			  SobGroup_Create("smallcapitals"..playerIndex)  
			  SobGroup_Create("juggernaughts"..playerIndex)
			  SobGroup_Create("TerritoryGates"..playerIndex)
--Special player class	
	      SobGroup_Create("hgn_ALLdestroyers"..playerIndex)		--all hiigaran destroyers
	      SobGroup_Create("hgn_dummy"..playerIndex)
	      SobGroup_Create("vgr_ALLsmokers"..playerIndex)		--all vaygr destroyers with smoke screen
	      SobGroup_Create("vgr_dummy"..playerIndex)
	      SobGroup_Create("SOB_SpawnWithoutCPU"..playerIndex)	--remove CPU at spawn to prevent 00000000 crash, then gradually add CPU back
--General class         	
        SobGroup_Create("productioncapital"..playerIndex)   
        SobGroup_Create("lastproductioncapital"..playerIndex)          	    	                
        SobGroup_Create("targetmegalith"..playerIndex)    
        SobGroup_Create("capturer"..playerIndex)            
        SobGroup_Create("repairer"..playerIndex)  
        SobGroup_Create("trader"..playerIndex)  				
        SobGroup_Create("evacuater"..playerIndex) 
        SobGroup_Create("parader"..playerIndex)
        SobGroup_Create("shipwreck"..playerIndex)	--captured ship wrecks
--Megalith	       
	      SobGroup_Create("meg_gehenna_1ctm"..playerIndex)	   
        SobGroup_Create("meg_gehenna_3ctm"..playerIndex)	   				
	      SobGroup_Create("meg_balcoragate"..playerIndex)   
	      SobGroup_Create("meg_dreadnaughtberth"..playerIndex)    
        SobGroup_Create("meg_tanis"..playerIndex)    				
        SobGroup_Create("meg_engineeringbay"..playerIndex)
        SobGroup_Create("meg_reinforcementpad"..playerIndex)
        --SobGroup_Create("meg_carrier_huge"..playerIndex)
        SobGroup_Create("aircombat_jets"..playerIndex)
        SobGroup_Create("aircombat_fighterjets"..playerIndex)
        SobGroup_Create("aircombat_strikecraft"..playerIndex)
        SobGroup_Create("aircombat_bombers"..playerIndex)
        SobGroup_Create("aircombat_specialplanes"..playerIndex)
        SobGroup_Create("aircombat_herofighter"..playerIndex)
        SobGroup_Create("aircombat_herostriker"..playerIndex)
        SobGroup_Create("derelictbattleships"..playerIndex)
        SobGroup_Create("meg_mandator_star_dreadnought"..playerIndex)
        SobGroup_Create("meg_titan_cruiser"..playerIndex)
        SobGroup_Create("meg_hvdreadnaught"..playerIndex)
        SobGroup_Create("meg_executor_ssd"..playerIndex)
        SobGroup_Create("meg_bentus"..playerIndex)
        SobGroup_Create("meg_dummy_researchbooster"..playerIndex)
        SobGroup_Create("meg_bentusiexchange"..playerIndex)
        SobGroup_Create("meg_ghostship"..playerIndex)
--Juggernaught	                 
	      SobGroup_Create("targetjuggernaughts"..playerIndex)  	      	      
--Class enemies/allies	
        SobGroup_Create("enemies"..playerIndex)    
	      SobGroup_Create("allies"..playerIndex)        
	      SobGroup_Create("AllToHelp"..playerIndex)
	      SobGroup_Create("AllAccessibleTerritoryGates"..playerIndex)
	      SobGroup_Create("fighterenemies"..playerIndex) 	      
	      SobGroup_Create("corvetteenemies"..playerIndex)  
	      SobGroup_Create("frigateenemies"..playerIndex) 	      
	      SobGroup_Create("smallcapitalenemies"..playerIndex)  
	      SobGroup_Create("juggernaughtenemies"..playerIndex)  
	      SobGroup_Create("nuclearbombenemies"..playerIndex)
	      SobGroup_Create("nucleartubeenemies"..playerIndex)
	      SobGroup_Create("lightgranuleenemies"..playerIndex)
	      SobGroup_Create("jihadiswarmerenemies"..playerIndex)
	      SobGroup_Create("commandfortressenemies"..playerIndex) 	      
	      SobGroup_Create("bigcapitalenemies"..playerIndex) 
	      SobGroup_Create("fighterallies"..playerIndex)
	      SobGroup_Create("corvetteallies"..playerIndex)
	      SobGroup_Create("frigateallies"..playerIndex) 	      
	      SobGroup_Create("smallcapitalallies"..playerIndex)  
	      SobGroup_Create("bigcapitalallies"..playerIndex) 	
	      SobGroup_Create("repairingallies"..playerIndex) 	     
	      SobGroup_Create("productioncapitalallies"..playerIndex) 	 
	      SobGroup_Create("lastproductioncapitalallies"..playerIndex)    
	      SobGroup_Create("massshieldenemies"..playerIndex) 
	      SobGroup_Create("orbitalstationallies"..playerIndex) 
        SobGroup_Create("traderallies"..playerIndex)
        SobGroup_Create("shipwreckallies"..playerIndex)
				SobGroup_Create("megalithtocapture"..playerIndex)
				--SobGroup_SetSwitchOwnerFlag("megalithtocapture"..playerIndex, 0)	--no longer needed because the AI capture megalith function fills this group with groups that already have flag=0
--Deep Space Telemetry
        SobGroup_Create("computerhack"..playerIndex)
--Fleet Selector
        SobGroup_Create("selector"..playerIndex)
        SobGroup_Create("haxor_invincible"..playerIndex)
        SobGroup_Create("haxor_inhyperspace"..playerIndex)
        SobGroup_Create("haxor_inhyperspace_debug"..playerIndex)
        SobGroup_Create("haxor_hyperspaceIntermediate"..playerIndex)
        SobGroup_Create("haxor_ai"..playerIndex)
--Drive Mode
				SobGroup_Create("DriveMode_SOB"..playerIndex)
--AI hyperspace warfare
				SobGroup_Create("SOB_DummyHSGatesAroundPlayer"..playerIndex)
				SobGroup_SetSwitchOwnerFlag("SOB_DummyHSGatesAroundPlayer"..playerIndex, 0)	--moved from ai.lua to here to debug the 00000010 crash
--Endgame Crisis
				SobGroup_Create("SOB_PlayerGhosts"..playerIndex)
				SobGroup_Create("SOB_CrisisTargets"..playerIndex)
				SobGroup_Create("SOB_CrisisCapitalTargets"..playerIndex)
--Survival Mode
				SobGroup_Create("SOB_PlayerWaves"..playerIndex)
--autorepair f/c/c        
        SobGroup_Create("fcdocker"..playerIndex)
        SobGroup_Create("cdocker"..playerIndex)
        SobGroup_Create("temp_acceptingfcdock"..playerIndex)
--Supporters
        SobGroup_Create("supporter"..playerIndex)
        --SobGroup_SetInvulnerability("supporter"..playerIndex, 1)
        SobGroup_MakeUntargeted("supporter"..playerIndex)
        local supporter_spawned = 0
        if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "supporter") == 0 then		--for single player mission, this prevents spawning multiple supporters from level to level, just in case!
        	SobGroup_SpawnNewShipInSobGroup(playerIndex, "supporter", "supporter", "supporter"..playerIndex, "up"..playerIndex)
        	supporter_spawned = 1
        else
        	SobGroup_FillShipsByType("supporter"..playerIndex, "Player_Ships"..playerIndex, "supporter")
        	supporter_spawned = 1
        end
        if supporter_spawned == 1 then
        	if GameRulesName == "Simplex Sole Survivor" then
	        	for z, iCount in SoleSurvivorStats do
							SobGroup_CreateSubSystem("supporter"..playerIndex, iCount[1])
							SobGroup_SetHardPointHealth("supporter"..playerIndex, iCount[1], 0)
						end
					end
        end
    	end   
		end 
		playerIndex = playerIndex + 1  
	end	   
	SobGroup_Create("AllShips")
---planet/star
  SobGroup_Create("star_sol")
---crates
  SobGroup_Create("meg_crate")
---megalith/battlearena
  SobGroup_Create ("megalithnoowner")
	SobGroup_Create ("megalitenoowner")
	SobGroup_Create ("debrisnoowner")
	SobGroup_Create("bas0") 
	SobGroup_Create("bas1")
	SobGroup_Create("all_capturablemegaliths")
--Selection
  SobGroup_Create("selected") 
  SobGroup_Create("selectedCinematic")   
--Cinematic	      
  SobGroup_Create("focus")
  SobGroup_Create("focusalt")
  SobGroup_Create("tempcinematic") 
--Explosion damage/Experience/Weight/KeepPosition 
  SobGroup_Create("motherships")    
  SobGroup_Create("lastmotherships")     
  SobGroup_Create("shipyards")    
  SobGroup_Create("lastshipyards")      
  SobGroup_Create("carriers")      
  SobGroup_Create("lastcarriers")    
  SobGroup_Create("battlecruisers")     
  SobGroup_Create("lastbattlecruisers")      
  SobGroup_Create("juggernaughts")    
  SobGroup_Create("lastjuggernaughts")  
  SobGroup_Create("nuclearbombs")    
  SobGroup_Create("lastnuclearbombs")  
  SobGroup_Create("all_fighters")
  SobGroup_Clear("all_fighters")
  SobGroup_Create("all_corvettes")
  SobGroup_Clear("all_corvettes")
  SobGroup_Create("productioncapitals")
  SobGroup_Clear("productioncapitals")
  SobGroup_Create("all_supporters")
  SobGroup_Clear("all_supporters")
  SobGroup_Create("frigates")     
  SobGroup_Create("lastfrigates")      
  SobGroup_Create("destroyers")     
  SobGroup_Create("lastdestroyers") 
  SobGroup_Create("platforms")
	SobGroup_Create("lastplatforms")  	     
  SobGroup_Create("minecontainers")     
  SobGroup_Create("lastminecontainers")      
  SobGroup_Create("containers")     
  SobGroup_Create("lastcontainers")      
  SobGroup_Create("miningbases")     
  SobGroup_Create("lastminingbases")      
  SobGroup_Create("researchstations")         
  SobGroup_Create("lastresearchstations")  
  SobGroup_Create("powerstations")    
  SobGroup_Create("lastpowerstations")
  SobGroup_Create("weaponstations")    
  SobGroup_Create("lastweaponstations")
  SobGroup_Create("crewstations")     
  SobGroup_Create("lastcrewstations")      
  SobGroup_Create("commandfortresses")     
  SobGroup_Create("lastcommandfortresses")   
  SobGroup_Create("hyperspacestations")     
  SobGroup_Create("lasthyperspacestations")      
  SobGroup_Create("mobilerefineries")   
  SobGroup_Create("lastmobilerefineries")   
  SobGroup_Create("resourcecollectors")
  SobGroup_Create("lastresourcecollectors")  
  SobGroup_Create("proximityenemiesjuggernaughts")
  SobGroup_Create("proximityalliesjuggernaughts")
--special
	SobGroup_Create("ECM_immune")
--Endgame Crisis
	SobGroup_Create("SOB_EndgameCrisis")
	SobGroup_Create("SOB_MeteorShower")
  SobGroup_Create("ghosts")
  SobGroup_Create("lastghosts")
--Haxor
	SobGroup_Create("haxor_all_invincibleships")
	SobGroup_Create("haxor_all_shipswithoutai")
--Shipwreck
	SobGroup_Create("all_ships_with_wreck")
	SobGroup_Create("all_shipwreck")
	SobGroup_SetSwitchOwnerFlag("all_shipwreck", 0)	--allows wreck to be still checked by the RemoveShipwreckCheck() function even after it's transferred to a player
	SobGroup_Create("all_radiationwreck")
	--add all ships that can spawn shipwreck to a smaller list to save computing power
	local GenerateShipRelationInShiplist = function(shiplist_race)
		local n_wreckspawn_list = getn(wreck_list.shipname)
		local n_buildlimit_list = getn(BuildLimit_list.shipname)
		for z, iCount in ship_list[shiplist_race] do
			if iCount.WreckSpawnTime ~= nil then	--generate the wreck spawn list
				n_wreckspawn_list = n_wreckspawn_list + 1
				wreck_list.shipname[n_wreckspawn_list] = iCount.name
				wreck_list.spawntime[n_wreckspawn_list] = iCount.WreckSpawnTime
			end
			if iCount.BuildLimit ~= nil then	--generate the build limit list
				n_buildlimit_list = n_buildlimit_list + 1
				BuildLimit_list.shipname[n_buildlimit_list] = iCount.name
				BuildLimit_list.limit[n_buildlimit_list] = iCount.BuildLimit
				BuildLimit_list.race[n_buildlimit_list] = shiplist_race
			end
		end
	end
	Table_Apply(ship_races, GenerateShipRelationInShiplist)
	print("Shipwreck system initialized! Types of ships capable of spawning wreck: "..getn(wreck_list.shipname))
--AI hyperspace warfare
	SobGroup_Create("SOB_AllDummyHSGates")
	SobGroup_SetSwitchOwnerFlag("SOB_AllDummyHSGates", 0)	--moved from ai.lua to here to debug the 00000010 crash
--Explosion Bags  
  for i = 0,2,1 do    
    SobGroup_Create("MothershipExpBag"..i)
    SobGroup_Create("PowerStationExpBag"..i)
    --SobGroup_Create("ResearchStationExpBag"..i)
    --SobGroup_Create("CrewStationExpBag"..i)
    --SobGroup_Create("CarrierExpBag"..i)
    SobGroup_Create("ShipyardExpBag"..i)
    SobGroup_Create("CommandFortressExpBag"..i)   
    --SobGroup_Create("MiningBaseExpBag"..i)       
    SobGroup_Create("HyperspaceStationExpBag"..i) 
    SobGroup_Create("NuclearBombExpBag"..i)        
  end         
  for i = 0,5,1 do
    --SobGroup_Create("DestroyerExpBag"..i)      
    --SobGroup_Create("BattlecruiserExpBag"..i)  
    SobGroup_Create("JuggernaughtExpBag"..i)      
  end    
  for i = 0,8,1 do    
    SobGroup_Create("JuggernaughtExpBag"..i)      
  end        
--Trade/Transport Cell  
  SobGroup_Create("gehennacollectors")      
  SobGroup_Create("splitcapturers0")
  SobGroup_Create("splitcollectors0")
--SplitGroup    
  SobGroup_Create("splitter")
  if SobGroup_Empty("splitter") == 1 then
  	--determine splitter spawn location based on player symmetry
  	local symmetry = {0,0,0}	--measures the symmetry of player locations
  	local apogee = {0,0,0}	--measures the eccentricity of the player distribution (is it elongated in any particular axis)
  	local perigee = {-1,-1,-1}	--measures the scale of the player distribution (min distance to the map center)
  	for i = 0, Universe_PlayerCount()-1 do
			if SobGroup_Empty("Player_Ships"..i) == 0 then
				local pos = SobGroup_GetPosition("Player_Ships"..i)
				for t=1,3,1 do
					symmetry[t] = symmetry[t] + pos[t]
					if abs(pos[t]) > apogee[t] then
						apogee[t] = abs(pos[t])
					end
					if abs(pos[t]) < perigee[t] or perigee[t] == -1 then
						perigee[t] = abs(pos[t])
					end
				end
			end
		end
		local bias={0,0,0}
		local tolerance = 6000
		local scale_reference = 23000 --player xyz coordinates in typical maps
		local mean_apogee = Vector_mean(apogee)
		for t=1,3,1 do
			local bias_symmetry = tolerance/(abs(symmetry[t])+1) + tolerance	--more symmetric player distribution will add more bias to the spliiter spawn location
			local bias_elongate = (apogee[t]+1)/(mean_apogee+1)	--elongate the longer axis to make splitting easier
			local bias_scale = abs((apogee[t]-perigee[t]+1)/scale_reference)
			bias[t] = bias_scale*bias_elongate*(bias_symmetry) + random_pseudo(-100,100)
		end
  	Volume_AddSphere("VOL_SplitterAtCenter", {bias[1], bias[2], bias[3]}, 10)
	  SobGroup_SpawnNewShipInSobGroup(-1, "splitter", "splitter", "splitter", "VOL_SplitterAtCenter")		--"centre"
	  SobGroup_SetInvulnerability("splitter", 1)
	  print("Splitter added at location: "..Vector_tostring(bias))	--..", symmetry: "..Vector_tostring(symmetry)..", apogee: "..Vector_tostring(apogee)..", perigee: "..Vector_tostring(perigee)
	end
  SobGroup_Create ("TempSobGroup") 
  SobGroup_Create ("TempSobGroup1")  
  SobGroup_Create ("temp")
  SobGroup_Create ("temp0")
  SobGroup_Create ("temp1")  
  SobGroup_Create ("temp2") 
  SobGroup_Create ("temp3")
  SobGroup_Create ("temp4")
  SobGroup_Create ("temp5")	
  SobGroup_Create ("temp10")
  SobGroup_Create ("temp11")  
  SobGroup_Create ("temp12") 
  SobGroup_Create ("temp13")
  SobGroup_Create ("temp14")
  SobGroup_Create ("temp15")
  SobGroup_Create("invulnerable")
  Rule_Remove("sobgroupscreate")
end  

function sobgroups()
	if Temp_GlobalVariable.SobSave > Sobgroup_Runtimes then		--one runtime for filling each race, plus one runtime dedicated for general task
		Temp_GlobalVariable.SobSave = 1
	end
	--print("sobgroups -- Start, SobSave = "..Temp_GlobalVariable.SobSave)
  local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) >= 0 then		-- ==1
---rigenera supporter in caso venga distrutto, da testare
				local supporter_spawned = 0
        if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "supporter") == 0 then
        	if Temp_GlobalVariable.SobSave == 1 then
          	SobGroup_SpawnNewShipInSobGroup(playerIndex, "supporter", "supporter", "supporter"..playerIndex, "up"..playerIndex)
          	supporter_spawned = 1
          else		--collision debug, spawn at other locations
          	Volume_AddSphere("VOL_RandomSupporter"..playerIndex, {random_pseudo(-680000,680000),random_pseudo(-350000,350000),100+random_pseudo(-680000,680000)}, 10)
          	SobGroup_SpawnNewShipInSobGroup(playerIndex, "supporter", "supporter", "supporter"..playerIndex, "VOL_RandomSupporter"..playerIndex)
          	Volume_Delete("VOL_RandomSupporter"..playerIndex)
          	supporter_spawned = 1
          end
        elseif SobGroup_Empty("supporter"..playerIndex) == 1 then
        	SobGroup_FillShipsByType("supporter"..playerIndex, "Player_Ships"..playerIndex, "supporter")
        	supporter_spawned = 1
        end
        if supporter_spawned == 1 then
        	if GameRulesName == "Simplex Sole Survivor" then
	        	for z, iCount in SoleSurvivorStats do
							SobGroup_CreateSubSystem("supporter"..playerIndex, iCount[1])
							SobGroup_SetHardPointHealth("supporter"..playerIndex, iCount[1], 0)
						end
					end
        end
---Make supporters untargeted
				if SobGroup_Empty("supporter"..playerIndex) == 0 then
        	SobGroup_MakeUntargeted("supporter"..playerIndex)
        end
----SOBGROUPS COUNTER                                                                      
				
				if Temp_GlobalVariable.SobSave == 1 then
	---ships x hig      
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "hgn_massshield")  	 
	        SobGroup_SobGroupAdd("hgn_massshield"..playerIndex, "temp")
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "hgn_massshield1")  	 
	        SobGroup_SobGroupAdd("hgn_massshield"..playerIndex, "temp")
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "hgn_massshield2")  	 
	        SobGroup_SobGroupAdd("hgn_massshield"..playerIndex, "temp")           
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "hgn_massshield3")  	 
	        SobGroup_SobGroupAdd("hgn_massshield"..playerIndex, "temp")                                    
		      SobGroup_FillShipsByType("evac"..playerIndex, "Player_Ships"..playerIndex, "evac")
		      SobGroup_FillShipsByType("hgn_scout"..playerIndex, "Player_Ships"..playerIndex, "hgn_scout")                     
		      SobGroup_FillShipsByType("hgn_interceptor"..playerIndex, "Player_Ships"..playerIndex, "hgn_interceptor")         
		      SobGroup_FillShipsByType("hgn_attackbomber"..playerIndex, "Player_Ships"..playerIndex, "hgn_attackbomber")             
		      SobGroup_FillShipsByType("hgn_defender"..playerIndex, "Player_Ships"..playerIndex, "hgn_defender")                    
		      SobGroup_FillShipsByType("hgn_lbomber"..playerIndex, "Player_Ships"..playerIndex, "hgn_lbomber")                 
		      SobGroup_FillShipsByType("hgn_railgunfighter"..playerIndex, "Player_Ships"..playerIndex, "hgn_railgunfighter")         
		      SobGroup_FillShipsByType("hgn_hft"..playerIndex, "Player_Ships"..playerIndex, "hgn_hft")  
		      SobGroup_FillShipsByType("hgn_attackbomberheavy"..playerIndex, "Player_Ships"..playerIndex, "hgn_attackbomberheavy")
		      SobGroup_FillShipsByType("hgn_strategicbomber"..playerIndex, "Player_Ships"..playerIndex, "hgn_strategicbomber")
		      SobGroup_FillShipsByType("hgn_interceptorl"..playerIndex, "Player_Ships"..playerIndex, "hgn_interceptorl")         
		      SobGroup_FillShipsByType("hgn_attackbomberl"..playerIndex, "Player_Ships"..playerIndex, "hgn_attackbomberl") 	                   
		      SobGroup_FillShipsByType("hgn_lbomberl"..playerIndex, "Player_Ships"..playerIndex, "hgn_lbomberl")                 
		      SobGroup_FillShipsByType("hgn_railgunfighterl"..playerIndex, "Player_Ships"..playerIndex, "hgn_railgunfighterl")         
		      SobGroup_FillShipsByType("hgn_hftl"..playerIndex, "Player_Ships"..playerIndex, "hgn_hftl")  
		      SobGroup_FillShipsByType("hgn_attackbomberheavyl"..playerIndex, "Player_Ships"..playerIndex, "hgn_attackbomberheavyl")
		      SobGroup_FillShipsByType("hgn_strategicbomberl"..playerIndex, "Player_Ships"..playerIndex, "hgn_strategicbomberl")
		      SobGroup_FillShipsByType("hgn_assaultcorvette"..playerIndex, "Player_Ships"..playerIndex, "hgn_assaultcorvette")         
		      SobGroup_FillShipsByType("hgn_pulsarcorvette"..playerIndex, "Player_Ships"..playerIndex, "hgn_pulsarcorvette")   
		      SobGroup_FillShipsByType("hgn_torpedocorvette"..playerIndex, "Player_Ships"..playerIndex, "hgn_torpedocorvette")
	        SobGroup_FillShipsByType("hgn_bombervette"..playerIndex, "Player_Ships"..playerIndex, "hgn_bombervette")   				
		      SobGroup_FillShipsByType("hgn_minelayercorvette"..playerIndex, "Player_Ships"..playerIndex, "hgn_minelayercorvette")     
		      SobGroup_FillShipsByType("hgn_multiguncorvette"..playerIndex, "Player_Ships"..playerIndex, "hgn_multiguncorvette")
		      SobGroup_FillShipsByType("hgn_gunshipcoevette"..playerIndex, "Player_Ships"..playerIndex, "hgn_gunshipcoevette")
		      SobGroup_FillShipsByType("hgn_cth"..playerIndex, "Player_Ships"..playerIndex, "hgn_cth")
		      SobGroup_FillShipsByType("hgn_cthion"..playerIndex, "Player_Ships"..playerIndex, "hgn_cthion")  	      
		      SobGroup_FillShipsByType("hgn_assaultcorvettel"..playerIndex, "Player_Ships"..playerIndex, "hgn_assaultcorvettel")         
		      SobGroup_FillShipsByType("hgn_pulsarcorvettel"..playerIndex, "Player_Ships"..playerIndex, "hgn_pulsarcorvettel")    	
	        SobGroup_FillShipsByType("hgn_torpedocorvettel"..playerIndex, "Player_Ships"..playerIndex, "hgn_torpedocorvettel")
	        SobGroup_FillShipsByType("hgn_bombervettel"..playerIndex, "Player_Ships"..playerIndex, "hgn_bombervettel")    					
		      SobGroup_FillShipsByType("hgn_multiguncorvettel"..playerIndex, "Player_Ships"..playerIndex, "hgn_multiguncorvettel")
		      SobGroup_FillShipsByType("hgn_gunshipcoevettel"..playerIndex, "Player_Ships"..playerIndex, "hgn_gunshipcoevettel")
		      SobGroup_FillShipsByType("hgn_cthl"..playerIndex, "Player_Ships"..playerIndex, "hgn_cthl")
		      SobGroup_FillShipsByType("hgn_cthionl"..playerIndex, "Player_Ships"..playerIndex, "hgn_cthionl") 	                         
		      SobGroup_FillShipsByType("hgn_assaultfrigate"..playerIndex, "Player_Ships"..playerIndex, "hgn_assaultfrigate")             
		      SobGroup_FillShipsByType("hgn_torpedofrigate"..playerIndex, "Player_Ships"..playerIndex, "hgn_torpedofrigate")          
		      SobGroup_FillShipsByType("hgn_lrms"..playerIndex, "Player_Ships"..playerIndex, "hgn_lrms")                     
		      SobGroup_FillShipsByType("hgn_marinefrigate"..playerIndex, "Player_Ships"..playerIndex, "hgn_marinefrigate")
		      SobGroup_FillShipsByType("hgn_marinefrigate_soban"..playerIndex, "Player_Ships"..playerIndex, "hgn_marinefrigate_soban")
		      SobGroup_SobGroupAdd("hgn_marinefrigate"..playerIndex, "hgn_marinefrigate_soban"..playerIndex)
		      SobGroup_FillShipsByType("hgn_defensefieldfrigate"..playerIndex, "Player_Ships"..playerIndex, "hgn_defensefieldfrigate")
		      SobGroup_FillShipsByType("hgn_ioncannonfrigate"..playerIndex, "Player_Ships"..playerIndex, "hgn_ioncannonfrigate")         
		      SobGroup_FillShipsByType("hgn_tulwar"..playerIndex, "Player_Ships"..playerIndex, "hgn_tulwar")               
		      SobGroup_FillShipsByType("hgn_mothership"..playerIndex, "Player_Ships"..playerIndex, "hgn_mothership")    
		      SobGroup_Clear("hgn_researchstation"..playerIndex)       
		      SobGroup_FillShipsByType("hgn_researchstation"..playerIndex, "Player_Ships"..playerIndex, "hgn_researchstation") 
		      SobGroup_Clear("hgn_power"..playerIndex)       
		      SobGroup_FillShipsByType("hgn_power"..playerIndex, "Player_Ships"..playerIndex, "hgn_power") 
		      SobGroup_Clear("hgn_crewstation"..playerIndex)
		      SobGroup_Clear("hgn_combatbase"..playerIndex)       
		      SobGroup_FillShipsByType("hgn_combatbase"..playerIndex, "Player_Ships"..playerIndex, "hgn_combatbase") 
		      SobGroup_FillShipsByType("hgn_crewstation"..playerIndex, "Player_Ships"..playerIndex, "hgn_crewstation") 
		      SobGroup_FillShipsByType("hgn_carrier"..playerIndex, "Player_Ships"..playerIndex, "hgn_carrier")
		      SobGroup_FillShipsByType("hgn_command_post1"..playerIndex, "Player_Ships"..playerIndex, "hgn_command_post1")
		      SobGroup_FillShipsByType("hgn_command_post2"..playerIndex, "Player_Ships"..playerIndex, "hgn_command_post2")
		      SobGroup_FillShipsByType("hgn_command_post3"..playerIndex, "Player_Ships"..playerIndex, "hgn_command_post3")
		      SobGroup_FillShipsByType("hgn_command_post4"..playerIndex, "Player_Ships"..playerIndex, "hgn_command_post4")
		      SobGroup_FillShipsByType("hgn_battlecarrier"..playerIndex, "Player_Ships"..playerIndex, "hgn_battlecarrier")
		      SobGroup_FillShipsByType("hgn_scaver"..playerIndex, "Player_Ships"..playerIndex, "hgn_scaver")    
		      SobGroup_FillShipsByType("hgn_lightcarrier"..playerIndex, "Player_Ships"..playerIndex, "hgn_lightcarrier")               
		      SobGroup_FillShipsByType("hgn_destroyer"..playerIndex, "Player_Ships"..playerIndex, "hgn_destroyer")
		      SobGroup_FillShipsByType("hgn_sweeperdestroyer"..playerIndex, "Player_Ships"..playerIndex, "hgn_sweeperdestroyer")      
		      SobGroup_FillShipsByType("hgn_missiledestroyer"..playerIndex, "Player_Ships"..playerIndex, "hgn_missiledestroyer")            
		      SobGroup_FillShipsByType("hgn_iondestroyer"..playerIndex, "Player_Ships"..playerIndex, "hgn_iondestroyer")  
		      SobGroup_FillShipsByType("hgn_advdestroyer"..playerIndex, "Player_Ships"..playerIndex, "hgn_advdestroyer")  
		      SobGroup_FillShipsByType("hgn_artillerydestroyer"..playerIndex, "Player_Ships"..playerIndex, "hgn_artillerydestroyer")  
		      SobGroup_FillShipsByType("hgn_cruisera"..playerIndex, "Player_Ships"..playerIndex, "hgn_cruisera")  
		      SobGroup_FillShipsByType("hgn_cruiserb"..playerIndex, "Player_Ships"..playerIndex, "hgn_cruiserb")  
		      SobGroup_FillShipsByType("hgn_juggernaught"..playerIndex, "Player_Ships"..playerIndex, "hgn_juggernaught")     
		      SobGroup_FillShipsByType("hgn_shipyard"..playerIndex, "Player_Ships"..playerIndex, "hgn_shipyard")
					SobGroup_FillShipsByType("hgn_shipyard_g"..playerIndex, "Player_Ships"..playerIndex, "hgn_shipyard_g")				
	        --SobGroup_SobGroupAdd("hgn_shipyard"..playerIndex, "hgn_shipyard_g"..playerIndex)
		      SobGroup_FillShipsByType("hgn_shipyard_elohim"..playerIndex, "Player_Ships"..playerIndex, "hgn_shipyard_elohim")
	        --SobGroup_SobGroupAdd("hgn_shipyard"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_FillShipsByType("hgn_battleshipyard"..playerIndex, "Player_Ships"..playerIndex, "hgn_battleshipyard") 
	        --SobGroup_SobGroupAdd("hgn_shipyard"..playerIndex, "hgn_battleshipyard"..playerIndex)   				
		      SobGroup_FillShipsByType("hgn_battlecruiser"..playerIndex, "Player_Ships"..playerIndex, "hgn_battlecruiser")
		      SobGroup_FillShipsByType("hgn_battlecruiserNUKE"..playerIndex, "Player_Ships"..playerIndex, "hgn_battlecruiserNUKE")
		      SobGroup_FillShipsByType("hgn_vortex"..playerIndex, "Player_Ships"..playerIndex, "hgn_vortex") 
		      SobGroup_FillShipsByType("hgn_minivortex"..playerIndex, "Player_Ships"..playerIndex, "hgn_minivortex") 
		      SobGroup_FillShipsByType("hgn_battleship"..playerIndex, "Player_Ships"..playerIndex, "hgn_battleship") 
		      SobGroup_FillShipsByType("hgn_tanker"..playerIndex, "Player_Ships"..playerIndex, "hgn_tanker")       
		      SobGroup_FillShipsByType("hgn_spacecarrier"..playerIndex, "Player_Ships"..playerIndex, "hgn_spacecarrier")
		      SobGroup_FillShipsByType("hgn_gunturret"..playerIndex, "Player_Ships"..playerIndex, "hgn_gunturret")             
		      SobGroup_FillShipsByType("hgn_pulsarturret"..playerIndex, "Player_Ships"..playerIndex, "hgn_pulsarturret")       
		      SobGroup_FillShipsByType("hgn_ionturret"..playerIndex, "Player_Ships"..playerIndex, "hgn_ionturret") 		
		      SobGroup_FillShipsByType("hgn_missileturret"..playerIndex, "Player_Ships"..playerIndex, "hgn_missileturret")
		      SobGroup_FillShipsByType("hgn_rts"..playerIndex, "Player_Ships"..playerIndex, "hgn_rts") 
		      SobGroup_FillShipsByType("hgn_defensefieldturret"..playerIndex, "Player_Ships"..playerIndex, "hgn_defensefieldturret") 		
		      SobGroup_FillShipsByType("hgn_sentinel"..playerIndex, "Player_Ships"..playerIndex, "hgn_sentinel") 		
		      SobGroup_FillShipsByType("hgn_ionsentinel"..playerIndex, "Player_Ships"..playerIndex, "hgn_ionsentinel") 	
		      SobGroup_FillShipsByType("hgn_artillerysentinel"..playerIndex, "Player_Ships"..playerIndex, "hgn_artillerysentinel") 		
		      SobGroup_FillShipsByType("hgn_massiveturret"..playerIndex, "Player_Ships"..playerIndex, "hgn_massiveturret") 		       
		                   
		      SobGroup_FillShipsByType("hgn_nuclearbomb"..playerIndex, "Player_Ships"..playerIndex, "hgn_nuclearbomb")	      
		      SobGroup_FillShipsByType("hgn_tangomine"..playerIndex, "Player_Ships"..playerIndex, "hgn_tangomine")     
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_tangomine"..playerIndex)   
		      SobGroup_FillShipsByType("hgn_tangomine"..playerIndex, "Player_Ships"..playerIndex, "hgn_tangomine_ws")     
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_tangomine"..playerIndex)             
		      SobGroup_FillShipsByType("hgn_tangomine"..playerIndex, "Player_Ships"..playerIndex, "hgn_tangomine_ws1")     
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_tangomine"..playerIndex)                       
		      SobGroup_FillShipsByType("hgn_viper"..playerIndex, "Player_Ships"..playerIndex, "hgn_viper")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_viper"..playerIndex)	
		      SobGroup_FillShipsByType("hgn_viper"..playerIndex, "Player_Ships"..playerIndex, "hgn_viper_short")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_viper"..playerIndex)	
		      SobGroup_FillShipsByType("hgn_viper"..playerIndex, "Player_Ships"..playerIndex, "hgn_viper_short1")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_viper"..playerIndex)	
		      SobGroup_FillShipsByType("hgn_viper"..playerIndex, "Player_Ships"..playerIndex, "hgn_viper_ws")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_viper"..playerIndex)	
		      SobGroup_FillShipsByType("hgn_viper"..playerIndex, "Player_Ships"..playerIndex, "hgn_viper_ws1")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_viper"..playerIndex)	
		      SobGroup_FillShipsByType("hgn_minermissile"..playerIndex, "Player_Ships"..playerIndex, "hgn_minermissile")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_minermissile"..playerIndex) 
		      SobGroup_FillShipsByType("hgn_minermissile1"..playerIndex, "Player_Ships"..playerIndex, "hgn_minermissile1")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_minermissile1"..playerIndex) 
		                  
		      SobGroup_FillShipsByType("hgn_nucleartube1"..playerIndex, "Player_Ships"..playerIndex, "hgn_nucleartube1")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_nucleartube1"..playerIndex)	      
		      SobGroup_FillShipsByType("hgn_nucleartube2"..playerIndex, "Player_Ships"..playerIndex, "hgn_nucleartube2")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_nucleartube2"..playerIndex)	      
		      SobGroup_FillShipsByType("hgn_nucleartube3"..playerIndex, "Player_Ships"..playerIndex, "hgn_nucleartube3")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_nucleartube3"..playerIndex)  	     
		      SobGroup_FillShipsByType("hgn_nucleartube1"..playerIndex, "Player_Ships"..playerIndex, "hgn_torpedotube1")  
		      SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_nucleartube1"..playerIndex)
		      SobGroup_FillShipsByType("hgn_nucleartube2"..playerIndex, "Player_Ships"..playerIndex, "hgn_torpedotube2")  
			    SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_nucleartube2"..playerIndex)
			    SobGroup_FillShipsByType("hgn_nucleartube3"..playerIndex, "Player_Ships"..playerIndex, "hgn_torpedotube3")  
			    SobGroup_SobGroupAdd("hgn_nuclearbomb"..playerIndex, "hgn_nucleartube3"..playerIndex)	            
			    SobGroup_FillShipsByType("hgn_resourcecollector"..playerIndex, "Player_Ships"..playerIndex, "hgn_resourcecollector")     
		      SobGroup_FillShipsByType("hgn_resourcecontroller"..playerIndex, "Player_Ships"..playerIndex, "hgn_resourcecontroller") 
		      SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "hgn_hscore") 
		      SobGroup_SobGroupAdd("hgn_hscore"..playerIndex, "temp")	 
		      SobGroup_ForceStayDockedIfDocking("hgn_hscore"..playerIndex)     
		      SobGroup_FillShipsByType("hgn_patcher"..playerIndex, "Player_Ships"..playerIndex, "hgn_patcher") 
		      SobGroup_FillShipsByType("hgn_drone"..playerIndex, "Player_Ships"..playerIndex, "hgn_drone") 
		      SobGroup_FillShipsByType("hgn_container"..playerIndex, "Player_Ships"..playerIndex, "hgn_container") 		     	
		      SobGroup_FillShipsByType("hgn_minecontainer"..playerIndex, "Player_Ships"..playerIndex, "hgn_minecontainer") 			 	      
		      SobGroup_FillShipsByType("hgn_transportcell"..playerIndex, "Player_Ships"..playerIndex, "hgn_transportcell") 		      
		      SobGroup_FillShipsByType("hgn_ecmprobe"..playerIndex, "Player_Ships"..playerIndex, "hgn_ecmprobe") 		
		      SobGroup_FillShipsByType("hgn_probe"..playerIndex, "Player_Ships"..playerIndex, "hgn_probe") 			 	      
		      SobGroup_FillShipsByType("hgn_proximitysensor"..playerIndex, "Player_Ships"..playerIndex, "hgn_proximitysensor")
		      SobGroup_SobGroupAddPlayerShipsByType("hgn_proximitysensor"..playerIndex, playerIndex, "sp_tanker")
		      SobGroup_SobGroupAddPlayerShipsByType("hgn_proximitysensor"..playerIndex, playerIndex, "sp_tanker2")
		      SobGroup_SobGroupAddPlayerShipsByType("hgn_proximitysensor"..playerIndex, playerIndex, "sp_tanker3")
		      SobGroup_SobGroupAddPlayerShipsByType("hgn_proximitysensor"..playerIndex, playerIndex, "sp_tanker4")
		      SobGroup_SobGroupAddPlayerShipsByType("hgn_proximitysensor"..playerIndex, playerIndex, "sp_tanker5")
		      SobGroup_SobGroupAddPlayerShipsByType("hgn_proximitysensor"..playerIndex, playerIndex, "sp_tanker6")
		      SobGroup_FillShipsByType("hgn_juggernaught_booster"..playerIndex, "Player_Ships"..playerIndex, "hgn_juggernaught_booster")
		      SobGroup_FillShipsByType("hgn_commandfortress"..playerIndex, "Player_Ships"..playerIndex, "hgn_commandfortress")
		      SobGroup_FillShipsByType("hgn_battlestation"..playerIndex, "Player_Ships"..playerIndex, "hgn_battlestation")
		      SobGroup_FillShipsByType("hgn_ark"..playerIndex, "Player_Ships"..playerIndex, "hgn_ark")
		      SobGroup_FillShipsByType("hgn_hyperspacestation"..playerIndex, "Player_Ships"..playerIndex, "hgn_hyperspacestation") 	
		      SobGroup_FillShipsByType("hgn_defenderdrone"..playerIndex, "Player_Ships"..playerIndex, "hgn_defenderdrone") 					
	--pulisce droni se non ci sono CF	      
		      if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress") == 0 then     
				    SobGroup_TakeDamage("hgn_drone"..playerIndex, 1)    
				  end              				      
	
	---classi x hig	      
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_scout"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_interceptor"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_attackbomber"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_defender"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_lbomber"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_railgunfighter"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_hft"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_attackbomberheavy"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_strategicbomber"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_interceptorl"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_attackbomberl"..playerIndex)	      
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_lbomberl"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_railgunfighterl"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_hftl"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_attackbomberheavyl"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "hgn_strategicbomberl"..playerIndex)
		      
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_assaultcorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_pulsarcorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_torpedocorvette"..playerIndex)
					SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_bombervette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_minelayercorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_multiguncorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_gunshipcoevette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_cth"..playerIndex)	
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_cthion"..playerIndex)	      
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_assaultcorvettel"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_pulsarcorvettel"..playerIndex)	
	        SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_torpedocorvettel"..playerIndex)
	        SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_bombervettel"..playerIndex)				
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_multiguncorvettel"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_gunshipcoevettel"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_cthl"..playerIndex)	
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "hgn_cthionl"..playerIndex)	
		      
		      SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_assaultfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_torpedofrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_lrms"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_marinefrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_defensefieldfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_ioncannonfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "hgn_tulwar"..playerIndex)        
		      
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "hgn_resourcecollector"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "hgn_resourcecontroller"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "hgn_hscore"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "hgn_container"..playerIndex)
	        SobGroup_SobGroupAdd("utilities"..playerIndex, "hgn_minecontainer"..playerIndex)
		      
	        SobGroup_SobGroupAdd("others"..playerIndex, "hgn_transportcell"..playerIndex)
	        
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "hgn_ecmprobe"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "hgn_probe"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "hgn_proximitysensor"..playerIndex) 
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "hgn_juggernaught_booster"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "hgn_drone"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "hgn_patcher"..playerIndex) 
	        
	        SobGroup_SobGroupAdd("evacs"..playerIndex, "evac"..playerIndex)
	        
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_commandfortress"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "hgn_tanker"..playerIndex)
					
					--SobGroup_SobGroupAdd("trader"..playerIndex, "repairer"..playerIndex)
					SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_commandfortress"..playerIndex)
					SobGroup_SobGroupAdd("trader"..playerIndex, "hgn_battlestation"..playerIndex)
	        
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_researchstation"..playerIndex)        
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_power"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_combatbase"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_crewstation"..playerIndex)                   
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_sweeperdestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_missiledestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_iondestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_advdestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_artillerydestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_cruisera"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_cruiserb"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_juggernaught"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_battlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_battlecruiserNUKE"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_vortex"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_minivortex"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_battleship"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_tanker"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_hyperspacestation"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "hgn_spacecarrier"..playerIndex)
	        
	        SobGroup_SobGroupAdd("hgn_ALLdestroyers"..playerIndex, "hgn_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("hgn_ALLdestroyers"..playerIndex, "hgn_sweeperdestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("hgn_ALLdestroyers"..playerIndex, "hgn_missiledestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("hgn_ALLdestroyers"..playerIndex, "hgn_iondestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("hgn_ALLdestroyers"..playerIndex, "hgn_advdestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("hgn_ALLdestroyers"..playerIndex, "hgn_artillerydestroyer"..playerIndex)
	        
	        SobGroup_SobGroupAdd("juggernaughts"..playerIndex, "hgn_juggernaught"..playerIndex) 
					
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_mothership"..playerIndex)        
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_carrier"..playerIndex)	
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_command_post1"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_command_post2"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_command_post3"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_command_post4"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_battlecarrier"..playerIndex)	 
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_lightcarrier"..playerIndex)	  
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_commandfortress"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_battlestation"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_scaver"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_hyperspacestation"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "hgn_ark"..playerIndex)
	             
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_carrier"..playerIndex)	 
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_spacecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_battlecarrier"..playerIndex)	 
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_lightcarrier"..playerIndex)	  
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_commandfortress"..playerIndex)  
	        SobGroup_SobGroupAdd("parader"..playerIndex, "hgn_battlestation"..playerIndex)  
	        
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_commandfortress"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_battlestation"..playerIndex)
	        --SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_tanker"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_battlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_battlecruiserNUKE"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_battleship"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_vortex"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_carrier"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_spacecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_battlecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_lightcarrier"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_hyperspacestation"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "hgn_ark"..playerIndex)
	        
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_commandfortress"..playerIndex)  
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_battlestation"..playerIndex)  
	        --SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_tanker"..playerIndex)     
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_carrier"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_battlecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_scaver"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "hgn_resourcecontroller"..playerIndex)                
	      end
           
				if Temp_GlobalVariable.SobSave == 2 then
	---ships x vgr	    		                        
		      SobGroup_FillShipsByType("vgr_scout"..playerIndex, "Player_Ships"..playerIndex, "vgr_scout")                     
		      SobGroup_FillShipsByType("vgr_interceptor"..playerIndex, "Player_Ships"..playerIndex, "vgr_interceptor")         
		      SobGroup_FillShipsByType("vgr_bomber"..playerIndex, "Player_Ships"..playerIndex, "vgr_bomber")             
		      SobGroup_FillShipsByType("vgr_defender"..playerIndex, "Player_Ships"..playerIndex, "vgr_defender")                    
		      SobGroup_FillShipsByType("vgr_lancefighter"..playerIndex, "Player_Ships"..playerIndex, "vgr_lancefighter")       
		      SobGroup_FillShipsByType("vgr_heavyfighter"..playerIndex, "Player_Ships"..playerIndex, "vgr_heavyfighter")     
		      SobGroup_FillShipsByType("vgr_elitefighter"..playerIndex, "Player_Ships"..playerIndex, "vgr_elitefighter")
		      SobGroup_FillShipsByType("vgr_missilebomber"..playerIndex, "Player_Ships"..playerIndex, "vgr_missilebomber")  
		      SobGroup_FillShipsByType("vgr_bioship"..playerIndex, "Player_Ships"..playerIndex, "vgr_bioship")       
		      SobGroup_FillShipsByType("vgr_missilecorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_missilecorvette")         
		      SobGroup_FillShipsByType("vgr_lasercorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_lasercorvette")  
	        SobGroup_FillShipsByType("vgr_plasmacorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_plasmacorvette")   				
		      SobGroup_FillShipsByType("vgr_minelayercorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_minelayercorvette")         
		      SobGroup_FillShipsByType("vgr_standvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_standvette")    
		      SobGroup_FillShipsByType("vgr_multilancecorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_multilancecorvette")   
	        SobGroup_FillShipsByType("vgr_mortarcorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_mortarcorvette")    				
		      SobGroup_FillShipsByType("vgr_striker"..playerIndex, "Player_Ships"..playerIndex, "vgr_striker")     
		      SobGroup_FillShipsByType("vgr_commandcorvette"..playerIndex, "Player_Ships"..playerIndex, "vgr_commandcorvette")            
		      SobGroup_FillShipsByType("vgr_heavymissilefrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_heavymissilefrigate")                     
		      SobGroup_FillShipsByType("vgr_assaultfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_assaultfrigate")   
	        SobGroup_FillShipsByType("vgr_advassaultfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_advassaultfrigate")  				
		      SobGroup_FillShipsByType("vgr_infiltratorfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_infiltratorfrigate")  
	        SobGroup_FillShipsByType("vgr_supportfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_supportfrigate")   
	        SobGroup_FillShipsByType("vgr_supportfrigate_laser"..playerIndex, "Player_Ships"..playerIndex, "vgr_supportfrigate_laser") 
	        SobGroup_FillShipsByType("vgr_supportfrigatearmed"..playerIndex, "Player_Ships"..playerIndex, "vgr_supportfrigatearmed") 				
		      SobGroup_FillShipsByType("vgr_artilleryfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_artilleryfrigate")  
	        SobGroup_FillShipsByType("vgr_longrangeartilleryfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_longrangeartilleryfrigate")  				
		      SobGroup_FillShipsByType("vgr_empfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_empfrigate") 
		      SobGroup_FillShipsByType("vgr_commandfrigate"..playerIndex, "Player_Ships"..playerIndex, "vgr_commandfrigate")
		      SobGroup_FillShipsByType("vgr_mothership"..playerIndex, "Player_Ships"..playerIndex, "vgr_mothership")
		      SobGroup_FillShipsByType("vgr_mothership_makaan"..playerIndex, "Player_Ships"..playerIndex, "vgr_mothership_makaan")
	        --SobGroup_SobGroupAdd("vgr_mothership"..playerIndex, "vgr_mothership_makaan"..playerIndex)
		      SobGroup_FillShipsByType("vgr_carrier"..playerIndex, "Player_Ships"..playerIndex, "vgr_carrier") 
		      SobGroup_FillShipsByType("vgr_command_post1"..playerIndex, "Player_Ships"..playerIndex, "vgr_command_post1")
		      SobGroup_FillShipsByType("vgr_command_post2"..playerIndex, "Player_Ships"..playerIndex, "vgr_command_post2")
		      SobGroup_FillShipsByType("vgr_command_post3"..playerIndex, "Player_Ships"..playerIndex, "vgr_command_post3")
		      SobGroup_FillShipsByType("vgr_command_post4"..playerIndex, "Player_Ships"..playerIndex, "vgr_command_post4")
	        SobGroup_FillShipsByType("vgr_battlecarrier"..playerIndex, "Player_Ships"..playerIndex, "vgr_battlecarrier")     				
		      SobGroup_FillShipsByType("vgr_destroyer"..playerIndex, "Player_Ships"..playerIndex, "vgr_destroyer")  
		      SobGroup_FillShipsByType("vgr_hammerhead"..playerIndex, "Player_Ships"..playerIndex, "vgr_hammerhead") 
					SobGroup_FillShipsByType("vgr_pulsedestroyer"..playerIndex, "Player_Ships"..playerIndex, "vgr_pulsedestroyer")  
		      SobGroup_FillShipsByType("vgr_am"..playerIndex, "Player_Ships"..playerIndex, "vgr_am")  
		      SobGroup_FillShipsByType("vgr_cruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_cruiser") 
					SobGroup_FillShipsByType("vgr_lightcruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_lightcruiser")
					SobGroup_FillShipsByType("vgr_lightcruiser_gun"..playerIndex, "Player_Ships"..playerIndex, "vgr_lightcruiser_gun")
	        SobGroup_FillShipsByType("vgr_artilleryship"..playerIndex, "Player_Ships"..playerIndex, "vgr_artilleryship") 				
		      SobGroup_FillShipsByType("vgr_shipyard"..playerIndex, "Player_Ships"..playerIndex, "vgr_shipyard")               
		      SobGroup_FillShipsByType("vgr_battlecruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_battlecruiser")
		      SobGroup_FillShipsByType("vgr_battlecruiser_hero"..playerIndex, "Player_Ships"..playerIndex, "vgr_battlecruiser_hero")
		      SobGroup_FillShipsByType("vgr_missilebattlecruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_missilebattlecruiser")
		      SobGroup_FillShipsByType("vgr_sinner"..playerIndex, "Player_Ships"..playerIndex, "vgr_sinner")
		      SobGroup_FillShipsByType("vgr_heavycruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_heavycruiser") 
		      SobGroup_FillShipsByType("vgr_dreadnaught"..playerIndex, "Player_Ships"..playerIndex, "vgr_dreadnaught") 
		      SobGroup_FillShipsByType("vgr_dreadnaughtB"..playerIndex, "Player_Ships"..playerIndex, "vgr_dreadnaughtB")
		      SobGroup_FillShipsByType("vgr_artillerybattlecruiser"..playerIndex, "Player_Ships"..playerIndex, "vgr_artillerybattlecruiser")
		      SobGroup_FillShipsByType("vgr_alkhalid"..playerIndex, "Player_Ships"..playerIndex, "vgr_alkhalid")
		      SobGroup_FillShipsByType("vgr_battleship"..playerIndex, "Player_Ships"..playerIndex, "vgr_battleship")
		      SobGroup_FillShipsByType("vgr_missledreadnaught"..playerIndex, "Player_Ships"..playerIndex, "vgr_missledreadnaught")
		      SobGroup_FillShipsByType("vgr_weaponplatform_gun"..playerIndex, "Player_Ships"..playerIndex, "vgr_weaponplatform_gun")             
		      SobGroup_FillShipsByType("vgr_weaponplatform_lance"..playerIndex, "Player_Ships"..playerIndex, "vgr_weaponplatform_lance")
		      SobGroup_FillShipsByType("vgr_weaponplatform_missile"..playerIndex, "Player_Ships"..playerIndex, "vgr_weaponplatform_missile")     		       
		      SobGroup_FillShipsByType("vgr_hyperspace_platform"..playerIndex, "Player_Ships"..playerIndex, "vgr_hyperspace_platform")                     
		      SobGroup_FillShipsByType("vgr_mobile_inhibitor"..playerIndex, "Player_Ships"..playerIndex, "vgr_mobile_inhibitor")
		      SobGroup_FillShipsByType("vgr_cloakplatform"..playerIndex, "Player_Ships"..playerIndex, "vgr_cloakplatform")
		      SobGroup_FillShipsByType("vgr_resourcecollector"..playerIndex, "Player_Ships"..playerIndex, "vgr_resourcecollector")     
		      SobGroup_FillShipsByType("vgr_resourcecontroller"..playerIndex, "Player_Ships"..playerIndex, "vgr_resourcecontroller") 
					SobGroup_FillShipsByType("vgr_resourcecontrollerdouble"..playerIndex, "Player_Ships"..playerIndex, "vgr_resourcecontrollerdouble") 
					SobGroup_FillShipsByType("vgr_scaver"..playerIndex, "Player_Ships"..playerIndex, "vgr_scaver") 
		      SobGroup_FillShipsByType("vgr_minecontainer"..playerIndex, "Player_Ships"..playerIndex, "vgr_minecontainer") 	
		      SobGroup_FillShipsByType("vgr_container"..playerIndex, "Player_Ships"..playerIndex, "vgr_container") 	  
		      SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "vgr_cruse")  	 
	        SobGroup_SobGroupAdd("vgr_nuclearbomb"..playerIndex, "temp")
					SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "vgr_cruse1")  	 
	        SobGroup_SobGroupAdd("vgr_nuclearbomb"..playerIndex, "temp")
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "vgr_JDAM")  	 
	        SobGroup_SobGroupAdd("vgr_nuclearbomb"..playerIndex, "temp")
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "vgr_boa")  	 
	        SobGroup_SobGroupAdd("vgr_nuclearbomb"..playerIndex, "temp")	 
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "vgr_minermissile")  	 
	        SobGroup_SobGroupAdd("vgr_nuclearbomb"..playerIndex, "temp")
	        SobGroup_SobGroupAddPlayerShipsByType("vgr_nuclearbomb"..playerIndex, playerIndex, "vgr_planetkillermissile")		--an easier expression
		      SobGroup_FillShipsByType("vgr_commandfortress"..playerIndex, "Player_Ships"..playerIndex, "vgr_commandfortress")
		      SobGroup_FillShipsByType("vgr_superbattleship"..playerIndex, "Player_Ships"..playerIndex, "vgr_superbattleship")
		      SobGroup_FillShipsByType("vgr_minelayerdrone"..playerIndex, "Player_Ships"..playerIndex, "vgr_minelayerdrone")
		      SobGroup_FillShipsByType("vgr_probe_ecm"..playerIndex, "Player_Ships"..playerIndex, "vgr_probe_ecm")
		      SobGroup_FillShipsByType("vgr_probe_smallhsbeacon"..playerIndex, "Player_Ships"..playerIndex, "vgr_probe_smallhsbeacon")
		      SobGroup_FillShipsByType("vgr_probe_prox"..playerIndex, "Player_Ships"..playerIndex, "vgr_probe_prox")    
		      SobGroup_FillShipsByType("vgr_probe"..playerIndex, "Player_Ships"..playerIndex, "vgr_probe")
		      SobGroup_FillShipsByType("vgr_patcher"..playerIndex, "Player_Ships"..playerIndex, "vgr_patcher")
		      SobGroup_FillShipsByType("vgr_mobile_inhibitor_well"..playerIndex, "Player_Ships"..playerIndex, "vgr_mobile_inhibitor_well")
	        SobGroup_FillShipsByType("vgr_planetkiller"..playerIndex, "Player_Ships"..playerIndex, "vgr_planetkiller")
	        SobGroup_SobGroupAdd("vgr_probe_smallhsbeacon"..playerIndex, "vgr_planetkiller"..playerIndex)
	
	---classi per vgr	      
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_scout"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_interceptor"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_bomber"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_defender"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_lancefighter"..playerIndex)		 
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_heavyfighter"..playerIndex)		
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_bioship"..playerIndex)	     
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_elitefighter"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "vgr_missilebomber"..playerIndex)
		      
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_missilecorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_lasercorvette"..playerIndex)
					SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_plasmacorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_minelayercorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_striker"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_standvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_multilancecorvette"..playerIndex)	
					SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_mortarcorvette"..playerIndex)	
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "vgr_commandcorvette"..playerIndex)		
		      
		      SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_heavymissilefrigate"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_supportfrigate"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_supportfrigate_laser"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_advassaultfrigate"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_supportfrigatearmed"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_assaultfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_infiltratorfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_artilleryfrigate"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_longrangeartilleryfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_empfrigate"..playerIndex)  
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "vgr_commandfrigate"..playerIndex) 	      
		      
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "vgr_resourcecollector"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "vgr_resourcecontroller"..playerIndex) 
	        SobGroup_SobGroupAdd("utilities"..playerIndex, "vgr_resourcecontrollerdouble"..playerIndex)
	        SobGroup_SobGroupAdd("utilities"..playerIndex, "vgr_container"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "vgr_minecontainer"..playerIndex)
		      
		      SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_minelayerdrone"..playerIndex)
		      SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_probe_ecm"..playerIndex)
		      SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_probe_smallhsbeacon"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_probe_prox"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_probe"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_patcher"..playerIndex)
	        SobGroup_SobGroupAdd("ECM_immune", "vgr_patcher"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "vgr_mobile_inhibitor_well"..playerIndex)
	
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "vgr_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "vgr_mothership_makaan"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "vgr_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "vgr_commandfortress"..playerIndex)
	        SobGroup_SobGroupAdd("repairer"..playerIndex, "vgr_heavycruiser"..playerIndex)
	
	        SobGroup_SobGroupAdd("trader"..playerIndex, "vgr_mothership"..playerIndex)		
					SobGroup_SobGroupAdd("trader"..playerIndex, "vgr_shipyard"..playerIndex)		
					SobGroup_SobGroupAdd("trader"..playerIndex, "vgr_commandfortress"..playerIndex)						
	        
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_hammerhead"..playerIndex)
					SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_pulsedestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_am"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_cruiser"..playerIndex)
					SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_lightcruiser"..playerIndex)
					SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_lightcruiser_gun"..playerIndex)
					SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_artilleryship"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_battlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_battlecruiser_hero"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_missilebattlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_sinner"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_heavycruiser"..playerIndex) 
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_alkhalid"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_battleship"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_missledreadnaught"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_dreadnaught"..playerIndex) 		
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_dreadnaughtB"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_artillerybattlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "vgr_superbattleship"..playerIndex)
	        
	        SobGroup_SobGroupAdd("vgr_ALLsmokers"..playerIndex, "vgr_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("vgr_ALLsmokers"..playerIndex, "vgr_pulsedestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("vgr_ALLsmokers"..playerIndex, "vgr_cruiser"..playerIndex)
	        SobGroup_SobGroupAdd("vgr_ALLsmokers"..playerIndex, "vgr_lightcruiser"..playerIndex)
	        SobGroup_SobGroupAdd("vgr_ALLsmokers"..playerIndex, "vgr_lightcruiser_gun"..playerIndex)
	        SobGroup_SobGroupAdd("vgr_ALLsmokers"..playerIndex, "vgr_artilleryship"..playerIndex)
	        
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_mothership_makaan"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_shipyard"..playerIndex)	
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_carrier"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_command_post1"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_command_post2"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_command_post3"..playerIndex)
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_command_post4"..playerIndex)
					SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_battlecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_commandfortress"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "vgr_scaver"..playerIndex) 
	        
	        SobGroup_SobGroupAdd("parader"..playerIndex, "vgr_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "vgr_shipyard"..playerIndex)	
	        SobGroup_SobGroupAdd("parader"..playerIndex, "vgr_carrier"..playerIndex)
					SobGroup_SobGroupAdd("parader"..playerIndex, "vgr_battlecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "vgr_commandfortress"..playerIndex)
	        
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_battlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_battlecruiser_hero"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_missilebattlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_sinner"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_heavycruiser"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_dreadnaughtB"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_alkhalid"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_battleship"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_missledreadnaught"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_carrier"..playerIndex)
					SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_battlecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "vgr_commandfortress"..playerIndex)        
	        
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_carrier"..playerIndex)   
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_battlecarrier"..playerIndex)   				
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_commandfortress"..playerIndex)        
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_resourcecontroller"..playerIndex)
					SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_resourcecontrollerdouble"..playerIndex)
					SobGroup_SobGroupAdd("cdocker"..playerIndex, "vgr_scaver"..playerIndex)
				end

				if Temp_GlobalVariable.SobSave == 3 then
	---ships x kadeshi
		      SobGroup_FillShipsByType("kad_command_post1"..playerIndex, "Player_Ships"..playerIndex, "kad_command_post1")
		      SobGroup_FillShipsByType("kad_command_post2"..playerIndex, "Player_Ships"..playerIndex, "kad_command_post2")
		      SobGroup_FillShipsByType("kad_command_post3"..playerIndex, "Player_Ships"..playerIndex, "kad_command_post3")
		      SobGroup_FillShipsByType("kad_command_post4"..playerIndex, "Player_Ships"..playerIndex, "kad_command_post4")
					SobGroup_FillShipsByType("kad_advancedswarmer"..playerIndex, "Player_Ships"..playerIndex, "kad_advancedswarmer")
					SobGroup_FillShipsByType("kad_advancedswarmer_old"..playerIndex, "Player_Ships"..playerIndex, "kad_advancedswarmer_old")
					SobGroup_FillShipsByType("kad_heavyswarmer_new"..playerIndex, "Player_Ships"..playerIndex, "kad_heavyswarmer_new")
					SobGroup_FillShipsByType("kad_pulsarswarmer"..playerIndex, "Player_Ships"..playerIndex, "kad_pulsarswarmer")
					SobGroup_FillShipsByType("kad_swarmer_blood"..playerIndex, "Player_Ships"..playerIndex, "kad_swarmer_blood") 
					SobGroup_FillShipsByType("kad_swarmer_crusader"..playerIndex, "Player_Ships"..playerIndex, "kad_swarmer_crusader")
					SobGroup_FillShipsByType("kad_swarmer_ghost"..playerIndex, "Player_Ships"..playerIndex, "kad_swarmer_ghost")
					SobGroup_FillShipsByType("kad_swarmer_hybrid"..playerIndex, "Player_Ships"..playerIndex, "kad_swarmer_hybrid")
					SobGroup_FillShipsByType("kad_swarmer_new"..playerIndex, "Player_Ships"..playerIndex, "kad_swarmer_new")
					SobGroup_FillShipsByType("kad_swarmer_zealot"..playerIndex, "Player_Ships"..playerIndex, "kad_swarmer_zealot")
					SobGroup_FillShipsByType("kad_gunpod"..playerIndex, "Player_Ships"..playerIndex, "kad_gunpod")
					SobGroup_FillShipsByType("kad_ionpod"..playerIndex, "Player_Ships"..playerIndex, "kad_ionpod")
					SobGroup_FillShipsByType("kad_missilepod"..playerIndex, "Player_Ships"..playerIndex, "kad_missilepod")
					SobGroup_FillShipsByType("kad_pod_ghost"..playerIndex, "Player_Ships"..playerIndex, "kad_pod_ghost")
					SobGroup_FillShipsByType("kad_prayerpod"..playerIndex, "Player_Ships"..playerIndex, "kad_prayerpod")
					SobGroup_FillShipsByType("kad_sensorpod"..playerIndex, "Player_Ships"..playerIndex, "kad_sensorpod")
					SobGroup_FillShipsByType("kad_frig_ghost"..playerIndex, "Player_Ships"..playerIndex, "kad_frig_ghost")
					SobGroup_FillShipsByType("kad_multibeam"..playerIndex, "Player_Ships"..playerIndex, "kad_multibeam")
					SobGroup_FillShipsByType("kad_multibeam_new"..playerIndex, "Player_Ships"..playerIndex, "kad_multibeam_new")
					SobGroup_FillShipsByType("kad_multigun"..playerIndex, "Player_Ships"..playerIndex, "kad_multigun")
					SobGroup_FillShipsByType("kad_podship"..playerIndex, "Player_Ships"..playerIndex, "kad_podship")
					SobGroup_FillShipsByType("kad_needleship"..playerIndex, "Player_Ships"..playerIndex, "kad_needleship")
					SobGroup_FillShipsByType("kad_destroyer"..playerIndex, "Player_Ships"..playerIndex, "kad_destroyer")
					SobGroup_FillShipsByType("kad_destroyer_real"..playerIndex, "Player_Ships"..playerIndex, "kad_destroyer_real")
					SobGroup_FillShipsByType("kad_custodian"..playerIndex, "Player_Ships"..playerIndex, "kad_custodian")
					SobGroup_FillShipsByType("kad_nebuladrone"..playerIndex, "Player_Ships"..playerIndex, "kad_nebuladrone")  
					SobGroup_FillShipsByType("kad_snail"..playerIndex, "Player_Ships"..playerIndex, "kad_snail")  
					SobGroup_FillShipsByType("kad_ressourcecollector"..playerIndex, "Player_Ships"..playerIndex, "kad_ressourcecollector")
					SobGroup_FillShipsByType("kad_container"..playerIndex, "Player_Ships"..playerIndex, "kad_container")
					SobGroup_FillShipsByType("kad_minecontainer"..playerIndex, "Player_Ships"..playerIndex, "kad_minecontainer")
					SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "kad_minermissile")  	 
	        SobGroup_SobGroupAdd("kad_nuclearbomb"..playerIndex, "temp")
	        SobGroup_FillShipsByType("temp", "Player_Ships"..playerIndex, "kad_jihadi")  	 
	        SobGroup_SobGroupAdd("kad_nuclearbomb"..playerIndex, "temp")
	        SobGroup_FillShipsByType("kad_jihadi"..playerIndex, "Player_Ships"..playerIndex, "kad_jihadi")
	
	---classi per kadeshi	      
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_advancedswarmer"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_advancedswarmer_old"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_heavyswarmer_new"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_pulsarswarmer"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_swarmer_blood"..playerIndex)		 
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_swarmer_crusader"..playerIndex)		
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_swarmer_ghost"..playerIndex)	     
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_swarmer_hybrid"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_swarmer_new"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "kad_swarmer_zealot"..playerIndex)
		      
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "kad_gunpod"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "kad_ionpod"..playerIndex)
					SobGroup_SobGroupAdd("corvettes"..playerIndex, "kad_missilepod"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "kad_pod_ghost"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "kad_prayerpod"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "kad_sensorpod"..playerIndex)
		      
		      SobGroup_SobGroupAdd("frigates"..playerIndex, "kad_frig_ghost"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "kad_multibeam"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "kad_multibeam_new"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "kad_multigun"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "kad_podship"..playerIndex)     
		      
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "kad_ressourcecollector"..playerIndex)
	        SobGroup_SobGroupAdd("utilities"..playerIndex, "kad_container"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "kad_minecontainer"..playerIndex)
	
	        SobGroup_SobGroupAdd("trader"..playerIndex, "kad_needleship"..playerIndex)			
	        
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "kad_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "kad_destroyer_real"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "kad_custodian"..playerIndex)
	        
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "kad_needleship"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "kad_podship"..playerIndex)	--testing
	        --SobGroup_SobGroupAdd("productioncapital"..playerIndex, "kad_custodian"..playerIndex)	--mine containers too low to catch up
	        
	        SobGroup_SobGroupAdd("parader"..playerIndex, "kad_needleship"..playerIndex)        
	        
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kad_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kad_needleship"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kad_podship"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kad_custodian"..playerIndex)
	        
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "kad_needleship"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "kad_podship"..playerIndex)
	      end
				
				if Temp_GlobalVariable.SobSave == 4 then
	--ships x Raider
		      SobGroup_FillShipsByType("rad_command_post1"..playerIndex, "Player_Ships"..playerIndex, "rad_command_post1")
		      SobGroup_FillShipsByType("rad_command_post2"..playerIndex, "Player_Ships"..playerIndex, "rad_command_post2")
		      SobGroup_FillShipsByType("rad_command_post3"..playerIndex, "Player_Ships"..playerIndex, "rad_command_post3")
		      SobGroup_FillShipsByType("rad_command_post4"..playerIndex, "Player_Ships"..playerIndex, "rad_command_post4")
					SobGroup_FillShipsByType("rad_merc_fighter"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_fighter")
					SobGroup_FillShipsByType("rad_merc_interceptor"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_interceptor")
					SobGroup_FillShipsByType("rad_merc_bomber"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_bomber")
					SobGroup_FillShipsByType("rad_merc_scout"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_scout")
					SobGroup_FillShipsByType("rad_bomber"..playerIndex, "Player_Ships"..playerIndex, "rad_bomber")
					SobGroup_FillShipsByType("rad_elitefighter"..playerIndex, "Player_Ships"..playerIndex, "rad_elitefighter")
					SobGroup_FillShipsByType("rad_fencer"..playerIndex, "Player_Ships"..playerIndex, "rad_fencer") 
					SobGroup_FillShipsByType("rad_interceptor"..playerIndex, "Player_Ships"..playerIndex, "rad_interceptor")
					SobGroup_FillShipsByType("rad_interceptor_black"..playerIndex, "Player_Ships"..playerIndex, "rad_interceptor_black")
					SobGroup_FillShipsByType("rad_merc_corvette"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_corvette")
					SobGroup_FillShipsByType("rad_scoutcorvette"..playerIndex, "Player_Ships"..playerIndex, "rad_scoutcorvette")
					SobGroup_FillShipsByType("rad_guncorvette"..playerIndex, "Player_Ships"..playerIndex, "rad_guncorvette")
					SobGroup_FillShipsByType("rad_empcorvette"..playerIndex, "Player_Ships"..playerIndex, "rad_empcorvette")
					SobGroup_FillShipsByType("rad_missilecorvette"..playerIndex, "Player_Ships"..playerIndex, "rad_missilecorvette") 
					SobGroup_FillShipsByType("rad_jackal"..playerIndex, "Player_Ships"..playerIndex, "rad_jackal")
					SobGroup_FillShipsByType("rad_beamfrigate"..playerIndex, "Player_Ships"..playerIndex, "rad_beamfrigate")
					SobGroup_FillShipsByType("rad_gattlingfrigate"..playerIndex, "Player_Ships"..playerIndex, "rad_gattlingfrigate")
					SobGroup_FillShipsByType("rad_gunfrigate"..playerIndex, "Player_Ships"..playerIndex, "rad_gunfrigate")
					SobGroup_FillShipsByType("rad_gunfrigate_morgan"..playerIndex, "Player_Ships"..playerIndex, "rad_gunfrigate_morgan")
					SobGroup_FillShipsByType("rad_merc_frigate"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_frigate")
					SobGroup_FillShipsByType("rad_merc_frigateadv"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_frigateadv")
					SobGroup_FillShipsByType("rad_merc_ioncannonfrigate"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_ioncannonfrigate")
					SobGroup_FillShipsByType("rad_missilefrigate"..playerIndex, "Player_Ships"..playerIndex, "rad_missilefrigate")
					SobGroup_FillShipsByType("rad_mothership"..playerIndex, "Player_Ships"..playerIndex, "rad_mothership")
					SobGroup_FillShipsByType("rad_carrier"..playerIndex, "Player_Ships"..playerIndex, "rad_carrier")
					SobGroup_FillShipsByType("rad_carrier_black"..playerIndex, "Player_Ships"..playerIndex, "rad_carrier_black")
					SobGroup_FillShipsByType("rad_scaffolda"..playerIndex, "Player_Ships"..playerIndex, "rad_scaffolda")
					SobGroup_FillShipsByType("rad_scaffoldB"..playerIndex, "Player_Ships"..playerIndex, "rad_scaffoldB")
					SobGroup_FillShipsByType("rad_merc_cruiser"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_cruiser")
					SobGroup_FillShipsByType("rad_refurbisheddestroyer"..playerIndex, "Player_Ships"..playerIndex, "rad_refurbisheddestroyer")
					SobGroup_FillShipsByType("rad_cruiser"..playerIndex, "Player_Ships"..playerIndex, "rad_cruiser")
					SobGroup_FillShipsByType("rad_cruiser_queen"..playerIndex, "Player_Ships"..playerIndex, "rad_cruiser_queen")
					SobGroup_FillShipsByType("rad_cruiserscaffolda"..playerIndex, "Player_Ships"..playerIndex, "rad_cruiserscaffolda")
					SobGroup_FillShipsByType("rad_cruiser_queenscaffolda"..playerIndex, "Player_Ships"..playerIndex, "rad_cruiser_queenscaffolda")
					SobGroup_FillShipsByType("rad_destroyer"..playerIndex, "Player_Ships"..playerIndex, "rad_destroyer")
					SobGroup_FillShipsByType("rad_scud"..playerIndex, "Player_Ships"..playerIndex, "rad_scud")
					SobGroup_FillShipsByType("rad_helios"..playerIndex, "Player_Ships"..playerIndex, "rad_helios")
					SobGroup_FillShipsByType("rad_vanaarjet"..playerIndex, "Player_Ships"..playerIndex, "rad_vanaarjet")
					SobGroup_FillShipsByType("rad_qwaarjetii"..playerIndex, "Player_Ships"..playerIndex, "rad_qwaarjetii")
					SobGroup_FillShipsByType("rad_merc_battlecruiser"..playerIndex, "Player_Ships"..playerIndex, "rad_merc_battlecruiser")
					SobGroup_FillShipsByType("rad_destroyerscaffolda"..playerIndex, "Player_Ships"..playerIndex, "rad_destroyerscaffolda")
					SobGroup_FillShipsByType("rad_scudscaffolda"..playerIndex, "Player_Ships"..playerIndex, "rad_scudscaffolda")
					SobGroup_FillShipsByType("rad_explotrap"..playerIndex, "Player_Ships"..playerIndex, "rad_explotrap")  
					SobGroup_FillShipsByType("rad_gravwel"..playerIndex, "Player_Ships"..playerIndex, "rad_gravwel")				                       
					SobGroup_FillShipsByType("rad_hsbouey"..playerIndex, "Player_Ships"..playerIndex, "rad_hsbouey")
					SobGroup_FillShipsByType("rad_guntrap"..playerIndex, "Player_Ships"..playerIndex, "rad_guntrap") 
					SobGroup_FillShipsByType("rad_resourcecollector"..playerIndex, "Player_Ships"..playerIndex, "rad_resourcecollector")
					SobGroup_FillShipsByType("rad_resourcecontroller"..playerIndex, "Player_Ships"..playerIndex, "rad_resourcecontroller")
					SobGroup_FillShipsByType("rad_container"..playerIndex, "Player_Ships"..playerIndex, "rad_container")
					SobGroup_FillShipsByType("rad_minecontainer"..playerIndex, "Player_Ships"..playerIndex, "rad_minecontainer")
					SobGroup_FillShipsByType("rad_powerstation"..playerIndex, "Player_Ships"..playerIndex, "rad_powerstation")
					SobGroup_FillShipsByType("rad_blackmarket"..playerIndex, "Player_Ships"..playerIndex, "rad_blackmarket")
					SobGroup_FillShipsByType("rad_armsdealer"..playerIndex, "Player_Ships"..playerIndex, "rad_armsdealer")
	
	---classi per raider	      
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_merc_fighter"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_merc_interceptor"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_merc_bomber"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_merc_scout"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_bomber"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_elitefighter"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_fencer"..playerIndex)
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_interceptor"..playerIndex)		 
		      SobGroup_SobGroupAdd("fighters"..playerIndex, "rad_interceptor_black"..playerIndex)
		      
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "rad_merc_corvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "rad_scoutcorvette"..playerIndex)
					SobGroup_SobGroupAdd("corvettes"..playerIndex, "rad_guncorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "rad_empcorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "rad_missilecorvette"..playerIndex)
		      SobGroup_SobGroupAdd("corvettes"..playerIndex, "rad_jackal"..playerIndex)
		      
		      SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_beamfrigate"..playerIndex)
		      SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_gattlingfrigate"..playerIndex)	
					SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_gunfrigate"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_gunfrigate_morgan"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_merc_frigate"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_merc_frigateadv"..playerIndex)
					SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_merc_ioncannonfrigate"..playerIndex)
	        SobGroup_SobGroupAdd("frigates"..playerIndex, "rad_missilefrigate"..playerIndex)  
		      
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "rad_resourcecollector"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "rad_resourcecontroller"..playerIndex)
	        SobGroup_SobGroupAdd("utilities"..playerIndex, "rad_container"..playerIndex)
		      SobGroup_SobGroupAdd("utilities"..playerIndex, "rad_minecontainer"..playerIndex)
	
		      SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "rad_scaffolda"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "rad_scaffoldB"..playerIndex)
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "rad_cruiserscaffolda"..playerIndex)   
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "rad_cruiser_queenscaffolda"..playerIndex) 
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "rad_destroyerscaffolda"..playerIndex) 
	        SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "rad_scudscaffolda"..playerIndex)
	
	        SobGroup_SobGroupAdd("trader"..playerIndex, "rad_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("trader"..playerIndex, "rad_carrier"..playerIndex)		
					SobGroup_SobGroupAdd("trader"..playerIndex, "rad_carrier_black"..playerIndex)				
					SobGroup_SobGroupAdd("trader"..playerIndex, "rad_blackmarket"..playerIndex)
	        
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_merc_cruiser"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_refurbisheddestroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_cruiser"..playerIndex)
					SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_cruiser_queen"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_scud"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_helios"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_vanaarjet"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_qwaarjetii"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_merc_battlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("smallcapitals"..playerIndex, "rad_armsdealer"..playerIndex)
	        
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "rad_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "rad_carrier"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "rad_carrier_black"..playerIndex)	
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "rad_blackmarket"..playerIndex)	
	        SobGroup_SobGroupAdd("productioncapital"..playerIndex, "rad_resourcecontroller"..playerIndex)		--testing
	        
	        SobGroup_SobGroupAdd("parader"..playerIndex, "rad_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "rad_carrier"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "rad_carrier_black"..playerIndex)        
	        SobGroup_SobGroupAdd("parader"..playerIndex, "rad_blackmarket"..playerIndex)        
	        
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "rad_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "rad_carrier"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "rad_carrier_black"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "rad_blackmarket"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "rad_armsdealer"..playerIndex)
	        SobGroup_SobGroupAdd("fcdocker"..playerIndex, "rad_resourcecontroller"..playerIndex)
	        
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "rad_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "rad_carrier"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "rad_carrier_black"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "rad_resourcecontroller"..playerIndex)
	        SobGroup_SobGroupAdd("cdocker"..playerIndex, "rad_blackmarket"..playerIndex)
	      end
				
				if Temp_GlobalVariable.SobSave == 5 then
					--keeper new function
					for z, iCount in ship_list.kpr do
						local shipname = iCount.name
						SobGroup_FillShipsByType(shipname..playerIndex, "Player_Ships"..playerIndex, shipname)
						--add the above groups to classes
						local shiptype = iCount.class
						if shiptype == "fighter" then
							SobGroup_SobGroupAdd("fighters"..playerIndex, shipname..playerIndex)
						elseif shiptype == "corvette" then
							SobGroup_SobGroupAdd("corvettes"..playerIndex, shipname..playerIndex)
						elseif shiptype == "frigate" then
							SobGroup_SobGroupAdd("frigates"..playerIndex, shipname..playerIndex)
						elseif shiptype == "armedcapital" then
							SobGroup_SobGroupAdd("smallcapitals"..playerIndex, shipname..playerIndex)
						elseif shiptype == "capital" then
							SobGroup_SobGroupAdd("productioncapital"..playerIndex, shipname..playerIndex)
						elseif shiptype == "platform" then
							SobGroup_SobGroupAdd("platforms", shipname..playerIndex)
						elseif shiptype == "utility" then
							SobGroup_SobGroupAdd("utilities"..playerIndex, shipname..playerIndex)
							if shipname ~= "kpr_resourcecollector" and shipname ~= "kpr_resourcecontroller" and shipname ~= "kpr_minecontainer" then
								SobGroup_SobGroupAdd("othersnoparade"..playerIndex, shipname..playerIndex)
							end
						elseif shiptype == "weapon" then
							SobGroup_SobGroupAdd("nuclearbombs", shipname..playerIndex)
						end
					end
	        
		      SobGroup_Create("kpr_command_post1"..playerIndex)
		      SobGroup_Create("kpr_command_post2"..playerIndex)
		      SobGroup_Create("kpr_command_post3"..playerIndex)
		      SobGroup_Create("kpr_command_post4"..playerIndex)
		      
		      SobGroup_FillShipsByType("kpr_command_post1"..playerIndex, "Player_Ships"..playerIndex, "kpr_command_post1")
		      SobGroup_FillShipsByType("kpr_command_post2"..playerIndex, "Player_Ships"..playerIndex, "kpr_command_post2")
		      SobGroup_FillShipsByType("kpr_command_post3"..playerIndex, "Player_Ships"..playerIndex, "kpr_command_post3")
		      SobGroup_FillShipsByType("kpr_command_post4"..playerIndex, "Player_Ships"..playerIndex, "kpr_command_post4")
		      
					SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kpr_carrier"..playerIndex)
					SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kpr_hive"..playerIndex)
					SobGroup_SobGroupAdd("fcdocker"..playerIndex, "kpr_dronestruct"..playerIndex)
					SobGroup_SobGroupAdd("trader"..playerIndex, "kpr_dronestruct"..playerIndex)
					
					SobGroup_SobGroupAdd("cdocker"..playerIndex, "kpr_carrier"..playerIndex)
					SobGroup_SobGroupAdd("cdocker"..playerIndex, "kpr_dronestruct"..playerIndex)
										
					--SP mission
					SobGroup_FillShipsByType("hgn_dreadnaught"..playerIndex, "Player_Ships"..playerIndex, "hgn_dreadnaught")
	        SobGroup_SobGroupAdd("kpr_dreadnaught"..playerIndex, "hgn_dreadnaught"..playerIndex)
	        SobGroup_FillShipsByType("kpr_mover_capture"..playerIndex, "Player_Ships"..playerIndex, "kpr_mover_capture")
	        SobGroup_SobGroupAdd("kpr_mover"..playerIndex, "kpr_mover_capture"..playerIndex)
	        SobGroup_FillShipsByType("kpr_destroyerm10"..playerIndex, "Player_Ships"..playerIndex, "kpr_destroyerm10")
	        SobGroup_SobGroupAdd("kpr_destroyer"..playerIndex, "kpr_destroyerm10"..playerIndex)
	        SobGroup_SobGroupAddPlayerShipsByType("kpr_probe_old"..playerIndex, playerIndex, "kpr_mover_salvage")		--an easier expression
		      SobGroup_FillShipsByType("kpr_sajuuk_nosensors"..playerIndex, "Player_Ships"..playerIndex, "kpr_sajuuk_nosensors")
	        SobGroup_SobGroupAdd("kpr_probe_old"..playerIndex, "kpr_sajuuk_nosensors"..playerIndex)
	
					--ships from crates + other megaliths (air combat)
					for z, iCount in ship_list.meg do
						local shipname = iCount.name
						SobGroup_FillShipsByType(shipname..playerIndex, "Player_Ships"..playerIndex, shipname)
						local shiptype = iCount.class
						if shiptype == "fighter" then
							SobGroup_SobGroupAdd("fighters"..playerIndex, shipname..playerIndex)
						elseif shiptype == "corvette" then
							SobGroup_SobGroupAdd("corvettes"..playerIndex, shipname..playerIndex)
						elseif shiptype == "frigate" then
							SobGroup_SobGroupAdd("frigates"..playerIndex, shipname..playerIndex)
						elseif shiptype == "armedcapital" then
							SobGroup_SobGroupAdd("smallcapitals"..playerIndex, shipname..playerIndex)
						elseif shiptype == "capital" then
							SobGroup_SobGroupAdd("productioncapital"..playerIndex, shipname..playerIndex)
						elseif shiptype == "platform" then
							SobGroup_SobGroupAdd("platforms", shipname..playerIndex)
						elseif shiptype == "utility" then
							SobGroup_SobGroupAdd("utilities"..playerIndex, shipname..playerIndex)
						elseif shiptype == "weapon" then
							SobGroup_SobGroupAdd("nuclearbombs", shipname..playerIndex)
						end
					end
					SobGroup_SobGroupAdd("fcdocker"..playerIndex, "meg_carrier_huge"..playerIndex)
					SobGroup_SobGroupAdd("fcdocker"..playerIndex, "meg_kc10"..playerIndex)
					--print("Number of fcdocker for playerIndex "..playerIndex..": "..SobGroup_Count("fcdocker"..playerIndex))
					SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "meg_drone_small"..playerIndex)
					SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "meg_drone_medium"..playerIndex)
					SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "meg_drone_large"..playerIndex)
					SobGroup_SobGroupAdd("othersnoparade"..playerIndex, "meg_drone_scout"..playerIndex)
				end

				if Temp_GlobalVariable.SobSave == 6 then
	---General Classes for all races
					SobGroup_SobGroupAdd("parader"..playerIndex, "smallcapitals"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "fighters"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "corvettes"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "frigates"..playerIndex)
	        SobGroup_SobGroupAdd("parader"..playerIndex, "platforms")
					SobGroup_FillCompare("shipwreck"..playerIndex, "all_shipwreck", "Player_Ships"..playerIndex)	--add every player's captured hulks to a group
					SobGroup_FillCompare("platforms"..playerIndex, "platforms", "Player_Ships"..playerIndex)	--a new group for each player's platforms
	        --haxor
	        SobGroup_SobGroupAdd("haxor_all_invincibleships", "haxor_invincible"..playerIndex)
	        --new groups for special uses
	        SobGroup_SobGroupAdd("all_fighters", "fighters"..playerIndex)
	 				SobGroup_SobGroupAdd("all_corvettes", "corvettes"..playerIndex)
	        SobGroup_SobGroupAdd("productioncapitals", "productioncapital"..playerIndex)
	        SobGroup_SobGroupAdd("all_supporters", "supporter"..playerIndex)
					--assortment for interface display
	        SobGroup_SobGroupAdd("frigates", "frigates"..playerIndex)          
	        SobGroup_SobGroupAdd("motherships", "hgn_mothership"..playerIndex) 
	        SobGroup_SobGroupAdd("motherships", "vgr_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("motherships", "vgr_mothership_makaan"..playerIndex)
	        SobGroup_SobGroupAdd("motherships", "rad_mothership"..playerIndex)
	        SobGroup_SobGroupAdd("shipyards", "hgn_shipyard"..playerIndex)
	        SobGroup_SobGroupAdd("shipyards", "hgn_shipyard_g"..playerIndex)
	        SobGroup_SobGroupAdd("shipyards", "hgn_shipyard_elohim"..playerIndex)
	        SobGroup_SobGroupAdd("shipyards", "hgn_battleshipyard"..playerIndex)
	        SobGroup_SobGroupAdd("shipyards", "vgr_shipyard"..playerIndex) 
					SobGroup_SobGroupAdd("shipyards", "kpr_shipyard_old"..playerIndex)
		      SobGroup_SobGroupAdd("carriers", "hgn_carrier"..playerIndex)
		      SobGroup_SobGroupAdd("carriers", "hgn_battlecarrier"..playerIndex)
		      SobGroup_SobGroupAdd("carriers", "hgn_lightcarrier"..playerIndex)
		      SobGroup_SobGroupAdd("carriers", "hgn_scaver"..playerIndex)
		      SobGroup_SobGroupAdd("carriers", "vgr_scaver"..playerIndex)
		      SobGroup_SobGroupAdd("carriers", "vgr_carrier"..playerIndex)
					SobGroup_SobGroupAdd("carriers", "vgr_battlecarrier"..playerIndex)
	        SobGroup_SobGroupAdd("carriers", "kad_needleship"..playerIndex)		--it can be built more than one, so it shouldn't be mothership
					SobGroup_SobGroupAdd("carriers", "rad_carrier"..playerIndex)		--it can be built more than one, so it shouldn't be mothership
					SobGroup_SobGroupAdd("carriers", "rad_carrier_black"..playerIndex)		--it can be built more than one, so it shouldn't be mothership
					SobGroup_SobGroupAdd("carriers", "kpr_carrier"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "hgn_battlecruiser"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "hgn_battlecruiserNUKE"..playerIndex)
					SobGroup_SobGroupAdd("battlecruisers", "hgn_vortex"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "hgn_battleship"..playerIndex)    
		      SobGroup_SobGroupAdd("battlecruisers", "hgn_tanker"..playerIndex)  
		      SobGroup_SobGroupAdd("battlecruisers", "hgn_spacecarrier"..playerIndex)  
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_battlecruiser"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_battlecruiser_hero"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_missilebattlecruiser"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_sinner"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_heavycruiser"..playerIndex) 
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_alkhalid"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_battleship"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_missledreadnaught"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_dreadnaught"..playerIndex)  
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_dreadnaughtB"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "vgr_artillerybattlecruiser"..playerIndex) 
		      SobGroup_SobGroupAdd("battlecruisers", "kad_destroyer"..playerIndex) 
		      SobGroup_SobGroupAdd("battlecruisers", "rad_scud"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "rad_cruiser"..playerIndex) 
		      SobGroup_SobGroupAdd("battlecruisers", "rad_cruiser_queen"..playerIndex) 
		      SobGroup_SobGroupAdd("battlecruisers", "rad_armsdealer"..playerIndex)
		      SobGroup_SobGroupAdd("battlecruisers", "rad_vanaarjet"..playerIndex) 
	        SobGroup_SobGroupAdd("battlecruisers", "rad_qwaarjetii"..playerIndex) 
	        SobGroup_SobGroupAdd("battlecruisers", "rad_merc_battlecruiser"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "kpr_dreadnaught"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "kpr_reaver"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "kpr_sajuuk"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "HWAT_UNH_CAStandard"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "HWAT_VAY_CABattle"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "HWAT_FRN_CAHeavy"..playerIndex)
	        SobGroup_SobGroupAdd("battlecruisers", "vgr_worldcannon"..playerIndex)
		      SobGroup_SobGroupAdd("juggernaughts", "hgn_juggernaught"..playerIndex)
		      SobGroup_SobGroupAdd("nuclearbombs", "hgn_nuclearbomb"..playerIndex)	
					SobGroup_SobGroupAdd("nuclearbombs", "vgr_nuclearbomb"..playerIndex)	
					SobGroup_SobGroupAdd("nuclearbombs", "kad_nuclearbomb"..playerIndex)
		      SobGroup_SobGroupAdd("destroyers", "hgn_destroyer"..playerIndex)
		      SobGroup_SobGroupAdd("destroyers", "hgn_minivortex"..playerIndex)
		      SobGroup_SobGroupAdd("destroyers", "hgn_sweeperdestroyer"..playerIndex)	
		      SobGroup_SobGroupAdd("destroyers", "hgn_missiledestroyer"..playerIndex)	 
		      SobGroup_SobGroupAdd("destroyers", "hgn_iondestroyer"..playerIndex)	 
		      SobGroup_SobGroupAdd("destroyers", "hgn_advdestroyer"..playerIndex)	
		      SobGroup_SobGroupAdd("destroyers", "hgn_artillerydestroyer"..playerIndex)	 
		      SobGroup_SobGroupAdd("destroyers", "hgn_cruisera"..playerIndex)	 
		      SobGroup_SobGroupAdd("destroyers", "hgn_cruiserb"..playerIndex)	 
		      SobGroup_SobGroupAdd("destroyers", "vgr_destroyer"..playerIndex)	
		      SobGroup_SobGroupAdd("destroyers", "vgr_hammerhead"..playerIndex)
	        SobGroup_SobGroupAdd("destroyers", "vgr_pulsedestroyer"..playerIndex)		      	
	        SobGroup_SobGroupAdd("destroyers", "vgr_am"..playerIndex)
		      SobGroup_SobGroupAdd("destroyers", "vgr_cruiser"..playerIndex) 
					SobGroup_SobGroupAdd("destroyers", "vgr_lightcruiser"..playerIndex)
					SobGroup_SobGroupAdd("destroyers", "vgr_lightcruiser_gun"..playerIndex)
	        SobGroup_SobGroupAdd("destroyers", "vgr_artilleryship"..playerIndex) 
	        SobGroup_SobGroupAdd("destroyers", "kad_destroyer_real"..playerIndex)
	        SobGroup_SobGroupAdd("destroyers", "kad_custodian"..playerIndex)
	        SobGroup_SobGroupAdd("destroyers", "rad_merc_cruiser"..playerIndex) 
	        SobGroup_SobGroupAdd("destroyers", "rad_refurbisheddestroyer"..playerIndex) 
	        SobGroup_SobGroupAdd("destroyers", "rad_destroyer"..playerIndex) 
	        SobGroup_SobGroupAdd("destroyers", "rad_helios"..playerIndex) 
	        SobGroup_SobGroupAdd("destroyers", "kpr_destroyer"..playerIndex)
	        SobGroup_SobGroupAdd("destroyers", "kpr_hive"..playerIndex)
	        SobGroup_SobGroupAdd("platforms", "hgn_defenderdrone"..playerIndex)   	
		      SobGroup_SobGroupAdd("platforms", "hgn_gunturret"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_pulsarturret"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_ionturret"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_missileturret"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_rts"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_defensefieldturret"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_sentinel"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_ionsentinel"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_artillerysentinel"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "hgn_massiveturret"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "vgr_weaponplatform_gun"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "vgr_weaponplatform_lance"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "vgr_weaponplatform_missile"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "vgr_hyperspace_platform"..playerIndex)   		                  
		      SobGroup_SobGroupAdd("platforms", "vgr_mobile_inhibitor"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "vgr_cloakplatform"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "kad_nebuladrone"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "kad_snail"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "rad_explotrap"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "rad_gravwel"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "rad_hsbouey"..playerIndex)   		                  
		      SobGroup_SobGroupAdd("platforms", "rad_guntrap"..playerIndex)
		      SobGroup_SobGroupAdd("platforms", "rad_powerstation"..playerIndex)		--because it's not a genuine power station
	        SobGroup_SobGroupAdd("mobilerefineries", "hgn_resourcecontroller"..playerIndex)
	        SobGroup_SobGroupAdd("mobilerefineries", "vgr_resourcecontroller"..playerIndex)
					SobGroup_SobGroupAdd("mobilerefineries", "vgr_resourcecontrollerdouble"..playerIndex)
					SobGroup_SobGroupAdd("mobilerefineries", "rad_resourcecontroller"..playerIndex)
					SobGroup_SobGroupAdd("mobilerefineries", "kpr_resourcecontroller"..playerIndex)
	        SobGroup_SobGroupAdd("resourcecollectors", "hgn_resourcecollector"..playerIndex)
	        SobGroup_SobGroupAdd("resourcecollectors", "vgr_resourcecollector"..playerIndex)
	        SobGroup_SobGroupAdd("resourcecollectors", "kad_ressourcecollector"..playerIndex)
	        SobGroup_SobGroupAdd("resourcecollectors", "rad_resourcecollector"..playerIndex)
	        SobGroup_SobGroupAdd("resourcecollectors", "kpr_resourcecollector"..playerIndex)
	        SobGroup_SobGroupAdd("containers", "hgn_container"..playerIndex)
	        SobGroup_SobGroupAdd("containers", "vgr_container"..playerIndex)
	        SobGroup_SobGroupAdd("containers", "kad_container"..playerIndex)
	        SobGroup_SobGroupAdd("containers", "rad_container"..playerIndex)
		      SobGroup_SobGroupAdd("minecontainers", "hgn_minecontainer"..playerIndex)
		      SobGroup_SobGroupAdd("minecontainers", "vgr_minecontainer"..playerIndex)		   
		      SobGroup_SobGroupAdd("minecontainers", "kad_minecontainer"..playerIndex)
		      SobGroup_SobGroupAdd("minecontainers", "rad_minecontainer"..playerIndex)	
		      SobGroup_SobGroupAdd("minecontainers", "kpr_minecontainer"..playerIndex)
		      SobGroup_SobGroupAdd("researchstations", "hgn_researchstation"..playerIndex)	
		      SobGroup_SobGroupAdd("powerstations", "hgn_power"..playerIndex)	
		      SobGroup_SobGroupAdd("weaponstations", "hgn_combatbase"..playerIndex)
		      SobGroup_SobGroupAdd("hyperspacestations", "hgn_hyperspacestation"..playerIndex)	 
		      SobGroup_SobGroupAdd("crewstations", "hgn_crewstation"..playerIndex)		
		      SobGroup_SobGroupAdd("commandfortresses", "hgn_commandfortress"..playerIndex)	
		      SobGroup_SobGroupAdd("commandfortresses", "hgn_battlestation"..playerIndex)	
		      SobGroup_SobGroupAdd("commandfortresses", "hgn_ark"..playerIndex)		      
		      SobGroup_SobGroupAdd("commandfortresses", "vgr_commandfortress"..playerIndex)
		      SobGroup_SobGroupAdd("commandfortresses", "vgr_superbattleship"..playerIndex)
		      SobGroup_SobGroupAdd("commandfortresses", "rad_blackmarket"..playerIndex)	      
	
	----Shipwreck system
					for z, iCount in wreck_list.shipname do
						SobGroup_SobGroupAdd("all_ships_with_wreck", iCount..playerIndex)
					end
	
	----MEGALITH
			    SobGroup_FillShipsByType("meg_gehenna_1ctm"..playerIndex, "Player_Ships"..playerIndex, "meg_gehenna_1ctm")     
			    SobGroup_SobGroupAdd("miningbases", "meg_gehenna_1ctm"..playerIndex)	
					SobGroup_FillShipsByType("meg_gehenna_3ctm"..playerIndex, "Player_Ships"..playerIndex, "meg_gehenna_3ctm")     
			    SobGroup_SobGroupAdd("miningbases", "meg_gehenna_3ctm"..playerIndex)	
			    SobGroup_FillShipsByType("meg_balcoragate"..playerIndex, "Player_Ships"..playerIndex, "meg_balcoragate") 
			    if SobGroup_Count("meg_balcoragate"..playerIndex) > 0 then   
			      FX_StartEvent("meg_balcoragate"..playerIndex, "Gate_Trigger")          
			    end		 
			    SobGroup_FillShipsByType("meg_dreadnaughtberth"..playerIndex, "Player_Ships"..playerIndex, "meg_dreadnaughtberth") 
			    if SobGroup_Count("meg_dreadnaughtberth"..playerIndex) > 0 then   
			      SobGroup_AbilityActivate("meg_dreadnaughtberth"..playerIndex, AB_Lights, 1)
			    end		  
	        --SobGroup_FillShipsByType("meg_tanis"..playerIndex, "Player_Ships"..playerIndex, "meg_tanis") 
			    --if SobGroup_Count("meg_tanis"..playerIndex) > 0 then   
			      --SobGroup_AbilityActivate("meg_tanis"..playerIndex, AB_DefenseField, 1)
			    --end		  
			    SobGroup_FillShipsByType("meg_engineeringbay"..playerIndex, "Player_Ships"..playerIndex, "meg_engineeringbay")     
			    SobGroup_FillShipsByType("meg_reinforcementpad"..playerIndex, "Player_Ships"..playerIndex, "meg_reinforcementpad")
			    SobGroup_FillShipsByType("meg_bentus"..playerIndex, "Player_Ships"..playerIndex, "meg_bentus")
			    SobGroup_FillShipsByType("meg_bentusiexchange"..playerIndex, "Player_Ships"..playerIndex, "meg_bentusiexchange")
			    SobGroup_FillShipsByType("meg_ghostship"..playerIndex, "Player_Ships"..playerIndex, "meg_ghostship")
			    --SobGroup_FillShipsByType("meg_carrier_huge"..playerIndex, "Player_Ships"..playerIndex, "meg_carrier_huge")
			    SobGroup_FillShipsByType("meg_mandator_star_dreadnought"..playerIndex, "Player_Ships"..playerIndex, "meg_mandator_star_dreadnought")
			    SobGroup_SobGroupAdd("derelictbattleships"..playerIndex, "meg_mandator_star_dreadnought"..playerIndex)
			    SobGroup_FillShipsByType("meg_titan_cruiser"..playerIndex, "Player_Ships"..playerIndex, "meg_titan_cruiser")
			    SobGroup_SobGroupAdd("derelictbattleships"..playerIndex, "meg_titan_cruiser"..playerIndex)
			    SobGroup_FillShipsByType("meg_hvdreadnaught"..playerIndex, "Player_Ships"..playerIndex, "meg_hvdreadnaught")
			    SobGroup_SobGroupAdd("derelictbattleships"..playerIndex, "meg_hvdreadnaught"..playerIndex)
			    SobGroup_FillShipsByType("meg_executor_ssd"..playerIndex, "Player_Ships"..playerIndex, "meg_executor_ssd")
			    SobGroup_SobGroupAdd("derelictbattleships"..playerIndex, "meg_executor_ssd"..playerIndex)
	
	----TERRITORIES MOD
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_0")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_0_uncapturable")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_50")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_50_uncapturable")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_100")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_100_uncapturable")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_200")
					SobGroup_SobGroupAddPlayerShipsByType("TerritoryGates"..playerIndex, playerIndex, "cpu_jump_gate_200_uncapturable")
	
	----EXPLOSION DAMAGE CLASSES	
	        SobGroup_Clear("enemies"..playerIndex)    
		      SobGroup_Clear("allies"..playerIndex)        
		      SobGroup_Clear("AllToHelp"..playerIndex)
		      SobGroup_Clear("AllAccessibleTerritoryGates"..playerIndex)
		      SobGroup_Clear("fighterenemies"..playerIndex) 	      
		      SobGroup_Clear("corvetteenemies"..playerIndex)  
		      SobGroup_Clear("frigateenemies"..playerIndex) 	      
		      SobGroup_Clear("smallcapitalenemies"..playerIndex)  
		      SobGroup_Clear("bigcapitalenemies"..playerIndex) 
		      SobGroup_Clear("fighterallies"..playerIndex) 	      
		      SobGroup_Clear("corvetteallies"..playerIndex)  
		      SobGroup_Clear("frigateallies"..playerIndex) 	      
		      SobGroup_Clear("smallcapitalallies"..playerIndex)  
		      SobGroup_Clear("bigcapitalallies"..playerIndex) 	
		      SobGroup_Clear("minetargetenemies"..playerIndex)	
		      SobGroup_Clear("repairingallies"..playerIndex)	           
		      SobGroup_Clear("productioncapitalallies"..playerIndex)	 
		      SobGroup_Clear("massshieldenemies"..playerIndex)
		      SobGroup_Clear("orbitalstationallies"..playerIndex)
					SobGroup_Clear("traderallies"..playerIndex)
					SobGroup_Clear("shipwreckallies"..playerIndex)
		      
	---Accessible Gates in Territories Mod
					if GameRulesName ~= nil then
						if GameRulesName == "Simplex Territories" then
		        	if gJumpGateOwnership == MUST_OWN_TERRITORY then
		        		SobGroup_SobGroupAdd("AllAccessibleTerritoryGates"..playerIndex, "TerritoryGates"..playerIndex)
		        	elseif gJumpGateOwnership == CAPTURABLE then
		        		SobGroup_SobGroupAdd("AllAccessibleTerritoryGates"..playerIndex, "TerritoryGates"..playerIndex)
		        	elseif gJumpGateOwnership == ALWAYS_NEUTRAL then
		        		local gate_owner = 4
			        	if Player_IsAlive(gate_owner) == 1 then
			        		SobGroup_SobGroupAdd("AllAccessibleTerritoryGates"..playerIndex, "TerritoryGates"..gate_owner)
			        	end
			        	SobGroup_SobGroupAdd("AllAccessibleTerritoryGates"..playerIndex, "TerritoryGates"..playerIndex)
			        end
		        end
		      end
		      
	---Calcola nemici ed alleati x ogni singolo giocatore sia cpu che umano	        
		      local hasallied = 0              	    
		      local hasallied_hgn = 0
		      local hasallied_vgr = 0
		      local hasallied_kad = 0
		      local hasallied_rad = 0
		      local hasallied_kpr = 0
		      for z = 0,(Universe_PlayerCount()-1),1 do	        
		        if Player_IsAlive(z) == 1 then
	--Enemies	        
		          if AreAllied(playerIndex, z) == 0 then		     	            
		            SobGroup_SobGroupAdd("enemies"..playerIndex, "Player_Ships"..z)
		            SobGroup_SobGroupSubstract("enemies"..playerIndex, "supporter"..z)
	--Small Capital	            
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "smallcapitals"..z)		
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "hgn_ark"..z)	
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "hgn_carrier"..z)
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "hgn_spacecarrier"..z)
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "hgn_battlecarrier"..z)
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "hgn_lightcarrier"..z)	
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "hgn_scaver"..z)	
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "vgr_scaver"..z)
		            SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "vgr_carrier"..z)	
	              SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "vgr_battlecarrier"..z)		
	              SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "kad_needleship"..z)
	              SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "rad_carrier"..z)
	              SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "rad_carrier_black"..z)
	              SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "kpr_carrier"..z)
	              SobGroup_SobGroupAdd("smallcapitalenemies"..playerIndex, "kpr_destroyerm10"..z)
	--Juggernaughts
	              SobGroup_SobGroupAdd("juggernaughtenemies"..playerIndex, "juggernaughts"..z)
	--nuclear bomb              
	              SobGroup_SobGroupAdd("nuclearbombenemies"..playerIndex, "hgn_nuclearbomb"..z)
	--Small Nuclear Bomb
	              SobGroup_SobGroupAdd("nucleartubeenemies"..playerIndex, "hgn_nucleartube1"..z)
	              SobGroup_SobGroupAdd("nucleartubeenemies"..playerIndex, "hgn_nucleartube2"..z)
	              SobGroup_SobGroupAdd("nucleartubeenemies"..playerIndex, "hgn_nucleartube3"..z)
	--Light Granule             
	              SobGroup_SobGroupAdd("lightgranuleenemies"..playerIndex, "kpr_lightgranule"..z)
	--Jihadi Swarmers             
	              SobGroup_SobGroupAdd("jihadiswarmerenemies"..playerIndex, "kad_jihadi"..z)
	--Command Fortress
	              SobGroup_SobGroupAdd("commandfortressenemies"..playerIndex, "hgn_commandfortress"..z) 
	              SobGroup_SobGroupAdd("commandfortressenemies"..playerIndex, "hgn_battlestation"..z)
	              SobGroup_SobGroupAdd("commandfortressenemies"..playerIndex, "hgn_ark"..z)  
	              SobGroup_SobGroupAdd("commandfortressenemies"..playerIndex, "vgr_commandfortress"..z)
	              SobGroup_SobGroupAdd("commandfortressenemies"..playerIndex, "vgr_superbattleship"..z)
	              SobGroup_SobGroupAdd("commandfortressenemies"..playerIndex, "rad_blackmarket"..z)      		                                                       
	--Big Capital	            
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_mothership"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_shipyard"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_shipyard_g"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_shipyard_elohim"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_battleshipyard"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_commandfortress"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_battlestation"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_ark"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "hgn_massshield"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "vgr_mothership"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "vgr_mothership_makaan"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "vgr_shipyard"..z)		
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "vgr_commandfortress"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "vgr_superbattleship"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "vgr_artillerybattlecruiser"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "kad_destroyer"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "kad_needleship"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "rad_blackmarket"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "rad_mothership"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "kpr_shipyard_old"..z)
		            SobGroup_SobGroupAdd("bigcapitalenemies"..playerIndex, "kpr_sajuuk"..z)
	--fighter	                      
			          SobGroup_SobGroupAdd("fighterenemies"..playerIndex, "fighters"..z)		            
	--corvette	            
			          SobGroup_SobGroupAdd("corvetteenemies"..playerIndex, "corvettes"..z)		                   
	--frigate/Utility/Platforms 	            
		            SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "frigates"..z)
		            SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "utilities"..z)
		            SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_gunturret"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_pulsarturret"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_ionturret"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_missileturret"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_rts"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_defensefieldturret"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_sentinel"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_ionsentinel"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_artillerysentinel"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "hgn_massiveturret"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "vgr_weaponplatform_gun"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "vgr_weaponplatform_lance"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "vgr_weaponplatform_missile"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "vgr_hyperspace_platform"..z)   		     			
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "vgr_mobile_inhibitor"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "vgr_cloakplatform"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "kad_snail"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "kad_nebuladrone"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "rad_explotrap"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "rad_gravwel"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "rad_hsbouey"..z)
					      SobGroup_SobGroupAdd("frigateenemies"..playerIndex, "rad_guntrap"..z)
	--Mass Shields  			          
	              SobGroup_SobGroupAdd("massshieldenemies"..playerIndex, "hgn_massshield"..z)	 	                                 	            
		          else	     
	--se ha alleato setta il subsystem hasallied in supporter	            
		            if z ~= playerIndex then
		              hasallied = 1	               	              
	            		if Player_GetRace(z) == Race_Hiigaran then
									  hasallied_hgn = 1
									elseif Player_GetRace(z) == Race_Vaygr then
									  hasallied_vgr = 1
									elseif Player_GetRace(z) == Race_Kadeshi then
									  hasallied_kad = 1
									elseif Player_GetRace(z) == Race_Raider then
									  hasallied_rad = 1
									elseif Player_GetRace(z) == Race_Keeper then
									  hasallied_kpr = 1
									end
		            end 	                 
	--Allies	     
	              SobGroup_SobGroupAdd("allies"..playerIndex, "Player_Ships"..z)
	              SobGroup_SobGroupAdd("AllToHelp"..playerIndex, "allies"..z)
	              SobGroup_SobGroupAdd("AllToHelp"..playerIndex, "Player_Ships"..z)
	--fighter                
			          SobGroup_SobGroupAdd("fighterallies"..playerIndex, "fighters"..z)		               
	--corvette	            
			          SobGroup_SobGroupAdd("corvetteallies"..playerIndex, "corvettes"..z)	 
	--orbital station
	              SobGroup_SobGroupAdd("orbitalstationallies"..playerIndex, "hgn_battlestation"..z)
	              SobGroup_SobGroupAdd("orbitalstationallies"..playerIndex, "rad_blackmarket"..z)
	              SobGroup_SobGroupAdd("orbitalstationallies"..playerIndex, "vgr_artillerybattlecruiser"..z)
	              SobGroup_SobGroupAdd("orbitalstationallies"..playerIndex, "kad_needleship"..z)
	              SobGroup_SobGroupAdd("orbitalstationallies"..playerIndex, "kpr_shipyard_old"..z)
	--trader
	              SobGroup_SobGroupAdd("traderallies"..playerIndex, "trader"..z)									
	--frigate/Utility/Platforms              
		            SobGroup_SobGroupAdd("frigateallies"..playerIndex, "frigates"..z)
		            SobGroup_SobGroupAdd("frigateallies"..playerIndex, "utilities"..z)
		            SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_gunturret"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_pulsarturret"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_ionturret"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_missileturret"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_rts"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_defensefieldturret"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_sentinel"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_ionsentinel"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_artillerysentinel"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "hgn_massiveturret"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "vgr_weaponplatform_gun"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "vgr_weaponplatform_lance"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "vgr_weaponplatform_missile"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "vgr_hyperspace_platform"..z)   		             
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "vgr_mobile_inhibitor"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "vgr_cloakplatform"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "kad_snail"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "kad_nebuladrone"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "rad_explotrap"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "rad_gravwel"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "rad_hsbouey"..z)
					      SobGroup_SobGroupAdd("frigateallies"..playerIndex, "rad_guntrap"..z)
	--Small Capital	 
	              SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "smallcapitals"..z)		           
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "hgn_carrier"..z)
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "hgn_spacecarrier"..z)
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "hgn_battlecarrier"..z)
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "hgn_lightcarrier"..z)	
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "hgn_scaver"..z)
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "vgr_scaver"..z)
		            SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "vgr_carrier"..z)	
	              SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "vgr_battlecarrier"..z)									
	              SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "rad_carrier"..z)
	              SobGroup_SobGroupAdd("smallcapitalallies"..playerIndex, "rad_carrier_black"..z)
	--Big Capital	            
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_mothership"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_shipyard"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_shipyard_g"..z)
		            SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_shipyard_elohim"..z)
		            SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_battleshipyard"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_commandfortress"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_battlestation"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "hgn_ark"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "vgr_mothership"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "vgr_mothership_makaan"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "vgr_shipyard"..z)	
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "vgr_commandfortress"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "vgr_superbattleship"..z)
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "kad_needleship"..z)   
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "rad_blackmarket"..z)  
			          SobGroup_SobGroupAdd("bigcapitalallies"..playerIndex, "rad_mothership"..z)
	--Trading, Mining, auto-repair  			      
	  			      SobGroup_SobGroupAdd("productioncapitalallies"..playerIndex, "productioncapital"..z)
	  			      SobGroup_SobGroupAdd("shipwreckallies"..playerIndex, "shipwreck"..z)
	--Repairing			        
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "frigateallies"..z)	--frigates
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "smallcapitalallies"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "bigcapitalallies"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_rts"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_defensefieldturret"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_sentinel"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_ionsentinel"..z)		
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_artillerysentinel"..z)			        
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_resourcecontroller"..z)	
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "hgn_massshield"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "vgr_resourcecontroller"..z)		 
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "vgr_resourcecontrollerdouble"..z)									
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "kad_snail"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_powerstation"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_scaffolda"..z)		 
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_scaffoldB"..z)
				        SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_cruiserscaffolda"..z)		 
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_cruiser_queenscaffolda"..z)
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_destroyerscaffolda"..z)
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_scudscaffolda"..z)
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "rad_resourcecontroller"..z)
	              SobGroup_SobGroupAdd("repairingallies"..playerIndex, "shipwreckallies"..z) --add ship wrecks to the repair list as well!
		          end
		        end  
		      end
		      SobGroup_SobGroupAdd("enemies"..playerIndex, "SOB_CrisisCapitalTargets"..playerIndex)
		      SobGroup_SobGroupAdd("enemies"..playerIndex, "SOB_CrisisTargets"..playerIndex)
		      
	---per auto-repair fighters/corvettes/collectors
	        --SobGroup_FillShipsByType("temp", "productioncapitalallies"..playerIndex, "hgn_scaver")
	        --SobGroup_FillSubstract("fcdocker"..playerIndex, "productioncapitalallies"..playerIndex, "temp")
			    --SobGroup_Clear("temp")
			    SobGroup_SobGroupSubstract("fcdocker"..playerIndex, "hgn_scaver"..playerIndex)
			    
			    --SobGroup_FillShipsByType("temp", "productioncapitalallies"..playerIndex, "hgn_lightcarrier")
			    --SobGroup_FillSubstract("cdocker"..playerIndex, "productioncapitalallies"..playerIndex, "temp")
			    --SobGroup_Clear("temp")
			    SobGroup_SobGroupSubstract("cdocker"..playerIndex, "hgn_lightcarrier"..playerIndex)
		      
	---setta hp support hasallied se c'? alleato	      
		      if hasallied >= 1 then
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "hasallied")            
	          end               
		      else   
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied") > 0 then 
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "hasallied", 0) 
		        end  
		      end
		      
	---alliance with specific race
		      if hasallied_hgn >= 1 then
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_hgn") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "hasallied_hgn")            
	          end               
		      else   
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_hgn") > 0 then 
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "hasallied_hgn", 0) 
		        end  
		      end
		      if hasallied_vgr >= 1 then
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_vgr") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "hasallied_vgr")            
	          end               
		      else   
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_vgr") > 0 then 
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "hasallied_vgr", 0) 
		        end  
		      end
		      if hasallied_kad >= 1 then
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_kad") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "hasallied_kad")            
	          end               
		      else   
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_kad") > 0 then 
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "hasallied_kad", 0) 
		        end  
		      end
		      if hasallied_rad >= 1 then
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_rad") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "hasallied_rad")            
	          end               
		      else   
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_rad") > 0 then 
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "hasallied_rad", 0) 
		        end  
		      end
		      if hasallied_kpr >= 1 then
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_kpr") == 0 then   
	            SobGroup_CreateSubSystem("supporter"..playerIndex, "hasallied_kpr")            
	          end               
		      else   
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "hasallied_kpr") > 0 then 
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "hasallied_kpr", 0) 
		        end  
		      end
		      
	---Mine	      
		      SobGroup_SobGroupAdd("minetargetenemies"..playerIndex, "smallcapitalenemies"..playerIndex)
		      SobGroup_SobGroupAdd("minetargetenemies"..playerIndex, "bigcapitalenemies"..playerIndex)
		      SobGroup_SobGroupAdd("minetargetenemies"..playerIndex, "SOB_CrisisCapitalTargets"..playerIndex)
		      
	---Update Class x ogni giocatore	      
		      nfi[playerIndexList] = SobGroup_UpdateClass("fighters"..playerIndex, "lastfighters"..playerIndex, nfi[playerIndexList], 0, 0, 0)   
		      nco[playerIndexList] = SobGroup_UpdateClass("corvettes"..playerIndex, "lastcorvettes"..playerIndex, nco[playerIndexList], 0, 0, 0)           	      
		      ntc[playerIndexList] = SobGroup_UpdateClass("others"..playerIndex, "lastothers"..playerIndex, ntc[playerIndexList], 0, 0, 0)    
		      nonp[playerIndexList] = SobGroup_UpdateClass("othersnoparade"..playerIndex, "lastothersnoparade"..playerIndex, nonp[playerIndexList], 0, 0, 0)       	
		      npc[playerIndexList] = SobGroup_UpdateClass("productioncapital"..playerIndex, "lastproductioncapital"..playerIndex, npc[playerIndexList], 0, 0, 0)      
		      npca[playerIndexList] = SobGroup_UpdateClass("productioncapitalallies"..playerIndex, "lastproductioncapitalallies"..playerIndex, npca[playerIndexList], 0, 0, 0)
		      npsa[playerIndexList] = SobGroup_UpdateClass("Player_Ships"..playerIndex, "lastPlayer_Ships"..playerIndex, npsa[playerIndexList], 0, 0, 0)  
		      nec[playerIndexList] = SobGroup_UpdateClass("evacs"..playerIndex, "lastevacs"..playerIndex, nec[playerIndexList], 0, 0, 0)   
		        
	    	end  --build queue
	    	
	    	--kpr revealer tech unlock
	    	if Player_GetRace(playerIndex) == Race_Keeper then
	    		if SobGroup_Count("kpr_probe_old"..playerIndex) >= 1 then
	    			if SobGroup_GetHardPointHealth("supporter"..playerIndex, "revealer1") == 0 then
	            CreateSubsystemOnShip("supporter"..playerIndex, "revealer1")
	          end
		      else
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "revealer1") > 0 then
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "revealer1", 0)
		        end
	    		end
	    		if SobGroup_Count("kpr_probe_old"..playerIndex) >= 2 then
	    			if SobGroup_GetHardPointHealth("supporter"..playerIndex, "revealer2") == 0 then
	            CreateSubsystemOnShip("supporter"..playerIndex, "revealer2")
	          end
		      else
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "revealer2") > 0 then
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "revealer2", 0)
		        end
	    		end
	    		if SobGroup_Count("kpr_probe_old"..playerIndex) >= 3 then
	    			if SobGroup_GetHardPointHealth("supporter"..playerIndex, "revealer3") == 0 then
	            CreateSubsystemOnShip("supporter"..playerIndex, "revealer3")
	          end
		      else
		        if SobGroup_GetHardPointHealth("supporter"..playerIndex, "revealer3") > 0 then
		        	SobGroup_SetHardPointHealth("supporter"..playerIndex, "revealer3", 0)
		        end
	    		end
	    	end
	    end
    	
		end  --player alive		
		playerIndex = playerIndex + 1  
	end	 --playerIndex     
	
---CLASS UPDATE---------------------------------------------------------
	
	nms = SobGroup_UpdateClass("motherships", "lastmotherships", nms, 1, 0, 1)
  nd = SobGroup_UpdateClass("destroyers", "lastdestroyers", nd, 1, 0, 1)		--1, 0, 0, it has name now
  nsy = SobGroup_UpdateClass("shipyards", "lastshipyards", nsy, 1, 0, 1)
  nc = SobGroup_UpdateClass("carriers", "lastcarriers", nc, 1, 0, 1)
  nbc = SobGroup_UpdateClass("battlecruisers", "lastbattlecruisers", nbc, 1, 0, 1)
  nj = SobGroup_UpdateClass("juggernaughts", "lastjuggernaughts", nj, 1, 0, 1)  
  nf = SobGroup_UpdateClass("frigates", "lastfrigates", nf, 1, 0, 0)  
  nmc = SobGroup_UpdateClass("minecontainers", "lastminecontainers", nmc, 0, 1, 0)  
  ntrc = SobGroup_UpdateClass("containers", "lastcontainers", ntrc, 0, 0, 0)  
  nmb = SobGroup_UpdateClass("miningbases", "lastminingbases", nmb, 0, 0, 0)  
  nrs = SobGroup_UpdateClass("researchstations", "lastresearchstations", nrs, 1, 0, 1)  
  nps = SobGroup_UpdateClass("powerstations", "lastpowerstations", nps, 1, 0, 1)
  nws = SobGroup_UpdateClass("weaponstations", "lastweaponstations", nws, 1, 0, 1)
  ncs = SobGroup_UpdateClass("crewstations", "lastcrewstations", ncs, 1, 0, 1)  
  ncf = SobGroup_UpdateClass("commandfortresses", "lastcommandfortresses", ncf, 1, 0, 1)  
  nmr = SobGroup_UpdateClass("mobilerefineries", "lastmobilerefineries", nmr, 1, 0, 1)   --0,0,0
  nrc = SobGroup_UpdateClass("resourcecollectors", "lastresourcecollectors", nrc, 0, 0, 0)
  nhs = SobGroup_UpdateClass("hyperspacestations", "lasthyperspacestations", nhs, 1, 0, 1)
  nnb = SobGroup_UpdateClass("nuclearbombs", "lastnuclearbombs", nnb, 0, 0, 0)
  np =  SobGroup_UpdateClass("platforms", "lastplatforms", np, 1, 0, 0)		--0, 0, 0
  nghost = SobGroup_UpdateClass("ghosts", "lastghosts", nghost, 0, 0, 0)	--the group to store neutral ships belonging to player -1 (for interface display)
  
  Temp_GlobalVariable.SobSave = Temp_GlobalVariable.SobSave + 1
  
	--print("sobgroups -- End")
end

------------------------------------------------------------------------------------------------------------------------------------------------------

function SobGroup_UpdateClass(Group, LastGroup, Counter, HasExperience, HasRU, HasName)
	local NewCount = SobGroup_Count(Group)
	local LastCount = SobGroup_Count(LastGroup)
	if NewCount == 0 then
    Counter = 0
    SobGroup_Clear(LastGroup)
    return Counter
  end
  
	local IntersectCount = 0
	SobGroup_Create("IntersectSOB_Temp")
	SobGroup_Clear("IntersectSOB_Temp")
	SobGroup_FillCompare("IntersectSOB_Temp", Group, LastGroup)
	if SobGroup_Empty("IntersectSOB_Temp") == 0 then
		IntersectCount = SobGroup_Count("IntersectSOB_Temp")
	end
	local Incongruence = 0
	if IntersectCount < LastCount or IntersectCount < NewCount then
		Incongruence = 1	--something has changed since the last update (either ships created or ships destroyed, or both)
	end
	
	if Incongruence == 1 then 	--change has occurred since the last update
		--remove empty splitgroups and re-sort non-empty groups   
    for i = 0,(Counter-1),1 do      
      if SobGroup_Empty ("split" .. tostring(Group) .. tostring(i)) == 1 then           
        for z = (Counter-1),i,-1 do
          if z == i then
		        Counter = Counter - 1
		        break
		      end     
          if SobGroup_Empty ("split" .. tostring(Group) .. tostring(z)) == 0 then
            SobGroup_SobGroupAdd("split" .. tostring(Group) .. tostring(i), "split" .. tostring(Group) .. tostring(z))
            SobGroup_Clear("split" .. tostring(Group) .. tostring(z))
            Counter = Counter - 1
            break
          end
        end
      end
    end
		
    SobGroup_FillSubstract("temp", Group, "IntersectSOB_Temp")	--get what's new in the current group that's not common between the current group and the last group (current group - intersect)
    local DifferenceCount = SobGroup_Count("temp")
    
		--add all differences to new split groups
    if DifferenceCount > 0 then
    	local referenceSOB = "temp"
    	if IntersectCount == 1 then
    		if SobGroup_Empty(LastGroup) == 0 then
    			referenceSOB = LastGroup
    		else
	    		referenceSOB = "splitter"
	    	end
    	end
	    local SobNum = SobGroup_SplitGroupReference("temp1", "temp", referenceSOB, DifferenceCount) 
	    for i = 0,(SobNum - 1),1 do
	      SobGroup_Create("split" .. tostring(Group) .. tostring(Counter))
	      SobGroup_Clear("split" .. tostring(Group) .. tostring(Counter))
	      SobGroup_SobGroupAdd("split" .. tostring(Group) .. tostring(Counter), "temp1"..i)	
		--x cs ricostrzine moduli se distrutta
		    if SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_crewstation") == 1 then   
		     	
		     	gradocorrente = 0
		      if gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] ==     "Ensign       " then
		     	   gradocorrente = 0
		     	 elseif gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] == "Lieutenant   " then
		     	   gradocorrente = 1
		     	 elseif gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] == "Commander    " then
		     	   gradocorrente = 2
		     	 elseif gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] == "Captain      " then
		     	   gradocorrente = 3
		     	 elseif gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] == "Commodore    " then
		     	   gradocorrente = 4
		     	 elseif gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] == "Admiral      " then
		     	   gradocorrente = 5
		     	 elseif gradoList[SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter))+1] == "Fleet Admiral" then
		     	   gradocorrente = 6
		     	 end  
		     	
		      if SobGroup_GetHardPointHealth("split" .. tostring(Group) .. tostring(Counter), "isEnsign") == 0 then
		      	SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "isEnsignCore")
		      end	      		
		            
		      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)), "isLieutenant") > 0 and gradocorrente >= 1 then
		        SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "hgn_isLieutenantCore")     
		      end  
		      
		      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)), "isCommander") > 0 and gradocorrente >= 2 then
		        SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "hgn_isCommanderCore")  	      
		      end  
		      
		      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)), "isCaptain") > 0 and gradocorrente >= 3 then
		        SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "hgn_isCaptainCore") 	       
		      end  
		      
		      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)), "isCommodore") > 0 and gradocorrente >= 4 then
		        SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "hgn_isCommodoreCore") 	      
		      end  
		      
		      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)), "isAdmiral") > 0 and gradocorrente >= 5 then
		        SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "hgn_isAdmiralCore")  	          
		      end  
		      
		      if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)), "isFleetAdmiral") > 0 and gradocorrente >= 6 then
		        SobGroup_CreateSubSystem("split" .. tostring(Group) .. tostring(Counter), "hgn_isFleetAdmiralCore") 	      
		      end  
		    end      	        
	--FX
			  if SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_hyperspacestation") == 1 then    
			    FX_StartEvent("split" .. tostring(Group) .. tostring(Counter), "amb")
			  end
			  if SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_nuclearbomb") == 1 then    
			    FX_StartEvent("split" .. tostring(Group) .. tostring(Counter), "amb")
			  end			  
	--experience	    
		    if HasExperience == 1 then
		    	local exception = 0
		    	if GameRulesName == "Simplex Survival" then
		    		for p=0, Universe_PlayerCount()-1, 1 do
		    			if SobGroup_SobGroupCompare("split" .. tostring(Group) .. tostring(Counter), "SOB_PlayerWaves"..p) == 1 then
		    				exception = 1
		    			end
		    		end
		    	end
		    	if exception == 0 then
		      	SobGroup_SetHardPointHealth("split" .. tostring(Group) .. tostring(Counter), "experience", 0.00001)
		      end
		      if SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_battlestation, rad_blackmarket") == 1 then
		        SobGroup_SetHardPointHealth("split" .. tostring(Group) .. tostring(Counter), "pop", 0.000001)	       
		      end
		    end  
	--ru	    
		    if HasRU == 1 then 
		      SobGroup_SetHardPointHealth("split" .. tostring(Group) .. tostring(Counter), "ru", 0.5)	       
		    end  	
	--name	    
		    if HasName == 1 then 
		      if SobGroup_OwnedBy("split" .. tostring(Group) .. tostring(Counter)) == Universe_CurrentPlayer() then			  
			      if SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_mothership") == 1 then
			        Ping_LabelVisible(Ping_AddSobGroup("Pride of Hiigara", "name", "split" .. tostring(Group) .. tostring(Counter)), 1)
			      elseif SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "vgr_mothership, vgr_mothership_makaan") == 1 then
			        Ping_LabelVisible(Ping_AddSobGroup("Vaygr Leader", "name", "split" .. tostring(Group) .. tostring(Counter)), 1)
		      	elseif SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_shipyard_elohim") == 1 then
		      		Ping_LabelVisible(Ping_AddSobGroup("Captain Elohim", "name", "split" .. tostring(Group) .. tostring(Counter)), 1)
		      	elseif SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_combatbase") == 1 then
		      		Ping_LabelVisible(Ping_AddSobGroup("Force Back", "name", "split" .. tostring(Group) .. tostring(Counter)), 1)
			      else
			      	local unitname = RenameAccordingToDiffentRaces("split" .. tostring(Group) .. tostring(Counter))
			        local name = unitname[casualizzatore[15]+1]
				      local number = unitnumber[casualizzatore[15]+1]
				      Ping_LabelVisible(Ping_AddSobGroup(name .. tostring(number) .. "", "name", "split" .. tostring(Group) .. tostring(Counter)), 1)
				      unitnumber[casualizzatore[15]+1] = unitnumber[casualizzatore[15]+1] + 1   
			      end		      
			    end  
		    end  	
  --caso dei container		           
		    if SobGroup_AreAnyOfTheseTypes("split" .. tostring(Group) .. tostring(Counter), "hgn_minecontainer, vgr_minecontainer, kad_minecontainer, rad_minecontainer, kpr_minecontainer") == 1 then
		      SobGroup_SetHealth("split" .. tostring(Group) .. tostring(Counter), 1)   
		    end
		    if Table_ElementIsIn(Group, {"ghosts"}) == 0 then
		      SobGroup_SetSwitchOwnerFlag("split" .. tostring(Group) .. tostring(Counter), 0)
		      SobGroup_AbilityActivate("split" .. tostring(Group) .. tostring(Counter), AB_Lights, 1)
		    end
	      Counter = Counter + 1
	    end
	  end
	  SobGroup_Clear(LastGroup)
	  SobGroup_SobGroupAdd(LastGroup, Group)
  end  
  
  return Counter
end    

function SobGroup_SplitGroup(SobGroupOut, SobGroupToSplit, NumberToSplit)
  local index = 0
  local distance = 0
  local bool = 0
  local SobNum = 0   
  SobGroup_Clear ("TempSobGroup")  
  SobGroup_Clear ("TempSobGroup1")
  SobGroup_SobGroupAdd ("TempSobGroup", SobGroupToSplit)
  if SobGroup_Empty (SobGroupToSplit) == 1 then
    return 0
  end
  if NumberToSplit > SobGroup_Count(SobGroupToSplit) then
    NumberToSplit = SobGroup_Count(SobGroupToSplit)
  end
  while index < NumberToSplit do
    bool = 0
    interval = 625.0  
    while bool == 0 do
      distance = distance + interval
      if distance > 1000000 then        
        bool = 1
        return SobNum
      end
      SobGroup_FillProximitySobGroup ("TempSobGroup1", "TempSobGroup", "splitter", distance)            
      if SobGroup_Empty ("TempSobGroup1") == 1 then                
      else
        if SobGroup_Count ("TempSobGroup1") > 1 then                    
          if interval <= .2 then                        
            SobGroup_Create(SobGroupOut .. tostring(SobNum))
            SobGroup_Clear (SobGroupOut .. tostring(SobNum))
            SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
            SobGroup_Create("tempsob")
            SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
            SobGroup_Clear ("TempSobGroup")
            SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
            bool = 1
          else
            distance = distance - interval
            interval = interval / 5
          end
        else                    
          SobGroup_Create(SobGroupOut .. tostring(SobNum))
          SobGroup_Clear (SobGroupOut .. tostring(SobNum))
          SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
          SobGroup_Create("tempsob")
          SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
          SobGroup_Clear ("TempSobGroup")
          SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
          bool = 1
        end
      end            
    end
    index = index + SobGroup_Count(SobGroupOut .. tostring(SobNum))
    SobNum = SobNum + 1
  end
  return SobNum
end    

function SobGroup_SplitGroupFromGroup(SobGroupOut, SobGroupToSplit, NumberToSplit, SobGroupFrom)
  local index = 0
  local distance = 0
  local bool = 0
  local SobNum = 0  
  SobGroup_Clear ("TempSobGroup")  
  SobGroup_Clear ("TempSobGroup1")
  SobGroup_SobGroupAdd ("TempSobGroup", SobGroupToSplit)
  if SobGroup_Empty (SobGroupToSplit) == 1 then
    return 0
  end
  if NumberToSplit > SobGroup_Count(SobGroupToSplit) then
    NumberToSplit = SobGroup_Count(SobGroupToSplit)
  end
  while index < NumberToSplit do
    bool = 0
    interval = 625.0  
    while bool == 0 do
      distance = distance + interval
      if distance > 1000000 then        
        bool = 1
        return SobNum
      end
      SobGroup_FillProximitySobGroup ("TempSobGroup1", "TempSobGroup", SobGroupFrom, distance)            
      if SobGroup_Empty ("TempSobGroup1") == 1 then                
      else
        if SobGroup_Count ("TempSobGroup1") > 1 then                    
          if interval <= .2 then                        
            SobGroup_Create(SobGroupOut .. tostring(SobNum))
            SobGroup_Clear (SobGroupOut .. tostring(SobNum))
            SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
            SobGroup_Create("tempsob")
            SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
            SobGroup_Clear ("TempSobGroup")
            SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
            bool = 1
          else
            distance = distance - interval
            interval = interval / 5
          end
        else                    
          SobGroup_Create(SobGroupOut .. tostring(SobNum))
          SobGroup_Clear (SobGroupOut .. tostring(SobNum))
          SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "TempSobGroup1")
          SobGroup_Create("tempsob")
          SobGroup_FillSubstract("tempsob", "TempSobGroup", SobGroupOut .. tostring(SobNum))
          SobGroup_Clear ("TempSobGroup")
          SobGroup_SobGroupAdd ("TempSobGroup", "tempsob")
          bool = 1
        end
      end            
    end
    index = index + SobGroup_Count(SobGroupOut .. tostring(SobNum))
    SobNum = SobNum + 1
  end
  return SobNum
end 

function SobGroup_GetDistanceToSobGroup(sg_Group1, sg_Group2)
  if SobGroup_Empty(sg_Group1) == 0 and SobGroup_Empty(sg_Group2) == 0 then
      local t_position1 = SobGroup_GetPosition(sg_Group1)
      local t_position2 = SobGroup_GetPosition(sg_Group2)
      local li_distance = floor(sqrt((t_position1[1] - t_position2[1])*(t_position1[1] - t_position2[1]) + (t_position1[2] - t_position2[2])*(t_position1[2] - t_position2[2]) + (t_position1[3] - t_position2[3])*(t_position1[3] - t_position2[3])))
      return li_distance
  else
      return nil
  end
end

function Store_Cache(global_cache, key, new_value, use_cache)	--this thing destroys all global variables after save and load (can't fit in save file) -- abandoned!
	local report = {}
	report.use_cache = 0
	report.different_value = 0
	if use_cache == 1 then
		--storing cache
		if not global_cache.keylist then
			global_cache.keylist = {}
		end
		if new_value ~= global_cache[key] then
			report.different_value = 1
			global_cache[key] = new_value	--update the cache with new value
			local idx_to_delete_list = {}
			for idx, old_key in global_cache.keylist do
				if key==old_key then
					idx_to_delete_list = Table_CombineWithTable(idx_to_delete_list, {idx}) --get indices of all old keys with the same name for deletion
				end
			end
			for i=getn(idx_to_delete_list), 1, -1 do
				tremove(global_cache.keylist, idx_to_delete_list[i])	--delete all old keys with the same name backwards
			end
			global_cache.keylist = Table_CombineWithTable(global_cache.keylist, {key})	--keep track of all new keys added to manage the size of the cache
		end
		--managing cache size
		local size_limit = 100	--if the cache is too large, the game save file can't store all that information and all global variables will be lost
		local cache_size = getn(global_cache.keylist)
		--print("Cache size: "..cache_size)
		local oversize_count = cache_size - size_limit
		if oversize_count > 0 then
			local deletion_count = 0 
			for z, keyname in global_cache.keylist do
				global_cache[keyname] = nil --clear the oldest cache
				--print("Purging cache, key: "..keyname)
				deletion_count = deletion_count + 1
				if deletion_count >= oversize_count then
					break
				end
			end
		end
		report.use_cache = 1
	end
	return report
end

function SobGroup_SplitGroupReference(SobGroupOut, SobGroupToSplit, ReferenceSobGroup, NumberToSplit, use_cache)	-- function created by Apollyon470; advanced version (COMPLEX SIMPLE)
	local use_cache = 0	--use_cache or 1
	local cache_keyname = SobGroupOut.."\\"..SobGroupToSplit	--e.g., "SingleCombatJumpKprAI\Keeper_HyperspaceWarfare_SOB"
	local cache_report = Store_Cache(L1_cache, cache_keyname, NumberToSplit, use_cache)
	if cache_report.use_cache == 1 and cache_report.different_value == 0 then	--use existing cache
		--print("using cache")
		return L1_cache[cache_keyname]	--NumberToSplit
	else	--not using cashe or cashe needs to be updated
		--print("not using cache")
    local SplitRef_ReferenceSOB = ReferenceSobGroup
    if SobGroup_Empty (SplitRef_ReferenceSOB) == 1 then
    	if SobGroup_Empty ("splitter") == 0 then
    		SplitRef_ReferenceSOB = "splitter"
    	end
    else
	    local refPos = {0, 0, 0}
	    pos = SobGroup_GetPosition(ReferenceSobGroup)
	    local BadPrecision = 0
	    for t=1,3,1 do
	    	if refPos[t] > 50000 then		--for small maps, just use the central splitter as the reference
	    		BadPrecision = 1
	    	end
	    end
	    if SobGroup_Empty ("splitter") == 0 and BadPrecision == 0 then		--use the central splitter as the distance reference (OVERRIDE)
	    	SplitRef_ReferenceSOB = "splitter"
	    end
	  end
    local index = 0
    local distance = 0
    local bool = 0
    local SobNum = 0
    SobGroup_Create("SplitRef_TempSobGroup")
    SobGroup_Clear ("SplitRef_TempSobGroup")
    SobGroup_Create("SplitRef_TempSobGroup1")
    SobGroup_Clear ("SplitRef_TempSobGroup1")
    SobGroup_SobGroupAdd ("SplitRef_TempSobGroup", SobGroupToSplit)
    if  SobGroup_Empty(SobGroupToSplit) + SobGroup_Empty(SplitRef_ReferenceSOB) > 0 then
        return 0
    end
    if ( NumberToSplit > SobGroup_Count(SobGroupToSplit) ) then
    	NumberToSplit = SobGroup_Count(SobGroupToSplit)
  	end
    while (index < NumberToSplit ) do
        bool = 0
        -- in the interests of resource saving, we start with a search band of 625
        interval = 625
        while (bool == 0) do
            distance = distance + interval
            -- something went wrong.  Please tell me, or have a go at fixing it yourself.
            if (interval > 3000000) then			--is 3000000 enough?
                bool = 1
                return SobNum
            end
            SobGroup_FillProximitySobGroup ("SplitRef_TempSobGroup1", "SplitRef_TempSobGroup", SplitRef_ReferenceSOB, distance)            
            if (SobGroup_Empty("SplitRef_TempSobGroup1") == 1)then
                -- get the next interval
            else
                if (SobGroup_Count("SplitRef_TempSobGroup1") > 1) then
                    -- too many ships, reduce interval
                    if (interval <= .2) then
                        -- Screw it! chunk 'em all in the same sobgroup
                        SobGroup_Create(SobGroupOut .. tostring(SobNum))
                        SobGroup_Clear (SobGroupOut .. tostring(SobNum))
                        SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "SplitRef_TempSobGroup1")
                        SobGroup_Create("tempsob")
                        SobGroup_FillSubstract("tempsob", "SplitRef_TempSobGroup", SobGroupOut .. tostring(SobNum))
                        SobGroup_Clear ("SplitRef_TempSobGroup")
                        SobGroup_SobGroupAdd ("SplitRef_TempSobGroup", "tempsob")
                        bool = 1
                    else
                        distance = distance - interval
                        interval = interval / 5
                    end
                else
                    -- we got one! add it to the list!
                    SobGroup_Create(SobGroupOut .. tostring(SobNum))
                    SobGroup_Clear (SobGroupOut .. tostring(SobNum))
                    SobGroup_SobGroupAdd (SobGroupOut .. tostring(SobNum), "SplitRef_TempSobGroup1")
                    SobGroup_Create("tempsob")
                    SobGroup_FillSubstract("tempsob", "SplitRef_TempSobGroup", SobGroupOut .. tostring(SobNum))
                    SobGroup_Clear ("SplitRef_TempSobGroup")
                    SobGroup_SobGroupAdd ("SplitRef_TempSobGroup", "tempsob")
                    bool = 1
                end
            end            
        end
        index = index + SobGroup_Count(SobGroupOut .. tostring(SobNum))
        SobNum = SobNum + 1
    end
    return SobNum
  end
end

function SoleSurvivor_StoreSurvivorShipType(playerIndex)
	local p = -1
	if playerIndex ~= nil then
		p = playerIndex
	end
	local survivor_found = {0,0,0,0,0,0}
	for x, shiplist_race in ship_races do
		for z, iCount in ship_list[shiplist_race] do
			for i=0,Universe_PlayerCount()-1 do
				if (p == -1 or p == i) and survivor_found[i+1] == 0 then
					if SoleSurvivor_FillTableByType("SoleSurvivor"..i, iCount.name) == 1 then
						survivor_found[i+1] = 1
					end
				end
			end
		end
	end
end

function SoleSurvivor_FillTableByType(survivor_SOB, shiptype)
	if SobGroup_AreAnyOfTheseTypes(survivor_SOB, shiptype) == 1 then
		SoleSurvivorType[SobGroup_OwnedBy(survivor_SOB)+1] = shiptype
		return 1
	else
		return 0
	end
end

function RenameAccordingToDiffentRaces(ship)
	local unitname = ""
	if Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Hiigaran then
		unitname = {"Milestone ", "Kharak ", "Liberty ", "Inflorescence ", "Biosphere ", "Pulsar ", "Ranger ", "Angel Moon ", "Voyager ", "Patriot ", "Simplex ", "Albatross ", "Sky Watcher ", "Navigator ", "Zenith "}
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Vaygr then
		unitname = {"Titan ", "Reich ", "Monarch ", "Devastator ", "Minotaur ", "Potentate ", "Doombringer ", "Black Hole ", "Metal Storm ", "Dark Knight ", "Battle Fortress ", "Armageddon ", "Annihilator ", "Fafnir ", "Executioner "}
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Kadeshi then
		unitname = {"Evangel ", "Sanctuary ", "Charisma ", "Orthodoxy ", "Anointment ", "Foreordination ", "Last Judgement ", "Battle Angel ", "Religiosity ", "Pope ", "Jubilee ", "Hermitage ", "Ascension ", "Deluge ", "Sage "}
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Raider then
		unitname = {"Spaghetti ", "Night Fury ", "Hydra ", "Vodka ", "Popeye ", "Marauder ", "Triton ", "Green Flash ", "Kraken ", "UFO ", "Penetrator ", "Leviathan ", "VIP ", "Insanity ", "Sand Raker "}
	elseif Player_GetRace(SobGroup_OwnedBy(ship)) == Race_Keeper then
		unitname = {"Halcyon ", "Enlightment ", "Omniscience ", "Oracle ", "Matrix ", "Equanimity ", "Sovereignty ", "Trinity ", "Omnipotence ", "Almighty ", "Providence ", "Source Code ", "Infinity ", "Eternity ", "Prometheus "}
	end
	return unitname
end