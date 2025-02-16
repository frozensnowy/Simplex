AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 0.5,
  happilySameHeight = 2000,
  TooLongOutOfRange = 7,
  moveAttackMaxDistanceMultiplier = 1.2,
  facingAngle = 0, 
  maxTimeToSpendTryingToMatchHeight = 4,
  flyToTargetBecauseItsFarOutOfRangeDelay = 0.5,
  flyToSameHeightAsTargetDelay = 1,
  flyToAboveTheTargetDelay = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
  },
  BeingAttackedActions = {    {
      Type = PickNewTarget,
      Weighting = 1,
    },},
  FiringActions = {    
{
      Type = PickNewTarget,
      Weighting = 1,
    },
  },
}
