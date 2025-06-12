private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_FIN_ID || CTI_WEST_TOWNS == CTI_FIN_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_FIN_ID || CTI_EAST_TOWNS == CTI_FIN_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("I_NORTH_FIN_W_41_Unequipped") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_FIN_ID && (_isThisMain select 1) == CTI_NF_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_FIN_NF.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_level = 0;
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------FIN Army Winter 1941------------
			_c pushBack format["%1I_NORTH_FIN_W_41_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Civil_Guardsman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman_AT_L39_Asst", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Maxim", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Maxim_Assistant_Ammo", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman_Radio", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SSGT", _sid];*/
		};
		case 2: {//Summer camo active
			//----------FIN Army Summer 1941------------
			_c pushBack format["%1I_NORTH_FIN_S_41_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman_AT_L39_Asst", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_ART_S_41_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Maxim", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Maxim_Assistant_Ammo", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_Radio", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SSGT", _sid];*/
		};
		default {
			//----------FIN Army 1941------------
			_c pushBack format["%1I_NORTH_FIN_41_Unequipped", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Sentry", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Sentry_Night", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Medic", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT_Kasapanos", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT_L39", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Rifleman_AT_L39_Asst", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_ART_41_Unequip", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Radioman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_41_Rifleman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Rifleman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Maxim", _sid];
			//_c pushBack format["%1I_NORTH_FIN_41_Crewman_Maxim_Assistant_Ammo", _sid];		//-> Warning Message: Bad vehicle type fin_gasmaskbag
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Maxim_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_Radio", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar50", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar81", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar50_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Crewman_Mortar81_Assistant", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer_demo", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer_demo_improvised", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Pioneer_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_SGTMAJ", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_SgtMaj", _sid];*/
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------FIN Army Winter 1941------------
			_c pushBack format["%1I_NORTH_FIN_W_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Autorifleman_38", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_2NDLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Officer_2ndLt", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_2ndLt", _sid];*/
		};
		case 2: {//Summer camo active
			//----------FIN Army Summer 1941------------
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_2NDLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Officer_2ndLt", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_2ndLt", _sid];*/
		};
		default {
			//----------FIN Army 1941------------
			_c pushBack format["%1I_NORTH_FIN_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_2ndLt", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_2NDLT", _sid];*/
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			//----------FIN Army Winter 1941------------
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner_Asst_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Machinegunner_Asst", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_Officer_Cpt", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_CPT", _sid];*/
		};
		case 2: {//Summer camo active
			//----------FIN Army Summer 1941------------
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_CPT", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner_Asst_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Machinegunner_Asst", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Officer_Cpt", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_Cpt", _sid];*/
		};
		default {
			//----------FIN Army 1941------------
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner_Asst_DP", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Machinegunner_Asst", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Sniper", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_Cpt", _sid];
			//special
			/*_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPT", _sid];*/
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
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
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_R75", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_Tempo", _sid];
				
				_c pushBack format["%1NORTH_FIN_W_41_FordV8", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Open", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Medical", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Maxim_Quad", _sid];
				//_c pushBack format["%1NORTH_FIN_W_41_FordV8_Ammo", _sid];
				//_c pushBack format["%1NORTH_FIN_W_41_FordV8_Fuel", _sid];
				//_c pushBack format["%1NORTH_FIN_W_41_FordV8_Repair", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_R75", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_Tempo", _sid];
				
				_c pushBack format["%1NORTH_FIN_S_41_FordV8", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Open", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Medical", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Maxim_Quad", _sid];
				//_c pushBack format["%1NORTH_FIN_S_41_FordV8_Ammo", _sid];
				//_c pushBack format["%1NORTH_FIN_S_41_FordV8_Fuel", _sid];
				//_c pushBack format["%1NORTH_FIN_S_41_FordV8_Repair", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_R75", _sid];
				_c pushBack format["%1NORTH_FIN_Tempo", _sid];
				
				_c pushBack format["%1NORTH_FIN_FordV8", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8_Open", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8_Medical", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8_Maxim_Quad", _sid];
				//_c pushBack format["%1NORTH_FIN_FordV8_Ammo", _sid];
				//_c pushBack format["%1NORTH_FIN_FordV8_Fuel", _sid];
				//_c pushBack format["%1NORTH_FIN_FordV8_Repair", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_BA10", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_BA3", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_BA6", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_BA10", _sid];
				_c pushBack format["%1NORTH_FIN_41_BA3", _sid];
				_c pushBack format["%1NORTH_FIN_41_BA6", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_BA10", _sid];
				_c pushBack format["%1NORTH_FIN_BA3", _sid];
				_c pushBack format["%1NORTH_FIN_BA6", _sid];
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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T20", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T38", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T26_M31", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_BT5", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33_OT", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T20", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T38", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_BT5", _sid];
				_c pushBack format["%1NORTH_FIN_W_BT42", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33_OT", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T20", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T38", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT5", _sid];
				_c pushBack format["%1NORTH_FIN_BT42", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M33_OT", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M33_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_T20", _sid];
				_c pushBack format["%1NORTH_FIN_T38", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT5", _sid];
				_c pushBack format["%1NORTH_FIN_BT42", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M33", _sid];
		_c pushBack format["%1NORTH_FIN_Vickers6t", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_BT7_M35", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_BT7", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26E", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_BT7_M35", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_BT7", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26E", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT7_M35", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT7", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M33", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26E", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT7_M35", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT7", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M39_OT", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T26_M38", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T26_M39", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M39_OT", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M39_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T28", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M39", _sid];
				_c pushBack format["%1NORTH_FIN_W_STUG_3_G", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39_OT", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T28", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39", _sid];
				_c pushBack format["%1NORTH_FIN_S_STUG_3_G", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39_OT", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M39_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_41_T28", _sid];
				_c pushBack format["%1NORTH_FIN_T26_M39", _sid];
				_c pushBack format["%1NORTH_FIN_STUG_3_G", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T28", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T28e", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T34_76_1941", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T28e", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T34_76_1941", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T28e", _sid];
				_c pushBack format["%1NORTH_FIN_T34_76_1941", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_KV1_1942", _sid];
				_c pushBack format["%1NORTH_FIN_W_STU40G", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_KV1_1942", _sid];
				_c pushBack format["%1NORTH_FIN_S_STU40G", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_KV1_1942", _sid];
				_c pushBack format["%1NORTH_FIN_STU40G", _sid];
			};
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_T34_76_1943", _sid];
				_c pushBack format["%1NORTH_FIN_W_T34_85", _sid];
				_c pushBack format["%1NORTH_FIN_W_KV1E_1940", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_T34_76_1943", _sid];
				_c pushBack format["%1NORTH_FIN_S_T34_85", _sid];
				_c pushBack format["%1NORTH_FIN_S_KV1E_1940", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_T34_76_1943", _sid];
				_c pushBack format["%1NORTH_FIN_T34_85", _sid];
				_c pushBack format["%1NORTH_FIN_KV1E_1940", _sid];
			};
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/
//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];
switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//Winter camo active
		_c pushBack format["%1NORTH_FIN_W_41_FordV8_Repair", _sid];				//repairtruck
	};
	case 2: {//Summer camo active
		_c pushBack format["%1NORTH_FIN_S_41_FordV8_Repair", _sid];				//repairtruck
	};
	default {
		_c pushBack format["%1NORTH_FIN_FordV8_Repair", _sid];					//repairtruck
	};
};

_c pushBack format["CTI_Salvager_%1", _side];

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];
switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//Winter camo active
		_c pushBack format["%1NORTH_FIN_W_41_FordV8_Ammo", _sid];			//ammotruck
		_c pushBack format["%1NORTH_FIN_W_41_FordV8_Fuel", _sid];			//fueltruck
	};
	case 2: {//Summer camo active
		_c pushBack format["%1NORTH_FIN_S_41_FordV8_Ammo", _sid];			//ammotruck
		_c pushBack format["%1NORTH_FIN_S_41_FordV8_Fuel", _sid];			//fueltruck
	};
	default {
		_c pushBack format["%1NORTH_FIN_FordV8_Ammo", _sid];				//ammotruck
		_c pushBack format["%1NORTH_FIN_FordV8_Fuel", _sid];				//fueltruck
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];

//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_R75", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_Tempo", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Open", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_R75", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_Tempo", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Open", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_R75", _sid];
				_c pushBack format["%1NORTH_FIN_Tempo", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8_Open", _sid];
			};
		};
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Ammo", _sid];			//ammotruck
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Fuel", _sid];			//fueltruck
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Ammo", _sid];			//ammotruck
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Fuel", _sid];			//fueltruck
			};
			default {
				_c pushBack format["%1NORTH_FIN_FordV8_Ammo", _sid];				//ammotruck
				_c pushBack format["%1NORTH_FIN_FordV8_Fuel", _sid];				//fueltruck
			};
		};
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				//----------FIN Army Winter 1941------------
				_c pushBack format["%1I_NORTH_FIN_W_41_Rifleman", _sid];
				_c pushBack format["%1I_NORTH_FIN_W_41_Medic", _sid];
			};
			case 2: {//Summer camo active
				//----------FIN Army Summer 1941------------
				_c pushBack format["%1I_NORTH_FIN_S_41_Rifleman", _sid];
				_c pushBack format["%1I_NORTH_FIN_S_41_Medic", _sid];
			};
			default {
				//----------FIN Army Winter 1939------------
				_c pushBack format["%1I_NORTH_FIN_W_39_Rifleman", _sid];
				_c pushBack format["%1I_NORTH_FIN_W_39_Medic", _sid];
			};
		};
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_FIN_NF.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/