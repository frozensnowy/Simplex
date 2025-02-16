-- The Simplex Project
-- 2011/7/9 22:02:13
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = MoveToTargetAndShoot
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeMultiplier = 0.8, 
    happilySameHeight = 50, 
    m_tooLongOutOfRange = 2, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    maxTimeToSpendTryingToMatchHeight = 4, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 0.5, 
    flyToSameHeightAsTargetDelay = 2, 
    flyToAboveTheTargetDelay = 1, 
    tryToGetAboveTarget = 1, 
    angleFromUp = 45, 
    maxTimeToSpendFlyingToAbove = 4, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 1, }, 
        { 
            Type = InterpolateTarget, 
            Weighting = 1, }, 
        { 
            Type = NoAction, 
            Weighting = 58, }, 
        }, 
    BeingAttackedActions = {}, 
    FiringActions = {}, }
