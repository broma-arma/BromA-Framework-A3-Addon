
// INFO ========================================================================
/*
   FIA forces has been known aroudn the world due to the operation codename :
   OPERATION FLASHPOINT, they proved themselves to be successfull on guerilla
   tactics and small scale operation even before the US intervention.

   Now they come back kick ass and resist agaisnt the Reds with training given
   by US Delta Force.
*/
// =============================================================================

_factionID        = "OFPFIA";
_factionName      = "FIA forces";
_factionStructure = "HIGH-TIER-CCO";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceRUSSIAN];
_defaultFace     = [_faceWHITE, _faceASIAN];
_defaultName     = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = _G3KA4;
_commonRIFLEGL          = _G3KA4GL;
_commonPISTOL           = _M9;
_commonMG               = _M240G;
_commonMARKSMAN         = _PSG1;
_commonSNIPER           = _M2010;
_commonAT               = _RPG26;
_specAT                 = _RPG7;
_commonSMG              = _HK51;
_commonRCO              = "rhsusf_acc_ELCAN";
_commonCCO              = "rhsusf_acc_eotech_552";
_commonMAGNIFIED        = "optic_LRPS";
_commonSUPPRESSOR       = _sup762;
_commonPISTOLSUPPRESSOR = _sup9mm;
_NVG                    = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 6;
_countPISTOL   = 2;
_countMG       = 4;
_countSNIPER   = 8;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG    = 0;
_countHE          = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countATCARGO       = 20;
_countGrenadesCARGO = 20;
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
_countBloodbagCARGO = 30;
_countPAKCARGO      = 40;

// UNIFORMS ====================================================================

_headsLIST = [
    "TRYK_ESS_CAP_OD",
    "TRYK_H_headsetcap_blk_Glasses",
    "TRYK_H_headsetcap_od",
    "TRYK_H_headset2",
    "TRYK_H_headsetcap_od_Glasses",
    "TRYK_H_headsetcap_blk",
    "TRYK_H_headsetcap_od",
    "TRYK_R_CAP_OD_US",
    "TRYK_H_PASGT_OD"
];

_uniformsLIST = [
    "TRYK_U_pad_hood_odBK",
    "TRYK_shirts_DENIM_od_Sleeve",
    "TRYK_hoodie_Wood",
    "TRYK_shirts_DENIM_BK",
    "TRYK_shirts_DENIM_WHB_Sleeve",
    "TRYK_shirts_PAD_BLW",
    "TRYK_U_pad_hood_tan",
    "TRYK_U_hood_nc",
    "TRYK_U_denim_hood_3c",
    "TRYK_U_denim_hood_mc"
];

_vestsLIST = [
    "TRYK_V_ArmorVest_Ranger2",
    "TRYK_V_ArmorVest_Delta",
    "TRYK_V_ArmorVest_Delta2",
    "TRYK_V_ArmorVest_Ranger"
];

_gogglesLIST = [];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD    = "rhsgref_Booniehat_alpen";
_leaderHEAD    = _commonHEAD;
_officerHEAD   = _commonHEAD;
_medicHEAD     = _commonHEAD;
_crewmanHEAD   = "rhs_tsh4_bala";
_pilotHEAD     = "rhsusf_hgu56p";
_helicrewHEAD  = "rhs_zsh7a_mike_green_alt";
_helipilotHEAD = "rhs_zsh7a_mike_green_alt";
_sniperHEAD    = _randomHEAD;
_demoHEAD      = _commonHEAD;
_reconHEAD     = _randomHEAD;

_commonUNIFORM   = "rhsgref_uniform_alpenflage";
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = _commonUNIFORM;
_sniperUNIFORM   = _randomUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM     = _commonUNIFORM;
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = _randomUNIFORM;

_commonVEST    = "TAC_EI_RRV2_RG";
_officerVEST   = "TAC_V_tacv1EP_BK";
_ftlVEST       = "TAC_V_tacv1EP_BK";
_slVEST        = "TAC_V_tacv1EP_BK";
_mgVEST        = "TAC_EI_RRV23_RG";
_grenadierVEST = "TAC_EI_RRV28_RG";
_medicVEST     = "TAC_EI_RRV27L_RG";
_demoVEST      = "TAC_PBDFG2CPL_BK";
_marksmanVEST  = "TAC_EI_RRV25_RG";
_reconVEST     = _randomVEST;

_commonBACKPACK = "TRYK_B_Coyotebackpack_OD";
_bigBACKPACK = "TRYK_B_Carryall_wood";

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
/* 0 - Anti Air Vehicles */  ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/* 1 - Attack Helos      */ ,["RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/* 2 - Attack Planes     */ ,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs"]
/* 3 - Heavy Vehicles    */ ,["rhs_sprut_vdv", "rhs_t72ba_tv"]
/* 4 - Light Vehicles    */ ,["rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/* 5 - Medium Vehicles   */ ,["rhs_btr60_vdv", "rhs_bmd1", "rhs_bmp1d_vdv"]
/* 6 - Mobile Artillery  */ ,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/* 7 - Transport Helos   */ ,["RHS_Mi8mt_vvs"]
/* 8 - Transport Planes  */ ,["RHS_AN2_B", "RHS_AN2_B"]
/* 9 - Transport Trucks  */ ,["rhs_gaz66_msv", "rhs_gaz66_flat_msv"]
/*10 - Static Defence    */ ,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*11 - Boats             */ ,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*12 - UAV               */ ,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*13 - UGV               */ ,["O_UGV_01_rcws_F"]
/*14 - Support           */ ,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*15 - Submarines        */ ,["O_SDV_01_F", "O_SDV_01_F"]
/*     MRAP Vehicles     */ ,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================