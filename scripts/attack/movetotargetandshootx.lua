AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.8,
  happilySameHeight = 2000,
  m_tooLongOutOfRange = 5,
  moveAttackMaxDistanceMultiplier = 1.2,
  maxTimeToSpendTryingToMatchHeight = 4,
  flyToTargetBecauseItsFarOutOfRangeDelay = .5,
  flyToSameHeightAsTargetDelay = 5,
  flyToAboveTheTargetDelay = 4,
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
