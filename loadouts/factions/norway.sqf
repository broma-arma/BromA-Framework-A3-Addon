// INFO ========================================================================
/*
    Norwegian Armed Forces
*/

_factionID = "NORWAY";
_factionName = "Norwegian Armed Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _RHSHK416D10;
_commonRIFLEGL = _RHSHK416D10M320;
_commonPISTOL = ["R3F_G17","R3F_17Rnd_9x19_G17"];
_commonAR = ["rhs_weap_minimi_para_railed","rhsusf_100Rnd_556x45_soft_pouch"];
_commonMG = _commonAR;
_commonMARKSMAN = ["arifle_SPAR_03_blk_F","20Rnd_762x51_Mag"];
_commonSNIPER = ["hlc_rifle_awcovert","hlc_5rnd_300WM_FMJ_AWM"];
_commonAT = _M72A7;
_specAT = _GUSTAV;
_commonSMG = _RHSMP7;
_commonRCO = "rhsusf_acc_acog_rmr";
_specRCO = "rksl_optic_pmii_312_pip";
_commonCCO = "r3f_comp_m5";
_atRCO = "rhs_optic_maaws";
_commonMAGNIFIED = "rksl_optic_pmii_525_des";
_commonSUPPRESSOR = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_rifleSCOPE = _commonCCO;
_specSCOPE = "rhsusf_acc_acog_rmr";
_mgSCOPE = "rhsusf_acc_eotech_552";

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

_randomGOGGLES = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black","empty"];

_commonHEAD = selectRandom [
	"BRM_ACH_NORSK",
	"BRM_ACH_GHILLIE_NORSK",
	"BRM_ACH_MASK_COMS_NORSK"
];
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_NORSK";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_alt_helmet";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhsusf_opscore_fg_pelt_cam";

_commonUNIFORM = selectRandom [
	"BRM_BattleUNI_NORSK",
	"BRM_BattleUNIRS_NORSK"
];
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_SAGE_BLKboots_nk_blk";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_RRV_BROWN_RFL";
_officerVEST = "BRM_RRV_BROWN_RECLEAD";
_ftlVEST = _officerVEST;
_slVEST = _ftlVEST;
_mgVEST = "BRM_RRV_BROWN_MG";
_grenadierVEST = _commonVEST;
_medicVEST = "BRM_RRV_BROWN_RECMED";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_NORSK";
_bigBACKPACK = "BRM_PatrolBPH_NORSK";

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLES != "empty") then {
        _unit addGoggles _randomGOGGLES
    };
};


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
/*  Anti Air Vehicles    */      ["sfp_lvkv90c"]
/*  Attack Helos 	 */	,[]
/*  Attack Planes 	 */	,["UK3CB_AAF_B_Gripen_G"]
/*  Heavy Vehicles 	 */	,["sfp_strv122b","sfp_strv122","sfp_strv122_snow"]
/*  Light Vehicles 	 */	,["sfp_bv206"]
/*  Medium Vehicles 	 */	,["sfp_strf90c","sfp_strf90c_snow"]
/*  Mobile Artillery     */	,["sfp_grkpbv90120"]
/*  Transport Helos      */	,[]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,[]
/*  Static Defence       */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats                */	,[]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,[]
/*  Support              */	,["UK3CB_BAF_MAN_HX58_Repair_Green","UK3CB_BAF_MAN_HX58_Fuel_Green","UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
/*  Submarines           */	,[]
/*  MRAP Vehicles        */     ,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================