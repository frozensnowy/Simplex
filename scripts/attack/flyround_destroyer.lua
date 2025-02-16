-- LuaDC version 0.9.19
-- 5/23/2004 7:23:37 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = FlyRound
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    axisRotation = 5, 
    maxAxisRotation = 90, 	--20
    circleSegmentAngle = 30, 
    angleVariation = 0.2, 
    circleHeight = -300, 
    distanceFromTarget = 2700, 
    distanceVariation = 0.3, 	--0.1
    percentChanceOfCutting = 5, 
    minSegmentsToCut = 1, 
    maxSegmentsToCut = 1, 
    RandomActions = 
        { 
        { 
            Type = PickNewTarget, 
            Weighting = 1, }, 
        { 
            Type = NoAction, 
            Weighting = 9, }, 
        }, 
    BeingAttackedActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 3,
		},
		{
			Type = NoAction,
			Weighting = 15,
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
			FlightManeuverName = "Split_S",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "ImmelMann",
		},
	},
    FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 34,
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
			FlightManeuverName = "ImmelMann",
		},
	},
}
