#include "component.hpp"

if (isServer && isClass (configFile >> "CfgPatches" >> "OCAP")) then {
    [{!(isNil "mission_running" || {mission_running})}, OCAP_fnc_exportData] call CBA_fnc_waitUntilAndExecute;
};
