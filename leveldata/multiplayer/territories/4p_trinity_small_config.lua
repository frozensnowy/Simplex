

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
	
	local radius = 25000
	Territories[1] = { PARENT, { 0, 0, -radius }, EMPTY, 0, 18000 }
	Territories[2] = { PARENT, { round(sin(120)*radius), 0, radius/2 }, EMPTY, 0, 18000 }
	Territories[3] = { PARENT, { -round(sin(120)*radius), 0, radius/2 }, EMPTY, 0, 18000 }
	
	radius = 60000
	Territories[4] = { PARENT, { 0, 0, -radius }, EMPTY, 0 }
	Territories[5] = { PARENT, { round(sin(120)*radius), 0, radius/2 }, EMPTY, 0 }
	Territories[6] = { PARENT, { -round(sin(120)*radius), 0, radius/2 }, EMPTY, 0 }
	
	radius = 77000
	Territories[7] = { PARENT, { 0, 0, -radius }, EMPTY, 0, 6000 }
	Territories[8] = { PARENT, { round(sin(120)*radius), 0, radius/2 }, EMPTY, 0, 6000 }
	Territories[9] = { PARENT, { -round(sin(120)*radius), 0, radius/2 }, EMPTY, 0, 6000 }
	
	
	Territories[10] = { PARENT, { 0,-22000,0 }, RESOURCE_ONLY, 500 }
	Territories[11] = { PARENT, { 0,-38000,0 }, RESOURCE_ONLY, 1000 }	
	
	Territories[12] = { PARENT, { 0,22000,0 }, EMPTY, 0, 4500 }
	Territories[13] = { PARENT, { 0,38000,0 }, EMPTY, 0, 4500 }	
	
	
	Territories[14] = { 7, { -1000, -200, -77000 }, FIGHTER, 100 }
	Territories[15] = { 7, { 1000, -200, -77000 }, CORVETTE, 100 }	
	Territories[16] = { 4, { 1000, -200, -60000 }, FRIGATE, 100 }
	Territories[17] = { 4, { -1000, -200, -60000 }, CAPITAL, 100 }	
	
	Territories[18] = { 12, { 1000,22000,0 }, FRIGATE, 100 }
	Territories[19] = { 12, { -1000,22000,0 }, CAPITAL, 100 }
	Territories[20] = { 13, { 1000,38000,0 }, FIGHTER, 100 }
	Territories[21] = { 13, { -1000,38000,0 }, CORVETTE, 100 }
	
	radius = 77000
	Territories[22] = { 8, { round(sin(120-2)*radius), 0, radius/2 }, FIGHTER, 100 }
	Territories[23] = { 8, { round(sin(120+2)*radius), 0, radius/2 }, CORVETTE, 100 }
	Territories[24] = { 9, { -round(sin(120-2)*radius), 0, radius/2 }, FIGHTER, 100 }
	Territories[25] = { 9, { -round(sin(120+2)*radius), 0, radius/2 }, CORVETTE, 100 }
	
	radius = 60000
	Territories[26] = { 5, { round(sin(120-2)*radius), 0, radius/2 }, FRIGATE, 100 }
	Territories[27] = { 5, { round(sin(120+2)*radius), 0, radius/2 }, CAPITAL, 100 }
	Territories[28] = { 6, { -round(sin(120-2)*radius), 0, radius/2 }, FRIGATE, 100 }
	Territories[29] = { 6, { -round(sin(120+2)*radius), 0, radius/2 }, CAPITAL, 100 }
	
	
	
	radius = 25000
	local dist = 10000
	
	Territories[30] = { 1, { 0+dist, 0, -radius }, RESOURCE_ONLY, 500 }
	Territories[31] = { 1, { 0-dist, 0, -radius }, RESOURCE_ONLY, 500 }
	Territories[32] = { 1, { 0, 0, -radius+dist }, RESOURCE_ONLY, 500 }
	Territories[33] = { 1, { 0, 0, -radius-dist }, RESOURCE_ONLY, 500 }
	
	Territories[34] = { 2, { round(sin(120)*radius)+dist, 0, radius/2 }, RESOURCE_ONLY, 500 }
	Territories[35] = { 2, { round(sin(120)*radius)-dist, 0, radius/2 }, RESOURCE_ONLY, 500 }
	Territories[36] = { 2, { round(sin(120)*radius), 0, radius/2+dist }, RESOURCE_ONLY, 500 }
	Territories[37] = { 2, { round(sin(120)*radius), 0, radius/2-dist }, RESOURCE_ONLY, 500 }
	
	Territories[38] = { 3, { -round(sin(120)*radius)+dist, 0, radius/2 }, RESOURCE_ONLY, 500 }
	Territories[39] = { 3, { -round(sin(120)*radius)-dist, 0, radius/2 }, RESOURCE_ONLY, 500 }
	Territories[40] = { 3, { -round(sin(120)*radius), 0, radius/2+dist }, RESOURCE_ONLY, 500 }
	Territories[41] = { 3, { -round(sin(120)*radius), 0, radius/2-dist }, RESOURCE_ONLY, 500 }
	
	
	dist = 1000
	local height = 500
	
	Territories[42] = { 1, { 0+dist, height, -radius }, FRIGATE, 100 }
	Territories[43] = { 1, { 0-dist, height, -radius }, FIGHTER, 100 }
	
	Territories[44] = { 2, { round(sin(120)*radius)+dist, height, radius/2 }, FRIGATE, 100 }
	Territories[45] = { 2, { round(sin(120)*radius)-dist, height, radius/2 }, FIGHTER, 100 }
	
	Territories[46] = { 3, { -round(sin(120)*radius)+dist, height, radius/2 }, FRIGATE, 100 }
	Territories[47] = { 3, { -round(sin(120)*radius)-dist, height, radius/2 }, FIGHTER, 100 }
	
	
	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	
	AddConnection(1,2)
	AddConnection(2,3)
	AddConnection(3,1)
		
	AddConnection(1,4)
	AddConnection(4,7)
		
	AddConnection(2,5)
	AddConnection(5,8)
		
	AddConnection(3,6)
	AddConnection(6,9)
		
	AddConnection(10,11)
	AddConnection(10,1)
	AddConnection(10,2)
	AddConnection(10,3)	
	
	AddConnection(12,13)
	AddConnection(12,1)
	AddConnection(12,2)
	AddConnection(12,3)	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 14
	PlayerStartTerritories[1] = 22
	PlayerStartTerritories[2] = 24
	PlayerStartTerritories[3] = 20
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


