// Nightvision Goggles - copyToClipboard ("configName _x call BIS_fnc_itemType params ['_itemCategory', '_itemType']; getNumber (_x >> 'scope') == 2 && _itemCategory == 'Item' && _itemType == 'NVGoggles' && { !isClass (_x >> 'LinkedItems') || getText (_x >> 'baseWeapon') == configName _x }" configClasses (configfile >> "CfgWeapons") apply { private _dlcInfo = getAssetDLCInfo [configName _x, configfile >> "CfgWeapons"]; format ["""%1""; // %2 - %3%4 %5", configName _x, getText (_x >> "displayName"), ["", format ["%2 (%1), ", _dlcInfo#4, _dlcInfo#5]] select _dlcInfo#0, configSourceModList _x, configName _x call BIS_fnc_itemType] } joinString toString [13])
private _PVS14 = "rhsusf_ANPVS_14";
private _PVS15 = "rhsusf_ANPVS_15";

private _NVG = "NVGoggles"; // NV Goggles (Brown)
private _NVGBlk = "NVGoggles_OPFOR"; // NV Goggles (Black)
private _NVGGrn = "NVGoggles_INDEP"; // NV Goggles (Green)
private _NVGTrc = "NVGoggles_tna_F"; // NV Goggles (Tropic)
//  Expansion
private _CNVGHex = "O_NVGoggles_hex_F"; // Compact NVG (Hex)
private _CNVGUHex = "O_NVGoggles_urb_F"; // Compact NVG (Urban)
private _CNVGGHex = "O_NVGoggles_ghex_F"; // Compact NVG (Green Hex)
//  Enoch
private _CNVGGrn = "O_NVGoggles_grn_F"; // Compact NVG (Green)
//  Apex
private _ENVGBlk = "NVGogglesB_blk_F"; // ENVG-II (Black)
private _ENVGGrn = "NVGogglesB_grn_F"; // ENVG-II (Green)
private _ENVG = "NVGogglesB_gry_F"; // ENVG-II (Grey)

private _NVGEN1 = _NVG;
private _NVGEN2 = _NVG;
private _NVGEN3 = _NVG;
private _NVGEN4 = _NVG;
private _NVWIDE = _NVG;
if (mission_ACE3_enabled) then {
	_NVGEN1 = "ACE_NVG_Gen1";
	_NVGEN2 = "ACE_NVG_Gen2";
	_NVGEN4 = "ACE_NVG_Gen4";
	_NVWIDE = "ACE_NVG_Wide";
};

private _NVGEN3OP = _NVGBlk; // Backward compatibility
private _NVGEN3IND = _NVGGrn; // Backward compatibility
private _NVGEN3BLU = _NVG; // Backward compatibility

// Binoculars - copyToClipboard ("configName _x call BIS_fnc_itemType params ['_itemCategory', '_itemType']; getNumber (_x >> 'scope') == 2 && _itemCategory == 'Item' && _itemType in ['Binocular', 'LaserDesignator'] && { !isClass (_x >> 'LinkedItems') || getText (_x >> 'baseWeapon') == configName _x }" configClasses (configfile >> "CfgWeapons") apply { private _dlcInfo = getAssetDLCInfo [configName _x, configfile >> "CfgWeapons"]; format ["""%1""; // %2 - %3%4 %5", configName _x, getText (_x >> "displayName"), ["", format ["%2 (%1), ", _dlcInfo#4, _dlcInfo#5]] select _dlcInfo#0, configSourceModList _x, configName _x call BIS_fnc_itemType] } joinString toString [13])
private _binocular = "Binocular"; // Binoculars
private _binoc = _binocular; // Backward compatibility
private _rangefinder = "Rangefinder"; // Rangefinder
//  Mark
private _laserdesignator = "Laserdesignator"; // Laser Designator (Sand)
private _laserdesignatorHex = "Laserdesignator_02"; // Laser Designator (Hex)
private _laserdesignatorOli = "Laserdesignator_03"; // Laser Designator (Olive)
//  Expansion
private _laserdesignatorKhk = "Laserdesignator_01_khk_F"; // Laser Designator (Khaki)
private _laserdesignatorGHex = "Laserdesignator_02_ghex_F"; // Laser Designator (Green Hex)

// Medical - (UNTESTED) copyToClipboard ("configName _x call BIS_fnc_itemType params ['_itemCategory', '_itemType']; getNumber (_x >> 'scope') == 2 && _itemCategory == 'Item' && _itemType in ['FirstAidKit', 'Medikit', 'Unknown', 'UnknownEquipment', 'UnknownWeapon'] && { !isClass (_x >> 'LinkedItems') || getText (_x >> 'baseWeapon') == configName _x }" configClasses (configfile >> "CfgWeapons") apply { private _dlcInfo = getAssetDLCInfo [configName _x, configfile >> "CfgWeapons"]; format ["""%1""; // %2 - %3%4 %5", configName _x, getText (_x >> "displayName"), ["", format ["%2 (%1), ", _dlcInfo#4, _dlcInfo#5]] select _dlcInfo#0, configSourceModList _x, configName _x call BIS_fnc_itemType] } joinString toString [13])
private _bandage = "FirstAidKit";
private _fieldDressing = "";
private _packingBandage = "";
private _elasticBandage = "";
private _quickClot = "";
CONTENT_CARGO(tourniquet,"",{_countTourniquetCargo});
CONTENT_CARGO(splint,"",{_countSplintCargo});
CONTENT_CARGO(morphine,"",{_countMorphineCargo});
CONTENT_CARGO(epinephrine,"",{_countEpiCargo});
private _epi = _epinephrine; // DEPRECATED Use _epinephrine
CONTENT_CARGO(adenosine,"",{_countEpiCargo});
CONTENT_CARGO(painkillers,"",{_countMorphineCargo});
private _atrophine = ""; // DEPRECATED Remove usage
private _bloodbag = "";
CONTENT_CARGO(blood1000,"",{_countBloodbagCargo});
CONTENT_CARGO(blood500,"",{_countBloodbagCargo});
CONTENT_CARGO(blood250,"",{_countBloodbagCargo});
private _plasma1000 = "";
private _plasma500 = "";
private _plasma250 = "";
private _saline1000 = "";
private _saline500 = "";
private _saline250 = "";
CONTENT_CARGO(surgicalKit,"Medikit",5);
private _surgKit = _surgicalKit; // DEPRECATED Use _surgicalKit
CONTENT_CARGO(suture,"",50);
CONTENT_CARGO(personalAidKit,"",{_countPAKCargo});CONTENT_CARGO_A(pak,personalAidKit,{_countPAKCargo})
CONTENT_CARGO(bodyBag,"",30);
CONTENT_CARGO_N(bodyBagBlue,"",bodybag_blue,30);
CONTENT_CARGO_N(bodyBagWhite,"",bodybag_white,30);
private _defib = ""; // Backward compatibility

if (mission_ACE3_enabled) then {
	if (ace_medical_treatment_advancedBandages > 0) then { // Enabled
		_bandage = "";
		_fieldDressing = "ACE_fieldDressing";
		_packingBandage = "ACE_packingBandage";
		_elasticBandage = "ACE_elasticBandage";
		_quickClot = "ACE_quikclot";
	} else {
		_bandage = "ACE_fieldDressing"; // Type doesn't matter
	};

	_tourniquet = "ACE_tourniquet";
	if (missionNamespace getVariable ["ace_medical_fractures", 0] > 0) then {
		_splint = "ACE_splint";
	};

	_morphine = "ACE_morphine";
	_epinephrine = "ACE_epinephrine"; _epi = _epinephrine;

	if (ace_medical_treatment_advancedMedication) then {
		_adenosine = "ACE_adenosine";
		_atrophine = _adenosine; // Backward compatibility
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
		_surgicalKit = "ACE_surgicalKit"; _surgKit = _surgicalKit;
		if (ace_medical_treatment_consumeSurgicalKit == 2) then {
			_suture = "ACE_suture";
		};
	};

	_personalAidKit = "ACE_personalAidKit";
	_bodyBag = "ACE_bodyBag";
	_bodyBagBlue = "ACE_bodyBag_blue";
	_bodyBagWhite = "ACE_bodyBag_white";
};

// Smoke Grenades
CONTENT_CARGO_N(wSmoke,"SmokeShell",smoke_white,{_countGrenadesCargo}); // Smoke Grenade (White)
CONTENT_CARGO_N(rSmoke,"SmokeShellRed",smoke_red,{_countGrenadesCargo}); // Smoke Grenade (Red)
CONTENT_CARGO_N(gSmoke,"SmokeShellGreen",smoke_green,{_countGrenadesCargo}); // Smoke Grenade (Green)
CONTENT_CARGO_N(ySmoke,"SmokeShellYellow",smoke_yellow,{_countGrenadesCargo}); // Smoke Grenade (Yellow)
CONTENT_CARGO_N(pSmoke,"SmokeShellPurple",smoke_purple,{_countGrenadesCargo}); // Smoke Grenade (Purple)
CONTENT_CARGO_N(bSmoke,"SmokeShellBlue",smoke_blue,{_countGrenadesCargo}); // Smoke Grenade (Blue)
CONTENT_CARGO_N(oSmoke,"SmokeShellOrange",smoke_orange,{_countGrenadesCargo}); // Smoke Grenade (Orange)

// Chemlights
CONTENT_CARGO_N(gChemlight,"Chemlight_green",chemlight_green,{_countGrenadesCargo}); // Chemlight (Green)
CONTENT_CARGO_N(rChemlight,"Chemlight_red",chemlight_red,{_countGrenadesCargo}); // Chemlight (Red)
CONTENT_CARGO_N(yChemlight,"Chemlight_yellow",chemlight_yellow,{_countGrenadesCargo}); // Chemlight (Yellow)
CONTENT_CARGO_N(bChemlight,"Chemlight_blue",chemlight_blue,{_countGrenadesCargo}); // Chemlight (Blue)
CONTENT_CARGO_N(wChemlight,"",chemlight_white,{_countGrenadesCargo});
CONTENT_CARGO_N(oChemlight,"",chemlight_orange,{_countGrenadesCargo});

CONTENT_CARGO_N(rChemlightHi,_rChemlight,chemlight_red_hi,{_countGrenadesCargo});
CONTENT_CARGO_N(gChemlightHi,_gChemlight,chemlight_green_hi,{_countGrenadesCargo});
CONTENT_CARGO_N(bChemlightHi,_bChemlight,chemlight_blue_hi,{_countGrenadesCargo});
CONTENT_CARGO_N(yChemlightHi,_yChemlight,chemlight_yellow_hi,{_countGrenadesCargo});
CONTENT_CARGO_N(wChemlightHi,_wChemlight,chemlight_white_hi,{_countGrenadesCargo});
CONTENT_CARGO_N(oChemlightHi,_oChemlight,chemlight_orange_hi,{_countGrenadesCargo});
CONTENT_CARGO_N(oChemlightHiU,_oChemlight,chemlight_orange_uhi,{_countGrenadesCargo});
CONTENT_CARGO(irChemlight,"",{_countGrenadesCargo});

// Grenades
CONTENT_CARGO(grenade,"HandGrenade",{_countGrenadesCargo}); // RGO Grenade
private _grenadeOpfor = _grenade; // DEPRECATED Use _grenade (rund_co21_Norwegian_Fog_v2.tem_vinjesvingenc)
private _m67Grenade = _grenade; // DEPRECATED Use _grenade (Engee_co24_Snowmen_v02.Chernarus_Winter)
CONTENT_CARGO(grenadeOffensive,"MiniGrenade",{_countGrenadesCargo}); // RGN Grenade

CONTENT_CARGO(irGrenade,"B_IR_Grenade",{_countGrenadesCargo}); // IR Grenade [NATO]
//"O_IR_Grenade"; // IR Grenade [CSAT]
//"I_IR_Grenade"; // IR Grenade [AAF]
CONTENT_CARGO(flashbang,"rhs_mag_mk84",{_countGrenadesCargo});
private _cs = "rhs_mag_m7a3_cs";
CONTENT_CARGO(incendiary,"rhs_mag_an_m14_th3",{_countGrenadesCargo});

// Hand Held Flares
CONTENT_CARGO(wFlare,"",{_countGrenadesCargo});
CONTENT_CARGO(rFlare,"",{_countGrenadesCargo});
CONTENT_CARGO(gFlare,"",{_countGrenadesCargo});
CONTENT_CARGO(yFlare,"",{_countGrenadesCargo});

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

	_irGrenade = "ACE_IR_Strobe_Item";
	_flashbang = "ACE_M84";
	_incendiary = "ACE_M14";

	_wFlare = "ACE_HandFlare_White";
	_rFlare = "ACE_HandFlare_Red";
	_gFlare = "ACE_HandFlare_Green";
	_yFlare = "ACE_HandFlare_Yellow";
};

// IEDs
private _ied = "IEDUrbanSmall_Remote_Mag"; // Small IED (Urban)
private _iedLarge = "IEDUrbanBig_Remote_Mag"; // Large IED (Urban)
private _iedDirt = "IEDLandSmall_Remote_Mag"; // Small IED (Dug-in)
private _iedDirtLarge = "IEDLandBig_Remote_Mag"; // Large IED (Dug-in)

// Mines
private _atMine = "ATMine_Range_Mag"; // AT Mine
private _dpMine = "SLAMDirectionalMine_Wire_Mag"; // M6 SLAM Mine
private _apMine = "APERSMine_Range_Mag"; // APERS Mine
private _apMineBounding = "APERSBoundingMine_Range_Mag"; // APERS Bounding Mine
private _apBoundingMine = _apMineBounding; // DEPRECATED Use _apMineBounding
private _apMineWire = "APERSTripMine_Wire_Mag"; // APERS Tripwire Mine
private _apMineDirectional = "ClaymoreDirectionalMine_Remote_Mag"; // Claymore Charge

// Explosives
private _demoCharge = "DemoCharge_Remote_Mag"; // Explosive Charge
private _C4 = _demoCharge; // DEPRECATED Use _demoCharge
private _demoSatchel = "SatchelCharge_Remote_Mag"; // Explosive Satchel
private _satchelCharge = _demoSatchel; // DEPRECATED Use _demoSatchel

// Utility
CONTENT_CARGO_N(parachute,"B_Parachute",parachutes,20);
CONTENT_CARGO(mineDetector,"MineDetector",5);
CONTENT_CARGO(toolKit,"ToolKit",5);

CONTENT_CARGO(spareBarrel,"",5);
CONTENT_CARGO_N(cableTie,"",handcuffs,25);
CONTENT_CARGO(flashlight,"",5);
CONTENT_CARGO(clacker,"",5);
CONTENT_CARGO(clackerLR,"",5);
CONTENT_CARGO(clackerDM,"",5);
private _deadManSwitch = _clackerDM; // DEPRECATED Use _clackerDM
CONTENT_CARGO(defusalKit,"",5);
CONTENT_CARGO(cellphone,"",5);
CONTENT_CARGO(earPlugs,"",25);
CONTENT_CARGO(dagr,"",5);
CONTENT_CARGO(mapTools,"",5);
CONTENT_CARGO(uavBattery,"",5);
CONTENT_CARGO(weatherMeter,"",5);
private _kestrel = _weatherMeter; // DEPRECATED Use _weatherMeter
CONTENT_CARGO(rifleRangetable,"",5);
private _rangeCard = _rifleRangetable; // DEPRECATED Use _rangeCard
CONTENT_CARGO(mortarRangetable,"",5);
CONTENT_CARGO(artilleryRangetable,"",5);
CONTENT_CARGO(spottingScope,"",5);
CONTENT_CARGO(ballisticsPDA,"",5);
private _ATragMX = _ballisticsPDA; // DEPRECATED Use _ballisticsPDA
CONTENT_CARGO(entrenchingTool,"",30);
CONTENT_CARGO(wirecutter,"",30);
CONTENT_CARGO(banana,"",100);
CONTENT_CARGO(huntIRMonitor,"",5);
CONTENT_CARGO(huntIRM203,"",50);
CONTENT_CARGO(sandbag,"",50);
CONTENT_CARGO(tacticalLadder,"",5);
CONTENT_CARGO_N(spraypaintBlack,"",spraypaint_black,10);
CONTENT_CARGO_N(spraypaintBlue,"",spraypaint_blue,10);
CONTENT_CARGO_N(spraypaintGreen,"",spraypaint_green,10);
CONTENT_CARGO_N(spraypaintRed,"",spraypaint_red,10);
CONTENT_CARGO_N(spraypaintWhite,"",spraypaint_white,10);
CONTENT_CARGO_N(spraypaintYellow,"",spraypaint_yellow,10);
CONTENT_CARGO(chemlightShield,"",30);
CONTENT_CARGO(fortifyTool,"",30);
CONTENT_CARGO(plottingBoard,"",10);
CONTENT_CARGO_N(markerFlagBlack,"",markerflag_black,50);
CONTENT_CARGO_N(markerFlagBlue,"",markerflag_blue,50);
CONTENT_CARGO_N(markerFlagGreen,"",markerflag_green,50);
CONTENT_CARGO_N(markerFlagOrange,"",markerflag_orange,50);
CONTENT_CARGO_N(markerFlagPurple,"",markerflag_purple,50);
CONTENT_CARGO_N(markerFlagRed,"",markerflag_red,50);
CONTENT_CARGO_N(markerFlagWhite,"",markerflag_white,50);
CONTENT_CARGO_N(markerFlagYellow,"",markerflag_yellow,50);
CONTENT_CARGO(towRope,"",10);
CONTENT_CARGO(towRope3,"",10);
CONTENT_CARGO(towRope6,"",10);
CONTENT_CARGO(towRope12,"",10);
CONTENT_CARGO(towRope15,"",10);
CONTENT_CARGO(towRope18,"",10);
CONTENT_CARGO(towRope27,"",10);
CONTENT_CARGO(towRope36,"",10);
if (mission_ACE3_enabled) then {
	_mineDetector = "ACE_VMM3";
	_spareBarrel = "ACE_SpareBarrel";
	_cableTie = "ACE_CableTie";
	_flashlight = "ACE_Flashlight_XL50";
	_clacker = "ACE_Clacker";
	_clackerLR = "ACE_M26_Clacker";
	_clackerDM = "ACE_DeadManSwitch"; _deadManSwitch = _clackerDM;
	_defusalKit = "ACE_DefusalKit";
	_cellphone = "ACE_Cellphone";
	if (ace_hearing_enableCombatDeafness) then {
		_earPlugs = "ACE_EarPlugs";
	};
	_dagr = "ACE_microDAGR"; // "ACE_DAGR"
	_mapTools = "ACE_MapTools";
	_uavBattery = "ACE_UAVBattery";
	_weatherMeter = "ACE_Kestrel4500"; _kestrel = _weatherMeter;
	_rifleRangetable = "ACE_RangeCard"; _rangeCard = _rifleRangetable;
	_mortarRangetable = "ACE_RangeTable_82mm";
	_artilleryRangetable = "ACE_artilleryTable";
	_spottingScope = "ACE_SpottingScope";
	_ballisticsPDA = "ACE_ATragMX"; _ATragMX = _ballisticsPDA;
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
	_towRope = "ACE_rope12";
	_towRope3 = "ACE_rope3";
	_towRope6 = "ACE_rope6";
	_towRope12 = "ACE_rope12";
	_towRope15 = "ACE_rope15";
	_towRope18 = "ACE_rope18";
	_towRope27 = "ACE_rope27";
	_towRope36 = "ACE_rope36";
};

private _earBuds = _earPlugs; // Backward compatibility

// Immersion Cigs
CONTENT_CARGO(matches,"",30);
CONTENT_CARGO(lighter,"",30);
CONTENT_CARGO(cigpack,"",50);
CONTENT_CARGO_N(cigar,"",cigars,50);
CONTENT_CARGO_N(cigarette,"",cigarettes,20);
if (isClass (configFile >> "CfgPatches" >> "murshun_cigs")) then {
	_matches = "murshun_cigs_matches";
	_lighter = "murshun_cigs_lighter";
	_cigpack = "murshun_cigs_cigpack";
	_cigar = "immersion_cigs_cigar0";
	_cigarette = "murshun_cigs_cig0";
};

CONTENT_CARGO(lollipopPack,"",50);
CONTENT_CARGO_N(lollipop,"",lollipops,20);
if (isClass (configFile >> "CfgPatches" >> "immersion_pops")) then {
	_lollipopPack = "immersion_pops_poppack";
	_lollipop = "immersion_pops_pop0";
};
