/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_setUnitGroupId

AUTHOR(s):
    Nife

DESCRIPTION:
   Sets the unit's group radio callsign.

PARAMETERS:
    0 - Unit. (OBJECT)

USAGE:
    [blu_0_0_1] call BRM_FMK_Engine_fnc_setUnitGroupId;

RETURNS:
    Nothing.

================================================================================
*/

params ["_unit"];

private _unitInit = _unit getVariable "unitInit";
if (isNil "_unitInit") exitWith {};

private _unitName = str _unit splitString "_";
if !(count _unitName == 4 && _unit == leader _unit) exitWith {};

private _group = group _unit;

private _groupVar = _unitName select [0, 3] joinString "_";
if (isNil _groupVar) then {
	missionNamespace setVariable [_groupVar, _group, true];
};

_unitInit params ["", "", "", ["_groupName", "*"]];

private _groupId = if (toUpper _groupName in ["*", "AUTO", "ANY"]) then {
	_unitName params ["_side", "_squadIndex", "_groupIndex", ""];

	_side = switch (_side) do {
		case "blu": { WEST };
		case "op":  { EAST };
		case "ind": { RESISTANCE };
		case "civ": { CIVILIAN };
	};

	([_side, "callsigns"] call BRM_FMK_fnc_getSideInfo select parseNumber _squadIndex) + ([" " + _groupIndex, ""] select (_groupIndex == "0"))
} else {
	_groupName
};

if (groupId _group != _groupId) then {
	_group setGroupIdGlobal [_groupId];
};
