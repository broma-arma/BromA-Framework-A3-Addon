/*
    The armed forces of anime land. THE JSDF (JSF for short) is a combination of Japan's military branches that was established in 1954 and then relegated to Peacekeeping operations.
    Recent tensions over North Korea have forced the Japanese Ministry of Defense to devote a higher budget to the JSF, Resulting in the rapid replacement of older weaponry and equipment in favor of modern equipment.

    Camo: "JIEITAIW", "JIEITAID" (BRM_FMK_LoadoutCamo_JSDF)
*/

_factionID = "JSDF";
_factionName = "Japanese Self Defense Force";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceAsian];
_defaultName = [_nameAmerican];
_defaultInsignia = "USP_PATCH_MORALE_STRENGTH_KANJI_BLK";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_JSDF", "JIEITAIW"];

// WEAPONS =====================================================================
_commonRifle = ["BRM_Type89", _30rnd556STANAG];
_commonRifleGL = ["BRM_Type89", _30rnd556STANAG, "BRM_Type06_HE"];
_reconRifle = _HLC416D10;
_commonAR = _M249E1;
_commonMG = _M240G;
_commonMarksman = _DMRRIS;
_commonSniper = ["rhs_weap_m24sws_blk", "rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonSMG = ["hgun_PDW2000_F", "30Rnd_9x21_Mag"];

_commonPistol = _P226;

_commonAT = _AT4;
_specAT = ["rhs_weap_maaws", "rhs_mag_maaws_HEAT"];
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "BRM_T89_ACOG";
_commonCCO = "BRM_T89_CompM4";

_rifleScope = _commonCCO;
_reconScope = "rhsusf_acc_acog_rmr";
_sniperScope = "rhsusf_acc_LEUPOLDMK4_2";

_commonSuppressor = "muzzle_snds_M";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 4;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countMGCargo = 20;
_countSniperCargo = 30;
_countSpecATCargo = 15;
_count40mmCargo = 40;
_countPistolCargo = 10;
_countGrenadesCargo = 20;

// MEDICAL =====================================================================
_countBandage = 20;
_countMorphine = 10;
_countEpi = 5;
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 50;
_countMorphineCargo = 40;
_countEpiCARGO = 30;
_countBloodbagCargo = 30;
_countPAKCargo = 40;

// UNIFORMS ====================================================================
_commonHead = selectRandom [
	"BRM_LWH_COMS_"+_camo,
	"BRM_LWH_"+_camo,
	"BRM_LWH_MASK_"+_camo,
	"BRM_LWH_MASK_COMS_"+_camo,
	"BRM_LWH_GHILLIE_"+_camo,
	"BRM_LWH_COMS_GHILLIE_"+_camo
];
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_ess";
_pilotHead = "rhsusf_hgu56p";
_helicrewHead = "rhsusf_hgu56p_mask";
_helipilotHead = "rhsusf_hgu56p";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_BoonieCOMS_"+_camo;

_commonUniform = selectRandom [
	"BRM_BattleUNI_"+_camo,
	"BRM_BattleUNIRS_"+_camo,
	"BRM_BattleUNIT_"+_camo
];
_officerUniform = _commonUniform;
_pilotUniform = _commonUniform;
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["BRM_Protec_JIEITAIW_RFL", "BRM_Protec_CADPATD_RFL"] select (_camo == "JIEITAID");
_officerVest = ["BRM_Protec_JIEITAIW_SL", "BRM_Protec_CADPATD_SL"] select (_camo == "JIEITAID");
_ftlVest = ["BRM_Protec_JIEITAIW_TL", "BRM_Protec_CADPATD_TL"] select (_camo == "JIEITAID");
_slVest = _officerVest;
_mgVest = ["BRM_Protec_JIEITAIW_MG", "BRM_Protec_CADPATD_MG"] select (_camo == "JIEITAID");
_grenadierVest = ["BRM_Protec_JIEITAIW_GL", "BRM_Protec_CADPATD_GL"] select (_camo == "JIEITAID");
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = ["UK3CB_BAF_V_Pilot_DPMW", "UK3CB_BAF_V_Pilot_DDPM"] select (_camo == "JIEITAID");

_commonBackpack = "BRM_PatrolBP_JIEITAIW";
_bigBackpack = "BRM_PatrolBPH_JIEITAIW";

// MISC EQUIPMENT =============================================================
_NVG = _PVS14;

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_M2_Gun_Bag";
_hmgTripod = "RHS_M2_Tripod_Bag";

_staticAT = "rhs_Tow_Gun_Bag";
_atTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F"]
/* Attack Helos      */,["RHS_AH1Z", "RHS_AH1Z_wd"]
/* Attack Planes     */,["rhs_l159_CDF"]
/* Heavy Vehicles    */,["I_MBT_03_cannon_F", "B_AFV_Wheeled_01_cannon_F"]
/* Light Vehicles    */,["rhssaf_m998_olive_2dr_fulltop", "rhssaf_m1025_olive_m2"]
/* Medium Vehicles   */,["I_APC_tracked_03_cannon_F"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy", "B_MBT_01_mlrs_F"]
/* Transport Helos   */,["RHS_CH_47F", "RHS_UH60M", "RHS_UH1Y"]
/* Transport Planes  */,["RHS_C130J"]
/* Transport Trucks  */,["rhsusf_M1078A1P2_WD_fmtv_usarmy"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M978A4_BKIT_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", "rhsusf_M1230a1_usarmy_wd"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_m113_usarmy_M2_90", "rhsusf_m113_usarmy_MK19_90"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_Japan"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
