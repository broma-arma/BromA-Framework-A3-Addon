
// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "INDIA";
_factionName = "Indian Army";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK103ZENITRIS;
_reconRIFLE = ["arifle_TRG21_F", _30rnd556STANAG];
_commonRIFLEGL = ["rhs_weap_ak103_gp25_npz", _30rnd762AKM, _VOG25];
_commonPISTOL = ["FP_Browning_HP", "FP_13Rnd_9x19_Browning_HP"];
_commonMG = _PKM;
_commonAR = _M240B;
_commonMARKSMAN = ["UK3CB_PSG1A1", "UK3CB_G3_20rnd_762x51_GT"];
_commonSNIPER = ["UK3CB_PSG1A1", "UK3CB_G3_20rnd_762x51_GT"];
_commonAT = _AT4;
_specAT = _GUSTAV;
_commonSMG = ["FP_smg_sterling", "FP_30Rnd_9x19_L2A3_Sterling"];
_commonRCO = "UK3CB_BAF_TA31F";
_commonCCO = "rhs_acc_okp7_picatinny";
_rifleScope = _commonCCO;
_marksmanSCOPE = "uk3cb_optic_accupoint_g3";
_commonMAGNIFIED = "uk3cb_optic_accupoint_g3";
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = _NVGEN1;

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
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "H_Bandanna_sgg",
    "H_Bandanna_sand"
];

_uniformsLIST = [
    "U_C_Poloshirt_blue",
    "U_C_Poloshirt_burgundy",
    "U_C_Poloshirt_redwhite",
    "U_C_Poloshirt_salmon",
    "U_C_Poloshirt_stripped",
    "U_C_Poloshirt_tricolour"
];

_vestsLIST = [
    "V_BandollierB_blk",
    "V_BandollierB_cbr",
    "V_BandollierB_rgr",
    "V_BandollierB_khk",
    "V_BandollierB_oli"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = "BRM_6B7_BROWN";
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_6B7_GHILLIE_BROWN";

_commonUNIFORM = "UK3CB_CSAT_A_O_U_SF_CombatUniform";
_officerUNIFORM = "UK3CB_CSAT_A_O_U_SF_CombatUniform_Shortsleeve";
_pilotUNIFORM = "UK3CB_TKA_I_U_H_Pilot_03_DES";
_sniperUNIFORM = "U_I_FullGhillie_ard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUniform;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_LBT_BROWN_RFL";
_officerVEST = "BRM_LBT_BROWN_SL";
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = "BRM_LBT_BROWN_MG";
_grenadierVEST = "BRM_LBT_BROWN_GL";
_medicVEST = "BRM_LBT_BROWN_MED";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVest = "V_BandollierB_khk";

_commonBACKPACK = "B_AssaultPack_cbr";
_bigBACKPACK = "B_Carryall_cbr";
_reconBACKPACK = _bigBACKPACK;

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles    */      ["rhs_zsu234_aa"]
/*  Attack Helos 	 */	,["RHS_AH64D"]
/*  Attack Planes 	 */	,["rhs_mig29sm_vvs"]
/*  Heavy Vehicles 	 */	,["rhs_t90saa_tv"]
/*  Light Vehicles 	 */	,["rhsusf_m1025_d_s_m2"]
/*  Medium Vehicles 	 */	,["rhs_bmp2d_vmf"]
/*  Mobile Artillery     */	,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
/*  Transport Helos      */	,["FP_AlouetteIII_tr"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["UK3CB_TKA_B_Ural_Open","UK3CB_TKA_B_Ural_Closed"]
/*  Static Defence       */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */	,["UK3CB_TKA_B_Ural_Repair","UK3CB_TKA_B_Ural_Ammo","UK3CB_TKA_B_Ural_Fuel", "UK3CB_TKA_B_Hilux_Ambulance"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */     ,["rhsusf_CGRCAT1A2_M2_usmc_d"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================