/*
    Pakistani Army
*/

_factionID = "PAKISTAN";
_factionName = "Pakistani Army";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameARABIC];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _G3A3RIS;
_commonRifleGL = _G3KA4GL;
_reconRifle = _AUGA3;
_commonAR = _MG3;
_commonMG = _MG3;
_commonMarksman = _G3SG1RIS;
_commonSniper = ["UK3CB_PSG1A1", "UK3CB_G3_20rnd_762x51_GT"];
_commonSMG = ["UK3CB_P90C_black", "UK3CB_P90_50rnd_570x28_Magazine_GT"];

_commonPistol = _M9;

_commonAT = _RPG26;
_specAT = _RPG7;

_commonRCO = "rhsusf_acc_ELCAN";
_commonCCO = "rhsusf_acc_EOTECH";

_marksmanScope = "rhsusf_acc_M8541";
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

_commonUniform = "rhs_uniform_emr_des_patchless";
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
_pilotVest = "V_BandollierB_khk";

_commonBackpack = "B_AssaultPack_cbr";
_bigBackpack = "B_Kitbag_cbr";

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
/* Anti Air Vehicles */ ["O_PGZ09_AA"]
/* Attack Helos      */,["RHS_Mi24V_vvs"]
/* Attack Planes     */,["PRACS_F16CJR"]
/* Heavy Vehicles    */,["rhsgref_cdf_b_t80u_tv"]
/* Light Vehicles    */,["rhsusf_M1220_M2_usarmy_d"]
/* Medium Vehicles   */,["UK3CB_KRG_B_M113tank_M2_90"]
/* Mobile Artillery  */,["rhsusf_m109d_usarmy"]
/* Transport Helos   */,["RHS_UH1Y_d"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["UK3CB_KRG_B_MTVR_Open","UK3CB_KRG_B_MTVR_Closed"]
/* Static Defence    */,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/* Boats             */,["B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/* Support           */,["UK3CB_KRG_B_MTVR_Repair","UK3CB_KRG_B_MTVR_Ammo","UK3CB_KRG_B_MTVR_Fuel", "UK3CB_KRG_B_MTLB_AMB"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_M1220_M2_usarmy_d"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
