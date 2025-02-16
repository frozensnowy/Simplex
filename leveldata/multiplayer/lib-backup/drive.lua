function DriveMode_InitialCheck(playerIndex)
	local ship = "DriveMode_SOB"..playerIndex
	local shipsNUM = PrepareSelectedShipsForHaxor(ship)
	if shipsNUM == 1 then	--	> 0
		if UI_IsScreenActive("haxor") == 1 or SobGroup_OwnedBy(ship) == Universe_CurrentPlayer() then
			UI_SetElementVisible("drive", "driveenabled", 0)
			UI_SetElementVisible("drive", "takingcontrol", 1)
			UI_SetScreenVisible("FlightPanel", 1)
			Camera_AltFocus(ship, 0)
			SobGroup_Stop(playerIndex, ship)
			if SobGroup_GetTactics(ship) == 0 then
				Subtitle_Message("Pilot Mode: Move and Attack (Aggressive Tactic)", 3)
				UI_PlaySound("SFX_OrderAttack")		--SFX_PositiveConfirmation
				DriveMode_HUDMode(1)
			else
				Subtitle_Message("Pilot Mode: Navigation Only (Non-Aggressive Tactic)", 3)
				UI_PlaySound("SFX_MPPlayerJoins")
				DriveMode_HUDMode(0)
			end
			DriveModeTactic[playerIndex+1] = SobGroup_GetTactics(ship)
			DriveModeBuffer[playerIndex+1] = 0
		else		--hotkey debug: to prevent other players from being controlled without haxor 
			UI_SetElementVisible("drive", "driveenabled", 0)
			UI_SetElementVisible("drive", "takingcontrol", 0)
			UI_SetScreenVisible("FlightPanel", 0)
		end
	else
		--UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
		UI_SetElementVisible("drive", "driveenabled", 0)
		UI_SetElementVisible("drive", "takingcontrol", 0)
		UI_SetScreenVisible("FlightPanel", 0)
	end
end

function DriveMode_DisplayButtonForShip(ship)
	if GetGameRubric() == GR_MULTIPLAYER then
		return
	end
	if SobGroup_CanDoAbility(ship, AB_Move) == 1 and SobGroup_HealthPercentage(ship) > 0 then
		if UI_IsScreenActive("haxor") == 1 or SobGroup_OwnedBy(ship) == Universe_CurrentPlayer() then
			if SobGroup_AreAllInRealSpace(ship) == 1 and 
			SobGroup_IsDocked(ship) == 0 and 
			SobGroup_IsDoingAbility(ship, AB_Dock) == 0 and 
			SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 then
				UI_SetElementVisible("NewTaskbar", "btnDrive", 1)
			end
		end
	end
end

function DriveMode_HUDMode(i_aggressive)
	if i_aggressive == 1 then
		UI_SetElementVisible("FlightPanel", "flightpanel", 0)
		UI_SetElementVisible("FlightPanel", "flightpanel_red", 1)
		UI_SetTextLabelText("FlightPanel", "target_text", "")
	else
		UI_SetElementVisible("FlightPanel", "flightpanel", 1)
		UI_SetElementVisible("FlightPanel", "flightpanel_red", 0)
		UI_SetTextLabelText("FlightPanel", "target_text", "")
	end
end

function Camera_GetPosition(playerIndex)
	local attempt = 1
	local dummycount = 0
	local camera_dist = {0, 0, 0, 0}--镜头与镜头定位物的距离
	local camera_pos = {0, 0, 0}--镜头坐标
	local translation = {0, 0, 0}
	local dislocation = {
	{0, 0, 0},
	{100000, 0, 0},
	{0, 100000, 0},
	{0, 0, 100000},
	{-100000, 0, 0},
	{0, -100000, 0},
	{0, 0, -100000},
	{100000, 100000, 0},
	{0, 100000, 100000},
	{100000, 0, 100000},
	{-100000, -100000, 0},
	{0, -100000, -100000},
	{-100000, 0, -100000},
	{100000, -100000, 0},
	{0, 100000, -100000},
	{100000, 0, -100000},
	{-100000, 100000, 0},
	{0, -100000, 100000},
	{-100000, 0, 100000},
	{100000, 100000, 100000},
	{-100000, -100000, -100000},
	{-100000, 100000, 100000},
	{100000, -100000, 100000},
	{100000, 100000, -100000},
	{-100000, -100000, 100000},
	{100000, -100000, -100000},
	{-100000, 100000, -100000},
	}
	for i = 1, 4 do
		SobGroup_Create("sg_camera_Sat"..i..playerIndex)
	end
	while attempt <= 27 and dummycount ~= 4 do		--attempt to place the dummy objects for several times if failed
		for i = 1, 3 do
			translation[i] = dislocation[attempt][i]
		end
		Volume_AddSphere("vol_camera_Sat1"..playerIndex, {0+translation[1], 0+translation[2], 0+translation[3]}, 30)
		Volume_AddSphere("vol_camera_Sat2"..playerIndex, {1000000+translation[1], 0+translation[2], 0+translation[3]}, 30)
		Volume_AddSphere("vol_camera_Sat3"..playerIndex, {0+translation[1], 1000000+translation[2], 0+translation[3]}, 30)
		Volume_AddSphere("vol_camera_Sat4"..playerIndex, {0+translation[1], 0+translation[2], 1000000+translation[3]}, 30)
		dummycount = 0
		for i = 1, 4 do
			if SobGroup_Empty("sg_camera_Sat"..i..playerIndex) == 0 then
				SobGroup_SetHealth("sg_camera_Sat"..i..playerIndex, 0)
				SobGroup_Clear("sg_camera_Sat"..i..playerIndex)
			end
		end
		for i = 1, 4 do
			SobGroup_SpawnNewShipInSobGroup(-1, "fly_location", "satellite", "sg_camera_Sat"..i..playerIndex, "vol_camera_Sat"..i..playerIndex)
			Volume_Delete("vol_camera_Sat"..i..playerIndex)
			--check if the dummy object is successfully placed there
			if SobGroup_Empty("sg_camera_Sat"..i..playerIndex) == 0 then
				--if SobGroup_HealthPercentage("sg_camera_Sat"..i..playerIndex) > 0 then
					dummycount = dummycount + 1
				--end
			end
		end
		attempt = attempt + 1
	end
	local vocalcase = "current camera"
	if dummycount == 4 then		--camera location acquired
		for i = 1,4 do
			camera_dist[i] = Camera_GetDistanceToSobGroup("sg_camera_Sat"..i..playerIndex)
		end
		for i = 1,3 do
			camera_pos[i] = 500000-(camera_dist[i+1]^2 - camera_dist[1]^2)/2000000 + translation[i]		--somehow this equation works
		end
		for i = 1, 4 do
			if SobGroup_Empty("sg_camera_Sat"..i..playerIndex) == 0 then
				SobGroup_SetHealth("sg_camera_Sat"..i..playerIndex, 0)
				SobGroup_Clear("sg_camera_Sat"..i..playerIndex)
			end
		end
	else		--cannot acquire camera location, target the original ship 
		camera_pos = {0,0,0}
		for i = 1, 4 do
			if SobGroup_Empty("sg_camera_Sat"..i..playerIndex) == 0 then
				SobGroup_SetHealth("sg_camera_Sat"..i..playerIndex, 0)
				SobGroup_Clear("sg_camera_Sat"..i..playerIndex)
			end
		end
	end
	return camera_pos
end

function DriveMode_AssumingDirectControl(playerIndex)		--upadated at 0.1111 interval in interface.lua
	local playerIndexList = playerIndex + 1
	local ship = "DriveMode_SOB"..playerIndex
	local reduced_interval = 10
	SobGroup_Create("drive_target_SOB"..playerIndex)
	if mod(DriveModeBuffer[playerIndex+1], reduced_interval) == 0 then
		if SobGroup_Empty("drive_target_SOB"..playerIndex) == 0 then
			SobGroup_SetHealth("drive_target_SOB"..playerIndex, 0)
			SobGroup_Clear("drive_target_SOB"..playerIndex)
		end
	end
	local fail_factor = 0
	if UI_IsNamedElementVisible("drive","driveenabled") == 1 then
		fail_factor = 1
	end
	if SobGroup_Empty(ship) == 1 then
		fail_factor = 1
	elseif Camera_IsFocused(ship) == 0 then
		fail_factor = 1
	elseif SobGroup_CanDoAbility(ship, AB_Move) == 0 or SobGroup_HealthPercentage(ship) <= 0 then
		fail_factor = 2
	elseif SobGroup_IsDoingAbility(ship, AB_Stop) == 1 and DriveModeBuffer[playerIndex+1] > 0 then
		fail_factor = 2
	else
		if SobGroup_AreAllInRealSpace(ship) == 0 or 
		SobGroup_IsDocked(ship) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_HyperspaceViaGate) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Capture) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Harvest) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Mine) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Guard) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Repair) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Retire) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Parade) == 1 or 
		SobGroup_IsDoingAbility(ship, AB_Salvage) == 1 then
			fail_factor = 2
		end
	end
	if fail_factor > 0 then
  	UI_SetElementVisible("drive", "driveenabled", 0)
		UI_SetElementVisible("drive", "takingcontrol", 0)
		UI_SetScreenVisible("FlightPanel", 0)
  	Subtitle_Message("Pilot Mode Disabled", 3)
  	UI_PlaySound("SFX_MPPlayerQuits")		--SFX_MPTimerCountdown
  	if fail_factor == 1 then
  		SobGroup_Stop(playerIndex, ship)
  	end
  else
  	--calculate nerdy parameters
  	local camera_pos = Camera_GetPosition(playerIndex)
  	local verticalFOV = 55	--35
		local FOVfactor = (verticalFOV/90)*(400/600)		--1 makes everything jump too quickly and look dizzy
		local ship_pos = SobGroup_GetPosition(ship)
		local ship_lastpos = DriveModeLastPos[playerIndex+1]
		local ship_vector = {0,0,0}
		local ship_lastvector = {0,0,0}
		local ship_apparentvector = {0,0,0}
		local camera_vector = {0,0,0}
		for i = 1,3 do
			ship_vector[i] = ship_pos[i] - ship_lastpos[i]
			ship_lastvector[i] = ship_lastpos[i] - DriveModeLastSecondPos[playerIndex+1][i]
			camera_vector[i] = ship_pos[i] - camera_pos[i]
			ship_apparentvector[i] = ship_vector[i] - camera_vector[i]
		end
		local AoA = atan(ship_vector[2]/sqrt(ship_vector[1]^2+ship_vector[3]^2))
		local lastAoA = atan(ship_lastvector[2]/sqrt(ship_lastvector[1]^2+ship_lastvector[3]^2))
		local averageAoA = (AoA+lastAoA)/2
		local apparentAoA = atan(ship_apparentvector[2]/sqrt(ship_apparentvector[1]^2+ship_apparentvector[3]^2))
		local speed = sqrt(SobGroup_GetActualSpeed(ship))
		local heading = DriveMode_GetHeadingFromVector(ship_vector)
		local heading_vertical = DriveMode_GetVerticalHeadingFromVector(ship_vector)
		local lastheading = DriveMode_GetHeadingFromVector(ship_lastvector)
		local camera_heading = DriveMode_GetHeadingFromVector(camera_vector)
		local camera_heading_vertical = DriveMode_GetVerticalHeadingFromVector(camera_vector)
		local target_pos = {0,0,0}
		local target_distance = 0
		if SobGroup_Empty("drive_target_SOB"..playerIndex) == 0 then
			target_pos = SobGroup_GetPosition("drive_target_SOB"..playerIndex)
			target_distance = SobGroup_GetDistanceToSobGroup(ship, "drive_target_SOB"..playerIndex)
		else
			target_pos = DriveModeLastTargetPos[playerIndexList]
		end
		local target_vector = {0,0,0}
		for i = 1,3 do
			target_vector[i] = target_pos[i] - camera_pos[i]		--target_pos[i] - ship_pos[i]
		end
		local apparent_averageAoA = apparentAoA*FOVfactor
		local target_AoA = FOVfactor*atan(target_vector[2]/sqrt(target_vector[1]^2+target_vector[3]^2))		--atan(target_vector[2]/sqrt(target_vector[1]^2+target_vector[3]^2))
		DriveModeLastSecondPos[playerIndex+1] = DriveModeLastPos[playerIndex+1]
		DriveModeLastPos[playerIndex+1] = ship_pos
		--HUD
		local vertical_shift = 0
		if UI_IsNamedElementVisible("NewTaskbar", "btnHide1") == 0 or UI_ScreenIsActive("NewTaskbar") == 0 then
			vertical_shift = 50
		end
		if UI_ScreenIsActive("ResourceMenu") == 1 then		--NewTaskbar
			UI_SetScreenVisible("FlightPanel", 1)
			UI_SetElementPosition("FlightPanel", "flightpanel", 200, vertical_shift+50)
			UI_SetElementPosition("FlightPanel", "flightpanel_red", 200, vertical_shift+50)
			UI_SetElementPosition("FlightPanel", "elevation_number", 600+3, vertical_shift+240+3)
			UI_SetElementPosition("FlightPanel", "speed_number", 200-3-40, vertical_shift+240+3)
			UI_SetElementPosition("FlightPanel", "heading_number", 400-33, vertical_shift+40)
		else
			UI_SetScreenVisible("FlightPanel", 0)
		end
		local panel_size = 200
		local elevation_center = 240+3
		local AoA_h = elevation_center - AoA/(90/panel_size)
		
		UI_SetTextLabelText("FlightPanel", "speed_text", String_AddRainbowColourBasedOnNumber(sqrt(SobGroup_GetEquivalentSpeed(ship)), floor(speed), 0, 500))
		if floor(speed) == 0 then
			UI_SetElementVisible("FlightPanel", "elevation_marker", 0)
			UI_SetElementVisible("FlightPanel", "elevation_number", 0)
			UI_SetElementVisible("FlightPanel", "heading_number", 0)
		else
			UI_SetElementVisible("FlightPanel", "elevation_marker", 1)
			UI_SetElementVisible("FlightPanel", "elevation_number", 1)
			UI_SetElementVisible("FlightPanel", "heading_number", 1)
			UI_SetElementPosition("FlightPanel", "elevation_marker", 200-1, vertical_shift+AoA_h)
			UI_SetTextLabelText("FlightPanel", "elevation_text", floor(AoA).." ")
			UI_SetTextLabelText("FlightPanel", "heading_text", floor(heading).." ")
		end
		local yaw = heading - lastheading
		local apparent_yaw = (heading-camera_heading)*1
		local apparent_AoA = (heading_vertical-camera_heading_vertical)*1
		if yaw > 90 then
			yaw = 90
		elseif yaw < -90 then
			yaw = -90
		end
		if apparent_yaw > 90 then
			apparent_yaw = 90
		elseif apparent_yaw < -90 then
			apparent_yaw = -90
		end
		if apparent_AoA > 90 then
			apparent_AoA = 90
		elseif apparent_AoA < -90 then
			apparent_AoA = -90
		end
		local yaw_w = 400-50 + apparent_yaw/(90/panel_size)		--400-50 + yaw/(90/panel_size)
		local lastAoA_h = 250-50-apparent_AoA/(90/panel_size)		--250-50-lastAoA/(90/panel_size)
		if floor(speed) == 0 then
			UI_SetElementVisible("FlightPanel", "flightvector", 0)
		else
			UI_SetElementVisible("FlightPanel", "flightvector", 1)
			UI_SetElementPosition("FlightPanel", "flightvector", yaw_w, vertical_shift+lastAoA_h)
		end
		local target_display = floor(target_distance)
		if target_distance > 0 then
			if target_display > 9999 then
				target_display = floor(target_distance/1000)
				UI_SetTextLabelText("FlightPanel", "target_text", String_AddRainbowColourBasedOnNumber(target_distance, ""..target_display.." km", 500, 10000) )
			else
				UI_SetTextLabelText("FlightPanel", "target_text", String_AddRainbowColourBasedOnNumber(target_distance, ""..target_display.." m", 500, 10000) )
			end
		end
		local target_yaw = DriveMode_GetHeadingFromVector(target_vector) - camera_heading		--DriveMode_GetHeadingFromVector(target_vector) - heading
		if target_yaw > 90 then
			target_yaw = 90
		elseif target_yaw < -90 then
			target_yaw = -90
		end
		local target_apparentAoA = DriveMode_GetVerticalHeadingFromVector(target_vector) - camera_heading_vertical
		if target_apparentAoA > 90 then
			target_apparentAoA = 90
		elseif target_apparentAoA < -90 then
			target_apparentAoA = -90
		end
		local target_yaw_w = 400-25 + target_yaw*FOVfactor/(90/panel_size)		--400-25 + target_yaw/(90/panel_size)
		local target_h = 250-25-target_apparentAoA*FOVfactor/(90/panel_size)		--250-25-target_AoA/(90/panel_size)
		UI_SetElementPosition("FlightPanel", "flighttarget", target_yaw_w, vertical_shift+target_h)
		local target_info_w = 400+10 + target_yaw*FOVfactor/(90/panel_size)		--400+10 + target_yaw/(90/panel_size)
		local target_info_h = 250-15-target_apparentAoA*FOVfactor/(90/panel_size)		--250-15-target_AoA/(90/panel_size)
		if target_yaw < 0 then
			target_info_w = target_info_w - 45		--40
		end
		if target_AoA < 0 then
			target_info_h = target_info_h + 20
		end
		UI_SetElementPosition("FlightPanel", "targetinfo", target_info_w, vertical_shift+target_info_h)
		--Move Function
		if mod(DriveModeBuffer[playerIndex+1], reduced_interval) == 0 then		--a refresh rate too high will cause inaction
			local target_pos = {0,0,0}
			for i = 1,3 do
				local range_factor = 20/Camera_GetDistanceToSobGroup(ship)^0.25		--target can't be too close or the ship will stop very soon
				target_pos[i] = ship_pos[i] + range_factor * ( ship_pos[i] - camera_pos[i] )
			end
			if camera_pos ~= {0,0,0} then
				local idx = DriveModeBuffer[playerIndex+1]
				Volume_AddSphere("VOL_drive_location"..idx..playerIndex, target_pos, 10)
				DriveModeLastTargetPos[playerIndexList] = target_pos
				if SobGroup_CanDoAbility(ship, AB_Attack) == 1 then
					if SobGroup_GetTactics(ship) == 0 then
						if GameRulesName == "Simplex Sole Survivor" and SobGroup_SobGroupCompare(ship, "SoleSurvivor"..playerIndex) == 1 then
							SoleSurvivorAutoSurvey[playerIndexList] = 0		--drive mode takes priority
						end
						SobGroup_SpawnNewShipInSobGroup(-1, "fly_target", "fps_target", "drive_target_SOB"..playerIndex, "VOL_drive_location"..idx..playerIndex)
						SobGroup_SetInvulnerability("drive_target_SOB"..playerIndex, 1)
						SobGroup_Attack(playerIndex, ship, "drive_target_SOB"..playerIndex)
						--SobGroup_Kamikaze(ship, "drive_target_SOB"..playerIndex)
						--SobGroup_MoveToSobGroup(ship, "drive_target_SOB"..playerIndex)
						if SobGroup_GetTactics(ship) ~= DriveModeTactic[playerIndex+1] then
							Subtitle_Message("Pilot Mode: Move and Attack (Aggressive Tactic)", 3)
							UI_PlaySound("SFX_armOn")
							DriveMode_HUDMode(1)
						end
					else
						SobGroup_Move(playerIndex, ship, "VOL_drive_location"..idx..playerIndex)
						if SobGroup_GetTactics(ship) ~= DriveModeTactic[playerIndex+1] then
							Subtitle_Message("Pilot Mode: Navigation Only (Non-Aggressive Tactic)", 3)
							UI_PlaySound("SFX_armOff")
							DriveMode_HUDMode(0)
						end
					end
					DriveModeTactic[playerIndex+1] = SobGroup_GetTactics(ship)
				else
					SobGroup_Move(playerIndex, ship, "VOL_drive_location"..idx..playerIndex)
				end
				Volume_Delete("VOL_drive_location"..idx..playerIndex)
			end
		end
  end
  DriveModeBuffer[playerIndex+1] = DriveModeBuffer[playerIndex+1] + 1
end

function DriveMode_GetHeadingFromVector(vector)
	local heading = {0,0,0}
	heading = 180-atan(vector[1]/vector[3])
	if vector[3] < 0 and vector[1] < 0 then
		heading = 360-atan(vector[1]/vector[3])
	elseif vector[3] < 0 then
		heading = -atan(vector[1]/vector[3])
	end
	return heading
end

function DriveMode_GetVerticalHeadingFromVector(vector)
	local heading = {0,0,0}
	local side = 0
	if abs(vector[1]) > abs(vector[3]) then
		side = abs(vector[1])
	else
		side = abs(vector[3])
	end
	heading = 180-atan(vector[2]/side)
	return (180-heading)
end