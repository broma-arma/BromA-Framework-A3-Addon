// INFO ========================================================================
/*
   During the politically turmoiled times prior to the formation of the CSAT,
   many soldiers from the surrounding regions grew increasingly displeased
   with the fanatical frenzy that drove the new government and decided to disband
   in order to found their own private military effort.

   Now with the war at its height, the organization known as "Ahkma" operates
   on several fronts fighting and aiding both CSAT and NATO alike, much to
   each dismay.

   What will the winner side make of them, only the future can tell, but for now,
   business is booming.
*/

_factionID = "AHKMA-PMC";
_factionName = "Ahkma PMC";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN, _faceASIAN];
_defaultName = [_nameARABIC, _nameCHINESE];
_defaultInsignia = "USP_PATCH_MORALE_WORLD_COMPROMISE";
_defaultColor = "green";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _G3KA4;
_commonRIFLEGL = _G3KA4GL;
_commonPISTOL = _G17;
_commonAR = _M249L;
_commonMG = _MG3;
_commonMARKSMAN = _G3KA4;
_commonSNIPER = _SVDS;
_commonAT = _AT4;
_specAT = _RPG42;
_commonSMG = _G3A3;
_commonRCO = "optic_Arco";
_commonCCO = "FHQ_optic_MicroCCO_low";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = _supG3;
_commonPISTOLSUPPRESSOR = "rhsusf_acc_omega9k";
_NVG = _NVGEN3IND;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 5;
_countMG = 4;
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

// UNIFORMS ====================================================================

_uniformsLIST = [
    "TRYK_U_pad_hood_CSATBlk",
    "TRYK_U_pad_hood_Cl_blk",
    "TRYK_U_pad_hood_odBK",
    "TRYK_U_pad_hood_Cl"
];

_vestsLIST = [
    "V_HarnessO_brn",
    "V_HarnessO_gry"
];

_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = "TRYK_H_woolhat";
_leaderHEAD = "H_Cap_blk";
_officerHEAD = "H_Beret_blk";
_medicHEAD = "TRYK_H_woolhat";
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = "H_Hat_Safari_sand_F";
_demoHEAD = _commonHEAD;
_reconHEAD = "TRYK_H_headset2";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _randomUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = "V_HarnessOGL_brn";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_blk";
_bigBACKPACK = "B_Bergen_blk";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_SPG9_Gun_Bag";
_ATTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */	 ["rhs_zsu234_aa"]
/*  Attack Helos      */	,["RHS_Mi24V_AT_vvsc","RHS_Mi24V_vvsc","RHS_Mi24P_CAS_vvsc"]
/*  Attack Planes     */	,["RHS_Su25SM_vvsc"]
/*  Heavy Vehicles    */	,["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv"]
/*  Light Vehicles    */	,["rhs_uaz_open_vmf"]
/*  Medium Vehicles   */	,["rhs_bmp2_tv","rhs_bmp2d_tv","rhs_bmp2k_tv","rhs_brm1k_tv","rhs_btr60_vmf"]
/*  Mobile Artillery  */	,["rhs_9k79_B","rhs_9k79_K","rhs_9k79","rhs_2s3_tv"]
/*  Transport Helos   */	,["RHS_Mi8mt_vv"]
/*  Transport Planes  */	,[]
/*  Transport Trucks  */	,["RHS_Ural_VDV_01","RHS_Ural_Flat_VDV_01","RHS_Ural_Open_VDV_01","RHS_Ural_Open_Flat_VDV_01"]
/*  Static Defence    */	,["rhsgref_ins_g_Igla_AA_pod","rhsgref_ins_g_DSHKM","rhsgref_ins_g_DSHKM_Mini_TriPod","rhsgref_ins_g_SPG9","rhsgref_ins_g_ZU23"]
/*  Boats             */	,["O_Boat_Armed_01_minigun_F"]
/*  UAV               */	,["rhs_pchela1t_vvsc"]
/*  UGV               */	,["O_UGV_01_F","O_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_ammo_vdv","RHS_Ural_Fuel_VDV_01"]
/*  Submarines        */	,["O_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "flag_ven",
/* Objects      */ ["I_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_CncBarrier_stripes_F"],
/* Structures   */ ["Land_Cargo_HQ_V1_F"]
];

// =============================================================================
