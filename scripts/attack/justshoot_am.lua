--===========================================================================
--        Purpose : Lua definition file for Simplex .
--            -contains just shoot attack data
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

AttackStyleName = JustShoot

Data = 
{
	-- when approaching the target use this method to split the formation and transition in to the attack style
	howToBreakFormation = BreakImmediately,
	
    -- don't face the target
    faceTargetHorizontal = 0,
    faceTargetVertical = 0,
    
	-- done at the end of every sim frame
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
	 {
			Type = InterpolateTarget,
			Weighting = 100,
		},
		{
			Type = PickNewTarget,
			Weighting = 100,
		},
		{
			Type = NoAction,
			Weighting = 0,
		},
	},
}
