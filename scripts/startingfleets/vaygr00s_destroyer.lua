subs_destroyer5 = {"vgr_destroyer_gun5", "vgr_ft2_turret_tank5","vgr_destroyer_quadflechette5","vgr_destroyer_dt3_turret5","vgr_railgun_turret_tank5","vgr_qje_lithiumion_tank5","vgr_destroyer_ion5","vgr_destroyer_fasttrackingturret5","vgr_destroyer_heavycruiserkineticturret5","vgr_destroyer_mlrs5","vgr_destroyer_ciws5"}
subs_destroyer6 = {"vgr_destroyer_gun6", "vgr_ft2_turret_tank6","vgr_destroyer_quadflechette6","vgr_destroyer_dt3_turret6","vgr_railgun_turret_tank6","vgr_qje_lithiumion_tank6","vgr_destroyer_ion6","vgr_destroyer_fasttrackingturret6","vgr_destroyer_heavycruiserkineticturret6","vgr_destroyer_mlrs6","vgr_destroyer_ciws6"}
subs_artillerycruiser = {"Vgr_cr_m", "Vgr_cr_p", "Vgr_cr_l"}
Survivor = {}
Survivor[1] = { 
            type = "vgr_destroyer", 
            subsystems = {
            	{
	       		   index = 0,
	       		   name = subs_destroyer5[random(11)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_destroyer6[random(11)],
	     		   },
	     		   }, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "vgr_pulsedestroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "vgr_am", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[4] = { 
            type = "vgr_cruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[5] = { 
            type = "vgr_lightcruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[6] = { 
            type = "vgr_lightcruiser_gun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[7] = { 
            type = "vgr_artilleryship", 
            subsystems = {
	     		   {
	       		   index = 0,
	       		   name = subs_artillerycruiser[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = "vgr_qje_lithiumion_port",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_qje_lithiumion_stbd",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[8] = { 
            type = "vgr_hammerhead", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 8
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }