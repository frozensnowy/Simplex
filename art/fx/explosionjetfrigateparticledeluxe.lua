-- Pretty-Printed using HW2 Pretty-Printer 1.21 by Mikail.
-- LuaDC version 0.9.19
-- 5/23/2004 11:09:38 PM
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
			{
				0,
				1.2,
				0.175,
				0.6, -- narrows the jets of flame as they expand away from the core.
				0.3,
				0.5,
				0.5,
				0.1,
				1,
				0.025,
			},
		},
		property_15 = 
		{
			name = "Gravwell_Strength",
			type = "VARTYPE_ARRAY_TIMEFLOAT",
			value = 
			{
				0,
				25,
				1,
				25, --does jack shit
			},
		},
		property_09 = 
		{
			name = "Emitter_Volume",
			type = "VARTYPE_ARRAY_TIMEVECTOR3",
			value = 
			{
				entry_00 = 
				{
					0,
					2,
					2, --causes the fiery jet to wobble at first, but these effects get unsightly as the spawned FX get scaled down, hence evening out at t=1
					1,
				},
				entry_01 = 
				{
					0.175, --was 0.15, that was a bit too smooth
					1,
					1,
					0.5,
				},
				entry_02 = 
				{
					0.4, --was 0.5, that was a bit too smooth.
					0.25,
					0.25,
					0.1,
				},
				entry_03 = 
				{
					0.5,
					0,
					0,
					0,
				},
				entry_04 = 
				{
					1,
					0,
					0,
					0,
				},
			},
		},
		property_04 = 
		{
			name = "Emitter_InheritVelocity",
			type = "VARTYPE_FLOAT",
			value = 0,
		},
		property_03 = 
		{
			name = "Emitter_Direction",
			type = "VARTYPE_INT",
			value = 0,
		},
		property_06 = 
		{
			name = "Emitter_Rate",
			type = "VARTYPE_ARRAY_TIMEFLOAT",
			value = 
			{
				0,
				35,
				0.15,
				90,
				1,
				150, --effects are getting smaller as speed stays the same, so... increase spawn rate.
			},
		},
		property_05 = 
		{
			name = "Emitter_Drag",
			type = "VARTYPE_FLOAT",
			value = 1,
		},
		property_08 = 
		{
			name = "Emitter_Deviation",
			type = "VARTYPE_ARRAY_TIMEFLOAT",
			value = 
			{
				0,
				360,
				1,
				360,
			},
		},
		property_07 = 
		{
			name = "Emitter_Rate_LOD%",
			type = "VARTYPE_ARRAY_TIMEFLOAT",
			value = 
			{
				0,
				0,
				1,
				0,
			},
		},
		property_02 = 
		{
			name = "Emitter_ScaleSpeed",
			type = "VARTYPE_BOOL",
			value = 1,
		},
		property_01 = 
		{
			name = "Emitter_Loop",
			type = "VARTYPE_BOOL",
			value = 0,
		},
		property_13 = 
		{
			name = "Particle_Fx",
			type = "VARTYPE_STRING",
			value = "explosionjetfrigatefieryring",
		},
		property_14 = 
		{
			name = "Particle_Dynamics",
			type = "VARTYPE_INT",
			value = 0,
		},
		property_11 = 
		{
			name = "Particle_Speed",
			type = "VARTYPE_ARRAY_TIMEFLOAT",
			value = 
			{
				0,
				0.33333,
				1,
				0.26667,
			},
		},
		property_12 = 
		{
			name = "Emitter_RotRate",
			type = "VARTYPE_ARRAY_TIMEFLOAT",
			value = 
			{
				0,
				0,
				1,
				0,
			},
		},
		property_00 = 
		{
			name = "Emitter_Duration",
			type = "VARTYPE_FLOAT",
			value = 0.67, --was 0.5
		},
		property_10 = 
		{
			name = "Emitter_Offset",
			type = "VARTYPE_ARRAY_TIMEVECTOR3",
			value = 
			{
				entry_00 = 
				{
					0,
					0,
					0,
					0,
				},
				entry_01 = 
				{
					1,
					0,
					0,
					0,
				},
			},
		},
	},
}

