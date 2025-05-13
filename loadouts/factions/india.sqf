/*
    Indian Army
*/

_factionID = "INDIA";
_factionName = "Indian Army";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _AK103ZENITRIS;
_commonRifleGL = _AK103RISGL;
_reconRifle = ["arifle_TRG21_F", _30rnd556STANAG];
_commonAR = _M240B;
_commonMG = _PKM;
_commonMarksman = ["UK3CB_PSG1A1", "UK3CB_G3_20rnd_762x51_GT"];
_commonSniper = ["UK3CB_PSG1A1", "UK3CB_G3_20rnd_762x51_GT"];
_commonSMG = ["FP_smg_sterling", "FP_30Rnd_9x19_L2A3_Sterling"];

_commonPistol = ["FP_Browning_HP", "FP_13Rnd_9x19_Browning_HP"];

_commonAT = _AT4;
_specAT = _GUSTAV;

_commonRCO = "UK3CB_BAF_TA31F";
_commonCCO = "rhs_acc_okp7_picatinny";

_rifleScope = _commonCCO;
_marksmanScope = "uk3cb_optic_accupoint_g3";
_sniperScope = "uk3cb_optic_accupoint_g3";

_commonSuppressor = "";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 5;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 30;
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
_commonHead = "BRM_6B7_BROWN";
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_ess";
_pilotHead = "rhsusf_hgu56p";
_helicrewHead = "rhsusf_hgu56p_mask";
_helipilotHead = "rhsusf_hgu56p";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_6B7_GHILLIE_BROWN";

_commonUniform = "UK3CB_CSAT_A_O_U_SF_CombatUniform";
_officerUniform = "UK3CB_CSAT_A_O_U_SF_CombatUniform_Shortsleeve";
_pilotUniform = "UK3CB_TKA_I_U_H_Pilot_03_DES";
_sniperUniform = "U_I_FullGhillie_ard";
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_LBT_BROWN_RFL";
_officerVest = "BRM_LBT_BROWN_SL";
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = "BRM_LBT_BROWN_MG";
_grenadierVest = "BRM_LBT_BROWN_GL";
_medicVest = "BRM_LBT_BROWN_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest= "V_BandollierB_khk";

_commonBackpack = "B_AssaultPack_cbr";
_bigBackpack = "B_Carryall_cbr";
_reconBackpack = _bigBackpack;

// MISC EQUIPMENT ==============================================================
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
/* Anti Air Vehicles */ ["rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_AH64D"]
/* Attack Planes     */,["rhs_mig29sm_vvs"]
/* Heavy Vehicles    */,["rhs_t90saa_tv"]
/* Light Vehicles    */,["rhsusf_m1025_d_s_m2"]
/* Medium Vehicles   */,["rhs_bmp2d_vmf"]
/* Mobile Artillery  */,["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"]
/* Transport Helos   */,["FP_AlouetteIII_tr"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["UK3CB_TKA_B_Ural_Open", "UK3CB_TKA_B_Ural_Closed"]
/* Static Defence    */,["B_HMG_01_high_F", "B_static_AA_F", "B_static_AT_F", "B_Mortar_01_F"]
/* Boats             */,["B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["UK3CB_TKA_B_Ural_Repair", "UK3CB_TKA_B_Ural_Ammo", "UK3CB_TKA_B_Ural_Fuel", "UK3CB_TKA_B_Hilux_Ambulance"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_CGRCAT1A2_M2_usmc_d"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
