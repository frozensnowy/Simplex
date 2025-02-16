T_fighter = {}
T_fighter[1] = { 
            type = "rad_merc_scout", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[2] = { 
            type = "rad_merc_fighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[3] = { 
            type = "rad_merc_interceptor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[4] = { 
            type = "rad_merc_bomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[5] = { 
            type = "rad_bomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[6] = { 
            type = "rad_elitefighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[7] = { 
            type = "rad_fencer", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[8] = { 
            type = "rad_interceptor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[9] = { 
            type = "rad_interceptor_black", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighterNum = 9
T_corvette = {}
T_corvette[1] = { 
            type = "rad_merc_corvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[2] = { 
            type = "rad_scoutcorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[3] = { 
            type = "rad_guncorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[4] = { 
            type = "rad_empcorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[5] = { 
            type = "rad_jackal", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[6] = { 
            type = "rad_missilecorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvetteNum = 6
T_frigate = {}
T_frigate[1] = { 
            type = "rad_beamfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "rad_gattlingfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "rad_gunfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "rad_gunfrigate_morgan", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "rad_merc_frigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[6] = { 
            type = "rad_merc_frigateadv", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[7] = { 
            type = "rad_merc_ioncannonfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[8] = { 
            type = "rad_missilefrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 8
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "rad_carrier", 
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