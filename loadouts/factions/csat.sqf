/*
    Formed at the apex of the Canton Protocol summits, this strategic alliance of
    states is built upon the goals of mutual defence, expanded global influence, and
    sustained economic growth.

    Camo: "BRN", "GRY" (BRM_FMK_LoadoutCamo_CSAT)
*/

_factionID = "CSAT";
_factionName = "CSAT Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFarsi];
_defaultFace = [_facePersian];
_defaultName = [_nameArabic];
_defaultInsignia = "";
_defaultColor = "red";

// CAMO ========================================================================
// BRM_FMK_UNIFORMS_CSATUrban - Backward compatibility (nife_tvt20_basebattle2_v080.stratis, engee_tvt20_zealous_beagles_v3.Bootcamp_ACR)
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_CSAT", ["BRN", "GRY"] select (missionNamespace getVariable ["BRM_FMK_UNIFORMS_CSATUrban", false])];
_lp = ["o", "ou"] select (_camo == "GRY"); // Loadout Pattern

// WEAPONS =====================================================================
_commonRifle = _Katiba;
_commonRifleGL = _KatibaGL;
_commonAR = _Zafir;
_commonMG = _Navid;
_commonMarksman = _Rahim;
_commonSniper = _GM6;
_commonSMG = _Sting;

_commonPistol = _Rook;

_commonAT = _RPG42;
_specAT = _RPG42;
_weaponsAA = ["launch_O_Titan_F", "Titan_AA"];
_weaponsAT = ["launch_O_Titan_short_F", "Titan_AT"];

_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";

_sniperScope = _SOS;

_commonSuppressor = "muzzle_snds_H";
_commonPistolSuppressor = "muzzle_snds_L";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 7;
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
_commonHead = "H_HelmetO_"+_lp+"camo";
_leaderHead = "H_HelmetLeaderO_"+_lp+"camo";
_officerHead = "H_MilCap_"+_lp+"camo";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_O";
_pilotHead = "H_PilotHelmetFighter_O";
_helicrewHead = "H_CrewHelmetHeli_O";
_helipilotHead = "H_PilotHelmetHeli_O";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "H_HelmetLeaderO_"+_lp+"camo";

_commonUniform = "U_O_CombatUniform_"+_lp+"camo";
_officerUniform = "U_O_OfficerUniform_ocamo";
_pilotUniform = "U_O_PilotCoveralls";
_sniperUniform = "U_O_GhillieSuit";
_marksmanUniform = _commonUniform;
_helicrewUniform = "U_O_PilotCoveralls";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "V_HarnessO_"+_camo;
_officerVest = "V_BandollierB_cbr";
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = "V_HarnessOGL_"+_camo;
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "V_HarnessOSpec_"+_camo;
_pilotVest = "V_BandollierB_cbr";

_commonBackpack = "B_AssaultPack_"+_lp+"camo";
_bigBackpack = "B_Carryall_"+_lp+"camo";

// MISC EQUIPMENT =============================================================
_NVG = _NVGEN3OP;

// EXTRA EQUIPMENT =============================================================
_hmg = "O_HMG_01_high_weapon_F";
_hmgTripod = "O_HMG_01_support_F";

_staticAT = "O_AT_01_weapon_F";
_atTripod = "O_HMG_01_support_F";

_mortar = "O_Mortar_01_weapon_F";
_mortarTripod = "O_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["O_APC_Tracked_02_AA_F", "O_APC_Tracked_02_AA_F"]
/* Attack Helos      */,["O_Heli_Attack_02_black_F", "O_Heli_Attack_02_F"]
/* Attack Planes     */,["O_Plane_CAS_02_F"]
/* Heavy Vehicles    */,["O_MBT_02_cannon_F", "O_APC_Tracked_02_cannon_F"]
/* Light Vehicles    */,["O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F"]
/* Medium Vehicles   */,["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_F"]
/* Mobile Artillery  */,["O_MBT_02_arty_F", "O_MBT_02_arty_F"]
/* Transport Helos   */,["O_Heli_Light_02_F", "O_Heli_Light_02_unarmed_F"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["O_Truck_03_transport_F", "O_Truck_03_covered_F"]
/* Static Defence    */,["O_HMG_01_high_F", "O_static_AA_F", "O_static_AT_F", "O_Mortar_01_F"]
/* Boats             */,["O_Boat_Armed_01_hmg_F"]
/* UAV               */,["O_UAV_02_CAS_F", "O_UAV_02_F"]
/* UGV               */,["O_UGV_01_F", "O_UGV_01_rcws_F"]
/* Support           */,["O_Truck_03_ammo_F", "O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_repair_F"]
/* Submarines        */,["O_SDV_01_F"]
/* MRAP Vehicles     */,["O_MRAP_02_hmg_F", "O_MRAP_02_hmg_F"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_CSAT_F"
/* Objects    */,["O_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_Tower_V3_F"]
];
