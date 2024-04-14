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
					_supplies pushBack [_surgKit, 5];
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
			[_bchemlight,                  25],
			[_rchemlight,                  25],
			[_gchemlight,                  25],
			[_wsmoke,                      25],
			[_rsmoke,                      25],
			[_gsmoke,                      25]
		];

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
			[_commonAT select GUN,    _countATCARGO]
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
		[_object,
			["ACE_CableTie", 25]
		] call BRM_FMK_fnc_addItems;
	};

	case "radio": {
		[_object, "SR", _factionSide, 20] call BRM_FMK_fnc_addRadioToCargo;
		[_object, "LR", _factionSide, 10] call BRM_FMK_fnc_addRadioToCargo;
		[_object, "BP", _factionSide, 5] call BRM_FMK_fnc_addRadioToCargo;
	};

	case "parachutes": {
		[_object,
			[_parachute, 20]
		] call BRM_FMK_fnc_addItems;
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
			[_RPGV, _countAT],
			[_RPGVL, _countAT],
			[_RPGVOGV, _countAT],
			[_RPGVM, _countAT],
			[_RPGVMHEAT, _countAT],
			[_RPGVR, _countAT],
			[_RPGVS, _countAT],
			[_RPGVS, _countAT],
			[_RGPTBG, _countAT],
			[_RPGTYPE69, _countAT]
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

	case "rifle": {
		[_object, [_commonRIFLE select RAMMO, _countRifleCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "riflegl": {
		[_object, [_commonRIFLEGL select RAMMO, _countRifleCARGO], [_commonRIFLEGL select GL, _count40mmCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "pistol": {
		[_object, [_commonPISTOL select RAMMO, _countPistolCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "ar": {
		[_object, [_commonAR select RAMMO, _countARCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "mg": {
		[_object, [_commonMG select RAMMO, _countMGCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "marksman": {
		[_object, [_commonMARKSMAN select RAMMO, _countRifleCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "sniper": {
		[_object, [_commonSNIPER select RAMMO, _countSNIPERCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "smg": {
		[_object, [_commonSMG select RAMMO, _countRifleCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "lat": {
		[_object, [_commonAT select GUN, _countATCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "mat": {
		[_object, [_specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "hat": {
		[_object, [_weaponsAT select RAMMO, _countWeaponsATCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "haa": {
		[_object, [_weaponsAA select RAMMO, _countWeaponsAACARGO]] call BRM_FMK_fnc_addItems;
	};

	case "rifle_recon": {
		[_object, [_reconRIFLE select RAMMO, _countRifleCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "gl": {
		[_object, [_commonGL select RAMMO, _count40mmCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "grenade": {
		[_object, [_grenade, _countGRENADESCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "chemlight": {
		[_object, [_bchemlight, 25], [_rchemlight, 25], [_gchemlight, 25]] call BRM_FMK_fnc_addItems;
	};

	case "chemlight_blue": {
		[_object, [_bchemlight, 25]] call BRM_FMK_fnc_addItems;
	};

	case "chemlight_red": {
		[_object, [_rchemlight, 25]] call BRM_FMK_fnc_addItems;
	};

	case "chemlight_green": {
		[_object, [_gchemlight, 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke": {
		[_object, [_wsmoke, 25], [_rsmoke, 25], [_gsmoke, 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_white": {
		[_object, [_wsmoke, 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_red": {
		[_object, [_rsmoke, 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_green": {
		[_object, [_gsmoke, 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_yellow": {
		[_object, ["SmokeShellYellow", 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_purple": {
		[_object, ["SmokeShellPurple", 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_blue": {
		[_object, ["SmokeShellBlue", 25]] call BRM_FMK_fnc_addItems;
	};

	case "smoke_orange": {
		[_object, ["SmokeShellOrange", 25]] call BRM_FMK_fnc_addItems;
	};

	case "bandage": {
		private _supplies = [];
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
		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "tourniquet": {
		[_object, [_tourniquet, _countTourniquetCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "splint": {
		if (ace_medical_fractures > 0) then {
			[_object, [_splint, _countSplintCARGO]] call BRM_FMK_fnc_addItems;
		};
	};

	case "morphine": {
		[_object, [_morphine, _countMorphineCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "epinephrine";
	case "epi": {
		[_object, [_epi, _countEpiCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "blood": {
		[_object, [_blood250, _countBloodbagCARGO], [_blood500, _countBloodbagCARGO], [_blood1000, _countBloodbagCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "blood250": {
		[_object, [_blood250, _countBloodbagCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "blood500": {
		[_object, [_blood500, _countBloodbagCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "blood1000": {
		[_object, [_blood1000, _countBloodbagCARGO]] call BRM_FMK_fnc_addItems;
	};

	case "personalaidkit";
	case "pak": {
		[_object, [_personalAidKit, _countPAKCARGO]] call BRM_FMK_fnc_addItems;
	};

	default {
		["Unknown cargo type: '%1' (%2)", _x, _type] call BIS_fnc_error;
	};
};
