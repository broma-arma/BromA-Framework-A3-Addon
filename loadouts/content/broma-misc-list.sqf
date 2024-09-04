// =============================================================================
//                          MISCELLANEOUS ITEMS
// =============================================================================

// MEDICAL =====================================================================

private _bandage = "FirstAidKit";
private _fieldDressing = "";
private _packingBandage = "";
private _elasticBandage = "";
private _quickClot = "";
private _tourniquet = "";CONTENT_CARGO(tourniquet,{_countTourniquetCARGO})
private _splint = "";CONTENT_CARGO(splint,{_countSplintCARGO})
private _morphine = "";CONTENT_CARGO(morphine,{_countMorphineCARGO})
private _epi = "";CONTENT_CARGO(epi,{_countEpiCARGO})CONTENT_CARGO_N(epinephrine,epi,{_countEpiCARGO})
private _adenosine = "";CONTENT_CARGO(adenosine,{_countEpiCARGO})
private _painkillers = "";CONTENT_CARGO(painkillers,{_countMorphineCARGO})
private _atropine = "";
private _atrophine = "";
private _bloodbag = "";
private _blood1000 = "";CONTENT_CARGO(blood1000,{_countBloodbagCARGO})
private _blood500 = "";CONTENT_CARGO(blood500,{_countBloodbagCARGO})
private _blood250 = "";CONTENT_CARGO(blood250,{_countBloodbagCARGO})
private _plasma1000 = "";
private _plasma500 = "";
private _plasma250 = "";
private _saline1000 = "";
private _saline500 = "";
private _saline250 = "";
private _surgKit = "Medikit";CONTENT_CARGO(surgKit,5)
private _suture = "";CONTENT_CARGO(suture,50)
private _personalAidKit = "";CONTENT_CARGO(personalAidKit,{_countPAKCARGO})CONTENT_CARGO_N(pak,personalAidKit,{_countPAKCARGO})
private _bodyBag = "";CONTENT_CARGO(bodyBag,30)
private _bodyBagBlue = "";CONTENT_CARGO_N(bodybag_blue,bodyBagBlue,30)
private _bodyBagWhite = "";CONTENT_CARGO_N(bodybag_white,bodyBagWhite,30)
private _defib = ""; // Backward compatibility

if (mission_ACE3_enabled) then {
	if (ace_medical_treatment_advancedBandages > 0) then { // Enabled
		_bandage = "";
		_fieldDressing = "ACE_fieldDressing";
		_packingBandage = "ACE_packingBandage";
		_elasticBandage = "ACE_elasticBandage";
		_quickClot = "ACE_quikclot";
	} else {
		_bandage = "ACE_fieldDressing";
	};

	_tourniquet = "ACE_tourniquet";
	if (missionNamespace getVariable ["ace_medical_fractures", 0] > 0) then {
		_splint = "ACE_splint";
	};

	_morphine = "ACE_morphine";
	_epi = "ACE_epinephrine";

	if (ace_medical_treatment_advancedMedication) then {
		_adenosine = "ACE_adenosine";
		_atropine = _adenosine; // "ACE_atropine" was removed
		_atrophine = _atropine; // Backward compatibility
	};
	_painkillers = "ACE_painkillers";

	_blood1000 = "ACE_bloodIV";
	_blood500 = "ACE_bloodIV_500";
	_blood250 = "ACE_bloodIV_250";
	_bloodbag = _blood1000;

	_plasma1000 = "ACE_plasmaIV";
	_plasma500 = "ACE_plasmaIV_500";
	_plasma250 = "ACE_plasmaIV_250";

	_saline1000 = "ACE_salineIV";
	_saline500 = "ACE_salineIV_500";
	_saline250 = "ACE_salineIV_250";

	if (ace_medical_treatment_advancedBandages == 2) then { // Can Reopen
		_surgKit = "ACE_surgicalKit";
		if (ace_medical_treatment_consumeSurgicalKit == 2) then {
			_suture = "ACE_suture";
		};
	};

	_personalAidKit = "ACE_personalAidKit";
	_bodyBag = "ACE_bodyBag";
	_bodyBagBlue = "ACE_bodyBag_blue";
	_bodyBagWhite = "ACE_bodyBag_white";
};

// GRENADES ====================================================================

private _wSMOKE = "SmokeShell";CONTENT_CARGO_N(smoke_white,wsmoke,{_countGRENADESCARGO})
private _rSMOKE = "SmokeShellRed";CONTENT_CARGO_N(smoke_red,rsmoke,{_countGRENADESCARGO})
private _gSMOKE = "SmokeShellGreen";CONTENT_CARGO_N(smoke_green,gsmoke,{_countGRENADESCARGO})
private _ySMOKE = "SmokeShellYellow";CONTENT_CARGO_N(smoke_yellow,ySMOKE,{_countGRENADESCARGO})
private _pSMOKE = "SmokeShellPurple";CONTENT_CARGO_N(smoke_purple,pSMOKE,{_countGRENADESCARGO})
private _bSMOKE = "SmokeShellBlue";CONTENT_CARGO_N(smoke_blue,bSMOKE,{_countGRENADESCARGO})
private _oSMOKE = "SmokeShellOrange";CONTENT_CARGO_N(smoke_orange,oSMOKE,{_countGRENADESCARGO})

private _wSMOKEopfor = "rhs_mag_rdg2_white";
private _bSMOKEopfor = "rhs_mag_rdg2_black";
private _oSMOKEopfor = "rhs_mag_nspd";
private _ySMOKEopfor = "rhs_mag_nspn_yellow";
private _rSMOKEopfor = "rhs_mag_nspn_red";
private _gSMOKEopfor = "rhs_mag_nspn_green";

private _rCHEMLIGHT = "Chemlight_red";CONTENT_CARGO_N(chemlight_red,rchemlight,{_countGRENADESCARGO})
private _gCHEMLIGHT = "Chemlight_green";CONTENT_CARGO_N(chemlight_green,gchemlight,{_countGRENADESCARGO})
private _bCHEMLIGHT = "Chemlight_blue";CONTENT_CARGO_N(chemlight_blue,bchemlight,{_countGRENADESCARGO})
private _yChemlight = "Chemlight_yellow";CONTENT_CARGO_N(chemlight_yellow,ychemlight,{_countGRENADESCARGO})
private _wChemlight = "";CONTENT_CARGO_N(chemlight_white,wchemlight,{_countGRENADESCARGO})
private _oChemlight = "";CONTENT_CARGO_N(chemlight_orange,ochemlight,{_countGRENADESCARGO})

private _rChemlightHi = _rChemlight;CONTENT_CARGO_N(chemlight_red_hi,rChemlightHi,{_countGRENADESCARGO})
private _gChemlightHi = _gChemlight;CONTENT_CARGO_N(chemlight_green_hi,gChemlightHi,{_countGRENADESCARGO})
private _bChemlightHi = _bChemlight;CONTENT_CARGO_N(chemlight_blue_hi,bChemlightHi,{_countGRENADESCARGO})
private _yChemlightHi = _yChemlight;CONTENT_CARGO_N(chemlight_yellow_hi,yChemlightHi,{_countGRENADESCARGO})
private _wChemlightHi = _wChemlight;CONTENT_CARGO_N(chemlight_white_hi,wChemlightHi,{_countGRENADESCARGO})
private _oChemlightHi = _oChemlight;CONTENT_CARGO_N(chemlight_orange_hi,oChemlightHi,{_countGRENADESCARGO})
private _oChemlightHiU = _oChemlight;CONTENT_CARGO_N(chemlight_orange_uhi,oChemlightHiU,{_countGRENADESCARGO})
private _irChemlight = "";

private _irGRENADEblufor = "B_IR_Grenade";
private _irGRENADEopfor = "O_IR_Grenade";
private _irGRENADEindfor = "I_IR_Grenade";

private _GRENADE = "HandGrenade";CONTENT_CARGO(grenade,{_countGRENADESCARGO})
private _GRENADEopfor = "rhs_mag_rgd5";
private _miniGRENADE = "MiniGrenade";
private _m67GRENADE = "rhs_mag_m67";

private _flashbang = "rhs_mag_mk84";CONTENT_CARGO(flashbang,{_countGRENADESCARGO})
private _FLASHBANGblufor = _flashbang;
private _rhsFLASHBANGblufor = "rhs_mag_mk84";
private _FLASHBANGopfor = "rhs_mag_fakel";
private _FLASHBANGopforS = "rhs_mag_fakels";
private _flashbangZarya = "rhs_mag_zarya2";
private _flashbangPlamyam = "rhs_mag_plamyam";

private _CS = "rhs_mag_m7a3_cs";

private _INCENDIARY = "rhs_mag_an_m14_th3";CONTENT_CARGO(INCENDIARY,{_countGRENADESCARGO})

private _wFLARE = "";CONTENT_CARGO(wFLARE,{_countGRENADESCARGO})
private _rFLARE = "";CONTENT_CARGO(rFLARE,{_countGRENADESCARGO})
private _gFLARE = "";CONTENT_CARGO(gFLARE,{_countGRENADESCARGO})
private _yFLARE = "";CONTENT_CARGO(yFLARE,{_countGRENADESCARGO})

if (mission_ACE3_enabled) then {
	_wChemlight = "ACE_Chemlight_White";
	_oChemlight = "ACE_Chemlight_Orange";
	_rChemlightHi = "ACE_Chemlight_HiRed";
	_gChemlightHi = "ACE_Chemlight_HiGreen";
	_bChemlightHi = "ACE_Chemlight_HiBlue";
	_yChemlightHi = "ACE_Chemlight_HiYellow";
	_wChemlightHi = "ACE_Chemlight_HiWhite";
	_oChemlightHi = "ACE_Chemlight_HiOrange";
	_oChemlightHiU = "ACE_Chemlight_UltraHiOrange";
	_irChemlight = "ACE_Chemlight_IR";

	_flashbang = "ACE_M84";
	_INCENDIARY = "ACE_M14";

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

private _mineDetector = "MineDetector";CONTENT_CARGO(mineDetector,5)
private _toolKit = "ToolKit";CONTENT_CARGO(toolKit,5)

private _spareBarrel = "";CONTENT_CARGO(spareBarrel,5)
private _IRStrobe = "B_IR_Grenade";CONTENT_CARGO(IRStrobe,{_countGRENADESCARGO})
private _cableTie = "";
private _flashlight = "";CONTENT_CARGO(flashlight,5)
private _clacker = "";CONTENT_CARGO(clacker,5)
private _M26clacker = "";CONTENT_CARGO(M26clacker,5)
private _defusalKit = "";CONTENT_CARGO(defusalKit,5)
private _deadManSwitch = "";CONTENT_CARGO(deadManSwitch,5)
private _cellphone = "";CONTENT_CARGO(cellphone,5)
private _earPlugs = "";CONTENT_CARGO(earPlugs,25)
private _microDAGR = "";CONTENT_CARGO(microDAGR,5)
private _mapTools = "";CONTENT_CARGO(mapTools,5)
private _uavBattery = "";CONTENT_CARGO(uavBattery,5)
private _kestrel = "";CONTENT_CARGO(kestrel,5)
private _rangeCard = "";CONTENT_CARGO(rangeCard,5)
private _mortarTable = "";CONTENT_CARGO(mortarTable,5)
private _artilleryTable = "";CONTENT_CARGO(artilleryTable,5)
private _spottingScope = "";CONTENT_CARGO(spottingScope,5)
private _ATragMX = "";CONTENT_CARGO(ATragMX,5)
private _entrenchingTool = "";CONTENT_CARGO(entrenchingTool,30)
private _wirecutter = "";CONTENT_CARGO(wirecutter,30)
private _banana = "";CONTENT_CARGO(banana,100)
private _huntIRMonitor = "";CONTENT_CARGO(huntIRMonitor,5)
private _huntIRM203 = "";CONTENT_CARGO(huntIRM203,50)
private _sandbag = "";CONTENT_CARGO(sandbag,50)
private _tacticalLadder = "";CONTENT_CARGO(tacticalLadder,5)
private _spraypaintBlack = "";CONTENT_CARGO_N(spraypaint_black,spraypaintBlack,10)
private _spraypaintBlue = "";CONTENT_CARGO_N(spraypaint_blue,spraypaintBlue,10)
private _spraypaintGreen = "";CONTENT_CARGO_N(spraypaint_green,spraypaintGreen,10)
private _spraypaintRed = "";CONTENT_CARGO_N(spraypaint_red,spraypaintRed,10)
private _spraypaintWhite = "";CONTENT_CARGO_N(spraypaint_white,spraypaintWhite,10)
private _spraypaintYellow = "";CONTENT_CARGO_N(spraypaint_yellow,spraypaintYellow,10)
private _chemlightShield = "";CONTENT_CARGO(chemlightShield,30)
private _fortifyTool = "";CONTENT_CARGO(fortifyTool,30)
private _plottingBoard = "";CONTENT_CARGO(plottingBoard,10)
private _markerFlagBlack = "";CONTENT_CARGO_N(markerflag_black,markerFlagBlack,50)
private _markerFlagBlue = "";CONTENT_CARGO_N(markerflag_blue,markerFlagBlue,50)
private _markerFlagGreen = "";CONTENT_CARGO_N(markerflag_green,markerFlagGreen,50)
private _markerFlagOrange = "";CONTENT_CARGO_N(markerflag_orange,markerFlagOrange,50)
private _markerFlagPurple = "";CONTENT_CARGO_N(markerflag_purple,markerFlagPurple,50)
private _markerFlagRed = "";CONTENT_CARGO_N(markerflag_red,markerFlagRed,50)
private _markerFlagWhite = "";CONTENT_CARGO_N(markerflag_white,markerFlagWhite,50)
private _markerFlagYellow = "";CONTENT_CARGO_N(markerflag_yellow,markerFlagYellow,50)
private _rope3 = "";CONTENT_CARGO(rope3,10)
private _rope6 = "";CONTENT_CARGO(rope6,10)
private _rope12 = "";CONTENT_CARGO(rope12,10)
private _rope15 = "";CONTENT_CARGO(rope15,10)
private _rope18 = "";CONTENT_CARGO(rope18,10)
private _rope27 = "";CONTENT_CARGO(rope27,10)
private _rope36 = "";CONTENT_CARGO(rope36,10)
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
	if (ace_hearing_enableCombatDeafness) then {
		_earPlugs = "ACE_EarPlugs";
	};
	_microDAGR = "ACE_microDAGR";
	_mapTools = "ACE_MapTools";
	_uavBattery = "ACE_UAVBattery";
	_kestrel = "ACE_Kestrel4500";
	_rangeCard = "ACE_RangeCard";
	_mortarTable = "ACE_RangeTable_82mm";
	_artilleryTable = "ACE_artilleryTable";
	_spottingScope = "ACE_SpottingScope";
	_ATragMX = "ACE_ATragMX";
	_entrenchingTool = "ACE_EntrenchingTool";
	_wirecutter = "ACE_wirecutter";
	_banana = "ACE_Banana";
	_huntIRMonitor = "ACE_HuntIR_monitor";
	_huntIRM203 = "ACE_HuntIR_M203";
	_sandbag = "ACE_Sandbag_empty";
	_tacticalLadder = "ACE_TacticalLadder_Pack";
	_spraypaintBlack = "ACE_SpraypaintBlack";
	_spraypaintBlue = "ACE_SpraypaintBlue";
	_spraypaintGreen = "ACE_SpraypaintGreen";
	_spraypaintRed = "ACE_SpraypaintRed";
	_spraypaintWhite = "ACE_SpraypaintWhite";
	_spraypaintYellow = "ACE_SpraypaintYellow";
	_chemlightShield = "ACE_Chemlight_Shield";
	_fortifyTool = "ACE_Fortify";
	_plottingBoard = "ACE_PlottingBoard";
	_markerFlagBlack = "ace_marker_flags_black";
	_markerFlagBlue = "ace_marker_flags_blue";
	_markerFlagGreen = "ace_marker_flags_green";
	_markerFlagOrange = "ace_marker_flags_orange";
	_markerFlagPurple = "ace_marker_flags_purple";
	_markerFlagRed = "ace_marker_flags_red";
	_markerFlagWhite = "ace_marker_flags_white";
	_markerFlagYellow = "ace_marker_flags_yellow";
	_rope3 = "ACE_rope3";
	_rope6 = "ACE_rope6";
	_rope12 = "ACE_rope12";
	_rope15 = "ACE_rope15";
	_rope18 = "ACE_rope18";
	_rope27 = "ACE_rope27";
	_rope36 = "ACE_rope36";
};

private _earBuds = _earPlugs; // Backward compatibility

// Immersion Cigs
private _matches = "";CONTENT_CARGO(matches,30)
private _lighter = "";CONTENT_CARGO(lighter,30)
private _cigpack = "";CONTENT_CARGO(cigpack,50)
private _cigar = "";CONTENT_CARGO_N(cigars,cigar,50)
private _cigarette = "";CONTENT_CARGO_N(cigarettes,cigarette,20)
if (isClass (configFile >> "CfgPatches" >> "murshun_cigs")) then {
	_matches = "murshun_cigs_matches";
	_lighter = "murshun_cigs_lighter";
	_cigpack = "murshun_cigs_cigpack";
	_cigar = "immersion_cigs_cigar0";
	_cigarette = "murshun_cigs_cig0";
};

private _lollipopPack = "";CONTENT_CARGO(lollipopPack,50)
private _lollipop = "";CONTENT_CARGO_N(lollipops,lollipop,20)
if (isClass (configFile >> "CfgPatches" >> "immersion_pops")) then {
	_lollipopPack = "immersion_pops_poppack";
	_lollipop = "immersion_pops_pop0";
};
