// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID        = "GERMAN";
_factionName      = "Bundeswehr";
_factionStructure = "GERMAN-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceAMERICAN];
_defaultFace     = [_faceWHITE];
_defaultName     = [_nameENGLISH];
_defaultInsignia = "";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = _G36V;
_commonRIFLEGL          = _G36VGL;
_commonPISTOL           = ["hlc_pistol_P226WestGerman","hlc_15Rnd_9x19_B_P226"];
_commonAR               = _MG36;
_commonMG               = _MG3;
_commonMARKSMAN         = ["arifle_SPAR_03_snd_F","20Rnd_762x51_Mag"];
_commonSNIPER           = _AWMCAMO;
_commonAT               = _M136;
_specAT                 = _SMAW;
_commonSMG              = _G36C;
_commonRCO              = "ACE_optic_Hamr_PIP";
_commonCCO              = "rhsusf_acc_RX01";
_commonMAGNIFIED        = "rhsusf_acc_M8541";
_commonSUPPRESSOR       = "hlc_muzzle_556NATO_KAC";
_commonPISTOLSUPPRESSOR = "";
_NVG                    = "rhsusf_ANPVS_14";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 4;
_countAR = 5;
_countMG = 4;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 20;

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
_countBLOODBAG = 10;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_FRACammo
	"FLECK"
	"TROPEN"
*/

_camo = "FLECK";

// UNIFORMS ====================================================================

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

_commonHEAD    = _randomHEAD;
_leaderHEAD    = _commonHEAD;
_officerHEAD   = _commonHEAD;
_medicHEAD     = _commonHEAD;
_crewmanHEAD   = "rhsusf_cvc_ess";
_pilotHEAD     = "rhsusf_hgu56p";
_helicrewHEAD  = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD    = "H_Booniehat_oli";
_demoHEAD      = _commonHEAD;
_reconHEAD     = "BRM_ACH_MASK_COMS_"+_camo;

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

_commonVEST = "BRM_Protec_"+_camo+"_RFL";
_officerVEST = "BRM_Protec_"+_camo+"_SL";
_ftlVEST = "BRM_Protec_"+_camo+"_TL";
_slVEST = _officerVEST;
_mgVEST = "BRM_Protec_"+_camo+"_MG";
_grenadierVEST = "BRM_Protec_"+_camo+"_GL";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BRM_RRV_BROWN_REC1";

_commonBACKPACK = "BRM_PatrolBP_"+_camo;
_bigBACKPACK = "BRM_PatrolBPH_"+_camo;

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
    /*  Anti Air Vehicles */     ["B_APC_Tracked_01_AA_F", "RHS_M6"]
    /*  Attack Helos      */    ,["RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
    /*  Attack Planes     */    ,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */    ,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
    /*  Light Vehicles    */    ,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
    /*  Medium Vehicles   */    ,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
    /*  Mobile Artillery  */    ,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */    ,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M", "RHS_UH1Y_UNARMED_d"]
    /*  Transport Planes  */    ,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */    ,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
    /*  Static Defence    */    ,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */    ,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */    ,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */    ,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */    ,["rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M977A4_AMMO_BKIT_usarmy_d", "B_Truck_01_fuel_F"]
    /*  Submarines        */    ,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierGermany_EP1",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
