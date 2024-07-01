private ["_side", "_c", "_sid", "_setupBaseUnits", "_level", "_matrix_cnt", "_matrix_full", "_matrix_nation", "_priorUnits"];
_side = _this;
_sid = "";
_tag = "GUER_";
_setupBaseUnits = false;

switch (_side) do {
	case west: {
		_sid = "VIOC_B_";_tag = "WEST_";
		if(CTI_WEST_AI == CTI_UK_ID || CTI_WEST_TOWNS == CTI_UK_ID) then {_setupBaseUnits = true};
	};
	case east: {
		_sid = "VIOC_O_";_tag = "EAST_";
		if(CTI_EAST_AI == CTI_UK_ID || CTI_EAST_TOWNS == CTI_UK_ID) then {_setupBaseUnits = true};
	};
	case resistance: {
		_sid = "VIOC_I_";_tag = "GUER_";
	};
	default {_sid = "";};
};
if !(("csa38_ENsoldier144") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//CTI_CAMO_ACTIVATION = 0 only normal camo | 1 adds winter camo | 2 adds desert camo | 3 adds winter and desert camo

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};
/*
//check if the CTI SIDE base units are set. If not or this side is set as AI, setup the variable.
_priorUnits = missionNamespace getVariable format ["CTI_%1_Commander", _side];
if (isNil "_priorUnits" || CTI_CSA_ADDON > 1 || _ai == 3) then {
	//We setup the standard units before the camo check to get secure
	missionNamespace setVariable [format["CTI_%1_Commander", _side], format["%1fow_s_uk_teamleader", _sid]];
	missionNamespace setVariable [format["CTI_%1_Worker", _side], format["%1fow_s_uk_rifleman", _sid]];

	missionNamespace setVariable [format["CTI_%1_Diver", _side], format["%1fow_s_uk_crewman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Soldier", _side], format["%1fow_s_uk_rifleman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Crew", _side], format["%1fow_s_uk_crewman", _sid]];
	missionNamespace setVariable [format["CTI_%1_Pilot", _side], format["%1fow_s_uk_para_section_commander", _sid]];
	missionNamespace setVariable [format["CTI_%1_Static", _side], format["%1fow_s_uk_rifleman", _sid]];

	//Set starting vehicles
	missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
		[format["%1fow_v_universalCarrier", _sid], []], 
		[format["%1fow_v_universalCarrier", _sid], []]
	]];

	if (CTI_Log_Level >= CTI_Log_Debug) then {
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1_Commander", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1_Worker", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1_Diver", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1_Soldier", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1_Crew", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1_Pilot", _side]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1_Static", _side]]] call CTI_CO_FNC_Log;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
*/
//***************************************************************************************************************************************
//														Barracks Factory																*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Barracks Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1csa38_ENsoldier144", _sid];//crew
	_c pushBack format["%1CSA38_ENsoldier1_7", _sid];//Soldier
	_c pushBack format["%1CSA38_ENsoldier1", _sid];
	_c pushBack format["%1CSA38_ENsoldier3_1", _sid];//medic
	_c pushBack format["%1CSA38_ENsoldier1_4", _sid];//AT boy
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1CSA38_ENsoldier1_5", _sid];//Sten 1
	_c pushBack format["%1CSA38_ENsoldier1_1", _sid];//Sten 2
	_c pushBack format["%1CSA38_ENsoldier1_2", _sid];//Sten 3
	_c pushBack format["%1CSA38_ENsoldier1_6", _sid];//Sten 4
	_c pushBack format["%1CSA38_ENsoldier1_3", _sid];//Sten 5
	_c pushBack format["%1CSA38_ENsoldier2_1", _sid];//MG ass
	_c pushBack format["%1CSA38_ENsoldier2", _sid];//MG
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_INFANTRY >= _level) then {
	_c pushBack format["%1CSA38_ENsoldier8_3", _sid];//platoon leader
	_c pushBack format["%1CSA38_ENsoldier8_2", _sid];//SL
	_c pushBack format["%1CSA38_ENsoldier8_1", _sid];//TL
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_BARRACKS];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_BARRACKS, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_BARRACKS], _c];

//***************************************************************************************************************************************
//														Light Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Light Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_LIGHT] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_LIGHT, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_WHEELED >= 0) then {
	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
		_c pushBack format["%1", _sid];				
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		_c pushBack format["%1", _sid];	
	};
	_c pushBack format["%1", _sid];
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_LIGHT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_LIGHT], _c];
*/

//***************************************************************************************************************************************
//														Heavy Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Heavy Factory.
_c = [];
_matrix_full = [_side, CTI_UPGRADE_HEAVY] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_HEAVY, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
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
};

_matrix_cnt = [_matrix_cnt, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_TRACKED >= _level) then {
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
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_HEAVY];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_HEAVY, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_HEAVY], _c];


//***************************************************************************************************************************************
//														Air Factory																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Air Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_AIR] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_AIR, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_AIR >= _level) then {
	_c pushBack format["%1", _sid];
};

_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_AIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AIR], _c];
*&

//***************************************************************************************************************************************
//														Repair Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Repair Factory.
/*_c = [];
if(CTI_IFA3_NEW < 0 && CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1fow_v_universalCarrier", _sid];						//repairtruck
	if(CTI_US_SIDE != CTI_UK_SIDE) then {
		_c pushBack format["CTI_Salvager_%1", _side];
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_REPAIR];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_REPAIR, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_REPAIR], _c];
*/

//***************************************************************************************************************************************
//														Ammo Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Ammo Factory.
/*_c = [];
if(CTI_IFA3_NEW < 0 && CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
	_c pushBack format["%1fow_v_universalCarrier", _sid];							//ammotruck
	_c pushBack format["%1fow_v_universalCarrier", _sid];							//fueltruck
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_AMMO];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_AMMO, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_AMMO], _c];
*/

//***************************************************************************************************************************************
//														Town Depot																		*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Town Depot.
/*_c = [];
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_INFANTRY >= 0) then {
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_c pushBack format["%1fow_s_uk_seac_medic_l", _sid];
			_c pushBack format["%1fow_s_uk_seac_rifleman_l", _sid];
		};
		_c pushBack format["%1fow_s_uk_para_medic", _sid];
		_c pushBack format["%1fow_s_uk_para_rifleman", _sid];
	};
};
if(CTI_ECONOMY_LEVEL_TRACKED >= 0) then {
	_c pushBack format["%1fow_v_universalCarrier", _sid];	
};
if ((missionNamespace getVariable "CTI_UNITS_TOWN_PURCHASE") > 0) then {
	if(CTI_ECONOMY_LEVEL_WHEELED >= 1) then {
		//if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			//_c pushBack format["%1LIB_AustinK5_DR_Ammo", _sid];					//ammotruck
		//};
		//_c pushBack format["%1LIB_AustinK5_Ammo", _sid];						//ammotruck
		_c pushBack format["%1LIB_US6_Tent_Cargo", _sid];						//repairtruck
		_c pushBack format["%1LIB_US6_Ammo", _sid];							//ammotruck
	};
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_DEPOT];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_DEPOT, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_DEPOT], _c];
*/

//***************************************************************************************************************************************
//														Naval Factory																	*
//***************************************************************************************************************************************
//--- Below is classnames for Units and AI avaiable to puchase from Naval Factory.
/*_c = [];
_matrix_full = [_side, CTI_UPGRADE_NAVAL] call CTI_CO_FNC_GetTechmatrix;
_matrix_nation = [_side, CTI_UPGRADE_NAVAL, CTI_UK_ID, CTI_CSA_ID] call CTI_CO_FNC_GetTechmatrix;

_matrix_cnt = [0, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
if(_matrix_cnt >= 0) then {_level = _matrix_cnt; _matrix_cnt = _matrix_cnt + 1;};
if(CTI_ECONOMY_LEVEL_NAVAL >= _level) then {
	_c pushBack format["%1", _sid];
};
_priorUnits = missionNamespace getVariable format ["CTI_%1_%2Units", _side, CTI_NAVAL];
if (isNil "_priorUnits") then { 
	_priorUnits = []; 
} else {
	_c append _priorUnits; 
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\factories\factory_UK_CSA.sqf", format["units in factory %1: [%2] ", CTI_NAVAL, count _c]] call CTI_CO_FNC_Log;};
missionNamespace setVariable [format ["CTI_%1_%2Units", _side, CTI_NAVAL], _c];
*/
