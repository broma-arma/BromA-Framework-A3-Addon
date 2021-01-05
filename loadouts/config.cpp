#include "component.hpp"

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
	class PREFIX {
		class loadouts {
			file = "\broma_framework\loadouts\functions";

			CFGFNC(addAmmo);
			CFGFNC(addAmmoAuto);
			CFGFNC(getAmmoClass);
			CFGFNC(addEmptyBackpack);
			CFGFNC(setVehiclesArray);
			CFGFNC(addItem);
			CFGFNC(addItems);
			CFGFNC(addMedicBasics);
			CFGFNC(addOptics);
			CFGFNC(addRadio);
			CFGFNC(addRadioToCargo);
			CFGFNC(addToBackpack);
			CFGFNC(addToCargo);
			CFGFNC(addToUniform);
			CFGFNC(addToVest);
			CFGFNC(addWeapon);
			CFGFNC(addWeaponKit);
			CFGFNC(attachToWeapon);
			CFGFNC(linkItem);
			CFGFNC(stripUnit);
			CFGFNC(useUniform);
			CFGFNC(setUnitIdentity);
			CFGFNC(getSideUAV);
			CFGFNC(addWeaponAttachments);
			CFGFNC(getFaction);
		};
	};
};
