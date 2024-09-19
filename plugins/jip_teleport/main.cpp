#ifdef BRM_PLUGIN_META
	class jip_teleport {
		name = "JIP teleport";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Teleports JIPs to their nearest living team-member.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_JIPTeleport {
	class functions {
		file = "\broma_framework\plugins\jip_teleport\functions";
		class postInit {};
	};
};
#endif
