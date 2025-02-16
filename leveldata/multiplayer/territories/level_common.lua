

maxPlayers = 6
player = {}
player[0] = 
{ 
    id = 0, 
    name = "", 
    resources = 0, 
    raceID = 1, 
    startPos = 1, }
player[1] = 
{ 
    id = 1, 
    name = "", 
    resources = 0, 
    raceID = 1, 
    startPos = 1, }
player[2] = 
{ 
    id = 2, 
    name = "", 
    resources = 0, 
    raceID = 1, 
    startPos = 1, }
player[3] = 
{ 
    id = 3, 
    name = "", 
    resources = 0, 
    raceID = 1, 
    startPos = 1, }
player[4] = 
{ 
    id = 4, 
    name = "", 
    resources = 0, 
    raceID = 1, 
    startPos = 1, }
player[5] = 
{ 
    id = 5, 
    name = "", 
    resources = 0, 
    raceID = 1, 
    startPos = 1, }



dofilepath("Data:leveldata/multiplayer/territories/territories_common.lua")




function echo(sText)
	print("LVL: " .. sText)
end


function PrintPebbleCount()
	if AuditMap > 0 then
		echo("NUMBER OF PEBBLES: " .. gPebbleCounter)
	end
end



function GetParentID(iTerritoryID)
	if Territories[iTerritoryID][PARENTID] == PARENT then
		return iTerritoryID
	else
		return Territories[iTerritoryID][PARENTID]
	end
end


function SetupTerritories()
	local idx = 0
	local territory = 0
	for idx,territory in Territories do
		if idx ~= "n" then
			--echo(idx)
			addSphere("TerritoryVolume" .. idx, territory[LOCATION], GetTerritorySize(idx)+gTerritoryBufferSize)
			addSphere("TerritoryStopVolume" .. idx, territory[LOCATION], GetTerritorySize(idx)+gTerritoryStopBufferSize)
		end
	end
	
	--add proximity sensor to home locations so player cameras start at home
	createSOBGroup("StartShips")
	for idx = 0,3 do
		addSquadron("Start" .. idx, "Hgn_ProximitySensor", Territories[PlayerStartTerritories[idx]][LOCATION], idx, {0, 0, 0}, 0, 0)
		addToSOBGroup("Start" .. idx, "StartShips")
	end
end




function SetupTerritoryConnections()
	local idx = 0
	local connection = 0
	local vector = 0
	local distance = 0
	local pt1 = 0
	local pt2 = 0
	--echo("***** CONNECTIONS (A):")
	createSOBGroup("AllJumpGates")
	for idx,connection in TerritoryConnections do
		if idx ~= "n" then
			--echo(connection[1] .. ", " .. connection[2])
			vector,distance = GetVectorAndDistance(Territories[connection[1]][LOCATION], Territories[connection[2]][LOCATION])
			pt1 = GetTranslatedLocation(Territories[connection[1]][LOCATION], vector, GetTerritorySize(connection[1]))
			pt2 = GetTranslatedLocation(Territories[connection[1]][LOCATION], vector, distance-GetTerritorySize(connection[2]))
			addSphere("JumpPoint" .. connection[1] .. "_" .. connection[2], pt1, 100)
			addSphere("JumpPoint" .. connection[2] .. "_" .. connection[1], pt2, 100)
		end
	end
end


function AddConnectionPebbles()
	local idx = 0
	local connection = 0
	local vector = 0
	local distance = 0
	local pt1 = 0
	local pt2 = 0
	--echo("***** CONNECTIONS:")
	for idx,connection in TerritoryConnections do
		if idx ~= "n" then
			--echo(connection[1] .. ", " .. connection[2])
			vector,distance = GetVectorAndDistance(Territories[connection[1]][LOCATION], Territories[connection[2]][LOCATION])
			pt1 = GetTranslatedLocation(Territories[connection[1]][LOCATION], vector, GetTerritorySize(connection[1]))
			pt2 = GetTranslatedLocation(Territories[connection[1]][LOCATION], vector, distance-GetTerritorySize(connection[2]))
			MakePebbleLine(pt1, pt2, 550, 0)
		end
	end
end


function GetVectorAndDistance(tLocation1, tLocation2)
	--RETURNS THE VECTOR TO GET FROM LOCATION 1 TO LOCATION 2 AND THE DISTANCE BETWEEN THEM
	local returnVal = { 0,0,0 }
	local dist = GetDistanceBetweenTwoPoints(tLocation1, tLocation2)
	local i = 0
	for i = 1,3 do
		returnVal[i] = (tLocation2[i] - tLocation1[i]) / dist
	end
	return returnVal,dist
end


function GetTranslatedLocation(tStartLocation, tVector, iDistance)
	--RETURNS THE LOCATION RESULTING FROM TRANSLATING THE START POINT ALONG THE VECTOR FOR THE GIVEN DISTANCE
	local returnVal = { 0,0,0 }
	local i = 0
	for i = 1,3 do
		returnVal[i] = tStartLocation[i] + (tVector[i] * iDistance)
	end
	return returnVal
end












gPebbleCounter = 0


function MakePebbleRing(tCentreLocation, sAxis, iRadius, iNumberOfPebbles, iDegreeToStartOn, iMaxVariance, tDegreeRanges, sPebbleType)
	local degreeIncrement = 360/iNumberOfPebbles
	local degreeCounter = iDegreeToStartOn
	local pebbleCounter = 0
	local addPeb = 0
	local varianceToUse = iMaxVariance
	local variance1 = 0
	local variance2 = 0
	local variance3 = 0
	local originX = 0
	local originZ = 0
	local originY = 0
	
	if sPebbleType == nil then sPebbleType = "Pebble_0" end
	
	for pebbleCounter = 1,iNumberOfPebbles do
		varianceToUse = iMaxVariance
		
		--does it fall within range to show?
		addPeb = 1
		if tDegreeRanges ~= nil then
			addPeb = 0
			for id,range in tDegreeRanges do
				if (degreeCounter >= range[1]) and (degreeCounter <= range[2]) then
					addPeb = 1
					if range[3] ~= nil then varianceToUse = range[3] end
					break
				end
			end
		end
		
		--determine variance
		variance1 = random(-varianceToUse, varianceToUse)
		variance2 = random(-varianceToUse, varianceToUse)
		variance3 = random(-varianceToUse, varianceToUse)
		
		--add pebble
		originX = tCentreLocation[1]
		originZ = tCentreLocation[2]
		originY = tCentreLocation[3]
		
		if sAxis == "x" or sAxis == "X" then
			X = originX + variance1
			Z = originZ + (cos(degreeCounter) * iRadius) + variance2
			Y = originY + (sin(degreeCounter) * iRadius) + variance3
		elseif sAxis == "z" or sAxis == "Z" then
			X = originX + (cos(degreeCounter) * iRadius) + variance1
			Z = originZ + variance2
			Y = originY + (sin(degreeCounter) * iRadius) + variance3
		elseif sAxis == "y" or sAxis == "Y" then
			X = originX + (cos(degreeCounter) * iRadius) + variance1
			Z = originZ + (sin(degreeCounter) * iRadius) + variance2
			Y = originY + variance3
		end
		
		if addPeb == 1 then
			addPebble(sPebbleType, { X, Z, Y }, 0, 0, 0)
			gPebbleCounter = gPebbleCounter + 1
		end
		
		degreeCounter = degreeCounter + degreeIncrement
	end
end


function MakePebbleLine(tStartPoint, tEndPoint, iDistanceBetweenPebbles, iMaxVariance, tDistanceRanges, sPebbleType)
	local X1 = tStartPoint[1]
	local Z1 = tStartPoint[2]
	local Y1 = tStartPoint[3]
	local X2 = tEndPoint[1]
	local Z2 = tEndPoint[2]
	local Y2 = tEndPoint[3]
	
	if X1 > X2 then Xdist = X1 - X2 else Xdist = X2 - X1 end
	if Z1 > Z2 then Zdist = Z1 - Z2 else Zdist = Z2 - Z1 end
	if Y1 > Y2 then Ydist = Y1 - Y2 else Ydist = Y2 - Y1 end
	local totalDistance = sqrt((Xdist*Xdist) + (Ydist*Ydist) + (Zdist*Zdist))
	
	local XOffset = iDistanceBetweenPebbles * Xdist / totalDistance
	local ZOffset = iDistanceBetweenPebbles * Zdist / totalDistance
	local YOffset = iDistanceBetweenPebbles * Ydist / totalDistance
	
	if X2 < X1 then XOffset = -XOffset end
	if Z2 < Z1 then ZOffset = -ZOffset end
	if Y2 < Y1 then YOffset = -YOffset end
	
	local distanceSoFar = 0
	local X = X1
	local Z = Z1
	local Y = Y1
	local varianceToUse = 0
	local addPeb = 0
	
	if sPebbleType == nil then sPebbleType = "Pebble_0" end
	
	repeat
		varianceToUse = iMaxVariance
		
		--does it fall within range to show?
		addPeb = 1
		if tDistanceRanges ~= nil then
			addPeb = 0
			for id,range in tDistanceRanges do
				if (distanceSoFar >= range[1]) and (distanceSoFar <= range[2]) then
					addPeb = 1
					if range[3] ~= nil then varianceToUse = range[3] end
					break
				end
			end
		end
		
		if addPeb == 1 then
			variance1 = random(-varianceToUse, varianceToUse)
			variance2 = random(-varianceToUse, varianceToUse)
			variance3 = random(-varianceToUse, varianceToUse)
			addPebble(sPebbleType, { X + variance1, Z + variance2, Y + variance3 }, 0, 0, 0)
			gPebbleCounter = gPebbleCounter + 1
		end
		
		X = X + XOffset
		Z = Z + ZOffset
		Y = Y + YOffset
		
		distanceSoFar = distanceSoFar + iDistanceBetweenPebbles
		
	until distanceSoFar > totalDistance
end


function MakePebbleSphere(tCentreLocation, iRadius, iOuterThickness, iNumberOfPebbles, sPebbleType)
	local pebbleCounter = 0
	local angle = 0
	local distance = 0
	local distance2 = 0
	local X = 0
	local Y = 0
	local Z = 0
	
	if sPebbleType == nil then sPebbleType = "Pebble_0" end
	
	repeat
		angle = random(1,360)
		distance = random(0,iRadius)
		X = (cos(angle) * distance) + tCentreLocation[1]
		Y = (sin(angle) * distance) + tCentreLocation[3]
		Z = random(tCentreLocation[2]-iRadius, tCentreLocation[2]+iRadius)
		
		distance2 = GetDistanceBetweenTwoPoints(tCentreLocation, {X,Z,Y})
		if distance2 >= (iRadius-iOuterThickness) and distance2 <= iRadius then
			addPebble(sPebbleType, { X, Z, Y }, 0, 0, 0)
			pebbleCounter = pebbleCounter + 1
			gPebbleCounter = gPebbleCounter + 1
		end
	until pebbleCounter == iNumberOfPebbles
end




