/*
    Ukrainian army, Currently using ex-SSR weaponry and vehicles along with their newest camoflage.
*/

_factionID = "UKRAINE";
_factionName = "Ukranian Armed Forces";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite];
_defaultName = [_nameRussian];
_defaultInsignia = "";
_defaultColor = "green";

// WEAPONS =====================================================================
_commonRifle = _AK74N;
_commonRifleGL = _AK74NGL;
_reconRifle = _AK74MUUK;
_commonAR = selectRandom [_RPK74, _PKM];
_commonMG = _commonAR;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _AWMB;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = _RPG26;
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;

_commonRCO = "";
_commonCCO = "";

_reconScope = "rhs_acc_ekp8_02";
_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "rhs_acc_tgpa";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 7;
_countMG = 5;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 15;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 20;
_countSniperCargo = 30;
_countSpecATCargo = 15;
_count40mmCargo = 40;
_countPistolCargo = 10;
_countGrenadesCargo = 20;

// MEDICAL =====================================================================
_countBandage = 20;
_countMorphine = 10;
_countEpi = 5;
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom [
	"BRM_ACH_MASK_MM14",
	"BRM_ACH_MM14",
	"PSZ_H_wz2005_OLIVE",
	"PSZ_H_wz2005_OLIVE_ESS",
	"rhssaf_helmet_m97_olive_nocamo",
	"rhssaf_helmet_m97_olive_nocamo_black_ess"
];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_MM14";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "rhs_zsh7a";
_helicrewHead = "rhs_zsh7a_mike";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = selectRandom ["BRM_BattleUNI_MM14", "BRM_BattleUNIRS_MM14"];
_officerUniform = _commonUniform;
_pilotUniform = "rhs_uniform_df15_tan";
_sniperUniform = "U_O_FullGhillie_ard";
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BMR_MLBVARMOR_BROWN_RFL";
_officerVest = "BMR_MLBVARMOR_BROWN_SL";
_ftlVest = _commonVest;
_slVest = "BMR_MLBVARMOR_BROWN_SL";
_mgVest = "BMR_MLBVARMOR_BROWN_MG";
_grenadierVest = _commonVest;
_medicVest = "BMR_MLBVARMOR_BROWN_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "BRM_LBT_MM14_RFLAK";
_pilotVest = "rhs_belt_AK";

_commonBackpack = "BRM_SqBackpack_Brown";
_bigBackpack = "BRM_PatrolBP_MM14";
_specATBackpack = "rhs_rpg_2";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_NSV_Gun_Bag";
_hmgTripod = "RHS_NSV_Tripod_Bag";

_staticAT = "RHS_SPG9_Gun_Bag";
_atTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["rhsgref_cdf_zsu234", "rhsgref_cdf_ural_Zu23"]
/* Attack Helos      */,["rhsgref_b_mi24g_CAS", "rhsgref_b_mi24g_FAB", "rhsgref_cdf_b_Mi35", "rhsgref_cdf_b_Mi35_UPK"]
/* Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/* Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/* Light Vehicles    */,["rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/* Medium Vehicles   */,["rhsgref_cdf_bmd1", "rhsgref_cdf_bmd1k", "rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd1", "rhsgref_cdf_bmd1k", "rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd1pk", "rhsgref_cdf_bmd2", "rhsgref_cdf_bmd2k", "rhsgref_cdf_bmp1", "rhsgref_cdf_bmp1d", "rhsgref_cdf_bmp1k", "rhsgref_cdf_bmp1p", "rhsgref_cdf_bmp2", "rhsgref_cdf_bmp2d", "rhsgref_cdf_bmp2k"]
/* Mobile Artillery  */,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/* Transport Helos   */,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural"]
/* Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/* Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsgref_cdf_gaz66_ammo", "rhsgref_cdf_ural_fuel"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_vdv", "rhsgref_BRDM2_HQ_vdv"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierCDFEnsign_EP1"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["CDF_WarfareBLightFactory"]
];
