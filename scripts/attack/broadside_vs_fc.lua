function DegToRad(angle)	
	return
	angle * ((2 * 3.141592653589) / 360)
end

AttackStyleName = FaceTarget
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 0.97, 
    --optimumRangeMultiplier = 9,
    --rangeMultiplierForHeight = 0.3,
    slideDistanceMultiplier = 1.75, 
    tooSlowSpeed = 3, 
    tooFastMultiplier = 1.4, 
    facingAngle = 90, 
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 5, 
    flyToTargetBecauseItsMovingAwayDelay = 5, 
    stopAndFaceTheTargetDelay = 0, 
    flyToAboveTheTargetDelay = 5, 
    RandomActions = 
        { 
        { 
            Type = InterpolateTarget, 
            Weighting = 10, }, 
        { 
            Type = PickNewTarget, 
            Weighting = 10, }, 
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
    FiringActions = {}, }