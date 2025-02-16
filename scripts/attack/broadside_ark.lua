AttackStyleName = FaceTarget
Data = { 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 0.96, 
    --optimumRangeMultiplier = 9,
    --rangeMultiplierForHeight = 0.3,
    slideDistanceMultiplier = 1.6, 
    tooSlowSpeed = 3, 
    tooFastMultiplier = 1.4, 
    facingAngle = 90, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 1, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 4, 
    flyToTargetBecauseItsMovingAwayDelay = 6, 
    stopAndFaceTheTargetDelay = 2, 
    flyToAboveTheTargetDelay = 6, 
    RandomActions = {}, 
    BeingAttackedActions = {}, 
    FiringActions = { 
        { 
          Type = InterpolateTarget, 
          Weighting = 5,             
        }, 
        { 
            Type = PickNewTarget, 
            Weighting = 5,
        }, 
        { 
          Type = NoAction, 
          Weighting = 200, 
        }, 
    }, 
}
