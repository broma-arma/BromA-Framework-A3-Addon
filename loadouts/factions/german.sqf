
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
_defaultName     = [_nameARABIC];
_defaultInsignia = "";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = ["hlc_rifle_G36V", "hlc_30rnd_556x45_EPR_G36"];
_commonRIFLEGL          = ["hlc_rifle_G36VAG36", "hlc_30rnd_556x45_EPR_G36", _40mm];
_commonPISTOL           = _USP;
_commonAR               = ["hlc_rifle_MG36", "hlc_100rnd_556x45_M_G36"];
_commonMG               = ["hlc_lmg_MG3", "hlc_100Rnd_762x51_M_MG3","hlc_50Rnd_762x51_T_MG3"];
_commonMARKSMAN         = ["hlc_rifle_G36A1", "hlc_30rnd_556x45_SPR_G36","hlc_30rnd_556x45_Tracers_G36"];
_commonSNIPER           = ["hlc_rifle_G36A1", "hlc_30rnd_556x45_SPR_G36"];
_commonAT               = _M136;
_specAT                 = _SMAW;
_commonSMG              = ["hlc_rifle_G36C", "hlc_30rnd_556x45_EPR_G36"];
_commonRCO              = "ACE_optic_Hamr_PIP";
_commonCCO              = "optic_Aco";
_commonMAGNIFIED        = "HLC_Optic_G36Dualoptic15x2d";
_commonSUPPRESSOR       = "hlc_muzzle_556NATO_KAC";
_commonPISTOLSUPPRESSOR = "";
_NVG                    = "rhsusf_ANPVS_14";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 4;
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

// UNIFORMS ====================================================================

_headsLIST = [
    "rhsusf_mich_helmet_marpatwd",
    "rhsusf_mich_helmet_marpatwd_alt",
    "rhsusf_mich_helmet_marpatwd_alt_headset",
    "rhsusf_mich_helmet_marpatwd_headset",
    "rhsusf_mich_helmet_marpatwd_norotos",
    "rhsusf_mich_helmet_marpatwd_norotos_arc",
    "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
    "rhsusf_mich_helmet_marpatwd_norotos_headset"
];

_uniformsLIST = [
    "MNP_CombatUniform_Germany",
    "MNP_CombatUniform_Germany_S"
];

_vestsLIST = [
    "MNP_Vest_Germany",
    "MNP_Vest_Germany_2"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD    = _randomHEAD;
_leaderHEAD    = _randomHEAD;
_officerHEAD   = "MNP_Boonie_GER_T";
_medicHEAD     = _randomHEAD;
_crewmanHEAD   = "rhsusf_cvc_ess";
_pilotHEAD     = "rhsusf_hgu56p";
_helicrewHEAD  = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD    = "U_B_GhillieSuit";
_demoHEAD      = _randomHEAD;
_reconHEAD     = "rhsusf_opscore_paint_pelt_nsw_cam";

_commonUNIFORM   = _randomUNIFORM;
_officerUNIFORM  = _randomUNIFORM;
_pilotUNIFORM    = "U_B_PilotCoveralls";
_sniperUNIFORM   = _randomUNIFORM;
_marksmanUNIFORM = _randomUNIFORM;
_helicrewUNIFORM = _randomUNIFORM;
_crewUNIFORM     = _randomUNIFORM;
_mgUNIFORM       = _randomUNIFORM;
_medicUNIFORM    = _randomUNIFORM;
_demoUNIFORM     = _randomUNIFORM;
_reconUNIFORM    = _randomUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _randomVEST;
_ftlVEST = _randomVEST;
_slVEST = _randomVEST;
_mgVEST = _randomVEST;
_grenadierVEST = _randomVEST;
_medicVEST = _randomVEST;
_demoVEST = _randomVEST;
_marksmanVEST = _randomVEST;
_reconVEST = _randomVEST;

_commonBACKPACK = "MNP_B_FieldPack_PLA_Basic_D";
_bigBACKPACK = "MNP_B_Carryall_PLA_Basic_D";

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