/*
    The armed forces of anime land. THE JSDF (JSF for short) is a combination of Japan's military branches that was established in 1954 and then relegated to Peacekeeping operations.
    Recent tensions over North Korea have forced the Japanese Ministry of Defense to devote a higher budget to the JSF, Resulting in the rapid replacement of older weaponry and equipment in favor of modern equipment.
*/

_factionID = "JSDF";
_factionName = "Japanese Self Defense Force";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceASIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "USP_PATCH_MORALE_STRENGTH_KANJI_BLK";
_defaultColor = "blue";

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_JSDF
    "JIEITAIW"
    "JIEITAID"
*/

_camo = "JIEITAIW";
if (!isNil "BRM_FMK_LoadoutCamo_JSDF") then {_camo=BRM_FMK_LoadoutCamo_JSDF};

// WEAPONS =====================================================================

_commonRIFLE = ["BRM_Type89", _30rnd556STANAG];
_commonRIFLEGL = ["BRM_Type89", _30rnd556STANAG, "BRM_Type06_HE"];
_reconRIFLE = _HLC416D10;
_commonPISTOL = _P226;
_commonAR = _M249E1;
_commonMG = _M240G;
_commonMARKSMAN = _DMRRIS;
_commonSNIPER = ["rhs_weap_m24sws_blk", "rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonAT = _AT4;
_specAT = ["rhs_weap_maaws","rhs_mag_maaws_HEAT"];
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = ["hgun_PDW2000_F","30Rnd_9x21_Mag"];
_commonRCO = "";
_commonCCO = "";
_sniperSCOPE = "rhsusf_acc_LEUPOLDMK4_2";
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "";
_NVG = _PVS14;

_reconSCOPE = "rhsusf_acc_acog_rmr";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countSpecAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countSpecATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 50;
_countMorphineCARGO = 40;
_countEpiCARGO = 30;
_countBloodbagCARGO = 30;
_countPAKCARGO = 40;

// UNIFORMS ====================================================================

_headsLIST = [
	"BRM_LWH_COMS_"+_camo,
	"BRM_LWH_"+_camo,
	"BRM_LWH_MASK_"+_camo,
	"BRM_LWH_MASK_COMS_"+_camo,
	"BRM_LWH_GHILLIE_"+_camo,
	"BRM_LWH_COMS_GHILLIE_"+_camo
];

_uniformsLIST = [
	"BRM_BattleUNI_"+_camo,
	"BRM_BattleUNIRS_"+_camo,
	"BRM_BattleUNIT_"+_camo
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_BoonieCOMS_"+_camo;

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

_commonVEST = "BRM_Protec_JIEITAIW_RFL";
_officerVEST = "BRM_Protec_JIEITAIW_SL";
_ftlVEST = "BRM_Protec_JIEITAIW_TL";
_slVEST = _officerVEST;
_mgVEST = "BRM_Protec_JIEITAIW_MG";
_grenadierVEST = "BRM_Protec_JIEITAIW_GL";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BMR_MLBVARMOR_GREEN_RFL";
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_JIEITAIW";
_bigBACKPACK = "BRM_PatrolBPH_JIEITAIW";

_rifleSCOPE = _commonCCO;

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
/*  Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F"]
/*  Attack Helos      */,["RHS_AH1Z","RHS_AH1Z_wd"]
/*  Attack Planes     */,["rhs_l159_CDF"]
/*  Heavy Vehicles    */,["I_MBT_03_cannon_F","B_AFV_Wheeled_01_cannon_F"]
/*  Light Vehicles    */,["rhssaf_m998_olive_2dr_fulltop", "rhssaf_m1025_olive_m2"]
/*  Medium Vehicles   */,["I_APC_tracked_03_cannon_F"]
/*  Mobile Artillery  */,["rhsusf_m109_usarmy","B_MBT_01_mlrs_F"]
/*  Transport Helos   */,["RHS_CH_47F","RHS_UH60M","RHS_UH1Y"]
/*  Transport Planes  */,["RHS_C130J"]
/*  Transport Trucks  */,["rhsusf_M1078A1P2_WD_fmtv_usarmy"]
/*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */,["B_Boat_Armed_01_minigun_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["rhsusf_M978A4_BKIT_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", "rhsusf_M1230a1_usarmy_wd"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsusf_m113_usarmy_M2_90", "rhsusf_m113_usarmy_MK19_90"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_Japan"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
