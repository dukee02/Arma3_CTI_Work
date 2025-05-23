CTI_UI_Purchase_SetIcons = {
	private ["_IDCs", "_index", "_selected"];
	_index = _this;
	
	_IDCs = [110001, 110002, 110003, 110004, 110005, 110006, 110007, 110011];
	_selected = _IDCs select _index;
	_IDCS = _IDCS - [_selected];
	
	{
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _x) ctrlSetTextColor [0.4, 0.4, 0.4, 1];
	} forEach _IDCs;
	// ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _selected) ctrlSetTextColor [1, 1, 1, 1];
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _selected) ctrlSetTextColor [0.258823529, 0.713725490, 1, 1];
};

//--- Get the best factory (the closest).
CTI_UI_Purchase_GetFirstAvailableFactories = {
	_fetched = objNull;
	_index = -1;
	_type = "";
	
	_structures = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideStructures;
	_factories = [CTI_BARRACKS, CTI_LIGHT, CTI_HEAVY, CTI_AIR, CTI_REPAIR, CTI_AMMO, CTI_NAVAL];
	_availables = [];
	{_availables = _availables + ([_x, _structures, player, CTI_BASE_PURCHASE_UNITS_RANGE_EFFECTIVE] call CTI_CO_FNC_GetSideStructuresByType)} forEach _factories;
	_depot = [player, CTI_TOWNS_CAPTURE_RANGE] call CTI_CL_FNC_GetClosestDepot;
	_availables pushback _depot;

	if (count _availables > 0) then {
		_fetched = [player, _availables] call CTI_CO_FNC_GetClosestEntity;
		_nearAction = uiNamespace getVariable "cti_dialog_ui_purchasemenu_action";
		if !(isNil '_nearAction') then { //--- Override by closest?
			if (alive _nearAction && _nearAction in _structures) then {
				_fetched = _nearAction;
			};
		};
		
		_var = _fetched getVariable "cti_structure_type";
		if (isNil '_var') exitWith {_fetched = objNull};
		_var = missionNamespace getVariable format ["CTI_%1_%2", CTI_P_SideJoined, _var];
		_type = (_var select 0) select 0;
		_index = switch (_type) do {
			case CTI_BARRACKS: {CTI_FACTORY_BARRACKS};
			case CTI_LIGHT: {CTI_FACTORY_LIGHT};
			case CTI_HEAVY: {CTI_FACTORY_HEAVY};
			case CTI_AIR: {CTI_FACTORY_AIR};
			case CTI_REPAIR: {CTI_FACTORY_REPAIR};
			case CTI_AMMO: {CTI_FACTORY_AMMO};
			case CTI_NAVAL: {CTI_FACTORY_NAVAL};
			case CTI_DEPOT: {CTI_TOWN_DEPOT};
			default {-1};
		};
	};
	
	[_fetched, _index, _type];
};

CTI_UI_Purchase_FillUnitsList = {
	private ["_type", "_var"];
	_type = _this;
	
	lnbClear ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007);
	
	_upgrade = switch (_type) do {
		case CTI_BARRACKS: {CTI_UPGRADE_BARRACKS};
		case CTI_LIGHT: {CTI_UPGRADE_LIGHT};
		case CTI_HEAVY: {CTI_UPGRADE_HEAVY};
		case CTI_AIR: {CTI_UPGRADE_AIR};
		case CTI_NAVAL: {CTI_UPGRADE_NAVAL};
		case CTI_REPAIR: {CTI_UPGRADE_LIGHT};
		case CTI_AMMO: {CTI_UPGRADE_LIGHT};
		default {-1};
	};
	_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
	
	{
		_var = missionNamespace getVariable _x;
		if !(isNil '_var') then {
			//--- Upgradeable?
			_load = true;
			if (_upgrade > -1) then {
				if (_upgrades select _upgrade < _var select CTI_UNIT_UPGRADE) then {_load = false};
			};
			
			if (_load) then { 
				_row = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbAddRow [format ["$%1", _var select CTI_UNIT_PRICE],format ["%1s", _var select CTI_UNIT_TIME], _var select CTI_UNIT_LABEL];
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbSetData [[_row, 0], _x];
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbSetPicture [[_row, 0], _var select CTI_UNIT_PICTURE];
			};
		};
	} forEach (missionNamespace getVariable format ["CTI_%1_%2Units", CTI_P_SideJoined, _type]);
};

CTI_UI_Purchase_CenterMap = {
	private ["_delay", "_position", "_zoom"];
	_position = _this select 0;
	_delay = _this select 1;
	_zoom = _this select 2;
	
	ctrlMapAnimClear ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110010);
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110010) ctrlMapAnimAdd [_delay, _zoom, _position];
	ctrlMapAnimCommit ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110010);
};

CTI_UI_Purchase_UpdateVehicleIcons = {
	private ["_classname", "_IDCs", "_scripts", "_showArray", "_textures", "_turrets", "_var"];
	_classname = _this;
	_IDCs = [110100, 110101, 110102, 110103, 110104];
	
	_fetched = uiNamespace getVariable "cti_dialog_ui_purchasemenu_factory";
	_var = _fetched getVariable "cti_structure_type";
	if (isNil '_var') exitWith {};
	_var = missionNamespace getVariable format ["CTI_%1_%2", CTI_P_SideJoined, _var];
	_type = (_var select 0) select 0;
	
	if (_classname isKindOf "Man" || _classname isKindOf "Pod_Heli_Transport_04_Base_F" || _classname isKindOf "Slingload_01_Base_F") then {
		call CTI_UI_Purchase_HideVehicleIcons;

	} else {
		_var = missionNamespace getVariable _classname;
		_turrets = _var select CTI_UNIT_TURRETS;
		_textures = (configfile >> "CfgVehicles" >> _classname >> "textureSources");
		_removedTextures = [];
		_displayNames = [];
		_showArray = [true, false, false, false, false];
		
		if (_type == "Depot") then {
			call CTI_UI_Purchase_HideVehicleIcons;
			_showArray set [0, false];
			_showArray set [5, true];		
		};
		
		{
			if (count _x == 1) then {_showArray set [3, true]};
			if (count _x == 2) then {
				switch (_x select 1) do { case "Gunner": {_showArray set [1, true]}; case "Commander": {_showArray set [2, true]}; };
			};
		} forEach _turrets;
		
		if (count _textures > 1) then {
			switch (CTI_P_SideJoined) do {
				case (WEST): {_removedTextures = ["AAF", "Independent", "OPFOR"]};
				case (EAST): {_removedTextures = ["AAF", "Independent", "BLUFOR", "FIA 1", "FIA 2"]};
			};
			
			_showArray set [4, true];
			_texture = uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehcamo_%1", _classname];

			for '_i' from 0 to (count _textures)-1 do {
				Private ["_displayName"];
				_subclass = _textures select _i;
				_subClassName = configname _subClass;
				_displayName = getText(configfile >> "CfgVehicles" >> _classname >> "textureSources" >> _subClassName >> "DisplayName");
				if !(_displayName in _removedTextures) then {_displayNames pushBack _displayName};
				
			};
			
			lbClear ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104);
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) lbAdd "default";
			
			{
				((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) lbAdd Format ["%1", _x];
				if (_texture == _x) then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) lbSetCurSel _forEachIndex};
			} forEach _displayNames;
			if (isNil '_texture') then {((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110104) lbSetCurSel 0};
			
		} else {
			uiNamespace setVariable [format ["cti_dialog_ui_purchasemenu_vehcamo_%1", _classname], ""];
		};

		for '_i' from 0 to (count _IDCs)-1 do {
			((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl (_IDCs select _i)) ctrlShow (_showArray select _i);  //--- Lock
		};
		
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110105) ctrlShow true;  //--- Lock
	};
	
	(_classname) call CTI_UI_Purchase_UpdateCost;
};

CTI_UI_Purchase_UpdateCost = {
	_classname = _this;
	
	_cost = 0;
	
	if (_classname != "") then {
		_var = missionNamespace getVariable _classname;
		_cost = _var select 2;
		if !(_classname isKindOf "Man") then { //--- Add the vehicle crew cost if applicable
			_crew = switch (true) do { case (_classname isKindOf "Tank"): {"Crew"}; case (_classname isKindOf "Air"): {"Pilot"}; default {"Soldier"}};
			_crew = missionNamespace getVariable format["CTI_%1_%2", CTI_P_SideJoined, _crew];
			
			//--- Ultimately if we're dealing with a sub we may want to use divers unless that our current soldiers are free-diving champions
			if (_req_classname isKindOf "Ship") then {
				if (getText(configFile >> "CfgVehicles" >> _req_classname >> "simulation") == "submarinex") then { _crew = missionNamespace getVariable format["CTI_%1_Diver", CTI_P_SideJoined] };
			};
			
			_var_crew_classname = missionNamespace getVariable _crew;
			if !(isNil '_var_crew_classname') then {
				_veh_infos = call CTI_UI_Purchase_GetVehicleInfo;
				for '_i' from 0 to 2 do { if (_veh_infos select _i) then { _cost = _cost + (_var_crew_classname select 2) } };
				
				if (_veh_infos select 3) then { //--- Turrets
					{ if (count _x == 1) then { _cost = _cost + (_var_crew_classname select 2) } } forEach (_var select CTI_UNIT_TURRETS);
				};
			};
		};
	};
	
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_unitcost", _cost];
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110014) ctrlSetStructuredText (parseText format["<t align='left'>Cost: <t color='#F56363'>$%1</t></t>", _cost]);
};

CTI_UI_Purchase_HideVehicleIcons = {
	private ["_IDCs"];
	_IDCs = [110100, 110101, 110102, 110103, 110104, 110105];
	{ ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl _x) ctrlShow false } forEach _IDCs;
};

CTI_UI_Purchase_OnUnitListLoad = {
	private ["_classname"];
	if (lnbCurSelRow 111007 > -1) then {
		_classname = ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 111007) lnbData [lnbCurSelRow 111007, 0];
		if (_classname != "") then {
			(_classname) call CTI_UI_Purchase_UpdateVehicleIcons;
		} else {
			call CTI_UI_Purchase_HideVehicleIcons;
			("") call CTI_UI_Purchase_UpdateCost;
		};
	} else {
		call CTI_UI_Purchase_HideVehicleIcons;
		("") call CTI_UI_Purchase_UpdateCost;
	};
};

CTI_UI_Purchase_LoadFactories = {
	private ["_closest", "_fetched", "_structures", "_structure_text", "_type", "_var"];
	_type = _this;
	_structures = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideStructures;
	_fetched = [_type, _structures, player, CTI_BASE_PURCHASE_UNITS_RANGE_EFFECTIVE] call CTI_CO_FNC_GetSideStructuresByType;
	if (_type == "Depot") then {
		_depot = [player, CTI_TOWNS_CAPTURE_RANGE] call CTI_CL_FNC_GetClosestDepot;
		_fetched pushBack _depot;
	};
		
	_var = missionNamespace getVariable format ["CTI_%1_%2", CTI_P_SideJoined, _type];
	_structure_text = (_var select 0) select 1;
	
	lbClear ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110009);
	
	{
		_closest = _x call CTI_CO_FNC_GetClosestTown;
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110009) lbAdd format ["%1 - %2 (%3m)", _structure_text, _closest getVariable "cti_town_name", round(_closest distance _x)];
	} forEach _fetched;

	
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factory", _fetched select 0];
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factory_type", _type];
	uiNamespace setVariable ["cti_dialog_ui_purchasemenu_factories", _fetched];
	
	if (count _fetched > 0) then {
		[_fetched select 0, 2, .175] call CTI_UI_Purchase_CenterMap;
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110009) lbSetCurSel 0;
	};
};

CTI_UI_Purchase_SetVehicleIconsColor = {
	private ["_color", "_idc"];
	_idc = 110100;
	{
		_color = if (uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x]) then {[0.258823529, 0.713725490, 1, 1]} else {[0.2, 0.2, 0.2, 1]};
		
		((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl (_idc + _forEachIndex)) ctrlSetTextColor _color;
	} forEach ['driver','gunner','commander','turrets'];
	
	_color = if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {[1, 0.22745098, 0.22745098, 1]} else {[0.2, 0.2, 0.2, 1]};
	((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl 110105) ctrlSetTextColor _color;
};

CTI_UI_Purchase_GetVehicleInfo = {
	private ["_classname", "_idc", "_returned", "_selected"];
	_idc = 110100;
	_classname = _this;
	_texture = "";
	_returned = [false, false, false, false, "", false];
	
	{
		_selected = uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehicon_%1", _x];
		if (_selected && ctrlShown ((uiNamespace getVariable "cti_dialog_ui_purchasemenu") displayCtrl (_idc + _forEachIndex))) then {_returned set [_forEachIndex, true]};
	} forEach ['driver','gunner','commander','turrets'];
	
	_texture = uiNamespace getVariable format ["cti_dialog_ui_purchasemenu_vehcamo_%1", _classname];
	_textures = (configfile >> "CfgVehicles" >> _classname >> "textureSources");	

	for '_i' from 0 to (count _textures)-1 do {
		_subclass = _textures select _i;
		_subClassName = configname _subClass;
		_displayName = getText(configfile >> "CfgVehicles" >> _classname >> "textureSources" >> _subClassName >> "DisplayName");
		if (_displayName == _texture) then {_returned set [4, _subClassName]};
	};	
	
	if (uiNamespace getVariable "cti_dialog_ui_purchasemenu_vehicon_lock") then {_returned set [5, true]};
	
	_returned
};