-- Level Loader for Homeworld 2
-- Global state
campaignStarted = 0
currentLevel = ""
nextLevel = ""

-- Path globals
HW2Path = nil
ProfilePath = nil

-------------------------------------------------------------------------------
-- Core Loading Functions
-------------------------------------------------------------------------------

-- Initialize the loader
function LevelLoader_Initialize()
    print("DEBUG: Starting LevelLoader_Initialize")
    print("Initializing Level Loader...")
    
    -- Initialize paths
    HW2Path = GetHW2Path()
    ProfilePath = GetProfilePath()
    
    -- Create necessary SobGroups
    SobGroup_Create("LevelLoader_MothershipGroup")
    
    print("Level Loader initialized")
    print("DEBUG: Finished LevelLoader_Initialize")
end

-- Direct level loading function
function LevelLoader_LoadLevelDirect(levelName)
    print("DEBUG: Starting LevelLoader_LoadLevelDirect with level: " .. levelName)
    
    if levelName == nil or levelName == "" then
        print("Error: Invalid level name")
        return 0
    end
    
    print("Loading level: " .. levelName)
    
    -- Save current state if campaign has started
    if campaignStarted == 1 then
        print("DEBUG: Saving current state")
        Player_InstantlyGatherAllResources(0)
    end
    
    -- Update state and write to MissionGrid_record.lua
    local recordPath = HW2Path .. "Bin\\Profiles\\" .. ProfilePath .. "\\Campaign\\ASCENSION\\MissionGrid_record.lua"
    writeto(recordPath)
    -- Store full level name without any parsing/modification
    write("campaignStarted = 1\ncurrentMission = \"" .. levelName .. "\"\nsectorsCleared = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}\n")
    writeto()
    
    -- Save loader state
    SaveLevelLoaderState()
    
    -- Complete mission to trigger load
    Rule_Remove("Rule_Init")
    setMissionComplete(1)
    
    return 1
end

-------------------------------------------------------------------------------
-- Persistence Functions
-------------------------------------------------------------------------------

-- Save level loader state
function SaveLevelLoaderState()
    print("DEBUG: Starting SaveLevelLoaderState")
    
    local WriteString = "-- Level Loader State\n"
    WriteString = WriteString 
        .. "campaignStarted = " .. campaignStarted .. "\n"
        .. "currentLevel = \"" .. nextLevel .. "\"\n"
    
    print("DEBUG: Created write string: " .. WriteString)
    
    local WriteFile = HW2Path .. "Bin\\Profiles\\" .. ProfilePath .. "\\Campaign\\ASCENSION\\LevelLoader_state.lua"
    print("DEBUG: Writing to file: " .. WriteFile)
    
    writeto(WriteFile)
    write(WriteString)
    writeto()
    
    print("DEBUG: Finished SaveLevelLoaderState")
end

-- Load persistant data for spawning
function LoadPersistantData_Level(position, rotation)
    if campaignStarted == 0 then
        -- First spawn
        addSquadron("First_Mothership", "Hgn_Mothership", position, 0, rotation, 1, 1)
        createSOBGroup("MS_StartGroup")
        addToSOBGroup("First_Mothership", "MS_StartGroup")
        addSphere("MS_StartVolume", position, 1000)
        SobGroup_ExitHyperSpace("MS_StartGroup", "MS_StartVolume")
    else
        -- Handle persistant data
        SobGroup_LoadPersistantData("Hgn_Mothership")
        SobGroup_Create("MS_StartGroup")
        Player_FillShipsByType("MS_StartGroup", 0, "Hgn_Mothership")
    end
end

-------------------------------------------------------------------------------
-- Utility Functions
-------------------------------------------------------------------------------

-- Get HW2 path
function GetHW2Path()
    print("DEBUG: Getting HW2 path")
    local path = "../../"
    print("DEBUG: Returning HW2 path: " .. path)
    return path
end

-- Get profile path
function GetProfilePath()
    print("DEBUG: Starting GetProfilePath")
    local ProfileIni = HW2Path .. "Bin\\local.ini"
    print("DEBUG: Reading from: " .. ProfileIni)
    
    readfrom(ProfileIni)
    local dum, ProfileStr = read("*l", "*l")
    print("DEBUG: Read profile string: " .. ProfileStr)
    
    local idx1, idx2 = strfind(ProfileStr, "currentprofile=", 1, 1)
    local path = strsub(ProfileStr, idx2 + 1, -1)
    
    print("DEBUG: Returning profile path: " .. path)
    return path
end