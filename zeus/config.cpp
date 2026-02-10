#define QUOTE(VAR) #VAR
#define CONCAT(var1,var2) var1##var2
#define MODULE(VAR) QUOTE(CONCAT(BRM_FMK_Zeus_module,VAR))
class CfgPatches {
	class BRM_FMK_Zeus {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {MODULE(Cargo), MODULE(Loadout), MODULE(Respawn)};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Modules_F"};
	};
};

class CfgFunctions {
	class BRM_FMK_Zeus {
		class functions {
			file = "\broma_framework\zeus\functions";
			class postInit {postInit=1;};
			class message {recompile=1;};

			class moduleInit {recompile=1;};
			class rscDisplayAttributes { file = "\A3\Ui_F_Curator\UI\Displays\RscDisplayAttributes.sqf"; };
			class initCuratorAttribute {recompile=1;};

			class moduleCargo {recompile=1;};

			class moduleLoadout {recompile=1;};

			class moduleRespawn {recompile=1;};
		};
	};
};

#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"
