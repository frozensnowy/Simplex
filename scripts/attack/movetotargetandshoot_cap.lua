AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.8,
  happilySameHeight = 50,
  m_tooLongOutOfRange = 2.5,
  moveAttackMaxDistanceMultiplier = 1.2,
  tryToMatchHeight = 0, 
  tryToGetAboveTarget = 0,
  maxTimeToSpendTryingToMatchHeight = 4,
  flyToTargetBecauseItsFarOutOfRangeDelay = 0,
  flyToSameHeightAsTargetDelay = 0.25,
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
