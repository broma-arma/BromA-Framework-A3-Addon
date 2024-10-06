if !(isMultiplayer) exitWith {};

if (isServer) then {
	BrmFmk_SyncStatus_status = createHashMap;
	addMissionEventHandler ["HandleDisconnect", { _this call BRM_FMK_Plugin_SyncStatus_fnc_saveStatus }];
};

if (hasInterface && didJIP) then {
	0 spawn {
		waitUntil { player getVariable ["unit_initialized", false] };

		if !(player isKindOf "VirtualSpectator_F") then {
			[getPlayerUID player] call BRM_FMK_Plugin_SyncStatus_fnc_loadStatus;
		};
	};
};
