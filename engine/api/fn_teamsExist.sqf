/*
================================================================================

NAME:
    BRM_FMK_fnc_teamsExist

AUTHOR(s):
    Nife

DESCRIPTION:
    Loops through to see how many sub-teams exist under your squad.

PARAMETERS:
    0 - Your side + squad. (STRING)
    1 - Your own team. (NUMBER)

USAGE:
    ["blu_0", 1] call BRM_FMK_fnc_teamsExist

RETURNS:
    Sub-teams that exist in your squad, disregarding the Actual team.

================================================================================
*/

params [["_squad", "", [""]], ["_ownTeam", 0, [0]]];

private _i = 1;
private _subTeams = [];

while { _i == _ownTeam || { !isNull (missionNamespace getVariable [format ["%1_%2_1", _squad, _i], objNull]) } } do {
	_subTeams pushBack _i;
	_i = _i + 1;
};

_subTeams
