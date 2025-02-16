T_battlecruiser = {}
T_battlecruiser[1] = { 
            type = "kpr_dreadnaught", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[2] = { 
            type = "kpr_reaver", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiser[3] = { 
            type = "kpr_sajuuk", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_battlecruiserNum = 3
T_destroyer = {}
T_destroyer[1] = { 
            type = "kpr_destroyer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[2] = { 
            type = "kpr_hive", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyerNum = 2
T_frigate = {}
T_frigate[1] = { 
            type = "kpr_deciever", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "kpr_hunter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "kpr_seeker", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "kpr_guardian", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 4
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "kpr_carrier", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_battlecruiser[random(T_battlecruiserNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        }, 
        
    Research = {}, }