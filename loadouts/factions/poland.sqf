/*
    Polish Armed Forces

    Camo: "wdl", "des" (BRM_FMK_LoadoutCamo_POLAND)
*/

_factionID = "POLAND";
_factionName = "Polish Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [["Male01POL", "Male02POL", "Male03POL"]];
_defaultFace = [_faceWhite];
_defaultName = [_nameRussian];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_POLAND", "wdl"];

// WEAPONS =====================================================================
_commonRifle = ["PSZ_Beryl96", "PSZ_556x45_Beryl_30"];
_commonRifleGL = ["PSZ_Beryl96_Pallad", "PSZ_556x45_Beryl_30", "PSZ_40x47_NGO74_HE"];
_reconRifle = ["PSZ_Beryl04_D", "PSZ_556x45_STANAG_30"];
_commonAR = ["PSZ_UKM_D", "PSZ_762x51_Belt_100_T_R"];
_commonMG = ["PSZ_UKM_D", "PSZ_762x51_Belt_100_T_R"];
_commonMarksman = _SVD;
_commonSniper = ["PSZ_Tor", "PSZ_127x99_Tor_7"];
_commonSMG = ["PSZ_BerylMini96", "PSZ_556x45_Beryl_30"];

_commonPistol = ["PSZ_VIS100", "16Rnd_9x21_Mag"];

_commonAT = ["PSZ_RPG76", "PSZ_PG76_HEAT"];
_specAT = _RPG7PGO;
_weaponsAA = ["PSZ_Grom", "PSZ_Grom_AA"];
_weaponsAT = _JAVELIN;

_commonRCO = "rhsusf_acc_g33_xps3_flip";
_commonCCO = "PSZ_AccO_EOT552";

_rifleScope = _commonCCO;
_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "PSZ_AccO_LeupoldMk4_35_10x40_M3";

_commonSuppressor = "";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 7;
_countRifleLow = 4;
_countMG = 3;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 20;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
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
_countEpiCargo = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr", "rhs_googles_black", ""];

_commonHead = selectRandom ([
	["PSZ_H_wz2005_OLIVE", "PSZ_H_wz2005_OLIVE_ESS", "PSZ_H_wz2005_WDL", "PSZ_H_wz2005_WDL_ESS"],
	["PSZ_H_wz2005_SAND", "PSZ_H_wz2005_SAND_ESS", "PSZ_H_wz2005_DES", "PSZ_H_wz2005_DES_ESS"]
] select (_camo == "des"));
_leaderHead = _commonHead;
_officerHead = "PSZ_H_Beret_Airborne";
_medicHead = _commonHead;
_crewmanHead = "rhs_tsh4_ess";
_pilotHead = "BRM_SPH4V_GREEN";
_helicrewHead = "BRM_SPH4V_GREEN";
_helipilotHead = "BRM_SPH4V_GREEN";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = _commonHead;

_commonUniform = selectRandom [
	"PSZ_U_PL_"+_camo+"_wz2010_Crye",
	"PSZ_U_PL_"+_camo+"_wz2010_Crye_Folded"
];
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = ["U_B_FullGhillie_ard", "U_B_T_FullGhillie_tna_F"] select (_camo == "wdl");
_marksmanUniform = _commonUniform;
_helicrewUniform = _commonUniform;
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "PSZ_V_UKO_L_"+_camo+"_R";
_officerVest = _commonVest;
_ftlVest = "PSZ_V_UKO_L_"+_camo+"_GL";
_slVest = _commonVest;
_mgVest = "PSZ_V_UKO_L_"+_camo+"_MG";
_grenadierVest = "PSZ_V_UKO_L_"+_camo+"_GL";
_medicVest = "PSZ_V_UKO_L_"+_camo+"_M";
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = ["BRM_PatrolBP_Brown", "BRM_PatrolBP_Green"] select (_camo == "wdl");
_bigBackpack = ["BRM_PatrolBPH_Brown", "BRM_PatrolBP_Green"] select (_camo == "wdl");

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT =============================================================
_NVG = "rhsusf_ANPVS_15";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_M2_Gun_Bag";
_hmgTripod = "RHS_M2_Tripod_Bag";

_staticAT = "rhs_Tow_Gun_Bag";
_atTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ []
/* Attack Helos      */,["PSZ_PL_WDL10_Mi24W", "PSZ_PL_WDL10_Mi24D"]
/* Attack Planes     */,[]
/* Heavy Vehicles    */,["PSZ_PL_WDL20_Leopard_2PL"]
/* Light Vehicles    */,["PSZ_PL_WDL10_Tumak2_WKM", "PSZ_PL_WDL10_Tumak2_UKM", "PSZ_PL_WDL10_Tumak2"]
/* Medium Vehicles   */,["PSZ_PL_WDL10_Rosomak_1", "PSZ_PL_WDL10_Rosomak_M1M"]
/* Mobile Artillery  */,[]
/* Transport Helos   */,["PSZ_PL_WDL10_Mi17_1W_UB32"]
/* Transport Planes  */,[]
/* Transport Trucks  */,["PSZ_PL_WDL10_Star_1466"]
/* Static Defence    */,["RHS_Stinger_AA_pod_WD", "RHS_M2StaticMG_WD", "RHS_TOW_TriPod_WD"]
/* Boats             */,[]
/* UAV               */,[]
/* UGV               */,[]
/* Support           */,["PSZ_PL_WDL10_Star_1466_Command", "PSZ_PL_WDL10_Star_1466_Fuel"]
/* Submarines        */,[]
/* MRAP Vehicles     */,["PSZ_PL_WDL10_Zbik_M97", "PSZ_PL_WDL10_Zbik_M96"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "PSZ_PL_Flag"
/* Objects    */,["Box_EAF_Equip_F"]
/* Walls      */,["Land_BagFence_Long_F"]
/* Structures */,["Land_BagBunker_Tower_F"]
];
