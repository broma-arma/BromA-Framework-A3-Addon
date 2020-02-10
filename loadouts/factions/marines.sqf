// INFO ========================================================================
/*

   The United States Marine Corps (USMC) is a branch of the United States Armed Forces responsible for providing power projection
   from the sea, using the mobility of the U.S. Navy to rapidly deliver combined-arms task forces.

*/

_factionID = "MARINES";
_factionName = "United States Marine Corps";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE, _faceBLACK];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "USP_PATCH_USA_USMC";
_defaultColor = "blue";

// Set in missio with: BRM_FMK_UNIFORMS_MarinesWoodland
_enableWoodlandCammo = true;

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _RHSM16A4;
_commonRIFLEGL = _RHSM16A4GL;
_commonPISTOL = _M9;
_commonAR = _M249S;
_commonMG = _M240B;
_commonMARKSMAN = _M14EBR;
_commonSNIPER = _M200;
_commonAT = _AT4;
_specAT = _SMAW;
_commonSMG = _RHSM4;
_commonRCO = "rhsusf_acc_ACOG_USMC";
_commonCCO = "rhsusf_acc_eotech_552";
_commonMAGNIFIED = "optic_LRPS";
_commonSUPPRESSOR = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

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
if(!isNil"BRM_FMK_UNIFORMS_MarinesWoodland")then{_enableWoodlandCammo=BRM_FMK_UNIFORMS_MarinesWoodland};
_lp="d";_camo="ucp"; if(_enableWoodlandCammo)then{_lp ="wd";_camo="ocp"};

_headsLIST = [
	"rhsusf_lwh_helmet_marpat"+_lp,
	"rhsusf_lwh_helmet_marpat"+_lp+"_headset",
	"rhsusf_lwh_helmet_marpat"+_lp+"_ess"
];

_goggleLIST = [
    "rhs_googles_black",
    "empty"
];

_randomHEAD = selectRandom _headsLIST;
_randomGOGGLE = selectRandom _goggleLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = "rhsusf_lwh_helmet_marpat"+_lp+"_headset";
_officerHEAD = "rhs_8point_marpat"+_lp;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhs_booniehat2_marpat"+_lp;

_commonUNIFORM = "rhs_uniform_FROG01_"+_lp;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "U_B_HeliPilotCoveralls";
_sniperUNIFORM = "U_B_FullGhillie_lsh";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_B_HeliPilotCoveralls";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhsusf_spc_rifleman";
_officerVEST = "rhsusf_spc_light";
_ftlVEST = "rhsusf_spc_teamleader";
_slVEST = "rhsusf_spc_squadleader";
_mgVEST = "rhsusf_spc_mg";
_grenadierVEST = _commonVEST;
_medicVEST = "rhsusf_spc_corpsman";
_demoVEST = _commonVEST;
_marksmanVEST = "rhsusf_spc_marksman";
_reconVEST = "rhsusf_spc_rifleman";

_commonBACKPACK = "rhsusf_assault_eagleaiii_coy";
_bigBACKPACK = "rhsusf_assault_eagleaiii_coy";

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

if (!_enableWoodlandCammo) then {
    _factionVehicles = [
    /*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6"]
    /*  Attack Helos      */	,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
    /*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */	,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
    /*  Light Vehicles    */	,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
    /*  Medium Vehicles   */	,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
    /*  Mobile Artillery  */	,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */	,["RHS_CH_47F_10", "RHS_CH_47F_light", "rhsusf_CH53E_USMC_D", "RHS_UH1Y_FFAR_D", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
    /*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */	,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M977A4_AMMO_BKIT_usarmy_d", "B_Truck_01_fuel_F"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
    ];
} else {
    _factionVehicles = [
    /*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
    /*  Attack Helos      */	,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
    /*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */	,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
    /*  Light Vehicles    */	,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
    /*  Medium Vehicles   */	,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
    /*  Mobile Artillery  */	,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
    /*  Transport Helos   */	,["RHS_CH_47F_10", "RHS_CH_47F_light", "rhsusf_CH53E_USMC", "RHS_UH1Y_FFAR", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
    /*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */	,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_rg33_w", "rhsusf_rg33_m2_w", "rhsusf_M1117_W"]
    ];
};

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_US_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_HBarrierWall4_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
