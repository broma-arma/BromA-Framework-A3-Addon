/*
    Polish Armed Forces
*/

_factionID = "POLAND";
_factionName = "Polish Armed Forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [["Male01POL","Male02POL","Male03POL"]];
_defaultFace = [_faceWHITE];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
/*
    Set in mission with: BRM_FMK_LoadoutCamo_POLAND
    "wdl" woodland
    "des" desert
*/

_camo = "wdl";
if (!isNil "BRM_FMK_LoadoutCamo_POLAND") then {_camo=BRM_FMK_LoadoutCamo_POLAND};

// WEAPONS =====================================================================

_commonRIFLE = ["PSZ_Beryl96","PSZ_556x45_Beryl_30"];
_commonRIFLEGL = ["PSZ_Beryl96_Pallad","PSZ_556x45_Beryl_30","PSZ_40x47_NGO74_HE"];
_commonPISTOL = ["PSZ_VIS100","16Rnd_9x21_Mag"];
_commonMG = ["PSZ_UKM_D","PSZ_762x51_Belt_100_T_R"];
_commonMARKSMAN = _SVD;
_commonSNIPER = ["PSZ_Tor","PSZ_127x99_Tor_7"];
_commonAT = ["PSZ_RPG76","PSZ_PG76_HEAT"];
_specAT = _RPG7PGO;
_weaponsAA = ["PSZ_Grom","PSZ_Grom_AA"];
_weaponsAT = _JAVELIN;
_commonSMG = ["PSZ_BerylMini96","PSZ_556x45_Beryl_30"];
_commonRCO = "rhsusf_acc_g33_xps3_flip";
_marksmanSCOPE = "rhs_acc_pso1m2";
_commonCCO = "PSZ_AccO_EOT552";
_sniperSCOPE = "PSZ_AccO_LeupoldMk4_35_10x40_M3";
_commonSUPPRESSOR = "";
_commonPISTOLSUPPRESSOR = "";
_NVG = "rhsusf_ANPVS_15";

_rifleSCOPE = _commonCCO;
_reconRIFLE = ["PSZ_Beryl04_D","PSZ_556x45_STANAG_30"];

// AMMO COUNT ==================================================================

_countRIFLE = 7;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countMG = 3;
_countSNIPER = 5;
_countSpecAT = 3;
_countGRENADES = 3;
_count40mm = 20;

_countTracerRIFLE = 2;
_countTracerMG = 1;

_countRifleCARGO = 30;
_countPistolCARGO = 10;
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

_randomGOGGLE = selectRandom ["rhsusf_oakley_goggles_clr","rhs_googles_black",""];

_commonHEAD = if (_camo == "wdl") then {
	selectRandom [
		"PSZ_H_wz2005_OLIVE",
		"PSZ_H_wz2005_OLIVE_ESS",
		"PSZ_H_wz2005_WDL",
		"PSZ_H_wz2005_WDL_ESS"
	];
} else {
	selectRandom [
		"PSZ_H_wz2005_SAND",
		"PSZ_H_wz2005_SAND_ESS",
		"PSZ_H_wz2005_DES",
		"PSZ_H_wz2005_DES_ESS"
	];
};
_leaderHEAD = _commonHEAD;
_officerHEAD = "PSZ_H_Beret_Airborne";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_ess";
_pilotHEAD = "BRM_SPH4V_GREEN";
_helicrewHEAD = "BRM_SPH4V_GREEN";
_helipilotHEAD = "BRM_SPH4V_GREEN";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = selectRandom [
		"PSZ_U_PL_"+_camo+"_wz2010_Crye",
		"PSZ_U_PL_"+_camo+"_wz2010_Crye_Folded"
];
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "UK3CB_CHC_C_U_Overall_01";
_sniperUNIFORM = ["U_B_FullGhillie_ard", "U_B_T_FullGhillie_tna_F"] select (_camo == "wdl");
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "PSZ_V_UKO_L_"+_camo+"_R";
_officerVEST = _commonVEST;
_ftlVEST = "PSZ_V_UKO_L_"+_camo+"_GL";
_slVEST = _commonVEST;
_mgVEST = "PSZ_V_UKO_L_"+_camo+"_MG";
_grenadierVEST = "PSZ_V_UKO_L_"+_camo+"_GL";
_medicVEST = "PSZ_V_UKO_L_"+_camo+"_M";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;
_pilotVEST = "UK3CB_V_Pilot_Vest";

_commonBACKPACK = ["BRM_PatrolBP_Brown", "BRM_PatrolBP_Green"] select (_camo == "wdl");
_bigBACKPACK = ["BRM_PatrolBPH_Brown", "BRM_PatrolBP_Green"] select (_camo == "wdl");

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_M2_Gun_Bag";
_HMGTripod = "RHS_M2_Tripod_Bag";

_StaticAT = "rhs_Tow_Gun_Bag";
_ATTripod = "rhs_TOW_Tripod_Bag";

_mortar = "rhs_M252_Gun_Bag";
_mortarTripod = "rhs_M252_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */ []
/*  Attack Helos      */,["PSZ_PL_WDL10_Mi24W","PSZ_PL_WDL10_Mi24D"]
/*  Attack Planes     */,[]
/*  Heavy Vehicles    */,["PSZ_PL_WDL20_Leopard_2PL"]
/*  Light Vehicles    */,["PSZ_PL_WDL10_Tumak2_WKM","PSZ_PL_WDL10_Tumak2_UKM","PSZ_PL_WDL10_Tumak2"]
/*  Medium Vehicles   */,["PSZ_PL_WDL10_Rosomak_1","PSZ_PL_WDL10_Rosomak_M1M"]
/*  Mobile Artillery  */,[]
/*  Transport Helos   */,["PSZ_PL_WDL10_Mi17_1W_UB32"]
/*  Transport Planes  */,[]
/*  Transport Trucks  */,["PSZ_PL_WDL10_Star_1466"]
/*  Static Defence    */,["RHS_Stinger_AA_pod_WD","RHS_M2StaticMG_WD","RHS_TOW_TriPod_WD"]
/*  Boats             */,[]
/*  UAV               */,[]
/*  UGV               */,[]
/*  Support           */,["PSZ_PL_WDL10_Star_1466_Command","PSZ_PL_WDL10_Star_1466_Fuel"]
/*  Submarines        */,[]
/*  MRAP Vehicles     */,["PSZ_PL_WDL10_Zbik_M97","PSZ_PL_WDL10_Zbik_M96"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "PSZ_PL_Flag"
/* Objects      */,["Box_EAF_Equip_F"]
/* Walls        */,["Land_BagFence_Long_F"]
/* Structures   */,["Land_BagBunker_Tower_F"]
];
