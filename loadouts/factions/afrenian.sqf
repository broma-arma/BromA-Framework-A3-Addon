/*
    Located on Island Duala, Afrenia is the neighbour country of Molatia, the two
    of them has been at war for a long time, their border is considered as a "DMZ".
*/

_factionID = "AFRENIAN";
_factionName = "Afrenian Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceBlack];
_defaultName = [_nameAFRICAN];
_defaultInsignia = "USP_PATCH_MORALE_BULL_SKULL_BLK";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _AUGAA1;
_commonRifleGL = _commonRifle;
_commonGL = _M320;
_commonAR = _AUGAA1HBAR;
_commonMG = _M60E4;
_commonMarksman = _STG58;
_commonSniper = ["rhs_weap_t5000", "rhs_5Rnd_338lapua_t5000"];
_commonSMG = _AUGA1PARA;

_commonPistol = ["RH_p226", "RH_15Rnd_9x19_SIG"];

_commonAT = ["rhs_weap_m72a7", "rhs_m72a7_mag"];
_specAT = ["rhs_weap_smaw", "rhs_mag_smaw_HEAA"];
_weaponsAA = _STINGER;
_weaponsAT = _specAT;

_commonRCO = "";
_commonCCO = _FHQMICROCCOLOW;

_sniperScope = "rhsusf_acc_premier_low";

_specATScope = "rhs_weap_optic_smaw";

_commonSuppressor = "rhsusf_acc_nt4_black";
_commonPistolSuppressor = "RH_suppr9";

// AMMO COUNT ==================================================================
_countRifle = 10;
_countRifleLow = 6;
_countAR = 7;
_countMG = 4;
_countSniper = 9;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 3;
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
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom ["rhsusf_ach_bare", "rhsusf_ach_bare_tan", "rhsusf_ach_helmet_M81", "H_Bandanna_sand"];
_leaderHead = _commonHead;
_officerHead = "H_Beret_blk";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_ess";
_pilotHead = "rhsusf_hgu56p";
_helicrewHead = "rhsusf_hgu56p_mask";
_helipilotHead = "rhsusf_hgu56p";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "rhsusf_ach_helmet_headset_ocp";

_commonUniform = "BRM_BattleUNI_JIEITAIW";
_officerUniform = _commonUniform;
_pilotUniform = "U_B_PilotCoveralls";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = "UK3CB_CHC_C_U_Overall_01";
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = "rhs_uniform_g3_blk";

_commonVest = selectRandom ["rhsgref_6b23_ttsko_digi_rifleman", "rhsgref_6b23_ttsko_digi"];
_officerVest = "rhsgref_6b23_ttsko_digi_officer";
_ftlVest = _commonVest;
_slVest = "rhsgref_6b23_ttsko_digi_nco";
_mgVest = _commonVest;
_grenadierVest = "rhs_6b23_6sh116_vog_od";
_medicVest = "rhsgref_6b23_ttsko_digi_medic";
_demoVest = _commonVest;
_marksmanVest = "rhsgref_6b23_ttsko_digi_sniper";
_reconVest = "rhsusf_spc_patchless_radio";
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_PatrolBP_JIEITAIW";
_bigBackpack = "BRM_PatrolBP_JIEITAIW";

// MISC EQUIPMENT =============================================================
_NVG = _NVGEN2;

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
/* Anti Air Vehicles */ ["RHS_M6"]
/* Attack Helos      */,["RHS_AH64D_GS", "RHS_AH64D", "RHS_AH1Z_GS", "RHS_AH1Z_CS"]
/* Attack Planes     */,["RHS_A10"]
/* Heavy Vehicles    */,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd"]
/* Light Vehicles    */,["rhsusf_m1025_w_m2", "rhsusf_m998_w_2dr"]
/* Medium Vehicles   */,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy"]
/* Transport Helos   */,["I_Heli_Transport_02_F"]
/* Transport Planes  */,["RHS_C130J"]
/* Transport Trucks  */,["rhs_zil131_vdv", "rhs_zil131_open_vdv"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["I_Truck_02_medical_F", "I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_box_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_M1117_W", "rhsusf_m113_usarmy_M240"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
