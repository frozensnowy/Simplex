-- The Simplex Project
-- 2011/7/9 22:01:49
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
aitrace("CPU: LOADING MISSION 4")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(2)
function Override_Init()
    sg_doresearch = 1	--0
    --newly added
    sg_dobuild = 1
    sg_domilitary = 1
    cp_processResource = 1
    cp_processMilitary = 1
end

function Override_BuildDemandInit()
    sg_classPersonalityDemand[eFighter] = 2	--1
    sg_classPersonalityDemand[eCorvette] = 2	--0
    sg_classPersonalityDemand[eFrigate] = 3
end

function Override_ResourceInit()
end

function Override_MilitaryInit()
    cp_attackPercent = 0
    cp_minSquadGroupSize = 8
    cp_minSquadGroupValue = 250
end

function Override_ShipDemand()
end

function Override_SubSystemDemand()
end
