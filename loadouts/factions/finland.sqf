/*
    Finnish Armed Forces

    Camo: "sum", "frost" (BRM_FMK_LoadoutCamo_FINLAND)
*/

_factionID = "FINLAND";
_factionName = "FINNISH DEFENCE FORCE";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_FINLAND", "sum"];

// WEAPONS =====================================================================
_commonRifle = ["ffp_rk95", "ffp_30Rnd_762x39"];
_commonRifleGL = _commonRifle;
_reconRifle = ["rhs_weap_SCARH_CQC", "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"];
_commonGL = ["rhs_weap_M320", "rhs_mag_M441_HE"];
_commonAR = ["rhs_weap_pkm", "rhs_100Rnd_762x54mmR"];
_commonMG = _commonAR;
_commonMarksman = _commonRifle;
_commonSniper = ["rhs_weap_m82a1", "rhsusf_mag_10Rnd_STD_50BMG_mk211"];
_commonSMG = _MP5A5;

_commonPistol = _P226WG;

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "rhsusf_acc_acog_usmc";
_commonCCO = "rhsusf_acc_compm4";

_rifleScope = _commonCCO;
_reconScope = "rhsusf_acc_acog_rmr";
_sniperScope = "rhsusf_acc_premier";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_aac_762sdn6_silencer";
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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_headsLIST = ["BRM_ACH_FM05"+_camo, "BRM_ACH_MASK_FM05"+_camo];
if (_camo == "sum") then { _headsLIST pushBack "BRM_ACH_GHILLIE_COMS_FM05SUM"; };
_commonHead = selectRandom _headsLIST;
_leaderHead = _commonHead;
_officerHead = "rhs_beret_milp";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "rhsusf_hgu56p_visor_green";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = selectRandom ["rhsusf_opscore_fg_pelt", "rhsusf_opscore_fg_pelt_cam"];

_commonUniform = "BRM_BattleUNI_FM05"+_camo;
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

_commonVest = "BRM_Protec_GREEN_RFL";
_officerVest = "BRM_Protec_GREEN_SL";
_ftlVest = "BRM_Protec_GREEN_TL";
_slVest = _officerVest;
_mgVest = "BRM_Protec_GREEN_MG";
_grenadierVest = "BRM_Protec_GREEN_GL";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "BRM_RRV_GREEN_REC1";
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_FM05"+_camo;
_bigBackpack = "BRM_PatrolBP_FM05"+_camo;
_medicalBackpack = _commonBackpack;
_specATBackpack = _commonBackpack;
_reconBackpack = "BRM_PatrolBPH_Green";

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT ==============================================================
_binocular = "rhsusf_bino_m24_ARD";
_rangefinder = "rhsusf_bino_lerca_1200_black";
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
_factionVehicles = [
/* Anti Air Vehicles */ []
/* Attack Helos      */,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited", "UK3CB_BAF_Wildcat_AH1_CAS_6D"]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,["rhs_t72ba_tv", "rhs_t72bb_tv"]
/* Light Vehicles    */,["UK3CB_BAF_LandRover_Hard_FFR_Green_A", "UK3CB_BAF_LandRover_Snatch_NI_A", "UK3CB_BAF_LandRover_Soft_RAF_A"]
/* Medium Vehicles   */,["rhsusf_CGRCAT1A2_M2_usmc_wd", "rhs_bmp2d_vdv"]
/* Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
/* Transport Helos   */,["UK3CB_BAF_Merlin_HC3_24"]
/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
/* Transport Trucks  */,["UK3CB_BAF_MAN_HX60_Transport_Green"]
/* Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["UK3CB_BAF_MAN_HX60_Repair_Green", "UK3CB_BAF_MAN_HX60_Fuel_Green", "UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_CGRCAT1A2_M2_usmc_wd"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_Finland"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["CDF_WarfareBLightFactory"]
];
