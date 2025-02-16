T_battlecruiser = {}
T_battlecruiser[1] = { 
            type = "kad_destroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiserNum = 1
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
T_frigate = {}
T_frigate[1] = { 
            type = "kad_frig_ghost", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "kad_multibeam", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "kad_multibeam_new", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "kad_multigun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "kad_podship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 5
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "kad_needleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        }, 
        
    Research = {}, }