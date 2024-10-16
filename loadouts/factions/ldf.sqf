/*
    Requires Contact DLC

    The Livonian Defense Force (LDF) is a new and relatively small military faction, ideally suited for their role of protecting the territory of Livonia.
    The bulk of its forces are infantry, motorized, and mechanized elements. The LDF has access to a very modest Air Force.
    Much of its equipment is available in distinctive woodland 'geometric' camouflage.
    Though limited in number, they are highly trained and make very effective use of their unique arsenal of small arms.
*/

_factionID = "LDF";
_factionName = "Livonian Defense Force";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voicePOLISH];
_defaultFace = [_faceWHITE, _faceLIVONIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "green";

// WEAPONS =====================================================================

_commonRifle = _Promet;
_commonRifleGL = _PrometGL;
_commonPistol = _4FiveGrn;
_commonMG = _Mk200Blk;
_commonMarksman = _PrometDMR;
_commonSniper = _GM6;
_commonAT = _PCML;
_specAT = ["launch_MRAWS_green_F", "MRAWS_HEAT55_F"];
_commonSMG = ["SMG_03C_black", "50Rnd_570x28_SMG_03"];
_weaponsAA = _TitanAAGeo;
_weaponsAT = _TitanAT;

_commonRCO = _ACOred;
_commonCCO = "optic_ico_01_f";
_sniperSCOPE = "optic_LRPS";
_marksmanScope = _SOS;
_specATScope = "";
_arSCOPE = _ACOred;
_commonSuppressor = _sup65;
_commonPistolSuppressor = _sup45;
_commonRail = _laser;
_commonBipod = "";
_NVG = _NVGGrn;

// AMMO COUNT ==================================================================

_countRIFLE = 10;
_countRIFLELOW = 5;
_countPISTOL = 2;
_countAR = 3;
_countMG = 3;
_countSNIPER = 7;
_countSpecAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
_countArCARGO = 20;
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countSpecATCARGO = 15;
_countGrenadesCARGO = 20;
_count40mmCARGO = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = selectRandom ["H_HelmetHBK_F", "H_HelmetHBK_chops_F", "H_HelmetHBK_headset_F"];
_leaderHEAD = selectRandom ["H_HelmetHBK_chops_F", "H_HelmetHBK_ear_F"];
_officerHEAD = "H_Beret_EAF_01_F";
_medicHEAD = "H_HelmetHBK_ear_F";
_crewmanHEAD = "H_Tank_eaf_F";
_pilotHEAD = "H_PilotHelmetFighter_I_E";
_helicrewHEAD = "H_CrewHelmetHeli_I_E";
_helipilotHEAD = "H_PilotHelmetHeli_I_E";
_sniperHEAD = "H_HelmetHBK_headset_F";
_demoHEAD = "H_HelmetHBK_chops_F";
_reconHEAD = "H_Booniehat_eaf";

_commonUNIFORM = "U_I_E_Uniform_01_F";
_officerUNIFORM = "U_I_E_Uniform_01_officer_F";
_pilotUNIFORM = "U_I_PilotCoveralls";
_sniperUNIFORM = "U_B_FullGhillie_lsh";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_I_E_Uniform_01_coveralls_F";
_crewUNIFORM = "U_I_E_Uniform_01_tanktop_F";
_mgUNIFORM = "U_I_E_Uniform_01_shortsleeve_F";
_medicUNIFORM = _mgUNIFORM;
_demoUNIFORM = _mgUNIFORM;
_reconUNIFORM = selectRandom [_commonUNIFORM, _mgUNIFORM, _crewUNIFORM];

_commonVEST = "V_CarrierRigKBT_01_light_EAF_F";
_officerVEST = "V_BandollierB_oli";
_ftlVEST = "V_CarrierRigKBT_01_heavy_EAF_F";
_slVEST = _ftlVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _ftlVEST;
_medicVEST = _ftlVEST;
_demoVEST = _ftlVEST;
_marksmanVEST = _commonVEST;
_reconVEST = selectRandom [_commonVEST, _ftlVEST];
_pilotVEST = "V_CarrierRigKBT_01_EAF_F";

_commonBACKPACK = "B_AssaultPack_eaf_F";
_bigBACKPACK = "B_Carryall_eaf_F";

// EXTRA EQUIPMENT =============================================================

_HMG = "I_E_HMG_01_Weapon_F";
_HMGTripod = "I_E_HMG_01_support_F";

_StaticAT = "I_E_AT_01_weapon_F";
_ATTripod = "I_E_HMG_01_support_F";

_mortar = "I_E_Mortar_01_Weapon_F";
_mortarTripod = "I_E_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ []
/*  Attack Helos      */,["I_E_Heli_light_03_dynamicLoadout_F"]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,[]
/*  Light Vehicles    */,["I_E_Offroad_01_F", "I_E_Offroad_01_comms_F", "I_E_Offroad_01_covered_F"]
/*  Medium Vehicles   */,["I_E_APC_tracked_03_cannon_F"]
/*  Mobile Artillery  */,["I_E_Truck_02_MRL_F", "B_MBT_01_mlrs_F"]
/*  Transport Helos   */,["I_E_Heli_light_03_unarmed_F"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["I_E_Truck_02_transport_F", "I_E_Truck_02_F"]
/*  Static Defence    */,["I_E_HMG_01_high_F", "I_E_Static_AA_F", "I_E_Static_AT_F", "I_E_Mortar_01_F"]
/*  Boats             */,[]
/*  UAV               */,["I_E_UAV_01_F", "I_E_UAV_06_F"]
/*  UGV               */,["I_E_UGV_01_F", "I_E_UGV_01_rcws_F"]
/*  Support           */,["I_E_Truck_02_Box_F", "I_E_Truck_02_Ammo_F", "I_E_Truck_02_fuel_F", "I_E_Truck_02_Medical_F"]
/*  Submarines        */,["B_SDV_01_F"]
/*  MRAP Vehicles     */,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_EAF"
/* Objects      */,["I_E_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
