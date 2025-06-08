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
if !(("CSA38_Gcrew") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = ""};

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

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER_CSA.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log};

//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
	_c pushBack format["%1CSA38_Gcrew", _sid];
	_c pushBack format["%1CSA38_Gcrew2", _sid];
	_c pushBack format["%1CSA38_Gcrew5", _sid];//crew off
	
	_c pushBack format["%1CSA38_WH2Bi", _sid];//recruits
	_c pushBack format["%1CSA38_WH2B", _sid];
	_c pushBack format["%1CSA38_WH1B", _sid];
	_c pushBack format["%1CSA38_WH4B", _sid];//recruit SL
	
	_c pushBack format["%1CSA38_WH16", _sid];//Soldier Arty
	_c pushBack format["%1CSA38_WH22i", _sid];//Soldiers
	_c pushBack format["%1CSA38_WH22", _sid];
	_c pushBack format["%1CSA38_WH1", _sid];
	_c pushBack format["%1CSA38_WH2", _sid];
	_c pushBack format["%1CSA38_WH22Ii", _sid];
	_c pushBack format["%1CSA38_WH3", _sid];
	
	_c pushBack format["%1CSA38_WH4", _sid];//Engineer
	_c pushBack format["%1CSA38_WH4bb", _sid];
	_c pushBack format["%1CSA38_WH13", _sid];//Medic
	
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
		
	_c pushBack format["%1CSA38_WH5", _sid];//MG
	_c pushBack format["%1CSA38_WH5as1", _sid];
	_c pushBack format["%1CSA38_WH5as2", _sid];
	_c pushBack format["%1CSA38_WH5as3", _sid];
	_c pushBack format["%1CSA38_WH6b", _sid];
	_c pushBack format["%1CSA38_WH6", _sid];
	
	_c pushBack format["%1CSA38_WH7", _sid];//WH SL
	_c pushBack format["%1CSA38_WH8", _sid];
	_c pushBack format["%1CSA38_WH9", _sid];
	_c pushBack format["%1CSA38_WH18", _sid];
	_c pushBack format["%1CSA38_WH19", _sid];
	_c pushBack format["%1CSA38_WH20", _sid];
	_c pushBack format["%1CSA38_WH21", _sid];
	_c pushBack format["%1CSA38_WHoff2", _sid];
	
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
if(CTI_ECONOMY_LEVEL_INFANTRY >= 2) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
	_c pushBack format["%1CSA38_WH1S", _sid];//Sniper
	
	_c pushBack format["%1CSA38_WHoff1", _sid];//WH TL
	_c pushBack format["%1CSA38_WHoff5", _sid];
	_c pushBack format["%1CSA38_WHoff3", _sid];
	_c pushBack format["%1CSA38_WHoff4", _sid];//WH General
	
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
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {	
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	_c pushBack format["%1CSA38_pragaRV6", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_opelblitz_W", _sid];
		_c pushBack format["%1CSA38_opelblitz2_W", _sid];
		//_c pushBack format["%1CSA38_opelblitz3_W", _sid];//salvager
		//_c pushBack format["%1CSA38_opelblitz4_W", _sid];//ammo
		//_c pushBack format["%1CSA38_opelblitz5_W", _sid];//fuel
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_opelblitz_DE", _sid];
		_c pushBack format["%1CSA38_opelblitz2_DE", _sid];
		//_c pushBack format["%1CSA38_opelblitz3_DE", _sid];//salvager
		//_c pushBack format["%1CSA38_opelblitz4_DE", _sid];//ammo
		//_c pushBack format["%1CSA38_opelblitz5_DE", _sid];//fuel
	};
	//if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
	//};
	
	//_c pushBack format["%1CSA38_opelblitz3", _sid];//salvager
	_c pushBack format["%1CSA38_opelblitz2", _sid];
	_c pushBack format["%1CSA38_opelblitz", _sid];
	//_c pushBack format["%1CSA38_opelblitz_LATE", _sid];
	//_c pushBack format["%1CSA38_opelblitz2_LATE", _sid];
	_c pushBack format["%1CSA38_opelblitz3_LATE", _sid];
	//_c pushBack format["%1CSA38_opelblitz_LATE2", _sid];
	//_c pushBack format["%1CSA38_opelblitz2_LATE2", _sid];
	//_c pushBack format["%1CSA38_opelblitz3_LATE2", _sid];
	
	/*_c pushBack format["%1CSA38_opelblitz4", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5", _sid];//fuel
	_c pushBack format["%1CSA38_opelblitz6", _sid];//repair
	_c pushBack format["%1CSA38_opelblitz4_LATE", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5_LATE", _sid];//fuel
	_c pushBack format["%1CSA38_opelblitz4_LATE2", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5_LATE2", _sid];//fuel */
	
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

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_8radW", _sid];
		_c pushBack format["%1CSA38_8rad2W", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_8radDE", _sid];
		_c pushBack format["%1CSA38_8rad2DE", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
		_c pushBack format["%1CSA38_8rad", _sid];
		_c pushBack format["%1CSA38_8rad2", _sid];
		//_c pushBack format["%1CSA38_8radPL", _sid];
		//_c pushBack format["%1CSA38_8rad2PL", _sid];
		//_c pushBack format["%1CSA38_8radFR", _sid];
		//_c pushBack format["%1CSA38_8rad2FR", _sid];
		_c pushBack format["%1CSA38_8radLATE", _sid];
		_c pushBack format["%1CSA38_8rad2LATE", _sid];
		_c pushBack format["%1CSA38_8radLATE2", _sid];
		_c pushBack format["%1CSA38_8rad2LATE2", _sid];
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
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_pzbfwI_W", _sid];
		_c pushBack format["%1CSA38_pzkpfwIA_W", _sid];
		_c pushBack format["%1CSA38_pzkpfwI_W", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_pzbfwI_DE", _sid];
		_c pushBack format["%1CSA38_pzkpfwIA_DE", _sid];
		_c pushBack format["%1CSA38_pzkpfwI_DE", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
		_c pushBack format["%1CSA38_pzbfwIA", _sid];//unarmed
		_c pushBack format["%1CSA38_pzbfwI", _sid];
		_c pushBack format["%1CSA38_pzkpfwIA", _sid];
		_c pushBack format["%1CSA38_pzkpfwI", _sid];
		
		/*_c pushBack format["%1CSA38_pzbfwI_PL", _sid];
		_c pushBack format["%1CSA38_pzkpfwIA_PL", _sid];
		_c pushBack format["%1CSA38_pzkpfwI_PL", _sid];
		
		_c pushBack format["%1CSA38_pzbfwI_FR", _sid];
		_c pushBack format["%1CSA38_pzkpfwIA_FR", _sid];
		_c pushBack format["%1CSA38_pzkpfwI_FR", _sid];*/
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_pzIIa_W", _sid];
		_c pushBack format["%1CSA38_pzIIb_W", _sid];
		_c pushBack format["%1CSA38_pzII_W", _sid];
		_c pushBack format["%1CSA38_ltm35_W", _sid];
		//_c pushBack format["%1CSA38_ltm35_FR2_W", _sid];//nazi
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_pzIIa_DE", _sid];
		_c pushBack format["%1CSA38_pzIIb_DE", _sid];
		_c pushBack format["%1CSA38_pzII_DE", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
		_c pushBack format["%1CSA38_pzIIa", _sid];
		_c pushBack format["%1CSA38_pzIIb", _sid];
		_c pushBack format["%1CSA38_pzII", _sid];
		_c pushBack format["%1CSA38_ltm35_1", _sid];
		
		/*_c pushBack format["%1CSA38_pzIIa_PL", _sid];
		_c pushBack format["%1CSA38_pzIIb_PL", _sid];
		_c pushBack format["%1CSA38_pzII_PL", _sid];
		
		_c pushBack format["%1CSA38_ltm35_FR", _sid];
		//_c pushBack format["%1CSA38_ltm35_FR2", _sid];//nazi
		_c pushBack format["%1CSA38_pzIIa_FR", _sid];
		_c pushBack format["%1CSA38_pzIIb_FR", _sid];
		_c pushBack format["%1CSA38_pzII_FR", _sid];*/
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		//_c pushBack format["%1CSA38_mzm35t_W", _sid];//nazi, ammo?
		_c pushBack format["%1CSA38_ltm38_W", _sid];
		//_c pushBack format["%1CSA38_ltm38_FR2_W", _sid];//nazi
		_c pushBack format["%1CSA38_pzIIIB_W", _sid];
		_c pushBack format["%1CSA38_pzIIIC_W", _sid];
		_c pushBack format["%1CSA38_pzIIID_W", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_pzIIID_DAK", _sid];
		_c pushBack format["%1CSA38_pzIIID_DAK2", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
		_c pushBack format["%1CSA38_pzIIIB", _sid];
		_c pushBack format["%1CSA38_pzIIIC", _sid];
		_c pushBack format["%1CSA38_pzIIID", _sid];
		_c pushBack format["%1CSA38_StugIII", _sid];
		_c pushBack format["%1CSA38_ltm38", _sid];
		
		//_c pushBack format["%1CSA38_pzIIIB_PL", _sid];
		//_c pushBack format["%1CSA38_pzIIIC_PL", _sid];
		//_c pushBack format["%1CSA38_pzIIID_PL", _sid];
		//_c pushBack format["%1CSA38_mzm35t", _sid];//nazi, ammo?
		
		/*_c pushBack format["%1CSA38_ltm38_FR", _sid];
		//_c pushBack format["%1CSA38_ltm38_FR2", _sid];//nazi
		_c pushBack format["%1CSA38_pzIIIB_FR", _sid];
		_c pushBack format["%1CSA38_pzIIIC_FR", _sid];
		_c pushBack format["%1CSA38_pzIIID_FR", _sid];
		
		_c pushBack format["%1CSA38_ltm38_LATE", _sid];
		_c pushBack format["%1CSA38_ltm38_LATE2", _sid];//camo
		_c pushBack format["%1CSA38_pzIIIB_LATE", _sid];
		_c pushBack format["%1CSA38_pzIIIC_LATE", _sid];
		_c pushBack format["%1CSA38_pzIIID_LATE", _sid];*/
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
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_pzbfwIamb_W", _sid];// medic?
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_pzbfwIamb_DE", _sid];// medic?
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
		_c pushBack format["%1CSA38_pzbfwIamb", _sid];// medic?
	};
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'PzBfwI Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'PzBfwI Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 5;	
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_pzIV_W", _sid];
		_c pushBack format["%1CSA38_pzIVB_W", _sid];
		_c pushBack format["%1CSA38_pzIVC_W", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_pzIV_DAK", _sid];
		_c pushBack format["%1CSA38_pzIVB_DAK", _sid];
		_c pushBack format["%1CSA38_pzIVC_DAK", _sid];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
		_c pushBack format["%1CSA38_pzIV", _sid];
		_c pushBack format["%1CSA38_pzIVB", _sid];
		_c pushBack format["%1CSA38_pzIVcv38", _sid];
		
		/*_c pushBack format["%1CSA38_pzIV_PL", _sid];
		_c pushBack format["%1CSA38_pzIVB_PL", _sid];
		_c pushBack format["%1CSA38_pzIVC_PL", _sid];
		
		_c pushBack format["%1CSA38_pzIV_FR", _sid];
		_c pushBack format["%1CSA38_pzIVB_FR", _sid];
		_c pushBack format["%1CSA38_pzIVC_FR", _sid];
		
		_c pushBack format["%1CSA38_pzIV_LATE", _sid];
		_c pushBack format["%1CSA38_pzIVB_LATE", _sid];
		_c pushBack format["%1CSA38_pzIVC_LATE", _sid];*/
	};
	_c pushBack format["%1csa38_valentineMkII7", _sid];
	
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

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_HEAVY) then {
	_upgrade_levels set [CTI_UPGRADE_HEAVY, _tech_level];
};

//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
//Level 1
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	};
	_c pushBack format["%1", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack ([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 5;
	
	_tech_level = _tech_level + 1;
};*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

_c pushBack format["%1CSA38_opelblitz6", _sid];						//repairtruck
_p pushBack '';
_n pushBack 'Repair Truck';
_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "service-repairtruck";
_d pushBack 5;

_setupBaseUnits = false;
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_GER_ID && (_isThisMain select 1) == CTI_CSA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if(_setupBaseUnits) then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {
			_c pushBack format["CTI_Salvager_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvage Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CSA38_opelblitz3_W", _sid],"salvager"];
			_d pushBack 5;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvage Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CSA38_opelblitz3_W", _sid],"salvager-independent"];
			_d pushBack 5;
		};
		case 2: {
			_c pushBack format["CTI_Salvager_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvage Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CSA38_opelblitz3_DE", _sid],"salvager"];
			_d pushBack 5;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvage Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CSA38_opelblitz3_DE", _sid],"salvager-independent"];
			_d pushBack 5;
		};
		default {
			_c pushBack format["CTI_Salvager_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvage Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CSA38_opelblitz3", _sid],"salvager"];
			_d pushBack 5;
				
			_c pushBack format["CTI_Salvager_Independent_%1", _faction];
			_p pushBack '';
			_n pushBack 'Salvage Truck';
			_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_REPAIR;
			_s pushBack [format["%1CSA38_opelblitz3", _sid],"salvager-independent"];
			_d pushBack 5;
		};
	};
};

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	_c pushBack format["%1CSA38_opelblitz4_W", _sid];//ammo
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1CSA38_opelblitz5_W", _sid];//fuel
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;	

};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	_c pushBack format["%1CSA38_opelblitz4_DE", _sid];//ammo
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1CSA38_opelblitz5_DE", _sid];//fuel
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;	

};
if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
	_c pushBack format["%1CSA38_opelblitz4", _sid];//ammo
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1CSA38_opelblitz5", _sid];//fuel
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;	
};
if(CTI_CAMO_ACTIVATION > 3) then {		//all camo active
	_c pushBack format["%1CSA38_opelblitz4_LATE", _sid];//ammo
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1CSA38_opelblitz5_LATE", _sid];//fuel
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;	

	_c pushBack format["%1CSA38_opelblitz4_LATE2", _sid];//ammo
	_p pushBack '';
	_n pushBack 'Ammo Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-ammotruck";
	_d pushBack 5;	

	_c pushBack format["%1CSA38_opelblitz5_LATE2", _sid];//fuel
	_p pushBack '';
	_n pushBack 'Fuel Truck';
	_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AMMO;
	_s pushBack "service-fueltruck";
	_d pushBack 5;	
};


//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_tech_level = 0;
/*_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
*/

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_NAVAL) then {
	_upgrade_levels set [CTI_UPGRADE_NAVAL, _tech_level];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER_CSA.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_GER_CSA.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
