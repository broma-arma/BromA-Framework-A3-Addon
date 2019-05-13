// INFO ========================================================================
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

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = ["hlc_rifle_SG551LB_TAC", "hlc_30Rnd_556x45_EPR_sg550"];
_commonRIFLEGL = ["hlc_rifle_SG551LB_TAC", "hlc_30Rnd_556x45_EPR_sg550","1Rnd_HE_Grenade_shell"];
_commonPISTOL = _P226;
_commonAR = _M249E1;
_commonMG = _M240G;
_commonMARKSMAN = _STG58;
_commonSNIPER = ["rhs_weap_m24sws_blk", "rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonAT = _AT4;
_specAT = ["rhs_weap_maaws","rhs_mag_maaws_HEAT"];
_commonSMG = ["hgun_PDW2000_F","30Rnd_9x21_Mag"];
_commonRCO = "rhsusf_acc_SpecterDR";
_commonCCO = "FHQ_optic_AIM";
_commonMAGNIFIED = "rhsusf_acc_LEUPOLDMK4_2";
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "";
_NVG = _PVS14;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
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

_countBandageCARGO = 50;
_countMorphineCARGO = 40;
_countEpiCARGO = 30;
_countBloodbagCARGO = 30;
_countPAKCARGO = 40;

// UNIFORMS ====================================================================

_headsLIST = [
    "TRYK_H_Helmet_JSDF",
    "TRYK_H_Booniehat_JSDF"
];

_uniformsLIST = [
    "TRYK_U_B_JSDF_CombatUniform",
    "TRYK_U_B_JSDF_CombatUniformTshirt"

];

_vestsLIST = [
    "TRYK_V_PlateCarrier_JSDF"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

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

_commonBACKPACK = "TRYK_B_AssaultPack_Type2camo";
_bigBACKPACK = "TRYK_B_Carryall_JSDF";

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
/*  Anti Air Vehicles    */  ["B_APC_Tracked_01_AA_F"]
/*  Attack Helos 	     */	,["RHS_AH1Z","RHS_AH1Z_wd"]
/*  Attack Planes 	     */	,["rhs_l159_CDF"]
/*  Heavy Vehicles 	     */	,["I_MBT_03_cannon_F","B_AFV_Wheeled_01_cannon_F"]
/*  Light Vehicles 	     */	,["rhssaf_m998_olive_2dr_fulltop", "rhssaf_m1025_olive_m2"]
/*  Medium Vehicles 	 */	,["I_APC_tracked_03_cannon_F"]
/*  Mobile Artillery     */	,["rhsusf_m109_usarmy","B_MBT_01_mlrs_F"]
/*  Transport Helos      */	,["RHS_CH_47F","RHS_UH60M","RHS_UH1Y"]
/*  Transport Planes     */	,["RHS_C130J"]
/*  Transport Trucks     */	,["rhsusf_M1078A1P2_WD_fmtv_usarmy"]
/*  Static Defence       */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */	,["rhsusf_M978A4_BKIT_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", "rhsusf_M1230a1_usarmy_wd"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */ ,["rhsusf_m113_usarmy_M2_90", "rhsusf_m113_usarmy_MK19_90"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
