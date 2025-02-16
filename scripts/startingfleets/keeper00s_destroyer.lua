Survivor = {}
Survivor[1] = { 
            type = "kpr_destroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "kpr_hive", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 2
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }