wreck_list = {shipname = {}, spawntime = {}}	--defined in sobgroupfunctions.lua
wreck_suffix = "HULK"
BuildLimit_list = {shipname = {}, limit = {}, race = {}}

ship_races = {"hgn", "vgr", "kad", "rad", "kpr", "meg"}
ship_list = 
{
	hgn = 
	{
	-- ***************************************************
	-- hgn fighter
	-- ***************************************************
    {
    	name = "hgn_scout",  
    	class = "fighter",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "hgn_interceptor",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_attackbomber",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_defender",  
    	class = "fighter",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "hgn_lbomber",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_railgunfighter",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_hft",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_attackbomberheavy",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_strategicbomber",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_interceptorl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_attackbomberl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_lbomberl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_railgunfighterl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_hftl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_attackbomberheavyl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_strategicbomberl",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },

	-- ***************************************************
	-- hgn corvette
	-- ***************************************************
    {
    	name = "hgn_assaultcorvette",  
    	class = "corvette",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "hgn_pulsarcorvette",  
    	class = "corvette",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "hgn_bombervette",  
    	class = "corvette",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "hgn_torpedocorvette",  
    	class = "corvette",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "hgn_minelayercorvette",  
    	class = "corvette",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "hgn_multiguncorvette",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "hgn_gunshipcoevette",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "hgn_cth",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "hgn_cthion",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "hgn_assaultcorvettel",  
    	class = "corvette",
      pilot = 10,
      officer = 0,
    },
    {
    	name = "hgn_pulsarcorvettel",  
    	class = "corvette",
      pilot = 10,
      officer = 0,
    },
    {
    	name = "hgn_bombervettel",  
    	class = "corvette",
      pilot = 10,
      officer = 0,
    },
    {
    	name = "hgn_torpedocorvettel",  
    	class = "corvette",
      pilot = 10,
      officer = 0,
    },
    {
    	name = "hgn_multiguncorvettel",  
    	class = "corvette",
      pilot = 15,
      officer = 0,
    },
    {
    	name = "hgn_gunshipcoevettel",  
    	class = "corvette",
      pilot = 15,
      officer = 0,
    },
    {
    	name = "hgn_cthl",  
    	class = "corvette",
      pilot = 15,
      officer = 0,
    },
    {
    	name = "hgn_cthionl",  
    	class = "corvette",
      pilot = 15,
      officer = 0,
    },
    
	-- ***************************************************
	-- hgn frigate
	-- ***************************************************
    {
    	name = "hgn_assaultfrigate",  
    	class = "frigate",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "hgn_torpedofrigate",  
    	class = "frigate",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "hgn_lrms",  
    	class = "frigate",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_marinefrigate",  
    	class = "frigate",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_defensefieldfrigate",  
    	class = "frigate",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "hgn_ioncannonfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "hgn_tulwar",  
    	class = "frigate",
      pilot = 9,
      officer = 0,
    },
    
	-- ***************************************************
	-- hgn capital
	-- ***************************************************
    {
    	name = "hgn_mothership",  
    	class = "capital",
      pilot = 50,
      officer = 5,
      WreckSpawnTime = 14,
      BuildLimit = 1,
    },
    {
    	name = "hgn_carrier",  
    	class = "capital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 8,
    },
    {
    	name = "hgn_battlecarrier",  
    	class = "capital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 8,
    },
    {
    	name = "hgn_lightcarrier",  
    	class = "capital",
      pilot = 10,
      officer = 1,
      WreckSpawnTime = 8,
    },
    {
    	name = "hgn_researchstation",  
    	class = "capital",
      pilot = 10,
      officer = 1,
      WreckSpawnTime = 8,
      BuildLimit = 1,
    },
    {
    	name = "hgn_combatbase",  
    	class = "capital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 8,
      BuildLimit = 1,
    },
    {
    	name = "hgn_power",  
    	class = "capital",
      pilot = 10,
      officer = 1,
      WreckSpawnTime = 8,
      BuildLimit = 1,
    },
    {
    	name = "hgn_crewstation",  
    	class = "capital",
      pilot = 0,
      officer = 0,
      WreckSpawnTime = 8,
      BuildLimit = 1,
    },
    {
    	name = "hgn_hyperspacestation",  
    	class = "capital",
      pilot = 10,
      officer = 1,
      WreckSpawnTime = 10,
    },
    {
    	name = "hgn_shipyard",  
    	class = "capital",
      pilot = 40,
      officer = 3,
      WreckSpawnTime = 16,
    },
    {
    	name = "hgn_battleshipyard",  
    	class = "capital",
      pilot = 60,
      officer = 6,
      WreckSpawnTime = 16,
    },
    {
    	name = "hgn_shipyard_g",  
    	class = "capital",
      pilot = 40,
      officer = 3,
      WreckSpawnTime = 16,
    },
    {
    	name = "hgn_commandfortress",  
    	class = "capital",
      pilot = 60,
      officer = 6,
      WreckSpawnTime = 24,
    },
    {
    	name = "hgn_battlestation",  
    	class = "capital",
      pilot = 0,
      officer = 0,
      WreckSpawnTime = 32,
    },
    {
    	name = "hgn_ark",  
    	class = "capital",
      pilot = 60,
      officer = 6,
      WreckSpawnTime = 24,
    },
    
	-- ***************************************************
	-- hgn armed capital
	-- ***************************************************
    {
    	name = "hgn_destroyer",  
    	class = "armedcapital",
      pilot = 15,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "hgn_sweeperdestroyer",  
    	class = "armedcapital",
      pilot = 15,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "hgn_missiledestroyer",  
    	class = "armedcapital",
      pilot = 18,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "hgn_iondestroyer",  
    	class = "armedcapital",
      pilot = 18,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "hgn_advdestroyer",  
    	class = "armedcapital",
      pilot = 21,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "hgn_artillerydestroyer",  
    	class = "armedcapital",
      pilot = 21,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "hgn_cruisera",  
    	class = "armedcapital",
      pilot = 23,
      officer = 2,
      WreckSpawnTime = 7,
    },
    {
    	name = "hgn_cruiserb",  
    	class = "armedcapital",
      pilot = 23,
      officer = 2,
      WreckSpawnTime = 7,
    },
    {
    	name = "hgn_minivortex",  
    	class = "armedcapital",
      pilot = 10,
      officer = 3,
    },
    {
    	name = "hgn_juggernaught",  
    	class = "armedcapital",
      pilot = 10,
      officer = 1,
      WreckSpawnTime = 5,
    },
    {
    	name = "hgn_battlecruiser",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "hgn_battlecruiserNUKE",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "hgn_vortex",  
    	class = "armedcapital",
      pilot = 35,
      officer = 4,
      WreckSpawnTime = 12,
    },
    {
    	name = "hgn_battleship",  
    	class = "armedcapital",
      pilot = 45,
      officer = 5,
      WreckSpawnTime = 12,
    },
    {
    	name = "hgn_tanker",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 12,
    },
    
	-- ***************************************************
	-- hgn platform
	-- ***************************************************
    {
    	name = "hgn_gunturret",  
    	class = "platform",
      pilot = 1,
      officer = 0,
    },
    {
    	name = "hgn_pulsarturret",  
    	class = "platform",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "hgn_ionturret",  
    	class = "platform",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "hgn_missileturret",  
    	class = "platform",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "hgn_sentinel",  
    	class = "platform",
      pilot = 20,
      officer = 1,
      WreckSpawnTime = 3.9,
    },
    {
    	name = "hgn_ionsentinel",  
    	class = "platform",
      pilot = 20,
      officer = 1,
      WreckSpawnTime = 3.9,
    },
    {
    	name = "hgn_artillerysentinel",  
    	class = "platform",
      pilot = 20,
      officer = 1,
      WreckSpawnTime = 3.9,
    },
    {
    	name = "hgn_rts",  
    	class = "platform",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_defensefieldturret",  
    	class = "platform",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "hgn_massiveturret",  
    	class = "platform",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_defenderdrone",  
    	class = "platform",
      pilot = 0,
      officer = 0,
    },

	-- ***************************************************
	-- hgn utility
	-- ***************************************************
    {
    	name = "hgn_resourcecollector",  
    	class = "utility",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "hgn_resourcecontroller",  
    	class = "utility",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "hgn_container",  
    	class = "utility",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "hgn_scaver",  
    	class = "utility",
      pilot = 15,
      officer = 1,
      WreckSpawnTime = 8,
    },
    {
    	name = "hgn_probe",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_proximitysensor",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_ecmprobe",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_hscore",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_evacuationcell",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_patcher",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_drone",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_transportcell",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_minecontainer",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },


	-- ***************************************************
	-- hgn weapon
	-- ***************************************************
    {
    	name = "hgn_nuclearbomb",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_viper",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_viper_short",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_viper_short1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_viper_ws",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_viper_ws1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_tangomine_ws",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_tangomine_ws1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_minermissile",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_minermissile1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_nucleartube1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_nucleartube2",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_nucleartube3",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_torpedotube1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_torpedotube2",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_torpedotube3",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "hgn_tangomine",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
	},

	vgr = 
	{
	-- ***************************************************
	-- vgr fighter
	-- ***************************************************
    {
    	name = "vgr_scout",  
    	class = "fighter",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "vgr_interceptor",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "vgr_bomber",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "vgr_defender",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "vgr_lancefighter",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "vgr_heavyfighter",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "vgr_missilebomber",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "vgr_elitefighter",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
    },
    {
    	name = "vgr_bioship",  
    	class = "fighter",
      pilot = 0,
      officer = 0,
    },

	-- ***************************************************
	-- vgr corvette
	-- ***************************************************
    {
    	name = "vgr_missilecorvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_lasercorvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_plasmacorvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_striker",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "vgr_multilancecorvette",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "vgr_mortarcorvette",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "vgr_minelayercorvette",  
    	class = "corvette",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "vgr_commandcorvette",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "vgr_standvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    
	-- ***************************************************
	-- vgr frigate
	-- ***************************************************
    {
    	name = "vgr_heavymissilefrigate",  
    	class = "frigate",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "vgr_assaultfrigate",  
    	class = "frigate",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "vgr_advassaultfrigate",  
    	class = "frigate",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "vgr_infiltratorfrigate",  
    	class = "frigate",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "vgr_supportfrigatearmed",  
    	class = "frigate",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "vgr_supportfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_supportfrigate_laser",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_artilleryfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_longrangeartilleryfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_commandfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_empfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    
	-- ***************************************************
	-- vgr capital
	-- ***************************************************
    {
    	name = "vgr_mothership",  
    	class = "capital",
      pilot = 50,
      officer = 5,
      WreckSpawnTime = 14,
      BuildLimit = 1,
    },
    {
    	name = "vgr_carrier",  
    	class = "capital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 8,
    },
    {
    	name = "vgr_battlecarrier",  
    	class = "capital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 8,
    },
    {
    	name = "vgr_shipyard",  
    	class = "capital",
      pilot = 40,
      officer = 3,
      WreckSpawnTime = 16,
    },
    {
    	name = "vgr_commandfortress",  
    	class = "capital",
      pilot = 50,
      officer = 6,
      WreckSpawnTime = 24,
    },
    
	-- ***************************************************
	-- vgr armed capital
	-- ***************************************************
    {
    	name = "vgr_destroyer",  
    	class = "armedcapital",
      pilot = 15,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "vgr_pulsedestroyer",  
    	class = "armedcapital",
      pilot = 15,
      officer = 1,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "vgr_am",  
    	class = "armedcapital",
      pilot = 12,
      officer = 0,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "vgr_cruiser",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "vgr_lightcruiser",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 5.9,	--4
    },
    {
    	name = "vgr_lightcruiser_gun",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 5.9,	--4
    },
    {
    	name = "vgr_artilleryship",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 5.9,	--4
    },
    {
    	name = "vgr_battlecruiser",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_battlecruiser_hero",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_missilebattlecruiser",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_sinner",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 8,
    },
    {
    	name = "vgr_heavycruiser",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_dreadnaught",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_dreadnaughtB",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_hammerhead",  
    	class = "armedcapital",
      pilot = 10,
      officer = 1,
    },
    {
    	name = "vgr_alkhalid",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_battleship",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "vgr_missledreadnaught",  
    	class = "capital",
      pilot = 40,
      officer = 3,
      WreckSpawnTime = 16,
    },
    {
    	name = "vgr_superbattleship",  
    	class = "armedcapital",
      pilot = 50,
      officer = 6,
      WreckSpawnTime = 24,
    },
    {
    	name = "vgr_artillerybattlecruiser",  
    	class = "armedcapital",
      pilot = 0,
      officer = 0,
    },
    
	-- ***************************************************
	-- vgr platform
	-- ***************************************************
    {
    	name = "vgr_weaponplatform_gun",  
    	class = "platform",
      pilot = 1,
      officer = 0,
    },
    {
    	name = "vgr_weaponplatform_lance",  
    	class = "platform",
      pilot = 1,
      officer = 0,
    },
    {
    	name = "vgr_weaponplatform_missile",  
    	class = "platform",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "vgr_mobile_inhibitor",  
    	class = "platform",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "vgr_cloakplatform",  
    	class = "platform",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "vgr_hyperspace_platform",  
    	class = "platform",
      pilot = 2,
      officer = 0,
    },

	-- ***************************************************
	-- vgr utility
	-- ***************************************************
    {
    	name = "vgr_resourcecollector",  
    	class = "utility",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "vgr_resourcecontroller",  
    	class = "utility",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "vgr_resourcecontrollerdouble",  
    	class = "utility",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "vgr_patcher",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_scaver",  
    	class = "utility",
      pilot = 15,
      officer = 1,
      WreckSpawnTime = 8,
    },
    {
    	name = "vgr_probe",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_probe_prox",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_probe_ecm",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_probe_smallhsbeacon",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_minelayerdrone",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_container",  
    	class = "utility",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "vgr_minecontainer",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },


	-- ***************************************************
	-- vgr weapon
	-- ***************************************************
    {
    	name = "Vgr_Cruse",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "Vgr_Cruse1",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "Vgr_Boa",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_minermissile",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "vgr_JDAM",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
	},
	
	kad = 
	{
	-- ***************************************************
	-- kad fighter
	-- ***************************************************
    {
    	name = "kad_advancedswarmer",  
    	class = "fighter",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_advancedswarmer_old",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "kad_heavyswarmer_new",  
    	class = "fighter",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "kad_pulsarswarmer",  
    	class = "fighter",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "kad_swarmer_blood",  
    	class = "fighter",
      pilot = 25,
      officer = 0,
    },
    {
    	name = "kad_swarmer_crusader",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "kad_swarmer_ghost",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "kad_swarmer_hybrid",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "kad_swarmer_new",  
    	class = "fighter",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "kad_swarmer_zealot",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },

	-- ***************************************************
	-- kad corvette
	-- ***************************************************
    {
    	name = "kad_gunpod",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_ionpod",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_missilepod",  
    	class = "corvette",
      pilot = 10,
      officer = 0,
    },
    {
    	name = "kad_pod_ghost",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_prayerpod",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "kad_sensorpod",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
    },
    
	-- ***************************************************
	-- kad frigate
	-- ***************************************************
    {
    	name = "kad_frig_ghost",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_multibeam",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_multibeam_new",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_multigun",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "kad_podship",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    
	-- ***************************************************
	-- kad capital
	-- ***************************************************
    {
    	name = "kad_needleship",  
    	class = "capital",
      pilot = 50,
      officer = 6,
      WreckSpawnTime = 14,
    },
    
	-- ***************************************************
	-- kad armed capital
	-- ***************************************************
    {
    	name = "kad_destroyer",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 14,
    },
    {
    	name = "kad_destroyer_real",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 14,
    },
    {
    	name = "kad_custodian",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      WreckSpawnTime = 14,
    },
    
	-- ***************************************************
	-- kad platform
	-- ***************************************************
    {
    	name = "kad_snail",  
    	class = "platform",
      pilot = 4,
      officer = 0,
    },

	-- ***************************************************
	-- kad utility
	-- ***************************************************
    {
    	name = "kad_ressourcecollector",  
    	class = "utility",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "kad_nebuladrone",  
    	class = "utility",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "kad_container",  
    	class = "utility",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "kad_minecontainer",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },
    
	-- ***************************************************
	-- kad weapon
	-- ***************************************************
    {
    	name = "kad_minermissile",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    {
    	name = "kad_jihadi",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
    },
    
	},

	rad = 
	{
	-- ***************************************************
	-- rad fighter
	-- ***************************************************
    {
    	name = "rad_merc_scout",  
    	class = "fighter",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "rad_merc_fighter",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "rad_merc_interceptor",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "rad_merc_bomber",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
    },
    {
    	name = "rad_bomber",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "rad_elitefighter",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "rad_fencer",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "rad_interceptor",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },
    {
    	name = "rad_interceptor_black",  
    	class = "fighter",
      pilot = 6,
      officer = 0,
    },

	-- ***************************************************
	-- rad corvette
	-- ***************************************************
    {
    	name = "rad_merc_corvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_scoutcorvette",  
    	class = "corvette",
      pilot = 9,
      officer = 0,
    },
    {
    	name = "rad_guncorvette",  
    	class = "corvette",
      pilot = 3,
      officer = 0,
    },
    {
    	name = "rad_empcorvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_jackal",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_missilecorvette",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
    },
    
	-- ***************************************************
	-- rad frigate
	-- ***************************************************
    {
    	name = "rad_beamfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_gattlingfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_gunfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_gunfrigate_morgan",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_merc_frigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_merc_frigateadv",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_merc_ioncannonfrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_missilefrigate",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
    },
    
	-- ***************************************************
	-- rad capital
	-- ***************************************************
    {
    	name = "rad_mothership",  
    	class = "capital",
      pilot = 50,
      officer = 5,
      WreckSpawnTime = 14,
      BuildLimit = 1,
    },
    {
    	name = "rad_carrier",  
    	class = "capital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_carrier_black",  
    	class = "capital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_scaffolda",  
    	class = "capital",
      pilot = 30,
      officer = 2,
    },
    {
    	name = "rad_scaffoldB",  
    	class = "capital",
      pilot = 30,
      officer = 2,
    },
    {
    	name = "rad_blackmarket",  
    	class = "capital",
      pilot = 60,
      officer = 6,
      WreckSpawnTime = 32,
    },
    
	-- ***************************************************
	-- rad armed capital
	-- ***************************************************
    {
    	name = "rad_merc_cruiser",  
    	class = "armedcapital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 5.9,	--12
    },
    {
    	name = "rad_refurbisheddestroyer",  
    	class = "armedcapital",
      pilot = 30,
      officer = 2,
      WreckSpawnTime = 5.9,	--3.9
    },
    {
    	name = "rad_helios",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_merc_battlecruiser",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_cruiser",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_cruiser_queen",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_cruiserscaffolda",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
    },
    {
    	name = "rad_cruiser_queenscaffolda",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
    },
    {
    	name = "rad_vanaarjet",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_qwaarjetii",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_armsdealer",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_scud",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
      WreckSpawnTime = 12,
    },
    {
    	name = "rad_scudscaffolda",  
    	class = "armedcapital",
      pilot = 30,
      officer = 3,
    },
    {
    	name = "rad_destroyer",  
    	class = "armedcapital",
      pilot = 10,
      officer = 1,
      WreckSpawnTime = 5.9,	--12
    },
    {
    	name = "rad_destroyerscaffolda",  
    	class = "armedcapital",
      pilot = 10,
      officer = 1,
    },
    
	-- ***************************************************
	-- rad platform
	-- ***************************************************
    {
    	name = "rad_explotrap",  
    	class = "platform",
      pilot = 1,
      officer = 0,
    },
    {
    	name = "rad_gravwel",  
    	class = "platform",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "rad_hsbouey",  
    	class = "platform",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "rad_guntrap",  
    	class = "platform",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "rad_powerstation",  
    	class = "platform",
      pilot = 0,
      officer = 0,
      WreckSpawnTime = 8,
      BuildLimit = 1,
    },

	-- ***************************************************
	-- rad utility
	-- ***************************************************
    {
    	name = "rad_resourcecollector",  
    	class = "utility",
      pilot = 2,
      officer = 0,
    },
    {
    	name = "rad_resourcecontroller",  
    	class = "utility",
      pilot = 8,
      officer = 0,
    },
    {
    	name = "rad_container",  
    	class = "utility",
      pilot = 4,
      officer = 0,
    },
    {
    	name = "rad_minecontainer",  
    	class = "utility",
      pilot = 0,
      officer = 0,
    },


	-- ***************************************************
	-- rad weapon: since they are the same with hgn and vgr ones, don't add again
	-- ***************************************************

	},
	
	kpr = 
	{
	-- ***************************************************
	-- kpr fighter
	-- ***************************************************
    {
    	name = "Kpr_AttackDroid",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 36,
    },
    {
    	name = "kpr_interceptor_old",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 24,
    },

	-- ***************************************************
	-- kpr corvette
	-- ***************************************************
    {
    	name = "kpr_mover",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
      maintenance = 50,
    },
    {
    	name = "kpr_attackdroid_combo",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
      maintenance = 72,
    },
    {
    	name = "kpr_interceptor_combo",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
      maintenance = 48,
    },
    {
    	name = "kpr_attackdroid_agitator",  
    	class = "corvette",
      pilot = 2,
      officer = 0,
      maintenance = 60,
    },
    
	-- ***************************************************
	-- kpr frigate
	-- ***************************************************
    {
    	name = "kpr_deciever",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "kpr_hunter",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 200,
    },
    {
    	name = "kpr_seeker",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 70,
    },
    {
    	name = "kpr_guardian",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 270,
    },
    
	-- ***************************************************
	-- kpr capital
	-- ***************************************************
    {
    	name = "kpr_shipyard_old",  
    	class = "capital",
      pilot = 40,
      officer = 3,
      maintenance = 1500,
      WreckSpawnTime = 16,
    },
    {
    	name = "kpr_carrier",  
    	class = "capital",
      pilot = 30,
      officer = 2,
      maintenance = 1250,
      WreckSpawnTime = 8,
    },
    
	-- ***************************************************
	-- kpr armed capital
	-- ***************************************************
    {
    	name = "kpr_dreadnaught",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      maintenance = 7500,
      WreckSpawnTime = 12,
    },
    {
    	name = "kpr_reaver",  
    	class = "armedcapital",
      pilot = 20,
      officer = 2,
      maintenance = 3000,
      WreckSpawnTime = 11.5,
    },
    {
    	name = "kpr_destroyer",  
    	class = "armedcapital",
      pilot = 15,
      officer = 1,
      maintenance = 1000,
      WreckSpawnTime = 4,
    },
    {
    	name = "kpr_hive",  
    	class = "armedcapital",
      pilot = 15,
      officer = 1,
      maintenance = 800,
      WreckSpawnTime = 8,
    },
    {
    	name = "kpr_sajuuk",  
    	class = "armedcapital",
      pilot = 60,
      officer = 6,
      maintenance = 25000,
      WreckSpawnTime = 12,
    },
    
	-- ***************************************************
	-- kpr platform
	-- ***************************************************
    {
    	name = "kpr_sentinel",  
    	class = "platform",
      pilot = 4,
      officer = 0,
      maintenance = 8,
    },
    {
    	name = "kpr_marauder",  
    	class = "platform",
      pilot = 2,
      officer = 0,
      maintenance = 8,
    },
    {
    	name = "kpr_meddler",  
    	class = "platform",
      pilot = 1,
      officer = 0,
      maintenance = 8,
    },
    {
    	name = "kpr_dronestruct",  
    	class = "platform",
      pilot = 10,
      officer = 0,
      maintenance = 100,
    },

	-- ***************************************************
	-- kpr utility
	-- ***************************************************
    {
    	name = "kpr_ressourcecollector_old",  
    	class = "utility",
      pilot = 0,
      officer = 0,
      maintenance = 12,
    },
    {
    	name = "kpr_resourcecollector",  
    	class = "utility",
      pilot = 2,
      officer = 0,
      maintenance = 8,
    },
    {
    	name = "kpr_resourcecontroller",  
    	class = "utility",
      pilot = 8,
      officer = 0,
      maintenance = 20,
    },
    {
    	name = "kpr_probe_old",  
    	class = "utility",
      pilot = 0,
      officer = 0,
      maintenance = 8,
    },
    --{
    --	name = "kpr_container",  
    --	class = "utility",
    --  pilot = 4,
    --  officer = 0,
    --  maintenance = 0,
    --},
    {
    	name = "kpr_minecontainer",  
    	class = "utility",
      pilot = 0,
      officer = 0,
      maintenance = 0,
    },
	-- ***************************************************
	-- kpr weapon
	-- ***************************************************
    {
    	name = "kpr_lightgranule",  
    	class = "weapon",
      pilot = 0,
      officer = 0,
			maintenance = 8,
    },
    
	},
	
	
	meg = 
	{
	-- ***************************************************
	-- meg fighter
	-- ***************************************************
    {
    	name = "meg_mig25",  
    	class = "fighter",
      pilot = 2,
      officer = 0,
      maintenance = 13,
    },
    {
    	name = "meg_mig29",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_su27",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_su27_elite",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
      maintenance = 70,
    },
    {
    	name = "meg_f14",  
    	class = "fighter",
      pilot = 2,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_f15",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_f18",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_f18_elite",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
      maintenance = 70,
    },
    {
    	name = "meg_f16",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_migmfi",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 20,
    },
    {
    	name = "meg_f22",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 30,
    },
    {
    	name = "meg_t50",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 30,
    },
    {
    	name = "meg_f23",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 30,
    },
    {
    	name = "meg_f35",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 20,
    },
    {
    	name = "meg_f117",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 15,
    },
    {
    	name = "meg_su25",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_su34",  
    	class = "fighter",
      pilot = 2,
      officer = 0,
      maintenance = 13,
    },
    {
    	name = "meg_su35",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 11,
    },
    {
    	name = "meg_x47",  
    	class = "fighter",
      pilot = 0,
      officer = 0,
      maintenance = 11,
    },
    {
    	name = "meg_x45",  
    	class = "fighter",
      pilot = 0,
      officer = 0,
      maintenance = 11,
    },
    {
    	name = "meg_su47",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 15,
    },
    {
    	name = "meg_a10",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_av8",  
    	class = "fighter",
      pilot = 1,
      officer = 0,
      maintenance = 10,
    },
    {
    	name = "meg_sr71",  
    	class = "fighter",
      pilot = 2,
      officer = 0,
      maintenance = 30,
    },
    {
    	name = "meg_tu160",  
    	class = "fighter",
      pilot = 4,
      officer = 0,
      maintenance = 80,
    },
    {
    	name = "meg_b1",  
    	class = "fighter",
      pilot = 4,
      officer = 0,
      maintenance = 80,
    },
    {
    	name = "meg_b2",  
    	class = "fighter",
      pilot = 2,
      officer = 0,
      maintenance = 180,
    },
    {
    	name = "meg_b52",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "meg_e767",  
    	class = "fighter",
      pilot = 8,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "meg_kc10",  
    	class = "fighter",
      pilot = 4,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "meg_c5",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
      maintenance = 120,
    },
	-- ***************************************************
	-- meg fighters and corvettes
	-- ***************************************************
    {
    	name = "Unit_G_Interceptor",  
    	class = "fighter",
      pilot = 7,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "Unit_G_Bomber",  
    	class = "corvette",
      pilot = 8,
      officer = 0,
      maintenance = 120,
    },
    {
    	name = "Unit_C_Interceptor",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "hgn_pulsarfighter",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "hgn_shadowbomber",  
    	class = "fighter",
      pilot = 5,
      officer = 0,
      maintenance = 100,
    },
    {
    	name = "Unit_C_Bomber",  
    	class = "corvette",
      pilot = 6,
      officer = 0,
      maintenance = 120,
    },
    {
    	name = "Unit_C_Gunship",  
    	class = "corvette",
      pilot = 10,
      officer = 0,
      maintenance = 120,
    },
	-- ***************************************************
	-- meg frigate
	-- ***************************************************
    {
    	name = "HWAT_FRN_FFAssault",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_FRN_FFCloak",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_FRN_FFIon",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_FRN_FFMine",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_FRN_FFSupport",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_UNH_FFAssault",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_UNH_FFIon",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_VAY_FFAssault",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
    {
    	name = "HWAT_VAY_FFIonArray",  
    	class = "frigate",
      pilot = 8,
      officer = 0,
      maintenance = 150,
    },
	-- ***************************************************
	-- meg armed capital
	-- ***************************************************
    {
    	name = "meg_carrier_huge",  
    	class = "armedcapital",
      pilot = 0,
      officer = 0,
      maintenance = 1000,
    },
    {
    	name = "HWAT_UNH_CAStandard",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      maintenance = 1000,
      WreckSpawnTime = 12,
    },
    {
    	name = "HWAT_VAY_CABattle",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      maintenance = 1000,
      WreckSpawnTime = 12,
    },
    {
    	name = "HWAT_FRN_CAHeavy",  
    	class = "armedcapital",
      pilot = 35,
      officer = 3,
      maintenance = 1000,
      WreckSpawnTime = 12,
    },
	
	
	},
	
}

--for territory mod
HgnAllfrigates = {"hgn_assaultfrigate", "hgn_torpedofrigate", "hgn_lrms", "hgn_marinefrigate", "hgn_defensefieldfrigate", "hgn_ioncannonfrigate", "hgn_tulwar"}
VgrAllfrigates = {"vgr_supportfrigatearmed", "vgr_supportfrigate_laser", "vgr_supportfrigate", "vgr_longrangeartilleryfrigate", "vgr_infiltratorfrigate", "vgr_heavymissilefrigate", "vgr_empfrigate", "vgr_commandfrigate", "vgr_assaultfrigate", "vgr_artilleryfrigate", "vgr_advassaultfrigate"}
KadAllfrigates = {"kad_frig_ghost", "kad_multibeam", "kad_multibeam_new", "kad_multigun", "kad_podship"}
RadAllfrigates = {"rad_beamfrigate", "rad_gattlingfrigate", "rad_gunfrigate", "rad_gunfrigate_morgan", "rad_merc_frigate", "rad_merc_frigateadv", "rad_merc_ioncannonfrigate", "rad_missilefrigate"}
KprAllfrigates = {"kpr_deciever", "kpr_hunter", "kpr_seeker", "kpr_guardian"}

HgnAllDestroyers = {"hgn_battlecarrier", "hgn_destroyer", "hgn_sweeperdestroyer", "hgn_missiledestroyer", "hgn_iondestroyer", "hgn_advdestroyer", "hgn_artillerydestroyer", "hgn_cruisera", "hgn_cruiserb", "hgn_juggernaught", "hgn_minivortex"}
VgrAllDestroyers = {"vgr_battlecarrier", "vgr_destroyer", "vgr_hammerhead", "vgr_pulsedestroyer", "vgr_am", "vgr_cruiser", "vgr_lightcruiser", "vgr_lightcruiser_gun", "vgr_artilleryship"}
KadAllDestroyers = {"kad_needleship", "kad_destroyer", "kad_destroyer_real", "kad_custodian"}
RadAllDestroyers = {"rad_carrier", "rad_carrier_black", "rad_merc_cruiser", "rad_cruiser", "rad_cruiser_queen", "rad_destroyer", "rad_scud", "rad_armsdealer", "rad_helios", "rad_refurbisheddestroyer", "rad_qwaarjetii", "rad_vanaarjet", "rad_merc_battlecruiser"}
KprAllDestroyers = {"kpr_carrier", "kpr_dreadnaught", "kpr_reaver", "kpr_destroyer", "kpr_hive", "kpr_sajuuk"}