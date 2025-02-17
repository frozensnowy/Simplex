dofilepath("data:leveldata\\campaign\\ascension.data")
dofilepath("player:Campaign\\ASCENSION\\MissionGrid_record.lua")
dofilepath("data:scripts\\level_loader.lua")

-- Get mission path formatting
local levelname = currentLevel
if (levelname == nil or levelname == "") then
    levelname = currentMission
    if (tonumber(levelname) < 10) then
        levelname = "0" .. levelname
    end
end

-- Build mission path
levelname = "m" .. levelname
local missionPath = "data:leveldata\\campaign\\ascension\\" .. levelname .. "\\" .. levelname .. "_src.lua"

-- Load the mission script
dofilepath(missionPath)