#define SKILL 3

#if __has_include("mission\settings\plugins\dac_plugin.sqf")
#include "mission\settings\plugins\dac_plugin.sqf"
#endif

class p_ai_level {
	title = "DAC AI Skill";
	values[] = {0,          1,     2,        3};
	texts[] = { "Very Low", "Low", "Medium", "High"};
	default = SKILL;
};

#undef SKILL
