function Cinematic()       
	--print("Cinematic() running, gametime: "..Universe_GameTime())
	UI_BindKeyEvent(ESCKEY, "CinematicControllerStop")
	UI_BindKeyEvent(F1KEY, "caminc") 	
	UI_BindKeyEvent(F2KEY, "camstop")	
	UI_BindKeyEvent(F3KEY, "camfocus")
	UI_BindKeyEvent(F4KEY, "camzoom")	
  UI_BindKeyEvent(F5KEY, "freecontrols")				
	if SobGroup_Count("Player_Ships"..Universe_CurrentPlayer()) <= 0 then
	  --Rule_Add("CinematicControllerStop")
		--return nil
	end
	local gestionefocus = 0	
  if cinecontatore[1] == 0 or cinecontatore[3] > 0 then
		cinecontatore[2] = 0    		
		for z = 1,6,1 do
			for i = 0,npsa[z]-1,1 do          	
				if SobGroup_Empty("splitPlayer_Ships"..(z-1) .. tostring(i)) == 0 and SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships"..(z-1) .. tostring(i), "supporter") == 0 then
          if cinecontatore[3] == 0 then	      
						if SobGroup_Selected("splitPlayer_Ships"..(z-1) .. tostring(i)) == 1 then						
							cinecontatore[2] = cinecontatore[2]+1
							SobGroup_Create("selectedCinematic" .. tostring(0) .. tostring(cinecontatore[2])) 		
							SobGroup_Clear("selectedCinematic" .. tostring(0) .. tostring(cinecontatore[2]))								
							SobGroup_SobGroupAdd("selectedCinematic" .. tostring(0) .. tostring(cinecontatore[2]), "splitPlayer_Ships"..(z-1) .. tostring(i))		
							if SobGroup_OwnedBy("splitPlayer_Ships"..(z-1) .. tostring(i)) == Universe_CurrentPlayer() then	 
							else
								--break 
							end
						end
          elseif cinecontatore[3] >= 1 then
					  --if SobGroup_OwnedBy("splitPlayer_Ships"..(z-1) .. tostring(i)) == Universe_CurrentPlayer() then
							SobGroup_Clear("temp")		
							SobGroup_GetAttackers("splitPlayer_Ships"..(z-1) .. tostring(i), "temp")
							if SobGroup_Count("temp") > 0 then
								cinecontatore[2] = cinecontatore[2]+1
								SobGroup_Create("selectedCinematic" .. tostring(1) .. tostring(cinecontatore[2])) 		
								SobGroup_Clear("selectedCinematic" .. tostring(1) .. tostring(cinecontatore[2]))								
								SobGroup_SobGroupAdd("selectedCinematic" .. tostring(1) .. tostring(cinecontatore[2]), "temp")	
							  if cinecontatore[3] == 1 then	  	  
									gestionefocus = 1
                elseif cinecontatore[3] == 2 then
                  gestionefocus = 2								
								end							
							end	
            --end							
					end
				end
			end	
      if cinecontatore[2] > 0 then	
				break
			end
		end			
		--memorizza numero navi selezionate, viene fatto solo 1 volta
		if cinecontatore[3] == 0 then
		  if cinecontatore[2] == 0 then
        UI_UnBindKeyEvent(ESCKEY) 
				UI_UnBindKeyEvent(F1KEY)
				UI_UnBindKeyEvent(F2KEY)
				UI_UnBindKeyEvent(F3KEY)  
				UI_UnBindKeyEvent(F4KEY) 	
        UI_UnBindKeyEvent(F5KEY)	        				
				Rule_Remove("Cinematic") 
				return nil
			end
		  cinecontatore[6] = cinecontatore[2]
			Subtitle_Message("[F1 Rate], [F2 Manual], [F3 Focus], [F4 Zoom], [F5 Control], [ESC Exit]", 10)
			Event_Start("startcinematic")			
		end				
	end 
	--se non trova navi (es. attackers) resetta a cinematica su selezione, se c'?camera on selection ripristina il contatore
	if cinecontatore[2] == 0 then
	  cinecontatore[2] = cinecontatore[6]
	end 
	--gestione tasti e cam type  
  if cinecontatore[4] == 6 then	 
    cinecontatore[5] = 0.5	
  elseif cinecontatore[4] ==7 then	  
	  cinecontatore[5] = 0.5	
	elseif cinecontatore[4] == 5 then
	  cinecontatore[5] = random (1,6)		--old movie mode was 3~6
  elseif cinecontatore[4] == 4 then
	  cinecontatore[5] = 1	  
	elseif cinecontatore[4] == 3 then
	  cinecontatore[5] = 2	  
	elseif cinecontatore[4] == 2 then
	  cinecontatore[5] = 3 	  
	elseif cinecontatore[4] == 1 then
	  cinecontatore[5] = 4	
  elseif cinecontatore[4] == 0 then
	  cinecontatore[5] = 5		
	end	
  if cinecontatore[4] ~= 6 then 
    --trova un punto di focus	
		local r = cinecontatore[1]
		while r == cinecontatore[1] do
			r = random (1,26)
		end  
		cinecontatore[1] = r
		Camera_FocusVolumeKeepingEyePosition ("s"..r)		
		--assegna a focus una nave		
		if gestionefocus == 0 then
		elseif gestionefocus == 1 then		  
		else
		  gestionefocus = random (0,1)
			if gestionefocus == 0 then
			  cinecontatore[2] = cinecontatore[6]
			end
		end		
		local escidaciclo = 0	
		local rr = random (1, cinecontatore[2])
		while escidaciclo <= cinecontatore[2] do	   
			if SobGroup_Empty("selectedCinematic"..gestionefocus..rr) == 0 and SobGroup_AreAnyOfTheseTypes("selectedCinematic"..gestionefocus..rr, "supporter") == 0 then
				SobGroup_Clear("focus") 
				SobGroup_SobGroupAdd("focus", "selectedCinematic"..gestionefocus..rr)
				break
			else
				SobGroup_Clear("focus") 
				Update_AllShips()
				SobGroup_FillSubstract("temp", "AllShips", "all_supporters")
				SobGroup_SobGroupAdd("focus", "temp")
				rr = random (1, cinecontatore[2])			
			end	
			escidaciclo = escidaciclo+1    
		end	
		--raccogle navi circostanti x focus alt
    SobGroup_Clear("temp") 
    SobGroup_Clear("focusalt")		
		local distance = 200
		--esce se non ci sono navi
		if SobGroup_OwnedBy("focus") >= 0 then
			if SobGroup_Count("Player_Ships"..SobGroup_OwnedBy("focus")) <= 0 then
			  Rule_Add("CinematicControllerStop")
				return nil
			end
		end
		while SobGroup_Count("focusalt") == 0 and distance < 3000 do
			if SobGroup_OwnedBy("focus") >= 0 then
			  if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..SobGroup_OwnedBy("focus"), "focus", 3000) == 1 then 
					SobGroup_FillSubstract("focusalt", "temp", "focus")
				end
			end
		  distance = distance + 200
		end		
		--inizia la cinematica in base al tipo di nave 
    if SobGroup_AreAnyOfTheseTypes("focus", "hgn_commandfortress, vgr_commandfortress, hgn_ark, hgn_battlestation") == 1 then
			if cinecontatore[7] == 1 then
			  r = random (1,3)
			elseif cinecontatore[7] == 0 then
			  r = random (4,7)
			else
			  r = random (1,7)
			end
			if r == 1 then
				Event_Start("focusbigcapitalfix")        
			elseif r == 2 then  
				Event_Start("focusbigcapitalfixfar")  				
			elseif r == 3 then  
				Event_Start("focusbigcapitalfixfarfar")  	
			elseif r == 4 then  
				Event_Start("focusfixext")   
			elseif r == 5 then  
				Event_Start("focusfixextext")  
			elseif r == 6 then  
				Event_Start("focusfixextextext")  			
			else
				Event_Start("focusfixextextextext")                      
			end              
		elseif SobGroup_AreAnyFromTheseAttackFamilies("focus", "BigCapitalShip, Mothership") == 1 then  
			if cinecontatore[7] == 1 then
			  r = random (1,12)
			elseif cinecontatore[7] == 0 then
			  r = random (13,16)
			else
			  r = random (1,16)
			end
			if r == 1 then
				Event_Start("focusbigcapitalout")        
			elseif r == 2 then  
				Event_Start("focusbigcapitaloutslow")  
			elseif r == 3 then  
				Event_Start("focusbigcapitaloutfast")				
			elseif r == 4 then
				Event_Start("focusbigcapitalin")   
			elseif r == 5 then
				Event_Start("focusbigcapitalinslow")  
      elseif r == 6 then
				Event_Start("focusbigcapitalinfast")			
			elseif r == 7 then
				Event_Start("focusbigcapitalfix")   
			elseif r == 8 then
				Event_Start("focusbigcapitalfixfar")   
			elseif r == 9 then
				Event_Start("focusbigcapitalfixfarfar")
      elseif r == 10 or r == 11 or r == 12 then  				  
				Event_Start("focusalt") 			
			elseif r == 13 then
				Event_Start("focusfixext") 
			elseif r == 14 then
				Event_Start("focusfixextext")    
			elseif r == 15 then
				Event_Start("focusfixextextext")
			else
				Event_Start("focusfixextextextext")    					               
			end              
		else  
			if SobGroup_GetActualSpeed("focus") > 250 then
				if cinecontatore[7] == 1 then
					r = random (1,2)
				elseif cinecontatore[7] == 0 then
					r = random (3,6)
				else
					r = random (1,6)
				end
				if r == 1 then
					Event_Start("focusspeedmaxfix") 
				elseif r == 2 then
				  Event_Start("focusspeedmaxout") 					
				elseif r == 3 then
					Event_Start("focusfixext")  
				elseif r == 4 then
					Event_Start("focusfixextext")   
				elseif r == 5 then
					Event_Start("focusfixextextext")      				
				else
					Event_Start("focusfixextextextext")      
				end    
			elseif SobGroup_GetActualSpeed("focus") > 169 or 
				 SobGroup_FillProximitySobGroup ("tempcinematic", "productioncapitals", "focus", 1200) == 1 then
				if cinecontatore[7] == 1 then
					r = random (1,2)
				elseif cinecontatore[7] == 0 then
					r = random (3,5)
				else
					r = random (1,5)
				end
				if r == 1 then
					Event_Start("focusspeedfix") 
				elseif r == 2 then
				  Event_Start("focusspeedout")					
				elseif r == 3 then
					Event_Start("focusfixext") 
				elseif r == 4 then
					Event_Start("focusfixextext") 				
				else
					Event_Start("focusfixextextext")         
				end  	  
			else
				if cinecontatore[7] == 1 then
					r = random (1,12)
				elseif cinecontatore[7] == 0 then
					r = random (13,15)
				else
					r = random (1,15)
				end				
				if r == 1 then				  
					Event_Start("focusout")        
				elseif r == 2 then  				  
					Event_Start("focusoutslow") 
				elseif r == 3 then  
					Event_Start("focusoutfast")
        elseif r == 4 then  
					Event_Start("focusin")  
				elseif r == 5 then  
					Event_Start("focusinslow") 
				elseif r == 6 then
				  Event_Start("focusinfast")					
				elseif r == 7 then  
					Event_Start("focusfix")  
				elseif r == 8 then  
					Event_Start("focusfixfar") 
				elseif r == 9 then  
					Event_Start("focusfixfarfar")		
				elseif r == 10 or r == 11 or r == 12 then 				  
					Event_Start("focusalt") 				
				elseif r == 13 then
					Event_Start("focusfixext") 
				elseif r == 14 then
					Event_Start("focusfixextext")  				
				else  
					Event_Start("focusfixextextext")          
				end  
			end
		end	
  end
  Rule_Remove("Cinematic") 	
	Rule_AddInterval("Cinematic", cinecontatore[5])  
  if cinecontatore[4] == 7 then	  
	  cinecontatore[4] = 6
	end		
end

function CinematicControllerStop()  
  UI_UnBindKeyEvent(ESCKEY) 
  UI_UnBindKeyEvent(F1KEY)
  UI_UnBindKeyEvent(F2KEY)
  UI_UnBindKeyEvent(F3KEY)  
	UI_UnBindKeyEvent(F4KEY)  
	UI_UnBindKeyEvent(F5KEY)			
  Rule_Remove("Cinematic")  
  Rule_Remove("Cinematic")	
  Event_Start("stopcinematic")  
	SobGroup_Clear("selectedCinematic") 
	for i = 1,cinecontatore[6],1 do
	  if SobGroup_Empty("selectedCinematic0"..i) == 0 and SobGroup_AreAnyOfTheseTypes("selectedCinematic0"..i, "supporter") == 0 then
		  SobGroup_SobGroupAdd("selectedCinematic", "selectedCinematic0"..i)		
		end
	end
	if SobGroup_Empty("selectedCinematic") == 0 then
    SobGroup_SelectSobGroup("selectedCinematic")      
  elseif SobGroup_Empty("focus") == 0 then
    --SobGroup_SelectSobGroup("focus")  
  else
	  --SobGroup_SelectSobGroup("Player_Ships"..Universe_CurrentPlayer())	
  end 
  --restore default	
  cinecontatore[1] = 0
  cinecontatore[2] = 0
  cinecontatore[3] = 0
  cinecontatore[4] = 5
	cinecontatore[5] = 3
	cinecontatore[6] = 0
  cinecontatore[7] = 2	
	cinecontatore[8] = 1
  SobGroup_Clear("focus")  
	Rule_Remove("CinematicControllerStop") 
end

function caminc() 
  cinecontatore[4] = cinecontatore[4] + 1
	if cinecontatore[4] >= 6 then
		if cinecontatore[4] == 7 then
			UI_PlaySound("SFX_CycleTheFocusFromShipToShip")
		end
    cinecontatore[4] = 0
	end
	if cinecontatore[4] == 5 then
	  Subtitle_Message("Rate Random, F1: Toggle Montage Rate", 3) 
	elseif cinecontatore[4] == 4 then	  
	  Subtitle_Message("Rate X5, F1: Toggle Montage Rate", 3)
	elseif cinecontatore[4] == 3 then	  
	  Subtitle_Message("Rate X4, F1: Toggle Montage Rate", 3)
	elseif cinecontatore[4] == 2 then	  
	  Subtitle_Message("Rate X3, F1: Toggle Montage Rate", 3)
	elseif cinecontatore[4] == 1 then	  
	  Subtitle_Message("Rate X2, F1: Toggle Montage Rate", 3)
  elseif cinecontatore[4] == 0 then	  
	  Subtitle_Message("Rate X1, F1: Toggle Montage Rate", 3) 		
	end 
	Rule_Remove("caminc")
end

function camstop() 
  if cinecontatore[4] == 6 or cinecontatore[4] == 7 then
	  cinecontatore[4] = 7		
	else
		cinecontatore[4] = 6	
		UI_PlaySound("SFX_FocusCycleSystemsOffline")
		Subtitle_Message("Manual Control, F2: Next View", 3)
	end	
	Rule_Remove("camstop")
end

function camfocus() 
  cinecontatore[3] = cinecontatore[3] + 1
	if cinecontatore[3] >= 3 then
    cinecontatore[3] = 0
	end
	if cinecontatore[3] == 0 then
		UI_PlaySound("SFX_CameraToCurrentlySelected")
	  Subtitle_Message("Focus on Selection, F3: Toggle Focal Point", 3) 	
	elseif cinecontatore[3] == 1 then	  
		UI_PlaySound("SFX_CameraToMultipleEnemies")
	  Subtitle_Message("Focus on Enemies, F3: Toggle Focal Point", 3)	
	elseif cinecontatore[3] == 2 then	  
	  UI_PlaySound("SFX_CameraToTheFriendlyAndEnemy")
	  Subtitle_Message("Focus on Random, F3: Toggle Focal Point", 3)	
	end 
	Rule_Remove("camfocus")
end

function camzoom() 
  cinecontatore[7] = cinecontatore[7] + 1
	if cinecontatore[7] >= 3 then
    cinecontatore[7] = 0
	end
	if cinecontatore[7] == 2 then
		UI_PlaySound("SFX_CameraZoomingReleased")
	  Subtitle_Message("Zoom Random, F4: Toggle Zoom Levels", 3) 	
	elseif cinecontatore[7] == 1 then	  
		UI_PlaySound("SFX_CameraZoomAtTwoTimes")
	  Subtitle_Message("Zoom X2, F4: Toggle Zoom Levels", 3)
  elseif cinecontatore[7] == 0 then	  
  	UI_PlaySound("SFX_CameraZoomAtOneTime")
	  Subtitle_Message("Zoom X1, F4: Toggle Zoom Levels", 3)		
	end 
	Rule_Remove("camzoom")
end

function freecontrols() 
  cinecontatore[8] = cinecontatore[8] + 1
	if cinecontatore[8] >= 2 then
    cinecontatore[8] = 0
	end
	if cinecontatore[8] == 1 then
		UI_PlaySound("SFX_UserInterfaceDisabled")
	  Subtitle_Message("Control Blocked, F5: Enable Control", 3) 	
		Camera_AllowControl(0)
		Universe_AllowPlayerOrders(0)				
  elseif cinecontatore[8] == 0 then
  	UI_PlaySound("SFX_ShipsCanBeSelected")
	  Subtitle_Message("Control Free, F5: Disable Control", 3)
		Camera_AllowControl(1)
		Universe_AllowPlayerOrders(1)			
	end	
	Rule_Remove("freecontrols")
end