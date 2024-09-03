switch (toLower _x) do {
	case "medical": {
		private _supplies = [];

		if (mission_ACE3_enabled) then {
			if (ace_hearing_enableCombatDeafness) then {
				_supplies pushBack [_earPlugs, 25];
			};

			_supplies append [
				[_morphine,       _countMorphineCARGO],
				[_epi,            _countEpiCARGO],
				[_tourniquet,     _countTourniquetCARGO],
				[_blood250,       _countBloodbagCARGO],
				[_blood500,       _countBloodbagCARGO],
				[_blood1000,      _countBloodbagCARGO],
				[_personalAidKit, _countPAKCARGO],
				[_bodyBag,        _countBloodbagCARGO]
			];

			if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
				_supplies pushBack [_bandage, _countBandageCARGO];
			} else { // Enabled
				_supplies append [
					[_fieldDressing,  _countBandageCARGO],
					[_packingBandage, _countBandageCARGO],
					[_elasticBandage, _countBandageCARGO],
					[_quickClot,      _countBandageCARGO]
				];

				if (ace_medical_treatment_advancedBandages == 2) then { // Can Reopen
					_supplies pushBack [_surgKit, [5, 50] select (ace_medical_treatment_consumeSurgicalKit == 1)];
					if (ace_medical_treatment_consumeSurgicalKit == 2) then {
						_supplies pushBack [_suture, 100];
					};
				};
			};

			if (ace_medical_treatment_advancedMedication) then {
				_supplies pushBack [_adenosine, _countMorphineCARGO];
			};

			if (ace_medical_fractures > 0) then {
				_supplies pushBack [_splint, _countSplintCARGO];
			};
		} else {
			_supplies append [
				["FirstAidKit", _countBandageCARGO],
				["Medikit",     _countPAKCARGO]
			];
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "ammo_big";
	case "ammo": {
		private _supplies = [
			[_commonRIFLE select RAMMO,    _countRifleCARGO],
			[_commonMG select RAMMO,       _countMGCARGO],
			[_commonAR select RAMMO,       _countARCARGO],
			[_commonMARKSMAN select RAMMO, _countRifleCARGO],
			[_commonSNIPER select RAMMO,   _countSNIPERCARGO],
			[_commonSMG select RAMMO,      _countRifleCARGO],
			[_commonRIFLEGL select GL,     _count40mmCARGO],
			[_commonRIFLEGL select RAMMO,  _countRifleCARGO],
			[_commonPISTOL select RAMMO,   _countPistolCARGO],
			[_grenade,                     _countGRENADESCARGO],
			[_rchemlight,                  _countGRENADESCARGO],
			[_gchemlight,                  _countGRENADESCARGO],
			[_bchemlight,                  _countGRENADESCARGO],
			[_ychemlight,                  _countGRENADESCARGO],
			[_wchemlight,                  _countGRENADESCARGO],
			[_ochemlight,                  _countGRENADESCARGO],
			[_irchemlight,                 _countGRENADESCARGO],
			[_wsmoke,                      _countGRENADESCARGO],
			[_rsmoke,                      _countGRENADESCARGO],
			[_gsmoke,                      _countGRENADESCARGO],
			[_ySMOKE,                      _countGRENADESCARGO],
			[_pSMOKE,                      _countGRENADESCARGO],
			[_bSMOKE,                      _countGRENADESCARGO],
			[_oSMOKE,                      _countGRENADESCARGO]
		];

		if (!_isCommonATDisposable) then {
			_supplies pushBack [_commonAT select RAMMO, _countCommonATCARGO];
		};

		if (!_isSpecATDisposable) then {
			_supplies pushBack [_specAT select RAMMO, _countSpecATCARGO];
		};

		if (!isNil "_reconRIFLE") then {
			_supplies pushBack [_reconRIFLE select RAMMO, _countRifleCARGO];
		};

		if (!isNil "_rifleLIST") then {
			{
				if (_x select GUN != _commonRIFLE select GUN) then {
					_supplies pushBack [_x select RAMMO, _countRifleCARGO];
				};
			} forEach _rifleLIST;
		};

		if (!isNil "_rifleGLList") then {
			{
				if (_x select GUN != _commonRIFLEGL select GUN) then {
					_supplies append [
						[_x select GL, _count40mmCARGO],
						[_x select RAMMO, _countRifleCARGO]
					];
				};
			} forEach _rifleGLList;
		};

		if (!isNil "_arLIST") then {
			{
				if (_x select GUN != _commonAR select GUN) then {
					_supplies pushBack [_x select RAMMO, _countARCARGO];
				};
			} forEach _arLIST;
		};

		if (!isNil "_smgLIST") then {
			{
				if (_x select GUN != _commonSMG select GUN) then {
					_supplies pushBack [_x select RAMMO, _countRifleCARGO];
				};
			} forEach _smgLIST;
		};

		if (_x == "ammo_big") then {
			_supplies apply { [_x select 0, (_x select 1) * 3] };
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "at": {
		private _supplies = [
			[_specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCARGO],
			[_weaponsAT select RAMMO, _countWeaponsATCARGO],
			[_weaponsAA select RAMMO, _countWeaponsAACARGO],
			[_commonAT select ([RAMMO, GUN] select _isCommonATDisposable), _countCommonATCARGO]
		];

		if (_specAT select GUN == _SMAW select GUN) then {
			_supplies pushBack ["rhs_mag_smaw_SR", 25];
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "explosives": {
		[_object,
			["DemoCharge_Remote_Mag",    10],
			["SatchelCharge_Remote_Mag", 10]
		] call BRM_FMK_fnc_addItems;
	};

	case "mines": {
		[_object,
			["APERSTripMine_Wire_Mag",             25],
			["ClaymoreDirectionalMine_Remote_Mag", 25]
		] call BRM_FMK_fnc_addItems;
	};

	case "handcuffs": {
		[_object, _cableTie, 25] call BRM_FMK_fnc_addItem;
	};

	case "radio": {
		[_object, "SR", _factionSide, 20] call BRM_FMK_fnc_addRadioToCargo;
		[_object, "LR", _factionSide, 10] call BRM_FMK_fnc_addRadioToCargo;
		[_object, "BP", _factionSide, 5] call BRM_FMK_fnc_addRadioToCargo;
	};

	case "parachutes": {
		[_object, _parachute, 20] call BRM_FMK_fnc_addItem;
	};

	case "rifle_grenades": {
		[_object,
			["R3F_APAV40", 40],
			["R3F_AC58",   40],
			["R3F_FUM40",  40]
		] call BRM_FMK_fnc_addItems;
	};

	case "rpg7_ammo": {
		[_object,
			[_RPGV, _countSpecATCARGO],
			[_RPGVL, _countSpecATCARGO],
			[_RPGVOGV, _countSpecATCARGO],
			[_RPGVM, _countSpecATCARGO],
			[_RPGVMHEAT, _countSpecATCARGO],
			[_RPGVR, _countSpecATCARGO],
			[_RPGVS, _countSpecATCARGO],
			[_RPGVS, _countSpecATCARGO],
			[_RGPTBG, _countSpecATCARGO],
			[_RPGTYPE69, _countSpecATCARGO]
		] call BRM_FMK_fnc_addItems;
	};

	case "Type06_ammo": {
		[_object,
			["BRM_Type06_HE", _count40mmCARGO],
			["BRM_Type06_HEAT", _count40mmCARGO],
			["BRM_Type06_SMK_W", _count40mmCARGO],
			["BRM_Type06_SMK_G", _count40mmCARGO],
			["BRM_Type06_SMK_R", _count40mmCARGO],
			["BRM_Type06_SMK_P", _count40mmCARGO],
			["BRM_Type06_FLR_W", _count40mmCARGO],
			["BRM_Type06_FLR_G", _count40mmCARGO],
			["BRM_Type06_FLR_R", _count40mmCARGO]
		] call BRM_FMK_fnc_addItems;
	};

	case "rifle": { [_object, _commonRIFLE select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "riflegl": { [_object, [_commonRIFLEGL select RAMMO, _countRifleCARGO], [_commonRIFLEGL select GL, _count40mmCARGO]] call BRM_FMK_fnc_addItems; };
	case "pistol": { [_object, _commonPISTOL select RAMMO, _countPistolCARGO] call BRM_FMK_fnc_addItem; };
	case "ar": { [_object, _commonAR select RAMMO, _countARCARGO] call BRM_FMK_fnc_addItem; };
	case "mg": { [_object, _commonMG select RAMMO, _countMGCARGO] call BRM_FMK_fnc_addItem; };
	case "marksman": { [_object, _commonMARKSMAN select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "sniper": { [_object, _commonSNIPER select RAMMO, _countSNIPERCARGO] call BRM_FMK_fnc_addItem; };
	case "smg": { [_object, _commonSMG select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "lat": { [_object, _commonAT select ([RAMMO, GUN] select _isCommonATDisposable), _countCommonATCARGO] call BRM_FMK_fnc_addItem; };
	case "mat": { [_object, _specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCARGO] call BRM_FMK_fnc_addItem; };
	case "hat": { [_object, _weaponsAT select RAMMO, _countWeaponsATCARGO] call BRM_FMK_fnc_addItem; };
	case "haa": { [_object, _weaponsAA select RAMMO, _countWeaponsAACARGO] call BRM_FMK_fnc_addItem; };
	case "rifle_recon": { [_object, _reconRIFLE select RAMMO, _countRifleCARGO] call BRM_FMK_fnc_addItem; };
	case "gl": { [_object, _commonGL select RAMMO, _count40mmCARGO] call BRM_FMK_fnc_addItem; };

	case "grenade": { [_object, _grenade, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "flashbang": { [_object, _flashbang, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "incendiary": { [_object, _INCENDIARY, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };

	case "wflare": { [_object, _wFLARE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "rflare": { [_object, _rFLARE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "gflare": { [_object, _gFLARE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "yflare": { [_object, _yFLARE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };

	case "chemlight": { [_object,
		[_rchemlight, _countGRENADESCARGO],
		[_gchemlight, _countGRENADESCARGO],
		[_bchemlight, _countGRENADESCARGO],
		[_ychemlight, _countGRENADESCARGO],
		[_wchemlight, _countGRENADESCARGO],
		[_ochemlight, _countGRENADESCARGO],
		[_irchemlight, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};
	case "chemlight_red": { [_object, _rchemlight, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_green": { [_object, _gchemlight, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_blue": { [_object, _bchemlight, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_yellow": { [_object, _ychemlight, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_white": { [_object, _wchemlight, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_orange": { [_object, _ochemlight, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };

	case "chemlight_hi": { [_object,
		[_rChemlightHi, _countGRENADESCARGO],
		[_gChemlightHi, _countGRENADESCARGO],
		[_bChemlightHi, _countGRENADESCARGO],
		[_yChemlightHi, _countGRENADESCARGO],
		[_wChemlightHi, _countGRENADESCARGO],
		[_oChemlightHi, _countGRENADESCARGO],
		[_oChemlightHiU, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};
	case "chemlight_red_hi": { [_object, _rChemlightHi, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_green_hi": { [_object, _gChemlightHi, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_blue_hi": { [_object, _bChemlightHi, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_yellow_hi": { [_object, _yChemlightHi, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_white_hi": { [_object, _wChemlightHi, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_orange_hi": { [_object, _oChemlightHi, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "chemlight_orange_uhi": { [_object, _oChemlightHiU, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };

	case "smoke": { [_object,
		[_wsmoke, _countGRENADESCARGO],
		[_rsmoke, _countGRENADESCARGO],
		[_gsmoke, _countGRENADESCARGO],
		[_ySMOKE, _countGRENADESCARGO],
		[_pSMOKE, _countGRENADESCARGO],
		[_bSMOKE, _countGRENADESCARGO],
		[_oSMOKE, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};
	case "smoke_white": { [_object, _wsmoke, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "smoke_red": { [_object, _rsmoke, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "smoke_green": { [_object, _gsmoke, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "smoke_yellow": { [_object, _ySMOKE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "smoke_purple": { [_object, _pSMOKE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "smoke_blue": { [_object, _bSMOKE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "smoke_orange": { [_object, _oSMOKE, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };

	case "bandage": {
		private _supplies = [];
		if (mission_ACE3_enabled) then {
			if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
				_supplies pushBack [_bandage, _countBandageCARGO];
			} else { // Enabled
				_supplies append [
					[_fieldDressing,  _countBandageCARGO],
					[_packingBandage, _countBandageCARGO],
					[_elasticBandage, _countBandageCARGO],
					[_quickClot,      _countBandageCARGO]
				];
			};
		} else {
			_supplies pushBack ["FirstAidKit", _countBandageCARGO];
		};
		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "tourniquet": { [_object, _tourniquet, _countTourniquetCARGO] call BRM_FMK_fnc_addItem; };
	case "splint": { if (missionNamespace getVariable ["ace_medical_fractures", 0] > 0) then { [_object, _splint, _countSplintCARGO] call BRM_FMK_fnc_addItem; }; };

	case "morphine": { [_object, _morphine, _countMorphineCARGO] call BRM_FMK_fnc_addItem; };
	case "epinephrine";
	case "epi": { [_object, _epi, _countEpiCARGO] call BRM_FMK_fnc_addItem; };

	case "blood": { [_object, [_blood250, _countBloodbagCARGO], [_blood500, _countBloodbagCARGO], [_blood1000, _countBloodbagCARGO]] call BRM_FMK_fnc_addItems; };
	case "blood250": { [_object, _blood250, _countBloodbagCARGO] call BRM_FMK_fnc_addItem; };
	case "blood500": { [_object, _blood500, _countBloodbagCARGO] call BRM_FMK_fnc_addItem; };
	case "blood1000": { [_object, _blood1000, _countBloodbagCARGO] call BRM_FMK_fnc_addItem; };

	case "personalaidkit";
	case "pak": { [_object, _personalAidKit, _countPAKCARGO] call BRM_FMK_fnc_addItem; };

	case "toolkit": { [_object, _toolKit, 5] call BRM_FMK_fnc_addItem; };
	case "minedetector": { [_object, _mineDetector, 5] call BRM_FMK_fnc_addItem; };
	case "sparebarrel": { [_object, _spareBarrel, 5] call BRM_FMK_fnc_addItem; };
	case "irstrobe": { [_object, _IRStrobe, _countGRENADESCARGO] call BRM_FMK_fnc_addItem; };
	case "flashlight": { [_object, _flashlight, 5] call BRM_FMK_fnc_addItem; };
	case "clacker": { [_object, _clacker, 5] call BRM_FMK_fnc_addItem; };
	case "m26clacker": { [_object, _M26clacker, 5] call BRM_FMK_fnc_addItem; };
	case "defusalkit": { [_object, _defusalKit, 5] call BRM_FMK_fnc_addItem; };
	case "deadmanswitch": { [_object, _deadManSwitch, 5] call BRM_FMK_fnc_addItem; };
	case "cellphone": { [_object, _cellphone, 5] call BRM_FMK_fnc_addItem; };
	case "earplugs": { if (missionNamespace getVariable ["ace_hearing_enableCombatDeafness", 0]) then { [_object, _earPlugs, 10] call BRM_FMK_fnc_addItem; }; };
	case "microdagr": { [_object, _microDAGR, 5] call BRM_FMK_fnc_addItem; };
	case "maptools": { [_object, _mapTools, 5] call BRM_FMK_fnc_addItem; };
	case "uavbattery": { [_object, _uavBattery, 5] call BRM_FMK_fnc_addItem; };
	case "kestrel": { [_object, _kestrel, 5] call BRM_FMK_fnc_addItem; };
	case "rangetables": { [_object,
		[_rangeCard, 5],
		[_mortarTable, 5],
		[_artilleryTable, 5]] call BRM_FMK_fnc_addItems;
	};
	case "rangecard": { [_object, _rangeCard, 5] call BRM_FMK_fnc_addItem; };
	case "mortartable": { [_object, _mortarTable, 5] call BRM_FMK_fnc_addItem; };
	case "artillerytable": { [_object, _artilleryTable, 5] call BRM_FMK_fnc_addItem; };
	case "spottingscope": { [_object, _spottingScope, 5] call BRM_FMK_fnc_addItem; };
	case "atragmx": { [_object, _ATragMX, 5] call BRM_FMK_fnc_addItem; };
	case "entrenchingtool": { [_object, _entrenchingTool, 30] call BRM_FMK_fnc_addItem; };
	case "wirecutter": { [_object, _wirecutter, 30] call BRM_FMK_fnc_addItem; };
	case "banana": { [_object, _banana, 100] call BRM_FMK_fnc_addItem; };
	case "huntirmonitor": { [_object, _huntIRMonitor, 5] call BRM_FMK_fnc_addItem; };
	case "huntirm203": { [_object, _huntIRM203, 50] call BRM_FMK_fnc_addItem; };
	case "sandbag": { [_object, _sandbag, 50] call BRM_FMK_fnc_addItem; };
	case "tacticalladder": { [_object, _tacticalLadder, 5] call BRM_FMK_fnc_addItem; };
	case "spraypaintblack": { [_object, _spraypaintBlack, 10] call BRM_FMK_fnc_addItem; };
	case "spraypaintblue": { [_object, _spraypaintBlue, 10] call BRM_FMK_fnc_addItem; };
	case "spraypaintgreen": { [_object, _spraypaintGreen, 10] call BRM_FMK_fnc_addItem; };
	case "spraypaintred": { [_object, _spraypaintRed, 10] call BRM_FMK_fnc_addItem; };
	case "spraypaintwhite": { [_object, _spraypaintWhite, 10] call BRM_FMK_fnc_addItem; };
	case "spraypaintyellow": { [_object, _spraypaintYellow, 10] call BRM_FMK_fnc_addItem; };
	case "chemlightShield": { [_object, _chemlightShield, 30] call BRM_FMK_fnc_addItem; };
	case "fortifyTool": { [_object, _fortifyTool, 30] call BRM_FMK_fnc_addItem; };
	case "plottingBoard": { [_object, _plottingBoard, 10] call BRM_FMK_fnc_addItem; };
	case "markerflagblack": { [_object, _markerFlagBlack, 50] call BRM_FMK_fnc_addItem; };
	case "markerflagblue": { [_object, _markerFlagBlue, 50] call BRM_FMK_fnc_addItem; };
	case "markerflaggreen": { [_object, _markerFlagGreen, 50] call BRM_FMK_fnc_addItem; };
	case "markerflagorange": { [_object, _markerFlagOrange, 50] call BRM_FMK_fnc_addItem; };
	case "markerflagpurple": { [_object, _markerFlagPurple, 50] call BRM_FMK_fnc_addItem; };
	case "markerflagred": { [_object, _markerFlagRed, 50] call BRM_FMK_fnc_addItem; };
	case "markerflagwhite": { [_object, _markerFlagWhite, 50] call BRM_FMK_fnc_addItem; };
	case "markerflagyellow": { [_object, _markerFlagYellow, 50] call BRM_FMK_fnc_addItem; };
	case "rope3": { [_object, _rope3, 10] call BRM_FMK_fnc_addItem; };
	case "rope6": { [_object, _rope6, 10] call BRM_FMK_fnc_addItem; };
	case "rope12": { [_object, _rope12, 10] call BRM_FMK_fnc_addItem; };
	case "rope15": { [_object, _rope15, 10] call BRM_FMK_fnc_addItem; };
	case "rope18": { [_object, _rope18, 10] call BRM_FMK_fnc_addItem; };
	case "rope27": { [_object, _rope27, 10] call BRM_FMK_fnc_addItem; };
	case "rope36": { [_object, _rope36, 10] call BRM_FMK_fnc_addItem; };
	case "painkillers": { [_object, _painkillers, _countMorphineCARGO] call BRM_FMK_fnc_addItem; };
	case "surgkit": { [_object, _surgKit, 5] call BRM_FMK_fnc_addItem; };
	case "suture": { [_object, _suture, 50] call BRM_FMK_fnc_addItem; };
	case "bodybag": { [_object, _bodyBag, 30] call BRM_FMK_fnc_addItem; };
	case "bodybagblue": { [_object, _bodyBagBlue, 30] call BRM_FMK_fnc_addItem; };
	case "bodybagwhite": { [_object, _bodyBagWhite, 30] call BRM_FMK_fnc_addItem; };

	case "contraband": { [_object,
		[_matches, 30],
		[_lighter, 30],
		[_cigpack, 50],
		[_cigar, 50],
		[_poppack, 50]] call BRM_FMK_fnc_addItems;
	};
	case "matches": { [_object, _matches, 30] call BRM_FMK_fnc_addItem; };
	case "lighter": { [_object, _lighter, 30] call BRM_FMK_fnc_addItem; };
	case "cigpack": { [_object, _cigpack, 50] call BRM_FMK_fnc_addItem; };
	case "cigars": { [_object, _cigar, 50] call BRM_FMK_fnc_addItem; };
	case "cigarettes": { [_object, _cigarette, 20] call BRM_FMK_fnc_addItem; };
	case "lollipoppack": { [_object, lollipopPack, 50] call BRM_FMK_fnc_addItem; };
	case "lollipops": { [_object, lollipop, 20] call BRM_FMK_fnc_addItem; };

	default {
		["Unknown cargo type: '%1' (%2)", _x, _type] call BIS_fnc_error;
	};
};
