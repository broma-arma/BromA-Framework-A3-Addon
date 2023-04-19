#include "script_component.hpp"
params ["_unit", "_corpse"];

private _lives = [_unit] call FUNC(getLives);

_unit setVariable ["unit_deaths", (_unit getVariable ["unit_deaths", 0]) + 1, true];
if (_lives == 0 || !mission_allow_respawn) then {
	if (_lives != 0) then {
		[_unit, 0] call FUNC(setLives);
	};
	[_unit] call FUNC(removeFromMission);
} else {
	[_unit, _lives - 1] call FUNC(setLives);
};
