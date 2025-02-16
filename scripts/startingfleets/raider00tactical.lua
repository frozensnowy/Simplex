-- LuaDC version 0.9.19
-- 5/23/2004 7:23:48 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
-- added temp controllers until kpr fleet is bigger
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        {			
        {		
            type = "rad_carrier_black", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "rad_carrier_ion_keeper",
	     		   },
			}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 2, },		
        {		
            type = "rad_resourcecontroller", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },						
        { 
            type = "rad_resourcecollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 10, }, 								

        }, 	
    Research = {}, }
