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
T_battlecruiser = {}
T_battlecruiser[1] = { 
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
T_battlecruiser[2] = { 
            type = "vgr_battlecruiser_hero", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[3] = { 
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
T_battlecruiser[4] = { 
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
T_battlecruiser[5] = { 
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
T_battlecruiser[6] = { 
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
T_battlecruiser[7] = { 
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
T_battlecruiser[8] = { 
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
T_battlecruiser[9] = { 
            type = "Vgr_ArtilleryBattlecruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[10] = { 
            type = "vgr_superbattleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[11] = { 
            type = "vgr_battleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[12] = { 
            type = "vgr_missledreadnaught", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiserNum = 12
subs_destroyer5 = {"vgr_destroyer_gun5", "vgr_ft2_turret_tank5","vgr_destroyer_quadflechette5","vgr_destroyer_dt3_turret5","vgr_railgun_turret_tank5","vgr_qje_lithiumion_tank5","vgr_destroyer_ion5","vgr_destroyer_fasttrackingturret5","vgr_destroyer_heavycruiserkineticturret5","vgr_destroyer_mlrs5","vgr_destroyer_ciws5"}
subs_destroyer6 = {"vgr_destroyer_gun6", "vgr_ft2_turret_tank6","vgr_destroyer_quadflechette6","vgr_destroyer_dt3_turret6","vgr_railgun_turret_tank6","vgr_qje_lithiumion_tank6","vgr_destroyer_ion6","vgr_destroyer_fasttrackingturret6","vgr_destroyer_heavycruiserkineticturret6","vgr_destroyer_mlrs6","vgr_destroyer_ciws6"}
subs_artillerycruiser = {"Vgr_cr_m", "Vgr_cr_p", "Vgr_cr_l"}
T_destroyer = {}
T_destroyer[1] = { 
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
T_destroyer[2] = { 
            type = "vgr_pulsedestroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[3] = { 
            type = "vgr_am", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[4] = { 
            type = "vgr_cruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[5] = { 
            type = "vgr_lightcruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[6] = { 
            type = "vgr_lightcruiser_gun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[7] = { 
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
T_destroyer[8] = { 
            type = "vgr_hammerhead", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyerNum = 8
T_frigate = {}
T_frigate[1] = { 
            type = "vgr_heavymissilefrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "vgr_assaultfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "vgr_advassaultfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "vgr_infiltratorfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "vgr_supportfrigatearmed", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[6] = { 
            type = "vgr_supportfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[7] = { 
            type = "vgr_supportfrigate_laser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[8] = { 
            type = "vgr_artilleryfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[9] = { 
            type = "vgr_longrangeartilleryfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[10] = { 
            type = "vgr_commandfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[11] = { 
            type = "vgr_empfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 11
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "vgr_carrier", 
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