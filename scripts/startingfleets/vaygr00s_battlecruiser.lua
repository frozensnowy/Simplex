subs_mbc1 = {"vgr_Mbc_M", "vgr_Mbc_C", "vgr_Mbc_D"}
subs_mbc2 = {"vgr_Mbc_F", "vgr_Mbc_F1", "vgr_Mbc_F2", "Vgr_HeavyFusionMissileLauncherMBC"}
subs_tank1 = {"vgr_ft2_turret_tank1","vgr_qje_quadflechette_tank1","vgr_dt3_turret_tank1","vgr_railgun_turret_tank1","vgr_qje_lithiumion_tank1","vgr_ion_tank1","pir_fasttrackingturret_tank1","vgr_heavycruiserkineticturret_tank1","vgr_mlrs_tank1","vgr_ciws_tank1"}
subs_tank2 = {"vgr_ft2_turret_tank2","vgr_qje_quadflechette_tank2","vgr_dt3_turret_tank2","vgr_railgun_turret_tank2","vgr_qje_lithiumion_tank2","vgr_ion_tank2","pir_fasttrackingturret_tank2","vgr_heavycruiserkineticturret_tank2","vgr_mlrs_tank2","vgr_ciws_tank2"}
subs_tank3 = {"vgr_ft2_turret_tank3","vgr_qje_quadflechette_tank3","vgr_dt3_turret_tank3","vgr_railgun_turret_tank3","vgr_qje_lithiumion_tank3","vgr_ion_tank3","pir_fasttrackingturret_tank3","vgr_heavycruiserkineticturret_tank3","vgr_mlrs_tank3","vgr_ciws_tank3"}
subs_tank4 = {"vgr_ft2_turret_tank4","vgr_qje_quadflechette_tank4","vgr_dt3_turret_tank4","vgr_railgun_turret_tank4","vgr_qje_lithiumion_tank4","vgr_ion_tank4","pir_fasttrackingturret_tank4","vgr_heavycruiserkineticturret_tank4","vgr_mlrs_tank4","vgr_ciws_tank4"}
subs_tank5 = {"vgr_ft2_turret_tank5","vgr_qje_quadflechette_tank5","vgr_dt3_turret_tank5","vgr_railgun_turret_tank5","vgr_qje_lithiumion_tank5","vgr_ion_tank5","pir_fasttrackingturret_tank5","vgr_heavycruiserkineticturret_tank5","vgr_mlrs_tank5","vgr_ciws_tank5"}
subs_tank6 = {"vgr_ft2_turret_tank6","vgr_qje_quadflechette_tank6","vgr_dt3_turret_tank6","vgr_railgun_turret_tank6","vgr_qje_lithiumion_tank6","vgr_ion_tank6","pir_fasttrackingturret_tank6","vgr_heavycruiserkineticturret_tank6","vgr_mlrs_tank6","vgr_ciws_tank6"}
subs_tank7 = {"vgr_Mbc_M1","vgr_Mbc_C1"}
subs_tank8 = {"vgr_Mbc_M2","vgr_Mbc_C2"}
subs_tank9 = {"vgr_Mbc_M3","vgr_Mbc_C3"}
subs_tank10 = {"vgr_Mbc_M4","vgr_Mbc_C4"}
Survivor = {}
Survivor[1] = { 
            type = "vgr_battlecruiser", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "Vgr_HeavyCannonTurrets",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "missile_boxbc",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "missile_box1bc",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "Vgr_dt3_turret_light",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "vgr_battlecruiser_hero", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "vgr_missilebattlecruiser", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_mbc1[random(3)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_mbc2[random(4)],
	     		   },
}, 
						shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[4] = { 
            type = "vgr_sinner", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_tank1[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank2[random(10)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_tank3[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank4[random(10)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_tank5[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank6[random(10)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_tank7[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_tank8[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_tank9[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_tank10[random(2)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[5] = { 
            type = "vgr_heavycruiser", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = "vgr_heavycruiser_plasma",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_railgun_turret",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_railgun_turret1",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_heavyfusionmissilelauncherbcsmall",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_heavyfusionmissilelauncherbcsmall1",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_heavycruiserkineticturret",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[6] = { 
            type = "vgr_dreadnaught", 
            subsystems = {
	     		   {
	       		   index = 0,
	       		   name = subs_tank3[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank4[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank6[random(10)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[7] = { 
            type = "vgr_dreadnaughtB", 
            subsystems = {
	     		   {
	       		   index = 0,
	       		   name = subs_tank3[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank4[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_heavyfusionmissilelauncherbcsmall",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_heavyfusionmissilelauncherbcsmall1",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[8] = { 
            type = "vgr_alkhalid", 
            subsystems = {
	     		   {
	       		   index = 0,
	       		   name = subs_tank1[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank2[random(10)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_tank6[random(10)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = "vgr_qje_lithiumion_port",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_qje_lithiumion_stbd",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_qje_lithiumion_stbd1",
	     		   },
	     		   {
	       		   index = 0,
	       		   name = "vgr_qje_lithiumion_port1",
	     		   },
	     		   {
	       		   index = 0,
	       		   name = "vgr_qje_dualflechette_port",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_qje_dualflechette_stbd",
	     		   },
	        	{
	       		   index = 0,
	       		   name = "vgr_qje_dualflechette_stbd1",
	     		   },
	     		   {
	       		   index = 0,
	       		   name = "vgr_qje_dualflechette_port1",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[9] = { 
            type = "Vgr_ArtilleryBattlecruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[10] = { 
            type = "vgr_superbattleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[11] = { 
            type = "vgr_battleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[12] = { 
            type = "vgr_missledreadnaught", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 12
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }