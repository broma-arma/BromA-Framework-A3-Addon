/*
================================================================================

NAME:
    BRM_FMK_fnc_callEnding

AUTHOR(s):
    Nife

DESCRIPTION:
    This function will effectively end the mission and call other ending events.

PARAMETERS:
    0 - Ending event that should be called (STRING)

USAGE:
    ["victory"] call BRM_FMK_fnc_callEnding

RETURNS:
    Nothing.

================================================================================
*/

#define END_SCREEN_TIME 15 // Amount of seconds to display the ending screen.

if (!isRemoteExecuted && isMultiplayer || count _this == 1) then {
	if !(isServer && mission_running) exitWith {};

	mission_running = false; publicVariable "mission_running";

	params ["_ending"];

	_this call BRM_FMK_Engine_fnc_getEnding params ["_winningSides", "_losingSides", "_showStats", "_title", "_reason", "_endNumber"];

	private _margin = "N/A";
	if (count _winningSides == 0 && count _losingSides == 0) then {
		private _deathPercent = ["A", "B"];
		if (mission_enable_side_c) then { _deathPercent pushBack "C"; };

		_deathPercent = _deathPercent apply {
			private _deaths = (missionNameSpace getVariable format ["mission_dead_side_%1", _x]);
			private _count = count (missionNameSpace getVariable format ["mission_players_%1", _x]);
			if (_count == 0) then { _count = 1; };

			[floor (_deaths / _count * 100), missionNameSpace getVariable format ["side_%1_side", _x]]

		};
		_deathPercent sort true;

		(_deathPercent select 0) params ["_winnerPercent", "_winner"];

		_winningSides = [_winner];
		_losingSides = (_deathPercent select [1, count _deathPercent]) apply { _x select 1 };
		_margin = switch (true) do {
			case (_winnerPercent >= 100): { "a stalemate" };
			case (_winnerPercent > 80):   { "a pyrrhic" };
			case (_winnerPercent > 20):   { "a marginal" };
			case (_winnerPercent >= 0):   { "an absolute" };
			default                       { "stalemate" };
		};
	};

	private _fnc_formatSide = { format ["<t color='%2'>%1</t>", [_x, "name"] call BRM_FMK_fnc_getSideInfo, [[_x, "color"] call BRM_FMK_fnc_getSideInfo] call BRM_FMK_fnc_colorToHex] };
	_reason = format [_reason,
		[_winningSides apply _fnc_formatSide] call BRM_FMK_fnc_verboseArray,
		[_losingSides apply _fnc_formatSide] call BRM_FMK_fnc_verboseArray,
		_margin
	];

	if (isClass (configFile >> "CfgPatches" >> "OCAP")) then {
		[_winningSides param [0, sideUnknown], _reason, mission_game_mode] call OCAP_fnc_exportData;
	};

	[_ending, _winningSides, _losingSides, _showStats, _title, _reason, _endNumber, _margin] remoteExec ["BRM_FMK_fnc_callEnding", 0];
} else {
	params ["_ending", "_winningSides", "_losingSides", "_showStats", "_title", "_reason", "_endNumber", "_margin"];

	private _isWinner = true;
	if (hasInterface) then {
		player allowDamage false;

		_isWinner = (player call BIS_fnc_objectSide) in _winningSides;

		if (_showStats) then {
			sleep 3;

			if (dialog) then { closeDialog 0 };
			if (visibleMap) then { openMap false; };

			private _lines = [
				"<t size='1.5' font='RobotoCondensedBold'>" + _title + "</t>",
				_reason,
				"",
				"<t align='left' font='RobotoCondensedBold'>Score</t><t font='RobotoCondensedBold'>Time Played</t><t align='right' font='RobotoCondensedBold'>Casualties</t>",
				format ["<t align='left'>%1 kills</t>%2<t align='right'><t color='%3'>%4</t>: %5</t>",
					player getVariable ["unit_score", 0],
					[time, "H:MM:SS"] call CBA_fnc_formatElapsedTime,
					[side_a_color] call BRM_FMK_fnc_colorToHex,
					side_a_name,
					mission_dead_side_a
				],
				format ["<t align='left'>%1 deaths</t><t align='right'><t color='%2'>%3</t>: %4</t>",
					player getVariable ["unit_deaths", 0],
					[side_b_color] call BRM_FMK_fnc_colorToHex,
					side_b_name,
					mission_dead_side_b
				]
			];

			if (mission_enable_side_c) then {
				_lines pushBack (format ["<t align='right'><t color='%1'>%2</t>: %3</t>",
					[side_c_color] call BRM_FMK_fnc_colorToHex,
					side_c_name,
					mission_dead_side_c
				]);
			};

			titleText [_lines joinString "<br />", "BLACK", -1, true, true];
			sleep END_SCREEN_TIME;
			titleFadeOut 1;
		};
	};

	if (isServer) then { sleep 3 };

	[_ending, _isWinner, true] spawn BIS_fnc_endMission;
};
