-- LuaDC version 0.9.19
-- 06/08/2004 13.08.53
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "Vgr_MotherShip", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }, 
        { 
            type = "Vgr_ResourceCollector", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 5, }, 
        { 
            type = "Vgr_ResourceController", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_Carrier", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        { 
            type = "Vgr_Shipyard", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },  
        { 
            type = "Vgr_scout", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },   
        { 
            type = "Vgr_bomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_defender", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
         { 
            type = "Vgr_heavyfighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },     
        { 
            type = "Vgr_interceptor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        { 
            type = "Vgr_lancefighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },         
        { 
            type = "Vgr_Bioship", 	--NEW!!-_-
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },                           
        { 
            type = "Vgr_missilebomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        { 
            type = "Vgr_elitefighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        { 
            type = "Vgr_missilecorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_lasercorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_multilancecorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        { 
            type = "Vgr_standvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
                           
        { 
            type = "Vgr_heavymissilefrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
         { 
            type = "Vgr_assaultfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
         { 
            type = "Vgr_empfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
         { 
            type = "Vgr_infiltratorfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
         { 
            type = "Vgr_artilleryfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
         { 
            type = "Vgr_am", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_destroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_battlecruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        { 
            type = "Vgr_alkhalid", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },  
        { 
            type = "Vgr_dreadnaught", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },      
        { 
            type = "Vgr_commandfortress", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },  
        { 
            type = "Vgr_cruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },   
        { 
            type = "Vgr_pulsedestroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },  
				{ 
            type = "Vgr_battlecarrier", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },           
        { 
            type = "Vgr_supportfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },    				
				{ 
            type = "Vgr_lightcruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 		
				{ 
            type = "Vgr_artilleryship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 		
        { 
            type = "Vgr_resourcecontrollerdouble", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 		
        { 
            type = "Vgr_plasmacorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 	
				{ 
            type = "Vgr_striker", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 			
        { 
            type = "Vgr_advassaultfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        { 
            type = "Vgr_supportfrigate_laser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 	
        { 
            type = "Vgr_mortarcorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 	
        { 
            type = "Vgr_commandcorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 		
        { 
            type = "Vgr_minelayercorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 		
				{ 
            type = "Vgr_supportfrigatearmed", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 			
				{ 
            type = "Vgr_longrangeartilleryfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 						
				{ 
            type = "Vgr_agamemnon", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 					
				{ 
            type = "Vgr_ArtilleryBattlecruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
				{ 
            type = "vgr_hammerhead", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
				{ 
            type = "Vgr_commandfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 	
				{ 
            type = "vgr_hyperspace_platform", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 6, }, 
				{ 
            type = "vgr_heavycruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, }, 
        			{ 
            type = "vgr_weaponplatform_gun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_weaponplatform_lance", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_weaponplatform_missile", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "Vgr_mobile_inhibitor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_dreadnaughtB", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_cloakplatform", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_scaver", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_missilebattlecruiser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_minelayerdrone", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_sinner", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_battlecruiser_hero", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_lightcruiser_gun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_superbattleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_battleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_missledreadnaught", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        			{ 
            type = "vgr_worldcannon", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },

--				{ 
--            type = "vgr_tmatship", 
--            subsystems = {}, 
--            shiphold = {}, 
--            name = "", 
--            size = 1, 
--            number = 1, },

        }, 
        
    Research = {}, }