// INFO ========================================================================
/*
    The Armed Forces of the Russian Federation are the military service of Russia,
	established after the dissolution of the Soviet Union.
*/

_factionID = "RUSSIA_AFGHAN";
_factionName = "Russian Army";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE, _faceASIAN];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "USP_PATCH_RUS_NAVAL_INFANTRY";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK74N;
_commonRIFLEGL = _AK74NGL;
_commonPISTOL = _Makarov;
_commonAR = _PKM;
_commonMG = _PKM;
_commonMARKSMAN = _SVD;
_commonSNIPER = _SVD;
_commonAT = _RPG26;
_specAT = _RPG7;
_commonSMG = _AK74UN;
_commonRCO = "rhs_acc_1p29";
_commonCCO = "rhs_acc_ekp1";
_commonMAGNIFIED = "rhs_acc_pso1m21_ak";
_commonSUPPRESSOR = "rhs_acc_pso1m21_ak";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = "rhs_1PN138";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 7;
_countMG = 5;
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

_commonHEAD = "rhs_ssh68";
_leaderHEAD = "rhs_fieldcap_khk";
_officerHEAD = "rhs_beret_mp2";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = "H_Booniehat_tan";
_demoHEAD = _commonHEAD;
_reconHEAD = "H_Bandanna_khk";

_commonUNIFORM = "rhs_uniform_m88_patchless";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhs_6b5_rifleman_khaki";
_officerVEST = "rhs_6b5_officer_khaki";
_ftlVEST = _commonVEST;
_slVEST = _officerVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = "rhs_6b5_medic_khaki";
_demoVEST = _commonVEST;
_marksmanVEST = "rhs_6b5_sniper_khaki";
_reconVEST = _commonVEST;

_commonBACKPACK = "BRM_SqBackpack_Green";
_bigBACKPACK = "BRM_SqBackpack_Green";

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
/*  Attack Helos      */	,["RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/*  Attack Planes     */	,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs"]
/*  Heavy Vehicles    */	,["rhs_t80", "rhs_t80b", "rhs_t72ba_tv", "rhs_t72bb_tv"]
/*  Light Vehicles    */	,["rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/*  Medium Vehicles   */	,["rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv", "rhs_bmp1_vdv", "rhs_bmd1", "rhs_bmd1r"]
/*  Mobile Artillery  */	,["rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */	,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/*  Static Defence    */	,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*  Boats             */	,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */	,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */	,["O_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "rhs_gaz66_repair_vmf", "rhs_gaz66_ap2_vmf"]
/*  Submarines        */	,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "rhs_Flag_Russia_F",
/* Objects      */ ["O_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Short_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];
