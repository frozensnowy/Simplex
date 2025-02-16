AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 3000,
  distanceFromTargetToBreak = 800,
  safeDistanceFromTargetToDoActions = 3200,
  coordSysToUse = Target,
  horizontalMin = 0.6,
  horizontalMax = 0.9,
  horizontalFlip = 1,
  verticalMin = 0.5,
  verticalMax = 0.8,
  verticalFlip = 0,
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
  BeingAttackedActions = {
    {
      Type = NoAction,
      Weighting = 400,
    },
    {
      Type = FlightManeuver,
      Weighting = 75,
      FlightManeuverName = "JinkLeft",
    },
    {
      Type = FlightManeuver,
      Weighting = 75,
      FlightManeuverName = "JinkRight",
    },
    {
      Type = FlightManeuver,
      Weighting = 25,
      FlightManeuverName = "JinkLeftAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 25,
      FlightManeuverName = "JinkRightAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "ImmelMann",
    },
  },
  FiringActions = {},
}