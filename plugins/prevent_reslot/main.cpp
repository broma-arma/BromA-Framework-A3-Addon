#ifdef BRM_PLUGIN_META
	class prevent_reslot {
		name = "Prevent Reslotting";
		version = 1;
		authors[] = {"Nife", "Coryf88"};
		description = "As soon enough time has passed, the currently slotted player unit will be locked, blocking any attempts to change it.";
	};
#endif

#ifdef BRM_PLUGIN_FUNCTIONS
class BRM_FMK_PreventReslot {
	class functions {
		file = "\broma_framework\plugins\prevent_reslot\functions";
		class postInit {};
	};
};
#endif
