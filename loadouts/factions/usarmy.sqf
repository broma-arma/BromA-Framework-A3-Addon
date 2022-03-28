// INFO ========================================================================
/*
    The United States Army (USA), officially designated as the "Army of the United States" is the largest branch of the
	United States Armed Forces with the primary task of performing land-based military operations in armed conflict and
	peacetime operations.
*/

_factionID = "USARMY";
_factionName = "United States Army";
_factionStructure = "US_STRUCTURE";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE, _faceBLACK];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "USP_PATCH_USA_TAB_RANGER_1BN_UCP";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_USArmyCammo
	"ucp"
	"ocp"
*/

_camo = "ucp";

// WEAPONS =====================================================================

_commonRIFLE = _RHSM4;
_reconRIFLE = ["rhs_weap_mk17_CQC","rhs_mag_20Rnd_SCAR_762x51_m80_ball"];
_commonRIFLEGL = _RHSM4GL203;
_commonPISTOL = _M9;
_commonAR = _M249S;
_commonMG = _M240B;
_commonMARKSMAN = _M14EBR;
_commonSNIPER = _M200;
_commonAT = _AT4;
_specAT = _SMAW;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _RHSM4;
_commonRCO = "rhsusf_acc_ACOG3";
_marksmanSCOPE = "hlc_optic_leupoldm3a";
_specATSCOPE = "rhs_weap_optic_smaw";
_commonCCO = "rhsusf_acc_compm4";
_commonEOT = "rhsusf_acc_eotech_552";
_commonRAIL = "rhsusf_acc_anpeq15side_bk";
_commonBIPOD = "rhsusf_acc_tdstubby_blk";
_commonMAGNIFIED = "optic_LRPS";
_commonSUPPRESSOR = "r3f_silencieux_hk417";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_mgSCOPE = _commonEOT;
_rifleSCOPE = _commonCCO;
_reconSCOPE = "rhsusf_acc_su230_mrds_c";

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
if(!isNil "BRM_FMK_UNIFORMS_USArmyCammo")then{_camo=BRM_FMK_UNIFORMS_USArmyCammo};

_headsLIST = [
    "rhsusf_ach_helmet_"+_camo,
    "rhsusf_ach_helmet_ESS_"+_camo,
    "rhsusf_ach_helmet_headset_"+_camo
];

_vestsLIST = [
    "rhsusf_iotv_"+_camo+"_SAW",
    "rhsusf_iotv_"+_camo+"_Rifleman"
];

_randomHEAD = selectRandom _headsLIST;
_randomVEST = selectRandom _vestsLIST;
_randomGOGGLE = selectRandom ["rhsusf_shemagh_gogg_od","rhsusf_shemagh_od","empty"];

_commonHEAD = _randomHEAD;
_leaderHEAD = "rhsusf_ach_helmet_headset_ess_"+_camo;
_officerHEAD = "rhsusf_patrolcap_"+_camo;
_medicHEAD = _commonHEAD;
_crewmanHEAD = selectRandom["rhsusf_cvc_ess","rhsusf_cvc_alt_helmet"];
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor";
_helipilotHEAD = "rhsusf_hgu56p_visor";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = selectRandom [
    "rhsusf_opscore_ut_pelt",
    "rhsusf_opscore_ut_pelt_cam",
    "rhsusf_opscore_ut_pelt_nsw"
];

_commonUNIFORM = "rhs_uniform_cu_"+_camo;
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

_commonVEST = "rhsusf_iotv_"+_camo+"_Rifleman";
_officerVEST = "rhsusf_iotv_"+_camo+"_Squadleader";
_ftlVEST = "rhsusf_iotv_"+_camo+"_Squadleader";
_slVEST = "rhsusf_iotv_"+_camo+"_Squadleader";
_mgVEST = _commonVEST;
_grenadierVEST = "rhsusf_iotv_"+_camo+"_Grenadier";
_medicVEST = "rhsusf_iotv_"+_camo+"_Medic";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "rhsusf_spcs_"+_camo+"_teamleader";
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "rhsusf_assault_eagleaiii_"+_camo;
_bigBACKPACK = "rhsusf_assault_eagleaiii_"+_camo;
_reconBACKPACK = "UK3CB_B_Backpack_Pocket";

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

if (_camo == "ucp") then {
    _factionVehicles = [
    /*  Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6"]
    /*  Attack Helos      */,["RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
    /*  Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
    /*  Light Vehicles    */,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
    /*  Medium Vehicles   */,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
    /*  Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
    /*  Transport Planes  */,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
    /*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */,["rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M977A4_AMMO_BKIT_usarmy_d", "B_Truck_01_fuel_F"]
    /*  Submarines        */,["B_SDV_01_F"]
    /*  MRAP Vehicles     */,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
    ];
} else {
    _factionVehicles = [
    /*  Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
    /*  Attack Helos      */,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
    /*  Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
    /*  Light Vehicles    */,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
    /*  Medium Vehicles   */,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
    /*  Mobile Artillery  */,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
    /*  Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
    /*  Transport Planes  */,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
    /*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
    /*  Submarines        */,["B_SDV_01_F"]
    /*  MRAP Vehicles     */,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
    ];
};

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_US_F"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_HBarrierWall4_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
