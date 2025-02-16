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
PersistantData = 
{ 
    StrikeGroups = {}, 
    Squadrons = 
        { 
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        T_destroyer[random(T_destroyerNum)],
        }, 
        
    Research = {}, }