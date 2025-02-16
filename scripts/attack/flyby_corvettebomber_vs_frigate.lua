-- LuaDC version 0.9.19
-- 5/23/2004 7:23:35 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = AttackRun
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    maxBreakDistance = 4400, 	--2400
    distanceFromTargetToBreak = 1050, 	--1850
    safeDistanceFromTargetToDoActions = 400, 
    useTargetUp = 0, 
	coordSysToUse = TargetPoint,
	horizontalMin = 0.9,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.4,
	verticalMax = 0.6,
	verticalFlip = 1,
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
            Weighting = 13, }, 
        { 
            Type = FlightManeuver, 
            Weighting = 1, 
            FlightManeuverName = "RollCW", }, 
        { 
            Type = FlightManeuver, 
            Weighting = 1, 
            FlightManeuverName = "RollCCW", }, 
        }, }
