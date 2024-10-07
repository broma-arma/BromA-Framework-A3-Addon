private _startDelay = 10;
private _remainderAlert = [1, 5, 15];
private _roundDelay = 5;

private _victoryA = "sideAcondition";
private _victoryB = "sideBcondition";
private _victoryC = "sideCcondition";

private _timeoutScoring = "SCORE"; // Also accept "SCORE" and "DRAW" and a side

private _victoryMessageA = ["%1 victory!", "%1 have won the round!"];
private _victoryMessageB = ["%1 victory!", "%1 have won the round!"];
private _victoryMessageC = ["%1 victory!", "%1 have won the round!"];

private _drawMessage = ["The round has ended in a draw!", "Draw!", "Nobody wins!"];

private _roundEndAlertType = "NOTIFICATION";

private _displayScore = true;

private _setupRadius = 10;

private _respawnMarkersA = [format ["respawn_%1", toLower str side_a_side]];
private _respawnMarkersB = [format ["respawn_%1", toLower str side_b_side]];
private _respawnMarkersC = [format ["respawn_%1", toLower str side_c_side]];

if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "round_prep_time_seconds") then { _startDelay = round_prep_time_seconds; };
	if (!isNil "round_alerted_minutes") then { _remainderAlert = round_alerted_minutes apply { _x * 60 }; };
	if (!isNil "round_seconds_between") then { _roundDelay = round_seconds_between; };

	if (!isNil "round_side_a_victory_con") then { _victoryA = compile round_side_a_victory_con; };
	if (!isNil "round_side_b_victory_con") then { _victoryB = compile round_side_b_victory_con; };
	if (!isNil "round_side_c_victory_con") then { _victoryC = compile round_side_c_victory_con; };

	if (!isNil "round_timeout_winner") then { _timeoutScoring = round_timeout_winner; };

	if (!isNil "win_messages_a") then { _victoryMessageA = win_messages_a; };
	if (!isNil "win_messages_b") then { _victoryMessageB = win_messages_b; };
	if (!isNil "win_messages_c") then { _victoryMessageC = win_messages_c; };

	if (!isNil "draw_messages") then { _drawMessage = draw_messages; };

	if (!isNil "round_end_notification") then { _roundEndAlertType = round_end_notification; };

	if (!isNil "round_display_score") then { _displayScore = round_display_score; };

	if (!isNil "round_setup_size") then { _setupRadius = round_setup_size; };

	if (!isNil "respawn_markers_A") then { _respawnMarkersA = respawn_markers_A; };
	if (!isNil "respawn_markers_B") then { _respawnMarkersB = respawn_markers_B; };
	if (!isNil "respawn_markers_C") then { _respawnMarkersC = respawn_markers_C; };
} else {
	if (fileExists "mission\settings\plugins\round_system.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\round_system.sqf";
	};
};

BRM_FMK_Plugin_RoundSystem_startDelay = _startDelay;
BRM_FMK_Plugin_RoundSystem_remainderAlert = _remainderAlert;
BRM_FMK_Plugin_RoundSystem_roundDelay = _roundDelay;

BRM_FMK_Plugin_RoundSystem_victoryA = _victoryA;
BRM_FMK_Plugin_RoundSystem_victoryB = _victoryB;
BRM_FMK_Plugin_RoundSystem_victoryC = _victoryC;

BRM_FMK_Plugin_RoundSystem_timeoutScoring = _timeoutScoring;

BRM_FMK_Plugin_RoundSystem_victoryMessageA = _victoryMessageA;
BRM_FMK_Plugin_RoundSystem_victoryMessageB = _victoryMessageB;
BRM_FMK_Plugin_RoundSystem_victoryMessageC = _victoryMessageC;

BRM_FMK_Plugin_RoundSystem_drawMessage = _drawMessage;

BRM_FMK_Plugin_RoundSystem_roundEndAlertType = _roundEndAlertType;

BRM_FMK_Plugin_RoundSystem_displayScore = _displayScore;

BRM_FMK_Plugin_RoundSystem_setupRadius = _setupRadius;

BRM_FMK_Plugin_RoundSystem_respawnMarkersA = _respawnMarkersA;
BRM_FMK_Plugin_RoundSystem_respawnMarkersB = _respawnMarkersB;
BRM_FMK_Plugin_RoundSystem_respawnMarkersC = _respawnMarkersC;

BRM_FMK_Plugin_RoundSystem_roundsNeeded = ["p_round_params", 3] call BIS_fnc_getParamValue; // 1="1", 2="2", 3="3", 4="4", 5="5"
BRM_FMK_Plugin_RoundSystem_timeLimit = (["p_round_time_limit", 15] call BIS_fnc_getParamValue) * 60; // 1="1 minute", 5="5 minutes", 15="15 minutes", 30="30 minutes", 60="1 hour", 99999999="No limit"

// Change non-existing "respawn_guer" marker to "respawn_resistance".
if (getMarkerType "respawn_guer" == "") then {
	{
		private _respawnMarkers = missionNamespace getVariable ("BRM_FMK_Plugin_RoundSystem_respawnMarkers" + _x);
		private _guerIndex = _respawnMarkers find "respawn_guer";
		if (_guerIndex != -1) then {
			if !("respawn_resistance" in _respawnMarkers) then {
				_respawnMarkers set [_guerIndex, "respawn_resistance"];
			} else {
				_respawnMarkers deleteAt _guerIndex;
			};
		};
	} forEach ["A", "B", "C"];
};

// =============================================================================
// CODE TO BE EXECUTED DURING INIT
// =============================================================================

if (isServer) then {
// =============================================================================
// SERVER CODE
// =============================================================================

	[] call BRM_FMK_Plugin_RoundSystem_fnc_setMatchVariables;

	addMissionEventHandler ["EntityKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		private _i = [side_a_side, side_b_side, side_c_side] find (_unit call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Plugin_RoundSystem_roundDeaths set [_i, BRM_FMK_Plugin_RoundSystem_roundDeaths#_i + 1];
		};
	}];

// =============================================================================
};

if (hasInterface) then {
// =============================================================================
// PLAYER CODE
// =============================================================================



// =============================================================================
};

0 spawn {

	sleep 0.1;
// =============================================================================
// CODE TO BE EXECUTED IN-GAME:
// =============================================================================

	player allowDamage false;

	sleep 3;

	["Timer",[format ["The match begins in %1 seconds!", BRM_FMK_Plugin_RoundSystem_startDelay]]] call BIS_fnc_showNotification;

	sleep BRM_FMK_Plugin_RoundSystem_startDelay;

	if (isServer) then {
	// =========================================================================
	// SERVER CODE
	// =========================================================================

		[] call BRM_FMK_Plugin_RoundSystem_fnc_roundStart;

	// =========================================================================
	};

	if (hasInterface) then {
	// =========================================================================
	// PLAYER CODE
	// =========================================================================

		[] call BRM_FMK_Plugin_RoundSystem_fnc_roundStartPlayer;

	// =========================================================================
	};
};
