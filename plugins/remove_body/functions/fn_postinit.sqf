if (isNil "BrmFmk_RemoveBody_queue") then { BrmFmk_RemoveBody_queue = []; };

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator", "_useEffects"];

	if (local _killed && _killed isKindOf "CAManBase" && {!(_killed getVariable ["remove_body_exclude", false] || _killed in ([] call BRM_FMK_remove_body_fnc_getSettings select 2))}) then {
		_killed call BRM_FMK_remove_body_fnc_removeBody;
	};
}];
