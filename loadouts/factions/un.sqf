
// INFO ========================================================================
/*

    The United Nations Charter gives the United Nations Security Council the power and responsibility
	to take collective action to maintain international peace and security. For this reason, the international
	community usually looks to the Security Council to authorize peacekeeping operations.

	Remember to not use your weapon until the UN Secretariate gives you permission to fire.

*/

_factionID = "UN";
_factionName = "United Nations Troops";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceALTIAN, _voiceAMERICAN, _voiceBRITISH, _voiceFARSI, _voiceRUSSIAN, _voiceCHINESE];
_defaultFace = [_faceGREEK, _faceWHITE, _faceBLACK, _faceASIAN, _facePERSIAN];
_defaultName = [_nameAMERICAN]; // incomplete list
_defaultInsignia = "USP_PATCH_UN_BELIEVE";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _FNFAL;
_commonRIFLEGL = _M16A2GL;
_commonPISTOL = _Makarov;
_commonMG = _PKM;
_commonMARKSMAN = _SVDS;
_commonSNIPER = _SVDS;
_commonAT = _RPG26;
_specAT = _RPG7PGO;
_commonSMG = _AKS74U;
_commonRCO = "UK3CB_BAF_SUSAT";
_commonCCO = "RH_cmore";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "rhs_acc_1pn93_1";
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

_commonHEAD = "MNP_Helmet_PAGST_UN";
_leaderHEAD = _commonHEAD;
_officerHEAD = "H_MilCap_blue";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_helmet";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = "LOP_U_US_Fatigue_02";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "LOP_V_6B23_6Sh92_UN";
_officerVEST = "LOP_V_6B23_CrewOfficer_UN";
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_heliVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "TRYK_B_BAF_BAG_mcamo";
_bigBACKPACK = "B_Carryall_mcamo";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_Kord_Gun_Bag";
_HMGTripod = "RHS_Kord_Tripod_Bag";

_StaticAT = "RHS_SPG9_Gun_Bag";
_ATTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles    */      ["LOP_UN_ZSU234"]
/*  Attack Helos 	 */	,["rhsgref_un_Mi24V","rhsgref_un_Mi24V_UPK", "LOP_UN_Mi8MTV3_FAB"]
/*  Attack Planes        */	,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles 	 */	,[]
/*  Light Vehicles 	 */	,["rhsgref_un_uaz", "LOP_UN_UAZ_DshKM", "LOP_UN_UAZ_Open", "LOP_UN_UAZ_SPG"]
/*  Medium Vehicles 	 */	,["rhsgref_un_btr70", "LOP_UN_BTR70", "LOP_UN_BTR60", "LOP_UN_BMP1","LOP_UN_BMP1","LOP_UN_BMP2","LOP_UN_BMP2D"]
/*  Mobile Artillery     */	,["LOP_UN_BM21"]
/*  Transport Helos      */	,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["rhsgref_un_ural","LOP_UN_Ural"]
/*  Static Defence       */	,["rhsgref_ins_g_Igla_AA_pod","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","rhsgref_ins_g_SPG9","rhsgref_ins_g_ZU23"]
/*  Boats                */	,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,["B_UGV_01_F"]
/*  Support              */	,["B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */     ,["rhsgref_un_m1117"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_UNO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Cargo_HQ_V1_F"]
];

// =============================================================================