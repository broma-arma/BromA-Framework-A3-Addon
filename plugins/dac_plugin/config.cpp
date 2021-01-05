#include "component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		name = "DAC Plugin";
		authors[] = { "Nife" };
		description = "Adds easier and simpler ways to configure and create DAC zones, with focus on verbosity and lack of long strings of numbers - also compatible with Headless Client.";

		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgBRMPlugins {
	dac_plugin = QUOTE(ADDON);
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\dac_plugin\functions";

			CFGFNC(preinit);
			CFGFNC(postinit);
			CFGFNC(setParams);
		};

		class Functions {
			file = "\broma_framework\plugins\dac_plugin\functions";

			CFGFNC(new);
			CFGFNC(createDACCamp);
			CFGFNC(createDACZone);
			CFGFNC(getDACStat);
			CFGFNC(generateCampInfo);
			CFGFNC(DACZone);
			CFGFNC(createZone);
			CFGFNC(initVehicleCrew);
		};
	};
};
