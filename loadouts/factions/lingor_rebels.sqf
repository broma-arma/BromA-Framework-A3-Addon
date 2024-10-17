/*
    Lingor Rebels
*/

_factionID = "LINGOR_REBELS";
_factionName = "Lingor Rebels";
_factionStructure = "LOW";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFrench];
_defaultFace = [_faceTanoan];
_defaultName = [_nameFrench];
_defaultInsignia = "";
_defaultColor = "red";

// WEAPONS =====================================================================
_rifleList = [_RHSAKM, _RHSAKMS, _AK74UN, _AK74N];
_commonRifle = _rifleList selectRandomWeighted [0.3, 0.2, 0.3, 0.2];
_rifleGLList = [_RHSAKMGL, _RHSAKMSGL];
_commonRifleGL = selectRandom _rifleGLList;
_commonAR = _RPK;
_commonMG = _PKM;
_commonMarksman = _M76;
_commonSniper = _M76;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = _RSHG2;
_specAT = _RPG7;
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;

_commonRCO = "rhs_acc_1p29";
_commonCCO = "";

_marksmanScope = "rhs_acc_pso1m21";
_sniperScope = "rhs_acc_pso1m21";

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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = ["rhs_scarf", ""] selectRandomWeighted [0.3, 0.7];

_commonHead = selectRandom ["H_Bandanna_camo", "H_Booniehat_oli", "UK3CB_H_Bandanna_Green_Check", "BRM_PatrolCap_green", ""];
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4";
_pilotHead = "rhs_zsh7a_mike_green";
_helicrewHead = "rhs_zsh7a_mike_green";
_helipilotHead = "rhs_zsh7a_mike_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = selectRandom [
	"UK3CB_MDF_B_U_CombatUniform_02_LIZ_OD", "UK3CB_MDF_B_U_Crew_Uniform_01",
	"UK3CB_ADM_B_U_Shirt_Pants_01_GRN_WDL", "UK3CB_ADM_B_U_Shirt_Pants_01_GRN_WDL_ALT",
	"UK3CB_ADE_O_U_02_I", "UK3CB_ADE_O_U_02_C", "UK3CB_ADE_O_U_02_G", "UK3CB_ADE_O_U_02_H", "UK3CB_ADE_O_U_02_D"
];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_ALICE_RFL";
_officerVest = "BRM_ALICE_SL";
_ftlVest = "BRM_ALICE_SL";
_slVest = "BRM_ALICE_SL";
_mgVest = "BRM_ALICE_MG";
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = _commonVest;

_commonBackpack = "UK3CB_B_Alice_K";
_bigBackpack = "UK3CB_B_Alice_K";
_specATBackpack = "rhs_rpg_2";

if (_assignLoadoutMode && _randomGOGGLE != "") then { _unit addGoggles _randomGOGGLE; };

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_grenade_mkii_mag";
_binocular = "rhssaf_zrak_rd7j";
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
/* Anti Air Vehicles */ ["RHS_Ural_Zu23_VMF_01", "rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Mi24V_vdv"]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,["rhs_t72bb_tv", "rhs_t72ba_tv", "rhs_t80"]
/* Light Vehicles    */,["rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_spg9"]
/* Medium Vehicles   */,["rhs_brm1k_vmf", "rhs_bmp2d_vmf", "rhs_bmp1_vmf", "rhs_btr60_vdv"]
/* Mobile Artillery  */,[]
/* Transport Helos   */,["RHS_Mi8mt_vdv"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["rhs_zil131_vmf", "rhs_zil131_open_vmf"]
/* Static Defence    */,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/* Boats             */,["B_Boat_Transport_01_F"]
/* UAV               */,[]
/* UGV               */,[]
/* Support           */,[]
/* Submarines        */,[]
/* MRAP Vehicles     */,["rhsgref_BRDM2_vmf"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierTKMilitia_EP1"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
