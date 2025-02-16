-- Pretty-Printed using HW2 Pretty-Printer 1.21 by Mikail.
-- LuaDC version 0.9.19
-- 5/23/2004 11:08:08 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
TO_Random = 0
TO_ShipAligned = 1
TT_HeavyDamage = 0
type = "POINT"
version = 3
radius = 5
shallowAngleDeg = 60
minScarDist = 5
textureOrient = TO_Random
---------------------------------------
scarProbability = 1
fxProbability = 1
---------------------------------------
textures = 
{
	{
		"bullet/bullet_pock_01.tga",
		25,
	},
	{
		"bullet/bullet_pock_03.tga",
		25,
	},
}

heavyDamageTextures = 
{
	{
		"bullet/Explosion.tga",
		50,
	},
}

fxs = 
{
	{
		"generic_beam_dmg_combo",0.01,TT_HeavyDamage,
	},
}

