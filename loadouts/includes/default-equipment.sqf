if (isNil "_factionSide") then { _factionSide = [_faction, _defaultSide] call BRM_FMK_fnc_getFaction select 1; };

switch (_factionSide) do {
	case EAST: {
		if (isNil "_weaponsAT") then { _weaponsAT = _TitanAT; };
		if (isNil "_weaponsAA") then { _weaponsAA = _IGLA; };
	};

	case WEST;
	case RESISTANCE;
	default {
		if (isNil "_weaponsAT") then { _weaponsAT = _JAVELIN; };
		if (isNil "_weaponsAA") then { _weaponsAA = _STINGER; };
	};
};

if (isNil "_commonAR") then { _commonAR = _commonMG; };
if (isNil "_countAR") then { _countAR = _countMG; };
if (isNil "_countArCARGO") then { _countArCARGO = _countAR * 4; };

if (isNil "_countWeaponsAT") then { _countWeaponsAT = 2; };
if (isNil "_countWeaponsATCARGO") then { _countWeaponsATCARGO = _countWeaponsAT * 5; };

if (isNil "_countWeaponsAA") then { _countWeaponsAA = 2; };
if (isNil "_countWeaponsAACARGO") then { _countWeaponsAACARGO = _countWeaponsAA * 5; };

if (isNil "_isATDisposable") then {
	private _launcher = _specAT select /*GUN*/0;
	private _cfgLauncher = configFile >> "CfgWeapons" >> _launcher;
	_isATDisposable = !isNil { cba_disposable_NormalLaunchers getVariable _launcher } // CBA
					|| { getText (_cfgLauncher >> "ace_UsedTube") != "" } // ACE
					|| { getNumber (_cfgLauncher >> "rhs_disposable") != 0 } // RHS
					|| { getText (_cfgLauncher >> "uk3cb_used_launcher") != "" }; // 3CB
};

if (_isATDisposable) then {
    _countATCARGO = 0;
};

if (isNil "_countTourniquet") then { _countTourniquet = if (isNil "_countCAT") then { 3 } else { _countCAT }; };
