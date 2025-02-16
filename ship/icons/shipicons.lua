-- LuaDC version 0.9.19
-- 10/06/2004 18.44.27
-- LuaDC by Age2uN
-- on error send source file (compiled lua) and this outputfile to Age2uN@gmx.net
--
local rIconGridStepX = 200
local rIconGridStepY = 64
Default = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
planet_tech1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\agricoltura.tga", 
        textureUV_TL = 
            { -26, -26, }, 
        textureUV_WH = 
            { 540, 256, }, 
        stretchOnDraw = 1, }, } 
planet_tech2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\agricoltura1.tga", 
        textureUV_TL = 
            { -26, -26, }, 
        textureUV_WH = 
            { 540, 256, }, 
        stretchOnDraw = 1, }, }          
planet_tech3 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\industria.tga", 
        textureUV_TL = 
            { -26, -26, }, 
        textureUV_WH = 
            { 540, 256, }, 
        stretchOnDraw = 1, }, }          	
planet_tech4 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\industria1.tga", 
        textureUV_TL = 
            { -26, -26, }, 
        textureUV_WH = 
            { 540, 256, }, 
        stretchOnDraw = 1, }, }          	
planet_tech5 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\industria2.tga", 
        textureUV_TL = 
            { -26, -26, }, 
        textureUV_WH = 
            { 540, 256, }, 
        stretchOnDraw = 1, }, }          	
planet_tech6 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\industria3.tga", 
        textureUV_TL = 
            { -26, -26, }, 
        textureUV_WH = 
            { 540, 256, }, 
        stretchOnDraw = 1, }, }          					
Icon_Subsystem_Resource1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_mine_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Drive = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_drive_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  

Icon_Subsystem_Defensecontrol = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icon_subsystem_defensecontrol.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  	
Icon_Subsystem_FireControl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_firecontrol_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  	
Icon_Subsystem_Build = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_build_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  	
Icon_Subsystem_Repair = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_repair_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, } 
Icon_Subsystem_Hyperspace = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hyperspace_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  	
Icon_Subsystem_HyperspaceInhibitor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hyperspaceinhibitor_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Defenseshield = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_defenseshield_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Defensefieldshield1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_defensefieldshield_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
shield = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\shield_1600.tga", 
        textureUV_TL = 
            { -43, -40, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }  		
shield1 = shield  				
Icon_Subsystem_DetectHyperspace = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\sensorhyperspace.tga", 
        textureUV_TL = 
            { -43, -40, }, 
        textureUV_WH = 
            { 290, 232, }, 
        stretchOnDraw = 1, }, }  		
Icon_Subsystem_DetectCloaked = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\sensorcloak.tga", 
        textureUV_TL = 
            { -43, -40, }, 
        textureUV_WH = 
            { 290, 232, }, 
        stretchOnDraw = 1, }, }  		
Icon_Subsystem_AdvancedArray = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\sensor.tga", 
        textureUV_TL = 
            { -43, -40, }, 
        textureUV_WH = 
            { 290, 232 }, 
        stretchOnDraw = 1, }, }  	
Icon_Subsystem_Resource3 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\supply.tga", 
        textureUV_TL = 
            { -30, -59, }, 
        textureUV_WH = 
            { 290, 234, }, 
        stretchOnDraw = 1, }, }  	
Hgn_power_ms = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\power.tga", 
        textureUV_TL = 
            { -36, -41, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  	
Hgn_power_ms1 = Hgn_power_ms    
Hgn_power_bsy = Hgn_power_ms   
Hgn_power_bsy1 = Hgn_power_ms  
Hgn_power_bsy2 = Hgn_power_ms  
Hgn_power_bsy3 = Hgn_power_ms    
Vgr_power_ms = Hgn_power_ms  
Vgr_power_ms1 = Hgn_power_ms  
Vgr_power_sy = Hgn_power_ms
Vgr_power_sy1 = Hgn_power_ms
Vgr_power_sy2 = Hgn_power_ms
Vgr_power_sy3 = Hgn_power_ms
Vgr_power_sy4 = Hgn_power_ms
Vgr_power_sy5 = Hgn_power_ms
communicationfacility = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\communicationfacility.tga", 
        textureUV_TL = 
            { -30, -34, }, 
        textureUV_WH = 
            { 290, 198, }, 
        stretchOnDraw = 1, }, }  	
Icon_Subsystem_defencefacility = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_defenseshield_1600.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Resource2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\fusion.tga", 
        textureUV_TL = 
            { -46, -39, }, 
        textureUV_WH = 
            { 290, 274, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_CloakGenerator = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\cloak.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Defensefieldshield = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\antiradiation.tga", 
        textureUV_TL = 
            { -36, -29, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Civil = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\civil.tga", 
        textureUV_TL = 
            { -36, -46, }, 
        textureUV_WH = 
            { 290, 252, }, 
        stretchOnDraw = 1, }, }                                                                 
Icon_Subsystem_Pilot = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\pilot.tga", 
        textureUV_TL = 
            { -50, -38, }, 
        textureUV_WH = 
            { 290, 266, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_Officer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\officer.tga", 
        textureUV_TL = 
            { -29, -39, }, 
        textureUV_WH = 
            { 290, 230, }, 
        stretchOnDraw = 1, }, }  		
Hgn_power_m0 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\energy.tga", 
        textureUV_TL = 
            { -64, -34, }, 
        textureUV_WH = 
            { 290, 318, }, 
        stretchOnDraw = 1, }, }  		
Icon_Subsystem_Research = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\research.tga", 
        textureUV_TL = 
            { -36, -35, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  		
        
Research_Vgr = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_research.tga", 
        textureUV_TL = 
            { -36, -35, }, 
        textureUV_WH = 
            { 290, 244, }, 
        stretchOnDraw = 1, }, }  		
        
Icon_Subsystem_ResearchAdvanced = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\research1.tga", 
        textureUV_TL = 
            { -36, -34, }, 
        textureUV_WH = 
            { 290, 242, }, 
        stretchOnDraw = 1, }, }  		
        
Icon_Subsystem_ResearchAdvanced1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\research2.tga", 
        textureUV_TL = 
            { -36, -33, }, 
        textureUV_WH = 
            { 290, 240, }, 
        stretchOnDraw = 1, }, }  		

				
vgr_dreadnaughtB_shield = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\InhibitorDevice.tga", 
        textureUV_TL = 
            { -30, -22, }, 
        textureUV_WH = 
            { 290, 238, }, 
        stretchOnDraw = 1, }, } 	
Hgn_Pwr_Locator = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\hgn_pwr_locator.tga", 
        textureUV_TL = 
            { -30, -22, }, 
        textureUV_WH = 
            { 290, 238, }, 
        stretchOnDraw = 1, }, } 		
hgn_aditional_core = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_addcore.tga", 
        textureUV_TL = 
            { -30, -16, }, 
        textureUV_WH = 
            { 290, 290, }, 
        stretchOnDraw = 1, }, } 					
hgn_aditional_core1 = hgn_aditional_core
ftam2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\ftam2x.tga", 
        textureUV_TL = 
            { -25, -60, }, 
        textureUV_WH = 
            { 269, 266, }, 
        stretchOnDraw = 1, }, }       
vgr_ftam2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_ftam2x.tga", 
        textureUV_TL = 
            { -25, -60, }, 
        textureUV_WH = 
            { 269, 266, }, 
        stretchOnDraw = 1, }, }  
--
artillery2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\artillery2x.tga", 
        textureUV_TL = 
            { -24, -57, }, 
        textureUV_WH = 
            { 290, 216, }, 
        stretchOnDraw = 1, }, }    
--
pulser2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\pulser2x.tga", 
        textureUV_TL = 
            { -27, -42, }, 
        textureUV_WH = 
            { 290, 220, }, 
        stretchOnDraw = 1, }, }  
--
railgun = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\railgun.tga", 
        textureUV_TL = 
            { -27, -42, }, 
        textureUV_WH = 
            { 290, 220, }, 
        stretchOnDraw = 1, }, }  
--
rapidsweeper4x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rapidsweeper4x.tga", 
        textureUV_TL = 
            { -30, -55, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }            
--
suppressor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\suppressor.tga", 
        textureUV_TL = 
            { -27, -50, }, 
        textureUV_WH = 
            { 290, 220, }, 
        stretchOnDraw = 1, }, }   
--
kinetic2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kinetic2x.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
--
kinetic3x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kinetic3x.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }  
--
kinetic2xset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kinetic2xset.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }               
--
heavykinetic3x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\heavykinetic3x.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }  
--
heavykinetic3xset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\heavykinetic3xset.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }          
--
heavykinetic6x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\heavykinetic6x.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }    
--
heavykinetic6xset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\heavykinetic6xset.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }            
--
ion2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\ion2x.tga", 
        textureUV_TL = 
            { -28, -50, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }  
--
heavyion2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\heavyion2x.tga", 
        textureUV_TL = 
            { -27, -49, }, 
        textureUV_WH = 
            { 290, 234, }, 
        stretchOnDraw = 1, }, }  
--
heavyion3x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\heavyion3x.tga", 
        textureUV_TL = 
            { -25, -56, }, 
        textureUV_WH = 
            { 270, 216, }, 
        stretchOnDraw = 1, }, }                                                 
--
torpedo6x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\torpedo6x.tga", 
        textureUV_TL = 
            { -31, -43, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }
--
nuclear1x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\nuclear1x.tga", 
        textureUV_TL = 
            { -31, -43, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }    
--
mine2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\mine2x.tga", 
        textureUV_TL = 
            { -31, -43, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }          
---            
tube2x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\tube2x.tga", 
        textureUV_TL = 
            { -25, -34, }, 
        textureUV_WH = 
            { 290, 274, }, 
        stretchOnDraw = 1, }, }  
--
emp4x = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\emp4x.tga", 
        textureUV_TL = 
            { -27, -52, }, 
        textureUV_WH = 
            { 290, 214, }, 
        stretchOnDraw = 1, }, }                              
vgr_cr_p = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_cr_p.tga", 
        textureUV_TL = 
            { -30, -34, }, 
        textureUV_WH = 
            { 290, 276, }, 
        stretchOnDraw = 1, }, }    
vgr_cr_l = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_cr_l.tga", 
        textureUV_TL = 
            { -24, -55, }, 
        textureUV_WH = 
            { 290, 176, }, 
        stretchOnDraw = 1, }, }    
vgr_cr_m = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_cr_m.tga", 
        textureUV_TL = 
            { -24, -50, }, 
        textureUV_WH = 
            { 290, 206, }, 
        stretchOnDraw = 1, }, }    
vgr_mbc_m = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mbc_m.tga", 
        textureUV_TL = 
            { -18, -48, }, 
        textureUV_WH = 
            { 290, 218, }, 
        stretchOnDraw = 1, }, }
vgr_mbc_m1 = vgr_mbc_m
vgr_mbc_m2 = vgr_mbc_m
vgr_mbc_m3 = vgr_mbc_m
vgr_mbc_m4 = vgr_mbc_m
vgr_mbc_m_titan = vgr_mbc_m
vgr_mbc_c = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mbc_c.tga", 
        textureUV_TL = 
            { -18, -48, }, 
        textureUV_WH = 
            { 290, 218, }, 
        stretchOnDraw = 1, }, }  
vgr_mbc_c1 = vgr_mbc_c
vgr_mbc_c2 = vgr_mbc_c
vgr_mbc_c3 = vgr_mbc_c
vgr_mbc_c4 = vgr_mbc_c
vgr_mbc_d = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mbc_d.tga", 
        textureUV_TL = 
            { -18, -60, }, 
        textureUV_WH = 
            { 290, 218, }, 
        stretchOnDraw = 1, }, }  
vgr_mbc_f = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mbc_f.tga", 
        textureUV_TL = 
            { -24, -8, }, 
        textureUV_WH = 
            { 290, 207, }, 
        stretchOnDraw = 1, }, }  	
vgr_mbc_f1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mbc_f1.tga", 
        textureUV_TL = 
            { -58, -33, }, 
        textureUV_WH = 
            { 320, 293, }, 
        stretchOnDraw = 1, }, }  
vgr_mbc_f2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mbc_f2.tga", 
        textureUV_TL = 
            { -60, -34, }, 
        textureUV_WH = 
            { 320, 286, }, 
        stretchOnDraw = 1, }, }  	
vgr_ft2_turret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_sp.tga", 
        textureUV_TL = 
            { -24, -50, }, 
        textureUV_WH = 
            { 290, 206, }, 
        stretchOnDraw = 1, }, }    		
vgr_ft2_turret1 = vgr_ft2_turret		
vgr_ft2_turret_s = vgr_ft2_turret	
vgr_ft2_turret_tank = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_ArtilleryTurret.tga", 
        textureUV_TL = 
            { -24, -50, }, 
        textureUV_WH = 
            { 290, 206, }, 
        stretchOnDraw = 1, }, }
vgr_ft2_turret_tank1 = vgr_ft2_turret_tank
vgr_ft2_turret_tank2 = vgr_ft2_turret_tank
vgr_ft2_turret_tank3 = vgr_ft2_turret_tank
vgr_ft2_turret_tank4 = vgr_ft2_turret_tank
vgr_ft2_turret_tank5 = vgr_ft2_turret_tank
vgr_ft2_turret_tank6 = vgr_ft2_turret_tank
vgr_rapidgun = vgr_ft2_turret
vgr_rapidgun_titan = vgr_ft2_turret
vgr_destroyer_gun5 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_destroyer_gun.tga", 
        textureUV_TL = 
            { -27, -49, }, 
        textureUV_WH = 
            { 290, 234, }, 
        stretchOnDraw = 1, }, }  
vgr_destroyer_gun6 = vgr_destroyer_gun5
vgr_heavycruiserkineticturret_tank1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_ArtilleryTurretLongrange.tga", 
        textureUV_TL = 
            { -24, -50, }, 
        textureUV_WH = 
            { 290, 206, }, 
        stretchOnDraw = 1, }, }
vgr_heavycruiserkineticturret_tank2 = vgr_heavycruiserkineticturret_tank1
vgr_heavycruiserkineticturret_tank3 = vgr_heavycruiserkineticturret_tank1
vgr_heavycruiserkineticturret_tank4 = vgr_heavycruiserkineticturret_tank1
vgr_heavycruiserkineticturret_tank5 = vgr_heavycruiserkineticturret_tank1
vgr_heavycruiserkineticturret_tank6 = vgr_heavycruiserkineticturret_tank1
vgr_destroyer_heavycruiserkineticturret5 = vgr_heavycruiserkineticturret_tank1
vgr_destroyer_heavycruiserkineticturret6 = vgr_heavycruiserkineticturret_tank1
vgr_heavycruiserkineticturret_titan = vgr_heavycruiserkineticturret_tank1
vgr_railgun_turret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_railgun_turret.tga", 
        textureUV_TL = 
            { -24, -50, }, 
        textureUV_WH = 
            { 290, 206, }, 
        stretchOnDraw = 1, }, }
vgr_railgun_turret1 = vgr_railgun_turret
vgr_railgun_turret_tank1 = vgr_railgun_turret
vgr_railgun_turret_tank2 = vgr_railgun_turret
vgr_railgun_turret_tank3 = vgr_railgun_turret
vgr_railgun_turret_tank4 = vgr_railgun_turret
vgr_railgun_turret_tank5 = vgr_railgun_turret
vgr_railgun_turret_tank6 = vgr_railgun_turret
vgr_cruiser_chaingun = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_pdw_gatling.tga", 
        textureUV_TL = 
            { -24, -50, }, 
        textureUV_WH = 
            { 290, 206, }, 
        stretchOnDraw = 1, }, }
vgr_ms_plasma = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_ic.tga", 
        textureUV_TL = 
            { -30, -42, }, 
        textureUV_WH = 
            { 290, 230, }, 
        stretchOnDraw = 1, }, } 
vgr_heavycruiser_plasma = vgr_ms_plasma 
vgr_dt3 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_dt3.tga", 
        textureUV_TL = 
            { -30, -56, }, 
        textureUV_WH = 
            { 290, 266, }, 
        stretchOnDraw = 1, }, }            
Hgn_Destroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_destroyer.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  
vgr_pulsedestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_pulsedestroyer.tga",
        textureUV_TL = 
            { -20, -34, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  	
vgr_pulsedestroyer1 = vgr_pulsedestroyer	
vgr_artilleryship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_artilleryship.tga",
        textureUV_TL = 
            { -18, -25, }, 
        textureUV_WH = 
            { 521, 210, }, 
        stretchOnDraw = 1, }, }  		
vgr_artilleryship1 = vgr_artilleryship		
vgr_battlecarrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_battlecarrier.tga",
        textureUV_TL = 
            { -16, -25, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  		
vgr_battlecarrier1 = vgr_battlecarrier		
vgr_heavycruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Hgn_lighttanker.tga",
        textureUV_TL = 
            { -26, -47, }, 
        textureUV_WH = 
            { 542, 216, }, 
        stretchOnDraw = 1, }, }  
vgr_heavycruiser1 = vgr_heavycruiser
Hgn_MassShield = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_massshield.tga",
        textureUV_TL = 
            { -2, -2, }, 
        textureUV_WH = 
            { 128, 128, }, 
        stretchOnDraw = 1, }, }  
Hgn_MassShield1 = Hgn_MassShield
Hgn_MassShield2 = Hgn_MassShield   
Hgn_MassShield3 = Hgn_MassShield             
kad_massshield = Hgn_MassShield
kad_massshield_sphere = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_massshield_sphere.tga", 
        textureUV_TL = 
            { -24, -57, }, 
        textureUV_WH = 
            { 290, 216, }, 
        stretchOnDraw = 1, }, }    
vgr_mothership_shield = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_mothership_shield.tga",
        textureUV_TL = 
            { -2, -2, }, 
        textureUV_WH = 
            { 128, 128, }, 
        stretchOnDraw = 1, }, }
vgr_mothership_shield1 = vgr_mothership_shield
vgr_carrier_shield = vgr_mothership_shield
vgr_carrier_shield1 = vgr_mothership_shield
vgr_shipyard_shield = vgr_mothership_shield
vgr_shipyard_shield1 = vgr_mothership_shield
Hgn_MissileDestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_missiledestroyer.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 557, 210, }, 
        stretchOnDraw = 1, }, }           
Hgn_IonDestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_iondestroyer.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  
vgr_am = { 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_guardian.tga",
        textureUV_TL = 
            { -23, -58, }, 
        textureUV_WH = 
            { 527, 216, }, 
        stretchOnDraw = 1, }, }  
vgr_am1 = vgr_am      
Hgn_AdvDestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_advdestroyer.tga",
        textureUV_TL = 
            { -17, -39, }, 
        textureUV_WH = 
            { 527, 217, }, 
        stretchOnDraw = 1, }, }  
Hgn_ArtilleryDestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_artillerydestroyer.tga",
        textureUV_TL = 
            { -17, -40, }, 
        textureUV_WH = 
            { 527, 221, }, 
        stretchOnDraw = 1, }, }          
Hgn_SweeperDestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_sweeperdestroyer.tga",
        textureUV_TL = 
            { -13, -41, }, 
        textureUV_WH = 
            { 522, 223, }, 
        stretchOnDraw = 1, }, }    
Hgn_SweeperDestroyer1 = Hgn_SweeperDestroyer              
Hgn_CruiserA = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_cruisera.tga",
        textureUV_TL = 
            { -26, -30, }, 
        textureUV_WH = 
            { 512, 216, }, 
        stretchOnDraw = 1, }, } 
Hgn_CruiserA1 = Hgn_CruiserA        
Hgn_CruiserB = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_cruiserb.tga",
        textureUV_TL = 
            { -26, -30, }, 
        textureUV_WH = 
            { 512, 216, }, 
        stretchOnDraw = 1, }, }  
Hgn_CruiserB1 = Hgn_CruiserB                                   
Hgn_Juggernaught = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaught.tga",
        textureUV_TL = 
            { -16, -21, }, 
        textureUV_WH = 
            { 527, 220, }, 
        stretchOnDraw = 1, }, }                         
Hgn_BadgedCruiser = Hgn_BattleCruiser
Hgn_BattleCruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_battlecruiser.tga",
        textureUV_TL = 
            { -23, -17, }, 
        textureUV_WH = 
            { 527, 216, }, 
        stretchOnDraw = 1, }, }  
Hgn_BattleCruiserNUKE = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_battlecruiserNUKE.tga",
        textureUV_TL = 
            { -23, -17, }, 
        textureUV_WH = 
            { 527, 216, }, 
        stretchOnDraw = 1, }, }
Hgn_BattleCruiserNUKE1 = Hgn_BattleCruiserNUKE
Hgn_BattleShip = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_battleship.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 512, 237, }, 
        stretchOnDraw = 1, }, }          
Hgn_Carrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_carrier.tga",
        textureUV_TL = 
            { -19, -15, }, 
        textureUV_WH = 
            { 527, 185, }, 
        stretchOnDraw = 1, }, }
Hgn_SpaceCarrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_spacecarrier.tga",
        textureUV_TL = 
            { -19, -21, }, 
        textureUV_WH = 
            { 527, 220, }, 
        stretchOnDraw = 1, }, }		
Hgn_SpaceCarrier1 = Hgn_SpaceCarrier
Hgn_BattleCarrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_battlecarrier.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }        
Hgn_BattleCarrier1 = Hgn_BattleCarrier      
Hgn_Scaver = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_scaver.tga",
        textureUV_TL = 
            { -16, -13, }, 
        textureUV_WH = 
            { 542, 210, }, 
        stretchOnDraw = 1, }, }       
Vgr_Scaver = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_scaver.tga",
        textureUV_TL = 
            { -15, -20, }, 
        textureUV_WH = 
            { 527, 178, }, 
        stretchOnDraw = 1, }, } 
Vgr_Scaver1 = Vgr_Scaver
Hgn_LightCarrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_lightcarrier.tga",
        textureUV_TL = 
            { -19, -18, }, 
        textureUV_WH = 
            { 527, 185, }, 
        stretchOnDraw = 1, }, }        
Hgn_Shipyard = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shipyard.tga",
        textureUV_TL = 
            { -20, -20, }, 
        textureUV_WH = 
            { 527, 245, }, 
        stretchOnDraw = 1, }, }  
Hgn_Shipyard_g = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shipyard_g.tga",
        textureUV_TL = 
            { -1, -34, }, 
        textureUV_WH = 
            { 527, 255, }, 
        stretchOnDraw = 1, }, }  	
Hgn_Shipyard_g1 = Hgn_Shipyard_g			
Hgn_BattleShipyard = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_battleshipyard.tga",
        textureUV_TL = 
            { -21, -23, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }  	
Hgn_BattleShipyard1 = Hgn_BattleShipyard				
Hgn_Ark = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_ark.tga",
        textureUV_TL = 
            { -14, -18, }, 
        textureUV_WH = 
            { 530, 240, }, 
        stretchOnDraw = 1, }, }   
Hgn_Ark1 = Hgn_Ark               
Hgn_HyperspaceStation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_hyperspacestation.tga",
        textureUV_TL = 
            { -20, -21, }, 
        textureUV_WH = 
            { 547, 275, }, 
        stretchOnDraw = 1, }, }          
Hgn_CrewStation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_crewstation.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }     
Hgn_MassiveTurret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_massiveturret.tga",
        textureUV_TL = 
            { -32, -34, }, 
        textureUV_WH = 
            { 452, 232, }, 
        stretchOnDraw = 1, }, }           
hgn_tanker_turret = Hgn_MassiveTurret
hgn_tanker_turret1 = Hgn_MassiveTurret
hgn_tanker_turret2 = Hgn_MassiveTurret
Hgn_TransportCell = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_transportcell.tga",
        textureUV_TL = 
            { -26, -34, }, 
        textureUV_WH = 
            { 340, 186, }, 
        stretchOnDraw = 1, }, }        
evacuation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\evacuation.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\evacuation.tga", 
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }                     
Hgn_Tanker = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shuttle.tga",
        textureUV_TL = 
            { -20, -50, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }          
Hgn_MotherShip = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mothership.tga",
        textureUV_TL = 
            { -23, -20, }, 
        textureUV_WH = 
            { 527, 336, }, 
        stretchOnDraw = 1, }, }     
canbuildpoh2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\poh2.tga",
        textureUV_TL = 
            { -55, -26, }, 
        textureUV_WH = 
            { 527, 348, }, 
        stretchOnDraw = 1, }, }         
canbuildpoh3 = canbuildpoh2
hgn_researchstation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_researchstation.tga",
        textureUV_TL = 
            { -32, -32, }, 
        textureUV_WH = 
            { 527, 481, }, 
        stretchOnDraw = 1, }, }  
hgn_power = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_power.tga",
        textureUV_TL = 
            { -32, -42, }, 
        textureUV_WH = 
            { 527, 300, }, 
        stretchOnDraw = 1, }, }        
hgn_power1 = hgn_power
meg_progenitorpowermodule = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_progenitorpowermodule.tga",
        textureUV_TL = 
            { 0, -22, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, }
meg_sajhulknose_ui = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_sajhulknose_ui.tga",
        textureUV_TL = 
            { 0, -12, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, }
meg_foundry = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_foundry.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, } 
meg_ghostship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_ghostship.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, } 
meg_crate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_crate.tga",
        textureUV_TL = 
            { 0, -22, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, }
meg_researchstation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_researchstation.tga",
        textureUV_TL = 
            { -41, -45, }, 
        textureUV_WH = 
            { 522, 497, }, 
        stretchOnDraw = 1, }, }
meg_engineeringbay = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_engineeringbay.tga",
        textureUV_TL = 
            { 0, -22, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, } 
hgn_engineeringbay = meg_engineeringbay
vgr_engineeringbay = meg_engineeringbay
kad_engineeringbay = meg_engineeringbay
rad_engineeringbay = meg_engineeringbay
kpr_engineeringbay = meg_engineeringbay
meg_carrier_huge = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_carrier_huge.tga",
        textureUV_TL = 
            { 0, -22, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, }
meg_mig25 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_mig25.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_mig29 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_mig29.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f14 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f14.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f15 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f15.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f22 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f22.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f35 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f35.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f117 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f117.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f23 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f23.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f18 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f18.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f18_elite = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f18_elite.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_f16 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_f16.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_migmfi = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_migmfi.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_su25 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_su25.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_su34 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_su34.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_su35 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_su35.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_su47 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_su47.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_a10 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_a10.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_av8 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_av8.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_sr71 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_sr71.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_tu160 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_tu160.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_b2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_b2.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_b1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_b1.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_b52 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_b52.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_e767 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_e767.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_t50 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_t50.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_kc10 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_kc10.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_c5 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_c5.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_x47 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_x47.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_x45 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_x45.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_su27 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_su27.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_su27_elite = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_su27_elite.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }
meg_reinforcementpad = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_reinforcementpad.tga",
        textureUV_TL = 
            { 0, -12, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, } 
hgn_reinforcementpad = meg_reinforcementpad
vgr_reinforcementpad = meg_reinforcementpad
kad_reinforcementpad = meg_reinforcementpad
rad_reinforcementpad = meg_reinforcementpad
kpr_reinforcementpad = meg_reinforcementpad
meg_mandator_star_dreadnought = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_mandator_star_dreadnought.tga",
        textureUV_TL = 
            { 0, -12, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, } 
hgn_derelictbattleship = meg_mandator_star_dreadnought
vgr_derelictbattleship = meg_mandator_star_dreadnought
kad_derelictbattleship = meg_mandator_star_dreadnought
rad_derelictbattleship = meg_mandator_star_dreadnought
kpr_derelictbattleship = meg_mandator_star_dreadnought
meg_titan_cruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_titan_cruiser.tga",
        textureUV_TL = 
            { 0, -12, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, } 
meg_hvdreadnaught = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_hvdreadnaught.tga",
        textureUV_TL = 
            { -23, -20, }, 
        textureUV_WH = 
            { 527, 336, }, 
        stretchOnDraw = 1, }, }  
meg_executor_ssd = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_executor_ssd.tga",
        textureUV_TL = 
            { 0, -12, }, 
        textureUV_WH = 
            { 527, 300, },
        stretchOnDraw = 1, }, }
meg_venator_destroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_venator_destroyer.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_allegiance_destroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_allegiance_destroyer.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_implacable_cruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_implacable_cruiser.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_vengence_ssd = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_vengence_ssd.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_eclipse_ssd = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_eclipse_ssd.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_class_iii_platform = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_class_iii_platform.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_bigred = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_bigred.tga",
        textureUV_TL = 
            { 0, -25, }, 
        textureUV_WH = 
            { 512, 272, }, 
        stretchOnDraw = 1, }, }
meg_dreadnaughtberth = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_dreadnaughtberth.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_bentusiexchange = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_bentusiexchange.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_bear = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_bear.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_tmatmegaship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_tmatmegaship.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_drone_small = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_drone_small.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_drone_medium = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_drone_medium.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_drone_large = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_drone_large.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_drone_scout = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_drone_scout.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_veildebris_chunk_lighthouse = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_veildebris_chunk_lighthouse.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 470, }, 
        stretchOnDraw = 1, }, }
meg_veildebris_chunk_lighthouse_nobuild = meg_veildebris_chunk_lighthouse
meg_balcoragate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_balcoragate.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }   
anc_hyperspace_bridge = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\anc_hyperspace_bridge.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }   
meg_tanis = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_tanis.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }                           
        
star_sol_glow = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\nemesis.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }

star_sol = star_sol_glow
star_sol_C9 = star_sol_glow
star_sol_lighter = star_sol_glow
star_sol_lighter1 = star_sol_glow

hgn_planet_moon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_moon.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }   
hgn_planet_earth = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_earth.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_earth_aerosol = hgn_planet_earth
hgn_planet_pluto = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_pluto.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }     
hgn_planet_neptune = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_neptune.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }                  
hgn_planet_mars = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_mars.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_jupiter = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_jupiter.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_europa = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_europa.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_io = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_io.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_callisto = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_callisto.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_ganymeade = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_ganymeade.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }      
hgn_planet_mercury = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_mercury.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }       
hgn_planet_venus = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_venus.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }    
hgn_planet_uranus = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_uranus.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }  
hgn_planet_saturn = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_saturn.tga",
        textureUV_TL = 
            { 0, 15, }, 
        textureUV_WH = 
            { 512, 500, }, 
        stretchOnDraw = 1, }, }

hgn_planet_kharak = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_kharak.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }
hgn_planet_kharak_burned = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_kharak_burned.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }
hgn_planet_angelmoon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_angelmoon.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }
hgn_planet_hiigara = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\planet_hiigara.tga",
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 600, }, 
        stretchOnDraw = 1, }, }
        
hgn_vortex = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_vortex.tga",
        textureUV_TL = 
            { -55, -41, }, 
        textureUV_WH = 
            { 560, 560, }, 
        stretchOnDraw = 1, }, }  
hgn_minivortex = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minivortex.tga",
        textureUV_TL = 
            { -55, -41, }, 
        textureUV_WH = 
            { 560, 560, }, 
        stretchOnDraw = 1, }, }  
hgn_minivortex1 = hgn_minivortex
meg_veildebris_chunk1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\debris.tga",
        textureUV_TL = 
            { -32, -32, }, 
        textureUV_WH = 
            { 587, 551, }, 
        stretchOnDraw = 1, }, }      
asteroid_3_grey_nosalvage = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\asteroidbelt_grey.tga",
        textureUV_TL = 
            { -32, -32, }, 
        textureUV_WH = 
            { 587, 241, }, 
        stretchOnDraw = 1, }, }   
asteroid_4_grey_nosalvage = asteroid_3_grey_nosalvage
asteroid_5_grey_nosalvage = asteroid_3_grey_nosalvage   
asteroid_3_grey_nosalvage_big = asteroid_3_grey_nosalvage     
asteroid_4_grey_nosalvage_big = asteroid_3_grey_nosalvage     
asteroid_5_grey_nosalvage_big = asteroid_3_grey_nosalvage    
asteroid_3_ice_nosalvage = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\asteroidbelt_ice.tga",
        textureUV_TL = 
            { -32, -32, }, 
        textureUV_WH = 
            { 587, 251, }, 
        stretchOnDraw = 1, }, }   
asteroid_4_ice_nosalvage = asteroid_3_ice_nosalvage
asteroid_5_ice_nosalvage = asteroid_3_ice_nosalvage   
asteroid_3_ice_nosalvage_big = asteroid_3_ice_nosalvage     
asteroid_4_ice_nosalvage_big = asteroid_3_ice_nosalvage     
asteroid_5_ice_nosalvage_big = asteroid_3_ice_nosalvage
meg_asteroid1 = 
{ 
		LargeIcon = 
		{ 
				texture = "DATA:\\Ship\\Icons\\ships\\meg_asteroid1.tga",
				textureUV_TL = { 0, 0, }, 
				textureUV_WH = { 480, 240, }, 
				stretchOnDraw = 1, }, }   		
meg_asteroid2 = meg_asteroid1				
meg_asteroid3 = meg_asteroid1
meg_asteroid4 = meg_asteroid1
meg_asteroid5 = meg_asteroid1
meg_asteroid6 = meg_asteroid1
meg_asteroid7 = meg_asteroid1
meg_asteroid8 = meg_asteroid1
meg_asteroid9 = meg_asteroid1
meg_asteroid10 = meg_asteroid1
meg_asteroid11 = meg_asteroid1
meg_asteroid12 = meg_asteroid1
meg_asteroid13 = meg_asteroid1
meg_asteroid14 = meg_asteroid1
meg_asteroid15 = meg_asteroid1
                         
hgn_commandfortress = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_commandfortress.tga",
        textureUV_TL = 
            { -26, -11, }, 
        textureUV_WH = 
            { 522, 256, }, 
        stretchOnDraw = 1, }, }     
hgn_battlestation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_battlestation.tga",
        textureUV_TL = 
            { -41, -45, }, 
        textureUV_WH = 
            { 522, 497, }, 
        stretchOnDraw = 1, }, }           
vgr_commandfortress = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_commandfortress.tga",
        textureUV_TL = 
            { -26, -11, }, 
        textureUV_WH = 
            { 522, 256, }, 
        stretchOnDraw = 1, }, }                                  
Hgn_ResourceCollector = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_resourcecollector.tga",
        textureUV_TL = 
            { -20, -17, }, 
        textureUV_WH = 
            { 260, 167, }, 
        stretchOnDraw = 1, }, }     
Hgn_ResourceController = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_resourcecontroller.tga",
        textureUV_TL = 
            { -29, -12, }, 
        textureUV_WH = 
            { 260, 136, }, 
        stretchOnDraw = 1, }, }      
Hgn_Probe = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_probe.tga",
        textureUV_TL = 
            { -22, -24, }, 
        textureUV_WH = 
            { 260, 178, }, 
        stretchOnDraw = 1, }, }   
Hgn_ECMProbe = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_sensordistortionprobe.tga",
        textureUV_TL = 
            { -32, -16, }, 
        textureUV_WH = 
            { 260, 212, }, 
        stretchOnDraw = 1, }, }    
Hgn_ProximitySensor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_proximitysensor.tga",
        textureUV_TL = 
            { -33, -25, }, 
        textureUV_WH = 
            { 260, 259, }, 
        stretchOnDraw = 1, }, }  
Hgn_hscore = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_hscore.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }    
core_navigation = Hgn_hscore  
core_harvest = Hgn_hscore 
core_defense = Hgn_hscore 
core_attack = Hgn_hscore 
core_hyperspace = Hgn_hscore      
core_build = Hgn_hscore 
core_repair = Hgn_hscore 
core_cloak = Hgn_hscore      
cpu_resource_generator = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\ru_generator.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, } }
Hgn_MineContainer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minecontainer.tga",
        textureUV_TL = 
            { -30, -21, }, 
        textureUV_WH = 
            { 260, 156, }, 
        stretchOnDraw = 1, }, }  
Hgn_Container = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_container.tga",
        textureUV_TL = 
            { -22, -32, }, 
        textureUV_WH = 
            { 520, 236, }, 
        stretchOnDraw = 1, }, } 
Hgn_Container1 = Hgn_Container        
Vgr_Container = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_container.tga",
        textureUV_TL = 
            { -22, -32, }, 
        textureUV_WH = 
            { 520, 236, }, 
        stretchOnDraw = 1, }, } 
Vgr_Container1 = Vgr_Container                   
Hgn_Patcher = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_salvagecollector.tga",
        textureUV_TL = 
            { -31, -24, }, 
        textureUV_WH = 
            { 280, 203, }, 
        stretchOnDraw = 1, }, }
Hgn_Drone = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_drone.tga",
        textureUV_TL = 
            { -28, -25, }, 
        textureUV_WH = 
            { 340, 236, }, 
        stretchOnDraw = 1, }, }                                
Vgr_MinelayerDrone = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_drone.tga",
        textureUV_TL = 
            { -18, -49, }, 
        textureUV_WH = 
            { 340, 188, }, 
        stretchOnDraw = 1, }, }   
Hgn_AssaultCorvette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunship.tga",
        textureUV_TL = 
            { -22, -13, }, 
        textureUV_WH = 
            { 270, 122, }, 
        stretchOnDraw = 1, }, }  
hgn_assaultcorvetteicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunship1.tga",
        textureUV_TL = 
            { -22, -13, }, 
        textureUV_WH = 
            { 280, 122, }, 
        stretchOnDraw = 1, }, }   
Hgn_AssaultCorvettel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunshipl.tga",
        textureUV_TL = 
            { -22, -13, }, 
        textureUV_WH = 
            { 280, 122, }, 
        stretchOnDraw = 1, }, }                
Hgn_PulsarCorvette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_pulsargunship.tga",
        textureUV_TL = 
            { -15, -18, }, 
        textureUV_WH = 
            { 272, 119, }, 
        stretchOnDraw = 1, }, }     
Hgn_PulsarCorvetteicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_pulsargunship1.tga",
        textureUV_TL = 
            { -15, -18, }, 
        textureUV_WH = 
            { 272, 119, }, 
        stretchOnDraw = 1, }, }            
Hgn_PulsarCorvettel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_pulsargunshipl.tga",
        textureUV_TL = 
            { -15, -13, }, 
        textureUV_WH = 
            { 272, 119, }, 
        stretchOnDraw = 1, }, }
hgn_gunshipcoevette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunshipcoevette.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }
hgn_gunshipcoevette1 = hgn_gunshipcoevette
hgn_gunshipcoevetteicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunshipcoevette1.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }
hgn_gunshipcoevettel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunshipcoevettel.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }
hgn_gunshipcoevettel1 = hgn_gunshipcoevettel
hgn_torpedocorvette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_torpedocorvette.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }
hgn_torpedocorvette1 = hgn_torpedocorvette
hgn_torpedocorvetteicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_torpedocorvette1.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }
hgn_torpedocorvettel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_torpedocorvettel.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }
hgn_torpedocorvettel1 = hgn_torpedocorvettel
Hgn_bombervette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bombervette.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }     	
Hgn_bombervette1 = Hgn_bombervette			
Hgn_bombervetteicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bombervette1.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }     
Hgn_bombervettel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bombervettel.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, }, }     	
Hgn_bombervettel1 = Hgn_bombervettel							
Hgn_MinelayerCorvette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minelayer.tga",
        textureUV_TL = 
            { -5, -14, }, 
        textureUV_WH = 
            { 260, 115, }, 
        stretchOnDraw = 1, }, }   
Hgn_multiguncorvette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minegun.tga",
        textureUV_TL = 
            { -5, -10, }, 
        textureUV_WH = 
            { 265, 115, },  
        stretchOnDraw = 1, }, }    
Hgn_multiguncorvettel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minegunl.tga",
        textureUV_TL = 
            { -5, -10, }, 
        textureUV_WH = 
            { 275, 115, },  
        stretchOnDraw = 1, }, }   
Hgn_multiguncorvetteicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minegun1.tga",
        textureUV_TL = 
            { -8, -10, }, 
        textureUV_WH = 
            { 275, 115, },  
        stretchOnDraw = 1, }, }                     
Hgn_cth = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mechgun.tga",
        textureUV_TL = 
            { -28, -12, }, 
        textureUV_WH = 
            { 276, 124, }, 
        stretchOnDraw = 1, }, }   
Hgn_cthl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mechgunl.tga",
        textureUV_TL = 
            { -28, -12, }, 
        textureUV_WH = 
            { 286, 124, }, 
        stretchOnDraw = 1, }, }             
Hgn_cthion = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mechgunion.tga",
        textureUV_TL = 
            { -24, -10, }, 
        textureUV_WH = 
            { 272, 119, }, 
        stretchOnDraw = 1, }, }
Hgn_cthionl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mechgunionl.tga",
        textureUV_TL = 
            { -24, -10, }, 
        textureUV_WH = 
            { 276, 119, }, 
        stretchOnDraw = 1, }, }  
hgn_cthicon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_mechgun1.tga",
        textureUV_TL = 
            { -18, -12, }, 
        textureUV_WH = 
            { 270, 124, }, 
        stretchOnDraw = 1, }, }     
hgn_defenderdrone = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_defenderdrone.tga",
        textureUV_TL = 
            { -25, -33, }, 
        textureUV_WH = 
            { 260, 270, }, 
        stretchOnDraw = 1, }, }     
Hgn_GunTurret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunplatform.tga",
        textureUV_TL = 
            { -10, -13, }, 
        textureUV_WH = 
            { 260, 152, }, 
        stretchOnDraw = 1, }, }    
Hgn_GunTurretSPG = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_gunplatform.tga",
        textureUV_TL = 
            { -10, -13, }, 
        textureUV_WH = 
            { 260, 152, }, 
        stretchOnDraw = 1, }, } 		
Hgn_DefenseFieldTurret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_defensefieldturret.tga",
        textureUV_TL = 
            { -39, -22, }, 
        textureUV_WH = 
            { 260, 276, }, 
        stretchOnDraw = 1, }, }   
Hgn_DefenseFieldTurret1 = Hgn_DefenseFieldTurret               
Hgn_PulsarTurret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_pulsarplatform.tga",
        textureUV_TL = 
            { -10, -12, }, 
        textureUV_WH = 
            { 260, 162, }, 
        stretchOnDraw = 1, }, }  
Hgn_PulsarTurretSPG = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_pulsarplatform.tga",
        textureUV_TL = 
            { -10, -12, }, 
        textureUV_WH = 
            { 260, 162, }, 
        stretchOnDraw = 1, }, }		
Hgn_ionturret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_ionplatform.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 150, }, 
        stretchOnDraw = 1, }, } 
Hgn_ionturretSPG = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_ionplatform.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 150, }, 
        stretchOnDraw = 1, }, } 		
Hgn_missileturret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_missileplatform.tga",
        textureUV_TL = 
            { -21, -13, }, 
        textureUV_WH = 
            { 256, 178, }, 
        stretchOnDraw = 1, }, }   
Hgn_missileturretSPG = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_missileplatform.tga",
        textureUV_TL = 
            { -21, -13, }, 
        textureUV_WH = 
            { 256, 178, }, 
        stretchOnDraw = 1, }, } 		
Hgn_rts = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_rts.tga",
        textureUV_TL = 
            { -21, -24, }, 
        textureUV_WH = 
            { 284, 217, }, 
        stretchOnDraw = 1, }, }     
Hgn_sentinel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_sentinel.tga",
        textureUV_TL = 
            { -30, -18, }, 
        textureUV_WH = 
            { 291, 230, }, 
        stretchOnDraw = 1, }, }    
Hgn_ionsentinel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_ionsentinel.tga",
        textureUV_TL = 
            { -41, -18, }, 
        textureUV_WH = 
            { 291, 250, }, 
        stretchOnDraw = 1, }, }         
Hgn_artillerysentinel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_artillerysentinel.tga",
        textureUV_TL = 
            { 0, -2, }, 
        textureUV_WH = 
            { 291, 190, }, 
        stretchOnDraw = 1, }, }  
Hgn_artillerysentinel1 = Hgn_artillerysentinel                           
Hgn_sentinel1 = Hgn_sentinel   
Hgn_sentinelIcon = Hgn_sentinel
Hgn_ionsentinel1 = Hgn_ionsentinel       
Hgn_combatbase = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_weaponstation.tga",
        textureUV_TL = 
            { -41, -35, }, 
        textureUV_WH = 
            { 512, 488, }, 
        stretchOnDraw = 1, }, }      
Hgn_combatbase1 = Hgn_combatbase                          
Hgn_viper = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_vipermissile.tga",
        textureUV_TL = 
            { -10, -33, }, 
        textureUV_WH = 
            { 266, 125, }, 
        stretchOnDraw = 1, }, }  
Hgn_viper_short = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_vipermissile.tga",
        textureUV_TL = 
            { -13, -42, }, 
        textureUV_WH = 
            { 266, 145, }, 
        stretchOnDraw = 1, }, }
Hgn_viper_short1 = Hgn_viper_short         
Hgn_minermissile = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_minermissile.tga",
        textureUV_TL = 
            { -14, -34, }, 
        textureUV_WH = 
            { 260, 170, }, 
        stretchOnDraw = 1, }, } 
Hgn_minermissile1 = Hgn_minermissile  
Vgr_minermissile = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_minermissile.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 260, 180, }, 
        stretchOnDraw = 1, }, }             
kad_minermissile = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_minermissile.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 260, 180, }, 
        stretchOnDraw = 1, }, }
kad_jihadi = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_jihadi.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 260, 180, }, 
        stretchOnDraw = 1, }, }
hgn_nuclearbomb = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_nuclearbomb.tga",
        textureUV_TL = 
            { -10, -18, }, 
        textureUV_WH = 
            { 266, 160, }, 
        stretchOnDraw = 1, }, }    
hgn_nucleartube1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_nuclearbomb.tga",
        textureUV_TL = 
            { -13, -39, }, 
        textureUV_WH = 
            { 260, 200, }, 
        stretchOnDraw = 1, }, }    
hgn_nucleartube2 = hgn_nucleartube1  
hgn_nucleartube3 = hgn_nucleartube1   
hgn_torpedotube1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_torpedotube.tga",
        textureUV_TL = 
            { -15, -29, }, 
        textureUV_WH = 
            { 260, 160, }, 
        stretchOnDraw = 1, }, }    
hgn_torpedotube2 = hgn_torpedotube1  
hgn_torpedotube3 = hgn_torpedotube1                                    
Hgn_tangomine = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_tangomine.tga",
        textureUV_TL = 
            { -16, -30, }, 
        textureUV_WH = 
            { 260, 180, }, 
        stretchOnDraw = 1, }, }  
Hgn_tangomine_ws = Hgn_tangomine        
Hgn_tangomine_ws1 = Hgn_tangomine        
vgr_boa = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\boa.tga",
        textureUV_TL = 
            { -20, -21, }, 
        textureUV_WH = 
            { 260, 271, }, 
        stretchOnDraw = 1, }, }          
Hgn_AssaultFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_flak.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 166, }, 
        stretchOnDraw = 1, }, }   
Hgn_DefenseFieldFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_defensefieldfrigate.tga",
        textureUV_TL = 
            { -10, -23, }, 
        textureUV_WH = 
            { 260, 134, }, 
        stretchOnDraw = 1, }, }   
Hgn_TorpedoFrigate = 
{ 
     LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_missilefrigate.tga",
        textureUV_TL = 
            { -10, -22, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }   
Hgn_lrms = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_sniperfrigate.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }   
Hgn_IonCannonFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_ioncannonfrigate.tga",
        textureUV_TL = 
            { -10, -9, }, 
        textureUV_WH = 
            { 260, 125, }, 
        stretchOnDraw = 1, }, }   
Hgn_Tulwar = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_tulwar.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 131, }, 
        stretchOnDraw = 1, }, }           
Hgn_MarineFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_marinefrigate.tga",
        textureUV_TL = 
            { -10, -22, }, 
        textureUV_WH = 
            { 260, 130, }, 
        stretchOnDraw = 1, }, }     
hgn_juggernaught_booster = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_juggernaught_booster.tga",
        textureUV_TL = 
            { -10, -22, }, 
        textureUV_WH = 
            { 260, 130, }, 
        stretchOnDraw = 1, }, }  
Hgn_AttackBomber = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bomber.tga",
        textureUV_TL = 
            { -14, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }   
Hgn_AttackBomberl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bomberl.tga",
        textureUV_TL = 
            { -14, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }      
Hgn_AttackBomberIcon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bomber1.tga",
        textureUV_TL = 
            { -14, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }                    
Hgn_AttackBomberHeavy = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bomberheavy.tga",
        textureUV_TL = 
            { -14, -12, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, } 
Hgn_AttackBomberHeavyl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_bomberheavyl.tga",
        textureUV_TL = 
            { -14, -12, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }                      
Hgn_Interceptor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_interceptor.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
Hgn_Interceptorl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_interceptorl.tga",
        textureUV_TL = 
            { -14, -16, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
Hgn_InterceptorIcon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_interceptor1.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
Hgn_RailgunFighter = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_intruder.tga",
        textureUV_TL = 
            { -14, -18, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }  
Hgn_RailgunFighterl = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_intruderl.tga",
        textureUV_TL = 
            { -14, -16, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }   
Hgn_RailgunFighterIcon = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_intruder1.tga",
        textureUV_TL = 
            { -14, -18, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
hgn_pulsarfighter = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_pulsarfighter.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
hgn_shadowbomber = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shadowbomber.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
Unit_G_Interceptor = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Unit_G_Interceptor.tga",
        textureUV_TL = 
            { -14, -16, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
Unit_G_Bomber = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Unit_G_Bomber.tga",
        textureUV_TL = 
            { -18, -19, }, 
        textureUV_WH = 
            { 256, 164, }, 
        stretchOnDraw = 1, }, }
Unit_C_Interceptor = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Unit_C_Interceptor.tga",
        textureUV_TL = 
            { -14, -18, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }  
Unit_C_Bomber = { 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Unit_C_Bomber.tga",
        textureUV_TL = 
            { -18, -19, }, 
        textureUV_WH = 
            { 256, 164, }, 
        stretchOnDraw = 1, }, }
Unit_C_Gunship = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Unit_C_Gunship.tga",
        textureUV_TL = 
            { -14, -18, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }  
Vgr_HeavyFighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_missilefighter.tga",
    textureUV_TL = {
      0,
      0,
    },
    textureUV_WH = {
      256,
      115,
    },
    stretchOnDraw = 1,
  },
}
vgr_elitefighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\vgr_elitefighter.tga",
    textureUV_TL = {
      -10,
      -32,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}
vgr_elitefighter1 = vgr_elitefighter
vgr_missilebomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\vgr_missilebomber.tga",
    textureUV_TL = {
      -14,
      -22,
    },
    textureUV_WH = {
      276,
      129,
    },
    stretchOnDraw = 1,
  },
}
vgr_missilebomber1 = vgr_missilebomber
Hgn_LBomber = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_lbomber.tga",
        textureUV_TL = 
            { -16, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }   
Hgn_LBomberl = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_lbomberl.tga",
        textureUV_TL = 
            { -16, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }   
Hgn_LBomberIcon = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_lbomber.tga",
        textureUV_TL = 
            { -14, -17, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
hgn_strategicbomber = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_strategicbomber.tga",
        textureUV_TL = 
            { -16, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }   
hgn_strategicbomberl = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_strategicbomberl.tga",
        textureUV_TL = 
            { -16, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }   
hgn_strategicbombericon = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_strategicbomber1.tga",
        textureUV_TL = 
            { -14, -17, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
Hgn_HFT = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shiry.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }           
Hgn_HFTl = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shiryl.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }  
Hgn_HFTIcon = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_shiry1.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }                      
Hgn_Defender = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_spy.tga",
        textureUV_TL = 
            { -14, -22, }, 
        textureUV_WH = 
            { 265, 148, }, 
        stretchOnDraw = 1, }, }   
Hgn_Defendericon = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_spy1.tga",
        textureUV_TL = 
            { -14, -22, }, 
        textureUV_WH = 
            { 265, 148, }, 
        stretchOnDraw = 1, }, }           
Hgn_Scout = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_scout.tga",
        textureUV_TL = 
            { -18, -19, }, 
        textureUV_WH = 
            { 256, 164, }, 
        stretchOnDraw = 1, }, }     
Hgn_Scouticon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_scout1.tga",
        textureUV_TL = 
            { -18, -19, }, 
        textureUV_WH = 
            { 256, 164, }, 
        stretchOnDraw = 1, }, }                
Meg_Gehenna = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_gehenna.tga",
        textureUV_TL = 
            { -14, -24, }, 
        textureUV_WH = 
            { 400, 241, }, 
        stretchOnDraw = 1, }, }               
meg_headshotasteroid = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_headshotasteroid.tga",
        textureUV_TL = 
            { -14, -24, }, 
        textureUV_WH = 
            { 400, 241, }, 
        stretchOnDraw = 1, }, }   
        
Hgn_AssaultCorvetteElite = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 0, 704, }, 
        textureUV_WH = 
            { 150, 64, }, 
        stretchOnDraw = 1, }, }
Hgn_AttackBomberElite = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 400, 0, }, 
        textureUV_WH = 
            { 150, 64, }, 
        stretchOnDraw = 1, }, }     
Hgn_Dreadnaught = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Hgn_Dreadnaught.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 529, 237, }, 
        stretchOnDraw = 1, }, }
Hgn_DreadnaughtBerth1 = Hgn_Dreadnaught
Hgn_DreadnaughtBerth2 = Hgn_Dreadnaught
kpr_dreadnaught = Hgn_Dreadnaught
kpr_dreadnaught1 = Hgn_Dreadnaught
Hgn_InterceptorElite = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 400, 64, }, 
        textureUV_WH = 
            { 150, 64, }, 
        stretchOnDraw = 1, }, }
Hgn_MarineFrigate_Soban = Hgn_MarineFrigate
Hgn_TargetDrone = Hgn_Probe
Hgn_Shipyard_Elohim = Hgn_Shipyard
Hgn_SupportFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 0, 384, }, 
        textureUV_WH = 
            { 156, 64, }, 
        stretchOnDraw = 1, }, }

Hgn_TorpedoFrigateElite = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 0, 512, }, 
        textureUV_WH = 
            { 116, 64, }, 
        stretchOnDraw = 1, }, }
Kpr_AttackDroid = 
{
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Kpr_AttackDroid.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
Kpr_AttackDroid1 = Kpr_AttackDroid
Kpr_Destroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Destroyer.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 512, 237, }, 
        stretchOnDraw = 1, }, }
Kpr_Destroyer1 = Kpr_Destroyer
Kpr_Mover = 
{
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Kpr_Mover.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
Kpr_Mover1 = Kpr_Mover
Kpr_Planetkiller = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 128, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Kpr_Sajuuk = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Sajuuk.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 529, 237, }, 
        stretchOnDraw = 1, }, }
Kpr_Sajuuk_NoSensors = Kpr_Sajuuk
kpr_sajuuk1 = Kpr_Sajuuk
Meg_Asteroid = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 704, }, 
        textureUV_WH = 
            { 85, 64, }, 
        stretchOnDraw = 1, }, }
Meg_BalcoraGate_Chunk1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 700, 448, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Meg_BalcoraGate_Chunk2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 700, 448, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Meg_BalcoraGate_Chunk3 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 700, 448, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Meg_Bentus.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
hgn_bentus=Meg_Bentus
vgr_bentus=Meg_Bentus
kad_bentus=Meg_Bentus
rad_bentus=Meg_Bentus
kpr_bentus=Meg_Bentus
Meg_Bentus_Ruins_Core_3 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 900, 0, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruins_Core_1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 64, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruins_Core_2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 900, 64, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_10 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_11 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_3 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_4 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_5 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_6 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_7 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_8 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Bentus_Ruin_9 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 512, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_Chimera = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_chimera.tga",
        textureUV_TL = 
            { -23, -29, }, 
        textureUV_WH = 
            { 512, 377, }, 
        stretchOnDraw = 1, }, }
meg_chimera_nobuild = Meg_Chimera
Meg_TanisStructure_Medium = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\meg_tanisstructure.tga", 
        textureUV_TL = 
            { 0, -46, }, 
        textureUV_WH = 
            { 512, 450, }, 
        stretchOnDraw = 1, }, }    
Meg_TanisStructure_Medium2 = Meg_TanisStructure_Medium
hgn_command_post1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\command_post.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, } }
hgn_command_post2 = hgn_command_post1
hgn_command_post3 = hgn_command_post1
hgn_command_post4 = hgn_command_post1
vgr_command_post1 = hgn_command_post1
vgr_command_post2 = hgn_command_post1
vgr_command_post3 = hgn_command_post1
vgr_command_post4 = hgn_command_post1
kad_command_post1 = hgn_command_post1
kad_command_post2 = hgn_command_post1
kad_command_post3 = hgn_command_post1
kad_command_post4 = hgn_command_post1
rad_command_post1 = hgn_command_post1
rad_command_post2 = hgn_command_post1
rad_command_post3 = hgn_command_post1
rad_command_post4 = hgn_command_post1
kpr_command_post1 = hgn_command_post1
kpr_command_post2 = hgn_command_post1
kpr_command_post3 = hgn_command_post1
kpr_command_post4 = hgn_command_post1
StaticContainer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 200, 960, }, 
        textureUV_WH = 
            { 203, 64, }, 
        stretchOnDraw = 1, }, }
StaticContainer2 = StaticContainer
StaticContainer3 = StaticContainer
StaticContainer4 = StaticContainer
StaticContainer5 = StaticContainer
StaticContainer6 = StaticContainer
StaticContainer7 = StaticContainer
StaticContainer8 = StaticContainer
StaticContainer9 = StaticContainer
StaticContainer10 = StaticContainer
StaticContainer11 = StaticContainer
Meg_VeilChunk1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 832, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_VeilChunk2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 832, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Meg_FoundryDebris_Chunk1 = Meg_VeilChunk1
Meg_FoundryDebris_Chunk2 = Meg_VeilChunk1
Meg_FoundryDebris_Chunk3 = Meg_VeilChunk1
Meg_FoundryDebris_Chunk4 = Meg_VeilChunk1
Meg_FoundryDebris_Flake1 = Meg_VeilChunk1
Meg_FoundryDebris_Flake2 = Meg_VeilChunk1
Meg_FoundryDebris_Flake3 = Meg_VeilChunk1
Meg_FoundryDebris_Flake4 = Meg_VeilChunk1
Sp_Tanker = Hgn_Tanker  
Sp_Tanker2 = Hgn_Tanker
Sp_Tanker3 = Hgn_Tanker
Sp_Tanker4 = Hgn_Tanker
Sp_Tanker5 = Hgn_Tanker
Sp_Tanker6 = Hgn_Tanker
Vgr_AssaultFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_assaultfrigate.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 126, }, 
        stretchOnDraw = 1, }, }   
Vgr_AdvAssaultFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_advassaultfrigate.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 126, }, 
        stretchOnDraw = 1, }, } 		
Vgr_AdvAssaultFrigate1 = Vgr_AdvAssaultFrigate				
Vgr_BattleCruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_battlecruiser.tga",
        textureUV_TL = 
            { -23, -33, }, 
        textureUV_WH = 
            { 527, 214, }, 
        stretchOnDraw = 1, }, }
vgr_battlecruiser_hero = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_battlecruiser_hero.tga",
        textureUV_TL = 
            { -23, -33, }, 
        textureUV_WH = 
            { 527, 214, }, 
        stretchOnDraw = 1, }, }
vgr_battlecruiser_hero1 = vgr_battlecruiser_hero
Vgr_MissileBattleCruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_missilebattlecruiser.tga",
        textureUV_TL = 
            { -30, -40, }, 
        textureUV_WH = 
            { 542, 204, }, 
        stretchOnDraw = 1, }, }  
Vgr_MissileBattleCruiser1 = Vgr_MissileBattleCruiser
vgr_missledreadnaught = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_missledreadnaught.tga",
        textureUV_TL = 
            { -29, -24, }, 
        textureUV_WH = 
            { 522, 270, }, 
        stretchOnDraw = 1, }, }  
vgr_missledreadnaught1 = vgr_missledreadnaught
vgr_alkhalid =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_battleship.tga",
        textureUV_TL = 
            { -23, -11, }, 
        textureUV_WH = 
            { 527, 240, }, 
        stretchOnDraw = 1, }, }  
vgr_superbattleship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_superbattleship.tga",
        textureUV_TL = 
            { -23, -11, }, 
        textureUV_WH = 
            { 527, 240, }, 
        stretchOnDraw = 1, }, }  
vgr_superbattleship1 = vgr_superbattleship
vgr_titan_icon = vgr_superbattleship
vgr_battleship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_titan.tga",
        textureUV_TL = 
            { -23, -33, }, 
        textureUV_WH = 
            { 527, 214, }, 
        stretchOnDraw = 1, }, }
vgr_battleship1 = vgr_battleship
vgr_worldcannon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_worldcannon.tga",
        textureUV_TL = 
            { -23, 5, }, 
        textureUV_WH = 
            { 527, 214, }, 
        stretchOnDraw = 1, }, }
Vgr_Bomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_bomber.tga",
    textureUV_TL = {
      0,
      -4,
    },
    textureUV_WH = {
      256,
      115,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Bioship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_bioship.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, 
     }, 
}   
Vgr_Carrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_Carrier.tga",
        textureUV_TL = 
            { -23, -31, }, 
        textureUV_WH = 
            { 527, 208, }, 
        stretchOnDraw = 1, }, }  
Vgr_CommStation = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 200, 0, }, 
        textureUV_WH = 
            { 117, 64, }, 
        stretchOnDraw = 1, }, }
Vgr_Destroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_Destroyer.tga",
        textureUV_TL = 
            { -23, -39, }, 
        textureUV_WH = 
            { 527, 214, }, 
        stretchOnDraw = 1, }, }  
vgr_cruiser =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_cruiser.tga",
        textureUV_TL = 
            { -19, -16, }, 
        textureUV_WH = 
            { 527, 192, }, 
        stretchOnDraw = 1, }, }
vgr_hammerhead = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_hammerhead.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 512, 237, }, 
        stretchOnDraw = 1, }, }
vgr_hammerhead1 = vgr_hammerhead
vgr_lightcruiser =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_lightcruiser.tga",
        textureUV_TL = 
            { -20, -38, }, 
        textureUV_WH = 
            { 527, 212, }, 
        stretchOnDraw = 1, }, }     
vgr_lightcruiser1 = vgr_lightcruiser
vgr_lightcruiser_icon = vgr_lightcruiser
vgr_lightcruiser_gun =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_lightcruiser_gun.tga",
        textureUV_TL = 
            { -20, -38, }, 
        textureUV_WH = 
            { 527, 212, }, 
        stretchOnDraw = 1, }, }
vgr_lightcruiser_gun1 = vgr_lightcruiser_gun
Vgr_Dreadnaught = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_dreadnaught.tga",
        textureUV_TL = 
            { -23, -25, }, 
        textureUV_WH = 
            { 527, 242, }, 
        stretchOnDraw = 1, }, }  
Vgr_DreadnaughtB = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_dreadnaughtB.tga",
        textureUV_TL = 
            { -23, -33, }, 
        textureUV_WH = 
            { 532, 212, }, 
        stretchOnDraw = 1, }, }
Vgr_DreadnaughtB1 = Vgr_DreadnaughtB
Vgr_ArtilleryBattlecruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_ArtilleryBattlecruiser.tga",
        textureUV_TL = 
            { -55, -41, }, 
        textureUV_WH = 
            { 560, 560, }, 
        stretchOnDraw = 1, }, }  
Vgr_HeavyMissileFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_MissileFrigate.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 126, }, 
        stretchOnDraw = 1, }, }   
Vgr_HyperSpace_Inhibitor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 300, 512, }, 
        textureUV_WH = 
            { 100, 64, }, 
        stretchOnDraw = 1, }, }
Vgr_HyperSpace_Platform = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_hyperspaceplatform.tga",
        textureUV_TL = 
            { -14, -27, }, 
        textureUV_WH = 
            { 260, 152, }, 
        stretchOnDraw = 1, }, }     
cpu_jump_gate_0 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\jump_gate.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, } }
cpu_jump_gate_50 = cpu_jump_gate_0
cpu_jump_gate_100 = cpu_jump_gate_0
cpu_jump_gate_200 = cpu_jump_gate_0
cpu_jump_gate_0_uncapturable = cpu_jump_gate_0
cpu_jump_gate_50_uncapturable = cpu_jump_gate_0
cpu_jump_gate_100_uncapturable = cpu_jump_gate_0
cpu_jump_gate_200_uncapturable = cpu_jump_gate_0
Vgr_InfiltratorFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_InfiltratorFrigate.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 106, }, 
        stretchOnDraw = 1, }, } 

---VGR FIGHTER----------------------------------------------------------------------------------------------------------------------------------------------------------------------
				
Vgr_Defender = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_Defender.tga",
    textureUV_TL = {
      -10,
      -21,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}			
Vgr_HeavyFighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_missilefighter.tga",
    textureUV_TL = {
      -10,
      -21,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}	
Vgr_Bomber = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_bomber.tga",
    textureUV_TL = {
      -10,
      -29,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Scout = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_scout.tga",
    textureUV_TL = {
      -10,
      -40,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}				
Vgr_Interceptor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_strikecraft.tga",
    textureUV_TL = {
      -10,
      -36,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}
Vgr_LanceFighter = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_lancefighter.tga",
    textureUV_TL = {
      -10,
      -32,
    },
    textureUV_WH = {
      266,
      135,
    },
    stretchOnDraw = 1,
  },
}

---VGR CORVETTE-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Vgr_LaserCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_lasercorvette.tga",
    textureUV_TL = {
      -10,
      -24,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
Vgr_PlasmaCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_plasmacorvette.tga",
    textureUV_TL = {
      -10,
      -24,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
Vgr_PlasmaCorvette1 = Vgr_PlasmaCorvette
Vgr_MinelayerCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_minelayer.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
Vgr_CommandCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_commandcorvette.tga",
    textureUV_TL = {
      -13,
      14,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
Vgr_MissileCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_missilecorvette.tga",
    textureUV_TL = {
      -10,
      -33,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Standvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_stormcorvette.tga",
    textureUV_TL = {
      -10,
      -12,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
Vgr_MultiLanceCorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_MultiLanceCorvette.tga",
    textureUV_TL = {
      -10,
      -25,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
vgr_mortarcorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\vgr_mortarcorvette.tga",
    textureUV_TL = {
      -10,
      -25,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
vgr_mortarcorvette1 = vgr_mortarcorvette
Vgr_Striker = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\vgr_strikercorvette.tga",
    textureUV_TL = {
      -10,
      -29,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}
Vgr_Striker1 = Vgr_Striker



Vgr_MotherShip = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_mothership.tga",
        textureUV_TL = 
            { -12, -26, }, 
        textureUV_WH = 
            { 527, 234, }, 
        stretchOnDraw = 1, }, }  
Vgr_MotherShip_Makaan = Vgr_MotherShip
Vgr_PlanetKillerMissile = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 192, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
Vgr_Cruse = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_Cruse.tga",
        textureUV_TL = 
            { -15, -30, }, 
        textureUV_WH = 
            { 290, 156, }, 
        stretchOnDraw = 1, }, }   				
Vgr_Cruse1 = Vgr_Cruse
vgr_JDAM = Vgr_Cruse
Vgr_PlanetKiller = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 800, 128, }, 
        textureUV_WH = 
            { 200, 64, }, 
        stretchOnDraw = 1, }, }
vgr_tmatship = Vgr_PlanetKiller
vgr_planetkiller_custom = Vgr_PlanetKiller
Vgr_Probe = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_Probe.tga",
        textureUV_TL = 
            { -23, -31, }, 
        textureUV_WH = 
            { 260, 277, }, 
        stretchOnDraw = 1, }, }     
Vgr_Probe_ECM = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_Probe_ECM.tga",
        textureUV_TL = 
            { -23, -31, }, 
        textureUV_WH = 
            { 260, 307, }, 
        stretchOnDraw = 1, }, }     
Vgr_Probe_Prox = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_Probe_Prox.tga",
        textureUV_TL = 
            { -25, -21, }, 
        textureUV_WH = 
            { 260, 307, }, 
        stretchOnDraw = 1, }, }       
Vgr_Probe_Smallhsbeacon = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_probe_smallhsbeacon.tga",
        textureUV_TL = 
            { -55, -23, }, 
        textureUV_WH = 
            { 260, 299, }, 
        stretchOnDraw = 1, }, }
Vgr_ResourceCollector = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_resourcecollector.tga",
        textureUV_TL = 
            { -37, -30, }, 
        textureUV_WH = 
            { 276, 258, }, 
        stretchOnDraw = 1, }, }
vgr_patcher = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_patcher.tga",
        textureUV_TL = 
            { -37, -30, }, 
        textureUV_WH = 
            { 276, 258, }, 
        stretchOnDraw = 1, }, } 
Vgr_ResourceController = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_resourcecontroller.tga",
        textureUV_TL = 
            { -29, -21, }, 
        textureUV_WH = 
            { 290, 166, }, 
        stretchOnDraw = 1, }, }    
Vgr_ResourceControllerDouble = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_resourcecontrollerdouble.tga",
        textureUV_TL = 
            { -29, -25, }, 
        textureUV_WH = 
            { 290, 166, }, 
        stretchOnDraw = 1, }, }   
Vgr_ResourceControllerDouble1 = Vgr_ResourceControllerDouble	
Vgr_Sinner = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_sinner.tga",
        textureUV_TL = 
            { -29, -24, }, 
        textureUV_WH = 
            { 522, 270, }, 
        stretchOnDraw = 1, }, } 
Vgr_Sinner1 = Vgr_Sinner
Vgr_ShipYard = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_shipyard.tga",
        textureUV_TL = 
            { -32, 38, }, 
        textureUV_WH = 
            { 540, 226, }, 
        stretchOnDraw = 1, }, }  
Vgr_TransportFrigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 200, 384, }, 
        textureUV_WH = 
            { 142, 64, }, 
        stretchOnDraw = 1, }, }
Vgr_WeaponPlatform_gun = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_gunplatform.tga",
        textureUV_TL = 
            { -22, -13, }, 
        textureUV_WH = 
            { 260, 284, }, 
        stretchOnDraw = 1, }, }     
Vgr_WeaponPlatform_lance = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_lanceplatform.tga",
        textureUV_TL = 
            { -20, -28, }, 
        textureUV_WH = 
            { 260, 298, }, 
        stretchOnDraw = 1, }, }   
Vgr_WeaponPlatform_missile = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_missileplatform.tga",
        textureUV_TL = 
            { -22, -13, }, 
        textureUV_WH = 
            { 260, 314, }, 
        stretchOnDraw = 1, }, }     
vgr_mobile_inhibitor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_mobile_inhibitor.tga",
        textureUV_TL = 
            { -22, -23, }, 
        textureUV_WH = 
            { 260, 314, }, 
        stretchOnDraw = 1, }, }
vgr_mobile_inhibitor1 = vgr_mobile_inhibitor
vgr_mobile_inhibitor_well = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_mobile_inhibitor_well.tga",
        textureUV_TL = 
            { -22, -23, }, 
        textureUV_WH = 
            { 260, 314, }, 
        stretchOnDraw = 1, }, }
vgr_cloakplatform = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_cloakplatform.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 126, }, 
        stretchOnDraw = 1, }, }
vgr_cloakplatform1 = vgr_cloakplatform
Icon_Subsystem_CapShip = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_CapShipAdvanced = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 32*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 24*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_Corvette = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 64*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 48*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_CorvetteMover = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 96*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 72*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_Fighter = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 128*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 96*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_Frigate = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 160*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 120*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_FrigateAdvanced = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 0, 192*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 0, 144*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_CommStation_bottom = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 192*2, 64*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 96*2, 48*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_TorpedoLauncher = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 128*2, 32*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 64*2, 24*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_Mine = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_mine.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_mine.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
powerup_power = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_power.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_power.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }        				
powerup_ru = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_ru.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_ru.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }           
powerup_attack = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_attack.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_attack.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
merc_attack1 = powerup_attack
merc_attack2 = powerup_attack
merc_attack3 = powerup_attack
merc_attack4 = powerup_attack
merc_attack5 = powerup_attack
merc_attack6 = powerup_attack
merc_attack7 = powerup_attack
merc_attack8 = powerup_attack
merc_attack9 = powerup_attack
merc_attack10 = powerup_attack
powerup_defense = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_defense.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_defense.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
merc_defense1 = powerup_defense
merc_defense2 = powerup_defense
merc_defense3 = powerup_defense
merc_defense4 = powerup_defense
merc_defense5 = powerup_defense
merc_defense6 = powerup_defense
merc_defense7 = powerup_defense
merc_defense8 = powerup_defense
merc_defense9 = powerup_defense
merc_defense10 = powerup_defense
powerup_repair = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_repair.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_repair.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
powerup_build = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_build.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_build.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
powerup_disrupt = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_disrupt.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_disrupt.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
powerup_speed = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_speed.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_speed.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
powerup_sensor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_sensor.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\powerup_sensor.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }                                                                                    
Icon_Subsystem_MineSet = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_mineset.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_mineset.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_vgrmsarmor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_vgrmsarmor.tga", 
        textureUV_TL = 
            { -21, -42, }, 
        textureUV_WH = 
            { 280, 140, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_vgrmsarmor.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_armour = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_bm_armour.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
destroyer_armour = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\destroyer_armour.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }    
hgn_tanker_armour = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\hgn_tanker_armour.tga", 
        textureUV_TL = 
            { 0, 23, }, 
        textureUV_WH = 
            { 290, 96, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_IonTurret = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 192*2, 32*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 96*2, 24*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Fleet = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_fleet.tga", 
        textureUV_TL = 
            { -9, 13, }, 
        textureUV_WH = 
            { 159, 95, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\hgn_fleet.tga",   
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
Icon_Fleet1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_fleet.tga", 
        textureUV_TL = 
            { -9, 13, }, 
        textureUV_WH = 
            { 159, 95, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\vgr_fleet.tga",   
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }        
Icon_Subsystem_PlatformControl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 64*2, 0, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 32*2, 0, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_Engine = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 192*2, 0, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 96*2, 0, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }        
Icon_Subsystem_Resource = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 128*2, 192*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 64*2, 144*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, }
Hgn_power_m1 = Hgn_power_m0    
Hgn_power_m2 = Hgn_power_m0    
Hgn_power_m3 = Hgn_power_m0    
Hgn_power_m4 = Hgn_power_m0                 
Hgn_power_m5 = Hgn_power_m0    
Hgn_power_m6 = Hgn_power_m0    
Hgn_power_m7 = Hgn_power_m0    
Hgn_power_m8 = Hgn_power_m0    
Hgn_power_m9 = Hgn_power_m0 
isensigncore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\ensign.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\ensign.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }              
hgn_islieutenantcore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\lieutenant.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\lieutenant.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
hgn_iscommandercore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\commander.tga", 
        textureUV_TL = 
            { -6, -12, },  
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\commander.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
hgn_iscaptaincore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\captain.tga", 
        textureUV_TL = 
            { -6, -12, },  
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\captain.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
hgn_iscommodorecore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\commodore.tga", 
        textureUV_TL = 
            { -6, -12, },  
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\commodore.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
hgn_isadmiralcore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\admiral.tga", 
        textureUV_TL = 
            { -6, -12, },  
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\admiral.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
hgn_isfleetadmiralcore = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\fleetadmiral.tga", 
        textureUV_TL = 
            { -6, -12, },  
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\fleetadmiral.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   

Hgn_strikebattlecruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icon_ships.mres", 
        textureUV_TL = 
            { 0, 64, }, 
        textureUV_WH = 
            { 172, 64, }, 
        stretchOnDraw = 1, }, }
Sp_Tanker = 
{
  LargeIcon = 
  {
      texture = "DATA:\\Ship\\Icons\\icon_ships.mres",
      textureUV_TL = 
        { 0, 960, },
      textureUV_WH = 
        { 197, 64, },
    stretchOnDraw = 1,  }, }
Sp_Tanker2 = Sp_Tanker
Sp_Tanker3 = Sp_Tanker
Sp_Tanker4 = Sp_Tanker
Sp_Tanker5 = Sp_Tanker
Sp_Tanker6 = Sp_Tanker
Icon_Subsystem_DefenseField2 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_defensefield1_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_defensefield1_1600.tga", 
         textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_advanceddefensesystem = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga", 
        textureUV_TL = 
            { 128*2, 32*2, }, 
        textureUV_WH = 
            { 128, 64, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\icons_subs_taskbar_1600.tga", 
        textureUV_TL = 
            { 64*2, 24*2, }, 
        textureUV_WH = 
            { 64, 48, }, 
        stretchOnDraw = 1, }, } 
        
Icon_Subsystem_hgpb = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hgpb_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hgpb_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
Icon_Subsystem_ppl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_p.tga", 
        textureUV_TL = 
            { -30, -40, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_hgpbn = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hgpbn_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hgpbn_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }        
        
Icon_Subsystem_torpedolauncherset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_torpedolauncherset_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_torpedolauncherset_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }    
Icon_Subsystem_pplnew = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_ppl_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_ppl_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
Icon_Subsystem_ionbeamturretset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\Icons_Subsystem_ionbeamturretset_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\Icons_Subsystem_ionbeamturretset_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
vgn_superbattleshipioncannonturret = Icon_Subsystem_ionbeamturretset
vgr_superBBsideheavygunL = Icon_Subsystem_ionbeamturretset
vgr_superBBsideheavygunR = Icon_Subsystem_ionbeamturretset
vgn_battleshipioncannonturret = Icon_Subsystem_ionbeamturretset
Icon_Subsystem_rapidset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\Icons_Subsystem_rapidset_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\Icons_Subsystem_rapidset_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }                                             
        
Icon_Subsystem_ionbattery = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_ionbattery_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_ionbattery_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }     
Icon_Subsystem_empbattery = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_empbattery_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_empbattery_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }             
ftam = ftam2x 
ftam1 = ftam2x        
ftam2 = ftam2x                  

Icon_Subsystem_Dropoff = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_dropoff_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_dropoff_1600.tga", 
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
        
Icon_Subsystem_c = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_i.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
        
vgr_cruiserturret_gun = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_kineticburstcannon.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }

Icon_Subsystem_hic = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hic_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hic_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
        
Icon_Subsystem_hicd = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hic_1600d.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_hic_1600d.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
        
Icon_Subsystem_ion_k = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_k_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_k_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
        
Icon_Subsystem_ion_k1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_k1_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_k1_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
     
Icon_Subsystem_k = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_qk.tga", 
        textureUV_TL = 
            { -30, -39, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }
        
vgr_mlrs = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_mlrs.tga", 
        textureUV_TL = 
            { -30, -39, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }
vgr_mlrs_tank1 = vgr_mlrs
vgr_mlrs_tank2 = vgr_mlrs
vgr_mlrs_tank3 = vgr_mlrs
vgr_mlrs_tank4 = vgr_mlrs
vgr_mlrs_tank5 = vgr_mlrs
vgr_mlrs_tank6 = vgr_mlrs
vgr_destroyer_mlrs5 = vgr_mlrs
vgr_destroyer_mlrs6 = vgr_mlrs
        
vgr_ciws = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_ciws.tga", 
        textureUV_TL = 
            { -30, -39, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }
vgr_ciws_tank1 = vgr_ciws
vgr_ciws_tank2 = vgr_ciws
vgr_ciws_tank3 = vgr_ciws
vgr_ciws_tank4 = vgr_ciws
vgr_ciws_tank5 = vgr_ciws
vgr_ciws_tank6 = vgr_ciws
vgr_destroyer_ciws5 = vgr_ciws
vgr_destroyer_ciws6 = vgr_ciws
        
Icon_Subsystem_kset = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }     
                
Icon_Subsystem_ksetl = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600l.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600l.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }        
hgn_vhcannonx3 = heavykinetic3xset
hgn_vhcannonx31 = heavykinetic3xset
hgn_vhcannonx32 = heavykinetic3xset
hgn_vhcannonx33 = heavykinetic3xset
hgn_vhcannonx34 = heavykinetic3xset
hgn_vhcannonx35 = heavykinetic3xset
hgn_vhcannonx36 = heavykinetic3xset
hgn_vhcannonx37 = heavykinetic3xset
hgn_vhcannonx38 = heavykinetic3xset
hgn_vhcannonx39 = heavykinetic3xset
hgn_vhcannonx310 = heavykinetic3xset
hgn_vhcannonx311 = heavykinetic3xset
hgn_vcannon = kinetic2xset
hgn_vcannon1 = kinetic2xset
hgn_vcannon2 = kinetic2xset
hgn_vcannon3 = kinetic2xset
hgn_vcannon4 = kinetic2xset
hgn_vcannon5 = kinetic2xset
hgn_vcannon6 = kinetic2xset
hgn_vcannon7 = kinetic2xset
hgn_vcannon8 = kinetic2xset
hgn_vcannon9 = kinetic2xset
hgn_vcannon10 = kinetic2xset
hgn_vcannon11 = kinetic2xset        
   
Icon_Subsystem_kseth = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600h.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_kset_1600h.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }                        
hgn_vhcannonx6 = heavykinetic6xset    
hgn_vhcannonx61 = heavykinetic6xset
hgn_vhcannonx62 = heavykinetic6xset
hgn_vhcannonx63 = heavykinetic6xset
hgn_vhcannonx64 = heavykinetic6xset
hgn_vhcannonx65 = heavykinetic6xset
hgn_vhcannonx66 = heavykinetic6xset
hgn_vhcannonx67 = heavykinetic6xset
hgn_vhcannonx68 = heavykinetic6xset
hgn_vhcannonx69 = heavykinetic6xset
hgn_vhcannonx610 = heavykinetic6xset
hgn_vhcannonx611 = heavykinetic6xset
        
Icon_Subsystem_k1 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_dk.tga", 
        textureUV_TL = 
            { -30, -49, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }      
        
Icon_Subsystem_lithium = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\vgr_l.tga", 
        textureUV_TL = 
            { -30, -40, }, 
        textureUV_WH = 
            { 290, 275, }, 
        stretchOnDraw = 1, }, }            
        
Icon_Subsystem_rt = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_rt_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_rt_1600.tga", 
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
hgn_ddi_kineticturret1 = suppressor        
hgn_ddi_kineticturret2 = suppressor  
hgn_ddi_kineticturret3 = suppressor
hgn_ddi_kineticturret4 = suppressor 
hgn_ddi_kineticturret_bs = suppressor
hgn_DDI_kineticturret_os = suppressor
hgn_DDI_kineticturret_mv = suppressor
bs1 = suppressor 
bs2 = suppressor 
bs3 = suppressor 
bs4 = suppressor 
bs5 = suppressor 
bs6 = suppressor 
bs7 = suppressor 
bs8 = suppressor 
hgn_railgun1 = railgun
hgn_railgun2 = railgun
hgn_railgun3 = railgun
hgn_railgun4 = railgun
hgn_pulser = pulser2x      
hgn_pulser1 = pulser2x 
hgn_pulser2 = pulser2x 
hgn_pulsers = pulser2x
hgn_pulsers1 = pulser2x 
hgn_pulsers2 = pulser2x 
hgn_pulsers3 = pulser2x 
hgn_pulsers4 = pulser2x 
hgn_pulsers1bc = pulser2x 
hgn_pulsers2bc = pulser2x 
hgn_pulsers3bc = pulser2x 
hgn_pulsers4bc = pulser2x 
hgn_pulserbc1 = pulser2x 
hgn_pulserbc2 = pulser2x 
vgr_cruiserkineticturret = pulser2x
vgr_heavycruiserkineticturret = pulser2x
Icon_Subsystem_KeneticTurret = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\icons_subsystem_1600.tga",
    textureUV_TL = {
      192*2,
      96*2,
    },
    textureUV_WH = {
      128,
      64,
    },
    stretchOnDraw = 1,
  },

}
combatsystem100 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\combatsystem100_1600.tga", 
        textureUV_TL = 
            { -12, -13, }, 
        textureUV_WH = 
            { 268, 118, }, 
        stretchOnDraw = 1, }, }  
combatsystem200 = combatsystem100        
combatsystem300 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\combatsystem300_1600.tga", 
        textureUV_TL = 
            { -12, -13, }, 
        textureUV_WH = 
            { 268, 118, }, 
        stretchOnDraw = 1, }, }          
combatsystem400 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\combatsystem400_1600.tga", 
        textureUV_TL = 
            { -12, -13, }, 
        textureUV_WH = 
            { 268, 118, }, 
        stretchOnDraw = 1, }, }      
combatsystem500 = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\combatsystem500_1600.tga", 
        textureUV_TL = 
            { -12, -13, }, 
        textureUV_WH = 
            { 268, 118, }, 
        stretchOnDraw = 1, }, } 



Icon_Subsystem_Fake = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_fake_1600.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 0, 0, }, 
        stretchOnDraw = 1, },
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_fake_1600.tga", 
         textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 0, 0, }, 
        stretchOnDraw = 1, }, }                
core_navigation_sub = Icon_Subsystem_Fake    
core_harvest_sub = Icon_Subsystem_Fake    
core_defense_sub = Icon_Subsystem_Fake    
core_attack_sub = Icon_Subsystem_Fake    
core_hyperspace_sub = Icon_Subsystem_Fake    
core_build_sub = Icon_Subsystem_Fake    
core_repair_sub = Icon_Subsystem_Fake    
core_cloak_sub = Icon_Subsystem_Fake    
Icon_Subsystem_Subsystem = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_subsystem_1600.tga",
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, },
     SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\icons_subsystem_subsystem_1600.tga",
         textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
Vgr_ArtilleryFrigate = { 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_ArtilleryFrigate.tga",
        textureUV_TL = 
            { -10, -4, }, 
        textureUV_WH = 
            { 260, 121, }, 
        stretchOnDraw = 1, }, }   
Vgr_SupportFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_SupportFrigate.tga",
    textureUV_TL = {
      -14,
      -7,
    },
    textureUV_WH = {
      266,
      136,
    },
    stretchOnDraw = 1,
  },
}
Vgr_SupportFrigate1 = Vgr_SupportFrigate
Vgr_SupportFrigateArmed = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\vgr_supportfrigatearmed.tga",
    textureUV_TL = {
      -7,
      -7,
    },
    textureUV_WH = {
      266,
      104,
    },
    stretchOnDraw = 1,
  },
}
Vgr_SupportFrigateArmed1 = Vgr_SupportFrigateArmed
Vgr_LongRangeArtilleryFrigate = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\vgr_artilleryfrigatenew.tga",
    textureUV_TL = {
      -16,
      -8,
    },
    textureUV_WH = {
      266,
      124,
    },
    stretchOnDraw = 1,
  },
}
Vgr_LongRangeArtilleryFrigate1 = Vgr_LongRangeArtilleryFrigate
Vgr_SupportFrigate_Laser = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Vgr_SupportFrigate_Laser.tga",
    textureUV_TL = {
      -14,
      -16,
    },
    textureUV_WH = {
      276,
      120,
    },
    stretchOnDraw = 1,
  },
}
Vgr_SupportFrigate_Laser1 = Vgr_SupportFrigate_Laser
Vgr_empfrigate = { 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_empfrigate.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 106, }, 
        stretchOnDraw = 1, }, }   
Vgr_commandfrigate = { 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Vgr_commandfrigate.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 106, }, 
        stretchOnDraw = 1, }, } 
Vgr_commandfrigate1 = Vgr_commandfrigate
---tactical reinforcements
tactical_fighter_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_fighter_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_fighter_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_fighter_1e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_1e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_1e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_fighter_2e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_2e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_2e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_fighter_3e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_3e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_fighter_3e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_corvette_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_corvette_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_corvette_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_corvette_1e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_1e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_1e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_corvette_2e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_2e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_2e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_corvette_3e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_3e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_corvette_3e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_frigate_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_frigate_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_frigate_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_frigate_1e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_1e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_1e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_frigate_2e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_2e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_2e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_frigate_3e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_3e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_frigate_3e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_capital_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_capital_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_capital_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_capital_1e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_1e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_1e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_capital_2e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_2e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_2e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_capital_3e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_3e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_capital_3e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_platform_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_platform_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_platform_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_platform_1e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_1e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_1e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_platform_2e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_2e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_2e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_platform_3e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_3e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_platform_3e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_utility_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_utility_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_utility_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_utility_1e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_1e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_1e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_utility_2e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_2e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_2e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
tactical_utility_3e = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_3e.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui/newui/ingameicons/tactical_utility_3e.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
---orders
hgn_orders_parade = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_parade.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_parade.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
hgn_orders_parade_disable = hgn_orders_parade 
hgn_orders_parade_permanent = hgn_orders_parade    
hgn_orders_destroyallguns = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_destroyallguns.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_destroyallguns.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
hgn_orders_evacuation = Icon_Subsystem_Fake           
hgn_orders_fusion = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_fusion.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_fusion.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }    
hgn_orders_fusion_stop = hgn_orders_fusion   
hgn_orders_guard = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_guard.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_guard.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
hgn_orders_reload = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_reload.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_reload.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
hgn_orders_deploy = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_deploy.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_deploy.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
hgn_orders_mechanic = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_mechanic.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_mechanic.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
hgn_orders_unplug = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_unplug.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_unplug.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_orders_dock = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_dock.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_dock.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }      
hgn_orders_aggressive = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_aggressive.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_aggressive.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }           
hgn_orders_defensive = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_defensive.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_defensive.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }           
hgn_orders_passive = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_passive.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_passive.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }    
hgn_orders_strikegroup_fs = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_strikegroup_fs.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_strikegroup_fs.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_orders_strikegroup_cp = hgn_orders_strikegroup_fs  
hgn_orders_strikegroup_fl = hgn_orders_strikegroup_fs     
hgn_orders_hyperspaceinhibitor = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_hyperspaceinhibitor.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_hyperspaceinhibitor.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }                                                                                     
hgn_desorders_lohealth = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_minus15.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_minus15.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_desorders_lospeed = hgn_desorders_lohealth
hgn_desorders_lofire = hgn_desorders_lohealth
hgn_desorders_loaccuracy = hgn_desorders_lohealth
hgn_desorders_losensor = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_minus30.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_minus30.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_desorders_lorepair = hgn_desorders_losensor
hgn_desorders_losecurity = hgn_desorders_losensor
hgn_desorders_hihealth = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_plus15.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_plus15.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_desorders_hispeed = hgn_desorders_hihealth
hgn_desorders_hifire = hgn_desorders_hihealth
hgn_desorders_hiaccuracy = hgn_desorders_hihealth
hgn_desorders_hisensor = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_plus30.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_plus30.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_desorders_hirepair = hgn_desorders_hisensor
hgn_desorders_hisecurity = hgn_desorders_hisensor
hgn_desorders_clear = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_clear.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_desorders_clear.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }

rad_scud_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_scud_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_scud_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_scud_4 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_4.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_4.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_scud_5 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_5.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_5.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_scud_6 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_6.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_6.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_scud_7 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_7.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_scud_7.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }

rad_rc_orders_clear = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_clear.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_clear.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_rc_orders_cloak = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_cloak.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_cloak.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_rc_orders_run = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_run.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_run.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_rc_orders_fight = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_fight.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_fight.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_rc_orders_detonate = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_detonate.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_rc_orders_detonate.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
hgn_orders_clear = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_clear.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_clear.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_clear = hgn_orders_clear
kad_perks_clear1 = hgn_orders_clear
hgn_orders_needle = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_needle.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_needle.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_survivalist = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_survivalist.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_survivalist.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_rage = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_rage.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_rage.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_stealth = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_stealth.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_stealth.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_safefall = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_safefall.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_safefall.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_training = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_training.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_training.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_hitandrun = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_hitandrun.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_hitandrun.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_bounty = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_bounty.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_bounty.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_damagecontrol = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_damagecontrol.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_damagecontrol.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_curse = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_curse.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_curse.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_revealer = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_revealer.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_revealer.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_superheavy = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_superheavy.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_superheavy.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_potential = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_potential.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_potential.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_retreat = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_retreat.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_retreat.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_perks_miracle = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_miracle.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\kad_perks_miracle.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_1 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_2 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_3 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_3.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_3.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_4 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_4.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_4.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_5 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_5.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_5.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_6 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_6.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_6.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_7 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_7.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_7.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_8 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_8.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_8.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_general_help = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_help.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_general_help.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }

rad_xp_smoke = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_smoke.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_smoke.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_smokegrenade = rad_xp_smoke
rad_xp_coffee = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_coffee.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_coffee.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_demoralize = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_demoralize.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_demoralize.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_ambush = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_ambush.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_ambush.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_dog = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_dog.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_dog.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_repulsor = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_repulsor.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_repulsor.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_hijack = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_hijack.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_hijack.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_pointdefense = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_pointdefense.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_pointdefense.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_bodyguard = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_bodyguard.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_bodyguard.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_xp_nuke = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_nuke.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_xp_nuke.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
engine_boost_1_g = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_boost.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_boost.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
engine_boost_2_g = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_boost1.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_boost1.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
engine_boost_3_g = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_boost2.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_boost2.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
engine_boost_container = engine_boost_3_g				
hgn_orders_solarshield = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_solarshield.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_solarshield.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, } 
hgn_orders_remotespaceshield = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_remotespaceshield.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_remotespaceshield.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }   
hgn_orders_gujkingdisable = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_gujkingdisable.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_gujkingdisable.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }     
hgn_orders_gujkingenable = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_gujkingenable.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_gujkingenable.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
hgn_orders_recruit = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_recruit.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_recruit.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }       
hgn_orders_trade = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_trade.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\hgn_orders_trade.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }              				
hgn_tanker_cannon = Icon_Subsystem_KeneticTurret
hgn_tanker_flak = Icon_Subsystem_KeneticTurret
hgn_tanker_pulsar = Icon_Subsystem_KeneticTurret
pir_fasttrackingturret = ftam2x
pir_fasttrackingturretBC = vgr_ftam2x
pir_fasttrackingturret_tank1 = vgr_ftam2x
pir_fasttrackingturret_tank2 = vgr_ftam2x
pir_fasttrackingturret_tank3 = vgr_ftam2x
pir_fasttrackingturret_tank4 = vgr_ftam2x
pir_fasttrackingturret_tank5 = vgr_ftam2x
pir_fasttrackingturret_tank6 = vgr_ftam2x
pir_fasttrackingturret_guardian = vgr_ftam2x
vgr_destroyer_fasttrackingturret5 = vgr_ftam2x
vgr_destroyer_fasttrackingturret6 = vgr_ftam2x
hgn_pds_hm_2xac = ftam2x
hgn_pulseturret = ftam2x
hgn_pulseturretWIDE = ftam2x
hgn_flakturret = ftam2x
hgn_flakturret_nobottom = ftam2x
Hgn_C_Module_DefenseField = Icon_Subsystem_Defensecontrol
Hgn_MS_Module_DefenseField = Icon_Subsystem_Defensecontrol
Hgn_PS_Module_DefenseField = shield
vgr_dreadnaught_shield = shield
pir_c_module_missilebar = shield
Hgn_SY_Module_DefenseField = Icon_Subsystem_Defensecontrol
Hgn_BC_Module_DefenseField = Icon_Subsystem_Defensecontrol
Vgr_C_Module_DefenseField = Icon_Subsystem_Defensecontrol
Vgr_MS_Module_DefenseField = Icon_Subsystem_Defensecontrol
Hgn_MS_Module_DefenseField1 = shield
Hgn_MS_Module_DefenseField2 = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField21 = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField22 = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField23 = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField2_cf = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField2_cf1 = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField2_cf2 = Icon_Subsystem_DefenseField2
Hgn_MS_Module_DefenseField2_cf3 = Icon_Subsystem_DefenseField2

Hgn_MS_Module_Drive = Icon_Subsystem_Drive
Hgn_C_Module_Drive = Icon_Subsystem_Drive
Hgn_LC_Module_Drive = Icon_Subsystem_Drive
Vgr_MS_Module_Drive = Icon_Subsystem_Drive
Vgr_C_Module_Drive = Icon_Subsystem_Drive

Hgn_C_Module_build = Icon_Subsystem_Build
Vgr_C_Module_build = Icon_Subsystem_Build
Hgn_MS_Module_build = Icon_Subsystem_Build
Vgr_MS_Module_build = Icon_Subsystem_Build

--MassDrive = Icon_Subsystem_HyperspaceInhibitor
Hgn_C_Module_Resource = Icon_Subsystem_Dropoff

Hgn_MothershipCannon1 = heavyion3x
Hgn_MothershipCannon2 = heavyion3x
Hgn_MothershipCannon3 = heavyion3x
Hgn_MothershipCannon4 = heavyion3x
hgn_balkancannon = heavyion3x
hgn_battlestationcannon = heavyion3x
hgn_a_balkancannon = heavyion3x
hgn_a_balkancannon1 = heavyion3x

ghost = Hgn_MotherShip

Hgn_C_Module_Repair = Icon_Subsystem_Repair
Vgr_C_Module_Repair = Icon_Subsystem_Repair
Hgn_MS_Module_Repair = Icon_Subsystem_Repair
Vgr_MS_Module_Repair = Icon_Subsystem_Repair

Hgn_MS_Module_Holescrumbler = Icon_Subsystem_Defenseshield
Hgn_MS_Module_defensecontrol = Icon_Subsystem_Defensecontrol
Vgr_MS_Module_holescrumbler = Icon_Subsystem_Defenseshield
Vgr_C_Module_holescrumbler = Icon_Subsystem_Defensecontrol

Hgn_MS_Module_advanceddefensesystem = Icon_Subsystem_advanceddefensesystem
Hgn_MS_Module_DefenseFieldShield = Icon_Subsystem_Defensefieldshield
Hgn_S_Module_DefenseFieldShield = Icon_Subsystem_Defensefieldshield
Hgn_C_Module_DefenseFieldShield = Icon_Subsystem_Defensefieldshield
Hgn_LC_Module_DefenseFieldShield = Icon_Subsystem_Defensefieldshield
Vgr_C_Module_DefenseFieldShield = Icon_Subsystem_Defensefieldshield
Vgr_MS_Module_DefenseFieldShield = Icon_Subsystem_Defensefieldshield
--Hgn_C_Module_DefenseField = Icon_Subsystem_Defenseshield
Hgn_BattleCruiserIonBeamTurret = ion2x
Hgn_BattleCruiserIonBeamTurret1 = ion2x
hgn_iondestroyerturret = ion2x
Hgn_Miner = mine2x
Hgn_Miner1 = mine2x
hgn_minerBS = mine2x
hgn_d_miner = mine2x
hgn_rts_miner = mine2x
hgn_a_miner = mine2x
hgn_a_miner1 = mine2x
hgn_a_mortar = artillery2x
hgn_a_mortar1 = artillery2x
hgn_a_mortar2 = artillery2x
hgn_a_mortar3 = artillery2x
hgn_a_mortar4 = artillery2x
hgn_a_mortar5 = artillery2x
hgn_a_mortar6 = artillery2x
hgn_bc_miner = mine2x
s1 = Icon_Subsystem_Fake
s2 = Icon_Subsystem_Fake
s3 = Icon_Subsystem_Fake
s4 = Icon_Subsystem_Fake
disablehyperspace = Icon_Subsystem_Fake
vgr_ms_armor = Icon_Subsystem_vgrmsarmor
hgn_ms_armor_bottom = Icon_Subsystem_vgrmsarmor
hgn_ms_armor_top = Icon_Subsystem_vgrmsarmor
hgn_ms_armor_bridge = Icon_Subsystem_vgrmsarmor
hgn_ms_armor_engine = Icon_Subsystem_vgrmsarmor
hgn_ms_armor_plates = Icon_Subsystem_vgrmsarmor
Hgn_SMineLayer = mine2x
hgn_cf_miner = mine2x
hgn_cf_miner1 = mine2x
hgn_cf_miner2 = mine2x
hgn_cf_miner3 = mine2x
hgn_cf_miner4 = mine2x
hgn_cf_miner5 = mine2x
hgn_battlecruisercannon = kinetic2x
hgn_battlecruisercannon1 = kinetic2x
hgn_battlecruisercannon2 = kinetic2x
hgn_commandfortresscannon = kinetic2x
hgn_bscannon = kinetic2x
hgn_a_rapid = rapidsweeper4x
hgn_rapidturret = rapidsweeper4x
hgn_rapidturret1 = rapidsweeper4x
hgn_rapidturret2 = rapidsweeper4x
hgn_rapidturret3 = rapidsweeper4x
hgn_rapidturrets = rapidsweeper4x
hgn_rapidturretc1 = rapidsweeper4x
hgn_rapidturretc2 = rapidsweeper4x
hgn_rapidturretc3 = rapidsweeper4x
hgn_rapidturretd = rapidsweeper4x
hgn_kineticburstturret = kinetic2x
hgn_kineticburstturret1 = kinetic2x
hgn_kineticburstturret2 = kinetic2x
hgn_kineticburstturret3 = kinetic2x
hgn_kineticburstturrets = kinetic2x
hgn_kineticburstturretc1 = kinetic2x
hgn_kineticburstturretc2 = kinetic2x
hgn_kineticburstturretc3 = kinetic2x
hgn_kineticburstturrettriple = kinetic3x
hgn_kineticburstturrettriple1 = kinetic3x
hgn_kineticburstturrettriple2 = kinetic3x
hgn_kineticburstturrettriple3 = kinetic3x
hgn_kineticburstturrettriples = kinetic3x
hgn_kineticburstturrettriplec1 = kinetic3x
hgn_kineticburstturrettriplec2 = kinetic3x
hgn_kineticburstturrettriplec3 = kinetic3x
Hgn_HeavyGuidedPlasmaBombTubes = tube2x
Hgn_HeavyGuidedPlasmaBombTubes1 = tube2x
Hgn_HeavyGuidedPlasmaBombTubes2 = tube2x
Hgn_HeavyGuidedPlasmaBombTubesBS = tube2x
Hgn_HeavyGuidedPlasmaBombTubesBSRear = tube2x
Hgn_HeavyGuidedPlasmaBombTubes1BS = tube2x
Hgn_HeavyGuidedPlasmaBombTubes2BS = tube2x
hgn_researchstationnuke = tube2x
hgn_gujkingcannonblaster = emp4x
vgr_ionbeamturret = Icon_Subsystem_ionbattery 
vgr_ionbeamturret1 = Icon_Subsystem_ionbattery 
HGN_SCC_6xAC_Turret = heavykinetic6x
HGN_SCC_6xAC_Turret1 = heavykinetic6x
HGN_SCC_6xAC_Turret_bc = heavykinetic6x
bturret_5_tl5d = heavykinetic6x
turret_1_missile = Icon_Subsystem_TorpedoLauncher
turret_6_ic4d = Icon_Subsystem_ionbattery
turret_6_tl7d = heavykinetic6x
turret_4_10d_ssd = heavykinetic6x
turret_4_10d_lateral_ssd = heavykinetic6x
turret_4_7d_ssd = heavykinetic6x
turret_4_7d_lateral_ssd = heavykinetic6x
launcher_5_lateral = Icon_Subsystem_TorpedoLauncher
Hgn_KineticBurstCannonDestroyer = heavykinetic3x
hgn_destroyercannon = heavykinetic3x
HGN_SCC_3xAC_Turret = heavykinetic3x
HGN_SCC_3xAC_TurretD = heavykinetic3x
HGN_SCC_3xAC_Turret_s1bc = heavykinetic3x
HGN_SCC_3xAC_Turret_s2bc = heavykinetic3x
HGN_SCC_3xAC_Turret_s3bc = heavykinetic3x
HGN_SCC_6xAC_Turret_cf = heavykinetic6x
HGN_SCC_6xAC_Turret_a = heavykinetic6x
HGN_SCC_6xAC_Turret_a1 = heavykinetic6x
HGN_SCC_6xAC_Turret_a2 = heavykinetic6x
HGN_SCC_6xAC_Turret_a3 = heavykinetic6x
HGN_SCC_6xAC_Turret_a4 = heavykinetic6x
HGN_SCC_6xAC_Turret_a5 = heavykinetic6x
HGN_SCC_6xAC_Turret_a6 = heavykinetic6x
HGN_SCC_6xAC_Turret_s = heavykinetic6x
HGN_SCC_6xAC_Turret_s1 = heavykinetic6x
HGN_SCC_6xAC_Turret_s2 = heavykinetic6x
HGN_SCC_6xAC_Turret_s3 = heavykinetic6x
HGN_SCC_6xAC_Turret_s4 = heavykinetic6x
HGN_SCC_6xAC_Turret_s1lr = heavykinetic6x
HGN_SCC_6xAC_Turret_s2lr = heavykinetic6x
HGN_SCC_6xAC_Turret_s3lr = heavykinetic6x
HGN_SCC_6xAC_Turret_s4lr = heavykinetic6x
HGN_SCC_6xAC_Turret_s1bc = heavykinetic6x
HGN_SCC_6xAC_Turret_s2bc = heavykinetic6x
HGN_SCC_6xAC_Turret_s3bc = heavykinetic6x
HGN_SCC_6xAC_Turret_wslr = heavykinetic6x
hgn_destroyercannon_x6 = heavykinetic6x
hgn_torpedo_sentinel = torpedo6x
hgn_torpedo_sentinel1 = torpedo6x
hgn_torpedo_sentinel2 = torpedo6x
hgn_torpedo_sentinel3 = torpedo6x
hgn_torpedo_sentinel4 = torpedo6x
hgn_destroyertorpedosilo1 = torpedo6x
hgn_destroyertorpedosilo1_mv = torpedo6x
hgn_nuclear_sentinel = nuclear1x
hgn_nuclear_sentinel1 = nuclear1x
hgn_nuclear_sentinel2 = nuclear1x
hgn_nuclear_sentinel3 = nuclear1x
hgn_nuclear_sentinel4 = nuclear1x
hgn_nuclear_sentinel1lr = nuclear1x
hgn_nuclear_sentinel2lr = nuclear1x
hgn_nuclear_sentinel3lr = nuclear1x
hgn_nuclear_sentinel4lr = nuclear1x
hgn_nuclear_sentinel_general = nuclear1x
vgr_dt3_turret = vgr_dt3
vgr_dt3_turret1 = vgr_dt3
vgr_dt3_turret2 = vgr_dt3
vgr_dt3_turret_light = vgr_dt3
vgr_dt3_turret_light1 = vgr_dt3
vgr_dt3_turret_tank1 = vgr_dt3
vgr_dt3_turret_tank2 = vgr_dt3
vgr_dt3_turret_tank3 = vgr_dt3
vgr_dt3_turret_tank4 = vgr_dt3
vgr_dt3_turret_tank5 = vgr_dt3
vgr_dt3_turret_tank6 = vgr_dt3
vgr_destroyer_dt3_turret5 = vgr_dt3
vgr_destroyer_dt3_turret6 = vgr_dt3
hgn_ion_sentinel = heavyion3x
hgn_ion_sentinel1 = heavyion3x
hgn_ion_sentinel2 = heavyion3x
hgn_ion_sentinel3 = heavyion3x
hgn_ion_sentinel4 = heavyion3x
hgn_ion_sentinel1bc = heavyion2x
hgn_ion_sentinel2bc = heavyion2x
alos_heavyturret_pulsarx4 = heavyion2x
hgn_heavyion_sentinel1bc = heavyion3x
hgn_heavyion_sentinel2bc = heavyion3x
hgn_D_ionbeamturretHUGE = heavyion3x
hgn_artillery_2x_sentinel_1 = artillery2x
hgn_artillery_2x_sentinel_2 = artillery2x
hgn_artillery_2x_sentinel_3 = artillery2x
hgn_artillery_2x_sentinel_4 = artillery2x
hgn_artillery_2x_ws = artillery2x
hgn_artillery_2x_destroyer = artillery2x
hgn_cruisercannonblaster = artillery2x
hgn_cruisercannonblasterbs1 = artillery2x
hgn_cruisercannonblasterbs2 = artillery2x
hgn_arkcannonblaster = artillery2x
hgn_artillery_2x_sentinel_bsy = artillery2x
hgn_artillery_2x_sentinel_bs = artillery2x
HGN_SCC_6xAC_Turret_cf1 = heavykinetic6x
HGN_SCC_6xAC_Turret_cf2 = heavykinetic6x
HGN_SCC_6xAC_Turret_cf3 = heavykinetic6x
HGN_SCC_6xAC_Turret_cf4 = heavykinetic6x
Hgn_MS_Torpedolauncher1 = torpedo6x
Hgn_MS_Torpedolauncher2 = torpedo6x
Hgn_MS_Torpedolauncher3 = torpedo6x
Hgn_MS_Torpedolauncher4 = torpedo6x
Hgn_MS_Torpedolauncher5 = torpedo6x
Hgn_MS_Torpedolauncher6 = torpedo6x
Hgn_MS_Torpedolauncher7 = torpedo6x
Hgn_MS_Torpedolauncher8 = torpedo6x
Hgn_MS_Torpedolauncher1_cf = torpedo6x
Hgn_A_Torpedolauncher = torpedo6x
hgn_a_torpedo = suppressor
hgn_a_torpedo1 = suppressor
hgn_a_torpedo2 = suppressor
hgn_a_torpedo3 = suppressor
hgn_a_torpedo4 = suppressor
hgn_a_torpedo5 = suppressor
hgn_a_torpedo6 = suppressor
Hgn_V_Torpedolauncher = torpedo6x
Hgn_V_Torpedolauncher1 = torpedo6x
Hgn_V_Torpedolauncher2 = torpedo6x
Hgn_V_Torpedolauncher3 = torpedo6x
hgn_d_torpedolauncher = torpedo6x 
hgn_D_stingerlauncher = torpedo6x
hgn_v_torpedolauncher_general = torpedo6x
hgn_v_torpedolauncher_fast = torpedo6x
Vgr_HeavyCannonTurrets = Icon_Subsystem_k 
Hgn_CF_IonBeamTurret1 = heavyion2x
Hgn_CF_IonBeamTurret2 = heavyion2x
Hgn_CF_IonBeamTurret3 = heavyion2x
Hgn_CF_IonBeamTurret4 = heavyion2x
Hgn_CF_IonBeamTurret5 = heavyion2x
Hgn_CF_IonBeamTurret6 = heavyion2x
Hgn_S_IonBeamTurret1 = heavyion2x
hgn_D_ionbeamturret = heavyion3x
hgn_D_ionbeamturretMEDIUM = heavyion2x
Hgn_CF_rapid1_ms = rapidsweeper4x
Hgn_CF_rapid1 = rapidsweeper4x
Hgn_CF_rapid2 = rapidsweeper4x
Hgn_CF_rapid3 = rapidsweeper4x
Hgn_CF_rapid4 = rapidsweeper4x
Hgn_CF_rapid5 = rapidsweeper4x
Hgn_CF_rapid6 = rapidsweeper4x
Hgn_CF_rapid7 = rapidsweeper4x
Hgn_CF_rapid8 = rapidsweeper4x
hgn_ms_nuclear = nuclear1x
hgn_cf_nuclear = nuclear1x
hgn_cf_nuclear1 = nuclear1x
hgn_cf_nuclear2 = nuclear1x
hgn_s_nuclear = nuclear1x
hgn_s_nuclear1 = nuclear1x
hgn_v_nuclear = nuclear1x
hgn_v_nuclear_crew1 = nuclear1x
hgn_v_nuclear_crew2 = nuclear1x

vgr_destroyer_quadflechette5 = Icon_Subsystem_k
vgr_destroyer_quadflechette6 = Icon_Subsystem_k
vgr_qje_quadflechette_tank1 = Icon_Subsystem_k
vgr_qje_quadflechette_tank2 = Icon_Subsystem_k
vgr_qje_quadflechette_tank3 = Icon_Subsystem_k
vgr_qje_quadflechette_tank4 = Icon_Subsystem_k
vgr_qje_quadflechette_tank5 = Icon_Subsystem_k
vgr_qje_quadflechette_tank6 = Icon_Subsystem_k
vgr_qje_quadflechette_stbdF = Icon_Subsystem_k 
vgr_qje_quadflechette_stbdF1 = Icon_Subsystem_k
vgr_qje_quadflechette_stbdF2 = Icon_Subsystem_k
vgr_qje_quadflechette_stbdF3 = Icon_Subsystem_k
vgr_qje_quadflechette_stbdD = Icon_Subsystem_k 
vgr_qje_quadflechette_stbd = Icon_Subsystem_k 
vgr_qje_quadflechette_stbd1 = Icon_Subsystem_k 
vgr_qje_quadflechette_stbd2 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd3 = Icon_Subsystem_k 
vgr_qje_quadflechette_stbd4 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd5 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd6 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd7 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd8 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd9 = Icon_Subsystem_k
vgr_qje_quadflechette_stbd_cf = Icon_Subsystem_k 
vgr_qje_quadflechette_port = Icon_Subsystem_k
vgr_qje_dualflechette_port = Icon_Subsystem_k1 
vgr_qje_dualflechette_port1 = Icon_Subsystem_k1 
vgr_qje_dualflechette_stbd = Icon_Subsystem_k1 
vgr_qje_dualflechette_stbd1 = Icon_Subsystem_k1 
vgr_qje_quadflechette_stbd_ws = Icon_Subsystem_k
vgr_qje_dualflechette_stbd_ws = Icon_Subsystem_k1
vgr_qje_dualflechette_stbd_pd = Icon_Subsystem_k1
vgr_qje_dualflechette_stbd_pd_l = Icon_Subsystem_k1
vgr_qje_lithiumion_port = Icon_Subsystem_lithium 
vgr_qje_lithiumion_port1 = Icon_Subsystem_lithium 
vgr_qje_lithiumion_stbd = Icon_Subsystem_lithium 
vgr_qje_lithiumion_stbd1 = Icon_Subsystem_lithium 
vgr_qje_lithiumion = Icon_Subsystem_lithium 
vgr_qje_lithiumion_unselectable = Icon_Subsystem_lithium
vgr_frigateturretbc = Icon_Subsystem_lithium
vgr_qje_lithiumion_port_s = Icon_Subsystem_lithium 
vgr_qje_lithiumion_port_s1 = Icon_Subsystem_lithium
vgr_qje_lithiumion_tank1 = Icon_Subsystem_lithium
vgr_qje_lithiumion_tank2 = Icon_Subsystem_lithium
vgr_qje_lithiumion_tank3 = Icon_Subsystem_lithium
vgr_qje_lithiumion_tank4 = Icon_Subsystem_lithium
vgr_qje_lithiumion_tank5 = Icon_Subsystem_lithium
vgr_qje_lithiumion_tank6 = Icon_Subsystem_lithium
modu_casuperfrontt = Icon_Subsystem_k1


Hgn_C_Production_Fighter = Icon_Subsystem_Fighter
Hgn_LC_Production_Fighter = Icon_Subsystem_Fighter
Hgn_MS_Production_Fighter = Icon_Subsystem_Fighter
Hgn_C_Production_Corvette = Icon_Subsystem_Corvette
Hgn_LC_Production_Corvette = Icon_Subsystem_Corvette
Hgn_SC_Production_Corvette = Icon_Subsystem_Corvette
Hgn_MS_Production_Corvette = Icon_Subsystem_Corvette
Hgn_C_Production_Frigate = Icon_Subsystem_Frigate
Hgn_SC_Production_Frigate = Icon_Subsystem_Frigate
Hgn_BSY_Production_Fighter = Icon_Subsystem_Fighter
Hgn_BSY_Production_Corvette = Icon_Subsystem_Corvette
Hgn_BSY_Production_Frigate = Icon_Subsystem_Frigate
Hgn_BSY_Production_CapShip = Icon_Subsystem_CapShip

Hgn_Module_SubSystem = Icon_Subsystem_Subsystem
Hgn_Research = Icon_Subsystem_Research
Hgn_ResearchAdvanced = Icon_Subsystem_ResearchAdvanced
Hgn_Module_Sensor = Icon_Subsystem_Sensor

Hgn_MS_Production_Frigate = Icon_Subsystem_Frigate
Hgn_C_Production_FrigateAdvanced = Icon_Subsystem_FrigateAdvanced
Hgn_MS_Production_FrigateAdvanced = Icon_Subsystem_FrigateAdvanced
Hgn_MS_Production_CapShip = Icon_Subsystem_CapShip
Hgn_SC_Production_Destroyer = Icon_Subsystem_CapShip
Hgn_SY_Production_CapShip = Icon_Subsystem_CapShip
Hgn_MS_Production_CapShipAdvanced = Icon_Subsystem_CapShipAdvanced
Hgn_C_Module_PlatformControl = Icon_Subsystem_PlatformControl
Hgn_MS_Module_PlatformControl = Icon_Subsystem_PlatformControl
Hgn_SY_Module_PlatformControl = Icon_Subsystem_PlatformControl
Hgn_C_Module_Research = Icon_Subsystem_Research
Hgn_MS_Module_Research = Icon_Subsystem_Research
Hgn_C_Module_ResearchAdvanced = Icon_Subsystem_ResearchAdvanced
Hgn_MS_Module_ResearchAdvanced = Icon_Subsystem_ResearchAdvanced
Hgn_C_Module_ResearchAdvanced1 = Icon_Subsystem_ResearchAdvanced1
Hgn_MS_Module_ResearchAdvanced1 = Icon_Subsystem_ResearchAdvanced1

Meg_BalcoraGatePowerGen = Icon_Subsystem_Fake
Hgn_MS_Module_Fake = Icon_Subsystem_Fake
experience = Icon_Subsystem_Fake
lancio = Icon_Subsystem_Fake
weight = Icon_Subsystem_Fake
en = Icon_Subsystem_Fake
canbuildmothership = Icon_Subsystem_Fake
ColpoDiReni = Icon_Subsystem_Fake
distance = Icon_Subsystem_Fake
efficency = Icon_Subsystem_Fake
comm = Icon_Subsystem_Fake
commos = Icon_Subsystem_Fake
hi = Icon_Subsystem_Fake
position = Icon_Subsystem_Fake
ru = Icon_Subsystem_Fake
bay = Icon_Subsystem_Fake
speed = Icon_Subsystem_Fake
jspeed = Icon_Subsystem_Fake
rumining = Icon_Subsystem_Fake
runospeed = Icon_Subsystem_Fake
pilot = Icon_Subsystem_Fake
officer = Icon_Subsystem_Fake
hasminingbase = Icon_Subsystem_Fake
vgr_dreadnaughtengine = Icon_Subsystem_Engine
rad_m_engine = Icon_Subsystem_Engine
rad_vanaarjet_engine = Icon_Subsystem_Engine
rad_qwaarjetii_engine = Icon_Subsystem_Engine
rad_engine_carrier = Icon_Subsystem_Engine
rad_engine_carrierblack = Icon_Subsystem_Engine
rad_engine_cruiser = Icon_Subsystem_Engine
rad_engine_cruiserqueen = Icon_Subsystem_Engine
rad_engine_destroyer = Icon_Subsystem_Engine
rad_engine_merc_battlecruiser = Icon_Subsystem_Engine
rad_engine_merc_cruiser = Icon_Subsystem_Engine
rad_engine_scud = Icon_Subsystem_Engine
rad_engine_refurbisheddestroyer = Icon_Subsystem_Engine
vgr_engine_sinner = Icon_Subsystem_Engine
vgr_engine_am = Icon_Subsystem_Engine
Vgr_wsEngine = Icon_Subsystem_Engine
Vgr_cr_Engine = Icon_Subsystem_Engine
vgr_pulsdes_engine = Icon_Subsystem_Engine
kpr_engine_sajuuk = Icon_Subsystem_Engine
vgr_engine_planetkiller = Icon_Subsystem_Engine
kpr_engine_destroyer = Icon_Subsystem_Engine
kpr_engine_dread = Icon_Subsystem_Engine
kpr_engine_hive = Icon_Subsystem_Engine
kpr_engine_reaver = Icon_Subsystem_Engine
vgr_heavycruiser_engine = Icon_Subsystem_Engine
hgn_bbc_innate_engine = Icon_Subsystem_Engine
kad_engine_templar = Icon_Subsystem_Engine
kad_engine_custodian = Icon_Subsystem_Engine

Hgn_C_Module_Hyperspace = Icon_Subsystem_Hyperspace
Hgn_A_Module_Hyperspace = Icon_Subsystem_Hyperspace
Hgn_LC_Module_Hyperspace = Icon_Subsystem_Hyperspace
Hgn_MS_Module_Hyperspace = Icon_Subsystem_Hyperspace
Hgn_C_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Hgn_MS_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Hgn_C_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Hgn_LC_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Hgn_C_Module_CloakGeneratorBC = Icon_Subsystem_CloakGenerator
Hgn_MS_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Hgn_MS_Module_CloakGeneratorSY = Icon_Subsystem_CloakGenerator
Hgn_C_Module_FireControl = Icon_Subsystem_FireControl
Hgn_MS_Module_FireControl = Icon_Subsystem_FireControl
Hgn_A_Module_FireControl = Icon_Subsystem_FireControl
Hgn_C_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Hgn_LC_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Hgn_SC_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Hgn_MS_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Hgn_C_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Hgn_SC_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Hgn_LC_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Hgn_MS_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
hgn_commandfortress_comunicationfacility = communicationfacility
hgn_commandfortress_defencefacility = Icon_Subsystem_defencefacility
Hgn_ComputerLink = Icon_Subsystem_AdvancedArray
Hgn_ComputerHack = Icon_Subsystem_DetectHyperspace
kad_computerlink = Icon_Subsystem_AdvancedArray
Rad_ComputerLink = Icon_Subsystem_AdvancedArray
Rad_ComputerHack = Icon_Subsystem_DetectHyperspace
kpr_computerlink = Icon_Subsystem_AdvancedArray
Hgn_Fleet = Icon_Fleet
Vgr_Fleet = Icon_Fleet1
Hgn_DefenseControlTower = Icon_Subsystem_Defensecontrol
Hgn_FireControlTower = Icon_Subsystem_FireControl
Hgn_Capital = Icon_Subsystem_CapShip
Vgr_Capital = Icon_Subsystem_CapShip
Hgn_C_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked
Hgn_LC_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked
Hgn_SC_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked
Hgn_MS_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked

Vgr_Ion1 = Icon_Subsystem_c
Vgr_Ion2 = Icon_Subsystem_c
Vgr_Ion3 = Icon_Subsystem_c
Vgr_Ion4 = Icon_Subsystem_c
Vgr_Ion5 = Icon_Subsystem_c
Vgr_Ion6 = Icon_Subsystem_c
vgr_cruiserturret =  Icon_Subsystem_c
vgr_magnetron1 = Icon_Subsystem_c
vgr_magnetron2 = Icon_Subsystem_c
vgr_ion_tank1 = Icon_Subsystem_c
vgr_ion_tank2 = Icon_Subsystem_c
vgr_ion_tank3 = Icon_Subsystem_c
vgr_ion_tank4 = Icon_Subsystem_c
vgr_ion_tank5 = Icon_Subsystem_c
vgr_ion_tank6 = Icon_Subsystem_c
vgr_destroyer_ion5 = Icon_Subsystem_c
vgr_destroyer_ion6 = Icon_Subsystem_c

missile_boxbc = Icon_Subsystem_ppl
missile_box1bc = Icon_Subsystem_ppl
missile_box = Icon_Subsystem_ppl
missile_box1 = Icon_Subsystem_ppl
missile_box2 = Icon_Subsystem_ppl
missile_box3 = Icon_Subsystem_ppl
missile_box4 = Icon_Subsystem_ppl
missile_box5 = Icon_Subsystem_ppl
vgr_pl = Icon_Subsystem_ppl

Vgr_C_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked
Vgr_MS_Sensors_DetectCloaked = Icon_Subsystem_DetectCloaked

Hgn_MS_Production_CorvetteMover = Icon_Subsystem_CorvetteMover
Hgn_C_Engine = Icon_Subsystem_Engine
Hgn_SC_Engine = Icon_Subsystem_Engine
Hgn_BSY_Innate_Engine = Icon_Subsystem_Engine
Hgn_EC = Icon_Subsystem_Engine
Hgn_BS_Engine = Icon_Subsystem_Engine
Hgn_CR_Engine = Icon_Subsystem_Engine
Vgr_CR_Engine = Icon_Subsystem_Engine
Hgn_MS_Innate_Engine = Icon_Subsystem_Engine
Hgn_WS_Innate_Engine = Icon_Subsystem_Engine
Hgn_SY_Innate_Engine = Icon_Subsystem_Engine
Hgn_CVL_Engine = Icon_Subsystem_Engine
Hgn_CVLS_Engine = Icon_Subsystem_Engine
Hgn_Des_Engine = Icon_Subsystem_Engine
Hgn_IonDes_Engine = Icon_Subsystem_Engine
hgn_minibattlecruiserengine = Icon_Subsystem_Engine
Hgn_RS_Engine = Icon_Subsystem_Engine
Hgn_CS_Engine = Icon_Subsystem_Engine
hgn_jugg_engine = Icon_Subsystem_Engine
Hgn_C_Module_Mine = Icon_Subsystem_Resource1
Hgn_MS_Module_Mine = Icon_Subsystem_Resource1
Vgr_C_Module_Mine = Icon_Subsystem_Resource1
Vgr_MS_Module_Mine = Icon_Subsystem_Resource1
Harvest = Icon_Subsystem_Resource1
Fusion = Icon_Subsystem_Resource2
supplyms = Icon_Subsystem_Resource3
supplyms1 = Icon_Subsystem_Resource3
supplyms2 = Icon_Subsystem_Resource3
supplyms3 = Icon_Subsystem_Resource3
supply = Icon_Subsystem_Resource3
Supply1 = Icon_Subsystem_Resource3
Supply2 = Icon_Subsystem_Resource3
Supply3 = Icon_Subsystem_Resource3
Supply4 = Icon_Subsystem_Resource3
Supply5 = Icon_Subsystem_Resource3
SupplyAlt1 = Icon_Subsystem_Resource3
SupplyAlt2 = Icon_Subsystem_Resource3
SupplyAlt3 = Icon_Subsystem_Resource3
SupplyAlt4 = Icon_Subsystem_Resource3
SupplyAlt5 = Icon_Subsystem_Resource3
Hgn_C_Innate_Resource = Icon_Subsystem_Resource
Hgn_SC_Innate_Resource = Icon_Subsystem_Resource
Hgn_MS_Innate_Resource = Icon_Subsystem_Resource
Hgn_SY_Innate_Resource = Icon_Subsystem_Resource
Vgr_C_Production_Fighter = Icon_Subsystem_Fighter
Vgr_BC_Production_Fighter = Icon_Subsystem_Fighter
Vgr_MS_Production_Fighter = Icon_Subsystem_Fighter
Vgr_C_Production_Corvette = Icon_Subsystem_Corvette
Vgr_BC_Production_Corvette = Icon_Subsystem_Corvette
Vgr_MS_Production_Corvette = Icon_Subsystem_Corvette
Vgr_C_Production_Frigate = Icon_Subsystem_Frigate
Vgr_MS_Production_Frigate = Icon_Subsystem_Frigate
Vgr_C_Module_PlatformControl = Icon_Subsystem_PlatformControl
Vgr_MS_Module_PlatformControl = Icon_Subsystem_PlatformControl
Vgr_MS_Production_CapShip = Icon_Subsystem_CapShip
Vgr_SY_Production_CapShip = Icon_Subsystem_CapShip
Vgr_C_Module_Research = Research_Vgr
Vgr_MS_Module_Research = Research_Vgr
rad_ad_bridge = Research_Vgr
Vgr_C_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Vgr_MS_Module_CloakGenerator = Icon_Subsystem_CloakGenerator
Vgr_C_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Vgr_MS_Module_HyperspaceInhibitor = Icon_Subsystem_HyperspaceInhibitor
Vgr_C_Module_FireControl = Icon_Subsystem_FireControl
Vgr_MS_Module_FireControl = Icon_Subsystem_FireControl
Vgr_C_Module_Hyperspace = Icon_Subsystem_Hyperspace
Vgr_MS_Module_Hyperspace = Icon_Subsystem_Hyperspace
Vgr_C_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Vgr_MS_Sensors_AdvancedArray = Icon_Subsystem_AdvancedArray
Vgr_C_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Vgr_MS_Sensors_DetectHyperspace = Icon_Subsystem_DetectHyperspace
Vgr_C_Engine = Icon_Subsystem_Engine
Vgr_C_Innate_Engine = Icon_Subsystem_Engine
Vgr_MS_Innate_Engine = Icon_Subsystem_Engine
Vgr_SY_Innate_Engine = Icon_Subsystem_Engine
vgr_bs_innate_engine = Icon_Subsystem_Engine
vgr_md_innate_engine = Icon_Subsystem_Engine
Vgr_Des_Engine = Icon_Subsystem_Engine
Vgr_C_Innate_Resource = Icon_Subsystem_Resource
Vgr_MS_Innate_Resource = Icon_Subsystem_Resource
Vgr_SY_Innate_Resource = Icon_Subsystem_Resource
Hgn_CivilModule1 = Icon_Subsystem_Civil
Hgn_CivilModule2 = Icon_Subsystem_Civil
Hgn_CivilModule3 = Icon_Subsystem_Civil
Hgn_CivilModule4 = Icon_Subsystem_Civil
Hgn_CivilModule5 = Icon_Subsystem_Civil
Hgn_CivilModule6 = Icon_Subsystem_Civil
Hgn_CivilModule7 = Icon_Subsystem_Civil
Hgn_CivilModule8 = Icon_Subsystem_Civil
rad_CivilModule1 = Icon_Subsystem_Civil
rad_CivilModule2 = Icon_Subsystem_Civil
rad_CivilModule3 = Icon_Subsystem_Civil
rad_CivilModule4 = Icon_Subsystem_Civil
rad_CivilModule5 = Icon_Subsystem_Civil
rad_CivilModule6 = Icon_Subsystem_Civil
Hgn_PilotModule = Icon_Subsystem_Pilot
Hgn_PilotModule1 = Icon_Subsystem_Pilot
Hgn_PilotModule2 = Icon_Subsystem_Pilot
Hgn_PilotModule3 = Icon_Subsystem_Pilot
Hgn_PilotModule4 = Icon_Subsystem_Pilot
Hgn_PilotModule5 = Icon_Subsystem_Pilot
Hgn_OfficerModule = Icon_Subsystem_Officer
Hgn_OfficerModule1 = Icon_Subsystem_Officer
Hgn_OfficerModule2 = Icon_Subsystem_Officer
Hgn_OfficerModule3 = Icon_Subsystem_Officer
Hgn_OfficerModule4 = Icon_Subsystem_Officer
Hgn_Scout1 = Hgn_Scout
Hgn_AttackBomber1 = Hgn_AttackBomber
Hgn_AttackBomberHeavy1 = Hgn_AttackBomberHeavy
Hgn_Defender1 = Hgn_Defender
Hgn_LBomber1 = Hgn_LBomber
hgn_strategicbomber1 = hgn_strategicbomber
Hgn_RailgunFighter1 = Hgn_RailgunFighter
Hgn_HFT1 = Hgn_HFT
Hgn_Interceptor1 = Hgn_Interceptor
Hgn_AttackBomberl1 = Hgn_AttackBomberl
Hgn_AttackBomberHeavyl1 = Hgn_AttackBomberHeavyl
Hgn_LBomberl1 = Hgn_LBomberl
hgn_strategicbomberl1 = hgn_strategicbomberl
Hgn_RailgunFighterl1 = Hgn_RailgunFighterl
Hgn_HFTl1 = Hgn_HFTl
Hgn_Interceptorl1 = Hgn_Interceptorl
Hgn_AssaultCorvette1 = Hgn_AssaultCorvette
Hgn_PulsarCorvette1 = Hgn_PulsarCorvette
Hgn_MinelayerCorvette1 = Hgn_MinelayerCorvette
Hgn_multiguncorvette1 = Hgn_multiguncorvette
Hgn_cth1 = Hgn_cth
Hgn_cthion1 = Hgn_cthion
Hgn_AssaultCorvettel1 = Hgn_AssaultCorvettel
Hgn_PulsarCorvettel1 = Hgn_PulsarCorvettel
Hgn_multiguncorvettel1 = Hgn_multiguncorvettel
Hgn_cthl1 = Hgn_cthl
Hgn_cthionl1 = Hgn_cthionl
Hgn_AssaultFrigate1 = Hgn_AssaultFrigate
Hgn_TorpedoFrigate1 = Hgn_TorpedoFrigate
Hgn_lrms1 = Hgn_lrms
Hgn_MarineFrigate1 = Hgn_MarineFrigate
Hgn_DefenseFieldFrigate1 = Hgn_DefenseFieldFrigate
Hgn_IonCannonFrigate1 = Hgn_IonCannonFrigate
Hgn_Tulwar1 = Hgn_Tulwar
Hgn_Destroyer1 = Hgn_Destroyer
Hgn_DestroyerIcon = Hgn_Destroyer
Hgn_CruiserIcon = Hgn_CruiserA
Hgn_PlatformIcon = Hgn_GunTurret
Hgn_MissileDestroyer1 = Hgn_MissileDestroyer
Hgn_IonDestroyer1 = Hgn_IonDestroyer
Hgn_AdvDestroyer1 = Hgn_AdvDestroyer
Hgn_ArtilleryDestroyer1 = Hgn_ArtilleryDestroyer
Hgn_Juggernaught1 = Hgn_Juggernaught
Hgn_Carrier1 = Hgn_Carrier
Hgn_Scaver1 = Hgn_Scaver
Hgn_LightCarrier1 = Hgn_LightCarrier
hgn_researchstation1 = hgn_researchstation
hgn_vortex1 = hgn_vortex
meg_veildebris_chunk2 = meg_veildebris_chunk1
meg_veildebris_chunk3 = meg_veildebris_chunk1
meg_veildebris_chunk4 = meg_veildebris_chunk1
meg_veildebris_chunk5 = meg_veildebris_chunk1
hgn_commandfortress1 = hgn_commandfortress
vgr_commandfortress1 = vgr_commandfortress
vgr_commstation_custom = vgr_commandfortress
Hgn_Shipyard1 = Hgn_Shipyard
Hgn_BattleCruiser1 = Hgn_BattleCruiser
Hgn_BattleShip1 = Hgn_BattleShip
Hgn_HyperspaceStation1 = Hgn_HyperspaceStation
Hgn_Tanker1 = Hgn_Tanker
Hgn_GunTurret1 = Hgn_GunTurret
Hgn_PulsarTurret1 = Hgn_PulsarTurret
Hgn_ionturret1 = Hgn_ionturret
Hgn_missileturret1 = Hgn_missileturret
Hgn_rts1 = Hgn_rts
Hgn_GunTurret_ai = Hgn_GunTurret
Hgn_PulsarTurret_ai = Hgn_PulsarTurret
Hgn_ionturret_ai = Hgn_ionturret
Hgn_TangoMine1 = Hgn_tangomine
Hgn_TangoMinec = Hgn_tangomine
Hgn_TangoMines = Hgn_tangomine
Hgn_TangoMinec1 = Hgn_tangomine
Hgn_TangoMines1 = Hgn_tangomine
Hgn_TransportCell1 = Hgn_TransportCell
evacuation = evacuation
evac = evacuation
Hgn_viper1 = Hgn_viper
Hgn_viper_ws = Hgn_viper
Hgn_viper_ws1 = Hgn_viper
Hgn_ResourceCollector1 = Hgn_ResourceCollector
Hgn_ResourceController1 = Hgn_ResourceController

Vgr_MineContainer = Hgn_MineContainer
Vgr_Scout1 = Vgr_Scout
Vgr_Interceptor1 = Vgr_Interceptor
Vgr_Bomber1 = Vgr_Bomber
Vgr_Defender1 = Vgr_Defender
Vgr_LanceFighter1 = Vgr_LanceFighter
Vgr_MissileCorvette1 = Vgr_MissileCorvette
Vgr_LaserCorvette1 = Vgr_LaserCorvette
Vgr_MinelayerCorvette1 = Vgr_MinelayerCorvette
Vgr_Standvette1 = Vgr_Standvette
Vgr_CommandCorvette1 = Vgr_CommandCorvette
Vgr_MultiLanceCorvette1 = Vgr_MultiLanceCorvette
Vgr_AssaultFrigate1 = Vgr_AssaultFrigate
Vgr_HeavyMissileFrigate1 = Vgr_HeavyMissileFrigate
Vgr_InfiltratorFrigate1 = Vgr_InfiltratorFrigate
Vgr_MarineFrigate1 = Vgr_MarineFrigate
Vgr_ArtilleryFrigate1 = Vgr_ArtilleryFrigate
Vgr_empfrigate1 = Vgr_empfrigate
Vgr_Destroyer1 = Vgr_Destroyer
Vgr_Cruiser1 = vgr_cruiser
Vgr_Carrier1 = Vgr_Carrier
Vgr_ShipYard1 = Vgr_ShipYard
Vgr_BattleCruiser1 = Vgr_BattleCruiser
vgr_alkhalid1 = vgr_alkhalid
Vgr_Dreadnaught1 = Vgr_Dreadnaught 
Vgr_WeaponPlatform_gun1 = Vgr_WeaponPlatform_gun
Vgr_WeaponPlatform_lance1 = Vgr_WeaponPlatform_lance
Vgr_WeaponPlatform_missile1 = Vgr_WeaponPlatform_missile
Vgr_WeaponPlatform_gun_ai = Vgr_WeaponPlatform_gun
Vgr_WeaponPlatform_missile_ai = Vgr_WeaponPlatform_missile
Vgr_HyperSpace_Platform1 = Vgr_HyperSpace_Platform 
Vgr_ResourceCollector1 = Vgr_ResourceCollector
Vgr_ResourceController1 = Vgr_ResourceController
Vgr_HeavyFighter1 = Vgr_HeavyFighter

HGN_SHIPYARD_SPG = Hgn_Shipyard
HGN_BATTLECRUISERENGINE = Icon_Subsystem_Engine
VGR_MISSILEBATTLECRUISERENGINE = Icon_Subsystem_Engine
hgn_ec = Icon_Subsystem_Engine
--HGN_BATTLECRUISERIONBEAMTURRET = Icon_Subsystem_IonTurret
VGR_BATTLECRUISERENGINE = Icon_Subsystem_Engine
VGR_QJE_ENGINE = Icon_Subsystem_Engine
VGR_HEAVYFUSIONMISSILELAUNCHERBC = Icon_Subsystem_TorpedoLauncher
VGR_HEAVYFUSIONMISSILELAUNCHERMBC = Icon_Subsystem_TorpedoLauncher
VGR_HEAVYFUSIONMISSILELAUNCHERMBCFAKE = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcmine = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmall = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmall1 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallSY = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallMS1 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallMS2 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallMS3 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallMS4 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallMS5 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmallMS6 = Icon_Subsystem_TorpedoLauncher
vgr_heavyfusionmissilelauncherbcsmall_titan = Icon_Subsystem_TorpedoLauncher
rad_missileturret = Icon_Subsystem_TorpedoLauncher
rad_booster = Icon_Subsystem_Engine
ksh_sec_destroyer_missilelauncher = Icon_Subsystem_TorpedoLauncher
alos_missileturretx4 = Icon_Subsystem_TorpedoLauncher
VGR_DREADNAUGHT_MISSILE = Icon_Subsystem_TorpedoLauncher
VGR_HYPERSPACEINHIBITOR = Icon_Subsystem_HyperspaceInhibitor
MEG_ASTEROID_NOSUBS = Meg_Asteroid
MEG_ASTEROIDMP = Meg_Asteroid
VGR_COMMSTATION_SUBSTATION = Icon_Subsystem_CommStation_bottom
VGR_COMMSTATION_SUBSTATION_M10 = Icon_Subsystem_CommStation_bottom
KPR_DESTROYERM10 = Kpr_Destroyer
Meg_Gehenna_1 = Meg_Gehenna
Meg_Gehenna_2 = Meg_Gehenna
Meg_Gehenna_3 = Meg_Gehenna
Meg_Gehenna_4 = Meg_Gehenna
Meg_Gehenna_5 = Meg_Gehenna
Meg_Gehenna_6 = Meg_Gehenna
Meg_Gehenna_7 = Meg_Gehenna
Meg_Gehenna_1ctm = Meg_Gehenna
Meg_Gehenna_3ctm = Meg_Gehenna
Hgn_drone_frigate = Hgn_Torpedofrigate
Hgn_drone_frigate_2 = Hgn_Assaultfrigate
Hgn_drone_frigate_3 = Hgn_Marinefrigate
Kpr_Mover_Capture = Kpr_Mover_Capture
Meg_Bentus_Ruined = Meg_Bentus_Ruin_1
powerup_ru_unlocker = Icon_Subsystem_Fake
powerup_speed_unlocker = Icon_Subsystem_Fake
powerup_defense_unlocker = Icon_Subsystem_Fake
powerup_attack_unlocker = Icon_Subsystem_Fake
powerup_build_unlocker = Icon_Subsystem_Fake
powerup_sensor_unlocker = Icon_Subsystem_Fake
hgn_monitor_ptrt = Icon_Subsystem_Fake
powerup_repair_unlocker = Icon_Subsystem_Fake

hgn_aircombat =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\aircombat.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 378, 134, }, 
        stretchOnDraw = 1, }, }
vgr_aircombat = hgn_aircombat
kad_aircombat = hgn_aircombat
rad_aircombat = hgn_aircombat
kpr_aircombat = hgn_aircombat


--newly introduced

kpr_choose =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_choose.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 378, 134, }, 
        stretchOnDraw = 1, }, } 
kpr_specialpower = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_specialpower.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kpr_specialpower_blackhole = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_specialpower_blackhole.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kpr_ab_blackhole = kpr_specialpower_blackhole
kpr_specialpower_dimensionattack = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_specialpower_dimensionattack.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kpr_ab_am = kpr_specialpower_dimensionattack
kpr_specialpower_gammarayburst = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_specialpower_gammarayburst.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kpr_ab_nuke = kpr_specialpower_gammarayburst
kpr_specialpower_inertiadrive = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_specialpower_inertiadrive.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kpr_ab_inertia = kpr_specialpower_inertiadrive
kpr_specialpower_lightgranule = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_lightgranule.tga", 	--kpr_specialpower_lightgranule
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }
kpr_ab_particle = kpr_specialpower_lightgranule
kpr_specialpower_repulsor = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kpr_specialpower_repulsor.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kpr_ab_repulsor = kpr_specialpower_repulsor
kpr_lightgranule = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_lightgranule.tga",
        textureUV_TL = 
            { -17, -6, }, 
        textureUV_WH = 
            { 272, 122, }, 
        stretchOnDraw = 1, 
     }, 
}
test_tester = kpr_lightgranule
kpr_awaken = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\marauder.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 304, 94, }, 
        stretchOnDraw = 1, }, }
Kpr_Interceptor = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\Kpr_Interceptor.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
Kpr_Interceptor_old = Kpr_Interceptor
kpr_interceptor_old1 = Kpr_Interceptor

kpr_dronestruct = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_dronestruct.tga",
        textureUV_TL = 
            { -20, -28, }, 
        textureUV_WH = 
            { 260, 298, }, 
        stretchOnDraw = 1, }, }
kpr_dronestruct1 = kpr_dronestruct

kpr_attackdroid_combo = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\kpr_attackdroid_combo.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
kpr_attackdroid_combo1 = kpr_attackdroid_combo
kpr_interceptor_combo = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\kpr_interceptor_combo.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
kpr_interceptor_combo1 = kpr_interceptor_combo
kpr_attackdroid_agitator = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\kpr_attackdroid_agitator.tga",
    textureUV_TL = {
      -13,
      -18,
    },
    textureUV_WH = {
      266,
      130,
    },
    stretchOnDraw = 1,
  },
}
kpr_attackdroid_agitator1 = kpr_attackdroid_agitator
Kpr_deciever = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_deciever.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
Kpr_deciever1 = Kpr_deciever
kpr_hive = 
{ 
     LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_hive.tga",
        textureUV_TL = 
            { -10, -22, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
kpr_hive1 = kpr_hive
Kpr_Hunter = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Hunter.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
kpr_hunter1 = Kpr_Hunter
        
kpr_guardian = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_guardian.tga",
        textureUV_TL = 
            { -10, -10, }, 
        textureUV_WH = 
            { 260, 126, }, 
        stretchOnDraw = 1, }, }
kpr_guardian1 = kpr_guardian
        
Kpr_Seeker = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Seeker.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
kpr_seeker1 = Kpr_Seeker

kpr_marauder = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_marauder.tga",
        textureUV_TL = 
            { -25, -33, }, 
        textureUV_WH = 
            { 260, 270, }, 
        stretchOnDraw = 1, }, }
kpr_marauder1 = kpr_marauder

kpr_meddler = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_meddler.tga",
        textureUV_TL = 
            { -25, -33, }, 
        textureUV_WH = 
            { 260, 270, }, 
        stretchOnDraw = 1, }, }
kpr_meddler1 = kpr_meddler

Kpr_Sentinel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Sentinel.tga",
        textureUV_TL = 
            { -25, -33, }, 
        textureUV_WH = 
            { 260, 270, }, 
        stretchOnDraw = 1, }, }
Kpr_Sentinel1 = Kpr_Sentinel
Kpr_Carrier = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Carrier.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 512, 237, }, 
        stretchOnDraw = 1, }, }
Kpr_Carrier_Old = Kpr_Carrier
kpr_carrier1 = Kpr_Carrier
Kpr_Reaver = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Reaver.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 512, 237, }, 
        stretchOnDraw = 1, }, }
Kpr_Reaver_Old = Kpr_Reaver
kpr_reaver1 = Kpr_Reaver

kpr_resourcecontroller_Old = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\caretaker.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 304, 94, }, 
        stretchOnDraw = 1, }, }
kpr_resourcecontroller =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_resourcecontroller.tga",
        textureUV_TL = 
            { -20, -40, }, 
        textureUV_WH = 
            { 260, 167, }, 
        stretchOnDraw = 1, }, }
kpr_resourcecontroller1 = kpr_resourcecontroller

kpr_ressourcecollector = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\collector.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 304, 94, }, 
        stretchOnDraw = 1, }, }
kpr_ressourcecollector_Old = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_ressourcecollector_Old.tga",
        textureUV_TL = 
            { -25, -33, }, 
        textureUV_WH = 
            { 260, 270, }, 
        stretchOnDraw = 1, }, }

kpr_resourcecollector = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_resourcecollector.tga",
        textureUV_TL = 
            { -20, -17, }, 
        textureUV_WH = 
            { 260, 167, }, 
        stretchOnDraw = 1, }, }
kpr_resourcecollector1 = kpr_resourcecollector

kpr_probe = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kpr_probe.tga",
        textureUV_TL = 
            { -25, -33, }, 
        textureUV_WH = 
            { 260, 270, }, 
        stretchOnDraw = 1, }, }
kpr_probe_Old = kpr_probe

rad_elitefighter = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_elitefighter.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }

Rad_Interceptor = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Rad_Interceptor.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
rad_interceptor1 = Rad_Interceptor

Rad_Interceptor_Black = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Rad_Interceptor_Black.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
rad_interceptor_black1 = Rad_Interceptor_Black

rad_fencer = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_fencer.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
		
rad_bomber =
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_bomber.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
		
rad_guncorvette =
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_guncorvette.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }

rad_missilecorvette =
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_missilecorvette.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
		
rad_scoutcorvette =
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_scoutcorvette.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
		
rad_gunfrigate =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_gunfrigate.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
rad_gunfrigate_morgan =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_gunfrigate_morgan.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
		
rad_beamfrigate =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_beamfrigate.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }

rad_missilefrigate = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_missilefrigate.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
rad_gattlingfrigate = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_gattlingfrigate.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
rad_resourcecontroller =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_resourcecontroller.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }

rad_resourcecollector =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_resourcecollector.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }

rad_destroyer =
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_destroyer.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }

rad_destroyerscaffoldA = rad_destroyer

rad_techlevel = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\rad_techlevel.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 304, 94, }, 
        stretchOnDraw = 1, }, }	
        
rad_techlevelability = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\rad_specialabilities.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 304, 94, }, 
        stretchOnDraw = 1, }, }	

rad_mothership = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_mothership.tga",
        textureUV_TL = 
            { -32, 38, }, 
        textureUV_WH = 
            { 540, 226, },
        stretchOnDraw = 1, }, }

rad_carrier = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_carrier.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }

rad_scud = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_scud.tga",
        textureUV_TL = 
            { -30, -17, }, 
        textureUV_WH = 
            { 512, 237, }, 
        stretchOnDraw = 1, }, }
rad_scudscaffolda = rad_scud
rad_scudscaffolda1 = rad_scud

rad_merc_battlecruiser = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_battlecruiser.tga",
        textureUV_TL = 
            { -55, -41, }, 
        textureUV_WH = 
            { 560, 560, }, 
        stretchOnDraw = 1, }, }

rad_merc_cruiser = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_cruiser.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }
		
rad_merc_frigate = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_frigate.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
        
rad_merc_frigateadv =  {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\rad_merc_frigateadv.tga",
    textureUV_TL = {
      -14,
      -20,
    },
    textureUV_WH = {
      266,
      136,
    },
    stretchOnDraw = 1,
  },
}

rad_merc_ioncannonfrigate =  {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\rad_merc_ioncannonfrigate.tga",
    textureUV_TL = {
      -14,
      -20,
    },
    textureUV_WH = {
      266,
      136,
    },
    stretchOnDraw = 1,
  },
}

rad_merc_corvette = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_corvette.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }

rad_merc_scout = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_scout.tga",
        textureUV_TL = 
            { -18, -19, }, 
        textureUV_WH = 
            { 256, 164, }, 
        stretchOnDraw = 1, }, }

rad_merc_fighter = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_fighter.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
        
rad_merc_interceptor = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_interceptor.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
        
rad_merc_bomber = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_merc_bomber.tga",
        textureUV_TL = 
            { -17, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
        
rad_empcorvette = {
  LargeIcon = {
    texture = "DATA:\\Ship\\Icons\\Ships\\rad_empcorvette.tga",
    textureUV_TL = {
      -10,
      -33,
    },
    textureUV_WH = {
      266,
      125,
    },
    stretchOnDraw = 1,
  },
}

rad_jackal = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_jackal.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
rad_jackal1 = rad_jackal

rad_explotrap = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_explotrap.tga",
        textureUV_TL = 
            { -41, -18, }, 
        textureUV_WH = 
            { 291, 250, }, 
        stretchOnDraw = 1, }, }
        
rad_guntrap = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_guntrap.tga",
        textureUV_TL = 
            { -41, -18, }, 
        textureUV_WH = 
            { 291, 250, }, 
        stretchOnDraw = 1, }, }
        
rad_gravwel = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_gravwel.tga",
        textureUV_TL = 
            { -41, -18, }, 
        textureUV_WH = 
            { 291, 250, }, 
        stretchOnDraw = 1, }, }
        
rad_hsbouey = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\rad_hsbouey.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 304, 94, }, 
        stretchOnDraw = 1, }, }
        
rad_powerstation = hgn_aditional_core

rad_blackmarket = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_blackmarket.tga",
        textureUV_TL = 
            { -41, -45, }, 
        textureUV_WH = 
            { 522, 497, }, 
        stretchOnDraw = 1, }, }
rad_blackmarket1 = rad_blackmarket

rad_helios = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_helios.tga",
        textureUV_TL = 
            { -10, -4, }, 
        textureUV_WH = 
            { 260, 121, }, 
        stretchOnDraw = 1, }, } 
rad_helios1 = rad_helios
rad_refurbisheddestroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_refurbisheddestroyer.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  
rad_refurbisheddestroyer1 = rad_refurbisheddestroyer

rad_vanaarjet =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_vanaarjet.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  
rad_vanaarjet1 = rad_vanaarjet

rad_qwaarjetii =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_qwaarjetii.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 527, 210, }, 
        stretchOnDraw = 1, }, }  
rad_qwaarjetii1 = rad_qwaarjetii

rad_armsdealer = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_armsdealer.tga",
        textureUV_TL = 
            { -10, -4, }, 
        textureUV_WH = 
            { 260, 121, }, 
        stretchOnDraw = 1, }, } 
rad_armsdealer1 = rad_armsdealer

rad_carrier_black = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_carrier_black.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }
		
rad_scaffoldB = rad_carrier_black
		
rad_scaffoldA = rad_carrier

rad_cruiser = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_cruiser.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }
		
rad_CruiserscaffoldA = rad_cruiser

rad_cruiser_queen = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_cruiser_queen.tga",
        textureUV_TL = 
            { -15, -16, }, 
        textureUV_WH = 
            { 527, 215, }, 
        stretchOnDraw = 1, }, }
        
rad_cruiser_queenscaffolda = rad_cruiser_queen
	
kpr_capitalplasmacannon_old =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\dreadnaughtchinturret.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
kpr_capitalioncannon_old =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\ion_gun_kpr.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
			{ 96, 59, }, 
        stretchOnDraw = 1, }, 
    SmallIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\ion_gun_kpr.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 96, 59, }, 
        stretchOnDraw = 1, }, }		

kad_ascensionperks = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kad_ascensionperks.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 384, 192, }, 
        stretchOnDraw = 1, }, }	
kad_custodian = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_custodian.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 557, 210, }, 
        stretchOnDraw = 1, }, }
kad_custodian1 = kad_custodian
Kad_Destroyer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kad_Destroyer.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 557, 210, }, 
        stretchOnDraw = 1, }, }
kad_destroyer1 = Kad_Destroyer
Kad_Destroyer_Real = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kad_Destroyer_Real.tga",
        textureUV_TL = 
            { -14, -39, }, 
        textureUV_WH = 
            { 557, 210, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_real1 = Kad_Destroyer_Real
Kad_Needleship = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kad_Needleship.tga",
        textureUV_TL = 
            { -16, -13, }, 
        textureUV_WH = 
            { 542, 210, }, 
        stretchOnDraw = 1, }, }
kad_needleship1 = Kad_Needleship
kad_swarmer_new = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_swarmer_new.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_swarmer_blood = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_swarmer_blood.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_snail = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_snail.tga",
        textureUV_TL = 
            { -41, -18, }, 
        textureUV_WH = 
            { 291, 250, }, 
        stretchOnDraw = 1, }, }
kad_nebuladrone = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_nebuladrone.tga",
        textureUV_TL = 
            { -41, -18, }, 
        textureUV_WH = 
            { 291, 250, }, 
        stretchOnDraw = 1, }, }
kad_ressourcecollector = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_ressourcecollector.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
kad_swarmer_zealot = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_swarmer_zealot.tga",
        textureUV_TL = 
            { -14, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_swarmer_crusader = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_swarmer_crusader.tga",
        textureUV_TL = 
            { -14, -13, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_heavyswarmer_new = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_heavyswarmer_new.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_pulsarswarmer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_pulsarswarmer.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_advancedswarmer = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_advancedswarmer.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_advancedswarmer_old = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_advancedswarmer_old.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_swarmer_ghost = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_swarmer_ghost.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_swarmer_hybrid = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_swarmer_hybrid.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
		
kad_pod_ghost = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_pod_ghost.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_frig_ghost = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_frig_ghost.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
kad_podship = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_podship.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
kad_selectprimary = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kadprimary.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 378, 134, }, 
        stretchOnDraw = 1, }, } 
kad_selectsecondary = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kadsecondary.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 378, 134, }, 
        stretchOnDraw = 1, }, } 
kad_selecbelief =
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\PTV\\kadbelief.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 378, 134, }, 
        stretchOnDraw = 1, }, } 
kad_multibeam =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_multibeam.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
kad_multibeam_new =
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_multibeam_new.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
		
		
kad_multigun = 
{
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_multigun.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
kad_gunpod = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_gunpod.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_ionpod = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_ionpod.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_sensorpod = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_sensorpod.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_prayerpod = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_prayerpod.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }
kad_missilepod = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_missilepod.tga",
        textureUV_TL = 
            { -14, -19, }, 
        textureUV_WH = 
            { 260, 140, }, 
        stretchOnDraw = 1, }, }

Icon_Fleet_Kad = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_fleet.tga", 
        textureUV_TL = 
            { -9, 13, }, 
        textureUV_WH = 
            { 159, 95, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_fleet.tga",   
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
Icon_Fleet_Rad = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_fleet.tga", 
        textureUV_TL = 
            { -9, 13, }, 
        textureUV_WH = 
            { 159, 95, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_fleet.tga",   
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
Icon_Fleet_Kpr = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Fleet.tga", 
        textureUV_TL = 
            { -9, 13, }, 
        textureUV_WH = 
            { 159, 95, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\Kpr_Fleet.tga",   
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }

kpr_ms_fighter = Icon_Subsystem_Corvette
kpr_c_corvette = Icon_Subsystem_Corvette
KPR_C_FIGHTER  = Icon_Subsystem_Corvette
kpr_ms_frigate = Icon_Subsystem_Frigate
kpr_c_frigate = Icon_Subsystem_Frigate
KPR_C_autonom  = Icon_Subsystem_Frigate
kpr_ms_capital = Icon_Subsystem_CapShip
kpr_c_capital = Icon_Subsystem_CapShip
kpr_c_fighter_brown = Icon_Subsystem_Research
kpr_c_hyperspace = Icon_Subsystem_Hyperspace
kpr_c_disruptor = Icon_Subsystem_HyperspaceInhibitor
kpr_c_disruptor_brown = Icon_Subsystem_HyperspaceInhibitor
kad_avatar_prayerpod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_avatar_prayerpod.tga", 
        textureUV_TL = 
            { -31, -60, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }
kad_needle_prayerpod = kad_avatar_prayerpod
kad_needle_progenarmor = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_needle_progenarmor.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 256, 57, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_needle_progenarmor.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_avatar_progenarmor = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_avatar_progenarmor.tga", 
        textureUV_TL = 
            { -10, 5, }, 
        textureUV_WH = 
            { 256, 39, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_avatar_progenarmor.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kad_podship_heretic = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_podship_heretic.tga", 
        textureUV_TL = 
            { -31, -43, }, 
        textureUV_WH = 
            { 290, 270, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_inquisitionpod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_inquisitionpod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_largepod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_largepod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_multipod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_multipod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_sensorpod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_sensorpod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_demopod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_demopod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_nebulapod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_nebulapod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_gunpod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_gunpod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_superpod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_superpod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_destroyer_ionpod = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_destroyer_ionpod.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_needle_ion = kad_destroyer_ionpod
kad_needle_ion0 = kad_destroyer_ionpod
kad_needle_ion1 = kad_destroyer_ionpod
kad_needle_ion2 = kad_destroyer_ionpod
kad_needle_ion3 = kad_destroyer_ionpod
kpr_c_sensor = Icon_Subsystem_FireControl
kpr_c_powercap =  Icon_Subsystem_FireControl
kad_needle_frig = Icon_Subsystem_Frigate
kad_needle_engine = Icon_Subsystem_Engine
kad_destroyer_engine = Icon_Subsystem_Engine
kad_needle_corvette = Icon_Subsystem_Corvette
kad_needle_figurehead = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_needle_figurehead.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_needle_figurehead0 = kad_needle_figurehead
kad_needle_figurehead1 = kad_needle_figurehead
kad_needle_figurehead2 = kad_needle_figurehead
kad_needle_figurehead3 = kad_needle_figurehead
kad_podship_corvette = Icon_Subsystem_Corvette
kad_needle_fighter = Icon_Subsystem_Fighter
kad_podship_fighter = Icon_Subsystem_Fighter
rad_cruiserbeamturret = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_cruiserbeamturret.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_rd1_1 = rad_cruiserbeamturret
rad_rd1_2 = rad_cruiserbeamturret
rad_rd1_3 = rad_cruiserbeamturret
rad_rd1_4 = rad_cruiserbeamturret
rad_rd1_5 = rad_cruiserbeamturret
rad_rd1_6 = rad_cruiserbeamturret
rad_rd2_1 = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_rd2_1.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_rd2_2 = rad_rd2_1
rad_rd2_3 = rad_rd2_1
rad_rd2_4 = rad_rd2_1
rad_rd2_5 = rad_rd2_1
rad_rd2_6 = rad_rd2_1
rad_rd3_1 = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_rd3_1.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_rd3_2 = rad_rd3_1
rad_rd3_3 = rad_rd3_1
rad_rd3_4 = rad_rd3_1
rad_rd3_5 = rad_rd3_1
rad_rd3_6 = rad_rd3_1
rad_rd4_1 = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_rd4_1.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_rd4_2 = rad_rd4_1
rad_rd4_3 = rad_rd4_1
rad_rd4_4 = rad_rd4_1
rad_rd4_5 = rad_rd4_1
rad_rd4_6 = rad_rd4_1
rad_destroyer_ion = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_destroyer_ion.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_destroyer_laser = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_destroyer_laser.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_destroyer_plasma = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_destroyer_plasma.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_destroyer_missile = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_destroyer_missile.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_destroyer_cloak = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_destroyer_cloak.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_destroyerturret = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_destroyerturret.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_destroyerturret_alt = rad_destroyerturret
rad_destroyerturret_norm = rad_destroyerturret
rad_destroyerturret_mini = rad_destroyerturret
rad_s_hiigaran_trophy = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_s_hiigaran_trophy.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_s_vaygr_trophy = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_s_vaygr_trophy.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_s_kadeshi_trophy = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_s_kadeshi_trophy.tga", 
        textureUV_TL = 
            { 0, 63, }, 
        textureUV_WH = 
            { 290, 46, }, 
        stretchOnDraw = 1, }, }
rad_s_keeper_trophy = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_s_keeper_trophy.tga", 
        textureUV_TL = 
            { -29, -57, }, 
        textureUV_WH = 
            { 290, 284, }, 
        stretchOnDraw = 1, }, }
rad_s_bigdaddy1 = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_bra.tga", 
        textureUV_TL = 
            { 0, 0, }, 
        textureUV_WH = 
            { 129, 65, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_bra.tga",  
        textureUV_TL = 
            { 15, 0, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }  
rad_s_bigdaddy2 = rad_s_bigdaddy1
rad_s_bigdaddy3 = rad_s_bigdaddy1
rad_s_bigdaddy4 = rad_s_bigdaddy1
rad_s_bigdaddy5 = rad_s_bigdaddy1
rad_s_bigdaddy6 = rad_s_bigdaddy1
rad_s_bigdaddy7 = rad_s_bigdaddy1
rad_carrier_ion = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_carrier_ion.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_carrier_ion_keeper = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_carrier_ion_keeper.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_carrier_kinetic = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_carrier_kinetic.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_carrier_laser = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_carrier_laser.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_carrier_plasma = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_carrier_plasma.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_carrier_boost = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_carrier_boost.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_blackmarketkinetic = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarketkinetic.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_blackmarketkinetic1 = rad_blackmarketkinetic
rad_blackmarketkinetic2 = rad_blackmarketkinetic
rad_blackmarketkinetic3 = rad_blackmarketkinetic
rad_blackmarketboomer = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarketboomer.tga", 
        textureUV_TL = 
            { -9, 29, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_blackmarketboomer1 = rad_blackmarketboomer
rad_blackmarketboomer2 = rad_blackmarketboomer
rad_blackmarketboomer3 = rad_blackmarketboomer
rad_blackmarkethowitzer = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarkethowitzer.tga", 
        textureUV_TL = 
            { -9, 29, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_blackmarkethowitzer1 = rad_blackmarkethowitzer
rad_blackmarkethowitzer2 = rad_blackmarkethowitzer
rad_blackmarkethowitzer3 = rad_blackmarkethowitzer
rad_blackmarketmortar = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarketmortar.tga", 
        textureUV_TL = 
            { -9, 29, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
rad_blackmarketmortar1 = rad_blackmarketmortar
rad_blackmarketmortar2 = rad_blackmarketmortar
rad_blackmarketmortar3 = rad_blackmarketmortar
rad_blackmarket_clustermissile = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarket_clustermissile.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }
rad_blackmarket_clustermissile1 = rad_blackmarket_clustermissile
rad_blackmarket_clustermissile2 = rad_blackmarket_clustermissile
rad_blackmarket_clustermissile3 = rad_blackmarket_clustermissile
rad_blackmarket_scud = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarket_scud.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }
rad_blackmarket_scud1 = rad_blackmarket_scud
rad_blackmarket_scud2 = rad_blackmarket_scud
rad_blackmarket_scud3 = rad_blackmarket_scud
rad_blackmarket_disco = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarket_disco.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }
rad_blackmarket_disco1 = rad_blackmarket_disco
rad_blackmarket_disco2 = rad_blackmarket_disco
rad_blackmarket_disco3 = rad_blackmarket_disco
rad_blackmarket_kickass = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\rad_blackmarket_kickass.tga", 
        textureUV_TL = 
            { -25, -48, }, 
        textureUV_WH = 
            { 269, 216, }, 
        stretchOnDraw = 1, }, }
rad_blackmarket_kickass1 = rad_blackmarket_kickass
rad_blackmarket_kickass2 = rad_blackmarket_kickass
rad_blackmarket_kickass3 = rad_blackmarket_kickass
KPR_ENGINE_DREADNAUGHT = Icon_Subsystem_Engine
KPR_C_ENGINE = Icon_Subsystem_Engine
KPR_R_ENGINE = Icon_Subsystem_Engine
RAD_CARRIER_TORPEDO = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\RAD_CARRIER_TORPEDO.tga", 
        textureUV_TL = 
            { -9, 33, }, 
        textureUV_WH = 
            { 290, 114, }, 
        stretchOnDraw = 1, }, }
kpr_shipyard_old = meg_balcoragate
kpr_shipyard_old1 = meg_balcoragate
kad_podship_shield = 
{
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\subs\\kad_podship_shield.tga", 
        textureUV_TL = 
            { -30, -29, }, 
        textureUV_WH = 
            { 290, 310, }, 
        stretchOnDraw = 1, }, }
kad_d_module_1gresearch = Icon_Subsystem_Research
kad_d_module_cloakgenerator = Icon_Subsystem_CloakGenerator
kad_d_module_hyperspace = Icon_Subsystem_Hyperspace
kad_d_module_hyperspaceinhibitor = Icon_Subsystem_HyperspaceInhibitor
Kad_Fleet = Icon_Fleet_Kad
Rad_Fleet = Icon_Fleet_Rad
Kpr_Fleet = Icon_Fleet_Kpr
kad_container = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\kad_container.tga",
        textureUV_TL = 
            { -22, -32, }, 
        textureUV_WH = 
            { 520, 236, }, 
        stretchOnDraw = 1, }, } 
kad_container1 = kad_container  
rad_container = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\rad_container.tga",
        textureUV_TL = 
            { -22, -32, }, 
        textureUV_WH = 
            { 520, 236, }, 
        stretchOnDraw = 1, }, } 
rad_container1 = rad_container
kad_MineContainer = Hgn_MineContainer
rad_MineContainer = Hgn_MineContainer
kpr_minecontainer = Hgn_MineContainer
kad_advancedswarmer_old1 = kad_advancedswarmer_old
kad_advancedswarmer1 = kad_advancedswarmer
kad_frig_ghost1 = kad_frig_ghost
kad_gunpod1 = kad_gunpod
kad_heavyswarmer_new1 = kad_heavyswarmer_new
kad_ionpod1 = kad_ionpod
kad_missilepod1 = kad_missilepod
kad_multibeam_new1 = kad_multibeam_new
kad_multibeam1 = kad_multibeam
kad_multigun1 = kad_multigun
kad_nebuladrone1 = kad_nebuladrone
kad_pod_ghost1 = kad_pod_ghost
kad_podship1 = kad_podship
kad_prayerpod1 = kad_prayerpod
kad_pulsarswarmer1 = kad_pulsarswarmer
kad_ressourcecollector1 = kad_ressourcecollector
kad_sensorpod1 = kad_sensorpod
kad_snail1 = kad_snail
kad_swarmer_blood1 = kad_swarmer_blood
kad_swarmer_crusader1 = kad_swarmer_crusader
kad_swarmer_ghost1 = kad_swarmer_ghost
kad_swarmer_hybrid1 = kad_swarmer_hybrid
kad_swarmer_new1 = kad_swarmer_new
kad_swarmer_zealot1 = kad_swarmer_zealot
rad_beamfrigate1 = rad_beamfrigate
rad_bomber1 = rad_bomber
rad_cruiser_queenscaffolda1 = rad_cruiser_queen
rad_cruiserscaffolda1 = rad_cruiser
rad_destroyerscaffolda1 = rad_destroyer
rad_elitefighter1 = rad_elitefighter
rad_empcorvette1 = rad_empcorvette
rad_explotrap1 = rad_explotrap
rad_fencer1 = rad_fencer
rad_gattlingfrigate1 = rad_gattlingfrigate
rad_gravwel1 =rad_gravwel
rad_guncorvette1 = rad_guncorvette
rad_gunfrigate_morgan1 = rad_gunfrigate_morgan
rad_gunfrigate1 = rad_gunfrigate
rad_guntrap1 = rad_guntrap
rad_hsbouey1 = rad_hsbouey
rad_merc_corvette1 = rad_merc_corvette
rad_merc_cruiser1 = rad_merc_cruiser
rad_merc_battlecruiser1 = rad_merc_battlecruiser
rad_merc_scout1 = rad_merc_scout
rad_merc_fighter1 = rad_merc_fighter
rad_merc_interceptor1 = rad_merc_interceptor
rad_merc_bomber1 = rad_merc_bomber
rad_merc_frigate1 = rad_merc_frigate
rad_merc_frigateadv1 = rad_merc_frigateadv
rad_merc_ioncannonfrigate1 = rad_merc_ioncannonfrigate
rad_missilecorvette1 = rad_missilecorvette
rad_missilefrigate1 = rad_missilefrigate
rad_resourcecollector1 = rad_resourcecollector
rad_resourcecontroller1 = rad_resourcecontroller
rad_scaffolda1 = rad_carrier
rad_scaffoldB1 = rad_carrier_black
rad_scoutcorvette1 = rad_scoutcorvette
rad_bm_orders_thedude = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_thedude.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_thedude.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_ru1000 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_ru1000.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_ru1000.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kpr_orders_ru1000 = rad_bm_orders_ru1000
rad_bm_orders_ru2000 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_ru2000.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_ru2000.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_ru5000 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_ru5000.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_ru5000.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_rutotal = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_rutotal.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_rutotal.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_en100 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_en100.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_en100.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
kpr_orders_en100 = rad_bm_orders_en100
rad_bm_orders_entotal = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_entotal.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_entotal.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_honor100 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_honor100.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_honor100.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_honortotal = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_honortotal.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_honortotal.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_pop200 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_pop200.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_pop200.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_pop500 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_pop500.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_pop500.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_pop1000 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_pop1000.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_pop1000.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_poptotal = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_poptotal.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_poptotal.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_xp100 = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_xp100.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_xp100.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }
rad_bm_orders_xptotal = 
{ 
    LargeIcon = 
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_xptotal.tga", 
        textureUV_TL = 
            { -6, -12, }, 
        textureUV_WH = 
            { 129, 75, }, 
        stretchOnDraw = 1, }, 
    SmallIcon =     
    { 
        texture = "data:ui\\newui\\ingameicons\\rad_bm_orders_xptotal.tga",  
        textureUV_TL = 
            { 14, -1, }, 
        textureUV_WH = 
            { 84, 54, }, 
        stretchOnDraw = 1, }, }

HWAT_VAY_CABattle = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_VAY_CABattle.tga",
        textureUV_TL = 
            { -23, -17, }, 
        textureUV_WH = 
            { 527, 216, }, 
        stretchOnDraw = 1, }, }

HWAT_UNH_CAStandard = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_UNH_CAStandard.tga",
        textureUV_TL = 
            { -23, -17, }, 
        textureUV_WH = 
            { 527, 216, }, 
        stretchOnDraw = 1, }, }

HWAT_FRN_CAHeavy = 
{ 
    LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_FRN_CAHeavy.tga",
        textureUV_TL = 
            { -23, -17, }, 
        textureUV_WH = 
            { 527, 216, }, 
        stretchOnDraw = 1, }, }

HWAT_FRN_FFAssault = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_FRN_FFAssault.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_FRN_FFCloak = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_FRN_FFCloak.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_FRN_FFIon = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_FRN_FFIon.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_FRN_FFMine = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_FRN_FFMine.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_FRN_FFSupport = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_FRN_FFSupport.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_UNH_FFAssault = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_UNH_FFAssault.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_UNH_FFIon = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_UNH_FFIon.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_VAY_FFAssault = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_VAY_FFAssault.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
HWAT_VAY_FFIonArray = {
  LargeIcon = 
    { 
        texture = "DATA:\\Ship\\Icons\\ships\\HWAT_VAY_FFIonArray.tga",
       textureUV_TL = 
            { -10, -7, }, 
        textureUV_WH = 
            { 260, 138, }, 
        stretchOnDraw = 1, }, }
