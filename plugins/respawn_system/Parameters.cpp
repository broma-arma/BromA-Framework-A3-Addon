#ifndef PLUGIN_PARAM_RESPAWN_SYSTEM_INSTANT
#define PLUGIN_PARAM_RESPAWN_SYSTEM_INSTANT 0
#endif
class p_allow_respawn {
	title = "Allow immediate respawning";
	values[] = {0,          1};
	texts[] = { "Disabled", "Enabled"};
	default = PLUGIN_PARAM_RESPAWN_SYSTEM_INSTANT;
};

#ifndef PLUGIN_PARAM_RESPAWN_SYSTEM_LIVES
#define PLUGIN_PARAM_RESPAWN_SYSTEM_LIVES -1
#endif
class p_player_lives {
	title = "Player immediate respawn lives";
	values[] = {1,   3,   5,   10,   -1};
	texts[] = { "1", "3", "5", "10", "Infinite"};
	default = PLUGIN_PARAM_RESPAWN_SYSTEM_LIVES;
};

#ifndef PLUGIN_PARAM_RESPAWN_SYSTEM_OBJECTIVE
#define PLUGIN_PARAM_RESPAWN_SYSTEM_OBJECTIVE -1
#endif
class p_respawn_objective {
	title = "Number of players respawned per completed objective";
	values[] = {0,   3,   5,   10,   -1};
	texts[] = { "0", "3", "5", "10", "Everyone"};
	default = PLUGIN_PARAM_RESPAWN_SYSTEM_OBJECTIVE;
};

//PARAM_SEPERATOR(respawn_system);
