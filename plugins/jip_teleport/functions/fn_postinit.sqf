#include "script_component.hpp"
#define MIN_DISTANCE_SQD	10000	// Min distance, squared, to teleport.
#define TIMEOUT				300		// Amount of time, in seconds, the player has to teleport.

if !(hasInterface && isMultiplayer && didJIP) exitWith {};

0 spawn {
	if ("prevent_reslot" in BRM_plugins) then {
		waitUntil { player getVariable ["unit_valid_slot", false] };
	};

	GVAR(timeout) = TIMEOUT;

	private _actionId = player addAction ["Teleport to squad/allies", {
		params ["_target", "_caller", "_id", "_args"];

		private _targets = (
			([leader player] + (units player) + (allPlayers - entities "HeadlessClient_F")) select {
				_x != player
				&& alive _x
				&& side _x == playerSide
				&& player distanceSqr _x >= MIN_DISTANCE_SQD
				&& !(_x getVariable ["isDead", false])
				&& !(_x getVariable ["ACE_isUnconscious", false])
			}
		);
		_targets = _targets arrayIntersect _targets; // Unique

		if (count _targets == 0) exitWith {
			GVAR(timeout) = 0;
			["Nobody to teleport to.", "Teleport"] spawn BIS_fnc_guiMessage;
		};

		private _teleported = {
			private _vehicle = vehicle _x;
			private _moved = if (_x != _vehicle) then {
				player moveInAny _vehicle
			} else {
				private _position = getPosATL _x findEmptyPosition [1, 30, typeOf player];
				if (count _position > 0) exitWith {
					player setPosATL _position;
					true
				};

				false
			};

			if (_moved) exitWith {true};

			false
		} forEach _targets;

		GVAR(timeout) = if (_teleported) then {
			0
		} else {
			["Failed to teleport, try again later.", "Teleport"] spawn BIS_fnc_guiMessage;

			TIMEOUT
		};
	}, nil, 1.5, false, true, "", QUOTE(GVAR(timeout) > 0)];

	cutText ["Use the action menu within the next 5 minutes to teleport to your squad/allies.", "PLAIN DOWN", 0.3];
	while {GVAR(timeout) > 0} do {
		sleep 5;
		GVAR(timeout) = GVAR(timeout) - 5;
	};
	player removeAction _actionId;
	GVAR(timeout) = nil;
};
