// INFO ========================================================================
/*
    Located on Island Duala, Afrenia is the neighbour country of Molatia, the two
    of them has been at war for a long time, their border is considered as a "DMZ".
*/

_factionID        = "AFRENIAN";
_factionName      = "Afrenian Armed Forces";
_factionStructure = "AFRENIAN-ARMY";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceAMERICAN];
_defaultFace     = [_faceBLACK];
_defaultName     = [_nameAFRICAN];
_defaultInsignia = "USP_PATCH_MORALE_BULL_SKULL_BLK";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = _AUGAA1;
_commonRIFLEGL          = _M320;
_commonPISTOL           = ["hlc_pistol_P226R_Combat","hlc_15Rnd_9x19_B_P226"];
_commonAR               = ["hlc_rifle_aughbar_B", "hlc_40Rnd_556x45_B_AUG"];
_commonMG               = _M60E4;
_commonMARKSMAN         = _STG58;
_commonSNIPER           = ["rhs_weap_t5000", "rhs_5Rnd_338lapua_t5000"];
_commonAT               = ["rhs_weap_m72a7", "rhs_m72a7_mag"];
_specAT                 = ["rhs_weap_smaw", "rhs_mag_smaw_HEAA"];
_commonSMG              = _AUGA1PARA;
_commonRCO              = "rhsusf_acc_ACOG";
_commonCCO              = _FHQMICROCCOLOW;
_commonMAGNIFIED        = "rhsusf_acc_premier_low";
_commonSUPPRESSOR       = "hlc_muzzle_556NATO_KAC";
_commonPISTOLSUPPRESSOR = "hlc_muzzle_TiRant9";
_NVG                    = _NVGEN2;

_isATDisposable = true;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 6;
_countPISTOL   = 3;
_countAR       = 7;
_countMG       = 4;
_countSNIPER   = 9;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 10;
_countArCARGO       = 20;
_countMgCARGO       = 20;
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

_vestsLIST = [
     "rhsgref_6b23_ttsko_digi_rifleman",
     "rhsgref_6b23_ttsko_digi"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
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
_reconHEAD     = "rhsusf_ach_helmet_headset_ocp";

_commonUNIFORM   = "BRM_JIETAIW_M93";
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = "U_B_PilotCoveralls";
_sniperUNIFORM   = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_nok_flesh";
_crewUNIFORM     = "TRYK_OVERALL_SAGE_BLKboots_nk_blk2";
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = "rhs_uniform_g3_blk";

_commonVEST    = _randomVEST;
_officerVEST   = "rhsgref_6b23_ttsko_digi_officer";
_ftlVEST       = _commonVEST;
_slVEST        = "rhsgref_6b23_ttsko_digi_nco";
_mgVEST        = _commonVEST;
_grenadierVEST = "rhs_6b23_6sh116_vog_od";
_medicVEST     = "rhsgref_6b23_ttsko_digi_medic";
_demoVEST      = _commonVEST;
_marksmanVEST  = "rhsgref_6b23_ttsko_digi_sniper";
_reconVEST     = "rhsusf_spc_patchless_radio";

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
/*  Attack Helos     */     ,["RHS_AH64D_GS","RHS_AH64D", "RHS_AH1Z_GS", "RHS_AH1Z_CS"]
/*  Attack Planes    */     ,["RHS_A10"]
/*  Heavy Vehicles   */     ,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd"]
/*  Light Vehicles   */     ,["rhsusf_m1025_w_m2", "rhsusf_m998_w_2dr"]
/*  Medium Vehicles      */ ,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD"]
/*  Mobile Artillery     */ ,["rhsusf_m109_usarmy"]
/*  Transport Helos      */ ,["I_Heli_Transport_02_F"]
/*  Transport Planes     */ ,["RHS_C130J"]
/*  Transport Trucks     */ ,["rhs_zil131_vdv","rhs_zil131_open_vdv"]
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
