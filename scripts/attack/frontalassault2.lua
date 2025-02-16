AttackStyleName = FaceTarget
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 0.85, 
    slideDistanceMultiplier = 1.5, 
    tooSlowSpeed = 3, 
    tooFastMultiplier = 1.4, 
    facingAngle = 0, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 0, 
    flyToTargetBecauseItsMovingAwayDelay = 1, 
    stopAndFaceTheTargetDelay = 1, 
    flyToAboveTheTargetDelay = 1, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 19, }, 
        { 
            Type = NoAction, 
            Weighting = 200, }, 
        { 
            Type = MoveRoundTarget, 
            minParam = 2.5 * 2 * 3.141592653589 / 360, 
            maxParam = 4 * 2 * 3.141592653589 / 360, 
            Weighting = 1, }, 
        }, 
    BeingAttackedActions = {}, 
    FiringActions = 
        { 
        { 
            Type = InterpolateTarget, 
            Weighting = 1, 
            minParam = 3, 
            maxParam = 3, }, 
        { 
            Type = NoAction, 
            Weighting = 2, }, 
        }, }

