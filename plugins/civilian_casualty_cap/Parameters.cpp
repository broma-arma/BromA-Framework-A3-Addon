#ifndef PLUGIN_PARAM_CIVILIAN_CASUALTIES_CAP_LIMIT
#define PLUGIN_PARAM_CIVILIAN_CASUALTIES_CAP_LIMIT -1
#endif
class p_dead_civies {
	title = "Tolerance with civilian deaths";
	values[] = {-1,         5,     15,       30};
	texts[] = { "Disabled", "Low", "Medium", "High"};
	default = PLUGIN_PARAM_CIVILIAN_CASUALTIES_CAP_LIMIT;
};
