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