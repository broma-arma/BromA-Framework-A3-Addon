#ifndef PLUGIN_PARAM_CASUALTIES_CAP_LIMIT
#define PLUGIN_PARAM_CASUALTIES_CAP_LIMIT -1
#endif
class p_cas_cap {
	title = "Casualty Cap";
	values[] = {-1,         80,    90,    95,    100};
	texts[] = { "Disabled", "80%", "90%", "95%", "100%"};
	default = PLUGIN_PARAM_CASUALTIES_CAP_LIMIT;
};
