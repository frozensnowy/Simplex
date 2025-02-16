-- This attack style is used by the FC-11 Lance Fighter
AttackStyleName = AttackRun

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	-- Maximum distance to get from the target when breaking away.
	maxBreakDistance = 1600,
	-- break off the attack run when this distance from the target
	distanceFromTargetToBreak = 350,
	safeDistanceFromTargetToDoActions = 1000,
	-- data for picking the position in space to fly to when we break off the attack run
	-- how to orient the choice of break point, options are Attacker,Target and TargetAttackPoint
	coordSysToUse = Attacker,
	horizontalMin = 0.6,
	horizontalMax = 0.9,
	horizontalFlip = 1,
	verticalMin = 0.2,
	verticalMax = 0.2,
	verticalFlip = 1,
	-- done while flying towards target	
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 30,
		},
	},
	BeingAttackedActions = {
		{
			Type = FlightManeuver,
			Weighting = 10,
			FlightManeuverName = "BarrelRoll",
		},
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

