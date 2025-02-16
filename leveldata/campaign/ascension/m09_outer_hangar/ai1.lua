-- LuaDC version 0.9.20
-- 2011/7/9 22:01:49
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
aitrace("CPU: LOADING MISSION 9 AI Player 1")
dofilepath("data:ai/default.lua")
cp_overrideChooseEnemy = 0
function Override_Init()
    sg_doresearch = 0
end

function Override_BuildDemandInit()
    sg_classPersonalityDemand[eFighter] = 1
    sg_classPersonalityDemand[eCorvette] = 0
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
