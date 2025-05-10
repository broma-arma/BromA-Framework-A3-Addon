/*
    German Armed Forces

    Camo: "FLECK", "TROPEN" (BRM_FMK_LoadoutCamo_GERMAN)
*/

_factionID = "GERMAN";
_factionName = "Bundeswehr";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite];
_defaultName = [_nameEnglish];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_GERMAN", "FLECK"];

// WEAPONS =====================================================================
_commonRifle = _G36E;
_commonRifleGL = _G36EGL;
_reconRifle = _G36KV;
_commonAR = _MG3KWSB;
_commonMG = _MG3KWSB;
_commonMarksman = ["arifle_SPAR_03_snd_F", "20Rnd_762x51_Mag"];
_commonSniper = ["rhs_weap_m82a1", "rhsusf_mag_10Rnd_STD_50BMG_mk211"];
_commonSMG = _G36C;

_commonPistol = ["RH_p226", "RH_15Rnd_9x19_SIG"];

_commonAT = _M136;
_specAT = _SMAW;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "UK3CB_Optic_G36Export35x";
_commonCCO = "rhsusf_acc_RX01";

_rifleScope = "UK3CB_Optic_G36Dualoptic15x";
_reconScope = "rhsusf_acc_g33_xps3_flip";
_arScope = "rhsusf_acc_eotech_552";
_sniperScope = "rhsusf_acc_M8541";

_specATScope = "rhs_weap_optic_smaw";

_commonSuppressor = "rhsusf_acc_nt4_black";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 5;
_countMG = 4;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 4;
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
_countBloodbag = 10;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom [
	"BRM_LWH_COMS_"+_camo,
	"BRM_LWH_MASK_COMS_"+_camo
];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_FLECK";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_ess";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor";
_helipilotHead = "rhsusf_hgu56p_visor";
_sniperHead = "H_Booniehat_oli";
_demoHead = _commonHead;
_reconHead = selectRandom ["rhsusf_opscore_ut", "rhsusf_opscore_ut_pelt_cam", "rhsusf_opscore_ut_pelt_nsw"];

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
_reconVest = "BRM_RRV_BROWN_REC1";
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
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6"]
/* Attack Helos      */,["RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
/* Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/* Heavy Vehicles    */,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
/* Light Vehicles    */,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
/* Medium Vehicles   */,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
/* Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
/* Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M", "RHS_UH1Y_UNARMED_d"]
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

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierGermany_EP1"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
