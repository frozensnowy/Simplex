dofilepath("data:scripts\\race.lua")
dofilepath("player:MissionGrid_record.lua")

-- Arrays to store exit point data
missionExits_target = {}
missionExits_label = {}
missionExits_volumes = {}
missionExitCount = 0
sphereCount = 1

-- Flag to control whether static exits should be used
useStaticExits = true  -- Default to true for backwards compatibility

-- Track exit sources
missionExits_sources = {}  -- Will store "mission" or "static" for each exit

--------------------------------------------------------------------------------
-- Allow missions to control whether static exits should be used
function DisableStaticExits()
	print("DEBUG: Static exits disabled by mission")
	useStaticExits = false
end

--------------------------------------------------------------------------------
-- Register a new exit point for the current mission
-- Parameters:
--   position: Vector {x, y, z} for the exit point location
--   radius: Sphere radius for detection
--   targetMission: The mission to transition to (can be number or string)
--   label: Text to display on the ping
--   source: The source of the exit (can be "mission" or "static")
function RegisterMissionExit(position, radius, targetMission, label, source)
	print("DEBUG: Starting RegisterMissionExit")
	print("DEBUG: Position = " .. position[1] .. "," .. position[2] .. "," .. position[3])
	print("DEBUG: Radius = " .. radius)
	print("DEBUG: Target = " .. targetMission)
	
	missionExitCount = missionExitCount + 1
	print("DEBUG: Exit count = " .. missionExitCount)
	
	-- Create a volume name for this exit
	local volumeName = "ExitPoint_" .. missionExitCount
	print("DEBUG: Volume name = " .. volumeName)
	
	-- Create the volume in the game world with proper position table
	local pos = {
		position[1],    -- x
		position[3],    -- z (HW2 uses x,z,y order)
		position[2],    -- y
	}
	print("DEBUG: Creating volume at " .. pos[1] .. "," .. pos[2] .. "," .. pos[3])
	Volume_AddSphere(volumeName, pos, radius)
	
	-- Store the mission target and label
	missionExits_target[missionExitCount] = targetMission
	missionExits_label[missionExitCount] = label
	missionExits_volumes[missionExitCount] = volumeName
	missionExits_sources[missionExitCount] = source or "mission"
	
	print("DEBUG: Exit point registered successfully from source: " .. (source or "mission"))
end

--------------------------------------------------------------------------------
-- Register static exits from ascension.data
function RegisterStaticExits()
	print("DEBUG: Checking if static exits should be used")
	if useStaticExits then
		print("DEBUG: Using static exits from ascension.data")
		if exitSpheres and exitSpheres[currentMission] then
			for i = 1, 4 do  -- Maximum of 4 exits per mission
				local exitData = exitSpheres[currentMission][i]
				if exitData then
					print("DEBUG: Found static exit " .. i)
					RegisterMissionExit(
						exitData[2],  -- position
						exitData[3],  -- radius
						exitData[1],  -- target mission
						exitData[4],  -- label
						"static"      -- source
					)
				end
			end
		end
	else
		print("DEBUG: Static exits are disabled for this mission")
	end
end

--------------------------------------------------------------------------------
-- create and display pings for map exits
--
function Rule_EnableExits()
    print("DEBUG: Starting Rule_EnableExits")
    local playerIndex = 0

    -- Register static exits if enabled
    RegisterStaticExits()

    print("DEBUG: Exit count = " .. missionExitCount)
    -- create pings for all exits
    if missionExitCount > 0 then
        for i = 1, missionExitCount do
            print("DEBUG: Creating ping for exit " .. i .. " (source: " .. missionExits_sources[i] .. ")")
            local volumeName = missionExits_volumes[i]
            print("DEBUG: Volume name = " .. volumeName)
            
            -- Create ping at the volume location
            local pingid = Ping_AddPoint(missionExits_label[i], "anomaly", volumeName)
            Ping_LabelVisible(pingid, 1)
            print("DEBUG: Created ping for " .. volumeName)
        end
    end
    
    -- done here
    Rule_Remove("Rule_EnableExits")

    -- create sobgroups to be filled later by Rule_CheckMapExitsForMotherships
    SobGroup_Create("ShipsInVolume")
    SobGroup_Create("MSInVolume")

    -- now check if the mothership is inside one of the pings, and end the mission if it is
    Rule_AddInterval("Rule_CheckMapExitsForMotherships", 2)
end


--------------------------------------------------------------------------------
-- check if mothership is in volume, then handle mission transition
--
function Rule_CheckMapExitsForMotherships()
	print("DEBUG: Starting Rule_CheckMapExitsForMotherships")
	local playerIndex = 0
	
	-- Check all exits (both dynamic and static are now in the same arrays)
	if missionExitCount > 0 then
		print("DEBUG: Checking " .. missionExitCount .. " exits")
		for i = 1, missionExitCount do
			print("DEBUG: Checking exit " .. i)
			local volumeName = missionExits_volumes[i]
			print("DEBUG: Volume name = " .. volumeName)
			
			-- Check if ship is in the volume
			Player_FillSobGroupInVolume("ShipsInVolume", playerIndex, volumeName)
			
			for j = 1, getn(motherships) do
				print("DEBUG: Checking mothership type: " .. motherships[j])
				SobGroup_FillShipsByType("MSInVolume", "ShipsInVolume", motherships[j])
			end
			
			if (SobGroup_Empty("MSInVolume") == 0) then
				print("DEBUG: Found mothership in volume")
				Rule_Remove("Rule_CheckMapExitsForMotherships")
				campaignStarted = 1
				sectorsCleared[currentMission] = 1
				
				-- Handle string or number mission targets
				local target = missionExits_target[i]
				print("DEBUG: Target mission = " .. target)
				
				if type(target) == "number" then
					nextMission = target
				else
					print("DEBUG: Extracting mission number from: " .. target)
					local _, _, num = strfind(target, "mission_(%d+)")
					if num then
						nextMission = tonumber(num)
						print("DEBUG: Extracted mission number: " .. num)
					else
						nextMission = currentMission + 1
						print("DEBUG: Using fallback mission: " .. nextMission)
					end
				end
				
				Player_InstantlyGatherAllResources(playerIndex)
				SaveCampaignStatus()
				setMissionComplete(1)
				return
			end
		end
	end
	
	SobGroup_Clear("ShipsInVolume")
	SobGroup_Clear("MSInVolume")
	print("DEBUG: Rule_CheckMapExitsForMotherships complete")
end


-------------------------------------------------------------------------------
-- returns the HW2 pathname
-- can't remember the author of this script
function GetHW2Path_old()
	execute("dir > dir.txt")
	readfrom("dir.txt")
	local filestring = read("*a")
	local start_of_string
	local count = 65
	while not start_of_string and count < (65 + 26) do
		start_of_string = strfind(filestring, strchar(count) .. ":\\")
		count = count + 1
	end
	if start_of_string then
		return strsub(filestring, start_of_string, strfind(filestring, "\\Bin\\Release"))
	end
end

-- so much simpler!
function GetHW2Path()
	return "../../"
end


-------------------------------------------------------------------------------
-- get the name of the player's current profile
--
function GetProfilePath()
	local ProfileIni = HW2Path .. "Bin\\local.ini"
	readfrom(ProfileIni)
	local dum, ProfileStr = read("*l", "*l")
	local idx1, idx2 = strfind(ProfileStr, "currentprofile=", 1, 1)
	return strsub(ProfileStr, idx2 + 1, -1)
end


-------------------------------------------------------------------------------
-- load persistant data, ships are loaded in levels
--
function LoadPersistentData_Mission()
	if (campaignStarted == 0) then
		SobGroup_ExitHyperSpace("MS_StartGroup", "MS_StartVolume")
	else
		local filein = HW2Path .. "Bin\\Profiles\\" .. ProfilePath .. "\\Campaign\\ASCENSION\\persist2.lua"
		local fileout = HW2Path .. "Bin\\Profiles\\" .. ProfilePath .. "\\Campaign\\ASCENSION\\persist1.lua"
		rename(filein, fileout)
		SobGroup_LoadPersistantData("Hgn_Mothership")
		SobGroup_Create("MS_StartGroup")
		Player_FillShipsByType("MS_StartGroup", 0, "Hgn_Mothership")
	end
end


-------------------------------------------------------------------------------
-- save persistant data
--
function SaveCampaignStatus()
	local playerIndex = 0
	local iRace = Player_GetRace(playerIndex) + 1
	local WriteString = ""

	WriteString = WriteString
	.. "campaignStarted = " .. campaignStarted .. "\n"
	.. "currentMission = " .. nextMission .."\n"
	.. "sectorsCleared = {"
	for i = 1, getn(sectorsCleared) do
		WriteString = WriteString .. sectorsCleared[i] .. ","
	end
	WriteString = WriteString .. "}\n\n"

	-- actually write everything
	local WriteFile = HW2Path .. "Bin\\Profiles\\" .. ProfilePath .. "\\Campaign\\ASCENSION\\MissionGrid_record.lua"
	writeto(WriteFile)
	write(WriteString)
end

-- call these ONCE
HW2Path = GetHW2Path()
ProfilePath = GetProfilePath()
