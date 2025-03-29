/*
    Although the communist insurgency has its roots as an underground movement,
    it is now a conventional force with military structure and weapon platforms
    captured from the Chernarussian government or provided by arms dealers.

    This has given the Chedaki enough power to start a coup against the government.
*/

_factionID = "CHEDAKI";
_factionName = "Chedaki Forces";
_factionStructure = "LOW";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite];
_defaultName = [_nameRussian];
_defaultInsignia = "";
_defaultColor = "red";

// WEAPONS =====================================================================
_commonRifle = _AK74N;
_commonRifleGL = _AK74NGL;
_commonAR = _RPK;
_commonMG = _PKM;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = ["rhs_weap_rpg18", "rhs_rpg18_mag"];
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;

_commonRCO = "rhs_acc_1p29";
_commonCCO = "rhs_acc_ekp1";

_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "rhs_acc_tgpa";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 7;
_countMG = 5;
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
_commonHead = ["", "BRM_Beanie_Green"] selectRandomWeighted [0.7, 0.3];
_leaderHead = "rhs_vkpo_cap";
_officerHead = "UK3CB_H_Beret_Officer_Red_Star";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_bala";
_pilotHead = "rhs_zsh7a_alt";
_helicrewHead = "rhs_zsh7a_mike";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_Beanie_Green";

_commonUniform = selectRandom [
	"UK3CB_CHD_B_U_H_Pilot_Uniform_02",
	"UK3CB_CHD_B_U_H_Pilot_Uniform_01",
	"UK3CB_CHD_B_U_CombatUniform_01",
	"UK3CB_CHD_B_U_CombatUniform_02",
	"UK3CB_CHD_B_U_CombatUniform_03",
	"UK3CB_CHD_B_U_CombatUniform_04",
	"UK3CB_CHD_B_U_CombatUniform_07"
];
_SLUNIFORM = _commonUniform;
_FTLUNIFORM = _commonUniform;
_officerUniform = "UK3CB_CHD_B_U_CombatUniform_09";
_pilotUniform = "rhs_uniform_df15_tan";
_sniperUniform = "UK3CB_CHD_B_U_Sniper_Uniform_01_Ghillie_Top_Underbrush_Green";
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15_tan";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "rhs_6b3";
_officerVest = "rhs_6b3_R148";
_ftlVest = _commonVest;
_slVest = "rhs_6b3_R148";
_mgVest = "rhs_6b3_RPK";
_grenadierVest = "rhs_6b3_VOG_2";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "rhs_belt_AK";

_commonBackpack = "UK3CB_CHC_C_B_HIKER";
_bigBackpack = "UK3CB_CHC_C_B_HIKER";
_medicalBackpack = _bigBackpack;
_specATBackpack = "rhs_rpg_2";
_reconBackpack = _bigBackpack;

_commonGOGGLES = selectRandom ["G_Balaclava_blk", "G_Balaclava_oli"];

if (_assignLoadoutMode) then {
	if (_commonHead == "" && !(_isTeamLeader || _isOfficer || _isSquadLeader || _isCrewman || _isHelicopterCrew || _isHelicopterPilot || _isPilot)) then {
		_unit addGoggles _commonGOGGLES;
	};
};

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";
_nightOnlyNVGs = true;

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_NSV_Gun_Bag";
_hmgTripod = "RHS_NSV_Tripod_Bag";

_staticAT = "RHS_SPG9_Gun_Bag";
_atTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["rhsgref_ins_g_g_zsu234"]
/* Attack Helos      */,["rhsgref_b_mi24g_CAS", "rhsgref_b_mi24g_FAB", "rhsgref_cdf_b_Mi35", "rhsgref_cdf_b_Mi35_UPK"]
/* Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/* Heavy Vehicles    */,["rhsgref_ins_g_t72ba", "rhsgref_ins_g_t72bb", "rhsgref_ins_g_t72bc"]
/* Light Vehicles    */,["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz", "rhsgref_ins_g_uaz_spg9", "rhsgref_ins_g_uaz_open"]
/* Medium Vehicles   */,["rhsgref_BRDM2_ins_g", "rhsgref_BRDM2_ATGM_ins_g", "rhsgref_ins_g_btr60", "rhsgref_ins_g_btr70", "rhsgref_ins_g_bmp1", "rhsgref_ins_g_bmp1p", "rhsgref_ins_g_bmp2e", "rhsgref_ins_g_bmp2k", "rhsgref_ins_g_ural_Zu23"]
/* Mobile Artillery  */,["rhsgref_ins_g_reg_BM21", "rhsgref_ins_g_reg_BM21"]
/* Transport Helos   */,["rhsgref_ins_g_Mi8amt", "rhsgref_ins_g_Mi8amt"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhsgref_ins_g_ural", "rhsgref_ins_g_ural_open", "rhsgref_ins_g_ural_work"]
/* Static Defence    */,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/* Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_repair_vv", "rhsgref_ins_g_gaz66_ammo", "RHS_Ural_Fuel_VV_01"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierINS"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["CDF_WarfareBLightFactory"]
];
