// INFO ========================================================================
/*
	Originally founded as Black Element USA in September 1998, ION is a private military company specialising in
	security solutions and providing services tailored to specialist and high-risk environments.
*/

_factionID = "IONPMC";
_factionName = "I.O.N. PMC";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceALTIAN, _voiceAMERICAN, _voiceBRITISH, _voiceFARSI, _voiceRUSSIAN];
_defaultFace = [_faceGREEK, _faceWHITE, _faceBLACK, _faceASIAN, _facePERSIAN];
_defaultName = [_nameAMERICAN, _nameAFRICAN ,_nameARABIC, _nameRUSSIAN];
_defaultInsignia = "";
_defaultColor = "white";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AR15RU;
_commonRIFLEGL = _M16A2GL;
_commonPISTOL = _G17;
_commonAR = _M249L;
_commonMG = _M240B;
_commonMARKSMAN = _SR25;
_commonSNIPER = _SR25;
_commonAT = _AT4;
_specAT = _MAAWS;
_commonSMG = _PDW;
_commonRCO = "rhsusf_acc_ACOG2";
_commonCCO = "FHQ_optic_AIM";
_commonMAGNIFIED = "rhsusf_acc_premier_low";
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = "rhs_1PN138";

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

_headsLIST = [
    "TRYK_ESS_CAP",
    "H_Cap_blk_ION",
    "TRYK_R_CAP_BLK",
    "TRYK_H_EARMUFF",
    "TRYK_R_CAP_BLK",
    "TRYK_R_CAP_TAN",
    "TRYK_H_woolhat",
    "TRYK_H_woolhat_br"
];

_uniformsLIST = [
    "TRYK_U_B_Denim_T_BK",
    "TRYK_U_B_BLK_T_WH",
    "TRYK_U_B_Denim_T_WH",
    "TRYK_U_B_BLK_OD_Rollup_CombatUniform",
    "TRYK_U_B_BLK_tan_Rollup_CombatUniform",
    "TRYK_U_B_wh_blk_Rollup_CombatUniform",
    "TRYK_U_B_wh_OD_Rollup_CombatUniform",
    "TRYK_U_B_wh_tan_Rollup_CombatUniform",
    "TRYK_U_B_BLK_T_BK",
    "TRYK_U_B_BLK_T_WH",
    "TRYK_U_B_Denim_T_BK",
    "TRYK_U_B_Denim_T_WH"
];

_vestsLIST = [
    "TAC_V_tacv1_BK",
    "TAC_V_tacv1EP_CY",
    "TAC_V_tacv1"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "TRYK_H_headsetcap_blk";
_officerHEAD = "empty";
_medicHEAD = "empty";
_crewmanHEAD = _commonHEAD;
_pilotHEAD = _commonHEAD;
_helicrewHEAD = _commonHEAD;
_helipilotHEAD = _commonHEAD;
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = _commonUNIFORM;
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_blk";
_bigBACKPACK = "TRYK_B_Kitbag_blk";

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
/*  Anti Air Vehicles */	 ["rhs_zsu234_aa"]
/*  Attack Helos      */	,["RHS_Mi24V_AT_vvsc","RHS_Mi24V_vvsc","RHS_Mi24P_CAS_vvsc"]
/*  Attack Planes     */	,["RHS_Su25SM_vvsc"]
/*  Heavy Vehicles    */	,["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv"]
/*  Light Vehicles    */	,["rhs_uaz_open_vmf"]
/*  Medium Vehicles   */	,["rhs_bmp2_tv","rhs_bmp2d_tv","rhs_bmp2k_tv","rhs_brm1k_tv","rhs_btr60_vmf"]
/*  Mobile Artillery  */	,["rhs_9k79_B","rhs_9k79_K","rhs_9k79","rhs_2s3_tv"]
/*  Transport Helos   */	,["RHS_Mi8mt_vv"]
/*  Transport Planes  */	,[]
/*  Transport Trucks  */	,["RHS_Ural_VDV_01","RHS_Ural_Flat_VDV_01","RHS_Ural_Open_VDV_01","RHS_Ural_Open_Flat_VDV_01"]
/*  Static Defence    */	,["rhsgref_ins_g_Igla_AA_pod","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","rhsgref_ins_g_SPG9","rhsgref_ins_g_ZU23"]
/*  Boats             */	,["O_Boat_Armed_01_minigun_F"]
/*  UAV               */	,["rhs_pchela1t_vvsc"]
/*  UGV               */	,["O_UGV_01_F","O_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_ammo_vdv","RHS_Ural_Fuel_VDV_01"]
/*  Submarines        */	,["O_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "flag_ven",
/* Objects      */ ["I_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_CncBarrier_stripes_F"],
/* Structures   */ ["Land_Cargo_HQ_V1_F"]
];
