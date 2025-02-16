

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
	
	Territories[1] = { PARENT, { -55000,0,0 }, CAPITAL, 500, 6500 }
	Territories[2] = { PARENT, { -33000,0,0 }, FIGHTER, 200, 5500 }
	Territories[3] = { PARENT, { 0,0,0 }, RESOURCE_ONLY, 1500, 6500 }
	Territories[4] = { PARENT, { 33000,0,0 }, FIGHTER, 200, 5500 }
	Territories[5] = { PARENT, { 55000,0,0 }, CAPITAL, 500, 6500 }

	local dist1 = 22000
	local dist2 = 44000
	local counter = 5
	local degree = 0

	for degree = 60,300,60 do
		counter = counter + 1
		Territories[counter] = { PARENT, { -55000+cos(degree)*dist1,0,sin(degree)*dist1 }, FIGHTER, 200 }
		counter = counter + 1
		Territories[counter] = { PARENT, { -55000+cos(degree)*dist2,0,sin(degree)*dist2 }, FIGHTER, 200 }
	end

	for degree = 120,-120,-60 do
		counter = counter + 1
		Territories[counter] = { PARENT, { 55000+cos(degree)*dist1,0,sin(degree)*dist1 }, FIGHTER, 200 }
		counter = counter + 1
		Territories[counter] = { PARENT, { 55000+cos(degree)*dist2,0,sin(degree)*dist2 }, FIGHTER, 200 }
	end

	Territories[26] = { PARENT, { 0,0,20000 }, RESOURCE_ONLY, 1000, 4000 }
	Territories[27] = { PARENT, { 0,0,-20000 }, RESOURCE_ONLY, 1000, 4000 }


	ChangeTerritoryValues(PAYOUT, {9,23,13,19}, 500)

	ChangeTerritoryValues(BUILDTYPE, {7,8,12,18,22,25}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {6,10,14,16,20,24}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {11,15,17,21}, CAPITAL)	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	
	AddConnection(1,2)
	AddConnection(2,3)
	AddConnection(3,4)
	AddConnection(4,5)

	AddConnection(1,6)
	AddConnection(6,7)
	AddConnection(1,8)
	AddConnection(8,9)
	AddConnection(1,10)
	AddConnection(10,11)
	AddConnection(1,12)
	AddConnection(12,13)
	AddConnection(1,14)
	AddConnection(14,15)
	AddConnection(5,16)
	AddConnection(16,17)
	AddConnection(5,18)
	AddConnection(18,19)
	AddConnection(5,20)
	AddConnection(20,21)
	AddConnection(5,22)
	AddConnection(22,23)
	AddConnection(5,24)
	AddConnection(24,25)

	AddConnection(2,26)
	AddConnection(2,27)
	AddConnection(4,26)
	AddConnection(4,27)

	AddConnection(20,22)
	AddConnection(18,16)
	AddConnection(4,24)

	AddConnection(2,6)
	AddConnection(8,10)
	AddConnection(12,14)	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 9
	PlayerStartTerritories[1] = 23
	PlayerStartTerritories[2] = 13
	PlayerStartTerritories[3] = 19
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


