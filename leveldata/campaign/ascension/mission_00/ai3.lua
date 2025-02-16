dofilepath("data:leveldata\\campaign\\ascension.data")
dofilepath("player:MissionGrid_record.lua")
tempMission = currentMission
if (tempMission < 10) then
	tempMission = "0" .. tempMission
end
dofilepath("data:leveldata\\campaign\\ascension\\mission_" .. tempMission .. "\\ai3_src.lua")
