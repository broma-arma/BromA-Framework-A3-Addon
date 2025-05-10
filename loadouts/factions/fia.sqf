/*
    Believed to be chiefly composed of former and defected members of the
    Altis Armed Forces, disparate fragments of opposition to the 2026 Kavala
    coup d'etat joined together in the grind of bloody civil war.
*/

_factionID = "FIA";
_factionName = "Freedom and Independence Army";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAltian];
_defaultFace = [_faceGreek];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_rifleList = [_TRG, _Mk20, _Mk20Camo, _Mk20C, _Mk20CCamo];
_commonRifle = selectRandom _rifleList;
_rifleGLList = [_Mk20GL, _Mk20GLCamo, _TRGGL];
_commonRifleGL = selectRandom _rifleGLList;
_commonAR = _Mk200;
_commonMG = _M240B;
_commonMarksman = _Mk18;
_commonSniper = _Mk18;
_commonSMG = _PDW;

_commonPistol = _ACP45;

_commonAT = _RPG42;
_specAT = _RPG42;
_weaponsAA = ["launch_B_Titan_F", "Titan_AA"];
_weaponsAT = ["launch_B_Titan_short_F", "Titan_AT"];

_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";

_sniperScope = _SOS;

_commonSuppressor = "muzzle_snds_M";
_commonPistolSuppressor = "muzzle_snds_acp";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 4;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
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
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom [
	"H_Bandanna_khk", "H_Bandanna_mcamo", "H_Bandanna_sgg", "H_Bandanna_sand",
	"H_Cap_blk", "H_Cap_blu", "H_Cap_oli_hs",
	"H_Shemag_olive", "H_Shemag_olive_hs", "H_ShemagOpen_tan", "H_ShemagOpen_khk"
];
_leaderHead = "H_Watchcap_blk";
_officerHead = "";
_medicHead = _commonHead;
_crewmanHead = _commonHead;
_pilotHead = _commonHead;
_helicrewHead = _commonHead;
_helipilotHead = _commonHead;
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "H_Booniehat_khk_hs";

_commonUniform = selectRandom [
	"U_BG_Guerilla1_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_1", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_BG_Guerrilla_6_1",
	"U_BG_leader", "U_C_HunterBody_grn", "U_I_G_Story_Protagonist_F"
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

_commonVest = selectRandom ["V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli"];
_officerVest = _commonVest;
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "V_BandollierB_blk";

_commonBackpack = "B_AssaultPack_dgtl";
_bigBackpack = "B_Carryall_oli";

// MISC EQUIPMENT =============================================================
_NVG = _NVGEN1;

// EXTRA EQUIPMENT =============================================================
_hmg = "B_HMG_01_high_weapon_F";
_hmgTripod = "B_HMG_01_support_F";

_staticAT = "B_AT_01_weapon_F";
_atTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["rhsgref_cdf_b_zsu234", "rhsgref_cdf_b_ural_Zu23"]
/* Attack Helos      */,["rhsgref_b_mi24g_CAS", "rhsgref_b_mi24g_FAB", "rhsgref_cdf_b_Mi35", "rhsgref_cdf_b_Mi35_UPK"]
/* Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/* Heavy Vehicles    */,["rhsgref_cdf_b_t72ba_tv", "rhsgref_cdf_b_t72ba_tv"]
/* Light Vehicles    */,["B_G_Offroad_01_armed_F", "B_G_Offroad_01_armed_F", "rhsgref_cdf_b_reg_uaz_open", "rhsgref_cdf_b_reg_uaz_spg9"]
/* Medium Vehicles   */,["rhsgref_cdf_b_bmd1", "rhsgref_cdf_b_bmd1k", "rhsgref_cdf_b_bmd1p", "rhsgref_cdf_b_bmd1", "rhsgref_cdf_b_bmd1k", "rhsgref_cdf_b_bmd1p", "rhsgref_cdf_b_bmd1pk", "rhsgref_cdf_b_bmd2", "rhsgref_cdf_b_bmd2k", "rhsgref_cdf_b_bmp1", "rhsgref_cdf_b_bmp1d", "rhsgref_cdf_b_bmp1k", "rhsgref_cdf_b_bmp1p", "rhsgref_cdf_b_bmp2", "rhsgref_cdf_b_bmp2d", "rhsgref_cdf_b_bmp2k", "rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
/* Mobile Artillery  */,["rhsgref_cdf_b_reg_BM21", "rhsgref_cdf_b_reg_BM21"]
/* Transport Helos   */,["rhsgref_cdf_b_reg_Mi8amt", "rhsgref_cdf_b_reg_Mi17Sh"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["B_G_Van_01_transport_F"]
/* Static Defence    */,["B_HMG_01_high_F", "B_static_AA_F", "B_static_AT_F", "B_G_Mortar_01_F", "rhsgref_cdf_b_Igla_AA_pod", "rhsgref_cdf_b_DSHKM", "rhsgref_cdf_b_DSHKM_Mini_TriPod", "rhsgref_cdf_b_NSV_TriPod", "rhsgref_cdf_b_SPG9", "rhsgref_cdf_b_SPG9M", "rhsgref_cdf_b_ZU23"]
/* Boats             */,["B_G_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["B_G_Van_01_fuel_F", "rhsgref_cdf_b_gaz66_ammo", "B_G_Offroad_01_repair_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_FIA_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Cargo_HQ_V1_F"]
];
