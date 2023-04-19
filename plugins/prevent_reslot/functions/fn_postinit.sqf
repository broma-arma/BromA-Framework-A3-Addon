#include "script_component.hpp"
if (isServer) then {
	mission_player_slots = [];
	publicVariable "mission_player_slots";
};

if (hasInterface) then {
	["LOCAL", "F_LOG", "LOADED SLOT PREVENTION PLUGIN"] call FUNCMAIN(doLog);

	if (player_is_spectator) exitWith {};

	0 spawn {
		waitUntil { !isNil "mission_player_slots" };

		private _index = -1;

		{
			_x params ["_uid", "_var", "_name", "_rosterAlias"];

			if (_uid == getPlayerUID player) exitWith {
				_index = _forEachIndex;
			};
			if (_var == str player) exitWith {
				_index = (-_forEachIndex - 2); // 0=-2, 1=-3, 2=-4, ...
			};
		} forEach mission_player_slots;

		if (_index == -1) exitWith {
			player setVariable ["unit_valid_slot", true, true];
			sleep ([] call FUNC(getSettings) select 0);

			["Alert", ["Your slot has been locked for the remainder of the mission."]] call BIS_fnc_showNotification;

			mission_player_slots pushBack [getplayerUID player, str player, name player, player getVariable "rosterAlias"];
			publicVariable "mission_player_slots";
		};

		private _fnc_slotTaken = {
			params ["_name", ["_newPlayer", true]];

			player setVariable ["unit_valid_slot", false, true];
			player enableSimulation false;
			closeDialog 0;
			sleep 5;

			(if (_newPlayer) then {
				["ENDING MISSION - RESLOTTED AS TAKEN SLOT",
				"The slot you're trying to join as is currently taken by %1 - please select a different one.",
				"The slot you're trying to join as is currently taken by %1 - please select a different one."]
			} else {
				["ENDING MISSION - RESLOTTED AS A DIFFERENT UNIT",
				"You are choosing a different slot from your original one.\n\nPlease reslot as %1.",
				"You are choosing a different slot from your original one. Please reslot as %1."]
			}) params ["_fLog", "_titleText", "_chat"];

			["LOCAL", "F_LOG", _fLog] call FUNCMAIN(doLog);
			titleText [format [_titleText, _name], "BLACK FADED"];
			["LOCAL", "CHAT", format [_chat, _name]] call FUNCMAIN(doLog);

			sleep 10;
			findDisplay 46 closeDisplay 0;
		};

		if (_index >= 0) then { // Player has a valid slot
			if (str player == ((mission_player_slots select _index) select 1)) then {
				player setVariable ["unit_valid_slot", true, true];
			} else { // Not this slot
				[(mission_player_slots select _index) select 3, false] call _fnc_slotTaken;
			};
		} else { // Slot already taken
			[(mission_player_slots select (-_index - 2)) select 2] call _fnc_slotTaken;
		};
	};
};
