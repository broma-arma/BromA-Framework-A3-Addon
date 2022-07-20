#define ENABLE 1

#if __has_include("mission\settings\plugins\headless_client.sqf")
#include "mission\settings\plugins\headless_client.sqf"
#endif

class p_enable_hc {
	title = "Enable Headless Client";
	values[] = {0,          1};
	texts[] = { "Disabled", "Enabled"};
	default = ENABLE;
};

#undef ENABLE
