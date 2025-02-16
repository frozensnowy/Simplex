-- LuaDC version 0.9.19
-- 5/23/2004 7:23:35 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
-- original circlestr
AttackStyleName = CircleStrafe
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeMultiplier = 0.9, 
    optimumRangeMultiplier = 40, 
    rangeMultiplierForHeight = 10,	--0.1
    distanceVariation = 0.5, 	
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
            Type = NoAction, 
            Weighting = 1, },
		{
			Type = PickNewTarget,
			Weighting = 2,
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
			FlightManeuverName = "ImmelMann_speedy",
		},
	},
    FiringActions = 
	{
        { 
            Type = NoAction, 
            Weighting = 1, }, 
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
	},
}



