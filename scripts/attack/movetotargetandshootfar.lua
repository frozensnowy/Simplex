AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.8,
  happilySameHeight = 12000,
  TooLongOutOfRange = 17,
  moveAttackMaxDistanceMultiplier = 1.2,
  facingAngle = 0, 
  maxTimeToSpendTryingToMatchHeight = 4,
  flyToTargetBecauseItsFarOutOfRangeDelay = 2,
  flyToSameHeightAsTargetDelay = 1,
  flyToAboveTheTargetDelay = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = InterpolateTarget,
      Weighting = 50,
    },
    {
      Type = NoAction,
      Weighting = 200,
    },
  },
  BeingAttackedActions = {},
  FiringActions = {
  },
}
