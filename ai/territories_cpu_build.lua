

--THIS RUNS IN GAME RULE SCOPE
--(ships are not actually built using the real build system, this just mimics it)



--used to iterate throyugh CPU players one at a time
gCpuID_Build = -1


--ships to build and when to build them
gCpuBuildQueue = 
{
	[0] = {},
	[1] = {},
	[2] = {},
	[3] = {},
}

--number of queued capture frigates
gQueuedCaptureFrigates = 
{
	[0] = 0,
	[1] = 0,
	[2] = 0,
	[3] = 0,
}

gBuildSpeedMultiplier = 1 --used to determine when to produce a ship



--indexes for gShips table
CAPTURE_FRIGATE = 1
REPAIR_SHIP = 2
FIGHTER1 = 3
FIGHTER2 = 4
FIGHTER3 = 5
FIGHTER4 = 6
CORVETTE1 = 7
CORVETTE2 = 8
MINELAYER = 9
FRIGATE1 = 10
FRIGATE2 = 11
FRIGATE3 = 12
CARRIER = 13
DESTROYER = 14
BATTLECRUISER = 15
PLATFORM1 = 16
PLATFORM2 = 17


gShips = 
{
	[1] = --hiigaran
	{
		[CAPTURE_FRIGATE] = { name="Hgn_MarineFrigate", 	cost=800, time=50, shipID=0 },
		[REPAIR_SHIP] = 	{ name="Hgn_ResourceCollector", cost=300, time=30, shipID=0 },
		[FIGHTER1] = 		{ name="Hgn_Scout", 			cost=350, time=20, shipID=0 },
		[FIGHTER2] = 		{ name="Hgn_Interceptor", 		cost=500, time=35, shipID=0 },
		[FIGHTER3] = 		{ name="Hgn_AttackBomber", 		cost=550, time=40, shipID=0 },
		[FIGHTER4] = 		{ name="hgn_lbomber", 			cost=500, time=35, shipID=0 },
		[CORVETTE1] = 		{ name="Hgn_AssaultCorvette", 	cost=625, time=45, shipID=0 },
		[CORVETTE2] = 		{ name="Hgn_PulsarCorvette", 	cost=625, time=45, shipID=0 },
		[MINELAYER] = 		{ name="Hgn_MinelayerCorvette", cost=800, time=45, shipID=0 },
		[FRIGATE1] = 		{ name="Hgn_TorpedoFrigate", 	cost=700, time=55, shipID=0 },
		[FRIGATE2] = 		{ name="Hgn_AssaultFrigate", 	cost=700, time=50, shipID=0 },
		[FRIGATE3] = 		{ name="Hgn_IonCannonFrigate", 	cost=700, time=45, shipID=0 },
		[CARRIER] = 		{ name="Hgn_Carrier", 			cost=900, time=65, shipID=0 },
		[DESTROYER] = 		{ name="Hgn_Destroyer", 		cost=2000, time=165, shipID=0 },
		[BATTLECRUISER] = 	{ name="Hgn_Battlecruiser", 	cost=4000, time=280, shipID=0 },
		[PLATFORM1] = 		{ name="Hgn_GunTurret", 		cost=300, time=20, shipID=0 },
		[PLATFORM2] = 		{ name="Hgn_IonTurret", 		cost=300, time=20, shipID=0 },
	},
	[2] = --vaygr
	{
		[CAPTURE_FRIGATE] = { name="Vgr_InfiltratorFrigate", 	cost=800, time=50, shipID=0 },
		[REPAIR_SHIP] = 	{ name="Vgr_ResourceCollector", 	cost=300, time=30, shipID=0 },
		[FIGHTER1] = 		{ name="Vgr_Scout", 				cost=350, time=20, shipID=0 },
		[FIGHTER2] = 		{ name="Vgr_Interceptor", 			cost=500, time=35, shipID=0 },
		[FIGHTER3] = 		{ name="Vgr_Bomber", 				cost=550, time=40, shipID=0 },
		[FIGHTER4] = 		{ name="Vgr_LanceFighter", 			cost=500, time=35, shipID=0 },
		[CORVETTE1] = 		{ name="Vgr_MissileCorvette", 		cost=625, time=45, shipID=0 },
		[CORVETTE2] = 		{ name="Vgr_LaserCorvette", 		cost=650, time=45, shipID=0 },
		[MINELAYER] = 		{ name="Vgr_MinelayerCorvette", 	cost=800, time=45, shipID=0 },
		[FRIGATE1] = 		{ name="Vgr_AssaultFrigate", 		cost=650, time=45, shipID=0 },
		[FRIGATE2] = 		{ name="Vgr_HeavyMissileFrigate", 	cost=700, time=45, shipID=0 },
		[FRIGATE3] = 		{ name="vgr_longrangeartilleryfrigate", 	cost=700, time=45, shipID=0 },
		[CARRIER] = 		{ name="Vgr_Carrier", 				cost=900, time=40, shipID=0 },
		[DESTROYER] = 		{ name="Vgr_Destroyer", 			cost=2000, time=165, shipID=0 },
		[BATTLECRUISER] = 	{ name="Vgr_BattleCruiser", 		cost=4000, time=280, shipID=0 },
		[PLATFORM1] = 		{ name="Vgr_WeaponPlatform_gun", 	cost=300, time=20, shipID=0 },
		[PLATFORM2] = 		{ name="Vgr_WeaponPlatform_missile", cost=300, time=20, shipID=0 },
	},
	[3] = --kadeshi
	{
		[CAPTURE_FRIGATE] = { name="kad_podship", 	cost=800, time=50, shipID=0 },
		[REPAIR_SHIP] = 	{ name="kad_ressourcecollector", 	cost=300, time=30, shipID=0 },
		[FIGHTER1] = 		{ name="kad_swarmer_new", 				cost=350, time=20, shipID=0 },
		[FIGHTER2] = 		{ name="kad_advancedswarmer", 			cost=500, time=35, shipID=0 },
		[FIGHTER3] = 		{ name="kad_heavyswarmer_new", 				cost=550, time=40, shipID=0 },
		[FIGHTER4] = 		{ name="kad_pulsarswarmer", 			cost=500, time=35, shipID=0 },
		[CORVETTE1] = 		{ name="kad_gunpod", 		cost=625, time=45, shipID=0 },
		[CORVETTE2] = 		{ name="kad_ionpod", 		cost=650, time=45, shipID=0 },
		[MINELAYER] = 		{ name="kad_missilepod", 	cost=800, time=45, shipID=0 },
		[FRIGATE1] = 		{ name="kad_multigun", 		cost=650, time=45, shipID=0 },
		[FRIGATE2] = 		{ name="kad_multibeam_new", 	cost=700, time=45, shipID=0 },
		[FRIGATE3] = 		{ name="kad_multibeam", 	cost=700, time=45, shipID=0 },
		[CARRIER] = 		{ name="kad_needleship", 				cost=900, time=40, shipID=0 },
		[DESTROYER] = 		{ name="kad_destroyer_real", 			cost=2000, time=165, shipID=0 },
		[BATTLECRUISER] = 	{ name="kad_destroyer", 		cost=4000, time=280, shipID=0 },
		[PLATFORM1] = 		{ name="kad_nebuladrone", 	cost=300, time=20, shipID=0 },
		[PLATFORM2] = 		{ name="kad_snail", cost=300, time=20, shipID=0 },
	},
	[4] = --raider
	{
		[CAPTURE_FRIGATE] = { name="rad_gunfrigate", 	cost=800, time=50, shipID=0 },
		[REPAIR_SHIP] = 	{ name="rad_resourcecollector", 	cost=300, time=30, shipID=0 },
		[FIGHTER1] = 		{ name="rad_interceptor", 				cost=350, time=20, shipID=0 },
		[FIGHTER2] = 		{ name="rad_bomber", 			cost=500, time=35, shipID=0 },
		[FIGHTER3] = 		{ name="rad_elitefighter", 				cost=550, time=40, shipID=0 },
		[FIGHTER4] = 		{ name="rad_fencer", 			cost=500, time=35, shipID=0 },
		[CORVETTE1] = 		{ name="rad_guncorvette", 		cost=625, time=45, shipID=0 },
		[CORVETTE2] = 		{ name="rad_missilecorvette", 		cost=650, time=45, shipID=0 },
		[MINELAYER] = 		{ name="rad_empcorvette", 	cost=800, time=45, shipID=0 },
		[FRIGATE1] = 		{ name="rad_beamfrigate", 		cost=650, time=45, shipID=0 },
		[FRIGATE2] = 		{ name="rad_gattlingfrigate", 	cost=700, time=45, shipID=0 },
		[FRIGATE3] = 		{ name="rad_missilefrigate", 	cost=700, time=45, shipID=0 },
		[CARRIER] = 		{ name="rad_carrier", 				cost=900, time=40, shipID=0 },
		[DESTROYER] = 		{ name="rad_destroyer", 			cost=2000, time=165, shipID=0 },
		[BATTLECRUISER] = 	{ name="rad_cruiser", 		cost=4000, time=280, shipID=0 },
		[PLATFORM1] = 		{ name="rad_guntrap", 	cost=300, time=20, shipID=0 },
		[PLATFORM2] = 		{ name="rad_explotrap", cost=300, time=20, shipID=0 },
	},
	[6] = --keeper
	{
		[CAPTURE_FRIGATE] = { name="kpr_deciever", 	cost=800, time=50, shipID=0 },
		[REPAIR_SHIP] = 	{ name="kpr_dronestruct", 	cost=300, time=30, shipID=0 },
		[FIGHTER1] = 		{ name="Kpr_AttackDroid", 				cost=350, time=20, shipID=0 },
		[FIGHTER2] = 		{ name="kpr_interceptor_old", 			cost=500, time=35, shipID=0 },
		[FIGHTER3] = 		{ name="kpr_attackdroid_combo", 				cost=550, time=40, shipID=0 },
		[FIGHTER4] = 		{ name="kpr_interceptor_combo", 			cost=500, time=35, shipID=0 },
		[CORVETTE1] = 		{ name="kpr_attackdroid_agitator", 		cost=625, time=45, shipID=0 },
		[CORVETTE2] = 		{ name="Kpr_Mover", 		cost=650, time=45, shipID=0 },
		[MINELAYER] = 		{ name="kpr_meddler", 	cost=800, time=45, shipID=0 },
		[FRIGATE1] = 		{ name="kpr_seeker", 		cost=650, time=45, shipID=0 },
		[FRIGATE2] = 		{ name="kpr_guardian", 	cost=700, time=45, shipID=0 },
		[FRIGATE3] = 		{ name="kpr_hunter", 	cost=700, time=45, shipID=0 },
		[CARRIER] = 		{ name="kpr_carrier", 				cost=900, time=40, shipID=0 },
		[DESTROYER] = 		{ name="kpr_destroyer", 			cost=2000, time=165, shipID=0 },
		[BATTLECRUISER] = 	{ name="kpr_dreadnaught", 		cost=4000, time=280, shipID=0 },
		[PLATFORM1] = 		{ name="kpr_marauder", 	cost=300, time=20, shipID=0 },
		[PLATFORM2] = 		{ name="kpr_sentinel", cost=300, time=20, shipID=0 },
	},
}

--these are the basic warships that each command post type can build
gCommandPostShips = 
{
	[1] = --hiigaran
	{
		[FIGHTER] = { FIGHTER1, FIGHTER2, FIGHTER3, FIGHTER4 },
		[CORVETTE] = { CORVETTE1, CORVETTE2 }, --mineleayers will be handled separately
		[FRIGATE] = { FRIGATE1, FRIGATE2, FRIGATE3 },
		[CAPITAL] = { DESTROYER, BATTLECRUISER }, --CPU players won't use carriers for now
	},
	[2] = --vaygr
	{
		[FIGHTER] = { FIGHTER1, FIGHTER2, FIGHTER3, FIGHTER4 },
		[CORVETTE] = { CORVETTE1, CORVETTE2 },
		[FRIGATE] = { FRIGATE1, FRIGATE2, FRIGATE3 },
		[CAPITAL] = { DESTROYER, BATTLECRUISER },
	},
	[3] = --kadeshi
	{
		[FIGHTER] = { FIGHTER1, FIGHTER2, FIGHTER3, FIGHTER4 },
		[CORVETTE] = { CORVETTE1, CORVETTE2 },
		[FRIGATE] = { FRIGATE1, FRIGATE2, FRIGATE3 },
		[CAPITAL] = { DESTROYER, BATTLECRUISER },
	},
	[4] = --raider
	{
		[FIGHTER] = { FIGHTER1, FIGHTER2, FIGHTER3, FIGHTER4 },
		[CORVETTE] = { CORVETTE1, CORVETTE2 },
		[FRIGATE] = { FRIGATE1, FRIGATE2, FRIGATE3 },
		[CAPITAL] = { DESTROYER, BATTLECRUISER },
	},
	[6] = --keeper
	{
		[FIGHTER] = { FIGHTER1, FIGHTER2, FIGHTER3, FIGHTER4 },
		[CORVETTE] = { CORVETTE1, CORVETTE2 },
		[FRIGATE] = { FRIGATE1, FRIGATE2, FRIGATE3 },
		[CAPITAL] = { DESTROYER, BATTLECRUISER },
	},
}







function AddCpuBuildRules()
	Rule_AddInterval("Rule_BuildFirstCaptureFrigate", 1)
	Rule_AddInterval("Rule_AddShipsToBuildQueue", 4.8) --one player every iteration
	Rule_AddInterval("Rule_ProduceQueuedShips", 3.8) --all players each iteration
end


function Rule_BuildFirstCaptureFrigate()
	--BUILD ONE CAPTURE FRIGATE AT THE START OF THE GAME
	local i = 0
	for i = 0,3 do
		if Player_IsAlive(i) == 1 and CPU_Exist(i) == 1 then
			AddShipToBuildQueue(i, PlayerStartTerritories[i], CAPTURE_FRIGATE)
		end
	end
	Rule_Remove("Rule_BuildFirstCaptureFrigate")
end


function Rule_AddShipsToBuildQueue()
	--ADD SHIPS THAT CPU PLAYERS WANT TO BUILD
	gCpuID_Build = gCpuID_Build + 1
	if gCpuID_Build == 4 then gCpuID_Build = 0 end
	
	if Player_IsAlive(gCpuID_Build) == 1 and CPU_Exist(gCpuID_Build) == 1 then
		--print(" ")
		--print(" ")
		--PrintMessage("******* Rule_AddShipsToBuildQueue IS RUNNING FOR PLAYER " .. gCpuID_Build .. " (RU: " .. Player_GetRU(gCpuID_Build) .. ")")
		
		if PlayerCommandPostCounts[gCpuID_Build] == 0 then
			return
		end
		
		local myRace = gPlayerRaces[gCpuID_Build]
		
		--see how much money this player has to spend
		local buildQueueSum = 0
		local idx = 0
		for idx = 1,getn(gCpuBuildQueue[gCpuID_Build]) do
			buildQueueSum = buildQueueSum + gShips[myRace][gCpuBuildQueue[gCpuID_Build][idx].ship].cost
		end
		--echo("buildQueueSum: " .. buildQueueSum)
		local availableMoney = Player_GetRU(gCpuID_Build) - buildQueueSum
		--PrintMessage("availableMoney before: " .. availableMoney)
		availableMoney = availableMoney - (availableMoney * CpuPlayerStats[gCpuID_Build].spendingBuffer)
		--PrintMessage("availableMoney after: " .. availableMoney)
		
		
		local postToBuildFrom = {}
		local possibleShipTypes = {}
		local shipToBuild = 0
		
		
		--build a capture frigate?
		local captureFrigs = Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(gCpuID_Build, "Hgn_MarineFrigate") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(gCpuID_Build, "Vgr_InfiltratorFrigate") + gQueuedCaptureFrigates[gCpuID_Build]
		--echo("captureFrigs: " .. captureFrigs)
		
		local buildCaptureFrig = 0
		if captureFrigs < gCaptureFrigateCap then
			buildCaptureFrig = 1
		end
		
		if buildCaptureFrig == 1 then
			--echo("NEED TO BUILD CAPTURE FRIGATE")
			if CPU_CanBuildShip(gCpuID_Build, CAPTURE_FRIGATE) == 1 then
				
				--FINISH: pick the best territory to build it from
				
				AddShipToBuildQueue(gCpuID_Build, CpuPlayerStats[gCpuID_Build].myCommandPosts[1][POST_ID], CAPTURE_FRIGATE)
				
				availableMoney = availableMoney - gShips[myRace][CAPTURE_FRIGATE].cost
				
				
			else
				--we need to save money for a capture frigate, so exit now
				return
			end
		end
		
		
		--don't continue if there are already some ships queued
		local queuedCount = getn(gCpuBuildQueue[gCpuID_Build])
		if queuedCount >= 5 then
			return
		end
		
		
		
		--build warships?
		local i = 0
		for i = 1,5 do
			if availableMoney <= 500 then
				return
			else
				postToBuildFrom = CpuPlayerStats[gCpuID_Build].myCommandPosts[random(1,PlayerCommandPostCounts[gCpuID_Build])] --random post for now
				possibleShipTypes = gCommandPostShips[myRace][postToBuildFrom[POST_TYPE]]
				shipToBuild = possibleShipTypes[random(1,getn(possibleShipTypes))]
				
				--PrintMessage("SEEING IF I CAN BUILD A " .. gShips[myRace][shipToBuild].name)
				
				if CPU_CanBuildShip(gCpuID_Build, shipToBuild) == 1 then
					AddShipToBuildQueue(gCpuID_Build, postToBuildFrom[POST_ID], shipToBuild)
					availableMoney = availableMoney - gShips[myRace][shipToBuild].cost
				--else
				--	PrintMessage("PLAYER " .. gCpuID_Build .. " CAN'T BUILD")
				end
			end
		end
		
		
		
		
	end
end


function CPU_CanBuildShip(iPlayerID, iShipType)
	--RETURNS 0 OR 1 IF THE PLAYER CAN BUILD THE GIVEN SHIP TYPE
	--echo("CPU_CanBuildShip IS RUNNING FOR PLAYER " .. iPlayerID .. " (RU: " .. Player_GetRU(iPlayerID) .. ", cost: " .. gShips[gPlayerRaces[iPlayerID]][iShipType].cost .. ")")
	if Player_GetRU(iPlayerID) < gShips[gPlayerRaces[iPlayerID]][iShipType].cost then
		--echo("returning a 0 because they don't have enough money")
		return 0
	else
		--echo("returning the results from CPU_GetVar")
		CPU_DoString(iPlayerID, "CanBuildShip(" .. gShips[gPlayerRaces[iPlayerID]][iShipType].shipID .. ")")
		return CPU_GetVar(iPlayerID, "returnNumber")
	end
end


function AddShipToBuildQueue(iPlayerID, iTerritoryID, iShipType)
	--THIS ADDS A SHIP TO THE BUILD QUEUE SO IT WILL BE PRODUCED AT THE CORRECT TIME
	--echo("-----------AddShipToBuildQueue IS RUNNING")
	local buildTime = gShips[gPlayerRaces[iPlayerID]][iShipType].time / gBuildSpeedMultiplier
	local timeToProduce = 0
	--echo("buildTime: " .. buildTime)
	
	--check the queue to see if this territory is already "building" a ship
	local idx = 0
	local queueCount = getn(gCpuBuildQueue[iPlayerID])
	--echo("queueCount: " .. queueCount)
	if queueCount > 0 then
		for idx = queueCount,1,-1 do
			if gCpuBuildQueue[iPlayerID][idx].territory == iTerritoryID then
				--echo("THIS TERRITORY IS ALREADY BUILDING A SHIP")
				timeToProduce = gCpuBuildQueue[iPlayerID][idx].time + buildTime
				break
			end
		end
	end
	if timeToProduce == 0 then
		--echo("THE TERRITORY WAS NOT BUILDING A SHIP")
		timeToProduce = gGameTime + buildTime
	end
	
	--PrintMessage("ADDING SHIP TO BUILD QUEUE FOR PLAYER " .. iPlayerID .. ": (territory: " .. iTerritoryID .. ", ship: " .. gShips[gPlayerRaces[iPlayerID]][iShipType].name .. ", time: " .. timeToProduce .. ")")
	tinsert(gCpuBuildQueue[iPlayerID], { territory=iTerritoryID, ship=iShipType, time=timeToProduce })
	--echo("getn(gCpuBuildQueue[" .. iPlayerID .. "]): " .. getn(gCpuBuildQueue[iPlayerID]))
	
	if iShipType == CAPTURE_FRIGATE then
		gQueuedCaptureFrigates[iPlayerID] = gQueuedCaptureFrigates[iPlayerID] + 1
	end
end


function Rule_ProduceQueuedShips()
	--PRODUCE THE QUEUED SHIPS FROM THE COMMAND POSTS
	local i = 0
	local shipType = 0
	local sobgroup = ""
	
	--FIX: this should loop and create all ships that a player should produce, not one at a time
	
	for i = 0,3 do
		if Player_IsAlive(i) == 1 and CPU_Exist(i) == 1 then
			if getn(gCpuBuildQueue[i]) > 0 then
				--time to spit out a ship?
				local myRace = gPlayerRaces[i]
				if gCpuBuildQueue[i][1].time <= gGameTime then
					shipType = gCpuBuildQueue[i][1].ship
					if CPU_CanBuildShip(i, shipType) == 1 then
						--PrintMessage("PLAYER " .. i .. " IS CREATING A " .. gShips[myRace][shipType].name .. " AT TERRITORY " .. gCpuBuildQueue[i][1].territory .. " (RU: " .. Player_GetRU(i) .. ")")
						sobgroup = SobGroup_CreateShip("CommandPost" .. gCpuBuildQueue[i][1].territory, gShips[myRace][shipType].name)
						AssignNewlyBuiltShip(i, gCpuBuildQueue[i][1].territory, shipType, sobgroup)
						Player_SetRU(i, Player_GetRU(i) - gShips[myRace][shipType].cost)
					end
					tremove(gCpuBuildQueue[i], 1) --remove it from queue even if they couldn't create it
					if shipType == CAPTURE_FRIGATE then
						gQueuedCaptureFrigates[i] = gQueuedCaptureFrigates[i] - 1
					end
				end
			end
		end
	end
end


function AssignNewlyBuiltShip(iPlayerID, iTerritoryID, iShipType, sRealTimeSobGroupName)
	--ASSIGN A NEWLY BUILT SQUADRON TO AN APPROPRIATE GROUP AND SET UP THE allSquads ENTRY
	local isWarship = 1 --set to 0 for capture frigates, minelayers, ...
	
	--add it to the allSquads table using the runtime sobgroup name
	local i = 0
	local idxToFill = 0
	local squadCount = CpuPlayerStats[iPlayerID].allSquadsCount
	for i = 1,squadCount do
		if CpuPlayerStats[iPlayerID].allSquads[i].name == "" then
			idxToFill = i
			break
		end
	end
	if idxToFill == 0 then
		AddEmptySlotsToAllSquadsTable(iPlayerID)
		idxToFill = squadCount + 1
	end
	CpuPlayerStats[iPlayerID].allSquads[idxToFill].name = sRealTimeSobGroupName
	CpuPlayerStats[iPlayerID].allSquads[idxToFill].shiptype = iShipType
	CpuPlayerStats[iPlayerID].allSquads[idxToFill].class = GetClassType(iShipType)
	CpuPlayerStats[iPlayerID].allSquads[idxToFill].location = GetParentID(iTerritoryID)
	
	
	--capture frigates
	if iShipType == CAPTURE_FRIGATE then
		isWarship = 0
		for i = 1,gCaptureFrigateCap do
			if CpuPlayerStats[iPlayerID].captureFrigates[i].name == "" then
				CpuPlayerStats[iPlayerID].captureFrigates[i].name = sRealTimeSobGroupName
				CpuPlayerStats[iPlayerID].captureFrigates[i].allSquadsID = idxToFill
				break
			end
		end
	end
	
	--warships
	if isWarship == 1 then
		SobGroup_SobGroupAdd("Player" .. iPlayerID .. "Warships", sRealTimeSobGroupName)
		--add it to the mySquads table where it was built
		AddCpuWarshipToTerritory(iPlayerID, idxToFill, GetParentID(iTerritoryID))
		CpuPlayerStats[iPlayerID].allSquads[idxToFill].isWarship = 1
		
		--set squad tactics
		--SobGroup_SetTactics(sRealTimeSobGroupName, PassiveTactics) --temp
		SobGroup_SetTactics(sRealTimeSobGroupName, AggressiveTactics)
	end
end


function GetClassType(iShipType)
	--RETURN THE SHIP CLASS FOR THE GIVEN SHIP TYPE
	local returnVal = 0
	if iShipType == FIGHTER1 or iShipType == FIGHTER2 or iShipType == FIGHTER3 or iShipType == FIGHTER4 then
		returnVal = FIGHTER
	elseif iShipType == CORVETTE1 or iShipType == CORVETTE2 then
		returnVal = CORVETTE
	elseif iShipType == FRIGATE1 or iShipType == FRIGATE2 or iShipType == FRIGATE3 then
		returnVal = FRIGATE
	elseif iShipType == CARRIER or iShipType == DESTROYER or iShipType == BATTLECRUISER then
		returnVal = CAPITAL
	elseif iShipType == PLATFORM1 or iShipType == PLATFORM2 then
		returnVal = PLATFORM
	elseif iShipType == CAPTURE_FRIGATE or iShipType == REPAIR_SHIP or iShipType == MINELAYER then
		returnVal = UTILITY --utility ships are handled differently
	end
	return returnVal
end





