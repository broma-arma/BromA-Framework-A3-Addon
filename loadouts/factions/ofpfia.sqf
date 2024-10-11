// INFO ========================================================================
/*
   FIA forces has been known aroudn the world due to the operation codename :
   OPERATION FLASHPOINT, they proved themselves to be successfull on guerilla
   tactics and small scale operation even before the US intervention.

   Now they come back kick ass and resist agaisnt the Reds with training given
   by US Delta Force.
*/
// =============================================================================

_factionID        = "OFPFIA";
_factionName      = "FIA forces";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide     = WEST;
_defaultVoice    = [_voiceRUSSIAN];
_defaultFace     = [_faceWHITE, _faceASIAN];
_defaultName     = [_nameRUSSIAN];
_defaultInsignia = "";
_defaultColor    = "blue";

// WEAPONS =====================================================================

_commonRIFLE            = _G3KA4;
_commonRIFLEGL          = _G3KA4GL;
_commonPISTOL           = _M9;
_commonAR               = _M249L;
_commonMG               = _M240G;
_commonMARKSMAN         = _PSG1;
_commonSNIPER           = _M2010;
_commonAT               = _RPG26;
_specAT                 = _RPG7;
_weaponsAA              = _STINGER;
_weaponsAT              = _JAVELIN;
_commonSMG              = _HK51;
_commonRCO              = "rhsusf_acc_ELCAN";
_marksmanSCOPE          = "";
_commonCCO              = "rhsusf_acc_eotech_552";
_sniperSCOPE            = "optic_LRPS";
_commonSUPPRESSOR       = _sup762;
_commonPISTOLSUPPRESSOR = "";
_NVG                    = _NVGEN1;

// AMMO COUNT ==================================================================

_countRIFLE    = 10;
_countRIFLELOW = 6;
_countPISTOL   = 2;
_countAR       = 5;
_countMG       = 3;
_countSNIPER   = 8;
_countSpecAT   = 3;
_countGRENADES = 3;
_count40mm     = 20;

_countTracerRIFLE = 2;
_countTracerMG    = 0;

_countRifleCARGO    = 30;
_countPistolCARGO   = 20;
_countArCARGO       = 20;
_countMgCARGO       = 30;
_countSniperCARGO   = 30;
_countSpecATCARGO   = 20;
_countGrenadesCARGO = 20;
_count40mmCARGO     = 40;

// MEDICAL =====================================================================

_countBANDAGE = 20;
_countMORPHINE = 10;
_countEPI = 5;
_countTourniquet = 3;
_countBLOODBAG = 5;
_countPAK = 2;

_countBandageCARGO  = 40;
_countMorphineCARGO = 30;
_countEpiCARGO      = 30;
_countBloodbagCARGO = 30;
_countPAKCARGO      = 40;

// UNIFORMS ====================================================================

_headsLIST = [
	"H_Bandanna_khk",
	"H_Bandanna_mcamo",
	"H_Bandanna_sgg",
	"H_Bandanna_sand",
	"H_Cap_blk",
	"H_Cap_blu",
	"H_Cap_oli_hs",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_ShemagOpen_tan",
	"H_ShemagOpen_khk"
];

_uniformsLIST = [
	"U_BG_Guerrilla_6_1",
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_leader",
	"U_C_HunterBody_grn",
	"U_I_G_Story_Protagonist_F"
];

_vestsLIST = [
	"V_TacVest_blk",
	"V_TacVest_brn",
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_TacVest_oli"
];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomVEST = selectRandom _vestsLIST;

_gogglesLIST = [];

_randomHEAD = selectRandom _headsLIST;
_randomUNIFORM = selectRandom _uniformsLIST;
_randomVEST = selectRandom _vestsLIST;

_commonHEAD    = "rhsgref_Booniehat_alpen";
_leaderHEAD    = _commonHEAD;
_officerHEAD   = _commonHEAD;
_medicHEAD     = _commonHEAD;
_crewmanHEAD   = "rhs_tsh4_bala";
_pilotHEAD     = "rhsusf_hgu56p";
_helicrewHEAD  = "rhs_zsh7a_mike_green_alt";
_helipilotHEAD = "rhs_zsh7a_mike_green_alt";
_sniperHEAD    = _randomHEAD;
_demoHEAD      = _commonHEAD;
_reconHEAD     = _randomHEAD;

_commonUNIFORM   = "rhsgref_uniform_alpenflage";
_officerUNIFORM  = _commonUNIFORM;
_pilotUNIFORM    = _commonUNIFORM;
_sniperUNIFORM   = _randomUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = _commonUNIFORM;
_crewUNIFORM     = _commonUNIFORM;
_mgUNIFORM       = _commonUNIFORM;
_medicUNIFORM    = _commonUNIFORM;
_demoUNIFORM     = _commonUNIFORM;
_reconUNIFORM    = _randomUNIFORM;

_commonVEST    = _randomVEST;
_officerVEST   = _commonVEST;
_ftlVEST       = _commonVEST;
_slVEST        = _commonVEST;
_mgVEST        = _commonVEST;
_grenadierVEST = _commonVEST;
_medicVEST     = _commonVEST;
_demoVEST      = _commonVEST;
_marksmanVEST  = _commonVEST;
_reconVEST     = _commonVEST;
_pilotVEST = "rhs_belt_AK";

_commonBACKPACK = "B_Kitbag_cbr";
_bigBACKPACK = "B_Kitbag_cbr";

// MISC EQUIPMENT ==============================================================

_grenade = "rhs_mag_rgd5";
_wSmoke = "rhs_mag_rdg2_white";
_binocular = "rhssaf_zrak_rd7j";
_rangefinder = "rhs_pdu4";

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
/*  Anti Air Vehicles */ ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/*  Attack Helos      */,["RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/*  Attack Planes     */,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs"]
/*  Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t72ba_tv"]
/*  Light Vehicles    */,["rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/*  Medium Vehicles   */,["rhs_btr60_vdv", "rhs_bmd1", "rhs_bmp1d_vdv"]
/*  Mobile Artillery  */,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */,["RHS_Mi8mt_vvs"]
/*  Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */,["rhs_gaz66_msv", "rhs_gaz66_flat_msv"]
/*  Static Defence    */,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*  Boats             */,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */,["O_UGV_01_rcws_F"]
/*  Support           */,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*  Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */,["rhsusf_rg33_o", "rhsusf_rg33_m2_o", "rhsusf_M1117_O"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "Flag_NATO_F"
/* Objects      */,["B_CargoNet_01_ammo_F"]
/* Walls        */,["Land_Mil_WallBig_4m_F"]
/* Structures   */,["Land_Cargo_House_V3_F"]
];
