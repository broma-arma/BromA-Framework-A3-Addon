#define QUOTE(var1) #var1
#define CONCAT(var1,var2) var1##var2
#define MODULE(VAR,NAME) class BRM_FMK_Zeus_module##VAR: BRM_FMK_Zeus_moduleBase {\
	displayName = QUOTE(NAME);\
	function = QUOTE(CONCAT(BRM_FMK_Zeus_fnc_module,VAR));\
}
#define MODULE_UI(VAR,NAME) class BRM_FMK_Zeus_module##VAR: BRM_FMK_Zeus_moduleBase {\
	displayName = QUOTE(NAME);\
	function = QUOTE(CONCAT(BRM_FMK_Zeus_fnc_module,VAR));\
	gui = QUOTE(CONCAT(BRM_FMK_Zeus_Module,VAR));\
}

class CfgVehicles {
	class Module_F;
	class BRM_FMK_Zeus_moduleBase: Module_F {
		author = "BromA";
		category = "BRM_FMK_Zeus";
		scope = 1;
		scopeCurator = 2;
		curatorCanAttach = 1;
		isVolatile = 1;
		class EventHandlers {
			init = "call BRM_FMK_Zeus_fnc_moduleInit;";
		};
	};

	MODULE_UI(Cargo,Assign Cargo);
	MODULE_UI(Loadout,Assign Loadout);

	MODULE(Respawn,Respawn Player);
};
