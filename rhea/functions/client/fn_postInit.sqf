#include "../../defines.hpp"

if !(hasInterface) exitWith {};

[{ !isNil "BRM_FMK_RHEA_init" }, {
	INFO_1("Started Rhea @ %1", time);

	["BRM_FMK_RHEA_zeusStarted", {
		params ["_errorCode"];

		switch (_errorCode) do {
			case 0: { ["Zeus started", "FFFFFF"] call BRM_FMK_RHEA_fnc_message; };
			case 1: { "Cannot start Zeus, internal error" call BRM_FMK_RHEA_fnc_message; };
			case 2: { "Cannot start Zeus, not logged in" call BRM_FMK_RHEA_fnc_message; };
			case 3: { "Zeus already started" call BRM_FMK_RHEA_fnc_message; };
			case 4: { "Cannot start Zeus, no available slot" call BRM_FMK_RHEA_fnc_message; };
		};
	}] call CBA_fnc_addEventHandler;

	["BRM_FMK_RHEA_zeusStopped", {
		params ["_errorCode"];

		switch (_errorCode) do {
			case 0: { ["Zeus stopped", "FFFFFF"] call BRM_FMK_RHEA_fnc_message; };
			case 1: { "Cannot stop Zeus, internal error" call BRM_FMK_RHEA_fnc_message; };
			case 2: { "Cannot stop Zeus, not a Zeus" call BRM_FMK_RHEA_fnc_message; };
			case 3: { "Cannot stop Zeus, not a Rhea zeus" call BRM_FMK_RHEA_fnc_message; };
		};
	}] call CBA_fnc_addEventHandler;

	["BRM_FMK_RHEA_receiveMessage", { _this call BRM_FMK_RHEA_fnc_receiveMessage; }] call CBA_fnc_addEventHandler;

	["ace_spectator_displayLoaded", { _this call BRM_FMK_RHEA_fnc_initDisplay; }] call CBA_fnc_addEventHandler;

	[player, ""] remoteExec ["BRM_FMK_RHEA_SERVER_fnc_loginPlayer", 2];
}] call CBA_fnc_waitUntilAndExecute;
