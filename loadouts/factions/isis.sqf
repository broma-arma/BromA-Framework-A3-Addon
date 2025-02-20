/*
    Islamic State of Iraq and the Levant (also known as ISIS) is a fictional religious jihad terror
    organisation that has claimed to have masterminded several terror operations across the world.
*/

_factionID = "ISIS";
_factionName = "Islamic State";
_factionStructure = "LOW";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFarsi];
_defaultFace = [_facePersian];
_defaultName = [_nameArabic];
_defaultInsignia = "";
_defaultColor = "red";

// WEAPONS =====================================================================
_rifleList = [
	_AK74N,
	["UK3CB_M16A2","UK3CB_M16_30rnd_556x45"],
	_RHSAKM,
	_RHSAKMS,
	["rhs_weap_pm63", "rhs_30Rnd_762x39mm"]
];
_commonRifle = selectRandom _rifleList;
_commonRifleGL = _AK74NGL;
_reconRifle = ["rhs_weap_akmn", "rhs_30Rnd_762x39mm"];
_commonAR = _RPK;
_commonMG = _PKM;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = _RPG26;
_specAT = _RPG7;
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;

_commonRCO = "rhs_acc_1p29";
_commonCCO = "";

_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "rhs_acc_pbs1";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 6;
_countRifleLow = 4;
_countAR = 4;
_countMG = 3;
_countSniper = 4;
_countSpecAT = 3;
_count40mm = 10;
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
_countBandage = 15;
_countMorphine = 5;
_countEpi = 5;
_countTourniquet = 3;
_countBloodbag = 3;
_countPAK = 1;

_countBandageCargo = 20;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom [
	"UK3CB_H_Shemag_red",
	"UK3CB_H_Shemag_blk",
	"UK3CB_H_Turban_Facewrap_02_Blk",
	"UK3CB_ADE_O_H_Turban_01_1",
	"UK3CB_H_Mil_Turban_Wrap",
	""
];
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = _commonHead;
_helicrewHead = _commonHead;
_helipilotHead = _commonHead;
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = selectRandom [
	"UK3CB_ADM_B_U_Tshirt_01_WDL_03",
	"UK3CB_ADE_O_U_02_G",
	"UK3CB_ADE_O_U_02_B",
	"UK3CB_ADE_O_U_02_J",
	"UK3CB_ADE_O_U_02_H",
	"UK3CB_MEE_O_U_05_C",
	"UK3CB_ADM_B_U_Tshirt_01_DPM",
	"UK3CB_NAP_B_U_Pilot_BLK",
	"UK3CB_MEI_B_U_Jeans_Tshirt_18",
	"UK3CB_MEI_B_U_Jeans_Tshirt_07",
	"UK3CB_MEI_B_U_Jeans_Tshirt_06"
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

_commonVest = selectRandom [
	"UK3CB_V_Chestrig_Tan",
	"UK3CB_V_Chestrig_OLI",
	"UK3CB_V_Chestrig_WDL_02",
	"UK3CB_V_Chestrig_WDL_01"
];
_officerVest = _commonVest;
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = _commonVest;

_commonBackpack = "BRM_SqBackpack_Black";
_bigBackpack = "BRM_SqBackpack_Black";
_medicalBackpack = "BRM_SqBackpack_Black";
_specATBackpack = "rhs_rpg_2";
_reconBackpack = "BRM_PatrolBP_Black";

if (_assignLoadoutMode && _commonHead == "") then {
	_unit addGoggles selectRandom ["UK3CB_G_Face_Wrap_01", "G_Balaclava_blk"];
};

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_rangefinder = "rhsusf_bino_lrf_Vector21";
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
/* Anti Air Vehicles */ ["rhsgref_cdf_zsu234", "rhsgref_cdf_ural_Zu23"]
/* Attack Helos      */,["rhsgref_b_mi24g_CAS", "rhsgref_b_mi24g_FAB", "rhsgref_cdf_b_Mi35", "rhsgref_cdf_b_Mi35_UPK"]
/* Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/* Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/* Light Vehicles    */,["UK3CB_TKM_O_Hilux_Dshkm", "UK3CB_TKM_O_Datsun_Pkm", "UK3CB_TKM_O_Hilux_Pkm", "UK3CB_TKM_O_UAZ_Dshkm", "rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/* Medium Vehicles   */,["rhs_btr60_vdv", "rhs_btr70_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/* Mobile Artillery  */,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/* Transport Helos   */,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural"]
/* Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/* Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsgref_cdf_gaz66_ammo", "rhsgref_cdf_ural_fuel"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierTKMilitia_EP1"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
