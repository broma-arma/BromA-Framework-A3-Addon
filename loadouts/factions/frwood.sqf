// INFO ========================================================================
/*
    French armed forces with now camo selections.
*/

_factionID        = "FRANCE";
_factionName      = "French armed forces";
_factionStructure = "FRASTRUCT";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceFRENCH];
_defaultFace     = [_faceWHITE, _faceBLACK, _faceASIAN];
_defaultName     = [_nameFRENCH];
_defaultInsignia = "USP_PATCH_FRA_FLAG_IR";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = ["R3F_Famas_G2_HG","30Rnd_556x45_Stanag"];
_commonRIFLEGL          = ["R3F_Famas_G2_M203","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"];
_commonPISTOL           = ["R3F_PAMAS","R3F_15Rnd_9x19_PAMAS"];
_commonAR               = ["hlc_lmg_minimipara_railed","rhs_200rnd_556x45_M_SAW"];
_commonMG               = _M240G;
_commonMARKSMAN         = ["arifle_SPAR_03_blk_F","20Rnd_762x51_Mag"];
_commonSNIPER           = ["R3F_PGM_Hecate_II_POLY","R3F_7Rnd_127x99_PEI_PGM"];
_commonAT               = ["rhs_weap_M136","rhs_m136_mag"];
_specAT                 = ["R3F_ERYX","R3F_ERYX_mag"];
_commonSMG              = ["hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5"];
_commonRCO              = "optic_MRCO";
_commonCCO              = "R3F_AIMPOINT";
_commonMAGNIFIED        = "optic_LRPS";
_commonSUPPRESSOR       = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG                    = "rhsusf_ANPVS_14";

// AMMO COUNT ==================================================================

_countRIFLE    = 13;
_countRIFLELOW = 7;
_countPISTOL   = 4;
_countAR       = 6;
_countMG       = 4;
_countSNIPER   = 8;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countArCARGO       = 20;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countATCARGO       = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO     = 40;

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

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_FRACammo
	"CCE"
	"DAGUET"
*/

_camo = "CCE";

// UNIFORMS ====================================================================
if(!isNil "BRM_FMK_UNIFORMS_FRACammo")then{_camo=BRM_FMK_UNIFORMS_FRACammo};


_headsLIST = [
    "BRM_LWH_COMS_"+_camo,
	"BRM_LWH_MASK_COMS_"+_camo
];

_uniformsLIST = [
    "U_BRM_U_"+_camo,
    "U_BRM_RS_"+_camo,
    "U_BRM_Shirt_"+_camo
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_"+_camo;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = "BRM_Booniehat_"+_camo;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_ACH_MASK_COMS_"+_camo;

_commonUNIFORM   = ["BRM_BattleUNI_"+_camo,"BRM_BattleUNIRS_"+_camo,"BRM_BattleUNIT_"+_camo] call BIS_fnc_selectRandom;
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = "U_B_PilotCoveralls";
_sniperUNIFORM   = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_crewUNIFORM     = "TRYK_OVERALL_SAGE_BLKboots_nk";
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = _randomUNIFORM;

_commonVEST    = "BRM_Protec_BROWN_RFL";
_officerVEST   = "BRM_Protec_BROWN_SL";
_ftlVEST       = "BRM_Protec_BROWN_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BRM_Protec_BROWN_MG";
_grenadierVEST = "BRM_Protec_BROWN_GL";
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "BRM_RRV_BROWN_REC1";

_commonBACKPACK = "B_Kitbag_cbr";
_bigBACKPACK = "TRYK_B_Coyotebackpack";

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
/*  Anti Air Vehicles    */  ["RHS_M6_wd"]
/*  Attack Helos         */ ,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
/*  Attack Planes        */ ,["I_Plane_Fighter_04_F"]
/*  Heavy Vehicles       */ ,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
/*  Light Vehicles       */ ,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
/*  Medium Vehicles      */ ,["B_APC_Wheeled_01_cannon_F"]
/*  Mobile Artillery     */ ,["rhsusf_m109_usarmy"]
/*  Transport Helos      */ ,["RHS_CH_47F_10","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F"]
/*  Transport Planes     */ ,["RHS_C130J"]
/*  Transport Trucks     */ ,["rhsusf_M977A4_usarmy_wd"]
/*  Static Defence       */ ,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats                */ ,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */ ,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */ ,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */ ,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/*  Submarines           */ ,["B_SDV_01_F"]
/*  MRAP Vehicles        */ ,["rhsusf_M1232_M2_usarmy_wd", "rhsusf_M1237_M2_usarmy_wd"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
