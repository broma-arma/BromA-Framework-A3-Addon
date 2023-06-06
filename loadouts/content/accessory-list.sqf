// =============================================================================
//                          WEAPON ACCESSORIES LIST
// =============================================================================

// =============================================================================

// VANILLA

// Suppressors

_sup65 = "muzzle_snds_H";
_sup9mm = "muzzle_snds_L";
_sup45 = "muzzle_snds_acp";
_sup556 = "muzzle_snds_M";
_sup762 = "muzzle_snds_B";
_supLMG = "muzzle_snds_H_MG";
_sup93 = "muzzle_snds_93mmg_tan";
_sup338 = "muzzle_snds_338_sand";
_sup65Khk = "muzzle_snds_h_khk_f";
_sup65Snd = "muzzle_snds_h_snd_f";
_sup65ti = "muzzle_snds_65_ti_blk_f";
_sup65tiGhex = "muzzle_65_snds_ti_ghex_f";
_sup65tiHex = "muzzle_65_snds_ti_blk_f";

// Scopes

_ARCO = "optic_Arco";
_RCO = "optic_Hamr";
_ACOred = "optic_Aco";
_ACOgreen = "optic_ACO_grn";
_EOT = "optic_Holosight";
_NVS = "optic_NVS";
_Nightstalker = "optic_Nightstalker";
_SOS = "optic_SOS";
_TWS = "optic_tws";
_TWSmg = "optic_tws_mg";
_KHS = "optic_khs_blk";
_KHSHex = "optic_khs_hex";
_KHSOld = "optic_khs_old";
_KHSTan = "optic_khs_tan";

// Flashlights/Lasers

_flashlight = "acc_flashlight";
_laser = "acc_pointer_IR";

// Bipods

_bipodBLU = "bipod_01_F_snd";
_bipodOP = "bipod_02_F_hex";
_bipodIND = "bipod_03_F_oli";

// =============================================================================

// HLC

// Suppressors
_supG3 = "hlc_muzzle_300blk_kac"; // QD .300BLK Suppressor
_supHK33 = "hlc_muzzle_556nato_m42000"; // AAC M4-2000
_supFAL = "hlc_muzzle_300blk_kac"; // QD .300BLK Suppressor
_supM14 = "hlc_muzzle_300blk_kac"; // QD .300BLK Suppressor
_sup545AK = "hlc_muzzle_545SUP_AK";
_sup762AK = "hlc_muzzle_762SUP_AK";

// Scopes
_ZFSG1 = "HLC_Optic_ZFSG1";
_ACOG3 = "hlc_optic_accupoint_g3";
_NWSG3 = "hlc_optic_PVS4G3";
_SUSAT = "hlc_optic_suit";
_M14SCOPE = "hlc_optic_artel_m14";
_LEOPOLD = "hlc_optic_LRT_m14";
_PSO1 = "HLC_Optic_PSO1";
_1P29 = "HLC_Optic_1p29";
_GOSHAWK = "hlc_optic_goshawk";

// =============================================================================

// FHQ

// Scopes

_FHQACOG = "FHQ_optic_ACOG";
_FHQACOGTAN = "FHQ_optic_ACOG_tan";
_FHQAIMPOINT = "FHQ_optic_AIM";
_FHQAIMPOINTTAN = "FHQ_optic_AIM_tan";
_FHQTWS = "FHQ_optic_TWS3050";
_FHQHWS = "FHQ_optic_HWS";
_FHQHWSTAN = "FHQ_optic_HWS_tan";
_FHQEOTECH = "FHQ_optic_HWS_G33";
_FHQEOTECHTAN = "FHQ_optic_HWS_G33_tan";
_FHQMICROCCO = "FHQ_optic_MicroCCO";
_FHQMICROCCOTAN = "FHQ_optic_MicroCCO_tan";
_FHQMICROCCOLOW = "FHQ_optic_MicroCCO_low";
_FHQMICROCCOLOWTAN = "FHQ_optic_MicroCCO_low_tan";
_FHQLEOPOLD = "FHQ_optic_LeupoldERT";
_FHQLEOPOLDTAN = "FHQ_optic_LeupoldERT_tan";
_FHQVCOG = "FHQ_optic_VCOG";
_FHQVCOGTAN = "FHQ_optic_VCOG_tan";
_FHQAC117 = "FHQ_optic_AC11704";
_FHQAC117TAN = "FHQ_optic_AC11704_tan";
_FHQAC121 = "FHQ_optic_AC12136";
_FHQAC121TAN = "FHQ_optic_AC12136_tan";
_FHQMARS = "FHQ_optic_MARS";
_FHQMARSTAN = "FHQ_optic_MARS_tan";

// Flashlights/Lasers

_FHQANPE = "FHQ_acc_ANPEQ15";
_FHQANPEBLK = "FHQ_acc_ANPEQ15_black";
_FHQLLM = "FHQ_acc_LLM01L";

// =============================================================================

// NIGHT-VISION

_PVS14 = "rhsusf_ANPVS_14";
_PVS15 = "rhsusf_ANPVS_15";

if (mission_ACE3_enabled) then {
	_NVGEN1 = "ACE_NVG_Gen1";
	_NVGEN2 = "ACE_NVG_Gen2";
	_NVGEN4 = "ACE_NVG_Gen4";
	_NVWIDE = "ACE_NVG_Wide";
} else {
	_NVGEN1 = "NVGoggles";
	_NVGEN2 = "NVGoggles";
	_NVGEN4 = "NVGoggles";
	_NVWIDE = "NVGoggles";
};

_NVGEN3OP = "NVGoggles_OPFOR";
_NVGEN3IND = "NVGoggles_INDEP";
_NVGEN3BLU = "NVGoggles";
_NVGEN3TNA = "NVGoggles_tna_F";

ENVGBlk = "NVGogglesB_blk_F";
ENVGGrn = "NVGogglesB_grn_F";
EVNGGry = "NVGogglesB_gry_F";

_CNVGGhex = "O_NVGoggles_ghex_F";
_CNVGHex = "O_NVGoggles_hex_F";
_CNVGUrb = "O_NVGoggles_urb_F";
_CNVGGrn = "O_NVGoggles_grn_F";
// =============================================================================

// OTHERS

_parachute = "B_Parachute";
