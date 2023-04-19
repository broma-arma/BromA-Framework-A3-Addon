#include "script_component.hpp"
mission_dead_civilian_limit = ["p_dead_civies", -1] call BIS_fnc_getParamValue;

if (!isServer || mission_dead_civilian_limit < 0) exitWith {};

GVAR(civsKilled) = [0, 0, 0]; // Side A, B, C

if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
	// ACE3's medical system causes the 'instigator' to be invalid.
	["Civilian", "init", FUNC(civInit), true, [], true] call CBA_fnc_addClassEventHandler;
} else {
	addMissionEventHandler ["EntityKilled", FUNC(civKilled)];
};
