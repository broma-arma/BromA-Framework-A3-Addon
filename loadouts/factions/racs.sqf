/*
    The Royal Army Corps of Sahrani is the main military force of the
    Kingdom of South Sahrani, engaged in a fight against their communist neighbours -
    the Sahrani Liberation Army located north of the island.

    They are aligned with US forces, borrowing their equipment and tactics.
*/

_factionID = "RACS";
_factionName = "Royal Army Corps of Sahrani";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceBritish];
_defaultFace = [_faceWhite];
_defaultName = [_nameSpanish];
_defaultInsignia = "USP_PATCH_MORALE_LAMBDA_OCP";
_defaultColor = "white";

// WEAPONS =====================================================================
_commonRifle = _G36A1;
_commonRifleGL = _G36A1GL;
_reconRifle = _G36C;
_commonAR = ["r3f_fn_mag58", "rhsusf_100Rnd_762x51"];
_commonMG = _commonAR;
_commonMarksman = _commonRifle;
_commonSniper = ["rhs_weap_m24sws_d", "rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonSMG = _MP5A2;

_commonPistol = _M9;

_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = _FHQACOG;
_commonCCO = "hlc_optic_g36export35x";

_rifleScope = "hlc_optic_g36dualoptic15x";
_reconScope = "rhsusf_acc_acog2";
_marksmanScope = "hlc_optic_g36dualoptic35x";
_sniperScope = "rhsusf_acc_m8541_d";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsusf_acc_nt4_black";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 5;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 15;
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
_commonHead = selectRandom ["BRM_PASGT_NV_COMS_DBDU", "BRM_PASGT_NVSWDG_DBDU"];
_leaderHead = _commonHead;
_officerHead = "BRM_PatrolCap_DBDU";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "BRM_SPH4V_RACS";
_helicrewHead = "BRM_SPH4V_RACS";
_helipilotHead = "BRM_SPH4V_RACS";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_BoonieCOMS_DBDU";

_commonUniform = selectRandom ["BRM_BattleUNI_DBDU", "BRM_BattleUNIRS_DBDU"];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_03";
_sniperUniform = "U_I_FullGhillie_sard";
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_03";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_MTV_RFL";
_officerVest = _commonVest;
_ftlVest = "BRM_MTV_GL";
_slVest = _commonVest;
_mgVest = "BRM_MTV_MG";
_grenadierVest = "BRM_MTV_GL";
_medicVest = "BRM_MTV_MED";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_SqBackpack_Brown";
_bigBackpack = "BRM_SqBpH_Brown";
_reconBackpack = "BRM_SqBpH_Brown";

// MISC EQUIPMENT =============================================================
_NVG = "rhsusf_ANPVS_14";

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
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6"]
/* Attack Helos      */,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
/* Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/* Heavy Vehicles    */,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
/* Light Vehicles    */,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
/* Medium Vehicles   */,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
/* Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
/* Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "rhsusf_CH53E_USMC_D", "RHS_UH1Y_FFAR_D", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
/* Transport Trucks  */,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_d", "rhsusf_M977A4_AMMO_BKIT_usarmy_d", "B_Truck_01_fuel_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierSouth"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
