#ifndef PLUGIN_PARAM_ACE_LIVES
#define PLUGIN_PARAM_ACE_LIVES -1
#endif
class p_ace3_revive_lives {
	title = "(ACE3) Revive system lives";
	values[] = {0,          1,   3,   5,   -1};
	texts[] = { "Disabled", "1", "3", "5", "Infinite"};
	default = PLUGIN_PARAM_ACE_LIVES;
};

#ifndef PLUGIN_PARAM_ACE_MEDICS
#define PLUGIN_PARAM_ACE_MEDICS 0
#endif
class p_ace3_everyone_medic {
	title = "(ACE3) Everyone as a medic";
	values[] = {0,          1};
	texts[] = { "Disabled", "Enabled"};
	default = PLUGIN_PARAM_ACE_MEDICS;
};

//PARAM_SEPERATOR(ace3);
