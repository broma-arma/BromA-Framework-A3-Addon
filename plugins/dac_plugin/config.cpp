class BRM_FMK {
	class Plugins {
		class dac_plugin {
			name = "DAC Plugin";
			version = 1;
			authors[] = {"Nife", "Coryf88"};
			description = "Adds easier and simpler ways to configure and create DAC zones, with focus on verbosity and lack of long strings of numbers - also compatible with Headless Client.";
			tag = "BRM_FMK_Plugin_DAC";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_DAC {
		class functions {
			file = "\broma_framework\plugins\dac_plugin\functions";
			class preInit {};
			class setParams {};
			class postInit {};
			class createDACCamp {};
			class createDACZone {};
			class strToNum {};
			class DACZone {};
			class createZone {};
		};
	};
	class BRM_FMK_DAC {
		class functions {
			file = "\broma_framework\plugins\dac_plugin\functions";
			class new {};
			class generateCampInfo {};
			class initVehicleCrew {};
		};
	};
};

class CfgPatches {
	class BRM_FMK_DAC {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
