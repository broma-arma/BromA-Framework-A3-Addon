params ["_unit", "_killer", "_instigator", "_useEffects"];

private _sound = format ["BRM_FMK_AIS_sound_killed%1", floor random 20 + 1];

if ((random 1) >= 0.5) then {
	// TODO playSound3D?
	private _corpse = "#particlesource" createVehicle ASLToAGL getPosWorld _unit;
	[_corpse,_sound] remoteExec ["say3D", [0, -2] select isDedicated];

	// TODO Check if can detect playback end from say3D return value
	_corpse spawn {
		sleep 5;
		deleteVehicle _this;
	};
};
