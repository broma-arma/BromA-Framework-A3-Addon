/*
    Slovenian Armed Forces
*/

_factionID = "SLOVENIA";
_factionName = "Slovenian Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite];
_defaultName = [_nameEnglish];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _Mk20;
_commonRifleGL = _Mk20GL;
_reconRifle = _RHSHK416D10;
_commonAR = ["rhs_weap_minimi_para_railed", "rhsusf_100Rnd_556x45_soft_pouch"];
_commonMG = _commonAR;
_commonMarksman = _commonRifle;
_commonSniper = ["R3F_PGM_ULTIMA_RATIO", "R3F_PGM_ULTIMA_RATIO_10Rnd_762x54"];
_commonSMG = _MP5A5;

_commonPistol = _P226WG;

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "rksl_optic_lds_c";
_commonCCO = "rksl_optic_eot552_c";

_rifleScope = "rksl_optic_eot552_c";
_reconScope = "rhsusf_acc_acog_rmr";
_marksmanScope = "rksl_optic_lds_c";
_sniperScope = "r3f_nf42";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_nt4_black";
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
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom [
	"BRM_ACH_SLOCAM",
	"BRM_ACH_MASK_SLOCAM",
	"BRM_ACH_COMS_SLOCAM"
];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_SLOCAM";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "rhsusf_hgu56p_visor_green";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_BoonieCOMS_SLOCAM";

_commonUniform = selectRandom ["BRM_BattleUNI_SLOCAM", "BRM_BattleUNIRS_SLOCAM"];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_sniperUniform = "U_B_T_FullGhillie_tna_F";
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BMR_MLBVARMOR_GREEN_RFL";
_officerVest = "BMR_MLBVARMOR_GREEN_SL";
_ftlVest = _officerVest;
_slVest = _officerVest;
_mgVest = "BMR_MLBV_GREEN_MG";
_grenadierVest = "BMR_MLBV_GREEN_GL";
_medicVest = "BMR_MLBV_GREEN_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "BRM_RRV_GREEN_REC1";
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_SLOCAM";
_bigBackpack = "BRM_PatrolBPH_SLOCAM";

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
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["CDF_WarfareBLightFactory"]
];
