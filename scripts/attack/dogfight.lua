--===========================================================================
--        Purpose : Lua definition file for Simplex .
--            -contains dog fight attack data
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

AttackStyleName = DogFight

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,

  maxBreakDistance = 4000,	--1000
  distanceFromTargetToBreak = 1200,	--200
  safeDistanceFromTargetToDoActions = 100,
	
	-- Ships will try to go no slower than this fraction of their max speed in a dogfight
	minSpeedFraction		= 0.8,
	
	-- done every sim frame
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 10,
		},
		{
			Type = NoAction,
			Weighting = 140,
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
			FlightManeuverName = "JinkLeft",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRight",
		},
--		{
--			Type = FlightManeuver,
--			Weighting = 1,
--			FlightManeuverName = "JinkLeftAndBack",
--		},
	},
	BeingAttackedActions = 
	{
		{
			Type = NoAction,
			Weighting = 400,
		},
		{
			Type = PickNewTarget,
			Weighting = 200,
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
--		{
--			Type = FlightManeuver,
--			Weighting = 1,
--			FlightManeuverName = "JinkLeftAndBack",
--		},
	},
	FiringActions = 
	{
	},
}
