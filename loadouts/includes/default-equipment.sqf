// File is included in BRM_FMK_fnc_setVehiclesArray
// Executed after faction mod and before faction structure.

if (isNil "_factionSide") then { _factionSide = [_faction, _defaultSide] call BRM_FMK_fnc_getFactionInfo select 1; };

private _sideChar = switch (_factionSide) do {
	case WEST: { "B" };
	case EAST: { "O" };
	case RESISTANCE: { "I" };
	default { "B" };
};

_UAVBag = switch (toLower _UAVBag) do {
	case "auto"; // Backward compatibility
	case "vanilla";
	case "ar2": { _sideChar + "_UAV_01_backpack_F" }; // UAV Bag (AR-2)
	case "al6": { _sideChar + "_UAV_06_backpack_F" }; // UAV Bag (AL-6)
	case "al6med": { _sideChar + "_UAV_06_medical_backpack_F" }; // UAV Bag (AL-6, Medical)
	default { _UAVBag };
};

_UAVTerminal = switch (toLower _UAVTerminal) do {
	case "auto"; // Backward compatibility
	case "vanilla": { _sideChar + "_UavTerminal" };
	default { _UAVTerminal };
};

if (isNil "_weaponsAT") then {
	_weaponsAT = [format ["launch_%1_Titan_short_F", _sideChar], "Titan_AT"];

	if (_factionSide != EAST && isClass (configFile >> "CfgPatches" >> "rhsusf_main")) then { // RHS USAF
		_weaponsAT = _JAVELIN;
	};
};
if (isNil "_weaponsAA") then {
	_weaponsAA = [format ["launch_%1_Titan_F", _sideChar], "Titan_AA"];

	if (_factionSide == EAST) then {
		if (isClass (configFile >> "CfgPatches" >> "rhs_main")) then { // RHS AFRF
			_weaponsAA = _IGLA;
		};
	} else {
		if (isClass (configFile >> "CfgPatches" >> "rhsusf_main")) then { // RHS USAF
			_weaponsAA = _STINGER;
		};
	};
};

if (isNil "_commonAR") then { _commonAR = _commonMG; };
if (isNil "_countAR") then { _countAR = _countMG; };
if (isNil "_countArCARGO") then { _countArCARGO = _countAR * 4; };

if (isNil "_countSpecAT") then { _countSpecAT = if (isNil "_countAT") then { 3 } else { _countAT }; };
if (isNil "_countSpecHE") then { _countSpecHE = if (isNil "_countHE") then { 1 } else { _countHE }; };

if (isNil "_countSpecATCARGO") then { _countSpecATCARGO = if (isNil "_countATCARGO") then { 15 } else { _countATCARGO }; };
if (isNil "_countSpecHECARGO") then { _countSpecHECARGO = _countSpecATCARGO; };
if (isNil "_countCommonATCARGO") then { _countCommonATCARGO = _countSpecATCARGO; };

if (isNil "_countWeaponsAT") then { _countWeaponsAT = _countSpecAT; };
if (isNil "_countWeaponsATCARGO") then { _countWeaponsATCARGO = _countSpecATCARGO; };

if (isNil "_countWeaponsAA") then { _countWeaponsAA = _countSpecAT; };
if (isNil "_countWeaponsAACARGO") then { _countWeaponsAACARGO = _countSpecATCARGO; };

if (isNil "_isCommonATDisposable") then {
	if (_commonAT isEqualTo "") then {
		_isCommonATDisposable = true;
	} else {
		_isCommonATDisposable = _commonAT select /*GUN*/0 call BRM_FMK_fnc_isDisposableLauncher;
	}
};
if (_isCommonATDisposable) then {
	_commonAT set [1, ""];
};

if (isNil "_isSpecATDisposable") then {
	if (_specAT isEqualTo "") then {
		_isSpecATDisposable = true;
	} else {
		_isSpecATDisposable = _specAT select /*GUN*/0 call BRM_FMK_fnc_isDisposableLauncher;
	}
};
if (_isSpecATDisposable) then {
	_specAT set [1, ""];
};

if (isNil "_countTourniquet") then { _countTourniquet = if (isNil "_countCAT") then { 4 } else { _countCAT }; };
if (isNil "_countTourniquetCARGO") then { _countTourniquetCARGO = _countTourniquet * 10; };
if (isNil "_countSplint") then { _countSplint = 4; };
if (isNil "_countSplintCARGO") then { _countSplintCARGO = _countSplint * 10; };

if (isNil "_commonEOT") then { _commonEOT = _commonCCO; };
if (isNil "_rifleSCOPE") then { _rifleSCOPE = ""; };
if (isNil "_reconRIFLE") then { _reconRIFLE = _commonRIFLE; };
if (isNil "_reconSCOPE") then { _reconSCOPE = _commonRCO; };
if (isNil "_sniperSCOPE") then { _sniperSCOPE = if (isNil "_commonMAGNIFIED") then { "" } else { _commonMAGNIFIED }; };
if (isNil "_marksmanSCOPE") then { _marksmanSCOPE = _sniperSCOPE; };
if (isNil "_mgSCOPE") then { _mgSCOPE = ""; };
if (isNil "_arSCOPE") then { _arSCOPE = _mgSCOPE; };
if (isNil "_specATSCOPE") then { _specATSCOPE = ""; };
if (isNil "_weaponsATSCOPE") then { _weaponsATScope = ["", _specATSCOPE] select (_weaponsAT select /*GUN*/0 == _specAT select /*GUN*/0); };
if (isNil "_specATBACKPACK") then { _specATBACKPACK = _bigBACKPACK; };
if (isNil "_medicalBACKPACK") then { _medicalBACKPACK = _bigBACKPACK; };
if (isNil "_reconBACKPACK") then { _reconBACKPACK = _commonBACKPACK; };
if (isNil "_commonRAIL") then { _commonRAIL = ""; };
if (isNil "_commonBIPOD") then { _commonBIPOD = ""; };

if (isNil "_binocular") then { _binocular = [_binoc, "Binocular"] select isNil "_binoc"; };
if (isNil "_rangefinder") then { _rangefinder = "Rangefinder"; };
if (isNil "_laserdesignator") then { _laserdesignator = "Laserdesignator"; };

if (isNil "_nightOnlyNVGs") then { _nightOnlyNVGs = false; };
if (isNil "_aiBackpackRadios") then { _aiBackpackRadios = false; };
if (!_aiBackpackRadios && _assignLoadoutMode) then { _aiBackpackRadios = isPlayer _unit; };
