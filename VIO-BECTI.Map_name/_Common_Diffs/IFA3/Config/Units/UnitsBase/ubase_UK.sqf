private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_UK_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_UK_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//winter camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_UK_Officer_w", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_UK_Rifleman_w", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1LIB_UK_Grenadier_w", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1LIB_UK_Rifleman_w", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1LIB_UK_Grenadier_w", _sid]];
			};
		};
		case 2: {//Desert camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_UK_DR_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_UK_DR_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_UK_DR_Tank_Crew", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_UK_DR_Tank_Crew", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1LIB_UK_DR_Grenadier", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1LIB_UK_DR_Rifleman", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1LIB_UK_DR_Grenadier", _sid]];
			};
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1LIB_UK_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1LIB_UK_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
			if!(_tag == "GUER_") then {
				missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1LIB_UK_Rifleman_Jerkins", _sid]];
				missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
				missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1LIB_UK_Grenadier", _sid]];
			};
		};	
	};

	if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//winter camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_UniversalCarrier_w", _sid], []], 
			[format["%1LIB_UniversalCarrier_w", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_DAK_Kfz1_hood", _sid], []], 
			[format["%1LIB_DAK_Kfz1_hood", _sid], []]
		]];
	};
	if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//all camo active
		//Set starting vehicles
		missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
			[format["%1LIB_UniversalCarrier_desert", _sid], []], 
			[format["%1LIB_UniversalCarrier_desert", _sid], []]
		]];
	};
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_UK_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_UK_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	//needed for Tonw units because the camo can differ
	switch(CTI_TOWN_CAMO) do {
		case 1: {//winter camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_UK_Officer_w", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_UK_Rifleman_w", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
		};
		case 3: {//Desert camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_UK_DR_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_UK_DR_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_UK_DR_Tank_Crew", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1LIB_UK_Officer", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1LIB_UK_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1LIB_UK_Tank_Crew", _sid]];
		};	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_UK.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
