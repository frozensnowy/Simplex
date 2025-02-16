

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
	
	
	local dist = 40000
	local dist2 = dist/2
	local dist3 = 9000

	--inside 4
	Territories[1] = { PARENT, { dist3,0,dist3 }, FIGHTER, 500, 4500 }
	Territories[2] = { PARENT, { -dist3,0,-dist3 }, FIGHTER, 500, 4500 }
	Territories[3] = { PARENT, { dist3,0,-dist3 }, FIGHTER, 500, 4500 }
	Territories[4] = { PARENT, { -dist3,0,dist3 }, FIGHTER, 500, 4500 }

	--8 corners
	Territories[5] = { PARENT, { dist,dist,dist }, RESOURCE_ONLY, 1000 }
	Territories[6] = { PARENT, { -dist,dist,-dist }, RESOURCE_ONLY, 1000 }
	Territories[7] = { PARENT, { dist,dist,-dist }, RESOURCE_ONLY, 1000 }
	Territories[8] = { PARENT, { -dist,dist,dist }, RESOURCE_ONLY, 1000 }

	Territories[9] = { PARENT, { dist,-dist,dist }, RESOURCE_ONLY, 1000 }
	Territories[10] = { PARENT, { -dist,-dist,-dist }, RESOURCE_ONLY, 1000 }
	Territories[11] = { PARENT, { dist,-dist,-dist }, RESOURCE_ONLY, 1000 }
	Territories[12] = { PARENT, { -dist,-dist,dist }, RESOURCE_ONLY, 1000 }

	--horizontal lines between corners (1 per line)
	Territories[13] = { PARENT, { dist-dist2*2,dist,dist }, FRIGATE, 100 }
	Territories[14] = { PARENT, { dist-dist2*2,dist,-dist }, FRIGATE, 100 }
	Territories[15] = { PARENT, { dist,dist,dist-dist2*2 }, CAPITAL, 100 }
	Territories[16] = { PARENT, { -dist,dist,dist-dist2*2 }, CAPITAL, 100 }

	Territories[17] = { PARENT, { dist-dist2*2,-dist,dist }, FIGHTER, 100 }
	Territories[18] = { PARENT, { dist-dist2*2,-dist,-dist }, FIGHTER, 100 }
	Territories[19] = { PARENT, { dist,-dist,dist-dist2*2 }, CORVETTE, 100 }
	Territories[20] = { PARENT, { -dist,-dist,dist-dist2*2 }, CORVETTE, 100 }

	--vertical lines between corners (3 per line)
	Territories[21] = { PARENT, { dist,dist-dist2,dist }, CORVETTE, 100 }
	Territories[22] = { PARENT, { dist,dist-dist2*2,dist }, CAPITAL, 100 }
	Territories[23] = { PARENT, { dist,dist-dist2*3,dist }, FRIGATE, 100 }

	Territories[24] = { PARENT, { -dist,dist-dist2,-dist }, CORVETTE, 100 }
	Territories[25] = { PARENT, { -dist,dist-dist2*2,-dist }, CAPITAL, 100 }
	Territories[26] = { PARENT, { -dist,dist-dist2*3,-dist }, FRIGATE, 100 }

	Territories[27] = { PARENT, { dist,dist-dist2,-dist }, CORVETTE, 100 }
	Territories[28] = { PARENT, { dist,dist-dist2*2,-dist }, CAPITAL, 100 }
	Territories[29] = { PARENT, { dist,dist-dist2*3,-dist }, FRIGATE, 100 }

	Territories[30] = { PARENT, { -dist,dist-dist2,dist }, CORVETTE, 100 }
	Territories[31] = { PARENT, { -dist,dist-dist2*2,dist }, CAPITAL, 100 }
	Territories[32] = { PARENT, { -dist,dist-dist2*3,dist }, FRIGATE, 100 }	
	
	
	
	
	
	--*********** TERRITORY CONNECTIONS ***********
	--SPECIFY WHICH TERRITORIES ARE CONNECTED TO EACH OTHER (and an optional colour)
	--FORMAT: AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	
	--POSSIBLE COLOURS: BLUE, GREEN, PURPLE, RED, WHITE, YELLOW (default is BLUE)
	
	--EXAMPLES:
	--AddConnection(1, 2)
	--AddConnection(3, 4, RED)
	
	
	AddConnection(1,5)
	AddConnection(1,9)
	AddConnection(2,6)
	AddConnection(2,10)
	AddConnection(3,7)
	AddConnection(3,11)
	AddConnection(4,8)
	AddConnection(4,12)

	AddConnection(5,15)
	AddConnection(15,7) 
	AddConnection(5,13)
	AddConnection(13,8) 
	AddConnection(6,14)
	AddConnection(14,7) 
	AddConnection(6,16)
	AddConnection(16,8) 

	AddConnection(9,19)
	AddConnection(19,11) 
	AddConnection(9,17)
	AddConnection(17,12) 
	AddConnection(10,18)
	AddConnection(18,11) 
	AddConnection(10,20)
	AddConnection(20,12) 

	AddConnection(21,22)
	AddConnection(22,23) 
	AddConnection(24,25)
	AddConnection(25,26) 
	AddConnection(27,28)
	AddConnection(28,29) 
	AddConnection(30,31)
	AddConnection(31,32) 

	AddConnection(5,21)
	AddConnection(6,24)
	AddConnection(7,27)
	AddConnection(8,30)

	AddConnection(9,23)
	AddConnection(10,26)
	AddConnection(11,29)
	AddConnection(12,32)	
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 1
	PlayerStartTerritories[1] = 2
	PlayerStartTerritories[2] = 3
	PlayerStartTerritories[3] = 4
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	
	
	
	
end


