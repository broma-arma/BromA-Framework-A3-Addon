#include "script_component.hpp"
diag_log text format ["%1: %2", _fnc_scriptName, _this];

params ["_spawnPosition", "_groupType", "_side"];

private _group = createGroup [_side, true];

if (_groupType isEqualType "") then {
	_group setVariable [QGVAR(groupType), _groupType];
	_groupType = GVAR(groupTypes) get _groupType;
} else {
	_group setVariable [QGVAR(groupType), keys GVAR(groupTypes) select (values GVAR(groupTypes) find _groupType)];
};

{
	// TODO Support selectRandomWeighted?
	private _classname = if (_x isEqualType []) then {selectRandom _x} else {_x};

	if (_classname isKindOf "Man") then {
		_group createUnit [_classname, _spawnPosition, [], 0, "NONE"];
	} else {
		private _spawnType = "NONE";
		if (_classname isKindOf "Air") then {
			_spawnPosition set [2, [100, 500] select (_classname isKindOf "Plane")];
			_spawnType = "FLY"; // TODO This might conflict with the specified altitude or it might be irrelevant.
		};

		private _vehicle = createVehicle [_classname, _spawnPosition, [], 0, _spawnType];
		[_vehicle] spawn FUNC(garbageCollector);
		[_vehicle, _group] call FUNC(createVehicleCrew); // TODO Vehicle crew should be in a seperate group?
		//[_group, _groupType, _side, _spawnPosition] spawn FUNC(checkBadSpawn);
	};
} forEach _groupType;

_group
