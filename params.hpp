#define PARAMS
#define PARAM_CATEGORY(ID,TITLE) class bar##ID { title = #TITLE; values[] = {0}; texts[] = {""}; default = 0;}
#define PARAM_SEPERATOR(ID) PARAM_CATEGORY(ID,)

PARAM_CATEGORY(ai,=================== AI SETTINGS ==================);

#define BRM_PARAMS_AI
	#include "plugins\params.hpp"
#undef BRM_PARAMS_AI

PARAM_CATEGORY(conditions,=============== MISSION CONDITIONS ===============);

#define BRM_PARAMS_CONDITIONS
	#include "plugins\params.hpp"
#undef BRM_PARAMS_CONDITIONS

PARAM_CATEGORY(time,========== TIME AND MISSION CONSTRAINTS ==========);

#define BRM_PARAMS_TIME
	#include "plugins\params.hpp"
#undef BRM_PARAMS_TIME

PARAM_CATEGORY(player,================= PLAYER SETTINGS ================);

#define BRM_PARAMS_PLAYER
	#include "plugins\params.hpp"
#undef BRM_PARAMS_PLAYER

#undef PARAM_SEPERATOR
#undef PARAM_CATEGORY
#undef PARAMS
