AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 5000,
  distanceFromTargetToBreak = 3000,
  safeDistanceFromTargetToDoActions = 5025,
  coordSysToUse = Attacker,
  horizontalMin = 0.0,
  horizontalMax = 0.4,
  horizontalFlip = 1,
  verticalMin = 0.0,
  verticalMax = 0.4,
  verticalFlip = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 10,
    },
    {
      Type = InterpolateTarget,
      Weighting = 50,
    },
    {
      Type = NoAction,
      Weighting = 50,
    },
  },
  FiringActions = {
    {
      Type = InterpolateTarget,
      Weighting = 50,
    },
  },
}
