-------------------------------------------------------------------------------
-- load persistant data, research and RUs are loaded in mission scripts
--
function LoadPersistentData_Level(position, rotation)
	if (campaignStarted == 0) then
		addSquadron("First_Mothership", "Hgn_MotherShip", position, 0, rotation, 1, 1)
		createSOBGroup("MS_StartGroup")
		addToSOBGroup("First_Mothership", "MS_StartGroup")
		addSphere("MS_StartVolume", position, 1000)
	else
		addPoint("PlayerStartPoint", position, rotation)
	end
end

-------------------------------------------------------------------------------
-- spawn the exit portals
--
function SpawnExitSpheres()
	for i, iCount in exitSpheres[currentMission] do
		if (iCount) then
			addSphere(iCount[1], iCount[2], iCount[3])
		end
	end
end
