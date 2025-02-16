function DegToRad(angle)
  return angle * 2 * 3.141592653589 / 360
end
AttackStyleName = FaceTarget
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 0.81, 
    --optimumRangeMultiplier = 9,
    --rangeMultiplierForHeight = 0.3,
    slideDistanceMultiplier = 1.6, 
    tooSlowSpeed = 3, 
    tooFastMultiplier = 1.4, 
    facingAngle = 0, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 1, 
    flyToTargetBecauseItsMovingAwayDelay = 2.5, 
    stopAndFaceTheTargetDelay = 1.5, 
    flyToAboveTheTargetDelay = 2, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 50, }, 
        { 
            Type = NoAction, 
            Weighting = 200, }, 
        { 
            Type = MoveRoundTarget, 
            minParam = DegToRad(7), 
            maxParam = DegToRad(25), 
            Weighting = 25, }, 
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