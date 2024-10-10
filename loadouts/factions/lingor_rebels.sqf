// INFO ========================================================================
/*
    Lingor Rebels
*/

_factionID = "LINGOR_REBELS";
_factionName = "Lingor Rebels";
_factionStructure = "LOW-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFRENCH];
_defaultFace = [_faceTANOAN];
_defaultName = [_nameFRENCH];
_defaultInsignia = "";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.4,0.6],   [0.5,0.6],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.9,1]];

// WEAPONS =====================================================================

_rifleLIST = [
	_RHSAKM,
	_RHSAKMS,
	_AK74UN,
	_AK74N
];

_commonRIFLE = _rifleLIST selectRandomWeighted [0.3,0.2,0.3,0.2];

_commonRIFLEGL = selectRandom [
	_RHSAKMGL,
	_RHSAKMSGL
];
_commonPISTOL = _Makarov;
_commonMG = _PKM;
_commonAR = _RPK;
_commonMARKSMAN = _M76;
_commonSNIPER = _M76;
_commonAT = _RSHG2;
_specAT = _RPG7;
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;
_commonSMG = _AK74UN;
_commonRCO = "rhs_acc_1p29";
_marksmanSCOPE = "rhs_acc_pso1m21";
_commonCCO = "";
_commonMAGNIFIED = "rhs_acc_pso1m21";
_commonSUPPRESSOR = "rhs_acc_tgpa";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

_nightOnlyNVGs = true;

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
	"H_Bandanna_camo",
	"H_Booniehat_oli",
	"UK3CB_H_Bandanna_Green_Check",
	"BRM_PatrolCap_green",
	""
];

_uniformsLIST = [
	"UK3CB_MDF_B_U_CombatUniform_02_LIZ_OD",
	"UK3CB_MDF_B_U_Crew_Uniform_01",
	"UK3CB_ADM_B_U_Shirt_Pants_01_GRN_WDL_ALT",
	"UK3CB_ADM_B_U_Shirt_Pants_01_GRN_WDL",
	"UK3CB_ADE_O_U_02_I",
	"UK3CB_ADE_O_U_02_C",
	"UK3CB_ADE_O_U_02_G",
	"UK3CB_ADE_O_U_02_H",
	"UK3CB_ADE_O_U_02_D"
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomGOGGLE = ["rhs_scarf","empty"] selectRandomWeighted [0.3,0.7];

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4";
_pilotHEAD = "rhs_zsh7a_mike_green";
_helicrewHEAD = "rhs_zsh7a_mike_green";
_helipilotHEAD = "rhs_zsh7a_mike_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_ALICE_RFL";
_officerVEST = "BRM_ALICE_SL";
_ftlVEST = "BRM_ALICE_SL";
_slVEST = "BRM_ALICE_SL";
_mgVEST = "BRM_ALICE_MG";
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = _commonVEST;

_commonBACKPACK = "UK3CB_B_Alice_K";
_bigBACKPACK = "UK3CB_B_Alice_K";
_specATBACKPACK = "rhs_rpg_2";

if (_assignLoadoutMode && _randomGOGGLE != "empty") then { _unit addGoggles _randomGOGGLE; };

// MISC EQUIPMENT ==============================================================

_grenade = "rhs_grenade_mkii_mag";
_binocular = "rhssaf_zrak_rd7j";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_SPG9_Gun_Bag";
_ATTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["RHS_Ural_Zu23_VMF_01","rhs_zsu234_aa"]
/*  Attack Helos      */,["RHS_Mi24V_vdv"]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,["rhs_t72bb_tv","rhs_t72ba_tv","rhs_t80"]
/*  Light Vehicles    */,["rhsgref_cdf_reg_uaz_open","rhsgref_cdf_reg_uaz","rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_spg9"]
/*  Medium Vehicles   */,["rhs_brm1k_vmf","rhs_bmp2d_vmf","rhs_bmp1_vmf","rhs_btr60_vdv"]
/*  Mobile Artillery  */,[]
/*  Transport Helos   */,["RHS_Mi8mt_vdv"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["rhs_zil131_vmf","rhs_zil131_open_vmf"]
/*  Static Defence    */,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/*  Boats             */,["B_Boat_Transport_01_F"]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,[]
/*  Submarines        */,[]
/*  MRAP Vehicles     */,["rhsgref_BRDM2_vmf"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierTKMilitia_EP1"
/* Objects      */,["rhs_weapon_crate"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["Land_Fort_Watchtower"]
];
