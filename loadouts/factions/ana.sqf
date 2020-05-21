// INFO ========================================================================
/*
    The Afghanistan National Army, tasked with defending the country from
    Mujahideen forces all the while molesting everything from goats to little boys.

    Backed the US forces with mixed old soviet equipment.
*/

_factionID = "ANA";
_factionName = "Afghanistan National Army";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN];
_defaultName = [_nameARABIC];
_defaultInsignia = "USP_PATCH_AFG_LOCAL_POLICE";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _HLCM16A2;
_commonRIFLEGL = _HLCM16A2GL;
_commonPISTOL = _Makarov;
_commonAR = _RPK;
_commonMG = _PKM;
_commonSNIPER = _SVD;
_commonSNIPER = _SVD;
_commonAT = _AT4;
_specAT = _RPG7;
_commonSMG = _AK74UN;
_commonRCO = "rhsusf_acc_ACOG_USMC";
_commonCCO = "rhsusf_acc_compm4";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_14";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 7;
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
    "UK3CB_TKA_I_H_SSh68_Oli",
    "UK3CB_TKP_I_H_SSh68_BLK",
    "rhssaf_helmet_m97_olive_nocamo",
    "rhssaf_helmet_m97_olive_nocamo"
];

_uniformsLIST = [
    "UK3CB_ANA_B_U_CombatUniform_01_SPEC4CE",
    "UK3CB_ANA_B_U_CombatUniform_Shortsleeve_01_SPEC4CE"
];


_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomHEAD = _headsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "rhs_beret_milp";
_officerHEAD = "rhs_beret_milp";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhssaf_helmet_m97_olive_nocamo";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _randomUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_sniperUNIFORM = _randomUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _randomUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhsgref_chicom";
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "UK3CB_CHC_C_B_HIKER";
_bigBACKPACK = "UK3CB_CHC_C_B_HIKER";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_SPG9_Gun_Bag";
_ATTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */	 ["rhsgref_nat_ural_Zu23"]
/*  Attack Helos      */	,["RHS_Mi24V_AT_vvsc","RHS_Mi24V_vvsc","RHS_Mi24P_CAS_vvsc"]
/*  Attack Planes     */	,["RHS_Su25SM_vvsc"]
/*  Heavy Vehicles    */	,["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv"]
/*  Light Vehicles    */	,["B_G_Offroad_01_F", "B_G_Van_01_transport_F", "rhsusf_m998_d_2dr_halftop", "rhsusf_m998_d_4dr_halftop", "rhsusf_m998_d_4dr"]
/*  Medium Vehicles   */	,["rhs_bmp2_tv"]
/*  Mobile Artillery  */	,["rhs_9k79_B","rhs_9k79_K","rhs_9k79","rhs_2s3_tv"]
/*  Transport Helos   */	,["RHS_Mi8mt_vv"]
/*  Transport Planes  */	,[]
/*  Transport Trucks  */	,["RHS_Ural_VDV_01","RHS_Ural_Flat_VDV_01","RHS_Ural_Open_VDV_01","RHS_Ural_Open_Flat_VDV_01"]
/*  Static Defence    */	,["RHS_M2StaticMG_D","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","RHS_TOW_TriPod_D","rhsgref_ins_g_ZU23"]
/*  Boats             */	,["B_Boat_Transport_01_F"]
/*  UAV               */	,["rhs_pchela1t_vvsc"]
/*  UGV               */	,["O_UGV_01_F","O_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_ammo_vdv","RHS_Ural_Fuel_VDV_01"]
/*  Submarines        */	,["O_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_Blue_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Short_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
