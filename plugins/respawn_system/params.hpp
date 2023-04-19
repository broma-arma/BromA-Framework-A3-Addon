#ifdef BRM_PARAMS_PLAYER
	#define INSTANT 0
	#define LIVES -1
	#define OBJECTIVE -1

	#if __has_include("settings\plugins\respawn_system.sqf")
	#include "settings\plugins\respawn_system.sqf"
	#endif

	class p_allow_respawn {
		title = "Allow immediate respawning";
		values[] = {0,          1};
		texts[] = { "Disabled", "Enabled"};
		default = INSTANT;
	};

	class p_player_lives {
		title = "Player immediate respawn lives";
		values[] = {1,   3,   5,   10,   -1};
		texts[] = { "1", "3", "5", "10", "Infinite"};
		default = LIVES;
	};

	class p_respawn_objective {
		title = "Number of players respawned per completed objective";
		values[] = {0,   3,   5,   10,   -1};
		texts[] = { "0", "3", "5", "10", "Everyone"};
		default = OBJECTIVE;
	};

	//PARAM_SEPERATOR(respawn_system);

	#undef INSTANT
	#undef LIVES
	#undef OBJECTIVE
#endif
