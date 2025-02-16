

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
	
	
	local height = 0
	local i = 0
	local counter = 0

	for height = 33000,-33000,-22000 do
		for i = 1,6 do
			counter = counter + 1
			Territories[counter] = { PARENT, { round(cos((i-1)*60)*26000), height, round(sin((i-1)*60)*26000) }, FIGHTER, 200 }
		end
	end

	ChangeTerritoryValues(PAYOUT, {1,10,22,13}, 500)
	ChangeTerritoryValues(BUILDTYPE, {3,5,8,12,15,17,20,24}, RESOURCE_ONLY)
	ChangeTerritoryValues(PAYOUT, {3,5,8,12,15,17,20,24}, 1000)

	ChangeTerritoryValues(BUILDTYPE, {2,9,18,23}, CORVETTE)
	ChangeTerritoryValues(BUILDTYPE, {6,11,14,21}, FRIGATE)
	ChangeTerritoryValues(BUILDTYPE, {4,7,16,19}, CAPITAL)	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	for i = 1,5 do
		AddConnection(i, i+1)
		AddConnection(i+6, i+7)
		AddConnection(i+12, i+13)
		AddConnection(i+18, i+19)
	end
	
	AddConnection(1,6)
	AddConnection(7,12)
	AddConnection(13,18)
	AddConnection(19,24)
	AddConnection(2,8)
	AddConnection(5,11)
	AddConnection(8,14)
	AddConnection(11,17)
	AddConnection(14,20)
	AddConnection(17,23)
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 22
	PlayerStartTerritories[2] = 10
	PlayerStartTerritories[3] = 13
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


