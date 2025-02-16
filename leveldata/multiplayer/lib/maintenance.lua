function maintenance()
---initialize
  for i = 1,6,1 do
    maintenanceList[i] = 0
  end
---SUBSYSTEMS
---Mothership  
  for i = 0,nms-1,1 do                                             
    if SobGroup_Empty("splitmotherships"..i) == 0 then      
      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then       
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 1") > 0 then     
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 10         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 20          
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 40         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 4") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 90         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50          
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50          
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50        
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 4") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50          
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 120       
	      end	      
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "pds") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 240       
	      end 	        
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 150       
	      end 	          
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 60       
	      end   
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 7") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 40       
	      end                
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Sensors 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 5      
	      end   
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "poh2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 300      
	      end   
	    elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "vgr_mothership") == 1 then    
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 1") > 0 then     
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 10         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 20         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 40      
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 4") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 90         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50        
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50        
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50    
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 4") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50    
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 80     
	      end  	                   
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Sensors1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 5     
	      end   
				if SobGroup_GetHardPointHealth("splitmotherships"..i, "c") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitmotherships"..i) + 1] + 50     
	      end   
	    end  	               
    end
  end      
---Research Station	 
  if nrs > 0 then
	  for i = 0,nrs-1,1 do                                             
	    if SobGroup_Empty("splitresearchstations"..i) == 0 then      
	      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "Generic 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitresearchstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitresearchstations"..i) + 1] + 50        
	      end  
	      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "Generic 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitresearchstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitresearchstations"..i) + 1] + 100      
	      end  
	      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "Generic 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitresearchstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitresearchstations"..i) + 1] + 150
	      end       
	    end
	  end  
  end   
---Power Station	 
  if nps > 0 then
	  for i = 0,nps-1,1 do                                             
	    if SobGroup_Empty("splitpowerstations"..i) == 0 then  
	      for z = 1,10,1 do    
		      if SobGroup_GetHardPointHealth("splitpowerstations"..i, "p"..z) > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitpowerstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitpowerstations"..i) + 1] + 100        
		      end  
		    end  
		    if SobGroup_GetHardPointHealth("splitpowerstations"..i, "Hardpoint_sub") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitpowerstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitpowerstations"..i) + 1] + 120      
	      end 	      
	    end
	  end  
  end         
---Crew Station	   
  if ncs > 0 then
	  for i = 0,ncs-1,1 do                                             
	    if SobGroup_Empty("splitcrewstations"..i) == 0 then      
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 7") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 8") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75   
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 9") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 10") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 11") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75
	      end 	          
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 1") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 50   
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 2") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 50             
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 3") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 50        
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 4") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 50  
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 5") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 50   
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 6") > 0 then   
	        maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 50        
	      end       
	    end
	  end  
  end  
---Weapon Station	   
  --if nws > 0 then
	  --for i = 0,nws-1,1 do                                             
	    --if SobGroup_Empty("splitweaponstations"..i) == 0 then      
	      --if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 7") > 0 then   
	        --maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75
	      --end  
	      --if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 8") > 0 then   
	        --maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcrewstations"..i) + 1] + 75   
	      --end  	      
	    --end
	  --end  
  --end                                            
---Carrier / LightCarrier	
  if nc > 0 then
	  for i = 0,nc-1,1 do                                             
	    if SobGroup_Empty("splitcarriers"..i) == 0 then       
	      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_lightcarrier") == 1 then 	        
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 10             
		      end  
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 20           
		      end  	            
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50              
		      end  	            
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 5           
		      end  		       
	      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_carrier") == 1 then
			    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 10                  
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 20             
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40               
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50              
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50                   
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 5                   
	        end 	      
	      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_battlecarrier") == 1 then
			    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 10                  
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 20             
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40               
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 5") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 90               
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50              
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50                   
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50                   
	        end
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 5                   
	        end 	         	    	        
	      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_scaver,vgr_scaver") == 1 then
			    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50                  
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Harvest") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50             
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40               
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40              
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40                   
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply4") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40                   
	        end  	      
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply5") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 40                   
	        end  	      
			  elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_carrier") == 1 then	    
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 20           
		      end  	              
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50                  
		      end  	      
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50            
	        end        
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 5            
		      end  	
        elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_battlecarrier") == 1 then	    
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 20           
		      end  	              
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50                  
		      end  	      
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 50            
	        end        
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcarriers"..i) + 1] + 5            
		      end  	       					
			  end 	    	       
			end  
    end
  end       
---Shipyard	  
  if nsy > 0 then
	  for i = 0,nsy-1,1 do                                             
	    if SobGroup_Empty("splitshipyards"..i) == 0 then      
	      if SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard, hgn_shipyard_elohim") == 1 then       
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 10                   
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 20        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 40    
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 90     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50 
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50       
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50         
		      end  	               
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 5         
		      end 
        elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_battleshipyard") == 1 then       
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 10                   
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 20        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 40    
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 90     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50 
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50       
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50         
		      end  	               
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 5         
		      end			
          if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 5         
		      end 					
        elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard_g") == 1 then       
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 10                   
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 20        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 40    
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 90     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50 
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50       
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50         
		      end  	               
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 5         
		      end   
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "bc") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 300         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "gcb") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 200         
		      end  
		      --if SobGroup_GetHardPointHealth("splitshipyards"..i, "bs1") > 0 then   
		        --maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 300         
		      --end   					
		    elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "vgr_shipyard") == 1 then    
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 10      
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 20      
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 40        
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 90     
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50  
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50       
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50     
		      end  	        
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50   
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 50        
		      end  	                   
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitshipyards"..i) + 1] + 5      
		      end   
		    end  	                
	    end
	  end  
  end          
---Command Fortress	 
  if ncf > 0 then 
	  for i = 0,ncf-1,1 do                                             
	    if SobGroup_Empty("splitcommandfortresses"..i) == 0 then      
	      if SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_commandfortress") == 1 then       
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Production 1") > 0 then     
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 100                   
		      end  
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 150        
		      end  
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 23") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 50    
		      end  
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 2") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 120     
		      end  
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 17") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 90        
		      end  	
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 31") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 120        
		      end 
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "pds") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 240        
		      end  	 	
		    else
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Production 1") > 0 then     
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 100                   
		      end  
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Generic 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 150        
		      end  
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 1") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 120    
		      end
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 17") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 90    
		      end
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 26") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 120    
		      end 
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 32") > 0 then   
		        maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitcommandfortresses"..i) + 1] + 150    
		      end                        
		    end  	                
	    end
	  end  
  end          
---Battlecruiser
	if nbc > 0 then
	  for i = 0,nbc-1,1 do                                             
	    if SobGroup_Empty("splitbattlecruisers"..i) == 0 then      
	      if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battlecruiser, hgn_battlecruiserNUKE") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15               
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 60            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10              
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon Rail Beam Back") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10             
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5             
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5                
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                   
	        end  	
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battleship") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15               
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 60            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes Rear") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 60            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10              
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10             
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5             
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5                
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                   
	        end  	                  
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_vortex") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5               
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 5           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15           
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 3") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15              
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 4") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15             
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Miner 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15             
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Miner 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15                
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50           
	        end  	          
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_tanker") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "w1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 75            
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "w2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 75           
	        end			                	        	        
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end            
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Front Heavy Cannons") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 60              
	        end 	        
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 20              
	        end 
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 20              
	        end 	  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "freaker") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 30              
	        end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser_hero") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_missilebattlecruiser") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end   	               
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "top") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50              
	        end 	
          if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "top1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50              
	        end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_alkhalid") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortBowA") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10                  
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortBowB") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10               
	        end            
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdBowA") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10                
	        end   
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdBowB") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 10                   
	        end     
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortMidDsl") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15               
	        end 	                
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortMidVtl") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15                   
	        end   
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdMidDsl") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15               
	        end     
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdMidVtl") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 15                
	        end  	            
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdAft") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 20                 
	        end   
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortAft") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 20                   
	        end     
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "VtlMidB") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 20              
	        end
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_sinner") == 1 then  
	        for x=1,6,1 do
		        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon_"..x.."z") > 0 then
		          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 20
		        end
		      end
		      for x=1,4,1 do
		        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon_m"..x) > 0 then
		          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50
		        end
		      end
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic") > 0 then   
	          maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] = maintenanceList[SobGroup_OwnedBy("splitbattlecruisers"..i) + 1] + 50                    
	        end
	      end  	          
	    end  
    end    
  end   
---SHIPS     
  local playerIndex = 0             
  local playerIndexList = 0        
  while playerIndex < Universe_PlayerCount() do
    playerIndexList = playerIndex + 1
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then
        maintenanceList[playerIndexList] = floor((maintenanceList[playerIndexList]) +
                                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scout" ) * 5) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptor" ) * 7) +   
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomber" ) * 8) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defender" ) * 7) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lbomber" ) * 7) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_railgunfighter" ) * 8) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hft" ) * 9) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberheavy" ) * 10) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_strategicbomber" ) * 90) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_interceptorl" ) * 7) +   
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberl" ) * 8) +								                                 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lbomberl" ) * 7) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_railgunfighterl" ) * 8) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hftl" ) * 9) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_attackbomberheavyl" ) * 10) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_strategicbomberl" ) * 90) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvette" ) * 11) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarcorvette" ) * 12) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_bombervette" ) * 13) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedocorvette" ) * 13) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_minelayercorvette" ) * 6) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_multiguncorvette" ) * 16) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_gunshipcoevette" ) * 17) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cth" ) * 18) +   
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthion" ) * 18) +  								                                 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultcorvettel" ) * 11) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarcorvettel" ) * 12) +		
                                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_bombervettel" ) * 13) +  																								 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedocorvettel" ) * 13) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_multiguncorvettel" ) * 16) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_gunshipcoevette" ) * 17) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthl" ) * 18) +   
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cthionl" ) * 18) +   								                                 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_assaultfrigate" ) * 12) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_torpedofrigate" ) * 12) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lrms" ) * 14) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_marinefrigate" ) * 16) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defensefieldfrigate" ) * 18) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ioncannonfrigate" ) * 20) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tulwar" ) * 24) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership" ) * 200) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_destroyer" ) * 55) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sweeperdestroyer" ) * 55) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missiledestroyer" ) * 65) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_iondestroyer" ) * 65) +  								                                 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_advdestroyer" ) * 75) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerydestroyer" ) * 75) +   
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruisera" ) * 85) +   
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_cruiserb" ) * 85) +    
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_juggernaught" ) * 85) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hammerhead" ) * 85) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_carrier" ) * 100) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_spacecarrier" ) * 100) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_scaver" ) * 100) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_lightcarrier" ) * 50) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_researchstation" ) * 75) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_combatbase" ) * 300) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_power" ) * 250) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_crewstation" ) * 90) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_hyperspacestation" ) * 90) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard" ) * 150) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_shipyard_g" ) * 250) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battleshipyard" ) * 250) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_commandfortress" ) * 250) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ark" ) * 250) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecruiser" ) * 125) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_battlecruiserNUKE" ) * 525) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_tanker" ) * 75) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_gunturret" ) * 2) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_defensefieldturret" ) * 10) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_pulsarturret" ) * 4) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionturret" ) * 6) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_missileturret" ) * 8) +  
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_rts" ) * 10) +  			
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_sentinel" ) * 30) + 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_artillerysentinel" ) * 30) +  			
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_ionsentinel" ) * 30) +  			
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_massiveturret" ) * 12) +  									                                 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecollector" ) * 4) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_resourcecontroller" ) * 8) +
                                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scout" ) * 5) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_interceptor" ) * 7) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lancefighter" ) * 7) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavyfighter" ) * 11) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilebomber" ) * 12) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_elitefighter" ) * 13) + 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_bomber" ) * 8) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_defender" ) * 9) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missilecorvette" ) * 11) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lasercorvette" ) * 12) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_plasmacorvette" ) * 12) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_minelayercorvette" ) * 6) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandcorvette" ) * 8) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_standvette" ) * 13) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_multilancecorvette" ) * 14) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_striker" ) * 15) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mortarcorvette" ) * 15) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavymissilefrigate" ) * 12) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_assaultfrigate" ) * 12) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_advassaultfrigate" ) * 14) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_infiltratorfrigate" ) * 15) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigate" ) * 15) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigate_laser" ) * 15) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_supportfrigatearmed" ) * 15) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryfrigate" ) * 17) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_longrangeartilleryfrigate" ) * 20) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_empfrigate" ) * 18) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfrigate" ) * 19) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership" ) * 200) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_destroyer" ) * 55) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_pulsedestroyer" ) * 75) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_am" ) * 55) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruiser" ) * 100) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lightcruiser" ) * 100) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_lightcruiser_gun" ) * 100) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_artilleryship" ) * 100) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_scaver" ) * 100) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_carrier" ) * 100) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_shipyard" ) * 150) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecruiser" ) * 125) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battlecruiser_hero" ) * 525) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_heavycruiser" ) * 135) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_sinner" ) * 100) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_alkhalid" ) * 150) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaught" ) * 175) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_dreadnaughtB" ) * 175) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_tmatship" ) * 240) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_commandfortress" ) * 250) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_battleship" ) * 250) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_missledreadnaught" ) * 350) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_superbattleship" ) * 400) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "Vgr_ArtilleryBattlecruiser" ) * 500) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_gun" ) * 2) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_lance" ) * 2) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_weaponplatform_missile" ) * 4) +									                                 
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mobile_inhibitor" ) * 10) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cloakplatform" ) * 10) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_hyperspace_platform" ) * 5) +
								                                 --(Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_cruse" ) * 10) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecollector" ) * 4) +
																								 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecontrollerdouble" ) * 12) +
								                                 (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_resourcecontroller" ) * 8))          
        --Maintenance cost for Kadeshi and Raider is randomly based on crew list
        if Player_GetRace(playerIndex) == Race_Kadeshi or Player_GetRace(playerIndex) == Race_Raider then
        	maintenanceList[playerIndexList] = floor(pilotpopList[playerIndexList] * random_pseudo(7,13) + officerpopList[playerIndexList] * random_pseudo(103,177))
        end
        --Keeper new function
      	for z, iCount in ship_list.kpr do
      		if iCount.maintenance ~= nil then
      			local shipname = iCount.name
						local shipmaint = iCount.maintenance
						maintenanceList[playerIndexList] = floor((maintenanceList[playerIndexList]) + (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, shipname ) * shipmaint))
					end
				end
        --ships from crates
      	for z, iCount in ship_list.meg do
      		if iCount.maintenance ~= nil then
      			local shipname = iCount.name
						local shipmaint = iCount.maintenance
						maintenanceList[playerIndexList] = floor((maintenanceList[playerIndexList]) + (Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, shipname ) * shipmaint))
					end
				end

---Research                                                 
        if Player_HasResearch(playerIndex, "maintenance3" ) == 1 then
          maintenanceList[playerIndexList] = floor (maintenanceList[playerIndexList] * 0.4)
        elseif Player_HasResearch(playerIndex, "maintenance2" ) == 1 then
          maintenanceList[playerIndexList] = floor (maintenanceList[playerIndexList] * 0.6)
        elseif Player_HasResearch(playerIndex, "maintenance1" ) == 1 then
          maintenanceList[playerIndexList] = floor (maintenanceList[playerIndexList] * 0.8)
        end     
---Display           
        if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<35) or year>0) then
          UI_SetTextLabelText("ResourceMenu", "lblMaintenance", ""..maintenanceList[playerIndexList]);                  
          UI_SetTextLabelText("UnitCapInfoPopup", "lblMaintenance", ""..maintenanceList[playerIndexList]);                 
        end  
      end
    end
    playerIndex = playerIndex + 1
  end      
end   