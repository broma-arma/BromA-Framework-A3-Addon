if (isNil "BRM_FMK_missionVersion") exitWith {};

_this call BRM_FMK_Engine_fnc_engine_post;
_this call BRM_FMK_Engine_fnc_logPlugins;
_this call BRM_FMK_Engine_fnc_defineGroups;
_this call BRM_FMK_Engine_fnc_createPlayerVehicles;
_this call BRM_FMK_Engine_fnc_readExtraction;
_this call BRM_FMK_Engine_fnc_initPlayer;
_this call BRM_FMK_Engine_fnc_loadBriefing;

// Plugins postInit
{
	private _configName = configName _x;
	private _cfgPlugin = configFile >> "BRM_FMK" >> "Plugins" >> _configName;
	if (isClass _cfgPlugin) then {
		private _fnc = missionNamespace getVariable format ["%1_fnc_postInit", [_cfgPlugin, "tag", format ["BRM_FMK_Plugin_%1", _configName]] call BIS_fnc_returnConfigEntry];
		if (!isNil "_fnc") then {
			_this call _fnc;
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgPlugins"));

_this call BRM_FMK_Engine_fnc_endLoading;
