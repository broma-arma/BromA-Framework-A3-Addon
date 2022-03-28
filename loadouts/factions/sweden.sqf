// INFO ========================================================================
/*
    Swedish Armed Forces
*/

_factionID = "SWEDEN";
_factionName = "Swedish Armed Forces";
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

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_UNIFORMS_SWECammo
	"m90w" woodland
	"m90d" desert
*/

_camo = "m90w";

// WEAPONS =====================================================================

_commonRIFLE = ["sfp_ak5c","rhs_mag_30Rnd_556x45_M855A1_PMAG"];
_commonRIFLEGL = ["sfp_ak5c_m203","30Rnd_556x45_Stanag","rhs_mag_M433_HEDP"];
_commonPISTOL = ["R3F_G17","R3F_17Rnd_9x19_G17"];
_commonAR = ["rhs_weap_m249","rhsusf_100Rnd_556x45_M855_soft_pouch"];
_commonMG = ["rhs_weap_m249","rhsusf_100Rnd_556x45_M855_soft_pouch"];
_commonMARKSMAN = _commonRIFLE;
_commonSNIPER = ["hlc_rifle_awcovert","hlc_5rnd_300WM_FMJ_AWM"];
_commonAT = _M72A7;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _MP5A5;
_commonRCO = "rhsusf_acc_acog_rmr";
_commonCCO = "rhsusf_acc_compm4";
_specATSCOPE = "rhs_optic_maaws";
_commonMAGNIFIED = "rksl_optic_pmii_525_des";
_commonSUPPRESSOR = "hlc_muzzle_556nato_rotexiiic_grey";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_14";

_rifleSCOPE = "rhsusf_acc_compm4";

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
if(!isNil "BRM_FMK_UNIFORMS_SWECammo")then{_camo=BRM_FMK_UNIFORMS_SWECammo};

_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black","empty"];

_commonHEAD = selectRandom [
	"BRM_LWH_"+_camo,
	"BRM_LWH_COMS_"+_camo,
	"BRM_LWH_COMS_GHILLIE_"+_camo
];
_leaderHEAD = _commonHEAD;
_officerHEAD = "rhs_beret_milp";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_alt_helmet";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = if(_camo == "m90w") then {"rhsusf_opscore_rg_cover_pelt"} else {"rhsusf_opscore_ut_pelt_nsw_cam"};

_commonUNIFORM = selectRandom [
	"BRM_BattleUNI_"+_camo,
	"BRM_BattleUNIRS_"+_camo
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

_commonVEST = if(_camo == "m90w") then {"BRM_RRV_GREEN_RFL"} else {"BRM_RRV_BROWN_RFL"};
_officerVEST = if(_camo == "m90w") then {"BRM_RRV_GREEN_RECLEAD"} else {"BRM_RRV_BROWN_RECLEAD"};
_ftlVEST = _officerVEST;
_slVEST = _ftlVEST;
_mgVEST = if(_camo == "m90w") then {"BRM_RRV_GREEN_MG"} else {"BRM_RRV_BROWN_MG"};
_grenadierVEST = _commonVEST;
_medicVEST = if(_camo == "m90w") then {"BRM_RRV_GREEN_RECMED"} else {"BRM_RRV_BROWN_RECMED"};
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_"+_camo;
_bigBACKPACK = "BRM_PatrolBPH_"+_camo;

if (_assignLoadoutMode) then {
    if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "empty") then {
        _unit addGoggles _randomGOGGLE;
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
/*  Anti Air Vehicles */ ["sfp_lvkv90c"]
/*  Attack Helos      */,[]
/*  Attack Planes     */,["UK3CB_AAF_B_Gripen_G"]
/*  Heavy Vehicles    */,["sfp_strv122b","sfp_strv122","sfp_strv122_snow"]
/*  Light Vehicles    */,["sfp_bv206"]
/*  Medium Vehicles   */,["sfp_strf90c","sfp_strf90c_snow"]
/*  Mobile Artillery  */,["sfp_grkpbv90120"]
/*  Transport Helos   */,[]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,[]
/*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */,[]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,[]
/*  Support           */,["UK3CB_BAF_MAN_HX58_Repair_Green","UK3CB_BAF_MAN_HX58_Fuel_Green","UK3CB_BAF_MAN_HX58_Cargo_Green_B"]
/*  Submarines        */,[]
/*  MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
