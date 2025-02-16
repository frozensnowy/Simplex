AttackStyleName = CircleStrafe
Data = {
  howToBreakFormation = StraightAndScatter,
  inRangeMultiplier = 10,
  optimumRangeMultiplier = 100,
  rangeMultiplierForHeight = 0.3,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 1,
    },
    {
      Type = InterpolateTarget,
      Weighting = 10,
    },
    {
      Type = NoAction,
      Weighting = 55,
    },
  },
  BeingAttackedActions = {
    {
      Type = NoAction,
      Weighting = 20,
    },
    {
      Type = PickNewTarget,
      Weighting = 4,
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
      Weighting = 2,
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
