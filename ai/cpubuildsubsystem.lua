function CpuBuildSS_Init()
	if (s_race == Race_Hiigaran) then
		CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Hiigaran
	elseif (s_race == Race_Vaygr) then
		CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Vaygr
	elseif (s_race == 3) then
		CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Kadeshi
	elseif (s_race == 4) then		
		CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Raider
	elseif (s_race == 6) then		
		CpuBuildSS_DefaultSubSystemDemandRules = DoSubSystemDemand_Keeper
	end
	sg_lastSpecialSubSysTime = 0
	sg_specialSubSysDelayTime = 100 + Rand(75)	
	sg_retireCountCheck = 0	
	sg_buildBCHyperspace = 1
end
function CpuBuildSS_SpecialSubSystemDemand()	
	local curGameTime = gameTime()
	local timeSinceLastSubSysDemand = curGameTime - sg_lastSpecialSubSysTime	
---difficulty level	
  local dif_lvl = 0
  if g_LOD > 2 then
    dif_lvl = 3
  else
  	dif_lvl = g_LOD
  end
	if (GetRU() > 3000) then		--s_selfTotalValue > 160-dif_lvl*20 and s_militaryStrength > -5 and UnderAttackThreat() < -70+dif_lvl*10 and timeSinceLastSubSysDemand > sg_specialSubSysDelayTime
		--build sensors
		local specialSensors = {{ADVANCEDARRAY,1+dif_lvl*2}, {CLOAKSENSOR,1+dif_lvl*2}, {HYPERSPACESENSOR,1+dif_lvl}}
		for a,b in specialSensors do
			local numberBuilt = NumSubSystems(b[1]) + NumSubSystemsQ(b[1])
			local maxNumber = b[2]
			if numberBuilt < maxNumber then
				local demand = 0.01*31
			  SubSystemDemandAdd(b[1],demand-sqrt(numberBuilt)/10)
			end
		end
		--build special modules
		local productionDemand = SubSystemDemandGet(FIGHTERPRODUCTION) +
					 SubSystemDemandGet(CORVETTEPRODUCTION) +
					 SubSystemDemandGet(FRIGATEPRODUCTION) +
					 SubSystemDemandGet(CAPSHIPPRODUCTION) +					 
					 SubSystemDemandGet(PLATFORMPRODUCTION) +
					 SubSystemDemandGet(RESEARCH) +
					 SubSystemDemandGet(ADVANCEDRESEARCH) +
					 SubSystemDemandGet(ADVANCEDRESEARCH1)	
		aitrace("SS:special demand:"..productionDemand)
		local productionCompleted = NumSubSystems(RESEARCH) + 
					NumSubSystems(DEFENSEFIELDMODULE) + 
					NumSubSystems(FIRECONTROLTOWER) + 
					NumSubSystems(DRIVESYSTEM) + 
					NumSubSystems(ADVCAPSHIPPRODUCTION) + 
					NumSubSystems(PLATFORMPRODUCTION) + 
					NumSubSystems(REPAIRSYSTEM) + 
					NumSubSystems(HARVESTCONTROLMODULE) + 
					NumSubSystems(HYPERSPACE)
		if productionDemand <= 3.0 or productionCompleted >= 10 then
			local specialSubsystems = {{HYPERSPACEINHIBITOR,1+dif_lvl*2}, {HOLESCRUMBLER,1+dif_lvl*2}, {CLOAKGENERATOR,1+dif_lvl*2}, {RESEARCH,1+dif_lvl}, {HYPERSPACE,1+dif_lvl*2}}
			for a,b in specialSubsystems do
				local numberBuilt = NumSubSystems(b[1]) + NumSubSystemsQ(b[1])
				local maxNumber = b[2]
				if numberBuilt < maxNumber then
					local demand = 0.01*31
				  SubSystemDemandAdd(b[1],demand-sqrt(numberBuilt)/10)
				end
			end
			sg_lastSpecialSubSysTime = curGameTime;
		end
	end
end
function CpuBuildSS_RetireVaygrProductionSubSystems()
	local numCarriers = CarrierCount()
	for i=0, (numCarriers-1) do	
		local carrier = CarrierAt( i )		
		local productionId = CarrierProductionSubSystem( carrier )		
		if (productionId ~= 0) then
			local ssdemand = SubSystemDemandGet( productionId )
--~ 			local count = NumSubSystems(productionId) + NumSubSystemsQ( productionId )
--~ 			if (count > 1) then
--~ 				ssdemand = ssdemand - 0.5
--~ 			end			
			if (ssdemand < 0) then
				sg_retireCountCheck = sg_retireCountCheck + 1
				if (sg_retireCountCheck >= 2) then				
					aitrace("VaygrCarrierRetire: Dem:"..ssdemand.." Count:"..sg_retireCountCheck )					
					RetireSubSystem( carrier, productionId )					
					sg_retireCountCheck = 0
					return
				end
			else
				sg_retireCountCheck = 0
			end			
		end	
	end
end
function std_minTuple(a, b, c )
	local minsubs = a
	if (b < minsubs) then
		minsubs = b
	end
	if (c < minsubs) then
		minsubs = c
	end	
	return minsubs
end
function std_maxTuple(a, b, c )
	local maxsubs = a
	if (b > maxsubs) then
		maxsubs = b
	end
	if (c > maxsubs) then
		maxsubs = c
	end	
	return maxsubs
end
function CpuBuildSS_ProcessEachBuildShip()	
	local bcount = BuildShipCount()	
	if (bcount == 0) then
		return 0
	end	
	if (s_totalProdSS == 0) then
		return 0
	end	
	aitrace("NumSS:Fi:"..s_numFiSystems.." Co:"..s_numCoSystems.." Fr:"..s_numFrSystems)	
	local currentFiDemand = SubSystemDemandGet(FIGHTERPRODUCTION)
	local currentCoDemand = SubSystemDemandGet(CORVETTEPRODUCTION)
	local currentFrDemand = SubSystemDemandGet(FRIGATEPRODUCTION)	
	local maxRealDemand  = std_maxTuple(currentFiDemand, currentCoDemand, currentFrDemand )	
	local highestPrioritySSOverall = HighestPrioritySubSystem()			
	aitrace("SS:Fi:"..currentFiDemand.." Co:"..currentCoDemand.." Fr:"..currentFrDemand)		
--~ 	if (highestPrioritySSOverall > maxRealDemand or maxRealDemand < 0) then
--~ 		return 0
--~ 	end	
	local minNumSameSubs = std_minTuple(s_numFiSystems, s_numCoSystems, s_numFrSystems)	
	local fiBuildOffset =  ((s_numFiSystems-minNumSameSubs)/bcount)*3 --was 4
	local coBuildOffset = ((s_numCoSystems-minNumSameSubs)/bcount)*3
	local frBuildOffset =  ((s_numFrSystems-minNumSameSubs)/bcount)*3	
	local bestProdSS = FIGHTERPRODUCTION
	local maxDemand = currentFiDemand - fiBuildOffset	
	aitrace("Maxdemand:"..maxDemand.."MaxReal:"..maxRealDemand)	
	if ((currentCoDemand-coBuildOffset) > maxDemand) then
		maxDemand = currentCoDemand - coBuildOffset
		bestProdSS = CORVETTEPRODUCTION		
	end
	if ((currentFrDemand-frBuildOffset) > maxDemand) then
		maxDemand = currentFrDemand - frBuildOffset
		bestProdSS = FRIGATEPRODUCTION		
	end	
	local economicValue = 0
	local numCollecting = GetNumCollecting();
	local numRU = GetRU()		
	if (UnderAttack()==0 or UnderAttackThreat() < -100) then	
		if ( (numRU > (2500+bcount*1000) and numCollecting > 8) ) then
			economicValue = 2
		elseif ( (numRU > (1000+bcount*500) and numCollecting > 6) ) then
			economicValue = 1
		end		
	end	
	for i=0, (bcount-1) do	
		local buildShipId = BuildShipAt( i )		
		if (sg_buildBCHyperspace == 1 and BuildShipType( buildShipId ) == kBattleCruiser) then
			aitrace("BC:SS")
			if (BuildShipHasSubSystem( buildShipId, HYPERSPACE ) == 0 and
			    (UnderAttackThreat() < -5 or numRU > 1000) and
			    BuildShipCanBuild( buildShipId, HYPERSPACE) == 1) then
					aitrace("Build BC Hyperspace")
					BuildSubSystemOnShip( buildShipId, HYPERSPACE )					
					--return 1
			end
		end		
		if (s_race == Race_Hiigaran) then				
		elseif (s_race == Race_Vaygr) then
			if (BuildShipType( buildShipId ) == kBattleCruiser) then
				aitrace("BC:SS")
				if (BuildShipHasSubSystem( buildShipId, BCIONBEAMTURRET ) == 0 and
				    (UnderAttackThreat() < 20 or numRU > 1000) and
				    BuildShipCanBuild( buildShipId, BCIONBEAMTURRET) == 1) then
						aitrace("Build BC BCIONBEAMTURRET")
						BuildSubSystemOnShip( buildShipId, BCIONBEAMTURRET )
						--return 1
				end
				if (BuildShipHasSubSystem( buildShipId, MISSILEBOXBC ) == 0 and
				    (UnderAttackThreat() < 15 or numRU > 1100) and
				    BuildShipCanBuild( buildShipId, MISSILEBOXBC) == 1) then
						aitrace("Build BC MISSILEBOXBC")
						BuildSubSystemOnShip( buildShipId, MISSILEBOXBC )
						--return 1
				end
				if (BuildShipHasSubSystem( buildShipId, MISSILEBOX1BC ) == 0 and
				    (UnderAttackThreat() < 15 or numRU > 1100) and
				    BuildShipCanBuild( buildShipId, MISSILEBOX1BC) == 1) then
						aitrace("Build BC MISSILEBOX1BC")
						BuildSubSystemOnShip( buildShipId, MISSILEBOX1BC )
						--return 1
				end
				if (BuildShipHasSubSystem( buildShipId, FREAKERL ) == 0 and
				    (UnderAttackThreat() < 16 or numRU > 1150) and
				    BuildShipCanBuild( buildShipId, FREAKERL) == 1) then
						aitrace("Build BC FREAKERL")
						BuildSubSystemOnShip( buildShipId, FREAKERL )
						--return 1
				end
			end 			
		end	
		if (highestPrioritySSOverall <= maxRealDemand and maxRealDemand >= 0) then				
			local hasFi = BuildShipHasSubSystem( buildShipId, FIGHTERPRODUCTION )
			local hasCo = BuildShipHasSubSystem( buildShipId, CORVETTEPRODUCTION )
			local hasFr = BuildShipHasSubSystem( buildShipId, FRIGATEPRODUCTION )
			local sscount = hasFi + hasCo + hasFr			
			local allowBuild = 0
			if (sscount > 0) then					
				if (sscount == 1 and economicValue > 0) then
					allowBuild = 1
					aitrace("Scount"..sscount.." Econ:"..economicValue)
				elseif (sscount == 2 and economicValue > 1) then
					allowBuild = 1
					aitrace("Scount"..sscount.." Econ:"..economicValue)
				else
					local maxDemandOnShip = -1
					if (hasFi == 1 and currentFiDemand > maxDemandOnShip) then
						maxDemandOnShip = currentFiDemand
					end
					if (hasCo == 1 and currentCoDemand > maxDemandOnShip) then
						maxDemandOnShip = currentCoDemand
					end
					if (hasFr == 1 and currentFrDemand > maxDemandOnShip) then
						maxDemandOnShip = currentFrDemand
					end					
					if (maxDemandOnShip < 0) then
						allowBuild = 1
					end					
					aitrace("S"..i.." FiD:"..currentFiDemand.." CoD:"..currentCoDemand.." FrD:"..currentFrDemand)
					aitrace("S"..i.." Max:"..maxDemandOnShip)
				end
			else
				allowBuild = 1
			end			
			if (allowBuild == 1) then				
				if (BuildShipCanBuild( buildShipId, bestProdSS) == 1) then
					aitrace("BuildSS in new func")
					BuildSubSystemOnShip( buildShipId, bestProdSS )
					return 1
				end
			end
		end		
	end	
	SubSystemDemandSet( FIGHTERPRODUCTION, -1)
	SubSystemDemandSet( CORVETTEPRODUCTION, -1)
	SubSystemDemandSet( FRIGATEPRODUCTION, -1)	
	return 0
end
function CpuBuildSS_DoBuildSubSystem()	
	SubSystemDemandClear()	
	if (Override_SubSystemDemand) then
		Override_SubSystemDemand()
	else
		CpuBuildSS_DefaultSubSystemDemandRules()
		aitrace("CpuBuildSS_DefaultSubSystemDemandRules is running")
	end		
	local subSystemId = FindHighDemandSubSystem()		
	sg_subSystemOverflowDemand = 0	
	if (s_race == Race_Vaygr) then
		CpuBuildSS_RetireVaygrProductionSubSystems()
	end	
	if (subSystemId > 0) then		
	  if (CpuBuildSS_ProcessEachBuildShip() == 1) then
	    --return 1
	  end			
		subSystemId = FindHighDemandSubSystem()	
		if (subSystemId > 0) then			
			BuildSubSystem( subSystemId )
		end		
		return 1
	end
	return 0	
end
function CpuBuildSS_DoSubSystemProductionDemand( ProductionSubSys, eClasstype, familyid )
	local demand = ShipDemandMaxByClass( eClasstype )	
	local uc = GetUnitCapForFamily(familyid)
	local ucMax = GetUnitCapMaxForFamily(familyid)	
	local ucLeft = ucMax - uc	
	if (ucLeft < 2) then
		demand = demand - 3 + ucLeft
	end		
	if (demand < 0) then
		demand = -0.5
	end	
	SubSystemDemandSet(ProductionSubSys, demand )
end
function CpuBuildSS_OtherMiscSubSystemDemand()	
  local GameTime = gameTime()
	local demand = ShipDemandMaxByClass( eBuilder )
	local capdemand = ShipDemandMaxByClass( eCapital )	
	if (capdemand > demand) then
		demand = capdemand
	end	
	
	if (demand > 0.6) then
		SubSystemDemandSet(CAPSHIPPRODUCTION, demand-0.5 )		
	end		
	
	local numMS = numQueueOfClass( eMotherShip )
	local numBuilder = numQueueOfClass( eBuilder )
	if (s_militaryPop < 20 or g_LOD < 1 or GetRU() > 4000) and (NumSubSystems(PLATFORMPRODUCTION) < 1) and (numMS > 0 or numBuilder > 3) then
		local platformsubsCount = NumSubSystems(PLATFORMPRODUCTION) + NumSubSystemsQ(PLATFORMPRODUCTION)
		demand = ShipDemandMaxByClass( ePlatform )
		if (demand > 0.4) then
			SubSystemDemandSet(PLATFORMPRODUCTION, demand - (platformsubsCount*3) )
		end
	else
		SubSystemDemandSet(PLATFORMPRODUCTION, -10 )
	end   
	     
	local harvestsubsCount = NumSubSystems(HARVESTCONTROLMODULE) + NumSubSystemsQ(HARVESTCONTROLMODULE)		
	if harvestsubsCount == 0 then
		SubSystemDemandSet(HARVESTCONTROLMODULE, 0.5)
	elseif harvestsubsCount >= 1 then
	  SubSystemDemandSet(HARVESTCONTROLMODULE, 0.5 - harvestsubsCount)		
	end	
	
	local fusionsubsCount = NumSubSystems(FUSION) + NumSubSystemsQ(FUSION)		
	if fusionsubsCount >= 2 then
	  SubSystemDemandSet(FUSION, -10)
	else	
		SubSystemDemandSet(FUSION, 0.5)
	end	
	
	local hyperspacesubsCount = NumSubSystems(HYPERSPACE) + NumSubSystemsQ(HYPERSPACE)		
	if GetRU() > 1000 and s_militaryPop > 3 and hyperspacesubsCount == 0 then
		SubSystemDemandSet(HYPERSPACE, 0.65)
	elseif GetRU() > 1000 and s_militaryPop > 3 and hyperspacesubsCount >= 1 then
	  SubSystemDemandSet(HYPERSPACE, 0.6 - (hyperspacesubsCount/13))	
	end		
	
--	if NumSquadrons( VGR_CONTAINER ) > 1 or NumSquadrons( HGN_CONTAINER ) > 1 then
--		SubSystemDemandSet(ENGINE_BOOST_CONTAINER, 199)
--	end

	local drivesubsCount = NumSubSystems(DRIVESYSTEM) + NumSubSystemsQ(DRIVESYSTEM)		
	if GetRU() > 1200 and s_militaryPop > 4 and drivesubsCount == 0 then
		SubSystemDemandSet(DRIVESYSTEM, 0.35)
	elseif GetRU() > 1200 and s_militaryPop > 4 and drivesubsCount >= 1 then
	  SubSystemDemandSet(DRIVESYSTEM, 0.35 - (drivesubsCount/2))	
	end		
	if (s_race == Race_Hiigaran) then	
		local numCarriers = NumSquadrons( HGN_LIGHTCARRIER ) + NumSquadrons( HGN_CARRIER ) + NumSquadrons( HGN_BATTLECARRIER )
		if numCarriers == 0 and GameTime < 2300 then
			SubSystemDemandSet(DRIVESYSTEM, -10)
		end	
	end	
	
	local defensecontrolsubsCount = NumSubSystems(DEFENSEFIELDMODULE) + NumSubSystemsQ(DEFENSEFIELDMODULE)				
	if GetRU() > 1400 and s_militaryPop > 6 and defensecontrolsubsCount == 0 then
		SubSystemDemandSet(DEFENSEFIELDMODULE, 0.6)
	elseif GetRU() > 1400 and s_militaryPop > 6 and defensecontrolsubsCount >= 1 then
	  SubSystemDemandSet(DEFENSEFIELDMODULE, 0.55 - (defensecontrolsubsCount/3))	
	end		
	
	local firecontrolsubsCount = NumSubSystems(FIRECONTROLTOWER) + NumSubSystemsQ(FIRECONTROLTOWER)	
	if s_totalProdSS > 1  and GetRU() > 1500 and s_militaryPop > 7 and firecontrolsubsCount == 0 and NumSubSystems(HYPERSPACE) >= 1 then
		SubSystemDemandSet(FIRECONTROLTOWER, 0.55)
	elseif s_totalProdSS > 1  and GetRU() > 1500 and s_militaryPop > 7 and firecontrolsubsCount >= 1 and NumSubSystems(HYPERSPACE) >= 1 then
	  SubSystemDemandSet(FIRECONTROLTOWER, 0.5 - (firecontrolsubsCount/3))		
	end	

	if (s_race == Race_Vaygr) then
		local hyperspacesubsCount = NumSubSystems(HYPERSPACE) + NumSubSystemsQ(HYPERSPACE)	
		local researchsubsCount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)	
		if NumSquadrons( VGR_MOTHERSHIP ) < 1 then
			SubSystemDemandSet(HYPERSPACE, 1.1 - hyperspacesubsCount/10)
			SubSystemDemandSet(RESEARCH, 1.1 - researchsubsCount/10)
		else
			local MSsubsCount = NumSubSystems(FIRECONTROLTOWER) + NumSubSystems(DEFENSEFIELDMODULE)
			if MSsubsCount < 1 then
				SubSystemDemandSet(DEFENSEFIELDMODULE, 0.99)
				SubSystemDemandSet(FIRECONTROLTOWER, 0.99)
			end
		end
	end

	local buildsubsCount = NumSubSystems(BUILD) + NumSubSystemsQ(BUILD)	
	if s_totalProdSS > 1 and GetRU() > 2200 and buildsubsCount == 0 and NumSubSystems(HYPERSPACE) >= 1 then
		SubSystemDemandSet(BUILD, 0.3)
	elseif s_totalProdSS > 1 and GetRU() > 2200 and buildsubsCount >= 1 and NumSubSystems(HYPERSPACE) >= 1 then
	  SubSystemDemandSet(BUILD, 0.3 - (buildsubsCount/3))		
	end	
	
	local repairsubsCount = NumSubSystems(REPAIRSYSTEM) + NumSubSystemsQ(REPAIRSYSTEM)		
	if s_totalProdSS > 2 and GetRU() > 1800 and repairsubsCount == 0 and NumSubSystems(HYPERSPACE) >= 1 then
		SubSystemDemandSet(REPAIRSYSTEM, 0.4)
	elseif s_totalProdSS > 2 and GetRU() > 1800 and repairsubsCount >= 1 and NumSubSystems(HYPERSPACE) >= 1 then
	  SubSystemDemandSet(REPAIRSYSTEM, 0.4 - (repairsubsCount/2))
	end	
		
	if (s_race == Race_Hiigaran) then	
---Mothership	
	  if s_totalProdSS > 0 and GetRU() > 1000 and NumSubSystemsQ(RAPIDTURRET1_MS) == 0 then
			SubSystemDemandSet(RAPIDTURRET1_MS, 0.75)
		end	
	  if s_totalProdSS > 0 and GetRU() > 2000 and NumSubSystemsQ(TORPEDOLAUNCHER1) == 0 then
			SubSystemDemandSet(TORPEDOLAUNCHER1, 0.8)
		end	
		if s_totalProdSS > 0 and GetRU() > 3000 and NumSubSystemsQ(DEFENSEFIELD) == 0 then
			SubSystemDemandSet(DEFENSEFIELD, 0.63)
		end
		--if s_totalProdSS > 0 and GetRU() > 3500 and NumSubSystemsQ(PERMANENTSHIELD) == 0 then
			--SubSystemDemandSet(PERMANENTSHIELD, 0.3)
		--end
		if s_totalProdSS > 0 and GetRU() > 3750 and NumSubSystemsQ(HEAVYIONCANNON) == 0 then
			SubSystemDemandSet(HEAVYIONCANNON, 0.25)
		end	
---Command Fortress	
    if s_totalProdSS > 0 and GetRU() > 1500 and NumSubSystemsQ(RAPIDTURRET1_CF) == 0 then
			SubSystemDemandSet(RAPIDTURRET1_CF, 0.44)
		end					
    if s_totalProdSS > 0 and GetRU() > 2000 and NumSubSystemsQ(TORPEDOLAUNCHER1_CF) == 0 then
			SubSystemDemandSet(TORPEDOLAUNCHER1_CF, 0.46)
		end			
		if s_totalProdSS > 0 and GetRU() > 2500 and NumSubSystemsQ(HKC1_CF) == 0 then
			SubSystemDemandSet(HKC1_CF, 0.45)
		end			
		if s_totalProdSS > 0 and GetRU() > 3000 and NumSubSystemsQ(CFIONCANNON1) == 0 then
			SubSystemDemandSet(CFIONCANNON1, 0.43)
		end			
		if s_totalProdSS > 0 and GetRU() > 4000 and NumSubSystemsQ(CFMINESOWER1) == 0 then
			SubSystemDemandSet(CFMINESOWER1, 0.42)
		end			
		if s_totalProdSS > 0 and GetRU() > 2000 and NumSubSystemsQ(CFREPAIRSYSTEM) == 0 then
			SubSystemDemandSet(CFREPAIRSYSTEM, 0.75)
		end
		--if s_totalProdSS > 0 and GetRU() > 3500 and NumSubSystemsQ(PERMANENTSHIELDCF) == 0 then
			--SubSystemDemandSet(PERMANENTSHIELDCF, 0.3)
		--end
		if s_totalProdSS > 0 and GetRU() > 4000 and NumSubSystemsQ(CFNUCLEARBOMBLAUNCHER) == 0 then
			SubSystemDemandSet(CFNUCLEARBOMBLAUNCHER, 0.36)
		end		
		if s_totalProdSS > 0 and GetRU() > 4000 and NumSubSystemsQ(CFNUCLEARBOMBLAUNCHER1) == 0 then
			SubSystemDemandSet(CFNUCLEARBOMBLAUNCHER1, 0.36)
		end			
		if s_totalProdSS > 0 and GetRU() > 4000 and NumSubSystemsQ(CFNUCLEARBOMBLAUNCHER2) == 0 then
			SubSystemDemandSet(CFNUCLEARBOMBLAUNCHER2, 0.36)
		end											
	elseif (s_race == Race_Vaygr) then
	  if s_totalProdSS > 0 and GetRU() > 1500 and NumSubSystemsQ(DOUBLEKINETICCANNONF) == 0 then
			SubSystemDemandSet(DOUBLEKINETICCANNONF, 0.51)
		end
		if s_totalProdSS > 0 and GetRU() > 2000 and NumSubSystemsQ(VGRMSARMOR) == 0 then
			SubSystemDemandSet(VGRMSARMOR, 0.81)
		end
	  if s_totalProdSS > 0 and GetRU() > 2500 and NumSubSystemsQ(HEAVYFUSIONMISSILELAUNCHERMS1) == 0 then
			SubSystemDemandSet(HEAVYFUSIONMISSILELAUNCHERMS1, 0.81)
		end
		if s_totalProdSS > 0 and GetRU() > 4000 and NumSubSystemsQ(PC) == 0 then
			SubSystemDemandSet(PC, 0.61)
		end	
---Command Fortress
    if s_totalProdSS > 0 and GetRU() > 2000 and NumSubSystemsQ(DOUBLEKINETICCANNON_CF) == 0 then
			SubSystemDemandSet(DOUBLEKINETICCANNON_CF, 0.65)
		end			
		if s_totalProdSS > 0 and GetRU() > 2250 and NumSubSystemsQ(IONCANNON1_CF) == 0 then
			SubSystemDemandSet(IONCANNON1_CF, 0.64)
		end		
		if s_totalProdSS > 0 and GetRU() > 2500 and NumSubSystemsQ(MISSILEBOX) == 0 then
			SubSystemDemandSet(MISSILEBOX, 0.63)
		end			
		if s_totalProdSS > 0 and GetRU() > 2750 and NumSubSystemsQ(FREAKER) == 0 then
			SubSystemDemandSet(FREAKER, 0.62)
		end				
		if s_totalProdSS > 0 and GetRU() > 2500 and NumSubSystemsQ(CFREPAIRSYSTEM) == 0 then
			SubSystemDemandSet(CFREPAIRSYSTEM, 0.66)
		end					
	
	elseif (s_race == 3) then
		if GetRU() > 1500 then
			SubSystemDemandSet(HYPERSPACEINHIBITOR, 0.66)
			SubSystemDemandSet(FIRECONTROLTOWER, 0.66)
		end
	
	elseif (s_race == 4) then
		
	end	
	local numShipyards = NumSquadrons(kShipYard)	
	if ( numShipyards == 0 ) then
		local SY_demand = ShipDemandGet(kShipYard)		
		if (SY_demand > 0 and NumSubSystemsQ(HYPERSPACE) == 0) then
			local hypDemand = SY_demand - NumSubSystems(HYPERSPACE)/10
			SubSystemDemandAdd(HYPERSPACE, hypDemand )
		end
	end		
end
function DoSubSystemDemand_Hiigaran()	
	CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )		
	local rank = (NumSubSystems(ISLIEUTENANTCORE) + NumSubSystems(ISCOMMANDERCORE) + NumSubSystems(ISCAPTAINCORE) + NumSubSystems(ISCOMMODORECORE) + NumSubSystems(ISADMIRALCORE) + NumSubSystems(ISFLEETADMIRALCORE))
	local numRUs = GetRU() 

---Tactical Reinforcements-----------------------------------------------------------------------------------------------
	local FIGHTER_DEMAND = ShipDemandGet(kInterceptor) + ShipDemandGet(kBomber)
	local CORVETTE_DEMAND = ShipDemandGet(HGN_ASSAULTCORVETTE) + ShipDemandGet(HGN_PULSARCORVETTE)
	local FRIGATE_DEMAND = ShipDemandGet(HGN_ASSAULTFRIGATE) + ShipDemandGet(HGN_IONCANNONFRIGATE) + ShipDemandGet(HGN_TORPEDOFRIGATE)
	local CAPITAL_DEMAND = ShipDemandGet(HGN_DESTROYER) + ShipDemandGet(HGN_SWEEPERDESTROYER)
	local PLATFORM_DEMAND = ShipDemandGet(HGN_GUNTURRET) + ShipDemandGet(HGN_PULSARTURRET) + ShipDemandGet(HGN_IONTURRET)
	local UTILITY_DEMAND = ShipDemandGet(kCollector) + ShipDemandGet(kRefinery)
	local group_factor_1 = 1
	local group_factor_2 = 1
	local group_factor_3 = 1
	local elite_factor = 1
	local bias = -0.5
	if GetNumCollecting() > 20 or numRUs > 10000 then
		UTILITY_DEMAND = 0
	end
	if rank < 4 then
		FIGHTER_DEMAND = 0
	end
	if rank < 5 then
		CORVETTE_DEMAND = 0
		UTILITY_DEMAND = 0
		FRIGATE_DEMAND = 0
		PLATFORM_DEMAND = 0
	end
	if rank < 6 then
		CAPITAL_DEMAND = 0
	end
	if s_militaryPop > 75 then
		group_factor_1 = 0
	end
	if s_militaryPop > 50 then
		group_factor_2 = 0
	end
	if s_militaryPop > 25 then
		group_factor_3 = 0
	end
	if g_LOD <= 2 then
		elite_factor = 0
	end
	if g_LOD <= 1 then
		group_factor_3 = 0
	end
	if UnderAttackThreat() < -70 then
		FIGHTER_DEMAND = 0
	end
	if UnderAttackThreat() < -60 then
		CORVETTE_DEMAND = 0
	end
	if UnderAttackThreat() < -40 then
		PLATFORM_DEMAND = 0
		FRIGATE_DEMAND = 0
	end
	if UnderAttackThreat() < -20 then
		CAPITAL_DEMAND = 0
	end
	if UnderAttackThreat() > 0 then
		UTILITY_DEMAND = 0
	end
	if UnderAttackThreat() > 100 then
		FIGHTER_DEMAND = 0
		CORVETTE_DEMAND = 0
	end
	if UnderAttackThreat() > 200 then
		PLATFORM_DEMAND = 0
		FRIGATE_DEMAND = 0
	end
	if UnderAttackThreat() > 500 then
		CAPITAL_DEMAND = 0
	end
	if numRUs < 1000 then
		FIGHTER_DEMAND = 0
	end
	if numRUs < 2000 then
		CORVETTE_DEMAND = 0
	end
	if numRUs < 3000 then
		PLATFORM_DEMAND = 0
		FRIGATE_DEMAND = 0
	end
	if numRUs < 4000 then
		elite_factor = 0
	end
	if numRUs < 5000 then
		CAPITAL_DEMAND = 0
	end
	SubSystemDemandSet(TACTICAL_FIGHTER_1, bias+group_factor_1*FIGHTER_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_2, bias+group_factor_2*FIGHTER_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_3, bias+group_factor_3*FIGHTER_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_1E, bias+elite_factor*group_factor_1*FIGHTER_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_2E, bias+elite_factor*group_factor_2*FIGHTER_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_3E, bias+elite_factor*group_factor_3*FIGHTER_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_CORVETTE_1, bias+group_factor_1*CORVETTE_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_2, bias+group_factor_2*CORVETTE_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_3, bias+group_factor_3*CORVETTE_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_1E, bias+elite_factor*group_factor_1*CORVETTE_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_2E, bias+elite_factor*group_factor_2*CORVETTE_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_3E, bias+elite_factor*group_factor_3*CORVETTE_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_FRIGATE_1, bias+group_factor_1*FRIGATE_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_2, bias+group_factor_2*FRIGATE_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_3, bias+group_factor_3*FRIGATE_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_1E, bias+elite_factor*group_factor_1*FRIGATE_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_2E, bias+elite_factor*group_factor_2*FRIGATE_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_3E, bias+elite_factor*group_factor_3*FRIGATE_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_CAPITAL_1, bias+group_factor_1*CAPITAL_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_2, bias+group_factor_2*CAPITAL_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_3, bias+group_factor_3*CAPITAL_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_1E, bias+elite_factor*group_factor_1*CAPITAL_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_2E, bias+elite_factor*group_factor_2*CAPITAL_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_3E, bias+elite_factor*group_factor_3*CAPITAL_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_PLATFORM_1, bias+group_factor_1*PLATFORM_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_2, bias+group_factor_2*PLATFORM_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_3, bias+group_factor_3*PLATFORM_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_1E, bias+elite_factor*group_factor_1*PLATFORM_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_2E, bias+elite_factor*group_factor_2*PLATFORM_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_3E, bias+elite_factor*group_factor_3*PLATFORM_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_UTILITY_1, bias+group_factor_1*UTILITY_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_UTILITY_2, bias+group_factor_2*UTILITY_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_UTILITY_3, bias+group_factor_3*UTILITY_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_UTILITY_1E, bias+group_factor_1*UTILITY_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_UTILITY_2E, bias+group_factor_2*UTILITY_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_UTILITY_3E, bias+group_factor_3*UTILITY_DEMAND/2.6555 )

---Scavenger----------------------------------------------------------------------------------------------------	
  
  if NumSquadrons( HGN_SCAVER ) >= 1 then
		if rank >= 1 then
		  if numRUs > 4000 then
		    SubSystemDemandSet(SUPPLY1, 1.133 )
		  end
		  if numRUs > 7000 then
		    SubSystemDemandSet(SUPPLY2, 0.933 )
		  end
		  if numRUs > 10000 then
		    SubSystemDemandSet(SUPPLY3, 0.733 )
		  end
		  if numRUs > 13000 then
		    SubSystemDemandSet(SUPPLY4, 0.533 )
		  end
		  if numRUs > 16000 then
		    SubSystemDemandSet(SUPPLY5, 0.333 )
		  end	  
		end
	end	
	if NumSquadrons( HGN_MOTHERSHIP ) >= 1 then
		if rank >= 1 then
		  if numRUs > 4000 then
		    SubSystemDemandSet(SUPPLYMS, 1.234 )
		    SubSystemDemandSet(SUPPLYMS1, 1.234 )
		  end		  
		end		
		if numRUs > 2000 then
	    SubSystemDemandSet(HGN_POWER_MS, 1.334 )
	    SubSystemDemandSet(HGN_POWER_MS1, 1.334 )
	  end		
	end		
	if (NumSquadrons( HGN_CARRIER ) + NumSquadrons( HGN_BATTLECARRIER )) >= 1 then
		if rank >= 1 then
		  if numRUs > 4000 then
		    SubSystemDemandSet(SUPPLY, 1.134 )
		  end		  
		end	
	end	
	if NumSquadrons( HGN_SHIPYARD ) >= 1 then
		if rank >= 1 then
		  if numRUs > 4000 then
		    SubSystemDemandSet(SUPPLYMS, 1.235 )
		    SubSystemDemandSet(SUPPLYMS1, 1.235 )
		  end		  
		end	
		if numRUs > 2000 then
	    SubSystemDemandSet(HGN_POWER_MS, 1.335 )
	  end		
	end	

---Crew station-----------------------------------------------------------------------------------------------	
  if NumSquadrons( HGN_CREWSTATION ) >= 1 then    
	     
    if NumSubSystems(ISLIEUTENANTCORE) == 0 and NumSubSystemsQ(ISLIEUTENANTCORE) == 0 and numRUs > 500 then
	    SubSystemDemandSet(ISLIEUTENANTCORE, 3.02 + numRUs/100 )
	  elseif NumSubSystems(ISCOMMANDERCORE) == 0 and NumSubSystemsQ(ISCOMMANDERCORE) == 0 and numRUs > 600 then
	    SubSystemDemandSet(ISCOMMANDERCORE, 2.92 + numRUs/100 )  
	  elseif NumSubSystems(ISCAPTAINCORE) == 0 and NumSubSystemsQ(ISCAPTAINCORE) == 0 and numRUs > 700 then
	    SubSystemDemandSet(ISCAPTAINCORE, 2.82 + numRUs/100 )
	  elseif NumSubSystems(ISCOMMODORECORE) == 0 and NumSubSystemsQ(ISCOMMODORECORE) == 0 and numRUs > 800 then
	    SubSystemDemandSet(ISCOMMODORECORE, 2.72 + numRUs/100 )	  
	  elseif NumSubSystems(ISADMIRALCORE) == 0 and NumSubSystemsQ(ISADMIRALCORE) == 0 and numRUs > 900 then
	    SubSystemDemandSet(ISADMIRALCORE, 2.62 + numRUs/100 )   
	  elseif NumSubSystems(ISFLEETADMIRALCORE) == 0 and NumSubSystemsQ(ISFLEETADMIRALCORE) == 0 and numRUs > 1000 then
	    SubSystemDemandSet(ISFLEETADMIRALCORE, 2.52 + numRUs/100 )    
	  end  
	    
		if rank >= 1 then
		  if NumSubSystems(PILOTMODULE) == 0 and NumSubSystemsQ(PILOTMODULE) == 0 and numRUs > 500 then
		    SubSystemDemandSet(PILOTMODULE, 1.806 + numRUs/100 )
		  end  
		end 			 
		if rank >= 2 then
		  if NumSubSystems(PILOTMODULE1) == 0 and NumSubSystemsQ(PILOTMODULE1) == 0 and numRUs > 600 then
		    SubSystemDemandSet(PILOTMODULE1, 1.756 + numRUs/100 )
		  end  
		  if NumSubSystems(OFFICERMODULE) == 0 and NumSubSystemsQ(OFFICERMODULE) == 0 and numRUs > 1200 then
		    SubSystemDemandSet(OFFICERMODULE, 1.807 + numRUs/100 )
		  end  
		end 		
		if rank >= 3 then
		  if NumSubSystems(PILOTMODULE2) == 0 and NumSubSystemsQ(PILOTMODULE2) == 0 and numRUs > 700 then
		    SubSystemDemandSet(PILOTMODULE2, 1.706 + numRUs/100 )
		  end  
		  if NumSubSystems(OFFICERMODULE1) == 0 and NumSubSystemsQ(OFFICERMODULE1) == 0 and numRUs > 1400 then
		    SubSystemDemandSet(OFFICERMODULE1, 1.707 + numRUs/100 )
		  end  
		end  		
		if rank >= 4 then
		  if NumSubSystems(PILOTMODULE3) == 0 and NumSubSystemsQ(PILOTMODULE3) == 0 and numRUs > 800 then
		    SubSystemDemandSet(PILOTMODULE3, 1.606 + numRUs/100 )
		  end  
		  if NumSubSystems(OFFICERMODULE2) == 0 and NumSubSystemsQ(OFFICERMODULE2) == 0 and numRUs > 1600 then
		    SubSystemDemandSet(OFFICERMODULE2, 1.607 + numRUs/100 )
		  end  
		end  		
		if rank >= 5 then
		  if NumSubSystems(PILOTMODULE4) == 0 and NumSubSystemsQ(PILOTMODULE4) == 0 and numRUs > 900 then
		    SubSystemDemandSet(PILOTMODULE4, 1.506 + numRUs/100 )
		  end  
		  if NumSubSystems(OFFICERMODULE3) == 0 and NumSubSystemsQ(OFFICERMODULE3) == 0 and numRUs > 1800 then
		    SubSystemDemandSet(OFFICERMODULE3, 1.507 + numRUs/100 )
		  end  
		end  	
		if rank >= 6 then
		  if NumSubSystems(PILOTMODULE5) == 0 and NumSubSystemsQ(PILOTMODULE5) == 0 and numRUs > 1000 then
		    SubSystemDemandSet(PILOTMODULE5, 1.406 + numRUs/100 )
		  end  
		  if NumSubSystems(OFFICERMODULE4) == 0 and NumSubSystemsQ(OFFICERMODULE4) == 0 and numRUs > 2000 then
		    SubSystemDemandSet(OFFICERMODULE4, 1.407 + numRUs/100 )
		  end  
		end  
	end	
	
---Power station-----------------------------------------------------------------------------------------------	
  if NumSquadrons( HGN_POWER ) >= 1 then    
	     
    if NumSubSystems(HGN_POWER_M1) == 0 and NumSubSystemsQ(HGN_POWER_M1) == 0 and numRUs > 500 then
	    SubSystemDemandSet(HGN_POWER_M1, 2.07 )
	  elseif NumSubSystems(HGN_POWER_M2) == 0 and NumSubSystemsQ(HGN_POWER_M2) == 0 and numRUs > 1000 then
	    SubSystemDemandSet(HGN_POWER_M2, 1.97 ) 
	  elseif NumSubSystems(HGN_POWER_M3) == 0 and NumSubSystemsQ(HGN_POWER_M3) == 0 and numRUs > 1500 then
	    SubSystemDemandSet(HGN_POWER_M3, 1.87 ) 
	  elseif NumSubSystems(HGN_POWER_M4) == 0 and NumSubSystemsQ(HGN_POWER_M4) == 0 and numRUs > 2000 then
	    SubSystemDemandSet(HGN_POWER_M4, 1.77 ) 
	  elseif NumSubSystems(HGN_POWER_M5) == 0 and NumSubSystemsQ(HGN_POWER_M5) == 0 and numRUs > 2500 then
	    SubSystemDemandSet(HGN_POWER_M5, 1.67 ) 
	  elseif NumSubSystems(HGN_POWER_M6) == 0 and NumSubSystemsQ(HGN_POWER_M6) == 0 and numRUs > 3000 then
	    SubSystemDemandSet(HGN_POWER_M6, 1.57 ) 
	  elseif NumSubSystems(HGN_POWER_M7) == 0 and NumSubSystemsQ(HGN_POWER_M7) == 0 and numRUs > 3500 then
	    SubSystemDemandSet(HGN_POWER_M7, 1.47 ) 
	  elseif NumSubSystems(HGN_POWER_M8) == 0 and NumSubSystemsQ(HGN_POWER_M8) == 0 and numRUs > 4000 then
	    SubSystemDemandSet(HGN_POWER_M8, 1.37 ) 
	  elseif NumSubSystems(HGN_POWER_M9) == 0 and NumSubSystemsQ(HGN_POWER_M9) == 0 and numRUs > 4500 then
	    SubSystemDemandSet(HGN_POWER_M9, 1.27 ) 
	  elseif NumSubSystems(HGN_POWER_M0) == 0 and NumSubSystemsQ(HGN_POWER_M0) == 0 and numRUs > 5000 then
	    SubSystemDemandSet(HGN_POWER_M0, 1.17 ) 	                   
	  end   
	  
	  if NumSubSystems(DEFENSEFIELDPS) < 3 and NumSubSystemsQ(DEFENSEFIELDPS) < 3 and numRUs > 500 then
	    SubSystemDemandSet(DEFENSEFIELDPS, 1.707 )   
		end
		
		if NumSubSystems(FAILSAFEPS) < 1 and NumSubSystemsQ(FAILSAFEPS) < 1 and numRUs > 5000 then
	    SubSystemDemandSet(FAILSAFEPS, 1.107 )   
		end
		
	end		

---OS-------------------------------------------------------------------------------------------------------	
	if NumSquadrons(HGN_BATTLESTATION) >= 1 then
	  if numRUs > 6000 then	    
	    SubSystemDemandSet(CIVILMODULE1, 3.305 )
	    SubSystemDemandSet(CIVILMODULE2, 3.205 )
	    SubSystemDemandSet(CIVILMODULE3, 3.105 )
	    SubSystemDemandSet(CIVILMODULE4, 3.005 )
	    SubSystemDemandSet(CIVILMODULE5, 2.905 )
	    SubSystemDemandSet(CIVILMODULE6, 2.805 )	       
	  end	   
	end

---DESTROYERS-------------------------------------------------------------------------------------------------
	numDestroyers = NumSquadrons(HGN_DESTROYER)+NumSquadrons(HGN_SWEEPERDESTROYER)+NumSquadrons(HGN_MISSILEDESTROYER) + NumSquadrons(HGN_IONDESTROYER)+NumSquadrons(HGN_ADVDESTROYER)+NumSquadrons(HGN_ARTILLERYDESTROYER)
	if numDestroyers >= 1 then
		SubSystemDemandSet(HGN_DESORDERS_HIACCURACY, 0.599 )
		SubSystemDemandSet(HGN_DESORDERS_HIFIRE, 0.598 )
		SubSystemDemandSet(HGN_DESORDERS_HIHEALTH, 0.597 )
		SubSystemDemandSet(HGN_DESORDERS_HIREPAIR, 0.596 )
		SubSystemDemandSet(HGN_DESORDERS_HISECURITY, 0.595 )
		SubSystemDemandSet(HGN_DESORDERS_HISENSOR, 0.594 )
		SubSystemDemandSet(HGN_DESORDERS_HISPEED, 0.593 )
		SubSystemDemandSet(HGN_DESORDERS_LOACCURACY, 0.589 )
		SubSystemDemandSet(HGN_DESORDERS_LOFIRE, 0.588 )
		SubSystemDemandSet(HGN_DESORDERS_LOHEALTH, 0.587 )
		SubSystemDemandSet(HGN_DESORDERS_LOREPAIR, 0.586 )
		SubSystemDemandSet(HGN_DESORDERS_LOSECURITY, 0.585 )
		SubSystemDemandSet(HGN_DESORDERS_LOSENSOR, 0.584 )
		SubSystemDemandSet(HGN_DESORDERS_LOSPEED, 0.583 )
	end

---WAR MACHINES-------------------------------------------------------------------------------------------------
  SubSystemDemandSet(RAPIDTURRET1, 1.921 )
	SubSystemDemandSet(RAPIDTURRET2, 1.821 )
	SubSystemDemandSet(RAPIDTURRET3, 1.721 )
	--SubSystemDemandSet(RAPIDTURRET4, 1 )
	SubSystemDemandSet(DOUBLERAPIDTURRET1, 1.923 )
	SubSystemDemandSet(DOUBLERAPIDTURRET2, 1.823 )
	SubSystemDemandSet(DOUBLERAPIDTURRET3, 1.723 )
	SubSystemDemandSet(TRIPLERAPIDTURRET1, 1.926 )
	SubSystemDemandSet(TRIPLERAPIDTURRET2, 1.825 )
	SubSystemDemandSet(TRIPLERAPIDTURRET3, 1.724 )

	
	numWarMachine = NumSquadrons(HGN_BATTLECRUISER)+NumSquadrons(HGN_BATTLECRUISERNUKE)+NumSquadrons(HGN_BATTLESHIP)+NumSquadrons(HGN_VORTEX)
	if numWarMachine >= 1 then
		if numRUs > 500 then      	
      SubSystemDemandSet(VKINETIKCANNON, 1.919*numWarMachine )
	    SubSystemDemandSet(HGN_VHCANNONX3, 1.819*numWarMachine )
	    SubSystemDemandSet(HGN_VHCANNONX6, 1.719*numWarMachine )		
      SubSystemDemandSet(RAPIDTURRET1, 1.619*numWarMachine )
	    SubSystemDemandSet(RAPIDTURRET2, 1.519*numWarMachine )
	    SubSystemDemandSet(RAPIDTURRET3, 1.419*numWarMachine )
	    SubSystemDemandSet(RAPIDTURRET4, 1.319*numWarMachine )
      SubSystemDemandSet(DOUBLERAPIDTURRET1, 1.69*numWarMachine )
	    SubSystemDemandSet(DOUBLERAPIDTURRET2, 1.58*numWarMachine )
	    SubSystemDemandSet(DOUBLERAPIDTURRET3, 1.47*numWarMachine )
	    SubSystemDemandSet(DOUBLERAPIDTURRET4, 1.36*numWarMachine )
	    SubSystemDemandSet(TRIPLERAPIDTURRET1, 1.65*numWarMachine )
	    SubSystemDemandSet(TRIPLERAPIDTURRET2, 1.54*numWarMachine )
	    SubSystemDemandSet(TRIPLERAPIDTURRET3, 1.43*numWarMachine )
	    SubSystemDemandSet(TRIPLERAPIDTURRET4, 1.32*numWarMachine )
	    SubSystemDemandSet(XPULSARS1BC, 2.919*numWarMachine )
	    SubSystemDemandSet(XPULSARS2BC, 2.819*numWarMachine )
	    SubSystemDemandSet(XPULSARS3BC, 2.719*numWarMachine )
	    SubSystemDemandSet(XPULSARS4BC, 2.619*numWarMachine )	     
	  end
		if numRUs > 800 then
	    SubSystemDemandSet(KINETIKCANNON1, 1.97*numWarMachine )
	    SubSystemDemandSet(KINETIKCANNON2, 1.87*numWarMachine )
	    SubSystemDemandSet(KINETIKCANNON3, 1.77*numWarMachine )
			SubSystemDemandSet(HKC3XBC1, 2.97*numWarMachine )
			SubSystemDemandSet(HKC3XBC2, 2.87*numWarMachine )
			SubSystemDemandSet(HKC3XBC3, 2.77*numWarMachine )
			SubSystemDemandSet(HKC1_S1BC, 3.97*numWarMachine )
			SubSystemDemandSet(HKC1_S2BC, 3.87*numWarMachine )
			SubSystemDemandSet(HKC1_S3BC, 3.77*numWarMachine )
			SubSystemDemandSet(VTORPEDOLAUNCHER1, 1.67*numWarMachine )
	    SubSystemDemandSet(VTORPEDOLAUNCHER2, 1.57*numWarMachine )
	    SubSystemDemandSet(VTORPEDOLAUNCHER3, 1.47*numWarMachine )
	    SubSystemDemandSet(VTORPEDOLAUNCHER4, 1.37*numWarMachine )
	  end	 
		if numRUs > 1100 then
	    SubSystemDemandSet(IONCANNON1, 1.99*numWarMachine )
			SubSystemDemandSet(IONCANNON2, 1.89*numWarMachine )
			SubSystemDemandSet(HEAVYIONCANNONS1BC, 2.99*numWarMachine )
			SubSystemDemandSet(HEAVYIONCANNONS2BC, 2.89*numWarMachine )
			SubSystemDemandSet(HEAVYIONCANNONS1BS, 3.99*numWarMachine )
			SubSystemDemandSet(HEAVYIONCANNONS2BS, 3.89*numWarMachine )
			SubSystemDemandSet(BCTUBES, 1.79*numWarMachine )
			SubSystemDemandSet(BCTUBES1, 2.79*numWarMachine )
			SubSystemDemandSet(BCTUBES2, 3.79*numWarMachine )
			SubSystemDemandSet(BCTUBESBS, 1.69*numWarMachine )
			SubSystemDemandSet(BCTUBES1BS, 2.69*numWarMachine )
			SubSystemDemandSet(BCTUBES2BS, 3.69*numWarMachine )
			SubSystemDemandSet(BCTUBESBSREAR, 3.59*numWarMachine )  
			SubSystemDemandSet(MINESOWER1, 1.59*numWarMachine )
	    SubSystemDemandSet(MINESOWER2, 1.49*numWarMachine )	    
	  end	   
		if numRUs > 2000 then
	    SubSystemDemandSet(CS500, 1.97*numWarMachine )
			SubSystemDemandSet(CS400, 1.86*numWarMachine )
			SubSystemDemandSet(CS300, 1.75*numWarMachine )
			SubSystemDemandSet(CS200, 1.64*numWarMachine )
			SubSystemDemandSet(CS100, 1.53*numWarMachine )
	  end
	end		

---Shuttle
	if NumSquadrons(HGN_TANKER) >= 1 or NumSquadrons(HGN_BATTLESHIP) >= 1 then
	  if numRUs > 750 then
	    SubSystemDemandSet(FTAM1, 3.063 )	     
	    SubSystemDemandSet(FTAM2, 2.963 )	
	    SubSystemDemandSet(FTAM3, 2.863 )    	    
	  end	  
	  if numRUs > 1300 then
	    SubSystemDemandSet(HGN_TANKER_TURRET, 3.064 )	     
	    SubSystemDemandSet(HGN_TANKER_TURRET1, 2.964 )	
	    SubSystemDemandSet(HGN_TANKER_TURRET2, 2.864 )    	    
	  end	  
	  if NumSquadrons(HGN_TANKER) >= 1 and numRUs > 1750 then
	    SubSystemDemandSet(SNUCLEARBOMBLAUNCHER, 3.053 )	     
	    SubSystemDemandSet(SNUCLEARBOMBLAUNCHER1, 2.953 )	    
	  end	  
	end

---Ark
	if NumSquadrons(HGN_ARK) >= 1 then
	  if numRUs > 7500 then
	    SubSystemDemandSet(HGN_SCC_6XAC_TURRET_A, 0.669 )	     
	    SubSystemDemandSet(HGN_A_MORTAR, 0.668 )	 
	    SubSystemDemandSet(HGN_A_TORPEDO, 0.667 )	
	  end	  
	  if numRUs > 10000 then
	    SubSystemDemandSet(HGN_A_BALKANCANNON, 3.414 )	     
	    SubSystemDemandSet(HGN_A_BALKANCANNON1, 2.914 )	
	  elseif numRUs > 2000 then
	    SubSystemDemandSet(HGN_A_MINER, 3.413 )	     
	    SubSystemDemandSet(HGN_A_MINER1, 2.913 )	    
	  end	  
	end
	
	---Command Fortress
	if NumSquadrons(HGN_COMMANDFORTRESS) >= 1 then
		if numRUs > 2000 then
	    SubSystemDemandSet(ADVANCEDARRAY, 2.985 )
	    SubSystemDemandSet(CLOAKSENSOR, 2.984 )
	  end
		if numRUs > 20000 then
	    SubSystemDemandSet(HOLESCRUMBLER, 1.985 )
	    SubSystemDemandSet(CLOAKGENERATOR, 1.885 )
	    SubSystemDemandSet(HYPERSPACEINHIBITOR, 1.785 )
	  end
	end

---Ad. Sentinel - Mutant-------------------------------------------------------------------------------------------------------	
	if NumSquadrons(HGN_ARTILLERYSENTINEL) >= 1 then
		if numRUs > 5000 then
			SubSystemDemandSet(HGN_RAILGUN1, 4.424 )
	    SubSystemDemandSet(HGN_RAILGUN2, 3.783 )
	    SubSystemDemandSet(HGN_RAILGUN3, 3.672 )
	    SubSystemDemandSet(HGN_RAILGUN4, 3.921 )
		elseif numRUs > 1300 then
			SubSystemDemandSet(HGN_ARTILLERY_2X_SENTINEL_1, 4.036 )
	    SubSystemDemandSet(HGN_ARTILLERY_2X_SENTINEL_2, 3.736 )
	    SubSystemDemandSet(HGN_ARTILLERY_2X_SENTINEL_3, 3.536 )
	    SubSystemDemandSet(HGN_ARTILLERY_2X_SENTINEL_4, 3.936 )
	  elseif numRUs > 900 then
	    SubSystemDemandSet(CFNUCLEARBOMBLAUNCHERS1LR, 0.639 )
	    SubSystemDemandSet(CFNUCLEARBOMBLAUNCHERS2LR, 0.638 )
	    SubSystemDemandSet(CFNUCLEARBOMBLAUNCHERS3LR, 0.637 )
	    SubSystemDemandSet(CFNUCLEARBOMBLAUNCHERS4LR, 0.636 )
	  elseif numRUs > 600 then
	    SubSystemDemandSet(HKC1_S3LR, 0.635 )
	    SubSystemDemandSet(HKC1_S4LR, 0.634 )	 
	  end	  
	end	
	
	if NumSquadrons(HGN_COMBATBASE) >= 1 then
	  if numRUs > 4500 then
			SubSystemDemandSet(HGN_RAILGUN1, 0.524 )
	    SubSystemDemandSet(HGN_RAILGUN2, 0.517 )
	  elseif numRUs > 2000 then
	  	SubSystemDemandSet(CFNUCLEARBOMBLAUNCHERS1LR, 0.469 )	
	  	SubSystemDemandSet(CFNUCLEARBOMBLAUNCHERS2LR, 0.468 )
	  elseif numRUs > 1250 then
	    SubSystemDemandSet(HGN_ARTILLERY_2X_SENTINEL_1, 0.467 )
	    SubSystemDemandSet(HGN_ARTILLERY_2X_SENTINEL_2, 0.466 )
	  elseif numRUs > 750 then
	    SubSystemDemandSet(HEAVYIONCANNONS1, 0.465 )	
	    SubSystemDemandSet(HEAVYIONCANNONS2, 0.464 )    
	  end	  
	end	
	
---Research--------------------------------------------------------------------------------------------------	
  local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
  if NumSquadrons( HGN_RESEARCHSTATION ) >= 1 then	  
	  local advresearchcount = NumSubSystems(ADVANCEDRESEARCH) + NumSubSystemsQ(ADVANCEDRESEARCH)
		local advresearchcount1 = NumSubSystems(ADVANCEDRESEARCH1) + NumSubSystemsQ(ADVANCEDRESEARCH1)	  
	  if (researchcount==0) then
	    if numRUs > 500 then
	      SubSystemDemandSet(RESEARCH, 1.757 )
	    end
	  else
	    CpuBuildSS_DoSubSystemProductionDemand( CORVETTEPRODUCTION, eCorvette, kUnitCapId_Corvette )		
		  CpuBuildSS_DoSubSystemProductionDemand( FRIGATEPRODUCTION, eFrigate, kUnitCapId_Frigate )		
	    if (advresearchcount==0) then
	      if numRUs > 750 then
	        SubSystemDemandSet(ADVANCEDRESEARCH, 1.507 )
	      end  
	    else
	      if (advresearchcount1==0) then
	        if numRUs > 1000 then
	          SubSystemDemandSet(ADVANCEDRESEARCH1, 1.257 ) 
	        end   
	      end  
	    end  
	  end    
	end    
	
---Other------------------------------------------------------------------------------------------------	
	CpuBuildSS_OtherMiscSubSystemDemand();	
	if (researchcount > 0 and s_totalProdSS > 0 and GetRU() > 800) then		-- and s_militaryPop > 8 and GetNumCollecting() > 8
		CpuBuildSS_SpecialSubSystemDemand()
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function DoSubSystemDemand_Vaygr()	
	local rank = (NumSubSystems(ISLIEUTENANT) + NumSubSystems(ISCOMMANDER) + NumSubSystems(ISCAPTAIN) + NumSubSystems(ISCOMMODORE) + NumSubSystems(ISADMIRAL) + NumSubSystems(ISFLEETADMIRAL))
	CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )		
	local numRUs = GetRU() 

---Tactical Reinforcements-----------------------------------------------------------------------------------------------
	local FIGHTER_DEMAND = ShipDemandGet(kInterceptor) + ShipDemandGet(kBomber)
	local CORVETTE_DEMAND = ShipDemandGet(VGR_MISSILECORVETTE) + ShipDemandGet(VGR_STRIKER)
	local FRIGATE_DEMAND = ShipDemandGet(VGR_ASSAULTFRIGATE) + ShipDemandGet(VGR_HEAVYMISSILEFRIGATE) + ShipDemandGet(VGR_ADVASSAULTFRIGATE)
	local CAPITAL_DEMAND = ShipDemandGet(VGR_DESTROYER) + ShipDemandGet(VGR_ARTILLERYSHIP)
	local PLATFORM_DEMAND = ShipDemandGet(VGR_WEAPONPLATFORM_GUN) + ShipDemandGet(VGR_WEAPONPLATFORM_LANCE) + ShipDemandGet(VGR_WEAPONPLATFORM_MISSILE)
	local UTILITY_DEMAND = ShipDemandGet(kCollector) + ShipDemandGet(kRefinery)
	local group_factor_1 = 1
	local group_factor_2 = 1
	local group_factor_3 = 1
	local elite_factor = 1
	local bias = -0.5
	if GetNumCollecting() > 20 or numRUs > 10000 then
		UTILITY_DEMAND = 0
	end
	if rank < 4 then
		FIGHTER_DEMAND = 0
	end
	if rank < 5 then
		CORVETTE_DEMAND = 0
		UTILITY_DEMAND = 0
		FRIGATE_DEMAND = 0
		PLATFORM_DEMAND = 0
	end
	if rank < 6 then
		CAPITAL_DEMAND = 0
	end
	if s_militaryPop > 75 then
		group_factor_1 = 0
	end
	if s_militaryPop > 50 then
		group_factor_2 = 0
	end
	if s_militaryPop > 25 then
		group_factor_3 = 0
	end
	if g_LOD <= 2 then
		elite_factor = 0
	end
	if g_LOD <= 1 then
		group_factor_3 = 0
	end
	if UnderAttackThreat() < -70 then
		FIGHTER_DEMAND = 0
	end
	if UnderAttackThreat() < -60 then
		CORVETTE_DEMAND = 0
	end
	if UnderAttackThreat() < -40 then
		PLATFORM_DEMAND = 0
		FRIGATE_DEMAND = 0
	end
	if UnderAttackThreat() < -20 then
		CAPITAL_DEMAND = 0
	end
	if UnderAttackThreat() > 0 then
		UTILITY_DEMAND = 0
	end
	if UnderAttackThreat() > 100 then
		FIGHTER_DEMAND = 0
		CORVETTE_DEMAND = 0
	end
	if UnderAttackThreat() > 200 then
		PLATFORM_DEMAND = 0
		FRIGATE_DEMAND = 0
	end
	if UnderAttackThreat() > 500 then
		CAPITAL_DEMAND = 0
	end
	if numRUs < 1000 then
		FIGHTER_DEMAND = 0
	end
	if numRUs < 2000 then
		CORVETTE_DEMAND = 0
	end
	if numRUs < 3000 then
		PLATFORM_DEMAND = 0
		FRIGATE_DEMAND = 0
	end
	if numRUs < 4000 then
		elite_factor = 0
	end
	if numRUs < 5000 then
		CAPITAL_DEMAND = 0
	end
	SubSystemDemandSet(TACTICAL_FIGHTER_1, bias+group_factor_1*FIGHTER_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_2, bias+group_factor_2*FIGHTER_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_3, bias+group_factor_3*FIGHTER_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_1E, bias+elite_factor*group_factor_1*FIGHTER_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_2E, bias+elite_factor*group_factor_2*FIGHTER_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_FIGHTER_3E, bias+elite_factor*group_factor_3*FIGHTER_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_CORVETTE_1, bias+group_factor_1*CORVETTE_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_2, bias+group_factor_2*CORVETTE_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_3, bias+group_factor_3*CORVETTE_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_1E, bias+elite_factor*group_factor_1*CORVETTE_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_2E, bias+elite_factor*group_factor_2*CORVETTE_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_CORVETTE_3E, bias+elite_factor*group_factor_3*CORVETTE_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_FRIGATE_1, bias+group_factor_1*FRIGATE_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_2, bias+group_factor_2*FRIGATE_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_3, bias+group_factor_3*FRIGATE_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_1E, bias+elite_factor*group_factor_1*FRIGATE_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_2E, bias+elite_factor*group_factor_2*FRIGATE_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_FRIGATE_3E, bias+elite_factor*group_factor_3*FRIGATE_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_CAPITAL_1, bias+group_factor_1*CAPITAL_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_2, bias+group_factor_2*CAPITAL_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_3, bias+group_factor_3*CAPITAL_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_1E, bias+elite_factor*group_factor_1*CAPITAL_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_2E, bias+elite_factor*group_factor_2*CAPITAL_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_CAPITAL_3E, bias+elite_factor*group_factor_3*CAPITAL_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_PLATFORM_1, bias+group_factor_1*PLATFORM_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_2, bias+group_factor_2*PLATFORM_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_3, bias+group_factor_3*PLATFORM_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_1E, bias+elite_factor*group_factor_1*PLATFORM_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_2E, bias+elite_factor*group_factor_2*PLATFORM_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_PLATFORM_3E, bias+elite_factor*group_factor_3*PLATFORM_DEMAND/2.6555 )
	
	SubSystemDemandSet(TACTICAL_UTILITY_1, bias+group_factor_1*UTILITY_DEMAND/1.2555 )
	SubSystemDemandSet(TACTICAL_UTILITY_2, bias+group_factor_2*UTILITY_DEMAND/1.4555 )
	SubSystemDemandSet(TACTICAL_UTILITY_3, bias+group_factor_3*UTILITY_DEMAND/1.6555 )
	SubSystemDemandSet(TACTICAL_UTILITY_1E, bias+group_factor_1*UTILITY_DEMAND/2.2555 )
	SubSystemDemandSet(TACTICAL_UTILITY_2E, bias+group_factor_2*UTILITY_DEMAND/2.4555 )
	SubSystemDemandSet(TACTICAL_UTILITY_3E, bias+group_factor_3*UTILITY_DEMAND/2.6555 )

---Research--------------------------------------------------------------------------------------------	
  local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
	if (researchcount==0) then				
		if numRUs > 500 then
	    SubSystemDemandSet(RESEARCH, 1.755 )
	  end
	end	
	
---Production subs----------------------------------------------------------------------------------	
	if (IsResearchDone(CORVETTETECH) == 1) then		
	  SubSystemDemandAdd(CORVETTEPRODUCTION, 6.755 )
		CpuBuildSS_DoSubSystemProductionDemand( CORVETTEPRODUCTION, eCorvette, kUnitCapId_Corvette )		
	end	
	if (IsResearchDone(FRIGATETECH) == 1) then	
	  SubSystemDemandAdd(FRIGATEPRODUCTION, 10.755 )
		CpuBuildSS_DoSubSystemProductionDemand( FRIGATEPRODUCTION, eFrigate, kUnitCapId_Frigate )	
	end	
	if (IsResearchDone(CAPITALTECH) == 1) then	
	  SubSystemDemandAdd(CAPSHIPPRODUCTION, 14.755 )		
	end	

	--Prospector  
  if NumSquadrons( VGR_SCAVER ) >= 1 and NumSubSystems(FUSION) >= 1 then
		if rank >= 1 then
		  if numRUs > 1500 then
		    SubSystemDemandSet(SUPPLY1, 1.174 )
		  end
		  if numRUs > 1600 then
		    SubSystemDemandSet(SUPPLY2, 0.974 )
		  end
		  if numRUs > 1700 then
		    SubSystemDemandSet(SUPPLY3, 0.774 )
		  end
		  if numRUs > 1800 then
		    SubSystemDemandSet(SUPPLY4, 0.574 )
		  end
		  if numRUs > 1900 then
		    SubSystemDemandSet(SUPPLY5, 0.374 )
		  end
		  if numRUs > 2000 then
		    SubSystemDemandSet(LASERCANNONS, 0.292 )
		    SubSystemDemandSet(LASERCANNONS1, 0.282 )
		  end
		end
	end

---Battleship-------------------------------------------------------------------------------------------		
	if NumSquadrons(VGR_ALKHALID) + NumSquadrons(VGR_DREADNAUGHT) + NumSquadrons(VGR_DREADNAUGHTB) >= 1 then		-- >=1
	  if numRUs > 500 then
	    SubSystemDemandSet(KINETICCANNON, 2.382 )
	    SubSystemDemandSet(KINETICCANNON1, 2.282 )
	    SubSystemDemandSet(KINETICCANNON2, 2.182 )
	    SubSystemDemandSet(KINETICCANNON3, 2.082 )
	  end
	  if numRUs > 800 then
	    SubSystemDemandSet(DOUBLEKINETICCANNON, 2.234 )
	    SubSystemDemandSet(DOUBLEKINETICCANNON1, 2.224 )
	    SubSystemDemandSet(DOUBLEKINETICCANNON2, 2.214 )
	    SubSystemDemandSet(LASERCANNON, 1.694 )
	    SubSystemDemandSet(LASERCANNON1, 1.684 )
	    SubSystemDemandSet(LASERCANNON2, 1.674 )
	    SubSystemDemandSet(LASERCANNON3, 1.664 )
	  end	  
	end	

	--Missile Battlecruiser
  if NumSquadrons(VGR_MISSILEBATTLECRUISER) >= 1 then
		if numRUs > 5000 then
		  SubSystemDemandSet(VGR_MBC_F, 1.292 )	
      SubSystemDemandSet(VGR_MBC_F1, 1.282 )	
      SubSystemDemandSet(VGR_MBC_F2, 1.272 )			  
		elseif numRUs > 2000 then
	    SubSystemDemandSet(VGR_MBC_C, 1.392 )
	    SubSystemDemandSet(VGR_MBC_M, 1.382 )
	    SubSystemDemandSet(VGR_MBC_D, 1.372 )
	  elseif numRUs > 1500 then
	    SubSystemDemandSet(HEAVYFUSIONMISSILELAUNCHERMBC, 1.29 )
	  end
	end
	
	--destroyer
	if NumSquadrons(VGR_DESTROYER) >= 1 then
		SubSystemDemandSet(VGR_DESTROYER_GUN5, 1.297 )
		SubSystemDemandSet(VGR_DESTROYER_GUN6, 1.248 )
	end
	
	--Tank
  if NumSquadrons(VGR_SINNER) + NumSquadrons(VGR_ALKHALID) + NumSquadrons(VGR_DREADNAUGHT) + NumSquadrons(VGR_DREADNAUGHTB) + NumSquadrons(VGR_DESTROYER) >= 1 then
	  if numRUs > 3500 then
	  	if mod(numRUs,2) == 0 then
		  	SubSystemDemandSet(VGR_HEAVYCRUISERKINETICTURRET_TANK1, 1.393 )
		  	SubSystemDemandSet(VGR_HEAVYCRUISERKINETICTURRET_TANK2, 1.383 )
		  	SubSystemDemandSet(VGR_HEAVYCRUISERKINETICTURRET_TANK3, 1.373 )
		  	SubSystemDemandSet(VGR_HEAVYCRUISERKINETICTURRET_TANK4, 1.363 )
		  	SubSystemDemandSet(VGR_HEAVYCRUISERKINETICTURRET_TANK5, 1.353 )
		  	SubSystemDemandSet(VGR_HEAVYCRUISERKINETICTURRET_TANK6, 1.343 )
	  	else
	  		SubSystemDemandSet(VGR_ION_TANK1, 4.396 )
		  	SubSystemDemandSet(VGR_ION_TANK2, 4.386 )
		  	SubSystemDemandSet(VGR_ION_TANK3, 4.376 )
		  	SubSystemDemandSet(VGR_ION_TANK4, 4.366 )
		  	SubSystemDemandSet(VGR_ION_TANK5, 4.356 )
		  	SubSystemDemandSet(VGR_ION_TANK6, 4.346 )
		  end
	  elseif numRUs > 3000 then
	  	if mod(numRUs,2) == 0 then
		  	SubSystemDemandSet(VGR_DT3_TURRET_TANK1, 2.695 )
		  	SubSystemDemandSet(VGR_DT3_TURRET_TANK2, 2.685 )
		  	SubSystemDemandSet(VGR_DT3_TURRET_TANK3, 2.675 )
		  	SubSystemDemandSet(VGR_DT3_TURRET_TANK4, 2.665 )
		  	SubSystemDemandSet(VGR_DT3_TURRET_TANK5, 2.655 )
		  	SubSystemDemandSet(VGR_DT3_TURRET_TANK6, 2.645 )
	  	else
		  	SubSystemDemandSet(VGR_FT2_TURRET_TANK1, 2.595 )
		  	SubSystemDemandSet(VGR_FT2_TURRET_TANK2, 2.585 )
		  	SubSystemDemandSet(VGR_FT2_TURRET_TANK3, 2.575 )
		  	SubSystemDemandSet(VGR_FT2_TURRET_TANK4, 2.565 )
		  	SubSystemDemandSet(VGR_FT2_TURRET_TANK5, 2.555 )
		  	SubSystemDemandSet(VGR_FT2_TURRET_TANK6, 2.545 )
		  end
	  elseif numRUs > 1800 then
	  	if mod(numRUs,2) == 0 then
		  	SubSystemDemandSet(VGR_RAILGUN_TURRET_TANK1, 2.219 )
		  	SubSystemDemandSet(VGR_RAILGUN_TURRET_TANK2, 2.218 )
		  	SubSystemDemandSet(VGR_RAILGUN_TURRET_TANK3, 2.217 )
		  	SubSystemDemandSet(VGR_RAILGUN_TURRET_TANK4, 2.216 )
		  	SubSystemDemandSet(VGR_RAILGUN_TURRET_TANK5, 2.215 )
		  	SubSystemDemandSet(VGR_RAILGUN_TURRET_TANK6, 2.214 )
	  	else
	  		SubSystemDemandSet(VGR_MLRS_TANK1, 3.079 )
		  	SubSystemDemandSet(VGR_MLRS_TANK2, 3.078 )
		  	SubSystemDemandSet(VGR_MLRS_TANK3, 3.077 )
		  	SubSystemDemandSet(VGR_MLRS_TANK4, 3.076 )
		  	SubSystemDemandSet(VGR_MLRS_TANK5, 3.075 )
		  	SubSystemDemandSet(VGR_MLRS_TANK6, 3.074 )		  	
		  end
	  elseif numRUs > 1200 then
	  	if mod(numRUs,2) == 0 then
				SubSystemDemandSet(VGR_CIWS_TANK1, 3.189 )
		  	SubSystemDemandSet(VGR_CIWS_TANK2, 3.188 )
		  	SubSystemDemandSet(VGR_CIWS_TANK3, 3.187 )
		  	SubSystemDemandSet(VGR_CIWS_TANK4, 3.186 )
		  	SubSystemDemandSet(VGR_CIWS_TANK5, 3.185 )
		  	SubSystemDemandSet(VGR_CIWS_TANK6, 3.184 )
	  	else
	  		SubSystemDemandSet(VGR_QJE_QUADFLECHETTE_TANK1, 2.319 )
		  	SubSystemDemandSet(VGR_QJE_QUADFLECHETTE_TANK2, 2.318 )
		  	SubSystemDemandSet(VGR_QJE_QUADFLECHETTE_TANK3, 2.317 )
		  	SubSystemDemandSet(VGR_QJE_QUADFLECHETTE_TANK4, 2.316 )
		  	SubSystemDemandSet(VGR_QJE_QUADFLECHETTE_TANK5, 2.315 )
		  	SubSystemDemandSet(VGR_QJE_QUADFLECHETTE_TANK6, 2.314 )
		  end
	  elseif numRUs > 900 then
	  	if mod(numRUs,2) == 0 then
		  	SubSystemDemandSet(VGR_QJE_LITHIUMION_TANK1, 2.139 )
		  	SubSystemDemandSet(VGR_QJE_LITHIUMION_TANK2, 2.138 )
		  	SubSystemDemandSet(VGR_QJE_LITHIUMION_TANK3, 2.137 )
		  	SubSystemDemandSet(VGR_QJE_LITHIUMION_TANK4, 2.136 )
		  	SubSystemDemandSet(VGR_QJE_LITHIUMION_TANK5, 2.135 )
		  	SubSystemDemandSet(VGR_QJE_LITHIUMION_TANK6, 2.134 )
	  	else
	  		SubSystemDemandSet(PIR_FASTTRACKINGTURRET_TANK1, 2.429 )
		  	SubSystemDemandSet(PIR_FASTTRACKINGTURRET_TANK2, 2.428 )
		  	SubSystemDemandSet(PIR_FASTTRACKINGTURRET_TANK3, 2.427 )
		  	SubSystemDemandSet(PIR_FASTTRACKINGTURRET_TANK4, 2.426 )
		  	SubSystemDemandSet(PIR_FASTTRACKINGTURRET_TANK5, 2.425 )
		  	SubSystemDemandSet(PIR_FASTTRACKINGTURRET_TANK6, 2.424 )
		  end
	  end
	  
	  if numRUs > 6000 then
	    SubSystemDemandSet(VGR_MBC_M1, 1.451 )
		  SubSystemDemandSet(VGR_MBC_M2, 1.441 )
		  SubSystemDemandSet(VGR_MBC_M3, 1.431 )
		  SubSystemDemandSet(VGR_MBC_M4, 1.421 )
		elseif numRUs > 2000 then
	    SubSystemDemandSet(VGR_MBC_C1, 1.391 )
	    SubSystemDemandSet(VGR_MBC_C2, 1.381 )
	    SubSystemDemandSet(VGR_MBC_C3, 1.371 )
	    SubSystemDemandSet(VGR_MBC_C4, 1.361 )
		end
	end

---Mothership	
	if NumSquadrons( VGR_MOTHERSHIP ) >= 1 then		
		if numRUs > 10000 then
			SubSystemDemandSet(VGR_MOTHERSHIP_SHIELD, 1.388 )
	  	SubSystemDemandSet(VGR_MOTHERSHIP_SHIELD1, 1.387 )
	  elseif numRUs > 2000 then
	    SubSystemDemandSet(VGR_POWER_MS, 1.389 )
	  end		
	end			
	
---Carrier
	if NumSquadrons( VGR_CARRIER ) >= 1 then		
		if numRUs > 10000 then
	  	SubSystemDemandSet(VGR_CARRIER_SHIELD, 1.378 )
	  	SubSystemDemandSet(VGR_CARRIER_SHIELD1, 1.377 )
		elseif numRUs > 2000 then
	    SubSystemDemandSet(VGR_POWER_MS, 1.379 )
	  end
	end

---Shipyard
	if NumSquadrons( VGR_SHIPYARD ) >= 1 then
		if numRUs > 10000 then
	    SubSystemDemandSet(VGR_SHIPYARD_SHIELD, 1.429 )
	  	SubSystemDemandSet(VGR_SHIPYARD_SHIELD1, 1.428 )
		elseif numRUs > 5000 then
			SubSystemDemandSet(MAGNETRONCANNON1, 1.323 )
	    SubSystemDemandSet(MAGNETRONCANNON2, 1.322 )
	    SubSystemDemandSet(DOUBLEKINETICCANNON, 1.321 )
		elseif numRUs > 3300 then
			SubSystemDemandSet(VGR_POWER_MS, 1.329 )
			SubSystemDemandSet(VGR_POWER_MS1, 1.328 )
			SubSystemDemandSet(VGR_POWER_MS2, 1.327 )
			SubSystemDemandSet(VGR_POWER_MS3, 1.326 )
			SubSystemDemandSet(VGR_POWER_MS4, 1.325 )
			SubSystemDemandSet(VGR_POWER_MS5, 1.324 )
	  end		
	end	

---Artillery Cruiser
  if NumSquadrons(VGR_ARTILLERYSHIP) >= 1 then
	  if numRUs > 2500 then
	    SubSystemDemandSet(VGR_CR_P, 2.379 )
	    SubSystemDemandSet(VGR_CR_M, 2.378 )	 
      SubSystemDemandSet(VGR_CR_L, 2.377 )
    elseif numRUs > 900 then
      SubSystemDemandSet(LASERCANNON, 1.679 )
	    SubSystemDemandSet(LASERCANNON2, 1.678 )	    			
	  end	  
	end			
	
---Battlecarrier
  if NumSquadrons(VGR_BATTLECARRIER) >= 1 then
	  if numRUs > 2000 then
	    SubSystemDemandSet(VGR_POWER_MS, 1.269 )
	    SubSystemDemandSet(VGR_POWER_MS1, 1.268 )
	  end
	end	
	
---Peacemaker
  if NumSquadrons(VGR_HEAVYCRUISER) >= 1 then	  
	  if numRUs > 10000 then
	    SubSystemDemandSet(HEAVYCRUISERPC, 1.199 )
	  end
	  if numRUs > 9000 then
	    SubSystemDemandSet(HEAVYFUSIONMISSILELAUNCHERHC, 1.299 )
	    SubSystemDemandSet(HEAVYFUSIONMISSILELAUNCHERHC1, 1.298 )
	  elseif numRUs > 5000 then
	    SubSystemDemandSet(KINETICCANNONHC, 1.399 )
	    SubSystemDemandSet(BCKINETICFLAKCANNON, 1.398 )
	    SubSystemDemandSet(BCKINETICFLAKCANNON1, 1.397 )
	  end
	end

	---Command Fortress
	if NumSquadrons(VGR_COMMANDFORTRESS) >= 1 then
		if numRUs > 2000 then
	    SubSystemDemandSet(ADVANCEDARRAY, 2.678 )
	    SubSystemDemandSet(CLOAKSENSOR, 2.677 )
	  end
		if numRUs > 20000 then
	    SubSystemDemandSet(HOLESCRUMBLER, 1.679 )
	    SubSystemDemandSet(CLOAKGENERATOR, 1.678 )
	    SubSystemDemandSet(HYPERSPACEINHIBITOR, 1.677 )
	  end
	end

---Other----------------------------------------------------------------------------------------------		
	CpuBuildSS_OtherMiscSubSystemDemand();		
	if (researchcount > 0 and s_totalProdSS > 0 and GetRU() > 800) then		-- and s_militaryPop > 8 and GetNumCollecting() > 8
		CpuBuildSS_SpecialSubSystemDemand()
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function DoSubSystemDemand_Kadeshi()	

	-- determine FIGHTERPRODUCTION demand
	CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )
	SubSystemDemandAdd(FIGHTERPRODUCTION, 10 )
	
	-- Demand for RESEARCH
	local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
	
	-- cache the demand for these two classes
	local highestFighterDemand = ShipDemandMaxByClass( eFighter )
	local highestCorvetteDemand = ShipDemandMaxByClass( eCorvette )
	local highestFrigateDemand = ShipDemandMaxByClass( eFrigate )
	local capdemand = ShipDemandMaxByClass( eCapital )
	
	-- check to see if we have corvette tech
		CpuBuildSS_DoSubSystemProductionDemand( CORVETTEPRODUCTION, eCorvette, kUnitCapId_Corvette )
		SubSystemDemandAdd(CORVETTEPRODUCTION, 10 )
		CpuBuildSS_DoSubSystemProductionDemand( FRIGATEPRODUCTION, eFrigate, kUnitCapId_Frigate )
		SubSystemDemandAdd(FRIGATEPRODUCTION, 10 )
	
	-- demand for carrierprod, platform, hyperspace, ...
	CpuBuildSS_OtherMiscSubSystemDemand();
	
	-- before doing the 'extra' subsystems make sure we have a research SS and production SS and a few military dudes
	if (researchcount > 0 and s_totalProdSS > 0 and GetRU() > 800) then		-- and s_militaryPop > 8 and GetNumCollecting() > 8
		CpuBuildSS_SpecialSubSystemDemand()
	end
	
	SubSystemDemandSet(RESEARCH, 1.951)
	
	if GetRU() > 1000 then
		SubSystemDemandSet(BCIONBEAMTURRET, 0.696)
		SubSystemDemandSet(BCIONBEAMTURRET1, 0.686)
		if GetRU() > 6000 then
			SubSystemDemandSet(BCIONBEAMTURRET2, 0.676)
		end
		SubSystemDemandSet(BCIONBEAMTURRET3, 0.698)
		SubSystemDemandSet(KAD_DESTROYER_DEMOPOD, 0.688)
		SubSystemDemandSet(KAD_DESTROYER_NEBULAPOD, 0.678)
		SubSystemDemandSet(KAD_DESTROYER_IONPOD, 0.668)
		SubSystemDemandSet(KAD_DESTROYER_GUNPOD, 0.658)
		SubSystemDemandSet(KAD_DESTROYER_SUPERPOD, 0.648)
		SubSystemDemandSet(PRAYERPOD, 0.638)
		SubSystemDemandSet(FIRECONTROLTOWER, 0.628)
		SubSystemDemandSet(HYPERSPACESENSOR, 0.618)
	end
	if GetRU() > 5000 then
		SubSystemDemandSet(BCIONBEAMTURRET4, 0.884)
	end
	if GetRU() > 7000 then
		SubSystemDemandSet(KAD_MASSSHIELD_SPHERE, 0.771)
	end
	if GetRU() > 3500 then
		SubSystemDemandSet(HYPERSPACE, 0.883)
	end
	
	--perks
	if GetRU() > 2100 then
		--SubSystemDemandSet(KAD_PERKS_SURVIVALIST, 0.852)
		SubSystemDemandSet(KAD_PERKS_RAGE, 0.879)
		SubSystemDemandSet(KAD_PERKS_STEALTH, 0.878)
		SubSystemDemandSet(KAD_PERKS_SAFEFALL, 0.866)
		SubSystemDemandSet(KAD_PERKS_TRAINING, 0.877)
		SubSystemDemandSet(KAD_PERKS_HITANDRUN, 0.876)
		SubSystemDemandSet(KAD_PERKS_BOUNTY, 0.875)
		
		SubSystemDemandSet(KAD_PERKS_DAMAGECONTROL, 0.874)
		SubSystemDemandSet(KAD_PERKS_CURSE, 0.873)
		SubSystemDemandSet(KAD_PERKS_REVEALER, 0.872)
		SubSystemDemandSet(KAD_PERKS_SUPERHEAVY, 0.871)
		SubSystemDemandSet(KAD_PERKS_POTENTIAL, 0.869)
		SubSystemDemandSet(KAD_PERKS_RETREAT, 0.868)
		SubSystemDemandSet(KAD_PERKS_MIRACLE, 0.867)
	end
	
	local rank_isCaptain = NumSubSystems(ISCAPTAIN)
	if GetRU() > 5100 and rank_isCaptain > 0 then
		if (IsResearchDone(SAJUUK3) == 1) then
			SubSystemDemandSet(KAD_NEEDLE_FIGUREHEAD, 0.929)
		elseif (IsResearchDone(KADESH3) == 1) then
			SubSystemDemandSet(KAD_NEEDLE_ION, 0.919)
		end
	end
	
	--resurrection
	--if NumSquadrons( KAD_NEEDLESHIP ) < 1 then
		SubSystemDemandSet(HGN_ORDERS_NEEDLE, 10.373)
	--end

end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function DoSubSystemDemand_Raider()	

	-- As we really have no subsystems ATM do... ahm... nothing?
	if (s_militaryPop > 8 and GetNumCollecting() > 4 and GetRU() > 1000) then
		SubSystemDemandAdd( BCIONBEAMTURRET, 0.666)
	end
	
	if GetRU() > 4000 then
		SubSystemDemandSet(TROPHY4, 0.665)
	elseif GetRU() > 3000 then
		SubSystemDemandSet(TROPHY3, 0.664)
	elseif GetRU() > 2000 then
		SubSystemDemandSet(TROPHY2, 0.663)
	elseif GetRU() > 1000 then
		SubSystemDemandSet(TROPHY1, 0.662)
	end
	
	if GetRU() > 2000 then
		SubSystemDemandSet(BCIONBEAMTURRET1, 0.769)
		SubSystemDemandSet(BCIONBEAMTURRET2, 0.768)
		SubSystemDemandSet(BCIONBEAMTURRET3, 0.767)
		SubSystemDemandSet(RAD_DESTROYER_MISSILE, 0.766)
		SubSystemDemandSet(RAD_DESTROYER_CLOAK, 0.765)
		SubSystemDemandSet(RAD_S_BIGDADDY1, 0.779)
		SubSystemDemandSet(RAD_S_BIGDADDY2, 0.778)
		SubSystemDemandSet(RAD_S_BIGDADDY3, 0.777)
		SubSystemDemandSet(RAD_S_BIGDADDY4, 0.776)
		SubSystemDemandSet(RAD_S_BIGDADDY5, 0.775)
		SubSystemDemandSet(RAD_S_BIGDADDY6, 0.774)
		SubSystemDemandSet(RAD_S_BIGDADDY7, 0.773)
		--for i=1,10 do
		--	SubSystemDemandSet(MERC_DEFENSE..i, 0.01*random(50-4*i,100-5*i))
		--	SubSystemDemandSet(MERC_ATTACK..i, 0.01*random(50-4*i,100-5*i))
		--end
		SubSystemDemandSet(MERC_DEFENSE1, 0.789)
		SubSystemDemandSet(MERC_DEFENSE2, 0.788)
		SubSystemDemandSet(MERC_DEFENSE3, 0.787)
		SubSystemDemandSet(MERC_DEFENSE4, 0.786)
		SubSystemDemandSet(MERC_ATTACK1, 0.785)
		SubSystemDemandSet(MERC_ATTACK2, 0.784)
		SubSystemDemandSet(MERC_ATTACK3, 0.783)
		SubSystemDemandSet(MERC_ATTACK4, 0.782)
	end
	
	if GetRU() > 4000 then
		SubSystemDemandSet(BCIONBEAMTURRET4, 0.763)
		SubSystemDemandSet(BCIONBEAMTURRET5, 0.762)
		SubSystemDemandSet(BCIONBEAMTURRET6, 0.761)
		SubSystemDemandSet(MERC_DEFENSE5, 0.709)
		SubSystemDemandSet(MERC_DEFENSE6, 0.708)
		SubSystemDemandSet(MERC_DEFENSE7, 0.707)
		SubSystemDemandSet(MERC_DEFENSE8, 0.706)
		SubSystemDemandSet(MERC_DEFENSE9, 0.705)
		SubSystemDemandSet(MERC_DEFENSE10, 0.704)
		SubSystemDemandSet(MERC_ATTACK5, 0.729)
		SubSystemDemandSet(MERC_ATTACK6, 0.728)
		SubSystemDemandSet(MERC_ATTACK7, 0.727)
		SubSystemDemandSet(MERC_ATTACK8, 0.726)
		SubSystemDemandSet(MERC_ATTACK9, 0.725)
		SubSystemDemandSet(MERC_ATTACK10, 0.724)
	end
	
---Black Market-------------------------------------------------------------------------------------------------------	
	if NumSquadrons(RAD_BLACKMARKET) >= 1 then
	  if GetRU() > 4000 then
	  	SubSystemDemandSet(RAD_BM_ARMOUR, 3.459 )
	    SubSystemDemandSet(CIVILMODULE1, 3.359 )
	    SubSystemDemandSet(CIVILMODULE2, 3.259 )
	    SubSystemDemandSet(CIVILMODULE3, 3.159 )
	    SubSystemDemandSet(CIVILMODULE4, 3.059 )
	    SubSystemDemandSet(CIVILMODULE5, 2.959 )
	    SubSystemDemandSet(CIVILMODULE6, 2.859 )	       
	  end	   
	  if GetRU() > 6000 then
		  SubSystemDemandSet(RAD_BLACKMARKETKINETIC, 2.758 )
		  SubSystemDemandSet(RAD_BLACKMARKETBOOMER, 2.757 )
		  SubSystemDemandSet(RAD_BLACKMARKETMORTAR, 2.756 )
		  SubSystemDemandSet(RAD_BLACKMARKETHOWITZER, 2.755 )
		  SubSystemDemandSet(RAD_BLACKMARKET_CLUSTERMISSILE, 2.351 )
		  SubSystemDemandSet(RAD_BLACKMARKET_SCUD, 2.354 )
		  SubSystemDemandSet(RAD_BLACKMARKET_DISCO, 2.372 )
		  SubSystemDemandSet(RAD_BLACKMARKET_KICKASS, 2.374 )
		end
	end
	
---Generals-------------------------------------------------------------------------------------------------------	
	if NumSquadrons(RAD_MOTHERSHIP) >= 1 then
	  if GetRU() > 4000 then	    
	    SubSystemDemandSet(RAD_GENERAL_1, 0.395 )
	    SubSystemDemandSet(RAD_GENERAL_2, 0.385 )
	    SubSystemDemandSet(RAD_GENERAL_3, 0.375 )
	    SubSystemDemandSet(RAD_GENERAL_4, 0.365 )
	    SubSystemDemandSet(RAD_GENERAL_5, 0.355 )
	    SubSystemDemandSet(RAD_GENERAL_6, 0.345 )
	    SubSystemDemandSet(RAD_GENERAL_7, 0.335 )
	    SubSystemDemandSet(RAD_GENERAL_8, 0.325 )
	  end
	end

end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function DoSubSystemDemand_Keeper()

	-- based on the highest demand determine what subsystems to ask for
	-- if fighter demand is high then request that
	-- if corvette and frigate demand is high then research modules
	-- if carrier/builders then capital ship

	
	-- determine FIGHTERPRODUCTION demand
	CpuBuildSS_DoSubSystemProductionDemand( FIGHTERPRODUCTION, eFighter, kUnitCapId_Fighter )
	
	-- Demand for RESEARCH
	local researchcount = NumSubSystems(RESEARCH) + NumSubSystemsQ(RESEARCH)
	
	-- cache the demand for these two classes
	local highestCorvetteDemand = ShipDemandMaxByClass( eCorvette )
	local highestFrigateDemand = ShipDemandMaxByClass( eFrigate )
	local capdemand = ShipDemandMaxByClass( eCapital )
	
	-- if we do not have the research subsystem - check to see if want it - I'd imagine it would always be YES
	if (researchcount==0) then
		
		-- determine demand for research - accumalating demand for high-level ships
		local researchdemand = highestCorvetteDemand
		
		if (highestFrigateDemand > researchdemand) then
			researchdemand = highestFrigateDemand
		elseif (capdemand > researchdemand) then
			researchdemand = capdemand
		end
		
		-- demand is equivalent to all things its opens (corvette and frigate and capital)
		SubSystemDemandSet(CORVETTEPRODUCTION, researchdemand+1 )
		SubSystemDemandSet(FRIGATEPRODUCTION, researchdemand+1 )
	end
	
	--Convert energy into RUs
	if GetRU() < 500 and NumSquadrons(KPR_RESSOURCECOLLECTOR_OLD) >= 1 then
		SubSystemDemandSet(KPR_ORDERS_EN100, 2.726 )
	end
	
	-- check to see if we have corvette tech
	
		CpuBuildSS_DoSubSystemProductionDemand( CORVETTEPRODUCTION, eCorvette, kUnitCapId_Corvette )
		CpuBuildSS_DoSubSystemProductionDemand( FRIGATEPRODUCTION, eFrigate, kUnitCapId_Frigate )
	
	-- demand for carrierprod, platform, hyperspace, ...
	CpuBuildSS_OtherMiscSubSystemDemand();
	
	-- before doing the 'extra' subsystems make sure we have a research SS and production SS and a few military dudes
	if (researchcount > 0 and s_totalProdSS > 0 and GetRU() > 800) then		-- and s_militaryPop > 8 and GetNumCollecting() > 8
		CpuBuildSS_SpecialSubSystemDemand()
	end

end