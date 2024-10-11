// INFO ========================================================================
/*
    Portuguese Armed Forces
*/

_factionID = "PORTUGAL";
_factionName = "Portuguese Armed Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceBRITISH];
_defaultFace = [_faceWHITE];
_defaultName = [_nameSPANISH];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================

_commonRIFLE = _G3A3RIS;
_reconRIFLE = ["rhs_weap_SCARH_FDE_CQC","rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk"];
_commonRIFLEGL = _G3A3RIS;
_commonPISTOL = _G17;
_commonAR = ["hlc_lmg_MG3KWS_b","hlc_50Rnd_762x51_B_MG3"];
_commonMG = _commonAR;
_commonMARKSMAN = _G3A3RIS;
_commonSNIPER = ["UK3CB_BAF_L118A1_Covert","UK3CB_BAF_762_L42A1_10Rnd"];
_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_specATSCOPE = "rhs_optic_maaws";
_commonSMG = _MP5A3;
_commonRCO = "";
_commonCCO = "";
_sniperSCOPE = _FHQLEOPOLD;
_commonSUPPRESSOR = "rhsusf_acc_aac_762sdn6_silencer";
_commonPISTOLSUPPRESSOR = "rhsusf_acc_omega9k";
_NVG = "rhsusf_ANPVS_15";

_reconSCOPE = "rhsusf_acc_acog_rmr";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countSpecAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countSpecATCARGO = 15;
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

_headsLIST = [
	"rhssaf_helmet_m97_olive_nocamo_black_ess_bare",
	"rhssaf_helmet_m97_olive_nocamo",
	"rhssaf_helmet_m97_olive_nocamo_black_ess"
];

_randomHEAD = selectRandom _headsLIST;
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black",""];

_commonHEAD = _randomHEAD;
_leaderHEAD = "UK3CB_BAF_H_Beret_RAMC_PRR_Over";
_officerHEAD = "UK3CB_BAF_H_Beret_RAMC_PRR_Over";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_green";
_helipilotHEAD = "rhsusf_hgu56p_visor_green";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = selectRandom [
	"rhsusf_opscore_fg_pelt",
	"rhsusf_opscore_fg_pelt_cam",
	"rhsusf_opscore_fg_pelt_nsw"
];

_commonUNIFORM = "rhsgref_uniform_dpm";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_sniperUNIFORM = "U_B_T_FullGhillie_tna_F";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BMR_MLBVARMOR_GREEN_RFL";
_officerVEST = "BMR_MLBVARMOR_GREEN_SL";
_ftlVEST = "BMR_MLBVARMOR_GREEN_SL";
_slVEST = "BMR_MLBVARMOR_GREEN_SL";
_mgVEST = _commonVEST;
_grenadierVEST = "BMR_MLBVARMOR_GREEN_GL";
_medicVEST = "BMR_MLBVARMOR_GREEN_MED";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "BRM_Protec_GREEN_RFL";
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_PatrolBP_Green";
_bigBACKPACK = "BRM_PatrolBPH_Green";
_reconBACKPACK = _bigBACKPACK;

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
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
/*  Anti Air Vehicles */ []
/*  Attack Helos      */,[]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,[]
/*  Light Vehicles    */,["rhsgref_hidf_M998_2dr_fulltop","rhsgref_hidf_m1025_m2"]
/*  Medium Vehicles   */,["I_APC_Wheeled_03_cannon_F","rhsusf_m113_usarmy_supply"]
/*  Mobile Artillery  */,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
/*  Transport Helos   */,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["UK3CB_BAF_MAN_HX60_Transport_Green"]
/*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */,[]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,["UK3CB_BAF_MAN_HX60_Cargo_Green_B","UK3CB_BAF_MAN_HX60_Repair_Green","UK3CB_BAF_MAN_HX60_Fuel_Green"]
/*  Submarines        */,[]
/*  MRAP Vehicles     */,["UK3CB_BAF_Panther_GPMG_Green_A"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_HBarrierWall4_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
