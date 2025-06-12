private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_US_ID || CTI_WEST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_US_ID || CTI_EAST_TOWNS == CTI_US_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("fow_s_us_crewman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_US_ID && (_isThisMain select 1) == CTI_FOW_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_US_FOW.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_US_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_us_crewman", _sid];
		_c pushBack format["%1fow_s_us_pilot", _sid];
		_c pushBack format["%1fow_s_us_m37_at_asst", _sid];
		_c pushBack format["%1fow_s_us_m37_engineer", _sid];
		_c pushBack format["%1fow_s_us_m37_medic", _sid];
		_c pushBack format["%1fow_s_us_m37_radio_operator", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman_gl", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman_ithaca37", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman_m1903", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman_m1912", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman_scout", _sid];
		_c pushBack format["%1fow_s_us_m37_smg_m3", _sid];
	};
	
	_c pushBack format["%1fow_s_us_coxswain", _sid];
	_c pushBack format["%1fow_s_us_pilot_green", _sid];
	_c pushBack format["%1fow_s_us_at_asst", _sid];
	_c pushBack format["%1fow_s_us_engineer", _sid];
	_c pushBack format["%1fow_s_us_medic", _sid];
	_c pushBack format["%1fow_s_us_radio_operator", _sid];
	_c pushBack format["%1fow_s_us_rifleman", _sid];
	_c pushBack format["%1fow_s_us_rifleman_gl", _sid];
	_c pushBack format["%1fow_s_us_rifleman_ithaca37", _sid];
	_c pushBack format["%1fow_s_us_rifleman_m1903", _sid];
	_c pushBack format["%1fow_s_us_rifleman_m1912", _sid];
	_c pushBack format["%1fow_s_us_rifleman_scout", _sid];
	_c pushBack format["%1fow_s_us_smg_m3", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_us_m37_bar_asst", _sid];
		_c pushBack format["%1fow_s_us_m37_bar_gunner", _sid];
		_c pushBack format["%1fow_s_us_m37_at", _sid];
		_c pushBack format["%1fow_s_us_m37_nco", _sid];
		_c pushBack format["%1fow_s_us_m37_officer", _sid];
		_c pushBack format["%1fow_s_us_m37_rifleman_m1_carbine", _sid];
		_c pushBack format["%1fow_s_us_m37_smg_m1a1", _sid];
	};
	
	_c pushBack format["%1fow_s_us_bar_asst", _sid];
	_c pushBack format["%1fow_s_us_bar_gunner", _sid];
	_c pushBack format["%1fow_s_us_at", _sid];
	_c pushBack format["%1fow_s_us_nco", _sid];
	_c pushBack format["%1fow_s_us_officer", _sid];
	_c pushBack format["%1fow_s_us_rifleman_m1_carbine", _sid];
	_c pushBack format["%1fow_s_us_smg_m1a1", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1fow_s_us_m37_m1919a6_asst", _sid];
		_c pushBack format["%1fow_s_us_m37_m1919a6_gunner", _sid];
		_c pushBack format["%1fow_s_us_m37_sniper_m1903a1", _sid];
		_c pushBack format["%1fow_s_us_m37_teamleader", _sid];
		_c pushBack format["%1fow_s_us_m37_teamleader_asst", _sid];
	};
	
	_c pushBack format["%1fow_s_us_m1919a6_asst", _sid];
	_c pushBack format["%1fow_s_us_m1919a6_gunner", _sid];
	_c pushBack format["%1fow_s_us_sniper_m1903a1", _sid];
	_c pushBack format["%1fow_s_us_teamleader", _sid];
	_c pushBack format["%1fow_s_us_teamleader_asst", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_US_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//	_c pushBack format["%1", _sid];
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//	_c pushBack format["%1", _sid];
	//};
	
	_c pushBack format["%1fow_v_willys_usa", _sid];	
	_c pushBack format["%1fow_v_willys_usmc", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {	
	_c pushBack format["%1fow_v_gmc_usa", _sid];	
	_c pushBack format["%1fow_v_gmc_open_usa", _sid];
	//_c pushBack format["%1fow_v_gmc_usmc", _sid];				//repair
	//_c pushBack format["%1fow_v_gmc_open_usmc", _sid];		//fuel
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];


//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	//_c pushBack format["%1fow_v_lvta2_usa_p", _sid];			//salvager
	_c pushBack format["%1fow_v_lvta2_usa", _sid];
	//_c pushBack format["%1fow_v_lvta2_usmc", _sid];			//ammo
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1fow_v_m5a1_usa", _sid];
	_c pushBack format["%1fow_v_m5a1_usmc", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	_c pushBack format["%1fow_v_m4a2_usa", _sid];
	_c pushBack format["%1fow_v_m4a2_usmc", _sid];
	
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1fow_va_f6f", _sid];
	_c pushBack format["%1fow_va_f6f_kick", _sid];
	_c pushBack format["%1fow_va_f6f_sweet", _sid];
	_c pushBack format["%1fow_va_f6f_c", _sid];
	_c pushBack format["%1fow_va_f6f_c_death", _sid];
	_c pushBack format["%1fow_va_f6f_c_kick", _sid];
	_c pushBack format["%1fow_va_f6f_c_sweet", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];


//***************************************************************************************************************************************
//														Reapir Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_c = [];
if(CTI_IFA_ADDON < 1 && CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1fow_v_gmc_usmc", _sid];						//repairtruck
	_c pushBack format["CTI_Salvager_%1", _side];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];


//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
if(CTI_IFA_ADDON < 1 && CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1fow_v_lvta2_usmc", _sid];						//ammotruck
	_c pushBack format["%1fow_v_gmc_open_usmc", _sid];						//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1fow_v_willys_usa", _sid];
		_c pushBack format["%1fow_v_willys_usmc", _sid];
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_IFA_ADDON < 1 && CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1fow_v_gmc_usmc", _sid];						//repairtruck
		_c pushBack format["%1fow_v_lvta2_usmc", _sid];						//ammotruck
		_c pushBack format["%1fow_v_gmc_open_usmc", _sid];					//fueltruck
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1fow_s_us_m37_medic", _sid];
			_c pushBack format["%1fow_s_us_m37_rifleman", _sid];
		};
		_c pushBack format["%1fow_s_us_medic", _sid];
		_c pushBack format["%1fow_s_us_rifleman", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1fow_usa_lcvp", _sid];
	_c pushBack format["%1fow_usmc_lcvp", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_US_FOW.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
