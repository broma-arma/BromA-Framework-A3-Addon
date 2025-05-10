/*
    Decades of economic and political turbulence across member states has left
    NATO weakened and facing a strategic paradigm shift.

    NOW AVAILABLE IN GREEN CAMO FOR PACIFIC OPS*

    *Hawaiian shirt not inclued.
*/

_factionID = "NATOP";
_factionName = "NATO Pacific Troops";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAmerican];
_defaultFace = [_faceWhite, _faceBlack, _faceAsian];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = ["arifle_MX_khk_F", "30Rnd_65x39_caseless_mag"];
_commonRifleGL = ["arifle_MX_GL_khk_F", "30Rnd_65x39_caseless_mag", "1Rnd_HE_Grenade_shell"];
_commonAR = ["arifle_MX_SW_khk_F", "100Rnd_65x39_caseless_mag_Tracer"];
_commonMG = _M240B;
_commonMarksman = ["arifle_MXM_khk_F", "30Rnd_65x39_caseless_mag"];
_commonSniper = _M200;
_commonSMG = ["arifle_MXC_khk_F", "30Rnd_65x39_caseless_mag"];

_commonPistol = ["hgun_P07_khk_F", "16Rnd_9x21_Mag"];

_commonAT = _PCML;
_specAT = _PCML;
_weaponsAA = ["launch_B_Titan_tna_F", "Titan_AA"];
_weaponsAT = ["launch_B_Titan_short_tna_F", "Titan_AT"];

_commonRCO = "optic_ERCO_khk_F";
_commonCCO = "optic_Holosight_khk_F";

_sniperScope = _SOS;

_commonSuppressor = "muzzle_snds_H_khk_F";
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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = "H_HelmetB_Enh_tna_F";
_leaderHead = "H_HelmetB_Enh_tna_F";
_officerHead = "H_MilCap_tna_F";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_O";
_pilotHead = "H_PilotHelmetFighter_O";
_helicrewHead = "H_CrewHelmetHeli_O";
_helipilotHead = "H_PilotHelmetHeli_O";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "H_HelmetB_Light_tna_F";

_commonUniform = "U_B_T_Soldier_F";
_officerUniform = "U_B_T_Soldier_AR_F";
_pilotUniform = "U_B_PilotCoveralls";
_sniperUniform = "U_B_T_Sniper_F";
_marksmanUniform = _officerUniform;
_helicrewUniform = "U_B_PilotCoveralls";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "V_PlateCarrier1_tna_F";
_officerVest = "V_BandollierB_rgr";
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = "V_PlateCarrier2_tna_F";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "V_PlateCarrier2_tna_F";
_pilotVest = "V_BandollierB_oli";

_commonBackpack = "B_AssaultPack_tna_F";
_bigBackpack = "B_Bergen_tna_F";

// MISC EQUIPMENT =============================================================
_NVG = "NVGoggles_tna_F";

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
/* Light Vehicles    */,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F", "B_T_LSV_01_armed_F", "B_T_LSV_01_unarmed_F"]
/* Medium Vehicles   */,["B_APC_Tracked_01_rcws_F", "B_APC_Wheeled_01_cannon_F"]
/* Mobile Artillery  */,["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"]
/* Transport Helos   */,["B_Heli_Light_01_F", "B_Heli_Transport_01_F", "B_Heli_Transport_01_camo_F"]
/* Transport Planes  */,["B_T_VTOL_01_infantry_F"]
/* Transport Trucks  */,["B_Truck_01_transport_F", "B_Truck_01_covered_F"]
/* Static Defence    */,["B_HMG_01_high_F", "B_static_AA_F", "B_static_AT_F", "B_Mortar_01_F"]
/* Boats             */,["B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F", "B_T_UAV_03_F"]
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
