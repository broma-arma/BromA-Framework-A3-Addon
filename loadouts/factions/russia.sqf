// INFO ========================================================================
/*
    The Armed Forces of the Russian Federation are the military service of Russia,
	established after the dissolution of the Soviet Union.
*/

_factionID = "RUSSIA";
_factionName = "Russian Army";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE, _faceASIAN];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "USP_PATCH_RUS_ARMY_ARMED_FORCES";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_RUSSIA
	"emr"
	"emrd" (desert)
*/

_camo = "emr";
if(!isNil "BRM_FMK_LoadoutCamo_RUSSIA")then{_camo=BRM_FMK_LoadoutCamo_RUSSIA};

// UNIFORMS ====================================================================

// WEAPONS =====================================================================

_commonRIFLE = _AK74M;
_commonRIFLEGL = _AK74GP;
_commonPISTOL = ["rhs_weap_pya", "rhs_mag_9x19_17"];
_commonAR = _PKP;
_commonMG = _PKP;
_commonMARKSMAN = _SVD;
_commonSNIPER = _SVD;
_commonAT = _RPG26;
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = ["launch_O_Vorona_green_F","Vorona_HEAT"];
_commonSMG = ["rhs_weap_pp2000", "rhs_mag_9x19mm_7n31_20"];
_commonRCO = "rhs_acc_1p78";
_commonCCO = "rhs_acc_ekp8_02b";
_marksmanSCOPE = "rhs_acc_pso1m2";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "rhs_acc_tgpa";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

_rifleSCOPE = _commonCCO;

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 7;
_countMG = 5;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 15;

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


_headsLIST = [];

if (_camo == "emr") then {
    _headsLIST = [
        "rhs_6b47_emr_1",
        "rhs_6b47_emr",
        "rhs_6b47_6B50"
    ];

    _commonUNIFORM = "rhs_uniform_vkpo_gloves";
} else {
    _headsLIST =[
        "rhs_6b7_1m",
        "rhs_6b7_1m_bala2"
    ];

    _commonUNIFORM = "rhs_uniform_emr_des_patchless";
};

_randomHEAD = selectRandom _headsLIST;
_randomGOGGLE = ["rhs_balaclava","empty"] selectRandomWeighted [0.4,0.6];

_commonHEAD = _randomHEAD;
_leaderHEAD = _randomHEAD;
_officerHEAD = "rhs_fieldcap_digi";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_6b48";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = selectRandom ["rhs_6b47_6m2_1","rhs_6b47_bala"];

_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhs_6b45_off";
_officerVEST = "rhs_6sh117_nco";
_ftlVEST = "rhs_6sh117_nco";
_slVEST = "rhs_6sh117_nco";
_mgVEST = "rhs_6sh117_ar";
_grenadierVEST = "rhs_6sh117_grn";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "rhs_vest_commander";

_commonBACKPACK = "rhs_rk_sht_30_emr";
_bigBACKPACK = "rhs_rk_sht_30_emr";
_specATBACKPACK = "rhs_rpg_empty";

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "empty") then {
        _unit addGoggles _randomGOGGLE;
    };
};


// MISC EQUIPMENT ==============================================================

_grenade = "rhs_mag_rgo";
_wsmoke = "rhs_mag_rdg2_white";
_binoc = "binoc";
_rangefinder = "rhs_pdu4";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_Kord_Gun_Bag";
_HMGTripod = "RHS_Kord_Tripod_Bag";

_StaticAT = "RHS_Kornet_Gun_Bag";
_ATTripod = "RHS_Kornet_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/*  Attack Helos      */,["RHS_Ka52_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs", "rhs_mi28n_vvs"]
/*  Attack Planes     */,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "RHS_T50_vvs_generic", "RHS_T50_vvs_blueonblue", "RHS_T50_vvs_054", "rhs_mig29sm_vvs"]
/*  Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t90a_tv", "rhs_t90_tv", "rhs_t80um", "rhs_t80uk", "rhs_t72bd_tv"]
/*  Light Vehicles    */,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/*  Medium Vehicles   */,["rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv", "rhs_bmp3m_msv", "rhs_bmp3mera_msv"]
/*  Mobile Artillery  */,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/*  Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/*  Static Defence    */,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*  Boats             */,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */,["O_UGV_01_rcws_F"]
/*  Support           */,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*  Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "rhs_Flag_Russia_F"
/* Objects      */,["O_CargoNet_01_ammo_F"]
/* Walls        */,["Land_BagFence_Short_F"]
/* Structures   */,["Land_Fort_Watchtower"]
];
