-- LuaDC version 0.9.20
-- 2011/7/9 22:01:40
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
aitrace("CPU: LOADING MISSION 4")
dofilepath("data:ai/default.lua")
function Override_Init()
    cp_overrideChooseEnemy = 0
    sg_dobuild = 1
    sg_doresearch = 0
    sg_domilitary = 1
    cp_processResource = 1
    cp_processMilitary = 1
end

function Override_BuildDemandInit()
    sg_classPersonalityDemand[eFighter] = 0
    sg_classPersonalityDemand[eCorvette] = 1
    sg_classPersonalityDemand[eFrigate] = 3
end

function Override_ResourceInit()
end

function Override_MilitaryInit()
    cp_attackPercent = 100
    cp_minSquadGroupSize = 3
    cp_minSquadGroupValue = 250
end

function Override_SubSystemDemand()
end

function AI_Carrier_Grp_1_Attack()
    cp_minSquadGroupSize = 2
    cp_minSquadGroupValue = 50
    AttackNow()
    print("AI Attacks")
end
