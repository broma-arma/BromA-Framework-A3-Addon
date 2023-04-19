#include "script_component.hpp"
#define SERVER_FPS_METRIC 20
#define SERVER_TIMEOUT 5

if !(isServer) exitWith {
	0 remoteExec [QFUNC(clientLoaded), 2];
};

if (isNil "BrmFmk_LoadingScreen_count") then {
	BrmFmk_LoadingScreen_count = 0;
};

if (BrmFmk_LoadingScreen_count != -1) then {
	BrmFmk_LoadingScreen_count = BrmFmk_LoadingScreen_count + 1;

	private _allPlayers = (allUnits + allDead) select {isPlayer _x}; // Note: 'allPlayers' cannot be used here.
	if (BrmFmk_LoadingScreen_count >= count _allPlayers) then {
		BrmFmk_LoadingScreen_count = -1;
		0 spawn {
			private _metrics = [
				{ diag_fpsMin >= SERVER_FPS_METRIC }
			];

			if ("dac_plugin" in BRM_plugins) then {
				_metrics pushBack { !isNil "DAC_Basic_Value" && {DAC_Basic_Value > 0} };
			};

			[_metrics, SERVER_TIMEOUT] call FUNC(load);

			BrmFmk_LoadingScreen_loaded = true;
			publicVariable "BrmFmk_LoadingScreen_loaded";

			loading_screen_finished = true;
		};
	};
};
