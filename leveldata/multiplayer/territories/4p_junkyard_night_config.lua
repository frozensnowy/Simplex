

--*********** MISCELLANEOUS SETTINGS ***********
--These settings are usually used only for level development:

--AddLocatorShip = 1 --ADD A SQUAD OF SCOUTS TO ALLOW PRINTING OF COORDINATES
AuditMap = 0 --INFORMATION ABOUT THE MAP WILL BE PRINTED OUT (Possible values: 1 or 2, for level of detail)






function SetupTerritoryTables()
	
	
	--*********** DEFAULT TERRITORY SIZE ***********
	--By changing the DefaultTerritorySize variable, you can set the size of all territories (unless overwritten)
	DefaultTerritorySize = 9000
	
	
	
	
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
	
	
	Territories[1] = { PARENT, { 3880, -258, 15350 }, RESOURCE_ONLY, 250 }
	Territories[2] = { PARENT, { 22089, 1502, 14394 }, RESOURCE_ONLY, 250 }
	Territories[3] = { PARENT, { 36191, 1501, 29469 }, RESOURCE_ONLY, 500, 14000 } --PLAYER 0 START POINT (PARENT)
	Territories[4] = { PARENT, { 25568, 6912, -2802 }, RESOURCE_ONLY, 250 }
	Territories[5] = { PARENT, { 23756, 3086, -20837 }, RESOURCE_ONLY, 250 }
	Territories[6] = { PARENT, { 43380, 1509, -31241 }, RESOURCE_ONLY, 500, 14000 } --PLAYER 3 START POINT (PARENT)
	Territories[7] = { PARENT, { -2807, 2188, -13449 }, RESOURCE_ONLY, 250 }
	Territories[8] = { PARENT, { -22361, 2146, -9522 }, RESOURCE_ONLY, 250 }
	Territories[9] = { PARENT, { -24841, 2144, -31426 }, RESOURCE_ONLY, 500, 14000 } --PLAYER 1 START POINT (PARENT)
	Territories[10] = { PARENT, { -11179, 1521, 3899 }, RESOURCE_ONLY, 250 }
	Territories[11] = { PARENT, { -22507, 1525, 15833 }, RESOURCE_ONLY, 250 }
	Territories[12] = { PARENT, { -8022, 338, 35062 }, RESOURCE_ONLY, 500, 14000 } --PLAYER 2 START POINT (PARENT)
	
	Territories[13] = { PARENT, { 5995, -7500, -1590 }, RESOURCE_ONLY, 1000, 7500 }
	Territories[14] = { PARENT, { 5995, 7500, -1590 }, RESOURCE_ONLY, 1000, 7500 }
	
	Territories[15] = { PARENT, { 37242, 1330, 8105 }, RESOURCE_ONLY, 250 }
	Territories[16] = { PARENT, { 40095, 2149, -12611 }, RESOURCE_ONLY, 250 }
	
	
	
	Territories[17] = { 3, { 37300, 2800, 27000 }, FIGHTER, 100 }
	Territories[18] = { 3, { 35600, 2000, 29000 }, FRIGATE, 100 }
	Territories[19] = { 3, { 37300, 2000, 29000 }, CORVETTE, 100 }
	Territories[20] = { 3, { 35600, 2800, 27000 }, CAPITAL, 100 }	
	
	Territories[21] = { 6, { 45000, 1400, -32700 }, FIGHTER, 100 }
	Territories[22] = { 6, { 41400, 1400, -32700 }, FRIGATE, 100 }
	Territories[23] = { 6, { 41400, 800, -31200 }, CAPITAL, 100 }
	Territories[24] = { 6, { 45000, 800, -31200 }, CORVETTE, 100 }	
	
	Territories[25] = { 12, { -8100, -200, 34800 }, FRIGATE, 100 }
	Territories[26] = { 12, { -6000, -200, 34800 }, CAPITAL, 100 }
	Territories[27] = { 12, { -6000, 507, 37000 }, CORVETTE, 100 }
	Territories[28] = { 12, { -8100, 506, 37000 }, FIGHTER, 100 }	
	
	Territories[29] = { 9, { -26100, 1500, -30500 }, CORVETTE, 100 }
	Territories[30] = { 9, { -22800, 1500, -30500 }, CAPITAL, 100 }
	Territories[31] = { 9, { -22800, 2300, -32500 }, FRIGATE, 100 }
	Territories[32] = { 9, { -26100, 2300, -32500 }, FIGHTER, 100 }	
	
	Territories[33] = { 4, { 25568, 7700, -2802 }, FRIGATE, 100 }
	Territories[34] = { 4, { 25568, 6000, -2802 }, CAPITAL, 100 }
	
	Territories[35] = { 10, { -11179, 2250, 3899 }, FRIGATE, 100 }
	Territories[36] = { 10, { -11179, 850, 3899 }, CAPITAL, 100 }

	
	
	local i = 0
	for i = 1,36 do
		Territories[i][LOCATION] = MultiplyTerritoryLocation(Territories[i][LOCATION])
	end
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	local mainColour = GREEN
	
	AddConnection(3,2,mainColour)
	AddConnection(2,1,mainColour)
	AddConnection(1,12,mainColour)
		
	AddConnection(6,5,mainColour)
	AddConnection(5,7,mainColour)
	AddConnection(7,9,mainColour)
		
	AddConnection(2,4,mainColour)
	AddConnection(4,5,mainColour)
		
	AddConnection(1,10,mainColour)
	AddConnection(10,7,mainColour)
		
	AddConnection(10,11,mainColour)
	AddConnection(10,8,mainColour)
	AddConnection(10,13,mainColour)
		
	AddConnection(4,15,mainColour)
	AddConnection(4,16,mainColour)
	AddConnection(4,14,mainColour)	
	
	AddConnection(13,14,mainColour)	
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 17
	PlayerStartTerritories[1] = 32
	PlayerStartTerritories[2] = 28
	PlayerStartTerritories[3] = 21
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	FX_PlayEffect("pro_tech_flare_spray", "fx_point2", 7) --sparks
	FX_PlayEffect("pro_tech_flare_spray", "fx_point3", 3) --sparks
	
	
	
	
end


function MultiplyTerritoryLocation(tCoord)
	local newMultiplier = 1.6
	return { tCoord[1]*newMultiplier, tCoord[2]*newMultiplier, tCoord[3]*newMultiplier }
end

