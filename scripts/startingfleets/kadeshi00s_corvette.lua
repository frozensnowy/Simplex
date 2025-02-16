Survivor = {}
Survivor[1] = { 
            type = "kad_gunpod", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[2] = { 
            type = "kad_ionpod", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[3] = { 
            type = "kad_missilepod", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
Survivor[4] = { 
            type = "kad_pod_ghost", 
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