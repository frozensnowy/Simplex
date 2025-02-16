dofilepath("data:leveldata/multiplayer/lib/lib.lua")
Meg_Asteroid1SobCheck = {}
Meg_Asteroid1Ping = {}

function Create_Meg_Asteroid1(CustomGroup, playerIndex, shipID)			
	Meg_Asteroid1SobCheck[shipID] = nil		
	Meg_Asteroid1Ping[shipID] = nil	
end

function Update_Meg_Asteroid1(CustomGroup, playerIndex, shipID)		
	--tumble
	if Meg_Asteroid1SobCheck[shipID] == nil then 			
		local tumble_range = 0.030		
		if SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid1,meg_asteroid2,meg_asteroid3") == 1 then tumble_range = 0.050			
		elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid4,meg_asteroid5,meg_asteroid6") == 1 then tumble_range = 0.045			
		elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid7,meg_asteroid8,meg_asteroid9") == 1 then tumble_range = 0.040			
		elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid10,meg_asteroid11,meg_asteroid12") == 1 then tumble_range = 0.035			
		elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid13,meg_asteroid14,meg_asteroid15") == 1 then tumble_range = 0.030			
		end					
		local tumble_dif = SobGroup_GetPosition(CustomGroup)		
		for i = 1,3,1 do
			while tumble_dif[i] > tumble_range or tumble_dif[i] < -tumble_range do
				tumble_dif[i] = tumble_dif[i] * 0.25
			end					
		end	
		local tumbleVector = {tumble_dif[1], tumble_dif[2], tumble_dif[3]}
		SobGroup_Tumble(CustomGroup, tumbleVector)		
	end	
	--sobgroups	
	Meg_Asteroid1SobCheck[shipID] = sobgroups_assign(Meg_Asteroid1SobCheck[shipID],"asteroid",CustomGroup," "," "," "," "," "," ")			
	local health = 0
	local RUasteroid = 0
	if SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid1,meg_asteroid2,meg_asteroid3") == 1 then	
		health = 40000
		RUasteroid = 4000
	elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid4,meg_asteroid5,meg_asteroid6") == 1 then
		health = 60000
		RUasteroid = 8000
	elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid7,meg_asteroid8,meg_asteroid9") == 1 then
		health = 80000
		RUasteroid = 16000
	elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid10,meg_asteroid11,meg_asteroid12") == 1 then
		health = 100000	
		RUasteroid = 32000
	elseif SobGroup_AreAnyOfTheseTypes(CustomGroup, "meg_asteroid13,meg_asteroid14,meg_asteroid15") == 1 then
		health = 120000	
		RUasteroid = 64000
	end			
	--UI stats
	if SobGroup_Selected(CustomGroup) == 1 and UI_IsNamedElementVisible("NewTaskbar", "unitSingleSelection") == 1 then						
		CalculateStatsUI(CustomGroup,playerIndex,"MaxSpeed",0,0.05,1," ",0," ",0," ",0," ",0," ",0)		
		CalculateStatsUI(CustomGroup,playerIndex,"MaxDamage",0,0.1,1," ",0," ",0," ",0," ",0," ",0)
		CalculateStatsUI(CustomGroup,playerIndex,"MaxHealth",health,0.1,1," ",0," ",0," ",0," ",0," ",0)
		UI_SetTextLabelText("NewTaskbar", "unitexperience", "")
		handlespecialstats("NewTaskbar","ruframe",0,"ruframe1",0,"fusionframe",0,"fuelframe",0,"energyframe",0,"researchframe",0)			
	end			
	--ping	
	if Meg_Asteroid1Ping[shipID] ~= nil then
		Ping_Remove(Meg_Asteroid1Ping[shipID])
	end	
	Meg_Asteroid1Ping[shipID] = Ping_AddSobGroup("" .. RUasteroid .. " RUs", "miningbase", CustomGroup)		
	Ping_LabelVisible(Meg_Asteroid1Ping[shipID], 1)	
end
