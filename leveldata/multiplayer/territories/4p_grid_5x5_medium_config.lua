

--*********** MISCELLANEOUS SETTINGS ***********
--These settings are usually used only for level development:

--AddLocatorShip = 1 --ADD A SQUAD OF SCOUTS TO ALLOW PRINTING OF COORDINATES
AuditMap = 0 --INFORMATION ABOUT THE MAP WILL BE PRINTED OUT (Possible values: 1 or 2, for level of detail)






function SetupTerritoryTables()
	
	
	--*********** DEFAULT TERRITORY SIZE ***********
	--By changing the DefaultTerritorySize variable, you can set the size of all territories (unless overwritten)
	DefaultTerritorySize = 13000
	
	
	
	
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
	
	local NUM_ROWS = 5
	local NUM_COLS = 5



	local offset = 38000

	local i = 0
	local j = 0








	local xCoords = {}
	local yCoords = {}

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
			Territories[terrID] = { PARENT, { x, 0, y }, FIGHTER, 100 }
		end
	end



	Territories[13][BUILDTYPE] = EMPTY
	Territories[13][SIZE] = 18000
	ChangeTerritoryValues(BUILDTYPE, {8,12,14,18}, RESOURCE_ONLY)
	ChangeTerritoryValues(BUILDTYPE, {6,22,20,4}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {2,10,24,16,11,15}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {7,9,17,19,3,23}, CAPITAL)

	ChangeTerritoryValues(PAYOUT, {8,12,14,18}, 1000)
	ChangeTerritoryValues(PAYOUT, {1,5,21,25}, 500)





	--child territories
	Territories[26] = { 13, { 0, 9000, 0 }, RESOURCE_ONLY, 1000 }
	Territories[27] = { 13, { 0, -9000, 0 }, RESOURCE_ONLY, 1000 }	
	
	
	
	
	
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
			AddConnection(connection1, connection2)
		end
	end



	for i = 1,(NUM_ROWS-1)*NUM_COLS,NUM_COLS do
		for j = 1,NUM_COLS do
			connection1 = i+j-1
			connection2 = connection1 + NUM_COLS
			AddConnection(connection1, connection2)
		end
	end	
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 25
	PlayerStartTerritories[2] = 5
	PlayerStartTerritories[3] = 21
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


