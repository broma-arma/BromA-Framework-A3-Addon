/*
    Initializes spectator units.
*/

params ["_unit"];

_unit allowDamage false;
[_unit, true] remoteExec ["hideObjectGlobal", 2];
[_unit, false] remoteExec ["enableSimulationGlobal", 2];

[_unit] call BRM_FMK_fnc_joinDeadGroup;

BRM_FMK_Engine_spectatorOxygenWorkaroundPFH = [{
	player setOxygenRemaining 1;
}, 10] call CBA_fnc_addPerFrameHandler;

switch (true) do {
	case ("ace3_spectator" in BRM_plugins): {
		[true] call ace_spectator_fnc_setSpectator;
	};
	case ("vanilla_spectator" in BRM_plugins): {
		[true] call BRM_FMK_VanillaSpectator_fnc_setSpectator;
	};
	default { _unit setDamage 1; };
};
