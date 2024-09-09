// INFO ========================================================================
/*
    The Royal Army Corps of Sahrani is the main military force of the
    Kingdom of South Sahrani, engaged in a fight against their communist neighbours -
    the Sahrani Liberation Army located north of the island.

    They are aligned with US forces, borrowing their equipment and tactics.
*/

_factionID = "RACS";
_factionName = "Royal Army Corps of Sahrani";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceBRITISH];
_defaultFace = [_faceWHITE];
_defaultName = [_nameSPANISH];
_defaultInsignia = "USP_PATCH_MORALE_LAMBDA_OCP";
_defaultColor = "white";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.7,0.8],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _G36A1;
_reconRIFLE = _G36C;
_commonRIFLEGL = _G36A1GL;
_commonPISTOL = _M9;
_commonAR = ["r3f_fn_mag58","rhsusf_100Rnd_762x51"];
_commonMG = _commonAR;
_commonMARKSMAN = _commonRIFLE;
_commonSNIPER = ["rhs_weap_m24sws_d","rhsusf_5Rnd_762x51_m118_special_Mag"];
_commonAT = _AT4;
_specAT = _GUSTAV;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;
_commonSMG = _MP5A2;
_commonRCO = _FHQACOG;
_marksmanSCOPE = "hlc_optic_g36dualoptic35x";
_specATSCOPE = "rhs_optic_maaws";
_commonCCO = "hlc_optic_g36export35x";
_commonMAGNIFIED = "rhsusf_acc_m8541_d";
_commonSUPPRESSOR = "rhsusf_acc_nt4_black";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_14";

_rifleSCOPE = "hlc_optic_g36dualoptic15x";
_reconSCOPE = "rhsusf_acc_acog2";

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

_commonHEAD = selectRandom [
	"BRM_PASGT_NV_COMS_DBDU",
	"BRM_PASGT_NVSWDG_DBDU"
];
_leaderHEAD = _commonHEAD;
_officerHEAD = "BRM_PatrolCap_DBDU";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "BRM_SPH4V_RACS";
_helicrewHEAD = "BRM_SPH4V_RACS";
_helipilotHEAD = "BRM_SPH4V_RACS";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "BRM_BoonieCOMS_DBDU";

_commonUNIFORM = selectRandom [
	"BRM_BattleUNI_DBDU",
	"BRM_BattleUNIRS_DBDU"
];
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_CHC_C_U_Overall_03";
_sniperUNIFORM = "U_I_FullGhillie_sard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "UK3CB_CHC_C_U_Overall_03";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "BRM_MTV_RFL";
_officerVEST = _commonVEST;
_ftlVEST = "BRM_MTV_GL";
_slVEST = _commonVEST;
_mgVEST = "BRM_MTV_MG";
_grenadierVEST = "BRM_MTV_GL";
_medicVEST = "BRM_MTV_MED";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST     = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = "BRM_SqBackpack_Brown";
_bigBACKPACK = "BRM_SqBpH_Brown";
_reconBACKPACK = "BRM_SqBpH_Brown";

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
/*  Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6"]
/*  Attack Helos      */,["RHS_AH1Z_CS", "RHS_AH1Z_GS", "RHS_AH64D_AA", "RHS_AH64D_CS", "RHS_AH64D_GS", "RHS_AH64D", "RHS_AH64DGrey"]
/*  Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/*  Heavy Vehicles    */,["rhsusf_m1a1aimd_usarmy", "rhsusf_m1a1aim_tuski_d", "rhsusf_m1a2sep1d_usarmy", "rhsusf_m1a2sep1tuskid_usarmy", "rhsusf_m1a2sep1tuskiid_usarmy"]
/*  Light Vehicles    */,["rhsusf_m1025_d_m2", "rhsusf_m1025_d", "rhsusf_m998_d_2dr_fulltop", "rhsusf_m998_d_4dr_fulltop", "rhsusf_m998_d_4dr"]
/*  Medium Vehicles   */,["RHS_M2A2", "RHS_M2A2_BUSKI", "RHS_M2A3", "RHS_M2A3_BUSKI", "RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
/*  Mobile Artillery  */,["rhsusf_m109d_usarmy", "rhsusf_m109d_usarmy"]
/*  Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "rhsusf_CH53E_USMC_D", "RHS_UH1Y_FFAR_D", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
/*  Transport Planes  */,["RHS_C130J", "RHS_C130J"]
/*  Transport Trucks  */,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
/*  Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/*  Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["rhsusf_M977A4_REPAIR_usarmy_d","rhsusf_M977A4_AMMO_BKIT_usarmy_d", "B_Truck_01_fuel_F"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsusf_rg33_d", "rhsusf_rg33_m2_d", "rhsusf_M1117_D"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierSouth"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_HBarrierWall4_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
