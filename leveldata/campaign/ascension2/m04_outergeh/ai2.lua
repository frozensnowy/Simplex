-- LuaDC version 0.9.20
-- 2011/7/9 22:01:42
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
aitrace("CPU: LOADING MISSION 4 PLAYER 2")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(2)   --setLevelOfDifficulty(0)
function Override_Init()
    sg_dobuild = 1
    sg_doresearch = 1
    sg_domilitary = 1
    cp_processResource = 1
    cp_processMilitary = 1
end

function Override_MilitaryInit()
    cp_attackPercent = 0
    cp_minSquadGroupSize = 6
    cp_minSquadGroupValue = 250
    cp_forceAttackGroupSize = 6
    cp_initThreatModifier = 0.7
    sg_militaryRand = Rand(100)
end

function Override_ShipDemand()
    CpuBuild_DefaultShipDemandRules()
    ShipDemandAddByClass(eCorvette, 3)
    ShipDemandAddByClass(eFrigate, 3)
    ShipDemandAddByClass(eCapital, -20)
    ShipDemandAddByClass(eBuilder, -20)
    ShipDemandAddByClass(ePlatform, -20)
    ShipDemandAdd(VGR_COMMANDCORVETTE, -10)
    ShipDemandAdd(VGR_INFILTRATORFRIGATE, -50)
end
