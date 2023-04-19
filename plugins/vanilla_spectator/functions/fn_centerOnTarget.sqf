#include "script_component.hpp"
/*
    Centers the camera on either a friendly or the first unit.
*/

private _playerSide = side player;
private _specUnit = (["GetTargetEntities"] call BIS_fnc_EGSpectator) - [player] apply { [parseNumber (side _x == _playerSide), _x] };
_specUnit sort false;
_specUnit = _specUnit select 0;
if (!isNil "_specUnit") then {
	["SetFocus", [_specUnit select 1]] call (uiNamespace getVariable ["RscDisplayEGSpectator_script", {}]);
	["SetCameraMode", [["fps", "follow"] select BIS_EGSpectator_allow3PPCamera]] call BIS_fnc_EGSpectatorCamera;
};
