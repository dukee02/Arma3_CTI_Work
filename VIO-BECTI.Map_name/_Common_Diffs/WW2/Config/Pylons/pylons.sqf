private ["_c", "_d", "_m", "_u", "_upgrade_levels_east", "_upgrade_levels_west", "_cntstart", "_cntend"];

//We get the upgrade setup at this point, if this is null, something went wrong and we set it to the default.
_upgrade_levels_east = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", east];
if (isNil "_upgrade_levels_east") then { 
	_upgrade_levels_east = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};
_upgrade_levels_west = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", west];
if (isNil "_upgrade_levels_west") then { 
	_upgrade_levels_west = [0,0,0,0,0,1,-1,-1,-1,1,3,4,0,-1]; 
};

_c = []; //--- Classname
_d = []; //--- Cathegory
_m = []; //--- Max amount per vehicle.
_u = []; //--- Upgrade level needed.    0 1 2 3...

//*********************************************************************************************************************************************
//														air-to-air missile																	  *
//*********************************************************************************************************************************************
_tech_level = 0;

//*****************************************************LEVEL*1****************************************************************************
/*_tech_level = 1;

//_c pushBack "PylonMissile_1Rnd_AAA_missiles";			//ASRAAM 			<Short-range, infrared-guided, air-to-air missile with high-explosive warhead>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-air";
	_m pushBack 100;
	_u pushBack _tech_level;
};*/

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_AA) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_AA, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_AA) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_AA, (_tech_level)];
};

//*********************************************************************************************************************************************
//														air-to-surface missile																  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
/*_tech_level = 1;

//_c pushBack "PylonRack_12Rnd_PG_missiles";				//DAGR 				<Short-range, laser/infrared-guided, air-to-surface missile with high-explosive anti-tank warhead>

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "air-to-surface";
	_m pushBack 100;
	_u pushBack _tech_level;
};*/

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_AT) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_AT, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_AT) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_AT, (_tech_level)];
};

//*********************************************************************************************************************************************
//														Unguided rockets																	  *
//*********************************************************************************************************************************************
//*****************************************************LEVEL*1****************************************************************************
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 1;

	_c pushBack "sab_fl_rocket_3rnd_m10_mag";					//RKT M8 AP 3x				<Unguided rockets with high-explosive warhead>
	_c pushBack "sab_fl_rocket_4rnd_rp3_mag";					//RKT RP3 4x				<Unguided rockets with high-explosive warhead>
	_c pushBack "sab_fl_rocket_1rnd_rp3_mag";					//RP3 1x					<Unguided rockets with high-explosive warhead>

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "air-to-surface";
		_m pushBack 100;
		_u pushBack _tech_level;
	};

	//Update the calculated max upgrade level
	if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
		_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
	};
	if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
		_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
	};
};

//*********************************************************************************************************************************************
//														bomb																				  *
//*********************************************************************************************************************************************
_tech_level = 0;
//*****************************************************LEVEL*1****************************************************************************
if(CTI_IFA_ADDON > 0) then {
	_tech_level = 1;

	_c pushBack "LIB_1Rnd_SC50";										//SC-50
};
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 1;
	
	_c pushBack "sab_fl_bomb_ijn_1rnd_130_mag";							//BMB 60kg
	_c pushBack "sab_fl_bomb_axis_1rnd_100_mag";						//BMB 50kg
	_c pushBack "sab_fl_bomb_axis_4rnd_100_bf109_mag";					//BMB 4x50kg
	_c pushBack "sab_fl_bomb_ijn_6rnd_130_mag";							//BMB 6x130lb
	_c pushBack "sab_fl_bomb_axis_8rnd_100_mag";						//BAY 8x50kg
	_c pushBack "sab_fl_bomb_axis_24rnd_100_mag";						//BAY 24x50kg
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*2****************************************************************************
if(CTI_IFA_ADDON > 0) then {
	_tech_level = 2;

	_c pushBack "LIB_1Rnd_FAB250";										//FAB-250 bomb
	_c pushBack "LIB_1Rnd_SC250";										//SC-250
};
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 2;
	
	_c pushBack "sab_fl_bomb_allies_1rnd_250_mag";						//BMB 250lb
	_c pushBack "sab_fl_bomb_raf_1rnd_250_mag";							//BMB 250lb
	_c pushBack "sab_fl_bomb_axis_1rnd_250_mag";						//BMB 100kg

	_c pushBack "sab_fl_bomb_48rnd_ptab_cluster_mag";					//48xPTAB
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*3****************************************************************************
if(CTI_IFA_ADDON > 0) then {
	_tech_level = 3;

	_c pushBack "LIB_1Rnd_US_500lb";									//500 lb Bomb
	_c pushBack "LIB_1Rnd_SC500";										//SC-500
};
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 3;

	_c pushBack "sab_fl_bomb_allies_1rnd_500_mag";						//BMB 500lb
	_c pushBack "sab_fl_bomb_raf_1rnd_500_mag";							//BMB 500lb
	_c pushBack "sab_fl_bomb_ijn_1rnd_550_mag";							//BMB 250kg
	_c pushBack "sab_fl_bomb_axis_1rnd_500_mag";						//BMB 250kg
	_c pushBack "sab_fl_bomb_raf_2rnd_500_mag";							//BAY 2x500lb
	_c pushBack "sab_fl_bomb_allies_4rnd_flat_500_mag";					//BAY 4x1000lb
};

// set all other vars in a slope
_cntstart = count _c;
_cntend = count _d;
for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
	_d pushBack "bomb";
	_m pushBack 100;
	_u pushBack _tech_level;
};

//*****************************************************LEVEL*4****************************************************************************
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 4;

	_c pushBack "sab_fl_bomb_allies_1rnd_1000_mag";						//BMB 1000lb
	_c pushBack "sab_fl_bomb_raf_1rnd_1000_mag";						//BMB 1000lb
	_c pushBack "sab_fl_bomb_axis_1rnd_1000_mag";						//BMB 500kg
	_c pushBack "sab_fl_bomb_allies_4rnd_1000_mag";						//BAY 4x1000lb
	_c pushBack "sab_fl_bomb_allies_8rnd_1000_mag";						//BAY 8x1000lb
	_c pushBack "sab_fl_bomb_raf_8rnd_1000_mag";						//BAY 8x1000lb
	_c pushBack "sab_fl_bomb_raf_2rnd_1000_mag";						//BAY 2x1000lb
	_c pushBack "sab_fl_bomb_allies_4rnd_flat_1000_mag";				//BAY 4x1000lb
	_c pushBack "sab_fl_bomb_axis_8rnd_flat_1000_mag";					//BAY 8x1000l

	_c pushBack "sab_fl_bomb_axis_fritzx_mag";							//BMB X-1
	_c pushBack "sab_fl_bomb_axis_1rnd_2000_mag";						//BMB 1000kg


	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "bomb";
		_m pushBack 100;
		_u pushBack _tech_level;
	};
};
//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};

//*******************************************************************************************************************************************
//														weapon pod																		  	*
//*******************************************************************************************************************************************
_tech_level = 0;
//*****************************************************LEVEL*1****************************************************************************
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 1;

	_c pushBack "sab_fl_pod_wb81_b_pylon_mag";			//POD WB81 B
	_c pushBack "sab_fl_pod_bk37_he_pylon_mag";			//POD Cannon HE

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "weapon pod";
		_m pushBack 100;
		_u pushBack _tech_level;
	};
};
//*****************************************************LEVEL*2****************************************************************************
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 2;

	_c pushBack "sab_fl_pod_bk37_ap_pylon_mag";			//POD Cannon AT
	_c pushBack "sab_fl_pod_s40mm_ap_pylon_mag";		//POD Cannon AT
	_c pushBack "sab_fl_pod_ns37_ap_pylon_mag";			//POD Cannon AT

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "weapon pod";
		_m pushBack 100;
		_u pushBack _tech_level;
	};
};

//Update the calculated max upgrade level
if((_tech_level) > _upgrade_levels_east select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_east set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};
if((_tech_level) > _upgrade_levels_west select CTI_UPGRADE_AIR_FFAR) then {
	_upgrade_levels_west set [CTI_UPGRADE_AIR_FFAR, (_tech_level)];
};

//*********************************************************************************************************************************************
//														special-purpose																		  *
//*********************************************************************************************************************************************
if(CTI_SABFL_ADDON > 0) then {
	_tech_level = 0;

	_c pushBack "sab_fl_tank_allies_mag";		//TNK Droptank
	_c pushBack "sab_fl_tank_axis_mag";			//TNK Treibstofftank
	_c pushBack "sab_fl_tank_ijn_mag";			//TNK Droptank

	// set all other vars in a slope
	_cntstart = count _c;
	_cntend = count _d;
	for [{ _i = 0 }, { _i < _cntstart-_cntend }, { _i = _i + 1 }] do { 
		_d pushBack "special-purpose";
		_m pushBack 100;
		_u pushBack _tech_level;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["pylons declared: [%1] ", count _c]] call CTI_CO_FNC_Log};

[_c, _d, _m, _u] call compile preprocessFileLineNumbers "Common\Config\pylons\Set_Pylons.sqf";

//all units are declared, we update the possible upgrades
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", east], _upgrade_levels_east];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["calculated upgrade levels for %1: [%2] ", east, _upgrade_levels_east]] call CTI_CO_FNC_Log};
missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", west], _upgrade_levels_west];
if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\pylons\pylons.sqf", format["calculated upgrade levels for %1: [%2] ", west, _upgrade_levels_west]] call CTI_CO_FNC_Log};
