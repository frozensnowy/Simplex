

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
	
	local dist1 = 40000
	local dist2 = 20000

	local dist3 = 30000
	local dist4 = 10000

	local dist5 = 0


	local dist = 72000
	Territories[1] = { PARENT, { -dist1,0,dist }, FIGHTER, 500 }
	Territories[2] = { PARENT, { -dist2,0,dist }, CORVETTE, 200 }
	Territories[3] = { PARENT, { 0,0,dist }, RESOURCE_ONLY, 1000 }
	Territories[4] = { PARENT, { dist2,0,dist }, CORVETTE, 200 }
	Territories[5] = { PARENT, { dist1,0,dist }, FIGHTER, 500 }

	dist = 54000
	Territories[6] = { PARENT, { -dist3,0,dist }, FRIGATE, 200 }
	Territories[7] = { PARENT, { -dist4,0,dist }, FIGHTER, 200 }
	Territories[8] = { PARENT, { dist4,0,dist }, FIGHTER, 200 }
	Territories[9] = { PARENT, { dist3,0,dist }, FRIGATE, 200 }

	dist = 36000
	Territories[10] = { PARENT, { -dist2,0,dist }, CAPITAL, 200 }
	Territories[11] = { PARENT, { 0,0,dist }, RESOURCE_ONLY, 1000 }
	Territories[12] = { PARENT, { dist2,0,dist }, CAPITAL, 200 }

	dist = 18000
	Territories[13] = { PARENT, { -dist4,0,dist }, FRIGATE, 200 }
	Territories[14] = { PARENT, { dist4,0,dist }, CORVETTE, 200 }

	dist = 0
	Territories[15] = { PARENT, { -dist2,0,dist }, RESOURCE_ONLY, 1000 }
	Territories[16] = { PARENT, { 0,0,dist }, RESOURCE_ONLY, 1500 }
	Territories[17] = { PARENT, { dist2,0,dist }, RESOURCE_ONLY, 1000 }

	dist = -18000
	Territories[18] = { PARENT, { -dist4,0,dist }, CORVETTE, 200 }
	Territories[19] = { PARENT, { dist4,0,dist }, FRIGATE, 200 }

	dist = -36000
	Territories[20] = { PARENT, { -dist2,0,dist }, CAPITAL, 200 }
	Territories[21] = { PARENT, { 0,0,dist }, RESOURCE_ONLY, 1000 }
	Territories[22] = { PARENT, { dist2,0,dist }, CAPITAL, 200 }

	dist = -54000
	Territories[23] = { PARENT, { -dist3,0,dist }, FRIGATE, 200 }
	Territories[24] = { PARENT, { -dist4,0,dist }, FIGHTER, 200 }
	Territories[25] = { PARENT, { dist4,0,dist }, FIGHTER, 200 }
	Territories[26] = { PARENT, { dist3,0,dist }, FRIGATE, 200 }

	dist = -72000
	Territories[27] = { PARENT, { -dist1,0,dist }, FIGHTER, 500 }
	Territories[28] = { PARENT, { -dist2,0,dist }, CORVETTE, 200 }
	Territories[29] = { PARENT, { 0,0,dist }, RESOURCE_ONLY, 1000 }
	Territories[30] = { PARENT, { dist2,0,dist }, CORVETTE, 200 }
	Territories[31] = { PARENT, { dist1,0,dist }, FIGHTER, 500 }	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	AddConnection(1,6)
	AddConnection(6,10)
	AddConnection(10,13)
	AddConnection(13,15)
	AddConnection(15,18)
	AddConnection(18,20)
	AddConnection(20,23)
	AddConnection(23,27)
	AddConnection(5,9)
	AddConnection(9,12)
	AddConnection(12,14)
	AddConnection(14,17)
	AddConnection(17,19)
	AddConnection(19,22)
	AddConnection(22,26)
	AddConnection(26,31)
	AddConnection(16,13)
	AddConnection(16,14)
	AddConnection(16,18)
	AddConnection(16,19)
	AddConnection(13,14)
	AddConnection(18,19)
	AddConnection(10,11)
	AddConnection(11,12)
	AddConnection(20,21)
	AddConnection(21,22)
	AddConnection(6,7)
	AddConnection(8,9)
	AddConnection(23,24)
	AddConnection(25,26)
	AddConnection(1,2)
	AddConnection(4,5)
	AddConnection(27,28)
	AddConnection(30,31)
	AddConnection(2,7)
	AddConnection(7,3)
	AddConnection(3,8)
	AddConnection(8,4)
	AddConnection(28,24)
	AddConnection(24,29)
	AddConnection(29,25)
	AddConnection(25,30)
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 31
	PlayerStartTerritories[2] = 5
	PlayerStartTerritories[3] = 27
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


