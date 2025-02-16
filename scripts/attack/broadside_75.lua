-- TFS

AttackStyleName = FaceTarget
Data =
{
    howToBreakFormation = StraightAndScatter,
    inRangeFactor = 0.725,
    slideDistanceMultiplier = 1.5,
    tooSlowSpeed = 3,
    tooFastMultiplier = 1.4,
    facingAngle = 90,
    moveAttackMaxDistanceMultiplier = 1.2,
    tryToMatchHeight = 0,
    tryToGetAboveTarget = 0,
    flyToTargetBecauseItsFarOutOfRangeDelay = 0,
    flyToTargetBecauseItsMovingAwayDelay = 1,
    stopAndFaceTheTargetDelay = 1,
    flyToAboveTheTargetDelay = 1,
    safeDistanceFromTargetToDoActions = 800,
    coordSysToUse = Attacker,
    RandomActions =
        {
        {
            Type = InterpolateTarget,
            Weighting = 50, },
        {
            Type = PickNewTarget,
            Weighting = 300, },
        {
            Type = NoAction,
            Weighting = 400, },
        },
    BeingAttackedActions =
        {
        {
            Type = PickNewTarget,
            Weighting = 250, },
        {
            Type = NoAction,
            Weighting = 400, },
        },
    FiringActions =
        {
        {
            Type = InterpolateTarget,
            Weighting = 50, },
        {
            Type = PickNewTarget,
            Weighting = 250, },
        {
            Type = NoAction,
            Weighting = 400, },
        }, }
function DegToRad(angle)
    return angle * 2 * 3.141592653589 / 360
end
