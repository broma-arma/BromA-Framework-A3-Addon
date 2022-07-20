#ifndef PLUGIN_PARAM_TIME_LIMIT_LIMIT
#define PLUGIN_PARAM_TIME_LIMIT_LIMIT -1
#endif
class p_time_limit {
	title = "Time Limit";
	values[] = {-1,         10800,     7200,      3600,     2700,         1800,         900,          600,          60};
	texts[] = { "No limit", "3 hours", "2 hours", "1 hour", "45 minutes", "30 minutes", "15 minutes", "10 minutes", "1 minute"};
	default = PLUGIN_PARAM_TIME_LIMIT_LIMIT;
};

#ifndef PLUGIN_PARAM_TIME_LIMIT_OBJECTIVE
#define PLUGIN_PARAM_TIME_LIMIT_OBJECTIVE 0
#endif
class p_time_added {
	title = "Time added per objective";
	values[] = {0,          5,           15,           30,           60};
	texts[] = { "Disabled", "5 minutes", "15 minutes", "30 minutes", "1 hour"};
	default = PLUGIN_PARAM_TIME_LIMIT_OBJECTIVE;
};
