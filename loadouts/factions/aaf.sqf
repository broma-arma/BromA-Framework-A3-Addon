// INFO ========================================================================
/*
    In the wake of civil war, the Jerusalem Cease Fire of 2030 mandated the
    creation of an armed defence force to secure the sovereign territory of
    The Republic of Altis and Stratis.
*/

_factionID = "AAF";
_factionName = "AAF Units";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignINDFOR;

_defaultSide = RESISTANCE;
_defaultVoice = [_voiceALTIAN];
_defaultFace = [_faceGREEK];
_defaultName = [_nameAMERICAN];
_defaultColor = "green";
_defaultInsignia = "";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_AAF
    "plain"
    "camo"
*/

_camo = "plain";
if(!isNil"BRM_FMK_UNIFORMS_AAFMKCamo" && {BRM_FMK_UNIFORMS_AAFMKCamo})then{_camo="camo"}; // Backward compatibility
if(!isNil"BRM_FMK_LoadoutCamo_AAF")then{_camo=BRM_FMK_LoadoutCamo_AAF};

// WEAPONS =====================================================================

_commonRIFLE = _Mk20;
_commonRIFLEGL = _Mk20GL;
_commonPISTOL = _ACP45;
_commonAR = _Mk200;
_commonMG = _Mk200;
_commonMARKSMAN = _Mk18;
_commonSNIPER = _GM6;
_commonAT = _PCML;
_specAT = _PCML;
_weaponsAA = ["launch_I_Titan_F", "Titan_AA"];
_weaponsAT = ["launch_I_Titan_short_F", "Titan_AT"];
_commonSMG = _MK20C;
_commonRCO = "optic_MRCO";
_commonCCO = "optic_ACO_grn";
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_acp";
_NVG = _NVGEN3IND;

if (_camo == "camo") then {
	_commonRIFLE = _Mk20Camo;
	_commonRIFLEGL = _Mk20GLCamo;
	_commonSMG = _MK20CCamo;
};

_isSpecATDisposable = true;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 5;
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

_countTracerRIFLE = 2;
_countTracerMG = 1;
_countHE = 1;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = "H_HelmetIA";
_leaderHEAD = _commonHEAD;
_officerHEAD = "H_MilCap_dgtl";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_I";
_pilotHEAD = "H_PilotHelmetFighter_I";
_helicrewHEAD = "H_CrewHelmetHeli_I";
_helipilotHEAD = "H_PilotHelmetHeli_I";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_Booniehat_dgtl";

_commonUNIFORM = "U_I_CombatUniform";
_officerUNIFORM = "U_I_OfficerUniform";
_pilotUNIFORM = "U_I_PilotCoveralls";
_sniperUNIFORM = "U_I_GhillieSuit";
_marksmanUNIFORM = _officerUNIFORM;
_helicrewUNIFORM = "U_I_PilotCoveralls";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = "U_I_CombatUniform_shortsleeve";

_commonVEST = "V_Chestrig_oli";
_officerVEST = "V_BandollierB_oli";
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = "V_PlateCarrierIA2_dgtl";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "V_PlateCarrierIA1_dgtl";
_pilotVEST = "V_BandollierB_oli";

_commonBACKPACK = "B_AssaultPack_dgtl";
_bigBACKPACK = "B_Carryall_oli";

// EXTRA EQUIPMENT =============================================================

_HMG = "I_HMG_01_high_weapon_F";
_HMGTripod = "I_HMG_01_support_F";

_StaticAT = "I_AT_01_weapon_F";
_ATTripod = "I_HMG_01_support_F";

_mortar = "I_Mortar_01_weapon_F";
_mortarTripod = "I_Mortar_01_support_F";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ ["I_LT_01_AA_F"]
/*  Attack Helos      */,["I_Heli_light_03_F", "I_Heli_light_03_F"]
/*  Attack Planes     */,["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F"]
/*  Heavy Vehicles    */,["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F"]
/*  Light Vehicles    */,["I_MRAP_03_F", "I_MRAP_03_hmg_F"]
/*  Medium Vehicles   */,["I_APC_Wheeled_03_cannon_F","I_LT_01_AT_F","I_LT_01_cannon_F"]
/*  Mobile Artillery  */,["I_Mortar_01_F","I_Truck_02_MRL_F"]
/*  Transport Helos   */,["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["I_Truck_02_covered_F","I_Truck_02_transport_F"]
/*  Static Defence    */,["I_HMG_01_high_F","I_static_AA_F","I_static_AT_F","I_Mortar_01_F"]
/*  Boats             */,["I_Boat_Armed_01_minigun_F"]
/*  UAV               */,["I_UAV_02_CAS_F","I_UAV_02_F"]
/*  UGV               */,["I_UGV_01_F","I_UGV_01_rcws_F"]
/*  Support           */,["I_Truck_02_ammo_F","I_Truck_02_fuel_F", "I_Truck_02_medical_F", "I_Truck_02_box_F"]
/*  Submarines        */,["I_SDV_01_F"]
/*  MRAP Vehicles     */,["I_MRAP_03_F","I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_AAF_F"
/* Objects      */,["I_CargoNet_01_ammo_F"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["Land_Cargo_HQ_V1_F"]
];
