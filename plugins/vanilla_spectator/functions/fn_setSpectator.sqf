/*
    Start or stop spectating.
*/

params [["_set", true, [true]]];

if (_set) then {
	private _initialized = ["Initialize", [player,
		vanillaspectator_whitelisted_sides,
		vanillaspectator_can_view_AI,
		vanillaspectator_free_camera_available,
		vanillaspectator_third_person_available,
		vanillaspectator_show_focus_available,
		vanillaspectator_show_buttons,
		vanillaspectator_show_controls,
		vanillaspectator_show_header,
		vanillaspectator_show_entities
	]] call BIS_fnc_EGSpectator;
	if (_initialized) then {
		[] call BRM_FMK_Plugin_VanillaSpectator_fnc_centerOnTarget;
	};
} else {
	["Terminate"] call BIS_fnc_EGSpectator;
};
