// INFO ========================================================================
/*
	Nationalist guerillas of the National Party is an underground movement lacking
	sophisticated weapons, but their knowledge of the country, military expertise from
	civil war and underground network make them serious opponents to both communist
	guerillas and government forces
*/

_factionID = "NAPA";
_factionName = "NAPA";
_factionStructure = "LOW-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor = "green";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK74N;
_commonRIFLEGL = _AK74NGL;
_commonPISTOL = _Makarov;
_commonAR = _RPK;
_commonMG = _PKM;
_commonMARKSMAN = _SVD;
_commonSNIPER = _SVD;
_commonAT = _RPG26;
_specAT = _RPG7;
_commonSMG = _AK74UN;
_commonRCO = "rhs_acc_1p29";
_commonCCO = "rhs_acc_ekp1";
_commonMAGNIFIED = "rhs_acc_pso1m21_ak";
_commonSUPPRESSOR = "rhs_acc_pso1m21_ak";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
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

_uniformsLIST = [
    "rhsgref_uniform_woodland_olive",
    "rhsgref_uniform_flecktarn",
    "rhsgref_uniform_dpm_olive"
];

_vestsLIST = [
    "V_TacChestrig_grn_F",
	"V_TacChestrig_oli_F"
];

_goggleLIST = [
    "empty",
    "G_Balaclava_blk",
    "G_Balaclava_oli",
    "empty"
];

_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;
_randomGOGGLE = _goggleLIST call BIS_fnc_selectRandom;

if (_assignLoadoutMode) then { if !(_isLeader) then { _unit addGoggles _randomGOGGLE }};

_commonHEAD = "empty";
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD ;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4";
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
/*  Anti Air Vehicles */	 ["rhsgref_nat_ural_Zu23"]
/*  Attack Helos      */	,[]
/*  Attack Planes     */	,[]
/*  Heavy Vehicles    */	,["rhs_t80","rhs_t72ba_tv"]
/*  Light Vehicles    */	,["rhsgref_nat_uaz","rhsgref_nat_uaz_ags","rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_spg9"]
/*  Medium Vehicles   */	,["rhs_bmp2d_msv","rhs_bmp1_msv","rhsgref_BRDM2_msv","rhsgref_nat_btr70"]
/*  Mobile Artillery  */	,[]
/*  Transport Helos   */	,[]
/*  Transport Planes  */	,[]
/*  Transport Trucks  */	,["rhsgref_nat_ural","rhsgref_nat_ural_open"]
/*  Static Defence    */	,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */	,[]
/*  UAV               */	,[]
/*  UGV               */	,[]
/*  Support           */	,[]
/*  Submarines        */	,[]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_msv"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierCDFEnsign_EP1",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["CDF_WarfareBLightFactory"]
];
