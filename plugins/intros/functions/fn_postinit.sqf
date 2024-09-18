if !(hasInterface) exitWith { intro_cutscene_over = true; };

intro_cutscene_over = false;

0 spawn {
	waitUntil { sleep 0.1; !isNil "player_is_spectator" };

	if !(isMultiplayer && !didJIP && !player_is_spectator) exitWith { intro_cutscene_over = true; };

	sleep 0.1; // After briefing

	if ("loading_screen" in BRM_FMK_activePlugins) then {
		waitUntil { sleep 0.1; missionNamespace getVariable ["loading_screen_finished", false] };
	};

	if ("respawn_system" in BRM_FMK_activePlugins && { [player] call BRM_FMK_RespawnSystem_fnc_getLives == 0 }) exitWith {
		intro_cutscene_over = true;
	};

	if (isNil "intro_cutscene") then { intro_cutscene = "ESTABLISHING" };
	switch (intro_cutscene) do {
		case "ESTABLISHING": {
			0 spawn {
				[player, format ["%1, %2", toUpper worldName, player call BIS_fnc_locationDescription], random [100, 150, 200], random [50, 75, 100]] call BIS_fnc_establishingShot;
				sleep 0.1;
				BIS_fnc_establishingShot_fakeUAV = nil; // Fix BIS_fnc_establishingShot not working again.
			};
		};

		case "TEXT": {
			private _dateTime = format (["%1-%2-%3 %4:%5"] + (date apply {
				if (_x < 10) then {
					format ["0%1", _x]
				} else {
					_x
				};
			}));

			[[
				[_dateTime, "align='left'", "#ffffff"], ["", "<br/>"],
				[toUpper worldName + ", ", "align='left' valign='bottom' font='PuristaBold'", "#ffffff"],
				[player call BIS_fnc_locationDescription, "align='left'", "#ffffff"]
			]] spawn BIS_fnc_typeText2;
		};

		case "CINEMA": {
			0 spawn {
				{
					private _script = call _x;
					waitUntil { scriptDone _script };
				} forEach [
					{ [0, 2, false, true] call BIS_fnc_cinemaBorder },
					{ [toUpper worldName, player call BIS_fnc_locationDescription] spawn BIS_fnc_infoText },
					{ [1, 2, false, true] call BIS_fnc_cinemaBorder }
				]
			}
		};
	};

	intro_cutscene_over = true;
};
