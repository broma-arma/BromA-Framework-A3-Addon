// INFO ========================================================================
/*
    A FUCKING LEAF
*/

_factionID = "CANARMY";
_factionName = "Canada armed forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE, _faceBLACK, _faceASIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "USP_PATCH_CAN_BASE";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_CANArmyCammo
	"CADPATD"
	"CADPATW"
*/

_camo = "CADPATW";

// WEAPONS =====================================================================

_commonRIFLE = ["tfc_w_c7a2","rhs_mag_30Rnd_556x45_M855_Stanag_Pull"];
_commonRIFLEGL = ["tfc_w_c7a2_m203","rhs_mag_30Rnd_556x45_M855_Stanag_Pull","rhs_mag_M441_HE"];
_commonPISTOL = ["UK3CB_BHP","UK3CB_BHP_9_13Rnd"];
_commonAR = ["tfc_w_c9a2","rhsusf_200rnd_556x45_M855_mixed_box"];
_commonMG = ["UK3CB_BAF_L7A2","UK3CB_BAF_762_100Rnd_T"];
_commonMARKSMAN = ["UK3CB_BAF_L129A1","UK3CB_BAF_762_L42A1_20Rnd"];
_commonSNIPER = ["R3F_TAC50","R3F_5Rnd_127x99_TAC50"];
_commonAT = _M72A7;
_specAT = _GUSTAV;
_commonSMG = _MP5A5;
_commonRCO = "tfc_wa_c79_elcan";
_commonCCO = "";
_commonMAGNIFIED = "rksl_optic_pmii_525_des";
_commonSUPPRESSOR = "hlc_muzzle_556nato_rotexiiic_grey";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_14";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 5;
_countMG = 3;
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
if(!isNil "BRM_FMK_UNIFORMS_CANArmyCammo")then{_camo=BRM_FMK_UNIFORMS_CANArmyCammo};

_headsLIST = [
    "BRM_LWH_"+_camo,
    "BRM_LWH_COMS_"+_camo,
    "BRM_LWH_MASK_"+_camo,
    "BRM_LWH_MASK_COMS_"+_camo,
    "BRM_LWH_GHILLIE_"+_camo,
    "BRM_LWH_COMS_GHILLIE_"+_camo
];

_uniformsLIST = [
    "BRM_BattleUNI_"+_camo,
    "BRM_BattleUNIRS_"+_camo,
    "BRM_BattleUNITS_"+_camo
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = selectRandom _uniformsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_"+_camo;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_BoonieCOMS_"+_camo;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "U_B_HeliPilotCoveralls";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_B_HeliPilotCoveralls";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_Protec_"+_camo+"_RFL";
_officerVEST = "BRM_Protec_"+_camo+"_SL";
_ftlVEST = "BRM_Protec_"+_camo+"_TL";
_slVEST = _officerVEST;
_mgVEST = "BRM_Protec_"+_camo+"_MG";
_grenadierVEST = "BRM_Protec_"+_camo+"_GL";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BRM_LBT_GREEN_RFL";

_commonBACKPACK = "BRM_PatrolBP_"+_camo;
_bigBACKPACK = "BRM_LRRBP_Green";

if (_assignLoadoutMode) then { _unit addGoggles _randomGOGGLE };

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
    /*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
    /*  Attack Helos      */	,["RHS_AH64D_wd", "TFC_CH146444_dynamicLoadout_F"]
    /*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */	,["ffaa_et_leopardo"]
    /*  Light Vehicles    */	,["TFC_vs_luvw_F", "rhsusf_m966_w", "rhsusf_m1151_m2_v1_usarmy_wd", "rhsusf_m1151_mk19_v1_usarmy_wd"]
    /*  Medium Vehicles   */	,["UK3CB_CW_US_B_LATE_LAV25"]
    /*  Mobile Artillery  */	,["rhsusf_m109_usarmy"]
    /*  Transport Helos   */	,["TFC_CH146402_unarmed_F"]
    /*  Transport Planes  */	,["RHS_C130J"]
    /*  Transport Trucks  */	,["C_TFC_VS_LSVW_transport_covered_F", "C_TFC_VS_LSVW_transport_uncovered_F"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_m113_usarmy_M2_90", "rhsusf_m113_usarmy_MK19", "rhsusf_M1117_D"]
    ];
};

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_canada",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_HBarrierWall4_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
