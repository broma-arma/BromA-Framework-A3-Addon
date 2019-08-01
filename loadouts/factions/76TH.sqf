// INFO ========================================================================
/*
    The 76th Guards Airborne Division of the Russian army from 1960-1970.
	
*/

_factionID = "76TH";
_factionName = "76th Guards Airborne Division";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE, _faceASIAN];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "USP_PATCH_RUS_ARMY_76GUARDS_AIR_DIV";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = ["rhs_weap_akm", "rhs_30Rnd_762x39mm_89"];
_commonRIFLEGL = ["rhs_weap_akm_gp25", "rhs_30Rnd_762x39mm_89", "hlc_VOG25_AK"];
_commonPISTOL = ["rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S"];
_commonAR = ["hlc_rifle_rpk", "hlc_75Rnd_762x39_m_rpk"];
_commonMG = _PKM;
_commonMARKSMAN = ["rhs_weap_svdp_wd", "rhs_10Rnd_762x54mmR_7N1"];
_commonSNIPER = ["rhs_weap_svdp_wd", "rhs_10Rnd_762x54mmR_7N1"];
_commonAT = _RPG7;
_specAT = _RPG7PGO;
_commonSMG = ["rhs_weap_savz61", "rhsgref_20rnd_765x17_vz61"];
_commonRCO = "rhs_acc_pso1m2";
_commonCCO = "";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "rhs_acc_pbs1";
_commonPISTOLSUPPRESSOR = "";
_NVG = "";

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
_officerHEAD = "rhs_beret_vdv3";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = "rhs_beanie_green";
_demoHEAD = _commonHEAD;
_reconHEAD = "rhs_beanie_green";

_commonUNIFORM = "rhs_uniform_m88_patchless";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = "LOP_U_US_Fatigue_14";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = "LOP_U_US_Fatigue_13";

_commonVEST = "LOP_V_6Sh92_OLV";
_officerVEST = "LOP_V_6Sh92_Radio_OLV";
_ftlVEST = _commonVEST;
_slVEST = _officerVEST;
_mgVEST = _commonVEST;
_grenadierVEST = "LOP_V_6Sh92_Vog_OLV";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "rhs_sidor";
_bigBACKPACK = "rhssaf_alice_smb";

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
/*  Anti Air Vehicles */	 ["rhs_zsu234_aa", "rhs_gaz66_zu23_vdv"]
/*  Attack Helos      */	,["RHS_Mi24P_vdv", "RHS_Mi8MTV3_vdv", "RHS_Mi8MTV3_heavy_vdv"]
/*  Attack Planes     */	,[""]
/*  Heavy Vehicles    */	,["LOP_AFR_OPF_T55"]
/*  Light Vehicles    */	,["LOP_US_UAZ", "LOP_US_UAZ_Open", "LOP_US_UAZ_DshKM", "LOP_US_UAZ_SPG"]
/*  Medium Vehicles   */	,["rhs_bmp1_vdv", "rhs_btr60_vdv"]
/*  Mobile Artillery  */	,["rhs_2s3_tv", "RHS_BM21_VDV_01"]
/*  Transport Helos   */	,["RHS_Mi8AMT_vdv", "RHS_Mi8mt_vdv"]
/*  Transport Planes  */	,["RHS_AN2_B"]
/*  Transport Trucks  */	,["rhs_gaz66_VDV", "rhs_gaz66o_VDV"]
/*  Static Defence    */	,["rhsgref_ins_DSHKM", "rhsgref_ins_DSHKM_Mini_Tripod", "rhs_SPG9M_VDV", "RHS_ZU23_VDV", "rhs_D30_vdv", "rhs_D30_at_vdv"]
/*  Boats             */	,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */	,[""]
/*  UGV               */	,[""]
/*  Support           */	,["rhs_gaz66_ammo_vdv", "RHS_Ural_Fuel_VDV_01", "rhs_gaz66_repair_vdv", "rhs_gaz66_ap2_vdv"]
/*  Submarines        */	,[""]
/*  MRAP Vehicles     */    ,["rhsgref_BRDM2_vdv", "rhsgref_BRDM2UM_vdv", "rhsgref_BRDM2_HQ_vdv"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "rhs_Flag_Russia_F",
/* Objects      */ ["O_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Short_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];
