if !(isMultiplayer) exitWith {};

if (isServer) then {
	BrmFmk_SyncStatus_status = createHashMap;
	addMissionEventHandler ["HandleDisconnect", { _this call BRM_FMK_SyncStatus_fnc_saveStatus }];
};

if (hasInterface && didJIP) then {
	0 spawn {
		waitUntil { player getVariable ["unit_initialized", false] };

		if (!player_is_spectator) then {
			[getPlayerUID player] call BRM_FMK_SyncStatus_fnc_loadStatus;
		};
	};
};
