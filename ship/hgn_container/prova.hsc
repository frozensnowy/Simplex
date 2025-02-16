// HOD script file.
// Created by CFHodEd v3.1.5


// 13 materials located.
STAT_Add("lambert1", "default", 0);
STAT_Add("hw2Shader4", "ship", 2); {
	STAT_SetParamter(2, 1, 5, 0, 0, 0, 0, 1, "$diffuse");
	STAT_SetParamter(2, 2, 5, 0, 0, 0, 0, 2, "$glow");
}
STAT_Add("hw2Shader10", "ship", 2); {
	STAT_SetParamter(3, 1, 5, 0, 0, 0, 0, 3, "$diffuse");
	STAT_SetParamter(3, 2, 5, 0, 0, 0, 0, 4, "$glow");
}
STAT_Add("Hgn_Container_hw2Shader1", "ship", 2); {
	STAT_SetParamter(4, 1, 5, 0, 0, 0, 0, 5, "$diffuse");
	STAT_SetParamter(4, 2, 5, 0, 0, 0, 0, 6, "$glow");
}
STAT_Add("Hgn_Container_hw2Shader", "ship", 2); {
	STAT_SetParamter(5, 1, 5, 0, 0, 0, 0, 7, "$diffuse");
	STAT_SetParamter(5, 2, 5, 0, 0, 0, 0, 8, "$glow");
}
STAT_Add("hw2Shader5", "ship", 2); {
	STAT_SetParamter(6, 1, 5, 0, 0, 0, 0, 9, "$diffuse");
	STAT_SetParamter(6, 2, 5, 0, 0, 0, 0, 10, "$glow");
}
STAT_Add("Hgn_Container_hw2Shader2", "ship", 2); {
	STAT_SetParamter(7, 1, 5, 0, 0, 0, 0, 11, "$diffuse");
	STAT_SetParamter(7, 2, 5, 0, 0, 0, 0, 12, "$glow");
}
STAT_Add("hw2Shader6", "ship", 2); {
	STAT_SetParamter(8, 1, 5, 0, 0, 0, 0, 13, "$diffuse");
	STAT_SetParamter(8, 2, 5, 0, 0, 0, 0, 14, "$glow");
}
STAT_Add("hw2Shader7", "ship", 2); {
	STAT_SetParamter(9, 1, 5, 0, 0, 0, 0, 15, "$diffuse");
	STAT_SetParamter(9, 2, 5, 0, 0, 0, 0, 16, "$glow");
}
STAT_Add("hw2Shader8", "thruster", 4); {
	STAT_SetParamter(10, 1, 5, 0, 0, 0, 0, 17, "$diffuseOn");
	STAT_SetParamter(10, 2, 5, 0, 0, 0, 0, 18, "$diffuseOff");
	STAT_SetParamter(10, 3, 5, 0, 0, 0, 0, 19, "$glowOn");
	STAT_SetParamter(10, 4, 5, 0, 0, 0, 0, 20, "$glowOff");
}
STAT_Add("hw2Shader3", "ship", 2); {
	STAT_SetParamter(11, 1, 5, 0, 0, 0, 0, 21, "$diffuse");
	STAT_SetParamter(11, 2, 5, 0, 0, 0, 0, 22, "$glow");
}
STAT_Add("hw2Shader9", "ship", 2); {
	STAT_SetParamter(12, 1, 5, 0, 0, 0, 0, 23, "$diffuse");
	STAT_SetParamter(12, 2, 5, 0, 0, 0, 0, 24, "$glow");
}
STAT_Add("Badge", "badge", 3); {
	STAT_SetParamter(13, 1, 5, 0, 0, 0, 0, 25, "$mask");
	STAT_SetParamter(13, 2, 5, 0, 0, 0, 0, 26, "$diffuse");
	STAT_SetParamter(13, 3, 5, 0, 0, 0, 0, 27, "$glow");
}


// 1 joints located.


// 0 NavLights located.


// 0 markers located.


// 0 dockpaths located.


// 8 BNDVs located.
BNDV_SetNumVertices(8); {
	BNDV_SetVertex(1, -27,72878, -23,7625, -98,36221);
	BNDV_SetVertex(2, 0, 0, 0);
	BNDV_SetVertex(3, 0, 0, 0);
	BNDV_SetVertex(4, 0, 0, 0);
	BNDV_SetVertex(5, 0, 0, 0);
	BNDV_SetVertex(6, 0, 0, 0);
	BNDV_SetVertex(7, 26,7156, 28,74357, 94,29236);
	BNDV_SetVertex(8, 0, 0, 0);
}

// 0 level lights located.

// 0 point star field groups located.

// 0 textured star field groups located.


// EOF
