/*
    Chernarussian military has been trained by Western armies in past years,
    but it retains weapons and equipment of the Soviet Army, its direct predecessor.
    Its main task during the past years for was to fight challenging counter-insurgecy
    campaign in the mountaineous regions of Northern Chernarus.
*/

_factionID = "CDF";
_factionName = "Chernarus Defense Force";
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
_commonAR = _PKM;
_commonMG = _PKM;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = _RPG26;
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;

_commonRCO = "hlc_optic_1p29";
_commonCCO = "";

_reconScope = "hlc_optic_1p29";
_sniperScope = "rhs_acc_pso1m21_ak";

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
_commonHead = "rhsgref_6b27m_ttsko_forest";
_leaderHead = "rhsgref_fieldcap_ttsko_forest";
_officerHead = "rhsgref_fieldcap_ttsko_forest";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "rhs_zsh7a";
_helicrewHead = "rhs_zsh7a_mike";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = "rhsgref_uniform_ttsko_forest";
_officerUniform = _commonUniform;
_pilotUniform = "rhs_uniform_df15";
_sniperUniform = "U_O_FullGhillie_ard";
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "rhsgref_6b23_khaki_rifleman";
_officerVest = "rhsgref_6b23_khaki_nco";
_ftlVest = _commonVest;
_slVest = "rhsgref_6b23_khaki_nco";
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = "rhsgref_6b23_khaki_medic";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "rhs_belt_AK";

_commonBackpack = "BRM_SqBackpack_Green";
_bigBackpack = "BRM_SqBpEXPLO_Green";
_specATBackpack = "rhs_rpg_2";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_M2_Gun_Bag";
_hmgTripod = "RHS_M2_Tripod_Bag";

_staticAT = "rhs_Tow_Gun_Bag";
_atTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

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
