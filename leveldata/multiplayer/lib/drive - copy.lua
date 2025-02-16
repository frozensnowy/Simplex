n_missile = {}--导弹信息汇总：研究项目名，文件名，中文名，射程，价格，重量
n_missile[1] = {"fly_lightmissile","fly_missile","对空导弹",2000,30,2}
n_missile[2] = {"MissileCancel"}
n_hd = {}--护盾信息汇总：研究项目名，文件名，中文名，容量，价格,护盾重启后的能量值，护盾重启时间
n_hd[1] = {"fly_levelonehd1","fly_hd1","一级战机护盾",1500,1200,0.3,10}
n_hd[2] = {"HDCancel1"}
n_weapon = {}--武器信息汇总：研究项目名，文件名，中文名，射程，价格，重量
n_weapon[1] = {"fly_fighterweapon","fly_weapon","对空机炮MKI",1600,800,8}
n_weapon[2] = {"WeaponCancel"}
n_fighter = {}--战机信息汇总：研究项目名，文件名，最大速度，加速度，减速度，开火时镜头距离，飞行时镜头距离，镜头default距离，导弹挂载数，武器挂载数，护盾电池挂载数，维修机器人挂载数，装甲值，价格，鱼雷挂载数
n_fighter[1] = {"HeavyInterceptor","Hgn_Interceptor2",100,50,100,30,50,150,6,1,7,7,300,2000,1}
n_fighter[2] = {"FighterCancel"}
n_engine = {}--推进器信息汇总:研究项目名，推力，价格
n_engine[1] = {"LevelOneEngine",20,500}
n_engine[2] = {"EngineCancel"}
n_torpedo = {}--鱼雷信息汇总：研究项目名，文件名，中文名，射程，价格，重量
n_torpedo[1] = {"Fly_HeavyTorpedo","fly_torpedo","反舰鱼雷",4500,200,12}
n_torpedo[2] = {"TorpedoCancel"}
n_mine = {}--空雷信息汇总：研究项目名，文件名，中文名，布雷器重量，单个雷重量，布雷器容量，布雷器价格，单个雷价格
n_mine[1]={"ACMine1","Fly_MineLayer1","高爆空雷",8,2,6,800,40}
g_minekindsnum = 1--空雷种类数
g_missilekindsnum = 2--导弹种类数
g_weaponkindsnum = 2--武器种类数
g_hdkindsnum = 2--护盾种类数
g_fighterkindsnum = 2--战机种类数
g_enginekindsnum = 2--推进器种类数
g_torpedokindsnum = 2--鱼雷种类数
player = "selecteddriving"--玩家飞船所在SobGroup的名字
uni_currentplayer = 0		--Universe_CurrentPlayer()
g_player = {0, 0, 0}--玩家坐标
g_camera = {0, 0, 0}--镜头坐标
g_target = {0, 0, 0}--假目标位置
g_auto = {0, 0, 0}--自动飞行时的参照坐标
g_lf = {0, 0, 0, 0}--镜头与镜头定位物的距离
g_cameraplayer = {0, 0, 0}--镜头指向玩家飞船的空间向量
l_index = 1--假目标序号
t_r = 10--假目标所在sphere的半径
g_defaultspeed = 0--玩家飞船配重速度
g_speed = 0--玩家飞船当前速度
g_shipstats = 0--玩家飞船状态
g_canattack = 1--玩家是否在操作导弹
g_missilenum = 0--玩家导弹数
g_torpedonum = 0--玩家鱼雷数
g_minenum = 0--玩家空雷数
g_hdhealth = 1--玩家护盾剩余能量
g_hd = {"",0,"",0,0,0,0}--玩家护盾情况：文件名，是否安装，中文名，容量，价格，重启能量，重启时间
g_HDStats = 0--护盾状态
g_missile = {}--玩家挂载导弹的信息：导弹文件名，是否挂载，中文名，射程，价格，重量
g_missile[1] = {"",0,"",0,0,0}
g_missile[2] = {"",0,"",0,0,0}
g_missile[3] = {"",0,"",0,0,0}
g_missile[4] = {"",0,"",0,0,0}
g_missile[5] = {"",0,"",0,0,0}
g_missile[6] = {"",0,"",0,0,0}
g_missileindex = 0--导弹序号
g_weapon={}--玩家常规武器信息：文件名，是否挂载，中文名，射程，价格，重量
g_weapon[1] = {"",0,"",0,0,0}
g_fighter={0,0,0,0,0,0,0,0,0,0,0,0,0}--玩家飞船信息：最大速度，加速度，减速度，开火时镜头距离，飞行时镜头距离，镜头default距离，导弹挂载数，武器挂载数，护盾电池挂载数，维修机器人挂载数，装甲值，价格，鱼雷挂载数
g_engine={0,0}--玩家推进器信息：推力，价格
g_torpedo = {}--玩家挂载鱼雷的信息：导弹文件名，是否挂载，中文名，射程，价格，重量
g_torpedo[1] = {"",0,"",0,0,0}
g_torpedoindex = 0--鱼雷序号
g_mine = {"","","",0,0,0,0,0,0}--玩家空雷信息：研究项目名，文件名，中文名，布雷器重量，单个雷重量，布雷器容量，布雷器价格，单个雷价格
g_far = 1600--武器最近射程
g_weaponindex = 1--武器序号
g_hddc = 0--玩家护盾电池数量
g_repairrobot = 0--玩家维修机器人数量
g_money = 10000--玩家金钱
g_TotalKillsInRUs = 0--玩家总杀敌价值
g_mt = 0--导弹or鱼雷
g_sl = 0--玩家按键时长检测
g_fs = 1--飞行系统标号
shipcandock = {}--可停泊船只列表
shipcandock[1] = "hgn_mothership"
shipcandock[2] = "hgn_carrier"
shipcandock[3] = "hgn_battlecruiser"
shipcandock[4] = "hgn_shipyard"
shipcandock[5] = "vgr_carrier"
shipcandock[6] = "vgr_battlecruiser"
shipcandock[7] = "vgr_mothership"
shipcandock[8] = "vgr_shipyard"
shipcanbeattack = {}--可被鱼雷攻击船只列表
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

--生成镜头定位物、进行初始设定
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
--假目标空间状态初始化
function Despawn_Location()
    if (SobGroup_AreAllInRealSpace("location1") == 1) then
	SobGroup_Despawn("location1")
	Rule_Remove("Despawn_Location")
    end
end

--定位镜头位置、镜头指向玩家飞船的向量及目标位置
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

--更新假目标位置
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

--监视玩家飞船速度
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

--更新玩家飞船速度
function SetSpeed()
  SobGroup_SetMaxSpeedMultiplier(player, g_speed)
	SobGroup_ManualEngineGlow(player, g_speed)
end

--退出驾驶模式
function exit()
    --Universe_SlowDown( 0, 0)
    Camera_UsePanning(1)
    Rule_Remove("WatchSpeed")
    Rule_Remove("Rule_CameraGPS")
    --Subtitle_Message("退出驾驶模式", 2)
    UI_UnBindKeyEvent(ESCKEY)
		UI_UnBindKeyEvent(WKEY)
		UI_UnBindKeyEvent(SKEY)
    SobGroup_Clear("selecteddriving")
    Sensors_EnableToggle(1)
end