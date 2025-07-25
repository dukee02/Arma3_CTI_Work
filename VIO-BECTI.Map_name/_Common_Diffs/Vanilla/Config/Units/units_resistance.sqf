/*
format["%1<vanilla_unitname>", _sid] gets used later 4 the upcomming sidepatch
format["%1", _sid]; - 4 copy paste
*/
private ["_side", "_faction", "_sid", "_time", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation"];

_side = _this;
_faction = "";
_sid = "";
_building_time = 10;

if(_side == west) then {
	//_sid = "VIOC_B_";
	_faction = "West";
} else {
	if(_side == east) then {
		//_sid = "VIOC_O_";
		_faction = "East";
	} else {
		//_sid = "VIOC_I_";
		_faction = "Resistance";
	};
};

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
//No upgrades for IND yet
/*_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};*/

_c = []; //--- Classname
_p = []; //--- Picture. 				'' = auto generated.
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Build time.
_u = []; //--- Upgrade level needed.    0 1 2 3...
_f = []; //--- Built from Factory.
_s = []; //--- Script
_d = []; //--- Extra Distance (From Factory)

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_AAF_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

// Barracks Upgrade Level 0
// ------------------------

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=_baseUnitValue*CTI_ECONOMY_RESEARCH_MULTI/100;

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=_armedUnitValue*CTI_ECONOMY_RESEARCH_MULTI/100;
	
	// List of units
	// unarmed units
	_c pushBack format["%1I_Soldier_unarmed_F", _sid];
	_c pushBack format["%1I_Survivor_F", _sid];
	
	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};

	// armed units
	_c pushBack format["%1I_Soldier_A_F", _sid];
	_c pushBack format["%1I_Soldier_AAR_F", _sid];
	_c pushBack format["%1I_Soldier_AR_F", _sid];
	_c pushBack format["%1I_medic_F", _sid];
	_c pushBack format["%1I_crew_F", _sid];
	_c pushBack format["%1I_engineer_F", _sid];
	_c pushBack format["%1I_Soldier_exp_F", _sid];
	_c pushBack format["%1I_Soldier_GL_F", _sid];
	_c pushBack format["%1I_soldier_mine_F", _sid];
	_c pushBack format["%1I_Soldier_repair_F", _sid];
	_c pushBack format["%1I_soldier_F", _sid];
	_c pushBack format["%1I_Soldier_LAT_F", _sid];
	_c pushBack format["%1I_Soldier_lite_F", _sid];
	
	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};
};


// Barracks Upgrade Level 1
// ------------------------

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=_baseUnitValue*CTI_ECONOMY_RESEARCH_MULTI/100;

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=_armedUnitValue*CTI_ECONOMY_RESEARCH_MULTI/100;
	
	// List of units
	// armed units
	_c pushBack format["%1I_support_AMG_F", _sid];
	_c pushBack format["%1I_support_AMort_F", _sid];
	_c pushBack format["%1I_Fighter_Pilot_F", _sid];
	_c pushBack format["%1I_support_GMG_F", _sid];
	_c pushBack format["%1I_support_MG_F", _sid];
	_c pushBack format["%1I_support_Mort_F", _sid];
	_c pushBack format["%1I_helicrew_F", _sid];
	_c pushBack format["%1I_helipilot_F", _sid];
	_c pushBack format["%1I_pilot_F", _sid];
	_c pushBack format["%1I_Soldier_LAT2_F", _sid];
	_c pushBack format["%1I_soldier_UAV_F", _sid];
	_c pushBack format["%1I_soldier_UAV_06_F", _sid];
	_c pushBack format["%1I_soldier_UAV_06_medical_F", _sid];
	
	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};	
};



// Barracks Upgrade Level 2
// ------------------------

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _tech_level) then {
	_building_time = [CTI_FACTORY_BARRACKS,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_INFANTRY,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=_baseUnitValue*CTI_ECONOMY_RESEARCH_MULTI/100;

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=_armedUnitValue*CTI_ECONOMY_RESEARCH_MULTI/100;
	

	// List of units
	// unarmed units
	_c pushBack format["%1I_Officer_Parade_F", _sid];
	_c pushBack format["%1I_Officer_Parade_Veteran_F", _sid];
	
	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};

	// List of units
	_c pushBack format["%1I_Soldier_AAA_F", _sid];
	_c pushBack format["%1I_Soldier_AAT_F", _sid];
	_c pushBack format["%1I_Soldier_M_F", _sid];
	_c pushBack format["%1I_Soldier_AA_F", _sid];
	_c pushBack format["%1I_Soldier_AT_F", _sid];
	_c pushBack format["%1I_officer_F", _sid];
	_c pushBack format["%1I_Soldier_SL_F", _sid];
	_c pushBack format["%1I_Soldier_TL_F", _sid];
	
	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_BARRACKS;
		_s pushBack "";
		_d pushBack 5;	
	};	
};

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_AAF_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

// Light Factory Upgrade Level 0
// -----------------------------

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for light units
	_lightUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,0.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=_baseUnitValue*(CTI_ECONOMY_RESEARCH_MULTI/100);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=_researchedUnitValue+(CTI_ECONOMY_PRIZE_ARMED*_tech_level);
	
	// List of units
	// very light units
	_c pushBack format["%1I_Quadbike_01_F", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _lightUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};
	
	// light units
	_c pushBack format["%1I_MRAP_03_F", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};

	// armed units
	_c pushBack format["%1I_MRAP_03_gmg_F", _sid];
	_c pushBack format["%1I_MRAP_03_hmg_F", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};
};

// Light Factory Upgrade Level 1
// -----------------------------

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _tech_level) then {
	_building_time = [CTI_FACTORY_LIGHT,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// unarmed units
	_c pushBack format["%1I_Truck_02_transport_F", _sid];
	_c pushBack format["%1I_Truck_02_covered_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};

	// armed units
	_c pushBack format["%1I_APC_Wheeled_03_cannon_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "";
		_d pushBack 10;
	};

	// SPECIAL CASES - Vehicles that need scripting
	_c pushBack format["%1I_Truck_02_medical_F", _sid];		//medic
	_p pushBack '';
	if(CTI_RESPAWN_MOBILE <= 0) then {
		_n pushBack 'Sanitaeter (Heal only)';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	} else {
		_n pushBack 'Sanitaeter (Mobile Respawn)';
		_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
	};
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_LIGHT;
	_s pushBack "service-medic";
	_d pushBack 10;
};

//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_AAF_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// unarmed units
	_c pushBack format["%1I_LT_01_scout_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
	};

	// armed units
	_c pushBack format["%1I_LT_01_cannon_F", _sid];
	_c pushBack format["%1I_APC_tracked_03_cannon_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
	};
};

// Heavy Factory Upgrade Level 1
// -----------------------------

//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_AAF_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// armed units but light ones
	_c pushBack format["%1I_LT_01_AT_F", _sid];
	_c pushBack format["%1I_LT_01_AA_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
	};
};

// Heavy Factory Upgrade Level 2
// -----------------------------

//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_AAF_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _tech_level) then {
	_building_time = [CTI_FACTORY_HEAVY,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_TRACKED,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// armed units but light ones
	_c pushBack format["%1I_MBT_03_cannon_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_HEAVY;
		_s pushBack "";
		_d pushBack 10;
	};
};

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory._matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_CSAT_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

// Air Factory Upgrade Level 0
// ---------------------------

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// unarmed units
	_c pushBack format["%1I_Heli_Transport_02_F", _sid];
	_c pushBack format["%1I_Heli_light_03_unarmed_F", _sid];

	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_AIR;
		_s pushBack "";
		_d pushBack 10;
	};
};

// Air Factory Upgrade Level 1
// ---------------------------

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// armed heli
	_c pushBack format["%1I_Heli_light_03_dynamicLoadout_F", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack _baseUnitValue;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;

	// planes
	_c pushBack format["%1I_Plane_Fighter_03_dynamicLoadout_F", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack _researchedArmedUnitValue;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
};


// Air Factory Upgrade Level 2
// ---------------------------

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
	_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_AIR,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// armed UAV
	_c pushBack format["%1I_UAV_02_dynamicLoadout_F", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack _armedUnitValue;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;

	// planes
	_c pushBack format["%1I_Plane_Fighter_04_F", _sid];
	_p pushBack '';
	_n pushBack '';
	_o pushBack _researchedArmedUnitValue;
	_t pushBack _building_time;
	_u pushBack _tech_level;
	_f pushBack CTI_FACTORY_AIR;
	_s pushBack "";
	_d pushBack 10;
};

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_CSAT_ID, CTI_VAN_ID] call CTI_CO_FNC_GetTechmatrix;

// Naval Factory Upgrade Level 0
// -----------------------------

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _matrix_cnt) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// unarmed units
	_c pushBack format["%1I_Boat_Transport_01_F", _sid];
	_c pushBack format["%1I_SDV_01_F", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do {
		_p pushBack '';
		_n pushBack '';
		_o pushBack _baseUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_NAVAL;
		_s pushBack "";
		_d pushBack 10;
	};
};

// Naval Factory Upgrade Level 1
// -----------------------------

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _matrix_cnt) then {
	_building_time = [CTI_FACTORY_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

	// Calculate Unit Values
	// base unit value for this tech level
	_baseUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an armed unit in this tech level
	_armedUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value researched/upgraded unit in this tech level
	_researchedUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,false,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// base unit value of an researched/upgraded armed unit in this tech level
	_researchedArmedUnitValue=([CTI_ECONOMY_PRIZE_NAVAL,_tech_level,true,1.5] call CTI_CO_FNC_GetCalculatedUnitsPrize);

	// List of units
	// armed units
	_c pushBack format["%1I_Boat_Armed_01_minigun_F", _sid];
	
	//set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _p;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do {
		_p pushBack '';
		_n pushBack '';
		_o pushBack _armedUnitValue;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_NAVAL;
		_s pushBack "";
		_d pushBack 10;
	};
};

//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

// Calculate Unit Values
// base unit value for this tech level
_baseUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

// base unit value of an armed unit in this tech level
_armedUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

_c pushBack format["%1I_Truck_02_box_F", _sid];					//Repairtruck
_p pushBack '';
_n pushBack 'Repair Truck';
_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack "service-repairtruck";
_d pushBack 10;
	
_c pushBack format["CTI_Salvager_%1", _faction];
_p pushBack '';
_n pushBack 'Salvager Truck';
_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack [format["%1I_Truck_02_covered_F", _sid],"salvager"];
_d pushBack 10;
	
_c pushBack format["CTI_Salvager_Independent_%1", _faction];
_p pushBack '';
_n pushBack 'Salvager Truck';
_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_REPAIR;
_s pushBack [format["%1I_Truck_02_covered_F", _sid],"salvager-independent"];
_d pushBack 10;

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_tech_level = 0;
_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

// Calculate Unit Values
// base unit value for this tech level
_baseUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize);

// base unit value of an armed unit in this tech level
_armedUnitValue=([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);

_c pushBack format["%1I_Truck_02_ammo_F", _sid];					//Ammotruck
_p pushBack '';
_n pushBack 'Ammo Truck';
_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-ammotruck";
_d pushBack 10;	

_c pushBack format["%1I_Truck_02_fuel_F", _sid];					//Fueltruck
_p pushBack '';
_n pushBack 'Fuel Truck';
_o pushBack ((CTI_ECONOMY_PRIZE_WHEELED*(((_tech_level+1)*CTI_ECONOMY_LEVEL_MULTI)/100))+(CTI_ECONOMY_PRIZE_ARMED*(_tech_level+1)));
_t pushBack _building_time;
_u pushBack _tech_level;
_f pushBack CTI_FACTORY_AMMO;
_s pushBack "service-fueltruck";
_d pushBack 10;

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_resistance.sqf", format["units declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";
