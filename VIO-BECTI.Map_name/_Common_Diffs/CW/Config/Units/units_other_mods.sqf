private ["_side", "_faction", "_sid", "_building_time", "_tech_level", "_upgrade_levels", "_cntstart", "_cntend", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_unitsprise", "_sideID"];

_side = _this;
_sid = "";
_building_time = 10;
_tech_level = 0;
_sideID = _side call CTI_CO_FNC_GetSideID;

switch (_side) do {
	case west: {/*_sid = "VIOC_B_";*/_faction = "West";};
	case east: {/*_sid = "VIOC_O_";*/_faction = "East";};
	case resistance: {/*_sid = "VIOC_I_";*/_faction = "Resistance";};
	default {_sid = "";_faction = "";};
};

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,-1,-1,-1,1,3,4,CTI_ECONOMY_LEVEL_GEAR,-1]; 
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

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\units_other_mods.sqf", format["starting units declaration: _sid: [%1] | _faction: [%2]", _sid, _faction]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\units_other_mods.sqf", format["%1,%2,%3,%4 == %5 ?", CTI_BW_SIDE, CTI_NVA_SIDE, CTI_US_SIDE, CTI_SOV_SIDE, _sideID]] call CTI_CO_FNC_Log;
};

//*********************************************************************************************************************************************
//											Infantry units																					  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.

//*********************************************************************************************************************************************
//											Wheeled Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.

if(CTI_ADDON_CHARLIECO > 0 && _side != resistance) then {
	if(_side == west) then {
		_c pushBack format["%1chvsavar_ivecoar", _sid];				//medic
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'Red Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'Red Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;	

		_c pushBack format["%1chmaster2_ap", _sid];				//medic
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'White Medic (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'White Medic (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;
	} else {
		_c pushBack format["%1chdefender_vsavhr", _sid];				//medic
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'Medic Red (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'Medic Red (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;	

		_c pushBack format["%1chmerc_amb", _sid];				//medic
		_p pushBack '';
		if(CTI_RESPAWN_MOBILE <= 0) then {
			_n pushBack 'Medic White (Heal only)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,false] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		} else {
			_n pushBack 'Medic White (Mobile Respawn)';
			_o pushBack ([CTI_ECONOMY_PRIZE_WHEELED,_tech_level,true] call CTI_CO_FNC_GetCalculatedUnitsPrize);
		};
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_LIGHT;
		_s pushBack "service-medic";
		_d pushBack 10;
	};
};


//*********************************************************************************************************************************************
//											Tracked Vehicles																				  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.

//*********************************************************************************************************************************************
//											AIR - Choppers and Planes																		  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
//_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_GM_ID] call CTI_CO_FNC_GetTechmatrix;

//check if the parameter allows us to load SABs units for all sides or only
//for west/ind and load the matrix of this nation
_loadSabPlanes = false;
switch (_side) do {
	case west: {
		_sid = "_b";
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG21_OPFOR")) then {_loadSabPlanes = true};
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_SABAIR_ID] call CTI_CO_FNC_GetTechmatrix;
	};
	case east: {
		_sid = "_o";
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG21_OPFOR") && CTI_AIR_ADDON >= 1) then {_loadSabPlanes = true};
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_SABAIR_ID] call CTI_CO_FNC_GetTechmatrix;
	};
	case resistance: {
		_sid = "_i";
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG21_OPFOR") ) then {_loadSabPlanes = true};
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NPOC_ID, CTI_SABAIR_ID] call CTI_CO_FNC_GetTechmatrix;
	};
	default {
		_sid = "";
	};
};

if(_loadSabPlanes) then {
	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;

		if (isClass(configFile >> "CfgVehicles" >> format["sab_panther%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_panther%1", _sid];//Mai 1949					Jagdbomber
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_t28trojan%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_t28trojan%1", _sid];//1950						Trainingsflugzeug	
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_mystere%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_mystere%1", _sid];//1954						Jagdbomber	
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_fiat%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_fiat%1", _sid];//August 1956				Erdkampf- und Aufklärungsflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_jaguar%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_jaguar%1", _sid];//1956					Jagdflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_magister%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_magister%1", _sid];//1957						Strahltrainer
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_etendard%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_etendard%1", _sid];//Mai 1958					trägergestütztes Jagdflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_f104%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_f104%1", _sid];//Februar 1958				Abfangjäger
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		if (isClass(configFile >> "CfgVehicles" >> format["sab_mirageiv%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_mirageiv%1", _sid];//Oktober 1964				Strategischer Bomber
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_sf260%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_sf260%1", _sid];//Juli 1964					Trainingsflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_f11tiger%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_f11tiger%1", _sid];//1973					Jagdbomber
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_pc7%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_pc7%1", _sid];//1978						Schulflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_alphajet%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_alphajet%1", _sid];//1979						Leichter Jagdbomber	
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_baehawk%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_baehawk%1", _sid];//1974						Erdkampfflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_baehawk%1_2", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_baehawk%1_2", _sid];//1974						Erdkampfflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_mb339%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_mb339%1", _sid];//August 1979				Leichtes Erdkampfflugzeug
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		if (isClass(configFile >> "CfgVehicles" >> format["sab_m2000%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_m2000%1", _sid];//Juni 1984					Mehrzweckkampfflugzeug
			};	
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_pc9%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_pc9%1", _sid];//Mai 1984					Schulflugzeug
			};
		};
		if (isClass(configFile >> "CfgVehicles" >> format["sab_t45goshawk%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_t45goshawk%1", _sid];//1991						Trainingsflugzeug
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//pc21															Juli 2002					Schulflugzeug
		if (isClass(configFile >> "CfgVehicles" >> format["sab_pc21%1", _sid])) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["sab_pc21%1", _sid];	
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
};

_sid = "";
/*switch (_side) do {
	case west: {_sid = "";};
	case east: {_sid = "";};
	case resistance: {_sid = "";};
	default {_sid = "";};
};*/

//Pook Soviet Air Force Pack
if(CTI_SOV_SIDE == _sideID || CTI_NVA_SIDE == _sideID) then {
	_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_POOKAIR_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Mikojan-Gurewitsch MiG-21		Dezember 1958	Abfangjäger
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG21_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_MIG21_OPFOR", _sid];	
			};	
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Mikojan-Gurewitsch MiG-23		1970			Abfangjäger (M), Jagdbomber (B)
		if (isClass(configFile >> "CfgVehicles" >> "pook_Mig23_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_Mig23_OPFOR", _sid];	
			};	
		};
		//Mikojan-Gurewitsch MiG-25		1970			Abfangjäger
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG25_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_MIG25_OPFOR", _sid];	
			};	
		};
		//Mikojan-Gurewitsch MiG-27		1975			Jagdbomber
		if (isClass(configFile >> "CfgVehicles" >> "pook_Mig27_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_Mig27_OPFOR", _sid];	
			};	
		};
		//Suchoi Su-22					1976			Jagdbomber
		if (isClass(configFile >> "CfgVehicles" >> "pook_Su22_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_Su22_OPFOR", _sid];	
			};	
		};
		//Jakowlew Jak-38				1977			VTOL-Kampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "pook_YAK38_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_YAK38_OPFOR", _sid];
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Mikojan-Gurewitsch MiG-31		1981			Abfangjäger
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG31_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_MIG31_OPFOR", _sid];
			};
		};
		//Mikojan-Gurewitsch MiG-29		Juni 1983		Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG29_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_MIG29_OPFOR", _sid];
				_c pushBack format["%1pook_MIG29SM_OPFOR", _sid];
			};
		};
		//Suchoi Su-27					Dezember 1984	Luftüberlegenheitsjäger
		if (isClass(configFile >> "CfgVehicles" >> "pook_SU27_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_SU27_OPFOR", _sid];
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Suchoi Su-30					14. April 1992	Langstreckenabfangjäger/Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "pook_SU30_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_SU30_OPFOR", _sid];
				_c pushBack format["%1pook_SU30M_OPFOR", _sid];
			};
		};
		//MIG-29 Fulcrum AWS											Juni 1983					Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "Mig29AWS_rus")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1Mig29AWS_rus", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1Mig29AWS_SMT_rus", _sid];
			};			
		};
		//The Sukhoi Su-33 Flanker-D									1994						Luftüberlegenheitsjäger
		if (isClass(configFile >> "CfgVehicles" >> "Su33_Protatype_PT_2")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1Su33_Protatype_PT_2", _sid];	
			};	
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//RSK MiG-35					2019			Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "pook_MIG35_OPFOR")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_MIG35_OPFOR", _sid];
			};
		};
		//SU-34SM FULLBACK-D AWS										9. Dezember 2011				Jagdbomber
		if (isClass(configFile >> "CfgVehicles" >> "AWS_SU34_genericopfor_BOMBER")) then {
			if(CTI_AIR_ADDON >= 1) then {
				_c pushBack format["%1AWS_SU34_RU_BOMBER", _sid];	
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};
//***********************************************************************************************************************************************
//											Nation specific units																				*
//***********************************************************************************************************************************************
//Level 0
//German Bundeswehr Mod is active
if(CTI_BW_SIDE == _sideID) then {
	_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BW_ID, CTI_BWA3_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Panavia Tornado AWS and variants							1980						Jagdbomber
		if (isClass(configFile >> "CfgVehicles" >> "Tornado_AWS_GER")) then {
			//loading with BW-Mod / GM
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1Tornado_AWS_GER", _sid];	
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1Tornado_AWS_ecr_ger", _sid];						//Suppression of Enemy Air Defenses (SEAD)
				_c pushBack format["%1Tornado_AWS_camo_ger", _sid];
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= (_tech_level+1)) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Eurofighter Typhoon AWS										Juli 2006					Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "EAWS_EF2000_GER_CAP")) then {	
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1EAWS_EF2000_GER_CAP", _sid];
			};		
		};
		//pook_EF2000													Juli 2006					Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {	
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1pook_EF2000_BLUFOR", _sid];
			};		
		};
		//Project Lightning - F-35B Armaverse Version					31. Juli 2015				Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F35B_MFG1")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_F35B_MFG1", _sid];//GER	
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F35B_MFG2", _sid];//GER
			};	
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};	
};
/*
//upcomming British Forces
if(CTI_BAF_SIDE == _sideID) then {
	_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
	_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_BAF_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;

	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//AV-8B Harrier 2												April 1969				VTOL-Erdkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_AV8B_GR9A_2")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_AV8B_GR9A_2", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_AV8B_GR7A_Lucy", _sid];
			};	
		};
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 3) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Panavia Tornado AWS and variants							1980						Jagdbomber
		if (isClass(configFile >> "CfgVehicles" >> "Tornado_AWS_UK_DS")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1Tornado_AWS_camo_uk", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1Tornado_AWS_ADV_uk", _sid];
			};
			if(CTI_AIR_ADDON >= 3) then {
				_c pushBack format["%1Tornado_AWS_UK_DS", _sid];	
				_c pushBack format["%1Tornado_AWS_UK_617", _sid];
			};		
		};
		//F/A-18 Hornet												7. Januar 1983				Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F18C_RCAF")) then {
			///BAF
			if(CTI_AIR_ADDON >= 0) then {	
				_c pushBack format["%1FIR_F18C_RAAF", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F18C_RCAF", _sid];
			};
		};
	};
	if(CTI_ECONOMY_LEVEL_AIR >= 4) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//Eurofighter Typhoon AWS										Juli 2006					Mehrzweckkampfflugzeug
		//if (isClass(configFile >> "CfgVehicles" >> "EAWS_EF2000_UK_CAP")) then {
		//	if(CTI_AIR_ADDON >= 0) then {
		//		_c pushBack format["%1EAWS_EF2000_UK_CAP", _sid];
		//	};
		//	if(CTI_AIR_ADDON >= 2) then {	
		//		_c pushBack format["%1EAWS_EF2000_rafhist_CAP", _sid];
		//	};			
		//};
		//EA-18G Growler												22. September 2009			EloKa-Kampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "EA18G_RAAF") && CTI_US_SIDE != _sideID) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1EA18G_RAAF", _sid];
			};
		};
		//Project Lightning - F-35B Armaverse Version					31. Juli 2015				Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F35B_RAF01")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_F35B_RAF01", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F35B_RAF02", _sid];
			};	
		};
	};
};*/
if(CTI_US_SIDE == _sideID) then {
	_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
	if(CTI_RHS_ADDON > 0) then {
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_RHS_ID] call CTI_CO_FNC_GetTechmatrix;
	} else {
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_CUP_ID] call CTI_CO_FNC_GetTechmatrix;
	}; 

	_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//AV-8B Harrier 2												April 1969				VTOL-Erdkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_AV8B_VMA223")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_AV8B_VMA223", _sid];		
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_AV8B_NA_VMA211", _sid];
				_c pushBack format["%1FIR_AV8B_VMA211_OLD", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA223_OLD", _sid];
				_c pushBack format["%1FIR_AV8B_VMA231_02", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA311", _sid];
			};
			if(CTI_AIR_ADDON >= 3) then {
				_c pushBack format["%1FIR_AV8B_VMA214_01", _sid];	//VMA214
				_c pushBack format["%1FIR_AV8B_VMA214_02", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_03", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_04", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_05", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_06", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_07", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_08", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_09", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_11", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_12", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_15", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_20", _sid];	
				_c pushBack format["%1FIR_AV8B_VMA214_22", _sid];
			};	
		};
		//F-14 Tomcat													//September 1974			Abfangjäger
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F14A_Iceman")) then {
			if(CTI_AIR_ADDON >= 0) then {
				//skin pack 1
				_c pushBack format["%1FIR_F14A_VF213_First", _sid];
				_c pushBack format["%1FIR_F14B_VF102", _sid];			
				_c pushBack format["%1FIR_F14D_VF213_2001", _sid];	
				
				_c pushBack format["%1FIR_F14A_Iceman", _sid];	
				_c pushBack format["%1FIR_F14A_Maverick", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F14A_VF213_Early", _sid];	
				_c pushBack format["%1FIR_F14A_VF213_95low", _sid];	
				_c pushBack format["%1FIR_F14A_VF213_95high", _sid];	
				_c pushBack format["%1FIR_F14D_VF213_AJ200", _sid];	
				_c pushBack format["%1FIR_F14D_VF213_AJ205", _sid];	
				_c pushBack format["%1FIR_F14D_VF213_AJ207", _sid];	
				_c pushBack format["%1FIR_F14D_VF213_AJ211", _sid];
				
				_c pushBack format["%1FIR_F14A_HBK1", _sid];	
				_c pushBack format["%1FIR_F14A_NSAWC", _sid];//blue	
				_c pushBack format["%1FIR_F14A_VF1", _sid];	
				_c pushBack format["%1FIR_F14A_VF111", _sid];	
				_c pushBack format["%1FIR_F14A_VF114", _sid];	
				_c pushBack format["%1FIR_F14A_VF124", _sid];	
				_c pushBack format["%1FIR_F14A_VF14", _sid];	
				_c pushBack format["%1FIR_F14A_VF143", _sid];	
				_c pushBack format["%1FIR_F14A_VF154", _sid];	
				_c pushBack format["%1FIR_F14A_VF191", _sid];	
				_c pushBack format["%1FIR_F14A_VF194", _sid];	
				_c pushBack format["%1FIR_F14A_VF21", _sid];	
				_c pushBack format["%1FIR_F14A_VF211", _sid];	
				_c pushBack format["%1FIR_F14A_VF24", _sid];	
				_c pushBack format["%1FIR_F14A_VF33", _sid];	
				_c pushBack format["%1FIR_F14A_VF41", _sid];	
				_c pushBack format["%1FIR_F14A_VF51", _sid];	
				_c pushBack format["%1FIR_F14A_VF84", _sid];	
				_c pushBack format["%1FIR_F14A_VX4", _sid];//black
				_c pushBack format["%1FIR_F14B_VF103_Sluggers", _sid];	
				_c pushBack format["%1FIR_F14B_VF103", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_ChristmasSpecial", _sid];	
				_c pushBack format["%1FIR_F14B_VF11", _sid];	
				_c pushBack format["%1FIR_F14B_VF142", _sid];	
				_c pushBack format["%1FIR_F14B_VF32", _sid];	
				_c pushBack format["%1FIR_F14B_VF74", _sid];		
				_c pushBack format["%1FIR_F14D_Trigger", _sid];	
				_c pushBack format["%1FIR_F14D_VF101", _sid];	
				_c pushBack format["%1FIR_F14D_VF2", _sid];	
				_c pushBack format["%1FIR_F14D_VF213", _sid];	
				_c pushBack format["%1FIR_F14D_VF31CAG", _sid];
			};
			if(CTI_AIR_ADDON >= 3) then {
				//skin pack 2
				_c pushBack format["%1FIR_F14A_VF201_HIVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF201_LOVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF202_HIVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF202_LOVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF301_HIVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF301_LOVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF302_HIVIZ", _sid];	
				_c pushBack format["%1FIR_F14A_VF302_LOVIZ", _sid];	
				//skin pack 3
				_c pushBack format["%1FIR_F14A_VF101_A101", _sid];	
				_c pushBack format["%1FIR_F14B_VF101_B101", _sid];	
				_c pushBack format["%1FIR_F14B_VF101_B101_2", _sid];	
				_c pushBack format["%1FIR_F14B_VF101_TOMATO", _sid];	
				_c pushBack format["%1FIR_F14D_VF101_D163", _sid];
				
				_c pushBack format["%1FIR_F14B_VMFA232CAG", _sid];	
				_c pushBack format["%1FIR_F14B_VMFA232", _sid];	
				_c pushBack format["%1FIR_F14B_VMFA451CAG", _sid];	
				_c pushBack format["%1FIR_F14B_VMFA451", _sid];	
				_c pushBack format["%1FIR_F14B_VMFA531CAG", _sid];	
				_c pushBack format["%1FIR_F14B_VMFA531", _sid];	
				
				_c pushBack format["%1FIR_F14B_VF103_AA100", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA101", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA102", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA103", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA104", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA105", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA107", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA110", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA111", _sid];	
				_c pushBack format["%1FIR_F14B_VF103_AA112", _sid];	
				
				_c pushBack format["%1FIR_F14A_VF154_NF100", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF101", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF102", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF103", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF105", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF106", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF107", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF110", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF111", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF112", _sid];	
				_c pushBack format["%1FIR_F14A_VF154_NF113", _sid];	
				
				_c pushBack format["%1FIR_F14D_VF31_AJ100_Last", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ100", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ101_Last", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ101", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ102_Last", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ102", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ103_Last", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ103", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ104", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ105", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ106", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ107", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ110", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ111_Christine", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ111", _sid];	
				_c pushBack format["%1FIR_F14D_VF31_AJ112", _sid];
			};
		};
		//F-15 Eagle													November 1974				Mehrzweckkampfflugzeug/Luftüberlegenheitsjäger
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F15A_BT")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_F15A_BT", _sid];	
				_c pushBack format["%1FIR_F15B_5FIS", _sid];
				_c pushBack format["%1FIR_F15C_AK_CFT", _sid];
				_c pushBack format["%1FIR_F15D_LN", _sid];	
				_c pushBack format["%1FIR_F15E_Demo", _sid];
				_c pushBack format["%1FIR_F15SE_CR", _sid];	
			};				
			if(CTI_AIR_ADDON >= 2) then {	
				_c pushBack format["%1FIR_F15A_318FIS_1", _sid];	
				_c pushBack format["%1FIR_F15A_318FIS_2", _sid];
				_c pushBack format["%1FIR_F15B_318FIS", _sid];	
				_c pushBack format["%1FIR_F15B_48FIS", _sid];	
				_c pushBack format["%1FIR_F15C_FL", _sid];	
				_c pushBack format["%1FIR_F15C_LN", _sid];
				_c pushBack format["%1FIR_F15E_LN_492", _sid];	
				_c pushBack format["%1FIR_F15E_LN_494", _sid];
				_c pushBack format["%1FIR_F15SE_LA", _sid];			
			};	
			if(CTI_AIR_ADDON >= 3) then {	
				_c pushBack format["%1FIR_F15A_5FIS", _sid];	
				_c pushBack format["%1FIR_F15A_AK_43d", _sid];	
				_c pushBack format["%1FIR_F15A_BT_Tigermeet", _sid];	
				_c pushBack format["%1FIR_F15A_FF", _sid];
				_c pushBack format["%1FIR_F15A_HO_7th", _sid];	
				_c pushBack format["%1FIR_F15C_BT_22TFS", _sid];	
				_c pushBack format["%1FIR_F15C_BT_36TFW", _sid];	
				_c pushBack format["%1FIR_F15C_CR_32TFS", _sid];	
				_c pushBack format["%1FIR_F15C_CFT_57FIS", _sid];	
				_c pushBack format["%1FIR_F15C_ZZ_12TFS", _sid];	
				_c pushBack format["%1FIR_F15C_ZZ_18TFW", _sid];	
				_c pushBack format["%1FIR_F15C_ZZ_44TFS", _sid];	
				_c pushBack format["%1FIR_F15C_ZZ_67TFS", _sid];
				_c pushBack format["%1FIR_F15C_67FS", _sid];	
				_c pushBack format["%1FIR_F15E_GARUDA1", _sid];	
				_c pushBack format["%1FIR_F15E_AK_11AF", _sid];		
				_c pushBack format["%1FIR_F15E_MO_389", _sid];	
				_c pushBack format["%1FIR_F15E_SJ", _sid];	
				_c pushBack format["%1FIR_F15E_SJ_334", _sid];	
				_c pushBack format["%1FIR_F15E_SJ_335", _sid];	
				_c pushBack format["%1FIR_F15E_SJ_336", _sid];	
				_c pushBack format["%1FIR_F15SE_LN", _sid];	
			};
		};
		//A-10 Warthog												März 1977					Erdkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_A10A_MD")) then {
			if(CTI_AIR_ADDON >= 0) then {	
				//skinpack 3
				_c pushBack format["%1FIR_A10C_MD", _sid];	
			};
			if(CTI_AIR_ADDON >= 2) then {	
				//skinpack 3
				_c pushBack format["%1FIR_A10C_FR", _sid];	
				_c pushBack format["%1FIR_A10C_47FS_Tigress", _sid];	
				_c pushBack format["%1FIR_A10C_FT", _sid];		
				_c pushBack format["%1FIR_A10C_OS", _sid];
				//skinpack 2
				_c pushBack format["%1FIR_A10A_MD", _sid];//white
				_c pushBack format["%1FIR_A10A_Camo1", _sid];	
				_c pushBack format["%1FIR_A10A_Camo2", _sid];	
				_c pushBack format["%1FIR_A10A_47fs", _sid];//white	
				_c pushBack format["%1FIR_A10A_WR_Bonus", _sid];	
				_c pushBack format["%1FIR_A10A_74fs", _sid];//white		
				_c pushBack format["%1FIR_A10A_Grey_Bonus", _sid];	
				_c pushBack format["%1FIR_A10A_Sand_Bonus", _sid];	
				_c pushBack format["%1FIR_A10A_Snow_Bonus", _sid];
			};
			if(CTI_AIR_ADDON >= 3) then {
				//skinpack 1 camo
				_c pushBack format["%1FIR_A10A_Fulda_SB_608", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_SB_620", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_LM", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_AN", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_NV", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_IN", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_BD", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_NO", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_AR_509TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_AR_511TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_CT", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_EL_74TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_EL_75TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_EL_76TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_MA", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_MB_353TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_MB_355TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_MB_356TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_MD", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_NY", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_PA", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_WI", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_WR_510TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_WR_78TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_WR_91TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_WR_92TFS", _sid];	
				_c pushBack format["%1FIR_A10A_Fulda_WR_White", _sid];
			};
		};
		//F-16 Fighting Falcon										August 1978				Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F16C_930550_sqd")) then {
			if(CTI_AIR_ADDON >= 0) then {
				//55th USAF
				_c pushBack format["%1FIR_F16C_930550_sqd", _sid];	
				_c pushBack format["%1FIR_F16D_900482", _sid];	
			};	
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F16C_900830", _sid];	
				_c pushBack format["%1FIR_F16C_910345", _sid];	
				_c pushBack format["%1FIR_F16C_910355", _sid];	
				_c pushBack format["%1FIR_F16C_910378", _sid];	
				_c pushBack format["%1FIR_F16C_910381", _sid];	
				_c pushBack format["%1FIR_F16C_910384", _sid];	
				_c pushBack format["%1FIR_F16C_910385", _sid];	
				_c pushBack format["%1FIR_F16C_910387", _sid];	
				_c pushBack format["%1FIR_F16C_910389", _sid];	
				_c pushBack format["%1FIR_F16C_910390", _sid];	
				_c pushBack format["%1FIR_F16C_910394", _sid];	
				_c pushBack format["%1FIR_F16C_910395", _sid];	
				_c pushBack format["%1FIR_F16C_923923", _sid];	
				_c pushBack format["%1FIR_F16C_930532", _sid];	
				_c pushBack format["%1FIR_F16C_930540", _sid];	
				_c pushBack format["%1FIR_F16C_930546", _sid];	
				_c pushBack format["%1FIR_F16C_930552", _sid];	
				_c pushBack format["%1FIR_F16C_940045", _sid];	
				_c pushBack format["%1FIR_F16C_940049", _sid];	
				_c pushBack format["%1FIR_F16C_960084", _sid];	
				_c pushBack format["%1FIR_F16C_970110", _sid];	
				_c pushBack format["%1FIR_F16C_970111", _sid];	
				_c pushBack format["%1FIR_F16C_980003", _sid];
				//55th USAF
				//camo pack 4
				_c pushBack format["%1FIR_F16C_AS_2", _sid];	
				_c pushBack format["%1FIR_F16C_AS_3", _sid];	
				_c pushBack format["%1FIR_F16C_AS_1", _sid];	
				_c pushBack format["%1FIR_F16C_BS", _sid];	
				_c pushBack format["%1FIR_F16C_LS", _sid];	
				_c pushBack format["%1FIR_F16C_PostDepot", _sid];	
				_c pushBack format["%1FIR_F16C_Interim", _sid];	
				_c pushBack format["%1FIR_F16C_Shark", _sid];	
				_c pushBack format["%1FIR_F16C_WAHGV", _sid];	
				_c pushBack format["%1FIR_F16C_WASplinter1", _sid];	
				_c pushBack format["%1FIR_F16C_WASplinter2", _sid];	
				_c pushBack format["%1FIR_F16D_AK_Flanker", _sid];	
				_c pushBack format["%1FIR_F16D_WP_Flanker", _sid];
				//F16D camo pack	
				_c pushBack format["%1FIR_F16D_AV", _sid];	
				_c pushBack format["%1FIR_F16D_WP_Fanton", _sid];	
				_c pushBack format["%1FIR_F16D_WP", _sid];	
				//camo pack 3 states
				_c pushBack format["%1FIR_F16C_ANG_AL", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_AZ", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_FS", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_CA", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_CO", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_DC", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_SI", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_IN", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_IA", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_MN", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_MO", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_NJ", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_NM", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_NY", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_OH", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_OK_DARK", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_OK", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_SC", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_SD", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_TX", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_VT", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_VA", _sid];	
				_c pushBack format["%1FIR_F16C_ANG_WI", _sid];	
				_c pushBack format["%1FIR_F16D_ANG_MN", _sid];	
			};
			if(CTI_AIR_ADDON >= 3) then {
				//77th USAF
				_c pushBack format["%1FIR_F16C_000225", _sid];	
				_c pushBack format["%1FIR_F16C_000226", _sid];	
				_c pushBack format["%1FIR_F16C_017050", _sid];	
				_c pushBack format["%1FIR_F16C_017052", _sid];	
				_c pushBack format["%1FIR_F16C_900806", _sid];	
				_c pushBack format["%1FIR_F16C_900821", _sid];	
				_c pushBack format["%1FIR_F16C_910353", _sid];	
				_c pushBack format["%1FIR_F16C_910364", _sid];	
				_c pushBack format["%1FIR_F16C_910368", _sid];	
				_c pushBack format["%1FIR_F16C_910371", _sid];	
				_c pushBack format["%1FIR_F16C_910376_Wing", _sid];	
				_c pushBack format["%1FIR_F16C_910377_sqd", _sid];	
				_c pushBack format["%1FIR_F16C_910380", _sid];	
				_c pushBack format["%1FIR_F16C_910463", _sid];	
				_c pushBack format["%1FIR_F16C_923910", _sid];	
				_c pushBack format["%1FIR_F16C_923920", _sid];	
				_c pushBack format["%1FIR_F16C_930536", _sid];	
				_c pushBack format["%1FIR_F16C_930544", _sid];	
				_c pushBack format["%1FIR_F16C_940041", _sid];	
				_c pushBack format["%1FIR_F16C_940042", _sid];	
				_c pushBack format["%1FIR_F16C_940043", _sid];	
				_c pushBack format["%1FIR_F16C_940044", _sid];	
				_c pushBack format["%1FIR_F16C_940046", _sid];	
				_c pushBack format["%1FIR_F16C_940047", _sid];	
				_c pushBack format["%1FIR_F16D_910476", _sid];	
				//79th USAF
				_c pushBack format["%1FIR_F16C_000218", _sid];	
				_c pushBack format["%1FIR_F16C_000220", _sid];	
				_c pushBack format["%1FIR_F16C_000221", _sid];	
				_c pushBack format["%1FIR_F16C_000222", _sid];	
				_c pushBack format["%1FIR_F16C_000223", _sid];	
				_c pushBack format["%1FIR_F16C_000224", _sid];	
				_c pushBack format["%1FIR_F16C_000227", _sid];	
				_c pushBack format["%1FIR_F16C_017051", _sid];
				_c pushBack format["%1FIR_F16C_900826", _sid];	
				_c pushBack format["%1FIR_F16C_910348", _sid];	
				_c pushBack format["%1FIR_F16C_910369", _sid];	
				_c pushBack format["%1FIR_F16C_910372", _sid];	
				_c pushBack format["%1FIR_F16C_910379_sqd", _sid];	
				_c pushBack format["%1FIR_F16C_910398", _sid];	
				_c pushBack format["%1FIR_F16C_923904", _sid];	
				_c pushBack format["%1FIR_F16C_923906", _sid];	
				_c pushBack format["%1FIR_F16C_930458", _sid];	
				_c pushBack format["%1FIR_F16C_940039", _sid];	
				_c pushBack format["%1FIR_F16C_940048_Wing", _sid];	
				_c pushBack format["%1FIR_F16C_970108", _sid];	
				_c pushBack format["%1FIR_F16C_970109", _sid];	
				_c pushBack format["%1FIR_F16C_990082", _sid];	
				_c pushBack format["%1FIR_F16D_900845", _sid];	
				_c pushBack format["%1FIR_F16D_910468", _sid];	
				_c pushBack format["%1FIR_F16D_910480", _sid];	
				_c pushBack format["%1FIR_F16C_910359", _sid];
				//other camos	
				_c pushBack format["%1FIR_F16C_HO_311FS", _sid];	
				_c pushBack format["%1FIR_F16C_HO_49WG", _sid];	
				_c pushBack format["%1FIR_F16C_HO_8FS", _sid];	
				_c pushBack format["%1FIR_F16C_Ag_arctic", _sid];	
				_c pushBack format["%1FIR_F16C_Ag_flanker", _sid];	
				_c pushBack format["%1FIR_F16C_Ag_lizard", _sid];	
				_c pushBack format["%1FIR_F16C_AV", _sid];	
				_c pushBack format["%1FIR_F16C_CFTTEST", _sid];	
				_c pushBack format["%1FIR_F16C_Makos", _sid];	
				_c pushBack format["%1FIR_F16C_Osan", _sid];	
				_c pushBack format["%1FIR_F16C_HG", _sid];			
				_c pushBack format["%1FIR_F16C_SW_HGV", _sid];	
				_c pushBack format["%1FIR_F16C_WP", _sid];	
				_c pushBack format["%1FIR_F16C_WP_Juvat", _sid];	
				_c pushBack format["%1FIR_F16C_WW", _sid];
				//Ramstein
				_c pushBack format["%1FIR_F16C_RS_512TFS", _sid];	
				_c pushBack format["%1FIR_F16C_RS_400", _sid];	
				_c pushBack format["%1FIR_F16C_RS_526TFS", _sid];	
				_c pushBack format["%1FIR_F16C_RS_86TFW2", _sid];	
				_c pushBack format["%1FIR_F16C_RS_86TFW", _sid];	
				_c pushBack format["%1FIR_F16C_RS_86WG", _sid];	
				//camo pack 1
				_c pushBack format["%1FIR_F16C_SW_Candy", _sid];	
				_c pushBack format["%1FIR_F16C_SW_Hammer", _sid];	
				_c pushBack format["%1FIR_F16C_SW_Max", _sid];	
				_c pushBack format["%1FIR_F16C_TJ_614TFS", _sid];	
				_c pushBack format["%1FIR_F16C_TJ_228", _sid];	
				_c pushBack format["%1FIR_F16C_TJ_247", _sid];	
				_c pushBack format["%1FIR_F16C_TJ_257", _sid];	
				_c pushBack format["%1FIR_F16C_HL_474", _sid];	
				_c pushBack format["%1FIR_F16C_HL_488", _sid];	
				_c pushBack format["%1FIR_F16C_MY_515", _sid];	
				//camo pack 2
				_c pushBack format["%1FIR_F16C_RS_Special", _sid];	
				_c pushBack format["%1FIR_F16C_HR_301", _sid];	
				_c pushBack format["%1FIR_F16C_RS_302", _sid];	
				_c pushBack format["%1FIR_F16C_HR_393", _sid];	
				_c pushBack format["%1FIR_F16C_SP_546", _sid];	
				_c pushBack format["%1FIR_F16C_WR_216", _sid];	
				_c pushBack format["%1FIR_F16C_SP_225", _sid];	
				_c pushBack format["%1FIR_F16C_WR_254", _sid];	
				_c pushBack format["%1FIR_F16C_TJ_367", _sid];	
				_c pushBack format["%1FIR_F16C_TJ_369", _sid];
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//F/A-18 Hornet												7. Januar 1983				Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F18C_VMFA251CAG")) then {
			if(CTI_AIR_ADDON >= 0) then {	
				_c pushBack format["%1FIR_F18C_VMFA251CAG", _sid];
				_c pushBack format["%1FIR_F18D_VMFAAW533", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {	
				_c pushBack format["%1FIR_F18C_VMFA251", _sid];	
				_c pushBack format["%1FIR_F18C_VMFAAW224CAG", _sid];	
				_c pushBack format["%1FIR_F18C_VMFA232CAG", _sid];	
				_c pushBack format["%1FIR_F18C_VMFA232", _sid];
				_c pushBack format["%1FIR_F18C_VMFA314CAG", _sid];	
				_c pushBack format["%1FIR_F18C_VMFA314", _sid];	
				_c pushBack format["%1FIR_F18D_VMFAAW533CO", _sid];	
				_c pushBack format["%1FIR_F18D_VMF224", _sid];	
			};
			if(CTI_AIR_ADDON >= 3) then {
				_c pushBack format["%1FIR_F18C_MALS11", _sid];	
				_c pushBack format["%1FIR_F18C_MAG31_WW2", _sid];	
				_c pushBack format["%1FIR_F18C_MALS31", _sid];		
				_c pushBack format["%1FIR_F18C_Wildcat_USN", _sid];	
				_c pushBack format["%1FIR_F18C_Hellcat_USN", _sid];	
				_c pushBack format["%1FIR_F18C_Hellcat_USN_Enterprise", _sid];	
				_c pushBack format["%1FIR_F18C_Wildcat_USMC", _sid];	
				_c pushBack format["%1FIR_F18C_VFA106CAG", _sid];	
				_c pushBack format["%1FIR_F18C_VFA106", _sid];	
				_c pushBack format["%1FIR_F18C_VFA131CAG", _sid];	
				_c pushBack format["%1FIR_F18C_VFA131", _sid];	
				_c pushBack format["%1FIR_F18C_VFA15_75year", _sid];	
				_c pushBack format["%1FIR_F18C_VFA15CAG", _sid];	
				_c pushBack format["%1FIR_F18C_VFA15", _sid];
				_c pushBack format["%1FIR_F18D_VMFAAW224_CO", _sid];	
				_c pushBack format["%1FIR_F18D_VMFAAW224_02", _sid];
			};			
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};

	_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
	if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
		_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
		//F-22 Raptor													15. Dezember 2005			Luftüberlegenheitsjäger
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F22_Blue")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_F22_Blue", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F22_TY", _sid];	
			};
			if(CTI_AIR_ADDON >= 3) then {
				_c pushBack format["%1FIR_F22_FF", _sid];
			};
		};
		//EA-18G Growler												22. September 2009			EloKa-Kampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_EA18G_390ECS")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_EA18G_390ECS", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_EA18G_VAQ130", _sid];
				_c pushBack format["%1FIR_EA18G_VAQ136", _sid];
				_c pushBack format["%1FIR_EA18G_VAQ138", _sid];
				_c pushBack format["%1EA18G_VAQ131", _sid];
				_c pushBack format["%1EA18G_129CAG", _sid];	
				_c pushBack format["%1EA18G_137CAG", _sid];	
				_c pushBack format["%1EA18G_139CAG", _sid];	
				_c pushBack format["%1EA18G_141CAG", _sid];	
				_c pushBack format["%1EA18G_142CAG", _sid];	
				_c pushBack format["%1EA18G_209CAG", _sid];
			};
			if(CTI_AIR_ADDON >= 3) then {
				_c pushBack format["%1EA18G_129LOW", _sid];	
				_c pushBack format["%1EA18G_132LOW", _sid];	
				_c pushBack format["%1EA18G_137LOW", _sid];	
				_c pushBack format["%1EA18G_139LOW", _sid];		
				_c pushBack format["%1EA18G_141LOW", _sid];
				_c pushBack format["%1EA18G_142LOW", _sid];	
				_c pushBack format["%1EA18G_209LOW", _sid];
			};
		};
		//Project Lightning - F-35B Armaverse Version					31. Juli 2015				Mehrzweckkampfflugzeug
		if (isClass(configFile >> "CfgVehicles" >> "FIR_F35B_VMFA211")) then {
			if(CTI_AIR_ADDON >= 0) then {
				_c pushBack format["%1FIR_F35B_VMFA211", _sid];
			};
			if(CTI_AIR_ADDON >= 2) then {
				_c pushBack format["%1FIR_F35B_DarkGrey", _sid];	
				_c pushBack format["%1FIR_F35B_VMFA214", _sid];	
			};
			if(CTI_AIR_ADDON >= 3) then {
				_c pushBack format["%1FIR_F35B_VMFA214Special", _sid];
				_c pushBack format["%1FIR_F35B_VMFA251", _sid];		
				_c pushBack format["%1FIR_F35B_VMFA531", _sid];	
			};
		};
		
		//set all other vars in a slope
		_cntstart = count _c;
		_cntend = count _p;
		_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
		for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
			_p pushBack '';
			_n pushBack '';
			_o pushBack _unitsprise;
			_t pushBack _building_time;
			_u pushBack _tech_level;
			_f pushBack CTI_FACTORY_AIR;
			_s pushBack "";
			_d pushBack 10;	
		};
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};
//*********************************************************************************************************************************************
//											Side specific units																				  *
//*********************************************************************************************************************************************
switch(_side) do {
	case west: {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_US_ID, CTI_POOKAIR_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//AV-8B Harrier 2												April 1969				VTOL-Erdkampfflugzeug
			//if (isClass(configFile >> "CfgVehicles" >> "FIR_AV8B_Blank") && CTI_US_SIDE != _sideID && CTI_BAF_SIDE != _sideID) then {
			if (isClass(configFile >> "CfgVehicles" >> "FIR_AV8B_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_AV8B_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_AV8B_NA_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1FIR_AV8B_GR9A_Blank", _sid];	
				};
			};
			//F-14 Tomcat													//September 1974			Abfangjäger
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F14A_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F14A_Blank", _sid];	
					_c pushBack format["%1FIR_F14B_Blank", _sid];	
					_c pushBack format["%1FIR_F14D_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_F14A_ISAF", _sid];	
					_c pushBack format["%1FIR_F14D_AC6", _sid];	
					_c pushBack format["%1FIR_F14B_UNSPACY", _sid];
					_c pushBack format["%1FIR_F14A_A88", _sid];		
					_c pushBack format["%1FIR_F14D_Razgriz", _sid];//black	
					_c pushBack format["%1FIR_F14D_Schnee", _sid];//black	
					_c pushBack format["%1FIR_F14D_VF31_ChristmasSpecial", _sid];
					_c pushBack format["%1FIR_F14D_MIKU", _sid];//manga	
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1FIR_F14A_VFA206", _sid];	
					_c pushBack format["%1FIR_F14A_Wardog", _sid];	
					_c pushBack format["%1FIR_F14A_Wardog2", _sid];	
					_c pushBack format["%1FIR_F14A_Wardog3", _sid];	
					_c pushBack format["%1FIR_F14A_Wardog4", _sid];
				};				
			};
			//F-15 Eagle													November 1974				Mehrzweckkampfflugzeug/Luftüberlegenheitsjäger
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F15C_Blank") && CTI_US_SIDE != _sideID) then {	
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F15C_Blank", _sid];	
					_c pushBack format["%1FIR_F15D_Blank", _sid];	
					_c pushBack format["%1FIR_F15E_Blank", _sid];	
					_c pushBack format["%1FIR_F15SE_Blank", _sid];
				};
				if(CTI_AIR_ADDON >= 2) then {	
					_c pushBack format["%1FIR_F15C_GALM1", _sid];	
					_c pushBack format["%1FIR_F15C_GALM2", _sid];
					_c pushBack format["%1FIR_F15SE_Reaper", _sid];
					//Other decals
					_c pushBack format["%1FIR_F15A_Baz_673", _sid];
					_c pushBack format["%1FIR_F15SE_ROKAF", _sid];
					_c pushBack format["%1FIR_F15K_1st", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					//JPN
					_c pushBack format["%1FIR_F15DJ_202TFS", _sid];	
					_c pushBack format["%1FIR_F15DJ_203TFS", _sid];	
					_c pushBack format["%1FIR_F15DJ_204TFS", _sid];	
					_c pushBack format["%1FIR_F15DJ_303TFS", _sid];	
					_c pushBack format["%1FIR_F15J_JASDF_202TFS", _sid];	
					_c pushBack format["%1FIR_F15J_JASDF_203TFS", _sid];	
					_c pushBack format["%1FIR_F15J_JASDF_204TFS", _sid];	
					_c pushBack format["%1FIR_F15J_JASDF_303TFS", _sid];	
					_c pushBack format["%1FIR_F15J_204TFS_TACMEET", _sid];	
					_c pushBack format["%1FIR_F15J_303TFS_TACMEET", _sid];	
					_c pushBack format["%1FIR_F15J_304TFS", _sid];	
					_c pushBack format["%1FIR_F15J_306TFS", _sid];	
					_c pushBack format["%1FIR_F15J_IRST", _sid];	
					_c pushBack format["%1FIR_F15DJ_ARG1", _sid];		
					_c pushBack format["%1FIR_F15J_ME4_912", _sid];	
					_c pushBack format["%1FIR_F15J_ME4_924", _sid];	
					_c pushBack format["%1FIR_F15J_ME4_945", _sid];	
					_c pushBack format["%1FIR_F15J_ME4_948", _sid];	
					_c pushBack format["%1FIR_F15J_ME4_949", _sid];
				};		
			};
			//A-10 Warthog												März 1977					Erdkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "FIR_A10A_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {	
					_c pushBack format["%1FIR_A10A_Blank", _sid];//white
					_c pushBack format["%1FIR_A10C_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {		
					_c pushBack format["%1FIR_A10A_Blank2", _sid];//camo
					_c pushBack format["%1FIR_A10C_Camo", _sid];
				};
			};
			//F-16 Fighting Falcon										August 1978				Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F16D_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {	
					_c pushBack format["%1FIR_F16C_Blank", _sid];
					_c pushBack format["%1FIR_F16D_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_F16C_MERC", _sid];	
					_c pushBack format["%1FIR_F16C_Blank2", _sid];	
					_c pushBack format["%1FIR_F16C_Blank3", _sid];
					_c pushBack format["%1FIR_F16D_CFTTEST", _sid];	
				};
				if(CTI_AIR_ADDON >= 3) then {
					//Polish
					_c pushBack format["%1FIR_F16C_Polish", _sid];	
					_c pushBack format["%1FIR_F16C_Polish_CFT", _sid];
					_c pushBack format["%1FIR_F16D_Polish_CFT", _sid];
					//ROKAF
					_c pushBack format["%1FIR_F16C_ROKAF_B32", _sid];
					_c pushBack format["%1FIR_F16C_ROKAF_Hess", _sid];	
					_c pushBack format["%1FIR_F16C_ROKAF", _sid];
					_c pushBack format["%1FIR_F16D_ROKAF", _sid];
				};	
			};
			
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//Panavia Tornado AWS and variants							1980						Jagdbomber
			//if (isClass(configFile >> "CfgVehicles" >> "Tornado_AWS_1") && CTI_BAF_SIDE != _sideID && CTI_BW_SIDE != _sideID) then {
			if (isClass(configFile >> "CfgVehicles" >> "Tornado_AWS_1") && CTI_BW_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					//default
					_c pushBack format["%1Tornado_AWS_1", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1Tornado_AWS_50_DS", _sid];
				};	
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1Tornado_AWS_ADV_ita", _sid];						//Air Defence Variant (ADV)	
					_c pushBack format["%1Tornado_AWS_ECR_ita", _sid];						//ECR (electronic combat/reconnaissance)
					_c pushBack format["%1Tornado_AWS_camo_ita", _sid];	
				};
			};
			//MIG-29 Fulcrum AWS											Juni 1983					Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "Mig29AWS_blufor")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1Mig29AWS_blufor", _sid];
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1Mig29AWS_chern", _sid];
					_c pushBack format["%1Mig29AWS_livonia", _sid];	
				};			
			};
			//F/A-18 Hornet												7. Januar 1983				Mehrzweckkampfflugzeug
			//if (isClass(configFile >> "CfgVehicles" >> "FIR_F18C_Blank") && CTI_US_SIDE != _sideID && CTI_BAF_SIDE != _sideID) then {
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F18C_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F18C_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_F18C_Blank_Aggressor", _sid];	
					_c pushBack format["%1FIR_F18C_Scar", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1FIR_F18C_FINNISH", _sid];	
					_c pushBack format["%1FIR_F18D_FINNISH", _sid];	
					_c pushBack format["%1FIR_F18C_SWISS", _sid];
					_c pushBack format["%1FIR_F18D_Swiss", _sid];
					_c pushBack format["%1FIR_F18C_SPAF", _sid];	
					_c pushBack format["%1FIR_F18C_RNZAF", _sid];
					_c pushBack format["%1FIR_F18D_RMAF", _sid];
					_c pushBack format["%1FIR_F18C_ROKAF", _sid];
				};	
			};
			//FA-18 Super Hornet										1999						Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "JS_JC_FA18E")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1JS_JC_FA18E", _sid];//1 seat	
					_c pushBack format["%1JS_JC_FA18F", _sid];//2 seats	
				};
			};
			
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//F-2 Viper ZERO												2000						Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F2A_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F2A_Blank", _sid];
					_c pushBack format["%1FIR_F2B_Blank", _sid];
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_F2A_60Ani", _sid];//1 seat JPN	
					_c pushBack format["%1FIR_F2B_21sq", _sid];//2 seats
				};	
				if(CTI_AIR_ADDON >= 3) then {	
					_c pushBack format["%1FIR_F2A_TACMEET", _sid];	
					_c pushBack format["%1FIR_F2A_IMAS", _sid];//yellow manga
				};
			};
			//F-22 Raptor													15. Dezember 2005			Luftüberlegenheitsjäger
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F22_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F22_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_F22_Blank2", _sid];	
					_c pushBack format["%1FIR_F22_Blank3", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1FIR_F22_Gryphus1", _sid];//unknown icon	
					_c pushBack format["%1FIR_F22_Mobius1", _sid];//unknown icon
				};
			};
			//Eurofighter Typhoon AWS										Juli 2006					Mehrzweckkampfflugzeug
			/*if (isClass(configFile >> "CfgVehicles" >> "EAWS_EF2000_Genericblu_CAP") && CTI_BAF_SIDE != _sideID && CTI_BW_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1EAWS_EF2000_genericartic2_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_genericgray2_CAP", _sid];	
				};					
				if(CTI_AIR_ADDON >= 2) then {	
					_c pushBack format["%1EAWS_EF2000_genericdesert2_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_Genericblu_CAP", _sid];
				};				
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1EAWS_EF2000_ITA51_CAP", _sid];	
					_c pushBack format["%1EAWS_EF2000_specialita_CAP", _sid];	
					_c pushBack format["%1EAWS_EF2000_bel_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_FRA_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_aus_CAP", _sid];	
					_c pushBack format["%1EAWS_EF2000_can_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_poland_CAP", _sid];	
					_c pushBack format["%1EAWS_EF2000_Spa_CAP", _sid];	
					_c pushBack format["%1EAWS_EF2000_spaspecial_CAP", _sid];
				};
			};*/
			//pook_EF2000													Juli 2006					Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_BLUFOR")) then {	
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1pook_EF2000_BLUFOR", _sid];
				};		
			};
			//EA-18G Growler												22. September 2009			EloKa-Kampfflugzeug
			//if (isClass(configFile >> "CfgVehicles" >> "FIR_EA18G_Blank") && CTI_US_SIDE != _sideID && CTI_BAF_SIDE != _sideID) then {
			if (isClass(configFile >> "CfgVehicles" >> "FIR_EA18G_Blank") && CTI_US_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_EA18G_Blank", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_EA18G_NA", _sid];
				};	
			};
			//SU-34SM FULLBACK-D AWS										9. Dezember 2011				Jagdbomber
			if (isClass(configFile >> "CfgVehicles" >> "AWS_SU34_CDF_BOMBER")) then {
				_c pushBack format["%1AWS_SU34_CDF_BOMBER", _sid];	
			};
			//Project Lightning - F-35B Armaverse Version					31. Juli 2015				Mehrzweckkampfflugzeug
			//if (isClass(configFile >> "CfgVehicles" >> "FIR_F35B_Blank1") && CTI_US_SIDE != _sideID && CTI_BAF_SIDE != _sideID && CTI_BW_SIDE != _sideID) then {
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F35B_Blank1") && CTI_US_SIDE != _sideID && CTI_BW_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F35B_Blank1", _sid];
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1FIR_F35B_Blank2", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1FIR_F35B_Arctic", _sid];
				};		
			};
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};

			//Community wish, vanilla drones for both sides for ballance
			if((CTI_CUP_ADDON >= 1 || CTI_RHS_ADDON >= 1) && CTI_AIR_ADDON >= 0 ) then {
				_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;

				_c pushBack format["%1B_UAV_02_dynamicLoadout_F", _sid];	
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};
	};
	case east: {
		_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_SOV_ID, CTI_POOKAIR_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//F-14 Tomcat													September 1974			Abfangjäger
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F14D_ENEMY_TYPE_A")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F14D_ENEMY_TYPE_A", _sid];	
				};
			};
			//A-10 Warthog												März 1977					Erdkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "FIR_A10C_Enemy_Type1")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_A10C_Enemy_Type1", _sid];	
				};
			};
			
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};

		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//Panavia Tornado AWS and variants								1980						Jagdbomber
			if (isClass(configFile >> "CfgVehicles" >> "Tornado_AWS_opf")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1Tornado_AWS_opf", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1Tornado_AWS_ADV_OPF", _sid];	
					_c pushBack format["%1Tornado_AWS_ecr_opf", _sid];
				};		
			};
			//MIG-29 Fulcrum AWS											Juni 1983					Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "Mig29AWS_rus") && CTI_SOV_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {	
					_c pushBack format["%1Mig29AWS_sla", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1Mig29AWS_taki", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1Mig29AWS_chernreb", _sid];
				};	
			};
			//F/A-18 Hornet												7. Januar 1983			Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F18C_Enemy_Type1")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F18C_Enemy_Type1", _sid];	
				};
			};
			//The Sukhoi Su-33 Flanker-D									1994						Luftüberlegenheitsjäger
			if (isClass(configFile >> "CfgVehicles" >> "Su33_Protatype_PT_2") && CTI_SOV_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1Su33_Chine", _sid];	
				};
				if(CTI_AIR_ADDON >= 3) then {	
					_c pushBack format["%1Su33_Chine_PT", _sid];
				};		
			};
			
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//F-22 Raptor													15. Dezember 2005			Luftüberlegenheitsjäger
			if (isClass(configFile >> "CfgVehicles" >> "FIR_F22_ENEMY_TYPE_A")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1FIR_F22_ENEMY_TYPE_A", _sid];	
				};
			};
			//Eurofighter Typhoon AWS										Juli 2006					Mehrzweckkampfflugzeug
			/*if (isClass(configFile >> "CfgVehicles" >> "EAWS_EF2000_Genericopfor_CAP")) then {
				if(CTI_AIR_ADDON >= 2) then {	
					_c pushBack format["%1EAWS_EF2000_Genericopfor_CAP", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {
					_c pushBack format["%1EAWS_EF2000_taki_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_genericartic_CAP", _sid];	
					_c pushBack format["%1EAWS_EF2000_genericdesert_CAP", _sid];
					_c pushBack format["%1EAWS_EF2000_genericgray_CAP", _sid];
				};
			};*/
			//pook_EF2000													Juli 2006					Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_OPFOR")) then {	
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1pook_EF2000_OPFOR", _sid];
				};		
			};
			//SU-35 Flanker E												2009 						Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "JS_JC_SU35")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1JS_JC_SU35", _sid];//CSAT camo
				};	
			};			
			//Sukhoi Su-34													9. Dezember 2011				Jagdbomber
			if (isClass(configFile >> "CfgVehicles" >> "sab_su34_O")) then {
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1sab_su34_O", _sid];
				};	
			};
			//SU-34SM FULLBACK-D AWS										9. Dezember 2011				Jagdbomber
			if (isClass(configFile >> "CfgVehicles" >> "AWS_SU34_genericopfor_BOMBER") && CTI_SOV_SIDE != _sideID) then {
				if(CTI_AIR_ADDON >= 1) then {	
					_c pushBack format["%1AWS_SU34_genericopfor_BOMBER", _sid];	
				};
				if(CTI_AIR_ADDON >= 2) then {	
					_c pushBack format["%1AWS_SU34_plaaf_BOMBER", _sid];
				};
				if(CTI_AIR_ADDON >= 3) then {	
					_c pushBack format["%1AWS_SU34_sla_BOMBER", _sid];	
					_c pushBack format["%1AWS_SU34_TK_BOMBER", _sid];
				};		
			};
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};

			//Community wish, vanilla drones for both sides for ballance
			if((CTI_CUP_ADDON >= 1 || CTI_RHS_ADDON >= 1) && CTI_AIR_ADDON >= 0 ) then {
				_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedUnitsPrize;

				_c pushBack format["%1O_UAV_02_dynamicLoadout_F", _sid];
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;		
			};
		};
	};
	default {
		/*_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
		_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_NPOC_ID, CTI_POOKAIR_ID] call CTI_CO_FNC_GetTechmatrix;
		
		_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//Panavia Tornado AWS and variants								1980						Jagdbomber
			if (isClass(configFile >> "CfgVehicles" >> "Tornado_AWS_ind")) then {
				if(CTI_AIR_ADDON >= 2) then {
					_c pushBack format["%1Tornado_AWS_ind", _sid];	
					_c pushBack format["%1Tornado_AWS_ADV_IND", _sid];	
				};
			};
			
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};
		
		_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
		if(_matrix_cnt >= 0) then {_tech_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
		if(CTI_ECONOMY_LEVEL_AIR >= _tech_level) then {
			_building_time = [CTI_FACTORY_AIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
		
			//Eurofighter Typhoon AWS										Juli 2006					Mehrzweckkampfflugzeug
			//if (isClass(configFile >> "CfgVehicles" >> "EAWS_EF2000_Genericind_CAP")) then {
			//	if(CTI_AIR_ADDON >= 2) then {	
			//		_c pushBack format["%1EAWS_EF2000_racs_CAP", _sid];	
			//		_c pushBack format["%1EAWS_EF2000_Genericind_CAP", _sid];
			//	};
			//	if(CTI_AIR_ADDON >= 3) then {	
			//		_c pushBack format["%1EAWS_EF2000_genericartic3_CAP", _sid];	
			//		_c pushBack format["%1EAWS_EF2000_genericdesert3_CAP", _sid];	
			//		_c pushBack format["%1EAWS_EF2000_genericgray3_CAP", _sid];
			//	};	
			//};
			//pook_EF2000													Juli 2006					Mehrzweckkampfflugzeug
			if (isClass(configFile >> "CfgVehicles" >> "pook_EF2000_INDFOR")) then {	
				if(CTI_AIR_ADDON >= 1) then {
					_c pushBack format["%1pook_EF2000_INDFOR", _sid];
				};		
			};
			
			//set all other vars in a slope
			_cntstart = count _c;
			_cntend = count _p;
			_unitsprise = [CTI_ECONOMY_PRIZE_AIR,_tech_level,true,2.0] call CTI_CO_FNC_GetCalculatedUnitsPrize;
			for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
				_p pushBack '';
				_n pushBack '';
				_o pushBack _unitsprise;
				_t pushBack _building_time;
				_u pushBack _tech_level;
				_f pushBack CTI_FACTORY_AIR;
				_s pushBack "";
				_d pushBack 10;	
			};
		};
		*/
	};
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_AIR) then {
	_upgrade_levels set [CTI_UPGRADE_AIR, _tech_level];
};
//*********************************************************************************************************************************************
//											 Reapir Factory units																			  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Reapir Factory.
_tech_level = 0;
if(CTI_ADDON_CHARLIECO > 0 && _side != resistance) then {
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_other_mods.sqf", format["Salvager CHARLIECO declared: [%1|%2|%3] ", CTI_ADDON_CHARLIECO, CTI_SALVAGE_SPECIAL, CTI_CAMO_ACTIVATION]] call CTI_CO_FNC_Log};

	if(_side == west) then {
		_c pushBack format["CTI_Salvager_%1", _side];
		_s pushBack [format["%1EPA", _sid],"salvager"];
				
		_c pushBack format["CTI_Salvager_Independent_%1", _faction];
		_s pushBack [format["%1FPT_MAN", _sid],"salvager-independent"];
	} else {
		_c pushBack format["CTI_Salvager_%1", _side];
		_s pushBack [format["%1chEPA_RenaultM", _sid],"salvager"];
				
		_c pushBack format["CTI_Salvager_Independent_%1", _faction];
		_s pushBack [format["%1ccfm_mercedes", _sid],"salvager-independent"];
	};
	
	_cntstart = count _c;
	_cntend = count _p;
	_building_time = [CTI_FACTORY_REPAIR,_tech_level] call CTI_CO_FNC_GetCalculatedBuildtime;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_p pushBack '';
		_n pushBack 'Salvager Truck';
		_o pushBack CTI_VEHICLES_SALVAGER_PRICE;
		_t pushBack _building_time;
		_u pushBack _tech_level;
		_f pushBack CTI_FACTORY_REPAIR;
		_d pushBack 10;
	};
};

//*********************************************************************************************************************************************
//											 Ammo Factory units																			  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.

//*********************************************************************************************************************************************
//											 Naval Factory units																		  	  *
//*********************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\units_other_mods.sqf", format["units declared: %1/%2", count _c, count _p]] call CTI_CO_FNC_Log};

[_side, _faction, _c, _p, _n, _o, _t, _u, _f, _s, _d] call compile preprocessFileLineNumbers "Common\Config\Units\Set_Units.sqf";
