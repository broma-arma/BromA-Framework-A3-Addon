/*
================================================================================

NAME:
    BRM_FMK_Engine_fnc_postInit

AUTHOR(s):
    Coryf88

DESCRIPTION:
    Addon framework post-init.

PARAMETERS:
    None.

USAGE:
    [] call BRM_FMK_Engine_fnc_postInit

RETURNS:
    Nothing.

================================================================================
*/

if (isNil "BRM_FMK_missionVersion") exitWith {};

_this call BRM_FMK_Engine_fnc_engine_post;
_this call BRM_FMK_Engine_fnc_logPlugins;
_this call BRM_FMK_Engine_fnc_defineGroups;
_this call BRM_FMK_Engine_fnc_createPlayerVehicles;
_this call BRM_FMK_Engine_fnc_readExtraction;

if (isServer) then {
	BRM_FMK_Engine_players = [[], [], []]; // Side A, Side B, Side C
	["BRM_FMK_Engine_initPlayerServer", {
		private _i = [side_a_side, side_b_side, side_c_side] find (_this call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Engine_players select _i pushBackUnique _this;
		};
	}] CBA_fnc_addEventHandler;
};

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

if (isServer) then {
	BRM_FMK_Engine_deaths = [0, 0, 0]; // Side A, Side B, Side C

	addMissionEventHandler ["EntityKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		private _i = [side_a_side, side_b_side, side_c_side] find (_unit call BIS_fnc_objectSide);
		if (_i != -1) then {
			BRM_FMK_Engine_deaths set [_i, BRM_FMK_Engine_deaths#_i + 1];
		};
	}];
};

_this call BRM_FMK_Engine_fnc_endLoading;
