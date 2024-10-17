/*
    Requires Contact DLC

    The Livonian Defense Force (LDF) is a new and relatively small military faction, ideally suited for their role of protecting the territory of Livonia.
    The bulk of its forces are infantry, motorized, and mechanized elements. The LDF has access to a very modest Air Force.
    Much of its equipment is available in distinctive woodland 'geometric' camouflage.
    Though limited in number, they are highly trained and make very effective use of their unique arsenal of small arms.
*/

_factionID = "LDF";
_factionName = "Livonian Defense Force";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voicePolish];
_defaultFace = [_faceWhite, _faceLivonian];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "green";

// WEAPONS =====================================================================
_commonRifle = _Promet;
_commonRifleGL = _PrometGL;
_commonAR = _Mk200Blk;
_commonMG = _Mk200Blk;
_commonMarksman = _PrometDMR;
_commonSniper = _GM6;
_commonSMG = ["SMG_03C_black", "50Rnd_570x28_SMG_03"];

_commonPistol = _4FiveGrn;

_commonAT = _PCML;
_specAT = ["launch_MRAWS_green_F", "MRAWS_HEAT55_F"];
_weaponsAA = _TitanAAGeo;
_weaponsAT = _TitanAT;

_commonRCO = _ACOred;
_commonCCO = "optic_ico_01_f";

_arScope = _ACOred;
_marksmanScope = _SOS;
_sniperScope = "optic_LRPS";

_specATScope = "";

_commonSuppressor = _sup65;
_commonPistolSuppressor = _sup45;

_commonRail = _laser;
_commonBipod = "";

// AMMO COUNT ==================================================================
_countRifle = 10;
_countRifleLow = 5;
_countAR = 3;
_countMG = 3;
_countSniper = 7;
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
_commonHead = selectRandom ["H_HelmetHBK_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_headset_F"];
_leaderHead = selectRandom ["H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F"];
_officerHead = "H_Beret_EAF_01_F";
_medicHead = "H_HelmetHBK_ear_F";
_crewmanHead = "H_Tank_eaf_F";
_pilotHead = "H_PilotHelmetFighter_I_E";
_helicrewHead = "H_CrewHelmetHeli_I_E";
_helipilotHead = "H_PilotHelmetHeli_I_E";
_sniperHead = "H_HelmetHBK_headset_F";
_demoHead = "H_HelmetHBK_chops_F";
_reconHead = "H_Booniehat_eaf";

_commonUniform = "U_I_E_Uniform_01_F";
_officerUniform = "U_I_E_Uniform_01_officer_F";
_pilotUniform = "U_I_PilotCoveralls";
_sniperUniform = "U_B_FullGhillie_lsh";
_marksmanUniform = _commonUniform;
_helicrewUniform = "U_I_E_Uniform_01_coveralls_F";
_crewUniform = "U_I_E_Uniform_01_tanktop_F";
_mgUniform = "U_I_E_Uniform_01_shortsleeve_F";
_medicUniform = _mgUniform;
_demoUniform = _mgUniform;
_reconUniform = selectRandom [_commonUniform, _mgUniform, _crewUniform];

_commonVest = "V_CarrierRigKBT_01_light_EAF_F";
_officerVest = "V_BandollierB_oli";
_ftlVest = "V_CarrierRigKBT_01_heavy_EAF_F";
_slVest = _ftlVest;
_mgVest = _commonVest;
_grenadierVest = _ftlVest;
_medicVest = _ftlVest;
_demoVest = _ftlVest;
_marksmanVest = _commonVest;
_reconVest = selectRandom [_commonVest, _ftlVest];
_pilotVest = "V_CarrierRigKBT_01_EAF_F";

_commonBackpack = "B_AssaultPack_eaf_F";
_bigBackpack = "B_Carryall_eaf_F";

// MISC EQUIPMENT =============================================================
_NVG = _NVGGrn;

// EXTRA EQUIPMENT =============================================================
_hmg = "I_E_HMG_01_Weapon_F";
_hmgTripod = "I_E_HMG_01_support_F";

_staticAT = "I_E_AT_01_weapon_F";
_atTripod = "I_E_HMG_01_support_F";

_mortar = "I_E_Mortar_01_Weapon_F";
_mortarTripod = "I_E_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ []
/* Attack Helos      */,["I_E_Heli_light_03_dynamicLoadout_F"]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,[]
/* Light Vehicles    */,["I_E_Offroad_01_F", "I_E_Offroad_01_comms_F", "I_E_Offroad_01_covered_F"]
/* Medium Vehicles   */,["I_E_APC_tracked_03_cannon_F"]
/* Mobile Artillery  */,["I_E_Truck_02_MRL_F", "B_MBT_01_mlrs_F"]
/* Transport Helos   */,["I_E_Heli_light_03_unarmed_F"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["I_E_Truck_02_transport_F", "I_E_Truck_02_F"]
/* Static Defence    */,["I_E_HMG_01_high_F", "I_E_Static_AA_F", "I_E_Static_AT_F", "I_E_Mortar_01_F"]
/* Boats             */,[]
/* UAV               */,["I_E_UAV_01_F", "I_E_UAV_06_F"]
/* UGV               */,["I_E_UGV_01_F", "I_E_UGV_01_rcws_F"]
/* Support           */,["I_E_Truck_02_Box_F", "I_E_Truck_02_Ammo_F", "I_E_Truck_02_fuel_F", "I_E_Truck_02_Medical_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_EAF"
/* Objects    */,["I_E_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
