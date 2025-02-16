aitrace("LOADING CPU BUILD")
dofilepath("data:ai/cpuresource.lua")
dofilepath("data:ai/cpubuildsubsystem.lua")
function CreateBuildDefinitions()	
	if (s_race == Race_Hiigaran) then	
		kCollector = HGN_RESOURCECOLLECTOR
		kRefinery  = HGN_RESOURCECONTROLLER
		kScout = HGN_SCOUT
		kInterceptor = HGN_INTERCEPTOR
		kBomber = HGN_ATTACKBOMBER
		kCarrier = HGN_CARRIER
		kLightCarrier = HGN_LIGHTCARRIER			
		kShipYard = HGN_SHIPYARD
		kDestroyer = HGN_DESTROYER
		kIonDestroyer = HGN_IONDESTROYER
		kBattleCruiser = HGN_BATTLECRUISER
    kBattleShip = HGN_BATTLESHIP			
	elseif (s_race == Race_Vaygr) then
		kCollector = VGR_RESOURCECOLLECTOR
		kRefinery  = VGR_RESOURCECONTROLLER
		kScout = VGR_SCOUT
		kInterceptor = VGR_INTERCEPTOR
		kBomber = VGR_BOMBER
		kCarrier = VGR_CARRIER
		kShipYard = VGR_SHIPYARD
		kDestroyer = VGR_DESTROYER
		kBattleCruiser = VGR_BATTLECRUISER		
		kBattleShip = VGR_ALKHALID
	elseif (s_race == 3) then
		kCollector = KAD_RESSOURCECOLLECTOR
		kRefinery  = KAD_PODSHIP
		kScout = KAD_SENSORPOD
		kInterceptor = KAD_SWARMER_NEW
		kBomber = KAD_HEAVYSWARMER_NEW
		kCarrier = KAD_PODSHIP
		kShipYard = KAD_NEEDLESHIP
		kDestroyer = KAD_DESTROYER_REAL
		kBattleCruiser = KAD_DESTROYER
	elseif (s_race == 4) then
		kCollector = RAD_RESOURCECOLLECTOR
		kRefinery  = RAD_RESOURCECONTROLLER
		kScout = RAD_SCOUTCORVETTE
		kInterceptor = RAD_INTERCEPTOR
		kBomber = RAD_BOMBER
		kCarrier = RAD_SCAFFOLDA
		kShipYard = RAD_SCAFFOLDB
		kDestroyer = RAD_DESTROYERSCAFFOLDA			--RAD_MERC_CRUISER
		kBattleCruiser = RAD_CRUISERSCAFFOLDA
	elseif (s_race == 6) then
		kCollector = KPR_RESOURCECOLLECTOR
		kRefinery  = KPR_RESOURCECONTROLLER
		kScout = KPR_PROBE_OLD
		kInterceptor = KPR_INTERCEPTOR_OLD
		kBomber = KPR_ATTACKDROID
		kCarrier = KPR_CARRIER
		kShipYard = KPR_SHIPYARD_OLD
		kDestroyer = KPR_DESTROYER
		kBattleCruiser = KPR_DREADNAUGHT
	end	
end

---domanda personalizzata per razza in base alle classi-----------------------------------------------------------------------

function CpuBuild_PersonalityDemand()
	if (s_race == Race_Hiigaran) then
		sg_classPersonalityDemand[ eFighter ] = 0.5
		sg_classPersonalityDemand[ eCorvette ] = 0.25
		sg_classPersonalityDemand[ eFrigate ] = 0.15
	elseif (s_race == Race_Vaygr) then
		sg_classPersonalityDemand[ eFighter ] = 0.3
		sg_classPersonalityDemand[ eCorvette ] = 0.25
		sg_classPersonalityDemand[ eFrigate ] = 0.35
	elseif (s_race == 3) then
		sg_classPersonalityDemand[ eFighter ] = 7.55
		sg_classPersonalityDemand[ eCorvette ] = 6.35
		sg_classPersonalityDemand[ eFrigate ] = 5.35
	elseif (s_race == 4) then
		sg_classPersonalityDemand[ eFighter ] = 0.3
		sg_classPersonalityDemand[ eCorvette ] = 0.3
		sg_classPersonalityDemand[ eFrigate ] = 0.3
	elseif (s_race == 6) then
		sg_classPersonalityDemand[ eFighter ] = 7.55
		sg_classPersonalityDemand[ eCorvette ] = 6.35
		sg_classPersonalityDemand[ eFrigate ] = 0.35
	end		
	aitrace("PersonalityDemand: Fi:"..sg_classPersonalityDemand[ eFighter ].." Co:"..sg_classPersonalityDemand[ eCorvette ].." Fr:"..sg_classPersonalityDemand[ eFrigate ])
end

---Init-------------------------------------------------------------------------

function CpuBuild_Init()	
	CreateBuildDefinitions()	
	CpuBuildSS_Init()	
	CpuResource_Init()	
	sg_resourceDemand = 1
	sg_scoutDemand = 0
	sg_militaryDemand = 1	
	sg_randScoutStartBuildTime = 30+Rand(120)	
	sg_randFavorShipType = Rand(100)	
	sg_classPersonalityDemand = {}	
	CpuBuild_PersonalityDemand()	
	sg_subSystemOverflowDemand = 0
	sg_subSystemDemand = 0
	sg_shipDemand = 4    
	sg_militaryToBuildPerCollector = 0.5		
	if (g_LOD == 0) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Hard
	elseif (g_LOD == 1) then
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Hard
	else
		CpuBuild_DefaultShipDemandRules = CpuBuild_DefaultShipDemandRules_Hard
	end	
	cp_shipDemandRange = 0.5
	cp_subSystemDemandRange = 0.5
	if (g_LOD == 1) then
		cp_shipDemandRange = 1
		cp_subSystemDemandRange = 1
	end
	if (g_LOD == 0) then
		cp_shipDemandRange = 2
		cp_subSystemDemandRange = 2
	end		
	if (Override_BuildDemandInit) then
		Override_BuildDemandInit()
	end	
	kUnitCapId_Fighter = GetUnitCapFamilyId("Fighter")
	kUnitCapId_Corvette = GetUnitCapFamilyId("Corvette")
	kUnitCapId_Frigate = GetUnitCapFamilyId("Frigate")	
end

---determina domanda in base alla classe-----------------------------------------------------

function DetermineClassDemand()
	for i=0, eMaxCount do	
		if (sg_classPersonalityDemand[ i ] and sg_classPersonalityDemand[ i ]~=0) then
			ShipDemandSetByClass( i, sg_classPersonalityDemand[ i ] );
		end	
	end	
	ShipDemandSetByClass( eUselessShips, -10 )	
end

---determina anti ship domanda--------------------------------------------------------------------------------

function DetermineAntiChassisDemand(enemyIndex)	
	local kFighterCounterScale = 3.0
	local kCorvetteCounterScale = 1.5
	local kFrigateCounterScale = 1.0	
	local AFiDemand=0
	local ACoDemand=0
	local AFrDemand=0		
	local FiValue = PlayersMilitary_Fighter(enemyIndex, player_max)
	local self_AFiValue = PlayersMilitary_AntiFighter(s_playerIndex, player_max)	
	local enemy_FiTotal = (FiValue-self_AFiValue)*kFighterCounterScale	
	if (enemy_FiTotal < 0) then
		enemy_FiTotal = 0
	end		
	local CoValue = PlayersMilitary_Corvette(enemyIndex, player_max)
	local self_ACoValue = PlayersMilitary_AntiCorvette(s_playerIndex, player_max)	
	local enemy_CoTotal = (CoValue - self_ACoValue)*kCorvetteCounterScale	
	if (enemy_CoTotal < 0) then
		enemy_CoTotal = 0
	end		
	local MSfrig_correction = 0	
	if (s_militaryStrengthVersusTarget < 20) then
		MSfrig_correction = 25
	end		
	local FrValue = PlayersMilitary_Frigate(enemyIndex, player_max) - MSfrig_correction
	local self_AFrValue = PlayersMilitary_AntiFrigate(s_playerIndex, player_max)	
	local enemy_FrTotal = (FrValue - self_AFrValue)*kFrigateCounterScale	
	if (enemy_FrTotal < 0) then
		enemy_FrTotal = 0
	end	
	local enemy_ChassisTotal = enemy_FiTotal + enemy_CoTotal + enemy_FrTotal	
	if (enemy_ChassisTotal > 0) then		
		if (enemy_FiTotal > 0) then
			local FiTotalPercent = enemy_FiTotal*100/enemy_ChassisTotal
			if (FiTotalPercent > 70) then
				AFiDemand = AFiDemand + 3
			elseif (FiTotalPercent > 35) then
				AFiDemand = AFiDemand + 1.5
			end
		end
		if (enemy_CoTotal > 0) then
			local CoTotalPercent = enemy_CoTotal*100/enemy_ChassisTotal
			if (CoTotalPercent > 70) then
				ACoDemand = ACoDemand + 3
			elseif (CoTotalPercent > 35) then
				ACoDemand = ACoDemand + 1.5
			end
		end
		if (enemy_FrTotal > 0) then
			local FrTotalPercent = enemy_FrTotal*100/enemy_ChassisTotal
			if (FrTotalPercent > 70) then
				AFrDemand = AFrDemand + 3
			elseif (FrTotalPercent > 35) then
				AFrDemand = AFrDemand + 1.5
			end
		end
	end		
	if (AFiDemand > 0) then
		ShipDemandAddByClass( eAntiFighter, AFiDemand )
	end
	if (ACoDemand > 0) then
		ShipDemandAddByClass( eAntiCorvette, ACoDemand )
	end
	if (AFrDemand > 0) then
		ShipDemandAddByClass( eAntiFrigate, AFrDemand )
	end	
	aitrace("AChDmd: AFi:"..AFiDemand.." ACo:"..ACoDemand.." AFr:"..AFrDemand)
end

---determina la domanda normalmente--------------------------------------------------------------------

function DetermineChassisDemand(enemyIndex)	
	local FiDemand=0
	local CoDemand=0
	local FrDemand=0	
	local AFiValue = PlayersMilitary_AntiFighter(enemyIndex, player_max)
	local ACoValue = PlayersMilitary_AntiCorvette(enemyIndex, player_max)
	local AFrValue = PlayersMilitary_AntiFrigate(enemyIndex, player_max)
	local ATotal = AFiValue + ACoValue + AFrValue
	if (ATotal <= 0) then
		return
	end	
	if (AFiValue > 5) then
		local AFiPercent = AFiValue*100/ATotal
		if (AFiPercent > 70) then
			FiDemand = FiDemand - 3
		elseif (AFiPercent > 35) then
			FiDemand = FiDemand - 1.5
		end
	end	
	if (ACoValue > 5) then
		local ACoPercent = ACoValue*100/ATotal
		if (ACoPercent > 70) then
			CoDemand = CoDemand - 2
		elseif (ACoPercent > 35) then
			CoDemand = CoDemand - 1
		end
	end	
	if (AFrValue > 5) then
		local AFrPercent = AFrValue*100/ATotal
		if (AFrPercent > 70) then
			FrDemand = FrDemand - 1.5
		elseif (AFrPercent > 35) then
			FrDemand = FrDemand - 0.5
		end
	end		
	ShipDemandAddByClass( eFighter, FiDemand )
	ShipDemandAddByClass( eCorvette, CoDemand )
	ShipDemandAddByClass( eFrigate, FrDemand )
	aitrace("ChDmd: Fi:"..FiDemand.." Co:"..CoDemand.." Fr:"..FrDemand, 1)	
end

---determina domanda senza conteggio (, classe, anti o normale)--------------------------------------------

function DetermineDemandWithNoCounterInfo()	
	if (s_militaryPop < 5) then	
		aitrace("Dmd:Rand:"..sg_randFavorShipType )		
		if (s_race == Race_Hiigaran) then
			if (sg_randFavorShipType < 50) then
				ShipDemandAddByClass( eFighter, 1 )
			elseif (sg_randFavorShipType < 80) then
				ShipDemandAddByClass( eCorvette, 1 )
			elseif (g_LOD < 2 and sg_randFavorShipType < 90) then
				ShipDemandAddByClass( eFrigate, 1 )
			else
				ShipDemandAdd( kDestroyer, 1.0 )
				ShipDemandAdd( kIonDestroyer, 0.8 )
				ShipDemandAdd( HGN_ADVDESTROYER, 0.6 )
				ShipDemandAdd( HGN_ARTILLERYDESTROYER, 0.55 )
				ShipDemandAdd( HGN_CRUISERA, 0.5 )
				ShipDemandAdd( HGN_CRUISERB, 0.5 )
			end
		else
			if (sg_randFavorShipType < 45) then
				ShipDemandAddByClass( eFighter, 1 )
			elseif (sg_randFavorShipType < 75) then
				ShipDemandAddByClass( eCorvette, 1 )	
			elseif (sg_randFavorShipType < 90) then		
			  ShipDemandAddByClass( eFrigate, 1 )	
			else
				ShipDemandAdd( kDestroyer, 1.15 )				
			end
		end
	else	
		aitrace("Dmd:Asking for AntiFrigates" )		
		ShipDemandAddByClass( eAntiFrigate, 1.5 )	
	end
end

---lancia i vari tipi di domanda sopra-----------------------------------------------------------------------

function DetermineCounterDemand()	
	if (s_enemyIndex ~= -1) then		
		local enemyMilitaryCount = PlayersMilitaryPopulation( s_enemyIndex, player_max )
		if (enemyMilitaryCount >= 3) then 			
			DetermineChassisDemand(s_enemyIndex)
			DetermineAntiChassisDemand(s_enemyIndex)		
			return				
		end
	end	
	DetermineDemandWithNoCounterInfo();
end

---calcola domande speciali x singole unit?--------------------------------------------------------

function DetermineSpecialDemand()	
	aitrace("DetermineSpecialDemand - Start", 2)
	-- TODO: check the percentage of ships this AI has a balance them out, if they have more then X% of a ship type 
	-- then decrease the demand for that shiptype (don't do this when under attack though)
	-- TODO: if player has lots of money and isn't under attack, add bonus' to more expensive units		
	-- special rule to increase corvette/frigate production over interceptor production
	-- counter system should balance this out - but current there is no quality checks
--~ 	if (NumSubSystems(CORVETTEPRODUCTION)>0 or NumSubSystems(FRIGATEPRODUCTION)>0) then
--~ 		-- interceptors are pretty weak so don't build more than 4 (or atleast decrease demand drastically)
--~ 		-- it would be better to build assault corvs or frigs
--~ 		if  (NumSquadrons(kInterceptor)>4) then
--~ 			ShipDemandAdd( kInterceptor, -1 )
--~ 		end
--~ 		local numFighters = numQueueOfClass( eFighter )
--~ 		if (numFighters >= 5) then
--~ 			-- if we have more then X fighters decrease the demand for this type of class
--~ 			  ShipDemandAddByClass( eFighter, (-numFighters/5) - 0.5)
--~ 		end
--~ 	end	

  local numRUs = GetRU()

---determina la velocit?del gioco
  local gamespeed = 1
  if IsResearchDone( GAMESPEED3 ) == 1 then
	  gamespeed = 1.1
	elseif IsResearchDone( GAMESPEED2 ) == 1 then
	  gamespeed = 1
	elseif IsResearchDone( GAMESPEED1 ) == 1 then
	  gamespeed = 0.8
	end	 	
	local GameTime = (gameTime()*gamespeed) 

---determina il grado (da 0 a 6)
  local rank = (NumSubSystems(ISLIEUTENANT) + NumSubSystems(ISCOMMANDER) + NumSubSystems(ISCAPTAIN) + NumSubSystems(ISCOMMODORE) + NumSubSystems(ISADMIRAL) + NumSubSystems(ISFLEETADMIRAL))
	local unitcapmax = 0
	if NumSubSystems(UNITCAPSRANK4) > 0 then
	  unitcapmax = 4
	elseif NumSubSystems(UNITCAPSRANK3) > 0 then
	  unitcapmax = 3
	elseif NumSubSystems(UNITCAPSRANK2) > 0 then
	  unitcapmax = 2
  elseif NumSubSystems(UNITCAPSRANK1) > 0 then
	  unitcapmax = 1		
	end	
  
---class by the rank
  if (s_race == Race_Hiigaran) then
	  if rank >= 4 then
	    ShipDemandAddByClass( eFighter, 0.05 )
	    ShipDemandAddByClass( eCorvette, 0.25 )
	    ShipDemandAddByClass( eFrigate, 0.35 )
	  elseif rank > 2 then
	    ShipDemandAddByClass( eFighter, 0.2 )
	    ShipDemandAddByClass( eCorvette, 0.3 )
	    ShipDemandAddByClass( eFrigate, 0.1 )
	  else
	    ShipDemandAddByClass( eFighter, 0.3 )
	    ShipDemandAddByClass( eCorvette, 0.2 )
	    ShipDemandAddByClass( eFrigate, 0.1 )
	  end  
	  --population control
	  if NumSubSystems(AI_UNITCAP) > 0 then
	  	ShipDemandAddByClass( eFighter, -10 )
	  	ShipDemandAddByClass( eCorvette, -10 )
	  end
	end  
	
---ad inizio match determina la domanda x unit?di base	
---Interceptor
	if (ShipDemandGet( kInterceptor ) > 0 and NumSubSystems(FIGHTERPRODUCTION) > 0) then
		ShipDemandAdd( kInterceptor, 0.5 )
	end		
	if (s_race == Race_Hiigaran) then
---Gunship
		if (ShipDemandGet( HGN_ASSAULTCORVETTE ) > 0 and NumSubSystems(CORVETTEPRODUCTION) > 0) then
			ShipDemandAdd( HGN_ASSAULTCORVETTE, 0.6 )
		end		
---Flak
		if (ShipDemandGet( HGN_ASSAULTFRIGATE ) > 0 and NumSubSystems(FRIGATEPRODUCTION) > 0) then
			ShipDemandAdd( HGN_ASSAULTFRIGATE, 0.7 )
		end
	end					
	
---Mobile Refinery
  local NumRefinery = 0
  if (s_race == Race_Hiigaran) then
		NumRefinery = NumSquadrons(kRefinery) + NumSquadronsQ(kRefinery) + NumSquadrons(HGN_SCAVER) + NumSquadronsQ(HGN_SCAVER)
  elseif (s_race == Race_Vaygr) then
		NumRefinery = NumSquadrons(kRefinery) + NumSquadronsQ(kRefinery) + NumSquadrons(VGR_RESOURCECONTROLLERDOUBLE) + NumSquadronsQ(VGR_RESOURCECONTROLLERDOUBLE) + NumSquadrons(VGR_SCAVER) + NumSquadronsQ(VGR_SCAVER)
  elseif (s_race == 3) then
		NumRefinery = NumSquadrons(kRefinery) + NumSquadronsQ(kRefinery)
  elseif (s_race == 4) then
		NumRefinery = NumSquadrons(kRefinery) + NumSquadronsQ(kRefinery)
	elseif (s_race == 6) then
		NumRefinery = NumSquadrons(kRefinery) + NumSquadronsQ(kRefinery)
  end
	local NumCollector = NumSquadrons(kCollector) + NumSquadronsQ(kCollector)
  if (NumCollector / NumRefinery > 7) and (NumRefinery < 3) then
    ShipDemandAdd( kRefinery, 3 )
  end
  
---Domanda addizionale per Corvette	
	if (s_selfTotalValue > 90) then
		local additionalCorvetteDemand = 0.5
		if (s_race == Race_Hiigaran) then
		  local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
			if (researchcount > 0) then
				additionalCorvetteDemand = additionalCorvetteDemand + 0.3
			end
			local advresearchcount = NumSubSystems(ADVANCEDRESEARCH) + NumSubSystemsQ(ADVANCEDRESEARCH)
			if (advresearchcount > 0) then
				additionalCorvetteDemand = additionalCorvetteDemand + 0.2
			end
			local advresearchcount1 = NumSubSystems(ADVANCEDRESEARCH1) + NumSubSystemsQ(ADVANCEDRESEARCH1)
			if (advresearchcount1 > 0) then
				additionalCorvetteDemand = additionalCorvetteDemand + 0.1
			end
		elseif (s_race == Race_Vaygr) then
		  local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
			if (researchcount > 0) then
				additionalCorvetteDemand = additionalCorvetteDemand + 0.3
			end	
		end		
		ShipDemandAddByClass( eCorvette, additionalCorvetteDemand )		
		ShipDemandAddByClass( eFighter, -0.5 )		
	end     
	
---Domanda addizionale per Frigate	
	if (s_selfTotalValue > 120) then
		local additionalFrigDemand = 0.75
		if (s_race == Race_Hiigaran) then
		  local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
			if (researchcount > 0) then
				additionalFrigDemand = additionalFrigDemand + 0.1
			end
			local advresearchcount = NumSubSystems(ADVANCEDRESEARCH) + NumSubSystemsQ(ADVANCEDRESEARCH)
			if (advresearchcount > 0) then
				additionalFrigDemand = additionalFrigDemand + 0.2
			end
			local advresearchcount1 = NumSubSystems(ADVANCEDRESEARCH1) + NumSubSystemsQ(ADVANCEDRESEARCH1)
			if (advresearchcount1 > 0) then
				additionalFrigDemand = additionalFrigDemand + 0.3
			end
		elseif (s_race == Race_Vaygr) then
		  local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
			if (researchcount > 0) then
				additionalFrigDemand = additionalFrigDemand + 0.3
			end		
		end		
		ShipDemandAddByClass( eFrigate, additionalFrigDemand )		
		ShipDemandAddByClass( eCorvette, -0.4 )		
	end   
	
---Defense e Capture	 
	local numSpecial = numQueueOfClass(eCapture) + numQueueOfClass(eShield)
	local numFrigates = numQueueOfClass(eFrigate)
	if(numFrigates == 0 or numSpecial / numFrigates > 0.3) then        
    ShipDemandAddByClass( eCapture, -10 )
    ShipDemandAddByClass( eShield, -10 )        
	else        
    if (s_militaryPop < 5) then
        ShipDemandAddByClass( eCapture, -4 )
        ShipDemandAddByClass( eShield, -4.5 )
    elseif (s_militaryPop < 10) then
        ShipDemandAddByClass( eCapture, -2 )
        ShipDemandAddByClass( eShield, -2.5 )
    elseif (s_militaryPop < 15) then
        ShipDemandAddByClass( eCapture, -1 )
        ShipDemandAddByClass( eShield, -1.5 )
    elseif (s_militaryPop > 30) then
        ShipDemandAddByClass( eCapture, 1 )
        ShipDemandAddByClass( eShield, 1 )
		end
	end    	
	
---in base a tre livelli economici aggiunge sempre domanda ad unit?massicce			
----LIVELLO ECONOMICO 1---------------------------------	  
	aitrace("UnderAttackThreat: "..UnderAttackThreat(), 1)
	aitrace("s_militaryPop: "..s_militaryPop, 1)
	if (((GetNumCollecting() > 9 or numRUs > 1400) and s_militaryPop > 8 and UnderAttackThreat() < -75)) or numRUs > 4000 then
		aitrace("LIVELLO ECONOMICO 1", 2)
    if (s_race == Race_Hiigaran) then 
      local numBattleCruiser = NumSquadrons( HGN_BATTLECRUISER ) + NumSquadronsQ( HGN_BATTLECRUISER )
      local numBattleCruiserNuke = NumSquadrons( HGN_BATTLECRUISERNUKE ) + NumSquadronsQ( HGN_BATTLECRUISERNUKE )
      local numBattleship = NumSquadrons( HGN_BATTLESHIP ) + NumSquadronsQ( HGN_BATTLESHIP ) 
      local numBattleCruiserBattleship = numBattleCruiser + numBattleship   
      local ioncannon1 = NumSubSystems(IONCANNON1) + NumSubSystems(HEAVYIONCANNONS1BC) + NumSubSystems(HEAVYIONCANNONS1BS) 		
			local ioncannon2 = NumSubSystems(IONCANNON2) + NumSubSystems(HEAVYIONCANNONS2BC) + NumSubSystems(HEAVYIONCANNONS2BS)  	
			local ioncannons = ioncannon1 + ioncannon2 
---Battleship          						
			if (IsResearchDone( BATTLESHIPTECH ) == 1 and numRUs > 2500) then				
				ShipDemandAdd( HGN_BATTLESHIP, 1.05 + (rank/1.412) + (1000*log(GameTime+1)/10540) - (numBattleship/8))
			else
			  ShipDemandAdd( HGN_BATTLESHIP, 0.54 + (rank/1.422) + (1000*log(GameTime+1)/10580) - (numBattleship/8))		  	
			end											  
		  if ioncannons >= (numBattleCruiserBattleship * 2) then
		    ShipDemandAdd(HGN_BATTLESHIP, 0.3825)	
		  else
		    ShipDemandAdd(HGN_BATTLESHIP, -10)	  
		  end		             
---Battlecruiser        						
			if (IsResearchDone( BATTLECRUISERIONWEAPONS ) == 1 and numRUs > 1900) then				
				ShipDemandAdd( HGN_BATTLECRUISER, 0.992 + (rank/1.521) + (1000*log(GameTime+1)/11030) - (numBattleCruiser/10))
				ShipDemandAdd( HGN_BATTLECRUISERNUKE, 0.997 + (rank/1.541) + (1000*log(GameTime+1)/11010) - (numBattleCruiserNuke/9))
			else
			  ShipDemandAdd( HGN_BATTLECRUISER, 0.542 + (rank/1.561) + (1000*log(GameTime+1)/11080) - (numBattleCruiser/10))
			  ShipDemandAdd( HGN_BATTLECRUISERNUKE, 0.547 + (rank/1.541) + (1000*log(GameTime+1)/11700) - (numBattleCruiserNuke/9))
			end						
		  if ioncannons >= (numBattleCruiserBattleship * 2) then
		    ShipDemandAdd(HGN_BATTLECRUISER, 0.3574)	
		  else
		    ShipDemandAdd(HGN_BATTLECRUISER, -10)	  
		  end		  
---Destroyer
      local numDestroyer = NumSquadrons( HGN_DESTROYER ) + NumSquadronsQ( HGN_DESTROYER ) 
     	if (IsResearchDone( DESTROYERTECH ) == 1 and numRUs > 1150) then     	
     	  if IsResearchDone( IMPROVEDTORPEDODESTROYER ) == 1 then
     	    ShipDemandAdd( HGN_DESTROYER, 0.834 + (rank/2.124) + (1000*log(GameTime+1)/13545) - (numDestroyer/11))	
     	  else
     	    ShipDemandAdd( HGN_DESTROYER, 0.631 + (rank/2.147) + (1000*log(GameTime+1)/13585) - (numDestroyer/11))	
     	  end
     	else
     	  ShipDemandAdd( HGN_DESTROYER, 0.434 + (rank/2.547) + (1000*log(GameTime+1)/13581) - (numDestroyer/11))  			
			end	
---Sweeper Destroyer
      local numSweeperDestroyer = NumSquadrons( HGN_SWEEPERDESTROYER ) + NumSquadronsQ( HGN_SWEEPERDESTROYER ) 
     	if (IsResearchDone( SWEEPERDESTROYERTECH ) == 1 and numRUs > 1050) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOSWEEPERDESTROYER ) == 1 then
     	    ShipDemandAdd( HGN_SWEEPERDESTROYER, 0.801 + (rank/2.185) + (1000*log(GameTime+1)/14575) - (numSweeperDestroyer/9))	
     	  else
     	    ShipDemandAdd( HGN_SWEEPERDESTROYER, 0.607 + (rank/2.142) + (1000*log(GameTime+1)/14521) - (numSweeperDestroyer/9))	
     	  end
     	else
     	  ShipDemandAdd( HGN_SWEEPERDESTROYER, 0.404 + (rank/2.112) + (1000*log(GameTime+1)/14575) - (numSweeperDestroyer/9))  			
			end				
---Missile Destroyer			
      local numMissileDestroyer = NumSquadrons( HGN_MISSILEDESTROYER ) + NumSquadronsQ( HGN_MISSILEDESTROYER ) 
      if (IsResearchDone( MISSILEDESTROYERTECH ) == 1 and numRUs > 1350) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOMISSILEDESTROYER ) == 1 then
     	    ShipDemandAdd( HGN_MISSILEDESTROYER, 0.817 + (rank/2.877) + (1000*log(GameTime+1)/13251) - (numMissileDestroyer/12))	
     	  else
     	    ShipDemandAdd( HGN_MISSILEDESTROYER, 0.614 + (rank/2.785) + (1000*log(GameTime+1)/13257) - (numMissileDestroyer/12))	
     	  end		
     	else
     	  ShipDemandAdd( HGN_MISSILEDESTROYER, 0.417 + (rank/2.871) + (1000*log(GameTime+1)/13257) - (numMissileDestroyer/12))  	
			end				
---Ion Destroyer			
      local numIonDestroyer = NumSquadrons( HGN_IONDESTROYER ) + NumSquadronsQ( HGN_IONDESTROYER ) 
      if (IsResearchDone( IONDESTROYERTECH ) == 1 and numRUs > 1400) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOIONDESTROYER ) == 1 then
     	    ShipDemandAdd( HGN_IONDESTROYER, 0.824 + (rank/2.578) + (1000*log(GameTime+1)/13587) - (numIonDestroyer/12))	
     	  else
     	    ShipDemandAdd( HGN_IONDESTROYER, 0.624 + (rank/2.572) + (1000*log(GameTime+1)/13575) - (numIonDestroyer/12))	
     	  end		
     	else
     	  ShipDemandAdd( HGN_IONDESTROYER, 0.428 + (rank/2.577) + (1000*log(GameTime+1)/13357) - (numIonDestroyer/12))  	
			end	
---Adv Destroyer			
      local numAdvDestroyer = NumSquadrons( HGN_ADVDESTROYER ) + NumSquadronsQ( HGN_ADVDESTROYER ) 
      if (IsResearchDone( ADVDESTROYERTECH ) == 1 and numRUs > 1600) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOADVDESTROYER ) == 1 then
     	    ShipDemandAdd( HGN_ADVDESTROYER, 0.812 + (rank/2.577) + (1000*log(GameTime+1)/12525) - (numAdvDestroyer/13))	
     	  else
     	    ShipDemandAdd( HGN_ADVDESTROYER, 0.611 + (rank/2.545) + (1000*log(GameTime+1)/12578) - (numAdvDestroyer/13))	
     	  end		
     	else
     	  ShipDemandAdd( HGN_ADVDESTROYER, 0.471 + (rank/2.571) + (1000*log(GameTime+1)/12554) - (numAdvDestroyer/13))  	
			end		
---Artillery Destroyer			
      local numArtilleryDestroyer = NumSquadrons( HGN_ARTILLERYDESTROYER ) + NumSquadronsQ( HGN_ARTILLERYDESTROYER ) 
      if (IsResearchDone( ARTILLERYDESTROYERTECH ) == 1 and numRUs > 1600) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOADVDESTROYER ) == 1 then
     	    ShipDemandAdd( HGN_ARTILLERYDESTROYER, 0.824 + (rank/2.478) + (1000*log(GameTime+1)/12571) - (numArtilleryDestroyer/13))	
     	  else
     	    ShipDemandAdd( HGN_ARTILLERYDESTROYER, 0.628 + (rank/2.457) + (1000*log(GameTime+1)/12558) - (numArtilleryDestroyer/13))	
     	  end		
     	else
     	  ShipDemandAdd( HGN_ARTILLERYDESTROYER, 0.412 + (rank/2.474) + (1000*log(GameTime+1)/12532) - (numArtilleryDestroyer/13))  	
			end		
---Mini Vortex			
      local numMiniVortex = NumSquadrons( HGN_MINIVORTEX ) + NumSquadronsQ( HGN_MINIVORTEX ) 
      if (IsResearchDone( MINIVORTEXTECH ) == 1 and numRUs > 2900) then  
      	if IsResearchDone( MINIVORTEXTECH ) == 1 then   	
     	   	ShipDemandAdd( HGN_MINIVORTEX, 0.721 + (rank/2.259) + (1000*log(GameTime+1)/9507) - (numMiniVortex/4))	
     		else
     	  ShipDemandAdd( HGN_MINIVORTEX, 0.502 + (rank/2.228) + (1000*log(GameTime+1)/9510) - (numMiniVortex/4))  	
				end
     	else
     	  ShipDemandAdd( HGN_MINIVORTEX, 0.307 + (rank/2.278) + (1000*log(GameTime+1)/10525) - (numMiniVortex/4))  	
			end			
---Cruiser A			
      local numCruisera = NumSquadrons( HGN_CRUISERA ) + NumSquadronsQ( HGN_CRUISERA ) 
      local numShipyards = NumSquadrons( HGN_SHIPYARD ) + NumSquadronsQ( HGN_SHIPYARD )
      if (IsResearchDone( CRUISERTECH ) == 1 and numRUs > 1900) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOCRUISERA ) == 1 then
     	    ShipDemandAdd( HGN_CRUISERA, 0.808 + (rank/2.412) - (1000*log(GameTime+1)/10525) - (numCruisera/2) - (numShipyards*2))	
     	  else
     	    ShipDemandAdd( HGN_CRUISERA, 0.608 + (rank/2.287) - (1000*log(GameTime+1)/10578) - (numCruisera/2) - (numShipyards*2))	
     	  end		
     	else
     	  ShipDemandAdd( HGN_CRUISERA, 0.409 + (rank/2.247) + (1000*log(GameTime+1)/11527) - (numCruisera/2) - (numShipyards*2))  	
			end	
---Cruiser B			
      local numCruiserb = NumSquadrons( HGN_CRUISERB ) + NumSquadronsQ( HGN_CRUISERB ) 
      local numShipyards = NumSquadrons( HGN_SHIPYARD ) + NumSquadronsQ( HGN_SHIPYARD )
      if (IsResearchDone( CRUISERTECH ) == 1 and numRUs > 1900) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOCRUISERB ) == 1 then
     	    ShipDemandAdd( HGN_CRUISERB, 0.827 + (rank/2.287) - (1000*log(GameTime+1)/11028) - (numCruiserb/2) - (numShipyards*2))	
     	  else
     	    ShipDemandAdd( HGN_CRUISERB, 0.609 + (rank/2.247) - (1000*log(GameTime+1)/11078) - (numCruiserb/2) - (numShipyards*2))	
     	  end		
     	else
     	  ShipDemandAdd( HGN_CRUISERB, 0.404 + (rank/2.587) + (1000*log(GameTime+1)/11257) - (numCruiserb/2) - (numShipyards*2))  	
			end		  				  				  				  			  				  			  	
---Vortex   
      local numVortex = NumSquadrons( HGN_VORTEX ) + NumSquadronsQ( HGN_VORTEX )  
--      local numMiniVortex = NumSquadrons( HGN_MINIVORTEX ) + NumSquadronsQ( HGN_MINIVORTEX ) 						
			if (IsResearchDone( VORTEXTECH ) == 1 and numRUs > 2000) then				
				ShipDemandAdd( HGN_VORTEX, 0.981 + (rank/1.475) + (1000*log(GameTime+1)/11254) - (numVortex/8))
--				ShipDemandAdd( HGN_MINIVORTEX, 0 - (numMiniVortex))
			else
			  ShipDemandAdd( HGN_VORTEX, 0.538 + (rank/1.458) + (1000*log(GameTime+1)/11584) - (numVortex/8))		  	
			end				
			local t1 = NumSubSystems(VTORPEDOLAUNCHER1) 		
			local t2 = NumSubSystems(VTORPEDOLAUNCHER2) 	
			local t3 = NumSubSystems(VTORPEDOLAUNCHER3)
			local t4 = NumSubSystems(VTORPEDOLAUNCHER4)
			local ts = t1 + t2 + t3 +t4				  
		  if ts >= (numVortex * 3) then
		    ShipDemandAdd(HGN_VORTEX, 0.3624)	
		  else
		    ShipDemandAdd(HGN_VORTEX, -10)	  
		  end			
---Battleship   
      --local numBattleship = NumSquadrons( HGN_BATTLESHIP ) + NumSquadronsQ( HGN_BATTLESHIP )   						
			--if (IsResearchDone( BATTLESHIPTECH ) == 1 and numRUs > 2100) then				
				--ShipDemandAdd( HGN_BATTLESHIP, 0.97 + (rank/1.2) + (1000*log(GameTime+1)/9500) - (numBattleship/6))
			--else
			  --ShipDemandAdd( HGN_BATTLESHIP, 0.52 + (rank/1.2) + (1000*log(GameTime+1)/9500) - (numBattleship/6))		  	
			--end				
			--local hic1 = NumSubSystems(HIC1) 		
			--local hic2 = NumSubSystems(HIC2) 	
			--local hics = hic1 + hic2				  
		  --if hics >= (numBattleship * 2) then
		    --ShipDemandAdd(HGN_BATTLESHIP, 0.37)	
		  --else
		    --ShipDemandAdd(HGN_BATTLESHIP, -10)	  
		  --end					  
---Light Carrier
      if NumSubSystems(HYPERSPACE) == 0 then
			  ShipDemandAdd( kLightCarrier, 0.7519 )				
			end  
---Carrier			
			if NumSubSystems(HYPERSPACE) == 0 then
				ShipDemandAdd( kCarrier, 1 )					
				ShipDemandAdd( HGN_BATTLECARRIER, 0.7527 )				
			end  							
		elseif (s_race == Race_Vaygr) then
---Keeper      
      local numKeeper = NumSquadrons( VGR_HAMMERHEAD ) + NumSquadronsQ( VGR_HAMMERHEAD )   						
			if (IsResearchDone( KEEPERIONWEAPONS ) == 1 and numRUs > 2000) then				
				ShipDemandAdd( VGR_HAMMERHEAD, 0.811 + (rank/1.575) + (1000*log(GameTime+1)/9578) - (numKeeper/9))
			else
			  ShipDemandAdd( VGR_HAMMERHEAD, 0.318 + (rank/1.568) + (1000*log(GameTime+1)/9258) - (numKeeper/9))		  	
			end				
---Battlecruiser      
      local numBattleCruiser = NumSquadrons( VGR_BATTLECRUISER ) + NumSquadronsQ( VGR_BATTLECRUISER )   						
			if (IsResearchDone( BATTLECRUISERIONWEAPONS ) == 1 and numRUs > 2000) then				
				ShipDemandAdd( VGR_BATTLECRUISER, 0.917 + (rank/1.641) + (1000*log(GameTime+1)/11575) - (numBattleCruiser/9))
			else
			  ShipDemandAdd( VGR_BATTLECRUISER, 0.418 + (rank/1.657) + (1000*log(GameTime+1)/11952) - (numBattleCruiser/9))		  	
			end				
			local BCTurret = NumSubSystems(BCIONBEAMTURRET) 				  
		  if BCTurret >= numBattleCruiser then
		    ShipDemandAdd(VGR_BATTLECRUISER, 0.3925)	
		  else
		    ShipDemandAdd(VGR_BATTLECRUISER, -10)	  
		  end
---Strategic Battlecruiser      
      local numNukeBattleCruiser = NumSquadrons( VGR_BATTLECRUISER_HERO ) + NumSquadronsQ( VGR_BATTLECRUISER_HERO )   						
			if (IsResearchDone( BATTLECRUISERNUKEWEAPONS ) == 1 and numRUs > 5000) then				
				ShipDemandAdd( VGR_BATTLECRUISER_HERO, 1.918 + (rank/1.658) + (1000*log(GameTime+1)/11578) - (numNukeBattleCruiser/9))
			else
			  ShipDemandAdd( VGR_BATTLECRUISER_HERO, 1.412 + (rank/1.617) + (1000*log(GameTime+1)/11247) - (numNukeBattleCruiser/9))
			end
			if IsResearchDone( IMPROVEDNUKECANNONBATTLECRUISER ) == 1 then
		    ShipDemandAdd(VGR_BATTLECRUISER_HERO, 1.3958)
		  end
---Missile Battlecruiser      
      local numMissileBattleCruiser = NumSquadrons( VGR_MISSILEBATTLECRUISER ) + NumSquadronsQ( VGR_MISSILEBATTLECRUISER )   						
			if (IsResearchDone( MISSILEBATTLECRUISERIONWEAPONS ) == 1 and numRUs > 2500) then				
				ShipDemandAdd( VGR_MISSILEBATTLECRUISER, 0.911 + (rank/1.654) + (1000*log(GameTime+1)/11558) - (numMissileBattleCruiser/9))
			else
			  ShipDemandAdd( VGR_MISSILEBATTLECRUISER, 0.417 + (rank/1.696) + (1000*log(GameTime+1)/11592) - (numMissileBattleCruiser/9))		  	
			end				
			local MBCTurret = NumSubSystems(VGR_MBC_C) + NumSubSystems(VGR_MBC_M) + NumSubSystems(VGR_MBC_D)
		  if MBCTurret >= numMissileBattleCruiser then
		    ShipDemandAdd(VGR_MISSILEBATTLECRUISER, 0.3975)	
		  else
		    ShipDemandAdd(VGR_MISSILEBATTLECRUISER, -10)	  
		  end
---Peacemaker      
      local numPeacemaker = NumSquadrons( VGR_HEAVYCRUISER ) + NumSquadronsQ( VGR_HEAVYCRUISER )   						
			if (IsResearchDone( PEACEMAKERTECH ) == 1 and numRUs > 2000) then				
				ShipDemandAdd( VGR_HEAVYCRUISER, 0.932 + (rank/1.658) + (1000*log(GameTime+1)/11585) - (numPeacemaker/3))
			else
			  ShipDemandAdd( VGR_HEAVYCRUISER, 0.511 + (rank/1.675) + (1000*log(GameTime+1)/11357) - (numPeacemaker/3))		  	
			end
---Destroyer
--      local numDestroyer = NumSquadrons( VGR_DESTROYER ) + NumSquadronsQ( VGR_DESTROYER )  
--     	if (IsResearchDone( DESTROYERGUNS ) == 1 and numRUs > 1400) then     	
--     	  if IsResearchDone( IMPROVEDTORPEDODESTROYER ) == 1 then
--     	    ShipDemandAdd( VGR_DESTROYER, 0.64 + (rank/1.9) + (1000*log(GameTime+1)/13000) - (numDestroyer/6))	
--     	  else
--     	    ShipDemandAdd( VGR_DESTROYER, 0.54 )	
--     	  end
--     	else
--     	  ShipDemandAdd( VGR_DESTROYER, 0.43 + (rank/1.82) + (1000*log(GameTime+1)/13000) - (numDestroyer/13))  			
--			end		
---Pulse Destroyer
      local numPulseDestroyer = NumSquadrons( VGR_PULSEDESTROYER ) + NumSquadronsQ( VGR_PULSEDESTROYER )  
     	if (IsResearchDone( PULSEDESTROYERGUNS ) == 1 and numRUs > 1700) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOPULSEDESTROYER ) == 1 then
     	    ShipDemandAdd( VGR_PULSEDESTROYER, 0.661 + (rank/1.857) + (1000*log(GameTime+1)/12558) - (numPulseDestroyer/6))	
     	  else
     	    ShipDemandAdd( VGR_PULSEDESTROYER, 0.5351 )	
     	  end
     	else
     	  ShipDemandAdd( VGR_PULSEDESTROYER, 0.432 + (rank/1.817) + (1000*log(GameTime+1)/12532) - (numPulseDestroyer/13))  			
			end					
---Cruiser
      local numCruiser = NumSquadrons( VGR_CRUISER ) + NumSquadronsQ( VGR_CRUISER )  
     	if (IsResearchDone( CRUISERTECH ) == 1 and numRUs > 1900) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOCRUISER ) == 1 then
     	    ShipDemandAdd( VGR_CRUISER, 0.712 + (rank/1.858) + (1000*log(GameTime+1)/12321) - (numCruiser/4))	
     	  else
     	    ShipDemandAdd( VGR_CRUISER, 0.5358 )	
     	  end
     	else
     	  ShipDemandAdd( VGR_CRUISER, 0.427 + (rank/1.812) + (1000*log(GameTime+1)/12213) - (numCruiser/4))  			
			end			
---Artillery Cruiser
      local numArtilleryCruiser = NumSquadrons( VGR_ARTILLERYSHIP ) + NumSquadronsQ( VGR_ARTILLERYSHIP )  
     	if (IsResearchDone( ARTILLERYTECH ) == 1 and numRUs > 2000) then     	
     	  ShipDemandAdd( VGR_ARTILLERYSHIP, 0.758 + (rank/1.825) + (1000*log(GameTime+1)/12357) - (numArtilleryCruiser/5))		      		
     	else
     		ShipDemandAdd( VGR_ARTILLERYSHIP, 0.451 + (rank/1.875) + (1000*log(GameTime+1)/12251) - (numArtilleryCruiser/5))
			end			
--Ion Cruiser
      local numIonCruiser = NumSquadrons( VGR_LIGHTCRUISER ) + NumSquadronsQ( VGR_LIGHTCRUISER )  
     	if (IsResearchDone( IONCRUISERTECH ) == 1 and numRUs > 2100) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOLIGHTCRUISER ) == 1 then
     	    ShipDemandAdd( VGR_LIGHTCRUISER, 0.755 + (rank/1.851) + (1000*log(GameTime+1)/12128) - (numIonCruiser/5))	
     	  else
     	    ShipDemandAdd( VGR_LIGHTCRUISER, 0.5828 )	
     	  end
     	else
     	  ShipDemandAdd( VGR_LIGHTCRUISER, 0.471 + (rank/1.884) + (1000*log(GameTime+1)/12885) - (numIonCruiser/5))  			
			end
--Ion Cruiser type B
      local numIonCruiser = NumSquadrons( VGR_LIGHTCRUISER_GUN ) + NumSquadronsQ( VGR_LIGHTCRUISER_GUN )  
     	if (IsResearchDone( IONCRUISERTECH ) == 1 and numRUs > 2100) then     	
     	  if IsResearchDone( IMPROVEDTORPEDOLIGHTCRUISER ) == 1 then
     	    ShipDemandAdd( VGR_LIGHTCRUISER_GUN, 0.759 + (rank/1.875) + (1000*log(GameTime+1)/12394) - (numIonCruiser/5))	
     	  else
     	    ShipDemandAdd( VGR_LIGHTCRUISER_GUN, 0.5827 )	
     	  end
     	else
     	  ShipDemandAdd( VGR_LIGHTCRUISER_GUN, 0.472 + (rank/1.851) + (1000*log(GameTime+1)/12188) - (numIonCruiser/5))  			
			end
---BattleCarrier
      local numBattleCarrier = NumSquadrons(VGR_BATTLECARRIER) + NumSquadronsQ(VGR_BATTLECARRIER) 	
			if (IsResearchDone( BATTLECARRIERTECH ) == 1) then
			  ShipDemandAdd( VGR_BATTLECARRIER, 1.814 + (rank/1.651) + (1000*log(GameTime+1)/10757) - (numBattleCarrier/2))
			else
			  ShipDemandAdd( VGR_BATTLECARRIER, 1.319 + (rank/1.657) + (1000*log(GameTime+1)/10759) - (numBattleCarrier/2))		  	
			end				
---Battleship		  		  
      local numBattleShip = NumSquadrons(VGR_ALKHALID) + NumSquadronsQ(VGR_ALKHALID) 	
			if (IsResearchDone( BATTLESHIPTECH ) == 1) then
			  ShipDemandAdd( VGR_ALKHALID, 0.852 + (rank/1.755) + (1000*log(GameTime+1)/11757) - (numBattleShip/8))
			else
			  ShipDemandAdd( VGR_ALKHALID, 0.358 + (rank/1.757) + (1000*log(GameTime+1)/11758) - (numBattleShip/8))		  	
			end
---Titan		  		  
      local numBattleShip = NumSquadrons(VGR_BATTLESHIP) + NumSquadronsQ(VGR_BATTLESHIP) 	
			if (IsResearchDone( TITANTECH ) == 1) then
			  ShipDemandAdd( VGR_BATTLESHIP, 0.952 + (rank/1.765) + (1000*log(GameTime+1)/11657) - (numBattleShip/3))
			else
			  ShipDemandAdd( VGR_BATTLESHIP, 0.458 + (rank/1.737) + (1000*log(GameTime+1)/11658) - (numBattleShip/3))		  	
			end
---Titan X
      local numBattleShip = NumSquadrons(VGR_MISSLEDREADNAUGHT) + NumSquadronsQ(VGR_MISSLEDREADNAUGHT) 	
			if (IsResearchDone( TITANTECH ) == 1) then
			  ShipDemandAdd( VGR_MISSLEDREADNAUGHT, 0.978 + (rank/1.637) + (1000*log(GameTime+1)/10877) - (numBattleShip/3))
			else
			  ShipDemandAdd( VGR_MISSLEDREADNAUGHT, 0.457 + (rank/1.378) + (1000*log(GameTime+1)/10799) - (numBattleShip/3))		  	
			end
		  local kineticcannon = NumSubSystems(KINETICCANNON)		
			local kineticcannon1 = NumSubSystems(KINETICCANNON1)
			local kineticcannon2 = NumSubSystems(KINETICCANNON2)
			local kineticcannon3 = NumSubSystems(KINETICCANNON3)
			local kineticcannons = kineticcannon + kineticcannon1 + kineticcannon2 + kineticcannon3					
			local lasercannon = NumSubSystems(LASERCANNON)		
			local lasercannon1 = NumSubSystems(LASERCANNON1)
			local lasercannon2 = NumSubSystems(LASERCANNON2)
			local lasercannon3 = NumSubSystems(LASERCANNON3)
			local lasercannons = lasercannon + lasercannon1	+ lasercannon2 + lasercannon3				
			local doublekineticcannon = NumSubSystems(DOUBLEKINETICCANNON)
			local doublekineticcannon1 = NumSubSystems(DOUBLEKINETICCANNON1)
			local doublekineticcannon2 = NumSubSystems(DOUBLEKINETICCANNON2)
			local doublekineticcannons = doublekineticcannon + doublekineticcannon1	+ doublekineticcannon2			
		  if (kineticcannons > numBattleShip) and (lasercannons > numBattleShip) and (doublekineticcannons > numBattleShip) then		  
				ShipDemandAdd( VGR_ALKHALID, 0.6173)
			elseif numBattleShip == 0 then
			  ShipDemandAdd( VGR_ALKHALID, 0.6112)	
			else
			  ShipDemandAdd( VGR_ALKHALID, -15)									
			end	
---Dreadnaught      	  
      local numDreadnaught = NumSquadrons(VGR_DREADNAUGHT) + NumSquadronsQ(VGR_DREADNAUGHT) 	
			if (IsResearchDone( DREADNAUGHTTECH ) == 1) then
			  ShipDemandAdd( VGR_DREADNAUGHT, 0.812 + (rank/1.655) + (1000*log(GameTime+1)/10758) - (numDreadnaught/5))
			else
			  ShipDemandAdd( VGR_DREADNAUGHT, 0.318 + (rank/1.654) + (1000*log(GameTime+1)/10754) - (numDreadnaught/5))		  	
			end		
---Dreadnaught B     	  
      local numDreadnaught = NumSquadrons(VGR_DREADNAUGHTB) + NumSquadronsQ(VGR_DREADNAUGHTB) + NumSquadrons(VGR_DREADNAUGHT) + NumSquadronsQ(VGR_DREADNAUGHT) 	
			if (IsResearchDone( DREADNAUGHTTECH ) == 1) then
			  ShipDemandAdd( VGR_DREADNAUGHTB, 0.812 + (rank/1.658) + (1000*log(GameTime+1)/10753) - (numDreadnaught/5))		  	
			end
---ArtilleryBattlecruiser   	  
      local numArtilleryBattlecruiser = NumSquadrons(VGR_ARTILLERYBATTLECRUISER)
			if (IsResearchDone( SAJUUKTECH ) == 1) then
			  ShipDemandAdd( VGR_ARTILLERYBATTLECRUISER, 0.802 + (rank/1.658) + (1000*log(GameTime+1)/10728) - (numArtilleryBattlecruiser/1.5))
			else
			  ShipDemandAdd( VGR_ARTILLERYBATTLECRUISER, 0.307 + (rank/1.657) + (1000*log(GameTime+1)/10775) - (numArtilleryBattlecruiser/1.5))		  	
			end
--      local numArtilleryBattlecruiser = NumSquadrons(VGR_ARTILLERYBATTLECRUISER)
--			if (IsResearchDone( SAJUUKTECHAI ) == 1) then
--			  ShipDemandAdd( VGR_ARTILLERYBATTLECRUISER, 0.80 + (rank/1.65) + (1000*log(GameTime+1)/10750) - (numArtilleryBattlecruiser/1.5))
--			else
--			  ShipDemandAdd( VGR_ARTILLERYBATTLECRUISER, 0.30 + (rank/1.65) + (1000*log(GameTime+1)/10750) - (numArtilleryBattlecruiser/1.5))		  	
--			end
---Carrier			
			if NumSubSystems(HYPERSPACE) == 0 then
				ShipDemandAdd( kCarrier, 1 )					
				ShipDemandAdd( VGR_BATTLECARRIER, 0.7529 )				
			end  
		elseif (s_race == 3) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
			
---Needleship      
      local numNeedle = NumSquadrons( KAD_NEEDLESHIP ) + NumSquadronsQ( KAD_NEEDLESHIP )   						
			if (IsResearchDone( SUPCAPTECH ) == 1 and numRUs > 3000) then				
				ShipDemandAdd( KAD_NEEDLESHIP, 0.812 + (rank/1.228) + (1000*log(GameTime+1)/9286) - (numNeedle/3))
			else
			  ShipDemandAdd( KAD_NEEDLESHIP, 0.317 + (rank/1.276) + (1000*log(GameTime+1)/9757) - (numNeedle/3))		  	
			end
---Avatar      
      local numAvatar = NumSquadrons( KAD_DESTROYER ) + NumSquadronsQ( KAD_DESTROYER )   						
			if (IsResearchDone( SUPCAPTECH ) == 1 and IsResearchDone( SAJUUK1 ) == 1 and numRUs > 4000) then				
				ShipDemandAdd( KAD_DESTROYER, 0.818 + (rank/1.587) + (1000*log(GameTime+1)/10583) - (numAvatar/6))
			else
			  ShipDemandAdd( KAD_DESTROYER, 0.318 + (rank/1.576) + (1000*log(GameTime+1)/10275) - (numAvatar/6))		  	
			end
---Templar
      local numdestroyer = NumSquadrons( KAD_DESTROYER_REAL ) + NumSquadronsQ( KAD_DESTROYER_REAL )   						
			if (IsResearchDone( HYPERSPACETECH ) == 1 and numRUs > 3000) then				
				ShipDemandAdd( KAD_DESTROYER_REAL, 0.812 + (rank/1.558) + (1000*log(GameTime+1)/7276) - (numdestroyer/9))
			else
			  ShipDemandAdd( KAD_DESTROYER_REAL, 0.317 + (rank/1.576) + (1000*log(GameTime+1)/7375) - (numdestroyer/9))		  	
			end
			local numPrimaryCapital = NumSquadrons( KAD_DESTROYER_REAL ) + NumSquadrons( KAD_DESTROYER )
---Custodian
      local numdestroyer = NumSquadrons( KAD_CUSTODIAN ) + NumSquadronsQ( KAD_CUSTODIAN )
      if IsResearchDone( GARDEN1 ) == 1 then
				if (IsResearchDone( HYPERSPACETECH ) == 1 and numRUs > 3000) then
	      	if numPrimaryCapital > 3 and numdestroyer < numPrimaryCapital/4 then
	      		ShipDemandAdd( KAD_CUSTODIAN, 0.812 + (rank/1.57) + (1000*log(GameTime+1)/7287) + numPrimaryCapital)
	      	else
						ShipDemandAdd( KAD_CUSTODIAN, 0.817 + (rank/1.55) + (1000*log(GameTime+1)/7376) - (numdestroyer/3))
					end
				else
				  ShipDemandAdd( KAD_CUSTODIAN, 0.321 + (rank/1.528) + (1000*log(GameTime+1)/7785) - (numdestroyer/3))
				end
			end
		elseif (s_race == 4) then
---Carrier      
      local numCarrier = NumSquadrons( RAD_SCAFFOLDA ) + NumSquadronsQ( RAD_SCAFFOLDA ) + NumSquadrons( RAD_CARRIER ) + NumSquadronsQ( RAD_CARRIER ) 			
			if (IsResearchDone( CAP_UNLOCK2 ) == 1 and numRUs > 3000) then				
				ShipDemandAdd( RAD_SCAFFOLDA, 0.815 + (rank/1.228) + (1000*log(GameTime+1)/9573) - (numCarrier/3))
			else
			  ShipDemandAdd( RAD_SCAFFOLDA, 0.317 + (rank/1.276) + (1000*log(GameTime+1)/9287) - (numCarrier/3))		  	
			end
---Big Daddy
      local numCarrierB = NumSquadrons( RAD_SCAFFOLDB ) + NumSquadronsQ( RAD_SCAFFOLDB ) + NumSquadrons( RAD_CARRIER_BLACK ) + NumSquadronsQ( RAD_CARRIER_BLACK ) 			
			if (IsResearchDone( GHOSTTECH ) == 1 and numRUs > 4000) then				
				ShipDemandAdd( RAD_SCAFFOLDB, 0.812 + (rank/1.276) + (1000*log(GameTime+1)/9737) - (numCarrierB/3))
			else
			  ShipDemandAdd( RAD_SCAFFOLDB, 0.317 + (rank/1.225) + (1000*log(GameTime+1)/9576) - (numCarrierB/3))		  	
			end
---Destroyer
      local numCarrier = NumSquadrons( RAD_DESTROYERSCAFFOLDA ) + NumSquadronsQ( RAD_DESTROYERSCAFFOLDA ) + NumSquadrons( RAD_DESTROYER ) + NumSquadronsQ( RAD_DESTROYER ) 			
			if (IsResearchDone( CAP_UNLOCK2 ) == 1 and numRUs > 3000) then				
				ShipDemandAdd( RAD_DESTROYERSCAFFOLDA, 0.815 + (rank/1.258) + (1000*log(GameTime+1)/9287) - (numCarrier/9))
			else
			  ShipDemandAdd( RAD_DESTROYERSCAFFOLDA, 0.317 + (rank/1.273) + (1000*log(GameTime+1)/9277) - (numCarrier/9))		  	
			end
---Enforcer
      local numCarrier = NumSquadrons( RAD_CRUISERSCAFFOLDA ) + NumSquadronsQ( RAD_CRUISERSCAFFOLDA ) + NumSquadrons( RAD_CRUISER ) + NumSquadronsQ( RAD_CRUISER ) 			
			if (IsResearchDone( CAP_UNLOCK3 ) == 1 and numRUs > 4000) then				
				ShipDemandAdd( RAD_CRUISERSCAFFOLDA, 0.812 + (rank/1.276) + (1000*log(GameTime+1)/9288) - (numCarrier/9))
			else
			  ShipDemandAdd( RAD_CRUISERSCAFFOLDA, 0.313 + (rank/1.237) + (1000*log(GameTime+1)/9276) - (numCarrier/9))		  	
			end
---Queen
      local numCarrier = NumSquadrons( RAD_CRUISER_QUEENSCAFFOLDA ) + NumSquadronsQ( RAD_CRUISER_QUEENSCAFFOLDA ) + NumSquadrons( RAD_CRUISER_QUEEN ) + NumSquadronsQ( RAD_CRUISER_QUEEN ) 			
			if (IsResearchDone( GHOSTTECH ) == 1 and numRUs > 4000) then				
				ShipDemandAdd( RAD_CRUISER_QUEENSCAFFOLDA, 0.817 + (rank/1.207) + (1000*log(GameTime+1)/9385) - (numCarrier/9))
			else
			  ShipDemandAdd( RAD_CRUISER_QUEENSCAFFOLDA, 0.312 + (rank/1.208) + (1000*log(GameTime+1)/9761) - (numCarrier/9))		  	
			end
---Queen
      local numCarrier = NumSquadrons( RAD_SCUDSCAFFOLDA ) + NumSquadronsQ( RAD_SCUDSCAFFOLDA ) + NumSquadrons( RAD_SCUD ) + NumSquadronsQ( RAD_SCUD ) 			
			if (IsResearchDone( ISCOMMODORE ) == 1 and numRUs > 4000) then				
				ShipDemandAdd( RAD_SCUDSCAFFOLDA, 0.817 + (rank/1.214) + (1000*log(GameTime+1)/9137) - (numCarrier/9))
			else
			  ShipDemandAdd( RAD_SCUDSCAFFOLDA, 0.318 + (rank/1.225) + (1000*log(GameTime+1)/9214) - (numCarrier/9))		  	
			end
---Mercenary Cruiser
      local numCarrier = NumSquadrons( RAD_MERC_CRUISER ) + NumSquadronsQ( RAD_MERC_CRUISER ) 
			if IsResearchDone( ISCAPTAIN ) == 1 then
				if (numRUs > 5000) then				
					ShipDemandAdd( RAD_MERC_CRUISER, 0.818 + (rank/1.527) + (1000*log(GameTime+1)/11254) - (numCarrier/9))
				else
				  ShipDemandAdd( RAD_MERC_CRUISER, 0.317 + (rank/1.545) + (1000*log(GameTime+1)/11234) - (numCarrier/9))
				end
			end
---Mercenary Battlecruiser
      local numCarrier = NumSquadrons( RAD_MERC_BATTLECRUISER ) + NumSquadronsQ( RAD_MERC_BATTLECRUISER ) 
			if IsResearchDone( ISCOMMODORE ) == 1 then
				if (numRUs > 8000) then				
					ShipDemandAdd( RAD_MERC_BATTLECRUISER, 0.812 + (rank/1.587) + (1000*log(GameTime+1)/11251) - (numCarrier/9))
				else
				  ShipDemandAdd( RAD_MERC_BATTLECRUISER, 0.314 + (rank/1.515) + (1000*log(GameTime+1)/11124) - (numCarrier/9))
				end
			end
---Black Market
      local numCarrier = NumSquadrons( RAD_BLACKMARKET ) + NumSquadronsQ( RAD_BLACKMARKET ) 
      if IsResearchDone( GHOSTTECH ) == 1 then
				if (numRUs > 10000) then				
					ShipDemandAdd( RAD_BLACKMARKET, 10.812 + (rank/1.576) + (1000*log(GameTime+1)/11257) - (numCarrier*2))
				else
				  ShipDemandAdd( RAD_BLACKMARKET, 5.312 + (rank/1.527) + (1000*log(GameTime+1)/11254) - (numCarrier*2))
				end
			end
---Refurbished Destroyer
      local numCarrier = NumSquadrons( RAD_REFURBISHEDDESTROYER ) + NumSquadronsQ( RAD_REFURBISHEDDESTROYER ) 
      if IsResearchDone( ISCAPTAIN ) == 1 and NumSquadrons( RAD_BLACKMARKET ) > 0 then
				if (numRUs > 5000) then				
					ShipDemandAdd( RAD_REFURBISHEDDESTROYER, 0.812 + (rank/1.575) + (1000*log(GameTime+1)/11751) - (numCarrier/9))
				else
				  ShipDemandAdd( RAD_REFURBISHEDDESTROYER, 0.311 + (rank/1.528) + (1000*log(GameTime+1)/11251) - (numCarrier/9))
				end
			end
---Troll Destroyer
      local numCarrier = NumSquadrons( RAD_HELIOS ) + NumSquadronsQ( RAD_HELIOS ) 
      if IsResearchDone( ISCOMMODORE ) == 1 and NumSquadrons( RAD_BLACKMARKET ) > 0 then
				if (numRUs > 10000) then				
					ShipDemandAdd( RAD_HELIOS, 0.814 + (rank/1.575) + (1000*log(GameTime+1)/11454) - (numCarrier/9))
				else
				  ShipDemandAdd( RAD_HELIOS, 0.318 + (rank/1.508) + (1000*log(GameTime+1)/11209) - (numCarrier/9))
				end
			end
---Arms Dealer
      local numCarrier = NumSquadrons( RAD_ARMSDEALER ) + NumSquadronsQ( RAD_ARMSDEALER ) 
      if IsResearchDone( ISADMIRAL ) == 1 and NumSquadrons( RAD_BLACKMARKET ) > 0 then
				if (numRUs > 10000) then
					ShipDemandAdd( RAD_ARMSDEALER, 1.811 + (rank/1.557) + (1000*log(GameTime+1)/11751) - (numCarrier/3))
				else
				  ShipDemandAdd( RAD_ARMSDEALER, 1.318 + (rank/1.575) + (1000*log(GameTime+1)/11256) - (numCarrier/3))
				end
			end
---Cockhead
      local numCarrier = NumSquadrons( RAD_QWAARJETII ) + NumSquadronsQ( RAD_QWAARJETII ) 
      if IsResearchDone( ISADMIRAL ) == 1 and NumSquadrons( RAD_BLACKMARKET ) > 0 then
				if (numRUs > 12000) then
					ShipDemandAdd( RAD_QWAARJETII, 2.615 + (rank/1.558) + (1000*log(GameTime+1)/11128) - (numCarrier/16))
				else
				  ShipDemandAdd( RAD_QWAARJETII, 2.214 + (rank/1.576) + (1000*log(GameTime+1)/11348) - (numCarrier/16))
				end
			end
---Ass Buster
      local numCarrier = NumSquadrons( RAD_VANAARJET ) + NumSquadronsQ( RAD_VANAARJET ) 
      if IsResearchDone( ASSBUSTERTECH ) == 1 and NumSquadrons( RAD_BLACKMARKET ) > 0 then
				if (numRUs > 14000) then
					ShipDemandAdd( RAD_VANAARJET, 2.617 + (rank/1.553) + (1000*log(GameTime+1)/11731) - (numCarrier/16))
				else
				  ShipDemandAdd( RAD_VANAARJET, 2.218 + (rank/1.534) + (1000*log(GameTime+1)/11828) - (numCarrier/16))
				end
			end
---Pirate Ship
			if IsResearchDone( ISFLEETADMIRAL ) == 1 and NumSquadrons( RAD_MOTHERSHIP ) < 1 and numRUs > 10000 then
				ShipDemandAdd( RAD_MOTHERSHIP, 1.611 + (rank/1.524) + (1000*log(GameTime+1)/11281))
			end
		elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
---Hive Carrier
      local numShip = NumSquadrons( KPR_HIVE ) + NumSquadronsQ( KPR_HIVE )
      if (rank >= 1 and numRUs > 1350) then
     	  if IsResearchDone( HIVECLOAK ) == 1 then
     	    ShipDemandAdd( KPR_HIVE, 0.832 + (rank/2.247) + (1000*log(GameTime+1)/13585) - (numShip/7))
     	  else
     	    ShipDemandAdd( KPR_HIVE, 0.634 + (rank/2.547) + (1000*log(GameTime+1)/13515) - (numShip/7))
     	  end
     	else
     	  ShipDemandAdd( KPR_HIVE, 0.437 + (rank/2.527) + (1000*log(GameTime+1)/13538) - (numShip/7))
			end
---Keeper
      local numShip = NumSquadrons( KPR_DESTROYER ) + NumSquadronsQ( KPR_DESTROYER )
      if (rank >= 2 and numRUs > 2350) then
     	  if IsResearchDone( KEEPERPOSESSION ) == 1 or IsResearchDone( KEEPERSACRIFICE ) == 1 then
     	    ShipDemandAdd( KPR_DESTROYER, 0.817 + (rank/2.544) + (1000*log(GameTime+1)/13238) - (numShip/11))
     	  else
     	    ShipDemandAdd( KPR_DESTROYER, 0.618 + (rank/2.873) + (1000*log(GameTime+1)/13282) - (numShip/11))
     	  end
     	else
     	  ShipDemandAdd( KPR_DESTROYER, 0.417 + (rank/2.541) + (1000*log(GameTime+1)/13235) - (numShip/11))
			end
---Sleeper
      local numShip = NumSquadrons( KPR_CARRIER ) + NumSquadronsQ( KPR_CARRIER )
      if (rank >= 3 and numRUs > 3350) then
     	  if IsResearchDone( SLEEPERSLEEPFIELD ) == 1 or IsResearchDone( SLEEPERLOCKDOWNABILITY ) == 1 then
     	    ShipDemandAdd( KPR_CARRIER, 0.857 + (rank/2.128) + (1000*log(GameTime+1)/14528) - (numShip/3))
     	  else
     	    ShipDemandAdd( KPR_CARRIER, 0.628 + (rank/2.145) + (1000*log(GameTime+1)/14514) - (numShip/3))
     	  end
     	else
     	  ShipDemandAdd( KPR_CARRIER, 0.407 + (rank/2.181) + (1000*log(GameTime+1)/14533) - (numShip/3))
			end
---Reaver
      local numShip = NumSquadrons( KPR_REAVER ) + NumSquadronsQ( KPR_REAVER )
      if (rank >= 4 and numRUs > 4350) then
     	  if IsResearchDone( REAVERDEFENSEFIELD ) == 1 then
     	    ShipDemandAdd( KPR_REAVER, 0.825 + (rank/2.873) + (1000*log(GameTime+1)/13281)- (numShip/8))
     	  else
     	    ShipDemandAdd( KPR_REAVER, 0.621 + (rank/2.871) + (1000*log(GameTime+1)/13081) - (numShip/8))
     	  end
     	else
     	  ShipDemandAdd( KPR_REAVER, 0.428 + (rank/2.581) + (1000*log(GameTime+1)/13675) - (numShip/8))
			end
---Harbinger
      local numShip = NumSquadrons( KPR_DREADNAUGHT ) + NumSquadronsQ( KPR_DREADNAUGHT )
      if (rank >= 5 and numRUs > 5350) then
     	  if IsResearchDone( HARBINGERCRITICALMASS ) == 1 then
     	    ShipDemandAdd( KPR_DREADNAUGHT, 0.981 + (rank/1.637) + (1000*log(GameTime+1)/11279) - (numShip/9))
     	  else
     	    ShipDemandAdd( KPR_DREADNAUGHT, 0.748 + (rank/1.673) + (1000*log(GameTime+1)/11346) - (numShip/9))
     	  end
     	else
     	  ShipDemandAdd( KPR_DREADNAUGHT, 0.537 + (rank/1.618) + (1000*log(GameTime+1)/11349) - (numShip/9))
			end
---Sajuuk
      local numShip = NumSquadrons( KPR_SAJUUK ) + NumSquadronsQ( KPR_SAJUUK )
      if (rank >= 6 and numRUs > 63500) then
     	  if IsResearchDone( SAJUUKPHASESHIELDS ) == 1 then
     	    ShipDemandAdd( KPR_SAJUUK, 0.718 + (rank/1.471) + (1000*log(GameTime+1)/12137) - (numShip/6))
     	  else
     	    ShipDemandAdd( KPR_SAJUUK, 0.511 + (rank/1.487) + (1000*log(GameTime+1)/12876) - (numShip/6))
     	  end
     	else
     	  ShipDemandAdd( KPR_SAJUUK, 0.397 + (rank/1.476) + (1000*log(GameTime+1)/12716) - (numShip/6))
			end
			
			
		end
	end	

----LIVELLO ECONOMICO 2---------------------------------	 
	
	if (((GetNumCollecting() > 11 or numRUs > 1900) and s_militaryPop > 10 and UnderAttackThreat() < -80)) or numRUs > 5500 then
	  aitrace("LIVELLO ECONOMICO 2", 2)
	  if (s_race == Race_Hiigaran) then
---Destroyers/Battlecruiser
      ShipDemandAdd(HGN_DESTROYER, 0.26927)	
      ShipDemandAdd(HGN_SWEEPERDESTROYER, 0.16976)
      ShipDemandAdd(HGN_MISSILEDESTROYER, 0.36172)	
      ShipDemandAdd(HGN_IONDESTROYER, 0.37128)	
      ShipDemandAdd(HGN_ADVDESTROYER, 0.39178)		
      ShipDemandAdd(HGN_ARTILLERYDESTROYER, 0.38281)	
      ShipDemandAdd(HGN_CRUISERA, 0.39125)
      ShipDemandAdd(HGN_CRUISERB, 0.39765)		  
	    ShipDemandAdd(HGN_BATTLECRUISER, 0.44742)
	    ShipDemandAdd(HGN_BATTLECRUISERNUKE, 0.44217)
	    ShipDemandAdd(HGN_VORTEX, 0.43832)		    
	    ShipDemandAdd(HGN_BATTLESHIP, 0.42787) 
	    ShipDemandAdd(HGN_MINIVORTEX, 0.23762)
---Juggernaught		
      local numJuggernaught = NumSquadrons( HGN_JUGGERNAUGHT ) + NumSquadronsQ( HGN_JUGGERNAUGHT ) 	    
	    if (IsResearchDone( JUGGERNAUGHTTECH ) == 1 and numRUs >= 2000) then     	
     	  ShipDemandAdd( HGN_JUGGERNAUGHT, 0.758 + (rank/2.217) + (1000*log(GameTime+1)/9528) - (numJuggernaught/4))	
     	else
     	  ShipDemandAdd( HGN_JUGGERNAUGHT, 0.331 + (rank/2.579) + (1000*log(GameTime+1)/9575) - (numJuggernaught/4))	    	 	
			end					
---Chimera, solo a questo livello
      if NumSquadrons( kCarrier ) > 0 or NumSquadrons( kShipYard ) > 0 or NumSquadrons( HGN_BATTLECARRIER ) > 0 then
		    ShipDemandAdd(HGN_HYPERSPACESTATION, 0.3594)		
		    local numHyperspaceStation = NumSquadrons( HGN_HYPERSPACESTATION ) + NumSquadronsQ( HGN_HYPERSPACESTATION )
				ShipDemandAdd(HGN_HYPERSPACESTATION, -numHyperspaceStation)
			end	
---Carrier	  
			if NumSubSystems(HYPERSPACE) == 0 then
				ShipDemandAdd( kCarrier, 2 )
				ShipDemandAdd( HGN_BATTLECARRIER, 2.2536 )				
			end  						
	  elseif (s_race == Race_Vaygr) then
---AM
      local numAM = NumSquadrons( VGR_AM ) + NumSquadronsQ( VGR_AM )  
     	if (IsResearchDone( AMGUNS ) == 1 and numRUs > 1900) then     	
     	  if IsResearchDone( FASTTRACKING ) == 1 then
     	    ShipDemandAdd( VGR_AM, 0.876 + (rank/1.878) + (1000*log(GameTime+1)/12351) - (numAM/8))	
     	  else
     	    ShipDemandAdd( VGR_AM, 0.6373 )	
     	  end
     	else
     	  ShipDemandAdd( VGR_AM, 0.428 + (rank/1.876) + (1000*log(GameTime+1)/12351) - (numAM/8))  			
			end
---Sinner			
      local numSinner = NumSquadrons( VGR_SINNER ) + NumSquadronsQ( VGR_SINNER )  
     	if (IsResearchDone( SINNERTECH ) == 1 and numRUs > 4000) then
     		if IsResearchDone( IMPROVEDSINNERARMOUR1 ) == 1 then
     			ShipDemandAdd( VGR_SINNER, 1.983 + (rank/1.938) + (1000*log(GameTime+1)/11194) - (numSinner/3))
     		else
     	  	ShipDemandAdd( VGR_SINNER, 1.737 + (rank/1.971) + (1000*log(GameTime+1)/11371) - (numSinner/3))
     	  end
     	else
     	  ShipDemandAdd( VGR_SINNER, 0.482 + (rank/1.957) + (1000*log(GameTime+1)/3388) - (numSinner/3))
			end
	    --ShipDemandAdd(VGR_DESTROYER, 0.3)	
			ShipDemandAdd(VGR_PULSEDESTROYER, 0.3558)
	    ShipDemandAdd(VGR_CRUISER, 0.4571)
			ShipDemandAdd(VGR_LIGHTCRUISER, 0.4258)
			ShipDemandAdd(VGR_LIGHTCRUISER_GUN, 0.4245)
			ShipDemandAdd(VGR_ARTILLERYSHIP, 0.4383)
      ShipDemandAdd(VGR_ALKHALID, 0.4762)	
      ShipDemandAdd(VGR_DREADNAUGHT, 0.4586)			  
      ShipDemandAdd(VGR_DREADNAUGHTB, 0.4266)
	    ShipDemandAdd(VGR_BATTLECRUISER, 0.4367)
	    ShipDemandAdd(VGR_BATTLECRUISER_HERO, 0.4302)
	    ShipDemandAdd(VGR_MISSILEBATTLECRUISER, 0.4583)
	    ShipDemandAdd(VGR_HEAVYCRUISER, 0.4665)
	    ShipDemandAdd(VGR_SINNER, 0.4735)
---Carrier	  
			if NumSubSystems(HYPERSPACE) == 0 then
				ShipDemandAdd( kCarrier, 2 )
--				ShipDemandAdd( VGR_BATTLECARRIER, 2.25 )				
			end  				
		elseif (s_race == 3) then
		  ShipDemandAdd( KAD_NEEDLESHIP, 0.4128)		  	
		  ShipDemandAdd( KAD_DESTROYER, 0.4276)		  	
		  ShipDemandAdd( KAD_DESTROYER_REAL, 0.4373)
		  ShipDemandAdd( KAD_CUSTODIAN, 0.4328)
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
		elseif (s_race == 4) then
		  ShipDemandAdd( RAD_SCAFFOLDA, 0.4176)		  	
		  ShipDemandAdd( RAD_SCAFFOLDB, 0.4173)		  	
		  ShipDemandAdd( RAD_DESTROYERSCAFFOLDA, 0.4398)		  	
		  ShipDemandAdd( RAD_CRUISERSCAFFOLDA, 0.4271)		  	
		  ShipDemandAdd( RAD_CRUISER_QUEENSCAFFOLDA, 0.4105)		  	
		  ShipDemandAdd( RAD_SCUDSCAFFOLDA, 0.4126)
		  ShipDemandAdd( RAD_MERC_CRUISER, 0.4276)
		  ShipDemandAdd( RAD_MERC_BATTLECRUISER, 0.4208)
		  ShipDemandAdd( RAD_BLACKMARKET, 1.4462)
		  ShipDemandAdd( RAD_REFURBISHEDDESTROYER, 0.4143)
		  ShipDemandAdd( RAD_HELIOS, 0.4128)
		  ShipDemandAdd( RAD_ARMSDEALER, 0.4108)
		  ShipDemandAdd( RAD_VANAARJET, 0.4516)
		  ShipDemandAdd( RAD_QWAARJETII, 0.4519)
	  elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
		  ShipDemandAdd( KPR_CARRIER, 0.4172)
		  ShipDemandAdd( KPR_REAVER, 0.4023)
		  ShipDemandAdd( KPR_DREADNAUGHT, 0.4314)
		  ShipDemandAdd( KPR_DESTROYER, 0.4195)
		  ShipDemandAdd( KPR_HIVE, 0.4043)
		  ShipDemandAdd( KPR_SAJUUK, 0.4134)
	  end
---Shipyard			
	  ShipDemandAdd( kShipYard, 1.99 )
	end  	
	
----LIVELLO ECONOMICO 3---------------------------------	 	
		
---Command Fortress	  
	if (((GetNumCollecting() > 13 or numRUs > 4000) and s_militaryPop > 14 and UnderAttackThreat() < -85)) or numRUs > 8000 then
    aitrace("LIVELLO ECONOMICO 3", 2)
    if (s_race == Race_Hiigaran) then
      ShipDemandAdd(HGN_MISSILEDESTROYER, 0.2821)
      ShipDemandAdd(HGN_IONDESTROYER, 0.3828)		
      ShipDemandAdd(HGN_ADVDESTROYER, 0.4867)	
      ShipDemandAdd(HGN_ARTILLERYDESTROYER, 0.4321)	
      ShipDemandAdd(HGN_CRUISERA, 0.5216)
      ShipDemandAdd(HGN_CRUISERB, 0.5221)	
      ShipDemandAdd(HGN_BATTLECRUISER, 0.5526)
      ShipDemandAdd(HGN_BATTLECRUISERNUKE, 0.5541)
      ShipDemandAdd(HGN_VORTEX, 0.5489)	
      ShipDemandAdd(HGN_BATTLESHIP, 0.5821)
      ShipDemandAdd(HGN_JUGGERNAUGHT, 0.3677)
      ShipDemandAdd(HGN_MINIVORTEX, 0.2284)
---CF      
      local numCommandFortress = NumSquadrons( HGN_COMMANDFORTRESS ) + NumSquadronsQ( HGN_COMMANDFORTRESS )
			ShipDemandAdd( HGN_COMMANDFORTRESS, 0.991 + (rank/1.489) + (1000*log(GameTime+1)/7537) - (numCommandFortress*2.85))					
			if numCommandFortress >= 2 then
				ShipDemandAdd( HGN_COMMANDFORTRESS, -15 )
			elseif numCommandFortress >= 1 then
				ShipDemandAdd( HGN_COMMANDFORTRESS, -7 )	
			end
---OS      
      if rank >= 5 then			
				local numOS = NumSquadrons( HGN_BATTLESTATION ) + NumSquadronsQ( HGN_BATTLESTATION )
				ShipDemandAdd( HGN_BATTLESTATION, 0.988 + (rank/1.476) + (1000*log(GameTime+1)/5268) - (numOS*1.75))					
				if numOS >= 3 then
					ShipDemandAdd( HGN_BATTLESTATION, -9 )
				elseif numOS >= 2 then
					ShipDemandAdd( HGN_BATTLESTATION, -6 )
				elseif numOS >= 1 then
					ShipDemandAdd( HGN_BATTLESTATION, -3 )	
				end			
			else
			  ShipDemandAdd( HGN_BATTLESTATION, -9 )
			end			
---Ark 
			local numArk = NumSquadrons( HGN_ARK ) + NumSquadronsQ( HGN_ARK )
			ShipDemandAdd( HGN_ARK, 0.984 + (rank/1.428) + (1000*log(GameTime+1)/7521) - (numArk*3.75))					
			if numArk >= 2 then
				ShipDemandAdd( HGN_ARK, -15 )
			elseif numArk >= 1 then
				ShipDemandAdd( HGN_ARK, -9 )	
				if numCommandFortress == 0 then
					ShipDemandAdd( HGN_ARK, -9 )
					ShipDemandAdd( HGN_COMMANDFORTRESS, 1.129 )
				end
			end
---Carriers	
			local numCarriers = NumSquadrons( kCarrier ) + NumSquadronsQ( kCarrier ) + NumSquadrons( HGN_BATTLECARRIER ) + NumSquadronsQ( HGN_BATTLECARRIER )
			if rank == 1 and numCarriers == 0 then
				ShipDemandSet( kCarrier, 3.958 + (1000*log(GameTime+1)/10375))
				ShipDemandSet( HGN_BATTLECARRIER, 3.456 + (1000*log(GameTime+1)/10286))			
			elseif rank > 1 and numCarriers == 0 then 
				ShipDemandSet( kCarrier, 3.45 + (1000*log(GameTime+1)/10000))
				ShipDemandSet( HGN_BATTLECARRIER, 3.954 + (1000*log(GameTime+1)/10284))			
			elseif rank > 1 then
				ShipDemandAdd( kCarrier, 1.0576 )	
				ShipDemandAdd( HGN_BATTLECARRIER, 1.5587 )				
			end	
			if numCarriers > 2 then
				ShipDemandAdd( kCarrier, -35 )
				ShipDemandAdd( HGN_BATTLECARRIER, -35 )			
			end
			if numCarriers > 3 then
				ShipDemandAdd( kCarrier, -60 )
				ShipDemandAdd( HGN_BATTLECARRIER, -60 )			
			end			
---bilancia unit?estreme, solo a questo livello
      ShipDemandAdd(HGN_BATTLECRUISER, (NumSquadrons( HGN_VORTEX )/2.571))
      ShipDemandAdd(HGN_BATTLECRUISERNUKE, (NumSquadrons( HGN_BATTLECRUISER )/2.597))
      ShipDemandAdd(HGN_VORTEX,        (NumSquadrons( HGN_BATTLECRUISER )/2.571))	
      ShipDemandAdd(HGN_BATTLESHIP, ((NumSquadrons( HGN_BATTLECRUISER ) + NumSquadrons( HGN_VORTEX ))/2.716))			
		elseif (s_race == Race_Vaygr) then			  
		  local numCommandFortress = NumSquadrons( VGR_COMMANDFORTRESS ) + NumSquadronsQ( VGR_COMMANDFORTRESS )
			ShipDemandAdd( VGR_COMMANDFORTRESS, 1.186 + (rank/1.354) + (1000*log(GameTime+1)/7273) - (numCommandFortress*2.5))			
			if numCommandFortress >= 2 then
				ShipDemandAdd( VGR_COMMANDFORTRESS, -11 )
			elseif numCommandFortress >= 1 then
				ShipDemandAdd( VGR_COMMANDFORTRESS, -6 )	
			end
			local numTitan = NumSquadrons( VGR_SUPERBATTLESHIP ) + NumSquadronsQ( VGR_SUPERBATTLESHIP )
			ShipDemandAdd( VGR_SUPERBATTLESHIP, 1.286 + (rank/1.364) + (1000*log(GameTime+1)/7271) - (numTitan*2.5))			
			if numTitan >= 2 then
				ShipDemandAdd( VGR_SUPERBATTLESHIP, -11 )
			elseif numTitan >= 1 then
				ShipDemandAdd( VGR_SUPERBATTLESHIP, -6 )	
			end
      ShipDemandAdd(VGR_ALKHALID, 0.5657)	
      ShipDemandAdd(VGR_SINNER, 0.5735)
      ShipDemandAdd(VGR_DREADNAUGHT, 0.5886)	
      ShipDemandAdd(VGR_DREADNAUGHTB, 0.5837)		  
	    ShipDemandAdd(VGR_BATTLECRUISER, 0.538)
	    ShipDemandAdd(VGR_BATTLECRUISER_HERO, 0.5087)
	    ShipDemandAdd(VGR_MISSILEBATTLECRUISER, 0.5476)	
	    ShipDemandAdd(VGR_HEAVYCRUISER, 0.5528)	
	    --ShipDemandAdd(VGR_DESTROYER, 0.24)	
			ShipDemandAdd(VGR_PULSEDESTROYER, 0.2827)	
	    ShipDemandAdd(VGR_CRUISER, 0.3324)
			ShipDemandAdd(VGR_LIGHTCRUISER, 0.3737)
			ShipDemandAdd(VGR_LIGHTCRUISER_GUN, 0.3728)
			ShipDemandAdd(VGR_ARTILLERYSHIP, 0.3669)
	    ShipDemandAdd(VGR_AM, 0.1972)
---bilancia unit?estreme, solo a questo livello
			ShipDemandAdd(VGR_MISSILEBATTLECRUISER, (NumSquadrons( VGR_BATTLECRUISER ) + NumSquadrons( VGR_ALKHALID ) + NumSquadrons( VGR_DREADNAUGHT ))/1.5)
      ShipDemandAdd(VGR_BATTLECRUISER, ((NumSquadrons( VGR_ALKHALID ) + NumSquadrons( VGR_DREADNAUGHT ))/2.587))			
      ShipDemandAdd(VGR_ALKHALID, ((NumSquadrons( VGR_BATTLECRUISER ) + NumSquadrons( VGR_DREADNAUGHT ))/2.271))	
      ShipDemandAdd(VGR_DREADNAUGHT, ((NumSquadrons( VGR_BATTLECRUISER ) + NumSquadrons( VGR_ALKHALID ))/2.588))			    	
      ShipDemandAdd(VGR_HEAVYCRUISER, (NumSquadrons( VGR_BATTLECRUISER ) + NumSquadrons( VGR_DESTROYER )))
      ShipDemandAdd(VGR_DREADNAUGHTB, ((NumSquadrons( VGR_BATTLECRUISER ) + NumSquadrons( VGR_ALKHALID ) - NumSquadrons( VGR_DREADNAUGHT ))/2.486))	
			
---Carriers	
			local numCarriers = NumSquadrons( kCarrier ) + NumSquadronsQ( kCarrier ) + NumSquadrons( VGR_BATTLECARRIER ) + NumSquadronsQ( VGR_BATTLECARRIER )
			if rank == 1 and numCarriers == 0 then
				ShipDemandSet( kCarrier, 3.985 + (1000*log(GameTime+1)/10273))			
				ShipDemandSet( VGR_BATTLECARRIER, 3.452 + (1000*log(GameTime+1)/10128))
			elseif rank > 1 and numCarriers == 0 then 
				ShipDemandSet( kCarrier, 3.457 + (1000*log(GameTime+1)/10379))			
				ShipDemandSet( VGR_BATTLECARRIER, 3.958 + (1000*log(GameTime+1)/10372))
			elseif rank > 1 then
				ShipDemandAdd( kCarrier, 1.0576 )				
				ShipDemandAdd( VGR_BATTLECARRIER, 1.5591 )	
			end	
			if numCarriers > 2 then
				ShipDemandAdd( kCarrier, -35 )			
				ShipDemandAdd( VGR_BATTLECARRIER, -35 )
			end
			if numCarriers > 3 then
				ShipDemandAdd( kCarrier, -60 )			
				ShipDemandAdd( VGR_BATTLECARRIER, -60 )
			end		
---Shipyard		
			ShipDemandAdd( kShipYard, 2.2 )
		
		elseif (s_race == 3) then
		  ShipDemandAdd( KAD_NEEDLESHIP, 0.5122)		  	
		  ShipDemandAdd( KAD_DESTROYER, 0.5276)		  	
		  --ShipDemandAdd( KAD_DESTROYER_REAL, 0.53)
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
		elseif (s_race == 4) then
		  ShipDemandAdd( RAD_SCAFFOLDA, 0.4172)		  	
		  ShipDemandAdd( RAD_SCAFFOLDB, 0.4128)		  	
		  --ShipDemandAdd( RAD_DESTROYERSCAFFOLDA, 0.43)		  	
		  ShipDemandAdd( RAD_CRUISERSCAFFOLDA, 0.4273)		  	
		  ShipDemandAdd( RAD_CRUISER_QUEENSCAFFOLDA, 0.5142)		  	
		  ShipDemandAdd( RAD_SCUDSCAFFOLDA, 0.4371)
		  ShipDemandAdd( RAD_MERC_CRUISER, 0.4242)
		  ShipDemandAdd( RAD_MERC_BATTLECRUISER, 0.4203)
		  ShipDemandAdd( RAD_BLACKMARKET, 1.4227)
		  ShipDemandAdd( RAD_REFURBISHEDDESTROYER, 0.4193)
		  ShipDemandAdd( RAD_HELIOS, 0.4144)
		  ShipDemandAdd( RAD_ARMSDEALER, 0.4192)
		  ShipDemandAdd( RAD_VANAARJET, 0.4566)
		  ShipDemandAdd( RAD_QWAARJETII, 0.4573)
---Black Market      
      local numBM = NumSquadrons( RAD_BLACKMARKET ) + NumSquadronsQ( RAD_BLACKMARKET )
			ShipDemandAdd( RAD_BLACKMARKET, 10.989 + (rank/1.472) + (1000*log(GameTime+1)/7532) - (numBM*2.85))					
			if numBM >= 2 then
				ShipDemandAdd( RAD_BLACKMARKET, -15 )
			elseif numBM >= 1 then
				ShipDemandAdd( RAD_BLACKMARKET, -7 )	
			end
		
		elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
		  ShipDemandAdd( KPR_CARRIER, 0.5128)
		  ShipDemandAdd( KPR_REAVER, 0.5076)
		  ShipDemandAdd( KPR_DREADNAUGHT, 0.5372)
		  ShipDemandAdd( KPR_DESTROYER, 0.5169)
		  ShipDemandAdd( KPR_HIVE, 0.5022)
		  ShipDemandAdd( KPR_SAJUUK, 0.5145)
		
		end	
	end	
	
	aitrace("Proceeding to other ship demands", 2)
	
---Subsystem Attackers	
	local numEnemyBattleCruisers = PlayersUnitTypeCount( player_enemy, player_total, eBattleCruiser )
	if (numEnemyBattleCruisers > 0) then		
		local ssKillaDemand = numEnemyBattleCruisers/2		
		if (s_enemyIndex ~= -1) then
			local targetEnemyCruisers = PlayersUnitTypeCount( s_enemyIndex, player_max, eBattleCruiser )
			if (targetEnemyCruisers > 0) then
				ssKillaDemand = ssKillaDemand + targetEnemyCruisers				
			end
		end		
		ShipDemandAddByClass( eSubSystemAttackers, ssKillaDemand )		
	end		
	
---Shipyards	
	local numShipyards = NumSquadrons( kShipYard ) + NumSquadronsQ( kShipYard )
	if (numShipyards == 0 and UnderAttackThreat() < -75) then
		local bcDemand = ShipDemandGet( kBattleCruiser )
		if (bcDemand >= 0.5) then
			ShipDemandAdd( kShipYard, bcDemand + 0.5 )
		end
	end		
	if rank >= 2 and numShipyards == 0 then
	  ShipDemandSet( kShipYard, 4.95 + (1000*log(GameTime+1)/9000))
	elseif rank >= 2 then 
	  ShipDemandAdd( kShipYard, 2.05 )
	end	
---se molte sy o grado aumenta domanda navi grosse e diminuisce domanda sy e navi piccole	
	if numShipyards > 3 then
		ShipDemandAdd( kShipYard, -100 )
	elseif numShipyards > 2 and rank >= 5 then
		ShipDemandAdd( kShipYard, -75 )
		ShipDemandAddByClass( eFighter, -0.65 )
		ShipDemandAddByClass( eCorvette, -0.5 )		
		if (s_race == Race_Hiigaran) then
		  ShipDemandAdd(HGN_MISSILEDESTROYER, 0.2828)	
		  ShipDemandAdd(HGN_IONDESTROYER, 0.3812)	
		  ShipDemandAdd(HGN_ADVDESTROYER, 0.4886)	
		  ShipDemandAdd(HGN_ARTILLERYDESTROYER, 0.4371)
		  ShipDemandAdd(HGN_CRUISERA, 0.5128)
      ShipDemandAdd(HGN_CRUISERB, 0.5163)	
      ShipDemandAdd(HGN_BATTLECRUISER, 0.5572)
      ShipDemandAdd(HGN_BATTLECRUISERNUKE, 0.5926)
      ShipDemandAdd(HGN_VORTEX, 0.5425)	
      ShipDemandAdd(HGN_BATTLESHIP, 0.5341)
      ShipDemandAdd(HGN_JUGGERNAUGHT, 0.3712)
		elseif (s_race == Race_Vaygr) then
		  ShipDemandAdd(VGR_ALKHALID, 0.5783)	
      ShipDemandAdd(VGR_DREADNAUGHT, 0.5839)
      ShipDemandAdd(VGR_DREADNAUGHTB, 0.5882)		  
	    ShipDemandAdd(VGR_BATTLECRUISER, 0.579)
	    ShipDemandAdd(VGR_BATTLECRUISER_HERO, 0.571)
	    ShipDemandAdd(VGR_MISSILEBATTLECRUISER, 0.5362)	
	    ShipDemandAdd(VGR_HEAVYCRUISER, 0.5529)	
	    --ShipDemandAdd(VGR_DESTROYER, 0.24)	
			ShipDemandAdd(VGR_PULSEDESTROYER, 0.2846)	
	    ShipDemandAdd(VGR_CRUISER, 0.3271)
			ShipDemandAdd(VGR_LIGHTCRUISER, 0.3873)
			ShipDemandAdd(VGR_LIGHTCRUISER_GUN, 0.3891)
			ShipDemandAdd(VGR_ARTILLERYSHIP, 0.3574)
	    ShipDemandAdd(VGR_AM, 0.1998)
		elseif (s_race == 3) then
		  ShipDemandAdd( KAD_PODSHIP, 0.4176)		  	
		  ShipDemandAdd( KAD_DESTROYER, 0.5241)		  	
		  ShipDemandAdd( KAD_DESTROYER_REAL, 0.3375)
		  ShipDemandAdd( KAD_CUSTODIAN, 0.3395)
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
		elseif (s_race == 4) then
		  --ShipDemandAdd( RAD_SCAFFOLDA, 0.41)		  	
		  --ShipDemandAdd( RAD_SCAFFOLDB, 0.41)		  	
		  ShipDemandAdd( RAD_DESTROYERSCAFFOLDA, 0.4376)		  	
		  ShipDemandAdd( RAD_CRUISERSCAFFOLDA, 0.4292)		  	
		  ShipDemandAdd( RAD_CRUISER_QUEENSCAFFOLDA, 0.4171)		  	
		  ShipDemandAdd( RAD_SCUDSCAFFOLDA, 0.4179)
		  --ShipDemandAdd( RAD_MERC_CRUISER, 0.42)
		  ShipDemandAdd( RAD_BLACKMARKET, 1.42)
		elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
		  ShipDemandAdd( KPR_CARRIER, 0.5171)
		  ShipDemandAdd( KPR_REAVER, 0.5073)
		  ShipDemandAdd( KPR_DREADNAUGHT, 0.5381)
		  ShipDemandAdd( KPR_DESTROYER, 0.5116)
		  ShipDemandAdd( KPR_HIVE, 0.5018)
		  ShipDemandAdd( KPR_SAJUUK, 0.5119)
		end
	elseif numShipyards > 1 and rank >= 4 then
	  ShipDemandAdd( kShipYard, -50 )
	  ShipDemandAddByClass( eFighter, -0.35 )
		ShipDemandAddByClass( eCorvette, -0.25 )		
		if (s_race == Race_Hiigaran) then
		  ShipDemandAdd(HGN_DESTROYER, 0.2692)	
		  ShipDemandAdd(HGN_SWEEPERDESTROYER, 0.1697)
		  ShipDemandAdd(HGN_MISSILEDESTROYER, 0.3707)
      ShipDemandAdd(HGN_IONDESTROYER, 0.3713)	
      ShipDemandAdd(HGN_ADVDESTROYER, 0.3917)	
      ShipDemandAdd(HGN_ARTILLERYDESTROYER, 0.3818)
      ShipDemandAdd(HGN_CRUISERA, 0.3968)
      ShipDemandAdd(HGN_CRUISERB, 0.3986)				  
	    ShipDemandAdd(HGN_BATTLECRUISER, 0.4412)
	    ShipDemandAdd(HGN_BATTLECRUISERNUKE, 0.4452)
	    ShipDemandAdd(HGN_VORTEX, 0.4372)	
	    ShipDemandAdd(HGN_BATTLESHIP, 0.4212)	  
		elseif (s_race == Race_Vaygr) then
		  --ShipDemandAdd(VGR_DESTROYER, 0.3)	
			ShipDemandAdd(VGR_PULSEDESTROYER, 0.3494)	
		  ShipDemandAdd(VGR_CRUISER, 0.4228)	
			ShipDemandAdd(VGR_LIGHTCRUISER, 0.4776)
			ShipDemandAdd(VGR_LIGHTCRUISER_GUN, 0.4781)
			ShipDemandAdd(VGR_ARTILLERYSHIP, 0.4576)	
		  ShipDemandAdd(VGR_AM, 0.3276)	
      ShipDemandAdd(VGR_ALKHALID, 0.4781)	
      ShipDemandAdd(VGR_DREADNAUGHT, 0.4671)
      ShipDemandAdd(VGR_DREADNAUGHTB, 0.4686)		  
	    ShipDemandAdd(VGR_BATTLECRUISER, 0.4291)
	    ShipDemandAdd(VGR_BATTLECRUISER_HERO, 0.4216)
	    ShipDemandAdd(VGR_MISSILEBATTLECRUISER, 0.4479)
	    ShipDemandAdd(VGR_HEAVYCRUISER, 0.5207)	
		elseif (s_race == 3) then
		  ShipDemandAdd( KAD_PODSHIP, 0.4128)		  	
		  ShipDemandAdd( KAD_DESTROYER, 0.4276)		  	
		  ShipDemandAdd( KAD_DESTROYER_REAL, 0.4319)
		  ShipDemandAdd( KAD_CUSTODIAN, 0.4375)
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
		elseif (s_race == 4) then
		  --ShipDemandAdd( RAD_SCAFFOLDA, 0.41)		  	
		  --ShipDemandAdd( RAD_SCAFFOLDB, 0.41)		  	
		  ShipDemandAdd( RAD_DESTROYERSCAFFOLDA, 0.3375)		  	
		  ShipDemandAdd( RAD_CRUISERSCAFFOLDA, 0.3208)		  	
		  ShipDemandAdd( RAD_CRUISER_QUEENSCAFFOLDA, 0.3113)		  	
		  ShipDemandAdd( RAD_SCUDSCAFFOLDA, 0.3127)
		  --ShipDemandAdd( RAD_MERC_CRUISER, 0.42)	 
		  ShipDemandAdd( RAD_BLACKMARKET, 1.4276)
		elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
		  ShipDemandAdd( KPR_CARRIER, 0.5128)
		  ShipDemandAdd( KPR_REAVER, 0.5016)
		  ShipDemandAdd( KPR_DREADNAUGHT, 0.5324)
		  ShipDemandAdd( KPR_DESTROYER, 0.5124)
		  ShipDemandAdd( KPR_HIVE, 0.5008)
		  ShipDemandAdd( KPR_SAJUUK, 0.5106)
		end
	elseif numShipyards > 0 and rank <= 4 then
		if (s_race == Race_Hiigaran) then
			if NumSquadrons( HGN_MOTHERSHIP ) > 0 then	
	  		ShipDemandAdd( kShipYard, -35 )	  
	  	else
	  		ShipDemandAdd( kShipYard, -5 )
	  	end
	  elseif (s_race == Race_Vaygr) then
			if NumSquadrons( VGR_MOTHERSHIP ) > 0 then	
	  		ShipDemandAdd( kShipYard, -35 )
	  	else
	  		ShipDemandAdd( kShipYard, -5 )
	  	end
	  elseif (s_race == 3) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
	  elseif (s_race == 4) then
	  elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
		  ShipDemandAdd( KPR_CARRIER, 0.4107)
		  ShipDemandAdd( KPR_REAVER, 0.4087)
		  ShipDemandAdd( KPR_DREADNAUGHT, 0.4364)
		  ShipDemandAdd( KPR_DESTROYER, 0.4131)
		  ShipDemandAdd( KPR_HIVE, 0.4097)
		  ShipDemandAdd( KPR_SAJUUK, 0.4166)
	  end
	end		

---aumenta diminuisce domanda navi in base al grado/unitcap
    --if rank >= 6 then
    --elseif rank >= 5 then	
	  --elseif rank >= 4 then	
    --elseif rank >= 3 then	
	  --elseif rank >= 2 then	
	  --elseif rank >= 1 then
	  --else
    --end
  local numCarriers = NumSquadrons( kCarrier ) + NumSquadronsQ( kCarrier ) 
	if unitcapmax >= 5 then
	elseif unitcapmax >= 4 then
		if numShipyards > 1 then
			ShipDemandAdd(kShipYard,-5)	
		end	
	elseif unitcapmax >= 3 then
		if numShipyards > 0 then
			ShipDemandAdd(kShipYard,-10)	
		end			
		if numCarriers > 0 then
			ShipDemandAdd(kCarrier,-5)	
		end						
	elseif unitcapmax >= 2 then	
		if numShipyards > 0 then
			ShipDemandAdd(kShipYard,-15)	
		end				
		if numCarriers > 0 then
			ShipDemandAdd(kCarrier,-10)	
		end			
	elseif unitcapmax >= 1 then	
		if numShipyards > 0 then
			ShipDemandAdd(kShipYard,-20)	
		end		
		if numCarriers > 0 then
			ShipDemandAdd(kCarrier,-15)	
		end						
	else
		if numShipyards > 0 then
			ShipDemandAdd(kShipYard,-15)	
		end				
		if numCarriers > 0 then
			ShipDemandAdd(kCarrier,-10)	
		end			
	end	 	 	
	
	if (s_race == Race_Hiigaran) then
	
---Torpedo Frigate	
	  local torpedoDemand = -0.5		
		if (IsResearchDone(IMPROVEDTORPEDO) == 1 or s_militaryStrength > 40 or GetRU() > 2500) then
			torpedoDemand = 0
		end
		ShipDemandAdd( HGN_TORPEDOFRIGATE, torpedoDemand )

---Light carrier		
		local numLightCarriers = NumSquadrons( kLightCarrier ) + NumSquadronsQ( kLightCarrier )
		if rank == 0 and numLightCarriers == 0 and numCarriers == 0 then
		  ShipDemandSet( kLightCarrier, 1.958 + (1000*log(GameTime+1)/10768))		
		end	
		if numLightCarriers > 0 then
			ShipDemandAdd( kLightCarrier, -100 )
		end
		
---Research Station		
		local numResearchStation = NumSquadrons( HGN_RESEARCHSTATION ) + NumSquadronsQ( HGN_RESEARCHSTATION )
		if rank >= 1 and numResearchStation == 0 then
		  ShipDemandSet( HGN_RESEARCHSTATION, 15.128 + (1000*log(GameTime+1)/10473))
		elseif numResearchStation == 0 then
			ShipDemandSet( HGN_RESEARCHSTATION, 5.179 + (1000*log(GameTime+1)/9348))
		else
		  ShipDemandSet( HGN_RESEARCHSTATION, -10 ) 	
		end	
		
---Power Station		
		local numPowerStation = NumSquadrons( HGN_POWER ) + NumSquadronsQ( HGN_POWER )
		if rank >= 1 and numPowerStation == 0 then
		  ShipDemandSet( HGN_POWER, 14.286 + (1000*log(GameTime+1)/10628))
		elseif numPowerStation == 0 then
			ShipDemandSet( HGN_POWER, 4.179 + (1000*log(GameTime+1)/9767))
		else
		  ShipDemandSet( HGN_POWER, -10 ) 	
		end			
		
---Weapon Station		
		local numWeaponStation = NumSquadrons( HGN_COMBATBASE ) + NumSquadronsQ( HGN_COMBATBASE )
		if numWeaponStation == 0 then
			ShipDemandSet( HGN_COMBATBASE, 4.579 + (1000*log(GameTime+1)/9287))
		else
		  ShipDemandSet( HGN_COMBATBASE, -10 ) 	
		end					
		
---Crew Station		
		local numCrewStation = NumSquadrons( HGN_CREWSTATION ) + NumSquadronsQ( HGN_CREWSTATION )
		if rank >= 1 and numCrewStation == 0 then
		  ShipDemandSet( HGN_CREWSTATION, 14.779 + (1000*log(GameTime+1)/10379))
		elseif numCrewStation == 0 then
			ShipDemandSet( HGN_CREWSTATION, 3.728 + (1000*log(GameTime+1)/10284))
		else
		  ShipDemandSet( HGN_CREWSTATION, -10 )	
		end	

---Scavenger
    local numScaver = NumSquadrons( HGN_SCAVER ) + NumSquadronsQ( HGN_SCAVER )
		if numScaver == 0 then
		  if numRUs > 3500 and rank >= 1 then
			  ShipDemandSet( HGN_SCAVER, 3.667 + (1000*log(GameTime+1)/10237))
			end  
		else
		  ShipDemandSet( HGN_SCAVER, -10 )	
		end	 		
				
---Juggernaught		    
		local numJuggernaught = NumSquadrons( HGN_JUGGERNAUGHT ) + NumSquadronsQ( HGN_JUGGERNAUGHT )
		if g_LOD == 0 then
			if numJuggernaught > (rank - 1) then
				ShipDemandAdd( HGN_JUGGERNAUGHT, -10 )
			end		
		elseif g_LOD == 1 then
			if numJuggernaught > (rank) then
				ShipDemandAdd( HGN_JUGGERNAUGHT, -10 )
			end		
		elseif g_LOD >= 1 then
		  if numJuggernaught == 0 then
		    ShipDemandAdd(HGN_JUGGERNAUGHT, 0.4525)
		  end  
			if numJuggernaught > (rank + 1) then
				ShipDemandAdd( HGN_JUGGERNAUGHT, -10 )
			end			
		end	
		
---Destroyer
   	local numDestroyer = NumSquadrons( HGN_DESTROYER ) + NumSquadronsQ( HGN_DESTROYER )	
   	if g_LOD >= 1 then
		  if numDestroyer == 0 and IsResearchDone(DESTROYERTECH) == 1 and numRUs > 1000 then
		    ShipDemandAdd(HGN_DESTROYER, 0.7758)
		  end  			
		end		

---Core
		local numCore = NumSquadrons( HGN_HSCORE ) + NumSquadronsQ( HGN_HSCORE )
		if rank >= 6 and numCore == 0 then
		  ShipDemandSet( HGN_HSCORE, 4.746 + (1000*log(GameTime+1)/10467))
		elseif numCore == 0 then
			ShipDemandSet( HGN_HSCORE, 3.776 + (1000*log(GameTime+1)/10288))
		else
		  ShipDemandSet( HGN_HSCORE, -10 )	
		end	

---Capturer
		local numCapturer = NumSquadrons( HGN_MARINEFRIGATE ) + NumSquadronsQ( HGN_MARINEFRIGATE )
		local limit = 2
		if g_LOD >= 1 then
			limit = 6
		elseif g_LOD == 1 then
			limit = 4
		end
		if numCapturer < limit then
		  ShipDemandSet( HGN_MARINEFRIGATE, 4.789 + (1000*log(GameTime+1)/10157))
		else
		  ShipDemandSet( HGN_MARINEFRIGATE, -10 )	
		end

---Platforms	
    if NumSquadrons( HGN_MOTHERSHIP ) > 0 then	
			if g_LOD == 0 then
--				ShipDemandAdd( HGN_HSCORE, 1.4 )
				ShipDemandAdd( HGN_GUNTURRET, 0 )
				ShipDemandAdd( HGN_PULSARTURRET, 0 )
				ShipDemandAdd( HGN_IONTURRET, 0 )
				ShipDemandAdd( HGN_MISSILETURRET, 0 )
				ShipDemandAdd( HGN_RTS, 0 )	
				ShipDemandAdd( HGN_SENTINEL, 0 )	
				ShipDemandAdd( HGN_IONSENTINEL, 0 )		
				ShipDemandAdd( HGN_ARTILLERYSENTINEL, 0 )	
				ShipDemandAdd( HGN_ATTACKBOMBER, 0.3738 )
				ShipDemandAdd( HGN_ASSAULTFRIGATE, 0.2279 )
				ShipDemandAdd( HGN_IONCANNONFRIGATE, 0.2124 )
				ShipDemandAdd( HGN_TORPEDOFRIGATE, 0.1976 )
				ShipDemandAdd( HGN_MARINEFRIGATE, 0.1778 )
				ShipDemandAdd( HGN_DEFENSEFIELDFRIGATE, 0.0928 )
				ShipDemandAdd( HGN_LRMS, 0.1515 )
				ShipDemandAdd( HGN_TULWAR, 0.1246 )
			elseif g_LOD == 1 then
--			  ShipDemandAdd( HGN_HSCORE, 1.6 )
				ShipDemandAdd( HGN_GUNTURRET, 0.2428 )
				ShipDemandAdd( HGN_PULSARTURRET, 0.2258 )
				ShipDemandAdd( HGN_IONTURRET, 0.3767 )
				ShipDemandAdd( HGN_MISSILETURRET, 0.3371 )
				ShipDemandAdd( HGN_RTS, 0.3287 )			
				ShipDemandAdd( HGN_SENTINEL, 0.3379 )
				ShipDemandAdd( HGN_IONSENTINEL, 0.3075 )		
				ShipDemandAdd( HGN_ARTILLERYSENTINEL, 0.3271 )	
				ShipDemandAdd( HGN_ATTACKBOMBER, 0.3297 )				
				ShipDemandAdd( HGN_ASSAULTFRIGATE, 0.3289 )
				ShipDemandAdd( HGN_IONCANNONFRIGATE, 0.3127 )
				ShipDemandAdd( HGN_TORPEDOFRIGATE, 0.2914 )
				ShipDemandAdd( HGN_MARINEFRIGATE, 0.2727 )
				ShipDemandAdd( HGN_DEFENSEFIELDFRIGATE, 0.1978 )
				ShipDemandAdd( HGN_LRMS, 0.2582 )
				ShipDemandAdd( HGN_TULWAR, 0.2214 )
			elseif g_LOD > 1  then
--			  ShipDemandAdd( HGN_HSCORE, 1.8 )
				ShipDemandAdd( HGN_GUNTURRET, 0.428 )
				ShipDemandAdd( HGN_PULSARTURRET, 0.579 )
				ShipDemandAdd( HGN_IONTURRET, 0.672 )
				ShipDemandAdd( HGN_MISSILETURRET, 0.628 )
				ShipDemandAdd( HGN_RTS, 0.615 )
				ShipDemandAdd( HGN_SENTINEL, 0.636 )		
				ShipDemandAdd( HGN_IONSENTINEL, 0.642 )	
				ShipDemandAdd( HGN_ARTILLERYSENTINEL, 0.608 )	
				ShipDemandAdd( HGN_ATTACKBOMBER, 0.575 )					
				ShipDemandAdd( HGN_ASSAULTFRIGATE, 0.591 )
				ShipDemandAdd( HGN_IONCANNONFRIGATE, 0.6227 )
				ShipDemandAdd( HGN_TORPEDOFRIGATE, 0.6191 )
				ShipDemandAdd( HGN_MARINEFRIGATE, 0.2726 )
				ShipDemandAdd( HGN_DEFENSEFIELDFRIGATE, 0.2927 )
				ShipDemandAdd( HGN_LRMS, 0.3577 )
				ShipDemandAdd( HGN_TULWAR, 0.4231 )
			end			
					
			local numDefenderDrone = NumSquadrons( HGN_DEFENDERDRONE ) + NumSquadronsQ( HGN_DEFENDERDRONE )
			ShipDemandAdd(HGN_DEFENDERDRONE, min(10, numRUs/1437 -(numDefenderDrone*0.757)))		
			if numDefenderDrone >= 50 then
				ShipDemandAdd( HGN_DEFENDERDRONE, -(numDefenderDrone*10) )
			end
					
			local numGunTurret = NumSquadrons( HGN_GUNTURRET ) + NumSquadronsQ( HGN_GUNTURRET )
			ShipDemandAdd(HGN_GUNTURRET, -(numGunTurret*1.582) + (1000*log(GameTime+1)/11541))		
			
			local numPulsarTurret = NumSquadrons( HGN_PULSARTURRET ) + NumSquadronsQ( HGN_PULSARTURRET )
			ShipDemandAdd(HGN_PULSARTURRET, -(numPulsarTurret*1.528) + (1000*log(GameTime+1)/10514))		
			
			local numIonTurret = NumSquadrons( HGN_IONTURRET ) + NumSquadronsQ( HGN_IONTURRET )
			ShipDemandAdd(HGN_IONTURRET, -(numIonTurret*1.571) + (1000*log(GameTime+1)/9284))	
			
			local numMissileTurret = NumSquadrons( HGN_MISSILETURRET ) + NumSquadronsQ( HGN_MISSILETURRET )
			ShipDemandAdd(HGN_MISSILETURRET, -(numMissileTurret*1.577) + (1000*log(GameTime+1)/8648))	
			
			local numrts = NumSquadrons( HGN_RTS ) + NumSquadronsQ( HGN_RTS )
			ShipDemandAdd(HGN_RTS, -(numrts*6.241) + (1000*log(GameTime+1)/7514))			
			if numrts >= 5 then
				ShipDemandAdd( HGN_RTS, -10 )
			end
			
			local numsentinel = NumSquadrons( HGN_SENTINEL ) + NumSquadronsQ( HGN_SENTINEL )
			ShipDemandAdd(HGN_SENTINEL, -(numsentinel*6.271) + (1000*log(GameTime+1)/5544))		
      if numsentinel >= 5 then
				ShipDemandAdd( HGN_SENTINEL, -10 )
			end			
			
			local numionsentinel = NumSquadrons( HGN_IONSENTINEL ) + NumSquadronsQ( HGN_IONSENTINEL )
			ShipDemandAdd(HGN_IONSENTINEL, -(numionsentinel*6.241) + (1000*log(GameTime+1)/5246))			
			if numionsentinel >= 5 then
				ShipDemandAdd( HGN_IONSENTINEL, -10 )
			end			
			
			local numResearchStation = NumSquadrons( HGN_RESEARCHSTATION ) + NumSquadronsQ( HGN_RESEARCHSTATION )
			local numartillerysentinel = NumSquadrons( HGN_ARTILLERYSENTINEL ) + NumSquadronsQ( HGN_ARTILLERYSENTINEL )
			ShipDemandAdd(HGN_ARTILLERYSENTINEL, -(numartillerysentinel*6.471) + (1000*log(GameTime+1)/6476))			
			if numartillerysentinel >= 5 or numResearchStation < 1 then
				ShipDemandAdd( HGN_ARTILLERYSENTINEL, -10 )
			end		

			local numdft = NumSquadrons( HGN_DEFENSEFIELDTURRET ) + NumSquadronsQ( HGN_DEFENSEFIELDTURRET )
			ShipDemandAdd(HGN_DEFENSEFIELDTURRET, -(numdft*3.541) + (1000*log(GameTime+1)/7271))			
			if numdft >= 3 then
				ShipDemandAdd( HGN_DEFENSEFIELDTURRET, -10 )
			end

			if numsentinel > numionsentinel then
				ShipDemandAdd( HGN_SENTINEL, -10 )
				ShipDemandAdd( HGN_IONSENTINEL, 10.465 )		
			elseif numionsentinel > numsentinel then
				ShipDemandAdd( HGN_SENTINEL, 10.571 )
				ShipDemandAdd( HGN_IONSENTINEL, -10 )		
			else
			end	
			
		else
			local numBuilder = numQueueOfClass( eBuilder )
			if numBuilder < 4 then
			  ShipDemandAdd( HGN_GUNTURRET, -7 )
				ShipDemandAdd( HGN_PULSARTURRET, -6 )
				ShipDemandAdd( HGN_IONTURRET, -5 )
				ShipDemandAdd( HGN_MISSILETURRET, -4 )
				ShipDemandAdd( HGN_RTS, -3 )	
				ShipDemandAdd( HGN_SENTINEL, -3 )		
				ShipDemandAdd( HGN_IONSENTINEL, -3 )	
				ShipDemandAdd( HGN_ARTILLERYSENTINEL, -3 )	
			end
			
			local numDefenderDrone = NumSquadrons( HGN_DEFENDERDRONE ) + NumSquadronsQ( HGN_DEFENDERDRONE )
			ShipDemandAdd(HGN_DEFENDERDRONE, min(10, numRUs/1471 -(numDefenderDrone*0.758)))
			if numDefenderDrone >= 50 then
				ShipDemandAdd( HGN_DEFENDERDRONE, -(numDefenderDrone*10) )
			end
			
			local numCarrier = NumSquadrons( HGN_CARRIER ) + NumSquadronsQ( HGN_CARRIER )
			local numSY = NumSquadrons( HGN_SHIPYARD ) + NumSquadronsQ( HGN_SHIPYARD )
			if numCarrier + numSY < 2 then
				ShipDemandAdd( HGN_CARRIER, 2.871 - numCarrier )
				ShipDemandAdd( HGN_SHIPYARD, 2.771 - numSY )
			end
			local numOrbital = NumSquadrons( HGN_BATTLESTATION ) + NumSquadronsQ( HGN_BATTLESTATION )
			if numCarrier + numSY < 1 and numOrbital > 0 then
				ShipDemandAdd( HGN_CARRIER, 10.712 )
			end
			
			--rebuild the mothership by hyperspace core
			if NumSquadrons( HGN_HSCORE ) > 0 then
				ShipDemandAdd( HGN_MOTHERSHIP, 10.724 )
			end
			
			ShipDemandAdd( HGN_ASSAULTFRIGATE, 0.572 )
			ShipDemandAdd( HGN_IONCANNONFRIGATE, 0.6276 )
			ShipDemandAdd( HGN_TORPEDOFRIGATE, 0.6115 )
			ShipDemandAdd( HGN_MARINEFRIGATE, 0.2708 )
			ShipDemandAdd( HGN_DEFENSEFIELDFRIGATE, 0.2966 )
			ShipDemandAdd( HGN_LRMS, 0.3516 )
			ShipDemandAdd( HGN_TULWAR, 0.4219 )
				
		end			
		
		if g_LOD == 0 then
			ShipDemandAdd( HGN_MASSIVETURRET, 0 )				
		elseif g_LOD == 1 then
			ShipDemandAdd( HGN_MASSIVETURRET, 0.2738 )				
		elseif g_LOD > 1  then
			ShipDemandAdd( HGN_MASSIVETURRET, 0.4718 )				
		end					
		local numMassiveTurret = NumSquadrons( HGN_MASSIVETURRET ) + NumSquadronsQ( HGN_MASSIVETURRET )
		ShipDemandAdd(HGN_MASSIVETURRET, -(numMassiveTurret*1.576) + (1000*log(GameTime+1)/8761))						
		
---Crew Cell			
    if NumSquadrons( HGN_CREWSTATION ) > 0 then	
      if g_LOD == 0 then
		  	ShipDemandAdd( HGN_TRANSPORTCELL, 0.5241 )	
		  elseif g_LOD == 1 then
		  	ShipDemandAdd( HGN_TRANSPORTCELL, 1.5751 )
		  elseif g_LOD > 1  then
		  	ShipDemandAdd( HGN_TRANSPORTCELL, 2.1781 )		
		  end								
			local numTransportCell = NumSquadrons( HGN_TRANSPORTCELL ) + NumSquadronsQ( HGN_TRANSPORTCELL )
			ShipDemandAdd(HGN_TRANSPORTCELL, (-numTransportCell/3.271))			
		else
		  ShipDemandAdd( HGN_TRANSPORTCELL, -10 )				
		end			

---Patchers		   
		local numPatchers = NumSquadrons( HGN_PATCHER ) + NumSquadronsQ( HGN_PATCHER ) 
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
    local numPatcherBuilder = NumSquadrons(HGN_SHIPYARD) + NumSquadrons(HGN_BATTLESHIPYARD) + NumSquadrons(HGN_SHIPYARD_G) + NumSquadrons(HGN_COMMANDFORTRESS) + NumSquadrons(HGN_MOTHERSHIP) + NumSquadrons(HGN_TANKER)
		if numPatcherBuilder > 0 and numRUs > 1000 then
		  ShipDemandAdd( HGN_PATCHER, min(10, 3.5508*numCapital + numRUs/3999 - numPatchers*0.4224) )
		end
		local numPatchers = NumSquadrons( HGN_PATCHER ) + NumSquadronsQ( HGN_PATCHER )
	  if g_LOD == 0 then
			if numPatchers >= (numPatcherBuilder * 3) then
			  ShipDemandAdd( HGN_PATCHER, -10 )
			end
		elseif g_LOD == 1 then
			if numPatchers >= (numPatcherBuilder * 4) then
			  ShipDemandAdd( HGN_PATCHER, -10 )
			end
		elseif g_LOD > 1  then
			if numPatchers >= (numPatcherBuilder * 5) then
			  ShipDemandAdd( HGN_PATCHER, -10 )
			end
		end	
---Drones		    
    local numDroneBuilder = NumSquadrons(HGN_COMMANDFORTRESS)
		if (numDroneBuilder > 0) then
		  ShipDemandAdd( HGN_DRONE, 2.5546 * numDroneBuilder )
		end
		local numDrones = NumSquadrons( HGN_DRONE ) + NumSquadronsQ( HGN_DRONE )
		if numDrones >= 27 then
			ShipDemandAdd( HGN_DRONE, -10 )
		end
---Shuttle
		local numShuttle = NumSquadrons(HGN_TANKER)
		if numShuttle < 1 then
			ShipDemandAdd( HGN_TANKER, 0.2461 * (18 - numPatchers) )
		else
			ShipDemandAdd( HGN_TANKER, -10 )
		end
---Space Carrier
		local numShuttle = NumSquadrons(HGN_SPACECARRIER)
		if numShuttle < 1 then
			ShipDemandAdd( HGN_SPACECARRIER, 0.2561 * (18 - numPatchers) )
		else
			ShipDemandAdd( HGN_SPACECARRIER, -10 )
		end
		
---Trade Container
    local hasallied = NumSubSystems(HASALLIED)   
    local numContainer = NumSquadrons(HGN_CONTAINER) 	
    if hasallied > 0 then      
      ShipDemandAdd( HGN_CONTAINER, min(10, (numRUs/7246) - (numContainer*4.145)) )
    else
      ShipDemandAdd( HGN_CONTAINER, -10 )  
    end	

---se c'?nave superiore diminuisce domanda per nave inferiore		
		if ((IsResearchDone(INTRUDERTECH) == 1 or IsResearchDone(AVENGERTECH) == 1) and GetRU() > 800) then
		  ShipDemandAdd( HGN_INTERCEPTOR, -0.75 )
		  ShipDemandAdd( HGN_HFT, 0.6461 )
		  ShipDemandAdd( HGN_RAILGUNFIGHTER, 0.5572 )
		  ShipDemandAdd( HGN_INTERCEPTORL, -0.75 )
		  ShipDemandAdd( HGN_HFTL, 0.6109 )
		  ShipDemandAdd( HGN_RAILGUNFIGHTERL, 0.5793 )
		end  
		
		if (IsResearchDone(BOMBERHEAVYTECH) == 1 and GetRU() > 800) then
		  ShipDemandAdd( HGN_ATTACKBOMBER, -0.5 )
		  ShipDemandAdd( HGN_LBOMBER, -0.75 )
		  ShipDemandAdd( HGN_ATTACKBOMBERHEAVY, 0.5269 )
		  ShipDemandAdd( HGN_ATTACKBOMBERL, -0.5 )
		  ShipDemandAdd( HGN_LBOMBERL, -0.75 )
		  ShipDemandAdd( HGN_ATTACKBOMBERHEAVYL, 0.517 )
		end  
		
		if (IsResearchDone(NUKEBOMBERTECH) == 1 and GetRU() > 9000) then
		  ShipDemandAdd( HGN_STRATEGICBOMBER, 0.5781 )
		  ShipDemandAdd( HGN_STRATEGICBOMBERL, 0.5927 )
		  if IsResearchDone(NUKEBOMBERLONGRANGENUKE) == 1 then
		  	ShipDemandAdd( HGN_STRATEGICBOMBER, 0.5168 )
		  	ShipDemandAdd( HGN_STRATEGICBOMBERL, 0.5741 )
		  end
		end
		
		if (IsResearchDone(MINEGUNTECH) == 1 and GetRU() > 900) then
		  ShipDemandAdd( HGN_MULTIGUNCORVETTE, 0.5216 )
		  ShipDemandAdd( HGN_MULTIGUNCORVETTEL, 0.5272 )
		  if IsResearchDone(GUNSHIPENERGYCANNON) == 0 then
		  	ShipDemandAdd( HGN_ASSAULTCORVETTE, -0.5 )
		  	ShipDemandAdd( HGN_ASSAULTCORVETTEL, -0.5 )
		  end
		end  
		
		if ((IsResearchDone(ASSAULTGUNSHIPTECH) == 1 or IsResearchDone(ASSAULTGUNSHIPTECH1) == 1) and GetRU() > 900) then		
		  ShipDemandAdd( HGN_PULSARCORVETTE, -0.5 )
		  ShipDemandAdd( HGN_CTH, 0.5467 )
		  ShipDemandAdd( HGN_CTHION, 0.5271 )
		  ShipDemandAdd( HGN_PULSARCORVETTEL, -0.5 )
		  ShipDemandAdd( HGN_CTHL, 0.5761 )
		  ShipDemandAdd( HGN_CTHIONL, 0.5072 )
		end   	
		
		if (IsResearchDone(TORPEDOCORVETTETECH) == 1 and GetRU() > 900) then
			ShipDemandAdd( HGN_TORPEDOCORVETTE, 0.5771 )
		  ShipDemandAdd( HGN_TORPEDOCORVETTEL, 0.5996 )
		end
		
		if (IsResearchDone(ADVDESTROYERTECH) == 1 and GetRU() > 1000) then
		  ShipDemandAdd( HGN_DESTROYER, -0.6 )
		  ShipDemandAdd( HGN_SWEEPERDESTROYER, -0.7 )
		  ShipDemandAdd( HGN_MISSILEDESTROYER, -0.5 )
		  ShipDemandAdd( HGN_IONDESTROYER, -0.5 )
		  ShipDemandAdd( HGN_ADVDESTROYER, 0.5767 )		  
		end  
		
---se ricerca squadriglia diminuisce domanda x vecchie unit?(credo sia inutile perch?le unit?vengono restricted)
    if IsResearchDone(FIGHTERSQUADRON7) == 1 then
		  ShipDemandAdd( HGN_INTERCEPTOR, -10 )
		  ShipDemandAdd( HGN_HFT, -10 )
		  ShipDemandAdd( HGN_RAILGUNFIGHTER, -10 )
		  ShipDemandAdd( HGN_ATTACKBOMBER, -10 )
		  ShipDemandAdd( HGN_LBOMBER, -10 )
		  ShipDemandAdd( HGN_ATTACKBOMBERHEAVY, -10 )
		  ShipDemandAdd( HGN_STRATEGICBOMBER, -10 )
		end			
		if IsResearchDone(CORVETTESQUADRON5) == 1 then
		  ShipDemandAdd( HGN_ASSAULTCORVETTE, -10 )
		  ShipDemandAdd( HGN_MULTIGUNCORVETTE, -10 )
		  ShipDemandAdd( HGN_PULSARCORVETTE, -10 )
			ShipDemandAdd( HGN_BOMBERVETTE, -10 )
		  ShipDemandAdd( HGN_CTH, -10 )
		  ShipDemandAdd( HGN_CTHION, -10 )
		  ShipDemandAdd( HGN_TORPEDOCORVETTE, -10 )
		  ShipDemandAdd( HGN_GUNSHIPCOEVETTE, -10 )
		end			
				
	elseif (s_race == Race_Vaygr) then	

---Trade Container
    local hasallied = NumSubSystems(HASALLIED)   
    local numContainer = NumSquadrons(VGR_CONTAINER) 	
    if hasallied > 0 then      
      ShipDemandAdd( VGR_CONTAINER, min(10, (numRUs/7057) - (numContainer*4.416)) )
    else
      ShipDemandAdd( VGR_CONTAINER, -10 )  
    end		

---Prospector
    local numScaver = NumSquadrons( VGR_SCAVER ) + NumSquadronsQ( VGR_SCAVER )
		if numScaver == 0 then
		  if numRUs > 3500 and rank >= 1 then
			  ShipDemandSet( VGR_SCAVER, 3.642 + (1000*log(GameTime+1)/10271))
			end  
		else
		  ShipDemandSet( VGR_SCAVER, -10 )	
		end

---Capturer
		local numCapturer = NumSquadrons( VGR_INFILTRATORFRIGATE ) + NumSquadronsQ( VGR_INFILTRATORFRIGATE )
		local limit = 2
		if g_LOD >= 1 then
			limit = 6
		elseif g_LOD == 1 then
			limit = 4
		end
		if numCapturer < limit then
		  ShipDemandSet( VGR_INFILTRATORFRIGATE, 4.856 + (1000*log(GameTime+1)/10379))
		else
		  ShipDemandSet( VGR_INFILTRATORFRIGATE, -10 )
		end

---Destroyer
--   	local numDestroyer = NumSquadrons( VGR_DESTROYER ) + NumSquadronsQ( VGR_DESTROYER )	
--   	if g_LOD >= 1 then
--		  if numDestroyer == 0 and IsResearchDone(DESTROYERGUNS) == 1 and numRUs > 1000 then
--		    ShipDemandAdd(VGR_DESTROYER, 0.77)
--		  end
--		end			
		
---se c'?nave superiore diminuisce ricerca per inferiore
   if (IsResearchDone(DEFENDERTECH) == 1 and GetRU() > 600) then
		 ShipDemandAdd( VGR_INTERCEPTOR, -0.5 )
		 ShipDemandAdd( VGR_DEFENDER, 0.5231 )
	 else
	   ShipDemandAdd( VGR_DEFENDER, 0.5445 )
	   ShipDemandAdd( VGR_HEAVYFIGHTER, 0.5387 )
	   ShipDemandAdd( VGR_LANCEFIGHTER, 0.5228 )
	   ShipDemandAdd( VGR_MISSILEBOMBER, 0.5142 )
	   ShipDemandAdd( VGR_ELITEFIGHTER, 0.5347 )
	 end  	

	 if (IsResearchDone(MULTIROLETECH) == 1 and GetRU() > 750) then
		 ShipDemandAdd( VGR_INTERCEPTOR, -0.5 )
		 --ShipDemandAdd( VGR_BOMBER, -0.5 )
		 --ShipDemandAdd( VGR_LANCEFIGHTER, -0.25 )
     --ShipDemandAdd( VGR_DEFENDER, -0.25 )
		 ShipDemandAdd( VGR_ELITEFIGHTER, 0.5081 )
	 end  	
	 
	 if (IsResearchDone(MISSILEBOMBERTECH) == 1 and GetRU() > 850) then
		 --ShipDemandAdd( VGR_BOMBER, -0.25 )
		 ShipDemandAdd( VGR_MISSILEBOMBER, 0.9528 )
	 else
	 	 ShipDemandAdd( VGR_MISSILEBOMBER, 0.5571 )
	 end

	 if (IsResearchDone(STRIKER) == 1 and GetRU() > 900) then
	   ShipDemandAdd( VGR_MISSILECORVETTE, -0.5 )
	   --ShipDemandAdd( VGR_LASERCORVETTE, -0.5 )
		 --ShipDemandAdd( VGR_PLASMACORVETTE, -0.5 )
	   --ShipDemandAdd( VGR_STANDVETTE, -0.4 )
	   --ShipDemandAdd( VGR_MULTILANCECORVETTE, -0.3 )
		 --ShipDemandAdd( VGR_MORTARCORVETTE, -0.2 )
	   ShipDemandAdd( VGR_STRIKER, 0.5468 )
	 else
	   ShipDemandAdd( VGR_STRIKER, 0.5152 )
	   ShipDemandAdd( VGR_MORTARCORVETTE, 0.5234 )
	   ShipDemandAdd( VGR_STANDVETTE, 0.5089 )
	   ShipDemandAdd( VGR_PLASMACORVETTE, 0.5167 )
	   ShipDemandAdd( VGR_LASERCORVETTE, 0.5289 )
	   ShipDemandAdd( VGR_MULTILANCECORVETTE, 0.5050 )
	 end

---Mechanics
		local numPatchers = NumSquadrons( VGR_PATCHER ) + NumSquadronsQ( VGR_PATCHER )
		local max_num = 10
	  if g_LOD == 0 then
	  	max_num = 5
		elseif g_LOD == 1 then
			max_num = 10
		elseif g_LOD > 1  then
			max_num = 18
		end
		if numRUs > 1000 and numPatchers < max_num then
	    ShipDemandAdd(VGR_PATCHER, min(10, 2.849 + numRUs/4096 - numPatchers*0.347))
	  elseif numPatchers >= max_num then
	  	ShipDemandAdd(VGR_PATCHER, -10)
		end

---Hyperspace Gate
   	local numHSplatform = NumSquadrons( VGR_HYPERSPACE_PLATFORM ) + NumSquadronsQ( VGR_HYPERSPACE_PLATFORM )	
   	if IsResearchDone(HYPERSPACEGATETECH) == 1 and numRUs > 1000 and numHSplatform < 10 then
		  ShipDemandAdd(VGR_HYPERSPACE_PLATFORM, min(10, 2.573 + numRUs/5098 - numHSplatform*0.337))
		end
		
---Cloak Platform
   	local numCplatform = NumSquadrons( VGR_CLOAKPLATFORM ) + NumSquadronsQ( VGR_CLOAKPLATFORM )	
   	if IsResearchDone(CLOAKPLATFORM) == 1 and numRUs > 2500 and numCplatform < 5 then
		  ShipDemandAdd(VGR_CLOAKPLATFORM, min(10, 1.528 + numRUs/5697 - numCplatform*0.331))
		elseif IsResearchDone(CLOAKPLATFORM) == 0 then
      ShipDemandAdd(VGR_CLOAKPLATFORM, 0.5287)
		end
		
---IED
   	local numIED = NumSquadrons( VGR_MOBILE_INHIBITOR ) + NumSquadronsQ( VGR_MOBILE_INHIBITOR )	
   	if IsResearchDone(PLATFORMIED) == 1 and numRUs > 2000 and numIED < 10 then
		  ShipDemandAdd(VGR_MOBILE_INHIBITOR, min(10, 1.522 + numRUs/5784 - numIED*0.335))
		elseif IsResearchDone(PLATFORMIED) == 0 then
      ShipDemandAdd(VGR_MOBILE_INHIBITOR, 0.5216)
		end

---Platforms & Frigates
    if NumSquadrons( VGR_MOTHERSHIP ) > 0 then	
	    if g_LOD == 0 then
				ShipDemandAdd( VGR_WEAPONPLATFORM_GUN, 0 )
				ShipDemandAdd( VGR_WEAPONPLATFORM_LANCE, 0 )
				ShipDemandAdd( VGR_WEAPONPLATFORM_MISSILE, 0 )					
				ShipDemandAdd( VGR_ASSAULTFRIGATE, 0.2272 )
				ShipDemandAdd( VGR_ADVASSAULTFRIGATE, 0.2171 )
				ShipDemandAdd( VGR_HEAVYMISSILEFRIGATE, 0.1976 )
				ShipDemandAdd( VGR_INFILTRATORFRIGATE, 0.1792 )
				ShipDemandAdd( VGR_EMPFRIGATE, 0.0859 )
				ShipDemandAdd( VGR_COMMANDFRIGATE, 0.0873 )
				ShipDemandAdd( VGR_SUPPORTFRIGATE_LASER, 0.1508 )
				ShipDemandAdd( VGR_SUPPORTFRIGATE, 0.1276 )	
				ShipDemandAdd( VGR_SUPPORTFRIGATEARMED, 0.1051 )	
				ShipDemandAdd( VGR_ARTILLERYFRIGATE, 0.1119 )
				ShipDemandAdd( VGR_LONGRANGEARTILLERYFRIGATE, 0.1376 )
			elseif g_LOD == 1 then
				ShipDemandAdd( VGR_WEAPONPLATFORM_GUN, 0.3172 )
				ShipDemandAdd( VGR_WEAPONPLATFORM_LANCE, 0.3864 )
				ShipDemandAdd( VGR_WEAPONPLATFORM_MISSILE, 0.4761 )						
				ShipDemandAdd( VGR_MOBILE_INHIBITOR, 0.4791 )
				ShipDemandAdd( VGR_BOMBER, 0.3121 )
				ShipDemandAdd( VGR_ADVASSAULTFRIGATE, 0.4649 )
				ShipDemandAdd( VGR_HEAVYMISSILEFRIGATE, 0.4128 )
				ShipDemandAdd( VGR_INFILTRATORFRIGATE, 0.1314 )
				ShipDemandAdd( VGR_EMPFRIGATE, 0.2225 )
				ShipDemandAdd( VGR_COMMANDFRIGATE, 0.1899 )
				ShipDemandAdd( VGR_SUPPORTFRIGATE_LASER, 0.2516 )
				ShipDemandAdd( VGR_SUPPORTFRIGATE, 0.2326 )
				ShipDemandAdd( VGR_SUPPORTFRIGATEARMED, 0.2015 )	
				ShipDemandAdd( VGR_ARTILLERYFRIGATE, 0.3119 )
				ShipDemandAdd( VGR_LONGRANGEARTILLERYFRIGATE, 0.2126 )
			elseif g_LOD > 1  then
				ShipDemandAdd( VGR_WEAPONPLATFORM_MISSILE, 0.6315 )
				ShipDemandAdd( VGR_MOBILE_INHIBITOR, 0.6545 )
				ShipDemandAdd( VGR_BIOSHIP, 0.7515 )									
				ShipDemandAdd( VGR_MISSILEBOMBER, 0.8512 )
				--ShipDemandAdd( VGR_ASSAULTFRIGATE, 0.27 )
				ShipDemandAdd( VGR_ADVASSAULTFRIGATE, 0.7751 )
				ShipDemandAdd( VGR_HEAVYMISSILEFRIGATE, 0.7728 )
				ShipDemandAdd( VGR_INFILTRATORFRIGATE, 0.7761 )
				ShipDemandAdd( VGR_EMPFRIGATE, 0.7712 )
				ShipDemandAdd( VGR_COMMANDFRIGATE, 0.7771 )
				ShipDemandAdd( VGR_SUPPORTFRIGATE_LASER, 0.7792 )
				ShipDemandAdd( VGR_SUPPORTFRIGATE, 0.7718 )
				ShipDemandAdd( VGR_SUPPORTFRIGATEARMED, 0.7706 )
				ShipDemandAdd( VGR_ARTILLERYFRIGATE, 0.7788 )
				ShipDemandAdd( VGR_LONGRANGEARTILLERYFRIGATE, 0.7729 )
			end			
					
			local numGunTurret = NumSquadrons( VGR_WEAPONPLATFORM_GUN ) + NumSquadronsQ( VGR_WEAPONPLATFORM_GUN )
			ShipDemandAdd(VGR_WEAPONPLATFORM_GUN, -(numGunTurret*3.049) + (1000*log(GameTime+1)/11019))		
			
			local numLanceTurret = NumSquadrons( VGR_WEAPONPLATFORM_LANCE ) + NumSquadronsQ( VGR_WEAPONPLATFORM_LANCE )
			ShipDemandAdd(VGR_WEAPONPLATFORM_LANCE, -(numLanceTurret*3.241) + (1000*log(GameTime+1)/11541))
			
			local numPulsarTurret = NumSquadrons( VGR_WEAPONPLATFORM_MISSILE ) + NumSquadronsQ( VGR_WEAPONPLATFORM_MISSILE )
			ShipDemandAdd(VGR_WEAPONPLATFORM_MISSILE, -(numPulsarTurret*3.126) + (1000*log(GameTime+1)/10846))			
			
			local numIEDTurret = NumSquadrons( VGR_MOBILE_INHIBITOR ) + NumSquadronsQ( VGR_MOBILE_INHIBITOR )
			ShipDemandAdd(numIEDTurret, -(numIEDTurret*3.481) + (1000*log(GameTime+1)/10761))
			
		else
			local numBuilder = numQueueOfClass( eBuilder )
			if numBuilder < 3 then
			  ShipDemandAdd( VGR_WEAPONPLATFORM_GUN, -6 )
			  ShipDemandAdd( VGR_WEAPONPLATFORM_LANCE, -5 )
				ShipDemandAdd( VGR_WEAPONPLATFORM_MISSILE, -5 )			
				ShipDemandAdd( VGR_MOBILE_INHIBITOR, -5 )
			else
				local numIEDTurret = NumSquadrons( VGR_MOBILE_INHIBITOR ) + NumSquadronsQ( VGR_MOBILE_INHIBITOR )
				if numIEDTurret < 5 then
					ShipDemandAdd(numIEDTurret, min(10, numRUs/2000 -(numIEDTurret*1.681) + (1000*log(GameTime+1)/10593)))
				else
					ShipDemandAdd(numIEDTurret, -(numIEDTurret*1.6))
				end
			end
			
			local numGunTurret = NumSquadrons( VGR_WEAPONPLATFORM_GUN ) + NumSquadronsQ( VGR_WEAPONPLATFORM_GUN )
			if numGunTurret > 15 then
				ShipDemandAdd(VGR_WEAPONPLATFORM_GUN, -(numGunTurret*3))		
			end
			
			local numLanceTurret = NumSquadrons( VGR_WEAPONPLATFORM_LANCE ) + NumSquadronsQ( VGR_WEAPONPLATFORM_LANCE )
			if numLanceTurret > 15 then
				ShipDemandAdd(VGR_WEAPONPLATFORM_LANCE, -(numLanceTurret*3))		
			end
			
			local numPulsarTurret = NumSquadrons( VGR_WEAPONPLATFORM_MISSILE ) + NumSquadronsQ( VGR_WEAPONPLATFORM_MISSILE )
			if numPulsarTurret > 15 then
				ShipDemandAdd(VGR_WEAPONPLATFORM_MISSILE, -(numPulsarTurret*3))			
			end
			
			local numCarrier = NumSquadrons( VGR_CARRIER ) + NumSquadronsQ( VGR_CARRIER )
			local numSY = NumSquadrons( VGR_SHIPYARD ) + NumSquadronsQ( VGR_SHIPYARD )
			local numHS = NumSubSystems(HYPERSPACE)
			local numRS = NumSubSystems(RESEARCH)
			if numCarrier + numSY < 3 then
				ShipDemandAdd( VGR_CARRIER, 2.416 - numCarrier + 2.461/numRS + 2.549/HYPERSPACE )
				ShipDemandAdd( VGR_SHIPYARD, 2.549 - numSY + 2.418/numRS + 2.154/HYPERSPACE )
			end

			ShipDemandAdd( VGR_ASSAULTFRIGATE, 0.2272 )
			ShipDemandAdd( VGR_ADVASSAULTFRIGATE, 0.7176 )
			ShipDemandAdd( VGR_HEAVYMISSILEFRIGATE, 0.7717 )
			ShipDemandAdd( VGR_INFILTRATORFRIGATE, 0.3368 )
			ShipDemandAdd( VGR_EMPFRIGATE, 0.4139 )
			ShipDemandAdd( VGR_COMMANDFRIGATE, 0.4076 )
			ShipDemandAdd( VGR_SUPPORTFRIGATE_LASER, 0.6374 )
			ShipDemandAdd( VGR_SUPPORTFRIGATE, 0.6821 )
			ShipDemandAdd( VGR_SUPPORTFRIGATEARMED, 0.4016 )
			ShipDemandAdd( VGR_ARTILLERYFRIGATE, 0.5902 )
			ShipDemandAdd( VGR_LONGRANGEARTILLERYFRIGATE, 0.6209 )

			--rebuild the mothership by Sajuuk
			if NumSquadrons( VGR_ARTILLERYBATTLECRUISER ) > 0 then
				ShipDemandAdd( VGR_MOTHERSHIP, 10.722 )
			else
				ShipDemandAdd( VGR_ARTILLERYBATTLECRUISER, 10.446 )
			end

		end	
		
		if NumSquadrons( VGR_AM ) + NumSquadronsQ( VGR_AM ) == 0 then
		  ShipDemandAdd( VGR_AM, 2.709 )
		elseif NumSquadrons( VGR_AM ) + NumSquadronsQ( VGR_AM ) >= 6 then  	
		  ShipDemandAdd( VGR_AM, -4 )
		elseif NumSquadrons( VGR_AM ) + NumSquadronsQ( VGR_AM ) >= 3 then  	
		  ShipDemandAdd( VGR_AM, -2.5 )  
		end
		
--Sinner
    local numSinner = NumSquadrons( VGR_SINNER ) + NumSquadronsQ( VGR_SINNER )	   	
		if numSinner >= 4 then
			ShipDemandAdd(VGR_SINNER, -10)
		end
		
		if NumSquadrons( VGR_DESTROYER ) + NumSquadronsQ( VGR_DESTROYER ) >= 15 then	
			ShipDemandAdd( VGR_AM, 0.2558 )
		  ShipDemandAdd( VGR_CRUISER, 0.576 )
			ShipDemandAdd( VGR_LIGHTCRUISER, 0.572 )
			ShipDemandAdd(VGR_LIGHTCRUISER_GUN, 0.514)
			ShipDemandAdd( VGR_ARTILLERYSHIP, 0.546 )
		  ShipDemandAdd( VGR_DESTROYER, -0.5 )	
      ShipDemandAdd( VGR_PULSEDESTROYER, 0.424 )			
		elseif NumSquadrons( VGR_DESTROYER ) + NumSquadronsQ( VGR_DESTROYER ) >= 10 then  	
		  ShipDemandAdd( VGR_AM, 0.1576 )
		  ShipDemandAdd( VGR_CRUISER, 0.4358 )
			ShipDemandAdd( VGR_LIGHTCRUISER, 0.4141 )
			ShipDemandAdd( VGR_LIGHTCRUISER_GUN, 0.4406)
			ShipDemandAdd( VGR_ARTILLERYSHIP, 0.4282 )
		  ShipDemandAdd( VGR_DESTROYER, -0.4 )
			ShipDemandAdd( VGR_PULSEDESTROYER, 0.3762 )
		elseif NumSquadrons( VGR_DESTROYER ) + NumSquadronsQ( VGR_DESTROYER ) >= 5 then  	
		  ShipDemandAdd( VGR_AM, 0.058 )
		  ShipDemandAdd( VGR_CRUISER, 0.3254 )
			ShipDemandAdd( VGR_LIGHTCRUISER, 0.3372 )
			ShipDemandAdd( VGR_LIGHTCRUISER_GUN, 0.3284)
			ShipDemandAdd( VGR_ARTILLERYSHIP, 0.3258 )
		  ShipDemandAdd( VGR_DESTROYER, -0.3 )
			ShipDemandAdd( VGR_PULSEDESTROYER, 0.2755 )	
		end	


	elseif (s_race == 3) then	
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
			ShipDemandAddByClass( eFrigate, 1.5 )
			
---Trade Container
    local hasallied = NumSubSystems(HASALLIED)   
    local numContainer = NumSquadrons(KAD_CONTAINER) 	
    if hasallied > 0 then      
      ShipDemandAdd( KAD_CONTAINER, min(10, (numRUs/7028) - (numContainer*4.54)) )
    else
      ShipDemandAdd( KAD_CONTAINER, -10 )  
    end

		local numPodShip = NumSquadrons( KAD_PODSHIP ) + NumSquadronsQ( KAD_PODSHIP )
		local numFiCo = numActiveOfClass( s_playerIndex, eFighter ) + numActiveOfClass( s_playerIndex, eCorvette )
		if numPodShip < numFiCo / 15 then
			ShipDemandAdd(KAD_PODSHIP, 99.541-(numPodShip*3.542))	
		end
		
		if IsResearchDone( SUPCAPTECH ) == 1 then
			local numNeedle = NumSquadrons( KAD_NEEDLESHIP ) + NumSquadronsQ( KAD_NEEDLESHIP )
			local numCapital = numActiveOfClass( s_playerIndex, eCapital )
			if numNeedle < numCapital / 5 then
				ShipDemandAdd(KAD_NEEDLESHIP, 99.542-(numNeedle*20.511))	
			elseif numCapital < 6 then
				ShipDemandAdd(KAD_NEEDLESHIP, 1.2497)
			end
		end
		
		if IsResearchDone( SUPCAPTECH ) == 1 and IsResearchDone( SAJUUK1 ) == 1 then
			local numAvatar = NumSquadrons( KAD_DESTROYER ) + NumSquadronsQ( KAD_DESTROYER )
			local numCapital = numActiveOfClass( s_playerIndex, eCapital )
			if numAvatar < numCapital / 5 then
				ShipDemandAdd(KAD_DESTROYER, 99.521-(numAvatar*10.281))	
			elseif numCapital < 6 then
				ShipDemandAdd(KAD_DESTROYER, 1.5487)
			end
		end

		local numPulsarTurret = NumSquadrons( KAD_SNAIL ) + NumSquadronsQ( KAD_SNAIL )
		if numPulsarTurret > 15 then
			ShipDemandAdd(KAD_SNAIL, -(numPulsarTurret*1.5))	
		else
			ShipDemandAdd( KAD_SNAIL, 0.5587 )		
		end

		local numPulsarTurret = NumSquadrons( KAD_NEBULADRONE ) + NumSquadronsQ( KAD_NEBULADRONE )
		if numPulsarTurret > 4 then
			ShipDemandAdd(KAD_NEBULADRONE, -(numPulsarTurret*1.5))	
		else
			ShipDemandAdd( KAD_NEBULADRONE, 0.4508 )		
		end

	elseif (s_race == 4) then	
	
---Trade Container
    local hasallied = NumSubSystems(HASALLIED)   
    local numContainer = NumSquadrons(RAD_CONTAINER) 	
    if hasallied > 0 then      
      ShipDemandAdd( RAD_CONTAINER, min(10, (numRUs/7070) - (numContainer*4.548)) )
    else
      ShipDemandAdd( RAD_CONTAINER, -10 )  
    end		

---Capturer
		local numCapturer = NumSquadrons( RAD_GUNFRIGATE ) + NumSquadronsQ( RAD_GUNFRIGATE )
		local limit = 2
		if g_LOD >= 1 then
			limit = 6
		elseif g_LOD == 1 then
			limit = 4
		end
		if numCapturer < limit then
		  ShipDemandSet( RAD_GUNFRIGATE, 4.856 + (1000*log(GameTime+1)/10379))
		else
		  ShipDemandSet( RAD_GUNFRIGATE, -10 )
		end

		local numPulsarTurret = NumSquadrons( RAD_POWERSTATION ) + NumSquadronsQ( RAD_POWERSTATION )
		if numPulsarTurret < 1 then
			ShipDemandAdd( RAD_POWERSTATION, 5.8741 )		
		end

		if IsResearchDone( CAP_UNLOCK2 ) == 1 then
			local numAvatar = NumSquadrons( RAD_CARRIER ) + NumSquadronsQ( RAD_CARRIER ) + NumSquadrons( RAD_SCAFFOLDA ) + NumSquadronsQ( RAD_SCAFFOLDA )
			local numCapital = numActiveOfClass( s_playerIndex, eCapital )
			if numAvatar < numCapital / 5 then
				ShipDemandAdd(RAD_SCAFFOLDA, 99.548-(numAvatar*30.546))	
			end
		end
		
		if IsResearchDone( GHOSTTECH ) == 1 then
			local numAvatar = NumSquadrons( RAD_CARRIER_BLACK ) + NumSquadronsQ( RAD_CARRIER_BLACK ) + NumSquadrons( RAD_SCAFFOLDB ) + NumSquadronsQ( RAD_SCAFFOLDB )
			local numCapital = numActiveOfClass( s_playerIndex, eCapital )
			if numAvatar < numCapital / 6 then
				ShipDemandAdd(RAD_SCAFFOLDB, 99.139-(numAvatar*30.764))	
			end
		end

		local numPulsarTurret = NumSquadrons( RAD_EXPLOTRAP ) + NumSquadronsQ( RAD_EXPLOTRAP )
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )
		local numtobuikd = 5
		if g_LOD == 0 then
			numtobuikd = 2
		elseif g_LOD == 1 then
			numtobuikd = 4
		elseif g_LOD > 1 then
			numtobuikd = 6
		end
		if numPulsarTurret > numtobuikd then
			ShipDemandAdd(RAD_EXPLOTRAP, -(numPulsarTurret*1.5))	
		else
			ShipDemandAdd( RAD_EXPLOTRAP, 0.541 - numCapital/5.548 )		
		end
		
		local numPulsarTurret = NumSquadrons( RAD_GUNTRAP ) + NumSquadronsQ( RAD_GUNTRAP )
		if numPulsarTurret > 15 then
			ShipDemandAdd(RAD_GUNTRAP, -(numPulsarTurret*1.5))	
		else
			ShipDemandAdd( RAD_GUNTRAP, 0.5098 )		
		end
		
		local numPulsarTurret = NumSquadrons( RAD_HSBOUEY ) + NumSquadronsQ( RAD_HSBOUEY )
		if numPulsarTurret > 5 then
			ShipDemandAdd(RAD_HSBOUEY, 1.481-(numPulsarTurret*0.559))		
		else
			ShipDemandAdd( RAD_HSBOUEY, 1.557 )		
		end
		
		local numOutlaw = NumSquadrons( RAD_GUNFRIGATE ) + NumSquadrons( RAD_GUNFRIGATE_MORGAN )
		if numOutlaw < 1 then
			local numPulsarTurret = NumSquadrons( RAD_GUNCORVETTE ) + NumSquadronsQ( RAD_GUNCORVETTE )
			local numCapital = numActiveOfClass( s_playerIndex, eCapital )
			local numBuilder = numQueueOfClass( eBuilder )
			if numPulsarTurret > numCapital then
				ShipDemandAdd(RAD_GUNCORVETTE, 1.461-(numPulsarTurret/numCapital))		
			else
				ShipDemandAdd( RAD_GUNCORVETTE, numBuilder/2.542 )		
			end
		end
		
		local numCollector = NumSquadrons( RAD_RESOURCECOLLECTOR )
		if numCollector > 10 then
			local numPulsarTurret = NumSquadrons( RAD_RESOURCECONTROLLER ) + NumSquadronsQ( RAD_RESOURCECONTROLLER )
			if numPulsarTurret > numCollector/5 then
				ShipDemandAdd(RAD_RESOURCECONTROLLER, 1.145-(5.546*numPulsarTurret/numCollector))		
			else
				ShipDemandAdd( RAD_RESOURCECONTROLLER, numCollector/5.548 )		
			end
		end
		
		local numPulsarTurret = NumSquadrons( RAD_GRAVWEL ) + NumSquadronsQ( RAD_GRAVWEL )
		if numPulsarTurret > 3 then
			ShipDemandAdd(RAD_GRAVWEL, -(numPulsarTurret*1.579))	
		else
			ShipDemandAdd( RAD_GRAVWEL, 0.5715 )		
		end
		
		if IsResearchDone( GHOSTTECH ) == 1 then
			local numPulsarTurret = NumSquadrons( RAD_BLACKMARKET ) + NumSquadronsQ( RAD_BLACKMARKET )
			if numPulsarTurret < 1 then
				ShipDemandAdd(RAD_BLACKMARKET, 20.5421)
			end
		end

		if IsResearchDone( ISADMIRAL ) == 1 then
      local numCarrier = NumSquadrons( RAD_ARMSDEALER ) + NumSquadronsQ( RAD_ARMSDEALER ) 
			if numCarrier < 1 then
				ShipDemandAdd( RAD_ARMSDEALER, 10.5791)
			end
		end

	elseif (s_race == 6) then
---need more spam
			ShipDemandAddByClass( eFighter, 3.65 )
			ShipDemandAddByClass( eCorvette, 2.5 )
	
		local numtoadd = 1
		if g_LOD == 0 then
			numtoadd = 1
		elseif g_LOD == 1 then
			numtoadd = 2
		elseif g_LOD > 1 then
			numtoadd = 3
		end
---productional capital ships
		if NumSquadrons( KPR_SHIPYARD_OLD ) > 0 then
			local numPulsarTurret = NumSquadrons( KPR_CARRIER ) + NumSquadronsQ( KPR_CARRIER )
			if numPulsarTurret <= numtoadd then
				ShipDemandAdd( KPR_CARRIER, 10.541-numPulsarTurret*3.828 )
			end
			local numPulsarTurret = NumSquadrons( KPR_SHIPYARD_OLD ) + NumSquadronsQ( KPR_SHIPYARD_OLD )
			if numPulsarTurret < numtoadd then
				ShipDemandAdd( KPR_SHIPYARD_OLD, (numtoadd-numPulsarTurret)/3.379 )
			end
		else
			ShipDemandAdd( KPR_SHIPYARD_OLD, 10.5491 )
		end
		
---Capturer
		local numCapturer = NumSquadrons( KPR_DECIEVER ) + NumSquadronsQ( KPR_DECIEVER )
		local limit = 2
		if g_LOD >= 1 then
			limit = 6
		elseif g_LOD == 1 then
			limit = 4
		end
		if numCapturer < limit then
		  ShipDemandSet( KPR_DECIEVER, 4.856 + (1000*log(GameTime+1)/10379))
		else
		  ShipDemandSet( KPR_DECIEVER, -10 )
		end

---Power Generator
    local numGenerator = NumSquadrons(KPR_RESSOURCECOLLECTOR_OLD)+ NumSquadronsQ( KPR_RESSOURCECOLLECTOR_OLD )
    if numGenerator < 10 then
      ShipDemandAdd( KPR_RESSOURCECOLLECTOR_OLD, 10.541+numtoadd*2.088-numGenerator )
    end
    
---Resource Docker
    local numRes = NumSquadrons(KPR_RESOURCECOLLECTOR)+ NumSquadronsQ( KPR_RESOURCECOLLECTOR )
    local numRefinery = NumSquadrons(KPR_DRONESTRUCT)
    if numRes > 1 and numRefinery < 1 then
      ShipDemandAdd( KPR_DRONESTRUCT, 20.581/(numRefinery+1)^2 )
    end
    
		local numSEN = NumSquadrons( KPR_SENTINEL ) + NumSquadronsQ( KPR_SENTINEL )
		local numPulsarTurret = NumSquadrons( KPR_MEDDLER ) + NumSquadronsQ( KPR_MEDDLER )
		if numPulsarTurret > 5+numtoadd*3 then
			ShipDemandAdd(KPR_MEDDLER, -(numPulsarTurret*1.5))
		else
			ShipDemandAdd( KPR_MEDDLER, numSEN/20.128+500/(GameTime+1000))
		end
		local numPlat = numPulsarTurret + numSEN
		local numPulsarTurret = NumSquadrons( KPR_MARAUDER ) + NumSquadronsQ( KPR_MARAUDER )
		if numPulsarTurret > 5+numtoadd then
			ShipDemandAdd(KPR_MARAUDER, -(numPulsarTurret*1.5))	
		else
			ShipDemandAdd( KPR_MARAUDER, numPlat/20.134 )
		end
    
	end			--of race
	aitrace("DetermineSpecialDemand - End", 2)
end

---calcola il valore militare delle truppe da raggiungere----------------------------------------------------------------

function CalculateMilitaryValueGoal( militaryTable, percentOfEnemy )
	local curTime = gameTime()
	local minMilitaryValue = 0		
	if (s_enemyTotalValue*percentOfEnemy > minMilitaryValue) then
		minMilitaryValue = s_enemyTotalValue*percentOfEnemy
	end	
	for k,v in militaryTable do	
		if (curTime < v[3]) then			
			if (minMilitaryValue < v[1]) then
				minMilitaryValue = v[1]
			end			
			if (minMilitaryValue > v[2]) then
				minMilitaryValue = v[2]
			end
			break
		end	
	end	
	return minMilitaryValue
end

---domanda di costruzione per i LOD--------------------------------------------------

function CpuBuild_DefaultShipDemandRules_Easy()	
	local valueTable = 
	{
		-- min value, max value, time cap
		{80, 		135, 		8*60},
		{120,		180,		15*60},
		{160,		230,		20*60},
		{220,		300,		30*60},
		{270,		370,		45*60},
		{350,		500,		60*60},
		{500,		1000,		10000*60},
	}
	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.9 )	
	aitrace("Aim:"..minMilitaryValue.." CurMil:"..s_selfTotalValue.." Enm:"..s_enemyTotalValue )	
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end	
	DetermineScoutDemand();
	DetermineBuilderClassDemand();	
end

------------------

function CpuBuild_DefaultShipDemandRules_Med()	
	local valueTable = 
	{
		-- min value, max value, time cap
		{120, 		200, 		8*60},
		{160,		250,		15*60},
		{220,		320,		20*60},
		{280,		400,		30*60},
		{320,		500,		45*60},
		{500,		700,		60*60},
		{700,		1200,		10000*60},
	}	
	local minMilitaryValue = CalculateMilitaryValueGoal( valueTable, 0.95 )	
	aitrace("Aim:"..minMilitaryValue.." CurMil:"..s_selfTotalValue.." Enm:"..s_enemyTotalValue )	
	if (s_selfTotalValue < minMilitaryValue) then
		DetermineClassDemand();
		DetermineCounterDemand();
		DetermineSpecialDemand();
	end	
	DetermineScoutDemand();
	DetermineBuilderClassDemand();	
end

------------------

function CpuBuild_DefaultShipDemandRules_Hard()	
	DetermineClassDemand();
	DetermineCounterDemand();
	DetermineScoutDemand();
	DetermineBuilderClassDemand();
	DetermineSpecialDemand();	
end

---rimuove unit?in stallo di costruzione---------------------------------------

function CpuBuild_RemoveBuildItems()	
	RemoveStalledBuildItems()	
end

---processo di costruzione-----------------------------------------------------

function CpuBuild_Process()	
	ShipDemandClear()	
	CpuBuild_RemoveBuildItems()	
	if (Override_ShipDemand) then		
		Override_ShipDemand()		
	else		
		CpuBuild_DefaultShipDemandRules()	
	end		
	if (sg_resourceDemand > 0 or sg_militaryDemand <= 0) then		
		if (DoResourceBuild()==1) then			
			sg_resourceDemand = 1 - sg_militaryToBuildPerCollector			
			return 1
		end
	end	
	aitrace("sg_militaryDemand: "..sg_militaryDemand)
	if (sg_militaryDemand > 0) then
		aitrace("**DoMilitaryBuild")
		if (DoMilitaryBuild()==1) then			
			if(sg_resourceDemand <= 0) then
				sg_resourceDemand = sg_resourceDemand + 1				
			end
			return 1
		end
	end	
	return 0
end

---costruisce military unit-----------------------------------------------------------

function DoMilitaryBuild()	
	local ssDemand = sg_subSystemDemand + sg_subSystemOverflowDemand + (Rand(300)-1)		--(Rand(3)-1)		
	local shipId = FindHighDemandShip()
	local highestPriority = HighestPriorityShip()	
	--if (UnderAttackThreat() > 0 and shipId > 0 and highestPriority >= 0.5) then		
		--ssDemand = 0
		--aitrace("Subsys demand reduced because we are under attack")
	--end	
	if (sg_shipDemand > ssDemand) then		
		if (shipId > 0) then			
			Build( shipId )			
			sg_subSystemOverflowDemand = sg_subSystemOverflowDemand + 1			
			aitrace("DoMilitaryBuild thinks ship demand is greater than subsystem demand")
			return 1		--is this causing CPU players to stop building subsystems in the later game? NOPE!
		end		
	end	
	if (sg_dosubsystems == 1 and CpuBuildSS_DoBuildSubSystem() == 1) then
		aitrace("CpuBuildSS_DoBuildSubSystem returned 1")
		return 1
	end		
	return 0
end

---scout--------------------------------------------------------------

function DetermineScoutDemand()
	local curGameTime = gameTime()
	if (UnderAttackThreat() < -10 and s_militaryPop > 0 and curGameTime > sg_randScoutStartBuildTime) then			
		local numEnemies = PlayersAlive( player_enemy )
		local shipCount = numQueueOfClass( eScout )			
		local numScoutsDemanded = 1
		if (numEnemies >= 2) then
			numScoutsDemanded = 2
		end
		if (numEnemies > 2 and s_militaryPop > 7) then
			numScoutsDemanded = 2+((s_militaryPop-7)/10)
		end		
		if (shipCount < numScoutsDemanded) then			
			ShipDemandAddByClass( eScout, 3.5 )
			local scoutRand = Rand(100)
			if (scoutRand > 30) then
				ShipDemandAdd( kScout, 1.5 )
			end					
			sg_randScoutStartBuildTime = curGameTime + 50
		end		
	end
end

---determina la costruzione di builder-----------------------------------------------------------------

function DetermineBuilderClassDemand()	
	local numBuilders = numQueueOfClass( eBuilder )
	local numActiveBuilders = numActiveOfClass( s_playerIndex, eBuilder )	
	if (s_race == Race_Hiigaran) then	
		if (numBuilders>=(numActiveBuilders+2)) then
			ShipDemandAddByClass( eBuilder, -10 );
			return
		end	
	else
	  if (numBuilders>=(numActiveBuilders)) then
			ShipDemandAddByClass( eBuilder, -10 );
			return
		end	
	end	
	if (g_LOD == 0 and numBuilders > 5) then
		ShipDemandAddByClass( eBuilder, -10 );
		return
	elseif (g_LOD == 1 and numBuilders > 6) then
		ShipDemandAddByClass( eBuilder, -10 );
		return	
	elseif (g_LOD > 1 and numBuilders > 7) then
		ShipDemandAddByClass( eBuilder, -10 );
		return	
	end		
	if (s_militaryPop < 6 or (UnderAttack() == 1 and UnderAttackThreat() > -37) ) then
		ShipDemandAddByClass( eBuilder, -10 );
		return
	end	
	local numRUs = GetRU()	
	if (GetNumCollecting() < 7 and numRUs < 7500 ) then
		return
	end	
	local numRUToBuildTable = {
		1000,			--0 builders
		2000,			--1
		4000,		 	--2 (normal start)
		8000,			--3
		16000,			--4
		32000,			--5 or more
	}	
	if (numBuilders > 5) then
		numBuilders = 5
	end
	
	local RUsNeededToBuildBuilder = numRUToBuildTable[numBuilders+1]
	if numBuilders > 1 then		
	  RUsNeededToBuildBuilder = numRUToBuildTable[numBuilders-1]	
	end  	
	
	local dif = numRUs - RUsNeededToBuildBuilder	
	if (dif > 0) then		
		local ruPerShip = 2000		
		if (s_militaryStrength > 30) then
			ruPerShip = 1000
		end		
		local bonusDemand = (1+(dif/ruPerShip))
		ShipDemandAddByClass( eBuilder, bonusDemand );				
	end		
	if (dif < -2000) then
		local penaltyDemand = dif/2000
		ShipDemandAddByClass( eBuilder, penaltyDemand );		
	end
--~ 	-- should factor in current number of buildships somehow
--~ 	local threatLevel = UnderAttackThreat()+50
--~ 	-- if we are underattack and threatened - should increase need for military ships
--~ 	-- and decrease need for builder ships
--~ 	if (threatLevel > 0) then
--~ 		local threatPenalty = -threatLevel/25
--~ 		ShipDemandAddByClass( eBuilder,  threatPenalty);
--~ 		--aitrace("Builder:Thrt:"..threatPenalty)
--~ 	end		
	local neededMilitaryValue = 30 + (numBuilders-1)*66	
	local militaryDifDemand = (s_selfTotalValue - neededMilitaryValue)/30
	if (militaryDifDemand < 0) then
	ShipDemandAddByClass( eBuilder, militaryDifDemand );	
	--elseif (threatLevel <= -5 and s_militaryStrength > 100) then
	--	ShipDemandAddByClass( eBuilder, militaryDifDemand/2 );
	end	
	return 0	
end


