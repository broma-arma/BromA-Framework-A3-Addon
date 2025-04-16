#include "../../defines.hpp"

if !(hasInterface) exitWith {};

#include "../../initSettings.sqf"

["nfe_rhea", "open", ["Open", "The key used to open Rhea"], {
	if (isNil "BRM_FMK_RHEA_init") exitWith { false };

	params ["_display", "", "", "", "", "_keybindParams"];
	_keybindParams params ["_keybindKey", "_keybindModifiers"];

	([_display, _keybindKey] + _keybindModifiers) call BRM_FMK_RHEA_fnc_open;

	true
}, { false }, [DIK_END, [false, false, false]], false] call CBA_fnc_addKeybind;
