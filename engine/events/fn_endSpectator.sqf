#include "component.hpp"
/*

    Ends spectator mode.

*/

(_this select 0) spawn {
	switch (true) do {
		case ("ace3_spectator" in usedPlugins): {
			[false] call ace_spectator_fnc_setSpectator;
		};
		case ("vanilla_spectator" in usedPlugins): {
			["Terminate"] call BIS_fnc_EGSpectator;
		};
	};

	if (mission_TFAR_enabled) then {
		_this setVariable ["tf_unable_to_use_radio", false];
	};

	titleText ["You are respawning...", "BLACK FADED", 0];
	sleep 3;
	titleFadeOut 1;

	_this allowDamage true;

	if (dialog) then { closeDialog 0; };
};
