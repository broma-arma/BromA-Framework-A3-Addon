// INFO ========================================================================
/*

    The Middle Eastern Coalition (Arabic: تحالف الشرق الأوسط), commonly
    abbreviated to MEC, is a military alliance of Middle Eastern states.

*/

_factionID = "MEC";
_factionName = "Middle Eastern Coalition";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN];
_defaultName = [_nameARABIC];
_defaultInsignia = "USP_PATCH_FLAG_JORDAN";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _G3A3;
_commonRIFLEGL = _G3KA4GL;
_commonPISTOL = ["rhs_weap_pya", "rhs_mag_9x19_17"];
_commonAR = ["hlc_lmg_MG3KWS_b", "hlc_50Rnd_762x51_B_MG3"];
_commonMG = ["hlc_lmg_MG3KWS_b", "hlc_250Rnd_762x51_B_MG3"];
_commonMARKSMAN = ["hlc_rifle_g3sg1", "hlc_20rnd_762x51_b_G3"];
_commonSNIPER = ["hlc_rifle_g3sg1", "hlc_20rnd_762x51_b_G3"];
_commonAT = _RPG26;
_specAT = ["R3F_ERYX", "R3F_ERYX_mag"];
_commonSMG = ["hlc_smg_mp5a3", "hlc_30Rnd_9x19_B_MP5"];
_commonRCO = "HLC_Optic_ZFSG1";
_commonCCO = "HLC_Optic_ZFSG1";
_commonMAGNIFIED = "HLC_Optic_ZFSG1";
_commonSUPPRESSOR = "hlc_muzzle_300blk_KAC";
_commonPISTOLSUPPRESSOR = "";
_NVG = "NVGoggles_OPFOR";

// AMMO COUNT ==================================================================

_countRIFLE = 8;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 4;
_countMG = 2;
_countSNIPER = 6;
_countAT = 1;
_countGRENADES = 3;
_count40mm = 10;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countArCARGO = 20;
_countMgCARGO = 20;
_countSniperCARGO = 20;
_countATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 30;

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
    "rhsgref_helmet_pasgt_3color_desert",
    "rhsgref_helmet_pasgt_3color_desert_rhino"
];

_uniformsLIST = [
    "rhsgref_uniform_3color_desert"
];

_vestsLIST = [
    "TAC_EI_RRVS_SPR_CY",
    "TAC_EI_RRVS_SPR2_CY"
];

_goggleLIST = [
    "TRYK_Shemagh",
    "TRYK_Shemagh_ESS"
];


_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;
_randomGOGGLE = _goggleLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _randomHEAD;
_officerHEAD = "rhssaf_beret_black";
_medicHEAD = _randomHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike_green";
_helipilotHEAD = "rhs_zsh7a_mike_green";
_sniperHEAD = _randomHEAD;
_demoHEAD = _randomHEAD;
_reconHEAD = _randomHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _randomUNIFORM;
_pilotUNIFORM = _randomUNIFORM;
_sniperUNIFORM = _randomUNIFORM;
_marksmanUNIFORM = _randomUNIFORM;
_helicrewUNIFORM = _randomUNIFORM;
_crewUNIFORM = _randomUNIFORM;
_mgUNIFORM = _randomUNIFORM;
_medicUNIFORM = _randomUNIFORM;
_demoUNIFORM = _randomUNIFORM;
_reconUNIFORM = _randomUNIFORM;

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

_commonBACKPACK = "B_FieldPack_khk";
_bigBACKPACK = "TRYK_B_Coyotebackpack";

if (_assignLoadoutMode) then { _unit addGoggles _randomGOGGLE };

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_Kord_Gun_Bag";
_HMGTripod = "RHS_Kord_Tripod_Bag";

_StaticAT = "RHS_Kornet_Gun_Bag";
_ATTripod = "RHS_Kornet_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */	 ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/*  Attack Helos      */	,["RHS_Ka52_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/*  Attack Planes     */	,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "RHS_T50_vvs_generic", "RHS_T50_vvs_blueonblue", "RHS_T50_vvs_054"]
/*  Heavy Vehicles    */	,["rhs_sprut_vdv", "rhs_t90a_tv", "rhs_t90_tv", "rhs_t80um", "rhs_t80uk", "rhs_t72bd_tv"]
/*  Light Vehicles    */	,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/*  Medium Vehicles   */	,["rhs_btr60_vdv", "rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/*  Mobile Artillery  */	,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */	,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/*  Static Defence    */	,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*  Boats             */	,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */	,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */	,["O_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*  Submarines        */	,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// Common vehicles employed by MEC include: UAZ 469, Ural-4320, BRDM 2, BTR-60, BMP-2/2M/3, T-72, 9P148 Konkurs, ZSU-23-4, Mi-17 Hip,
// Mi-28 Havoc, Su-25 Frogfoot.


// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierTakistan_EP1",
/* Objects      */ ["O_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Short_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
