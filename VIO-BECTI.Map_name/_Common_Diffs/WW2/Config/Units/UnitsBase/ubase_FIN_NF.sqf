private ["_side", "_tag", "_sid"];
_side = _this select 0;
_tag = _this select 1;
_sid = _this select 2;

//CTI_CAMO_ACTIVATION = 0 normal camo | 1 winter camo | 2 desert camo | 3 all

//*********************************************************************************************************************************************
//											Setup base units																				  *
//*********************************************************************************************************************************************

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["setting up factory units for side %1", _side]] call CTI_CO_FNC_Log;};

if((_side == west && ((CTI_WEST_AI >= 0 && CTI_WEST_AI == CTI_FIN_ID) ||  CTI_WEST_AI == -1)) || (_side == east && ((CTI_EAST_AI >= 0 && CTI_EAST_AI == CTI_FIN_ID) || CTI_EAST_AI == -1)) || _tag == "GUER_") then {
	switch(CTI_CAMO_ACTIVATION) do {
		case 1: {//Winter camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1I_NORTH_FIN_W_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1I_NORTH_FIN_W_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1I_NORTH_FIN_T_W_41_Crewman", _sid]];

			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1I_NORTH_FIN_W_41_Unequipped", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1I_NORTH_FIN_W_41_Sentry", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1I_NORTH_FIN_W_41_AIR_Pilot_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1I_NORTH_FIN_ART_W_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_FIN_W_41_FordV8", _sid], []], 
				[format["%1NORTH_FIN_W_41_FordV8", _sid], []]
			]];
		};
		case 2: {//Summer camo active
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1I_NORTH_FIN_S_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1I_NORTH_FIN_S_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1I_NORTH_FIN_T_S_41_Crewman", _sid]];

			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1I_NORTH_FIN_S_41_Unequipped", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1I_NORTH_FIN_S_41_Sentry", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1I_NORTH_FIN_S_41_AIR_Pilot_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1I_NORTH_FIN_ART_S_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_FIN_S_41_FordV8", _sid], []], 
				[format["%1NORTH_FIN_S_41_FordV8", _sid], []]
			]];
		};
		default {
			missionNamespace setVariable [format["CTI_%1Commander", _tag], format["%1I_NORTH_FIN_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1Soldier", _tag], format["%1I_NORTH_FIN_ART_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1Crew", _tag], format["%1I_NORTH_FIN_T_41_Crewman", _sid]];

			missionNamespace setVariable [format["CTI_%1Worker", _tag], format["%1I_NORTH_FIN_41_Unequipped", _sid]];
			missionNamespace setVariable [format["CTI_%1Diver", _tag], format["%1I_NORTH_FIN_41_Sentry", _sid]];
			missionNamespace setVariable [format["CTI_%1Pilot", _tag], format["%1I_NORTH_FIN_41_AIR_Pilot_SgtMaj", _sid]];
			missionNamespace setVariable [format["CTI_%1Static", _tag], format["%1I_NORTH_FIN_ART_41_Rifleman", _sid]];
			//Set starting vehicles
			missionNamespace setVariable [format["CTI_%1_Vehicles_Startup", _side], [ 
				[format["%1NORTH_FIN_FordV8", _sid], []], 
				[format["%1NORTH_FIN_FordV8", _sid], []]
			]];
		};
	};
};

if((_side == west && ((CTI_WEST_TOWNS >= 0 && CTI_WEST_TOWNS == CTI_FIN_ID) ||  CTI_WEST_TOWNS == -1)) || (_side == east && ((CTI_EAST_TOWNS >= 0 && CTI_EAST_TOWNS == CTI_FIN_ID) || CTI_EAST_TOWNS == -1)) || _tag == "GUER_") then {
	//needed for Tonw units because the camo can differ
	switch(CTI_TOWN_CAMO) do {
		case 1: {//Winter camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1I_NORTH_FIN_W_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1I_NORTH_FIN_W_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1I_NORTH_FIN_T_W_41_Crewman", _sid]];
		};
		case 2: {//Summer camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1I_NORTH_FIN_S_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1I_NORTH_FIN_S_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1I_NORTH_FIN_T_S_41_Crewman", _sid]];
		};
		default {//main camo active
			missionNamespace setVariable [format["CTI_%1TownLeader", _tag], format["%1I_NORTH_FIN_41_Officer_Cpt", _sid]];
			missionNamespace setVariable [format["CTI_%1TownSoldier", _tag], format["%1I_NORTH_FIN_ART_41_Rifleman", _sid]];
			missionNamespace setVariable [format["CTI_%1TownCrew", _tag], format["%1I_NORTH_FIN_T_41_Crewman", _sid]];
		};	
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Commander: <%1>", missionNamespace getVariable format["CTI_%1Commander", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Soldier: <%1>", missionNamespace getVariable format["CTI_%1Soldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Crew: <%1>", missionNamespace getVariable format["CTI_%1Crew", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Pilot: <%1>", missionNamespace getVariable format["CTI_%1Pilot", _tag]]] call CTI_CO_FNC_Log;
	if!(_tag == "GUER_") then {
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Worker: <%1>", missionNamespace getVariable format["CTI_%1Worker", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Diver: <%1>", missionNamespace getVariable format["CTI_%1Diver", _tag]]] call CTI_CO_FNC_Log;
		["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Static: <%1>", missionNamespace getVariable format["CTI_%1Static", _tag]]] call CTI_CO_FNC_Log;
	};
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Town Leader: <%1>", missionNamespace getVariable format["CTI_%1TownLeader", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Town Soldier: <%1>", missionNamespace getVariable format["CTI_%1TownSoldier", _tag]]] call CTI_CO_FNC_Log;
	["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["Town Crew: <%1>", missionNamespace getVariable format["CTI_%1TownCrew", _tag]]] call CTI_CO_FNC_Log;
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\units\unitsbase\ubase_FIN_NF.sqf", format["starting vehicles for side %1 declared", _side]] call CTI_CO_FNC_Log;};
