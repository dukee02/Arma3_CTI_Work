private ["_side", "_faction", "_sid", "_sid_base", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_faction = "";
_sid = "";
_sid_base = "";
_building_time = 10;

switch (_side) do {
	case west: {
		_sid_base = "VIOC_B_";_faction = "West";
	};
	case east: {
		_sid_base = "VIOC_O_";_faction = "East";
	};
	case resistance: {
		_sid_base = "VIOC_I_";_faction = "Resistance";
	};
	default {_sid_base = "";};
};

//if !(("sab_nl_mutsuki") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_small_mods.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
//Level start
/*if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
	_time = (1*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
	_building_time = switch(true) do {case (_time<3): {3}; case (_time>50): {50}; default {_time}};
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1LIB_UK_Officer_w", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1LIB_UK_DR_Tank_Commander", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;
	};
	_c pushBack format["%1LIB_UK_Sniper", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_BARRACKS;
	_s pushBack "";
	_d pushBack 5;
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_BARRACKS) then {
	_upgrade_levels set [CTI_UPGRADE_BARRACKS, _tech_level];
};
*/

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
//Level start
_tech_level = 0;

if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_DaimlerMk2")) then {
		if !(("FA_DaimlerMk2") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_DaimlerMk2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_c pushBack format["%1FA_T17E1", _sid];
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
};

if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_BA64")) then {
		if !(("FA_BA64") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_SOV_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_BA64", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_BA10M", _sid];
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
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_BA64_Captured")) then {
		if !(("FA_BA64_Captured") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_CARS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_BA64_Captured", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_BA10M_Captured", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_Sdkfz231", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 5;

			_c pushBack format["%1FA_Sdkfz234_4", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_LIGHT;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
			_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

			_c pushBack format["%1FA_Sdkfz234", _sid];
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
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.


if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_ValentineMk3")) then {
		if !(("FA_ValentineMk3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_ValentineMk3", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_M26")) then {
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_US_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
		if !(("FA_M26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_M26", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
	};
};
if (isClass(configFile >> "CfgVehicles" >> "SOV_BT_BT7A")) then {
	if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		if !(("SOV_BT_BT7A") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_BT_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};		
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1SOV_BT_BT7A", _sid];
			_c pushBack format["%1SOV_BT_BT7_M1937", _sid];
			_c pushBack format["%1SOV_BT_BT7TU_M1937", _sid];

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
		};
	};
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26")) then {
		if !(("FA_T26") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_SOV_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_T26", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_ValentineMk3_SOV", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_KV1", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if (isClass(configFile >> "CfgVehicles" >> "FA_T26_Captured")) then {
		if !(("FA_T26_Captured") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_TANKS_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_T26_Captured", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
			_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1FA_Pz38t", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;

			_c pushBack format["%1FA_Panzer2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_HEAVY;
			_s pushBack "";
			_d pushBack 5;
		};
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
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_gladiator") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_gladiator", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_ca12bo", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_mb5", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_meteor", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_hurricane") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_hurricane", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_hurricane_trop", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_hurricane_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_dh98", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_halifax") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_halifax", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};

};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_c47") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_c47", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_p26", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_ryanpt", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_texan", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_dauntless", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_avenger", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_p38", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_corsair", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_mustang", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_p51b", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_a26", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_b25", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_tigercat", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_f6f", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_b24", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_p61", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_b17", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_f4f") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_f4f", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_sbd", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_f4u", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_p51d", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_tbf") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_tbf", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_p40", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_p38", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_a26", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_b17", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_i16") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_i16", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_la5", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_la5_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_p39", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_tusb2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_il2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_yak3") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
				
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_yak3", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_i16", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_il2", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
				
				_c pushBack format["%1sab_sw_il2_2", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_avia") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_avia", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_bu131", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_avia_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_w34", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_w34f", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_bf109", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_ju87", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_bf110", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_bf110_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_ju88", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_ju88_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fw190", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_fw190_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_he111", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_bv141", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_do335", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_ta152c", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_he162", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_hix", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_me262", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_me262_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_bf109e") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_bf109e", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_bf109f", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_fl_ju88a", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_bf109g", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_bf109k", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_fl_fw190a", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_he162", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		if(CTI_SABRL_ADDON > 0) then {
			if !(("sab_sw_bf110") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
			_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
			_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_SABRL_ID] call CTI_CO_FNC_GetTechmatrix;
			
			_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_bf110", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
				
				_c pushBack format["%1sab_sw_bf110_2", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_ju87", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
				
				_c pushBack format["%1sab_sw_ju87_2", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_do335", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_he177", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
			
			_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
			if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
			if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
				_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
				_c pushBack format["%1sab_sw_ar234", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 5;
			};
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_m6a") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_m6a", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_m6av2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_a5m", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_aichival", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_kate", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_ki61", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_zero", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_ki100", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
			_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
		};
	};
	
	if(CTI_SABFL_ADDON > 0) then {
		if !(("sab_fl_a6m") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_JPN_ID, CTI_SABFL_ID] call CTI_CO_FNC_GetTechmatrix;
			
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_fl_a6m", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 5;
		};
	};
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
/*_tech_level = 0;
if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	//if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	//};
	//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	//};
	if(CTI_UK_SIDE < 2) then {
		_c pushBack format["CTI_Salvager_%1", _faction];
		_p pushBack '';
		_n pushBack 'Salvager Truck';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack [format["%1LIB_US6_Open_Cargo", _sid],"salvager"];
		_d pushBack 5;
			
		_c pushBack format["CTI_Salvager_Independent_%1", _faction];
		_p pushBack '';
		_n pushBack 'Salvager Truck';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_s pushBack [format["%1LIB_US6_Open_Cargo", _sid],"salvager-independent"];
		_d pushBack 5;
	};
};
*/

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {	
	_c pushBack format["%1LIB_US6_Ammo", _sid];						//ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;		

};*/

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_liberty_rn") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_liberty_rn", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_torpedo_rn", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_subchaser_rn", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_destroyer_rn", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_cruiser_rn", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_battleship_rn", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_foxhound") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_foxhound", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,3.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_nl_liberty", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_liberty", _sid],"service-multi"];
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_time = (10*CTI_ECONOMY_TIME_MULTI*(_tech_level+1));
			_building_time = switch(true) do {case (_time<10): {10}; case (_time>300): {300}; default {_time}};
			_c pushBack format["%1sab_nl_dido", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_arkroyal", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_arkroyal", _sid],"service-multi"];
			_d pushBack 150;
			_c pushBack format["%1sab_nl_hood", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_freighter", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_liberty", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_rubberboat", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_torpedo", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_sreighter", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_subchaser", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_destroyer", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_boat_u7_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_cruiser", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_item_carrier_2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_battleship", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_ptboat") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_US_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_ptboat", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_nl_liberty", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_liberty", _sid],"service-multi"];
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_sims", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,3.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_cleveland", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_enterprise", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_enterprise", _sid],"service-multi"];
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter_i") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_SOV_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_freighter_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_liberty_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_rubberboat3", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_torpedo_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_sreighter_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_subchaser_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_destroyer_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_boat_u7_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_cruiser_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_battleship_i", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
	/*if(CTI_SABFL_ADDON > 0) then {
		if(CTI_ECONOMY_LEVEL_NAVAL >= 0) then {
			_c pushBack format["%1", _sid];
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};*/
};
if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter_o") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_freighter_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_torpedo_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_s38_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_sreighter_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_destroyer_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_boat_u7", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_cruiser_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_battleship_o", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_t22") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_t22", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,3.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_nl_vincenzo", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,3.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_nl_liberty", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_liberty", _sid],"service-multi"];
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_zara", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_u557", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_nl_scharnhorst", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_SAB_ADDON > 0) then {
		if !(("sab_boat_freighter_o_x") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_JPN_ID, CTI_SAB_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_freighter_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
			_c pushBack format["%1sab_boat_torpedo_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_rubberboat2", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
			_c pushBack format["%1sab_boat_subchaser_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 5;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_destroyer_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_boat_i400", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_boat_u7_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_boat_cruiser_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_carrier_akagi", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
			_c pushBack format["%1sab_item_carrier", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
			_c pushBack format["%1sab_boat_battleship_o_x", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,6.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
	if(CTI_SABNL_ADDON > 0) then {
		if !(("sab_nl_mutsuki") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""} else {_sid = _sid_base};
		_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_SABNL_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_mutsuki", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,3.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 50;
			_c pushBack format["%1sab_nl_liberty", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_liberty", _sid],"service-multi"];
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_fubuki", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,4.0] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack "";
			_d pushBack 100;
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
			_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
			_c pushBack format["%1sab_nl_akagi", _sid];
			_p pushBack '';
			_n pushBack '';
			_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_NAVAL;
			_s pushBack [format["%1sab_nl_akagi", _sid],"service-multi"];
			_d pushBack 150;
		};
		
		//Update the calculatetd max upgrade level
		if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
			_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
		};
	};
};


if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_small_mods.sqf", format["units declared: [%1] | [%2]", count _c, count _n]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";