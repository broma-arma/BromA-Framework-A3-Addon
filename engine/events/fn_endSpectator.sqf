/*
    Ends spectator mode.
*/

titleText ["You are respawning...", "BLACK FADED", 0];

switch (true) do {
	case ("ace3_spectator" in BRM_plugins): {
		[false] call ace_spectator_fnc_setSpectator;
	};
	case ("vanilla_spectator" in BRM_plugins): {
		[false] call BRM_FMK_VanillaSpectator_fnc_setSpectator;
	};
};

[{
	params ["_unit"];

	titleFadeOut 1;

	_unit allowDamage true;

	[_unit, true] remoteExec ["enableSimulationGlobal", 2];
	[_unit, false] remoteExec ["hideObjectGlobal", 2];

	if (!isNil "BRM_FMK_Engine_spectatorOxygenWorkaroundPFH") then {
		[BRM_FMK_Engine_spectatorOxygenWorkaroundPFH] call CBA_fnc_removePerFrameHandler;
	};
}, _this, 2] call CBA_fnc_waitAndExecute;
