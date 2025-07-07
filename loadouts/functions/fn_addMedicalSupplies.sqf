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

private _supplies = [];

if (mission_ACE3_enabled) then {
	_supplies = if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
		[[_bandage, _countBandage]]
	} else { // Enabled
		if (_isMedic) then {
			[[_elasticBandage, _countBandage]]
		} else {
			[[_packingBandage, _countBandage / 2], [_quickClot, _countBandage / 2], [_elasticBandage, _countBandage / 4]]
		}
	};

	_supplies append [
		[_tourniquet, _countTourniquet],
		[_morphine, _countMorphine / 2], [_painkillers, 1 max _countMorphine / 20], [_epinephrine, _countEpi / 2]
	];

	if (ace_medical_fractures > 0) then {
		_supplies pushBack [_splint, _countSplint];
	};
} else {
	_supplies = [["FirstAidKit", _countBandage / 4]];
};

[_unit, _supplies] call BRM_FMK_fnc_addtoUniform;
if (ace_medical_treatment_consumePAK > 0) then {
	[_unit, [[_personalAidKit, _countPAK]]] call BRM_FMK_fnc_addtoBackpack;
};

if (_isMedic) then {
	_supplies = [];

	if (mission_ACE3_enabled) then {
		_supplies = if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
			[[_bandage, _countBandage]]
		} else { // Enabled
			[
				[_elasticBandage, _countBandage],
				[_quickClot, _countBandage]
			]
		};

		_supplies append [
			[_morphine, _countMorphine], [_epinephrine, _countEpi],
			[_blood500, _countBloodbag / 2], [_blood1000, _countBloodbag],
			[_tourniquet, _countTourniquet * 2]
		];

		if (ace_medical_treatment_advancedBandages == 2) then { // Can Reopen
			_supplies pushBack [_surgicalKit, [1, 5] select (ace_medical_treatment_consumeSurgicalKit == 1)];
			if (ace_medical_treatment_consumeSurgicalKit == 2) then {
				_supplies pushBack [_suture, 100];
			};
		};

		_supplies pushBack [_personalAidKit, [1, _countPAK * 2] select (ace_medical_treatment_consumePAK > 0)];

		if (ace_medical_fractures > 0) then {
			_supplies pushBack [_splint, _countSplint * 2];
		};
	} else {
		_supplies = [["FirstAidKit", _countBandage], ["Medikit", parseNumber (_countPAK > 0)]];
	};
	[_unit, _supplies] call BRM_FMK_fnc_addtoBackpack;
};
