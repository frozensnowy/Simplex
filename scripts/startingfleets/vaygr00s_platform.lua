Survivor = {}
Survivor[1] = { 
            type = "vgr_weaponplatform_gun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "vgr_weaponplatform_lance", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "vgr_weaponplatform_missile", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 3
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }