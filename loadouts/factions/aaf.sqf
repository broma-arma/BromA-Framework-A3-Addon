/*
    In the wake of civil war, the Jerusalem Cease Fire of 2030 mandated the
    creation of an armed defence force to secure the sovereign territory of
    The Republic of Altis and Stratis.

    Camo: "plain", "camo" (BRM_FMK_LoadoutCamo_AAF)
*/

_factionID = "AAF";
_factionName = "AAF Units";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceAltian];
_defaultFace = [_faceGreek];
_defaultName = [_nameAmerican];
_defaultInsignia = "";
_defaultColor = "green";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_AAF", "plain"];

// WEAPONS =====================================================================
_commonRifle = [_Mk20, _Mk20Camo] select (_camo == "camo");
_commonRifleGL = [_Mk20GL, _Mk20GLCamo] select (_camo == "camo");
_commonAR = _Mk200;
_commonMG = _Mk200;
_commonMarksman = _Mk18;
_commonSniper = _GM6;
_commonSMG = [_MK20C, _MK20CCamo] select (_camo == "camo");

_commonPistol = _ACP45;

_commonAT = _PCML;
_specAT = _PCML;
_weaponsAA = ["launch_I_Titan_F", "Titan_AA"];
_weaponsAT = ["launch_I_Titan_short_F", "Titan_AT"];

_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";

_sniperScope = _SOS;

_commonSuppressor = "muzzle_snds_M";
_commonPistolSuppressor = "muzzle_snds_acp";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countAR = 5;
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
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_commonHead = "H_HelmetIA";
_leaderHead = _commonHead;
_officerHead = "H_MilCap_dgtl";
_medicHead = _commonHead;
_crewmanHead = "H_HelmetCrew_I";
_pilotHead = "H_PilotHelmetFighter_I";
_helicrewHead = "H_CrewHelmetHeli_I";
_helipilotHead = "H_PilotHelmetHeli_I";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = "H_Booniehat_dgtl";

_commonUniform = "U_I_CombatUniform";
_officerUniform = "U_I_OfficerUniform";
_pilotUniform = "U_I_PilotCoveralls";
_sniperUniform = "U_I_GhillieSuit";
_marksmanUniform = _officerUniform;
_helicrewUniform = "U_I_PilotCoveralls";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = "U_I_CombatUniform_shortsleeve";

_commonVest = "V_Chestrig_oli";
_officerVest = "V_BandollierB_oli";
_ftlVest = _commonVest;
_slVest = _commonVest;
_mgVest = _commonVest;
_grenadierVest = "V_PlateCarrierIA2_dgtl";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = "V_PlateCarrierIA1_dgtl";
_pilotVest = "V_BandollierB_oli";

_commonBackpack = "B_AssaultPack_dgtl";
_bigBackpack = "B_Carryall_oli";

// MISC EQUIPMENT =============================================================
_NVG = _NVGEN3IND;

// EXTRA EQUIPMENT =============================================================
_hmg = "I_HMG_01_high_weapon_F";
_hmgTripod = "I_HMG_01_support_F";

_staticAT = "I_AT_01_weapon_F";
_atTripod = "I_HMG_01_support_F";

_mortar = "I_Mortar_01_weapon_F";
_mortarTripod = "I_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["I_LT_01_AA_F"]
/* Attack Helos      */,["I_Heli_light_03_F", "I_Heli_light_03_F"]
/* Attack Planes     */,["I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_CAS_F"]
/* Heavy Vehicles    */,["I_MBT_03_cannon_F", "I_APC_tracked_03_cannon_F"]
/* Light Vehicles    */,["I_MRAP_03_F", "I_MRAP_03_hmg_F"]
/* Medium Vehicles   */,["I_APC_Wheeled_03_cannon_F", "I_LT_01_AT_F", "I_LT_01_cannon_F"]
/* Mobile Artillery  */,["I_Mortar_01_F", "I_Truck_02_MRL_F"]
/* Transport Helos   */,["I_Heli_Transport_02_F", "I_Heli_light_03_unarmed_F"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["I_Truck_02_covered_F", "I_Truck_02_transport_F"]
/* Static Defence    */,["I_HMG_01_high_F", "I_static_AA_F", "I_static_AT_F", "I_Mortar_01_F"]
/* Boats             */,["I_Boat_Armed_01_minigun_F"]
/* UAV               */,["I_UAV_02_CAS_F", "I_UAV_02_F"]
/* UGV               */,["I_UGV_01_F", "I_UGV_01_rcws_F"]
/* Support           */,["I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_medical_F", "I_Truck_02_box_F"]
/* Submarines        */,["I_SDV_01_F"]
/* MRAP Vehicles     */,["I_MRAP_03_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_AAF_F"
/* Objects    */,["I_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_Cargo_HQ_V1_F"]
];
