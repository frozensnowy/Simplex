n_missile = {}--������Ϣ���ܣ��о���Ŀ�����ļ���������������̣��۸�����
n_missile[1] = {"fly_lightmissile","fly_missile","�Կյ���",2000,30,2}
n_missile[2] = {"MissileCancel"}
n_hd = {}--������Ϣ���ܣ��о���Ŀ�����ļ��������������������۸�,���������������ֵ����������ʱ��
n_hd[1] = {"fly_levelonehd1","fly_hd1","һ��ս������",1500,1200,0.3,10}
n_hd[2] = {"HDCancel1"}
n_weapon = {}--������Ϣ���ܣ��о���Ŀ�����ļ���������������̣��۸�����
n_weapon[1] = {"fly_fighterweapon","fly_weapon","�Կջ���MKI",1600,800,8}
n_weapon[2] = {"WeaponCancel"}
n_fighter = {}--ս����Ϣ���ܣ��о���Ŀ�����ļ���������ٶȣ����ٶȣ����ٶȣ�����ʱ��ͷ���룬����ʱ��ͷ���룬��ͷdefault���룬���������������������������ܵ�ع�������ά�޻����˹�������װ��ֵ���۸����׹�����
n_fighter[1] = {"HeavyInterceptor","Hgn_Interceptor2",100,50,100,30,50,150,6,1,7,7,300,2000,1}
n_fighter[2] = {"FighterCancel"}
n_engine = {}--�ƽ�����Ϣ����:�о���Ŀ�����������۸�
n_engine[1] = {"LevelOneEngine",20,500}
n_engine[2] = {"EngineCancel"}
n_torpedo = {}--������Ϣ���ܣ��о���Ŀ�����ļ���������������̣��۸�����
n_torpedo[1] = {"Fly_HeavyTorpedo","fly_torpedo","��������",4500,200,12}
n_torpedo[2] = {"TorpedoCancel"}
n_mine = {}--������Ϣ���ܣ��о���Ŀ�����ļ��������������������������������������������������������۸񣬵����׼۸�
n_mine[1]={"ACMine1","Fly_MineLayer1","�߱�����",8,2,6,800,40}
g_minekindsnum = 1--����������
g_missilekindsnum = 2--����������
g_weaponkindsnum = 2--����������
g_hdkindsnum = 2--����������
g_fighterkindsnum = 2--ս��������
g_enginekindsnum = 2--�ƽ���������
g_torpedokindsnum = 2--����������
player = "selecteddriving"--��ҷɴ�����SobGroup������
uni_currentplayer = 0		--Universe_CurrentPlayer()
g_player = {0, 0, 0}--�������
g_camera = {0, 0, 0}--��ͷ����
g_target = {0, 0, 0}--��Ŀ��λ��
g_auto = {0, 0, 0}--�Զ�����ʱ�Ĳ�������
g_lf = {0, 0, 0, 0}--��ͷ�뾵ͷ��λ��ľ���
g_cameraplayer = {0, 0, 0}--��ͷָ����ҷɴ��Ŀռ�����
l_index = 1--��Ŀ�����
t_r = 10--��Ŀ������sphere�İ뾶
g_defaultspeed = 0--��ҷɴ������ٶ�
g_speed = 0--��ҷɴ���ǰ�ٶ�
g_shipstats = 0--��ҷɴ�״̬
g_canattack = 1--����Ƿ��ڲ�������
g_missilenum = 0--��ҵ�����
g_torpedonum = 0--���������
g_minenum = 0--��ҿ�����
g_hdhealth = 1--��һ���ʣ������
g_hd = {"",0,"",0,0,0,0}--��һ���������ļ������Ƿ�װ�����������������۸���������������ʱ��
g_HDStats = 0--����״̬
g_missile = {}--��ҹ��ص�������Ϣ�������ļ������Ƿ���أ�����������̣��۸�����
g_missile[1] = {"",0,"",0,0,0}
g_missile[2] = {"",0,"",0,0,0}
g_missile[3] = {"",0,"",0,0,0}
g_missile[4] = {"",0,"",0,0,0}
g_missile[5] = {"",0,"",0,0,0}
g_missile[6] = {"",0,"",0,0,0}
g_missileindex = 0--�������
g_weapon={}--��ҳ���������Ϣ���ļ������Ƿ���أ�����������̣��۸�����
g_weapon[1] = {"",0,"",0,0,0}
g_fighter={0,0,0,0,0,0,0,0,0,0,0,0,0}--��ҷɴ���Ϣ������ٶȣ����ٶȣ����ٶȣ�����ʱ��ͷ���룬����ʱ��ͷ���룬��ͷdefault���룬���������������������������ܵ�ع�������ά�޻����˹�������װ��ֵ���۸����׹�����
g_engine={0,0}--����ƽ�����Ϣ���������۸�
g_torpedo = {}--��ҹ������׵���Ϣ�������ļ������Ƿ���أ�����������̣��۸�����
g_torpedo[1] = {"",0,"",0,0,0}
g_torpedoindex = 0--�������
g_mine = {"","","",0,0,0,0,0,0}--��ҿ�����Ϣ���о���Ŀ�����ļ��������������������������������������������������������۸񣬵����׼۸�
g_far = 1600--����������
g_weaponindex = 1--�������
g_hddc = 0--��һ��ܵ������
g_repairrobot = 0--���ά�޻���������
g_money = 10000--��ҽ�Ǯ
g_TotalKillsInRUs = 0--�����ɱ�м�ֵ
g_mt = 0--����or����
g_sl = 0--��Ұ���ʱ�����
g_fs = 1--����ϵͳ���
shipcandock = {}--��ͣ����ֻ�б�
shipcandock[1] = "hgn_mothership"
shipcandock[2] = "hgn_carrier"
shipcandock[3] = "hgn_battlecruiser"
shipcandock[4] = "hgn_shipyard"
shipcandock[5] = "vgr_carrier"
shipcandock[6] = "vgr_battlecruiser"
shipcandock[7] = "vgr_mothership"
shipcandock[8] = "vgr_shipyard"
shipcanbeattack = {}--�ɱ����׹�����ֻ�б�
shipcanbeattack[1] = "hgn_mothership"
shipcanbeattack[2] = "hgn_carrier"
shipcanbeattack[3] = "hgn_battlecruiser"
shipcanbeattack[4] = "hgn_shipyard"
shipcanbeattack[5] = "vgr_carrier"
shipcanbeattack[6] = "vgr_battlecruiser"
shipcanbeattack[7] = "vgr_mothership"
shipcanbeattack[8] = "vgr_shipyard"
shipcanbeattack[9] = "hgn_assaultfrigate"
shipcanbeattack[10] = "hgn_torpedofrigate"
shipcanbeattack[11] = "hgn_ioncannonfrigate"
shipcanbeattack[12] = "hgn_destroyer"
shipcanbeattack[13] = "hgn_defensefieldfrigate"
shipcanbeattack[14] = "hgn_marinefrigate"
shipcanbeattack[15] = "vgr_assaultfrigate"
shipcanbeattack[16] = "vgr_heavymissilefrigate"
shipcanbeattack[17] = "vgr_infiltratorfrigate"
shipcanbeattack[18] = "vgr_destroyer"

--���ɾ�ͷ��λ����г�ʼ�趨
function Create_Satellite()
	UI_SetScreenVisible("NewTaskbar", 0)
	UI_SetScreenVisible("ResourceMenu", 0)
	--UI_ShowScreen("DriveMenu", ePopup)
	--UI_ShowScreen("MissileMenu", ePopup)
	--UI_ShowScreen("WeaponMenu", ePopup)
	Camera_UsePanning(0)
	Sensors_EnableToggle(0)
	SobGroup_Create("location1")
	SobGroup_Create("location2")
	SobGroup_Create("location")
	Volume_AddSphere("vol_Sat1", {0, 0, 0}, 30)
	Volume_AddSphere("vol_Sat2", {1000000, 0, 0}, 30)
	Volume_AddSphere("vol_Sat3", {0, 1000000, 0}, 30)
	Volume_AddSphere("vol_Sat4", {0, 0, 1000000}, 30)
	Volume_AddSphere("location1", {0, 110000, 0}, 30)
	Volume_AddSphere("location2", {0, 0, 110000}, 30)
	SobGroup_SpawnNewShipInSobGroup(uni_currentplayer, "fly_location", "location1", "location1", "location1")
	SobGroup_SpawnNewShipInSobGroup(uni_currentplayer, "fly_location", "location2", "location2", "location2")
	SobGroup_FillUnion("location", "location1", "location2")
	Rule_Add("Despawn_Location")
	for i = 1, 4 do
		SobGroup_Create("sg_Sat"..i)
		SobGroup_SpawnNewShipInSobGroup(-1, "fly_location", "satellite", "sg_Sat"..i, "vol_Sat"..i)
		Volume_Delete("vol_Sat"..i)
	end
	for i = 0,Universe_PlayerCount()-1 do
	    SobGroup_AvoidanceIgnore("location", "Player_Ships"..i)
	end
	--SobGroup_Create("missiletarget")
	--SobGroup_Create("torpedotarget")
	--SobGroup_Create("weapontarget")
	--SobGroup_Create("selecteddriving")	--Created in interface.lua
	--SobGroup_Create("enemy")
	--SobGroup_Create("torpedoenemy")
	--SobGroup_Create("launch")
	--SobGroup_Create("dock")
	--SobGroup_Create("ets")
	--SobGroup_Create("dts")
	--SobGroup_Create("lts")
	--SobGroup_Create("tts")
	--Rule_AddInterval("Fill_Enemy",1)
	Rule_Remove("Create_Satellite")
	Rule_AddInterval("Rule_CameraGPS",0.11)
	--UI_BindKeyEvent(TKEY,"Test1")
	--UI_BindKeyEvent(YKEY,"Test2")
	--UI_BindKeyEvent(UKEY,"Test3")
	UI_UnBindKeyEvent(ESCKEY)
	UI_BindKeyEvent(ESCKEY, "exit")
end
--��Ŀ��ռ�״̬��ʼ��
function Despawn_Location()
    if (SobGroup_AreAllInRealSpace("location1") == 1) then
	SobGroup_Despawn("location1")
	Rule_Remove("Despawn_Location")
    end
end

--��λ��ͷλ�á���ͷָ����ҷɴ���������Ŀ��λ��
function Rule_CameraGPS()
	for i = 1,4 do
		g_lf[i] = Camera_GetDistanceToSobGroup("sg_Sat"..i)
	end
	for i = 1,3 do
		g_camera[i] = 500000-(g_lf[i+1]*g_lf[i+1] - g_lf[1]*g_lf[1])/2000000
	end
	g_player = SobGroup_GetPosition(player)
	for i = 1,3 do
		g_cameraplayer[i] = g_player[i] - g_camera[i]
	end
	for i = 1,3 do
		g_target[i] = g_player[i] + g_cameraplayer[i]*g_far/Camera_GetDistanceToSobGroup(player)
	end
	--Change_Location()
end

--���¼�Ŀ��λ��
function Change_Location()
	Volume_AddSphere("location", g_target, t_r)
	SobGroup_Spawn("location"..l_index, "location")
	if (l_index == 1) then
		l_index = 2
	else
		l_index = 1
	end
	SobGroup_Despawn("location"..l_index)
	Camera_FocusSobGroupWithBuffer(player, g_fighter[5], g_fighter[6], 0)
	if (g_speed/(g_fighter[1]+g_defaultspeed)<=1) then
		SobGroup_ManualEngineGlow(player, g_speed/(g_fighter[1]+g_defaultspeed))
	end
  Volume_Delete("location")
end

--������ҷɴ��ٶ�
function WatchSpeed()
	UI_UnBindKeyEvent(WKEY)
	UI_BindKeyEvent(WKEY, "drivingspeedup")
	UI_UnBindKeyEvent(SKEY)
	UI_BindKeyEvent(SKEY, "drivingslowdown")
  if (Event_IsDone("pilotspeedup")==1) and (g_speed<1) then
		g_speed = g_speed + 0.1
		if g_speed > 1 then
			g_speed = 1
		end
		SetSpeed()
  end
  if (Event_IsDone("pilotslowdown")==1) and (g_speed>0) then
		g_speed = g_speed - 0.1
		if g_speed < 0 then
			g_speed = 0
		end
		SetSpeed()
  end
end

function drivingspeedup()
	Event_Start("pilotspeedup") 
end

function drivingslowdown()
	Event_Start("pilotslowdown") 
end

--������ҷɴ��ٶ�
function SetSpeed()
  SobGroup_SetMaxSpeedMultiplier(player, g_speed)
	SobGroup_ManualEngineGlow(player, g_speed)
end

--�˳���ʻģʽ
function exit()
    --Universe_SlowDown( 0, 0)
    Camera_UsePanning(1)
    Rule_Remove("WatchSpeed")
    Rule_Remove("Rule_CameraGPS")
    --Subtitle_Message("�˳���ʻģʽ", 2)
    UI_UnBindKeyEvent(ESCKEY)
		UI_UnBindKeyEvent(WKEY)
		UI_UnBindKeyEvent(SKEY)
    SobGroup_Clear("selecteddriving")
    Sensors_EnableToggle(1)
end