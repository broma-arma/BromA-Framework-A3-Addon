// =============================================================================
//  Respawn protection duration parameters
// =============================================================================

if (!isServer) exitWith {};

// Duration of spawn protection, in minutes: 0 (Disable), 1, 15, 30, -1 (Infinite), 99999 (backwards compatibility)
private _duration = ["p_spawn_protection_time", -1] call BIS_fnc_getParamValue;

if (isNil "mission_spawn_protection_time") then {
	if (_duration == -1 || _duration == 99999) then {
		mission_spawn_protection_time = -1;
	} else {
		mission_spawn_protection_time = _duration * 60;
	};
};

// =============================================================================
