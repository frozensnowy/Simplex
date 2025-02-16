-- The Simplex Project
-- 2011/7/9 22:01:56
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
aitrace("CPU: LOADING MISSION 12 PLAYER 1")
dofilepath("data:ai/default.lua")
setLevelOfDifficulty(2)   --setLevelOfDifficulty(2)
--rawset(globals(), "Logic_military_groupvars", NIL)
rawset(globals(), "Logic_military_setattacktimer", NIL)
function Override_Init()
    sg_dobuild = 1
    sg_doresearch = 1
    sg_domilitary = 1
    cp_processResource = 1
    cp_processMilitary = 1
end

function Override_ResourceInit()
    cpMaxThreatAddedDistance = 6000
    cpMinThreatAddedDistance = 12000
    SetResourceDockFamily("Utility")
    sg_minNumCollectors = 12
    sg_maxNumCollectors = 50
    sg_refineryMilitaryLimit = 100
    sg_collectorMinForRefinery = 100
end

function Override_MilitaryInit()
    cp_attackPercent = 100
    cp_minSquadGroupSize = 2
    cp_minSquadGroupValue = 100
    cp_forceAttackGroupSize = 2
    cp_initThreatModifier = 0.9
    sg_militaryRand = Rand(100)
end

--function Logic_military_groupvars()
    --cp_minSquadGroupSize = 1
    --cp_minSquadGroupValue = 1
--end

function Logic_military_setattacktimer()
    local timedelay = 10
    local wavedelay = 10
    local gametime = gameTime()
    if  gametime>=timedelay or HaveBeenAttacked()==1 then
        if  Rule_Exists("attack_now_timer")==0 then
            aitrace("Script: Attacktimer added by ME")
            Rule_AddInterval("attack_now_timer", wavedelay)
        end 

    end 

end

function Override_ShipDemand()
    DetermineCounterDemand()
    ShipDemandAddByClass(eFighter, 2)
    ShipDemandAddByClass(eCorvette, 2)
    ShipDemandAddByClass(eFrigate, 3)
    ShipDemandAddByClass(eCapital, 5)
    ShipDemandAddByClass(eBuilder, -20)
end
