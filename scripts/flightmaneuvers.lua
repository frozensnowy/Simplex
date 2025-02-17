-- LuaDC version 0.9.19
-- 5/23/2004 7:16:37 PM
-- This file is decrypted. Maybe we should encrypt it again for distribution.
-- On error, please contact Frozen Snow
--
flightManeuvers = {}
flightManeuvers[0] = 
{ 
    name = "BarrelRoll", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = -2, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 1, 0, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = -2, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = -2, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { -1, 0, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = -2, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = -2, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 2.25, }, 
        }, }
flightManeuvers[1] = 
{ 
    name = "Loop", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 1, 0, }, 
            up = 
                { 0, 0, -1, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, -1, 0, }, 
            up = 
                { 0, 0, 1, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[2] = 
{ 
    name = "RollCW", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.5, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
flightManeuvers[3] = 
{ 
    name = "ImmelMann", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 1.125, }, 
        { 
            forward = 
                { 0, 1, 0, }, 
            up = 
                { 0, 0, -1, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 1.125, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 1.125, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 1, 0, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 1.125, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.2, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 2.25, }, 
        }, }
flightManeuvers[4] = 
{ 
    name = "Split_S", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.2, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { -1, 0, 0, }, 
            wishForwardBackwardSpeed = 0.2, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, -0.651771, 0.758416, }, 
            up = 
                { 0, -0.758416, -0.651771, }, 
            wishForwardBackwardSpeed = 0.2, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, -1, 0, }, 
            up = 
                { 0, 0, -1, }, 
            wishForwardBackwardSpeed = 0.2, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, -0.573576, -0.819152, }, 
            up = 
                { 0, 0.819152, -0.573576, }, 
            wishForwardBackwardSpeed = 0.2, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[5] = 
{ 
    name = "HalfRollCCW", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 1, 0, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[6] = 
{ 
    name = "HalfRollCW", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { -1, 0, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, -1, 0, }, 
            wishForwardBackwardSpeed = 0.3, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[7] = 
{ 
    name = "WingWaggle", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
flightManeuvers[8] = 
{ 
    name = "RollCCW", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -360, 
            timeDelay = 0.5, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
flightManeuvers[9] = 
{ 
    name = "BarrelRollCW", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 2, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.6, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 3, 
            rotationAccelerationMultiplier = 4.5, }, 
        }, }
flightManeuvers[10] = 
{ 
    name = "JinkLeft", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.6, 
            wishLeftRightSpeed = 1.3, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1.875, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[11] = 
{ 
    name = "JinkLeftAndBack", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.6, 
            wishLeftRightSpeed = 1.5, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 3.375, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.6, 
            wishLeftRightSpeed = -1.5, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
flightManeuvers[12] = 
{ 
    name = "JinkRight", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.6, 
            wishLeftRightSpeed = -1.3, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -360, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1.875, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[13] = 
{ 
    name = "ImmelMann_speedy", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 2, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -25.396826, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 4.5, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3, }, 
        }, }
flightManeuvers[14] = 
{ 
    name = "Split_S_speedy", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 370, 
            timeDelay = 0.35, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3.75, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 2, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 4.5, }, 
        }, }
flightManeuvers[15] = 
{ 
    name = "OneEightyDegRightTurn", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 2, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 4.5, }, 
        }, }
flightManeuvers[16] = 
{ 
    name = "RollCW_slow", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 115, 
            timeDelay = 1.5, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 0.73, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
flightManeuvers[17] = 
{ 
    name = "Empty", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 1, }, 
        }, }
flightManeuvers[18] = 
{ 
    name = "OneEightyDegLeftTurn", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -360, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 2, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, -1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 4.5, }, 
        }, }
flightManeuvers[19] = 
{ 
    name = "RollCCW_slow", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -115, 
            timeDelay = 1.5, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 0.73, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 1, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
flightManeuvers[20] = 
{ 
    name = "NinetyDegRightTurn", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 360, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 2, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { -1, 0, 0, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 4.5, }, 
        }, }
flightManeuvers[21] = 
{ 
    name = "NinetyDegLeftTurn", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -360, 
            timeDelay = 0.2, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 3, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 2, 
            wishRotationXSpeed = -360, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.25, }, 
        { 
            forward = 
                { 1, 0, 0, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.7, 
            wishLeftRightSpeed = 0, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.04, 
            ignoreOrientation = 0, 
            accelerationMultiplier = 2.25, 
            rotationAccelerationMultiplier = 4.5, }, 
        }, }
flightManeuvers[22] = 
{ 
    name = "JinkRightAndBack", 
    points = 
        { 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.6, 
            wishLeftRightSpeed = -1.5, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = -360, 
            timeDelay = 0.1, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 3.375, }, 
        { 
            forward = 
                { 0, 0, 1, }, 
            up = 
                { 0, 1, 0, }, 
            wishForwardBackwardSpeed = 0.6, 
            wishLeftRightSpeed = 1.5, 
            wishUpDownSpeed = 0, 
            wishRotationXSpeed = 0, 
            wishRotationYSpeed = 0, 
            wishRotationZSpeed = 0, 
            timeDelay = 0.3, 
            ignoreOrientation = 1, 
            accelerationMultiplier = 1.125, 
            rotationAccelerationMultiplier = 2.7, }, 
        }, }
