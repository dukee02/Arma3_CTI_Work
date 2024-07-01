private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_SOV_ID || CTI_WEST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_SOV_ID || CTI_EAST_TOWNS == CTI_SOV_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("O_NORTH_SOV_W_41_Medic") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_SOV_ID && (_isThisMain select 1) == CTI_NF_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_SOV_NF.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------SOV Army 1941 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_41_Medic", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_W_41_Engineer", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Crewman_SSGT", _sid];*/
		};
		case 2: {//Summer camo active
			//----------SOV Army 1941------------
			_c pushBack format["%1O_NORTH_SOV_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Medic", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_41_Engineer", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Crewman_SSGT", _sid];*/
		};
		default {
			//----------SOV Army 1939 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_39_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Medic", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_W_39_Engineer", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Crewman_Mortar50", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman_SGTMAJ", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Unequipped", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Crewman_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Crewman", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Crewman_SGT", _sid];*/
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------SOV Army 1941 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Autorifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Autorifleman_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_1stLt", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_AIR_SOV_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_AIR_SOV_41_W_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_41_Officer_1stLt", _sid];*/
		};
		case 2: {//Summer camo active
			//----------SOV Army 1941------------
			_c pushBack format["%1O_NORTH_SOV_41_Autorifleman_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Autorifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Submachinegunner_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_1stLt", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_1stLt", _sid];*/
		};
		default {
			//----------SOV Army 1939 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_39_Autorifleman", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Submachinegunner_38", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_1stLt", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer", _sid];
			_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_1stLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_2ndLt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_Lt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_1stLt", _sid];*/
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------SOV Army 1941 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_41_Machinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Machinegunner_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Sniper", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_41_Officer_Cpt", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_ART_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_41_Officer_Cpt", _sid];*/
		};
		case 2: {//Summer camo active
			//----------SOV Army 1941------------
			_c pushBack format["%1O_NORTH_SOV_41_Machinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Machinegunner_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Sniper", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_Officer_Cpt", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_ART_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_41_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_41_AIR_Officer_Cpt", _sid];*/
		};
		default {
			//----------SOV Army 1939 winter------------
			_c pushBack format["%1O_NORTH_SOV_W_39_Machinegunner", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Machinegunner_Assistant", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Sniper", _sid];
			_c pushBack format["%1O_NORTH_SOV_W_39_Officer_Cpt", _sid];
			//special
			/*_c pushBack format["%1O_NORTH_SOV_ART_W_39_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_T_W_39_Officer_Cpt", _sid];
			_c pushBack format["%1O_NORTH_SOV_AIR_W_39_Officer_Cpt", _sid];*/
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_SdKfz_7", _sid])) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_w", _sid];						
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7", _sid];					
	};
	_c pushBack format["%1LIB_SdKfz_7", _sid];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%NORTH_SOV_W_R75", _sid];
				
				_c pushBack format["%1NORTH_SOV_W_41_ZIS5", _sid];
				_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Empty", _sid];
				_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Open", _sid];
				_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Maxim_Quad", _sid];
				_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Medical", _sid];
				//_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Ammo", _sid];
				//_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Fuel", _sid];
				//_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Repair", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_SOV_41_ZIS5", _sid];
				_c pushBack format["%1NORTH_SOV_41_ZIS5_Empty", _sid];
				_c pushBack format["%1NORTH_SOV_41_ZIS5_Open", _sid];
				_c pushBack format["%1NORTH_SOV_41_ZIS5_Maxim_Quad", _sid];
				_c pushBack format["%1NORTH_SOV_41_ZIS5_Medical", _sid];
				//_c pushBack format["%1NORTH_SOV_41_ZIS5_Ammo", _sid];
				//_c pushBack format["%1NORTH_SOV_41_ZIS5_Fuel", _sid];
				//_c pushBack format["%1NORTH_SOV_41_ZIS5_Repair", _sid];
			};
			default {
				_c pushBack format["%NORTH_SOV_R75", _sid];
				
				_c pushBack format["%1NORTH_SOV_ZIS5", _sid];
				_c pushBack format["%1NORTH_SOV_ZIS5_Empty", _sid];
				_c pushBack format["%1NORTH_SOV_ZIS5_Open", _sid];
				_c pushBack format["%1NORTH_SOV_ZIS5_Maxim_Quad", _sid];
				_c pushBack format["%1NORTH_SOV_ZIS5_Medical", _sid];
				//_c pushBack format["%1NORTH_SOV_ZIS5_Ammo", _sid];
				//_c pushBack format["%1NORTH_SOV_ZIS5_Fuel", _sid];
				//_c pushBack format["%1NORTH_SOV_ZIS5_Repair", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_SOV_W_39_BA3", _sid];
				_c pushBack format["%1NORTH_SOV_W_39_BA6", _sid];
				_c pushBack format["%1NORTH_SOV_W_39_BA10", _sid];
			};
			case 2: {//Summer camo active				
				_c pushBack format["%1NORTH_SOV_41_BA3", _sid];
				_c pushBack format["%1NORTH_SOV_41_BA6", _sid];
				_c pushBack format["%1NORTH_SOV_41_BA10", _sid];
			};
			default {
				_c pushBack format["%1NORTH_SOV_41_BA3", _sid];
				_c pushBack format["%1NORTH_SOV_41_BA6", _sid];
				_c pushBack format["%1NORTH_SOV_41_BA10", _sid];
			};
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_39_T20", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T38", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33_OT", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T26_M31", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT5", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT5Com", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T20", _sid];
			_c pushBack format["%1NORTH_SOV_41_T38", _sid];
			_c pushBack format["%1NORTH_SOV_41_T26_M33_OT", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M31", _sid];	
			_c pushBack format["%1NORTH_SOV_41_BT5", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT5Com", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M33com", _sid];	
			_c pushBack format["%1NORTH_SOV_W_39_BT7_M35", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT7A", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT7", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_BT7Com_M35", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M33", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M33com", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7_M35", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7A", _sid];
			_c pushBack format["%1NORTH_SOV_41_BT7Com_M35", _sid];	
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active	
			_c pushBack format["%1NORTH_SOV_W_41_T26_M38", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T26_M39", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T26_M39_OT", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T26E_M33", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T26E_M39", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T28_com", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T28_M34", _sid];
			_c pushBack format["%1NORTH_SOV_W_39_T28_M34_com", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_41_T26_M38", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T26_M39", _sid];
			_c pushBack format["%1NORTH_SOV_41_T26_M39_OT", _sid];
			_c pushBack format["%1NORTH_SOV_41_T26E_M33", _sid];
			_c pushBack format["%1NORTH_SOV_41_T26E_M39", _sid];
			_c pushBack format["%1NORTH_SOV_41_T28", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28_com", _sid];	
			_c pushBack format["%1NORTH_SOV_41_T28_M34", _sid];
			_c pushBack format["%1NORTH_SOV_41_T28_M34_com", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_T60", _sid];
			_c pushBack format["%1NORTH_SOV_W_T70", _sid];
			_c pushBack format["%1NORTH_SOV_W_41_T28e", _sid];	
			_c pushBack format["%1NORTH_SOV_W_41_T34_76_1941", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_T60", _sid];
			_c pushBack format["%1NORTH_SOV_T70", _sid];
			_c pushBack format["%1NORTH_SOV_41_T28e", _sid];
			_c pushBack format["%1NORTH_SOV_41_T34_76_1941", _sid];	
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_KV1_1940", _sid];
			_c pushBack format["%1NORTH_SOV_W_KV1_1941", _sid];
			_c pushBack format["%1NORTH_SOV_W_KV1_1942", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_KV1_1940", _sid];
			_c pushBack format["%1NORTH_SOV_KV1_1941", _sid];
			_c pushBack format["%1NORTH_SOV_KV1_1942", _sid];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			_c pushBack format["%1NORTH_SOV_W_T34_76_1943", _sid];
			_c pushBack format["%1NORTH_SOV_W_T34_85", _sid];
			_c pushBack format["%1NORTH_SOV_W_T34_85_45", _sid];
			_c pushBack format["%1NORTH_SOV_W_KV1E_1940", _sid];
		};
		default {
			_c pushBack format["%1NORTH_SOV_T34_76_1943", _sid];
			_c pushBack format["%1NORTH_SOV_T34_85", _sid];
			_c pushBack format["%1NORTH_SOV_T34_85_45", _sid];	
			_c pushBack format["%1NORTH_SOV_T34_85_45_Berlin", _sid];
			_c pushBack format["%1NORTH_SOV_KV1E_1940", _sid];
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1LIB_Li2", _sid];
	_level = _level + 1;
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/
//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//Winter camo active
		_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Repair", _sid];				//repairtruck
	};
	case 2: {//Summer camo active
		_c pushBack format["%1NORTH_SOV_41_ZIS5_Repair", _sid];					//repairtruck
	};
	default {
		_c pushBack format["%1NORTH_SOV_ZIS5_Repair", _sid];					//repairtruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//Winter camo active
		_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Ammo", _sid];			//ammotruck
		_c pushBack format["%1NORTH_SOV_W_41_ZIS5_Fuel", _sid];			//fueltruck
	};
	case 2: {//Summer camo active
		_c pushBack format["%1NORTH_SOV_41_ZIS5_Ammo", _sid];			//ammotruck
		_c pushBack format["%1NORTH_SOV_41_ZIS5_Fuel", _sid];			//fueltruck
	};
	default {
		_c pushBack format["%1NORTH_SOV_ZIS5_Ammo", _sid];				//ammotruck
		_c pushBack format["%1NORTH_SOV_ZIS5_Fuel", _sid];				//fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				//----------SOV Army 1941 winter------------
				_c pushBack format["%1O_NORTH_SOV_W_41_Rifleman", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_41_Medic", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_41_Engineer", _sid];
			};
			case 2: {//Summer camo active
				//----------SOV Army 1941------------
				_c pushBack format["%1O_NORTH_SOV_41_Rifleman", _sid];
				_c pushBack format["%1O_NORTH_SOV_41_Medic", _sid];
				_c pushBack format["%1O_NORTH_SOV_41_Engineer", _sid];
			};
			default {
				//----------SOV Army 1939 winter------------
				_c pushBack format["%1O_NORTH_SOV_W_39_Rifleman", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_39_Medic", _sid];
				_c pushBack format["%1O_NORTH_SOV_W_39_Engineer", _sid];
			};
		};
	};
};
/*if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_c pushBack format["%1LIB_GazM1_SOV", _sid];	
	_c pushBack format["%1LIB_GazM1_SOV_camo_sand", _sid];
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1LIB_Zis5v_fuel_w", _sid];				//fueltruck
			_c pushBack format["%1LIB_Zis6_parm_w", _sid];					//repairtruck
		};
		_c pushBack format["%1LIB_Zis5v_Fuel", _sid];						//fueltruck
		_c pushBack format["%1LIB_Zis6_Parm", _sid];						//repairtruck
	};
	//if(CTI_ECONOMY_LEVEL_WHEELED >= 3) then {
		//_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
	//};
};*/
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_SOV_NF.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/