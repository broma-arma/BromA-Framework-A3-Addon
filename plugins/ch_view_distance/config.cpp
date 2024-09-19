class BRM_FMK {
	class Plugins {
		class ch_view_distance {
			name = "View Distance Settings";
			version = "1.13";
			authors[] = {"Champ"};
			description = "Allows for the player to change their view/object draw distance. Default key is Ctrl + \.";
		};
	};
};

class CfgFunctions {
	class BRM_FMK_Plugin_CHVD {
		class functions	{
			file = "\broma_framework\plugins\ch_view_distance\functions";
			class postInit {};
			class selfInit {postInit = 1;};
			class onSliderChange {};
			class onLBSelChanged {};
			class onLBSelChanged_syncmode {};
			class onEBinput {};
			class onEBterrainInput {};
			class onEBinput_syncmode {};
			class selTerrainQuality {};
			class updateTerrain {};
			class updateSettings {};
			class updateVehType {};
			class fovViewDistance {};
			class UAVstatus {};
			class openDialog {};
			class localize {};
			class trueZoom {};
			class keyBindings {};
			class keyDown {};
			class keyDownTerrain {};
		};
	};
};

#include "dialogs\dialog.hpp"

class CfgPatches {
	class BRM_FMK_CHVD {
		addonRootClass = "BRM_FRAMEWORK";
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = { "BRM_FRAMEWORK" };
	};
};
