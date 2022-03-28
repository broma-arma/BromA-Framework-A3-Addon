// INFO ========================================================================
/*
    Estonian Defense Forces
*/

_factionID        = "ESTONIA";
_factionName      = "Estonian Defense Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceAMERICAN];
_defaultFace     = [_faceWHITE];
_defaultName     = [_nameENGLISH];
_defaultInsignia = "";
_defaultColor    = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];


// WEAPONS =====================================================================

_commonRIFLE = _HK33A2;
_reconRIFLE = _RHSHK416D10;
_commonRIFLEGL = _HK33A2RISGL;
_commonPISTOL = ["R3F_HKUSP","R3F_15Rnd_9x19_HKUSP"];
_commonMG = _MG3;
_commonAR = _commonMG;
_commonMARKSMAN = _commonRIFLE;
_commonSNIPER = _L115A3CAMO;
_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _MP5A5;
_commonRCO = "";
_marksmanSCOPE = "hlc_optic_zfsg1";
_specATSCOPE = "rhs_optic_maaws";
_commonCCO = "r3f_comp_m5";
_commonMAGNIFIED = "UK3CB_BAF_SB31250_Ghillie";
_commonSUPPRESSOR = "rhsusf_acc_nt4_black";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_reconSCOPE = "rhsusf_acc_acog_rmr";

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
    "BRM_LWH_ESTDCU",
    "BRM_LWH_COMS_GHILLIE_ESTDCU",
    "BRM_LWH_MASK_ESTDCU"
];

_randomHEAD = selectRandom _headsLIST;
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black","empty"];

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_ESTDCU";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "rhsusf_hgu56p_visor_green";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_BoonieCOMS_ESTDCU";

_commonUNIFORM = selectRandom ["BRM_BattleUNI_ESTDCU","BRM_BattleUNIRS_ESTDCU"];
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BMR_MLBVARMOR_GREEN_RFL";
_officerVEST = "BMR_MLBVARMOR_GREEN_SL";
_ftlVEST = _officerVEST;
_slVEST = _officerVEST;
_mgVEST = "BMR_MLBV_GREEN_MG";
_grenadierVEST = "BMR_MLBV_GREEN_GL";
_medicVEST = "BMR_MLBV_GREEN_MED";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BRM_RRV_GREEN_REC1";
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_ESTDCU";
_bigBACKPACK = "BRM_PatrolBPH_ESTDCU";

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "empty") then {
        _unit addGoggles _randomGOGGLE;
    };
};

// MISC EQUIPMENT ==============================================================

_binoc = "rhsusf_bino_m24_ARD";
_rangefinder = "rhsusf_bino_lerca_1200_black";
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
/*  Anti Air Vehicles */ []
/*  Attack Helos      */,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited","UK3CB_BAF_Wildcat_AH1_CAS_6D"]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,["rhs_t72ba_tv","rhs_t72bb_tv"]
/*  Light Vehicles    */,["UK3CB_BAF_LandRover_Hard_FFR_Green_A","UK3CB_BAF_LandRover_Snatch_NI_A","UK3CB_BAF_LandRover_Soft_RAF_A"]
/*  Medium Vehicles   */,["rhsusf_CGRCAT1A2_M2_usmc_wd","rhs_bmp2d_vdv"]
/*  Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
/*  Transport Helos   */,["UK3CB_BAF_Merlin_HC3_24"]
/*  Transport Planes  */,["RHS_C130J", "RHS_C130J"]
/*  Transport Trucks  */,["UK3CB_BAF_MAN_HX60_Transport_Green"]
/*  Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["UK3CB_BAF_MAN_HX60_Repair_Green","UK3CB_BAF_MAN_HX60_Fuel_Green","UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsusf_CGRCAT1A2_M2_usmc_wd"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["CDF_WarfareBLightFactory"]
];
