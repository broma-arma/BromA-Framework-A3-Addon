// INFO ========================================================================
/*

    Formed after the increasing risk of terrorist activity against Norwegian sovereign interests,
	the Norwegian Special Forces operate inside and outside of their national borders performing
	key strikes, covert military operations and reconnaisance for the country's main armed branch.

*/

_factionID = "NORSF";
_factionName = "Norwegian Special Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _RHSHK416D145;
_commonRIFLEGL = _RHSHK416D145M320;
_commonPISTOL = _G17;
_commonAR = _M249S;
_commonMG = _M240B;
_commonMARKSMAN = _RHSHK416D145; // waiting for a HK417
_commonSNIPER = _L115A3;
_commonAT = _AT4CSHEAT;
_specAT = _MAAWS;
_commonSMG = _RHSMP7;
_commonRCO = "rhsusf_acc_ACOG_USMC";
_commonCCO = "rhsusf_acc_eotech_552";
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "rhsusf_acc_nt4_black";
_commonPISTOLSUPPRESSOR = "rhsusf_acc_omega9k";
_NVG = "NVGogglesB_blk_F";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 5;
_countMG = 3;
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
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_uniformsLIST = [
    "U_BRM_U_NORSK",
    "U_BRM_RS_NORSK"	
];

_goggleLIST = [
    "TRYK_Shemagh_shade",
    "TRYK_Shemagh_EAR_TAN"
];


_randomGOGGLE = _goggleLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;

_commonHEAD = ["BRM_ACH_COMS_NORSK","BRM_ACH_MASK_COMS_NORSK"] call BIS_fnc_selectRandom;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = "BRM_BoonieCOMS_NORSK";
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE";
_crewUNIFORM = "TRYK_OVERALL_SAGE";
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_MBSS_v1";
_officerVEST = _commonVEST;
_ftlVEST = "BRM_MBSS_GL";
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _ftlVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "BRM_PatrolBP_NORSK";
_bigBACKPACK = "TRYK_B_BAF_BAG_OD";


if (_assignLoadoutMode) then { _unit addGoggles _randomGOGGLE };

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
/*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
/*  Attack Helos      */	,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
/*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/*  Heavy Vehicles    */	,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
/*  Light Vehicles    */	,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
/*  Medium Vehicles   */	,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
/*  Mobile Artillery  */	,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
/*  Transport Helos   */	,["RHS_CH_47F_10", "RHS_CH_47F_light", "rhsusf_CH53E_USMC", "RHS_UH1Y_FFAR", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
/*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
/*  Transport Trucks  */	,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
/*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */	,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/*  Submarines        */	,["B_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsusf_rg33_w", "rhsusf_rg33_m2_w", "rhsusf_M1117_W"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_Blue_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_HBarrierWall4_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
