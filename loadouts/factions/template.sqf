// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "TEMPLATE";
_factionName = "Template";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceALTIAN, _voiceAMERICAN, _voiceBRITISH, _voiceFARSI, _voiceRUSSIAN, _voiceCHINESE];
_defaultFace = [_faceGREEK, _faceWHITE, _faceBLACK, _faceASIAN, _facePERSIAN, _faceTANOAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================

_commonRIFLE = _Mk20;
_commonRIFLEGL = _Mk20GL;
_commonAR = _Zafir;
_commonMG = _Zafir;
_commonMarksman = _Mk20;
_commonSniper = _GM6;
_commonSMG = _Mk20C;

_commonPistol = _Rook;

_commonAT = _RPG42;
_specAT = _RPG42;

_commonRCO = _ARCO;
_commonCCO = _EOT;
_commonEOT = _commonCCO;

_rifleSCOPE = "";
_arSCOPE = "";
_reconSCOPE = _commonRCO;
_sniperSCOPE = _SOS;
_marksmanSCOPE = _sniperSCOPE;
_specATSCOPE = "";
_mgSCOPE = "";
_weaponsATSCOPE = "";

_commonSUPPRESSOR = _sup556;
_commonPISTOLSUPPRESSOR = _sup9mm;

_commonRAIL = "";
_commonBIPOD = "";

// AMMO COUNT ==================================================================

_countRifle = 6;
_countRifleLOW = 4;
_countPISTOL = 2;
_countAR = 5;
_countMG = 3;
_countSniper = 4;
_countSpecAT = 3;
_countSpecHE = 1;
_countGRENADES = 3;
_count40mm = 10;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countArCARGO = 20;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countSpecATCARGO = 15;
_countSpecHECARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countSplint = 4;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countTourniquetCARGO = 30;
_countSplintCARGO = 40;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = selectRandom ["H_Bandanna_khk", "H_Bandanna_mcamo", "H_Bandanna_sgg", "H_Bandanna_sand"];
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = "H_Bandanna_cbr";
_crewmanHEAD = "H_HelmetCrew_B";
_pilotHEAD = "H_PilotHelmetFighter_B";
_helicrewHEAD = "H_CrewHelmetHeli_B";
_helipilotHEAD = "H_PilotHelmetHeli_B";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = selectRandom ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_redwhite", "U_C_Poloshirt_salmon", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour"];
_officerUNIFORM = "U_BG_Guerilla2_3";
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = "U_Marshal";
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = selectRandom ["V_BandollierB_blk", "V_BandollierB_cbr", "V_BandollierB_rgr", "V_BandollierB_khk", "V_BandollierB_oli"];
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_rgr";
_bigBACKPACK = "B_Carryall_ocamo";
_medicalBACKPACK = _bigBACKPACK;
_specATBACKPACK = _bigBACKPACK;
_reconBACKPACK = _bigBACKPACK;

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_UAVBag = "vanilla";
_UAVTerminal = "vanilla";

_NVG = _NVGEN1;
_nightOnlyNVGs = false;
_aiBackpackRadios = false;

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F"]
/*  Attack Helos      */,["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]
/*  Attack Planes     */,["B_Plane_CAS_01_F"]
/*  Heavy Vehicles    */,["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"]
/*  Light Vehicles    */,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
/*  Medium Vehicles   */,["B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"]
/*  Mobile Artillery  */,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
/*  Transport Helos   */,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["B_Truck_01_transport_F","B_Truck_01_covered_F"]
/*  Static Defence    */,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*  Boats             */,["B_Boat_Armed_01_minigun_F"]
/*  UAV               */,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */,["B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
