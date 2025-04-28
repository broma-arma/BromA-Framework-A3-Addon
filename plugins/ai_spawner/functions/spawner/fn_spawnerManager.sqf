#include "..\defines.inc"
/* ----------------------------------------------------------------------------
Function: BRM_FMK_Plugin_AIS_fnc_spawnerManager

Description:
	Start the spawner manager.

Parameters:
	None

Returns:
	Nothing

Author:
	Royal, Coryf88
---------------------------------------------------------------------------- */

if (!mission_ai_controller) exitWith {};

if (!isNil "BRM_FMK_Plugin_AIS_spawnerManager" && { !isNull BRM_FMK_Plugin_AIS_spawnerManager }) exitWith {};

BRM_FMK_Plugin_AIS_spawnerManager = 0 spawn {
	while { true } do {
		private _deleted = [];

		{
			private _id = _x;

			private _pause = _y get "pause";
			if (_pause isEqualTo true) then {
				continue;
			};
			if (_pause isEqualType 0) then {
				if (_pause > time) then {
					continue;
				} else {
					_y set ["pause", false];
				};
			};

			private _config = _y get "config";

			private _fnc_spawner = missionNamespace getVariable format ["BRM_FMK_Plugin_AIS_fnc_%1Spawner", CONFIG_TYPE];

			private _state = _y get "state";
			switch (_state) do {
				case SPAWNER_CREATED: {
					[_state, _x, _y] call _fnc_spawner;
					_y set ["state", SPAWNER_DELAYSTART];
				};
				case SPAWNER_DELAYSTART: {
					if (call CONFIG_START) then {
						_y set ["state", SPAWNER_INIT];
					};
				};
				case SPAWNER_INIT: {
					[_state, _x, _y] call _fnc_spawner;
					_y set ["state", SPAWNER_TICK];
				};
				case SPAWNER_TICK: {
					if (call CONFIG_END) then {
						_y set ["state", SPAWNER_DELETE];
					} else {
						private _result = [_state, _x, _y] call _fnc_spawner;
						if (!isNil "_result") then {
							if (_result isEqualTo true) then {
								_y set ["state", SPAWNER_DELETE];
							};
							if (_result isEqualType 0 && { _result > 0 }) then {
								_y set ["pause", time + _result];
							};
						};
					};
				};
				case SPAWNER_DELETE: {
					[_state, _x, _y] call _fnc_spawner;

					if (BRM_FMK_Plugin_AIS_debug) then {
						systemChat format ["Spawner %1 has been deleted!", _id];
						{ deleteMarker _x; } forEach (allMapMarkers select { _x find _id != -1 }); // TODO Have _fnc_spawner handle deleting it's markers
					};

					private _cleanup = CONFIG_SETTINGS select 0;
					if (_cleanup >= 0) then {
						_y set ["state", SPAWNER_CLEANUP];
					} else {
						_y set ["state", SPAWNER_DEAD];
						_deleted pushBack _x;
					};
				};
				case SPAWNER_CLEANUP: {
					[_state, _x, _y] call _fnc_spawner;

					private _cleanup = CONFIG_SETTINGS select 0;
					private _groups = _y get "groups";

					if (count _groups > 0) then {
						{
							if (_cleanup > 0 && { [leader _x, _cleanup] call BRM_FMK_Plugin_AIS_fnc_isPlayerNear }) then {
								continue;
							};

							_groups deleteAt _forEachIndex;

							{ deleteVehicle _x; } forEach units _x;
							deleteGroup _x;
						} forEachReversed _groups;
						_y set ["pause", time + 10];
					} else {
						_y set ["state", SPAWNER_DEAD];
						_deleted pushBack _x;
					};
				};
			};
		} forEach BRM_FMK_Plugin_AIS_spawners;

		{ BRM_FMK_Plugin_AIS_spawners deleteAt _x; } forEach _deleted;

		sleep 1;
	};
};
