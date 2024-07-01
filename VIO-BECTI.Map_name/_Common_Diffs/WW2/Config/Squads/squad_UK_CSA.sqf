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
if !(("CSA38_ENsoldier1_7") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	inf_to_add = [[format["%1CSA38_ENsoldier1_7", _sid], 1, 40]];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_ENsoldier3_1", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_4", _sid], 1, 40];
	
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
	inf_to_add = [[format["%1CSA38_ENsoldier1_5", _sid], 1, 40]];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_1", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_2", _sid], 1, 40];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_6", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier1_3", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier2_1", _sid], 1, 30];
	inf_to_add pushBack [format["%1CSA38_ENsoldier2", _sid], 1, 30];
	
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
	inf_to_add = [[format["%1CSA38_ENsoldier8_3", _sid], 1, 20]];
	inf_to_add pushBack [format["%1CSA38_ENsoldier8_2", _sid], 1, 10];
	inf_to_add pushBack [format["%1CSA38_ENsoldier8_1", _sid], 1, 5];
	
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
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups
/*units_wheeled = [];
mot_to_add = [];
wheeled_auto = [];
kind_wheeled = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	mot_to_add = [[format["%1LIB_UK_Willys_MB_Hood", _sid], 1, 20]];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [[format["%1LIB_UK_Willys_MB_Hood_w", _sid], 1, 20]];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [[format["%1LIB_UK_DR_Willys_MB_Hood", _sid], 1, 20]];		
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
*/

//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
tracked_auto = [];
kind_tracked = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {
			switch(_side) do {
				case east: {
					arm_to_add = [[format["%1csa38_m3a37ADW2", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37ADW3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37ADW4", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37ADW5", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_m3a37ADW", _sid], 1, 50]];
				};
			};
		};
		case 2: {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_m3a37AD8", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD6", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD7", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD9", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_m3a37AD2", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD4", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD5", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_m3a37AD10", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD11", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD12", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD13", _sid], 1, 50];
				};
			};
		};
		default {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_m3a37AD458", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD456", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD457", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD459", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_m3a37AD452", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD453", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD454", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD455", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_m3a37AD4510", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_m3a37AD4511", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD4512", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_m3a37AD4513", _sid], 1, 50];
				};
			};
		};
	};
	units_tracked append arm_to_add;
	tracked_auto append arm_to_add;
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "M3A3 Stuart [CSA]";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	arm_to_add = [[format["%1csa38_m5a17AD3", _sid], 1, 50]];
	//arm_to_add pushBack [format["%1csa38_m5a17AD2", _sid], 1, 50];
	arm_to_add = [[format["%1csa38_matildaii_5", _sid], 1, 50]];
	//arm_to_add pushBack [format["%1csa38_matildaii_1", _sid], 1, 50];
	//arm_to_add pushBack [format["%1csa38_matildaiiCS_1", _sid], 1, 50];
	//arm_to_add pushBack [format["%1csa38_matildaii_4", _sid], 1, 50];
	//arm_to_add pushBack [format["%1csa38_matildaiiCS_4", _sid], 1, 50];
	//arm_to_add pushBack [format["%1csa38_matildaiiCS_5", _sid], 1, 50];
	arm_to_add = [[format["%1csa38_valentineMkIIgreen", _sid], 1, 50]];
	//arm_to_add pushBack [format["%1csa38_valentineMkIIgreen2", _sid], 1, 50];
	//arm_to_add pushBack [format["%1csa38_valentineMkIIgreen3", _sid], 1, 50];
	//arm_to_add pushBack [format["%1csa38_valentineMkIIgreen4", _sid], 1, 50];
		
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		arm_to_add = [[format["%1csa38_m5a17ADW", _sid], 1, 50]];
		arm_to_add = [[format["%1csa38_matildaii_3", _sid], 1, 50]];
		//arm_to_add pushBack [format["%1csa38_matildaiiCS_3", _sid], 1, 50];
		arm_to_add = [[format["%1csa38_valentineMkIIW", _sid], 1, 50]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		arm_to_add = [[format["%1csa38_m5a17AD4", _sid], 1, 50]];
		//arm_to_add pushBack [format["%1csa38_m5a17AD", _sid], 1, 50];
		arm_to_add = [[format["%1csa38_matildaii", _sid], 1, 50]];
		//arm_to_add pushBack [format["%1csa38_matildaiiCS", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_matildaii_2", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_matildaiiCS_2", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_matildaii_6", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_matildaiiCS_6", _sid], 1, 50];
		arm_to_add = [[format["%1csa38_valentineMkII2", _sid], 1, 50]];
		//arm_to_add pushBack [format["%1csa38_valentineMkII", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_valentineMkII6", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_valentineMkII5", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_valentineMkII4", _sid], 1, 50];
		//arm_to_add pushBack [format["%1csa38_valentineMkII3", _sid], 1, 50];
	};
	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "Stuart | Matilda | Valentine [CSA]";
_p pushBack arm_to_add;
_f pushBack CTI_HEAVY;
_m pushBack 500;
_c pushBack "Armored";
_s pushBack [];
kind_tracked pushBack format["ArmoredT%1", _level];

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_cromwell_2camo9W", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo10W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo12W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo11W", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_cromwell_2camo1W", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo2W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo3W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo4W", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_cromwell_2camo5W", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo6W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo7W", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo8W", _sid], 1, 50];
				};
			};
			arm_to_add pushBack [format["%1csa38_cromwell_4ENW", _sid], 1, 50];//mortar gun
		};
		case 2: {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_cromwell_2camo9", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo10", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo11", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo12", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_cromwell_2camo1", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo2", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo4", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_cromwell_2camo5", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo6", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo7", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_2camo8", _sid], 1, 50];
				};
			};
			arm_to_add pushBack [format["%1csa38_cromwell_4EN", _sid], 1, 50];//mortar gun
		};
		default {
			switch(_side) do {
				case west: {
					arm_to_add = [[format["%1csa38_cromwell_245camo9", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo10", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo11", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo12", _sid], 1, 50];
				};
				case east: {
					arm_to_add = [[format["%1csa38_cromwell_245camo1", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo2", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo3", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo4", _sid], 1, 50];
				};
				default {
					arm_to_add = [[format["%1csa38_cromwell_245camo5", _sid], 1, 50]];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo6", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo7", _sid], 1, 50];
					arm_to_add pushBack [format["%1csa38_cromwell_245camo8", _sid], 1, 50];
				};
			};
			arm_to_add pushBack [format["%1csa38_cromwell_5EN45", _sid], 1, 50];//mortar gun
		};
	};	
	units_tracked append arm_to_add;
	if(CTI_FACTORY_LEVEL_PRESET == _level) then {tracked_auto append arm_to_add;};
};

_v pushBack format["ArmoredT%1", _level];
_t pushBack "Cromwell [CSA]";
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_UK_FOW.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

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
/*if(count kind_wheeled > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	} else {
		{
			kind_wheeled pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_LIGHT", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_LIGHT", _side], kind_wheeled];
	};
};*/
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
