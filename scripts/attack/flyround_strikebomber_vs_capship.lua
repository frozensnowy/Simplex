AttackStyleName = FlyRound
Data = {
  howToBreakFormation = StraightAndScatter,
  axisRotation = 15,
  maxAxisRotation = 85,
  circleSegmentAngle = 45,
  angleVariation = 0.2,
  distanceFromTarget = 9000,
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
    {
	Type = FlightManeuver,
	Weighting = 1,
	FlightManeuverName = "Loop",
    },
  },
  BeingAttackedActions = {
    {
	Type = FlightManeuver,
	Weighting = 15,
	FlightManeuverName = "Loop",
    },
},
  FiringActions = {
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCW_slow",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "RollCCW_slow",
		},
	},
}
