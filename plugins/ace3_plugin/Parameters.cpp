#define LIVES -1
#define MEDICS 0

#if __has_include("mission\settings\plugins\ace3_plugin.sqf")
#include "mission\settings\plugins\ace3_plugin.sqf"
#endif

class p_ace3_revive_lives {
	title = "(ACE3) Revive system lives";
	values[] = {0,          1,   3,   5,   -1};
	texts[] = { "Disabled", "1", "3", "5", "Infinite"};
	default = LIVES;
};

class p_ace3_everyone_medic {
	title = "(ACE3) Everyone as a medic";
	values[] = {0,          1};
	texts[] = { "Disabled", "Enabled"};
	default = MEDICS;
};

//PARAM_SEPERATOR(ace3);

#undef LIVES
#undef MEDICS
