
// INFO ========================================================================
/*

    Originally a soviet military unit, the Russian Airborne Troops or VDV is a military branch of the Armed Forces of
	the Russian Federation tasked with rapid combined-arms deployment with a focus on airborne infantry.

*/

_factionID = "VDV";
_factionName = "VDV Troops";
_factionStructure = "HIGH-TIER";

_factionCallsigns = _defaultCallsignOPFOR;

_defaultSide = EAST;
_defaultVoice = [_voiceRUSSIAN];
_defaultFace = [_faceWHITE];
_defaultName = [_nameRUSSIAN];
_defaultInsignia = "USP_PATCH_RUS_BORDER_GUARD";
_defaultColor = "red";

// Set in mission with: BRM_FMK_UNIFORMS_VDVCammo
// Valid values are "EMR", "FLORA" and "MFLORA"
_cammoPattern = "FLORA";

// Set in mission with: BRM_FMK_UNIFORMS_VDVMSV
// Use MSV uniforms.
_enableMSV = false;

/*              "Accuracy", "Aiming Shake", "Aiming Speed", "Endurance", "Spoting Distance", "Spotting Time", "Courage", "Reloading Speed", "Commanding", "General" */
_factionSkill = [[0.7,0.8],   [0.8,0.9],      [0.7,0.8],     [0.7,0.9],      [0.8,0.9],        [0.7,0.8],     [0.8,0.9],     [0.7,0.8],      [0.7,0.9],   [0.7,0.8]];

// WEAPONS =====================================================================

_commonRIFLE = _AK74M;
_commonRIFLEGL = _AK74GP;
_commonPISTOL = _Makarov;
_commonMG = _PKP;
_commonMARKSMAN = _SVDS;
_commonSNIPER = _SVDCAMO;
_commonAT = _RPG7PGO;
_specAT = _RPG7PGO;
_commonSMG = _AK74FOLDED;
_commonRCO = "rhs_acc_pso1m2";
_commonCCO = "rhs_acc_ekp1";
_commonMAGNIFIED = "rhs_acc_pso1m2";
_commonSUPPRESSOR = "rhs_acc_tgpa";
_commonPISTOLSUPPRESSOR = "RH_pmsd";
_NVG = _NVGEN4;

// AMMO COUNT ==================================================================

_countRIFLE = 9;
_countRIFLELOW = 6;
_countPISTOL = 2;
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
if(!isNil "BRM_FMK_UNIFORMS_VDVCammo")then{_cammoPattern=BRM_FMK_UNIFORMS_VDVCammo};
if(!isNil "BRM_FMK_UNIFORMS_VDVMSV")then{_enableMSV=BRM_FMK_UNIFORMS_VDVMSV};
_fac="_vdv";if(_enableMSV)then{_fac="_msv"};
_vp="_digi";_vu="_emr";_vv="_digi";
switch (_cammoPattern) do {
case"EMR":{_vp="_digi";_vu ="_emr";_vv="_emr"};
case"FLORA":{_vp="";_vu="_flora";_vv=""};
case"MFLORA":{_vp="_ML";_vu="_mflora";_vv="_ml";if(_enableMSV)then{_fac="_vdv"};};
};

_commonHEAD = "rhs_6b27m"+_vp;
_leaderHEAD = "rhs_6b27m"+_vp+"_bala";
_officerHEAD = "rhs_fieldcap"+_vp;
_medicHEAD = _commonHEAD;
_crewmanHEAD = "rhs_tsh4";
_pilotHEAD = "rhs_zsh7a";
_helicrewHEAD = "rhs_zsh7a_mike";
_helipilotHEAD = "rhs_zsh7a_mike";
_sniperHEAD = _commonHEAD;
_demoHEAD = _commonHEAD;
_reconHEAD = "rhs_6b27m"+_vp+"_ess_bala";

_commonUNIFORM = "rhs_uniform"+_fac+""+_vu;
_officerUNIFORM = _commonUNIFORM;
_pilotUNIFORM = "rhs_uniform_df15";
_sniperUNIFORM = _commonUNIFORM;
_marksmanUNIFORM = _commonUNIFORM;
_helicrewUNIFORM = "rhs_uniform_df15";
_crewUNIFORM = "rhs_uniform_df15";
_mgUNIFORM = _commonUNIFORM;
_medicUNIFORM = _commonUNIFORM;
_demoUNIFORM = _commonUNIFORM;
_reconUNIFORM = _commonUNIFORM;

_commonVEST = "rhs_6b23"+_vv+"_rifleman";
_officerVEST = "rhs_6b23"+_vv+"_6sh92_radio";
_ftlVEST = "rhs_6b23"+_vv+"_6sh92_headset";
_slVEST = "rhs_6b23"+_vv+"_6sh92_headset_mapcase";
_mgVEST = "rhs_6b23"+_vv+"_rifleman";
_grenadierVEST = "rhs_6b23"+_vv+"_6sh92_vog";
_medicVEST = "rhs_6b23"+_vv+"_medic";
_demoVEST = "rhs_6b23"+_vv+"_engineer";
_marksmanVEST = "rhs_6b23"+_vv+"_sniper";
_reconVEST = "rhs_6b23"+_vv+"_sniper";

_commonBACKPACK = "B_AssaultPack_khk";
_bigBACKPACK = "B_Carryall_oli";

// EXTRA EQUIPMENT =============================================================

_HMG = "RHS_NSV_Gun_Bag";
_HMGTripod = "RHS_NSV_Tripod_Bag";

_StaticAT = "RHS_Kornet_Gun_Bag";
_ATTripod = "RHS_Kornet_Tripod_Bag";

_mortar = "RHS_Podnos_Gun_Bag";
_mortarTripod = "RHS_Podnos_Bipod_Bag";

_UAVBag = "auto";
_UAVTerminal = "auto";

// VEHICLES ====================================================================

_factionVehicles = [
/*  Anti Air Vehicles */	 ["rhs_zsu234_aa", "rhs_zsu234_aa"]
/*  Attack Helos      */	,["RHS_Ka52_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Ka52_UPK23_vvs", "RHS_Mi24P_AT_vvs", "RHS_Mi24P_vvs", "RHS_Mi24V_AT_vvs"]
/*  Attack Planes     */	,["RHS_Su25SM_vvs", "RHS_Su25SM_CAS_vvs", "RHS_Su25SM_KH29_vvs", "RHS_T50_vvs_generic", "RHS_T50_vvs_blueonblue", "RHS_T50_vvs_054"]
/*  Heavy Vehicles    */	,["rhs_sprut_vdv", "rhs_t90a_tv", "rhs_t90_tv", "rhs_t80um", "rhs_t80uk", "rhs_t72bd_tv"]
/*  Light Vehicles    */	,["rhs_tigr_vdv", "rhs_tigr_sts_vdv", "rhs_tigr_m_vdv", "rhs_uaz_vdv", "rhs_uaz_open_vdv"]
/*  Medium Vehicles   */	,["rhs_btr60_vdv", "rhs_btr70_vdv", "rhs_btr80_vdv", "rhs_btr80a_vdv", "rhs_bmp2d_vdv", "rhs_bmp2_vdv"]
/*  Mobile Artillery  */	,["rhs_2s3_tv", "rhs_9k79_B", "RHS_BM21_VV_01"]
/*  Transport Helos   */	,["RHS_Mi8mt_Cargo_vvs", "RHS_Mi8mt_vvs", "RHS_Mi8MTV3_UPK23_vvs", "RHS_Mi8MTV3_FAB_vvs"]
/*  Transport Planes  */	,["RHS_AN2_B", "RHS_AN2_B"]
/*  Transport Trucks  */	,["rhs_gaz66_msv", "rhs_gaz66_flat_msv", "RHS_Ural_MSV_01", "RHS_Ural_Open_Flat_MSV_01"]
/*  Static Defence    */	,["rhs_Metis_9k115_2_msv", "rhs_Kornet_9M133_2_msv", "rhs_Igla_AA_pod_msv", "rhs_KORD_MSV", "rhs_KORD_high_MSV", "rhs_SPG9M_MSV", "RHS_ZU23_MSV"]
/*  Boats             */	,["O_Boat_Armed_01_hmg_F", "O_Boat_Transport_01_F"]
/*  UAV               */	,["rhs_pchela1t_vvs", "rhs_pchela1t_vvs"]
/*  UGV               */	,["O_UGV_01_rcws_F"]
/*  Support           */	,["rhs_gaz66_ammo_vv", "RHS_Ural_Fuel_VDV_01", "O_Truck_02_box_F"]
/*  Submarines        */	,["O_SDV_01_F", "O_SDV_01_F"]
/*  MRAP Vehicles     */        ,["rhsgref_BRDM2_b", "rhsgref_BRDM2_ATGM_b", "rhsgref_BRDM2UM_b", "rhsgref_BRDM2_HQ_b"]
];

// OBJECTS =====================================================================

_factionObjects = [
/* Flag         */ "rhs_Flag_vdv_F",
/* Objects      */ ["O_CargoNet_01_ammo_F"],
/* Walls        */ ["Land_BagFence_Short_F"],
/* Structures   */ ["Land_Fort_Watchtower"]
];

// =============================================================================