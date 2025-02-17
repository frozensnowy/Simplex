-- Load the linear list layout first
print("MissionHubScreen: Loading linear list layout...")
dofilepath("data:ui/newui/missionlayouts/linearlist.lua")
if not LinearListLayout then
    print("MissionHubScreen: ERROR - Failed to load LinearListLayout")
end

-- Global state for selected mission
MissionHubScreen_SelectedMission = nil

-- Function to update debug text
function MissionHub_SetDebug(text)
    print("MissionHubScreen Debug: " .. tostring(text))
    UI_SetTextLabelText("MissionHubScreen", "lblDebug", text)
end

-- Function to add container to screen
function MissionHub_AddContainer(container)
    if container then
        print("MissionHubScreen: Attempting to add container")
        UI_AddSubtitle("MissionHubScreen", "missionListContainer", container)
        return true
    end
    return false
end

-- Function to populate container
function MissionHub_PopulateContainer(container, missionData)
    if container and missionData then
        print("MissionHubScreen: Starting container population with " .. tostring(table.getn(missionData)) .. " missions")
        
        -- Add each mission manually
        local yOffset = 0
        for i = 1, table.getn(missionData) do
            local mission = missionData[i]
            if mission then
                print("MissionHubScreen: Adding mission " .. i)
                
                -- Create mission item frame
                local item = {
                    type = "Frame",
                    position = { 0, yOffset },
                    size = { 758, 80 },
                    name = "missionItem_" .. i,
                    borderWidth = 1,
                    borderColor = "FEColorOutline",
                    backgroundColor = { 0, 0, 0, 255 },
                    onMouseClicked = "MissionHub_SelectMission(" .. i .. ")",
                }
                
                -- Add to container
                table.insert(container, item)
                yOffset = yOffset + 85  -- height + spacing
            end
        end
        return true
    end
    return false
end

-- Function to handle mission selection
function MissionHub_SelectMission(missionIndex)
    print("MissionHubScreen: Selecting mission " .. tostring(missionIndex))
    -- Deselect previous mission if any
    if MissionHubScreen_SelectedMission then
        local prevItem = UI_FindWidget("missionItem_" .. MissionHubScreen_SelectedMission)
        if prevItem then
            prevItem.borderColor = "FEColorOutline"
        end
    end
    
    -- Select new mission
    MissionHubScreen_SelectedMission = missionIndex
    local item = UI_FindWidget("missionItem_" .. missionIndex)
    if item then
        item.borderColor = { 238, 188, 5, 255 }  -- Gold highlight
    end
    
    -- Enable launch button if mission is selected
    local btnLaunch = UI_FindWidget("btnLaunch")
    if btnLaunch then
        btnLaunch.enabled = 1
    end
end

-- Function to launch selected mission
function MissionHub_LaunchMission()
    if MissionHubScreen_SelectedMission and Mission[MissionHubScreen_SelectedMission] then
        local mission = Mission[MissionHubScreen_SelectedMission]
        -- Load the mission level
        UI_HideScreen("MissionHubScreen")
        dofilepath("data:leveldata/" .. mission.directory .. "/" .. mission.level)
    end
end

-- Initialization function
function MissionHubScreen_Initialize()
    print("MissionHubScreen: Initialize called")
    
    -- Load campaign data
    print("MissionHubScreen: Loading campaign data...")
    dofilepath("data:leveldata/campaign/Acension_data.lua")
    
    -- Verify data loaded
    if Mission and displayName then
        print("MissionHubScreen: Campaign data loaded successfully")
        print("MissionHubScreen: Campaign name: " .. tostring(displayName))
        print("MissionHubScreen: Mission count: " .. tostring(table.getn(Mission)))
        
        -- Update UI labels
        UI_SetTextLabelText("MissionHubScreen", "lblDebug", "Loading campaign: " .. displayName)
        UI_SetTextLabelText("MissionHubScreen", "lblCampaign", displayName)
        
        -- Create container for missions
        if LinearListLayout then
            local container = LinearListLayout.createContainer("missionList")
            if container then
                if MissionHub_AddContainer(container) then
                    MissionHub_PopulateContainer(container, Mission)
                    UI_SetTextLabelText("MissionHubScreen", "lblDebug", "Ready")
                else
                    UI_SetTextLabelText("MissionHubScreen", "lblDebug", "Failed to add container")
                end
            else
                UI_SetTextLabelText("MissionHubScreen", "lblDebug", "Failed to create container")
            end
        else
            UI_SetTextLabelText("MissionHubScreen", "lblDebug", "No layout manager")
        end
    else
        print("MissionHubScreen: Failed to load campaign data")
        UI_SetTextLabelText("MissionHubScreen", "lblDebug", "Failed to load campaign data")
    end
end

-- Screen creation function
function MissionHubScreen_CreateScreen()
    print("MissionHubScreen: CreateScreen called")
    MissionHubScreen_Initialize()
    return 1
end

-- Define the UI layout
MissionHubScreen = {
    size = { 0, 0, 800, 600 },
    stylesheet = "HW2StyleSheet",
    pixelUVCoords = 1,
    RootElementSettings = {
        backgroundColor = "FEColorBackground2",
    },
    onShow = "MissionHubScreen_Initialize()",
    createScreen = "MissionHubScreen_CreateScreen()",
;
-- Main container
{
    type = "Frame",
    position = { 0, 0 },
    size = { 800, 600 },
    name = "frmRoot",
;
    -- Debug Text (temporary)
    {
        type = "TextLabel",
        position = { 200, 200 },
        size = { 400, 30 },
        name = "lblDebug",
        Text = {
            text = "Initializing...",
            textStyle = "FEButtonTextStyle",
            color = { 255, 255, 255, 255 },
        },
    },
    
    -- Title
    {
        type = "TextLabel",
        position = { 16, 5 },
        size = { 700, 36 },
        name = "lblTitle",
        Text = {
            text = "Mission Hub",
            textStyle = "FEHeading1",
        },
    },

    -- Current Campaign
    {
        type = "TextLabel",
        position = { 16, 45 },
        size = { 700, 20 },
        name = "lblCampaign",
        Text = {
            text = "", -- Will be set by script
            textStyle = "FEHeading3",
        },
    },

    -- Mission List Container
    {
        type = "Frame",
        position = { 16, 110 },
        size = { 768, 435 },
        backgroundColor = "FEColorBackground1",
        borderWidth = 1,
        borderColor = "FEColorOutline",
        name = "missionListContainer",
    },

    -- Bottom Button Bar
    {
        type = "Frame",
        position = { 16, 555 },
        size = { 768, 35 },
        backgroundColor = "FEColorBackground1",
;
        {
            type = "TextButton",
            position = { 5, 5 },
            width = 100,
            name = "btnBack",
            buttonStyle = "FEButtonStyle1",
            Text = {
                text = "Back",
                textStyle = "FEButtonTextStyle",
            },
            onMouseClicked = "UI_HideScreen('MissionHubScreen')",
        },
        {
            type = "TextButton",
            position = { 663, 5 },
            width = 100,
            name = "btnLaunch",
            buttonStyle = "FEButtonStyle2",
            Text = {
                text = "Launch",
                textStyle = "FEButtonTextStyle",
            },
            onMouseClicked = "MissionHub_LaunchMission()",
        },
    },
},
}