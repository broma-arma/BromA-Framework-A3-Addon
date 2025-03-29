/*
    The Yugoslav People's Army was the military of Yugoslavia from 1945 to 1992 and primary part of Yugoslavia armed forces.
*/

_factionID = "YUGO";
_factionName = "Yugoslav People's Army";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite];
_defaultName = [_nameRussian];
_defaultInsignia = "";
_defaultColor = "red";

// WEAPONS =====================================================================
_commonRifle = ["rhs_weap_m70b3n", "rhssaf_30Rnd_762x39mm_M67"];
_commonRifleGL = ["rhs_weap_m70b3n_pbg40", "rhssaf_30Rnd_762x39mm_M67", "rhs_VOG25"];
_commonAR = ["UK3CB_RPK_74N", "rhs_45Rnd_545X39_AK_Green"];
_commonMG = _M84;
_commonMarksman = ["rhs_weap_m76", "rhsgref_10Rnd_792x57_m76"];
_commonSniper = ["rhs_weap_m76", "rhsgref_10Rnd_792x57_m76"];
_commonSMG = ["rhs_weap_scorpion", "rhsgref_20rnd_765x17_vz61"];

_commonPistol = ["rhs_weap_cz99", "rhssaf_mag_15Rnd_9x19_FMJ"];

_commonAT = ["rhs_weap_m80", "rhs_m80_mag"];
_specAT = ["rhs_weap_m80", "rhs_m80_mag"];
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;

_commonRCO = "rhs_acc_1p29";
_commonCCO = "rhs_acc_ekp1";

_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "rhs_acc_pbs1";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 7;
_countMG = 5;
_countSniper = 5;
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
_commonHead = "rhssaf_helmet_m59_85_oakleaf";
_leaderHead = _commonHead;
_officerHead = "BRM_beret_green";
_medicHead = "rhssaf_bandana_oakleaf";
_crewmanHead = "rhs_tsh4";
_pilotHead = "rhs_zsh7a_alt";
_helicrewHead = "rhs_zsh7a_mike";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = "rhssaf_bandana_oakleaf";
_demoHead = "rhssaf_bandana_oakleaf";
_reconHead = "rhssaf_bandana_oakleaf";

_commonUniform = "rhssaf_uniform_m93_oakleaf_summer";
_officerUniform = _commonUniform;
_pilotUniform = "rhssaf_uniform_heli_pilot";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "rhssaf_vest_md99_md2camo_rifleman";
_officerVest = "rhssaf_vest_md99_md2camo";
_ftlVest = "rhssaf_vest_md99_md2camo_rifleman_radio";
_slVest = "rhssaf_vest_md99_md2camo_radio";
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = "rhssaf_vest_md99_md2camo";
_demoVest = "rhssaf_vest_md99_md2camo";
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "";

_commonBackpack = "rhssaf_kitbag_smb";
_bigBackpack = "rhssaf_alice_smb";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_grenade_mkii_mag";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_NSV_Gun_Bag";
_hmgTripod = "RHS_NSV_Tripod_Bag";

_staticAT = "RHS_Metis_Gun_Bag";
_atTripod = "RHS_Metis_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Mi8MTV3_vvs"]
/* Attack Planes     */,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "rhs_mig29sm_vvs"]
/* Heavy Vehicles    */,["rhs_t72ba_tv", "UK3CB_B_T34_CDF", "UK3CB_B_G_T55"]
/* Light Vehicles    */,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/* Medium Vehicles   */,["rhs_btr60_msv", "UK3CB_O_G_MTLB_PKT", "rhsgref_BRDM2", "rhs_bmp1_vv"]
/* Mobile Artillery  */,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/* Transport Helos   */,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/* Static Defence    */,["rhs_Metis_9k115_2_msv", "rhs_Igla_AA_pod_msv", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/* Boats             */,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/* UAV               */,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/* UGV               */,["O_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/* Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "rhssaf_flag_yugoslavia"
/* Objects    */,["O_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Short_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
