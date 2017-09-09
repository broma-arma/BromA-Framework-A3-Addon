
if (((_restoreDisplay) || (_restoreType)) && (isPlayer _unit)) then {
    private "_chosenRestore";
    if (_restoreType) then { _chosenRestore = _originalType };
    if (_restoreDisplay) then { _chosenRestore = _displayName };
    private _prevUnitInit = _unit getVariable ["unitInit", ["white", "*", "*", "*", "*"]];
    _prevUnitInit set [3, _chosenRestore];
    _unit setVariable ["unitInit", _prevUnitInit];
};

_defaultVoice = _defaultVoice call BIS_fnc_selectRandom;
_defaultFace = _defaultFace call BIS_fnc_selectRandom;

_doVoice = _defaultVoice call BIS_fnc_selectRandom;
_doFace = _defaultFace call BIS_fnc_selectRandom;

if (!isNil "_defaultName") then {
    _defaultName = _defaultName call BIS_fnc_selectRandom;
    _doFirstName = (_defaultName select 0) call BIS_fnc_selectRandom;
    _doLastName = (_defaultName select 1) call BIS_fnc_selectRandom;
    _doFinalName = _doFirstName + " " + _doLastName;
} else {
    _doFinalName = "default";
};

[{(time > 3)}, {
    [-2, BRM_FMK_fnc_setUnitIdentity, _this] call CBA_fnc_globalExecute;
}, [_unit, _doVoice, _doFace, _doFinalName, _defaultInsignia]] call CBA_fnc_waitUntilAndExecute;
