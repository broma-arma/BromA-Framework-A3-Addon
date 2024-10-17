/*
    Chinese PLA loadout, available with multiple camos and use APEX weapons.

    Camo: ""UNI", "NAVY", "ARTY", "PLAT" (BRM_FMK_LoadoutCamo_PLA)
*/

_factionID = "PLA";
_factionName = "Chinese PLA";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceChinese];
_defaultFace = [_faceAsian];
_defaultName = [_nameChinese];
_defaultInsignia = "USP_PATCH_CHI_PLA_BEIJING_REGION";
_defaultColor = "red";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_PLA", "UNI"];

// WEAPONS =====================================================================
_commonRifle = ["arifle_CTAR_blk_F", "30Rnd_580x42_Mag_F"];
_commonRifleGL = ["arifle_CTAR_GL_blk_F", "30Rnd_580x42_Mag_F", "1Rnd_HE_Grenade_shell"];
_commonAR = ["arifle_CTAR_blk_F", "100Rnd_580x42_Mag_F"];
_commonMG = _commonAR;
_commonMarksman = ["srifle_DMR_07_blk_F", "20Rnd_650x39_Cased_Mag_F"];;
_commonSniper = ["srifle_DMR_07_blk_F", "20Rnd_650x39_Cased_Mag_F"];
_commonSMG = _commonRifle;

_commonPistol = ["hgun_Rook40_F", "16Rnd_9x21_Mag"];

_commonAT = _RPG26;
_specAT = ["launch_RPG32_green_F", "RPG32_F"];
_weaponsAA = ["rhs_weap_igla", "rhs_mag_9k38_rocket"];
_weaponsAT = _specAT;

_commonRCO = "ACE_optic_MRCO_2D";
_commonCCO = "optic_Holosight_blk_F";

_rifleScope = _commonCCO;
_sniperScope = "optic_SOS";

_commonSuppressor = "muzzle_snds_58_blk_F";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 10;
_countRifleLow = 5;
_countAR = 5;
_countMG = 3;
_countSniper = 10;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 4;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 30;
_countMGCargo = 30;
_countSniperCargo = 30;
_countSpecATCargo = 20;
_count40mmCargo = 40;
_countPistolCargo = 20;
_countGrenadesCargo = 40;

// MEDICAL =====================================================================
_countBandage = 20;
_countMorphine = 10;
_countEpi = 5;
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 30;
_countBloodbagCargo = 20;
_countPAKCargo = 20;

// UNIFORMS ====================================================================
_commonHead = selectRandom [
	"BRM_LWH_COMS_T07"+_camo,
	"BRM_LWH_MASK_COMS_T07"+_camo,
	"BRM_LWH_MASK_T07"+_camo,
	"BRM_LWH_T07"+_camo
];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_T07"+_camo;
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "rhs_zsh7a_alt";
_helicrewHead = "rhs_zsh7a_mike_alt";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "rhsusf_opscore_bk_pelt";

_commonUniform = selectRandom [
	"BRM_EBattleUNI_T07"+_camo,
	"BRM_EBattleUNIRS_T07"+_camo
];
_officerUniform = _commonUniform;
_pilotUniform = "rhs_uniform_df15";
_sniperUniform = "U_I_FullGhillie_sard";
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BMR_MLBVARMOR_T07"+_camo+"_RFL";
_officerVest = "BMR_MLBVARMOR_T07"+_camo+"_SL";
_ftlVest = "BMR_MLBVARMOR_T07"+_camo+"_TL";
_slVest = _officerVest;
_mgVest = "BMR_MLBVARMOR_T07"+_camo+"_MG";
_grenadierVest = "BMR_MLBVARMOR_T07"+_camo+"_GL";
_medicVest = "BMR_MLBVARMOR_T07"+_camo+"_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "BRM_LBT_BLACK_RFL";
_pilotVest = "rhs_belt_AK";

_commonBackpack = "BRM_PatrolBP_T07"+_camo;
_bigBackpack = "BRM_PatrolBPH_T07"+_camo;
_reconBackpack = _bigBackpack;

// MISC EQUIPMENT =============================================================
_NVG = "rhs_1PN138";

// EXTRA EQUIPMENT =============================================================
_hmg = "O_HMG_01_high_weapon_F";
_hmgTripod = "O_HMG_01_support_F";

_staticAT = "O_AT_01_weapon_F";
_atTripod = "O_HMG_01_support_F";

_mortar = "O_Mortar_01_weapon_F";
_mortarTripod = "O_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["O_PGZ09_AA"]
/* Attack Helos      */,[]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,["O_ZTQ15", "O_ZTZ96B", "O_ZTZ99", "O_ZTZ99A"]
/* Light Vehicles    */,[]
/* Medium Vehicles   */,["O_ZBD04A", "O_ZBL09", "O_ZTL11"]
/* Mobile Artillery  */,["O_PLZ05", "O_PLL09", "RHS_BM21_VV_01"]
/* Transport Helos   */,["VME_PLA_Mi17"]
/* Transport Planes  */,[]
/* Transport Trucks  */,[]
/* Static Defence    */,[]
/* Boats             */,[]
/* UAV               */,[]
/* UGV               */,[]
/* Support           */,[]
/* Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/* MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_PRC"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
