subs_templar1 = {"kad_destroyer_sensorpod", "kad_destroyer_inquisitionpod", "kad_destroyer_largepod", "kad_destroyer_multipod", "kad_destroyer_demopod", "kad_destroyer_nebulapod", "kad_destroyer_ionpod", "kad_destroyer_gunpod", "kad_destroyer_superpod"}
T_destroyer = {}
T_destroyer[1] = { 
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
T_destroyer[2] = { 
            type = "kad_custodian", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyerNum = 2
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        }, 
        
    Research = {}, }