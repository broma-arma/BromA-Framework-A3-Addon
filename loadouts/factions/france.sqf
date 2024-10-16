/*
    French armed forces with now camo selections.
*/

_factionID        = "FRANCE";
_factionName      = "French armed forces";
_factionStructure = "FRANCE_STRUCTURE";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceFRENCH];
_defaultFace     = [_faceWHITE, _faceBLACK, _faceASIAN];
_defaultName     = [_nameFRENCH];
_defaultInsignia = "USP_PATCH_FRA_FLAG_IR";
_defaultColor    = "blue";

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_FRANCE
    "CCE"
    "DAGUET"
    "WINTER"
*/

_camo = "CCE";
if (!isNil "BRM_FMK_UNIFORMS_FRACammo" && {BRM_FMK_UNIFORMS_FRACammo}) then {_camo=BRM_FMK_UNIFORMS_FRACammo}; // Backward compatibility
if (!isNil "BRM_FMK_LoadoutCamo_FRANCE") then {_camo=BRM_FMK_LoadoutCamo_FRANCE};

// WEAPONS =====================================================================

_commonRIFLE            = ["R3F_Famas_G2_HG","30Rnd_556x45_Stanag"];
_commonRIFLEGL          = ["R3F_Famas_G2_M203","30Rnd_556x45_Stanag","1Rnd_HE_Grenade_shell"];
_reconRIFLE             = ["rhs_weap_hk416d145_grip2","30Rnd_556x45_Stanag"];
_commonPISTOL           = ["R3F_PAMAS","R3F_15Rnd_9x19_PAMAS"];
_commonAR               = ["hlc_lmg_minimipara_railed","rhs_200rnd_556x45_M_SAW"];
_commonMG               = _M240G;
_commonMARKSMAN         = ["arifle_SPAR_03_blk_F","20Rnd_762x51_Mag"];
_commonSNIPER           = ["R3F_PGM_Hecate_II_POLY","R3F_7Rnd_127x99_PEI_PGM"];
_commonAT               = ["rhs_weap_M136","rhs_m136_mag"];
_specAT                 = ["R3F_ERYX","R3F_ERYX_mag"];
_weaponsAA              = _STINGER;
_weaponsAT              = _specAT;
_commonSMG              = ["hlc_smg_MP5N","hlc_30Rnd_9x19_B_MP5"];
_commonRCO              = "optic_MRCO";
_commonCCO              = "R3F_AIMPOINT";
_sniperSCOPE            = "R3F_J10_MILDOT";
_commonSUPPRESSOR       = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_commonRAIL             = "R3F_PIRAT";
_rifleSCOPE             = _commonCCO;
_reconSCOPE             = "rhsusf_acc_su230";
_marksmanSCOPE          = "optic_LRPS";
_mgSCOPE                = "rhsusf_acc_ELCAN";
_NVG                    = "rhsusf_ANPVS_14";

// AMMO COUNT ==================================================================

_countRIFLE    = 13;
_countRIFLELOW = 7;
_countPISTOL   = 4;
_countAR       = 6;
_countMG       = 4;
_countSNIPER   = 8;
_countSpecAT   = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countArCARGO       = 20;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countSpecATCARGO   = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO     = 40;

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
	"BRM_LWH_COMS_"+_camo,
	"BRM_LWH_MASK_COMS_"+_camo
];

_randomHEAD = selectRandom _headsLIST;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_"+_camo;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = "BRM_Booniehat_"+_camo;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_ACH_MASK_COMS_"+_camo;

_commonUNIFORM   = selectRandom ["BRM_BattleUNI_"+_camo,"BRM_BattleUNIRS_"+_camo];
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = "U_B_PilotCoveralls";
_sniperUNIFORM   = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_crewUNIFORM     = "UK3CB_CHC_C_U_Overall_01";
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = _commonUNIFORM;

_commonVEST    = "BRM_Protec_BROWN_RFL";
_officerVEST   = "BRM_Protec_BROWN_SL";
_ftlVEST       = "BRM_Protec_BROWN_TL";
_slVEST        = _officerVEST;
_mgVEST        = "BRM_Protec_BROWN_MG";
_grenadierVEST = "BRM_Protec_BROWN_GL";
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = "BRM_RRV_BROWN_REC1";

if (_camo == "WINTER") then {
	_headsLIST = [
		"rhsusf_ach_bare_headset",
		"rhsusf_ach_bare_wood_headset"
	];

	_vestsLIST = [
		"UK3CB_V_MBAV_RIFLEMAN_WIN",
		"UK3CB_V_MBAV_MG_WIN"
	];

	_randomHEAD = selectRandom _headsLIST;
	_randomUNIFORM = selectRandom _uniformsLIST;
	_randomVEST = selectRandom _vestsLIST;

	_commonUNIFORM = "UK3CB_ION_B_U_CombatSmock_01_WIN";
	_commonHEAD = _randomHEAD;
	_leaderHEAD = _commonHEAD;
	_officerHEAD = _commonHEAD;
	_medicHEAD = _commonHEAD;
	_crewmanHEAD = "rhsusf_cvc_ess";
	_pilotHEAD = "rhsusf_hgu56p";
	_helicrewHEAD = "rhsusf_hgu56p_mask";
	_helipilotHEAD = "rhsusf_hgu56p";
	_sniperHEAD = _commonHEAD;
	_demoHEAD = _commonHEAD;
	_reconHEAD = _commonHEAD;
};

_commonBACKPACK = "UK3CB_ION_B_B_ASS_WIN_01";
_bigBACKPACK = "UK3CB_ION_B_B_RIF_WIN_01";

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
/*  Anti Air Vehicles */ ["RHS_M6_wd"]
/*  Attack Helos      */,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
/*  Attack Planes     */,["I_Plane_Fighter_04_F"]
/*  Heavy Vehicles    */,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
/*  Light Vehicles    */,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
/*  Medium Vehicles   */,["B_APC_Wheeled_01_cannon_F"]
/*  Mobile Artillery  */,["rhsusf_m109_usarmy"]
/*  Transport Helos   */,["RHS_CH_47F_10","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F"]
/*  Transport Planes  */,["RHS_C130J"]
/*  Transport Trucks  */,["rhsusf_M977A4_usarmy_wd"]
/*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */,["B_Boat_Armed_01_minigun_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsusf_M1232_M2_usarmy_wd", "rhsusf_M1237_M2_usarmy_wd"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "BRM_Flag_France"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
