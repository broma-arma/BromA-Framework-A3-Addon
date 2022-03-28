// INFO ========================================================================
/*
	Originally founded as Black Element USA in September 1998, ION is a private military company specialising in
	security solutions and providing services tailored to specialist and high-risk environments.
*/

_factionID = "IONPMC";
_factionName = "I.O.N. PMC";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceALTIAN, _voiceAMERICAN, _voiceBRITISH, _voiceFARSI, _voiceRUSSIAN];
_defaultFace = [_faceGREEK, _faceWHITE, _faceBLACK, _faceASIAN, _facePERSIAN];
_defaultName = [_nameAMERICAN, _nameAFRICAN ,_nameARABIC, _nameRUSSIAN];
_defaultInsignia = "";
_defaultColor = "white";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = ["HLC_rifle_XM8_Carbine","hlc_30rnd_556x45_EPR_G36"];
_commonRIFLEGL = _commonRIFLE;
_commonPISTOL = _P226WG;
_commonAR = ["rhs_weap_m249_pip_L_para","rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"];
_commonMG = _commonAR;
_commonMARKSMAN = ["hlc_rifle_XM8_DMAR","hlc_30rnd_556x45_M_G36"];
_commonSNIPER = ["hlc_rifle_psg1","hlc_20rnd_762x51_b_G3"];
_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _MP5A2;
_commonRCO = "hlc_optic_amo_pcap";
_marksmanSCOPE = "hlc_optic_amo_pcap";
_specATSCOPE = "rhs_optic_maaws";
_commonCCO = "hlc_optic_ism_pcap";
_commonMAGNIFIED = "";
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhs_1PN138";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 5;
_countMG = 3;
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

_headsLIST = [
    "TRYK_ESS_CAP",
    "TRYK_R_CAP_BLK",
    "TRYK_H_PASGT_BLK",
    "BRM_PELTOR_Tglasses",
    "TRYK_H_headsetcap_blk_Glasses",
    "BRM_BeanieCOMS_Black",
    "empty"
];

_uniformsLIST = [
    "TRYK_U_denim_hood_mc",
    "TRYK_U_denim_hood_blk",
    "TRYK_U_denim_hood_3c",
    "TRYK_U_B_Denim_T_BK",
    "TRYK_U_B_Denim_T_WH",
    "TRYK_shirts_DENIM_WHB_Sleeve",
    "TRYK_shirts_DENIM_od_Sleeve",
    "TRYK_U_B_PCUGs_OD_R",
    "TRYK_U_B_PCUGs_gry_R",
    "TRYK_shirts_DENIM_BWH",
    "TRYK_shirts_DENIM_R_Sleeve"
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomGOGGLE = selectRandom ["UK3CB_G_Balaclava2_BLK","rhsusf_oakley_goggles_clr","rhs_googles_black","empty"];

_commonHEAD = _randomHEAD;
_leaderHEAD = selectRandom ["TRYK_H_headsetcap_blk","TRYK_H_headsetcap_blk"];
_officerHEAD = _leaderHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "BRM_SPH4V_WHITE";
_helicrewHEAD = "BRM_SPH4V_WHITE";
_helipilotHEAD = "BRM_SPH4V_WHITE";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "TRYK_H_PASGT_BLK";

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

_commonVEST = "BRM_Protec_BLACK_RFL";
_officerVEST = "BRM_Protec_BLACK_TL";
_ftlVEST = "BRM_Protec_BLACK_TL";
_slVEST = "BRM_Protec_BLACK_TL";
_mgVEST = "BRM_RRV_BLACK_MG";
_grenadierVEST = _commonVEST;
_medicVEST = "BRM_RRV_BLACK_MED";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "UK3CB_V_Pilot_Vest_Black";

_commonBACKPACK = "BRM_PatrolBP_Black";
_bigBACKPACK = "BRM_PatrolBP_Black";

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "empty") then {
        _unit addGoggles _randomGOGGLE;
    };
};

// MISC EQUIPMENT ==============================================================

_rangefinder = "rhsusf_bino_lerca_1200_black";
_laserdesignator = "UK3CB_BAF_Soflam_Laserdesignator";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_M2_Gun_Bag";
_HMGTripod = "RHS_M2_Tripod_Bag";

_StaticAT = "rhs_Tow_Gun_Bag";
_ATTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["rhs_zsu234_aa"]
/*  Attack Helos      */,["RHS_Mi24V_AT_vvsc","RHS_Mi24V_vvsc","RHS_Mi24P_CAS_vvsc"]
/*  Attack Planes     */,["RHS_Su25SM_vvsc"]
/*  Heavy Vehicles    */,["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv"]
/*  Light Vehicles    */,["rhs_uaz_open_vmf"]
/*  Medium Vehicles   */,["rhs_bmp2_tv","rhs_bmp2d_tv","rhs_bmp2k_tv","rhs_brm1k_tv","rhs_btr60_vmf"]
/*  Mobile Artillery  */,["rhs_9k79_B","rhs_9k79_K","rhs_9k79","rhs_2s3_tv"]
/*  Transport Helos   */,["RHS_Mi8mt_vv"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["RHS_Ural_VDV_01","RHS_Ural_Flat_VDV_01","RHS_Ural_Open_VDV_01","RHS_Ural_Open_Flat_VDV_01"]
/*  Static Defence    */,["rhsgref_ins_g_Igla_AA_pod","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","rhsgref_ins_g_SPG9","rhsgref_ins_g_ZU23"]
/*  Boats             */,["O_Boat_Armed_01_minigun_F"]
/*  UAV               */,["rhs_pchela1t_vvsc"]
/*  UGV               */,["O_UGV_01_F","O_UGV_01_rcws_F"]
/*  Support           */,["rhs_gaz66_ammo_vdv","RHS_Ural_Fuel_VDV_01"]
/*  Submarines        */,["O_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "flag_ven"
/* Objects      */,["I_CargoNet_01_ammo_F"]
/* Walls        */,["Land_CncBarrier_stripes_F"]
/* Structures   */,["Land_Cargo_HQ_V1_F"]
];
