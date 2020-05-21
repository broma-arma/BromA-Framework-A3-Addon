// INFO ========================================================================
/*
    United States Future Soldier (US FS) Program. Initialy started in early 2000s with the not so successfull OICW, it is now back with new weaponry,
    new vehicles and new gear for today's soldier.
*/

_factionID = "USFS";
_factionName = "US Future Soldier Program Unit";
_factionStructure = "HIGH-TIER-CCO";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN];
_defaultFace = [_faceWHITE, _faceBLACK];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "USP_PATCH_USA_ARMY_75RGR_1BTN_ACO";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE    = _ACRSHORTT;
_commonRIFLEGL  = _ACRSHORTGLT;
_commonPISTOL   = _MK25TR;
_commonAR       = _MK46MOD1;
_commonMG       = _MK48MOD0;
_commonMARKSMAN = _ACR68LONGT;
_commonSNIPER   = _M2010;
_commonAT       = _AT4;
_specAT         = ["launch_MRAWS_olive_rail_F", "MRAWS_HEAT_F"];
_commonSMG      = _ACRCOMPACTT;
_commonRCO      = "hlc_optic_ATACR";
_commonCCO      = "rhsusf_acc_eotech_552_d";
_commonMAGNIFIED  = "rhsusf_acc_LEUPOLDMK4_2";
_commonSUPPRESSOR = "rhsusf_acc_rotex5_grey";
_commonPISTOLSUPPRESSOR = "hlc_muzzle_TiRant9S";
_NVG = "NVGogglesB_blk_F";

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
    "rhsusf_opscore_mc_cover_pelt_cam",
    "rhsusf_opscore_coy_cover_pelt",
    "rhsusf_opscore_fg_pelt_nsw",
    "rhsusf_opscore_paint_pelt_nsw_cam"
];

_goggleLIST = [
    "rhsusf_shemagh_grn",
    "rhsusf_shemagh_gogg_grn",
    "empty"
];

_vestsLIST = [
     "rhsusf_spcs_ocp_rifleman_alt",
     "rhsusf_spcs_ocp_rifleman"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;
_randomGOGGLE = _goggleLIST call BIS_fnc_selectRandom;

_commonHEAD = "rhsusf_opscore_mc_cover_pelt_nsw";
_leaderHEAD = "rhsusf_opscore_mc_cover_pelt_cam";
_officerHEAD = "rhsusf_patrolcap_ocp";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_green_ess";
_pilotHEAD = "RHS_jetpilot_usaf";
_helicrewHEAD = "rhsusf_hgu56p_visor_mask";
_helipilotHEAD = "rhsusf_hgu56p_visor";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _randomHEAD;

_commonUNIFORM = "rhs_uniform_cu_ocp";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "TRYK_OVERALL_nok_flesh";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = "rhsusf_spcs_ocp_teamleader_alt";
_ftlVEST = "rhsusf_spcs_ocp_teamleader";
_slVEST = "rhsusf_spcs_ocp_squadleader";
_mgVEST = "rhsusf_spcs_ocp_saw";
_grenadierVEST = "rhsusf_spcs_ocp_grenadier";
_medicVEST = "rhsusf_spcs_ocp_medic";
_demoVEST = _commonVEST;
_marksmanVEST = "rhsusf_spcs_ocp_sniper";
_reconVEST = _commonVEST;

_commonBACKPACK = "rhsusf_assault_eagleaiii_ocp";
_bigBACKPACK = "B_Carryall_mcamo";

if (_assignLoadoutMode) then { _unit addGoggles _randomGOGGLE };

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================


    _factionVehicles = [
    /*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6"]
    /*  Attack Helos      */	,["B_Heli_Attack_01_F", "RHS_AH64D"]
    /*  Attack Planes     */	,["rhsusf_f22", "B_Plane_CAS_01_F"]
    /*  Heavy Vehicles    */	,["rhsusf_m1a2sep1tuskiid_usarmy"]
    /*  Light Vehicles    */	,["rhsusf_M1220_M2_usarmy_wd", "rhsusf_M1230_M2_usarmy_wd", "rhsusf_M1230_MK19_usarmy_wd", "rhsusf_M1220_MK19_usarmy_wd"]
    /*  Medium Vehicles   */	,["RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
    /*  Mobile Artillery  */	,["rhsusf_m109d_usarmy"]
    /*  Transport Helos   */	,["RHS_CH_47F_10","RHS_UH60M_d","RHS_UH60M_MEV2_d","RHS_UH60M_MEV_d","RHS_MELB_H6M"]
    /*  Transport Planes  */	,["RHS_C130J"]
    /*  Transport Trucks  */	,["rhsusf_M1078A1P2_d_fmtv_usarmy","rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy","rhsusf_M977A4_usarmy_d"]
    /*  Static Defence    */	,["RHS_Stinger_AA_pod_D","RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D","RHS_TOW_TriPod_D"]
    /*  Boats             */	,["B_Boat_Transport_01_F","B_Boat_Armed_01_minigun_F","rhsusf_mkvsoc"]
    /*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F","B_UAV_05_F"]
    /*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
    /*  Support           */	,["rhsusf_M978A4_BKIT_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", "rhsusf_M1230a1_usarmy_wd"]
    /*  Submarines        */	,["B_SDV_01_F"]
    /*  MRAP Vehicles     */    ,["rhsusf_M1237_M2_usarmy_wd", "rhsusf_M1237_MK19_usarmy_wd"]
    ];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_US_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_HBarrierWall4_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
