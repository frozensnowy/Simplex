tactical_susbsytems = {"tactical_fighter_1", "tactical_fighter_2", "tactical_fighter_3", "tactical_corvette_1", "tactical_corvette_2", "tactical_corvette_3", "tactical_frigate_1", "tactical_frigate_2", "tactical_frigate_3", "tactical_capital_1", "tactical_capital_2", "tactical_capital_3", "tactical_platform_1", "tactical_platform_2", "tactical_platform_3", "tactical_utility_1", "tactical_utility_2", "tactical_utility_3"}
tactical_susbsytems_elite = {"tactical_fighter_1e", "tactical_fighter_2e", "tactical_fighter_3e", "tactical_corvette_1e", "tactical_corvette_2e", "tactical_corvette_3e", "tactical_frigate_1e", "tactical_frigate_2e", "tactical_frigate_3e", "tactical_capital_1e", "tactical_capital_2e", "tactical_capital_3e", "tactical_platform_1e", "tactical_platform_2e", "tactical_platform_3e", "tactical_utility_1e", "tactical_utility_2e", "tactical_utility_3e"}
tactical_classes = {"fighter", "corvette", "frigate", "capital", "platform", "utility"}
tactical_honour_list = {10, 20, 30, 50, 30, 20} --the reference honour point cost for each basic class (x1, non-elite reinforcement)
hgn_reinforcements, hgn_reinforcements_elite = {}, {}
vgr_reinforcements, vgr_reinforcements_elite = {}, {}
--Hiigaran
hgn_reinforcements["fighter"] = {
	{5, {"hgn_interceptor"}},
	{4, {"hgn_attackbomber"}},
	{1, {"hgn_lbomber"}},
}
hgn_reinforcements_elite["fighter"] = {
	{5, {"hgn_interceptor", "hgn_hft", "hgn_railgunfighter"}},
	{4, {"hgn_attackbomber", "hgn_attackbomberheavy", "hgn_lbomber"}},
	{1, {"hgn_strategicbomber"}},
}
hgn_reinforcements["corvette"] = {
	{5, {"hgn_assaultcorvette"}},
	{4, {"hgn_pulsarcorvette"}},
	{1, {"hgn_bombervette"}},
}
hgn_reinforcements_elite["corvette"] = {
	{5, {"hgn_assaultcorvette", "hgn_pulsarcorvette", "hgn_multiguncorvette"}},
	{4, {"hgn_bombervette", "hgn_torpedocorvette", "hgn_gunshipcoevette"}},
	{1, {"hgn_cth", "hgn_cthion"}},
}
hgn_reinforcements["frigate"] = {
	{5, {"hgn_assaultfrigate"}},
	{4, {"hgn_torpedofrigate"}},
	{1, {"hgn_ioncannonfrigate"}},
}
hgn_reinforcements_elite["frigate"] = {
	{5, {"hgn_assaultfrigate", "hgn_tulwar", "hgn_torpedofrigate"}},
	{4, {"hgn_lrms", "hgn_ioncannonfrigate"}},
	{1, {"hgn_defensefieldfrigate", "hgn_marinefrigate"}},
}
hgn_reinforcements["capital"] = {
	{5, {"hgn_destroyer"}},
	{4, {"hgn_sweeperdestroyer"}},
	{1, {"hgn_lightcarrier", "hgn_carrier"}},
}
hgn_reinforcements_elite["capital"] = {
	{5, {"hgn_advdestroyer", "hgn_missiledestroyer", "hgn_iondestroyer", "hgn_artillerydestroyer"}},
	{4, {"hgn_cruisera", "hgn_cruiserb"}},
	{1, {"hgn_battlecarrier", "hgn_battlecruiser", "hgn_battleship"}},
}
hgn_reinforcements["platform"] = {
	{5, {"hgn_gunturret"}},
	{4, {"hgn_pulsarturret"}},
	{1, {"hgn_missileturret"}},
}
hgn_reinforcements_elite["platform"] = {
	{5, {"hgn_ionturret", "hgn_missileturret", "hgn_pulsarturret", "hgn_gunturret"}},
	{4, {"hgn_rts", "hgn_defensefieldturret"}},
	{1, {"hgn_sentinel", "hgn_ionsentinel"}},
}
hgn_reinforcements["utility"] = {
	{6, {"hgn_resourcecollector"}},
	{3, {"hgn_resourcecontroller"}},
	{6, {"hgn_defenderdrone"}},
}
hgn_reinforcements_elite["utility"] = {
	{6, {"hgn_resourcecollector"}},
	{3, {"hgn_resourcecontroller"}},
	{1, {"hgn_tanker", "hgn_scaver"}},
	{5, {"hgn_probe", "hgn_proximitysensor", "hgn_ecmprobe"}},
}
--Vaygr
vgr_reinforcements["fighter"] = {
	{5, {"vgr_interceptor"}},
	{4, {"vgr_bomber"}},
	{1, {"vgr_missilebomber"}},
}
vgr_reinforcements_elite["fighter"] = {
	{5, {"vgr_interceptor", "vgr_heavyfighter", "vgr_lancefighter", "vgr_defender"}},
	{4, {"vgr_missilebomber", "vgr_elitefighter"}},
	{1, {"vgr_bioship"}},
}
vgr_reinforcements["corvette"] = {
	{5, {"vgr_missilecorvette"}},
	{4, {"vgr_plasmacorvette"}},
	{1, {"vgr_striker"}},
}
vgr_reinforcements_elite["corvette"] = {
	{5, {"vgr_missilecorvette", "vgr_multilancecorvette", "vgr_standvette"}},
	{4, {"vgr_plasmacorvette", "vgr_mortarcorvette", "vgr_lasercorvette"}},
	{1, {"vgr_commandcorvette"}},
}
vgr_reinforcements["frigate"] = {
	{5, {"vgr_assaultfrigate"}},
	{4, {"vgr_heavymissilefrigate"}},
	{1, {"vgr_infiltratorfrigate"}},
}
vgr_reinforcements_elite["frigate"] = {
	{5, {"vgr_advassaultfrigate", "vgr_heavymissilefrigate", "vgr_artilleryfrigate", "vgr_infiltratorfrigate"}},
	{4, {"vgr_supportfrigate", "vgr_supportfrigate_laser", "vgr_longrangeartilleryfrigate", "vgr_empfrigate"}},
	{1, {"vgr_supportfrigatearmed"}},
}
vgr_reinforcements["capital"] = {
	{5, {"vgr_destroyer"}},
	{4, {"vgr_pulsedestroyer"}},
	{1, {"vgr_battlecarrier"}},
}
vgr_reinforcements_elite["capital"] = {
	{5, {"vgr_cruiser", "vgr_lightcruiser", "vgr_lightcruiser_gun"}},
	{4, {"vgr_artilleryship"}},
	{1, {"vgr_carrier", "vgr_battlecruiser", "vgr_missilebattlecruiser"}},
}
vgr_reinforcements["platform"] = {
	{5, {"vgr_weaponplatform_gun"}},
	{4, {"vgr_weaponplatform_lance"}},
	{1, {"vgr_weaponplatform_missile"}},
}
vgr_reinforcements_elite["platform"] = {
	{5, {"vgr_weaponplatform_gun", "vgr_weaponplatform_lance", "vgr_weaponplatform_missile"}},
	{4, {"vgr_weaponplatform_missile", "vgr_hyperspace_platform", "vgr_cloakplatform"}},
	{1, {"vgr_sinner"}},
}
vgr_reinforcements["utility"] = {
	{6, {"vgr_resourcecollector"}},
	{3, {"vgr_resourcecontroller"}},
	{6, {"vgr_minelayerdrone"}},
}
vgr_reinforcements_elite["utility"] = {
	{7, {"vgr_resourcecollector"}},
	{2, {"vgr_resourcecontrollerdouble"}},
	{1, {"vgr_am", "vgr_scaver"}},
	{5, {"vgr_probe", "vgr_probe_prox", "vgr_probe_ecm", "vgr_probe_smallhsbeacon"}},
}

function Tactical_SpawnReinforcements(ship, class_name, group_size, is_elite)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	local reinforcement_list = {}
	if Player_GetRace(playerIndex) == Race_Hiigaran then
		if is_elite == 1 then
			reinforcement_list = hgn_reinforcements_elite
		else
			reinforcement_list = hgn_reinforcements
		end
  elseif Player_GetRace(playerIndex) == Race_Vaygr then
  	if is_elite == 1 then
			reinforcement_list = vgr_reinforcements_elite
		else
			reinforcement_list = vgr_reinforcements
		end
	end
	--start spawning
	local pos = SobGroup_GetPosition("Player_Ships"..playerIndex)
	SobGroup_Create("SOB_SpawnReinforcements"..playerIndex)
	SobGroup_Clear("SOB_SpawnReinforcements"..playerIndex)
	Volume_AddSphere("VOL_SpawnReinforcements"..playerIndex, pos, 10000)
	for z, reinforcement in reinforcement_list[class_name] do
		local num = reinforcement[1]
		local shiptypes = reinforcement[2]
		for i=1,num*group_size do
			local spawntype = Table_RandomElement(shiptypes)
			if Player_GetRace(playerIndex) == Race_Hiigaran then
				if class_name == "fighter" and Player_HasResearch(playerIndex, "fightersquadron7" ) == 1 or
				class_name == "corvette" and Player_HasResearch(playerIndex, "corvettesquadron5" ) == 1 then
					spawntype = spawntype.."l"
				end
			end
			AI_SobGroup_SpawnNewShipInSobGroup(playerIndex, spawntype, "tactical reinforcements", "SOB_SpawnReinforcements"..playerIndex, "VOL_SpawnReinforcements"..playerIndex)
		end
	end
	if CPU_Exist_Smart(playerIndex) == 0 then
		if class_name == "fighter" or class_name == "corvette" then
			SobGroup_FormStrikeGroup("SOB_SpawnReinforcements"..playerIndex, "Fighter Screen")
		elseif class_name == "frigate" or class_name == "platform" then
			SobGroup_FormStrikeGroup("SOB_SpawnReinforcements"..playerIndex, "Frigate Line")
		elseif class_name == "capital" then
			SobGroup_FormStrikeGroup("SOB_SpawnReinforcements"..playerIndex, "Capital Phalanx")
		end
	end
	SobGroup_ParadeSobGroup("SOB_SpawnReinforcements"..playerIndex, ship, 1)
	if CPU_Exist_Smart(playerIndex) == 1 then
		SobGroup_GuardSobGroup("SOB_SpawnReinforcements"..playerIndex, ship)
	end
	Volume_Delete("VOL_SpawnReinforcements"..playerIndex)
end

function ProcessTacticalOrders(ship)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	local subsystem = Tactical_CheckSubsystemInList(ship, tactical_susbsytems)
	if not subsystem then
		subsystem = Tactical_CheckSubsystemInList(ship, tactical_susbsytems_elite)
	end
	--execute subsystem function when built
	if subsystem then	--subsystem found
		SobGroup_SetHardPointHealth(ship, subsystem, 0)	--removes the order
		honourstartList1[playerIndexList] = 0 	--you can use up all your honour points
		--honourstartList[playerIndexList] = 0
		subsystem = strlower(subsystem)
		local class_idx = Tactical_IdentifyClass(subsystem, tactical_classes)
		local class_name = tactical_classes[class_idx]
		local is_elite = 0
		local group_size = 1
		if strsub(subsystem, -1) == "e" then	--elite group
			is_elite = 1
			group_size = tonumber(strsub(subsystem, -2, -2))	--get the second last letter
		else	--basic group
			group_size = tonumber(strsub(subsystem, -1))	--get the second last letter
		end
		local honour_cost = Tactical_CalculateHonourPoints(class_idx, tactical_honour_list, group_size, is_elite)
		local elite_text = "BASIC"
		if is_elite == 1 then
			elite_text = "ELITE"
		end
		honorbonus[playerIndexList] = honorbonus[playerIndexList] - honour_cost
		Tactical_SpawnReinforcements(ship, class_name, group_size, is_elite)
		print("Tactical reinforcements ("..elite_text..") called in by player index: "..playerIndex..", type: "..class_name..", size: "..group_size..", honour point cost: "..honour_cost..",  game year: "..year)
	end
	--process build constraints
	local basic_honour_list = Tactical_GenerateHonourPointList(tactical_susbsytems, "tactical_susbsytems_honour")	--generate a honour requirement list side by side
	local elite_honour_list = Tactical_GenerateHonourPointList(tactical_susbsytems_elite, "tactical_susbsytems_elite_honour")	--generate a honour requirement list side by side
	--print("length of basic_honour_list: "..getn(basic_honour_list))
	--print("length of elite_honour_list: "..getn(elite_honour_list))
	for z, subsystem in tactical_susbsytems do
		Tactical_ManipulateSubsystems(ship, subsystem, basic_honour_list[z])	--restrict by sobgroup works fine without error; restrict by player gives error
	end
	for z, subsystem in tactical_susbsytems_elite do
		Tactical_ManipulateSubsystems(ship, subsystem, elite_honour_list[z])
	end
end

function Tactical_CheckSubsystemInList(ship, list)	--requires the subsystem to have the same name with the hardpoint
	for z, iCount in list do
		if SobGroup_GetHardPointHealth(ship, iCount) > 0 then
			return iCount	--returns the name of the subsystem
		end
	end
	return nil	--no match
end

function Tactical_IdentifyClass(text, list) --try to find a list of targets in a text
	for z, iCount in list do
		local search_result = strfind(text, strlower(iCount))
		if search_result then
			return z	--returns the index of the element
		end
	end
	return nil
end

function Tactical_CalculateHonourPoints(class_idx, tactical_honour_list, group_size, is_elite)	--calculate honor point cost based on known conditions
	local cost = tactical_honour_list[class_idx] * group_size	--honour points scales linearly with group size
	if is_elite == 1 then
		cost = cost*2	--elite groups cost double honour points
	end
	return cost
end

function Tactical_GenerateHonourPointList(subsystem_list, cache_keyname, use_cache)	--generate honor point cost list for all orders based on a basic reference list
	local use_cache = 0	--use_cache or 1
	if use_cache == 1 and L2_cache[cache_keyname] then	--use existing cache
		--print("using cache")
		return L2_cache[cache_keyname]
	else	--not using cashe or cashe needs to be updated
		local honour_list = {}
		for z, subsystem in subsystem_list do	--iterate of the the list of subsystems
			subsystem = strlower(subsystem)
			local class_idx = Tactical_IdentifyClass(subsystem, tactical_classes)
			local class_name = tactical_classes[class_idx]
			local is_elite = 0
			local group_size = 1
			if strsub(subsystem, -1) == "e" then	--elite group
				is_elite = 1
				group_size = tonumber(strsub(subsystem, -2, -2))	--get the second last letter
			else	--basic group
				group_size = tonumber(strsub(subsystem, -1))	--get the second last letter
			end
			local honour_cost = Tactical_CalculateHonourPoints(class_idx, tactical_honour_list, group_size, is_elite)
			honour_list = Table_CombineWithTable(honour_list, {honour_cost})
		end
		if use_cache == 1 then
			Store_Cache(L2_cache, cache_keyname, honour_list, use_cache)	--one-time data generation (no change through the rest of the game)
			--print("updating cache")
		end
		return honour_list
	end
end

function Tactical_ManipulateSubsystems(ship, buildoption, honour)
	local playerIndex = SobGroup_OwnedBy(ship)
	local playerIndexList = playerIndex + 1
	local canbuild = 1
	if pilotpopList[playerIndexList] + 1 > pilotrecruitList[playerIndexList] or officerpopList[playerIndexList] + 1 > officerrecruitList[playerIndexList] then
		canbuild = 0
	end
	if honorList[playerIndexList] < honour or canbuild == 0 then
		SobGroup_RestrictBuildOption(ship, buildoption)
	else
		SobGroup_UnRestrictBuildOption(ship, buildoption)
	end
end