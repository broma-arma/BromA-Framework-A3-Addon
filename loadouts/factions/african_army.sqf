// INFO ========================================================================
/*
    African Army
*/

_factionID = "AFRICAN_ARMY";
_factionName = "African Army";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFRENCH];
_defaultFace = [_faceTANOAN,_faceBLACK];
_defaultName = [_nameFRENCH];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = ["rhs_weap_m14","rhsusf_20Rnd_762x51_m80_Mag"];
_commonRIFLEGL = _commonRIFLE;
_commonGL = ["rhs_weap_m79","rhs_mag_M441_HE"];
_commonPISTOL = _M1911;
_commonMG = ["r3f_fn_mag58","rhsusf_100Rnd_762x51"];
_commonAR = _commonMG;
_commonMARKSMAN = ["hlc_rifle_M1903A1_unertl","hlc_5rnd_3006_1903"];
_commonSNIPER = ["hlc_rifle_M1903A1_unertl","hlc_5rnd_3006_1903"];
_commonAT = _M72A7;
_specAT =_RPG7PGO;
_weaponsAA = _STINGER;
_weaponsAT = _specAT;
_commonSMG = ["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1T_2mag_SMG"];
_commonRCO = "";
_commonCCO = "";
_commonMAGNIFIED = "";
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_nightOnlyNVGs = true;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countSpecAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countSpecATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
	"BRM_M1H_SWDG_GREEN",
	"BRM_M1H_GREEN",
	"BRM_M1H_GHILLIE_GREEN"
];

_randomHEAD = selectRandom _headsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = "BRM_PatrolCap_RHOD";
_officerHEAD = "BRM_PatrolCap_RHOD";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "BRM_SPH4V_WHITE";
_helicrewHEAD = "BRM_SPH4V_WHITE";
_helipilotHEAD = "BRM_SPH4V_WHITE";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_BoonieCOMS_RHOD";

_commonUNIFORM = selectRandom ["BRM_BattleUNI_RHOD","BRM_BattleUNIRS_RHOD"];
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_crewUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_IBA_ALICE_GREEN_RFL";
_officerVEST = "BRM_IBA_ALICE_GREEN_SL";
_ftlVEST = "BRM_IBA_ALICE_GREEN_SL";
_slVEST = "BRM_IBA_ALICE_GREEN_SL";
_mgVEST = "BRM_IBA_ALICE_GREEN_AR";
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "UK3CB_B_Alice_K";
_bigBACKPACK = "UK3CB_B_Alice_K";

// MISC EQUIPMENT =============================================================

_grenade = "rhs_grenade_mkii_mag";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_M2_Gun_Bag";
_HMGTripod = "RHS_M2_Tripod_Bag";

_StaticAT = "rhs_Tow_Gun_Bag";
_ATTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["RHS_Ural_Zu23_VMF_01","rhs_zsu234_aa"]
/*  Attack Helos      */,["RHS_Mi24V_vdv","rhs_uh1h_hidf_gunship"]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,["rhs_t72bb_tv","rhs_t72ba_tv","rhs_t80"]
/*  Light Vehicles    */,["rhsgref_hidf_M998_2dr_fulltop","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025"]
/*  Medium Vehicles   */,["rhsgref_hidf_m113a3_m2"]
/*  Mobile Artillery  */,[]
/*  Transport Helos   */,["RHS_Mi8mt_vdv","rhs_uh1h_hidf","rhs_uh1h_hidf_unarmed"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["rhs_zil131_vmf","rhs_zil131_open_vmf"]
/*  Static Defence    */,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/*  Boats             */,["B_Boat_Transport_01_F"]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,[]
/*  Submarines        */,[]
/*  MRAP Vehicles     */,["rhsusf_M1117_W"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_Blue_F"
/* Objects      */,["rhs_weapon_crate"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["Land_Fort_Watchtower"]
];
