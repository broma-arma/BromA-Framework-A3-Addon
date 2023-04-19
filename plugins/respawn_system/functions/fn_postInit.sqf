#include "script_component.hpp"
mission_allow_respawn = ["p_allow_respawn", 0] call BIS_fnc_getParamValue > 0;
mission_player_lives = ["p_player_lives", -1] call BIS_fnc_getParamValue;
mission_respawn_objective = ["p_respawn_objective", -1] call BIS_fnc_getParamValue;

if (hasInterface) then {
	[QGVAR(respawn), {
		if (player getVariable ["isDead", false]) then {
			player setVariable ["isDead", false, true];

			[player] call FUNCMAIN(endSpectator);

			[{
				[player] joinSilent (player getVariable ["respawnGroup", ""] call BIS_fnc_groupFromNetId);
			}, [], 5] call CBA_fnc_waitAndExecute;
		};
	}] call CBA_fnc_addEventHandler;

	if (!player_is_spectator) then {
		[{ !isNil "mission_player_lives" }, {
			player addEventHandler ["Respawn", { _this call FUNC(onRespawn) }];

			if ([player] call FUNC(getLives) == 0) then {
				[player] call FUNC(removeFromMission);
			};
		},[]] call CBA_fnc_waitUntilAndExecute;
	};
};
