AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.96,
  --optimumRangeMultiplier = 9,
  --rangeMultiplierForHeight = 0.3,
  happilySameHeight = 125,
  m_tooLongOutOfRange = 4,
  moveAttackMaxDistanceMultiplier = 1.15,
  maxTimeToSpendTryingToMatchHeight = 2,
  flyToTargetBecauseItsFarOutOfRangeDelay = 6,
  flyToSameHeightAsTargetDelay = 2,
  flyToAboveTheTargetDelay = 6,
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
