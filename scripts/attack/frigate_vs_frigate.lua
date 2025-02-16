AttackStyleName = AttackRun
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 1800,
  distanceFromTargetToBreak = 3000,
  safeDistanceFromTargetToDoActions = 3000,
  coordSysToUse = Attacker,
  horizontalMin = -0.9,
  horizontalMax = 0.9,
  horizontalFlip = 1,
  verticalMin = -0.6,
  verticalMax = -0.2,
  verticalFlip = 1,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 3,
    },
    {
      Type = NoAction,
      Weighting = 30,
    },
  },
  BeingAttackedActions = {
    {
      Type = NoAction,
      Weighting = 150,
    },
    {
      Type = PickNewTarget,
      Weighting = 35,
    },
    {
      Type = FlightManeuver,
      Weighting = 17,
      FlightManeuverName = "ImmelMann",
    },
    {
      Type = FlightManeuver,
      Weighting = 17,
      FlightManeuverName = "Split_S_speedy",
    },
    {
      Type = FlightManeuver,
      Weighting = 17,
      FlightManeuverName = "JinkLeftAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 17,
      FlightManeuverName = "JinkRightAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 60,
      FlightManeuverName = "BarrelRoll",
    },
  },
  FiringActions = {
    {
      Type = NoAction,
      Weighting = 13,
    },
    {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "JinkLeft",
    },
    {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "JinkRight",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "NinetyDegRightTurn",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "NinetyDegLeftTurn",
    },
  },
}
