// INFO ========================================================================
/*
    Glorious Soviet Union
*/

_factionID = "SOVIETS";
_factionName = "Soviet Union";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE, _faceASIAN];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "USP_PATCH_RUS_ARMY_ARMED_FORCES";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_SOVIETS
    "vsr" vsr
    "afg" afghan
	"khk" khaki
*/

_camo = "vsr";
if(!isNil "BRM_FMK_LoadoutCamo_SOVIETS")then{_camo=BRM_FMK_LoadoutCamo_SOVIETS};

// WEAPONS =====================================================================

_commonRIFLE = _AK74N;
_commonRIFLEGL = _AK74NGL;
_commonPISTOL = _Makarov;
_commonMG = _PKM;
_commonMARKSMAN = ["UK3CB_SVD_OLD","rhs_10Rnd_762x54mmR_7N1"];
_commonSNIPER = _commonMARKSMAN;
_commonAT = ["rhs_weap_rpg18","rhs_rpg18_mag"];
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;
_commonSMG = ["rhs_weap_aks74un", "rhs_30Rnd_545x39_AK"];
_commonRCO = "";
_marksmanSCOPE = "rhs_acc_pso1m2";
_commonCCO = "";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "rhs_acc_tgpa";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = "UK3CB_TKA_I_H_SSh68_Oli";
_leaderHEAD = "rhsgref_fieldcap_ttsko_forest";
_officerHEAD = "rhs_beret_mvd";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = "rhsgref_uniform_ttsko_forest";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = "U_B_FullGhillie_lsh";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhs_6b5_rifleman";
_officerVEST = "rhs_6b5_officer";
_ftlVEST = _commonVEST;
_slVEST = "rhs_6b5_officer";
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = "rhs_6b5_medic";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "rhs_vest_commander";

_commonBACKPACK = "UK3CB_UN_B_B_RIF";
_bigBACKPACK = "UK3CB_UN_B_B_RIF";
_specATBACKPACK = "rhs_rpg_2";

switch (_camo) do {
	case "afg": {
		_commonHEAD = "rhs_ssh68_2";
		_leaderHEAD = selectRandom ["rhs_fieldcap_m88","rhs_fieldcap_m88_back"];
		_officerHEAD = "UK3CB_CW_SOV_O_EARLY_H_Officer_Cap";
		_medicHEAD = _commonHEAD;
		_crewmanHEAD = "rhs_tsh4_ess";
		_pilotHEAD = "rhs_zsh7a";
		_helicrewHEAD = "rhs_zsh7a_mike";
		_helipilotHEAD = "rhs_zsh7a_mike";
		_sniperHEAD = _commonHEAD;
		_demoHEAD = _commonHEAD;
		_reconHEAD = _commonHEAD;

		_commonUNIFORM = "rhs_uniform_afghanka_para";
		_officerUNIFORM = _commonUNIFORM;
		_pilotUNIFORM = "rhs_uniform_df15";
		_sniperUNIFORM = "U_O_FullGhillie_ard";
		_marksmanUNIFORM = _commonUNIFORM;
		_helicrewUNIFORM = "rhs_uniform_df15";
		_crewUNIFORM = _commonUNIFORM;
		_mgUNIFORM = _commonUNIFORM;
		_medicUNIFORM = _commonUNIFORM;
		_demoUNIFORM = _commonUNIFORM;
		_reconUNIFORM = _commonUNIFORM;

		_commonVEST = "rhs_lifchik";
		_officerVEST = _commonVEST;
		_ftlVEST = _commonVEST;
		_slVEST = _commonVEST;
		_mgVEST = _commonVEST;
		_grenadierVEST = _commonVEST;
		_medicVEST = _commonVEST;
		_demoVEST = _commonVEST;
		_marksmanVEST = _commonVEST;
		_reconVEST = _commonVEST;
		_pilotVEST = "rhs_vest_commander";

		_commonBACKPACK = "rhs_rd54";
		_bigBACKPACK = "rhs_rd54";
		_specATBACKPACK = "rhs_rpg_2";
	};
	case "khk": {

		_commonRIFLE = _RHSAKM;
		_commonRIFLEGL = _RHSAKMGL;
		_commonMG = _RPK;
		_commonMG = _RPK;

		_commonHEAD = selectRandom ["rhs_ssh60","rhs_pilotka"];
		_leaderHEAD = "rhs_fieldcap_khk";
		_officerHEAD = "rhs_beret_vdv_early";
		_medicHEAD = _commonHEAD;
		_crewmanHEAD = "rhs_tsh4_ess";
		_pilotHEAD = "rhs_zsh7a";
		_helicrewHEAD = "rhs_zsh7a_mike";
		_helipilotHEAD = "rhs_zsh7a_mike";
		_sniperHEAD = _commonHEAD;
		_demoHEAD = _commonHEAD;
		_reconHEAD = _commonHEAD;

		_commonUNIFORM = "UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK";
		_officerUNIFORM = _commonUNIFORM;
		_pilotUNIFORM = "rhs_uniform_df15";
		_sniperUNIFORM = "U_O_FullGhillie_ard";
		_marksmanUNIFORM = _commonUNIFORM;
		_helicrewUNIFORM = "rhs_uniform_df15";
		_crewUNIFORM = _commonUNIFORM;
		_mgUNIFORM = _commonUNIFORM;
		_medicUNIFORM = _commonUNIFORM;
		_demoUNIFORM = _commonUNIFORM;
		_reconUNIFORM = _commonUNIFORM;

		_commonVEST = "rhs_lifchik_light";
		_officerVEST = "rhs_lifchik_NCO";
		_ftlVEST = "rhs_lifchik_vog";
		_slVEST = _commonVEST;
		_mgVEST = _commonVEST;
		_grenadierVEST = "rhs_lifchik_vog";
		_medicVEST = _commonVEST;
		_demoVEST = _commonVEST;
		_marksmanVEST = _commonVEST;
		_reconVEST = _commonVEST;
		_pilotVEST = "rhs_vest_commander";

		_commonBACKPACK = "rhs_rd54";
		_bigBACKPACK = "rhs_rd54";
		_specATBACKPACK = "rhs_rpg_2";
	};
};

// MISC EQUIPMENT ==============================================================

_grenade = "rhs_mag_rgd5";
_wsmoke = "rhs_mag_rdg2_white";
_binoc = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_SPG9_Gun_Bag";
_ATTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["rhsgref_ins_g_g_zsu234"]
/*  Attack Helos      */,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */,["rhsgref_ins_g_t72ba", "rhsgref_ins_g_t72bb", "rhsgref_ins_g_t72bc"]
/*  Light Vehicles    */,["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz", "rhsgref_ins_g_uaz_spg9", "rhsgref_ins_g_uaz_open"]
/*  Medium Vehicles   */,["rhsgref_BRDM2_ins_g", "rhsgref_BRDM2_ATGM_ins_g", "rhsgref_ins_g_btr60", "rhsgref_ins_g_btr70", "rhsgref_ins_g_bmp1", "rhsgref_ins_g_bmp1p", "rhsgref_ins_g_bmp2e", "rhsgref_ins_g_bmp2k", "rhsgref_ins_g_ural_Zu23"]
/*  Mobile Artillery  */,["rhsgref_ins_g_reg_BM21", "rhsgref_ins_g_reg_BM21"]
/*  Transport Helos   */,["rhsgref_ins_g_Mi8amt", "rhsgref_ins_g_Mi8amt"]
/*  Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */,["rhsgref_ins_g_ural", "rhsgref_ins_g_ural_open", "rhsgref_ins_g_ural_work"]
/*  Static Defence    */,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/*  Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["rhs_gaz66_repair_vv","rhsgref_ins_g_gaz66_ammo","RHS_Ural_Fuel_VV_01"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "rhs_Flag_Russia_F"
/* Objects      */,["rhs_weapon_crate"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["CDF_WarfareBLightFactory"]
];
