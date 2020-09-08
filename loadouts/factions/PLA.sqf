// INFO ========================================================================
/*
    Chinese PLA loadout, available with multiple camos and use APEX weapons.
*/

_factionID        = "PLA";
_factionName      = "Chinese PLA";
_factionStructure = "HIGH-TIER-CCO";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide     = EAST;
_defaultVoice    = [_voiceCHINESE];
_defaultFace     = [_faceASIAN];
_defaultName     = [_nameCHINESE];
_defaultInsignia = "USP_PATCH_CHI_PLA_BEIJING_REGION";
_defaultColor    = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = ["arifle_CTAR_blk_F","30Rnd_580x42_Mag_F"];
_commonRIFLEGL          = ["arifle_CTAR_GL_blk_F","30Rnd_580x42_Mag_F","1Rnd_HE_Grenade_shell"];
_commonPISTOL           = _Rook;
_commonAR               = ["arifle_CTARS_blk_F","100Rnd_580x42_Mag_F"];
_commonMG               = _PKP;
_commonMARKSMAN         = ["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F"];
_commonSNIPER           = _GM6;
_commonAT               = _RPG26;
_specAT                 = _RPG42;
_commonSMG              = ["SMG_02_F","30Rnd_9x21_Mag_SMG_02"];
_commonRCO              = "optic_MRCO";
_commonCCO              = "optic_Holosight_blk_F";
_commonMAGNIFIED        = _SOS;
_commonSUPPRESSOR       = "muzzle_snds_58_blk_F";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG                    = _NVGEN4;

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
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO  = 40;
_countMorphineCARGO = 30;
_countEpiCARGO      = 30;
_countBloodbagCARGO = 20;
_countPAKCARGO      = 20;

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_PLACammo
	"UNI"
	"NAVY"
	"ARTY"
	"PLAT"
*/

_camo = "UNI";

// UNIFORMS ====================================================================
if(!isNil "BRM_FMK_UNIFORMS_PLACammo")then{_camo=BRM_FMK_UNIFORMS_PLACammo};

_uniformsLIST = [
    "BRM_EBattleUNI_T07"+_camo,
    "BRM_EBattleUNIRS_T07"+_camo,
    "BRM_EBattleUNITS_T07"+_camo
];
_headsLIST = [
    "BRM_LWH_COMS_T07"+_camo,
    "BRM_LWH_MASK_COMS_T07"+_camo,
    "BRM_LWH_MASK_T07"+_camo,
    "BRM_LWH_T07"+_camo
];

_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomHEAD = _headsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "BRM_PatrolCap_T07"+_camo;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhs_zsh7a_alt";
_helicrewHEAD = "rhs_zsh7a_mike_alt";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhsusf_opscore_bk_pelt";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST    = "BRM_Protec_GREEN_RFL";
_officerVEST   = "BRM_Protec_GREEN_SL";
_ftlVEST       = "BRM_Protec_GREEN_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BRM_Protec_GREEN_MG";
_grenadierVEST = "BRM_Protec_GREEN_GL";
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "TAC_PBDFG2D2_RG";

_commonBACKPACK = "BRM_PatrolBP_T07"+_camo;
_bigBACKPACK = "BRM_PatrolBPH_T07"+_camo;

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_Kornet_Gun_Bag";
_ATTripod = "RHS_Kornet_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */     ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/*  Attack Helos      */    ,["RHS_Ka52_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/*  Attack Planes     */    ,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "RHS_T50_vvs_054"]
/*  Heavy Vehicles    */    ,["rhs_t90a_tv", "rhs_t90_tv", "rhs_t80um", "rhs_t80uk", "rhs_t72bd_tv"]
/*  Light Vehicles    */    ,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv"]
/*  Medium Vehicles   */    ,["rhs_btr80a_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/*  Mobile Artillery  */    ,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */    ,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/*  Transport Planes  */    ,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */    ,["rhs_gaz66_msv", "rhs_gaz66_flat_msv"]
/*  Static Defence    */    ,["rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_high_MSV", "rhs_2b14_82mm_msv"]
/*  Boats             */    ,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */    ,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */    ,["O_UGV_01_rcws_F"]
/*  Support           */    ,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*  Submarines        */    ,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */    ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_Red_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
