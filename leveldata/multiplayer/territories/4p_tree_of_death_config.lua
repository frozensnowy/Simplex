

--*********** MISCELLANEOUS SETTINGS ***********
--These settings are usually used only for level development:

--AddLocatorShip = 1 --ADD A SQUAD OF SCOUTS TO ALLOW PRINTING OF COORDINATES
AuditMap = 0 --INFORMATION ABOUT THE MAP WILL BE PRINTED OUT (Possible values: 1 or 2, for level of detail)






function SetupTerritoryTables()
	
	
	--*********** DEFAULT TERRITORY SIZE ***********
	--By changing the DefaultTerritorySize variable, you can set the size of all territories (unless overwritten)
	DefaultTerritorySize = 5500
	
	
	
	
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
	--(Don't use tinsert, tremove, or getn)
	--local counter = 0
	--local i = 0
	--for i = 1,10 do
	--	counter = counter = counter + 1
	--	Territories[counter] = { {10000, 0, 0}, FIGHTER, 500 }
	--end
	
	--FUNCTION TO CHANGE VALUES IN Territories TABLE:
	--ChangeTerritoryValues(iDataMember, tAffectedIDs, NewValue)
	--ChangeTerritoryValues(BUILDTYPE, {1,2,3,4}, RESOURCE_ONLY)
	--ChangeTerritoryValues(PAYOUT, {5,15,15,20}, 1000)
	
	
	local height1 = -32000
	local height2 = -11000
	local height3 = 11000
	local height4 = 25000
	local offset1 = 0
	
	Territories[1] = { PARENT, {0, height1, 0}, EMPTY, 500, 7000 }
	
	offset1 = 9000
	Territories[2] = { PARENT, {offset1, height2, offset1}, EMPTY, 0 }
	Territories[3] = { PARENT, {offset1, height2, -offset1}, EMPTY, 0 }
	Territories[4] = { PARENT, {-offset1, height2, offset1}, EMPTY, 0 }
	Territories[5] = { PARENT, {-offset1, height2, -offset1}, EMPTY, 0 }
	
	offset1 = 11000
	offset2 = 25000
	Territories[6] = { PARENT, {offset1, height3, offset2}, RESOURCE_ONLY, 500 }
	Territories[7] = { PARENT, {offset1, height3, -offset2}, RESOURCE_ONLY, 500 }
	Territories[8] = { PARENT, {-offset1, height3, offset2}, RESOURCE_ONLY, 500 }
	Territories[9] = { PARENT, {-offset1, height3, -offset2}, RESOURCE_ONLY, 500 }
	Territories[10] = { PARENT, {offset2, height3, offset1}, RESOURCE_ONLY, 500 }
	Territories[11] = { PARENT, {offset2, height3, -offset1}, RESOURCE_ONLY, 500 }
	Territories[12] = { PARENT, {-offset2, height3, offset1}, RESOURCE_ONLY, 500 }
	Territories[13] = { PARENT, {-offset2, height3, -offset1}, RESOURCE_ONLY, 500 }
	
	offset1 = 18000
	offset2 = 40900
	Territories[14] = { PARENT, {offset1, height4, offset2}, RESOURCE_ONLY, 500 }
	Territories[15] = { PARENT, {offset1, height4, -offset2}, RESOURCE_ONLY, 500 }
	Territories[16] = { PARENT, {-offset1, height4, offset2}, RESOURCE_ONLY, 500 }
	Territories[17] = { PARENT, {-offset1, height4, -offset2}, RESOURCE_ONLY, 500 }
	Territories[18] = { PARENT, {offset2, height4, offset1}, RESOURCE_ONLY, 500 }
	Territories[19] = { PARENT, {offset2, height4, -offset1}, RESOURCE_ONLY, 500 }
	Territories[20] = { PARENT, {-offset2, height4, offset1}, RESOURCE_ONLY, 500 }
	Territories[21] = { PARENT, {-offset2, height4, -offset1}, RESOURCE_ONLY, 500 }
	
	
	local postOffset = 1600
	
	Territories[22] = { 16, {-offset1+postOffset, height4, offset2}, FIGHTER, 100 }
	Territories[23] = { 16, {-offset1-postOffset, height4, offset2}, CORVETTE, 100 }
	
	Territories[24] = { 15, {offset1+postOffset, height4, -offset2}, FIGHTER, 100 }
	Territories[25] = { 15, {offset1-postOffset, height4, -offset2}, CORVETTE, 100 }
	
	Territories[26] = { 18, {offset2+postOffset, height4, offset1}, FIGHTER, 100 }
	Territories[27] = { 18, {offset2-postOffset, height4, offset1}, CORVETTE, 100 }
	
	Territories[28] = { 21, {-offset2+postOffset, height4, -offset1}, FIGHTER, 100 }
	Territories[29] = { 21, {-offset2-postOffset, height4, -offset1}, CORVETTE, 100 }
	
	
	offset1 = 11000
	offset2 = 25000
	Territories[30] = { 8, {-offset1+postOffset, height3, offset2}, FRIGATE, 100 }
	Territories[31] = { 8, {-offset1-postOffset, height3, offset2}, CAPITAL, 100 }
	
	Territories[32] = { 7, {offset1+postOffset, height3, -offset2}, FRIGATE, 100 }
	Territories[33] = { 7, {offset1-postOffset, height3, -offset2}, CAPITAL, 100 }
	
	Territories[34] = { 10, {offset2+postOffset, height3, offset1}, FRIGATE, 100 }
	Territories[35] = { 10, {offset2-postOffset, height3, offset1}, CAPITAL, 100 }
	
	Territories[36] = { 13, {-offset2+postOffset, height3, -offset1}, FRIGATE, 100 }
	Territories[37] = { 13, {-offset2-postOffset, height3, -offset1}, CAPITAL, 100 }
	
	
	local genOffset = 3200
	
	Territories[38] = { 1, {genOffset, height1+1500, 0}, RESOURCE_ONLY, 500 }
	Territories[39] = { 1, {-genOffset, height1+1500, 0}, RESOURCE_ONLY, 500 }
	Territories[40] = { 1, {0, height1+1500, genOffset}, RESOURCE_ONLY, 500 }
	Territories[41] = { 1, {0, height1+1500, -genOffset}, RESOURCE_ONLY, 500 }
	
	
	
	
	
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
	AddConnection(2,4)
	AddConnection(4,5)
	AddConnection(5,3)
	
	AddConnection(2,6)
	AddConnection(2,10)
	
	AddConnection(3,7)
	AddConnection(3,11)
	
	AddConnection(4,8)
	AddConnection(4,12)
	
	AddConnection(5,9)
	AddConnection(5,13)
	
	AddConnection(6,14)
	AddConnection(7,15)
	AddConnection(8,16)
	AddConnection(9,17)
	AddConnection(10,18)
	AddConnection(11,19)
	AddConnection(12,20)
	AddConnection(13,21)
	
	
	
	
	--*********** PLAYER START POSITIONS ***********
	--SPECIFY THE COMMAND POST THAT EACH PLAYER STARTS WITH
	--FORMAT: PlayerStartTerritories[iPlayerID] = iTerritoryID
	
	PlayerStartTerritories[0] = 22 --16
	PlayerStartTerritories[1] = 24 --15
	PlayerStartTerritories[2] = 26 --18
	PlayerStartTerritories[3] = 28 --21
	
	
	
	
end



function PlayMiscellaneousEffects()
	
	
	--*********** MISCELLANEOUS FX ***********
	--Play any other fx for a map here
	
	--SAMPLE:
	--FX_PlayEffect("pro_tech_flare_spray", "fx_point1", 7) --sparks
	
	
	SobGroup_SetMadState("planetkiller", "NIS00")
	
	
	
end


