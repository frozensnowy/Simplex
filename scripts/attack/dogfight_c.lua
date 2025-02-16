--Modified Dogfight_Light script for HGN Gunships
AttackStyleName = DogFight
Data = {
  howToBreakFormation = StraightAndScatter,
  maxBreakDistance = 1000,
  distanceFromTargetToBreak = 200,
  safeDistanceFromTargetToDoActions = 600,
  minSpeedFraction = 0.8,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = NoAction,
      Weighting = 19,
    },
  },
  BeingAttackedActions = {
    {
      Type = NoAction,
      Weighting = 20,
    },
    {
      Type = PickNewTarget,
      Weighting = 8,
    },
    {
      Type = FlightManeuver,
      Weighting = 3,
      FlightManeuverName = "JinkLeftAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 3,
      FlightManeuverName = "JinkRightAndBack",
    },
    {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "NinetyDegRightTurn",
    },
    {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "NinetyDegLeftTurn",
    },
    {
      Type = FlightManeuver,
      Weighting = 3,
      FlightManeuverName = "ImmelMann",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "Split_S",
    },
  },
  FiringActions = {
    {
	 Type = NoAction,
	 Weighting = 13,
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "RollCW_slow",
    },
  },
}