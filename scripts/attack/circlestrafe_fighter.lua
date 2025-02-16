-- LuaDC version 0.9.19
-- 5/23/2004 7:23:35 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
AttackStyleName = CircleStrafe
Data = { 
howToBreakFormation = StraightAndScatter, 
inRangeMultiplier = 0.9, 
optimumRangeMultiplier = 18, 
rangeMultiplierForHeight = 10,	--0.1
distanceVariation = 0.5, 	
RandomActions = {
	{Type = PickNewTarget, Weighting = 19},
	{Type = NoAction, Weighting = 50},
  {Type = FlightManeuver, Weighting = 1, FlightManeuverName = "Split_S_speedy"},
  {Type = FlightManeuver, Weighting = 1, FlightManeuverName = "BarrelRoll"},},
BeingAttackedActions = {
  {Type = NoAction, Weighting = 50},
  {Type = PickNewTarget, Weighting = 10},
  {Type = FlightManeuver, Weighting = 17, FlightManeuverName = "JinkLeft"},
  {Type = FlightManeuver, Weighting = 17, FlightManeuverName = "JinkRight"},
  {Type = FlightManeuver, Weighting = 100, FlightManeuverName = "ImmelMann"},
  {Type = FlightManeuver, Weighting = 20, FlightManeuverName = "Split_S_speedy"},
  {Type = FlightManeuver, Weighting = 20, FlightManeuverName = "BarrelRoll"},
  {Type = FlightManeuver, Weighting = 60, FlightManeuverName = "Loop"},},
FiringActions = {
	{Type = InterpolateTarget, Weighting = 10, minParam = 3, maxParam = 3},
	{Type = NoAction, Weighting = 25},
  {Type = FlightManeuver, Weighting = 10, FlightManeuverName = "RollCW"},
  {Type = FlightManeuver, Weighting = 10, FlightManeuverName = "RollCCW"},
  {Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkLeft"},
  {Type = FlightManeuver, Weighting = 1, FlightManeuverName = "JinkRight"},
	},
}
