#include "script_component.hpp"
[QGVARMAIN(DisplayLoad_EGSpectator), {
	if ([] call FUNC(getSettings) select 1) then { // Allow AI
		params ["_display"];

		_display displayAddEventHandler ["KeyDown", {
			params ["_display", "_key", "_shift", "_ctrl", "_alt"];

			private _input = [_key, [_shift, _ctrl, _alt]];
			private _keybind = (["BromA", "EGSpectator_ToggleAI"] call CBA_fnc_getKeybind);
			if (!isNil "_keybind" && { _keybind select 8 findIf { _x isEqualTo _input } != -1 }) exitWith {
				missionNamespace setVariable ["BIS_EGSpectator_allowAiSwitch", !(missionNamespace getVariable ["BIS_EGSpectator_allowAiSwitch", true])];

				true
			};

			false
		}];
	};
}] call CBA_fnc_addEventHandler;

[["BromA", "Spectator"], "EGSpectator_ToggleAI", ["Toggle AI", "Toggle's the AI markers in spectator"], { false }, { false }, [/*DIK_P*/25, [false, false, false]], false] call CBA_fnc_addKeybind;
