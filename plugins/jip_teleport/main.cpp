#ifdef BRM_PLUGIN_META
	class jip_teleport {
		name = "JIP teleport";
		version = 1;
		authors[] = {"columdrum", "Nife"};
		description = "Teleports JIPs to their nearest living team-member.";
		postInit[] = {"BRM_FMK_JIPTeleport_fnc_postInit"};
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
	#include "Functions.cpp"
#endif
