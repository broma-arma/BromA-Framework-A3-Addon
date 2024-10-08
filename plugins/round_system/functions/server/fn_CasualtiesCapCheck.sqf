if (!isServer) exitWith {};

params["_sideCheck"];

["LOCAL", "CHAT", "Initializing casualties cap.", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;

while {(!round_over)} do {

	_deadUnits = [];
	_unitsCheck = [];

	//{ if ((isPlayer _x) && (side _x == _sideCheck)) then { _unitsCheck pushBack _x } } forEach allUnits;

	{ if ((side _x == _sideCheck)) then { _unitsCheck pushBack _x } } forEach allUnits;

	{
		if !(_x call BRM_FMK_fnc_alive) then {
			_deadUnits pushBack _x;
		};
	} forEach _unitsCheck;

	if ((count _deadUnits) >= (count _unitsCheck)) exitWith {

		sleep 3;

		{
			_isUncon = false;

			if (mission_ACE3_enabled) then { _isUncon = _x getVariable ["ACE_isUnconscious", false] };

			if ((side _x == _sideCheck) && (_isUncon)) then { _x setDamage 1 };
		} forEach allUnits;

		sleep 5;

		round_dead_sides pushBackUnique _sideCheck;

		["LOCAL", "CHAT", "A team was wiped out!", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;
	};

	sleep 3;
};

["LOCAL", "CHAT", "Casualties cap check aborted.", BRM_FMK_Plugin_RoundSystem_debug] call BRM_FMK_fnc_doLog;
