if (mission_game_mode == "coop") exitWith {};

if (isNil "setup_zone_area") then {
	setup_zone_area = 50;
};

0 spawn {
	waitUntil { !isNil "mission_setup_time" && !isNil "BRM_FMK_activePlugins" };

	private _commanderLockTVT = false;
	if ("commander_lock" in BRM_FMK_activePlugins) then {
		waitUntil { !isNil "co_lock_tvt_mode" };

		_commanderLockTVT = co_lock_tvt_mode;
	};

	if (isServer) then {
		BRM_FMK_Setup_Zone_active = true;
		publicVariable "BRM_FMK_Setup_Zone_active";

		_commanderLockTVT spawn {
			if (_this) then {
				waitUntil { !isNil "co_lock_allSidesReady" && {co_lock_allSidesReady} };
			} else {
				sleep mission_setup_time;
			};

			BRM_FMK_Setup_Zone_active = false;
			publicVariable "BRM_FMK_Setup_Zone_active";
		};
	};

	if (hasInterface) then {
		waitUntil { !isNil "BRM_FMK_Setup_Zone_active" };

		if (!BRM_FMK_Setup_Zone_active) exitWith {};

		if (isMultiplayer) then {
			if ("intros" in BRM_FMK_activePlugins) then {
				waitUntil { !isNil "intro_cutscene_over" && {intro_cutscene_over} };
			};
			if ("loading_screen" in BRM_FMK_activePlugins) then {
				waitUntil { !isNil "loading_screen_finished" && {loading_screen_finished} };
			};
		};

		if (_commanderLockTVT) then {
			["Alert", ["The mission will begin when all teams are ready."]] call BIS_fnc_showNotification;
		} else {
			["MissionBegins", [
				if (mission_setup_time < 60) then {
					format ["%1 seconds", mission_setup_time]
				} else {
					format ["%1 minutes", floor (mission_setup_time / 60)]
				}
			]] call BIS_fnc_showNotification;
		};

		private _markerPos = getMarkerPos ([player] call BRM_FMK_fnc_getSpawnPoint);
		private _marker = createMarkerLocal ["setupZone", _markerPos];
		_marker setMarkerDirLocal 0;
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerSizeLocal [setup_zone_area, setup_zone_area];
		_marker setMarkerBrushLocal "Border";
		_marker setMarkerColorLocal ("Color" + ([side player, "color"] call BRM_FMK_fnc_getSideInfo));

		private _message = "You cannot leave the setup area until the time is over.";
		if (_commanderLockTVT) then {
			_message = "Wait until all sides are ready to start.";
		};

		while {BRM_FMK_Setup_Zone_active} do {
			private _unit = objectParent player;

			if (isNull _unit) then {
				_unit = player;
			} else {
				if (!local _unit) then {
					_unit = objNull;
				};
			};

			private _sleep = 1;
			if (!isNull _unit) then {
				private _diff = getPos _unit;
				_diff set [2, 0];
				_diff = _diff vectorDiff _markerPos;

				private _distSqr = vectorMagnitudeSqr _diff;
				if (_distSqr > setup_zone_area ^ 2) then {
					hintSilent _message;
					_unit setPos (_markerPos vectorAdd (vectorNormalized _diff vectorMultiply (setup_zone_area - 0.01)) select [0, 2]);
					_unit setVelocity [0, 0, 0];
					_sleep = 0.01;
				} else {
					if (_distSqr >= (setup_zone_area * 0.75) ^ 2) then {
						_sleep = 0.1;
					};
				};
			};
			sleep _sleep;
		};

		deleteMarkerLocal _marker;

		if (!_commanderLockTVT) then {
			["Alert", ["Mission is starting!"]] call bis_fnc_showNotification;
		};
	};
};
