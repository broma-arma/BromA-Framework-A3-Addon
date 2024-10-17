/*
    1980/90s US Army

    Camo: "wdl", "des" (BRM_FMK_LoadoutCamo_USARMY80)
*/

_factionID = "USARMY80";
_factionName = "United States Army";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite, _faceBlack];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_USARMY80", "wdl"];

// WEAPONS =====================================================================
_commonRifle = _HLCM16A2;
_commonRifleGL = _HLCM16A2GL;
_reconRifle = ["hlc_wp_mod727", "hlc_30rnd_556x45_EPR"];
_commonAR = ["rhs_weap_m249", "rhsusf_200rnd_556x45_M855_box"];
_commonMG = _M240B;
_commonMarksman = ["UK3CB_M14DMR", "rhsusf_20Rnd_762x51_m80_Mag"];
_commonSniper = ["rhs_weap_m24sws_wd", "rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonSMG = ["rhs_weap_m3a1", "rhsgref_30rnd_1143x23_M1911B_SMG"];

_commonPistol = _M1911;

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "";
_commonCCO = "";

_reconScope = "r3f_comp_m5";
_marksmanScope = "uk3cb_optic_artel_m14";
_sniperScope = "rhsusf_acc_m8541_wd";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 7;
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
_countCAT = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom ([
	["UK3CB_CW_US_B_LATE_H_PASGT_02_WDL", "UK3CB_CW_US_B_LATE_H_PASGT_01_WDL"],
	["BRM_PASGT_NVSWDG_DCU", "BRM_PASGT_NV_DCU"]
] select (_camo == "des"));
_leaderHead = _commonHead;
_officerHead = ["UK3CB_CW_US_B_LATE_H_JNR_OFF_Patrol_Cap_WDL_01", "BRM_PatrolCap_DCU"] select (_camo == "des");
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = ["BRM_SPH4V_GREEN", "BRM_SPH4V_BLACK"] select (_camo == "des");
_helicrewHead = ["BRM_SPH4V_GREEN", "BRM_SPH4V_BLACK"] select (_camo == "des");
_helipilotHead = ["BRM_SPH4V_GREEN", "BRM_SPH4V_BLACK"] select (_camo == "des");
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = ["BRM_Beanie_Green", "rhsusf_protech_helmet_ess"] select (_camo == "des");

_commonUniform = ["UK3CB_CW_US_B_LATE_U_CombatUniform_03_WDL", selectRandom ["BRM_BattleUNI_DCU", "BRM_BattleUNIRS_DCU"]] select (_camo == "des");
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_sniperUniform = ["U_B_T_FullGhillie_tna_F", "U_B_FullGhillie_ard"] select (_camo == "des");
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "UK3CB_CW_US_B_LATE_V_PASGT_Rif_Vest";
_officerVest = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_ftlVest = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_slVest = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_mgVest = "UK3CB_CW_US_B_LATE_V_PASGT_MG_Vest";
_grenadierVest = _commonVest;
_medicVest = "UK3CB_CW_US_B_LATE_V_PASGT_Medic_Vest";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = ["UK3CB_V_Pilot_Vest", "UK3CB_V_Pilot_Vest_Black"] select (_camo == "des");

_commonBackpack = ["BRM_SqBackpack_Green", "BRM_SqBackpack_Brown"] select (_camo == "des");
_bigBackpack = ["BRM_SqBpH_Green", "BRM_SqBpH_Brown"] select (_camo == "des");
_reconBackpack = ["BRM_SqBpH_Green", "BRM_SqBpH_Brown"] select (_camo == "des");

// MISC EQUIPMENT =============================================================
_binocular = "rhsusf_bino_m24";
_rangefinder = "rhsusf_bino_lrf_Vector21";
_laserdesignator = "UK3CB_BAF_Soflam_Laserdesignator";
_NVG = "rhsusf_ANPVS_15";

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
if (_camo == "wdl") then {
	_factionVehicles = [
	/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
	/* Attack Helos      */,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
	/* Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
	/* Heavy Vehicles    */,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
	/* Light Vehicles    */,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
	/* Medium Vehicles   */,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
	/* Mobile Artillery  */,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
	/* Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
	/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
	/* Transport Trucks  */,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
	/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
	/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
	/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
	/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
	/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
	/* Submarines        */,["B_SDV_01_F"]
	/* MRAP Vehicles     */,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
	];
} else {
	_factionVehicles = [
	/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6"]
	/* Attack Helos      */,["RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
	/* Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
	/* Heavy Vehicles    */,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
	/* Light Vehicles    */,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
	/* Medium Vehicles   */,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
	/* Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
	/* Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
	/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
	/* Transport Trucks  */,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
	/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
	/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
	/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
	/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
	/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_d", "rhsusf_M977A4_AMMO_BKIT_usarmy_d", "B_Truck_01_fuel_F"]
	/* Submarines        */,["B_SDV_01_F"]
	/* MRAP Vehicles     */,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
	];
};

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_US_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
