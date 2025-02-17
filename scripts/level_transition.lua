-- Level Transition Script (Compatibility Wrapper)
-- This file exists for backward compatibility

dofilepath("data:scripts/level_loader.lua")

function LevelTransition_Initialize()
    -- Already handled by LevelLoader_Initialize
    print("Level transition system initialized via loader")
end

function LevelTransition_AddZone(zoneId, targetLevel, position, radius, conditions)
    return LevelLoader_AddTransition(zoneId, targetLevel, position, radius, conditions)
end

function LevelTransition_CreateBasicTransition(zoneId, targetLevel, position)
    return LevelLoader_AddTransition(zoneId, targetLevel, position)
end