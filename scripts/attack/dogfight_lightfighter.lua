AttackStyleName = DogFight
Data = {
  howToBreakFormation = StraightAndScatter,
  minSpeedFraction = 1.0,
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 100,
    },
    {
      Type = NoAction,
      Weighting = 200,
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "BarrelRoll",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "ImmelMann_speedy",
    },
  },
  BeingAttackedActions = {
    {
      Type = NoAction,
      Weighting = 50,
    },
    {
      Type = PickNewTarget,
      Weighting = 10,
    },
    {
      Type = FlightManeuver,
      Weighting = 17,
      FlightManeuverName = "JinkLeft",
    },
    {
      Type = FlightManeuver,
      Weighting = 17,
      FlightManeuverName = "JinkRight",
    },
    {
      Type = FlightManeuver,
      Weighting = 100,
      FlightManeuverName = "ImmelMann",
    },
    {
      Type = FlightManeuver,
      Weighting = 20,
      FlightManeuverName = "Split_S_speedy",
    },
    {
      Type = FlightManeuver,
      Weighting = 70,
      FlightManeuverName = "BarrelRoll",
    },
    {
      Type = FlightManeuver,
      Weighting = 60,
      FlightManeuverName = "Loop",
    },
  },
  FiringActions = {
    {
      Type = NoAction,
      Weighting = 25,
    },
    {
      Type = FlightManeuver,
      Weighting = 10,
      FlightManeuverName = "RollCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 10,
      FlightManeuverName = "RollCCW",
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
  },
}
