aitrace("LOADING CPU MILITARY")
function CpuMilitary_Init()
	cp_attackPercent = 100
	if (g_LOD == 0) then
	  cp_attackPercent = 60
	end	
	cp_initThreatModifier = 0.5	
	if (g_LOD == 0) then
	  cp_initThreatModifier = 0.25
	elseif (g_LOD == 1) then
	  cp_initThreatModifier = 0.35
	end		
	sg_militaryRand = Rand(100)	
	if (Override_MilitaryInit) then
	  Override_MilitaryInit()
	end	
end
function CpuMilitary_Process()		
	Logic_military_groupvars();	
	Logic_military_attackrules();		
	Logic_military_setattacktimer();		
end
function Logic_military_groupvars()  
	local rank = (NumSubSystems(ISLIEUTENANT) + NumSubSystems(ISCOMMANDER) + NumSubSystems(ISCAPTAIN) + NumSubSystems(ISCOMMODORE) + NumSubSystems(ISADMIRAL) + NumSubSystems(ISFLEETADMIRAL))  	
	local military = 1	
---max	
	if NumSubSystems(MILITARY2) >= 1 then	 
	  military = 0.6
		cp_initThreatModifier = cp_initThreatModifier - 0.1	
--high			 
	elseif NumSubSystems(MILITARY1) >= 1 then	 
	  military = 0.8
		cp_initThreatModifier = cp_initThreatModifier - 0.1			  	
---few			  
	elseif NumSubSystems(MILITARY) >= 1 then	  
	  military = 1.45
	  cp_initThreatModifier = cp_initThreatModifier - 0.1
---none	  
	elseif NumSubSystems(MILITARY0) >= 1 then	  
	  military = 1.85
	  cp_initThreatModifier = cp_initThreatModifier - 0.1  
	end		
	cp_minSquadGroupSize = floor((4+(rank*2)+g_LOD)*military)
	cp_minSquadGroupValue = floor((160+(rank*100))*military)
	cp_maxGroupSize = floor((11+(rank*2)+g_LOD)*military)
	cp_maxGroupValue = floor((160+(rank*100))*military)
	cp_forceAttackGroupSize = floor((8+(rank*2)+g_LOD*2)*military)	
end
function Logic_military_attackrules()			
	if (g_LOD == 0) then		
		if (gameTime() > 20*60 and s_militaryStrength > 0) then
		  cp_attackPercent = 100
		end					
		if (s_selfTotalValue*2 < s_enemyTotalValue and s_selfTotalValue > 150) then			
			cp_attackPercent = 0
			aitrace("I'm Losing!! Go on defence")
		end
	end	
end	
function attack_now_timer()	
	aitrace("Script:calling attack_now_timer")	
	AttackNow();
	Rule_Remove("attack_now_timer")	
end
function Logic_military_setattacktimer()		
	local timedelay = 600 	
	local wavedelay = 240 + sg_militaryRand*0.6	
	if (g_LOD==1) then
		timedelay = 400
		wavedelay = 160 + sg_militaryRand*0.4
	end
	if (g_LOD>=2) then
		timedelay = 0
		wavedelay = 45 + sg_militaryRand*0.3
	end		
	local gametime = gameTime()		
	if (gametime >= timedelay or HaveBeenAttacked()==1) then 			
		if (Rule_Exists("attack_now_timer") == 0) then
			aitrace("Script: Attacktimer added")			
			Rule_AddInterval("attack_now_timer", wavedelay )
		end		
	end	
end