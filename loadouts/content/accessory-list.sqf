//Vanilla - copyToClipboard ("configName _x call BIS_fnc_itemType params ['_itemCategory', '_itemType']; getNumber (_x >> 'scope') == 2 && _itemCategory == 'Item' && _itemType in ['AccessoryMuzzle', 'AccessoryPointer', 'AccessorySights', 'AccessoryBipod'] && { !isClass (_x >> 'LinkedItems') || getText (_x >> 'baseWeapon') == configName _x }" configClasses (configfile >> "CfgWeapons") apply { private _dlcInfo = getAssetDLCInfo [configName _x, configfile >> "CfgWeapons"]; format ["""%1""; // %2 - %3%4 %5", configName _x, getText (_x >> "displayName"), ["", format ["%2 (%1), ", _dlcInfo#4, _dlcInfo#5]] select _dlcInfo#0, configSourceModList _x, configName _x call BIS_fnc_itemType] } joinString toString [13])
// Suppressors
private _sup65  = "muzzle_snds_H"; // Sound Suppressor (6.5 mm)
private _sup9mm = "muzzle_snds_L"; // Sound Suppressor (9 mm)
private _sup556 = "muzzle_snds_M"; // Sound Suppressor (5.56 mm)
private _sup762 = "muzzle_snds_B"; // Sound Suppressor (7.62 mm)
private _sup45  = "muzzle_snds_acp"; // Sound Suppressor (.45 ACP)
//"muzzle_snds_570"; // Sound Suppressor (5.7 mm)
//  Mark
//"muzzle_snds_338_black"; // Sound Suppressor (.338, Black)
//"muzzle_snds_338_green"; // Sound Suppressor (.338, Green)
private _sup338 = "muzzle_snds_338_sand"; // Sound Suppressor (.338, Sand)
//"muzzle_snds_93mmg"; // Sound Suppressor (9.3mm, Black)
private _sup93  = "muzzle_snds_93mmg_tan"; // Sound Suppressor (9.3mm, Tan)
//  Expansion
private _sup65Khk = "muzzle_snds_H_khk_F"; // Sound Suppressor (6.5 mm, Khaki)
private _sup65Snd = "muzzle_snds_H_snd_F"; // Sound Suppressor (6.5 mm, Sand)
//"muzzle_snds_m_khk_F"; // Sound Suppressor (5.56 mm, Khaki)
//"muzzle_snds_m_snd_F"; // Sound Suppressor (5.56 mm, Sand)
//"muzzle_snds_B_khk_F"; // Sound Suppressor (7.62 mm, Khaki)
//"muzzle_snds_B_snd_F"; // Sound Suppressor (7.62 mm, Sand)
//  Enoch
//"muzzle_snds_B_lush_F"; // Sound Suppressor (7.62 mm, Lush)
//"muzzle_snds_B_arid_F"; // Sound Suppressor (7.62 mm, Arid)

// Scopes
private _ARCO         = "optic_Arco"; // ARCO
private _RCO          = "optic_Hamr"; // RCO
private _ACOred       = "optic_Aco"; // ACO (Red)
private _ACOgreen     = "optic_ACO_grn"; // ACO (Green)
//"optic_Aco_smg"; // ACO SMG (Red)
//"optic_ACO_grn_smg"; // ACO SMG (Green)
private _EOT          = "optic_Holosight"; // Mk17 Holosight
//"optic_Holosight_smg"; // Mk17 Holosight SMG
private _SOS          = "optic_SOS"; // MOS
//"optic_MRCO"; // MRCO
private _NVS          = "optic_NVS"; // NVS
private _Nightstalker = "optic_Nightstalker"; // Nightstalker
private _TWS          = "optic_tws"; // TWS
private _TWSmg        = "optic_tws_mg"; // TWS MG
//"optic_DMS"; // DMS
//"optic_Yorris"; // Yorris J2
//"optic_MRD"; // MRD
//"optic_LRPS"; // LRPS
//  Expansion
//"optic_Arco_blk_F"; // ARCO (Black)
//"optic_Arco_ghex_F"; // ARCO (Green Hex)
//"optic_DMS_ghex_F"; // DMS (Green Hex)
//"optic_Hamr_khk_F"; // RCO (Khaki)
//"optic_SOS_khk_F"; // MOS (Khaki)
//"optic_LRPS_tna_F"; // LRPS (Tropic)
//"optic_LRPS_ghex_F"; // LRPS (Green Hex)
//"optic_Holosight_blk_F"; // Mk17 Holosight (Black)
//"optic_Holosight_khk_F"; // Mk17 Holosight (Khaki)
//"optic_Holosight_smg_blk_F"; // Mk17 Holosight SMG (Black)
//"optic_Holosight_smg_khk_F"; // Mk17 Holosight SMG (Khaki)
//  Enoch
//"optic_Holosight_lush_F"; // Mk17 Holosight (Lush)
//"optic_Holosight_arid_F"; // Mk17 Holosight (Arid)
//"optic_Arco_lush_F"; // ARCO (Lush)
//"optic_Arco_arid_F"; // ARCO (Arid)
//"optic_Arco_AK_blk_F"; // ARCO AK (Black)
//"optic_Arco_AK_lush_F"; // ARCO AK (Lush)
//"optic_Arco_AK_arid_F"; // ARCO AK (Arid)
//"optic_DMS_weathered_F"; // DMS (Old)
//"optic_DMS_weathered_Kir_F"; // DMS Kir (Old)
//"optic_MRD_black"; // MRD (Black)

// Flashlights/Lasers
private _flashlight = "acc_flashlight"; // Flashlight
//"acc_flashlight_smg_01"; // Flashlight
//"acc_flashlight_pistol"; // Pistol Flashlight
private _laser      = "acc_pointer_IR"; // IR Laser Pointer

// Bipods
//  Mark
private _bipod = "bipod_01_F_snd"; // Bipod (Sand) [NATO]
private _bipodBLU = _bipod; // DEPRECATED Use _bipod
//"bipod_01_F_blk"; // Bipod (Black) [NATO]
//"bipod_01_F_mtp"; // Bipod (MTP) [NATO]
//"bipod_02_F_blk"; // Bipod (Black) [CSAT]
//"bipod_02_F_tan"; // Bipod (Tan) [CSAT]
//"bipod_02_F_hex"; // Bipod (Hex) [CSAT]
//"bipod_03_F_blk"; // Bipod (Black) [AAF]
//"bipod_03_F_oli"; // Bipod (Olive) [AAF]
//  Expansion
//"bipod_01_F_khk"; // Bipod (Khaki) [NATO]
//  Enoch
//"bipod_02_F_lush"; // Bipod (Lush) [Spetsnaz]
//"bipod_02_F_arid"; // Bipod (Arid) [Spetsnaz]

// DLC Exclusive
//  Suppressors
//   Apex
//"muzzle_snds_58_blk_F"; // Stealth Sound Suppressor (5.8 mm, Black)
//"muzzle_snds_58_ghex_F"; // Stealth Sound Suppressor (5.8 mm, Green Hex)
//"muzzle_snds_58_hex_F"; // Stealth Sound Suppressor (5.8 mm, Hex)
private _sup65Sth = "muzzle_snds_65_TI_blk_F"; // Stealth Sound Suppressor (6.5 mm, Black)
private _sup65SthHex = "muzzle_snds_65_TI_hex_F"; // Stealth Sound Suppressor (6.5 mm, Hex)
private _sup65SthGhex = "muzzle_snds_65_TI_ghex_F"; // Stealth Sound Suppressor (6.5 mm, Green Hex)
//   Contact
//"muzzle_antenna_01_f"; // SD Military Antenna (78-89 MHz)
//"muzzle_antenna_02_f"; // SD Experimental Antenna (390-500 MHz)
//"muzzle_antenna_03_f"; // SD Jammer Antenna (433 MHz)
//  Scopes
//   Marksmen
//"optic_AMS"; // AMS (Black)
//"optic_AMS_khk"; // AMS (Khaki)
//"optic_AMS_snd"; // AMS (Sand)
private _Kahlia = "optic_KHS_blk"; // Kahlia (Black)
private _KahliaHex = "optic_KHS_hex"; // Kahlia (Hex)
private _KahliaOld = "optic_KHS_old"; // Kahlia (Old)
private _KahliaTan = "optic_KHS_tan"; // Kahlia (Tan)
//"optic_ERCO_blk_F"; // ERCO (Black)
//"optic_ERCO_khk_F"; // ERCO (Khaki)
//"optic_ERCO_snd_F"; // ERCO (Sand)
//   Contact
//"optic_ico_01_f"; // Promet Modular Sight
//"optic_ico_01_black_f"; // Promet Modular Sight (Black)
//"optic_ico_01_sand_f"; // Promet Modular Sight (Sand)
//"optic_ico_01_camo_f"; // Promet Modular Sight (Camo)
//  Flashlights/Lasers
//   Contact
//"acc_esd_01_flashlight"; // SD Flashlight
//  Bipods
//   Contact
//"ChemicalDetector_01_olive_F"; // Chemical Detector (Cover, Olive)
//"ChemicalDetector_01_black_F"; // Chemical Detector (Cover, Black)
//"ChemicalDetector_01_tan_F"; // Chemical Detector (Cover, Tan)

//HLC
// Suppressors
private _supG3     = "hlc_muzzle_300blk_kac"; // QD .300BLK Suppressor
private _supHK33   = "hlc_muzzle_556nato_m42000"; // AAC M4-2000
private _supFAL    = "hlc_muzzle_300blk_kac"; // QD .300BLK Suppressor
private _supM14    = "hlc_muzzle_300blk_kac"; // QD .300BLK Suppressor
private _sup545AK  = "hlc_muzzle_545SUP_AK";
private _sup762AK  = "hlc_muzzle_762SUP_AK";

// Scopes
private _ZFSG1    = "HLC_Optic_ZFSG1";
private _ACOG3    = "hlc_optic_accupoint_g3";
private _NWSG3    = "hlc_optic_PVS4G3";
private _SUSAT    = "hlc_optic_suit";
private _M14SCOPE = "hlc_optic_artel_m14";
private _LEOPOLD  = "hlc_optic_LRT_m14";
private _PSO1     = "HLC_Optic_PSO1";
private _1P29     = "HLC_Optic_1p29";
private _GOSHAWK  = "hlc_optic_goshawk";

//FHQ
// Scopes
private _FHQACOG           = "rhsusf_acc_ACOG_RMR";
private _FHQACOGTAN        = "rhsusf_acc_ACOG_RMR";
private _FHQAIMPOINT       = "rhsusf_acc_compm4";
private _FHQAIMPOINTTAN    = "rhsusf_acc_compm4";
private _FHQTWS            = "rhsusf_acc_anpas13gv1";
private _FHQHWS            = "rhsusf_acc_eotech_xps3";
private _FHQHWSTAN         = "rhsusf_acc_eotech_xps3";
private _FHQEOTECH         = "rhsusf_acc_g33_xps3";
private _FHQEOTECHTAN      = "rhsusf_acc_g33_xps3_tan";
private _FHQMICROCCO       = "rhsusf_acc_T1_high";
private _FHQMICROCCOTAN    = "rhsusf_acc_T1_high";
private _FHQMICROCCOLOW    = "rhsusf_acc_T1_low";
private _FHQMICROCCOLOWTAN = "rhsusf_acc_T1_low";
private _FHQLEOPOLD        = "rhsusf_acc_LEUPOLDMK4_2";
private _FHQLEOPOLDTAN     = "rhsusf_acc_LEUPOLDMK4_2_d";
private _FHQVCOG           = "optic_MRCO";
private _FHQVCOGTAN        = "optic_MRCO";
private _FHQAC117          = "rhsusf_acc_mrds";
private _FHQAC117TAN       = "rhsusf_acc_mrds_c";
private _FHQAC121          = _FHQHWS;
private _FHQAC121TAN       = _FHQHWSTAN;
private _FHQMARS           = "rhsusf_acc_RX01_NoFilter";
private _FHQMARSTAN        = "rhsusf_acc_RX01_NoFilter_tan";

// Flashlights/Lasers
private _FHQANPE    = "rhsusf_acc_anpeq15side";
private _FHQANPEBLK = "rhsusf_acc_anpeq15side_bk";
private _FHQLLM     = "rhsusf_acc_anpeq15_bk";
if (isClass (configfile >> "CfgPatches" >> "FHQ_Accessories")) then {
	// Scopes
	_FHQACOG            = "FHQ_optic_ACOG";
	_FHQACOGTAN         = "FHQ_optic_ACOG_tan";
	_FHQAIMPOINT        = "FHQ_optic_AIM";
	_FHQAIMPOINTTAN     = "FHQ_optic_AIM_tan";
	_FHQTWS             = "FHQ_optic_TWS3050";
	_FHQHWS             = "FHQ_optic_HWS";
	_FHQHWSTAN          = "FHQ_optic_HWS_tan";
	_FHQEOTECH          = "FHQ_optic_HWS_G33";
	_FHQEOTECHTAN       = "FHQ_optic_HWS_G33_tan";
	_FHQMICROCCO        = "FHQ_optic_MicroCCO";
	_FHQMICROCCOTAN     = "FHQ_optic_MicroCCO_tan";
	_FHQMICROCCOLOW     = "FHQ_optic_MicroCCO_low";
	_FHQMICROCCOLOWTAN  = "FHQ_optic_MicroCCO_low_tan";
	_FHQLEOPOLD         = "FHQ_optic_LeupoldERT";
	_FHQLEOPOLDTAN      = "FHQ_optic_LeupoldERT_tan";
	_FHQVCOG            = "FHQ_optic_VCOG";
	_FHQVCOGTAN         = "FHQ_optic_VCOG_tan";
	_FHQAC117           = "FHQ_optic_AC11704";
	_FHQAC117TAN        = "FHQ_optic_AC11704_tan";
	_FHQAC121           = "FHQ_optic_AC12136";
	_FHQAC121TAN        = "FHQ_optic_AC12136_tan";
	_FHQMARS            = "FHQ_optic_MARS";
	_FHQMARSTAN         = "FHQ_optic_MARS_tan";

	// Flashlights/Lasers
	_FHQANPE    = "FHQ_acc_ANPEQ15";
	_FHQANPEBLK = "FHQ_acc_ANPEQ15_black";
	_FHQLLM     = "FHQ_acc_LLM01L";
};
