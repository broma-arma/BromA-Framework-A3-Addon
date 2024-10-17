/*
    The Armed Forces of the Russian Federation are the military service of Russia,
	established after the dissolution of the Soviet Union.

    Camo: "emr", "emrd" (BRM_FMK_LoadoutCamo_RUSSIA)
*/

_factionID = "RUSSIA";
_factionName = "Russian Army";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRussian];
_defaultFace = [_faceWhite, _faceAsian];
_defaultName = [_nameRussian];
_defaultInsignia = "USP_PATCH_RUS_ARMY_ARMED_FORCES";
_defaultColor = "red";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_RUSSIA", "emr"];

// WEAPONS =====================================================================
_commonRifle = _AK74M;
_commonRifleGL = _AK74GP;
_commonAR = _PKP;
_commonMG = _PKP;
_commonMarksman = _SVD;
_commonSniper = _SVD;
_commonSMG = ["rhs_weap_pp2000", "rhs_mag_9x19mm_7n31_20"];

_commonPistol = ["rhs_weap_pya", "rhs_mag_9x19_17"];

_commonAT = _RPG26;
_specAT = _RPG7PGO;
_weaponsAA = _IGLA;
_weaponsAT = ["launch_O_Vorona_green_F", "Vorona_HEAT"];

_commonRCO = "rhs_acc_1p78";
_commonCCO = "rhs_acc_ekp8_02b";

_rifleScope = _commonCCO;
_marksmanScope = "rhs_acc_pso1m2";
_sniperScope = "rhs_acc_pso1m2";

_commonSuppressor = "rhs_acc_tgpa";
_commonPistolSuppressor = "";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 7;
_countMG = 5;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 15;
_countPistol = 2;
_countGrenades = 3;

_countTracerRifle = 2;
_countTracerMG = 1;

_countRifleCargo = 30;
_countARCargo = 20;
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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = ["rhs_balaclava", ""] selectRandomWeighted [0.4, 0.6];

_commonHead = selectRandom ([["rhs_6b47_emr_1", "rhs_6b47_emr", "rhs_6b47_6B50"], ["rhs_6b7_1m", "rhs_6b7_1m_bala2"]] select (_camo == "emrd"));
_leaderHead = _commonHead;
_officerHead = "rhs_fieldcap_digi";
_medicHead = _commonHead;
_crewmanHead = "rhs_6b48";
_pilotHead = "rhs_zsh7a";
_helicrewHead = "rhs_zsh7a_mike";
_helipilotHead = "rhs_zsh7a_mike";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = selectRandom ["rhs_6b47_6m2_1", "rhs_6b47_bala"];

_commonUniform = ["rhs_uniform_vkpo_gloves", "rhs_uniform_emr_des_patchless"] select (_camo == "emrd");
_officerUniform = _commonUniform;
_pilotUniform = "rhs_uniform_df15";
_sniperUniform = "U_B_T_FullGhillie_tna_F";
_marksmanUniform = _commonUniform;
_helicrewUniform = "rhs_uniform_df15";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = "rhs_6b45_rifleman";
_officerVest = "rhs_6b45_off";
_ftlVest = "rhs_6b45_off";
_slVest = "rhs_6b45_off";
_mgVest = "rhs_6b45_mg";
_grenadierVest = "rhs_6b45_grn";
_medicVest = _commonVest;
_demoVest = _commonVest;
_marksmanVest = _commonVest;
_reconVest = _commonVest;
_pilotVest = "rhs_vest_commander";

_commonBackpack = "rhs_rk_sht_30_emr";
_bigBackpack = "rhs_rk_sht_30_emr";
_specATBackpack = "rhs_rpg_empty";

if (_assignLoadoutMode) then {
	if (!(_isOfficer || _isCrewman ||_isHelicopterCrew || _isHelicopterPilot || _isPilot) && _randomGOGGLE != "") then {
		_unit addGoggles _randomGOGGLE;
	};
};

// MISC EQUIPMENT ==============================================================
_grenade = "rhs_mag_rgo";
_wSmoke = "rhs_mag_rdg2_white";
_rangefinder = "rhs_pdu4";
_NVG = "rhs_1PN138";

// EXTRA EQUIPMENT =============================================================
_hmg = "RHS_Kord_Gun_Bag";
_hmgTripod = "RHS_Kord_Tripod_Bag";

_staticAT = "RHS_Kornet_Gun_Bag";
_atTripod = "RHS_Kornet_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/* Attack Helos      */,["RHS_Ka52_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs", "rhs_mi28n_vvs"]
/* Attack Planes     */,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "RHS_T50_vvs_generic", "RHS_T50_vvs_blueonblue", "RHS_T50_vvs_054", "rhs_mig29sm_vvs"]
/* Heavy Vehicles    */,["rhs_sprut_vdv", "rhs_t90a_tv", "rhs_t90_tv", "rhs_t80um", "rhs_t80uk", "rhs_t72bd_tv"]
/* Light Vehicles    */,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/* Medium Vehicles   */,["rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv", "rhs_bmp3m_msv", "rhs_bmp3mera_msv"]
/* Mobile Artillery  */,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/* Transport Helos   */,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/* Transport Planes  */,["RHS_AN2_B", "RHS_AN2_B"]
/* Transport Trucks  */,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/* Static Defence    */,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/* Boats             */,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/* UAV               */,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/* UGV               */,["O_UGV_01_rcws_F"]
/* Support           */,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/* Submarines        */,["O_SDV_01_F", "O_SDV_01_F"]
/* MRAP Vehicles     */,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "rhs_Flag_Russia_F"
/* Objects    */,["O_CargoNet_01_ammo_F"]
/* Walls      */,["Land_BagFence_Short_F"]
/* Structures */,["Land_Fort_Watchtower"]
];
