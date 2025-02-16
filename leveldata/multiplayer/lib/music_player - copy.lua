music_data = {}
mp_play = 1
music_index = 0
mp_loop = 4
m_n = 1
m_p = 0
ms_time = 0
mp_time = 0
mt_page = 1
empty_music = "Data:sound/music/ambient/Empty"

function Player_Oninit(Music_Data)  
	music_data=Music_Data
	--UI_SetButtonPressed("MusicMenu","RandomPlayDynamic",1)	
	--UI_SetElementVisible('MusicMenu','MusicPlayType1',0)
	--UI_SetElementVisible('MusicMenu','MusicPlayType2',0)
	--UI_SetElementVisible('MusicMenu','MusicPlayType3',0)
	if GetGameRubric() ~= GR_CAMPAIGN then
		Rule_AddInterval("Play_Music", 1)
	end
	m_page = ceil(music_data.size/8)
	MusicList_Oninit()	
	UI_BindKeyEvent(F9KEY, "musicslide")
end

function Player_Oninit_AfterLoading(Music_Data)  
	music_data=Music_Data
	m_page = ceil(music_data.size/8)
	MusicList_Oninit()	
	UI_BindKeyEvent(F9KEY, "musicslide")
end

function MusicList_Oninit()  
	for i = 1,8 do
		if (i<=min(8,music_data.size-8*(mt_page-1))) then
			UI_SetElementVisible("MusicListMenu","MusicButton"..i,1)
			if (i+8*mt_page<18) then
				UI_SetTextLabelText("MusicListMenu","MusicIndex"..i,"0"..i+8*(mt_page-1))
			else
				UI_SetTextLabelText("MusicListMenu","MusicIndex"..i,""..i+8*(mt_page-1))
			end
			UI_SetTextLabelText("MusicListMenu","MusicName"..i,music_data.musics[i+8*(mt_page-1)].name)
			if (music_data.musics[i+8*(mt_page-1)].minute < 10) then
				UI_SetTextLabelText("MusicListMenu","mMinute"..i,"0"..music_data.musics[i+8*(mt_page-1)].minute)
			else
				UI_SetTextLabelText("MusicListMenu","mMinute"..i,""..music_data.musics[i+8*(mt_page-1)].minute)
			end
			if (music_data.musics[i+8*(mt_page-1)].second < 10) then
				UI_SetTextLabelText("MusicListMenu","mSecond"..i,"0"..music_data.musics[i+8*(mt_page-1)].second)
			else
				UI_SetTextLabelText("MusicListMenu","mSecond"..i,""..music_data.musics[i+8*(mt_page-1)].second)
			end
		else
			UI_SetElementVisible("MusicListMenu","MusicButton"..i,0)
		end
	end
	if (mt_page==m_page) then
		UI_SetElementEnabled("MusicListMenu","MusicNextPageButton",0)
	elseif(mt_page==1) then
		UI_SetElementEnabled("MusicListMenu","MusicPreviousPageButton",0)
	end
	if (mt_page>1) then
		UI_SetElementEnabled("MusicListMenu","MusicPreviousPageButton",1)
	end
	if (mt_page<m_page) then
		UI_SetElementEnabled("MusicListMenu","MusicNextPageButton",1)
	end	
end

function Watch_MusicMenu()
	--print("Watch_MusicMenu() running, gametime: "..Universe_GameTime())
  if Universe_GameTime() >= 42 or (intro == 1 and Universe_GameTime() >= 7) then
  	UI_BindKeyEvent(F9KEY, "musicslide")
		if (mp_play == 1) then
			local pLength = ceil(Universe_GameTime()-ms_time)
			local pMinute = floor(pLength/60)
			local pSecond = pLength-60*pMinute
			if (pMinute < 10) then
				UI_SetTextLabelText("MusicMenu","pMinute", "0"..pMinute)
			else
				UI_SetTextLabelText("MusicMenu","pMinute", ""..pMinute)
			end
			if (pSecond < 10) then
				UI_SetTextLabelText("MusicMenu","pSecond", "0"..pSecond)
			else
				UI_SetTextLabelText("MusicMenu","pSecond", ""..pSecond)
			end
			UI_SetElementSize("MusicMenu","MusicProgress", 2+ceil(196*((Universe_GameTime()-ms_time)/(mp_time-ms_time))),8)
			UI_SetElementPosition("MusicMenu","MusicProFrame",ceil(196*((Universe_GameTime()-ms_time)/(mp_time-ms_time))),0)
		else
			UI_SetTextLabelText("MusicMenu","pSecond", "00")
			UI_SetTextLabelText("MusicMenu","pMinute", "00")		
			UI_SetElementSize("MusicMenu","MusicProgress", 2,8)
			UI_SetElementPosition("MusicMenu","MusicProFrame",0,0)
		end
		if (UI_IsNamedElementVisible("MusicListMenu","MusicNextPage")==1) then
			UI_SetElementVisible("MusicListMenu","MusicNextPage",0)
			mt_page = mt_page+1
			MusicList_Oninit()
		elseif (UI_IsNamedElementVisible("MusicListMenu","MusicPreviousPage")==1) then
			UI_SetElementVisible("MusicListMenu","MusicPreviousPage",0)
			mt_page = mt_page-1
			MusicList_Oninit()
		end
		for i=1,4 do
			if (UI_IsNamedElementVisible("MusicMenu","MusicPlayType"..i)==1)and(mp_loop~=i) then
				UI_SetElementVisible("MusicMenu","MusicPlayType"..mp_loop,0)
				mp_loop = i
			end
		end
		for i=1,8 do
			if (UI_IsNamedElementVisible("MusicListMenu","PlayMusic"..i)==1) then
				UI_SetElementVisible("MusicListMenu","PlayMusic"..i,0)
				music_index = 8*(mt_page-1) + i
				Play_ParticularMusic()
			end
		end
		if (mp_play == 1) then
			if (UI_IsNamedElementVisible("MusicMenu","PlayButton")==1) then
				UI_SetElementVisible("MusicMenu","StopButton",0)
				Sound_MusicPlay(empty_music)
				Rule_Remove("Play_Music")
				Rule_Remove("Play_Music")
				mp_play = 0
			end
		elseif (UI_IsNamedElementVisible("MusicMenu","StopButton")==1) then
			UI_SetElementVisible("MusicMenu","PlayButton",0)
			Play_ParticularMusic()
			Rule_AddInterval("Play_Music", 1)
			mp_play = 1
		end
		if (UI_IsNamedElementVisible("MusicMenu","NextMusic")==1) then
			UI_SetElementVisible("MusicMenu","NextMusic",0)
			Rule_Remove("Play_Music")
			Rule_Remove("Play_Music")
			m_n = 1
			Rule_AddInterval("Play_Music", 1)
		end
		if (UI_IsNamedElementVisible("MusicMenu","PreviousMusic")==1) then
			UI_SetElementVisible("MusicMenu","PreviousMusic",0)
			Rule_Remove("Play_Music")
			Rule_Remove("Play_Music")
			m_p = 1
			Rule_AddInterval("Play_Music", 1)
		end
		for i=1,8 do
			UI_SetButtonPressed("MusicListMenu","MusicButton"..i,0)
		end
		if (music_index>8*(mt_page-1))and(music_index<=8*mt_page) then
			UI_SetButtonPressed("MusicListMenu","MusicButton"..(music_index-(mt_page-1)*8),1)
		end
	end
	Rule_Remove("Watch_MusicMenu")
end

function Play_Music()  
	if (mp_time<=Universe_GameTime())or(m_n==1)or(m_p==1) then
		if Universe_GameTime() >= 42 or (intro == 1 and Universe_GameTime() >= 7) then
			UI_BindKeyEvent(F9KEY, "musicslide")
			if (mp_loop < 3) then
				if (m_p==1) then
					if (music_index==1) then
						music_index=music_data.size
					else
						music_index=music_index-1
					end
				elseif (mp_loop == 1)or(m_n==1) then
					if (music_index==music_data.size) then
						music_index=1
					else
						music_index=music_index+1
					end
				end
			else			
        if mp_loop == 3 then	--full random
					local m_i = random(1,music_data.size)
					while (music_index==m_i) do
						m_i = random(1,music_data.size)
					end
					music_index = m_i
        else	--dynamic random
					if year >= 11 and year < 22 then		--mixed soundtracks
						local rm = random(1,10)
						if rm <= 3 then		--play ambient
							local m_i = random(music_data.ambient_start,music_data.ambient_end)
							while (music_index==m_i) do
								m_i = random(music_data.ambient_start,music_data.ambient_end)
							end
							music_index = m_i
						elseif rm <= 6 then		--play battle
							local m_i = random(music_data.battle_start,music_data.battle_end)
							while (music_index==m_i) do
								m_i = random(music_data.battle_start,music_data.battle_end)
							end
							music_index = m_i
						else		--play special
							local m_i = random(music_data.special_start,music_data.special_end)
							while (music_index==m_i) do
								m_i = random(music_data.special_start,music_data.special_end)
							end
							music_index = m_i
						end  	
					elseif year < 11 then				--dynamic beginning
						if MusicPlayer_DynamicKillDelta[Universe_CurrentPlayer()+1] / Universe_PlayerCount() >= 3 then		--fierce battle is going on, play special
							local m_i = random(music_data.special_start,music_data.special_end)
							while (music_index==m_i) do
								m_i = random(music_data.special_start,music_data.special_end)
							end
							music_index = m_i
						elseif MusicPlayer_DynamicKillDelta[Universe_CurrentPlayer()+1] >= 6 then		--moderate battle is going on, play battle
							local m_i = random(music_data.battle_start,music_data.battle_end)
							while (music_index==m_i) do
								m_i = random(music_data.battle_start,music_data.battle_end)
							end
							music_index = m_i
						else		--no obvious battle is going on, play ambient only
							local m_i = random(music_data.ambient_start,music_data.ambient_end)
							while (music_index==m_i) do
								m_i = random(music_data.ambient_start,music_data.ambient_end)
							end
							music_index = m_i
						end
					else
						local m_i = random(1,music_data.size)
						while (music_index==m_i) do
							m_i = random(1,music_data.size)
						end
						music_index = m_i
					end
        end												
			end
			if (m_n==1) then
				m_n = 0
			end
			if (m_p==1) then
				m_p = 0
			end
			Play_ParticularMusic()
		end
	end	
end

function Play_ParticularMusic()
  if Universe_GameTime() >= 42 or (intro == 1 and Universe_GameTime() >= 7) then
  	UI_BindKeyEvent(F9KEY, "musicslide")
		UI_SetElementVisible('MusicMenu','StopButton',1)
		Sound_MusicPlayType(music_data.musics[music_index].path, MUS_Ambient)
		if UI_ScreenIsActive("UnitCapInfoPopup1") == 0 then
			Subtitle_Message(music_data.musics[music_index].name.." Soundtrack, F9: Next Track", 3)
		end
		ms_time=Universe_GameTime()
		mp_time=ms_time+60*music_data.musics[music_index].minute+music_data.musics[music_index].second-1
		if (music_index<10) then
			UI_SetTextLabelText("MusicMenu","MusicIndex", "0"..music_index)
		else
			UI_SetTextLabelText("MusicMenu","MusicIndex", ""..music_index)
		end
		UI_SetTextLabelText("MusicMenu","MusicName", music_data.musics[music_index].name)
		if (music_data.musics[music_index].minute < 10) then
			UI_SetTextLabelText("MusicMenu","tMinute", "0"..music_data.musics[music_index].minute)
		else
			UI_SetTextLabelText("MusicMenu","tMinute", ""..music_data.musics[music_index].minute)
		end
		if (music_data.musics[music_index].second < 10) then
			UI_SetTextLabelText("MusicMenu","tSecond", "0"..music_data.musics[music_index].second)
		else
			UI_SetTextLabelText("MusicMenu","tSecond", ""..music_data.musics[music_index].second)
		end
	end	
  Rule_Remove("MusicMaintainAfterLoading")
  --Rule_AddInterval("MusicMaintainAfterLoading", music_data.musics[music_index].minute*60+music_data.musics[music_index].second-1)  
  Rule_RandomInterval("MusicMaintainAfterLoading", 19, 1.0)
end

function MusicMaintainAfterLoading()
  Music_Data = music_data_original
	Player_Oninit_AfterLoading(Music_Data)		--Player_Oninit(Music_Data)
	--battle stats for dynamic music player
	local NewlyKilledShips = 0
	for i = 0, Universe_PlayerCount()-1, 1 do
		NewlyKilledShips = NewlyKilledShips + Stats_TotalKills(i)
	end
	MusicPlayer_DynamicKillDelta[Universe_CurrentPlayer()+1] = NewlyKilledShips - MusicPlayer_DynamicKillLast[Universe_CurrentPlayer()+1]
	MusicPlayer_DynamicKillLast[Universe_CurrentPlayer()+1] = NewlyKilledShips
end

function musicslide()       
  UI_SetElementVisible("MusicMenu","NextMusic",1)
  Rule_Remove("musicslide")
end