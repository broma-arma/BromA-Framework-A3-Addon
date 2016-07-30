
/*
    Centers the camera on either a friendly or the first unit.
*/

_allUnits = allUnits - [player];
_specUnit = player;
_friendlyCount = { side _x == (side player) } count _allUnits;
if (_friendlyCount == 0) then { _specUnit = _allUnits select 0; } else {
    { if (side _x == side player) exitWith { _specUnit = _x } } forEach _allUnits;
};

[_specUnit] call BIS_fnc_EGSpectatorCameraPrepareTarget;
[_specUnit] call BIS_fnc_EGSpectatorCameraSetTarget;
["SetCameraMode", ["follow"]] call BIS_fnc_EGSpectatorCamera;