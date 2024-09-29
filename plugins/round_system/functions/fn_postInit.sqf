{
	_x params ["_var", "_default"];
	if (isNil _var) then { missionNamespace setVariable [_var, _default]; };
} forEach [
	["round_prep_time_seconds", 10],
	["round_alerted_minutes", [1, 5, 15]],
	["round_seconds_between", 5],

	["round_side_a_victory_con", "sideAcondition"],
	["round_side_b_victory_con", "sideBcondition"],
	["round_side_c_victory_con", "sideCcondition"],

	["round_timeout_winner", "SCORE"], // Also accept "SCORE" and "DRAW" and a side

	["win_messages_a", ["%1 victory!", "%1 have won the round!"]],
	["win_messages_b", ["%1 victory!", "%1 have won the round!"]],
	["win_messages_c", ["%1 victory!", "%1 have won the round!"]],

	["draw_messages", ["The round has ended in a draw!", "Draw!", "Nobody wins!"]],

	["round_end_notification", "NOTIFICATION"],

	["round_display_score", true],

	["round_setup_size", 10],

	["respawn_markers_A", [format ["respawn_%1", toLower str side_a_side]]],
	["respawn_markers_B", [format ["respawn_%1", toLower str side_b_side]]],
	["respawn_markers_C", [format ["respawn_%1", toLower str side_c_side]]],
];

BRM_round_system_rounds_needed = ["p_round_params", 3] call BIS_fnc_getParamValue; // 1="1", 2="2", 3="3", 4="4", 5="5"
BRM_round_system_time_limit = (["p_round_time_limit", 15] call BIS_fnc_getParamValue) * 60; // 1="1 minute", 5="5 minutes", 15="15 minutes", 30="30 minutes", 60="1 hour", 99999999="No limit"

// Change non-existing "respawn_guer" marker to "respawn_resistance".
if (getMarkerType "respawn_guer" == "") then {
	{
		private _respawnMarkers = missionNamespace getVariable ("respawn_markers_" + _x);
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

	["Timer",[format ["The match begins in %1 seconds!", round_prep_time_seconds]]] call BIS_fnc_showNotification;

	sleep round_prep_time_seconds;

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
