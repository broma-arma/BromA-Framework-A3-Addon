// INFO ========================================================================
/*
    Believed to be chiefly composed of former and defected members of the
    Altis Armed Forces, disparate fragments of opposition to the 2026 Kavala
    coup d'etat joined together in the grind of bloody civil war.
*/

_factionID = "FIA";
_factionName = "Freedom and Independence Army";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceALTIAN];
_defaultFace = [_faceGREEK];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_rifleList = [_TRG, _Mk20, _Mk20Camo, _Mk20C, _Mk20CCamo];
_rifleGLList = [_Mk20GL, _Mk20GLCamo, _TRGGL];

_randomRifle = selectRandom _rifleList;
_randomRifleGL = selectRandom _rifleGLList;

_commonRIFLE = _randomRifle;
_commonRIFLEGL = _randomRifleGL;
_commonPISTOL = _ACP45;
_commonAR = _Mk200;
_commonMG = _M240B;
_commonMARKSMAN = _Mk18;
_commonSNIPER = _Mk18;
_commonAT = _RPG42;
_specAT = _RPG42;
_commonSMG = _PDW;
_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_acp";
_NVG = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 4;
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
_countArCARGO = 20;
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
    "H_Bandanna_khk",
    "H_Bandanna_mcamo",
    "H_Bandanna_sgg",
    "H_Bandanna_sand",
    "H_Cap_blk",
    "H_Cap_blu",
    "H_Cap_oli_hs",
    "H_Shemag_olive",
    "H_Shemag_olive_hs",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk"
];

_uniformsLIST = [
    "U_BG_Guerrilla_6_1",
    "U_BG_Guerilla1_1",
    "U_BG_Guerilla2_2",
    "U_BG_Guerilla2_1",
    "U_BG_Guerilla2_3",
    "U_BG_Guerilla3_1",
    "U_BG_leader",
    "U_C_HunterBody_grn",
    "U_I_G_Story_Protagonist_F"
];

_vestsLIST = [
    "V_TacVest_blk",
    "V_TacVest_brn",
    "V_TacVest_camo",
    "V_TacVest_khk",
    "V_TacVest_oli"
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomVEST = selectRandom _vestsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = "H_Watchcap_blk";
_officerHEAD = "empty";
_medicHEAD = _commonHEAD;
_crewmanHEAD = _commonHEAD;
_pilotHEAD = _commonHEAD;
_helicrewHEAD = _commonHEAD;
_helipilotHEAD = _commonHEAD;
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_Booniehat_khk_hs";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = _commonUNIFORM;
_sniperUNIFORM = _commonUNIFORM;
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
_pilotVEST = "V_BandollierB_blk";

_commonBACKPACK = "B_AssaultPack_dgtl";
_bigBACKPACK = "B_Carryall_oli";

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
/*  Anti Air Vehicles */	 ["rhsgref_cdf_b_zsu234"]
/*  Attack Helos      */	,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */	,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */	,["rhsgref_cdf_b_t72ba_tv", "rhsgref_cdf_b_t72ba_tv"]
/*  Light Vehicles    */	,["B_G_Offroad_01_armed_F", "B_G_Offroad_01_armed_F", "rhsgref_cdf_b_reg_uaz_open", "rhsgref_cdf_b_reg_uaz_spg9"]
/*  Medium Vehicles   */	,["rhsgref_cdf_b_bmd1", "rhsgref_cdf_b_bmd1k", "rhsgref_cdf_b_bmd1p", "rhsgref_cdf_b_bmd1","rhsgref_cdf_b_bmd1k","rhsgref_cdf_b_bmd1p","rhsgref_cdf_b_bmd1pk","rhsgref_cdf_b_bmd2","rhsgref_cdf_b_bmd2k","rhsgref_cdf_b_bmp1","rhsgref_cdf_b_bmp1d","rhsgref_cdf_b_bmp1k","rhsgref_cdf_b_bmp1p","rhsgref_cdf_b_bmp2","rhsgref_cdf_b_bmp2d","rhsgref_cdf_b_bmp2k", "rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
/*  Mobile Artillery  */	,["rhsgref_cdf_b_reg_BM21", "rhsgref_cdf_b_reg_BM21"]
/*  Transport Helos   */	,["rhsgref_cdf_b_reg_Mi8amt", "rhsgref_cdf_b_reg_Mi17Sh"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["B_G_Van_01_transport_F", "rhsgref_cdf_b_ural_Zu23"]
/*  Static Defence    */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_G_Mortar_01_F", "rhsgref_cdf_b_Igla_AA_pod", "rhsgref_cdf_b_DSHKM", "rhsgref_cdf_b_DSHKM_Mini_TriPod", "rhsgref_cdf_b_NSV_TriPod", "rhsgref_cdf_b_SPG9", "rhsgref_cdf_b_SPG9M", "rhsgref_cdf_b_ZU23"]
/*  Boats             */	,["B_G_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */	,["B_G_Van_01_fuel_F","rhsgref_cdf_b_gaz66_ammo","B_G_Offroad_01_repair_F"]
/*  Submarines        */	,["B_SDV_01_F"]
/*  MRAP Vehicles     */        ,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_FIA_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Cargo_HQ_V1_F"]
];

// =============================================================================
