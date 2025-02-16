-- LuaDC version 0.9.19
-- 5/23/2004 7:23:48 PM
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        {	
		-- not sure this is better but worth testing.
        { 
            type = "kad_needleship", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "kad_needle_progenarmor",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "kad_needle_prayerpod",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "kad_needle_figurehead",
	     		   },
			}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },				
        { 
            type = "kad_ressourcecollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 10, }, 		
        { 
            type = "kad_podship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "kad_destroyer_real", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "kad_destroyer_superpod",
	     		   },
			}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
			
        }, 
    Research = {}, }
