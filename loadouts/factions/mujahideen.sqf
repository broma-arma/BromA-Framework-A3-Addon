// INFO ========================================================================

/*
    Striking fear in the Kafir, with no flowers for the Twin Towers - this is
    Jihad on steroids.
*/

_factionID = "MUJAHIDEEN";
_factionName = "Mujahideen";
_factionStructure = "LOW-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN];
_defaultName = [_nameARABIC];
_defaultInsignia = "none";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _HLCAKM;
_commonRIFLEGL = _AKMGL;
_commonPISTOL = _Makarov;
_commonAR = ["hlc_rifle_rpk", "hlc_75Rnd_762x39_m_rpk"];
_commonMG = _PKM;
_commonMARKSMAN = _SVDCAMO;
_commonSNIPER = _SVDCAMO;
_commonAT = _RPG26;
_specAT = _RPG26;
_commonSMG = _AKS74U;
_commonRCO = "HLC_Optic_PSO1";
_commonCCO = "hlc_optic_kobra";
_commonMAGNIFIED = "HLC_Optic_1p29";
_commonSUPPRESSOR = "hlc_muzzle_762SUP_AK";
_commonPISTOLSUPPRESSOR = "";
_NVG = "";

_isATDisposable = true;

// AMMO COUNT ==================================================================

_countRIFLE = 6;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 4;
_countMG = 3;
_countSNIPER = 4;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 10;

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

_countBANDAGE = 15;
_countMORPHINE = 5;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 3;
_countPAK = 1;

_countBandageCARGO = 20;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
    "LOP_H_Turban",
    "LOP_H_Turban_mask",
    "LOP_H_Pakol",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk",
    "LOP_H_Shemag_BLK"
];

_uniformsLIST = [
    "LOP_U_TAK_Civ_Fatigue_01",
    "LOP_U_TAK_Civ_Fatigue_02",
    "LOP_U_TAK_Civ_Fatigue_04",
    "LOP_U_AM_Fatigue_01",
    "LOP_U_AM_Fatigue_02",
    "LOP_U_AM_Fatigue_03",
    "LOP_U_AM_Fatigue_04"
];

_vestsLIST = [
    "V_BandollierB_blk",
    "V_BandollierB_cbr",
    "V_BandollierB_rgr",
    "V_BandollierB_khk",
    "V_BandollierB_oli"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _randomUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _randomVEST;
_ftlVEST = _randomVEST;
_slVEST = _randomVEST;
_mgVEST = _randomVEST;
_grenadierVEST = _randomVEST;
_medicVEST = _randomVEST;

_commonHEAD = _randomHEAD;
_leaderHEAD = "LOP_H_Shemag_BLK";
_officerHEAD = "LOP_H_Shemag_BLK";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4";
_pilotHEAD = "rhs_tsh4";
_helicrewHEAD = "rhs_tsh4";
_helipilotHEAD = "rhs_tsh4";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "LOP_H_Turban_mask";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _randomUNIFORM;
_pilotUNIFORM = _randomUNIFORM;
_sniperUNIFORM = _randomUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _randomUNIFORM;
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

_commonBACKPACK = "rhs_sidor";
_bigBACKPACK = "rhs_assault_umbts";

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
/*  Anti Air Vehicles */	 ["rhsgref_cdf_zsu234"]
/*  Attack Helos      */	,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */	,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */	,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/*  Light Vehicles    */	,["LOP_AM_Landrover_M2", "LOP_AM_Offroad_M2", "LOP_AM_Offroad", "LOP_AM_Landrover", "rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/*  Medium Vehicles   */	,["rhsgref_cdf_bmd1", "rhsgref_cdf_bmd1k", "rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd1","rhsgref_cdf_bmd1k","rhsgref_cdf_bmd1p","rhsgref_cdf_bmd1pk","rhsgref_cdf_bmd2","rhsgref_cdf_bmd2k","rhsgref_cdf_bmp1","rhsgref_cdf_bmp1d","rhsgref_cdf_bmp1k","rhsgref_cdf_bmp1p","rhsgref_cdf_bmp2","rhsgref_cdf_bmp2d","rhsgref_cdf_bmp2k"]
/*  Mobile Artillery  */	,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/*  Transport Helos   */	,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural", "rhsgref_cdf_ural", "rhsgref_cdf_ural"]
/*  Static Defence    */	,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */	,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */	,["rhsgref_cdf_gaz66_ammo","rhsgref_cdf_ural_fuel"]
/*  Submarines        */	,["B_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierTKMilitia_EP1",
/* Objects      */ ["rhs_weapon_crate"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
