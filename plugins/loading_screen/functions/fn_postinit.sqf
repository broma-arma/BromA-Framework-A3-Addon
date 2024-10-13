#define CLIENT_FPS_METRIC 10
#define CLIENT_TIMEOUT 5
#define CLIENT_SERVER_TIMEOUT 10

loading_screen_finished = false;

if !(hasInterface && isMultiplayer) exitWith { loading_screen_finished = true; };

0 spawn {
	sleep 0.001; // After briefing

	private _validSlot = if ("prevent_reslot" call BRM_FMK_fnc_isPluginActive) then {
		waitUntil { sleep 0.01; !isNil { player getVariable "BRM_FMK_Plugin_PreventReslot_validSlot" } };

		player getVariable ["BRM_FMK_Plugin_PreventReslot_validSlot", false];
	} else { true };
	if (!_validSlot) exitWith { loading_screen_finished = true; };

	if (visibleMap) then { openMap false; };
	while {dialog} do { closeDialog 0; };

	disableUserInput true;

	[[
		{ diag_fpsMin >= CLIENT_FPS_METRIC }
	], CLIENT_TIMEOUT] call BRM_FMK_Plugin_LoadingScreen_fnc_load;

	if !(missionNamespace getVariable ["BrmFmk_LoadingScreen_loaded", false]) then {
		call BRM_FMK_Plugin_LoadingScreen_fnc_clientLoaded;

		[[
			{ missionNamespace getVariable ["BrmFmk_LoadingScreen_loaded", false] }
		], CLIENT_SERVER_TIMEOUT] call BRM_FMK_Plugin_LoadingScreen_fnc_load;
	};

	titleFadeOut 0.1;
	sleep 0.1;
	disableUserInput false;

	loading_screen_finished = true;
};
