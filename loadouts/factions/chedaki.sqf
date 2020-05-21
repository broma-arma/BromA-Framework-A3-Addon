// INFO ========================================================================
/*
    Although the communist insurgency has its roots as an underground movement,
    it is now a conventional force with military structure and weapon platforms
    captured from the Chernarussian government or provided by arms dealers.

    This has given the Chedaki enough power to start a coup against the government.
*/

_factionID = "CHEDAKI";
_factionName = "Chedaki Forces";
_factionStructure = "LOW-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK74N;
_commonRIFLEGL = _AK74NGL;
_commonPISTOL = _Makarov;
_commonAR = _RPK;
_commonMG = _PKM;
_commonMARKSMAN = _SVD;
_commonSNIPER = _SVD;
_commonAT = _RPG26;
_specAT = _RPG7;
_commonSMG = _AK74UN;
_commonRCO = "rhs_acc_1p29";
_commonCCO = "rhs_acc_ekp1";
_commonMAGNIFIED = "rhs_acc_pso1m21_ak";
_commonSUPPRESSOR = "rhs_acc_pso1m21_ak";
_commonPISTOLSUPPRESSOR = "muzzle_snds_L";
_NVG = "rhs_1PN138";

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
_countAR = 7;
_countMG = 5;
_countSNIPER = 5;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 15;

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

_goggleLIST = [
    "G_Balaclava_blk",
    "G_Balaclava_oli"
];

_randomGOGGLE = _goggleLIST call BIS_fnc_selectRandom;

_commonHEAD = "empty";
_leaderHEAD = "rhsgref_patrolcap_specter";
_officerHEAD = "rhsgref_patrolcap_specter";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4_bala";
_pilotHEAD = "rhs_zsh7a_alt";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = _commonHEAD;

_commonUNIFORM = "rhsgref_uniform_specter";
_SLUNIFORM = _commonUNIFORM;
_FTLUNIFORM = _commonUNIFORM;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15_tan";
_sniperUNIFORM = "U_I_FullGhillie_sard";
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15_tan";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhs_6sh92_digi";
_officerVEST = "rhs_6sh92_digi_headset";
_ftlVEST = "rhs_6sh92_digi_vog_headset";
_slVEST = "rhs_6sh92_digi_headset";
_mgVEST = _commonVEST;
_grenadierVEST = "rhs_6sh92_digi_vog";
_medicVEST = "rhsgref_6b23_khaki_medic";
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "rhs_sidor";
_bigBACKPACK = "TRYK_B_Alicepack";

if (_assignLoadoutMode) then {
    if !( _isOfficer || _isSquadLeader || _isTeamLeader ||
          _isHelicopterCrew || _isHelicopterPilot || _isPilot ||
          _isCrewman ) then {
              _unit addGoggles _randomGOGGLE 
    }
};

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_SPG9_Gun_Bag";
_ATTripod = "RHS_SPG9_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */	 ["rhsgref_ins_g_g_zsu234"]
/*  Attack Helos      */	,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */	,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */	,["rhsgref_ins_g_t72ba", "rhsgref_ins_g_t72bb", "rhsgref_ins_g_t72bc"]
/*  Light Vehicles    */	,["rhsgref_ins_g_uaz", "rhsgref_ins_g_uaz_dshkm_chdkz", "rhsgref_ins_g_uaz_spg9", "rhsgref_ins_g_uaz_open"]
/*  Medium Vehicles   */	,["rhsgref_BRDM2_ins_g", "rhsgref_BRDM2_ATGM_ins_g", "rhsgref_ins_g_btr60", "rhsgref_ins_g_btr70", "rhsgref_ins_g_bmp1", "rhsgref_ins_g_bmp1p", "rhsgref_ins_g_bmp2e", "rhsgref_ins_g_bmp2k", "rhsgref_ins_g_ural_Zu23"]
/*  Mobile Artillery  */	,["rhsgref_ins_g_reg_BM21", "rhsgref_ins_g_reg_BM21"]
/*  Transport Helos   */	,["rhsgref_ins_g_Mi8amt", "rhsgref_ins_g_Mi8amt"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["rhsgref_ins_g_ural", "rhsgref_ins_g_ural_open", "rhsgref_ins_g_ural_work"]
/*  Static Defence    */	,["rhsgref_ins_g_reg_d30", "rhsgref_ins_g_reg_d30", "rhsgref_ins_g_Igla_AA_pod", "rhsgref_ins_g_DSHKM", "rhsgref_ins_g_DSHKM_Mini_TriPod", "rhsgref_ins_g_NSV_TriPod", "rhsgref_ins_g_SPG9", "rhsgref_ins_g_SPG9M", "rhsgref_ins_g_ZU23"]
/*  Boats             */	,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_repair_vv","rhsgref_ins_g_gaz66_ammo","RHS_Ural_Fuel_VV_01"]
/*  Submarines        */	,["B_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierINS",
/* Objects      */ ["rhs_weapon_crate"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["CDF_WarfareBLightFactory"]
];

// =============================================================================
