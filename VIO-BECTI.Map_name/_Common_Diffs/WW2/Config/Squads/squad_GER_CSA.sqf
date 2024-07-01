_side = _this;
_sid = "";
_level = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if !(("CSA38_WH2Bi") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["Armored", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];

//***************************************************************************************************************************************
//														Infantry Troops																	*
//***************************************************************************************************************************************
//Infantry setup for the AI groups
units_infantry = [];
inf_to_add = [];
infantry_auto = [];
kind_infantry = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1CSA38_WH2Bi", _sid], 1, 50]];//recruits
	inf_to_add pushBack [format["%1CSA38_WH2B", _sid], 1, 50];
	inf_to_add pushBack [format["%1CSA38_WH1B", _sid], 1, 50];
	inf_to_add pushBack [format["%1CSA38_WH4B", _sid], 1, 40];//recruit SL
	inf_to_add pushBack [format["%1CSA38_WH16", _sid], 1, 20];//Soldier Arty
	inf_to_add pushBack [format["%1CSA38_WH22i", _sid], 1, 40];//Soldiers
	inf_to_add pushBack [format["%1CSA38_WH22", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_WH1", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_WH2", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_WH22Ii", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_WH3", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_WH4", _sid], 1, 20];//Engineer
	inf_to_add pushBack [format["%1CSA38_WH4bb", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WH13", _sid], 1, 30];//Medic
	
	units_infantry append inf_to_add;
	infantry_auto append inf_to_add;
};

_v pushBack "InfantryT0";
_t pushBack "Infantry T0";
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryT0";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1CSA38_WH5", _sid], 1, 40]];//MG
	inf_to_add pushBack [format["%1CSA38_WH5as1", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_WH5as2", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_WH5as3", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_WH6b", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_WH6", _sid], 1, 40];
	
	inf_to_add pushBack [format["%1CSA38_WH7", _sid], 1, 20];//WH SL
	inf_to_add pushBack [format["%1CSA38_WH8", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WH9", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WH18", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WH19", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WH20", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WH21", _sid], 1, 20];
	inf_to_add pushBack [format["%1CSA38_WHoff2", _sid], 1, 20];
	
	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {infantry_auto append inf_to_add;};
};

_v pushBack "InfantryT1";
_t pushBack "Infantry T1";
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryT1";

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1CSA38_WH1S", _sid], 1, 30]];
	
	inf_to_add pushBack [format["%1CSA38_WHoff1", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_WHoff5", _sid], 1, 5];
	inf_to_add pushBack [format["%1CSA38_WHoff3", _sid], 1, 5];
	inf_to_add pushBack [format["%1CSA38_WHoff4", _sid], 1, 5];
	
	units_infantry append inf_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {infantry_auto append inf_to_add;};
};

_v pushBack "InfantryT2";
_t pushBack "Infantry T2";
_p pushBack inf_to_add;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryT2";

_v pushBack "Infantry";
_t pushBack "Infantry (Auto)";
_p pushBack infantry_auto;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "Infantry";

_v pushBack "InfantryAll";
_t pushBack "Infantry T0-Max";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
kind_infantry pushBack "InfantryAll";

//***************************************************************************************************************************************
//														Motorized Troops																*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
units_wheeled = [];
mot_to_add = [];
wheeled_auto = [];
kind_wheeled = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [3, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1CSA38_8rad", _sid], 1, 30]];
	mot_to_add pushback [format["%1CSA38_8rad2", _sid], 1, 10];
	//mot_to_add pushback [format["%1CSA38_8radPL", _sid], 1, 10];
	//mot_to_add pushback [format["%1CSA38_8rad2PL", _sid], 1, 10];
	//mot_to_add pushback [format["%1CSA38_8radFR", _sid], 1, 10];
	//mot_to_add pushback [format["%1CSA38_8rad2FR", _sid], 1, 10];
	mot_to_add pushback [format["%1CSA38_8radLATE", _sid], 1, 10];
	mot_to_add pushback [format["%1CSA38_8rad2LATE", _sid], 1, 20];
	mot_to_add pushback [format["%1CSA38_8radLATE2", _sid], 1, 20];
	mot_to_add pushback [format["%1CSA38_8rad2LATE2", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1CSA38_8radW", _sid], 1, 30]];
		mot_to_add pushback [format["%1CSA38_8rad2W", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1CSA38_8radDE", _sid], 1, 30]];
		mot_to_add pushback [format["%1CSA38_8rad2DE", _sid], 1, 10];
	};
	
	units_wheeled append mot_to_add;
	wheeled_auto append mot_to_add;
};

_v pushBack "MotorizedT0";
_t pushBack "unnamed";
_p pushBack mot_to_add;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedT0";

_v pushBack "Motorized";
_t pushBack "Motorized (Auto)";
_p pushBack wheeled_auto;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "Motorized";

_v pushBack "MotorizedAll";
_t pushBack "Motorized T0-Max";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
kind_wheeled pushBack "MotorizedAll";

//***************************************************************************************************************************************
//														Armored Troops																	*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
tracked_auto = [];
kind_tracked = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	arm_to_add = [[format["%1CSA38_pzkpfwI", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzkpfwIA", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzkpfwI_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzkpfwIA_PL", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzkpfwI_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzkpfwIA_FR", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		arm_to_add = [[format["%1CSA38_pzkpfwI_W", _sid], 1, 50]];
		arm_to_add pushback [format["%1CSA38_pzkpfwIA_W", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		arm_to_add = [[format["%1CSA38_pzkpfwI_DE", _sid], 1, 50]];
		arm_to_add pushback [format["%1CSA38_pzbfwI_DE", _sid], 1, 10];
	};
	units_tracked append arm_to_add;
	tracked_auto append arm_to_add;
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "PzKfw I [CSA]";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	arm_to_add = [[format["%1CSA38_pzII", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzIIa", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_pzIIb", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_ltm35_1", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzII_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIa_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIb_PL", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzII_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIa_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIb_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_ltm35_FR", _sid], 1, 10];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		arm_to_add = [[format["%1CSA38_pzII_W", _sid], 1, 50]];
		arm_to_add pushback [format["%1CSA38_pzIIa_W", _sid], 1, 10];
		arm_to_add pushback [format["%1CSA38_pzIIb_W", _sid], 1, 10];
		arm_to_add pushback [format["%1CSA38_ltm35_W", _sid], 1, 10];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		arm_to_add = [[format["%1CSA38_pzII_DE", _sid], 1, 50]];
		arm_to_add pushback [format["%1CSA38_pzIIa_DE", _sid], 1, 10];
		arm_to_add pushback [format["%1CSA38_pzIIb_DE", _sid], 1, 10];
	};
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "PzKpfw II  [CSA]";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1CSA38_pzIIIB", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzIIIC", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_pzIIID", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_ltm38", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzIIIB_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIIC_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIID_PL", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzIIIB_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIIC_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIID_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_ltm38_FR", _sid], 1, 10];
	
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		arm_to_add = [[format["%1CSA38_pzIIIB_W", _sid], 1, 50]];
		arm_to_add pushback [format["%1CSA38_pzIIIC_W", _sid], 1, 10];
		arm_to_add pushback [format["%1CSA38_pzIIIC_W", _sid], 1, 10];
		arm_to_add pushback [format["%1CSA38_ltm38_W", _sid], 1, 10];
	};
	arm_to_add pushback [format["%1CSA38_StugIII", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_ltm38_LATE", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_ltm38_LATE2", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIIB_LATE", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIIC_LATE", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIIIC_LATE", _sid], 1, 10];
	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "PzKpfw III + Stug III [CSA]";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1CSA38_pzIV", _sid], 1, 50]];
	arm_to_add pushback [format["%1CSA38_pzIVB", _sid], 1, 10];
	arm_to_add pushback [format["%1CSA38_pzIVcv38", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzIV_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIVB_PL", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIVC_PL", _sid], 1, 10];
	
	//arm_to_add pushback [format["%1CSA38_pzIV_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIVB_FR", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIVC_FR", _sid], 1, 10];
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1CSA38_pzIV_W", _sid], 1, 50]];
		arm_to_add pushback [format["%1CSA38_pzIVB_W", _sid], 1, 10];
		arm_to_add pushback [format["%1CSA38_pzIVC_W", _sid], 1, 10];
	};
	//arm_to_add pushback [format["%1CSA38_pzIV_LATE", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIVB_LATE", _sid], 1, 10];
	//arm_to_add pushback [format["%1CSA38_pzIVC_LATE", _sid], 1, 10];
	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "PzKpfw IV [CSA]";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_v pushBack "Armored";
_t pushBack "Tanks (Auto)";
_p pushBack tracked_auto;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack "Armored";

_v pushBack "ArmoredAll";
_t pushBack "Tanks T0-Max";
_p pushBack units_tracked;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack "ArmoredAll";

//***************************************************************************************************************************************
//														AntiAir																			*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
/*
units_antiair = [];
antiair_to_add = [];
antiair_auto = [];

_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;
_matrix_cnt = [1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	antiair_to_add = [[format["%1LIB_Kfz1_MG42", _sid], 1, 60]];

	units_antiair append antiair_to_add;
	antiair_auto append antiair_to_add;
};

_v pushBack format["AntiAirT%1T", _level];
_t pushBack "FlakPanzerIV";
_p pushBack antiair_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_tracked pushBack format["AntiAirT%1", _level];

_v pushBack "AntiAir";
_t pushBack "AntiAir (Auto)";
_p pushBack antiair_auto;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack "AntiAir";

_v pushBack "AntiAirAll";
_t pushBack "AntiAir T0-Max";
_p pushBack units_antiair;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "AntiAir";
_s pushBack [];
kind_wheeled pushBack "AntiAirAll";
*/
//***************************************************************************************************************************************
//														Air																				*
//***************************************************************************************************************************************
//Air setup for the AI groups
/*
units_air = [];
air_to_add = [];
air_auto = [];
kind_air = [];
_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	air_to_add = [[format["%1LIB_FW190F8", _sid], 1, 50]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		air_to_add = [[format["%1LIB_FW190F8_w", _sid], 1, 50]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo activea
		air_to_add = [[format["%1LIB_DAK_FW190F8", _sid], 1, 50]];
	};
	units_air append air_to_add;
	if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};
};

_v pushBack format["AirT%1", _level];
_t pushBack "FW 190 F8";
_p pushBack air_to_add;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack format["AirT%1", _level];

_v pushBack "Air";
_t pushBack "Air (Auto)";
_p pushBack air_auto;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack "Air";

_v pushBack "AirAll";
_t pushBack "Air  T0-Max";
_p pushBack units_air;
_f pushBack CTI_AIR;
_m pushBack 1000;
_c pushBack "Air";
_s pushBack [];
kind_air pushBack "AirAll";
*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_GER_CSA.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

//--- Those are used by the commander to determine the kind of unit an AI team has
if(count kind_infantry > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_INFANTRY", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], kind_infantry];
	} else {
		{
			kind_infantry pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_INFANTRY", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_INFANTRY", _side], kind_infantry];
	};
};
if(count kind_wheeled > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	} else {
		{
			kind_wheeled pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	};
};
if(count kind_tracked > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_HEAVY", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], kind_tracked];
	} else {
		{
			kind_tracked pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_HEAVY", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_HEAVY", _side], kind_tracked];
	};
};
/*if(count kind_air > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	} else {
		{
			kind_air pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	};
};*/

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
