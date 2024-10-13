if !(hasInterface) exitWith { intro_cutscene_over = true; };

private _type = "TEXT";
if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "intro_cutscene") then {
		_type = intro_cutscene;
	};
} else {
	if (fileExists "mission\settings\plugins\intros.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\intros.sqf";
	};
};

intro_cutscene_over = false;

_type spawn {
	if !(isMultiplayer && !didJIP && !(player isKindOf "VirtualSpectator_F")) exitWith { intro_cutscene_over = true; };

	sleep 0.001; // After briefing

	private _validSlot = if ("prevent_reslot" call BRM_FMK_fnc_isPluginActive) then {
		waitUntil { sleep 0.01; !isNil { player getVariable "BRM_FMK_Plugin_PreventReslot_validSlot" } };

		player getVariable ["BRM_FMK_Plugin_PreventReslot_validSlot", false]
	} else { true };
	if (!_validSlot) exitWith { intro_cutscene_over = true; };

	if ("loading_screen" call BRM_FMK_fnc_isPluginActive) then {
		waitUntil { sleep 0.01; missionNamespace getVariable ["loading_screen_finished", false] };
	};

	if ("respawn_system" call BRM_FMK_fnc_isPluginActive && { [player] call BRM_FMK_Plugin_RespawnSystem_fnc_getLives == 0 }) exitWith {
		intro_cutscene_over = true;
	};

	switch (_this) do {
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
