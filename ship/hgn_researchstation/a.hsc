// HOD script file.
// Created by CFHodEd v3.1.5


// 6 materials located.
STAT_Add("Hgn_Labs", "ship", 2); {
	STAT_SetParamter(1, 1, 5, 0, 0, 0, 0, 1, "$diffuse");
	STAT_SetParamter(1, 2, 5, 0, 0, 0, 0, 2, "$glow");
}
STAT_Add("Hgn_Labs_Goblin", "ship", 2); {
	STAT_SetParamter(2, 1, 5, 0, 0, 0, 0, 3, "$diffuse");
	STAT_SetParamter(2, 2, 5, 0, 0, 0, 0, 4, "$glow");
}
STAT_Add("Hgn_Labs_Burner", "thruster", 4); {
	STAT_SetParamter(3, 1, 5, 0, 0, 0, 0, 5, "$diffuseOn");
	STAT_SetParamter(3, 2, 5, 0, 0, 0, 0, 6, "$diffuseOff");
	STAT_SetParamter(3, 3, 5, 0, 0, 0, 0, 7, "$glowOn");
	STAT_SetParamter(3, 4, 5, 0, 0, 0, 0, 8, "$glowOff");
}
STAT_Add("Hgn_Labs_Leftover", "ship", 2); {
	STAT_SetParamter(4, 1, 5, 0, 0, 0, 0, 9, "$diffuse");
	STAT_SetParamter(4, 2, 5, 0, 0, 0, 0, 10, "$glow");
}
STAT_Add("Hgn_Labs_Badge", "badge", 3); {
	STAT_SetParamter(5, 1, 5, 0, 0, 0, 0, 11, "$mask");
	STAT_SetParamter(5, 2, 5, 0, 0, 0, 0, 12, "$diffuse");
	STAT_SetParamter(5, 3, 5, 0, 0, 0, 0, 13, "$glow");
}
STAT_Add("lambert1", "default", 0);


// 83 joints located.
HIER_Add("HardpointGeneric1_Position", "Root", 81,58697, 7,259947, -59,20239, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric1_Direction", "HardpointGeneric1_Position", 0, 35,99055, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric1_Rest", "HardpointGeneric1_Position", 0, 0, 35,99055, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric2_Position", "Root", 74,54613, 7,840005E-02, 62,13163, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric2_Direction", "HardpointGeneric2_Position", 0, 35,99055, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric2_Rest", "HardpointGeneric2_Position", 0, 0, 35,99055, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric3_Position", "Root", -60,21, -5,583882E-04, -12,51147, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric3_Rest", "HardpointGeneric3_Position", 1,421085E-14, 0, 35,99055, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("HardpointGeneric3_Direction", "HardpointGeneric3_Position", 1,421085E-14, 35,99055, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Hardpoint_Engine_Position", "Root", -3,768, -26,328, -167,011, 0, 0, 0, 1, 1, 1, 1,562266, 90, 0, 1, 1, 1);
HIER_Add("Hardpoint_Engine_Direction", "Hardpoint_Engine_Position", 24,74941, -1,026956E-15, 0, 0, 0, 0, 1, 1, 1, -90, -88,43773, 90, 1, 1, 1);
HIER_Add("Hardpoint_Engine_Rest", "Hardpoint_Engine_Position", -2,966256E-13, 25,49616, -0,6953682, 0, 0, 0, 1, 1, 1, -90, -88,43773, 90, 1, 1, 1);
HIER_Add("EngineNozzle1", "Root", -1,064278, -43,41101, -179,1121, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("CapturePoint0", "Root", 152,3367, -9,587015, 22,93122, 0, 0, 0, 1, 1, 1, -90, 59,98092, 0, 1, 1, 1);
HIER_Add("CapturePoint0Left", "CapturePoint0", 9,983641, -17,27888, 5,752037E-16, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint0Up", "CapturePoint0", 0, 8,526513E-14, 24,08926, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint0Heading", "CapturePoint0", -18,89768, -10,91897, -1,343137E-15, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint1", "Root", -7,999236, -0,166035, -135,2326, 0, 0, 0, 1, 1, 1, -90, 59,98092, 0, 1, 1, 1);
HIER_Add("CapturePoint1Left", "CapturePoint1", 9,983641, -17,27888, -1,635673E-17, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint1Up", "CapturePoint1", -1,776357E-14, 4,707346E-14, 24,08926, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint1Heading", "CapturePoint1", -18,89768, -10,91897, 2,395172E-15, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint2", "Root", 91,72247, -56,97747, -61,07795, 0, 0, 0, 1, 1, 1, -90, 59,98092, 0, 1, 1, 1);
HIER_Add("CapturePoint2Left", "CapturePoint2", -8,946881, 15,48454, -1,421816E-14, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint2Up", "CapturePoint2", 3,552714E-14, 5,684342E-14, -21,60628, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint2Heading", "CapturePoint2", -18,89768, -10,91897, -5,393607E-15, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint3", "Root", -39,3217, -54,28986, 21,59351, 0, 0, 0, 1, 1, 1, -90, 59,98092, 0, 1, 1, 1);
HIER_Add("CapturePoint2Left", "CapturePoint3", -8,946881, 15,48454, -1,260454E-14, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint2Up", "CapturePoint3", 2,842171E-14, 4,263256E-14, -21,60628, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("CapturePoint2Heading", "CapturePoint3", -18,89768, -10,91897, -1,088541E-14, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint0", "Root", 77,16323, -40,14886, 88,48463, 0, 0, 0, 1, 1, 1, -90, 59,98092, 0, 1, 1, 1);
HIER_Add("RepairPoint0Left", "RepairPoint0", -8,946881, 15,48454, -1,406883E-15, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint0Up", "RepairPoint0", 7,105427E-14, 2,842171E-14, -21,60628, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint0Heading", "RepairPoint0", -18,89768, -10,91897, 3,122466E-16, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint1", "Root", -64,11136, -47,90892, -102,2878, 0, 0, 0, 1, 1, 1, 90,10663, 0, -179,9442, 1, 1, 1);
HIER_Add("RepairPoint1Left", "RepairPoint1", 17,88345, -1,789598E-14, -3,885781E-15, 0, 0, 0, 1, 1, 1, 115,0685, 5,6498E-30, -180, 1, 1, 1);
HIER_Add("RepairPoint1Up", "RepairPoint1", -2,842171E-14, -3,645308E-02, -19,58798, 0, 0, 0, 1, 1, 1, 115,0685, 5,6498E-30, -180, 1, 1, 1);
HIER_Add("RepairPoint1Heading", "RepairPoint1", -8,95214E-03, 20,60595, -5,577079E-02, 0, 0, 0, 1, 1, 1, 115,0685, 5,6498E-30, -180, 1, 1, 1);
HIER_Add("RepairPoint2", "Root", -59,21609, 10,85133, -139,9966, 0, 0, 0, 1, 1, 1, -90, 59,98092, 0, 1, 1, 1);
HIER_Add("RepairPoint2Left", "RepairPoint2", 9,983641, -17,27888, 3,331347E-15, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint2Up", "RepairPoint2", -4,263256E-14, 4,263256E-14, 24,08926, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint2Heading", "RepairPoint2", -18,89768, -10,91897, 3,189363E-15, 0, 0, 0, 1, 1, 1, 90, 0, -59,98092, 1, 1, 1);
HIER_Add("RepairPoint3", "Root", 75,37234, 2,091412, 130,599, 0, 0, 0, 1, 1, 1, -87,66878, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint2Left", "RepairPoint3", 19,95577, 5,329071E-15, -2,775558E-17, 0, 0, 0, 1, 1, 1, 87,66878, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint2Up", "RepairPoint3", -8,246182E-14, 0,9798619, 24,06932, 0, 0, 0, 1, 1, 1, 87,66878, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint2Heading", "RepairPoint3", -4,112509E-14, -21,8073, 0,8877748, 0, 0, 0, 1, 1, 1, 87,66878, 0, 0, 1, 1, 1);
HIER_Add("NavLight1", "Root", 53,36759, 69,17115, -127,0004, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight2", "Root", 62,64653, 45,58498, -134,7081, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight3", "Root", -111,2575, 28,90878, -140,1585, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight4", "Root", -2,717414, -115,9969, -140,6866, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight5", "Root", 62,29953, -100,1116, -113,8911, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight6", "Root", -12,52242, -33,63134, 161,1281, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight7", "Root", -135,9932, -9,365122, -69,94249, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("NavLight8", "Root", 176,1046, -11,89339, 44,85666, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense1_Position", "Root", 65,1401, -3,201928, 146,8951, 0, 0, 0, 1, 1, 1, 24,86613, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense1_Muzzle", "Weapon_HullDefense1_Position", 0, -2,664535E-15, 4,440892E-15, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense1_Rest", "Weapon_HullDefense1_Position", 0, 13,49646, 2,4869E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense1_Direction", "Weapon_HullDefense1_Position", 0, -3,552714E-15, 13,49646, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense2_Position", "Root", -97,14693, 5,333107, -155,3647, 0, 0, 0, 1, 1, 1, -143,2972, 1,518296, 179,8586, 1, 1, 1);
HIER_Add("Weapon_HullDefense2_Muzzle", "Weapon_HullDefense2_Position", 1,421085E-14, -1,64313E-14, -1,376677E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense2_Rest", "Weapon_HullDefense2_Position", -1,421085E-14, 13,49646, -2,908784E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense2_Direction", "Weapon_HullDefense2_Position", 2,842171E-14, 1,953993E-14, 13,49646, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense3_Position", "Root", 69,38829, -31,58926, 130,984, 0, 0, 0, 1, 1, 1, -1,878716, -6,079381E-02, -179,9598, 1, 1, 1);
HIER_Add("Weapon_HullDefense3_Muzzle", "Weapon_HullDefense3_Position", -1,421085E-14, -6,258882E-15, 6,356027E-15, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense3_Rest", "Weapon_HullDefense3_Position", -1,421085E-14, 13,49646, 7,535639E-15, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense3_Direction", "Weapon_HullDefense3_Position", 0, -5,516421E-15, 13,49646, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense4_Position", "Root", -60,09715, -47,59777, -142,3855, 0, 0, 0, 1, 1, 1, -178,1213, 8,835454E-02, 4,106433E-02, 1, 1, 1);
HIER_Add("Weapon_HullDefense4_Muzzle", "Weapon_HullDefense4_Position", -7,105427E-15, -2,220446E-16, 3,873291E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense4_Rest", "Weapon_HullDefense4_Position", 7,105427E-15, 13,49646, 1,909584E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense4_Direction", "Weapon_HullDefense4_Position", 7,105427E-15, 2,595146E-15, 13,49646, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("EngineNozzle2", "Root", 53,56569, -26,54946, -168,5772, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("EngineNozzle3", "Root", -58,3946, -26,54946, -168,5772, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense5_Position", "Root", 116,5835, 2,695004, -113,3164, -13,83098, -33,69357, 29,38601, 1, 1, 1, -143,2972, 1,518296, 179,8586, 1, 1, 1);
HIER_Add("Weapon_HullDefense5_Muzzle", "Weapon_HullDefense5_Position", 1,421085E-14, -1,64313E-14, -1,376677E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense5_Rest", "Weapon_HullDefense5_Position", -1,421085E-14, 13,49646, -2,908784E-14, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Weapon_HullDefense5_Direction", "Weapon_HullDefense5_Position", 2,842171E-14, 1,953993E-14, 13,49646, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint4", "Root", 154,7391, -9,541836, -28,91204, 0, 0, 0, 1, 1, 1, -87,66878, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint4Left", "RepairPoint4", 19,95577, 5,329071E-15, -2,775558E-17, 0, 0, 0, 1, 1, 1, 87,66878, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint4Up", "RepairPoint4", -8,246182E-14, 0,9798619, 24,06932, 0, 0, 0, 1, 1, 1, 87,66878, 0, 0, 1, 1, 1);
HIER_Add("RepairPoint4Heading", "RepairPoint4", -4,112509E-14, -21,8073, 0,8877748, 0, 0, 0, 1, 1, 1, 87,66878, 0, 0, 1, 1, 1);
HIER_Add("Hardpoint_baseresearch_Position", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Hardpoint_baseresearch_Rest", "Hardpoint_baseresearch_Position", 0, 0, 10, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("Hardpoint_baseresearch_Direction", "Hardpoint_baseresearch_Position", 0, 10, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);


// 8 NavLights located.
NAVL_Add("NavLight1", 0, 8, 0,5, 0,8, "default", 1, 1, 1, 1, 0, 1, 1);
NAVL_Add("NavLight2", 0, 5, 0, 1, "default", 1, 1, 1, 1, 0, 1, 1);
NAVL_Add("NavLight3", 0, 6, 0,5, 0,8, "default", 1, 1, 1, 1, 0, 1, 1);
NAVL_Add("NavLight4", 0, 8, 0,5, 0,8, "default", 1, 1, 1, 1, 0, 1, 1);
NAVL_Add("NavLight5", 0, 8, 0,5, 0,8, "default", 1, 1, 1, 1, 0, 1, 1);
NAVL_Add("NavLight6", 0, 10, 0, 0,8, "default", 0,7098039, 0,7098039, 1, 1, 0, 1, 1);
NAVL_Add("NavLight7", 0, 8, 0, 1, "default", 1, 0,3529412, 0,3529412, 1, 0, 1, 1);
NAVL_Add("NavLight8", 0, 8, 0, 1, "default", 1, 0,3529412, 0,3529412, 1, 0, 1, 1);


// 17 markers located.
MRKR_Add("marker1", "Root", 0, 0, -97,4710707462641, 7,93141499678009, -143,460387160047, 90, 0, 0, 0);
MRKR_Add("marker2", "Root", 0, 0, -61,7195414596495, -48,0353569063932, -131,594020271039, -90, 0, 0, 0);
MRKR_Add("marker3", "Root", 0, 0, -87,825422862757, -25,1036354317816, -111,995310625595, -8,4541E-15, -90, 35,25571, 0);
MRKR_Add("marker4", "Root", 0, 0, -72,3573989556346, 8,43805750598287, -96,087173461569, -90, 0, 0, 0);
MRKR_Add("marker5", "Root", 0, 0, 7,01899677365389, -65,4286793213647, -72,8454211375392, 90, 0, 0, 0);
MRKR_Add("marker6", "Root", 0, 0, 13,2096148868813, -5,39992645212132, -155,498428518428, -106,1469, 0, 0, 0);
MRKR_Add("marker7", "Root", 0, 0, 89,8675722656, -38,764221613237, -146,471732751668, -172,9697, 55,12267, 129,1508, 0);
MRKR_Add("marker8", "Root", 0, 0, 65,1277353300154, -56,7873416122495, -60,1445323026681, 90, 0, 0, 0);
MRKR_Add("marker9", "Root", 0, 0, 159,243905593233, -9,39753565969461, -46,7511371979653, -90, 0, 0, 0);
MRKR_Add("marker10", "Root", 0, 0, 135,716409408541, -23,4758093886092, -22,0723306185199, 0, 90, -37,31229, 0);
MRKR_Add("marker11", "Root", 0, 0, 118,980755825599, 7,64098043191161, -20,6099222586753, -90, 0, 0, 0);
MRKR_Add("marker12", "Root", 0, 0, 108,585516371002, -33,0298938102293, 47,7387041216966, 90, 0, 0, 0);
MRKR_Add("marker13", "Root", 0, 0, 17,8994808293513, -26,1725781028487, 0,660431221554999, 0, 0, 0, 0);
MRKR_Add("marker14", "Root", 0, 0, -38,5383052905729, -54,5211814597487, 8,27406085724359, 90, 0, 0, 0);
MRKR_Add("marker15", "Root", 0, 0, -78,237583725288, -37,4476153224073, 28,1710892301695, 1,906802E-15, -90, 34,47919, 0);
MRKR_Add("dock1", "Root", 0, 0, -129, -15, -70, 97,40282, 0,572958, 14,32395, 0);
MRKR_Add("dock2", "Root", 0, 0, -129, -15, 33, 64,74426, -1,145915, 8,594367, 0);


// 0 dockpaths located.


// 8 BNDVs located.
BNDV_SetNumVertices(8); {
	BNDV_SetVertex(1, -134,2765, -114,6068, -213,6054);
	BNDV_SetVertex(2, 0, 0, 0);
	BNDV_SetVertex(3, 0, 0, 0);
	BNDV_SetVertex(4, 0, 0, 0);
	BNDV_SetVertex(5, 0, 0, 0);
	BNDV_SetVertex(6, 0, 0, 0);
	BNDV_SetVertex(7, 174,7852, 67,96436, 166,3644);
	BNDV_SetVertex(8, 0, 0, 0);
}

// 0 level lights located.

// 0 point star field groups located.

// 0 textured star field groups located.


// EOF
