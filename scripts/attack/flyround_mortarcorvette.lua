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
    maxAxisRotation = 90, 
    circleSegmentAngle = 30, 
    angleVariation = 0.2, 
    circleHeight = -300, 
    distanceFromTarget = 4700, 
    distanceVariation = 0.3, 
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
