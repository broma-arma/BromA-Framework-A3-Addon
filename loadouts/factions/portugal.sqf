/*
    Portuguese Armed Forces
*/

_factionID = "PORTUGAL";
_factionName = "Portuguese Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceBritish];
_defaultFace = [_faceWhite];
_defaultName = [_nameSpanish];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _G3A3RIS;
_commonRifleGL = _G3A3RIS;
_reconRifle = ["rhs_weap_SCARH_FDE_CQC", "rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"];
_commonAR = ["UK3CB_MG3_KWS_B", "UK3CB_MG3_100rnd_762x51_R"];
_commonMG = _commonAR;
_commonMarksman = _G3A3RIS;
_commonSniper = ["rhs_weap_m82a1", "rhsusf_mag_10Rnd_STD_50BMG_mk211"];
_commonSMG = _MP5A3;

_commonPistol = _G17;

_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "";
_commonCCO = "";

_reconScope = "rhsusf_acc_acog_rmr";
_sniperScope = "rhsusf_acc_premier";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_aac_762sdn6_silencer";
_commonPistolSuppressor = "rhsusf_acc_omega9k";

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
_randomHEAD = selectRandom ["rhssaf_helmet_m97_olive_nocamo_black_ess_bare", "rhssaf_helmet_m97_olive_nocamo", "rhssaf_helmet_m97_olive_nocamo_black_ess"];
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = _randomHEAD;
_leaderHead = "UK3CB_BAF_H_Beret_RAMC_PRR_Over";
_officerHead = "UK3CB_BAF_H_Beret_RAMC_PRR_Over";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = selectRandom ["rhsusf_opscore_fg_pelt", "rhsusf_opscore_fg_pelt_cam", "rhsusf_opscore_fg_pelt_nsw"];

_commonUniform = "rhsgref_uniform_dpm";
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

_commonVest = "BMR_MLBVARMOR_GREEN_RFL";
_officerVest = "BMR_MLBVARMOR_GREEN_SL";
_ftlVest = "BMR_MLBVARMOR_GREEN_SL";
_slVest = "BMR_MLBVARMOR_GREEN_SL";
_mgVest = _commonVest;
_grenadierVest = "BMR_MLBVARMOR_GREEN_GL";
_medicVest = "BMR_MLBVARMOR_GREEN_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "BRM_Protec_GREEN_RFL";
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_Green";
_bigBackpack = "BRM_PatrolBPH_Green";
_reconBackpack = _bigBackpack;

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT =============================================================
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
/* Attack Helos      */,[]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,[]
/* Light Vehicles    */,["rhsgref_hidf_M998_2dr_fulltop", "rhsgref_hidf_m1025_m2"]
/* Medium Vehicles   */,["I_APC_Wheeled_03_cannon_F", "rhsusf_m113_usarmy_supply"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
/* Transport Helos   */,["B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["UK3CB_BAF_MAN_HX60_Transport_Green"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,[]
/* UAV               */,[]
/* UGV               */,[]
/* Support           */,["UK3CB_BAF_MAN_HX60_Cargo_Green_B", "UK3CB_BAF_MAN_HX60_Repair_Green", "UK3CB_BAF_MAN_HX60_Fuel_Green"]
/* Submarines        */,[]
/* MRAP Vehicles     */,["UK3CB_BAF_Panther_GPMG_Green_A"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
