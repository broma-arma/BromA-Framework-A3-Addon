/*
    The Middle Eastern Coalition (Arabic: تحالف الشرق الأوسط), commonly
    abbreviated to MEC, is a military alliance of Middle Eastern states.
*/

_factionID = "MEC";
_factionName = "Middle Eastern Coalition";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFarsi];
_defaultFace = [_facePersian];
_defaultName = [_nameArabic];
_defaultInsignia = "USP_PATCH_FLAG_JORDAN";
_defaultColor = "red";

// WEAPONS =====================================================================
_commonRifle = _G3A3;
_commonRifleGL = _G3KA4GL;
_commonAR = ["hlc_lmg_MG3KWS_b", "hlc_50Rnd_762x51_B_MG3"];
_commonMG = ["hlc_lmg_MG3KWS_b", "hlc_250Rnd_762x51_B_MG3"];
_commonMarksman = ["hlc_rifle_g3sg1", "hlc_20rnd_762x51_b_G3"];
_commonSniper = ["hlc_rifle_g3sg1", "hlc_20rnd_762x51_b_G3"];
_commonSMG = ["hlc_smg_mp5a3", "hlc_30Rnd_9x19_B_MP5"];

_commonPistol = ["rhs_weap_pya", "rhs_mag_9x19_17"];

_commonAT = _RPG26;
_specAT = ["R3F_ERYX", "R3F_ERYX_mag"];
_weaponsAA = _IGLA;
_weaponsAT = _specAT;

_commonRCO = "HLC_Optic_ZFSG1";
_commonCCO = "HLC_Optic_ZFSG1";

_sniperScope = "HLC_Optic_ZFSG1";

_commonSuppressor = "hlc_muzzle_300blk_KAC";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 8;
_countRifleLow = 6;
_countAR = 4;
_countMG = 2;
_countSniper = 6;
_countSpecAT = 1;
_count40mm = 10;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 20;
_countSniperCargo = 20;
_countSpecATCargo = 15;
_count40mmCargo = 30;
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
_randomGOGGLE = selectRandom ["UK3CB_G_Neck_Shemag_Tan", "rhsusf_shemagh_gogg_tan"];

_commonHead = selectRandom ["rhsgref_helmet_pasgt_3color_desert", "rhsgref_helmet_pasgt_3color_desert_rhino"];
_leaderHead = _commonHead;
_officerHead = "rhssaf_beret_black";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "rhs_zsh7a";
_helicrewHead = "rhs_zsh7a_mike_green";
_helipilotHead = "rhs_zsh7a_mike_green";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = "rhsgref_uniform_3color_desert";
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

_commonVest = selectRandom ["UK3CB_MD12_VEST_Rifleman_KHK", "UK3CB_MD12_VEST_KHK"];
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

_commonBackpack = "BRM_SqBackpack_Brown";
_bigBackpack = "BRM_SqBpH_Brown";

if (_assignLoadoutMode && _randomGOGGLE != "") then { _unit addGoggles _randomGOGGLE; };

// MISC EQUIPMENT =============================================================
_NVG = "NVGoggles_OPFOR";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_Kord_Gun_Bag";
_hmgTripod = "RHS_Kord_Tripod_Bag";

_staticAT = "RHS_Kornet_Gun_Bag";
_atTripod = "RHS_Kornet_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
// Common vehicles employed by MEC include: UAZ 469, Ural-4320, BRDM 2, BTR-60, BMP-2/2M/3, T-72, 9P148 Konkurs, ZSU-23-4, Mi-17 Hip,
// Mi-28 Havoc, Su-25 Frogfoot.
_factionVehicles = [
/* Anti Air Vehicles */ ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Ka52_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/* Attack Planes     */,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "RHS_T50_vvs_generic", "RHS_T50_vvs_blueonblue", "RHS_T50_vvs_054"]
/* Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t90a_tv", "rhs_t90_tv", "rhs_t80um", "rhs_t80uk", "rhs_t72bd_tv"]
/* Light Vehicles    */,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/* Medium Vehicles   */,["rhs_btr60_vdv", "rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/* Mobile Artillery  */,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/* Transport Helos   */,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/* Static Defence    */,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/* Boats             */,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/* UAV               */,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/* UGV               */,["O_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/* Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierTakistan_EP1"
/* Objects    */,["O_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Short_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
