//Vanilla
// Suppressors
private _sup65  = "muzzle_snds_H";
private _sup9mm = "muzzle_snds_L";
private _sup45  = "muzzle_snds_acp";
private _sup556 = "muzzle_snds_M";
private _sup762 = "muzzle_snds_B";
private _supLMG = "muzzle_snds_H_MG";
private _sup93  = "muzzle_snds_93mmg_tan";
private _sup338 = "muzzle_snds_338_sand";

// Scopes
private _ARCO         = "optic_Arco";
private _RCO          = "optic_Hamr";
private _ACOred       = "optic_Aco";
private _ACOgreen     = "optic_ACO_grn";
private _EOT          = "optic_Holosight";
private _NVS          = "optic_NVS";
private _Nightstalker = "optic_Nightstalker";
private _SOS          = "optic_SOS";
private _TWS          = "optic_tws";
private _TWSmg        = "optic_tws_mg";

// Flashlights/Lasers
private _flashlight = "acc_flashlight";
private _laser      = "acc_pointer_IR";

// Bipods
private _bipod = "bipod_01_F_snd";
private _bipodBLU = _bipod; // DEPRECATED Use _bipod

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
