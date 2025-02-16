--===========================================================================
--        Purpose : Lua definition file for Simplex .
--            -contains fly by attack data
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 4760.0,	--1760.0
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 1035.0,	--935.0
	safeDistanceFromTargetToDoActions = 720.0,
	useTargetUp = 0,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = TargetPoint,
	horizontalMin = 0.2,
	horizontalMax = 0.6,
	horizontalFlip = 1,
	verticalMin = 0.4,
	verticalMax = 0.7,
	verticalFlip = 0,
	
	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 2,
		},
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
		{
			Type = NoAction,
			Weighting = 25,
		},
		{
			Type = FlightManeuver,
			Weighting = 3,
			FlightManeuverName = "RollCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 3,
			FlightManeuverName = "RollCCW",
		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkLeft",
		},
--		{
--			Type = FlightManeuver,
--			Weighting = 1,
--			FlightManeuverName = "JinkLeftAndBack",
--		},
		{
			Type = FlightManeuver,
			Weighting = 1,
			FlightManeuverName = "JinkRight",
		},
--		{
--			Type = FlightManeuver,
--			Weighting = 1,
--			FlightManeuverName = "JinkRightAndBack",
--		},
	},
}
