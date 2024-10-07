private _whitelistedSides = [];
private _allowAi = true;
private _allowFreeCamera = true;
private _allow3PPCamera = true;
private _showFocusInfo = true;
private _showCameraButtons = true;
private _showControlsHelper = true;
private _showHeader = true;
private _showLists = true;
if (BRM_FMK_Engine_compatVersion == 0) then {
	if (!isNil "vanillaspectator_whitelisted_sides") then { _whitelistedSides = vanillaspectator_whitelisted_sides; };
	if (!isNil "vanillaspectator_can_view_AI") then { _allowAi = vanillaspectator_can_view_AI; };
	if (!isNil "vanillaspectator_free_camera_available") then { _allowFreeCamera = vanillaspectator_free_camera_available; };
	if (!isNil "vanillaspectator_third_person_available") then { _allow3PPCamera = vanillaspectator_third_person_available; };
	if (!isNil "vanillaspectator_show_focus_available") then { _showFocusInfo = vanillaspectator_show_focus_available; };
	if (!isNil "vanillaspectator_show_buttons") then { _showCameraButtons = vanillaspectator_show_buttons; };
	if (!isNil "vanillaspectator_show_controls") then { _showControlsHelper = vanillaspectator_show_controls; };
	if (!isNil "vanillaspectator_show_header") then { _showHeader = vanillaspectator_show_header; };
	if (!isNil "vanillaspectator_show_entities") then { _showLists = vanillaspectator_show_entities; };
} else {
	if (fileExists "mission\settings\plugins\vanilla_spectator.sqf") then {
		call compile preprocessFileLineNumbers "mission\settings\plugins\vanilla_spectator.sqf";
	};
};

BRM_FMK_Plugin_VanillaSpectator_settings = [_whitelistedSides, _allowAi, _allowFreeCamera, _allow3PPCamera, _showFocusInfo, _showCameraButtons, _showControlsHelper, _showHeader, _showLists];

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
