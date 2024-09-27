/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_setHitFace

AUTHOR(s):
    Nife

DESCRIPTION:
    Changes the expression of a unit who's just been damaged to look either hurt
    or dead.

PARAMETERS:
    0 - Unit. (OBJECT)

USAGE:
    [player] call BRM_FMK_Engine_fnc_setHitFace

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit"];

if (!alive _this || { _unit getVariable ["BRM_FMK_Engine_fnc_setHitFace", false] }) exitWith {};

_unit spawn {
	_this setVariable ["BRM_FMK_Engine_fnc_setHitFace", true];

	[_this, "dead"] remoteExec ["setMimic", 0];

	sleep 1;

	if (alive _this) then {
		[_this, ""] remoteExec ["setMimic", 0];
	};

	_this setVariable ["BRM_FMK_Engine_fnc_setHitFace", false];
};
