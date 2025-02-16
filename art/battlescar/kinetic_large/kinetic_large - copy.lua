-- LuaDC version 0.9.19
-- 5/23/2004 11:08:09 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
TO_Random = 0
TO_ShipAligned = 1
TT_HeavyDamage = 1
type = "POINT"
version = 3
radius = 5
scarProbability = 0.75
shallowAngleDeg = 10
minScarDist = 5
textureOrient = TO_ShipAligned	--TO_Random
textures = 
    { 
        { "Kinetic_Large/Kinetic.tga", 15, }, 
        { "Kinetic_Large/Kinetic01.tga", 30, }, 
				{"Hgn_Torpedo/Torpedo_01.dds", 25},
				{"Hgn_Torpedo/Torpedo_02.dds", 25},
				{"bullet/bullet_pock_01.dds", 25},
				{"bullet/bullet_pock_02.dds", 25},
				{"bullet/bullet_pock_03.dds", 25},
				{"bullet/bullet_pock_04.dds", 25},
				{"bullet/bullet_pock_05.dds", 25},
				{"bullet/bullet_scrape_02.dds", 25},
				{"bullet/bullet_scrape_03.dds", 25},
				{"bullet/bullet_scrape_04.dds", 25},
    }
heavyDamageTextures = 
    { 
        { "Bullet/Explosion.dds", 50, }, 
    }
fxProbability = 0.75
fxs = 
    { 
        { "dmg_battlescar_explosion_combo", 1, TT_HeavyDamage, }, 
    }
