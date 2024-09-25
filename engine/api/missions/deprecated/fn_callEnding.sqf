/*
================================================================================

DEPRECATED:
    Use BRM_FMK_fnc_endMission.

NAME:
    BRM_FMK_fnc_callEnding

AUTHOR(s):
    Nife

DESCRIPTION:
    This function will effectively end the mission and call other ending events.

PARAMETERS:
    0 - Ending event that should be called (STRING)

USAGE:
    ["victory"] call BRM_FMK_fnc_callEnding

RETURNS:
    Nothing.

================================================================================
*/

if (isNil "BRM_FMK_fnc_callEnding_warned") then {
	["CLIENT_ONLY", "CHAT", "WARNING: Mission uses deprecated BRM_FMK_fnc_callEnding function, use BRM_FMK_fnc_endMission instead"] call BRM_FMK_fnc_doLog;
	BRM_FMK_fnc_callEnding_warned = true;
};

_this call BRM_FMK_fnc_endMission;
