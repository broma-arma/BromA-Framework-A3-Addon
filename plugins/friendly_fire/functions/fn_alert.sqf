#define MIN_DAMAGE 0.2

params ["_unit", "_attacker", "_damage", ["_instigator", objNull]];

if (isNull _instigator) then {
	_instigator = _attacker;
};

if (
	_damage < MIN_DAMAGE || isNull _instigator
	|| { vehicle _unit == vehicle _instigator }
	|| { name _instigator == "Error: No Unit" }
	|| { !friendly_fire_count_AI && { (!isPlayer _unit || !isPlayer _instigator) } }
	|| { !([_unit getVariable ["unit_side", side _unit], _instigator getVariable ["unit_side", side _instigator]] call BIS_fnc_sideIsFriendly) }
) exitWith {};

[
	{ ["ALL", "CHAT", _this] call BRM_FMK_fnc_doLog; },
	format ["FRIENDLY FIRE: %2 has wounded %1!", name _unit, name _instigator],
	friendly_fire_timer_minutes * 60
] call CBA_fnc_waitAndExecute;
