private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_isThisMain", "_setupBaseUnits"];

_side = _this;
_faction = "";
_sid = "";
_building_time = 10;
_setupBaseUnits = false;

if(_side == west) then {
	_sid = "VIOC_B_";
	_faction = "West";
} else {
	if(_side == east) then {
		_sid = "VIOC_O_";
		_faction = "East";
	} else {
		_sid = "VIOC_I_";
		_faction = "Resistance";
	};
};
if !(("I_NORTH_FIN_W_41_Unequipped") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_FIN_NF.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
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
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Rifleman_CPL", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_SSGT", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Radioman", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_T_S_41_Crewman_SSGT", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_ART_41_Unequip", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_SgtMaj", _sid];
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
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
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_2ndLt", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_SgtMaj", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_2ndLt", _sid];
		};
		default {
			//----------FIN Army Winter 1939------------
			_c pushBack format["%1I_NORTH_FIN_41_Autorifleman", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_1CL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_CPL", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_SSGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Submachinegunner_SGT", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Officer_2ndLt", _sid];
			//special
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_1stLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_2ndLt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_NCO", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_1STLT", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_2NDLT", _sid];
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
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
			_c pushBack format["%1I_NORTH_FIN_W_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_W_41_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_W_41_Crewman_CPT", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_S_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_S_41_Patrolman_Officer", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_S_41_Officer_Cpt", _sid];
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
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPT", _sid];
			_c pushBack format["%1I_NORTH_FIN_ART_41_Officer_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_41_AIR_Pilot_Cpt", _sid];
			_c pushBack format["%1I_NORTH_FIN_T_41_Crewman_CPT", _sid];
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if (isClass(configFile >> "CfgVehicles" >> format["%1LIB_SdKfz_7", _sid])) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_SdKfz_7_w", _sid];						
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_DAK_SdKfz_7", _sid];					
	};
	_c pushBack format["%1LIB_SdKfz_7", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_R75", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_R75", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_R75", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};

	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_Tempo", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Open", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Maxim_Quad", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_Tempo", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Open", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Maxim_Quad", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_Tempo", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8_Open", _sid];
				_c pushBack format["%1NORTH_FIN_FordV8_Maxim_Quad", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};

	if(CTI_STREAM_BLOCK > 0) then {}
	else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_FordV8_Medical", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_FordV8_Medical", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_FordV8_Medical", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'FordV8 Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'FordV8 Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;		
	};

};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M33_OT", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T20", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T38", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33_OT", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M33_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T20", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T38", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33_OT", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M33_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T20", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T38", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M33_OT", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M33_OT_FIN", _sid];
				_c pushBack format["%1NORTH_FIN_T20", _sid];
				_c pushBack format["%1NORTH_FIN_T38", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
	
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M31", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_BT5", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_BT5", _sid];
				_c pushBack format["%1NORTH_FIN_W_BT42", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT5", _sid];
				_c pushBack format["%1NORTH_FIN_BT42", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M31", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_BT5", _sid];
				_c pushBack format["%1NORTH_FIN_BT42", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
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
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M39_OT", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M39_OT", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M39_OT_FIN", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39_OT", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39_OT_FIN", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39_OT", _sid];
				_c pushBack format["%1NORTH_FIN_41_T26_M39_OT_FIN", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
	
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T26_M38", _sid];
		_c pushBack format["%1NORTH_FIN_W_39_T26_M39", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T28", _sid];
				_c pushBack format["%1NORTH_FIN_W_41_T26_M39", _sid];
				_c pushBack format["%1NORTH_FIN_W_STUG_3_G", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T28", _sid];
				_c pushBack format["%1NORTH_FIN_S_41_T26_M39", _sid];
				_c pushBack format["%1NORTH_FIN_S_STUG_3_G", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T26_M38", _sid];
				_c pushBack format["%1NORTH_FIN_41_T28", _sid];
				_c pushBack format["%1NORTH_FIN_T26_M39", _sid];
				_c pushBack format["%1NORTH_FIN_STUG_3_G", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	if(CTI_STREAM_BLOCK > 0) then {
		_c pushBack format["%1NORTH_FIN_W_39_T28", _sid];
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T28e", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T28e", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_41_T28e", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	//if(_cntstart > _cntend) then {_tech_level = _tech_level + 1};
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
	
	if(CTI_STREAM_BLOCK > 0) then {
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_41_T34_76_1941", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_41_T34_76_1941", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_T34_76_1941", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;	
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	if(CTI_STREAM_BLOCK > 0) then {
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_STU40G", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_STU40G", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_STU40G", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	//if(_cntstart > _cntend) then {_tech_level = _tech_level + 1};
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
	
	if(CTI_STREAM_BLOCK > 0) then {
	} else {
		switch(CTI_CAMO_ACTIVATION) do {
			case 1: {//Winter camo active
				_c pushBack format["%1NORTH_FIN_W_KV1_1942", _sid];
			};
			case 2: {//Summer camo active
				_c pushBack format["%1NORTH_FIN_S_KV1_1942", _sid];
			};
			default {
				_c pushBack format["%1NORTH_FIN_KV1_1942", _sid];
			};
		};
	};
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;	
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
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
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;	
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 5;	
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_HEAVY) then {
	_upgrade_levels set [CTI_UPGRADE_HEAVY, _tech_level];
};

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 0
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_FIN_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1LIB_Li2", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack (CTI_ECONOMY_PRIZE_AIR*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))/2;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
	
	_tech_level = _tech_level + 1;
};
*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_FIN_ID && (_isThisMain select 1) == CTI_NF_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};

switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//Winter camo active
		_c pushBack format["%1NORTH_FIN_W_41_FordV8_Repair", _sid];				//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 5;
		if(_setupBaseUnits) then {
			_c pushBack format["CTI_Salvager_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1NORTH_FIN_W_41_FordV8_Open", _sid],"salvager"];
			_d pushBack 5;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1NORTH_FIN_W_41_FordV8_Open", _sid],"salvager-independent"];
			_d pushBack 5;
		};
	};
	case 2: {//Summer camo active
		_c pushBack format["%1NORTH_FIN_S_41_FordV8_Repair", _sid];				//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 5;

		if(_setupBaseUnits) then {
			_c pushBack format["CTI_Salvager_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1NORTH_FIN_S_41_FordV8_Open", _sid],"salvager"];
			_d pushBack 5;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1NORTH_FIN_S_41_FordV8_Open", _sid],"salvager-independent"];
			_d pushBack 5;
		};
	};
	default {
		_c pushBack format["%1NORTH_FIN_FordV8_Repair", _sid];					//repairtruck
		_p pushBack '';
		_n pushBack 'Repair Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack "service-repairtruck";
		_d pushBack 5;

		if(_setupBaseUnits) then {
			_c pushBack format["CTI_Salvager_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1NORTH_FIN_FordV8_Open", _sid],"salvager"];
			_d pushBack 5;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvager Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1NORTH_FIN_FordV8_Open", _sid],"salvager-independent"];
			_d pushBack 5;
		};
	};
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_tech_level = 0;
switch(CTI_CAMO_ACTIVATION) do {
	case 1: {//Winter camo active
		_c pushBack format["%1NORTH_FIN_W_41_FordV8_Ammo", _sid];			//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 5;

		_c pushBack format["%1NORTH_FIN_W_41_FordV8_Fuel", _sid];			//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 5;	
	};
	case 2: {//Summer camo active
		_c pushBack format["%1NORTH_FIN_S_41_FordV8_Ammo", _sid];			//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 5;

		_c pushBack format["%1NORTH_FIN_S_41_FordV8_Fuel", _sid];			//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 5;	
	};
	default {
		_c pushBack format["%1NORTH_FIN_FordV8_Ammo", _sid];				//ammotruck
		_p pushBack '';
		_n pushBack 'Ammo Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-ammotruck";
		_d pushBack 5;
		
		_c pushBack format["%1NORTH_FIN_FordV8_Fuel", _sid];				//fueltruck
		_p pushBack '';
		_n pushBack 'Fuel Truck';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AMMO;
		_s pushBack "service-fueltruck";
		_d pushBack 5;	
	};
};

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_FIN_ID, CTI_NF_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_FIN_NF.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_FIN_NF.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
