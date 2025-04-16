#include "../../defines.hpp"

TRACE_1("fn_initDisplay: %1", _this);

params ["_display"];

_display displayAddEventHandler ["KeyDown", {
	params ["_display", "_key", "_shift", "_ctrl", "_alt"];

	private _input = [_key, [_shift, _ctrl, _alt]];
	private _keybind = (["nfe_rhea", "open"] call CBA_fnc_getKeybind);
	if (!isNil "_keybind" && { _keybind select 8 findIf { _x isEqualTo _input } != -1 }) exitWith {
		[_display] call BRM_FMK_RHEA_fnc_open;

		true
	};

	false
}];
