#ifdef BRM_PARAMS_TIME
	#ifndef SPAWNPROTECT_PARAM_TIME
	#define SPAWNPROTECT_PARAM_TIME -1
	#endif

	class p_spawn_protection_time {
		title = "Spawn protection duration";
		values[] = {        0,          1,           15,           30,         -1};
		texts[] = {"Disabled", "1 minute", "15 minutes", "30 minutes", "Infinite"};
		default = SPAWNPROTECT_PARAM_TIME;
	};
#endif
