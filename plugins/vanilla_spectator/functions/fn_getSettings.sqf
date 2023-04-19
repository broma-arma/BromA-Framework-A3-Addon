#include "script_component.hpp"
/*
    Returns the spectator settings.
*/

[
	"vanilla_spectator",
	[[], [[]], "vanillaspectator_whitelisted_sides"], // whitelistedSides
	[true, [true], "vanillaspectator_can_view_AI"], // allowAi
	[true, [true], "vanillaspectator_free_camera_available"], // allowFreeCamera
	[true, [true], "vanillaspectator_third_person_available"], // allow3PPCamera
	[true, [true], "vanillaspectator_show_focus_available"], // showFocusInfo
	[true, [true], "vanillaspectator_show_buttons"], // showCameraButtons
	[true, [true], "vanillaspectator_show_controls"], // showControlsHelper
	[true, [true], "vanillaspectator_show_header"], // showHeader
	[true, [true], "vanillaspectator_show_entities"] // showLists
] call FUNCMAIN(getPluginSettings)
