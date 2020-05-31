// INFO ========================================================================
/*

The Yugoslav People's Army was the military of Yugoslavia from 1945 to 1992 and primary part of Yugoslavia armed forces.

*/

_factionID        = "YUGO";
_factionName      = "Yugoslav People's Army";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide     = EAST;
_defaultVoice    = [_voiceRUSSIAN];
_defaultFace     = [_faceWHITE];
_defaultName     = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor    = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE            = ["rhs_weap_m70b3n", "rhssaf_30Rnd_762x39mm_M67"];
_commonRIFLEGL          = ["rhs_weap_m70b3n_pbg40", "rhssaf_30Rnd_762x39mm_M67", "rhs_VOG25"];
_commonPISTOL           = ["rhs_weap_cz99", "rhssaf_mag_15Rnd_9x19_FMJ"];
_commonAR               = ["hlc_rifle_rpk74n", "hlc_45Rnd_545x39_t_rpk"];
_commonMG               = _M84;
_commonMARKSMAN         = ["rhs_weap_m76", "rhsgref_10Rnd_792x57_m76"];
_commonSNIPER           = ["rhs_weap_m76", "rhsgref_10Rnd_792x57_m76"];
_commonAT               = ["rhs_weap_m80", "rhs_m80_mag"];
_specAT                 = ["rhs_weap_m80", "rhs_m80_mag"];
_commonSMG              = ["rhs_weap_scorpion", "rhsgref_20rnd_765x17_vz61"];
_commonRCO              = "rhs_acc_1p29";
_commonCCO              = "rhs_acc_ekp1";
_commonMAGNIFIED        = "rhs_acc_pso1m2";
_commonSUPPRESSOR       = "rhs_acc_pbs1";
_commonPISTOLSUPPRESSOR = "";
_NVG                    = "rhs_1PN138";

// AMMO COUNT ==================================================================

_countRIFLE    = 9;
_countRIFLELOW = 6;
_countPISTOL   = 2;
_countAR       = 7;
_countMG       = 5;
_countSNIPER   = 5;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 10;

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
    "rhssaf_helmet_m59_85_oakleaf"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _randomHEAD;
_officerHEAD = "BRM_beret_green";
_medicHEAD = "rhssaf_bandana_oakleaf";
_crewmanHEAD = "rhs_tsh4";
_pilotHEAD = "rhs_zsh7a_alt";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = "rhssaf_bandana_oakleaf";
_demoHEAD = "rhssaf_bandana_oakleaf";
_reconHEAD = "rhssaf_bandana_oakleaf";

_commonUNIFORM = "rhssaf_uniform_m93_oakleaf_summer";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhssaf_uniform_heli_pilot";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST    = "rhssaf_vest_md99_md2camo_rifleman";
_officerVEST   = "rhssaf_vest_md99_md2camo";
_ftlVEST       = "rhssaf_vest_md99_md2camo_rifleman_radio";
_slVEST        = "rhssaf_vest_md99_md2camo_radio";
_mgVEST        = _commonVEST;
_grenadierVEST = _commonUNIFORM;
_medicVEST     = "rhssaf_vest_md99_md2camo";
_demoVEST      = "rhssaf_vest_md99_md2camo";
_marksmanVEST  = _commonVEST;
_reconVEST     = _commonVEST;

_commonBACKPACK = "rhssaf_kitbag_smb";
_bigBACKPACK = "rhssaf_alice_smb";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_Metis_Gun_Bag";
_ATTripod = "RHS_Metis_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */     ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/*  Attack Helos      */    ,["RHS_Mi8MTV3_vvs"]
/*  Attack Planes     */    ,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "rhs_mig29sm_vvs"]
/*  Heavy Vehicles    */    ,["rhs_t72ba_tv", "UK3CB_B_T34_CDF", "UK3CB_B_G_T55"]
/*  Light Vehicles    */    ,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/*  Medium Vehicles   */    ,["rhs_btr60_msv", "UK3CB_O_G_MTLB_PKT", "rhsgref_BRDM2", "rhs_bmp1_vv"]
/*  Mobile Artillery  */    ,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */    ,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs"]
/*  Transport Planes  */    ,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */    ,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/*  Static Defence    */    ,["rhs_Metis_9k115_2_msv", "rhs_Igla_AA_pod_msv", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*  Boats             */    ,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */    ,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */    ,["O_UGV_01_rcws_F"]
/*  Support           */    ,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*  Submarines        */    ,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */    ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "rhssaf_flag_yugoslavia",
/* Objects      */ ["O_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Short_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
