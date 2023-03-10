params ["_unit", "_killer", "_instigator", "_useEffects"];

private _sound = format ["BRM_FMK_AIS_sound_killed%1", floor random 20 + 1];

if ((random 1) >= 0.5) then {
	private _corpse = "#particlesource" createVehicle ASLToAGL getPosWorld _unit;
	[_corpse,_sound] remoteExec ["say3D",if (isMultiplayer) then {-2} else {0}];

	_corpse spawn {
		sleep 5; // at least the length of your sound
		deleteVehicle _this;
	};
};
