_side = _this;
_sid = "";

if(_side == west) then {
	_sid = "VIOC_B_";
} 
else {
	if(_side == east) then {
		_sid = "VIOC_O_";
	} 
	else {
		_sid = "VIOC_I_";
	};
};
if !(("SPE_GER_rifleman") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

//Defense Guns for Towns
_classes_town = [];
_categories_town = [];

if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {		
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_classes_town pushBack 		format["%1LIB_FlaK_30_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_w", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_AA_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_ARTY_w", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_38_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Flakvierling_38_w", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Pak40_w", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION == 2 || CTI_CAMO_ACTIVATION == 3) then {		//Desert camo active
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36_AA", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_DAK_FlaK_36_ARTY", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_DAK_Pak40", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 2) then {		//Desert camo active
			//_classes_town pushBack 		format["%1LIB_GER_SearchLight", _sid];
			//_categories_town pushBack 	"View";
				
			_classes_town pushBack 		format["%1LIB_MG34_Lafette_Deployed", _sid];
			_categories_town pushBack 	"MG";
				
			//_classes_town pushBack 		format["%1LIB_MG34_Lafette_low_Deployed", _sid];
			//_categories_town pushBack 	"Defense";
				
			_classes_town pushBack 		format["%1LIB_GrWr34", _sid];
			_categories_town pushBack 	"Mortar";
				
			_classes_town pushBack 		format["%1LIB_GrWr34_g", _sid];
			_categories_town pushBack 	"Mortar";
			
			_classes_town pushBack 		format["%1LIB_FlaK_30", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_leFH18", _sid];
			_categories_town pushBack 	"Artillery";
			
			//_classes_town pushBack 		format["%1LIB_leFH18_AT", _sid];
			//_categories_town pushBack 	"AT";
		
			_classes_town pushBack 		format["%1LIB_MG42_Lafette_Deployed", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1LIB_MG42_Lafette_low_Deployed", _sid];
			_categories_town pushBack 	"MG";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_AA", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_FlaK_36_ARTY", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_FlaK_38", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Nebelwerfer41", _sid];
			_categories_town pushBack 	"Artillery";
				
			_classes_town pushBack 		format["%1LIB_Nebelwerfer41_Camo", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_Nebelwerfer41_Gelbbraun", _sid];
			_categories_town pushBack 	"Artillery";
			
			_classes_town pushBack 		format["%1LIB_Flakvierling_38", _sid];
			_categories_town pushBack 	"AA";
			
			_classes_town pushBack 		format["%1LIB_Pak40", _sid];
			_categories_town pushBack 	"AT";
		};
	};
	if(CTI_FOW_ADDON > 0) then {
		if !(("VIOC_I_fow_w_mg42_deployed_ger_heer") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};
		_classes_town pushBack 		format["%1fow_w_mg42_deployed_ger_heer", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_pak40_gray_ger_heer", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"AA";
		//no matching classes found
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"Artillery";
		
		/*fow_w_mg42_deployed_high_ger_heer
		fow_w_mg42_deployed_s_ger_heer
		fow_w_mg42_deployed_middle_ger_heer
		fow_w_pak40_camo_foliage_ger_heer
		fow_w_pak40_camo_ger_heer
		fow_w_pak40_yellow_ger_heer
		fow_w_flak36_camo_ger_heer
		fow_w_flak36_green_ger_heer
		fow_w_flak36_tan_ger_heer*/
	};
	if(CTI_CSA_ADDON > 0) then {
		_classes_town pushBack 		format["%1CSA38_MG34t", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CSA38_zb30jt", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1csa38_GrW34", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1csa38_pak35", _sid];
		_categories_town pushBack 	"AT";		
	};
};
if(CTI_JPN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_FOW_ADDON > 0) then {
		if !(("VIOC_I_fow_w_6Pounder_ija") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};

		_classes_town pushBack 		format["%1fow_w_type92_tripod_ija", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_type97_mortar_ija", _sid];
		_categories_town pushBack 	"Mortar";
	
		_classes_town pushBack 		format["%1fow_w_6Pounder_ija", _sid];
		_categories_town pushBack 	"AT";
		
		//no matching classes found
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1fow_w_flak36_gray_ger_heer", _sid];
		_categories_town pushBack 	"Artillery";
		
		/*fow_w_type92_tripod_high_ija
		fow_w_type92_tripod_low_s_ija
		fow_w_type92_tripod_low_ija
		fow_w_type92_tripod_middle_ija
		fow_w_type97_mortar_adv_ija*/
	};
};
if(CTI_SOV_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
		_classes_town pushBack 		format["%1LIB_SU_SearchLight", _sid];
		_categories_town pushBack 	"View";
		
		_classes_town pushBack 		format["%1LIB_Maxim_M30_base", _sid];
		_categories_town pushBack 	"MG";
			
		_classes_town pushBack 		format["%1LIB_Maxim_M30_Trench", _sid];
		_categories_town pushBack 	"MG";
			
		if(CTI_CAMO_ACTIVATION == 1 || CTI_CAMO_ACTIVATION == 3) then {		//Winter camo active
			_classes_town pushBack 		format["%1LIB_Zis3_w", _sid];
			_categories_town pushBack 	"AT";
		};
		if(CTI_CAMO_ACTIVATION < 1 || CTI_CAMO_ACTIVATION > 1) then {		//Desert camo active
			_classes_town pushBack 		format["%1LIB_Zis3", _sid];
			_categories_town pushBack 	"AT";
		};
		
		_classes_town pushBack 		format["%1LIB_BM37", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
	};	
	if(CTI_NF_ADDON > 0) then {
		_classes_town pushBack 		format["%1NORTH_SOV_76mm1927", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1NORTH_SOV_45mm1937", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1NORTH_SOV_76mm1936", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1NORTH_SOV_50rm38", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1NORTH_SOV_Maxim_Quad", _sid];
		_categories_town pushBack 	"AA";
	};
};
if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
		_classes_town pushBack 		format["%1LIB_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1LIB_M2_60", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_Zis3", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
	};
	if(CTI_FOW_ADDON > 0) then {
		if !(("VIOC_I_fow_w_vickers_uk") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};
		_classes_town pushBack 		format["%1fow_w_vickers_uk", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_6Pounder_uk", _sid];
		_categories_town pushBack 	"AT";
		//no matching classes found		
		_classes_town pushBack 		format["%1fow_w_vickers_uk", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1fow_w_vickers_uk", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1fow_w_6Pounder_uk", _sid];
		_categories_town pushBack 	"Artillery";
	};
};
if(CTI_UK_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_IFA_ADDON >= 1) then {
	
		_classes_town pushBack 		format["%1LIB_M2_60", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1LIB_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
			
		_classes_town pushBack 		format["%1LIB_Zis3", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1LIB_61k", _sid];
		_categories_town pushBack 	"AA";
	};
	if(CTI_FOW_ADDON > 0) then {
		if !(("VIOC_I_fow_w_m1919_tripod_usa_m37") call CTI_CO_FNC_IsSidePatchLoaded) then {_sid = "";};
		_classes_town pushBack 		format["%1fow_w_m1919_tripod_usa_m37", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_m1919_tripod_usa_m41", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1fow_w_m2_mortar_usa", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1fow_w_6Pounder_usa", _sid];
		_categories_town pushBack 	"AT";
		//no matching classes found
		_classes_town pushBack 		format["%1fow_w_m1919_tripod_usa_m41", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1fow_w_m2_mortar_usa", _sid];
		_categories_town pushBack 	"Artillery";
		
		/*fow_w_m1919a6_deployed_high_usa_m41
		fow_w_m1919a6_deployed_high_usa_m37
		fow_w_m1919a6_deployed_usa_m37
		fow_w_m1919a6_deployed_usa_m41
		fow_w_m1919a6_deployed_middle_usa_m37
		fow_w_m1919a6_deployed_middle_usa_m41
		fow_w_m1919_tripod_usa_mm
		fow_w_m1919_tripod_usa_p
		fow_w_m1919a6_deployed_high_usa_p
		fow_w_m1919a6_deployed_high_usa_mm
		fow_w_m1919a6_deployed_usa_mm
		fow_w_m1919a6_deployed_usa_p
		fow_w_m1919a6_deployed_middle_usa_mm
		fow_w_m1919a6_deployed_middle_usa_p
		fow_w_m1919_tripod_usmc_camo01
		fow_w_m1919_tripod_usmc_camo02
		fow_w_m1919_tripod_usmc
		fow_w_m1919a6_deployed_high_usmc
		fow_w_m1919a6_deployed_high_usmc_camo01
		fow_w_m1919a6_deployed_high_usmc_camo02
		fow_w_m1919a6_deployed_usmc
		fow_w_m1919a6_deployed_usmc_camo02
		fow_w_m1919a6_deployed_usmc_camo01
		fow_w_m1919a6_deployed_middle_usmc_camo01
		fow_w_m1919a6_deployed_middle_usmc_camo02
		fow_w_m1919a6_deployed_middle_usmc
		fow_w_m2_mortar_adv_usa
		fow_w_m2_mortar_usmc
		fow_w_m2_mortar_adv_usmc
		fow_w_6Pounder_usmc*/
	};
	if(CTI_CSA_ADDON > 0) then {
		_classes_town pushBack 		format["%1CSA38_TKVZ24mg", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1CSA38_TKVZ37MG", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1csa38_KPUV37", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1CSA38_mvz17", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1CSA38_mvz36", _sid];
		_categories_town pushBack 	"Artillery";
	};
};

if(CTI_SPE_DLC >= 1) then {
	if(CTI_GER_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_classes_town pushBack 		format["%1SPE_MG34_Lafette_Deployed", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1SPE_GrW278_1", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1SPE_Pak40", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1SPE_FlaK_30", _sid];
		_categories_town pushBack 	"AA";
	};
	if(CTI_US_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
		_classes_town pushBack 		format["%1SPE_M1919_M2", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1SPE_M1_81", _sid];
		_categories_town pushBack 	"Mortar";
			
		_classes_town pushBack 		format["%1SPE_57mm_M1", _sid];
		_categories_town pushBack 	"AT";
			
		_classes_town pushBack 		format["%1SPE_M45_Quadmount", _sid];
		_categories_town pushBack 	"AA";
	};
};

if(CTI_FIN_SIDE == (_side) call CTI_CO_FNC_GetSideID) then {
	if(CTI_NF_ADDON > 0) then {
		_classes_town pushBack 		format["%1NORTH_FIN_S_41_Lahti_L39", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1NORTH_FIN_S_Maxim_41", _sid];
		_categories_town pushBack 	"MG";
		
		_classes_town pushBack 		format["%1NORTH_FIN_S_41_37PSTK36", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1NORTH_FIN_S_41_76k36", _sid];
		_categories_town pushBack 	"AT";
		
		_classes_town pushBack 		format["%1NORTH_FIN_S_41_81krh32", _sid];
		_categories_town pushBack 	"Mortar";
		
		_classes_town pushBack 		format["%1NORTH_FIN_S_41_152H38", _sid];
		_categories_town pushBack 	"Artillery";
		
		_classes_town pushBack 		format["%1NORTH_FIN_Lahti_L39AA", _sid];
		_categories_town pushBack 	"AA";
		
		_classes_town pushBack 		format["%1NORTH_FIN_Maxim_Quad", _sid];
		_categories_town pushBack 	"AA";
	};
};

//--- Defenses management for towns.
if (isServer) then {[_side, _classes_town, _categories_town] Call Compile preprocessFileLineNumbers "Common\Config\Config_Defenses_Towns.sqf"};