

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
	
	Territories[1] = { PARENT, { 0,0,0 }, RESOURCE_ONLY, 1500, 4000 }

	local dist1 = 12000
	local dist2 = 30000
	local dist3 = 48000
	local dist4 = 63000

	Territories[2] = { PARENT, { dist1,0,dist1 }, RESOURCE_ONLY, 1000 }
	Territories[3] = { PARENT, { dist1,0,-dist1 }, RESOURCE_ONLY, 1000 }
	Territories[4] = { PARENT, { -dist1,0,dist1 }, RESOURCE_ONLY, 1000 }
	Territories[5] = { PARENT, { -dist1,0,-dist1 }, RESOURCE_ONLY, 1000 }

	Territories[6] = { PARENT, { dist2,0,dist1 }, CAPITAL, 200 }
	Territories[7] = { PARENT, { dist2,0,-dist1 }, FRIGATE, 200 }
	Territories[8] = { PARENT, { -dist2,0,dist1 }, FRIGATE, 200 }
	Territories[9] = { PARENT, { -dist2,0,-dist1 }, CAPITAL, 200 }

	Territories[10] = { PARENT, { dist1,0,dist2 }, FRIGATE, 200 }
	Territories[11] = { PARENT, { -dist1,0,dist2 }, CAPITAL, 200 }
	Territories[12] = { PARENT, { dist1,0,-dist2 }, CAPITAL, 200 }
	Territories[13] = { PARENT, { -dist1,0,-dist2 }, FRIGATE, 200 }

	Territories[14] = { PARENT, { dist3,0,dist1 }, FRIGATE, 200 }
	Territories[15] = { PARENT, { dist3,0,-dist1 }, CORVETTE, 200 }
	Territories[16] = { PARENT, { -dist3,0,dist1 }, CORVETTE, 200 }
	Territories[17] = { PARENT, { -dist3,0,-dist1 }, FRIGATE, 200 }

	Territories[18] = { PARENT, { dist1,0,dist3 }, CORVETTE, 200 }
	Territories[19] = { PARENT, { -dist1,0,dist3 }, FRIGATE, 200 }
	Territories[20] = { PARENT, { dist1,0,-dist3 }, FRIGATE, 200 }
	Territories[21] = { PARENT, { -dist1,0,-dist3 }, CORVETTE, 200 }

	Territories[22] = { PARENT, { 0,0,dist4 }, FIGHTER, 500 }
	Territories[23] = { PARENT, { 0,0,-dist4 }, FIGHTER, 500 }
	Territories[24] = { PARENT, { dist4,0,0 }, FIGHTER, 500 }
	Territories[25] = { PARENT, { -dist4,0,0 }, FIGHTER, 500 }	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	
	AddConnection(1,2)
	AddConnection(1,3)
	AddConnection(1,4)
	AddConnection(1,5)
	AddConnection(2,3)
	AddConnection(3,5)
	AddConnection(5,4)
	AddConnection(4,2)
	AddConnection(5,13)
	AddConnection(13,21)
	AddConnection(21,23)
	AddConnection(23,20)
	AddConnection(20,12)
	AddConnection(12,3)
	AddConnection(3,7)
	AddConnection(7,15)
	AddConnection(15,24)
	AddConnection(24,14)
	AddConnection(14,6)
	AddConnection(6,2)
	AddConnection(2,10)
	AddConnection(10,18)
	AddConnection(18,22)
	AddConnection(22,19)
	AddConnection(19,11)
	AddConnection(11,4)
	AddConnection(4,8)
	AddConnection(8,16)
	AddConnection(16,25)
	AddConnection(25,17)
	AddConnection(17,9)
	AddConnection(9,5)	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 22
	PlayerStartTerritories[1] = 23
	PlayerStartTerritories[2] = 25
	PlayerStartTerritories[3] = 24
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


