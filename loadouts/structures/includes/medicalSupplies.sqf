// DEPRECATED: use BRM_FMK_fnc_addMedicalSupplies
if (mission_ACE3_enabled) then {
	if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
		_suppliesNormal = [[_bandage, _countBandage]];
		_suppliesMedic = [[_bandage, _countBandage]];
	} else { // Enabled
		_suppliesNormal = if (_isLifeSaver || _isReconMedic) then {
			[[_elasticBandage, _countBandage]]
		} else {
			[[_packingBandage, _countBandage / 2], [_quickClot, _countBandage / 2], [_elasticBandage, _countBandage / 4]]
		};
		_suppliesMedic = [
			[_elasticBandage, _countBandage], [_quickClot, _countBandage]
		];
	};

	_suppliesNormal append [
		[_morphine, _countMorphine / 2], [_painkillers, 1 max _countMorphine / 20], [_epinephrine, _countEpi / 2],
		[_tourniquet, _countTourniquet]
	];
	_suppliesMedic append [
		[_morphine, _countMorphine], [_epinephrine, _countEpi],
		[_blood500, _countBloodbag / 2], [_blood1000, _countBloodbag],
		[_tourniquet, _countTourniquet * 2]
	];

	if (ace_medical_treatment_advancedBandages == 2) then { // Can Reopen
		_suppliesMedic pushBack [_surgicalKit, [1, 5] select (ace_medical_treatment_consumeSurgicalKit == 1)];
		if (ace_medical_treatment_consumeSurgicalKit == 2) then {
			_suppliesMedic pushBack [_suture, 100];
		};
	};

	_suppliesMedic pushBack [_personalAidKit, [1, _countPAK * 2] select (ace_medical_treatment_consumePAK > 0)];

	if (ace_medical_fractures > 0) then {
		_suppliesNormal pushBack [_splint, _countSplint];
		_suppliesMedic pushBack [_splint, _countSplint * 2];
	};
} else {
	_suppliesNormal = [["FirstAidKit", _countBandage / 4]];
	_suppliesMedic = [["FirstAidKit", _countBandage], ["Medikit", _countPAK]];
};
