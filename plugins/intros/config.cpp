#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "Intro cutscenes";
		authors[] = { "Nife" };
		description = "Plays a pre-made intro cutscene to set the mood for the mission.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	intros = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\intros\functions";

			CFGFNC(postinit);
		};
	};
};
