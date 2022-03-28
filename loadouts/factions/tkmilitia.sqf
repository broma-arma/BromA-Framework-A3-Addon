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
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_rifleLIST = [
	_RHSAKM,
	_RHSAKMS,
	_AK74UN,
	_AK74N,
	["rhs_weap_m38","rhsgref_5Rnd_762x54_m38"]
];

_commonRIFLE = _rifleLIST selectRandomWeighted [0.3,0.2,0.3,0.2,0.3,0.1];

_commonRIFLEGL = selectRandom [
	_RHSAKMGL,
	_RHSAKMSGL
];
_commonPISTOL = _Makarov;
_commonAR = _RPK;
_commonMG = _RPK;
_commonMARKSMAN = ["UK3CB_SVD_OLD","rhs_10Rnd_762x54mmR_7N1"];
_commonSNIPER = _commonMARKSMAN;
_commonAT = ["rhs_weap_rpg18","rhs_rpg18_mag"];
_specAT = _RPG7;
_weaponsAA = _IGLA;
_weaponsAT = _RPG7PGO;
_commonSMG = _AK74UN;
_commonRCO = "";
_marksmanSCOPE = "rhs_acc_pso1m2";
_commonCCO = "";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

_nightOnlyNVGs = true;

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
_countTourniquet = 3;
_countBLOODBAG = 3;
_countPAK = 1;

_countBandageCARGO = 20;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_headsLIST = [
	"UK3CB_TKM_I_H_Turban_02_1",
	"UK3CB_TKM_I_H_Turban_01_1",
	"UK3CB_TKM_I_H_Turban_05_1",
	"UK3CB_TKM_I_H_Turban_04_1",
	"UK3CB_H_Shemag_red",
	"UK3CB_H_Shemag_white",
	"UK3CB_TKM_O_H_Turban_01_1",
	"UK3CB_TKC_H_Turban_04_1"
];

_uniformsLIST = [
    "UK3CB_TKM_O_U_01",
	"UK3CB_TKM_O_U_01_B",
	"UK3CB_TKM_O_U_01_C",
	"UK3CB_TKM_O_U_01_D",
	"UK3CB_TKM_O_U_05_C",
	"UK3CB_TKM_O_U_04_C",
	"UK3CB_TKM_O_U_04",
	"UK3CB_TKM_O_U_03",
	"UK3CB_TKM_O_U_03_B",
	"UK3CB_TKM_O_U_03_C"
];

_vestsLIST = [
    "V_TacChestrig_grn_F",
    "V_TacChestrig_oli_F"
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomVEST = selectRandom _vestsLIST;

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
_pilotVEST = "rhs_belt_AK";

_commonBACKPACK = "UK3CB_B_Alice_K";
_bigBACKPACK = "UK3CB_B_Alice_K";
_medicalBACKPACK = "UK3CB_B_Alice_Med_K";
_specATBACKPACK = "rhs_rpg_2";
_reconBACKPACK = "UK3CB_B_Alice_Bedroll_K";

// MISC EQUIPMENT ==============================================================

_grenade = "rhs_mag_f1";
_wsmoke = "rhs_mag_rdg2_white";
_binoc = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";

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
/*  Anti Air Vehicles */ ["rhsgref_cdf_zsu234"]
/*  Attack Helos      */,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/*  Light Vehicles    */,["UK3CB_TKM_O_Hilux_Dshkm","UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_Pkm","UK3CB_TKM_O_UAZ_Dshkm","rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/*  Medium Vehicles   */,["rhs_btr60_vdv", "rhs_btr70_vdv","rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/*  Mobile Artillery  */,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/*  Transport Helos   */,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/*  Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural", "rhsgref_cdf_ural_Zu23"]
/*  Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["rhsgref_cdf_gaz66_ammo","rhsgref_cdf_ural_fuel"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag       */ "FlagCarrierTKMilitia_EP1"
/* Objects    */,["rhs_weapon_crate"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
