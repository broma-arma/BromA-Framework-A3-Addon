/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "TEMPLATE";
_factionName = "Template";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAltian, _voiceAmerican, _voiceBritish, _voiceFarsi, _voiceRussian, _voiceChinese];
_defaultFace = [_faceGreek, _faceWhite, _faceBlack, _faceAsian, _facePersian, _faceTanoan];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _Mk20;
_commonRifleGL = _Mk20GL;
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

_rifleScope = "";
_reconScope = _commonRCO;
_arScope = "";
_mgScope = "";
_marksmanScope = _SOS;
_sniperScope = _marksmanScope;

_specATScope = "";
_weaponsATScope = "";

_commonSuppressor = _sup556;
_commonPistolSuppressor = _sup9mm;

_commonRail = "";
_commonBipod = "";

// AMMO COUNT ==================================================================
_countRifle = 6;
_countRifleLow = 4;
_countAR = 5;
_countMG = 3;
_countSniper = 4;
_countSpecAT = 3;
_countSpecHE = 1;
_count40mm = 10;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 20;
_countSniperCargo = 30;
_countSpecATCargo = 15;
_countSpecHECargo = 15;
_count40mmCargo = 40;
_countPistolCargo = 10;
_countGrenadesCargo = 20;

// MEDICAL =====================================================================
_countBandage = 20;
_countMorphine = 10;
_countEpi = 5;
_countTourniquet = 3;
_countSplint = 4;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countTourniquetCargo = 30;
_countSplintCargo = 40;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = selectRandom ["H_Bandanna_khk", "H_Bandanna_mcamo", "H_Bandanna_sgg", "H_Bandanna_sand"];
_leaderHead = _commonHead;
_officerHead = _commonHead;
_medicHead = "H_Bandanna_cbr";
_crewmanHead = "H_HelmetCrew_B";
_pilotHead = "H_PilotHelmetFighter_B";
_helicrewHead = "H_CrewHelmetHeli_B";
_helipilotHead = "H_PilotHelmetHeli_B";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = selectRandom ["U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_redwhite", "U_C_Poloshirt_salmon", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour"];
_officerUniform = "U_BG_Guerilla2_3";
_pilotUniform = "U_B_PilotCoveralls";
_sniperUniform = "U_B_GhillieSuit";
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = "U_Marshal";
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = selectRandom ["V_BandollierB_blk", "V_BandollierB_cbr", "V_BandollierB_rgr", "V_BandollierB_khk", "V_BandollierB_oli"];
_officerVest = _commonVest;
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = _commonVest;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = _commonVest;

_commonBackpack = "B_AssaultPack_rgr";
_bigBackpack = "B_Carryall_ocamo";
_medicalBackpack = _bigBackpack;
_specATBackpack = _bigBackpack;
_reconBackpack = _bigBackpack;

// MISC EQUIPMENT =============================================================
//_grenade = "HandGrenade";
//_wSmoke = "SmokeShell";
//_binocular = "Binocular";
//_rangefinder = "Rangefinder";
//_NVG = "NVGoggles";
//_nightOnlyNVGs = false;

// EXTRA EQUIPMENT =============================================================
_hmg = "B_HMG_01_high_weapon_F";
_hmgTripod = "B_HMG_01_support_F";

_staticAT = "B_AT_01_weapon_F";
_atTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

_NVG = _NVGEN1;
_nightOnlyNVGs = false;
_aiBackpackRadios = false;

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F"]
/* Attack Helos      */,["B_Heli_Attack_01_F", "B_Heli_Light_01_armed_F"]
/* Attack Planes     */,["B_Plane_CAS_01_F"]
/* Heavy Vehicles    */,["B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"]
/* Light Vehicles    */,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
/* Medium Vehicles   */,["B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"]
/* Mobile Artillery  */,["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"]
/* Transport Helos   */,["B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["B_Truck_01_transport_F", "B_Truck_01_covered_F"]
/* Static Defence    */,["B_HMG_01_high_F", "B_static_AA_F", "B_static_AT_F", "B_Mortar_01_F"]
/* Boats             */,["B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["B_Truck_01_Repair_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_NATO_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
