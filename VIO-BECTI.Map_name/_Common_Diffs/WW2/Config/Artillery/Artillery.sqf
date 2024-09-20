_c = []; //--- Classname
_m = []; //--- Magazines
_b = []; //--- Burst
_r = []; //--- Ranges

_sid = ["VIOC_B_", "VIOC_O_", "VIOC_I_"];

{
	if(CTI_IFA_ADDON > 0) then {
		if !(("LIB_GrWr34") call CTI_CO_FNC_IsSidePatchLoaded) then {_x = "";};
		_c pushBack format["%1LIB_GrWr34", _x];
		//_m pushBack ["LIB_8Rnd_81mmHE_GRWR34","ARTY_LIB_8Rnd_81mmHE_GRWR34","LIB_1rnd_81mmHE_GRWR34","LIB_81mm_GRWR34_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
		
		_c pushBack format["%1LIB_GrWr34_g", _x];
		//_m pushBack ["LIB_8Rnd_81mmHE_GRWR34","ARTY_LIB_8Rnd_81mmHE_GRWR34","LIB_1rnd_81mmHE_GRWR34","LIB_81mm_GRWR34_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];

		_c pushBack format["%1LIB_BM37", _x];
		//_m pushBack ["LIB_8Rnd_82mmHE_BM37","ARTY_LIB_8Rnd_82mmHE_BM37","LIB_1rnd_82mmHE_BM37","LIB_82mm_BM37_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[240,1580], [360,2400], [480,3200], [480,3200]];

		_c pushBack format["%1LIB_M2_60", _x];
		//_m pushBack ["LIB_8Rnd_60mmHE_M2","ARTY_LIB_8Rnd_60mmHE_M2","LIB_1rnd_60mmHE_M2","LIB_60mm_M2_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[150,900], [230,1400], [310,1900], [310,1900]];


		_c pushBack format["%1LIB_Nebelwerfer41", _x];
		//_m pushBack ["LIB_6Rnd_NbW41"];
		_b pushBack [1, 2, 4, 6];
		//_r pushBack [[620,3500], [920,5250], [1220,6950], [1220,6950]];
		
		_c pushBack format["%1LIB_Nebelwerfer41_Camo", _x];
		//_m pushBack ["LIB_6Rnd_NbW41"];
		_b pushBack [1, 2, 4, 6];
		//_r pushBack [[620,3500], [920,5250], [1220,6950], [1220,6950]];
		
		_c pushBack format["%1LIB_Nebelwerfer41_Gelbbraun", _x];
		//_m pushBack ["LIB_6Rnd_NbW41"];
		_b pushBack [1, 2, 4, 6];
		//_r pushBack [[620,3500], [920,5250], [1220,6950], [1220,6950]];
		

		_c pushBack format["%1LIB_leFH18", _x];
		//_m pushBack ["LIB_20x_Shell_105L28_Gr38_HE","LIB_20x_Shell_105L28_Gr39HlC_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[390,2200], [880,5000], [1840,10500], [1840,10500]];


		_c pushBack format["%1LIB_FlaK_36_ARTY", _x];
		//_m pushBack ["LIB_SprGr_KwK36_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[790,5000], [1270,8100], [2210,14100], [2210,14100]];
		
		_c pushBack format["%1LIB_FlaK_36_ARTY_w", _x];
		//_m pushBack ["LIB_SprGr_KwK36_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[790,5000], [1270,8100], [2210,14100], [2210,14100]];
		
		_c pushBack format["%1LIB_DAK_FlaK_36_ARTY", _x];
		//_m pushBack ["LIB_SprGr_KwK36_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[790,5000], [1270,8100], [2210,14100], [2210,14100]];


		_c pushBack format["%1LIB_US6_BM13", _x];
		//_m pushBack ["LIB_16Rnd_BM13"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[950,1800], [1480,2900], [2130,4200], [2130,4200]];
		

		_c pushBack format["%1LIB_SdKfz124", _x];
		//_m pushBack ["LIB_20x_Shell_105L28_Gr38_HE","LIB_20x_Shell_105L28_Gr39HlC_HE"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[390,2200], [880,5000], [1840,10550], [1840,10550]];

	};
	
	if(CTI_FOW_ADDON > 0) then {
		if !(("fow_w_type97_mortar_ija") call CTI_CO_FNC_IsSidePatchLoaded) then {_x = "";};
		_c pushBack format["%1fow_w_type97_mortar_ija", _x];
		//_m pushBack ["fow_1Rnd_81mm_type97_HE","fow_8Rnd_81mm_type97_HE","fow_8Rnd_81mm_type97_SMOKE","fow_1Rnd_81mm_type97_SMOKE","fow_8Rnd_81mm_type97_ILL","fow_1Rnd_81mm_type97_ILL"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
		
		_c pushBack format["%1fow_w_type97_mortar_adv_ija", _x];
		//_m pushBack ["fow_1Rnd_81mm_type97_HE","fow_8Rnd_81mm_type97_HE","fow_8Rnd_81mm_type97_SMOKE","fow_1Rnd_81mm_type97_SMOKE","fow_8Rnd_81mm_type97_ILL","fow_1Rnd_81mm_type97_ILL"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
		
		_c pushBack format["%1fow_w_m2_mortar_usa", _x];
		//_m pushBack ["fow_1Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_SMOKE","fow_1Rnd_60mm_m2_SMOKE","fow_8Rnd_60mm_m2_ILL","fow_1Rnd_60mm_m2_ILL"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
		
		_c pushBack format["%1fow_w_m2_mortar_adv_usa", _x];
		//_m pushBack ["fow_1Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_SMOKE","fow_1Rnd_60mm_m2_SMOKE","fow_8Rnd_60mm_m2_ILL","fow_1Rnd_60mm_m2_ILL"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
		
		_c pushBack format["%1fow_w_m2_mortar_usmc", _x];
		//_m pushBack ["fow_1Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_SMOKE","fow_1Rnd_60mm_m2_SMOKE","fow_8Rnd_60mm_m2_ILL","fow_1Rnd_60mm_m2_ILL"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
		
		_c pushBack format["%1fow_w_m2_mortar_adv_usmc", _x];
		//_m pushBack ["fow_1Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_HE","fow_8Rnd_60mm_m2_SMOKE","fow_1Rnd_60mm_m2_SMOKE","fow_8Rnd_60mm_m2_ILL","fow_1Rnd_60mm_m2_ILL"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[60,1260], [80,1800], [100,2400], [100,2400]];
	};
	
	if(CTI_CSA_ADDON > 0) then {
		if !(("csa38_GrW34") call CTI_CO_FNC_IsSidePatchLoaded) then {_x = "";};
		_c pushBack format["%1csa38_GrW34", _x];
		//_m pushBack ["csa38_minawg34","csa38_minawg34_SmokeShell"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[220,449], [432,918], [1730,3670], [1730,3670]];
		
		_c pushBack format["%1CSA38_2inch_vehicle", _x];
		//_m pushBack ["CSA38_2inch_he_1rnd","CSA38_2inch_smoke_1rnd","CSA38_2inch_illum_1rnd"];
		_b pushBack [1];
		//_r pushBack [[30,650], [30,650], [30,650], [30,650]];
		
		_c pushBack format["%1CSA38_mvz36", _x];
		//_m pushBack ["csa38_minavz36"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[25,450], [50,920], [205,3680], [205,3680]];
		
		_c pushBack format["%1csa38_KPUV37", _x];
		//_m pushBack ["CSA38_37mm_A4_AP","CSA38_37mm_A4_AP2","CSA38_37mm_A4_HE","CSA38_37mm_A4_APG","CSA38_37mm_A4_AP2G","CSA38_37mm_A4_HEG"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[80,280], [160,570], [640,2290], [640,2290]];
	};
	
	if(CTI_NF_ADDON > 0) then {		
		if !(("NORTH_FIN_W_50krh38") call CTI_CO_FNC_IsSidePatchLoaded) then {_x = "";};
		_c pushBack format["%1NORTH_FIN_W_50krh38", _x];//light mortar
		//_m pushBack ["NORTH_10Shell_50mm_MortarHEshell_50krh38","NORTH_10Shell_50mm_MortarSmokeShell_50krh38"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[56,229], [56,229], [56,229], [177,720]];
		
		_c pushBack format["%1NORTH_FIN_W_81krh32", _x];//mortar
		//_m pushBack ["NORTH_10Shell_81mm_MortarHEshell_81krh32","NORTH_10Shell_81mm_MortarSmokeShell_81krh32"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[88,358], [88,358], [226,918], [627,2552]];
		
		_c pushBack format["%1NORTH_FIN_W_152H38", _x];//arty
		//_m pushBack ["NORTH_10Shell_152mmHE_152h38"];
		_b pushBack [1, 2, 4, 8,10];
		//_r pushBack [[0,957], [0,2387], [0,6110], [0,16974], [0,26522]];
		
		_c pushBack format["%1NORTH_FIN_S_41_50krh38", _x];//light mortar
		//_m pushBack ["NORTH_10Shell_50mm_MortarHEshell_50krh38","NORTH_10Shell_50mm_MortarSmokeShell_50krh38"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[56,229], [56,229], [56,229], [177,720]];
		
		_c pushBack format["%1NORTH_FIN_S_41_81krh32", _x];//mortar
		//_m pushBack ["NORTH_10Shell_81mm_MortarHEshell_81krh32","NORTH_10Shell_81mm_MortarSmokeShell_81krh32"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[88,358], [88,358], [226,918], [627,2552]];
		
		_c pushBack format["%1NORTH_FIN_S_41_152H38", _x];//arty
		//_m pushBack ["NORTH_10Shell_152mmHE_152h38"];
		_b pushBack [1, 2, 4, 8,10];
		//_r pushBack [[0,957], [0,2387], [0,6110], [0,16974], [0,26522]];
		
		_c pushBack format["%1NORTH_FIN_50krh38", _x];//light mortar
		//_m pushBack ["NORTH_10Shell_50mm_MortarHEshell_50krh38","NORTH_10Shell_50mm_MortarSmokeShell_50krh38"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[56,229], [56,229], [56,229], [177,720]];
		
		_c pushBack format["%1NORTH_FIN_81krh32", _x];//mortar
		//_m pushBack ["NORTH_10Shell_81mm_MortarHEshell_81krh32","NORTH_10Shell_81mm_MortarSmokeShell_81krh32"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[88,358], [88,358], [226,918], [627,2552]];
		
		_c pushBack format["%1NORTH_FIN_152H38", _x];//arty
		//_m pushBack ["NORTH_10Shell_152mmHE_152h38"];
		_b pushBack [1, 2, 4, 8,10];
		//_r pushBack [[0,957], [0,2387], [0,6110], [0,16974], [0,26522]];

		_c pushBack format["%1NORTH_SOV_W_39_152mm1938", _x];//arty
		//_m pushBack ["NORTH_10Shell_152mmHE_152h38"];
		_b pushBack [1, 2, 4, 8,10];
		//_r pushBack [[0,957], [0,2387], [0,6110], [0,16974], [0,26522]];
		
		_c pushBack format["%1NORTH_SOV_W_39_50rm38", _x];//light mortar
		//_m pushBack ["NORTH_10Shell_50mm_MortarHEshell_50krh38","NORTH_10Shell_50mm_MortarSmokeShell_50krh38"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[56,229], [56,229], [56,229], [177,720]];
		
		_c pushBack format["%1NORTH_SOV_152mm1938", _x];//arty
		//_m pushBack ["NORTH_10Shell_152mmHE_152h38"];
		_b pushBack [1, 2, 4, 8,10];
		//_r pushBack [[0,957], [0,2387], [0,6110], [0,16974], [0,26522]];
		
		_c pushBack format["%1NORTH_SOV_50rm38", _x];//light mortar
		//_m pushBack ["NORTH_10Shell_50mm_MortarHEshell_50krh38","NORTH_10Shell_50mm_MortarSmokeShell_50krh38"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[56,229], [56,229], [56,229], [177,720]];
		
		//76mm1902 Arty (w)
		_c pushBack format["%1NORTH_SOV_W_39_76mm1902art", _x];//76mm1902 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k02art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1281], [0,3194], [0,8178], [0,8178]];
		
		_c pushBack format["%1NORTH_SOV_76mm1902art", _x];//76mm1902 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k02art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1281], [0,3194], [0,8178], [0,8178]];
		
		_c pushBack format["%1NORTH_FIN_W_76k02art", _x];//76mm1902 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k02art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1281], [0,3194], [0,8178], [0,8178]];
		
		_c pushBack format["%1NORTH_FIN_41_S_76k02art", _x];//76mm1902 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k02art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1281], [0,3194], [0,8178], [0,8178]];
		
		//76mm1936 Arty (w)
		_c pushBack format["%1NORTH_SOV_W_39_76mm1936art", _x];//76mm1936 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k36art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1803], [0,4496], [0,11512], [0,11512]];
		
		_c pushBack format["%1NORTH_SOV_76mm1936art", _x];//76mm1936 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k36art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1803], [0,4496], [0,11512], [0,11512]];
		
		_c pushBack format["%1NORTH_FIN_W_76k36art", _x];//76mm1936 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k36art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1803], [0,4496], [0,11512], [0,11512]];
		
		_c pushBack format["%1NORTH_FIN_S_41_76k36art", _x];//76mm1936 Arty (w)
		//_m pushBack ["NORTH_10Shell_76mmHE_76k36art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,1803], [0,4496], [0,11512], [0,11512]];
		
		//76mm1927 light Arty (w)
		_c pushBack format["%1NORTH_SOV_W_39_76mm1927art", _x];//76mm1927 light Arty (w)
		//_m pushBack ["NORTH_20Shell_76mmHE_76rk27art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,920], [0,2294], [0,5873], [0,5873]];
		
		_c pushBack format["%1NORTH_SOV_76mm1927art", _x];//76mm1927 light Arty (w)
		//_m pushBack ["NORTH_20Shell_76mmHE_76rk27art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,920], [0,2294], [0,5873], [0,5873]];
		
		_c pushBack format["%1NORTH_FIN_W_76RK27art", _x];//76mm1927 light Arty (w)
		//_m pushBack ["NORTH_20Shell_76mmHE_76rk27art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,920], [0,2294], [0,5873], [0,5873]];
		
		_c pushBack format["%1NORTH_FIN_S_41_76RK27art", _x];//76mm1927 light Arty (w)
		//_m pushBack ["NORTH_20Shell_76mmHE_76rk27art"];
		_b pushBack [1, 2, 4, 8, 10];
		//_r pushBack [[0,920], [0,2294], [0,5873], [0,5873]];
	};
	
	if(CTI_SPE_DLC > 0) then {
		if !(("SPE_GrW278_1") call CTI_CO_FNC_IsSidePatchLoaded) then {_x = "";};
		_c pushBack format["%1SPE_GrW278_1", _x];
		//_m pushBack ["SPE_8Rnd_81mm_FA_Mle_1932_HE","SPE_8Rnd_81mm_FA_Mle_1932_Smoke","SPE_8Rnd_81mm_FA_Mle_1932_Illu","SPE_1Rnd_81mm_FA_Mle_1932_HE","SPE_81mm_FA_Mle_1932_Smoke","SPE_81mm_FA_Mle_1932_Illu"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

		_c pushBack format["%1SPE_M1_81", _x];
		//_m pushBack ["SPE_8Rnd_81mmHE_M1_M43A1","SPE_8rnd_81mm_M1_M57_SmokeShell","SPE_8Rnd_81mmWP_M1_M57","SPE_1Rnd_81mmHE_M1_M43A1","SPE_81mm_M1_M57_SmokeShell","SPE_1Rnd_81mmWP_M1_M57"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];
			
		_c pushBack format["%1SPE_MLE_27_31", _x];
		//_m pushBack ["SPE_8Rnd_81mm_FA_Mle_1932_HE","SPE_8Rnd_81mm_FA_Mle_1932_Smoke","SPE_8Rnd_81mm_FA_Mle_1932_Illu","SPE_1Rnd_81mm_FA_Mle_1932_HE","SPE_81mm_FA_Mle_1932_Smoke","SPE_81mm_FA_Mle_1932_Illu"];
		_b pushBack [1, 2, 4, 8];
		//_r pushBack [[100,1000], [100,1500], [100,2000], [100,2500]];

		_c pushBack format["%1SPE_leFH18", _x];
		//_m pushBack ["SPE_20x_Shell_105L28_Gr38_HE","SPE_8x_Shell_105L28_Gr39HlC_HEAT_Artillery","SPE_20x_Shell_105L28_Gr38_NB","SPE_Shell_105L28_Gr38_HE","SPE_Shell_105L28_Gr39HlC_HEAT","SPE_Shell_105L28_Gr38_NB"];
		_b pushBack [1, 2, 4, 6, 8, 10];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];
			
		_c pushBack format["%1SPE_M4A1_T34_Calliope", _x];
		//_m pushBack ["SPE_60Rnd_M8"];
		_b pushBack [5, 10, 20, 30, 40];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];
		
		_c pushBack format["%1SPE_M4A3_T34_Calliope", _x];
		//_m pushBack ["SPE_60Rnd_M8"];
		_b pushBack [5, 10, 20, 30, 40];
		//_r pushBack [[500,2000], [500,3000], [500,4000], [500,5000]];
	};
} forEach _sid;

//_cntstart = count _c;
//_cntend = count _m;
for [{ _i = 0 }, { _i < count _c }, { _i = _i + 1 }] do { 
	_m pushBack [""];
	_r pushBack [[]];
};

[_c, _m, _b, _r] call compile preprocessFileLineNumbers "Common\Config\Artillery\Set_Artillery.sqf";