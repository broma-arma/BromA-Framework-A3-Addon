#include "script_component.hpp"
[
	"remove_body",
	[120, [0], "f_var_removeBodyDelay"], // delay
	[300, [0], "f_var_removeBodyDistance"], // distance
	[[], [[]], "f_var_doNotRemoveBodies"] // exclude
] call FUNCMAIN(getPluginSettings)
