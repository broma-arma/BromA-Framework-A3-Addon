#define CLIENT_FPS_METRIC 10
#define CLIENT_TIMEOUT 5

loading_screen_finished = false;

if !(hasInterface && isMultiplayer) exitWith { loading_screen_finished = true; };

0 spawn {
	sleep 1; // After briefing

	disableUserInput true;
	titleText ["Please wait in order to allow the game to load properly.", "BLACK FADED", 0];

	[[
		{ diag_fpsMin >= CLIENT_FPS_METRIC }
	], CLIENT_TIMEOUT] call BRM_FMK_LoadingScreen_fnc_load;

	if (isNil "BrmFmk_LoadingScreen_loaded" || {!BrmFmk_LoadingScreen_loaded}) then {
		call BRM_FMK_LoadingScreen_fnc_clientLoaded;

		waitUntil { !isNil "BrmFmk_LoadingScreen_loaded" && {BrmFmk_LoadingScreen_loaded} };
	};

	disableUserInput false;
	titleText ["", "PLAIN"];

	loading_screen_finished = true;
};
