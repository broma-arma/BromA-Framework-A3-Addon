// =============================================================================
//                          MISCELLANEOUS ITEMS
// =============================================================================

// MEDICAL =====================================================================

private _bandage = "FirstAidKit";
private _fieldDressing = "";
private _packingBandage = "";
private _elasticBandage = "";
private _quickClot = "";
private _tourniquet = "";
private _splint = "";
private _morphine = "";
private _epi = "";
private _adenosine = "";
private _atropine = "";
private _atrophine = "";
private _bloodbag = "";
private _blood1000 = "";
private _blood500 = "";
private _blood250 = "";
private _plasma1000 = "";
private _plasma500 = "";
private _plasma250 = "";
private _saline1000 = "";
private _saline500 = "";
private _saline250 = "";
private _surgKit = "Medikit";
private _personalAidKit = "";
private _bodyBag = "";
private _defib = ""; // Backward compatibility

if (mission_ACE3_enabled) then {
	_fieldDressing = "ACE_fieldDressing";
	_bandage = _fieldDressing;
	_packingBandage = "ACE_packingBandage";
	_elasticBandage = "ACE_elasticBandage";
	_quickClot = "ACE_quikclot";

	_tourniquet = "ACE_tourniquet";
	_splint = "ACE_splint";

	_morphine = "ACE_morphine";
	_epi = "ACE_epinephrine";
	_adenosine = "ACE_adenosine";
	_atropine = _adenosine; // "ACE_atropine" was removed
	_atrophine = _atropine; // Backward compatibility

	_bloodbag = "ACE_bloodIV";
	_blood1000 = _bloodbag;
	_blood500 = "ACE_bloodIV_500";
	_blood250 = "ACE_bloodIV_250";

	_plasma1000 = "ACE_plasmaIV";
	_plasma500 = "ACE_plasmaIV_500";
	_plasma250 = "ACE_plasmaIV_250";

	_saline1000 = "ACE_salineIV";
	_saline500 = "ACE_salineIV_500";
	_saline250 = "ACE_salineIV_250";

	_surgKit = "ACE_surgicalKit";
	_personalAidKit = "ACE_personalAidKit";
	_bodyBag = "ACE_bodyBag";
};

// GRENADES ====================================================================

private _wSMOKE = "SmokeShell";
private _gSMOKE = "SmokeShellGreen";
private _rSMOKE = "SmokeShellRed";
private _ySMOKE = "SmokeShellYellow";

private _wSMOKEopfor = "rhs_mag_rdg2_white";
private _bSMOKEopfor = "rhs_mag_rdg2_black";
private _oSMOKEopfor = "rhs_mag_nspd";
private _ySMOKEopfor = "rhs_mag_nspn_yellow";
private _rSMOKEopfor = "rhs_mag_nspn_red";
private _gSMOKEopfor = "rhs_mag_nspn_green";

private _rCHEMLIGHT = "chemlight_red";
private _gCHEMLIGHT = "chemlight_green";
private _bCHEMLIGHT = "chemlight_blue";

private _irGRENADEblufor = "B_IR_Grenade";
private _irGRENADEopfor = "O_IR_Grenade";
private _irGRENADEindfor = "I_IR_Grenade";

private _GRENADE = "HandGrenade";
private _GRENADEopfor = "rhs_mag_rgd5";
private _miniGRENADE = "MiniGrenade";
private _m67GRENADE = "rhs_mag_m67";

private _FLASHBANGblufor = "ACE_M84";
private _rhsFLASHBANGblufor = "rhs_mag_mk84";
private _FLASHBANGopfor = "rhs_mag_fakel";
private _FLASHBANGopforS = "rhs_mag_fakels";
private _flashbangZarya = "rhs_mag_zarya2";
private _flashbangPlamyam = "rhs_mag_plamyam";

private _CS = "rhs_mag_m7a3_cs";

private _INCENDIARY = "rhs_mag_an_m14_th3";

private _wFLARE = "";
private _rFLARE = "";
private _gFLARE = "";
private _yFLARE = "";
if (mission_ACE3_enabled) then {
	_wFLARE = "ACE_HandFlare_White";
	_rFLARE = "ACE_HandFlare_Red";
	_gFLARE = "ACE_HandFlare_Green";
	_yFLARE = "ACE_HandFlare_Yellow";
};

// EXPLOSIVES ==================================================================

// IEDs

private _iedUrban = "IEDUrbanBig_Remote_Mag";
private _iedUrbanSmall = "IEDUrbanSmall_Remote_Mag";
private _iedLand = "IEDLandBig_Remote_Mag";
private _iedLandSmall = "IEDLandSmall_Remote_Mag";

// AT Mines

private _atMine = "ATMine_Range_Mag";
private _atMineOpfor = "rhs_mine_tm62m_mag";
private _atMineBlufor = "rhs_mine_M19_mag";

// AP Mines

private _apMine = "APERSMine_Range_Mag";
private _apBoundingMine = "APERSBoundingMine_Range_Mag";
private _apTripwire = "APERSTripMine_Wire_Mag";
private _claymore = "ClaymoreDirectionalMine_Remote_Mag";
private _apMineOpfor = "rhs_mine_pmn2_mag";

// Explosives

private _SLAM = "SLAMDirectionalMine_Wire_Mag";
private _C4 = "DemoCharge_Remote_Mag";
private _satchelCharge = "SatchelCharge_Remote_Mag";

// UTILITY =====================================================================

private _mineDetector = "MineDetector";
private _toolKit = "ToolKit";

private _spareBarrel = "";
private _IRStrobe = "B_IR_Grenade";
private _cableTie = "";
private _flashlight = "";
private _clacker = "";
private _M26clacker = "";
private _defusalKit = "";
private _deadManSwitch = "";
private _cellphone = "";
private _earPlugs = "";
private _microDAGR = "";
private _mapTools = "";
private _uavBattery = "";
private _kestrel = "";
private _rangeCard = "";
private _spottingScope = "";
private _ATragMX = "";
if (mission_ACE3_enabled) then {
	_mineDetector = "ACE_VMM3";
	_spareBarrel = "ACE_SpareBarrel";
	_IRStrobe = "ACE_IR_Strobe_Item";
	_cableTie = "ACE_CableTie";
	_flashlight = "ACE_Flashlight_XL50";
	_clacker = "ACE_Clacker";
	_M26clacker = "ACE_M26_Clacker";
	_defusalKit = "ACE_DefusalKit";
	_deadManSwitch = "ACE_DeadManSwitch";
	_cellphone = "ACE_Cellphone";
	_earPlugs = "ACE_EarPlugs";
	_microDAGR = "ACE_microDAGR";
	_mapTools = "ACE_MapTools";
	_uavBattery = "ACE_UAVBattery";
	_kestrel = "ACE_Kestrel4500";
	_rangeCard = "ACE_RangeCard";
	_spottingScope = "ACE_SpottingScope";
	_ATragMX = "ACE_ATragMX";
};
private _earBuds = _earPlugs; // Backward compatibility
