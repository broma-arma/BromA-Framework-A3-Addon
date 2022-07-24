#define TIME 0

#if __has_include("settings\plugins\setup_zone.sqf")
#include "settings\plugins\setup_zone.sqf"
#endif

class p_setup_time {
	title = "Setup Time";
	values[] = {0,            1,          2,           3,           4};
	texts[] = { "15 seconds", "1 minute", "3 minutes", "5 minutes", "10 minutes"};
	default = TIME;
};

#undef TIME
