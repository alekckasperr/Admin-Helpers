#CommentFlag ;
global AUTOSAMP_VERSION := 1.6

global GTA_CPED_PTR := 0xB6F5F0
global GTA_VEHICLE_PTR := 0xBA18FC

global SAMP_MAX_PLAYERS := 1004
global SAMP_MAX_VEHICLES := 2000
global SERVER_SPEED_KOEFF := 1.425
global SAMP_MAX_TEXTLABELS := 2048
global SAMP_MAX_OBJECTS := 1000
global SAMP_MAX_PICKUPS := 4096
global SAMP_MAX_GANGZONES := 1024
global SAMP_MAX_TEXTDRAWS := 2048
global SAMP_MAX_PLAYERTEXTDRAWS	:= 256

global SAMP_CNETGAME := [0x26E8DC]
    global SAMP_CNETGAME_HOSTADDRESS := [0x30]
    global SAMP_CNETGAME_HOSTNAME := [0x131]
    global SAMP_CNETGAME_PORT := [0x235]
    global SAMP_CNETGAME_LASTCONNECTATTEMPT := [0x3D1]
	global SAMP_CNETGAME_GAMESTATE := [0x3CD]
    global SAMP_CNETGAME_UPDATEPLAYERS := [0x8BA0]
	global SAMP_CNETGAME_RESTART := [0xA1E0]

global SAMP_CAUDIOSTREAM := [0x12E68C]
    global SAMP_CAUDIOSTREAM_STOP := [0x65DF0]
    global SAMP_CAUDIOSTREAM_PLAY := [0x661F0]

global SAMP_CCHAT := [0x26E8C8]
    global SAMP_CCHAT_PAGESIZE := [0x0]
    global SAMP_CCHAT_LOGPATH := [0x11]
    global SAMP_CCHAT_ENTRY_TEXT := [0x152]
    global SAMP_CCHAT_ENTRY_SIZE := [0xFC]
    global SAMP_CCHAT_SETPAGESIZE := [0x66B20]
    global SAMP_CCHAT_LOG := [0x67050]
    global SAMP_CCHAT_ADDENTRY := [0x67460]
	global SAMP_CCHAT_PAGEUP := [0x66B50]
	global SAMP_CCHAT_PAGEDOWN := [0x66BB0]
	global SAMP_CCHAT_SCROLL := [0x66C40]

global SAMP_CCHAT_EDITBOX := [0x26E8F4]
    global SAMP_CCHAT_EDITBOX_OFF := [0x61]

global SAMP_CINPUT := [0x26E8CC]
    global SAMP_CINPUT_SEND := [0x69190]
    global SAMP_CINPUT_INPUT := [0x1565]
    global SAMP_CINPUT_CLOSE := [0x68E10]
    global SAMP_CINPUT_OPEN := [0x68D10]

global SAMP_CLOCALPLAYER := [0x4A80]
    global SAMP_CLOCALPLAYER_CURRENTVEHICLE := [0xFC]
    global SAMP_CLOCALPLAYER_LASTVEHICLE := [0xFE]
    global SAMP_CLOCALPLAYER_CHAT := [0x5820]

global SAMP_CHATINPUT := [0x141A78]
global SAMP_USERNAME := [0x26E03F]

global SAMP_CDIALOG := [0x26E898]
    global SAMP_CDIALOG_POSITION := [0x4]
    global SAMP_CDIALOG_LISTBOX := [0x20]
        global SAMP_CDIALOG_LISTBOX_INDEX := [0x143]
    global SAMP_CDIALOG_ISACTIVE := [0x28]
    global SAMP_CDIALOG_TYPE := [0x2C]
    global SAMP_CDIALOG_ID := [0x30]
    global SAMP_CDIALOG_TEXT := [0x34]
    global SAMP_CDIALOG_CAPTION := [0x40]
    global SAMP_CDIALOG_HIDE := [0x6F110]
    global SAMP_CDIALOG_SHOW := [0x6F8C0]
    global SAMP_CDIALOG_CLOSE := [0x6FF40]

global SAMP_CSCOREBOARD := [0x26E894]
    global SAMP_CSCOREBOARD_ISENABLED := [0x0]
    global SAMP_CSCOREBOARD_CLOSE := [0x6E270]
    global SAMP_CSCOREBOARD_ENABLE := [0x6EC80]

global SAMP_POOLS := [0x3DE]
    global SAMP_POOLS_PLAYER := [0x8]
    global SAMP_POOLS_VEHICLE := [0xC]
    global SAMP_POOLS_TEXTLABEL := [0x1C]
    global SAMP_POOLS_PICKUP := [0x10]
    global SAMP_POOLS_OBJECT := [0x14]
	global SAMP_POOLS_GANGZONE := [0x18]
	global SAMP_POOLS_TEXTDRAW := [0x20]
        global SAMP_POOLS_PLAYER_LARGESTID := [0x0]
        global SAMP_POOLS_PLAYER_LOCALPLAYER_PING := [0x2F14]
        global SAMP_POOLS_PLAYER_LOCALPLAYER_SCORE := [0x2F18]
        global SAMP_POOLS_PLAYER_LOCALPLAYER_ID := [0x2F1C]
        global SAMP_POOLS_PLAYER_LOCALPLAYER_DATA := [0x2F3A]
            global SAMP_POOLS_PLAYER_LOCALPLAYER_DATA_ANIMATION := [0x100]
        global SAMP_POOLS_PLAYER_REMOTEPLAYER := [0x4]
            global SAMP_POOLS_PLAYER_REMOTEPLAYER_SCORE := [0x24]
            global SAMP_POOLS_PLAYER_REMOTEPLAYER_PING := [0x4]
            global SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK := [0xC]
            global SAMP_POOLS_PLAYER_REMOTEPLAYER_SIZE := [0x1C]
            global SAMP_POOLS_PLAYER_REMOTEPLAYER_DATA := [0x0]
			global SAMP_POOLS_PLAYER_REMOTEPLAYER_ISNPC := [0x28]

global SAMP_CGAME := [0x26E8F4]
    global SAMP_CGAME_RACECHECKPOINT_POSITION := [0xC]
    global SAMP_CGAME_RACECHECKPOINT_SIZE := [0x24]
    global SAMP_CGAME_RACECHECKPOINT_TYPE := [0x28]
    global SAMP_CGAME_RACECHECKPOINT_ENABLED := [0x29]
    global SAMP_CGAME_CHECKPOINT_POSITION := [0x38]
    global SAMP_CGAME_CHECKPOINT_SIZE := [0x44]
    global SAMP_CGAME_CHECKPOINT_ENABLED := [0x50]
    global SAMP_CGAME_DISPLAYGAMETEXT := [0xA05D0]
    global SAMP_CGAME_SETRACINGCHECKPOINT := [0xA19D0]
	global SAMP_CGAME_SETCURSORMODE := [0x9FFE0]
	global SAMP_CGAME_ENABLEHUD := [0xA1680]

global SAMP_CREMOTEPLAYER_VEHICLEID := [0xA]
global SAMP_CREMOTEPLAYER_INCARTARGEDPOSITION := [0x12C]
global SAMP_CREMOTEPLAYER_TEAM := [0x109]

global SAMP_CPED_ADDACCESSORY := [0xB0280]

global GAMESTATE_WAIT_CONNECT 		:= 9
global GAMESTATE_CONNECTING 		:= 13
global GAMESTATE_AWAIT_JOIN 		:= 15
global GAMESTATE_CONNECTED 			:= 14
global GAMESTATE_RESTARTING 		:= 18

global FIGHT_STYLE_NORMAL 			:= 4
global FIGHT_STYLE_BOXING 			:= 5
global FIGHT_STYLE_KUNGFU 			:= 6
global FIGHT_STYLE_KNEEHEAD 		:= 7
global FIGHT_STYLE_GRABKICK 		:= 15
global FIGHT_STYLE_ELBOW 			:= 16

global DIALOG_STYLE_MSGBOX			        := 0
global DIALOG_STYLE_INPUT 			        := 1
global DIALOG_STYLE_LIST			        := 2
global DIALOG_STYLE_PASSWORD		        := 3
global DIALOG_STYLE_TABLIST			        := 4
global DIALOG_STYLE_TABLIST_HEADERS	        := 5

global DIALOG_COLOR_WHITE     := "{FFFFFF}"
global DIALOG_COLOR_GREEN     := "{6EF83C}"
global DIALOG_COLOR_RED       := "{F81414}"
global DIALOG_COLOR_EASY      := "{FFF1AF}"
global DIALOG_COLOR_BLACK     := "{0E0101}"
global DIALOG_COLOR_GREY      := "{C3C3C3}"
global DIALOG_COLOR_YELLOW    := "{F3FF02}"
global DIALOG_COLOR_ORANGE    := "{FFAF00}"
global DIALOG_COLOR_LIME      := "{B7FF00}"
global DIALOG_COLOR_CYAN   	  := "{00FFEE}"
global DIALOG_COLOR_LIGHTBLUE := "{00C0FF}"
global DIALOG_COLOR_BLUE      := "{0049FF}"
global DIALOG_COLOR_MAGENTA   := "{F300FF}"
global DIALOG_COLOR_VIOLET    := "{B700FF}"
global DIALOG_COLOR_PINK      := "{FF00EA}"
global DIALOG_COLOR_MARONE    := "{A90202}"
global DIALOG_COLOR_CMD       := "{B8FF02}"
global DIALOG_COLOR_PARAM     := "{3FCD02}"
global DIALOG_COLOR_SERVER    := "{AFE7FF}"
        

global ERROR_OK								:=	0
global ERROR_PROCESS_NOT_FOUND				:=	1
global ERROR_OPEN_PROCESS					:=	2
global ERROR_INVALID_HANDLE					:=	3
global ERROR_MODULE_NOT_FOUND				:=	4
global ERROR_ENUM_PROCESS_MODULES			:=	5
global ERROR_ZONE_NOT_FOUND					:=	6
global ERROR_CITY_NOT_FOUND					:=	7
global ERROR_READ_MEMORY					:=	8
global ERROR_WRITE_MEMORY					:=	9
global ERROR_ALLOC_MEMORY					:=	10
global ERROR_FREE_MEMORY					:=	11
global ERROR_WAIT_FOR_OBJECT				:=	12
global ERROR_CREATE_THREAD					:=	13

global datatypes := {"Int64" : 8, "Double" : 8, "UInt" : 4, "Int" : 4, "Float" : 4, "Ptr" : 4, "UPtr" : 4, "UShort" : 2, "Short" : 2, "Char" : 1, "UChar" : 1, "Byte" : 1}

global scoreboardTick 						:= 0
global playerTick							:= 0
global oPlayers								:= ""
global vehicleTick							:= 0
global oVehicles							:= ""
global textLabelTick						:= 0
global oTextLabels							:= []
global objectTick							:= 0
global oObjects								:= []
global pickupTick							:= 0
global oPickups								:= []
global gangZoneTick 						:= 0
global oGangzones 							:= []
global textDrawTick							:= 0
global oTextDraws							:= []

global oWeaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo"
	,"Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","Desert Eagle","Shotgun","Sawnoff Shotgun"
	,"Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator"
	,"Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]

global cities := []
cities.Push(Object("NAME", "Las Venturas", "X1", 685.0, "Y1", 476.093, "X2", 3000.0, "Y2", 3000.0))
cities.Push(Object("NAME", "San Fierro", "X1", -3000.0, "Y1", -742.306, "X2", -1270.53, "Y2", 1530.24))
cities.Push(Object("NAME", "San Fierro", "X1", -1270.53, "Y1", -402.481, "X2", -1038.45, "Y2", 832.495))
cities.Push(Object("NAME", "San Fierro", "X1", -1038.45, "Y1", -145.539, "X2", -897.546, "Y2", 376.632))
cities.Push(Object("NAME", "Los Santos", "X1", 480.0, "Y1", -3000.0, "X2", 3000.0, "Y2", -850.0))
cities.Push(Object("NAME", "Los Santos", "X1", 80.0, "Y1", -2101.61, "X2", 1075.0, "Y2", -1239.61))
cities.Push(Object("NAME", "Tierra Robada", "X1", -1213.91, "Y1", 596.349, "X2", -480.539, "Y2", 1659.68))
cities.Push(Object("NAME", "Red County", "X1", -1213.91, "Y1", -768.027, "X2", 2997.06, "Y2", 596.349))
cities.Push(Object("NAME", "Flint County", "X1", -1213.91, "Y1", -2892.97, "X2", 44.6147, "Y2", -768.027))
cities.Push(Object("NAME", "Whetstone", "X1", -2997.47, "Y1", -2892.97, "X2", -1213.91, "Y2", -1115.58))

global zones := []
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2667.810, "Y1", -302.135, "X2", -2646.400, "Y2", -262.320))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1315.420, "Y1", -405.388, "X2", -1264.400, "Y2", -209.543))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2550.040, "Y1", -355.493, "X2", -2470.040, "Y2", -318.493))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1490.330, "Y1", -209.543, "X2", -1264.400, "Y2", -148.388))
zones.Push(Object("NAME", "Garcia", "X1", -2395.140, "Y1", -222.589, "X2", -2354.090, "Y2", -204.792))
zones.Push(Object("NAME", "Shady Cabin", "X1", -1632.830, "Y1", -2263.440, "X2", -1601.330, "Y2", -2231.790))
zones.Push(Object("NAME", "East Los Santos", "X1", 2381.680, "Y1", -1494.030, "X2", 2421.030, "Y2", -1454.350))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1236.630, "Y1", 1163.410, "X2", 1277.050, "Y2", 1203.280))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1277.050, "Y1", 1044.690, "X2", 1315.350, "Y2", 1087.630))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2470.040, "Y1", -355.493, "X2", -2270.040, "Y2", -318.493))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -926.999, "X2", 1357.000, "Y2", -910.170))
zones.Push(Object("NAME", "Unity Station", "X1", 1692.620, "Y1", -1971.800, "X2", 1812.620, "Y2", -1932.800))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1315.350, "Y1", 1044.690, "X2", 1375.600, "Y2", 1087.630))
zones.Push(Object("NAME", "Los Flores", "X1", 2581.730, "Y1", -1454.350, "X2", 2632.830, "Y2", -1393.420))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2437.390, "Y1", 1858.100, "X2", 2495.090, "Y2", 1970.850))
zones.Push(Object("NAME", "Easter Bay Chemicals", "X1", -1132.820, "Y1", -787.391, "X2", -956.476, "Y2", -768.027))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1370.850, "Y1", -1170.870, "X2", 1463.900, "Y2", -1130.850))
zones.Push(Object("NAME", "Esplanade East", "X1", -1620.300, "Y1", 1176.520, "X2", -1580.010, "Y2", 1274.260))
zones.Push(Object("NAME", "Market Station", "X1", 787.461, "Y1", -1410.930, "X2", 866.009, "Y2", -1310.210))
zones.Push(Object("NAME", "Linden Station", "X1", 2811.250, "Y1", 1229.590, "X2", 2861.250, "Y2", 1407.590))
zones.Push(Object("NAME", "Montgomery Intersection", "X1", 1582.440, "Y1", 347.457, "X2", 1664.620, "Y2", 401.750))
zones.Push(Object("NAME", "Frederick Bridge", "X1", 2759.250, "Y1", 296.501, "X2", 2774.250, "Y2", 594.757))
zones.Push(Object("NAME", "Yellow Bell Station", "X1", 1377.480, "Y1", 2600.430, "X2", 1492.450, "Y2", 2687.360))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1507.510, "Y1", -1385.210, "X2", 1582.550, "Y2", -1325.310))
zones.Push(Object("NAME", "Jefferson", "X1", 2185.330, "Y1", -1210.740, "X2", 2281.450, "Y2", -1154.590))
zones.Push(Object("NAME", "Mulholland", "X1", 1318.130, "Y1", -910.170, "X2", 1357.000, "Y2", -768.027))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2361.510, "Y1", -417.199, "X2", -2270.040, "Y2", -355.493))
zones.Push(Object("NAME", "Jefferson", "X1", 1996.910, "Y1", -1449.670, "X2", 2056.860, "Y2", -1350.720))
zones.Push(Object("NAME", "Julius Thruway West", "X1", 1236.630, "Y1", 2142.860, "X2", 1297.470, "Y2", 2243.230))
zones.Push(Object("NAME", "Jefferson", "X1", 2124.660, "Y1", -1494.030, "X2", 2266.210, "Y2", -1449.670))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1848.400, "Y1", 2478.490, "X2", 1938.800, "Y2", 2553.490))
zones.Push(Object("NAME", "Rodeo", "X1", 422.680, "Y1", -1570.200, "X2", 466.223, "Y2", -1406.050))
zones.Push(Object("NAME", "Cranberry Station", "X1", -2007.830, "Y1", 56.306, "X2", -1922.000, "Y2", 224.782))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1391.050, "Y1", -1026.330, "X2", 1463.900, "Y2", -926.999))
zones.Push(Object("NAME", "Redsands West", "X1", 1704.590, "Y1", 2243.230, "X2", 1777.390, "Y2", 2342.830))
zones.Push(Object("NAME", "Little Mexico", "X1", 1758.900, "Y1", -1722.260, "X2", 1812.620, "Y2", -1577.590))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1375.600, "Y1", 823.228, "X2", 1457.390, "Y2", 919.447))
zones.Push(Object("NAME", "Los Santos International", "X1", 1974.630, "Y1", -2394.330, "X2", 2089.000, "Y2", -2256.590))
zones.Push(Object("NAME", "Beacon Hill", "X1", -399.633, "Y1", -1075.520, "X2", -319.033, "Y2", -977.516))
zones.Push(Object("NAME", "Rodeo", "X1", 334.503, "Y1", -1501.950, "X2", 422.680, "Y2", -1406.050))
zones.Push(Object("NAME", "Richman", "X1", 225.165, "Y1", -1369.620, "X2", 334.503, "Y2", -1292.070))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1724.760, "Y1", -1250.900, "X2", 1812.620, "Y2", -1150.870))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 1703.230, "X2", 2137.400, "Y2", 1783.230))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1378.330, "Y1", -1130.850, "X2", 1463.900, "Y2", -1026.330))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1197.390, "Y1", 1044.690, "X2", 1277.050, "Y2", 1163.390))
zones.Push(Object("NAME", "Conference Center", "X1", 1073.220, "Y1", -1842.270, "X2", 1323.900, "Y2", -1804.210))
zones.Push(Object("NAME", "Montgomery", "X1", 1451.400, "Y1", 347.457, "X2", 1582.440, "Y2", 420.802))
zones.Push(Object("NAME", "Foster Valley", "X1", -2270.040, "Y1", -430.276, "X2", -2178.690, "Y2", -324.114))
zones.Push(Object("NAME", "Blackfield Chapel", "X1", 1325.600, "Y1", 596.349, "X2", 1375.600, "Y2", 795.010))
zones.Push(Object("NAME", "Los Santos International", "X1", 2051.630, "Y1", -2597.260, "X2", 2152.450, "Y2", -2394.330))
zones.Push(Object("NAME", "Mulholland", "X1", 1096.470, "Y1", -910.170, "X2", 1169.130, "Y2", -768.027))
zones.Push(Object("NAME", "Yellow Bell Gol Course", "X1", 1457.460, "Y1", 2723.230, "X2", 1534.560, "Y2", 2863.230))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 1783.230, "X2", 2162.390, "Y2", 1863.230))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1210.740, "X2", 2185.330, "Y2", -1126.320))
zones.Push(Object("NAME", "Mulholland", "X1", 952.604, "Y1", -937.184, "X2", 1096.470, "Y2", -860.619))
zones.Push(Object("NAME", "Aldea Malvada", "X1", -1372.140, "Y1", 2498.520, "X2", -1277.590, "Y2", 2615.350))
zones.Push(Object("NAME", "Las Colinas", "X1", 2126.860, "Y1", -1126.320, "X2", 2185.330, "Y2", -934.489))
zones.Push(Object("NAME", "Las Colinas", "X1", 1994.330, "Y1", -1100.820, "X2", 2056.860, "Y2", -920.815))
zones.Push(Object("NAME", "Richman", "X1", 647.557, "Y1", -954.662, "X2", 768.694, "Y2", -860.619))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1277.050, "Y1", 1087.630, "X2", 1375.600, "Y2", 1203.280))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1377.390, "Y1", 2433.230, "X2", 1534.560, "Y2", 2507.230))
zones.Push(Object("NAME", "Willowfield", "X1", 2201.820, "Y1", -2095.000, "X2", 2324.000, "Y2", -1989.900))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1704.590, "Y1", 2342.830, "X2", 1848.400, "Y2", 2433.230))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -1130.850, "X2", 1378.330, "Y2", -1026.330))
zones.Push(Object("NAME", "Little Mexico", "X1", 1701.900, "Y1", -1842.270, "X2", 1812.620, "Y2", -1722.260))
zones.Push(Object("NAME", "Queens", "X1", -2411.220, "Y1", 373.539, "X2", -2253.540, "Y2", 458.411))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1515.810, "Y1", 1586.400, "X2", 1729.950, "Y2", 1714.560))
zones.Push(Object("NAME", "Richman", "X1", 225.165, "Y1", -1292.070, "X2", 466.223, "Y2", -1235.070))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -1026.330, "X2", 1391.050, "Y2", -926.999))
zones.Push(Object("NAME", "East Los Santos", "X1", 2266.260, "Y1", -1494.030, "X2", 2381.680, "Y2", -1372.040))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2623.180, "Y1", 943.235, "X2", 2749.900, "Y2", 1055.960))
zones.Push(Object("NAME", "Willowfield", "X1", 2541.700, "Y1", -1941.400, "X2", 2703.580, "Y2", -1852.870))
zones.Push(Object("NAME", "Las Colinas", "X1", 2056.860, "Y1", -1126.320, "X2", 2126.860, "Y2", -920.815))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2625.160, "Y1", 2202.760, "X2", 2685.160, "Y2", 2442.550))
zones.Push(Object("NAME", "Rodeo", "X1", 225.165, "Y1", -1501.950, "X2", 334.503, "Y2", -1369.620))
zones.Push(Object("NAME", "Las Brujas", "X1", -365.167, "Y1", 2123.010, "X2", -208.570, "Y2", 2217.680))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2536.430, "Y1", 2442.550, "X2", 2685.160, "Y2", 2542.550))
zones.Push(Object("NAME", "Rodeo", "X1", 334.503, "Y1", -1406.050, "X2", 466.223, "Y2", -1292.070))
zones.Push(Object("NAME", "Vinewood", "X1", 647.557, "Y1", -1227.280, "X2", 787.461, "Y2", -1118.280))
zones.Push(Object("NAME", "Rodeo", "X1", 422.680, "Y1", -1684.650, "X2", 558.099, "Y2", -1570.200))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2498.210, "Y1", 2542.550, "X2", 2685.160, "Y2", 2626.550))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1724.760, "Y1", -1430.870, "X2", 1812.620, "Y2", -1250.900))
zones.Push(Object("NAME", "Rodeo", "X1", 225.165, "Y1", -1684.650, "X2", 312.803, "Y2", -1501.950))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1449.670, "X2", 2266.210, "Y2", -1372.040))
zones.Push(Object("NAME", "Hampton Barns", "X1", 603.035, "Y1", 264.312, "X2", 761.994, "Y2", 366.572))
zones.Push(Object("NAME", "Temple", "X1", 1096.470, "Y1", -1130.840, "X2", 1252.330, "Y2", -1026.330))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1087.930, "Y1", 855.370, "X2", -961.950, "Y2", 986.281))
zones.Push(Object("NAME", "Verona Beach", "X1", 1046.150, "Y1", -1722.260, "X2", 1161.520, "Y2", -1577.590))
zones.Push(Object("NAME", "Commerce", "X1", 1323.900, "Y1", -1722.260, "X2", 1440.900, "Y2", -1577.590))
zones.Push(Object("NAME", "Mulholland", "X1", 1357.000, "Y1", -926.999, "X2", 1463.900, "Y2", -768.027))
zones.Push(Object("NAME", "Rodeo", "X1", 466.223, "Y1", -1570.200, "X2", 558.099, "Y2", -1385.070))
zones.Push(Object("NAME", "Mulholland", "X1", 911.802, "Y1", -860.619, "X2", 1096.470, "Y2", -768.027))
zones.Push(Object("NAME", "Mulholland", "X1", 768.694, "Y1", -954.662, "X2", 952.604, "Y2", -860.619))
zones.Push(Object("NAME", "Julius Thruway South", "X1", 2377.390, "Y1", 788.894, "X2", 2537.390, "Y2", 897.901))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1852.870, "X2", 1971.660, "Y2", -1742.310))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2089.000, "Y1", -2394.330, "X2", 2201.820, "Y2", -2235.840))
zones.Push(Object("NAME", "Commerce", "X1", 1370.850, "Y1", -1577.590, "X2", 1463.900, "Y2", -1384.950))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2121.400, "Y1", 2508.230, "X2", 2237.400, "Y2", 2663.170))
zones.Push(Object("NAME", "Temple", "X1", 1096.470, "Y1", -1026.330, "X2", 1252.330, "Y2", -910.170))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1449.670, "X2", 1996.910, "Y2", -1350.720))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1242.980, "Y1", -50.096, "X2", -1213.910, "Y2", 578.396))
zones.Push(Object("NAME", "Martin Bridge", "X1", -222.179, "Y1", 293.324, "X2", -122.126, "Y2", 476.465))
zones.Push(Object("NAME", "The Strip", "X1", 2106.700, "Y1", 1863.230, "X2", 2162.390, "Y2", 2202.760))
zones.Push(Object("NAME", "Willowfield", "X1", 2541.700, "Y1", -2059.230, "X2", 2703.580, "Y2", -1941.400))
zones.Push(Object("NAME", "Marina", "X1", 807.922, "Y1", -1577.590, "X2", 926.922, "Y2", -1416.250))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1457.370, "Y1", 1143.210, "X2", 1777.400, "Y2", 1203.280))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1742.310, "X2", 1951.660, "Y2", -1602.310))
zones.Push(Object("NAME", "Esplanade East", "X1", -1580.010, "Y1", 1025.980, "X2", -1499.890, "Y2", 1274.260))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1370.850, "Y1", -1384.950, "X2", 1463.900, "Y2", -1170.870))
zones.Push(Object("NAME", "The Mako Span", "X1", 1664.620, "Y1", 401.750, "X2", 1785.140, "Y2", 567.203))
zones.Push(Object("NAME", "Rodeo", "X1", 312.803, "Y1", -1684.650, "X2", 422.680, "Y2", -1501.950))
zones.Push(Object("NAME", "Pershing Square", "X1", 1440.900, "Y1", -1722.260, "X2", 1583.500, "Y2", -1577.590))
zones.Push(Object("NAME", "Mulholland", "X1", 687.802, "Y1", -860.619, "X2", 911.802, "Y2", -768.027))
zones.Push(Object("NAME", "Gant Bridge", "X1", -2741.070, "Y1", 1490.470, "X2", -2616.400, "Y2", 1659.680))
zones.Push(Object("NAME", "Las Colinas", "X1", 2185.330, "Y1", -1154.590, "X2", 2281.450, "Y2", -934.489))
zones.Push(Object("NAME", "Mulholland", "X1", 1169.130, "Y1", -910.170, "X2", 1318.130, "Y2", -768.027))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1938.800, "Y1", 2508.230, "X2", 2121.400, "Y2", 2624.230))
zones.Push(Object("NAME", "Commerce", "X1", 1667.960, "Y1", -1577.590, "X2", 1812.620, "Y2", -1430.870))
zones.Push(Object("NAME", "Rodeo", "X1", 72.648, "Y1", -1544.170, "X2", 225.165, "Y2", -1404.970))
zones.Push(Object("NAME", "Roca Escalante", "X1", 2536.430, "Y1", 2202.760, "X2", 2625.160, "Y2", 2442.550))
zones.Push(Object("NAME", "Rodeo", "X1", 72.648, "Y1", -1684.650, "X2", 225.165, "Y2", -1544.170))
zones.Push(Object("NAME", "Market", "X1", 952.663, "Y1", -1310.210, "X2", 1072.660, "Y2", -1130.850))
zones.Push(Object("NAME", "Las Colinas", "X1", 2632.740, "Y1", -1135.040, "X2", 2747.740, "Y2", -945.035))
zones.Push(Object("NAME", "Mulholland", "X1", 861.085, "Y1", -674.885, "X2", 1156.550, "Y2", -600.896))
zones.Push(Object("NAME", "King's", "X1", -2253.540, "Y1", 373.539, "X2", -1993.280, "Y2", 458.411))
zones.Push(Object("NAME", "Redsands East", "X1", 1848.400, "Y1", 2342.830, "X2", 2011.940, "Y2", 2478.490))
zones.Push(Object("NAME", "Downtown", "X1", -1580.010, "Y1", 744.267, "X2", -1499.890, "Y2", 1025.980))
zones.Push(Object("NAME", "Conference Center", "X1", 1046.150, "Y1", -1804.210, "X2", 1323.900, "Y2", -1722.260))
zones.Push(Object("NAME", "Richman", "X1", 647.557, "Y1", -1118.280, "X2", 787.461, "Y2", -954.662))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", 277.411, "X2", -2867.850, "Y2", 458.411))
zones.Push(Object("NAME", "Greenglass College", "X1", 964.391, "Y1", 930.890, "X2", 1166.530, "Y2", 1044.690))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1100.820, "X2", 1994.330, "Y2", -973.380))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1375.600, "Y1", 919.447, "X2", 1457.370, "Y2", 1203.280))
zones.Push(Object("NAME", "Regular Tom", "X1", -405.770, "Y1", 1712.860, "X2", -276.719, "Y2", 1892.750))
zones.Push(Object("NAME", "Verona Beach", "X1", 1161.520, "Y1", -1722.260, "X2", 1323.900, "Y2", -1577.590))
zones.Push(Object("NAME", "East Los Santos", "X1", 2281.450, "Y1", -1372.040, "X2", 2381.680, "Y2", -1135.040))
zones.Push(Object("NAME", "Caligula's Palace", "X1", 2137.400, "Y1", 1703.230, "X2", 2437.390, "Y2", 1783.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1951.660, "Y1", -1742.310, "X2", 2124.660, "Y2", -1602.310))
zones.Push(Object("NAME", "Pilgrim", "X1", 2624.400, "Y1", 1383.230, "X2", 2685.160, "Y2", 1783.230))
zones.Push(Object("NAME", "Idlewood", "X1", 2124.660, "Y1", -1742.310, "X2", 2222.560, "Y2", -1494.030))
zones.Push(Object("NAME", "Queens", "X1", -2533.040, "Y1", 458.411, "X2", -2329.310, "Y2", 578.396))
zones.Push(Object("NAME", "Downtown", "X1", -1871.720, "Y1", 1176.420, "X2", -1620.300, "Y2", 1274.260))
zones.Push(Object("NAME", "Commerce", "X1", 1583.500, "Y1", -1722.260, "X2", 1758.900, "Y2", -1577.590))
zones.Push(Object("NAME", "East Los Santos", "X1", 2381.680, "Y1", -1454.350, "X2", 2462.130, "Y2", -1135.040))
zones.Push(Object("NAME", "Marina", "X1", 647.712, "Y1", -1577.590, "X2", 807.922, "Y2", -1416.250))
zones.Push(Object("NAME", "Richman", "X1", 72.648, "Y1", -1404.970, "X2", 225.165, "Y2", -1235.070))
zones.Push(Object("NAME", "Vinewood", "X1", 647.712, "Y1", -1416.250, "X2", 787.461, "Y2", -1227.280))
zones.Push(Object("NAME", "East Los Santos", "X1", 2222.560, "Y1", -1628.530, "X2", 2421.030, "Y2", -1494.030))
zones.Push(Object("NAME", "Rodeo", "X1", 558.099, "Y1", -1684.650, "X2", 647.522, "Y2", -1384.930))
zones.Push(Object("NAME", "Easter Tunnel", "X1", -1709.710, "Y1", -833.034, "X2", -1446.010, "Y2", -730.118))
zones.Push(Object("NAME", "Rodeo", "X1", 466.223, "Y1", -1385.070, "X2", 647.522, "Y2", -1235.070))
zones.Push(Object("NAME", "Redsands East", "X1", 1817.390, "Y1", 2202.760, "X2", 2011.940, "Y2", 2342.830))
zones.Push(Object("NAME", "The Clown's Pocket", "X1", 2162.390, "Y1", 1783.230, "X2", 2437.390, "Y2", 1883.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1971.660, "Y1", -1852.870, "X2", 2222.560, "Y2", -1742.310))
zones.Push(Object("NAME", "Montgomery Intersection", "X1", 1546.650, "Y1", 208.164, "X2", 1745.830, "Y2", 347.457))
zones.Push(Object("NAME", "Willowfield", "X1", 2089.000, "Y1", -2235.840, "X2", 2201.820, "Y2", -1989.900))
zones.Push(Object("NAME", "Temple", "X1", 952.663, "Y1", -1130.840, "X2", 1096.470, "Y2", -937.184))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1848.400, "Y1", 2553.490, "X2", 1938.800, "Y2", 2863.230))
zones.Push(Object("NAME", "Los Santos International", "X1", 1400.970, "Y1", -2669.260, "X2", 2189.820, "Y2", -2597.260))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1213.910, "Y1", 950.022, "X2", -1087.930, "Y2", 1178.930))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1339.890, "Y1", 828.129, "X2", -1213.910, "Y2", 1057.040))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1339.890, "Y1", 599.218, "X2", -1213.910, "Y2", 828.129))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1213.910, "Y1", 721.111, "X2", -1087.930, "Y2", 950.022))
zones.Push(Object("NAME", "Verona Beach", "X1", 930.221, "Y1", -2006.780, "X2", 1073.220, "Y2", -1804.210))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 1073.220, "Y1", -2006.780, "X2", 1249.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Vinewood", "X1", 787.461, "Y1", -1130.840, "X2", 952.604, "Y2", -954.662))
zones.Push(Object("NAME", "Vinewood", "X1", 787.461, "Y1", -1310.210, "X2", 952.663, "Y2", -1130.840))
zones.Push(Object("NAME", "Commerce", "X1", 1463.900, "Y1", -1577.590, "X2", 1667.960, "Y2", -1430.870))
zones.Push(Object("NAME", "Market", "X1", 787.461, "Y1", -1416.250, "X2", 1072.660, "Y2", -1310.210))
zones.Push(Object("NAME", "Rockshore West", "X1", 2377.390, "Y1", 596.349, "X2", 2537.390, "Y2", 788.894))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2237.400, "Y1", 2542.550, "X2", 2498.210, "Y2", 2663.170))
zones.Push(Object("NAME", "East Beach", "X1", 2632.830, "Y1", -1668.130, "X2", 2747.740, "Y2", -1393.420))
zones.Push(Object("NAME", "Fallow Bridge", "X1", 434.341, "Y1", 366.572, "X2", 603.035, "Y2", 555.680))
zones.Push(Object("NAME", "Willowfield", "X1", 2089.000, "Y1", -1989.900, "X2", 2324.000, "Y2", -1852.870))
zones.Push(Object("NAME", "Chinatown", "X1", -2274.170, "Y1", 578.396, "X2", -2078.670, "Y2", 744.170))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -208.570, "Y1", 2337.180, "X2", 8.430, "Y2", 2487.180))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2324.000, "Y1", -2145.100, "X2", 2703.580, "Y2", -2059.230))
zones.Push(Object("NAME", "Easter Bay Chemicals", "X1", -1132.820, "Y1", -768.027, "X2", -956.476, "Y2", -578.118))
zones.Push(Object("NAME", "The Visage", "X1", 1817.390, "Y1", 1703.230, "X2", 2027.400, "Y2", 1863.230))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", -430.276, "X2", -2831.890, "Y2", -222.589))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -860.619, "X2", 687.802, "Y2", -768.027))
zones.Push(Object("NAME", "Green Palms", "X1", 176.581, "Y1", 1305.450, "X2", 338.658, "Y2", 1520.720))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -768.027, "X2", 700.794, "Y2", -674.885))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2162.390, "Y1", 1883.230, "X2", 2437.390, "Y2", 2012.180))
zones.Push(Object("NAME", "East Beach", "X1", 2747.740, "Y1", -1668.130, "X2", 2959.350, "Y2", -1498.620))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1372.040, "X2", 2281.450, "Y2", -1210.740))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1463.900, "Y1", -1290.870, "X2", 1724.760, "Y2", -1150.870))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1463.900, "Y1", -1430.870, "X2", 1724.760, "Y2", -1290.870))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1499.890, "Y1", 696.442, "X2", -1339.890, "Y2", 925.353))
zones.Push(Object("NAME", "Julius Thruway South", "X1", 1457.390, "Y1", 823.228, "X2", 2377.390, "Y2", 863.229))
zones.Push(Object("NAME", "East Los Santos", "X1", 2421.030, "Y1", -1628.530, "X2", 2632.830, "Y2", -1454.350))
zones.Push(Object("NAME", "Greenglass College", "X1", 964.391, "Y1", 1044.690, "X2", 1197.390, "Y2", 1203.220))
zones.Push(Object("NAME", "Las Colinas", "X1", 2747.740, "Y1", -1120.040, "X2", 2959.350, "Y2", -945.035))
zones.Push(Object("NAME", "Mulholland", "X1", 737.573, "Y1", -768.027, "X2", 1142.290, "Y2", -674.885))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2201.820, "Y1", -2730.880, "X2", 2324.000, "Y2", -2418.330))
zones.Push(Object("NAME", "East Los Santos", "X1", 2462.130, "Y1", -1454.350, "X2", 2581.730, "Y2", -1135.040))
zones.Push(Object("NAME", "Ganton", "X1", 2222.560, "Y1", -1722.330, "X2", 2632.830, "Y2", -1628.530))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2831.890, "Y1", -430.276, "X2", -2646.400, "Y2", -222.589))
zones.Push(Object("NAME", "Willowfield", "X1", 1970.620, "Y1", -2179.250, "X2", 2089.000, "Y2", -1852.870))
zones.Push(Object("NAME", "Esplanade North", "X1", -1982.320, "Y1", 1274.260, "X2", -1524.240, "Y2", 1358.900))
zones.Push(Object("NAME", "The High Roller", "X1", 1817.390, "Y1", 1283.230, "X2", 2027.390, "Y2", 1469.230))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2201.820, "Y1", -2418.330, "X2", 2324.000, "Y2", -2095.000))
zones.Push(Object("NAME", "Last Dime Motel", "X1", 1823.080, "Y1", 596.349, "X2", 1997.220, "Y2", 823.228))
zones.Push(Object("NAME", "Bayside Marina", "X1", -2353.170, "Y1", 2275.790, "X2", -2153.170, "Y2", 2475.790))
zones.Push(Object("NAME", "King's", "X1", -2329.310, "Y1", 458.411, "X2", -1993.280, "Y2", 578.396))
zones.Push(Object("NAME", "El Corona", "X1", 1692.620, "Y1", -2179.250, "X2", 1812.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Blackfield Chapel", "X1", 1375.600, "Y1", 596.349, "X2", 1558.090, "Y2", 823.228))
zones.Push(Object("NAME", "The Pink Swan", "X1", 1817.390, "Y1", 1083.230, "X2", 2027.390, "Y2", 1283.230))
zones.Push(Object("NAME", "Julius Thruway West", "X1", 1197.390, "Y1", 1163.390, "X2", 1236.630, "Y2", 2243.230))
zones.Push(Object("NAME", "Los Flores", "X1", 2581.730, "Y1", -1393.420, "X2", 2747.740, "Y2", -1135.040))
zones.Push(Object("NAME", "The Visage", "X1", 1817.390, "Y1", 1863.230, "X2", 2106.700, "Y2", 2011.830))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1938.800, "Y1", 2624.230, "X2", 2121.400, "Y2", 2861.550))
zones.Push(Object("NAME", "Verona Beach", "X1", 851.449, "Y1", -1804.210, "X2", 1046.150, "Y2", -1577.590))
zones.Push(Object("NAME", "Robada Intersection", "X1", -1119.010, "Y1", 1178.930, "X2", -862.025, "Y2", 1351.450))
zones.Push(Object("NAME", "Linden Side", "X1", 2749.900, "Y1", 943.235, "X2", 2923.390, "Y2", 1198.990))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2703.580, "Y1", -2302.330, "X2", 2959.350, "Y2", -2126.900))
zones.Push(Object("NAME", "Willowfield", "X1", 2324.000, "Y1", -2059.230, "X2", 2541.700, "Y2", -1852.870))
zones.Push(Object("NAME", "King's", "X1", -2411.220, "Y1", 265.243, "X2", -1993.280, "Y2", 373.539))
zones.Push(Object("NAME", "Commerce", "X1", 1323.900, "Y1", -1842.270, "X2", 1701.900, "Y2", -1722.260))
zones.Push(Object("NAME", "Mulholland", "X1", 1269.130, "Y1", -768.027, "X2", 1414.070, "Y2", -452.425))
zones.Push(Object("NAME", "Marina", "X1", 647.712, "Y1", -1804.210, "X2", 851.449, "Y2", -1577.590))
zones.Push(Object("NAME", "Battery Point", "X1", -2741.070, "Y1", 1268.410, "X2", -2533.040, "Y2", 1490.470))
zones.Push(Object("NAME", "The Four Dragons Casino", "X1", 1817.390, "Y1", 863.232, "X2", 2027.390, "Y2", 1083.230))
zones.Push(Object("NAME", "Blackfield", "X1", 964.391, "Y1", 1203.220, "X2", 1197.390, "Y2", 1403.220))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1534.560, "Y1", 2433.230, "X2", 1848.400, "Y2", 2583.230))
zones.Push(Object("NAME", "Yellow Bell Gol Course", "X1", 1117.400, "Y1", 2723.230, "X2", 1457.460, "Y2", 2863.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1602.310, "X2", 2124.660, "Y2", -1449.670))
zones.Push(Object("NAME", "Redsands West", "X1", 1297.470, "Y1", 2142.860, "X2", 1777.390, "Y2", 2243.230))
zones.Push(Object("NAME", "Doherty", "X1", -2270.040, "Y1", -324.114, "X2", -1794.920, "Y2", -222.589))
zones.Push(Object("NAME", "Hilltop Farm", "X1", 967.383, "Y1", -450.390, "X2", 1176.780, "Y2", -217.900))
zones.Push(Object("NAME", "Las Barrancas", "X1", -926.130, "Y1", 1398.730, "X2", -719.234, "Y2", 1634.690))
zones.Push(Object("NAME", "Pirates in Men's Pants", "X1", 1817.390, "Y1", 1469.230, "X2", 2027.400, "Y2", 1703.230))
zones.Push(Object("NAME", "City Hall", "X1", -2867.850, "Y1", 277.411, "X2", -2593.440, "Y2", 458.411))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2646.400, "Y1", -355.493, "X2", -2270.040, "Y2", -222.589))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 863.229, "X2", 2087.390, "Y2", 1703.230))
zones.Push(Object("NAME", "Hashbury", "X1", -2593.440, "Y1", -222.589, "X2", -2411.220, "Y2", 54.722))
zones.Push(Object("NAME", "Los Santos International", "X1", 1852.000, "Y1", -2394.330, "X2", 2089.000, "Y2", -2179.250))
zones.Push(Object("NAME", "Whitewood Estates", "X1", 1098.310, "Y1", 1726.220, "X2", 1197.390, "Y2", 2243.230))
zones.Push(Object("NAME", "Sherman Reservoir", "X1", -789.737, "Y1", 1659.680, "X2", -599.505, "Y2", 1929.410))
zones.Push(Object("NAME", "El Corona", "X1", 1812.620, "Y1", -2179.250, "X2", 1970.620, "Y2", -1852.870))
zones.Push(Object("NAME", "Downtown", "X1", -1700.010, "Y1", 744.267, "X2", -1580.010, "Y2", 1176.520))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -1250.970, "X2", -1794.920, "Y2", -1115.580))
zones.Push(Object("NAME", "Las Payasadas", "X1", -354.332, "Y1", 2580.360, "X2", -133.625, "Y2", 2816.820))
zones.Push(Object("NAME", "Valle Ocultado", "X1", -936.668, "Y1", 2611.440, "X2", -715.961, "Y2", 2847.900))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1166.530, "Y1", 795.010, "X2", 1375.600, "Y2", 1044.690))
zones.Push(Object("NAME", "Ganton", "X1", 2222.560, "Y1", -1852.870, "X2", 2632.830, "Y2", -1722.330))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1213.910, "Y1", -730.118, "X2", -1132.820, "Y2", -50.096))
zones.Push(Object("NAME", "Redsands East", "X1", 1817.390, "Y1", 2011.830, "X2", 2106.700, "Y2", 2202.760))
zones.Push(Object("NAME", "Esplanade East", "X1", -1499.890, "Y1", 578.396, "X2", -1339.890, "Y2", 1274.260))
zones.Push(Object("NAME", "Caligula's Palace", "X1", 2087.390, "Y1", 1543.230, "X2", 2437.390, "Y2", 1703.230))
zones.Push(Object("NAME", "Royal Casino", "X1", 2087.390, "Y1", 1383.230, "X2", 2437.390, "Y2", 1543.230))
zones.Push(Object("NAME", "Richman", "X1", 72.648, "Y1", -1235.070, "X2", 321.356, "Y2", -1008.150))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2437.390, "Y1", 1783.230, "X2", 2685.160, "Y2", 2012.180))
zones.Push(Object("NAME", "Mulholland", "X1", 1281.130, "Y1", -452.425, "X2", 1641.130, "Y2", -290.913))
zones.Push(Object("NAME", "Downtown", "X1", -1982.320, "Y1", 744.170, "X2", -1871.720, "Y2", 1274.260))
zones.Push(Object("NAME", "Hankypanky Point", "X1", 2576.920, "Y1", 62.158, "X2", 2759.250, "Y2", 385.503))
zones.Push(Object("NAME", "K.A.C.C. Military Fuels", "X1", 2498.210, "Y1", 2626.550, "X2", 2749.900, "Y2", 2861.550))
zones.Push(Object("NAME", "Harry Gold Parkway", "X1", 1777.390, "Y1", 863.232, "X2", 1817.390, "Y2", 2342.830))
zones.Push(Object("NAME", "Bayside Tunnel", "X1", -2290.190, "Y1", 2548.290, "X2", -1950.190, "Y2", 2723.290))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2324.000, "Y1", -2302.330, "X2", 2703.580, "Y2", -2145.100))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -1044.070, "X2", 647.557, "Y2", -860.619))
zones.Push(Object("NAME", "Randolph Industrial Estate", "X1", 1558.090, "Y1", 596.349, "X2", 1823.080, "Y2", 823.235))
zones.Push(Object("NAME", "East Beach", "X1", 2632.830, "Y1", -1852.870, "X2", 2959.350, "Y2", -1668.130))
zones.Push(Object("NAME", "Flint Water", "X1", -314.426, "Y1", -753.874, "X2", -106.339, "Y2", -463.073))
zones.Push(Object("NAME", "Blueberry", "X1", 19.607, "Y1", -404.136, "X2", 349.607, "Y2", -220.137))
zones.Push(Object("NAME", "Linden Station", "X1", 2749.900, "Y1", 1198.990, "X2", 2923.390, "Y2", 1548.990))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1350.720, "X2", 2056.860, "Y2", -1100.820))
zones.Push(Object("NAME", "Downtown", "X1", -1993.280, "Y1", 265.243, "X2", -1794.920, "Y2", 578.396))
zones.Push(Object("NAME", "Redsands West", "X1", 1377.390, "Y1", 2243.230, "X2", 1704.590, "Y2", 2433.230))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -1235.070, "X2", 647.522, "Y2", -1044.070))
zones.Push(Object("NAME", "Gant Bridge", "X1", -2741.450, "Y1", 1659.680, "X2", -2616.400, "Y2", 2175.150))
zones.Push(Object("NAME", "Lil' Probe Inn", "X1", -90.218, "Y1", 1286.850, "X2", 153.859, "Y2", 1554.120))
zones.Push(Object("NAME", "Flint Intersection", "X1", -187.700, "Y1", -1596.760, "X2", 17.063, "Y2", -1276.600))
zones.Push(Object("NAME", "Las Colinas", "X1", 2281.450, "Y1", -1135.040, "X2", 2632.740, "Y2", -945.035))
zones.Push(Object("NAME", "Sobell Rail Yards", "X1", 2749.900, "Y1", 1548.990, "X2", 2923.390, "Y2", 1937.250))
zones.Push(Object("NAME", "The Emerald Isle", "X1", 2011.940, "Y1", 2202.760, "X2", 2237.400, "Y2", 2508.230))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -208.570, "Y1", 2123.010, "X2", 114.033, "Y2", 2337.180))
zones.Push(Object("NAME", "Santa Flora", "X1", -2741.070, "Y1", 458.411, "X2", -2533.040, "Y2", 793.411))
zones.Push(Object("NAME", "Playa del Seville", "X1", 2703.580, "Y1", -2126.900, "X2", 2959.350, "Y2", -1852.870))
zones.Push(Object("NAME", "Market", "X1", 926.922, "Y1", -1577.590, "X2", 1370.850, "Y2", -1416.250))
zones.Push(Object("NAME", "Queens", "X1", -2593.440, "Y1", 54.722, "X2", -2411.220, "Y2", 458.411))
zones.Push(Object("NAME", "Pilson Intersection", "X1", 1098.390, "Y1", 2243.230, "X2", 1377.390, "Y2", 2507.230))
zones.Push(Object("NAME", "Spinybed", "X1", 2121.400, "Y1", 2663.170, "X2", 2498.210, "Y2", 2861.550))
zones.Push(Object("NAME", "Pilgrim", "X1", 2437.390, "Y1", 1383.230, "X2", 2624.400, "Y2", 1783.230))
zones.Push(Object("NAME", "Blackfield", "X1", 964.391, "Y1", 1403.220, "X2", 1197.390, "Y2", 1726.220))
zones.Push(Object("NAME", "'The Big Ear'", "X1", -410.020, "Y1", 1403.340, "X2", -137.969, "Y2", 1681.230))
zones.Push(Object("NAME", "Dillimore", "X1", 580.794, "Y1", -674.885, "X2", 861.085, "Y2", -404.790))
zones.Push(Object("NAME", "El Quebrados", "X1", -1645.230, "Y1", 2498.520, "X2", -1372.140, "Y2", 2777.850))
zones.Push(Object("NAME", "Esplanade North", "X1", -2533.040, "Y1", 1358.900, "X2", -1996.660, "Y2", 1501.210))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1499.890, "Y1", -50.096, "X2", -1242.980, "Y2", 249.904))
zones.Push(Object("NAME", "Fisher's Lagoon", "X1", 1916.990, "Y1", -233.323, "X2", 2131.720, "Y2", 13.800))
zones.Push(Object("NAME", "Mulholland", "X1", 1414.070, "Y1", -768.027, "X2", 1667.610, "Y2", -452.425))
zones.Push(Object("NAME", "East Beach", "X1", 2747.740, "Y1", -1498.620, "X2", 2959.350, "Y2", -1120.040))
zones.Push(Object("NAME", "San Andreas Sound", "X1", 2450.390, "Y1", 385.503, "X2", 2759.250, "Y2", 562.349))
zones.Push(Object("NAME", "Shady Creeks", "X1", -2030.120, "Y1", -2174.890, "X2", -1820.640, "Y2", -1771.660))
zones.Push(Object("NAME", "Market", "X1", 1072.660, "Y1", -1416.250, "X2", 1370.850, "Y2", -1130.850))
zones.Push(Object("NAME", "Rockshore West", "X1", 1997.220, "Y1", 596.349, "X2", 2377.390, "Y2", 823.228))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1534.560, "Y1", 2583.230, "X2", 1848.400, "Y2", 2863.230))
zones.Push(Object("NAME", "Easter Basin", "X1", -1794.920, "Y1", -50.096, "X2", -1499.890, "Y2", 249.904))
zones.Push(Object("NAME", "Leafy Hollow", "X1", -1166.970, "Y1", -1856.030, "X2", -815.624, "Y2", -1602.070))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1457.390, "Y1", 863.229, "X2", 1777.400, "Y2", 1143.210))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1117.400, "Y1", 2507.230, "X2", 1534.560, "Y2", 2723.230))
zones.Push(Object("NAME", "Blueberry", "X1", 104.534, "Y1", -220.137, "X2", 349.607, "Y2", 152.236))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -464.515, "Y1", 2217.680, "X2", -208.570, "Y2", 2580.360))
zones.Push(Object("NAME", "Downtown", "X1", -2078.670, "Y1", 578.396, "X2", -1499.890, "Y2", 744.267))
zones.Push(Object("NAME", "Rockshore East", "X1", 2537.390, "Y1", 676.549, "X2", 2902.350, "Y2", 943.235))
zones.Push(Object("NAME", "San Fierro Bay", "X1", -2616.400, "Y1", 1501.210, "X2", -1996.660, "Y2", 1659.680))
zones.Push(Object("NAME", "Paradiso", "X1", -2741.070, "Y1", 793.411, "X2", -2533.040, "Y2", 1268.410))
zones.Push(Object("NAME", "The Camel's Toe", "X1", 2087.390, "Y1", 1203.230, "X2", 2640.400, "Y2", 1383.230))
zones.Push(Object("NAME", "Old Venturas Strip", "X1", 2162.390, "Y1", 2012.180, "X2", 2685.160, "Y2", 2202.760))
zones.Push(Object("NAME", "Juniper Hill", "X1", -2533.040, "Y1", 578.396, "X2", -2274.170, "Y2", 968.369))
zones.Push(Object("NAME", "Juniper Hollow", "X1", -2533.040, "Y1", 968.369, "X2", -2274.170, "Y2", 1358.900))
zones.Push(Object("NAME", "Roca Escalante", "X1", 2237.400, "Y1", 2202.760, "X2", 2536.430, "Y2", 2542.550))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2685.160, "Y1", 1055.960, "X2", 2749.900, "Y2", 2626.550))
zones.Push(Object("NAME", "Verona Beach", "X1", 647.712, "Y1", -2173.290, "X2", 930.221, "Y2", -1804.210))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -599.884, "X2", -1794.920, "Y2", -324.114))
zones.Push(Object("NAME", "Arco del Oeste", "X1", -901.129, "Y1", 2221.860, "X2", -592.090, "Y2", 2571.970))
zones.Push(Object("NAME", "Fallen Tree", "X1", -792.254, "Y1", -698.555, "X2", -452.404, "Y2", -380.043))
zones.Push(Object("NAME", "The Farm", "X1", -1209.670, "Y1", -1317.100, "X2", -908.161, "Y2", -787.391))
zones.Push(Object("NAME", "The Sherman Dam", "X1", -968.772, "Y1", 1929.410, "X2", -481.126, "Y2", 2155.260))
zones.Push(Object("NAME", "Esplanade North", "X1", -1996.660, "Y1", 1358.900, "X2", -1524.240, "Y2", 1592.510))
zones.Push(Object("NAME", "Financial", "X1", -1871.720, "Y1", 744.170, "X2", -1701.300, "Y2", 1176.420))
zones.Push(Object("NAME", "Garcia", "X1", -2411.220, "Y1", -222.589, "X2", -2173.040, "Y2", 265.243))
zones.Push(Object("NAME", "Montgomery", "X1", 1119.510, "Y1", 119.526, "X2", 1451.400, "Y2", 493.323))
zones.Push(Object("NAME", "Creek", "X1", 2749.900, "Y1", 1937.250, "X2", 2921.620, "Y2", 2669.790))
zones.Push(Object("NAME", "Los Santos International", "X1", 1249.620, "Y1", -2394.330, "X2", 1852.000, "Y2", -2179.250))
zones.Push(Object("NAME", "Santa Maria Beach", "X1", 72.648, "Y1", -2173.290, "X2", 342.648, "Y2", -1684.650))
zones.Push(Object("NAME", "Mulholland Intersection", "X1", 1463.900, "Y1", -1150.870, "X2", 1812.620, "Y2", -768.027))
zones.Push(Object("NAME", "Angel Pine", "X1", -2324.940, "Y1", -2584.290, "X2", -1964.220, "Y2", -2212.110))
zones.Push(Object("NAME", "Verdant Meadows", "X1", 37.032, "Y1", 2337.180, "X2", 435.988, "Y2", 2677.900))
zones.Push(Object("NAME", "Octane Springs", "X1", 338.658, "Y1", 1228.510, "X2", 664.308, "Y2", 1655.050))
zones.Push(Object("NAME", "Come-A-Lot", "X1", 2087.390, "Y1", 943.235, "X2", 2623.180, "Y2", 1203.230))
zones.Push(Object("NAME", "Redsands West", "X1", 1236.630, "Y1", 1883.110, "X2", 1777.390, "Y2", 2142.860))
zones.Push(Object("NAME", "Santa Maria Beach", "X1", 342.648, "Y1", -2173.290, "X2", 647.712, "Y2", -1684.650))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 1249.620, "Y1", -2179.250, "X2", 1692.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1236.630, "Y1", 1203.280, "X2", 1457.370, "Y2", 1883.110))
zones.Push(Object("NAME", "Flint Range", "X1", -594.191, "Y1", -1648.550, "X2", -187.700, "Y2", -1276.600))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 930.221, "Y1", -2488.420, "X2", 1249.620, "Y2", -2006.780))
zones.Push(Object("NAME", "Palomino Creek", "X1", 2160.220, "Y1", -149.004, "X2", 2576.920, "Y2", 228.322))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2373.770, "Y1", -2697.090, "X2", 2809.220, "Y2", -2330.460))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1213.910, "Y1", -50.096, "X2", -947.980, "Y2", 578.396))
zones.Push(Object("NAME", "Whitewood Estates", "X1", 883.308, "Y1", 1726.220, "X2", 1098.310, "Y2", 2507.230))
zones.Push(Object("NAME", "Calton Heights", "X1", -2274.170, "Y1", 744.170, "X2", -1982.320, "Y2", 1358.900))
zones.Push(Object("NAME", "Easter Basin", "X1", -1794.920, "Y1", 249.904, "X2", -1242.980, "Y2", 578.396))
zones.Push(Object("NAME", "Los Santos Inlet", "X1", -321.744, "Y1", -2224.430, "X2", 44.615, "Y2", -1724.430))
zones.Push(Object("NAME", "Doherty", "X1", -2173.040, "Y1", -222.589, "X2", -1794.920, "Y2", 265.243))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2178.690, "Y1", -2189.910, "X2", -2030.120, "Y2", -1771.660))
zones.Push(Object("NAME", "Fort Carson", "X1", -376.233, "Y1", 826.326, "X2", 123.717, "Y2", 1220.440))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -1115.580, "X2", -1794.920, "Y2", -599.884))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", -222.589, "X2", -2593.440, "Y2", 277.411))
zones.Push(Object("NAME", "Fern Ridge", "X1", 508.189, "Y1", -139.259, "X2", 1306.660, "Y2", 119.526))
zones.Push(Object("NAME", "Bayside", "X1", -2741.070, "Y1", 2175.150, "X2", -2353.170, "Y2", 2722.790))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1457.370, "Y1", 1203.280, "X2", 1777.390, "Y2", 1883.110))
zones.Push(Object("NAME", "Blueberry Acres", "X1", -319.676, "Y1", -220.137, "X2", 104.534, "Y2", 293.324))
zones.Push(Object("NAME", "Palisades", "X1", -2994.490, "Y1", 458.411, "X2", -2741.070, "Y2", 1339.610))
zones.Push(Object("NAME", "North Rock", "X1", 2285.370, "Y1", -768.027, "X2", 2770.590, "Y2", -269.740))
zones.Push(Object("NAME", "Hunter Quarry", "X1", 337.244, "Y1", 710.840, "X2", 860.554, "Y2", 1031.710))
zones.Push(Object("NAME", "Los Santos International", "X1", 1382.730, "Y1", -2730.880, "X2", 2201.820, "Y2", -2394.330))
zones.Push(Object("NAME", "Missionary Hill", "X1", -2994.490, "Y1", -811.276, "X2", -2178.690, "Y2", -430.276))
zones.Push(Object("NAME", "San Fierro Bay", "X1", -2616.400, "Y1", 1659.680, "X2", -1996.660, "Y2", 2175.150))
zones.Push(Object("NAME", "Restricted Area", "X1", -91.586, "Y1", 1655.050, "X2", 421.234, "Y2", 2123.010))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2997.470, "Y1", -1115.580, "X2", -2178.690, "Y2", -971.913))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2178.690, "Y1", -1771.660, "X2", -1936.120, "Y2", -1250.970))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1794.920, "Y1", -730.118, "X2", -1213.910, "Y2", -50.096))
zones.Push(Object("NAME", "The Panopticon", "X1", -947.980, "Y1", -304.320, "X2", -319.676, "Y2", 327.071))
zones.Push(Object("NAME", "Shady Creeks", "X1", -1820.640, "Y1", -2643.680, "X2", -1226.780, "Y2", -1771.660))
zones.Push(Object("NAME", "Back o Beyond", "X1", -1166.970, "Y1", -2641.190, "X2", -321.744, "Y2", -1856.030))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2994.490, "Y1", -2189.910, "X2", -2178.690, "Y2", -1115.580))
zones.Push(Object("NAME", "Tierra Robada", "X1", -1213.910, "Y1", 596.349, "X2", -480.539, "Y2", 1659.680))
zones.Push(Object("NAME", "Flint County", "X1", -1213.910, "Y1", -2892.970, "X2", 44.615, "Y2", -768.027))
zones.Push(Object("NAME", "Whetstone", "X1", -2997.470, "Y1", -2892.970, "X2", -1213.910, "Y2", -1115.580))
zones.Push(Object("NAME", "Bone County", "X1", -480.539, "Y1", 596.349, "X2", 869.461, "Y2", 2993.870))
zones.Push(Object("NAME", "Tierra Robada", "X1", -2997.470, "Y1", 1659.680, "X2", -480.539, "Y2", 2993.870))
zones.Push(Object("NAME", "San Fierro", "X1", -2997.470, "Y1", -1115.580, "X2", -1213.910, "Y2", 1659.680))
zones.Push(Object("NAME", "Las Venturas", "X1", 869.461, "Y1", 596.349, "X2", 2997.060, "Y2", 2993.870))
zones.Push(Object("NAME", "Red County", "X1", -1213.910, "Y1", -768.027, "X2", 2997.060, "Y2", 596.349))
zones.Push(Object("NAME", "Los Santos", "X1", 44.615, "Y1", -2892.970, "X2", 2997.060, "Y2", -768.027))

class AutoSAMP 
{
    static hGTA := 0x0
    static dwGTAPID := 0x0
    static dwSAMP := 0x0

    static pMemory := 0x0
    static pDetours := 0x0
    static pInjectFunc := 0x0
    static iRefreshHandles := 0

    static GTA_PID := "AMAZING ONLINE"
    static SAMP_MODULE := "azmp.dll"
    static SAMP_VERSION := 1

    __New(GTAPID := "AMAZING ONLINE", sampModule := "azmp.dll") {
        FileDelete, %A_ScriptDir%\AutoSAMP-log.txt

        AutoSAMP.addLog("INFO", "AutoSAMP: Version [" AUTOSAMP_VERSION "], Author: Kplr452b")

        AutoSAMP.GTA_PID := GTAPID
        AutoSAMP.SAMP_MODULE := sampModule
        AutoSAMP.SAMP_VERSION := 1

        AutoSAMP.initilizationCommands()			
    }

    addLog(szType, szText) {
        FormatTime, TimeString, T12, Time
	    FileAppend, [%TimeString%][%szType%]: %szText% `n, %A_ScriptDir%\AutoSAMP-log.txt
        return
    }

    IsSAMPAvailable() {
        if (!AutoSAMP.checkHandles())
            return false

	    if (!AutoSAMP.dwSAMP)
		    return false

	    return true
    }

    playAudioStream(szUrl) {
        return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CAUDIOSTREAM_PLAY[AutoSAMP.SAMP_VERSION], [["s", szUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    }

    stopAudioStream() {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CAUDIOSTREAM_STOP[AutoSAMP.SAMP_VERSION], [["i", 1]], false)
    }

    getChatlogPath() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION], SAMP_CCHAT_LOGPATH[AutoSAMP.SAMP_VERSION]], 256)
    }

    sendChat(szText) {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + (SubStr(szText, 1, 1) == "/" ? SAMP_CINPUT_SEND[AutoSAMP.SAMP_VERSION] : SAMP_CLOCALPLAYER_CHAT[AutoSAMP.SAMP_VERSION]), [["s", szText]], false)
    }

    addChatMessage(szText, hxColor := 0xFFFFFFFF, timestamp := true) {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CCHAT_ADDENTRY[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION]])], ["i", timestamp ? 4 : 2], ["s", szText], ["i", 0], ["i", hxColor], ["i", 0]], false, true)
    }

    getPageSize() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION], SAMP_CCHAT_PAGESIZE[AutoSAMP.SAMP_VERSION]], "UChar")
    }

    isInChat() {	
	    return !AutoSAMP.checkHandles() ? false : (AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT_EDITBOX[AutoSAMP.SAMP_VERSION]]), [SAMP_CCHAT_EDITBOX_OFF[AutoSAMP.SAMP_VERSION]]) > 0)
    }

    getLastSentMsg() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CINPUT[AutoSAMP.SAMP_VERSION], SAMP_CINPUT_INPUT[AutoSAMP.SAMP_VERSION]], 128)
    }

    getChatline(dwIndex) {
	    if (dwIndex < 0 || dwIndex > 99 || !AutoSAMP.checkHandles())
		    return false
	    return AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION], SAMP_CCHAT_ENTRY_TEXT[AutoSAMP.SAMP_VERSION] + SAMP_CCHAT_ENTRY_SIZE[AutoSAMP.SAMP_VERSION] * (99 - dwIndex)], 144)
    }

    static CMD_LIST := {}

    registerCommand(szCommand, Function, Object := "") {
		If (IsObject(Object)) {
			Function := ObjBindMethod(Object, Function)
			AutoSAMP.CMD_LIST[szCommand] := Function 
			return 0
		} else if (IsFunc(Function)) {
			AutoSAMP.CMD_LIST[szCommand] := Function
			return 0
		} else return 1
	}

    initilizationCommands() {		
		static Function := ObjBindMethod(AutoSAMP, "checkCommands")
		Hotkey, ~Enter,% Function, On, UseErrorLevel
		return ErrorLevel		
	}

    checkCommands() {
		If (AutoSAMP.isInChat()) {
			KeyWait, Enter
			sleep 250 
			Input := AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CHATINPUT[AutoSAMP.SAMP_VERSION]], 256)
			If (SubStr(Input, 1, 1) == "/" && RegExMatch(Input, "(\w+)", Command, 2) && AutoSAMP.CMD_LIST[Command]) {
				AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CHATINPUT[AutoSAMP.SAMP_VERSION]], "")
				Function := AutoSAMP.CMD_LIST[Command], Arguments := StrSplit(SubStr(Input, 3+StrLen(Command), StrLen(Input)-2-StrLen(Command)), " ")
				While (Arguments.Length() < IsFunc(Function))
					Arguments.Push("")
				%Function%(Arguments*)
			}
		}
	}

    getDialogPosition() {
	    return !AutoSAMP.checkHandles() ? false : [AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_POSITION[AutoSAMP.SAMP_VERSION]]), AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_POSITION[AutoSAMP.SAMP_VERSION] + 0x4])]
    }

    closeDialog() {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CDIALOG_HIDE[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION]])]], false, true)
    }

    isDialogOpen() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_ISACTIVE[AutoSAMP.SAMP_VERSION]])
    }

    getDialogStyle() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_TYPE[AutoSAMP.SAMP_VERSION]], "UInt")
    }

    getDialogID() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_ID[AutoSAMP.SAMP_VERSION]], "UInt")
    }

    getDialogIndex() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_LISTBOX[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_LISTBOX_INDEX[AutoSAMP.SAMP_VERSION]], "Byte") + 1
    }

    getDialogCaption() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_CAPTION[AutoSAMP.SAMP_VERSION]], 64)
    }

    getDialogText() {
	    return !AutoSAMP.checkHandles() ? "" : ((dialogText := AutoSAMP.__READSTRING(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_TEXT[AutoSAMP.SAMP_VERSION]])), [0x0], 4096)) == "" ? AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [0x0], AutoSAMP.getDialogTextSize(dwAddress)) : dialogText)
    }

    getDialogTextSize(dwAddress) {
	    Loop, 4096
	    {
		    if (!AutoSAMP.__READBYTE(AutoSAMP.hGTA, dwAddress + (i := A_Index - 1)))
			    break
	    }
	    return i
    }

    getDialogLine(dwIndex) {
	    return dwIndex > (lines := AutoSAMP.getDialogLineCount()).Length() ? "" : lines[AutoSAMP.getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS ? ++dwIndex : dwIndex]
    }

    getDialogLineCount() {
	    return (text := AutoSAMP.getDialogText()) == "" ? -1 : StrSplit(text, "`n")
    }

    showDialog(style, caption, text, button1, button2 := "", id := 1)
    {
	    if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4095 || StrLen(button1) > 10 || StrLen(button2) > 10 || !AutoSAMP.checkHandles())
		    return false
	    while(GetKeyState("ENTER", "P") || GetKeyState("NumpadENTER", "P"))
		    continue
	    sleep, 50
	    return AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CDIALOG_SHOW[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION]])], ["i", id], ["i", style], ["s", caption], ["s", text], ["s", button1], ["s", button2], ["i", 0]], false, true)
    }

    setDialogID(id) {
	    return AutoSAMP.checkHandles() && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_ID[AutoSAMP.SAMP_VERSION]], id, "UInt")
    }

    showTextMessage(showText, showTime := 3000, unknown1 := 1, unknown2 := 1) {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, AutoSAMP.pMemory, [5000], showText) && AutoSAMP.CALL(AutoSAMP.hGTA, 0x69F1E0, [["i", AutoSAMP.pMemory + 5000], ["i", showTime], ["i", 1], ["i", 1]])
    }

    pressDialogButton(button) {
	    return !AutoSAMP.checkHandles() || button < 0 || button > 1 ? false : AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CDIALOG_CLOSE[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION]])], ["i", button]], false, true)
    }

    isScoreboardOpen() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CSCOREBOARD[AutoSAMP.SAMP_VERSION], SAMP_CSCOREBOARD_ISENABLED[AutoSAMP.SAMP_VERSION]], "UChar")
    }

    writeToChatlog(text) {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CCHAT_LOG[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION]])], ["i", 4], ["s", text], ["i", 0]], false, true) 
    }

    setPageSize(pageSize) {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CCHAT_SETPAGESIZE[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION]])], ["i", pageSize]], false, true)
    }

    getMoney() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB7CE50, [0x0], "Int")
    }

    getPing() {
	    return !AutoSAMP.checkHandles() ? "" :  AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LOCALPLAYER_PING[AutoSAMP.SAMP_VERSION]])
    }

    getScore() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LOCALPLAYER_SCORE[AutoSAMP.SAMP_VERSION]])
    }

    updateScoreboardData() {
	    return !AutoSAMP.checkHandles() ? false : (A_TickCount - scoreboardTick > 1000 ? AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CNETGAME_UPDATEPLAYERS[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION]])]], false, true) && scoreboardTick := A_TickCount : true)
    }

    getPlayerScore(playerID) {
	    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.updateScoreboardData() ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, SAMP_POOLS_PLAYER_REMOTEPLAYER_SCORE[AutoSAMP.SAMP_VERSION]])
    }

    getPlayerPing(playerID) {
	    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.updateScoreboardData() ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, SAMP_POOLS_PLAYER_REMOTEPLAYER_PING[AutoSAMP.SAMP_VERSION]])
    }

    getPlayerID(playerName, exact := 0) {
	    if (!AutoSAMP.updatePlayers())
		    return ""

	    for i, o in oPlayers {
		    if (exact) {
			    if (o[1] = playerName)
				    return i
		    }
		    else {
			    if (InStr(o[1], playerName) == 1)
				    return i
		    }
	    }
	    return ""
    }

    getPlayerName(playerID) {
	    if (playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() || AutoSAMP.getPlayerScore(playerID) == "")
		    return ""

	    if (AutoSAMP.__DWORD(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4])), [SAMP_POOLS_PLAYER_REMOTEPLAYER_SIZE[AutoSAMP.SAMP_VERSION]]) > 15)
		    return AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK[AutoSAMP.SAMP_VERSION], 0x0], 25)

	    return AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK[AutoSAMP.SAMP_VERSION]], 16)
    }

    getUsername() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_USERNAME[AutoSAMP.SAMP_VERSION]], 25)
    }

    getArmor() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x548], "Float")
    }

    getID() {
	    return !AutoSAMP.checkHandles() ? -1 : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LOCALPLAYER_ID[AutoSAMP.SAMP_VERSION]], "UShort")
    }

    showGameText(text, time, style) {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CGAME_DISPLAYGAMETEXT[AutoSAMP.SAMP_VERSION], [["s", text], ["i", time], ["i", style]], false)
    }

    setLastSentMsg(text) {
	    return AutoSAMP.checkHandles() && AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CINPUT[AutoSAMP.SAMP_VERSION], SAMP_CINPUT_INPUT[AutoSAMP.SAMP_VERSION]], text)
    }

    getWanteds() {
	    return !AutoSAMP.checkHandles() ? -1 : AutoSAMP.__DWORD(AutoSAMP.hGTA, 0x58DB60, [0x0])
    }

    getMaxPlayerID() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LARGESTID[AutoSAMP.SAMP_VERSION]])
    }

    getAmmo(slot) {
	    return (slot < 0 || slot > 12 || !AutoSAMP.checkHandles()) ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x5AC + slot * 0x1C])
    }

    getActiveWeaponSlot() {
	    return !AutoSAMP.checkHandles() ? -1 : AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB7CDBC, [0x0], "UChar")
    }

    getPlayerZAngle() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB6F5F0, [0x0, 0x558], "Float")
    }

    isPlayerInRangeOfPoint(fX, fY, fZ, r) {
	    return AutoSAMP.checkHandles() && AutoSAMP.getDistance(AutoSAMP.getPlayerPos(), [fX, fY, fZ]) <= r
    }

    getVehicleColor1() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x434], "UChar")
    }

    getVehicleColor2() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x435], "UChar")
    }

    getVehicleSpeed() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : sqrt(((fSpeedX := AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0])), [0x44], "Float")) * fSpeedX) + ((fSpeedY := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x48], "Float")) * fSpeedY) + ((fSpeedZ := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x4C], "Float")) * fSpeedZ)) * 100 * SERVER_SPEED_KOEFF
    }

    getInteriorID() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__DWORD(AutoSAMP.hGTA, 0xA4ACE8, [0x0])
    }

    isPlayerInAnyVehicle() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0]) > 0
    }

    isPlayerDriver() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x460]) == AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0])
    }

    getPlayerHealth() {
	    return !AutoSAMP.checkHandles() ? -1 : Round(AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x540], "Float"))
    }

    getPlayerArmor() {
	    return !AutoSAMP.checkHandles() ? -1 : Round(AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x548], "Float"))
    }

    getVehicleHealth() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : Round(AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x4C0], "Float"))
    }

    getVehicleRotation() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : [AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x14])), [0x0], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x4], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x8], "Float")]
    }

    getVehiclePos() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : [AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x14])), [0x30], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x34], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x38], "Float")]
    }

    getPlayerVehicleModelID() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x22], "UShort")
    }

    getPlayerVehicleEngineState() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : (AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x428], "UChar") & 16 ? true : false)
    }

    getPlayerVehicleLightState() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : (AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x428], "UChar") & 64 ? true : false)
    }

    getPlayerVehicleLockState() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : (AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x4F8]) == 2)
    }

    getPlayerVehicleSirenState() {
	    return !AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle() ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_VEHICLE_PTR, [0x0, 0x1F7])
    }

    getFPS() {
	    if (!AutoSAMP.checkHandles())
		    return 0

	    static timev := A_TickCount
	    static val := AutoSAMP.__DWORD(AutoSAMP.hGTA, 0xB7CB4C, [0x0])
	    temp := AutoSAMP.__DWORD(AutoSAMP.hGTA, 0xB7CB4C, [0x0])
	    ret := (temp - val) / (A_TickCount - timev) * 1000
	    timev := A_TickCount
	    val := temp
	    return ret
    }

    getServerName() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_CNETGAME_HOSTNAME[AutoSAMP.SAMP_VERSION]], 259)
    }

    getServerIP() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_CNETGAME_HOSTADDRESS[AutoSAMP.SAMP_VERSION]], 257)
    }

    getServerPort() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_CNETGAME_PORT[AutoSAMP.SAMP_VERSION]], "UInt")
    }

    updatePlayers() {
	    if (!AutoSAMP.checkHandles())
		    return false

	    if (playerTick + 1000 > A_TickCount)
		    return true

	    oPlayers := []
	    dwPlayers := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION]])
	
	    Loop, % AutoSAMP.getMaxPlayerID() + 1
	    {
		    if (!(dwRemoteplayer := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwPlayers, [SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + (A_Index - 1) * 4])))
			    continue

            dwRemoteplayerData := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwRemoteplayer, [SAMP_POOLS_PLAYER_REMOTEPLAYER_DATA[AutoSAMP.SAMP_VERSION]])  
		
		    oPlayers[A_Index - 1] := [(AutoSAMP.__DWORD(AutoSAMP.hGTA, dwRemoteplayer, [SAMP_POOLS_PLAYER_REMOTEPLAYER_SIZE[AutoSAMP.SAMP_VERSION]]) > 15 ? AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwRemoteplayer, [SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK[AutoSAMP.SAMP_VERSION], 0x0], 25) : AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwRemoteplayer, [SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK[AutoSAMP.SAMP_VERSION]], 16)), AutoSAMP.__DWORD(AutoSAMP.hGTA, dwRemoteplayer, [0x0, 0x0, 676])]
        }

	    playerTick := A_TickCount
	    return true
    }

    printPlayers() {
	    if (!AutoSAMP.updatePlayers())
		    return false

	    playerCount := 1
	    for i, o in oPlayers {
		    playerCount++
		    AutoSAMP.addChatMessage("ID: " i ", Name: " o[1])
	    }

	    AutoSAMP.addChatMessage("Player Count: " playerCount)
	    return true
    }

    getPlayerCount() {
	    if (!AutoSAMP.updatePlayers())
		    return false

	    playerCount := 1
	    for i, o in oPlayers
		    playerCount++

	    return playerCount
    }

    getPlayerSkin() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x22], "UShort")
    }

    getPlayerPos() {
	    return !AutoSAMP.checkHandles() ? "" : [AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB6F2E4, [0x0], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB6F2E8, [0x0], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB6F2EC, [0x0], "Float")]
    }

    getDistance(pos1, pos2) {
	    return !pos1 || pos1 == "" || !pos2 || pos2 == "" ? -1 : Sqrt((pos1[1] - pos2[1]) * (pos1[1] - pos2[1]) + (pos1[2] - pos2[2]) * (pos1[2] - pos2[2]) + (pos1[3] - pos2[3]) * (pos1[3] - pos2[3]))
    }

    playSound(soundID) {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, 0x506EA0, [["i", 0xB6BC90], ["i", soundID], ["i", 0], ["f", 1.0]], false, true)
    }

    ; VERSION 1.1
    getPlayerAnim() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LOCALPLAYER_DATA[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LOCALPLAYER_DATA_ANIMATION[AutoSAMP.SAMP_VERSION]], "Short")
    }

    getVehiclePosition(vehicleID) {
	    return !AutoSAMP.checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : [AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_VEHICLE[AutoSAMP.SAMP_VERSION], vehicleID * 4 + 0x1134, 0x40, 0x14])), [0x30], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x34], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x38], "Float")]
    }

    getVehicleID() {
	    if (!AutoSAMP.checkHandles() || !AutoSAMP.isPlayerInAnyVehicle())
		    return false

	    return AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_LOCALPLAYER_DATA[AutoSAMP.SAMP_VERSION], AutoSAMP.isPlayerDriver() ? SAMP_CLOCALPLAYER_CURRENTVEHICLE[AutoSAMP.SAMP_VERSION] : SAMP_CLOCALPLAYER_LASTVEHICLE[AutoSAMP.SAMP_VERSION]], "UShort")
    }

    getPlayerVehicleID(playerID) {
	    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, SAMP_POOLS_PLAYER_REMOTEPLAYER_DATA[AutoSAMP.SAMP_VERSION], SAMP_CREMOTEPLAYER_VEHICLEID[AutoSAMP.SAMP_VERSION]], "UShort")
    }

    getPlayerVehiclePos(playerID) {
	    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() ? "" : [AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, SAMP_POOLS_PLAYER_REMOTEPLAYER_DATA[AutoSAMP.SAMP_VERSION]])), [SAMP_CREMOTEPLAYER_INCARTARGEDPOSITION[AutoSAMP.SAMP_VERSION]], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwAddress, [SAMP_CREMOTEPLAYER_INCARTARGEDPOSITION[AutoSAMP.SAMP_VERSION] + 0x4], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [SAMP_CREMOTEPLAYER_INCARTARGEDPOSITION[AutoSAMP.SAMP_VERSION] + 0x8], "Float")]
    }

    getTargetPed() {
	    if(!AutoSAMP.checkHandles())
            return 0

	    dwAddress := AutoSAMP.readDWORD(AutoSAMP.hGTA, 0xB6F3B8)
	    if(!dwAddress)
		    return 0
	    dwAddress := AutoSAMP.readDWORD(AutoSAMP.hGTA, dwAddress + 0x79C)
	    return dwAddress
    }

    getIdByPed(dwPed) {
        dwPed += 0
        dwPed := Floor(dwPed)
	
	    if(!dwPed)
		    return -1

        if (!AutoSAMP.updatePlayers())
		    return -1

	    for i, o in oPlayers
        {
		    if(o[2] == dwPed)
			    return i
        }
        return -1
    }

    ; VERSION 1.2
    getGameScreenWidthHeight() {
        if(!AutoSAMP.checkHandles())
            return false

        Width := AutoSAMP.readDWORD(AutoSAMP.hGTA, 0xC9C040)   
        Height := AutoSAMP.readDWORD(AutoSAMP.hGTA, 0xC9C044)
        return [Width, Height]
    }

    getVehiclePointer(vehicleID) {
	    return !AutoSAMP.checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_VEHICLE[AutoSAMP.SAMP_VERSION], vehicleID * 4 + 0x4FB4])
    }

    isCheckpointSet() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], SAMP_CGAME_CHECKPOINT_ENABLED[AutoSAMP.SAMP_VERSION]], "UChar")
    }

    toggleCheckpoint(toggle := true) {
	    return AutoSAMP.checkHandles() && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], SAMP_CGAME_CHECKPOINT_ENABLED[AutoSAMP.SAMP_VERSION]], toggle ? 1 : 0 ,"UChar")
    }

    isRaceCheckpointSet() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], SAMP_CGAME_RACECHECKPOINT_ENABLED[AutoSAMP.SAMP_VERSION]], "UChar")
    }

    toggleRaceCheckpoint(toggle := true) {
	    return AutoSAMP.checkHandles() && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], SAMP_CGAME_RACECHECKPOINT_ENABLED[AutoSAMP.SAMP_VERSION]], toggle ? 1 : 0 ,"UChar")
    }

    getRaceCheckpointType() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], SAMP_CGAME_RACECHECKPOINT_TYPE[AutoSAMP.SAMP_VERSION]], "UChar")
    }

    getRaceCheckpointSize() {
	    return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], SAMP_CGAME_RACECHECKPOINT_SIZE[AutoSAMP.SAMP_VERSION]], "Float")
    }

    getRaceCheckpointPos() {
	    if (!AutoSAMP.checkhandles())
		    return ""

	    dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION]])
	    Loop, 6
		    pos%A_Index% := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [SAMP_CGAME_RACECHECKPOINT_POSITION[AutoSAMP.SAMP_VERSION] + (A_Index - 1) * 4], "Float")

	    return [pos1, pos2, pos3, pos4, pos5, pos6]
    }

    setRaceCheckpoint(type, fX, fY, fZ, fXNext, fYNext, fZNext, fSize := 3.0) {
	    if (!AutoSAMP.checkHandles())
		    return false

	    VarSetCapacity(buf, 28, 0)
	    NumPut(fX, buf, 0, "Float")
	    NumPut(fY, buf, 4, "Float")
	    NumPut(fZ, buf, 8, "Float")
	    NumPut(fXNext, buf, 12, "Float")
	    NumPut(fYNext, buf, 16, "Float")
	    NumPut(fZNext, buf, 20, "Float")

	    if (!AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pMemory + 24, &buf, 28))
		    return false

	    return AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CGAME_SETRACINGCHECKPOINT[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION]])], ["i", type], ["i", AutoSAMP.pMemory + 24], ["i", AutoSAMP.pMemory + 36], ["f", fSize]], false, true) && AutoSAMP.toggleRaceCheckpoint()
    }

    toggleScoreboard(toggle := 1) {
	    return AutoSAMP.checkHandles() && (toggle ? AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CSCOREBOARD_ENABLE[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CSCOREBOARD[AutoSAMP.SAMP_VERSION]])]], false, true) : AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CSCOREBOARD_CLOSE[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CSCOREBOARD[AutoSAMP.SAMP_VERSION]])], ["i", 1]], false, true))
    }

    toggleChatInput(toggle := 1) {	
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + (toggle ? SAMP_CINPUT_OPEN[AutoSAMP.SAMP_VERSION] : SAMP_CINPUT_CLOSE[AutoSAMP.SAMP_VERSION]), [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CINPUT[AutoSAMP.SAMP_VERSION]])]], false, true)
    }

    getWeatherID() {
	    return !AutoSAMP.checkHandles() ? "" : AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xC81320, [0x0], "UShort")
    }

    getWeaponID(slot) {
	    return (slot < 0 || slot > 12 || !AutoSAMP.checkHandles()) ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x5A0 + slot * 0x1C])
    }

    isPlayerFrozen() {
	    return AutoSAMP.checkHandles() && AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x42], "UChar")
    }

    getPlayerPed(playerID) {
	    return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() ? 0x0 : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, 0x0, 0x0, 0x2A4])
    }

    setPlayerAttachedObject(slot, modelID, bone, xPos, yPos, zPos, xRot, yRot, zRot, xScale := 1, yScale := 1, zScale := 1, color1 := 0x0, color2 := 0x0) {
	    if (!AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], 0x8])))
		    return false

	    VarSetCapacity(struct, 52, 0)
	    NumPut(modelID, &struct, 0, "UInt")
	    NumPut(bone, &struct, 4, "UInt")

	    NumPut(xPos, &struct, 8, "Float")
	    NumPut(yPos, &struct, 12, "Float")
	    NumPut(zPos, &struct, 16, "Float")

	    NumPut(xRot, &struct, 20, "Float")
	    NumPut(yRot, &struct, 24, "Float")
	    NumPut(zRot, &struct, 28, "Float")

	    NumPut(xScale, &struct, 32, "Float")
	    NumPut(yScale, &struct, 36, "Float")
	    NumPut(zScale, &struct, 40, "Float")

	    NumPut(color1, &struct, 44, "UInt")
	    NumPut(color2, &struct, 48, "UInt")

	    return !AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pMemory + 1024, &struct, 52) ? false : AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CPED_ADDACCESSORY[AutoSAMP.SAMP_VERSION], [["i", dwAddress], ["i", slot], ["i", AutoSAMP.pMemory + 1024]], false, true)
    }

    setRemotePlayerAttachedObject(playerID, slot, modelID, bone, xPos, yPos, zPos, xRot, yRot, zRot, xScale := 1, yScale := 1, zScale := 1, color1 := 0x0, color2 := 0x0) {
	    if (!AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, 0x0])))
		    return false

	    if (!(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [0x0])))
		    return false

	    VarSetCapacity(struct, 52, 0)
	    NumPut(modelID, &struct, 0, "UInt")
	    NumPut(bone, &struct, 4, "UInt")

	    NumPut(xPos, &struct, 8, "Float")
	    NumPut(yPos, &struct, 12, "Float")
	    NumPut(zPos, &struct, 16, "Float")

	    NumPut(xRot, &struct, 20, "Float")
	    NumPut(yRot, &struct, 24, "Float")
	    NumPut(zRot, &struct, 28, "Float")

	    NumPut(xScale, &struct, 32, "Float")
	    NumPut(yScale, &struct, 36, "Float")
	    NumPut(zScale, &struct, 40, "Float")

	    NumPut(color1, &struct, 44, "UInt")
	    NumPut(color2, &struct, 48, "UInt")

	    return !AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pMemory + 1024, &struct, 52) ? false : AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CPED_ADDACCESSORY[AutoSAMP.SAMP_VERSION], [["i", dwAddress], ["i", slot], ["i", AutoSAMP.pMemory + 1024]], false, true)
    }

    quitGame() {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, 0x619B60, [["i", 0x1E], ["i", 0]])
    }

    createTextLabel(text, color, xPos, yPos, zPos, drawDistance := 46.0, testLOS := 0, playerID := 0xFFFF, vehicleID := 0xFFFF) {
	    if (!AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTLABEL[AutoSAMP.SAMP_VERSION]])))
		    return -1

	    Loop, % SAMP_MAX_TEXTLABELS {
		    if (AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [0xE800 + (SAMP_MAX_TEXTLABELS - A_Index) * 4]))
			    continue

		    return AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x11C0, [["i", dwAddress], ["i", SAMP_MAX_TEXTLABELS - A_Index], ["s", text], ["i", color], ["f", xPos], ["f", yPos], ["f", zPos], ["f", drawDistance], ["i", testLOS], ["i", playerID], ["i", vehicleID]], false, true) ? SAMP_MAX_TEXTLABELS - A_Index : -1
	    }

	    return -1
    }

    ; VERSION 1.3
    getConnectionTicks() {
	    return !AutoSAMP.checkHandles() ? 0 : DllCall("GetTickCount") - AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_CNETGAME_LASTCONNECTATTEMPT[AutoSAMP.SAMP_VERSION]], "UInt")
    }

    getRunningTime() {
	    return !AutoSAMP.checkHandles() ? 0 : AutoSAMP.__READMEM(AutoSAMP.hGTA, 0xB610E1, [0x0], "UInt") / 4
    }

    getTextLabelBySubstring(string) {
	    if (!AutoSAMP.updateTextLabels())
		    return ""

	    for i, o in oTextLabels {
		    if (InStr(o.TEXT, string))
			    return o.TEXT
	    }

	    return ""
    }

    updateTextLabels() {
	    if (!AutoSAMP.checkHandles())
		    return false
	
	    if (textLabelTick + 200 > A_TickCount)
		    return true
	
	    oTextLabels := []
	    dwTextLabels := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTLABEL[AutoSAMP.SAMP_VERSION]])
	    if (!dwTextLabels)
		    return false

	    Loop, % SAMP_MAX_TEXTLABELS {
		    i := A_Index - 1

		    if (!AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextLabels, [0xE800 + i * 4]))
			    continue
		
		    dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D])
		    if (!dwAddress)
			    continue

		    string := AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [0x0], 256)
		    if (string == "")
			    string := AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [0x0], AutoSAMP.getDialogTextSize(dwAddress))

		    if (string == "")
			    continue

		    fX := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0x8], "Float")
		    fY := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0xC], "Float")
		    fZ := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0x10], "Float")
		    wVehicleID := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0x1B], "UShort")
		    wPlayerID := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0x19], "UShort")
		
		    oTextLabels.Push(Object("ID", i, "TEXT", string, "XPOS", fX, "YPOS", fY, "ZPOS", fZ, "VEHICLEID", wVehicleID, "PLAYERID", wPlayerID, "VISIBLE", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0x18], "UChar"), "DISTANCE", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwTextLabels, [i * 0x1D + 0x14], "Float")))
	    }

	    textLabelTick := A_TickCount
	    return true
    }

    updateTextLabel(textLabelID, text) {
	    if (textLabelID < 0 || textLabelID > 2047 || !AutoSAMP.checkHandles())
		    return false

	    return AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTLABEL[AutoSAMP.SAMP_VERSION], textLabelID * 0x1D, 0x0], text)
    }

    deleteTextLabel(ByRef textLabelID) {
	    if (textLabelID < 0 || !AutoSAMP.checkHandles()) {
		    textLabelID := -1
		    return -1
	    }

	    if (AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x12D0, [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTLABEL[AutoSAMP.SAMP_VERSION]])], ["i", textLabelID]], false, true)) {
		    textLabelID := -1
		    return -1
	    }

	    return textLabelID
    }

    printPlayerTextLabels() {
	    if (!AutoSAMP.updateTextLabels())
		    return false

	    for i, o in oTextLabels {
		    if (o.TEXT != "" && o.TEXT != " " && o.PLAYERID != 0xFFFF)
			    AutoSAMP.addChatMessage("{FFFF00}ID: " o.ID ", Text: " o.TEXT ", " o.PLAYERID)
	    }

	    return true
    }

    printTextLabels() {
	    if (!AutoSAMP.updateTextLabels())
		    return false

	    for i, o in oTextLabels {
		    AutoSAMP.addChatMessage("{FFFF00}ID: " o.ID ", " o.XPOS ", " o.YPOS ", " o.ZPOS ", ")
		    AutoSAMP.addChatMessage("Text: " o.TEXT)
	    }

	    AutoSAMP.addChatMessage("TextLabel Count: " i)
	    return true
    }

    countLabels() {
	    return !AutoSAMP.updateTextLabels() ? -1 : oTextLabels.Length()
    }

    getPlayerAttachedTextLabel(playerID) {
	    if (!AutoSAMP.checkHandles() || !AutoSAMP.updateTextLabels())
		    return false

	    for i, o in oTextLabels {
		    if (playerID == o.PLAYERID)
			    return o
	    }

	    return false
    }

    getPlayerAttachedTextLabels(playerID) {
	    if (!AutoSAMP.checkHandles() || !AutoSAMP.updateTextLabels())
		    return false

	    labels := []

	    for i, o in oTextLabels {
		    if (playerID == o.PLAYERID)
			    labels.Push(o)
	    }

	    return labels
    }

    getLabelBySubstring(text := "") {
	    if (!AutoSAMP.updateTextLabels())
		    return 0
	
	    for i, o in oTextLabels {
		    if (text != "" && InStr(o.TEXT, text) == 0)
			    continue

		    return o
	    }

	    return ""
    }

    getNearestLabel(text := "") {
	    if (!AutoSAMP.updateTextLabels())
		    return 0
	
	    nearest := 0
	    dist := -1
	    pos1 := AutoSAMP.getPlayerPos()

	    for i, o in oTextLabels {
		    if (text != "" && !InStr(o.TEXT, text))
			    continue

		    newDist := AutoSAMP.getDistance(pos1, [o.XPOS, o.YPOS, o.ZPOS])
		    if (dist == -1 || newDist < dist) {
			    dist := newDist
			    nearest := o
		    }
	    }

	    return nearest
    }

    getNearestLabelDistance(text := "") {
	    if(!AutoSAMP.updateTextLabels())
		    return 0
	
	    nearest := 0
	    dist := 5000
	    pos1 := AutoSAMP.getPlayerPos()

	    For i, o in oTextLabels
	    {
		    if (text != "" && !InStr(o.TEXT, text))
			    continue

		    pos2 := [o.XPOS, o.YPOS, o.ZPOS]

		    dist2 := AutoSAMP.getDistance(pos1, pos2)

		    if (dist2 < dist) {
			    dist := dist2
			    nearest := o
		    }
	    }

	    return [nearest, dist]
    }

    createObject(modelID, xPos, yPos, zPos, xRot, yRot, zRot, drawDistance := 0) {
	    if (!(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_OBJECT[AutoSAMP.SAMP_VERSION]])) || AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [0x0]) == SAMP_MAX_OBJECTS)
		    return -1

	    Loop, % SAMP_MAX_OBJECTS - 1 {
		    i := SAMP_MAX_OBJECTS - A_Index
		    if (AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [i * 4 + 0x4]))
			    continue

		    return AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x12580, [["i", dwAddress], ["i", i], ["i", modelID], ["f", xPos], ["f", yPos], ["f", zPos], ["f", xRot], ["f", yRot], ["f", zRot], ["f", drawDistance]], false, true) ? i : -1
	    }

	    return -1
    }

    destroyObject(ByRef objectID) {
	    if (objectID < 0 || objectID > SAMP_MAX_OBJECTS - 1 || !AutoSAMP.checkHandles()) {
		    objectID := -1
		    return false
	    }

	    if (AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x12500, [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_OBJECT[AutoSAMP.SAMP_VERSION]])], ["i", objectID]], false, true)) {
		    objectID := -1
		    return true
	    }

	    return false
    }

    getClosestObject() {
	    if (!AutoSAMP.updateObjects())
		    return ""

	    dist := -1
	    obj := ""
	    pPos := AutoSAMP.getPlayerPos()

	    for i, o in oObjects {
		    if ((newDist := AutoSAMP.getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
			    obj := o
			    dist := newDist
		    }
	    }

	    return obj
    }

    getObjectPos(objectID) {
	    if (!AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_OBJECT[AutoSAMP.SAMP_VERSION]])) || !AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [objectID * 4 + 0x4]))
		    return false

	    dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [objectID * 0x4 + 0xFA4])
	    xPos := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x10B], "Float")
	    yPos := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x10F], "Float")
	    zPos := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x113], "Float")

	    xRot := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0xAD], "Float")
	    yRot := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0xB1], "Float")
	    zRot := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0xB5], "Float")
	    return [xPos, yPos, zPos, xRot, yRot, zRot]
    }

    printObjectPos(objectID) {
	    pos := AutoSAMP.getObjectPos(objectID)
	    if (pos == false)
		    return AutoSAMP.addChatMessage("Object not found.")

	    AutoSAMP.addChatMessage(pos[1] ", " pos[2] ", " pos[3] ", " pos[4] ", " pos[5] ", " pos[6])
	    return true
    }

    getClosestObjectByModel(modelID) {
	    if (!AutoSAMP.updateObjects())
		    return ""

	    dist := -1
	    obj := ""
	    pPos := AutoSAMP.getPlayerPos()

	    for i, o in oObjects {
		    if (o.MODELID != modelID)
			    continue

		    if ((newDist := AutoSAMP.getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
			    obj := o
			    dist := newDist
		    }
	    }

	    return obj
    }

    getClosestObjectModel() {
	    if (!AutoSAMP.updateObjects())
		    return ""

	    dist := -1
	    model := ""
	    pPos := AutoSAMP.getPlayerPos()

	    for i, o in oObjects {
		    if ((newDist := AutoSAMP.getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
			    dist := newDist
			    model := o.MODELID
		    }
	    }

	    return model
    }

    printObjects() {
	    if (!AutoSAMP.updateObjects())
		    return false

	    for i, o in oObjects
		    AutoSAMP.addChatMessage("Index: " o.ID ", Model: " o.MODELID ", xPos: " o.XPOS ", yPos: " o.YPOS ", zPos: " o.ZPOS ", " o.DRAW)

	    AutoSAMP.addChatMessage("Object Count: " i)

	    return true
    }

    printObjectsByModelID(modelID) {
	    if (!AutoSAMP.updateObjects())
		    return false

	    count := 0
	    for i, o in oObjects {
		    if (o.MODELID == modelID) {
			    count++
			    AutoSAMP.addChatMessage("ID: " o.ID ", Model: " o.MODELID ", xPos: " o.XPOS ", yPos: " o.YPOS ", zPos: " o.ZPOS)
		    }
	    }

	    AutoSAMP.addChatMessage("Object Count: " count)

	    return true
    }

    updateObjects() {
	    if (!AutoSAMP.checkHandles())
		    return false

	    if (objectTick + 1000 > A_TickCount)
		    return true

	    oObjects := []
	    objectTick := A_TickCount

	    dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_OBJECT[AutoSAMP.SAMP_VERSION]])
	    if (!dwAddress)
		    return false
	
	    count := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [0x0])

	    Loop, % SAMP_MAX_OBJECTS {
		    i := A_Index - 1
		
		    if (!AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [i * 4 + 0x4]))
			    continue

		    dwObject := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [i * 0x4 + 0xFA4])
		    oObjects.Push(Object("ID", i, "MODELID", AutoSAMP.__DWORD(AutoSAMP.hGTA, dwObject, [0x4E]), "XPOS", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwObject, [0x5C], "Float"), "YPOS", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwObject, [0x60], "Float"), "ZPOS", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwObject, [0x64], "Float"), "DRAW", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwObject, [0x53], "Float")))

		    count--
		    if (count <= 0)
			    break
	    }

	    return true
    }

    createPickup(modelID, type, xPos, yPos, zPos) {
	    if (!AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PICKUP[AutoSAMP.SAMP_VERSION]])))
		    return -1

	    Loop, % SAMP_MAX_PICKUPS {
		    if (AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [(A_Index - 1) * 4 + 0x4004], "Int") > 0)
			    continue

		    VarSetCapacity(struct, 20, 0)
		    NumPut(modelID, &struct, 0, "UInt")
		    NumPut(type, &struct, 4, "UInt")
		    NumPut(xPos, &struct, 8, "Float")
		    NumPut(yPos, &struct, 12, "Float")
		    NumPut(zPos, &struct, 16, "Float")
		    return !AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pMemory + 1024, &struct, 20) ? -1 : AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x12F20, [["i", dwAddress], ["i", AutoSAMP.pMemory + 1024], ["i", A_Index - 1]] , false, true) ? A_Index - 1 : -1
	    }

	    return -1
    }

    deletePickup(ByRef pickupID) {
	    if (pickupID < 0 || pickupID > SAMP_MAX_PICKUPS - 1 || !AutoSAMP.checkHandles())
		    return false

	    if (AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x12FD0, [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PICKUP[AutoSAMP.SAMP_VERSION]])], ["i", pickupID]], false, true)) {
		    pickupID := -1
		    return true
	    }

	    return false
    }

    getPickupModel(modelID) {
	    if (!AutoSAMP.updatePickups())
		    return ""

	    for i, o in oPickups {
		    if (o.MODELID == modelID)
			    return o
	    }

	    return ""
    }

    getClosestPickupModel() {
	    if (!AutoSAMP.updatePickups())
		    return -1

	    dist := -1
	    model := 0
	    pPos := AutoSAMP.getPlayerPos()

	    for i, o in oPickups {
		    if ((newDist := AutoSAMP.getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
			    dist := newDist
			    model := o.MODELID
		    }
	    }

	    return model
    }

    getDistanceToPickup(modelID) {
	    if (!AutoSAMP.updatePickups())
		    return -1

	    dist := -1
	    pPos := AutoSAMP.getPlayerPos()

	    for i, o in oPickups {
		    if (o.MODELID != modelID)
			    continue

		    if ((newDist := AutoSAMP.getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1)
			    dist := newDist
	    }

	    return dist
    }

    printPickups() {
	    if (!AutoSAMP.updatePickups())
		    return false

	    for i, o in oPickups
		    AutoSAMP.addChatMessage("ID: " o.ID ", Model: " o.MODELID ", Type: " o.TYPE ", xPos: " o.XPOS ", yPos: " o.YPOS ", zPos: " o.ZPOS)

	    AutoSAMP.addChatMessage("Pickup Count: " i)
	    return true
    }

    updatePickups() {
	    if (pickupTick + 200 > A_TickCount)
		    return true

	    if (!AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PICKUP[AutoSAMP.SAMP_VERSION]])) || (pickupCount := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [0x0])) <= 0)
		    return false

	    oPickups := []
	    Loop, % SAMP_MAX_PICKUPS {
		    pickupID := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [(i := A_Index - 1) * 4 + 0x4004], "Int")
		    if (pickupID < 0)
			    continue

		    pickupCount--
		    oPickups.Push(Object("ID", pickupID, "MODELID", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [i * 0x14 + 0xF004], "Int"), "TYPE", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [i * 0x14 + 0xF008], "Int"), "XPOS", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [i * 0x14 + 0xF00C], "Float"), "YPOS", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [i * 0x14 + 0xF010], "Float"), "ZPOS", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [i * 0x14 + 0xF014], "Float")))
		    if (pickupCount <= 0)
			    break
	    }

	    pickupTick := A_TickCount
	    return true
    }

    ; VERSION 1.4

	isPlayerUsingCell(playerID) {
		return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, 0x0, 0x0])
	}

	isNPC(playerID) {
		return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() ? "" : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4, SAMP_POOLS_PLAYER_REMOTEPLAYER_ISNPC[AutoSAMP.SAMP_VERSION]])
	}

	getGameState() {
		return !AutoSAMP.checkHandles() ? false : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_CNETGAME_GAMESTATE[AutoSAMP.SAMP_VERSION]])
	}

	getPlayerFightingStyle() {
		return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, GTA_CPED_PTR, [0x0, 0x72D], "UChar")
	}

	atan2(x, y) {
   		return DllCall("msvcrt\atan2", "Double", y, "Double", x, "CDECL Double")
	}

	calcAngle(xActor, yActor, xPoint, yPoint) {
		fX := xActor - xPoint
		fY := yActor - yPoint
		return AutoSAMP.atan2(fX, fY)
	}

	setCameraPosX(fAngle) {
		return AutoSAMP.checkHandles() && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, 0xB6F258, [0x0], fAngle, "Float")
	}

	getMapQuadrant(pos) {
		return pos[1] <= 0 ? (pos[2] <= 0 ? 3 : 1) : (pos[2] <= 0 ? 4 : 2)
	}

	getWeaponIDByName(weaponName) {
		for i, o in oWeaponNames {
			if (o = weaponName)
				return i - 1
		}

		return -1
	}

	getWeaponName(weaponID) {
		return weaponID < 0 || weaponID > oWeaponNames.MaxIndex() ? "" : oWeaponNames[weaponID + 1]
	}

	getPlayerAttachedObject(slot) {
		return slot < 0 || slot > 10 || !AutoSAMP.checkHandles() ? false : AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], 0x8, 0x74 + slot * 0x34])
	}

	getPlayerAttachedObjects() {
		if (!AutoSAMP.checkHandles() || !(dwLocalPlayerPED := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], 0x8])))
			return ""

		oPlayerObjects := []
		Loop, 10 {
			if (!(objectID := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwLocalPlayerPED, [0x74 + (A_Index - 1) * 0x34])))
				continue

			oPlayerObjects.Push(Object("SLOT", A_Index - 1, "OBJECTID", objectID))
		}

		return oPlayerObjects
	}

	getPlayerAttachedObjectPos(slot) {
		if (!AutoSAMP.checkHandles() || !(dwLocalPlayerPED := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], 0x8])))
			return ""

			posMatrix := []
			Loop, 9
				posMatrix[A_Index] := AutoSAMP.__READMEM(AutoSAMP.hGTA, dwLocalPlayerPED, [0x7C + slot * 0x34 + (A_Index - 1) * 0x4], "Float")
	
		return posMatrix
	}

	printPlayerAttachedObjectPos(slot) {
		if ((posMatrix := AutoSAMP.getPlayerAttachedObjectPos(slot)) == "")
			return AutoSAMP.addChatMessage("Slot not in use.")

		string := ""
		for i, o in posMatrix
			string .= o ", "

		StringTrimRight, string, string, 2
		return AutoSAMP.addChatMessage("Slot " slot ": " string)
	}

	printPlayerAttachedObjects() {
		if (!AutoSAMP.checkHandles() || !(dwLocalPlayerPED := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], 0x8])))
			return ""

		oPlayerObjects := []
		Loop, 10 {
			if (!(objectID := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwLocalPlayerPED, [0x74 + (A_Index - 1) * 0x34])))
				continue

			AutoSAMP.addChatMessage("SLOT: " A_Index - 1 ", OBJECTID: " objectID)
		}

		return oPlayerObjects
	}

	clearPlayerAttachedObject(slot) {
		return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0xAE5C0, [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION], 0x8])], ["i", slot]], false, true)
	}

	updateGangzones() {
		if (!AutoSAMP.checkHandles())
			return false

		if (gangZoneTick + 1000 > A_TickCount)
			return true

		oGangzones := []

		if (!(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_GANGZONE[AutoSAMP.SAMP_VERSION]])))
			return false

		Loop % SAMP_MAX_GANGZONES {
			if (!AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [(A_Index - 1) * 4 + 4 * SAMP_MAX_GANGZONES]))
				continue

			oGangzones.Push(Object("ID", A_Index - 1, "XMIN", AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwGangzone := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [(A_Index - 1) * 4])), [0x0], "Float"), "YMIN", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwGangzone, [0x4], "Float"), "XMAX", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwGangzone, [0x8], "Float"), "YMAX", AutoSAMP.__READMEM(AutoSAMP.hGTA, dwGangzone, [0xC], "Float"), "COLOR1", AutoSAMP.__DWORD(AutoSAMP.hGTA, dwGangzone, [0x10]), "COLOR2", AutoSAMP.__DWORD(AutoSAMP.hGTA, dwGangzone, [0x14])))
		}

		gangZoneTick := A_TickCount
		return true
	}

	printGangzones() {
		if (!AutoSAMP.updateGangzones())
			return false

		for i, o in oGangzones
			AutoSAMP.addChatMessage("ID: " o.ID ", X: " o.XMIN " - " o.XMAX ", Y: " o.YMIN " - " o.YMAX ", Colors: " AutoSAMP.IntToHex(o.COLOR1) " - " AutoSAMP.IntToHex(o.COLOR2))

		return true
	}

	createTextDraw(text, xPos, yPos, letterColor := 0xFFFFFFFF, font := 3, letterWidth := 0.4, letterHeight := 1, shadowSize := 0, outline := 1, shadowColor := 0xFF000000, box := 0, boxColor := 0xFFFFFFFF, boxSizeX := 0.0, boxSizeY := 0.0, left := 0, right := 0, center := 1, proportional := 1, modelID := 0, xRot := 0.0, yRot := 0.0, zRot := 0.0, zoom := 1.0, color1 := 0xFFFF, color2 := 0xFFFF) {
		if (font > 5 || StrLen(text) > 800 || !AutoSAMP.checkHandles() || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION]])))
			return -1

		Loop, 2048 {
			i := 2048 - A_Index
			if (AutoSAMP.__DWORD(AutoSAMP.hGTA, dwAddress, [i * 4]))
				continue

			VarSetCapacity(struct, 63, 0)
			NumPut((box ? 1 : 0) + (left ? 2 : 0) + (right ? 4 : 0) + (center ? 8 : 0) + (proportional ? 16 : 0), &struct, 0, "UChar")
			NumPut(letterWidth, &struct, 1, "Float")
			NumPut(letterHeight, &struct, 5, "Float")
			NumPut(letterColor, &struct, 9, "UInt")
			NumPut(boxSizeX, &struct, 0xD, "Float")
			NumPut(boxSizeY, &struct, 0x11, "Float")
			NumPut(boxColor, &struct, 0x15, "UInt")
			NumPut(shadowSize, &struct, 0x19, "UChar")
			NumPut(outline, &struct, 0x1A, "UChar")
			NumPut(shadowColor, &struct, 0x1B, "UInt")
			NumPut(font, &struct, 0x1F, "UChar")
			NumPut(1, &struct, 0x20, "UChar")
			NumPut(xPos, &struct, 0x21, "Float")
			NumPut(yPos, &struct, 0x25, "Float")
			NumPut(modelID, &struct, 0x29, "Short")
			NumPut(xRot, &struct, 0x2B, "Float")
			NumPut(yRot, &struct, 0x2F, "Float")
			NumPut(zRot, &struct, 0x33, "Float")
			NumPut(zoom, &struct, 0x37, "Float")
			NumPut(color1, &struct, 0x3B, "Short")
			NumPut(color2, &struct, 0x3D, "Short")
			return !AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pMemory + 1024, &struct, 63) ? -1 : AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x1E1C0, [["i", dwAddress], ["i", i], ["i", AutoSAMP.pMemory + 1024], ["s", text]], false, true) ? i : -1
		}

		return -1
	}

	deleteTextDraw(ByRef textDrawID) {
		if (textDrawID < 0 || textDrawID > SAMP_MAX_TEXTDRAWS - 1 || !AutoSAMP.checkHandles()) {
			textDrawID := -1
			return -1
		}

		if (AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + 0x1E0A0, [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION]])], ["i", textDrawID]], false, true)) {
			textDrawID := -1
			return -1
		}

		return textDrawID
	}

	updateTextDraws() {
		if (!AutoSAMP.checkHandles())
			return false

		if (textDrawTick + 1000 > A_TickCount)
			return true

		oTextDraws := []
		if (!(dwTextDraws := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION]])))
			return false
		
		Loop, % SAMP_MAX_TEXTDRAWS {
			if (!AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextDraws, [(A_Index - 1) * 4]) || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS))])))
				continue

			oTextDraws.Push(Object("TYPE", "Global", "ID", A_Index - 1, "TEXT", AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [0x0], 800)))
		}

		Loop, % SAMP_MAX_PLAYERTEXTDRAWS {
			if (!AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextDraws, [(A_Index - 1) * 4 + SAMP_MAX_TEXTDRAWS * 4]) || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS * 2))])))
				continue

			oTextDraws.Push(Object("TYPE", "Player", "ID", A_Index - 1, "TEXT", AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [0x0], 800)))
		}

		textDrawTick := A_TickCount
		return true
	}

	printTextDraws() {
		if (!AutoSAMP.updateTextDraws())
			return false

		for i, o in oTextDraws
			AutoSAMP.addChatMessage("Type: " o.TYPE ", ID: " o.ID ", Text: " o.TEXT)

		AutoSAMP.addChatMessage("TextDraw Count: " i)
		return true
	}

	getLYDWantedLevel() {
		if (!AutoSAMP.checkHandles() || !(dwTextDraws := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION]])))
			return ""

		Loop, % SAMP_MAX_PLAYERTEXTDRAWS {
			if (!AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextDraws, [(A_Index - 1) * 4 + SAMP_MAX_TEXTDRAWS * 4]) || !(dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS * 2))])) || !InStr((string := AutoSAMP.__READSTRING(AutoSAMP.hGTA, dwAddress, [0x0], 800)), "Wantedlevel"))
				continue

			RegExMatch(string, "Wantedlevel: ~w~(\d+)", wantedlevel)
			return wantedlevel1
		}

		return ""
	}

	getTextDrawBySubstring(substring) {
		if (!AutoSAMP.updateTextDraws())
			return ""

		for i, o in oTextDraws {
			if (InStr(o.TEXT, substring))
				return o.TEXT
		}

		return ""
	}

	getTextDrawPos(textDrawID) {
		return textDrawID < 0 || textDrawID > 2047 || !AutoSAMP.checkHandles() ? "" : [AutoSAMP.__READMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION], textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x98B], "Float"), AutoSAMP.__READMEM(AutoSAMP.hGTA, dwAddress, [0x98F], "Float")]
	}

	moveTextDraw(textDrawID, xPos, yPos) {
		return textDrawID < 0 || textDrawID > 2047 || AutoSAMP.checkHandles() && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION], textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x98B], xPos, "Float") && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, dwAddress, [0x98F], yPos, "Float")
	}

	resizeTextDraw(textDrawID, letterWidth, letterHeight) {
		return textDrawID < 0 || textDrawID > 2047 || AutoSAMP.checkHandles() 
		&& AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP
		, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION], textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x963], letterWidth
		, "Float") && AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, dwAddress, [0x967], letterHeight, "Float")
	}

	updateTextDraw(textDrawID, text) {
		if (textDrawID < 0 || textDrawID > 2047 || StrLen(text) > 800 || !AutoSAMP.checkHandles())
			return false

		dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_TEXTDRAW[AutoSAMP.SAMP_VERSION], textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])
		return AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, dwAddress, [0x0], text) 
	}

	saveGTASettings() {
		return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, 0x57C660, [["i", 0xBA6748]], false, true)
	}

	playAudioEvent(eventID) {
		if (!AutoSAMP.checkHandles())
			return false

		VarSetCapacity(buf, 12, 0)
		NumPut(0, buf, 0, "Float")
		NumPut(0, buf, 4, "Float")
		NumPut(0, buf, 8, "Float")
		if (!AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pMemory + 20, &buf, 12))
			return false

		return AutoSAMP.CALL(AutoSAMP.hGTA, 0x507340, [["i", AutoSAMP.pMemory + 20], ["i", eventID]], false, false)
	}

	getCity(x, y, z) {
		if (z > 900.0)
			return "Interior"

		for i, o in cities {
			if (x >= o.X1 && y >= o.Y1 && x <= o.X2 && y <= o.Y2)
				return o.NAME
		}

		return "Unbekannt"
	}

	getZone(x, y, z) {
		if (z > 900.0)
			return "Interior"

		for i, o in zones {
			if (x >= o.X1 && y >= o.Y1 && x <= o.X2 && y <= o.Y2)
				return o.NAME
		}

		return "Unbekannt"
	}

	getIpInfo(IP) {
		UrlDownloadToFile, % "http://api.2ip.ua/geo.xml?ip=" IP, ipinfo.xml
		UrlDownloadToFile, % "http://api.2ip.ua/provider.xml?ip=" IP, infprov.xml
		FileRead, ipinfo, *P65001 %A_ScriptDir%\ipinfo.xml
		FileRead, infprov, *P65001 %A_ScriptDir%\infprov.xml
		RegExMatch(ipinfo,"<country_rus>(.*)</country_rus>.*<region_rus>(.*)</region_rus>.*<city_rus>(.*)</city_rus>.*<latitude>(.*)</latitude>.*<longitude>(.*)</longitude>.*<time_zone>(.*)</time_zone>",infip)
		infprov := RegExReplace(infprov,"&quot;","''")
		RegExMatch(infprov,"<ip>(.*)</ip>.*<name_rus>(.*)</name_rus>.*<site>(.*)</site>",infp)
		FileDelete, %A_ScriptDir%\ipinfo.xml
		FileDelete, %A_ScriptDir%\infprov.xml
		infip := Array(infip1,infip2,infip3,infip4,infip5,infip6,infp1,infp2,infp3) 
		;<< 1 - Страна 2 - Область 3 - Город 4 - latitude 5 - longitude 6 - Часовой пояс 7 - Ip Adrees с сервера 8 - Имя провайдера 9 - Сайт провайдера >>
		return infip
	}

	; VERSION 1.5
	getGravity() {
		return !AutoSAMP.checkHandles() ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, 0x863984, [0x0], "Float")
	}
	
	chatPageUp() {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CCHAT_PAGEUP[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION]])]], false, true)
    }
	
	chatPageDown() {
	    return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CCHAT_PAGEDOWN[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION]])]], false, true)
    }
	
	chatScroll(nDelta) {
		return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CCHAT_SCROLL[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CCHAT[AutoSAMP.SAMP_VERSION]])], ["i", nDelta]], false, true)
	}
	
	setCursorMode(nMode) {
		return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CGAME_SETCURSORMODE[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION]])], ["i", nMode], ["i", 0]], false, true)
	}
	
	enableHUD(bEnable) {
		return AutoSAMP.checkHandles() && AutoSAMP.CALL(AutoSAMP.hGTA, AutoSAMP.dwSAMP + SAMP_CGAME_ENABLEHUD[AutoSAMP.SAMP_VERSION], [["i", AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CGAME[AutoSAMP.SAMP_VERSION]])], ["i", bEnable]], false, true)
	}
	
	setPlayerName(playerID, name) {
	    if (playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !AutoSAMP.checkHandles() || AutoSAMP.getPlayerScore(playerID) == "")
		    return ""

	    if (AutoSAMP.__DWORD(AutoSAMP.hGTA, (dwAddress := AutoSAMP.__DWORD(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_POOLS[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER[AutoSAMP.SAMP_VERSION], SAMP_POOLS_PLAYER_REMOTEPLAYER[AutoSAMP.SAMP_VERSION] + playerID * 4])), [SAMP_POOLS_PLAYER_REMOTEPLAYER_SIZE[AutoSAMP.SAMP_VERSION]]) > 15)
		    return AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, dwAddress, [SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK[AutoSAMP.SAMP_VERSION], 0x0], name)

	    return AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, dwAddress, [SAMP_POOLS_PLAYER_REMOTEPLAYER_NICK[AutoSAMP.SAMP_VERSION]], name)
    }
	
	; VERSION 1.6
	getCheckDialogButton() {
    	if (AutoSAMP.isDialogOpen() == 1)
    	{
  			Loop
  			{
   				if (GetKeyState("LButton","P"))
   				{
    				Loop
    				{
     					if (AutoSAMP.isDialogButtonSelected(1) == 1)
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 1
     					}
     					else if (GetKeyState("LButton","P"))
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 1
     					}
     					else if (GetKeyState("Esc","P"))
     					{
     						while (AutoSAMP.isDialogOpen() = 0)
                            	return 0
     					}
     					else if (GetKeyState("Enter","P"))
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 1
     					}
     					else
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 0
     					}
    				}
   				}
   				if (GetKeyState("Up","P") || GetKeyState("Down","P"))
   				{
    				Loop
    				{
     					if (AutoSAMP.isDialogButtonSelected(1) == 1)
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 1
     					}
     					else if (GetKeyState("LButton","P"))
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 1
     					}
     					else if (GetKeyState("Esc","P"))
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 0
     					}
     					else if (GetKeyState("Enter","P"))
     					{
      						while (AutoSAMP.isDialogOpen() = 0)
                            	return 1
     					}
     					else if (AutoSAMP.isDialogOpen() = 0)
                        	return 0
    				}
   				}
   				else if (GetKeyState("Esc", "P") && GetKeyState("Enter", "U"))
   				{
    				while (AutoSAMP.isDialogOpen() = 0)
                    	return 0
   				}
   				else if (GetKeyState("Enter", "P") && GetKeyState("Esc", "U"))
   				{
    				while (AutoSAMP.isDialogOpen() = 0)
                    	return 1
   				}
   				else if (GetKeyState("Enter", "P"))
    				return 1
   				else if (GetKeyState("Esc", "P"))
                	return 0
   				else if (AutoSAMP.isDialogOpen() = 0)
                	return 1
  			}
    	}
    	if (AutoSAMP.isDialogOpen() == 0)
        	return 0
	}

	isDialogButtonSelected(btn := 1) {
		return !AutoSAMP.checkHandles() ? -1 : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CDIALOG[AutoSAMP.SAMP_VERSION], SAMP_CDIALOG_LISTBOX[AutoSAMP.SAMP_VERSION], (btn == 1 ? 0x165 : 0x2C5)], "Byte")
	}

	nightVision(value) {
		if (!AutoSAMP.checkHandles())
			return false
		if (value)
			AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, 0xC402B8, [0x0], 0x1)
		else
			AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, 0xC402B8, [0x0], 0x0)
	}

	thermalVision(value) {
		if (!AutoSAMP.checkHandles())
			return false
		if (value)
			AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, 0xC402B9, [0x0], 0x1)
		else
			AutoSAMP.__WRITEMEM(AutoSAMP.hGTA, 0xC402B9, [0x0], 0x0)
	}

	setIP(IP) {
    	if(!AutoSAMP.checkHandles())
        	return false

		AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CNETGAME[AutoSAMP.SAMP_VERSION], SAMP_CNETGAME_HOSTADDRESS[AutoSAMP.SAMP_VERSION]], IP)
	}

    ; [-----------------------------------------------------------------------------------------------------]
    
	getByteSize(number) {
		return number <= 0xFF ? 1 : number <= 0xFFFF ? 2 : 4
	}

	__INJECT(hProcess, aInstructions) {
		aOpcodes := { "mov edi" : 0x3D8B, "NOP" : 0x90, "mov ecx" : 0xB9, "mov dword" : 0x05C7, "push" : 0x68, "call" : 0xE8, "mov byte" : 0x05C6
		, "ret" : 0xC3, "add esp" : 0xC483, "xor edi, edi" : 0xFF33, "xor eax, eax" : 0xC033, "mov edi, eax" : 0xF88B, "push edi" : 0x57, "push eax" : 0x50
		, "mov address, eax" : 0xA3, "mov [address], eax" : 0x0589, "test eax, eax" : 0xC085, "jz" : 0x74, "mov ecx, eax" : 0xC88B, "jmp" : 0xEB
		, "mov edx" : 0xBA, "fstp" : 0x1DD9}
		dwLen := 0
		for i, o in aInstructions
			dwLen += AutoSAMP.getByteSize(aOpcodes[o[1]]) + ((datatypes[o[2][2]] == null) ? 0 : datatypes[o[2][2]]) + ((datatypes[o[3][2]] == null ? 0 : datatypes[o[3][2]]))
		VarSetCapacity(injectData, dwLen, 0)
		dwDataOffset := 0
		for i, o in aInstructions
		{
			NumPut(aOpcodes[o[1]], injectData, dwDataOffset, AutoSAMP.getByteSize(aOpcodes[o[1]]) == 1 ? "UChar" : "UShort")
			dwDataOffset += AutoSAMP.getByteSize(aOpcodes[o[1]])
			if (o[2][1] != null)
			{
				NumPut(o[2][1] - (o[1] = "call" ? (pInjectFunc + 4 + dwDataOffset) : 0), injectData, dwDataOffset, o[2][2])
				dwDataOffset += datatypes[o[2][2]]
			}
			else
				continue
			if (o[3][1] != null)
			{
				NumPut(o[3][1], injectData, dwDataOffset, o[3][2])
				dwDataOffset += datatypes[o[3][2]]
			}
		}
		AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pInjectFunc, &injectData, dwLen)
		hThread := AutoSAMP.createRemoteThread(AutoSAMP.hGTA, 0, 0, AutoSAMP.pInjectFunc, 0, 0, 0)
		if (ErrorLevel)
			return false
		AutoSAMP.waitForSingleObject(hThread, 0xFFFFFFFF)
		AutoSAMP.closeProcess(hThread)
		return ErrorLevel ? false : AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.pMemory, [0x0], "Int")
	}

	IntToHex(int) {
		CurrentFormat := A_FormatInteger
		SetFormat, integer, hex
		int += 0
		SetFormat, integer, %CurrentFormat%
		return int
	}

    checkHandles() {
	    return !AutoSAMP.refreshGTA() || !AutoSAMP.refreshSAMP() || !AutoSAMP.refreshMemory() ? false : true
    }

    getPID(szWindow) {
        local dwPID := 0
        WinGet, dwPID, PID, %szWindow%
        return dwPID
    }

    virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
        if(!hProcess) {
            ErrorLevel := ERROR_INVALID_HANDLE
		    AutoSAMP.addLog("ERROR", "Function (virtualFreeEx) error code №" ErrorLevel)
            return 0
        }

        dwRet := DllCall("VirtualFreeEx", "UInt", hProcess, "UInt", lpAddress, "UInt", dwSize, "UInt", dwFreeType, "UInt")
        if(dwRet == 0) {
            ErrorLEvel := ERROR_FREE_MEMORY
		    AutoSAMP.addLog("ERROR", "Function (virtualFreeEx) error code №" ErrorLevel)
            return 0
        }

        ErrorLevel := ERROR_OK
        return dwRet
    }

    closeProcess(hProcess) {
        if(hProcess == 0) {
            ErrorLevel := ERROR_INVALID_HANDLE
		    AutoSAMP.addLog("ERROR", "Function (closeProcess) error code №" ErrorLevel)
            return 0
        }

        dwRet := DllCall("CloseHandle", "Uint", hProcess, "UInt")
        ErrorLevel := ERROR_OK
    }

    openProcess(dwPID, dwRights = 0x1F0FFF) {
        hProcess := DllCall("OpenProcess", "UInt", dwRights, "int",  0, "UInt", dwPID, "Uint")
        if(hProcess == 0) {
            ErrorLevel := ERROR_OPEN_PROCESS
		    AutoSAMP.addLog("ERROR", "Function (openProcess) error code №" ErrorLevel)
            return 0
        }

        ErrorLevel := ERROR_OK
        return hProcess
    }

    refreshGTA() {
	    if (!(newPID := AutoSAMP.getPID(AutoSAMP.GTA_PID)))
	    {
		    if (AutoSAMP.hGTA)
		    {
			    AutoSAMP.virtualFreeEx(AutoSAMP.hGTA, AutoSAMP.pMemory, 0, 0x8000)
			    AutoSAMP.closeProcess(AutoSAMP.hGTA)
		    }
		    AutoSAMP.dwGTAPID := 0, AutoSAMP.hGTA := 0x0, AutoSAMP.dwSAMP := 0x0, AutoSAMP.pMemory := 0x0
		    return false
	    }
	    if (!AutoSAMP.hGTA || AutoSAMP.dwGTAPID != newPID)
	    {
		    if (!(AutoSAMP.hGTA := AutoSAMP.openProcess(newPID)))
		    {
			    AutoSAMP.dwGTAPID := 0, AutoSAMP.hGTA := 0x0, AutoSAMP.dwSAMP := 0x0, AutoSAMP.pMemory := 0x0
			    return false
		    }
		    AutoSAMP.dwGTAPID := newPID, AutoSAMP.dwSAMP := 0x0, AutoSAMP.pMemory := 0x0
	    }
	    return true
    }

    getModuleBaseAddress(sModule, hProcess) {
        if(!sModule) {
            ErrorLevel := ERROR_MODULE_NOT_FOUND
		    AutoSAMP.addLog("ERROR", "Function (getModuleBaseAddress) error code №" ErrorLevel)
            return 0
        }

        if(!hProcess) {
            ErrorLevel := ERROR_INVALID_HANDLE
		    AutoSAMP.addLog("ERROR", "Function (getModuleBaseAddress) error code №" ErrorLevel)
            return 0
        }

        dwSize = 1024*4                
        VarSetCapacity(hMods, dwSize)
        VarSetCapacity(cbNeeded, 4)        
        dwRet := DllCall("Psapi.dll\EnumProcessModulesEx", "UInt", hProcess, "UInt", &hMods, "UInt", dwSize, "UInt*", cbNeeded, "UInt", 0x03, "UInt")
    
        if(dwRet == 0) {
            ErrorLevel := ERROR_ENUM_PROCESS_MODULES
		    AutoSAMP.addLog("ERROR", "Function (getModuleBaseAddress) error code №" ErrorLevel)
            return 0
        }

        dwMods := cbNeeded / 4       
        i := 0
        VarSetCapacity(hModule, 4)        
        VarSetCapacity(sCurModule, 260)    
        while(i < dwMods) {
            hModule := NumGet(hMods, i*4)
            DllCall("Psapi.dll\GetModuleFileNameEx", "UInt", hProcess, "UInt", hModule, "Str", sCurModule, "UInt", 260)
            SplitPath, sCurModule, sFilename
            if(sModule == sFilename) {
                ErrorLevel := ERROR_OK
                return hModule
            }
            i := i + 1
        }

        ErrorLevel := ERROR_MODULE_NOT_FOUND
	    AutoSAMP.addLog("ERROR", "Function (getModuleBaseAddress) error code №" ErrorLevel)
        return 0
    }

    refreshSAMP()
    {
	    if (AutoSAMP.dwSAMP)
		    return true
	    AutoSAMP.dwSAMP := AutoSAMP.getModuleBaseAddress(AutoSAMP.SAMP_MODULE, AutoSAMP.hGTA)

	    if (!AutoSAMP.dwSAMP)
		    return false

	    return true
    }

    virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
        if(!hProcess) {
            ErrorLevel := ERROR_INVALID_HANDLE
		    AutoSAMP.addLog("ERROR", "Function (virtualAllocEx) error code №" ErrorLevel)
            return 0
        }

        dwRet := DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", dwSize, "UInt", flAllocationType, "UInt", flProtect, "UInt")
    
        if(dwRet == 0) {
            ErrorLEvel := ERROR_ALLOC_MEMORY
		    AutoSAMP.addLog("ERROR", "Function (virtualAllocEx) error code №" ErrorLevel)
            return 0
        }

        ErrorLevel := ERROR_OK
        return dwRet
    }

    refreshMemory() {
	    if (!AutoSAMP.pMemory)
	    {
		    AutoSAMP.pMemory := AutoSAMP.virtualAllocEx(AutoSAMP.hGTA, 6144, 0x1000 | 0x2000, 0x40)
		    if (ErrorLevel)
		    {
			    AutoSAMP.pMemory := 0x0
			    return false
		    }
		    AutoSAMP.pInjectFunc := AutoSAMP.pMemory + 5120
		    AutoSAMP.pDetours	:= AutoSAMP.pInjectFunc + 1024
	    }
	    return true
    }

    CALL(hProcess, dwFunc, aParams, bCleanupStack = true, bThisCall = false, bReturn = false, sDatatype = "Char") {
	    if (!hProcess || !dwFunc)
		    return ""
	    dataOffset := 0
	    i := aParams.MaxIndex()
	    bytesUsed := 0
	    bytesMax := 5120
	    dwLen := i * 5 + bCleanupStack * 3 + bReturn * 5 + 6
	    VarSetCapacity(injectData, dwLen, 0)
	    while (i > 0)
	    {
		    if (aParams[i][1] == "i" || aParams[i][1] == "p" || aParams[i][1] == "f")
			    value := aParams[i][2]
		    else if (aParams[i][1] == "s")
		    {
			    if (bytesMax - bytesUsed < StrLen(aParams[i][2]))
				    return ""
			    value := AutoSAMP.pMemory + bytesUsed
			    AutoSAMP.__WRITESTRING(hProcess, value, [0x0], aParams[i][2])
			    bytesUsed += StrLen(aParams[i][2]) + 1
			    if (ErrorLevel)
				    return ""
		    }
		    else
			    return ""
		    NumPut((bThisCall && i == 1 ? 0xB9 : 0x68), injectData, dataOffset, "UChar")
		    NumPut(value, injectData, ++dataOffset, aParams[i][1] == "f" ? "Float" : "Int")
		    dataOffset += 4
		    i--
	    }
	    offset := dwFunc - (AutoSAMP.pInjectFunc + dataOffset + 5)
	    NumPut(0xE8, injectData, dataOffset, "UChar")
	    NumPut(offset, injectData, ++dataOffset, "Int")
	    dataOffset += 4
	    if (bReturn)
	    {
		    NumPut(sDatatype = "Char" || sDatatype = "UChar" ? 0xA2 : 0xA3, injectData, dataOffset, "UChar")
		    NumPut(pMemory, injectData, ++dataOffset, "UInt")
		    dataOffset += 4
	    }
	    if (bCleanupStack)
	    {
		    NumPut(0xC483, injectData, dataOffset, "UShort")
		    dataOffset += 2
		    NumPut((aParams.MaxIndex() - bThisCall) * 4, injectData, dataOffset, "UChar")
		    dataOffset++
	    }
	    NumPut(0xC3, injectData, dataOffset, "UChar")
	    AutoSAMP.__WRITERAW(AutoSAMP.hGTA, AutoSAMP.pInjectFunc, &injectData, dwLen)
	    if (ErrorLevel)
		    return ""
	    hThread := AutoSAMP.createRemoteThread(AutoSAMP.hGTA, 0, 0, AutoSAMP.pInjectFunc, 0, 0, 0)
	    if (ErrorLevel)
		    return ""
	    AutoSAMP.waitForSingleObject(hThread, 0xFFFFFFFF)
	    AutoSAMP.closeProcess(hThread)
	    if (bReturn)
		    return AutoSAMP.__READMEM(AutoSAMP.hGTA, AutoSAMP.pMemory, [0x0], sDatatype)
	    return true
    }

    __WRITESTRING(hProcess, dwAddress, oOffsets, wString) {
	    if (!hProcess || !dwAddress)
		    return false
	    if A_IsUnicode
		    wString := AutoSAMP.__unicodeToAnsi(wString)
	    requiredSize := StrPut(wString)
	    VarSetCapacity(buffer, requiredSize)
	    for i, o in oOffsets
	    {
		    if (i == oOffsets.MaxIndex())
		    {
			    StrPut(wString, &buffer, StrLen(wString) + 1)
			    return DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", buffer, "UInt", requiredSize, "UInt", 0, "UInt")
		    }
		    dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", buffer, "UInt", 4, "UInt*", 0)
		    if (!dwRet)
			    return false
		    dwAddress := NumGet(buffer, 0, "UInt")
	    }
    }

    __ansiToUnicode(sString, nLen = 0) {
        If !nLen
        {
            nLen := DllCall("MultiByteToWideChar", "Uint", 0, "Uint", 0, "Uint", &sString, "int",  -1, "Uint", 0, "int",  0)
        }

        VarSetCapacity(wString, nLen * 2)

        DllCall("MultiByteToWideChar", "Uint", 0, "Uint", 0, "Uint", &sString, "int",  -1, "Uint", &wString, "int",  nLen)

        return wString
    }

    __unicodeToAnsi(wString, nLen = 0) {
        pString := wString + 1 > 65536 ? wString : &wString

        If !nLen
        {
            nLen := DllCall("WideCharToMultiByte", "Uint", 0, "Uint", 0, "Uint", pString, "int",  -1, "Uint", 0, "int",  0, "Uint", 0, "Uint", 0)
        }

        VarSetCapacity(sString, nLen)

        DllCall("WideCharToMultiByte", "Uint", 0, "Uint", 0, "Uint", pString, "int",  -1, "str",  sString, "int",  nLen, "Uint", 0, "Uint", 0)
        return sString
    }

    __WRITERAW(hProcess, dwAddress, pBuffer, dwLen) {
	    return (!hProcess || !dwAddress || !pBuffer || dwLen < 1) ? false : DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress, "UInt", pBuffer, "UInt", dwLen, "UInt", 0, "UInt")
    }

    createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
        if(!hProcess) {
            ErrorLevel := ERROR_INVALID_HANDLE
            AutoSAMP.addLog("ERROR", "Function (createRemoteThread) error code №" ErrorLevel)
            return 0
        }

        dwRet := DllCall("CreateRemoteThread", "UInt", hProcess, "UInt", lpThreadAttributes, "UInt", dwStackSize, "UInt", lpStartAddress, "UInt", lpParameter, "UInt", dwCreationFlags, "UInt", lpThreadId, "UInt")
        if(dwRet == 0) {
            ErrorLEvel := ERROR_ALLOC_MEMORY
            AutoSAMP.addLog("ERROR", "Function (createRemoteThread) error code №" ErrorLevel)
            return 0
        }

        ErrorLevel := ERROR_OK
        return dwRet
    }

    waitForSingleObject(hThread, dwMilliseconds) {
        if(!hThread) {
            ErrorLevel := ERROR_INVALID_HANDLE
            AutoSAMP.addLog("ERROR", "Function (waitForSingleObject) error code №" ErrorLevel)
            return 0
        }

        dwRet := DllCall("WaitForSingleObject", "UInt", hThread, "UInt", dwMilliseconds, "UInt")
        if(dwRet == 0xFFFFFFFF) {
            ErrorLEvel := ERROR_WAIT_FOR_OBJECT
            AutoSAMP.addLog("ERROR", "Function (waitForSingleObject) error code №" ErrorLevel)
            return 0
        }

        ErrorLevel := ERROR_OK
        return dwRet
    }

    __READMEM(hProcess, dwAddress, oOffsets, sDatatype = "Int", dwSize := 4) {
	    if (!hProcess || !dwAddress)
		    return ""
	    VarSetCapacity(dwRead, dwSize)
	    for i, o in oOffsets
	    {
		    dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", dwSize, "UInt*", 0)
		    if (!dwRet)
			    return ""
		    if (i == oOffsets.MaxIndex())
			    return NumGet(dwRead, 0, sDatatype)
		    dwAddress := NumGet(dwRead, 0, "UInt")
	    }
    }

    __READSTRING(hProcess, dwAddress, oOffsets, dwLen) {
	    if (!hProcess || !dwAddress)
		    return ""
	    VarSetCapacity(dwRead, dwLen)
	    for i, o in oOffsets
	    {
		    if (i == oOffsets.MaxIndex())
		    {
			    dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", dwLen, "UInt*", 0, "UInt")
			    return !dwRet ? "" : (A_IsUnicode ? AutoSAMP.__ansiToUnicode(dwRead) : dwRead)
		    }
		    dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
		    if (!dwRet)
			    return ""
		    dwAddress := NumGet(dwRead, 0, "UInt")
	    }
    }

    __DWORD(hProcess, dwAddress, offsets) {
	    if (!hProcess || !dwAddress)
		    return ""
	    VarSetCapacity(dwRead, 4)
	    for i, o in offsets
	    {
		    dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
		    if (!dwRet)
			    return ""
		    dwAddress := NumGet(dwRead, 0, "UInt")
	    }
	    return dwAddress
    }

    __READBYTE(hProcess, dwAddress) {
	    if (!AutoSAMP.checkHandles())
		    return false
	    VarSetCapacity(value, 1, 0)
	    DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress, "Str", value, "UInt", 1, "UInt *", 0)
	    return NumGet(value, 0, "Byte")
    }

    __WRITEMEM(hProcess, dwAddress, oOffsets, value, sDatatype = "Int") {
	    dwLen := datatypes[sDatatype]
	    if (dwLen < 1 || !hProcess || !dwAddress)
		    return false
	    VarSetCapacity(dwRead, 4)
	    for i, o in oOffsets
	    {
		    if (i == oOffsets.MaxIndex())
		    {
			    NumPut(value, dwRead, 0, sDatatype)
			    return DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "UInt", &dwRead, "UInt", dwLen, "UInt", 0)
		    }
		    dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
		    if (!dwRet)
			    return false
		    dwAddress := NumGet(dwRead, 0, "UInt")
	    }
    }

    readDWORD(hProcess, dwAddress) {
        if(!hProcess) {
            ErrorLevel := ERROR_INVALID_HANDLE
            return 0
        }

        VarSetCapacity(dwRead, 4)    
        dwRet := DllCall("ReadProcessMemory", "UInt",  hProcess, "UInt",  dwAddress, "Str",   dwRead, "UInt",  4, "UInt*", 0)
        if(dwRet == 0) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }

        ErrorLevel := ERROR_OK
        return NumGet(dwRead, 0, "UInt")
    }
}
