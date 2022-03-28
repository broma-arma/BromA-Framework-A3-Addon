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

_rifleLIST = [
	_RHSAKM,
	_RHSAKMS,
	_AK74UN
];

_commonRIFLE = _rifleLIST selectRandomWeighted [0.3,0.2,0.3];

_commonRIFLEGL = selectRandom [
	_RHSAKMGL,
	_RHSAKMSGL
];
_commonPISTOL = _Makarov;
_commonAR = _RPK;
_commonMG = _PKM;
_commonMARKSMAN = ["UK3CB_SVD_OLD","rhs_10Rnd_762x54mmR_7N1"];
_commonSNIPER = _commonMARKSMAN;
_commonAT = ["rhs_weap_rpg18","rhs_rpg18_mag"];
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;
_commonSMG = _AKS74U;
_commonRCO = "";
_commonCCO = "";
_marksmanSCOPE = "rhs_acc_pso1m2";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "";
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

_uniformsLIST = [
    "UK3CB_NAP_B_U_CombatUniform_01_FLK",
    "UK3CB_NAP_B_U_CombatUniform_01_WDL",
    "UK3CB_NAP_B_U_CombatUniform_FLK"
];

_vestsLIST = [
    "UK3CB_V_Chestrig_OLI",
	"UK3CB_V_Chestrig_ERDL"
];

_randomUNIFORM = selectRandom _uniformsLIST;
_randomVEST = selectRandom _vestsLIST;
_randomGOGGLE = selectRandom ["G_Balaclava_blk","G_Balaclava_oli","empty"];

if (_assignLoadoutMode) then {
	if (!_isLeader && _randomGOGGLE != "empty") then { _unit addGoggles _randomGOGGLE; };
};

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
_pilotVEST = "rhs_belt_AK";

_commonBACKPACK = "TRYK_B_Alicepack";
_bigBACKPACK = "TRYK_B_Alicepack";

// MISC EQUIPMENT ==============================================================

_grenade = "rhs_mag_rgd5";
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
/*  Anti Air Vehicles */ ["rhsgref_nat_ural_Zu23"]
/*  Attack Helos      */,[]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,["rhs_t80","rhs_t72ba_tv"]
/*  Light Vehicles    */,["rhsgref_nat_uaz","rhsgref_nat_uaz_ags","rhsgref_nat_uaz_dshkm","rhsgref_nat_uaz_spg9"]
/*  Medium Vehicles   */,["rhs_bmp2d_msv","rhs_bmp1_msv","rhsgref_BRDM2_msv","rhsgref_nat_btr70"]
/*  Mobile Artillery  */,[]
/*  Transport Helos   */,[]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["rhsgref_nat_ural","rhsgref_nat_ural_open"]
/*  Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */,[]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,[]
/*  Submarines        */,[]
/*  MRAP Vehicles     */,["rhsgref_BRDM2_msv"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierCDFEnsign_EP1"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["CDF_WarfareBLightFactory"]
];
