--kamikaze select
			if UI_IsNamedElementVisible("haxor", "kamikazeselected") == 1 then
				local shipsNUM = PrepareSelectedShipsForHaxor("haxor_kamikazeselect"..playerIndex)
				local kamikazeNUM = 0
				if shipsNUM > 0 then
					SobGroup_Create("Haxor_KamikazeTarget")
					SobGroup_Create("Haxor_KamikazeTargetAttacker")
					local numships = SobGroup_SplitGroupReference("SingleHaxorToKamikaze_SOB", "haxor_kamikazeselect"..playerIndex, "AllShips", SobGroup_Count("haxor_kamikazeselect"..playerIndex))
					local numtargets = SobGroup_SplitGroupReference("SingleHaxorKamikazeTarget_SOB", "enemies"..playerIndex, "AllShips", SobGroup_Count("enemies"..playerIndex))
					for i = 0, numships - 1, 1 do
						local kamikaze_ship = "SingleHaxorToKamikaze_SOB"..i
						if SobGroup_CanDoAbility(kamikaze_ship, AB_Move) == 1 and SobGroup_HealthPercentage(kamikaze_ship) > 0 then
							SobGroup_Clear("Haxor_KamikazeTarget")
							if SobGroup_IsDoingAbility(kamikaze_ship, AB_Attack) == 1 then
								for y = 0, numtargets - 1, 1 do
									local enemyship = "SingleHaxorKamikazeTarget_SOB"..y
									SobGroup_Clear("Haxor_KamikazeTargetAttacker")
									SobGroup_GetAttackers(enemyship, "Haxor_KamikazeTargetAttacker")
									if SobGroup_SobGroupCompare(kamikaze_ship, "Haxor_KamikazeTargetAttacker") == 1 then
										SobGroup_Kamikaze(kamikaze_ship, enemyship)
										kamikazeNUM = kamikazeNUM + 1
									end
								end
							else
								SobGroup_GetAttackers(kamikaze_ship, "Haxor_KamikazeTarget")
								if SobGroup_Empty("Haxor_KamikazeTarget") == 0 then
									SobGroup_Kamikaze(kamikaze_ship, "Haxor_KamikazeTarget")
									kamikazeNUM = kamikazeNUM + 1
								end
							end
						end
					end
					if kamikazeNUM > 0 then
						UI_PlaySound("SFX_DYN_QKC_ATTACK_04")
						local targetidentity = "Orz Enemy "
						SobGroup_Create("CompareHaxorShips"..playerIndex)
						SobGroup_Clear("CompareHaxorShips"..playerIndex)
						SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_kamikazeselect"..playerIndex, "Player_Ships"..playerIndex)
						if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
							targetidentity = "(.Y.) Own "
						else
							SobGroup_FillCompare("CompareHaxorShips"..playerIndex, "haxor_kamikazeselect"..playerIndex, "allies"..playerIndex)
							if SobGroup_Empty("CompareHaxorShips"..playerIndex) == 0 then
								targetidentity = ">_<! Friendly "
							end
						end
						if Player_IsAlive(playerIndex) == 1 then
					    Subtitle_AddAccordingToRace(playerIndex,"<c=fad610>"..targetidentity.."ships launching kamikaze attack: "..kamikazeNUM.."</c>",2.711)
					  else
					  	Subtitle_Add(Actor_Keeper,"<c=fad610>"..targetidentity.."ships launching kamikaze attack: "..kamikazeNUM.."</c>",2.711)
					  end
					end
				else
					UI_PlaySound("SFX_SelectTheShipsYouWantToCommand")
				end
				UI_SetElementVisible("haxor", "kamikazeselected", 0)
			end
			
			

--survival mode 00000000 crash debug (doesn't help even after all fighter and corvette research items are granted); can be used as unfair advantage instead
			--Epic Research Hax
      local AITechGranted = 0
      local AITechGrantedValue = 0
      local AITechValueList = {500,800,1000,1300,1600,1900,2400,3000,4000,5000,6000,7000,8000,10000,50000}
      local AITechTimeList = {20,25,30,35,40,45,50,60,70,80,90,100,150,260,500}
      local AITechHackLevel = aiaids*CPULODvalueList[i+1]
      if AITechHackLevel > 15 then
      	AITechHackLevel = 15
      end
			local iRace = Player_GetRace(survival_data.WaveOwner) + 1
      dofilepath([[data:scripts/race.lua]])
      if races[iRace][1] ~= "Invalid" and races[iRace][1] ~= "Random" and races[iRace][1] ~= "Bentusi" then
				dofilepath([[data:scripts/building and research/]] .. races[iRace][1] .. [[/research.lua]])
				for z, iCount in research do
					if iCount.Cost >= 100 and iCount.Time >= 10 and iCount.Cost <= AITechValueList[AITechHackLevel] and iCount.Time <= AITechTimeList[AITechHackLevel] then		--grant research items based on their value and time
					  if String_ContainsPatternInTable(iCount.Name, {"computer","nebula","MAXHEALTH_","solarshield","remotespaceshield"}) == 0 then
						  AITechGranted = AITechGranted + Player_GrantResearchOption_Smart(survival_data.WaveOwner, iCount.Name)
						  AITechGrantedValue = AITechGrantedValue + iCount.Cost
							researchburned[survival_data.WaveOwner+1] = researchburned[survival_data.WaveOwner+1] + iCount.Cost
							--print("Research granted for AI: "..iCount.Name)
						end
					end
				end
			end
    	local plural = "s"
    	if AITechGranted < 2 then
    		plural = ""
    	end
      print("Survival AI research hax! "..AITechGranted.." item"..plural.." with "..AITechGrantedValue.." RU value granted for player index "..survival_data.WaveOwner.." ("..races[iRace][1].."), level: "..AITechHackLevel)
