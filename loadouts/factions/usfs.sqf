/*
    United States Future Soldier (US FS) Program. Initialy started in early 2000s with the not so successfull OICW, it is now back with new weaponry,
    new vehicles and new gear for today's soldier.
*/

_factionID = "USFS";
_factionName = "US Future Soldier Program Unit";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_nameAmerican];
_defaultFace = [_faceWhite, _faceBlack];
_defaultName = [_nameAmerican];
_defaultInsignia = "USP_PATCH_USA_ARMY_75RGR_1BTN_ACO";
_defaultColor = "blue";

// WEAPONS =====================================================================
_commonRifle = _ACRSHORTT;
_commonRifleGL = _ACRSHORTGLT;
_commonAR = _MK46MOD1;
_commonMG = _MK48MOD0;
_commonMarksman = _ACR68LONGT;
_commonSniper = _M2010;
_commonSMG = _ACRCOMPACTT;

_commonPistol = _MK25TR;

_commonAT = _AT4;
_specAT = ["launch_MRAWS_olive_rail_F", "MRAWS_HEAT_F"];
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "hlc_optic_ATACR";
_commonCCO = "rhsusf_acc_eotech_552_d";

_sniperScope = "rhsusf_acc_LEUPOLDMK4_2";

_commonSuppressor = "rhsusf_acc_rotex5_grey";
_commonPistolSuppressor = "hlc_muzzle_TiRant9S";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countAR = 5;
_countMG = 3;
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
_randomGOGGLE = selectRandom ["rhsusf_shemagh_grn", "rhsusf_shemagh_gogg_grn", ""];

_commonHead = "rhsusf_opscore_mc_cover_pelt_nsw";
_leaderHead = "rhsusf_opscore_mc_cover_pelt_cam";
_officerHead = "rhsusf_patrolcap_ocp";
_medicHead = _commonHead;
_crewmanHead = "rhsusf_cvc_green_ess";
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "rhsusf_hgu56p_visor_mask";
_helipilotHead = "rhsusf_hgu56p_visor";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = selectRandom ["rhsusf_opscore_mc_cover_pelt_cam", "rhsusf_opscore_coy_cover_pelt", "rhsusf_opscore_fg_pelt_nsw", "rhsusf_opscore_paint_pelt_nsw_cam"];

_commonUniform = "rhs_uniform_cu_ocp";
_officerUniform = _commonUniform;
_pilotUniform = "U_B_PilotCoveralls";
_sniperUniform = _commonUniform;
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CW_US_B_LATE_U_H_Pilot_Uniform_01_NATO";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = selectRandom ["rhsusf_spcs_ocp_rifleman_alt", "rhsusf_spcs_ocp_rifleman"];
_officerVest = "rhsusf_spcs_ocp_teamleader_alt";
_ftlVest = "rhsusf_spcs_ocp_teamleader";
_slVest = "rhsusf_spcs_ocp_squadleader";
_mgVest = "rhsusf_spcs_ocp_saw";
_grenadierVest = "rhsusf_spcs_ocp_grenadier";
_medicVest = "rhsusf_spcs_ocp_medic";
_demoVest = _commonVest;
_marksmanVest = "rhsusf_spcs_ocp_sniper";
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = "rhsusf_assault_eagleaiii_ocp";
_bigBackpack = "B_Carryall_mcamo";

if (_assignLoadoutMode && _randomGOGGLE != "") then { _unit addGoggles _randomGOGGLE; };

// MISC EQUIPMENT =============================================================
_NVG = "NVGogglesB_blk_F";

// EXTRA EQUIPMENT =============================================================
_hmg = "B_HMG_01_high_weapon_F";
_hmgTripod = "B_HMG_01_support_F";

_staticAT = "B_AT_01_weapon_F";
_atTripod = "B_HMG_01_support_F";

_mortar = "B_Mortar_01_weapon_F";
_mortarTripod = "B_Mortar_01_support_F";

_uavBag = "vanilla";
_uavTerminal = "vanilla";

// VEHICLES ====================================================================
_factionVehicles = [
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6"]
/* Attack Helos      */,["B_Heli_Attack_01_F", "RHS_AH64D"]
/* Attack Planes     */,["rhsusf_f22", "B_Plane_CAS_01_F"]
/* Heavy Vehicles    */,["rhsusf_m1a2sep1tuskiid_usarmy"]
/* Light Vehicles    */,["rhsusf_M1220_M2_usarmy_wd", "rhsusf_M1230_M2_usarmy_wd", "rhsusf_M1230_MK19_usarmy_wd", "rhsusf_M1220_MK19_usarmy_wd"]
/* Medium Vehicles   */,["RHS_M2A3_BUSKIII", "rhsusf_m113d_usarmy", "rhsusf_m113d_usarmy_M240"]
/* Mobile Artillery  */,["rhsusf_m109d_usarmy"]
/* Transport Helos   */,["RHS_CH_47F_10", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_H6M"]
/* Transport Planes  */,["RHS_C130J"]
/* Transport Trucks  */,["rhsusf_M1078A1P2_d_fmtv_usarmy", "rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_d"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F", "rhsusf_mkvsoc"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F", "B_UAV_05_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M978A4_BKIT_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd", "rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd", "rhsusf_M1230a1_usarmy_wd"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_M1237_M2_usarmy_wd", "rhsusf_M1237_MK19_usarmy_wd"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "Flag_US_F"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_HBarrierWall4_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
