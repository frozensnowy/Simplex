ExperienceTitleList = {}
ExperienceTitleList["hgn"] = {"Rookie", "Seaman", "Technician", "Veteran", "Elite", "Ace", "Heroic", "Colossus", "Nonpareil", "Immortal", "Your Ad. Here"}
ExperienceTitleList["vgr"] = {"Cannon Fodder", "Cadet", "Legionnaire", "Vanguard", "Bannerman", "Centurion", "General", "Field Marshall", "Imperator", "Fuehrer", "Sajuuk-Khar"}
ExperienceTitleList["kad"] = {"Disciple", "Religious", "Priest", "Diaconate", "Presbyterate", "Bishop", "Archbishop", "Primate", "Cardinal", "Pontiff", "Providence"}
ExperienceTitleList["rad"] = {"Noob", "Vagabond", "Star Shitizen", "Saboteur", "Angry Mob", "At Large", "Incendiary", "Pirate", "Pit Lord", "Warlord", "Cheng Guan"}
ExperienceTitleList["kpr"] = {"Secular", "Awakening", "Computator", "Actuator", "Seer", "Transcendence", "Incarnation", "Patriarch", "Epiphany", "Deity", "Anima Mundi"}

function Experience_GetTitle(player, experience)
	return ExperienceTitleList[ShipList_GetRaceTag(player)][min(11, floor((experience+1)/100)+1)]
end

function experience()
	--print("experience - Start")
  experienceExecute("big", "splitmotherships", nms, 1)
	experienceExecute("big", "splitresearchstations", nrs, 1)
	experienceExecute("big", "splitpowerstations", nps, 1)
	experienceExecute("big", "splitcrewstations", ncs, 1)
	experienceExecute("big", "splitweaponstations", nws, 1)
	experienceExecute("big", "splitdestroyers", nd, 3)
	experienceExecute("big", "splitcarriers", nc, 1)
	experienceExecute("big", "splitbattlecruisers", nbc, 3)
	experienceExecute("big", "splitshipyards", nsy, 1)
	experienceExecute("big", "splitcommandfortresses", ncf, 1)
	experienceExecute("big", "splithyperspacestations", nhs, 1)
	experienceExecute("big", "splitjuggernaughts", nj, 1) 
	experienceExecute("big", "splitfrigates", nf, 3)
	experienceExecute("big", "splitplatforms", np, 3)
	--experienceExecute("big", "splitresourcecollectors", nrc, 3)		--DO NOT ADD ANY SUBSYSTEM TO COLLECTOR!!! COULD LEAD TO LOAD FAIL!!!
	experienceExecute("big", "splitmobilerefineries", nmr, 3)		--Overseer needs this
	
	local playervar = 0
  while playervar < Universe_PlayerCount() do
	  playervar = playervar + 1
	  local playeridx = playervar-1
	  if Player_IsAlive(playeridx) == 1 then
		  FighterEXP.playerIndex = playeridx
		  FighterEXP.quantity[FighterEXP.playerIndex + 1] = SobGroup_Count("fighters"..playeridx)
		  experienceExecute("fighter", "splitfighters"..playeridx, nfi[playervar], 6)
		  CorvetteEXP.playerIndex = playeridx
		  CorvetteEXP.quantity[CorvetteEXP.playerIndex + 1] = SobGroup_Count("corvettes"..playeridx)
		  experienceExecute("corvette", "splitcorvettes"..playeridx, nco[playervar], 6)
		end
	end
	--print("experience - End")
end

function experienceExecute(type, Group, Counter, Factor)
  if Counter > 0 then
	  for i = 0,Counter-1,1 do                                             
	    if SobGroup_Empty(Group .. tostring(i)) == 0 then  
	    	local PlayerIdx = SobGroup_OwnedBy(Group .. tostring(i))
	      local esperienza = 0.000075
	      --build 1
	      if SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[8]) == 1 then
	        esperienza = esperienza + 0.00001
	        if Factor == 1 then
	          esperienza = esperienza + 0.00001
	        end
	      end    
	      --move 2
	      if SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[1]) == 1 then
	        esperienza = esperienza + 0.00003
	      end
	      --attack 3
	      if SobGroup_UnderAttack(Group .. tostring(i)) == 1 then
	        esperienza = esperienza + 0.00006
	        if Factor == 3 then
	          esperienza = esperienza + 0.00006
	        end
	      end
	      if SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[2]) == 1 then
	        esperienza = esperienza + 0.00009
	        if Factor == 3 then
	          esperienza = esperienza + 0.00009
	        end
	      end
	      if SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[15]) == 1 then
	        esperienza = esperienza + 0.00009
	        if Factor == 3 then
	          esperienza = esperienza + 0.00009
	        end
	      end
	      if SobGroup_UnderAttack(Group .. tostring(i)) == 1 and SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[2]) == 1 then
	      	local combat_exp = 0
	      	local damage_taken = 1 - SobGroup_HealthPercentage(Group .. tostring(i))
	      	if damage_taken > 1 then
	      		damage_taken = 1
	      	elseif damage_taken < 0 then
	      		damage_taken = 0
	      	end
	      	combat_exp = 0.00019*damage_taken*Factor
	      	esperienza = esperienza + combat_exp
	      end
	      --capture
	      if SobGroup_IsDoingAbility(Group .. tostring(i), AB_Capture ) == 1 then
	        esperienza = esperienza + 0.00019
	        if Factor == 3 then
	          esperienza = esperienza + 0.00019
	        end
	      end  
	      --guard
	      if SobGroup_IsDoingAbility(Group .. tostring(i), AB_Guard ) == 1 then
	        esperienza = esperienza + 0.00003
	        if Factor == 3 then
	          esperienza = esperienza + 0.00003
	        end
	      end 
	      --special 4    
	      if SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[25]) == 1 then
	        esperienza = esperienza + 0.00004
	      end    
	      if SobGroup_IsDoingAbility(Group .. tostring(i), abilityList[28]) == 1 then
	        esperienza = esperienza + 0.00004
	      end    
	      
	      --Rad General Adv. Training
	      if Player_GetRace(PlayerIdx) == Race_Raider then
	      	if Rad_GeneralList.General[PlayerIdx+1] == 1 and Rad_GeneralList.Rank[PlayerIdx+1] > 0 then
	      		local advtraining = (1/6)*Rad_GeneralList.Rank[PlayerIdx+1]
	      		esperienza = esperienza * (1+advtraining)
	      	end
	      end
	      
	      if type == "big" then
		      --Reassurance, in case ships lose their experience somehow
		      --if SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") == 0 then
		      	--SobGroup_CreateSubSystem(Group .. tostring(i), "experience")
		      	--SobGroup_SetHardPointHealth(Group .. tostring(i), "experience", 0.00001)
		      --end
		      
		      --Do not add more health when experience is full
		      if (SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") + (esperienza*experiencesensitivity)) < 1 then      
		      	SobGroup_SetHardPointHealth(Group .. tostring(i), "experience", (SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") + (esperienza*experiencesensitivity)))
					end
					
					--Kadeshi Advanced Training Perk
					if SobGroup_AreAnyOfTheseTypes(Group .. tostring(i), "kad_destroyer, kad_destroyer_real, kad_needleship, kad_custodian") == 1 then
						if SobGroup_GetHardPointHealth(Group .. tostring(i), "kad_perks_training") > 0 then
							--repeat again to double the speed of gaining experience
				      if (SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") + (esperienza*experiencesensitivity)) < 1 then      
				      	SobGroup_SetHardPointHealth(Group .. tostring(i), "experience", (SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") + (esperienza*experiencesensitivity)))
							end
						end
					end
					
				elseif type == "fighter" then
					if FighterEXP.serial[FighterEXP.playerIndex + 1][i+1] == nil then
						FighterEXP.serial[FighterEXP.playerIndex + 1][i+1] = 0
						if Player_GetRace(PlayerIdx) == Race_Keeper then		--drone experience
							if GetGameRubric() == GR_CAMPAIGN then
								SobGroup_SetHealth_UpgradeOnly(Group .. tostring(i), 1)		--initial bonus health
							end
							SobGroup_SetHardPointHealth(Group .. tostring(i), "experience", 0)
						end
					else
						if Table_CountElements(FighterEXP.serial[FighterEXP.playerIndex + 1]) > FighterEXP.quantity[FighterEXP.playerIndex + 1] then
							local num = FighterEXP.quantity[FighterEXP.playerIndex + 1]
							if num > 0 then
								for x = Table_CountElements(FighterEXP.serial[FighterEXP.playerIndex + 1]), num, -1 do
									FighterEXP.serial[FighterEXP.playerIndex + 1][x] = nil
								end
							end
						else
							if FighterEXP.serial[FighterEXP.playerIndex + 1][i+1] + (esperienza*experiencesensitivity) < 1 then
								FighterEXP.serial[FighterEXP.playerIndex + 1][i+1] = FighterEXP.serial[FighterEXP.playerIndex + 1][i+1] + (esperienza*experiencesensitivity)
								--print("Fighter experience working for "..Group .. tostring(i)..", +XP: "..esperienza*experiencesensitivity..", game time: "..Universe_GameTime())
							end
							if Player_GetRace(PlayerIdx) == Race_Keeper then		--drone experience
								if SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") > 0.99 and GetGameRubric() == GR_CAMPAIGN then
									SobGroup_SetHealth_UpgradeOnly(Group .. tostring(i), 1)		--initial bonus health
								end
								SobGroup_SetHardPointHealth_Smart(Group .. tostring(i), "experience", FighterEXP.serial[FighterEXP.playerIndex + 1][i+1])
							end
							exp0 = FighterEXP.serial[FighterEXP.playerIndex + 1][i+1] * 10000
							SobGroup_SetSpeed(Group .. tostring(i), 1 + exp0/1000)
							local shiphealth = SobGroup_HealthPercentage(Group .. tostring(i))
							local addhealth = 0.01*random_pseudo(1,3)
							--if shiphealth < 1 - addhealth * (1 + exp0/200) and shiphealth > exp0/10000 and shiphealth > 0 then
								--SobGroup_SetHealth(Group .. tostring(i), shiphealth + addhealth * (1 + exp0/200))
							if random_pseudo(0,2000) < exp0*(1.5 + 0.5*unithealth) and shiphealth < 1 and shiphealth > 0 then
								SobGroup_SetHealth_UpgradeOnly(Group .. tostring(i), 1)
							end
						end
					end
				
				elseif type == "corvette" then
					if CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1] == nil then
						CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1] = 0
						if Player_GetRace(PlayerIdx) == Race_Keeper then		--drone experience
							if GetGameRubric() == GR_CAMPAIGN then
								SobGroup_SetHealth_UpgradeOnly(Group .. tostring(i), 1)		--initial bonus health
							end
							SobGroup_SetHardPointHealth(Group .. tostring(i), "experience", 0)
						end
					else
						if Table_CountElements(CorvetteEXP.serial[CorvetteEXP.playerIndex + 1]) > CorvetteEXP.quantity[CorvetteEXP.playerIndex + 1] then
							local num = CorvetteEXP.quantity[CorvetteEXP.playerIndex + 1]
							if num > 0 then
								for x = Table_CountElements(CorvetteEXP.serial[CorvetteEXP.playerIndex + 1]), num, -1 do
									CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][x] = nil
								end
							end
						else
							if CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1] + (esperienza*experiencesensitivity) < 1 then
								CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1] = CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1] + (esperienza*experiencesensitivity)
								--print("Corvette experience working for "..Group .. tostring(i)..", +XP: "..esperienza*experiencesensitivity..", game time: "..Universe_GameTime())
							end
							if Player_GetRace(PlayerIdx) == Race_Keeper then		--drone experience
								if SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") > 0.99 and GetGameRubric() == GR_CAMPAIGN then
									SobGroup_SetHealth_UpgradeOnly(Group .. tostring(i), 1)		--initial bonus health
								end
								SobGroup_SetHardPointHealth_Smart(Group .. tostring(i), "experience", CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1])
							elseif GetGameRubric() == GR_CAMPAIGN then		--single player mission for Hiigaran Movers
								if Player_GetRace(PlayerIdx) == Race_Hiigaran and SobGroup_AreAnyOfTheseTypes(Group .. tostring(i), "kpr_mover") == 1 then
									SobGroup_SetHardPointHealth_Smart(Group .. tostring(i), "experience", CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1])
								end
							end
							exp0 = CorvetteEXP.serial[CorvetteEXP.playerIndex + 1][i+1] * 10000
							SobGroup_SetSpeed(Group .. tostring(i), 1 + exp0/1000)
							local shiphealth = SobGroup_HealthPercentage(Group .. tostring(i))
							local addhealth = 0.01*random_pseudo(1,3)
							--if shiphealth < 1 - addhealth * (1 + exp0/200) and shiphealth > exp0/10000 and shiphealth > 0 then
								--SobGroup_SetHealth(Group .. tostring(i), shiphealth + addhealth * (1 + exp0/200))
							if random_pseudo(0,2000) < exp0*(1.5 + 0.5*unithealth) and shiphealth < 1 and shiphealth > 0 then
								SobGroup_SetHealth_UpgradeOnly(Group .. tostring(i), 1)
							end
						end
					end
					
				end
				

	--ping
				--if Group == "splitmobilerefineries" then
				--	ExperienceList = {"peasant", "shitizen", "farmer", "landlord", "capitalist", "village head", "senator", "governor", "minister", "president", "outlaw"}
				--end
				
				if type == "big" then
					exp0 = SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") * 10000	
				elseif type == "fighter" then
					if exp0 == nil then
						exp0 = 0
					end
				elseif type == "corvette" then
					if exp0 == nil then
						exp0 = 0
					end
				end
				if exp0 > 0 then
					local ExpTitle = ""
					if SobGroup_IsSelectable(Group .. tostring(i)) == 1 then
						local ping_target = "template_exp"
						if PlayerIdx == Universe_CurrentPlayer() then
							ping_target = "template_exp1"
							ExpTitle = Experience_GetTitle(PlayerIdx, exp0)
						end
						local bars=""
						for i=1,exp0,25 do
							bars = bars.."|"
						end
						local ping = Ping_AddSobGroup("XP: "..bars, ping_target, Group .. tostring(i))
						Ping_LabelVisible(ping, 1)
						Ping_AddDescription(ping, 0, ExpTitle)
						Ping_AddDescription(ping, 1, "")	--""..min(999,floor(exp0)).." XP"
					end
				end
	    end
	  end    
	end  
end
