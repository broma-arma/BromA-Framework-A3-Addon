/*
    Swedish Armed Forces

    Camo: "m90w", "m90d" (BRM_FMK_LoadoutCamo_SWEDEN)
*/

_factionID = "SWEDEN";
_factionName = "Swedish Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_SWEDEN", "m90w"];

// WEAPONS =====================================================================
_commonRifle = ["sfp_ak5c", "rhs_mag_30Rnd_556x45_M855A1_PMAG"];
_commonRifleGL = ["sfp_ak5c_m203", "30Rnd_556x45_Stanag", "rhs_mag_M433_HEDP"];
_commonAR = ["rhs_weap_m249", "rhsusf_100Rnd_556x45_M855_soft_pouch"];
_commonMG = ["r3f_fn_mag58", "rhsusf_100Rnd_762x51"];
_commonMarksman = _commonRifle;
_commonSniper = ["hlc_rifle_awcovert", "hlc_5rnd_300WM_FMJ_AWM"];
_commonSMG = _MP5A5;

_commonPistol = ["R3F_G17", "R3F_17Rnd_9x19_G17"];

_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "rhsusf_acc_acog_rmr";
_commonCCO = "rhsusf_acc_compm4";

_rifleScope = "rhsusf_acc_compm4";
_sniperScope = "rksl_optic_pmii_525_des";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "hlc_muzzle_556nato_rotexiiic_grey";
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
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom [
	"BRM_LWH_"+_camo,
	"BRM_LWH_COMS_"+_camo,
	"BRM_LWH_COMS_GHILLIE_"+_camo
];
_leaderHead = _commonHead;
_officerHead = "rhs_beret_milp";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_alt_helmet";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = ["rhsusf_opscore_ut_pelt_nsw_cam", "rhsusf_opscore_rg_cover_pelt"] select (_camo == "m90w");

_commonUniform = selectRandom [
	"BRM_BattleUNI_"+_camo,
	"BRM_BattleUNIRS_"+_camo
];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["BRM_RRV_BROWN_RFL", "BRM_RRV_GREEN_RFL"] select (_camo == "m90w");
_officerVest = ["BRM_RRV_BROWN_RECLEAD", "BRM_RRV_GREEN_RECLEAD"] select (_camo == "m90w");
_ftlVest = _officerVest;
_slVest = _ftlVest;
_mgVest = ["BRM_RRV_BROWN_MG", "BRM_RRV_GREEN_MG"] select (_camo == "m90w");
_grenadierVest = _commonVest;
_medicVest = ["BRM_RRV_BROWN_RECMED", "BRM_RRV_GREEN_RECMED"] select (_camo == "m90w");
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_"+_camo;
_bigBackpack = "BRM_PatrolBPH_"+_camo;

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT =============================================================
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
/* Anti Air Vehicles */ ["sfp_lvkv90c"]
/* Attack Helos      */,[]
/* Attack Planes     */,["UK3CB_AAF_B_Gripen_G"]
/* Heavy Vehicles    */,["sfp_strv122b", "sfp_strv122", "sfp_strv122_snow"]
/* Light Vehicles    */,["sfp_bv206"]
/* Medium Vehicles   */,["sfp_strf90c", "sfp_strf90c_snow"]
/* Mobile Artillery  */,["sfp_grkpbv90120"]
/* Transport Helos   */,[]
/* Transport Planes  */,[]
/* Transport Trucks  */,[]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,[]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,[]
/* Support           */,["UK3CB_BAF_MAN_HX58_Repair_Green", "UK3CB_BAF_MAN_HX58_Fuel_Green", "UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
/* Submarines        */,[]
/* MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_sweden"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
