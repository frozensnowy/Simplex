

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
	
	local dist1 = 66000
	local dist2 = 48000
	local dist3 = 12000

	local i = 0
	for i = 1,16 do
		Territories[i] = { PARENT, { round(cos((i-1)*360/16)*dist1), 0, round(sin((i-1)*360/16)*dist1) }, FIGHTER, 200 }
	end

	for i = 17,33 do
		Territories[i] = { PARENT, { round(cos((i-17)*360/16)*dist2), 0, round(sin((i-17)*360/16)*dist2) }, FIGHTER, 200 }
	end

	Territories[33] = { PARENT, { dist3, 0, 0 }, FIGHTER, 500, 4000 }
	Territories[34] = { PARENT, { 0, 0, dist3 }, FIGHTER, 500, 4000 }
	Territories[35] = { PARENT, { -dist3, 0, 0 }, FIGHTER, 500, 4000 }
	Territories[36] = { PARENT, { 0, 0, -dist3 }, FIGHTER, 500, 4000 }


	ChangeTerritoryValues(PAYOUT, {1,5,9,13}, 500)

	ChangeTerritoryValues(BUILDTYPE, {33,34,35,36}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {33,34,35,36}, 1000)

	ChangeTerritoryValues(BUILDTYPE, {19,23,27,31}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {19,23,27,31}, 1000)

	ChangeTerritoryValues(BUILDTYPE, {17,21,25,29}, EMPTY)

	ChangeTerritoryValues(BUILDTYPE, {2,6,10,14,20,28}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {16,4,8,12,22,30}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {3,7,11,15,24,32}, CAPITAL)	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	
	local counter = 0
	for i = 1,15 do
		AddConnection(i, i+1)
		AddConnection(i+16, i+17)
	end
	
	AddConnection(1,16)
	AddConnection(17,32)
	AddConnection(3,19)
	AddConnection(7,23)
	AddConnection(11,27)
	AddConnection(15,31)
	AddConnection(17,33)
	AddConnection(21,34)
	AddConnection(25,35)
	AddConnection(29,36)
	AddConnection(34,36)
	AddConnection(34,35)
	AddConnection(36,33)	
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 9
	PlayerStartTerritories[2] = 5
	PlayerStartTerritories[3] = 13
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


