// HOD script file.
// Created by CFHodEd v3.1.5


// 12 materials located.
STAT_Add("spine", "ship", 2); {
	STAT_SetParamter(1, 1, 5, 0, 0, 0, 0, 19, "$diffuse");
	STAT_SetParamter(1, 2, 5, 0, 0, 0, 0, 20, "$glow");
}
STAT_Add("connection", "ship", 2); {
	STAT_SetParamter(2, 1, 5, 0, 0, 0, 0, 1, "$diffuse");
	STAT_SetParamter(2, 2, 5, 0, 0, 0, 0, 2, "$glow");
}
STAT_Add("frontcolor", "default", 0);
STAT_Add("m_1", "ship", 2); {
	STAT_SetParamter(4, 1, 5, 0, 0, 0, 0, 13, "$diffuse");
	STAT_SetParamter(4, 2, 5, 0, 0, 0, 0, 14, "$glow");
}
STAT_Add("m_3", "ship", 2); {
	STAT_SetParamter(5, 1, 5, 0, 0, 0, 0, 17, "$diffuse");
	STAT_SetParamter(5, 2, 5, 0, 0, 0, 0, 18, "$glow");
}
STAT_Add("windows", "ship", 2); {
	STAT_SetParamter(6, 1, 5, 0, 0, 0, 0, 23, "$diffuse");
	STAT_SetParamter(6, 2, 5, 0, 0, 0, 0, 24, "$glow");
}
STAT_Add("Dock", "ship", 2); {
	STAT_SetParamter(7, 1, 5, 0, 0, 0, 0, 3, "$diffuse");
	STAT_SetParamter(7, 2, 5, 0, 0, 0, 0, 4, "$glow");
}
STAT_Add("enginecovers", "ship", 2); {
	STAT_SetParamter(8, 1, 5, 0, 0, 0, 0, 5, "$diffuse");
	STAT_SetParamter(8, 2, 5, 0, 0, 0, 0, 6, "$glow");
}
STAT_Add("engineright", "ship", 2); {
	STAT_SetParamter(9, 1, 5, 0, 0, 0, 0, 7, "$diffuse");
	STAT_SetParamter(9, 2, 5, 0, 0, 0, 0, 8, "$glow");
}
STAT_Add("engine", "thruster", 4); {
	STAT_SetParamter(10, 1, 5, 0, 0, 0, 0, 11, "$diffuseOn");
	STAT_SetParamter(10, 2, 5, 0, 0, 0, 0, 9, "$diffuseOff");
	STAT_SetParamter(10, 3, 5, 0, 0, 0, 0, 12, "$glowOn");
	STAT_SetParamter(10, 4, 5, 0, 0, 0, 0, 10, "$glowOff");
}
STAT_Add("m_2", "ship", 2); {
	STAT_SetParamter(11, 1, 5, 0, 0, 0, 0, 15, "$diffuse");
	STAT_SetParamter(11, 2, 5, 0, 0, 0, 0, 16, "$glow");
}
STAT_Add("straps", "ship", 2); {
	STAT_SetParamter(12, 1, 5, 0, 0, 0, 0, 21, "$diffuse");
	STAT_SetParamter(12, 2, 5, 0, 0, 0, 0, 22, "$glow");
}