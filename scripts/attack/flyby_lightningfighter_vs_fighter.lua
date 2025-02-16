AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 3000,
  distanceFromTargetToBreak = 1600,
  safeDistanceFromTargetToDoActions = 1800,
  coordSysToUse = Attacker,
  horizontalMin = 0.6,
  horizontalMax = 0.9,
  horizontalFlip = 1,
  verticalMin = 0.2,
  verticalMax = 0.2,
  verticalFlip = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = NoAction,
      Weighting = 30,
    },
  },
  BeingAttackedActions = {
    {
      Type = PickNewTarget,
      Weighting = 9,
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
      Weighting = 1,
      FlightManeuverName = "BarrelRoll",
    },
  },
  FiringActions = {
    {
      Type = NoAction,
      Weighting = 10,
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "JinkLeft",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "JinkRight",
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
  },
}
