// INFO ========================================================================
/*
    This is the template you can use to create your own loadouts.

    Customize it as you wish.
*/

_factionID = "empire";
_factionName = "Olive Empire";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = EAST;
_defaultVoice = _allVoices;
_defaultFace = _allFaces;
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = ["rhs_weap_m38", "rhsgref_5Rnd_762x54_m38"];
_commonRIFLEGL = _commonRIFLE;
_commonPISTOL = ["hgun_Pistol_heavy_02_F", "6Rnd_45ACP_Cylinder"];
_commonMG = _commonRIFLE;
_commonMARKSMAN = _Mk20;
_commonSNIPER = _GM6;
_commonAT = _RPG42;
_specAT = _RPG42;
_commonSMG = _Mk20C;
_commonRCO = _ARCO;
_commonCCO = _EOT;
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_M";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
//_NVG = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE = 36;
_countRIFLELOW = 21;
_countPISTOL = 3;
_countMG = 35;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 0;
_countTracerMG = 0;
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
    "rhs_altyn_novisor_bala",
    "rhs_altyn_novisor",
    "rhs_altyn_novisor_ess",
    "rhs_altyn_novisor_ess_bala"
];

_uniformsLIST = [
    "rhsgref_uniform_woodland_olive"
];

_vestsLIST = [
    "TAC_V_Sheriff_BA_T3"
];

_gogglesLIST = [
    "Mask_M50"
];

_randomHEAD = _headsLIST call BIS_fnc_selectRandom;
_randomUNIFORM = _uniformsLIST call BIS_fnc_selectRandom;
_randomVEST = _vestsLIST call BIS_fnc_selectRandom;

_commonHEAD = _randomHEAD;
_leaderHEAD = _commonHEAD;
_officerHEAD = _commonHEAD;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhsusf_cvc_ess";
_pilotHEAD = "rhsusf_hgu56p";
_helicrewHEAD = "rhsusf_hgu56p_mask";
_helipilotHEAD = "rhsusf_hgu56p";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = _randomUNIFORM;
_officerUNIFORM = _commonUNIFORM  ;
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = _randomVEST;
_officerVEST = _commonVEST;
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "rhsusf_falconii";
_bigBACKPACK = "B_Carryall_ocamo";

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
/*  Anti Air Vehicles    */      ["B_APC_Tracked_01_AA_F"]
/*  Attack Helos 	 */	,["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]
/*  Attack Planes 	 */	,["B_Plane_CAS_01_F"]
/*  Heavy Vehicles 	 */	,["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"]
/*  Light Vehicles 	 */	,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
/*  Medium Vehicles 	 */	,["B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"]
/*  Mobile Artillery     */	,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
/*  Transport Helos      */	,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/*  Transport Planes     */	,[]
/*  Transport Trucks     */	,["B_Truck_01_transport_F","B_Truck_01_covered_F"]
/*  Static Defence       */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*  Boats                */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                  */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                  */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support              */	,["B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
/*  Submarines           */	,["B_SDV_01_F"]
/*  MRAP Vehicles        */     ,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
