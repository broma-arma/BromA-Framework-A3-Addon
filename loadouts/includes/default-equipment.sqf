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

if (isNil "_isSpecATDisposable" && !isNil "_isATDisposable") then {
	_isSpecATDisposable = _isATDisposable;
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
	_countATCARGO = 0;
};

if (isNil "_countTourniquet") then { _countTourniquet = if (isNil "_countCAT") then { 3 } else { _countCAT }; };
