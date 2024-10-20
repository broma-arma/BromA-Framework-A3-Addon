/*
================================================================================

NAME:
    BRM_FMK_fnc_initAI

AUTHOR(s):
    Nife

DESCRIPTION:
    Initializes an AI unit with their loadout and environment variables.

PARAMETERS:
    0 - Target unit. (OBJECT)
    1 - Faction the unit belongs to. (STRING)

USAGE:
    [aiUnit, "SLA"] call BRM_FMK_fnc_initAI;
    [this, "RACS"] call BRM_FMK_fnc_initAI;

RETURNS:
    Nothing.

================================================================================
*/

#define ALIAS_AUTO ["*", "AUTO", "ANY"]
#define ALIAS_NONE ["-", "NONE", "VANILLA"]

params ["_unit", ["_faction", "*"]];

if !(local _unit && _unit isKindOf "CAManBase" && !isPlayer _unit) exitWith {};

// Check if the unit already hasn't been initialized. ==========================

if (_unit getVariable ["unit_initialized", false]) exitWith {};
_unit setVariable ["unit_initialized", true];

if (!BRM_FMK_Engine_initialized) exitWith {
	[{ BRM_FMK_Engine_initialized }, {
		_this select 0 setVariable ["unit_initialized", false];
		_this call BRM_FMK_fnc_initAI;
	}, _this] call CBA_fnc_waitUntilAndExecute;
};

_unit setVariable ["unit_side", side _unit, true]; // Backward compatibility

_unit getVariable ["unitInit", []] params ["", "_initFaction", "_role"];

// Assign loadout
if (!isNil "_initFaction") then {
	_faction = _initFaction;
};
if (toUpper _faction in ALIAS_AUTO) then { _faction = [side _unit, "FACTION"] call BRM_FMK_fnc_getSideInfo; };
if !(toUpper _faction in ALIAS_NONE || units_AI_useVanillaGear) then {
	if (!isNil "_role") then {
		if (toUpper _role in ALIAS_AUTO) then { _role = getText (configOf _unit >> "displayName"); };
		[_unit, _faction, _role] call BRM_FMK_fnc_assignLoadout;
	} else {
		if (_faction != "civilian") then {
			[_unit, _faction] call BRM_FMK_fnc_assignLoadout;
		};
	}
};
