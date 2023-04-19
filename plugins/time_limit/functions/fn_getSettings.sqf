#include "script_component.hpp"
[
	"time_limit",
	[[], [[]], "time_alerted_minutes", { _this apply { _x * 60 } }] // minuteAlerts
] call FUNCMAIN(getPluginSettings)
