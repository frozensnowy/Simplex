// HOD script file.
// Created by CFHodEd v3.1.5


// 3 materials located.
STAT_Add("hw2Shader", "ship", 2); {
	STAT_SetParamter(1, 1, 5, 0, 0, 0, 0, 1, "$diffuse");
	STAT_SetParamter(1, 2, 5, 0, 0, 0, 0, 2, "$glow");
}
STAT_Add("hw2Shader2", "badge", 3); {
	STAT_SetParamter(2, 1, 5, 0, 0, 0, 0, 3, "$mask");
	STAT_SetParamter(2, 2, 5, 0, 0, 0, 0, 4, "$diffuse");
	STAT_SetParamter(2, 3, 5, 0, 0, 0, 0, 5, "$glow");
}
STAT_Add("hw2Shader1", "thruster", 4); {
	STAT_SetParamter(3, 1, 5, 0, 0, 0, 0, 6, "$diffuseOn");
	STAT_SetParamter(3, 2, 5, 0, 0, 0, 0, 7, "$diffuseOff");
	STAT_SetParamter(3, 3, 5, 0, 0, 0, 0, 8, "$glowOn");
	STAT_SetParamter(3, 4, 5, 0, 0, 0, 0, 9, "$glowOff");
}


// 135 joints located.
HIER_Add("Hardpoint_PDS1_Position", "Root", 37,5, 27, 11, 0, 0, -90, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS1_Rest", "Hardpoint_PDS1_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS1_Direction", "Hardpoint_PDS1_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS2_Position", "Root", -37,5, 27, 11, 0, 0, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS2_Rest", "Hardpoint_PDS2_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS2_Direction", "Hardpoint_PDS2_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS3_Position", "Root", 37,5, 27, 11, 0, 0, -90, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS3_Rest", "Hardpoint_PDS3_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS3_Direction", "Hardpoint_PDS3_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS4_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS4_Rest", "Hardpoint_PDS4_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS4_Direction", "Hardpoint_PDS4_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS5_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS5_Rest", "Hardpoint_PDS5_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS5_Direction", "Hardpoint_PDS5_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS6_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS6_Rest", "Hardpoint_PDS6_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS6_Direction", "Hardpoint_PDS6_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS7_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS7_Rest", "Hardpoint_PDS7_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS7_Direction", "Hardpoint_PDS7_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS8_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS8_Rest", "Hardpoint_PDS8_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS8_Direction", "Hardpoint_PDS8_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS9_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS9_Rest", "Hardpoint_PDS9_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS9_Direction", "Hardpoint_PDS9_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS10_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS10_Rest", "Hardpoint_PDS10_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS10_Direction", "Hardpoint_PDS10_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS11_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS11_Rest", "Hardpoint_PDS11_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS11_Direction", "Hardpoint_PDS11_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS12_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS12_Rest", "Hardpoint_PDS12_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS12_Direction", "Hardpoint_PDS12_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS13_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS13_Rest", "Hardpoint_PDS13_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS13_Direction", "Hardpoint_PDS13_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS14_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS14_Rest", "Hardpoint_PDS14_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS14_Direction", "Hardpoint_PDS14_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS15_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS15_Rest", "Hardpoint_PDS15_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_PDS15_Direction", "Hardpoint_PDS15_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint0", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint0Heading", "CapturePoint0", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint0Up", "CapturePoint0", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint0Left", "CapturePoint0", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint1", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint1Heading", "CapturePoint1", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint1Up", "CapturePoint1", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint1Left", "CapturePoint1", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint2", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint2Heading", "CapturePoint2", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint2Up", "CapturePoint2", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("CapturePoint2Left", "CapturePoint2", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint0", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint0Heading", "RepairPoint0", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint0Up", "RepairPoint0", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint0Left", "RepairPoint0", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint1", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint1Heading", "RepairPoint1", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint1Up", "RepairPoint1", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint1Left", "RepairPoint1", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint2", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint2Heading", "RepairPoint2", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint2Up", "RepairPoint2", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint2Left", "RepairPoint2", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint3", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint3Heading", "RepairPoint3", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint3Up", "RepairPoint3", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("RepairPoint3Left", "RepairPoint3", 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_Engine_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_Engine_Rest", "Hardpoint_Engine_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_Engine_Direction", "Hardpoint_Engine_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1_Rest", "Weapon_T1_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1_Direction", "Weapon_T1_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave_Rest", "Weapon_T1Slave_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave_Direction", "Weapon_T1Slave_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave1_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave1_Rest", "Weapon_T1Slave1_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave1_Direction", "Weapon_T1Slave1_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave2_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave2_Rest", "Weapon_T1Slave2_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave2_Direction", "Weapon_T1Slave2_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave3_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave3_Rest", "Weapon_T1Slave3_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T1Slave3_Direction", "Weapon_T1Slave3_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2_Rest", "Weapon_T2_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2_Direction", "Weapon_T2_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave_Rest", "Weapon_T2Slave_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave_Direction", "Weapon_T2Slave_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave1_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave1_Rest", "Weapon_T2Slave1_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave1_Direction", "Weapon_T2Slave1_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave2_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave2_Rest", "Weapon_T2Slave2_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave2_Direction", "Weapon_T2Slave2_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave3_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave3_Rest", "Weapon_T2Slave3_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Weapon_T2Slave3_Direction", "Weapon_T2Slave3_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WUP1_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WUP1_Rest", "Hardpoint_WUP1_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WUP1_Direction", "Hardpoint_WUP1_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WUP2_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WUP2_Rest", "Hardpoint_WUP2_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WUP2_Direction", "Hardpoint_WUP2_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN1_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN1_Rest", "Hardpoint_WDOWN1_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN1_Direction", "Hardpoint_WDOWN1_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN2_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN2_Rest", "Hardpoint_WDOWN2_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN2_Direction", "Hardpoint_WDOWN2_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN3_Position", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN3_Rest", "Hardpoint_WDOWN3_Position", 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("Hardpoint_WDOWN3_Direction", "Hardpoint_WDOWN3_Position", 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
HIER_Add("nl1", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl2", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl3", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl4", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl5", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl6", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl7", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl8", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl9", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl10", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl11", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl12", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);
HIER_Add("nl13", "Root", 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1);


// 0 NavLights located.


// 30 markers located.
MRKR_Add("Marker1", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker2", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker3", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker4", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker5", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker6", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker7", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker8", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker9", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker10", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker11", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker12", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker13", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker14", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker15", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker16", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker17", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker18", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker19", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker20", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker21", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker22", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker23", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker24", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker25", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker26", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker27", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker28", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker29", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);
MRKR_Add("Marker30", "Root", 0, 0, 0, 0, 0, 0, 0, 0, 0);


// 0 dockpaths located.


// 8 BNDVs located.
BNDV_SetNumVertices(8); {
	BNDV_SetVertex(1, -90,30178, -36,5368, -247,4883);
	BNDV_SetVertex(2, 0, 0, 0);
	BNDV_SetVertex(3, 0, 0, 0);
	BNDV_SetVertex(4, 0, 0, 0);
	BNDV_SetVertex(5, 0, 0, 0);
	BNDV_SetVertex(6, 0, 0, 0);
	BNDV_SetVertex(7, 90,30173, 90,29277, 291,0601);
	BNDV_SetVertex(8, 0, 0, 0);
}

// 0 level lights located.

// 0 point star field groups located.

// 0 textured star field groups located.


// EOF
