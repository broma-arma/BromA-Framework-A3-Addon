/*
    FIA forces has been known aroudn the world due to the operation codename :
    OPERATION FLASHPOINT, they proved themselves to be successfull on guerilla
    tactics and small scale operation even before the US intervention.

    Now they come back kick ass and resist agaisnt the Reds with training given
    by US Delta Force.
*/

_factionID = "OFPFIA";
_factionName = "FIA forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite, _faceAsian];
_defaultName = [_nameRussian];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _G3KA4;
_commonRifleGL = _G3KA4GL;
_commonAR = _M249L;
_commonMG = _M240G;
_commonMarksman = _PSG1;
_commonSniper = _M2010;
_commonSMG = _MP5A2;

_commonPistol = _M9;

_commonAT = _RPG26;
_specAT = _RPG7;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "rhsusf_acc_ELCAN";
_commonCCO = "rhsusf_acc_eotech_552";

_marksmanScope = "";
_sniperScope = "optic_LRPS";

_commonSuppressor = _sup762;
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 10;
_countRifleLow = 6;
_countAR = 5;
_countMG = 3;
_countSniper = 8;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 0;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 30;
_countSniperCargo = 30;
_countSpecATCargo = 20;
_count40mmCargo = 40;
_countPistolCargo = 20;
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
_countEpiCARGO = 30;
_countBloodbagCargo = 30;
_countPAKCargo = 40;

// UNIFORMS ====================================================================
_commonHead = "rhsgref_Booniehat_alpen";
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_bala";
_pilotHead = "rhsusf_hgu56p";
_helicrewHead = "rhs_zsh7a_mike_green_alt";
_helipilotHead = "rhs_zsh7a_mike_green_alt";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = "rhsgref_uniform_alpenflage";
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
_pilotVest = "rhs_belt_AK";

_commonBackpack = "B_Kitbag_cbr";
_bigBackpack = "B_Kitbag_cbr";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = _NVGEN1;

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
/* Anti Air Vehicles */ ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/* Attack Planes     */,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs"]
/* Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t72ba_tv"]
/* Light Vehicles    */,["rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/* Medium Vehicles   */,["rhs_btr60_vdv", "rhs_bmd1", "rhs_bmp1d_vdv"]
/* Mobile Artillery  */,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/* Transport Helos   */,["RHS_Mi8mt_vvs"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhs_gaz66_msv", "rhs_gaz66_flat_msv"]
/* Static Defence    */,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/* Boats             */,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/* UAV               */,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/* UGV               */,["O_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/* Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
