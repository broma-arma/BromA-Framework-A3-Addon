if (mission_ACE3_enabled) then {
	if (ace_medical_treatment_advancedBandages == 0) then { // Disabled
		_suppliesMedic = [
			[_bandage, _countBandage],
			[_morphine, _countMorphine],
			[_epi, _countEpi],
			[_blood500, _countBloodbag], [_blood1000, _countBloodbag],
			[_tourniquet, _countTourniquet * 2]
		];
		_suppliesNormal = [
			[_bandage, _countBandage / 4],
			[_morphine, _countMorphine / 4],
			[_epi, _countEpi / 4],
			[_tourniquet, _countTourniquet]
		];
	} else { // Enabled
		_suppliesMedic = [
			[_elasticBandage, _countBandage], [_quickClot, _countBandage],
			[_tourniquet, _countTourniquet * 2],
			[_morphine, _countMorphine], [_epi, _countEpi]
		];
		_suppliesNormal = [
			[_packingBandage, _countBandage / 4], [_quickClot, _countBandage / 4], [_elasticBandage, _countBandage / 4],
			[_tourniquet, _countTourniquet],
			[_morphine, _countMorphine / 4], [_epi, _countEpi / 4]
		];

		if (ace_medical_treatment_advancedBandages == 2) then { // Can Reopen
			_suppliesMedic pushBack [_surgKit, 1];
		};

		_suppliesMedic append [
			[_personalAidKit, _countPAK],
			[_blood500, _countBloodbag], [_blood1000, _countBloodbag]
		];
	};

	if (ace_medical_fractures > 0) then {
		_suppliesMedic pushBack [_splint, _countSplint * 2];
		_suppliesNormal pushBack [_splint, _countSplint];
	};
} else {
	_suppliesMedic = [["FirstAidKit", _countBandage], ["Medikit", _countPAK]];
	_suppliesNormal = [["FirstAidKit", _countBandage / 4]];
};
