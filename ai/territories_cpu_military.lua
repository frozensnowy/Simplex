

--THIS RUNS IN GAME RULE SCOPE


CpuPlayerStats = 
{
	[0] = {},
	[1] = {},
	[2] = {},
	[3] = {},
}


gCaptureFrigateCap = 0 --population cap for capture frigates


--counters to iterate through CPU players one at a time
gCpuID_Capture = -1
gCpuID_Transit = -1
gCpuID_DeadSquads = -1
gCpuID_MyTerritories = -1


--indexes for myCommandPosts tables
POST_ID = 1
POST_TYPE = 2





--*********** INITIAL SETUP ***********

function AddRules()
	
	--build rules
	AddCpuBuildRules()
	
	--transit rule
	Rule_AddInterval("Rule_IssueOrdersToInTransitShips", 2.3)
	
	--capture frigates
	Rule_AddInterval("Rule_ManageCaptureFrigates", 3.7)
	
	--per-territory stats and orders
	Rule_AddInterval("Rule_SetupPerTerritoryCheck", 10)
	
	--rule to update allSquads tables
	Rule_AddInterval("Rule_DeleteDeadSquads", 4.7)
	
	--update myTerritories tables
	Rule_AddInterval("Rule_UpdateMyTerritories", 5.3)
	
	
	
	--TEST RULES:
	
	--Rule_AddInterval("Rule_PrintCpuMoney", 1)
	--Rule_AddInterval("Rule_BuildTest", 2)
	--Rule_AddInterval("Rule_PrintInfo", 3)
	
	--Rule_AddInterval("Rule_WriteFrigateStatus", 0.5)
	
	--Rule_AddInterval("Rule_WriteCpuCommandPosts", 2)
	
	--Rule_AddInterval("Rule_WriteAllSquadsTableToScreen", 8)
	--Rule_AddInterval("Rule_WriteMySquadsTableToScreen", 8)
	
	--Rule_AddInterval("Rule_PrintLocation", 2)
	
	--Rule_AddInterval("Rule_PrintMyTerritories", 8)
	
	
end


function SetupCpuInformation()
	
	--set up gBuildSpeedMultiplier
	if gBuildSpeedSetting == 1 then
		gBuildSpeedMultiplier = 2.5
	elseif gBuildSpeedSetting == 2 then
		gBuildSpeedMultiplier = 5
	end
	
	--set up capture frigate unit cap
	if gUnitCapSetting == "Small" then
		gCaptureFrigateCap = 2
	elseif gUnitCapSetting == "Normal" then
		gCaptureFrigateCap = 4
	elseif gUnitCapSetting == "Large" then
		gCaptureFrigateCap = 6
	elseif gUnitCapSetting == "Unlimited" then
		gCaptureFrigateCap = 8
	end
	
	--ship info
	local idx = 0
	local ship = {}
	for idx,ship in gShips[1] do
		ship.shipID = GetShipId(ship.name)
	end
	for idx,ship in gShips[2] do
		ship.shipID = GetShipId(ship.name)
	end
	
	
	
	--territory neighbours
	if AuditMap > 0 then print(" ") end
	local i = 0
	local j = 0
	local connection1 = 0
	local connection2 = 0
	local connection1parentID = 0
	local connection2parentID = 0
	for i = 1,getn(TerritoryConnections) do
		connection1 = TerritoryConnections[i][1]
		connection2 = TerritoryConnections[i][2]
		connection1parentID = TerritoryStats[connection1][PARENTID]
		connection2parentID = TerritoryStats[connection2][PARENTID]
		
		if connection2 == connection1parentID or connection1 == connection2parentID then
			--child connected to its own parent territory
			if AuditMap > 0 then print("FOUND A CHILD TERRITORY CONNECTED TO IT'S OWN PARENT (" .. connection1 .. " --> " .. connection2 .. ")") end
		else
			if connection1parentID == PARENT then
				if connection2parentID == PARENT then
					TerritoryStats[connection1][NEIGHBOURS]["terr" .. connection2] = { connection2, PARENT_TO_PARENT }
					TerritoryStats[connection2][NEIGHBOURS]["terr" .. connection1] = { connection1, PARENT_TO_PARENT }
				else --connection2 is a child territory
					TerritoryStats[connection1][NEIGHBOURS]["terr" .. connection2parentID] = { connection2parentID, PARENT_TO_CHILD, connection2 }
					TerritoryStats[connection2parentID][NEIGHBOURS]["terr" .. connection1] = { connection1, CHILD_TO_PARENT, connection2 }
				end
			else --connection1 is a child territory
				if connection2parentID == PARENT then
					TerritoryStats[connection1parentID][NEIGHBOURS]["terr" .. connection2] = { connection2, CHILD_TO_PARENT, connection1 }
					TerritoryStats[connection2][NEIGHBOURS]["terr" .. connection1parentID] = { connection1parentID, PARENT_TO_CHILD, connection1 }
				else --connection2 is a child territory
					if connection1parentID == connection2parentID then
						--internal connection (gates are both inside the same parent territory)
						if AuditMap > 0 then print("FOUND AN INTERNAL CONNECTION (" .. connection1 .. " --> " .. connection2 .. ") (inside territory " .. connection1parentID .. ")") end
					else
						TerritoryStats[connection1parentID][NEIGHBOURS]["terr" .. connection2parentID] = { connection2parentID, CHILD_TO_CHILD, connection1, connection2 }
						TerritoryStats[connection2parentID][NEIGHBOURS]["terr" .. connection1parentID] = { connection1parentID, CHILD_TO_CHILD, connection2, connection1 }
					end
				end
			end
		end
	end
	
	
	--overlapping neighbours
	--(not handled yet)
	
	
	
	
	
	
	
	
	--set up child/player stats for each parent territory
	--print(" ")
	local territoryID = 0
	local playerID = 0
	local k = 0
	local childStats = {}
	for i = 1,getn(gParentTerritoryIDs) do
		territoryID = gParentTerritoryIDs[i]
		--echo("CHECKING PARENT TERRITORY " .. territoryID)
		
		childStats = GetTerritoryChildStatsEntry()
		childStats[totalPayoutFromAllPosts] = TerritoryStats[territoryID][PAYOUT_RATE]
		
		SobGroup_Create("Territory" .. territoryID .. "PostsAndGates") --all posts/gates in this territory
		SobGroup_SetSwitchOwnerFlag("Territory" .. territoryID .. "PostsAndGates", 0)
		SobGroup_SobGroupAdd("Territory" .. territoryID .. "PostsAndGates", "Territory" .. territoryID .. "JumpGates")
		if TerritoryStats[territoryID][BUILDTYPE] ~= EMPTY then
			SobGroup_SobGroupAdd("Territory" .. territoryID .. "PostsAndGates", "CommandPost" .. territoryID)
			childStats[totalPostCount] = childStats[totalPostCount] + 1
		end
		
		--set up child stats
		for j = 1,getn(gChildTerritoryIDs) do
			childID = gChildTerritoryIDs[j]
			if TerritoryStats[childID][PARENTID] == territoryID then
				--echo("  CHECKING CHILD TERRITORY " .. childID)
				childStats[numChildren] = childStats[numChildren] + 1
				childStats[totalPayoutFromAllPosts] = childStats[totalPayoutFromAllPosts] + TerritoryStats[childID][PAYOUT_RATE]
				
				if TerritoryStats[childID][BUILDTYPE] == EMPTY then
					--nothin
				else
					SobGroup_SobGroupAdd("Territory" .. territoryID .. "PostsAndGates", "CommandPost" .. childID)
					
					if TerritoryStats[childID][BUILDTYPE] == RESOURCE_ONLY then
						childStats[numRUGenerators] = childStats[numRUGenerators] + 1
						tinsert(childStats[ruGeneratorIDs], childID)
					else --it must be a command post
						childStats[numCommandPosts] = childStats[numCommandPosts] + 1
						tinsert(childStats[commandPostIDs], childID)
					end
				end
				
				SobGroup_SobGroupAdd("Territory" .. territoryID .. "PostsAndGates", "Territory" .. childID .. "JumpGates")
			end
		end
		
		childStats[totalPostCount] = childStats[totalPostCount] + childStats[numRUGenerators] + childStats[numCommandPosts]
		childStats[unclaimedCount] = childStats[totalPostCount]
		
		--PrintMessage("COUNT OF Territory" .. territoryID .. "PostsAndGates: " .. SobGroup_Count("Territory" .. territoryID .. "PostsAndGates"))
		
		--neighbour counts
		local neighbour = {}
		local counter = 0
		for j,neighbour in TerritoryStats[territoryID][NEIGHBOURS] do
			if j ~= "n" then
				counter = counter + 1
			end
		end
		childStats[neighbourCount] = counter
		
		TerritoryStats[territoryID][CHILDSTATS] = childStats
		
		
		--setup associates
		TerritoryStats[territoryID][ASSOCIATES] = {}
		
		
		--set up player stats
		TerritoryStats[territoryID][PLAYERSTATS] = { [0]={}, [1]={}, [2]={}, [3]={} }
		for playerID = 0,3 do
			if Player_IsAlive(playerID) == 1 then
				TerritoryStats[territoryID][PLAYERSTATS][playerID] = GetTerritoryPlayerStatsEntry()
				if CPU_Exist(playerID) == 1 then
					SobGroup_Create("Territory" .. territoryID .. "Player" .. playerID .. "DefenceForce")
					SobGroup_Create("Territory" .. territoryID .. "Player" .. playerID .. "AttackForce")
				end
			end
		end
	end
	--print(" ")
	
	
	
--	print(" ")
--	local str = ""
--	echo("TERRITORY NEIGHBOURS:")
--	for i = 1,BoardStats.numTerritories do
--		territoryID = i
--		
--		str = "TERRITORY " .. territoryID .. ": "
--		if TerritoryStats[territoryID][PARENTID] == PARENT then
--			str = str .. " (" .. TerritoryStats[territoryID][CHILDSTATS][neighbourCount] .. " neighbours)"
--		else
--			str = str .. " (this is a child territory)"
--		end
--		print(str)
--		
--		local neighbour = 0
--		for j,neighbour in TerritoryStats[territoryID][NEIGHBOURS] do
--			if j ~= "n" then
--				print("  " .. TerritoryStats[territoryID][NEIGHBOURS][j][1] .. " (" .. GetNeighbourTypeName(TerritoryStats[territoryID][NEIGHBOURS][j][2]) .. ")")
--			end
--		end
--		print(" ")
--	end
--	print(" ")
	
	
	
	DeterminePaths()
	
	
	
end



function SetupCpuPlayers()
	local playerID = 0
	local playerID2 = 0
	local difficultySetting = 0
	local spendingBuffer = 0
	local i = 0
	for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 then
			SobGroup_Create("Player" .. playerID .. "ShipsInThisTerritory") --used by the per-territory rules
			if CPU_Exist(playerID) == 1 then
				difficultySetting = CPU_GetVar(playerID, "gDifficultyLevel")
				
				CpuPlayerStats[playerID] = 
				{
					captureFrigates = {},
					
					myCommandPosts = {}, --list of command posts this player owns (buildable only) (ID and type)
					myTerritories = {},  --list of parent territories the player will divide his ships between
					
					allSquads = {},
					allSquadsCount = 0, --count of the allSquads entries, not the number of alive squads
					
					warshipCount = 0,   --total count of alive warships
					totalThreat = 0,	--threat from all myTerritories added together
					
					difficultySetting = difficultySetting,
					spendingBuffer = 0,	   --percentage of money that shouldn't be spent on building
					
					--allies and enemies
					hasAllies = 0,	--0 or 1
					allies = {},	--list of player ID's
					enemies = {},
					
					--other:
					--numRUGeneratorsOwned = 0,
					--numCommandPostsOwned = 0,
					--totalIncomePerMinute = 0, --use the player payout table to determine this value
					--canBuildFighter = 0,
					--canBuildCorvette = 0,
					--canBuildFrigate = 0,
					--canBuildCapital = 0,
				}
				
				for i = 1,gCaptureFrigateCap do
					CpuPlayerStats[playerID].captureFrigates[i] = 
					{
						name = "",
						status = SEARCHING,
						allSquadsID = 0,
						parentTarget = 0,	--parent territory this capture frigate is going after
						specificTarget = 0,	--actual territory the frigate is going after
					}
				end
				
				SobGroup_Create("Player" .. playerID .. "InTransitShips") --contains all ships in transit mode
				SobGroup_Create("Player" .. playerID .. "Warships") --contains all combat ships (no capture frigates/minelayers)
				
				--used by the per-territory rules
				SobGroup_Create("Player" .. playerID .. "EnemyShipsInThisTerritory")
				SobGroup_Create("Player" .. playerID .. "ShipsToGuardInThisTerritory")
				
				AddEmptySlotsToAllSquadsTable(playerID)
				AddTerritoryToMyTerritories(playerID, GetParentID(PlayerStartTerritories[playerID]))
				
				--set up spending buffer
				if gJumpCost == 0 then
					spendingBuffer = 0
				elseif gJumpCost == 50 then
					spendingBuffer = 0.05
				elseif gJumpCost == 100 then
					spendingBuffer = 0.10
				elseif gJumpCost == 200 then
					spendingBuffer = 0.15
				end
				
				if difficultySetting == 0 then --easy
					spendingBuffer = spendingBuffer + 0.30
				elseif difficultySetting == 1 then --standard
					spendingBuffer = spendingBuffer + 0.20
				elseif difficultySetting == 2 then --hard
					spendingBuffer = spendingBuffer + 0.10
				elseif difficultySetting == 3 then --expert
					--nothin
				end
				
				CpuPlayerStats[playerID].spendingBuffer = spendingBuffer
				--PrintMessage("PLAYER " .. playerID .. " difficultySetting: " .. difficultySetting .. ", spendingBuffer: " .. spendingBuffer)
				
				
				--allies and enemies
				local allyCounter = 0
				local enemyCounter = 0
				for playerID2 = 0,3 do
					if playerID ~= playerID2 and Player_IsAlive(playerID2) == 1 then
						if AreAllied(playerID, playerID2) == 1 then
							CpuPlayerStats[playerID].hasAllies = 1
							allyCounter = allyCounter + 1
							CpuPlayerStats[playerID].allies[allyCounter] = playerID2
						else
							enemyCounter = enemyCounter + 1
							CpuPlayerStats[playerID].enemies[enemyCounter] = playerID2
						end
					end
				end
				--PrintMessage("PLAYER " .. playerID .. " ALLIES: " .. PrintTableAsString(CpuPlayerStats[playerID].allies))
				--PrintMessage("PLAYER " .. playerID .. " ENEMIES: " .. PrintTableAsString(CpuPlayerStats[playerID].enemies))
				--PrintMessage(" ")
				
				
			end
		end
	end
	
	
	SobGroup_Create("AllShipsInThisTerritory") --used by the per-territory rules
	
	
	--add all rules
	AddRules()
	
	
--	local terr1 = 1
--	local terr2 = 2
--	PrintMessage("JUMP GATE NAME FOR " .. terr1 .. " TO " .. terr2 .. ": " .. GetJumpGateName(terr1, terr2))
--	
--	terr1 = 1
--	terr2 = 66
--	PrintMessage("JUMP GATE NAME FOR " .. terr1 .. " TO " .. terr2 .. ": " .. GetJumpGateName(terr1, terr2))
--	
--	terr1 = 66
--	terr2 = 12
--	PrintMessage("JUMP GATE NAME FOR " .. terr1 .. " TO " .. terr2 .. ": " .. GetJumpGateName(terr1, terr2))
--	
--	terr1 = 68
--	terr2 = 69
--	PrintMessage("JUMP GATE NAME FOR " .. terr1 .. " TO " .. terr2 .. ": " .. GetJumpGateName(terr1, terr2))
	
	
end










--*********** TEMPORARY STUFF ***********

function Rule_PrintCpuMoney()
	local playerID = 1
	PrintMessage("CPU " .. playerID .. " MONEY: " .. Player_GetRU(playerID))
end


function Rule_BuildTest()
	--Player_SetRU(1, Player_GetRU(1)-100)
	PrintMessage("CPU CAN BUILD MARINE FRIG? " .. CPU_CanBuildShip(1, CAPTURE_FRIGATE) .. " (COUNT: " .. Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(1, "Hgn_MarineFrigate") .. ", MONEY: " .. Player_GetRU(1) .. ")")
end


function Rule_PrintInfo()
	--echo("SobGroup_Count(Player1InTransitShips): " .. SobGroup_Count("Player1InTransitShips"))
	PrintMessage("unclaimedCount FOR TERRITORY 66: " .. TerritoryStats[66][CHILDSTATS][unclaimedCount])
end


function Rule_WriteCpuCommandPosts()
	local playerID = 1
	local i = 0
	local str = "PLAYER " .. playerID .. " COMMAND POSTS: { "
	for i = 1,getn(CpuPlayerStats[playerID].myCommandPosts) do
		str = str .. CpuPlayerStats[playerID].myCommandPosts[i][POST_ID] .. ", "
	end
	str = str .. "}"
	PrintMessage(str)
end


function Rule_PrintLocation()
	PrintMessage(CpuPlayerStats[1].allSquads[1].name .. " LOCATION: " .. CpuPlayerStats[1].allSquads[1].location)
end










--*********** MISC AI STUFF ***********

function CpuPlayerGainedTerritory(iPlayerID, iTerritoryID)
	--CALLED WHEN A CPU PLAYER CAPTURES A NEW TERRITORY
	local buildType = TerritoryStats[iTerritoryID][BUILDTYPE]
	
	if buildType == EMPTY then
		--this should never happen
	elseif buildType == RESOURCE_ONLY then
		--??
	else
		--it must be a command post that can build
		tinsert(CpuPlayerStats[iPlayerID].myCommandPosts, { iTerritoryID, buildType })
	end
	
	--increment postsOwned
	--local parentID = GetParentID(iTerritoryID)
	--TerritoryStats[parentID][PLAYERSTATS][iPlayerID].postsOwned = TerritoryStats[parentID][PLAYERSTATS][iPlayerID].postsOwned + 1
end


function CpuPlayerLostTerritory(iPlayerID, iTerritoryID)
	--CALLED WHEN A CPU PLAYER LOSES A TERRITORY TO ANOTHER PLAYER
	local buildType = TerritoryStats[iTerritoryID][BUILDTYPE]
	
	if buildType == EMPTY then
		--this should never happen
	elseif buildType == RESOURCE_ONLY then
		--??
	else
		--it must be a command post that can build
		--PrintMessage("CPU PLAYER " .. iPlayerID .. " JUST LOST COMMAND POST " .. iTerritoryID)
		
		--remove it from myCommandPosts table
		local idx = 0
		for idx = getn(CpuPlayerStats[iPlayerID].myCommandPosts),1,-1 do
			if CpuPlayerStats[iPlayerID].myCommandPosts[idx][POST_ID] == iTerritoryID then
				tremove(CpuPlayerStats[iPlayerID].myCommandPosts, idx)
				break
			end
		end
		
		--also remove any queued ships for that post
		for idx = getn(gCpuBuildQueue[iPlayerID]),1,-1 do
			if gCpuBuildQueue[iPlayerID][idx].territory == iTerritoryID then
				--PrintMessage("REMOVING ENTRY FROM BUILD QUEUE FOR PLAYER " .. iPlayerID .. ", TERRITORY " .. iTerritoryID .. " (SHIP: " .. gCpuBuildQueue[iPlayerID][idx].ship .. ")")
				tremove(gCpuBuildQueue[iPlayerID], idx)
			end
		end
	end
	
	--decrement postsOwned
	--local parentID = GetParentID(iTerritoryID)
	--TerritoryStats[parentID][PLAYERSTATS][iPlayerID].postsOwned = TerritoryStats[parentID][PLAYERSTATS][iPlayerID].postsOwned - 1
end


function GetTransitStatusName(iStatus)
	local returnVal = ""
	if iStatus == STARTING then
		returnVal = "STARTING"
	elseif iStatus == MOVING then
		returnVal = "MOVING"
	elseif iStatus == JUMPING then
		returnVal = "JUMPING"
	elseif iStatus == CAPTURING_GATE then
		returnVal = "CAPTURING_GATE"
	end
	return returnVal
end


function GetNeighbourTypeName(iNeighbourType)
	local returnVal = ""
	if iNeighbourType == PARENT_TO_PARENT then
		returnVal = "PARENT_TO_PARENT"
	elseif iNeighbourType == PARENT_TO_CHILD then
		returnVal = "PARENT_TO_CHILD"
	elseif iNeighbourType == CHILD_TO_PARENT then
		returnVal = "CHILD_TO_PARENT"
	elseif iNeighbourType == CHILD_TO_CHILD then
		returnVal = "CHILD_TO_CHILD"
	elseif iNeighbourType == OVERLAPPING then
		returnVal = "OVERLAPPING"
	end
	return returnVal
end


function GetCaptureFrigateStatusName(iStatus)
	local returnVal = ""
	if iStatus == SEARCHING then
		returnVal = "SEARCHING"
	elseif iStatus == WAITING then
		returnVal = "WAITING"
	elseif iStatus == TRANSIT then
		returnVal = "TRANSIT"
	elseif iStatus == CAPTURING then
		returnVal = "CAPTURING"
	end
	return returnVal
end












--*********** STUFF FOR STORING ALL CPU PLAYER SQUADRONS ***********

function AddEmptySlotsToAllSquadsTable(iPlayerID)
	--ADD MORE EMPTY SLOTS TO STORE SHIPS IN THE allSquads TABLE
	local i = 0
	local numberToAdd = 10
	local count = CpuPlayerStats[iPlayerID].allSquadsCount
	for i = 1,numberToAdd do
		CpuPlayerStats[iPlayerID].allSquads[count+i] = 
		{
			name = "",		--name of sobgroup (real-time sobgroup generated by HW2 when built)
			shiptype = 0,	--ID from the gShips table (ex: FIGHTER1, FIGHTER2)
			class = 0,		--class of the squadron (fighter, corvette, ...)
			location = 0,	--parent territory this squad is currently in
			isWarship = 0,	--0 or 1 whether or not the squadron is a warship (not a capture frigate or minelayer)
			inTransit = 0,	--0 or 1 whether or not the squadron is in transit mode
		}
	end
	CpuPlayerStats[iPlayerID].allSquadsCount = count + numberToAdd
end


function Rule_DeleteDeadSquads()
	--SCAN THROUGH THE allSquads TABLE AND CLEAR ENTRIES THAT HAVE BEEN DESTROYED
	gCpuID_DeadSquads = gCpuID_DeadSquads + 1
	if gCpuID_DeadSquads == 4 then gCpuID_DeadSquads = 0 end
	
	if Player_IsAlive(gCpuID_DeadSquads) == 1 and CPU_Exist(gCpuID_DeadSquads) == 1 then
		local i = 0
		local j = 0
		local squad = {}
		local warshipCount = 0
		for i = 1,CpuPlayerStats[gCpuID_DeadSquads].allSquadsCount do
			squad = CpuPlayerStats[gCpuID_DeadSquads].allSquads[i]
			if squad.name ~= "" then
				if SobGroup_Empty(squad.name) == 1 then --the ship has been destroyed
					--clear the mySquads entry, if applicable
					if squad.isWarship == 1 and squad.inTransit == 0 then
						RemoveCpuWarshipFromTerritory(gCpuID_DeadSquads, i, squad.location)
					end
					
					--clear the allSquads entry
					squad.name = ""
					squad.shiptype = 0
					squad.location = 0
				else
					if squad.isWarship == 1 then
						warshipCount = warshipCount + 1
					end
				end
			end
		end
		CpuPlayerStats[gCpuID_DeadSquads].warshipCount = warshipCount
	end
end


function PrintAllSquadsTable(iPlayerID)
	print(" ")
	PrintMessage("********** allSquads TABLE CONTENTS FOR PLAYER " .. iPlayerID)
	local i = 0
	local squad = {}
	local str = ""
	for i = 1,CpuPlayerStats[iPlayerID].allSquadsCount do
		squad = CpuPlayerStats[iPlayerID].allSquads[i]
		str = "    " .. i .. ": "
		if squad.name == "" then
			str = str .. "empty"
		else
			str = str .. squad.name .. " (type: " .. squad.shiptype .. ") (class: " .. squad.class .. ") (location: " .. squad.location .. ")"
		end
		PrintMessage(str)
	end
	print(" ")
end


function Rule_WriteAllSquadsTableToScreen()
	local playerIDToPrint = 1
	PrintAllSquadsTable(playerIDToPrint)
end


function PrintMySquadsTable(iTerritoryID, iPlayerID)
	print(" ")
	PrintMessage("********** mySquads TABLE CONTENTS FOR TERRITORY " .. iTerritoryID .. " PLAYER " .. iPlayerID)
	local i = 0
	local squadID = 0
	local squad = {}
	for i = 1,getn(TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads) do
		squadID = TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads[i]
		squad = CpuPlayerStats[iPlayerID].allSquads[squadID]
		PrintMessage("    (" .. squadID .. "): " .. squad.name .. " (type: " .. squad.shiptype .. ") (class: " .. squad.class .. ") (location: " .. squad.location .. ")")
	end
	print(" ")
end


function Rule_WriteMySquadsTableToScreen()
	PrintMessage(" ")
	PrintMySquadsTable(25, 1)
	PrintMessage(" ")
	PrintMySquadsTable(20, 1)
	PrintMessage(" ")
	PrintMySquadsTable(15, 1)
end


function AddCpuWarshipToTerritory(iPlayerID, iAllSquadsID, iTerritoryID)
	--add it to mySquads table
	--echo("AddCpuWarshipToTerritory WAS CALLED (player: " .. iPlayerID .. ", squad: " .. iAllSquadsID .. ", territory: " .. iTerritoryID .. ")")
	tinsert(TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads, iAllSquadsID)
	
	--add it to attack force or defence force
	local groupToAssign = "DefenceForce"
	if random(1,100) <= 50 then
		groupToAssign = "AttackForce"
	end
	SobGroup_SobGroupAdd("Territory" .. iTerritoryID .. "Player" .. iPlayerID .. groupToAssign, CpuPlayerStats[iPlayerID].allSquads[iAllSquadsID].name)
	
	
	
	--adjust territory player stats accordingly (numfighters,...)
	
	
	
end


function RemoveCpuWarshipFromTerritory(iPlayerID, iAllSquadsID, iTerritoryID)
	--remove it from mySquads table
	local i = 0
	for i = getn(TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads),1,-1 do
		if TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads[i] == iAllSquadsID then
			tremove(TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads, i)
			break
		end
	end
	
	--remove it from attack/defence force
	SobGroup_SobGroupRemove("Territory" .. iTerritoryID .. "Player" .. iPlayerID .. "DefenceForce", CpuPlayerStats[iPlayerID].allSquads[iAllSquadsID].name)
	SobGroup_SobGroupRemove("Territory" .. iTerritoryID .. "Player" .. iPlayerID .. "AttackForce", CpuPlayerStats[iPlayerID].allSquads[iAllSquadsID].name)
	
	
	
	--adjust territory player stats accordingly (numfighters,...)
	
	
	
end



--FINISH: make a rule that runs less often and check for lots of empty records in the allSquads table, truncate the table accordingly (move all squads to the front of the list and cut off the empty ones at the end).










--*********** CHECK ONE TERRITORY AT A TIME ***********

gPerTerritoryRuleInterval = 0 --how often the per-territory rule will run (faster if more territories)
gParentTableIndex = 0 --used to loop through one parent territory at a time

PlayerHasShipsHere = { [0]=0, [1]=0, [2]=0, [3]=0 } --0 or 1 for whether a player has ships in the current territory


function Rule_SetupPerTerritoryCheck()
	--determine how often the per-territory code will run
	--(one rule runs to gather info about the territory, then another runs 0.1 seconds later to issue orders)
	local parentCount = getn(gParentTerritoryIDs)
	if parentCount <= 5 then
		gPerTerritoryRuleInterval = 2
	elseif parentCount <= 10 then
		gPerTerritoryRuleInterval = 1
	elseif parentCount <= 20 then
		gPerTerritoryRuleInterval = 0.6
	elseif parentCount <= 35 then
		gPerTerritoryRuleInterval = 0.4
	else
		gPerTerritoryRuleInterval = 0.2 --0.2 is the minimum because the other rule runs 0.1 later
	end
	
	--PrintMessage("Parent territories: " .. parentCount .. ",  Per-territory rule interval: " .. gPerTerritoryRuleInterval)
	
	--print(" ")
	--local i = 0
	--for i = 1,100 do
	--	print(i .. ": " .. format("%.1f", 10/i))
	--end
	--print(" ")
	
	Rule_AddInterval("Rule_UpdateTerritoryStats", gPerTerritoryRuleInterval)
	Rule_AddInterval("Rule_AddIssueOrdersRule", 0.2)
	
	Rule_Remove("Rule_SetupPerTerritoryCheck")
end


function Rule_AddIssueOrdersRule()
	Rule_AddInterval("Rule_IssueOrdersToTerritorySquads", gPerTerritoryRuleInterval)
	Rule_Remove("Rule_AddIssueOrdersRule")
end


function Rule_UpdateTerritoryStats()
	--LOOK AT ONE PARENT TERRITORY AT A TIME AND DETERMINE ALL STATS
	gParentTableIndex = gParentTableIndex + 1
	if gParentTableIndex > getn(gParentTerritoryIDs) then gParentTableIndex = 1 end
	local thisTerritoryID = gParentTerritoryIDs[gParentTableIndex]
	--print(" ")
	--if gParentTableIndex == 1 then print("----------------------------------------------------------------------------------------------") end
	--echo("************** Rule_UpdateTerritoryStats IS RUNNING (TERRITORY " .. thisTerritoryID .. ")")
	
	SobGroup_Clear("AllShipsInThisTerritory")
	SobGroup_Clear("TerritoryTempSobGroup1")
	
	local playerID = 0
	local playerID2 = 0
	
	--fill AllShipsInThisTerritory and PlayerXShipsInThisTerritory
	for playerID = 0,3 do
		PlayerHasShipsHere[playerID] = 0
		if Player_IsAlive(playerID) == 1 then
			SobGroup_Clear("Player" .. playerID .. "ShipsInThisTerritory")
			Player_FillSobGroupInVolume("TerritoryTempSobGroup1", playerID, "TerritoryVolume" ..thisTerritoryID)
			if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
				SobGroup_FillSubstract("Player" .. playerID .. "ShipsInThisTerritory", "TerritoryTempSobGroup1", "Territory" .. thisTerritoryID .. "PostsAndGates")
				if SobGroup_Empty("Player" .. playerID .. "ShipsInThisTerritory") == 0 then
					PlayerHasShipsHere[playerID] = 1
					SobGroup_SobGroupAdd("AllShipsInThisTerritory", "Player" .. playerID .. "ShipsInThisTerritory")
				end
				SobGroup_Clear("TerritoryTempSobGroup1")
			end
			
			--clear CPU sobgroups for this territory
			if CPU_Exist(playerID) == 1 then
				SobGroup_Clear("Player" .. playerID .. "EnemyShipsInThisTerritory")
				SobGroup_Clear("Player" .. playerID .. "ShipsToGuardInThisTerritory")
			end
			
			--print("  COUNT OF Player" .. playerID .. "ShipsInThisTerritory: " .. SobGroup_Count("Player" .. playerID .. "ShipsInThisTerritory"))
		end
	end
	
	--print("  COUNT OF AllShipsInThisTerritory: " .. SobGroup_Count("AllShipsInThisTerritory"))
	
	
	--set up EnemyShipsInThisTerritory and ShipsToGuardInThisTerritory for each CPU player
	for playerID = 0,3 do
		if PlayerHasShipsHere[playerID] == 1 and CPU_Exist(playerID) == 1 then
			if getn(TerritoryStats[thisTerritoryID][PLAYERSTATS][playerID].mySquads) > 0 then
				
				--loop through enemies and look for enemy ships in this territory
				for idx,playerID2 in CpuPlayerStats[playerID].enemies do
					if PlayerHasShipsHere[playerID2] == 1 then
						SobGroup_SobGroupAdd("Player" .. playerID .. "EnemyShipsInThisTerritory", "Player" .. playerID2 .. "ShipsInThisTerritory")
					end
				end
				
				
				--command posts should be guarded
				SobGroup_Clear("TerritoryTempSobGroup1")
				SobGroup_FillCompare("TerritoryTempSobGroup1", "Player_Ships" .. playerID, "Territory" .. thisTerritoryID .. "PostsAndGates")
				if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
					SobGroup_SobGroupAdd("Player" .. playerID .. "ShipsToGuardInThisTerritory", "TerritoryTempSobGroup1")
					SobGroup_Clear("TerritoryTempSobGroup1")
				end
				
				--capture frigates should be guarded
				SobGroup_FillShipsByType("TerritoryTempSobGroup1", "Player" .. playerID .. "ShipsInThisTerritory", gShips[gPlayerRaces[playerID]][CAPTURE_FRIGATE].name)
				if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
					SobGroup_SobGroupAdd("Player" .. playerID .. "ShipsToGuardInThisTerritory", "TerritoryTempSobGroup1")
					SobGroup_Clear("TerritoryTempSobGroup1")
				end
				
				--also guard posts owned by allied players??
				
				
			end
		end
	end
	
	
	--print(" ")
	
end


function Rule_IssueOrdersToTerritorySquads()
	--ISSUE ORDER TO ANY CPU SHIPS IN THE CURRENT TERRITORY (this runs right after Rule_UpdateTerritoryStats)
	local thisTerritoryID = gParentTerritoryIDs[gParentTableIndex]
	--print(" ")
	--echo("************** Rule_IssueOrdersToTerritorySquads IS RUNNING (TERRITORY " .. thisTerritoryID .. ")")
	
	local defenceForce = ""
	local attackForce = ""
	local enemyShipsPresent = 0
	local shipDiff = 0
	local neighbourToMoveTo = 0
	local i = 0
	local neighbour = {}
	local smallestShipDiff = 0
	local neighbourShipDiff = 0
	local squadToMove = 0
	local mySquads = 0
	
	local playerID = 0
	for playerID = 0,3 do
		if PlayerHasShipsHere[playerID] == 1 and CPU_Exist(playerID) == 1 then
			
			
			--move warships to other territories?
			shipDiff = GetShipDifferential(playerID, thisTerritoryID)
			--PrintMessage("  shipDiff: " .. shipDiff)
			
			if shipDiff >= 2 then
				--move some ships to a neighbouring territory
				neighbourToMoveTo = 0
				smallestShipDiff = 9999
				
				for i,neighbour in TerritoryStats[thisTerritoryID][NEIGHBOURS] do
					if IsThisTerritoryInMyTerritories(playerID, neighbour[1]) == 1 then
						neighbourShipDiff = GetShipDifferential(playerID, neighbour[1])
						if neighbourShipDiff < smallestShipDiff then
							smallestShipDiff = neighbourShipDiff
							neighbourToMoveTo = neighbour[1]
						end
					end
				end
				
				if neighbourToMoveTo ~= 0 then
					--move half the excess ships there
					--PrintMessage("PLAYER " .. playerID .. " MOVING " .. floor(shipDiff/2) .. " SHIPS FROM TERRITORY " .. thisTerritoryID .. " TO " .. neighbourToMoveTo)
					mySquads = TerritoryStats[thisTerritoryID][PLAYERSTATS][playerID].mySquads
					for i = 1,floor(shipDiff/2) do
						squadToMove = mySquads[random(1,getn(mySquads))]
						PlaceSquadInTransit(playerID, squadToMove, {thisTerritoryID,neighbourToMoveTo})
					end
				end
			end
			
			
			
			
			defenceForce = "Territory" .. thisTerritoryID .. "Player" .. playerID .. "DefenceForce"
			attackForce = "Territory" .. thisTerritoryID .. "Player" .. playerID .. "AttackForce"
			enemyShipsPresent = 0
			if SobGroup_Empty("Player" .. playerID .. "EnemyShipsInThisTerritory") == 0 then
				enemyShipsPresent = 1
			end
			
			--defence group
			if SobGroup_Empty(defenceForce) == 0 then
				if SobGroup_Empty("Player" .. playerID .. "ShipsToGuardInThisTerritory") == 0 then
					if enemyShipsPresent == 1 then
						--anybody capturing our ships?
						SobGroup_Clear("TerritoryTempSobGroup1")
						SobGroup_GetSobGroupCapturingGroup("Player" .. playerID .. "ShipsToGuardInThisTerritory", "TerritoryTempSobGroup1")
						if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
							SobGroup_Attack(playerID, defenceForce, "TerritoryTempSobGroup1")
							SobGroup_Clear("TerritoryTempSobGroup1")
						else
							--anybody attacking our ships?
							SobGroup_GetAttackers("Player" .. playerID .. "ShipsToGuardInThisTerritory", "TerritoryTempSobGroup1")
							if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
								SobGroup_Attack(playerID, defenceForce, "TerritoryTempSobGroup1")
								SobGroup_Clear("TerritoryTempSobGroup1")
							else
								--attack enemy ships
								SobGroup_Attack(playerID, defenceForce, "Player" .. playerID .. "EnemyShipsInThisTerritory")
							end
						end
					else
						SobGroup_GuardSobGroup(defenceForce, "Player" .. playerID .. "ShipsToGuardInThisTerritory")
					end
				else
					--no ships to guard, so attack instead
					if enemyShipsPresent == 1 then
						SobGroup_Attack(playerID, defenceForce, "Player" .. playerID .. "EnemyShipsInThisTerritory")
					end
				end
			end
			
			--attack group
			if SobGroup_Empty(attackForce) == 0 then
				if enemyShipsPresent == 1 then
					SobGroup_Attack(playerID, attackForce, "Player" .. playerID .. "EnemyShipsInThisTerritory")
				end
			end
			
			
		end
	end
	
	
end


function GetShipDifferential(iPlayerID, iTerritoryID)
	--RETURNS THE DIFFERENCE BETWEEN THE NUMBER OF WARSHIPS PRESENT AND THE IDEAL NUMBER THAT SHOULD BE THERE
	--(a negative number means the territory should have more ships, positive means they should have fewer)
	local returnVal = 0
	local shipCount = 0
	local idealShipCount = 0
	local totalWarships = 0
	local threatPercentage = 0
	local totalThreat = 0
	
	shipCount = getn(TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].mySquads)
	
	if IsThisTerritoryInMyTerritories(iPlayerID, iTerritoryID) == 0 then
		returnVal = shipCount
	else
		totalThreat = CpuPlayerStats[iPlayerID].totalThreat
		totalWarships = CpuPlayerStats[iPlayerID].warshipCount
		
		if totalThreat > 0 then
			threatPercentage = TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].threatLevel / totalThreat
			idealShipCount = round(totalWarships * threatPercentage)
		end
		
		--PrintMessage("PLAYER " .. iPlayerID .. " HAS " .. shipCount .. " SHIPS IN TERRITORY " .. iTerritoryID .. " AND SHOULD HAVE " .. idealShipCount .. " SHIPS HERE")
		
		returnVal = shipCount - idealShipCount
	end
	
	return returnVal
end











--*********** MOVING WARSHIPS FROM TERRITORY TO TERRITORY ***********

--values for threat level
ALL_FRIENDLY = 0
NEUTRAL = 5
ENEMY_PRESENT = 10


function IsThisTerritoryInMyTerritories(iPlayerID, iTerritoryID)
	--CHECK IF THE TERRITORY ID IS IN THE PLAYER'S myTerritories TABLE
	local returnVal = 0
	local idx = 0
	for idx = getn(CpuPlayerStats[iPlayerID].myTerritories),1,-1 do
		if CpuPlayerStats[iPlayerID].myTerritories[idx] == iTerritoryID then
			returnVal = 1
			break
		end
	end
	return returnVal
end


function AddTerritoryToMyTerritories(iPlayerID, iTerritoryID)
	--ADD A PARENT TERRITORY TO THIS PLAYERS LIST OF myTerritories
	if IsThisTerritoryInMyTerritories(iPlayerID, iTerritoryID) == 0 then
		tinsert(CpuPlayerStats[iPlayerID].myTerritories, iTerritoryID)
	end
end


function RemoveTerritoryFromMyTerritories(iPlayerID, iTerritoryID) --UNUSED (??)
	--REMOVE A PARENT TERRITORY FROM THIS PLAYERS LIST OF myTerritories
	local idx = 0
	for idx = getn(CpuPlayerStats[iPlayerID].myTerritories),1,-1 do
		if CpuPlayerStats[iPlayerID].myTerritories[idx] == iTerritoryID then
			tremove(CpuPlayerStats[iPlayerID].myTerritories, idx)
			break
		end
	end
end


function Rule_UpdateMyTerritories()
	--UPDATE A PLAYER'S myTerritories TABLE
	gCpuID_MyTerritories = gCpuID_MyTerritories + 1
	if gCpuID_MyTerritories == 4 then gCpuID_MyTerritories = 0 end
	
	if Player_IsAlive(gCpuID_MyTerritories) == 1 and CPU_Exist(gCpuID_MyTerritories) == 1 then
		local idx = 0
		local territoryID = 0
		local removeEntry = 0
		local frigateID = 0
		local idx2 = 0
		local associate = {}
		local threat = 0
		local totalThreat = 0
		for idx = getn(CpuPlayerStats[gCpuID_MyTerritories].myTerritories),1,-1 do
			territoryID = CpuPlayerStats[gCpuID_MyTerritories].myTerritories[idx]
			
			--remove it from the list?
			removeEntry = 0
			if TerritoryStats[territoryID][PLAYERSTATS][gCpuID_MyTerritories].postsOwned == 0 then
				removeEntry = 1
				--check if they're going after it with capture frigates
				for frigateID = 1,gCaptureFrigateCap do
					if CpuPlayerStats[gCpuID_MyTerritories].captureFrigates[frigateID].parentTarget == territoryID then
						removeEntry = 0
						break
					end
				end
			end
			
			if removeEntry == 1 then
				tremove(CpuPlayerStats[gCpuID_MyTerritories].myTerritories, idx)
			else
				--update threat level for this territory
				threat = GetThreatLevel(gCpuID_MyTerritories, territoryID) * 1.5
				
				for idx2,associate in TerritoryStats[territoryID][ASSOCIATES] do
					if idx2 ~= "n" then
						if associate.jumpCount == 3 then break end --only look 2 jumps away
						threat = threat + (GetThreatLevel(gCpuID_MyTerritories, associate.id) / associate.jumpCount)
						--(divide by jump count so the threat diminishes the further away it is)
					end
				end
				
				TerritoryStats[territoryID][PLAYERSTATS][gCpuID_MyTerritories].threatLevel = threat
				totalThreat = totalThreat + threat
			end
			
		end
		
		CpuPlayerStats[gCpuID_MyTerritories].totalThreat = totalThreat
		
	end
end


function GetThreatLevel(iPlayerID, iTerritoryID)
	--RETURN THE THREAT LEVEL FOR THE GIVEN TERRITORY AND PLAYER
	local returnVal = 0
	local postCount = TerritoryStats[iTerritoryID][CHILDSTATS][totalPostCount]
	
	if postCount == 0 then
		returnVal = NEUTRAL
	else
		--subtract out all friendly posts
		postCount = postCount - GetFriendlyPostCount(iPlayerID, iTerritoryID)
		
		if postCount == 0 then
			returnVal = ALL_FRIENDLY
		else
			--subtract unclaimed posts
			postCount = postCount - TerritoryStats[iTerritoryID][CHILDSTATS][unclaimedCount]
			if postCount == 0 then
				returnVal = NEUTRAL
			else
				returnVal = ENEMY_PRESENT
			end
		end
	end
	
	return returnVal
end


function GetFriendlyPostCount(iPlayerID, iTerritoryID)
	--RETURN THE NUMBER OF FRIENDLY POSTS IN THE TERRITORY
	local friendlyCount = TerritoryStats[iTerritoryID][PLAYERSTATS][iPlayerID].postsOwned
	if CpuPlayerStats[iPlayerID].hasAllies == 1 then
		local idx = 0
		local allyID = 0
		for idx,allyID in CpuPlayerStats[iPlayerID].allies do
			if Player_IsAlive(allyID) == 1 then
				friendlyCount = friendlyCount + TerritoryStats[iTerritoryID][PLAYERSTATS][allyID].postsOwned
			end
		end
	end
	return friendlyCount
end


function Rule_PrintMyTerritories()
	local playerID = 1
	local idx = 0
	local terrID = 0
	print(" ")
	PrintMessage("PLAYER " .. playerID .. " myTerritories: ")
	for idx = 1,getn(CpuPlayerStats[playerID].myTerritories) do
		terrID = CpuPlayerStats[playerID].myTerritories[idx]
		PrintMessage("  " .. terrID .. " (threat: " .. TerritoryStats[terrID][PLAYERSTATS][playerID].threatLevel .. ")")
	end
	PrintMessage("  TOTAL THREAT: " .. CpuPlayerStats[playerID].totalThreat)
	PrintMessage("  TOTAL WARSHIPS: " .. CpuPlayerStats[playerID].warshipCount)
	print(" ")
end











--*********** TRANSIT SYSTEM ***********

gInTransitShips = 
{
	[0] = {},
	[1] = {},
	[2] = {},
	[3] = {},
}


--indexes for transit table
SQUAD_ID = 1
STATUS = 2
PATH = 3
CAN_CAPTURE = 4


--possible status for each transit ship
STARTING = 1
MOVING = 2
JUMPING = 3
CAPTURING_GATE = 4



function PlaceSquadInTransit(iPlayerID, iAllSquadsID, tPathToFollow, bCanCapture)
	--PLACES CPU SHIPS INTO TRANSIT MODE TO MOVE THEM TO OTHER TERRITORIES
	
	--FIX: delete any old entries for this sobgroup first
	
	local sobName = CpuPlayerStats[iPlayerID].allSquads[iAllSquadsID].name
	local numJumps = getn(tPathToFollow)
	--echo("PUTTING SHIPS INTO TRANSIT: " .. sobName .. ", from " .. tPathToFollow[1] .. " to " .. tPathToFollow[numJumps] .. " (number of jumps: " .. numJumps-1 .. ")")
	
	--create a new path so it isn't a reference
	local tPathToInsert = {}
	local i = 0
	for i = 1,getn(tPathToFollow) do
		tPathToInsert[i] = tPathToFollow[i]
	end
	
	local tNewValue = 
	{
		[SQUAD_ID] = iAllSquadsID,
		[STATUS] = STARTING,
		[PATH] = tPathToInsert,
		[CAN_CAPTURE] = bCanCapture, --0 or 1 if the sobgroup is a capture frigate (or send nil)
	}
	tinsert(gInTransitShips[iPlayerID], tNewValue)
	SobGroup_SobGroupAdd("Player" .. iPlayerID .. "InTransitShips", sobName)
	CpuPlayerStats[iPlayerID].allSquads[iAllSquadsID].inTransit = 1
	
	--remove from mySquads table of the start location
	if CpuPlayerStats[iPlayerID].allSquads[iAllSquadsID].isWarship == 1 then
		RemoveCpuWarshipFromTerritory(iPlayerID, iAllSquadsID, tPathToInsert[1])
	end
end


function IsSobGroupInTransit(iPlayerID, sSobgroupName) --UNUSED (use allSquads inTransit variable instead)
	local returnVal = 0
	SobGroup_Clear("TerritoryTempSobGroup1")
	SobGroup_FillCompare("TerritoryTempSobGroup1", "Player" .. iPlayerID .. "InTransitShips", sSobgroupName)
	if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
		returnVal = 1
	end
	SobGroup_Clear("TerritoryTempSobGroup1")
	return returnVal
end


function PlayerCanUseJumpgate(iPlayerID, sJumpGateName)
	--RETURNS 0 OR 1 IF THE PLAYER CAN USE THIS JUMP GATE
	--(this has nothing to do with whether or not they can afford it, just gate ownership)
	local canUse = 0
	if gJumpGateOwnership == ALWAYS_NEUTRAL then
		canUse = 1
	else
		local gateOwner = SobGroup_OwnedBy(sJumpGateName)
		if gateOwner == ALLIED_CPU or gateOwner == iPlayerID then
			canUse = 1
		elseif AreAllied(gateOwner, iPlayerID) == 1 then
			canUse = 1
		end
	end
	return canUse
end


function Rule_IssueOrdersToInTransitShips()
	gCpuID_Transit = gCpuID_Transit + 1
	if gCpuID_Transit == 4 then gCpuID_Transit = 0 end
	
	if Player_IsAlive(gCpuID_Transit) == 1 and CPU_Exist(gCpuID_Transit) == 1 then
		--print(" ")
		--print(" ")
		--echo("**************************************************************")
		--PrintMessage("*****************  Rule_IssueOrdersToInTransitShips IS RUNNING FOR PLAYER " .. gCpuID_Transit .. " (MONEY: " .. Player_GetRU(gCpuID_Transit) .. ")")
		local count = getn(gInTransitShips[gCpuID_Transit])
		--echo("Number of in transit ships: " .. count)
		--print(" ")
		--PrintTransitStats()
		
		if count > 0 then
			local i = 0
			local j = 0
			local squadID = 0
			local sobgroupName = ""
			local status = 0
			local canCapture = 0
			local currentLocation = 0
			local nextDestination = 0
			local connectionType = 0
			local gateToUse = ""
			local deleteEntry = 0
			local newStatus = 0
			local isEmpty = 0
			local str = ""
			for i = count,1,-1 do --loop backwards so we can delete entries
				
				

				squadID = gInTransitShips[gCpuID_Transit][i][SQUAD_ID]
				sobgroupName = CpuPlayerStats[gCpuID_Transit].allSquads[squadID].name
				isEmpty = 0
				
				--print(" ")
				--PrintMessage(" ----------checking " .. sobgroupName)
				str = "  path: { "
				for j = 1,getn(gInTransitShips[gCpuID_Transit][i][PATH]) do
					str = str .. gInTransitShips[gCpuID_Transit][i][PATH][j] .. ", "
				end
				str = str .. " }"
				--print(str)
				
				
				if sobgroupName ~= "" and SobGroup_Empty(sobgroupName) == 0 then
					status = gInTransitShips[gCpuID_Transit][i][STATUS]
					canCapture = gInTransitShips[gCpuID_Transit][i][CAN_CAPTURE]
					currentLocation = gInTransitShips[gCpuID_Transit][i][PATH][1]
					nextDestination = gInTransitShips[gCpuID_Transit][i][PATH][2]

					deleteEntry = 0
					newStatus = 0


					--PrintMessage("  status: " .. GetTransitStatusName(status))


					if status == STARTING then
						
						
						if SobGroup_AreAllInRealSpace(sobgroupName) == 1 then
							newStatus = MOVING
						end
						
					
					
					elseif status == MOVING then
						
						
						connectionType = TerritoryStats[currentLocation][NEIGHBOURS]["terr" .. nextDestination][2]
						--print("  connection type between " .. currentLocation .. " and " .. nextDestination .. ": " .. GetNeighbourTypeName(connectionType))
						
						if connectionType == OVERLAPPING then
							--move to territory (not through a gate)
							
							--FINISH THIS
							
						else
							
							--find next hyperspace gate
							gateToUse = GetJumpGateName(currentLocation, nextDestination)
							--PrintMessage("  using gate: " .. gateToUse)
						
						
							if GetDistanceBetweenTwoPoints(SobGroup_GetPosition(sobgroupName), SobGroup_GetPosition(gateToUse)) > 1100 then
								--sobgroup is too far from jump gate, move towards it
								if SobGroup_IsDoingAbility(sobgroupName, AB_Move) == 0 then
									--PrintMessage("  issuing move order to " .. sobgroupName)
									SobGroup_MoveToSobGroup(sobgroupName, gateToUse)
								end
							else --player is close enough to jump gate to use it
								if PlayerCanUseJumpgate(gCpuID_Transit, gateToUse) == 1 then
									--see if we can afford it
									if Player_GetRU(gCpuID_Transit) >= gJumpCost then
										--PrintMessage("  issuing jump order for " .. sobgroupName .. " through " .. gateToUse)
										CPU_UseJumpGate(gCpuID_Transit, sobgroupName, gateToUse)
										newStatus = JUMPING
									else
										--we can't afford it, so we'll wait until we can
										--PrintMessage("  can't afford the jump")
									end
								else --player can't use the jump gate (because of ownership)
									if canCapture == 1 then --the current ship is a capture frigate
										if gJumpGateOwnership == CAPTURABLE then
											--try and capture the gate
											--PrintMessage("  issuing capture order for " .. sobgroupName .. " to get " .. gateToUse)
											SobGroup_CaptureSobGroup(sobgroupName, gateToUse)
											newStatus = CAPTURING_GATE
										elseif gJumpGateOwnership == MUST_OWN_TERRITORY then
											--exit transit mode and put the frigate into capture mode
											--PrintMessage("  exiting transit mode (MUST_OWN_TERRITORY)")
											deleteEntry = 1
										end
									else
										--stuck at a red light, so exit transit mode
										--PrintMessage("  removing " .. sobgroupName .. " from transit mode because " .. gateToUse .. " isn't usable")
										deleteEntry = 1
									end
								end
								
								
								
							end
							
						end


						
						

					elseif status == CAPTURING_GATE then
						
						
						
						if SobGroup_IsDoingAbility(sobgroupName, AB_Capture) == 1 then
							--do nothing
						else
							newStatus = MOVING
						end
						
						
						
						
					elseif status == JUMPING then

						
						
						--check that we're out of hyperspace in our new home
						if SobGroup_AreAllInRealSpace(sobgroupName) == 0 then
							--print("  " .. sobgroupName .. "  is still in hyperspace")
						else
							--temp
							if nextDestination == nil then
								--print("  " .. sobgroupName .. "  nextDestination: nil")
							else
								--print("  " .. sobgroupName .. "  nextDestination: " .. nextDestination)
							end
							local position = SobGroup_GetPosition(sobgroupName)
							--print("  position: { " .. round(position[1]) .. ", " .. round(position[2]) .. ", " .. round(position[3]) .. " }")
							--print("  current territory: " .. WhatTerritoryIsThisLocationIn(position))
							
							
							--FINISH: check if the ship is still in the previous territory (put back into move mode)
							
							
							if IsLocationInsideThisTerritory(SobGroup_GetPosition(sobgroupName), nextDestination) == 1 then
								--we have arrived in the new territory
								--print("  " .. sobgroupName .. " has arrived in the new territory (" .. gInTransitShips[gCpuID_Transit][i][PATH][2] .. ")")
								--print("  removing first entry from path table (gCpuID_Transit: " .. gCpuID_Transit .. ", i: " .. i .. ")")
								CpuPlayerStats[gCpuID_Transit].allSquads[squadID].location = gInTransitShips[gCpuID_Transit][i][PATH][2]
								tremove(gInTransitShips[gCpuID_Transit][i][PATH], 1)
								
								if getn(gInTransitShips[gCpuID_Transit][i][PATH]) > 1 then
									newStatus = MOVING
									--print("  moving to new gate")
								else
									--PrintMessage("  doing nothing because we reached the end of the path (deleting entry)")
									deleteEntry = 1
								end
							end
						end
						
						
						
						
					end --end of status check


					if newStatus ~= 0 then
						gInTransitShips[gCpuID_Transit][i][STATUS] = newStatus
					end
				
				
				else --the transit sobgroup is empty
					--print("  deleting " .. sobgroupName .. " because it's empty")
					deleteEntry = 1
					isEmpty = 1
				end
				
				
				
				if deleteEntry == 1 then
					--PrintMessage("  deleting entry for " .. sobgroupName)
					tremove(gInTransitShips[gCpuID_Transit], i)
					if isEmpty == 0 then
						SobGroup_SobGroupRemove("Player" .. gCpuID_Transit .. "InTransitShips", sobgroupName)
						CpuPlayerStats[gCpuID_Transit].allSquads[squadID].inTransit = 0

						--add it to the mySquads table if appropriate
						if CpuPlayerStats[gCpuID_Transit].allSquads[squadID].isWarship == 1 then
							local myLocation = WhatTerritoryIsThisLocationIn(SobGroup_GetPosition(sobgroupName))
							if myLocation == 0 then
								echo("WARNING: COULD NOT FIND LOCATION FOR A WARSHIP EXITING TRANSIT MODE")
							else
								AddCpuWarshipToTerritory(gCpuID_Transit, squadID, myLocation)
							end
						end
					end
				end
				
				
				
			end --end of for loop
		end
	end
end


function GetJumpGateName(iTerritoryID1, iTerritoryID2)
	--RETURNS THE JUMP GATE NAME FOR THE GIVEN CONNECTION
	local gateName = ""
	local connectionType = TerritoryStats[iTerritoryID1][NEIGHBOURS]["terr" .. iTerritoryID2][2]
	if connectionType == PARENT_TO_PARENT then
		gateName = "JumpGate" .. iTerritoryID1 .. "_" .. iTerritoryID2
	elseif connectionType == PARENT_TO_CHILD then
		gateName = "JumpGate" .. iTerritoryID1 .. "_" .. TerritoryStats[iTerritoryID1][NEIGHBOURS]["terr" .. iTerritoryID2][3]
	elseif connectionType == CHILD_TO_PARENT then
		gateName = "JumpGate" .. TerritoryStats[iTerritoryID1][NEIGHBOURS]["terr" .. iTerritoryID2][3] .. "_" .. iTerritoryID2
	elseif connectionType == CHILD_TO_CHILD then
		gateName = "JumpGate" .. TerritoryStats[iTerritoryID1][NEIGHBOURS]["terr" .. iTerritoryID2][3] .. "_" .. TerritoryStats[iTerritoryID1][NEIGHBOURS]["terr" .. iTerritoryID2][4]
	end
	return gateName
end


function CPU_UseJumpGate(iPlayerID, sSobGroup, sGateToUse)
	--USE THE JUMP GATE AND SUBTRACT THE COST (one squadron only)
	if gJumpCost > 0 then
		local currRU = Player_GetRU(iPlayerID)
		if currRU < gJumpCost then
			Player_SetRU(iPlayerID, 0)
		else
			Player_SetRU(iPlayerID, currRU-gJumpCost)
		end
	end
	SobGroup_UseHyperspaceGate(sSobGroup, sGateToUse)
end


function PrintTransitStats()
	--print out stats for ships in transit table
	print(" ")
	print("#########################################")
	local playerID = 0
	local count = 0
	local idx = 0
	local ship = {}
	local pathCount = 0
	for playerID = 0,3 do
		if Player_IsAlive(playerID) == 1 and CPU_Exist(playerID) == 1 then
			pathCount = 0
			count = getn(gInTransitShips[playerID])
			if count > 0 then
				for idx,ship in gInTransitShips[playerID] do
					if idx ~= "n" then
						pathCount = pathCount + getn(ship[PATH])
					end
				end
			end
			print("Player " .. playerID .. " ships in transit: " .. count .. " (total path step count: " .. pathCount .. ")")
		end
	end
	print("#########################################")
	print(" ")
end














--*********** CAPTURE FRIGATE AI ***********

--capture frigate status
SEARCHING = 1
WAITING = 2
TRANSIT = 3
CAPTURING = 4


function Rule_ManageCaptureFrigates()
	--ISSUE ORDERS TO CAPTURE FRIGATES
	gCpuID_Capture = gCpuID_Capture + 1
	if gCpuID_Capture == 4 then gCpuID_Capture = 0 end
	
	if Player_IsAlive(gCpuID_Capture) == 1 and CPU_Exist(gCpuID_Capture) == 1 then
		local frigateID = 0
		local frigateGroup = ""
		local frigateStatus = 0
		local frigateAllSquadsID = 0
		local frigateLocation = 0
		local newStatus = 0
		local captureTarget = 0
		
		for frigateID = 1,gCaptureFrigateCap do
			frigateGroup = CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].name
			frigateStatus = CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].status
			frigateAllSquadsID = CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].allSquadsID
			
			if frigateGroup == "" then
				--do nothing
			elseif SobGroup_Empty(frigateGroup) == 1 then
				CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].name = ""
				CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].status = SEARCHING
				CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].allSquadsID = 0
				CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].parentTarget = 0
				CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].specificTarget = 0
			else --frigate sobgroup is not empty
				
				--echo("-------------------- " .. frigateGroup .. " (ID: " .. frigateID .. ") status: " .. GetCaptureFrigateStatusName(frigateStatus))
				newStatus = 0
				
				if frigateStatus == SEARCHING then
					
					
					
					--print("  searching for something to capture...")
					
					--search for something to capture
					CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].parentTarget = 0
					captureTarget = 0
					--captureTarget = GetNextCaptureTarget(gCpuID_Capture)
					
					frigateLocation = WhatTerritoryIsThisLocationIn(SobGroup_GetPosition(frigateGroup))
					
					
					
					--first look for something in the current territory
					if HasAnyUnclaimedPosts(frigateLocation) == 1 or HasAnyEnemyPosts(gCpuID_Capture, frigateLocation) == 1 then
						newStatus = CAPTURING
					else
						local idx = 0
						local associateID = 0
						
						--look at associates for anything with unclaimed posts
						for idx = 1,getn(TerritoryStats[frigateLocation][ASSOCIATES]) do
							associateID = TerritoryStats[frigateLocation][ASSOCIATES][idx].id
							if HasAnyUnclaimedPosts(associateID) == 1 then
								if IsCpuPlayerCapturingThisParentTerritory(gCpuID_Capture, associateID) == 0 then
									captureTarget = associateID
									break
								end
							end
						end
						
						--look for associates with enemy posts
						if captureTarget == 0 then
							--echo("CHECKING FOR ENEMY POSTS IN ASSOCIATES OF TERRITORY " .. frigateLocation)
							for idx = 1,getn(TerritoryStats[frigateLocation][ASSOCIATES]) do
								associateID = TerritoryStats[frigateLocation][ASSOCIATES][idx].id
								--echo(" idx: " .. idx .. ", associateID: " .. associateID)
								if HasAnyEnemyPosts(gCpuID_Capture, associateID) == 1 then
									if IsCpuPlayerCapturingThisParentTerritory(gCpuID_Capture, associateID) == 0 then
										captureTarget = associateID
										break
									end
								end
							end
						end
					end
					
					
					
					
					if newStatus == CAPTURING then
						--do nothing
					else
						if captureTarget == 0 then
							--move to a random territory and search from there
							local associateCount = getn(TerritoryStats[frigateLocation][ASSOCIATES])
							captureTarget = TerritoryStats[frigateLocation][ASSOCIATES][random(1,associateCount)].id
						end
						
						--PrintMessage("  placing " .. frigateGroup .. " in transit from " .. frigateLocation .. " to " .. captureTarget .. "")
						PlaceSquadInTransit(gCpuID_Capture, frigateAllSquadsID, TerritoryStats[frigateLocation][PATHS]["dest" .. captureTarget][1], 1)
						CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].parentTarget = captureTarget
						AddTerritoryToMyTerritories(gCpuID_Capture, captureTarget)
						newStatus = TRANSIT
					end
					
					
					
					
					
				elseif frigateStatus == WAITING then
					
					
					--UNUSED
					
					
					
				elseif frigateStatus == TRANSIT then
					
					--PrintMessage("  #####   CHECKING TRANSITING SHIP " .. frigateGroup)
					--if IsSobGroupInTransit(gCpuID_Capture, frigateGroup) == 0 then
					if CpuPlayerStats[gCpuID_Capture].allSquads[frigateAllSquadsID].inTransit == 0 then
						--frigateLocation = WhatTerritoryIsThisLocationIn(SobGroup_GetPosition(frigateGroup))
						--PrintMessage("    #####  location: " .. frigateLocation)
						--if frigateLocation == CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].parentTarget then
							--PrintMessage("      #####  " .. frigateGroup .. " IS GOING FROM TRANSIT TO CAPTURING")
							newStatus = CAPTURING
						--end
					end
					
					
					
					
				elseif frigateStatus == CAPTURING then
					
					
					--FIX: if jump gate ownership is set to capturable, get all the jump gates too
					
					
					
					--capture every command post and RU generator in the territory
					local territoryToCapture = 0
					local idx = 0
					local terrID = 0
					frigateLocation = WhatTerritoryIsThisLocationIn(SobGroup_GetPosition(frigateGroup))
					--print("  current location: " .. frigateLocation)
					
					if SobGroup_IsDoingAbility(frigateGroup, AB_Capture) == 0 then
						--print("  i am NOT doing the capture ability right now")
						
						
						--first look for unclaimed posts in this territory
						if TerritoryStats[frigateLocation][CHILDSTATS][unclaimedCount] > 0 then
							local tUnclaimedPosts = {}
							
							--central command post
							if TerritoryStats[frigateLocation][BUILDTYPE] ~= EMPTY then
								if TerritoryStats[frigateLocation][OWNER] == ENEMY_CPU and IsCpuPlayerCapturingThisSpecificTerritory(gCpuID_Capture, frigateLocation) == 0 then
									tinsert(tUnclaimedPosts, frigateLocation)
								end
							end
							
							--child command posts
							if TerritoryStats[frigateLocation][CHILDSTATS][numCommandPosts] > 0 then
								for idx,terrID in TerritoryStats[frigateLocation][CHILDSTATS][commandPostIDs] do
									if idx ~= "n" then
										if TerritoryStats[terrID][OWNER] == ENEMY_CPU and IsCpuPlayerCapturingThisSpecificTerritory(gCpuID_Capture, terrID) == 0 then
											tinsert(tUnclaimedPosts, terrID)
										end
									end
								end
							end
							
							--child RU generators
							if TerritoryStats[frigateLocation][CHILDSTATS][numRUGenerators] > 0 then
								for idx,terrID in TerritoryStats[frigateLocation][CHILDSTATS][ruGeneratorIDs] do
									if idx ~= "n" then
										if TerritoryStats[terrID][OWNER] == ENEMY_CPU and IsCpuPlayerCapturingThisSpecificTerritory(gCpuID_Capture, terrID) == 0 then
											tinsert(tUnclaimedPosts, terrID)
										end
									end
								end
							end
							
							if getn(tUnclaimedPosts) > 0 then
								territoryToCapture = tUnclaimedPosts[random(1,getn(tUnclaimedPosts))]
							end
						end
						
						
						
						
						--then look for enemy posts
						if territoryToCapture == 0 then
							local tEnemyPosts = {}
							
							--central command post
							if TerritoryStats[frigateLocation][BUILDTYPE] ~= EMPTY then
								if IsEnemy(gCpuID_Capture, "CommandPost" .. frigateLocation) == 1 and IsCpuPlayerCapturingThisSpecificTerritory(gCpuID_Capture, frigateLocation) == 0 then
									tinsert(tEnemyPosts, frigateLocation)
								end
							end
							
							--child command posts
							if TerritoryStats[frigateLocation][CHILDSTATS][numCommandPosts] > 0 then
								for idx,terrID in TerritoryStats[frigateLocation][CHILDSTATS][commandPostIDs] do
									if idx ~= "n" then
										if IsEnemy(gCpuID_Capture, "CommandPost" .. terrID) == 1 and IsCpuPlayerCapturingThisSpecificTerritory(gCpuID_Capture, terrID) == 0 then
											tinsert(tEnemyPosts, terrID)
										end
									end
								end
							end
							
							--child RU generators
							if TerritoryStats[frigateLocation][CHILDSTATS][numRUGenerators] > 0 then
								for idx,terrID in TerritoryStats[frigateLocation][CHILDSTATS][ruGeneratorIDs] do
									if idx ~= "n" then
										if IsEnemy(gCpuID_Capture, "CommandPost" .. terrID) == 1 and IsCpuPlayerCapturingThisSpecificTerritory(gCpuID_Capture, terrID) == 0 then
											tinsert(tEnemyPosts, terrID)
										end
									end
								end
							end
							
							if getn(tEnemyPosts) > 0 then
								territoryToCapture = tEnemyPosts[random(1,getn(tEnemyPosts))]
							end
						end
						
						
						
						if territoryToCapture == 0 then
							--nothing left to capture here
							--print("  territoryToCapture is empty")
							newStatus = SEARCHING
							CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].specificTarget = 0
						else
							--issue capture order
							--print("  issuing capture order for " .. territoryToCapture)
							SobGroup_CaptureSobGroup(frigateGroup, "CommandPost" .. territoryToCapture)
							CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].specificTarget = territoryToCapture
						end
						
					end
					
					
					
					
				end --end of status check
				
				
				if newStatus ~= 0 then
					--print("  setting new status for player " .. gCpuID_Capture .. " frigate " .. frigateID .. ": " .. GetCaptureFrigateStatusName(newStatus))
					CpuPlayerStats[gCpuID_Capture].captureFrigates[frigateID].status = newStatus
				end
				
				
			end --end of IsEmpty check
			
			
		end --end of for loop for frigates
	end
end


function Rule_WriteFrigateStatus()
	print(" ")
	echo("-------------- FRIGATE STATUS:")
	
	local i = 0
	for i = 1,gCaptureFrigateCap do
		print("  " .. i .. " - " .. GetCaptureFrigateStatusName(CpuPlayerStats[1].captureFrigates[i].status))
	end
	
	print(" ")
end


function IsCpuPlayerCapturingThisParentTerritory(iPlayerID, iTerritoryID)
	--CHECKS IF THE CPU PLAYER IS ALREADY GOING AFTER THIS PARENT TERRITORY
	local returnVal = 0
	local i = 0
	for i = 1,gCaptureFrigateCap do
		if CpuPlayerStats[iPlayerID].captureFrigates[i].parentTarget == iTerritoryID then
			returnVal = 1
			break
		end
	end
	return returnVal
end


function IsCpuPlayerCapturingThisSpecificTerritory(iPlayerID, iTerritoryID)
	--CHECKS IF THE CPU PLAYER IS ALREADY GOING AFTER THIS SPECIFIC TERRITORY
	local returnVal = 0
	local i = 0
	for i = 1,gCaptureFrigateCap do
		if CpuPlayerStats[iPlayerID].captureFrigates[i].specificTarget == iTerritoryID then
			returnVal = 1
			break
		end
	end
	return returnVal
end


function HasAnyUnclaimedPosts(iTerritoryID)
	--RETURNS 0 OR 1 IF THE TERRITORY HAS ANY UNCLAIMED POSTS THAT CAN BE CAPTURED
	if TerritoryStats[iTerritoryID][CHILDSTATS][unclaimedCount] == 0 then
		return 0
	else
		return 1
	end
end


function HasAnyEnemyPosts(iPlayerID, iTerritoryID)
	--RETURNS 0 OR 1 IF THE TERRITORY HAS ANY ENEMY POSTS THAT CAN BE CAPTURED
	--echo("  HasAnyEnemyPosts CALLED FOR PLAYER " .. iPlayerID .. " TERRITORY " .. iTerritoryID)
	local enemyPostCount = TerritoryStats[iTerritoryID][CHILDSTATS][totalPostCount] - GetFriendlyPostCount(iPlayerID, iTerritoryID) - TerritoryStats[iTerritoryID][CHILDSTATS][unclaimedCount]
	if enemyPostCount == 0 then
		return 0
	else
		return 1
	end
end


function IsEnemy(iPlayerID, sSobgroupName)
	--RETURNS 0 OR 1 IF THE GIVEN SOBGROUP IS AN ENEMY TO THE PLAYER
	local owner = SobGroup_OwnedBy(sSobgroupName)
	if owner == iPlayerID or AreAllied(owner, iPlayerID) == 1 then
		return 0
	else
		return 1
	end
end


function HasAnyNeutralThingsToCapture(iTerritoryID)
	--RETURNS 0 OR 1 IF THE TERRITORY HAS ANYTHING OWNED BY THE ENEMY_CPU THAT CAN BE CAPTURED
	--local returnVal = 0
	
	--first check the parent territory's command post
	if TerritoryStats[iTerritoryID][BUILDTYPE] ~= EMPTY then
		if TerritoryStats[iTerritoryID][OWNER] == ENEMY_CPU then
			--print("             HasAnyNeutralThingsToCapture(" .. iTerritoryID .. "): parent is available")
			return 1
		end
	end
	
	--then check child territories
	local idx = 0
	local terrID = 0
	if TerritoryStats[iTerritoryID][CHILDSTATS][numCommandPosts] > 0 then
		for idx,terrID in TerritoryStats[iTerritoryID][CHILDSTATS][commandPostIDs] do
			if idx ~= "n" then
				if TerritoryStats[terrID][OWNER] == ENEMY_CPU then
					--print("             HasAnyNeutralThingsToCapture(" .. iTerritoryID .. "): child post " .. terrID .. " is available")
					return 1
				end
			end
		end
	end
	if TerritoryStats[iTerritoryID][CHILDSTATS][numRUGenerators] > 0 then
		for idx,terrID in TerritoryStats[iTerritoryID][CHILDSTATS][ruGeneratorIDs] do
			if idx ~= "n" then
				if TerritoryStats[terrID][OWNER] == ENEMY_CPU then
					--print("             HasAnyNeutralThingsToCapture(" .. iTerritoryID .. "): child post " .. terrID .. " is available")
					return 1
				end
			end
		end
	end
	
	--nothing to capture here
	return 0
	
	--return returnVal
end


function IsPostBeingCaptured(iTerritoryID)
	--RETURNS 0 OR 1 IF THE POST/GENERATOR IS BEING CAPTURED
	local returnVal = 0
	SobGroup_Clear("TerritoryTempSobGroup1")
	SobGroup_GetSobGroupCapturingGroup("CommandPost" .. iTerritoryID, "TerritoryTempSobGroup1")
	if SobGroup_Empty("TerritoryTempSobGroup1") == 0 then
		returnVal = 1
		SobGroup_Clear("TerritoryTempSobGroup1")
	end
	return returnVal
end











--*********** PATH-FINDING ***********

function DeterminePaths()
	--print(" ")
	local territoryID = 0
	local i = 0
	local destID = 0
	local pathList = {}
	
	local idx1 = 0
	local idx2 = 0
	local idx3 = 0
	local idx4 = 0
	local idx5 = 0
	local idx6 = 0
	local idx7 = 0
	
	local neighbour1 = 0
	local neighbour2 = 0
	local neighbour3 = 0
	local neighbour4 = 0
	local neighbour5 = 0
	local neighbour6 = 0
	local neighbour7 = 0
	
	local neighbourID1 = 0
	local neighbourID2 = 0
	local neighbourID3 = 0
	local neighbourID4 = 0
	local neighbourID5 = 0
	local neighbourID6 = 0
	local neighbourID7 = 0
	
	local tPathToInsert = {}
	
	for i = 1,getn(gParentTerritoryIDs) do
		territoryID = gParentTerritoryIDs[i]
		--echo("DETERMINING PATHS FOR TERRITORY " .. territoryID)
		
		
		--FIX: do this with a recursive function that calls itself X number of times
		--(maybe store the paths as comma-delimited strings first, then split them up into paths after)
		
		
		--insert paths for each territory
		--(for each destination within a few jumps, a list of paths to get there is stored)
		for idx1,neighbour1 in TerritoryStats[territoryID][NEIGHBOURS] do
			neighbourID1 = neighbour1[1]
			tPathToInsert = {territoryID, neighbourID1}
			InsertPath(territoryID, neighbourID1, tPathToInsert)
			
			for idx2,neighbour2 in TerritoryStats[neighbourID1][NEIGHBOURS] do
				neighbourID2 = neighbour2[1]
				if neighbourID2 ~= territoryID then
					tPathToInsert = {territoryID, neighbourID1, neighbourID2}
					InsertPath(territoryID, neighbourID2, tPathToInsert)
					
					for idx3,neighbour3 in TerritoryStats[neighbourID2][NEIGHBOURS] do
						neighbourID3 = neighbour3[1]
						if neighbourID3 ~= territoryID and neighbourID3 ~= neighbourID1 and neighbourID3 ~= neighbourID2 then
							tPathToInsert = {territoryID, neighbourID1, neighbourID2, neighbourID3}
							InsertPath(territoryID, neighbourID3, tPathToInsert)
							
							for idx4,neighbour4 in TerritoryStats[neighbourID3][NEIGHBOURS] do
								neighbourID4 = neighbour4[1]
								if neighbourID4 ~= territoryID and neighbourID4 ~= neighbourID1 and neighbourID4 ~= neighbourID2 then
									tPathToInsert = {territoryID, neighbourID1, neighbourID2, neighbourID3, neighbourID4}
									InsertPath(territoryID, neighbourID4, tPathToInsert)
									
--									for idx5,neighbour5 in TerritoryStats[neighbourID4][NEIGHBOURS] do
--										neighbourID5 = neighbour5[1]
--										if neighbourID5 ~= territoryID and neighbourID5 ~= neighbourID1 and neighbourID5 ~= neighbourID2 and neighbourID5 ~= neighbourID3 then
--											tPathToInsert = {territoryID, neighbourID1, neighbourID2, neighbourID3, neighbourID4, neighbourID5}
--											InsertPath(territoryID, neighbourID5, tPathToInsert)
--											
--											for idx6,neighbour6 in TerritoryStats[neighbourID5][NEIGHBOURS] do
--												neighbourID6 = neighbour6[1]
--												if neighbourID6 ~= territoryID and neighbourID6 ~= neighbourID1 and neighbourID6 ~= neighbourID2 and neighbourID6 ~= neighbourID3 and neighbourID6 ~= neighbourID4 then
--													tPathToInsert = {territoryID, neighbourID1, neighbourID2, neighbourID3, neighbourID4, neighbourID5, neighbourID6}
--													InsertPath(territoryID, neighbourID6, tPathToInsert)
--													
--													for idx7,neighbour7 in TerritoryStats[neighbourID6][NEIGHBOURS] do
--														neighbourID7 = neighbour7[1]
--														if neighbourID7 ~= territoryID and neighbourID7 ~= neighbourID1 and neighbourID7 ~= neighbourID2 and neighbourID7 ~= neighbourID3 and neighbourID7 ~= neighbourID4 and neighbourID7 ~= neighbourID5 then
--															tPathToInsert = {territoryID, neighbourID1, neighbourID2, neighbourID3, neighbourID4, neighbourID5, neighbourID6, neighbourID7}
--															InsertPath(territoryID, neighbourID7, tPathToInsert)
--														end
--													end --idx7
--													
--												end
--											end --idx6
--											
--										end
--									end --idx5
									
								end
							end --idx4
							
						end
					end --idx3
					
				end
			end --idx2
			
		end --idx1
		
		
		
		
		--print("NEIGHBOURHOOD SIZE FOR TERRITORY " .. territoryID .. ": " .. getn(TerritoryStats[territoryID][PATHS])) 
		--this print statement doesn't work because getn() doesn't count the number of real entries (??)
		
		
		--sort the paths by number of jumps, so the first entry in the table will be the quickest path
		for destID,pathList in TerritoryStats[territoryID][PATHS] do
			if destID ~= "n" then
				sort(TerritoryStats[territoryID][PATHS][destID], SortByTableSize)
			end
		end
		
		
		--sort associates by closeness to this territory
		gTerritoryIDToSort = territoryID
		sort(TerritoryStats[territoryID][ASSOCIATES], SortByNumberOfJumps)
		
		--get values for associate jumpCount
		local associate = {}
		for idx1,associate in TerritoryStats[territoryID][ASSOCIATES] do
			if idx1 ~= "n" then
				associate.jumpCount = getn(TerritoryStats[territoryID][PATHS]["dest" .. associate.id][1]) - 1
			end
		end
		
		
--		--print associates table
--		local str = ""
--		str = "  associates for territory " .. territoryID .. ": {"
--		for idx1,associate in TerritoryStats[territoryID][ASSOCIATES] do
--			if idx1 ~= "n" then
--				str = str .. associate.id .. " (" .. associate.jumpCount .. "), "
--			end
--		end
--		print(str .. "} <<--- SORTED")
--		print(" ")
		
		
	end
	
	
	--print(" ")
	--echo("gTotalDestinationCount: " .. gTotalDestinationCount)
	--echo("gTotalPathCount: " .. gTotalPathCount)
	--print(" ")

	
	
	
	--print(" ")
	
end


function SortByTableSize(tTable1, tTable2)
	--used to sort the paths tables
	return getn(tTable1) < getn(tTable2)
end


gTerritoryIDToSort = 0

function SortByNumberOfJumps(iAssociate1, iAssociate2)
	--used to sort the associates table
	return getn(TerritoryStats[gTerritoryIDToSort][PATHS]["dest" .. iAssociate1.id][1]) < getn(TerritoryStats[gTerritoryIDToSort][PATHS]["dest" .. iAssociate2.id][1])
end





gTotalDestinationCount = 0
gTotalPathCount = 0

function InsertPath(iTerritoryID, iDestinationID, tPath)
	local insertDestination = 0
	local pathLength = getn(tPath)-1
	--print("INSERTING PATH FROM " .. iTerritoryID .. " TO " .. iDestinationID .. " (number of jumps: " .. pathLength .. ")")
	--print(" ")
	
	--insert destination into paths table if it doesn't already exist there
	if TerritoryStats[iTerritoryID][PATHS]["dest" .. iDestinationID] == nil then
		--print("  DESTINATION TABLE IS NIL")
		TerritoryStats[iTerritoryID][PATHS]["dest" .. iDestinationID] = {  }
		gTotalDestinationCount = gTotalDestinationCount + 1
		--also insert into associates table
		tinsert(TerritoryStats[iTerritoryID][ASSOCIATES], { id=iDestinationID, jumpCount=0 })
	end
	
	--insert the path
	tinsert(TerritoryStats[iTerritoryID][PATHS]["dest" .. iDestinationID], tPath)
	gTotalPathCount = gTotalPathCount + 1
	
	
end



function WritePaths(iTerritoryID)
	--WRITE OUT ALL THE PATHS THAT ARE SAVED FOR THIS TERRITORY TO NEARBY ONES
	print(" ")
	print(" ")
	print(iTerritoryID .. ". PATHS FOR TERRITORY " .. iTerritoryID .. ": ")
	
	if iTerritoryID > BoardStats.numTerritories then
		print("  **THIS TERRITORY ID DOES NOT EXIST ON THIS LEVEL")
		print(" ")
		return
	end
	
	if TerritoryStats[iTerritoryID][PARENTID] ~= PARENT then
		print("  **THIS TERRITORY IS A CHILD TERRITORY (no paths)")
		print(" ")
		return
	end
	
	local tMyPaths = TerritoryStats[iTerritoryID][PATHS]
	local str = ""
	
	local destID = 0
	local pathList = {}
	
	local idx = 0
	local path = {}
	
	local idx2 = 0
	local terrID = 0
	
	local destinationCount = 0
	
	
	for destID,pathList in tMyPaths do
		if destID ~= "n" then
			destinationCount = destinationCount + 1
			print("     DESTINATION: " .. destID)
			
			for idx = 1,getn(pathList) do
				path = pathList[idx]
				str = "       { "

				for idx2,terrID in path do
					if idx2 ~= "n" then
						str = str .. terrID .. ", "
					end
				end

				str = str .. "}"
				print(str)
			end
			
			print(" ")
		end
	end
	
	print("     TOTAL NUMBER OF DESTINATIONS FOR TERRITORY " .. iTerritoryID .. ": " .. destinationCount)
	
	
end





