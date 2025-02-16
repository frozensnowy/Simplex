

--*********** MISCELLANEOUS SETTINGS ***********
--These settings are usually used only for level development:

--AddLocatorShip = 1 --ADD A SQUAD OF SCOUTS TO ALLOW PRINTING OF COORDINATES
AuditMap = 0 --INFORMATION ABOUT THE MAP WILL BE PRINTED OUT (Possible values: 1 or 2, for level of detail)






function SetupTerritoryTables()
	
	
	--*********** DEFAULT TERRITORY SIZE ***********
	--By changing the DefaultTerritorySize variable, you can set the size of all territories (unless overwritten)
	DefaultTerritorySize = 5000
	
	
	
	
	--*********** Territories TABLE ***********
	--This table specifies the locations of the territories, what kind of command post they contain, how much RU's they pay, and optionally the size of the territory (if different from the default size).
	--Possible build types: FIGHTER, CORVETTE, FRIGATE, CAPITAL, EMPTY, RESOURCE_ONLY
	
	--FORMAT:
	--Territories[ID] = { PARENTID, LOCATION, BUILDTYPE, PAYOUT, SIZE }
	--(SIZE is optional)
	
	--BUILD TYPES: FIGHTER, CORVETTE, FRIGATE, CAPITAL, EMPTY, RESOURCE_ONLY
	
	--EXAMPLES:
	--Territories[1] = { PARENT, {10000, 0, 0}, FIGHTER, 500 }
	--Territories[2] = { 1, {-2000, 0, 0}, RESOURCE_ONLY, 1000, 7500 }
	
	--PROGRAMMATICALLY:
	--local counter = 0
	--local i = 0
	--for i = 1,10 do
	--	counter = counter = counter + 1
	--	Territories[counter] = { {10000, 0, 0}, FIGHTER, 500 }
	--end
	
	--ChangeTerritoryValues(iDataMember, tAffectedIDs, NewValue)
	--ChangeTerritoryValues(BUILDTYPE, {1,2,3,4}, RESOURCE_ONLY)
	--ChangeTerritoryValues(PAYOUT, {5,15,15,20}, 1000)
	
	
	local NUM_ROWS = 8
	local NUM_COLS = 8



	local offset = 20000

	local i = 0
	local j = 0





	xCoords = {}
	yCoords = {}

	local value = floor(NUM_ROWS/2) * -offset
	if mod(NUM_ROWS, 2) == 0 then
		value = value + offset/2
	end
	for i = 1,NUM_ROWS do
		xCoords[i] = value
		value = value + offset
	end

	value = floor(NUM_COLS/2) * -offset
	if mod(NUM_COLS, 2) == 0 then
		value = value + offset/2
	end
	for i = 1,NUM_COLS do
		yCoords[i] = value
		value = value + offset
	end





	--echo("-------TERRITORY IDs: ")

	local terrID = 0
	local x = 0
	local y = 0
	for i = 1,NUM_ROWS do
		for j = 1,NUM_COLS do
			terrID = terrID + 1

			x = xCoords[i]
			y = yCoords[j]

			--echo(i .. " & " .. j .. ": " .. terrID .. "   LOCATION: " .. x .. ", 0, " .. y .. "")
			Territories[terrID] = { PARENT, { x, 0, y }, EMPTY, 100 }
		end
	end




	--start locations
	ChangeTerritoryValues(BUILDTYPE, {1,8,57,64}, FIGHTER)
	ChangeTerritoryValues(PAYOUT, {1,8,57,64}, 500)
	
	
	
	
	--5 large territories
	Territories[65] = { PARENT, { 0, 0, 0 }, EMPTY, 0, 20000 }
	
	offset = 40000
	Territories[66] = { PARENT, { -offset, 0, -offset }, EMPTY, 0, 19000 }
	Territories[67] = { PARENT, { -offset, 0, offset }, EMPTY, 0, 19000 }
	Territories[68] = { PARENT, { offset, 0, -offset }, EMPTY, 0, 19000 }
	Territories[69] = { PARENT, { offset, 0, offset }, EMPTY, 0, 19000 }
	
	
	
	
	local tCenter = {}
	
	--child territories for 65
	ChangeTerritoryValues(PARENTID, {28,29,36,37}, 65)
	
	ChangeTerritoryValues(BUILDTYPE, {28,29}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {28,29}, 500)
	
	ChangeTerritoryValues(BUILDTYPE, {36}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {37}, CAPITAL)
	ChangeTerritoryValues(PAYOUT, {36,37}, 100)
	
	tCenter = {0,0,0}
	ChangeTerritoryValues(LOCATION, {28}, {tCenter[1], tCenter[2]+10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {29}, {tCenter[1], tCenter[2]-10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {36}, {tCenter[1], tCenter[2], tCenter[3]+6000})
	ChangeTerritoryValues(LOCATION, {37}, {tCenter[1], tCenter[2], tCenter[3]-6000})
	
	
	
	
	--child territories for 66
	ChangeTerritoryValues(PARENTID, {10,11,18,19}, 66)
	
	ChangeTerritoryValues(BUILDTYPE, {10,11}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {10,11}, 500)
	
	ChangeTerritoryValues(BUILDTYPE, {18}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {19}, FIGHTER)
	ChangeTerritoryValues(PAYOUT, {18,19}, 100)
	
	tCenter = {-offset, 0, -offset}
	ChangeTerritoryValues(LOCATION, {10}, {tCenter[1], tCenter[2]+10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {11}, {tCenter[1], tCenter[2]-10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {18}, {tCenter[1]+6000, tCenter[2], tCenter[3]})
	ChangeTerritoryValues(LOCATION, {19}, {tCenter[1]-6000, tCenter[2], tCenter[3]})
	
	
	
	
	--child territories for 67
	ChangeTerritoryValues(PARENTID, {14,15,22,23}, 67)
	
	ChangeTerritoryValues(BUILDTYPE, {14,15}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {14,15}, 500)
	
	ChangeTerritoryValues(BUILDTYPE, {22}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {23}, FIGHTER)
	ChangeTerritoryValues(PAYOUT, {22,23}, 100)
	
	tCenter = {-offset, 0, offset}
	ChangeTerritoryValues(LOCATION, {14}, {tCenter[1], tCenter[2]+10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {15}, {tCenter[1], tCenter[2]-10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {22}, {tCenter[1]+6000, tCenter[2], tCenter[3]})
	ChangeTerritoryValues(LOCATION, {23}, {tCenter[1]-6000, tCenter[2], tCenter[3]})
	
	
	
	
	--child territories for 68
	ChangeTerritoryValues(PARENTID, {42,43,50,51}, 68)
	
	ChangeTerritoryValues(BUILDTYPE, {42,43}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {42,43}, 500)
	
	ChangeTerritoryValues(BUILDTYPE, {50}, FIGHTER)
	ChangeTerritoryValues(BUILDTYPE, {51}, FRIGATE)
	ChangeTerritoryValues(PAYOUT, {50,51}, 100)
	
	tCenter = {offset, 0, -offset}
	ChangeTerritoryValues(LOCATION, {42}, {tCenter[1], tCenter[2]+10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {43}, {tCenter[1], tCenter[2]-10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {50}, {tCenter[1]+6000, tCenter[2], tCenter[3]})
	ChangeTerritoryValues(LOCATION, {51}, {tCenter[1]-6000, tCenter[2], tCenter[3]})
	
	
	
	
	--child territories for 69
	ChangeTerritoryValues(PARENTID, {46,47,54,55}, 69)
	
	ChangeTerritoryValues(BUILDTYPE, {46,47}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {46,47}, 500)
	
	ChangeTerritoryValues(BUILDTYPE, {54}, FIGHTER)
	ChangeTerritoryValues(BUILDTYPE, {55}, FRIGATE)
	ChangeTerritoryValues(PAYOUT, {54,55}, 100)
	
	tCenter = {offset, 0, offset}
	ChangeTerritoryValues(LOCATION, {46}, {tCenter[1], tCenter[2]+10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {47}, {tCenter[1], tCenter[2]-10000, tCenter[3]})
	ChangeTerritoryValues(LOCATION, {54}, {tCenter[1]+6000, tCenter[2], tCenter[3]})
	ChangeTerritoryValues(LOCATION, {55}, {tCenter[1]-6000, tCenter[2], tCenter[3]})
	
	
	
	
	
	
	--central territories
	ChangeTerritoryValues(BUILDTYPE, {20,21,30,38,27,35,44,45}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {20,21,30,38,27,35,44,45}, 250)
	
	
	--other misc buildable territories
	ChangeTerritoryValues(BUILDTYPE, {2}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {9}, CORVETTE)

	ChangeTerritoryValues(BUILDTYPE, {7}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {16}, FRIGATE)

	ChangeTerritoryValues(BUILDTYPE, {49}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {58}, CORVETTE)

	ChangeTerritoryValues(BUILDTYPE, {56}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {63}, FRIGATE)
	
	
	ChangeTerritoryValues(BUILDTYPE, {12}, CAPITAL)
	ChangeTerritoryValues(BUILDTYPE, {13}, CORVETTE)
	
	ChangeTerritoryValues(BUILDTYPE, {31}, CAPITAL)
	ChangeTerritoryValues(BUILDTYPE, {39}, CORVETTE)
	
	ChangeTerritoryValues(BUILDTYPE, {53}, CAPITAL)
	ChangeTerritoryValues(BUILDTYPE, {52}, CORVETTE)
	
	ChangeTerritoryValues(BUILDTYPE, {34}, CAPITAL)
	ChangeTerritoryValues(BUILDTYPE, {26}, CORVETTE)
	
	
	

	
	


	--echo("TERRITORIES: ")
	--for i = 1,69 do
		--print(" [" .. i .. "]: buildtype: " .. Territories[i][BUILDTYPE] .. ", payout: ")-- .. Territories[i][PAYOUT])
		
		--print(" [" .. i .. "]: buildtype: " .. Territories[i][BUILDTYPE] .. ", x: " .. Territories[i][LOCATION][1] .. ", y: " .. Territories[i][LOCATION][2] .. ", z: " .. Territories[i][LOCATION][3])
	--end	
	
	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	local connection1 = 0
	local connection2 = 0
	for i = 1, NUM_ROWS*NUM_COLS, NUM_COLS do
		for j = 1,NUM_COLS-1 do
			connection1 = i+j-1
			connection2 = connection1 + 1
			--if (connection1~=28 and connection2~=28) and  (connection1~=29 and connection2~=29) and  (connection1~=36 and connection2~=36) and  (connection1~=37 and connection2~=37) then
			if Territories[connection1][PARENTID] == PARENT and Territories[connection2][PARENTID] == PARENT then
				AddConnection(connection1, connection2)
			end
		end
	end



	for i = 1,(NUM_ROWS-1)*NUM_COLS,NUM_COLS do
		for j = 1,NUM_COLS do
			connection1 = i+j-1
			connection2 = connection1 + NUM_COLS
			--if (connection1~=28 and connection2~=28) and  (connection1~=29 and connection2~=29) and  (connection1~=36 and connection2~=36) and  (connection1~=37 and connection2~=37) then
			if Territories[connection1][PARENTID] == PARENT and Territories[connection2][PARENTID] == PARENT then
				AddConnection(connection1, connection2)
			end
		end
	end


	AddConnection(66, 65)
	AddConnection(67, 65)
	AddConnection(65, 68)
	AddConnection(65, 69)
	
	
	AddConnection(20,27)
	AddConnection(21,30)
	AddConnection(35,44)
	AddConnection(38,45)
	
	
	AddConnection(66,4)
	AddConnection(66,25)
	AddConnection(67,5)
	AddConnection(67,32)
	AddConnection(68,33)
	AddConnection(68,60)
	AddConnection(69,40)
	AddConnection(69,61)
	
	
	--test:
	--AddConnection(1,10) --PARENT_TO_CHILD
	--AddConnection(19,12) --CHILD_TO_PARENT
	--AddConnection(43,54) --CHILD_TO_CHILD
	
	
	
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 64
	PlayerStartTerritories[2] = 8
	PlayerStartTerritories[3] = 57
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


