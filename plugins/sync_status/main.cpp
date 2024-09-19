#ifdef BRM_PLUGIN_META
	class sync_status {
		name = "Synchronize Status";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "Constantly sends your current position and over relevant data to the server, and synchronizes it every time you JIP back into the session.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_SyncStatus {
	class functions {
		file = "\broma_framework\plugins\sync_status\functions";
		class postInit {};
		class saveStatus {};
		class loadStatus {};
		class playerVars {};
	};
};
#endif
