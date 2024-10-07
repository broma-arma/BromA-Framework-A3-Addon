#ifdef BRM_PARAMS_PLAYER
	#ifndef RESPAWNSYS_PARAM_INSTANT
	#define RESPAWNSYS_PARAM_INSTANT 0
	#endif
	#ifndef RESPAWNSYS_PARAM_LIVES
	#define RESPAWNSYS_PARAM_LIVES 3
	#endif
	#ifndef RESPAWNSYS_PARAM_OBJECTIVE
	#define RESPAWNSYS_PARAM_OBJECTIVE -1
	#endif

	class p_allow_respawn {
		title = "Instant respawn";
		values[] = {        0,         1};
		texts[] = {"Disabled", "Enabled"};
		default = RESPAWNSYS_PARAM_INSTANT;
	};

	class p_player_lives {
		title = "Instant respawn lives";
		values[] = { 1,   3,   5,   10};
		texts[] = {"1", "3", "5", "10"};
		default = RESPAWNSYS_PARAM_LIVES;
	};

	class p_respawn_objective {
		title = "Respawns per completed objective";
		values[] = { 0,   3,   5,   10,         -1};
		texts[] = {"0", "3", "5", "10", "Everyone"};
		default = RESPAWNSYS_PARAM_OBJECTIVE;
	};
#endif
