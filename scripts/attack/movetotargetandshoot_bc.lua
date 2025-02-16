AttackStyleName = MoveToTargetAndShoot
Data = {
  howToBreakFormation = BreakImmediately,
  inRangeMultiplier = 0.8,
  faceTargetHorizontal = 0,
  faceTargetVertical = 1,
  flyToTargetBecauseItsFarOutOfRangeDelay = 0.5,
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
