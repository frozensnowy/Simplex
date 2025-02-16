// -------------------------------------------------------------------------------------------------------------------------------------------------------------//
// HOD Script created from 'C:\Programmi\Sierra\Homeworld2\Data\ship\vgr_mothership\vgr_mothership.hod'.
// CFHodEd v2.8.5
// Date: 03-07-2009 Time: 16:59:11
// -------------------------------------------------------------------------------------------------------------------------------------------------------------//

// 7 materials located
STAT_Add( 'lambert1', 'default', 0 ); 
STAT_Add( 'MS_Front_Shader', 'ship', 2 );  {
	STAT_SetParamter( 2, 1, 5, 0, 0, 0, 0, 0, '$diffuse' );
	STAT_SetParamter( 2, 2, 5, 0, 0, 0, 0, 1, '$glow' ); }

STAT_Add( 'MS_Back_Shader', 'ship', 2 );  {
	STAT_SetParamter( 3, 1, 5, 0, 0, 0, 0, 2, '$diffuse' );
	STAT_SetParamter( 3, 2, 5, 0, 0, 0, 0, 3, '$glow' ); }

STAT_Add( 'MS_Inside_Shader', 'ship', 2 );  {
	STAT_SetParamter( 4, 1, 5, 0, 0, 0, 0, 4, '$diffuse' );
	STAT_SetParamter( 4, 2, 5, 0, 0, 0, 0, 5, '$glow' ); }

STAT_Add( 'MS_Badge_R_Shader', 'badge', 3 );  {
	STAT_SetParamter( 5, 1, 5, 0, 0, 0, 0, 6, '$mask' );
	STAT_SetParamter( 5, 2, 5, 0, 0, 0, 0, 7, '$diffuse' );
	STAT_SetParamter( 5, 3, 5, 0, 0, 0, 0, 8, '$glow' ); }

STAT_Add( 'MS_Burner_Shader', 'thruster', 4 );  {
	STAT_SetParamter( 6, 1, 5, 0, 0, 0, 0, 9, '$diffuseOn' );
	STAT_SetParamter( 6, 2, 5, 0, 0, 0, 0, 10, '$diffuseOff' );
	STAT_SetParamter( 6, 3, 5, 0, 0, 0, 0, 11, '$glowOn' );
	STAT_SetParamter( 6, 4, 5, 0, 0, 0, 0, 12, '$glowOff' ); }

STAT_Add( 'MS_Badge_L_Shader', 'badge', 3 );  {
	STAT_SetParamter( 7, 1, 5, 0, 0, 0, 0, 13, '$mask' );
	STAT_SetParamter( 7, 2, 5, 0, 0, 0, 0, 14, '$diffuse' );
	STAT_SetParamter( 7, 3, 5, 0, 0, 0, 0, 15, '$glow' ); }


// 233 joints located
HIER_Add( 'Root', '', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red3', 'Root', -33,63656, 365,3329, 886,7095, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red4', 'Root', -0,4864203, -445,7645, -898,7133, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid1', 'Root', 102,2072, 370,2849, -389,1138, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid2', 'Root', -0,4864203, -414,3492, -886,6282, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid3', 'Root', -33,63656, 362,2997, 886,7095, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse', 'Root', 86,30286, 313,1045, -367,4278, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse1', 'Root', -87,91203, 313,1045, -367,4278, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse2', 'Root', -87,91203, 313,1045, -186,3071, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse3', 'Root', 86,30286, 313,1045, -186,3071, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse4', 'Root', -87,91203, 313,1045, 3,433424, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse5', 'Root', 86,30286, 313,1045, 3,433424, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse6', 'Root', -87,91203, 313,1045, 129,1542, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse7', 'Root', 86,30286, 313,1045, 129,1542, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse8', 'Root', -87,91203, 293,5404, 488,6579, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse9', 'Root', 86,30286, 293,5404, 488,6579, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid4', 'Root', 0, -145,8625, 1064,157, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid5', 'Root', 0, -112,3545, 1142,675, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid6', 'Root', 0, -82,93771, 1214,13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Blue1', 'Root', -269,765, 33,50178, -751,574, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Blue2', 'Root', -272,2864, -164,2041, -778,9676, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_rear2', 'Root', -75,82597, -304,1541, -1163,806, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_rear1', 'Root', 75,82597, -304,1541, -1163,806, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid13', 'Root', -3,876524, 224,7337, 1241,246, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Blue3', 'Root', -17,03729, -326,1326, -190,8891, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid12', 'Root', -79,66683, -295,0866, -64,36195, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid11', 'Root', -79,66683, -295,0866, 36,97628, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid10', 'Root', -126,5448, -302,0696, 241,2978, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid9', 'Root', -126,5448, -302,0696, 294,3147, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid8', 'Root', -125,0649, -302,7658, 469,3127, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid7', 'Root', -125,0649, -302,7658, 563,4133, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid14', 'Root', 79,66683, -295,0866, -64,36195, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid15', 'Root', 79,66683, -295,0866, 36,97628, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid16', 'Root', 126,5448, -302,0696, 241,2978, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid17', 'Root', 126,5448, -302,0696, 294,3147, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid18', 'Root', 125,0649, -302,7658, 469,3127, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid19', 'Root', 125,0649, -302,7658, 563,4133, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse12', 'Root', -247,5638, -67,99934, -377,9791, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse13', 'Root', -247,5638, -67,99934, -216,172, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse10', 'Root', -243,6794, -10,80042, -242,3128, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse11', 'Root', -243,6794, -10,80042, -353,5372, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse14', 'Root', -76,05241, -309,1986, -804,5153, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse15', 'Root', -76,05241, -309,1986, -750,3906, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse16', 'Root', 75,94102, -309,1986, -750,3906, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse17', 'Root', 75,94102, -309,1986, -804,5153, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse18', 'Root', 247,5638, -67,99934, -377,9791, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse19', 'Root', 247,5638, -67,99934, -216,172, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse20', 'Root', 243,6794, -10,80042, -242,3128, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayPulse21', 'Root', 243,6794, -10,80042, -353,5372, 7,01958310949562E-15, 180, 0, 1, 1, -1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red1', 'Root', 102,2072, 391,8031, -370,1547, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red2', 'Root', -26,72357, 276,8482, -916,1851, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red5', 'Root', 105,2548, 306,2601, -505,8391, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red6', 'Root', -105,4425, 306,2601, -505,8391, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Red7', 'Root', -3,865063, 229,5694, -1034,667, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid20', 'Root', -1,192093E-07, 155,4957, 1276,84, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid21', 'Root', 58,63361, -256,912, 772,6041, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_Aid22', 'Root', -58,58994, -256,912, 772,6041, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayGlow', 'Root', 0, 313,1045, -105,8503, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayGlow1', 'Root', 0, 313,1045, 294,0308, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayGlow2', 'Root', 235,0304, -40,74186, -289,1649, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayGlow3', 'Root', -235,03, -40,74186, -289,1649, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayGlow4', 'Root', -75,56596, -292,393, -774,0778, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'NavLight_BayGlow5', 'Root', 75,566, -292,393, -774,0778, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint0', 'Root', 137,1461, 193,1587, 618,6571, 125,99210357666, 90, 48,9680824279785, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint0Left', 'CapturePoint0', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint0Up', 'CapturePoint0', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint0Heading', 'CapturePoint0', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint1', 'Root', 178,8749, 45,68008, 330,0789, 90, 90, 14,3214702606201, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint1Left', 'CapturePoint1', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint1Up', 'CapturePoint1', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint1Heading', 'CapturePoint1', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint2', 'Root', 219,5245, -23,95743, -785,6926, 90, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint2Left', 'CapturePoint2', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint2Up', 'CapturePoint2', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint2Heading', 'CapturePoint2', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint3', 'Root', -180,8605, 105,3376, -879,0097, 286,024475097656, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint3Left', 'CapturePoint3', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint3Up', 'CapturePoint3', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint3Heading', 'CapturePoint3', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint4', 'Root', -148,7226, 165,7492, 516,821, 282,935943603516, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint4Left', 'CapturePoint4', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint4Up', 'CapturePoint4', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint4Heading', 'CapturePoint4', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint5', 'Root', -113,4714, 145,5331, 981,1525, 282,935943603516, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint5Left', 'CapturePoint5', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint5Up', 'CapturePoint5', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint5Heading', 'CapturePoint5', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6', 'Root', 40,2912, -278,2523, 622,0203, 0, 0, 180, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6Left', 'CapturePoint6', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6Up', 'CapturePoint6', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6Heading', 'CapturePoint6', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint7', 'Root', -49,5923, -279,6976, 249,4562, 0, 0, 180, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6Left', 'CapturePoint7', 0, 0, 16,59046, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6Up', 'CapturePoint7', -1,705303E-13, 14,63166, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'CapturePoint6Heading', 'CapturePoint7', -16,04952, 0, -2,273737E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint0', 'Root', 118,1372, 82,7659, 1037,565, 0, 270, 270, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint0Left', 'RepairPoint0', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint0Up', 'RepairPoint0', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint0Heading', 'RepairPoint0', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint1', 'Root', 103,0888, 215,8086, 910,7527, 304,462711334229, 270, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint1Left', 'RepairPoint1', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint1Up', 'RepairPoint1', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint1Heading', 'RepairPoint1', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint2', 'Root', 182,486, 105,2992, -851,3088, 0, 270, 270, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint2Left', 'RepairPoint2', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint2Up', 'RepairPoint2', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint2Heading', 'RepairPoint2', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint3', 'Root', 94,44625, -230,1821, 707,1843, 0, 270, 270, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint3Left', 'RepairPoint3', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint3Up', 'RepairPoint3', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint3Heading', 'RepairPoint3', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint4', 'Root', -110,5145, -245,363, 388,7822, 281,945259094238, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint4Left', 'RepairPoint4', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint4Up', 'RepairPoint4', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint4Heading', 'RepairPoint4', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint5', 'Root', -192,6203, -84,70227, -1118,326, 291,69898223877, 80,9358291625977, 360, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint5Left', 'RepairPoint5', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint5Up', 'RepairPoint5', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint5Heading', 'RepairPoint5', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint6', 'Root', -303,1979, -59,30002, -826,4818, 291,621322631836, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint6Left', 'RepairPoint6', 5,609632, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint6Up', 'RepairPoint6', 0, 4,264637, 1,136868E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'RepairPoint6Heading', 'RepairPoint6', 0, 0, 4,167451, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense3_Position', 'Root', 139,5269, 161,8856, -747,4537, 287,445808410645, 90, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense3_Direction', 'Weapon_HullDefense3_Position', 0, 10, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense3_Rest', 'Weapon_HullDefense3_Position', 0, 0, 10, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense3_Muzzle', 'Weapon_HullDefense3_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense2_Position', 'Root', 52,88121, 236,756, 1041,524, 13,4315462112427, 69,932746887207, 83,821647644043, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense2_Direction', 'Weapon_HullDefense2_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense2_Rest', 'Weapon_HullDefense2_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense2_Muzzle', 'Weapon_HullDefense2_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense1_Position', 'Root', -54,26422, 236,736, 1041,553, 4,87625980377197, 286,013717651367, 286,524436950684, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense1_Direction', 'Weapon_HullDefense1_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense1_Rest', 'Weapon_HullDefense1_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense1_Muzzle', 'Weapon_HullDefense1_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense4_Position', 'Root', -139,7719, 161,8418, -747,2722, 290,832237243652, 270, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense4_Direction', 'Weapon_HullDefense4_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense4_Rest', 'Weapon_HullDefense4_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense4_Muzzle', 'Weapon_HullDefense4_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense5_Position', 'Root', 239,7895, -158,0937, -453,1321, 136,696182250977, 270,013275146484, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense5_Direction', 'Weapon_HullDefense5_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense5_Rest', 'Weapon_HullDefense5_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense5_Muzzle', 'Weapon_HullDefense5_Position', 0, 0,1069005, -4,547474E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense6_Position', 'Root', -239,408, -158,3101, -453,0497, 135,738983154297, 89,9867248535156, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense6_Direction', 'Weapon_HullDefense6_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense6_Rest', 'Weapon_HullDefense6_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense6_Muzzle', 'Weapon_HullDefense6_Position', 0, 0,1069005, -4,547474E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense7_Position', 'Root', -215,616, -44,0167, -1012,713, 7,01958310949562E-15, 268,631278991699, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense7_Direction', 'Weapon_HullDefense7_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense7_Rest', 'Weapon_HullDefense7_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense7_Muzzle', 'Weapon_HullDefense7_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense8_Position', 'Root', 215,616, -44,34552, -1024,208, 0, 87,9877548217773, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense8_Direction', 'Weapon_HullDefense8_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense8_Rest', 'Weapon_HullDefense8_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense8_Muzzle', 'Weapon_HullDefense8_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense9_Position', 'Root', -62,32396, -29,10824, 1080,291, 360, 286,423095703125, 42,9909896850586, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense9_Direction', 'Weapon_HullDefense9_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense9_Rest', 'Weapon_HullDefense9_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense9_Muzzle', 'Weapon_HullDefense9_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense10_Position', 'Root', 62,42681, -29,23302, 1079,719, 329,027988433838, 75,5946578979492, 282,49405670166, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense10_Direction', 'Weapon_HullDefense10_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense10_Rest', 'Weapon_HullDefense10_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense10_Muzzle', 'Weapon_HullDefense10_Position', 0, 0,1069005, -4,547474E-13, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense11_Position', 'Root', 120,533, 272,0242, 330,4743, 271,222183227539, 87,1613616943359, 307,598976135254, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense11_Direction', 'Weapon_HullDefense11_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense11_Rest', 'Weapon_HullDefense11_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense11_Muzzle', 'Weapon_HullDefense11_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense12_Position', 'Root', -119,5472, 272,4714, 342,1718, 181,52880859375, 266,173225402832, 143,163909912109, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense12_Direction', 'Weapon_HullDefense12_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense12_Rest', 'Weapon_HullDefense12_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_HullDefense12_Muzzle', 'Weapon_HullDefense12_Position', 0, 0, 0,1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'EngineNozzle1', 'Root', 0,6128828, -84,43407, -1283,677, 0, 0, 0, 1, 1, 1, 7,01958310949562E-15, 180, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production1_Position', 'Root', -230,5527, 58,65806, -237,3438, 359,997968614567, 0, 77,9412841796875, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production1_Direction', 'HardPoint_Production1_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production1_Rest', 'HardPoint_Production1_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production2_Position', 'Root', -231,4011, 58,65806, -354,622, 0, 0, 76,7469711303711, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production2_Direction', 'HardPoint_Production2_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production2_Rest', 'HardPoint_Production2_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production3_Position', 'Root', 231,2384, 58,65806, -299,2486, 180, 180, 103,554809570313, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production3_Direction', 'HardPoint_Production3_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production3_Rest', 'HardPoint_Production3_Position', 0, 0, 17,98013, 359,2916238904, 359,41740077734, 359,771566823125, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production4_Position', 'Root', -6,681471E-02, 200,9686, -746,2458, 0, 0, 1,84037071448984E-05, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production4_Direction', 'HardPoint_Production4_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Production4_Rest', 'HardPoint_Production4_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System1_Position', 'Root', -159,5077, 6,6865, 795,9423, 4,95557498931885, 0, 77,9999008178711, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System1_Direction', 'HardPoint_System1_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System1_Rest', 'HardPoint_System1_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System2_Position', 'Root', 159,4378, 6,058513, 795,8527, 4,9574933052063, 0, 281,931335449219, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System2_Direction', 'HardPoint_System2_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System2_Rest', 'HardPoint_System2_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System3_Position', 'Root', 3,346552, 276,0966, 795,9865, 6,0787615776062, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System3_Direction', 'HardPoint_System3_Position', 0, 11,41047, 0, 6,39665126800537E-02, 0,540247440338135, 359,962528936565, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System3_Rest', 'HardPoint_System3_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System4_Position', 'Root', 3,346552, 288,0408, 679,6225, 4,85359859466553, 359,737194031477, 359,844559937716, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System4_Direction', 'HardPoint_System4_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_System4_Rest', 'HardPoint_System4_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Sensors_Position', 'Root', 0, -219,4613, 775,8665, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Sensors_Direction', 'HardPoint_Sensors_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'HardPoint_Sensors_Rest', 'HardPoint_Sensors_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Hardpoint_Resource_Position', 'Root', 0, -333,11, -841,977, 0, 0, 1,84037071448984E-05, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Hardpoint_Resource_Direction', 'Hardpoint_Resource_Position', -8,622505E-06, -15,43375, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Hardpoint_Resource_Rest', 'Hardpoint_Resource_Position', 0, 0, 17,98013, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Hardpoint_Engine_Position', 'Root', 0, -73,977, -1237,104, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Hardpoint_Engine_Rest', 'Hardpoint_Engine_Position', 0, 11,41047, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Hardpoint_Engine_Direction', 'Hardpoint_Engine_Position', 0, 0, -8,703743, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK1_Position', 'Root', 190, 73, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK1_Rest', 'Weapon_QK1_Position', -4, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK1_Direction', 'Weapon_QK1_Position', 40, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK2_Position', 'Root', -190, 73, 184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK2_Rest', 'Weapon_QK2_Position', 4, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK2_Direction', 'Weapon_QK2_Position', -40, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK3_Position', 'Root', 0, -279, 580, 0, 0, 180, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK3_Rest', 'Weapon_QK3_Position', 0, 0, 10, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK3_Direction', 'Weapon_QK3_Position', 0, 10, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK3_Latitude', 'Weapon_QK3_Position', 0, 5, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK3_Muzzle', 'Weapon_QK3_Latitude', 0, 0, 10, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK4_Position', 'Root', 0, -279, 203, 0, 180, 180, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK4_Rest', 'Weapon_QK4_Position', 0, 0, 10, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK4_Direction', 'Weapon_QK4_Position', 0, 10, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK4_Latitude', 'Weapon_QK4_Position', 0, 5, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_QK4_Muzzle', 'Weapon_QK4_Latitude', 0, 0, 10, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1 );
HIER_Add( 'Weapon_pl1_Position', 'Root', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl1_Rest', 'Weapon_pl1_Position', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl1_Direction', 'Weapon_pl1_Position', 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl2_Position', 'Root', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl2_Rest', 'Weapon_pl2_Position', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl2_Direction', 'Weapon_pl2_Position', 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl3_Position', 'Root', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl3_Rest', 'Weapon_pl3_Position', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl3_Direction', 'Weapon_pl3_Position', 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl4_Position', 'Root', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl4_Rest', 'Weapon_pl4_Position', 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
HIER_Add( 'Weapon_pl4_Direction', 'Weapon_pl4_Position', 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );

// 62 NavLights located
NAVL_Add( 'NavLight_Red3', 0, 15, 1,2, 0,3, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Red4', 0, 15, 2,2, 0,4, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid1', 0, 10, 0, 0,5, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid2', 0, 10, 0, 0,15, 'default', 0,6235294, 0,4117647, 0,1529412, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid3', 0, 10, 0, 0,15, 'default', 0,6235294, 0,4117647, 0,1529412, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse', 0, 12, 1,5, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse1', 0, 12, 0, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse2', 0, 12, 2,2, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse3', 0, 12, 1, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse4', 0, 12, 1,7, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse5', 0, 12, 0,6, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse6', 0, 12, 0,8, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse7', 0, 12, 2, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse8', 0, 12, 1,5, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse9', 0, 12, 1, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid4', 0, 10, 0, 0,33, 'default', 0, 0,5882353, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid5', 0, 8, 1, 0,33, 'default', 0, 0,5882353, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid6', 0, 6, 2, 0,33, 'default', 0, 0,5882353, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Blue1', 0, 15, 2, 0,26, 'default', 0, 0,5882353, 0,9019608, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Blue2', 0, 15, 0, 0,26, 'default', 0, 0,5882353, 0,9019608, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_rear2', 0, 8, 0, 0,5, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_rear1', 0, 8, 1, 0,5, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid13', 0, 18, 0, 0,5, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Blue3', 0, 15, 1,54, 0,26, 'default', 0, 0,5882353, 0,9019608, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid12', 0, 13, 4,4, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid11', 0, 13, 3,25, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid10', 0, 13, 2,7, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid9', 0, 13, 2,1, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid8', 0, 13, 0,7, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid7', 0, 13, 0,12, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid14', 0, 13, 4,4, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid15', 0, 13, 3,6, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid16', 0, 13, 3,1, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid17', 0, 13, 2,2, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid18', 0, 13, 0,9, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid19', 0, 13, 0, 0,2, 'default', 0, 0,7960784, 0,2352941, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse12', 0, 10, 2, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse13', 0, 10, 2, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse10', 0, 10, 0, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse11', 0, 10, 0, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse14', 0, 10, 1, 0,5, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse15', 0, 10, 1, 0,5, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse16', 0, 10, 1, 0,5, 'default', 0,9333333, 0,7254902, 9,411765E-02, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse17', 0, 10, 1, 0,5, 'default', 0,9333333, 0,7254902, 9,411765E-02, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse18', 0, 10, 2, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse19', 0, 10, 2, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse20', 0, 10, 0, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayPulse21', 0, 10, 0, 0,28, 'default', 0,9411765, 0,7843137, 0, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Red1', 0, 15, 0, 1, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Red2', 0, 15, 0, 0,5, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Red5', 0, 15, 0, 0,3, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Red6', 0, 15, 0, 0,3, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Red7', 0, 15, 0, 1, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid20', 0, 18, 0, 1, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid21', 0, 18, 0, 1, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_Aid22', 0, 18, 0, 1, 'default', 1, 0,145098, 0,145098, 1, 0, 1, 1 );
NAVL_Add( 'NavLight_BayGlow', 0, 1000, 0, 0, 'default', 0,3333333, 0,8117647, 1, 1, 1000, 0, 0 );
NAVL_Add( 'NavLight_BayGlow1', 0, 1000, 0, 0, 'default', 0,3333333, 0,8117647, 1, 1, 1000, 0, 0 );
NAVL_Add( 'NavLight_BayGlow2', 0, 550, 0, 0, 'default', 0,3333333, 0,8117647, 1, 1, 550, 0, 0 );
NAVL_Add( 'NavLight_BayGlow3', 0, 550, 0, 0, 'default', 0,3333333, 0,8117647, 1, 1, 550, 0, 0 );
NAVL_Add( 'NavLight_BayGlow4', 0, 120, 0, 0, 'default', 0,3333333, 0,8117647, 1, 1, 120, 0, 0 );
NAVL_Add( 'NavLight_BayGlow5', 0, 120, 0, 0, 'default', 0,3333333, 0,8117647, 1, 1, 120, 0, 0 );

// 45 Markers located
MRKR_Add( 'marker22', 'Root', 0, 0, 186,453162515632, 103,048124043007, -821,711236167252, 344,456636698421, 89,3931976712906, 348,635212814721, 0 );
MRKR_Add( 'marker23', 'Root', 0, 0, 218,352192550218, -66,5077638229319, -710,266949827249, 344,456636698421, 89,3931976712906, 348,635212814721, 0 );
MRKR_Add( 'marker24', 'Root', 0, 0, 216,062100085395, 2,64270165785337, -651,938719119509, 344,456636698421, 89,3931976712906, 348,635212814721, 0 );
MRKR_Add( 'marker25', 'Root', 0, 0, 142,650531268416, 37,1690738691466, 976,667429785356, 0, 83,5696079578299, 10,4589942555911, 0 );
MRKR_Add( 'marker26', 'Root', 0, 0, 97,3745212980831, 262,193723250067, 785,89008705754, 3,31514212030002, 352,775657018305, 44,7799544072254, 0 );
MRKR_Add( 'marker27', 'Root', 0, 0, 140,129171516854, 76,3455769074805, 860,705458691804, 0, 83,5696079578299, 10,4589942555911, 0 );
MRKR_Add( 'marker28', 'Root', 0, 0, 10,8786012097522, 291,263114258157, 710,791066837968, 276,851845581878, 356,862149744846, 359,659024691413, 0 );
MRKR_Add( 'marker29', 'Root', 0, 0, 89,7332436612272, -99,9529853222859, 853,572372156645, 337,402364528202, 69,0765070276989, 310,408609259289, 0 );
MRKR_Add( 'marker30', 'Root', 0, 0, 69,1427992022915, -67,0662515607605, 991,922913550485, 337,402364528202, 69,0765070276989, 310,408609259289, 0 );
MRKR_Add( 'marker31', 'Root', 0, 0, 37,1224560900022, 47,8323254253578, 1206,32635951252, 288,376305816375, 357,330116007055, 270,182011508566, 0 );
MRKR_Add( 'marker32', 'Root', 0, 0, -33,0454158757852, 77,6506740051919, 1220,55261289319, 71,8798492859245, 359,186228015722, 265,958319445539, 0 );
MRKR_Add( 'marker33', 'Root', 0, 0, -59,9283339078076, -73,0572138711075, 1006,78807658961, 62,8214917452129, 354,929518853084, 312,546375729191, 0 );
MRKR_Add( 'marker34', 'Root', 0, 0, -136,454286193612, 80,9120454884554, 887,14989927076, 83,478500940461, 356,253643391143, 256,61590960781, 0 );
MRKR_Add( 'marker35', 'Root', 0, 0, -135,551204512216, 125,300320174051, 797,668823558529, 83,4260946030113, 356,421055784049, 257,436259140862, 0 );
MRKR_Add( 'marker36', 'Root', 0, 0, -23,9480476130168, -367,237333736676, -570,3993403776, 91,6762104290953, 358,875170460685, 357,931281243525, 0 );
MRKR_Add( 'marker37', 'Root', 0, 0, 94,5210546064918, -355,779626365673, -469,106416285357, 92,032042772932, 357,73653521406, 23,8481709830969, 0 );
MRKR_Add( 'marker38', 'Root', 0, 0, -112,971190476292, -350,348095933381, -452,385617446516, 92,0524574457574, 359,269360395386, 335,199737108073, 0 );
MRKR_Add( 'marker39', 'Root', 0, 0, 3,26701181969834, -301,060991324595, -232,276748481383, 89,2784031553062, 359,267739015617, 0,231898075853844, 0 );
MRKR_Add( 'marker40', 'Root', 0, 0, -2,40509993227292, -283,052295076131, 205,807162446912, 89,2784031553062, 359,267739015617, 0,231898075853844, 0 );
MRKR_Add( 'marker41', 'Root', 0, 0, -33,2953925358782, -282,835935294875, 232,519485062982, 89,2784031553062, 359,267739015617, 0,231898075853844, 0 );
MRKR_Add( 'marker42', 'Root', 0, 0, -2,10038197754978, -278,251914602913, 586,879338645771, 89,2784031553062, 359,267739015617, 0,231898075853844, 0 );
MRKR_Add( 'marker43', 'Root', 0, 0, -13,1293039842369, 201,05331484828, -705,957946821116, 88,3305717417419, 1,13487992922807, 178,275490483605, 0 );
MRKR_Add( 'marker44', 'Root', 0, 0, 105,157505959841, 171,901358409915, -807,883803079673, 88,3305717417419, 1,13487992922807, 178,275490483605, 0 );
MRKR_Add( 'marker45', 'Root', 0, 0, -14,7952673634053, 169,231919683607, -1016,90370192554, 99,1254342747606, 1,13487992922807, 178,275490483606, 0 );
MRKR_Add( 'marker1', 'Root', 0, 0, 201,746186169182, 0, 123,888060035428, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker2', 'Root', 0, 0, 194,801529833129, 79,0552128397524, 94,5131004861977, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker3', 'Root', 0, 0, 208,291900385154, -42,5084765525739, 155,922690085987, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker4', 'Root', 0, 0, 196,206431949654, -1,02263241772271, 264,909318491099, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker5', 'Root', 0, 0, 175,411297355374, 43,2166745572524, 575,792196736051, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker6', 'Root', 0, 0, 146,141447112359, 201,509432912169, 540,577419843664, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker7', 'Root', 0, 0, 172,889937603812, 82,3931775955863, 459,830225642499, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker8', 'Root', 0, 0, 152,613242670001, 122,366930502896, 568,48411205127, 0, 85,6509050963809, 10,4589942555643, 0 );
MRKR_Add( 'marker9', 'Root', 0, 0, -187,063553964205, -28,5884653710894, 558,260555785436, 83,478500940461, 356,253643391143, 256,61590960781, 0 );
MRKR_Add( 'marker10', 'Root', 0, 0, -164,223225295857, 113,394683420174, 512,158503485162, 83,4260946030113, 356,421055784049, 257,436259140862, 0 );
MRKR_Add( 'marker11', 'Root', 0, 0, -185,119415864553, 9,46242034847353, 441,361162815902, 83,1908080410654, 357,31102850832, 261,737825490694, 0 );
MRKR_Add( 'marker12', 'Root', 0, 0, -180,960912799528, 69,7270735335232, 412,596209907906, 83,478500940461, 356,253643391143, 256,61590960781, 0 );
MRKR_Add( 'marker13', 'Root', 0, 0, -234,504656670823, 51,6115012362928, -268,36915980912, 90,8904787295164, 1,81159535606253, 260,258617939621, 0 );
MRKR_Add( 'marker14', 'Root', 0, 0, -153,243465459676, 230,745299280285, -59,9357473385534, 91,0730517115303, 2,03318317047175, 257,52831870181, 0 );
MRKR_Add( 'marker15', 'Root', 0, 0, -246,477032582942, -8,3705816590218, -122,136713822879, 90,839149968776, 2,92348537274106, 261,806906778303, 0 );
MRKR_Add( 'marker16', 'Root', 0, 0, -243,319585969966, 46,6571788879459, -150,601629139652, 91,1251045962439, 1,86568463843948, 256,713087692598, 0 );
MRKR_Add( 'marker17', 'Root', 0, 0, -187,318360755276, 94,6408994778495, -712,597054742953, 90,8904787295164, 1,81159535606253, 260,258617939621, 0 );
MRKR_Add( 'marker18', 'Root', 0, 0, -158,77127773759, 244,952610797163, -417,064174931388, 91,0730517115303, 2,03318317047175, 257,52831870181, 0 );
MRKR_Add( 'marker19', 'Root', 0, 0, -219,436890152309, -40,4465338010804, -667,651176564717, 91,2050787502716, 2,79271585015726, 269,135663403715, 0 );
MRKR_Add( 'marker20', 'Root', 0, 0, -214,992514810804, -13,1689102818188, -843,802538434929, 91,5207073393184, 1,56019579832782, 269,889122266966, 0 );
MRKR_Add( 'marker21', 'Root', 0, 0, 223,388237657686, -47,4963725350102, -868,27400165724, 344,456636698421, 89,3931976712906, 348,635212814721, 0 );

// 15 dockpaths located
DOCK_Add( 'path1', 'world', 1, 0, 'Fighter', 0, '', 4 ); {
	DOCK_SetKeyframe( 1, 1, -114,5305, 76,18095, -208,669, 55,3028793334961, 270, 0, 1, 5, 0, 100, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 1, 2, -168,4784, -50,94492, -208,6986, 19,9034156799316, 270, 0, 1, 30, 0, 150, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 1, 3, -464,5768, -58,13617, -208,699, 0, 270, 0, 1, 75, 0, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 1, 4, -599,5352, -80,3203, -208,699, 0, 270, 0, 0, 50, 0, 200, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path5', 'world', 0, 1, 'Utility', 0, '', 4 ); {
	DOCK_SetKeyframe( 2, 1, 1300, -248,4358, -808,29, 0, 270, 0, 1, 50, 0, 0, 0, 0, 0, 1, 0, 0 );
	DOCK_SetKeyframe( 2, 2, 1200, -266,1545, -808,29, 0, 270, 0, 1, 17, 0, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 2, 3, 207,4103, -279,4435, -808,2899, 0, 270, 0, 1, 22, 1, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 2, 4, 4,775887, -288,3029, -808,2899, 0, 270, 0, 1, 30, 0, 0, 1, 1, 0, 0, 0, 0 ); } 

DOCK_Add( 'path6', 'world', 1, 1, 'Utility', 0, '', 4 ); {
	DOCK_SetKeyframe( 3, 1, -5,844725, -288,303, -808,29, 0, 270, 0, 1, 10, 0, 0, 1, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 3, 2, -265,9801, -288,303, -808,29, 0, 270, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 3, 3, -385,1549, -288,303, -801,85, 0, 270, 0, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 3, 4, -565,7465, -288,303, -788,88, 0, 270, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path7', 'world', 0, 1, 'Utility', 0, '', 4 ); {
	DOCK_SetKeyframe( 4, 1, -1300, -248,436, -720,426, 0, 90, 0, 1, 50, 0, 0, 0, 0, 0, 1, 0, 0 );
	DOCK_SetKeyframe( 4, 2, -1200, -266,1547, -720,426, 0, 90, 0, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 4, 3, -202,0867, -279,4437, -720,426, 0, 90, 0, 1, 29, 1, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 4, 4, 4,776, -288,303, -720,426, 0, 90, 0, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path8', 'world', 1, 1, 'Utility', 0, '', 4 ); {
	DOCK_SetKeyframe( 5, 1, -5,845, -288,303, -720,426, 0, 90, 0, 1, 10, 0, 0, 1, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 5, 2, 263,62, -288,303, -720,426, 0, 90, 0, 0, 30, 0, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 5, 3, 383,323, -288,303, -720,426, 0, 90, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 5, 4, 562,847, -288,303, -720,426, 0, 90, 0, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path11', 'world', 0, 0, 'Fighter', 0, '', 7 ); {
	DOCK_SetKeyframe( 6, 1, -766,9553, 0, -1233,442, 0, 0, 0, 1, 100, 0, 200, 0, 1, 0, 1, 0, 0 );
	DOCK_SetKeyframe( 6, 2, -728,5747, -13,34645, -932,6893, 0, 0, 0, 1, 75, 0, 200, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 6, 3, -561,8139, -28,88388, -574,4056, 0, 45, 0, 1, 80, 0, 200, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 6, 4, -319,8402, -35,01922, -384,794, 0, 90, 0, 1, 56, 0, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 6, 5, -207,1667, -40,20433, -384,7944, 18,593376159668, 90, 0, 1, 40, 1, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 6, 6, -166,2123, -102,127, -384,794, 35,3154411315918, 90, 0, 1, 30, 0, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 6, 7, -102,3841, -168,4322, -384,794, 40,8405609130859, 90, 0, 1, 25, 0, 200, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path12', 'world', 1, 0, 'Frigate, Controller, Container, TradeContainer', 0, 'path13, path18, path19, path20', 4 ); {
	DOCK_SetKeyframe( 7, 1, 153,8649, 64,5042, -310, 0, 0, 0, 1, 10, 0, 75, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 7, 2, 209,89, -48,31368, -310, 0, 0, 0, 1, 25, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 7, 3, 360,0051, -46,58414, -310, 0, 0, 0, 1, 50, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 7, 4, 481,0942, -43,82297, -299,0039, 0, 0, 0, 0, 50, 0, 100, 0, 0, 0, 0, 0, 1 ); } 

DOCK_Add( 'path13', 'world', 0, 0, 'Frigate, Utility, Controller, Container, TradeContainer', 0, 'path12, path18, path19, path20', 7 ); {
	DOCK_SetKeyframe( 8, 1, 966,9263, 16,85797, -1465,765, 0, 0, 0, 1, 100, 0, 75, 0, 0, 1, 1, 0, 0 );
	DOCK_SetKeyframe( 8, 2, 835,3185, 18,30129, -782,8148, 0, 0, 0, 1, 93, 0, 75, 0, 0, 1, 1, 0, 0 );
	DOCK_SetKeyframe( 8, 3, 783,549, 16,85797, -564,5842, 0, 0, 0, 1, 75, 0, 75, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 8, 4, 360,8347, -10,90792, -330,796, 0, 0, 0, 1, 60, 0, 75, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 8, 5, 229,8676, -46,96728, -288,0692, 0, 0, 0, 1, 56, 1, 75, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 8, 6, 158,1156, -57,75705, -301,5537, 0, 0, 0, 1, 50, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 8, 7, 139,3989, -153,8944, -301,5537, 0, 0, 0, 1, 15, 0, 75, 0, 1, 0, 0, 1, 1 ); } 

DOCK_Add( 'path14', 'world', 1, 0, 'SuperCap', 0, 'path15', 5 ); {
	DOCK_SetKeyframe( 9, 1, 0, -67,83907, 57,40478, 0, 0, 0, 1, 5, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 9, 2, 10, 151,0221, 57,40478, 0, 0, 0, 1, 25, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 9, 3, 10, 499,4719, 57,40478, 0, 0, 0, 1, 50, 0, 75, 0, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 9, 4, 635,988, 727,8534, 57,40478, 0, 0, 0, 1, 73, 0, 75, 0, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 9, 5, 711,372, 752,7533, 57,40478, 0, 0, 0, 1, 75, 0, 75, 0, 1, 1, 0, 0, 1 ); } 

DOCK_Add( 'path15', 'world', 0, 0, 'SuperCap', 0, 'path14', 6 ); {
	DOCK_SetKeyframe( 10, 1, -1303,551, 540,4835, -1623,143, 0, 0, 0, 1, 50, 0, 0, 1, 1, 1, 1, 0, 0 );
	DOCK_SetKeyframe( 10, 2, -914,869, 527,5347, 57,405, 0, 0, 0, 1, 50, 0, 75, 1, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 10, 3, -914,869, 527,5347, 57,405, 0, 0, 0, 1, 50, 0, 75, 1, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 10, 4, 3, 527,5347, 57,405, 0, 0, 0, 1, 50, 0, 75, 1, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 10, 5, 5, 183,683, 57,405, 0, 0, 0, 1, 25, 1, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 10, 6, 0,7230563, -119,1835, 57,405, 0, 0, 0, 1, 25, 0, 75, 0, 1, 0, 0, 0, 1 ); } 

DOCK_Add( 'path16', 'world', 1, 0, 'Corvette', 0, '', 4 ); {
	DOCK_SetKeyframe( 11, 1, -114,5305, 76,18095, -261,578, 55,3028793334961, 270, 0, 1, 50, 0, 100, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 11, 2, -171,437, -16,78821, -261,578, 43,4179992675781, 270, 0, 1, 50, 0, 150, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 11, 3, -463,4824, -41,34472, -261,578, 0, 270, 0, 1, 75, 0, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 11, 4, -561,9872, 8,196811, -261,578, 0, 270, 0, 0, 50, 0, 200, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path17', 'world', 0, 0, 'Corvette', 0, '', 6 ); {
	DOCK_SetKeyframe( 12, 1, -897,2401, 0, -1233,442, 0, 0, 0, 1, 100, 0, 200, 0, 0, 0, 1, 0, 0 );
	DOCK_SetKeyframe( 12, 2, -897,3744, 2,124481, -973,2086, 0, 0, 0, 1, 77, 0, 200, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 12, 3, -693,3866, 0, -509,7651, 0, 24,1637897491455, 0, 1, 60, 0, 200, 0, 0, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 12, 4, -318,5731, -27,96349, -328,4799, 0, 90, 0, 1, 40, 0, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 12, 5, -199,5494, -45,29148, -328,48, 21,508415222168, 90, 0, 1, 40, 1, 200, 0, 0, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 12, 6, -105,5751, -155,0459, -328,48, 44,4658126831055, 90, 0, 1, 40, 0, 200, 0, 0, 0, 0, 0, 0 ); } 

DOCK_Add( 'path18', 'world', 0, 0, 'Resource', 0, 'path12, path13, path19, path20', 6 ); {
	DOCK_SetKeyframe( 13, 1, 691,3765, 0, -1108,888, 0, 0, 0, 1, 30, 0, 0, 0, 0, 1, 1, 0, 0 );
	DOCK_SetKeyframe( 13, 2, 692,3008, -11,92964, -542,5852, 0, 0, 0, 1, 30, 0, 39, 1, 0, 1, 1, 0, 0 );
	DOCK_SetKeyframe( 13, 3, 656,1646, -32,77269, -359,9025, 0, 0, 0, 1, 30, 0, 100, 1, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 13, 4, 503,1224, -34,37112, -339,6044, 0, 0, 0, 1, 30, 0, 90, 1, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 13, 5, 190,7979, -40,53264, -359,9025, 0, 0, 0, 1, 30, 0, 50, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 13, 6, 131,2188, -113,582, -359,9025, 0, 0, 0, 1, 20, 0, 50, 0, 1, 0, 0, 1, 1 ); } 

DOCK_Add( 'path19', 'world', 1, 0, 'Utility', 0, 'path12, path13, path18, path20', 4 ); {
	DOCK_SetKeyframe( 14, 1, 149,7713, 59,03759, -293,9225, 0, 0, 0, 1, 5, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 14, 2, 222,1271, -57,15734, -293,9225, 0, 0, 0, 1, 45, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 14, 3, 370,2186, -48,63332, -293,9225, 0, 0, 0, 1, 40, 0, 75, 0, 1, 1, 0, 0, 1 );
	DOCK_SetKeyframe( 14, 4, 417,0154, 508,8155, -293,9225, 0, 250,885131835938, 0, 1, 50, 0, 100, 0, 1, 1, 0, 0, 1 ); } 

DOCK_Add( 'path20', 'world', 1, 0, 'Platform', 0, 'path12, path13, path18, path19', 5 ); {
	DOCK_SetKeyframe( 15, 1, 151,1209, 75,27528, -290,8691, 0, 0, 270, 1, 5, 0, 75, 1, 1, 0, 0, 1, 0 );
	DOCK_SetKeyframe( 15, 2, 151,1209, 49,3379, -290,8691, 0, 0, 270, 1, 10, 0, 75, 1, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 15, 3, 151,1209, -42,58915, -290,8691, 0, 0, 270, 1, 20, 0, 75, 0, 1, 0, 0, 0, 0 );
	DOCK_SetKeyframe( 15, 4, 353,1971, -42,58915, -290,8691, 0, 0, 270, 1, 40, 0, 75, 0, 1, 1, 0, 0, 0 );
	DOCK_SetKeyframe( 15, 5, 578,9359, -42,58915, -290,8691, 0, 0, 0, 1, 50, 0, 75, 0, 1, 1, 0, 0, 1 ); } 


// 8 BNDVs located
BNDV_SetNumVertices( 8 ); {
	BNDV_SetVertex( 1, -304,3459, -445,0806, -1598,719 );
	BNDV_SetVertex( 2, 0, 0, 0 );
	BNDV_SetVertex( 3, 0, 0, 0 );
	BNDV_SetVertex( 4, 0, 0, 0 );
	BNDV_SetVertex( 5, 0, 0, 0 );
	BNDV_SetVertex( 6, 0, 0, 0 );
	BNDV_SetVertex( 7, 263,2798, 390,6796, 1276,572 );
	BNDV_SetVertex( 8, 0, 0, 0 ); }

// 0 lights located

// EOF
