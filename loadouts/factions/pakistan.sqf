
// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "PAKISTAN";
_factionName = "Pakistani Army";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameARABIC];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _G3A3RIS;
_commonRIFLEGL = _G3KA4GL;
_reconRifle = _AUGA3;
_commonPISTOL = _M9;
_commonMG = _MG3;
_commonMARKSMAN = _G3SG1RIS;
_commonSNIPER = ["UK3CB_PSG1A1", "UK3CB_G3_20rnd_762x51_GT"];
_commonAT = _RPG26;
_specAT = _RPG7;
_commonSMG = ["UK3CB_P90C_black", "UK3CB_P90_50rnd_570x28_Magazine_GT"];
_commonRCO = "rhsusf_acc_ELCAN";
_commonCCO = "rhsusf_acc_EOTECH";
_marksmanSCOPE = "rhsusf_acc_M8541";
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

_commonUNIFORM = "rhs_uniform_emr_des_patchless";
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

_commonBACKPACK = "B_AssaultPack_cbr";
_bigBACKPACK = "B_Kitbag_cbr";

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
/*  Anti Air Vehicles    */      ["O_PGZ09_AA"]
/*  Attack Helos 	 */	,["RHS_Mi24V_vvs"]
/*  Attack Planes 	 */	,["PRACS_F16CJR"]
/*  Heavy Vehicles 	 */	,["rhsgref_cdf_b_t80u_tv"]
/*  Light Vehicles 	 */	,["rhsusf_M1220_M2_usarmy_d"]
/*  Medium Vehicles 	 */	,["UK3CB_KRG_B_M113tank_M2_90"]
/*  Mobile Artillery     */	,["rhsusf_m109d_usarmy"]
/*  Transport Helos      */	,["RHS_UH1Y_d"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["UK3CB_KRG_B_MTVR_Open","UK3CB_KRG_B_MTVR_Closed"]
/*  Static Defence       */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */	,["UK3CB_KRG_B_MTVR_Repair","UK3CB_KRG_B_MTVR_Ammo","UK3CB_KRG_B_MTVR_Fuel", "UK3CB_KRG_B_MTLB_AMB"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */     ,["rhsusf_M1220_M2_usarmy_d"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================