// INFO ========================================================================
/*
   South korean army loadout.
*/

_factionID = "ROKA";
_factionName = "ROK Army";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceASIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "USP_PATCH_USA_USMC";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_ROKA
	  "GRANITE"
    "ROKMC"
    "DESERT"
*/
_camo = "GRANITE";
if(!isNil"BRM_FMK_LoadoutCamo_ROKA")then{_camo=BRM_FMK_LoadoutCamo_ROKA};
_lp = "GraniteB"; // Loadout Pattern
_rhp = "fg"; // Recon Head Pattern

if (_camo == "ROKMC") then {
	_lp = "ROKMC";
    _rhp = "fg";
};

// WEAPONS =====================================================================

_commonRIFLE = ["BRM_K2","rhs_mag_30Rnd_556x45_M855_Stanag"];
_reconRIFLE = ["R3F_SCAR_L_CQC_CAM","rhs_mag_30Rnd_556x45_M855_Stanag"];
_commonRIFLEGL = ["BRM_K2GL","rhs_mag_30Rnd_556x45_M855_Stanag","1Rnd_HE_Grenade_shell"];
_commonPISTOL = _P228;
_commonAR = _FNMINIMI;
_commonMG = ["R3F_Minimi_762_PARA","R3F_MINIMI_100Rnd_762x51"];
_commonMARKSMAN = _DMRRIS;
_commonSNIPER = _AWM;
_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _RHSM4;
_commonRCO = "rhsusf_acc_ACOG3";
_marksmanSCOPE = "rhsusf_acc_m8541_mrds";
_specATSCOPE = "rhs_optic_maaws";
_commonCCO = "rhsusf_acc_compm4";
_commonEOT = "rhsusf_acc_eotech_552";
_commonRAIL = "rhsusf_acc_anpeq15side_bk";
_commonBIPOD = "rhsusf_acc_tdstubby_blk";
_commonMAGNIFIED = "rhsusf_acc_nxs_3515x50f1_h58";
_commonSUPPRESSOR = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_14";

_mgSCOPE = _commonEOT;
_rifleSCOPE = _commonCCO;
_reconSCOPE = "rhsusf_acc_g33_xps3";

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
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
	"BRM_LWH_"+_lp,
  "BRM_LWH_COMS_"+_lp,
  "BRM_LWH_COMS_GHILLIE_"+_lp,
  "BRM_LWH_MASK_"+_lp,
  "BRM_LWH_MASK_COMS_"+_lp,
  "BRM_LWH_GHILLIE_"+_lp
];

_randomHEAD = selectRandom _headsLIST;
_randomGOGGLE = selectRandom ["rhs_googles_black","rhsusf_oakley_goggles_clr","empty"];

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_beret_green";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_ess";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = selectRandom [
    "rhsusf_opscore_"+_rhp+"_pelt",
    "rhsusf_opscore_"+_rhp+"_pelt_cam",
    "rhsusf_opscore_"+_rhp+"_pelt_nsw"
];

_commonUNIFORM = selectRandom ["BRM_BattleUNI_"+_lp,"BRM_BattleUNIRS_"+_lp];;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_sniperUNIFORM = "U_I_FullGhillie_lsh";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_crewUNIFORM = "U_Simc_OG107_mk3_tuck_nomex_blench";
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = "rhs_uniform_g3_mc";

_commonVEST = "BRM_Protec_"+_lp+"_RFL";
_officerVEST = _commonVEST;
_ftlVEST = "BRM_Protec_"+_lp+"_TL";
_slVEST = "BRM_Protec_"+_lp+"_SL";
_mgVEST = "BRM_Protec_"+_lp+"_MG";
_grenadierVEST = "BRM_Protec_"+_lp+"_GL";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BRM_LBT_MLTCAM_RFL";
_pilotVEST = "BMR_MLBV_GraniteB_RFL";

if (_camo == "DESERT") then {
_commonHEAD = selectRandom ["BRM_LWH_COMS_GraniteB","BRM_LWH_MASK_COMS_GraniteB"];
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_beret_green";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_ess";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = selectRandom ["rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_paint_pelt_nsw_cam"];

_commonUNIFORM = selectRandom ["BRM_BattleUNI_MARPATD","BRM_BattleUNIRS_MARPATD"];;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_sniperUNIFORM = "U_I_FullGhillie_ard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_crewUNIFORM = "U_Simc_OG107_mk3_tuck_nomex_blench";
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = "rhs_uniform_g3_mc";


_commonVEST = "BRM_Protec_GraniteB_RFL";
_officerVEST = _commonVEST;
_ftlVEST = "BRM_Protec_GraniteB_TL";
_slVEST = "BRM_Protec_GraniteB_SL";
_mgVEST = "BRM_Protec_GraniteB_MG";
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BRM_LBT_MLTCAM_RFL";
_pilotVEST = "BMR_MLBV_GraniteB_RFL";
};

_commonBACKPACK = "BRM_PatrolBP_GraniteB";
_bigBACKPACK = "BRM_LRRBP_Green";
_reconBACKPACK = "B_Carryall_mcamo";


if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman || _isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "empty") then {
        _unit addGoggles _randomGOGGLE;
    };
};

// MISC EQUIPMENT =============================================================

_rangefinder = "rhsusf_bino_lrf_Vector21";
_laserdesignator = "UK3CB_BAF_Soflam_Laserdesignator";

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
    /*  Anti Air Vehicles */ ["RHS_M6_wd"]
    /*  Attack Helos      */,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd"]
    /*  Attack Planes     */,["JS_JC_FA18E", "CUP_B_F35B_USMC"]
    /*  Heavy Vehicles    */,["UK3CB_CW_US_B_LATE_M1A1","UK3CB_LDF_B_Leopard_Cage_Camo"]
    /*  Light Vehicles    */,["rhs_tigr_msv","rhs_tigr_m_msv"]
    /*  Medium Vehicles   */,["UK3CB_LDF_B_Marshall_Camo","UK3CB_LDF_B_Marshall"]
    /*  Mobile Artillery  */,["rhsusf_m109_usarmy"]
    /*  Transport Helos   */,["RHS_MELB_MH6M", "RHS_MELB_H6M","UK3CB_CW_US_B_LATE_UH60M"]
    /*  Transport Planes  */,["RHS_C130J"]
    /*  Transport Trucks  */,["UK3CB_CW_US_B_LATE_M939_Guntruck", "UK3CB_CW_US_B_LATE_M939"]
    /*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
    /*  Submarines        */,["B_SDV_01_F"]
    /*  MRAP Vehicles     */,["UK3CB_CW_US_B_LATE_M113_M2", "UK3CB_CW_US_B_LATE_M113_MK19"]
    ];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_ROK"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_HBarrierWall4_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
