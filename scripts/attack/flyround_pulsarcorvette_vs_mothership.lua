--===========================================================================
--        Purpose : Lua definition file for Simplex .
--            -contains flyround attack data
--			   FlyRound heads towards the target ship then plots points on a 
--			   circle and uses these for the flight path. The scripted 
--			   variables govern the orientation of this circle, it's 
--			   resolution and it's radius. FlyRound also occasionaly skips 
--			   segments and you can control that behaviour from this script.
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

AttackStyleName = FlyRound

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = StraightAndScatter,
	
	--	Axis used for circling will be rotated by between -/+ this amount each step of the circle
	axisRotation			= 15.0,

	--	Axis will never be more than this many degrees from vertical
	maxAxisRotation			= 90.0,

	--	Angle between points on the circle
	circleSegmentAngle		= 45.0,

	--	Multiply CircleSegmentAngle by from 1-AngleVariation to 1+AngleVariation
	angleVariation			= 0.2,

	-- the circle midpoint will be this far above the target centre
	circleHeight			= -300.0,

	--	Ships will fly at this distance from the target's surface
	distanceFromTarget		= 100.0,

	--	Multiply DistanceFromTarget by from 1-DistanceVariation to 1+DistanceVariation
	distanceVariation		= 0.3,

	--	Percentage chance that after completing a segment of the circle a ship will cut across the circle
	percentChanceOfCutting	= 5.0,

	--	When cutting across the circle skip at least this many segments
	minSegmentsToCut		= 1,

	--	When cutting across the circle skip up to this many segments
	maxSegmentsToCut		= 3,
	
	-- done at the end of every strafing run
	RandomActions = 
	{
		{
			Type = PickNewTarget,
			Weighting = 1,
		},
		{
			Type = NoAction,
			Weighting = 9,
		},
	},
	BeingAttackedActions = 
	{
	},
	FiringActions = 
	{
	},
}
