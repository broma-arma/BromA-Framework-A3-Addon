{
	_x params ["_var", "_default"];
	if (isNil _var) then { missionNamespace setVariable [_var, _default]; };
} forEach [
	["vanillaspectator_whitelisted_sides", []],
	["vanillaspectator_can_view_AI", true],
	["vanillaspectator_free_camera_available", true],
	["vanillaspectator_third_person_available", true],
	["vanillaspectator_show_focus_available", true],
	["vanillaspectator_show_buttons", true],
	["vanillaspectator_show_controls", true],
	["vanillaspectator_show_header", true],
	["vanillaspectator_show_entities", true]
];

["BRM_FMK_DisplayLoad_EGSpectator", {
	if (vanillaspectator_can_view_AI) then {
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
