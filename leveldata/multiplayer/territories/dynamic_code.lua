

--THIS FILE EXECUTES DURING A GAME, SO YOU CAN CHANGE IT ON THE FLY

--PrintMessage("Dynamic code is running")


--local playerID = 0
--for playerID = 0,3 do
--	if Player_IsAlive(playerID) == 1 and CPU_Exist(playerID) == 1 then
--		--SobGroup_SetTactics("Player_Ships" .. playerID, AggressiveTactics)
--		--echo("COUNT OF PLAYER " .. playerID .. " SHIPS: " .. SobGroup_Count("Player_Ships" .. playerID))
--	end
--end




--PlaceSquadInTransit(2, CpuPlayerStats[2].captureFrigates[1].allSquadsID, {10,9,8}, 1)


--SobGroup_CaptureSobGroup(CpuPlayerStats[2].captureFrigates[1].name, "CommandPost1")


--SobGroup_TakeDamage("Player_Ships1", 1)



--Rule_Remove("Rule_AddShipsToBuildQueue")
--Rule_AddInterval("Rule_AddShipsToBuildQueue", 2)



--RemoveTerritoryFromMyTerritories(1, 8)
--RemoveTerritoryFromMyTerritories(1, 3)




--SobGroup_Create("minelayer")
--Volume_AddSphere("myvol", { TerritoryStats[2][LOCATION][1], TerritoryStats[2][LOCATION][2]+600, TerritoryStats[2][LOCATION][3] }, 1500)
--SobGroup_SpawnNewShipInSobGroup(1, "Vgr_MinelayerCorvette", "sqd", "minelayer", "myvol")
--SobGroup_DeployMines("minelayer", "myvol", 0.7)



--SobGroup_TakeDamage("Territory25Player1DefenceForce", 1)
--SobGroup_TakeDamage("Territory25Player1AttackForce", 1)

--SobGroup_TakeDamage("Territory20Player1AttackForce", 1)



--PlaceSquadInTransit(1, CpuPlayerStats[1].captureFrigates[1].allSquadsID, {25,20,15,10,5,4,3,2,1,6}, 1)

--PlaceSquadInTransit(1, 4, {25,20})








--PrintMessage("PlayerCommandPostCounts[2]: " .. PlayerCommandPostCounts[2])




--PrintMessage("PlayerCanUseJumpgate(0, 'JumpGate1_2'): " .. PlayerCanUseJumpgate(0, "JumpGate1_2"))
--PrintMessage("PlayerCanUseJumpgate(0, 'JumpGate21_22'): " .. PlayerCanUseJumpgate(0, "JumpGate21_22"))








--SobGroup_TakeDamage("Player1CaptureFrigate1", 1)




--local x = 0
--for x = 0,30000,800 do
--	echo("IsLocationInsideThisTerritory({" .. x .. ",0,0}, 65): " .. IsLocationInsideThisTerritory({x,0,0}, 65))
--end
--
--echo(" ** IsLocationInsideThisTerritory({0,0,0}, 93): " .. IsLocationInsideThisTerritory({0,0,0}, 93))
--echo(" ** IsLocationInsideThisTerritory({0,50000,0}, 93): " .. IsLocationInsideThisTerritory({0,50000,0}, 93))


--coord = {0,0,0}
--echo("WhatTerritoryIsThisLocationIn({" .. coord[1] .. "," .. coord[2] .. "," .. coord[3] .. "}): " .. WhatTerritoryIsThisLocationIn(coord))
--
--coord = {0,13000,0}
--echo("WhatTerritoryIsThisLocationIn({" .. coord[1] .. "," .. coord[2] .. "," .. coord[3] .. "}): " .. WhatTerritoryIsThisLocationIn(coord))
--
--coord = {0,14000,0}
--echo("WhatTerritoryIsThisLocationIn({" .. coord[1] .. "," .. coord[2] .. "," .. coord[3] .. "}): " .. WhatTerritoryIsThisLocationIn(coord))
--
--coord = {0,30000,0}
--echo("WhatTerritoryIsThisLocationIn({" .. coord[1] .. "," .. coord[2] .. "," .. coord[3] .. "}): " .. WhatTerritoryIsThisLocationIn(coord))
--
--coord = {-30000,0,-30000}
--echo("WhatTerritoryIsThisLocationIn({" .. coord[1] .. "," .. coord[2] .. "," .. coord[3] .. "}): " .. WhatTerritoryIsThisLocationIn(coord))
--
--coord = {71000,1000,-70000}
--echo("WhatTerritoryIsThisLocationIn({" .. coord[1] .. "," .. coord[2] .. "," .. coord[3] .. "}): " .. WhatTerritoryIsThisLocationIn(coord))






--Volume_AddSphere("vol1", {-3000,300,-500}, 100)
--SobGroup_SpawnNewShipInSobGroup(1, "Hgn_MarineFrigate", "sqd", "Player_Ships1", "vol1")
--Volume_Delete("vol3")



--CPU_UseHyperspaceGate(1, "TestGroup", "JumpGate13_8")
--SobGroup_CaptureSobGroup("TestGroup", "CommandPost8")

--CPU_UseHyperspaceGate(1, "TestGroup", "JumpGate8_3")
--SobGroup_CaptureSobGroup("TestGroup", "CommandPost3")


--SobGroup_UseHyperspaceGate("Player_Ships1", "JumpGate13_8")
--SobGroup_UseHyperspaceGate("Player_Ships1", "JumpGate8_13")



--AddTestShips()




--PrintMessage("ISSUING JUMP GATE ORDER")
--CPU_UseHyperspaceGate(1, "Player1CaptureFrigate1", "JumpGate25_20")

--PrintMessage("ISSUING CAPTURE ORDER")
--SobGroup_CaptureSobGroup("Player1CaptureFrigate1", "CommandPost20")

--PrintMessage("ISSUING JUMP GATE ORDER")
--CPU_UseHyperspaceGate(1, "Player1CaptureFrigate1", "JumpGate20_19")


--function Rule_MoveBetweenTerritories()
--	SobGroup_Move(1, "Player1CaptureFrigate1", "TerritoryVolume20")
--end

--Rule_AddInterval("Rule_MoveBetweenTerritories", 2)

--SobGroup_TakeDamage("Player1CaptureFrigate1", 1)


