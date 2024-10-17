// File is included in BRM_FMK_fnc_setVehiclesArray
// Executed after faction mod and before faction structure.

if (isNil "_factionSide") then { _factionSide = [_faction, _defaultSide] call BRM_FMK_fnc_getFactionInfo select 1; };

private _sideChar = switch (_factionSide) do {
	case WEST: { "B" };
	case EAST: { "O" };
	case RESISTANCE: { "I" };
	default { "B" };
};

_uavBag = switch (toLower _uavBag) do {
	case "auto"; // Backward compatibility
	case "vanilla";
	case "ar2": { _sideChar + "_UAV_01_backpack_F" }; // UAV Bag (AR-2)
	case "al6": { _sideChar + "_UAV_06_backpack_F" }; // UAV Bag (AL-6)
	case "al6med": { _sideChar + "_UAV_06_medical_backpack_F" }; // UAV Bag (AL-6, Medical)
	default { _uavBag };
};

_uavTerminal = switch (toLower _uavTerminal) do {
	case "auto"; // Backward compatibility
	case "vanilla": { _sideChar + "_uavTerminal" };
	default { _uavTerminal };
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
if (isNil "_countARCargo") then { _countARCargo = _countAR * 4; };

if (isNil "_countSpecAT") then { _countSpecAT = if (isNil "_countAT") then { 3 } else { _countAT }; };
if (isNil "_countSpecHE") then { _countSpecHE = if (isNil "_countHE") then { 1 } else { _countHE }; };

if (isNil "_countSpecATCargo") then { _countSpecATCargo = if (isNil "_countATCargo") then { 15 } else { _countATCargo }; };
if (isNil "_countSpecHECargo") then { _countSpecHECargo = _countSpecATCargo; };
if (isNil "_countCommonATCargo") then { _countCommonATCargo = _countSpecATCargo; };

if (isNil "_countWeaponsAT") then { _countWeaponsAT = _countSpecAT; };
if (isNil "_countWeaponsATCargo") then { _countWeaponsATCargo = _countSpecATCargo; };

if (isNil "_countWeaponsAA") then { _countWeaponsAA = _countSpecAT; };
if (isNil "_countWeaponsAACargo") then { _countWeaponsAACargo = _countSpecATCargo; };

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
if (isNil "_countTourniquetCargo") then { _countTourniquetCargo = _countTourniquet * 10; };
if (isNil "_countSplint") then { _countSplint = 4; };
if (isNil "_countSplintCargo") then { _countSplintCargo = _countSplint * 10; };

if (isNil "_commonEOT") then { _commonEOT = _commonCCO; };
if (isNil "_rifleScope") then { _rifleScope = ""; };
if (isNil "_reconRifle") then { _reconRifle = _commonRifle; };
if (isNil "_reconScope") then { _reconScope = _commonRCO; };
if (isNil "_sniperScope") then { _sniperScope = if (isNil "_commonMagnified") then { "" } else { _commonMagnified }; };
if (isNil "_marksmanScope") then { _marksmanScope = _sniperScope; };
if (isNil "_mgScope") then { _mgScope = ""; };
if (isNil "_arScope") then { _arScope = _mgScope; };
if (isNil "_specATScope") then { _specATScope = ""; };
if (isNil "_weaponsATScope") then { _weaponsATScope = ["", _specATScope] select (_weaponsAT select /*GUN*/0 == _specAT select /*GUN*/0); };
if (isNil "_specATBackpack") then { _specATBackpack = _bigBackpack; };
if (isNil "_medicalBackpack") then { _medicalBackpack = _bigBackpack; };
if (isNil "_reconBackpack") then { _reconBackpack = _commonBackpack; };
if (isNil "_commonRail") then { _commonRail = ""; };
if (isNil "_commonBipod") then { _commonBipod = ""; };

if (isNil "_binocular") then { _binocular = [_binoc, "Binocular"] select isNil "_binoc"; };
if (isNil "_rangefinder") then { _rangefinder = "Rangefinder"; };
if (isNil "_laserdesignator") then { _laserdesignator = "Laserdesignator"; };

if (isNil "_nightOnlyNVGs") then { _nightOnlyNVGs = false; };
if (isNil "_aiBackpackRadios") then { _aiBackpackRadios = false; };
if (!_aiBackpackRadios && _assignLoadoutMode) then { _aiBackpackRadios = isPlayer _unit; };
