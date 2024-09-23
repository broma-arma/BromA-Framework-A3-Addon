BRM_round_system_rounds_needed = ["p_round_params", 3] call BIS_fnc_getParamValue; // 1="1", 2="2", 3="3", 4="4", 5="5"

BRM_round_system_time_limit = ["p_round_time_limit", 15] call BIS_fnc_getParamValue; // 1="1 minute", 5="5 minutes", 15="15 minutes", 30="30 minutes", 60="1 hour", 99999999="No limit"
BRM_round_system_time_limit = (BRM_round_system_time_limit * 60);

#include "includes\settings.sqf"

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
