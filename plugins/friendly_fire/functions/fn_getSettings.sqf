[
	"friendly_fire",
	[1, [0], "friendly_fire_timer_minutes", nil, { _this * 60 }], // delay
	[false, [false], "friendly_fire_count_AI"], // ai
	[false, [false], "friendly_fire_civilians"] // civilian
] call BRM_FMK_fnc_getPluginSettings
