--===========================================================================
--        Purpose : Lua definition file for Simplex .
--            -contains strafe attack data
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = ClimbAndPeelOff,
	
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 2900.0,
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 1100.0,
	safeDistanceFromTargetToDoActions = 3000.0,
	
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Target,
	horizontalMin = 0.1,
	horizontalMax = 0.4,
	horizontalFlip = 1,
	verticalMin = 0.6,
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
			Weighting = 13,
		},
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
