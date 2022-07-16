// INFO ========================================================================
/*
    Chinese PLA loadout, available with multiple camos and use APEX weapons.
*/

_factionID        = "PLA";
_factionName      = "Chinese PLA";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide     = EAST;
_defaultVoice    = [_voiceCHINESE];
_defaultFace     = [_faceASIAN];
_defaultName     = [_nameCHINESE];
_defaultInsignia = "USP_PATCH_CHI_PLA_BEIJING_REGION";
_defaultColor    = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_PLA
	"UNI"
	"NAVY"
	"ARTY"
	"PLAT"
*/

_camo = "UNI";
if(!isNil "BRM_FMK_UNIFORMS_PLACammo" && {BRM_FMK_UNIFORMS_PLACammo})then{_camo=BRM_FMK_UNIFORMS_PLACammo}; // Backward compatibility
if(!isNil "BRM_FMK_LoadoutCamo_PLA")then{_camo=BRM_FMK_LoadoutCamo_PLA};

// WEAPONS =====================================================================

_commonRIFLE            = ["vme_pla_qbz95_1","VME_QBZ95_1_30Rnd_DBP10"];
_commonRIFLEGL          = ["vme_pla_qbz95_1GL","VME_QBZ95_1_30Rnd_DBP10","VME_1Rnd_HE_GL"];
_commonPISTOL           = ["vme_pla_qsz92","VME_QSZ92_20Rnd_DAP92"];
_commonAR               = ["vme_pla_qjb95_1","VME_QJB95_1_75Rnd_DBP87"];
_commonMG               = ["VME_PLA_QJY88","VME_QJY88_200Rnd_DVP88_Heavy"];
_commonMARKSMAN         = _commonRIFLE;
_commonSNIPER           = ["vme_pla_LR4","vme_lr4_scope"];
_commonAT               = ["vme_pla_PF89","vme_pla_PF89_Rocket"];
_specAT                 = ["vme_pla_PF98","vme_pla_PF98_AT_Rocket"];
_weaponsAA              = ["vme_pla_FN6","vme_pla_FN6_Rocket"];
_weaponsAT              = _specAT;
_commonSMG              = ["vme_pla_qcw05","VME_QCW05_50Rnd_DAP92"];
_commonRCO              = "vme_95_1_pst";
_commonCCO              = "vme_eotech553";
_commonMAGNIFIED        = "vme_lr4_scope";
_commonSUPPRESSOR       = "vme_qbz95_1_silencer";
_commonPISTOLSUPPRESSOR = "";
_NVG                    = "rhs_1PN138";

_rifleSCOPE = _commonCCO;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 5;
_countPISTOL   = 4;
_countAR       = 5;
_countMG       = 3;
_countSNIPER   = 10;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countArCARGO       = 30;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countATCARGO       = 20;
_countGrenadesCARGO = 40;
_count40mmCARGO     = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO  = 40;
_countMorphineCARGO = 30;
_countEpiCARGO      = 30;
_countBloodbagCARGO = 20;
_countPAKCARGO      = 20;

// UNIFORMS ====================================================================

_uniformsLIST = [
    "BRM_EBattleUNI_T07"+_camo,
    "BRM_EBattleUNIRS_T07"+_camo
];
_headsLIST = [
    "BRM_LWH_COMS_T07"+_camo,
    "BRM_LWH_MASK_COMS_T07"+_camo,
    "BRM_LWH_MASK_T07"+_camo,
    "BRM_LWH_T07"+_camo
];

_randomUNIFORM = selectRandom _uniformsLIST;
_randomHEAD = selectRandom _headsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_T07"+_camo;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhs_zsh7a_alt";
_helicrewHEAD = "rhs_zsh7a_mike_alt";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhsusf_opscore_bk_pelt";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = "U_I_FullGhillie_sard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST    = "BMR_MLBVARMOR_T07"+_camo+"_RFL";
_officerVEST   = "BMR_MLBVARMOR_T07"+_camo+"_SL";
_ftlVEST       = "BMR_MLBVARMOR_T07"+_camo+"_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BMR_MLBVARMOR_T07"+_camo+"_MG";
_grenadierVEST = "BMR_MLBVARMOR_T07"+_camo+"_GL";
_medicVEST     = "BMR_MLBVARMOR_T07"+_camo+"_MED";
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "BRM_LBT_BLACK_RFL";
_pilotVEST = "rhs_belt_AK";

_commonBACKPACK = "BRM_PatrolBP_T07"+_camo;
_bigBACKPACK = "BRM_PatrolBPH_T07"+_camo;
_reconBACKPACK = _bigBACKPACK;

// EXTRA EQUIPMENT =============================================================

_HMG = "VME_PLA_QJZ89A_bag";
_HMGTripod = "VME_PLA_Static_tripod";

_StaticAT = "VME_PLA_HJ11_bag";
_ATTripod = "VME_PLA_Static_tripod";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["O_PGZ09_AA"]
/*  Attack Helos      */,["VME_WZ10"]
/*  Attack Planes     */,["VME_PLA_J16", "VME_PLA_J16", "VME_PLA_JH7", "VME_PLA_J10B"]
/*  Heavy Vehicles    */,["O_ZTQ15", "O_ZTZ96B", "O_ZTZ99", "O_ZTZ99A"]
/*  Light Vehicles    */,["VME_PLA_BJ2022", "VME_PLA_EQ2050_MG"]
/*  Medium Vehicles   */,["O_ZBD04A","O_ZBL09","O_ZTL11"]
/*  Mobile Artillery  */,["O_PLZ05", "O_PLL09", "RHS_BM21_VV_01"]
/*  Transport Helos   */,["VME_PLA_Mi17"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["VME_PLA_SX2190"]
/*  Static Defence    */,["VME_PLA_HJ11", "VME_QJY88_Static_AA"]
/*  Boats             */,[]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,["VME_PLA_SX2190Repair", "VME_PLA_SX2190Refuel"]
/*  Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_PRC"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
