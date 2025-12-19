/*
    ANZAC Forces

    Camo: "DPCU", "DPDU" (BRM_FMK_LoadoutCamo_ANZAC)
*/

_factionID = "ANZAC";
_factionName = "ANZAC";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite, _faceBlack];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_ANZAC", "DPCU"];

// WEAPONS =====================================================================
_commonRifle = _AUGA3;
_commonRifleGL = _AUGA3GL;
_commonAR = _M249S;
_commonMG = ["BRM_FNMAG_TAC", "BRM_MAG_100rndBoxT"];
_commonMarksman = _SR25;
_commonSniper = ["BRM_XM109","BRM_XM109Mag_HET"];
_commonSMG = _AUGA2PARATAN;

_commonPistol = _G17;

_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = _FHQACOG;
_commonCCO = "rksl_optic_eot552";

_rifleScope = _commonCCO;
_arScope = _commonCCO;
_sniperScope = "rhsusf_acc_premier";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_nt4_black";
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

_commonHead = selectRandom [
	"BRM_ACH_"+_camo, "BRM_ACH_COMS_"+_camo,
	"BRM_ACH_MASK_"+_camo, "BRM_ACH_MASK_COMS_"+_camo
];
_leaderHead = _commonHead;
_officerHead = "UK3CB_BAF_H_Beret_SBS";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_ess";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_Booniehat_"+_camo;

_commonUniform = selectRandom ["BRM_BattleUNI_"+_camo, "BRM_BattleUNIRS_"+_camo];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = "U_B_FullGhillie_sard";
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
_bigBackpack = _commonBackpack;
_reconBackpack = "BRM_PatrolBPH_"+_camo;

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT ==============================================================
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
if (_camo == "des") then {
	_factionVehicles = [
		/* Anti Air Vehicles */ []
		/* Attack Helos      */,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited", "UK3CB_BAF_Wildcat_AH1_CAS_6D"]
		/* Attack Planes     */,[]
		/* Heavy Vehicles    */,[]
		/* Light Vehicles    */,["UK3CB_BAF_LandRover_Soft_Sand_A", "UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A", "rhsusf_M1078A1R_SOV_M2_D_fmtv_socom"]
		/* Medium Vehicles   */,["UK3CB_BAF_Jackal2_L111A1_D", "UK3CB_BAF_Coyote_Logistics_L111A1_D", "UK3CB_BAF_Panther_GPMG_Sand_A"]
		/* Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
		/* Transport Helos   */,["UK3CB_BAF_Merlin_HC4_18", "UK3CB_BAF_Wildcat_AH1_TRN_8A"]
		/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
		/* Transport Trucks  */,["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom", "UK3CB_BAF_MAN_HX58_Transport_Sand"]
		/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
		/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
		/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
		/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
		/* Support           */,["UK3CB_BAF_MAN_HX60_Repair_Sand", "UK3CB_BAF_MAN_HX60_Fuel_Sand", "UK3CB_BAF_MAN_HX58_Cargo_Sand_B"]
		/* Submarines        */,["B_SDV_01_F"]
		/* MRAP Vehicles     */,["UK3CB_BAF_Panther_GPMG_Sand_A"]
	];
} else {
	_factionVehicles = [
		/* Anti Air Vehicles */ []
		/* Attack Helos      */,["UK3CB_BAF_Apache_AH1_DynamicLoadoutUnlimited", "UK3CB_BAF_Wildcat_AH1_CAS_6D"]
		/* Attack Planes     */,[]
		/* Heavy Vehicles    */,[]
		/* Light Vehicles    */,["UK3CB_BAF_LandRover_Soft_Green_A", "UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_A"]
		/* Medium Vehicles   */,["UK3CB_BAF_Jackal2_L111A1_D", "UK3CB_BAF_Coyote_Logistics_L111A1_D", "UK3CB_BAF_Panther_GPMG_Green_A"]
		/* Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
		/* Transport Helos   */,["UK3CB_BAF_Merlin_HC4_18", "UK3CB_BAF_Wildcat_AH1_TRN_8A"]
		/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
		/* Transport Trucks  */,["rhsusf_M1084A1R_SOV_M2_D_fmtv_socom", "UK3CB_BAF_MAN_HX58_Transport_Green"]
		/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
		/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
		/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
		/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
		/* Support           */,["UK3CB_BAF_MAN_HX60_Repair_Green", "UK3CB_BAF_MAN_HX60_Fuel_Green", "UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
		/* Submarines        */,["B_SDV_01_F"]
		/* MRAP Vehicles     */,["UK3CB_BAF_Panther_GPMG_Green_A"]
	];
};

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_australia"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
