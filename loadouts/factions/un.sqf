/*
    The United Nations Charter gives the United Nations Security Council the power and responsibility
	to take collective action to maintain international peace and security. For this reason, the international
	community usually looks to the Security Council to authorize peacekeeping operations.

	Remember to not use your weapon until the UN Secretariate gives you permission to fire.
*/

_factionID = "UN";
_factionName = "United Nations Troops";
_factionStructure = "MID";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceAltian, _voiceAmerican, _voiceBritish, _voiceFarsi, _voiceRussian, _voiceChinese];
_defaultFace = [_faceGreek, _faceWhite, _faceBlack, _faceAsian, _facePersian];
_defaultName = [_nameAmerican]; // incomplete list
_defaultInsignia = "USP_PATCH_UN_BELIEVE";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _G3A3WIDE;
_commonRifleGL = _G3A3WIDE;
_commonGL = ["rhs_weap_m79", "rhs_mag_M441_HE"];
_commonAR = ["r3f_fn_mag58", "rhsusf_100Rnd_762x51"];
_commonMG = _commonAR;
_commonMarksman = _G3A3WIDE;
_commonSniper = ["hlc_rifle_FN3011_20rnd", "hlc_20Rnd_762x51_B_fal"];
_commonSMG = _MP5A2;

_commonPistol = ["rhs_weap_cz99", "rhssaf_mag_15Rnd_9x19_FMJ"];

_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _specAT;

_commonRCO = "hlc_optic_stanagzf_g3";
_commonCCO = "";

_marksmanScope = "hlc_optic_zf95_g3";
_sniperScope = "hlc_optic_leupoldm3a_3011";

_specATScope = "rhs_optic_maaws";

_commonSuppressor = "";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 5;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
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
_commonHead = selectRandom ["BRM_LWH_UN", "BRM_LWH_MASK_UN"];
_leaderHead = _commonHead;
_officerHead = "rhssaf_beret_blue_un";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "BRM_SPH4_WHITE";
_helicrewHead = "BRM_SPH4_WHITE";
_helipilotHead = "BRM_SPH4_WHITE";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = "rhsgref_uniform_ERDL";
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "BRM_IBA_ALICE_UN_RFL";
_officerVest = "BRM_IBA_ALICE_UN_SL";
_ftlVest = _commonVest;
_slVest = "BRM_IBA_ALICE_UN_SL";
_mgVest = "BRM_IBA_ALICE_UN_MG";
_heliVEST = _commonVest;
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "BRM_ALICE_SL";

_commonBackpack = "BRM_SqBackpack_Green";
_bigBackpack = _commonBackpack;
_medicalBackpack = "BRM_SqBackpackMED_Green";
_specATBackpack = _commonBackpack;
_reconBackpack = _commonBackpack;

// MISC EQUIPMENT ==============================================================
_grenade = "rhssaf_mag_br_m84";
_wSmoke = "rhssaf_mag_brd_m83_white";
_rSmoke = "rhssaf_mag_brd_m83_red";
_gSmoke = "rhssaf_mag_brd_m83_green";
_rangefinder = "rhsusf_bino_lrf_Vector21";
_NVG = "rhsusf_ANPVS_15";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_Kord_Gun_Bag";
_hmgTripod = "RHS_Kord_Tripod_Bag";

_staticAT = "RHS_SPG9_Gun_Bag";
_atTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["UK3CB_UN_I_Ural_Zu23"]
/* Attack Helos      */,["rhsgref_un_Mi24V", "rhsgref_un_Mi24V_UPK", "UK3CB_UN_I_Mi8AMTSh"]
/* Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/* Heavy Vehicles    */,[]
/* Light Vehicles    */,["rhsgref_un_uaz"]
/* Medium Vehicles   */,["rhsgref_un_btr70", "UK3CB_UN_I_M113_M2", "UK3CB_UN_I_BTR60"]
/* Mobile Artillery  */,[]
/* Transport Helos   */,["UK3CB_UN_I_UH1H", "UK3CB_UN_I_Mi8AMT"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["rhsgref_un_ural"]
/* Static Defence    */,["rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_ZU23"]
/* Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F"]
/* Support           */,["B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_un_m1117"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_UNO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Cargo_HQ_V1_F"]
];
