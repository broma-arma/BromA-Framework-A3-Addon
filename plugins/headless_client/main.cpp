#ifdef BRM_PLUGIN_META
	class headless_client {
		name = "Headless Client";
		version = 1;
		authors[] = {"Nife"};
		description = "Suite of functions made to facilitate the usage of the Headless Client and its environment variables.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_HC {
	class functions {
		file = "\broma_framework\plugins\headless_client\functions";
		class setParams {};
		class postInit {};
	};
};
#endif
