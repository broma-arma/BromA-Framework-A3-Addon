// INFO ========================================================================
/*
    Lingor Army
*/

_factionID = "LINGOR_ARMY";
_factionName = "Lingor Defense Force";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceFRENCH];
_defaultFace = [_faceTANOAN];
_defaultName = [_nameFRENCH];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _FNFAL;
_reconRIFLE = _FNFALRIS;
_commonRIFLEGL = _FNFAL;
_commonGL = ["rhs_weap_m79","rhs_mag_M441_HE"];
_commonPISTOL = _M1911;
_commonMG = _M60E4;
_commonAR = _M60E4;
_commonMARKSMAN = _M14RIS;
_commonSNIPER = _M14RIS;
_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STRINGER;
_weaponsAT = _specAT;
_commonSMG = ["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1T_2mag_SMG"];
_commonRCO = "rhsusf_acc_acog_usmc";
_specATSCOPE = "rhs_optic_maaws";
_marksmanSCOPE = "FHQ_optic_LeupoldERT";
_commonCCO = "";
_commonMAGNIFIED = "FHQ_optic_LeupoldERT";
_commonSUPPRESSOR = "rhsgref_sdn6_suppressor";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
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
    "rhsgref_helmet_M1_bare",
	"rhsgref_helmet_M1_bare_alt01",
	"rhsgref_helmet_M1_painted"
];

_uniformsLIST = [
    "rhsgref_uniform_og107",
	"rhsgref_uniform_og107_erdl"
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = "rhsgref_hat_M1951";
_officerHEAD = "rhssaf_beret_para";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "BRM_SPH4_WHITE";
_helicrewHEAD = "BRM_SPH4_WHITE";
_helipilotHEAD = "BRM_SPH4_WHITE";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_Boonie_Green";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_crewUNIFORM = _commonUNIFORM;
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

_commonBACKPACK = "BRM_SqBackpack_Green";
_bigBACKPACK = "BRM_SqBackpack_Green";
_medicalBACKPACK = "BRM_SqBackpackMED_Green";
_reconBACKPACK = "BRM_PatrolBP_Green";

// MISC EQUIPMENT ==============================================================

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
/* Flag         */ "flag_gal"
/* Objects      */,["rhs_weapon_crate"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["Land_Fort_Watchtower"]
];
