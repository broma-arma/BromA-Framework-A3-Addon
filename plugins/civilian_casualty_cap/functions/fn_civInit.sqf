#include "component.hpp"

if (!mission_running) exitWith {};

params ["_unit"];

if (!local _unit) exitWith {
	_this remoteExec ["BRM_FMK_CivilianCasualtyCap_fnc_civInit", _unit];
};

_unit addEventHandler ["Hit", {
	params ["_unit", "_causedBy", "_damage", "_instigator"];

	if (side _unit == civilian) then {
		_unit setVariable ["brmFMK_civCasCap_lastHit", [_causedBy, _instigator]];
	};
}];

_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_killerInstigator"];

	if (side _unit != civilian) exitWith {};

	(_unit getVariable "brmFMK_civCasCap_lastHit") params ["_causedBy", "_instigator"];

	if (isNull _causedBy) then {
		_causedBy = _killer;
	};
	if (isNull _instigator) then {
		_instigator = _killerInstigator;
	};

	[_unit, _causedBy, _instigator] remoteExec ["BRM_FMK_CivilianCasualtyCap_fnc_civKilled", 2];
}];
