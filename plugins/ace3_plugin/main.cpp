#ifdef BRM_PLUGIN_META
	class ace3_plugin {
		name = "ACE3 Plugin";
		version = 1;
		authors[] = {"nigel", "Coryf88"};
		description = "Allows for the easy configuration of the ACE3 mod settings, including the Medical system and other modules.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_ACE3 {
	class functions {
		file = "\broma_framework\plugins\ace3_plugin\functions";
		class setParams {};
		class postinit {};
		class ACE_RevivePlayer {};
		class addACEHelp {};
	};
};
#endif
