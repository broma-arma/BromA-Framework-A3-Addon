/*
================================================================================

NAME:
    BRM_FMK_fnc_addMedicalSupplies

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Add medical supplies to the structure unit.

PARAMETERS:
    None

USAGE:
    call BRM_FMK_fnc_addMedicalSupplies;

RETURNS:
    Nothing

================================================================================
*/

private _isMedic = _isLifeSaver || _isReconMedic;

private _uniform = [];
if (mission_ACE3_enabled) then {
	_uniform append (if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
		[[_bandage, _countBandage]]
	} else { // Enabled
		if (_isMedic) then {
			[[_elasticBandage, _countBandage * 1.25]]
		} else {
			[[_packingBandage, _countBandage / 2], [_quickClot, _countBandage / 2], [_elasticBandage, _countBandage / 4]]
		}
	});

	_uniform append [
		[_tourniquet, _countTourniquet],
		[_morphine, _countMorphine / 2], [_painkillers, 1 max _countMorphine / 20],
		[_epinephrine, [_countEpi / 2, _countEpi] select (mission_KAT_enabled && _isMedic)]
	];

	if (ace_medical_fractures > 0) then {
		_uniform pushBack [_splint, _countSplint];
	};

	if (mission_KAT_enabled) then {
		_uniform append [
			["kat_chestSeal", _countBandage / 6],
			["kat_Carbonate", 1]
		];

		["kat_breathing_pulseoxLocal", [_unit, _unit, "rightarm"]] call CBA_fnc_localEvent; // kat_Pulseoximeter

		if (kat_hypothermia_hypothermiaActive) then {
			_uniform pushBack ["kat_handWarmer", _countBandage / 4];
		};

		if (random 1 < 0.01) then {
			_uniform pushBack ["kat_Bubble_Wrap", 1];
		}
	};
} else {
	_uniform pushBack ["FirstAidKit", _countBandage / 4];
};
[_unit, _uniform] call BRM_FMK_fnc_addtoUniform;

private _backpack = [];
if (_isMedic) then {
	if (mission_ACE3_enabled) then {
		if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
			_backpack pushBack [_bandage, _countBandage];
		} else { // Enabled
			_backpack pushBack [_elasticBandage, _countBandage];
			if (!mission_KAT_enabled) then {
				_backpack pushBack [_quickClot, _countBandage];
			};
		};

		_backpack append [
			[_morphine, _countMorphine], [_epinephrine, _countEpi]
		];

		if (!mission_KAT_enabled) then {
			_backpack append [
				[_blood500, _countBloodbag / 2], [_blood1000, _countBloodbag]
			];
		};

		_backpack pushBack [_tourniquet, _countTourniquet * 2];

		if (!mission_KAT_enabled) then {
			if (ace_medical_treatment_advancedBandages == 2) then { // Can Reopen
				_backpack pushBack [_surgicalKit, [1, 5] select (ace_medical_treatment_consumeSurgicalKit == 1)];
				if (ace_medical_treatment_consumeSurgicalKit == 2) then {
					_backpack pushBack [_suture, 100];
				};
			};

			_backpack pushBack [_personalAidKit, [1, _countPAK * 2] select (ace_medical_treatment_consumePAK > 0)];
		} else {
			if (ace_medical_treatment_advancedBandages == 2 && ace_medical_treatment_consumeSurgicalKit == 2) then { // Can Reopen and consume Suture
				_backpack pushBack [_suture, 100];
			};
		};

		if (ace_medical_fractures > 0) then {
			_backpack pushBack [_splint, _countSplint * 2];
		};

		if (mission_KAT_enabled) then {
			_backpack append [
				["kat_MFAK", 1],
				["ACE_elasticBandage", _countBandage / 2],
				["ACE_epinephrine", _countEpi],
				[["kat_ncdKit", "kat_aatKit"] select kat_breathing_advPtxEnable, _countEpi]
			];

			if (kat_airway_enable) then {
				_backpack pushBack ["kat_larynx", [_countEpi, 1] select kat_airway_ReusableAirwayItems];
			};

			_backpack append [
				["kat_Carbonate", _countMorphine * 2 / 10],
				["kat_fentanyl", _countMorphine / 2],
				["kat_EACA", _countMorphine],
				["kat_TXA", _countMorphine],
				["kat_naloxone", _countMorphine],
				["kat_nitroglycerin", _countEpi],
				["kat_phenylephrineAuto", _countMorphine],
				["kat_chestSeal", _countBandage * 0.6],
				["kat_IV_16", [_countEpi * 2, _countEpi] select kat_pharma_IVreuse],
				["kat_IO_FAST", [_countEpi, _countEpi / 2] select kat_pharma_IVreuse],
				["kat_epinephrineIV", _countEpi],
				["kat_Painkiller", _countMorphine],
				["kat_bloodIV_O_N", _countBloodbag],
				["ACE_salineIV", _countBloodbag]
			];

			if (kat_hypothermia_hypothermiaActive) then {
				_backpack pushBack ["kat_fluidWarmer", _countEpi];
			};

			_backpack append [
				["kat_AFAK", 1],
				["ACE_plasmaIV", _countBloodbag]
			];
		};
	} else {
		_backpack = [["FirstAidKit", _countBandage], ["Medikit", parseNumber (_countPAK > 0)]];
	};
} else {
	if (mission_KAT_enabled) then {
		_backpack pushBack ["kat_IFAK", 1];
	};

	if (ace_medical_treatment_consumePAK > 0) then {
		_backpack pushBack [_personalAidKit, _countPAK];
	};
};

[_unit, _backpack] call BRM_FMK_fnc_addtoBackpack;
