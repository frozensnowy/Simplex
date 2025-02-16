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
--            size = 1, },                                                                 
--        },
        { 
            type = "Vgr_Carrier", 
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
            type = "Vgr_Carrier", 
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
            type = "Vgr_Carrier", 
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
            type = "vgr_resourcecollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 6, },     				
        },  
        
    Research = {

    [1] = {
      name = "ShipyardTech",
      progress = 1,
    },

}, }
