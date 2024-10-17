/*
    Lingor Army
*/

_factionID = "LINGOR_ARMY";
_factionName = "Lingor Defense Force";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFrench];
_defaultFace = [_faceTanoan];
_defaultName = [_nameFrench];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _FNFAL;
_commonRifleGL = _FNFAL;
_reconRifle = _FNFALRIS;
_commonGL = ["rhs_weap_m79", "rhs_mag_M441_HE"];
_commonAR = _M60E4;
_commonMG = _M60E4;
_commonMarksman = _M14RIS;
_commonSniper = _M14RIS;
_commonSMG = ["rhs_weap_m3a1", "rhsgref_30rnd_1143x23_M1T_2mag_SMG"];

_commonPistol = _M1911;

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _specAT;

_commonRCO = "rhsusf_acc_acog_usmc";
_commonCCO = "";

_marksmanScope = _FHQLEOPOLD;
_sniperScope = _FHQLEOPOLD;

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "rhsgref_sdn6_suppressor";
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
_commonHead = selectRandom ["rhsgref_helmet_M1_bare", "rhsgref_helmet_M1_bare_alt01", "rhsgref_helmet_M1_painted"];
_leaderHead = "rhsgref_hat_M1951";
_officerHead = "rhssaf_beret_para";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "BRM_SPH4_WHITE";
_helicrewHead = "BRM_SPH4_WHITE";
_helipilotHead = "BRM_SPH4_WHITE";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_Boonie_Green";

_commonUniform = selectRandom ["rhsgref_uniform_og107", "rhsgref_uniform_og107_erdl"];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = "U_B_T_FullGhillie_tna_F";
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_IBA_ALICE_GREEN_RFL";
_officerVest = "BRM_IBA_ALICE_GREEN_SL";
_ftlVest = "BRM_IBA_ALICE_GREEN_SL";
_slVest = "BRM_IBA_ALICE_GREEN_SL";
_mgVest = "BRM_IBA_ALICE_GREEN_AR";
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "BRM_SqBackpack_Green";
_bigBackpack = "BRM_SqBackpack_Green";
_medicalBackpack = "BRM_SqBackpackMED_Green";
_reconBackpack = "BRM_PatrolBP_Green";

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_grenade_mkii_mag";
_NVG = "rhsusf_ANPVS_15";

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
/* Anti Air Vehicles */ ["RHS_Ural_Zu23_VMF_01", "rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Mi24V_vdv", "rhs_uh1h_hidf_gunship"]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,["rhs_t72bb_tv", "rhs_t72ba_tv", "rhs_t80"]
/* Light Vehicles    */,["rhsgref_hidf_M998_2dr_fulltop", "rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025_m2", "rhsgref_hidf_m1025"]
/* Medium Vehicles   */,["rhsgref_hidf_m113a3_m2"]
/* Mobile Artillery  */,[]
/* Transport Helos   */,["RHS_Mi8mt_vdv", "rhs_uh1h_hidf", "rhs_uh1h_hidf_unarmed"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["rhs_zil131_vmf", "rhs_zil131_open_vmf"]
/* Static Defence    */,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/* Boats             */,["B_Boat_Transport_01_F"]
/* UAV               */,[]
/* UGV               */,[]
/* Support           */,[]
/* Submarines        */,[]
/* MRAP Vehicles     */,["rhsusf_M1117_W"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "flag_gal"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
