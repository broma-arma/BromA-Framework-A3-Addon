#include "script_component.hpp"
mission_setup_time = [15, 60, 180, 300, 600] select (["p_setup_time", 0] call BIS_fnc_getParamValue);

if (mission_game_mode == "coop") exitWith {};

0 spawn {
	waitUntil { !isNil "mission_setup_time" && !isNil "BRM_plugins" };

	[] call FUNC(getSettings) params ["_area"];

	private _commanderLockTVT = false;
	if ("commander_lock" in BRM_plugins) then {
		waitUntil { !isNil "co_lock_tvt_mode" };

		_commanderLockTVT = co_lock_tvt_mode;
	};

	if (isServer) then {
		GVAR(active) = true;
		publicVariable QGVAR(active);

		_commanderLockTVT spawn {
			if (_this) then {
				waitUntil { !isNil "co_lock_allSidesReady" && {co_lock_allSidesReady} };
			} else {
				sleep mission_setup_time;
			};

			GVAR(active) = false;
			publicVariable QGVAR(active);
		};
	};

	if (hasInterface) then {
		waitUntil { !isNil QGVAR(active) };

		if (!GVAR(active)) exitWith {};

		if (isMultiplayer) then {
			if ("intros" in BRM_plugins) then {
				waitUntil { !isNil "intro_cutscene_over" && {intro_cutscene_over} };
			};
			if ("loading_screen" in BRM_plugins) then {
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

		private _markerPos = getMarkerPos ([player] call FUNCMAIN(getSpawnPoint));
		private _marker = createMarkerLocal ["setupZone", _markerPos];
		_marker setMarkerDirLocal 0;
		_marker setMarkerShapeLocal "ELLIPSE";
		_marker setMarkerSizeLocal [_area, _area];
		_marker setMarkerBrushLocal "Border";
		_marker setMarkerColorLocal ("Color" + ([side player, "color"] call FUNCMAIN(getSideInfo)));

		private _message = "You cannot leave the setup area until the time is over.";
		if (_commanderLockTVT) then {
			_message = "Wait until all sides are ready to start.";
		};

		while {GVAR(active)} do {
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
				if (_distSqr > _area ^ 2) then {
					hintSilent _message;
					_unit setPos (_markerPos vectorAdd (vectorNormalized _diff vectorMultiply (_area - 0.01)) select [0, 2]);
					_unit setVelocity [0, 0, 0];
					_sleep = 0.01;
				} else {
					if (_distSqr >= (_area * 0.75) ^ 2) then {
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
