/*
    Nationalist guerillas of the National Party is an underground movement lacking
    sophisticated weapons, but their knowledge of the country, military expertise from
    civil war and underground network make them serious opponents to both communist
    guerillas and government forces
*/

_factionID = "NAPA";
_factionName = "NAPA";
_factionStructure = "LOW";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite];
_defaultName = [_nameRussian];
_defaultInsignia = "";
_defaultColor = "green";

// WEAPONS =====================================================================
_rifleList = [_RHSAKM, _RHSAKMS, _AK74UN];
_commonRifle = _rifleList selectRandomWeighted [0.3, 0.2, 0.3];
_rifleGLList = [_RHSAKMGL, _RHSAKMSGL];
_commonRifleGL = selectRandom _rifleGLList;
_commonAR = _RPK;
_commonMG = _PKM;
_commonMarksman = ["UK3CB_SVD_OLD", "rhs_10Rnd_762x54mmR_7N1"];
_commonSniper = _commonMarksman;
_commonSMG = _AK74UN;

_commonPistol = _Makarov;

_commonAT = ["rhs_weap_rpg18", "rhs_rpg18_mag"];
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = _specAT;

_commonRCO = "";
_commonCCO = "";

_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countMGCargo = 20;
_countSniperCargo = 30;
_countSpecATCargo = 15;
_count40mmCargo = 40;
_countPistolCargo = 10;
_countGrenadesCargo = 20;

// MEDICAL =====================================================================
_countBandage = 20;
_countMorphine = 10;
_countEpi = 5;
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["G_Balaclava_blk", "G_Balaclava_oli", ""];

_commonHead = "";
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4";
_pilotHead = _commonHead;
_helicrewHead = _commonHead;
_helipilotHead = _commonHead;
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = selectRandom ["UK3CB_NAP_B_U_CombatUniform_01_FLK", "UK3CB_NAP_B_U_CombatUniform_01_WDL", "UK3CB_NAP_B_U_CombatUniform_FLK"];
_officerUniform = _commonUniform;
_pilotUniform = _commonUniform;
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = selectRandom ["UK3CB_V_Chestrig_OLI", "UK3CB_V_Chestrig_ERDL"];
_officerVest = _commonVest;
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "rhs_belt_AK";

_commonBackpack = "UK3CB_B_Alice_K";
_bigBackpack = "UK3CB_B_Alice_K";

if (_assignLoadoutMode) then {
	if (!_isLeader && _randomGOGGLE != "") then { _unit addGoggles _randomGOGGLE; };
};

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";
_nightOnlyNVGs = true;

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_NSV_Gun_Bag";
_hmgTripod = "RHS_NSV_Tripod_Bag";

_staticAT = "RHS_SPG9_Gun_Bag";
_atTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["rhsgref_nat_ural_Zu23"]
/* Attack Helos      */,[]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,["rhs_t80", "rhs_t72ba_tv"]
/* Light Vehicles    */,["rhsgref_nat_uaz", "rhsgref_nat_uaz_ags", "rhsgref_nat_uaz_dshkm", "rhsgref_nat_uaz_spg9"]
/* Medium Vehicles   */,["rhs_bmp2d_msv", "rhs_bmp1_msv", "rhsgref_BRDM2_msv", "rhsgref_nat_btr70"]
/* Mobile Artillery  */,[]
/* Transport Helos   */,[]
/* Transport Planes  */,[]
/* Transport Trucks  */,["rhsgref_nat_ural", "rhsgref_nat_ural_open"]
/* Static Defence    */,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/* Boats             */,[]
/* UAV               */,[]
/* UGV               */,[]
/* Support           */,[]
/* Submarines        */,[]
/* MRAP Vehicles     */,["rhsgref_BRDM2_msv"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierCDFEnsign_EP1"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["CDF_WarfareBLightFactory"]
];
