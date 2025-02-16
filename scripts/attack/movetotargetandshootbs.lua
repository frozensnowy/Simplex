AttackStyleName = MoveToTargetAndShoot
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeMultiplier = 0.65, 
    --optimumRangeMultiplier = 9,
    --rangeMultiplierForHeight = 0.3,
    happilySameHeight = 50, 
    m_tooLongOutOfRange = 3, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    maxTimeToSpendTryingToMatchHeight = 4, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 1.5, 
    flyToSameHeightAsTargetDelay = 2, 
    flyToAboveTheTargetDelay = 2.25, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 1, }, 
        { 
            Type = InterpolateTarget, 
            Weighting = 4, }, 
        { 
            Type = NoAction, 
            Weighting = 55, }, 
        }, 
    BeingAttackedActions = {}, 
    FiringActions = {}, }
