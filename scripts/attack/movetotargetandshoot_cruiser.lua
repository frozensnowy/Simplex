AttackStyleName = MoveToTargetAndShoot
Data = {
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 1, 
    slideDistanceMultiplier = 1.5, 
    tooSlowSpeed = 2, 
    tooFastMultiplier = 1.4,  
    moveAttackMaxDistanceMultiplier = 1.2, 
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 0, 
    flyToTargetBecauseItsMovingAwayDelay = 1, 
    flyToAboveTheTargetDelay = 1, 
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = InterpolateTarget,
      Weighting = 4,
    },
    {
      Type = NoAction,
      Weighting = 55,
    },
  },
  BeingAttackedActions = {},
  FiringActions = {},
}
