AttackStyleName = FlyRound
Data = {
  howToBreakFormation = StraightAndScatter,
  axisRotation = 15,
  maxAxisRotation = 85,
  circleSegmentAngle = 45,
  angleVariation = 0.2,
  distanceFromTarget = 6000,
  distanceVariation = 0.1,
  percentChanceOfCutting = 5,
  minSegmentsToCut = 1,
  maxSegmentsToCut = 3,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = NoAction,
      Weighting = 9,
    },
  },
  BeingAttackedActions = {},
  FiringActions = {},
}
