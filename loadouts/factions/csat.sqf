// INFO ========================================================================
/*
    Formed at the apex of the Canton Protocol summits, this strategic alliance of
    states is built upon the goals of mutual defence, expanded global influence, and
    sustained economic growth.
*/

_factionID = "CSAT";
_factionName = "CSAT Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_facePERSIAN];
_defaultName = [_nameARABIC];
_defaultInsignia = "";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_CSAT
	"BRN"
    "GRY"
*/
_camo = "BRN";
if(!isNil "BRM_FMK_UNIFORMS_CSATUrban" && {BRM_FMK_UNIFORMS_CSATUrban})then{_camo="GRY"}; // Backward compatibility
if(!isNil "BRM_FMK_LoadoutCamo_CSAT")then{_camo=BRM_FMK_LoadoutCamo_CSAT};
_lp = "o"; // Loadout Pattern
if (_camo == "GRY") then { _lp = "ou"; };

// WEAPONS =====================================================================

_commonRIFLE = _Katiba;
_commonRIFLEGL = _KatibaGL;
_commonPISTOL = _Rook;
_commonAR = _Zafir;
_commonMG = _Navid;
_commonMARKSMAN = _Rahim;
_commonSNIPER = _GM6;
_commonAT = _RPG42;
_specAT = _RPG42;
_weaponsAA = ["launch_O_Titan_F", "Titan_AA"];
_weaponsAT = ["launch_O_Titan_short_F", "Titan_AT"];
_commonSMG = _Sting;
_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_H";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = _NVGEN3OP;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 7;
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

_commonHEAD = "H_HelmetO_"+_lp+"camo";
_leaderHEAD = "H_HelmetLeaderO_"+_lp+"camo";
_officerHEAD = "H_MilCap_"+_lp+"camo";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_O";
_pilotHEAD = "H_PilotHelmetFighter_O";
_helicrewHEAD = "H_CrewHelmetHeli_O";
_helipilotHEAD = "H_PilotHelmetHeli_O";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_HelmetLeaderO_"+_lp+"camo";

_commonUNIFORM = "U_O_CombatUniform_"+_lp+"camo";
_officerUNIFORM = "U_O_OfficerUniform_ocamo";
_pilotUNIFORM = "U_O_PilotCoveralls";
_sniperUNIFORM = "U_O_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_O_PilotCoveralls";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "V_HarnessO_"+_camo;
_officerVEST = "V_BandollierB_cbr";
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = "V_HarnessOGL_"+_camo;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "V_HarnessOSpec_"+_camo;
_pilotVEST = "V_BandollierB_cbr";

_commonBACKPACK = "B_AssaultPack_"+_lp+"camo";
_bigBACKPACK = "B_Carryall_"+_lp+"camo";

// EXTRA EQUIPMENT =============================================================

_HMG = "O_HMG_01_A_high_weapon_F";
_HMGTripod = "O_HMG_01_support_F";

_StaticAT = "O_AT_01_weapon_F";
_ATTripod = "O_HMG_01_support_F";

_mortar = "O_Mortar_01_weapon_F";
_mortarTripod = "O_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_AA_F"]
/*  Attack Helos      */,["O_Heli_Attack_02_black_F","O_Heli_Attack_02_F"]
/*  Attack Planes     */,["O_Plane_CAS_02_F"]
/*  Heavy Vehicles    */,["O_MBT_02_cannon_F","O_APC_Tracked_02_cannon_F"]
/*  Light Vehicles    */,["O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F"]
/*  Medium Vehicles   */,["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"]
/*  Mobile Artillery  */,["O_MBT_02_arty_F", "O_MBT_02_arty_F"]
/*  Transport Helos   */,["O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["O_Truck_03_transport_F", "O_Truck_03_covered_F"]
/*  Static Defence    */,["O_HMG_01_high_F","O_static_AA_F","O_static_AT_F","O_Mortar_01_F"]
/*  Boats             */,["O_Boat_Armed_01_hmg_F"]
/*  UAV               */,["O_UAV_02_CAS_F","O_UAV_02_F"]
/*  UGV               */,["O_UGV_01_F","O_UGV_01_rcws_F"]
/*  Support           */,["O_Truck_03_ammo_F","O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_repair_F"]
/*  Submarines        */,["O_SDV_01_F"]
/*  MRAP Vehicles     */,["O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_CSAT_F"
/* Objects      */,["O_CargoNet_01_ammo_F"]
/* Walls        */,["Land_HBarrierWall4_F"]
/* Structures   */,["Land_Cargo_Tower_V3_F"]
];
