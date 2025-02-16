dofilepath("data:ai/custom_functions.lua")
aitrace("DEFAULT CPU LOADED")
g_LOD = getLevelOfDifficulty()
dofilepath("data:ai/classdef.lua")
dofilepath("data:ai/cpubuild.lua")
dofilepath("data:ai/cpuresearch.lua")
dofilepath("data:ai/cpumilitary.lua")
old_aitrace = aitrace
rawset(globals(),"aitrace",nil)
--aitrace = function() end
function aitrace(message, verbose)	--for debug (e.g., "Read from location 00000010 caused an access violation.")
	local current_verbose = 0	--0 to 3
	if verbose == nil then
		verbose = 3	--default verbose level of a message
	end
	if verbose <= current_verbose then
  	print(message.."\t for player index: "..Player_Self().." (race "..getRace().."), game time: "..gameTime())
  end
end

function oninit()	
	aitrace("oninit - Start")
	s_playerIndex = Player_Self()
	s_race = getRace();		
	sg_dobuild = 1
	sg_dosubsystems = 1
	sg_doresearch = 1
	sg_doupgrades = 1
	sg_domilitary = 1
	cp_processResource = 1
	cp_processMilitary = 1		
	sg_lastSpendMoneyTime = gameTime()
	sg_spendMoneyDelay = 0
	if (g_LOD < 2) then
		sg_spendMoneyDelay = 4
		if (g_LOD < 1) then
			sg_spendMoneyDelay = 8
		end
	end		
	ClassInitialize()	
	CpuBuild_Init()	
	CpuResearch_Init()	
	CpuMilitary_Init()	
	sg_kDemandResetValue = 2
	if (s_race == Race_Vaygr) then
		sg_kDemandResetValue = 2
	end		
	if (Override_Init) then
		Override_Init()
	end		
	sg_reseachDemand = -sg_kDemandResetValue		
	Rule_AddInterval("doai", 1.9167 )		--2
	aitrace("oninit - End")
end

----------------------------------------------------------------------------------

function CalcOpenBuildChannels()		
	aitrace("CalcOpenBuildChannels - Start")
	local numShipsBuildingShips = NumShipsBuildingShips()
	local numShipsBuildingSubSystems = NumShipsBuildingSubSystems()		
	local numShipsBuilding = numShipsBuildingShips + numShipsBuildingSubSystems	
	local researchItem = IsResearchBusy()
	local numItemsBuilding = numShipsBuilding + researchItem	
	local totalBuildShips = BuildShipCount()*2		
	local numCollecting = GetNumCollecting()
	local numRUs = GetRU()	
	sg_allowedBuildChannels = numCollecting/5;	
	if (numRUs > 500) then
		sg_allowedBuildChannels = sg_allowedBuildChannels + (numRUs-500)/1000
	end	
	s_numOpenBuildChannels = sg_allowedBuildChannels - numItemsBuilding	
	s_shipBuildQueuesFull = 0
	if (totalBuildShips == numShipsBuilding) then
		s_shipBuildQueuesFull  = 1
	end	
	if (s_numOpenBuildChannels <= -1.5) then		
		RemoveLeastNeededItem()		
	end
	aitrace("CalcOpenBuildChannels - End")
end

----------------------------------------------------------------------------------

function CacheCurrentState()	
	aitrace("CacheCurrentState - Start")
	s_numFiSystems = NumSubSystems(FIGHTERPRODUCTION) + NumSubSystemsQ(FIGHTERPRODUCTION)
	s_numCoSystems = NumSubSystems(CORVETTEPRODUCTION) + NumSubSystemsQ(CORVETTEPRODUCTION)
	s_numFrSystems = NumSubSystems(FRIGATEPRODUCTION) + NumSubSystemsQ(FRIGATEPRODUCTION)
	s_totalProdSS = s_numFiSystems + s_numCoSystems + s_numFrSystems	
	s_militaryPop = PlayersMilitaryPopulation( s_playerIndex, player_total );	
	s_selfTotalValue = PlayersMilitary_Total( s_playerIndex, player_total );
	s_enemyTotalValue = PlayersMilitary_Total( player_enemy, player_max );		
	s_militaryStrength = PlayersMilitary_Threat( player_enemy, player_min ); 	
	s_enemyIndex = GetChosenEnemy()	
	s_militaryStrengthVersusTarget = 0
	if (s_enemyIndex ~= -1) then
		s_militaryStrengthVersusTarget = PlayersMilitary_Threat( s_enemyIndex, player_max )
	end	
	aitrace("CacheCurrentState - End")
end

-------------------------------------------------------------------------------------

function SpendMoney()	
	aitrace("SpendMoney - Start")
	if (s_numOpenBuildChannels > 0) then			
		local buildHasBeenDone = 0		
		if (sg_dobuild==1 and s_shipBuildQueuesFull==0 and sg_reseachDemand<0) then
			if (CpuBuild_Process() == 1) then				
				s_numOpenBuildChannels = s_numOpenBuildChannels-1				
				sg_reseachDemand = sg_reseachDemand + 1				
				buildHasBeenDone = 1
			end
		end		
		if (s_numOpenBuildChannels > 0) then			
			if (sg_doresearch==1) then				
				local didResearch = CpuResearch_Process();				
				if (didResearch == 1) then					
					sg_reseachDemand = -sg_kDemandResetValue
				else					
					if (sg_reseachDemand>=0 and sg_dobuild==1 and s_shipBuildQueuesFull==0 and buildHasBeenDone == 0) then						
						CpuBuild_Process()
					end
				end
			else
				sg_reseachDemand = -sg_kDemandResetValue
			end
		end
	end			
	aitrace("SpendMoney - End")
end

--------------------------------------------------------------------------------

function doai()	
	aitrace("doai - Start")
	CacheCurrentState();	
	CalcOpenBuildChannels();
	local curTime = gameTime()
	local timeSinceLastSubSysDemand = curTime - sg_lastSpendMoneyTime	
	if (timeSinceLastSubSysDemand >= sg_spendMoneyDelay) then		
		SpendMoney()		
		sg_lastSpendMoneyTime = curTime
	end	
	if (sg_domilitary==1) then
		CpuMilitary_Process();
	end		
	aitrace("doai - End")
end


---Territories Mode
--variables used for passing info to game rule scope
returnString = ""
returnNumber = 0


function CanBuildShip(iShipID)
	returnNumber = CanBuild(iShipID)
end


function echo(sText)
	print(round(gameTime()) .. " --> (AI" .. gPlayerID .. ") " .. sText)
end