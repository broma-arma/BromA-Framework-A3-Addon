if (!hasInterface) exitWith {};

private ["_spawn"];

switch (side player) do {
    case side_a_side: { _spawn = [format ["respawn_%1", toLower str side_a_side]] };
    case side_b_side: { _spawn = [format ["respawn_%1", toLower str side_b_side]] };
    case side_c_side: { _spawn = [format ["respawn_%1", toLower str side_c_side]] };
};

// Change non-existing "respawn_guer" marker to "respawn_resistance".
if (getMarkerType "respawn_guer" == "") then {
	private _guerIndex = _spawn find "respawn_guer";
	if (_guerIndex != -1) then {
		if !("respawn_resistance" in _spawn) then {
			_spawn set [_guerIndex, "respawn_resistance"];
		} else {
			_spawn deleteAt _guerIndex;
		};
	};
};

_spawn = selectRandom _spawn;
_pos = getMarkerPos _spawn;
_deviation = [] call BRM_FMK_Round_System_fnc_getSettings select 0;

_randomN1 = [(_deviation)*-1,_deviation] call BIS_fnc_randomNum;
_randomN2 = [(_deviation)*-1,_deviation] call BIS_fnc_randomNum;

player setPos [(_pos select 0) + _randomN1, (_pos select 1) + _randomN2, 0];

_spawn
