subs_bc1 = {"hgn_rapidturret","hgn_pulsers1bc","hgn_kineticburstturret","hgn_kineticburstturrettriple"}
subs_bc2 = {"hgn_rapidturret1","hgn_pulsers2bc","hgn_kineticburstturret1","hgn_kineticburstturrettriple1"}
subs_bc3 = {"hgn_rapidturret2","hgn_pulsers3bc","hgn_kineticburstturret2","hgn_kineticburstturrettriple2"}
subs_bc4 = {"hgn_battlecruisercannon","HGN_SCC_3xAC_Turret_s1bc","HGN_SCC_6xAC_Turret_s1bc"}
subs_bc5 = {"hgn_battlecruisercannon1","HGN_SCC_3xAC_Turret_s2bc","HGN_SCC_6xAC_Turret_s2bc"}
subs_bc6 = {"hgn_battlecruisercannon2","HGN_SCC_3xAC_Turret_s3bc","HGN_SCC_6xAC_Turret_s3bc"}
subs_bc7 = {"Hgn_BattleCruiserIonBeamTurret","hgn_ion_sentinel1bc"}
subs_bc8 = {"Hgn_BattleCruiserIonBeamTurret1","hgn_ion_sentinel2bc"}
subs_bc9 = {"Hgn_HeavyGuidedPlasmaBombTubes","Hgn_HeavyGuidedPlasmaBombTubes1","Hgn_HeavyGuidedPlasmaBombTubes2"}
subs_bs1 = {"Hgn_BattleCruiserIonBeamTurret","hgn_ion_sentinel1bc","hgn_heavyion_sentinel1bc"}
subs_bs2= {"Hgn_BattleCruiserIonBeamTurret1","hgn_ion_sentinel2bc","hgn_heavyion_sentinel2bc"}
subs_bs3= {"Hgn_HeavyGuidedPlasmaBombTubesBS","Hgn_HeavyGuidedPlasmaBombTubes1BS","Hgn_HeavyGuidedPlasmaBombTubes2BS"}
subs_v1= {"hgn_vcannon","hgn_vhcannonx3","hgn_vhcannonx6"}
subs_v2 = {"hgn_rapidturret3","hgn_pulsers4bc","hgn_kineticburstturret3","hgn_kineticburstturrettriple3"}
subs_ws1= {"hgn_DDI_kineticturret1","hgn_pulsers1","HGN_SCC_6xAC_Turret_s1","HGN_SCC_6xAC_Turret_s1lr","hgn_torpedo_sentinel1","hgn_ion_sentinel1","hgn_nuclear_sentinel1","hgn_nuclear_sentinel1lr","hgn_artillery_2x_sentinel_1"}
subs_ws2 = {"hgn_DDI_kineticturret2","hgn_pulsers2","HGN_SCC_6xAC_Turret_s2","HGN_SCC_6xAC_Turret_s2lr","hgn_torpedo_sentinel2","hgn_ion_sentinel2","hgn_nuclear_sentinel2","hgn_nuclear_sentinel2lr","hgn_artillery_2x_sentinel_2"}
Survivor = {}
Survivor[1] = { 
            type = "hgn_battlecruiser", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_bc1[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc2[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc3[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc4[random(3)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc5[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc6[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc7[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc8[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc9[random(3)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "hgn_battlecruiserNUKE", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_bc1[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc2[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc3[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc4[random(3)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc5[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc6[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc7[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc8[random(2)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc9[random(3)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "hgn_vortex", 
            subsystems = {
	     		  {
	       		   index = 0,
	       		   name = subs_v1[random(3)],
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_v_torpedolauncher",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_v_torpedolauncher1",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_v_torpedolauncher2",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_v_torpedolauncher3",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_miner",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_miner1",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = subs_bc1[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc2[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc3[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_v2[random(4)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[4] = { 
            type = "hgn_battleship", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_bc1[random(4)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc2[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc3[random(4)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc4[random(3)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_bc5[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bc6[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bs1[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bs2[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_bs3[random(3)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = "Hgn_HeavyGuidedPlasmaBombTubesBSRear",
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[5] = { 
            type = "hgn_tanker", 
            subsystems = {
	     		  {
	       		   index = 0,
	       		   name = "ftam",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "ftam1",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "ftam2",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_tanker_turret",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_tanker_turret1",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_tanker_turret2",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_s_nuclear",
	     		  },
	     		  {
	       		   index = 0,
	       		   name = "hgn_s_nuclear1",
	     		  },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[6] = { 
            type = "hgn_combatbase", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_ws1[random(9)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_ws2[random(9)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 6
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }