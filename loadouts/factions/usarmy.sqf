/*
    The United States Army (USA), officially designated as the "Army of the United States" is the largest branch of the
	United States Armed Forces with the primary task of performing land-based military operations in armed conflict and
	peacetime operations.

    Camo: "ucp", "ocp" (BRM_FMK_LoadoutCamo_USARMY)
*/

_factionID = "USARMY";
_factionName = "United States Army";
_factionStructure = "US";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite, _faceBlack];
_defaultName = [_nameAmerican];
_defaultInsignia = "USP_PATCH_USA_TAB_RANGER_1BN_UCP";
_defaultColor = "blue";

// CAMO ========================================================================
// BRM_FMK_UNIFORMS_USArmyCammo - Backward compatibility (royal_co26_liberators_v2.Malden)
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_USARMY", missionNamespace getVariable ["BRM_FMK_UNIFORMS_USArmyCammo", "ucp"]];

// WEAPONS =====================================================================
_commonRifle = _RHSM4;
_commonRifleGL = _RHSM4GL203;
_reconRifle = ["rhs_weap_mk17_CQC", "rhs_mag_20Rnd_SCAR_762x51_m80_ball"];
_commonAR = _M249S;
_commonMG = _M240B;
_commonMarksman = _M14EBR;
_commonSniper = _M200;
_commonSMG = _RHSM4;

_commonPistol = _M9;

_commonAT = _AT4;
_specAT = _SMAW;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "rhsusf_acc_ACOG3";
_commonCCO = "rhsusf_acc_compm4";
_commonEOT = "rhsusf_acc_eotech_552";

_rifleScope = _commonCCO;
_reconScope = "rhsusf_acc_su230_mrds_c";
_arScope = _commonEOT;
_marksmanScope = "hlc_optic_leupoldm3a";
_sniperScope = "optic_LRPS";

_specATScope = "rhs_weap_optic_smaw";

_commonSuppressor = "rhsusf_acc_nt4_black";
_commonPistolSuppressor = "";

_commonRail = "rhsusf_acc_anpeq15side_bk";
_commonBipod = "rhsusf_acc_tdstubby_blk";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 5;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 15;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_shemagh_gogg_od", "rhsusf_shemagh_od", ""];

_commonHead = selectRandom ["rhsusf_ach_helmet_"+_camo, "rhsusf_ach_helmet_ESS_"+_camo, "rhsusf_ach_helmet_headset_"+_camo];
_leaderHead = "rhsusf_ach_helmet_headset_ess_"+_camo;
_officerHead = "rhsusf_patrolcap_"+_camo;
_medicHead = _commonHead;
_crewmanHead = selectRandom ["rhsusf_cvc_ess", "rhsusf_cvc_alt_helmet"];
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor";
_helipilotHead = "rhsusf_hgu56p_visor";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = selectRandom ["rhsusf_opscore_ut_pelt", "rhsusf_opscore_ut_pelt_cam", "rhsusf_opscore_ut_pelt_nsw"];

_commonUniform = "rhs_uniform_cu_"+_camo;
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_sniperUniform = "U_B_FullGhillie_sard";
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "rhsusf_iotv_"+_camo+"_Rifleman";
_officerVest = "rhsusf_iotv_"+_camo+"_Squadleader";
_ftlVest = "rhsusf_iotv_"+_camo+"_Squadleader";
_slVest = "rhsusf_iotv_"+_camo+"_Squadleader";
_mgVest = _commonVest;
_grenadierVest = "rhsusf_iotv_"+_camo+"_Grenadier";
_medicVest = "rhsusf_iotv_"+_camo+"_Medic";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "rhsusf_spcs_"+_camo+"_teamleader";
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "rhsusf_assault_eagleaiii_"+_camo;
_bigBackpack = "rhsusf_assault_eagleaiii_"+_camo;
_reconBackpack = "UK3CB_B_Backpack_Pocket";

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman || _isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT =============================================================
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
if (_camo == "ucp") then {
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
} else {
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
};

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_US_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
