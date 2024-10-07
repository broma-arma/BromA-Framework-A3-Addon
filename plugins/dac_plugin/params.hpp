#ifdef BRM_PARAMS_AI
	#ifndef DAC_PARAM_SKILL
	#define DAC_PARAM_SKILL 2
	#endif

	class p_ai_level {
		title = "DAC AI Skill";
		values[] = {        0,       1,        2,      3};
		texts[] = {"Very Easy", "Easy", "Normal", "Hard"};
		default = DAC_PARAM_SKILL;
	};
#endif
