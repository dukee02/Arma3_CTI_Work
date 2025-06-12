private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_GER_ID || CTI_WEST_TOWNS == CTI_GER_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_GER_ID || CTI_EAST_TOWNS == CTI_GER_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("CSA38_Gcrew") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then { ["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************
_isThisMain = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", _side], []];
if(count _isThisMain > 0) then {
	if((_isThisMain select 0) == CTI_GER_ID && (_isThisMain select 1) == CTI_CSA_ID) then {_setupBaseUnits = true;};
} else {
	_setupBaseUnits = true;
};
if (_setupBaseUnits) then {
	[_side,_tag,_sid] call compile preprocessFileLineNumbers "Common\Config\Units\UnitsBase\ubase_GER_CSA.sqf";
};
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	/*if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1", _sid];
	};*/
	
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1CSA38_WH1S", _sid];//Sniper
	
	_c pushBack format["%1CSA38_WHoff1", _sid];//WH TL
	_c pushBack format["%1CSA38_WHoff5", _sid];
	_c pushBack format["%1CSA38_WHoff3", _sid];
	_c pushBack format["%1CSA38_WHoff4", _sid];//WH General
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];


//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
_c = [];
//Level start
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {	
	_c pushBack format["%1CSA38_pragaRV6", _sid];
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
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
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
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
	};
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= _level) then {
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
		//_c pushBack format["%1CSA38_8radLATE", _sid];
		//_c pushBack format["%1CSA38_8rad2LATE", _sid];
		//_c pushBack format["%1CSA38_8radLATE2", _sid];
		//_c pushBack format["%1CSA38_8rad2LATE2", _sid];
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_LIGHT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
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
		//_c pushBack format["%1CSA38_pzII_DE2", _sid];
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1CSA38_pzbfwIamb_W", _sid];// medic?
		//_c pushBack format["%1CSA38_mzm35t_W", _sid];//nazi, ammo?
		_c pushBack format["%1CSA38_ltm38_W", _sid];
		//_c pushBack format["%1CSA38_ltm38_FR2_W", _sid];//nazi
		_c pushBack format["%1CSA38_pzIIIB_W", _sid];
		_c pushBack format["%1CSA38_pzIIIC_W", _sid];
		_c pushBack format["%1CSA38_pzIIID_W", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1CSA38_pzbfwIamb_DE", _sid];// medic?
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
		_c pushBack format["%1CSA38_pzbfwIamb", _sid];// medic?
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
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
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1", _sid];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1", _sid];
	};
	_c pushBack format["%1", _sid];
	_level = _level + 1;
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*/

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
_c = [];

_c pushBack format["%1CSA38_opelblitz6", _sid];//repair

if(_setupBaseUnits && CTI_IFA_ADDON <= 0 && CTI_CSA_ADDON > 1) then {
	_c pushBack format["CTI_Salvager_%1", _side];	
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
_c = [];

if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
	_c pushBack format["%1CSA38_opelblitz4_W", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5_W", _sid];//fuel
};
if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
	_c pushBack format["%1CSA38_opelblitz4_DE", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5_DE", _sid];//fuel
};
if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
	_c pushBack format["%1CSA38_opelblitz4", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5", _sid];//fuel
};
if(CTI_CAMO_ACTIVATION > 3) then {		//all camo active
	_c pushBack format["%1CSA38_opelblitz4_LATE", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5_LATE", _sid];//fuel
	_c pushBack format["%1CSA38_opelblitz4_LATE2", _sid];//ammo
	_c pushBack format["%1CSA38_opelblitz5_LATE2", _sid];//fuel
};
	

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];


//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
_c = [];

if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		_c pushBack format["%1CSA38_pragaRV6", _sid];
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_opelblitz_W", _sid];
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CSA38_opelblitz_DE", _sid];
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
			_c pushBack format["%1CSA38_opelblitz2", _sid];
		};
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 1) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_c pushBack format["%1CSA38_opelblitz4_W", _sid];//ammo
			_c pushBack format["%1CSA38_opelblitz5_W", _sid];//fuel
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1CSA38_opelblitz4_DE", _sid];//ammo
			_c pushBack format["%1CSA38_opelblitz5_DE", _sid];//fuel
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//default camo active
			_c pushBack format["%1CSA38_opelblitz4", _sid];//ammo
			_c pushBack format["%1CSA38_opelblitz5", _sid];//fuel
		};
		_c pushBack format["%1CSA38_opelblitz6", _sid];//repair
	};
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 2) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		_c pushBack format["%1CSA38_Gcrew", _sid];
		_c pushBack format["%1CSA38_WH2Bi", _sid];//recruits
		_c pushBack format["%1CSA38_WH13", _sid];//Medic
	};
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_GER_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_GER_CSA.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/