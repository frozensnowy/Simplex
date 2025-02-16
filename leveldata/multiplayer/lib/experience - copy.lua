function experience()
  experienceExecute("splitmotherships", nms, 1)
	experienceExecute("splitresearchstations", nrs, 1)
	experienceExecute("splitpowerstations", nps, 1)
	experienceExecute("splitcrewstations", ncs, 1)
	experienceExecute("splitweaponstations", nws, 1)
	experienceExecute("splitdestroyers", nd, 3)
	experienceExecute("splitcarriers", nc, 1)
	experienceExecute("splitbattlecruisers", nbc, 3)
	experienceExecute("splitshipyards", nsy, 1)
	experienceExecute("splitcommandfortresses", ncf, 1)
	experienceExecute("splithyperspacestations", nhs, 1)
	experienceExecute("splitjuggernaughts", nj, 1) 
	experienceExecute("splitfrigates", nf, 3)
	experienceExecute("splitplatforms", np, 3)
	--experienceExecute("splitresourcecollectors", nrc, 3)		--DO NOT ADD ANY SUBSYSTEM TO COLLECTOR!!! FFFFFFUUUUUU!!!
	experienceExecute("splitmobilerefineries", nmr, 3)
end

function experienceExecute(Group, Counter, Factor)
  if Counter > 0 then
	  for i = 0,Counter-1,1 do                                             
	    if SobGroup_Empty(Group .. tostring(i)) == 0 then  
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
				if SobGroup_AreAnyOfTheseTypes(Group .. tostring(i), "kad_destroyer, kad_destroyer_real, kad_needleship") == 1 then
					if SobGroup_GetHardPointHealth(Group .. tostring(i), "kad_perks_training") > 0 then
						--repeat again to double the speed of gaining experience
			      if (SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") + (esperienza*experiencesensitivity)) < 1 then      
			      	SobGroup_SetHardPointHealth(Group .. tostring(i), "experience", (SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") + (esperienza*experiencesensitivity)))
						end
					end
				end

	--ping	         	        	         	            	           
				ExperienceList = {"Rookie", "Seaman", "Technician", "Veteran", "Elite", "Ace", "Heroic", "Colossus", "Invincible", "Legend", "Your AD Here"}
				if Player_GetRace(SobGroup_OwnedBy(Group .. tostring(i))) == Race_Vaygr then
					ExperienceList = {"Cannon Fodder", "Cadet", "Wingman", "Squad Leader", "Bannerman", "Centurion", "General", "Marshal", "Warlord", "Commander In Chief", "Sajuuk-Khar"}
				elseif Player_GetRace(SobGroup_OwnedBy(Group .. tostring(i))) == Race_Kadeshi then
					ExperienceList = {"Disciple", "Religious", "Acolyte", "Diaconate", "Presbyterate", "Bishop", "Archbishop", "Primate", "Cardinal", "Pope", "God"}
				elseif Player_GetRace(SobGroup_OwnedBy(Group .. tostring(i))) == Race_Raider then
					ExperienceList = {"n00b", "Shitizen", "Saboteur", "Rebel", "Angry Mob", "At Large", "Pirate", "Complete Bastard", "Absolute Asshole", "Son of a Bitch", "Cheng Guan"}
				end
				--if Group == "splitmobilerefineries" then
				--	ExperienceList = {"peasant", "shitizen", "farmer", "landlord", "capitalist", "village head", "senator", "governor", "minister", "president", "outlaw"}
				--end
				
				local exp0 = SobGroup_GetHardPointHealth(Group .. tostring(i), "experience") * 10000	
				if SobGroup_OwnedBy(Group .. tostring(i)) ~= Universe_CurrentPlayer() and SobGroup_IsSelectable(Group .. tostring(i)) == 1 then
					--Ping_LabelVisible(Ping_AddSobGroup(floor(exp0) .. " EXP", "template_exp", Group .. tostring(i)), 1) 
					if exp0 >= 1000 then
						Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[11], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 900 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[10], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 800 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[9], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 700 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[8], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 600 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[7], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 500 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[6], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 400 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[5], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 300 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[4], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 200 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[3], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 >= 100 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[2], "template_exp", Group .. tostring(i)), 1) 
		      elseif exp0 > 0 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[1], "template_exp", Group .. tostring(i)), 1) 
		      end
		    end
		    if SobGroup_OwnedBy(Group .. tostring(i)) == Universe_CurrentPlayer() and SobGroup_Selected(Group .. tostring(i)) == 1 then
					if exp0 >= 1000 then
						Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[11], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 900 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[10], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 800 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[9], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 700 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[8], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 600 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[7], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 500 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[6], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 400 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[5], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 300 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[4], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 200 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[3], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 >= 100 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[2], "template_exp1", Group .. tostring(i)), 1) 
		      elseif exp0 > 0 then
		      	Ping_LabelVisible(Ping_AddSobGroup(ExperienceList[1], "template_exp1", Group .. tostring(i)), 1) 
		      end
		    end
	    end
	  end    
	end  
end
