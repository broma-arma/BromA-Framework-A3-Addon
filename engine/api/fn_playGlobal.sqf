/*
================================================================================

NAME:
    BRM_FMK_fnc_playGlobal

AUTHOR(s):
    Nife

DESCRIPTION:
    Plays a track global to all players.

PARAMETERS:
    0 - Track. (STRING)

USAGE:
    ["LeadTrack01_F"] call BRM_FMK_fnc_playGlobal

RETURNS:
    Nothing.

================================================================================
*/

params [["_track", "", [""]]];

if (_track != "") then {
	_track remoteExec ["playMusic", [0, -2] select isDedicated];
};
