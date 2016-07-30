
#ifdef BRM_PLUGIN_META
	class mission_conditions
	{
		name = "Mission Conditions";
		version = 1;
		authors[] = {"Nife"};
		description = "Sets the mission conditions such as weather and time.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif