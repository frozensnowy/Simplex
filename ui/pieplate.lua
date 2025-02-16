-- LuaDC version 0.9.19
-- 5/23/2004 7:31:21 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
pieTwkPiePieces = 128
pieTwkHorizonPieces = 24
pieTwkPieClosestDistance = 200
pieTwkMaxMovementDist = 800000
pieTwkHorizontalHashMarkLength = 5000
pieTwkVerticalHashMarkLength = 2000
pieTwkHeightSnap = 20
pieTwkShipCloseToPlaneDistance = 100
pieTwkPieCircleSizeMax = 0.02
pieTwkPieCircleSizeMin = 0.01
pieTwkHeightFactor = 1.5
pieTwkBoxAngleFactor = 90
pieTwkBlobThreshold = 10000
pieTwkMoveToDiscColour = 
    { 1, 1, 0, 1, }
pieTwkMoveToPlanarDiscColour = 
    { 0.5, 0.5, 0, 1, }
pieTwkInvalidDestinationColour = 
    { 1, 0, 0, 1, }
pieTwkShipOnPlaneColour = 
    { 0.914, 0.447, 0, 1, }
pieTwkClosestShipOnPlaneColour = 
    { 1, 1, 0, 1, }
pieTwkScaleUpTime = 0.4
pieTwkScaleDownTime = 0.4
pieTwkSeperateDiscs = false
pieLocaleID = "$2857"
Default = 
{ 
    innerPieColour = 
        { 0, 1, 1, 1, }, 
    rangePieColour = 
        { 0, 0.8, 0.8, 0.1, }, 
    outerPieColour = 
        { 1, 0, 1, 1, }, }
Hyperspace = 
{ 
    innerPieColour = 
        { 1, 0, 1, 1, }, 
    rangePieColour = 
        { 0.8, 0, 0.8, 0.1, }, 
    outerPieColour = 
        { 1, 0, 1, 1, }, }
LayMines = 
{ 
    innerPieColour = 
        { 1, 0, 0, 1, }, 
    rangePieColour = 
        { 0.8, 0, 0, 0.2, }, 
    outerPieColour = 
        { 1, 1, 1, 1, }, }
SetRallyPoint = 
{ 
    innerPieColour = 
        { 1, 1, 1, 1, }, 
    rangePieColour = 
        { 0.8, 0.8, 0.8, 0.1, }, 
    outerPieColour = 
        { 1, 0, 1, 1, }, }
WaypointMove = 
{ 
    innerPieColour = 
        { 0, 1, 0, 1, }, 
    rangePieColour = 
        { 0, 0.8, 0, 0.1, }, 
    outerPieColour = 
        { 1, 1, 1, 1, }, }
AttackMove = 
{ 
    innerPieColour = 
        { 1, 0, 0, 1, }, 
    rangePieColour = 
        { 0.8, 0, 0, 0.1, }, 
    outerPieColour = 
        { 1, 1, 1, 1, }, }
