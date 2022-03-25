// INFO ========================================================================
/*
    Finnish Armed Forces
*/

_factionID = "FINLAND";
_factionName = "FINNISH DEFENCE FORCE";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_FinnishCammo
	"frost"
	"sum"
*/

_camo = "sum";

// WEAPONS =====================================================================

_commonRIFLE = ["ffp_rk95","ffp_30Rnd_762x39"];
_commonRIFLEGL = _commonRIFLE;
_commonGL = ["r3f_M320","rhs_mag_M441_HE"];
_commonPISTOL = _P226WG;
_commonMG = ["PSZ_PKM","rhs_100Rnd_762x54mmR"];
_commonAR = _commonMG;
_commonMARKSMAN = _commonRIFLE;
_commonSNIPER = ["rhs_weap_m82a1","rhsusf_mag_10Rnd_STD_50BMG_mk211"];
_commonAT = _M72A7;
_specAT = _GUSTAV;
_commonSMG = _MP5A5;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonRCO = "rhsusf_acc_acog_usmc";
_atRCO = "rhs_optic_maaws";
_commonCCO = "r3f_comp_m5";
_commonMAGNIFIED = "hlc_optic_LeupoldM3A";
_commonSUPPRESSOR = "r3f_silencieux_hk417";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_rifleSCOPE = _commonCCO;
_specRIFLE = ["rhs_weap_SCARH_CQC","rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"];
_specSCOPE = "rhsusf_acc_acog_rmr";

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

if(!isNil "BRM_FMK_UNIFORMS_FinnishCammo")then{_camo=BRM_FMK_UNIFORMS_FinnishCammo};

_headsLIST = [
    "BRM_ACH_FM05"+_camo,
    "BRM_ACH_MASK_FM05"+_camo
];

if (_camo == "sum") then {_headLIST pushBack "BRM_ACH_GHILLIE_COMS_FM05"+_camo};

_randomHEAD = selectRandom _headsLIST;
_randomGOGGLES = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black","empty"];

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "rhs_beret_milp";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "rhsusf_hgu56p_visor_green";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = selectRandom ["rhsusf_opscore_fg_pelt","rhsusf_opscore_fg_pelt_cam"];

_commonUNIFORM = "BRM_BattleUNI_FM05"+_camo;
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

_commonVEST    = "BRM_Protec_GREEN_RFL";
_officerVEST   = "BRM_Protec_GREEN_SL";
_ftlVEST       = "BRM_Protec_GREEN_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BRM_Protec_GREEN_MG";
_grenadierVEST = "BRM_Protec_GREEN_GL";
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "BRM_RRV_GREEN_REC1";
_pilotVEST     = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_FM05"+_camo;
_bigBACKPACK = "BRM_PatrolBP_FM05"+_camo;
_medicalBACKPACK = _commonBACKPACK;
_atBACKPACK = _commonBACKPACK;
_reconBACKPACK = "BRM_PatrolBPH_Green";

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLES != "empty") then {
        _unit addGoggles _randomGOGGLES
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
    /*  Anti Air Vehicles */	 []
    /*  Attack Helos      */	,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited","UK3CB_BAF_Wildcat_AH1_CAS_6D"]
    /*  Attack Planes     */	,[]
    /*  Heavy Vehicles    */	,["rhs_t72ba_tv","rhs_t72bb_tv"]
    /*  Light Vehicles    */	,["UK3CB_BAF_LandRover_Hard_FFR_Green_A","UK3CB_BAF_LandRover_Snatch_NI_A","UK3CB_BAF_LandRover_Soft_RAF_A"]
    /*  Medium Vehicles   */	,["rhsusf_CGRCAT1A2_M2_usmc_wd","rhs_bmp2d_vdv"]
    /*  Mobile Artillery  */	,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */	,["UK3CB_BAF_Merlin_HC3_24"]
    /*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */	,["UK3CB_BAF_MAN_HX60_Transport_Green"]
    /*  Static Defence    */	,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["UK3CB_BAF_MAN_HX60_Repair_Green","UK3CB_BAF_MAN_HX60_Fuel_Green","UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_CGRCAT1A2_M2_usmc_wd"]
];






// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["CDF_WarfareBLightFactory"]
];


// =============================================================================
