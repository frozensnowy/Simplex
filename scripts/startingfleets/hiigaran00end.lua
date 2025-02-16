PersistantData = {
  StrikeGroups = {
  },
  Squadrons = 
        { 
--        { 
--            type = "Hgn_MotherShip", 
--            subsystems = {}, 
--            shiphold = {}, 
--            name = "", 
--            size = 1, },                                                                   
--        },    

        { 
            type = "Hgn_carrier",
            subsystems = {
        	{
       		   index = 0,
       		   name = "HGN_C_SENSORS_ADVANCEDARRAY",
     		   },
        	{
       		   index = 0,
       		   name = "HGN_C_MODULE_HYPERSPACE",
     		   },
        	{
       		   index = 0,
       		   name = "HGN_C_PRODUCTION_FIGHTER",
     		   },
        	{
       		   index = 0,
       		   name = "HGN_C_PRODUCTION_CORVETTE",
     		   },
        	{
       		   index = 0,
       		   name = "HGN_C_PRODUCTION_FRIGATE",
     		   },
					}, 
            shiphold = {
			        {
			          index = 0,
			          type = "Hgn_Scout",
			          hotkey = 67108864,
			          teamColourHandle = 0,
			          size = 1,
			          tactic = 2,
			          number = 6,
			        },
			        {
			          index = 0,
			          type = "Hgn_Defender",
			          hotkey = 67108864,
			          teamColourHandle = 0,
			          size = 1,
			          tactic = 2,
			          number = 6,
			        },
			        {
			          index = 0,
			          type = "hgn_ecmprobe",
			          hotkey = 67108864,
			          teamColourHandle = 0,
			          size = 1,
			          tactic = 2,
			          number = 3,
			        },
			        {
			          index = 0,
			          type = "Hgn_ProximitySensor",
			          hotkey = 67108864,
			          teamColourHandle = 0,
			          size = 1,
			          tactic = 2,
			          number = 3,
			        },
			        {
			          index = 0,
			          type = "Hgn_minelayercorvette",
			          hotkey = 67108864,
			          teamColourHandle = 0,
			          size = 1,
			          tactic = 2,
			          number = 3,
			        },
            }, 
            name = "", 
            size = 1, 
            number = 1, }, 

    {
      type = "Hgn_crewstation",
      subsystems = {
      },
      shiphold = {
      },
      name = "",
      size = 1,     -- only 1 in each squad
      number = 1,
    },
    {
      type = "Hgn_researchstation",
      subsystems = {
      },
      shiphold = {
      },
      name = "",
      size = 1,     -- only 1 in each squad
      number = 1,
    },
    { 
            type = "Hgn_Power", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },      
         { 
            type = "hgn_resourcecollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 6, },     	


			
        },      

    
Research = {

		{
			name = "ScoutPingAbility",
			progress = 1,
		},
		{
			name = "DefenderPingAbility",
			progress = 1,
		},
		{
			name = "SensorsUpgrade1",
			progress = 1,
		},
		{
			name = "SensorsUpgrade2",
			progress = 1,
		},
		{
			name = "SensorsUpgrade3",
			progress = 1,
		},
  },
}
