/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTechmatrix.sqf
	Alias:			CTI_CO_FNC_GetTechmatrix
	Description:	Gets the matrix (array) of the given factory
	Author: 		dukee
	Creation Date:	10-01-2022
	Revision Date:	10-01-2022
	
  # PARAMETERS #
    0	[Side]: The side
    1	[Integer]: The Factory
    2	[Integer]: The Nation
    2	[Integer]: The Mod
	
  # RETURNED VALUE #
	[Array]: Boolean Array 
	
  # SYNTAX #
	[SIDE, FACTORY_UPGRADE_ID, NATION_ID, MOD_ID] call CTI_CO_FNC_GetTechmatrix;
	
  # EXAMPLE #
    _matrix_full = [_side, CTI_UPGRADE_BARRACKS] call CTI_CO_FNC_GetTechmatrix;
    _matrix_nation = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID] call CTI_CO_FNC_GetTechmatrix;
    _matrix_nation_mod = [_side, CTI_UPGRADE_BARRACKS, CTI_GER_ID, CTI_IFA_ID] call CTI_CO_FNC_GetTechmatrix;
*/

//techtree: 
//https://docs.google.com/spreadsheets/d/1HN6bopGMsHu7rxPnNN9V3aLaOEFsaQNu4yYJAimcTs0/edit?usp=sharing

private ["_side", "_factory", "_nation", "_mod", "_tech_matrix", "_tech"];

_side = _this select 0;
switch(count _this) do {
	case 2: {
		_factory = _this select 1;
		_nation = -1;
		_mod = -1;};
	case 3: {
		_factory = _this select 1;
		_nation = _this select 2;
		_mod = -1;};
	case 4: {
		_factory = _this select 1;
		_nation = _this select 2;
		_mod = _this select 3;};
	default {_factory = -1;};
};

_tech_matrix = missionNamespace getVariable ["CTI_TECHMATRIX", []];

_tech = [];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["Techmatrix before: [%1,%2,%3] <%4>", _factory, _nation, _mod, _tech]] call CTI_CO_FNC_Log;};
if(_mod >= 0) then {
	_tech = _tech_matrix select _factory select _nation select _mod;
} else {
	if(_nation >= 0) then {
		_tech = _tech_matrix select _factory select _nation select 0;

		if(CTI_IFA_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_IFA_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_SPE_DLC > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_SPE_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_FOW_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_FOW_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_CSA_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_CSA_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_NF_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_NF_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_SABFL_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_SABFL_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_SABNL_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_SABNL_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_SAB_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_SAB_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_BT_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_BT_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if(CTI_SABRL_ADDON > 0) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_SABRL_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if (isClass(configFile >> "CfgVehicles" >> "FA_BA64_Captured")) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_CARS_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
		if (isClass(configFile >> "CfgVehicles" >> "FA_T26_Captured")) then {
			_tech = [_tech, _tech_matrix select _factory select _nation select CTI_TANKS_ID] call CTI_CO_FNC_MergeMatrixArray;
		};
	} else {
		//combine the tech tree
		{
			if(_side == (_x) call CTI_CO_FNC_GetSideFromID) then {
				if(CTI_IFA_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_IFA_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_IFA3: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_SPE_DLC > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_SPE_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SPE_DLC: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_FOW_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_FOW_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_FOW_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_CSA_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_CSA_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_CSA_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_NF_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_NF_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_NF_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_SABFL_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_SABFL_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SABFL_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_SABNL_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_SABNL_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SABNL_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_SAB_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_SAB_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SAB_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_BT_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_BT_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_BT_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if(CTI_SABRL_ADDON > 0) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_SABRL_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SABRL_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if (isClass(configFile >> "CfgVehicles" >> "FA_BA64_Captured")) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_CARS_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SABRL_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
				if (isClass(configFile >> "CfgVehicles" >> "FA_T26_Captured")) then {
					_tech = [_tech, _tech_matrix select _factory select _forEachIndex select CTI_TANKS_ID] call CTI_CO_FNC_MergeMatrixArray;
					//if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["CTI_SABRL_ADDON: [%1,%2] <%3>", _factory, _forEachIndex, _tech]] call CTI_CO_FNC_Log;};
				};
			};	
		} forEach [CTI_GER_SIDE, CTI_SOV_SIDE, CTI_UK_SIDE, CTI_US_SIDE, CTI_JPN_SIDE, CTI_CZ_SIDE, CTI_FIN_SIDE];
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_GetTechmatrix.sqf", format["Techmatrix: [%1,%2,%3] <%4>", _factory, _nation, _mod, _tech]] call CTI_CO_FNC_Log;};

_tech
