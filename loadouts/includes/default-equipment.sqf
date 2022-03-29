// Executed after faction mod and before faction structure.

if (isNil "_factionSide") then { _factionSide = [_faction, _defaultSide] call BRM_FMK_fnc_getFaction select 1; };

private _sideChar = switch (_factionSide) do {
	case WEST: { "B" };
	case EAST: { "O" };
	case RESISTANCE: { "I" };
	default { "B" };
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

if (isNil "_countWeaponsAT") then { _countWeaponsAT = 2; };
if (isNil "_countWeaponsATCARGO") then { _countWeaponsATCARGO = _countWeaponsAT * 5; };

if (isNil "_countWeaponsAA") then { _countWeaponsAA = 2; };
if (isNil "_countWeaponsAACARGO") then { _countWeaponsAACARGO = _countWeaponsAA * 5; };

if (isNil "_countSpecATCARGO") then { _countSpecATCARGO = _countATCARGO; };

if (isNil "_isSpecATDisposable" && !isNil "_isATDisposable") then {
	_isSpecATDisposable = _isATDisposable;
};

if (isNil "_isSpecATDisposable" && _specAT isEqualTo "") then {
	_isSpecATDisposable = true;
};

if (isNil "_isSpecATDisposable") then {
	private _launcher = _specAT select /*GUN*/0;
	private _cfgLauncher = configFile >> "CfgWeapons" >> _launcher;
	_isSpecATDisposable = !isNil { cba_disposable_NormalLaunchers getVariable _launcher } // CBA
					|| { getText (_cfgLauncher >> "ace_UsedTube") != "" } // ACE
					|| { getNumber (_cfgLauncher >> "rhs_disposable") != 0 } // RHS
					|| { getText (_cfgLauncher >> "uk3cb_used_launcher") != "" }; // 3CB
};

if (_isSpecATDisposable) then {
	if (isNil "read_local_cargo" || { read_local_cargo }) then {
		_countSpecATCARGO = 0;
	};
};

if (isNil "_countTourniquet") then { _countTourniquet = if (isNil "_countCAT") then { 4 } else { _countCAT }; };
if (isNil "_countTourniquetCARGO") then { _countTourniquetCARGO = _countTourniquet * 10; };
if (isNil "_countSplint") then { _countSplint = 4; };
if (isNil "_countSplintCARGO") then { _countSplintCARGO = _countSplint * 10; };

if (isNil "_reconRIFLE") then { _reconRIFLE = _commonRIFLE; };
if (isNil "_reconSCOPE") then { _reconSCOPE = _commonRCO; };
if (isNil "_marksmanSCOPE") then { _marksmanSCOPE = _commonMAGNIFIED; };
if (isNil "_specATSCOPE") then { _specATSCOPE = ""; };
if (isNil "_specATBACKPACK") then { _specATBACKPACK = _bigBACKPACK; };
if (isNil "_medicalBACKPACK") then { _medicalBACKPACK = _bigBACKPACK; };
if (isNil "_reconBACKPACK") then { _reconBACKPACK = _commonBACKPACK; };
if (isNil "_commonRAIL") then { _commonRAIL = ""; };
if (isNil "_commonBIPOD") then { _commonBIPOD = ""; };

if (isNil "_binoc") then { _binoc = "binoc"; };
if (isNil "_rangefinder") then { _rangefinder = "rangefinder"; };
if (isNil "_laserdesignator") then { _laserdesignator = "laserdesignator"; };

if (isNil "_nightOnlyNVGs") then { _nightOnlyNVGs = false; };
if (isNil "_aiBackpackRadios") then { _aiBackpackRadios = false; };
