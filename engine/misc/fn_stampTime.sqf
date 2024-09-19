/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_stampTime

AUTHOR(s):
    Nife

DESCRIPTION:
    Synchronizes time on the server.

PARAMETERS:
    None.

USAGE:
    [] spawn BRM_FMK_Engine_fnc_stampTime

RETURNS:
    Nothing.

================================================================================
*/

if !(isServer && isRemoteExecuted) exitWith {};

private _names = ["DATE", "FOG",     "RAIN", "GUSTS", "LIGHTNINGS", "OVERCAST", "RAINBOW", "WIND STRENGTH", "WIND FORCE",                   "WAVES"];
private _stamp = [date,   fogParams, rain,   gusts,   lightnings,   overcast,   rainbow,   windStr,         (wind select [0, 2]) + [false], waves];

private _i = -1;
["LOCAL", "LOG", format ["=== SERVER TIME STAMP @ %1: %2", time, _stamp apply { _i = _i + 1; format ["%1: %2", _names select _i, _x] } joinString " | "]] call BRM_FMK_fnc_doLog;

_stamp remoteExec ["BRM_FMK_Engine_fnc_syncTime", remoteExecutedOwner];
