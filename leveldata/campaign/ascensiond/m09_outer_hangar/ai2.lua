-- The Simplex Project
-- 2011/7/9 22:01:49
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
aitrace("CPU: LOADING MISSION 9 AI Player 2")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(2)   --setLevelOfDifficulty(2)
cp_overrideChooseEnemy = 0
rawset(globals(), "Logic_military_attackrules", NIL)
function Override_Init()
    sg_doresearch = 0
    sg_doupgrades = 0
end

function Override_ResourceInit()
    sg_maxNumCollectors = 12
end

function Override_MilitaryInit()
    cp_attackPercent = 100
    cp_minSquadGroupSize = 4
    cp_minSquadGroupValue = 100
    cp_maxGroupSize = 8
    cp_forceAttackGroupSize = 8
    cp_initThreatModifier = 0.2
end

function Logic_military_attackrules()
end

function Override_ShipDemand()
    CpuBuild_DefaultShipDemandRules()
    ShipDemandAddByClass(eBuilder, -100)
    ShipDemandAddByClass(ePlatform, -100)
    ShipDemandAddByClass(eScout, -100)
end
