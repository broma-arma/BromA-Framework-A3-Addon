#ifndef PLUGIN_PARAM_SPAWN_PROTECTION_TIME
#define PLUGIN_PARAM_SPAWN_PROTECTION_TIME -1
#endif
class p_spawn_protection_time {
	title = "Spawn protection duration";
	values[] = {0,          1,          15,           30,           -1};
	texts[] = { "Disabled", "1 minute", "15 minutes", "30 minutes", "Infinite"};
	default = PLUGIN_PARAM_SPAWN_PROTECTION_TIME;
};
