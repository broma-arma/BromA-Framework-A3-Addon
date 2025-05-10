/*
    French armed forces with now camo selections.

    Camo: "CCE", "DAGUET", "WINTER" (BRM_FMK_LoadoutCamo_FRANCE)
*/

_factionID = "FRANCE";
_factionName = "French armed forces";
_factionStructure = "FRANCE";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFrench];
_defaultFace = [_faceWhite, _faceBlack, _faceAsian];
_defaultName = [_nameFrench];
_defaultInsignia = "USP_PATCH_FRA_FLAG_IR";
_defaultColor = "blue";

// CAMO ========================================================================
// BRM_FMK_UNIFORMS_FRACammo - Backward compatibility (royal_co26_sable_v2.tem_kujari)
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_FRANCE", missionNamespace getVariable ["BRM_FMK_UNIFORMS_FRACammo", "CCE"]];

// WEAPONS =====================================================================
_commonRifle = ["UK3CB_FAMAS_F1", "UK3CB_FAMAS_25rnd_556x45"];
_commonRifleGL = ["UK3CB_FAMAS_F1_GLM203", "UK3CB_FAMAS_25rnd_556x45", "1Rnd_HE_Grenade_shell"];
_reconRifle = ["rhs_weap_hk416d145", "rhs_mag_30Rnd_556x45_M855A1_Stanag"];
_commonAR = ["rhs_weap_minimi_para_railed", "rhsusf_200Rnd_556x45_box"];
_commonMG = _M240G;
_commonMarksman = ["arifle_SPAR_03_blk_F", "20Rnd_762x51_Mag"];
_commonSniper = ["rhs_weap_m82a1", "rhsusf_mag_10Rnd_STD_50BMG_mk211"];
_commonSMG = ["UK3CB_MP5N", "UK3CB_MP5_30Rnd_9x19_Magazine"];

_commonPistol = ["rhsusf_weap_m9", "rhsusf_mag_15Rnd_9x19_JHP"];

_commonAT = ["rhs_weap_M136", "rhs_m136_mag"];
_specAT = ["rhs_weap_fgm148", "rhs_fgm148_magazine_AT"];
_weaponsAA = _STINGER;
_weaponsAT = _specAT;

_commonRCO = "optic_MRCO";
_commonCCO = "rhsusf_acc_compm4";

_rifleScope = _commonCCO;
_reconScope = "rhsusf_acc_su230";
_mgScope = "rhsusf_acc_ELCAN";
_marksmanScope = "optic_LRPS";
_sniperScope = "rhsusf_acc_premier";

_commonSuppressor = "rhsusf_acc_rotex5_grey";
_commonPistolSuppressor = "muzzle_snds_L";

_commonRail = "rhsusf_acc_anpeq15A";

// AMMO COUNT ==================================================================
_countRifle = 13;
_countRifleLow = 7;
_countAR = 6;
_countMG = 4;
_countSniper = 8;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 4;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 30;
_countSniperCargo = 30;
_countSpecATCargo = 15;
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
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom ([
	["BRM_LWH_COMS_"+_camo, "BRM_LWH_MASK_COMS_"+_camo],
	["UK3CB_CSAT_S_O_H_6b47_WIN", "UK3CB_CSAT_S_O_H_6b47_bala_WIN", "UK3CB_CSAT_S_O_H_6b47_ess_WIN", "UK3CB_CSAT_S_O_H_6b47_ess_bala_WIN"]
] select (_camo == "WINTER"));
_leaderHead = _commonHead;
_officerHead = ["BRM_PatrolCap_"+_camo, _commonHead] select (_camo == "WINTER");
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_ess";
_pilotHead = "rhsusf_hgu56p";
_helicrewHead = "rhsusf_hgu56p_mask";
_helipilotHead = "rhsusf_hgu56p";
_sniperHead = ["BRM_Booniehat_"+_camo, _commonHead] select (_camo == "WINTER");
_demoHead = _commonHead;
_reconHead = ["BRM_ACH_MASK_COMS_"+_camo, _commonHead] select (_camo == "WINTER");

_commonUniform = [selectRandom ["BRM_BattleUNI_"+_camo, "BRM_BattleUNIRS_"+_camo], "UK3CB_ION_B_U_CombatSmock_01_WIN"] select (_camo == "WINTER");
_officerUniform = _commonUniform;
_pilotUniform = "U_B_PilotCoveralls";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = "UK3CB_CHC_C_U_Overall_01";
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["BRM_Protec_BROWN_RFL", "UK3CB_V_MBAV_RIFLEMAN_WIN"] select (_camo == "WINTER");
_officerVest = ["BRM_Protec_BROWN_SL", "UK3CB_V_MBAV_GRENADIER_WIN"] select (_camo == "WINTER");
_ftlVest = ["BRM_Protec_BROWN_TL", "UK3CB_V_MBAV_GRENADIER_WIN"] select (_camo == "WINTER");
_slVest = _officerVest;
_mgVest = ["BRM_Protec_BROWN_MG", "UK3CB_V_MBAV_MG_WIN"] select (_camo == "WINTER");
_grenadierVest = ["BRM_Protec_BROWN_GL", "UK3CB_V_MBAV_GRENADIER_WIN"] select (_camo == "WINTER");
_medicVest = [_commonVest, "UK3CB_V_MBAV_MEDIC_WIN"] select (_camo == "WINTER");
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = ["BRM_RRV_BROWN_REC1", "UK3CB_V_MBAV_LIGHT_WIN"] select (_camo == "WINTER");
_pilotVest = "";

_commonBackpack = ["BRM_PatrolBP_"+_camo, "UK3CB_ION_B_B_ASS_WIN_01"] select (_camo == "WINTER");
_bigBackpack = ["BRM_PatrolBPH_"+_camo, "UK3CB_ION_B_B_RIF_WIN_01"] select (_camo == "WINTER");

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
/* Anti Air Vehicles */ ["RHS_M6_wd"]
/* Attack Helos      */,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
/* Attack Planes     */,["I_Plane_Fighter_04_F"]
/* Heavy Vehicles    */,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
/* Light Vehicles    */,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
/* Medium Vehicles   */,["B_APC_Wheeled_01_cannon_F"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy"]
/* Transport Helos   */,["RHS_CH_47F_10", "I_Heli_Transport_02_F", "O_Heli_Light_02_unarmed_F"]
/* Transport Planes  */,["RHS_C130J"]
/* Transport Trucks  */,["rhsusf_M977A4_usarmy_wd"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_M1232_M2_usarmy_wd", "rhsusf_M1237_M2_usarmy_wd"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "BRM_Flag_France"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
