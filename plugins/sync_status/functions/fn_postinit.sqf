#include "script_component.hpp"
if !(isMultiplayer) exitWith {};

if (isServer) then {
	BrmFmk_SyncStatus_status = [];
	addMissionEventHandler ["HandleDisconnect", FUNC(saveStatus)];
};

if (hasInterface) then {
	0 spawn {
		waitUntil { !isNil "player_is_spectator" };
		if (!didJIP || player_is_spectator) exitWith {};

		sleep 3;

		player allowDamage false;
		[getPlayerUID player] call FUNC(loadStatus);
		sleep 3;
		player allowDamage true;
	};
};
