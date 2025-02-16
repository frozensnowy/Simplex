function transportcell()
  --print("transportcell - Start")
  local playerIndex = 0                             
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then                                                                   
        if Player_GetRace(playerIndex) == Race_Hiigaran then	
          if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation") > 0 then 
            playerIndexList = playerIndex + 1             
                
--blocca, sblocca la costruzione di celle
						local build_limit = 1
						if Player_HasResearch(playerIndex, "crewcellnumber2" ) == 1 then
							build_limit = 4
						elseif Player_HasResearch(playerIndex, "crewcellnumber1" ) == 1 then
							build_limit = 2
						end
	          if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_transportcell") < build_limit * SobGroup_Count("productioncapital"..playerIndex) then
	            if (canbuildtransportcell[playerIndexList] == 1) then
	              Player_RestrictBuildOption(playerIndex, "hgn_transportcell1")
                Player_UnrestrictBuildOption(playerIndex, "hgn_transportcell")			                
	            	canbuildtransportcell[playerIndexList] = 0   
	            end			            
	          else
	            if (canbuildtransportcell[playerIndexList] == 0) then
		            Player_RestrictBuildOption(playerIndex, "hgn_transportcell")
		            Player_UnrestrictBuildOption(playerIndex, "hgn_transportcell1") 
		            canbuildtransportcell[playerIndexList] = 1    
		          end  	            	               	                      
	          end   
		          
		        if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_transportcell") > 0 then  

---calcola ricerche x reclutamento
              if Player_HasResearch(playerIndex, "crewcellcargo3" ) == 1 then
	              pilotrecruiterList[playerIndexList] = 7 + recruiting		
	              officerrecruiterList[playerIndexList] = 3 + (recruiting/2)	                
	            elseif Player_HasResearch(playerIndex, "crewcellcargo2" ) == 1 then
	              pilotrecruiterList[playerIndexList] = 6 + recruiting		
	              officerrecruiterList[playerIndexList] = 2 + (recruiting/2)		                
	            elseif Player_HasResearch(playerIndex, "crewcellcargo1" ) == 1 then
	              pilotrecruiterList[playerIndexList] = 5 + recruiting		
	              officerrecruiterList[playerIndexList] = 1 + (recruiting/2)
	            else
	              pilotrecruiterList[playerIndexList] = 4 + recruiting		
	              officerrecruiterList[playerIndexList] = 1 + (recruiting/2)	  	                
	            end				              
	            if Player_HasResearch(playerIndex, "isai" ) == 1 then
	              pilotrecruiterList[playerIndexList] = floor((pilotrecruiterList[playerIndexList] + recruiting) * 2)		
	              officerrecruiterList[playerIndexList] = floor((officerrecruiterList[playerIndexList] + recruiting) * 2)		               
	            end		
	            
	--setta in base ai settaggi della partita	                   		               		           	         
		          
---casistica per ogni singola cella					           		            
		          for i = 0,(ntc[playerIndexList]-1),1 do   
		            if SobGroup_Empty("splitothers"..playerIndex .. tostring(i)) == 0 then	      
			              
			            if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then
		              
	---se cella ? dockata: se in CS verifica se ? necessario lanciare o meno in base a pilot/officer max; se in Prod. Cap. allora arruola e poi lancia			              
			              if SobGroup_IsDocked("splitothers"..playerIndex .. tostring(i)) == 1 then
			                if SobGroup_IsDockedSobGroup("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex) == 1 and SobGroup_Count("productioncapital"..playerIndex) > 0 then
				                if (pilotrecruitList[playerIndexList] < pilotmaxList[playerIndexList] or
				                 officerrecruitList[playerIndexList] < officermaxList[playerIndexList]) and 
				                 --(SobGroup_GetDistanceToSobGroup("splitothers"..playerIndex .. tostring(i), "splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)])) < 15000) and 
				                 (SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "hgn_orders_recruit") == 0) and 
				                 (SobGroup_IsDocked("hgn_crewstation"..playerIndex) == 0) then
					                SobGroup_Launch_Smart("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex)  
					              end  
					            else	  			            
						            for z = 0,(npc[playerIndexList]-1),1 do	
			                    if SobGroup_IsDockedSobGroup("splitothers"..playerIndex .. tostring(i), "splitproductioncapital"..playerIndex .. tostring(z)) == 1 then	
			---reclutamento piloti				            
								            if pilotrecruitList[playerIndexList] < pilotmaxList[playerIndexList] then	              				              				                 
								              pilotrecruitList[playerIndexList] = pilotrecruitList[playerIndexList] + pilotrecruiterList[playerIndexList]				              
				                  	else
				                  	  pilotrecruitList[playerIndexList] = pilotmaxList[playerIndexList]                   	              
								            end
			---reclutamento ufficiali				            
								            if officerrecruitList[playerIndexList] < officermaxList[playerIndexList] then			             				                          
								              officerrecruitList[playerIndexList] = officerrecruitList[playerIndexList] + officerrecruiterList[playerIndexList]
				                  	else                  	  
				                  	  officerrecruitList[playerIndexList] = officermaxList[playerIndexList]   			            
								            end  					                    		                      
			                      SobGroup_Launch_Smart("splitothers"..playerIndex .. tostring(i), "splitproductioncapital"..playerIndex .. tostring(z))				                     
			                      break
			                    end  
			                  end        					            				              
					            end		              
					            
			              elseif SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "hgn_orders_recruit") > 0 then
			                SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex)
					            
			              elseif SobGroup_FillProximitySobGroup ("temp", "hgn_crewstation"..playerIndex, "splitothers"..playerIndex .. tostring(i), 15000) == 0 then
			                SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex)
			                
				            elseif SobGroup_Count("productioncapital"..playerIndex) == 0 then
					            SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex)  				
					            					              
					          elseif SobGroup_IsDoingAbility("splitothers"..playerIndex .. tostring(i), abilityList[9]) == 1 then
					          elseif SobGroup_IsDoingAbility("splitothers"..playerIndex .. tostring(i), abilityList[6]) == 1 then
					          elseif SobGroup_IsDoingAbility("splitothers"..playerIndex .. tostring(i), abilityList[4]) == 1 and SobGroup_FillProximitySobGroup ("temp", "hgn_crewstation"..playerIndex, "splitothers"..playerIndex .. tostring(i), 300) == 0 then
					           	SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex)			          
					          else		            
					            if SobGroup_FillProximitySobGroup ("temp", "hgn_crewstation"..playerIndex, "splitothers"..playerIndex .. tostring(i), 300) == 1 then							            
					              if SobGroup_Empty("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)])) == 0 then    
					                --caso in cui la MS ? dockata o sta dockando
					                if SobGroup_AreAnyOfTheseTypes("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)]), "hgn_mothership") == 1 and
					                   SobGroup_GetDistanceToSobGroup("splitothers"..playerIndex .. tostring(i), "splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)])) < 15000 and
					                   (SobGroup_IsDocked("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)])) == 1 or SobGroup_IsDoingAbility("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)]), abilityList[9]) == 1) then        
					                  if SobGroup_Empty("hgn_shipyard_g"..playerIndex) == 0 then --ci deve andare il gujking
					                    SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "hgn_shipyard_g"..playerIndex)
					                  else					                    
					                  end  
						              elseif SobGroup_IsDoingAbility("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)]), abilityList[9]) == 0 and	
						                 SobGroup_IsDoingAbility("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)]), abilityList[6]) == 0 and	   
						                 --SobGroup_IsDoingAbility("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)]), abilityList[11]) == 0 and
						                 SobGroup_IsDocked("splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)])) == 0 and              
						                 SobGroup_GetDistanceToSobGroup("splitothers"..playerIndex .. tostring(i), "splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)])) < 15000 then 				                 
						                SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "splitproductioncapital"..playerIndex .. tostring(casualizzatore[SobGroup_Count("productioncapital"..playerIndex)]))                     				              
						              else  
						              end 
						            end			              
					            else  
				             	  SobGroup_DockSobGroupAndStayDocked_Smart("splitothers"..playerIndex .. tostring(i), "hgn_crewstation"..playerIndex)	        			              		              
					            end            
					          end							                   
					        end  	
					        
			          end                           
		          end 	              		
	--auto reclutamento se senza celle 1 volta l'anno	          
		        elseif gametime < 5 then  
		          pilotrecruitList[playerIndexList] = pilotrecruitList[playerIndexList] + 2
		        end       		        
		      else
		        SobGroup_TakeDamage("hgn_transportcell"..playerIndex, 1)
		      end 		          
        end               
      end   
    end
    playerIndex = playerIndex + 1 
	end
  --print("transportcell - End")
end