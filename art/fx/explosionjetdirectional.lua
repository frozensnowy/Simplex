-- Directional, thin jet of flame and smoke, HIGHLY temporary.  For use with impacts and death explosions that stay on the surface of the ship.
fx = 
{ 
    style = "STYLE_SPRAY", 
    properties = 
    { 
    	property_17 = 
	{
		name = "Force_First",
		type = "VARTYPE_BOOL",
		value = 1,
	},
        property_16 = 
        { 
            name = "Particle_Scale", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 9, 1, 4, }, },  --the entire effect is entity scaled for a higaaran assault frigate. We'll see how that holds up.
        property_15 = 
        { 
            name = "Gravwell_Strength", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 9.81, 1, 9.81, }, }, 
        property_09 = 
        { 
            name = "Emitter_Volume", 
            type = "VARTYPE_ARRAY_TIMEVECTOR3", 
            value = 
            { 
                entry_00 = 
                    { 0, 0, 0, 0, }, 
                entry_01 = 
                    { 1, 0, 0, 0, }, }, }, 
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
                { 0, 75, 1, 0, }, }, --emitter rate tweaks shouldn't change the timeframe.
        property_05 = 
        { 
            name = "Emitter_Drag", 
            type = "VARTYPE_FLOAT", 
            value = 0.1, }, --slows 'em some, but doesn't stop 'em dead. Hard to edit.
        property_08 = 
        { 
            name = "Emitter_Deviation", 
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 53, 1, 180, }, }, 
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
            value = 1, },  --was 1
        property_01 = 
        { 
            name = "Emitter_Loop", 
            type = "VARTYPE_BOOL", 
            value = 0, }, 
        property_13 = 
        { 
            name = "Particle_Fx", 
            type = "VARTYPE_STRING", 
            value = "explosionjetthinshort", }, 
        property_14 = 
        { 
            name = "Particle_Dynamics", 
            type = "VARTYPE_INT", 
            value = 0, }, 
        property_11 = 
        { 
            name = "Particle_Speed",  --controls generated speed, not speed over time
            type = "VARTYPE_ARRAY_TIMEFLOAT", 
            value = 
                { 0, 100,0.16,120, 1, 0, }, },   --was 10 and 5 with higher drag
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
            value = 2, },  --should be 0.5
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
