/*
    South korean army loadout.

    Camo: "GRANITE", "ROKMC", "DESERT" (BRM_FMK_LoadoutCamo_ROKA)
*/

_factionID = "ROKA";
_factionName = "ROK Army";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceAsian];
_defaultName = [_nameAmerican];
_defaultInsignia = "USP_PATCH_ROK_ARMY_9INF_DIV";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_ROKA", "GRANITE"];
_lp = ["GraniteB", ["ROKMC", "MARPATD"] select (_camo == "DESERT")] select (_camo != "GRANITE"); // Loadout Pattern
_rhp = ["fg", "paint"] select (_camo == "DESERT"); // Recon Head Pattern

// WEAPONS =====================================================================
_commonRifle = ["BRM_K2", "rhs_mag_30Rnd_556x45_M855_Stanag"];
_commonRifleGL = ["BRM_K2GL", "rhs_mag_30Rnd_556x45_M855_Stanag", "1Rnd_HE_Grenade_shell"];
_reconRifle = ["BRM_K2C1", "rhs_mag_30Rnd_556x45_M855_Stanag"];
_commonAR = _FNMINIMIRIS;
_commonMG = ["rhs_weap_minimi_para_railed", "rhsusf_100Rnd_556x45_soft_pouch"];
_commonMarksman = _DMRRIS;
_commonSniper = _DMRRIS;
_commonSMG = _RHSM4;

_commonPistol = _P228;

_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "BRM_K2CS";
_commonCCO = "BRM_K2CQS";
_commonEOT = "rhsusf_acc_eotech_552";

_rifleScope = _commonCCO;
_reconScope = "rhsusf_acc_acog_rmr";
_arScope = _commonEOT;
_marksmanScope = "rhsusf_acc_m8541_mrds";
_sniperScope = "rhsusf_acc_nxs_3515x50f1_h58";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_rotex5_grey";
_commonPistolSuppressor = "";

_commonRail = "rhsusf_acc_anpeq15side_bk";
_commonBipod = "";

// AMMO COUNT ==================================================================
_countRifle = 13;
_countRifleLow = 6;
_countAR = 5;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 15;
_countPistol = 3;
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
_randomGOGGLE = selectRandom ["rhs_googles_black", "rhsusf_oakley_goggles_clr", ""];

_commonHead = selectRandom [
	"BRM_LWH_"+_lp,
	"BRM_LWH_COMS_"+_lp,
	"BRM_LWH_COMS_GHILLIE_"+_lp,
	"BRM_LWH_MASK_"+_lp,
	"BRM_LWH_MASK_COMS_"+_lp,
	"BRM_LWH_GHILLIE_"+_lp
];
_leaderHead = _commonHead;
_officerHead = "BRM_beret_green";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_ess";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = selectRandom [
	"rhsusf_opscore_"+_rhp+"_pelt",
	"rhsusf_opscore_"+_rhp+(["_pelt_cam", "_pelt_nsw_cam"] select (_camo == "DESERT")),
	"rhsusf_opscore_"+_rhp+"_pelt_nsw"
];

_commonUniform = selectRandom ["BRM_BattleUNI_"+_lp, "BRM_BattleUNIRS_"+_lp];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = ["U_I_FullGhillie_lsh", "U_I_FullGhillie_ard"] select (_camo == "DESERT");
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = "U_Simc_OG107_mk3_tuck_nomex_blench";
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["BRM_Protec_"+_lp+"_RFL", "BRM_LBT_AOR1_RFL"] select (_camo == "DESERT");
_officerVest = _commonVest;
_ftlVest = ["BRM_Protec_"+_lp+"_TL", "BRM_LBT_AOR1_TL"] select (_camo == "DESERT");
_slVest = ["BRM_Protec_"+_lp+"_SL", "BRM_LBT_AOR1_SL"] select (_camo == "DESERT");
_mgVest = ["BRM_Protec_"+_lp+"_MG", "BRM_LBT_AOR1_MG"] select (_camo == "DESERT");
_grenadierVest = ["BRM_Protec_"+_lp+"_GL", "BRM_LBT_AOR1_GL"] select (_camo == "DESERT");
_medicVest = [_commonVest, "BRM_LBT_AOR1_MED"] select (_camo == "DESERT");
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "BMR_MLBV_GraniteB_RFL";

_commonBackpack = "BRM_PatrolBP_GraniteB";
_bigBackpack = "BRM_LRRBP_Green";
_reconBackpack = "B_Carryall_mcamo";

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman || _isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT =============================================================
_rangefinder = "rhsusf_bino_lrf_Vector21";
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
/* Anti Air Vehicles */ ["RHS_M6_wd"]
/* Attack Helos      */,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd"]
/* Attack Planes     */,["JS_JC_FA18E", "CUP_B_F35B_USMC"]
/* Heavy Vehicles    */,["UK3CB_CW_US_B_LATE_M1A1", "UK3CB_LDF_B_Leopard_Cage_Camo"]
/* Light Vehicles    */,["rhs_tigr_msv", "rhs_tigr_m_msv"]
/* Medium Vehicles   */,["UK3CB_LDF_B_Marshall_Camo", "UK3CB_LDF_B_Marshall"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy"]
/* Transport Helos   */,["RHS_MELB_MH6M", "RHS_MELB_H6M", "UK3CB_CW_US_B_LATE_UH60M"]
/* Transport Planes  */,["RHS_C130J"]
/* Transport Trucks  */,["UK3CB_CW_US_B_LATE_M939_Guntruck", "UK3CB_CW_US_B_LATE_M939"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["UK3CB_CW_US_B_LATE_M113_M2", "UK3CB_CW_US_B_LATE_M113_MK19"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_ROK"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
