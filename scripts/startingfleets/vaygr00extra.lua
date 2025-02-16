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

        { 
            type = "vgr_commandfortress", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "hgn_commandfortress_comunicationfacility",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "hgn_commandfortress_defencefacility",
	     		   },
            }, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },   

        { 
            type = "Vgr_ResourceCollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 9, },                           
                                            
        },        
        
    Research = {

    {
      name = "ShipyardTech",
      progress = 1,
    },

}, }
