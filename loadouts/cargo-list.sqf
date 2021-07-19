switch (_x) do {
	case "medical": {
		private _supplies = [];

		if (mission_ACE3_enabled) then {
			_supplies append [
				[_earPlugs,        25],
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

		if (_x == "ammo_big") then {
			_supplies apply { [_x select 0, (_x select 1) * 3] };
		};

		[_object] + _supplies call BRM_FMK_fnc_addItems;
	};

	case "at": {
		[_object,
			[_specAT select ([RAMMO, GUN] select _isSpecATDisposable), _countSpecATCARGO],
			[_weaponsAT select RAMMO, _countWeaponsATCARGO],
			[_weaponsAA select RAMMO, _countWeaponsAACARGO],
			[_commonAT select GUN,    _countATCARGO]
		] call BRM_FMK_fnc_addItems;
		[[_object, "item",
                        ["rhs_weap_optic_smaw",20]
                ]] call BRM_FMK_fnc_addtoCargo;
                [[_object, "magazine",
	                ["rhs_mag_smaw_SR",100]
                ]] call BRM_FMK_fnc_addtoCargo;
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

	default {
		["Unknown cargo type: '%1' (%2)", _x, _type] call BIS_fnc_error;
	};
};
