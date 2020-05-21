// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "LINGOR_ARMY";
_factionName = "Lingor Defense Force";
_factionStructure = "MEDIUM-TIER";

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

_commonRIFLE = _FNFALPARARIS;
_commonRIFLEGL = _FNFALPARARIS;
_commonPISTOL = _M9;
_commonMG = _M60E4;
_commonAR = _M60E4;
_commonMARKSMAN = _M14RIS;
_commonSNIPER = _M14RIS;
_commonAT = _M72A7;
_specAT = _GUSTAV;
_commonSMG = _SCORPION;
_commonRCO = "rhsusf_acc_ACOG2_USMC";
_commonCCO = "rhsusf_acc_mrds";
_commonMAGNIFIED = "FHQ_optic_LeupoldERT";
_commonSUPPRESSOR = "hlc_muzzle_300blk_KAC";
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
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
    "rhssaf_helmet_m97_olive_nocamo",
	"rhssaf_helmet_m97_olive_nocamo_black_ess",
	"rhssaf_helmet_m97_olive_nocamo_black_ess_bare"
];

_uniformsLIST = [
    "rhsgref_uniform_og107",
	"rhsgref_uniform_og107_erdl"
];

_vestsLIST = [
	"rhssaf_vest_md99_md2camo_radio",
	"rhssaf_vest_md99_md2camo_rifleman",
	"rhssaf_vest_md99_md2camo_rifleman_radio"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "rhsgref_hat_M1951";
_officerHEAD = "rhssaf_beret_para";
_medicHEAD = "rhssaf_booniehat_md2camo";
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhssaf_booniehat_md2camo";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "TRYK_B_Alicepack";
_bigBACKPACK = "rhssaf_alice_smb";

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles    */      ["RHS_Ural_Zu23_VMF_01","rhs_zsu234_aa"]
/*  Attack Helos 	 */	,["RHS_Mi24V_vdv","rhs_uh1h_hidf_gunship"]
/*  Attack Planes 	 */	,[]
/*  Heavy Vehicles 	 */	,["rhs_t72bb_tv","rhs_t72ba_tv","rhs_t80"]
/*  Light Vehicles 	 */	,["rhsgref_hidf_M998_2dr_fulltop","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025_m2","rhsgref_hidf_m1025"]
/*  Medium Vehicles 	 */	,["rhsgref_hidf_m113a3_m2"]
/*  Mobile Artillery     */	,[]
/*  Transport Helos      */	,["RHS_Mi8mt_vdv","rhs_uh1h_hidf","rhs_uh1h_hidf_unarmed"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["rhs_zil131_vmf","rhs_zil131_open_vmf"]
/*  Static Defence       */	,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/*  Boats                */	,["B_Boat_Transport_01_F"]
/*  UAV                  */	,[]
/*  UGV                  */	,[]
/*  Support              */	,[]
/*  Submarines           */	,[]
/*  MRAP Vehicles        */     ,["rhsusf_M1117_W"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "flag_gal",
/* Objects      */ ["rhs_weapon_crate"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
