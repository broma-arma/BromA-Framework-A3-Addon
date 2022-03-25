// INFO ========================================================================
/*
    ANZAC Forces
    Use BRM_FMK_UNIFORMS_AnzacCammo (DPCU or DPDU) to change camo.
*/

_factionID = "ANZAC";
_factionName = "ANZAC";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE, _faceBLACK];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_AnzacCammo
	"DPDU"
	"DPCU"
*/

_camo = "DPCU";


// WEAPONS =====================================================================

_commonRIFLE = _AUGA3;
_commonRIFLEGL = _AUGA3GL;
_commonPISTOL = _G17;
_commonAR = _HLCM249LGRIP;
_commonMG = ["rhs_weap_fnmag","hlc_100Rnd_762x51_M_M60E4"];
_commonMARKSMAN = _SR25;
_commonSNIPER = _AWM;
_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _AUGA2PARATAN;
_commonRCO = "FHQ_optic_ACOG";
_atRCO = "rhs_optic_maaws";
_commonCCO = "rksl_optic_eot552";
_commonMAGNIFIED = "hlc_optic_LeupoldM3A";
_commonSUPPRESSOR = "hlc_muzzle_556nato_m42000";
_commonPISTOLSUPPRESSOR = "rhsusf_acc_omega9k";
_NVG = "rhsusf_ANPVS_15";

_mgSCOPE = _commonCCO;
_rifleSCOPE = _commonCCO;

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
if(!isNil "BRM_FMK_UNIFORMS_AnzacCammo")then{_camo=BRM_FMK_UNIFORMS_AnzacCammo};

_headsLIST = [
    "BRM_ACH_MASK_"+_camo,
    "BRM_ACH_"+_camo,
    "BRM_ACH_COMS_"+_camo,
    "BRM_ACH_MASK_COMS_"+_camo
];

_uniformsLIST = [
    "BRM_BattleUNI_"+_camo,
    "BRM_BattleUNIRS_"+_camo
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomGOGGLES = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black","empty"];

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "UK3CB_BAF_H_Beret_SBS";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_ess";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_Booniehat_"+_camo;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_sniperUNIFORM = "U_B_FullGhillie_sard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST    = "BRM_Protec_"+_camo+"_RFL";
_officerVEST   = "BRM_Protec_"+_camo+"_SL";
_ftlVEST       = "BRM_Protec_"+_camo+"_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BRM_Protec_"+_camo+"_MG";
_grenadierVEST = "BRM_Protec_"+_camo+"_GL";
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "BRM_RRV_BROWN_REC1";
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_"+_camo;
_bigBACKPACK = _commonBACKPACK;
_reconBACKPACK = "BRM_PatrolBPH_"+_camo;

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLES != "empty") then {
        _unit addGoggles _randomGOGGLES
    };
};

// MISC EQUIPMENT ==============================================================

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

if(!isNil "BRM_FMK_UNIFORMS_AnzacCammo")then{_camo=BRM_FMK_UNIFORMS_AnzacCammo};

if (_camo == "des") then {

_factionVehicles = [
    /*  Anti Air Vehicles */	 []
    /*  Attack Helos      */	,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited","UK3CB_BAF_Wildcat_AH1_CAS_6D"]
    /*  Attack Planes     */	,[]
    /*  Heavy Vehicles    */	,[]
    /*  Light Vehicles    */	,["UK3CB_BAF_LandRover_Soft_Sand_A","UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A","rhsusf_M1078A1R_SOV_M2_D_fmtv_socom"]
    /*  Medium Vehicles   */	,["UK3CB_BAF_Jackal2_L111A1_D","UK3CB_BAF_Coyote_Logistics_L111A1_D","UK3CB_BAF_Panther_GPMG_Sand_A"]
    /*  Mobile Artillery  */	,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */	,["UK3CB_BAF_Merlin_HC4_18","UK3CB_BAF_Wildcat_AH1_TRN_8A"]
    /*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */	,["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom","UK3CB_BAF_MAN_HX58_Transport_Sand"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["UK3CB_BAF_MAN_HX60_Repair_Sand","UK3CB_BAF_MAN_HX60_Fuel_Sand","UK3CB_BAF_MAN_HX58_Cargo_Sand_B"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["UK3CB_BAF_Panther_GPMG_Sand_A"]
];

} else {

_factionVehicles = [
    /*  Anti Air Vehicles */	 []
    /*  Attack Helos      */	,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited","UK3CB_BAF_Wildcat_AH1_CAS_6D"]
    /*  Attack Planes     */	,[]
    /*  Heavy Vehicles    */	,[]
    /*  Light Vehicles    */	,["UK3CB_BAF_LandRover_Soft_Green_A","UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A"]
    /*  Medium Vehicles   */	,["UK3CB_BAF_Jackal2_L111A1_D","UK3CB_BAF_Coyote_Logistics_L111A1_D","UK3CB_BAF_Panther_GPMG_Green_A"]
    /*  Mobile Artillery  */	,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */	,["UK3CB_BAF_Merlin_HC4_18","UK3CB_BAF_Wildcat_AH1_TRN_8A"]
    /*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */	,["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom","UK3CB_BAF_MAN_HX58_Transport_Green"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["UK3CB_BAF_MAN_HX60_Repair_Green","UK3CB_BAF_MAN_HX60_Fuel_Green","UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["UK3CB_BAF_Panther_GPMG_Green_A"]
];



};




// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_australia",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_HBarrierWall4_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];


// =============================================================================
