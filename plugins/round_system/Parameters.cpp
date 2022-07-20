#ifndef PLUGIN_PARAM_ROUND_SYSTEM_ROUNDS
#define PLUGIN_PARAM_ROUND_SYSTEM_ROUNDS 3
#endif
class p_round_params {
	title = "Amount of rounds needed to win";
	values[] = {1,   2,   3,   4,   5};
	texts[] = { "1", "2", "3", "4", "5"};
	default = PLUGIN_PARAM_ROUND_SYSTEM_ROUNDS;
};

#ifndef PLUGIN_PARAM_ROUND_SYSTEM_TIME
#define PLUGIN_PARAM_ROUND_SYSTEM_TIME 15
#endif
class p_round_time_limit {
	title = "Time limit per round";
	values[] = {1,          5,           15,           30,           60,       -1};
	texts[] = { "1 minute", "5 minutes", "15 minutes", "30 minutes", "1 hour", "No limit"};
	default = PLUGIN_PARAM_ROUND_SYSTEM_TIME;
};
