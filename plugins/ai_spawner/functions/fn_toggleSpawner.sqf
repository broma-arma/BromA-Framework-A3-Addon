#include "script_component.hpp"
// TODO This doesn't work as intended, fix it

diag_log text format ["%1: %2", _fnc_scriptName, _this];

if (!mission_ai_controller) exitWith {};

// state: force start/end spawner
params ["_id", "_state"];

private _spawner = [_id] call FUNC(getSpawner);
if (!isNil "_spawner") then {
	private _conditions = if (_state) then {
		[{true}, _spawner select GVAR(SPAWNER_CONDITIONS) select 1];
	} else {
		[_spawner select GVAR(SPAWNER_CONDITIONS) select 0, {true}];
	};

	_spawner set [GVAR(SPAWNER_CONDITIONS), _conditions];
};
