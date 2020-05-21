// INFO ========================================================================
/*
    Private military contractors shoulder the burden of the increased workload,
    with competition rising between the multinational organisations for lucrative
    security contracts.
*/

_factionID = "PMC";
_factionName = "ION PMC";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAMERICAN,_nameENGLISH,_nameSPANISH,_nameRUSSIAN,_nameFRENCH];
_defaultInsignia = "";
_defaultColor = "green";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = ["hlc_rifle_hk33a2RIS","hlc_30rnd_556x45_b_HK33"];
_commonRIFLEGL = ["hlc_rifle_hk33a2RIS_GL","hlc_30rnd_556x45_b_HK33","1Rnd_HE_Grenade_shell"];
_commonPISTOL = ["hlc_pistol_P239","hlc_10Rnd_9x19_B_P239"];
_commonMG = ["rhs_weap_m240G","rhsusf_100Rnd_762x51"];
_commonAR = ["hlc_lmg_minimipara_railed","hlc_200rnd_556x45_M_SAW"];
_commonMARKSMAN = ["hlc_rifle_hk33a2RIS","hlc_30rnd_556x45_b_HK33"];
_commonSNIPER = ["rhs_weap_m40a5","rhsusf_10Rnd_762x51_m118_special_Mag"];
_commonAT = ["rhs_weap_m72a7","rhs_m72a7_mag"];
_specAT = ["rhs_weap_maaws","rhs_mag_maaws_HEAT"];
_commonSMG = ["hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5"];
_commonRCO = "FHQ_optic_ACOG";
_commonCCO = "rhsusf_acc_compm4";
_commonMAGNIFIED = "hlc_optic_ZF95Base";
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = "rhsusf_ANPVS_15";

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

_headsLIST = [
    "TRYK_H_headsetcap_blk_Glasses",
    "TRYK_r_cap_blk_Glasses",
    "TRYK_H_EARMUFF",
    "empty"
];

_uniformsLIST = [
    "TRYK_shirts_DENIM_BWH",
    "TRYK_shirts_DENIM_BK",
    "TRYK_shirts_DENIM_od",
    "TRYK_shirts_DENIM_WHB",
    "TRYK_U_B_Denim_T_BK",
    "TRYK_U_B_Denim_T_WH",
    "TRYK_U_B_BLK_T_BG_BK",
    "TRYK_U_B_BLK_T_BG_WH",
    "TRYK_shirts_OD_PAD_BK",
    "TRYK_shirts_TAN_PAD_BK"
];

_gogglesLIST = [
    "TRYK_Shemagh",
    "TRYK_Shemagh_shade",
    "TRYK_Shemagh_ESS",
    "TRYK_SPGEAR_Glasses",
    "empty"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomGOGGLE = _gogglesLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "TRYK_H_headset2";
_officerHEAD = "TRYK_H_headset2";
_medicHEAD = "TRYK_H_PASGT_BLK";
_crewmanHEAD = "rhsusf_cvc_green_helmet";
_pilotHEAD = "rhsusf_hgu56p_visor_mask";
_helicrewHEAD = "rhsusf_hgu56p_visor";
_helipilotHEAD = "rhsusf_hgu56p_visor";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_sniperUNIFORM = "U_B_FullGhillie_sard";
_marksmanUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_crewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "TAC_V_Sheriff_BA_TB3";
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = "TAC_V_Sheriff_BA_TB5";
_grenadierVEST = "TAC_V_Sheriff_BA_TB7";
_medicVEST = "TAC_V_Sheriff_BA_TB4";
_demoVEST = "TAC_V_Sheriff_BA_TB5";
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_blk";
_bigBACKPACK = "TRYK_B_Coyotebackpack_BLK";

if (_assignLoadoutMode) then { if !(_isLeader) then { _unit addGoggles _randomGOGGLE }};

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
/*  Anti Air Vehicles    */      []
/*  Attack Helos 	 */	,["RHS_MELB_AH6M"]
/*  Attack Planes 	 */	,["rhs_l159_CDF_CAP"]
/*  Heavy Vehicles 	 */	,[]
/*  Light Vehicles 	 */	,["rhsusf_m998_d_4dr_halftop","rhsusf_m998_d_4dr","rhsusf_m1025_d_m2"]
/*  Medium Vehicles 	 */	,["rhsusf_M1220_M2_usarmy_d"]
/*  Mobile Artillery     */	,[]
/*  Transport Helos      */	,["RHS_UH60M_d"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["rhsusf_M1078A1P2_D_fmtv_usarmy"]
/*  Static Defence       */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats                */	,[]
/*  UAV                  */	,[]
/*  UGV                  */	,[]
/*  Support              */	,["rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M977A4_AMMO_usarmy_d","rhsusf_M978A4_usarmy_d", "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy"]
/*  Submarines           */	,[]
/*  MRAP Vehicles        */     ,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_ION_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
