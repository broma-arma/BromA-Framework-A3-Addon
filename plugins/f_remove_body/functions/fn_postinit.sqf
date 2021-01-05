#include "component.hpp"

// 'f_' names are for backward compatibility

if (isNil "f_var_removeBodyDelay") then { f_var_removeBodyDelay = 120; };

if (isNil "f_var_removeBodyDistance") then { f_var_removeBodyDistance = 300; };

if (isNil "f_var_doNotRemoveBodies") then {f_var_doNotRemoveBodies = []};

if (isNil "BrmFmk_RemoveBody_queue") then { BrmFmk_RemoveBody_queue = []; };

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator", "_useEffects"];

	if (local _killed && _killed isKindOf "CAManBase" && {!(_killed getVariable ["f_removeBodyEH", false] || _killed in f_var_doNotRemoveBodies)}) then {
		_killed call BRM_FMK_f_remove_body_fnc_removeBody;
	};
}];
