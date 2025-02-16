
--This file contains code used in both level and game rule scope


--CONSTANTS:

--territory table entry indexes
PARENTID = 1
LOCATION = 2
BUILDTYPE = 3
PAYOUT = 4
SIZE = 5

--extended indexes used by game rule and AI
OWNER = 6
RACE = 7
PAYOUT_RATE = 8
PINGID = 9
NEIGHBOURS = 10
ASSOCIATES = 11
PATHS = 12
CHILDSTATS = 13
PLAYERSTATS = 14



--child stats indexes
neighbourCount = 1
numChildren = 2
numCommandPosts = 3
numRUGenerators = 4
commandPostIDs = 5
ruGeneratorIDs = 6
totalPayoutFromAllPosts = 7
totalPostCount = 8
unclaimedCount = 9


--player stats indexes




--build types for territories
FIGHTER = 1
CORVETTE = 2
FRIGATE = 3
CAPITAL = 4
EMPTY = 5
RESOURCE_ONLY = 6

UTILITY = 7 --not a build type, but needed for ship classes
PLATFORM = 8



--neighbour types
PARENT_TO_PARENT = 1
PARENT_TO_CHILD = 2
CHILD_TO_PARENT = 3
CHILD_TO_CHILD = 4
OVERLAPPING = 5


--beam colours
BLUE = "blue"
GREEN = "green"
PURPLE = "purple"
RED = "red"
WHITE = "white"
YELLOW = "yellow"


PARENT = 0 --for parent ID in TerritoryStats table

OFF = 0
ON = 1

ALWAYS_NEUTRAL = 1
MUST_OWN_TERRITORY = 2
CAPTURABLE = 3

CAPTURE_COMMAND_POSTS = 1
DESTROY_ALL_SHIPS = 2

ALLIED_CPU = 4
ENEMY_CPU = 5


AuditMap = 0

gConnectionCounter = 0


--territory turn-back settings
--(any ships that stray between this far outside a territory will get turned back, then get destroyed)
gTerritoryBufferSize = 900		--how much space outside a territory is still considered part of the territory
gTerritoryStopBufferSize = 2400	--ships that make it out this far outside a territory get destroyed



DefaultTerritorySize = 5000 --this value can be changed in a level config file



Territories = {}
TerritoryConnections = {}
PlayerStartTerritories = {[0]=0, [1]=0, [2]=0, [3]=0}



--COMMON FUNCTIONS
function ChangeTerritoryValues(iDataMember, tAffectedIDs, NewValue)
	--SEND A LIST OF TABLE ENTRIES TO MODIFY
	local idx = 0
	local entry = 0
	for idx,entry in tAffectedIDs do
		if idx ~= "n" then
			Territories[entry][iDataMember] = NewValue
		end
	end
end


function GetTerritorySize(iTerritoryID)
	if Territories[iTerritoryID][SIZE] == nil then
		return DefaultTerritorySize
	else
		return Territories[iTerritoryID][SIZE]
	end
end


function AddConnection(iTerritoryID1, iTerritoryID2, iColour)
	--ADD AN ENTRY TO THE TerritoryConnections TABLE
	gConnectionCounter = gConnectionCounter + 1
	TerritoryConnections[gConnectionCounter] = {iTerritoryID1, iTerritoryID2, iColour}
end


function round(fNumber)
	--RETURNS THE NEAREST INTEGER
	return floor(fNumber + 0.5)
end


function GetDistanceBetweenTwoPoints(tPoint1, tPoint2)
	--RETURNS THE DISTANCE BETWEEN THE TWO COORDINATES
	local Xdist = 0
	local Zdist = 0
	local Ydist = 0
	if tPoint1[1] > tPoint2[1] then Xdist = tPoint1[1] - tPoint2[1] else Xdist = tPoint2[1] - tPoint1[1] end
	if tPoint1[2] > tPoint2[2] then Zdist = tPoint1[2] - tPoint2[2] else Zdist = tPoint2[2] - tPoint1[2] end
	if tPoint1[3] > tPoint2[3] then Ydist = tPoint1[3] - tPoint2[3] else Ydist = tPoint2[3] - tPoint1[3] end
	return sqrt((Xdist*Xdist) + (Ydist*Ydist) + (Zdist*Zdist))
end


