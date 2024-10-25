/*
    The British Armed Forces form the military of the United Kingdom, tasked with
    defence of the country, its overseas territories and the Crown dependencies;
    as well as promoting the UK's wider interests, supporting international
    peacekeeping efforts, and providing humanitarian aid.

    Camo: "mpt", "dpm", "ddpm" (BRM_FMK_LoadoutCamo_BAF)
*/

_factionID = "BAF";
_factionName = "British Armed Forces";
_factionStructure = "HIGH";

_factionCallsigns = _defaultCallsignBLUFOR;

_defaultSide = WEST;
_defaultVoice = [_voiceBritish];
_defaultFace = [_faceWhite];
_defaultName = [_nameEnglish];
_defaultInsignia = "";
_defaultColor = "blue";

// CAMO ========================================================================
_camo = missionNamespace getVariable ["BRM_FMK_LoadoutCamo_BAF", "mpt"];

// WEAPONS =====================================================================
_commonRifle = _L85A2RIS;
_commonRifleGL = ["UK3CB_BAF_L85A2_UGL_HWS", "UK3CB_BAF_556_30Rnd", "UK3CB_BAF_1Rnd_HE_Grenade_Shell"];
_commonAR = _L110A2;
_commonMG = _commonAR;
_commonMarksman = ["UK3CB_BAF_L129A1", "UK3CB_BAF_762_L42A1_20Rnd"];
_commonSniper = _L115A3CAMO;
_commonSMG = _L22A2;

_commonPistol = _L131A1;

_commonAT = _AT4CSHEAT;
_specAT = _NLAW_3CB;
_weaponsAA = _STINGER;
_weaponsAT = _JAVELIN;

_commonRCO = "r3f_elcan_5_56";
_commonCCO = "r3f_comp_m5";

_rifleScope = _commonCCO;
_arScope = _FHQHWS;
_marksmanScope = "uk3cb_baf_ta648_308";
_sniperScope = "UK3CB_BAF_SB31250_Ghillie";

_commonSuppressor = "UK3CB_BAF_Silencer_L85";
_commonPistolSuppressor = "muzzle_snds_L";

_commonRail = "rhsusf_acc_anpeq15side_bk";

// AMMO COUNT ==================================================================
_countRifle = 9;
_countRifleLow = 6;
_countMG = 5;
_countSniper = 5;
_countSpecAT = 3;
_count40mm = 15;
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
_countTourniquet = 3;
_countBloodbag = 5;
_countPAK = 2;

_countBandageCargo = 40;
_countMorphineCargo = 30;
_countEpiCARGO = 20;
_countBloodbagCargo = 20;
_countPAKCargo = 10;

// UNIFORMS ====================================================================
_randomGOGGLE = selectRandom ["UK3CB_G_Tactical_Clear_Shemagh_Green_Headset", "UK3CB_G_Tactical_Black_Shemagh_Green", ""];

_commonHead = selectRandom ([
	["UK3CB_BAF_H_Mk7_Camo_B", "UK3CB_BAF_H_Mk7_Camo_ESS_B", "UK3CB_BAF_H_Mk7_Net_CESS_B", "UK3CB_BAF_H_Mk7_Scrim_D", "UK3CB_BAF_H_Mk7_Scrim_ESS_B"], [
	["UK3CB_BAF_H_Mk6_DPMT_A", "UK3CB_BAF_H_Mk6_DPMT_B", "UK3CB_BAF_H_Mk6_DPMT_C", "UK3CB_BAF_H_Mk6_DPMT_E", "UK3CB_BAF_H_Mk6_DPMT_F"],
	["UK3CB_BAF_H_Mk6_DDPM_A", "UK3CB_BAF_H_Mk6_DDPM_B", "UK3CB_BAF_H_Mk6_DDPM_C", "UK3CB_BAF_H_Mk6_DDPM_D", "UK3CB_BAF_H_Mk6_DDPM_F"]
] select (_camo == "ddpm")] select (_camo != "mpt"));
_leaderHead = _commonHead;
_officerHead = "UK3CB_BAF_H_Beret_PR_PRR_Over";
_medicHead = _commonHead;
_crewmanHead = ["UK3CB_BAF_H_CrewHelmet_ESS_A", ["UK3CB_BAF_H_CrewHelmet_DPMT_ESS_A", "UK3CB_BAF_H_CrewHelmet_DDPM_ESS_A"] select (_camo == "ddpm")] select (_camo != "mpt");
_pilotHead = "RHS_jetpilot_usaf";
_helicrewHead = "UK3CB_BAF_H_PilotHelmetHeli_A";
_helipilotHead = "UK3CB_BAF_H_PilotHelmetHeli_A";
_sniperHead = _commonHead;
_demoHead = _commonHead;
_reconHead = ["UK3CB_BAF_H_Boonie_MTP_PRR", ["UK3CB_BAF_H_Boonie_DPMT_PRR", "UK3CB_BAF_H_Boonie_DDPM_PRR"] select (_camo == "ddpm")] select (_camo != "mpt");

_commonUniform = selectRandom ([
	["UK3CB_BAF_U_CombatUniform_MTP", "UK3CB_BAF_U_CombatUniform_MTP_ShortSleeve"], [
	["UK3CB_BAF_U_CombatUniform_DPMT_ShortSleeve", "UK3CB_BAF_U_CombatUniform_DPMT"],
	["UK3CB_BAF_U_CombatUniform_DDPM", "UK3CB_BAF_U_CombatUniform_DDPM_ShortSleeve"]
] select (_camo == "ddpm")] select (_camo != "mpt"));
_officerUniform = _commonUniform;
_pilotUniform = "UK3CB_CHC_C_U_Overall_01";
_sniperUniform = ["U_B_FullGhillie_ard", "U_B_FullGhillie_lsh"] select (_camo == "dpm");
_marksmanUniform = _commonUniform;
_helicrewUniform = "UK3CB_CHC_C_U_Overall_01";
_crewUniform = _commonUniform;
_mgUniform = _commonUniform;
_medicUniform = _commonUniform;
_demoUniform = _commonUniform;
_reconUniform = _commonUniform;

_commonVest = ["UK3CB_BAF_V_Osprey_Rifleman_A", ["UK3CB_BAF_V_Osprey_DPMT6", "UK3CB_BAF_V_Osprey_DDPM2"] select (_camo == "ddpm")] select (_camo != "mpt");
_officerVest = ["UK3CB_BAF_V_Osprey_SL_B", ["UK3CB_BAF_V_Osprey_DPMT2", "UK3CB_BAF_V_Osprey_DDPM7"] select (_camo == "ddpm")] select (_camo != "mpt");
_ftlVest = [_officerVest, ["UK3CB_BAF_V_Osprey_DPMT3", "UK3CB_BAF_V_Osprey_DDPM3"] select (_camo == "ddpm")] select (_camo != "mpt");
_slVest = _officerVest;
_mgVest = ["UK3CB_BAF_V_Osprey_MG_A", ["UK3CB_BAF_V_Osprey_DPMT8", "UK3CB_BAF_V_Osprey_DDPM8"] select (_camo == "ddpm")] select (_camo != "mpt");
_grenadierVest = ["UK3CB_BAF_V_Osprey_Grenadier_B", _ftlVest] select (_camo != "mpt");
_medicVest = ["UK3CB_BAF_V_Osprey_Medic_B", ["UK3CB_BAF_V_Osprey_DPMT9", "UK3CB_BAF_V_Osprey_DDPM9"] select (_camo == "ddpm")] select (_camo != "mpt");
_demoVest = _commonVest;
_marksmanVest = ["UK3CB_BAF_V_Osprey_Marksman_A", _mgVest] select (_camo != "mpt");
_reconVest = _commonVest;
_pilotVest = "UK3CB_V_Pilot_Vest";

_commonBackpack = ["UK3CB_BAF_B_Bergen_MTP_Rifleman_L_C", ["UK3CB_BAF_B_Bergen_DPMT_Rifleman_A", "UK3CB_BAF_B_Bergen_DDPM_Rifleman_A"] select (_camo == "ddpm")] select (_camo != "mpt");
_bigBackpack = [_commonBackpack, "UK3CB_BAF_B_Bergen_DDPM_Rifleman_B"] select (_camo == "ddpm");
_medicalBackpack = ["UK3CB_BAF_B_Bergen_MTP_Medic_H_A", _commonBackpack] select (_camo != "mpt");
_specATBackpack = _commonBackpack;
_reconBackpack = ["UK3CB_BAF_B_Bergen_MTP_Rifleman_H_A", [_commonBackpack, _bigBackpack] select (_camo == "ddpm")] select (_camo != "mpt");

if (_assignLoadoutMode && _randomGOGGLE != "") then { _unit addGoggles _randomGOGGLE; };

// MISC EQUIPMENT ==============================================================
_rangefinder = "rhsusf_bino_lerca_1200_black";
_laserdesignator = "UK3CB_BAF_Soflam_Laserdesignator";
_NVG = "UK3CB_BAF_HMNVS";

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
/* Anti Air Vehicles */ ["B_APC_Tracked_01_AA_F", "RHS_M6_wd"]
/* Attack Helos      */,["RHS_AH64D_wd_AA", "RHS_AH64D_wd_CS", "RHS_AH64D_wd_GS", "RHS_AH64D_wd", "RHS_AH64DGrey"]
/* Attack Planes     */,["RHS_A10_AT", "RHS_A10", "rhsusf_f22"]
/* Heavy Vehicles    */,["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aim_tuski_wd", "rhsusf_m1a2sep1wd_usarmy", "rhsusf_m1a2sep1tuskiwd_usarmy", "rhsusf_m1a2sep1tuskiiwd_usarmy"]
/* Light Vehicles    */,["rhsusf_m1025_w_m2", "rhsusf_m1025_w", "rhsusf_m998_w_2dr_fulltop", "rhsusf_m998_w_4dr_fulltop", "rhsusf_m998_w_4dr"]
/* Medium Vehicles   */,["RHS_M2A2_wd", "RHS_M2A2_BUSKI_WD", "RHS_M2A3_wd", "RHS_M2A3_BUSKI_wd", "RHS_M2A3_BUSKIII_wd", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_M240"]
/* Mobile Artillery  */,["rhsusf_m109_usarmy", "rhsusf_m109_usarmy"]
/* Transport Helos   */,["RHS_CH_47F_10", "RHS_CH_47F_light", "RHS_UH60M_d", "RHS_UH60M_MEV2_d", "RHS_UH60M_MEV_d", "RHS_MELB_MH6M", "RHS_MELB_H6M"]
/* Transport Planes  */,["RHS_C130J", "RHS_C130J"]
/* Transport Trucks  */,["rhsusf_M1078A1P2_wd_fmtv_usarmy", "rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy", "rhsusf_M977A4_usarmy_wd"]
/* Static Defence    */,["RHS_Stinger_AA_pod_D", "RHS_M2StaticMG_D", "RHS_M2StaticMG_MiniTripod_D", "RHS_TOW_TriPod_D"]
/* Boats             */,["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"]
/* UAV               */,["B_UAV_02_CAS_F", "B_UAV_02_F"]
/* UGV               */,["B_UGV_01_F", "B_UGV_01_rcws_F"]
/* Support           */,["rhsusf_M977A4_REPAIR_usarmy_wd", "rhsusf_M977A4_AMMO_BKIT_usarmy_wd", "B_Truck_01_fuel_F"]
/* Submarines        */,["B_SDV_01_F"]
/* MRAP Vehicles     */,["rhsusf_rg33_w", "rhsusf_rg33_m2_w", "rhsusf_M1117_W"]
];

// OBJECTS =====================================================================
_factionObjects = [
/* Flag       */ "FlagCarrierBAF"
/* Objects    */,["B_CargoNet_01_ammo_F"]
/* Walls      */,["Land_Mil_WallBig_4m_F"]
/* Structures */,["Land_Cargo_House_V3_F"]
];
