-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

AttackStyleName = FaceTarget
Data = {
howToBreakFormation = StraightAndScatter,
inRangeFactor = 0.1,
slideDistanceMultiplier = 1.5,
tooSlowSpeed = 3,
tooFastMultiplier = 1.4,
facingAngle = 0,
moveAttackMaxDistanceMultiplier = 1.2,
tryToMatchHeight = 0,
tryToGetAboveTarget = 0,
flyToTargetBecauseItsFarOutOfRangeDelay = 0,
flyToTargetBecauseItsMovingAwayDelay = 1,
stopAndFaceTheTargetDelay = 1,
flyToAboveTheTargetDelay = 1,
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