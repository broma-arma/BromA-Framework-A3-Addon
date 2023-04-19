#include "script_component.hpp"
if !(hasInterface) exitWith { intro_cutscene_over = true; };

intro_cutscene_over = false;

0 spawn {
	waitUntil { !isNil "player_is_spectator" };

	if !(isMultiplayer && !didJIP && !player_is_spectator) exitWith { intro_cutscene_over = true; };

	if ("loading_screen" in BRM_plugins) then {
		waitUntil { !isNil "loading_screen_finished" && { loading_screen_finished } };
	} else {
		sleep 0.1;
	};

	if ("respawn_system" in BRM_plugins) then {
		if ([player] call EFUNC(RespawnSystem,getLives) == 0) then {
			intro_cutscene_over = true;
		};
	};

	if (intro_cutscene_over) exitWith {};

	switch ([] call FUNC(getSettings) select 0) do {
		case "ESTABLISHING": {
			[player, format ["%1, %2", toUpper worldName, player call BIS_fnc_locationDescription], 1.5, 1, 280, 0] spawn BIS_fnc_establishingShot;
		};

		case "TEXT": {
			private _i = 0;
			date apply {
				call {
					_i = _i + 1;
					if (_i == 1) exitWith { str _x };
					if (_i > 0 && _x < 10) exitWith { format ["0%1", _x] };
					str _x
				}
			} params ["_year", "_month", "_day", "_hour", "_minute"];

			private _dateTime = format ["%1-%2-%3 %4:%5", _year, _month, _day, _hour, _minute];

			[[
				[_dateTime, "align='left'", "#ffffff"], ["", "<br/>"],
				[toUpper worldName + ", ", "align='left' valign='bottom' font='PuristaBold'", "#ffffff"],
				[player call BIS_fnc_locationDescription, "align='left'", "#ffffff"]
			]] spawn BIS_fnc_typeText2;
		};

		case "CINEMA": 0 spawn {
			{
				private _script = call _x;
				waitUntil { scriptDone _script };
			} forEach [
				{[0, 2, false, true] call BIS_fnc_cinemaBorder},
				{[toUpper worldName, player call BIS_fnc_locationDescription] spawn BIS_fnc_infoText},
				{[1, 2, false, true] call BIS_fnc_cinemaBorder}
			]
		};
	};

	intro_cutscene_over = true;
};
