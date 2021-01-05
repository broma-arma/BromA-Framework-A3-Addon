#include "component.hpp"

if !(isMultiplayer) exitWith {};

if (isServer) then {
	BrmFmk_SyncStatus_status = [];
	addMissionEventHandler ["HandleDisconnect", BRM_FMK_SyncStatus_fnc_saveStatus];
};

if (hasInterface) then {
	0 spawn {
		waitUntil { !isNil "player_is_spectator" };
		if (!didJIP || player_is_spectator) exitWith {};

		sleep 3;

		player allowDamage false;
		[getPlayerUID player] call BRM_FMK_SyncStatus_fnc_loadStatus;
		sleep 3;
		player allowDamage true;
	};
};
