#ifdef BRM_PARAMS_PLAYER
	#define ENABLE 2

	#if __has_include("settings\plugins\block_tp.sqf")
	#include "settings\plugins\block_tp.sqf"
	#endif

	class p_allow_tp_veh {
		title = "Third person enabled";
		values[] = {0,          1,         2};
		texts[] = { "Disabled", "Enabled", "Drivers/Commanders only"};
		default = ENABLE;
	};

	//PARAM_SEPERATOR(block_tp);

	#undef ENABLE
#endif
