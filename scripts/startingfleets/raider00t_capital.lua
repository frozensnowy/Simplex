T_battlecruiser = {}
T_battlecruiser[1] = { 
            type = "rad_helios", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[2] = { 
            type = "rad_merc_battlecruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[3] = { 
            type = "rad_cruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[4] = { 
            type = "rad_cruiser_queen", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[5] = { 
            type = "rad_vanaarjet", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[6] = { 
            type = "rad_qwaarjetii", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[7] = { 
            type = "rad_armsdealer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[8] = { 
            type = "rad_scud", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiserNum = 8
subs_randomturret1 = {"rad_rd1_1", "rad_rd2_1", "rad_rd3_1", "rad_rd4_1"}
subs_randomturret2 = {"rad_rd1_2", "rad_rd2_2", "rad_rd3_2", "rad_rd4_2"}
subs_randomturret3 = {"rad_rd1_3", "rad_rd2_3", "rad_rd3_3", "rad_rd4_3"}
subs_randomturret4 = {"rad_rd1_4", "rad_rd2_4", "rad_rd3_4", "rad_rd4_4"}
subs_randomturret5 = {"rad_rd1_5", "rad_rd2_5", "rad_rd3_5", "rad_rd4_5"}
subs_randomturret6 = {"rad_rd1_6", "rad_rd2_6", "rad_rd3_6", "rad_rd4_6"}
subs_d1 = {"rad_destroyer_ion", "rad_destroyer_laser", "rad_destroyer_plasma", "rad_destroyer_missile", "rad_destroyer_cloak"}
T_destroyer = {}
T_destroyer[1] = { 
            type = "rad_merc_cruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[2] = { 
            type = "rad_refurbisheddestroyer", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_randomturret1[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_randomturret2[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_randomturret3[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_randomturret4[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_randomturret5[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_randomturret6[random(4)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[3] = { 
            type = "rad_destroyer", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_d1[random(4)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyerNum = 3
T_frigate = {}
T_frigate[1] = { 
            type = "rad_beamfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "rad_gattlingfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "rad_gunfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "rad_gunfrigate_morgan", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "rad_merc_frigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[6] = { 
            type = "rad_merc_frigateadv", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[7] = { 
            type = "rad_merc_ioncannonfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[8] = { 
            type = "rad_missilefrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 8
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "rad_carrier", 
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