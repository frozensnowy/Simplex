subs_templar1 = {"kad_destroyer_sensorpod", "kad_destroyer_inquisitionpod", "kad_destroyer_largepod", "kad_destroyer_multipod", "kad_destroyer_demopod", "kad_destroyer_nebulapod", "kad_destroyer_ionpod", "kad_destroyer_gunpod", "kad_destroyer_superpod"}
Survivor = {}
Survivor[1] = { 
            type = "kad_destroyer_real", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_templar1[random(9)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "kad_custodian", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 2
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }