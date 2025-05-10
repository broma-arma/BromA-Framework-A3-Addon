/*
    Norwegian Armed Forces
*/

_factionID = "NORWAY";
_factionName = "Norwegian Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _RHSHK416D145;
_commonRifleGL = _RHSHK416D145M320;
_commonAR = ["rhs_weap_minimi_para_railed", "rhsusf_100Rnd_556x45_soft_pouch"];
_commonMG = _commonAR;
_commonMarksman = ["arifle_SPAR_03_blk_F", "20Rnd_762x51_Mag"];
_commonSniper = ["rhs_weap_m82a1", "rhsusf_mag_10Rnd_STD_50BMG_mk211"];
_commonSMG = _RHSMP7;

_commonPistol = ["rhsusf_weap_glock17g4", "rhsusf_mag_17Rnd_9x19_FMJ"];

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "rhsusf_acc_acog_rmr";
_commonCCO = "rhsusf_acc_compm4";

_rifleScope = _commonCCO;
_reconScope = "rhsusf_acc_acog_rmr";
_arScope = "rhsusf_acc_eotech_552";
_marksmanScope = "rksl_optic_pmii_312_pip";
_sniperScope = "rhsusf_acc_premier";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_rotex5_grey";
_commonPistolSuppressor = "";

_commonRail = "rhsusf_acc_anpeq15side_bk";
_commonBipod = "rhsusf_acc_tdstubby_blk";

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
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom ["BRM_ACH_NORSK", "BRM_ACH_GHILLIE_NORSK", "BRM_ACH_MASK_COMS_NORSK"];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_NORSK";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_alt_helmet";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_green";
_helipilotHead = "rhsusf_hgu56p_visor_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "rhsusf_opscore_fg_pelt_cam";

_commonUniform = selectRandom ["BRM_BattleUNI_NORSK", "BRM_BattleUNIRS_NORSK"];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_RRV_BROWN_RFL";
_officerVest = "BRM_RRV_BROWN_RECLEAD";
_ftlVest = _officerVest;
_slVest = _ftlVest;
_mgVest = "BRM_RRV_BROWN_MG";
_grenadierVest = _commonVest;
_medicVest = "BRM_RRV_BROWN_RECMED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_NORSK";
_bigBackpack = "BRM_PatrolBPH_NORSK";

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
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
