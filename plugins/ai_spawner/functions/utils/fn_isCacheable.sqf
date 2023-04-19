#include "script_component.hpp"
//diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_unit"];

private _vehicle = objectParent _unit;

if (isNull _vehicle) exitWith {
	leader _unit != _unit
};

// TODO Caching leader in vehicle will probably cause issues. Especially if leader is vehicle commander.
//      Better would be to not cache any turret (Not including FFV?), which should include commander
driver _vehicle != _unit && { !(_vehicle isKindOf "StaticWeapon") && { gunner _vehicle != _unit }}
