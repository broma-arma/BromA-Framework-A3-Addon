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

	private _endings = [];

	// Server reads all mission-related ending cases.
	if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare <= 0) then {
		[_ending] call compile preprocessFileLineNumbers "mission\settings\endings.sqf";
		_endings = mission_ending_details;
	} else {
		private _cfgEndings = [["BRM_FMK_Endings", _ending], configNull] call BIS_fnc_loadClass;
		_endings = [
			getArray (_cfgEndings >> "winners") apply { missionNamespace getVariable format ["side_%1_side", _x] },
			getArray (_cfgEndings >> "losers") apply { missionNamespace getVariable format ["side_%1_side", _x] },
			missionNamespace getVariable ["mission_ending_stats", true],
			getText (_cfgEndings >> "title"),
			getText (_cfgEndings >> "reason")
		];
	};

	// Server processes all mission relevant stats.
	_endings params ["_winningSides", "_losingSides", "_showStats", "_title", "_reason"];

	if (!mission_enable_side_c) then {
		_winningSides = _winningSides - [side_c_side];
		_losingSides = _losingSides - [side_c_side];
	};

	private _margin = "N/A";
	if (count _winningSides == 0 && count _losingSides == 0) then {
		private _deathPercent = ["A", "B"];
		if (mission_enable_side_c) then { _deathPercent pushBack "C"; };

		_deathPercent = _deathPercent apply {
			private _deaths = (missionNamespace getVariable format ["mission_dead_side_%1", _x]);
			private _count = count (missionNamespace getVariable format ["mission_players_%1", _x]);
			if (_count == 0) then { _count = 1; };

			[floor (_deaths / _count * 100), missionNamespace getVariable format ["side_%1_side", _x]]

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

	[_ending, _winningSides, _losingSides, _showStats, _title, _reason, _margin] remoteExec ["BRM_FMK_fnc_callEnding", 0];
} else {
	params ["_ending", "_winningSides", "_losingSides", "_showStats", "_title", "_reason", "_margin"];

	private _isWinner = true;
	if (hasInterface) then {
		player allowDamage false;

		_isWinner = (player getVariable ["unit_side", side player]) in _winningSides;

		if (_showStats) then {
			sleep 3;

			if (dialog) then { closeDialog 0 };
			if (visibleMap) then { openMap false; };

			private _fnc_formatSide = {
				format ["<t color='%2'>%1</t>", [_x, "name"] call BRM_FMK_fnc_getSideInfo, [[_x, "color"] call BRM_FMK_fnc_getSideInfo] call BRM_FMK_fnc_colorToHex]
			};

			private _lines = [
				format ["<t size='1.5' font='RobotoCondensedBold'>%1</t>",
					_title
				],
				format [_reason,
					[_winningSides apply _fnc_formatSide] call BRM_FMK_fnc_verboseArray,
					[_losingSides apply _fnc_formatSide] call BRM_FMK_fnc_verboseArray,
					_margin
				],
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

			// ShackTac User Interface
			private _hasSTUI = !isNull (uiNamespace getVariable ["STUI_Canvas", controlNull]);
			if (_hasSTUI) then {
				(uiNamespace getVariable "STUI_Canvas") ctrlSetFade 1;
				(uiNamespace getVariable "STUI_Canvas") ctrlCommit 0;
			};

			titleText [_lines joinString "<br />", "BLACK", -1, true, true];
			sleep END_SCREEN_TIME;
			titleFadeOut 1;

			if (_hasSTUI) then {
				(uiNamespace getVariable "STUI_Canvas") ctrlSetFade 0;
				(uiNamespace getVariable "STUI_Canvas") ctrlCommit 0;
			};
		};
	};

	if (isServer) then {
		if (_showStats) then {
			sleep 3 + END_SCREEN_TIME;
		};
		sleep 3;
	};

	if (isNull ([["CfgDebriefing", _ending], configNull] call BIS_fnc_loadClass)) then {
		_ending = ["defeat", "victory"] select _isWinner;
	};

	if ([BRM_version, [0, 7, 5]] call BRM_FMK_fnc_versionCompare > 0) then {
		private _cfgDebriefing = [["BRM_FMK_Endings", _ending, "Debriefing"], configNull] call BIS_fnc_loadClass;
		_ending setDebriefingText (["title", "description", "subtitle", "picture", "background"] apply { getText (_cfgDebriefing >> _x) });
	};
	[_ending, _isWinner, true] spawn BIS_fnc_endMission;
};
