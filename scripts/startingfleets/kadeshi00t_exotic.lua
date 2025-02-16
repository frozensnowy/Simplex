T_fighter = {}
T_fighter[1] = { 
            type = "Unit_G_Interceptor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 7, }
T_fighter[2] = { 
            type = "Unit_G_Bomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 4, }
T_fighter[3] = { 
            type = "Unit_C_Interceptor", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[4] = { 
            type = "hgn_pulsarfighter", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[5] = { 
            type = "hgn_shadowbomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighter[6] = { 
            type = "Unit_C_Bomber", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 3, }
T_fighter[7] = { 
            type = "Unit_C_Gunship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 5, }
T_fighterNum = 7
T_frigate = {}
T_frigate[1] = { 
            type = "HWAT_FRN_FFAssault", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[2] = { 
            type = "HWAT_FRN_FFCloak", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[3] = { 
            type = "HWAT_FRN_FFIon", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[4] = { 
            type = "HWAT_FRN_FFMine", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[5] = { 
            type = "HWAT_FRN_FFSupport", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[6] = { 
            type = "HWAT_UNH_FFAssault", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[7] = { 
            type = "HWAT_UNH_FFIon", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[8] = { 
            type = "HWAT_VAY_FFAssault", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigate[9] = { 
            type = "HWAT_VAY_FFIonArray", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_frigateNum = 9
T_destroyer = {}
T_destroyer[1] = { 
            type = "HWAT_UNH_CAStandard", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[2] = { 
            type = "HWAT_VAY_CABattle", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyer[3] = { 
            type = "HWAT_FRN_CAHeavy", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, }
T_destroyerNum = 3
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        { 
            type = "kad_needleship", 
            subsystems = {}, 
            shiphold = {}, 
            name = "", 
            size = 1, 
            number = 1, },
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
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_frigate[random(T_frigateNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        }, 
        
    Research = {}, }