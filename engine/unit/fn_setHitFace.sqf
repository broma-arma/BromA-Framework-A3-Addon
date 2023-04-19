#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_setHitFace

AUTHOR(s):
    Nife

DESCRIPTION:
    Changes the expression of a unit who's just been damaged to look either hurt
    or dead.

PARAMETERS:
    0 - Unit. (OBJECT)

USAGE:
    [player] call BRM_FMK_fnc_setHitFace

RETURNS:
    Nothing.

================================================================================
*/

_this spawn {
	params ["_unit"];

	if (_unit getVariable [QFUNCMAIN(setHitFace), false]) exitWith {};
	_unit setVariable [QFUNCMAIN(setHitFace), true];

	[_unit, "dead"] remoteExec ["setMimic", 0];

	sleep 1;

	if (alive _unit) then {
		[_unit, ""] remoteExec ["setMimic", 0];
	};

	_unit setVariable [FUNCMAIN(setHitFace), false];
};
