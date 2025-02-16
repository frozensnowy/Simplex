aitrace("LOADING CPU RESEARCH")
-- kadeshi
setAIFunctions_KAD = { 2, 2, 2, 2, 2, 2 }		--was 0, turned off because I believe ai.lua will do better (by giving every player different personalities)
gardener = { 0, 0, 0, 0, 0, 0 }
kadesh = { 0, 0, 0, 0, 0, 0 }
sajuuk = { 0, 0, 0, 0, 0, 0 }
hybrid = { 0, 0, 0, 0, 0, 0 }
pacifier = 0
extermination = 0
function CpuResearch_Init()  
	if (s_race == Race_Hiigaran) then	
		--dofilepath("data:ai/hiigaran_upgrades.lua")		
		DoUpgradeDemand = DoUpgradeDemand_Hiigaran
		DoResearchTechDemand = DoResearchTechDemand_Hiigaran	
	elseif (s_race == Race_Vaygr) then
		--dofilepath("data:ai/vaygr_upgrades.lua")		
		DoUpgradeDemand = DoUpgradeDemand_Vaygr
		DoResearchTechDemand = DoResearchTechDemand_Vaygr	
	elseif (s_race == 3) then	
		DoUpgradeDemand = DoUpgradeDemand_Kadeshi
		DoResearchTechDemand = DoResearchTechDemand_Kadeshi
	elseif (s_race == 4) then
		DoUpgradeDemand = DoUpgradeDemand_Raider
		DoResearchTechDemand = DoResearchTechDemand_Raider
	elseif (s_race == 6) then
		DoUpgradeDemand = DoUpgradeDemand_Keeper
		DoResearchTechDemand = DoResearchTechDemand_Keeper
	end	
	sg_lastUpgradeTime = gameTime()
	sg_upgradeDelayTime = 20 + Rand(40)			
	cp_researchDemandRange = 0.4
	if (g_LOD == 1) then
		cp_researchDemandRange = 1
	end
	if (g_LOD == 0) then
		cp_researchDemandRange = 2
	end	
	if (Override_ResearchInit) then
		Override_ResearchInit()
	end
end
function CpuResearch_DefaultResearchDemandRules()
  local numRU = GetRU()	
	local threatlevel = UnderAttackThreat()	
	if (threatlevel > 175) and (numRU < 3000) then
		return
	end		
	aitrace("DoResearchTechDemand - Start", 2)
	DoResearchTechDemand()	
	aitrace("DoResearchTechDemand - End", 2)
	local curGameTime = gameTime()
	local timeSinceLastUpgrade = curGameTime - sg_lastUpgradeTime	
	local economicValue = 0
	local numCollecting = GetNumCollecting();	
	if ( (numRU > 2000 and numCollecting > 9) or numRU > 9000) then
		economicValue = 2
	elseif ( (numRU > 1000 and numCollecting > 7) or numRU > 5000) then
		economicValue = 1
	end		
	if (sg_doupgrades == 1 and threatlevel < 70 and s_militaryPop > 5 and economicValue > 0 and (timeSinceLastUpgrade > sg_upgradeDelayTime or economicValue > 1)) or (numRU > 10000) then		
		aitrace("DoUpgradeDemand - Start", 2)
		DoUpgradeDemand()
		aitrace("DoUpgradeDemand - End", 2)
		sg_lastUpgradeTime = gameTime();		
	end
end
function CpuResearch_Process()	
	if (GetNumCollecting() < sg_minNumCollectors and GetRU() < 1500) then
		return 0
	end		
	if (NumResearchSubSystems() == 0) then
		return 0
	end		
	if (IsResearchBusy()==1) then
		return 0
	end	
	ResearchDemandClear()	
	if (Override_ResearchDemand) then
		Override_ResearchDemand()
	else 
		CpuResearch_DefaultResearchDemandRules()
	end		
	local bestResearch = FindHighDemandResearch()		
	if ( bestResearch ~= 0) then
		Research( bestResearch )
		return 1
	end	
	return 0
end

function DoResearchTechDemand_Kadeshi()	

---determina la velocit?del gioco
  local gamespeed = 1
  if IsResearchDone( GAMESPEED3 ) == 1 then
	  gamespeed = 1.2
	elseif IsResearchDone( GAMESPEED2 ) == 1 then
	  gamespeed = 1
	elseif IsResearchDone( GAMESPEED1 ) == 1 then
	  gamespeed = 0.8
	end	 		   

---economically sound  
  local economicallysound = 0
  if GetRU() > 5000 then
    economicallysound = 50
  elseif GetRU() > 10000 then
    economicallysound = 75
  elseif GetRU() > 15000 then
    economicallysound = 100
  end  	  	

---AI  	
  if (Util_CheckResearch(ISAI) ) then
	  ResearchDemandSet( ISAI, 199.1564 )		--99
	end				
	if g_LOD == 0 then
	  if (Util_CheckResearch(ISEASY) ) then
		  ResearchDemandSet( ISEASY, 199.2468 )		--75
		end	
	elseif g_LOD == 1 then
	  if (Util_CheckResearch(ISSTANDARD) ) then
		  ResearchDemandSet( ISSTANDARD, 199.2467 )		--75
		end	
	elseif g_LOD == 2 then
	  if (Util_CheckResearch(ISHARD) ) then
		  ResearchDemandSet( ISHARD, 199.5491 )		--75
		end	
	elseif g_LOD > 2 then
	  if (Util_CheckResearch(ISEXPERT) ) then
		  ResearchDemandSet( ISEXPERT, 199.2468 )		--75
		end	
	end	

---NEBULA
  if (Util_CheckResearch(NEBULA) ) then
	  ResearchDemandSet( NEBULA, 99.4268 )
	end	
	
---resource
  if GetRU() > 4000 then	
    if (Util_CheckResearch(RESOURCE1) ) then
		  ResearchDemandSet( RESOURCE1, 99.4671 )
		end		
  end
  if GetRU() > 14000 then	
    if (Util_CheckResearch(RESOURCE2) ) then
		  ResearchDemandSet( RESOURCE2, 99.1237 )
		end		
  end
  if GetRU() > 34000 then	
    if (Util_CheckResearch(RESOURCE3) ) then
		  ResearchDemandSet( RESOURCE3, 99.2489 )
		end		
  end
  if GetRU() > 64000 then	
    if (Util_CheckResearch(RESOURCE4) ) then
		  ResearchDemandSet( RESOURCE4, 99.2464 )
		end		
  end
	
---crew
  if (Util_CheckResearch(CREW1) ) then
	  ResearchDemandSet( CREW1, 199.2468 )
	end			
	if (Util_CheckResearch(CREW2) ) then
	  ResearchDemandSet( CREW2, 189.5248 )
	end			
	if (Util_CheckResearch(CREW3) ) then
	  ResearchDemandSet( CREW3, 179.2467 )
	end				
	if (Util_CheckResearch(CREW4) ) then
	  ResearchDemandSet( CREW4, 169.2428 )
	end				
	if (Util_CheckResearch(CREW5) ) then
	  ResearchDemandSet( CREW5, 159.4597 )
	end		
	if (Util_CheckResearch(CREW6) ) then
	  ResearchDemandSet( CREW6, 149.2877 )
	end		
---officer
  if (Util_CheckResearch(OFFICER1) ) then
	  ResearchDemandSet( OFFICER1, 199.5468 )
	end			
	if (Util_CheckResearch(OFFICER2) ) then
	  ResearchDemandSet( OFFICER2, 189.5456 )
	end			
	if (Util_CheckResearch(OFFICER3) ) then
	  ResearchDemandSet( OFFICER3, 179.5468 )
	end				
	if (Util_CheckResearch(OFFICER4) ) then
	  ResearchDemandSet( OFFICER4, 169.2461 )
	end				
	if (Util_CheckResearch(OFFICER5) ) then
	  ResearchDemandSet( OFFICER5, 159.4567 )
	end	

--energy
  if (Util_CheckResearch(ENERGYPRODUCTION1) ) then
	  ResearchDemandSet( ENERGYPRODUCTION1, 150.5482 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION2) ) then
	  ResearchDemandSet( ENERGYPRODUCTION2, 140.2108 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION3) ) then
	  ResearchDemandSet( ENERGYPRODUCTION3, 130.5441 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION4) ) then
	  ResearchDemandSet( ENERGYPRODUCTION4, 120.4108 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION5) ) then
	  ResearchDemandSet( ENERGYPRODUCTION5, 110.0489 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION6) ) then
	  ResearchDemandSet( ENERGYPRODUCTION6, 100.0488 )
	end	
  if (Util_CheckResearch(ENERGYPRODUCTION7) ) then
	  ResearchDemandSet( ENERGYPRODUCTION7, 90.0491 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION8) ) then
	  ResearchDemandSet( ENERGYPRODUCTION8, 80.0482 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION9) ) then
	  ResearchDemandSet( ENERGYPRODUCTION9, 70.0416 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION10) ) then
	  ResearchDemandSet( ENERGYPRODUCTION10, 60.4089 )
	end			
	
--ascension perks
	local numCapital = numActiveOfClass( s_playerIndex, eCapital )	
	if (numCapital >= 1) then
		ResearchDemandSet(KAD_PERKS_SURVIVALIST, 13.852*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_RAGE, 13.879*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_STEALTH, 13.878*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_SAFEFALL, 13.866*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_TRAINING, 13.877*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_HITANDRUN, 13.876*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_BOUNTY, 13.875*sqrt(numCapital))
		
		ResearchDemandSet(KAD_PERKS_DAMAGECONTROL, 14.874*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_CURSE, 14.873*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_REVEALER, 14.872*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_SUPERHEAVY, 14.871*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_POTENTIAL, 14.869*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_RETREAT, 14.868*sqrt(numCapital))
		ResearchDemandSet(KAD_PERKS_MIRACLE, 14.867*sqrt(numCapital))
	end
	
	if (Util_CheckResearch(FIGHTERBOOST) ) then
 		local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
		if (numFighter > 1) then
			ResearchDemandSet( FIGHTERBOOST, sqrt(numFighter) * 5.0461 )
		end
	end
  if (Util_CheckResearch(CORVETTEBOOST) ) then
 		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
		if (numCorvette > 1) then
			ResearchDemandSet( CORVETTEBOOST, sqrt(numCorvette) * 5.4086 )
		end
	end
	
	if (Util_CheckResearch(NEEDLESHIPHEAVYMISSILE) ) then
		local numDestroyer = NumSquadrons( KAD_NEEDLESHIP )
		if (numDestroyer > 0) then
			ResearchDemandSet( NEEDLESHIPHEAVYMISSILE, numDestroyer * 100.0478 )
		end
	end
	if (Util_CheckResearch(SNAILHEAVYMISSILE) ) then
		local numDestroyer = NumSquadrons( KAD_SNAIL )
		if (numDestroyer > 0) then
			ResearchDemandSet( SNAILHEAVYMISSILE, numDestroyer * 10.0782 )
		end
	end
	if (Util_CheckResearch(MISSILEPODLONGRANGEMISSILE) ) then
		local numDestroyer = NumSquadrons( KAD_MISSILEPOD )
		if (numDestroyer > 2) then
			ResearchDemandSet( MISSILEPODLONGRANGEMISSILE, numDestroyer * 10.0469 )
		end
	end
	
----------------Path To Victory code--------------------

	local numRU = GetRU()

	if (Util_CheckResearch(HYPERSPACETECH) and numRU > 2000) then
		ResearchDemandSet( HYPERSPACETECH, 10.0749 )
	end
	
	if (Util_CheckResearch(SUPCAPTECH) and IsResearchDone(HYPERSPACETECH) == 1) then
		ResearchDemandSet( SUPCAPTECH, 10.0767 )
	end
	
	if (Util_CheckResearch(HYPERSPACETECH_FRIGLINK) and IsResearchDone(HYPERSPACETECH) and numRU > 5000) then
		ResearchDemandSet( HYPERSPACETECH_FRIGLINK, 1.076 )
	end

	
	if setAIFunctions_KAD[s_playerIndex+1] == 0 then			--can return to conventional AI if ai.lua fails
		--local playertype = random(1, 4)
		--aitrace("Random AI profile: ".. playertype)
		--if playertype == 1 then
		--	gardener[s_playerIndex+1] = 1
		--	print("GARDENER style is granted for player index: "..s_playerIndex..", game year: "..year)
		--elseif playertype == 2 then
		--	kadesh[s_playerIndex+1] = 1
		--	print("KADESH style is granted for player index: "..s_playerIndex..", game year: "..year)
		--elseif playertype == 3 then
		--	sajuuk[s_playerIndex+1] = 1
		--	print("SAJUUK style is granted for player index: "..s_playerIndex..", game year: "..year)
		--else
		--	hybrid[s_playerIndex+1] = 1
		--	print("HYBRID style is granted for player index: "..s_playerIndex..", game year: "..year)
		--end
		--aitrace("set AI build as follows: ".. playertype)
		--setAIFunctions_KAD[s_playerIndex+1] = 1
		
		-- GARDEN
		if (kad_cpu_personality[s_playerIndex+1] == 1) then		--gardener[s_playerIndex+1] == 1
			if (Util_CheckResearch(GARDEN1)) then
				aitrace("GARDEN1")
				ResearchDemandSet( GARDEN1, 99.2729 )
			end
			if (Util_CheckResearch(GARDEN2) and IsResearchDone(GARDEN1) == 1 and numRU > 2000) then
				aitrace("GARDEN2")
				ResearchDemandSet( GARDEN2, 99.8279 )
			end		
			if (Util_CheckResearch(GARDEN3) and IsResearchDone(GARDEN2) == 1 and numRU > 2000) then
				aitrace("GARDEN3")
				ResearchDemandSet( GARDEN3, 99.3749 )
			end
			if kad_cpu_subpersonality[s_playerIndex+1] == 1 then
				if (Util_CheckResearch(SAJUUK1) and IsResearchDone(GARDEN3) == 1 and numRU > 2000) then
					aitrace("SAJUUK1")
					ResearchDemandSet( SAJUUK1, 99.3476 )
				end	
			else
				if (Util_CheckResearch(KADESH1) and IsResearchDone(GARDEN3) == 1 and numRU > 2000) then
					aitrace("KADESH1")
					ResearchDemandSet( KADESH1, 99.2969 )
				end	
			end
		end
		
		-- SAJUUK
		if (kad_cpu_personality[s_playerIndex+1] == 2) then		--sajuuk[s_playerIndex+1] == 1
			if (Util_CheckResearch(SAJUUK1)) then
				aitrace("SAJUUK1")
				ResearchDemandSet( SAJUUK1, 99.8027 )
			end
			if (Util_CheckResearch(SAJUUK2) and IsResearchDone(SAJUUK1) == 1 and numRU > 2000) then
				aitrace("SAJUUK2")
				ResearchDemandSet( SAJUUK2, 99.7973 )
			end		
			if (Util_CheckResearch(SAJUUK3) and IsResearchDone(SAJUUK2) == 1 and numRU > 2000) then
				aitrace("SAJUUK3")
				ResearchDemandSet( SAJUUK3, 99.3438 )
			end
			if kad_cpu_subpersonality[s_playerIndex+1] == 1 then
				if (Util_CheckResearch(KADESH1) and IsResearchDone(SAJUUK3) == 1 and numRU > 2000) then
					aitrace("KADESH1")
					ResearchDemandSet( KADESH1, 99.8678 )
				end	
			else
				if (Util_CheckResearch(GARDEN1) and IsResearchDone(SAJUUK3) == 1 and numRU > 2000) then
					aitrace("GARDEN1")
					ResearchDemandSet( GARDEN1, 99.6373 )
				end	
			end
		end
		
		-- KADESH
		if (kad_cpu_personality[s_playerIndex+1] == 3) then			--kadesh[s_playerIndex+1] == 1
			if (Util_CheckResearch(KADESH1)) then
				aitrace("KADESH1")
				ResearchDemandSet( KADESH1, 99.1803 )
			end
			if (Util_CheckResearch(KADESH2) and IsResearchDone(KADESH1) == 1 and numRU > 2000) then
				aitrace("KADESH2")
				ResearchDemandSet( KADESH2, 99.1677 )
			end		
			if (Util_CheckResearch(KADESH3) and IsResearchDone(KADESH2) == 1 and numRU > 2000) then
				aitrace("KADESH3")
				ResearchDemandSet( KADESH3, 99.1638 )
			end
			if kad_cpu_subpersonality[s_playerIndex+1] == 1 then
				if (Util_CheckResearch(GARDEN1) and IsResearchDone(KADESH3) == 1 and numRU > 2000) then
					aitrace("GARDEN1")
					ResearchDemandSet( GARDEN1, 99.1628 )
				end	
			else
				if (Util_CheckResearch(SAJUUK1) and IsResearchDone(KADESH3) == 1 and numRU > 2000) then
					aitrace("SAJUUK1")
					ResearchDemandSet( SAJUUK1, 99.1767 )
				end	
			end
		end
		
		-- HYBRID
		if (kad_cpu_personality[s_playerIndex+1] == 4) then			--hybrid[s_playerIndex+1] == 1
			if (Util_CheckResearch(KADESH1)) then
				aitrace("HYBRID1")
				ResearchDemandSet( KADESH1, 99.4086 )
			end
			if (Util_CheckResearch(KADESH2) and IsResearchDone(KADESH1) == 1 and numRU > 2000) then
				aitrace("HYBRID2")
				ResearchDemandSet( KADESH2, 99.4128 )
			end		
			if kad_cpu_subpersonality[s_playerIndex+1] == 1 then
				if (Util_CheckResearch(GARDEN1) and IsResearchDone(KADESH2) == 1 and numRU > 2000) then
					aitrace("GARDEN1")
					ResearchDemandSet( GARDEN1, 99.7551 )
				end
				if (Util_CheckResearch(GARDEN2) and IsResearchDone(GARDEN1) == 1 and numRU > 2000) then
					aitrace("GARDEN2")
					ResearchDemandSet( GARDEN2, 99.4768 )
				end	
			else
				if (Util_CheckResearch(SAJUUK1) and IsResearchDone(KADESH2) == 1 and numRU > 2000) then
					aitrace("SAJUUK1")
					ResearchDemandSet( SAJUUK1, 99.4608 )
				end
				if (Util_CheckResearch(SAJUUK2) and IsResearchDone(SAJUUK1) == 1 and numRU > 2000) then
					aitrace("SAJUUK2")
					ResearchDemandSet( SAJUUK2, 99.4116 )
				end		
			end
		end
		
	end
	
	-- garden T1 tech
	if (IsResearchDone(GARDEN1) == 1) then
		if (Util_CheckResearch(GARDENCAPITALSPEED1) and numRU > 2000) then
			ResearchDemandSet( GARDENCAPITALSPEED1, 3.4487 )
		end
		
		if (Util_CheckResearch(GARDENFRIGATESPEED1) and numRU > 2000) then
			ResearchDemandSet( GARDENFRIGATESPEED1, 3.7579 )
		end
		
		if (Util_CheckResearch(GARDENPODDAMAGE) and numRU > 2000) then
			ResearchDemandSet( GARDENPODDAMAGE, 4.7146 )
		end
		
		if (Util_CheckResearch(GARDENWILLOFTHEGARDEN) and numRU > 2000) then
			ResearchDemandSet( GARDENWILLOFTHEGARDEN, 4.1761 )
		end			
	end

		-- garden t2 tech
	if (IsResearchDone(GARDEN2) == 1) then
		if (Util_CheckResearch(GARDENCAPITALSPEED2) and IsResearchDone(GARDENCAPITALSPEED1) == 1 and numRU > 2000) then
			ResearchDemandSet( GARDENCAPITALSPEED2, 3.4087 )
		end
		
		if (Util_CheckResearch(GARDENFRIGATESPEED2) and IsResearchDone(GARDENFRIGATESPEED2) == 1 and numRU > 2000) then
			ResearchDemandSet( GARDENFRIGATESPEED2, 3.1761 )
		end	

		if (Util_CheckResearch(GARDENPODSPEED) and numRU > 1000) then
			ResearchDemandSet( GARDENPODSPEED, 4.4679)
		end	

		if (Util_CheckResearch(HEAVYSWARMEROVERLOAD) and NumSquadrons( KAD_HEAVYSWARMER_NEW ) > 2 and numRU > 2000) then
			ResearchDemandSet( HEAVYSWARMEROVERLOAD, 4.7172)
		end			

		if (Util_CheckResearch(GARDENERHARVESTBOOST) and numRU > 2000) then
			ResearchDemandSet( GARDENERHARVESTBOOST, 4.7691)
		end		

		if (Util_CheckResearch(DMGUPGRADEMISSPOD) and NumSquadrons( KAD_MISSILEPOD ) > 2 and numRU > 2000) then
			ResearchDemandSet( DMGUPGRADEMISSPOD, 4.4637)
		end
		
		if (Util_CheckResearch(CUSTODIANHEAVYMISSILE) and numRU > 2000 ) then
			local numDestroyer = NumSquadrons( KAD_CUSTODIAN )
			if (numDestroyer > 0) then
				ResearchDemandSet( CUSTODIANHEAVYMISSILE, numDestroyer * 10.7579 )
			end
		end
	
	end

	-- garden t3
	if (IsResearchDone(GARDEN3) == 1) then
		if (Util_CheckResearch(GARDENCAPITALSPEED3) and IsResearchDone(GARDENCAPITALSPEED2) == 1 and numRU > 2000) then
			ResearchDemandSet( GARDENCAPITALSPEED3, 3.7249 )
		end
		
		if (Util_CheckResearch(GARDENFRIGATESPEED3) and IsResearchDone(GARDENFRIGATESPEED3) == 1 and numRU > 2000) then
			ResearchDemandSet( GARDENFRIGATESPEED3, 3.4579 )
		end	
		
		if (Util_CheckResearch(PODSHIPBUILDSPEED) and numRU > 2000) then
			ResearchDemandSet( PODSHIPBUILDSPEED, 3.7416 )
		end
		
		if (Util_CheckResearch(NEEDLESHIPBUILDBOOST) and numRU > 2200) then
			ResearchDemandSet( NEEDLESHIPBUILDBOOST, 3.2789 )
		end
		
		if (Util_CheckResearch(NEEDLESHIPADVANCEDATFIELD) and numRU > 3200) then
			ResearchDemandSet( NEEDLESHIPADVANCEDATFIELD, 3.9849 )
		end

		if (Util_CheckResearch(GARDENOFTHORNS) and numRU > 2500) then
			ResearchDemandSet( GARDENOFTHORNS, 3.4608 )
		end					
		
		if (Util_CheckResearch(GARDENOFTHORNS_TEMPLAR) and numRU > 2500) then
			local numTemplar = NumSquadrons( KAD_DESTROYER_REAL )
			if (numTemplar >= 1) then
				ResearchDemandSet( GARDENOFTHORNS_TEMPLAR, 2.7471*numTemplar )
			end
		end
		
		if (Util_CheckResearch(GARDENERAFTERBURNER) and numRU > 2000) then
			ResearchDemandSet( GARDENERAFTERBURNER, 4.4546 )
		end	
		
		if (Util_CheckResearch(CUSTODIANDARKREALM1) and numRU > 3000 ) then
			local numDestroyer = NumSquadrons( KAD_CUSTODIAN )
			if (numDestroyer > 0) then
				ResearchDemandSet( CUSTODIANDARKREALM1, numDestroyer * 10.7911 )
			end
		end
		if (Util_CheckResearch(CUSTODIANDARKREALM2) and numRU > 5000 ) then
			local numDestroyer = NumSquadrons( KAD_CUSTODIAN )
			if (numDestroyer > 0) then
				ResearchDemandSet( CUSTODIANDARKREALM2, numDestroyer * 9.1545 )
			end
		end
		if (Util_CheckResearch(CUSTODIANDARKREALM3) and numRU > 7000 ) then
			local numDestroyer = NumSquadrons( KAD_CUSTODIAN )
			if (numDestroyer > 0) then
				ResearchDemandSet( CUSTODIANDARKREALM3, numDestroyer * 8.4121 )
			end
		end
	end
	
	-- sajuuk t1
	if (IsResearchDone(SAJUUK1) == 1) then
		if (Util_CheckResearch(SAJUUKFRIGATEDAMAGE1) and numRU > 1000) then
			ResearchDemandSet( SAJUUKFRIGATEDAMAGE1, 4.4115)
		end	
		
		if (Util_CheckResearch(SAJUUKCAPITALDAMAGE1) and numRU > 1000) then
			ResearchDemandSet( SAJUUKCAPITALDAMAGE1, 4.1568)
		end	
		
		if (Util_CheckResearch(LATEGAMESCOUTUPGRADE_TWISTED) and numRU > 2000) then
			ResearchDemandSet( LATEGAMESCOUTUPGRADE_TWISTED, 4.1245)
		end	
		
		if (Util_CheckResearch(SAJUUKBLESSSWARMER) and numRU > 2000) then
			ResearchDemandSet( SAJUUKBLESSSWARMER, 4.4567)
		end	
		
		if (Util_CheckResearch(SAJUUKTWISTEDFAIITH) and numRU > 1000) then
			ResearchDemandSet( SAJUUKTWISTEDFAIITH, 4.7158)
		end	
		
		if (Util_CheckResearch(AUCCRACYGUNPODSAK) and numRU > 1000) then
			ResearchDemandSet( AUCCRACYGUNPODSAK, 4.7155)
		end	
		
		if (IsResearchDone(GARDENOFTHORNS) == 1) then
			if (Util_CheckResearch(TAINTEDGARDEN) and numRU > 2000) then
				ResearchDemandSet( TAINTEDGARDEN, 4.1598)
			end				
		end
		
		if (IsResearchDone(GARDENOFTHORNS_TEMPLAR) == 1) then
			if (Util_CheckResearch(TAINTEDGARDEN_TEMPLAR) and numRU > 2000) then
				local numTemplar = NumSquadrons( KAD_DESTROYER_REAL )
				if (numTemplar >= 1) then
					ResearchDemandSet( TAINTEDGARDEN_TEMPLAR, 2.7518*numTemplar)
				end
			end				
		end
	end
	
	-- sajuuk t2
	if (IsResearchDone(SAJUUK2) == 1) then
		if (Util_CheckResearch(SAJUUKFRIGATEDAMAGE2) and IsResearchDone(SAJUUKFRIGATEDAMAGE1) == 1 and numRU > 2000) then
			ResearchDemandSet( SAJUUKFRIGATEDAMAGE2, 3.1239 )
		end
		
		if (Util_CheckResearch(SAJUUKCAPITALDAMAGE2) and IsResearchDone(SAJUUKCAPITALDAMAGE1) == 1 and numRU > 2000) then
			ResearchDemandSet( SAJUUKCAPITALDAMAGE2, 3.7178 )
		end	
		
		if (Util_CheckResearch(TF_MULTIBEAM) and NumSquadrons( KAD_MULTIBEAM_NEW ) > 2 and numRU > 2000) then
			ResearchDemandSet( TF_MULTIBEAM, 4.7573)
		end		
		
		if (Util_CheckResearch(TF_PULSESWARMER) and NumSquadrons( KAD_PULSARSWARMER ) > 2 and numRU > 2000) then
			ResearchDemandSet( TF_PULSESWARMER, 4.7517)
		end	
		
		if (Util_CheckResearch(TF_IONPOD) and NumSquadrons( KAD_IONPOD ) > 2 and numRU > 2000) then
			ResearchDemandSet( TF_IONPOD, 4.6087)
		end	
		
		if (Util_CheckResearch(TF_BATTLECRUISER) and NumSquadrons( KAD_DESTROYER ) > 2 and numRU > 2000) then
			ResearchDemandSet( TF_BATTLECRUISER, 4.0796)
		end	
		
		--if (Util_CheckResearch(TF_TEMPLAR) and NumSquadrons( KAD_DESTROYER_REAL ) > 2 and numRU > 2000) then
		--	ResearchDemandSet( TF_TEMPLAR, 4)
		--end
		
		if (IsResearchDone(KADESH2) == 1) then
			if (Util_CheckResearch(SAJUUKIONPODDMG) and IsResearchDone(TF_IONPOD) == 1 and numRU > 2000) then
				ResearchDemandSet( SAJUUKIONPODDMG, 4.3893)
			end	
			
			if (Util_CheckResearch(SAJUUKMULTIBEAMDMG) and IsResearchDone(TF_MULTIBEAM) == 1 and numRU > 2000) then
				ResearchDemandSet( SAJUUKMULTIBEAMDMG, 4.5834)
			end	
		end
	end	
	
	-- sajuuk t3
	if (IsResearchDone(SAJUUK3) == 1) then
		if (Util_CheckResearch(SAJUUKFRIGATEDAMAGE3) and IsResearchDone(SAJUUKFRIGATEDAMAGE2) == 1 and numRU > 2000) then
			ResearchDemandSet( SAJUUKFRIGATEDAMAGE3, 3.1089 )
		end
		
		if (Util_CheckResearch(SAJUUKCAPITALDAMAGE3) and IsResearchDone(SAJUUKCAPITALDAMAGE2) == 1 and numRU > 2000) then
			ResearchDemandSet( SAJUUKCAPITALDAMAGE3, 3.5407 )
		end		
		
		if (Util_CheckResearch(SAJUUKHYPERSPACE) and IsResearchDone(HYPERSPACETECH) and numRU > 2000) then
			ResearchDemandSet( SAJUUKHYPERSPACE, 4.0728)
		end	
		
		if (Util_CheckResearch(SAJUUKREGENRATE) and numRU > 1000) then
			ResearchDemandSet( SAJUUKREGENRATE, 4.7272)
		end
		
		local rank_isCommodore = NumSubSystems(ISCOMMODORE)
		if rank_isCommodore > 0 then
			if (Util_CheckResearch(SAJUUK_HIC1) and numRU > 2000) then
				local numNeedle = NumSquadrons( KAD_NEEDLESHIP )
				if numNeedle > 0 then
					ResearchDemandSet( SAJUUK_HIC1, numNeedle*6.1708)
				end
			end
		end
		local rank_isAdmiral = NumSubSystems(ISADMIRAL)
		if rank_isAdmiral > 0 then
			if (Util_CheckResearch(SAJUUK_HIC2) and numRU > 4000) then
				local numNeedle = NumSquadrons( KAD_NEEDLESHIP )
				if numNeedle > 0 then
					ResearchDemandSet( SAJUUK_HIC2, numNeedle*5.8075)
				end
			end
		end
		local rank_isFleetAdmiral = NumSubSystems(ISFLEETADMIRAL)
		if rank_isFleetAdmiral > 0 then
			if (Util_CheckResearch(SAJUUK_HIC3) and numRU > 6000) then
				local numNeedle = NumSquadrons( KAD_NEEDLESHIP )
				if numNeedle > 0 then
					ResearchDemandSet( SAJUUK_HIC3, numNeedle*4.5091)
				end
			end
		end
	end
	
	-- kadesh t1
	if (IsResearchDone(KADESH1) == 1) then
		if (Util_CheckResearch(KADESHPODARMOR1) and numRU > 1000) then
			ResearchDemandSet( KADESHPODARMOR1, 4.8025)
		end	
		
		if (Util_CheckResearch(KADESHCAPSHIPARMOR1) and numRU > 1000) then
			ResearchDemandSet( KADESHCAPSHIPARMOR1, 4.4208)
		end		
		
		if (Util_CheckResearch(ARMORUPGRADESWARMERKADESH) and numRU > 1000) then
			ResearchDemandSet( ARMORUPGRADESWARMERKADESH, 4.7991)
		end		
		
		if (Util_CheckResearch(LATEGAMESCOUTUPGRADEKADESH) and numRU > 1000) then
			ResearchDemandSet( LATEGAMESCOUTUPGRADEKADESH, 4.4504)
		end		
		
		if (Util_CheckResearch(KADESHFURYOFKADESH) and numRU > 500) then
			ResearchDemandSet( KADESHFURYOFKADESH, 4.1077)
		end		
	end
	
	-- kadesh t2
	if (IsResearchDone(KADESH2) == 1) then
		if (Util_CheckResearch(KADESHPODARMOR2) and IsResearchDone(KADESHPODARMOR1) == 1 and numRU > 2000) then
			ResearchDemandSet( KADESHPODARMOR2, 3.4508 )
		end
		
		if (Util_CheckResearch(KADESHCAPSHIPARMOR2) and IsResearchDone(KADESHCAPSHIPARMOR1) == 1 and numRU > 2000) then
			ResearchDemandSet( KADESHCAPSHIPARMOR2, 3.7408 )
		end	

		if (Util_CheckResearch(FRIGATEHEALTHUPGRADE) and numRU > 1000) then
			ResearchDemandSet( FRIGATEHEALTHUPGRADE, 4.1709)
		end		

		if (Util_CheckResearch(KADESHNEEDLEBUILDSPEED) and numRU > 1000) then
			ResearchDemandSet( KADESHNEEDLEBUILDSPEED, 4.7087)
		end		

		if (Util_CheckResearch(KADESHBLESSEDSWARM) and numRU > 1000) then
			ResearchDemandSet( KADESHBLESSEDSWARM, 4.3899)
		end	

		if (IsResearchDone(GARDEN2) == 1) then
			if (Util_CheckResearch(BLESSEDGARDEN) and numRU > 1000) then
				ResearchDemandSet( BLESSEDGARDEN, 4.5422)
			end				
		end
	end
	
	-- kadesh t3
	if (IsResearchDone(KADESH3) == 1) then
				if (Util_CheckResearch(KADESHPODARMOR3) and IsResearchDone(KADESHPODARMOR2) == 1 and numRU > 2000) then
			ResearchDemandSet( KADESHPODARMOR2, 3.0877 )
		end
		
		if (Util_CheckResearch(KADESHCAPSHIPARMOR3) and IsResearchDone(KADESHCAPSHIPARMOR2) == 1 and numRU > 2000) then
			ResearchDemandSet( KADESHCAPSHIPARMOR3, 3.4661 )
		end	
		
		if (Util_CheckResearch(PURIFICATION) and numRU > 1000) then
			ResearchDemandSet( PURIFICATION, 4.2081)
		end		

		if (Util_CheckResearch(DMGUPGRADEPURIFIER) and numRU > 1000) then
			ResearchDemandSet( DMGUPGRADEPURIFIER, 4.1409)
		end				
		
		if (Util_CheckResearch(SPEARSOFKADESH) and NumSquadrons( KAD_DESTROYER_REAL ) > 0 and numRU > 2000) then
			ResearchDemandSet( SPEARSOFKADESH, 4.7319)
		end		
		
		if (Util_CheckResearch(DIVINEINTERVENTION) and NumSquadrons( KAD_DESTROYER ) > 0 and numRU > 2000) then
			ResearchDemandSet( DIVINEINTERVENTION, 4.0867)
		end
		
		local rank_isCommodore = NumSubSystems(ISCOMMODORE)
		if rank_isCommodore > 0 then
			if (Util_CheckResearch(KADESH_HIC1) and numRU > 2000) then
				local numNeedle = NumSquadrons( KAD_NEEDLESHIP )
				if numNeedle > 0 then
					ResearchDemandSet( KADESH_HIC1, numNeedle*6.7019)
				end
			end
		end
		local rank_isAdmiral = NumSubSystems(ISADMIRAL)
		if rank_isAdmiral > 0 then
			if (Util_CheckResearch(KADESH_HIC2) and numRU > 4000) then
				local numNeedle = NumSquadrons( KAD_NEEDLESHIP )
				if numNeedle > 0 then
					ResearchDemandSet( KADESH_HIC2, numNeedle*5.2784)
				end
			end
		end
		local rank_isFleetAdmiral = NumSubSystems(ISFLEETADMIRAL)
		if rank_isFleetAdmiral > 0 then
			if (Util_CheckResearch(KADESH_HIC3) and numRU > 6000) then
				local numNeedle = NumSquadrons( KAD_NEEDLESHIP )
				if numNeedle > 0 then
					ResearchDemandSet( KADESH_HIC3, numNeedle*4.4331)
				end
			end
		end
	end
end

function DoResearchTechDemand_Raider()	

---determina la velocit?del gioco
  local gamespeed = 1
  if IsResearchDone( GAMESPEED3 ) == 1 then
	  gamespeed = 1.2
	elseif IsResearchDone( GAMESPEED2 ) == 1 then
	  gamespeed = 1
	elseif IsResearchDone( GAMESPEED1 ) == 1 then
	  gamespeed = 0.8
	end	 		   

---difficulty level	
  local dif_lvl = 0
  if g_LOD > 2 then
    dif_lvl = 3
  else
  	dif_lvl = g_LOD
  end 

---pirate level	
  local pir_lvl = 0
  if IsResearchDone(GHOSTTECH) == 1 then
    pir_lvl = 4
  elseif IsResearchDone(CAP_UNLOCK3) == 1 then
    pir_lvl = 3
  elseif IsResearchDone(CAP_UNLOCK2) == 1 then
    pir_lvl = 2
  elseif IsResearchDone(CAP_UNLOCK1) == 1 then
    pir_lvl = 1
  end
  
---rank level	
  local rnk_lvl = 0
  if IsResearchDone(ISFLEETADMIRAL) == 1 then
    rnk_lvl = 6
  elseif IsResearchDone(ISADMIRAL) == 1 then
    rnk_lvl = 5
  elseif IsResearchDone(ISCOMMODORE) == 1 then
    rnk_lvl = 4
  elseif IsResearchDone(ISCAPTAIN) == 1 then
    rnk_lvl = 3
  elseif IsResearchDone(ISCOMMANDER) == 1 then
    rnk_lvl = 2
  elseif IsResearchDone(ISLIEUTENANT) == 1 then
    rnk_lvl = 1
  end

---economically sound  
  local economicallysound = 0
  if GetRU() > 5000 then
    economicallysound = 50
  elseif GetRU() > 10000 then
    economicallysound = 75
  elseif GetRU() > 15000 then
    economicallysound = 100
  end  	  	

---AI  	
  if (Util_CheckResearch(ISAI) ) then
	  ResearchDemandSet( ISAI, 199.5421 )		--99
	end				
	if g_LOD == 0 then
	  if (Util_CheckResearch(ISEASY) ) then
		  ResearchDemandSet( ISEASY, 199.4582 )		--75
		end	
	elseif g_LOD == 1 then
	  if (Util_CheckResearch(ISSTANDARD) ) then
		  ResearchDemandSet( ISSTANDARD, 199.4241 )		--75
		end	
	elseif g_LOD == 2 then
	  if (Util_CheckResearch(ISHARD) ) then
		  ResearchDemandSet( ISHARD, 199.4249 )		--75
		end	
	elseif g_LOD > 2 then
	  if (Util_CheckResearch(ISEXPERT) ) then
		  ResearchDemandSet( ISEXPERT, 199.4156 )		--75
		end	
	end	

---NEBULA
  if (Util_CheckResearch(NEBULA) ) then
	  ResearchDemandSet( NEBULA, 99.4564 )
	end	
	
---resource
  --if GetRU() > 4000 - dif_lvl * 500 then	
    if (Util_CheckResearch(RESOURCE1) ) then
		  ResearchDemandSet( RESOURCE1, 99.7528+pir_lvl*4 )
		end		
  --end
  if GetRU() > 14000 - dif_lvl * 1000 then	
    if (Util_CheckResearch(RESOURCE2) ) then
		  ResearchDemandSet( RESOURCE2, 99.1561+pir_lvl*3 )
		end		
  end
  if GetRU() > 34000 - dif_lvl * 2000 then	
    if (Util_CheckResearch(RESOURCE3) ) then
		  ResearchDemandSet( RESOURCE3, 99.5468+pir_lvl*2 )
		end		
  end
  if GetRU() > 64000 - dif_lvl * 4000 then	
    if (Util_CheckResearch(RESOURCE4) ) then
		  ResearchDemandSet( RESOURCE4, 99.4183+pir_lvl )
		end		
  end

---Rank
	local rank_isLieutenant = NumSubSystems(ISLIEUTENANT)
	if rank_isLieutenant > 0 and GetRU() > 1000 - dif_lvl * 100 then
	  if (Util_CheckResearch(ISLIEUTENANT) ) then
		  ResearchDemandSet( ISLIEUTENANT, 199.5461 - 20.5481*(4-pir_lvl) )
		end
	end
	local rank_isCommander = NumSubSystems(ISCOMMANDER)
	if rank_isCommander > 0 and GetRU() > 2000 - dif_lvl * 200 then
	  if (Util_CheckResearch(ISCOMMANDER) ) then
		  ResearchDemandSet( ISCOMMANDER, 189.4186 - 20.5281*(4-pir_lvl) )
		end
	end
	local rank_isCaptain = NumSubSystems(ISCAPTAIN)
	if rank_isCaptain > 0 and GetRU() > 3000 - dif_lvl * 300 then
	  if (Util_CheckResearch(ISCAPTAIN) ) then
		  ResearchDemandSet( ISCAPTAIN, 179.1781 - 20.4567*(4-pir_lvl) )
		end
	end
	local rank_isCommodore = NumSubSystems(ISCOMMODORE)
	if rank_isCommodore > 0 and GetRU() > 4000 - dif_lvl * 400 then
	  if (Util_CheckResearch(ISCOMMODORE) ) then
		  ResearchDemandSet( ISCOMMODORE, 169.4564 - 20.1277*(4-pir_lvl) )
		end
	end
	local rank_isAdmiral = NumSubSystems(ISADMIRAL)
	if rank_isAdmiral > 0 and GetRU() > 5000 - dif_lvl * 500 and IsResearchDone(RESOURCE1) == 1 then		--important! in case of getting stuck!
	  if (Util_CheckResearch(ISADMIRAL) ) then
		  ResearchDemandSet( ISADMIRAL, 159.1451 - 20.4211*(4-pir_lvl) )
		end
	end
	local rank_isFleetAdmiral = NumSubSystems(ISFLEETADMIRAL)
	if rank_isFleetAdmiral > 0 and GetRU() > 6000 - dif_lvl * 600 then
	  if (Util_CheckResearch(ISFLEETADMIRAL) ) then
		  ResearchDemandSet( ISFLEETADMIRAL, 149.1267 - 20.4155*(4-pir_lvl) )
		end
	end

---crew
  if (Util_CheckResearch(CREW1) ) then
	  ResearchDemandSet( CREW1, 199.4567 - 20.1672*(4-pir_lvl) )
	end			
	if (Util_CheckResearch(CREW2) ) then
	  ResearchDemandSet( CREW2, 189.2156 - 20.5468*(4-pir_lvl) )
	end			
	if (Util_CheckResearch(CREW3) ) then
	  ResearchDemandSet( CREW3, 179.1264 - 20.7815*(4-pir_lvl) )
	end				
	if (Util_CheckResearch(CREW4) ) then
	  ResearchDemandSet( CREW4, 169.1267 - 20.5489*(4-pir_lvl) )
	end				
	if (Util_CheckResearch(CREW5) ) then
	  ResearchDemandSet( CREW5, 159.1266 - 20.2191*(4-pir_lvl) )
	end		
	if (Util_CheckResearch(CREW6) ) then
	  ResearchDemandSet( CREW6, 149.8468 - 20.2453*(4-pir_lvl) )
	end		
---officer
  if (Util_CheckResearch(OFFICER1) ) then
	  ResearchDemandSet( OFFICER1, 199.4782 - 20.4562*(4-pir_lvl) )
	end			
	if (Util_CheckResearch(OFFICER2) ) then
	  ResearchDemandSet( OFFICER2, 189.5489 - 20.4568*(4-pir_lvl) )
	end			
	if (Util_CheckResearch(OFFICER3) ) then
	  ResearchDemandSet( OFFICER3, 179.4568 - 20.8516*(4-pir_lvl) )
	end				
	if (Util_CheckResearch(OFFICER4) ) then
	  ResearchDemandSet( OFFICER4, 169.1569 - 20.1264*(4-pir_lvl) )
	end				
	if (Util_CheckResearch(OFFICER5) ) then
	  ResearchDemandSet( OFFICER5, 159.4587 - 20.2158*(4-pir_lvl) )
	end	

--energy
  if (Util_CheckResearch(ENERGYPRODUCTION1) ) then
	  ResearchDemandSet( ENERGYPRODUCTION1, 150.5481 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION2) ) then
	  ResearchDemandSet( ENERGYPRODUCTION2, 140.5789 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION3) ) then
	  ResearchDemandSet( ENERGYPRODUCTION3, 130.2163 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION4) ) then
	  ResearchDemandSet( ENERGYPRODUCTION4, 120.8671 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION5) ) then
	  ResearchDemandSet( ENERGYPRODUCTION5, 110.4591 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION6) ) then
	  ResearchDemandSet( ENERGYPRODUCTION6, 100.4568 )
	end	
  if (Util_CheckResearch(ENERGYPRODUCTION7) ) then
	  ResearchDemandSet( ENERGYPRODUCTION7, 90.5467 + rnk_lvl + pir_lvl )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION8) ) then
	  ResearchDemandSet( ENERGYPRODUCTION8, 90.4561 + rnk_lvl + pir_lvl )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION9) ) then
	  ResearchDemandSet( ENERGYPRODUCTION9, 90.4864 + rnk_lvl + pir_lvl )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION10) ) then
	  ResearchDemandSet( ENERGYPRODUCTION10, 90.4255 + rnk_lvl + pir_lvl )
	end			

	if (Util_CheckResearch(FIGHTERBOOST) ) then
 		local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
		if (numFighter > 1) then
			ResearchDemandSet( FIGHTERBOOST, sqrt(numFighter) * 5.2081 )
		end
	end
  if (Util_CheckResearch(CORVETTEBOOST) ) then
 		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
		if (numCorvette > 1) then
			ResearchDemandSet( CORVETTEBOOST, sqrt(numCorvette) * 5.3211 )
		end
	end

----------------Path To Victory code--------------------
	
	local cap_number_raider = s_militaryPop			--Stats_EnemyShipsCaptured(s_playerIndex)
	local kill_number_raider = 0.05 * gameTime()			--Stats_TotalKills(s_playerIndex)

	if (Util_CheckResearch(GHOSTTECH) and IsResearchDone(CAP_UNLOCK3) == 1 and (cap_number_raider >= 14 or kill_number_raider >= 60)) then
		aitrace("-------------------------- CPU Getting: PIRATE LORD")
		ResearchDemandSet( GHOSTTECH, 99.2816 + rnk_lvl*rnk_lvl )
	end
	
	-- this comment is nonsential
	if (Util_CheckResearch(CAP_UNLOCK3) and IsResearchDone(CAP_UNLOCK2) == 1 and (cap_number_raider >= 6 or kill_number_raider >= 30)) then
		aitrace("-------------------------- CPU Getting: Cap_Unlock3")
		ResearchDemandSet( CAP_UNLOCK3, 99.2134 + rnk_lvl*rnk_lvl )
	end

	if (Util_CheckResearch(CAP_UNLOCK2) and IsResearchDone(CAP_UNLOCK1) == 1 and (cap_number_raider >= 3 or kill_number_raider >= 15)) then
		aitrace("-------------------------- CPU Getting: Cap_Unlock2")
		ResearchDemandSet( CAP_UNLOCK2, 99.2116 + rnk_lvl*rnk_lvl )
	end
		
	if (Util_CheckResearch(CAP_UNLOCK1)) then
		aitrace("-------------------------- CPU Getting: Cap_Unlock1")
		ResearchDemandSet( CAP_UNLOCK1, 109.4464 + rnk_lvl*rnk_lvl)
	end
	
	if (Util_CheckResearch(SCOUTEMPABILITYBCION) ) then
		local numBombers = NumSquadrons( RAD_MISSILECORVETTE )
		if (numBombers > 2) then
				ResearchDemandSet( SCOUTEMPABILITYBCION, numBombers * 5.4544 )
		end
	end	
	
	if (Util_CheckResearch(LACEDGUNS) ) then
		local numBombers = NumSquadrons( RAD_GUNCORVETTE )
		if (numBombers > 2) then
				ResearchDemandSet( LACEDGUNS, numBombers * 5.4567 )
		end
	end	
	
	if (Util_CheckResearch(SNOOPTORPEDO) ) then
		local numBombers = NumSquadrons( RAD_SCOUTCORVETTE )
		if (numBombers > 2) then
				ResearchDemandSet( SNOOPTORPEDO, numBombers * 5.4564 )
		end
	end	
		
	if (Util_CheckResearch(RANDOMCLOAK) and IsResearchDone(CAPTURED_IONFRIG) == 1 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numBombers = NumSquadrons( RAD_BEAMFRIGATE )
		if (numBombers > 2) then
				ResearchDemandSet( RANDOMCLOAK, numBombers * 5.5445 )
		end
	end	
	
	if (Util_CheckResearch(WPMISSILES) and (IsResearchDone(CAPTURED_MISSILEFRIG) == 1 and IsResearchDone(CAP_UNLOCK2) == 1)) then
		local numBombers = NumSquadrons( RAD_FENCER )
		if (numBombers > 2) then
				ResearchDemandSet( WPMISSILES, numBombers * 5.2481 )
		end
	end	
	
	if (Util_CheckResearch(HEAVYGUNS) and IsResearchDone(CAPTURED_ASSAULTFRIG) == 1) then
		local numBombers = NumSquadrons( RAD_INTERCEPTOR )
		if (numBombers > 2) then
				ResearchDemandSet( HEAVYGUNS, numBombers * 5.4046 )
		end
	end

	if (Util_CheckResearch(RANDOMCLOAKII) and IsResearchDone(CAPTURED_MARINEFRIG) == 1 and IsResearchDone(CAP_UNLOCK1) == 1) then
		local numBombers = NumSquadrons( RAD_GUNFRIGATE )
		if (numBombers > 2) then
				ResearchDemandSet( RANDOMCLOAKII, numBombers * 5.4546 )
		end
	end
	
	if (Util_CheckResearch(OUTLAWSWHACK) and IsResearchDone(CAPTURED_MISSILEFRIG) == 1 and IsResearchDone(CAP_UNLOCK2) == 1) then
		local numBombers = NumSquadrons( RAD_GUNFRIGATE )
		if (numBombers > 1) then
				ResearchDemandSet( OUTLAWSWHACK, numBombers * 5.1871 )
		end
	end
	
	if (Util_CheckResearch(SPITTINLEADSUPER) and IsResearchDone(CAPTURED_ASSAULTFRIG) == 1 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numBombers = NumSquadrons( RAD_GATTLINGFRIGATE )
		if (numBombers > 1) then
				ResearchDemandSet( SPITTINLEADSUPER, numBombers * 5.5991 )
		end
	end
	
	if (Util_CheckResearch(FRIGATESUPERGUNS) and IsResearchDone(CAPTURED_IONFRIG) == 1 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numBombers = NumSquadrons( RAD_BEAMFRIGATE )
		if (numBombers > 1) then
				ResearchDemandSet( FRIGATESUPERGUNS, numBombers * 5.4642 )
		end
	end
	
	if (Util_CheckResearch(RANDOMCLOAKMORGAN) and IsResearchDone(CAPTURED_MARINEFRIG) == 1 and IsResearchDone(GHOSTTECH) == 1) then
		local numBombers = NumSquadrons( RAD_GUNFRIGATE_MORGAN )
		if (numBombers > 1) then
				ResearchDemandSet( RANDOMCLOAKMORGAN, numBombers * 5.2162 )
		end
	end
	
	if (Util_CheckResearch(DMGUPGRADETHUG) and (IsResearchDone(CAPTURED_SUPPORTFRIG) == 1 and IsResearchDone(CAP_UNLOCK2) == 1)) then
		local numBombers = NumSquadrons( RAD_BOMBER )
		if (numBombers > 2) then
				ResearchDemandSet( DMGUPGRADETHUG, numBombers * 5.5412 )
		end
	end
	
	--if (Util_CheckResearch(IEDFRIENDLYPROTECTION) and IsResearchDone(CAP_UNLOCK2) == 1) then
		--local numExploTraps = NumSquadrons( RAD_EXPLOTRAP )
		--if (numExploTraps > 2) then
				--ResearchDemandSet( IEDFRIENDLYPROTECTION, numExploTraps )
		--end
	--end
	if (Util_CheckResearch(IEDEFP) and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numExploTraps = NumSquadrons( RAD_EXPLOTRAP )
		if (numExploTraps > 2) then
				ResearchDemandSet( IEDEFP, numExploTraps+0.2134 )
		end
	end
	
	if (Util_CheckResearch(LATEGAMESCOUTUPGRADERAIDER_OL) and (IsResearchDone(CAPTURED_SUPPORTFRIG) == 1 and IsResearchDone(CAP_UNLOCK1) == 1)) then
		ResearchDemandSet( LATEGAMESCOUTUPGRADERAIDER_OL, 5.4046 )
	end
	
	if (Util_CheckResearch(DMGUPGRADEASSASSIN) and (IsResearchDone(CAPTURED_CAPION) == 1 and IsResearchDone(CAPTURED_IONFRIG) == 1 and IsResearchDone(CAP_UNLOCK3) == 1)) then
		local numBombers = NumSquadrons( RAD_BEAMFRIGATE )
		if (numBombers > 2) then
				ResearchDemandSet( DMGUPGRADEASSASSIN, numBombers * 5.4956 )
		end
	end
	
	if (Util_CheckResearch(DMGUPGRADEMURDERER) and (IsResearchDone(CAPTURED_CAPTORP) == 1 and IsResearchDone(CAPTURED_MISSILEFRIG) == 1 and IsResearchDone(CAP_UNLOCK2) == 1)) then
		local numBombers = NumSquadrons( RAD_MISSILEFRIGATE )
		if (numBombers > 2) then
				ResearchDemandSet( DMGUPGRADEMURDERER, numBombers * 5.2192 )
		end
	end
	
	if (Util_CheckResearch(SLAVEHARVESTBOOST) and IsResearchDone(CAPTURED_CAPLASER) == 1) then
		ResearchDemandSet( SLAVEHARVESTBOOST, 4.8991 )
	end
	
	if (Util_CheckResearch(ACCURACYUPGRADELORD) and IsResearchDone(CAPTURED_CAPGUNS) == 1) then
		local numCarrier = NumSquadrons( RAD_CARRIER )
		if (numCarrier > 1) then
			ResearchDemandSet( ACCURACYUPGRADELORD, numCarrier * 40.5436 )
		end
	end
	
	if (Util_CheckResearch(ACCURACYUPGRADEGUNSLINGER) and IsResearchDone(CAPTURED_CAPPLASMA) == 1 and IsResearchDone(CAP_UNLOCK2) == 1) then
		local numGunfrigate = NumSquadrons( RAD_GATTLINGFRIGATE )
		if (numGunfrigate > 2) then
			ResearchDemandSet( ACCURACYUPGRADEGUNSLINGER, numGunfrigate * 5.9104 )
		end
	end
	
	if (Util_CheckResearch(PLATFORMCLOAK) and IsResearchDone(GHOSTTECH) == 1) then
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 2) then
				ResearchDemandSet( PLATFORMCLOAK, numPlatform * 3.5469 )
		end
	end
	
	if (Util_CheckResearch(POWERPLANTCLOAK) and IsResearchDone(GHOSTTECH) == 1) then
		local numBombers = NumSquadrons( RAD_POWERSTATION )
		if (numBombers > 0) then
				ResearchDemandSet( POWERPLANTCLOAK, 12.6648 )
		end
	end

	if (Util_CheckResearch(PLATFORMHEALTHUPGRADE1) and IsResearchDone(CAP_UNLOCK2) == 1) then
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 2) then
				ResearchDemandSet( PLATFORMHEALTHUPGRADE1, numPlatform * 2.4107 )
		end
	end
	
	if (Util_CheckResearch(PLATFORMHEALTHUPGRADE2) and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 2) then
				ResearchDemandSet( PLATFORMHEALTHUPGRADE2, numPlatform * 2.5508 )
		end
	end
	
	if (Util_CheckResearch(PLATFORMHEALTHUPGRADE3) and IsResearchDone(GHOSTTECH) == 1) then
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 2) then
				ResearchDemandSet( PLATFORMHEALTHUPGRADE3, numPlatform * 2.4588 )
		end
	end
	
	if (Util_CheckResearch(PLATFORMHEALTHREGUPGRADE1) and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )
		if (numPlatform > 2) then
				ResearchDemandSet( PLATFORMHEALTHREGUPGRADE1, numPlatform * 2.2403 )
		end
	end
	
	if (Util_CheckResearch(PSHEALTHUPGRADE1) and IsResearchDone(CAP_UNLOCK2) == 1) then
		local numPlatform = NumSquadrons( RAD_POWERSTATION )
		if (numPlatform > 0) then
				ResearchDemandSet( PSHEALTHUPGRADE1, 10.3732 )
		end
	end
	
	if (Util_CheckResearch(PSHEALTHUPGRADE2) and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numPlatform = NumSquadrons( RAD_POWERSTATION )
		if (numPlatform > 0) then
				ResearchDemandSet( PSHEALTHUPGRADE2, 9.0569 )
		end
	end
	
	if (Util_CheckResearch(PSHEALTHUPGRADE3) and IsResearchDone(GHOSTTECH) == 1) then
		local numPlatform = NumSquadrons( RAD_POWERSTATION )
		if (numPlatform > 0) then
				ResearchDemandSet( PSHEALTHUPGRADE3, 8.9488 )
		end
	end

	if (Util_CheckResearch(GREENBEANS) and IsResearchDone(GHOSTTECH) == 1) then
		local numBombers = NumSquadrons( RAD_GUNTRAP )
		if (numBombers > 1) then
				ResearchDemandSet( GREENBEANS, numBombers * 5.4677 )
		end
	end
	
	if (Util_CheckResearch(GREENBEANS_PS) and IsResearchDone(GHOSTTECH) == 1) then
		local numBombers = NumSquadrons( RAD_POWERSTATION )
		if (numBombers > 0) then
				ResearchDemandSet( GREENBEANS_PS, 11.0862 )
		end
	end
	
	if (Util_CheckResearch(GREENBEANS_MS) and IsResearchDone(GHOSTTECH) == 1) then
		local numBombers = NumSquadrons( RAD_MOTHERSHIP )
		if (numBombers > 0) then
				ResearchDemandSet( GREENBEANS_MS, 11.4471 )
		end
	end
	
	local numRU = GetRU()
	
	if (Util_CheckResearch(RANDOM_ARMOR) and numRU > 2000) then
		ResearchDemandSet( RANDOM_ARMOR, 2.4182 )
	end	
	
	if (Util_CheckResearch(RANDOM_DAMAGE) and numRU > 2000) then
		ResearchDemandSet( RANDOM_DAMAGE, 2.6506 )
	end	
	
	if (Util_CheckResearch(RANDOM_ACCURACY) and numRU > 2000) then
		ResearchDemandSet( RANDOM_ACCURACY, 2.2108 )
	end	
	
	if (Util_CheckResearch(RANDOM_ARMOR_FRIGATE) and numRU > 2000 and IsResearchDone(CAP_UNLOCK1) == 1) then
		ResearchDemandSet( RANDOM_ARMOR_FRIGATE, 2.4691 )
	end	
	
	if (Util_CheckResearch(RANDOM_FRIGATEHYPERSPACEUNLOCK) and numRU > 2000 and IsResearchDone(CAP_UNLOCK1) == 1) then
		ResearchDemandSet( RANDOM_FRIGATEHYPERSPACEUNLOCK, 2.9341 )
	end	
	
	if (Util_CheckResearch(RANDOM_CAPSHIPHYPERSPACEUNLOCK) and numRU > 2000 and IsResearchDone(CAP_UNLOCK2) == 1) then
		ResearchDemandSet( RANDOM_CAPSHIPHYPERSPACEUNLOCK, 2.4164 )
	end	
	
	if (Util_CheckResearch(RANDOM_SPEED_FRIGATE) and numRU > 2000 and IsResearchDone(CAP_UNLOCK1) == 1) then
		ResearchDemandSet( RANDOM_SPEED_FRIGATE, 2.1348 )
	end	
	
	if (Util_CheckResearch(RANDOM_ACCURACY_ENFORCER) and numRU > 2000 and IsResearchDone(CAP_UNLOCK3) == 1) then
		ResearchDemandSet( RANDOM_ACCURACY_ENFORCER, 2.2446 )
	end	
	
	if (Util_CheckResearch(ARMORUPGRADEENFORCER1) and numRU > 2000 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numCruiser = NumSquadrons( RAD_CRUISER )
		if (numCruiser > 1) then
			ResearchDemandSet( ARMORUPGRADEENFORCER1, numCruiser * 40.4167 )
		end
	end	
	
	if (Util_CheckResearch(ARMORUPGRADEENFORCER2) and numRU > 2000 and IsResearchDone(ARMORUPGRADEENFORCER1) == 1) then
		local numCruiser = NumSquadrons( RAD_CRUISER )
		if (numCruiser > 1) then
			ResearchDemandSet( ARMORUPGRADEENFORCER2, numCruiser * 40.1234 )
		end
	end	
	
	if (Util_CheckResearch(ARMORUPGRADELORD1) and numRU > 2000 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numCarrier = NumSquadrons( RAD_CARRIER )
		if (numCarrier > 1) then
			ResearchDemandSet( ARMORUPGRADELORD1, numCarrier * 40.6749 )
		end
	end	
	
	if (Util_CheckResearch(ARMORUPGRADELORD2) and numRU > 2000 and IsResearchDone(ARMORUPGRADELORD1) == 1) then
		local numCarrier = NumSquadrons( RAD_CARRIER )
		if (numCarrier > 1) then
			ResearchDemandSet( ARMORUPGRADELORD2, numCarrier * 40.4562 )
		end
	end	
	
	if (Util_CheckResearch(LATEGAMESCOUTUPGRADERAIDER) and numRU > 2000 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numCarrier = NumSquadrons( RAD_CARRIER )
		if (numCarrier > 1) then
			ResearchDemandSet( LATEGAMESCOUTUPGRADERAIDER, numCarrier * 40.4214 )
		end
	end
	
	if (Util_CheckResearch(CARRIERSUPERSPEED) and numRU > 2000 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numCarrier = NumSquadrons( RAD_CARRIER )
		if (numCarrier >= 1) then
			ResearchDemandSet( CARRIERSUPERSPEED, numCarrier * 40.4967 )
		end
	end
	
	if (Util_CheckResearch(CARRIERSUPERCLOAK) and numRU > 4000 and IsResearchDone(GHOSTTECH) == 1) then
		local numCarrier = NumSquadrons( RAD_CARRIER_BLACK )
		if (numCarrier >= 1) then
			ResearchDemandSet( CARRIERSUPERCLOAK, numCarrier * 40.4097 )
		end
	end
	
	if (Util_CheckResearch(TERMINALSENSITIVEPROJECTILEENFORCER) and numRU > 6000 and IsResearchDone(CAP_UNLOCK3) == 1) then
		local numCruiser = NumSquadrons( RAD_CRUISER )
		if (numCruiser > 1) then
			ResearchDemandSet( TERMINALSENSITIVEPROJECTILEENFORCER, numCruiser * 40.0787 )
		end
	end
	
	if (Util_CheckResearch(REFURBISHEDDESTROYERGUNS) and numRU > 5000 and IsResearchDone(ISCAPTAIN) == 1) then
		local numCruiser = NumSquadrons( RAD_REFURBISHEDDESTROYER )
		if (numCruiser > 0) then
			ResearchDemandSet( REFURBISHEDDESTROYERGUNS, numCruiser * 40.4648 )
		end
	end
	
	if (Util_CheckResearch(ASSBUSTERTECH) and numRU > 6000 and IsResearchDone(ISADMIRAL) == 1) then
		local demand = ShipDemandGet(RAD_VANAARJET)
		if (demand > 0) then
			ResearchDemandSet( ASSBUSTERTECH, demand*2.4546 + economicallysound*(1+dif_lvl) )
		end
	end

end

function DoResearchTechDemand_Vaygr()	

---determina la velocit?del gioco
  local gamespeed = 1
  if IsResearchDone( GAMESPEED3 ) == 1 then
	  gamespeed = 1.2
	elseif IsResearchDone( GAMESPEED2 ) == 1 then
	  gamespeed = 1
	elseif IsResearchDone( GAMESPEED1 ) == 1 then
	  gamespeed = 0.8
	end	 		   

---economically sound  
  local economicallysound = 0
  if GetRU() > 5000 then
    economicallysound = 50
  elseif GetRU() > 10000 then
    economicallysound = 75
  elseif GetRU() > 15000 then
    economicallysound = 100
  end  	  	

---AI  	
  if (Util_CheckResearch(ISAI) ) then
	  ResearchDemandSet( ISAI, 199.5467 )		--99
	end				
	if g_LOD == 0 then
	  if (Util_CheckResearch(ISEASY) ) then
		  ResearchDemandSet( ISEASY, 199.4122 )		--75
		end	
	elseif g_LOD == 1 then
	  if (Util_CheckResearch(ISSTANDARD) ) then
		  ResearchDemandSet( ISSTANDARD, 199.2478 )		--75
		end	
	elseif g_LOD == 2 then
	  if (Util_CheckResearch(ISHARD) ) then
		  ResearchDemandSet( ISHARD, 199.2456 )		--75
		end	
	elseif g_LOD > 2 then
	  if (Util_CheckResearch(ISEXPERT) ) then
		  ResearchDemandSet( ISEXPERT, 199.4542 )		--75
		end	
	end	

---NEBULA
  if (Util_CheckResearch(NEBULA) ) then
	  ResearchDemandSet( NEBULA, 99.5808 )
	end	
	
---platforms/mine
  if (Util_CheckResearch(CANBUILDGUNPLATFORMS) ) then
	  ResearchDemandSet( CANBUILDGUNPLATFORMS, 99.4264 )
	end		
	
---resource
  if GetRU() > 4000 then	
    if (Util_CheckResearch(RESOURCE1) ) then
		  ResearchDemandSet( RESOURCE1, 99.4583 )
		end		
  end
  if GetRU() > 14000 then	
    if (Util_CheckResearch(RESOURCE2) ) then
		  ResearchDemandSet( RESOURCE2, 99.9396 )
		end		
  end
  if GetRU() > 34000 then	
    if (Util_CheckResearch(RESOURCE3) ) then
		  ResearchDemandSet( RESOURCE3, 99.4393 )
		end		
  end
  if GetRU() > 64000 then	
    if (Util_CheckResearch(RESOURCE4) ) then
		  ResearchDemandSet( RESOURCE4, 99.5408 )
		end		
  end
	
---crew
  if (Util_CheckResearch(CREW1) ) then
	  ResearchDemandSet( CREW1, 199.5237 )
	end			
	if (Util_CheckResearch(CREW2) ) then
	  ResearchDemandSet( CREW2, 189.5873 )
	end			
	if (Util_CheckResearch(CREW3) ) then
	  ResearchDemandSet( CREW3, 179.2993 )
	end				
	if (Util_CheckResearch(CREW4) ) then
	  ResearchDemandSet( CREW4, 169.4157 )
	end				
	if (Util_CheckResearch(CREW5) ) then
	  ResearchDemandSet( CREW5, 159.5277 )
	end		
	if (Util_CheckResearch(CREW6) ) then
	  ResearchDemandSet( CREW6, 149.7372 )
	end		
---officer
  if (Util_CheckResearch(OFFICER1) ) then
	  ResearchDemandSet( OFFICER1, 199.4254 )
	end			
	if (Util_CheckResearch(OFFICER2) ) then
	  ResearchDemandSet( OFFICER2, 189.4168 )
	end			
	if (Util_CheckResearch(OFFICER3) ) then
	  ResearchDemandSet( OFFICER3, 179.0486 )
	end				
	if (Util_CheckResearch(OFFICER4) ) then
	  ResearchDemandSet( OFFICER4, 169.4214 )
	end				
	if (Util_CheckResearch(OFFICER5) ) then
	  ResearchDemandSet( OFFICER5, 159.1078 )
	end	

--energy
  if (Util_CheckResearch(ENERGYPRODUCTION1) ) then
	  ResearchDemandSet( ENERGYPRODUCTION1, 150.7122 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION2) ) then
	  ResearchDemandSet( ENERGYPRODUCTION2, 140.8557 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION3) ) then
	  ResearchDemandSet( ENERGYPRODUCTION3, 130.7699 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION4) ) then
	  ResearchDemandSet( ENERGYPRODUCTION4, 120.7173 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION5) ) then
	  ResearchDemandSet( ENERGYPRODUCTION5, 110.7867 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION6) ) then
	  ResearchDemandSet( ENERGYPRODUCTION6, 100.7468 )
	end	
  if (Util_CheckResearch(ENERGYPRODUCTION7) ) then
	  ResearchDemandSet( ENERGYPRODUCTION7, 90.7116 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION8) ) then
	  ResearchDemandSet( ENERGYPRODUCTION8, 80.1156 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION9) ) then
	  ResearchDemandSet( ENERGYPRODUCTION9, 70.4814 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION10) ) then
	  ResearchDemandSet( ENERGYPRODUCTION10, 60.4214 )
	end			
	
  if (Util_CheckResearch(CAPITALRETIRE) ) then
	  ResearchDemandSet( CAPITALRETIRE, 10.4454 )
	end
	
  ---Tactical Reinforcements-----
  local bias = -0.5
  local limit = 2 --max value
  local damp = 10	--slower growth
	--Fighter
	local Fighter_MaxDemand = ShipDemandMaxByClass(eFighter)
	if (Util_CheckResearch(FIGHTERREINFORCEMENTS1) ) then
		ResearchDemandSet( FIGHTERREINFORCEMENTS1, bias+sigmoid(Fighter_MaxDemand/2.0511, limit, damp) )
	end
	if (Util_CheckResearch(FIGHTERREINFORCEMENTS2) ) then
		ResearchDemandSet( FIGHTERREINFORCEMENTS2, bias+sigmoid(Fighter_MaxDemand/2.4525, limit, damp) )
	end
	if g_LOD > 1 then
		if (Util_CheckResearch(FIGHTERREINFORCEMENTS3) ) then
			ResearchDemandSet( FIGHTERREINFORCEMENTS3, bias+sigmoid(Fighter_MaxDemand/2.8544, limit, damp) )
		end
	end
	if g_LOD > 2 then
		if (Util_CheckResearch(FIGHTERREINFORCEMENTSE) ) then
			ResearchDemandSet( FIGHTERREINFORCEMENTSE, bias+sigmoid(Fighter_MaxDemand/3.3561, limit, damp) )
		end
	end
	--Corvette
	local Corvette_MaxDemand = ShipDemandMaxByClass(eCorvette)
	if (Util_CheckResearch(CORVETTEREINFORCEMENTS1) ) then
		ResearchDemandSet( CORVETTEREINFORCEMENTS1, bias+sigmoid(Corvette_MaxDemand/2.0511, limit, damp) )
	end
	if (Util_CheckResearch(CORVETTEREINFORCEMENTS2) ) then
		ResearchDemandSet( CORVETTEREINFORCEMENTS2, bias+sigmoid(Corvette_MaxDemand/2.4525, limit, damp) )
	end
	if g_LOD > 1 then
		if (Util_CheckResearch(CORVETTEREINFORCEMENTS3) ) then
			ResearchDemandSet( CORVETTEREINFORCEMENTS3, bias+sigmoid(Corvette_MaxDemand/2.8544, limit, damp) )
		end
	end
	if g_LOD > 2 then
		if (Util_CheckResearch(CORVETTEREINFORCEMENTSE) ) then
			ResearchDemandSet( CORVETTEREINFORCEMENTSE, bias+sigmoid(Corvette_MaxDemand/3.3561, limit, damp) )
		end
	end
	--Frigate
	local Frigate_MaxDemand = ShipDemandMaxByClass(eFrigate)
	if (Util_CheckResearch(FRIGATEREINFORCEMENTS1) ) then
		ResearchDemandSet( FRIGATEREINFORCEMENTS1, bias+sigmoid(Frigate_MaxDemand/2.0511, limit, damp) )
	end
	if (Util_CheckResearch(FRIGATEREINFORCEMENTS2) ) then
		ResearchDemandSet( FRIGATEREINFORCEMENTS2, bias+sigmoid(Frigate_MaxDemand/2.4525, limit, damp) )
	end
	if g_LOD > 1 then
		if (Util_CheckResearch(FRIGATEREINFORCEMENTS3) ) then
			ResearchDemandSet( FRIGATEREINFORCEMENTS3, bias+sigmoid(Frigate_MaxDemand/2.8544, limit, damp) )
		end
	end
	if g_LOD > 2 then
		if (Util_CheckResearch(FRIGATEREINFORCEMENTSE) ) then
			ResearchDemandSet( FRIGATEREINFORCEMENTSE, bias+sigmoid(Frigate_MaxDemand/3.3561, limit, damp) )
		end
	end
	--Capital
	local Capital_MaxDemand = ShipDemandMaxByClass(eCapital)
	if (Util_CheckResearch(CAPITALREINFORCEMENTS1) ) then
		ResearchDemandSet( CAPITALREINFORCEMENTS1, bias+sigmoid(Capital_MaxDemand/2.0511, limit, damp) )
	end
	if (Util_CheckResearch(CAPITALREINFORCEMENTS2) ) then
		ResearchDemandSet( CAPITALREINFORCEMENTS2, bias+sigmoid(Capital_MaxDemand/2.4525, limit, damp) )
	end
	if g_LOD > 1 then
		if (Util_CheckResearch(CAPITALREINFORCEMENTS3) ) then
			ResearchDemandSet( CAPITALREINFORCEMENTS3, bias+sigmoid(Capital_MaxDemand/2.8544, limit, damp) )
		end
	end
	if g_LOD > 2 then
		if (Util_CheckResearch(CAPITALREINFORCEMENTSE) ) then
			ResearchDemandSet( CAPITALREINFORCEMENTSE, bias+sigmoid(Capital_MaxDemand/3.3561, limit, damp) )
		end
	end
	--Platform
	local Platform_MaxDemand = ShipDemandMaxByClass(ePlatform)
	if (Util_CheckResearch(PLATFORMREINFORCEMENTS1) ) then
		ResearchDemandSet( PLATFORMREINFORCEMENTS1, bias+sigmoid(Platform_MaxDemand/2.0511, limit, damp) )
	end
	if (Util_CheckResearch(PLATFORMREINFORCEMENTS2) ) then
		ResearchDemandSet( PLATFORMREINFORCEMENTS2, bias+sigmoid(Platform_MaxDemand/2.4525, limit, damp) )
	end
	if g_LOD > 1 then
		if (Util_CheckResearch(PLATFORMREINFORCEMENTS3) ) then
			ResearchDemandSet( PLATFORMREINFORCEMENTS3, bias+sigmoid(Platform_MaxDemand/2.8544, limit, damp) )
		end
	end
	if g_LOD > 2 then
		if (Util_CheckResearch(PLATFORMREINFORCEMENTSE) ) then
			ResearchDemandSet( PLATFORMREINFORCEMENTSE, bias+sigmoid(Platform_MaxDemand/3.3561, limit, damp) )
		end
	end
	--Utility
	local Utility_MaxDemand = ShipDemandMaxByClass(eCollector)
	if (Util_CheckResearch(UTILITYREINFORCEMENTS1) ) then
		ResearchDemandSet( UTILITYREINFORCEMENTS1, bias+sigmoid(Utility_MaxDemand/2.0511, limit, damp) )
	end
	if (Util_CheckResearch(UTILITYREINFORCEMENTS2) ) then
		ResearchDemandSet( UTILITYREINFORCEMENTS2, bias+sigmoid(Utility_MaxDemand/2.4525, limit, damp) )
	end
	if g_LOD > 1 then
		if (Util_CheckResearch(UTILITYREINFORCEMENTS3) ) then
			ResearchDemandSet( UTILITYREINFORCEMENTS3, bias+sigmoid(Utility_MaxDemand/2.8544, limit, damp) )
		end
	end
	if g_LOD > 2 then
		if (Util_CheckResearch(UTILITYREINFORCEMENTSE) ) then
			ResearchDemandSet( UTILITYREINFORCEMENTSE, bias+sigmoid(Utility_MaxDemand/3.3561, limit, damp) )
		end
	end
	
	if (Util_CheckResearch(HYPERSPACEGATETECH)) then		
		ResearchDemandSet( HYPERSPACEGATETECH, 100.4101 )	
	end	
	if (Util_CheckResearch(SHIPYARDTECH) ) then
		local demand = ShipDemandGet(kShipYard)
		if (demand > 0) then
			ResearchDemandSet( SHIPYARDTECH, (demand*3.4548) + economicallysound )
		end
	end		
	if (Util_CheckResearch(BATTLECARRIERTECH) ) then
		local demand = ShipDemandGet(VGR_BATTLECARRIER)
		if (demand > 0) then
			ResearchDemandSet( BATTLECARRIERTECH, demand*2.4811 + economicallysound )
		end
	end		
	if (s_militaryPop > 15 and GetRU() > 1000 and gameTime() > 1500/gamespeed) then		
		if (Util_CheckResearch(DESTROYERGUNS)) then
			local demand = ShipDemandGet(VGR_DESTROYER)
			if (demand > 0) then
				ResearchDemandSet( DESTROYERGUNS, demand )
			end
		end
		if (Util_CheckResearch(PULSEDESTROYERGUNS)) then
			local demand = ShipDemandGet(VGR_PULSEDESTROYER)
			if (demand > 0) then
				ResearchDemandSet( PULSEDESTROYERGUNS, demand )
			end
		end
		if (Util_CheckResearch(AMGUNS)) then
			local demandam = ShipDemandGet(VGR_AM)
			if (demandam > 0) then
				ResearchDemandSet( AMGUNS, demandam )
			end
		end
	end		
	if (s_militaryPop > 15 and GetRU() > 1100 and gameTime() > 1850/gamespeed) then		
		if (Util_CheckResearch(CRUISERTECH)) then
			local demand = ShipDemandGet(VGR_CRUISER)
			if (demand > 0) then
				ResearchDemandSet( CRUISERTECH, demand )
			end
		end
	end			
  if (s_militaryPop > 15 and GetRU() > 1200 and gameTime() > 1950/gamespeed) then		
		if (Util_CheckResearch(ARTILLERYTECH)) then
			local demand = ShipDemandGet(VGR_ARTILLERYSHIP)
			if (demand > 0) then
				ResearchDemandSet( ARTILLERYTECH, demand )
			end
		end
	end		
  if (s_militaryPop > 15 and GetRU() > 1300 and gameTime() > 2050/gamespeed) then		
		if (Util_CheckResearch(IONCRUISERTECH)) then
			local demand = ShipDemandGet(VGR_LIGHTCRUISER)
			if (demand > 0) then
				ResearchDemandSet( IONCRUISERTECH, demand )
			end
		end
	end
	if (s_militaryPop > 16 and GetRU() > 1300 and gameTime() > 2300/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)		
		if (numShipyards > 0 and Util_CheckResearch(SINNERTECH)) then
		local battleCruiserDemand = ShipDemandGet( VGR_SINNER )
			if (battleCruiserDemand > 0) then
				ResearchDemandSet( SINNERTECH, battleCruiserDemand + economicallysound )
			end
		end	
	end

--Keeper
	if (s_militaryPop > 17 and GetRU() > 1400) then				
		if (Util_CheckResearch(KEEPERIONWEAPONS)) then
		local KeeperDemand = ShipDemandGet( VGR_HAMMERHEAD )
			if (KeeperDemand > 0) then
				ResearchDemandSet( KEEPERIONWEAPONS, KeeperDemand + economicallysound )
			end
		end	
	end
		
	if (s_militaryPop > 17 and GetRU() > 1400 and gameTime() > 2500/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)		
		if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERIONWEAPONS)) then
		local battleCruiserDemand = ShipDemandGet( VGR_BATTLECRUISER )
			if (battleCruiserDemand > 0) then
				ResearchDemandSet( BATTLECRUISERIONWEAPONS, battleCruiserDemand + economicallysound )
			end
		end	
	end
	if (s_militaryPop > 19 and GetRU() > 1500 and gameTime() > 2500/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
		if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERNUKEWEAPONS)) then
		local battleCruiserDemand = ShipDemandGet( VGR_BATTLECRUISER_HERO )
			if (battleCruiserDemand > 0) then
				ResearchDemandSet( BATTLECRUISERNUKEWEAPONS, battleCruiserDemand + economicallysound )
			end
		end	
	end
	if (s_militaryPop > 18 and GetRU() > 1500 and gameTime() > 2700/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)		
		if (numShipyards > 0 and Util_CheckResearch(MISSILEBATTLECRUISERIONWEAPONS)) then
		local battleCruiserDemand = ShipDemandGet( VGR_MISSILEBATTLECRUISER )
			if (battleCruiserDemand > 0) then
				ResearchDemandSet( MISSILEBATTLECRUISERIONWEAPONS, battleCruiserDemand + economicallysound )
			end
		end	
	end
--Peacemaker
	if (s_militaryPop > 17 and GetRU() > 1500 and gameTime() > 2600/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)		
		if (numShipyards > 0 and Util_CheckResearch(PEACEMAKERTECH)) then
		local PeacemakerDemand = ShipDemandGet( VGR_HEAVYCRUISER )
			if (PeacemakerDemand > 0) then
				ResearchDemandSet( PEACEMAKERTECH, PeacemakerDemand + economicallysound )
			end
		end
	end		
	
	if (s_militaryPop > 18 and GetRU() > 1600 and gameTime() > 2700/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)		
		if (numShipyards > 0 and Util_CheckResearch(BATTLESHIPTECH)) then
		local BattleshipDemand = ShipDemandGet( VGR_ALKHALID )
			if (BattleshipDemand > 0) then
				ResearchDemandSet( BATTLESHIPTECH, BattleshipDemand + economicallysound )
			end
		end		
	end	
	if (s_militaryPop > 18 and GetRU() > 1700 and gameTime() > 2800/gamespeed) then		
		local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)		
		if (numShipyards > 0 and Util_CheckResearch(DREADNAUGHTTECH)) then
		local DreadnaughtDemand = ShipDemandGet( VGR_DREADNAUGHT )
			if (DreadnaughtDemand > 0) then
				ResearchDemandSet( DREADNAUGHTTECH, DreadnaughtDemand + economicallysound )
			end
		end	
	end	
	if (s_militaryPop > 19 and GetRU() > 1800 and gameTime() > 2850/gamespeed) then		
		if Util_CheckResearch(COMMANDFORTRESSTECH) then
		  local CommandFortressDemand = ShipDemandGet( VGR_COMMANDFORTRESS )
			if (CommandFortressDemand > 0) then
				ResearchDemandSet( COMMANDFORTRESSTECH, CommandFortressDemand + economicallysound )
			end
		end			
	end		
---Titan			
	if (s_militaryPop > 18 and GetRU() > 8000) then
		if Util_CheckResearch(TITANTECH) then
		local TitanDemand = ShipDemandGet( VGR_SUPERBATTLESHIP ) + ShipDemandGet( VGR_BATTLESHIP ) + ShipDemandGet( VGR_MISSLEDREADNAUGHT )
			if (TitanDemand > 0) then
				ResearchDemandSet( TITANTECH, TitanDemand + economicallysound )
			end
		end			
	end
---Sajuuk			
	if (s_militaryPop > 19 and GetRU() > 10000) then
		if Util_CheckResearch(SAJUUKTECH) then
		local SajuukDemand = ShipDemandGet( VGR_ARTILLERYBATTLECRUISER )
			if (SajuukDemand > 0) then
				ResearchDemandSet( SAJUUKTECH, SajuukDemand + economicallysound )
			end
		end			
	end
--	if (s_militaryPop > 19 and GetRU() > 50000) then
--		if Util_CheckResearch(SAJUUKTECHAI) then
--		local SajuukDemand = ShipDemandGet( VGR_ARTILLERYBATTLECRUISER )
--			if (SajuukDemand > 0) then
--				ResearchDemandSet( SAJUUKTECHAI, 99 )
--			end
--		end			
--	end
	
	--Vaygr AI is just boring, need more variation
	local numtoadd = 1
	if g_LOD == 0 then
		numtoadd = 1
	elseif g_LOD == 1 then
		numtoadd = 2
	elseif g_LOD > 1 then
		numtoadd = 3
	end
	local time_factor = (100+sqrt(gameTime()))/100
	--if time_factor > 2 then
		--time_factor = 2
	--end
	local variation_factor = sqrt(numtoadd)+(2*numtoadd/time_factor)^2
	
	if (Util_CheckResearch(LANCEBEAMS)) then
		local lancedemand = ShipDemandGet(VGR_LANCEFIGHTER)
		if (lancedemand > 0) then
			ResearchDemandSet( LANCEBEAMS, lancedemand * variation_factor ) 
		end
	end
	if gameTime() > 800/gamespeed then	
		if (Util_CheckResearch(DEFENDERTECH)) then
			local defenderdemand = ShipDemandGet(VGR_DEFENDER)
			if (defenderdemand > 0) then
				ResearchDemandSet( DEFENDERTECH, defenderdemand * variation_factor )
			end
		end	
	end		
	if gameTime() > 1100/gamespeed then	
		if (Util_CheckResearch(HEAVYFIGHTERTECH)) then
			local hfdemand = ShipDemandGet(VGR_HEAVYFIGHTER)
			if (hfdemand > 0) then
				ResearchDemandSet( HEAVYFIGHTERTECH, hfdemand * variation_factor )
			end
		end	
    if (Util_CheckResearch(MISSILEBOMBERTECH)) then
			local mbdemand = ShipDemandGet(VGR_MISSILEBOMBER)
			if (mbdemand > 0) then
				ResearchDemandSet( MISSILEBOMBERTECH, (mbdemand + 0.5) * variation_factor )
			end
		end
	end
  if gameTime() > 1300/gamespeed then	
	  if (Util_CheckResearch(MULTIROLETECH)) then
			local mfdemand = ShipDemandGet(VGR_ELITEFIGHTER)
			if (mfdemand > 0) then
				ResearchDemandSet( MULTIROLETECH, (mfdemand + 0.5) * variation_factor )
			end
		end	
	end
	if gameTime() > 1500/gamespeed then	
		if (Util_CheckResearch(BIOTECH)) then
			local biodemand = ShipDemandGet(VGR_BIOSHIP)
			if (biodemand > 0) then
				ResearchDemandSet( BIOTECH, biodemand * variation_factor )
			end
		end	
	end
	if (Util_CheckResearch(PLASMABOMBS) ) then
		local bomberdemand = ShipDemandGet( VGR_BOMBER )
		if (bomberdemand > 0) then
			ResearchDemandSet( PLASMABOMBS, (bomberdemand + 1.0) * variation_factor )
		end
	end	
	if (Util_CheckResearch(CORVETTELASER)) then
		local laserdemand = ShipDemandGet(VGR_LASERCORVETTE)
		if (laserdemand > 0) then
			ResearchDemandSet( CORVETTELASER, laserdemand * variation_factor )
		end
	end	
	if (Util_CheckResearch(CORVETTEPLASMA)) then
		local laserdemand = ShipDemandGet(VGR_PLASMACORVETTE)
		if (laserdemand > 0) then
			ResearchDemandSet( CORVETTEPLASMA, laserdemand * variation_factor )
		end
	end	
	if (Util_CheckResearch(STORMTECH)) then
		local stormdemand = ShipDemandGet(VGR_STANDVETTE)
		if (stormdemand > 0) then
			ResearchDemandSet( STORMTECH, stormdemand * variation_factor )
		end
	end	
	if gameTime() > 1050/gamespeed then
		if (Util_CheckResearch(CORVETTEMULTILANCE)) then
			local multilancedemand = ShipDemandGet(VGR_MULTILANCECORVETTE)
			if (multilancedemand > 0) then
				ResearchDemandSet( CORVETTEMULTILANCE, multilancedemand * variation_factor )
			end
		end
		if (Util_CheckResearch(MORTARTECH)) then
			local multilancedemand = ShipDemandGet(VGR_MORTARCORVETTE)
			if (multilancedemand > 0) then
				ResearchDemandSet( MORTARTECH, multilancedemand * variation_factor )
			end
		end
	end			
	if gameTime() > 1100/gamespeed then
		if (Util_CheckResearch(STRIKER)) then
			local strikerdemand = ShipDemandGet(VGR_STRIKER)
			if (strikerdemand > 0) then
				ResearchDemandSet( STRIKER, strikerdemand * variation_factor )
			end
		end
	end			
  if (Util_CheckResearch(MULTICANNONTECH)) then
		local demand = ShipDemandGet(VGR_ADVASSAULTFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( MULTICANNONTECH, demand * variation_factor )
		end
	end	
	if (Util_CheckResearch(HEAVYMISSILEFRIGATE)) then
		local demand = ShipDemandGet(VGR_HEAVYMISSILEFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( HEAVYMISSILEFRIGATE, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(SUPPORTFRIGATETECH)) then
		local demand = ShipDemandGet(VGR_SUPPORTFRIGATE)
		if (demand > 0) then
			ResearchDemandSet( SUPPORTFRIGATETECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(SUPPORTFRIGATE_LASERTECH)) then
		local demand = ShipDemandGet(VGR_SUPPORTFRIGATE_LASER)
		if (demand > 0) then
			ResearchDemandSet( SUPPORTFRIGATE_LASERTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(SUPPORTFRIGATEARMEDTECH)) then
		local demand = ShipDemandGet(VGR_SUPPORTFRIGATEARMED)
		if (demand > 0) then
			ResearchDemandSet( SUPPORTFRIGATEARMEDTECH, demand * variation_factor )
		end
	end
	if gameTime() > 1400/gamespeed then
		if (Util_CheckResearch(ARTILLERYGUNTECH)) then
			local demand = ShipDemandGet(VGR_ARTILLERYFRIGATE)
			if (demand > 0) then
				ResearchDemandSet( ARTILLERYGUNTECH, demand * variation_factor )
			end
		end	
	end	
	if gameTime() > 1200/gamespeed then
		if (Util_CheckResearch(DEATHTECH)) then
			local deathdemand = ShipDemandGet(VGR_EMPFRIGATE)
			if (deathdemand > 0) then
				ResearchDemandSet( DEATHTECH, deathdemand * variation_factor )
			end
		end
	end	
	if gameTime() > 1700/gamespeed then
		if (Util_CheckResearch(COMMANDFRIGATETECH)) then
			local commanddemand = ShipDemandGet(VGR_COMMANDFRIGATE)
			if (commanddemand > 0) then
				ResearchDemandSet( COMMANDFRIGATETECH, commanddemand * variation_factor )
			end
		end
	end	
  if gameTime() > 1600/gamespeed then
		if (Util_CheckResearch(LONGRANGEARTILLERYGUNTECH)) then
			local demand = ShipDemandGet(VGR_LONGRANGEARTILLERYFRIGATE)
			if (demand > 0) then
				ResearchDemandSet( LONGRANGEARTILLERYGUNTECH, demand * variation_factor )
			end
		end	
	end		
	if (Util_CheckResearch(PLATFORMHEAVYMISSILES)) then
		local demand = ShipDemandGet(VGR_WEAPONPLATFORM_MISSILE)
		if (demand > 0) then
			ResearchDemandSet( PLATFORMHEAVYMISSILES, demand * variation_factor )
		end
	end	
	if (Util_CheckResearch(PLATFORMIED)) then
		local demand = ShipDemandGet(VGR_MOBILE_INHIBITOR)
		if (demand > 0) then
			ResearchDemandSet( PLATFORMIED, demand )
		end
	end
	--gravity well
	if (Util_CheckResearch(IEDPLATFORMINHIBITOR) ) then
		local numIED = NumSquadrons( VGR_MOBILE_INHIBITOR )
		if (numIED > 0) then
			ResearchDemandSet( IEDPLATFORMINHIBITOR, numIED + 0.1654 )
		end
	end
	if (Util_CheckResearch(CLOAKPLATFORM)) then
		local demand = ShipDemandGet(VGR_CLOAKPLATFORM)
		if (demand > 0) then
			ResearchDemandSet( CLOAKPLATFORM, demand * variation_factor + 0.6157 )
		end
	end
	if (Util_CheckResearch(ASSAULTCRAFTIMPROVEDGUNS) ) then
		local numBombers = NumSquadrons( VGR_INTERCEPTOR )
		if (numBombers > 2) then
			ResearchDemandSet( ASSAULTCRAFTIMPROVEDGUNS, numBombers * variation_factor + 0.1514 )
		end
	end
	if (Util_CheckResearch(LANCEFIGHTERIMPROVEDBEAMS) ) then
		local numBombers = NumSquadrons( VGR_LANCEFIGHTER )
		if (numBombers > 2) then
			ResearchDemandSet( LANCEFIGHTERIMPROVEDBEAMS, numBombers * variation_factor + 0.2456 )
		end
	end
	if (Util_CheckResearch(DEFENDERIMPROVEDGUNS) ) then
		local numBombers = NumSquadrons( VGR_DEFENDER )
		if (numBombers > 2) then
			ResearchDemandSet( DEFENDERIMPROVEDGUNS, numBombers * variation_factor + 0.5431 )
		end
	end
	if (Util_CheckResearch(HEAVYFIGHTERIMPROVEDMISSLES) ) then
		local numBombers = NumSquadrons( VGR_HEAVYFIGHTER )
		if (numBombers > 2) then
			ResearchDemandSet( HEAVYFIGHTERIMPROVEDMISSLES, numBombers * variation_factor + 0.5416 )
		end
	end
	if (Util_CheckResearch(BOMBERIMPROVEDBOMBS) ) then
		local numBombers = NumSquadrons( VGR_BOMBER )
		if (numBombers > 2) then
			ResearchDemandSet( BOMBERIMPROVEDBOMBS, numBombers * variation_factor + 0.7545 )
		end
	end		
  if (Util_CheckResearch(MULTIROLEIMPROVEDBOMBS) ) then
		local numBombers = NumSquadrons( VGR_ELITEFIGHTER )
		if (numBombers > 2) then
			ResearchDemandSet( MULTIROLEIMPROVEDBOMBS, numBombers * variation_factor + 0.9122 )
		end
	end		 
  if (Util_CheckResearch(MISSILEBOMBERIMPROVEDBOMBS) ) then
		local numBombers = NumSquadrons( VGR_MISSILEBOMBER )
		if (numBombers > 2) then
			ResearchDemandSet( MISSILEBOMBERIMPROVEDBOMBS, numBombers * variation_factor + 0.5415 )
		end
	end
	if (Util_CheckResearch(MISSLECORVETTECLUSTERMISSILES) ) then
		local numBombers = NumSquadrons( VGR_MISSILECORVETTE )
		if (numBombers > 2) then
			ResearchDemandSet( MISSLECORVETTECLUSTERMISSILES, numBombers * variation_factor + 0.1231 )
		end
	end
	if (Util_CheckResearch(LASERCORVETTEIMPROVEDLASER) ) then
		local numBombers = NumSquadrons( VGR_LASERCORVETTE )
		if (numBombers > 2) then
			ResearchDemandSet( LASERCORVETTEIMPROVEDLASER, numBombers * variation_factor + 0.1522 )
		end
	end
	if (Util_CheckResearch(PLASMACORVETTEIMPROVEDBOMBS) ) then
		local numBombers = NumSquadrons( VGR_PLASMACORVETTE )
		if (numBombers > 2) then
			ResearchDemandSet( PLASMACORVETTEIMPROVEDBOMBS, numBombers * variation_factor + 0.4891 )
		end
	end
	if (Util_CheckResearch(ASSAULTCORVETTEIMPROVEDGUNS) ) then
		local numBombers = NumSquadrons( VGR_STANDVETTE )
		if (numBombers > 2) then
			ResearchDemandSet( ASSAULTCORVETTEIMPROVEDGUNS, numBombers * variation_factor + 0.1531 )
		end
	end
	if (Util_CheckResearch(LANCECORVETTEIMPROVEDBEAMS) ) then
		local numBombers = NumSquadrons( VGR_MULTILANCECORVETTE )
		if (numBombers > 2) then
			ResearchDemandSet( LANCECORVETTEIMPROVEDBEAMS, numBombers * variation_factor + 0.1077 )
		end
	end
	if (Util_CheckResearch(MORTARCORVETTEIMPROVEDSPERM) ) then
		local numBombers = NumSquadrons( VGR_MORTARCORVETTE )
		if (numBombers > 2) then
			ResearchDemandSet( MORTARCORVETTEIMPROVEDSPERM, numBombers * variation_factor + 0.1208 )
		end
	end
	if (Util_CheckResearch(STRIKEREMPMISSILES) ) then
		local numBombers = NumSquadrons( VGR_STRIKER )
		if (numBombers > 2) then
			ResearchDemandSet( STRIKEREMPMISSILES, numBombers * variation_factor + 0.0454 )
		end
	end
---JDAM for Command Corvette			
	if (s_militaryPop > 19 and GetRU() > 5000) then
		if Util_CheckResearch(JDAMDESIGNATOR) then
			local numCommandCorvettes = NumSquadrons( VGR_COMMANDCORVETTE )
			if (numCommandCorvettes > 1) then
				ResearchDemandSet( JDAMDESIGNATOR, numCommandCorvettes * 2.0478 )
			end
		end
	end
---Repair Beam for Mechanics
	if Util_CheckResearch(REPAIRBEAM) then
		local numPatchers = NumSquadrons( VGR_PATCHER )
		if (numPatchers > 1) then
			ResearchDemandSet( REPAIRBEAM, numPatchers * 2.1651 )
		end
	end
	if (Util_CheckResearch(PERFORATEABILITY) ) then
		local numIF = NumSquadrons( VGR_INFILTRATORFRIGATE )
		if (numIF > 5) then
			ResearchDemandSet( PERFORATEABILITY, numIF + 0.4546 )
		end
	end		
	if (Util_CheckResearch(INFILTRATORFRIGATECLOAK) ) then
		local numInfiltrator = NumSquadrons( VGR_INFILTRATORFRIGATE )
		if (numInfiltrator > 2) then
			ResearchDemandSet( INFILTRATORFRIGATECLOAK, numInfiltrator + 0.2316 )
		end
	end
	if (Util_CheckResearch(IMPROVEDTORPEDOMOTHERSHIP) ) then
		local numFlagship = NumSquadrons( VGR_MOTHERSHIP )
		if (numFlagship > 0) then
			ResearchDemandSet( IMPROVEDTORPEDOMOTHERSHIP, numFlagship * 100.4142 )
		end
	end
	if (Util_CheckResearch(IMPROVEDTORPEDOSHIPYARD) ) then
		local numShipyard = NumSquadrons( VGR_SHIPYARD )
		if (numShipyard > 0) then
			ResearchDemandSet( IMPROVEDTORPEDOSHIPYARD, numShipyard * 100.4247 )
		end
	end
	if (Util_CheckResearch(IMPROVEDTORPEDODESTROYER) ) then
		local numDestroyer = NumSquadrons( VGR_DESTROYER )
		if (numDestroyer > 1) then
			ResearchDemandSet( IMPROVEDTORPEDODESTROYER, numDestroyer * 100.4141 )
		end
	end	
	if (Util_CheckResearch(UNLOCKDESTROYERTURRETS) ) then
		local numDestroyer = NumSquadrons( VGR_DESTROYER )
		if (numDestroyer > 2) then
			ResearchDemandSet( UNLOCKDESTROYERTURRETS, numDestroyer * 67.4234  )
		end
	end
	if (Util_CheckResearch(UNLOCKDESTROYERTURRETS1) ) then
		local numDestroyer = NumSquadrons( VGR_DESTROYER )
		if (numDestroyer > 2) then
			ResearchDemandSet( UNLOCKDESTROYERTURRETS1, numDestroyer * 38.2457 )
		end
	end
	if (Util_CheckResearch(MINEDESTROYER) ) then
		local numDestroyer = NumSquadrons( VGR_DESTROYER )
		if (numDestroyer > 3) then
			ResearchDemandSet( MINEDESTROYER, numDestroyer * 25.45241 )
		end
	end				
	if (Util_CheckResearch(IMPROVEDTORPEDOPULSEDESTROYER) ) then
		local numDestroyer = NumSquadrons( VGR_PULSEDESTROYER )
		if (numDestroyer > 2) then
			ResearchDemandSet( IMPROVEDTORPEDOPULSEDESTROYER, numDestroyer * 31.4281 )
		end
	end	
	if (Util_CheckResearch(MINEPULSEDESTROYER) ) then
		local numDestroyer = NumSquadrons( VGR_PULSEDESTROYER )
		if (numDestroyer > 2) then
			ResearchDemandSet( MINEPULSEDESTROYER, numDestroyer * 26.2419 )
		end
	end			
	if (Util_CheckResearch(FASTTRACKING) ) then
		local numrts = NumSquadrons( VGR_AM )
		if (numrts > 0) then
			ResearchDemandSet( FASTTRACKING, numrts * 5.4552 )
		end
	end			
	if (Util_CheckResearch(IMPROVEDTORPEDOCRUISER) ) then
		local numCruiser = NumSquadrons( VGR_CRUISER )
		if (numCruiser > 1) then
			ResearchDemandSet( IMPROVEDTORPEDOCRUISER, numCruiser * 40.4248 )
		end
	end
	if (Util_CheckResearch(IMPROVEDSINNERARMOUR1) ) then
		local numCruiser = NumSquadrons( VGR_SINNER )
		if (numCruiser >= 1) then
			ResearchDemandSet( IMPROVEDSINNERARMOUR1, numCruiser * 40.1141 )
		end
	end
	if (Util_CheckResearch(IMPROVEDSINNERARMOUR2) ) then
		local numCruiser = NumSquadrons( VGR_SINNER )
		if (numCruiser >= 1) then
			ResearchDemandSet( IMPROVEDSINNERARMOUR2, numCruiser * 40.4198 )
		end
	end
	if (Util_CheckResearch(IMPROVEDSINNERARMOUR3) ) then
		local numCruiser = NumSquadrons( VGR_SINNER )
		if (numCruiser >= 1) then
			ResearchDemandSet( IMPROVEDSINNERARMOUR3, numCruiser * 40.4168 )
		end
	end
		if (Util_CheckResearch(IMPROVEDKEEPERSHIELD) ) then
			local numKeeper = NumSquadrons( VGR_HAMMERHEAD )
			if (numKeeper >= 2) then
				ResearchDemandSet( IMPROVEDKEEPERSHIELD, numKeeper * 33.4148 )
			end
		end
		if (Util_CheckResearch(IMPROVEDSAJUUKSHIELD) ) then
			local numSajuuk = NumSquadrons( VGR_ARTILLERYBATTLECRUISER )
			if (numSajuuk >= 1) then
				ResearchDemandSet( IMPROVEDSAJUUKSHIELD, numSajuuk * 35.4687 )
			end
		end
		if (Util_CheckResearch(FIGHTERBOOST) ) then
	 		local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
			if (numFighter > 1) then
				ResearchDemandSet( FIGHTERBOOST, sqrt(numFighter) * 5.4724 )
			end
		end
	  if (Util_CheckResearch(CORVETTEBOOST) ) then
	 		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
			if (numCorvette > 1) then
				ResearchDemandSet( CORVETTEBOOST, sqrt(numCorvette) * 5.4108 )
			end
		end
	if (Util_CheckResearch(IMPROVEDTORPEDOCRUISER1) ) then
		local numCruiser = NumSquadrons( VGR_CRUISER )
		if (numCruiser > 2) then
			ResearchDemandSet( IMPROVEDTORPEDOCRUISER1, numCruiser * 35.1214 )
		end
	end		
	if (Util_CheckResearch(IMPROVEDTORPEDOLIGHTCRUISER) ) then
		local numCruiser = NumSquadrons( VGR_LIGHTCRUISER ) + NumSquadrons( VGR_LIGHTCRUISER_GUN )
		if (numCruiser > 1) then
			ResearchDemandSet( IMPROVEDTORPEDOLIGHTCRUISER, numCruiser * 40.4893 )
		end
	end
	if (Util_CheckResearch(IMPROVEDSHOTGUNLIGHTCRUISER) ) then
		local numCruiser = NumSquadrons( VGR_LIGHTCRUISER_GUN )
		if (numCruiser >= 1) then
			ResearchDemandSet( IMPROVEDSHOTGUNLIGHTCRUISER, numCruiser * 40.4339 )
		end
	end
	if (Util_CheckResearch(IMPROVEDTORPEDOBATTLECRUISER) ) then
		local numBattlecruiser = NumSquadrons( VGR_BATTLECRUISER )
		if (numBattlecruiser > 1) then
			ResearchDemandSet( IMPROVEDTORPEDOBATTLECRUISER, numBattlecruiser * 40.2439 )
		end
	end
	if (Util_CheckResearch(IMPROVEDNUKECANNONBATTLECRUISER) ) then
		local numBattlecruiser = NumSquadrons( VGR_BATTLECRUISER_HERO )
		if (numBattlecruiser >= 1) then
			ResearchDemandSet( IMPROVEDNUKECANNONBATTLECRUISER, numBattlecruiser * 40.4528 )
		end
	end
	if (Util_CheckResearch(IMPROVEDTORPEDOBATTLESHIP) ) then
		local numBattleship = NumSquadrons( VGR_ALKHALID )
		if (numBattleship > 1) then
			ResearchDemandSet( IMPROVEDTORPEDOBATTLESHIP, numBattleship * 40.4215 )
		end
	end	
	if (Util_CheckResearch(MINEBATTLESHIP) ) then
		local numBattleship = NumSquadrons( VGR_ALKHALID )
		if (numBattleship > 1) then
			ResearchDemandSet( MINEBATTLESHIP, numBattleship * 35.2556 )
		end
	end	
	if (Util_CheckResearch(FREACKERBATTLESHIP) ) then
		local numBattleship = NumSquadrons( VGR_ALKHALID )
		if (numBattleship > 1) then
			ResearchDemandSet( FREACKERBATTLESHIP, numBattleship * 30.4548 )
		end
	end
	if (Util_CheckResearch(IMPROVEDTITANBEAM) ) then
		local numBattleship = NumSquadrons( VGR_SUPERBATTLESHIP ) + NumSquadrons( VGR_BATTLESHIP ) + NumSquadrons( VGR_MISSLEDREADNAUGHT )
		if (numBattleship >= 1) then
			ResearchDemandSet( IMPROVEDTITANBEAM, numBattleship * 41.3457 )
		end
	end
	if (Util_CheckResearch(GUNTURRETANTIMISSILESYSTEM) ) then
		local numGuns = NumSquadrons( VGR_WEAPONPLATFORM_GUN )
		if (numGuns > 3) then
			ResearchDemandSet( GUNTURRETANTIMISSILESYSTEM, numGuns + 0.2718 )
		end
	end
	if (Util_CheckResearch(LANCEPLATFORMIMPROVEDBEAMS) ) then
		local numGuns = NumSquadrons( VGR_WEAPONPLATFORM_LANCE )
		if (numGuns > 3) then
			ResearchDemandSet( LANCEPLATFORMIMPROVEDBEAMS, numGuns + 0.5165 )
		end
	end
	if (Util_CheckResearch(MISSILEPLATFORMIMPROVEDMISSILES) ) then
		local numGuns = NumSquadrons( VGR_WEAPONPLATFORM_MISSILE )
		if (numGuns > 3) then
			ResearchDemandSet( MISSILEPLATFORMIMPROVEDMISSILES, numGuns + 0.5911 )
		end
	end
	if gameTime() > 1000/gamespeed then
		if (Util_CheckResearch(COORDINATEDWEAPONASSAULTFRIGATE) ) then
			local numAF = NumSquadrons( VGR_ASSAULTFRIGATE )
			if (numAF > 2) then
				ResearchDemandSet( COORDINATEDWEAPONASSAULTFRIGATE, numAF * 10.1022 )
			end
		end
	end
	if gameTime() > 2000/gamespeed then
		if (Util_CheckResearch(COORDINATEDWEAPONADVASSAULTFRIGATE) ) then
			local numAF = NumSquadrons( VGR_ADVASSAULTFRIGATE )
			if (numAF > 2) then
				ResearchDemandSet( COORDINATEDWEAPONADVASSAULTFRIGATE, numAF * 10.4592 )
			end
		end
	end
	if gameTime() > 2200/gamespeed then
		if (Util_CheckResearch(COORDINATEDWEAPONHEAVYMISSILEFRIGATE) ) then
			local numAF = NumSquadrons( VGR_HEAVYMISSILEFRIGATE )
			if (numAF > 2) then
				ResearchDemandSet( COORDINATEDWEAPONHEAVYMISSILEFRIGATE, numAF * 10.4524 )
			end
		end
	end
	if gameTime() > 2400/gamespeed then
		if (Util_CheckResearch(COORDINATEDWEAPONARTILLERYFRIGATE) ) then
			local numAF = NumSquadrons( VGR_ARTILLERYFRIGATE )
			if (numAF > 2) then
				ResearchDemandSet( COORDINATEDWEAPONARTILLERYFRIGATE, numAF * 10.1289 )
			end
		end	
	end
  if gameTime() > 2600/gamespeed then
		if (Util_CheckResearch(COORDINATEDWEAPONLONGRANGEARTILLERYFRIGATE) ) then
			local numAF = NumSquadrons( VGR_LONGRANGEARTILLERYFRIGATE )
			if (numAF > 2) then
				ResearchDemandSet( COORDINATEDWEAPONLONGRANGEARTILLERYFRIGATE, numAF * 10.1298 )
			end
		end	
	end				
	if (Util_CheckResearch(IMPROVEDTORPEDOEMPFRIGATE) ) then
		local numEMP = NumSquadrons( VGR_EMPFRIGATE )
		if (numEMP > 2) then
			ResearchDemandSet( IMPROVEDTORPEDOEMPFRIGATE, numEMP * 10.1734 )
		end
	end		
	if (Util_CheckResearch(AUTOGENRES) ) then
		local numRefinery = NumSquadrons(VGR_RESOURCECONTROLLER)
		if (numRefinery > 0) then
			ResearchDemandSet( AUTOGENRES, numRefinery * 1.3647 )
		end
	end	
	if (s_militaryPop > 7 and GetRU() > 750) then
		if (Util_CheckResearch(CORVETTETECH) ) then
			ResearchDemandSet( CORVETTETECH, 199.5482 )
		end
  end
  if (GetRU() > 900 and gameTime() > 200/gamespeed) then			
		if (Util_CheckResearch(FRIGATETECH) ) then
			ResearchDemandSet( FRIGATETECH, 199.1223 )
		end
  end			
  if (s_militaryPop > 8 and gameTime() > 800/gamespeed and GetRU() > 1000) then
		if (Util_CheckResearch(CAPITALTECH) ) then
				ResearchDemandSet( CAPITALTECH, 199.5468 )
		end
	end		
	if (s_militaryPop > 15 and GetRU() > 750) then	
		if (Util_CheckResearch(CORVETTEGRAVITICATTRACTION) ) then
			local mineLayerDemand = ShipDemandGet(VGR_MINELAYERCORVETTE)
			if (mineLayerDemand > 0) then
				ResearchDemandSet( CORVETTEGRAVITICATTRACTION, mineLayerDemand * variation_factor )
			end
		end		
		if (Util_CheckResearch(CORVETTECOMMAND)) then
			local commanddemand = ShipDemandGet(VGR_COMMANDCORVETTE)
			if (commanddemand > 0) then
				ResearchDemandSet( CORVETTECOMMAND, commanddemand * variation_factor )
			end
		end		
		if (Util_CheckResearch(FRIGATEINFILTRATIONTECH)) then
			local demand = ShipDemandGet(VGR_INFILTRATORFRIGATE)
			if (demand > 0) then
				ResearchDemandSet( FRIGATEINFILTRATIONTECH, demand * variation_factor + numtoadd )
			end
		end	
	end	
	if (s_militaryPop > 7 and GetRU() > 950) then
	  if (Util_CheckResearch(COMPUTERLINK) ) then
	    ResearchDemandSet( COMPUTERLINK, 0.8522 )
	  end		
	end			
end
function Util_CheckResearch( researchId )
	if (IsResearchDone(researchId) == 0 and 
	    IsResearchAvailable(researchId)==1) then
		return 1
	end
	return nil
end
function DoResearchTechDemand_Hiigaran()

	--Difficulty dependent factors
	local numtoadd = 1
	if g_LOD == 0 then
		numtoadd = 1
	elseif g_LOD == 1 then
		numtoadd = 2
	elseif g_LOD > 1 then
		numtoadd = 3
	end
	local time_factor = (100+sqrt(gameTime()))/100
	--if time_factor > 2 then
		--time_factor = 2
	--end
	local variation_factor = sqrt(numtoadd)+(2*numtoadd/time_factor)^2

  local researchcount = NumSubSystems(RESEARCH) + NumSubSystems(ADVANCEDRESEARCH) + NumSubSystems(ADVANCEDRESEARCH1)  

  local economicallysound = 0
  if GetRU() > 5000 then
    economicallysound = 50
  elseif GetRU() > 10000 then
    economicallysound = 75
  elseif GetRU() > 15000 then
    economicallysound = 100
  end  	  	
  
  if (Util_CheckResearch(ISAI) ) then
	  ResearchDemandSet( ISAI, 199.2138 )		--99
	end		
	if g_LOD == 0 then
	  if (Util_CheckResearch(ISEASY) ) then
		  ResearchDemandSet( ISEASY, 199.4245 )		--75
		end	
	elseif g_LOD == 1 then
	  if (Util_CheckResearch(ISSTANDARD) ) then
		  ResearchDemandSet( ISSTANDARD, 199.4519 )		--75
		end	
	elseif g_LOD == 2 then
	  if (Util_CheckResearch(ISHARD) ) then
		  ResearchDemandSet( ISHARD, 199.4387 )		--75
		end	
	elseif g_LOD > 2 then
	  if (Util_CheckResearch(ISEXPERT) ) then
		  ResearchDemandSet( ISEXPERT, 199.1238 )		--75
		end	
	end		
	
---NEBULA
  if (Util_CheckResearch(NEBULA) ) then
	  ResearchDemandSet( NEBULA, 99.1838 )
	end		
	
---platforms/mine
  if (Util_CheckResearch(CANBUILDGUNPLATFORMS) ) then
	  ResearchDemandSet( CANBUILDGUNPLATFORMS, 99.1208 )
	end		
	if (Util_CheckResearch(CANBUILDMINEMS) ) then
	  ResearchDemandSet( CANBUILDMINEMS, 99.1232 )
	end				
	
	if NumSubSystems(ADVANCEDRESEARCH1) >= 1 then		  
	  local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
		--if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERPLASMABOMBS)) then
			--local PlasmaDemand = ShipDemandGet( HGN_BATTLECRUISER )
			--if (PlasmaDemand > 0) then
				--ResearchDemandSet( BATTLECRUISERPLASMABOMBS, PlasmaDemand )
			--end
		--end	
		--if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERPLASMABOMBS1)) then
			--local PlasmaDemand1 = ShipDemandGet( HGN_BATTLECRUISER )
			--if (PlasmaDemand1 > 0) then
				--ResearchDemandSet( BATTLECRUISERPLASMABOMBS1, PlasmaDemand1 )
			--end
		--end			
    local numDestroyer = numQueueOfClass( eCapital )
		if (s_militaryPop > 16 and GetRU() > 1250) then			
			if (numShipyards > 0 and Util_CheckResearch(VORTEXTECH)) then
				local VortexDemand = ShipDemandGet( HGN_VORTEX )
				if (VortexDemand > 0) then
					ResearchDemandSet( VORTEXTECH, VortexDemand + economicallysound )
				end
			end		
		end
    local numDestroyer = numQueueOfClass( eCapital )
		if (s_militaryPop > 17 and GetRU() > 1500) then			
			if (numShipyards > 0 and Util_CheckResearch(BATTLESHIPTECH)) then
				local BattleshipDemand = ShipDemandGet( HGN_BATTLESHIP )
				if (BattleshipDemand > 0) then
					ResearchDemandSet( BATTLESHIPTECH, BattleshipDemand + economicallysound )
				end
			end		
		end			
		if (s_militaryPop > 14 and GetRU() > 1100) then
			if (Util_CheckResearch(ADVDESTROYERTECH) ) then			
				local advdestroyerDemand = ShipDemandGet(HGN_ADVDESTROYER)
				if (advdestroyerDemand > 0) then
					ResearchDemandSet( ADVDESTROYERTECH, advdestroyerDemand )
				end
			end
		end		
		if (s_militaryPop > 14 and GetRU() > 1100) then
			if (Util_CheckResearch(ARTILLERYDESTROYERTECH) ) then			
				local artillerydestroyerDemand = ShipDemandGet(HGN_ARTILLERYDESTROYER)
				if (artillerydestroyerDemand > 0) then
					ResearchDemandSet( ARTILLERYDESTROYERTECH, artillerydestroyerDemand )
				end
			end
		end		
		if (s_militaryPop > 15 and GetRU() > 1150) then
			if (Util_CheckResearch(CRUISERTECH) ) then			
				local cruiserDemand = ShipDemandGet(HGN_CRUISERA)
				if (cruiserDemand > 0) then
					ResearchDemandSet( CRUISERTECH, cruiserDemand )
				end
			end
		end		
		if (s_militaryPop > 15 and GetRU() > 1150) then
			if (Util_CheckResearch(MINIVORTEXTECH) ) then			
				local minivortexDemand = ShipDemandGet(HGN_MINIVORTEX)
				if (minivortexDemand > 0) then
					ResearchDemandSet( MINIVORTEXTECH, minivortexDemand )
				end
			end
		end				
		if (s_militaryPop > 8 and GetRU() > 1200) then
			if (Util_CheckResearch(CORVETTESQUADRON5) ) then
				local corvettedemand = ShipDemandMaxByClass( eCorvette )
				if (corvettedemand > 0) then
					ResearchDemandSet( CORVETTESQUADRON5, corvettedemand+0.5 )
				end
			end
	  end		 	   			
		if (Util_CheckResearch(ASSAULTGUNSHIPTECH)) then
			local assaultgunshipdemand = ShipDemandGet(HGN_CTH)
			if (assaultgunshipdemand > 0) then
				ResearchDemandSet( ASSAULTGUNSHIPTECH, assaultgunshipdemand)
			end
		end				
		if (Util_CheckResearch(ASSAULTGUNSHIPTECH1)) then
			local assaultgunshipdemand1 = ShipDemandGet(HGN_CTHION)
			if (assaultgunshipdemand1 > 0) then
				ResearchDemandSet( ASSAULTGUNSHIPTECH1, assaultgunshipdemand1)
			end
		end				
		if (Util_CheckResearch(TULWARTECH)) then
			local Tulwardemand = ShipDemandGet(HGN_TULWAR)
			if (Tulwardemand > 0) then
				ResearchDemandSet( TULWARTECH, Tulwardemand)
			end
		end			
		if (Util_CheckResearch(SENTINEL)) then
			local sentinelDemand = ShipDemandGet(HGN_SENTINEL)
			if (sentinelDemand > 0) then
				ResearchDemandSet( SENTINEL, sentinelDemand )
			end
		end		
	end	
	
	if NumSubSystems(ADVANCEDRESEARCH) >= 1 then		
	  if (Util_CheckResearch(RTS)) then
			local rtsDemand = ShipDemandGet(HGN_RTS)
			if (rtsDemand > 0) then
				ResearchDemandSet( RTS, rtsDemand )
			end
		end			
	  if (Util_CheckResearch(DEFENSEFIELDPLATFORMSHIELD)) then
			local dftDemand = ShipDemandGet(HGN_DEFENSEFIELDTURRET)
			if (dftDemand > 0) then
				ResearchDemandSet( DEFENSEFIELDPLATFORMSHIELD, dftDemand )
			end
		end
	  if (Util_CheckResearch(PLATFORMMISSILEWEAPONS)) then
			local missileTurretDemand = ShipDemandGet(HGN_MISSILETURRET)
			if (missileTurretDemand > 0) then
				ResearchDemandSet( PLATFORMMISSILEWEAPONS, missileTurretDemand )
			end
		end				   
	  local numShipyards = NumSquadrons(kShipYard) + NumSquadronsQ(kShipYard)
    local numDestroyer = numQueueOfClass( eCapital )
		if s_militaryPop > 16 and GetRU() > 1150 then			
			if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERIONWEAPONS)) then
				local battleCruiserDemand = ShipDemandGet( HGN_BATTLECRUISER )
				if (battleCruiserDemand > 0) then
					ResearchDemandSet( BATTLECRUISERIONWEAPONS, battleCruiserDemand + economicallysound )
				end
			end
			if (numShipyards > 0 and Util_CheckResearch(BATTLECRUISERNUKEWEAPONS)) then
				local battleCruiserDemand = ShipDemandGet( HGN_BATTLECRUISERNUKE )
				if (battleCruiserDemand > 0) then
					ResearchDemandSet( BATTLECRUISERNUKEWEAPONS, battleCruiserDemand + economicallysound )
				end
			end
		end
		if (s_militaryPop > 7 and GetRU() > 1000) then
			if (Util_CheckResearch(FIGHTERSQUADRON7) ) then
				local fighterdemand = ShipDemandMaxByClass( eFighter )
				if (fighterdemand > 0) then
					ResearchDemandSet( FIGHTERSQUADRON7, fighterdemand+0.5 )
				end
			end
	  end		 	   
	  if (Util_CheckResearch(AVENGERTECH)) then
			local avengerdemand = ShipDemandGet(HGN_HFT)
			if (avengerdemand > 0) then
				ResearchDemandSet( AVENGERTECH, avengerdemand)
			end
		end
		if (Util_CheckResearch(IMPROVEDCALLISTOAVENGER) ) then
			local numBombers = NumSquadrons( HGN_HFT ) + NumSquadrons( HGN_HFTL )
			if (numBombers > 2) then
					ResearchDemandSet( IMPROVEDCALLISTOAVENGER, numBombers * 5.4568 )
			end
		end
		if (Util_CheckResearch(BOMBERHEAVYTECH)) then
			local bomberheavydemand = ShipDemandGet(HGN_ATTACKBOMBERHEAVY)
			if (bomberheavydemand > 0) then
				ResearchDemandSet( BOMBERHEAVYTECH, bomberheavydemand)
			end
		end
		if (Util_CheckResearch(NUKEBOMBERTECH)) then
			local nukebomberdemand = ShipDemandGet(HGN_STRATEGICBOMBER)
			if (nukebomberdemand > 0) then
				ResearchDemandSet( NUKEBOMBERTECH, nukebomberdemand)
			end
		end
		if (Util_CheckResearch(MINEGUNTECH)) then
			local multigundemand = ShipDemandGet(HGN_MULTIGUNCORVETTE)
			if (multigundemand > 0) then
				ResearchDemandSet( MINEGUNTECH, multigundemand)
			end
		end
		if (Util_CheckResearch(HOWITZERCORVETTETECH)) then
			local howitzerdemand = ShipDemandGet(HGN_GUNSHIPCOEVETTE)
			if (howitzerdemand > 0) then
				ResearchDemandSet( HOWITZERCORVETTETECH, howitzerdemand)
			end
		end
		if (Util_CheckResearch(MARINETECH)) then
			local Marinedemand = ShipDemandGet(HGN_MARINEFRIGATE)
			if (Marinedemand > 0) then
				ResearchDemandSet( MARINETECH, Marinedemand * variation_factor + numtoadd)
			end
		end	
		if (Util_CheckResearch(LRMTECH)) then
			local lrmdemand = ShipDemandGet(HGN_LRMS)
			if (lrmdemand > 0) then
				ResearchDemandSet( LRMTECH, lrmdemand)
			end
		end
		if (Util_CheckResearch(IONFRIGATETECH)) then
			local IonFrigatedemand = ShipDemandGet(HGN_IONCANNONFRIGATE)
			if (IonFrigatedemand > 0) then
				ResearchDemandSet( IONFRIGATETECH, IonFrigatedemand)
			end
		end	
		if (s_militaryPop > 15 and GetRU() > 750) then		
			if (Util_CheckResearch(DEFENSEFIELDFRIGATESHIELD) ) then
				local DFFDemand = ShipDemandGet(HGN_DEFENSEFIELDFRIGATE)
				if (DFFDemand > 0) then
					ResearchDemandSet( DEFENSEFIELDFRIGATESHIELD, DFFDemand )
				end
			end			
		end		
		if (Util_CheckResearch(PLATFORMIONWEAPONS1)) then
			local ionTurretDemand = ShipDemandGet(HGN_IONTURRET)
			if (ionTurretDemand > 0) then
				ResearchDemandSet( PLATFORMIONWEAPONS1, ionTurretDemand )
			end
		end				
		if (Util_CheckResearch(ECMPROBE) ) then
			local ecmProbeDemand = ShipDemandGet(HGN_ECMPROBE)
			if (ecmProbeDemand>0) then
				ResearchDemandSet( ECMPROBE, ecmProbeDemand )
			end
		end	
		if (s_militaryPop >= 14 and GetRU() > 1050) then
			if (Util_CheckResearch(MISSILEDESTROYERTECH) ) then			
				local missiledestroyerDemand = ShipDemandGet(HGN_MISSILEDESTROYER)
				if (missiledestroyerDemand > 0) then
					ResearchDemandSet( MISSILEDESTROYERTECH, missiledestroyerDemand )
				end
			end
		end			
		if (s_militaryPop > 14 and GetRU() > 1100) then
			if (Util_CheckResearch(IONDESTROYERTECH) ) then			
				local iondestroyerDemand = ShipDemandGet(HGN_IONDESTROYER)
				if (iondestroyerDemand > 0) then
					ResearchDemandSet( IONDESTROYERTECH, iondestroyerDemand )
				end
			end
		end	
		if g_LOD == 0 then		
			if (s_militaryPop > 17 and GetRU() > 1400) then
				if (Util_CheckResearch(JUGGERNAUGHTTECH) ) then			
					local juggernaughtDemand = ShipDemandGet(HGN_JUGGERNAUGHT)
					if (juggernaughtDemand > 0) then
						ResearchDemandSet( JUGGERNAUGHTTECH, juggernaughtDemand )
					end
				end
			end		
		else
		  if (s_militaryPop > 15 and GetRU() > 1100) then
				if (Util_CheckResearch(JUGGERNAUGHTTECH) ) then			
					local juggernaughtDemand = ShipDemandGet(HGN_JUGGERNAUGHT)
					if (juggernaughtDemand > 0) then
						ResearchDemandSet( JUGGERNAUGHTTECH, juggernaughtDemand + economicallysound )
					end
				end
			end		
		end		
	end
		
	if NumSubSystems(RESEARCH) >= 1 then
	  if (Util_CheckResearch(AUTOGENRES) ) then
	  	local numRefinery = NumSquadrons(HGN_RESOURCECONTROLLER)
			if (numRefinery > 0) then
				ResearchDemandSet( AUTOGENRES, numRefinery * 1.4717 )
			end
		end		
	  if (Util_CheckResearch(INTRUDERTECH)) then
			local intruderdemand = ShipDemandGet(HGN_RAILGUNFIGHTER)
			if (intruderdemand > 0) then
				ResearchDemandSet( INTRUDERTECH, intruderdemand)
			end
		end
		if (Util_CheckResearch(INTRUDERIONABILITY) ) then
			local numBombers = NumSquadrons( HGN_RAILGUNFIGHTER ) + NumSquadrons( HGN_RAILGUNFIGHTERL )
			if (numBombers > 2) then
					ResearchDemandSet( INTRUDERIONABILITY, numBombers * 5.1644 )
			end
		end
		if (Util_CheckResearch(BOMBERVETTETECH)) then
			local pulsarcorvettedemand = ShipDemandGet(HGN_BOMBERVETTE)
			if (pulsarcorvettedemand > 0) then
				ResearchDemandSet( BOMBERVETTETECH, pulsarcorvettedemand)
			end
		end	
		if (Util_CheckResearch(TORPEDOTECH)) then
			local torpedodemand = ShipDemandGet(HGN_TORPEDOFRIGATE)
			if (torpedodemand > 0) then
				ResearchDemandSet( TORPEDOTECH, torpedodemand)
			end
		end
		if (Util_CheckResearch(PLATFORMIONWEAPONS)) then
			local pulsarTurretDemand = ShipDemandGet(HGN_PULSARTURRET)
			if (pulsarTurretDemand > 0) then
				ResearchDemandSet( PLATFORMIONWEAPONS, pulsarTurretDemand )
			end
		end
		if (s_militaryPop > 3 and GetRU() > 1000) then
			if (Util_CheckResearch(DESTROYERTECH) ) then			
				local destroyerDemand = ShipDemandGet(HGN_DESTROYER)
				if (destroyerDemand > 0) then
					ResearchDemandSet( DESTROYERTECH, destroyerDemand )
				end
			end
		end		
		if (s_militaryPop > 11 and GetRU() > 850) then
			if (Util_CheckResearch(SWEEPERDESTROYERTECH) ) then			
				local sweeperdestroyerDemand = ShipDemandGet(HGN_SWEEPERDESTROYER)
				if (sweeperdestroyerDemand > 0) then
					ResearchDemandSet( SWEEPERDESTROYERTECH, sweeperdestroyerDemand )
				end
			end
		end				
	end  	
	
	if NumSquadrons( HGN_RESEARCHSTATION ) >= 1 then
		if (Util_CheckResearch(SCOUTEMPABILITY) ) then
			local numBombers = NumSquadrons( HGN_SCOUT )
			if (numBombers > 2) then
					ResearchDemandSet( SCOUTEMPABILITY, numBombers * 5.1088 )
			end
		end
	  if (Util_CheckResearch(LBOMBERTECH)) then
			local lbomberdemand = ShipDemandGet(HGN_LBOMBER)
			if (lbomberdemand > 0) then
				ResearchDemandSet( LBOMBERTECH, lbomberdemand )
			end
		end
		if (Util_CheckResearch(LBOMBEREMPABILITY) ) then
			local numBombers = NumSquadrons( HGN_LBOMBER ) + NumSquadrons( HGN_LBOMBERL )
			if (numBombers > 2) then
					ResearchDemandSet( LBOMBEREMPABILITY, numBombers * 5.1258 )
			end
		end
		if (Util_CheckResearch(PULSARCORVETTETECH)) then
			local pulsarcorvettedemand = ShipDemandGet(HGN_PULSARCORVETTE)
			if (pulsarcorvettedemand > 0) then
				ResearchDemandSet( PULSARCORVETTETECH, pulsarcorvettedemand)
			end
		end	
		if (Util_CheckResearch(TORPEDOCORVETTETECH)) then
			local torpedocorvettedemand = ShipDemandGet(HGN_TORPEDOCORVETTE)
			if (torpedocorvettedemand > 0) then
				ResearchDemandSet( TORPEDOCORVETTETECH, torpedocorvettedemand)
			end
		end
		if (Util_CheckResearch(CAPITALRETIRE) ) then
	    ResearchDemandSet( CAPITALRETIRE, 10.4567 )
	  end	  
	  
	  ---Tactical Reinforcements-----
	  local bias = -0.5
	  local limit = 2 --max value
	  local damp = 10	--slower growth
		--Fighter
		local Fighter_MaxDemand = ShipDemandMaxByClass(eFighter)
		if (Util_CheckResearch(FIGHTERREINFORCEMENTS1) ) then
			ResearchDemandSet( FIGHTERREINFORCEMENTS1, bias+sigmoid(Fighter_MaxDemand/2.0511, limit, damp) )
		end
		if (Util_CheckResearch(FIGHTERREINFORCEMENTS2) ) then
			ResearchDemandSet( FIGHTERREINFORCEMENTS2, bias+sigmoid(Fighter_MaxDemand/2.4525, limit, damp) )
		end
		if g_LOD > 1 then
			if (Util_CheckResearch(FIGHTERREINFORCEMENTS3) ) then
				ResearchDemandSet( FIGHTERREINFORCEMENTS3, bias+sigmoid(Fighter_MaxDemand/2.8544, limit, damp) )
			end
		end
		if g_LOD > 2 then
			if (Util_CheckResearch(FIGHTERREINFORCEMENTSE) ) then
				ResearchDemandSet( FIGHTERREINFORCEMENTSE, bias+sigmoid(Fighter_MaxDemand/3.3561, limit, damp) )
			end
		end
		--Corvette
		local Corvette_MaxDemand = ShipDemandMaxByClass(eCorvette)
		if (Util_CheckResearch(CORVETTEREINFORCEMENTS1) ) then
			ResearchDemandSet( CORVETTEREINFORCEMENTS1, bias+sigmoid(Corvette_MaxDemand/2.0511, limit, damp) )
		end
		if (Util_CheckResearch(CORVETTEREINFORCEMENTS2) ) then
			ResearchDemandSet( CORVETTEREINFORCEMENTS2, bias+sigmoid(Corvette_MaxDemand/2.4525, limit, damp) )
		end
		if g_LOD > 1 then
			if (Util_CheckResearch(CORVETTEREINFORCEMENTS3) ) then
				ResearchDemandSet( CORVETTEREINFORCEMENTS3, bias+sigmoid(Corvette_MaxDemand/2.8544, limit, damp) )
			end
		end
		if g_LOD > 2 then
			if (Util_CheckResearch(CORVETTEREINFORCEMENTSE) ) then
				ResearchDemandSet( CORVETTEREINFORCEMENTSE, bias+sigmoid(Corvette_MaxDemand/3.3561, limit, damp) )
			end
		end
		--Frigate
		local Frigate_MaxDemand = ShipDemandMaxByClass(eFrigate)
		if (Util_CheckResearch(FRIGATEREINFORCEMENTS1) ) then
			ResearchDemandSet( FRIGATEREINFORCEMENTS1, bias+sigmoid(Frigate_MaxDemand/2.0511, limit, damp) )
		end
		if (Util_CheckResearch(FRIGATEREINFORCEMENTS2) ) then
			ResearchDemandSet( FRIGATEREINFORCEMENTS2, bias+sigmoid(Frigate_MaxDemand/2.4525, limit, damp) )
		end
		if g_LOD > 1 then
			if (Util_CheckResearch(FRIGATEREINFORCEMENTS3) ) then
				ResearchDemandSet( FRIGATEREINFORCEMENTS3, bias+sigmoid(Frigate_MaxDemand/2.8544, limit, damp) )
			end
		end
		if g_LOD > 2 then
			if (Util_CheckResearch(FRIGATEREINFORCEMENTSE) ) then
				ResearchDemandSet( FRIGATEREINFORCEMENTSE, bias+sigmoid(Frigate_MaxDemand/3.3561, limit, damp) )
			end
		end
		--Capital
		local Capital_MaxDemand = ShipDemandMaxByClass(eCapital)
		if (Util_CheckResearch(CAPITALREINFORCEMENTS1) ) then
			ResearchDemandSet( CAPITALREINFORCEMENTS1, bias+sigmoid(Capital_MaxDemand/2.0511, limit, damp) )
		end
		if (Util_CheckResearch(CAPITALREINFORCEMENTS2) ) then
			ResearchDemandSet( CAPITALREINFORCEMENTS2, bias+sigmoid(Capital_MaxDemand/2.4525, limit, damp) )
		end
		if g_LOD > 1 then
			if (Util_CheckResearch(CAPITALREINFORCEMENTS3) ) then
				ResearchDemandSet( CAPITALREINFORCEMENTS3, bias+sigmoid(Capital_MaxDemand/2.8544, limit, damp) )
			end
		end
		if g_LOD > 2 then
			if (Util_CheckResearch(CAPITALREINFORCEMENTSE) ) then
				ResearchDemandSet( CAPITALREINFORCEMENTSE, bias+sigmoid(Capital_MaxDemand/3.3561, limit, damp) )
			end
		end
		--Platform
		local Platform_MaxDemand = ShipDemandMaxByClass(ePlatform)
		if (Util_CheckResearch(PLATFORMREINFORCEMENTS1) ) then
			ResearchDemandSet( PLATFORMREINFORCEMENTS1, bias+sigmoid(Platform_MaxDemand/2.0511, limit, damp) )
		end
		if (Util_CheckResearch(PLATFORMREINFORCEMENTS2) ) then
			ResearchDemandSet( PLATFORMREINFORCEMENTS2, bias+sigmoid(Platform_MaxDemand/2.4525, limit, damp) )
		end
		if g_LOD > 1 then
			if (Util_CheckResearch(PLATFORMREINFORCEMENTS3) ) then
				ResearchDemandSet( PLATFORMREINFORCEMENTS3, bias+sigmoid(Platform_MaxDemand/2.8544, limit, damp) )
			end
		end
		if g_LOD > 2 then
			if (Util_CheckResearch(PLATFORMREINFORCEMENTSE) ) then
				ResearchDemandSet( PLATFORMREINFORCEMENTSE, bias+sigmoid(Platform_MaxDemand/3.3561, limit, damp) )
			end
		end
		--Utility
		local Utility_MaxDemand = ShipDemandMaxByClass(eCollector)
		if (Util_CheckResearch(UTILITYREINFORCEMENTS1) ) then
			ResearchDemandSet( UTILITYREINFORCEMENTS1, bias+sigmoid(Utility_MaxDemand/2.0511, limit, damp) )
		end
		if (Util_CheckResearch(UTILITYREINFORCEMENTS2) ) then
			ResearchDemandSet( UTILITYREINFORCEMENTS2, bias+sigmoid(Utility_MaxDemand/2.4525, limit, damp) )
		end
		if g_LOD > 1 then
			if (Util_CheckResearch(UTILITYREINFORCEMENTS3) ) then
				ResearchDemandSet( UTILITYREINFORCEMENTS3, bias+sigmoid(Utility_MaxDemand/2.8544, limit, damp) )
			end
		end
		if g_LOD > 2 then
			if (Util_CheckResearch(UTILITYREINFORCEMENTSE) ) then
				ResearchDemandSet( UTILITYREINFORCEMENTSE, bias+sigmoid(Utility_MaxDemand/3.3561, limit, damp) )
			end
		end
	  
	  if (Util_CheckResearch(CREWSTATIONNUKE) ) then
		  ResearchDemandSet( CREWSTATIONNUKE, 8.2424 )
		end
		
	  if (Util_CheckResearch(RESEARCHSTATIONNUKE) ) then
		  ResearchDemandSet( RESEARCHSTATIONNUKE, 9.4507 )
		end
		
	  if (Util_CheckResearch(POWERSTATIONPLASMA) ) then
		  ResearchDemandSet( POWERSTATIONPLASMA, 10.4549 )
		end
	  
		if (s_militaryPop > 6 and GetRU() > 950) then
		  if (Util_CheckResearch(COMPUTERLINK) ) then
		    ResearchDemandSet( COMPUTERLINK, 0.8558 )
		  end			  
		end	
		if (Util_CheckResearch(ATTACKBOMBERIMPROVEDBOMBS) ) then
			local numBombers = NumSquadrons( HGN_ATTACKBOMBER )
			if (numBombers > 2) then
				ResearchDemandSet( ATTACKBOMBERIMPROVEDBOMBS, numBombers + 0.5617 )
			end
		end		
		if (Util_CheckResearch(GUNSHIPENERGYCANNON) ) then
			local numAG = NumSquadrons( HGN_ASSAULTCORVETTE ) + NumSquadrons( HGN_ASSAULTCORVETTEL )
			if (numAG > 3) then
				ResearchDemandSet( GUNSHIPENERGYCANNON, numAG * 5.1561 )
			end
		end	
		if (Util_CheckResearch(CORVETTELONGRANGEPULSAR) ) then
			local numPG = NumSquadrons( HGN_PULSARCORVETTE ) + NumSquadrons( HGN_PULSARCORVETTEL )
			if (numPG > 3) then
				ResearchDemandSet( CORVETTELONGRANGEPULSAR, numPG * 5.4648 )
			end
		end
		if (Util_CheckResearch(TORPEDOCORVETTEALLPURPOSE) ) then
			local numTG = NumSquadrons( HGN_TORPEDOCORVETTE ) + NumSquadrons( HGN_TORPEDOCORVETTEL )
			if (numTG > 3) then
				ResearchDemandSet( TORPEDOCORVETTEALLPURPOSE, numTG * 5.4559 )
			end
		end
		if (Util_CheckResearch(MULTIGUNAUTOMINE) ) then
			local numMG = NumSquadrons( HGN_MULTIGUNCORVETTE ) + NumSquadrons( HGN_MULTIGUNCORVETTEL )
			if (numMG > 3) then
				ResearchDemandSet( MULTIGUNAUTOMINE, numMG * 5.2458 )
			end
		end
		if (Util_CheckResearch(HOWITZERPROXIMITYFUZE) ) then
			local numHG = NumSquadrons( HGN_GUNSHIPCOEVETTE ) + NumSquadrons( HGN_GUNSHIPCOEVETTEL )
			if (numHG > 3) then
				ResearchDemandSet( HOWITZERPROXIMITYFUZE, numHG * 5.2154 )
			end
		end
		if (Util_CheckResearch(ASSAULTGUNSHIPLINKWEAPONICON) ) then
			local numMC = NumSquadrons( HGN_CTH ) + NumSquadrons( HGN_CTHL ) + NumSquadrons( HGN_CTHION ) + NumSquadrons( HGN_CTHIONL )
			if (numMC > 3) then
				ResearchDemandSet( ASSAULTGUNSHIPLINKWEAPONICON, numMC * 5.2109 )
			end
		end		
		if (Util_CheckResearch(IMPROVEDFLAKSHELL) ) then
			local numFlakFrigs = NumSquadrons( HGN_ASSAULTFRIGATE )
			if (numFlakFrigs > 2) then
				ResearchDemandSet( IMPROVEDFLAKSHELL, numFlakFrigs * 5.2177 )
			end
		end	
		if (Util_CheckResearch(IMPROVEDTORPEDO) ) then
			local numTorpedoFrigs = NumSquadrons( HGN_TORPEDOFRIGATE )
			if (numTorpedoFrigs > 2) then
				ResearchDemandSet( IMPROVEDTORPEDO, numTorpedoFrigs * 5.1236 )
			end
		end
		if (Util_CheckResearch(IMPROVEDCALLISTOTORPEDO) ) then
			local numIF = NumSquadrons( HGN_TORPEDOFRIGATE )
			if (numIF > 2) then
				ResearchDemandSet( IMPROVEDCALLISTOTORPEDO, numIF * 5.4613 )
			end
		end
		if (s_militaryPop > 18 and GetRU() > 2500) then	
			if (Util_CheckResearch(IMPROVEDTORPEDOLRM) ) then
				local numLrmFrigs = NumSquadrons( HGN_LRMS )
				if (numLrmFrigs > 2) then
					ResearchDemandSet( IMPROVEDTORPEDOLRM, numLrmFrigs * 5.1384 )
				end
			end	
		end
		if (Util_CheckResearch(IONCANNONFRIGATESHIELDPENETRATION) ) then
			local numIF = NumSquadrons( HGN_IONCANNONFRIGATE )
			if (numIF > 2) then
				ResearchDemandSet( IONCANNONFRIGATESHIELDPENETRATION, numIF * 5.4561 )
			end
		end
		if (Util_CheckResearch(TULWAREMPABILITY) ) then
			local numTF = NumSquadrons( HGN_TULWAR )
			if (numTF > 3) then
				ResearchDemandSet( TULWAREMPABILITY, numTF + 0.2721 )
			end
		end	
		if (Util_CheckResearch(MARINEFRIGATECLOAK) ) then
			local numMarine = NumSquadrons( HGN_MARINEFRIGATE )
			if (numMarine > 2) then
				ResearchDemandSet( MARINEFRIGATECLOAK, numMarine + 0.1677 )
			end
		end
		if (Util_CheckResearch(DEFENDERDRONESHIELD) ) then
			local numDefenders = NumSquadrons( HGN_DEFENDERDRONE )
			if (numDefenders > 5) then
				ResearchDemandSet( DEFENDERDRONESHIELD, numDefenders * 0.7142 )
			end
		end
		if (Util_CheckResearch(DRONESHIELD) ) then
			local numDrones = NumSquadrons( HGN_DRONE )
			if (numDrones > 1) then
				ResearchDemandSet( DRONESHIELD, numDrones * 1.8758 )
			end
		end
		if (Util_CheckResearch(PATCHERSHIELD) ) then
			local numPatchers = NumSquadrons( HGN_PATCHER )
			if (numPatchers > 1) then
				ResearchDemandSet( PATCHERSHIELD, numPatchers * 1.8955 )
			end
		end
		if (Util_CheckResearch(GUNTURRETANTIMISSILESYSTEM) ) then
			local numGuns = NumSquadrons( HGN_GUNTURRET )
			if (numGuns > 3) then
				ResearchDemandSet( GUNTURRETANTIMISSILESYSTEM, numGuns + 0.2165 )
			end
		end
		if (Util_CheckResearch(PULSARTURRETANTIMISSILESYSTEM) ) then
			local numGuns = NumSquadrons( HGN_PULSARTURRET )
			if (numGuns > 3) then
				ResearchDemandSet( PULSARTURRETANTIMISSILESYSTEM, numGuns + 0.1459 )
			end
		end
		if (Util_CheckResearch(IONTURRETIMPROVEDION) ) then
			local numGuns = NumSquadrons( HGN_IONTURRET )
			if (numGuns > 3) then
				ResearchDemandSet( IONTURRETIMPROVEDION, numGuns + 0.5714 )
			end
		end
		if (Util_CheckResearch(MISSILETURRETCALLISTO) ) then
			local numGuns = NumSquadrons( HGN_MISSILETURRET )
			if (numGuns > 3) then
				ResearchDemandSet( MISSILETURRETCALLISTO, numGuns + 0.3131 )
			end
		end
		if (Util_CheckResearch(FASTTRACKING) ) then
			local numrts = NumSquadrons( HGN_RTS )
			if (numrts > 2) then
				ResearchDemandSet( FASTTRACKING, numrts * 5.4566 )
			end
		end		
		if (Util_CheckResearch(IMPROVEDTORPEDODESTROYERICON) ) then
			local numDestroyers = NumSquadrons( HGN_DESTROYER ) + NumSquadrons( HGN_MISSILEDESTROYER ) + NumSquadrons( HGN_IONDESTROYER ) + NumSquadrons( HGN_ADVDESTROYER )
			if (numDestroyers > 0) then
				ResearchDemandSet( IMPROVEDTORPEDODESTROYERICON, numDestroyers * 10.1333 )
			end
		end
		if (Util_CheckResearch(IMPROVEDCALLISTOMISSILEDESTROYER) ) then
			local numDestroyers = NumSquadrons( HGN_MISSILEDESTROYER )
			if (numDestroyers > 2) then
				ResearchDemandSet( IMPROVEDCALLISTOMISSILEDESTROYER, numDestroyers * 10.6445 )
			end
		end
		if (Util_CheckResearch(IMPROVEDDESTROYERARMOUR) ) then
			local numDestroyer = NumSquadrons( HGN_DESTROYER ) + NumSquadrons( HGN_MISSILEDESTROYER ) + NumSquadrons( HGN_IONDESTROYER ) + NumSquadrons( HGN_ADVDESTROYER ) + NumSquadrons( HGN_ARTILLERYDESTROYER ) + NumSquadrons( HGN_SWEEPERDESTROYER )
			if (numDestroyer > 1) then
				ResearchDemandSet( IMPROVEDTORPEDODESTROYER, numDestroyer * 9.4661 )
			end
		end
		if (Util_CheckResearch(IMPROVEDTORPEDOCRUISERAICON) ) then
			local numCruisers = NumSquadrons( HGN_CRUISERA )
			if (numCruisers >= 2) then
				ResearchDemandSet( IMPROVEDTORPEDOCRUISERAICON, numCruisers * 15.1397 )
			end
		end		
		if (Util_CheckResearch(IMPROVEDTORPEDOCRUISERBICON) ) then
			local numCruisers = NumSquadrons( HGN_CRUISERB )
			if (numCruisers >= 2) then
				ResearchDemandSet( IMPROVEDTORPEDOCRUISERBICON, numCruisers * 15.4269 )
			end
		end					
		if (Util_CheckResearch(IMPROVEDSHIELDCRUISERICON) ) then
			local numCruisers = NumSquadrons( HGN_CRUISERA ) + NumSquadrons( HGN_CRUISERB )
			if (numCruisers >= 2) then
				ResearchDemandSet( IMPROVEDSHIELDCRUISERICON, numCruisers * 15.2166 )
			end
		end
		if (Util_CheckResearch(EMPSHELLCRUISERICON) ) then
			local numCruisers = NumSquadrons( HGN_CRUISERA ) + NumSquadrons( HGN_CRUISERB )
			if (numCruisers >= 1) then
				ResearchDemandSet( EMPSHELLCRUISERICON, numCruisers * 15.2168 )
			end
		end
		if (Util_CheckResearch(FIGHTERBOOST) ) then
	 		local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
			if (numFighter > 1) then
				ResearchDemandSet( FIGHTERBOOST, sqrt(numFighter) * 5.2199 )
			end
		end
	  if (Util_CheckResearch(CORVETTEBOOST) ) then
	 		local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
			if (numCorvette > 1) then
				ResearchDemandSet( CORVETTEBOOST, sqrt(numCorvette) * 5.8834 )
			end
		end
		--if (Util_CheckResearch(IMPROVEDSHIELDVORTEX) ) then
			--local numV = NumSquadrons( HGN_VORTEX )
			--if (numV >= 1) then
				--ResearchDemandSet( IMPROVEDSHIELDVORTEX, numV * 30 )
			--end
		--end										
		if (Util_CheckResearch(IMPROVEDTORPEDOMOTHERSHIP) ) then
			local numMS = NumSquadrons( HGN_MOTHERSHIP )
			if (numMS > 0) then
				ResearchDemandSet( IMPROVEDTORPEDOMOTHERSHIP, numMS * 100.1678 )
			end
		end			
		if (Util_CheckResearch(HYPERSPACECORESUMMON) ) then
			local numMS = NumSquadrons( HGN_MOTHERSHIP )
			local numHS = NumSquadrons( HGN_HSCORE )
			if (numMS + numHS == 0) then
				ResearchDemandSet( HYPERSPACECORESUMMON, 99.4067 )
			end
		end
	end	
end
function DoUpgradeDemand_Hiigaran()		
	if (s_militaryStrength > 7) then

---Economic status	
	  local economicallysound = 0
	  if GetRU() > 5000 then
	    economicallysound = 50
	  elseif GetRU() > 10000 then
	    economicallysound = 75
	  elseif GetRU() > 15000 then
	    economicallysound = 100
	  end  	  	
		
---Capital		
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )	
		if (numCapital > 1) then
		  --speed
		  ResearchDemandSet( CAPITALSPEEDUPGRADE1, numCapital * 1.9867 )--2
		  ResearchDemandSet( CAPITALSPEEDUPGRADE2, numCapital * 1.8456 )
		  ResearchDemandSet( CAPITALSPEEDUPGRADE3, numCapital * 1.7275 )
		  --drive
		  ResearchDemandSet( CAPITALDRIVEUPGRADE1, numCapital * 1.6768 )--5
		  ResearchDemandSet( CAPITALDRIVEUPGRADE2, numCapital * 1.5123 )
		  ResearchDemandSet( CAPITALDRIVEUPGRADE3, numCapital * 1.4207 )
		  --health
		  ResearchDemandSet( CAPITALHEALTHUPGRADE1, numCapital * 2.5707 )--1
		  ResearchDemandSet( CAPITALHEALTHUPGRADE2, numCapital * 1.9578 )
		  ResearchDemandSet( CAPITALHEALTHUPGRADE3, numCapital * 1.8241 )
		  --weapon accuracy
		  ResearchDemandSet( CAPITALWEAPONACCURACYUPGRADE1, numCapital * 1.4279 )--7
		  ResearchDemandSet( CAPITALWEAPONACCURACYUPGRADE2, numCapital * 1.3271 )
		  ResearchDemandSet( CAPITALWEAPONACCURACYUPGRADE3, numCapital * 1.2138 )
		  --weapon damage
		  ResearchDemandSet( CAPITALWEAPONDAMAGEUPGRADE1, numCapital * 1.7527 )--4
		  ResearchDemandSet( CAPITALWEAPONDAMAGEUPGRADE2, numCapital * 1.6219 )
		  ResearchDemandSet( CAPITALWEAPONDAMAGEUPGRADE3, numCapital * 1.5751 )
		  --repair
		  ResearchDemandSet( CAPITALHEALTHREGUPGRADE1, numCapital * 1.5078 )--6
		  ResearchDemandSet( CAPITALHEALTHREGUPGRADE2, numCapital * 1.4758 )
		  ResearchDemandSet( CAPITALHEALTHREGUPGRADE3, numCapital * 1.3708 )
		  --docking
		  ResearchDemandSet( CAPITALDOCKINGUPGRADE1, numCapital * 1.3761 )--8
		  ResearchDemandSet( CAPITALDOCKINGUPGRADE2, numCapital * 1.2214 )
		  ResearchDemandSet( CAPITALDOCKINGUPGRADE3, numCapital * 1.1791 )
		  --build
		  ResearchDemandSet( CAPITALBUILDUPGRADE1, numCapital * 1.8452 )--3
		  ResearchDemandSet( CAPITALBUILDUPGRADE2, numCapital * 1.7087 )
		  ResearchDemandSet( CAPITALBUILDUPGRADE3, numCapital * 1.6078 )			
		  --boost
		  if s_militaryPop > 18 and GetRU() > 4000 then
			  if Util_CheckResearch(CAPITALAFTERBURNERAI) then
			  	ResearchDemandSet( CAPITALAFTERBURNERAI, sqrt(numCapital) * 5.6769 )	
			  end 
		  end
		end				
  
    local numWeapons = NumSquadrons( HGN_BATTLECRUISER ) + NumSquadrons( HGN_BATTLECRUISERNUKE ) + NumSquadrons( HGN_BATTLESHIP )
		if (numWeapons > 0) then				
      ResearchDemandSet( WEAPONSPEEDUPGRADE1, 6 + numWeapons * 4.3137 )
			ResearchDemandSet( WEAPONSPEEDUPGRADE2, 5 + numWeapons * 3.4313 )
			ResearchDemandSet( WEAPONSPEEDUPGRADE3, 4 + numWeapons * 3.1391 )
			ResearchDemandSet( WEAPONIMPACTUPGRADE1, 7 + numWeapons * 3.228 )
			ResearchDemandSet( WEAPONIMPACTUPGRADE2, 6 + numWeapons * 3.1717 )
			ResearchDemandSet( WEAPONIMPACTUPGRADE3, 5 + numWeapons * 3.0548 )
    end		
		
	---Mothership		
		--ResearchDemandSet( MOTHERSHIPMAXSHIELDUPGRADE1, 10 )
		--ResearchDemandSet( MOTHERSHIPMAXSHIELDUPGRADE2, 1.8 )
		--ResearchDemandSet( MOTHERSHIPMAXSHIELDUPGRADE3, 1.4 )		
    ResearchDemandSet( MOTHERSHIPDEFENSEFIELDTIMEUPGRADE1, 20.4679 )
    ResearchDemandSet( MOTHERSHIPDEFENSEFIELDTIMEUPGRADE2, 15.1634 )
    if GetRU() > 2000 then
      ResearchDemandSet( MOTHERSHIPDEFENSEFIELDTIMEUPGRADE3, 10.4219 )	   
    end       
    ResearchDemandSet( MOTHERSHIPSHIELDREGENERATIONRATEUPGRADE1, 20.4569 )
    ResearchDemandSet( MOTHERSHIPSHIELDREGENERATIONRATEUPGRADE2, 15.4446 )
    if GetRU() > 2000 then
      ResearchDemandSet( MOTHERSHIPSHIELDREGENERATIONRATEUPGRADE3, 10.4697 )	
    end   
    if GetRU() > 2000 then  
      ResearchDemandSet( HIC1, 50.4682 + economicallysound )
    end  
    if GetRU() > 3000 then
      ResearchDemandSet( HIC2, 40.4599 + economicallysound )
    end
    if GetRU() > 4000 then  
      ResearchDemandSet( HIC3, 30.1511 + economicallysound )	
    end 
    
	---Juggernaut    
    local numJuggernaughts = NumSquadrons( HGN_JUGGERNAUGHT )
		if (numJuggernaughts > 0) then		
			ResearchDemandSet( JUGGERNAUGHTAUXILIARYBOOSTER, (numJuggernaughts*11.7897) + economicallysound )
			ResearchDemandSet( DETONATIONPOWER, (numJuggernaughts*7.4897) + economicallysound )				
			ResearchDemandSet( DETONATIONRANGE, (numJuggernaughts*5.9188) + economicallysound )					
			if GetRU() > 4000 then
			  ResearchDemandSet( DETONATIONPOWER1, (numJuggernaughts*5.5408) + economicallysound )	
			  ResearchDemandSet( DETONATIONRANGE1, (numJuggernaughts*5.4757) + economicallysound )			  		  
			end
			if GetRU() > 8000 then
			  ResearchDemandSet( DETONATIONPOWER2, (numJuggernaughts*5.5878) + economicallysound )	
			  ResearchDemandSet( DETONATIONRANGE2, (numJuggernaughts*4.9277) + economicallysound )				  
			end
		end		 

---Orbital Station
		local numOrbitalStation = NumSquadrons( HGN_BATTLESTATION )
		if (numOrbitalStation > 0 and s_militaryPop > 10 and GetRU() > 20000) then
			if Util_CheckResearch(BLACKHOLETECH) then
				ResearchDemandSet( BLACKHOLETECH, (numOrbitalStation*7.1828) + economicallysound )
			end		
		end
		--if s_militaryPop > 18 then
		--	local numOrbitalStation = NumSquadrons( HGN_BATTLESTATION )
		--	if numOrbitalStation > 0 then
		--		if Util_CheckResearch(BLACKHOLETECHAI) then
		--			ResearchDemandSet( BLACKHOLETECHAI, numOrbitalStation * 5.0 )
		--		end		
		--	end
		--end

---Fleet    
    ResearchDemandSet( SENSORSUPGRADE1, 2.7528 + economicallysound )
    ResearchDemandSet( SENSORSUPGRADE2, 2.6527 + economicallysound )
    ResearchDemandSet( SENSORSUPGRADE3, 2.4515 )		
    
    ResearchDemandSet( HYPERSPACECOSTUPGRADE1, 7.4588 + economicallysound )
    ResearchDemandSet( HYPERSPACECOSTUPGRADE2, 6.7851 + economicallysound )
    ResearchDemandSet( HYPERSPACECOSTUPGRADE3, 5.4244 + economicallysound )  
    
    ResearchDemandSet( HYPERSPACEDAMAGEUPGRADE1, 4.4546 + economicallysound )
    ResearchDemandSet( HYPERSPACEDAMAGEUPGRADE2, 3.4248 )
    ResearchDemandSet( HYPERSPACEDAMAGEUPGRADE3, 2.4511 )  
    
    ResearchDemandSet( HYPERSPACEREGENUPGRADE1, 5.4504 + economicallysound )
    ResearchDemandSet( HYPERSPACEREGENUPGRADE2, 4.9778 )
    ResearchDemandSet( HYPERSPACEREGENUPGRADE3, 3.7517 )  
    
    ResearchDemandSet( HYPERSPACETIMEUPGRADE1, 6.1882 + economicallysound )
    ResearchDemandSet( HYPERSPACETIMEUPGRADE2, 5.4148 + economicallysound )
    ResearchDemandSet( HYPERSPACETIMEUPGRADE3, 4.4991 )             
                  
    if (s_militaryPop > 9 and GetRU() > 1200) then
      ResearchDemandSet( COMPUTERLINK1, 2.6982 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 2450) then
      ResearchDemandSet( COMPUTERLINK2, 2.4376 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 3700) then
      ResearchDemandSet( COMPUTERLINK3, 2.1771 )
    end		 
                   
    if (s_militaryPop > 11 and GetRU() > 1000) then		  
		  ResearchDemandSet( MAINTENANCE1, 30.1449 + economicallysound )
		end
		if (s_militaryPop > 16 and GetRU() > 2000) then		  
		  ResearchDemandSet( MAINTENANCE2, 25.4144 + economicallysound )
		end
		if (s_militaryPop > 19 and GetRU() > 4000) then		  
		  ResearchDemandSet( MAINTENANCE3, 20.4458)
		end			   
		
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( ENGINEERINGBAY1, 2.6975 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 4000) then
      ResearchDemandSet( ENGINEERINGBAY2, 2.4373 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 7000) then
      ResearchDemandSet( ENGINEERINGBAY3, 2.1708 )
    end
    
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( SUPPLYDROP1, 2.6976 + economicallysound )
    end	
    if (s_militaryPop > 10 and GetRU() > 4000) then
      ResearchDemandSet( SUPPLYDROP2, 2.4311 + economicallysound )
    end
    if (s_militaryPop > 11 and GetRU() > 7000) then
      ResearchDemandSet( SUPPLYDROP3, 2.1799 )
    end
    if (s_militaryPop > 11 and GetRU() > 10000) then
      ResearchDemandSet( SUPPLYDROP4, 2.0772 )
    end
    
    if (s_militaryPop > 11 and GetRU() > 3000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM1, 2.6945 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE1, 2.6843 + economicallysound )
    end	
    if (s_militaryPop > 12 and GetRU() > 5000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM2, 2.4341 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE2, 2.4218 + economicallysound )
    end
    if (s_militaryPop > 13 and GetRU() > 8000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM3, 2.1776 )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE3, 2.1622 )
    end
    
--research booster
    if GetRU() > 2000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST1, 3.2453 + economicallysound )
    end	
    if GetRU() > 5000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST2, 3.1411 + economicallysound )
    end
    if GetRU() > 8000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST3, 3.0678 + economicallysound )
    end
    if GetRU() > 15000 then
    	ResearchDemandSet( RESEARCHSPEEDBOOST4, 2.9247 + economicallysound )
    end

--Drone Tech
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if GetRU() > 3000 then
			ResearchDemandSet( DRONETECHSCOUTDRONE1, 4-1*0.3+numFrigate + 0.5248 )
			ResearchDemandSet( DRONETECHBATTLEDRONE1, 4-2*0.3+numFrigate + 0.3421 )
			ResearchDemandSet( DRONETECHBATTLEDRONE2, 4-3*0.3+numFrigate + 0.8891 )
			ResearchDemandSet( DRONETECHBATTLEDRONE3, 4-4*0.3+numFrigate + 0.2491 )
		end
		
--Air Combat
		local numFighter = numActiveOfClass( s_playerIndex, eFighter )
		if GetRU() > 2000 then
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE1, 4-1*0.3+numFighter + 0.4248 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE2, 4-2*0.3+numFighter + 0.2421 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE3, 4-3*0.3+numFighter + 0.7891 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE4, 4-4*0.3+numFighter + 0.1491 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE1, 4-1*0.3+numFighter*1.1345 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE2, 4-2*0.3+numFighter*1.1146 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE3, 4-3*0.3+numFighter*1.1179 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE1, 4-1*0.3+numFighter*1.2287 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE2, 4-2*0.3+numFighter*1.2424 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE3, 4-3*0.3+numFighter*1.2048 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE4, 4-4*0.3+numFighter*1.2767 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE5, 4-5*0.3+numFighter*1.2139 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE6, 4-6*0.3+numFighter*1.2428 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH1, 4-1*0.3+numFighter*1.3148 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH2, 4-2*0.3+numFighter*1.3213 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH3, 4-3*0.3+numFighter*1.3282 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH1, 4-1*0.3+numFighter*1.3487 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH2, 4-2*0.3+numFighter*1.3524 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH3, 4-3*0.3+numFighter*1.3367 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH4, 4-4*0.3+numFighter*1.3701 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH5, 4-5*0.3+numFighter*1.3138 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH1, 4-1*0.3+numFighter*1.4781 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH2, 4-2*0.3+numFighter*1.4108 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH3, 4-3*0.3+numFighter*1.4151 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH1, 4-1*0.3+numFighter*1.4452 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH2, 4-2*0.3+numFighter*1.4426 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH3, 4-3*0.3+numFighter*1.4148 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH4, 4-4*0.3+numFighter*1.4411 )
		end

---Subsystems		     

---Special    
		
---Utility		
		local numCollectors = NumSquadrons( HGN_RESOURCECOLLECTOR )
		if (numCollectors > 6) then				
		  --speed
		  ResearchDemandSet( UTILITYSPEEDUPGRADE1, numCollectors * 1.9274 )--2
		  ResearchDemandSet( UTILITYSPEEDUPGRADE2, numCollectors * 1.8245 )
		  ResearchDemandSet( UTILITYSPEEDUPGRADE3, numCollectors * 1.7453 )		  
		  --health
		  ResearchDemandSet( UTILITYHEALTHUPGRADE1, numCollectors * 2.4524 )--1
		  ResearchDemandSet( UTILITYHEALTHUPGRADE2, numCollectors * 1.9245 )
		  ResearchDemandSet( UTILITYHEALTHUPGRADE3, numCollectors * 1.8515 )		  
			--resource
			ResearchDemandSet( RESOURCECOLLECTORRUCAPUPGRADE1, numCollectors*4.2548 )
			ResearchDemandSet( RESOURCECOLLECTORRUCAPUPGRADE2, numCollectors*3.1568 )
			ResearchDemandSet( RESOURCECOLLECTORRUCAPUPGRADE3, numCollectors*3.0512 )
			ResearchDemandSet( RESOURCECOLLECTORRURATEUPGRADE1, numCollectors*4.5508 )
			ResearchDemandSet( RESOURCECOLLECTORRURATEUPGRADE2, numCollectors*3.2517 )
			ResearchDemandSet( RESOURCECOLLECTORRURATEUPGRADE3, numCollectors*3.1245 )
			ResearchDemandSet( RESOURCECOLLECTORRUDROPOFFUPGRADE1, numCollectors*4.1545 )
			ResearchDemandSet( RESOURCECOLLECTORRUDROPOFFUPGRADE2, numCollectors*3.0524 )
			ResearchDemandSet( RESOURCECOLLECTORRUDROPOFFUPGRADE3, numCollectors*2.0254 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION1, numCollectors*4.5584 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION2, numCollectors*3.2542 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION3, numCollectors*3.1155 )
		end		

		local numProbes = NumSquadrons( HGN_PROBE ) + NumSquadrons( HGN_PROXIMITYSENSOR ) + NumSquadrons( HGN_ECMPROBE )
		if (numProbes > 1) then
			ResearchDemandSet( PROBEREFUELING, numProbes * 1.4718 )
			ResearchDemandSet( PROBEREFUELINGUPGRADE1, numProbes * 1.4401 )
			ResearchDemandSet( PROBEREFUELINGUPGRADE2, numProbes * 1.3832 )
			ResearchDemandSet( PROBEREFUELINGUPGRADE3, numProbes * 1.3567 )
		end

		local numMineContainers = NumSquadrons( HGN_MINECONTAINER )
		if (numMineContainers > 2) then		
		  --resource	
			ResearchDemandSet( MINECONTAINERLOAD1, numMineContainers*3.5534 )
			ResearchDemandSet( MINECONTAINERLOAD2, numMineContainers*3.3244 )
			ResearchDemandSet( MINECONTAINERLOAD3, numMineContainers*3.1148 )
			ResearchDemandSet( MINECONTAINERRURATE1, numMineContainers*3.7545 )
			ResearchDemandSet( MINECONTAINERRURATE2, numMineContainers*3.4582 )
			ResearchDemandSet( MINECONTAINERRURATE3, numMineContainers*2.5458 )
			ResearchDemandSet( MINECONTAINERDROPOFF1, numMineContainers*3.1555 )
			ResearchDemandSet( MINECONTAINERDROPOFF2, numMineContainers*2.9248 )
			ResearchDemandSet( MINECONTAINERDROPOFF3, numMineContainers*1.4711 )
		end		
		
		local numRefinery = NumSquadrons( HGN_RESOURCECONTROLLER )		
		if (numRefinery > 2) then
		  --fusion
		  ResearchDemandSet( AUTOGENRES1, numRefinery*2.9345 )			
		  ResearchDemandSet( AUTOGENRES2, numRefinery*2.7782 )
		  ResearchDemandSet( AUTOGENRES3, numRefinery*2.5482 )					
	  end				
		
		local numScaver = NumSquadrons( HGN_SCAVER )		
		if (numScaver > 1) then
		  --fusion
		  ResearchDemandSet( SCAVERAUTOGENRES1, numScaver*4.9315 )			
		  ResearchDemandSet( SCAVERAUTOGENRES2, numScaver*4.2245 )
		  ResearchDemandSet( SCAVERAUTOGENRES3, numScaver*3.5244 )					
	  end		  

		local numTrade = NumSquadrons( HGN_CONTAINER )		
		if (numTrade > 0) then
	    ResearchDemandSet( TRADEPOWER1, 4.7528 + economicallysound )
	    ResearchDemandSet( TRADEPOWER2, 4.6515 + economicallysound )
	    ResearchDemandSet( TRADEPOWER3, 4.4536 + economicallysound )	
	  end

    ResearchDemandSet( CREWCELLCARGO1, 5.7548 + economicallysound )
    ResearchDemandSet( CREWCELLCARGO2, 5.6528 + economicallysound )
    ResearchDemandSet( CREWCELLCARGO3, 5.4515 + economicallysound )
    ResearchDemandSet( CREWCELLNUMBER1, 5.5437 + economicallysound )
    ResearchDemandSet( CREWCELLNUMBER2, 5.4078 + economicallysound )
		
---Fighter	
    local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
		if (numFighter > 5) then
		  --speed
		  ResearchDemandSet( FIGHTERSPEEDUPGRADE1, numFighter * 1.6578 )--2
		  ResearchDemandSet( FIGHTERSPEEDUPGRADE2, numFighter * 1.5248 )
		  ResearchDemandSet( FIGHTERSPEEDUPGRADE3, numFighter * 1.4416 )		  
		  --boost
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE1, numFighter * 1.3254 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE2, numFighter * 1.2125 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE3, numFighter * 1.1155 )	
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE1, numFighter * 1.4762 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE2, numFighter * 1.3787 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE3, numFighter * 1.2646 )	
		  --health
		  ResearchDemandSet( FIGHTERHEALTHUPGRADE1, numFighter * 1.7475 )--1
		  ResearchDemandSet( FIGHTERHEALTHUPGRADE2, numFighter * 1.6345 )
		  ResearchDemandSet( FIGHTERHEALTHUPGRADE3, numFighter * 1.5653 )
		  --weapon accuracy
		  ResearchDemandSet( FIGHTERWEAPONACCURACYUPGRADE1, numFighter * 1.1007 )--7
		  ResearchDemandSet( FIGHTERWEAPONACCURACYUPGRADE2, numFighter * 1.0848 )
		  ResearchDemandSet( FIGHTERWEAPONACCURACYUPGRADE3, numFighter * 0.9783 )
		  --weapon damage
		  ResearchDemandSet( FIGHTERWEAPONDAMAGEUPGRADE1, numFighter * 1.4789 )--4
		  ResearchDemandSet( FIGHTERWEAPONDAMAGEUPGRADE2, numFighter * 1.3465 )
		  ResearchDemandSet( FIGHTERWEAPONDAMAGEUPGRADE3, numFighter * 1.2462 )				  
		end										
		
---Corvette	
    local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
		if (numCorvette > 4) then
		  --speed
		  ResearchDemandSet( CORVETTESPEEDUPGRADE1, numCorvette * 1.7469 )--2
		  ResearchDemandSet( CORVETTESPEEDUPGRADE2, numCorvette * 1.6756 )
		  ResearchDemandSet( CORVETTESPEEDUPGRADE3, numCorvette * 1.5346 )		 
		  --boost
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE1, numCorvette * 1.3578 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE2, numCorvette * 1.2104 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE3, numCorvette * 1.1248 )	
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE1, numCorvette * 1.4276 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE2, numCorvette * 1.3601 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE3, numCorvette * 1.2406 )	
		  --health
		  ResearchDemandSet( CORVETTEHEALTHUPGRADE1, numCorvette * 1.8241 )--1
		  ResearchDemandSet( CORVETTEHEALTHUPGRADE2, numCorvette * 1.7153 )
		  ResearchDemandSet( CORVETTEHEALTHUPGRADE3, numCorvette * 1.6258 )
		  --weapon accuracy
		  ResearchDemandSet( CORVETTEWEAPONACCURACYUPGRADE1, numCorvette * 1.2189 )--7
		  ResearchDemandSet( CORVETTEWEAPONACCURACYUPGRADE2, numCorvette * 1.1571 )
		  ResearchDemandSet( CORVETTEWEAPONACCURACYUPGRADE3, numCorvette * 1.0486 )
		  --weapon damage
		  ResearchDemandSet( CORVETTEWEAPONDAMAGEUPGRADE1, numCorvette * 1.5791 )--4
		  ResearchDemandSet( CORVETTEWEAPONDAMAGEUPGRADE2, numCorvette * 1.4266 )
		  ResearchDemandSet( CORVETTEWEAPONDAMAGEUPGRADE3, numCorvette * 1.3456 )		  
		end												
		
---Frigate	
    local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )	
		if (numFrigate > 3) then
		  --speed
		  ResearchDemandSet( FRIGATESPEEDUPGRADE1, numFrigate * 1.8468 )--2
		  ResearchDemandSet( FRIGATESPEEDUPGRADE2, numFrigate * 1.7732 )
		  ResearchDemandSet( FRIGATESPEEDUPGRADE3, numFrigate * 1.6454 )		  
		  --health
		  ResearchDemandSet( FRIGATEHEALTHUPGRADE1, numFrigate * 1.9783 )--1
		  ResearchDemandSet( FRIGATEHEALTHUPGRADE2, numFrigate * 1.8425 )
		  ResearchDemandSet( FRIGATEHEALTHUPGRADE3, numFrigate * 1.7415 )
		  --weapon accuracy
		  ResearchDemandSet( FRIGATEWEAPONACCURACYUPGRADE1, numFrigate * 1.3456 )--7
		  ResearchDemandSet( FRIGATEWEAPONACCURACYUPGRADE2, numFrigate * 1.2258 )
		  ResearchDemandSet( FRIGATEWEAPONACCURACYUPGRADE3, numFrigate * 1.1719 )
		  --weapon damage
		  ResearchDemandSet( FRIGATEWEAPONDAMAGEUPGRADE1, numFrigate * 1.6319 )--4
		  ResearchDemandSet( FRIGATEWEAPONDAMAGEUPGRADE2, numFrigate * 1.5664 )
		  ResearchDemandSet( FRIGATEWEAPONDAMAGEUPGRADE3, numFrigate * 1.4468 )
		  --repair
		  ResearchDemandSet( FRIGATEHEALTHREGUPGRADE1, numFrigate * 1.4731 )--6
		  ResearchDemandSet( FRIGATEHEALTHREGUPGRADE2, numFrigate * 1.3159 )
		  ResearchDemandSet( FRIGATEHEALTHREGUPGRADE3, numFrigate * 1.2789 )	
		  --boost
		  if s_militaryPop > 17 and GetRU() > 3000 then
		    if Util_CheckResearch(FRIGATEAFTERBURNERAI) then
		  		ResearchDemandSet( FRIGATEAFTERBURNERAI, sqrt(numFrigate) * 5.2459 )	
		  	end  
		  end
		end															
			
		local numDFFrigate = NumSquadrons( HGN_DEFENSEFIELDFRIGATE )
		if (numDFFrigate>1) then						
			--ResearchDemandSet( MAXSHIELDUPGRADE1, numDFFrigate*1.6 )			
			ResearchDemandSet( DEFENSEFIELDTIMEUPGRADE1, numDFFrigate*1.5246 )
			ResearchDemandSet( SHIELDREGENERATIONRATEUPGRADE1, numDFFrigate*1.4799 )
			ResearchDemandSet( DEFENSEFIELDFRIGATEENERGYCANNON, numDFFrigate*1.6631 )					
		end		
		
		local numdft = NumSquadrons( HGN_DEFENSEFIELDTURRET )
		if (numdft>0) then							
			ResearchDemandSet( SHIELDREGENERATIONRATETURRETUPGRADE1, numdft*1.5249 )
			ResearchDemandSet( DEFENSEFIELDTIMETURRETUPGRADE1, numdft*1.4246 )
		end
		
		local numshuttle = NumSquadrons( HGN_TANKER )
		if (numshuttle>0) then		
			ResearchDemandSet( IMPROVEDTANKERARMOUR, numshuttle*1.6766 )					
			ResearchDemandSet( SHIELDREGENERATIONRATESHUTTLEUPGRADE1, numshuttle*1.5451 )
			ResearchDemandSet( DEFENSEFIELDTIMESHUTTLEUPGRADE1, numshuttle*2.4088 )
		end
		
		local numshuttle = NumSquadrons( HGN_SPACECARRIER )
		if (numshuttle>0) then		
			ResearchDemandSet( FCRADIATIONDEFENSEFIELD, numshuttle*1.6666 )					
			ResearchDemandSet( SHIELDREGENERATIONRATEFCUPGRADE1, numshuttle*1.5551 )
			ResearchDemandSet( DEFENSEFIELDTIMEFCUPGRADE1, numshuttle*2.4188 )
		end
		
		local numDestroyer = NumSquadrons( HGN_DESTROYER ) + NumSquadrons( HGN_MISSILEDESTROYER ) + NumSquadrons( HGN_IONDESTROYER ) + NumSquadrons( HGN_ADVDESTROYER ) + NumSquadrons( HGN_ARTILLERYDESTROYER ) + NumSquadrons( HGN_SWEEPERDESTROYER )
		if (numDestroyer > 1) then
			ResearchDemandSet( IMPROVEDDESTROYERECM, numDestroyer*1.3545 )
			ResearchDemandSet( IMPROVEDDESTROYERECMRANGE, numDestroyer*1.1453 )
		end
		
		local numMarineFrigate = NumSquadrons( HGN_MARINEFRIGATE )
		if (numMarineFrigate>1) then						
			ResearchDemandSet( MARINEFRIGATECAPTUREUPGRADE1, numMarineFrigate*1.3592 )
			ResearchDemandSet( MARINEFRIGATECAPTUREUPGRADE2, numMarineFrigate*1.2521 )
			ResearchDemandSet( MARINEFRIGATECAPTUREUPGRADE3, numMarineFrigate*1.1507 )
			ResearchDemandSet( MARINEFRIGATEENERGYCANNON, numMarineFrigate*1.6636 )
		end		
		
---Platform	
    local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )	
		if (numPlatform > 2) then
			--speed
		  ResearchDemandSet( PLATFORMSPEEDUPGRADE1, numPlatform * 1.5967 )
		  ResearchDemandSet( PLATFORMSPEEDUPGRADE2, numPlatform * 1.4379 )
		  ResearchDemandSet( PLATFORMSPEEDUPGRADE3, numPlatform * 1.3754 )
		  --refuel
		  ResearchDemandSet( PLATFORMREFUELING, numPlatform * 1.6064 )
		  ResearchDemandSet( PLATFORMREFUELINGUPGRADE1, numPlatform * 1.5341 )
		  ResearchDemandSet( PLATFORMREFUELINGUPGRADE2, numPlatform * 1.3942 )
		  ResearchDemandSet( PLATFORMREFUELINGUPGRADE3, numPlatform * 1.2247 )
		  --health
		  ResearchDemandSet( PLATFORMHEALTHUPGRADE1, numPlatform * 1.9037 )--1
		  ResearchDemandSet( PLATFORMHEALTHUPGRADE2, numPlatform * 1.8334 )
		  ResearchDemandSet( PLATFORMHEALTHUPGRADE3, numPlatform * 1.7546 )
		  --weapon accuracy
		  ResearchDemandSet( PLATFORMWEAPONACCURACYUPGRADE1, numPlatform * 1.3077 )--7
		  ResearchDemandSet( PLATFORMWEAPONACCURACYUPGRADE2, numPlatform * 1.2076 )
		  ResearchDemandSet( PLATFORMWEAPONACCURACYUPGRADE3, numPlatform * 1.1845 )
		  --weapon damage
		  ResearchDemandSet( PLATFORMWEAPONDAMAGEUPGRADE1, numPlatform * 1.6438 )--4
		  ResearchDemandSet( PLATFORMWEAPONDAMAGEUPGRADE2, numPlatform * 1.5038 )
		  ResearchDemandSet( PLATFORMWEAPONDAMAGEUPGRADE3, numPlatform * 1.4218 )
		  --repair
		  ResearchDemandSet( PLATFORMHEALTHREGUPGRADE1, numPlatform * 1.4254 )--6
		  ResearchDemandSet( PLATFORMHEALTHREGUPGRADE2, numPlatform * 1.3642 )
		  ResearchDemandSet( PLATFORMHEALTHREGUPGRADE3, numPlatform * 1.2348 )		  
		end								
		
	end
end	        		
function DoUpgradeDemand_Vaygr()		
	if (s_militaryStrength > 7) then

---Economic status	
	  local economicallysound = 0
	  if GetRU() > 5000 then
	    economicallysound = 50
	  elseif GetRU() > 10000 then
	    economicallysound = 75
	  elseif GetRU() > 15000 then
	    economicallysound = 100
	  end  	  	

---Capital		
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )	
		if (numCapital > 1) then
		  --speed
		  ResearchDemandSet( CAPITALSPEEDUPGRADE1, numCapital * 1.9868 )--2
		  ResearchDemandSet( CAPITALSPEEDUPGRADE2, numCapital * 1.8457 )
		  ResearchDemandSet( CAPITALSPEEDUPGRADE3, numCapital * 1.7276 )
		  --drive
		  ResearchDemandSet( CAPITALDRIVEUPGRADE1, numCapital * 1.6767 )--5
		  ResearchDemandSet( CAPITALDRIVEUPGRADE2, numCapital * 1.5126 )
		  ResearchDemandSet( CAPITALDRIVEUPGRADE3, numCapital * 1.4204 )
		  --health
		  ResearchDemandSet( CAPITALHEALTHUPGRADE1, numCapital * 2.5702 )--1
		  ResearchDemandSet( CAPITALHEALTHUPGRADE2, numCapital * 1.9573 )
		  ResearchDemandSet( CAPITALHEALTHUPGRADE3, numCapital * 1.8271 )
		  --weapon accuracy
		  ResearchDemandSet( CAPITALWEAPONACCURACYUPGRADE1, numCapital * 1.4278 )--7
		  ResearchDemandSet( CAPITALWEAPONACCURACYUPGRADE2, numCapital * 1.3261 )
		  ResearchDemandSet( CAPITALWEAPONACCURACYUPGRADE3, numCapital * 1.2158 )
		  --weapon damage
		  ResearchDemandSet( CAPITALWEAPONDAMAGEUPGRADE1, numCapital * 1.7526 )--4
		  ResearchDemandSet( CAPITALWEAPONDAMAGEUPGRADE2, numCapital * 1.6217 )
		  ResearchDemandSet( CAPITALWEAPONDAMAGEUPGRADE3, numCapital * 1.5761 )
		  --repair
		  ResearchDemandSet( CAPITALHEALTHREGUPGRADE1, numCapital * 1.5068 )--6
		  ResearchDemandSet( CAPITALHEALTHREGUPGRADE2, numCapital * 1.4751 )
		  ResearchDemandSet( CAPITALHEALTHREGUPGRADE3, numCapital * 1.3706 )
		  --docking
		  ResearchDemandSet( CAPITALDOCKINGUPGRADE1, numCapital * 1.3764 )--8
		  ResearchDemandSet( CAPITALDOCKINGUPGRADE2, numCapital * 1.2212 )
		  ResearchDemandSet( CAPITALDOCKINGUPGRADE3, numCapital * 1.1796 )
		  --build
		  ResearchDemandSet( CAPITALBUILDUPGRADE1, numCapital * 1.8453 )--3
		  ResearchDemandSet( CAPITALBUILDUPGRADE2, numCapital * 1.7084 )
		  ResearchDemandSet( CAPITALBUILDUPGRADE3, numCapital * 1.6076 )			
		  --boost
		  if s_militaryPop > 14 and GetRU() > 4000 then
			  if Util_CheckResearch(CAPITALAFTERBURNERAI) then
			  	ResearchDemandSet( CAPITALAFTERBURNERAI, sqrt(numCapital) * 5.7818 )	 
			  end
		  end
		  ResearchDemandSet( CAPITALSMOKESCREEN, numCapital * 9.3457 )
		  ResearchDemandSet( CAPITALSMOKESCREEN1, numCapital * 9.2074 )
		end			

    local numWeapons = NumSquadrons( VGR_BATTLECRUISER ) + NumSquadrons( VGR_BATTLECRUISER_HERO )
		if (numWeapons > 0) then				
      ResearchDemandSet( WEAPONSPEEDUPGRADE1, 6 + numWeapons * 4.3786 )
			ResearchDemandSet( WEAPONSPEEDUPGRADE2, 5 + numWeapons * 3.4254 )
			ResearchDemandSet( WEAPONSPEEDUPGRADE3, 4 + numWeapons * 3.1354 )
			ResearchDemandSet( WEAPONIMPACTUPGRADE1, 7 + numWeapons * 3.2078 )
			ResearchDemandSet( WEAPONIMPACTUPGRADE2, 6 + numWeapons * 3.1577 )
			ResearchDemandSet( WEAPONIMPACTUPGRADE3, 5 + numWeapons * 3.0878 )
    end				
      
---Fleet    
    ResearchDemandSet( SENSORSUPGRADE1, 2.7568 + economicallysound )
    ResearchDemandSet( SENSORSUPGRADE2, 2.6521 + economicallysound )
    ResearchDemandSet( SENSORSUPGRADE3, 2.4521 )		
    
    ResearchDemandSet( HYPERSPACECOSTUPGRADE1, 7.4528 + economicallysound )
    ResearchDemandSet( HYPERSPACECOSTUPGRADE2, 6.4289 + economicallysound )
    ResearchDemandSet( HYPERSPACECOSTUPGRADE3, 5.4497 + economicallysound )  
    
    ResearchDemandSet( HYPERSPACEDAMAGEUPGRADE1, 4.1538 + economicallysound )
    ResearchDemandSet( HYPERSPACEDAMAGEUPGRADE2, 3.1538 )
    ResearchDemandSet( HYPERSPACEDAMAGEUPGRADE3, 2.4581 )  
    
    ResearchDemandSet( HYPERSPACEREGENUPGRADE1, 5.4586 + economicallysound )
    ResearchDemandSet( HYPERSPACEREGENUPGRADE2, 4.2415 )
    ResearchDemandSet( HYPERSPACEREGENUPGRADE3, 3.4558 )  
    
    ResearchDemandSet( HYPERSPACETIMEUPGRADE1, 6.4589 + economicallysound )
    ResearchDemandSet( HYPERSPACETIMEUPGRADE2, 5.4144 + economicallysound )
    ResearchDemandSet( HYPERSPACETIMEUPGRADE3, 4.4597 )             
                  
    if (s_militaryPop > 9 and GetRU() > 1200) then
      ResearchDemandSet( COMPUTERLINK1, 2.6986 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 2450) then
      ResearchDemandSet( COMPUTERLINK2, 2.4376 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 3700) then
      ResearchDemandSet( COMPUTERLINK3, 2.1783 )
    end		 
                   
    if (s_militaryPop > 11 and GetRU() > 1000) then		  
		  ResearchDemandSet( MAINTENANCE1, 30.4928 + economicallysound )
		end
		if (s_militaryPop > 16 and GetRU() > 2000) then		  
		  ResearchDemandSet( MAINTENANCE2, 25.3458 + economicallysound )
		end
		if (s_militaryPop > 19 and GetRU() > 4000) then		  
		  ResearchDemandSet( MAINTENANCE3, 20.5401 )
		end			   
		
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( ENGINEERINGBAY1, 2.6908 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 4000) then
      ResearchDemandSet( ENGINEERINGBAY2, 2.4315 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 7000) then
      ResearchDemandSet( ENGINEERINGBAY3, 2.1734 )
    end
		
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( SUPPLYDROP1, 2.6941 + economicallysound )
    end	
    if (s_militaryPop > 10 and GetRU() > 4000) then
      ResearchDemandSet( SUPPLYDROP2, 2.4319 + economicallysound )
    end
    if (s_militaryPop > 11 and GetRU() > 7000) then
      ResearchDemandSet( SUPPLYDROP3, 2.1717 )
    end
    if (s_militaryPop > 11 and GetRU() > 10000) then
      ResearchDemandSet( SUPPLYDROP4, 2.0778 )
    end
    
    if (s_militaryPop > 11 and GetRU() > 3000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM1, 2.6915 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE1, 2.6844 + economicallysound )
    end	
    if (s_militaryPop > 12 and GetRU() > 5000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM2, 2.4377 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE2, 2.4245 + economicallysound )
    end
    if (s_militaryPop > 13 and GetRU() > 8000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM3, 2.1776 )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE3, 2.1617 )
    end

--research booster
    if GetRU() > 2000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST1, 3.3453 + economicallysound )
    end	
    if GetRU() > 5000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST2, 3.2411 + economicallysound )
    end
    if GetRU() > 8000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST3, 3.1678 + economicallysound )
    end
    if GetRU() > 15000 then
    	ResearchDemandSet( RESEARCHSPEEDBOOST4, 3.0247 + economicallysound )
    end

--Drone Tech
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if GetRU() > 3000 then
			ResearchDemandSet( DRONETECHSCOUTDRONE1, 4-1*0.3+numFrigate + 0.5348 )
			ResearchDemandSet( DRONETECHBATTLEDRONE1, 4-2*0.3+numFrigate + 0.3521 )
			ResearchDemandSet( DRONETECHBATTLEDRONE2, 4-3*0.3+numFrigate + 0.8791 )
			ResearchDemandSet( DRONETECHBATTLEDRONE3, 4-4*0.3+numFrigate + 0.2591 )
		end

--Air Combat
		local numFighter = numActiveOfClass( s_playerIndex, eFighter )
		if GetRU() > 2000 then
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE1, 4-1*0.3+numFighter + 0.2791 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE2, 4-2*0.3+numFighter + 0.5781 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE3, 4-3*0.3+numFighter + 0.7811 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE4, 4-4*0.3+numFighter + 0.1486 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE1, 4-1*0.3+numFighter*1.1868 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE2, 4-2*0.3+numFighter*1.1274 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE3, 4-3*0.3+numFighter*1.1159 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE1, 4-1*0.3+numFighter*1.2785 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE2, 4-2*0.3+numFighter*1.2248 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE3, 4-3*0.3+numFighter*1.2125 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE4, 4-4*0.3+numFighter*1.2467 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE5, 4-5*0.3+numFighter*1.2152 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE6, 4-6*0.3+numFighter*1.2497 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH1, 4-1*0.3+numFighter*1.3708 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH2, 4-2*0.3+numFighter*1.3571 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH3, 4-3*0.3+numFighter*1.3311 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH1, 4-1*0.3+numFighter*1.3434 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH2, 4-2*0.3+numFighter*1.3134 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH3, 4-3*0.3+numFighter*1.3453 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH4, 4-4*0.3+numFighter*1.3209 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH5, 4-5*0.3+numFighter*1.3108 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH1, 4-1*0.3+numFighter*1.4782 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH2, 4-2*0.3+numFighter*1.4241 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH3, 4-3*0.3+numFighter*1.4579 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH1, 4-1*0.3+numFighter*1.4132 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH2, 4-2*0.3+numFighter*1.4271 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH3, 4-3*0.3+numFighter*1.4797 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH4, 4-4*0.3+numFighter*1.4729 )
		end
		
---Subsystems		     

---Special

---Utility		
		local numCollectors = NumSquadrons( VGR_RESOURCECOLLECTOR )
		if (numCollectors > 6) then				
		  --speed
		  ResearchDemandSet( UTILITYSPEEDUPGRADE1, numCollectors * 1.9279 )--2
		  ResearchDemandSet( UTILITYSPEEDUPGRADE2, numCollectors * 1.8153 )
		  ResearchDemandSet( UTILITYSPEEDUPGRADE3, numCollectors * 1.7131 )		  
		  --health
		  ResearchDemandSet( UTILITYHEALTHUPGRADE1, numCollectors * 2.0458 )--1
		  ResearchDemandSet( UTILITYHEALTHUPGRADE2, numCollectors * 1.9798 )
		  ResearchDemandSet( UTILITYHEALTHUPGRADE3, numCollectors * 1.8552 )		  
			--resource
			ResearchDemandSet( RESOURCECOLLECTORRUCAPUPGRADE1, numCollectors*4.2565 )
			ResearchDemandSet( RESOURCECOLLECTORRUCAPUPGRADE2, numCollectors*3.1536 )
			ResearchDemandSet( RESOURCECOLLECTORRUCAPUPGRADE3, numCollectors*3.0533 )
			ResearchDemandSet( RESOURCECOLLECTORRURATEUPGRADE1, numCollectors*4.5557 )
			ResearchDemandSet( RESOURCECOLLECTORRURATEUPGRADE2, numCollectors*3.2529 )
			ResearchDemandSet( RESOURCECOLLECTORRURATEUPGRADE3, numCollectors*3.1787 )
			ResearchDemandSet( RESOURCECOLLECTORRUDROPOFFUPGRADE1, numCollectors*4.1537 )
			ResearchDemandSet( RESOURCECOLLECTORRUDROPOFFUPGRADE2, numCollectors*3.0507 )
			ResearchDemandSet( RESOURCECOLLECTORRUDROPOFFUPGRADE3, numCollectors*2.0255 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION1, numCollectors*4.5531 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION2, numCollectors*3.2528 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION3, numCollectors*3.1316 )
		end		

		local numPatchers = NumSquadrons( VGR_PATCHER )
		if (numPatchers > 1) then
			ResearchDemandSet( REPAIRBEAMUPGRADE1, numPatchers * 1.3757 )
			ResearchDemandSet( REPAIRBEAMUPGRADE2, numPatchers * 1.2145 )
			ResearchDemandSet( REPAIRBEAMUPGRADE3, numPatchers * 1.1411 )
		end

		local numProbes = NumSquadrons( VGR_PROBE ) + NumSquadrons( VGR_PROBE_ECM ) + NumSquadrons( VGR_PROBE_PROX ) + NumSquadrons( VGR_PROBE_SMALLHSBEACON )
		if (numProbes > 1) then
			ResearchDemandSet( PROBEREFUELING, numProbes * 1.4749 )
			ResearchDemandSet( PROBEREFUELINGUPGRADE1, numProbes * 1.4421 )
			ResearchDemandSet( PROBEREFUELINGUPGRADE2, numProbes * 1.3842 )
			ResearchDemandSet( PROBEREFUELINGUPGRADE3, numProbes * 1.3577 )
		end

		local numMineContainers = NumSquadrons( VGR_MINECONTAINER )
		if (numMineContainers > 2) then		
		  --resource	
			ResearchDemandSet( MINECONTAINERLOAD1, numMineContainers*3.5248 )
			ResearchDemandSet( MINECONTAINERLOAD2, numMineContainers*3.3377 )
			ResearchDemandSet( MINECONTAINERLOAD3, numMineContainers*3.1767 )
			ResearchDemandSet( MINECONTAINERRURATE1, numMineContainers*3.7573 )
			ResearchDemandSet( MINECONTAINERRURATE2, numMineContainers*3.0485 )
			ResearchDemandSet( MINECONTAINERRURATE3, numMineContainers*2.5379 )
			ResearchDemandSet( MINECONTAINERDROPOFF1, numMineContainers*3.1511 )
			ResearchDemandSet( MINECONTAINERDROPOFF2, numMineContainers*2.9755 )
			ResearchDemandSet( MINECONTAINERDROPOFF3, numMineContainers*1.4767 )
		end		
		
		local numRefinery = NumSquadrons( VGR_RESOURCECONTROLLER ) + NumSquadrons( VGR_RESOURCECONTROLLERDOUBLE )		
		if (numRefinery > 2) then
		  --fusion
		  ResearchDemandSet( AUTOGENRES1, numRefinery*2.9315 )			
		  ResearchDemandSet( AUTOGENRES2, numRefinery*2.7278 )
		  ResearchDemandSet( AUTOGENRES3, numRefinery*2.5761 )					
	  end			
	  
    local numScaver = NumSquadrons( VGR_SCAVER )		
		if (numScaver > 0) then
		  --fusion
		  ResearchDemandSet( SCAVERAUTOGENRES1, numScaver*4.9737 )			
		  ResearchDemandSet( SCAVERAUTOGENRES2, numScaver*4.2421 )
		  ResearchDemandSet( SCAVERAUTOGENRES3, numScaver*3.5799 )					
	  end
	  
		local numTrade = NumSquadrons( VGR_CONTAINER )		
		if (numTrade > 0) then
	    ResearchDemandSet( TRADEPOWER1, 4.7573 + economicallysound )
	    ResearchDemandSet( TRADEPOWER2, 4.6593 + economicallysound )
	    ResearchDemandSet( TRADEPOWER3, 4.4527 + economicallysound )	
	  end			
		
---Fighter	
    local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
		if (numFighter > 5) then
		  --speed
		  ResearchDemandSet( FIGHTERSPEEDUPGRADE1, numFighter * 1.6247 )--2
		  ResearchDemandSet( FIGHTERSPEEDUPGRADE2, numFighter * 1.5319 )
		  ResearchDemandSet( FIGHTERSPEEDUPGRADE3, numFighter * 1.4078 )	  
		  --boost
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE1, numFighter * 1.3078 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE2, numFighter * 1.2782 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE3, numFighter * 1.1133 )	
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE1, numFighter * 1.4374 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE2, numFighter * 1.3774 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE3, numFighter * 1.2744 )	
		  --health
		  ResearchDemandSet( FIGHTERHEALTHUPGRADE1, numFighter * 1.7344 )--1
		  ResearchDemandSet( FIGHTERHEALTHUPGRADE2, numFighter * 1.6233 )
		  ResearchDemandSet( FIGHTERHEALTHUPGRADE3, numFighter * 1.5151 )
		  --weapon accuracy
		  ResearchDemandSet( FIGHTERWEAPONACCURACYUPGRADE1, numFighter * 1.1458 )--7
		  ResearchDemandSet( FIGHTERWEAPONACCURACYUPGRADE2, numFighter * 1.0488 )
		  ResearchDemandSet( FIGHTERWEAPONACCURACYUPGRADE3, numFighter * 0.9711 )
		  --weapon damage
		  ResearchDemandSet( FIGHTERWEAPONDAMAGEUPGRADE1, numFighter * 1.4315 )--4
		  ResearchDemandSet( FIGHTERWEAPONDAMAGEUPGRADE2, numFighter * 1.3527 )
		  ResearchDemandSet( FIGHTERWEAPONDAMAGEUPGRADE3, numFighter * 1.2271 )				  
		end										
		
---Corvette	
    local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
		if (numCorvette > 4) then
		  --speed
		  ResearchDemandSet( CORVETTESPEEDUPGRADE1, numCorvette * 1.7121 )--2
		  ResearchDemandSet( CORVETTESPEEDUPGRADE2, numCorvette * 1.6155 )
		  ResearchDemandSet( CORVETTESPEEDUPGRADE3, numCorvette * 1.5441 )	  
		  --boost
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE1, numCorvette * 1.3344 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE2, numCorvette * 1.2345 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE3, numCorvette * 1.1408 )	
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE1, numCorvette * 1.4455 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE2, numCorvette * 1.3118 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE3, numCorvette * 1.2799 )	
		  --health
		  ResearchDemandSet( CORVETTEHEALTHUPGRADE1, numCorvette * 1.8011 )--1
		  ResearchDemandSet( CORVETTEHEALTHUPGRADE2, numCorvette * 1.7155 )
		  ResearchDemandSet( CORVETTEHEALTHUPGRADE3, numCorvette * 1.61397 )
		  --weapon accuracy
		  ResearchDemandSet( CORVETTEWEAPONACCURACYUPGRADE1, numCorvette * 1.2422 )--7
		  ResearchDemandSet( CORVETTEWEAPONACCURACYUPGRADE2, numCorvette * 1.1451 )
		  ResearchDemandSet( CORVETTEWEAPONACCURACYUPGRADE3, numCorvette * 1.0448 )
		  --weapon damage
		  ResearchDemandSet( CORVETTEWEAPONDAMAGEUPGRADE1, numCorvette * 1.5482 )--4
		  ResearchDemandSet( CORVETTEWEAPONDAMAGEUPGRADE2, numCorvette * 1.4115 )
		  ResearchDemandSet( CORVETTEWEAPONDAMAGEUPGRADE3, numCorvette * 1.3467 )		  
		end												
		
---Frigate	
    local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )	
		if (numFrigate > 3) then
		  --speed
		  ResearchDemandSet( FRIGATESPEEDUPGRADE1, numFrigate * 1.8487 )--2
		  ResearchDemandSet( FRIGATESPEEDUPGRADE2, numFrigate * 1.7777 )
		  ResearchDemandSet( FRIGATESPEEDUPGRADE3, numFrigate * 1.6458 )	  
		  --health
		  ResearchDemandSet( FRIGATEHEALTHUPGRADE1, numFrigate * 1.9348 )--1
		  ResearchDemandSet( FRIGATEHEALTHUPGRADE2, numFrigate * 1.8799 )
		  ResearchDemandSet( FRIGATEHEALTHUPGRADE3, numFrigate * 1.7241 )
		  --weapon accuracy
		  ResearchDemandSet( FRIGATEWEAPONACCURACYUPGRADE1, numFrigate * 1.3248 )--7
		  ResearchDemandSet( FRIGATEWEAPONACCURACYUPGRADE2, numFrigate * 1.2631 )
		  ResearchDemandSet( FRIGATEWEAPONACCURACYUPGRADE3, numFrigate * 1.1105 )
		  --weapon damage
		  ResearchDemandSet( FRIGATEWEAPONDAMAGEUPGRADE1, numFrigate * 1.6624 )--4
		  ResearchDemandSet( FRIGATEWEAPONDAMAGEUPGRADE2, numFrigate * 1.5516 )
		  ResearchDemandSet( FRIGATEWEAPONDAMAGEUPGRADE3, numFrigate * 1.4224 )
		  --repair
		  ResearchDemandSet( FRIGATEHEALTHREGUPGRADE1, numFrigate * 1.4147 )--6
		  ResearchDemandSet( FRIGATEHEALTHREGUPGRADE2, numFrigate * 1.3645 )
		  ResearchDemandSet( FRIGATEHEALTHREGUPGRADE3, numFrigate * 1.2674 )		 
		  --boost
		  if s_militaryPop > 10 and GetRU() > 3000 then
			  if Util_CheckResearch(FRIGATEAFTERBURNERAI) then
			  	ResearchDemandSet( FRIGATEAFTERBURNERAI, sqrt(numFrigate) * 5.1381 )	 
			  end
		  end
		end															
				
		local numInfiltratorFrigate = NumSquadrons( VGR_INFILTRATORFRIGATE )
		if (numInfiltratorFrigate>1) then						
			ResearchDemandSet( INFILTRATORFRIGATECAPTUREUPGRADE1, numInfiltratorFrigate*1.3565 )
			ResearchDemandSet( INFILTRATORFRIGATECAPTUREUPGRADE2, numInfiltratorFrigate*1.2578 )
			ResearchDemandSet( INFILTRATORFRIGATECAPTUREUPGRADE3, numInfiltratorFrigate*1.1571 )							
		end		
		
---Platform	
    local numPlatform = numActiveOfClass( s_playerIndex, ePlatform )	
		if (numPlatform > 2) then
			--speed
		  ResearchDemandSet( PLATFORMSPEEDUPGRADE1, numPlatform * 1.5841 )
		  ResearchDemandSet( PLATFORMSPEEDUPGRADE2, numPlatform * 1.4205 )
		  ResearchDemandSet( PLATFORMSPEEDUPGRADE3, numPlatform * 1.3622 )
		  --refuel
		  ResearchDemandSet( PLATFORMREFUELING, numPlatform * 1.6037 )
		  ResearchDemandSet( PLATFORMREFUELINGUPGRADE1, numPlatform * 1.5371 )
		  ResearchDemandSet( PLATFORMREFUELINGUPGRADE2, numPlatform * 1.3808 )
		  ResearchDemandSet( PLATFORMREFUELINGUPGRADE3, numPlatform * 1.2217 )
		  --health
		  ResearchDemandSet( PLATFORMHEALTHUPGRADE1, numPlatform * 1.9579 )--1
		  ResearchDemandSet( PLATFORMHEALTHUPGRADE2, numPlatform * 1.8151 )
		  ResearchDemandSet( PLATFORMHEALTHUPGRADE3, numPlatform * 1.7994 )
		  --weapon accuracy
		  ResearchDemandSet( PLATFORMWEAPONACCURACYUPGRADE1, numPlatform * 1.3782 )--7
		  ResearchDemandSet( PLATFORMWEAPONACCURACYUPGRADE2, numPlatform * 1.2748 )
		  ResearchDemandSet( PLATFORMWEAPONACCURACYUPGRADE3, numPlatform * 1.1078 )
		  --weapon damage
		  ResearchDemandSet( PLATFORMWEAPONDAMAGEUPGRADE1, numPlatform * 1.6006 )--4
		  ResearchDemandSet( PLATFORMWEAPONDAMAGEUPGRADE2, numPlatform * 1.5106 )
		  ResearchDemandSet( PLATFORMWEAPONDAMAGEUPGRADE3, numPlatform * 1.4463 )
		  --repair
		  ResearchDemandSet( PLATFORMHEALTHREGUPGRADE1, numPlatform * 1.4572 )--6
		  ResearchDemandSet( PLATFORMHEALTHREGUPGRADE2, numPlatform * 1.3158 )
		  ResearchDemandSet( PLATFORMHEALTHREGUPGRADE3, numPlatform * 1.2103 )		  
		end			
	end
end

function DoUpgradeDemand_Kadeshi()		
	if (s_militaryStrength > 7) then

---Economic status	
	  local economicallysound = 0
	  if GetRU() > 5000 then
	    economicallysound = 50
	  elseif GetRU() > 10000 then
	    economicallysound = 75
	  elseif GetRU() > 15000 then
	    economicallysound = 100
	  end  	  	
	  if (s_militaryPop > 11 and GetRU() > 1000) then		  
		  ResearchDemandSet( MAINTENANCE1, 30.7867 + economicallysound )
		end
		if (s_militaryPop > 16 and GetRU() > 2000) then		  
		  ResearchDemandSet( MAINTENANCE2, 25.7775 + economicallysound )
		end
		if (s_militaryPop > 19 and GetRU() > 4000) then		  
		  ResearchDemandSet( MAINTENANCE3, 20.7871 )
		end
		
		if (s_militaryPop > 7 and GetRU() > 950) then
		  if (Util_CheckResearch(COMPUTERLINK) ) then
		    ResearchDemandSet( COMPUTERLINK, 0.8557 )
		  end		
		end
	  if (s_militaryPop > 9 and GetRU() > 1200) then
	    ResearchDemandSet( COMPUTERLINK1, 2.6945 + economicallysound )
	  end	
	  if (s_militaryPop > 11 and GetRU() > 2450) then
	    ResearchDemandSet( COMPUTERLINK2, 2.4328 + economicallysound )
	  end
	  if (s_militaryPop > 14 and GetRU() > 3700) then
	    ResearchDemandSet( COMPUTERLINK3, 2.1716 )
	  end
	
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( ENGINEERINGBAY1, 2.6915 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 4000) then
      ResearchDemandSet( ENGINEERINGBAY2, 2.4314 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 7000) then
      ResearchDemandSet( ENGINEERINGBAY3, 2.1739 )
    end
	
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( SUPPLYDROP1, 2.6976 + economicallysound )
    end	
    if (s_militaryPop > 10 and GetRU() > 4000) then
      ResearchDemandSet( SUPPLYDROP2, 2.4331 + economicallysound )
    end
    if (s_militaryPop > 11 and GetRU() > 7000) then
      ResearchDemandSet( SUPPLYDROP3, 2.1707 )
    end
    if (s_militaryPop > 11 and GetRU() > 10000) then
      ResearchDemandSet( SUPPLYDROP4, 2.0703 )
    end
    
    if (s_militaryPop > 11 and GetRU() > 3000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM1, 2.6928 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE1, 2.6836 + economicallysound )
    end	
    if (s_militaryPop > 12 and GetRU() > 5000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM2, 2.4346 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE2, 2.4228 + economicallysound )
    end
    if (s_militaryPop > 13 and GetRU() > 8000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM3, 2.1745 )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE3, 2.1639 )
    end

--research booster
    if GetRU() > 2000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST1, 3.2433 + economicallysound )
    end	
    if GetRU() > 5000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST2, 3.1401 + economicallysound )
    end
    if GetRU() > 8000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST3, 3.0668 + economicallysound )
    end
    if GetRU() > 15000 then
    	ResearchDemandSet( RESEARCHSPEEDBOOST4, 2.9237 + economicallysound )
    end

--Drone Tech
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if GetRU() > 3000 then
			ResearchDemandSet( DRONETECHSCOUTDRONE1, 4-1*0.3+numFrigate + 0.5278 )
			ResearchDemandSet( DRONETECHBATTLEDRONE1, 4-2*0.3+numFrigate + 0.3621 )
			ResearchDemandSet( DRONETECHBATTLEDRONE2, 4-3*0.3+numFrigate + 0.8881 )
			ResearchDemandSet( DRONETECHBATTLEDRONE3, 4-4*0.3+numFrigate + 0.2421 )
		end

--Air Combat
		local numFighter = numActiveOfClass( s_playerIndex, eFighter )
		if GetRU() > 2000 then
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE1, 4-1*0.3+numFighter + 0.1246 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE2, 4-2*0.3+numFighter + 0.7589 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE3, 4-3*0.3+numFighter + 0.1499 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE4, 4-4*0.3+numFighter + 0.2496 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE1, 4-1*0.3+numFighter*1.1289 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE2, 4-2*0.3+numFighter*1.1727 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE3, 4-3*0.3+numFighter*1.1311 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE1, 4-1*0.3+numFighter*1.2572 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE2, 4-2*0.3+numFighter*1.2347 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE3, 4-3*0.3+numFighter*1.2376 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE4, 4-4*0.3+numFighter*1.2185 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE5, 4-5*0.3+numFighter*1.2666 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE6, 4-6*0.3+numFighter*1.2091 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH1, 4-1*0.3+numFighter*1.3179 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH2, 4-2*0.3+numFighter*1.3397 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH3, 4-3*0.3+numFighter*1.3723 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH1, 4-1*0.3+numFighter*1.3731 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH2, 4-2*0.3+numFighter*1.3871 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH3, 4-3*0.3+numFighter*1.3243 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH4, 4-4*0.3+numFighter*1.3361 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH5, 4-5*0.3+numFighter*1.3077 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH1, 4-1*0.3+numFighter*1.4766 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH2, 4-2*0.3+numFighter*1.4156 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH3, 4-3*0.3+numFighter*1.4147 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH1, 4-1*0.3+numFighter*1.4391 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH2, 4-2*0.3+numFighter*1.4938 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH3, 4-3*0.3+numFighter*1.4647 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH4, 4-4*0.3+numFighter*1.4204 )
		end

		local numTrade = NumSquadrons( KAD_CONTAINER )		
		if (numTrade > 0) then
	    ResearchDemandSet( TRADEPOWER1, 4.7576 + economicallysound )
	    ResearchDemandSet( TRADEPOWER2, 4.6528 + economicallysound )
	    ResearchDemandSet( TRADEPOWER3, 4.4546 + economicallysound )	
	    ResearchDemandSet( TRADESPEED1, 4.3544 + economicallysound )
	    ResearchDemandSet( TRADESPEED2, 4.2516 + economicallysound )
	    ResearchDemandSet( TRADESPEED3, 4.1524 + economicallysound )	
	    ResearchDemandSet( TRADEHEALTH1, 3.7564 + economicallysound )
	    ResearchDemandSet( TRADEHEALTH2, 3.6524 + economicallysound )
	    ResearchDemandSet( TRADEHEALTH3, 3.4546 + economicallysound )	
	  end

---Fighter	
    local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
		if (numFighter > 5) then
		  --boost
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE1, numFighter * 1.3579 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE2, numFighter * 1.2115 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE3, numFighter * 1.1678 )	
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE1, numFighter * 1.4525 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE2, numFighter * 1.3246 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE3, numFighter * 1.2459 )				  
		end										
		
---Corvette	
    local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
		if (numCorvette > 4) then 
		  --boost
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE1, numCorvette * 1.3769 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE2, numCorvette * 1.2271 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE3, numCorvette * 1.1767 )	
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE1, numCorvette * 1.4767 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE2, numCorvette * 1.3521 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE3, numCorvette * 1.2169 )	 
		end				

---Frigate	
    local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )	
		if (numFrigate > 3) then 
		  --boost
		  if s_militaryPop > 10 and GetRU() > 3000 then
			  if Util_CheckResearch(FRIGATEAFTERBURNERAI) then
			  	ResearchDemandSet( FRIGATEAFTERBURNERAI, sqrt(numFrigate) * 5.1538 )	 
			  end
		  end
		end		

---Capital		
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )	
		if (numCapital > 1) then
		  --boost
		  if s_militaryPop > 14 and GetRU() > 4000 then
			  if Util_CheckResearch(CAPITALAFTERBURNERAI) then
			  	ResearchDemandSet( CAPITALAFTERBURNERAI, sqrt(numCapital) * 5.1616 )	 
			  end
		  end
		end	

---Utility		
		local numCollectors = NumSquadrons( KAD_RESSOURCECOLLECTOR )
		if (numCollectors > 6) then
			ResearchDemandSet( GARDENEROFKADESH, numCollectors*6.1467 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION1, numCollectors*4.5576 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION2, numCollectors*3.2551 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION3, numCollectors*3.1467 )
		end		
		local numMineContainers = NumSquadrons( KAD_MINECONTAINER )
		if (numMineContainers > 2) then		
		  --resource	
			ResearchDemandSet( MINECONTAINERLOAD1, numMineContainers*3.5249 )
			ResearchDemandSet( MINECONTAINERLOAD2, numMineContainers*3.3513 )
			ResearchDemandSet( MINECONTAINERLOAD3, numMineContainers*3.1278 )
			ResearchDemandSet( MINECONTAINERRURATE1, numMineContainers*3.7572 )
			ResearchDemandSet( MINECONTAINERRURATE2, numMineContainers*3.0486 )
			ResearchDemandSet( MINECONTAINERRURATE3, numMineContainers*2.5756 )
		end		
		ResearchDemandSet( MINECONTAINERDROPOFF1, numMineContainers*3.1551 )
		ResearchDemandSet( MINECONTAINERDROPOFF2, numMineContainers*2.9915 )
		ResearchDemandSet( MINECONTAINERDROPOFF3, numMineContainers*1.4274 )		
	end	
end

function DoUpgradeDemand_Raider()		
	if (s_militaryStrength > 7) then

---difficulty level	
	  local dif_lvl = 0
	  if g_LOD > 2 then
	    dif_lvl = 3
	  else
	  	dif_lvl = g_LOD
	  end 

---Economic status	
	  local economicallysound = 0
	  if GetRU() > 5000 then
	    economicallysound = 50
	  elseif GetRU() > 10000 then
	    economicallysound = 75
	  elseif GetRU() > 15000 then
	    economicallysound = 100
	  end  	  	
	  if (s_militaryPop > 11 and GetRU() > 1000) then		  
		  ResearchDemandSet( MAINTENANCE1, 30.4791 + economicallysound )
		end
		if (s_militaryPop > 16 and GetRU() > 2000) then		  
		  ResearchDemandSet( MAINTENANCE2, 25.4058 + economicallysound )
		end
		if (s_militaryPop > 19 and GetRU() > 4000) then		  
		  ResearchDemandSet( MAINTENANCE3, 20.4945 )
		end
	
		if (s_militaryPop > 7 and GetRU() > 950) then
		  if (Util_CheckResearch(COMPUTERLINK) ) then
		    ResearchDemandSet( COMPUTERLINK, 0.8586 )
		  end		
		end
	  if (s_militaryPop > 9 and GetRU() > 1200) then
	    ResearchDemandSet( COMPUTERLINK1, 2.6976 + economicallysound )
	  end	
	  if (s_militaryPop > 11 and GetRU() > 2450) then
	    ResearchDemandSet( COMPUTERLINK2, 2.4378 + economicallysound )
	  end
	  if (s_militaryPop > 14 and GetRU() > 3700) then
	    ResearchDemandSet( COMPUTERLINK3, 2.1773 )
	  end
	  
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( ENGINEERINGBAY1, 2.6982 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 4000) then
      ResearchDemandSet( ENGINEERINGBAY2, 2.4345 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 7000) then
      ResearchDemandSet( ENGINEERINGBAY3, 2.1746 )
    end
	  
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( SUPPLYDROP1, 2.6997 + economicallysound )
    end	
    if (s_militaryPop > 10 and GetRU() > 4000) then
      ResearchDemandSet( SUPPLYDROP2, 2.4381 + economicallysound )
    end
    if (s_militaryPop > 11 and GetRU() > 7000) then
      ResearchDemandSet( SUPPLYDROP3, 2.1778 )
    end
    if (s_militaryPop > 11 and GetRU() > 10000) then
      ResearchDemandSet( SUPPLYDROP4, 2.0744 )
    end
    
    if (s_militaryPop > 11 and GetRU() > 3000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM1, 2.6946 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE1, 2.6852 + economicallysound )
    end	
    if (s_militaryPop > 12 and GetRU() > 5000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM2, 2.4346 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE2, 2.4249 + economicallysound )
    end
    if (s_militaryPop > 13 and GetRU() > 8000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM3, 2.1771 )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE3, 2.1676 )
    end

--research booster
    if GetRU() > 2000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST1, 3.2553 + economicallysound )
    end	
    if GetRU() > 5000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST2, 3.1511 + economicallysound )
    end
    if GetRU() > 8000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST3, 3.0678 + economicallysound )
    end
    if GetRU() > 15000 then
    	ResearchDemandSet( RESEARCHSPEEDBOOST4, 2.9347 + economicallysound )
    end

--Drone Tech
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if GetRU() > 3000 then
			ResearchDemandSet( DRONETECHSCOUTDRONE1, 4-1*0.3+numFrigate + 0.5548 )
			ResearchDemandSet( DRONETECHBATTLEDRONE1, 4-2*0.3+numFrigate + 0.3461 )
			ResearchDemandSet( DRONETECHBATTLEDRONE2, 4-3*0.3+numFrigate + 0.8851 )
			ResearchDemandSet( DRONETECHBATTLEDRONE3, 4-4*0.3+numFrigate + 0.2391 )
		end

--Air Combat
		local numFighter = numActiveOfClass( s_playerIndex, eFighter )
		if GetRU() > 2000 then
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE1, 4-1*0.3+numFighter + 0.4586 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE2, 4-2*0.3+numFighter + 0.1463 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE3, 4-3*0.3+numFighter + 0.1408 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE4, 4-4*0.3+numFighter + 0.1492 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE1, 4-1*0.3+numFighter*1.1573 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE2, 4-2*0.3+numFighter*1.1138 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE3, 4-3*0.3+numFighter*1.1214 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE1, 4-1*0.3+numFighter*1.2345 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE2, 4-2*0.3+numFighter*1.2125 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE3, 4-3*0.3+numFighter*1.2912 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE4, 4-4*0.3+numFighter*1.2084 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE5, 4-5*0.3+numFighter*1.2008 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE6, 4-6*0.3+numFighter*1.2341 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH1, 4-1*0.3+numFighter*1.3522 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH2, 4-2*0.3+numFighter*1.3301 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH3, 4-3*0.3+numFighter*1.3544 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH1, 4-1*0.3+numFighter*1.3489 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH2, 4-2*0.3+numFighter*1.3788 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH3, 4-3*0.3+numFighter*1.3317 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH4, 4-4*0.3+numFighter*1.3777 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH5, 4-5*0.3+numFighter*1.3315 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH1, 4-1*0.3+numFighter*1.4318 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH2, 4-2*0.3+numFighter*1.4245 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH3, 4-3*0.3+numFighter*1.4913 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH1, 4-1*0.3+numFighter*1.4801 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH2, 4-2*0.3+numFighter*1.4213 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH3, 4-3*0.3+numFighter*1.4604 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH4, 4-4*0.3+numFighter*1.4061 )
		end

		local numTrade = NumSquadrons( RAD_CONTAINER )		
		if (numTrade > 0) then
	    ResearchDemandSet( TRADEPOWER1, 4.7557 + economicallysound )
	    ResearchDemandSet( TRADEPOWER2, 4.6564 + economicallysound )
	    ResearchDemandSet( TRADEPOWER3, 4.4528 + economicallysound )	
	    ResearchDemandSet( TRADESPEED1, 4.3569 + economicallysound )
	    ResearchDemandSet( TRADESPEED2, 4.2574 + economicallysound )
	    ResearchDemandSet( TRADESPEED3, 4.1516 + economicallysound )	
	  end
	  
---Fighter	
    local numFighter = numActiveOfClass( s_playerIndex, eFighter )	
		if (numFighter > 5) then
		  --boost
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE1, numFighter * 1.3664 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE2, numFighter * 1.2243 )
		  ResearchDemandSet( FIGHTERBOOSTRECHARGEUPGRADE3, numFighter * 1.1189 )	
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE1, numFighter * 1.4573 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE2, numFighter * 1.3123 )
		  ResearchDemandSet( FIGHTERBOOSTTIMEUPGRADE3, numFighter * 1.2219 )				  
		  ResearchDemandSet( SUPERFIGHTERARMOR, numFighter * 2.0486 )
		end										
		
---Corvette	
    local numCorvette = numActiveOfClass( s_playerIndex, eCorvette )	
		if (numCorvette > 4) then 
			--build
		  ResearchDemandSet( BOUEYBUILDSPEED, numCorvette * 1.8 )
		  --boost
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE1, numCorvette * 1.3159 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE2, numCorvette * 1.2311 )
		  ResearchDemandSet( CORVETTEBOOSTRECHARGEUPGRADE3, numCorvette * 1.1304 )	
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE1, numCorvette * 1.4788 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE2, numCorvette * 1.3769 )
		  ResearchDemandSet( CORVETTEBOOSTTIMEUPGRADE3, numCorvette * 1.2637 )	 
		end				

---Frigate	
    local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )	
		if (numFrigate > 3) then 
			--build
		  ResearchDemandSet( LORDBUILDSPEED, numFrigate * 1.8446 )
		  ResearchDemandSet( BIGDADDYBUILDSPEED, numFrigate * 1.7249 )
		  --boost
		  if IsResearchDone(ISCAPTAIN) == 1 and GetRU() > 3000 - dif_lvl * 500 then
			  if Util_CheckResearch(FRIGATEAFTERBURNERAI) then
			  	ResearchDemandSet( FRIGATEAFTERBURNERAI, sqrt(numFrigate) * 5.7687 )	 
			  end
		  end
		end		
---Capital		
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )	
		if (numCapital > 1) then
			--build
		  ResearchDemandSet( BLACKMARKETBUILDSPEED1, numCapital * 1.8319 )
		  ResearchDemandSet( BLACKMARKETBUILDSPEED2, numCapital * 1.7391 )
		  ResearchDemandSet( BLACKMARKETBUILDSPEED3, numCapital * 1.6331 )		
		  --repair
		 	ResearchDemandSet( BLACKMARKETHEALTHREGUPGRADE1, numCapital * 2.5577 )
		  ResearchDemandSet( BLACKMARKETHEALTHREGUPGRADE2, numCapital * 2.4339 )
		  ResearchDemandSet( BLACKMARKETHEALTHREGUPGRADE3, numCapital * 2.3393 )
		  --boost
		  if IsResearchDone(ISCOMMODORE) == 1 and GetRU() > 4000 - dif_lvl * 600 then
			  if Util_CheckResearch(CAPITALAFTERBURNERAI) then
			  	ResearchDemandSet( CAPITALAFTERBURNERAI, sqrt(numCapital) * 5.7891 )	 
			  end
		  end
		  --weapons
	    local numWeapons = NumSquadrons( RAD_ARMSDEALER )
			if (numWeapons > 0) then				
	      ResearchDemandSet( WEAPONSPEEDUPGRADE1, 6 + numWeapons * 4.3486 )
				ResearchDemandSet( WEAPONSPEEDUPGRADE2, 5 + numWeapons * 3.4166 )
				ResearchDemandSet( WEAPONSPEEDUPGRADE3, 4 + numWeapons * 3.1077 )
				ResearchDemandSet( WEAPONSPEEDUPGRADE4, 7 + numWeapons * 3.2099 )
	    end
		  --refunds
		  ResearchDemandSet( SPECIALABILITYREFUND1, numCapital * 4.0764 )
		  ResearchDemandSet( SPECIALABILITYREFUND2, numCapital * 3.5626 )
		  ResearchDemandSet( SPECIALABILITYREFUND3, numCapital * 3.0214 )
		  ResearchDemandSet( SPECIALABILITYREFUND4, numCapital * 2.5438 )
		  ResearchDemandSet( SPECIALABILITYREFUND5, numCapital * 2.0311 )
		  --special ability upgrades
		  ResearchDemandSet( SPECIALABILITY1LEVEL1, numCapital * 4.0329 )
		  ResearchDemandSet( SPECIALABILITY1LEVEL2, numCapital * 3.0376 )
		  ResearchDemandSet( SPECIALABILITY1LEVEL3, numCapital * 2.0621 )
		  ResearchDemandSet( SPECIALABILITY2LEVEL1, numCapital * 4.0719 )
		  ResearchDemandSet( SPECIALABILITY2LEVEL2, numCapital * 3.0238 )
		  ResearchDemandSet( SPECIALABILITY2LEVEL3, numCapital * 2.0164 )
		  ResearchDemandSet( SPECIALABILITY3LEVEL1, numCapital * 4.0878 )
		  ResearchDemandSet( SPECIALABILITY3LEVEL2, numCapital * 3.0876 )
		  ResearchDemandSet( SPECIALABILITY3LEVEL3, numCapital * 2.0518 )
		  ResearchDemandSet( SPECIALABILITY4LEVEL1, numCapital * 4.0391 )
		  ResearchDemandSet( SPECIALABILITY4LEVEL2, numCapital * 3.0526 )
		  ResearchDemandSet( SPECIALABILITY4LEVEL3, numCapital * 2.0731 )
		  ResearchDemandSet( SPECIALABILITY5LEVEL1, numCapital * 4.0138 )
		  ResearchDemandSet( SPECIALABILITY5LEVEL2, numCapital * 3.0486 )
		  ResearchDemandSet( SPECIALABILITY5LEVEL3, numCapital * 2.0894 )
		  ResearchDemandSet( SPECIALABILITY6LEVEL1, numCapital * 4.0196 )
		  ResearchDemandSet( SPECIALABILITY6LEVEL2, numCapital * 3.0173 )
		  ResearchDemandSet( SPECIALABILITY6LEVEL3, numCapital * 2.0371 )
		  ResearchDemandSet( SPECIALABILITY7LEVEL1, numCapital * 4.0926 )
		  ResearchDemandSet( SPECIALABILITY7LEVEL2, numCapital * 3.0453 )
		  ResearchDemandSet( SPECIALABILITY7LEVEL3, numCapital * 2.0785 )
		  ResearchDemandSet( SPECIALABILITY8LEVEL1, numCapital * 4.0765 )
		  ResearchDemandSet( SPECIALABILITY8LEVEL2, numCapital * 3.0683 )
		  ResearchDemandSet( SPECIALABILITY8LEVEL3, numCapital * 2.0771 )
		  ResearchDemandSet( SPECIALABILITY9LEVEL1, numCapital * 4.0258 )
		  ResearchDemandSet( SPECIALABILITY9LEVEL2, numCapital * 3.0457 )
		  ResearchDemandSet( SPECIALABILITY9LEVEL3, numCapital * 2.0456 )
		  ResearchDemandSet( SPECIALABILITY10LEVEL1, numCapital * 4.0364 )
		  ResearchDemandSet( SPECIALABILITY10LEVEL2, numCapital * 3.0388 )
		  ResearchDemandSet( SPECIALABILITY10LEVEL3, numCapital * 2.0456 )
		end	
		
---Utility		
		local numCollectors = NumSquadrons( RAD_RESOURCECOLLECTOR )
		if (numCollectors > 6) then				
			--build
		  ResearchDemandSet( CONTROLLERBUILDSPEED, numCollectors * 1.8576 )
		  --resource	
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION1, numCollectors*4.5511 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION2, numCollectors*3.2599 )
			ResearchDemandSet( RESOURCECOLLECTOREXTRACTION3, numCollectors*3.1973 )
		end		
		local numMineContainers = NumSquadrons( RAD_MINECONTAINER )
		if (numMineContainers > 2) then		
		  --resource	
			ResearchDemandSet( MINECONTAINERLOAD1, numMineContainers*3.5587 )
			ResearchDemandSet( MINECONTAINERLOAD2, numMineContainers*3.3345 )
			ResearchDemandSet( MINECONTAINERLOAD3, numMineContainers*3.1991 )
			ResearchDemandSet( MINECONTAINERRURATE1, numMineContainers*3.7558 )
			ResearchDemandSet( MINECONTAINERRURATE2, numMineContainers*3.5483 )
			ResearchDemandSet( MINECONTAINERRURATE3, numMineContainers*2.5546 )
		end		
		ResearchDemandSet( MINECONTAINERDROPOFF1, numMineContainers*3.1588 )
		ResearchDemandSet( MINECONTAINERDROPOFF2, numMineContainers*2.9233 )
		ResearchDemandSet( MINECONTAINERDROPOFF3, numMineContainers*1.4278 )
		
	end
end

function DoUpgradeDemand_Keeper()
	if (s_militaryStrength > 7) then

---Economic status	
	  local economicallysound = 0
	  if GetRU() > 5000 then
	    economicallysound = 50
	  elseif GetRU() > 10000 then
	    economicallysound = 75
	  elseif GetRU() > 15000 then
	    economicallysound = 100
	  end  	  	
	  if (s_militaryPop > 11 and GetRU() > 1000) then		  
		  ResearchDemandSet( MAINTENANCE1, 30.1289 + economicallysound )
		end
		if (s_militaryPop > 16 and GetRU() > 2000) then		  
		  ResearchDemandSet( MAINTENANCE2, 25.4524 + economicallysound )
		end
		if (s_militaryPop > 19 and GetRU() > 4000) then		  
		  ResearchDemandSet( MAINTENANCE3, 20.4146 )
		end
		
		if (s_militaryPop > 7 and GetRU() > 950) then
		  if (Util_CheckResearch(COMPUTERLINK) ) then
		    ResearchDemandSet( COMPUTERLINK, 0.8529 )
		  end		
		end
	  if (s_militaryPop > 9 and GetRU() > 1200) then
	    ResearchDemandSet( COMPUTERLINK1, 2.6943 + economicallysound )
	  end	
	  if (s_militaryPop > 11 and GetRU() > 2450) then
	    ResearchDemandSet( COMPUTERLINK2, 2.4329 + economicallysound )
	  end
	  if (s_militaryPop > 14 and GetRU() > 3700) then
	    ResearchDemandSet( COMPUTERLINK3, 2.1712 )
	  end
	
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( ENGINEERINGBAY1, 2.6933 + economicallysound )
    end	
    if (s_militaryPop > 11 and GetRU() > 4000) then
      ResearchDemandSet( ENGINEERINGBAY2, 2.4358 + economicallysound )
    end
    if (s_militaryPop > 14 and GetRU() > 7000) then
      ResearchDemandSet( ENGINEERINGBAY3, 2.1773 )
    end
	
    if (s_militaryPop > 9 and GetRU() > 2000) then
      ResearchDemandSet( SUPPLYDROP1, 2.6914 + economicallysound )
    end	
    if (s_militaryPop > 10 and GetRU() > 4000) then
      ResearchDemandSet( SUPPLYDROP2, 2.4334 + economicallysound )
    end
    if (s_militaryPop > 11 and GetRU() > 7000) then
      ResearchDemandSet( SUPPLYDROP3, 2.1739 )
    end
    if (s_militaryPop > 11 and GetRU() > 10000) then
      ResearchDemandSet( SUPPLYDROP4, 2.0793 )
    end
    
    if (s_militaryPop > 11 and GetRU() > 3000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM1, 2.6946 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE1, 2.6811 + economicallysound )
    end	
    if (s_militaryPop > 12 and GetRU() > 5000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM2, 2.4339 + economicallysound )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE2, 2.4273 + economicallysound )
    end
    if (s_militaryPop > 13 and GetRU() > 8000) then
      ResearchDemandSet( DERELICTBATTLESHIPAIM3, 2.1728 )
      ResearchDemandSet( DERELICTBATTLESHIPDAMAGE3, 2.1646 )
    end

--research booster
    if GetRU() > 2000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST1, 3.2353 + economicallysound )
    end	
    if GetRU() > 5000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST2, 3.1311 + economicallysound )
    end
    if GetRU() > 8000 then
      ResearchDemandSet( RESEARCHSPEEDBOOST3, 3.0578 + economicallysound )
    end
    if GetRU() > 15000 then
    	ResearchDemandSet( RESEARCHSPEEDBOOST4, 2.9147 + economicallysound )
    end

--Drone Tech
		local numFrigate = numActiveOfClass( s_playerIndex, eFrigate )
		if GetRU() > 3000 then
			ResearchDemandSet( DRONETECHSCOUTDRONE1, 4-1*0.3+numFrigate + 0.5248 )
			ResearchDemandSet( DRONETECHBATTLEDRONE1, 4-2*0.3+numFrigate + 0.3421 )
			ResearchDemandSet( DRONETECHBATTLEDRONE2, 4-3*0.3+numFrigate + 0.8891 )
			ResearchDemandSet( DRONETECHBATTLEDRONE3, 4-4*0.3+numFrigate + 0.2491 )
		end

--Air Combat
		local numFighter = numActiveOfClass( s_playerIndex, eFighter )
		if GetRU() > 2000 then
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE1, 4-1*0.3+numFighter + 0.3491 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE2, 4-2*0.3+numFighter + 0.6484 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE3, 4-3*0.3+numFighter + 0.5791 )
			ResearchDemandSet( AIRCOMBATBUILDUPGRADE4, 4-4*0.3+numFighter + 0.7554 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE1, 4-1*0.3+numFighter*1.1455 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE2, 4-2*0.3+numFighter*1.1245 )
			ResearchDemandSet( AIRCOMBATASSEMBLYLINEUPGRADE3, 4-3*0.3+numFighter*1.1671 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE1, 4-1*0.3+numFighter*1.2379 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE2, 4-2*0.3+numFighter*1.2845 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE3, 4-3*0.3+numFighter*1.2146 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE4, 4-4*0.3+numFighter*1.2366 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE5, 4-5*0.3+numFighter*1.2314 )
			ResearchDemandSet( AIRCOMBATCAPACITYUPGRADE6, 4-6*0.3+numFighter*1.2791 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH1, 4-1*0.3+numFighter*1.3397 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH2, 4-2*0.3+numFighter*1.3699 )
			ResearchDemandSet( AIRCOMBAT_FIGHTERTECH3, 4-3*0.3+numFighter*1.3679 )
		end
		if GetRU() > 3000 then
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH1, 4-1*0.3+numFighter*1.3766 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH2, 4-2*0.3+numFighter*1.3428 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH3, 4-3*0.3+numFighter*1.3243 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH4, 4-4*0.3+numFighter*1.3543 )
			ResearchDemandSet( AIRCOMBAT_STRIKECRAFTTECH5, 4-5*0.3+numFighter*1.3671 )
		end
		if GetRU() > 5000 then
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH1, 4-1*0.3+numFighter*1.4269 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH2, 4-2*0.3+numFighter*1.4791 )
			ResearchDemandSet( AIRCOMBAT_BOMBERTECH3, 4-3*0.3+numFighter*1.4366 )
		end
		if GetRU() > 4000 then
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH1, 4-1*0.3+numFighter*1.4579 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH2, 4-2*0.3+numFighter*1.4245 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH3, 4-3*0.3+numFighter*1.4339 )
			ResearchDemandSet( AIRCOMBAT_SPECIALTECH4, 4-4*0.3+numFighter*1.4378 )
		end
		
		--special powers
		local numCapital = numActiveOfClass( s_playerIndex, eCapital )	
		if (numCapital > 1) then
		  ResearchDemandSet( SPECIALPOWERINERTIADRIVE1, numCapital * 4.0397 )
		  ResearchDemandSet( SPECIALPOWERINERTIADRIVE2, numCapital * 3.5712 )
		  ResearchDemandSet( SPECIALPOWERINERTIADRIVE3, numCapital * 3.0769 )
		  
		  ResearchDemandSet( SPECIALPOWERREPULSOR1, numCapital * 3.5728 )
		  ResearchDemandSet( SPECIALPOWERREPULSOR2, numCapital * 3.0089 )
		  ResearchDemandSet( SPECIALPOWERREPULSOR3, numCapital * 2.5027 )
		  
		  ResearchDemandSet( SPECIALPOWERGAMMARAY1, numCapital * 4.0789 )
		  ResearchDemandSet( SPECIALPOWERGAMMARAY2, numCapital * 3.5128 )
		  ResearchDemandSet( SPECIALPOWERGAMMARAY3, numCapital * 3.0189 )
		  
		  ResearchDemandSet( SPECIALPOWERDIMENSIONATTACK1, numCapital * 4.0508 )
		  ResearchDemandSet( SPECIALPOWERDIMENSIONATTACK2, numCapital * 3.5769 )
		  ResearchDemandSet( SPECIALPOWERDIMENSIONATTACK3, numCapital * 3.0208 )
		  
		  ResearchDemandSet( SPECIALPOWERBLACKHOLE1, numCapital * 4.0997 )
		  ResearchDemandSet( SPECIALPOWERBLACKHOLE2, numCapital * 3.5751 )
		  ResearchDemandSet( SPECIALPOWERBLACKHOLE3, numCapital * 3.0455 )
		  
		  ResearchDemandSet( SPECIALPOWERLIGHTGRANULE1, numCapital * 4.5209 )
		  ResearchDemandSet( SPECIALPOWERLIGHTGRANULE2, numCapital * 4.0737 )
		  ResearchDemandSet( SPECIALPOWERLIGHTGRANULE3, numCapital * 3.5573 )
		end

	end
end

function DoResearchTechDemand_Keeper()

---determina la velocit?del gioco
  local gamespeed = 1
  if IsResearchDone( GAMESPEED3 ) == 1 then
	  gamespeed = 1.2
	elseif IsResearchDone( GAMESPEED2 ) == 1 then
	  gamespeed = 1
	elseif IsResearchDone( GAMESPEED1 ) == 1 then
	  gamespeed = 0.8
	end	 		   

---economically sound  
  local economicallysound = 0
  if GetRU() > 5000 then
    economicallysound = 50
  elseif GetRU() > 10000 then
    economicallysound = 75
  elseif GetRU() > 15000 then
    economicallysound = 100
  end  	  	

---AI  	
  if (Util_CheckResearch(ISAI) ) then
	  ResearchDemandSet( ISAI, 199.5489 )		--99
	end				
	if g_LOD == 0 then
	  if (Util_CheckResearch(ISEASY) ) then
		  ResearchDemandSet( ISEASY, 199.4598 )		--75
		end	
	elseif g_LOD == 1 then
	  if (Util_CheckResearch(ISSTANDARD) ) then
		  ResearchDemandSet( ISSTANDARD, 199.4534 )		--75
		end	
	elseif g_LOD == 2 then
	  if (Util_CheckResearch(ISHARD) ) then
		  ResearchDemandSet( ISHARD, 199.4297 )		--75
		end	
	elseif g_LOD > 2 then
	  if (Util_CheckResearch(ISEXPERT) ) then
		  ResearchDemandSet( ISEXPERT, 199.4138 )		--75
		end	
	end	

---NEBULA
  if (Util_CheckResearch(NEBULA) ) then
	  ResearchDemandSet( NEBULA, 99.4528 )
	end	
	
	local awaken_priority = 0
	if IsResearchDone(AWAKENTHESENTIENTS) == 0 then
		awaken_priority = awaken_priority + 1
	end
	if IsResearchDone(AWAKENTHEAUTONOMS) == 0 then
		awaken_priority = awaken_priority + 1
	end
	if IsResearchDone(EXTERMINATIONCHOICE) == 0 and IsResearchDone(PACIFIERCHOICE) == 0 then
		awaken_priority = awaken_priority + 1
	end
	
---resource
  if GetRU() > 4000 then	
    if (Util_CheckResearch(RESOURCE1) ) then
		  ResearchDemandSet( RESOURCE1, 99.1238 - awaken_priority*5 )
		end		
  end
  if GetRU() > 14000 then	
    if (Util_CheckResearch(RESOURCE2) ) then
		  ResearchDemandSet( RESOURCE2, 99.1286 - awaken_priority*10 )
		end		
  end
  if GetRU() > 34000 then	
    if (Util_CheckResearch(RESOURCE3) ) then
		  ResearchDemandSet( RESOURCE3, 99.4164 - awaken_priority*20 )
		end		
  end
  if GetRU() > 64000 then	
    if (Util_CheckResearch(RESOURCE4) ) then
		  ResearchDemandSet( RESOURCE4, 99.4197 - awaken_priority*30 )
		end		
  end
	
---crew
  if (Util_CheckResearch(CREW1) ) then
	  ResearchDemandSet( CREW1, 199.1267 - awaken_priority*50 )
	end			
	if (Util_CheckResearch(CREW2) ) then
	  ResearchDemandSet( CREW2, 189.1587 - awaken_priority*49 )
	end			
	if (Util_CheckResearch(CREW3) ) then
	  ResearchDemandSet( CREW3, 179.3497 - awaken_priority*48 )
	end				
	if (Util_CheckResearch(CREW4) ) then
	  ResearchDemandSet( CREW4, 169.4214 - awaken_priority*47 )
	end				
	if (Util_CheckResearch(CREW5) ) then
	  ResearchDemandSet( CREW5, 159.4567 - awaken_priority*46 )
	end		
	if (Util_CheckResearch(CREW6) ) then
	  ResearchDemandSet( CREW6, 149.4586 - awaken_priority*45 )
	end		
---officer
	if IsResearchDone(AWAKENTHESENTIENTS) == 1 then
	  if (Util_CheckResearch(OFFICER1) ) then
		  ResearchDemandSet( OFFICER1, 199.1269 - awaken_priority*54 )
		end			
		if (Util_CheckResearch(OFFICER2) ) then
		  ResearchDemandSet( OFFICER2, 189.9166 - awaken_priority*53 )
		end			
		if (Util_CheckResearch(OFFICER3) ) then
		  ResearchDemandSet( OFFICER3, 179.4595 - awaken_priority*52 )
		end				
		if (Util_CheckResearch(OFFICER4) ) then
		  ResearchDemandSet( OFFICER4, 169.5666 - awaken_priority*51 )
		end				
		if (Util_CheckResearch(OFFICER5) ) then
		  ResearchDemandSet( OFFICER5, 159.3499 - awaken_priority*50 )
		end	
	end

--energy
  if (Util_CheckResearch(ENERGYPRODUCTION1) ) then
	  ResearchDemandSet( ENERGYPRODUCTION1, 150.5491 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION2) ) then
	  ResearchDemandSet( ENERGYPRODUCTION2, 140.1291 )
	end			
	if (Util_CheckResearch(ENERGYPRODUCTION3) ) then
	  ResearchDemandSet( ENERGYPRODUCTION3, 130.7894 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION4) ) then
	  ResearchDemandSet( ENERGYPRODUCTION4, 120.4684 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION5) ) then
	  ResearchDemandSet( ENERGYPRODUCTION5, 110.3588 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION6) ) then
	  ResearchDemandSet( ENERGYPRODUCTION6, 100.5681 )
	end	
  if (Util_CheckResearch(ENERGYPRODUCTION7) ) then
	  ResearchDemandSet( ENERGYPRODUCTION7, 90.6846 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION8) ) then
	  ResearchDemandSet( ENERGYPRODUCTION8, 80.8341 )
	end				
	if (Util_CheckResearch(ENERGYPRODUCTION9) ) then
	  ResearchDemandSet( ENERGYPRODUCTION9, 70.2171 )
	end		
	if (Util_CheckResearch(ENERGYPRODUCTION10) ) then
	  ResearchDemandSet( ENERGYPRODUCTION10, 60.3569 )
	end			
	
----------------Path To Victory code--------------------

	local numRU = GetRU()
	local numtoadd = 1
	if g_LOD == 0 then
		numtoadd = 1
	elseif g_LOD == 1 then
		numtoadd = 2
	elseif g_LOD > 1 then
		numtoadd = 3
	end
	local time_factor = (100+sqrt(gameTime()))/100
	local variation_factor = sqrt(numtoadd)+(2*numtoadd/time_factor)^2
	
	-- why is this comment still here? just do the goddamned research!
	if (Util_CheckResearch(AWAKENTHESENTIENTS)) then
		local numBombers = NumSquadrons( KPR_RESSOURCECOLLECTOR_OLD )
		ResearchDemandSet( AWAKENTHESENTIENTS, 15.5461*numBombers )
	end	

	if (Util_CheckResearch(KEEPERPHASESHIELDS)) then
		ResearchDemandSet( KEEPERPHASESHIELDS, 99.5866) 
	end	
	
	if (Util_CheckResearch(AWAKENTHEAUTONOMS)) then
		local numBombers = NumSquadrons( KPR_RESSOURCECOLLECTOR_OLD )
		ResearchDemandSet( AWAKENTHEAUTONOMS, 15.4061*numBombers )
	end

	--Frigate Tech
	if (Util_CheckResearch(BRUTETECH)) then
		local demand = ShipDemandGet(KPR_GUARDIAN)
		if (demand > 0) then
			ResearchDemandSet( BRUTETECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(DECEIVERTECH)) then
		local demand = ShipDemandGet(KPR_DECIEVER)
		if (demand > 0) then
			ResearchDemandSet( DECEIVERTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(HUNTERTECH)) then
		local demand = ShipDemandGet(KPR_HUNTER)
		if (demand > 0) then
			ResearchDemandSet( HUNTERTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(SEEKERTECH)) then
		local demand = ShipDemandGet(KPR_SEEKER)
		if (demand > 0) then
			ResearchDemandSet( SEEKERTECH, demand * variation_factor )
		end
	end
	
	--Fighter Tech
	if (Util_CheckResearch(AGITATORTECH)) then
		local demand = ShipDemandGet(KPR_INTERCEPTOR_OLD)
		if (demand > 0) then
			ResearchDemandSet( AGITATORTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(SHIFTERTECH)) then
		local demand = ShipDemandGet(KPR_ATTACKDROID)
		if (demand > 0) then
			ResearchDemandSet( SHIFTERTECH, demand * variation_factor )
		end
	end
	
	--Corvette Tech
	if (Util_CheckResearch(AGITATORCOMBOTECH)) then
		local demand = ShipDemandGet(KPR_INTERCEPTOR_COMBO)
		if (demand > 0) then
			ResearchDemandSet( AGITATORCOMBOTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(AGITATORSHIFTERCOMBOTECH)) then
		local demand = ShipDemandGet(KPR_ATTACKDROID_AGITATOR)
		if (demand > 0) then
			ResearchDemandSet( AGITATORSHIFTERCOMBOTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(SHIFTERCOMBOTECH)) then
		local demand = ShipDemandGet(KPR_ATTACKDROID_COMBO)
		if (demand > 0) then
			ResearchDemandSet( SHIFTERCOMBOTECH, demand * variation_factor )
		end
	end
	if (Util_CheckResearch(MOVERTECH)) then
		local demand = ShipDemandGet(KPR_MOVER)
		if (demand > 0) then
			ResearchDemandSet( MOVERTECH, demand * variation_factor )
		end
	end
	
	--Capital Tech
	local check_rank = NumSubSystems(ISLIEUTENANT)
	if check_rank > 0 then
		if (Util_CheckResearch(HIVETECH)) then
			local demand = ShipDemandGet(KPR_HIVE)
			if (demand > 0) then
				ResearchDemandSet( HIVETECH, 1.1*demand * variation_factor )
			end
		end
	end
	local check_rank = NumSubSystems(ISCOMMANDER)
	if check_rank > 0 then
		if (Util_CheckResearch(KEEPERTECH)) then
			local demand = ShipDemandGet(KPR_DESTROYER)
			if (demand > 0) then
				ResearchDemandSet( KEEPERTECH, 1.3*demand * variation_factor )
			end
		end
	end
	local check_rank = NumSubSystems(ISCAPTAIN)
	if check_rank > 0 then
		if (Util_CheckResearch(SLEEPERTECH)) then
			local demand = ShipDemandGet(KPR_CARRIER)
			if (demand > 0) then
				ResearchDemandSet( SLEEPERTECH, 1.5*demand * variation_factor )
			end
		end
	end
	local check_rank = NumSubSystems(ISCOMMODORE)
	if check_rank > 0 then
		if (Util_CheckResearch(REAVERTECH)) then
			local demand = ShipDemandGet(KPR_REAVER)
			if (demand > 0) then
				ResearchDemandSet( REAVERTECH, 1.7*demand * variation_factor )
			end
		end
	end
	local check_rank = NumSubSystems(ISADMIRAL)
	if check_rank > 0 then
		if (Util_CheckResearch(DREADNAUGHTTECH)) then
			local demand = ShipDemandGet(KPR_DREADNAUGHT)
			if (demand > 0) then
				ResearchDemandSet( DREADNAUGHTTECH, 1.9*demand * variation_factor )
			end
		end
	end
	local check_rank = NumSubSystems(ISFLEETADMIRAL)
	if check_rank > 0 then
		if (Util_CheckResearch(SAJUUKTECH)) then
			local demand = ShipDemandGet(KPR_SAJUUK)
			if (demand > 0) then
				ResearchDemandSet( SAJUUKTECH, 2.1*demand * variation_factor )
			end
		end
	end

	if (numActiveOfClass(s_playerIndex, eFighter) > 3) then
		if (numRU > 4000 and Util_CheckResearch(DROIDDAMAGEI)) then
			ResearchDemandSet( DROIDDAMAGEI, 5.5489 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDDAMAGEII)) then
			ResearchDemandSet( DROIDDAMAGEII, 5.4115 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDDAMAGEIII)) then
			ResearchDemandSet( DROIDDAMAGEIII, 5.1209 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDDAMAGEIV)) then
			ResearchDemandSet( DROIDDAMAGEIV, 5.1667 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDARMORI)) then
			ResearchDemandSet( DROIDARMORI, 5.6891 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DROIDACCURACYI)) then
			ResearchDemandSet( DROIDACCURACYI, 5.9463 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DROIDREGENERATIONI)) then
			ResearchDemandSet( DROIDREGENERATIONI, 5.7364 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDARMORII)) then
			ResearchDemandSet( DROIDARMORII, 5.4691 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DROIDACCURACYII)) then
			ResearchDemandSet( DROIDACCURACYII, 5.6479 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DROIDREGENERATIONII)) then
			ResearchDemandSet( DROIDREGENERATIONII, 5.6511 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDARMORIII)) then
			ResearchDemandSet( DROIDARMORIII, 5.9382 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DROIDACCURACYIII)) then
			ResearchDemandSet( DROIDACCURACYIII, 5.1372 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DROIDREGENERATIONIII)) then
			ResearchDemandSet( DROIDREGENERATIONIII, 5.1093 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DROIDARMORIV)) then
			ResearchDemandSet( DROIDARMORIV, 5.1805 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DROIDACCURACYIV)) then
			ResearchDemandSet( DROIDACCURACYIV, 5.5046 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DROIDREGENERATIONIV)) then
			ResearchDemandSet( DROIDREGENERATIONIV, 5.1672 ) 
		end
	end
	
	if (numActiveOfClass(s_playerIndex, eCorvette) > 3) then
		if (numRU > 4000 and Util_CheckResearch(DRONEDAMAGEI)) then
			ResearchDemandSet( DRONEDAMAGEI, 5.1203 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEDAMAGEII)) then
			ResearchDemandSet( DRONEDAMAGEII, 5.4916 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEDAMAGEIII)) then
			ResearchDemandSet( DRONEDAMAGEIII, 5.3411 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEDAMAGEIV)) then
			ResearchDemandSet( DRONEDAMAGEIV, 5.4925 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEARMORI)) then
			ResearchDemandSet( DRONEARMORI, 5.1553 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DRONEACCURACYI)) then
			ResearchDemandSet( DRONEACCURACYI, 5.9276 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DRONEREGENERATIONI)) then
			ResearchDemandSet( DRONEREGENERATIONI, 5.1375 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEARMORII)) then
			ResearchDemandSet( DRONEARMORII, 5.1294 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DRONEACCURACYII)) then
			ResearchDemandSet( DRONEACCURACYII, 5.1392 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DRONEREGENERATIONII)) then
			ResearchDemandSet( DRONEREGENERATIONII, 5.1291 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEARMORIII)) then
			ResearchDemandSet( DRONEARMORIII, 5.1608 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DRONEACCURACYIII)) then
			ResearchDemandSet( DRONEACCURACYIII, 5.0509 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DRONEREGENERATIONIII)) then
			ResearchDemandSet( DRONEREGENERATIONIII, 5.4671 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(DRONEARMORIV)) then
			ResearchDemandSet( DRONEARMORIV, 5.1694 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(DRONEACCURACYIV)) then
			ResearchDemandSet( DRONEACCURACYIV, 5.1446 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(DRONEREGENERATIONIV)) then
			ResearchDemandSet( DRONEREGENERATIONIV, 5.4996 ) 
		end
	end
	
	if (numActiveOfClass(s_playerIndex, eFrigate) > 3) then
		if (numRU > 4000 and Util_CheckResearch(FRIGATECLOAK)) then
			ResearchDemandSet( FRIGATECLOAK, 6.0446 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMDAMAGEI)) then
			ResearchDemandSet( AUTONOMDAMAGEI, 5.4293 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMDAMAGEII)) then
			ResearchDemandSet( AUTONOMDAMAGEII, 5.2461 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMDAMAGEIII)) then
			ResearchDemandSet( AUTONOMDAMAGEIII, 5.1734 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMDAMAGEIV)) then
			ResearchDemandSet( AUTONOMDAMAGEIV, 5.1644 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMARMORI)) then
			ResearchDemandSet( AUTONOMARMORI, 5.6431 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(AUTONOMACCURACYI)) then
			ResearchDemandSet( AUTONOMACCURACYI, 5.9431 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(AUTONOMREGENERATIONI)) then
			ResearchDemandSet( AUTONOMREGENERATIONI, 5.9735 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMARMORII)) then
			ResearchDemandSet( AUTONOMARMORII, 5.5631 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(AUTONOMACCURACYII)) then
			ResearchDemandSet( AUTONOMACCURACYII, 5.6731 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(AUTONOMREGENERATIONII)) then
			ResearchDemandSet( AUTONOMREGENERATIONII, 5.3164 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMARMORIII)) then
			ResearchDemandSet( AUTONOMARMORIII, 5.5531 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(AUTONOMACCURACYIII)) then
			ResearchDemandSet( AUTONOMACCURACYIII, 5.4562 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(AUTONOMREGENERATIONIII)) then
			ResearchDemandSet( AUTONOMREGENERATIONIII, 5.7561 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(AUTONOMARMORIV)) then
			ResearchDemandSet( AUTONOMARMORIV, 5.5482 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(AUTONOMACCURACYIV)) then
			ResearchDemandSet( AUTONOMACCURACYIV, 5.1097 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(AUTONOMREGENERATIONIV)) then
			ResearchDemandSet( AUTONOMREGENERATIONIV, 5.4641 ) 
		end
	end
	
	if (numActiveOfClass(s_playerIndex, eCapital) > 3) then
		if (numRU > 4000 and Util_CheckResearch(SENTIENTDAMAGEI)) then
			ResearchDemandSet( SENTIENTDAMAGEI, 5.5655 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTDAMAGEII)) then
			ResearchDemandSet( SENTIENTDAMAGEII, 5.4055 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTDAMAGEIII)) then
			ResearchDemandSet( SENTIENTDAMAGEIII, 5.4595 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTDAMAGEIV)) then
			ResearchDemandSet( SENTIENTDAMAGEIV, 5.9131 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTARMORI)) then
			ResearchDemandSet( SENTIENTARMORI, 5.5001 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(SENTIENTACCURACYI)) then
			ResearchDemandSet( SENTIENTACCURACYI, 5.6138 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(SENTIENTREGENERATIONI)) then
			ResearchDemandSet( SENTIENTREGENERATIONI, 5.4913 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTARMORII)) then
			ResearchDemandSet( SENTIENTARMORII, 5.2283 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(SENTIENTACCURACYII)) then
			ResearchDemandSet( SENTIENTACCURACYII, 5.1582 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(SENTIENTREGENERATIONII)) then
			ResearchDemandSet( SENTIENTREGENERATIONII, 5.4621 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTARMORIII)) then
			ResearchDemandSet( SENTIENTARMORIII, 5.9812 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(SENTIENTACCURACYIII)) then
			ResearchDemandSet( SENTIENTACCURACYIII, 5.9736 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(SENTIENTREGENERATIONIII)) then
			ResearchDemandSet( SENTIENTREGENERATIONIII, 5.9754 ) 
		end
		if (numRU > 4000 and Util_CheckResearch(SENTIENTARMORIV)) then
			ResearchDemandSet( SENTIENTARMORIV, 5.5954 ) 
		end		
		if (numRU > 4000 and Util_CheckResearch(SENTIENTACCURACYIV)) then
			ResearchDemandSet( SENTIENTACCURACYIV, 5.5497 ) 
		end	
		if (numRU > 4000 and Util_CheckResearch(SENTIENTREGENERATIONIV)) then
			ResearchDemandSet( SENTIENTREGENERATIONIV, 5.5564 ) 
		end
	end

	if (IsResearchDone(EXTERMINATIONCHOICE) == 1) then
		if (numRU > 1000 and Util_CheckResearch(EXTERMINATORRUBONUS)) then
			ResearchDemandSet( EXTERMINATORRUBONUS, 50.4876 ) 
		end
		
		if (numRU > 4000 and Util_CheckResearch(REAVERFEEDBACK)) then
			ResearchDemandSet( REAVERFEEDBACK, 15.2183 ) 
		end
		
		if (numRU > 4000 and Util_CheckResearch(KEEPERSACRIFICE)) then
			ResearchDemandSet( KEEPERSACRIFICE, 15.4508 ) 
		end
	end
	
	if (IsResearchDone(PACIFIERCHOICE) == 1) then
		if (numRU > 4000 and Util_CheckResearch(EMERGENCYREGENERATION)) then
			ResearchDemandSet( EMERGENCYREGENERATION, 15.4569 ) 
		end
		
		if (numRU > 4000 and Util_CheckResearch(KEEPERPOSESSION)) then
			ResearchDemandSet( KEEPERPOSESSION, 15.4864 ) 
		end
		
		if (numRU > 4000 and Util_CheckResearch(REAVERCONFUSION)) then
			ResearchDemandSet( REAVERCONFUSION, 15.4067 ) 
		end
		
		if (numRU > 4000 and Util_CheckResearch(GENERATORDOCKPROTECTION)) then
			ResearchDemandSet( GENERATORDOCKPROTECTION, 15.4698 ) 
		end
	end
	
	if (numRU > 4000 and NumSquadrons( KPR_REAVER ) > 0 and Util_CheckResearch(REAVERDEFENSEFIELD)) then
		ResearchDemandSet( REAVERDEFENSEFIELD, 5.3597*NumSquadrons( KPR_REAVER ) ) 
	end
	
	if (numRU > 4000 and NumSquadrons( KPR_REAVER ) > 0 and Util_CheckResearch(REAVERCONFUSION)) then
		ResearchDemandSet( REAVERCONFUSION, 5.0485*NumSquadrons( KPR_REAVER ) ) 
	end
	
	if (numRU > 4000 and NumSquadrons( KPR_REAVER ) > 0 and Util_CheckResearch(REAVERFEEDBACK)) then
		ResearchDemandSet( REAVERFEEDBACK, 5.4456*NumSquadrons( KPR_REAVER ) ) 
	end

	if (numRU > 5000 and NumSquadrons( KPR_CARRIER ) > 0 and Util_CheckResearch(SLEEPERSLEEPFIELD)) then
		ResearchDemandSet( SLEEPERSLEEPFIELD, 5.4897*NumSquadrons( KPR_CARRIER ) ) 
	end
	
	if (numRU > 5000 and NumSquadrons( KPR_CARRIER ) > 0 and Util_CheckResearch(SLEEPERLOCKDOWNABILITY)) then
		ResearchDemandSet( SLEEPERLOCKDOWNABILITY, 5.4506*NumSquadrons( KPR_CARRIER ) )
	end
	
	if (numRU > 5000 and NumSquadrons( KPR_DREADNAUGHT ) > 0 and Util_CheckResearch(HARBINGERCRITICALMASS)) then
		ResearchDemandSet( HARBINGERCRITICALMASS, 5.4992*NumSquadrons( KPR_DREADNAUGHT ) ) 
	end
	
	if (numRU > 3000 and NumSquadrons( KPR_HUNTER ) > 0 and Util_CheckResearch(HUNTERREGENSTEALTH)) then
		ResearchDemandSet( HUNTERREGENSTEALTH, 5.1617*NumSquadrons( KPR_HUNTER ) ) 
	end
	
	if (numRU > 3000 and NumSquadrons( KPR_SEEKER ) > 0 and Util_CheckResearch(SEEKERABILITYSWARM)) then
		ResearchDemandSet( SEEKERABILITYSWARM, 5.4156*NumSquadrons( KPR_SEEKER ) ) 
	end
	
	if (numRU > 3000 and NumSquadrons( KPR_GUARDIAN ) > 0 and Util_CheckResearch(BRUTEHEAVYPLASMACANNON)) then
		ResearchDemandSet( BRUTEHEAVYPLASMACANNON, 5.4601*NumSquadrons( KPR_GUARDIAN ) ) 
	end
	
	if (numRU > 2000 and NumSquadrons( KPR_MOVER ) > 0 and Util_CheckResearch(REPAIRABILITY_MOVER)) then
		ResearchDemandSet( REPAIRABILITY_MOVER, 5.1745*NumSquadrons( KPR_MOVER ) )
	end
	
	if (numRU > 2000 and NumSquadrons( KPR_DRONESTRUCT ) > 0 and Util_CheckResearch(CONSTRUCTDEFENSEFIELD)) then
		ResearchDemandSet( CONSTRUCTDEFENSEFIELD, 5.7769*NumSquadrons( KPR_DRONESTRUCT ) )
	end
	
	if (numRU > 4000 and NumSquadrons( KPR_HIVE ) > 0 and Util_CheckResearch(HIVECLOAK)) then
		ResearchDemandSet( HIVECLOAK, 5.7677*NumSquadrons( KPR_HIVE ) )
	end
	
	if (numRU > 5000 and NumSquadrons( KPR_SAJUUK ) > 0 and Util_CheckResearch(SAJUUKPHASESHIELDS)) then
		ResearchDemandSet( SAJUUKPHASESHIELDS, 15.0788 )
	end
	
		
end

function inc_research_demand( researchtype, val)
	local typeis = typeid(researchtype);		
	if (typeis == LT_TABLE) then
		for i, v in researchtype do
			inc_research_demand(v, val);
		end
	else
		if (Util_CheckResearch(researchtype)) then
			ResearchDemandAdd( researchtype, val )
		end
	end
end
function inc_upgrade_demand( upgradetype, val )
	inc_research_demand( upgradetype, val )
end


