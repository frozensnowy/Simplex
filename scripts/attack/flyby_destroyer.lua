AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 9000,
  distanceFromTargetToBreak = 5000,
  safeDistanceFromTargetToDoActions = 6000,
  useTargetUp = 0,
  coordSysToUse = Target,
  horizontalMin = 0,
  horizontalMax = 1,
  horizontalFlip = 1,
  verticalMin = 0,
  verticalMax = 1,
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
  BeingAttackedActions = {
    {
      Type = NoAction,
      Weighting = 500,
    },
    {
      Type = FlightManeuver,
      Weighting = 25, --75,
      FlightManeuverName = "JinkLeft",
    },
    {
      Type = FlightManeuver,
      Weighting = 25, --75,
      FlightManeuverName = "JinkRight",
    },
    {
      Type = FlightManeuver,
      Weighting = 25, --25,
      FlightManeuverName = "JinkLeftAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 25, --25,
      FlightManeuverName = "JinkRightAndBack",
    },
  },
}
