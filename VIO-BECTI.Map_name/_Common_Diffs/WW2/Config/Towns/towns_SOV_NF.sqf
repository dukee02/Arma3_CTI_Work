_side = _this;
_sid = "";
_tag = "";
_level = -1;

if(_side == west) then {
	_sid = "VIOC_B_";
	_tag = "WEST_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_tag = "EAST_";
	} 
	else {
		_sid = "VIOC_I_";
		_tag = "GUER_";
	};
};
if !(("O_NORTH_SOV_W_41_Rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles if nation on IND side
if(_tag == "GUER_") then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1O_NORTH_SOV_W_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1O_NORTH_SOV_T_W_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1O_NORTH_SOV_AIR_W_41_Officer_Cpt", _sid]];
		};
		case 2: {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1O_NORTH_SOV_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1O_NORTH_SOV_T_41_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1O_NORTH_SOV_41_AIR_Officer_Cpt", _sid]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1O_NORTH_SOV_T_W_39_Crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1O_NORTH_SOV_AIR_W_41_Officer_Cpt", _sid]];
		};
	};
};

//***************************************************************************************************************************************
//														Town infantry setup																*
//***************************************************************************************************************************************
INFANTRY = [];
INFANTRY_MG = [];
INFANTRY_AT = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			INFANTRY = [[format["%1O_NORTH_SOV_W_41_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_W_41_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid],1],[format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid],1],[format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_W_41_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Autorifleman", _sid],1]];
		};
		case 2: {
			INFANTRY = [[format["%1O_NORTH_SOV_41_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_41_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Submachinegunner", _sid],1],[format["%1O_NORTH_SOV_41_Submachinegunner", _sid],1],[format["%1O_NORTH_SOV_41_Submachinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_41_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_41_Autorifleman", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1O_NORTH_SOV_W_39_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_W_39_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid],1],[format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid],1],[format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_W_39_Officer_2ndLt", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Autorifleman", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			INFANTRY = [[format["%1O_NORTH_SOV_W_41_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Sniper", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_W_41_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Machinegunner_Assistant", _sid],1],[format["%1O_NORTH_SOV_W_41_Machinegunner", _sid],1],[format["%1O_NORTH_SOV_W_41_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_W_41_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Submachinegunner", _sid],1]];
		};
		case 2: {
			INFANTRY = [[format["%1O_NORTH_SOV_41_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_41_Sniper", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_41_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Machinegunner_Assistant", _sid],1],[format["%1O_NORTH_SOV_41_Machinegunner", _sid],1],[format["%1O_NORTH_SOV_41_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_41_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_41_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_41_Submachinegunner", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1O_NORTH_SOV_W_39_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Sniper", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_W_39_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Machinegunner_Assistant", _sid],1],[format["%1O_NORTH_SOV_W_39_Machinegunner", _sid],1],[format["%1O_NORTH_SOV_W_39_Machinegunner", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_W_39_Officer_1stLt", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Autorifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Submachinegunner", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 1: {
			INFANTRY = [[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_CPL", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_CPL", _sid],1],[format["%1O_NORTH_SOV_ART_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_ART_W_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_ART_W_41_Rifleman", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_W_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_41_Medic", _sid],1],[format["%1O_NORTH_SOV_W_41_Rifleman_CPL", _sid],1],[format["%1O_NORTH_SOV_W_41_Crewman_Mortar50_Assistant", _sid],1],[format["%1O_NORTH_SOV_W_41_Crewman_Mortar50", _sid],1],[format["%1O_NORTH_SOV_W_41_Crewman_Mortar50", _sid],1]];
		};
		case 2: {
			INFANTRY = [[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_CPL", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_CPL", _sid],1],[format["%1O_NORTH_SOV_ART_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_ART_41_Rifleman", _sid],1],[format["%1O_NORTH_SOV_ART_41_Rifleman", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_41_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_41_Medic", _sid],1],[format["%1O_NORTH_SOV_41_Rifleman_CPL", _sid],1],[format["%1O_NORTH_SOV_41_Crewman_Mortar50_Assistant", _sid],1],[format["%1O_NORTH_SOV_41_Crewman_Mortar50", _sid],1],[format["%1O_NORTH_SOV_41_Crewman_Mortar50", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGT", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGT", _sid],1],[format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid],1],[format["%1O_NORTH_SOV_ART_W_39_Rifleman", _sid],1]];
			INFANTRY_AT = [[format["%1O_NORTH_SOV_W_39_Rifleman_SGTMAJ", _sid],1],[format["%1O_NORTH_SOV_W_39_Medic", _sid],1],[format["%1O_NORTH_SOV_W_39_Rifleman_SGT", _sid],1],[format["%1O_NORTH_SOV_W_39_Crewman_Mortar50_Assistant", _sid],1],[format["%1O_NORTH_SOV_W_39_Crewman_Mortar50", _sid],1],[format["%1O_NORTH_SOV_W_39_Crewman_Mortar50", _sid],1]];
		};
	};
};

if (isNil {missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], INFANTRY_AT];
} else {
	missionNamespace setVariable [format["%1INFANTRY_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]) + INFANTRY];
	missionNamespace setVariable [format["%1INFANTRY_SQ_MG", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]) + INFANTRY_MG];
	missionNamespace setVariable [format["%1INFANTRY_SQ_AT", _tag], (missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]) + INFANTRY_AT];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				WHEELED_LIGHT = [[format["%NORTH_SOV_W_R75", _sid],1]];
				WHEELED_HEAVY = [[format["%NORTH_SOV_W_R75", _sid],1]];
			};
			default {
				WHEELED_LIGHT = [[format["%NORTH_SOV_R75", _sid],1]];
				WHEELED_HEAVY = [[format["%NORTH_SOV_R75", _sid],1]];
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
				WHEELED_LIGHT = [[format["%1NORTH_SOV_W_39_BA3", _sid],1],[format["%1NORTH_SOV_W_39_BA6", _sid],1]];
				WHEELED_HEAVY = [[format["%1NORTH_SOV_W_39_BA10", _sid],1]];
			};
			default {
				WHEELED_LIGHT = [[format["%1NORTH_SOV_41_BA3", _sid],1],[format["%1NORTH_SOV_41_BA6", _sid],1]];
				WHEELED_HEAVY = [[format["%1NORTH_SOV_41_BA10", _sid],1]];
			};
		};
	};
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			TRACKED_LIGHT = [[format["%1NORTH_SOV_W_41_T26_M33_OT", _sid],1],[format["%1NORTH_SOV_W_39_T20", _sid],1],[format["%1NORTH_SOV_W_39_T38", _sid],1]];
			TRACKED_MEDIUM = [[format["%1NORTH_SOV_W_39_BT5", _sid],1],[format["%1NORTH_SOV_W_39_BT5Com", _sid],1]];
			TRACKED_HEAVY = [[format["%1NORTH_SOV_W_41_T26_M31", _sid],1]];
		};
		default {
			TRACKED_LIGHT = [[format["%1NORTH_SOV_41_T26_M33_OT", _sid],1],[format["%1NORTH_SOV_41_T20", _sid],1],[format["%1NORTH_SOV_41_T38", _sid],1]];
			TRACKED_MEDIUM = [[format["%1NORTH_SOV_41_BT5", _sid],1],[format["%1NORTH_SOV_41_BT5Com", _sid],1]];
			TRACKED_HEAVY = [[format["%1NORTH_SOV_41_T26_M31", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			TRACKED_LIGHT = [[format["%1NORTH_SOV_W_41_T26_M33_OT", _sid],1],[format["%1NORTH_SOV_W_39_T20", _sid],1],[format["%1NORTH_SOV_W_39_T38", _sid],1]];
			TRACKED_MEDIUM = [[format["%1NORTH_SOV_W_39_BT5", _sid],1],[format["%1NORTH_SOV_W_39_BT5Com", _sid],1],[format["%1NORTH_SOV_W_39_BT7_M35", _sid],1],[format["%1NORTH_SOV_W_39_BT7A", _sid],1],[format["%1NORTH_SOV_W_39_BT7", _sid],1],[format["%1NORTH_SOV_W_39_BT7Com_M35", _sid],1]];
			TRACKED_HEAVY = [[format["%1NORTH_SOV_W_41_T26_M31", _sid],1],[format["%1NORTH_SOV_W_41_T26_M33", _sid],1],[format["%1NORTH_SOV_W_41_T26_M33com", _sid],1]];
		};
		default {
			TRACKED_LIGHT = [[format["%1NORTH_SOV_41_T26_M33_OT", _sid],1],[format["%1NORTH_SOV_41_T20", _sid],1],[format["%1NORTH_SOV_41_T38", _sid],1]];
			TRACKED_MEDIUM = [[format["%1NORTH_SOV_41_BT5", _sid],1],[format["%1NORTH_SOV_41_BT5Com", _sid],1],[format["%1NORTH_SOV_41_BT7_M35", _sid],1],[format["%1NORTH_SOV_41_BT7", _sid],1],[format["%1NORTH_SOV_41_BT7A", _sid],1],[format["%1NORTH_SOV_41_BT7Com_M35", _sid],1]];
			TRACKED_HEAVY = [[format["%1NORTH_SOV_41_T26_M31", _sid],1],[format["%1NORTH_SOV_41_T26_M33", _sid],1],[format["%1NORTH_SOV_41_T26_M33com", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			TRACKED_LIGHT append TRACKED_MEDIUM;
			TRACKED_LIGHT append [[format["%1NORTH_SOV_W_39_T26_M39_OT", _sid],1]];
			TRACKED_MEDIUM = TRACKED_HEAVY;
			TRACKED_MEDIUM append [[format["%1NORTH_SOV_W_41_T26_M38", _sid],1],[format["%1NORTH_SOV_W_39_T26_M39", _sid],1]];
			TRACKED_HEAVY = [[format["%1NORTH_SOV_W_41_T28", _sid],1],[format["%1NORTH_SOV_W_41_T28_com", _sid],1],[format["%1NORTH_SOV_W_39_T28_M34", _sid],1],[format["%1NORTH_SOV_W_39_T28_M34_com", _sid],1]];
		};
		default {
			TRACKED_LIGHT append TRACKED_MEDIUM;
			TRACKED_LIGHT append [[format["%1NORTH_SOV_41_T26_M39_OT", _sid],1]];
			TRACKED_MEDIUM = TRACKED_HEAVY;
			TRACKED_MEDIUM append [[format["%1NORTH_SOV_41_T26_M38", _sid],1],[format["%1NORTH_SOV_41_T26_M39", _sid],1]];
			TRACKED_HEAVY = [[format["%1NORTH_SOV_41_T28", _sid],1],[format["%1NORTH_SOV_41_T28_com", _sid],1],[format["%1NORTH_SOV_41_T28_M34", _sid],1],[format["%1NORTH_SOV_41_T28_M34_com", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			TRACKED_LIGHT append [[format["%1NORTH_SOV_W_T60", _sid],1],[format["%1NORTH_SOV_W_T70", _sid],1]];
			TRACKED_HEAVY append [[format["%1NORTH_SOV_W_41_T28e", _sid],1],[format["%1NORTH_SOV_W_41_T34_76_1941", _sid],1]];
		};
		default {
			TRACKED_LIGHT append [[format["%1NORTH_SOV_T60", _sid],1],[format["%1NORTH_SOV_T70", _sid],1]];
			TRACKED_HEAVY append [[format["%1NORTH_SOV_41_T28e", _sid],1],[format["%1NORTH_SOV_41_T34_76_1941", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			TRACKED_MEDIUM = TRACKED_HEAVY;
			TRACKED_HEAVY = [[format["%1NORTH_SOV_W_KV1_1940", _sid],1],[format["%1NORTH_SOV_W_KV1_1942", _sid],1]];
		};
		default {
			TRACKED_MEDIUM = TRACKED_HEAVY;
			TRACKED_HEAVY = [[format["%1NORTH_SOV_KV1_1940", _sid],1],[format["%1NORTH_SOV_KV1_1942", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			TRACKED_MEDIUM append [[format["%1NORTH_SOV_W_T34_76_1943", _sid],1]];
			TRACKED_MEDIUM append [[format["%1NORTH_SOV_W_T34_85", _sid],1]];
			TRACKED_HEAVY append [[format["%1NORTH_SOV_W_KV1E_1940", _sid],1]];
		};
		default {
			TRACKED_MEDIUM append [[format["%1NORTH_SOV_T34_76_1943", _sid],1]];
			TRACKED_MEDIUM append [[format["%1NORTH_SOV_T34_85", _sid],1]];
			TRACKED_HEAVY append [[format["%1NORTH_SOV_KV1E_1940", _sid],1]];
		};
	};
};


if (isNil {missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], TRACKED_HEAVY];
} else {
	missionNamespace setVariable [format["%1TRACKED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]) + TRACKED_LIGHT];
	missionNamespace setVariable [format["%1TRACKED_SQ_MEDIUM", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]) + TRACKED_MEDIUM];
	missionNamespace setVariable [format["%1TRACKED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]) + TRACKED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];
/*_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1", _sid],1]];
	AIR_BOMBER = [[format["%1", _sid],1]];
};
*/

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
/*ANTI_AIR = [];

ANTI_AIR = INFANTRY;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	ANTI_AIR = [[format["%1LIB_Zis5v_61K", _sid],1],[format["%1LIB_Zis5v_61K", _sid],1]];
};
if(CTI_ECONOMY_LEVEL_WHEELED >= 4) then {
	if(CTI_IFA3_NEW > 0) then {
		ANTI_AIR = [[format["%1LIB_Zis5v_61K", _sid],1],[format["%1LIB_SOV_M16_Halftrack", _sid],1]];
	};
};

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_SOV_NF.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
*/
