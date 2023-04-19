#include "script_component.hpp"
params ["_unit", "_attacker", "_damage", ["_instigator", objNull]];

if (isNull _instigator) then {
	_instigator = _attacker;
};

private _unitSide = _unit getVariable ["unit_side", side _unit];
private _instigatorSide = _instigator getVariable ["unit_side", side _instigator];

[] call FUNC(getSettings) params ["_delay", "_ai", "_civilian"];

if (
	isNull _instigator
	|| { vehicle _unit == vehicle _instigator }
	|| { name _instigator == "Error: No Unit" }
	|| { !_ai && { !isPlayer _unit || !isPlayer _instigator } }
	|| { !_civilian && { _unitSide isEqualTo CIVILIAN || _instigatorSide isEqualTo CIVILIAN } }
	|| { !([_unitSide, _instigatorSide] call BIS_fnc_sideIsFriendly) }
) exitWith {};

private _names = [name _unit, name _instigator];

if (!isNull (_attacker getVariable ["bis_fnc_moduleremotecontrol_owner", objNull])) exitWith {
	["SERVER", "LOG", format (["FRIENDLY FIRE: %2 has wounded %1 with a remote controlled unit."] + _names)] call FUNCMAIN(doLog);
};

if !(GVAR(alerts) set [_names, true]) then {
	[{
		["ALL", "CHAT", format (["FRIENDLY FIRE: %2 has wounded %1!"] + _this)] call FUNCMAIN(doLog);
		GVAR(alerts) deleteAt _this;
	}, _names, _delay] call CBA_fnc_waitAndExecute;
};
