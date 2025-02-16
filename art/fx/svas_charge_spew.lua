fx = {
	style = "STYLE_SPRAY", properties = {
	property_16 = {name = "Particle_Scale", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 1, 1, 0.5},},
	property_15 = {name = "Gravwell_Strength", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 9, 1, 0},},
		-- Value used depending of Particle_Dynamics
	property_09 = {name = "Emitter_Volume", type = "VARTYPE_ARRAY_TIMEVECTOR3", value = {entry_00 = {0, 10, 10, 10}, entry_01 = {1, 0, 0, 0},},},
	property_04 = {name = "Emitter_InheritVelocity", type = "VARTYPE_FLOAT", value = 1},
	property_03 = {name = "Emitter_Direction", type = "VARTYPE_INT", value = 0},
		--0 = forward, 1 = up, 2 = down
	property_06 = {name = "Emitter_Rate", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 60, 0.1, 60, 0.2, 60, 0.3, 60, 0.4, 60, 0.5, 60, 0.6, 60, 0.7, 60, 0.8, 60, 0.9, 60, 1, 60},},
	property_05 = {name = "Emitter_Drag", type = "VARTYPE_FLOAT", value = 1000},
	property_08 = {name = "Emitter_Deviation", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 180, 1, 180},},
	property_07 = {name = "Emitter_Rate_LOD%", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 60, 1, 60},},
	property_02 = {name = "Emitter_ScaleSpeed", type = "VARTYPE_BOOL", value = 1},
	property_01 = {name = "Emitter_Loop", type = "VARTYPE_BOOL", value = 0},
	property_13 = {name = "Particle_Fx", type = "VARTYPE_STRING", value = "Bvas_charge_spew_particle"},
	property_14 = {name = "Particle_Dynamics", type = "VARTYPE_INT", value = 10},
		--0,6,9 = don't move, 1,2,3,8 = fall, 4 = up (smoke-like), 5,7 = flat, 10 = attract, 11 = wind
	property_11 = {name = "Particle_Speed", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 0, 1, 0},},
		-- speed in the direction of Emitter_Direction
	property_12 = {name = "Emitter_RotRate", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 0, 1, 0},},
	property_00 = {name = "Emitter_Duration", type = "VARTYPE_FLOAT", value = 1.8},
	property_10 = {name = "Emitter_Offset", type = "VARTYPE_ARRAY_TIMEVECTOR3", value = {entry_00 = {0, 0, 0, 15}, entry_01 = {1, 0, 0, 15},},},},}
