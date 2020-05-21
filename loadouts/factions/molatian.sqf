// INFO ========================================================================
/*
    Mostly equipped with soviet-era weapons and armored vehicles, the Molatian Army seeks
	to protect and serve their nation's sovereign interests in the region of Duala.

*/

_factionID = "MOLATIAN";
_factionName = "Molatian Army";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceBLACK];
_defaultName = [_nameAFRICAN];
_defaultInsignia = "";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK74N;
_commonRIFLEGL = _AK74NGL;
_commonPISTOL = _Makarov;
_commonMG = _PKM;
_commonAR = _RPK;
_commonMARKSMAN = _M76;
_commonSNIPER = _M76;
_commonAT = _RSHG2;
_specAT = _RPG7;
_commonSMG = _AK74UN;
_commonRCO = "rhs_acc_1p29";
_commonCCO = "";
_commonMAGNIFIED = "rhs_acc_pso1m21";
_commonSUPPRESSOR = "rhs_acc_dtk4short";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

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
    "rhs_ssh68",
    "rhs_ssh68",
    "H_Shemag_olive",
    "H_Cap_oli",
	"empty",
    "rhs_ssh68"
];

_uniformsLIST = [
    "U_I_C_Soldier_Para_4_F",
    "U_I_C_Soldier_Para_1_F",
    "U_I_C_Soldier_Para_3_F",
    "U_I_C_Soldier_Para_2_F"
];

_vestsLIST = [
	"V_TacChestrig_cbr_F",
	"V_TacChestrig_grn_F",
	"V_TacChestrig_oli_F"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_beret_red";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4";
_pilotHEAD = "rhs_zsh7a_mike_green";
_helicrewHEAD = "rhs_zsh7a_mike_green";
_helipilotHEAD = "rhs_zsh7a_mike_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = "U_I_C_Soldier_Camo_F";
_pilotUNIFORM = "U_I_C_Soldier_Camo_F";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_I_C_Soldier_Camo_F";
_crewUNIFORM = "U_I_C_Soldier_Camo_F";
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
_bigBACKPACK = "TRYK_B_Alicepack";

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
/*  Anti Air Vehicles    */      ["RHS_Ural_Zu23_VMF_01","rhs_zsu234_aa"]
/*  Attack Helos 	 */	,["RHS_Mi24V_vdv"]
/*  Attack Planes 	 */	,[]
/*  Heavy Vehicles 	 */	,["rhs_t72bb_tv","rhs_t72ba_tv","rhs_t80"]
/*  Light Vehicles 	 */	,["rhsgref_cdf_reg_uaz_open","rhsgref_cdf_reg_uaz","rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_spg9"]
/*  Medium Vehicles 	 */	,["rhs_brm1k_vmf","rhs_bmp2d_vmf","rhs_bmp1_vmf","rhs_btr60_vdv"]
/*  Mobile Artillery     */	,[]
/*  Transport Helos      */	,["RHS_Mi8mt_vdv"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["rhs_zil131_vmf","rhs_zil131_open_vmf"]
/*  Static Defence       */	,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/*  Boats                */	,["B_Boat_Transport_01_F"]
/*  UAV                  */	,[]
/*  UGV                  */	,[]
/*  Support              */	,[]
/*  Submarines           */	,[]
/*  MRAP Vehicles        */     ,["rhsgref_BRDM2_vmf"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierTKMilitia_EP1",
/* Objects      */ ["rhs_weapon_crate"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
