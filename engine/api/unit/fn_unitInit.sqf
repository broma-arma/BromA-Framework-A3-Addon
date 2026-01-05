/*
================================================================================

NAME:
    BRM_FMK_fnc_unitInit

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Set initialization variable for a unit.

PARAMETERS:
    0 - Name (STRING)
    1 - (OPTIONAL) Team Color. Default "WHITE". (STRING)
        "WHITE", "RED", "GREEN", "BLUE", or "YELLOW"
    2 - (OPTIONAL) Override faction. Default "". (STRING)
        "": Side faction.
        "VANILLA": Don't assign a loadout.
		"SIDE_A": Side A faction.
		"SIDE_B": Side B faction.
		"SIDE_C": Side C faction.
    3 - (OPTIONAL) Override role. Default "". (STRING)
        "": Unit role.
    4 - (OPTIONAL) Group Name. Default "". (STRING)
USAGE:
    [this] call BRM_FMK_fnc_unitInit;
    [this, "red"] call BRM_FMK_fnc_unitInit;
    [this, "red", "AAF", "rifleman", "Alpha 2"] call BRM_FMK_fnc_unitInit;

RETURNS:
    Nothing

================================================================================
*/

params [
	["_unit", objNull, [objNull]],
	["_teamColor", "MAIN", [""]],
	["_faction", "", [""]],
	["_role", "", [""]],
	["_groupName", "", [""]]
];

if (isNull _unit || !local _unit) exitWith {};

_teamColor = toUpperANSI _teamColor;
if (_teamColor == "" || _teamColor == "WHITE") then {
	_teamColor = "MAIN";
};
if !(_teamColor in ["MAIN", "RED", "GREEN", "BLUE", "YELLOW"]) then {
	["Invalid unitInit team color, ""%1"", for %1. Defaulting to ""WHITE""", _teamColor, _unit] call BRM_FMK_fnc_error;
	_teamColor = "MAIN";
};

_faction = toUpper _faction;
_faction = switch (_faction) do {
	case "SIDE_A": { side_a_faction };
	case "SIDE_B": { side_b_faction };
	case "SIDE_C": { side_c_faction };
	case "";
	case "AUTO";
	case "ANY":    { "*" };
	case "-";
	case "NONE":   { "VANILLA" };
	default        { _faction };
};
if (_faction != "*" && _faction != "VANILLA" && { isNull (configFile >> "BRM_FMK" >> "Factions" >> _faction) }) then {
	private _default = [side_a_faction, side_b_faction, side_c_faction, "VANILLA"] select ([side_a_side, side_b_side, side_c_side] find side _unit);
	["Invalid unitInit faction, ""%1"", for %1. Defaulting to ""%3""", _faction, _unit, _default] call BRM_FMK_fnc_error;
	_faction = _default;
};

if (_role == "") then {
	_role = "*";
};

if (_groupName == "") then {
	_groupName = "*";
};

_unit setVariable ["unitInit", [_teamColor, _faction, _role, _groupName], true];
