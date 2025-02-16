
---Prevents Destroied/Doched Ships

function ReloadLaunchMenu()
 if Stats_TotalLosses(Universe_CurrentPlayer()) > LastStats_TotalLosses[Universe_CurrentPlayer()+1] then
   UI_ReloadScreen("NewLaunchMenu")
   LastStats_TotalLosses[Universe_CurrentPlayer()+1] = Stats_TotalLosses(Universe_CurrentPlayer())
 end
end  

---Music-----------------------------------------------------------

function MusicInit()    
  playerIndex = Universe_CurrentPlayer()    
---serve per verificare che non ci sia la cinematica attiva e quando si caricano le partite, 25 ?un valore che non crea loop x la scelta canzoni
  if lastrList[playerIndex + 1] == -1 then
    Rule_AddInterval("musicslidesecurekey", 1) 
  end   
  local ec_random_path
  local ec_random_number = lastec_random_numberList[playerIndex + 1]  
  local special_end = 71
  local newambient_begin = 201
  local newambient_end = 227
	--fino all'undicesimo anno fa solo musica ambient, poi fa un random su tutto 1 volta su 3  
  if year >= 11 and year < 22 then
    local rm = random(1,4)
    if rm == 1 then
      while ec_random_number == lastec_random_numberList[playerIndex + 1] do
	      ec_random_number = random(24,special_end)
	      --ec_random_number = random(1,special_end)
	    end  
    elseif rm == 4 then
    	while ec_random_number == lastec_random_numberList[playerIndex + 1] do
	      ec_random_number = random(newambient_begin,newambient_end)
	    end
    else
      while ec_random_number == lastec_random_numberList[playerIndex + 1] do
	      ec_random_number = random(1,23)
	    end
    end  
  elseif year >= 22 then		--after a long period of playing, just randomize all the tracks evenly
  	local rm = random(1,4)
  	if rm > 1 then
	    while ec_random_number == lastec_random_numberList[playerIndex + 1] do
	      ec_random_number = random(1,special_end)
	    end
	  else
    	while ec_random_number == lastec_random_numberList[playerIndex + 1] do
	      ec_random_number = random(newambient_begin,newambient_end)
	    end
	  end
  else    	--game year < 11
    while ec_random_number == lastec_random_numberList[playerIndex + 1] do
      ec_random_number = random(1,23)
      --ec_random_number = random(37,special_end)
    end      
  end  
  lastec_random_numberList[playerIndex + 1] = ec_random_number
  
  --ambient new  
  if ec_random_number == 201 then
    ec_random_path = "Data:sound/music/ambient/HC - 01"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Deep Space/Hiigara - Cataclysm Soundtrack, F9: Next Track", 3)  
    end  
    musiclenght = 140
  elseif ec_random_number == 202 then
    ec_random_path = "Data:sound/music/ambient/HC - 09"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Gozan IV - Cataclysm Soundtrack, F9: Next Track", 3)  
    end  
    musiclenght = 145
  elseif ec_random_number == 203 then
    ec_random_path = "Data:sound/music/ambient/HC - 17"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Naval Base Alpha - Cataclysm Soundtrack, F9: Next Track", 3)  
    end  
    musiclenght = 150
  elseif ec_random_number == 204 then
    ec_random_path = "Data:sound/music/ambient/HC - 20"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Taiidan Battle Theme - Cataclysm Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 174
  elseif ec_random_number == 205 then
    ec_random_path = "Data:sound/music/ambient/HC - 21"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Turanic Battle 1 - Cataclysm Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 190
  elseif ec_random_number == 206 then
    ec_random_path = "Data:sound/music/ambient/HC - 23"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Beast Battle - Cataclysm Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 146
  elseif ec_random_number == 207 then
    ec_random_path = "Data:sound/music/ambient/HC - 24"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Bentusi Attack - Cataclysm Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 125
  elseif ec_random_number == 208 then
    ec_random_path = "Data:sound/music/ambient/HC - 25"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Sojent-Ra Theme - Cataclysm Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 127
  elseif ec_random_number == 209 then
    ec_random_path = "Data:sound/music/ambient/HC - 39"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Cataclysm Credits - Cataclysm Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 187
  elseif ec_random_number == 210 then
    ec_random_path = "Data:sound/music/special/into-the-oblivion"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Into the Oblivion - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 293
  elseif ec_random_number == 211 then
    ec_random_path = "Data:sound/music/special/orbitals"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Orbitals - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 465
  elseif ec_random_number == 212 then
    ec_random_path = "Data:sound/music/special/just-imagine"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Just Imagine - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 265
  elseif ec_random_number == 213 then
    ec_random_path = "Data:sound/music/special/another-good-day"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Another Good Day - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 450
  elseif ec_random_number == 214 then
    ec_random_path = "Data:sound/music/special/unsung-heroes"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Unsung Heroes - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 356
  elseif ec_random_number == 215 then
    ec_random_path = "Data:sound/music/nis/nis03"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("nis03 - Homeworld 2 Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 125
  elseif ec_random_number == 216 then
    ec_random_path = "Data:sound/music/special/13 - 2EM14_EM10C"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("13 - 2EM14_EM10C - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 63
  elseif ec_random_number == 217 then
    ec_random_path = "Data:sound/music/special/with an orchid"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("With an Orchid - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 300
  elseif ec_random_number == 218 then
    ec_random_path = "Data:sound/music/special/Welcome to Lunar Industries"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Welcome to Lunar Industries - Moon Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 424
  elseif ec_random_number == 219 then
    ec_random_path = "Data:sound/music/special/End Of Evangelion - Heisoku no Kakudai"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Heisoku no Kakudai - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 405
  elseif ec_random_number == 220 then
    ec_random_path = "Data:sound/music/special/End Of Evangelion - Sorashiki Nagare"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Sorashiki Nagare - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 370
  elseif ec_random_number == 221 then
    ec_random_path = "Data:sound/music/special/Schindler List"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Schindler's List - Schindler's List Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 180
  elseif ec_random_number == 222 then
    ec_random_path = "Data:sound/music/special/sunshine"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Sunshine - Sunshine Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 265
  elseif ec_random_number == 223 then
    ec_random_path = "Data:sound/music/special/EVA Soundtrack 1 - EVA-02"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("EVA-02 - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 116
  elseif ec_random_number == 224 then
    ec_random_path = "Data:sound/music/special/EVA Soundtrack 1 - NERV"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("NERV - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 115
  elseif ec_random_number == 225 then
    ec_random_path = "Data:sound/music/special/EVA Soundtrack 1 - Rei I"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Rei I - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 174
  elseif ec_random_number == 226 then
    ec_random_path = "Data:sound/music/special/sunshineost_thesurfaceofthesun"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("the Surface of the Sun - Sunshine Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 235
  elseif ec_random_number == 227 then
    ec_random_path = "Data:sound/music/special/EVA Soundtrack 2 - Magmadiver"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Magmadiver - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 140
    
  --ambient old
  elseif ec_random_number == 1 then
    ec_random_path = "Data:sound/music/ambient/amb_01"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
      Subtitle_Message("Ambient 1 - Homeworld 2 Soundtrack, F9: Next Track", 3)      
    end  
    musiclenght = 158
  elseif ec_random_number == 2 then
    ec_random_path = "Data:sound/music/ambient/amb_02"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 2 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 111
  elseif ec_random_number == 3 then
    ec_random_path = "Data:sound/music/ambient/amb_03"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 3 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 156
  elseif ec_random_number == 4 then
    ec_random_path = "Data:sound/music/ambient/amb_04"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 4 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 111
  elseif ec_random_number == 5 then
    ec_random_path = "Data:sound/music/ambient/amb_05"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 5 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 130
  elseif ec_random_number == 6 then
    ec_random_path = "Data:sound/music/ambient/amb_06"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 6 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 104
  elseif ec_random_number == 7 then
    ec_random_path = "Data:sound/music/ambient/amb_07"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 7 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 125
  elseif ec_random_number == 8 then
    ec_random_path = "Data:sound/music/ambient/amb_08"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 8 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 142
  elseif ec_random_number == 9 then
    ec_random_path = "Data:sound/music/ambient/amb_12"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 12 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 109
  elseif ec_random_number == 10 then
    ec_random_path = "Data:sound/music/ambient/amb_13"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 13 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 115
  elseif ec_random_number == 11 then
    ec_random_path = "Data:sound/music/ambient/amb_14"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 14 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 146 
  --H1  
  elseif ec_random_number == 12 then
    ec_random_path = "Data:sound/music/ambient/staging_04"		--"Data:sound/music/ambient/H1 - Bentusi Under Fire"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Staging 04 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 155	--74 
  elseif ec_random_number == 13 then
    ec_random_path = "Data:sound/music/ambient/H1 - The First Steps"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("The First Steps - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 158 
  elseif ec_random_number == 14 then
    ec_random_path = "Data:sound/music/ambient/H1 - The Beginning and the End"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("The Beginning And The End - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 186 
  elseif ec_random_number == 15 then
    ec_random_path = "Data:sound/music/ambient/H1 - Heavy Radiation"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Heavy Radiation - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 93  
  --HC   
  elseif ec_random_number == 16 then
    ec_random_path = "Data:sound/music/ambient/staging_01"		--"Data:sound/music/ambient/HC - 58"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Staging 01 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 134		--85 
  elseif ec_random_number == 17 then
    ec_random_path = "Data:sound/music/ambient/HC - 50"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 50 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 66 
  elseif ec_random_number == 18 then
    ec_random_path = "Data:sound/music/ambient/HC - 29"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 29 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 63 
  elseif ec_random_number == 19 then
    ec_random_path = "Data:sound/music/ambient/HC - 22"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 22 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 110                 
  elseif ec_random_number == 20 then
    ec_random_path = "Data:sound/music/ambient/HC - 18"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 18 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 95 
  elseif ec_random_number == 21 then
    ec_random_path = "Data:sound/music/ambient/HC - 03"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 3 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 143 
  elseif ec_random_number == 22 then
    ec_random_path = "Data:sound/music/ambient/HC - 11"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 11 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 152 
  elseif ec_random_number == 23 then
    ec_random_path = "Data:sound/music/ambient/HC - 13"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ambient 13 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 148    
     
  --battle       
  elseif ec_random_number == 24 then
    ec_random_path = "Data:sound/music/battle/battle_01"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle 1 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 277  
  elseif ec_random_number == 25 then
    ec_random_path = "Data:sound/music/battle/battle_04"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle 4 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 227  
  elseif ec_random_number == 26 then
    ec_random_path = "Data:sound/music/battle/battle_04_alt"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle 4 Alt - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 181      
  elseif ec_random_number == 27 then
    ec_random_path = "Data:sound/music/battle/battle_06"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle 6 - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 192
  elseif ec_random_number == 28 then
    ec_random_path = "Data:sound/music/battle/battle_keeper"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle Keeper - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 178        
  elseif ec_random_number == 29 then
    ec_random_path = "Data:sound/music/battle/battle_movers"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle Movers - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 159  
  elseif ec_random_number == 30 then
    ec_random_path = "Data:sound/music/battle/battle_planetkillers"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle Planet Killer - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 188  
  elseif ec_random_number == 31 then
    ec_random_path = "Data:sound/music/battle/battle_sajuuk"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle Sajuuk - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 162  
  elseif ec_random_number == 32 then
    ec_random_path = "Data:sound/music/battle/bentus_arrival"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Bentus Arrival - Homeworld 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 64
  --H1   
  elseif ec_random_number == 33 then
    ec_random_path = "Data:sound/music/battle/H1 - Imperial Battle"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Imperial Battle - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 175 
  elseif ec_random_number == 34 then
    ec_random_path = "Data:sound/music/battle/H1 - Swarmers Attack"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Swarmers Attack - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 407 
  elseif ec_random_number == 35 then
    ec_random_path = "Data:sound/music/battle/H1 - Turanic Raiders (Extended)"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Turanic Raiders (Extended) - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 236 
  --HC  
  elseif ec_random_number == 36 then
    ec_random_path = "Data:sound/music/battle/HC - 37"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle 37 - Cataclysm Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 102   
    
  --new  
  elseif ec_random_number == 37 then
    ec_random_path = "Data:sound/music/special/the Blood of Cuchulainn"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("the Blood of Cuchulainn - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 240
  elseif ec_random_number == 38 then
    ec_random_path = "Data:sound/music/special/acezero"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Acezero - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 335  
  elseif ec_random_number == 39 then
    ec_random_path = "Data:sound/music/special/Canon"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Canon - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 265   
  elseif ec_random_number == 40 then
    ec_random_path = "Data:sound/music/special/ROTR_07"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Rise of the Reds - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 246            
  elseif ec_random_number == 41 then
    ec_random_path = "Data:sound/music/special/Crimson_Tide"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Crimson Tide - Crimson Tide Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 435            
  elseif ec_random_number == 42 then
    ec_random_path = "Data:sound/music/special/adagio-for-strings"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Adagio for Strings - Homeworld Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 345            
  elseif ec_random_number == 43 then
    ec_random_path = "Data:sound/music/special/Stuart Chatwood - the 1st fight"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("the 1st Fight - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 210           
  elseif ec_random_number == 44 then
    ec_random_path = "Data:sound/music/special/Teque - 9mm from heaven"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("9mm from Heaven - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 250
  elseif ec_random_number == 45 then
    ec_random_path = "Data:sound/music/special/ride-the-worm"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ride the Worm - Battle for Dune Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 330
  elseif ec_random_number == 46 then
    ec_random_path = "Data:sound/music/special/not-an-option"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Not an Option - Battle for Dune Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 218
  elseif ec_random_number == 47 then
    ec_random_path = "Data:sound/music/special/the-war-begins"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("the War Begins - Battle for Dune Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 270
  elseif ec_random_number == 48 then
    ec_random_path = "Data:sound/music/special/Kokyou he"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Kokyou He - the Secret of Blue Water Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 294
  elseif ec_random_number == 49 then
    ec_random_path = "Data:sound/music/special/Teque - Wisal_the_Electric_Lov"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Wisal the Electric Lov - Special Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 177
  elseif ec_random_number == 50 then
    ec_random_path = "Data:sound/music/special/Hummel-gets-the-rockets"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("the Rock - the Rock Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 380
  elseif ec_random_number == 51 then
    ec_random_path = "Data:sound/music/special/Dream Within A Dream"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Dream within a Dream - Inception Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 300
  elseif ec_random_number == 52 then
    ec_random_path = "Data:sound/music/special/Time"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Time - Inception Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 270
  elseif ec_random_number == 53 then
    ec_random_path = "Data:sound/music/special/DreamIsCollapsing"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Dream Is Collapsing - Inception Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 140
  elseif ec_random_number == 54 then
    ec_random_path = "Data:sound/music/special/Arrival_To_Earth"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Arrival to Earth - Transformer Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 320
  elseif ec_random_number == 55 then
    ec_random_path = "Data:sound/music/special/a step forward into terror"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("A Step Forward Into Terror - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 108
  elseif ec_random_number == 56 then
    ec_random_path = "Data:sound/music/special/the beast ii"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("the Beast II - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 138
  elseif ec_random_number == 57 then
    ec_random_path = "Data:sound/music/special/decisive battle"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Decisive Battle - Neon Genesis Evangelion Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 140
  elseif ec_random_number == 58 then
    ec_random_path = "Data:sound/music/special/Hazardous Environments"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Hazardous Environments - Half-Life 2 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 83
  elseif ec_random_number == 59 then
    ec_random_path = "Data:sound/music/special/Bannou Senkan N Nautilus-gou"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Bannou Senkan N Nautilus-gou - the Secret of Blue Water Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 150
  elseif ec_random_number == 60 then
    ec_random_path = "Data:sound/music/special/Kishikaisei"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Kishikaisei - the Secret of Blue Water Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 127
  elseif ec_random_number == 61 then
    ec_random_path = "Data:sound/music/special/Battlefield 1942"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battlefield 1942 - Battlefield 1942 Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 240
  elseif ec_random_number == 62 then
    ec_random_path = "Data:sound/music/special/Ordos"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Ordos - Battle for Dune Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 230
  elseif ec_random_number == 63 then
    ec_random_path = "Data:sound/music/special/Also sprach Zarathustra"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Sunrise - Also sprach Zarathustra Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 100
  elseif ec_random_number == 64 then
    ec_random_path = "Data:sound/music/special/USA_11"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("USA_11 - C&C Generals Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 185
  elseif ec_random_number == 65 then
    ec_random_path = "Data:sound/music/special/USA_09"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("USA_09 - C&C Generals Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 189
  elseif ec_random_number == 66 then
    ec_random_path = "Data:sound/music/special/GLA_09"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("GLA_09 - C&C Generals Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 161
  elseif ec_random_number == 67 then
    ec_random_path = "Data:sound/music/special/GLA_06"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("GLA_06 - C&C Generals Soundtrack, F9: Next Track", 3)
    end	
    musiclenght = 190
  elseif ec_random_number == 68 then
    ec_random_path = "Data:sound/music/special/winddancer"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Wind Dancer - Special Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 212
  elseif ec_random_number == 69 then
    ec_random_path = "Data:sound/music/special/K-Pax"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Grand Central - K-Pax Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 270
  elseif ec_random_number == 70 then
    ec_random_path = "Data:sound/music/special/Battle - Steve Jablonsky"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("Battle - Transformer Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 214
  elseif ec_random_number == 71 then
    ec_random_path = "Data:sound/music/special/My Name Is Lincoln"
    if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
    	Subtitle_Message("My Name Is Lincoln - My Name Is Lincoln Soundtrack, F9: Next Track", 3)  
    end
    musiclenght = 213
  end
  Sound_MusicPlay(ec_random_path)
  Rule_Remove("MusicInit")
  Rule_AddInterval("MusicInit", musiclenght)  
  --Sound_MusicPlay("Data:sound/music/sol")  
end

function musicslide()
  if UI_ScreenIsActive("ChatScreen") == 0 then
	  UI_UnBindKeyEvent(F9KEY)  
	  Rule_Remove("MusicInit")   
	  Rule_AddInterval("MusicInit", 0.5)  
	  Rule_AddInterval("musicslidesecurekey", 1)
	end    
  Rule_Remove("musicslide")
end
function musicslidesecurekey()  
  UI_BindKeyEvent(F9KEY, "musicslide")   
  Rule_Remove("musicslidesecurekey")
end

---Random Fake----------------------------------------------

function randomfake()  
  for i = 1,60,1 do  	
    casualizzatore[i] = casualizzatore[i] + 1
    if casualizzatore[i] == i then
      casualizzatore[i] = 0
    end
  end		  
end    

---Score---------------------------------------------------

function score()
  local playerIndex = 0             
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        playerIndexList = playerIndex + 1
        scoreList[playerIndexList] = floor((fusionList[playerIndexList] / 12) +
                                           --(tradeList[playerIndexList] / 9) +
                                           (megalithList[playerIndexList] / 9) +
                                           (planetList[playerIndexList] / 9) +
                                           (honorList[playerIndexList] * 2) +                                             
                                           (pilotmaxList[playerIndexList] / 10) +
                                           (officermaxList[playerIndexList] * 2) +
                                           (pilotpopdisplayList[playerIndexList] * 25) +
                                           (RUList[playerIndexList] / 145) -
                                           (maintenanceList[playerIndexList] / 13) +
                                           (researchList[playerIndexList] / 8))   
        if scoreList[playerIndexList] < 0 then
          scoreList[playerIndexList] = 0
        end                                      
        if playerIndex == Universe_CurrentPlayer() and ((year==0 and gametime<45) or year>0) then
          UI_SetTextLabelText("UnitCapInfoPopup", "lblscore", ""..scoreList[playerIndexList]);
          --UI_SetTextLabelText("DiplomacyScreen", "lblscore", ""..scoreList[playerIndexList]);
        end                      
      end
    end
    playerIndex = playerIndex + 1
  end      
end

---Player Count-------------------------------------------

function pcount()  
  numPlayerhuman = 0
  numPlayerai = 0                                                          
  local playerIndex = 0                                              
  while playerIndex < Universe_PlayerCount() do    
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then       
				if Player_HasResearch(playerIndex, "isai" ) == 0 then
				  numPlayerhuman = numPlayerhuman + 1
				else	  
				  numPlayerai = numPlayerai + 1
				end   
				  --numPlayer = numPlayerhuman + numPlayerai	
      end	
    end
    playerIndex = playerIndex + 1	
  end                      
end    

---Weapons----------------------------------------------

function weaponsets()  
--Mothership  
  for i = 0,nms-1,1 do  
    if SobGroup_Empty("splitmotherships"..i) == 0 then
      if SobGroup_AreAnyOfTheseTypes("splitmotherships"..i, "hgn_mothership") == 1 then
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 4") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 3") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_torpedolauncher2")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_torpedolauncher3")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_ms_torpedolauncher4")   			                          
	        end  	                            
	      end	    
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 8") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 7") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_rapid2")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_rapid3")  
	          SobGroup_CreateSubSystem("splitmotherships"..i, "hgn_cf_rapid4")   			                          
	        end  	                            
	      end	   
      else
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 2") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon 1") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_qje_quadflechette_stbdF1")    
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_qje_quadflechette_stbdF2")     
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_qje_quadflechette_stbdF3")   
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_ft2_turret")
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_ft2_turret1") 						
	        end  	                            
	      end
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon Missile 2") == 0 then          
	        if SobGroup_GetHardPointHealth("splitmotherships"..i, "Weapon Missile 1") > 0 then			      			          
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS2")    
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS3")     
	          SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS4")   
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS5")
            SobGroup_CreateSubSystem("splitmotherships"..i, "vgr_heavyfusionmissilelauncherbcsmallMS6") 						
	        end  	                            
	      end
	      if SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") <= 0 then
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl1", 0)
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl2", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl3", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl4", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl5", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl6", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl7", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl8", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl9", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl10", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl11", 0)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl12", 0)		
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl13", 0)			 
		    elseif SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") > 0 and SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") <= 1 then
		      SobGroup_SetHardPointHealth("splitmotherships"..i, "pl", (SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") - 0.04))
		      if SobGroup_GetHardPointHealth("splitmotherships"..i, "pl") < 0.12 then
		        SobGroup_SetHardPointHealth("splitmotherships"..i, "pl", 0)
		      end
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl1", 1)
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl2", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl3", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl4", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl5", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl6", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl7", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl8", 1)		
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl9", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl10", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl11", 1)	
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl12", 1)		
		      SobGroup_ChangePower("splitmotherships"..i, "Weapon_pl13", 1)		
		    end		     
	    end   	        
    end 	
  end        
--Command Fortress	  
  if ncf > 0 then      
	  for i = 0,ncf-1,1 do  
	    if SobGroup_Empty("splitcommandfortresses"..i) == 0 then
	      if SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "hgn_commandfortress") == 1 then
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 2") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 1") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher4")    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher6")   
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher7")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_ms_torpedolauncher8")                    
		        end  	                            
		      end		        
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 18") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 17") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret4")    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_ionbeamturret6")   			                  
		        end  	                            
		      end			
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 32") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 31") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner2")      
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner4")       
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_miner5")                    
		        end  	                            
		      end				        	        
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 24") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 23") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid3")  	
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid4")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid5")  	
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid6")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid7")
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "hgn_cf_rapid8")  			                       
		        end  	                            
		      end			      
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 41") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 40") > 0 then			      			          
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf2")  	
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "HGN_SCC_6xAC_Turret_cf4")  			          	                       
		        end  	                            
		      end			 		      
		      		 		      
---mass shield		      
		      --if SobGroup_IsDoingAbility("splitcommandfortresses"..i, abilityList[25]) == 1 then   
		        --for z = 1,14,1 do
		          --SobGroup_Create("shielder"..i .. tostring(z))   		          		          
		          --if SobGroup_Empty("shielder"..i .. tostring(z)) == 1 then		 		            
		            --if SobGroup_FillProximitySobGroup ("temp", "Player_Ships"..SobGroup_OwnedBy("splitcommandfortresses"..i), "splitcommandfortresses"..i, 3000) == 1 then 
			            --SobGroup_FillShipsByType("shielder"..i .. tostring(z), "temp", "shielder" .. tostring(z)) 
			          --end  			          
			          --if SobGroup_Empty("shielder"..i .. tostring(z)) == 1 then 			          		                 
		              --SobGroup_CreateShip("splitcommandfortresses"..i, "shielder" .. tostring(z))
		              --break  	
		            --end   		              
		          --end  
		        --end    		        
		      --else		          		        
		        --for z = 1,14,1 do
		          --SobGroup_Create("shielder"..i .. tostring(z))   
		          --SobGroup_SetHealth("shielder"..i .. tostring(z), 0)
		        --end  
		      --end
		      
		    elseif SobGroup_AreAnyOfTheseTypes("splitcommandfortresses"..i, "vgr_commandfortress") == 1 then
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 2") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 1") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd4")    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd6")   
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd7")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd8")
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd9")  
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd10")  
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd11")    
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd12")  
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd13")   
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd14") 	
		          --SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_qje_quadflechette_stbd15")  	                              
		        end  	                            
		      end	
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 18") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 17") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion4")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion5")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_ion6")                            
		        end  	                            
		      end	
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 27") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 26") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box2")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box3")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box4")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "missile_box5")                            
		        end  	                            
		      end				      
		      if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 33") == 0 then          
		        if SobGroup_GetHardPointHealth("splitcommandfortresses"..i, "Weapon 32") > 0 then		    
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_dt3_turret1")  
		          SobGroup_CreateSubSystem("splitcommandfortresses"..i, "vgr_dt3_turret2")  		                             
		        end  	                            
		      end			              	        	        
		    end  		                
	    end 
	  end  	
	end 	
	
--Vortex
  --if nbc > 0 then
	  --for i = 0,nbc-1,1 do                                             
	    --if SobGroup_Empty("splitbattlecruisers"..i) == 0 then      
	      --if SobGroup_AreAnyOfTheseTypes("splitbattlecruisers"..i, "hgn_vortex") == 1 then    	         
		      
		    --end
		  --end
		--end
	--end	     

  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
        playerIndexList = playerIndex + 1
        if Player_GetRace(playerIndex) == Race_Hiigaran then 
---Mothership
          --if SobGroup_GetHardPointHealth("hgn_mothership"..playerIndex, "Weapon 2") > 0 then      
            --SobGroup_AbilityActivate("hgn_mothership"..playerIndex, abilityList[15], 1)
          --else 
            --SobGroup_AbilityActivate("hgn_mothership"..playerIndex, abilityList[15], 0)  
          --end        
          if Player_HasResearch(playerIndex, "ImprovedTorpedoMothership" ) == 1 then
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense1", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense2", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense3", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense4", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense5", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense6", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense7", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense8", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense9", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense10", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense11", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense12", 0)	          
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp1", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp2", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp3", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp4", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp5", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp6", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp7", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp8", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp9", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp10", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp11", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp12", 1)	 	        
	        else
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense1", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense2", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense3", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense4", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense5", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense6", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense7", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense8", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense9", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense10", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense11", 1)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefense12", 1)		          
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp1", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp2", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp3", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp4", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp5", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp6", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp7", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp8", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp9", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp10", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp11", 0)	 
	          SobGroup_ChangePower("hgn_mothership"..playerIndex, "Weapon_HullDefenseImp12", 0)	 	 
	        end 	        
          
---Missile Frigate         
          if Player_HasResearch(playerIndex, "ImprovedTorpedo" ) == 1 then
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo", 1)	 
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo1", 0)	     
	        else
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo", 0)	 
	          SobGroup_ChangePower("hgn_torpedofrigate"..playerIndex, "weapon_Torpedo1", 1)	         
	        end 

---Cruiser A	        
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoCruiseraIcon" ) == 1 then
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T1", 1)	   
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T2", 1)
	        else
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T1", 0)	   
	          SobGroup_ChangePower("hgn_cruisera"..playerIndex, "Weapon_T2", 0)         
	        end
---Cruiser B
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoCruiserbIcon" ) == 1 then
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T1", 1)	   
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T2", 1)
	        else
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T1", 0)	   
	          SobGroup_ChangePower("hgn_cruiserb"..playerIndex, "Weapon_T2", 0)         
	        end
        
        else	
---Battleship                
	        if Player_HasResearch(playerIndex, "MineBattleship" ) == 1 then
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_DslAftA", 1)	   
	        else
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_DslAftA", 0)	         
	        end
	        if Player_HasResearch(playerIndex, "FreackerBattleship" ) == 1 then
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_freacker", 1)	   
	        else
	          SobGroup_ChangePower("vgr_alkhalid"..playerIndex, "Weapon_freacker", 0)	         
	        end
---Destroyer	        
	        if Player_HasResearch(playerIndex, "MineDestroyer" ) == 1 then
	          SobGroup_ChangePower("vgr_destroyer"..playerIndex, "Weapon_Monster", 1)	   
	        else
	          SobGroup_ChangePower("vgr_destroyer"..playerIndex, "Weapon_Monster", 0)	         
	        end
---PulseDestroyer	        
	        if Player_HasResearch(playerIndex, "MinePulseDestroyer" ) == 1 then
	          SobGroup_ChangePower("vgr_pulsedestroyer"..playerIndex, "Weapon_Front", 1)	   
	        else
	          SobGroup_ChangePower("vgr_pulsedestroyer"..playerIndex, "Weapon_Front", 0)	         
	        end					
---Cruiser	        
	        if Player_HasResearch(playerIndex, "ImprovedTorpedoCruiser1" ) == 1 then
	          SobGroup_ChangePower("vgr_cruiser"..playerIndex, "Weapon_hf", 1)	   
	        else
	          SobGroup_ChangePower("vgr_cruiser"..playerIndex, "Weapon_hf", 0)	         
	        end	        
	      end 	                       
      end
    end
    playerIndex = playerIndex + 1
  end      	       
end  

---Disable Ship----------------------------------------------

function disableship(sobgroup)
  for i = 1,17,1 do
    SobGroup_AbilityActivate(sobgroup, abilityList[i], 0)	   
  end
end

---Eventi----------------------------------------------------------------

function eventi()  
  local playerIndex = Universe_CurrentPlayer() 
  playerIndexList = playerIndex + 1    
  if Player_GetRace(playerIndex) == Race_Hiigaran then                                              
---alarm  
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "hgn_mothership") >= 1 then
	    if (SobGroup_HealthPercentage("hgn_mothership"..playerIndex) <= 0.15 and SobGroup_Empty("hgn_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("hgn_mothership"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 3: Mothership's health less then 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("hgn_mothership"..playerIndex) <= 0.3 and SobGroup_Empty("hgn_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("hgn_mothership"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 2: Mothership's health less then 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("hgn_mothership"..playerIndex) <= 0.5 and SobGroup_Empty("hgn_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("hgn_mothership"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Mothership's health less then 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "hgn_mothership"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching to the Mothership",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end           
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "hgn_mothership"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_FleetCommand,"Alarm Level 1: Enemy Juggernaut is approaching to the Mothership",1.72)    
	      eventitime[playerIndexList] = 8.88      
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end 
	elseif Player_GetRace(playerIndex) == Race_Vaygr then
---alarm	
	  if Player_GetNumberOfSquadronsOfTypeAwakeOrSleeping(playerIndex, "vgr_mothership") >= 1 then
	    if (SobGroup_HealthPercentage("vgr_mothership"..playerIndex) <= 0.15 and SobGroup_Empty("vgr_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("vgr_mothership"..playerIndex) < 12000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")	 
	      Subtitle_Add(Actor_Makaan,"Alarm Level 3: Mothership's health less then 15%",1.72)    
	      eventitime[playerIndexList] = 5.128 
	    elseif (SobGroup_HealthPercentage("vgr_mothership"..playerIndex) <= 0.3 and SobGroup_Empty("vgr_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("vgr_mothership"..playerIndex) < 10000) then          
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena1")	
	      Subtitle_Add(Actor_Makaan,"Alarm Level 2: Mothership's health less then 30%",1.72)
	      eventitime[playerIndexList] = 6.66    
	    elseif (SobGroup_HealthPercentage("vgr_mothership"..playerIndex) <= 0.5 and SobGroup_Empty("vgr_mothership"..playerIndex) == 0 and Camera_GetDistanceToSobGroup("vgr_mothership"..playerIndex) < 8000) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Mothership's health less then 50%",1.72)  	        
	      eventitime[playerIndexList] = 8.88 	   	    
	    elseif (SobGroup_FillProximitySobGroup("temp", "nuclearbombenemies"..playerIndex, "vgr_mothership"..playerIndex, 16000) == 1) then	        
	      if SobGroup_AreAnyOfTheseTypes("temp", "hgn_nuclearbomb") == 1 then  
		      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena2")
		      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy Heavy Nuclear Bomb is approaching to the Mothership",1.72)    
		      eventitime[playerIndexList] = 8.88  	
		    end            
	    elseif (SobGroup_FillProximitySobGroup("temp", "juggernaughtenemies"..playerIndex, "vgr_mothership"..playerIndex, 14000) == 1) then	      
	      Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
	      Subtitle_Add(Actor_Makaan,"Alarm Level 1: Enemy Juggernaut is approaching to the Mothership",1.72)    
	      eventitime[playerIndexList] = 8.88      
	    else
	      eventitime[playerIndexList] = 8.88  
	    end  
	  end 
	end  
---population    
  if (NeededPilots[playerIndexList] < 1) then
    if audio_block_unitcapreached[playerIndexList] == 0 then
      Sound_SpeechPlay("Data:sound/speech/allships/fleet/status_unitcapreached_1")  
      audio_block_unitcapreached[playerIndexList] = 1
    end 
  else
    audio_block_unitcapreached[playerIndexList] = 0               
  end	 
---Timing
  Rule_Remove("eventi")
	Rule_AddInterval("eventi", eventitime[playerIndexList])				       	 
end 

---Objectives-------------------------------------------
function objectives()    
  if secondaryobjectives ~= -1 or objectiveinit == 1 then
	  local playerIndex = 0                         
	  while playerIndex < Universe_PlayerCount() do
	    if Player_IsAlive(playerIndex) == 1 then
	      if Player_HasShipWithBuildQueue(playerIndex) == 1 then  
	        playerIndexList = playerIndex + 1		 				  
			  
			---objective init
				  if objectiveinit == 1 then
					  if (winCondition == "DestroyMothership") then
					    Survive_id = Objective_Add("Destroy Mothership", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Search and destroy the enemy Mothership, your Mothership must survive")
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: search and destroy enemy Motherships, your Mothership must survive",10)    
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					  elseif (winCondition == "DestroyProduction") then
					    Survive_id = Objective_Add("Destroy Production", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Search and destroy enemy production Capital Ships, to survive you must have at least one active production Capital Ship in your fleet")
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: search and destroy enemy production Capital Ships, to survive you must have at least one active production Capital Ship in your fleet",10)
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					  elseif (winCondition == "DestroyAll") then 
					    Survive_id = Objective_Add("Destroy All", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Search and destroy enemy forces, to survive you must have at least one active ship in your fleet")  
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: search and destroy enemy forces, to survive you must have at least one active ship in your fleet",10) 
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")  
					  elseif (winCondition == "Store100000RUs") then 
					    Survive_id = Objective_Add("Store 100000 RUs", OT_Primary)
					  	Objective_AddDescription(Survive_id, "The first Player to accumulates 100000 RUs wins")  
					  	Subtitle_Add(Actor_FleetIntel,"the first Player to accumulates 100000 RUs wins",10) 
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")        	      	
					  elseif (winCondition == "CaptureAllPost") then
					    Survive_id = Objective_Add("Conquer Territories", OT_Primary)
					  	Objective_AddDescription(Survive_id, "Capture all enemy Command Posts, to survive you must have at least one Command Post in your fleet")
					  	Subtitle_Add(Actor_FleetIntel,"Objectives update, primary: capture all enemy Command Posts, to survive you must have at least one Command Post in your fleet",10)
					  	Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
					  end   
					  objectiveinit = objectiveinit + 1  					  
					  break 	  
				  elseif objectiveinit == 2 then
				
				---resource race 	
				    if rurace == 1 then			  	
			  	  	Reach10000RUs_id = Objective_Add("Accumulate 10000 RUs", OT_Secondary)
				  		Objective_AddDescription(Reach10000RUs_id, "The first Player to accumulates 10000 RUs gain 5000 extra RUs and 5 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to accumulates 10000 RUs gains 5000 extra RUs and 5 extra Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rurace = rurace + 1
				  		break
				  	elseif rurace == 2 then
				  	  if Player_GetRU(playerIndex) >= 10000 and RUMaxCapacityList[playerIndexList] >= 10000 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 5000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 5
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Accumulate 10000 RUs");										
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Accumulate 10000 RUs completed by " .. CPULODList[playerIndexList]); 					 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Accumulate 10000 RUs completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(Reach10000RUs_id, OS_Complete)					  
								else
								  Objective_SetState(Reach10000RUs_id, OS_Failed)
								end  
								rurace = rurace + 1  
								break	
							end	
						elseif rurace == 3 then			  	
			  	  	Reach20000RUs_id = Objective_Add("Accumulate 20000 RUs", OT_Secondary)
				  		Objective_AddDescription(Reach20000RUs_id, "The first Player to accumulates 20000 RUs gain 10000 extra RUs and 10 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to accumulates 20000 RUs gains 10000 extra RUs and 10 extra Honor points",7)
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")				  				  	
				  		rurace = rurace + 1	
				  		break
						elseif rurace == 4 then
						  if Player_GetRU(playerIndex) >= 20000 and RUMaxCapacityList[playerIndexList] >= 20000 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 10000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 10
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Accumulate 20000 RUs");							
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Accumulate 20000 RUs completed by " .. CPULODList[playerIndexList]); 					
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Accumulate 20000 RUs completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(Reach20000RUs_id, OS_Complete)					  
								else
								  Objective_SetState(Reach20000RUs_id, OS_Failed)
								end  
								rurace = rurace + 1  
								break	
							end	 	  
				  	elseif rurace == 5 then			  	
			  	  	Reach40000RUs_id = Objective_Add("Accumulate 40000 RUs", OT_Secondary)
				  		Objective_AddDescription(Reach40000RUs_id, "The first Player to accumulates 40000 RUs gain 20000 extra RUs and 20 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to accumulates 40000 RUs gains 20000 extra RUs and 20 extra Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rurace = rurace + 1	
				  		break
						elseif rurace == 6 then
						  if Player_GetRU(playerIndex) >= 40000 and RUMaxCapacityList[playerIndexList] >= 40000 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 20000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 20
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Accumulate 40000 RUs");							
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Accumulate 40000 RUs completed by " .. CPULODList[playerIndexList]);  								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Accumulate 40000 RUs completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(Reach40000RUs_id, OS_Complete)					  
								else
								  Objective_SetState(Reach40000RUs_id, OS_Failed)
								end  
								rurace = rurace + 1  
								break	
							end	 	  
				  	end		
				  	
				---rank race 	
				    if rankrace == 1 then			  	
			  	  	ReachLieutenantRank_id = Objective_Add("Gain the Lieutenant Rank", OT_Secondary)
				  		Objective_AddDescription(ReachLieutenantRank_id, "The first Player to gain the Lieutenant rank gain 2000 extra RUs and 2 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Lieutenant rank gain 2000 extra RUs and 2 extra Honor points",7)
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")				  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 2 then
				  	  if (SobGroup_GetHardPointHealth("supporter"..playerIndex, "isLieutenant") > 0 and Player_GetRace(playerIndex) ~= Race_Hiigaran) or SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isLieutenant") > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 2000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 2
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Lieutenant Rank");						
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Lieutenant Rank completed by " .. CPULODList[playerIndexList]);						 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Lieutenant Rank completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachLieutenantRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachLieutenantRank_id, OS_Failed)
								end  													
								rankrace = rankrace + 1  
								break	
							end
						elseif rankrace == 3 then			  	
			  	  	ReachCommanderRank_id = Objective_Add("Gain the Commander Rank", OT_Secondary)
				  		Objective_AddDescription(ReachCommanderRank_id, "The first Player to gain the Commander rank gain 4000 extra RUs and 4 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Commander rank gain 4000 extra RUs and 4 extra Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 4 then
				  	  if (SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommander") > 0 and Player_GetRace(playerIndex) ~= Race_Hiigaran) or SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommander") > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 4000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 4
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Commander Rank");			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Commander Rank completed by " .. CPULODList[playerIndexList]);					 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Commander Rank completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachCommanderRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachCommanderRank_id, OS_Failed)
								end  							
								rankrace = rankrace + 1  
								break	
							end			
						elseif rankrace == 5 then			  	
			  	  	ReachCaptainRank_id = Objective_Add("Gain the Captain Rank", OT_Secondary)
				  		Objective_AddDescription(ReachCaptainRank_id, "The first Player to gain the Captain rank gain 6000 extra RUs and 6 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Captain rank gain 6000 extra RUs and 6 extra Honor points",7)		
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")		  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 6 then
				  	  if (SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCaptain") > 0 and Player_GetRace(playerIndex) ~= Race_Hiigaran) or SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCaptain") > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 6000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 6
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Captain Rank");			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Captain Rank completed by " .. CPULODList[playerIndexList]);											 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Captain Rank completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachCaptainRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachCaptainRank_id, OS_Failed)
								end  											
								rankrace = rankrace + 1  
								break	
							end			
						elseif rankrace == 7 then			  	
			  	  	ReachCommodoreRank_id = Objective_Add("Gain the Commodore Rank", OT_Secondary)
				  		Objective_AddDescription(ReachCommodoreRank_id, "The first Player to gain the Commodore rank gain 8000 extra RUs and 8 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Commodore rank gain 8000 extra RUs and 8 extra Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 8 then
				  	  if (SobGroup_GetHardPointHealth("supporter"..playerIndex, "isCommodore") > 0 and Player_GetRace(playerIndex) ~= Race_Hiigaran) or SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isCommodore") > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 8000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 8
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Commodore Rank");			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Commodore Rank completed by " .. CPULODList[playerIndexList]);											 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Commodore Rank completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachCommodoreRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachCommodoreRank_id, OS_Failed)
								end  											
								rankrace = rankrace + 1  
								break	
							end	
						elseif rankrace == 9 then			  	
			  	  	ReachAdmiralRank_id = Objective_Add("Gain the Admiral Rank", OT_Secondary)
				  		Objective_AddDescription(ReachAdmiralRank_id, "The first Player to gain the Admiral rank gain 10000 extra RUs and 10 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Admiral rank gain 10000 extra RUs and 10 extra Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 10 then
				  	  if (SobGroup_GetHardPointHealth("supporter"..playerIndex, "isAdmiral") > 0 and Player_GetRace(playerIndex) ~= Race_Hiigaran) or SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isAdmiral") > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 10000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 10
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Admiral Rank");			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Admiral Rank completed by " .. CPULODList[playerIndexList]);									 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Admiral Rank completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachAdmiralRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachAdmiralRank_id, OS_Failed)
								end  												
								rankrace = rankrace + 1  
								break	
							end					  	
						elseif rankrace == 11 then			  	
			  	  	ReachFleetAdmiralRank_id = Objective_Add("Gain the Fleet Admiral Rank", OT_Secondary)
				  		Objective_AddDescription(ReachFleetAdmiralRank_id, "The first Player to gain the Fleet Admiral rank gain 12000 extra RUs and 12 extra Honor points")
				  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to gain the Fleet Admiral rank gain 12000 extra RUs and 12 extra Honor points",7)	
				  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
				  		rankrace = rankrace + 1
				  		break
				  	elseif rankrace == 12 then
				  	  if (SobGroup_GetHardPointHealth("supporter"..playerIndex, "isFleetAdmiral") > 0 and Player_GetRace(playerIndex) ~= Race_Hiigaran) or SobGroup_GetHardPointHealth("hgn_crewstation"..playerIndex, "isFleetAdmiral") > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 12000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 12
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Gain the Fleet Admiral Rank");			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Gain the Fleet Admiral Rank completed by " .. CPULODList[playerIndexList]);									 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Gain the Fleet Admiral Rank completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(ReachFleetAdmiralRank_id, OS_Complete)					  
								else
								  Objective_SetState(ReachFleetAdmiralRank_id, OS_Failed)
								end  						
								rankrace = rankrace + 1  
								break	
							end	
						end					  							  							  				  								  							  	
				  	
				---megalith race 	
				    if domainrace == 1 then		
				      if SobGroup_Count("megalithnoowner") > 0 then	  	
				  	  	CaptureMegalith_id = Objective_Add("Capture Mining Base", OT_Secondary)
					  		Objective_AddDescription(CaptureMegalith_id, "The first Player to captures a Mining Base gain 5000 extra RUs and 5 extra Honor points")
					  		Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the first Player to captures a Mining Base gain 5000 extra RUs and 5 extra Honor points",7)	
					  		Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")			  				  	
					  		domainrace = domainrace + 1
					  		break
					  	end	
				  	elseif domainrace == 2 then
				  	  if SobGroup_Count("meg_gehenna_1ctm"..playerIndex) > 0 or SobGroup_Count("meg_gehenna_3ctm"..playerIndex) > 0 then
					  	  Player_SetRU(playerIndex, Player_GetRU(playerIndex) + 5000)
					  	  honorbonus[playerIndexList] = honorbonus[playerIndexList] + 5
					  	  if lastrList[playerIndexList] == -1 then
						  	  UI_SetScreenEnabled("rurace", 1)		
									UI_SetScreenVisible("rurace", 1)	
									UI_SetTextLabelText("rurace", "lblSubTitle", "Capture Mining Base");			
									UI_SetTextLabelText("rurace", "lblDescription1", "The objective Capture Mining Base completed by " .. CPULODList[playerIndexList]);							 								
								end	
								Subtitle_Add(Actor_FleetIntel,"Objectives update, secondary: the objective Capture Mining Base completed",7)
								Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/fintelobjectiveping")
								if playerIndex == Universe_CurrentPlayer() then
								  Objective_SetState(CaptureMegalith_id, OS_Complete)					  
								else
								  Objective_SetState(CaptureMegalith_id, OS_Failed)
								end  													
								domainrace = domainrace + 1 
								break	
							end							
				  	end	 	
				  	
				  end				
				end
			end
			playerIndex = playerIndex + 1
		end			 
	else
	  Rule_Remove("objective")  
	end  			
end 

---On start one time job-------------------------------------------

function OnStartOneTimeJob()   
	local playerIndex = 0
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
			--health tweak for fighters and corvettes		
			for i = 1,3 do
				if i == tweakfighterhealth then 
				  if Player_CanResearch(playerIndex, "MAXHEALTH_FIGHTER_"..i) == 1 then
						Player_GrantResearchOption(playerIndex, "MAXHEALTH_FIGHTER_"..i)
					end
				else
					if Player_CanResearch(playerIndex, "MAXHEALTH_FIGHTER_"..i) == 1 then
				  	Player_RestrictResearchOption(playerIndex, "MAXHEALTH_FIGHTER_"..i)
				  end
				end
				if i == tweakcorvettehealth then 
				  if Player_CanResearch(playerIndex, "MAXHEALTH_CORVETTE_"..i) == 1 then
						Player_GrantResearchOption(playerIndex, "MAXHEALTH_CORVETTE_"..i)
					end
				else
					if Player_CanResearch(playerIndex, "MAXHEALTH_CORVETTE_"..i) == 1 then
				  	Player_RestrictResearchOption(playerIndex, "MAXHEALTH_CORVETTE_"..i)
				  end
				end
			end
    end
 	playerIndex = playerIndex + 1
  end
end


---Match Init-------------------------------------------

function matchinit()   

---stabilisce la velocit?del match (11-52->0.5-2.36)
  if year < 3 then
		gamespeedprogression =
		(	
		(resstart/1000) +
		startwith +
		honourstart +	
		buildspeed +
		resource +	
		honoursensitivity +
		researchsensitivity + 
		recruiting +
		(rankremuneration-1) +	
		experiencesensitivity +
		energysensitivity 
		)
		/
		22
	end	 	
  
  local playerIndex = 0   
  local cpu = 1   
  local player = 1    
  local stopsupport = 0	
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        playerIndexList = playerIndex + 1
				
				--research restrict
				if SobGroup_Empty("star_sol") == 1 then				  	
					if Player_CanResearch(playerIndex, "solarshield1" ) == 1 then
						Player_RestrictResearchOption(playerIndex, "solarshield1")
					end	
					if Player_CanResearch(playerIndex, "remotespaceshield1" ) == 1 then
						Player_RestrictResearchOption(playerIndex, "remotespaceshield1")					
					end						
				end
				
				--gamespeed		
				if gamespeedprogression < 1 then 
				  if Player_CanResearch(playerIndex, "gamespeed1" ) == 1 then
						Player_GrantResearchOption(playerIndex, "gamespeed1")
					end
				elseif gamespeedprogression < 1.5 then
				  if Player_CanResearch(playerIndex, "gamespeed2" ) == 1 then
						Player_GrantResearchOption(playerIndex, "gamespeed2")
					end	
				else
				  if Player_CanResearch(playerIndex, "gamespeed3" ) == 1 then
						Player_GrantResearchOption(playerIndex, "gamespeed3")
					end	
				end
				if SobGroup_Empty("supporter"..playerIndex) == 0 then
				
				  if stopsupport == 0 then				
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "resistence", unithealth) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "buildspeed", buildspeed) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "resource", resource) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "hyperspace", hyperspace) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "unitbehavior", unitbehavior)
						stopsupport = 1
					else
            SobGroup_SetHardPointHealth("supporter"..playerIndex, "resistence", 0) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "buildspeed", 0.145) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "resource", 0.155) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "hyperspace", 0.94) 
						SobGroup_SetHardPointHealth("supporter"..playerIndex, "unitbehavior", 0)					
					end

					if PlayerBlockNameList[playerIndexList] == 0 then        
						if CPU_Exist(playerIndex) == 1 then 		--Player_HasResearch(playerIndex, "isai" ) == 1
							CPULODList[playerIndexList] = "CPU " .. cpu   
							Player_SetPlayerName(playerIndex, CPULODList[playerIndexList])
							cpu = cpu + 1
						else  
							CPULODList[playerIndexList] = "Player " .. player       
							player = player + 1
						end
						PlayerBlockNameList[playerIndexList] = 1
					end	 
	
  ---unit cap
	        if unitcapsrank == 4 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank4") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank4")
						end  
					elseif unitcapsrank == 3 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank3") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank3")
						end 
					elseif unitcapsrank == 2 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank2") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank2")
						end   
					elseif unitcapsrank == 1 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "unitcapsrank1") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "unitcapsrank1")
						end  					              
					end  
	
	---anti rad x AI
					--if Player_HasResearch(playerIndex, "isai" ) == 1 then
					  --if Player_CanResearch(playerIndex, "nebula" ) == 1 then
							--Player_GrantResearchOption(playerIndex, "nebula")
						--end	
						--if SobGroup_GetHardPointHealth("supporter"..playerIndex, "nebula") == 0 then
							--SobGroup_CreateSubSystem("supporter"..playerIndex, "nebula")
						--end 
					--end	       
					
	---Cores
					--if SobGroup_Empty("star_sol") == 1 or Player_HasResearch(playerIndex, "isai" ) == 1 then        
						--Player_GrantResearchOption(playerIndex, "core_navigation_sub")
						--Player_GrantResearchOption(playerIndex, "core_harvest_sub")
						--Player_GrantResearchOption(playerIndex, "core_defense_sub")
						--Player_GrantResearchOption(playerIndex, "core_attack_sub")
						--Player_GrantResearchOption(playerIndex, "core_hyperspace_sub")
						--Player_GrantResearchOption(playerIndex, "core_build_sub")
						--Player_GrantResearchOption(playerIndex, "core_repair_sub")
						--Player_GrantResearchOption(playerIndex, "core_cloak_sub")         
					--end	      

	---AI	                    
					if military == 5 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military2") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military2")
						end  
					elseif military == 4 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military1") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military1")
						end 
					elseif military == 2 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military")
						end   
					elseif military == 1 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military0")
						end  
					--test, destroy AI     
					elseif military == 7 then
						if SobGroup_GetHardPointHealth("supporter"..playerIndex, "military0") == 0 then
							SobGroup_CreateSubSystem("supporter"..playerIndex, "military0")                       
						end 
						if playerIndex ~= 0 then
							SobGroup_TakeDamage("Player_Ships"..playerIndex, 1)  
						end                                  
					end  
        end					
      end
    end
    playerIndex = playerIndex + 1
  end      	  
end   

---BUIL ON START---------------------------------------------------------------------------------------------------

function buildonstartextra()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then                    
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then                      
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")                  
          end      				
        else          
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartextra")      
end   

function buildonstartfleet()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then   
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_power_ms")  
            SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")   						
          end 			         
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule")  		                
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")		                       
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")   
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")  						
          end     					
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          Player_GrantResearchOption(playerIndex , "Crew1")          			
          Player_GrantResearchOption(playerIndex , "Officer1")    
          if SobGroup_Count("vgr_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("vgr_mothership"..playerIndex, "vgr_power_ms")             		                  
          end 	 					
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartfleet")      
end   

function buildonstartempire()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then                   
					if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_power_ms") 
            SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "hgn_power_ms1") 
            SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")          
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")
						--SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_hyperspacestation")  						
          end 
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule")  
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule1")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule2")
		        --SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule3")
            --SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule4")	
            --SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule5")				        
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule1")	
		        --SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule2")		
		        --SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule3")	  
		        --SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule4")	        
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")              
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")   
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")  						
          end      					
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")      
          Player_GrantResearchOption(playerIndex , "Crew1")					
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          --Player_GrantResearchOption(playerIndex , "Crew4")     
          --Player_GrantResearchOption(playerIndex , "Crew5")     
          --Player_GrantResearchOption(playerIndex , "Crew6")          			
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					--Player_GrantResearchOption(playerIndex , "Officer3")	
          --Player_GrantResearchOption(playerIndex , "Officer4")
          --Player_GrantResearchOption(playerIndex , "Officer5")							
          if SobGroup_Count("vgr_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("vgr_mothership"..playerIndex, "vgr_power_ms")             		                  
          end 
          if SobGroup_Count("vgr_shipyard"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("vgr_shipyard"..playerIndex, "vgr_power_sy")             		                  
          end			 					
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartempire")  	  
end  

function buildonstartmap()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then
				
				  --solar system
				  if SobGroup_Empty("star_sol") == 0 then 
						if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then   
              if SobGroup_Count("hgn_battlestation"..playerIndex) == 0 then	 --serve x start test					
								SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_battlestation")   
              end								
						end  
					end	
					
        end
      end
    end
    playerIndex = playerIndex + 1
  end    
  Rule_Remove("buildonstartmap")    
end   

function buildonstarttest()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then 
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_gunturret")           
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_pulsarturret")          
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_hyperspacestation")              
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_ionturret")      
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_missileturret")      
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "hgn_rts")                
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_defensefieldturret")           
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_probe")    
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_proximitysensor")    
						SobGroup_CreateShip("hgn_mothership"..playerIndex, "Hgn_ecmprobe")          				
          end  				   
          if SobGroup_Count("hgn_commandfortress"..playerIndex) >= 1 then        					
						SobGroup_CreateShip("hgn_commandfortress"..playerIndex, "hgn_drone")    
					end	
					if SobGroup_Count("hgn_tanker"..playerIndex) >= 1 then   
						SobGroup_CreateShip("hgn_tanker"..playerIndex, "hgn_patcher")
					end	
          if SobGroup_Count("hgn_crewstation"..playerIndex) >= 1 then 
            SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule")  
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule1")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule2")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule3")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule4")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_PilotModule5")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule")
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule1")	
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule2")		
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule3")	  
		        SobGroup_CreateSubSystem("hgn_crewstation"..playerIndex, "Hgn_OfficerModule4")	        
            SobGroup_CreateShip("hgn_crewstation"..playerIndex, "hgn_transportcell")                          
          end 
          if SobGroup_Count("hgn_scaver"..playerIndex) >= 1 then 
          	SobGroup_CreateShip("hgn_scaver"..playerIndex, "Hgn_massiveturret") 
          end             					
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_gun")          
          SobGroup_CreateShip("vgr_mothership"..playerIndex, "vgr_weaponplatform_missile")          
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
        elseif ( Player_GetRace(playerIndex) == Race_Kadeshi ) then      
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
        elseif ( Player_GetRace(playerIndex) == Race_Raider ) then      
          Player_GrantResearchOption(playerIndex , "Crew1")
          Player_GrantResearchOption(playerIndex , "Crew2")      
					Player_GrantResearchOption(playerIndex , "Crew3")  
          Player_GrantResearchOption(playerIndex , "Crew4")
          Player_GrantResearchOption(playerIndex , "Crew5")      
					Player_GrantResearchOption(playerIndex , "Crew6")      					
          Player_GrantResearchOption(playerIndex , "Officer1")
          Player_GrantResearchOption(playerIndex , "Officer2")
					Player_GrantResearchOption(playerIndex , "Officer3")
					Player_GrantResearchOption(playerIndex , "Officer4")
					Player_GrantResearchOption(playerIndex , "Officer5")
        end
      end
    end
    playerIndex = playerIndex + 1
  end      
  Rule_Remove("buildonstarttest")  	  
end  

function buildonresstart7000()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then   
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "supplyms")	            			
          end 
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          Player_GrantResearchOption(playerIndex , "resource1")                
        end
      end
    end
    playerIndex = playerIndex + 1
  end
  --if ((year==0 and gametime<45) or year>0) then  
  Rule_Remove("buildonresstart7000")   	  
  --end  
end 

function buildonresstart11000()   
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then   
        if ( Player_GetRace(playerIndex) == Race_Hiigaran ) then   
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "supplyms")		            
          end 
          if SobGroup_Count("hgn_mothership"..playerIndex) >= 1 then             			        	      			          
		        SobGroup_CreateSubSystem("hgn_mothership"..playerIndex, "supplyms1")		            
          end 
        elseif ( Player_GetRace(playerIndex) == Race_Vaygr ) then
          Player_GrantResearchOption(playerIndex , "resource1")                
        end
      end
    end
    playerIndex = playerIndex + 1
  end
  --if ((year==0 and gametime<45) or year>0) then  
  Rule_Remove("buildonresstart11000")   	  
  --end  
end                   

---Messaggi---------------------------------------------------

function togliprioritamessaggio()  
  prioritamessaggio[Universe_CurrentPlayer() + 1] = 0
  Rule_Remove("togliprioritamessaggio")
end

---Auto Repair e Docking------------------------------------------------

function autorepair()  

---fighter
  for z = 1,6,1 do
	  for i = 0,nfi[z]-1,1 do  	 		  
	    if SobGroup_Empty("splitfighters"..(z-1) .. tostring(i)) == 0	then         
		    if SobGroup_GetTactics("splitfighters"..(z-1) .. tostring(i)) == 2 then  	
		      if SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i)) <= 0.53 then	      
		        if SobGroup_IsDoingAbility("splitfighters"..(z-1) .. tostring(i), abilityList[9]) == 0 then
		        	SobGroup_Clear("temp")
		          if SobGroup_FillProximitySobGroup("temp", "fcdocker"..SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "splitfighters"..(z-1) .. tostring(i), 15000) == 1 then			
		            SobGroup_DockSobGroup("splitfighters"..(z-1) .. tostring(i), "temp")           
				      end		       		                 			    	  	    
		        end	
		  	  end 							  			 
				end	
	---docking repair				
				if SobGroup_IsDocked("splitfighters"..(z-1) .. tostring(i)) == 1 then
				  if Player_HasResearch(SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "CapitalDockingUpgrade3") == 1 then
				    local health = SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i))+0.5
				    if health < 1 then
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "CapitalDockingUpgrade2") == 1 then  
				    local health = SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i))+0.3
				    if health < 1 then
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitfighters"..(z-1) .. tostring(i)), "CapitalDockingUpgrade1") == 1 then 
				    local health = SobGroup_HealthPercentage("splitfighters"..(z-1) .. tostring(i))+0.15
				    if health < 1 then
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitfighters"..(z-1) .. tostring(i), 1)
				    end   
				  else
				  end
				end  
						
			end		 
		end	            
	end 

---corvette
  for z = 1,6,1 do
	  for i = 0,nco[z]-1,1 do  	 		  
	    if SobGroup_Empty("splitcorvettes"..(z-1) .. tostring(i)) == 0	then          
		    if SobGroup_GetTactics("splitcorvettes"..(z-1) .. tostring(i)) == 2 then  	
		      if SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i)) <= 0.52 then	 
		        if SobGroup_IsDoingAbility("splitcorvettes"..(z-1) .. tostring(i), abilityList[9]) == 0 then    		          
		          SobGroup_Clear("temp")
		          if SobGroup_FillProximitySobGroup("temp", "fcdocker"..SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "splitcorvettes"..(z-1) .. tostring(i), 15000) == 1 then			
		            SobGroup_DockSobGroup("splitcorvettes"..(z-1) .. tostring(i), "temp")           
				      end					          	
		        end  
	        end   		                 			    	  	     			 
				end		
	---docking repair				
				if SobGroup_IsDocked("splitcorvettes"..(z-1) .. tostring(i)) == 1 then
				  if Player_HasResearch(SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "CapitalDockingUpgrade3") == 1 then
				    local health = SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i))+0.5
				    if health < 1 then
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "CapitalDockingUpgrade2") == 1 then  
				    local health = SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i))+0.3
				    if health < 1 then
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), 1)
				    end  
				  elseif Player_HasResearch(SobGroup_OwnedBy("splitcorvettes"..(z-1) .. tostring(i)), "CapitalDockingUpgrade1") == 1 then 
				    local health = SobGroup_HealthPercentage("splitcorvettes"..(z-1) .. tostring(i))+0.15
				    if health < 1 then
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), health)
				    else  
				      SobGroup_SetHealth("splitcorvettes"..(z-1) .. tostring(i), 1)
				    end   
				  else
				  end
				end  
							
			end		             
		end 
	end	
	
---frigates
  for i = 0,nf-1,1 do  	 		  
    if SobGroup_Empty("splitfrigates"..i) == 0	then           
	---docking repair				
			if SobGroup_IsDocked("splitfrigates"..i) == 1 then
			  if Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "CapitalDockingUpgrade3") == 1 then
			    local health = SobGroup_HealthPercentage("splitfrigates"..i)+0.3
			    if health < 1 then
			      SobGroup_SetHealth("splitfrigates"..i, health)
			    else  
			      SobGroup_SetHealth("splitfrigates"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "CapitalDockingUpgrade2") == 1 then  
			    local health = SobGroup_HealthPercentage("splitfrigates"..i)+0.15
			    if health < 1 then
			      SobGroup_SetHealth("splitfrigates"..i, health)
			    else  
			      SobGroup_SetHealth("splitfrigates"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitfrigates"..i), "CapitalDockingUpgrade1") == 1 then 
			    local health = SobGroup_HealthPercentage("splitfrigates"..i)+0.1
			    if health < 1 then
			      SobGroup_SetHealth("splitfrigates"..i, health)
			    else  
			      SobGroup_SetHealth("splitfrigates"..i, 1)
			    end   
			  else
			  end
			end      
		end		             
	end  	
	
---destroyers
  for i = 0,nd-1,1 do  	 		  
    if SobGroup_Empty("splitdestroyers"..i) == 0	then           
	---docking repair				
			if SobGroup_IsDocked("splitdestroyers"..i) == 1 then
			  if Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalDockingUpgrade3") == 1 then
			    local health = SobGroup_HealthPercentage("splitdestroyers"..i)+0.15
			    if health < 1 then
			      SobGroup_SetHealth("splitdestroyers"..i, health)
			    else  
			      SobGroup_SetHealth("splitdestroyers"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalDockingUpgrade2") == 1 then  
			    local health = SobGroup_HealthPercentage("splitdestroyers"..i)+0.1
			    if health < 1 then
			      SobGroup_SetHealth("splitdestroyers"..i, health)
			    else  
			      SobGroup_SetHealth("splitdestroyers"..i, 1)
			    end  
			  elseif Player_HasResearch(SobGroup_OwnedBy("splitdestroyers"..i), "CapitalDockingUpgrade1") == 1 then 
			    local health = SobGroup_HealthPercentage("splitdestroyers"..i)+0.05
			    if health < 1 then
			      SobGroup_SetHealth("splitdestroyers"..i, health)
			    else  
			      SobGroup_SetHealth("splitdestroyers"..i, 1)
			    end   
			  else
			  end
			end      
		end		             
	end  		
	
---collectors
  for i = 0,nrc-1,1 do  	 		  
    if SobGroup_Empty("splitresourcecollectors"..i) == 0	then           
	    if SobGroup_GetTactics("splitresourcecollectors"..i) == 2 then  	
	      if SobGroup_HealthPercentage("splitresourcecollectors"..i) <= 0.51 then	 
	        if SobGroup_IsDoingAbility("splitresourcecollectors"..i, abilityList[9]) == 0 then    	        
	          SobGroup_Clear("temp")
	          if SobGroup_FillProximitySobGroup("temp", "cdocker"..SobGroup_OwnedBy("splitresourcecollectors"..i), "splitresourcecollectors"..i, 10000) == 1 then			
	            SobGroup_DockSobGroup("splitresourcecollectors"..i, "temp")           
			      end					       
	        end  
        end   		             						  			 
			end	
		end		             
	end  
	 
end

---Disable------------------------------------------------------------

function SobGroup_Enable(Group, value)
  for i = 1,28,1 do
    SobGroup_AbilityActivate(Group, abilityList[i], value)
  end
end

---RU Update

function RUUpdate()  
---setta RU Max x tutti i giocatori  
  local playerIndex = 0                         
  while playerIndex < Universe_PlayerCount() do
    if Player_IsAlive(playerIndex) == 1 then
      if Player_HasShipWithBuildQueue(playerIndex) == 1 then      
        playerIndexList = playerIndex + 1 
        
        if ((year==0 and gametime<45) or year>0) then
	        RUList[playerIndexList] = Player_GetRU(playerIndex)
	        if RUList[playerIndexList] >= RUMaxCapacityList[playerIndexList] then
	          Player_SetRU(playerIndex, RUMaxCapacityList[playerIndexList])	
	        end 
	      end             
        	                       
      end
    end
    playerIndex = playerIndex + 1
  end    
end  

function RUUpdate1()  
  if ((year==0 and gametime<45) or year>0) then
	  UI_SetTextLabelText("ResourceMenu", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
	  UI_SetTextLabelText("UnitCapInfoPopup", "lblResourceUnits", ""..Player_GetRU( Universe_CurrentPlayer() ).."/"..RUMaxCapacityList[Universe_CurrentPlayer()+1]);
  end
end  

---Battle Arena-----------------------------------------------------------

function battlearenagm()
 
---crea presenza del giocatore, usato da pi?fasi 
  local presenza0 = 0
  local presenza1 = 0  
  if battlearena[1] >=  200 then
	  for i = 0,npsa[1]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships0" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships0" .. tostring(i), "ba, splitter, supporter, hgn_resourcecollector, vgr_resourcecollector") == 0 then
				  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships0" .. tostring(i), "ba0", 17000) == 1 then
				    presenza0 = presenza0 + 1
				  end				  
				end 
		  end  
		end 		
		for i = 0,npsa[2]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships1" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships1" .. tostring(i), "ba, splitter, supporter, hgn_resourcecollector, vgr_resourcecollector") == 0 then
				  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships1" .. tostring(i), "ba1", 17000) == 1 then
				    presenza1 = presenza1 + 1
				  end				  
				end 
		  end  
		end  	 
	end    	    
   
---ricomincia daccapo  
  if battlearena[1] >= 321 then    
    battlearena[1] = 1

---tempo per lasciare l'arena  
  elseif battlearena[1] >= 261 then   
    --FX_StartEvent("ba", "ba")    
    SobGroup_SetHardPointHealth("supporter0", "ba", 1)
    SobGroup_SetHardPointHealth("supporter1", "ba", 1) 
    Subtitle_Add(Actor_FleetIntel,"Leave the Battle Arena",1.5)
    UI_SetTextLabelText("battlearena", "timeto", ""..(321-battlearena[1]).." seconds to leave the battle arena");
    UI_SetTextLabelText("battlearena", "timeto1", ""); 	
    UI_SetTextLabelText("battlearena", "p1punteggio1", ""..presenza0);
    UI_SetTextLabelText("battlearena", "p2punteggio1", ""..presenza1);	 	    		
    battlearena[1] = battlearena[1] + 1     
    Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena")
    SobGroup_Clear("temp")
    if presenza0 == 0 and presenza1 == 0 and battlearena[1] < 318 then
      battlearena[1] = 318
    end

---battaglia  
  elseif battlearena[1] >= 260 then    
    --FX_StartEvent("ba", "ba")     
    SobGroup_SetHardPointHealth("supporter0", "ba", 0)
    SobGroup_SetHardPointHealth("supporter1", "ba", 0)    
    UI_SetTextLabelText("battlearena", "timeto", "Battle started, prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");   
    UI_SetTextLabelText("battlearena", "timeto1", "RU, Build: OFF - Time: "..battlearena[5]); 
    UI_SetTextLabelText("battlearena", "p1punteggio1", ""..presenza0);
    UI_SetTextLabelText("battlearena", "p2punteggio1", ""..presenza1);	 	    		
    if presenza0 >= 1 and presenza1 == 0 then    
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
      UI_SetScreenEnabled("battlearenamsg", 1)		
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle won by Player 1");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: -"..(battlearena[2]/1000).." Honor");				
			UI_SetTextLabelText("battlearena", "p1punteggio", ""..battlearena[3]);           					
      Player_SetRU(0, Player_GetRU(0) + battlearena[2])
      honorbonus[1] = honorbonus[1] + (battlearena[2]/500)
      honorbonus[2] = honorbonus[2] - (battlearena[2]/1000)      
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1
      battlearena[3] = battlearena[3] + 1   
      battlearena[6] = 1 
    elseif presenza0 == 0 and presenza1 >= 1 then
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")		
      UI_SetScreenEnabled("battlearenamsg", 1)
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle won by Player 2");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: -"..(battlearena[2]/1000).." Honor");		
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");			
      UI_SetTextLabelText("battlearena", "p2punteggio", ""..battlearena[4]);      
      Player_SetRU(1, Player_GetRU(1) + battlearena[2]) 
      honorbonus[2] = honorbonus[2] + (battlearena[2]/500)
      honorbonus[1] = honorbonus[1] - (battlearena[2]/1000)        
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1
      battlearena[4] = battlearena[4] + 1  
      battlearena[6] = 2        
    elseif presenza0 == 0 and presenza1 == 0 then 
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")	
      UI_SetScreenEnabled("battlearenamsg", 1)
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle not assigned, prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: -"..(battlearena[2]/1000).." Honor");
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: -"..(battlearena[2]/1000).." Honor");			
      honorbonus[2] = honorbonus[2] - (battlearena[2]/1000)
      honorbonus[1] = honorbonus[1] - (battlearena[2]/1000)        
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1       
      battlearena[6] = 0    
    elseif battlearena[5] <= 0 then      
      Sound_SpeechPlay("Data:sound/sfx/ui/sensorsmanager/worldplanewhoosh")
      UI_SetScreenEnabled("battlearenamsg", 1)
			UI_SetScreenVisible("battlearenamsg", 1)	
			UI_SetTextLabelText("battlearenamsg", "lblSubTitle", "Battle Number "..(battlearena[2]/2000));				
			UI_SetTextLabelText("battlearenamsg", "lblDescription1", "Battle not assigned, prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor");	
			UI_SetTextLabelText("battlearenamsg", "lblDescription2", "Player 1: -"..(battlearena[2]/1000).." Honor");
			UI_SetTextLabelText("battlearenamsg", "lblDescription3", "Player 2: -"..(battlearena[2]/1000).." Honor");		
      honorbonus[2] = honorbonus[2] - (battlearena[2]/1000)
      honorbonus[1] = honorbonus[1] - (battlearena[2]/1000)       
      battlearena[2] = battlearena[2] + 2000 
      battlearena[1] = battlearena[1] + 1     
      battlearena[6] = 0 	                  
    else                  
    end 
    battlearena[5] = battlearena[5] - 1

---tempo per raggiungere l'arena      
  elseif battlearena[1] >= 200 then  
    --FX_StartEvent("ba", "ba") 
    Subtitle_Add(Actor_FleetIntel,"Reach the Battle Arena",1.5)  	            	           	                      
    UI_SetTextLabelText("battlearena", "timeto", ""..(260-battlearena[1]).." seconds to reach the battle arena"); 
    UI_SetTextLabelText("battlearena", "timeto1", "");   
    UI_SetTextLabelText("battlearena", "p1punteggio1", ""..presenza0);
    UI_SetTextLabelText("battlearena", "p2punteggio1", ""..presenza1);	 	    		
    battlearena[1] = battlearena[1] + 1     
    Sound_SpeechPlay("Data:sound/speech/allships/fleet/STATUS_sirena") 
    if presenza0 == 1 and presenza1 == 1 then
      battlearena[1] = 260
    end       
		if battlearena[1] >= 260 then	
		  battlearena[5] = 200				  
		end 	 

---fase di costruzione/produzione    
  else    
    if battlearena[1] == 1 then       
      UI_SetTextLabelText("battlearena", "p1", "Player 1");
      UI_SetTextLabelText("battlearena", "p1punteggio", ""..battlearena[3]);
      UI_SetTextLabelText("battlearena", "p2", "Player 2");
      UI_SetTextLabelText("battlearena", "p2punteggio", ""..battlearena[4]);      
    end        
    UI_SetTextLabelText("battlearena", "timeto", ""..(200-battlearena[1]).." seconds to the next battle");  
    UI_SetTextLabelText("battlearena", "timeto1", "Prize: "..battlearena[2].." RUs, "..(battlearena[2]/500).." Honor"); 
    UI_SetTextLabelText("battlearena", "p1punteggio1", "");
    UI_SetTextLabelText("battlearena", "p2punteggio1", "");	 	    		 
    battlearena[1] = battlearena[1] + 1    
	--se c'?gente dentro l'arena distrugge     
    for i = 0,npsa[1]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships0" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships0" .. tostring(i), "ba, splitter, supporter") == 0 then	
					if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships0" .. tostring(i), "hgn_resourcecollector, vgr_resourcecollector") == 0 or battlearena[6] ~= 1 then			  
					  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships0" .. tostring(i), "ba0", 17000) == 1 then				    
					    SobGroup_TakeDamage("splitPlayer_Ships0" .. tostring(i), 0.1) 
					  end	
				  end				  
				end 
		  end  
		end 		
		for i = 0,npsa[2]-1,1 do
		  if SobGroup_Empty("splitPlayer_Ships1" .. tostring(i)) == 0 then
				if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships1" .. tostring(i), "ba, splitter, supporter") == 0 then	
					if SobGroup_AreAnyOfTheseTypes("splitPlayer_Ships1" .. tostring(i), "hgn_resourcecollector, vgr_resourcecollector") == 0 or battlearena[6] ~= 2 then			  
					  if SobGroup_FillProximitySobGroup ("temp", "splitPlayer_Ships1" .. tostring(i), "ba1", 17000) == 1 then				    
					    SobGroup_TakeDamage("splitPlayer_Ships1" .. tostring(i), 0.1) 
					  end	
				  end				  
				end 
		  end  
		end  	       
  end  
end  