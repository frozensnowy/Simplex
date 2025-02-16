T_fighter = {}
T_fighter[1] = { 
            type = "Kpr_AttackDroid", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_fighter[2] = { 
            type = "kpr_interceptor_old", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_fighterNum = 2
T_corvette = {}
T_corvette[1] = { 
            type = "kpr_mover", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_corvette[2] = { 
            type = "kpr_attackdroid_combo", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_corvette[3] = { 
            type = "kpr_interceptor_combo", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_corvette[4] = { 
            type = "kpr_attackdroid_agitator", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_corvetteNum = 4
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
            number = 5, },
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_fighter[random(T_fighterNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
        T_corvette[random(T_corvetteNum)],
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