#include "script_component.hpp"
if (isNil "BrmFmk_RemoveBody_queue") then { BrmFmk_RemoveBody_queue = []; };

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator", "_useEffects"];

	if (local _killed && _killed isKindOf "CAManBase" && {!(_killed getVariable ["remove_body_exclude", false] || _killed in ([] call FUNC(getSettings) select 2))}) then {
		_killed call FUNC(removeBody);
	};
}];
