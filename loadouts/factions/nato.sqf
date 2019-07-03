// INFO ========================================================================
/*
    Decades of economic and political turbulence across member states has left
    NATO weakened and facing a strategic paradigm shift.
*/
// =============================================================================

_factionID = "NATO";
_factionName = "NATO Troops";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceAMERICAN, _voiceBRITISH];
_defaultFace = [_faceWHITE, _faceBLACK, _faceASIAN];
_defaultName = [_nameAMERICAN];
_defaultInsignia = "";
_defaultColor = "blue";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

// Set in mission with: BRM_FMK_UNIFORMS_NATOBlackMX
_blackMX = true;

_rr=_MX;_rg=_MXGL;_rm=_MXSW;_rk=_MXM;_rc=_MXC;
if(!isNil"BRM_FMK_UNIFORMS_NATOBlackMX")then{_blackMX=BRM_FMK_UNIFORMS_NATOBlackMX};
if (_blackMX) then { _rr=_MXBlack;_rg=_MXGLBlack;_rm=_MXSWBlack;_rk=_MXMBlack;_rc=_MXCBlack; };

_commonRIFLE = _rr;
_commonRIFLEGL = _rg;
_commonPISTOL = _P07;
_commonAR = _rm;
_commonMG = _M240B;
_commonMARKSMAN = _rk;
_commonSNIPER = _M200;
_commonAT = _PCML;
_specAT = _PCML;
_commonSMG = _rc;
_commonRCO = _RCO;
_commonCCO = _ACOred;
_commonMAGNIFIED = _SOS;
_commonSUPPRESSOR = "muzzle_snds_H";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = _NVGEN3BLU;

_isATDisposable = true;

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 3;
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
_countCAT = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO = 40;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_commonHEAD = "H_HelmetB";
_leaderHEAD = "H_HelmetB";
_officerHEAD = "H_MilCap_mcamo";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "H_HelmetCrew_O";
_pilotHEAD = "H_PilotHelmetFighter_O";
_helicrewHEAD = "H_CrewHelmetHeli_O";
_helipilotHEAD = "H_PilotHelmetHeli_O";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "H_Watchcap_blk";

_commonUNIFORM = "U_B_CombatUniform_mcam";
_officerUNIFORM = "U_B_CombatUniform_mcam_tshirt";
_pilotUNIFORM = "U_B_PilotCoveralls";
_sniperUNIFORM = "U_B_GhillieSuit";
_marksmanUNIFORM = _officerUNIFORM;
_helicrewUNIFORM = "U_B_PilotCoveralls";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = "U_B_CombatUniform_mcam_vest";
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = "U_B_CombatUniform_mcam_vest";

_commonVEST = "V_PlateCarrier1_rgr";
_officerVEST = "V_BandollierB_rgr";
_ftlVEST = _commonVEST;
_slVEST = _commonVEST;
_mgVEST = _commonVEST;
_grenadierVEST = "V_PlateCarrier2_rgr";
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = "V_PlateCarrier2_rgr";

_commonBACKPACK = "B_AssaultPack_rgr";
_bigBACKPACK = "B_Carryall_oli";

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
/*  Anti Air Vehicles     */     ["B_APC_Tracked_01_AA_F"]
/*  Attack Helos 	  */	,["B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]
/*  Attack Planes 	  */	,["B_Plane_CAS_01_F"]
/*  Heavy Vehicles 	  */	,["B_MBT_01_cannon_F","B_MBT_01_TUSK_F"]
/*  Light Vehicles 	  */	,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
/*  Medium Vehicles 	  */	,["B_APC_Tracked_01_rcws_F","B_APC_Wheeled_01_cannon_F"]
/*  Mobile Artillery      */	,["B_MBT_01_arty_F","B_MBT_01_mlrs_F"]
/*  Transport Helos       */	,["B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"]
/*  Transport Planes      */	,[]
/*  Transport Trucks      */	,["B_Truck_01_transport_F","B_Truck_01_covered_F"]
/*  Static Defence        */	,["B_HMG_01_high_F","B_static_AA_F","B_static_AT_F","B_Mortar_01_F"]
/*  Boats                 */	,["B_Boat_Armed_01_minigun_F"]
/*  UAV                   */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV                   */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support               */	,["B_Truck_01_Repair_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F", "B_Truck_01_medical_F"]
/*  Submarines            */	,["B_SDV_01_F"]
/*  MRAP Vehicles         */    ,["B_MRAP_01_hmg_F", "B_MRAP_01_hmg_F"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F",
/* Objects      */ ["B_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_Mil_WallBig_4m_F"],
/* Structures   */ ["Land_Cargo_House_V3_F"]
];

// =============================================================================
