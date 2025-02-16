-- LuaDC version 0.9.19
-- 06/08/2004 13.08.53
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
--        { 
--            type = "Vgr_MotherShip", 
--            subsystems = {}, 
--            shiphold = {}, 
--            name = "", 
--           size = 1, }, 
        { 
            type = "Vgr_Carrier", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },

        { 
            type = "Vgr_resourcecollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 6, },  

	{ 
            type = "Vgr_battlecarrier", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "VGR_C_MODULE_HYPERSPACE",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },  
	{ 
            type = "Vgr_battlecruiser", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "Vgr_HeavyCannonTurrets",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "missile_boxbc",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "missile_box1bc",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "Vgr_dt3_turret_light",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
	{ 
            type = "vgr_infiltratorfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 2, }, 
                            
                                            
        },        
        
    Research = {
    {
      name = "ShipyardTech",
      progress = 1,
    },
    {
      name = "ImprovedTorpedoBattlecruiser",
      progress = 1,
    },

}, }
