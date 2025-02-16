-- The Simplex Project
-- 2011/7/9 22:02:12
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = AttackRun
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    maxBreakDistance = 4600, 	--1600
    distanceFromTargetToBreak = 1850, 	--850
    safeDistanceFromTargetToDoActions = 1200, 
    useTargetUp = 0, 
    coordSysToUse = TargetPoint, 
    horizontalMin = 0.2, 
    horizontalMax = 0.6, 
    horizontalFlip = 1, 
    verticalMin = 0.4, 
    verticalMax = 0.7, 
    verticalFlip = 0, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 1, }, 
        { 
            Type = NoAction, 
            Weighting = 2, }, 
        }, 
    BeingAttackedActions = {}, 
    FiringActions = 
        { 
        { 
            Type = NoAction, 
            Weighting = 25, }, 
        { 
            Type = FlightManeuver, 
            Weighting = 3, 
            FlightManeuverName = "RollCW", }, 
        { 
            Type = FlightManeuver, 
            Weighting = 3, 
            FlightManeuverName = "RollCCW", }, 
        }, }
