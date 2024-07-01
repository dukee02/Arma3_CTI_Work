private ["_faction", "_i", "_p", "_side", "_u", "_tech_level_no_upgrade_inv", "_tech_level", "_upgrade_levels"];

_side = _this;
_upgrade_levels = [];
_tech_level_no_upgrade_inv = 1;
_tech_level = 0;

if(_side == west) then {
	_faction = "West";
} 
else {
	if(_side == east) then {
		_faction = "East";
	} 
	else {
		_faction = "";
	};
};

_upgrade_levels = missionNamespace getVariable Format ["CTI_%1_UPGRADES_LEVELS", _side];
if (isNil "_upgrade_levels") then { 
	_upgrade_levels = [CTI_ECONOMY_LEVEL_INFANTRY,CTI_ECONOMY_LEVEL_WHEELED,CTI_ECONOMY_LEVEL_TRACKED,CTI_ECONOMY_LEVEL_AIR,CTI_ECONOMY_LEVEL_NAVAL,1,-1,-1,-1,1,3,4,CTI_ECONOMY_LEVEL_GEAR,-1]; 
};

_i = [];
_u = [];
_p = [];

//---------------------------Grenades and mines-----------------------------------------
_tech_level=0;
_i pushBack "NORTH_molotov_sokaisupullo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_molotov";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_M43Grenade_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_M32Grenade_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);


_i pushBack "NORTH_KasapanosImpr3kg_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_KasapanosImpr6kg_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_M32MortarNade_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,25] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_Kasapanos2kg_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_Kasapanos3kg_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,100] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_Kasapanos4kg_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,150] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//----------------------Flares and Smokes------------------------------
_tech_level = 0;

_i pushBack "NORTH_M43SmokeGrenade_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20] call CTI_CO_FNC_GetCalculatedItemPrize);

_i pushBack "NORTH_valopistoolim43";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_1Rnd_flare_white_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_1Rnd_flare_red_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_1Rnd_flare_green_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------Pistols----------------------------------------------
_tech_level = 0;

_i pushBack "NORTH_l35";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_8Rnd_l35_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,8,(900*19)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------Rifles----------------------------------------------
_tech_level = 0;
_i pushBack "NORTH_fin_M27";	//mosin
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_m27rv";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_M28";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_M28_30";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_M9130";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_m39";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_m91";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_m24";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_91_vkt";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_5Rnd_m39_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*53)] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_5Rnd_m39_tracer_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,5,(762*53)] call CTI_CO_FNC_GetCalculatedItemPrize);

_tech_level = 1;
_i pushBack "NORTH_fin_m27_optics";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_m39_optics";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_tech_level = 2;
_i pushBack "NORTH_fin_m39_PEM";//sniper
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------Lmg------------------------------------------------------
_tech_level = 1;
_i pushBack "NORTH_kp31";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_kp31_sjr";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_20rnd_kp31_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_50rnd_kp31_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_71rnd_kp31_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,71,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

_tech_level = 2;
_i pushBack "NORTH_SIG_M1920";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_50rnd_SIG_M1920_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,50,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------Hmg------------------------------------------------------
_tech_level = 2;
_i pushBack "NORTH_ls26";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_20Rnd_ls26_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_20Rnd_ls26_mag_Tracer";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,1.0,20,(792*57)] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------AT------------------------------------------------------
_tech_level = 0;
_i pushBack "NORTH_fin_panzerfaustKlein";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_panzerfaust30";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

_tech_level = 2;
_i pushBack "NORTH_fin_panzerschreck";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_panzerschreck_camo";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_panzerschreck_green";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_panzerschreck_mag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.5] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//------------------------------------Uniforms------------------------------------
_tech_level = 0;
//FIN		grey
if(CTI_CAMO_ACTIVATION == 1) then {
	/*_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_CPL";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_CPT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_fur_CPT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_SGT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_1stLT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_fur_1stLT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_Private";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_Private_2";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_Private_3";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_2NDLT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_fur_2NDLT";
	_i pushBack "U_NORTH_FIN_M22_36_W_Greatcoat_SSGT";*/
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_CPL";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_CPT";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_SGT";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_PrivateCL";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_1stLT";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_Private";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_Private_2";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_Private_3";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_W_Greatcoat_SSGT";
};
if(CTI_CAMO_ACTIVATION != 1) then {
	/*_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_CPL";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_COL";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_LTCOL";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_CPT";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_SGT";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_1stLT";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_MAJ";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_Private";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_2NDLT";
	_i pushBack "U_NORTH_FIN_M22_36_Greatcoat_SSGT";*/
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_CPL";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_COL";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_LTCOL";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_CPT";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_SGT";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_MAJ";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_Private";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Greatcoat_SSGT";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_CAMO_ACTIVATION == 1) then {
//brown
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_CPL";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_CPL_2";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_SGT";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_SGT_2";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_Private_1CL";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_Private";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_Private_2";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_Private_3";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_Private_4";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_SSGT";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_SSGT_2";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_CPT";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_1STLT";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_CPT_RES";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_1STLT_RES";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_2NDLT_RES";
	_i pushBack "U_NORTH_FIN_M27_W_Uniform_2NDLT";
	//other
	/*_i pushBack "U_NORTH_FIN_M30_W_Greatcoat_Private";
	_i pushBack "U_NORTH_FIN_M30_W_Greatcoat_Private_2";
	_i pushBack "U_NORTH_FIN_M30_W_Greatcoat_Private_3";
	_i pushBack "U_NORTH_FIN_M31_W_Polushubuk";
	_i pushBack "U_NORTH_FIN_M31_W_Polushubuk_2";
	_i pushBack "U_NORTH_FIN_M31_W_Polushubuk_3";
	_i pushBack "U_NORTH_FIN_M30_Greatcoat_Private";
	//grey
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_CPL";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_CPT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_SGT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_1stLT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_CPT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_1stLT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_2NDLT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private_3";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private_4";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private_5";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_Private_6";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_SSGT";
	//grey normal
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_CPL";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_CPT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_CPT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_SGT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_1stLT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_1stLT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_CPT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_CPT_RES_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_1stLT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_1stLT_RES_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_2NDLT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_2NDLT_RES_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_Private";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_Private_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_2NDLT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_INF_SSGT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_CPL";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_Private";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_CPT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_CPT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_SGT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_1stLT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_CPT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_CPT_RES_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_1stLT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_1stLT_RES_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_2NDLT_RES";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_2NDLT_RES_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_2NDLT_2";
	_i pushBack "U_NORTH_FIN_M36_W_Uniform_JGR_SSGT";*/
};
if(CTI_CAMO_ACTIVATION != 1) then {
	/*_i pushBack "U_NORTH_FIN_M27_Uniform_CPL";
	_i pushBack "U_NORTH_FIN_M27_Uniform_CPL_2";
	_i pushBack "U_NORTH_FIN_M27_Uniform_SGT";
	_i pushBack "U_NORTH_FIN_M27_Uniform_SGT_2";
	_i pushBack "U_NORTH_FIN_M27_Uniform_Private_1CL";
	_i pushBack "U_NORTH_FIN_M27_Uniform_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M27_Uniform_Private";
	_i pushBack "U_NORTH_FIN_M27_Uniform_Private_2";
	_i pushBack "U_NORTH_FIN_M27_Uniform_Private_3";
	_i pushBack "U_NORTH_FIN_M27_Uniform_Private_4";
	_i pushBack "U_NORTH_FIN_M27_Uniform_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M27_Uniform_SSGT";
	_i pushBack "U_NORTH_FIN_M27_Uniform_SSGT_2";
	_i pushBack "U_NORTH_FIN_M27_Uniform_CPT";
	_i pushBack "U_NORTH_FIN_M27_Uniform_1STLT";
	_i pushBack "U_NORTH_FIN_M27_Uniform_CPT_RES";
	_i pushBack "U_NORTH_FIN_M27_Uniform_1STLT_RES";
	_i pushBack "U_NORTH_FIN_M27_Uniform_2NDLT_RES";
	_i pushBack "U_NORTH_FIN_M27_Uniform_2NDLT";*/
	//grey normal
	_i pushBack "U_NORTH_FIN_M36_Uniform_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private_3";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private_4";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private_5";
	_i pushBack "U_NORTH_FIN_M36_Uniform_Private_6";
	_i pushBack "U_NORTH_FIN_M36_Uniform_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_SSGT";
	//air
	/*_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AIR_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ARM_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ART_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_BRD_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_HRR_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_URR_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_CAV_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_INF_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_JGR_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_NAV_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_ENG_SSGT";

	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_3";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_4";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_5";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_6";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_ARM_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_Private";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Uniform_AD_JGR_SSGT";
	//summer
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private_3";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private_4";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private_5";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_Private_6";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AIR_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_CPL_3";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_CPL_4";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_CPT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SGT_3";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SGT_4";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_1CL_3";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_1CL_4";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_1stLT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_3";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_Private_4";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SGTMAJ_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_2NDLT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ARM_SSGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ART_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_BRD_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_CAV_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_HRR_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_URR_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_INF_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_JGR_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_NAV_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_ENG_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_3";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_4";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_5";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_6";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_ARM_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_CPL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_CPL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_Private";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_Private_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_CPT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_SGT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_SGT_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_Private_1CL";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_Private_1CL_2";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Summertunic_AD_JGR_SSGT";
	//black
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_CPL";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_CPT";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_SGT";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_Private";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Leather_Full_SSGT";
	_i pushBack "U_NORTH_FIN_M36_Leather_CPL";
	_i pushBack "U_NORTH_FIN_M36_Leather_CPT";
	_i pushBack "U_NORTH_FIN_M36_Leather_SGT";
	_i pushBack "U_NORTH_FIN_M36_Leather_1stLT";
	_i pushBack "U_NORTH_FIN_M36_Leather_Private";
	_i pushBack "U_NORTH_FIN_M36_Leather_SGTMAJ";
	_i pushBack "U_NORTH_FIN_M36_Leather_2NDLT";
	_i pushBack "U_NORTH_FIN_M36_Leather_SSGT";*/
};

//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_tech_level = 1;
//kombi
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_Hooded";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_Hooded_2";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_Hooded_3";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_Hooded_4";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_Hooded_5";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_Hooded_6";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_2";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_3";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_4";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_5";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Half_6";

//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_tech_level = 2;
//white
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Hooded";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Hooded_2";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Hooded_3";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Hooded_4";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Hooded_5";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_Hooded_6";
_i pushBack "U_NORTH_FIN_M27_Snowsuit";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_2";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_3";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_4";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_5";
_i pushBack "U_NORTH_FIN_M27_Snowsuit_6";

//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-----------------------------------------Vests----------------------------------------------------
_tech_level = 0;
_i pushBack "V_NORTH_FIN_Generic_6";
_i pushBack "V_NORTH_FIN_Generic_1";
/*_i pushBack "V_NORTH_FIN_Generic_3";
_i pushBack "V_NORTH_FIN_Generic_4";
_i pushBack "V_NORTH_FIN_Generic_2";
_i pushBack "V_NORTH_FIN_Generic_5";
_i pushBack "V_NORTH_FIN_Rifleman_3";
_i pushBack "V_NORTH_FIN_Rifleman_9";
_i pushBack "V_NORTH_FIN_Rifleman_4";
_i pushBack "V_NORTH_FIN_Rifleman_5";
_i pushBack "V_NORTH_FIN_Rifleman_7";
_i pushBack "V_NORTH_FIN_Rifleman_1";
_i pushBack "V_NORTH_FIN_Rifleman_2";
_i pushBack "V_NORTH_FIN_Rifleman_8";
_i pushBack "V_NORTH_FIN_Rifleman_11";*/
_i pushBack "V_NORTH_FIN_Rifleman_12";
_i pushBack "V_NORTH_FIN_Rifleman_6";
_i pushBack "V_NORTH_FIN_Rifleman_10";
_i pushBack "V_NORTH_FIN_Officer_3";
_i pushBack "V_NORTH_FIN_Officer_4";
/*_i pushBack "V_NORTH_FIN_Officer_5";
_i pushBack "V_NORTH_FIN_Officer_1";
_i pushBack "V_NORTH_FIN_Officer_2";
_i pushBack "V_NORTH_FIN_Officer_Pioneer_3";
_i pushBack "V_NORTH_FIN_Officer_Pioneer_1";
_i pushBack "V_NORTH_FIN_Officer_Pioneer_2";
_i pushBack "V_NORTH_FIN_Officer_Assault_4";
_i pushBack "V_NORTH_FIN_Officer_Assault_5";
_i pushBack "V_NORTH_FIN_Officer_Assault_1";
_i pushBack "V_NORTH_FIN_Officer_Assault_2";
_i pushBack "V_NORTH_FIN_Officer_Assault_3";
_i pushBack "V_NORTH_FIN_LMG_A";
_i pushBack "V_NORTH_FIN_LMG_1";*/
_i pushBack "V_NORTH_FIN_LMG_2";
_i pushBack "V_NORTH_FIN_Pioneer_Assault_4";
_i pushBack "V_NORTH_FIN_Pioneer_Assault_1";
_i pushBack "V_NORTH_FIN_Pioneer_Assault_2";
_i pushBack "V_NORTH_FIN_Pioneer_Assault_3";
_i pushBack "V_NORTH_FIN_Pioneer_2";
_i pushBack "V_NORTH_FIN_Pioneer_1";
/*_i pushBack "V_NORTH_FIN_Assault_2";
_i pushBack "V_NORTH_FIN_Assault_3";
_i pushBack "V_NORTH_FIN_Assault_6";
_i pushBack "V_NORTH_FIN_Assault_1";
_i pushBack "V_NORTH_FIN_Assault_4";
_i pushBack "V_NORTH_FIN_Assault_8";
_i pushBack "V_NORTH_FIN_Assault_9";
_i pushBack "V_NORTH_FIN_Assault_5";
_i pushBack "V_NORTH_FIN_Assault_7";*/

//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,3.0] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------------Backpacks----------------------------------------------------------
_tech_level = 0;
_i pushBack "NORTH_fin_MolotovBag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_MapBag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_Kyynel";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_tech_level = 1;
_i pushBack "NORTH_fin_BreadBag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_BreadBag2";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_BreadBag3";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
//_i pushBack "NORTH_fin_GasmaskBag";
//_u pushBack _tech_level;
//_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_GasmaskBag_kasapanos";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

_tech_level = 2;
_i pushBack "NORTH_fin_Panzerschreck_frame";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_fin_Sipuli";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

_tech_level = 0;
//mortar
_i pushBack "NORTH_81krh32_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_81krh32_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
//AT gun
_i pushBack "NORTH_Lahti_L39_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_Lahti_L39_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
//static MG
_i pushBack "NORTH_Maxim_Gun_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_Maxim_Tripod_Bag_High";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_Maxim_Tripod_Bag_Medium";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
_i pushBack "NORTH_Maxim_Tripod_Bag";
_u pushBack _tech_level;
_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//--------------------------------------------Helms-------------------------------------------
_tech_level = 0;
if(CTI_CAMO_ACTIVATION == 1) then {
	//winter cap
	_i pushBack "H_NORTH_FIN_M22_Furhat_airforce";
	/*_i pushBack "H_NORTH_FIN_M22_Furhat_officer_airforce";
	_i pushBack "H_NORTH_FIN_M22_Furhat_armor";
	_i pushBack "H_NORTH_FIN_M22_Furhat_officer_armor";
	_i pushBack "H_NORTH_FIN_M22_Furhat_officer";
	_i pushBack "H_NORTH_FIN_M22_Furhat_officer_2";
	_i pushBack "H_NORTH_FIN_M22_Furhat_mounted_officer";
	_i pushBack "H_NORTH_FIN_M22_Furhat_mounted_officer_2";
	_i pushBack "H_NORTH_FIN_M22_Furhat_mounted";
	_i pushBack "H_NORTH_FIN_M22_Furhat_mounted_2";
	_i pushBack "H_NORTH_FIN_M22_Furhat_mounted_3";
	_i pushBack "H_NORTH_FIN_M22_Furhat_mounted_4";
	_i pushBack "H_NORTH_FIN_M22_Furhat";
	_i pushBack "H_NORTH_FIN_M22_Furhat_2";
	_i pushBack "H_NORTH_FIN_M22_Furhat_3";
	_i pushBack "H_NORTH_FIN_M22_Furhat_4";
	_i pushBack "H_NORTH_FIN_M27_furhat";
	_i pushBack "H_NORTH_FIN_M27_furhat_2";
	_i pushBack "H_NORTH_FIN_M27_furhat_3";
	_i pushBack "H_NORTH_FIN_M27_furhat_4";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_officer";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_officer_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_3";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_4";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_5";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_open";
	_i pushBack "H_NORTH_FIN_M39_furhat_beige_open_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_officer";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_officer_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_black";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_3";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_4";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_5";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_open";
	_i pushBack "H_NORTH_FIN_M39_furhat_black_open_2";*/
	_i pushBack "H_NORTH_FIN_M39_furhat_officer";
	//_i pushBack "H_NORTH_FIN_M39_furhat_officer_2";
	//_i pushBack "H_NORTH_FIN_M39_furhat_officer_3";
	_i pushBack "H_NORTH_FIN_M39_furhat";
	_i pushBack "H_NORTH_FIN_M39_furhat_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_3";
	/*_i pushBack "H_NORTH_FIN_M39_furhat_4";
	_i pushBack "H_NORTH_FIN_M39_furhat_5";
	_i pushBack "H_NORTH_FIN_M39_furhat_open";
	_i pushBack "H_NORTH_FIN_M39_furhat_open_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_beige_officer";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_beige_officer_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_black_officer";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_black_officer_2";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_general";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_officer";
	_i pushBack "H_NORTH_FIN_M39_furhat_fancy_officer_2";
	_i pushBack "H_NORTH_CIV_Koivistolainen_1";
	_i pushBack "H_NORTH_CIV_Koivistolainen_2";
	_i pushBack "H_NORTH_CIV_Koivistolainen_3";
	_i pushBack "H_NORTH_CIV_Koivistolainen_4";
	_i pushBack "H_NORTH_CIV_Koivistolainen_5";*/
	_i pushBack "H_NORTH_FIN_Koivistolainen_1";
	_i pushBack "H_NORTH_FIN_Koivistolainen_2";
	_i pushBack "H_NORTH_FIN_Koivistolainen_3";
	_i pushBack "H_NORTH_FIN_Koivistolainen_4";
	_i pushBack "H_NORTH_FIN_Koivistolainen_5";
};
if(CTI_CAMO_ACTIVATION == 1) then {
	//summer hat
	/*_i pushBack "H_NORTH_FIN_M22_Fieldcap_airforce";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_officer_airforce";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_armor";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_officer_armor";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_officer";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_officer_2";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_mounted_officer";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_mounted_officer_2";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_mounted";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_mounted_2";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_mounted_3";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_mounted_4";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_2";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_3";
	_i pushBack "H_NORTH_FIN_M22_Fieldcap_4";
	_i pushBack "H_NORTH_FIN_M22_Officercap";
	_i pushBack "H_NORTH_FIN_M22_Officercap_Staff";
	_i pushBack "H_NORTH_FIN_M22_Officercap_airforce";
	_i pushBack "H_NORTH_FIN_M22_Officercap_airforce_Staff";
	_i pushBack "H_NORTH_FIN_M27_civilguardhat";
	_i pushBack "H_NORTH_FIN_m27_civilguardhat_2";
	_i pushBack "H_NORTH_FIN_m27_civilguardhat_3";
	_i pushBack "H_NORTH_FIN_m27_civilguardhat_4";*/
	_i pushBack "H_NORTH_FIN_M36_fieldcap";
	_i pushBack "H_NORTH_FIN_m36_fieldcap_early";
	_i pushBack "H_NORTH_FIN_m36_fieldcap_early_2";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_nocockade";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_nocockade_2";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_officer";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_armoreddiv";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_armoreddiv_officer";
	/*_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_officer";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_armoreddiv_officer";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_armoreddiv";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_armoreddiv_2";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_armoreddiv_3";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_armoreddiv_4";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_2";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_3";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_4";
	_i pushBack "H_NORTH_FIN_M36_fieldcap_worn_reversed";
	_i pushBack "H_NORTH_FIN_M36_cap_AF";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_AF";
	_i pushBack "H_NORTH_FIN_M36_cap_ARM";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_ARM";
	_i pushBack "H_NORTH_FIN_M36_cap_ART";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_ART";
	_i pushBack "H_NORTH_FIN_M36_cap_BRD";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_BRD";
	_i pushBack "H_NORTH_FIN_M36_cap_CAV";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_CAV";
	_i pushBack "H_NORTH_FIN_M36_cap";
	_i pushBack "H_NORTH_FIN_M36_cap_officer";
	_i pushBack "H_NORTH_FIN_M36_cap_ENG";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_ENG";
	_i pushBack "H_NORTH_FIN_M36_cap_armoreddiv_ARM";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_armoreddiv_ARM";
	_i pushBack "H_NORTH_FIN_M36_cap_armoreddiv_ART";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_armoreddiv_ART";
	_i pushBack "H_NORTH_FIN_M36_cap_armoreddiv";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_armoreddiv";
	_i pushBack "H_NORTH_FIN_M36_cap_armoreddiv_ENG";
	_i pushBack "H_NORTH_FIN_M36_cap_officer_armoreddiv_ENG";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_AF";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_AF_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_AF";
	_i pushBack "H_NORTH_FIN_M39_summercap_AF_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ARM";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ARM_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ARM_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_ARM";
	_i pushBack "H_NORTH_FIN_M39_summercap_ARM_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_ARM_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ART";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ART_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_ART";
	_i pushBack "H_NORTH_FIN_M39_summercap_ART_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_BRD";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_BRD_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_BRD";
	_i pushBack "H_NORTH_FIN_M39_summercap_BRD_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_CAV";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_CAV_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_CAV";
	_i pushBack "H_NORTH_FIN_M39_summercap_CAV_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_INF";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_INF_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_INF_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_INF";
	_i pushBack "H_NORTH_FIN_M39_summercap_INF_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_INF_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_NAV";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_NAV";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ENG";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ENG_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_ENG_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_ENG";
	_i pushBack "H_NORTH_FIN_M39_summercap_ENG_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_ENG_3";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_PsD";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_PsD_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_PsD";
	_i pushBack "H_NORTH_FIN_M39_summercap_PsD_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_PsD_ARM";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_PsD_ARM_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_PsD_ARM";
	_i pushBack "H_NORTH_FIN_M39_summercap_PsD_ARM_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_PsD_JGR";
	_i pushBack "H_NORTH_FIN_M39_summercap_officer_PsD_JGR_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_PsD_Jgr";
	_i pushBack "H_NORTH_FIN_M39_summercap_PsD_JGR_2";*/
	_i pushBack "H_NORTH_FIN_M39_summercap";
	_i pushBack "H_NORTH_FIN_M39_summercap_2";
	_i pushBack "H_NORTH_FIN_M39_summercap_3";
	_i pushBack "H_NORTH_FIN_Tankerhelmet";
	_i pushBack "H_NORTH_FIN_Tankerhelmet_open";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_tech_level = 1;
if(CTI_CAMO_ACTIVATION == 1) then {
	//winter
	/*_i pushBack "H_NORTH_FIN_M16_Helmet_Winter";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_2";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_2";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_2";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Winter";*/
	_i pushBack "H_NORTH_FIN_M35_Helmet_Winter";
	_i pushBack "H_NORTH_FIN_M35_Helmet_Winter_2";
	_i pushBack "H_NORTH_FIN_M37_Helmet_Winter";
	/*_i pushBack "H_NORTH_FIN_M38_Helmet_Winter_2";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Winter";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Winter";*/
};
if(CTI_CAMO_ACTIVATION != 1) then {
	//summer helmet
	/*_i pushBack "H_NORTH_FIN_M16_Helmet17D_FIN";
	_i pushBack "H_NORTH_FIN_M16_Helmet17D_SWE";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M16_Helmet";
	_i pushBack "H_NORTH_FIN_M16_Helmet_2";
	_i pushBack "H_NORTH_FIN_M16_Helmet_3";
	_i pushBack "H_NORTH_FIN_M17_Helmet";
	_i pushBack "H_NORTH_FIN_M17_Helmet17D_FIN";
	_i pushBack "H_NORTH_FIN_M17_Helmet17D_SWE";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M18C_Helmet";
	_i pushBack "H_NORTH_FIN_M18_Helmet";
	_i pushBack "H_NORTH_FIN_M18_Helmet_2";
	_i pushBack "H_NORTH_FIN_M26_Helmet";
	_i pushBack "H_NORTH_FIN_M26_Helmet_finpaint";
	_i pushBack "H_NORTH_FIN_M33_Helmet";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M34_Helmet";
	_i pushBack "H_NORTH_FIN_M35_40_Helmet";
	_i pushBack "H_NORTH_FIN_M35_42_Helmet";
	_i pushBack "H_NORTH_FIN_M35_Helmet17D_FIN";
	_i pushBack "H_NORTH_FIN_M35_Helmet17D_SWE";
	_i pushBack "H_NORTH_FIN_M35_JR47";*/
	_i pushBack "H_NORTH_FIN_M35_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M35_Helmet";
	_i pushBack "H_NORTH_FIN_M37_Helmet_17D_FIN";
	_i pushBack "H_NORTH_FIN_M37_Helmet_17D_SWE";
	_i pushBack "H_NORTH_FIN_M37_Helmet_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M37_Helmet";
	/*_i pushBack "H_NORTH_FIN_M38_Helmet17D_FIN";
	_i pushBack "H_NORTH_FIN_M38_Helmet17D_SWE";
	_i pushBack "H_NORTH_FIN_M38_Helmet_JR47";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Armoreddiv_2";
	_i pushBack "H_NORTH_FIN_M38_Helmet";
	_i pushBack "H_NORTH_FIN_M38_Helmet_2";
	_i pushBack "H_NORTH_FIN_M38_Helmet_3";
	_i pushBack "H_NORTH_FIN_M38_Helmet_4";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Armoreddiv";
	_i pushBack "H_NORTH_FIN_M40_Helmet";*/
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

_tech_level = 2;
if(CTI_CAMO_ACTIVATION == 1) then {
	//winter white
	/*_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_Camo_2";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_Whitewash";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_Whitewash_2";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_Camo_2";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_Whitewash";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_Whitewash_2";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_Camo_2";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_Whitewash";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_Whitewash_2";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Winter_Whitewash";*/
	_i pushBack "H_NORTH_FIN_M35_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M35_Helmet_Winter_Camo_2";
	_i pushBack "H_NORTH_FIN_M37_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M37_Helmet_Winter_Whitewash";
	/*_i pushBack "H_NORTH_FIN_M38_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Winter_Camo_2";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Winter_Whitewash";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Winter_Whitewash_2";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Winter_Camo";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Winter_Whitewash";
	//winter lol
	_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_KevOs4";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Winter_KevOs4_2";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_KevOs4";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Winter_KevOs4_2";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_KevOs4";*/
	_i pushBack "H_NORTH_FIN_M18_Helmet_Winter_KevOs4_2";
};
if(CTI_CAMO_ACTIVATION == 1) then {
	//summer camo
	/*_i pushBack "H_NORTH_FIN_M16_Helmet_Moss";
	_i pushBack "H_NORTH_FIN_M16_Helmet_Mossycamo";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Moss";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Moss_2";
	_i pushBack "H_NORTH_FIN_M17_Helmet_Mossycamo";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Moss";
	_i pushBack "H_NORTH_FIN_M18_Helmet_Moss_2";
	_i pushBack "H_NORTH_FIN_M26_Helmet_camo";
	_i pushBack "H_NORTH_FIN_M34_Helmet_JR46";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Moss";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Moss_2";
	_i pushBack "H_NORTH_FIN_M34_Helmet_Mossycamo";*/
	_i pushBack "H_NORTH_FIN_M35_JR46";
	_i pushBack "H_NORTH_FIN_M35_Helmet_Moss";
	_i pushBack "H_NORTH_FIN_M35_Helmet_Moss_2";
	_i pushBack "H_NORTH_FIN_M35_Helmet_Mossycamo";
	_i pushBack "H_NORTH_FIN_M37_Helmet_JR46";
	_i pushBack "H_NORTH_FIN_M37_Helmet_Moss";
	/*_i pushBack "H_NORTH_FIN_M37_Helmet_Moss_2";
	_i pushBack "H_NORTH_FIN_M37_Helmet_Mossycamo";
	_i pushBack "H_NORTH_FIN_M38_Helmet_JR46";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Mossycamo";
	_i pushBack "H_NORTH_FIN_M38_Helmet_Spottycamo";
	_i pushBack "H_NORTH_FIN_M40_Helmet_JR46";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Moss";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Moss_2";
	_i pushBack "H_NORTH_FIN_M40_Helmet_Mossycamo";*/
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//Update the calculatetd max upgrade level
if(_tech_level > _upgrade_levels select CTI_UPGRADE_GEAR) then {
	_upgrade_levels set [CTI_UPGRADE_GEAR, _tech_level];
};

//-------------------------------------------Glasses------------------------------------------------
_tech_level = 0;

_i pushBack "G_NORTH_FIN_Balaclava";
_i pushBack "G_NORTH_FIN_Medicalarmband";
_i pushBack "G_NORTH_FIN_Officerscarf";
_i pushBack "G_NORTH_FIN_Scarf";
_i pushBack "G_NORTH_FIN_Scarf_Small";
/*_i pushBack "G_NORTH_FIN_Balaclava_2";
_i pushBack "G_NORTH_FIN_Balaclava_3";
_i pushBack "G_NORTH_FIN_Balaclava_4";
_i pushBack "G_NORTH_FIN_Balaclava_5";
_i pushBack "G_NORTH_FIN_Glasses";
_i pushBack "G_NORTH_FIN_Glasses_2";
_i pushBack "G_NORTH_FIN_Scarf_Small_2";
_i pushBack "G_NORTH_FIN_Scarf_Small_3";
_i pushBack "G_NORTH_FIN_Scarf_Small_4";
_i pushBack "G_NORTH_FIN_Scarf_2";
_i pushBack "G_NORTH_FIN_Scarf_3";
_i pushBack "G_NORTH_FIN_Scarf_4";
_i pushBack "G_NORTH_FIN_Scarf_5";
_i pushBack "G_NORTH_FIN_Sunglasses";
_i pushBack "G_NORTH_FIN_Sunglasses_2";*/
//NVG-slot
_i pushBack "G_NORTH_FIN_Gloves_leather";
_i pushBack "G_NORTH_FIN_Gloves_leather_2";
/*_i pushBack "G_NORTH_FIN_Gloves";
_i pushBack "G_NORTH_FIN_Gloves_2";
_i pushBack "G_NORTH_FIN_Gloves_3";
_i pushBack "G_NORTH_FIN_Gloves_4";
_i pushBack "G_NORTH_FIN_Hangospannet";*/

if(CTI_IFA_ADDON < 0 && CTI_NF_ADDON <= 0) then {
	_i pushBack "G_Combat";
	_i pushBack "G_Shades_Black";
	_i pushBack "G_Tactical_Clear";
	_i pushBack "G_Sport_Blackred";
	_i pushBack "g_goggles_vr";
};
//set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _cnt = 0 }, { _cnt < _cntstart-_cntend }, { _cnt = _cnt + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_EQUIPMENT,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

//-----------------------------------------Attachments------------------------------------------------

//------------------------------------------Items-------------------------------------------------
_tech_level = 0;

_i pushBack "NORTH_Binocular_Huet";
_i pushBack "NORTH_Binocular_Zeiss";
// set all other vars in a slope
_cntstart = count _i;
_cntend = count _p;
for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
	_u pushBack _tech_level;
	_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
};

if(CTI_IFA_ADDON < 0 && CTI_NF_ADDON <= 0) then {
	_i pushBack "ItemMap";
	_i pushBack "ItemRadio";
	_i pushBack "ItemCompass";
	_i pushBack "ItemWatch";
	// set all other vars in a slope
	_cntstart = count _i;
	_cntend = count _p;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,0.25] call CTI_CO_FNC_GetCalculatedItemPrize);
	};

	_i pushBack "MineDetector";
	_i pushBack "FirstAidKit";
	// set all other vars in a slope
	_cntstart = count _i;
	_cntend = count _p;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level] call CTI_CO_FNC_GetCalculatedItemPrize);
	};

	_i pushBack "Medikit";
	_i pushBack "ToolKit";
	// set all other vars in a slope
	_cntstart = count _i;
	_cntend = count _p;
	for [{ _j = 0 }, { _j < _cntstart-_cntend }, { _j = _j + 1 }] do { 
		_u pushBack _tech_level;
		_p pushBack ([CTI_ECONOMY_PRIZE_WEAPONS,_tech_level,2.0] call CTI_CO_FNC_GetCalculatedItemPrize);
	};
};

//all units are declared, we update the possible upgrades if this script
//runns on the server, if on client we setup the gear config.
if(!isNil 'CTI_Init_Common') then {
	[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";
} else {
	missionNamespace setVariable [Format["CTI_%1_UPGRADES_LEVELS", _side], _upgrade_levels];
	if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\config\gear\gear_FIN_NF.sqf", format["calculated upgrade levels for %1: [%2] ", _side, _upgrade_levels]] call CTI_CO_FNC_Log};
};
