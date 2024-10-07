#ifdef BRM_PARAMS_AI
	#ifndef HEADLESSCLIENT_PARAM_HC
	#define HEADLESSCLIENT_PARAM_HC 2
	#endif

	class p_enable_hc {
		title = "Headless Client";
		values[] = {        0,         1,      2};
		texts[] = {"Disabled", "Enabled", "Auto"};
		default = HEADLESSCLIENT_PARAM_HC;
	};
#endif
