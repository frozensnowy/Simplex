T_fighter = {}
T_fighter[1] = { 
            type = "kad_advancedswarmer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[2] = { 
            type = "kad_advancedswarmer_old", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[3] = { 
            type = "kad_heavyswarmer_new", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[4] = { 
            type = "kad_pulsarswarmer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[5] = { 
            type = "kad_swarmer_blood", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[6] = { 
            type = "kad_swarmer_crusader", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[7] = { 
            type = "kad_swarmer_ghost", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[8] = { 
            type = "kad_swarmer_hybrid", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[9] = { 
            type = "kad_swarmer_new", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[10] = { 
            type = "kad_swarmer_zealot", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighterNum = 10
T_corvette = {}
T_corvette[1] = { 
            type = "kad_gunpod", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 4, }
T_corvette[2] = { 
            type = "kad_ionpod", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 4, }
T_corvette[3] = { 
            type = "kad_missilepod", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 4, }
T_corvette[4] = { 
            type = "kad_pod_ghost", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 4, }
T_corvetteNum = 4
T_frigate = {}
T_frigate[1] = { 
            type = "kad_frig_ghost", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "kad_multibeam", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "kad_multibeam_new", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "kad_multigun", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "kad_podship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 5
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "kad_podship", 
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