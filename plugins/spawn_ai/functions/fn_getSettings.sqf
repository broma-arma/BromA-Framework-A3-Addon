#include "script_component.hpp"
[
	"spawn_ai",
	[true, [true], "AI_spawn_enable_caching"], // cache
	[1500, [0], "AI_spawn_cache_distance"], // distance
	[{}, [{}]] // code
] call FUNCMAIN(getPluginSettings)
