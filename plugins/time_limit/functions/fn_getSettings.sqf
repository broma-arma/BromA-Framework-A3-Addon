[
	"time_limit",
	[[], [[]], "time_alerted_minutes", { _this apply { _x * 60 } }] // minuteAlerts
] call BRM_FMK_fnc_getPluginSettings
