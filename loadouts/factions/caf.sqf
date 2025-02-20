/*
    Unified military of Canada.

    Camo: "CADPATD", "CADPATW" (BRM_FMK_LoadoutCamo_CAF)
*/

_factionID = "CAF";
_factionName = "Canada armed forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite, _faceBlack, _faceAsian];
_defaultName = [_nameAmerican];
_defaultInsignia = "USP_PATCH_CAN_BASE";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_CAF", "CADPATW"];

// WEAPONS =====================================================================
_commonRifle = ["tfc_w_c7a2", "rhs_mag_30Rnd_556x45_M855A1_Stanag"];
_commonRifleGL = ["tfc_w_c7a2_m203", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_M441_HE"];
_commonAR = ["tfc_w_c9a2", "rhsusf_200rnd_556x45_M855_mixed_box"];
_commonMG = ["UK3CB_BAF_L7A2", "UK3CB_BAF_762_100Rnd_T"];
_commonMarksman = ["hlc_rifle_samr2", "hlc_30rnd_556x45_EPR"];
_commonSniper = ["R3F_TAC50", "R3F_5Rnd_127x99_TAC50"];
_commonSMG = _MP5A5;

_commonPistol = ["UK3CB_BHP", "UK3CB_BHP_9_13Rnd"];

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "tfc_wa_c79_elcan";
_commonCCO = "rhsusf_acc_eotech_552_wd";

_rifleScope = "rhsusf_acc_eotech_552_wd";
_arScope = "rhsusf_acc_eotech_552_wd";
_marksmanScope = "rhsusf_acc_m8541";
_sniperScope = "rksl_optic_pmii_525_des";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_nt4_black";
_commonPistolSuppressor = "";

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
_countCAT = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom [
	"BRM_LWH_"+_camo, "BRM_LWH_COMS_"+_camo,
	"BRM_LWH_MASK_"+_camo, "BRM_LWH_MASK_COMS_"+_camo,
	"BRM_LWH_GHILLIE_"+_camo, "BRM_LWH_COMS_GHILLIE_"+_camo
];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_"+_camo;
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_ess";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_BoonieCOMS_"+_camo;

_commonUniform = selectRandom ["BRM_BattleUNI_"+_camo, "BRM_BattleUNIRS_"+_camo];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = "U_B_T_FullGhillie_tna_F";
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_Protec_"+_camo+"_RFL";
_officerVest = "BRM_Protec_"+_camo+"_SL";
_ftlVest = "BRM_Protec_"+_camo+"_TL";
_slVest = _officerVest;
_mgVest = "BRM_Protec_"+_camo+"_MG";
_grenadierVest = "BRM_Protec_"+_camo+"_GL";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "BRM_LBT_GREEN_RFL";
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_"+_camo;
_bigBackpack = "BRM_PatrolBP_"+_camo;
_reconBackpack = "BRM_PatrolBPH_"+_camo;

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT ==============================================================
_rangefinder = "rhsusf_bino_lerca_1200_black";
_laserdesignator = "UK3CB_BAF_Soflam_Laserdesignator";
_NVG = "rhsusf_ANPVS_14";

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
_factionVehicles = [
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
/* Attack Helos      */,["RHS_AH64D_wd", "TFC_CH146444_dynamicLoadout_F"]
/* Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/* Heavy Vehicles    */,["ffaa_et_leopardo"]
/* Light Vehicles    */,["TFC_vs_luvw_F", "rhsusf_m966_w", "rhsusf_m1151_m2_v1_usarmy_wd", "rhsusf_m1151_mk19_v1_usarmy_wd"]
/* Medium Vehicles   */,["UK3CB_CW_US_B_LATE_LAV25"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy"]
/* Transport Helos   */,["TFC_CH146402_unarmed_F"]
/* Transport Planes  */,["RHS_C130J"]
/* Transport Trucks  */,["C_TFC_VS_LSVW_transport_covered_F", "C_TFC_VS_LSVW_transport_uncovered_F"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_m113_usarmy_M2_90", "rhsusf_m113_usarmy_MK19", "rhsusf_M1117_D"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_canada"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
