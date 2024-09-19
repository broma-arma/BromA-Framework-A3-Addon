if (!isServer) exitWith {};

0 spawn {
	sleep round_seconds_between;
	setupZoneEnd = true;
	publicVariable "setupZoneEnd";
};

[] call BRM_FMK_Plugin_RoundSystem_fnc_resetRoundVariables;
[] call BRM_FMK_Round_System_fnc_roundStartMission;

round_over = false;

sleep 5;

[side_a_side] spawn BRM_FMK_Plugin_RoundSystem_fnc_CasualtiesCapCheck;
[side_b_side] spawn BRM_FMK_Plugin_RoundSystem_fnc_CasualtiesCapCheck;
if (mission_enable_side_c) then {
	[side_c_side] spawn BRM_FMK_Plugin_RoundSystem_fnc_CasualtiesCapCheck;
};

[] spawn BRM_FMK_Plugin_RoundSystem_fnc_checkRoundEnd;
