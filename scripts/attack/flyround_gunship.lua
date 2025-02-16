-- LuaDC version 0.9.19
-- 5/23/2004 7:23:37 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = FlyRound
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    axisRotation = 5, 
    maxAxisRotation = 90, 	--20
    circleSegmentAngle = 30, 
    angleVariation = 0.2, 
    circleHeight = -20, 
    distanceFromTarget = 3500, 
    distanceVariation = 0.3, 	--0.1
    percentChanceOfCutting = 5, 
    minSegmentsToCut = 1, 
    maxSegmentsToCut = 1, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 1, }, 
        { 
            Type = NoAction, 
            Weighting = 9, }, 
        }, 
    BeingAttackedActions = {}, 
    FiringActions = {}, }
