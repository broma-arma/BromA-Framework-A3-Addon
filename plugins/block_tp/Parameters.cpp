#ifndef PLUGIN_PARAM_BLOCK_TP_ENABLE
#define PLUGIN_PARAM_BLOCK_TP_ENABLE 2
#endif
class p_allow_tp_veh {
	title = "Third person enabled";
	values[] = {0,          1,         2};
	texts[] = { "Disabled", "Enabled", "Drivers/Commanders only"};
	default = PLUGIN_PARAM_BLOCK_TP_ENABLE;
};

//PARAM_SEPERATOR(block_tp);
