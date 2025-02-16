function DegToRad(angle)
  return angle * 2 * 3.141592653589 / 360
end

AttackStyleName = FaceTarget
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 0.9, 
    optimumRangeMultiplier = 9,
    rangeMultiplierForHeight = 0.3,
    slideDistanceMultiplier = 1.75, 
    tooSlowSpeed = 3, 
    tooFastMultiplier = 1.4, 
    facingAngle = 0, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 2, 
    flyToTargetBecauseItsMovingAwayDelay = 3.5, 
    stopAndFaceTheTargetDelay = 2, 
    flyToAboveTheTargetDelay = 3, 
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
            minParam = DegToRad(2.5), 
            maxParam = DegToRad(4), 
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
            Weighting = 4, }, 
        }, }

