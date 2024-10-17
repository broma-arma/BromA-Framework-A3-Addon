/*
	Originally founded as Black Element USA in September 1998, ION is a private military company specialising in
	security solutions and providing services tailored to specialist and high-risk environments.
*/

_factionID = "IONPMC";
_factionName = "I.O.N. PMC";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceAltian, _voiceAmerican, _voiceBritish, _voiceFarsi, _voiceRussian];
_defaultFace = [_faceGreek, _faceWhite, _faceBlack, _faceAsian, _facePersian];
_defaultName = [_nameAmerican, _nameAFRICAN, _nameArabic, _nameRussian];
_defaultInsignia = "";
_defaultColor = "white";

// WEAPONS =====================================================================
_commonRifle = ["HLC_rifle_XM8_Carbine", "hlc_30rnd_556x45_EPR_G36"];
_commonRifleGL = _commonRifle;
_commonAR = ["rhs_weap_m249_pip_L_para", "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"];
_commonMG = _commonAR;
_commonMarksman = ["hlc_rifle_XM8_DMAR", "hlc_30rnd_556x45_M_G36"];
_commonSniper = ["hlc_rifle_psg1", "hlc_20rnd_762x51_b_G3"];
_commonSMG = _MP5A2;

_commonPistol = _P226WG;

_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "hlc_optic_amo_pcap";
_commonCCO = "hlc_optic_ism_pcap";

_marksmanScope = "hlc_optic_amo_pcap";
_sniperScope = "";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "muzzle_snds_M";
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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["UK3CB_G_Balaclava2_BLK", "rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom ["UK3CB_H_Radio_Cap_ION_BLK_ALT", "UK3CB_H_Cap_Back_ION_BLK", "UK3CB_H_Radio_Cap_Back_ION_BLK_ALT", "BRM_BeanieCOMS_Black", ""];
_leaderHead = selectRandom ["UK3CB_H_Radio_Cap_Back_ION_BLK_ALT", "UK3CB_H_Radio_Cap_ION_BLK_ALT"];
_officerHead = _leaderHead;
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "BRM_SPH4V_WHITE";
_helicrewHead = "BRM_SPH4V_WHITE";
_helipilotHead = "BRM_SPH4V_WHITE";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "rhsusf_opscore_bk_pelt";

_commonUniform = selectRandom [
	"UK3CB_ION_B_U_SF_Uniform_SHIRT_07_URB",
	"UK3CB_ION_B_U_SF_Uniform_SHIRT_03_URB",
	"UK3CB_ION_B_U_SF_Uniform_SHIRT_06_WDL",
	"UK3CB_ION_B_U_SF_Uniform_Short_Shirt_01_URB",
	"UK3CB_ION_B_U_SF_Uniform_Short_Shirt_06_URB",
	"UK3CB_ION_B_U_SF_Uniform_Short_Shirt_04_WDL",
	"UK3CB_ION_B_U_SF_Uniform_Short_Shirt_08_WDL",
	"UK3CB_ION_B_U_SF_Uniform_Short_Shirt_05_WDL",
	"UK3CB_ION_B_U_Uniform_05_URB"
];
_officerUniform = _commonUniform;
_pilotUniform = _commonUniform;
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_Protec_BLACK_RFL";
_officerVest = "BRM_Protec_BLACK_TL";
_ftlVest = "BRM_Protec_BLACK_TL";
_slVest = "BRM_Protec_BLACK_TL";
_mgVest = "BRM_RRV_BLACK_MG";
_grenadierVest = _commonVest;
_medicVest = "BRM_RRV_BLACK_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest_Black";

_commonBackpack = "BRM_PatrolBP_Black";
_bigBackpack = "BRM_PatrolBP_Black";

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT ==============================================================
_rangefinder = "rhsusf_bino_lerca_1200_black";
_laserdesignator = "UK3CB_BAF_Soflam_Laserdesignator";
_NVG = "rhs_1PN138";

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
/* Anti Air Vehicles */ ["rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Mi24V_AT_vvsc", "RHS_Mi24V_vvsc", "RHS_Mi24P_CAS_vvsc"]
/* Attack Planes     */,["RHS_Su25SM_vvsc"]
/* Heavy Vehicles    */,["rhs_t72ba_tv", "rhs_t72bb_tv", "rhs_t72bc_tv"]
/* Light Vehicles    */,["rhs_uaz_open_vmf"]
/* Medium Vehicles   */,["rhs_bmp2_tv", "rhs_bmp2d_tv", "rhs_bmp2k_tv", "rhs_brm1k_tv", "rhs_btr60_vmf"]
/* Mobile Artillery  */,["rhs_9k79_B", "rhs_9k79_K", "rhs_9k79", "rhs_2s3_tv"]
/* Transport Helos   */,["RHS_Mi8mt_vv"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["RHS_Ural_VDV_01", "RHS_Ural_Flat_VDV_01", "RHS_Ural_Open_VDV_01", "RHS_Ural_Open_Flat_VDV_01"]
/* Static Defence    */,["rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_ZU23"]
/* Boats             */,["O_Boat_Armed_01_minigun_F"]
/* UAV               */,["rhs_pchela1t_vvsc"]
/* UGV               */,["O_UGV_01_F", "O_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_ammo_vdv", "RHS_Ural_Fuel_VDV_01"]
/* Submarines        */,["O_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "flag_ven"
/* Objects    */,["I_CargoNet_01_ammo_F"]
/* Walls      */,["Land_CncBarrier_stripes_F"]
/* Structures */,["Land_Cargo_HQ_V1_F"]
];
