

--*********** MISCELLANEOUS SETTINGS ***********
--These settings are usually used only for level development:

--AddLocatorShip = 1 --ADD A SQUAD OF SCOUTS TO ALLOW PRINTING OF COORDINATES
AuditMap = 1 --INFORMATION ABOUT THE MAP WILL BE PRINTED OUT (Possible values: 1 or 2, for level of detail)





function SetupTerritoryTables()
	
	
	--*********** DEFAULT TERRITORY SIZE ***********
	--By changing the DefaultTerritorySize variable, you can set the size of all territories (unless overwritten)
	DefaultTerritorySize = 8000
	
	
	
	
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
	
	
	local dist = 50000

	local i = 0
	for i = 1,8 do
		Territories[i] = { PARENT, { round(cos((i-1)*360/8)*dist), 0, round(sin((i-1)*360/8)*dist) }, FIGHTER, 500 }
	end

	Territories[9] = { PARENT, { 0, 0, 0 }, FIGHTER, 500, 30000 }
	
	
	
	
	
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
	AddConnection(5,6)
	AddConnection(6,7)
	AddConnection(7,8)
	AddConnection(8,1)
		
	AddConnection(2,9)
	AddConnection(4,9)
	AddConnection(6,9)
	AddConnection(8,9)
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 5
	PlayerStartTerritories[2] = 3
	PlayerStartTerritories[3] = 7
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


