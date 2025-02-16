AttackStyleName = FaceTarget
Data = {
  inRangeFactor=0.5,
  tooSlowSpeed=100,
  tooFastMultiplier=2.0,
  facingAngle=0,
  tryToMatchHeight = 0, 
  tryToGetAboveTarget=0,
  SlideDistanceMultiplier=0.5,
  flyToTargetBecauseItsFarOutOfRangeDelay = 0, 
  flyToTargetBecauseItsMovingAwayDelay = 1, 
  stopAndFaceTheTargetDelay = 45, 
  RandomActions = {
    {
      Type = PickNewTarget,
      Weighting = 10,
    },
    {
      Type = InterpolateTarget,
      Weighting = 10,
    },
   {
      Type = NoAction,
      Weighting = 50,
    },
  },
  BeingAttackedActions = {},
  FiringActions = {
    { 
            Type = PickNewTarget, 
            Weighting = 10, }, 
   {
      Type = NoAction,
      Weighting = 50,
    },
  },
}
