Spc_SolFXCheck = {}

function Create_Spc_Sol(CustomGroup, playerIndex, shipID)	
	Spc_SolFXCheck[shipID] = nil		
end

function Update_Spc_Sol(CustomGroup, playerIndex, shipID)			
	if Spc_SolFXCheck[shipID] == nil then
		FX_StartEvent(CustomGroup, "disk")
		Spc_SolFXCheck[shipID] = 0
	end	
end