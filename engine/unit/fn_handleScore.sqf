/*
================================================================================

NAME:
    BRM_FMK_fnc_handleScore

AUTHOR(s):
    Nife

DESCRIPTION:
    Adds or subtracts the proper score from a unit.

PARAMETERS:
    0 - Unit killed. (OBJECT)
    1 - Killer of said unit. (OBJECT)

USAGE:
    [player, myKiller] call BRM_FMK_fnc_handleScore

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit", "_killer"];

if !(_unit isKindOf "CAManBase") exitWith {};

if (isNil "_killer" || {_unit == _killer}) then { _killer = objNull; };

if (isNull _killer) then {
	_killer = _unit getVariable ["last_damage", objNull];
	if (_unit == _killer) then { _killer = objNull; };
};

if (isNull _killer) exitWith {};

private _scoreChanged = false;
private _unitSide = _unit call BIS_fnc_objectSide;
{
	if (_x isKindOf "CAManBase" && {_x != _unit} && {isPlayer _x}) then {
		private _sideKiller = _x call BIS_fnc_objectSide;
		private _killerScore = _x getVariable ["unit_score", 0];

		_killerScore = _killerScore + ([1, -1] select ([_unitSide, _sideKiller] call BIS_fnc_areFriendly));

		_x setVariable ["unit_score", _killerScore, true];
	};
} forEach (crew vehicle _killer);
