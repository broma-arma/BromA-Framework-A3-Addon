#include "script_component.hpp"
[
	"friendly_fire",
	[1, [0], "friendly_fire_timer_minutes", nil, { _this * 60 }], // delay
	[false, [false], "friendly_fire_count_AI"], // ai
	[false, [false], "friendly_fire_civilians"] // civilian
] call FUNCMAIN(getPluginSettings)
