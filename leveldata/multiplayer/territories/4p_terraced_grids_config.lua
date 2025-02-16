

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
	
	local counter = 0
	local dist = 19000
	local i = 0
	local j = 0
	for i = 0,2 do
		for j = 0,2 do
			counter = counter + 1
			Territories[counter] = { PARENT, { i*dist,33000,j*dist }, FIGHTER, 200 }
		end
	end

	for i = 0,2 do
		for j = 0,2 do
			counter = counter + 1
			Territories[counter] = { PARENT, { -i*dist,11000,j*dist }, FIGHTER, 200 }
		end
	end

	for i = 0,2 do
		for j = 0,2 do
			counter = counter + 1
			Territories[counter] = { PARENT, { -i*dist,-11000,-j*dist }, FIGHTER, 200 }
		end
	end

	for i = 0,2 do
		for j = 0,2 do
			counter = counter + 1
			Territories[counter] = { PARENT, { i*dist,-33000,-j*dist }, FIGHTER, 200 }
		end
	end


	ChangeTerritoryValues(PAYOUT, {9,18,27,36}, 500)

	ChangeTerritoryValues(BUILDTYPE, {5,14,23,32}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {5,14,23,32}, 1500)

	ChangeTerritoryValues(BUILDTYPE, {1,10,19,28}, EMPTY)

	ChangeTerritoryValues(BUILDTYPE, {4,6,11,17,22,24,29,35}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {2,8,13,15,20,26,31,33}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {7,16,21,34}, CAPITAL)	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	local k = 0
	for k = 0,27,9 do
		for i = 0,2 do
			for j = 1,2 do
				AddConnection((i*3)+j+k, (i*3)+j+1+k)
			end
		end

		for i = 0,1 do
			for j = 1,3 do
				AddConnection((i*3)+j+k, (i*3)+j+3+k)
			end
		end
	end
	
	AddConnection(1,10)
	AddConnection(3,12)
	AddConnection(10,19)
	AddConnection(16,25)
	AddConnection(19,28)
	AddConnection(21,30)
	AddConnection(7,34)
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 9
	PlayerStartTerritories[1] = 36
	PlayerStartTerritories[2] = 18
	PlayerStartTerritories[3] = 27
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


