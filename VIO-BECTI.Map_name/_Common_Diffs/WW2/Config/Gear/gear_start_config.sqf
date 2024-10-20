/*
  # HEADER #
	Script: 		Common\Config\Gear\gear_start_config.sqf
	Alias:			-
	Description:	Get the funds of a group. 0 by default
					Note that if the group is the commander's then
					we retrieve the commander funds
	Author: 		dukee
	Creation Date:	08-09-2022
	Revision Date:	
	
  # PARAMETERS #
    0	[Side]: The side
    1	[Nation]: The selected Nation
    1	[Mod]: The active main Mod
	
  # RETURNED VALUE #
	none
	
  # SYNTAX #
	[SIDE, NATION, MOD] call compile preprocessFileLineNumbers "Common\Config\Gear\gear_start_config.sqf";
	
  # DEPENDENCIES #
  none
	
  # EXAMPLE #
	[west, CTI_BW_ID, CTI_GM_ID] call compile preprocessFileLineNumbers "Common\Config\Gear\gear_start_config.sqf";
*/

private ["_side", "_nationID", "_modID", "_weapon", "_weapon_ammo", "_weapon_att_light", "_weapon_att_optic", "_uniform", "_vest", "_backpack", "_helmet", "_grenades", "_healing", "_bino", "_item_map", "_item_radio", "_item_compass", "_item_watch"];

_side = _this select 0;
_nationID = _this select 1;
_modID = _this select 2;
_defaultGearVar = "CTI_AI_WEST_DEFAULT_GEAR";

if(_side == east) then {
	_defaultGearVar = "CTI_AI_EAST_DEFAULT_GEAR";
};

_weapon = "";
_weapon_ammo = "";
_weapon_att_optic = "";
_weapon_att_light = "";
_uniform = "";
_vest = "";
_backpack = "";
_helmet = "";
_grenades = "";
_healing = "firstaidkit";
_bino = "binocular";
_item_map = "itemmap";
_item_radio = "itemradio";
_item_compass = "itemcompass";
_item_watch = "itemwatch";

/*
//--- National IDs
CTI_GER_ID = 0;
CTI_SOV_ID = 1;
CTI_UK_ID = 2;
CTI_US_ID = 3;
CTI_JPN_ID = 4;
CTI_CZ_ID = 5;
CTI_FIN_ID = 6;

//--- Mod IDs
CTI_IFA_ID = 0;
CTI_SPE_ID = 1;
CTI_FOW_ID = 2;
CTI_CSA_ID = 3;
CTI_NF_ID = 4;
CTI_SABFL_ID = 5;
CTI_SABNL_ID = 6;
CTI_SAB_ID = 7;
CTI_BT_ID = 8;
CTI_SABRL_ID = 9;
*/

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: Common\Config\Gear\gear_start_config.sqf", format ["_side <%1> _nationID <%2> _modID <%3> _defaultGearVar<%4>", _side, _nationID, _modID, _defaultGearVar]] call CTI_CO_FNC_Log };

switch(_nationID) do {
	case CTI_GER_ID: {
		switch(_modID) do {
			case CTI_SPE_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 4: {//urban
						_uniform = "U_SPE_GER_Soldier_Boots";
						_vest = "V_SPE_GER_VestKar98";
						_backpack = "B_SPE_GER_Belt_bag_K98k_MG";
						_helmet = "H_SPE_GER_Helmet";
					};
					default {
						_uniform = "U_SPE_ST_Soldier_E44";
						_vest = "V_SPE_DAK_VestKar98";
						_backpack = "B_SPE_GER_A_frame_ST_K98k_MG";
						_helmet = "H_SPE_ST_Helmet";
					};
				};
				_weapon = "SPE_K98_Late";
				_weapon_ammo = "SPE_5Rnd_792x57";
				_grenades = "SPE_Shg24";
				_healing = "SPE_GER_FirstAidKit";
				_bino = "SPE_Binocular_GER";
				_item_compass = "SPE_GER_ItemCompass_deg";
				_item_watch = "SPE_GER_ItemWatch";
			};
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {//Winter
						_uniform = "U_LIB_GER_Soldier3_w";
						_vest = "V_LIB_GER_VestKar98";
						_backpack = "B_LIB_GER_A_frame";
						_helmet = "H_LIB_GER_Helmet_w";
					};
					case 2: {//Desert
						_uniform = "U_LIB_DAK_Soldier";
						_vest = "V_LIB_DAK_VestKar98";
						_backpack = "B_LIB_DAK_A_frame";
						_helmet = "H_LIB_DAK_Helmet";
					};
					default {
						_uniform = "U_LIB_GER_schutze";
						_vest = "V_LIB_GER_VestKar98";
						_backpack = "B_LIB_GER_A_frame";
						_helmet = "H_LIB_GER_Helmet";
					};
				};
				_weapon = "LIB_K98";
				_weapon_ammo = "LIB_5Rnd_792x57";
				_grenades = "LIB_Shg24";
				_healing = "firstaidkit";
				_bino = "LIB_Binocular_GER";
				_item_compass = "itemcompass";
			};
			case CTI_FOW_ID: {
				_uniform = "fow_u_ger_m43_01_frag_private";
				_vest = "fow_v_heer_k98_bayo";
				_backpack = "fow_b_heer_aframe";
				_helmet = "fow_h_ger_m40_heer_01";
				_weapon = "fow_w_k98";
				_weapon_ammo = "fow_5Rnd_792x57";
				_grenades = "fow_e_m24";
			};
			case CTI_CSA_ID: {
				_uniform = "U_csa38_uniGE08";
				_vest = "V_csa38_equip_GE13";
				_backpack = "csa38_GeMedicbag";
				_helmet = "Headgear_csa38_m38cap2";
				_weapon = "CSA38_M1895k";
				_weapon_ammo = "csa38_8_00_5xMannlicher";
				_grenades = "CSA38_shg24";
				_bino = "csa38_Binocular2";
				_item_radio = "csa38_ItemRadio";
				_item_map = "csa38_ItemMap";
			};
			default {};
		};
	};
	case CTI_SOV_ID: {
		switch(_modID) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {//Winter
						_uniform = "U_LIB_SOV_Strelok_w";
						_helmet = "H_LIB_SOV_Ushanka";
					};
					default {
						_uniform = "U_LIB_SOV_Strelok";
						_helmet = "H_LIB_SOV_RA_Helmet";
					};
				};
				_weapon = "LIB_M9130";
				_weapon_ammo = "LIB_5Rnd_762x54";
				_grenades = "LIB_M39";
				_healing = "firstaidkit";
				_bino = "LIB_Binocular_SU";
				_item_compass = "itemcompass";
				_vest = "V_LIB_SOV_RA_MosinBelt";
				_backpack = "B_LIB_SOV_RA_Rucksack";
			};
			case CTI_NF_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {//Winter
						_uniform = "U_NORTH_SOV_Obr35_W_Greatcoat_Cpt";
						_helmet = "H_NORTH_SOV_Obr27_Budenovka";
					};
					default {
						_uniform = "U_NORTH_SOV_Obr35_Uniform_Cpt";
						_helmet = "H_NORTH_SOV_Obr35_Furazhka";
					};
				};
				_weapon = "NORTH_sov_M9130";
				_weapon_ammo = "NORTH_5Rnd_m39_tracer_mag";
				_grenades = "NORTH_molotov";
				_vest = "V_NORTH_SOV_Belt";
				_backpack = "NORTH_SOV_Gasmaskbag";
			};
			default {};
		};
	};
	case CTI_UK_ID: {
		switch(_modID) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {//Winter
						_uniform = "U_LIB_UK_P37_w";
						_vest = "V_LIB_UK_P37_Rifleman_Blanco";
						_backpack = "B_LIB_UK_HSack_Blanco_Tea";
						_helmet = "H_LIB_UK_Helmet_Mk2_w";
					};
					case 2: {//Desert
						_uniform = "U_LIB_UK_KhakiDrills";
						_vest = "V_LIB_UK_P37_Rifleman";
						_backpack = "B_LIB_UK_HSack_Tea";
						_helmet = "H_LIB_UK_Helmet_Mk2_Desert";
					};
					default {
						_uniform = "U_LIB_UK_P37";
						_vest = "V_LIB_UK_P37_Rifleman_Blanco";
						_backpack = "B_LIB_UK_HSack_Blanco_Tea";
						_helmet = "H_LIB_UK_Helmet_Mk2";
					};
				};
				_weapon = "LIB_LeeEnfield_No1_Bayonet";
				_weapon_ammo = "LIB_10Rnd_770x56";
				_grenades = "LIB_No77";
				_healing = "firstaidkit";
				_bino = "LIB_Binocular_UK";
				_item_compass = "itemcompass";
			};
			case CTI_FOW_ID: {
				_uniform = "fow_u_uk_bd40_bp_01_private";
				_vest = "fow_v_uk_base";
				_backpack = "fow_b_uk_p37_blanco_shovel";
				_helmet = "fow_h_uk_bp_beret";
				_weapon = "fow_w_leeenfield_no4mk1";
				_weapon_ammo = "fow_10Rnd_303";
				_grenades = "fow_e_no36mk1";
			};
			case CTI_CSA_ID: {
				_uniform = "U_csa38_ENuni02";
				_helmet = "Headgear_csa38_CZbaret2";
				_weapon = "CSA38_SMLE";
				_weapon_ammo = "CSA38_7_7_10x56R";
				_grenades = "CSA38_F1";
				_item_radio = "csa38_ItemRadio";
				_item_map = "csa38_ItemMap";
			};
			default {};
		};
	};
	case CTI_US_ID: {
		switch(_modID) do {
			case CTI_IFA_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 1: {//Winter
						_uniform = "U_LIB_US_Private_w";
						_helmet = "H_LIB_US_Helmet_w";
					};
					case 2: {//Desert
						_uniform = "U_LIB_US_NAC_Uniform";
						_helmet = "H_LIB_US_Helmet";
					};
					default {
						_uniform = "U_LIB_US_Private";
						_helmet = "H_LIB_US_Helmet";
					};
				};
				_weapon = "LIB_M1903A3_Springfield";
				_weapon_ammo = "LIB_5Rnd_762x63";
				_grenades = "LIB_F1";
				_healing = "firstaidkit";
				_bino = "LIB_Binocular_US";
				_item_compass = "itemcompass";
				_vest = "V_LIB_US_VEST_M1919";
				_backpack = "B_LIB_US_M36";
			};
			case CTI_SPE_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 4: {//urban
						_uniform = "U_SPE_US_Rangers_Uniform";
						_vest = "V_SPE_US_Assault_Vest";
						_backpack = "";
						_helmet = "H_SPE_US_Rangers_Helmet";
					};
					default {
						_uniform = "U_SPE_US_Private";
						_vest = "V_SPE_US_Vest_Garand";
						_backpack = "B_SPE_US_Backpack_Bandoleer_Rifleman";
						_helmet = "H_SPE_US_Helmet_ns";
					};
				};
				_weapon = "SPE_M1903A3_Springfield";
				_weapon_ammo = "SPE_5Rnd_762x63_t";
				_grenades = "SPE_US_Mk_2";
				_healing = "SPE_US_FirstAidKit";
				_bino = "SPE_Binocular_US";
				_item_compass = "SPE_US_ItemCompass";
				_item_watch = "SPE_US_ItemWatch";
			};
			case CTI_FOW_ID: {
				_uniform = "fow_u_us_m37_02_private";
				_vest = "fow_v_us_45";
				_backpack = "fow_b_us_bandoleer";
				_helmet = "fow_h_us_m1";
				_weapon = "fow_w_m1903A1";
				_weapon_ammo = "fow_5Rnd_762x63";
				_grenades = "fow_e_mk2";
			};
			default {};
		};
	};
	case CTI_JPN_ID: {
		switch(_modID) do {
			case CTI_FOW_ID: {
				_uniform = "fow_u_ija_type98";
				_vest = "fow_v_ija_bayonet";
				_backpack = "fow_b_ija_backpack";
				_helmet = "fow_h_ija_fieldcap";
				_weapon = "fow_w_type99";
				_weapon_ammo = "fow_5Rnd_77x58";
				_grenades = "fow_e_type99";
			};
			default {};
		};
	};
	case CTI_CZ_ID: {
		switch(_modID) do {
			case CTI_NF_ID: {
				_uniform = "U_csa38_uniCZ05";
				_vest = "V_csa38_equip_CZ08";
				_backpack = "csa38_pouzdrovz23";
				_helmet = "Headgear_csa38_M35CH";
				_weapon = "CSA38_M1895k";
				_weapon_ammo = "csa38_8_00_5xMannlicher";
				_grenades = "CSA38_rg34";
				_bino = "CSA38_Binocular";
				_item_radio = "csa38_ItemRadio";
				_item_map = "csa38_ItemMap";
			};
			default {};
		};
	};
	case CTI_FIN_ID: {
		switch(_modID) do {
			case CTI_NF_ID: {
				switch(CTI_CAMO_ACTIVATION) do {
					case 4: {//urban
						_uniform = "U_NORTH_FIN_M27_Uniform_CPL";
						_helmet = "H_NORTH_FIN_M22_Fieldcap";
					};
					default {
						_uniform = "U_NORTH_FIN_M27_W_Uniform_CPL";
						_helmet = "H_NORTH_FIN_M22_Furhat";
					};
				};
				_vest = "V_NORTH_FIN_Generic_6";
				_backpack = "NORTH_fin_MolotovBag";
				_helmet = "Headgear_csa38_M35CH";
				_weapon = "NORTH_fin_M27";
				_weapon_ammo = "NORTH_5Rnd_m39_tracer_mag";
				_grenades = "NORTH_molotov";
				_bino = "NORTH_Binocular_Huet";
			};
			default {};
		};
	};
	case CTI_FR_ID: {
		if(_modID == CTI_SPE_ID && (CTI_SPE_DLC >= 1 && [1175380] call CTI_CO_FNC_HasDLC)) then {
			_uniform = "U_SPE_FR_HBT_Uniform";
			_vest = "V_SPE_US_Vest_Garand";
			_backpack = "B_SPE_FR_Backpack_Bandoleer_Rifleman";
			_helmet = "H_SPE_FR_Adrian";
			_weapon = "SPE_M1903A3_Springfield";
			_weapon_ammo = "SPE_5Rnd_762x63_t";
			_grenades = "SPE_US_Mk_2";
			_healing = "SPE_US_FirstAidKit";
			_bino = "SPE_Binocular_US";
			_item_compass = "SPE_US_ItemCompass";
			_item_watch = "SPE_US_ItemWatch";
		} else {};
	};
	default {};
};

missionNamespace setVariable [_defaultGearVar, [
	[[_weapon,[_weapon_att_optic,_weapon_att_light,"",""],[_weapon_ammo]],["",["","","",""],[""]],
	["",["","","",""],[""]]],
	[[_uniform,[_healing,_healing,_weapon_ammo,_weapon_ammo,_weapon_ammo]],
	[_vest,[_grenades,_grenades,_weapon_ammo,_weapon_ammo]],
	["",[]]],
	[_helmet,""],[["",_bino],[_item_map,"",_item_radio,_item_compass,_item_watch]]]];
