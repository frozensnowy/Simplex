-- LuaDC version 0.9.19
-- 5/23/2004 7:23:35 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
AttackStyleName = CircleStrafe
Data = 
{ 
    howToBreakFormation = StraightAndScatter, 
    inRangeMultiplier = 0.9, 
    optimumRangeMultiplier = 50, 
    rangeMultiplierForHeight = 10,	--0.1
    distanceVariation = 0.5, 	
    RandomActions = {}, 
    BeingAttackedActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
       		{ 
           		Type = NoAction, 
           		Weighting = 9, }, 
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
    FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 16,
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
