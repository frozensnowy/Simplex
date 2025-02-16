function keeppositiononpassive()
  keeppositiononpassiveExecute(nd, "splitdestroyers", 0.055, 100)
  keeppositiononpassiveExecute(nbc, "splitbattlecruisers", 0.055, 100)
  keeppositiononpassiveExecute(nj, "splitjuggernaughts", 0.07, 75)
  keeppositiononpassiveExecute(nf, "splitfrigates", 0.05, 125)  
end  
  
function keeppositiononpassiveExecute(number, Group, value, frenata)  
  if number > 0 then
	  for i = 0,number-1,1 do  
	    if SobGroup_Empty(Group..i) == 0	then          
	      if SobGroup_GetTactics(Group..i) == 2 then  	   	
	        if SobGroup_IsDoingAbility(Group..i, abilityList[2]) == 1 and SobGroup_IsDoingAbility(Group..i, abilityList[14]) == 1 then 
	          if ((SobGroup_GetHardPointHealth(Group..i, "Distance")*1000000) - SobGroup_GetDistanceToSobGroup(Group..i, "splitter") ~= 0) and
	             ((SobGroup_GetHardPointHealth(Group..i, "Distance")*1000000) - SobGroup_GetDistanceToSobGroup(Group..i, "splitter") < frenata) then   
		          SobGroup_SetHardPointHealth(Group..i, "Position", value)  
		        else
		          SobGroup_SetHardPointHealth(Group..i, "Position", 1)      
		        end 
		        SobGroup_SetHardPointHealth(Group..i, "Distance", (SobGroup_GetDistanceToSobGroup(Group..i, "splitter")/1000000))    
		      else
		        SobGroup_SetHardPointHealth(Group..i, "Position", 1)      
	        end	
	      else
	        SobGroup_SetHardPointHealth(Group..i, "Position", 1)  	            			
	      end	     
	    end		       
	  end             
  end	                                 
end
