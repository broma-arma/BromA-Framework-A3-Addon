#include "script_component.hpp"
/*
================================================================================

NAME:
    BRM_FMK_fnc_setUnitIdentity

AUTHOR(s):
    Nife

DESCRIPTION:
    Set the voice, face, and name of a Man object.

PARAMETERS:
    0 - Man object. (OBJECT)
    1 - Voice config name. (STRING)
    2 - Face config name. (STRING)
    3 - Name. (STRING)

USAGE:
    [player, "Male01ENG", "WhiteHead_01", "John Smith"] call BRM_FMK_fnc_setUnitIdentity;

RETURNS:
    Nothing

================================================================================
*/

params ["_unit", "_voice", "_face", "_name"];

_unit setFace _face;
_unit setSpeaker _voice;
_unit setPitch ([0.85, 1.15] call BIS_fnc_randomNum);

if (_name != "") then {
	if (mission_ACE3_enabled) then {
		[_unit] call ace_common_fnc_setName;
	};

	_unit setName _name;
};
