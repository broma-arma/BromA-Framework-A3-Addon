#ifndef PLUGIN_PARAM_HEADLESS_CLIENT_ENABLE
#define PLUGIN_PARAM_HEADLESS_CLIENT_ENABLE 1
#endif
class p_enable_hc {
	title = "Enable Headless Client";
	values[] = {0,          1};
	texts[] = { "Disabled", "Enabled"};
	default = PLUGIN_PARAM_HEADLESS_CLIENT_ENABLE;
};
