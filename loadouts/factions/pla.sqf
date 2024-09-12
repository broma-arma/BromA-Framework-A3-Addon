// INFO ========================================================================
/*
    Chinese PLA loadout, available with multiple camos and use APEX weapons.
*/

_factionID        = "PLA";
_factionName      = "Chinese PLA";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide     = EAST;
_defaultVoice    = [_voiceCHINESE];
_defaultFace     = [_faceASIAN];
_defaultName     = [_nameCHINESE];
_defaultInsignia = "USP_PATCH_CHI_PLA_BEIJING_REGION";
_defaultColor    = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_PLA
    "UNI"
    "NAVY"
    "ARTY"
    "PLAT"
*/

_camo = "UNI";
if(!isNil "BRM_FMK_UNIFORMS_PLACammo" && {BRM_FMK_UNIFORMS_PLACammo})then{_camo=BRM_FMK_UNIFORMS_PLACammo}; // Backward compatibility
if(!isNil "BRM_FMK_LoadoutCamo_PLA")then{_camo=BRM_FMK_LoadoutCamo_PLA};

// WEAPONS =====================================================================

_commonRIFLE            = ["arifle_CTAR_blk_F","30Rnd_580x42_Mag_F"];
_commonRIFLEGL          = ["arifle_CTAR_GL_blk_F","30Rnd_580x42_Mag_F","1Rnd_HE_Grenade_shell"];
_commonPISTOL           = ["hgun_Rook40_F","16Rnd_9x21_Mag"];
_commonAR               = ["arifle_CTAR_blk_F","100Rnd_580x42_Mag_F"];
_commonMG               = _commonAR;
_commonMARKSMAN         = ["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F"];;
_commonSNIPER           = ["srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F"];
_commonAT               = _RPG26;
_specAT                 = ["launch_RPG32_green_F","RPG32_F"];
_weaponsAA              = ["rhs_weap_igla","rhs_mag_9k38_rocket"];
_weaponsAT              = _specAT;
_commonSMG              = _commonRIFLE;
_commonRCO              = "ACE_optic_MRCO_2D";
_commonCCO              = "optic_Holosight_blk_F";
_commonMAGNIFIED        = "optic_SOS";
_commonSUPPRESSOR       = "muzzle_snds_58_blk_F";
_commonPISTOLSUPPRESSOR = "";
_NVG                    = "rhs_1PN138";

_rifleSCOPE = _commonCCO;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 5;
_countPISTOL   = 4;
_countAR       = 5;
_countMG       = 3;
_countSNIPER   = 10;
_countAT       = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countArCARGO       = 30;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countATCARGO       = 20;
_countGrenadesCARGO = 40;
_count40mmCARGO     = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO  = 40;
_countMorphineCARGO = 30;
_countEpiCARGO      = 30;
_countBloodbagCARGO = 20;
_countPAKCARGO      = 20;

// UNIFORMS ====================================================================

_uniformsLIST = [
	"BRM_EBattleUNI_T07"+_camo,
	"BRM_EBattleUNIRS_T07"+_camo
];
_headsLIST = [
	"BRM_LWH_COMS_T07"+_camo,
	"BRM_LWH_MASK_COMS_T07"+_camo,
	"BRM_LWH_MASK_T07"+_camo,
	"BRM_LWH_T07"+_camo
];

_randomUNIFORM = selectRandom _uniformsLIST;
_randomHEAD = selectRandom _headsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_T07"+_camo;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhs_zsh7a_alt";
_helicrewHEAD = "rhs_zsh7a_mike_alt";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhsusf_opscore_bk_pelt";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = "U_I_FullGhillie_sard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST    = "BMR_MLBVARMOR_T07"+_camo+"_RFL";
_officerVEST   = "BMR_MLBVARMOR_T07"+_camo+"_SL";
_ftlVEST       = "BMR_MLBVARMOR_T07"+_camo+"_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BMR_MLBVARMOR_T07"+_camo+"_MG";
_grenadierVEST = "BMR_MLBVARMOR_T07"+_camo+"_GL";
_medicVEST     = "BMR_MLBVARMOR_T07"+_camo+"_MED";
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "BRM_LBT_BLACK_RFL";
_pilotVEST = "rhs_belt_AK";

_commonBACKPACK = "BRM_PatrolBP_T07"+_camo;
_bigBACKPACK = "BRM_PatrolBPH_T07"+_camo;
_reconBACKPACK = _bigBACKPACK;

// EXTRA EQUIPMENT =============================================================

_HMG = "O_HMG_01_high_weapon_F";
_HMGTripod = "O_HMG_01_support_F";

_StaticAT = "O_AT_01_weapon_F";
_ATTripod = "O_HMG_01_support_F";

_mortar = "O_Mortar_01_weapon_F";
_mortarTripod = "O_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["O_PGZ09_AA"]
/*  Attack Helos      */,[]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,["O_ZTQ15", "O_ZTZ96B", "O_ZTZ99", "O_ZTZ99A"]
/*  Light Vehicles    */,[]
/*  Medium Vehicles   */,["O_ZBD04A","O_ZBL09","O_ZTL11"]
/*  Mobile Artillery  */,["O_PLZ05", "O_PLL09", "RHS_BM21_VV_01"]
/*  Transport Helos   */,["VME_PLA_Mi17"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,[]
/*  Static Defence    */,[]
/*  Boats             */,[]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,[]
/*  Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_PRC"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
