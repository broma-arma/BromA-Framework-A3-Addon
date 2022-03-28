// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "USARMY80";
_factionName = "United States Army";
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

// TYPE/CAMMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_US80cammo
    "wdl"
    "des"
*/

_camo = "wdl";

// WEAPONS =====================================================================

_commonRIFLE = _HLCM16A2;
_commonRIFLEGL = _HLCM16A2GL;
_commonPISTOL = _M1911;
_commonAR = ["rhs_weap_m249","rhsusf_200rnd_556x45_M855_box"];
_commonMG = _M240B;
_commonMARKSMAN = ["UK3CB_M14DMR","rhsusf_20Rnd_762x51_m80_Mag"];
_commonSNIPER = ["rhs_weap_m24sws_wd","rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_specATSCOPE = "rhs_optic_maaws";
_commonSMG = ["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"];
_commonRCO = "";
_marksmanSCOPE = "uk3cb_optic_artel_m14";
_commonCCO = "";
_commonMAGNIFIED = "rhsusf_acc_m8541_wd";
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_reconRIFLE = ["hlc_wp_mod727","hlc_30rnd_556x45_EPR"];
_reconSCOPE = "r3f_comp_m5";

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

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================
if(!isNil "BRM_FMK_UNIFORMS_US80cammo")then{_camo=BRM_FMK_UNIFORMS_US80cammo};

_commonHEAD = selectRandom ["UK3CB_CW_US_B_LATE_H_PASGT_02_WDL","UK3CB_CW_US_B_LATE_H_PASGT_01_WDL"];
_leaderHEAD = _commonHEAD;
_officerHEAD = "UK3CB_CW_US_B_LATE_H_JNR_OFF_Patrol_Cap_WDL_01";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "BRM_SPH4V_GREEN";
_helicrewHEAD = "BRM_SPH4V_GREEN";
_helipilotHEAD = "BRM_SPH4V_GREEN";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_Beanie_Green";

_commonUNIFORM = "UK3CB_CW_US_B_LATE_U_CombatUniform_03_WDL";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk2";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk2";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest";
_officerVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_ftlVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_slVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_mgVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_grenadierVEST = _commonVEST;
_medicVEST = "UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_SqBackpack_Green";
_bigBACKPACK = "BRM_SqBpH_Green";
_reconBACKPACK = "BRM_SqBpH_Green";

if (_camo == "des") then {
    _commonHEAD = selectRandom ["BRM_PASGT_NVSWDG_DCU","BRM_PASGT_NV_DCU"];
    _leaderHEAD = _commonHEAD;
    _officerHEAD = "BRM_PatrolCap_DCU";
    _medicHEAD = _commonHEAD;
    _crewmanHEAD = "H_HelmetCrew_I";
    _pilotHEAD = "BRM_SPH4V_BLACK";
    _helicrewHEAD = "BRM_SPH4V_BLACK";
    _helipilotHEAD = "BRM_SPH4V_BLACK";
    _sniperHEAD = _commonHEAD;
    _demoHEAD = _commonHEAD;
    _reconHEAD = "rhsusf_protech_helmet_ess";

    _commonUNIFORM = selectRandom ["BRM_BattleUNI_DCU","BRM_BattleUNIRS_DCU"];
    _officerUNIFORM = _commonUNIFORM;
    _pilotUNIFORM = "TRYK_OVERALL_nok_flesh";
    _sniperUNIFORM = "U_B_FullGhillie_ard";
    _marksmanUNIFORM = _commonUNIFORM;
    _helicrewUNIFORM = "TRYK_OVERALL_nok_flesh";
    _crewUNIFORM = _commonUNIFORM;
    _mgUNIFORM = _commonUNIFORM;
    _medicUNIFORM = _commonUNIFORM;
    _demoUNIFORM = _commonUNIFORM;
    _reconUNIFORM = _commonUNIFORM;

    _commonVEST = "UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest";
    _officerVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
    _ftlVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
    _slVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
    _mgVEST = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
    _grenadierVEST = _commonVEST;
    _medicVEST = "UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest";
    _demoVEST = _commonVEST;
    _marksmanVEST = _commonVEST;
    _reconVEST = _commonVEST;
    _pilotVEST = "UK3CB_V_Pilot_Vest_Black";

    _commonBACKPACK = "BRM_SqBackpack_Brown";
    _bigBACKPACK = "BRM_SqBpH_Brown";
    _reconBACKPACK = "BRM_SqBpH_Brown";
};

// MISC EQUIPMENT =============================================================

_binoc = "rhsusf_bino_m24";
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

if (_camo == "wdl") then {
    _factionVehicles = [
    /*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
    /*  Attack Helos      */	,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
    /*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */	,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
    /*  Light Vehicles    */	,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
    /*  Medium Vehicles   */	,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
    /*  Mobile Artillery  */	,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
    /*  Transport Helos   */	,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
    /*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
    /*  Transport Trucks  */	,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
    ];
} else {
    _factionVehicles = [
    /*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6"]
    /*  Attack Helos      */	,["RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
    /*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
    /*  Heavy Vehicles    */	,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
    /*  Light Vehicles    */	,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
    /*  Medium Vehicles   */	,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
    /*  Mobile Artillery  */	,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
    /*  Transport Helos   */	,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
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
};
// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_US_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================