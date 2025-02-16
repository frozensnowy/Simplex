AttackStyleName = FaceTarget
Data = { 
    howToBreakFormation = StraightAndScatter, 
    inRangeFactor = 0.9, 
    optimumRangeMultiplier = 9,
    rangeMultiplierForHeight = 0.3,
    slideDistanceMultiplier = 1.75, 
    tooSlowSpeed = 0, 	--3
    tooFastMultiplier = 1, 	--1.4
    facingAngle = 0, 
    moveAttackMaxDistanceMultiplier = 1.2,
    tryToMatchHeight = 0, 
    tryToGetAboveTarget = 0, 
    flyToTargetBecauseItsFarOutOfRangeDelay = 2, 
    flyToTargetBecauseItsMovingAwayDelay = 3.5, 
    stopAndFaceTheTargetDelay = 1,
    flyToAboveTheTargetDelay = 1, 
    RandomActions = {
     }, 
    BeingAttackedActions = {
   {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "HalfRollCW",
    },
    {
      Type = FlightManeuver,
      Weighting = 1,
      FlightManeuverName = "HalfRollCCW",
    },
    }, 
    FiringActions = { 
     {
      Type = FlightManeuver,
      Weighting = 2,
      FlightManeuverName = "HalfRollCW",
    },
    }, 
   }
