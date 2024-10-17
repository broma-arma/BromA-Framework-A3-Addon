/*
    The Takistani Militia are a paramilitary group based in Takistan. Their operations are focused
	on low-scale engagements and guerilla warfare with the usage of soviet-bloc equipment.
	What are these guys up to THIS time?
*/

_factionID = "TKMILITIA";
_factionName = "Takistani Militia";
_factionStructure = "LOW";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFarsi];
_defaultFace = [_facePersian];
_defaultName = [_nameArabic];
_defaultInsignia = "";
_defaultColor = "red";

// WEAPONS =====================================================================
_rifleList = [
	_RHSAKM,
	_RHSAKMS,
	_AK74UN,
	_AK74N,
	["rhs_weap_m38", "rhsgref_5Rnd_762x54_m38"]
];

_commonRifle = _rifleList selectRandomWeighted [0.3, 0.2, 0.3, 0.2, 0.3, 0.1];
_rifleGLList = [_RHSAKMGL, _RHSAKMSGL];
_commonRifleGL = selectRandom _rifleGLList;
_commonAR = _RPK;
_commonMG = _RPK;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = ["rhs_weap_rpg18", "rhs_rpg18_mag"];
_specAT = _RPG7;
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;

_commonRCO = "";
_commonCCO = "";

_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "";
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
	"UK3CB_TKM_I_H_Turban_02_1",
	"UK3CB_TKM_I_H_Turban_01_1",
	"UK3CB_TKM_I_H_Turban_05_1",
	"UK3CB_TKM_I_H_Turban_04_1",
	"UK3CB_H_Shemag_red",
	"UK3CB_H_Shemag_white",
	"UK3CB_TKM_O_H_Turban_01_1",
	"UK3CB_TKC_H_Turban_04_1"
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
	"UK3CB_TKM_O_U_01",
	"UK3CB_TKM_O_U_01_B",
	"UK3CB_TKM_O_U_01_C",
	"UK3CB_TKM_O_U_01_D",
	"UK3CB_TKM_O_U_05_C",
	"UK3CB_TKM_O_U_04_C",
	"UK3CB_TKM_O_U_04",
	"UK3CB_TKM_O_U_03",
	"UK3CB_TKM_O_U_03_B",
	"UK3CB_TKM_O_U_03_C"
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
	"V_TacChestrig_grn_F",
	"V_TacChestrig_oli_F"
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
_pilotVest = "rhs_belt_AK";

_commonBackpack = "UK3CB_B_Alice_K";
_bigBackpack = "UK3CB_B_Alice_K";
_medicalBackpack = "UK3CB_B_Alice_Med_K";
_specATBackpack = "rhs_rpg_2";
_reconBackpack = "UK3CB_B_Alice_Bedroll_K";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_f1";
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
