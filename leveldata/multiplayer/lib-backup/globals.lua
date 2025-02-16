--global variables to store in memory (to reduce disk read and improve response time)	--abandoned (can't fit in save file)
dofilepath([[data:scripts/race.lua]])
races = races
build_lua = {}
research_lua = {}
for z, iCount in races do
	if iCount[6] == 1 then	--Playable race
		local race = iCount[1]	--race name string
		dofilepath([[data:scripts/building and research/]] .. race .. [[/build.lua]])
		build_lua[race] = build
		build_lua[z] = build_lua[race]
		dofilepath([[data:scripts/building and research/]] .. race .. [[/research.lua]])
		research_lua[race] = research
		research_lua[z] = research_lua[race]
	end
end