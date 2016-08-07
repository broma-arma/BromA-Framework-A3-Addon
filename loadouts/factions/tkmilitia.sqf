
// INFO ========================================================================
/*

    The Takistani Militia are a paramilitary group based in Takistan. Their operations are focused
	on low-scale engagements and guerilla warfare with the usage of soviet-bloc equipment.
	What are these guys up to THIS time?

*/

_factionID = "TKMILITIA";
_factionName = "Takistani Militia";
_factionStructure = "LOW-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN];
_defaultName = [_nameARABIC];
_defaultInsignia = "";
_defaultColor = "black";

// WEAPONS =====================================================================

_commonRIFLE = _AKM;
_commonRIFLEGL = _AKMGL;
_commonPISTOL = _Makarov;
_commonMG = _PKM;
_commonMARKSMAN = _SVD;
_commonSNIPER = _SVD;
_commonAT = _RPG26;
_specAT = _RPG7;
_commonSMG = _AKS74U;
_commonRCO = "HLC_Optic_1p29";
_commonCCO = "hlc_optic_kobra";
_commonMAGNIFIED = "HLC_Optic_PSO1";
_commonSUPPRESSOR = "hlc_muzzle_762SUP_AK";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE = 6;
_countRIFLELOW = 4;
_countPISTOL = 2;
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
    "TRYK_H_pakol2",
    "H_ShemagOpen_tan",
    "H_ShemagOpen_khk"
];

_uniformsLIST = [
    "MNP_CombatUniform_Militia_DC",
    "MNP_CombatUniform_Militia_DE",
    "MNP_CombatUniform_Militia_DB"
];

_vestsLIST = [
    "TRYK_V_ChestRig",
    "TRYK_V_ChestRig_L"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = _commonHEAD;
_helicrewHEAD = _commonHEAD;
_helipilotHEAD = _commonHEAD;
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

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

_commonBACKPACK = "rhs_sidor";
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
/* 0 - Anti Air Vehicles */	 ["rhsgref_cdf_zsu234"]
/* 1 - Attack Helos      */	,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/* 2 - Attack Planes     */	,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/* 3 - Heavy Vehicles    */	,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/* 4 - Light Vehicles    */	,["LOP_AM_Landrover_M2", "LOP_AM_Offroad_M2", "LOP_AM_Offroad", "LOP_AM_Landrover", "rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/* 5 - Medium Vehicles   */	,["rhsgref_cdf_bmd1", "rhsgref_cdf_bmd1k", "rhsgref_cdf_bmd1p", "rhsgref_cdf_bmd1","rhsgref_cdf_bmd1k","rhsgref_cdf_bmd1p","rhsgref_cdf_bmd1pk","rhsgref_cdf_bmd2","rhsgref_cdf_bmd2k","rhsgref_cdf_bmp1","rhsgref_cdf_bmp1d","rhsgref_cdf_bmp1k","rhsgref_cdf_bmp1p","rhsgref_cdf_bmp2e","rhsgref_cdf_bmp2","rhsgref_cdf_bmp2d","rhsgref_cdf_bmp2k", "rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
/* 6 - Mobile Artillery  */	,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/* 7 - Transport Helos   */	,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/* 8 - Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/* 9 - Transport Trucks  */	,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural", "rhsgref_cdf_ural_Zu23"]
/*10 - Static Defence    */	,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*11 - Boats 		 */	,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*12 - UAV 		 */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*13 - UGV		 */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*14 - Support 		 */	,["rhsgref_cdf_gaz66_ammo","rhsgref_cdf_ural_fuel"]
/*15 - Submarines 	 */	,["B_SDV_01_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierTKMilitia_EP1",
/* Objects      */ ["rhs_weapon_crate"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================