// INFO ========================================================================
/*
The Livonian Defense Force (LDF) is a new and relatively small military faction, ideally suited for their role of protecting the territory of Livonia.
The bulk of its forces are infantry, motorized, and mechanized elements. The LDF has access to a very modest Air Force.
Much of its equipment is available in distinctive woodland 'geometric' camouflage. 
Though limited in number, they are highly trained and make very effective use of their unique arsenal of small arms.
Requires Arma 3: Contact
*/

_factionID = "LDF";
_factionName = "Livonia Defense Force";
_factionStructure = "HIGH-TIER-CCO";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voicePOLISH];
_defaultFace = [_faceWHITE, _faceLIVONIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "green";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _MSBS65;
_commonRIFLEGL = _MSBS65GL;
_commonPISTOL = _4FiveGrn;
_commonMG = _Mk200Blk;
_commonMARKSMAN = _MSBS65DMR;
_commonSNIPER = _GM6;
_commonAT = ["launch_MRAWS_green_F", "MRAWS_HEAT55_F"];
_specAT = ["launch_I_Titan_short_F", "Titan_AT"];
_commonSMG = ["SMG_03C_black", "50Rnd_570x28_SMG_03"];
_commonRCO = "optic_ico_01_black_f";
_commonCCO = "optic_ico_01_f";
_commonMAGNIFIED = _LRPS;
_commonSUPPRESSOR = "muzzle_snds_H";
_commonPISTOLSUPPRESSOR = "muzzle_snds_acp";
_NVG = "NVGoggles_INDEP";

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
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
_countMgCARGO = 20;
_countSniperCARGO = 30;
_countATCARGO = 15;
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

_headsLIST = [
    "H_HelmetHBK_F",
    "H_HelmetHBK_headset_F"
];

_uniformsLIST = [
    "U_I_E_Uniform_01_F",
    "U_I_E_Uniform_01_shortsleeve_F",
    "U_I_E_Uniform_01_sweater_F",
];

_vestsLIST = [
    "V_CarrierRigKBT_01_light_EAF_F",
    "V_CarrierRigKBT_01_light_Olive_F"
];

_gogglesLIST = [
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = "H_HelmetHBK_ear_F";
_officerHEAD = "H_Beret_EAF_01_F";
_medicHEAD = _randomHEAD;
_crewmanHEAD = "H_Tank_eaf_F";
_pilotHEAD = "H_PilotHelmetFighter_I_E";
_helicrewHEAD = "H_CrewHelmetHeli_I_E";
_helipilotHEAD = "H_PilotHelmetHeli_I_E";
_sniperHEAD = _commonHEAD;
_demoHEAD = "H_HelmetHBK_chops_F";
_reconHEAD = "H_Booniehat_eaf";

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = "U_I_E_Uniform_01_officer_F";
_pilotUNIFORM = "U_I_PilotCoveralls";
_sniperUNIFORM = "U_B_FullGhillie_lsh";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "U_I_E_Uniform_01_coveralls_F";
_crewUNIFORM = "U_I_E_Uniform_01_shortsleeve_F";
_mgUNIFORM = "U_I_E_Uniform_01_tanktop_F";
_medicUNIFORM = "U_I_E_Uniform_01_shortsleeve_F";
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = "V_BandollierB_oli";
_ftlVEST = "V_CarrierRigKBT_01_heavy_EAF_F";
_slVEST = "V_CarrierRigKBT_01_heavy_EAF_F";
_mgVEST = _commonVEST;
_grenadierVEST = "V_CarrierRigKBT_01_heavy_EAF_F";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "B_AssaultPack_eaf_F";
_bigBACKPACK = "B_Carryall_eaf_F";

// EXTRA EQUIPMENT =============================================================

_HMG = "B_HMG_01_high_weapon_F";
_HMGTripod = "B_HMG_01_support_F";

_StaticAT = "B_AT_01_weapon_F";
_ATTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles    */      []
/*  Attack Helos 	 */	,["I_E_Heli_light_03_dynamicLoadout_F"]
/*  Attack Planes 	 */	,[]
/*  Heavy Vehicles 	 */	,[]
/*  Light Vehicles 	 */	,["I_E_Offroad_01_F", "I_E_Offroad_01_comms_F", "I_E_Offroad_01_covered_F"]
/*  Medium Vehicles 	 */	,[]
/*  Mobile Artillery     */	,["I_E_Truck_02_MRL_F","B_MBT_01_mlrs_F"]
/*  Transport Helos      */	,["I_E_Heli_light_03_unarmed_F"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["I_E_Truck_02_transport_F","I_E_Truck_02_F"]
/*  Static Defence       */	,["I_E_HMG_01_high_F","I_E_Static_AA_F","I_E_Static_AT_F","I_E_Mortar_01_F"]
/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["I_E_UAV_01_F","I_E_UAV_06_F"]
/*  UGV                  */	,["I_E_UGV_01_F","I_E_UGV_01_rcws_F"]
/*  Support              */	,["I_E_Truck_02_Box_F","I_E_Truck_02_Ammo_F","I_E_Truck_02_fuel_F", "I_E_Truck_02_Medical_F"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */     ,[]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_EAF",
/* Objects      */ ["I_E_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================