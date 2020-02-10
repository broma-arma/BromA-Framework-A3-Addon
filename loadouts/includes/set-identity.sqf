if (((_restoreDisplay) || (_restoreType)) && (isPlayer _unit)) then {
    private "_chosenRestore";
    if (_restoreType) then { _chosenRestore = _originalType };
    if (_restoreDisplay) then { _chosenRestore = _displayName };
    private _prevUnitInit = _unit getVariable ["unitInit", ["white", "*", "*", "*", "*"]];
    _prevUnitInit set [3, _chosenRestore];
    _unit setVariable ["unitInit", _prevUnitInit];
};

_defaultVoice = selectRandom _defaultVoice;
_defaultFace = selectRandom _defaultFace;

_doVoice = selectRandom _defaultVoice;
_doFace = selectRandom _defaultFace;

if (!isNil "_defaultName") then {
    _defaultName = selectRandom _defaultName;
    _doFirstName = selectRandom (_defaultName select 0);
    _doLastName = selectRandom (_defaultName select 1);
    _doFinalName = _doFirstName + " " + _doLastName;
} else {
    _doFinalName = "default";
};

[{(time > 3)}, {
    [-2, BRM_FMK_fnc_setUnitIdentity, _this] call CBA_fnc_globalExecute;
}, [_unit, _doVoice, _doFace, _doFinalName, _defaultInsignia]] call CBA_fnc_waitUntilAndExecute;
