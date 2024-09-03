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

_commonRIFLE = _G3A3WIDE;
_commonRIFLEGL = _G3A3WIDE;
_commonGL = ["rhs_weap_m79","rhs_mag_M441_HE"];
_commonPISTOL = ["rhs_weap_cz99","rhssaf_mag_15Rnd_9x19_FMJ"];
_commonAR = ["r3f_fn_mag58","rhsusf_100Rnd_762x51"];
_commonMG = _commonAR;
_commonMARKSMAN = _G3A3WIDE;
_commonSNIPER = ["hlc_rifle_FN3011_20rnd","hlc_20Rnd_762x51_B_fal"];
_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _specAT;
_commonSMG = _MP5A2;
_commonRCO = "hlc_optic_stanagzf_g3";
_marksmanSCOPE = "hlc_optic_zf95_g3";
_specATSCOPE = "rhs_optic_maaws";
_commonCCO = "";
_commonMAGNIFIED = "hlc_optic_leupoldm3a_3011";
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 5;
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

_commonHEAD = selectRandom [
	"BRM_LWH_UN",
	"BRM_LWH_MASK_UN"
];
_leaderHEAD = _commonHEAD;
_officerHEAD = "rhssaf_beret_blue_un";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "BRM_SPH4_WHITE";
_helicrewHEAD = "BRM_SPH4_WHITE";
_helipilotHEAD = "BRM_SPH4_WHITE";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = "rhsgref_uniform_ERDL";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_IBA_ALICE_UN_RFL";
_officerVEST = "BRM_IBA_ALICE_UN_SL";
_ftlVEST = _commonVEST;
_slVEST = "BRM_IBA_ALICE_UN_SL";
_mgVEST = "BRM_IBA_ALICE_UN_MG";
_heliVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "BRM_ALICE_SL";

_commonBACKPACK = "BRM_SqBackpack_Green";
_bigBACKPACK = _commonBACKPACK;
_medicalBACKPACK = "BRM_SqBackpackMED_Green";
_specATBACKPACK = _commonBACKPACK;
_reconBACKPACK = _commonBACKPACK;

// MISC EQUIPMENT ==============================================================

_grenade = "rhssaf_mag_br_m84";
_wsmoke = "rhssaf_mag_brd_m83_white";
_rsmoke = "rhssaf_mag_brd_m83_red";
_gsmoke = "rhssaf_mag_brd_m83_green";
_rangefinder = "rhsusf_bino_lrf_Vector21";

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
/*  Anti Air Vehicles */ ["UK3CB_UN_I_Ural_Zu23"]
/*  Attack Helos      */,["rhsgref_un_Mi24V","rhsgref_un_Mi24V_UPK", "UK3CB_UN_I_Mi8AMTSh"]
/*  Attack Planes     */,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */,[]
/*  Light Vehicles    */,["rhsgref_un_uaz"]
/*  Medium Vehicles   */,["rhsgref_un_btr70","UK3CB_UN_I_M113_M2","UK3CB_UN_I_BTR60"]
/*  Mobile Artillery  */,[]
/*  Transport Helos   */,["UK3CB_UN_I_UH1H","UK3CB_UN_I_Mi8AMT"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["rhsgref_un_ural"]
/*  Static Defence    */,["rhsgref_ins_g_Igla_AA_pod","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","rhsgref_ins_g_SPG9","rhsgref_ins_g_ZU23"]
/*  Boats             */,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F"]
/*  Support           */,["B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsgref_un_m1117"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag       */ "Flag_UNO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Cargo_HQ_V1_F"]
];
