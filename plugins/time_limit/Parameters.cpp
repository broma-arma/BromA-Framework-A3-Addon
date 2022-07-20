#define LIMIT -1
#define OBJECTIVE 0

#if __has_include("mission\settings\plugins\time_limit.sqf")
#include "mission\settings\plugins\time_limit.sqf"
#endif

class p_time_limit {
	title = "Time Limit";
	values[] = {-1,         10800,     7200,      3600,     2700,         1800,         900,          600,          60};
	texts[] = { "No limit", "3 hours", "2 hours", "1 hour", "45 minutes", "30 minutes", "15 minutes", "10 minutes", "1 minute"};
	default = LIMIT;
};

class p_time_added {
	title = "Time added per objective";
	values[] = {0,          5,           15,           30,           60};
	texts[] = { "Disabled", "5 minutes", "15 minutes", "30 minutes", "1 hour"};
	default = OBJECTIVE;
};

#undef LIMIT
#undef OBJECTIVE
