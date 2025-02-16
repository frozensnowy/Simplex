-- LuaDC version 0.9.19
-- 5/23/2004 7:23:37 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = FlyRound
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    axisRotation = 15, 
    maxAxisRotation = 90, 		--60
    circleSegmentAngle = 25, 
    angleVariation = 0.2, 
    circleHeight = -10, 
    distanceFromTarget = 2500, 
    distanceVariation = 0.5, 
    percentChanceOfCutting = 25, 
    minSegmentsToCut = 1, 
    maxSegmentsToCut = 3, 
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
