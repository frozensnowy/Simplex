

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
	
	
	local dist1 = 26000
	local dist2 = 18000

	Territories[1] = { PARENT, { -dist1,0,dist2 }, CAPITAL, 200 }
	Territories[2] = { PARENT, { 0,0,dist2 }, FIGHTER, 200 }
	Territories[3] = { PARENT, { dist1,0,dist2 }, CAPITAL, 200 }

	Territories[4] = { PARENT, { -dist1,0,0 }, EMPTY }
	Territories[5] = { PARENT, { 0,0,0 }, RESOURCE_ONLY, 1500, 6000 }
	Territories[6] = { PARENT, { dist1,0,0 }, EMPTY }

	Territories[7] = { PARENT, { -dist1,0,-dist2 }, CAPITAL, 200 }
	Territories[8] = { PARENT, { 0,0,-dist2 }, FIGHTER, 200 }
	Territories[9] = { PARENT, { dist1,0,-dist2 }, CAPITAL, 200 }

	dist1 = 42000
	dist2 = 19000

	Territories[10] = { PARENT, { -dist2,0,dist1 }, FRIGATE, 200 }
	Territories[11] = { PARENT, { 0,0,dist1 }, RESOURCE_ONLY, 1000 }
	Territories[12] = { PARENT, { dist2,0,dist1 }, CORVETTE, 200 }

	Territories[13] = { PARENT, { -dist2,0,-dist1 }, CORVETTE, 200 }
	Territories[14] = { PARENT, { 0,0,-dist1 }, RESOURCE_ONLY, 1000 }
	Territories[15] = { PARENT, { dist2,0,-dist1 }, FRIGATE, 200 }

	dist1 = 54000
	dist2 = 19000
	local dist3 = 19000

	Territories[16] = { PARENT, { -dist1,0,-dist2 }, FIGHTER, 500 }
	Territories[17] = { PARENT, { -dist1,0,dist2 }, FIGHTER, 500 }

	Territories[18] = { PARENT, { dist1,0,-dist2 }, FIGHTER, 500 }
	Territories[19] = { PARENT, { dist1,0,dist2 }, FIGHTER, 500 }

	Territories[20] = { PARENT, { -dist1,0,-dist2-dist3 }, FRIGATE, 200 }
	Territories[21] = { PARENT, { -dist1,0,dist2+dist3 }, FRIGATE, 200 }

	Territories[22] = { PARENT, { dist1,0,-dist2-dist3 }, FRIGATE, 200 }
	Territories[23] = { PARENT, { dist1,0,dist2+dist3 }, FRIGATE, 200 }


	Territories[24] = { PARENT, { -dist1-dist3,0,-dist2 }, CORVETTE, 200 }
	Territories[25] = { PARENT, { -dist1-dist3,0,dist2 }, CORVETTE, 200 }

	Territories[26] = { PARENT, { dist1+dist3,0,-dist2 }, CORVETTE, 200 }
	Territories[27] = { PARENT, { dist1+dist3,0,dist2 }, CORVETTE, 200 }	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	AddConnection(7,8)
	AddConnection(8,9)
	AddConnection(4,5)
	AddConnection(5,6)
	AddConnection(1,2)
	AddConnection(2,3)

	AddConnection(1,4)
	AddConnection(4,7)
	AddConnection(2,5)
	AddConnection(5,8)
	AddConnection(3,6)
	AddConnection(6,9)

	AddConnection(8,14)
	AddConnection(13,14)
	AddConnection(14,15)
	AddConnection(2,11)
	AddConnection(10,11)
	AddConnection(11,12)

	AddConnection(7,20)
	AddConnection(20,24)
	AddConnection(16,20)
	AddConnection(16,24)
	AddConnection(1,21)
	AddConnection(21,25)
	AddConnection(17,21)
	AddConnection(17,25)

	AddConnection(9,22)
	AddConnection(22,26)
	AddConnection(18,22)
	AddConnection(18,26)
	AddConnection(3,23)
	AddConnection(23,27)
	AddConnection(19,23)
	AddConnection(19,27)	
	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 17
	PlayerStartTerritories[1] = 18
	PlayerStartTerritories[2] = 16
	PlayerStartTerritories[3] = 19
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


