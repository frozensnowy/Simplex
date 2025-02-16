Race_Kadeshi = 3
Race_Raider = 4
Race_Keeper = 6

function CPU_Exist_Smart(playerIndex)
	local IsCPUPlayer = 0
	if GetGameRubric() == GR_MULTIPLAYER then
		if Player_HasResearch(playerIndex, "isai" ) == 1 then
			IsCPUPlayer = 1
		end
	else
		if CPU_Exist(playerIndex) == 1 then					--Mr.Thi on ModDB said this could cause OUT OF SYNC problem in multiplayer
			IsCPUPlayer = 1
		end
	end
	return IsCPUPlayer
end

function SobGroup_Selected_Smart(ship)
	local playerIndexList = Universe_CurrentPlayer()+1
	local selected_smart = 0
	if SobGroup_Selected(ship) == 1 then
		Temp_GlobalVariable.SelectedShips[playerIndexList] = Temp_GlobalVariable.SelectedShips[playerIndexList] + 1
		if Temp_GlobalVariable.SelectedShips[playerIndexList] == 1 then	--usage: skip codes if multiple ships are selected at once (for performance optimization)
			selected_smart = 1
		end
	end
	return selected_smart
end

function Player_CountEnemies(playerIndex)
	local num_enemies = 0
	for z = 0,(Universe_PlayerCount()-1),1 do	        
		if Player_IsAlive(z) == 1 then
			if AreAllied(playerIndex, z) == 0 then
				num_enemies = num_enemies + 1
			end
		end
	end
	return num_enemies
end

function String_ContainsNameBeginningAt(string_input, string_contained, start_location)			--designed for SIMPLEX Campaign AI research HAX!
	local optional_starter = 1
	if start_location == nil then
		optional_starter = 1
	else
		optional_starter = start_location
	end
	local string_output = strsub(string_input, optional_starter, optional_starter + strlen(string_contained) - 1)
	if string_output ~= nil then
		if string_output == string_contained then
			return 1
		end
	else
		return 0
	end
end

function String_ContainsPatternInTable(string_input, table_pattern)
	for z, iCount in table_pattern do
		if strfind(string_input, iCount) ~= nil then
			return 1
		end
	end
	return 0
end

function Player_GetRank(playerIndex)	--returns military rank of the player (from 1 to 7: Ensign, Lieutenant, Commander, Captain, Commodore, Admiral, Fleet Admiral)
	local ranks = {"isFleetAdmiral", "isAdmiral", "isCommodore", "isCaptain", "isCommander", "isLieutenant"}
	local ship = "supporter"..playerIndex
	if Player_GetRace(playerIndex) == Race_Hiigaran then
		ship = "hgn_crewstation"..playerIndex
	end
	if SobGroup_Empty(ship) == 0 then
		for i, hardpoint in ranks do
			if SobGroup_GetHardPointHealth(ship, hardpoint) > 0 then
				return 8-i
			end
		end
	end
	return 1
end

function Player_GrantResearchOption_Smart(playerIndex, research)		--useful in single player mission
	local researchdone = 0
	if Player_HasQueuedResearch(playerIndex, research) == 0 and Player_HasResearch(playerIndex, research) == 0  then		-- and Player_CanResearch(playerIndex, research) == 1
		Player_GrantResearchOption(playerIndex, research)
	elseif Player_HasQueuedResearch(playerIndex, research) == 1 then
		Player_CancelResearch(playerIndex, research)
		Player_GrantResearchOption(playerIndex, research)
	end
	if Player_HasResearch(playerIndex, research) == 1 then
		researchdone = 1
	end
	return researchdone
end

function Player_GrantResearchOption_SoleSurvivor(playerIndex, research)
	local researchdone = 0
	if Player_HasQueuedResearch(playerIndex, research) == 0 and Player_HasResearch(playerIndex, research) == 0  then
		Player_GrantResearchOption(playerIndex, research)
		researchdone = 1
	elseif Player_HasQueuedResearch(playerIndex, research) == 1 then
		Player_CancelResearch(playerIndex, research)
		Player_GrantResearchOption(playerIndex, research)
		researchdone = 1
	end
	return researchdone
end

function Player_Research_Smart(playerIndex , research)		--To solve conflicts with SP game in ai.lua
	if Player_CanResearch(playerIndex, research) == 1 and Player_HasQueuedResearch(playerIndex, research) == 0 and Player_HasResearch(playerIndex, research) == 0 then
		Player_Research(playerIndex, research)
	end
end

function Player_CancelResearch_Smart(playerIndex , research)
	if Player_HasQueuedResearch(playerIndex, research) == 1 then
		Player_CancelResearch(playerIndex, research)
	end
end

function Player_RestrictResearchOption_Smart(playerIndex, research)
	if Player_HasQueuedResearch(playerIndex, research) == 1 then
		Player_CancelResearch(playerIndex, research)
	end
	if Player_CanResearch(playerIndex, research) == 1 then
		Player_RestrictResearchOption(playerIndex, research)
	end
end

function Player_UnrestrictResearchOption_Smart(playerIndex, research)
	if Player_CanResearch(playerIndex, research) == 0 and Player_HasResearch(playerIndex, research) == 0 and Player_HasQueuedResearch(playerIndex, research) == 0 then
		Player_UnrestrictResearchOption(playerIndex, research)
	end
end

function Player_RestrictAllResearchInList(playerIndex, list)
	for z, research in list do
		Player_RestrictResearchOption_Smart(playerIndex, research)
	end
end

function Player_UnrestrictAllResearchInList(playerIndex, list)
	for z, research in list do
		Player_UnrestrictResearchOption_Smart(playerIndex, research)
	end
end

function SobGroup_RestrictBuildOption_Smart(ship, subsystem)
	if SobGroup_CanDoAbility(ship, AB_Builder) == 1 and SobGroup_IsBuilding(ship, subsystem) == 0 then
		SobGroup_RestrictBuildOption(ship, subsystem)
	end
end

function SobGroup_AllowPassiveActionsAlways_Smart(ship, enabled)
	if SobGroup_AreAllInHyperspace(ship) == 1 then
		SobGroup_AllowPassiveActionsAlways(ship, 0)
	else
		SobGroup_AllowPassiveActionsAlways(ship, enabled)
	end
end

function SobGroup_SobGroupAddPlayerShipsByType(GroupToAdd, playerIndex, shiptype)		--for easier use in sobgroupfunctions.lua, also useful in SP missions
	SobGroup_Create("Temp_ShipTypeToAddToSOB")
	SobGroup_FillShipsByType("Temp_ShipTypeToAddToSOB", "Player_Ships"..playerIndex, shiptype)
  SobGroup_SobGroupAdd(GroupToAdd, "Temp_ShipTypeToAddToSOB")
  SobGroup_Clear("Temp_ShipTypeToAddToSOB")
end

function SobGroup_SetInvulnerability_Smart(ship, state)
	if state == 1 then
		SobGroup_SetInvulnerability(ship, 1)
	elseif state == 0 then
		local invincibility_activated = 0
		local playerIndex = 0
		local playerCount = Universe_PlayerCount()
		while playerIndex < playerCount do
			if SobGroup_Empty("haxor_invincible"..playerIndex) == 0 then
				if SobGroup_SobGroupCompare("haxor_invincible"..playerIndex, ship) == 1 then
					invincibility_activated = 1
				end
			end
			playerIndex = playerIndex + 1
		end
		if invincibility_activated == 0 then		--do not remove invincibility when it's already activated in haxor; works for single ship only
			SobGroup_SetInvulnerability(ship, 0)
		end
	end
end

function SobGroup_SetHardPointHealth_Smart(ship, subsystem, health_percentage)		--in case the new health to set is larger than 1
	local new_health = health_percentage
	if health_percentage > 1 then
		new_health = 1
	elseif health_percentage < 0 then
		new_health = 0
	end
	if SobGroup_GetHardPointHealth(ship, subsystem) >= 0 then
		SobGroup_SetHardPointHealth(ship, subsystem, new_health)
	end
end

function SobGroup_GetBinaryHardPointHealth(ship, subsystem)
	if SobGroup_GetHardPointHealth(ship, subsystem) > 0 then
		return 1
	else
		return 0
	end
end

function SobGroup_SetHealth_Smart(ship, health_percentage)
	local new_health = health_percentage
	if health_percentage > 1 then
		new_health = 1
	elseif health_percentage < 0 then
		new_health = 0
	end
	--is haxor invincibility on?
	if SobGroup_SobGroupCompare(ship, "haxor_all_invincibleships") == 0 or new_health > SobGroup_HealthPercentage(ship) then
		SobGroup_SetHealth(ship, new_health)
	end
end

function SobGroup_Despawn_Smart(ship)	--kill a ship without fx (let it simply disappear)
	if SobGroup_SobGroupCompare(ship, "haxor_all_invincibleships") == 0 then
		SobGroup_SetHealth(ship, 0)
		FX_StopEvent(ship, "Death")
	end
end

function SobGroup_SetTactics_Smart(ship, Tactic)
	if SobGroup_SobGroupCompare("DriveMode_SOB"..Universe_CurrentPlayer(), ship) == 0 or UI_IsNamedElementVisible("drive","takingcontrol") == 0 then		--drive mode takes priority
		SobGroup_SetTactics(ship, Tactic)
	end
end

function SobGroup_SetHealth_UpgradeOnly(ship, health_percentage)
	local new_health = health_percentage
	if health_percentage > 1 then
		new_health = 1
	end
	if SobGroup_HealthPercentage(ship) < new_health and SobGroup_HealthPercentage(ship) > 0 then
		SobGroup_SetHealth(ship, new_health)
	end
end

function SobGroup_RestoreHealth(ship, health_increment)
	SobGroup_SetHealth_UpgradeOnly(ship, SobGroup_HealthPercentage(ship)+health_increment)
end

function SobGroup_HardPointTakeDamage(ship, subsystem, damage)
	local current_health = SobGroup_GetHardPointHealth(ship, subsystem)
	SobGroup_SetHardPointHealth(ship, subsystem, current_health-damage)
end

function RemoveSubsystemOnShip(ship, subsystem)
	if SobGroup_GetHardPointHealth(ship, subsystem) > 0 then
  	SobGroup_SetHardPointHealth(ship, subsystem, 0)
  end
end

function CreateSubsystemOnShip(ship, subsystem)   	--not very useful, because the name of the subsystem and the hardpoint name in ship file must be consistent
	if SobGroup_GetHardPointHealth(ship, subsystem) == 0 and SobGroup_HealthPercentage(ship) > 0 then
		if SobGroup_CanDoAbility(ship, AB_Builder) == 1 then
			SobGroup_CreateSubSystem(ship, subsystem)
		end
  end
end

function CreateSubsystemOnShipHardpoint(ship, hardpoint, subsystem)
	if SobGroup_GetHardPointHealth(ship, hardpoint) == 0 and SobGroup_HealthPercentage(ship) > 0 then
		if SobGroup_CanDoAbility(ship, AB_Builder) == 1 then
			SobGroup_CreateSubSystem(ship, subsystem)
		end
  end
end

function CreateSubsystemOnShipHardpoint_Smart(ship, hardpoint, subsystem)
	if SobGroup_GetHardPointHealth(ship, hardpoint) == 0 and SobGroup_HealthPercentage(ship) > 0 then
		if SobGroup_CanDoAbility(ship, AB_Builder) == 1 and SobGroup_IsDoingAbility(ship, AB_Builder) == 0 then 
			SobGroup_CreateSubSystem(ship, subsystem)
		end
  end
end

function SobGroup_CreateSubSystem_OnStart(ship, subsystem)
	if SobGroup_IsBuilding(ship, subsystem) == 0 and SobGroup_HealthPercentage(ship) > 0 then
		SobGroup_CreateSubSystem(ship, subsystem)
	end
end

function SobGroup_UseHyperspaceGate_Smart(ship , gate)		--To solve 00000010 crash hopefully
	if SobGroup_AreAllInRealSpace(ship) == 1 and 
	SobGroup_HealthPercentage(ship) > 0 and 
	SobGroup_CanDoAbility(ship, AB_HyperspaceViaGate) == 1 and 
	SobGroup_IsDoingAbility(ship, AB_Dock) == 0 and 
	SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and 
	SobGroup_IsDoingAbility(ship, AB_HyperspaceViaGate) == 0 and 
	SobGroup_IsDoingAbility(ship, AB_AcceptDocking) == 0 and 
	SobGroup_IsDocked(ship) == 0 and 
	SobGroup_CountCompare(ship, "haxor_all_shipswithoutai") == 0 then
		SobGroup_UseHyperspaceGate(ship, gate)
	end
end

function ShipList_GetByRace(playerIndex)
	local list = ship_list.meg
	if Player_GetRace(playerIndex) == Race_Hiigaran then
	   list = ship_list.hgn
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
	   list = ship_list.vgr
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	   list = ship_list.kad
	elseif Player_GetRace(playerIndex) == Race_Raider then
	   list = ship_list.rad
	elseif Player_GetRace(playerIndex) == Race_Keeper then
	   list = ship_list.kpr
	end
	return list
end

function ShipList_GetRaceTag(playerIndex)
	local race = "vgr"
	if Player_GetRace(playerIndex) == Race_Hiigaran then
	   race = "hgn"
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
	   race = "vgr"
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
	   race = "kad"
	elseif Player_GetRace(playerIndex) == Race_Raider then
	   race = "rad"
	elseif Player_GetRace(playerIndex) == Race_Keeper then
	   race = "kpr"
	end
	return race
end

function SobGroup_AddPlayerShipsInList(SOB, playerIndex, shipnames)
	for z, iCount in shipnames do
		SobGroup_SobGroupAdd(SOB, iCount..playerIndex)
	end
end

function SobGroup_CreateShip_Smart(builder, shipname)
	local single_builder = builder
	if SobGroup_Count(builder) > 1 then
		local numBuilders = SobGroup_SplitGroupReference("single_"..builder, builder, "splitter", SobGroup_Count(builder))
		single_builder = "single_"..builder..random_pseudo(0,numBuilders-1)
	elseif SobGroup_Empty(builder) == 1 then
		return 0
	end
	local playerIndex = SobGroup_OwnedBy(single_builder)
	local playerIndexList = playerIndex + 1
	local ship_created = 0
	if SobGroup_AreAllInRealSpace(single_builder) == 1 and 
	SobGroup_IsSelectable(single_builder) and 
	SobGroup_IsDocked(single_builder) == 0 and 
	SobGroup_IsDoingAbility(single_builder, AB_Dock) == 0 and 
	SobGroup_IsDoingAbility(single_builder, AB_Hyperspace) == 0 and 
	SobGroup_CanDoAbility(single_builder, AB_Builder) == 1 and 
	(SobGroup_GetHardPointHealth(single_builder, "experience") * 10000 > 3 and SobGroup_GetHardPointHealth(single_builder, "experience") < 0.5 or SobGroup_GetHardPointHealth(single_builder, "experience") == 0) and 	--build only after launch
	(SobGroup_IsDoingAbility(single_builder, AB_Parade) == 1 or 
	SobGroup_IsDoingAbility(single_builder, AB_Move) == 1 or	
	SobGroup_IsDoingAbility(single_builder, AB_None) == 1 or 
	SobGroup_IsDoingAbility(single_builder, AB_Attack) == 1 or 
	SobGroup_IsDoingAbility(single_builder, AB_Guard) == 1) then
		local pilot, officer = 0, 0
		for z, iCount in ShipList_GetByRace(playerIndex) do
			if shipname == iCount.name then
				pilot = iCount.pilot
				officer = iCount.officer
				break
			end
		end
		local canbuild = 1
		if pilotpopList[playerIndexList] + pilot > pilotrecruitList[playerIndexList] or officerpopList[playerIndexList] + officer > officerrecruitList[playerIndexList] then
			canbuild = 0
		end
		if canbuild == 1 then
			--print("Creating "..shipname.." from "..single_builder.." owned by player index: "..playerIndex..", game year: "..year)
			SobGroup_CreateShip(single_builder, shipname)
			ship_created = 1
		end
	end
	return ship_created
end

function SobGroup_CreateShip_InstantSpawnDock(builder, shipname, override_mode)	--spawn a ship then instantly dock it to the builder (and launch)
	local single_builder = builder
	if SobGroup_Count(builder) > 1 then
		local numBuilders = SobGroup_SplitGroupReference("single_"..builder, builder, "splitter", SobGroup_Count(builder))
		single_builder = "single_"..builder..random_pseudo(0,numBuilders-1)
	elseif SobGroup_Empty(builder) == 1 then
		return 0
	end
	local playerIndex = SobGroup_OwnedBy(single_builder)
	local ship_created = 0
	if SobGroup_AreAllInRealSpace(single_builder) == 1 and 
	SobGroup_IsSelectable(single_builder) and 
	(SobGroup_GetHardPointHealth(single_builder, "experience") * 10000 > 3 and SobGroup_GetHardPointHealth(single_builder, "experience") < 0.5 or SobGroup_GetHardPointHealth(single_builder, "experience") == 0) and 	--build only after launch
	SobGroup_IsDoingAbility(single_builder, AB_Dock) == 0 and 
	SobGroup_IsDoingAbility(single_builder, AB_Hyperspace) == 0 and 
	SobGroup_IsDocked(single_builder) == 0 then
		local gametime = Universe_GameTime()
		local VOL = "VOL_InstantSpawnDock"..playerIndex.."_"..gametime
		Volume_AddSphere(VOL, SobGroup_GetPosition(single_builder), 6000)
		SobGroup_Create("SOB_InstantSpawnDock")
		SobGroup_Clear("SOB_InstantSpawnDock")
		SobGroup_SpawnNewShipInSobGroup(playerIndex, shipname, "InstantSpawn", "SOB_InstantSpawnDock", VOL)
		Volume_Delete(VOL)
		local undockable_ships = {"shipyard", "kad_destroyer", "rad_blackmarket", "kad_needleship", "hgn_ark", "commandfortress", "mothership", "vgr_battleship", "vgr_superbattleship", "vgr_missledreadnaught"}
		local no_dockpath_single_builders = {"rad_hsbouey"}
		if (override_mode == nil or override_mode == 0) and
		SobGroup_CanDoAbility("SOB_InstantSpawnDock", AB_Dock) == 1 and 
		String_ContainsPatternInTable(strlower(shipname), undockable_ships) == 0 and 
		String_ContainsPatternInTable(strlower(single_builder), no_dockpath_single_builders) == 0 then
			--print("Spawn-launching "..shipname.." from "..single_builder.." owned by player index: "..playerIndex..", game year: "..year)
			SobGroup_DockSobGroupInstant("SOB_InstantSpawnDock", single_builder)
			SobGroup_Launch_Smart("SOB_InstantSpawnDock", single_builder)
		else
			--print("Spawn-parading "..shipname.." from "..single_builder.." owned by player index: "..playerIndex..", game year: "..year)
			SobGroup_ParadeSobGroup("SOB_InstantSpawnDock", single_builder, 1)	--0
		end
		ship_created = 1
	end
	return ship_created
end

function SobGroup_CreateShip_InstantSpawnParade(builder, shipname)	--for debugging (because 00000010 crash can be related to launch issues)
	SobGroup_CreateShip_InstantSpawnDock(builder, shipname, 1)
end

function SobGroup_Attack_Smart(playerIndex, attacker, target)		--order all enemies of playerIndex to attack target
	if SobGroup_Empty(attacker) == 1 or SobGroup_Empty(target) == 1 then
		return
	end
	for i = 0, Universe_PlayerCount()-1 do
		if Player_IsAlive(i) == 1 then
			if AreAllied(i, playerIndex) == 0 and i ~= playerIndex then
				SobGroup_Create("TempAttacker_SOB"..i)
				SobGroup_Clear("TempAttacker_SOB"..i)
				SobGroup_FillCompare("TempAttacker_SOB"..i, "Player_Ships"..i, attacker)
				if SobGroup_Empty("TempAttacker_SOB"..i) == 0 then
					if SobGroup_CanDoAbility("TempAttacker_SOB"..i, AB_Attack) == 1 then
						SobGroup_Attack(i, "TempAttacker_SOB"..i, target)
					end
				end
				SobGroup_Clear("TempAttacker_SOB"..i)
			end
		end
	end
end

function SobGroup_KamikazeOnTargets(ship, target_group, target_group_count)	--get attacked targets and only kamikaze on them
	SobGroup_Create("SOB_KamikazeTargetAttacker")
	SobGroup_Create("SOB_KamikazeTargets")
	SobGroup_Clear("SOB_KamikazeTargets")
	local numtargets = target_group_count or SobGroup_SplitGroupReference("SingleKamikazeTarget_SOB", target_group, ship, SobGroup_Count(target_group))	--save computation by avoiding 2-layer loops
	for y = 0, numtargets - 1, 1 do
		local enemyship = "SingleKamikazeTarget_SOB"..y
		SobGroup_Clear("SOB_KamikazeTargetAttacker")
		SobGroup_GetAttackers(enemyship, "SOB_KamikazeTargetAttacker")
		if SobGroup_SobGroupCompare(ship, "SOB_KamikazeTargetAttacker") == 1 then
			SobGroup_SobGroupAdd("SOB_KamikazeTargets", enemyship)
		end
	end
	if SobGroup_Empty("SOB_KamikazeTargets") == 0 then
		SobGroup_Kamikaze_Smart(ship, "SOB_KamikazeTargets")
	end
	local kamikazeNUM = SobGroup_Count("SOB_KamikazeTargets")
	SobGroup_Clear("SOB_KamikazeTargets")
	return kamikazeNUM
end

function SobGroup_Kamikaze_Smart(ship, target)
	if SobGroup_AreAllInHyperspace(ship) == 0 and 
	SobGroup_AreAllInHyperspace(target) == 0 and 
	SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and
	SobGroup_IsDoingAbility(target, AB_Hyperspace) == 0 then
		SobGroup_Kamikaze(ship, target)
	end
end

function SobGroup_DockSobGroupInstant_Smart(ship, target)		--used in single player mission
	if SobGroup_CanDoAbility(ship, AB_Move) == 1 and SobGroup_CanDoAbility(ship, AB_Dock) == 1 then
		SobGroup_DockSobGroupInstant(ship, target)
	end
end

function SobGroup_DockSobGroupAndStayDocked_Smart(ship, target)
	if SobGroup_AreAllInHyperspace(ship) == 0 and 
	SobGroup_AreAllInHyperspace(target) == 0 and 
	SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and
	SobGroup_IsDoingAbility(target, AB_Hyperspace) == 0 then
		SobGroup_DockSobGroupAndStayDocked(ship, target)
		--print("Stay-docking "..ship.." (owned by player "..SobGroup_OwnedBy(ship)..") to "..target.." (owned by player "..SobGroup_OwnedBy(target).."), year: "..year)
	end
end

function SobGroup_DockSobGroup_Smart(ship, target)
	if SobGroup_AreAllInHyperspace(ship) == 0 and 
	SobGroup_AreAllInHyperspace(target) == 0 and 
	SobGroup_IsDoingAbility(ship, AB_Hyperspace) == 0 and
	SobGroup_IsDoingAbility(target, AB_Hyperspace) == 0 then
		SobGroup_DockSobGroup(ship, target)
		--print("Docking "..ship.." (owned by player "..SobGroup_OwnedBy(ship)..") to "..target.." (owned by player "..SobGroup_OwnedBy(target).."), year: "..year)
	end
end

function SobGroup_DockSobGroup_random_pseudo(ship, target, mode)
	if SobGroup_Empty(target) == 0 and SobGroup_Empty(ship) == 0 then
		local numDocks = SobGroup_Count(target)
		SobGroup_SplitGroupReference("Single_RandomDock_SOB", target, ship, numDocks, 0)
		local z=random_pseudo(0,numDocks-1)
		if mode == nil then
			SobGroup_DockSobGroup_Smart(ship, "Single_RandomDock_SOB"..z)
		elseif mode == 0 then
			SobGroup_DockSobGroup_Smart(ship, "Single_RandomDock_SOB"..z)
		elseif mode == 1 then
			SobGroup_DockSobGroupAndStayDocked_Smart(ship, "Single_RandomDock_SOB"..z)
		elseif mode == 2 then
			SobGroup_DockSobGroupInstant(ship, "Single_RandomDock_SOB"..z)
		end
	end
end

RaceCheck_Runtimes = 5

function RaceCheck()		--activated by onint.lua
	Temp_GlobalVariable.RaceCheck_Save = Temp_GlobalVariable.RaceCheck_Save + 1
	if Temp_GlobalVariable.RaceCheck_Save > RaceCheck_Runtimes then		--one runtime for one small chunk of the codes
		Temp_GlobalVariable.RaceCheck_Save = 1
	end
	--print("RaceCheck - Start, RaceCheck_Save = "..Temp_GlobalVariable.RaceCheck_Save)
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			if Temp_GlobalVariable.RaceCheck_Save == 1 then
				--if (Player_HasResearch(playerIndex, "FighterBoost") == 1) then
					--speedBoostAirCombat(playerIndex)	--Special Aircraft	--doesn't work anyway, and ship boost is now checked for all fighters, so this is redundant
				--end
				if Player_GetRace(playerIndex) == 2 then
					if (Player_HasResearch(playerIndex, "FighterBoost") == 1) then
						speedBoostVaygr(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "CorvetteBoost") == 1) then
						speedBoostVaygrCorvette(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "WeaponSpeedUpgrade1") == 1) then
						speedBoostVaygrWeapon(playerIndex)
					end
					if SobGroup_Count("vgr_probe"..playerIndex) > 0 or 
					SobGroup_Count("vgr_probe_prox"..playerIndex) > 0 or 
					SobGroup_Count("vgr_probe_ecm"..playerIndex) > 0 or 
					SobGroup_Count("vgr_probe_smallhsbeacon"..playerIndex) > 0 then
						fuelConsumptionVaygrProbe(playerIndex)
					end
					local num_platform = 0
					for z, iCount in vaygrboostshipsPlatform do
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, iCount) > 0 then
							num_platform = num_platform + 1
							break
						end
					end
					if num_platform > 0 then
						fuelConsumptionVaygrPlatform(playerIndex)
					end
					if (SobGroup_Count("vgr_commandcorvette"..playerIndex) > 0) then
						if (Player_HasResearch(playerIndex, "JDAMdesignator") == 1) then
							LaunchVaygrJDAM(playerIndex)
						end
					elseif Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_JDAM") > 0 then
						DestroyAllVaygrJDAM(playerIndex)
					end
					if SobGroup_Count("vgr_sinner"..playerIndex) > 0 and Player_HasResearch(playerIndex, "ImprovedSinnerArmour1") == 1 then
						EntrenchVaygrSinner(playerIndex)
					end
					if Player_HasResearch(playerIndex, "RepairBeam" ) == 1 then
						RepairBeam_DummyRepair(playerIndex)		--not just for dummies anymore
					end
					if (Player_HasResearch(playerIndex, "CapitalSmokeScreen") == 1) then
						if SobGroup_Count("vgr_ALLsmokers"..playerIndex) >= 1 then
							SmokeScreenVgrDestroyer(playerIndex)
						end
					end
					if SobGroup_Count("vgr_destroyer"..playerIndex) >= 1 then
						CustomizeVaygrDestroyer(playerIndex)
					end
					Vgr_KillDummyObjects(playerIndex)
				end
			end
			
			if Temp_GlobalVariable.RaceCheck_Save == 2 then
				if Player_GetRace(playerIndex) == 1 then
					if (Player_HasResearch(playerIndex, "FighterBoost") == 1) then
						speedBoostHgn(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "CorvetteBoost") == 1) then
						speedBoostHgnCorvette(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "WeaponSpeedUpgrade1") == 1) then
						speedBoostHgnWeapon(playerIndex)
					end
					if SobGroup_Count("hgn_probe"..playerIndex) > 0 or 
					SobGroup_Count("hgn_proximitysensor"..playerIndex) > 0 or 
					SobGroup_Count("hgn_ecmprobe"..playerIndex) > 0 then
						fuelConsumptionHgnProbe(playerIndex)
					end
					local num_platform = 0
					for z, iCount in HgnboostshipsPlatform do
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, iCount) > 0 then
							num_platform = num_platform + 1
							break
						end
					end
					if num_platform > 0 then
						fuelConsumptionHgnPlatform(playerIndex)
					end
					--if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hammerhead") > 0 then
						--phaseArmourActivate(playerIndex)
					--end
					if (Player_HasResearch(playerIndex, "ImprovedDestroyerArmour") == 1) then
						if SobGroup_Count("hgn_ALLdestroyers"..playerIndex) >= 1 then
							ECMUpgradeHgnDestroyer(playerIndex)
						end
					end
					Hgn_KillDummyObjects(playerIndex)
				end
			end
			
			if Temp_GlobalVariable.RaceCheck_Save == 3 then
				if Player_GetRace(playerIndex) == Race_Kadeshi then
				
					if Player_HasResearch(playerIndex, "BlessedGarden") == 1 then
						local ships_in_garden = 0
						for i = 1, Table_CountElements(gardenshiptable), 1 do
							ships_in_garden = ships_in_garden + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, gardenshiptable[i])
						end
						if ships_in_garden > 0 then
							BlessedGarden(playerIndex)
						end
					end
					if Player_HasResearch(playerIndex, "GardenOfThorns") == 1 then
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_nebuladrone") > 0 then
							RosegardenOfThorns(playerIndex)
						end
					end
					if Player_HasResearch(playerIndex, "Garden3") == 1 and Player_CanResearch(playerIndex, "hasnebulapod") == 1 then
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer_real") > 0 then
							GeneratingNebulaTemplar(playerIndex)
						end
					end
					if Player_HasResearch(playerIndex, "GardenWillOfTheGarden") == 1 then
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multibeam_new") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multigun") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_multibeam") > 0 then	
							WillOfTheGarden(playerIndex)
						end
					end
				
				-- bounty Code
					if (Player_HasResearch(playerIndex, "SajuukTwistedFaiith") == 1) then
						local pilotrefund = 50
						local pilotlost = LastpilotpopList[playerIndex+1] - pilotpopList[playerIndex+1]
						if pilotlost > 0 then
							AccoladesAddRU(playerIndex, pilotlost * pilotrefund)
							--Player_SetRU(playerIndex, Player_GetRU(playerIndex) + pilotlost * pilotrefund)
						end
						local officerrefund = 500
						local officerlost = LastofficerpopList[playerIndex+1] - officerpopList[playerIndex+1]
						if pilotlost > 0 then
							AccoladesAddRU(playerIndex, officerlost * officerrefund)
							--Player_SetRU(playerIndex, Player_GetRU(playerIndex) + officerlost * officerrefund)
						end
							      	--watch out if you decide to redefine this in population.lua
		      	LastpilotpopList[playerIndex+1] = pilotpopList[playerIndex+1]  
		        LastofficerpopList[playerIndex+1] = officerpopList[playerIndex+1]
					end
				
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_new") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_swarmer_hybrid") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_advancedswarmer") > 0 then
						FuryOfKadesh(playerIndex)
					end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_needleship") > 0 then
						buildBoostKadeshi(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "Kadesh3") == 1) then
						if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kad_destroyer") > 0 then
							shieldAvatar(playerIndex)
						end
					end
					if (Player_HasResearch(playerIndex, "FighterBoost") == 1) then
						speedBoostKad(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "CorvetteBoost") == 1) then
						speedBoostKadCorvette(playerIndex)
					end
					
					--ascension perks research integrity check
					KadAscensionPerks(playerIndex)
					
				end
			end
			
			if Temp_GlobalVariable.RaceCheck_Save == 4 then
				if Player_GetRace(playerIndex) == Race_Raider then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_carrier") > 0 then
						boostLord(playerIndex)
					end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_blackmarket") > 0 then
						BlackMarketCasino(playerIndex)
					end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_beamfrigate") > 0 then
						if Player_HasResearch(playerIndex, "FrigateSuperGuns") == 1 then
							protechGuns(playerIndex)
						end
					end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_gattlingfrigate") > 0 then
						spittinleead(playerIndex)
					end
					
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_explotrap") > 0 then
						findExploTrapMissiles(playerIndex)
						destroyCruiseMissiles(playerIndex)
					end
					
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_smokegrenade") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_smokegrenade1") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_smokegrenade2") > 0 then
						Rad_KillSmokeGrenades(playerIndex)
					end
					
					if (Player_HasResearch(playerIndex, "FighterBoost") == 1) then
						speedBoostRad(playerIndex)
					end
					if (Player_HasResearch(playerIndex, "CorvetteBoost") == 1) then
						speedBoostRadCorvette(playerIndex)
					end
					
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nucleartube1") > 0 and Player_HasResearch(playerIndex, "SpecialAbility10Level1") == 1 then
						ModifyRadNuke(playerIndex)
					end
					
					if Player_HasResearch(playerIndex, "WeaponSpeedUpgrade1") == 1 then
						speedBoostRadWeapon(playerIndex)
					end
				end
			end
			
		end
		playerIndex = playerIndex + 1
	end
	
	if Temp_GlobalVariable.RaceCheck_Save == 5 then
		--Shipwreck spawn function (it's put here because of the fast 1.0 interval check rate)
		SpawnShipwreckCheck()		--in Megalith.lua
		
		Rule_RandomInterval("RaceCheck", 1/RaceCheck_Runtimes, 0)	--variation was 0.1, now decreased to suit the accurate timing need of the shipwreck system 
	end

	--print("RaceCheck - End")
end

function Update_AllShips()
    SobGroup_Create("AllShips")
    SobGroup_Clear("AllShips")
    for iPlayerIndex = 0, Universe_PlayerCount() - 1 do
        if (Player_IsAlive(iPlayerIndex) == 1) then
            SobGroup_SobGroupAdd("AllShips", "Player_Ships"..iPlayerIndex)
        end
    end
end

function Update_AllMegaliths()    --group all ships belonging to player index: -1
  Update_AllShips()
  SobGroup_Create("AllMegaliths")
  SobGroup_Clear("AllMegaliths")
  if SobGroup_Empty("AllShips") == 0 then
    Player_FillProximitySobGroup("AllMegaliths", -1, "AllShips", 10000000)
  end
  if SobGroup_Empty("AllMegaliths") == 0 then
    return 1
  else
  	return 0
  end
end

function Vector_Operation(table1, param2, operation)	--for 2 tables with same size for element-wise calculation, or the second parameter can be a scalar
	--FUCK THIS SHIT: do not use tinsert() when defining a new indexed table!!! It seems to be storing the indices as strings somehow and will fuck up other vector operations! 
	local operator = strlower(operation)
	--print("table1="..Vector_tostring(table1))
	local table2 = {}
	local length = getn(table1)
	if type(param2) == "number" then
		for i=1, length, 1 do
			table2[i]=param2
		end
		--print("table2="..Vector_tostring(table2))
	else
		table2 = param2
		--print("param2="..Vector_tostring(param2))
	end
	local table_out = {}
	if Table_ElementIsIn(operator, {"+", "plus", "add", "addition"}) == 1 then
		for i=1, length, 1 do
			table_out[i] = table1[i]+table2[i]
		end
	elseif Table_ElementIsIn(operator, {"-", "minus", "subtract", "subtraction"}) == 1 then
		for i=1, length, 1 do
			table_out[i] = table1[i]-table2[i]
		end
	elseif Table_ElementIsIn(operator, {"*", "times", "multiply", "multiplies", "multiplication"}) == 1 then
		for i=1, length, 1 do
			table_out[i] = table1[i]*table2[i]
		end
	elseif Table_ElementIsIn(operator, {"/", "divide", "divides", "division", "divided by"}) == 1 then
		for i=1, length, 1 do
			table_out[i] = table1[i]/table2[i]
		end
	end
	return table_out
end

function Vector_sum(t)
	local sum = 0
	for z, iCount in t do
		sum = sum + iCount
	end
	return sum
end

function Vector_mean(t)
	return Vector_sum(t)/getn(t)
end

function Vector_tostring(t)
	local str = "{"
	local last_idx = getn(t)
	local z=0
	for x, iCount in t do	--the index for a table created using tinsert() is somehow a string!
		z=z+1
		str = str..iCount
		if z<last_idx then
			str = str..", "
		elseif z==last_idx then
			str = str.."}"
		end
	end
	return str
end

function Vector_var(t)
	local mean = Vector_mean(t)
	local var = 0
	for z, iCount in t do
		var = var + (iCount - mean)^2
	end
	return var/getn(t)
end

function Vector_stdev(t)
	return sqrt(var(t))
end

function Vector_max(t)
	local num = t[1]
	for z, iCount in t do
		if iCount > num then
			num = iCount
		end
	end
	return num
end

function Vector_min(t)
	local num = t[1]
	for z, iCount in t do
		if iCount < num then
			num = iCount
		end
	end
	return num
end

function Vector_zeroes(n)	--returns a zero vector with n dimensions
	local v = {}
	for i=1, n, 1 do
		v[i]=0
	end
	return v
end

function Vector_distance(vec1, vec2)	--euclidean distance (the two vectors must have the same dimensions)
	local sum = 0
	for z, iCount in vec2 do
		sum = sum + (vec1[z]-vec2[z])^2
	end
	return sqrt(sum)
end

function Vector_modulus(t)	--returns the distance to the origin
	return Vector_distance(t, Vector_zeroes(getn(t)))
end
function Vector_length(t)
	return Vector_modulus(t)
end

function Vector_unit(t)	--returns a unit vector with length = 1 in the same direction
	local length = Vector_length(t)
	return Vector_Operation(t, length, "/")
end

--Count elements in a table, same with getn()
function Table_CountElements(TableToCount)
	local i = 0
	repeat
		i = i +1
	until (not TableToCount[i + 1])
  return i
end

function Table_RandomElement(list)
	local output = ""
	if Table_CountElements(list) > 0 then
		output = list[random_pseudo(1,Table_CountElements(list))]
		return output
	else
		return nil
	end
end

function Table_Subrange(t, first, last)
  local newt = {}
  for i=first,last do
    newt[getn(newt) + 1] = t[i]
  end
  return newt
end

function Table_CombineWithTable(TargetTable, NewElements)	--returns the combination of two tables; tinsert() was abandoned because it's buggy!!!
	local new_table = {}
	for z, iCount in TargetTable do
		new_table[z] = iCount
	end
	local size = getn(new_table)
	for z, iCount in NewElements do
		new_table[z+size] = iCount
	end
	return new_table
end

function Table_ContainElement(list, element)
	local itemfound = 0
	for z, iCount in list do
		if iCount == element then
			itemfound = 1
			break
		end
	end
	return itemfound
end

function Table_InsertUnique(list, elements)	--insert new elements that are not already in the table;	tinsert() was abandoned because it's buggy!!!
	local new_table = {}
	for z, iCount in list do
		new_table[z] = iCount
	end
	local idx = getn(new_table)
	for z, iCount in elements do
		if Table_ContainElement(new_table, iCount) == 0 then
			idx = idx+1
			new_table[idx] = iCount
		end
	end
	return new_table
end

function Table_ElementIsIn(element, list)
	return Table_ContainElement(list, element)
end

function Table_DeleteElement(list, element)	--1 dimension only
	local new_table = {}
	local table_serial = 1
	for z, iCount in list do
		if iCount ~= element then
			new_table[table_serial] = iCount
		end
		table_serial = table_serial + 1
	end
	return new_table
end

function Table_DeleteElementsByIDs(t, id_list) --remove items in the table by IDs using an exclusion mechanism (to replace tremove, preventing screwing up the original data schema for multi-dimensional or nested data)
	local new_table = {}
	local counter = 0
	for z=1, getn(t), 1 do
		if Table_ContainElement(id_list, z) == 0 then	--exclude the given ids and add the rest items to a new temporary list
			counter = counter + 1
			new_table[counter] = t[z]
		end
	end
	return new_table
end

function Table_Apply(t, f, tArgsTable) --for table t, apply function f to its every element; tArgsTable contains additional arguments for the function
	for z, iCount in t do
		f(iCount, tArgsTable)
	end
end

function Table_Which(t, x) --return the index of x in table
	for z, iCount in t do
		if x==iCount then
			return z
		end
	end
	return nil	--no element found, returns nil
end

function spittinleead(playerIndex)
	SobGroup_Create("Raider_GattFrig_SOB")
	Player_FillShipsByType("Raider_GattFrig_SOB", playerIndex, "rad_gattlingfrigate")
	if  (Player_HasResearch(playerIndex, "SpittinLeadSuper") == 1) then 
		--Update_AllShips()
		local numFrigs = SobGroup_Count("Raider_GattFrig_SOB")
		if numFrigs > 0 then
			numFrigs = SobGroup_SplitGroupReference("SingleGattFrig_SOB", "Raider_GattFrig_SOB", "frigates"..playerIndex, numFrigs )
			for counter = 0, numFrigs -1, 1 do
				if (SobGroup_IsDoingAbility("SingleGattFrig_SOB" .. counter, AB_DefenseField) == 1) then
					-- shoot them all up!
					SobGroup_ChangePower("Raider_GattFrig_SOB", "Weapon_Gattling", 0)
					SobGroup_ChangePower("Raider_GattFrig_SOB", "Weapon_GattlingHeavy", 1)
				else
					-- back to normal
					SobGroup_ChangePower("Raider_GattFrig_SOB", "Weapon_Gattling", 1)
					SobGroup_ChangePower("Raider_GattFrig_SOB", "Weapon_GattlingHeavy", 0)
				end
			end
		end
	else
		-- fuck you! turn em all of!
		SobGroup_ChangePower("Raider_GattFrig_SOB", "Weapon_Gattling", 1)
		SobGroup_ChangePower("Raider_GattFrig_SOB", "Weapon_GattlingHeavy", 0)
	end
end

-- kills beamfrigs if too little health
function protechGuns(playerIndex)
	--Update_AllShips()
	SobGroup_Create("Raider_Beamfrig_SOB")
	Player_FillShipsByType("Raider_Beamfrig_SOB", playerIndex, "rad_beamfrigate")
	local numFrigs = SobGroup_Count("Raider_Beamfrig_SOB")
	if numFrigs > 0 then
		numFrigs = SobGroup_SplitGroupReference("SingleBeamFrig_SOB", "Raider_Beamfrig_SOB", "frigates"..playerIndex, numFrigs )
		for counter = 0, numFrigs -1, 1 do
			if SobGroup_HealthPercentage("SingleBeamFrig_SOB"..counter) < 0.01*random_pseudo(1,20) then
				SobGroup_SetHealth_Smart("SingleBeamFrig_SOB"..counter, 0)
			end
		end
	end
end

--this function is no longer for speed boost, let's invent something new
function boostLord(playerIndex)
	if 0 < NeededPilots[playerIndex + 1] then
		--Update_AllShips()
		local numLords = SobGroup_SplitGroupReference("SingleLord_SOB", "rad_carrier"..playerIndex, "carriers", SobGroup_Count("rad_carrier"..playerIndex) )
		for counter = 0, numLords -1, 1 do
			if (SobGroup_IsDoingAbility("SingleLord_SOB" .. counter, AB_DefenseField) == 1) then
				if random_pseudo(1,3) == 1 then		--spam frequency tweak
					if (Player_HasResearch(playerIndex, "CarrierSuperSpeed") == 1) then 
						if random_pseudo(1,2) == 1 then
							local shiptype = random_pseudo(1, Table_CountElements(RadboostshipsAlt))
							SobGroup_CreateShip_InstantSpawnDock("SingleLord_SOB"..counter, RadboostshipsAlt[shiptype])
						else
							local shiptype = random_pseudo(1, Table_CountElements(Radboostships))
							SobGroup_CreateShip_InstantSpawnDock("SingleLord_SOB"..counter, Radboostships[shiptype])
						end
					else
						SobGroup_CreateShip_InstantSpawnDock("SingleLord_SOB"..counter, "rad_interceptor")
					end
				end
			end
		end
	end
end

function BlackMarketCasino(playerIndex)
	local numships = SobGroup_SplitGroupReference("SingleCasinoRad_SOB", "rad_blackmarket"..playerIndex, "commandfortresses", SobGroup_Count("rad_blackmarket"..playerIndex))
	for counter = 0, numships - 1, 1 do
		--limit gambling options
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "cb3") > 0 then
			if Player_GetRU(playerIndex) < 888 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_thedude")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_thedude")
			end
			if Player_GetRU(playerIndex) < 1000 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru1000")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru1000")
			end
			if Player_GetRU(playerIndex) < 2000 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru2000")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru2000")
			end
			if Player_GetRU(playerIndex) < 5000 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru5000")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru5000")
			end
			if Player_GetRU(playerIndex) < 1 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_rutotal")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_rutotal")
			end
			if LastpowerListStored[playerIndex + 1] < 100 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_en100")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_en100")
			end
			if LastpowerListStored[playerIndex + 1] < 1 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_entotal")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_entotal")
			end
			if honorList[playerIndex + 1] < 100 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honor100")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honor100")
			end
			if honorList[playerIndex + 1] < 1 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honortotal")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honortotal")
			end
			if floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "pop")*100000) < 200 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop200")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop200")
			end
			if floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "pop")*100000) < 500 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop500")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop500")
			end
			if floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "pop")*100000) < 1000 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop1000")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop1000")
			end
			if floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "pop")*100000) < 1 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_poptotal")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_poptotal")
			end
			if floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "experience")*10000) < 100 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xp100")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xp100")
			end
			if floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "experience")*10000) < 1 then
				SobGroup_RestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xptotal")
			else
				SobGroup_UnRestrictBuildOption("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xptotal")
			end
		end
		--excute gambling
		local pro = 0
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_thedude") > 0 then
			pro = 12
		end
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru1000") > 0 then
			BlackMarketCasinoPayoff(playerIndex, "SingleCasinoRad_SOB"..counter, 10+pro, 1000)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru1000", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru2000") > 0 then
			BlackMarketCasinoPayoff(playerIndex, "SingleCasinoRad_SOB"..counter, 20+pro, 2000)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru2000", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru5000") > 0 then
			BlackMarketCasinoPayoff(playerIndex, "SingleCasinoRad_SOB"..counter, 30+pro, 5000)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_ru5000", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_rutotal") > 0 then
			local allru = Player_GetRU(playerIndex)
			Player_SetRU(playerIndex, 0)
			BlackMarketCasinoPayoff(playerIndex, "SingleCasinoRad_SOB"..counter, 40+pro, allru + 1)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_rutotal", 0)
		end
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_en100") > 0 then
			powerListStored[playerIndex + 1] = powerListStored[playerIndex + 1] - 100
			powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc - 100
			BlackMarketCasinoPayoffEN(playerIndex, "SingleCasinoRad_SOB"..counter, 20+pro, 100)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_en100", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_entotal") > 0 then
			local allen = LastpowerListStored[playerIndex + 1]
			powerListStored[playerIndex + 1] = 0
			powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc - allen
			BlackMarketCasinoPayoffEN(playerIndex, "SingleCasinoRad_SOB"..counter, 30+pro, allen)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_entotal", 0)
		end
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honor100") > 0 then
			honourstartList1[playerIndexList] = 0 	--you can use up all your honour points
		--honourstartList[playerIndexList] = 0
			honorbonus[playerIndex + 1] = honorbonus[playerIndex + 1] - 100
			BlackMarketCasinoPayoffHonor(playerIndex, "SingleCasinoRad_SOB"..counter, 10+pro, 100)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honor100", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honortotal") > 0 then
			honourstartList1[playerIndexList] = 0 	--you can use up all your honour points
		--honourstartList[playerIndexList] = 0
			local allhonor = honorList[playerIndex + 1]
			honorbonus[playerIndex + 1] = honorbonus[playerIndex + 1] - allhonor
			BlackMarketCasinoPayoffHonor(playerIndex, "SingleCasinoRad_SOB"..counter, 20+pro, allhonor)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_honortotal", 0)
		end
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop200") > 0 then
			BlackMarketCasinoPayoffPop(playerIndex, "SingleCasinoRad_SOB"..counter, 10+pro, 200)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop200", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop500") > 0 then
			BlackMarketCasinoPayoffPop(playerIndex, "SingleCasinoRad_SOB"..counter, 20+pro, 500)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop500", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop1000") > 0 then
			BlackMarketCasinoPayoffPop(playerIndex, "SingleCasinoRad_SOB"..counter, 30+pro, 1000)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_pop1000", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_poptotal") > 0 then
			local allpop = floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "pop")*100000)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "pop", 0.000001)
			BlackMarketCasinoPayoffPop(playerIndex, "SingleCasinoRad_SOB"..counter, 40+pro, allpop)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_poptotal", 0)
		end
		if SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xp100") > 0 then
			BlackMarketCasinoPayoffXP(playerIndex, "SingleCasinoRad_SOB"..counter, 20+pro, 100)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xp100", 0)
		elseif SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xptotal") > 0 then
			local allxp = floor(SobGroup_GetHardPointHealth("SingleCasinoRad_SOB"..counter, "experience")*10000)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "experience", 0.00001)
			BlackMarketCasinoPayoffXP(playerIndex, "SingleCasinoRad_SOB"..counter, 30+pro, allxp)
			SobGroup_SetHardPointHealth("SingleCasinoRad_SOB"..counter, "rad_bm_orders_xptotal", 0)
		end
	end
end

function BlackMarketCasinoPayoffXP(playerIndex, ship, percentage, payoff)
	local delta = payoff/10000
	if SobGroup_GetHardPointHealth(ship, "experience") - delta < 0.00001 then
		SobGroup_SetHardPointHealth(ship, "experience", 0.00001)
	else
		SobGroup_SetHardPointHealth(ship, "experience", SobGroup_GetHardPointHealth(ship, "experience") - delta)
	end
	local oddity = 0.01*random_pseudo(1,5000)
	if random_pseudo(0,99) < percentage then
		local addition = payoff*oddity/10000
		if SobGroup_GetHardPointHealth(ship, "experience") + addition >= 1 then
			SobGroup_SetHardPointHealth(ship, "experience", 0.99999)
		else
			SobGroup_SetHardPointHealth(ship, "experience", SobGroup_GetHardPointHealth(ship, "experience") + addition)
		end
		BlackMarketCasinoDisplay(playerIndex, ship, 5, payoff*oddity, oddity)
	else		--loser!
		BlackMarketCasinoDisplay(playerIndex, ship, 0, 0, 0)
	end
end

function BlackMarketCasinoPayoffPop(playerIndex, ship, percentage, payoff)
	local delta = payoff/100000
	if SobGroup_GetHardPointHealth(ship, "pop") - delta < 0.000001 then
		SobGroup_SetHardPointHealth(ship, "pop", 0.000001)
	else
		SobGroup_SetHardPointHealth(ship, "pop", SobGroup_GetHardPointHealth(ship, "pop") - delta)
	end
	local oddity = 0.01*random_pseudo(1,5000)
	if random_pseudo(0,99) < percentage then
		local addition = payoff*oddity/100000
		local limitpop = 2000
		for i=1,6,1 do
			if SobGroup_GetHardPointHealth(ship, "cb"..i) > 0 then
				limitpop = limitpop + 2000
			end
		end
		if (SobGroup_GetHardPointHealth(ship, "pop") + addition)*100000 > limitpop then
			SobGroup_SetHardPointHealth(ship, "pop", limitpop/100000)
		else
			SobGroup_SetHardPointHealth(ship, "pop", SobGroup_GetHardPointHealth(ship, "pop") + addition)
		end
		BlackMarketCasinoDisplay(playerIndex, ship, 4, payoff*oddity, oddity)
	else		--loser!
		BlackMarketCasinoDisplay(playerIndex, ship, 0, 0, 0)
	end
end

function BlackMarketCasinoPayoffHonor(playerIndex, ship, percentage, payoff)
	local oddity = 0.01*random_pseudo(1,5000)
	if random_pseudo(0,99) < percentage then
		honorbonus[playerIndex + 1] = honorbonus[playerIndex + 1] + floor(payoff*oddity)
		BlackMarketCasinoDisplay(playerIndex, ship, 3, payoff*oddity, oddity)
	else		--loser!
		BlackMarketCasinoDisplay(playerIndex, ship, 0, 0, 0)
	end
end

function BlackMarketCasinoPayoff(playerIndex, ship, percentage, payoff)
	local oddity = 0.01*random_pseudo(1,5000)
	if random_pseudo(0,99) < percentage then
		AccoladesAddRU(playerIndex, payoff*oddity)
		BlackMarketCasinoDisplay(playerIndex, ship, 1, payoff*oddity, oddity)
	else		--loser!
		BlackMarketCasinoDisplay(playerIndex, ship, 0, 0, 0)
	end
end

function BlackMarketCasinoPayoffEN(playerIndex, ship, percentage, payoff)
	local oddity = 0.01*random_pseudo(1,5000)
	if random_pseudo(0,99) < percentage then
		local powermax = LastpowerListMax[playerIndex+1]
		if powerListStored[playerIndex + 1] + floor(payoff*oddity) > powermax then
			powerListStored[playerIndex + 1] = powermax
		else
			powerListStored[playerIndex + 1] = powerListStored[playerIndex + 1] + floor(payoff*oddity)
		end
		BlackMarketCasinoDisplay(playerIndex, ship, 2, payoff*oddity, oddity)
		powerListManager[playerIndex + 1].production = powerListManager[playerIndex + 1].production + floor(payoff*oddity)
	else		--loser!
		BlackMarketCasinoDisplay(playerIndex, ship, 0, 0, 0)
	end
end

function BlackMarketCasinoDisplay(playerIndex, ship, type, reward, oddity)
	if playerIndex == Universe_CurrentPlayer() then
		local money = floor(reward)
		local noru = " "
		local winbig = ""
		if money == 0 then
			noru = "! "
		end
		if oddity <= 0.1 then
			winbig = "Unfuckingbelievable! "
		elseif oddity <= 0.5 then
			winbig = "Oops! "
		elseif oddity <= 1 then
			winbig = "Ugh... "
		elseif oddity <= 5 then
			winbig = "Yeah! "
		elseif oddity <= 15 then
			winbig = "OMG! "
		elseif oddity <= 30 then
			winbig = "OMGWTF!! "
		else
			winbig = "OMGWTFHAX!!! "
		end
		if type == 1 then		--win RUs 
		  UI_PlaySound("SFX_cash1")
		  --Subtitle_Add(12,""..winbig.."You won"..noru..""..money.." RUs!", 2.711)
	    UI_SetScreenEnabled("gamble", 1)		
			UI_SetScreenVisible("gamble", 1)	
			UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
			UI_SetElementVisible("gamble", "gamble_lose", 0)
			UI_SetElementVisible("gamble", "gamble_lose1", 0)
			UI_SetElementVisible("gamble", "gamble_win", 1)
			UI_SetTextLabelText("gamble", "lblDescription1", winbig)
			UI_SetTextLabelText("gamble", "lblDescription2", "You won"..noru..""..money.." RUs!")
			UI_ShowRandomElement("gamble", "btnWin", 1)
			UI_ShowRandomElement("gamble", "btnLose", 0)
		elseif type == 2 then		--win energy 
		  UI_PlaySound("SFX_cash1")		--SFX_meow
		  --Subtitle_Add(12,""..winbig.."You won"..noru..""..money.." Energy!", 2.711)
	    UI_SetScreenEnabled("gamble", 1)		
			UI_SetScreenVisible("gamble", 1)	
			UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
			UI_SetElementVisible("gamble", "gamble_lose", 0)
			UI_SetElementVisible("gamble", "gamble_lose1", 0)
			UI_SetElementVisible("gamble", "gamble_win", 1)
			UI_SetTextLabelText("gamble", "lblDescription1", winbig)
			UI_SetTextLabelText("gamble", "lblDescription2", "You won"..noru..""..money.." Energy!")
			UI_ShowRandomElement("gamble", "btnWin", 1)
			UI_ShowRandomElement("gamble", "btnLose", 0)
		elseif type == 3 then		--win honor 
		  UI_PlaySound("SFX_cash1")
		  --Subtitle_Add(12,""..winbig.."You won"..noru..""..money.." Honor Points!", 2.711)
	    UI_SetScreenEnabled("gamble", 1)		
			UI_SetScreenVisible("gamble", 1)	
			UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
			UI_SetElementVisible("gamble", "gamble_lose", 0)
			UI_SetElementVisible("gamble", "gamble_lose1", 0)
			UI_SetElementVisible("gamble", "gamble_win", 1)
			UI_SetTextLabelText("gamble", "lblDescription1", winbig)
			UI_SetTextLabelText("gamble", "lblDescription2", "You won"..noru..""..money.." Honor Points!")
			UI_ShowRandomElement("gamble", "btnWin", 1)
			UI_ShowRandomElement("gamble", "btnLose", 0)
		elseif type == 4 then		--win population 
		  UI_PlaySound("SFX_cash1")
		  --Subtitle_Add(12,""..winbig.."You won"..noru..""..money.." Population!", 2.711)
	    UI_SetScreenEnabled("gamble", 1)		
			UI_SetScreenVisible("gamble", 1)	
			UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
			UI_SetElementVisible("gamble", "gamble_lose", 0)
			UI_SetElementVisible("gamble", "gamble_lose1", 0)
			UI_SetElementVisible("gamble", "gamble_win", 1)
			UI_SetTextLabelText("gamble", "lblDescription1", winbig)
			UI_SetTextLabelText("gamble", "lblDescription2", "You won"..noru..""..money.." Population!")
			UI_ShowRandomElement("gamble", "btnWin", 1)
			UI_ShowRandomElement("gamble", "btnLose", 0)
		elseif type == 5 then		--win experience 
		  UI_PlaySound("SFX_cash1")
		  --Subtitle_Add(12,""..winbig.."You won"..noru..""..money.." Experience!", 2.711)
	    UI_SetScreenEnabled("gamble", 1)		
			UI_SetScreenVisible("gamble", 1)	
			UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
			UI_SetElementVisible("gamble", "gamble_lose", 0)
			UI_SetElementVisible("gamble", "gamble_lose1", 0)
			UI_SetElementVisible("gamble", "gamble_win", 1)
			UI_SetTextLabelText("gamble", "lblDescription1", winbig)
			UI_SetTextLabelText("gamble", "lblDescription2", "You won"..noru..""..money.." Experience!")
			UI_ShowRandomElement("gamble", "btnWin", 1)
			UI_ShowRandomElement("gamble", "btnLose", 0)
		elseif type == 0 then		--lose 
			if SobGroup_GetHardPointHealth(ship, "rad_bm_orders_thedude") > 0 then
				SobGroup_SetHardPointHealth(ship, "rad_bm_orders_thedude", 0)
			  UI_PlaySound("SFX_nooo")
			  --Subtitle_Add(13,"Sorry, bro", 2.711)
  			UI_SetScreenEnabled("gamble", 1)		
				UI_SetScreenVisible("gamble", 1)	
				UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
				UI_SetElementVisible("gamble", "gamble_lose", 0)
				UI_SetElementVisible("gamble", "gamble_lose1", 1)
				UI_SetElementVisible("gamble", "gamble_win", 0)
				UI_SetTextLabelText("gamble", "lblDescription1", "'Sorry, bro...'")
				UI_SetTextLabelText("gamble", "lblDescription2", "The Dude is fired!")
				UI_ShowRandomElement("gamble", "btnWin", 0)
				UI_ShowRandomElement("gamble", "btnLose", 1)
			else
			  UI_PlaySound("SFX_loser")
			  --Subtitle_Add(13,"Loooooooooser!", 2.711)
  			UI_SetScreenEnabled("gamble", 1)		
				UI_SetScreenVisible("gamble", 1)	
				UI_SetTextLabelText("gamble", "lblSubTitle", "GAMBLING RESULT");									
				UI_SetElementVisible("gamble", "gamble_lose", 1)
				UI_SetElementVisible("gamble", "gamble_lose1", 0)
				UI_SetElementVisible("gamble", "gamble_win", 0)
				UI_SetTextLabelText("gamble", "lblDescription1", "Loooooooooser!")
				UI_SetTextLabelText("gamble", "lblDescription2", "Better luck next time!")
				UI_ShowRandomElement("gamble", "btnWin", 0)
				UI_ShowRandomElement("gamble", "btnLose", 1)
			end
		end
	end
end

function buildBoostKadeshi(playerIndex)			--OMG!!! This function is totally fucked up!!!!
	local numships = SobGroup_SplitGroupReference("SingleBoostKad_SOB", "kad_needleship"..playerIndex, "carriers", SobGroup_Count("kad_needleship"..playerIndex))
	for counter = 0, numships - 1, 1 do
		--kadbuildspeedmulti = 1+0.1*random_pseudo(20,30)
		if (SobGroup_IsDoingAbility("SingleBoostKad_SOB" .. counter, AB_DefenseField) == 1) then
			--SobGroup_SetBuildSpeedMultiplier("SingleBoostKad_SOB" .. counter, kadbuildspeedmulti)
			if SobGroup_GetHardPointHealth("SingleBoostKad_SOB" .. counter, "Boost") < 1 then
				SobGroup_SetHardPointHealth("SingleBoostKad_SOB" .. counter, "Boost", 1)
			end
			FX_StartEvent_Smart("SingleBoostKad_SOB".. counter, "BuildAnim" ) -- removed cause I can't make it fit
		else
			--SobGroup_SetBuildSpeedMultiplier("SingleBoostKad_SOB" .. counter, 1)
			if SobGroup_GetHardPointHealth("SingleBoostKad_SOB" .. counter, "Boost") > 0.01 then
				SobGroup_SetHardPointHealth("SingleBoostKad_SOB" .. counter, "Boost", 0.01)
			end
		end
	end
end

function FuryOfKadesh(playerIndex)
	-- if 30 seconds have eslapsed run this, also only run if player has research. If not, just leave the weapons disabled 
	local furyticker = Time_CPUSaver(30, 1)
	local kadeshfury = 0
	if (furyticker == 1 and Player_HasResearch(playerIndex, "KadeshFuryOfKadesh") == 1) then
		local randNum = Time_CPUSaver(2, 10)
		-- can only turn on if random is <2
		if (randNum == 1 ) then
			kadeshfury = 1
			--print("Fury ON!")
		else
			kadeshfury = 0
			--print("Fury OFF")
		end
	end
	
	-- set weapon state regardless of furyticker 
	SobGroup_Create("Kadeshi_Fury_Swarmer_SOB")
	Player_FillShipsByType("Kadeshi_Fury_Swarmer_SOB", playerIndex, "kad_swarmer_new")
	SobGroup_Create("Kadeshi_Fury_HerSwarm_SOB")
	Player_FillShipsByType("Kadeshi_Fury_HerSwarm_SOB", playerIndex, "kad_swarmer_hybrid")
	SobGroup_Create("Kadeshi_Fury_AdvSwarm_SOB")
	Player_FillShipsByType("Kadeshi_Fury_AdvSwarm_SOB", playerIndex, "kad_advancedswarmer")
	-- put everything in one SOB
	SobGroup_Create("Kadeshi_Fury_Combine_SOB")
	SobGroup_SobGroupAdd("Kadeshi_Fury_Combine_SOB", "Kadeshi_Fury_Swarmer_SOB")
	SobGroup_SobGroupAdd("Kadeshi_Fury_Combine_SOB", "Kadeshi_Fury_HerSwarm_SOB")
	SobGroup_SobGroupAdd("Kadeshi_Fury_Combine_SOB", "Kadeshi_Fury_AdvSwarm_SOB")
	-- set the weapons state only if ships exist that need setting
	if (SobGroup_Count("Kadeshi_Fury_Combine_SOB") > 0) then
		if (kadeshfury == 1) then
			SobGroup_ChangePower("Kadeshi_Fury_Combine_SOB", "Weapon_Furygun", 1)
			SobGroup_ChangePower("Kadeshi_Fury_Combine_SOB", "Weapon_Swarmergun", 0)
		else
			SobGroup_ChangePower("Kadeshi_Fury_Combine_SOB", "Weapon_Furygun", 0)
			SobGroup_ChangePower("Kadeshi_Fury_Combine_SOB", "Weapon_Swarmergun", 1)	
		end
	end
end

function shieldAvatar(playerIndex)
	Update_AllShips()
	local numLords = SobGroup_Count("kad_destroyer"..playerIndex)
	SobGroup_SplitGroupReference("SingleAvatar_SOB", "kad_destroyer"..playerIndex, "AllShips", numLords )
	for counter = 0, numLords -1, 1 do
		if (SobGroup_IsDoingAbility("SingleAvatar_SOB" .. counter, AB_DefenseField) == 1) then
			-- blubb invulnerable
			SobGroup_SetInvulnerability("SingleAvatar_SOB" .. counter, 1)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_IonCannon", 0)
			SobGroup_SetInvulnerabilityOfHardPoint("SingleAvatar_SOB" .. counter, "Engine", 1)
			SobGroup_SetInvulnerabilityOfHardPoint("SingleAvatar_SOB" .. counter, "RootPoint", 1)
			SobGroup_SetInvulnerabilityOfHardPoint("SingleAvatar_SOB" .. counter, "TailPoint", 1)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy1", 0)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy2", 0)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy3", 0)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy4", 0)
			if SobGroup_GetHardPointHealth("SingleAvatar_SOB" .. counter, "invulnerability") > 0 then
				SobGroup_SetHardPointHealth("SingleAvatar_SOB" .. counter, "invulnerability", 0)
			end
		elseif SobGroup_GetHardPointHealth("SingleAvatar_SOB" .. counter, "invulnerability") == 0 then
			SobGroup_SetHardPointHealth("SingleAvatar_SOB" .. counter, "invulnerability", 1)
			-- and not so much
			if SobGroup_SobGroupCompare("SingleAvatar_SOB" .. counter, "haxor_all_invincibleships") == 0 then
				SobGroup_SetInvulnerability("SingleAvatar_SOB" .. counter, 0)
			end
			SobGroup_SetInvulnerabilityOfHardPoint("SingleAvatar_SOB" .. counter, "Engine", 0)
			SobGroup_SetInvulnerabilityOfHardPoint("SingleAvatar_SOB" .. counter, "RootPoint", 0)
			SobGroup_SetInvulnerabilityOfHardPoint("SingleAvatar_SOB" .. counter, "TailPoint", 0)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_IonCannon", 1)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy1", 1)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy2", 1)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy3", 1)
			SobGroup_ChangePower("SingleAvatar_SOB" .. counter, "Weapon_Heavy4", 1)
		end
	end
end

-- Vgr Launch JDAM
function LaunchVaygrJDAM(playerIndex)
	if (SobGroup_Count("productioncapital"..playerIndex) > 0) then
		local idleJDAMs = 0
		local numships = SobGroup_SplitGroupReference("SingleLaunchJDAM_SOB", "vgr_commandcorvette"..playerIndex, "corvettes"..playerIndex, SobGroup_Count("vgr_commandcorvette"..playerIndex))
		for counter = 0, numships - 1, 1 do
			if (SobGroup_CanDoAbility("SingleLaunchJDAM_SOB"..counter, AB_Attack) == 0) then
				SobGroup_AbilityActivate("SingleLaunchJDAM_SOB"..counter, AB_Attack, 1)
			end
			--launching
			if SobGroup_Count("vgr_commandcorvette"..playerIndex) > Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_JDAM") then
				if (SobGroup_IsDoingAbility("SingleLaunchJDAM_SOB"..counter, AB_Attack) == 1) then
					if SobGroup_Count("productioncapital"..playerIndex) > 1 then		--launch from the nearest capital ship
						SobGroup_Create("JDAMtoLaunchFrom"..counter)
						SobGroup_Clear("JDAMtoLaunchFrom"..counter)
						SobGroup_SobGroupAdd("JDAMtoLaunchFrom"..counter, "productioncapital"..playerIndex)
						local numcapitals = SobGroup_SplitGroupReference("SingleJDAMtoLaunchFrom_SOB", "productioncapital"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("productioncapital"..playerIndex))
						local lastDist = SobGroup_GetDistanceToSobGroup("productioncapital"..playerIndex, "SingleLaunchJDAM_SOB"..counter)
						for i = 0, numcapitals - 1, 1 do
							if SobGroup_GetDistanceToSobGroup("SingleJDAMtoLaunchFrom_SOB"..i, "SingleLaunchJDAM_SOB"..counter) < lastDist then
								lastDist = SobGroup_GetDistanceToSobGroup("SingleJDAMtoLaunchFrom_SOB"..i, "SingleLaunchJDAM_SOB"..counter)
								SobGroup_Clear("JDAMtoLaunchFrom"..counter)
								SobGroup_SobGroupAdd("JDAMtoLaunchFrom"..counter, "SingleJDAMtoLaunchFrom_SOB"..i)
							end
						end
						SobGroup_CreateShip_InstantSpawnDock("JDAMtoLaunchFrom"..counter, "vgr_JDAM")
					else
						SobGroup_CreateShip_InstantSpawnDock("productioncapital"..playerIndex, "vgr_JDAM")
					end
				end
			end
			
			--targeting
			SobGroup_Create("vgr_JDAM"..playerIndex)
			Player_FillShipsByType("vgr_JDAM"..playerIndex, playerIndex, "vgr_JDAM")
			if SobGroup_Empty("vgr_JDAM"..playerIndex) == 0 then
				local numJDAMs = SobGroup_SplitGroupReference("SingleJDAMtarget_SOB", "vgr_JDAM"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_JDAM"..playerIndex))
				if counter < numJDAMs then
					if (SobGroup_IsDoingAbility("SingleLaunchJDAM_SOB"..counter, AB_Attack) == 1) and 
					(SobGroup_IsDoingAbility("SingleJDAMtarget_SOB"..counter, AB_Attack) == 0) and
					(SobGroup_IsDoingAbility("SingleJDAMtarget_SOB"..counter, AB_Guard) == 0) then
						SobGroup_GuardSobGroup("SingleJDAMtarget_SOB"..counter, "SingleLaunchJDAM_SOB"..counter)
						--SobGroup_SetTactics("SingleJDAMtarget_SOB"..counter, AggressiveTactics)
					end
					--switch target for idle JDAM
					if (SobGroup_IsDoingAbility("SingleLaunchJDAM_SOB"..counter, AB_Attack) == 0) and (SobGroup_GetEquivalentSpeed("SingleJDAMtarget_SOB"..counter) < 10) then
						SobGroup_GuardSobGroup("SingleJDAMtarget_SOB"..counter, "SingleLaunchJDAM_SOB"..random_pseudo(0,numships-1))
						idleJDAMs = idleJDAMs + 1 	--count idle JDAMs
					end
				end
				--destroy excessive JDAM
				if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandcorvette") < Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_JDAM") then
					SobGroup_SetHealth("SingleJDAMtarget_SOB"..(numJDAMs-1), 0)
				end
				--destroy all idle JDAMs
				if idleJDAMs == numships then
					for z = 0, numships - 1, 1 do
						SobGroup_SetHealth("SingleJDAMtarget_SOB"..z, 0)
						idleJDAMs = idleJDAMs - 1
					end
				end
			end
		end
	end
end

function DestroyAllVaygrJDAM(playerIndex)
	SobGroup_Create("vgr_JDAMtoDestroy"..playerIndex)
	Player_FillShipsByType("vgr_JDAMtoDestroy"..playerIndex, playerIndex, "vgr_JDAM")
	local numJDAMs = SobGroup_SplitGroupReference("SingleJDAMtoDestroy_SOB", "vgr_JDAMtoDestroy"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_JDAMtoDestroy"..playerIndex))
	for z = 0, numJDAMs - 1, 1 do
		SobGroup_SetHealth("SingleJDAMtoDestroy_SOB"..z, 0)
	end
end

function RepairBeam_DummyRepair(playerIndex)		--includes repair beam mechanisms both with and without dummy objects
	local beam_range = 1500
	local regen = 0.005
	local radius = 500
	if Player_HasResearch(playerIndex, "RepairBeamUpgrade3") == 1 then
		radius = 500	--750
		regen = 0.01
	elseif Player_HasResearch(playerIndex, "RepairBeamUpgrade2") == 1 then
		radius = 500
		regen = 0.01
	elseif Player_HasResearch(playerIndex, "RepairBeamUpgrade1") == 1 then
		radius = 500
		regen = 0.0075
	end
	if Player_HasResearch(playerIndex, "RepairBeamUpgrade3") == 1 then		--area repair mechanism (with dummy object), repair check algorithm centered on dummy objects
		SobGroup_Create("vgr_dummy_repairbeam"..playerIndex)
		Player_FillShipsByType("vgr_dummy_repairbeam"..playerIndex, playerIndex, "vgr_dummy_repairbeam")
		if SobGroup_Empty("vgr_dummy_repairbeam"..playerIndex) == 0 then
			local numDummies = SobGroup_SplitGroupReference("SingleRepairBeamDummy_SOB", "vgr_dummy_repairbeam"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_dummy_repairbeam"..playerIndex))
			for z = 0, numDummies - 1, 1 do
				if SobGroup_FillProximitySobGroupExceptSelf("SOB_BeamRepairGroup", "repairingallies"..playerIndex, "SingleRepairBeamDummy_SOB"..z, radius) == 1 then
					SobGroup_RestoreHealth("SOB_BeamRepairGroup",regen)
				end
			end
		end
	else		--single repair mechanism (without dummy object), repair check algorithm based on repair targets
		SobGroup_Create("RepairBeamMonitorTarget"..playerIndex)		--updated in repairing.lua
		if SobGroup_Empty("RepairBeamMonitorTarget"..playerIndex) == 0 then
			local numShips = SobGroup_SplitGroupReference("SingleRepairBeamTarget_SOB", "RepairBeamMonitorTarget"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("RepairBeamMonitorTarget"..playerIndex))
			for z = 0, numShips - 1, 1 do
				if SobGroup_HealthPercentage("SingleRepairBeamTarget_SOB"..z) < 1 and SobGroup_HealthPercentage("SingleRepairBeamTarget_SOB"..z) > 0 then
					--if SobGroup_UnderAttack("SingleRepairBeamTarget_SOB"..z) == 1 then		--friendly attack cannot be recognized as attack OMG!!!
						if SobGroup_FillProximitySobGroupExceptSelf("SOB_ProximityBeamRepairerGroup", "vgr_patcher"..playerIndex, "SingleRepairBeamTarget_SOB"..z, beam_range) == 1 then
							--print("There're "..SobGroup_Count("SOB_ProximityBeamRepairerGroup").." repairers around ".."SingleRepairBeamTarget_SOB"..z)
							--SobGroup_Create("SOB_GetAttacker")
							--SobGroup_Clear("SOB_GetAttacker")
							--SobGroup_GetAttackers("SingleRepairBeamTarget_SOB"..z, "SOB_GetAttacker")
							local num_repairer = 0	--SobGroup_CountCompare("SOB_GetAttacker", "SOB_BeamRepairerGroup")
							local numPatchers = SobGroup_SplitGroupReference("SingleProximityBeamRepair_SOB", "SOB_ProximityBeamRepairerGroup", "Player_Ships"..playerIndex, SobGroup_Count("SOB_ProximityBeamRepairerGroup"))
							for x = 0, numPatchers - 1, 1 do
								if SobGroup_IsDoingAbility("SingleProximityBeamRepair_SOB"..x, AB_Attack) == 1 then
									num_repairer = num_repairer + 1
								end
							end
							if num_repairer > 0 then
								--print("Repairing beam target: ".."SingleRepairBeamTarget_SOB"..z.." , repairers: "..num_repairer)
								SobGroup_RestoreHealth("SingleRepairBeamTarget_SOB"..z,regen*num_repairer)
							end
						end
					--end
				end
			end
		end
	end
end

function CustomizeVaygrDestroyer(playerIndex)
	local numShips = SobGroup_SplitGroupReference("SingleVgrDestroyerToCustomize_SOB", "vgr_destroyer"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_destroyer"..playerIndex))
	for counter = 0, numShips - 1, 1 do
		local ship = "SingleVgrDestroyerToCustomize_SOB"..counter
		if SobGroup_HealthPercentage(ship) > 0 then
			--restrict build options
			if Player_HasResearch(playerIndex, "UnlockDestroyerTurrets1") == 1 then
				for z, subsystem in {"vgr_ft2_turret_tank","vgr_destroyer_quadflechette","vgr_destroyer_dt3_turret","vgr_railgun_turret_tank","vgr_qje_lithiumion_tank","vgr_destroyer_ion","vgr_destroyer_fasttrackingturret","vgr_destroyer_heavycruiserkineticturret","vgr_destroyer_mlrs","vgr_destroyer_ciws"} do
					SobGroup_UnRestrictBuildOption(ship, subsystem.."5")
					SobGroup_UnRestrictBuildOption(ship, subsystem.."6")
				end
			elseif Player_HasResearch(playerIndex, "UnlockDestroyerTurrets") == 1 then
				--can build
				for z, subsystem in {"vgr_qje_lithiumion_tank","vgr_destroyer_fasttrackingturret","vgr_destroyer_ciws"} do
					SobGroup_UnRestrictBuildOption(ship, subsystem.."5")
					SobGroup_UnRestrictBuildOption(ship, subsystem.."6")
				end
				--cannot build
				for z, subsystem in {"vgr_ft2_turret_tank","vgr_destroyer_quadflechette","vgr_destroyer_dt3_turret","vgr_railgun_turret_tank","vgr_destroyer_ion","vgr_destroyer_heavycruiserkineticturret","vgr_destroyer_mlrs"} do
					SobGroup_RestrictBuildOption_Smart(ship, subsystem.."5")
					SobGroup_RestrictBuildOption_Smart(ship, subsystem.."6")
				end
			else
				for z, subsystem in {"vgr_ft2_turret_tank","vgr_destroyer_quadflechette","vgr_destroyer_dt3_turret","vgr_railgun_turret_tank","vgr_qje_lithiumion_tank","vgr_destroyer_ion","vgr_destroyer_fasttrackingturret","vgr_destroyer_heavycruiserkineticturret","vgr_destroyer_mlrs","vgr_destroyer_ciws"} do
					SobGroup_RestrictBuildOption_Smart(ship, subsystem.."5")
					SobGroup_RestrictBuildOption_Smart(ship, subsystem.."6")
				end
			end
			--customize
			if SobGroup_GetHardPointHealth(ship, "customized") > 0.3 then
				if CPU_Exist_Smart(playerIndex) == 0 then
					CreateSubsystemOnShipHardpoint_Smart(ship, "TurretTop", "vgr_destroyer_gun5")
					CreateSubsystemOnShipHardpoint_Smart(ship, "TurretBottom", "vgr_destroyer_gun6")
				else	--CPU player
					if Player_HasResearch(playerIndex, "UnlockDestroyerTurrets") == 0 or Player_GetRU(playerIndex) < 1000 then
						CreateSubsystemOnShipHardpoint_Smart(ship, "TurretTop", "vgr_destroyer_gun5")
						CreateSubsystemOnShipHardpoint_Smart(ship, "TurretBottom", "vgr_destroyer_gun6")
					end
				end
	  		SobGroup_SetHardPointHealth(ship, "customized", 0)
			end
		end
	end
end

function EntrenchVaygrSinner(playerIndex)
	local threshold = 0.99
	if Player_HasResearch(playerIndex, "ImprovedSinnerArmour2") == 1 then
		threshold = 0.97
	end
	if Player_HasResearch(playerIndex, "ImprovedSinnerArmour3") == 1 then
		threshold = 0.95
	end
	SobGroup_Create("vgr_SinnerToEntrench"..playerIndex)
	Player_FillShipsByType("vgr_SinnerToEntrench"..playerIndex, playerIndex, "vgr_sinner")
	local numSinners = SobGroup_SplitGroupReference("SingleSinnerToEntrench_SOB", "vgr_SinnerToEntrench"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_SinnerToEntrench"..playerIndex))
	for z = 0, numSinners - 1, 1 do
		if SobGroup_HealthPercentage("SingleSinnerToEntrench_SOB"..z) > 0 then
			if SobGroup_HealthPercentage("SingleSinnerToEntrench_SOB"..z) >= threshold and SobGroup_HealthPercentage("SingleSinnerToEntrench_SOB"..z) < 1 then
				SobGroup_SetHealth("SingleSinnerToEntrench_SOB"..z, 1)
			end
			for k=1,6,1 do
				if SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Weapon_"..k.."z") >= threshold and SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Weapon_"..k.."z") < 1 then
					SobGroup_SetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Weapon_"..k.."z", 1)
				end
			end
			for k=1,4,1 do
				if SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Weapon_m"..k) >= threshold and SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Weapon_m"..k) < 1 then
					SobGroup_SetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Weapon_m"..k, 1)
				end
			end
			if SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Generic") >= threshold and SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Generic") < 1 then
				SobGroup_SetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Generic", 1)
			end
			if SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Engine") >= threshold and SobGroup_GetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Engine") < 1 then
				SobGroup_SetHardPointHealth("SingleSinnerToEntrench_SOB"..z, "Engine", 1)
			end
		end
	end
end

-- Air combat fighters to boost
aircombatboostships = {"meg_mig25","meg_mig29","meg_f14","meg_f15","meg_f18","meg_f18_elite","meg_f16","meg_migmfi","meg_su34","meg_su35","meg_su47","meg_sr71","meg_tu160","meg_b1","meg_su27","meg_su27_elite"}
aircombatboostfuelingships = {"meg_e767","meg_kc10","meg_c5","meg_b2","meg_b52","meg_av8","meg_a10","meg_su25","meg_f117"}

function speedBoostAirCombat(playerIndex)	
	local playerIndexList = playerIndex + 1
	--local shiptypes_aircombatboostships = Table_Concatenate(aircombatboostships, ",")	--to save performance
	local shiptypes_aircombatboostfuelingships = Table_Concatenate(aircombatboostfuelingships, ",")
	local numships = nfi[playerIndexList]
	local SOB = "splitfighters"..playerIndex
	for counter = 0, numships - 1, 1 do
		local ship = SOB..counter
		if SobGroup_Empty(ship) == 0 then
			--tanker decceleration (doesn't seem to work)
			if SobGroup_Empty("meg_kc10"..playerIndex) == 0 and SobGroup_AreAnyOfTheseTypes(ship, "meg_kc10") == 1 then
				if SobGroup_FillProximitySobGroupExceptSelf("temp_JetsNearRefueler", "aircombat_jets"..playerIndex, ship, 1600) == 1 then
					if SobGroup_IsDoingAbility("temp_JetsNearRefueler", AB_Dock) == 1 then
						local airspeed = sqrt(SobGroup_GetEquivalentSpeed(ship))
						local maxspeed = 100
						if airspeed > maxspeed then
							SobGroup_SetMaxSpeedMultiplier(ship, maxspeed/airspeed)
						else
							SobGroup_SetMaxSpeedMultiplier(ship, 1)
						end
					else
						SobGroup_SetMaxSpeedMultiplier(ship, 1)
					end
				else
					SobGroup_SetMaxSpeedMultiplier(ship, 1)
				end
			end
			
			--refueling boost (doesn't seem to work)
			if SobGroup_AreAnyOfTheseTypes(ship, shiptypes_aircombatboostfuelingships) == 1 then
				if SobGroup_IsDoingAbility(ship, AB_Dock) == 1 and 
				SobGroup_FillProximitySobGroupExceptSelf("temp_JetsNearRefueler", "meg_kc10"..playerIndex, ship, 2500) == 1 and 
				SobGroup_GetEquivalentSpeed(ship) > 2500 then
					SobGroup_SetMaxSpeedMultiplier(ship, 1.5)
				else
					SobGroup_SetMaxSpeedMultiplier(ship, 1)
				end
			end
			
			--afterburner boost
			if SobGroup_CanDoAbility(ship, AB_DefenseField) == 1 then		--if SobGroup_AreAnyOfTheseTypes(ship, shiptypes_aircombatboostships) == 1 then	--to save performance
				if SobGroup_IsDoingAbility(ship, AB_DefenseField) == 1 then
					SobGroup_SetMaxSpeedMultiplier(ship, 2)
					FX_StartEvent_Smart(ship, "AfterBurn" )
				else
					SobGroup_SetMaxSpeedMultiplier(ship, 1)
				end
			end
		end
	end
end

function Table_Concatenate(list, separator)	--turns a list of strings into one string (for uses like SobGroup_AreAnyOfTheseTypes)
	local sign = ""
	local sep = ""
	if separator ~= nil then
		sep = separator
	end
	local str = ""
	for z, iCount in list do
		if z == 1 then
			sign = ""
		else
			sign = sep
		end
		str = str..sign..iCount
	end
	return str
end

function GeneralSpeedBoost(playerIndex, ship_list, corvette_mode)	--mode 0 is fighter, mode 1 is corvette
	local playerIndexList = playerIndex + 1
	--local shiptypes = Table_Concatenate(ship_list, ",")	--to save performance
	local numships = nfi[playerIndexList]
	local SOB = "splitfighters"..playerIndex
	local exp_table = FighterEXP.serial[playerIndexList]
	if corvette_mode == 1 then
		numships = nco[playerIndexList]
		SOB = "splitcorvettes"..playerIndex
		exp_table = CorvetteEXP.serial[playerIndexList]
	end
	for counter = 0, numships - 1, 1 do
		local ship = SOB..counter
		if SobGroup_Empty(ship) == 0 then
			if SobGroup_CanDoAbility(ship, AB_DefenseField) == 1 then		--SobGroup_AreAnyOfTheseTypes(ship, shiptypes) == 1	--to save performance
				local base_speed = 1
				if exp_table[counter+1] ~= nil then
					local exp0 = exp_table[counter+1] * 10000
					base_speed = 1 + exp0/1000	--adjust the speed based on fighter/corvette experience
				end
				if SobGroup_IsDoingAbility(ship, AB_DefenseField) == 1 then
					SobGroup_SetMaxSpeedMultiplier(ship, 2*base_speed)
					FX_StartEvent_Smart(ship, "AfterBurn" )
				else
					SobGroup_SetMaxSpeedMultiplier(ship, 1*base_speed)
				end
			end
		end
	end
end

-- Vaygr fighters to boost
vaygrboostships = {"vgr_interceptor", "vgr_bomber", "vgr_heavyfighter", "vgr_defender", "vgr_lancefighter", "vgr_scout", "vgr_elitefighter", "vgr_missilebomber"}

function speedBoostVaygr(playerIndex)
	GeneralSpeedBoost(playerIndex, vaygrboostships, 0)
end

-- Vaygr corvettes to boost
vaygrboostshipsAlt = {"vgr_plasmacorvette", "vgr_missilecorvette", "vgr_mortarcorvette", "vgr_minelayercorvette", "vgr_commandcorvette", "vgr_multilancecorvette", "vgr_mortarcorvette", "vgr_striker", "vgr_standvette", "vgr_lasercorvette"}

function speedBoostVaygrCorvette(playerIndex)
	GeneralSpeedBoost(playerIndex, vaygrboostshipsAlt, 1)
end

-- Vaygr weapons to boost
vaygrboostshipsWpn = {"vgr_cruse", "vgr_cruse1", "vgr_boa", "vgr_minermissile", "vgr_JDAM"}

function speedBoostVaygrWeapon(playerIndex)
	Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("VgrBoostWeapon_Total")
		Player_FillShipsByType("VgrBoostWeapon_Total", playerIndex, vaygrboostshipsWpn[i])
		local numships = SobGroup_SplitGroupReference("SingleBoostWeapon_SOB", "VgrBoostWeapon_Total", "AllShips", SobGroup_Count("VgrBoostWeapon_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_GetEquivalentSpeed("SingleBoostWeapon_SOB"..counter) >= 10000 then
				FX_StartEvent_Smart("SingleBoostWeapon_SOB".. counter, "AfterBurn" )		--only show FX
			end
		end
	until (not vaygrboostshipsWpn[i + 1])
end

-- Vaygr probes with fuel consumption
vaygrboostshipsProbe = {"vgr_probe", "vgr_probe_ecm", "vgr_probe_prox", "vgr_probe_smallhsbeacon"}

function fuelConsumptionVaygrProbe(playerIndex)
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("VgrFuelProbe_Total")
		Player_FillShipsByType("VgrFuelProbe_Total", playerIndex, vaygrboostshipsProbe[i])
		local numships = SobGroup_SplitGroupReference("SingleFuelProbe_SOB", "VgrFuelProbe_Total", "othersnoparade"..playerIndex, SobGroup_Count("VgrFuelProbe_Total"))
		for counter = 0, numships - 1, 1 do
			local ship = "SingleFuelProbe_SOB" .. counter
			local current_fuel = SobGroup_GetHardPointHealth(ship, "fuel")
			local speed = sqrt(SobGroup_GetEquivalentSpeed(ship))
			local consumption = 0
			local refuel = 0
			if Player_HasResearch(playerIndex, "ProbeRefuelingUpgrade3") == 1 then
				refuel = 0.01
			elseif Player_HasResearch(playerIndex, "ProbeRefuelingUpgrade2") == 1 then
				refuel = 0.0075
			elseif Player_HasResearch(playerIndex, "ProbeRefuelingUpgrade1") == 1 then
				refuel = 0.005
			elseif Player_HasResearch(playerIndex, "ProbeRefueling") == 1 then
				refuel = 0.0025
			end
			local isMoving = 0
			if SobGroup_IsDoingAbility(ship, AB_Move) == 1 or SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or SobGroup_IsDoingAbility(ship, AB_Retire) == 1 or speed > 30 then
				isMoving = 1
			end
			if speed > 30 and SobGroup_IsDocked(ship) == 0 then
				isMoving = 1
			end
			if isMoving == 1 then
				consumption = 0.01
			end
			if SobGroup_IsDocked(ship) == 1 then
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel + 0.01)
			else
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel - consumption + refuel)
			end
			if SobGroup_GetHardPointHealth(ship, "fuel") <= 0 and isMoving == 1 then
				SobGroup_SetMaxSpeedMultiplier(ship, 0)
			elseif SobGroup_GetHardPointHealth(ship, "fuel") > 0 then
				SobGroup_SetMaxSpeedMultiplier(ship, 1)
			end
		end
	until (not vaygrboostshipsProbe[i + 1])
end

-- Vaygr platforms with fuel consumption
vaygrboostshipsPlatform = {"vgr_cloakplatform", "vgr_weaponplatform_gun", "vgr_weaponplatform_lance", "vgr_weaponplatform_missile"}

function fuelConsumptionVaygrPlatform(playerIndex)
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("VgrFuelPlatform_Total")
		Player_FillShipsByType("VgrFuelPlatform_Total", playerIndex, vaygrboostshipsPlatform[i])
		local numships = SobGroup_SplitGroupReference("SingleFuelPlatform_SOB", "VgrFuelPlatform_Total", "platforms", SobGroup_Count("VgrFuelPlatform_Total"))
		for counter = 0, numships - 1, 1 do
			local ship = "SingleFuelPlatform_SOB" .. counter
			local current_fuel = SobGroup_GetHardPointHealth(ship, "fuel")
			local speed = sqrt(SobGroup_GetEquivalentSpeed(ship))
			local consumption = 0
			local refuel = 0
			if Player_HasResearch(playerIndex, "PlatformRefuelingUpgrade3") == 1 then
				refuel = 0.01
			elseif Player_HasResearch(playerIndex, "PlatformRefuelingUpgrade2") == 1 then
				refuel = 0.0075
			elseif Player_HasResearch(playerIndex, "PlatformRefuelingUpgrade1") == 1 then
				refuel = 0.005
			elseif Player_HasResearch(playerIndex, "PlatformRefueling") == 1 then
				refuel = 0.0025
			end
			if GameRulesName == "Simplex Sole Survivor" then
				refuel = 0.01
			end
			local isMoving = 0
			if SobGroup_IsDoingAbility(ship, AB_Move) == 1 or SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or SobGroup_IsDoingAbility(ship, AB_Retire) == 1 or speed > 30 then
				isMoving = 1
			end
			if speed > 30 and SobGroup_IsDocked(ship) == 0 then
				isMoving = 1
			end
			if isMoving == 1 then
				consumption = 0.01
			end
			if SobGroup_IsDocked(ship) == 1 then
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel + 0.01)
			else
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel - consumption + refuel)
			end
			if SobGroup_GetHardPointHealth(ship, "fuel") <= 0 and isMoving == 1 then
				SobGroup_SetMaxSpeedMultiplier(ship, 0)
			elseif SobGroup_GetHardPointHealth(ship, "fuel") > 0 then
				SobGroup_SetMaxSpeedMultiplier(ship, 1)
			end
		end
	until (not vaygrboostshipsPlatform[i + 1])
end

-- Kad fighters to boost
Kadboostships = {"kad_advancedswarmer", "kad_advancedswarmer_old", "kad_heavyswarmer_new", "kad_pulsarswarmer", "kad_swarmer_blood", "kad_swarmer_crusader", "kad_swarmer_ghost", "kad_swarmer_hybrid", "kad_swarmer_new", "kad_swarmer_zealot"}

function speedBoostKad(playerIndex)
	GeneralSpeedBoost(playerIndex, Kadboostships, 0)
end

-- Kad corvettes to boost
KadboostshipsAlt = {"kad_gunpod", "kad_ionpod", "kad_missilepod", "kad_pod_ghost", "kad_prayerpod", "kad_sensorpod"}

function speedBoostKadCorvette(playerIndex)
	GeneralSpeedBoost(playerIndex, KadboostshipsAlt, 1)
end

--Kpr fighters and corvettes
Kprboostships = {"Kpr_AttackDroid", "kpr_interceptor_old"}
KprboostshipsAlt = {"Kpr_Mover", "kpr_attackdroid_combo", "kpr_interceptor_combo", "kpr_attackdroid_agitator"}

-- Rad fighters to boost
Radboostships = {"rad_merc_fighter", "rad_merc_interceptor", "rad_merc_bomber", "rad_merc_scout", "rad_bomber", "rad_elitefighter", "rad_fencer", "rad_interceptor", "rad_interceptor_black"}

function speedBoostRad(playerIndex)
	GeneralSpeedBoost(playerIndex, Radboostships, 0)
end

-- Rad corvettes to boost
RadboostshipsAlt = {"rad_merc_corvette", "rad_scoutcorvette", "rad_guncorvette", "rad_empcorvette", "rad_missilecorvette", "rad_jackal"}

function speedBoostRadCorvette(playerIndex)
	GeneralSpeedBoost(playerIndex, RadboostshipsAlt, 1)
end

-- Hgn fighters to boost
Hgnboostships = {"hgn_scout", "hgn_interceptor", "hgn_interceptorl", "hgn_attackbomber", "hgn_attackbomberl", "hgn_lbomber", "hgn_lbomberl", "hgn_attackbomberheavy", "hgn_attackbomberheavyl", "hgn_strategicbomber", "hgn_strategicbomberl", "hgn_hft", "hgn_hftl", "hgn_railgunfighter", "hgn_railgunfighterl", "hgn_scout"}

function speedBoostHgn(playerIndex)
	GeneralSpeedBoost(playerIndex, Hgnboostships, 0)
end

-- Hgn corvettes to boost
HgnboostshipsAlt = {"hgn_assaultcorvette", "hgn_assaultcorvettel", "hgn_pulsarcorvette", "hgn_pulsarcorvettel", "hgn_torpedocorvette", "hgn_torpedocorvettel", "hgn_bombervette", "hgn_bombervettel", "hgn_multiguncorvette", "hgn_multiguncorvettel", "hgn_gunshipcoevette", "hgn_gunshipcoevettel", "hgn_cth", "hgn_cthl", "hgn_cthion", "hgn_cthionl", "hgn_minelayercorvette"}

function speedBoostHgnCorvette(playerIndex)
	GeneralSpeedBoost(playerIndex, HgnboostshipsAlt, 1)
end

-- Hgn weapons to boost
HgnboostshipsWpn = {"hgn_minermissile", "hgn_minermissile1", "hgn_torpedotube1", "hgn_torpedotube2", "hgn_torpedotube3", "hgn_viper", "hgn_viper_short", "hgn_viper_short1", "hgn_viper_ws", "hgn_viper_ws1", "hgn_nuclearbomb", "hgn_nucleartube1", "hgn_nucleartube2", "hgn_nucleartube3"}

function speedBoostHgnWeapon(playerIndex)
	Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("HgnBoostWeapon_Total")
		Player_FillShipsByType("HgnBoostWeapon_Total", playerIndex, HgnboostshipsWpn[i])
		local numships = SobGroup_SplitGroupReference("SingleBoostHgnWeapon_SOB", "HgnBoostWeapon_Total", "AllShips", SobGroup_Count("HgnBoostWeapon_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_GetEquivalentSpeed("SingleBoostHgnWeapon_SOB"..counter) >= 10000 then
				FX_StartEvent_Smart("SingleBoostHgnWeapon_SOB".. counter, "AfterBurn" )		--only show FX
			end
		end
	until (not HgnboostshipsWpn[i + 1])
end

-- Hgn probes with fuel consumption
HgnboostshipsProbe = {"hgn_probe", "hgn_ecmprobe", "hgn_proximitysensor"}

function fuelConsumptionHgnProbe(playerIndex)
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("HgnFuelProbe_Total")
		Player_FillShipsByType("HgnFuelProbe_Total", playerIndex, HgnboostshipsProbe[i])
		local numships = SobGroup_SplitGroupReference("SingleFuelProbe_SOB", "HgnFuelProbe_Total", "othersnoparade"..playerIndex, SobGroup_Count("HgnFuelProbe_Total"))
		for counter = 0, numships - 1, 1 do
			local ship = "SingleFuelProbe_SOB" .. counter
			local current_fuel = SobGroup_GetHardPointHealth(ship, "fuel")
			local speed = sqrt(SobGroup_GetEquivalentSpeed(ship))
			local consumption = 0
			local refuel = 0
			if Player_HasResearch(playerIndex, "ProbeRefuelingUpgrade3") == 1 then
				refuel = 0.01
			elseif Player_HasResearch(playerIndex, "ProbeRefuelingUpgrade2") == 1 then
				refuel = 0.0075
			elseif Player_HasResearch(playerIndex, "ProbeRefuelingUpgrade1") == 1 then
				refuel = 0.005
			elseif Player_HasResearch(playerIndex, "ProbeRefueling") == 1 then
				refuel = 0.0025
			end
			local isMoving = 0
			if SobGroup_IsDoingAbility(ship, AB_Move) == 1 or SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or SobGroup_IsDoingAbility(ship, AB_Retire) == 1 or speed > 30 then
				isMoving = 1
			end
			if speed > 30 and SobGroup_IsDocked(ship) == 0 then
				isMoving = 1
			end
			if isMoving == 1 then
				consumption = 0.01
			end
			if SobGroup_IsDocked(ship) == 1 then
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel + 0.01)
			else
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel - consumption + refuel)
			end
			if SobGroup_GetHardPointHealth(ship, "fuel") <= 0 and isMoving == 1 then
				SobGroup_SetMaxSpeedMultiplier(ship, 0)
			elseif SobGroup_GetHardPointHealth(ship, "fuel") > 0 then
				SobGroup_SetMaxSpeedMultiplier(ship, 1)
			end
		end
	until (not HgnboostshipsProbe[i + 1])
end

-- Hgn platforms with fuel consumption
HgnboostshipsPlatform = {"hgn_defenderdrone", "hgn_gunturret", "hgn_ionturret", "hgn_missileturret", "hgn_pulsarturret", "hgn_artillerysentinel", "hgn_sentinel", "hgn_ionsentinel", "hgn_rts", "hgn_defensefieldturret"}

function fuelConsumptionHgnPlatform(playerIndex)
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("HgnFuelPlatform_Total")
		Player_FillShipsByType("HgnFuelPlatform_Total", playerIndex, HgnboostshipsPlatform[i])
		local numships = SobGroup_SplitGroupReference("SingleFuelPlatform_SOB", "HgnFuelPlatform_Total", "platforms", SobGroup_Count("HgnFuelPlatform_Total"))
		for counter = 0, numships - 1, 1 do
			local ship = "SingleFuelPlatform_SOB" .. counter
			local current_fuel = SobGroup_GetHardPointHealth(ship, "fuel")
			local speed = sqrt(SobGroup_GetEquivalentSpeed(ship))
			local consumption = 0
			local refuel = 0
			if Player_HasResearch(playerIndex, "PlatformRefuelingUpgrade3") == 1 then
				refuel = 0.01
			elseif Player_HasResearch(playerIndex, "PlatformRefuelingUpgrade2") == 1 then
				refuel = 0.0075
			elseif Player_HasResearch(playerIndex, "PlatformRefuelingUpgrade1") == 1 then
				refuel = 0.005
			elseif Player_HasResearch(playerIndex, "PlatformRefueling") == 1 then
				refuel = 0.0025
			end
			if GameRulesName == "Simplex Sole Survivor" then
				refuel = 0.01
			end
			local isMoving = 0
			if SobGroup_IsDoingAbility(ship, AB_Move) == 1 or SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or SobGroup_IsDoingAbility(ship, AB_Retire) == 1 or speed > 30 then
				isMoving = 1
			end
			if speed > 30 and SobGroup_IsDocked(ship) == 0 then
				isMoving = 1
			end
			if isMoving == 1 then
				consumption = 0.01
			end
			if SobGroup_IsDocked(ship) == 1 then
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel + 0.01)
			else
				SobGroup_SetHardPointHealth_Smart(ship, "fuel", current_fuel - consumption + refuel)
			end
			if SobGroup_GetHardPointHealth(ship, "fuel") <= 0 and isMoving == 1 then
				SobGroup_SetMaxSpeedMultiplier(ship, 0)
			elseif SobGroup_GetHardPointHealth(ship, "fuel") > 0 then
				SobGroup_SetMaxSpeedMultiplier(ship, 1)
			end
		end
	until (not HgnboostshipsPlatform[i + 1])
end

-- Rad weapons to boost
RadboostshipsWpn = {"hgn_viper_short", "hgn_viper_ws", "hgn_tangomine", "hgn_minermissile", "Vgr_Cruse1", "Vgr_Cruse", "Vgr_Boa", "vgr_minermissile"}

function speedBoostRadWeapon(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("RadBoostWeapon_Total")
		Player_FillShipsByType("RadBoostWeapon_Total", playerIndex, RadboostshipsWpn[i])
		if SobGroup_Empty("RadBoostWeapon_Total") == 0 then
			local speed = 1.2
			if Player_HasResearch(playerIndex, "WeaponSpeedUpgrade3") == 1 then
				speed = 1.6
			elseif Player_HasResearch(playerIndex, "WeaponSpeedUpgrade2") == 1 then
				speed = 1.4
			end
			local numships = SobGroup_SplitGroupReference("SingleBoostRadWeapon_SOB", "RadBoostWeapon_Total", "Player_Ships"..playerIndex, SobGroup_Count("RadBoostWeapon_Total"))
			for counter = 0, numships - 1, 1 do
				if Player_HasResearch(playerIndex, "WeaponSpeedUpgrade4") == 1 and SobGroup_GetEquivalentSpeed("SingleBoostRadWeapon_SOB"..counter) >= 10000 then
					FX_StartEvent_Smart("SingleBoostRadWeapon_SOB".. counter, "AfterBurn" )
					SobGroup_SetMaxSpeedMultiplier("SingleBoostRadWeapon_SOB"..counter, 2*speed)
				else
					SobGroup_SetMaxSpeedMultiplier("SingleBoostRadWeapon_SOB"..counter, speed)
				end
			end
		end
	until (not RadboostshipsWpn[i + 1])
end

function ModifyRadNuke(playerIndex)
	SobGroup_Create("RadModifyNuke_Total")
	Player_FillShipsByType("RadModifyNuke_Total", playerIndex, "hgn_nucleartube1")
	if SobGroup_Empty("RadModifyNuke_Total") == 0 then
		local numships = SobGroup_SplitGroupReference("SingleModifyRadNuke_SOB", "RadModifyNuke_Total", "Player_Ships"..playerIndex, SobGroup_Count("RadModifyNuke_Total"))
		for counter = 0, numships - 1, 1 do
			if Player_HasResearch(playerIndex, "SpecialAbility10Level3") == 1 then
				if SobGroup_HealthPercentage("SingleModifyRadNuke_SOB"..counter) > 0 and SobGroup_HealthPercentage("SingleModifyRadNuke_SOB"..counter) < 0.1 then
					SobGroup_SetHealth("SingleModifyRadNuke_SOB"..counter, 0.1)
				end
			end
			local speed = 1.3
			if Player_HasResearch(playerIndex, "SpecialAbility10Level2") == 1 then
				if SobGroup_GetEquivalentSpeed("SingleModifyRadNuke_SOB"..counter) >= 10000 then
					FX_StartEvent_Smart("SingleModifyRadNuke_SOB".. counter, "AfterBurn" )
					SobGroup_SetMaxSpeedMultiplier("SingleModifyRadNuke_SOB"..counter, 2*speed)
				else
					SobGroup_SetMaxSpeedMultiplier("SingleModifyRadNuke_SOB"..counter, speed)
				end
			else
				SobGroup_SetMaxSpeedMultiplier("SingleModifyRadNuke_SOB"..counter, speed)
			end
		end
	end
end

function phaseArmourActivate(playerIndex)		--doesn't work, it is re-defined in interface
	Update_AllShips()
	SobGroup_Create("phaseArmour_Total")
	SobGroup_SobGroupAdd("phaseArmour_Total", "vgr_hammerhead")
	local numships = SobGroup_SplitGroupReference("SinglePhaseArmour_SOB", "phaseArmour_Total", "AllShips", SobGroup_Count("phaseArmour_Total"))
	for i = 0, numships - 1, 1 do
		if (SobGroup_IsDoingAbility("SinglePhaseArmour_SOB"..i, abilityList[25]) == 1) then
			SobGroup_SetInvulnerability("SinglePhaseArmour_SOB"..i, 1)
			SobGroup_SetInvulnerabilityOfHardPoint("SinglePhaseArmour_SOB"..i, "Engine", 1)
		else
			SobGroup_SetInvulnerability("SinglePhaseArmour_SOB"..i, 0)
			SobGroup_SetInvulnerabilityOfHardPoint("SinglePhaseArmour_SOB"..i, "Engine", 0)
		end
	end
end

function RaceCheckSlow()		--activated by onint.lua
---aggiorna tempodicostruzione x costruzioneforzata  
  for i = 2,4,1 do
    if tempodicostruzioneList3[i] >= i then
      tempodicostruzioneList3[i] = 1
    else  
      tempodicostruzioneList3[i] = tempodicostruzioneList3[i] + 1
    end
  end
	
	--print("RaceCheckSlow - Start")
	--restore AI for explosion escape function 
	AI_RestoreAIAfterEscape()

	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			if Player_GetRace(playerIndex) == 1 then
				if (Player_HasResearch(playerIndex, "ImprovedDestroyerArmour") == 1) then
					if SobGroup_Count("hgn_destroyer"..playerIndex) >= 1 or
					SobGroup_Count("hgn_advdestroyer"..playerIndex) >= 1 or
					SobGroup_Count("hgn_sweeperdestroyer"..playerIndex) >= 1 or
					SobGroup_Count("hgn_missiledestroyer"..playerIndex) >= 1 or
					SobGroup_Count("hgn_iondestroyer"..playerIndex) >= 1 or
					SobGroup_Count("hgn_artillerydestroyer"..playerIndex) >= 1 then
						ArmourUpgradeHgnDestroyer(playerIndex)
					end
				end
				
				if (Player_HasResearch(playerIndex, "ImprovedTankerArmour") == 1) then
					if SobGroup_Count("hgn_tanker"..playerIndex) >= 1 then
						ArmourUpgradeHgnTanker(playerIndex)
					end
				end
			
				if (Player_HasResearch(playerIndex, "JuggernaughtTech") == 1) then
					if SobGroup_Count("hgn_ark"..playerIndex) >= 1 or SobGroup_Count("hgn_battlestation"..playerIndex) >= 1 then
						Hgn_RestrictJuggernaughtBuildOptionOnShips(playerIndex)
					end
				end
				
				if SobGroup_Count("hgn_marinefrigate"..playerIndex) >= 1 then
					CaptureTimeUpgradeHgn(playerIndex)
				end
				
				if Player_HasResearch(playerIndex, "isai") == 1 then
					if SobGroup_Count("hgn_combatbase"..playerIndex) >= 1 or
					SobGroup_Count("hgn_gunturret"..playerIndex) >= 1 or
					SobGroup_Count("hgn_pulsarturret"..playerIndex) >= 1 or
					SobGroup_Count("hgn_ionturret"..playerIndex) >= 1 or
					SobGroup_Count("hgn_missileturret"..playerIndex) >= 1 or
					SobGroup_Count("hgn_defensefieldturret"..playerIndex) >= 1 or
					SobGroup_Count("hgn_rts"..playerIndex) >= 1 or
					SobGroup_Count("hgn_sentinel"..playerIndex) >= 1 or
					SobGroup_Count("hgn_ionsentinel"..playerIndex) >= 1 or
					SobGroup_Count("hgn_artillerysentinel"..playerIndex) >= 1 or
					SobGroup_Count("hgn_defenderdrone"..playerIndex) >= 1 then
						GuardHgnPlatform(playerIndex)
					end
				end
				
				if Player_HasResearch(playerIndex, "HyperspaceCoreSummon") == 1 then
					SummonHyperspaceCore(playerIndex)
				end
				
			--salvage docking bug fix! VERY IMPORTANT!  
				if CPU_Exist_Smart(playerIndex) == 1 and SobGroup_Count("productioncapital"..playerIndex) >= 1 and SobGroup_Count("hgn_resourcecollector"..playerIndex) >= 1 and year > 1 then
					--HgnSalvageForcedStop(playerIndex)
				end
				
			end

			if Player_GetRace(playerIndex) == 2 then
				if Player_HasResearch(playerIndex, "isai") == 1 and SobGroup_Count("vgr_supportfrigatearmed"..playerIndex) >= 1 then
					DockVgrFrigate(playerIndex)
				end
				
				if SobGroup_Count("vgr_heavycruiser"..playerIndex) >= 1 then
					DockVgrCapFri(playerIndex)
				end
				
				if SobGroup_Count("vgr_infiltratorfrigate"..playerIndex) >= 1 then
					CaptureTimeUpgradeVgr(playerIndex)
				end
				
				if Player_HasResearch(playerIndex, "isai") == 1 then
					if SobGroup_Count("vgr_weaponplatform_gun"..playerIndex) >= 1 or
					SobGroup_Count("vgr_weaponplatform_lance"..playerIndex) >= 1 or
					SobGroup_Count("vgr_weaponplatform_missile"..playerIndex) >= 1 or
					SobGroup_Count("vgr_am"..playerIndex) >= 1 then
						GuardVgrPlatform(playerIndex)
					end
				end

				if Player_HasResearch(playerIndex, "isai") == 1 then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hyperspace_platform") >= 1 then
						--print("calling fuction: StopVgrPlatform(playerIndex)")
						StopVgrPlatform(playerIndex)	--not the cause of 00000010 crash
					end
				end
				
			--salvage docking bug fix! VERY IMPORTANT!  
				if CPU_Exist_Smart(playerIndex) == 1 and SobGroup_Count("productioncapital"..playerIndex) >= 1 and SobGroup_Count("vgr_resourcecollector"..playerIndex) >= 1 and year > 1 then
					--VgrSalvageForcedStop(playerIndex)
				end

			end
			
			if Player_GetRace(playerIndex) == Race_Kadeshi then

			--salvage docking bug fix! VERY IMPORTANT!  
				if CPU_Exist_Smart(playerIndex) == 1 and SobGroup_Count("kad_needleship"..playerIndex) >= 1 and SobGroup_Count("kad_ressourcecollector"..playerIndex) >= 1 and year > 1 then
					--KadSalvageForcedStop(playerIndex)
				end
				if Player_HasResearch(playerIndex, "isai") == 1 then
					if SobGroup_Count("kad_needleship"..playerIndex) >= 1 and SobGroup_Count("kad_snail"..playerIndex) >= 1 then
						GuardKadPlatform(playerIndex)
					end
					if SobGroup_Count("kad_podship"..playerIndex) >= 1 and SobGroup_Count("kad_ressourcecollector"..playerIndex) >= 1 then
						KadPodshipAutoCapture(playerIndex)
					end
				end
				
				if Player_HasResearch(playerIndex, "isai") == 1 and Player_HasResearch(playerIndex, "GardenerOfKadesh") == 1 and SobGroup_Count("kad_ressourcecollector"..playerIndex) >= 1 then
					AI_RepairHulks(playerIndex, "kad_ressourcecollector"..playerIndex)
				end
				
			end
			
			if Player_GetRace(playerIndex) == Race_Raider then
			
			--Check Generals
				Rad_GeneralList.Rank[playerIndex+1] = Rad_GetPlayerRank(playerIndex)
				if SobGroup_Count("rad_mothership"..playerIndex) >= 1 then
	      	for h=1,8 do
	      		if SobGroup_GetHardPointHealth("rad_mothership"..playerIndex, "rad_general_"..h) > 0 then
	      			Rad_GeneralList.General[playerIndex+1] = h
	      			local targethealth = 1-(0.5/6)*Rad_GetPlayerRank(playerIndex)
	      			if SobGroup_GetHardPointHealth("rad_mothership"..playerIndex, "rad_general_"..h) ~= targethealth then
	      				SobGroup_SetHardPointHealth("rad_mothership"..playerIndex, "rad_general_"..h, targethealth)
	      			end
	      		end
	      	end
	      else
	      	Rad_GeneralList.General[playerIndex+1] = 0
				end
			
				local ships_in_scaffold = 0
				for i = 1, Table_CountElements(RadBuildtable), 1 do
					ships_in_scaffold = ships_in_scaffold + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, RadBuildtable[i])
				end
				if ships_in_scaffold > 0 then
					RadConstructCapitalShips(playerIndex)
				end
				
				if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_defenderdrone") > 0 then
					Rad_KillPDSDrone(playerIndex)
				end
				
				if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_shielddrone") > 0 then
					Rad_KillBodyguard(playerIndex)
				end
				
			--salvage docking bug fix! VERY IMPORTANT!  
				if CPU_Exist_Smart(playerIndex) == 1 and SobGroup_Count("productioncapital"..playerIndex) >= 1 and SobGroup_Count("rad_resourcecollector"..playerIndex) >= 1 and year > 1 then
					--RadSalvageForcedStop(playerIndex)
				end
				
				if CPU_Exist_Smart(playerIndex) == 1 and SobGroup_Count("rad_resourcecollector"..playerIndex) > 4 then
					RadCollectorsResume(playerIndex)
				end
				
				if SobGroup_Count("rad_refurbisheddestroyer"..playerIndex) >= 1 then
					CreateTurretsRadRefDestroyer(playerIndex)
				end
				
				if Player_HasResearch(playerIndex, "isai") == 1 and SobGroup_Count("rad_resourcecollector"..playerIndex) >= 1 then
					AI_RepairHulks(playerIndex, "rad_resourcecollector"..playerIndex)
				end
				
			end
			
			if Player_GetRace(playerIndex) == Race_Keeper then
				
				if Player_HasResearch(playerIndex, "isai") == 1 and SobGroup_Count("kpr_resourcecollector"..playerIndex) >= 1 then
					AI_RepairHulks(playerIndex, "kpr_resourcecollector"..playerIndex)
				end
				
			end

     --reassurance! VERY IMPORTANT!     
		  if CPU_Exist_Smart(playerIndex) == 1 and GetGameRubric() ~= GR_CAMPAIGN then
		    if Player_CanResearch(playerIndex, "isai" ) == 1 then
			  	Player_GrantResearchOption( playerIndex , "isai" )
			   	print("AI granted for player index: ".. playerIndex)
		  	else
		  		--print("there's no need to reassure AI for player index: ".. playerIndex)
		  	end
		 	end
		    
		end
		
		--functions that do no require the player to be alive
		SobGroup_Create("SOB_PlayerGhosts"..playerIndex)	--must create the group here because sobgroupfunctions.lua only creates groups for players alive
		if SobGroup_Empty("SOB_PlayerGhosts"..playerIndex) == 0 then
			AI_GhostIdling(playerIndex)
		end
		
		playerIndex = playerIndex + 1
	end
	
	--Shipwreck removal function
	RemoveShipwreckCheck()		--in Megalith.lua
	
	Rule_RandomInterval("RaceCheckSlow", 23.222, 1)
	--print("RaceCheckSlow - End")
end

function keeper_1Sek()
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		-- keepers
		if (Player_IsAlive(playerIndex) == 1 and Player_GetRace(playerIndex) == Race_Keeper) then
			if (Player_HasResearch(playerIndex, "EmergencyRegeneration") == 1) then
				Update_AllShips()
				local i = 0
				repeat
					i = i +1
					shiptype = shiptablekpr[i]
					
					SobGroup_Create("Shiptype_Kpr")
					Player_FillShipsByType("Shiptype_Kpr", playerIndex, shiptype)
						
					local numsquadrons = SobGroup_Count("Shiptype_Kpr")
					SobGroup_SplitGroupReference("Dyingship", "Shiptype_Kpr", "AllShips", numsquadrons )
						
					if (numsquadrons > 0) then
						for counter = 0, numsquadrons -1, 1 do
							if SobGroup_HealthPercentage("Dyingship".. counter) <= thresholdkpr[i] and SobGroup_HealthPercentage("Dyingship".. counter) > 0 then
								local randNum = random_pseudo(0, 100)
								-- -- print("----------------------- Rand = ".. randNum .. " Chance = " .. chancetablekpr[i])
								if (randNum <= chancetablekpr[i]) then 
								-- -- print("----------------------- Heavy Damages Ship (KPR) Found, regening health")
									FX_StartEvent( "Dyingship"..counter, "Phase" )
									if restoretablekpr[i] > 1 then
										restoretablekpr[i] = 1
									end
									SobGroup_SetHealth("Dyingship".. counter, restoretablekpr[i])
								end
							end
						end
					end
				until (not shiptablekpr[i + 1])	
			end
			-- spawn drones (every sec because I think this works better but who knows?)
			spawnDronesFromQueue(playerIndex)
			-- phase bubble bla
			phaseBubbleKeeper(playerIndex)
			-- inversed bubble
			phaseBlowoutKeeper(playerIndex)
			-- posession
			keeperPosession(playerIndex)
			-- sacrifice
			if (Player_HasResearch(playerIndex, "KeeperSacrifice") == 1) then
				keeperSacrifice(playerIndex)
			end
			-- confusion & feedback
			if (Player_HasResearch(playerIndex, "ReaverConfusion") == 1) then
				reaverConfusion(playerIndex)
			elseif (Player_HasResearch(playerIndex, "ReaverFeedback") == 1) then 
				reaverFeedback(playerIndex)
			end		
			-- drain stuff
			phaseDrainKeeper(playerIndex)
			-- apply drain per second.. which should not be called bla but yeah... and this is a local variable, man
			local bla = drainsteps[playerIndex+1]
			local ruresult = Player_GetRU(playerIndex) + bla		--it's no longer draining, but assisting
			if CPU_Exist_Smart(playerIndex) == 1 then		--AI aids
				if ruresult <= RUMaxCapacityList[playerIndex+1] then
					Player_SetRU(playerIndex, ruresult)		-- -10 RUs, what the fuck was this
				else
					Player_SetRU(playerIndex, RUMaxCapacityList[playerIndex+1])
				end
			else		--for human players, add 10 RUs when there's no RU
				if Player_GetRU(playerIndex) == 0 then
					Player_SetRU(playerIndex, 10)
				end
			end
			
			--kill dummy objects
			Kpr_KillDummyObjects(playerIndex)
			if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_lightgranule_tiny") > 0 then
				Kpr_KillSmallPlasmaBalls(playerIndex)
			end
			
			--fusion engine fx
			KeeperFusionEngineFX(playerIndex)
			
		end
		playerIndex = playerIndex + 1
	end
	
	Rule_RandomInterval("keeper_1Sek", 1, 0.05)
end

-- what is the keeper generator unit?
kprgenerator = "kpr_ressourcecollector_old"
-- ships affected by generators
keeperBonusShips = {"kpr_reaver", "kpr_dreadnaught"}
-- mover drain when capping
moverDPS = 0.005
-- regen tick for the hunter
hunterGainTick = 0.03
-- keeper blink respawn minimum (*1, *2 and *3 are the values the game can random to)

-- this is weird but seems like it has to be initalized this way.
-- wish I knew lua better
drainsteps = {10,10,10,10,10,10}

-- keeper ships which get energy boosts
shiptablekpr = {"kpr_destroyer", "kpr_dreadnaught", "kpr_carrier", "kpr_reaver", "kpr_sajuuk", "kpr_hive"} -- ships with phase armor fx
thresholdkpr = {0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1} 
chancetablekpr = {10, 10, 10, 10, 10, 10, 10}
restoretablekpr = {0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3}

function keeper3Sek()	
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		local cpuPlayer = 0
		if CPU_Exist_Smart(playerIndex) == 1 then
				cpuPlayer = 1
		end

		-- cancelshields
		if (Player_IsAlive(playerIndex) == 1 and Player_GetRace(playerIndex) ~= Race_Keeper) then
			cancelshields(playerIndex)
		end
		-- keeper stuff
		if (Player_IsAlive(playerIndex) == 1 and Player_GetRace(playerIndex) == Race_Keeper) then
			-- drones
			spawnDrones(playerIndex)
			-- movers yay
			towShipMover(playerIndex)
			-- hunters
			if (Player_HasResearch(playerIndex, "HunterRegenStealth") == 1) then
				processHunters(playerIndex)
			end
			-- keepers
			if (Player_HasResearch(playerIndex, "KeeperPhaseShields") == 1) then
				keeperShields(playerIndex)
			end
			-- generators calculations
			-- this is a little wonky and needs some work!
			-- play effect (YES ONLY EFFECT!)
			SobGroup_Create("Generators_SOB")
			Player_FillShipsByType("Generators_SOB", playerIndex, kprgenerator)
			FX_StartEvent( "Generators_SOB", "Work" )
			
			-- Combat hyperspace! Yeah! Kick the shit out of other players' ass!
			if cpuPlayer == 1 and Player_HasResearch(playerIndex, "QuantumShifting") == 1 then
				KeeperAIHyperspaceWarfare(playerIndex)
			end
			
		end			
		playerIndex = playerIndex + 1
	end
	-- called for every player resp. are global calls, don't need to be called per player.
	shipbonusesKpr()
	processTowedShips()
	processPhaseShields()
	
	Rule_RandomInterval("keeper3Sek", 3, 0.1)
end

function KeeperAIHyperspaceWarfare(playerIndex)
	local playerIndexList = playerIndex + 1
	SobGroup_Create("Keeper_HyperspaceWarfare_SOB")
	SobGroup_FillSubstract("Keeper_HyperspaceWarfare_SOB", "Player_Ships"..playerIndex, "supporter"..playerIndex)
	local numkeepers = SobGroup_SplitGroupReference("SingleCombatJumpKprAI", "Keeper_HyperspaceWarfare_SOB", "Player_Ships"..playerIndex, SobGroup_Count("Keeper_HyperspaceWarfare_SOB")) 
	if numkeepers ~= nil then
		if numkeepers >= 1 then
			local counter = random_pseudo(0,numkeepers-1)
			local lastcounter = {}
			for z=1,CPULODvalueList[playerIndexList]^2+1,1 do			--multiple ships can jump at the same time, depending on the CPU Player difficulty
				counter = random_pseudo(0,numkeepers-1)
				local breaker = 0
				if z > 1 then
					for i=1,z-1,1 do
						if counter == lastcounter[i] then
							breaker = 1
						end
					end
				end
				if breaker == 0 and
				SobGroup_CanDoAbility("SingleCombatJumpKprAI"..counter, AB_Hyperspace) == 1 and
				SobGroup_UnderAttack("SingleCombatJumpKprAI"..counter) == 1 and
				SobGroup_HealthPercentage("SingleCombatJumpKprAI"..counter) > 0 and
				SobGroup_IsDocked("SingleCombatJumpKprAI"..counter) == 0 and
				SobGroup_IsDoingAbility("SingleCombatJumpKprAI"..counter, AB_Dock) == 0 and
				--SobGroup_IsDoingAbility("SingleCombatJumpKprAI"..counter, AB_Parade) == 0 and
				SobGroup_AreAllInRealSpace("SingleCombatJumpKprAI"..counter) == 1 then	
					if SobGroup_CanDoAbility("SingleCombatJumpKprAI"..counter, AB_Attack) == 0 then		--non-combat ships
						if SobGroup_HealthPercentage("SingleCombatJumpKprAI"..counter) < 0.5+0.1*CPULODvalueList[playerIndexList] or
						SobGroup_AreAnyOfTheseTypes("SingleCombatJumpKprAI"..counter, "kpr_shipyard_old") == 1 and SobGroup_GetEquivalentSpeed("SingleCombatJumpKprAI"..counter) > 10000 or	--save the wormhole!
						SobGroup_GetEquivalentSpeed("SingleCombatJumpKprAI"..counter) > 640000 or SobGroup_InWorldBound("SingleCombatJumpKprAI"..counter, 1) == 0 then	--save other ships kicked by repulsor!
							if Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "SingleCombatJumpKprAI"..random_pseudo(0,numkeepers-1)) == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "megalithnoowner") == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "megalitenoowner") == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "debrisnoowner") == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "AllToHelp"..playerIndex) == 1 then
							end
						end
					else		--ships that can attack
						SobGroup_Create("AIJumpTargetSob")
						SobGroup_Clear("AIJumpTargetSob")
						SobGroup_GetAttackers("SingleCombatJumpKprAI"..counter, "AIJumpTargetSob")
						local criticaldamage = 0
						if SobGroup_HealthPercentage("SingleCombatJumpKprAI"..counter) < 0.5-0.1*CPULODvalueList[playerIndexList] then
							criticaldamage = 1
						end
						if SobGroup_IsDoingAbility("SingleCombatJumpKprAI"..counter, AB_Attack) == 1 and criticaldamage == 0 then
							if SobGroup_GetDistanceToSobGroup("SingleCombatJumpKprAI"..counter, "AIJumpTargetSob") < 6000	then		--close hyperspace combat
								if Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "AIJumpTargetSob") == 1 then
									if SobGroup_GetDistanceToSobGroup("SingleCombatJumpKprAI"..counter, "AIJumpTargetSob") < 6000 then
										SobGroup_Attack(playerIndex, "SingleCombatJumpKprAI"..counter, "AIJumpTargetSob")
									end
								end
							end
						elseif criticaldamage == 1 then
							if Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "SingleCombatJumpKprAI"..random_pseudo(0,numkeepers-1)) == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "megalithnoowner") == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "megalitenoowner") == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "debrisnoowner") == 1 then
							elseif Kpr_CombatJump("SingleCombatJumpKprAI"..counter, "AllToHelp"..playerIndex) == 1 then
							end
						end
					end
				end
				lastcounter[z] = counter
			end
		end
	end
end

function Kpr_CombatJump(ship, target)	--Any target ship without parade formation causes crash! A dummy object with parade formation is needed to do this!
	local canparade = 0
	if SobGroup_Empty(target) == 0 then
		if not (SobGroup_Count(ship) == 1 and SobGroup_Count(target) == 1 and SobGroup_GroupInGroup(ship, target) == 1) then
			SobGroup_Create("SOB_KprAIDummyParadeTarget")
			SobGroup_Clear("SOB_KprAIDummyParadeTarget")
			Volume_AddSphere("VOL_KprAIDummyParadeTarget", SobGroup_GetPosition(target), 6000)
			SobGroup_SpawnNewShipInSobGroup(-1, "kpr_dummy_paradetarget", "ParadeTarget", "SOB_KprAIDummyParadeTarget", "VOL_KprAIDummyParadeTarget")
			if SobGroup_Empty("SOB_KprAIDummyParadeTarget") == 0 then
				if SobGroup_HealthPercentage("SOB_KprAIDummyParadeTarget") > 0 then
					canparade = 1
					local lasthealth = SobGroup_HealthPercentage(ship)
					local redock = 0
					if SobGroup_AreAnyOfTheseTypes(ship, "kpr_dreadnaught, kpr_reaver") == 1 then
						SobGroup_Create("KprAIGeneratorsForJump")
						SobGroup_Clear("KprAIGeneratorsForJump")
						SobGroup_GetSobGroupDockedWithGroup(ship, "KprAIGeneratorsForJump")
						redock = 1
					end
					SobGroup_ParadeSobGroup(ship, "SOB_KprAIDummyParadeTarget", 1)
					if redock == 1 and SobGroup_Empty("KprAIGeneratorsForJump") == 0 then
						SobGroup_DockSobGroupAndStayDocked_Smart("KprAIGeneratorsForJump", ship)
					end
					if lasthealth <= 1 and lasthealth > 0 and SobGroup_HealthPercentage(ship) < lasthealth then
						SobGroup_SetHealth(ship, lasthealth)
					end
				end
				SobGroup_SetHealth("SOB_KprAIDummyParadeTarget", 0)
			end
			Volume_Delete("VOL_KprAIDummyParadeTarget")
		end
	end
	return canparade
end

function KeeperFusionEngineFX(playerIndex)
	Update_AllShips()
	local numships = SobGroup_SplitGroupReference("Keeper_FusionEngineFX_SOB_Single", "Player_Ships"..playerIndex, "AllShips", SobGroup_Count("Player_Ships"..playerIndex))
	for counter = 0, numships-1, 1 do
		if SobGroup_Empty("Keeper_FusionEngineFX_SOB_Single"..counter) == 0 then
			if SobGroup_IsDoingAbility("Keeper_FusionEngineFX_SOB_Single"..counter, AB_Move) == 1 or SobGroup_GetEquivalentSpeed("Keeper_FusionEngineFX_SOB_Single"..counter) > 1000 then
				FX_StartEvent_Smart("Keeper_FusionEngineFX_SOB_Single"..counter, "FusionEngine", 3)
			else
				FX_StopEvent("Keeper_FusionEngineFX_SOB_Single"..counter, "FusionEngine")
			end
		end
	end
end

function keeperSacrifice(playerIndex)
	Update_AllShips()
	SobGroup_Create("Keeper_Posession_SOB")
	Player_FillShipsByType("Keeper_Posession_SOB", playerIndex, "kpr_destroyer")
	local numkeepers = SobGroup_SplitGroupReference("Keeper_Posession_SOB_Single", "Keeper_Posession_SOB", "AllShips", SobGroup_Count("Keeper_Posession_SOB"))
	SobGroup_Create("KeeperTargets_SOB")
	SobGroup_SobGroupAdd("KeeperTargets_SOB", "enemies"..playerIndex)
	SobGroup_SobGroupSubstract("KeeperTargets_SOB", "SOB_AllDummyHSGates")
	SobGroup_SobGroupSubstract("KeeperTargets_SOB", "all_supporters")
	local numtargets = SobGroup_SplitGroupReference("SingleKamikazeTarget_SOB", "KeeperTargets_SOB", "Keeper_Posession_SOB", SobGroup_Count("KeeperTargets_SOB"))
	for counter = 0, numkeepers -1, 1 do	
		if SobGroup_HealthPercentage("Keeper_Posession_SOB_Single" .. counter) > 0 then	--drawn to conflict
			if SobGroup_Empty("KeeperTargets_SOB") == 0 and 
			SobGroup_IsDoingAbility("Keeper_Posession_SOB_Single" .. counter, AB_Attack) == 1 and 
			SobGroup_GetTactics("Keeper_Posession_SOB_Single" .. counter) ~= 2 then
				SobGroup_KamikazeOnTargets("Keeper_Posession_SOB_Single" .. counter, "KeeperTargets_SOB", numtargets)
			end
		else	--deal damage on death
			SobGroup_EvacuateShipsAroundExplodingShip("Keeper_Posession_SOB_Single" .. counter, 4000)		--Evacuate nearby ships to avoid explosion damage
			local playerIndexNew = 0
			local playerCount = Universe_PlayerCount();
			while (playerIndexNew < playerCount) do
				if not (playerIndexNew == playerIndex) then
					if not (AreAllied(playerIndexNew, playerIndex)  == 1) then
						SobGroup_Create("Keeper_Posessed_SOB")
						SobGroup_Clear("Keeper_Posessed_SOB")
						Player_FillProximitySobGroup("Keeper_Posessed_SOB", playerIndexNew, "Keeper_Posession_SOB_Single" .. counter , 6000)
						local numdm = SobGroup_SplitGroupReference("Keeper_Posession_damage", "Keeper_Posessed_SOB", "AllShips", SobGroup_Count("Keeper_Posessed_SOB")) 
						for i = 0, numdm -1, 1 do
							local dist = SobGroup_GetDistanceToSobGroup("Keeper_Posession_damage"..i, "Keeper_Posession_SOB_Single"..counter)
							if dist > 6000 then
								dist = 6000
							end
							local factor = 0.1-0.1*dist^2/6000^2
							if factor < 0.0001 then
								factor = 0.0001
							end
							SobGroup_TakeDamageFraction("Keeper_Posession_damage"..i, factor) 		--was 0.3, because the death time of Keeper is prolonged now
						end
					end
				end
				playerIndexNew = playerIndexNew + 1
			end			
		end
	end
end

function SobGroup_TakeDamageFraction(ship, damage)
	local health = SobGroup_HealthPercentage(ship)
	SobGroup_TakeDamage(ship, health*damage)
end

function keeperPosession(playerIndex)
	Update_AllShips()
	SobGroup_Create("Keeper_Posession_SOB")
	Player_FillShipsByType("Keeper_Posession_SOB", playerIndex, "kpr_destroyer")
	local numkeepers = SobGroup_SplitGroupReference("Keeper_Posession_SOB_Single", "Keeper_Posession_SOB", "AllShips", SobGroup_Count("Keeper_Posession_SOB")) 
	for counter = 0, numkeepers -1, 1 do	
		if (SobGroup_IsDoingAbility("Keeper_Posession_SOB_Single" .. counter, AB_DefenseField) == 1) then
			local playerIndexNew = 0
			local playerCount = Universe_PlayerCount();
			while (playerIndexNew < playerCount) do
				if not (playerIndexNew == playerIndex) then
					if not (AreAllied(playerIndexNew, playerIndex)  == 1) then
						SobGroup_Create("Keeper_Posessed_SOB")
						SobGroup_Clear("Keeper_Posessed_SOB")
						Player_FillProximitySobGroup("Keeper_Posessed_SOB", playerIndexNew, "Keeper_Posession_SOB_Single" .. counter , 4000)
						FX_StartEvent( "Keeper_Posession_SOB_Single".. counter, "Posession" )
						SobGroup_Kamikaze("Keeper_Posessed_SOB", "Keeper_Posession_SOB_Single" .. counter)
					end
				end
				playerIndexNew = playerIndexNew + 1
			end			
		end
	end
end

function reaverConfusion(playerIndex)
	Update_AllShips()
	SobGroup_Create("Reaver_Confusion_SOB")
	Player_FillShipsByType("Reaver_Confusion_SOB", playerIndex, "kpr_reaver")
	local numreavers = SobGroup_SplitGroupReference("Reaver_Confusion_SOB_Single", "Reaver_Confusion_SOB", "AllShips", SobGroup_Count("Reaver_Confusion_SOB")) 
		for counter = 0, numreavers -1, 1 do	
		if (SobGroup_IsDoingAbility("Reaver_Confusion_SOB_Single" .. counter, AB_DefenseField) == 1) then
			local playerIndexNew = 0
			local playerCount = Universe_PlayerCount();
			while (playerIndexNew < playerCount) do
				if not (playerIndexNew == playerIndex) then
					if not (AreAllied(playerIndexNew, playerIndex)  == 1) then
						SobGroup_Create("Reaver_Confused_SOB")
						SobGroup_Clear("Reaver_Confused_SOB")
						Player_FillProximitySobGroup("Reaver_Confused_SOB", playerIndexNew, "Reaver_Confusion_SOB_Single" .. counter , 3000)
						FX_StartEvent( "Reaver_Confusion_SOB_Single".. counter, "Confusion" )
						SobGroup_Stop(playerIndexNew, "Reaver_Confused_SOB")
					end
				end
				playerIndexNew = playerIndexNew + 1
			end			
		end
	end
end

function reaverFeedback(playerIndex)
	Update_AllShips()
	SobGroup_Create("Reaver_Confusion_SOB")
	Player_FillShipsByType("Reaver_Confusion_SOB", playerIndex, "kpr_reaver")
	local numreavers = SobGroup_SplitGroupReference("Reaver_Confusion_SOB_Single", "Reaver_Confusion_SOB", "AllShips", SobGroup_Count("Reaver_Confusion_SOB")) 
	for counter = 0, numreavers -1, 1 do	
		if (SobGroup_IsDoingAbility("Reaver_Confusion_SOB_Single" .. counter, AB_DefenseField) == 1) then
			local playerIndexNew = 0
			local playerCount = Universe_PlayerCount();
			while (playerIndexNew < playerCount) do
				if not (playerIndexNew == playerIndex) then
					if not (AreAllied(playerIndexNew, playerIndex)  == 1) then
						SobGroup_Create("Reaver_Confused_SOB")
						SobGroup_Clear("Reaver_Confused_SOB")
						SobGroup_GetAttackers("Reaver_Confusion_SOB_Single" .. counter, "Reaver_Confused_SOB")
						FX_StartEvent( "Reaver_Confusion_SOB_Single".. counter, "Feedback" )
						--SobGroup_TakeDamage("Reaver_Confused_SOB", 0.02)		--This is too OP, fire small light granules at each individual attacker instead
						if SobGroup_Empty("Reaver_Confused_SOB") == 0 then
							local numplasma = SobGroup_SplitGroupReference("Reaver_FeedbackTarget_SOB_Single", "Reaver_Confused_SOB", "AllShips", SobGroup_Count("Reaver_Confused_SOB")) 
							for z = 0, numplasma -1, 1 do
								if SobGroup_Empty("Reaver_FeedbackTarget_SOB_Single"..z) == 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_lightgranule_tiny") < 50 then
									local position = SobGroup_GetPosition("Reaver_Confusion_SOB_Single".. counter)
									Volume_AddSphere("VOL_ReaverFeedbackTemp"..playerIndex..counter..z, position, 200)
									SobGroup_Create("Reaver_SinglePlasmaBall_TempSOB")
									SobGroup_Clear("Reaver_SinglePlasmaBall_TempSOB")
									SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_lightgranule_tiny", "Reaver_SinglePlasmaBall_TempSOB", "Reaver_SinglePlasmaBall_TempSOB", "VOL_ReaverFeedbackTemp"..playerIndex..counter..z)
									Volume_Delete("VOL_ReaverFeedbackTemp"..playerIndex..counter..z)
									SobGroup_Kamikaze("Reaver_SinglePlasmaBall_TempSOB", "Reaver_FeedbackTarget_SOB_Single"..z)
									SobGroup_SetSpeed("Reaver_SinglePlasmaBall_TempSOB", random_pseudo(200,500)/100)
									FX_StartEvent("Reaver_SinglePlasmaBall_TempSOB", "launch")
								end
							end
						end
					end
				end
				playerIndexNew = playerIndexNew + 1
			end			
		end
	end
end

function processHunters(playerIndex)
	Update_AllShips()
	SobGroup_Create("TotalHunter_SOB")
	Player_FillShipsByType("TotalHunter_SOB", playerIndex, "kpr_hunter")
	local numhunters = SobGroup_Count("TotalHunter_SOB")
	if numhunters > 0 then
		numhunters = SobGroup_SplitGroupReference("SingleHuner_SOB", "TotalHunter_SOB", "AllShips", numhunters )
		for counter = 0, numhunters -1, 1 do
			if (SobGroup_IsCloaked("SingleHuner_SOB".. counter) == 1) then
				local hunterH = SobGroup_HealthPercentage("SingleHuner_SOB".. counter)
				if (hunterH > 0 and hunterH < 0.99) then		
					FX_StartEvent( "SingleHuner_SOB".. counter, "Phase_loop" )
					SobGroup_SetHealth("SingleHuner_SOB".. counter, hunterH + hunterGainTick)	
				end
			end
		end
	end
end

function processTowedShips()
	for x = 0, movergroups.num -1, 1 do
		-- -- print("Processing mover" .. x)
		if (movergroups.combos[x][4] == 0) then	
			SobGroup_GetSobGroupCapturingGroup(movergroups.combos[x][2], movergroups.combos[x][3])
			local numTowingShips = SobGroup_Count(movergroups.combos[x][3])
			if (numTowingShips < 1) then
				SobGroup_AutoEngineGlow(movergroups.combos[x][2])
			else
				SobGroup_SetMaxSpeedMultiplier(movergroups.combos[x][2], 0.7 + (numTowingShips * 0.1) )
			end
			if (SobGroup_IsInVolume(movergroups.combos[x][2], movergroups.combos[x][0]) == 1) then
				-- stop cargo, set delete flag for cleanup process
				SobGroup_Stop(movergroups.combos[x][5], movergroups.combos[x][2])	
				movergroups.combos[x][4] = 1
			else 
				-- not in volume yet
				SobGroup_Move(movergroups.combos[x][5], movergroups.combos[x][2], movergroups.combos[x][0])
				SobGroup_SetHealth_Smart(movergroups.combos[x][2], SobGroup_HealthPercentage(movergroups.combos[x][2]) - moverDPS)
			end
		end
	end
end

-- monster to the power of fifty but it works pretty well tbh... just over-processes a lot which should probably be fixed... no?
function towShipMover(playerIndex)
	SobGroup_Create("TowedShipsSob")
	Update_AllShips()
	cleanTowTable()
	SobGroup_Create("TotalMover_SOB")
	Player_FillShipsByType("TotalMover_SOB", playerIndex, "kpr_mover")
	local nummovers = SobGroup_Count("TotalMover_SOB")
	if nummovers > 0 then
		nummovers = SobGroup_SplitGroupReference("SingleMover_SOB", "TotalMover_SOB", "AllShips", nummovers )
		for counter = 0, nummovers -1, 1 do
			if (SobGroup_IsDoingAbility("SingleMover_SOB".. counter, AB_Capture) == 1) then
				-- -- print("Mover found capping")
				SobGroup_ManualEngineGlow("SingleMover_SOB".. counter, 0)
				SobGroup_Create("PossibleCapTarget_SOB")
				SobGroup_Create("PossibleCapTarget_SOB_2")
				SobGroup_Create("LocalTowingService")
				SobGroup_FillProximitySobGroup("PossibleCapTarget_SOB", "AllShips", "SingleMover_SOB".. counter, 3000)
				SobGroup_GetSobGroupBeingCapturedGroup("PossibleCapTarget_SOB", "PossibleCapTarget_SOB_2")
				SobGroup_SplitGroupReference("PossibleCapTarget_SOB_3", "PossibleCapTarget_SOB_2", "AllShips", SobGroup_Count("PossibleCapTarget_SOB_2"))
				for incrementor = 0, SobGroup_Count("PossibleCapTarget_SOB_2") - 1, 1 do
					SobGroup_GetSobGroupCapturingGroup("PossibleCapTarget_SOB_3".. incrementor, "LocalTowingService")
					if (SobGroup_GroupInGroup("LocalTowingService", "SingleMover_SOB".. counter) == 1) then
						-- -- print("Confirmed we're the arse pulling it")
						if (SobGroup_GroupInGroup("PossibleCapTarget_SOB_3".. incrementor, "TowedShipsSob") ~= 1 ) then
							-- -- print("Aint in the list yet - add it! Index: ".. movergroups.num)
							SobGroup_SobGroupAdd("TowedShipsSob", "PossibleCapTarget_SOB_3".. incrementor)	
							pos = SobGroup_GetPosition("PossibleCapTarget_SOB_3".. incrementor)
							local randNum = random_pseudo(1, 3)
							local plusminus = random_pseudo(0, 1)
							owner = SobGroup_OwnedBy("PossibleCapTarget_SOB_3".. incrementor)
							if (owner ~= -1) then
								if plusminus == 1 then
									pos[randNum] = pos[randNum] + (2000 * randNum)
								else
									pos[randNum] = pos[randNum] - (2000 * randNum)
								end
								Volume_AddSphere("RandomTargetVolume".. movergroups.num, pos, 200)
								SobGroup_ManualEngineGlow("PossibleCapTarget_SOB_3".. incrementor, 0)
								SobGroup_Move(owner, "PossibleCapTarget_SOB_3".. incrementor, "RandomTargetVolume".. movergroups.num)
								
								SobGroup_Create("Towed_SOB".. movergroups.num)
								SobGroup_SobGroupAdd("Towed_SOB".. movergroups.num, "PossibleCapTarget_SOB_3".. incrementor)	
								SobGroup_Create("Towing_SOB".. movergroups.num)
								SobGroup_SobGroupAdd("Towing_SOB".. movergroups.num, "SingleMover_SOB" .. counter)
								
								local currentcombo = {}
								currentcombo[0] = "RandomTargetVolume".. movergroups.num
								currentcombo[1] = 1 -- nummovers
								currentcombo[2] = "Towed_SOB".. movergroups.num
								currentcombo[3] = "Towing_SOB".. movergroups.num
								currentcombo[4] = 0 -- reachgoal?
								currentcombo[5] = owner -- index of player being towed
								currentcombo[6] = playerIndex -- index of player doing the towing
								movergroups.combos[movergroups.num] = currentcombo
								movergroups.num = movergroups.num + 1
							end
						end
					end
				end
			else
				SobGroup_AutoEngineGlow("SingleMover_SOB".. counter)		
			end
		end
	end
end

-- defines ships with shields
shieldtable = {"kpr_destroyer", "kpr_dreadnaught", "kpr_carrier", "kpr_interceptor_combo", "kpr_interceptor_old", "kpr_attackdroid", "kpr_attackdroid_agitator", "kpr_attackdroid_combo"}
-- used to also have: kpr_reaver
-- definers for SA types (integers used to indentify, methings easier than strings - but assigned to vars for readability)
PHASE_SHIELD = 0
PHASE_JUMP = 1 -- disused but reserved
PHASE_BUBBLE = 2
PHASE_BLOWOUT = 3
PHASE_DRAIN = 4

function cancelshields(playerIndex)
	SobGroup_Create("OtherShields")
	local shiptype = ""
	i = 0
	repeat
		i = i + 1
		shiptype = shieldtable[i]
		SobGroup_Clear("OtherShields")
		Player_FillShipsByType("OtherShields", playerIndex, shiptype)
		if ( SobGroup_Count("OtherShields") > 0) then
			FX_StopEvent("OtherShields", "Phase_Loop")
			SobGroup_SetInvulnerability("OtherShields", 0)	
		end
	until (not shieldtable[i + 1])
end

-- keeper shields
function keeperShields(playerIndex)
	SobGroup_Create("Keeper_HasShields_SOB")
	Update_AllShips()
	cleanSFTable()
	local i = 0
	local shiptype = ""
	SobGroup_Create("Keeper_SOB")
	repeat
		i = i + 1
		SobGroup_Clear("Keeper_SOB")
		shiptype = shieldtable[i]
		Player_FillShipsByType("Keeper_SOB", playerIndex, shiptype)
		local numkeepers = SobGroup_Count("Keeper_SOB")
		if numkeepers > 0 then
			numkeepers = SobGroup_SplitGroupReference("SingleKeeper_SOB", "Keeper_SOB", "AllShips", numkeepers )
			for counter = 0, numkeepers -1, 1 do
				if (SobGroup_GroupInGroup("SingleKeeper_SOB"..counter, "Keeper_HasShields_SOB") ~= 1) then
					local currentcombo = {}
					SobGroup_SobGroupAdd("Keeper_HasShields_SOB", "SingleKeeper_SOB"..counter)
					SobGroup_Create("SA_Function_SOB".. specialabilities.num)
					SobGroup_SobGroupAdd("SA_Function_SOB".. specialabilities.num, "SingleKeeper_SOB"..counter)
					currentcombo[0]  = 0 -- is marked for deletion
					currentcombo[1]  = PHASE_SHIELD -- ability type
					currentcombo[2]  = 1 -- health ammount current
					currentcombo[3]  = 0.03 -- health ammount step
					currentcombo[4]  = 0 -- time count 
					currentcombo[5]  = "Phase_Loop" -- fx name
					currentcombo[6]  = "SA_Function_SOB".. specialabilities.num -- SOB Name containing ship
					specialabilities.combos[specialabilities.num] = currentcombo
					specialabilities.num = specialabilities.num + 1
				end
			end
		end
	until (not shieldtable[i + 1])
end

function phaseBlowoutKeeper(playerIndex)
	SobGroup_Create("Keeper_PhaseBubble_SOB")
	Update_AllShips()
	cleanSFTable()
	local i = 0
	local shiptype = ""
	SobGroup_Create("Dread_SOB")
	Player_FillShipsByType("Dread_SOB", playerIndex, "kpr_dreadnaught")
	local numsleepers = SobGroup_Count("Dread_SOB")
	if numsleepers > 0 then
		numsleepers = SobGroup_SplitGroupReference("DreadSingle_SOB", "Dread_SOB", "AllShips", numsleepers )
		for counter = 0, numsleepers -1, 1 do
			if (SobGroup_GroupInGroup("DreadSingle_SOB"..counter, "Keeper_PhaseBubble_SOB") ~= 1) then
				-- print("found dreadnaught to add to group")
				local currentcombo = {}
				SobGroup_SobGroupAdd("Keeper_PhaseBubble_SOB", "DreadSingle_SOB"..counter)
				-- fill all ships affected by sleep the first time - actually, this is really just a temp value to keep a SOB there and reserved
				SobGroup_Create("IsCastingBlowOut".. specialabilities.num)
				SobGroup_Create("Affected_By_BlowOut".. specialabilities.num)
				SobGroup_FillProximitySobGroup("Affected_By_BlowOut".. specialabilities.num, "AllShips", "DreadSingle_SOB"..counter, 6500)
				SobGroup_SobGroupAdd("IsCastingBlowOut".. specialabilities.num, "DreadSingle_SOB"..counter)
				currentcombo[0]  = 0 -- is marked for deletion
				currentcombo[1]  = PHASE_BLOWOUT -- ability type
				currentcombo[2]  = 0.1 -- drain ammount
				currentcombo[3]  = "Affected_By_BlowOut".. specialabilities.num -- ships that are affected by this blowout (used for process)
				currentcombo[4]  = 4500 -- blowout range
				currentcombo[5]  = 0 -- is doing shield now? (can't go on the other aby so we use this)
				currentcombo[6]  = "IsCastingBlowOut".. specialabilities.num -- ships ships that are casting the blowout
				currentcombo[7]  = 0 -- ammount of health (%) that is being stacked up
				specialabilities.combos[specialabilities.num] = currentcombo
				specialabilities.num = specialabilities.num + 1
			end
		end
	end
end

function phaseBubbleKeeper(playerIndex)
	SobGroup_Create("Keeper_PhaseBubble_SOB")
	Update_AllShips()
	cleanSFTable()
	local i = 0
	local shiptype = ""
	SobGroup_Create("Sleeper_SOB")
	Player_FillShipsByType("Sleeper_SOB", playerIndex, "kpr_carrier")
	local numsleepers = SobGroup_Count("Sleeper_SOB")
	if numsleepers > 0 then
		numsleepers = SobGroup_SplitGroupReference("SingleSleeper_SOB", "Sleeper_SOB", "AllShips", numsleepers )
		for counter = 0, numsleepers -1, 1 do
			if (SobGroup_GroupInGroup("SingleSleeper_SOB"..counter, "Keeper_PhaseBubble_SOB") ~= 1) then
				-- print("found sleeper to add to group")
				local currentcombo = {}
				SobGroup_SobGroupAdd("Keeper_PhaseBubble_SOB", "SingleSleeper_SOB"..counter)
				-- fill all ships affected by sleep the first time - actually, this is really just a temp value to keep a SOB there and reserved
				SobGroup_Create("IsCastingSleep".. specialabilities.num)
				SobGroup_Create("Affected_By_Sleep".. specialabilities.num)
				SobGroup_FillProximitySobGroup("Affected_By_Sleep".. specialabilities.num, "AllShips", "SingleSleeper_SOB"..counter, 6500)
				SobGroup_SobGroupAdd("IsCastingSleep".. specialabilities.num, "SingleSleeper_SOB"..counter)
				currentcombo[0]  = 0 -- is marked for deletion
				currentcombo[1]  = PHASE_BUBBLE -- ability type
				currentcombo[2]  = 0.1 -- slowdown ammount
				currentcombo[3]  = "Affected_By_Sleep".. specialabilities.num -- ships that are affected by this sleep (used for process)
				currentcombo[4]  = 6500 -- sleeprange
				currentcombo[5]  = 0 -- is doing shield now? (can't go on the other aby so we use this)
				currentcombo[6]  = "IsCastingSleep".. specialabilities.num -- ships ships that are casting the sleep ability
				specialabilities.combos[specialabilities.num] = currentcombo
				specialabilities.num = specialabilities.num + 1
			end
		end
	end
end

function phaseDrainKeeper(playerIndex)
	SobGroup_Create("Keeper_PhaseBubble_SOB")
	Update_AllShips()
	cleanSFTable()
	local i = 0
	local shiptype = ""
	SobGroup_Create("Drain_SOB")
	Player_FillShipsByType("Drain_SOB", playerIndex, "kpr_deciever")
	local numsleepers = SobGroup_Count("Drain_SOB")
	if numsleepers > 0 then
		numsleepers = SobGroup_SplitGroupReference("SingleDrain_SOB", "Drain_SOB", "AllShips", numsleepers )
		for counter = 0, numsleepers -1, 1 do
			if (SobGroup_GroupInGroup("SingleDrain_SOB"..counter, "Keeper_PhaseBubble_SOB") ~= 1) then
				-- print("found sleeper to add to group")
				local currentcombo = {}
				SobGroup_SobGroupAdd("Keeper_PhaseBubble_SOB", "SingleDrain_SOB"..counter)
				-- fill all ships affected by sleep the first time - actually, this is really just a temp value to keep a SOB there and reserved
				SobGroup_Create("IsCastingDrain".. specialabilities.num)
				SobGroup_Create("Affected_By_Drain".. specialabilities.num)
				SobGroup_SobGroupAdd("IsCastingDrain".. specialabilities.num, "SingleDrain_SOB"..counter)
				currentcombo[0]  = 0 -- is marked for deletion
				currentcombo[1]  = PHASE_DRAIN -- ability type
				currentcombo[2]  = 0.0055 -- life to drain ammount
				currentcombo[3]  = "Affected_By_Drain".. specialabilities.num -- ships that are affected by this sleep (used for process)
				currentcombo[4]  = 300 -- RU to grant
				currentcombo[5]  = 0 -- is doing shield now? (can't go on the other aby so we use this)
				currentcombo[6]  = "IsCastingDrain".. specialabilities.num -- ships ships that are casting the sleep ability
				currentcombo[7] = playerIndex -- player index
				specialabilities.combos[specialabilities.num] = currentcombo
				specialabilities.num = specialabilities.num + 1
			end
		end
	end
end

function processPhaseShields()
	Update_AllShips()
	for x = 0, specialabilities.num -1, 1 do
		---- print("Processing keeper" .. x)
		if (specialabilities.combos[x][0] == 0) then
			if (SobGroup_Count(specialabilities.combos[x][6]) > 0) then
				if (specialabilities.combos[x][1] == PHASE_SHIELD) then
				-- shield is ready
					if (specialabilities.combos[x][4] == 0) then
						---- print("Shields Ready")
						-- health from last check
						local oldhealth = specialabilities.combos[x][2]
						-- health current
						specialabilities.combos[x][2] = SobGroup_HealthPercentage(specialabilities.combos[x][6])
						-- if health differential > 1% then 
						---- print("Health Old:".. oldhealth .."Health New:".. specialabilities.combos[x][2])
						if ((oldhealth - specialabilities.combos[x][2]) > specialabilities.combos[x][3]) then
							specialabilities.combos[x][4] = 11
							SobGroup_SetInvulnerability(specialabilities.combos[x][6], 1)
							FX_StartEvent(specialabilities.combos[x][6], specialabilities.combos[x][5])
						end
					-- shield is running
					else
					---- print("Time:" .. specialabilities.combos[x][4])
					-- deactivate after 15 secs
					if (specialabilities.combos[x][4] == 8) then
						FX_StopEvent(specialabilities.combos[x][6], specialabilities.combos[x][5])
						SobGroup_SetInvulnerability(specialabilities.combos[x][6], 0)
					end
					-- always decrement by 1
					specialabilities.combos[x][4] = specialabilities.combos[x][4] - 1
					end
				end
				if (specialabilities.combos[x][1] == PHASE_BUBBLE) then
					if (SobGroup_IsDoingAbility(specialabilities.combos[x][6], AB_DefenseField) == 1) then
						-- print("found sleeper doing the bubble thing")
						-- just to be sure we don't overprocess
						specialabilities.combos[x][5] = 1
						-- set the speed
						SobGroup_SetMaxSpeedMultiplier(specialabilities.combos[x][3], 1)
						SobGroup_SetInvulnerability(specialabilities.combos[x][3], 0)
						SobGroup_Clear(specialabilities.combos[x][3])
						-- get new ships & set their speed + invulnerability
						SobGroup_FillProximitySobGroup(specialabilities.combos[x][3], "AllShips", specialabilities.combos[x][6], specialabilities.combos[x][4])
						SobGroup_SetMaxSpeedMultiplier(specialabilities.combos[x][3], specialabilities.combos[x][2])
						SobGroup_SetInvulnerability(specialabilities.combos[x][3], 1)
						-- and make sure our ship is the same... but not invulnerable!
						SobGroup_SetMaxSpeedMultiplier(specialabilities.combos[x][6], specialabilities.combos[x][2])
					else
						if (specialabilities.combos[x][5] == 1) then
							-- print("Done shielding - dump the crap")
							-- we're done, reset multiplyers and dump the proximity SOB.
							SobGroup_SetMaxSpeedMultiplier(specialabilities.combos[x][3], 1)
							SobGroup_SetMaxSpeedMultiplier(specialabilities.combos[x][6], 1)
							SobGroup_SetInvulnerability(specialabilities.combos[x][3], 0)
							SobGroup_SetInvulnerability(specialabilities.combos[x][6], 0)
							SobGroup_Clear(specialabilities.combos[x][3])
							specialabilities.combos[x][5] = 0
						end
					end
				end
				if (specialabilities.combos[x][1] == PHASE_BLOWOUT) then
					if (SobGroup_IsDoingAbility(specialabilities.combos[x][6], AB_DefenseField) == 1) then
						-- print("found dreadnaught doing the blowout thing")
						-- just to be sure we don't overprocess
						specialabilities.combos[x][5] = 1
						SobGroup_Create("TempGroup_BlowOut")
						SobGroup_FillProximitySobGroup("TempGroup_BlowOut", "AllShips", specialabilities.combos[x][6], specialabilities.combos[x][4])
						-- this *should* avoid damaging the dreadnaught by doing this...
						SobGroup_FillSubstract(specialabilities.combos[x][3], "TempGroup_BlowOut", specialabilities.combos[x][6])
						local numaffected = SobGroup_Count(specialabilities.combos[x][3])
						if (numaffected > 0) then
							SobGroup_TakeDamage(specialabilities.combos[x][3], specialabilities.combos[x][2])
							specialabilities.combos[x][7] = specialabilities.combos[x][7] + (0.01 * numaffected)
						end
						SobGroup_Clear("TempGroup_BlowOut")
					else
						if (specialabilities.combos[x][5] == 1) then
							-- print("Done blowing out - dump the crap")
							if (specialabilities.combos[x][7] >= 0.5) then
								-- print("Running super Blow Out")
								-- fully powered, blow out and deal damage again
								SobGroup_Create("TempGroup_BlowOutLast")
								FX_StartEvent( specialabilities.combos[x][6], "BlowOut_Max" )
								SobGroup_FillProximitySobGroup("TempGroup_BlowOutLast", "AllShips", specialabilities.combos[x][6], specialabilities.combos[x][4])
								SobGroup_FillSubstract(specialabilities.combos[x][3], "TempGroup_BlowOutLast", specialabilities.combos[x][6])
								SobGroup_TakeDamage(specialabilities.combos[x][3], specialabilities.combos[x][2])
								SobGroup_Clear("TempGroup_BlowOutLast")
							end
							if (specialabilities.combos[x][7] > 0.3) then
								specialabilities.combos[x][7] = 0.3
							end
							SobGroup_SetHealth_Smart(specialabilities.combos[x][6], SobGroup_HealthPercentage(specialabilities.combos[x][6]) + specialabilities.combos[x][7])
							SobGroup_Clear(specialabilities.combos[x][3])
							specialabilities.combos[x][5] = 0
							specialabilities.combos[x][7] = 0
						end
					end
				end
				if (specialabilities.combos[x][1] == PHASE_DRAIN) then
					if (SobGroup_IsDoingAbility(specialabilities.combos[x][6], AB_Capture) == 1) then
						if (specialabilities.combos[x][5] == 0) then
							--print("determine drain target")
							SobGroup_Create("PossibleDrainTarget_SOB")
							SobGroup_Create("PossibleDrainTarget_SOB_2")
							SobGroup_Create("DrainService")							
							SobGroup_FillProximitySobGroup("PossibleDrainTarget_SOB", "AllShips", specialabilities.combos[x][6], 3000)
							SobGroup_GetSobGroupBeingCapturedGroup("PossibleDrainTarget_SOB", "PossibleDrainTarget_SOB_2")
							SobGroup_SplitGroupReference("PossibleDrainTarget_SOB_3", "PossibleDrainTarget_SOB_2", "AllShips", SobGroup_Count("PossibleDrainTarget_SOB_2"))
							for incrementor = 0, SobGroup_Count("PossibleDrainTarget_SOB_2") - 1, 1 do
								SobGroup_GetSobGroupCapturingGroup("PossibleDrainTarget_SOB_3".. incrementor, "DrainService")
								if (SobGroup_GroupInGroup("DrainService", specialabilities.combos[x][6]) == 1) then
								--print("Found the target to drain")
									specialabilities.combos[x][5] = 1
									SobGroup_SobGroupAdd(specialabilities.combos[x][3], "PossibleDrainTarget_SOB_3".. incrementor)	
									SobGroup_TakeDamage(specialabilities.combos[x][3], specialabilities.combos[x][2])
									Player_SetRU(specialabilities.combos[x][7], Player_GetRU(specialabilities.combos[x][7]) + specialabilities.combos[x][4])
								end
							end
							SobGroup_Clear("PossibleDrainTarget_SOB")
							SobGroup_Clear("PossibleDrainTarget_SOB_2")
							SobGroup_Clear("DrainService")
						else
							--print("do drain target")
							SobGroup_TakeDamage(specialabilities.combos[x][3], specialabilities.combos[x][2])
							Player_SetRU(specialabilities.combos[x][7], Player_GetRU(specialabilities.combos[x][7]) + specialabilities.combos[x][4])
						end
					else
						if (specialabilities.combos[x][5] == 1) then
							--print("no longer draining, dump it")
							SobGroup_Clear(specialabilities.combos[x][3])
							specialabilities.combos[x][5] = 0
						end
					end
				end
			else
			specialabilities.combos[x][0] = 1
			SobGroup_Clear(specialabilities.combos[x][6])
			end
		end
	end
end

-- drones that can combine
DronesList = {"kpr_attackdroid", "kpr_interceptor_old"}
-- what it does when combining with itself
SelfCombos = {"kpr_attackdroid_combo", "kpr_interceptor_combo"}
-- the alt combo (there should be more of these but yeah... 
AltCombos = {"kpr_attackdroid_agitator"}	--, "IAMATEXT"

function spawnDrones(playerIndex)
	SobGroup_Create("KeeperSpawnShips_Global_SOB")
	Update_AllShips()
	cleanSapwnTable()
	local i = 0
	repeat
		i = i + 1
		SobGroup_Create("Shifters_SOB")
		Player_FillShipsByType("Shifters_SOB", playerIndex, DronesList[i])
		local numshifters = SobGroup_Count("Shifters_SOB")
		-- moved up here to save processing for every ship
		SobGroup_SetAutoLaunch("Shifters_SOB", ShipHoldStayDockedAlways)
		
		if (numshifters > 0) then
			numshifters = SobGroup_SplitGroupReference("Shifter_Single", "Shifters_SOB", "AllShips", numshifters )
			for counter = 0, numshifters -1, 1 do
				SobGroup_Create("TempDock")
				SobGroup_Clear("TempDock")
				SobGroup_GetSobGroupDockedWithGroup("Shifter_Single"..counter, "TempDock")
				if (SobGroup_Count("TempDock") > 0) then
					if ((SobGroup_GroupInGroup("Shifter_Single"..counter, "KeeperSpawnShips_Global_SOB") ~= 1) and (SobGroup_GroupInGroup("TempDock", "KeeperSpawnShips_Global_SOB") ~= 1)) then
						-- -- print("Clear to Spawn Ship. Num ships = ".. dronecombos.num)
						SobGroup_SobGroupAdd("KeeperSpawnShips_Global_SOB", "Shifter_Single".. counter)	
						SobGroup_SobGroupAdd("KeeperSpawnShips_Global_SOB", "TempDock")	
						local position = SobGroup_GetPosition("Shifter_Single".. counter)
						Volume_AddSphere("shiftervol".. dronecombos.num, position, 10)
						spawntype = "NONE"
						-- check ship type over function (I hate code)
						if (compareships("TempDock", DronesList[i], playerIndex) == 1) then
							spawntype = SelfCombos[i]
						else
							spawntype = AltCombos[i]
						end
						SobGroup_Create("Main_Link".. dronecombos.num)
						SobGroup_SobGroupAdd("Main_Link".. dronecombos.num, "Shifter_Single".. counter)	
						SobGroup_Create("Alt_Link".. dronecombos.num)
						SobGroup_SobGroupAdd("Alt_Link".. dronecombos.num, "TempDock")	
						-- template is: volume, spawntype, host ship, docked ship, is spawned, player index
						local currentcombo = {}
						currentcombo[0] = "shiftervol".. dronecombos.num
						currentcombo[1] = spawntype
						currentcombo[2] = "Main_Link".. dronecombos.num
						currentcombo[3] = "Alt_Link".. dronecombos.num
						currentcombo[4] = 1
						currentcombo[5] = playerIndex
						dronecombos.combos[dronecombos.num] = currentcombo
						-- -- print(dronecombos.combos[dronecombos.num][0])
						dronecombos.num = dronecombos.num + 1	
					end
				end
				SobGroup_Clear("TempDock")
			end
		end
	until (not DronesList[i + 1])
	
end

-- spawns drones from queue set up by spawnDrones. 
-- requires a player index
function spawnDronesFromQueue(playerIndex)
	local spawned = 0
	for x = 0, dronecombos.num -1, 1 do
		-- -- print("Processing Spawn. Num:".. x)
		-- avoid operprocessing (2 spawns per cycle seem to work... odd)
		if (spawned == 2)  then
			break
		end
		if (dronecombos.combos[x][5] == playerIndex) then
			if (dronecombos.combos[x][4] == 1) then
				-- -- print("Doing Spawn for: ".. dronecombos.combos[x][0])
				SobGroup_Create("Currentspawn")
					--health is often more than 1 due to new exp func
				SobGroup_SetHealth(dronecombos.combos[x][3], 0)		--SobGroup_TakeDamage(dronecombos.combos[x][3], 1)
				FX_StopEvent(dronecombos.combos[x][3], "Death")
				SobGroup_SpawnNewShipInSobGroup(playerIndex, dronecombos.combos[x][1], "Currentspawn", "Currentspawn", dronecombos.combos[x][0])
				SobGroup_ParadeSobGroup("Currentspawn", dronecombos.combos[x][2], 2)
				SobGroup_SetHealth(dronecombos.combos[x][2], 0)		--SobGroup_TakeDamage(dronecombos.combos[x][2], 1)
				FX_StopEvent(dronecombos.combos[x][2], "Death")
				SobGroup_SetMadState("Currentspawn", "Launched")
				SobGroup_Clear("Currentspawn")
				Volume_Delete(dronecombos.combos[x][0])
				dronecombos.combos[x][4] = 0
				dronecombos.combos[x] = dronecombos.combos[x]
				spawned = spawned + 1
			end	
		end
	end
end

-- cleans SFTable 
function cleanSFTable()
	local num = specialabilities.num
	if num > 0 then
		for x = specialabilities.num - 1, 0, -1 do
			if (specialabilities.combos[x][0] == 1) then
				-- -- 
				if (specialabilities.combos[x][1] == PHASE_DRAIN) then
					--print("Special Ability table entry: " .. x)
					SobGroup_Clear(specialabilities.combos[x][3])
					SobGroup_Clear(specialabilities.combos[x][6])
				end
				for y = x, specialabilities.num - 2, 1 do
					specialabilities.combos[y] = specialabilities.combos[y + 1]
				end
				specialabilities.combos[specialabilities.num - 1] = nil
				num = num - 1
			end
		end
		specialabilities.num = num
	end
end

-- cleans the drone spawn table to avoid over-processing and allows reusing slots. 
function cleanSapwnTable()
	local num = dronecombos.num
	if num > 0 then
		for x = dronecombos.num - 1, 0, -1 do
			if (dronecombos.combos[x][4] == 0) then
				-- -- print("Clearing Drone table entry: " .. x)
				for y = x, dronecombos.num - 2, 1 do
					dronecombos.combos[y] = dronecombos.combos[y + 1]
				end
				dronecombos.combos[dronecombos.num - 1] = nil
				num = num - 1
			end
		end
		dronecombos.num = num
	end
end

function cleanTowTable()
	SobGroup_Create("TowedShipsSob")
	local num = movergroups.num
	-- -- print("Number of entries in table: " .. num)
	if num > 0 then
		for x = movergroups.num - 1, 0, -1 do
			if (movergroups.combos[x][4] == 1 or SobGroup_Count(movergroups.combos[x][3]) < 1) then
				--print("Clearing Mover table entry: " .. x)
				-- not sure this is needed but clean up just to be sure
				SobGroup_Create("TowedShipTMP")
				SobGroup_FillSubstract("TowedShipTMP","TowedShipsSob", movergroups.combos[x][2])
				SobGroup_Clear("TowedShipsSob")
				SobGroup_SobGroupAdd("TowedShipsSob", "TowedShipTMP")	
				-- stop movers (this is 3 sec after main ship stopped so no colliding 'should' happen)
				SobGroup_Stop(movergroups.combos[x][6], movergroups.combos[x][3])				
				-- reset ship speed - noeffect if dead
				SobGroup_SetMaxSpeedMultiplier(movergroups.combos[x][2], 1)
				-- delete volume (make really really sure we do this last - just in case we somehow miss something, the movers will move their cargo back here)
				SobGroup_Clear(movergroups.combos[x][2])
				SobGroup_Clear(movergroups.combos[x][3])
				Volume_Delete(movergroups.combos[x][0])
				for y = x, movergroups.num - 2, 1 do
					movergroups.combos[y] = movergroups.combos[y + 1]
				end
				movergroups.combos[movergroups.num - 1] = nil
				num = num - 1
			end
		end
		--print("Setting num entries to = ".. num)
		movergroups.num = num
	end
end

-- function for setting ship bonuses for the keepers
function shipbonusesKpr()
	local i = 0
	SobGroup_Create("Bonuses_SOB")
	repeat
		i = i + 1
		Update_AllShips()	
		SobGroup_FillShipsByType("Bonuses_SOB", "AllShips", keeperBonusShips[i])
		SobGroup_SetAutoLaunch("Bonuses_SOB", ShipHoldStayDockedAlways)	
		local countBonusShips = SobGroup_Count("Bonuses_SOB")
		SobGroup_SplitGroupReference("Bonus_Split", "Bonuses_SOB", "AllShips", countBonusShips )
		for x = 0, countBonusShips -1 , 1 do
			if (countBonusShips > 0) then
				SobGroup_Create("TempDockedGens_SOB")
				SobGroup_Clear("TempDockedGens_SOB")
				SobGroup_GetSobGroupDockedWithGroup("Bonus_Split".. x, "TempDockedGens_SOB")
				numgens = SobGroup_Count("TempDockedGens_SOB")
				-- reaver settings
				if (i == 1) then
					if  (numgens < 2) then
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_SuperLas", 1)
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_Triton1", 0)
					else
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_SuperLas", 0)
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_Triton1", 1)
					end
				-- harbinger settings
				elseif (i == 2) then
					if  (numgens < 2) then
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_Triton1", 1)
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_Triton2", 0)
					else
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_Triton1", 0)
						SobGroup_ChangePower("Bonus_Split".. x, "Weapon_Triton2", 1)
					end
				end
				SobGroup_Clear("TempDockedGens_SOB")
			end
		end
		SobGroup_Clear("Bonuses_SOB")
	until (not keeperBonusShips[i + 1])
end

-- is shiptype in checkgroup? Then return 1, else 0
-- should use this one more, I think
function compareships(checkgroup, shiptype, player)
	SobGroup_Create("comparison_SOB")
	Player_FillShipsByType("comparison_SOB", player, shiptype)
	if (SobGroup_GroupInGroup(checkgroup, "comparison_SOB") ==1) then
		return 1
	else
		return 0
	end
end

gardenshiptable = {"kad_destroyer", "kad_destroyer_real", "kad_custodian", "kad_needleship", "kad_snail", "kad_frig_ghost", "kad_multibeam", "kad_multibeam_new", "kad_multigun", "kad_podship"}

function BlessedGarden(playerIndex)
	--Update_AllShips()
	local i = 0
	SobGroup_Create("Kadeshi_Blessed_SOB")
	repeat
		i = i + 1
		SobGroup_Clear("Kadeshi_Blessed_SOB")
		local shiptype = gardenshiptable[i]
		Player_FillShipsByType("Kadeshi_Blessed_SOB", playerIndex, shiptype)
		local numships = SobGroup_SplitGroupReference("Single_KadBlessing_SOB", "Kadeshi_Blessed_SOB", "Player_Ships"..playerIndex, SobGroup_Count("Kadeshi_Blessed_SOB"))
		for counter = 0, numships -1, 1 do
			local hp = SobGroup_HealthPercentage("Single_KadBlessing_SOB"..counter)
			if hp > 0 and hp < 1 then
				if SobGroup_IsCloaked("Single_KadBlessing_SOB"..counter) == 1 then
					local heal = 0.03*(1-hp^0.1)+0.01
					SobGroup_SetHealth_Smart("Single_KadBlessing_SOB"..counter, hp+heal)
				end
			end
		end
	until (not gardenshiptable[i + 1])
end

function WillOfTheGarden(playerIndex)
	--Update_AllShips()
	SobGroup_Create("Kadeshi_DamageShare_SOB")
	SobGroup_Clear("Kadeshi_DamageShare_SOB")
	SobGroup_Create("Kadeshi_Frigate_SOB")
	-- MBF 
	Player_FillShipsByType("Kadeshi_Frigate_SOB", playerIndex, "kad_multibeam_new")
	local numFrigates = SobGroup_Count("Kadeshi_Frigate_SOB")
	SobGroup_SplitGroupReference("Single_KadFrigMultibeam_SOB", "Kadeshi_Frigate_SOB", "frigates"..playerIndex, numFrigates )
	for counter = 0, numFrigates -1, 1 do
		if SobGroup_Empty("Single_KadFrigMultibeam_SOB" .. counter) == 0 then
			if SobGroup_IsDoingAbility("Single_KadFrigMultibeam_SOB" .. counter, AB_DefenseField) == 1 and SobGroup_HealthPercentage("Single_KadFrigMultibeam_SOB" .. counter) > 0 then
				-- is doing the link thing
				SobGroup_SobGroupAdd("Kadeshi_DamageShare_SOB", "Single_KadFrigMultibeam_SOB"..counter)
			end
		end
	end
	-- MGF
	SobGroup_Clear("Kadeshi_Frigate_SOB")
	Player_FillShipsByType("Kadeshi_Frigate_SOB", playerIndex, "kad_multigun")
	local numFrigates = SobGroup_Count("Kadeshi_Frigate_SOB")
	SobGroup_SplitGroupReference("Single_KadFrigMultigun_SOB", "Kadeshi_Frigate_SOB", "frigates"..playerIndex, numFrigates )
	for counter = 0, numFrigates -1, 1 do
		if SobGroup_Empty("Single_KadFrigMultigun_SOB" .. counter) == 0 then
			if SobGroup_IsDoingAbility("Single_KadFrigMultigun_SOB" .. counter, AB_DefenseField) == 1 and SobGroup_HealthPercentage("Single_KadFrigMultigun_SOB" .. counter) > 0 then
				-- is doing the link thing
				SobGroup_SobGroupAdd("Kadeshi_DamageShare_SOB", "Single_KadFrigMultigun_SOB"..counter)
			end
		end
	end
	-- MFF
	SobGroup_Clear("Kadeshi_Frigate_SOB")
	Player_FillShipsByType("Kadeshi_Frigate_SOB", playerIndex, "kad_multibeam")
	local numFrigates = SobGroup_Count("Kadeshi_Frigate_SOB")
	SobGroup_SplitGroupReference("Single_KadFrigMultiflame_SOB", "Kadeshi_Frigate_SOB", "frigates"..playerIndex, numFrigates )
	for counter = 0, numFrigates -1, 1 do
		if SobGroup_Empty("Single_KadFrigMultiflame_SOB" .. counter) == 0 then
			if SobGroup_IsDoingAbility("Single_KadFrigMultiflame_SOB" .. counter, AB_DefenseField) == 1 and SobGroup_HealthPercentage("Single_KadFrigMultiflame_SOB" .. counter) > 0 then
				-- is doing the link thing
				SobGroup_SobGroupAdd("Kadeshi_DamageShare_SOB", "Single_KadFrigMultiflame_SOB"..counter)
			end
		end
	end
	-- EFFECT
	if(SobGroup_Count("Kadeshi_DamageShare_SOB") > 0 and SobGroup_HealthPercentage("Kadeshi_DamageShare_SOB") < 1)then
		-- are damaged and more than one so share dmg
		FX_StartEvent("Kadeshi_DamageShare_SOB", "ShareDmgFX" )
		SobGroup_SetHealth("Kadeshi_DamageShare_SOB", SobGroup_HealthPercentage("Kadeshi_DamageShare_SOB"))
	end
end

function RosegardenOfThorns(playerIndex)
	--Update_AllShips()
	SobGroup_Create("Kadeshi_Spirit_SOB")
	Player_FillShipsByType("Kadeshi_Spirit_SOB", playerIndex, "kad_nebuladrone")
	local numGenerators = SobGroup_Count("Kadeshi_Spirit_SOB")
	SobGroup_SplitGroupReference("Single_Spirit_SOB", "Kadeshi_Spirit_SOB", "Player_Ships"..playerIndex, numGenerators )
	for counter = 0, numGenerators -1, 1 do
		if SobGroup_IsCloaked("Single_Spirit_SOB"..counter) == 1 and SobGroup_IsDoingAbility("Single_Spirit_SOB".. counter, AB_Cloak) == 1 then
			local numerator = 0;
			while (numerator < Universe_PlayerCount()) do
				if (AreAllied(numerator, playerIndex) ~= 1) then
					SobGroup_Create("PossibleThorns_SOB")
					Player_FillProximitySobGroup("PossibleThorns_SOB", numerator, "Single_Spirit_SOB".. counter, 4000)
					if (SobGroup_Count("PossibleThorns_SOB") > 0) then
						FX_StartEvent_Smart("Single_Spirit_SOB"..counter, "DamageFX_Thorn" )
						if (Player_HasResearch(playerIndex, "TaintedGarden") == 1) then
							SobGroup_TakeDamage("PossibleThorns_SOB", 0.03)
						else
							SobGroup_TakeDamage("PossibleThorns_SOB", 0.01) 
						end	
					end
				end
				numerator = numerator + 1
			end
		end
	end
end

function GeneratingNebulaTemplar(playerIndex)
	--Update_AllShips()
	SobGroup_Create("Templar_Spirit_SOB")
	Player_FillShipsByType("Templar_Spirit_SOB", playerIndex, "kad_destroyer_real")
	local numGenerators = SobGroup_Count("Templar_Spirit_SOB")
	SobGroup_SplitGroupReference("Single_Templar_Spirit_SOB", "Templar_Spirit_SOB", "Player_Ships"..playerIndex, numGenerators )
	for counter = 0, numGenerators -1, 1 do
		if SobGroup_IsCloaked("Single_Templar_Spirit_SOB"..counter) == 1 and SobGroup_IsDoingAbility("Single_Templar_Spirit_SOB".. counter, AB_Cloak) == 1 then
			FX_StartEvent_Smart("Single_Templar_Spirit_SOB"..counter, "Nebula" )
			if Player_HasResearch(playerIndex, "GardenOfThorns_Templar") == 1 then
				local numerator = 0;
				while (numerator < Universe_PlayerCount()) do
					if (AreAllied(numerator, playerIndex) ~= 1) then
						SobGroup_Create("Templar_PossibleThorns_SOB")
						Player_FillProximitySobGroup("Templar_PossibleThorns_SOB", numerator, "Single_Templar_Spirit_SOB".. counter, 4000)
						if (SobGroup_Count("Templar_PossibleThorns_SOB") > 0) then
							FX_StartEvent_Smart("Single_Templar_Spirit_SOB"..counter, "DamageFX_Thorn" )
							if (Player_HasResearch(playerIndex, "TaintedGarden_Templar") == 1) then
								SobGroup_TakeDamage("Templar_PossibleThorns_SOB", 0.03)
							else
								SobGroup_TakeDamage("Templar_PossibleThorns_SOB", 0.01) 
							end	
						end
					end
					numerator = numerator + 1
				end
			end
		end
	end
end

-- Raider construct capital ships from scaffold
RadBuildtable = {"rad_scaffoldA", "rad_CruiserscaffoldA", "rad_destroyerscaffoldA", "rad_cruiser_queenscaffolda", "rad_scaffoldB", "rad_scudscaffolda"}
RadBuildtableShips = {"rad_carrier", "rad_cruiser", "rad_destroyer", "rad_cruiser_queen", "rad_carrier_black", "rad_scud"}

function RadConstructCapitalShips(playerIndex)
	SobGroup_Create("RaiderBuildShips_Global_SOB")
	--Update_AllShips()
	local cpuPlayer = 0
	if CPU_Exist_Smart(playerIndex) == 1 then
		cpuPlayer = 1
	end
	local i = 0
	repeat
		i = i + 1
		SobGroup_Create("BeingBuilt_SOB")
		SobGroup_Create("Compare_SOB")
		local buildtype = RadBuildtable[i]
		local createtype = RadBuildtableShips[i]
		
		Player_FillShipsByType("BeingBuilt_SOB", playerIndex, buildtype)
		
		local numsquadrons = SobGroup_Count("BeingBuilt_SOB")
		SobGroup_SplitGroupReference("ShipBuilding", "BeingBuilt_SOB", "Player_Ships"..playerIndex, numsquadrons )
		
		if (numsquadrons > 0) then
			SobGroup_Create("Resourcer_SOB")
			for counter = 0, numsquadrons -1, 1 do
				if SobGroup_IsDocked("ShipBuilding".. counter) == 0 and 
				SobGroup_AreAllInRealSpace("ShipBuilding"..counter) == 1 then
					local position = SobGroup_GetPosition("ShipBuilding".. counter)
					if (SobGroup_GroupInGroup("ShipBuilding".. counter, "RaiderBuildShips_Global_SOB") ~= 1) then
						SobGroup_SetHealth("ShipBuilding".. counter, 0.1)
						SobGroup_SobGroupAdd("RaiderBuildShips_Global_SOB", "ShipBuilding".. counter)	
						if (cpuPlayer == 1) then
							local gametime = Universe_GameTime()
							Volume_AddSphere("resvolume"..playerIndex..counter..gametime, position, 200)
							--SobGroup_Create("Resourcer_SOB")
							if SobGroup_OwnedBy("ShipBuilding".. counter) == playerIndex then
								SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_resourcecollector", "Resourcer_SOB", "Resourcer_SOB", "resvolume"..playerIndex..counter..gametime)
							end
							if SobGroup_Empty("Resourcer_SOB") == 0 then
								CPU_RemoveSobGroup(playerIndex, "Resourcer_SOB")
							end
							SobGroup_Create("ResourcerAllied_SOB"..playerIndex)
							SobGroup_Clear("ResourcerAllied_SOB"..playerIndex)
							SobGroup_FillCompare("ResourcerAllied_SOB"..playerIndex, "Resourcer_SOB", "AllToHelp"..playerIndex)
							if SobGroup_Empty("ResourcerAllied_SOB"..playerIndex) == 0 then
								SobGroup_RepairSobGroup("ResourcerAllied_SOB"..playerIndex, "RaiderBuildShips_Global_SOB")		--SobGroup_RepairSobGroup("Resourcer_SOB", "ShipBuilding".. counter)
							end
							Volume_Delete("resvolume"..playerIndex..counter..gametime)
						end
					elseif (SobGroup_HealthPercentage("ShipBuilding".. counter) < 1 and cpuPlayer == 1) then
						if (SobGroup_HealthPercentage("ShipBuilding".. counter) + 0.1 > 1) then
							SobGroup_SetHealth("ShipBuilding".. counter, 1)
						else
							SobGroup_SetHealth("ShipBuilding".. counter, SobGroup_HealthPercentage("ShipBuilding".. counter) + 0.1)
						end
						SobGroup_Create("ResourcerRepairing_SOB"..counter)
						SobGroup_Clear("ResourcerRepairing_SOB"..counter)
						SobGroup_GetSobGroupRepairingGroup("ShipBuilding".. counter, "ResourcerRepairing_SOB"..counter)
						SobGroup_Create("ResourcerAllied_SOB"..playerIndex)
						SobGroup_Clear("ResourcerAllied_SOB"..playerIndex)
						SobGroup_FillCompare("ResourcerAllied_SOB"..playerIndex, "Resourcer_SOB", "AllToHelp"..playerIndex)
						if SobGroup_Count("ResourcerRepairing_SOB"..counter) >= 4 and SobGroup_Count("ResourcerAllied_SOB"..playerIndex) > SobGroup_Count("ResourcerRepairing_SOB"..counter) then
							SobGroup_Create("ResourcerGoAway"..counter)
							SobGroup_Clear("ResourcerGoAway"..counter)
							SobGroup_FillSubstract("ResourcerGoAway"..counter, "ResourcerAllied_SOB"..playerIndex, "ResourcerRepairing_SOB"..counter)
							if SobGroup_Empty("ResourcerGoAway"..counter) == 0 then
								SobGroup_Resource(playerIndex, "ResourcerGoAway"..counter)
								CPU_AddSobGroup(playerIndex, "ResourcerGoAway"..counter)
							end
						end
					elseif (SobGroup_HealthPercentage("ShipBuilding".. counter) > 0.99) then		--==1
						FX_StopEvent("ShipBuilding".. counter, "Field")
						Volume_AddSphere("Buildvolume", position, 600)
						SobGroup_Create("Currentbuild")
						SobGroup_SpawnNewShipInSobGroup(playerIndex, createtype, "Currentbuild", "Currentbuild", "Buildvolume")
						SobGroup_ParadeSobGroup("Currentbuild", "ShipBuilding".. counter, 2)
						if (cpuPlayer == 1) then
							SobGroup_Create("ResourcerCol")
							SobGroup_Create("ResourcerCol2")
							Player_FillSobGroupInVolume("ResourcerCol", playerIndex, "Buildvolume")
							SobGroup_FillShipsByType( "ResourcerCol2", "ResourcerCol", "rad_resourcecollector" )
							if SobGroup_Empty("ResourcerCol2") == 0 then
								SobGroup_Resource(playerIndex, "ResourcerCol2")		--SobGroup_SetHealth("ResourcerCol2", 0)
								CPU_AddSobGroup(playerIndex, "ResourcerCol2")
							end
						end
						if Camera_IsFocused("ShipBuilding".. counter) == 1 then
							Camera_AltFocus("Currentbuild", 0)
						end
						if SobGroup_Selected("ShipBuilding".. counter) == 1 then
							SobGroup_SelectSobGroup("Currentbuild")
						end
						SobGroup_SetHealth("ShipBuilding".. counter, 0)
						Volume_Delete("Buildvolume")
						SobGroup_Clear("Currentbuild")
					end
				end
			end
		end
	until (not RadBuildtable[i + 1])
end

function RadCollectorsResume(playerIndex)
	--Update_AllShips()
	SobGroup_Create("Resourcer_SOB")
	SobGroup_Create("RadCollector_Idle"..playerIndex)
	SobGroup_Clear("RadCollector_Idle"..playerIndex)
	SobGroup_FillCompare("RadCollector_Idle"..playerIndex, "Resourcer_SOB", "rad_resourcecollector"..playerIndex)
	if SobGroup_Empty("RadCollector_Idle"..playerIndex) == 0 then
		local numships = SobGroup_SplitGroupReference("SingleRadCollector_SOB", "RadCollector_Idle"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("RadCollector_Idle"..playerIndex))
		for i = 0, numships - 1, 1 do
			if SobGroup_Empty("SingleRadCollector_SOB"..i) == 0 then
				if SobGroup_IsDoingAbility("SingleRadCollector_SOB"..i, AB_Harvest)	+	
				SobGroup_IsDoingAbility("SingleRadCollector_SOB"..i, AB_Salvage) +	
				SobGroup_IsDoingAbility("SingleRadCollector_SOB"..i, AB_Move) +	
				SobGroup_IsDoingAbility("SingleRadCollector_SOB"..i, AB_Dock) +	SobGroup_IsDocked("SingleRadCollector_SOB"..i) + 
				SobGroup_IsDoingAbility("SingleRadCollector_SOB"..i, AB_Parade) +
				SobGroup_IsDoingAbility("SingleRadCollector_SOB"..i, AB_Repair) == 0 then
					SobGroup_Resource(playerIndex, "SingleRadCollector_SOB"..i)
					CPU_AddSobGroup(playerIndex, "SingleRadCollector_SOB"..i)
				end
			end
		end
	end
end

function AI_RepairHulks(playerIndex, collector_SOB)
	local playerIndexList = playerIndex + 1
	local radius = 2000+3000*CPULODvalueList[playerIndexList]
	SobGroup_Create("CollectorsRepairingHulks_SOB"..playerIndex)
	--resume AI for used collectors
	if SobGroup_Empty("CollectorsRepairingHulks_SOB"..playerIndex) == 0 then
		local numrepairers = SobGroup_SplitGroupReference("SingleUsedCollector_SOB", "CollectorsRepairingHulks_SOB"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("CollectorsRepairingHulks_SOB"..playerIndex))
		for i=0, numrepairers-1, 1 do
			local repairer = "SingleUsedCollector_SOB"..i
			if (SobGroup_HealthPercentage(repairer) < 0.15 or SobGroup_IsDoingAbility(repairer, AB_Repair) == 0) and 
			SobGroup_SobGroupCompare("haxor_all_shipswithoutai", repairer) == 0 then
				CPU_AddSobGroup(playerIndex, repairer)
				SobGroup_SobGroupSubstract("CollectorsRepairingHulks_SOB"..playerIndex, repairer)
			end
		end
	end
	--send new collectors to repair hulks
	if SobGroup_Empty("shipwreckallies"..playerIndex) == 0 then
		local numwrecks = SobGroup_SplitGroupReference("SingleAlliedWreck_SOB", "shipwreckallies"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("shipwreckallies"..playerIndex))
		for i=0, numwrecks-1, 1 do
			local wreck = "SingleAlliedWreck_SOB"..i
			if SobGroup_HealthPercentage(wreck) > 0 and 
			SobGroup_HealthPercentage(wreck) < 1 and 
			SobGroup_CountRepairers(wreck) == 0 and 
			SobGroup_AreAllInRealSpace(wreck) == 1 and 
			SobGroup_FillProximitySobGroup("temp", collector_SOB, wreck, radius) == 1 then
				local numrepairers = SobGroup_SplitGroupReference("SingleRepairCollector_SOB", "temp", wreck, SobGroup_Count("temp"))
				local sent_count = 0
				for z=0, numrepairers-1, 1 do
					local repairer = "SingleRepairCollector_SOB"..z
					if SobGroup_IsDoingAbility(repairer, AB_Repair) == 0 and 
					SobGroup_HealthPercentage(repairer) > 0.35 and 
					SobGroup_IsDoingAbility(repairer, AB_Dock) == 0 and 
					SobGroup_IsDocked(repairer) == 0 and 
					SobGroup_AreAllInRealSpace(repairer) == 1 and 
					SobGroup_SobGroupCompare("haxor_all_shipswithoutai", repairer) == 0 then
						CPU_RemoveSobGroup(playerIndex, repairer)
						SobGroup_RepairSobGroup(repairer, wreck)
						SobGroup_SobGroupAdd("CollectorsRepairingHulks_SOB"..playerIndex, repairer)
						sent_count = sent_count + 1
						if sent_count >= CPULODvalueList[playerIndexList] then
							break	--do not send too many collectors to repair the same hulk at one time
						end
					end
				end
			end
		end
	end
end

function SalvageSimpleForcedStop(ship, action)
	if action == 0 then
		SobGroup_SetSpeed(ship, 0)
		--SobGroup_SetMaxSpeedMultiplier(ship, 0)
		SobGroup_AbilityActivate(ship, AB_Move, 0)
		SobGroup_AbilityActivate(ship, AB_Steering, 0)
		SobGroup_ManualEngineGlow(ship, 0)
	elseif action == 1 then
		SobGroup_AbilityActivate(ship, AB_Move, 1)
		SobGroup_AbilityActivate(ship, AB_Steering, 1)
		SobGroup_SetSpeed(ship, 1)
		--SobGroup_SetMaxSpeedMultiplier(ship, 1)
		SobGroup_AutoEngineGlow(ship)
	end
end

-- AI salvage docking debug
HgnSalvageDockers = {"hgn_mothership", "hgn_scaver", "hgn_carrier", "hgn_battlecarrier", "hgn_shipyard", "hgn_ark", "hgn_commandfortress"}

function HgnSalvageForcedStop(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		local radius = 600
		if i >= 7 then
			radius = 1500
		elseif i >= 5 then
			radius = 1500
		end
		SobGroup_Create("HgnSalvageDocker_Total")
		Player_FillShipsByType("HgnSalvageDocker_Total", playerIndex, HgnSalvageDockers[i])
		local numships = SobGroup_SplitGroupReference("SingleDebugHgnSalvage_SOB", "HgnSalvageDocker_Total", "productioncapital"..playerIndex, SobGroup_Count("HgnSalvageDocker_Total"))
		for counter = 0, numships - 1, 1 do
			local breaker = 0
			local allspeed = 0
			if SobGroup_UnderAttack("SingleDebugHgnSalvage_SOB"..counter) == 0 and SobGroup_IsDoingAbility("SingleDebugHgnSalvage_SOB"..counter, AB_Attack) == 0 and SobGroup_IsDoingAbility("SingleDebugHgnSalvage_SOB"..counter, AB_Parade) == 0 then
				if SobGroup_FillProximitySobGroup("temp", "hgn_resourcecollector"..playerIndex, "SingleDebugHgnSalvage_SOB".. counter, radius) == 1 then
		      local numcollectors = SobGroup_SplitGroupReference("HgnSingleCollector_SOB", "temp", "hgn_resourcecollector"..playerIndex, SobGroup_Count("temp"))
		      local z = 0
					while z < numcollectors do			--check if there is any salvage activity nearby
						if SobGroup_IsDoingAbility("HgnSingleCollector_SOB"..z, AB_Dock) == 1 and SobGroup_IsDocked("HgnSingleCollector_SOB"..z)==0 and SobGroup_IsDoingAbility("HgnSingleCollector_SOB"..z, AB_Harvest) == 0 then
							breaker = breaker + 1
							allspeed = allspeed + SobGroup_GetSpeed("HgnSingleCollector_SOB"..z)
						end
						z = z + 1
					end
				end
			end
			allspeed = floor(allspeed + SobGroup_GetSpeed("SingleDebugHgnSalvage_SOB"..counter))
			--print("Salvage debug is running for "..HgnSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", breaker = "..breaker)
			if breaker >= 1 and allspeed ~= 0 then
				if SobGroup_CanDoAbility("SingleDebugHgnSalvage_SOB"..counter, AB_Steering) == 1 then
					SalvageSimpleForcedStop("SingleDebugHgnSalvage_SOB"..counter, 0)
					--print("Salvage debug activated for "..HgnSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
				elseif random_pseudo(0,30) == 30 then
					SalvageSimpleForcedStop("SingleDebugHgnSalvage_SOB"..counter, 1)
				end
			else
				if SobGroup_CanDoAbility("SingleDebugHgnSalvage_SOB"..counter, AB_Move) == 0 or SobGroup_CanDoAbility("SingleDebugHgnSalvage_SOB"..counter, AB_Steering) == 0 then
					SalvageSimpleForcedStop("SingleDebugHgnSalvage_SOB"..counter, 1)
					--print("Salvage debug DEactivated for "..HgnSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
				end
			end
		end
	until (not HgnSalvageDockers[i + 1])
end

VgrSalvageDockers = {"vgr_battlecarrier", "vgr_carrier", "vgr_scaver", "vgr_mothership", "vgr_shipyard", "vgr_commandfortress"}

function VgrSalvageForcedStop(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		local radius = 800
		if i >= 6 then
			radius = 3000
		elseif i >= 4 then
			radius = 1000
		end
		SobGroup_Create("VgrSalvageDocker_Total")
		Player_FillShipsByType("VgrSalvageDocker_Total", playerIndex, VgrSalvageDockers[i])
		local numships = SobGroup_SplitGroupReference("SingleDebugVgrSalvage_SOB", "VgrSalvageDocker_Total", "productioncapital"..playerIndex, SobGroup_Count("VgrSalvageDocker_Total"))
		for counter = 0, numships - 1, 1 do
			local breaker = 0
			local allspeed = 0
			if SobGroup_UnderAttack("SingleDebugVgrSalvage_SOB"..counter) == 0 and SobGroup_IsDoingAbility("SingleDebugVgrSalvage_SOB"..counter, AB_Attack) == 0 and SobGroup_IsDoingAbility("SingleDebugVgrSalvage_SOB"..counter, AB_Parade) == 0 then
				if SobGroup_FillProximitySobGroup("temp", "vgr_resourcecollector"..playerIndex, "SingleDebugVgrSalvage_SOB".. counter, radius) == 1 then
		      local numcollectors = SobGroup_SplitGroupReference("VgrSingleCollector_SOB", "temp", "vgr_resourcecollector"..playerIndex, SobGroup_Count("temp"))
		      local z = 0
					while z < numcollectors do			--check if there is any salvage activity nearby
						if SobGroup_IsDoingAbility("VgrSingleCollector_SOB"..z, AB_Dock) == 1 and SobGroup_IsDocked("VgrSingleCollector_SOB"..z)==0 and SobGroup_IsDoingAbility("VgrSingleCollector_SOB"..z, AB_Harvest) == 0 then
							breaker = breaker + 1
							allspeed = allspeed + SobGroup_GetSpeed("VgrSingleCollector_SOB"..z)
						end
						z = z + 1
					end
				end
			end
			allspeed = floor(allspeed + SobGroup_GetSpeed("SingleDebugVgrSalvage_SOB"..counter))
			--print("Salvage debug is running for "..VgrSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", breaker = "..breaker)
			if breaker >= 1 and allspeed ~= 0 then
				if SobGroup_CanDoAbility("SingleDebugVgrSalvage_SOB"..counter, AB_Steering) == 1 then
					SalvageSimpleForcedStop("SingleDebugVgrSalvage_SOB"..counter, 0)
					--print("Salvage debug activated for "..VgrSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
				elseif random_pseudo(0,30) == 30 then
					SalvageSimpleForcedStop("SingleDebugVgrSalvage_SOB"..counter, 1)
				end
			else
				if SobGroup_CanDoAbility("SingleDebugVgrSalvage_SOB"..counter, AB_Move) == 0 or SobGroup_CanDoAbility("SingleDebugVgrSalvage_SOB"..counter, AB_Steering) == 0 then
					SalvageSimpleForcedStop("SingleDebugVgrSalvage_SOB"..counter, 1)
					--print("Salvage debug DEactivated for "..VgrSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
				end
			end
		end
	until (not VgrSalvageDockers[i + 1])
end

function KadSalvageForcedStop(playerIndex)
	local radius = 3000
	local numships = SobGroup_SplitGroupReference("SingleDebugKadSalvage_SOB", "kad_needleship"..playerIndex, "kad_needleship"..playerIndex, SobGroup_Count("kad_needleship"..playerIndex))
	for counter = 0, numships - 1, 1 do
		local breaker = 0
		local allspeed = 0
		if SobGroup_UnderAttack("SingleDebugKadSalvage_SOB"..counter) == 0 and SobGroup_IsDoingAbility("SingleDebugKadSalvage_SOB"..counter, AB_Attack) == 0 and SobGroup_IsDoingAbility("SingleDebugKadSalvage_SOB"..counter, AB_Parade) == 0 then
			if SobGroup_FillProximitySobGroup("temp", "kad_ressourcecollector"..playerIndex, "SingleDebugKadSalvage_SOB".. counter, radius) == 1 then
	      local numcollectors = SobGroup_SplitGroupReference("KadSingleCollector_SOB", "temp", "kad_ressourcecollector"..playerIndex, SobGroup_Count("temp"))
	      local z = 0
				while z < numcollectors do			--check if there is any salvage activity nearby
					if SobGroup_IsDoingAbility("KadSingleCollector_SOB"..z, AB_Dock) == 1 and SobGroup_IsDocked("KadSingleCollector_SOB"..z)==0 and SobGroup_IsDoingAbility("KadSingleCollector_SOB"..z, AB_Harvest) == 0 then
						breaker = breaker + 1
						allspeed = allspeed + SobGroup_GetSpeed("KadSingleCollector_SOB"..z)
					end
					z = z + 1
				end
			end
		end
		allspeed = floor(allspeed + SobGroup_GetSpeed("SingleDebugKadSalvage_SOB"..counter))
		--print("Salvage debug is running for "..KadSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", breaker = "..breaker)
		if breaker >= 1 and allspeed ~= 0 then
			if SobGroup_CanDoAbility("SingleDebugKadSalvage_SOB"..counter, AB_Steering) == 1 then
				SalvageSimpleForcedStop("SingleDebugKadSalvage_SOB"..counter, 0)
				--print("Salvage debug activated for "..KadSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
			elseif random_pseudo(0,30) == 30 then
				SalvageSimpleForcedStop("SingleDebugKadSalvage_SOB"..counter, 1)
			end
		else
			if SobGroup_CanDoAbility("SingleDebugKadSalvage_SOB"..counter, AB_Move) == 0 or SobGroup_CanDoAbility("SingleDebugKadSalvage_SOB"..counter, AB_Steering) == 0 then
				SalvageSimpleForcedStop("SingleDebugKadSalvage_SOB"..counter, 1)
				--print("Salvage debug DEactivated for "..KadSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
			end
		end
	end
end

RadSalvageDockers = {"rad_carrier", "rad_carrier_black"}

function RadSalvageForcedStop(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		local radius = 1000
		SobGroup_Create("RadSalvageDocker_Total")
		Player_FillShipsByType("RadSalvageDocker_Total", playerIndex, RadSalvageDockers[i])
		local numships = SobGroup_SplitGroupReference("SingleDebugRadSalvage_SOB", "RadSalvageDocker_Total", "productioncapital"..playerIndex, SobGroup_Count("RadSalvageDocker_Total"))
		for counter = 0, numships - 1, 1 do
			local breaker = 0
			local allspeed = 0
			if SobGroup_UnderAttack("SingleDebugRadSalvage_SOB"..counter) == 0 and SobGroup_IsDoingAbility("SingleDebugRadSalvage_SOB"..counter, AB_Attack) == 0 and SobGroup_IsDoingAbility("SingleDebugRadSalvage_SOB"..counter, AB_Parade) == 0 then
				if SobGroup_FillProximitySobGroup("temp", "rad_resourcecollector"..playerIndex, "SingleDebugRadSalvage_SOB".. counter, radius) == 1 then
		      local numcollectors = SobGroup_SplitGroupReference("RadSingleCollector_SOB", "temp", "rad_resourcecollector"..playerIndex, SobGroup_Count("temp"))
		      local z = 0
					while z < numcollectors do			--check if there is any salvage activity nearby
						if SobGroup_IsDoingAbility("RadSingleCollector_SOB"..z, AB_Dock) == 1 and SobGroup_IsDocked("RadSingleCollector_SOB"..z)==0 and SobGroup_IsDoingAbility("RadSingleCollector_SOB"..z, AB_Harvest) == 0 then
							breaker = breaker + 1
							allspeed = allspeed + SobGroup_GetSpeed("RadSingleCollector_SOB"..z)
						end
						z = z + 1
					end
				end
			end
			allspeed = floor(allspeed + SobGroup_GetSpeed("SingleDebugRadSalvage_SOB"..counter))
			--print("Salvage debug is running for "..RadSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", breaker = "..breaker)
			if breaker >= 1 and allspeed ~= 0 then
				if SobGroup_CanDoAbility("SingleDebugRadSalvage_SOB"..counter, AB_Steering) == 1 then
					SalvageSimpleForcedStop("SingleDebugRadSalvage_SOB"..counter, 0)
					--print("Salvage debug activated for "..RadSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
				elseif random_pseudo(0,30) == 30 then
					SalvageSimpleForcedStop("SingleDebugRadSalvage_SOB"..counter, 1)
				end
			else
				if SobGroup_CanDoAbility("SingleDebugRadSalvage_SOB"..counter, AB_Move) == 0 or SobGroup_CanDoAbility("SingleDebugRadSalvage_SOB"..counter, AB_Steering) == 0 then
					SalvageSimpleForcedStop("SingleDebugRadSalvage_SOB"..counter, 1)
					--print("Salvage debug DEactivated for "..RadSalvageDockers[i]..counter.." owned by player index: "..playerIndex..", game year: "..year)
				end
			end
		end
	until (not RadSalvageDockers[i + 1])
end

function ArmourUpgradeHgnDestroyer(playerIndex)
	local numships = SobGroup_SplitGroupReference("SingleUpgradeHgnDestroyer_SOB", "hgn_ALLdestroyers"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("hgn_ALLdestroyers"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if SobGroup_GetHardPointHealth("SingleUpgradeHgnDestroyer_SOB" .. counter, "Generic1") == 0 and SobGroup_HealthPercentage("SingleUpgradeHgnDestroyer_SOB".. counter) > 0 then
			SobGroup_AbilityActivate("SingleUpgradeHgnDestroyer_SOB".. counter, AB_Builder, 1)
			SobGroup_CreateSubSystem("SingleUpgradeHgnDestroyer_SOB".. counter, "destroyer_armour")
			--SobGroup_AbilityActivate("SingleUpgradeHgnDestroyer_SOB".. counter, AB_Builder, 0)
		end
	end
end

function ECMUpgradeHgnDestroyer(playerIndex)
	local numships = SobGroup_SplitGroupReference("SingleUpgradeHgnDestroyer_SOB", "hgn_ALLdestroyers"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("hgn_ALLdestroyers"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if SobGroup_HealthPercentage("SingleUpgradeHgnDestroyer_SOB".. counter) > 0 then
			if SobGroup_IsDoingAbility("SingleUpgradeHgnDestroyer_SOB" .. counter, AB_DefenseField) == 1 then
				CreateSubsystemOnShipHardpoint_Smart("SingleUpgradeHgnDestroyer_SOB".. counter, "ECM", "destroyer_ecm_dummy")
				FX_StartEvent_Smart("SingleUpgradeHgnDestroyer_SOB"..counter, "ECM_FX" )
				--fake targets
				local ship = "SingleUpgradeHgnDestroyer_SOB".. counter
				local pos = SobGroup_GetPosition(ship)
				local coord = {0, 0, 0}
				local theta = random_pseudo(-90,90)
				local beta = random_pseudo(0,360)
				local num = 0
				local burst_count = 2
				if Player_HasResearch(playerIndex, "ImprovedDestroyerECM" ) == 1 then
					burst_count = 3
				end
				local proximity_count = SobGroup_CountProximitySobGroup(ship, 6000, "hgn_dummy"..playerIndex)	--performance saving
				if proximity_count > 20 then
					burst_count = 0
				elseif proximity_count > 10 then
					burst_count = 1
				end
				while num < burst_count do
	        theta = random_pseudo(-90,90)
					beta = random_pseudo(0,360)
					local radius = random_pseudo(1000,4000)
					if Player_HasResearch(playerIndex, "ImprovedDestroyerECMRange" ) == 1 then
						radius = radius * 1.5
					end
					coord[1] = pos[1] + radius*cos(beta)
					coord[2] = pos[2] + radius*sin(theta)
					coord[3] = pos[3] + radius*sin(beta)
					SobGroup_Create("SOB_HgnDummyECM")
					SobGroup_Clear("SOB_HgnDummyECM")
					Volume_AddSphere("VOL_HgnDummyECM"..playerIndex.."_"..counter.."_"..num, coord, 10)
					SobGroup_SpawnNewShipInSobGroup(-1, "hgn_dummy_ecm", "hgn_ECM", "SOB_HgnDummyECM", "VOL_HgnDummyECM"..playerIndex.."_"..counter.."_"..num)
					SobGroup_SobGroupAdd("hgn_dummy"..playerIndex, "SOB_HgnDummyECM")
					SobGroup_GuardSobGroup("SOB_HgnDummyECM", ship)
					if SobGroup_UnderAttack(ship) == 1 and 
					random_pseudo(0, 1+numships) < 5 then	--anti-lag
						SobGroup_Create("Temp_EnemySob"..playerIndex)
						SobGroup_Clear("Temp_EnemySob"..playerIndex)
						SobGroup_GetAttackers(ship, "Temp_EnemySob"..playerIndex)
						SobGroup_SobGroupSubstract("Temp_EnemySob"..playerIndex, "ECM_immune")
						SobGroup_Attack_Smart(max(0,SobGroup_OwnedBy("Temp_EnemySob"..playerIndex)), "Temp_EnemySob"..playerIndex, "SOB_HgnDummyECM")
						SobGroup_Clear("Temp_EnemySob"..playerIndex)
					end
					if playerIndex ~= Universe_CurrentPlayer() and AreAllied(playerIndex, Universe_CurrentPlayer()) == 0 then
						Ping_LabelVisible(Ping_AddSobGroup("Sensor Anomaly", "juggernaught", "SOB_HgnDummyECM"), 1)
					end
					Volume_Delete("VOL_HgnDummyECM"..playerIndex.."_"..counter.."_"..num)
					num = num + 1
				end
			else
				RemoveSubsystemOnShip("SingleUpgradeHgnDestroyer_SOB".. counter, "ECM")
			end
		end
	end
end

function Hgn_KillDummyObjects(playerIndex)
	if SobGroup_Empty("hgn_dummy"..playerIndex) == 0 then
		Update_AllShips()
		local numships = SobGroup_SplitGroupReference("SingleKillDummyHgn_SOB", "hgn_dummy"..playerIndex, "hgn_dummy"..playerIndex, SobGroup_Count("hgn_dummy"..playerIndex))
		for counter = 0, numships - 1, 1 do
			if SobGroup_Empty("SingleKillDummyHgn_SOB"..counter) == 0 then
				local dummy = "SingleKillDummyHgn_SOB"..counter
				local damage = 0.2
				if numships > 20 then
					damage = damage*2
				elseif numships > 10 then
					damage = damage*1.5
				end
				if SobGroup_AreAnyOfTheseTypes(dummy, "hgn_dummy_ecm") == 1 then
					local radius = 4000
					if Player_HasResearch(playerIndex, "ImprovedDestroyerECMRange" ) == 1 then
						radius = radius * 1.5
					end
					if SobGroup_FillProximitySobGroupExceptSelf("SOB_ECMdestroyerGroup", "hgn_ALLdestroyers"..playerIndex, dummy, radius) == 1 then
						if SobGroup_IsDoingAbility("SOB_ECMdestroyerGroup", AB_DefenseField) == 1 then
							damage = random_pseudo(10,20)/100
						else
							damage = 1
						end
					else
						damage = 1
					end
					if random_pseudo(0, 1+SobGroup_Count("hgn_ALLdestroyers"..playerIndex)) < 5 then	--anti-lag
						if SobGroup_FillProximitySobGroupExceptSelf("SOB_ECMenemyGroup", "enemies"..playerIndex, dummy, radius) == 1 then
							SobGroup_SobGroupSubstract("SOB_ECMenemyGroup", "ECM_immune")
							if SobGroup_Empty("SOB_ECMenemyGroup") == 0 then
								SobGroup_Attack(max(0,SobGroup_OwnedBy("SOB_ECMenemyGroup")), "SOB_ECMenemyGroup", dummy)
								SobGroup_Attack(0, dummy, "SOB_ECMenemyGroup")	--this dummy object belongs to player -1
							end
						end
					end
				end
				SobGroup_SetHealth_Smart(dummy, SobGroup_HealthPercentage(dummy)-damage)		--SobGroup_TakeDamage(dummy, damage)
			end
		end
	end
end

function SmokeScreenVgrDestroyer(playerIndex)
	local numships = SobGroup_SplitGroupReference("SingleUpgradeVgrDestroyer_SOB", "vgr_ALLsmokers"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("vgr_ALLsmokers"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if SobGroup_HealthPercentage("SingleUpgradeVgrDestroyer_SOB".. counter) > 0 then
			if SobGroup_IsDoingAbility("SingleUpgradeVgrDestroyer_SOB" .. counter, AB_DefenseField) == 1 then
				--fake targets
				local ship = "SingleUpgradeVgrDestroyer_SOB".. counter
				local pos = SobGroup_GetPosition(ship)
				local coord = {0, 0, 0}
				local theta = random_pseudo(-90,90)
				local beta = random_pseudo(0,360)
				local num = 0
				local burst_count = 2
				local proximity_count = SobGroup_CountProximitySobGroup(ship, 6000, "vgr_dummy"..playerIndex)	--performance saving
				if proximity_count > 20 then
					burst_count = 0
				elseif proximity_count > 10 then
					burst_count = 1
				end
				while num < burst_count do
	        theta = random_pseudo(-90,90)
					beta = random_pseudo(0,360)
					local radius = random_pseudo(100,200)
					coord[1] = pos[1] + radius*cos(beta)
					coord[2] = pos[2] + radius*sin(theta)
					coord[3] = pos[3] + radius*sin(beta)
					SobGroup_Create("SOB_VgrDummySmoke")
					SobGroup_Clear("SOB_VgrDummySmoke")
					Volume_AddSphere("VOL_VgrDummySmoke"..playerIndex.."_"..counter.."_"..num, coord, 100)
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "vgr_dummy_smokescreen", "vgr_smokescreen", "SOB_VgrDummySmoke", "VOL_VgrDummySmoke"..playerIndex.."_"..counter.."_"..num)
					SobGroup_SobGroupAdd("vgr_dummy"..playerIndex, "SOB_VgrDummySmoke")
					FX_StartEvent("SOB_VgrDummySmoke", "launch")
					if Player_HasResearch(playerIndex, "CapitalSmokeScreen1" ) == 1 then
						SobGroup_SetHardPointHealth("SOB_VgrDummySmoke", "jammer", 1)
					else
						SobGroup_SetHardPointHealth("SOB_VgrDummySmoke", "jammer", 0)
					end
					SobGroup_GuardSobGroup("SOB_VgrDummySmoke", ship)
					SobGroup_SetMaxSpeedMultiplier("SOB_VgrDummySmoke", 1.0)
					if SobGroup_UnderAttack(ship) == 1 and 
					random_pseudo(0, 1+numships) < 5 then	--anti-lag
						SobGroup_Create("Temp_EnemySob"..playerIndex)
						SobGroup_Clear("Temp_EnemySob"..playerIndex)
						SobGroup_GetAttackers(ship, "Temp_EnemySob"..playerIndex)
						SobGroup_SobGroupSubstract("Temp_EnemySob"..playerIndex, "ECM_immune")
						SobGroup_Attack_Smart(max(0,SobGroup_OwnedBy("Temp_EnemySob"..playerIndex)), "Temp_EnemySob"..playerIndex, "SOB_VgrDummySmoke")
						SobGroup_Clear("Temp_EnemySob"..playerIndex)
					end
					if Player_HasResearch(playerIndex, "CapitalSmokeScreen1" ) == 1 then
						if playerIndex ~= Universe_CurrentPlayer() and AreAllied(playerIndex, Universe_CurrentPlayer()) == 0 then
							Ping_LabelVisible(Ping_AddSobGroup("Sensor Anomaly", "juggernaught", "SOB_VgrDummySmoke"), 1)
						end
					end
					Volume_Delete("VOL_VgrDummySmoke"..playerIndex.."_"..counter.."_"..num)
					num = num + 1
				end
			end
		end
	end
end

function Vgr_KillDummyObjects(playerIndex)
	if SobGroup_Empty("vgr_dummy"..playerIndex) == 0 then
		Update_AllShips()
		local numships = SobGroup_SplitGroupReference("SingleKillDummyVgr_SOB", "vgr_dummy"..playerIndex, "vgr_dummy"..playerIndex, SobGroup_Count("vgr_dummy"..playerIndex))
		for counter = 0, numships - 1, 1 do
			if SobGroup_Empty("SingleKillDummyVgr_SOB"..counter) == 0 then
				local dummy = "SingleKillDummyVgr_SOB"..counter
				local damage = 0.2
				local health = SobGroup_HealthPercentage(dummy)
				if SobGroup_AreAnyOfTheseTypes(dummy, "vgr_dummy_smokescreen") == 1 then
					damage = 0.02
					if numships > 20 then
						damage = damage*10
					elseif numships > 10 then
						damage = damage*2
					end
					if SobGroup_GetHardPointHealth(dummy, "launch") > 0 then
						SobGroup_SetHealth(dummy, 1)
						SobGroup_SetHardPointHealth(dummy, "launch", 0)
					elseif SobGroup_HealthPercentage(dummy) < 0.97 and SobGroup_GetHardPointHealth(dummy, "smoke") > 0 then
						FX_StartEvent(dummy, "smoke")
						SobGroup_SetMaxSpeedMultiplier(dummy, 0)
						SobGroup_SetHardPointHealth(dummy, "smoke", 0)
					end
					if Player_HasResearch(playerIndex, "CapitalSmokeScreen1" ) == 1 then
						SobGroup_SetHardPointHealth_Smart(dummy, "jammer", health)
					end
					local radius = 4000
					if random_pseudo(0, 1+SobGroup_Count("vgr_ALLsmokers"..playerIndex)) < 5 then	--anti-lag
						if SobGroup_FillProximitySobGroupExceptSelf("SOB_SmokeEnemyGroup", "enemies"..playerIndex, dummy, radius) == 1 then
							SobGroup_SobGroupSubstract("SOB_SmokeEnemyGroup", "ECM_immune")
							if SobGroup_Empty("SOB_SmokeEnemyGroup") == 0 then
								SobGroup_Attack(max(0,SobGroup_OwnedBy("SOB_SmokeEnemyGroup")), "SOB_SmokeEnemyGroup", dummy)
								SobGroup_Attack(playerIndex, dummy, "SOB_SmokeEnemyGroup")
							end
						end
					end
				end
				SobGroup_SetHealth_Smart(dummy, SobGroup_HealthPercentage(dummy)-damage)		--SobGroup_TakeDamage(dummy, damage)
			end
		end
	end
end

function ArmourUpgradeHgnTanker(playerIndex)
	SobGroup_Create("HgnTanker_Total")
	Player_FillShipsByType("HgnTanker_Total", playerIndex, "hgn_tanker")
	local numships = SobGroup_SplitGroupReference("SingleUpgradeHgnTanker_SOB", "HgnTanker_Total", "Player_Ships"..playerIndex, SobGroup_Count("HgnTanker_Total"))
	for counter = 0, numships - 1, 1 do
		if SobGroup_GetHardPointHealth("SingleUpgradeHgnTanker_SOB" .. counter, "armour") == 0 and SobGroup_HealthPercentage("SingleUpgradeHgnTanker_SOB".. counter) > 0 then
			if SobGroup_CanDoAbility("SingleUpgradeHgnTanker_SOB".. counter, AB_Builder) == 1 then
				SobGroup_CreateSubSystem("SingleUpgradeHgnTanker_SOB".. counter, "hgn_tanker_armour")
			end
		end
	end
end

function CreateTurretsRadRefDestroyer(playerIndex)
	SobGroup_Create("RadRef_Total")
	Player_FillShipsByType("RadRef_Total", playerIndex, "rad_refurbisheddestroyer")
	local numships = SobGroup_SplitGroupReference("SingleUpgradeRadRef_SOB", "RadRef_Total", "Player_Ships"..playerIndex, SobGroup_Count("RadRef_Total"))
	for counter = 0, numships - 1, 1 do
		if SobGroup_CanDoAbility("SingleUpgradeRadRef_SOB".. counter, AB_Builder) == 1 and SobGroup_HealthPercentage("SingleUpgradeRadRef_SOB".. counter) > 0 then
			for i=1, 6, 1 do
				if SobGroup_GetHardPointHealth("SingleUpgradeRadRef_SOB" .. counter, "Turret"..i) == 0 then
					if Player_HasResearch(playerIndex, "RefurbishedDestroyerGuns" ) == 1 then
						SobGroup_CreateSubSystem("SingleUpgradeRadRef_SOB".. counter, "rad_rd"..random_pseudo(1,4).."_"..i)
					else
						SobGroup_CreateSubSystem("SingleUpgradeRadRef_SOB".. counter, "rad_rd1_"..i)
					end
				end
			end
		end
	end
end

-- Restrict Build Options (Ark doesn't have launch point for Juggernaut)
HgnBuilderNew = {"hgn_ark", "hgn_battlestation"}

function Hgn_RestrictJuggernaughtBuildOptionOnShips(playerIndex)
	Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("HgnRestricted_Total")
		Player_FillShipsByType("HgnRestricted_Total", playerIndex, HgnBuilderNew[i])
		local numships = SobGroup_SplitGroupReference("SingleRestrictedHgn_SOB", "HgnRestricted_Total", "AllShips", SobGroup_Count("HgnRestricted_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_GetHardPointHealth("SingleRestrictedHgn_SOB" .. counter, "Production1") >0 then
				SobGroup_RestrictBuildOption("SingleRestrictedHgn_SOB".. counter, "hgn_juggernaught")
				SobGroup_RestrictBuildOption("SingleRestrictedHgn_SOB".. counter, "hgn_juggernaught1")
			end
		end
	until (not HgnBuilderNew[i + 1])
end

-- Vgr Frigate Auto Dock
Vgrfrigates = {"vgr_supportfrigate_laser", "vgr_supportfrigate", "vgr_longrangeartilleryfrigate", "vgr_infiltratorfrigate", "vgr_heavymissilefrigate", "vgr_empfrigate", "vgr_commandfrigate", "vgr_assaultfrigate", "vgr_artilleryfrigate", "vgr_advassaultfrigate"}

function DockVgrFrigate(playerIndex)
	local numMech = SobGroup_SplitGroupReference("MechToDockWith_SOB"..playerIndex.."_", "vgr_supportfrigatearmed"..playerIndex, "frigates", SobGroup_Count("vgr_supportfrigatearmed"..playerIndex))
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("VgrFrigate_Total")
		Player_FillShipsByType("VgrFrigate_Total", playerIndex, Vgrfrigates[i])
		local numships = SobGroup_SplitGroupReference("SingleDockVgrFrigate_SOB", "VgrFrigate_Total", "Player_Ships"..playerIndex, SobGroup_Count("VgrFrigate_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_HealthPercentage("SingleDockVgrFrigate_SOB" .. counter) < 0.75 and
			SobGroup_IsDoingAbility("SingleDockVgrFrigate_SOB" .. counter, AB_Attack) == 0 and
			SobGroup_IsDoingAbility("SingleDockVgrFrigate_SOB" .. counter, AB_Capture) == 0 and
			SobGroup_IsDoingAbility("SingleDockVgrFrigate_SOB" .. counter, AB_Dock) == 0 then
				for pointer = 0, numMech - 1, 1 do
					if SobGroup_FillProximitySobGroup("temp", "MechToDockWith_SOB"..playerIndex.."_"..pointer, "SingleDockVgrFrigate_SOB" .. counter, 10000) == 1 then
						--print(Vgrfrigates[i].." auto dock to vgr_supportfrigatearmed"..pointer.." owned by player index: "..playerIndex..", game year: "..year)
						SobGroup_DockSobGroup_Smart("SingleDockVgrFrigate_SOB".. counter, "temp")
					end
				end
			end
		end
	until (not Vgrfrigates[i + 1])
end

-- Vgr Capital and Frigate Auto Dock
VgrCapFri = {"vgr_supportfrigatearmed", "vgr_supportfrigate_laser", "vgr_supportfrigate", "vgr_longrangeartilleryfrigate", "vgr_infiltratorfrigate", "vgr_heavymissilefrigate", "vgr_empfrigate", "vgr_commandfrigate", "vgr_assaultfrigate", "vgr_artilleryfrigate", "vgr_advassaultfrigate", "vgr_carrier", "vgr_battlecarrier", "vgr_destroyer", "vgr_hammerhead", "vgr_pulsedestroyer", "vgr_am", "vgr_cruiser", "vgr_lightcruiser", "vgr_lightcruiser_gun", "vgr_artilleryship"}

function DockVgrCapFri(playerIndex)
	local numMecha = SobGroup_SplitGroupReference("MechaToDockWith_SOB"..playerIndex.."_", "vgr_heavycruiser"..playerIndex, "battlecruisers", SobGroup_Count("vgr_heavycruiser"..playerIndex))
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("VgrCapFri_Total")
		Player_FillShipsByType("VgrCapFri_Total", playerIndex, VgrCapFri[i])
		local numships = SobGroup_SplitGroupReference("SingleDockVgrCapFri_SOB", "VgrCapFri_Total", "Player_Ships"..playerIndex, SobGroup_Count("VgrCapFri_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_HealthPercentage("SingleDockVgrCapFri_SOB" .. counter) < 0.75 and
			SobGroup_IsDoingAbility("SingleDockVgrCapFri_SOB" .. counter, AB_Attack) == 0 and
			SobGroup_IsDoingAbility("SingleDockVgrCapFri_SOB" .. counter, AB_Capture) == 0 and
			SobGroup_IsDoingAbility("SingleDockVgrCapFri_SOB" .. counter, AB_Dock) == 0 then
				for pointer = 0, numMecha - 1, 1 do
					if SobGroup_GetHardPointHealth("MechaToDockWith_SOB"..playerIndex.."_"..pointer, "hgn_orders_mechanic") > 0 or CPU_Exist_Smart(playerIndex) == 1 then
						if SobGroup_FillProximitySobGroup("temp", "MechaToDockWith_SOB"..playerIndex.."_"..pointer, "SingleDockVgrCapFri_SOB" .. counter, 10000) == 1 then
							--print(VgrCapFri[i].." auto dock to vgr_heavycruiser"..pointer.." owned by player index: "..playerIndex..", game year: "..year)
							SobGroup_DockSobGroup_Smart("SingleDockVgrCapFri_SOB".. counter, "temp")
						end
					end
				end
			end
		end
	until (not VgrCapFri[i + 1])
end

-- Hgn Platform Auto Guard
Hgnplatforms = {"hgn_defenderdrone", "hgn_gunturret", "hgn_pulsarturret", "hgn_ionturret", "hgn_missileturret", "hgn_rts", "hgn_defensefieldturret", "hgn_sentinel", "hgn_ionsentinel", "hgn_artillerysentinel", "hgn_combatbase"}

function GuardHgnPlatform(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("HgnPlatform_Total")
		Player_FillShipsByType("HgnPlatform_Total", playerIndex, Hgnplatforms[i])
		local numships = SobGroup_SplitGroupReference("SingleGuardHgnPlatform_SOB", "HgnPlatform_Total", "Player_Ships"..playerIndex, SobGroup_Count("HgnPlatform_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_SobGroupCompare("SingleGuardHgnPlatform_SOB" .. counter, "SOB_PlayerWaves"..playerIndex) == 0 and 
			SobGroup_IsDoingAbility("SingleGuardHgnPlatform_SOB" .. counter, AB_Move) == 0 and
			SobGroup_IsDoingAbility("SingleGuardHgnPlatform_SOB" .. counter, AB_Guard) == 0 and
			SobGroup_IsDoingAbility("SingleGuardHgnPlatform_SOB" .. counter, AB_Dock) == 0 and
			SobGroup_UnderAttack("SingleGuardHgnPlatform_SOB" .. counter) == 0 then
				if SobGroup_Count("hgn_mothership"..playerIndex) > 0 and SobGroup_Count("hgn_shipyard"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "hgn_mothership"..playerIndex) > 12500 and SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "hgn_shipyard"..playerIndex) > 12500 then
						if SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "hgn_mothership"..playerIndex) < SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "hgn_shipyard"..playerIndex) then
							--print(Hgnplatforms[i].." is guarding the Mothership instead of Shipyard for player index: "..playerIndex..", game year: "..year)
							SobGroup_ParadeSobGroup("SingleGuardHgnPlatform_SOB".. counter, "hgn_mothership"..playerIndex, 0)
						else
							--print(Hgnplatforms[i].." is guarding the Shipyard instead of Mothership for player index: "..playerIndex..", game year: "..year)
							SobGroup_ParadeSobGroup("SingleGuardHgnPlatform_SOB".. counter, "hgn_shipyard"..playerIndex, 0)
						end
					end
				elseif SobGroup_Count("hgn_mothership"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "hgn_mothership"..playerIndex) > 12500 then
						--print(Hgnplatforms[i].." is guarding the Mothership for player index: "..playerIndex..", game year: "..year)
						SobGroup_ParadeSobGroup("SingleGuardHgnPlatform_SOB".. counter, "hgn_mothership"..playerIndex, 0)
					end
				elseif SobGroup_Count("hgn_shipyard"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "hgn_shipyard"..playerIndex) > 12500 then
						--print(Hgnplatforms[i].." is guarding the Shipyard for player index: "..playerIndex..", game year: "..year)
						SobGroup_ParadeSobGroup("SingleGuardHgnPlatform_SOB".. counter, "hgn_shipyard"..playerIndex, 0)
					end
				elseif SobGroup_Count("productioncapital"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardHgnPlatform_SOB" .. counter, "productioncapital"..playerIndex) > 12500 then
						--print(Hgnplatforms[i].." is guarding a Production Capital for player index: "..playerIndex..", game year: "..year)
						SobGroup_ParadeSobGroup("SingleGuardHgnPlatform_SOB".. counter, "productioncapital"..playerIndex, 0)
					end
				end
			end
		end
	until (not Hgnplatforms[i + 1])
end

-- Vgr Platform Auto Guard
Vgrplatforms = {"vgr_am", "vgr_weaponplatform_gun", "vgr_weaponplatform_lance", "vgr_weaponplatform_missile", "vgr_mobile_inhibitor", "vgr_cloakplatform"}

function GuardVgrPlatform(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("VgrPlatform_Total")
		Player_FillShipsByType("VgrPlatform_Total", playerIndex, Vgrplatforms[i])
		local numships = SobGroup_SplitGroupReference("SingleGuardVgrPlatform_SOB", "VgrPlatform_Total", "Player_Ships"..playerIndex, SobGroup_Count("VgrPlatform_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_SobGroupCompare("SingleGuardVgrPlatform_SOB" .. counter, "SOB_PlayerWaves"..playerIndex) == 0 and 
			SobGroup_IsDoingAbility("SingleGuardVgrPlatform_SOB" .. counter, AB_Move) == 0 and
			SobGroup_IsDoingAbility("SingleGuardVgrPlatform_SOB" .. counter, AB_Guard) == 0 and
			SobGroup_IsDoingAbility("SingleGuardVgrPlatform_SOB" .. counter, AB_Dock) == 0 and
			SobGroup_UnderAttack("SingleGuardVgrPlatform_SOB" .. counter) == 0 then
				if SobGroup_Count("vgr_mothership"..playerIndex) > 0 and SobGroup_Count("vgr_shipyard"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "vgr_mothership"..playerIndex) > 12500 and SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "vgr_shipyard"..playerIndex) > 12500 then
						if SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "vgr_mothership"..playerIndex) < SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "vgr_shipyard"..playerIndex) then
							--print(Vgrplatforms[i].." is guarding the Mothership instead of Shipyard for player index: "..playerIndex..", game year: "..year)
							SobGroup_MoveToSobGroup("SingleGuardVgrPlatform_SOB".. counter, "vgr_mothership"..playerIndex)
						else
							--print(Vgrplatforms[i].." is guarding the Shipyard instead of Mothership for player index: "..playerIndex..", game year: "..year)
							SobGroup_MoveToSobGroup("SingleGuardVgrPlatform_SOB".. counter, "vgr_shipyard"..playerIndex)
						end
					end
				elseif SobGroup_Count("vgr_mothership"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "vgr_mothership"..playerIndex) > 12500 then
						--print(Vgrplatforms[i].." is guarding the Mothership for player index: "..playerIndex..", game year: "..year)
						SobGroup_MoveToSobGroup("SingleGuardVgrPlatform_SOB".. counter, "vgr_mothership"..playerIndex)
					end
				elseif SobGroup_Count("vgr_shipyard"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "vgr_shipyard"..playerIndex) > 12500 then
						--print(Vgrplatforms[i].." is guarding the Shipyard for player index: "..playerIndex..", game year: "..year)
						SobGroup_MoveToSobGroup("SingleGuardVgrPlatform_SOB".. counter, "vgr_shipyard"..playerIndex)
					end
				elseif SobGroup_Count("productioncapital"..playerIndex) > 0 then
					if SobGroup_GetDistanceToSobGroup("SingleGuardVgrPlatform_SOB" .. counter, "productioncapital"..playerIndex) > 12500 then
						--print(Vgrplatforms[i].." is guarding a Production Capital for player index: "..playerIndex..", game year: "..year)
						SobGroup_MoveToSobGroup("SingleGuardVgrPlatform_SOB".. counter, "productioncapital"..playerIndex)
					end
				end
			end
		end
	until (not Vgrplatforms[i + 1])
end

-- Kad Platform Auto Guard

function GuardKadPlatform(playerIndex)
	local numships = SobGroup_SplitGroupReference("SingleGuardKadPlatform_SOB", "kad_snail"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kad_snail"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if SobGroup_SobGroupCompare("SingleGuardKadPlatform_SOB" .. counter, "SOB_PlayerWaves"..playerIndex) == 0 and 
		SobGroup_IsDoingAbility("SingleGuardKadPlatform_SOB" .. counter, AB_Move) == 0 and
		SobGroup_IsDoingAbility("SingleGuardKadPlatform_SOB" .. counter, AB_Guard) == 0 and
		SobGroup_IsDoingAbility("SingleGuardKadPlatform_SOB" .. counter, AB_Dock) == 0 and
		SobGroup_UnderAttack("SingleGuardKadPlatform_SOB" .. counter) == 0 then
			local numNeedle = SobGroup_SplitGroupReference("SingleNeedleshipToGuard_SOB", "kad_needleship"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("kad_needleship"..playerIndex))
			local operator = 0
			for pointer = 0, numNeedle - 1, 1 do
				if SobGroup_GetDistanceToSobGroup("SingleGuardKadPlatform_SOB" .. counter, "SingleNeedleshipToGuard_SOB"..pointer) > 12500 then
					operator = operator + 1
				end
			end
			if operator == numNeedle then
				SobGroup_MoveToSobGroup("SingleGuardKadPlatform_SOB".. counter, "SingleNeedleshipToGuard_SOB"..random_pseudo(0,numNeedle-1))
			end
		end
	end
end

-- This function is no longer for auto capture, but for guarding resource collectors (just like mobile refineries)

function KadPodshipAutoCapture(playerIndex)
	local numships = SobGroup_SplitGroupReference("SingleCaptureKadPodship_SOB", "kad_podship"..playerIndex, "frigates"..playerIndex, SobGroup_Count("kad_podship"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if SobGroup_IsDoingAbility("SingleCaptureKadPodship_SOB" .. counter, AB_Attack) == 0 and
		SobGroup_IsDoingAbility("SingleCaptureKadPodship_SOB" .. counter, AB_Dock) == 0 and
		SobGroup_IsDoingAbility("SingleCaptureKadPodship_SOB" .. counter, AB_Move) == 0 and
		SobGroup_IsDoingAbility("SingleCaptureKadPodship_SOB" .. counter, AB_Capture) == 0 then
			if SobGroup_FillProximitySobGroup("temp", "kad_ressourcecollector"..playerIndex, "SingleCaptureKadPodship_SOB" .. counter, 2000) == 0 then
				local numCapture = SobGroup_SplitGroupReference("Kad_SingleShipToCapture_SOB", "kad_ressourcecollector"..playerIndex, "utilities"..playerIndex, SobGroup_Count("kad_ressourcecollector"..playerIndex))
				local breaker = 0
				local pointer = 0
				local limiter = 0
				while limiter < numCapture-1 and breaker == 0 do
					pointer = random_pseudo(0,numCapture-1)
					if SobGroup_IsDoingAbility("Kad_SingleShipToCapture_SOB"..pointer, AB_Harvest) == 1 and SobGroup_IsDoingAbility("Kad_SingleShipToCapture_SOB"..pointer, AB_Dock) == 0 then
						breaker = 1
					end
					limiter = limiter + 1
				end
				if breaker == 1 then
					SobGroup_MoveToSobGroup("SingleCaptureKadPodship_SOB"..counter, "Kad_SingleShipToCapture_SOB"..pointer)
					--print("Podship"..counter.." owned by player index: "..playerIndex.." is guarding gardner, game year: "..year)
				end
			end
		end
	end
end

-- Hgn Summon Hypserspace Core
function SummonHyperspaceCore(playerIndex)
	if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") == 0 and Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hscore") == 0 then 
		if (SobGroup_Count("productioncapital"..playerIndex) > 0) then
			SobGroup_CreateShip_InstantSpawnDock("productioncapital"..playerIndex, "hgn_hscore")
			print("Hyperspace Core summoned by player index: "..playerIndex..", game year: "..year)
		end
	end
end

-- Hgn capture time upgrade
function CaptureTimeUpgradeHgn(playerIndex)
	--Update_AllShips()
	local numships = SobGroup_SplitGroupReference("SingleUpgradeHgnMarineFrigate_SOB", "hgn_marinefrigate"..playerIndex, "frigates"..playerIndex, SobGroup_Count("hgn_marinefrigate"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if Player_HasResearch(playerIndex, "marinefrigateCAPTUREUpgrade3") == 1 then
			if SobGroup_GetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime") < 1 then
				SobGroup_SetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime", 1)
				--print("Marine frigate capture time upgraded to 3")
			end
		elseif Player_HasResearch(playerIndex, "marinefrigateCAPTUREUpgrade2") == 1 then
			if SobGroup_GetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime") ~= 0.6 then
				SobGroup_SetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime", 0.6)
			end
		elseif Player_HasResearch(playerIndex, "marinefrigateCAPTUREUpgrade1") == 1 then
			if SobGroup_GetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime") ~= 0.25 then
				SobGroup_SetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime", 0.25)
			end
		else
			if SobGroup_GetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime") ~= 0.001 then
				SobGroup_SetHardPointHealth("SingleUpgradeHgnMarineFrigate_SOB".. counter, "capturetime", 0.001)
				--print("Marine frigate capture time set to normal")
			end
		end
	end
end

-- Vgr capture time upgrade
function CaptureTimeUpgradeVgr(playerIndex)
	--Update_AllShips()
	local numships = SobGroup_SplitGroupReference("SingleUpgradeVgrInfiltratorFrigate_SOB", "vgr_infiltratorfrigate"..playerIndex, "frigates"..playerIndex, SobGroup_Count("vgr_infiltratorfrigate"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if Player_HasResearch(playerIndex, "InfiltratorfrigateCAPTUREUpgrade3") == 1 then
			if SobGroup_GetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime") < 1 then
				SobGroup_SetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime", 1)
			end
		elseif Player_HasResearch(playerIndex, "InfiltratorfrigateCAPTUREUpgrade2") == 1 then
			if SobGroup_GetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime") ~= 0.6 then
				SobGroup_SetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime", 0.6)
			end
		elseif Player_HasResearch(playerIndex, "InfiltratorfrigateCAPTUREUpgrade1") == 1 then
			if SobGroup_GetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime") ~= 0.25 then
				SobGroup_SetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime", 0.25)
			end
		else
			if SobGroup_GetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime") ~= 0.001 then
				SobGroup_SetHardPointHealth("SingleUpgradeVgrInfiltratorFrigate_SOB".. counter, "capturetime", 0.001)
			end
		end
	end
end

-- Vgr hyperspace platform forced stop around enemy base
function StopVgrPlatform(playerIndex)
	--Update_AllShips()
	local numgates = SobGroup_SplitGroupReference("SingleStopVgrHSplatform_SOB", "vgr_hyperspace_platform"..playerIndex, "platforms", SobGroup_Count("vgr_hyperspace_platform"..playerIndex))
	for counter = 0, numgates - 1, 1 do
		local enemyIndex = 0
		while enemyIndex < Universe_PlayerCount() and SobGroup_IsDoingAbility("SingleStopVgrHSplatform_SOB".. counter, AB_Move) == 1 do
			if Player_IsAlive(enemyIndex) == 1 and playerIndex ~= enemyIndex and AreAllied(enemyIndex, playerIndex) == 0 then
				--print("function: StopVgrPlatform(playerIndex) is working")
				local stop_dist = random_pseudo(20000, 25000)
				if SobGroup_Empty("fcdocker"..enemyIndex) == 0 and SobGroup_IsDoingAbility("SingleStopVgrHSplatform_SOB".. counter, AB_Move) == 1 then
					if SobGroup_GetDistanceToSobGroup("SingleStopVgrHSplatform_SOB".. counter, "fcdocker"..enemyIndex) < stop_dist then
						--print("SingleStopVgrHSplatform_SOB"..counter.." owned by player index: "..playerIndex.." stopped within distance: "..stop_dist.." from fcdocker owned by player index: "..enemyIndex..", game year: "..year)
						SobGroup_Stop(playerIndex, "SingleStopVgrHSplatform_SOB".. counter)
						SobGroup_AbilityActivate("SingleStopVgrHSplatform_SOB".. counter, AB_Move, 0)
					end
				end
				if SobGroup_Empty("productioncapital"..enemyIndex) == 0 and SobGroup_IsDoingAbility("SingleStopVgrHSplatform_SOB".. counter, AB_Move) == 1 then
					if SobGroup_GetDistanceToSobGroup("SingleStopVgrHSplatform_SOB".. counter, "productioncapital"..enemyIndex) < stop_dist then
						--print("SingleStopVgrHSplatform_SOB"..counter.." owned by player index: "..playerIndex.." stopped within distance: "..stop_dist.." from productioncapital owned by player index: "..enemyIndex..", game year: "..year)
						SobGroup_Stop(playerIndex, "SingleStopVgrHSplatform_SOB".. counter)
						SobGroup_AbilityActivate("SingleStopVgrHSplatform_SOB".. counter, AB_Move, 0)
					end
				end
				if SobGroup_Empty("parader"..enemyIndex) == 0 and SobGroup_IsDoingAbility("SingleStopVgrHSplatform_SOB".. counter, AB_Move) == 1 then
					if SobGroup_GetDistanceToSobGroup("SingleStopVgrHSplatform_SOB".. counter, "parader"..enemyIndex) < stop_dist then
						--print("SingleStopVgrHSplatform_SOB"..counter.." owned by player index: "..playerIndex.." stopped within distance: "..stop_dist.." from parader owned by player index: "..enemyIndex..", game year: "..year)
						SobGroup_Stop(playerIndex, "SingleStopVgrHSplatform_SOB".. counter)
						SobGroup_AbilityActivate("SingleStopVgrHSplatform_SOB".. counter, AB_Move, 0)
					end
				end
			end
			enemyIndex = enemyIndex + 1
		end
	end
end

function FreeWillTheorem()		--activated by onint.lua
	freeplayerCount = Universe_PlayerCount();
	aliveplayer = 0;
	alliance_num = 0;
	
	while (aliveplayer < freeplayerCount) do
		if Player_IsAlive(aliveplayer) == 1 then
			aliveplayer = aliveplayer + 1
		end
	end
	
	if aliveplayer > 2 then
		local playerIndex = 0;
		while ( playerIndex < freeplayerCount - 1 ) do
			if Player_IsAlive(playerIndex) == 1 then
				local enemy = random_pseudo( playerIndex, freeplayerCount - 1 )
				
				if Player_IsAlive(enemy) == 1 and enemy ~= playerIndex then
					if AreAllied(playerIndex, enemy) == 0 then
					  local rm = random_pseudo(1,3)
						if rm == 1 then
							SetAlliance(playerIndex,enemy)
							SetAlliance(enemy,playerIndex)
							alliance_num = alliance_num + 1
						end
					elseif AreAllied(playerIndex, enemy) == 1 then
						alliance_num = alliance_num + 1
						local rm = random_pseudo(1,3)
						if rm == 2 then
							BreakAlliance(playerIndex,enemy)
							BreakAlliance(enemy,playerIndex)
							alliance_num = alliance_num - 1
						end
					end
				end
			end
			playerIndex = playerIndex + 1
		end
		
		Rule_Remove("FreeWillTheorem")
		Rule_AddInterval("FreeWillTheorem", random_pseudo(1000,5000))
		
	else
		Rule_Remove("FreeWillTheorem")
	end
	
	combination = 0;
	local i = 1;
	while (i < freeplayerCount) do
		i = i + 1
		combination = combination + freeplayerCount - i
	end
	if alliance_num > combination - 1 then
		local playerIndex = 0
		while ( playerIndex < freeplayerCount - 1 ) do
			if Player_IsAlive(playerIndex) == 1 then
				local allies = random_pseudo( playerIndex, freeplayerCount - 1 )
				
				if Player_IsAlive(allies) == 1 and allies ~= playerIndex then
					if AreAllied(playerIndex, allies) == 1 then
						local rnd = random_pseudo(1,3)
						if rnd == 1 then
							BreakAlliance(playerIndex,allies)
							BreakAlliance(allies,playerIndex)
							alliance_num = alliance_num - 1
						end
					end
				end
			end
			playerIndex = playerIndex + 1
		end
	end
	
end

--Perks Table
KadPrimaryPerks = {"kad_perks_survivalist", "kad_perks_rage", "kad_perks_stealth", "kad_perks_safefall", "kad_perks_training", "kad_perks_hitandrun", "kad_perks_bounty"}
KadPrimaryPerksName = {"Survivalist", "Rage of Kadesh", "Stealth", "Safe Fall", "Adv. Training", "Hit and Run", "Bounty Hunter"}
KadSecondaryPerks = {"kad_perks_miracle", "kad_perks_curse", "kad_perks_revealer", "kad_perks_retreat", "kad_perks_damagecontrol", "kad_perks_superheavy", "kad_perks_potential"}	--make sure it's in the correct dependency order with the primary perk
KadSecondaryPerksName = {"Miracle", "Curse o. t. Garden", "Revealer", "Retreat", "Damage Control", "Super Heavy", "Potential Energy"}
KadAllPerks = {"kad_perks_survivalist", "kad_perks_rage", "kad_perks_stealth", "kad_perks_safefall", "kad_perks_training", "kad_perks_hitandrun", "kad_perks_bounty", "kad_perks_miracle", "kad_perks_curse", "kad_perks_revealer", "kad_perks_retreat", "kad_perks_damagecontrol", "kad_perks_superheavy", "kad_perks_potential"}	--must have the same order with the lists above
KadPerksWorkingInSameWay = {"kad_perks_survivalist", "kad_perks_rage", "kad_perks_stealth", "kad_perks_safefall", "kad_perks_bounty", "kad_perks_damagecontrol", "kad_perks_curse", "kad_perks_revealer", "kad_perks_potential"}	--super heavy removed from here
KadPerksWorkingInAnotherWay = {"kad_perks_hitandrun", "kad_perks_retreat"}

function KadAscensionPerks(playerIndex)
	local perk_list = KadAllPerks	--KadPrimaryPerks	--perks have the same names with the research items
	local current_rank = Player_GetRank(playerIndex)
	local base_count = 0
	local research_count = 0
	for z, research in perk_list do
		if Player_HasResearch(playerIndex, research) == 1 then
			base_count = base_count + 1
		elseif Player_HasQueuedResearch(playerIndex, research) == 1 then
			research_count = research_count + 1
		end
		if research_count + base_count > current_rank then
			Player_CancelResearch_Smart(playerIndex, research)
		end
	end
	for z, research in perk_list do
		if research_count + base_count >= current_rank and Player_HasQueuedResearch(playerIndex, research) == 0 then
			Player_RestrictResearchOption_Smart(playerIndex, research)
		end
	end
	if base_count >= current_rank then
		Player_RestrictAllResearchInList(playerIndex, perk_list)
	elseif research_count + base_count < current_rank then
		--Player_UnrestrictAllResearchInList(playerIndex, perk_list)
		local primary_perk_count = getn(KadPrimaryPerks)
		for z, research in perk_list do
			if z > primary_perk_count	then --secondary perks cannot be unrestricted unless the prerequisite research is done
				if Player_HasResearch(playerIndex, perk_list[z-primary_perk_count]) == 1 then
					Player_UnrestrictResearchOption_Smart(playerIndex, research)
				end
			else	--primary perks can be unrestricted straight away
				Player_UnrestrictResearchOption_Smart(playerIndex, research)
			end
		end
	end
end

function KadPerkExecute(ship)
  -- perks main function
	if SobGroup_HealthPercentage(ship) > 0 then
		-- negative feedback of health
  	for perktype = 1, Table_CountElements(KadPerksWorkingInSameWay), 1 do
			if SobGroup_GetHardPointHealth(ship, KadPerksWorkingInSameWay[perktype]) > 0 and SobGroup_HealthPercentage(ship) <= 1 and SobGroup_HealthPercentage(ship) > 0 then
				SobGroup_SetHardPointHealth(ship, KadPerksWorkingInSameWay[perktype], SobGroup_HealthPercentage(ship))
			end
		end
		-- positive feedback of speed
		local ApparentSpeed = sqrt(SobGroup_GetEquivalentSpeed(ship))
  	for perktype = 1, Table_CountElements(KadPerksWorkingInAnotherWay), 1 do
			if SobGroup_GetHardPointHealth(ship, KadPerksWorkingInAnotherWay[perktype]) > 0 then
				if ApparentSpeed <= 360 and ApparentSpeed > 0 then
					SobGroup_SetHardPointHealth(ship, KadPerksWorkingInAnotherWay[perktype], ApparentSpeed/360)	--it's working correctly
				elseif ApparentSpeed > 360 then
					SobGroup_SetHardPointHealth(ship, KadPerksWorkingInAnotherWay[perktype], 1)
				end
			end
		end
		-- bounty hunter perk
		if Perk_CalculateBounty(ship) > 0 then
			AccoladesAddRU(SobGroup_OwnedBy(ship), Perk_CalculateBounty(ship))
			--Player_SetRU(SobGroup_OwnedBy(ship), Player_GetRU(SobGroup_OwnedBy(ship)) + Perk_CalculateBounty(ship))
		end
		-- miracle perk
		if SobGroup_GetHardPointHealth(ship, "kad_perks_miracle") > 0 and SobGroup_HealthPercentage(ship) > 0 then
			if (SobGroup_HealthPercentage(ship) < 0.05 and SobGroup_IsDoingAbility(ship, AB_Attack) == 1 and SobGroup_UnderAttack(ship) == 1) or 
			(SobGroup_HealthPercentage(ship) < 0.1 and SobGroup_IsDoingAbility(ship, AB_Attack) == 1) then	--make the perk stronger
				SobGroup_SetInvulnerability(ship, 1)
			elseif SobGroup_SobGroupCompare(ship, "haxor_all_invincibleships") == 0 then
				SobGroup_SetInvulnerability(ship, 0)
			end
		end
		-- super heavy perk
		local health_multiplier = 4	--defined in the subsystem file
		local hp = SobGroup_HealthPercentage(ship)
		if SobGroup_GetHardPointHealth(ship, "kad_perks_superheavy") > 0 and hp > 0 then
			if SobGroup_GetHardPointHealth(ship, "kad_perks_superheavy") < 1/(health_multiplier-0.9) then
				SobGroup_SetHardPointHealth(ship, "kad_perks_superheavy", 1)
				SobGroup_SetInvulnerabilityOfHardPoint(ship, "kad_perks_superheavy", 1)
				SobGroup_SetHealth_Smart(ship, hp*health_multiplier)	--restore the ship's health back to its original proportion before building this perk
				local xp = SobGroup_GetHardPointHealth(ship, "experience")
				if xp>0 and xp<1 then
					SobGroup_SetHardPointHealth_Smart(ship, "experience", min(xp*health_multiplier, 0.5))	--restore the ship's experience back to its original value before building this perk
				end
				local engine_health = SobGroup_GetHardPointHealth(ship, "Engine")
				if engine_health>0 and engine_health<1 then
					SobGroup_SetHardPointHealth_Smart(ship, "Engine", engine_health*health_multiplier)	--restore the ship's engine health back to its original value before building this perk
				end
			end
		elseif SobGroup_GetHardPointHealth(ship, "kad_perks_superheavy") == 0 and hp > 1*(health_multiplier-0.9) then	--the perk has been removed, need to re-adjust the ship's health and xp
			SobGroup_SetHealth(ship, 1)
			local xp = SobGroup_GetHardPointHealth(ship, "experience")
			if xp>0 and xp<1 then
				SobGroup_SetHardPointHealth_Smart(ship, "experience", min(xp/health_multiplier, 0.5))
			end
			local engine_health = SobGroup_GetHardPointHealth(ship, "Engine")
			if engine_health>0 and engine_health<1 then
				SobGroup_SetHardPointHealth_Smart(ship, "Engine", engine_health/health_multiplier)
			end
		end
		-- damage control perk
		if SobGroup_GetHardPointHealth(ship, "kad_perks_damagecontrol") > 0 and hp > 0 and hp < 1 then
			local regen = 0.01*(1-hp^0.1)
			SobGroup_SetHealth_Smart(ship, hp+regen)
		end
		-- retreat perk
		if SobGroup_GetHardPointHealth(ship, "kad_perks_retreat") > 0 and hp > 0 and hp < 1 and ApparentSpeed > 0 then
			local regen = 0.01*min((ApparentSpeed/360)^5, 1)
			SobGroup_SetHealth_Smart(ship, hp+regen)
		end
		-- clear primary perk
		if SobGroup_GetHardPointHealth(ship, "kad_perks_clear") > 0 then
    	for perktype = 1, Table_CountElements(KadPrimaryPerks), 1 do
				if SobGroup_GetHardPointHealth(ship, KadPrimaryPerks[perktype]) > 0 then
					SobGroup_SetHardPointHealth(ship, KadPrimaryPerks[perktype], 0)
				end
			end
			SobGroup_SetHardPointHealth(ship, "kad_perks_clear", 0)
		end
		-- clear secondary perk
		if SobGroup_GetHardPointHealth(ship, "kad_perks_clear1") > 0 then
    	for perktype = 1, Table_CountElements(KadSecondaryPerks), 1 do
				if SobGroup_GetHardPointHealth(ship, KadSecondaryPerks[perktype]) > 0 then
					SobGroup_SetHardPointHealth(ship, KadSecondaryPerks[perktype], 0)
				end
			end
			SobGroup_SetHardPointHealth(ship, "kad_perks_clear1", 0)
		end
	end
	-- stored 2000 RUs?
	if Player_GetRU(SobGroup_OwnedBy(ship)) >= 2100 then	    
    if SobGroup_Empty("supporter"..SobGroup_OwnedBy(ship)) == 0 and SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy(ship), "2000ru") == 0 then   
      SobGroup_CreateSubSystem("supporter"..SobGroup_OwnedBy(ship), "2000ru")            
    end 
  elseif SobGroup_Empty("supporter"..SobGroup_OwnedBy(ship)) == 0 then
		if SobGroup_GetHardPointHealth("supporter"..SobGroup_OwnedBy(ship), "2000ru") > 0 then
			local breaker = 0
			local numPerkBuilders = SobGroup_SplitGroupReference("SinglePerktoCheck_SOB", "Player_Ships"..SobGroup_OwnedBy(ship), "Player_Ships"..SobGroup_OwnedBy(ship), SobGroup_Count("Player_Ships"..SobGroup_OwnedBy(ship)))
			for z = 0, numPerkBuilders - 1, 1 do		--is this consuming too much computing power? shut the fuck up, just play on a better PC!
				if SobGroup_IsDoingAbility("SinglePerktoCheck_SOB"..z, AB_Builder) == 1 then
					for perktype = 1, Table_CountElements(KadAllPerks), 1 do
				  	if SobGroup_IsBuilding("SinglePerktoCheck_SOB"..z, KadAllPerks[perktype]) == 1 then   
				  		breaker = breaker + 1 	        
				    end
				  end
				end
			end
		  if breaker == 0 then
		  	SobGroup_SetHardPointHealth("supporter"..SobGroup_OwnedBy(ship), "2000ru", 0)
		  end
	  end
  end	
end

function Perk_CalculateBounty(ship)
	local bounty = 0
	if SobGroup_GetHardPointHealth(ship, "kad_perks_bounty") > 0 and SobGroup_HealthPercentage(ship) > 0 then
		if SobGroup_IsDoingAbility(ship, AB_Attack) == 1 then
			bounty = bounty + 5*resource	--let RU settings in skirmish options affect the bounty
			if SobGroup_UnderAttack(ship) == 1 then
				SobGroup_Create("BountyTempSob"..SobGroup_OwnedBy(ship))
				SobGroup_Clear("BountyTempSob"..SobGroup_OwnedBy(ship))
				SobGroup_GetAttackers(ship, "BountyTempSob"..SobGroup_OwnedBy(ship))
				bounty = bounty + SobGroup_Count("BountyTempSob"..SobGroup_OwnedBy(ship))
				local damagetaken = 1 - SobGroup_GetHardPointHealth(ship, "kad_perks_bounty")
				if damagetaken > 0 then
					bounty = bounty + damagetaken*20
				end
			end
		end
	end
  return floor(bounty * 3) --added modifier to make the perk more useful
end

function PerksDeisplayInTaskBar(ship)
	-- taskbar display
	local bountyhunter_bonus = Perk_CalculateBounty(ship)
	for perktype = 1, Table_CountElements(KadPrimaryPerks), 1 do
		if SobGroup_GetHardPointHealth(ship, "kad_perks_bounty") > 0 then
			UI_SetElementVisible("NewTaskbar", "kad_PrimaryPerk", 1)
			UI_SetTextLabelText("NewTaskbar", "kad_primaryperktext", "Bounty: "..bountyhunter_bonus.." RUs");
		elseif SobGroup_GetHardPointHealth(ship, KadPrimaryPerks[perktype]) > 0 then
			UI_SetElementVisible("NewTaskbar", "kad_PrimaryPerk", 1)
			UI_SetTextLabelText("NewTaskbar", "kad_primaryperktext", KadPrimaryPerksName[perktype]);
		end
	end
	for perktype = 1, Table_CountElements(KadSecondaryPerks), 1 do
		if SobGroup_GetHardPointHealth(ship, KadSecondaryPerks[perktype]) > 0 then
			UI_SetElementVisible("NewTaskbar", "kad_SecondaryPerk", 1)
			UI_SetTextLabelText("NewTaskbar", "kad_secondaryperktext", KadSecondaryPerksName[perktype].." ");
		end
	end
end

function ExcuteExperienceSubsystemsWithFullRange(ship)
	if (SobGroup_GetHardPointHealth(ship, "experience") * 10000) >= 999 then	   
	  if SobGroup_GetHardPointHealth(ship, "999exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "999exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "900exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "900exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "800exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "800exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "700exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "700exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "600exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "600exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "500exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "500exp")
    end
    if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "400exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 900 then	   
	  if SobGroup_GetHardPointHealth(ship, "900exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "900exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "800exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "800exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "700exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "700exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "600exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "600exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "500exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "500exp")
    end
    if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "400exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 800 then	   
	  if SobGroup_GetHardPointHealth(ship, "800exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "800exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "700exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "700exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "600exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "600exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "500exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "500exp")
    end
    if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "400exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 700 then	   
	  if SobGroup_GetHardPointHealth(ship, "700exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "700exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "600exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "600exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "500exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "500exp")
    end
    if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "400exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 600 then	   
	  if SobGroup_GetHardPointHealth(ship, "600exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "600exp")
    end
	  if SobGroup_GetHardPointHealth(ship, "500exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "500exp")
    end
    if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "400exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 500 then	   
	  if SobGroup_GetHardPointHealth(ship, "500exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "500exp")
    end
    if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "400exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end         	  
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 400 then	
	  if SobGroup_GetHardPointHealth(ship, "400exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "400exp")
    end
    if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "300exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end    
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end                 	  
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 300 then
	  if SobGroup_GetHardPointHealth(ship, "300exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "300exp")
    end
    if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "200exp")			      	
	  end
    if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 200 then
	  if SobGroup_GetHardPointHealth(ship, "200exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "200exp")
    end
    if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
	    SobGroup_CreateSubSystem(ship, "100exp")			      	
	  end  
	elseif (SobGroup_GetHardPointHealth(ship, "experience") * 10000) > 100 then
	  if SobGroup_GetHardPointHealth(ship, "100exp") == 0 then
    	SobGroup_CreateSubSystem(ship, "100exp")		      
    end	      
	else
	end
end

function RaceCheckSynWithInterface()		--activated by interface.lua
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			if Player_GetRace(playerIndex) == Race_Raider then
				local dummy_count = 0
				for z, iCount in RadDummyObjects do
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, iCount) > 0 then
						dummy_count = dummy_count + 1
					end
				end
				if dummy_count > 0 then
					DummyObjectsTimedDestruction(playerIndex)
				end
			end
		end
		playerIndex = playerIndex + 1
	end
	Rule_Remove("RaceCheckSynWithInterface")
end

function SpawnDummyObjectForSpecialAbility(ship, type)
	local playerIndex = SobGroup_OwnedBy(ship)
	Volume_AddSphere(""..type.."VOL_"..ship, SobGroup_GetPosition(ship), 200)
	SobGroup_Create(""..type.."SOB_"..ship)
	SobGroup_Create("TempSOB_RadDummySpawn")
	SobGroup_Clear("TempSOB_RadDummySpawn")
	if type == "rad_xp_coffee" and Player_HasResearch(playerIndex, "SpecialAbility2Level3") == 1 then
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type.."2", ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	elseif type == "rad_xp_coffee" and Player_HasResearch(playerIndex, "SpecialAbility2Level2") == 1 then
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type.."1", ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	elseif type == "rad_xp_demoralize" and Player_HasResearch(playerIndex, "SpecialAbility3Level3") == 1 then
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type.."2", ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	elseif type == "rad_xp_demoralize" and Player_HasResearch(playerIndex, "SpecialAbility3Level2") == 1 then
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type.."1", ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	elseif type == "rad_xp_repulsor" and Player_HasResearch(playerIndex, "SpecialAbility6Level3") == 1 then
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type.."2", ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	elseif type == "rad_xp_repulsor" and Player_HasResearch(playerIndex, "SpecialAbility6Level2") == 1 then
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type.."1", ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	else
		SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_dummy_"..type, ""..type.."SOB_"..ship, "TempSOB_RadDummySpawn", ""..type.."VOL_"..ship)
	end
	SobGroup_SobGroupAdd(""..type.."SOB_"..ship, "TempSOB_RadDummySpawn")
	if CPU_Exist_Smart(SobGroup_OwnedBy(ship)) == 1 then
		CPU_RemoveSobGroup(SobGroup_OwnedBy(ship), ""..type.."SOB_"..ship)
	end
	SobGroup_SetTactics(""..type.."SOB_"..ship, PassiveTactics)
	SobGroup_SobGroupAdd("ECM_immune", ""..type.."SOB_"..ship)
	SobGroup_Kamikaze(""..type.."SOB_"..ship, ship)
	SobGroup_MakeSelectable(""..type.."SOB_"..ship, 0)
	Volume_Delete(""..type.."VOL_"..ship)
	--one time effects (sound or visual)
	if type == "rad_xp_coffee" then
		FX_StartEvent("TempSOB_RadDummySpawn", "start")
	elseif type == "rad_xp_demoralize" then
		FX_StartEvent("TempSOB_RadDummySpawn", "start")
	elseif type == "rad_xp_hijack" then
		FX_StartEvent("TempSOB_RadDummySpawn", "start")
	elseif type == "rad_xp_dog" then
		FX_StartEvent("TempSOB_RadDummySpawn", "start")
	end
end

RadDummyObjects = {"rad_dummy_rad_xp_dog", "rad_dummy_rad_xp_hijack", "rad_dummy_rad_xp_coffee", "rad_dummy_rad_xp_coffee1", "rad_dummy_rad_xp_coffee2", "rad_dummy_rad_xp_demoralize",  "rad_dummy_rad_xp_demoralize1",  "rad_dummy_rad_xp_demoralize2", "rad_dummy_rad_xp_repulsor", "rad_dummy_rad_xp_repulsor1", "rad_dummy_rad_xp_repulsor2"}

function DummyObjectsTimedDestruction(playerIndex)
	--Update_AllShips()
	local i = 0
	repeat
		i = i +1
		local damage = 0.02
		local threshold = 0.05
		if RadDummyObjects[i] == "rad_dummy_rad_xp_coffee" then
			if Player_HasResearch(playerIndex, "SpecialAbility2Level1") == 0 then
				damage = 0.04
				threshold = 0.05
			end
		elseif RadDummyObjects[i] == "rad_dummy_rad_xp_demoralize" then
			if Player_HasResearch(playerIndex, "SpecialAbility3Level1") == 0 then
				damage = 0.03
				threshold = 0.05
			end
		elseif RadDummyObjects[i] == "rad_dummy_rad_xp_repulsor" or RadDummyObjects[i] == "rad_dummy_rad_xp_repulsor1" or RadDummyObjects[i] == "rad_dummy_rad_xp_repulsor2" then
			if Player_HasResearch(playerIndex, "SpecialAbility6Level1") == 1 then
				damage = 0.01
				threshold = 0.05
			else
				damage = 0.015
				threshold = 0.05
			end
		elseif RadDummyObjects[i] == "rad_dummy_rad_xp_hijack" then		--spawned just for fx, so remove it quickly
			damage = 0.1
			threshold = 0.2
		elseif RadDummyObjects[i] == "rad_dummy_rad_xp_dog" then		--spawned just for fx, so remove it quickly
			damage = 0.1
			threshold = 0.2
		end
		SobGroup_Create("DummyObjects_Total")
		SobGroup_FillShipsByType("DummyObjects_Total", "Player_Ships"..playerIndex, RadDummyObjects[i])
		local numships = SobGroup_SplitGroupReference("SingleDummyObject_SOB", "DummyObjects_Total", "Player_Ships"..playerIndex, SobGroup_Count("DummyObjects_Total"))
		for counter = 0, numships - 1, 1 do
			if SobGroup_AreAllInRealSpace("SingleDummyObject_SOB"..counter) == 1 then
				FX_StopEvent("SingleDummyObject_SOB"..counter, "smoke"..random_pseudo(1,4))
				FX_StartEvent("SingleDummyObject_SOB"..counter, "smoke"..random_pseudo(1,4))
				if SobGroup_AreAnyOfTheseTypes("SingleDummyObject_SOB"..counter, "rad_dummy_rad_xp_repulsor2") == 1 then		--damage nearby enemies by flash
					SobGroup_Create("flashburstdamage_Temp")
					SobGroup_Clear("flashburstdamage_Temp")
					SobGroup_FillProximitySobGroup("flashburstdamage_Temp", "fighterenemies"..playerIndex, "SingleDummyObject_SOB"..counter, 7000)
					SobGroup_TakeDamage("flashburstdamage_Temp", 0.0055)
					SobGroup_FillProximitySobGroup("flashburstdamage_Temp", "corvetteenemies"..playerIndex, "SingleDummyObject_SOB"..counter, 7000)
					SobGroup_TakeDamage("flashburstdamage_Temp", 0.0055)
					SobGroup_FillProximitySobGroup("flashburstdamage_Temp", "enemies"..playerIndex, "SingleDummyObject_SOB"..counter, 7000)
					SobGroup_TakeDamage("flashburstdamage_Temp", 0.0055)
				end
				if SobGroup_HealthPercentage("SingleDummyObject_SOB"..counter) >= threshold and SobGroup_IsDoingAbility("SingleDummyObject_SOB"..counter, AB_Attack) == 1 then
					SobGroup_SetInvulnerability("SingleDummyObject_SOB"..counter, 0)
					SobGroup_SetHealth("SingleDummyObject_SOB"..counter, SobGroup_HealthPercentage("SingleDummyObject_SOB"..counter) - damage)
					SobGroup_SetInvulnerability("SingleDummyObject_SOB"..counter, 1)
				else
					SobGroup_SetInvulnerability("SingleDummyObject_SOB"..counter, 0)
					for event = 1, 4, 1 do
						FX_StopEvent("SingleDummyObject_SOB"..counter, "smoke"..event)
					end
					--SobGroup_Despawn("SingleDummyObject_SOB"..counter)
					SobGroup_EnterHyperSpaceOffMap("SingleDummyObject_SOB"..counter)
				end
			elseif SobGroup_AreAllInRealSpace("SingleDummyObject_SOB"..counter) == 0 or SobGroup_AreAllInHyperspace("SingleDummyObject_SOB"..counter) == 1 then
				--SobGroup_Despawn("SingleDummyObject_SOB"..counter)
				SobGroup_SetHealth("SingleDummyObject_SOB"..counter, 0)
				--print("killing smoke grenade: SingleDummyObject_SOB"..counter)
			end
		end
	until (not RadDummyObjects[i + 1])
end

Rad_XP_ability_list = {"rad_xp_smoke", "rad_xp_coffee", "rad_xp_demoralize", "rad_xp_ambush", "rad_xp_dog", "rad_xp_repulsor", "rad_xp_hijack", "rad_xp_pointdefense", "rad_xp_bodyguard", "rad_xp_nuke"}

function RadExperienceAbilityExecute(ship)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	SobGroup_Create("LSDinEffectSOB_"..ship)
	if SobGroup_HealthPercentage(ship) > 0 and Player_GetRace(playerIndex) == Race_Raider then		--don't spawn dummy objects for other races because they won't be despawned
--- durations of activation for different abilities
  	for abilitytype = 1, Table_CountElements(Rad_XP_ability_list), 1 do
			--default parameters are applied to Smoke Screen
			local damage = 0.04
			local threshold = 0.12
			if Rad_XP_ability_list[abilitytype] == "rad_xp_coffee" then
				if Player_HasResearch(playerIndex, "SpecialAbility2Level1") == 1 then
					damage = 0.02
					threshold = 0.05
				else
					damage = 0.04
					threshold = 0.05
				end
			elseif Rad_XP_ability_list[abilitytype] == "rad_xp_demoralize" then
				if Player_HasResearch(playerIndex, "SpecialAbility3Level1") == 1 then
					damage = 0.02
					threshold = 0.05
				else
					damage = 0.03
					threshold = 0.05
				end
			elseif Rad_XP_ability_list[abilitytype] == "rad_xp_dog" then
				if Player_HasResearch(playerIndex, "SpecialAbility5Level2") == 1 then
					damage = 0.02
					threshold = 0.05
				else
					damage = 0.04
					threshold = 0.12
				end
			elseif Rad_XP_ability_list[abilitytype] == "rad_xp_repulsor" then
				if Player_HasResearch(playerIndex, "SpecialAbility6Level1") == 1 then
					damage = 0.01
					threshold = 0.05
				else
					damage = 0.015
					threshold = 0.05
				end
			elseif Rad_XP_ability_list[abilitytype] == "rad_xp_hijack" then
				if Player_HasResearch(playerIndex, "SpecialAbility7Level1") == 1 then
					damage = 0.02
					threshold = 0.05
				else
					damage = 0.04
					threshold = 0.12
				end
			elseif Rad_XP_ability_list[abilitytype] == "rad_xp_pointdefense" then
				damage = 0.06
				threshold = 0.25
			elseif Rad_XP_ability_list[abilitytype] == "rad_xp_bodyguard" then
				if Player_HasResearch(playerIndex, "SpecialAbility9Level1") == 1 then
					damage = 0.06
					threshold = 0.25
				else
					damage = 0.08
					threshold = 0.25
				end
			end
			
			--Refunds
			if SobGroup_GetHardPointHealth(ship, Rad_XP_ability_list[abilitytype]) == 1 then
				local refund = 0
				local u = 5
				while u >= 1 and refund == 0 do
					if Player_HasResearch(playerIndex, "SpecialAbilityRefund"..u) == 1 then
						refund = u
					end
					u=u-1
				end
				if refund > 0 then
					Player_SetRU(playerIndex, Player_GetRU(playerIndex) + abilitytype*100*refund)
				end
			end
			
  		-- spawn dummy objects for special FX
  		if Rad_XP_ability_list[abilitytype] == "rad_xp_coffee" or 
			Rad_XP_ability_list[abilitytype] == "rad_xp_demoralize" or 
			Rad_XP_ability_list[abilitytype] == "rad_xp_repulsor" then
  			if SobGroup_GetHardPointHealth(ship, Rad_XP_ability_list[abilitytype]) > 1 - damage then
					SpawnDummyObjectForSpecialAbility(ship, Rad_XP_ability_list[abilitytype])
					--sound effect
					--if Rad_XP_ability_list[abilitytype] == "rad_xp_coffee" then
						--if (Camera_GetDistanceToSobGroup(ship) < 12000 and SobGroup_PlayerIsInSensorRange(ship, Universe_CurrentPlayer())) or playerIndex == Universe_CurrentPlayer() then
							--Sound_SpeechPlay("Data:sound/sfx/etg/Flushing The Toilet")
						--end
					--elseif Rad_XP_ability_list[abilitytype] == "rad_xp_demoralize" then
						--if (Camera_GetDistanceToSobGroup(ship) < 12000 and SobGroup_PlayerIsInSensorRange(ship, Universe_CurrentPlayer())) or playerIndex == Universe_CurrentPlayer() then
							--Sound_SpeechPlay("Data:sound/sfx/etg/woman shouting")
						--end
					--end
				end
  		end
  		
			-- timed destruction for the subsystems themselves
			if Rad_XP_ability_list[abilitytype] ~= "rad_xp_ambush" and
			Rad_XP_ability_list[abilitytype] ~= "rad_xp_nuke" then
  			SubsystemTimedDestruction(ship, Rad_XP_ability_list[abilitytype], damage, threshold)
  		end
		end
		
--- XP ability main function
		--launch some smoke grenades
		if SobGroup_GetHardPointHealth(ship, "rad_xp_smoke") > 0 then
			Volume_AddSphere("smokeVOL_"..ship, SobGroup_GetPosition(ship), 200)
			SobGroup_Create("SmokeGrenadeSOB_"..ship)
			for i = 1, random_pseudo(1,3) do
				if Player_HasResearch(playerIndex, "SpecialAbility1Level3" ) == 1 then
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_smokegrenade2", "SmokeGrenadeSOB_"..ship, "SmokeGrenadeSOB_"..ship, "smokeVOL_"..ship)
					if SobGroup_UnderAttack(ship) == 1 and 
					i == 1 then	--anti-lag
						SobGroup_Create("Temp_EnemySob"..playerIndex)
						SobGroup_Clear("Temp_EnemySob"..playerIndex)
						SobGroup_GetAttackers(ship, "Temp_EnemySob"..playerIndex)
						SobGroup_Attack_Smart(max(0,SobGroup_OwnedBy("Temp_EnemySob"..playerIndex)), "Temp_EnemySob"..playerIndex, "SmokeGrenadeSOB_"..ship)
						SobGroup_Clear("Temp_EnemySob"..playerIndex)
					end
				elseif Player_HasResearch(playerIndex, "SpecialAbility1Level2" ) == 1 then
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_smokegrenade1", "SmokeGrenadeSOB_"..ship, "SmokeGrenadeSOB_"..ship, "smokeVOL_"..ship)
				elseif Player_HasResearch(playerIndex, "SpecialAbility1Level1" ) == 1 then
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_smokegrenade", "SmokeGrenadeSOB_"..ship, "SmokeGrenadeSOB_"..ship, "smokeVOL_"..ship)
				else
					if random_pseudo(1,5) < 5 then
						SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_smokegrenade", "SmokeGrenadeSOB_"..ship, "SmokeGrenadeSOB_"..ship, "smokeVOL_"..ship)
					end
				end
			end
			SobGroup_GuardSobGroup("SmokeGrenadeSOB_"..ship, ship)
			SobGroup_MakeSelectable("SmokeGrenadeSOB_"..ship, 0)
			Volume_Delete("smokeVOL_"..ship)
		end
		
		--spawn some anti-missile drones
		if SobGroup_GetHardPointHealth(ship, "rad_xp_pointdefense") > 0 then
			SobGroup_Create("pdsDroneSOB_"..ship)
			local ship_position = {0, 0, 0}
			local quantity = 2
			if Player_HasResearch(playerIndex, "SpecialAbility8Level1" ) == 1 then
				quantity = 3
			end
			for i = 1, random_pseudo(1,quantity) do
				local BigSerial = random_pseudo(0,99999)
				SobGroup_Create("pdsDroneSOB_"..ship.."_"..BigSerial)
				Volume_AddSphere("pdsDroneVOL_"..ship, SobGroup_GetPosition(ship), 200)
				SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_defenderdrone", "pdsDroneSOB_"..ship.."_"..BigSerial, "pdsDroneSOB_"..ship, "pdsDroneVOL_"..ship)
				SobGroup_SobGroupAdd("pdsDroneSOB_"..ship, "pdsDroneSOB_"..ship.."_"..BigSerial)
				Volume_Delete("pdsDroneVOL_"..ship)
				ship_position = SobGroup_GetPosition(ship)
				for h = 1,3 do
					local alpha=random_pseudo(0,360)
					local beta=random_pseudo(0,180)
					local dist=2000
					local adduct=sin(alpha)*cos(beta)*dist
					if h==2 then
						adduct=sin(alpha)*sin(beta)*dist
					elseif h==3 then
						adduct=cos(alpha)*dist
					end
					ship_position[h] = ship_position[h] + adduct
				end
				Volume_AddSphere("pdsDroneMoveVOL_"..ship, ship_position, 200)
				SobGroup_Move(playerIndex, "pdsDroneSOB_"..ship.."_"..BigSerial, "pdsDroneMoveVOL_"..ship)
				Volume_Delete("pdsDroneMoveVOL_"..ship)
			end
			--SobGroup_SetTactics("pdsDroneSOB_"..ship, AggressiveTactics)
			SobGroup_MakeSelectable("pdsDroneSOB_"..ship, 0)
		end
		
		--spawn some fighters
		if SobGroup_GetHardPointHealth(ship, "rad_xp_ambush") > 0 then
			local spam_num = 4
			if Player_HasResearch(playerIndex, "SpecialAbility4Level1" ) == 1 then
				spam_num = spam_num + 1
			end
			if NeededPilots[playerIndex + 1] >= spam_num * 6 then
				Volume_AddSphere("ambushVOL_"..ship, SobGroup_GetPosition(ship), 200)
				SobGroup_Create("AmbushSummonSOB_"..ship)
				for i = 1, spam_num do
					local shiptype = random_pseudo(1, Table_CountElements(Radboostships))		--ship type to spawn
					SobGroup_SpawnNewShipInSobGroup(SobGroup_OwnedBy(ship), Radboostships[shiptype], "AmbushSummonSOB_"..ship, "AmbushSummonSOB_"..ship, "ambushVOL_"..ship)
				end
				if Player_HasResearch(playerIndex, "SpecialAbility4Level2" ) == 1 then
					SobGroup_SpawnNewShipInSobGroup(SobGroup_OwnedBy(ship), RadboostshipsAlt[random_pseudo(1, Table_CountElements(RadboostshipsAlt))], "AmbushSummonSOB_"..ship, "AmbushSummonSOB_"..ship, "ambushVOL_"..ship)
				end
				if Player_HasResearch(playerIndex, "SpecialAbility4Level3" ) == 1 then
					SobGroup_SpawnNewShipInSobGroup(SobGroup_OwnedBy(ship), RadAllfrigates[random_pseudo(1, Table_CountElements(RadAllfrigates))], "AmbushSummonSOB_"..ship, "AmbushSummonSOB_"..ship, "ambushVOL_"..ship)
				end
				SobGroup_GuardSobGroup("AmbushSummonSOB_"..ship, ship)
				Volume_Delete("ambushVOL_"..ship)
				SobGroup_SetHardPointHealth(ship, "rad_xp_ambush", 0)
				if (Camera_GetDistanceToSobGroup(ship) < 12000 and SobGroup_PlayerIsInSensorRange(ship, Universe_CurrentPlayer())) or playerIndex == Universe_CurrentPlayer() then
					Sound_SpeechPlay("Data:sound/speech/allships/fleet/Cloakon")
				end
			end
		end
		
		--spawn some bodyguards
		if SobGroup_GetHardPointHealth(ship, "rad_xp_bodyguard") > 0 then
			Volume_AddSphere("bodyguardVOL_"..ship, SobGroup_GetPosition(ship), 200)
			SobGroup_Create("bodyguardSOB_"..ship)
			if random_pseudo(1,2) == 1 then
				SobGroup_SpawnNewShipInSobGroup(playerIndex, "rad_shielddrone", "bodyguardSOB_"..ship, "bodyguardSOB_"..ship, "bodyguardVOL_"..ship)
			end
			if CPU_Exist_Smart(playerIndex) == 1 then
				CPU_RemoveSobGroup(playerIndex, "bodyguardSOB_"..ship)
			end
			SobGroup_RepairSobGroup("bodyguardSOB_"..ship, ship)
			SobGroup_MakeSelectable("bodyguardSOB_"..ship, 0)
			Volume_Delete("bodyguardVOL_"..ship)
		end
		
		--spawn a nuclear bomb
		if SobGroup_GetHardPointHealth(ship, "rad_xp_nuke") > 0 then
			Volume_AddSphere("dirtynukeVOL_"..ship, SobGroup_GetPosition(ship), 200)
			SobGroup_Create("dirtynukeSOB_"..ship)
			SobGroup_SpawnNewShipInSobGroup(playerIndex, "hgn_nucleartube1", "dirtynukeSOB_"..ship, "dirtynukeSOB_"..ship, "dirtynukeVOL_"..ship)
			--SobGroup_MakeSelectable("dirtynukeSOB_"..ship, 0)
			Volume_Delete("dirtynukeVOL_"..ship)
			SobGroup_SetHardPointHealth(ship, "rad_xp_nuke", 0)
		end
		
		--heal the ship if damaged
		if SobGroup_GetHardPointHealth(ship, "rad_xp_coffee") > 0 then
			if SobGroup_HealthPercentage(ship) > 0 then
				local regen = 0.02
				if Player_HasResearch(playerIndex, "SpecialAbility2Level2") == 1 then
					regen = regen*1.5
				end
				if Player_HasResearch(playerIndex, "SpecialAbility2Level3") == 1 then
					regen = regen*2
				end
				if SobGroup_HealthPercentage(ship) < 1 - regen then
					SobGroup_SetHealth(ship, SobGroup_HealthPercentage(ship)+regen)
				else
					SobGroup_SetHealth(ship, 1)
				end
			end
		end
		
		--stop enemy capturing activity and damage the capturers
		if SobGroup_GetHardPointHealth(ship, "rad_xp_dog") > 0 then
			SobGroup_SetCaptureState(ship, 0)
			SobGroup_Create("ProximityEnemyShipsSOB_"..ship)
			SobGroup_Clear("ProximityEnemyShipsSOB_"..ship)
			SobGroup_FillProximitySobGroup("ProximityEnemyShipsSOB_"..ship, "enemies"..playerIndex, ship, 1000)
			local dog_attack = 0
			local dog_state = "stopped"
			local numships = SobGroup_SplitGroupReference("SingleStopEnemyCapturer_SOB", "ProximityEnemyShipsSOB_"..ship, "ProximityEnemyShipsSOB_"..ship, SobGroup_Count("ProximityEnemyShipsSOB_"..ship))
			for i = 0, numships - 1, 1 do
				if SobGroup_IsDoingAbility("SingleStopEnemyCapturer_SOB"..i, AB_Capture) == 1 and abs(SobGroup_GetActualSpeed("SingleStopEnemyCapturer_SOB"..i) - SobGroup_GetActualSpeed(ship)) < 10 then
					SobGroup_Stop(SobGroup_OwnedBy("SingleStopEnemyCapturer_SOB"..i), "SingleStopEnemyCapturer_SOB"..i)
					if Player_HasResearch(playerIndex, "SpecialAbility5Level3") == 1 then
						dog_state = "destroyed"
						SobGroup_SetHealth_Smart("SingleStopEnemyCapturer_SOB"..i, 0)
					elseif Player_HasResearch(playerIndex, "SpecialAbility5Level1") == 1 then
						dog_state = "damaged"
						SobGroup_SetHealth_Smart("SingleStopEnemyCapturer_SOB"..i, SobGroup_HealthPercentage("SingleStopEnemyCapturer_SOB"..i)/2)
					end
					dog_attack = dog_attack + 1
				end
			end
			if dog_attack > 0 then
				if (Camera_GetDistanceToSobGroup(ship) < 12000 and SobGroup_PlayerIsInSensorRange(ship, Universe_CurrentPlayer())) or playerIndex == Universe_CurrentPlayer() then
					Sound_SpeechPlay("Data:sound/speech/allships/fleet/mad_dog")
				end
				if playerIndex == Universe_CurrentPlayer() then
	     		Subtitle_Add(12,"Dogs Attack!!! Enemy ships "..dog_state..": "..dog_attack,3.72)
	     	end
	     	--spawn dummy object for FX
				SpawnDummyObjectForSpecialAbility(ship, "rad_xp_dog")
			end
		end
		
		--make enemies attack themselves
		if SobGroup_GetHardPointHealth(ship, "rad_xp_repulsor") > 0 then
			SobGroup_Create("EnemyAttackingMeSOB_"..ship)
			SobGroup_Clear("EnemyAttackingMeSOB_"..ship)
			SobGroup_GetAttackers(ship, "EnemyAttackingMeSOB_"..ship)
			SobGroup_Create("ProximityShipsSOB_"..ship)
			SobGroup_Clear("ProximityShipsSOB_"..ship)
			Update_AllShips()
			SobGroup_FillProximitySobGroup("ProximityShipsSOB_"..ship, "enemies"..playerIndex, ship, 7000)
			SobGroup_Create("ProximityEnemyShipsSOB_"..ship)
			SobGroup_Clear("ProximityEnemyShipsSOB_"..ship)
			SobGroup_FillCompare("ProximityEnemyShipsSOB_"..ship, "EnemyAttackingMeSOB_"..ship, "ProximityShipsSOB_"..ship)
			if SobGroup_Empty("ProximityEnemyShipsSOB_"..ship) == 0 then
				local numships = SobGroup_SplitGroupReference("SingleAttackLSD_SOB", "ProximityEnemyShipsSOB_"..ship, "AllShips", SobGroup_Count("ProximityEnemyShipsSOB_"..ship))
				for i = 0, numships - 1, 1 do
					if SobGroup_CanDoAbility("SingleAttackLSD_SOB"..i, AB_Attack) == 1 then
						--if CPU_Exist_Smart(SobGroup_OwnedBy("SingleAttackLSD_SOB"..i)) == 1 then
							--CPU_RemoveSobGroup(SobGroup_OwnedBy("SingleAttackLSD_SOB"..i), "SingleAttackLSD_SOB"..i)
						--end
						SobGroup_Stop(max(0,SobGroup_OwnedBy("SingleAttackLSD_SOB"..i)), "SingleAttackLSD_SOB"..i)
						if Player_HasResearch(playerIndex, "SpecialAbility6Level2") == 1 then
							local poor_guy = random_pseudo(0,numships-1)
							local mode = 1
							if numships >= 3 then
								mode = 2
								poor_guy = i + 1
								if poor_guy >= numships then
									poor_guy = random_pseudo(0,numships-1)
								end
							elseif SobGroup_Count("ProximityShipsSOB_"..ship) > 1 then
								mode = 3
								SobGroup_Create("ProximityEnemyTargetsSOB_"..ship)
								SobGroup_Clear("ProximityEnemyTargetsSOB_"..ship)
								SobGroup_FillSubstract("ProximityEnemyTargetsSOB_"..ship, "ProximityShipsSOB_"..ship, "SingleAttackLSD_SOB"..i)
							end
							if mode == 3 and SobGroup_Empty("ProximityEnemyTargetsSOB_"..ship) == 0 then
								SobGroup_Attack(max(0,SobGroup_OwnedBy("SingleAttackLSD_SOB"..i)), "SingleAttackLSD_SOB"..i, "ProximityEnemyTargetsSOB_"..ship)
							else
								SobGroup_Attack(max(0,SobGroup_OwnedBy("SingleAttackLSD_SOB"..i)), "SingleAttackLSD_SOB"..i, "SingleAttackLSD_SOB"..poor_guy)
							end
						end
						SobGroup_SobGroupAdd("LSDinEffectSOB_"..ship, "SingleAttackLSD_SOB"..i)
					end
				end
			end
		end
		
		--take over enemy fighters and corvettes
		if SobGroup_GetHardPointHealth(ship, "rad_xp_hijack") > 0 then
			SobGroup_Create("HijackFiCoSOB_"..ship)
			SobGroup_Clear("HijackFiCoSOB_"..ship)
			SobGroup_Create("HijackFightersSOB_"..ship)
			SobGroup_Clear("HijackFightersSOB_"..ship)
			SobGroup_Create("HijackEnemyFightersSOB_"..ship)
			SobGroup_Clear("HijackEnemyFightersSOB_"..ship)
			SobGroup_Create("HijackCorvettesSOB_"..ship)
			SobGroup_Clear("HijackCorvettesSOB_"..ship)
			SobGroup_Create("HijackEnemyCorvettesSOB_"..ship)
			SobGroup_Clear("HijackEnemyCorvettesSOB_"..ship)
			SobGroup_FillProximitySobGroup("HijackFightersSOB_"..ship, "all_fighters", ship, 5000)
			SobGroup_FillSubstract("HijackEnemyFightersSOB_"..ship, "HijackFightersSOB_"..ship, "fighters"..playerIndex)
			SobGroup_FillProximitySobGroup("HijackCorvettesSOB_"..ship, "all_corvettes", ship, 5000)
			SobGroup_FillSubstract("HijackEnemyCorvettesSOB_"..ship, "HijackCorvettesSOB_"..ship, "corvettes"..playerIndex)
			SobGroup_FillUnion("HijackFiCoSOB_"..ship, "HijackEnemyFightersSOB_"..ship, "HijackEnemyCorvettesSOB_"..ship)
			if Player_HasResearch(playerIndex, "SpecialAbility7Level3") == 1 then
				SobGroup_Create("HijackFrigatesSOB_"..ship)
				SobGroup_Clear("HijackFrigatesSOB_"..ship)
				SobGroup_Create("HijackEnemyFrigatesSOB_"..ship)
				SobGroup_Clear("HijackEnemyFrigatesSOB_"..ship)
				if SobGroup_FillProximitySobGroup("HijackFrigatesSOB_"..ship, "frigates", ship, 5000) == 1 then
					SobGroup_FillSubstract("HijackEnemyFrigatesSOB_"..ship, "HijackFrigatesSOB_"..ship, "frigates"..playerIndex)
					SobGroup_SobGroupAdd("HijackFiCoSOB_"..ship, "HijackEnemyFrigatesSOB_"..ship)
				end
			end
			if SobGroup_Empty("HijackFiCoSOB_"..ship) == 0 then
				Update_AllShips()
				local numships = SobGroup_SplitGroupReference("SingleHijackFiCo_SOB", "HijackFiCoSOB_"..ship, "AllShips", SobGroup_Count("HijackFiCoSOB_"..ship))
				local Hijack_Count = 0
				local HijackFriendly_Count = 0
				for i = 0, numships - 1, 1 do
					local chance = 7
					if Player_HasResearch(playerIndex, "SpecialAbility7Level2") == 1 then
						chance = 11
					end
					if random_pseudo(0,10) < chance then
						local UnknownPlayer = SobGroup_OwnedBy("SingleHijackFiCo_SOB"..i)
						if playerIndex ~= UnknownPlayer and AreAllied(playerIndex, UnknownPlayer) == 0 then
							Hijack_Count = Hijack_Count + 1
						elseif playerIndex ~= UnknownPlayer and AreAllied(playerIndex, UnknownPlayer) == 1 then
							HijackFriendly_Count = HijackFriendly_Count + 1
						end
						SobGroup_SwitchOwner("SingleHijackFiCo_SOB"..i, playerIndex)
					end
				end
				if Hijack_Count + HijackFriendly_Count > 0 then
					SobGroup_SetHardPointHealth(ship, "rad_xp_hijack", 0)
					if (Camera_GetDistanceToSobGroup(ship) < 12000 and SobGroup_PlayerIsInSensorRange(ship, Universe_CurrentPlayer())) or playerIndex == Universe_CurrentPlayer() then
						Sound_SpeechPlay("Data:sound/speech/allships/fleet/evil_laugh")
					end
					if playerIndex == Universe_CurrentPlayer() then
	     			Subtitle_Add(12,"Hijack!!! Enemy ships hijacked: "..Hijack_Count..", Friendly ships hijacked: "..HijackFriendly_Count,3.72)
	     		end
	     		--spawn dummy object for FX
					SpawnDummyObjectForSpecialAbility(ship, "rad_xp_hijack")
				end
			end
		end
		
---AI function
		if CPU_Exist_Smart(playerIndex) == 1 and Player_GetRace(playerIndex) == Race_Raider then		--other races shouldn't be able to use it
			local total_abilities = Table_CountElements(Rad_XP_ability_list)
			local ability_idx = random_pseudo(1,total_abilities)
			local exp_idx = ability_idx * 100
			if ability_idx == 10 then
				exp_idx = 999
			end
			local ability_name = Rad_XP_ability_list[ability_idx]
			if SobGroup_GetHardPointHealth(ship, ""..exp_idx.."exp") > 0 and 
			SobGroup_GetHardPointHealth(ship, ability_name) <= 0 and 
			SobGroup_IsBuilding(ship, ability_name) == 0 and 
			Player_GetRU(playerIndex) > 1000 * ability_idx then
				if ability_name == "rad_xp_smoke" then
					if SobGroup_UnderAttack(ship) == 1 and
					(SobGroup_HealthPercentage(ship) < 1 - 0.01*random_pseudo(0,50) or Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_smokegrenade") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_smokegrenade1") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_smokegrenade2") < random_pseudo(1,10) * CPULODvalueList[playerIndexList]) then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_coffee" then
					if SobGroup_HealthPercentage(ship) < 1 - 0.01*random_pseudo(0,50) then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_demoralize" then
					SobGroup_Create("RadAINearbyEnemiesSOB_"..ship)
					SobGroup_Clear("RadAINearbyEnemiesSOB_"..ship)
					SobGroup_FillProximitySobGroup("RadAINearbyEnemiesSOB_"..ship, "enemies"..playerIndex, ship, 4000)
					if SobGroup_UnderAttack(ship) == 1 and
					SobGroup_Count("RadAINearbyEnemiesSOB_"..ship) >= random_pseudo(3,5) then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_ambush" then
					if SobGroup_IsDoingAbility(ship, AB_Attack) == 1 and
					NeededPilots[playerIndex + 1] >= random_pseudo(4,6) * 6 then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_dog" then
					SobGroup_Create("RadAIBeingCapturedSOB_"..ship)
					SobGroup_Clear("RadAIBeingCapturedSOB_"..ship)
					SobGroup_GetSobGroupBeingCapturedGroup(ship, "RadAIBeingCapturedSOB_"..ship)
					if SobGroup_Count("RadAIBeingCapturedSOB_"..ship) >= 1 and SobGroup_FillProximitySobGroup("temp", "enemies"..playerIndex, ship, 1000) == 1 then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_repulsor" then
					SobGroup_Create("RadAINearbyEnemiesSOB_"..ship)
					SobGroup_Clear("RadAINearbyEnemiesSOB_"..ship)
					SobGroup_FillProximitySobGroup("RadAINearbyEnemiesSOB_"..ship, "enemies"..playerIndex, ship, 7000)
					SobGroup_Create("RadAIEnemiesAttackingSOB_"..ship)
					SobGroup_Clear("RadAIEnemiesAttackingSOB_"..ship)
					SobGroup_GetAttackers(ship, "RadAIEnemiesAttackingSOB_"..ship)
					if SobGroup_UnderAttack(ship) == 1 and
					SobGroup_Count("RadAINearbyEnemiesSOB_"..ship) >= random_pseudo(6,8) and
					SobGroup_Count("RadAIEnemiesAttackingSOB_"..ship) >= random_pseudo(6,8) then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_hijack" then
					SobGroup_Create("RadAINearbyEnemyFightersSOB_"..ship)
					SobGroup_Clear("RadAINearbyEnemyFightersSOB_"..ship)
					SobGroup_FillProximitySobGroup("RadAINearbyEnemyFightersSOB_"..ship, "fighterenemies"..playerIndex, ship, 4000)
					SobGroup_Create("RadAINearbyEnemyCorvettesSOB_"..ship)
					SobGroup_Clear("RadAINearbyEnemyCorvettesSOB_"..ship)
					SobGroup_FillProximitySobGroup("RadAINearbyEnemyCorvettesSOB_"..ship, "corvetteenemies"..playerIndex, ship, 4000)
					SobGroup_Create("RadAINearbyEnemyFrigatesSOB_"..ship)
					SobGroup_Clear("RadAINearbyEnemyFrigatesSOB_"..ship)
					if Player_HasResearch(playerIndex, "SpecialAbility7Level3") == 1 then
						SobGroup_FillProximitySobGroup("RadAINearbyEnemyFrigatesSOB_"..ship, "frigateenemies"..playerIndex, ship, 4000)
					end
					if SobGroup_Count("RadAINearbyEnemyFightersSOB_"..ship) + SobGroup_Count("RadAINearbyEnemyCorvettesSOB_"..ship) + SobGroup_Count("RadAINearbyEnemyFrigatesSOB_"..ship) >= random_pseudo(4,6) then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_pointdefense" then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_defenderdrone") < random_pseudo(1,20) * CPULODvalueList[playerIndexList] then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_bodyguard" then
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "rad_shielddrone") < random_pseudo(1,20) * CPULODvalueList[playerIndexList] then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				elseif ability_name == "rad_xp_nuke" then
					local defenserange = 20000
					if Player_HasResearch(playerIndex, "SpecialAbility10Level3") == 1 then
						defenserange = defenserange * 10
					elseif Player_HasResearch(playerIndex, "SpecialAbility10Level2") == 1 then
						defenserange = defenserange * 2.6
					elseif Player_HasResearch(playerIndex, "SpecialAbility10Level1") == 1 then
						defenserange = defenserange * 1.3
					end
					if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_nucleartube1") < random_pseudo(1,2) * CPULODvalueList[playerIndexList] and
					SobGroup_FillProximitySobGroup("temp", "minetargetenemies"..playerIndex, ship, defenserange) == 1 then
						Rad_AIUseSpecialAbilityWithCost(ship, ability_idx)
					end
				end
			end
		end
		
	else		--when ship health is 0
		--clear LSD effect
		if SobGroup_Empty("LSDinEffectSOB_"..ship) == 0 then
  		local numships = SobGroup_SplitGroupReference("SingleCancelLSD_SOB", "LSDinEffectSOB_"..ship, "LSDinEffectSOB_"..ship, SobGroup_Count("LSDinEffectSOB_"..ship))
			for i = 0, numships - 1, 1 do
				if SobGroup_Empty("SingleCancelLSD_SOB"..i) == 0 then
					if CPU_Exist_Smart(SobGroup_OwnedBy("SingleCancelLSD_SOB"..i)) == 1 then
						CPU_AddSobGroup(SobGroup_OwnedBy("SingleCancelLSD_SOB"..i), "SingleCancelLSD_SOB"..i)
					end
				end
			end
			SobGroup_Clear("LSDinEffectSOB_"..ship)
		end
	end
end

function Rad_AIUseSpecialAbilityWithCost(ship, AbilityIndex)
	local playerIndex = SobGroup_OwnedBy(ship)
	SobGroup_CreateSubSystem(ship, Rad_XP_ability_list[AbilityIndex])
	if Player_GetRU(playerIndex) - AbilityIndex * 6 >= 0 then
		Player_SetRU(playerIndex, Player_GetRU(playerIndex) - AbilityIndex * 6)
	else
		Player_SetRU(playerIndex, 0)
	end
end

function SubsystemTimedDestruction(ship, hardpoint, damage, threshold)
	if SobGroup_GetHardPointHealth(ship, hardpoint) > 0 and SobGroup_GetHardPointHealth(ship, hardpoint) <= 1 then
		SobGroup_SetInvulnerabilityOfHardPoint(ship, hardpoint, 0)
	  SobGroup_SetHardPointHealth_Smart(ship, hardpoint, (SobGroup_GetHardPointHealth(ship, hardpoint) - damage))		--0.04
	  SobGroup_SetInvulnerabilityOfHardPoint(ship, hardpoint, 1)
	  if SobGroup_GetHardPointHealth(ship, hardpoint) < threshold then		--0.12
	  	SobGroup_SetInvulnerabilityOfHardPoint(ship, hardpoint, 0)
	    SobGroup_SetHardPointHealth(ship, hardpoint, 0)
	    --set capturable
	    if hardpoint == "rad_xp_dog" then
	    	SobGroup_SetCaptureState(ship, 1)
	    end
	    --clear LSD effect
	    if hardpoint == "rad_xp_repulsor" then
	    	if SobGroup_Empty("LSDinEffectSOB_"..ship) == 0 then
	    		local numships = SobGroup_SplitGroupReference("SingleCancelLSD_SOB", "LSDinEffectSOB_"..ship, "LSDinEffectSOB_"..ship, SobGroup_Count("LSDinEffectSOB_"..ship))
					for i = 0, numships - 1, 1 do
						if SobGroup_Empty("SingleCancelLSD_SOB"..i) == 0 then
							if CPU_Exist_Smart(SobGroup_OwnedBy("SingleCancelLSD_SOB"..i)) == 1 then
								CPU_AddSobGroup(SobGroup_OwnedBy("SingleCancelLSD_SOB"..i), "SingleCancelLSD_SOB"..i)
							end
						end
					end
					SobGroup_Clear("LSDinEffectSOB_"..ship)
				end
	    end
	  end
	end
end

function Rad_KillSmokeGrenades(playerIndex)
	--Update_AllShips()
	SobGroup_Create("smokegrenades_Total")
	SobGroup_Clear("smokegrenades_Total")
	SobGroup_Create("smokegrenades_Temp")
	SobGroup_Clear("smokegrenades_Temp")
	SobGroup_FillShipsByType("smokegrenades_Temp", "Player_Ships"..playerIndex, "rad_smokegrenade")
	SobGroup_SobGroupAdd("smokegrenades_Total", "smokegrenades_Temp")
	SobGroup_Clear("smokegrenades_Temp")
	SobGroup_FillShipsByType("smokegrenades_Temp", "Player_Ships"..playerIndex, "rad_smokegrenade1")
	SobGroup_SobGroupAdd("smokegrenades_Total", "smokegrenades_Temp")
	SobGroup_Clear("smokegrenades_Temp")
	SobGroup_FillShipsByType("smokegrenades_Temp", "Player_Ships"..playerIndex, "rad_smokegrenade2")
	SobGroup_SobGroupAdd("smokegrenades_Total", "smokegrenades_Temp")
	local numships = SobGroup_SplitGroupReference("SingleSmokeGrenade_SOB", "smokegrenades_Total", "Player_Ships"..playerIndex, SobGroup_Count("smokegrenades_Total"))
	for i = 0, numships - 1, 1 do
		if SobGroup_AreAllInRealSpace("SingleSmokeGrenade_SOB"..i) == 1 then
			FX_StopEvent("SingleSmokeGrenade_SOB"..i, "smoke"..random_pseudo(1,4))
			FX_StartEvent("SingleSmokeGrenade_SOB"..i, "smoke"..random_pseudo(1,4))
			if SobGroup_HealthPercentage("SingleSmokeGrenade_SOB"..i) > 0.5 - 0.01*random_pseudo(0,30) then
				SobGroup_SetHealth("SingleSmokeGrenade_SOB"..i, SobGroup_HealthPercentage("SingleSmokeGrenade_SOB"..i) - 0.04)
			else
				for event = 1, 4, 1 do
					FX_StopEvent("SingleSmokeGrenade_SOB"..i, "smoke"..event)
				end
				--SobGroup_Despawn("SingleSmokeGrenade_SOB"..i)
				SobGroup_EnterHyperSpaceOffMap("SingleSmokeGrenade_SOB"..i)
			end
		elseif SobGroup_AreAllInRealSpace("SingleSmokeGrenade_SOB"..i) == 0 or SobGroup_AreAllInHyperspace("SingleSmokeGrenade_SOB"..i) == 1 then
			--SobGroup_Despawn("SingleSmokeGrenade_SOB"..i)
			SobGroup_SetHealth("SingleSmokeGrenade_SOB"..i, 0)
			--print("killing smoke grenade: SingleSmokeGrenade_SOB"..i)
		end
	end
end

function Rad_KillPDSDrone(playerIndex)
	--Update_AllShips()
	SobGroup_Create("pdsDrone_Total"..playerIndex)
	SobGroup_FillShipsByType("pdsDrone_Total"..playerIndex, "Player_Ships"..playerIndex, "rad_defenderdrone")
	SobGroup_Create("PlayerShipsExecptPDSDroneSOB_"..playerIndex)
	SobGroup_Clear("PlayerShipsExecptPDSDroneSOB_"..playerIndex)
	SobGroup_FillSubstract("PlayerShipsExecptPDSDroneSOB_"..playerIndex, "Player_Ships"..playerIndex, "pdsDrone_Total"..playerIndex)
	local numships = SobGroup_SplitGroupReference("SinglePDSDrone_SOB", "pdsDrone_Total"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("pdsDrone_Total"..playerIndex))
	for i = 0, numships - 1, 1 do
		SobGroup_Create("PDSDroneProximitySOB_"..i)
		SobGroup_Clear("PDSDroneProximitySOB_"..i)
		SobGroup_FillProximitySobGroup("PDSDroneProximitySOB_"..i, "PlayerShipsExecptPDSDroneSOB_"..playerIndex, "SinglePDSDrone_SOB"..i, 7000)
		if SobGroup_Empty("PDSDroneProximitySOB_"..i) == 1 then
			if random_pseudo(1,3) == 1 then
				SobGroup_SetHealth("SinglePDSDrone_SOB"..i, 0)
			end
		end
	end
end

function Rad_KillBodyguard(playerIndex)
	--Update_AllShips()
	SobGroup_Create("Bodyguard_Total"..playerIndex)
	SobGroup_FillShipsByType("Bodyguard_Total"..playerIndex, "Player_Ships"..playerIndex, "rad_shielddrone")
	if SobGroup_Empty("Bodyguard_Total"..playerIndex) == 0 then
		SobGroup_Create("PlayerShipsExecptBodyguardSOB_"..playerIndex)
		SobGroup_Clear("PlayerShipsExecptBodyguardSOB_"..playerIndex)
		SobGroup_FillSubstract("PlayerShipsExecptBodyguardSOB_"..playerIndex, "Player_Ships"..playerIndex, "Bodyguard_Total"..playerIndex)
		local numships = SobGroup_SplitGroupReference("SingleBodyguard_SOB", "Bodyguard_Total"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("Bodyguard_Total"..playerIndex))
		for i = 0, numships - 1, 1 do
			SobGroup_Create("BodyguardProximitySOB_"..i)
			SobGroup_Clear("BodyguardProximitySOB_"..i)
			SobGroup_FillProximitySobGroup("BodyguardProximitySOB_"..i, "PlayerShipsExecptBodyguardSOB_"..playerIndex, "SingleBodyguard_SOB"..i, 7000)
			if SobGroup_IsDoingAbility("SingleBodyguard_SOB"..i, AB_Repair) == 0 then
				if SobGroup_Empty("BodyguardProximitySOB_"..i) == 1 then
					if random_pseudo(1,3) == 1 then
						SobGroup_SetHealth("SingleBodyguard_SOB"..i, 0)
					end
				else
					SobGroup_RepairSobGroup("SingleBodyguard_SOB"..i, "BodyguardProximitySOB_"..i)
				end
			end
		end
	end
end

function Subtitle_AddAccordingToRace(playerIndex, subtitle, fadeout)
	local ActorIndex = Actor_Talorn
	if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      
    ActorIndex = Actor_Talorn
  elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
  	ActorIndex = Actor_Makaan
  elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
  	ActorIndex = 14
  elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
  	ActorIndex = 13
  elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then
  	ActorIndex = Actor_Keeper
  end
	Subtitle_Add(ActorIndex, subtitle, fadeout)
end

function Subtitle_AddAccordingToRacePrimary(playerIndex, subtitle, fadeout)
	local ActorIndex = Actor_FleetCommand
	if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then      
    ActorIndex = Actor_FleetCommand
  elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
  	ActorIndex = Actor_Makaan
  elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then
  	ActorIndex = 11
  elseif ( Player_GetRace(playerIndex) == Race_Raider ) then
  	ActorIndex = 12
  elseif ( Player_GetRace(playerIndex) == Race_Keeper ) then
  	ActorIndex = Actor_Keeper
  end
	Subtitle_Add(ActorIndex, subtitle, fadeout)
end

function ChangeWarheadForSCUD(ship)
	local totaltypes = 7
	local lasttype = 0
	local overlap = 0
	lasttype = floor(SobGroup_GetHardPointHealth(ship, "warhead")*10)
	local currenttype = 0
	for i = 1, totaltypes, 1 do
		if SobGroup_GetHardPointHealth(ship, "scud_"..i) > 0 then
			currenttype = i
			overlap = overlap + 1
		end
	end
	--determine only one warhead as current type
	if overlap > 1 then
		for i = 1, totaltypes, 1 do
			if SobGroup_GetHardPointHealth(ship, "scud_"..i) > 0 then
				if i ~= lasttype then
					currenttype = i
				end
			end
		end
	end
	--remove old warheads
	if currenttype == 0 then
		if SobGroup_GetHardPointHealth(ship, "scud_1") == 0 then   
			if SobGroup_CanDoAbility(ship, AB_Builder) == 1 then
				SobGroup_CreateSubSystem(ship, "rad_scud_1")
			end
	  end
		SobGroup_SetHardPointHealth(ship, "warhead", 0.1)
		currenttype = 1
		for i = 2, totaltypes, 1 do
			RemoveSubsystemOnShip(ship, "scud_"..i)
		end
	elseif currenttype ~= lasttype then
		for i = 1, totaltypes, 1 do
			if i ~= currenttype then
				RemoveSubsystemOnShip(ship, "scud_"..i)
			end
		end
		SobGroup_SetHardPointHealth(ship, "warhead", currenttype/10)
	end
end

function Rad_DetermineMercUpgrades(ship)
	if SobGroup_CanDoAbility(ship, AB_Builder) == 1 then
		--defense
		local item = "merc_defense"
		local max_level = 10
		Rad_MercUpgradesCoreFunc(ship, item, max_level)
		--attack
		local item = "merc_attack"
		local max_level = 10
		Rad_MercUpgradesCoreFunc(ship, item, max_level)
	end
end

function Rad_MercUpgradesCoreFunc(ship, item, max_level)
	local item_level = 0
	local upgrade_count = 0
	for i=1,max_level do
		if SobGroup_GetHardPointHealth(ship, item..i) > 0 then
			upgrade_count = upgrade_count + 1
			if i >= item_level then
				item_level = i
			end
		end
	end
	if item ~= "merc_defense" then
		local target_health = item_level/max_level
		if target_health == 0 then
			target_health = 0.01
		end
		if abs(SobGroup_GetHardPointHealth(ship, item)-target_health) > 0.01 then
			SobGroup_SetHardPointHealth_Smart(ship, item, target_health)
		end
	end
	for i=1,max_level do
		if upgrade_count == 0 then
			if i == 1 then
				SobGroup_UnRestrictBuildOption(ship, item..i)
			else
				SobGroup_RestrictBuildOption(ship, item..i)
			end
		elseif upgrade_count == 1 then
			if i == item_level+1 then
				SobGroup_UnRestrictBuildOption(ship, item..i)
			else
				SobGroup_RestrictBuildOption(ship, item..i)
			end
		elseif upgrade_count > 1 then
			if SobGroup_GetHardPointHealth(ship, item..i) > 0 and i ~= item_level then
				SobGroup_SetHardPointHealth(ship, item..i, 0)
			end
		end
	end
end

function Rad_DisplayMercUpgradesInTaskBar(ship)
	-- defense
	local item = "merc_defense"
	local item_level = 0
	local max_level = 10
	for i=1,max_level do
		if SobGroup_GetHardPointHealth(ship, item..i) > 0 then
			if i >= item_level then
				item_level = i
			end
		end
	end
	if item_level > 0 then
		UI_SetElementVisible("NewTaskbar", "merc_upgrade_defense", 1)
		UI_SetTextLabelText("NewTaskbar", "merc_upgrade_defensetext", "Defense Lv."..item_level.."\n(+"..floor(16*item_level).."% HP)");
	end
	-- attack
	local item = "merc_attack"
	local item_level = 0
	local max_level = 10
	for i=1,max_level do
		if SobGroup_GetHardPointHealth(ship, item..i) > 0 then
			if i >= item_level then
				item_level = i
			end
		end
	end
	if item_level > 0 then
		UI_SetElementVisible("NewTaskbar", "merc_upgrade_attack", 1)
		UI_SetTextLabelText("NewTaskbar", "merc_upgrade_attacktext", "Attack Lv."..item_level.."\n(+"..floor(33.3*item_level).."% Damage)");
	end
end

function KprSpecialAbilityExecute(ship)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	if Player_GetRace(playerIndex) == Race_Keeper then
		local currenttime = Universe_GameTime()
		--inertia drive
		ManipulateSubsystemAccordingToEnergy_SubstepA(ship, "kpr_ab_inertia", 25)
		if SobGroup_GetHardPointHealth(ship, "kpr_ab_inertia") > 0 then
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_inertia") > 1 then
				SobGroup_SetHardPointHealth(ship, "kpr_ab_inertia", 1)
			end
			if Player_HasResearch(playerIndex, "SpecialPowerInertiaDrive3") == 1 then		--FTL drive
				if Kpr_InertiaDriveFTLTravel(ship, 50000, "inertia drive") == 1 then
					ManipulateSubsystemAccordingToEnergy_SubstepB(ship, "kpr_ab_inertia", 25)
					SobGroup_SetHardPointHealth(ship, "kpr_ab_inertia", 0)
				end
			else		--impulse drive
				if SobGroup_GetHardPointHealth(ship, "kpr_ab_inertia") > 0.951 then		--prevent spawning multiple dummy objects
					ManipulateSubsystemAccordingToEnergy_SubstepB(ship, "kpr_ab_inertia", 25)
					SobGroup_Create("SOB_KprDummyRepulsor")
					SobGroup_Clear("SOB_KprDummyRepulsor")
					Volume_AddSphere("VOL_KprDummyInertia"..currenttime, SobGroup_GetPosition(ship), 0)
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_kpr_ab_inertia", "kpr_Inertia", "SOB_KprDummyRepulsor", "VOL_KprDummyInertia"..currenttime)
					if Player_HasResearch(playerIndex, "SpecialPowerInertiaDrive1") == 1 then		
						SobGroup_ParadeSobGroup("SOB_KprDummyRepulsor", ship, 2)		--directional impulse
					end
					if Player_HasResearch(playerIndex, "SpecialPowerInertiaDrive2") == 1 then
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_15000", 0)		--more impulse
					else
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_32000", 0)
					end
					SobGroup_SobGroupAdd("ECM_immune", "SOB_KprDummyRepulsor")
					SobGroup_Attack(playerIndex, "SOB_KprDummyRepulsor", ship)
					Volume_Delete("VOL_KprDummyInertia"..currenttime)
				end
				if Player_HasResearch(playerIndex, "SpecialPowerInertiaDrive2") == 1 then
					SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_inertia", 0.10)		--faster recharge
				else
					SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_inertia", 0.05)
				end
			end
		end
		--repulsor
		ManipulateSubsystemAccordingToEnergy_SubstepA(ship, "kpr_ab_repulsor", 50)
		if SobGroup_GetHardPointHealth(ship, "kpr_ab_repulsor") > 0 then
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_repulsor") > 1 then
				SobGroup_SetHardPointHealth(ship, "kpr_ab_repulsor", 1)
			end
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_repulsor") > 0.951 then
				ManipulateSubsystemAccordingToEnergy_SubstepB(ship, "kpr_ab_repulsor", 50)
				SobGroup_Create("SOB_KprDummyRepulsor")
				SobGroup_Clear("SOB_KprDummyRepulsor")
				Volume_AddSphere("VOL_KprDummyRepulsor"..currenttime, SobGroup_GetPosition(ship), 0)
				SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_kpr_ab_repulsor", "kpr_Repulsor", "SOB_KprDummyRepulsor", "VOL_KprDummyRepulsor"..currenttime)
				if Player_HasResearch(playerIndex, "SpecialPowerRepulsor3") == 1 then
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Standard", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_15000", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_32000", 0)
				elseif Player_HasResearch(playerIndex, "SpecialPowerRepulsor2") == 1 then
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Standard", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_15000", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_20000", 0)
				elseif Player_HasResearch(playerIndex, "SpecialPowerRepulsor1") == 1 then
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Standard", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_32000", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_20000", 0)
				else
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_15000", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_32000", 0)
					SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_20000", 0)
				end
				SobGroup_SobGroupAdd("ECM_immune", "SOB_KprDummyRepulsor")
				SobGroup_Attack(playerIndex, "SOB_KprDummyRepulsor", ship)
				Volume_Delete("VOL_KprDummyRepulsor"..currenttime)
			end
			if Player_HasResearch(playerIndex, "SpecialPowerRepulsor1") == 1 then
				SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_repulsor", 0.10)		--faster recharge
			else
				SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_repulsor", 0.05)
			end
			--SobGroup_SetHardPointHealth(ship, "kpr_ab_repulsor", 0)
		end
		--gamma ray burst
		ManipulateSubsystemAccordingToEnergy_SubstepA(ship, "kpr_ab_nuke", 75)
		if SobGroup_GetHardPointHealth(ship, "kpr_ab_nuke") > 0 then
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_nuke") > 1 then
				SobGroup_SetHardPointHealth(ship, "kpr_ab_nuke", 1)
			end
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_nuke") > 0.951 then
				ManipulateSubsystemAccordingToEnergy_SubstepB(ship, "kpr_ab_nuke", 75)
				local pos = {0, 0, 0}
				pos = SobGroup_GetPosition(ship)
				local coord = {0, 0, 0}
				local theta = random_pseudo(0,360)
				local beta = random_pseudo(0,360)
				local num = 0
				local burst_count = 25
				if Player_HasResearch(playerIndex, "SpecialPowerGammaRay1") == 1 then
					burst_count = 50
				end
				local burst_lower_range = 2000
				if Player_HasResearch(playerIndex, "SpecialPowerGammaRay2") == 1 then
					burst_lower_range = 4999		--EMP friednly damage at close range will kill the ship's own sensor!
				end
				local attack_target = ship
				local gamma_blade_target_count = 0
				SobGroup_Create("KprGammaBladeNearbyEnemiesSOB_"..ship)
				SobGroup_Clear("KprGammaBladeNearbyEnemiesSOB_"..ship)
				if Player_HasResearch(playerIndex, "SpecialPowerGammaRay3") == 1 then		--acquire targets for gamma blades
					SobGroup_FillProximitySobGroup("KprGammaBladeNearbyEnemiesSOB_"..ship, "enemies"..playerIndex, ship, 300000)
					gamma_blade_target_count = SobGroup_SplitGroupReference("SingleGammaBladeTarget_SOB", "KprGammaBladeNearbyEnemiesSOB_"..ship, "Player_Ships"..playerIndex, SobGroup_Count("KprGammaBladeNearbyEnemiesSOB_"..ship))
				end
				while num < burst_count do
	        theta = random_pseudo(0,360)
					beta = random_pseudo(0,360)
					local radius = random_pseudo(burst_lower_range,5000)
					coord[1] = pos[1] + radius*cos(theta)*cos(beta)
					coord[2] = pos[2] + radius*cos(theta)*sin(beta)
					coord[3] = pos[3] + radius*sin(theta)
					SobGroup_Create("SOB_KprDummyRepulsor")
					SobGroup_Clear("SOB_KprDummyRepulsor")
					Volume_AddSphere("VOL_KprDummyGamma"..currenttime..num, coord, 0)
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_kpr_ab_nuke", "kpr_Gamma", "SOB_KprDummyRepulsor", "VOL_KprDummyGamma"..currenttime..num)
					if Player_HasResearch(playerIndex, "SpecialPowerGammaRay3") == 1 then		--gamma blades + gamma bursts
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_15000", 0)
						if gamma_blade_target_count > 0 then
							attack_target = "SingleGammaBladeTarget_SOB"..random_pseudo(0,gamma_blade_target_count-1)		--random enemy targets for gamma blades
						end
					elseif Player_HasResearch(playerIndex, "SpecialPowerGammaRay2") == 1 then
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_15000", 0)
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_20000", 0)
					else
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_32000", 0)
						SobGroup_ChangePower("SOB_KprDummyRepulsor", "Weapon_Gravity_20000", 0)
					end
					SobGroup_Attack(playerIndex, "SOB_KprDummyRepulsor", attack_target)
					Volume_Delete("VOL_KprDummyGamma"..currenttime..num)
					num = num + 1
				end
			end
			if Player_HasResearch(playerIndex, "SpecialPowerGammaRay2") == 1 then
				SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_nuke", 0.10)		--faster recharge
			else
				SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_nuke", 0.05)
			end
			--SobGroup_SetHardPointHealth(ship, "kpr_ab_nuke", 0)
		end
		--anti missile (subspace normalizer)
		ManipulateSubsystemAccordingToEnergy_SubstepA(ship, "kpr_ab_am", 100)
		if SobGroup_GetHardPointHealth(ship, "kpr_ab_am") > 0 then
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_am") > 1 then
				SobGroup_SetHardPointHealth(ship, "kpr_ab_am", 1)
			end
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_am") > 0.901 then
				ManipulateSubsystemAccordingToEnergy_SubstepB(ship, "kpr_ab_am", 100)
				SobGroup_Create("SOB_KprDummyAM")
				SobGroup_Clear("SOB_KprDummyAM")
				Volume_AddSphere("VOL_KprDummyAM"..currenttime, SobGroup_GetPosition(ship), 0)
				SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_kpr_ab_am", "kpr_AM", "SOB_KprDummyAM", "VOL_KprDummyAM"..currenttime)
				local y = 0
				if Player_HasResearch(playerIndex, "SpecialPowerDimensionAttack3") == 1 then
					y = 3
				elseif Player_HasResearch(playerIndex, "SpecialPowerDimensionAttack2") == 1 then
					y = 2
				elseif Player_HasResearch(playerIndex, "SpecialPowerDimensionAttack1") == 1 then
					y = 1
				end
				if y > 0 then		--launch dimension attack (NOTE: large collision box will cause 000000c crash, so use invisible weapons instead)
					--create attack target
					SobGroup_Create("SOB_KprDummyAttackTarget")
					SobGroup_Clear("SOB_KprDummyAttackTarget")
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_attacktarget_100000", "kpr_DummyAttackTarget", "SOB_KprDummyAttackTarget", "VOL_KprDummyAM"..currenttime)
					SobGroup_ParadeSobGroup("SOB_KprDummyAttackTarget", ship, 2)
					SobGroup_Create("SOB_KprDummyAttackTarget2")
					SobGroup_Clear("SOB_KprDummyAttackTarget2")
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_attacktarget_100000", "kpr_DummyAttackTarget", "SOB_KprDummyAttackTarget2", "VOL_KprDummyAM"..currenttime)
					SobGroup_ParadeSobGroup("SOB_KprDummyAttackTarget2", "SOB_KprDummyAttackTarget", 2)		--100000m not enough for lv3 2D foil, need 200000m
					SobGroup_SetHealth("SOB_KprDummyAttackTarget", 0)
					--create dimension attacker
					SobGroup_Create("SOB_KprDummyDimensionAttacker")
					SobGroup_Clear("SOB_KprDummyDimensionAttacker")
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_DimensionAttack_"..y, "kpr_DummyDimensionAttacker", "SOB_KprDummyDimensionAttacker", "VOL_KprDummyAM"..currenttime)
					SobGroup_ParadeSobGroup("SOB_KprDummyDimensionAttacker", ship, 2)		--1 will make it spawn with collision avoidance (spawned sideways)
					--create 2D plane for dimension attacker (BUG CITY!!!)
					--SobGroup_Create("SOB_KprDimensionAttack_"..y)
					--SobGroup_Clear("SOB_KprDimensionAttack_"..y)
					--SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_DimensionAttack_"..y, "kpr_DimensionAttack", "SOB_KprDimensionAttack_"..y, "VOL_KprDummyAM"..currenttime)
					--SobGroup_DockSobGroupInstant("SOB_KprDimensionAttack_"..y, "SOB_KprDummyDimensionAttacker")
					--SobGroup_DockSobGroupAndStayDocked_Smart("SOB_KprDimensionAttack_"..y, "SOB_KprDummyDimensionAttacker")
					--initiate dimension attack
					SobGroup_SobGroupAdd("ECM_immune", "SOB_KprDummyDimensionAttacker")
					SobGroup_Attack(playerIndex, "SOB_KprDummyDimensionAttacker", "SOB_KprDummyAttackTarget2")
					--SobGroup_MoveToSobGroup("SOB_KprDummyDimensionAttacker", "SOB_KprDummyAttackTarget")
					--SobGroup_Kamikaze("SOB_KprDummyDimensionAttacker", "SOB_KprDummyAttackTarget")
					SobGroup_SetTactics("SOB_KprDummyDimensionAttacker", AggressiveTactics)
					SobGroup_SetSpeed("SOB_KprDummyDimensionAttacker", 10)
					SobGroup_SetInvulnerability("SOB_KprDummyDimensionAttacker", 1)
					--SobGroup_SetInvulnerability("SOB_KprDimensionAttack_"..y, 1)
					SobGroup_SetInvulnerability("SOB_KprDummyAttackTarget2", 1)
				end
				SobGroup_Attack(playerIndex, "SOB_KprDummyAM", ship)		--anti-missile burst
				Volume_Delete("VOL_KprDummyAM"..currenttime)
			end
			if Player_HasResearch(playerIndex, "SpecialPowerDimensionAttack2") == 1 then
				SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_am", 0.20)		--faster recharge
			else
				SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_am", 0.10)
			end
			--SobGroup_SetHardPointHealth(ship, "kpr_ab_am", 0)
		end
		--black hole
		ManipulateSubsystemAccordingToEnergy_SubstepA(ship, "kpr_ab_blackhole", 125)
		if SobGroup_GetHardPointHealth(ship, "kpr_ab_blackhole") > 0 then
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_blackhole") > 1 then
				SobGroup_SetHardPointHealth(ship, "kpr_ab_blackhole", 1)
			end
			if SobGroup_GetHardPointHealth(ship, "kpr_ab_blackhole") > 0.991 then
				ManipulateSubsystemAccordingToEnergy_SubstepB(ship, "kpr_ab_blackhole", 125)
				SobGroup_Create("SOB_KprDummyBlackhole")
				SobGroup_Clear("SOB_KprDummyBlackhole")
				Volume_AddSphere("VOL_KprDummyBlackhole"..currenttime, SobGroup_GetPosition(ship), 0)
				if Player_HasResearch(playerIndex, "SpecialPowerBlackHole3") == 1 then	--uber black hole!
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_kpr_ab_blackholeUBER", "kpr_blackhole", "SOB_KprDummyBlackhole", "VOL_KprDummyBlackhole"..currenttime)
					SobGroup_ParadeSobGroup("SOB_KprDummyBlackhole", ship, 2)
				else
					SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_dummy_kpr_ab_blackhole", "kpr_blackhole", "SOB_KprDummyBlackhole", "VOL_KprDummyBlackhole"..currenttime)
					if Player_HasResearch(playerIndex, "SpecialPowerBlackHole2") == 1 then
						SobGroup_ChangePower("SOB_KprDummyBlackhole", "Weapon_Gravity_15000", 0)
					else
						SobGroup_ChangePower("SOB_KprDummyBlackhole", "Weapon_Gravity_32000", 0)
					end
				end
				SobGroup_SobGroupAdd("ECM_immune", "SOB_KprDummyBlackhole")
				SobGroup_Attack(playerIndex, "SOB_KprDummyBlackhole", ship)
				SobGroup_SetInvulnerability("SOB_KprDummyBlackhole", 1)		--prevent the blackhole from being destroyed by the newly added ship hulks
				Volume_Delete("VOL_KprDummyBlackhole"..currenttime)
			end
			SobGroup_DestroySubsystemWithTime(ship, "kpr_ab_blackhole", 0.01)		--invariant regardless of research, always recharges slowly
		end
		--light granule
		ManipulateSubsystemAccordingToEnergy(ship, "kpr_ab_particle", 150)
		if SobGroup_GetHardPointHealth(ship, "kpr_ab_particle") > 0 then
			SobGroup_Create("SOB_KprDummyLight")
			SobGroup_Clear("SOB_KprDummyLight")
			Volume_AddSphere("VOL_KprDummyLight"..currenttime, SobGroup_GetPosition(ship), 0)
			SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_lightgranule", "kpr_Light", "SOB_KprDummyLight", "VOL_KprDummyLight"..currenttime)
			if Player_HasResearch(playerIndex, "SpecialPowerLightGranule2") == 1 then
				SobGroup_SpawnNewShipInSobGroup(playerIndex, "kpr_lightgranule", "kpr_Light", "SOB_KprDummyLight", "VOL_KprDummyLight"..currenttime)	--second shot
			end
			Volume_Delete("VOL_KprDummyLight"..currenttime)
			SobGroup_SetHardPointHealth(ship, "kpr_ab_particle", 0)
		end


		--AI function
		if CPU_Exist_Smart(playerIndex) == 1 then
			local total_abilities = Table_CountElements(Kpr_SpecialPower_list)
			local ability_idx = random_pseudo(1,total_abilities)
			local ability_name = Kpr_SpecialPower_list[ability_idx]
			local ability_en = Kpr_SpecialPower_Energy_list[ability_idx]
			if LastpowerListStored[playerIndexList] >= LastpowerListMax[playerIndexList]/(CPULODvalueList[playerIndexList]+1) + ability_en*random_pseudo(0,10) and	 --energy requirement
			honorList[playerIndexList] >= Kpr_SpecialPower_Rank_list[ability_idx] and		--rank requirement
			SobGroup_GetHardPointHealth(ship, ability_name) <= 0 and 
			SobGroup_IsBuilding(ship, ability_name) == 0 and 
			SobGroup_CanDoAbility(ship, AB_Builder) == 1 and
			SobGroup_AreAllInRealSpace(ship) == 1 and
			SobGroup_IsDocked(ship) == 0 and
			Player_GetRU(playerIndex) > 4000 - 1000*CPULODvalueList[playerIndexList] then		--RU requirement
				SobGroup_Create("KprAINearbyEnemiesSOB_"..ship)
				SobGroup_Clear("KprAINearbyEnemiesSOB_"..ship)
				SobGroup_FillProximitySobGroup("KprAINearbyEnemiesSOB_"..ship, "enemies"..playerIndex, ship, 5000)
				SobGroup_Create("KprAINearbyFriendliesSOB_"..ship)
				SobGroup_Clear("KprAINearbyFriendliesSOB_"..ship)
				SobGroup_FillProximitySobGroup("KprAINearbyFriendliesSOB_"..ship, "AllToHelp"..playerIndex, ship, 5000)
				if ability_name == "kpr_ab_inertia" then
					local techlevel = 0
					for y=1,3,1 do
						if Player_HasResearch(playerIndex, "SpecialPowerInertiaDrive"..y) == 1 then
							techlevel = techlevel + 1
						end
					end
					if (SobGroup_AreAnyOfTheseTypes(ship, "kpr_shipyard_old, kpr_carrier") == 0 and
					SobGroup_IsDoingAbility("KprAINearbyEnemiesSOB_"..ship, AB_Attack) == 1 or
					techlevel >= 3 ) and
					SobGroup_Count("KprAINearbyEnemiesSOB_"..ship) >= random_pseudo(4,6) and
					SobGroup_HealthPercentage(ship) < 0.01*random_pseudo(5,15) and
					SobGroup_UnderAttack(ship) == 1 and
					Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_kpr_ab_inertia") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_warptarget_100") <= random_pseudo(1,2+CPULODvalueList[playerIndexList]) then
						Kpr_AIUseSpecialPowerWithCost(ship, ability_idx)
					end
				elseif ability_name == "kpr_ab_repulsor" then
					if SobGroup_AreAnyOfTheseTypes(ship, "kpr_shipyard_old, kpr_carrier") == 0 and
					SobGroup_UnderAttack(ship) == 1 and
					SobGroup_Count("KprAINearbyEnemiesSOB_"..ship) >= random_pseudo(8,12) and
					SobGroup_IsDoingAbility("KprAINearbyEnemiesSOB_"..ship, AB_Attack) == 1 and
					SobGroup_Count("KprAINearbyFriendliesSOB_"..ship) <= random_pseudo(1,3) and
					SobGroup_AreAnyOfTheseTypes("KprAINearbyFriendliesSOB_"..ship, "kpr_shipyard_old") == 0 and
					SobGroup_HealthPercentage(ship) < 0.01*random_pseudo(35,75) and
					Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_kpr_ab_repulsor") <= random_pseudo(1,2+CPULODvalueList[playerIndexList]) then
						Kpr_AIUseSpecialPowerWithCost(ship, ability_idx)
					end
				elseif ability_name == "kpr_ab_nuke" then
					local techlevel = 0
					for y=1,3,1 do
						if Player_HasResearch(playerIndex, "SpecialPowerGammaRay"..y) == 1 then
							techlevel = techlevel + 1
						end
					end
					if (SobGroup_UnderAttack(ship) == 1 and
					SobGroup_Count("KprAINearbyEnemiesSOB_"..ship) >= random_pseudo(10,14) and
					SobGroup_Count("KprAINearbyFriendliesSOB_"..ship) <= random_pseudo(3,5) and
					SobGroup_HealthPercentage(ship) >= 0.01*random_pseudo(10,25) or 
					techlevel >= 3 and
					SobGroup_IsGroupNearybyExcludingSelf(ship, "minetargetenemies"..playerIndex, 100000) == 1 ) and
					Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_kpr_ab_nuke") <= random_pseudo(1,2+CPULODvalueList[playerIndexList]) then
						Kpr_AIUseSpecialPowerWithCost(ship, ability_idx)
					end
				elseif ability_name == "kpr_ab_am" then
					local techlevel = 0
					for y=1,3,1 do
						if Player_HasResearch(playerIndex, "SpecialPowerDimensionAttack"..y) == 1 then
							techlevel = techlevel + 1
						end
					end
					if (SobGroup_UnderAttack(ship) == 1 and
					SobGroup_Count("KprAINearbyEnemiesSOB_"..ship) >= random_pseudo(1,3) and
					SobGroup_IsDoingAbility("KprAINearbyEnemiesSOB_"..ship, AB_Attack) == 1 and
					SobGroup_IsGroupNearybyExcludingSelf(ship, "nuclearbombs", 5500) == 1 or
					techlevel >= 3 and
					SobGroup_IsGroupNearybyExcludingSelf(ship, "minetargetenemies"..playerIndex, 8000) == 1 and
					SobGroup_IsDoingAbility(ship, AB_Attack) == 1 ) and
					Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_kpr_ab_am") <= random_pseudo(2,3+CPULODvalueList[playerIndexList]) then
						Kpr_AIUseSpecialPowerWithCost(ship, ability_idx)
					end
				elseif ability_name == "kpr_ab_blackhole" then
					if SobGroup_Count("KprAINearbyEnemiesSOB_"..ship) >= random_pseudo(8,10) and
					SobGroup_IsDoingAbility("KprAINearbyEnemiesSOB_"..ship, AB_Attack) == 1 and
					SobGroup_Count("KprAINearbyFriendliesSOB_"..ship) <= random_pseudo(3,5) and
					SobGroup_HealthPercentage(ship) > 0.01*random_pseudo(70,85) and
					Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_kpr_ab_blackhole") + Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_dummy_kpr_ab_blackholeUBER") <= random_pseudo(0,1+CPULODvalueList[playerIndexList]) then
						Kpr_AIUseSpecialPowerWithCost(ship, ability_idx)
					end
				elseif ability_name == "kpr_ab_particle" then
					local techlevel = 0
					for y=1,3,1 do
						if Player_HasResearch(playerIndex, "SpecialPowerLightGranule"..y) == 1 then
							techlevel = techlevel + 1
						end
					end
					if SobGroup_IsGroupNearybyExcludingSelf(ship, "minetargetenemies"..playerIndex, 10000+2500*CPULODvalueList[playerIndexList]+(techlevel^2*10000)) == 1 and
					Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "kpr_lightgranule") <= random_pseudo(1,2+CPULODvalueList[playerIndexList]) then
						Kpr_AIUseSpecialPowerWithCost(ship, ability_idx)
					end
				end
			end
		end
	
	end
end

Kpr_SpecialPower_list = {"kpr_ab_inertia", "kpr_ab_repulsor", "kpr_ab_nuke", "kpr_ab_am", "kpr_ab_blackhole", "kpr_ab_particle"}
Kpr_SpecialPower_Energy_list = {25, 50, 75, 100, 125, 150}
Kpr_SpecialPower_Rank_list = {30, 80, 150, 240, 350, 480}

function Kpr_AIUseSpecialPowerWithCost(ship, AbilityIndex)
	local playerIndex = SobGroup_OwnedBy(ship)
	SobGroup_CreateSubSystem(ship, Kpr_SpecialPower_list[AbilityIndex])
	local cost = AbilityIndex*1000
	if Player_GetRU(playerIndex) - cost >= 0 then
		Player_SetRU(playerIndex, Player_GetRU(playerIndex) - cost)
	else
		Player_SetRU(playerIndex, 0)
	end
end

KprDummyToKill = {"kpr_dummy_attacktarget_100000", "kpr_dummy_DimensionAttack_3", "kpr_dummy_DimensionAttack_2", "kpr_dummy_DimensionAttack_1", "kpr_dummy_warptarget_1000", "kpr_dummy_warptarget_500", "kpr_dummy_warptarget_100", "kpr_dummy_kpr_ab_blackholeUBER", "kpr_dummy_kpr_ab_inertia", "kpr_dummy_kpr_ab_repulsor", "kpr_dummy_kpr_ab_nuke", "kpr_dummy_kpr_ab_am", "kpr_dummy_kpr_ab_blackhole", "kpr_lightgranule"}
function Kpr_KillDummyObjects(playerIndex)		--light granule is also here, which is not a dummy object...
	local i = 0
	repeat
		i = i +1
		SobGroup_Create("KprDummy_Total"..playerIndex)
		SobGroup_Clear("KprDummy_Total"..playerIndex)
		SobGroup_FillShipsByType("KprDummy_Total"..playerIndex, "Player_Ships"..playerIndex, KprDummyToKill[i])
		local numships = SobGroup_SplitGroupReference("SingleKillDummyKpr_SOB", "KprDummy_Total"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("KprDummy_Total"..playerIndex))
		local ftl_done = 0
		for counter = 0, numships - 1, 1 do
			if SobGroup_Empty("SingleKillDummyKpr_SOB"..counter) == 0 then
				if KprDummyToKill[i] == "kpr_lightgranule" then
					if SobGroup_HealthPercentage("SingleKillDummyKpr_SOB"..counter) > 0.97 and Player_HasResearch(playerIndex, "SpecialPowerLightGranule1") == 1 then
						SobGroup_SetHealth("SingleKillDummyKpr_SOB"..counter, 1)		--infinite range
					end
					if SobGroup_HealthPercentage("SingleKillDummyKpr_SOB"..counter) > 0 and Player_HasResearch(playerIndex, "SpecialPowerLightGranule3") == 1 then
						SobGroup_SetInvulnerability("SingleKillDummyKpr_SOB"..counter, 1)		--planetary cleansing
					end
					--FTL travel
					if Player_HasResearch(playerIndex, "SpecialPowerLightGranule3") == 1 then
						local checkrange = 5000
						local checkstep = 1000
						local nextrange = checkrange
						for x=checkrange, 50000, checkstep do
							if SobGroup_IsGroupNearybyExcludingSelf("SingleKillDummyKpr_SOB"..counter, "minetargetenemies"..playerIndex, x) == 0 then
								checkrange = x
							else
								break
							end
						end
						if checkrange > 5000 and sqrt(SobGroup_GetEquivalentSpeed("SingleKillDummyKpr_SOB"..counter)) > 1200 then
							local limiter = 3
							if random_pseudo(0,numships) <= ceil(numships/(limiter+ftl_done)) then	--CPU saver
								--print("lighttravelling...")
								ftl_done = ftl_done + Kpr_InertiaDriveFTLTravel("SingleKillDummyKpr_SOB"..counter, checkrange, "light granule")		--use FTL travel function
							end
						end
					end
					for i = 1 ,4 do
						FX_StopEvent("SingleKillDummyKpr_SOB"..counter, "glow"..random_pseudo(1,4))
						FX_StartEvent("SingleKillDummyKpr_SOB"..counter, "glow"..random_pseudo(1,4))
					end
				else		--other dummy objects
					local health = SobGroup_GetHardPointHealth("SingleKillDummyKpr_SOB"..counter, "lasthealth")
					if health > 1 then
						health = 1
					end
					local interval_hp = 0.02
					if KprDummyToKill[i] == "kpr_dummy_kpr_ab_blackhole" or KprDummyToKill[i] == "kpr_dummy_kpr_ab_blackholeUBER" then
						interval_hp = 0.01
						if Player_HasResearch(playerIndex, "SpecialPowerBlackHole1") == 0 then
							interval_hp = 0.02
						end
					elseif KprDummyToKill[i] == "kpr_dummy_attacktarget_100000" == 1 then
						interval_hp = 0.01
					elseif String_ContainsNameBeginningAt(KprDummyToKill[i], "kpr_dummy_warptarget_") == 1 then		--kill FTL warp dummy objects fast, because they are spawned in huge numbers
						interval_hp = 0.6
						--print("destroying warp dummy objects")
					elseif KprDummyToKill[i] == "kpr_dummy_kpr_ab_inertia" then
						interval_hp = 0.2
					elseif KprDummyToKill[i] == "kpr_dummy_kpr_ab_nuke" then
						interval_hp = 0.1
					elseif KprDummyToKill[i] == "kpr_dummy_DimensionAttack_1" or KprDummyToKill[i] == "kpr_dummy_DimensionAttack_2" then
						interval_hp = 0.02
					elseif KprDummyToKill[i] == "kpr_dummy_DimensionAttack_3" then
						interval_hp = 0.01
					end
					if health - interval_hp < 0 then
						--SobGroup_Despawn("SingleKillDummyKpr_SOB"..counter)
						SobGroup_SetHealth("SingleKillDummyKpr_SOB"..counter, 0)
					else
						SobGroup_SetHardPointHealth("SingleKillDummyKpr_SOB"..counter, "lasthealth", health-interval_hp)
						--exceptions, forced stop + FX
						if KprDummyToKill[i] == "kpr_dummy_kpr_ab_blackhole" then
							if Player_HasResearch(playerIndex, "SpecialPowerBlackHole2") == 1 then
								FX_StartEvent("SingleKillDummyKpr_SOB"..counter, "disk")
							else
								FX_StartEvent("SingleKillDummyKpr_SOB"..counter, "disksmall")
							end
							if SobGroup_IsDoingAbility("SingleKillDummyKpr_SOB"..counter, AB_Attack) == 0 then
								--SobGroup_Despawn("SingleKillDummyKpr_SOB"..counter)
								SobGroup_SetHealth("SingleKillDummyKpr_SOB"..counter, 0)
							end
						elseif KprDummyToKill[i] == "kpr_dummy_kpr_ab_blackholeUBER" then
							--FX_StartEvent("SingleKillDummyKpr_SOB"..counter, "disk")	--use fake weapon animation instead of this function
							if SobGroup_IsDoingAbility("SingleKillDummyKpr_SOB"..counter, AB_Attack) == 0 then
								--SobGroup_Despawn("SingleKillDummyKpr_SOB"..counter)
								SobGroup_SetHealth("SingleKillDummyKpr_SOB"..counter, 0)
							end
						elseif KprDummyToKill[i] == "kpr_dummy_DimensionAttack_1" or KprDummyToKill[i] == "kpr_dummy_DimensionAttack_2" or KprDummyToKill[i] == "kpr_dummy_DimensionAttack_3" then
							FX_StartEvent("SingleKillDummyKpr_SOB"..counter, "disk")
							if KprDummyToKill[i] == "kpr_dummy_DimensionAttack_3" then
								if SobGroup_FillProximitySobGroupExceptSelf("temp_FriendlyNearDimensionAttacker", "allies"..playerIndex, "SingleKillDummyKpr_SOB"..counter, 10000) == 1 then
									local numfriendlies = SobGroup_SplitGroupReference("SingleHealNearbyFriendly_SOB", "temp_FriendlyNearDimensionAttacker", "Player_Ships"..playerIndex, SobGroup_Count("temp_FriendlyNearDimensionAttacker"))
									for friendly = 0, numfriendlies - 1, 1 do
										if SobGroup_Empty("SingleHealNearbyFriendly_SOB"..friendly) == 0 then
											SobGroup_SetHealth_UpgradeOnly("SingleHealNearbyFriendly_SOB"..friendly, 1)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	until (not KprDummyToKill[i + 1])
end

function Kpr_InertiaDriveFTLTravel(ship, travel_distance, travel_mode)	--Any target ship without parade formation causes crash! A dummy object with parade formation is needed to do this!
	local warpcomplete = 0
	local playerIndex = SobGroup_OwnedBy(ship)
	if SobGroup_AreAllInRealSpace(ship) == 1 and SobGroup_IsDocked(ship) == 0 and SobGroup_HealthPercentage(ship) > 0 and SobGroup_InWorldBound(ship, 1) == 1 then
		local FTL_stop = 0
		local step_distance = 500
		if travel_mode ~= nil then
			if travel_mode == "light granule" then
				step_distance = 500		--100 was too CPU intensive
			elseif travel_mode == "inertia drive" then
				step_distance = 1000
			end
		end
		local travel_steps = travel_distance/step_distance
		local completed_steps = 0
		local warp_target_type = "kpr_dummy_warptarget_100"	--the first step is always 100 because all the progenitor jumpers have it in the parade data
		local dummy_spawn_target = ship
		SobGroup_Create("SOB_KprAIDummyFTLWarpTarget_Last")
		SobGroup_Create("SOB_KprAIDummyFTLWarpTarget")
		--start FTL travel
		while FTL_stop == 0 and completed_steps < travel_steps do
			if completed_steps > 0 then
				warp_target_type = "kpr_dummy_warptarget_"..step_distance
				dummy_spawn_target = "SOB_KprAIDummyFTLWarpTarget_Last"
			end
			local cotinue_next = 0
			SobGroup_Clear("SOB_KprAIDummyFTLWarpTarget")
			Volume_AddSphere("VOL_KprAIDummyFTLWarpTarget", SobGroup_GetPosition(dummy_spawn_target), 1000)
			SobGroup_SpawnNewShipInSobGroup(playerIndex, warp_target_type, "WarpTarget", "SOB_KprAIDummyFTLWarpTarget", "VOL_KprAIDummyFTLWarpTarget")
			if SobGroup_HealthPercentage("SOB_KprAIDummyFTLWarpTarget") > 0 and SobGroup_InWorldBound("SOB_KprAIDummyFTLWarpTarget", 1) == 1 then
				SobGroup_ParadeSobGroup("SOB_KprAIDummyFTLWarpTarget", dummy_spawn_target, 2)
				FX_StartEvent_Smart("SOB_KprAIDummyFTLWarpTarget", "disk")		--FTL drive FX
				cotinue_next = 1
				completed_steps = completed_steps + 1
			else		--FTL travel forced stop
				FTL_stop = 1
				SobGroup_SetHealth("SOB_KprAIDummyFTLWarpTarget", 0)
			end
			if cotinue_next == 1 and FTL_stop == 0 then
				SobGroup_Clear("SOB_KprAIDummyFTLWarpTarget_Last")
				SobGroup_SobGroupAdd("SOB_KprAIDummyFTLWarpTarget_Last", "SOB_KprAIDummyFTLWarpTarget")
			end
			Volume_Delete("VOL_KprAIDummyFTLWarpTarget")
		end
		if completed_steps > 0 then
			if SobGroup_Empty("SOB_KprAIDummyFTLWarpTarget_Last") == 0 then
				SobGroup_ParadeSobGroup(ship, "SOB_KprAIDummyFTLWarpTarget_Last", 2)
			else
				SobGroup_ParadeSobGroup(ship, "SOB_KprAIDummyFTLWarpTarget", 2)
			end
			warpcomplete =  1
		end
	end
	return warpcomplete
end

function Kpr_KillSmallPlasmaBalls(playerIndex)
	SobGroup_Create("KprSmallPlasmaBalls_Total"..playerIndex)
	SobGroup_FillShipsByType("KprSmallPlasmaBalls_Total"..playerIndex, "Player_Ships"..playerIndex, "kpr_lightgranule_tiny")
	local numships = SobGroup_SplitGroupReference("SingleKillSmallPlasma_SOB", "KprSmallPlasmaBalls_Total"..playerIndex, "Player_Ships"..playerIndex, SobGroup_Count("KprSmallPlasmaBalls_Total"..playerIndex))
	for counter = 0, numships - 1, 1 do
		if SobGroup_Empty("SingleKillSmallPlasma_SOB"..counter) == 0 then
			if SobGroup_IsDoingAbility("SingleKillSmallPlasma_SOB"..counter, AB_Attack) == 1 and SobGroup_InWorldBound("SingleKillSmallPlasma_SOB"..counter, 1) == 1 then
				FX_StopEvent("SingleKillSmallPlasma_SOB"..counter, "glow1")
				FX_StartEvent_Smart("SingleKillSmallPlasma_SOB"..counter, "glow1")
				SobGroup_SetSpeed("SingleKillSmallPlasma_SOB"..counter, random_pseudo(200,500)/100)
			else
				SobGroup_SetHealth("SingleKillSmallPlasma_SOB"..counter, 0)
			end
		end
	end
end

function SetAfterburnerForShip(ship, speed, research, FX, has_en)
	local ai_reasearch = research
	if research == "FrigateAfterburner" then
		ai_reasearch = "FrigateAfterburnerAI"
	elseif research == "CapitalAfterburner" then
		ai_reasearch = "CapitalAfterburnerAI"
	end
	if Player_HasResearch(SobGroup_OwnedBy(ship), research) == 1 or Player_HasResearch(SobGroup_OwnedBy(ship), ai_reasearch) == 1 then
		if SobGroup_GetEquivalentSpeed(ship) >= speed then
			SobGroup_SetMaxSpeedMultiplier(ship, 1)
			FX_StartEvent_Smart(ship, FX)
			if has_en == 1 then
				powerList[SobGroup_OwnedBy(ship) + 1] = powerList[SobGroup_OwnedBy(ship) + 1] - 1
				powerListManager[SobGroup_OwnedBy(ship) + 1].move = powerListManager[SobGroup_OwnedBy(ship) + 1].move - 1
				SobGroup_SetHardPointHealth_Smart(ship, "en", 0.5+((SobGroup_GetHardPointHealth(ship, "en")-0.5)*1000-1)/1000)
			end
		else
			SobGroup_SetMaxSpeedMultiplier(ship, 0.5)
		end
	else
		SobGroup_SetMaxSpeedMultiplier(ship, 0.5)
	end
end

function SobGroup_DestroySubsystemWithTime(ship, subsystem, damage)
	local sub_hp = SobGroup_GetHardPointHealth(ship, subsystem)
	if sub_hp - damage > 0 then
		SobGroup_SetHardPointHealth_Smart(ship, subsystem, sub_hp - damage)
	else
		SobGroup_SetHardPointHealth(ship, subsystem, 0)
	end
end

function SobGroup_GetEquivalentSpeed(ship)	--returns squared speed value. to get real values in m/s, take its square root
	local playerIndex = SobGroup_OwnedBy(ship)
	local actual_speed = SobGroup_GetActualSpeed(ship)
	local relative_speed = actual_speed
	local speed_up = 1
	local speed_down = 0
	if unitbehavior >=0 and unitbehavior<=1 then
		speed_up = unitbehavior
	elseif unitbehavior == -1 then			--slow
		speed_down = 0.4
	elseif unitbehavior == -2 then			--slower
		speed_down = 0.7
	elseif unitbehavior == -3 then			--slowest
		speed_down = 1
	end
	local max_multiplier = 9  --defined in tuning.lua 
	local num_multiplier = 0
	if unitbehavior < 0 then	--speed reduced
		--for iPlayerIndex = 0, Universe_PlayerCount() - 1 do
	  --  if Player_IsAlive(iPlayerIndex) == 1 then
	  --    if AreAllied(iPlayerIndex, playerIndex) == 0 or playerIndex == iPlayerIndex then
	  --     	if SobGroup_Empty("supporter"..iPlayerIndex) == 0 then
	  --     		if SobGroup_GetHardPointHealth("supporter"..iPlayerIndex, "unitbehavior_downgrade") > 0 then
	  --     			num_multiplier = num_multiplier + 1
	  --     		end
	  --     	end
	  --    end
	  --  end
	  --end
	  local slowest_factor = 0.3		--defined in unitbehavior_downgrade.subs
	  --if num_multiplier > 0 then
	  	local calculated_speed = actual_speed/(slowest_factor*speed_down+1-speed_down)^2
	  	--if calculated_speed < 1/max_multiplier then
	  	--	calculated_speed = 1/max_multiplier
	  	--end
	  	relative_speed = calculated_speed
	  --end
	elseif unitbehavior > 0 then	--speed increased
		--for iPlayerIndex = 0, Universe_PlayerCount() - 1 do
	  --  if Player_IsAlive(iPlayerIndex) == 1 then
	  --    if AreAllied(iPlayerIndex, playerIndex) == 0 or playerIndex == iPlayerIndex then
	  --     	if SobGroup_Empty("supporter"..iPlayerIndex) == 0 then
	  --     		if SobGroup_GetHardPointHealth("supporter"..iPlayerIndex, "unitbehavior") > 0 then
	  --     			num_multiplier = num_multiplier + 1
	  --     		end
	  --     	end
	  --    end
	  --  end
	  --end
	  local fastest_factor = 1.2	--1.2*1.15		--defined in unitbehavior.subs
	  --if num_multiplier > 0 then
	  	local calculated_speed = actual_speed/(fastest_factor*speed_up-1+speed_up)^2
	  	--if calculated_speed > max_multiplier then
	  	--	calculated_speed = max_multiplier
	  	--end
	  	relative_speed = calculated_speed
	  --end
	end
	return relative_speed
end

function ManipulateSubsystemAccordingToEnergy(ship, buildoption, energy)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	if LastpowerListStored[playerIndexList] < energy then
		SobGroup_RestrictBuildOption(ship, buildoption)
	else
		SobGroup_UnRestrictBuildOption(ship, buildoption)
	end
	if SobGroup_GetHardPointHealth(ship, buildoption) > 0 then
		if LastpowerListStored[playerIndexList] - energy < 0 then
			powerListStored[playerIndex + 1] = 0
			powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc - LastpowerListStored[playerIndexList]
		else
			powerListStored[playerIndex + 1] = powerListStored[playerIndex + 1] - energy
			powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc - energy
		end
	end
end

function ManipulateSubsystemAccordingToEnergy_SubstepA(ship, buildoption, energy)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	if LastpowerListStored[playerIndexList] < energy then
		SobGroup_RestrictBuildOption(ship, buildoption)
	else
		SobGroup_UnRestrictBuildOption(ship, buildoption)
	end
end

function ManipulateSubsystemAccordingToEnergy_SubstepB(ship, buildoption, energy)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	if SobGroup_GetHardPointHealth(ship, buildoption) > 0 then
		if LastpowerListStored[playerIndexList] - energy < 0 then
			powerListStored[playerIndex + 1] = 0
			powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc - LastpowerListStored[playerIndexList]
		else
			powerListStored[playerIndex + 1] = powerListStored[playerIndex + 1] - energy
			powerListManager[playerIndex+1].misc = powerListManager[playerIndex+1].misc - energy
		end
	end
end

function ManipulateSubsystemAccordingToHonourPoints(ship, buildoption, honour)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	if honorList[playerIndexList] < honour then
		SobGroup_RestrictBuildOption(ship, buildoption)
	else
		SobGroup_UnRestrictBuildOption(ship, buildoption)
	end
end

RadResearchRank = {"isLieutenant", "isCommander", "isCaptain", "isCommodore", "isAdmiral", "isFleetAdmiral"}
function Rad_GetPlayerRank(playerIndex)
	local rank = 0
	if Player_GetRace(playerIndex) == Race_Raider then
		for z, iCount in RadResearchRank do
			if Player_HasResearch(playerIndex, iCount) == 1 then
				rank = rank + 1
			end
		end
	end
	return rank
end

function AI_BuildRandomSubsystemsForShips(shipSOB, hardpoint_list, subsystem_list)
	local built_sub = 0
	if SobGroup_Empty(shipSOB) == 0 and Player_CanResearch(playerIndex, "AI_CanBuiltTurrets" ) == 1 then
		local playerIndex = SobGroup_OwnedBy(shipSOB)
		local playerIndexList = playerIndex + 1
		local numships = SobGroup_Count(shipSOB)
		if numships > 0 then
			if shipSOB ~= Temp_GlobalVariable.AI_BuildSubsystemsLastSOB[playerIndexList] or Temp_GlobalVariable.AI_BuildSubsystemsLastNum[playerIndexList] ~= numships then		--save computation work
				SobGroup_SplitGroupReference("SingleAISubsystemDebug_SOB", shipSOB, "Player_Ships"..playerIndex, numships, 0)
				Temp_GlobalVariable.AI_BuildSubsystemsLastSOB[playerIndexList] = shipSOB
				Temp_GlobalVariable.AI_BuildSubsystemsLastNum[playerIndexList] = numships
			end
			local max_queue = CPULODvalueList[playerIndexList]
			if CPULODvalueList[playerIndexList] > 3 then
				max_queue = numships		--Expert AI can build subsystems simultaneously for all ships
			end
			for counter = 0, numships - 1, 1 do
				local ship = "SingleAISubsystemDebug_SOB"..counter
				--build subsystem only when the ship is launched and is in use
				if SobGroup_IsDoingAbility(ship, AB_Attack) == 1 or 
				SobGroup_IsDoingAbility(ship, AB_Move) == 1 or 
				SobGroup_IsDoingAbility(ship, AB_Guard) == 1 then
					local xp = SobGroup_GetHardPointHealth(ship, "experience")
					--now the specific criteria
					if SobGroup_CanDoAbility(ship, AB_Builder) == 1 and 
					SobGroup_IsDoingAbility(ship, AB_Builder) == 0 and 
					SobGroup_IsBuildingAnythingInList(ship, subsystem_list) == 0 and 
					SobGroup_HealthPercentage(ship) > 0.15 and 
					SobGroup_IsDocked(ship) == 0 and 
					SobGroup_IsDoingAbility(ship, AB_Dock) == 0 and 
					xp * 10000 > 45-10*CPULODvalueList[playerIndexList] and xp < 0.5 and --newly built ships have high xp subsystem health
					SobGroup_AreAllInRealSpace(ship) == 1 then
						for z, iCount in hardpoint_list do
							if SobGroup_GetHardPointHealth(ship, iCount) == 0 then
								local random_sub = Table_RandomElement(subsystem_list)
								SobGroup_CreateSubSystem(ship, random_sub)
								built_sub = built_sub + 1
								break
							end
						end
					end
				end
				if built_sub > max_queue then
					break
				end
			end
		end
	end
	return built_sub
end

function AI_BuildSortedSubsystemsForShips(shipSOB, hardpoint_list, subsystem_list)		--hardpoint_list must have equal size with subsystem_list
	local built_sub = 0
	if SobGroup_Empty(shipSOB) == 0 and Player_CanResearch(playerIndex, "AI_CanBuiltTurrets" ) == 1 then
		local playerIndex = SobGroup_OwnedBy(shipSOB)
		local playerIndexList = playerIndex + 1
		local numships = SobGroup_Count(shipSOB)
		if numships > 0 then
			if shipSOB ~= Temp_GlobalVariable.AI_BuildSubsystemsLastSOB[playerIndexList] or Temp_GlobalVariable.AI_BuildSubsystemsLastNum[playerIndexList] ~= numships then		--save computation work
				SobGroup_SplitGroupReference("SingleAISubsystemDebug_SOB", shipSOB, "Player_Ships"..playerIndex, numships, 0)
				Temp_GlobalVariable.AI_BuildSubsystemsLastSOB[playerIndexList] = shipSOB
				Temp_GlobalVariable.AI_BuildSubsystemsLastNum[playerIndexList] = numships
			end
			local max_queue = CPULODvalueList[playerIndexList]
			if CPULODvalueList[playerIndexList] > 3 then
				max_queue = numships		--Expert AI can build subsystems simultaneously for all ships
			end
			for counter = 0, numships - 1, 1 do
				local ship = "SingleAISubsystemDebug_SOB"..counter
				--build subsystem only when the ship is launched and is in use
				if SobGroup_IsDoingAbility(ship, AB_Attack) == 1 or 
				SobGroup_IsDoingAbility(ship, AB_Move) == 1 or 
				SobGroup_IsDoingAbility(ship, AB_Guard) == 1 then
					local xp = SobGroup_GetHardPointHealth(ship, "experience")
					--now the specific criteria
					if SobGroup_CanDoAbility(ship, AB_Builder) == 1 and 
					SobGroup_IsDoingAbility(ship, AB_Builder) == 0 and 
					SobGroup_IsBuildingAnythingInList(ship, subsystem_list) == 0 and 
					SobGroup_HealthPercentage(ship) > 0 and 
					SobGroup_IsDocked(ship) == 0 and 
					SobGroup_IsDoingAbility(ship, AB_Dock) == 0 and 
					xp * 10000 > 45-10*CPULODvalueList[playerIndexList] and xp < 0.5 and --newly built ships have high xp subsystem health
					SobGroup_AreAllInRealSpace(ship) == 1 then
						for z, iCount in hardpoint_list do
							if SobGroup_GetHardPointHealth(ship, iCount) == 0 and subsystem_list[z] ~= nil then
								SobGroup_CreateSubSystem(ship, subsystem_list[z])
								built_sub = built_sub + 1
								break
							end
						end
					end
				end
				if built_sub > max_queue then
					break
				end
			end
		end
	end
	return built_sub
end

function SobGroup_IsBuildingAnythingInList(ship, build_list)
	local building = 0
	for z, iCount in build_list do
		building = SobGroup_IsBuilding(ship, iCount)
		if building > 0 then
			return building
		end
	end
	return building
end

function AI_AutoEngageEnemyCapital(shipSOB, subsystem, radius)
	if SobGroup_Empty(shipSOB) == 0 then	--not the cause for 00000000 crash
		local playerIndex = SobGroup_OwnedBy(shipSOB)
		local numships = SobGroup_SplitGroupReference("SingleDefenseAICapital_SOB", shipSOB, "Player_Ships"..playerIndex, SobGroup_Count(shipSOB), 0)
		for counter = 0, numships - 1, 1 do
			local ship = "SingleDefenseAICapital_SOB"..counter
			if SobGroup_SobGroupCompare("haxor_all_shipswithoutai", ship) == 0 then
				if SobGroup_HealthPercentage(ship) < 0.15 or 
				SobGroup_GetHardPointHealth(ship, subsystem) <= 0 or 
				SobGroup_AreAllInHyperspace(ship) == 1 or 
				SobGroup_IsDoingAbility(ship, AB_Dock) == 1 or 
				SobGroup_IsDocked(ship) == 1 then
					CPU_AddSobGroup(playerIndex, ship)
          SobGroup_SetTactics_Smart(ship, DefensiveTactics)
				else
					SobGroup_Create("temp_target")
					SobGroup_Clear("temp_target")
					if SobGroup_FillProximitySobGroup("temp_target", "minetargetenemies"..playerIndex, ship, radius) == 1 then 
            if SobGroup_PlayerIsInSensorRange("temp_target", playerIndex) == 1 then
            	CPU_RemoveSobGroup(playerIndex, ship)
            	SobGroup_SetTactics_Smart(ship, AggressiveTactics)
              SobGroup_Attack(playerIndex, ship, "temp_target")
            end
          elseif SobGroup_FillProximitySobGroup("temp_target", "nuclearbombs", ship, radius) == 1 then 
            if SobGroup_PlayerIsInSensorRange("temp_target", playerIndex) == 1 then
            	SobGroup_SobGroupSubstract("temp_target", "AllToHelp"..playerIndex)
            	if SobGroup_Empty("temp_target") == 0 then
            		CPU_RemoveSobGroup(playerIndex, ship)
              	SobGroup_SetTactics_Smart(ship, AggressiveTactics)
              	SobGroup_Attack(playerIndex, ship, "temp_target")
              end
            end
          elseif SobGroup_FillProximitySobGroup("temp_target", "minetargetenemies"..playerIndex, ship, radius) == 0 then
            CPU_AddSobGroup(playerIndex, ship)
            SobGroup_SetTactics_Smart(ship, DefensiveTactics)
          end
        end
      end
    end
	end
end

function SP_SobGroup_EnterHyperSpaceOffMapAndRecaharge(ship)
	if SobGroup_Empty(ship) == 0 then
		SobGroup_EnterHyperSpaceOffMap(ship)
		local energy = 10
		if String_ContainsNameBeginningAt(ship, "Keeper") == 1 then
			if ship == "Keeper" then		--m08
				energy = 20
			else				--m09
				energy = 50/(SobGroup_Count(ship)+1)
			end
		end
		AddEnergyToPlayer(SobGroup_OwnedBy(ship), energy)
	end
end

function SP_GlobalInvincibility()
	local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
    	if Player_HasShipWithBuildQueue(playerIndex) == 1 then
    		if playerIndex == Universe_CurrentPlayer() then
    			if SobGroup_Empty("supporter"..playerIndex) == 0 then
	          CreateSubsystemOnShip("supporter"..playerIndex, "sp_invincible")
	        end
    		end
    	end
    end
    playerIndex = playerIndex + 1
  end
  Rule_Remove("SP_GlobalInvincibility")
end

function SP_UndoGlobalInvincibility()
	local playerIndex = 0
  local playerIndexList = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
    	--if Player_HasShipWithBuildQueue(playerIndex) == 1 then
    		if playerIndex == Universe_CurrentPlayer() then
    			if SobGroup_Empty("supporter"..playerIndex) == 0 then
	          RemoveSubsystemOnShip("supporter"..playerIndex, "sp_invincible")
	        end
    		end
    	--end
    end
    playerIndex = playerIndex + 1
  end
  Rule_Remove("SP_UndoGlobalInvincibility")
end

function SP_SobGroup_DockOrParadeSobGroupAtEnd(playerships, mothership)
	if SobGroup_Empty(mothership) == 0 then
		local playerIndex = Universe_CurrentPlayer()
		SobGroup_Create("SP_LevelEndPlayerShipsSOB")
		SobGroup_Clear("SP_LevelEndPlayerShipsSOB")
		SobGroup_SobGroupAdd("SP_LevelEndPlayerShipsSOB", playerships)
		SobGroup_SobGroupSubstract("SP_LevelEndPlayerShipsSOB", "supporter"..playerIndex)
		SobGroup_Create("SP_LevelEndPlayerShipsNotToDockSOB")
		SobGroup_Clear("SP_LevelEndPlayerShipsNotToDockSOB")
		Update_AllShips()
		local numDockers = SobGroup_SplitGroupReference("SP_LevelEndSingleShipCanBuild_SOB", "SP_LevelEndPlayerShipsSOB", "AllShips", SobGroup_Count("SP_LevelEndPlayerShipsSOB") )
		for counter = 0, numDockers -1, 1 do
			if SobGroup_CanDoAbility("SP_LevelEndSingleShipCanBuild_SOB"..counter, AB_Builder) == 1 or SobGroup_AreAnyOfTheseTypes("SP_LevelEndSingleShipCanBuild_SOB"..counter, "hgn_mothership, hgn_researchstation, hgn_power, hgn_combatbase, hgn_crewstation, hgn_carrier, hgn_lightcarrier, hgn_scaver") == 1 then
				SobGroup_SobGroupAdd("SP_LevelEndPlayerShipsNotToDockSOB", "SP_LevelEndSingleShipCanBuild_SOB"..counter)
				if SobGroup_IsDocked("SP_LevelEndSingleShipCanBuild_SOB"..counter) == 1 then		--launch docked builder to preserve subsystems in the next level
					local CheckDockList = {"hgn_shipyard_g", "hgn_shipyard_elohim", "hgn_shipyard", "hgn_battlecarrier", "hgn_battleshipyard", "hgn_ark", "hgn_mothership"}
					for z, iCount in CheckDockList do
						SobGroup_LaunchIfDockedWithSobGroup("SP_LevelEndSingleShipCanBuild_SOB"..counter, iCount..playerIndex)
					end
				end
			elseif SobGroup_IsDocked("SP_LevelEndSingleShipCanBuild_SOB"..counter) == 0 and SobGroup_CanDoAbility("SP_LevelEndSingleShipCanBuild_SOB"..counter, AB_Dock) == 1 then		--dock ordinary ships
				SobGroup_DockSobGroup_Smart("SP_LevelEndSingleShipCanBuild_SOB"..counter, mothership)
			end
		end
		SobGroup_SobGroupSubstract("SP_LevelEndPlayerShipsNotToDockSOB", "hgn_mothership"..playerIndex)
		if SobGroup_Empty("SP_LevelEndPlayerShipsNotToDockSOB") == 0 then		--instant parade non-dock ships
			SobGroup_ParadeSobGroup("SP_LevelEndPlayerShipsNotToDockSOB", mothership, 2)
		end
	else
		print("Cannot find the Mothership to dock with! Where is my Mothership?")
	end
end

function SobGroup_Launch_Smart(shiptolaunch, shiptolaunchfrom)
	if SobGroup_AreAllInRealSpace(shiptolaunchfrom) == 1 and SobGroup_IsDoingAbility(shiptolaunchfrom, AB_Hyperspace) == 0 then
		SobGroup_Launch(shiptolaunch, shiptolaunchfrom)
		--print("Launching "..shiptolaunch.." (owned by player "..SobGroup_OwnedBy(shiptolaunch)..") from "..shiptolaunchfrom.." (owned by player "..SobGroup_OwnedBy(shiptolaunchfrom).."), year"..year)
	end
end

function SobGroup_LaunchIfDockedWithSobGroup(shiptolaunch, shiptolaunchfrom)		--only works if docked with the first ship in shiptolaunchfrom
	local launched = 0
	if SobGroup_Empty(shiptolaunchfrom) == 0 then
		if SobGroup_IsDockedSobGroup(shiptolaunch, shiptolaunchfrom) == 1 then
			SobGroup_Launch_Smart(shiptolaunch, shiptolaunchfrom)
			launched = 1
		end
	end
	return launched
end

function SobGroup_IsAnyShipBeingCaptured(ship)
	SobGroup_Create("CheckIfBeingCapturedSOB_Temp")
	SobGroup_Clear("CheckIfBeingCapturedSOB_Temp")
	SobGroup_GetSobGroupBeingCapturedGroup(ship, "CheckIfBeingCapturedSOB_Temp")
	if SobGroup_Empty("CheckIfBeingCapturedSOB_Temp") == 0 then
		SobGroup_Clear("CheckIfBeingCapturedSOB_Temp")
		return 1
	else
		SobGroup_Clear("CheckIfBeingCapturedSOB_Temp")
		return 0
	end
end

function SobGroup_CountCapturers(ship)
	SobGroup_Create("CountCapturersSOB_Temp")
	SobGroup_Clear("CountCapturersSOB_Temp")
	SobGroup_GetSobGroupCapturingGroup(ship, "CountCapturersSOB_Temp")
	return SobGroup_Count("CountCapturersSOB_Temp")
end

function SobGroup_SobGroupSubstract(GroupA, GroupB)	--A minus B
	SobGroup_Create("OperationSubstractSOB_Temp")
	SobGroup_Clear("OperationSubstractSOB_Temp")
	SobGroup_SobGroupAdd("OperationSubstractSOB_Temp", GroupA)
	if SobGroup_Empty(GroupB) == 0 then
		SobGroup_FillSubstract(GroupA, "OperationSubstractSOB_Temp", GroupB)
	end
	SobGroup_Clear("OperationSubstractSOB_Temp")
end

function SobGroup_FillProximitySobGroupExceptSelf(group_temp, group_target, group_self, radius)
	SobGroup_Create(group_temp)
	SobGroup_Clear(group_temp)
	SobGroup_Create("OperationFillProximitySubstractSOB_Temp")
	SobGroup_Clear("OperationFillProximitySubstractSOB_Temp")
	SobGroup_SobGroupAdd("OperationFillProximitySubstractSOB_Temp", group_target)
	SobGroup_SobGroupSubstract("OperationFillProximitySubstractSOB_Temp", group_self)
	return SobGroup_FillProximitySobGroup(group_temp, "OperationFillProximitySubstractSOB_Temp", group_self, radius)
end

function SobGroup_IsGroupNearybyExcludingSelf(ship, group_target, radius)
	return SobGroup_FillProximitySobGroupExceptSelf("OperationCheckProximityGroupSOB_Temp", group_target, ship, radius)
end

function SobGroup_CountRepairers(ship)
	SobGroup_Create("OperationCountRepairersSOB_Temp")
	SobGroup_Clear("OperationCountRepairersSOB_Temp")
	SobGroup_GetSobGroupRepairingGroup(ship, "OperationCountRepairersSOB_Temp")
	local count = SobGroup_Count("OperationCountRepairersSOB_Temp")
	SobGroup_Clear("OperationCountRepairersSOB_Temp")
	return count
end

function SobGroup_CountProximitySobGroup(ship, radius, group)
	SobGroup_Create("OperationCountProximitySOB_Temp")
	SobGroup_Clear("OperationCountProximitySOB_Temp")
	SobGroup_FillProximitySobGroup("OperationCountProximitySOB_Temp", group, ship, radius)
	local count = SobGroup_Count("OperationCountProximitySOB_Temp")
	SobGroup_Clear("OperationCountProximitySOB_Temp")
	return count
end

function SobGroup_CountPlayerNearybyShipsByType(ship, radius, ShipType)
	local playerIndex = SobGroup_OwnedBy(ship)
	SobGroup_FillProximitySobGroupExceptSelf("OperationCountNearbyShipsByType", "Player_Ships"..playerIndex, ship, radius)
	SobGroup_Create("Temp_PlayerNearbyShipsByType")
	SobGroup_Clear("Temp_PlayerNearbyShipsByType")
	SobGroup_FillShipsByType("Temp_PlayerNearbyShipsByType", "Player_Ships"..playerIndex, ShipType)
	return SobGroup_CountCompare("Temp_PlayerNearbyShipsByType", "OperationCountNearbyShipsByType") --return the number of nearby ships by type
end

function SobGroup_SobGroupSubstractShipByType(SOB, ShipType)	--SOB minus ShipType
	SobGroup_Create("OperationSubstractShipTypeFromSOB_Temp")
	SobGroup_Clear("OperationSubstractShipTypeFromSOB_Temp")
	Update_AllShips()
	SobGroup_FillShipsByType("OperationSubstractShipTypeFromSOB_Temp", "AllShips", ShipType)
	SobGroup_SobGroupSubstract(SOB, "OperationSubstractShipTypeFromSOB_Temp")
	SobGroup_Clear("OperationSubstractShipTypeFromSOB_Temp")
end

function SobGroup_CountDockedShips(ship)
	local SOBcount = 0
	SobGroup_Create("OperationCountDockedSOB_Temp")
	SobGroup_Clear("OperationCountDockedSOB_Temp")
	SobGroup_GetSobGroupDockedWithGroup(ship, "OperationCountDockedSOB_Temp")
	if SobGroup_Empty("OperationCountDockedSOB_Temp") == 0 then
		SOBcount = SobGroup_Count("OperationCountDockedSOB_Temp")
	end
	SobGroup_Clear("OperationCountDockedSOB_Temp")
	return SOBcount
end

function SobGroup_CountCompare(GroupA, GroupB)
	local SOBcount = 0
	SobGroup_Create("OperationCountCompareSOB_Temp")
	SobGroup_Clear("OperationCountCompareSOB_Temp")
	SobGroup_FillCompare("OperationCountCompareSOB_Temp", GroupA, GroupB)
	if SobGroup_Empty("OperationCountCompareSOB_Temp") == 0 then
		SOBcount = SobGroup_Count("OperationCountCompareSOB_Temp")
	end
	SobGroup_Clear("OperationCountCompareSOB_Temp")
	return SOBcount
end

function SobGroup_SobGroupCompare(GroupA, GroupB)	--do they have anything in common?
	local ShareAnything = 0
	SobGroup_Create("OperationCompareSOB_Temp")
	SobGroup_Clear("OperationCompareSOB_Temp")
	SobGroup_FillCompare("OperationCompareSOB_Temp", GroupA, GroupB)
	if SobGroup_Empty("OperationCompareSOB_Temp") == 0 then
		ShareAnything = 1
	end
	SobGroup_Clear("OperationCompareSOB_Temp")
	return ShareAnything
end

function SobGroup_AllEmpty(SOB_list)
	for z, SOB in SOB_list do
		if SobGroup_Empty(SOB) == 0 then
			return 0
		end
	end
	return 1
end

function SobGroup_AddToPlayerGroups(ship, list_groups)	--add a ship to every player's group in the list
  local playerIndex = 0
  while playerIndex < Universe_PlayerCount() do
  	if Player_IsAlive(playerIndex) == 1 then
  		for z, group in list_groups do
  			SobGroup_SobGroupAdd(group..playerIndex, ship)
  		end
  	end
  	playerIndex = playerIndex + 1
  end
end

function SobGroup_AvoidanceIgnoreAllShipsInUniverse(SOB)	--ignore collision against all ships in the universe
	--when used on ships of player -1, it causes crash when saving the game: Couldn't find m_squadNotToAvoid's ptr in the object lookup table! -- FATAL EXIT -- savegamedata/880:!
	if SobGroup_Empty(SOB) == 0 and SobGroup_HealthPercentage(SOB) > 0 then
		Update_AllShips()
		SobGroup_Create("Temp_AllShipsInUniverse")
		SobGroup_SobGroupAdd("Temp_AllShipsInUniverse", "AllShips")
		SobGroup_Create("all_megalithnoowner")
		SobGroup_Clear("all_megalithnoowner")
		Player_FillProximitySobGroup("all_megalithnoowner", -1, "AllShips", 10000000)
		SobGroup_SobGroupAdd("Temp_AllShipsInUniverse", "all_megalithnoowner")
		SobGroup_AvoidanceIgnore(SOB, "Temp_AllShipsInUniverse")
		SobGroup_Clear("Temp_AllShipsInUniverse")
	end
end

function GetSublistByPlayerRace(list, playerIndex)	--returns something like {race = Race_Hiigaran, minRUs=1500, MinSizeMultiplier=1.3, AccessDistanceMultiplier=0.9}
	for z, iCount in list do
    if Player_GetRace(playerIndex) == iCount.race then
    	return iCount
    end
  end
end

function Player_GetShipTableByRace(playerIndex)
	local badsetting = 0
	local shiptable = {}
	if Player_GetRace(playerIndex) == Race_Hiigaran then
		shiptable = ship_list.hgn
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
		shiptable = ship_list.vgr
	elseif Player_GetRace(playerIndex) == Race_Kadeshi then
		shiptable = ship_list.kad
	elseif Player_GetRace(playerIndex) == Race_Raider then
		shiptable = ship_list.rad
	elseif Player_GetRace(playerIndex) == Race_Keeper then
		shiptable = ship_list.kpr
	else
		badsetting = 1
	end
	if badsetting == 1 then
		return nil
	else
		return shiptable
	end
end

function Universe_CountPlayersAlive()
	local count = 0
	local playerIndex = 0;
	local playerCount = Universe_PlayerCount();
	while (playerIndex < playerCount) do
		if Player_IsAlive(playerIndex) == 1 then
			count = count + 1
		end
		playerIndex = playerIndex + 1
	end
	return count
end

function Optimization_CanDisplaySpecialEffects(ship)		--to reduce lags and speed up the game
	local DisplayFX = 0
	local playerIndex = Universe_CurrentPlayer()
	if SobGroup_OwnedBy(ship) ~= -1 then	--yes, this can happen in single player mission!
		if Player_IsAlive(playerIndex) == 1 then
			if SobGroup_OwnedBy(ship) == playerIndex or AreAllied(SobGroup_OwnedBy(ship), playerIndex) == 1 then		--always display own or allied ships
				DisplayFX = 1
			else	--it's enemy ships
				if SobGroup_PlayerIsInSensorRange(ship, playerIndex) == 1 then		--check own sensors
					DisplayFX = 1
				else		--not in own sensor range, check allied sensors
					local alliesIndex = 0
					while alliesIndex < Universe_PlayerCount() do
						if Player_IsAlive(alliesIndex) == 1 and playerIndex ~= alliesIndex and AreAllied(alliesIndex, playerIndex) == 1 then
							if SobGroup_PlayerIsInSensorRange(ship, alliesIndex) == 1 then
								DisplayFX = 1
							end
						end
						alliesIndex = alliesIndex + 1
					end
					if DisplayFX == 0 then		--still not in any sensor range, check deep space telemetry
						if Player_CanResearch(playerIndex, "hashyperspacesensor" ) == 1 and Player_HasResearch(playerIndex, "computerhack" ) == 1 then
							if SobGroup_SobGroupCompare("computerhack"..playerIndex, ship) == 1 then
								DisplayFX = 1
							end
						end
					end
					if DisplayFX == 0 then		--finally, check ping
						if SobGroup_IsDoingAbility("Player_Ships"..playerIndex, AB_SensorPing) == 1 then
							DisplayFX = 1
						end
					end
				end
			end
		else		--display everything after death
			DisplayFX = 1
		end
		if gFogOfWarSetting ~= nil then		--Territories mod
			if gFogOfWarSetting == "all_visible" then
				DisplayFX = 1
			end
		end
		if SobGroup_IsCloaked(ship) == 1 and SobGroup_OwnedBy(ship) ~= playerIndex then		--check cloak
			DisplayFX = 0
		end
		if SobGroup_IsDocked(ship) == 1 and SobGroup_OwnedBy(ship) ~= playerIndex and GetGameRubric() == GR_CAMPAIGN then		--stop spawning FX for docked ships (i.e. keeper)
			DisplayFX = 0
		end
		if SobGroup_AreAllInHyperspace(ship) == 1 then		--no FX when in hyperspace
			DisplayFX = 0
		end
	else	--player -1
		DisplayFX = 1	--always display
	end
	return DisplayFX
end

function FX_StartEvent_Smart(ship, effect, distance_multiplier)		--use this only for single ships!
	local dist_factor = 1
	if distance_multiplier ~= nil then
		dist_factor = distance_multiplier
	end
	if dist_factor == 0 then
		dist_factor = 0.01
	end
	local FX_started = 0
	local CameraFriendly = 1
	local CameraDistance = Camera_GetDistanceToSobGroup(ship)/dist_factor
	if CameraDistance > 9000 and SobGroup_SobGroupCompare(ship, "all_fighters") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 10000 and SobGroup_SobGroupCompare(ship, "all_corvettes") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 15000 and SobGroup_SobGroupCompare(ship, "frigates") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 6000 and SobGroup_SobGroupCompare(ship, "resourcecollectors") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 9000 and SobGroup_SobGroupCompare(ship, "mobilerefineries") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 12000 and SobGroup_SobGroupCompare(ship, "containers") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 11000 and SobGroup_SobGroupCompare(ship, "powerstations") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 25000 and SobGroup_SobGroupCompare(ship, "destroyers") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 25000 and (SobGroup_SobGroupCompare(ship, "weaponstations") == 1 or SobGroup_SobGroupCompare(ship, "crewstations") == 1 or SobGroup_SobGroupCompare(ship, "researchstations") == 1 or SobGroup_SobGroupCompare(ship, "powerstations") == 1) then
		CameraFriendly = 0
	end
	if SobGroup_SobGroupCompare(ship, "battlecruisers") == 1 then
		if SobGroup_AreAnyOfTheseTypes(ship, "Vgr_ArtilleryBattlecruiser") == 1 and CameraDistance > 250000 then
			CameraFriendly = 0
		elseif CameraDistance > 26000 then
			CameraFriendly = 0
		end
	end
	if CameraDistance > 30000 and SobGroup_SobGroupCompare(ship, "juggernaughts") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 40000 and SobGroup_SobGroupCompare(ship, "carriers") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 50000 and SobGroup_SobGroupCompare(ship, "shipyards") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 50000 and SobGroup_SobGroupCompare(ship, "motherships") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 12000 and SobGroup_SobGroupCompare(ship, "nuclearbombs") == 1 then
		CameraFriendly = 0
	end
	if CameraDistance > 9000 then
		if SobGroup_AreAnyOfTheseTypes(ship, "kpr_lightgranule_tiny") == 1 then
			CameraFriendly = 0
		elseif SobGroup_AreAnyOfTheseTypes(ship, "kpr_dummy_warptarget_100") == 1 then
			CameraFriendly = 0
		end
	end
	if CameraDistance > 20000 then
		if SobGroup_AreAnyOfTheseTypes(ship, "meg_tmatmegaship") == 1 then
			CameraFriendly = 0
		end
	end
	if CameraDistance > 200000 then
		if SobGroup_AreAnyOfTheseTypes(ship, "kpr_dummy_warptarget_500") == 1 then
			CameraFriendly = 0
		end
	end
	if Optimization_CanDisplaySpecialEffects(ship) == 1 and CameraFriendly == 1 then
		FX_StartEvent(ship, effect)
		FX_started = 1
	else
		FX_StopEvent(ship, effect)
	end
	return FX_started
end