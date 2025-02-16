function weight()
---Mothership  
  for i = 0,nms-1,1 do                                             
    if SobGroup_Empty("splitmotherships"..i) == 0 then
      local weight = 0
      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then       
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 1") > 0 then     
	        weight = weight + 0.02         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 2") > 0 then   
	        weight = weight + 0.03         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 3") > 0 then   
	        weight = weight + 0.04         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 4") > 0 then   
	        weight = weight + 0.07         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 1") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 2") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 3") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 4") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then   
	        weight = weight + 0.04         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") > 0 then   
	        weight = weight + 0.1         
	      end 	          
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 3") > 0 then   
	        weight = weight + 0.08         
	      end   
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 7") > 0 then   
	        weight = weight + 0.06         
	      end                
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Sensors 1") > 0 then   
	        weight = weight + 0.01         
	      end 
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "poh2") > 0 then   
	        weight = weight + 0.15         
	      end     
	    elseif SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "vgr_mothership") == 1 then    
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 1") > 0 then     
	        weight = weight + 0.02         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 2") > 0 then   
	        weight = weight + 0.03         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 3") > 0 then   
	        weight = weight + 0.04         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Production 4") > 0 then   
	        weight = weight + 0.07         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 1") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 2") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 3") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Generic 4") > 0 then   
	        weight = weight + 0.05         
	      end  
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then   
	        weight = weight + 0.1         
	      end  	                   
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Sensors1") > 0 then   
	        weight = weight + 0.01         
	      end   
	    end  	          
      SobGroup_SetHardPointHealth("splitmotherships"..i, "Weight", (1 - weight))  
    end
  end      
---Research Station	 
  if nrs > 0 then
	  for i = 0,nrs-1,1 do                                             
	    if SobGroup_Empty("splitresearchstations"..i) == 0 then
	      local weight = 0
	      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "Generic 1") > 0 then   
	        weight = weight + 0.1       
	      end  
	      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "Generic 2") > 0 then   
	        weight = weight + 0.2         
	      end  
	      if SobGroup_GetHardPointHealth("splitresearchstations"..i, "Generic 3") > 0 then   
	        weight = weight + 0.3    
	      end 
	      SobGroup_SetHardPointHealth("splitresearchstations"..i, "Weight", (1 - weight))  
	    end
	  end  
  end     
---Power Station	 
  if nps > 0 then
	  for i = 0,nps-1,1 do                                             
	    if SobGroup_Empty("splitpowerstations"..i) == 0 then  
	      local weight = 0
	      for z = 1,10,1 do  	        
		      if SobGroup_GetHardPointHealth("splitpowerstations"..i, "p"..z) > 0 then   
		        weight = weight + 0.05
		      end  
		    end  	
		    SobGroup_SetHardPointHealth("splitpowerstations"..i, "Weight", (1 - weight))        
	    end
	  end  
  end      
---Weapon Station	   
  if nws > 0 then
	  for i = 0,nws-1,1 do                                             
	    if SobGroup_Empty("splitweaponstations"..i) == 0 then    
	      local weight = 0  
	      if SobGroup_GetHardPointHealth("splitweaponstations"..i, "up") > 0 then   
	        weight = weight + 0.03
	      end  
	      if SobGroup_GetHardPointHealth("splitweaponstations"..i, "down") > 0 then   
	        weight = weight + 0.03
	      end  
	      SobGroup_SetHardPointHealth("splitweaponstations"..i, "Weight", (1 - weight))	      
	    end	    
	  end  
  end                
---Crew Station	
  if ncs > 0 then   
	  for i = 0,ncs-1,1 do                                             
	    if SobGroup_Empty("splitcrewstations"..i) == 0 then
	      local weight = 0
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 7") > 0 then   
	        weight = weight + 0.05     
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 8") > 0 then   
	        weight = weight + 0.05      
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 9") > 0 then   
	        weight = weight + 0.05      
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 10") > 0 then   
	        weight = weight + 0.05 
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 11") > 0 then   
	        weight = weight + 0.05     
	      end 	          
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 1") > 0 then   
	        weight = weight + 0.06         
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 2") > 0 then   
	        weight = weight + 0.06                
	      end  
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 3") > 0 then   
	        weight = weight + 0.06           
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 4") > 0 then   
	        weight = weight + 0.06        
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 5") > 0 then   
	        weight = weight + 0.06        
	      end 
	      if SobGroup_GetHardPointHealth("splitcrewstations"..i, "Generic 6") > 0 then   
	        weight = weight + 0.06        
	      end 
	      SobGroup_SetHardPointHealth("splitcrewstations"..i, "Weight", (1 - weight))  
	    end
	  end  
  end                      
---Carrier / LightCarrier	
  if nc > 0 then
	  for i = 0,nc-1,1 do                                             
	    if SobGroup_Empty("splitcarriers"..i) == 0 then
	      local weight = 0        
	      if SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_lightcarrier") == 1 then 	        
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
		        weight = weight + 0.02         
		      end  
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 2") > 0 then   
		        weight = weight + 0.03         
		      end  	            
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  	            
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors 1") > 0 then   
		        weight = weight + 0.01         
		      end  		       
	      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_carrier") == 1 then
			    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 2") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 3") > 0 then   
	          weight = weight + 0.04         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors 1") > 0 then   
	          weight = weight + 0.01         
	        end  	
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "supply") > 0 then   
	          weight = weight + 0.07         
	        end  		        
	      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_battlecarrier") == 1 then
			    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 2") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 3") > 0 then   
	          weight = weight + 0.04         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 5") > 0 then   
	          weight = weight + 0.08         
	        end 
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 3") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors 1") > 0 then   
	          weight = weight + 0.01         
	        end  	
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "supply") > 0 then   
	          weight = weight + 0.07         
	        end  	  	        
	      elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "hgn_scaver,vgr_scaver") == 1 then
			    if SobGroup_GetHardPointHealth("splitcarriers"..i, "Fusion") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Harvest") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply1") > 0 then   
	          weight = weight + 0.075         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply2") > 0 then   
	          weight = weight + 0.075         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply3") > 0 then   
	          weight = weight + 0.075         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply4") > 0 then   
	          weight = weight + 0.075         
	        end  
	        if SobGroup_GetHardPointHealth("splitcarriers"..i, "Supply5") > 0 then   
	          weight = weight + 0.075         
	        end  	         	          
			  elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_carrier") == 1 then	    
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
		        weight = weight + 0.025         
		      end  	              
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  	      
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end        
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors1") > 0 then   
		        weight = weight + 0.01         
		      end  	
        elseif SobGroup_AreAnyOfTheseTypes("splitcarriers"..i, "vgr_battlecarrier") == 1 then	    
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Production 1") > 0 then   
		        weight = weight + 0.025         
		      end  	              
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  	      
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end        
		      if SobGroup_GetHardPointHealth("splitcarriers"..i, "Sensors1") > 0 then   
		        weight = weight + 0.01         
		      end  	      					
			  end 
		    SobGroup_SetHardPointHealth("splitcarriers"..i, "Weight", (1 - weight)) 			       
	    end
	  end  
  end       
---Shipyard	  
  if nsy > 0 then
	  for i = 0,nsy-1,1 do                                             
	    if SobGroup_Empty("splitshipyards"..i) == 0 then
	      local weight = 0
	      if SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard, hgn_shipyard_elohim") == 1 then	           
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        weight = weight + 0.02         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        weight = weight + 0.03         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        weight = weight + 0.04         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        weight = weight + 0.07         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        weight = weight + 0.05         
		      end  	               
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 1") > 0 then   
		        weight = weight + 0.01         
		      end 	
        elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_battleshipyard") == 1 then	           
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        weight = weight + 0.02         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        weight = weight + 0.03         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        weight = weight + 0.04         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        weight = weight + 0.07         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        weight = weight + 0.05         
		      end  	               
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 1") > 0 then   
		        weight = weight + 0.01         
		      end 
          if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 2") > 0 then   
		        weight = weight + 0.01         
		      end  					
        elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "hgn_shipyard_g") == 1 then	           
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        weight = weight + 0.02         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        weight = weight + 0.03         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        weight = weight + 0.04         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        weight = weight + 0.07         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        weight = weight + 0.05         
		      end  	               
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors 1") > 0 then   
		        weight = weight + 0.01         
		      end 
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "bc") > 0 then   
		        weight = weight + 0.1         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "gcb") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "sb1") > 0 then   
		        weight = weight + 0.04         
		      end           					
		    elseif SobGroup_AreAnyOfTheseTypes("splitshipyards"..i, "vgr_shipyard") == 1 then    
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 1") > 0 then     
		        weight = weight + 0.02         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 2") > 0 then   
		        weight = weight + 0.03         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 3") > 0 then   
		        weight = weight + 0.04         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Production 4") > 0 then   
		        weight = weight + 0.07         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 1") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 2") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 3") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 4") > 0 then   
		        weight = weight + 0.05         
		      end  	        
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 5") > 0 then   
		        weight = weight + 0.05         
		      end  
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Generic 6") > 0 then   
		        weight = weight + 0.05         
		      end  	                   
		      if SobGroup_GetHardPointHealth("splitshipyards"..i, "Sensors1") > 0 then   
		        weight = weight + 0.01         
		      end   
		    end  	          
	      SobGroup_SetHardPointHealth("splitshipyards"..i, "Weight", (1 - weight))  
	    end
	  end  
  end              
---Battlecruiser	
  if nbc > 0 then
	  for i = 0,nbc-1,1 do                                             
	    if SobGroup_Empty("splitbattlecruisers"..i) == 0 then
	      local weight = 0
	      if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battlecruiser, hgn_battlecruiserNUKE") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes") > 0 then   
	          weight = weight + 0.04         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon Rail Beam Back") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end  	      
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_vortex") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Miner 1") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Miner 2") > 0 then   
	          weight = weight + 0.03         
	        end  		                
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 1") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 2") > 0 then   
	          weight = weight + 0.02         
	        end  	  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 3") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Torpedo 4") > 0 then   
	          weight = weight + 0.02         
	        end  	        
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2") > 0 then   
	          weight = weight + 0.015         
	        end  	        
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  		        
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_battleship") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 1") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon IonBeam 2") > 0 then   
	          weight = weight + 0.03         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes") > 0 then   
	          weight = weight + 0.04         
	        end
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Heavy Guided Plazma Bomb Tubes Rear") > 0 then   
	          weight = weight + 0.04         
	        end    
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 1") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 2") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "RailBeam 3") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 1") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 2") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Rapid Turret 3") > 0 then   
	          weight = weight + 0.015         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end  	      
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_tanker") == 1 then       
		      if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "w1") > 0 then   
	          weight = weight + 0.08         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "w2") > 0 then   
	          weight = weight + 0.08         
	        end         	                  
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end            
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Front Heavy Cannons") > 0 then   
	          weight = weight + 0.09         
	        end 	        
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon 1") > 0 then   
	          weight = weight + 0.05         
	        end 
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon 2") > 0 then   
	          weight = weight + 0.05         
	        end 
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "freaker") > 0 then   
	          weight = weight + 0.05         
	        end 
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_battlecruiser_hero") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_missilebattlecruiser") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 2") > 0 then   
	          weight = weight + 0.05         
	        end 	        
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "top") > 0 then   
	          weight = weight + 0.05         
	        end 	
					if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "top1") > 0 then   
	          weight = weight + 0.05         
	        end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_sinner") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic") > 0 then   
	          weight = weight + 0.05         
	        end  
	        for x=1,6,1 do
		        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon_"..x.."z") > 0 then
		          weight = weight + 0.04
		        end
		      end
		      for x=1,4,1 do
		        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Weapon_m"..x) > 0 then
		          weight = weight + 0.05
		        end
		      end
	      elseif SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "vgr_alkhalid") == 1 then  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortBowA") > 0 then   
	          weight = weight + 0.02         
	        end  
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortBowB") > 0 then   
	          weight = weight + 0.02        
	        end            
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdBowA") > 0 then   
	          weight = weight + 0.02        
	        end   
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdBowB") > 0 then   
	          weight = weight + 0.02         
	        end     
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortMidDsl") > 0 then   
	          weight = weight + 0.02         
	        end 	                
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortMidVtl") > 0 then   
	          weight = weight + 0.02         
	        end   
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdMidDsl") > 0 then   
	          weight = weight + 0.02         
	        end     
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdMidVtl") > 0 then   
	          weight = weight + 0.02         
	        end  	            
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "StbdAft") > 0 then   
	          weight = weight + 0.04         
	        end   
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "PortAft") > 0 then   
	          weight = weight + 0.04         
	        end     
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "VtlMidB") > 0 then   
	          weight = weight + 0.04         
	        end 
	        if SobGroup_GetHardPointHealth("splitbattlecruisers"..i, "Generic 1") > 0 then   
	          weight = weight + 0.05         
	        end
	      end  	   
	      SobGroup_SetHardPointHealth_Smart("splitbattlecruisers"..i, "Weight", (1 - weight))  
	    end    
	  end  
	end      
end   