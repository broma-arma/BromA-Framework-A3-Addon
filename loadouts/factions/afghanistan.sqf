/*
    The Afghanistan National Army, tasked with defending the country from
    Mujahideen forces all the while molesting everything from goats to little boys.

    Backed the US forces with mixed old soviet equipment.

    Camo: "ana", "anp" (BRM_FMK_LoadoutCamo_AFGHANISTAN)
*/

_factionID = "AFGHANISTAN";
_factionName = "Afghanistan National Army";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFarsi];
_defaultFace = [_facePersian];
_defaultName = [_nameArabic];
_defaultInsignia = "USP_PATCH_AFG_LOCAL_POLICE";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_AFGHANISTAN", "ana"];

// WEAPONS =====================================================================
_rifleList = [_RHSAKM, _RHSAKMS, _AK74N, ["hlc_wp_m16a2", "hlc_30rnd_556x45_EPR"]];
_commonRifle = selectRandom _rifleList;
_commonRifleGL = selectRandom [_RHSAKMGL, _RHSAKMSGL];
_reconRifle = ["rhs_weap_m4a1_carryhandle", "rhs_mag_30Rnd_556x45_M855A1_Stanag"];
_commonAR = _RPK;
_commonMG = _RPK;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = ["rhs_weap_rpg18", "rhs_rpg18_mag"];
_specAT = _RPG7;
_weaponsAA = _STINGER;
_weaponsAT = _RPG7PGO;

_commonRCO = "";
_commonCCO = "";

_reconScope = "rhsusf_acc_acog3_usmc";
_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 7;
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
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom ([
	["rhs_ssh68_2", "rhs_beanie_green", "rhssaf_helmet_m97_olive_nocamo", "UK3CB_ANA_B_H_Patrolcap_spec4ce", "UK3CB_ANA_B_H_6b27m_SPEC4CE"],
	["UK3CB_ANP_B_H_Patrolcap_Off_BLU", ""]
] select (_camo == "anp"));
_leaderHead = [_commonHead, "UK3CB_ANP_B_H_Patrolcap_Off_BLU"] select (_camo == "anp");
_officerHead = ["rhs_beret_milp", "UK3CB_ANP_B_H_Beret"] select (_camo == "anp");
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = ["BRM_SPH4V_WHITE", "BRM_SPH4V_BROWN"] select (_camo == "anp");
_helicrewHead = ["BRM_SPH4V_WHITE", "BRM_SPH4V_BROWN"] select (_camo == "anp");
_helipilotHead = ["BRM_SPH4V_WHITE", "BRM_SPH4V_BROWN"] select (_camo == "anp");
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = ["UK3CB_ANA_B_H_MICH_BARE_DES", _commonHead] select (_camo == "anp");

_commonUniform = selectRandom ([
	["UK3CB_ANA_B_U_CombatUniform_01_SPEC4CE", "UK3CB_ANA_B_U_CombatUniform_Shortsleeve_01_SPEC4CE"],
	["UK3CB_ANP_B_U_CombatUniform_01_BLU", "UK3CB_ANP_B_U_CombatUniform_Shortsleeve_01_BLU"]
] select (_camo == "anp"));
_officerUniform = _commonUniform;
_pilotUniform = [_commonUniform, "UK3CB_CHC_C_U_Overall_01"] select (_camo == "anp");
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = _pilotUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["UK3CB_ANA_B_V_MK_Vest_TAN_01", selectRandom ["UK3CB_V_Chestrig_Tan", "UK3CB_V_Chestrig_WDL_02"]] select (_camo == "anp");
_officerVest = _commonVest;
_ftlVest = ["UK3CB_ANA_B_V_SL_Vest_TAN_01", _commonVest] select (_camo == "anp");
_slVest = _ftlVest;
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "UK3CB_B_Alice_K";
_bigBackpack = ["UK3CB_B_Alice_K", _commonBackpack] select (_camo == "anp");
_specATBackpack = "rhs_rpg_2";
_reconBackpack = ["UK3CB_ANA_B_B_RIF", _commonBackpack] select (_camo == "anp");

// MISC EQUIPMENT =============================================================
_NVG = "rhsusf_ANPVS_14";
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
/* Anti Air Vehicles */ ["rhsgref_nat_ural_Zu23"]
/* Attack Helos      */,["RHS_Mi24V_AT_vvsc", "RHS_Mi24V_vvsc", "RHS_Mi24P_CAS_vvsc"]
/* Attack Planes     */,["RHS_Su25SM_vvsc"]
/* Heavy Vehicles    */,["rhs_t72ba_tv", "rhs_t72bb_tv", "rhs_t72bc_tv"]
/* Light Vehicles    */,["B_G_Offroad_01_F", "B_G_Van_01_transport_F", "rhsusf_m998_d_2dr_halftop", "rhsusf_m998_d_4dr_halftop", "rhsusf_m998_d_4dr"]
/* Medium Vehicles   */,["rhs_bmp2_tv"]
/* Mobile Artillery  */,["rhs_9k79_B", "rhs_9k79_K", "rhs_9k79", "rhs_2s3_tv"]
/* Transport Helos   */,["RHS_Mi8mt_vv"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["RHS_Ural_VDV_01", "RHS_Ural_Flat_VDV_01", "RHS_Ural_Open_VDV_01", "RHS_Ural_Open_Flat_VDV_01"]
/* Static Defence    */,["RHS_M2StaticMG_D", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "RHS_TOW_TriPod_D", "rhsgref_ins_g_ZU23"]
/* Boats             */,["B_Boat_Transport_01_F"]
/* UAV               */,["rhs_pchela1t_vvsc"]
/* UGV               */,["O_UGV_01_F", "O_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_ammo_vdv", "RHS_Ural_Fuel_VDV_01"]
/* Submarines        */,["O_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_Blue_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Short_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
