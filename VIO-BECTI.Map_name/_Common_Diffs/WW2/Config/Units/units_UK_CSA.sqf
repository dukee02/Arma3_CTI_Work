private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_faction = "";
_sid = "";
_building_time = 10;

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
if !(("csa38_ENsoldier144") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_UK_CSA.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_tech_level = 0;
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
	_c pushBack format["%1csa38_ENsoldier144", _sid];//crew
	_c pushBack format["%1CSA38_ENsoldier1_7", _sid];//Soldier
	_c pushBack format["%1CSA38_ENsoldier1", _sid];
	_c pushBack format["%1CSA38_ENsoldier3_1", _sid];//medic
	_c pushBack format["%1CSA38_ENsoldier1_4", _sid];//AT boy
	
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
		
	_c pushBack format["%1CSA38_ENsoldier1_5", _sid];//Sten 1
	_c pushBack format["%1CSA38_ENsoldier1_1", _sid];//Sten 2
	_c pushBack format["%1CSA38_ENsoldier1_2", _sid];//Sten 3
	_c pushBack format["%1CSA38_ENsoldier1_6", _sid];//Sten 4
	_c pushBack format["%1CSA38_ENsoldier1_3", _sid];//Sten 5
	_c pushBack format["%1CSA38_ENsoldier2_1", _sid];//MG ass
	_c pushBack format["%1CSA38_ENsoldier2", _sid];//MG
	
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
		
	_c pushBack format["%1CSA38_ENsoldier8_3", _sid];//platoon leader
	_c pushBack format["%1CSA38_ENsoldier8_2", _sid];//SL
	_c pushBack format["%1CSA38_ENsoldier8_1", _sid];//TL
	
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
/*_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1", _sid];
		_p pushBack '';
		_n pushBack '';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 5;		
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "";
	_d pushBack 5;
	_tech_level = _tech_level + 1;
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_LIGHT) then {
	_upgrade_levels set [CTI_UPGRADE_LIGHT, _tech_level];
};

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	
		switch(_side) do {
			case east: {
				_c pushBack format["%1csa38_m3a37ADW2", _sid];//red icon
				_c pushBack format["%1csa38_m3a37ADW3", _sid];
				_c pushBack format["%1csa38_m3a37ADW4", _sid];
				_c pushBack format["%1csa38_m3a37ADW5", _sid];
			};
			default {
				_c pushBack format["%1csa38_m3a37ADW", _sid];
			};
		};
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		switch(_side) do {
			case west: {
				_c pushBack format["%1csa38_m3a37AD8", _sid];//blue icon
				_c pushBack format["%1csa38_m3a37AD6", _sid];
				_c pushBack format["%1csa38_m3a37AD7", _sid];
				_c pushBack format["%1csa38_m3a37AD9", _sid];
			};
			case east: {	
				_c pushBack format["%1csa38_m3a37AD2", _sid];//red icon
				_c pushBack format["%1csa38_m3a37AD3", _sid];
				_c pushBack format["%1csa38_m3a37AD4", _sid];
				_c pushBack format["%1csa38_m3a37AD5", _sid];
			};
			default {
				_c pushBack format["%1csa38_m3a37AD", _sid];
				_c pushBack format["%1csa38_m3a37AD10", _sid];//yellow icon
				_c pushBack format["%1csa38_m3a37AD11", _sid];
				_c pushBack format["%1csa38_m3a37AD12", _sid];
				_c pushBack format["%1csa38_m3a37AD13", _sid];
			};
		};
	};
	switch(_side) do {
		case west: {
			_c pushBack format["%1csa38_m3a37AD458", _sid];	//blue icon
			_c pushBack format["%1csa38_m3a37AD456", _sid];	
			_c pushBack format["%1csa38_m3a37AD457", _sid];	
			_c pushBack format["%1csa38_m3a37AD459", _sid];	
		};
		case east: {
			_c pushBack format["%1csa38_m3a37AD452", _sid];	//red icon
			_c pushBack format["%1csa38_m3a37AD453", _sid];	
			_c pushBack format["%1csa38_m3a37AD454", _sid];	
			_c pushBack format["%1csa38_m3a37AD455", _sid];	
		};
		default {
			_c pushBack format["%1csa38_m3a3", _sid];	
			_c pushBack format["%1csa38_m3a37AD45", _sid];	
			_c pushBack format["%1csa38_m3a37AD4510", _sid];	//yellow icon
			_c pushBack format["%1csa38_m3a37AD4511", _sid];	
			_c pushBack format["%1csa38_m3a37AD4512", _sid];	
			_c pushBack format["%1csa38_m3a37AD4513", _sid];
		};
	};
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1csa38_m5a17ADW", _sid];
		_c pushBack format["%1csa38_valentineMkIIW", _sid];
		_c pushBack format["%1csa38_matildaii_3", _sid];
		//_c pushBack format["%1csa38_matildaiiCS_3", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1csa38_m5a17AD4", _sid];
		//_c pushBack format["%1csa38_m5a17AD", _sid];//No15 icon
		_c pushBack format["%1csa38_valentineMkII2", _sid];
		//_c pushBack format["%1csa38_valentineMkII", _sid];
		//_c pushBack format["%1csa38_valentineMkII6", _sid];
		//_c pushBack format["%1csa38_valentineMkII5", _sid];//yellow black
		//_c pushBack format["%1csa38_valentineMkII4", _sid];
		//_c pushBack format["%1csa38_valentineMkII3", _sid];//yellow green
		_c pushBack format["%1csa38_matildaii", _sid];//yellow desert
		//_c pushBack format["%1csa38_matildaiiCS", _sid];
		//_c pushBack format["%1csa38_matildaii_2", _sid];//yellow 2xgreen
		//_c pushBack format["%1csa38_matildaiiCS_2", _sid];
		//_c pushBack format["%1csa38_matildaii_6", _sid];//yellow green brown
		//_c pushBack format["%1csa38_matildaiiCS_6", _sid];
	};
	_c pushBack format["%1csa38_m5a17AD3", _sid];	
	//_c pushBack format["%1csa38_m5a17AD2", _sid];	//No15 icon
	_c pushBack format["%1csa38_valentineMkIIgreen", _sid];	
	//_c pushBack format["%1csa38_valentineMkIIgreen2", _sid];//brown black	
	//_c pushBack format["%1csa38_valentineMkIIgreen3", _sid];	
	//_c pushBack format["%1csa38_valentineMkIIgreen4", _sid];
	//_c pushBack format["%1csa38_matildaii_1", _sid];	//brown camo
	//_c pushBack format["%1csa38_matildaiiCS_1", _sid];	
	//_c pushBack format["%1csa38_matildaii_4", _sid];//brown black	
	//_c pushBack format["%1csa38_matildaiiCS_4", _sid];	
	_c pushBack format["%1csa38_matildaii_5", _sid];	//green
	//_c pushBack format["%1csa38_matildaiiCS_5", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		switch(_side) do {
			case west: {
				_c pushBack format["%1csa38_cromwell_2camo9W", _sid];//blue icon
				_c pushBack format["%1csa38_cromwell_2camo10W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo12W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo11W", _sid];
			};
			case east: {
				_c pushBack format["%1csa38_cromwell_2camo1W", _sid];//red icon
				_c pushBack format["%1csa38_cromwell_2camo2W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo3W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo4W", _sid];
			};
			default {
				_c pushBack format["%1csa38_cromwell_C2W", _sid];
				_c pushBack format["%1csa38_cromwell_C3W", _sid];
				_c pushBack format["%1csa38_cromwell_CW", _sid];
				_c pushBack format["%1csa38_cromwell_2W", _sid];
				_c pushBack format["%1csa38_cromwell_DW", _sid];//more green
				_c pushBack format["%1csa38_cromwell_D3W", _sid];
				_c pushBack format["%1csa38_cromwell_D2W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo5W", _sid];//yellow icon
				_c pushBack format["%1csa38_cromwell_2camo6W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo7W", _sid];
				_c pushBack format["%1csa38_cromwell_2camo8W", _sid];
			};
		};
		//_c pushBack format["%1csa38_cromwell_DCS2W", _sid];//mortar gun, more green
		//_c pushBack format["%1csa38_cromwell_DCSW", _sid];
		//_c pushBack format["%1csa38_cromwell_DCS3W", _sid];
		_c pushBack format["%1csa38_cromwell_4ENW", _sid];//mortar gun
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		switch(_side) do {
			case west: {
				_c pushBack format["%1csa38_cromwell_2camo9", _sid];//blue icon
				_c pushBack format["%1csa38_cromwell_2camo10", _sid];
				_c pushBack format["%1csa38_cromwell_2camo11", _sid];
				_c pushBack format["%1csa38_cromwell_2camo12", _sid];
			};
			case east: {
				_c pushBack format["%1csa38_cromwell_2camo1", _sid];//red icon
				_c pushBack format["%1csa38_cromwell_2camo2", _sid];
				_c pushBack format["%1csa38_cromwell_2camo3", _sid];
				_c pushBack format["%1csa38_cromwell_2camo4", _sid];
			};
			default {
				_c pushBack format["%1csa38_cromwell_2B", _sid];
				_c pushBack format["%1csa38_cromwell_C2", _sid];
				_c pushBack format["%1csa38_cromwell_C3", _sid];
				_c pushBack format["%1csa38_cromwell_C", _sid];
				_c pushBack format["%1csa38_cromwell_D3", _sid];
				_c pushBack format["%1csa38_cromwell_D2", _sid];
				_c pushBack format["%1csa38_cromwell_D", _sid];
				_c pushBack format["%1csa38_cromwell_2", _sid];
				_c pushBack format["%1csa38_cromwell_2camo5", _sid];//yellow icon
				_c pushBack format["%1csa38_cromwell_2camo6", _sid];
				_c pushBack format["%1csa38_cromwell_2camo7", _sid];
				_c pushBack format["%1csa38_cromwell_2camo8", _sid];
			};
		};
		_c pushBack format["%1csa38_cromwell_4EN", _sid];//mortar gun
		//_c pushBack format["%1csa38_cromwell_DCS3", _sid];
		//_c pushBack format["%1csa38_cromwell_DCS", _sid];
		//_c pushBack format["%1csa38_cromwell_DCS2", _sid];
	};
	switch(_side) do {
		case west: {
			_c pushBack format["%1csa38_cromwell_245camo9", _sid];	//blue icon
			_c pushBack format["%1csa38_cromwell_245camo10", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo11", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo12", _sid];
		};
		case east: {
			_c pushBack format["%1csa38_cromwell_245camo1", _sid];	//red icon
			_c pushBack format["%1csa38_cromwell_245camo2", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo3", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo4", _sid];	
		};
		default {
			_c pushBack format["%1csa38_cromwell_C453", _sid];	
			_c pushBack format["%1csa38_cromwell_C452", _sid];	
			_c pushBack format["%1csa38_cromwell_C45", _sid];	
			_c pushBack format["%1csa38_cromwell_D452", _sid];	
			_c pushBack format["%1csa38_cromwell_D453", _sid];	
			_c pushBack format["%1csa38_cromwell_D45", _sid];	
			_c pushBack format["%1csa38_cromwell_145", _sid];	
			_c pushBack format["%1csa38_cromwell_245", _sid];	
			_c pushBack format["%1csa38_cromwell_345", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo5", _sid];	//yellow icon
			_c pushBack format["%1csa38_cromwell_245camo6", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo7", _sid];	
			_c pushBack format["%1csa38_cromwell_245camo8", _sid];	
		};
	};
	_c pushBack format["%1csa38_cromwell_5EN45", _sid];	//mortar gun
	//_c pushBack format["%1csa38_cromwell_6EN45", _sid];	
	//_c pushBack format["%1csa38_cromwell_4EN45", _sid];	
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack (CTI_ECONOMY_PRIZE_TRACKED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100));
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
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
};*/

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

if(CTI_US_SIDE != CTI_UK_SIDE) then {
	_c pushBack format["CTI_Salvager_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvage Vehicle';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1CSA38_pragaRV", _sid],"salvager"];
	_d pushBack 5;
			
	_c pushBack format["CTI_Salvager_Independent_%1", _faction];
	_p pushBack '';
	_n pushBack 'Salvage Vehicle';
	_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_REPAIR;
	_s pushBack [format["%1CSA38_pragaRV", _sid],"salvager-independent"];
	_d pushBack 5;
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*if(CTI_IFA3_NEW < 0 && CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1fow_v_universalCarrier", _sid];				//ammotruck
	_p pushBack '';
	_n pushBack 'Ammo Vehicle';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1fow_v_universalCarrier", _sid];				//fueltruck
	_p pushBack '';
	_n pushBack 'Fuel Vehicle';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;	

};*/


//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _tech_level) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_NAVAL;
	_s pushBack "";
	_d pushBack 50;
	
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_UK_CSA.sqf", format["units declared: [%1] | [%2]", count _c, count _n]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_UK_CSA.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
