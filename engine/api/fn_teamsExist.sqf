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

params ["_squad", "_ownTeam"];

private _thisIndex = 1;
private _teamsChecking = true;
private _realTeams = [];

while{(_teamsChecking)} do {
    private _squadTeam = format["%1_%2_1", _squad, _thisIndex];
    private _unitStatus = (isNull (call compile _squadTeam));
    private _unitNil = (isNil "_unitStatus");

    if (_thisIndex == _ownTeam) then { _unitNil = false };

    if (_unitNil) exitWith { _teamsChecking = false; };

    _realTeams pushBack _thisIndex;
    _thisIndex = _thisIndex + 1;
};
_realTeams