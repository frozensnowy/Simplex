AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 4000,
  distanceFromTargetToBreak = 3000,
  safeDistanceFromTargetToDoActions = 3000,
  coordSysToUse = Attacker,
  horizontalMin = -1,
  horizontalMax = 1,
  horizontalFlip = 0,
  verticalMin = -1,
  verticalMax = 0.2,
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
      Type = PickNewTarget,
      Weighting = 7,
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "RollCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "RollCCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 4,
      FlightManeuverName = "ImmelMann",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "Split_S",
    },
  },
  FiringActions = {},
}
