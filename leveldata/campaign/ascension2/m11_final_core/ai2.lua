-- LuaDC version 0.9.20
-- 2011/7/9 22:01:51
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
aitrace("CPU: LOADING MISSION 11 AI Player 3")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(2)   --setLevelOfDifficulty(2)
cp_overrideChooseEnemy = 0
rawset(globals(), "Logic_military_attackrules", NIL)
function Override_Init()
    sg_doresearch = 0
    sg_doupgrades = 0
end

function Override_ResourceInit()
    sg_maxNumCollectors = 2
end

function Override_MilitaryInit()
    cp_attackPercent = 100
    cp_minSquadGroupSize = 4
    cp_minSquadGroupValue = 100
    cp_maxGroupSize = 8
    cp_forceAttackGroupSize = 8
    cp_initThreatModifier = 0.3
end

function Logic_military_attackrules()
end

function Override_ShipDemand()
    CpuBuild_DefaultShipDemandRules()
    ShipDemandAddByClass(eBuilder, -100)
    ShipDemandAddByClass(ePlatform, -100)
    ShipDemandAddByClass(eScout, -100)
end
