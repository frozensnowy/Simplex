-- The Simplex Project
-- 2011/7/9 22:02:13
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = AttackRun
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    maxBreakDistance = 4300, 	--1300
    distanceFromTargetToBreak = 1500, 	--500
    safeDistanceFromTargetToDoActions = 1100, 
    coordSysToUse = Target, 
    horizontalMin = 0.6, 
    horizontalMax = 0.9, 
    horizontalFlip = 1, 
    verticalMin = 0.5, 
    verticalMax = 0.8, 
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
