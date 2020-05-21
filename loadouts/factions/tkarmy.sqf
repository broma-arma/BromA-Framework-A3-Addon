// INFO ========================================================================
/*
    Formed after the socialist victory of the Takistani Civil War in 1992, the Takistani Army is the
	socialist military force of Takistan.

	Mostly equipped with cold-war era western equipment and vehicles.

*/

_factionID = "TKARMY";
_factionName = "Takistani Army";
_factionStructure = "MID-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceFARSI];
_defaultFace = [_faceGREEK, _facePERSIAN];
_defaultName = [_nameARABIC]; // incomplete list
_defaultInsignia = "USP_PATCH_IRN_ARMY_13REVGRD";
_defaultColor = "red";

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _FNFAL;
_commonRIFLEGL = _HLCM16A2GL;
_commonPISTOL = _Makarov;
_commonAR = ["hlc_rifle_rpk74n", "hlc_45Rnd_545x39_t_rpk"];
_commonMG = _PKM;
_commonMARKSMAN = _SVDS;
_commonSNIPER = _SVDS;
_commonAT = _RPG26;
_specAT = _RPG7PGO;
_commonSMG = _AKS74U;
_commonRCO = "hlc_optic_suit";
_commonCCO = "rhsusf_acc_compm4";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "rhsusf_acc_aac_762sd_silencer";
_commonPISTOLSUPPRESSOR = "rhs_acc_1pn93_1";
_NVG = "rhs_1PN138";

// AMMO COUNT ==================================================================

_countRIFLE = 6;
_countRIFLELOW = 4;
_countPISTOL = 2;
_countAR = 5;
_countMG = 3;
_countSNIPER = 4;
_countAT = 3;
_countGRENADES = 3;
_count40mm = 10;

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

_countBANDAGE = 15;
_countMORPHINE = 5;
_countEPI = 5;
_countCAT = 3;
_countBLOODBAG = 3;
_countPAK = 1;

_countBandageCARGO = 20;
_countMorphineCARGO = 30;
_countEpiCARGO = 20;
_countBloodbagCARGO = 20;
_countPAKCARGO = 10;

// UNIFORMS ====================================================================

_gogglesLIST = [
];

_commonHEAD = "UK3CB_TKA_I_H_SSh68_Oli";
_leaderHEAD = "rhs_beret_mp1";
_officerHEAD = "rhs_beret_mp1";
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "UK3CB_H_Mil_Turban_Wrap";

_commonUNIFORM = "UK3CB_TKA_I_U_CombatUniform_01_OLI";
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15_tan";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15_tan";
_crewUNIFORM = _commonUNIFORM;
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "UK3CB_TKA_I_V_6Sh92_Oli";
_officerVEST = "UK3CB_TKA_I_V_6Sh92_Radio_Oli";
_ftlVEST = "UK3CB_TKA_I_V_6Sh92_Radio_Oli";
_slVEST = "UK3CB_TKA_I_V_6Sh92_Radio_Oli";
_mgVEST = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST = _commonVEST;
_demoVEST = _commonVEST;
_marksmanVEST = _commonVEST;
_reconVEST = _commonVEST;

_commonBACKPACK = "UK3CB_CHC_C_B_HIKER";
_bigBACKPACK = "UK3CB_CHC_C_B_HIKER";

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
/*  Anti Air Vehicles */	 ["rhsgref_cdf_zsu234"]
/*  Attack Helos      */	,["rhsgref_b_mi24g_CAS","rhsgref_b_mi24g_FAB","rhsgref_cdf_b_Mi35","rhsgref_cdf_b_Mi35_UPK"]
/*  Attack Planes     */	,["rhs_l159_cdf_b_CDF_CAP", "rhs_l159_cdf_b_CDF_CAS", "rhs_l159_cdf_b_CDF_plamen", "rhs_l159_cdf_b_CDF", "rhs_l39_cdf_b_cdf", "rhsgref_cdf_b_su25"]
/*  Heavy Vehicles    */	,["rhs_sprut_vdv", "rhs_t72bd_tv"]
/*  Light Vehicles    */	,["rhsgref_cdf_reg_uaz", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz_spg9"]
/*  Medium Vehicles   */	,["rhs_btr60_vdv", "rhs_btr70_vdv","rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/*  Mobile Artillery  */	,["rhsgref_cdf_reg_BM21", "rhsgref_cdf_reg_BM21"]
/*  Transport Helos   */	,["rhsgref_cdf_reg_Mi8amt", "rhsgref_cdf_reg_Mi17Sh"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["rhsgref_cdf_gaz66", "rhsgref_cdf_gaz66o", "rhsgref_cdf_ural", "rhsgref_cdf_ural_Zu23"]
/*  Static Defence    */	,["rhsgref_cdf_reg_d30", "rhsgref_cdf_reg_d30", "rhsgref_cdf_Igla_AA_pod", "rhsgref_cdf_DSHKM", "rhsgref_cdf_DSHKM_Mini_TriPod", "rhsgref_cdf_NSV_TriPod", "rhsgref_cdf_SPG9", "rhsgref_cdf_SPG9M", "rhsgref_cdf_ZU23"]
/*  Boats             */	,["I_Boat_Transport_01_F", "I_C_Boat_Transport_02_F"]
/*  UAV               */	,["B_UAV_02_CAS_F","B_UAV_02_F"]
/*  UGV               */	,["B_UGV_01_F","B_UGV_01_rcws_F"]
/*  Support           */	,["rhsgref_cdf_gaz66_ammo","rhsgref_cdf_ural_fuel"]
/*  Submarines        */	,["B_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "FlagCarrierTakistan_EP1",
/* Objects      */ ["rhs_weapon_crate"],
/* Walls        */ ["Land_BagFence_Long_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================
