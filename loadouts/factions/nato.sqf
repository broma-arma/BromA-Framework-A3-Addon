/*
    Decades of economic and political turbulence across member states has left
    NATO weakened and facing a strategic paradigm shift.

    Camo: "sand", "black" (BRM_FMK_LoadoutCamo_NATO)
*/

_factionID = "NATO";
_factionName = "NATO Troops";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican, _voiceBritish];
_defaultFace = [_faceWhite, _faceBlack, _faceAsian];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_NATO", "sand"];

// WEAPONS =====================================================================
_commonRifle = [_MX, _MXBlack] select (_camo == "black");
_commonRifleGL = [_MXGL, _MXGLBlack] select (_camo == "black");
_commonAR = [_MXSW, _MXSWBlack] select (_camo == "black");
_commonMG = _SPMGBlack;
_commonMarksman = [_MXM, _MXMBlack] select (_camo == "black");
_commonSniper = _M200;
_commonSMG = [_MXC, _MXCBlack] select (_camo == "black");

_commonPistol = _P07;

_commonAT = _PCML;
_specAT = _PCML;
_weaponsAA = ["launch_B_Titan_F", "Titan_AA"];
_weaponsAT = ["launch_B_Titan_short_F", "Titan_AT"];

_commonRCO = _RCO;
_commonCCO = _ACOred;

_sniperScope = _SOS;

_commonSuppressor = "muzzle_snds_H";
_commonPistolSuppressor = "muzzle_snds_L";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 3;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
_countMGCargo = 20;
_countSniperCargo = 30;
_countSpecATCargo = 15;
_count40mmCargo = 40;
_countPistolCargo = 10;
_countGrenadesCargo = 20;

// MEDICAL =====================================================================
_countBandage = 20;
_countMorphine = 10;
_countEpi = 5;
_countCAT = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = "H_HelmetB";
_leaderHead = "H_HelmetB";
_officerHead = "H_MilCap_mcamo";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_O";
_pilotHead = "H_PilotHelmetFighter_O";
_helicrewHead = "H_CrewHelmetHeli_O";
_helipilotHead = "H_PilotHelmetHeli_O";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "H_Watchcap_blk";

_commonUniform = "U_B_CombatUniform_mcam";
_officerUniform = "U_B_CombatUniform_mcam_tshirt";
_pilotUniform = "U_B_PilotCoveralls";
_sniperUniform = "U_B_GhillieSuit";
_marksmanUniform = _officerUniform;
_helicrewUniform = "U_B_PilotCoveralls";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = "U_B_CombatUniform_mcam_vest";
_demoUniform = _commonUniform;
_reconUniform = "U_B_CombatUniform_mcam_vest";

_commonVest = "V_PlateCarrier1_rgr";
_officerVest = "V_BandollierB_rgr";
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = "V_PlateCarrier2_rgr";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "V_PlateCarrier2_rgr";
_pilotVest = "V_BandollierB_rgr";

_commonBackpack = "B_AssaultPack_rgr";
_bigBackpack = "B_Carryall_oli";

// MISC EQUIPMENT =============================================================
_NVG = _NVGEN3BLU;

// EXTRA EQUIPMENT =============================================================
_hmg = "B_HMG_01_high_weapon_F";
_hmgTripod = "B_HMG_01_support_F";

_staticAT = "B_AT_01_weapon_F";
_atTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

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
