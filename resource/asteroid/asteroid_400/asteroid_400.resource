--===========================================================================
--  Purpose : Lua definition file for Homeworld Resource.
--            Contains basic resource members.
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================
NewResourceType = StartAsteroidConfig()
NewResourceType.displayedName="2506"
NewResourceType.sobDescription="2507"
NewResourceType.TOIcon="InvertedTriangle"
NewResourceType.TOScale=1
NewResourceType.TODistanceFade0=11000
NewResourceType.TODistanceDisappear0=9000
NewResourceType.TODistanceFade1=5500
NewResourceType.TODistanceDisappear1=5000
NewResourceType.TODistanceFade2=12000
NewResourceType.TODistanceDisappear2=200000
NewResourceType.TOGroupScale=1
NewResourceType.TOGroupMergeSize=0.01
NewResourceType.maxhealth=100000
NewResourceType.regentime=0
--NewResourceType.nlips=0.000025
--NewResourceType.nlipsRange=150000
--NewResourceType.nlipsFar=0.0000025
--NewResourceType.nlipsFarRange=150000
NewResourceType.SMRepresentation="HardDot"
NewResourceType.meshRenderLimit=150000
NewResourceType.dotRenderLimit=30000
NewResourceType.visibleInSecondary=1
NewResourceType.minLOD=0.25
NewResourceType.upLOD=800
NewResourceType.upLOD=1500
NewResourceType.downLOD=815
NewResourceType.downLOD=1515
NewResourceType.minimumZoomFactor=0.68
NewResourceType.preciseSelectionLimit=1200
NewResourceType.selectionSizeMin=0
NewResourceType.selectionSizeMax=0
NewResourceType.selectionPriority=50
NewResourceType.relativeMoveFactor=4
NewResourceType.useEngagementRanges=0
NewResourceType.pixelSize=3
NewResourceType.pixelColour={1, 1, 1, 0.67}  --{1.0, 0.349, 0.199, 1.0}
NewResourceType.pixelColourDepleted={0.3, 0.3, 0.3, 0.3}  --{0.5, 0.4, 0.3, 1.0}
NewResourceType.resourceValue=400
NewResourceType.blobRadius=500
NewResourceType.maxVelocity=0
NewResourceType.maxAngularVelocity=0.05
NewResourceType.linearFriction=0.5
NewResourceType.angularFriction=0.5
NewResourceType.mass=13.2
NewResourceType.Ixx=100
NewResourceType.Iyy=100
NewResourceType.Izz=100
NewResourceType.DockFamily="Resource"
NewResourceType.AvoidanceFamily="SmallRock"
NewResourceType.AttackFamily="Resource"
