if (!hasInterface) exitWith {};

private ["_spawn"];

switch (side player) do {
	case side_a_side: { _spawn = BRM_FMK_Plugin_RoundSystem_respawnMarkersA };
	case side_b_side: { _spawn = BRM_FMK_Plugin_RoundSystem_respawnMarkersB };
	case side_c_side: { _spawn = BRM_FMK_Plugin_RoundSystem_respawnMarkersC };
};

_spawn = selectRandom _spawn;
_pos = getMarkerPos _spawn;
_deviation = BRM_FMK_Plugin_RoundSystem_setupRadius;

_randomN1 = [(_deviation)*-1,_deviation] call BIS_fnc_randomNum;
_randomN2 = [(_deviation)*-1,_deviation] call BIS_fnc_randomNum;

player setPos [(_pos select 0) + _randomN1, (_pos select 1) + _randomN2, 0];

_spawn
