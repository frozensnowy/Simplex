T_fighter = {}
T_fighter[1] = { 
            type = "vgr_interceptor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[2] = { 
            type = "vgr_bomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[3] = { 
            type = "vgr_defender", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[4] = { 
            type = "vgr_lancefighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[5] = { 
            type = "vgr_heavyfighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[6] = { 
            type = "vgr_missilebomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[7] = { 
            type = "vgr_elitefighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[8] = { 
            type = "Vgr_Bioship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[9] = { 
            type = "vgr_scout", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighterNum = 9
T_corvette = {}
T_corvette[1] = { 
            type = "vgr_missilecorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[2] = { 
            type = "vgr_lasercorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[3] = { 
            type = "vgr_plasmacorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[4] = { 
            type = "vgr_striker", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[5] = { 
            type = "vgr_multilancecorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[6] = { 
            type = "vgr_mortarcorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[7] = { 
            type = "vgr_minelayercorvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvette[8] = { 
            type = "vgr_standvette", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_corvetteNum = 8
T_frigate = {}
T_frigate[1] = { 
            type = "vgr_heavymissilefrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "vgr_assaultfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "vgr_advassaultfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "vgr_infiltratorfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "vgr_supportfrigatearmed", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[6] = { 
            type = "vgr_supportfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[7] = { 
            type = "vgr_supportfrigate_laser", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[8] = { 
            type = "vgr_artilleryfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[9] = { 
            type = "vgr_longrangeartilleryfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[10] = { 
            type = "vgr_commandfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[11] = { 
            type = "vgr_empfrigate", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 11
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "Vgr_Carrier", 
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