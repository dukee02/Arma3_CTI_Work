/*
  # HEADER #
	Script: 		Common\Functions\Common_EquipUnit.sqf
	Alias:			CTI_CO_FNC_EquipUnit
	Description:	Equip a CTI gear variable on a unit
	Author: 		Benny
	Creation Date:	16-09-2013
	Revision Date:	16-09-2013
	
  # PARAMETERS #
    0	[Object]: The unit to equip
    1	[Array]: A CTI gear variable
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[UNIT, ARRAY] call CTI_CO_FNC_EquipUnit
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_ArrayDiffers
	Common Function: CTI_CO_FNC_ArrayToLower
	Common Function: CTI_CO_FNC_EquipContainerBackpack
	Common Function: CTI_CO_FNC_EquipContainerUniform
	Common Function: CTI_CO_FNC_EquipContainerVest
	
  # EXAMPLE #
	_gear = [
		[["arifle_mxc_f",["","acc_pointer_ir","optic_Aco"],["30rnd_65x39_caseless_mag"]],["launch_nlaw_f",[],["nlaw_f"]],["",[],[]]],
		[["u_b_combatuniform_mcam",[]],["v_platecarrier1_rgr",[]],["b_assaultpack_mcamo",["firstaidkit","nlaw_f","nlaw_f"]]],
		["h_helmetb",""],
		[["nvgoggles","binocular"],["itemmap","itemgps","itemradio","itemcompass","itemwatch"]]
	];
	
	[player, _gear] call CTI_CO_FNC_EquipUnit; 
*/

private ["_gear", "_item", "_magazine", "_unit"];

_unit = _this select 0;
_gear = _this select 1;

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_EquipUnit.sqf", format ["Units <%1> gear <%2>", _unit, _gear]] call CTI_CO_FNC_Log };

//--- [Equipment check-in]
_new = _gear select 1;

//--- Check if the containers are ok
if (((_gear select 1) select 2) select 0 != backpack _unit || [((_gear select 1) select 2) select 1, backpackItems _unit] call CTI_CO_FNC_ArrayDiffers) then {
	[_unit, ((_gear select 1) select 2) select 0, ((_gear select 1) select 2) select 1] call CTI_CO_FNC_EquipContainerBackpack;
};
if (((_gear select 1) select 1) select 0 != vest _unit || [((_gear select 1) select 1) select 1, vestItems _unit] call CTI_CO_FNC_ArrayDiffers) then {
	[_unit, ((_gear select 1) select 1) select 0, ((_gear select 1) select 1) select 1] call CTI_CO_FNC_EquipContainerVest;
};
if (((_gear select 1) select 0) select 0 != uniform _unit || [((_gear select 1) select 0) select 1, uniformItems _unit] call CTI_CO_FNC_ArrayDiffers) then {
	[_unit, ((_gear select 1) select 0) select 0, ((_gear select 1) select 0) select 1] call CTI_CO_FNC_EquipContainerUniform;
};

//--- [Assigned items check-in]
removeAllAssignedItems _unit; //--- Due to the lack of commands for some of them, we remove everything first.
_new = _gear select 2;

_item = _new select 0;
if (_item != "") then {_unit addHeadgear _item};

_item = _new select 1;
if (_item != "") then {_unit addGoggles _item};

{ if (_x != "") then {_unit linkItem _x} } forEach ([((_gear select 3) select 0) select 0] + ((_gear select 3) select 1));

//--- Binoculars are special, they can't be linked like the other items.
if (((_gear select 3) select 0) select 1 != "") then {_unit addWeapon (((_gear select 3) select 0) select 1)};

//--- [Weapons check-in]
//--- Primary
_new = (_gear select 0) select 0;
_item = _new select 0;
_accessories = (_new select 1) call CTI_CO_FNC_ArrayToLower;
// player sidechat format ["%1 %2",primaryWeapon _unit,_item];
if (primaryWeapon _unit != _item) then { //--- Replace
if (primaryWeapon _unit != "") then {_unit removeWeapon (primaryWeapon _unit)};
	if (_item != "") then {
		_unit addWeapon _item;
		{if (_x != "") then {_unit addPrimaryWeaponItem _x}} forEach _accessories;
	};
} else { //--- Same
	if (_item != "") then {
		_accessories_current = (primaryWeaponItems _unit) call CTI_CO_FNC_ArrayToLower;
		{if (!(_x in _accessories) && (_x != "")) then {_unit removePrimaryWeaponItem _x}} forEach _accessories_current;
		{if (!(_x in _accessories_current) && (_x != "")) then {_unit addPrimaryWeaponItem _x}} forEach _accessories;
	};
};

//--- Secondary - no removeSecondaryItem :(
_new = (_gear select 0) select 1;
_item = _new select 0;
_accessories = (_new select 1) call CTI_CO_FNC_ArrayToLower;
_magazine = (_new select 2) call CTI_CO_FNC_ArrayToLower;

if (secondaryWeapon _unit != _item) then { //--- Replace
	if (secondaryWeapon _unit != "") then {_unit removeWeapon (secondaryWeapon _unit)};
	if (_item != "") then {
		_unit addWeapon _item;
		{if (_x != "") then {_unit addSecondaryWeaponItem _x}} forEach _accessories;
	};
	if ((_magazine select 0) != "") then {
		_unit addSecondaryWeaponItem (_magazine select 0);
	};
} else { //--- Same
	if (_item != "") then {
		_accessories_current = (secondaryWeaponItems _unit) call CTI_CO_FNC_ArrayToLower;
		_replace = false;
		{if (!(_x in _accessories) && (_x != "")) then {_replace = true}} forEach _accessories_current;
		{if (!(_x in _accessories_current) && (_x != "")) then {_replace = true}} forEach _accessories;
		if (_replace) then {
			_unit removeWeapon _item;
			_unit addWeapon _item;
			{_unit addSecondaryWeaponItem _x} forEach _accessories;
		};
	};
};

//--- Handgun
_new = (_gear select 0) select 2;
_item = _new select 0;
_accessories = (_new select 1) call CTI_CO_FNC_ArrayToLower;

if (handgunWeapon _unit != _item) then { //--- Replace
	if (handgunWeapon _unit != "") then {_unit removeWeapon (handgunWeapon _unit)};
	if (_item != "") then {
		_unit addWeapon _item;
		{if (_x != "") then {_unit addHandgunItem _x}} forEach _accessories;
	};
} else { //--- Same
	if (_item != "") then {
		_accessories_current = (handgunItems _unit) call CTI_CO_FNC_ArrayToLower;
		{if (!(_x in _accessories) && (_x != "")) then {_unit removeHandgunItem _x}} forEach _accessories_current;
		{if (!(_x in _accessories_current) && (_x != "")) then {_unit addHandgunItem _x}} forEach _accessories;
	};
};

//--- Muzzle
{
	if (_x != "") exitWith {
		_muzzles = getArray (configFile >> "CfgWeapons" >> _x >> "muzzles"); 
		if !("this" in _muzzles) then {_unit selectWeapon (_muzzles select 0)} else {_unit selectWeapon _x}; 
	};
} forEach [primaryWeapon _unit, handgunWeapon _unit, secondaryWeapon _unit];

//set up the units identety, in this case its voice.
_voices = [];
_mainsetup = missionNamespace getVariable [format ["CTI_%1_MAINNATIONS", (Side _unit)], []];
switch (_mainsetup select 0) do {
	case CTI_GER_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01ger","male02ger","male03ger","male04ger","male05ger","male06ger"];
		};
		//if((_mainsetup select 1) == CTI_SPE_ID) then {} else {};
		if(CTI_CSA_ADDON >= 1) then {
			_voices append ["male01GE","male02GE","male03GE","male04GE","male05GE"];
		};
	};
	case CTI_SOV_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01su","male02su","male03su"];
		};
		//if((_mainsetup select 1) == CTI_SPE_ID) then {} else {};
		if([1021790] call CTI_CO_FNC_HasDLC) then {		//Contact
			_voices append ["Male01RUS","Male02RUS","Male03RUS"];
		};
	};
	case CTI_UK_ID: {
		if((_mainsetup select 1) == CTI_SPE_ID) then {
			//_voices append ["",""];
		} else {
			//_voices append ["male01eng"];
		};
		_voices append ["male01engb","male02engb","male03engb","male04engb","male05engb"];
	};
	case CTI_US_ID: {
		if((_mainsetup select 1) == CTI_SPE_ID) then {
			//_voices append ["",""];
		} else {
			//_voices append ["male01eng"];
		};
	};
	case CTI_CZ_ID: {
		if(CTI_CSA_ADDON >= 1) then {
			_voices append ["male01CZ","male02CZ","male03CZ","male04CZ","male05CZ"];
		};
	};
	case CTI_POL_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01PL","male02PL","male03PL"];
		};
		if([1021790] call CTI_CO_FNC_HasDLC) then {		//Contact
			_voices append ["male01POL","male02POL","male03POL"];
		};
	};
	case CTI_FR_ID: {
		if(CTI_IFA_ADDON >= 1) then {
			_voices append ["male01FR","male02FR","male03FR"];
		};
		if([395180] call CTI_CO_FNC_HasDLC) then {		//APEX
			_voices append ["male01FRE","male02FRE","male03FRE"];
		};
	};
	default {};
};
//If no voices selected, use the deafult ENG voice
if(count _voices <= 0) then {
	_voices append ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"];
};
_voice = selectRandom _voices;
[_unit,"",_voice] call BIS_fnc_setIdentity;

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Functions\Common_EquipUnit.sqf", format ["Units Voice = <%1>", _voice]] call CTI_CO_FNC_Log };