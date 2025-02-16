subs_sentinel1 = {"hgn_DDI_kineticturret1","hgn_pulsers1","HGN_SCC_6xAC_Turret_s1","HGN_SCC_6xAC_Turret_s1lr","hgn_torpedo_sentinel1","hgn_ion_sentinel1","hgn_nuclear_sentinel1","hgn_nuclear_sentinel1lr","hgn_artillery_2x_sentinel_1","hgn_railgun1"}
subs_sentinel2 = {"hgn_DDI_kineticturret2","hgn_pulsers2","HGN_SCC_6xAC_Turret_s2","HGN_SCC_6xAC_Turret_s2lr","hgn_torpedo_sentinel2","hgn_ion_sentinel2","hgn_nuclear_sentinel2","hgn_nuclear_sentinel2lr","hgn_artillery_2x_sentinel_2","hgn_railgun2"}
subs_sentinel3 = {"hgn_DDI_kineticturret3","hgn_pulsers3","HGN_SCC_6xAC_Turret_s3","HGN_SCC_6xAC_Turret_s3lr","hgn_torpedo_sentinel3","hgn_ion_sentinel3","hgn_nuclear_sentinel3","hgn_nuclear_sentinel3lr","hgn_artillery_2x_sentinel_3","hgn_railgun3"}
subs_sentinel4 = {"hgn_DDI_kineticturret4","hgn_pulsers4","HGN_SCC_6xAC_Turret_s4","HGN_SCC_6xAC_Turret_s4lr","hgn_torpedo_sentinel4","hgn_ion_sentinel4","hgn_nuclear_sentinel4","hgn_nuclear_sentinel4lr","hgn_artillery_2x_sentinel_4","hgn_railgun4"}
Survivor = {}
Survivor[1] = { 
            type = "hgn_gunturret", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "hgn_pulsarturret", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "hgn_ionturret", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[4] = { 
            type = "hgn_missileturret", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[5] = { 
            type = "hgn_sentinel", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[6] = { 
            type = "hgn_ionsentinel", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[7] = { 
            type = "hgn_artillerysentinel", 
            subsystems = {
	        	{
	       		   index = 0,
	       		   name = subs_sentinel1[random(9)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_sentinel2[random(9)],
	     		   },
	     		   {
	       		   index = 0,
	       		   name = subs_sentinel3[random(9)],
	     		   },
	        	{
	       		   index = 0,
	       		   name = subs_sentinel4[random(9)],
	     		   },
}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[8] = { 
            type = "hgn_rts", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[9] = { 
            type = "hgn_defenderdrone", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 9
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }