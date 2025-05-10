/*
    Glorious Soviet Union

    Camo: "vsr", "afg", "khk" (BRM_FMK_LoadoutCamo_SOVIETS)
*/

_factionID = "SOVIETS";
_factionName = "Soviet Union";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite, _faceAsian];
_defaultName = [_nameRussian];
_defaultInsignia = "USP_PATCH_RUS_ARMY_ARMED_FORCES";
_defaultColor = "red";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_SOVIETS", "vsr"];

// WEAPONS =====================================================================
_commonRifle = [_AK74N, _RHSAKM] select (_camo == "khk");
_commonRifleGL = [_AK74NGL, _RHSAKMGL] select (_camo == "khk");
_commonAR = [_PKM, _RPK] select (_camo == "khk");
_commonMG = [_PKM, _RPK] select (_camo == "khk");
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = ["rhs_weap_aks74un", "rhs_30Rnd_545x39_AK"];

_commonPistol = _Makarov;

_commonAT = ["rhs_weap_rpg18", "rhs_rpg18_mag"];
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;

_commonRCO = "";
_commonCCO = "";

_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "rhs_acc_tgpa";
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
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = [
	"rhsgref_ssh68_ttsko_forest", [
	"UK3CB_TKA_I_H_SSh68_Khk",
	"UK3CB_H_SSH60_Helmet_Covered_TAN"
] select (_camo == "khk")] select (_camo != "vsr");
_leaderHead = ["rhsgref_fieldcap_ttsko_forest", [selectRandom ["rhs_fieldcap_m88", "rhs_fieldcap_m88_back"], "rhs_fieldcap_khk"] select (_camo == "khk")] select (_camo != "vsr");
_officerHead = ["rhs_beret_mvd", ["UK3CB_CW_SOV_O_EARLY_H_Officer_Cap", "rhs_beret_vdv_early"] select (_camo == "khk")] select (_camo != "vsr");
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "rhs_zsh7a";
_helicrewHead = "rhs_zsh7a_mike";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = ["rhsgref_uniform_ttsko_forest", ["rhs_uniform_afghanka_para", "UK3CB_CW_SOV_O_Early_U_CombatUniform_01_KHK"] select (_camo == "khk")] select (_camo != "vsr");
_officerUniform = _commonUniform;
_pilotUniform = "rhs_uniform_df15";
_sniperUniform = ["U_B_FullGhillie_lsh", "U_O_FullGhillie_ard"] select (_camo != "vsr");
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["rhs_6b5_rifleman_ttsko", selectRandom ["rhs_lifchik", "rhs_lifchik_light"]] select (_camo != "vsr");
_officerVest = ["rhs_6b5_officer_ttsko", "rhs_lifchik_NCO"] select (_camo != "vsr");
_ftlVest = [_commonVest, "rhs_lifchik_vog"] select (_camo != "vsr");
_slVest = _officerVest;
_mgVest = _commonVest;
_grenadierVest = _ftlVest;
_medicVest = ["rhs_6b5_medic_ttsko", _commonVest] select (_camo != "vsr");
_demoVest = _commonVest;
_marksmanVest = ["rhs_6b5_sniper_ttsko", _commonVest] select (_camo != "vsr");;
_reconVest = _commonVest;
_pilotVest = "rhs_vest_commander";

_commonBackpack = ["UK3CB_UN_B_B_RIF", "rhs_rd54"] select (_camo != "vsr");
_bigBackpack = _commonBackpack;
_specATBackpack = "rhs_rpg_2";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";

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
/* Flag       */ "rhs_Flag_Russia_F"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["CDF_WarfareBLightFactory"]
];
