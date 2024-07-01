_side = _this;
_sid = "";
_sid_base = "";
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
//if !(("sab_nl_mutsuki") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};

_v = [];
_t = [];
_p = [];
_f = [];
_m = [];
_c = [];
_s = [];

//--- Commander will assign those orders based on the force and the probability [type, strenght, {probability}, {Max per side}]
/*missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_INFANTRY", _side], [["Infantry", 2, 40]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_LIGHT", _side], [["Motorized", 2, 60]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_HEAVY", _side], [["AntiAir", 1, 20], ["Armored", 2, 80]]];
missionNamespace setVariable [format["CTI_SQUADS_%1_CATEGORY_AIR", _side], [["Air", 1, 40]]];

missionNamespace setVariable [format["CTI_SQUADS_%1_TOWN_DEFENSE", _side], ["Infantry", "Motorized"]];*/

//***************************************************************************************************************************************
//														Infantry Troops																	*
//***************************************************************************************************************************************
//Infantry setup for the AI groups
/*units_infantry = [];
inf_to_add = [];
infantry_auto = [];
kind_infantry = [];

if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	inf_to_add = [format["%1LIB_UK_Rifleman", _sid], 1, 60];
	inf_to_add pushBack [format["%1LIB_UK_Medic", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		inf_to_add = [format["%1LIB_UK_Rifleman_w", _sid], 1, 60];	
		inf_to_add pushBack [format["%1LIB_UK_Medic_w", _sid], 1, 20];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		inf_to_add = [format["%1LIB_UK_DR_Rifleman", _sid], 1, 60];	
		inf_to_add pushBack [format["%1LIB_UK_DR_Medic", _sid], 1, 20];
	};
	units_infantry pushBack inf_to_add;
};

_v pushBack "Infantry";
_t pushBack "Infantry";
_p pushBack units_infantry;
_f pushBack CTI_BARRACKS;
_m pushBack 100;
_c pushBack "Infantry";
_s pushBack [];
*/

//***************************************************************************************************************************************
//														Motorized																		*
//***************************************************************************************************************************************
//Wheeled setup for the AI groups

units_wheeled = [];
mot_to_add = [];
wheeled_auto = [];
kind_wheeled = [];

/*if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_wheeled = units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	mot_to_add = [format["%1LIB_UK_Willys_MB_Hood", _sid], 1, 20];
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		mot_to_add = [format["%1LIB_UK_Willys_MB_Hood_w", _sid], 1, 20];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		mot_to_add = [format["%1LIB_UK_DR_Willys_MB_Hood", _sid], 1, 20];		
	};
	units_wheeled pushBack mot_to_add;
};
_v pushBack "Motorized";
_t pushBack "Motorized";
_p pushBack units_wheeled;
_f pushBack CTI_LIGHT;
_m pushBack 200;
_c pushBack "Motorized";
_s pushBack [];
*/

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_DaimlerMk2")) then {
		if !(("FA_DaimlerMk2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			mot_to_add = [format["%1FA_DaimlerMk2", _sid], 1, 20];
			
			_v pushBack "MotorizedDaimler";
			_t pushBack "Daimler Mk2";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedDaimler";
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			mot_to_add = [format["%1FA_T17E1", _sid], 1, 20];
			
			_v pushBack "MotorizedT17E1";
			_t pushBack "T17E1";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedT17E1";
		};
	};
};

if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_BA64")) then {
		if !(("FA_BA64") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			mot_to_add = [format["%1FA_BA64", _sid], 1, 20];
			
			_v pushBack "MotorizedBA64";
			_t pushBack "BA64";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedBA64";
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			mot_to_add = [format["%1FA_BA10M", _sid], 1, 20];
			
			_v pushBack "MotorizedBA10M";
			_t pushBack "BA10M";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedBA10M";
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_BA64_Captured")) then {
		if !(("FA_BA64_Captured") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_BA64_Captured", _sid];
			mot_to_add = [format["%1FA_BA64_Captured", _sid], 1, 20];
			
			_v pushBack "MotorizedBA64";
			_t pushBack "BA64";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedBA64";
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_BA10M_Captured", _sid];
			mot_to_add = [format["%1FA_BA10M_Captured", _sid], 1, 20];
			
			_v pushBack "MotorizedBA10M";
			_t pushBack "BA10M";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedBA10M";
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			mot_to_add = [format["%1FA_Sdkfz231", _sid], 1, 20];
			mot_to_add pushBack [format["%1FA_Sdkfz234_4", _sid], 1, 20];
			
			_v pushBack "MotorizedSdkfz23x";
			_t pushBack "Sdkfz23x";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedSdkfz23x";
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_Sdkfz234", _sid];
			mot_to_add = [format["%1FA_Sdkfz234", _sid], 1, 20];
			
			_v pushBack "MotorizedPuma";
			_t pushBack "Puma";
			_p pushBack units_wheeled;
			_f pushBack CTI_LIGHT;
			_m pushBack 200;
			_c pushBack "Motorized";
			_s pushBack [];
			kind_infantry pushBack "MotorizedPuma";
		};
	};
};


//***************************************************************************************************************************************
//														Armored																			*
//***************************************************************************************************************************************
//Tracked setup for the AI groups
units_tracked = [];
arm_to_add = [];
tracked_auto = [];
kind_tracked = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_ValentineMk3")) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			if !(("FA_ValentineMk3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			arm_to_add = [[format["%1FA_ValentineMk3", _sid], 1, 20]];
			
			_v pushBack format["ArmoredValentine", _level];
			_t pushBack "ValentineMk3";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredValentine", _level];
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_M26")) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			if !(("FA_M26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			arm_to_add = [[format["%1FA_M26", _sid], 1, 20]];
			
			_v pushBack format["ArmoredM26", _level];
			_t pushBack "M26";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredM26", _level];
		};
	};
};
if (isClass(configFile >> "CfgVehicles" >> "SOV_BT_BT7A")) then {
	if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_BT_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			if !(("SOV_BT_BT7A") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			arm_to_add = [[format["%1SOV_BT_BT7A", _sid], 1, 40]];
			arm_to_add pushBack [format["%1SOV_BT_BT7_M1937", _sid], 1, 40];
			arm_to_add pushBack [format["%1SOV_BT_BT7TU_M1937", _sid], 1, 40];
			
			units_tracked pushBack arm_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {tracked_auto append arm_to_add;};
		};

		_v pushBack format["ArmoredBT7", _level];
		_t pushBack "BT7";
		_p pushBack arm_to_add;
		_f pushBack CTI_HEAVY;
		_m pushBack 500;
		_c pushBack "Armored";
		_s pushBack [];
		kind_tracked pushBack format["ArmoredBT7", _level];
	};
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26")) then {
		if !(("FA_T26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			arm_to_add = [[format["%1FA_T26", _sid], 1, 20]];
			
			_v pushBack format["ArmoredT26", _level];
			_t pushBack "T26";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredT26", _level];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			arm_to_add = [[format["%1FA_ValentineMk3_SOV", _sid], 1, 20]];
			
			_v pushBack format["ArmoredValentine", _level];
			_t pushBack "ValentineMk3";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredValentine", _level];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			arm_to_add = [[format["%1FA_KV1", _sid], 1, 20]];
			
			_v pushBack format["ArmoredKV1", _level];
			_t pushBack "KV1";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredKV1", _level];
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26_Captured")) then {
		if !(("FA_T26_Captured") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			arm_to_add = [[format["%1FA_T26_Captured", _sid], 1, 20]];
			
			_v pushBack format["ArmoredT26", _level];
			_t pushBack "T26";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredT26", _level];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			arm_to_add = [[format["%1FA_Pz38t", _sid], 1, 20]];
			arm_to_add pushBack [format["%1FA_Panzer2", _sid], 1, 40];
			
			_v pushBack format["ArmoredPz2", _level];
			_t pushBack "Pz38t Pz2";
			_p pushBack arm_to_add;
			_f pushBack CTI_HEAVY;
			_m pushBack 500;
			_c pushBack "Armored";
			_s pushBack [];
			kind_tracked pushBack format["ArmoredPz2", _level];
		};
	};
};

/*_v pushBack "Armored";
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
kind_tracked pushBack "ArmoredAll";*/

//***************************************************************************************************************************************
//														AntiAir																			*
//***************************************************************************************************************************************
//AntiAir setup for the AI groups
/*units_antiair = [];

if(CTI_ECONOMY_LEVEL_WHEELED < 0) then {
	units_antiair = units_infantry;
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	units_antiair = [[format["%1LIB_UK_Willys_MB_M1919", _sid], 1, 30]];
	if(CTI_CAMO_ACTIVATION == 1) then {		//Winter camo active
		units_antiair = [[format["%1LIB_UK_Willys_MB_M1919_w", _sid], 1, 30]];
	};
	if(CTI_CAMO_ACTIVATION == 2) then {		//Desert camo active
		units_antiair = [[format["%1LIB_UK_DR_Willys_MB_M1919", _sid], 1, 30]];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		units_antiair pushBack [format["%1LIB_UK_M16_Halftrack", _sid], 1, 50];
	};
};

_v pushBack "AntiAir";
_t pushBack "AntiAir";
_p pushBack units_antiair;
_f pushBack CTI_LIGHT;
_m pushBack 300;
_c pushBack "AntiAir";
_s pushBack [];
*/

//***************************************************************************************************************************************
//														Air																				*
//***************************************************************************************************************************************
//Air setup for the AI groups
units_air = [];
air_to_add = [];
air_auto = [];
kind_air = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_gladiator") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_gladiator", _sid], 1, 40]];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "Gladiator [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_ca12bo", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Ca12bo [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_mb5", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "MB5 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_meteor", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Meteor [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_hurricane") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_hurricane", _sid], 1, 40]];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "Hurricane [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_hurricane_trop", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Hurricane trop [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_hurricane_2", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Hurricane 2 [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_dh98", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "DH98 [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_sw_halifax", _sid], 1, 40]];

				units_air append air_to_add;
				air_auto append air_to_add;

				_v pushBack format["AirT%1", _level];
				_t pushBack "Halifax [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_p26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_p26", _sid], 1, 30]];
			air_to_add pushBack [format["%1sab_ryanpt", _sid], 1, 30];

			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "P26 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_texan", _sid], 1, 30]];
			air_to_add pushBack [format["%1sab_dauntless", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_avenger", _sid], 1, 30];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Dauntless [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_p38", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_corsair", _sid], 1, 40];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "P38 + F4U [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_mustang", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_p51b", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_a26", _sid], 1, 20];
			air_to_add pushBack [format["%1sab_b25", _sid], 1, 20];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "P51b [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_tigercat", _sid], 1, 20]];
			air_to_add pushBack [format["%1sab_f6f", _sid], 1, 30];
			air_to_add pushBack [format["%1sab_b24", _sid], 1, 20];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "F6F [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_p61", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_b17", _sid], 1, 20];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "P61 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_f4f") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_f4f", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_fl_sbd", _sid], 1, 30];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "SBD [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_f4u", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "F4U [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_p51d", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "P51d [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_tbf") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_tbf", _sid], 1, 30]];
				
				units_air append air_to_add;
				air_auto append air_to_add;

				_v pushBack format["AirT%1", _level];
				_t pushBack "TBF [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_p40", _sid], 1, 30]];
				air_to_add pushBack [format["%1sab_sw_p38", _sid], 1, 30];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "P38 + P40 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_a26", _sid], 1, 20]];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "A26 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_b17", _sid], 1, 10]];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "B17 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_i16") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_i16", _sid], 1, 30]];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "I16 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_la5", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_la5_2", _sid], 1, 40];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "La5 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_p39", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "P39 (Sov) [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_tusb2", _sid], 1, 20]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Tusb2 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_il2", _sid], 1, 30]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "IL2 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_yak3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_yak3", _sid], 1, 40]];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "Yak3 [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_i16") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_i16", _sid], 1, 40]];
				
				units_air append air_to_add;
				air_auto append air_to_add;

				_v pushBack format["AirT%1", _level];
				_t pushBack "I16 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
		
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_il2", _sid], 1, 30]];
				air_to_add pushBack [format["%1sab_sw_il2_2", _sid], 1, 30];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "IL2 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_avia") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_avia", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_bu131", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_avia_2", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_w34", _sid], 1, 20];
			air_to_add pushBack [format["%1sab_w34f", _sid], 1, 20];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "Avia [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_bf109", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_ju87", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_bf110", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_bf110_2", _sid], 1, 40];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Bf 109 + Bf 110 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_ju88", _sid], 1, 20]];
			air_to_add pushBack [format["%1sab_ju88_2", _sid], 1, 20];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Ju88 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fw190", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_fw190_2", _sid], 1, 40];
			air_to_add pushBack [format["%1sab_he111", _sid], 1, 20];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Fw 190 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_bv141", _sid], 1, 10]];
			air_to_add pushBack [format["%1sab_do335", _sid], 1, 10];
			air_to_add pushBack [format["%1sab_ta152c", _sid], 1, 10];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Do 335 + Ta 152 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_he162", _sid], 1, 10]];
			air_to_add pushBack [format["%1sab_hix", _sid], 1, 10];
			air_to_add pushBack [format["%1sab_me262", _sid], 1, 20];
			air_to_add pushBack [format["%1sab_me262_2", _sid], 1, 20];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Me 262 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_bf109e") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_bf109e", _sid], 1, 40]];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "Bf 109e [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_bf109f", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_fl_ju88a", _sid], 1, 30];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Bf 109f [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_bf109g", _sid], 1, 40]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Bf 109g [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_bf109k", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_fl_fw190a", _sid], 1, 30];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Bf 109k + Fw 190 [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_he162", _sid], 1, 30]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "He 162 [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_bf110") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_bf110", _sid], 1, 20]];
				air_to_add pushBack [format["%1sab_sw_bf110_2", _sid], 1, 20];
				air_to_add pushBack [format["%1sab_sw_ju87", _sid], 1, 20];
				
				units_air append air_to_add;
				air_auto append air_to_add;

				_v pushBack format["AirT%1", _level];
				_t pushBack "Bf 110 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_ju87_2", _sid], 1, 20]];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "Ju 87 AT [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_do335", _sid], 1, 10]];
				air_to_add pushBack [format["%1sab_sw_he177", _sid], 1, 10];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "Do 335 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				air_to_add = [[format["%1sab_sw_ar234", _sid], 1, 10]];
				
				units_air append air_to_add;
				if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

				_v pushBack format["AirT%1", _level];
				_t pushBack "AR 234 [SAB rl]";
				_p pushBack air_to_add;
				_f pushBack CTI_AIR;
				_m pushBack 1000;
				_c pushBack "Air";
				_s pushBack [];
				kind_air pushBack format["AirT%1", _level];
			};
		};
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_m6a") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_m6a", _sid], 1, 30]];
			air_to_add pushBack [format["%1sab_m6av2", _sid], 1, 30];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "M6a [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_a5m", _sid], 1, 30]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "A5M [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_aichival", _sid], 1, 30]];
			air_to_add pushBack [format["%1sab_kate", _sid], 1, 30];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Aichval + Kate [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_ki61", _sid], 1, 40]];
			air_to_add pushBack [format["%1sab_zero", _sid], 1, 60];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET == _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Ki 61 + Zero [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_ki100", _sid], 1, 20]];
			
			units_air append air_to_add;
			if(CTI_FACTORY_LEVEL_PRESET >= _level) then {air_auto append air_to_add;};

			_v pushBack format["AirT%1", _level];
			_t pushBack "Ki100 [SAB]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_a6m") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
			
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			air_to_add = [[format["%1sab_fl_a6m", _sid], 1, 60]];
			
			units_air append air_to_add;
			air_auto append air_to_add;

			_v pushBack format["AirT%1", _level];
			_t pushBack "A6M [SAB fl]";
			_p pushBack air_to_add;
			_f pushBack CTI_AIR;
			_m pushBack 1000;
			_c pushBack "Air";
			_s pushBack [];
			kind_air pushBack format["AirT%1", _level];
		};
	};
};

if(count air_auto > 0) then {
	_v pushBack "Air";
	_t pushBack "Air (Auto)";
	_p pushBack air_auto;
	_f pushBack CTI_AIR;
	_m pushBack 1000;
	_c pushBack "Air";
	_s pushBack [];
	kind_air pushBack "Air";
};
if(count units_air > 0) then {
	_v pushBack "AirAll";
	_t pushBack "Air T0-Max";
	_p pushBack units_air;
	_f pushBack CTI_AIR;
	_m pushBack 1000;
	_c pushBack "Air";
	_s pushBack [];
	kind_air pushBack "AirAll";
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\squads\squad_small_mods.sqf", format["generated squads: [%1] ", count _v]] call CTI_CO_FNC_Log};

//--- Those are used by the commander to determine the kind of unit an AI team has
/*if(count kind_infantry > 0) then {
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
if(count kind_air > 0) then {
	if (isNil {missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]}) then {
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	} else {
		{
			kind_air pushBackUnique _x;
		} forEach (missionNamespace getVariable format ["CTI_SQUADS_%1_KIND_AIR", _side]);
		missionNamespace setVariable [format["CTI_SQUADS_%1_KIND_AIR", _side], kind_air];
	};
};

[_side, _v, _t, _p, _f, _m, _c, _s] call compile preprocessFileLineNumbers "Common\Config\Squads\Squads_Set.sqf";
