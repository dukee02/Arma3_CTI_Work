private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_sid_base = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid_base = "VIOC_B_";_tag = "WEST_";
	};
	case east: {
		_sid_base = "VIOC_O_";_tag = "EAST_";
	};
	case resistance: {
		_sid_base = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid_base = "";};
};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};


//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
/*_c = [];
//Level x
if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1", _sid];
	};
	
	_c pushBack format["%1", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];
*/

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_DaimlerMk2")) then {
		if !(("FA_DaimlerMk2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_DaimlerMk2", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_T17E1", _sid];
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
			_c pushBack format["%1FA_BA64", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_BA10M", _sid];
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
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_BA10M_Captured", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_Sdkfz231", _sid];
			_c pushBack format["%1FA_Sdkfz234_4", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
			_c pushBack format["%1FA_Sdkfz234", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
//Level 0

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_ValentineMk3")) then {
		if !(("FA_ValentineMk3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			_c pushBack format["%1FA_ValentineMk3", _sid];
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
			_c pushBack format["%1FA_M26", _sid];
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "SOV_BT_BT7A")) then {
		if !(("SOV_BT_BT7A") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_BT_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			/*if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
				_c pushBack format["%1", _sid];
			};
			if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
				_c pushBack format["%1", _sid];
			};*/
			_c pushBack format["%1SOV_BT_BT7A", _sid];
			_c pushBack format["%1SOV_BT_BT7_M1937", _sid];
			_c pushBack format["%1SOV_BT_BT7TU_M1937", _sid];
		};
	};
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26")) then {
		if !(("FA_T26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			_c pushBack format["%1FA_T26", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			_c pushBack format["%1FA_ValentineMk3_SOV", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			_c pushBack format["%1FA_KV1", _sid];
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
			_c pushBack format["%1FA_T26_Captured", _sid];
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
			_c pushBack format["%1FA_Pz38t", _sid];
			_c pushBack format["%1FA_Panzer2", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_gladiator") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_gladiator", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_ca12bo", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_mb5", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_meteor", _sid];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_hurricane") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_hurricane", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_hurricane_trop", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_hurricane_2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_dh98", _sid];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_halifax") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_halifax", _sid];
			};
		};
	};

};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_c47") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_c47", _sid];
			_c pushBack format["%1sab_p26", _sid];
			_c pushBack format["%1sab_ryanpt", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_texan", _sid];
			_c pushBack format["%1sab_dauntless", _sid];
			_c pushBack format["%1sab_avenger", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_p38", _sid];
			_c pushBack format["%1sab_corsair", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_mustang", _sid];
			_c pushBack format["%1sab_p51b", _sid];
			_c pushBack format["%1sab_a26", _sid];
			_c pushBack format["%1sab_b25", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_tigercat", _sid];
			_c pushBack format["%1sab_f6f", _sid];
			_c pushBack format["%1sab_b24", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_p61", _sid];
			_c pushBack format["%1sab_b17", _sid];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_f4f") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_f4f", _sid];
			_c pushBack format["%1sab_fl_sbd", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_f4u", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_p51d", _sid];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_tbf") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_tbf", _sid];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_p40", _sid];
				_c pushBack format["%1sab_sw_p38", _sid];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_a26", _sid];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_b17", _sid];
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
			_c pushBack format["%1sab_i16", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_la5", _sid];
			_c pushBack format["%1sab_la5_2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_p39", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_tusb2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_il2", _sid];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_yak3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_yak3", _sid];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_i16") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_i16", _sid];
			};
		
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_il2", _sid];
				_c pushBack format["%1sab_sw_il2_2", _sid];
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
			_c pushBack format["%1sab_avia", _sid];
			_c pushBack format["%1sab_bu131", _sid];
			_c pushBack format["%1sab_avia_2", _sid];
			_c pushBack format["%1sab_w34", _sid];
			_c pushBack format["%1sab_w34f", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_bf109", _sid];
			_c pushBack format["%1sab_ju87", _sid];
			_c pushBack format["%1sab_bf110", _sid];
			_c pushBack format["%1sab_bf110_2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_ju88", _sid];
			_c pushBack format["%1sab_ju88_2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fw190", _sid];
			_c pushBack format["%1sab_fw190_2", _sid];
			_c pushBack format["%1sab_he111", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_bv141", _sid];
			_c pushBack format["%1sab_do335", _sid];
			_c pushBack format["%1sab_ta152c", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_he162", _sid];
			_c pushBack format["%1sab_hix", _sid];
			_c pushBack format["%1sab_me262", _sid];
			_c pushBack format["%1sab_me262_2", _sid];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_bf109e") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_bf109e", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_bf109f", _sid];
			_c pushBack format["%1sab_fl_ju88a", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_bf109g", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_bf109k", _sid];
			_c pushBack format["%1sab_fl_fw190a", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_he162", _sid];
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_bf110") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_bf110", _sid];
				_c pushBack format["%1sab_sw_bf110_2", _sid];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_ju87", _sid];
				_c pushBack format["%1sab_sw_ju87_2", _sid];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_do335", _sid];
				_c pushBack format["%1sab_sw_he177", _sid];
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
				_c pushBack format["%1sab_sw_ar234", _sid];
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
			_c pushBack format["%1sab_m6a", _sid];
			_c pushBack format["%1sab_m6av2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_a5m", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_aichival", _sid];
			_c pushBack format["%1sab_kate", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_ki61", _sid];
			_c pushBack format["%1sab_zero", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_ki100", _sid];
		};
		
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_a6m") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
			
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
			_c pushBack format["%1sab_fl_a6m", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
/*_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
	};
	_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];
*/
//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*_c = [];
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
		_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
	};
	_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
	_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];
*/

//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
/*_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_GER_Recruit_w", _sid];
			_c pushBack format["%1LIB_GER_Medic_w", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_medic", _sid];
			_c pushBack format["%1LIB_DAK_Sentry", _sid];
		};
		_c pushBack format["%1LIB_GER_rifleman", _sid];
		_c pushBack format["%1LIB_GER_medic", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_Kfz1_w", _sid];
		_c pushBack format["%1LIB_Kfz1_Hood_w", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_Kfz1", _sid];
		_c pushBack format["%1LIB_DAK_Kfz1_hood", _sid];
	};
	_c pushBack format["%1LIB_Kfz1", _sid];
	_c pushBack format["%1LIB_Kfz1_Hood", _sid];
	//_c pushBack format["%1LIB_Kfz1_camo", _sid];
	//_c pushBack format["%1LIB_Kfz1_Hood_camo", _sid];
	//_c pushBack format["%1LIB_Kfz1_Hood_sernyt", _sid];
	//_c pushBack format["%1LIB_Kfz1_sernyt", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_OpelBlitz_Parm_w", _sid];				//repairtruck
			_c pushBack format["%1LIB_OpelBlitz_Ammo_w", _sid];				//ammotruck
			_c pushBack format["%1LIB_OpelBlitz_Fuel_w", _sid];				//fueltruck
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1LIB_DAK_OpelBlitz_Parm", _sid];				//repairtruck
			_c pushBack format["%1LIB_DAK_OpelBlitz_Ammo", _sid];				//ammotruck
			_c pushBack format["%1LIB_DAK_OpelBlitz_Fuel", _sid];				//fueltruck
		};
		_c pushBack format["%1LIB_OpelBlitz_Parm", _sid];						//repairtruck
		_c pushBack format["%1LIB_SdKfz_7_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_OpelBlitz_Fuel", _sid];						//fueltruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];
*/
//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];


if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_liberty_rn") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_liberty_rn", _sid];
			_c pushBack format["%1sab_boat_torpedo_rn", _sid];
			_c pushBack format["%1sab_boat_subchaser_rn", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_destroyer_rn", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_cruiser_rn", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_battleship_rn", _sid];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_foxhound") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_foxhound", _sid];
			_c pushBack format["%1sab_nl_liberty", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_dido", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_arkroyal", _sid];
			_c pushBack format["%1sab_nl_hood", _sid];
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_freighter", _sid];
			_c pushBack format["%1sab_boat_liberty", _sid];
			_c pushBack format["%1sab_boat_rubberboat", _sid];
			_c pushBack format["%1sab_boat_torpedo", _sid];
			_c pushBack format["%1sab_boat_sreighter", _sid];
			_c pushBack format["%1sab_boat_subchaser", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_destroyer", _sid];
			_c pushBack format["%1sab_boat_u7_o", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_cruiser", _sid];
			_c pushBack format["%1sab_item_carrier_2", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_battleship", _sid];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_ptboat") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_ptboat", _sid];
			_c pushBack format["%1sab_nl_liberty", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_sims", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_cleveland", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_enterprise", _sid];
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter_i") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_freighter_i", _sid];
			_c pushBack format["%1sab_boat_liberty_i", _sid];
			_c pushBack format["%1sab_boat_rubberboat3", _sid];
			_c pushBack format["%1sab_boat_torpedo_i", _sid];
			_c pushBack format["%1sab_boat_sreighter_i", _sid];
			_c pushBack format["%1sab_boat_subchaser_i", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_destroyer_i", _sid];
			_c pushBack format["%1sab_boat_u7_i", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_cruiser_i", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_battleship_i", _sid];
		};
	};
	/*if(CTI_SABNL_ADDON > 0) then {
		if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
			_c pushBack format["%1", _sid];
		};
	};*/
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter_o") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_freighter_o", _sid];
			_c pushBack format["%1sab_boat_torpedo_o", _sid];
			_c pushBack format["%1sab_boat_s38_o", _sid];
			_c pushBack format["%1sab_boat_sreighter_o", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_destroyer_o", _sid];
			_c pushBack format["%1sab_boat_u7", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_cruiser_o", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_battleship_o", _sid];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_t22") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_t22", _sid];
			_c pushBack format["%1sab_nl_vincenzo", _sid];
			_c pushBack format["%1sab_nl_liberty", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_u557", _sid];
			_c pushBack format["%1sab_nl_zara", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_scharnhorst", _sid];
		};
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter_o_x") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_JPN_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_freighter_o_x", _sid];
			_c pushBack format["%1sab_boat_torpedo_o_x", _sid];
			_c pushBack format["%1sab_boat_rubberboat2", _sid];
			_c pushBack format["%1sab_boat_subchaser_o_x", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_destroyer_o_x", _sid];
			_c pushBack format["%1sab_boat_i400", _sid];
			_c pushBack format["%1sab_boat_u7_o_x", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_boat_cruiser_o_x", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_carrier_akagi", _sid];
			_c pushBack format["%1sab_item_carrier", _sid];
			_c pushBack format["%1sab_boat_battleship_o_x", _sid];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_mutsuki") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_JPN_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};		
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_mutsuki", _sid];
			_c pushBack format["%1sab_nl_liberty", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_fubuki", _sid];
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
			_c pushBack format["%1sab_nl_akagi", _sid];
		};
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_small_mods.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
