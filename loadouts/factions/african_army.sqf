/*
    African Army
*/

_factionID = "AFRICAN_ARMY";
_factionName = "African Army";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFrench];
_defaultFace = [_faceTanoan, _faceBlack];
_defaultName = [_nameFrench];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = ["rhs_weap_m14", "rhsusf_20Rnd_762x51_m80_Mag"];
_commonRifleGL = _commonRifle;
_commonGL = ["rhs_weap_m79", "rhs_mag_M441_HE"];
_commonAR = ["BRM_FNMAG", "BRM_MAG_100rndBoxT"];
_commonMG = _commonAR;
_commonMarksman = ["UK3CB_M1903A1_unertl", "UK3CB_M1903A1_3006_5rnd_Magazine_R"];
_commonSniper = ["UK3CB_M1903A1_unertl", "UK3CB_M1903A1_3006_5rnd_Magazine_R"];
_commonSMG = ["rhs_weap_m3a1", "rhsgref_30rnd_1143x23_M1T_2mag_SMG"];

_commonPistol = _M1911;

_commonAT = _M72A7;
_specAT =_RPG7PGO;
_weaponsAA = _STINGER;
_weaponsAT = _specAT;

_commonRCO = "";
_commonCCO = "";

_sniperScope = "";

_commonSuppressor = "";
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
_commonHead = selectRandom ["BRM_M1H_SWDG_GREEN", "BRM_M1H_GREEN", "BRM_M1H_GHILLIE_GREEN"];
_leaderHead = "BRM_PatrolCap_RHOD";
_officerHead = "BRM_PatrolCap_RHOD";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "BRM_SPH4V_WHITE";
_helicrewHead = "BRM_SPH4V_WHITE";
_helipilotHead = "BRM_SPH4V_WHITE";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "BRM_BoonieCOMS_RHOD";

_commonUniform = selectRandom ["BRM_BattleUNI_RHOD", "BRM_BattleUNIRS_RHOD"];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = "U_B_T_FullGhillie_tna_F";
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = "UK3CB_CHC_C_U_Overall_01";
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

_commonBackpack = "UK3CB_B_Alice_K";
_bigBackpack = "UK3CB_B_Alice_K";

// MISC EQUIPMENT =============================================================
_grenade = "rhs_grenade_mkii_mag";
_NVG = "rhsusf_ANPVS_15";
_nightOnlyNVGs = true;

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
/* Flag       */ "Flag_Blue_F"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
