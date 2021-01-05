#include "component.hpp"
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

private _unitSide = _unit getVariable ["unit_side", side _unit];

switch (_unitSide) do {
	case WEST:       { mission_dead_west        = mission_dead_west        + 1; publicVariable "mission_dead_west" };
	case EAST:       { mission_dead_east        = mission_dead_east        + 1; publicVariable "mission_dead_east" };
	case RESISTANCE: { mission_dead_independent = mission_dead_independent + 1; publicVariable "mission_dead_independent" };
	case CIVILIAN:   { mission_dead_civilian    = mission_dead_civilian    + 1; publicVariable "mission_dead_civilian" };
};

switch (_unitSide) do {
	case side_a_side: { mission_dead_side_A = mission_dead_side_A + 1; publicVariable "mission_dead_side_A" };
	case side_b_side: { mission_dead_side_B = mission_dead_side_B + 1; publicVariable "mission_dead_side_B" };
	case side_c_side: { mission_dead_side_C = mission_dead_side_C + 1; publicVariable "mission_dead_side_C" };
};

if (isNil "_killer" || {_unit == _killer}) then { _killer = objNull; };

if (isNull _killer) then {
	_killer = _unit getVariable ["last_damage", objNull];
	if (_unit == _killer) then { _killer = objNull; };
};

if (isNull _killer) exitWith {};

private _scoreChanged = false;
{
	if (_x isKindOf "CAManBase" && {_x != _unit} && {isPlayer _x}) then {
		private _sideKiller = _x getVariable ["unit_side", side _x];
		private _killerScore = _x getVariable ["unit_score", 0];

		_killerScore = _killerScore + ([1, -1] select ([_unitSide, _sideKiller] call BIS_fnc_areFriendly));

		_x setVariable ["unit_score", _killerScore, true];

		private _name = name _x;
		private _index = count mission_unit_score;
		{
			if (_x select 0 == _name) exitWith {
				_index = _forEachIndex;
			};
		} forEach mission_unit_score;

		mission_unit_score set [_index, [_name, _killerScore]];
		_scoreChanged = true;
	};
} forEach (crew vehicle _killer);

if (_scoreChanged) then {
	publicVariable "mission_unit_score";
};
