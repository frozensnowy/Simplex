LinearListLayout = {
    -- Layout specific settings
    itemSpacing = 2,
    itemHeight = 80,
    
    -- Template for a mission item in the list
    missionItemTemplate = {
        type = "Frame",
        size = { 758, 80 },
        borderWidth = 1,
        borderColor = "FEColorOutline",
        backgroundColor = { 0, 0, 0, 255 },  -- Dark background
        name = "missionItem",
        mouseOver = 1,
        overColor = { 41, 41, 41, 255 },
;
        -- Mission Number
        {
            type = "TextLabel",
            position = { 10, 5 },
            size = { 50, 20 },
            name = "number",
            Text = {
                textStyle = "FEHeading3",
                color = { 112, 157, 180, 255 },  -- Blue tint
            },
        },
        
        -- Mission Title
        {
            type = "TextLabel",
            position = { 70, 5 },
            size = { 600, 20 },
            name = "title",
            Text = {
                textStyle = "FEHeading3",
                color = { 255, 255, 255, 255 },
            },
        },
        
        -- Mission Description
        {
            type = "TextLabel",
            position = { 70, 30 },
            size = { 600, 45 },
            name = "description",
            Text = {
                textStyle = "FEButtonTextStyle",
                color = { 181, 181, 181, 255 },  -- Slightly dimmed
                wordWrap = 1,
            },
        },
        
        -- Mission Status (Complete/Incomplete)
        {
            type = "Frame",
            position = { 720, 25 },
            size = { 30, 30 },
            name = "status",
            backgroundColor = { 112, 157, 180, 255 }, -- Default to incomplete color
        },
    },

    -- Function to create the main container for the list
    createContainer = function(parent)
        return {
            type = "Frame",
            position = { 5, 5 },
            size = { 758, 425 },
            name = parent .. "_container",
            backgroundColor = { 0, 0, 0, 255 },
            scrollHotSpot = 1,
        }
    end,

    -- Function to create a mission item
    createMissionItem = function(mission, index)
        local item = deepcopy(LinearListLayout.missionItemTemplate)
        item.position = { 0, (index - 1) * (LinearListLayout.itemHeight + LinearListLayout.itemSpacing) }
        item.name = "missionItem_" .. index
        return item
    end,

    -- Function to populate the list with missions
    populateList = function(container, missions)
        for i, mission in ipairs(missions) do
            local item = LinearListLayout.createMissionItem(mission, i)
            
            -- Set mission data
            item[1].Text.text = string.format("M%02d", i)  -- Mission number (M01, M02, etc)
            item[2].Text.text = mission.displayName:gsub("^%$%d+", "")  -- Remove $ prefix if present
            item[3].Text.text = mission.description:gsub("^%$%d+", "")  -- Remove $ prefix if present
            
            -- Set status color based on completion
            if mission.completed then
                item[4].backgroundColor = { 238, 188, 5, 255 } -- Complete color (gold)
            end
            
            -- Add click handler
            item.onMouseClicked = "MissionHub_SelectMission(" .. i .. ")"
            
            table.insert(container, item)
        end
    end,
} 