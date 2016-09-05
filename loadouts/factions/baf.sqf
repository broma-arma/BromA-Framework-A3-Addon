// INFO ========================================================================
/*

   The British Armed Forces form the military of the United Kingdom, tasked with
   defence of the country, its overseas territories and the Crown dependencies;
   as well as promoting the UK's wider interests, supporting international
   peacekeeping efforts, and providing humanitarian aid.

*/

_factionID = "BAF";
_factionName = "British Armed Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceBRITISH];
_defaultFace = [_faceWHITE];
_defaultName = [_nameENGLISH];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _L85A2;
_commonRIFLEGL = _L85A2GL;
_commonPISTOL = _L131A1;
_commonMG = _L110A2;
_commonMARKSMAN = _L86A2;
_commonSNIPER = _L115A3CAMO;
_commonAT = _AT4CSHEAT;
_specAT = _NLAW_3CB;
_commonSMG = _L22A2;
_commonRCO = "UK3CB_BAF_SUSAT";
_commonCCO = "UK3CB_BAF_Eotech";
_commonMAGNIFIED = "UK3CB_BAF_SB31250_Ghillie";
_commonSUPPRESSOR = "UK3CB_BAF_Silencer_L85";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = "UK3CB_BAF_HMNVS";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
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

_uniformLIST = [
    "UK3CB_BAF_U_CombatUniform_MTP_RM",
    "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve_RM"
];

_headsLIST = [
    "UK3CB_BAF_H_Mk7_Camo_A",
    "UK3CB_BAF_H_Mk7_Camo_ESS_A",
    "UK3CB_BAF_H_Mk7_Camo_CESS_A"
];

_goggleLIST = [
    "TRYK_Shemagh_mesh",
    "TRYK_Shemagh_shade",
    "empty"
];

_randomUNIFORM = _uniformLIST call BIS_fnc_selectRandom;
_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomGOGGLE = _goggleLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "UK3CB_BAF_H_CrewHelmet_ESS_A";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "UK3CB_BAF_H_PilotHelmetHeli_A";
_helipilotHEAD = "UK3CB_BAF_H_PilotHelmetHeli_A";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "UK3CB_BAF_H_Mk7_Scrim_ESS_B";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_BAF_U_HeliPilotCoveralls_RAF";
_sniperUNIFORM = "UK3CB_BAF_U_CombatUniform_MTP_Ghillie_RM";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "UK3CB_BAF_U_HeliPilotCoveralls_RAF";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "UK3CB_BAF_V_Osprey_Rifleman_A";
_officerVEST = "UK3CB_BAF_V_Osprey_SL_D";
_ftlVEST = "UK3CB_BAF_V_Osprey_SL_C";
_slVEST = "UK3CB_BAF_V_Osprey_SL_D";
_mgVEST = "UK3CB_BAF_V_Osprey_MG_A";
_grenadierVEST = "UK3CB_BAF_V_Osprey_Grenadier_B";
_medicVEST = "UK3CB_BAF_V_Osprey_Medic_B";
_demoVEST = _commonVEST;
_marksmanVEST = "UK3CB_BAF_V_Osprey_Marksman_A";
_reconVEST = _commonVEST;

_commonBACKPACK = "UK3CB_BAF_B_Bergen_MTP_Rifleman_H_C";
_bigBACKPACK = "UK3CB_BAF_B_Bergen_MTP_Rifleman_L_D";

if (_assignLoadoutMode) then { _unit addGoggles _randomGOGGLE };

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
/*  Anti Air Vehicles */	 ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
/*  Attack Helos      */	,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
/*  Attack Planes     */	,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/*  Heavy Vehicles    */	,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
/*  Light Vehicles    */	,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
/*  Medium Vehicles   */	,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
/*  Mobile Artillery  */	,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
/*  Transport Helos   */	,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
/*  Transport Planes  */	,["RHS_C130J", "RHS_C130J"]
/*  Transport Trucks  */	,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
/*  Static Defence    */	,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */	,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */	,["rhsusf_M977A4_REPAIR_usarmy_wd","rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/*  Submarines        */	,["B_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsusf_rg33_w", "rhsusf_rg33_m2_w", "rhsusf_M1117_W"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierBAF",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================