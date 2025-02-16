Survivor = {}
Survivor[1] = { 
            type = "kpr_deciever", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "kpr_hunter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "kpr_seeker", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[4] = { 
            type = "kpr_guardian", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
SurvivorNum = 4
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        Survivor[random(SurvivorNum)],
        }, 
        
    Research = {}, }