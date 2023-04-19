#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		addonRootClass = QUOTE(MAIN_ADDON);
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = { QUOTE(MAIN_ADDON) };
		VERSION_CONFIG;
	};
};

class CfgFunctions {
	class ADDON {
		class init {
			file = "\broma_framework\plugins\dac_plugin\functions";
			CFGFNC(preinit);
			CFGFNC(postinit);
		};
		class Functions {
			file = "\broma_framework\plugins\dac_plugin\functions";
			CFGFNC(getSettings);
			CFGFNC(new);
			CFGFNC(createDACCamp);
			CFGFNC(createDACZone);
			CFGFNC(strToNum);
			CFGFNC(numToAny);
			CFGFNC(generateCampInfo);
			CFGFNC(DACZone);
			CFGFNC(createZone);
			CFGFNC(initVehicleCrew);
		};
	};

};

class BRM_FMK_Plugins {
	class dac_plugin {
		name = "DAC Plugin";
		version = 1;
		authors[] = {"Nife"};
		description = "Adds easier and simpler ways to configure and create DAC zones, with focus on verbosity and lack of long strings of numbers - also compatible with Headless Client.";
		preInit[] = {QFUNC(preInit)};
		postInit[] = {QFUNC(postInit)};
	};
};
