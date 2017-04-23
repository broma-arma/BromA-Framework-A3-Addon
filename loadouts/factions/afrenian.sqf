
// INFO ========================================================================
/*
    Located on Island Duala, Afrenia is the neighbour country of Molatia, the two
    of them has been at war for a long time, their border is considered as a "DMZ".
*/

_factionID        = "AFRENIAN";
_factionName      = "Afrenia Armed Forces";
_factionStructure = "AFRENIAN-ARMY";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceAMERICAN];
_defaultFace     = [_faceBLACK];
_defaultName     = [_nameAFRICAN];
_defaultInsignia = "";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = _AUGAA1;
_commonRIFLEGL          = _M320;
_commonPISTOL           = _CZ75;
_commonMG               = ["hlc_rifle_aughbar_B", "hlc_40Rnd_556x45_B_AUG"];
_commonMARKSMAN         = _STG58;
_commonSNIPER           = _SVD;
_commonAT               = _AT4;
_specAT                 = ["rhs_weap_smaw", "rhs_mag_smaw_HEAA"];
_commonSMG              = _AUGA1PARA;
_commonMMG              = _M60;
_commonRCO              = "rhs_acc_1p78";
_commonCCO              = _FHQMICROCCOLOW;
_commonMAGNIFIED        = "RKSL_optic_PMII_312_sunshade";
_commonSUPPRESSOR       = "hlc_muzzle_556NATO_KAC";
_commonPISTOLSUPPRESSOR = "RH_gemtech9";
_NVG                    = _NVGEN2;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 6;
_countPISTOL   = 3;
_countMG       = 4;
_countSNIPER   = 9;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;
_countMMG      = 3;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 10;
_countMgCARGO       = 20;
_countSniperCARGO   = 30;
_countATCARGO       = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO     = 40;
_countMMGCARGO      = 30;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO  = 40;
_countMorphineCARGO = 30;
_countEpiCARGO      = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO      = 10;

// UNIFORMS ====================================================================

_headsLIST = [
    "rhsusf_ach_bare",
    "rhsusf_ach_bare_tan",
    "rhsusf_ach_helmet_M81",
    "H_Bandanna_sand"
];

_uniformsLIST = [
    "LOP_U_TKA_Fatigue_02",
    "LOP_U_TKA_Fatigue_01",
    "LOP_U_US_Fatigue_03"
];

_vestsLIST = [
    "rhsgref_6b23_ttsko_digi_rifleman",
    "rhsgref_6b23_ttsko_digi"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD    = _randomHEAD;
_leaderHEAD    = _commonHEAD;
_officerHEAD   = "H_Beret_blk";
_medicHEAD     = _commonHEAD;
_crewmanHEAD   = "rhsusf_cvc_ess";
_pilotHEAD     = "rhsusf_hgu56p";
_helicrewHEAD  = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD    = _commonHEAD;
_demoHEAD      = _commonHEAD;
_reconHEAD     = "rhsusf_protech_helmet_rhino_ess";

_commonUNIFORM   = _randomUNIFORM;
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = "U_B_PilotCoveralls";
_sniperUNIFORM   = "LOP_U_US_Fatigue_02";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM     = _commonUNIFORM;
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = _commonUNIFORM;

_commonVEST    = _randomVEST;
_officerVEST   = "rhsgref_6b23_ttsko_digi_officer";
_ftlVEST       = _commonVEST;
_slVEST        = "rhsgref_6b23_ttsko_digi_nco";
_mgVEST        = _commonVEST;
_grenadierVEST = "rhs_6b23_6sh116_vog_od";
_medicVEST     = "rhsgref_6b23_ttsko_digi_medic";
_demoVEST      = _commonVEST;
_marksmanVEST  = "rhsgref_6b23_ttsko_digi_sniper";
_reconVEST     = _commonVEST;

_commonBACKPACK = "TRYK_B_Coyotebackpack";
_bigBACKPACK = "TRYK_B_Carryall_JSDF";

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
/*  Anti Air Vehicles    */  ["RHS_M6"]
/*  Attack Helos         */ ,["RHS_AH64D_GS","RHS_AH64D", "RHS_AH1Z_GS", "RHS_AH1Z_CS"]
/*  Attack Planes        */ ,["RHS_A10"]
/*  Heavy Vehicles       */ ,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd"]
/*  Light Vehicles       */ ,["LOP_AM_Landrover", "LOP_AM_Landrover_M2", "rhsusf_m1025_w_m2", "rhsusf_m998_w_2dr"]
/*  Medium Vehicles      */ ,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD"]
/*  Mobile Artillery     */ ,["rhsusf_m109_usarmy"]
/*  Transport Helos      */ ,["RHS_Mi8mt_Cargo_vvs"]
/*  Transport Planes     */ ,["RHS_C130J"]
/*  Transport Trucks     */ ,["LOP_US_Ural","LOP_US_Ural_open"]
/*  Static Defence       */ ,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats                */ ,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/*  UAV                  */ ,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */ ,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */ ,["I_Truck_02_medical_F", "I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_box_F"]
/*  Submarines           */ ,["B_SDV_01_F"]
/*  MRAP Vehicles        */ ,["rhsusf_M1117_W", "rhsusf_m113_usarmy_M240"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================