// INFO ========================================================================
/*
    Chernarussian military has been trained by Western armies in past years,
    but it retains weapons and equipment of the Soviet Army, its direct predecessor.
    Its main task during the past years for was to fight challenging counter-insurgecy
    campaign in the mountaineous regions of Northern Chernarus.
*/

_factionID = "CDF";
_factionName = "Chernarus Defense Force";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor = "green";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK74N;
_commonRIFLEGL = _AK74NGL;
_commonPISTOL = _Makarov;
_commonAR = _PKM;
_commonMG = _PKM;
_commonMARKSMAN = ["UK3CB_SVD_OLD","rhs_10Rnd_762x54mmR_7N1"];
_commonSNIPER = _commonMARKSMAN;
_commonAT = _RPG26;
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;
_commonSMG = _AK74UN;
_commonRCO = "hlc_optic_1p29";
_commonCCO = "";
_commonMAGNIFIED = "rhs_acc_pso1m21_ak";
_commonSUPPRESSOR = "rhs_acc_tgpa";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

_reconSCOPE = "hlc_optic_1p29";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 7;
_countMG = 5;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 15;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countArCARGO = 20;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = "rhsgref_6b27m_ttsko_forest";
_leaderHEAD = "rhsgref_fieldcap_ttsko_forest";
_officerHEAD = "rhsgref_fieldcap_ttsko_forest";
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
_sniperUNIFORM = "U_O_FullGhillie_ard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhsgref_6b23_khaki_rifleman";
_officerVEST = "rhsgref_6b23_khaki_nco";
_ftlVEST = _commonVEST;
_slVEST = "rhsgref_6b23_khaki_nco";
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = "rhsgref_6b23_khaki_medic";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "rhs_belt_AK";

_commonBACKPACK = "BRM_SqBackpack_Green";
_bigBACKPACK = "BRM_SqBpEXPLO_Green";
_specATBACKPACK = "rhs_rpg_2";

// MISC EQUIPMENT ==============================================================

_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_M2_Gun_Bag";
_HMGTripod = "RHS_M2_Tripod_Bag";

_StaticAT = "rhs_Tow_Gun_Bag";
_ATTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["rhsgref_cdf_zsu234", "rhsgref_cdf_ural_Zu23"]
/*  Attack Helos      */,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/*  Light Vehicles    */,["rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/*  Medium Vehicles   */,["rhsgref_cdf_bmd1", "rhsgref_cdf_bmd1k", "rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd1","rhsgref_cdf_bmd1k","rhsgref_cdf_bmd1p","rhsgref_cdf_bmd1pk","rhsgref_cdf_bmd2","rhsgref_cdf_bmd2k","rhsgref_cdf_bmp1","rhsgref_cdf_bmp1d","rhsgref_cdf_bmp1k","rhsgref_cdf_bmp1p","rhsgref_cdf_bmp2","rhsgref_cdf_bmp2d","rhsgref_cdf_bmp2k"]
/*  Mobile Artillery  */,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/*  Transport Helos   */,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/*  Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural"]
/*  Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["rhsgref_cdf_gaz66_ammo","rhsgref_cdf_ural_fuel"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsgref_BRDM2_vdv", "rhsgref_BRDM2_HQ_vdv"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierCDFEnsign_EP1"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["CDF_WarfareBLightFactory"]
];
