AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 3500,
  distanceFromTargetToBreak = 900,
  safeDistanceFromTargetToDoActions = 3500,
  useTargetUp = 0,
  coordSysToUse = Attacker,
  horizontalMin = -1,
  horizontalMax = 1,
  horizontalFlip = 1,
  verticalMin = -1,
  verticalMax = 1,
  verticalFlip = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = NoAction,
      Weighting = 2,
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