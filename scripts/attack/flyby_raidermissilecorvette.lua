-- LuaDC version 0.9.19
-- 5/23/2004 7:23:35 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
-- AttackStyleName = AttackRun
-- Data = 
-- { 
    -- howToBreakFormation = StraightAndScatter, 
    -- maxBreakDistance = 3500, 
    -- distanceFromTargetToBreak = 2050, 
    -- safeDistanceFromTargetToDoActions = 1400, 
    -- useTargetUp = 0, 
	-- coordSysToUse = TargetPoint,
	-- horizontalMin = 0.7,
	-- horizontalMax = 0.9,
	-- horizontalFlip = 1,
	-- verticalMin = 0.7,
	-- verticalMax = 0.9,
	-- verticalFlip = 1,
    -- RandomActions = 
        -- { 
        -- { 
            -- Type = PickNewTarget, 
            -- Weighting = 1, }, 
        -- { 
            -- Type = NoAction, 
            -- Weighting = 2, }, 
        -- }, 
    -- BeingAttackedActions = {}, 
    -- FiringActions = 
        -- { 
        -- { 
            -- Type = NoAction, 
            -- Weighting = 13, }, 
        -- { 
            -- Type = FlightManeuver, 
            -- Weighting = 1, 
            -- FlightManeuverName = "RollCW", }, 
        -- { 
            -- Type = FlightManeuver, 
            -- Weighting = 1, 
            -- FlightManeuverName = "RollCCW", }, 
        -- }, }
		
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
    optimumRangeMultiplier = 175, 
    rangeMultiplierForHeight = 0.1,
    distanceVariation = 0.1, 	
    RandomActions = {}, 
    BeingAttackedActions = {}, 
    FiringActions = {}, 
}

