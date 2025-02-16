--PDS 7.3.1
--last update 27 August 2006

dofilepath("data:ai/default.lua")

setLevelOfDifficulty(2)

--GENERAL
function Override_Init()
    sg_dobuild = 0 
    sg_doresearch = 0
    sg_doupgrades = 0
	sg_dosubsystems = 0
    sg_domilitary = 1
    cp_processResource = 0
    cp_processMilitary = 1
end

function Override_MilitaryInit()
	cp_attackPercent = 0
end