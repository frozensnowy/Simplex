-- LuaDC version 0.9.20
-- 2011/7/9 22:01:30
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
fx = 
{ 
    style = "STYLE_SPRAY", 
    properties = 
    { 
        property_16 = 
        { 
            name = "Particle_Scale", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 5, 1, 5, }, }, 
        property_15 = 
        { 
            name = "Gravwell_Strength", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 0, 0.55, 0, 1, -0.06667, }, }, 	--{ 0, -9.81, 1, -9.81, }, }, 
        property_09 = 
        { 
            name = "Emitter_Volume", 
            type = "VARTYPE_ARRAY_TIMEVECTOR3", 
            value = 
            { 
                entry_00 = 
                    { 0, 10, 1, 10, }, 
                entry_01 = 
                    { 1, 10, 1, 10, }, }, }, 
        property_04 = 
        { 
            name = "Emitter_InheritVelocity", 
            type = "VARTYPE_FLOAT", 
            value = 0, },
        property_03 = 
        { 
            name = "Emitter_Direction", 
            type = "VARTYPE_INT", 
            value = 0, }, 
        property_06 = 
        { 
            name = "Emitter_Rate", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 0.5*75, 12, 0.5*75, }, }, 	--{ 0, 0, 0.0375, 0, 0.0425, 145.06667, 0.82, 152.26665, 1, 155.73334, }, },
        property_05 = 
        { 
            name = "Emitter_Drag", 
            type = "VARTYPE_FLOAT", 
            value = 0, }, 	--1
        property_08 = 
        { 
            name = "Emitter_Deviation", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 60, 1, 60, }, }, 	--{ 0, 0.8*60, 1, 0.8*80, }, },
        property_07 = 
        { 
            name = "Emitter_Rate_LOD%", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 0, 1, 0, }, }, 
        property_02 = 
        { 
            name = "Emitter_ScaleSpeed", 
            type = "VARTYPE_BOOL", 
            value = 1, }, 
        property_01 = 
        { 
            name = "Emitter_Loop", 
            type = "VARTYPE_BOOL", 
            value = 1, }, 
        property_13 = 
        { 
            name = "Particle_Fx", 
            type = "VARTYPE_STRING", 
            value = "s400_spark_trail", }, 
        property_14 = 
        { 
            name = "Particle_Dynamics", 
            type = "VARTYPE_INT", 
            value = 0, }, 	--10
        property_11 = 
        { 
            name = "Particle_Speed", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 320, 1, 18.66667, }, },
        property_12 = 
        { 
            name = "Emitter_RotRate", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 0, 1, 0, }, }, 
        property_00 = 
        { 
            name = "Emitter_Duration", 
            type = "VARTYPE_FLOAT", 
            value = 20, }, 
        property_10 = 
        { 
            name = "Emitter_Offset", 
            type = "VARTYPE_ARRAY_TIMEVECTOR3", 
            value = 
            { 
                entry_00 = 
                    { 0, 0, 0, 0, }, 
                entry_01 = 
                    { 1, 0, 0, 0, }, }, }, }, }
