#include "script_component.hpp"
params ["_unit"];

[_unit, 0] call FUNC(setLives);
[_unit] call FUNC(removeFromMission);
