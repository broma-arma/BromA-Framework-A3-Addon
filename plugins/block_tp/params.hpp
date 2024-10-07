#ifdef BRM_PARAMS_PLAYER
	#ifndef BLOCKTP_PARAM_ENABLE
	#define BLOCKTP_PARAM_ENABLE 2
	#endif

	class p_allow_tp_veh {
		title = "Third person";
		values[] = {        0,         1,                    2};
		texts[] = {"Disabled", "Enabled", "Drivers/Commanders"};
		default = BLOCKTP_PARAM_ENABLE;
	};
#endif
