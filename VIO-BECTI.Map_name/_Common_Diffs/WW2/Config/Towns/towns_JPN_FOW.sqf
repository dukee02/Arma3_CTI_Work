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
if !(("fow_s_ija_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad preparation - sid: <%1> tag: <%2> ", _sid, _tag]] call CTI_CO_FNC_Log;
};
(_tag) call compile preprocessFileLineNumbers "Common\Config\Towns\towns_SetTownFlag.sqf";

//needed for townvehicles if nation on IND side
if(_tag == "GUER_") then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1fow_s_ija_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1fow_s_ija_crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1fow_s_ija_pilot", _sid]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1fow_s_ija_f_rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1fow_s_ija_crewman", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1fow_s_ija_pilot", _sid]];
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
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_JPN_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
		};
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	switch (CTI_CAMO_ACTIVATION) do {
		case 2: {		//Desert camo active
			INFANTRY = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_medic", _sid],1],[format["%1fow_s_ija_rifleman", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1],[format["%1fow_s_ija_rifleman_at", _sid],1]];
		};
		default {
			INFANTRY = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1]];
			INFANTRY_MG = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
			INFANTRY_AT = [[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_medic", _sid],1],[format["%1fow_s_ija_snlf_rifleman", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1],[format["%1fow_s_ija_snlf_rifleman_at", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_LIGHT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_MG", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_MG", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1INFANTRY_SQ_AT", _tag], missionNamespace getVariable format["%1INFANTRY_SQ_AT", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Wheeled setup																*
//***************************************************************************************************************************************
WHEELED_LIGHT = [];
WHEELED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_JPN_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
	WHEELED_LIGHT = [[format["%1fow_v_type97_truck_open_ija", _sid],1]];
	WHEELED_HEAVY = [[format["%1fow_v_type97_truck_ija", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]}) then {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], WHEELED_HEAVY];
} else {
	missionNamespace setVariable [format["%1WHEELED_SQ_LIGHT", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]) + WHEELED_LIGHT];
	missionNamespace setVariable [format["%1WHEELED_SQ_HEAVY", _tag], (missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]) + WHEELED_HEAVY];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1WHEELED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1WHEELED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1WHEELED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Tracked setup																*
//***************************************************************************************************************************************
TRACKED_LIGHT = [];
TRACKED_MEDIUM = [];
TRACKED_HEAVY = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_JPN_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	TRACKED_LIGHT = [[format["%1fow_ija_type95_HaGo_1_ija", _sid],1]];
	TRACKED_MEDIUM = [[format["%1fow_ija_type95_HaGo_2_ija", _sid],1]];
	TRACKED_HEAVY = [[format["%1fow_ija_type95_HaGo_3_ija", _sid],1]];
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
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_LIGHT", _tag], missionNamespace getVariable format["%1TRACKED_SQ_LIGHT", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_MEDIUM", _tag], missionNamespace getVariable format["%1TRACKED_SQ_MEDIUM", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1TRACKED_SQ_HEAVY", _tag], missionNamespace getVariable format["%1TRACKED_SQ_HEAVY", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Air setup																	*
//***************************************************************************************************************************************
AIR_FIGHTER = [];
AIR_BOMBER = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_FOW_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	AIR_FIGHTER = [[format["%1fow_va_a6m_green", _sid],1]];
	AIR_BOMBER = [[format["%1fow_va_a6m_white", _sid],1]];
};

if (isNil {missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]}) then {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], AIR_BOMBER];
} else {
	missionNamespace setVariable [format["%1AIR_SQ_FIGHTER", _tag], (missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]) + AIR_FIGHTER];
	missionNamespace setVariable [format["%1AIR_SQ_BOMBER", _tag], (missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]) + AIR_BOMBER];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_FIGHTER", _tag], missionNamespace getVariable format["%1AIR_SQ_FIGHTER", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1AIR_SQ_BOMBER", _tag], missionNamespace getVariable format["%1AIR_SQ_BOMBER", _tag]]] call CTI_CO_FNC_Log;
};

//***************************************************************************************************************************************
//														Town Anti-Air setup																*
//***************************************************************************************************************************************
ANTI_AIR = [];

if (isNil {missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]}) then {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], ANTI_AIR];
} else {
	missionNamespace setVariable [format["%1SQ_ANTI_AIR", _tag], (missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]) + ANTI_AIR];
};
if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\Towns_JPN_FOW.sqf", format["Town Squad <%1> with units <%2> ", format["%1SQ_ANTI_AIR", _tag], missionNamespace getVariable format["%1SQ_ANTI_AIR", _tag]]] call CTI_CO_FNC_Log;
};
