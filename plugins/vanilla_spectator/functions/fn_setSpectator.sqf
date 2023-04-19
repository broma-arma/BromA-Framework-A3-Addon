#include "script_component.hpp"
if !(hasInterface) exitWith {};

params [["_set", true, [true]]];

if (_set) then {
	if (["Initialize", [player] + ([] call FUNC(getSettings))] call BIS_fnc_EGSpectator) then {
		[] call FUNC(centerOnTarget);
	};
} else {
	["Terminate"] call BIS_fnc_EGSpectator;
};
