if (mission_game_mode == "coop") exitWith {};

if (isNil "setup_zone_area") then {
	setup_zone_area = 50;
};

0 spawn {
	// 0="15 seconds", 1="1 minute", 2="3 minutes", 3="5 minutes", 4="10 minutes"
	private _setupTime = [15, 60, 180, 300, 600] select (["p_setup_time", 0] call BIS_fnc_getParamValue);

	private _commanderLockTVT = false;
	if ("commander_lock" call BRM_FMK_fnc_isPluginActive) then {
		waitUntil { !isNil "co_lock_tvt_mode" };

		_commanderLockTVT = co_lock_tvt_mode;
	};

	if (isServer) then {
		BRM_FMK_Setup_Zone_active = true;
		publicVariable "BRM_FMK_Setup_Zone_active";

		[_setupTime, _commanderLockTVT] spawn {
			params ["_setupTime", "_commanderLockTVT"];

			if (_commanderLockTVT) then {
				waitUntil { missionNamespace getVariable ["co_lock_allSidesReady", false] };
			} else {
				sleep _setupTime;
			};

			BRM_FMK_Setup_Zone_active = false;
			publicVariable "BRM_FMK_Setup_Zone_active";
		};
	};

	if (hasInterface) then {
		waitUntil { !isNil "BRM_FMK_Setup_Zone_active" };

		if (!BRM_FMK_Setup_Zone_active) exitWith {};

		if (isMultiplayer) then {
			if ("intros" call BRM_FMK_fnc_isPluginActive) then {
				waitUntil { !isNil "intro_cutscene_over" && {intro_cutscene_over} };
			};
			if ("loading_screen" call BRM_FMK_fnc_isPluginActive) then {
				waitUntil { !isNil "loading_screen_finished" && {loading_screen_finished} };
			};
		};

		if (_commanderLockTVT) then {
			["Alert", ["The mission will begin when all teams are ready."]] call BIS_fnc_showNotification;
		} else {
			["MissionBegins", [
				if (_setupTime < 60) then {
					format ["%1 seconds", _setupTime]
				} else {
					format ["%1 minutes", floor (_setupTime / 60)]
				}
			]] call BIS_fnc_showNotification;
		};

		private _markerPos = getMarkerPos ([player] call BRM_FMK_Engine_fnc_getSpawnPoint);
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
