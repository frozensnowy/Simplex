-- Utility functions for managing campaign mission build restrictions

-- Load the mission configurations
dofilepath("data:scripts/campaign/mission_restrictions.lua")

-- Apply initial mission configuration (both restrictions and available options)
function ApplyMissionConfiguration(mission_id)
    -- Get the player ID (usually 0 for campaign)
    local playerID = Universe_CurrentPlayer()
    
    -- Get the configuration for this mission
    local config = MissionConfigs[mission_id]
    
    if config then
        -- First restrict everything that should be restricted
        if config.Restrictions then
            for i = 1, getn(config.Restrictions) do
                Player_RestrictBuildOption(playerID, config.Restrictions[i])
            end
            print("Applied restrictions for mission " .. mission_id)
        end
        
        -- Then make available what should be available
        if config.Available then
            for i = 1, getn(config.Available) do
                Player_UnrestrictBuildOption(playerID, config.Available[i])
            end
            print("Applied available options for mission " .. mission_id)
        end
    else
        print("No configuration found for mission " .. mission_id)
    end
end

-- Add a new restriction during the mission
function AddRestriction(restriction)
    local playerID = Universe_CurrentPlayer()
    Player_RestrictBuildOption(playerID, restriction)
    print("Added restriction: " .. restriction)
end

-- Make something available during the mission
function MakeAvailable(option)
    local playerID = Universe_CurrentPlayer()
    Player_UnrestrictBuildOption(playerID, option)
    print("Made available: " .. option)
end

-- Return the functions so they can be used by other files
return {
    ApplyMissionConfiguration = ApplyMissionConfiguration,
    AddRestriction = AddRestriction,
    MakeAvailable = MakeAvailable
} 