-- LuaDC version 0.9.19
-- 5/23/2004 7:23:39 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = AttackRun
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    maxBreakDistance = 1300, 
    distanceFromTargetToBreak = 800, 
    safeDistanceFromTargetToDoActions = 1500, 
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
            Type = FlightManeuver, 
            Weighting = 90, 
            FlightManeuverName = "RollCW", }, 
        }, 
    BeingAttackedActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 6, }, 
        }, 
 
    FiringActions = 
        { 
        { 
            Type = FlightManeuver, 
            Weighting = 60, 
            FlightManeuverName = "BarrelRollCW", },
        }
 }
